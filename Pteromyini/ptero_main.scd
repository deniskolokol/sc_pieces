// The name is after Flying squirrels (scientifically known
// as Pteromyini or Petauristini).
(
// Harmony
~rootNote = "g3";
~bufScale = Buffer.loadCollection(s, Scale.locrian);

// Synths
~synths = (
    moogy_line: (
        synth: nil,
        params_default: [
            \out, 0,
            \bufnum, ~bufScale.bufnum,
            \cutoff, 2800,
            \gain, 2.4,
            \freq, ~rootNote.notemidi.midicps,
            \amp, 0.8,
            \tempo, 2
        ]
    ),
    moogy_chords: (
        synth: nil
        params_default: [
            \out, 0,
            \bufnum, ~bufScale.bufnum,
            \cutoff, 2800,
            \gain, 2.4,
            \freq, ~rootNote.notemidi.midicps,
            \amp, 0.7,
            \tempo, 2
        ]
    ),
    beat_pulse_1: (
        synth: nil,
        params_default: [
            \out, 0,
            \tempo, 2,
            \att, 0.1,
            \rel, 0.1
        ]
    )
);

Server.default = s = Server.local;
s.waitForBoot({
    var midiFunc = List.new;
    var synthOnOff = { |synthName|
        if (~synths[synthName].synth.isNil) {
            postf("starting %...", synthName);
            ~synths[synthName].synth = Synth(synthName, ~synths[synthName].params_default);
        } {
            postf("freeing %...", synthName);
            ~synths[synthName].synth.set(\gate, 0);
            ~synths[synthName].synth = nil;
        };
        postf(" done\n");
    };

    ~currentDir = PathName(thisProcess.nowExecutingPath).pathOnly;
    "Loading synth definitions... ".post;
    if (this.executeFile(~currentDir +/+ "ptero_synths.scd").isNil.not) {
        postf("OK\n\n")
    } {
        postf("\nWARNING: could not load SynthDef(s)!\n\n")
    };

    // MIDI
    if(MIDIClient.initialized.not) { MIDIClient.init };
    MIDIIn.connectAll;

    // NoteOn funcs
    midiFunc = midiFunc ++ [
        MIDIFunc.noteOn({ |val, num| synthOnOff.(\moogy_line)}, 70),
        MIDIFunc.noteOn({ |val, num| synthOnOff.(\beat_pulse_1)}, 58),
        MIDIFunc.noteOn({ |val, num|
            synthOnOff.(\moogy_line);
            synthOnOff.(\moogy_chords);
            synthOnOff.(\beat_pulse_1);
        }, 44),
        MIDIFunc.noteOn({ |val, num| [val, num].postln})
    ];

    // Control messages funcs
    midiFunc = midiFunc ++ [

        // ~synthMoog controls
        MIDIFunc.cc({ |val| ~synths[\moogy_line].synth.set(\cutoff, val.linlin(0, 127, 50, 4000).postln)}, 24),
        MIDIFunc.cc({ |val| ~synths[\moogy_line].synth.set(\gain, val.linlin(0, 127, 0, 4).postln)}, 25),
        MIDIFunc.cc({ |val| ~synths[\moogy_line].synth.set(\index, val.linlin(0, 127, 0.1, 2.0))}, 26),
        MIDIFunc.cc({ |val| ~synths[\moogy_line].synth.set(\amp, val.linlin(0, 127, 0, 1))}, 12),

        // ~synthBeat controls
        MIDIFunc.cc({ |val| ~synths[\beat_pulse_1].synth.set(\amp, val.linlin(0, 127, 0, 1))}, 11),

        // common controls
        MIDIFunc.cc({ |val, num|
            // Common tempo control
            ~synths.do { |synthUnit|
                synthUnit.synth.set(\tempo, [0.5, 2.5, \lin, 0.25, 2].asSpec.map(val.linlin(0, 127, 0.0, 1.0)))
            };
        }, 17),
        // MIDIFunc.cc({ |val, num| [val, num].postln}),
    ];

    CmdPeriod.doOnce({
        midiFunc.do(_.free);
        MIDIIn.disconnectAll;
    });
})
)