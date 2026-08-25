// A Tangerine Dream -esque sequence of notes sent to an external synthesizer
// via MIDI. 
// See the patch entitled "Tangerine Dream-like seq (think SORCERER)" for a
// complete setup of Neutron.

// Initialize the MIDI Client
MIDIClient.init;

// Look at the list of MIDI Destinations in the Post window.
// You'll see something like:
// MIDI Endpoint("Your MIDI Interface Name", "Port Name")
MIDIClient.destinations.do(_.postln);

// Create the MIDIOut object.
// Replace the strings below with the exact names from your MIDI destination list.
// For example: ~synthMIDIOut = MIDIOut.newByName("Scarlett 2i2 MIDI", "Scarlett 2i2 MIDI Port");
~synthMIDIOut = MIDIOut.newByName("Neutron", "Neutron");

// Optional: Set latency to match your server for better sync
~synthMIDIOut.latency = Server.default.latency;

// MIDI pattern to send note events to the Neutron.
(
~bpm = 90;
~tempo = TempoClock.new(~bpm/60).schedAbs(0, { ~tempo.beatsPerBar_(4) });

p = Pbind(
    // --- MIDI Specific Keys ---
    \type, \midi,          // This is a MIDI event
    \midiout, ~synthMIDIOut, // Send it to your Neutron
    \midicmd, \noteOn,     // The command is a note (default)
    \chan, 0,              // MIDI Channel (0 is channel 1 for Neutron)

    // --- Musical Content ---
    \midinote, Pseq(
        [
            48, 55, 50,
            48, 55, 50,
        ] ++ ([Pwrand([36, 44, 42], [0.7, 0.2, 0.1]), Prand([36, 44])] ! 5).flatten,
    inf),

    // --- Performance Parameters ---
    \dur, 0.25, // Duration between notes (quarter notes)
    \legato, 0.5, // Note length (0.5 = staccato, 1 = full duration)
    \amp, Pwhite(0.8, 1, inf) // Velocity (MIDI velocity mapped from amp)
).play(~tempo, quant: Quant(4))
)


// Stop the pattern
// Warning: do not press Cmd+. - this will stop the entire server and all MIDI
// communication, rendering the last note played indefinitely. Use the line
// below instead.
p.stop;


// Panic.
~synthMIDIOut.allNotesOff(0)
