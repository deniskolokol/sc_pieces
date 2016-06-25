(
b= { arg cycles, octave, voicetype;
	Pbind(
		\instrument, \p_bowedstring,
		\sc, Pfunc( ~tempoDisplay ),
		\octave, octave,
		\degree, Pseries(rrand(-5, 7), 1, 7).trace(prefix:"event:voice,"++voicetype++",midinote,"),
		\dur, Pseq(#[ 0.125, 0.125, 0.125, 0.125, 0.25, 0.25, 0.25 ], cycles).trace(prefix:"event:voice,"++voicetype++",dur,"),
		\legato, Pseq(#[ 0.5, 1, 1.2, 1.2, 1.2, 1, 0.8 ], cycles).trace(prefix:"event:voice,"++voicetype++",legato,")
		)
	};

t= { arg cycles, start, end, quant, voicetype; // interlude
	Pbind(
		\sc, Pfunc( ~tempoDisplay ),
		\midinote, Pfuncn({ \rest }, cycles).trace(prefix:"event:voice,"++voicetype++",midinote,"),
		\dur, Pfuncn({
			(end-start) * (~tempo.beatsPerBar/quant.asInteger); // how many beats rest lasts in total
			}, cycles).trace(prefix:"event:voice,"++voicetype++",dur,")
		)
	};

~tempoDisplay= {
	postf("\n\nbar:no,%,beats,%,quant,%,beat,%\n\n",
	~tempo.bar.asString, (~tempo.beatsPerBar*4).asString, '4', ~tempo.beatInBar.asString)
	};

~interludeI= Ptpar([
	0.0, t.value(1, 0, 1.0.ceil, 4, "tenor"),
	0.0, t.value(1, 0, 2.0.ceil, 4, "sopranoI"),
	0.0, b.value(4, 3, "bass"),
	1.0.ceil, b.value(3, 4, "tenor"),
	2.0.ceil, b.value(2, 5, "soprano")
	], 1);

~tempo= TempoClock.tempo_(35/60);
~tempo.schedAbs(~tempo.nextBar, {
	~tempo.beatsPerBar_(1.25); // time= 5/4
	~interludeI.play(~tempo); });
)
