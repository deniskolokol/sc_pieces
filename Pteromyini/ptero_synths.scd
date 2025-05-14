// Synth Defs

(
SynthDef(\moogy_line, {
    arg amp=0.2, freq=110, bufnum=0, cutoff=100, gain=2,
    atk=0.1, dec=0.1, rel=0.1, tempo=2,
    spread=0.6, center=(-0.2), out=0, fx=0, fxsend=(-25);

    var signal, env, freqOsc, degree;

    env = Env.adsr(atk, dec, 1, rel).ar(Done.freeSelf, \gate.kr(1));
    degree = Duty.ar(
        Dseq([
            Dseq([1/2, 1/4], 4),
            Dseq([1/4], 4)
        ] / tempo, inf),
        0,
        Dseq([0, Drand([2, 3, 4], 1), -1, Drand([-3, -4, -5], 1)], inf)
    );
    freqOsc = (DegreeToKey.ar(bufnum, degree) + freq.cpsmidi).midicps;
    freqOsc = freqOsc * { Rand(-0.1, 0.1).midiratio }.dup(4);
    signal = Saw.ar(freqOsc);
    signal = Splay.ar(signal, spread, center:center);
    signal = MoogFF.ar(signal, cutoff, gain, mul:amp);
    signal = signal * env;

    //direct out
    Out.ar(out, signal);

    // FX send
    Out.ar(fx, signal * fxsend.dbamp);
}).add;


SynthDef(\moogy_chords, {
    arg amp=0.2, freq=110, bufnum=0, cutoff=100, gain=2,
    atk=0.1, dec=0.1, rel=0.1, tempo=2,
    spread=0.6, center=(-0.2), out=0, fx=0, fxsend=(-25);

    var signal, env, noteOsc, freqOsc, trig, degree;

    env = Env.adsr(atk, dec, 1, rel).ar(Done.freeSelf, \gate.kr(1));
    trig = TDuty.ar(
        Dseq([3/4, 3/4, 1/2, 2], inf) / tempo,
        0,
        Dseq([1, 1, 1, 0], inf)
    );
    degree = Duty.ar(
        2,
        0,
        Dseq([0, 2, -1, -3], inf)
    );
    noteOsc = DegreeToKey.ar(bufnum, degree + [0, 3, 5, 7]) + freq.cpsmidi;
    freqOsc = noteOsc.midicps;
    freqOsc = freqOsc * { Rand(-0.1, 0.1).midiratio }.dup(4);
    signal = Saw.ar(freqOsc);
    signal = Splay.ar(signal, spread, center:center);

    // modulate cutoff freq with the envelope controlled by the trigger
    signal = MoogFF.ar(signal,
        Env(
            [100, 1500, 100],
            [0.05, 0.75],
            -4
        ).ar(gate: trig),
        gain,
        mul:amp
    );
    signal = signal * env;

    //direct out
    Out.ar(out, signal);

    // FX send
    Out.ar(fx, signal * fxsend.dbamp);
}).add;


SynthDef(\beat_pulse_1, {
    arg tempo=2, out=0, pan=0, amp=1, atk=0.1, dec=0.1, rel=0.1, ca=6, cr=(-3),
    fx=0, fxsend=(-25);

    var envPerc = Env.perc(0, 0.2, 1, -5);
    var trig = TDuty.kr(
        [1/2, 1, 1/4] / tempo,
        TDuty.kr(
            Dser([3/4, 3/4, 1/2] / tempo, inf)
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
    ) * EnvGen.kr(envPerc, trig[1]);
    var snare = BPF.ar(LFNoise0.ar(98**2,0.4), 98**2, 1, 0.04)
    * EnvGen.kr(envPerc, trig[1]);
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
    var env = Env.adsr(atk, dec, 1, rel).ar(Done.freeSelf, \gate.kr(1));
    signal = Limiter.ar(signal, amp) * env;
    signal = Pan2.ar(signal, pan);

    //direct out
    Out.ar(out, signal);

    // FX send
    Out.ar(fx, signal * fxsend.dbamp);
}).add;
)