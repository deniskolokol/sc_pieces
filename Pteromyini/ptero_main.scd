// The name is after Flying squirrels (scientifically known
// as Pteromyini or Petauristini).
(
// Harmony
~rootNote = "g3";
~bufScale = Buffer.loadCollection(s, Scale.ionian);

// Quantization parameters (4 beats per cycle)
~quant = 4;
~tempo = 2;

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
            \tempo, ~tempo
        ]
    ),
    moogy_chords: (
        synth: nil,
        params_default: [
            \out, 0,
            \bufnum, ~bufScale.bufnum,
            \cutoff, 2800,
            \gain, 2.4,
            \freq, ~rootNote.notemidi.midicps,
            \amp, 0.7,
            \tempo, ~tempo
        ]
    ),
    beat_pulse_1: (
        synth: nil,
        params_default: [
            \out, 0,
            \tempo, ~tempo,
            \att, 0.1,
            \rel, 0.1
        ]
    )
);

Server.default = s = Server.local;
s.waitForBoot({
    var midiFunc = List.new;
    var clock = TempoClock(~tempo);
    var synthOnOff = { |synthName|
        if (~synths[synthName][\synth].isNil) {
            postf("starting %...", synthName);
            clock.schedAbs(clock.nextTimeOnGrid(~quant), {
                ~synths[synthName][\synth] = Synth(synthName, ~synths[synthName][\params_default]);
                nil; // Return nil to prevent rescheduling
            });
        } {
            postf("freeing %...", synthName);
            ~synths[synthName][\synth].set(\gate, 0);
            ~synths[synthName][\synth] = nil;
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
        MIDIFunc.noteOn({ |val, num| synthOnOff.(\moogy_chords)}, 58),
        MIDIFunc.noteOn({ |val, num| synthOnOff.(\beat_pulse_1)}, 69),
        MIDIFunc.noteOn({ |val, num|
            synthOnOff.(\moogy_line);
            synthOnOff.(\moogy_chords);
            synthOnOff.(\beat_pulse_1);
        }, 44),
        // MIDIFunc.noteOn({ |val, num| [val, num].postln})
    ];

    // Control messages funcs
    midiFunc = midiFunc ++ [

        // \moogy_line controls
        MIDIFunc.cc({ |val| ~synths[\moogy_line][\synth].set(\cutoff, val.linlin(0, 127, 50, 4000))}, 24),
        MIDIFunc.cc({ |val| ~synths[\moogy_line][\synth].set(\gain, val.linlin(0, 127, 0, 4))}, 25),
        MIDIFunc.cc({ |val| ~synths[\moogy_line][\synth].set(\index, val.linlin(0, 127, 0.1, 2.0))}, 26),
        MIDIFunc.cc({ |val| ~synths[\moogy_line][\synth].set(\amp, val.linlin(0, 127, 0, 1))}, 12),

        // \moogy_chords controls
        MIDIFunc.cc({ |val| ~synths[\moogy_chords][\synth].set(\cutoff, val.linlin(0, 127, 50, 4000))}, 27),
        MIDIFunc.cc({ |val| ~synths[\moogy_chords][\synth].set(\gain, val.linlin(0, 127, 0, 4))}, 28),
        MIDIFunc.cc({ |val| ~synths[\moogy_chords][\synth].set(\index, val.linlin(0, 127, 0.1, 2.0))}, 29),
        MIDIFunc.cc({ |val| ~synths[\moogy_chords][\synth].set(\amp, val.linlin(0, 127, 0, 1))}, 11),

        // \beat_pulse_1 controls
        MIDIFunc.cc({ |val| ~synths[\beat_pulse_1][\synth].set(\amp, val.linlin(0, 127, 0, 1))}, 14),

        // common controls
        MIDIFunc.cc({ |val, num|
            // Common tempo control
            ~tempo = [0.5, 2.5, \lin, 0.25, 2].asSpec.map(val.linlin(0, 127, 0.0, 1.0));
            ~synths.do { |synthUnit|
                synthUnit[\synth].set(\tempo, ~tempo)
            };
        }, 17),
        // MIDIFunc.cc({ |val, num| [val, num].postln}),
    ];

    CmdPeriod.doOnce({
        "Clean up on exit...".post;
        midiFunc.do(_.free);
        MIDIIn.disconnectAll;
        " done".postln;
    });
})
)