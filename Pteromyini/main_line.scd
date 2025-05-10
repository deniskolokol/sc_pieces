// The name is after Flying squirrels (scientifically known
// as Pteromyini or Petauristini).
(
Server.default = s = Server.local;
s.waitForBoot({
    var midiFunc = List.new;
    var synthMoog, startSynthMoog;
    var synthBeat, startSynthBeat;
    var rootNote, bufScale;

    // Synth Defs
    SynthDef(\moogy_1, {
        arg amp=0.2, freq=110, bufnum=0, cutoff=100, gain=2,
        atk=0.01, dec=0.5, sus=0.5, rel=1,
        pan=0, out=0, fx=0, fxsend=(-25);

        var signal, env, freqOsc, trig, degree;

        env = Env.adsr(atk, dec, 1, rel).ar(Done.freeSelf, \gate.kr(1));
        degree = Duty.ar(
            Dseq([
                Dseq([1/4, 1/8], 4),
                Dseq([1/8], 4)
            ], inf),
            0,
            Dseq([0, Drand([2, 3, 4], 1), -1, -3], inf)
        );
        freqOsc = (DegreeToKey.ar(bufnum, degree) + freq.cpsmidi).midicps;
        freqOsc = freqOsc * { Rand(-0.1, 0.1).midiratio }.dup(4);
        signal = Saw.ar(freqOsc);
        signal = Splay.ar(signal);
        signal = MoogFF.ar(signal, cutoff, gain, mul:amp);
        signal = signal * env;
        signal = Pan2.ar(signal, pan);

        //direct out
        Out.ar(out, signal);

        // FX send
        Out.ar(fx, signal * fxsend.dbamp);
    }).add;

    SynthDef(\groove_drumline_1, {
        arg tempo=2, out=0, pan=0, amp=1, gate=1, att=0.1, rel=0.1, ca=6, cr= -3;
        var env = Env.perc(0, 0.2, 1, -5);
        var trig = TDuty.kr(
            [0.5, 1, 0.25] / tempo,
            TDuty.kr(
                Dser([0.75, 0.75, 0.5]/tempo, inf)
            )
        );
        var kick = Ringz.ar(T2A.ar([trig[0], trig[1]]), [45, 330], [0.5, 0.1], [0.9, 0.1]);
        var pulse = Ringz.ar(T2A.ar(trig[2]), 90, 0.2,2).clip*0.2;
        var hat = HPF.ar(
            LPF.ar(
                WhiteNoise.ar(Decay2.ar(LFNoise1.ar(8, 0.3, 0.5), 0.02, 0.1)),
                1678
            ),
            17774
        ) * EnvGen.kr(env, trig[1]);
        var snare = BPF.ar(LFNoise0.ar(98**2,0.4), 98**2, 1, 0.04)
        * EnvGen.kr(env, trig[1]);
        var signal = MidEQ.ar(
            kick
            +
            snare
            +
            hat
            +
            pulse,
            14000, 0.7, 8
        );
        signal = Limiter.ar(signal, amp) *
        EnvGen.kr(
            Env.adsr(att, 0.1, 1, rel, curve:[ca, cr]),
            gate: gate, doneAction: 2
        );
        Out.ar(out, Pan2.ar(signal, pan));
    }).add;


    // Harmony
    rootNote = "a3";
    bufScale = Buffer.loadCollection(s, Scale.dorian);


    // Functions
    startSynthMoog = {
        if (synthMoog.isNil) {
            "start \moogy_1".postln;
            synthMoog = Synth(
                \moogy_1,
                [
                    \out, 0,
                    \bufnum, bufScale.bufnum,
                    \cutoff, 1000,
                    \gain, 2,
                    \freq, rootNote.notemidi.midicps,
                    \amp, 0.8
                ]
            )
        } {
            "free \moogy_1".postln;
            synthMoog.set(\gate, 0);
            synthMoog = nil;
        };

        // Return the synth object
        synthMoog
    };

    startSynthBeat = {
        if (synthBeat.isNil) {
            "start \groove_drumline_1".postln;
            synthBeat = Synth(
                \groove_drumline_1,
                [\out, 0, \tempo, 2, \att, 0.1, \rel, 0.1]
            )
        } {
            "free \groove_drumline_1".postln;
            synthBeat.set(\gate, 0);
            synthBeat = nil;
        };

        // Return the synth object
        synthBeat
    };

    // MIDI
    MIDIClient.init;
    MIDIIn.connectAll;

    // NoteOn funcs
    midiFunc = midiFunc ++ [
        MIDIFunc.noteOn({ |val, num| startSynthMoog.()}, 70),
        MIDIFunc.noteOn({ |val, num| startSynthBeat.()}, 58),
        MIDIFunc.noteOn({ |val, num|
            startSynthMoog.();
            startSynthBeat.();
        }, 44),
        MIDIFunc.noteOn({ |val, num| [val, num].postln})
    ];

    // Control messages funcs
    midiFunc = midiFunc ++ [
        MIDIFunc.cc({ |val| synthMoog.set(\cutoff, val.linlin(0, 127, 50, 4000))}, 24),
        MIDIFunc.cc({ |val| synthMoog.set(\gain, val.linlin(0, 127, 0, 4))}, 25),
        MIDIFunc.cc({ |val| synthMoog.set(\index, val.linlin(0, 127, 0.1, 2.0))}, 26),
        MIDIFunc.cc({ |val| synthMoog.set(\amp, val.linlin(0, 127, 0, 1))}, 12),
        MIDIFunc.cc({ |val, num| [val, num].postln}),
    ];

    CmdPeriod.doOnce({
        midiFunc.do(_.free);
        MIDIIn.disconnectAll;
    });
})
)



b = Buffer.loadCollection(s, Scale.dorian);

(
a = ;
b = Synth(\groove_drumline_1, [\out, 0, \tempo, 2, \att, 0.1, \rel, 0.1])
)

c = Buffer.loadCollection(s, Scale.ionian);

a.set(\freq, "f3".notemidi.midicps, \bufnum, c.bufnum)

a.free;
b.set(\gate, 0, \rel, 0.1);
