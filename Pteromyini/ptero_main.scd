// The name is after Flying squirrels (scientifically known
// as Pteromyini or Petauristini).
(
Server.default = s = Server.local;
s.waitForBoot({
    var midiFunc = List.new;
    var startSynthMoog, startSynthBeat;
    var rootNote, bufScale;

    ~currentDir = PathName(thisProcess.nowExecutingPath).pathOnly;
    "Loading synth definitions... ".post;
    if (this.executeFile(~currentDir +/+ "ptero_synths.scd").isNil.not) {
        postf("OK\n\n")
    } {
        postf("\nWARNING: could not load SynthDef(s)!\n\n")
    };

    // Harmony
    rootNote = "a3";
    bufScale = Buffer.loadCollection(s, Scale.dorian);

    // Synths
    ~synthMoog = nil;
    ~synthBeat = nil;

    // Functions
    startSynthMoog = {
        if (~synthMoog.isNil) {
            "start \moogy_1".postln;
            ~synthMoog = Synth(
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
            ~synthMoog.set(\gate, 0);
            ~synthMoog = nil;
        };

        // Return the synth object
        ~synthMoog
    };

    startSynthBeat = {
        if (~synthBeat.isNil) {
            "start \groove_drumline_1".postln;
            ~synthBeat = Synth(
                \groove_drumline_1,
                [\out, 0, \tempo, 2, \att, 0.1, \rel, 0.1]
            )
        } {
            "free \groove_drumline_1".postln;
            ~synthBeat.set(\gate, 0);
            ~synthBeat = nil;
        };

        // Return the synth object
        ~synthBeat
    };

    // MIDI
    if(MIDIClient.initialized.not) { MIDIClient.init };
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

        // ~synthMoog controls
        MIDIFunc.cc({ |val| ~synthMoog.set(\cutoff, val.linlin(0, 127, 50, 4000))}, 24),
        MIDIFunc.cc({ |val| ~synthMoog.set(\gain, val.linlin(0, 127, 0, 4))}, 25),
        MIDIFunc.cc({ |val| ~synthMoog.set(\index, val.linlin(0, 127, 0.1, 2.0))}, 26),
        MIDIFunc.cc({ |val| ~synthMoog.set(\amp, val.linlin(0, 127, 0, 1))}, 12),

        // ~synthBeat controls
        MIDIFunc.cc({ |val| ~synthBeat.set(\amp, val.linlin(0, 127, 0, 1))}, 11),

        // common controls
        MIDIFunc.cc({ |val, num|
            // Overall tempo control
            var tempo = [0.5, 2.5, \lin, 0.25, 2].asSpec.map(val.linlin(0, 127, 0.0, 1.0));
            ~synthMoog.set(\tempo, tempo);
            ~synthBeat.set(\tempo, tempo);
        }, 17),
        MIDIFunc.cc({ |val, num| [val, num].postln}),
    ];

    CmdPeriod.doOnce({
        midiFunc.do(_.free);
        MIDIIn.disconnectAll;
    });
})
)