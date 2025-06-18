// Inspired by the novel "Memoirs Found in a Bathtub" ("Pamiętnik znaleziony
// w wannie") by Stanisław Lem).

// Quit the server before starting the whole thing.
s.quit;

(
// Server config.
Server.default = s = Server.local;

s.options.numInputBusChannels = 2; // Behringer U-Foria: 2; Focusrite Saffire: 4
s.options.numOutputBusChannels = 2; // Behringer U-Foria: 2; Focusrite Saffire: 10
s.options.blockSize = 512;
s.options.memSize = 2097152; // 2Gb
s.options.numBuffers = 2048;

s.newBusAllocators;
ServerBoot.removeAll;
ServerTree.removeAll;
ServerQuit.removeAll;


// Global variables.
~out = 0;
~path = PathName(thisProcess.nowExecutingPath).parentPath;


// Global functions.
~makeBuffers = {
    "> Loading buffers...".post;
    ~buffers = Dictionary.new;
    PathName(~path +/+ 'samples').entries.do {
        arg subfolder;
        ~buffers.add(
            subfolder.folderName.asSymbol -> Array.fill(
                subfolder.entries.size,
                { |i| Buffer.read(s, subfolder.entries[i].fullPath) };
            )
        )
    };
    postf("OK\n");
};


~makeBuses = {
    "> Creating buses...".post;
    ~bus = Dictionary.new;
    ~bus.add(\reverb -> Bus.audio(s, 2));
    postf("OK\n");
};

~makeNodes = {
    "> Initiating configuration of groups and synths...".post;
    s.bind({
        ~mainGrp = Group.new;
        ~reverbGrp = Group.after(~mainGrp);
        ~reverbSynth = Synth.new(
            \reverb, [
                \amp, 1,
                \predelay, 0.1,
                \revtime, 1.8,
                \lpf, 4500,
                \mix, 0.35,
                \in, ~bus[\reverb],
                \out, ~out
            ],
            ~reverbGrp
        )
    });
    postf("OK\n");
};

~makeEvents = {
    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    // WARNING: this is temporary! after making selection of the drum set,
    //          delete this and use ~makeBuffers
    ~bufRead = { |x|
        var baseDir = PathName.new(
            "~/Music/material/Drum samples/513TubeDrumHits_Wav_SP/Samples/"
        );
        Buffer.readChannel(s, (baseDir +/+ x).fullPath, channels:[0])
    };
    ~hat = { |n| ~bufRead.("Hats\ &\ Shakers" +/+ n)};
    ~kck = { |n| ~bufRead.("Kicks" +/+ n)};
    ~snr = { |n| ~bufRead.("Snares" +/+ n)};
    ~clp = { |n| ~bufRead.("Claps" +/+ n)};
    ~cym = { |n| ~bufRead.("Rides & Cymbals" +/+ n)};
    ~tom = { |n| ~bufRead.("Toms" +/+ n)};
    ~per = { |n| ~bufRead.("Percussion" +/+ n)};

    // Some defaults:
    // Hi Hat.
    ~hihat = ~hat.("1_C6_Hat_SP.wav");

    // Open hat.
    ~ohat = ~hat.("1_C3_Hat_SP.wav");

    // Snare.
    ~snare = ~snr.("2_F#4_Snare_SP.wav");

    // Kick.
    ~kick = ~kck.("1_F5_Kick_SP.wav");

    ~sli_hi_hat1 = ~hat.("2_E2_Hat_SP.wav");
    ~sli_hi_hat2 = ~hat.("1_F3_Hat_SP.wav");
    ~sli_hi_hat3 = ~hat.("1_G3_Hat_SP.wav");

    ~snare_brush_hard = ~snr.("1_G#2_Snare_SP.wav");
    ~snare_brush_echo = Buffer.readChannel(s, ~path +/+ "samples/snare_brush_echo.wav", channels:[0]);
    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


    "> Preparing patterns...".post;
    ~patts = Dictionary.new;
    ~patts.add(\open_hat -> Pbind(
        \instrument, \bufplay,
        \dur, Pseq(~dur ! 8, inf),
        \buf, Pfunc({ ~ohat }),
        \amp, Pseq([1, \, Pwhite(0.85, 1.0, 1), \, 1, \, Pwhite(0.85, 1.0, 1), \], inf), // first beat is an accent
        \pan, 0.3
    ));
    ~patts.add(\open_hat_support -> Pbind(
        \instrument, \bufplay,
        \dur, Pseq(~dur ! 8, inf),
        \buf, Pfunc({ ~hihat }),
        \amp, Pseq([Pwhite(0.85, 1.0, 1), \, \, \, Pwhite(0.85, 1.0, 1), \, \, \], inf),
        \pan, 0.3
    ));
    ~patts.add(\sliding_hat_support -> Pbind(
        \instrument, \bufplay,
        \dur, Pseq(~dur ! 8, inf),
        \buf, Pfunc({ [~sli_hi_hat1, ~sli_hi_hat2, ~sli_hi_hat3].choose }),
        \amp, Pseq([
            Pseq([\, \, \, \, \, \, \, Pxrand([0, Pwhite(0.2, 0.8, 1)], 1)], 1),
            Pseq([\, \, \, \, \, \, \, 1], 1),
        ], inf),
        \pan, 0.3
    ));
    ~patts.add(\kick -> Pbind(
        \instrument, \bufplay,
        \dur, Pseq(~dur ! 8, inf),
        \buf, Pfunc({ ~kick }),
        \amp, Pseq(#[1, \, \, \, 1, \, \, \], inf),
    ));
    ~patts.add(\snare -> Pbind(
        \instrument, \bufplay,
        \dur, Pseq(~dur ! 8, inf),
        \buf, Pseq([
            Pfuncn({ ~snare }, 24),
            Pfuncn({ ~snare_brush_hard }, 8),
        ], inf),
        \amp, Pseq([
            Pseq(    #[ \,   \,   1,   \,   \,   \,   1,  \  ], 3), // fig 1 - main line
            Pxrand([
                Pseq(#[  \,   \,   1,   \,   \,   \,   1, 0.5 ], 1), // fig 2 - syncope 1
                Pseq(#[  \,   1,   \,   1,   \,   \,   1, 0.5 ], 1), // fig 3 - syncope 2
                Pseq(#[  1, 0.2,   1, 0.2,   \,   \, 0.2,   1 ], 1), // fig 3 - syncope 4
                Pseries(0.5, 0.071, 8).trace, // fig 3 - syncope 4
            ], 1)
        ], inf),
        \pan, -0.3
    ));
    ~patts.add(\snare_sin -> Pbind(
        \instrument, \bufplay,
        \rate, Pwhite(0.88, 1.1, inf),
        \dur, Pseq(~dur ! 8, inf),
        \buf, Pfunc({ ~snare_brush_echo }),
        \amp, Pseq([
            // fig 1 - main line
            Pseq([\, \, \, \, \, \, \, 1], 1),
            Pseq([\, \, \, \, \, \, \, \], 1),
            Pseq([\, \, \, \, \, \, \, Pwhite(0.33, 0.88, 1)], 1),
            Pseq([Pwrand([0, Pwhite(0.33, 0.66, 1)], [0.4, 0.6], 1), \, \, \, \, 1, \, 1], 1),
        ], inf),
        \pan, -0.3
    ));

    // Tempo.
    ~tempo = TempoClock.new(90/60).schedAbs(0, { ~tempo.beatsPerBar_(4) });
    ~dur = 1/4;
    postf("OK\n");

    "> Loading event definitions...".post;
    ~evnts = List.new;
    ~evnts.add(Dictionary[
        \name -> \beat_hat,
        \patt -> Pdef(
            \beat_hat,
            Ptpar([
                0.0, ~patts[\open_hat],
                0.0, ~patts[\open_hat_support],
                0.0, ~patts[\sliding_hat_support],
            ])
        )
    ]);

    ~evnts.add(Dictionary[
        \name -> \beat_base,
        \patt -> Pdef(
            \beat_base,
            Ptpar([
                0.0, ~patts[\open_hat],
                0.0, ~patts[\open_hat_support],
                0.0, ~patts[\sliding_hat_support],
                0.0, ~patts[\kick],
                0.0, ~patts[\snare],
                0.0, ~patts[\snare_sin],
            ])
        )
    ]);
    postf("OK\n");
};

~makeGUI = {
    var buttons = List.new;
    var palette = QPalette.system;

    ~win = Window.new("<new song>", Rect(0, 540, 807, 863));
    ~win.view.decorator = FlowLayout(~win.view.bounds, 5@5, 5@5);
    palette.setColor(Color(35, 36, 47), \window);
    ~win.view.palette = palette;

    ~evnts.do { |ev|
        buttons.add(
            Button(~win, 140@40)
            .states_([
                [ev[\name].asString, Color.white, Color.gray],
                [ev[\name].asString, Color.white, Color.red]
            ])
            .action_({ |bt|
                if (bt.value == 1) {
                    buttons.do { |btn|
                        if (btn != bt) {btn.valueAction_(0)}
                    };
                    ev[\patt].play(~tempo, quant: Quant(4));
                } {
                    ev[\patt].stop;
                }
            })
        )
    };
    ~win.view.keyDownAction = { |view, char, modifiers, unicode, keycode|
        [view, char, modifiers, unicode, keycode].postln;
        case
        { keycode == 98 } { // [b]
            if (modifiers == 524288) { // Alt + b
                ~win.bounds.postln;
            }
        }
    };
    ~win.front;
};

~cleanup = {
    "[i] Cleaning up".postln;

    ~win.close;

    "> Resetting bus counter...".post;
    s.newBusAllocators;
    postf("OK\n");

    "> Freeing MIDI...".post;
    MIDIdef.freeAll;
    postf("OK\n");

    "> Removing all functions...".post;
    ServerBoot.removeAll;
    ServerTree.removeAll;
    ServerQuit.removeAll;
    postf("OK\n");
};


// Register functions with ServerBoot/-Quit/-Tree (which control
// presicely when these functions get evaluated).
ServerBoot.add(~makeBuffers);
ServerBoot.add(~makeBuses);
ServerQuit.add(~cleanup);


CmdPeriod.doOnce({
    "[!] Caught signal: <shut down>".postln;
    ~cleanup.();
    postf("OK\n\n");
});

// Boot server
s.waitForBoot({
    // wait until all asynchronous tasks are finished
    s.sync;

    // TODO: Load here synths from another file!
    "> Loading synth definitions...".post;
    if (this.executeFile(~path +/+ "misja_synths.scd").isNil.not) {
        postf("OK\n\n")
    };

    // yes, again!
    s.sync;

    // Register remaining functions
    ServerTree.add(~makeNodes);
    ServerTree.add(~makeEvents);
    ServerTree.add(~makeGUI);

    // Re-initialize the Node Tree and cause ServerTree to re-evaluate those functions above:
    // - defines our event dictionary;
    // - enables MIDI functionality;
    // - creates out initial NodeTree with two grups and one synth.
    s.freeAll;

    // s.meter;
    // s.plotTree;

    // ...and again!
    s.sync;

    // This should be controlled by GUI or MIDI
    // ~evnts[\beat_base].value;
})
)
