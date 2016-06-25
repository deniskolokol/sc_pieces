

// WARNING:
// - amp should be based on \ly, \lz, not on \lrho !
// - create a structure for scores (Dictionary or sthn alike), don't rely on .trace
// - think how Lorenz affects models - Pdefn(Prout()) or simply Prout():
//		the former brings 1 stream of values to all patterns (~ all the streams are affected by the same "gust of wind")
//		the latter creates separate Routine for each (~ every stream is a separate model of "wind")


// setup for the piece

// notes:
// - AGP168 Witold Lutoslawski - Preludes and Fugue (1972): Preludes !!! interesting structure and counterpoint, very much like "nature"
// - Andrzej Panufnik - Arbor Cosmica http://www.youtube.com/watch?v=uqED9Dqbsic 0'-2': sustained violin + "brush strokes" of the rest of the orchestra; ~5'20'' - interesting rhythmic structure

(
// main group: Soprano, (Mezzo) Soprano, Tenor, Baritone, Bass
// additional: Mezzo Soprano (supports Soprano and Tenor), Contralto or eventually Baritone (supports Baritone and Bass)
// goups of patterns divided by dur and density
var s2i;
var p1a, p1b, p1c, p1e, p1n, p1m, p1s; // long, dense
var p2a, p2b, p2c, p2d, p2f; // short, dense
var p2i, p2j; // interlude, coda
var p3a, p3b, p3c; // short, sparce
var p3t; // tuplets
var pRest;
var pDur, pLorenz, pLorenz1, pScale;
var chrds= [ ["B2", "D4"], ["Eb2", "Bb4"], ["C#2", "F#4"], ["Bb2", "C#5"], ["D#2", "Eb4"], ["D#2", "C4"], ["F#2", "A#4"], ["G2", "Bb4"], ["G#2", "Bb4"], ["E2", "C5"], ["D2", "G3"] ];

~scl= [ // scales from "Oj u poli drevo"
	#[ 0, 1, 5, 7, 9 ],
	#[ 0, 1, 4, 7 ],
	#[ 0, 9, 12 ],
	#[ 0, 1, 5, 10 ],
	#[ 0, 4, 7, 12 ],
	#[ 0, 4, 11 ],
	#[ 0, 7, 12 ],
	#[ 0, 8, 12 ],
	// scales from "Oj Borovaja Zazulina"
	#[ 0, 3, 5, 7 ],
	#[ 0, 2, 3, 5 ],
	// scales from "Divko Galochko"
	#[ 0, 5, 7, 9 ],
	#[ 0, 3, 4, 5 ]
	];

// random scales
~sc1= rrand(0,~scl.size); ~sc2= rrand(0,~scl.size); ~sc3= rrand(0,~scl.size); ~sc4= rrand(0,~scl.size); ~sc5= rrand(0,~scl.size);

~tempo= TempoClock;

pScale= Pdefn( \scl,
	Prout({
		loop({
			//~scl.yield;
			(~scl.size-1).rand.yield
			})
		});
	);

pLorenz= Pdefn( [\x, \y, \z, \rho],
	Prout({
		var x, y, z, x0=2.0, y0=3.0, z0=5.0;
		var rho= 20, sigma= 10, beta= 2.667;
		var h= 0.01, i= 0, step= 1, stepNext, behavior= 2;
		var stepRhoBorders= [ [10,30], [12,96], [20,40], [35,80], [12, 96] ], currBorder= stepRhoBorders[0];
		#x, y, z= [-10, 10, 25];

		stepNext= [5, 10].choose;

		loop({
			//[i, step].postln;
			if( i >= (stepNext * step), {
				step= step + 1;
				currBorder= stepRhoBorders.choose;
				behavior= [0,1,2].choose; // models of behavior
				//("=== NEW STEP " + step + "===").postln;
				stepNext= [5, 10].choose;
				i= 0;
			});
			case
				{ behavior == 0 } { rho= exprand(rho, currBorder.choose) }
				{ behavior == 1 } { rho= exprand(currBorder[0], currBorder[1]) }
				{ behavior == 2 } { rho= rho+((i/(stepNext/2))**3) };

			rho= rho.clip(12,96);

			x= (x0 + ( h * ( sigma*(y0-x0) ) ) ).clip2(100);
			y= (y0 + ( h * ( x0*(rho-z0)-y0 ) ) ).clip2(100);
			z= (z0 + ( h * ( (x0*y0)-(beta*z0) )) ).clip(0, 100);

			i= i+1;
			x0=x; y0=y; z0=z;

			//[ x, y, z, rho ].postln;
			[ x, y, z, rho ].yield;
			});
		});
	);

pLorenz1= Pdefn( [\x, \y, \z],
	Plorenz.new( s=10, r=28, b=2.66666666667, h=0.01 ).asStream;
	);

p1a= { arg cycles, lo, hi, scalenum, voicetype;
	Pbind(
		\instrument, \p_bowedstring,
		\sc, Pfunc( ~tempoDisplay ),
		[ \lx, \ly, \lz, \lrho ], pLorenz,
		\amp, Pkey(\lz).linlin(0,100, 0.01, 1.3).trace(prefix:"event:voice,"++voicetype++",amp,"),
		\midinote, Pseq([
			Pn(
				PdegreeToKey( Pkey(\ly).linlin(-10,10, 0, hi).trunc, ~scl[scalenum]+lo, 12 ).clip(lo, lo+hi), 1
				),
			Pwrand([
				Pn(
					PdegreeToKey( Pkey(\ly).linlin(-10,10, 0, hi).trunc, ~scl[scalenum]+lo, 12 ).clip(lo, lo+hi), 1
					),
				\rest
				], [ 0.8, 0.2 ], 5 )
			], cycles).trace(prefix:"event:voice,"++voicetype++",midinote,"),
		\dur, Pseq([
			Pxrand([
				Pseq([1/4, 1/8], 1),
				Pseq([1/8, 1/4, 1/8, Pxrand([1, 4], 1) * 0.5, 1/16], 1)
			], 1),
			Pwrand([ Pxrand([1, 3/2], 1), Pxrand([0.5, 2], 1) * 0.25 ], [ 0.8, 0.2 ], 5 )
			], cycles).trace(prefix:"event:voice,"++voicetype++",dur,"),
		\legato, Pwrand([0.5, 0.8, 1, 1.2], [1,3,8,2].normalizeSum, cycles).trace(prefix:"event:voice,"++voicetype++",legato,")
	)
};

p1b= { arg cycles, lo, hi, scalenum, voicetype;
	Pbind(
		\instrument, \p_bowedstring,
		[ \lx, \ly, \lz, \lrho ], pLorenz,
		\sc, Pfunc( ~tempoDisplay ),
		\amp, Pkey(\lrho).linlin(12,96, 0.1, 1).linlin(12,96, 0.1, 1).trace(prefix:"event:voice,"++voicetype++",amp,"),
		\midinote, Pseq([
			Pn(
				PdegreeToKey( Pkey(\ly).linlin(-10,10, 0, hi).trunc, ~scl[scalenum]+lo, 12 ).clip(lo, lo+hi), 1
				),
			Pwrand([
				Pn(
					PdegreeToKey( Pkey(\ly).linlin(-10,10, 0, hi).trunc, ~scl[scalenum]+lo, 12 ).clip(lo, lo+hi), 1
					),
				\rest
				], [ 0.8, 0.2 ], 5 )
			], cycles).trace(prefix:"event:voice,"++voicetype++",midinote,"),
		\dur, Pseq([
			Pxrand([
				Pseq([1/8, 1/8, 1/8, Pxrand([1/2, 3/2], 1), 1/8], 1),
				Pseq([1/4, 1/16, 1/16, 1/8, 1/4, 1/16, 1/16, 1/8, Prand([1/2, 3/2], 1), 1/16], 1)
			], 1),
			Pwrand([ Pxrand([1, 2], 1), Pxrand([0.5, 4], 1) * 0.125 ], [ 0.8, 0.2 ], 5 )
			], cycles).trace(prefix:"event:voice,"++voicetype++",dur,"),
		\legato, Pseq([0.5,1,1.2,1.2,1.2,1,0.8], cycles).trace(prefix:"event:voice,"++voicetype++",legato,")
		)
	};

p1c= { arg cycles, lo, hi, scalenum, voicetype; // 19 cycles (9 notes in each bar + rest)
	Pbind(
		\instrument, \p_bowedstring,
		[ \lx, \ly, \lz, \lrho ], pLorenz,
		\sc, Pfunc( ~tempoDisplay ),
		\amp, Pkey(\lz).linlin(0,100, 0.01, 1.3).trace(prefix:"event:voice,"++voicetype++",amp,"),
		\midinote, Pseq([
			Pn(
				PdegreeToKey( Pkey(\ly).linlin(-10,10, 0, hi).trunc, ~scl[scalenum]+lo, 12 ).clip(lo, lo+hi), 1
				),
			\rest
			], 1).trace(prefix:"event:voice,"++voicetype++",midinote,"),
		\dur, Pxrand([
			Pseq([1/4, 1/16, 1/8, 1/8, 1/4, 1/16, 1/8, 1/8, Prand([1/2, 3/4], 1), 1/8], 1),
			Pseq([1/8, 1/8, 3/4, 1/16, 1/8, 1/8, 1/16, 1/16, 1/8, 1/8], 1) // to match the number: last 1/4= 1/16+1/16+1/8 legato
			], cycles).trace(prefix:"event:voice,"++voicetype++",dur,"),
		\legato, Pxrand([
			Pseq([0.7, 1.2, 1, 0.7, 1, 1.3, 1, 1, 1, 0.1], 1),
			Pseq([0.7, 0.7, 1.3, 0.5, 1.3, 1.3, 0.7, 1, 1, 0.1], 1)
			], cycles).trace(prefix:"event:voice,"++voicetype++",legato,")
		)
	};

p1e= { arg cycles, lo, hi, scalenum, voicetype; //
	Pbind(
		\instrument, \p_bowedstring,
		\sc, Pfunc( ~tempoDisplay ),
		[ \lx, \ly, \lz, \lrho ], pLorenz,
		\amp, Pkey(\lz).linlin(0,100, 0.01, 1).trace(prefix:"event:voice,"++voicetype++",amp,"),
		\midinote, Pwrand([
			Pn( // using .abs here for the purpose of diversifying the solo
				PdegreeToKey( Pkey(\ly).abs.linlin(0,100, 0, hi).trunc, ~scl[scalenum]+lo, 12 ).clip(lo, lo+hi), 1
				),
			\rest
			], [0.9, 0.1], inf).trace(prefix:"event:voice,"++voicetype++",midinote,"),
		\dur, Pseq([
				Pseq([Pshuf([1/8, 3/16, 1/16], 4), Pshuf([1/8, 1/16, 1/16], 4), 1/8], 3),
				Pshuf([1/4, 1/2], 4),
				Pshuf([1/16, 1/8, Pxrand([1/2, 1])], 3),
				], cycles).trace(prefix:"event:voice,"++voicetype++",dur,"),
		\legato, Pseq([Pwrand([0.5, 0.8, 1, 1.2, 1.5], [1,2,5,6,3].normalizeSum, inf), 0.7], cycles).trace(prefix:"event:voice,"++voicetype++",legato,")
		)
	};

p1s= { arg cycles, lo, hi, scalenum, voicetype;
	Pbind(
		\instrument, \p_bowedstring,
		[ \lx, \ly, \lz, \lrho ], pLorenz,
		\sc, Pfunc( ~tempoDisplay ),
		\amp, Pkey(\lz).linlin(0,100, 0.01, 1.3).trace(prefix:"event:voice,"++voicetype++",amp,"),
		\midinote, Pseq([
			Pn(
				PdegreeToKey( Pkey(\ly).linlin(-10,10, 0, hi).trunc, ~scl[scalenum]+lo, 12 ).clip(lo, lo+hi), 1
				),
			Pwrand([
				Pn(
					PdegreeToKey( Pkey(\ly).linlin(-10,10, 0, hi).trunc, ~scl[scalenum]+lo, 12 ).clip(lo, lo+hi), 1
					),
				\rest
				], [ 0.8, 0.2 ], 1 )
			], cycles).trace(prefix:"event:voice,"++voicetype++",midinote,"),
		\dur, Pseq([ [2, 2.5, 3].choose, 1/4], cycles).trace(prefix:"event:voice,"++voicetype++",dur,"),
		\legato, Pseq([ [1.1, 1.5].choose, 1], cycles).trace(prefix:"event:voice,"++voicetype++",legato,")
	)
};

p1n= { arg cycles, basedur, lo, hi, scalenum, voicetype;
	Pbind(
		\instrument, \p_bowedstring,
		[ \lx, \ly, \lz, \lrho ], pLorenz,
		\sc, Pfunc( ~tempoDisplay ),
		\amp, Pkey(\lz).linlin(0,50, 0, 1.3).trace(prefix:"event:voice,"++voicetype++",amp,"),
		\midinote, Pn(
			Pn(
				PdegreeToKey(
					Pkey(\ly).linlin(3,6, 0, hi).trunc, ~scl[scalenum]+lo, 12
					).clip(lo, lo+hi), 2
				), cycles
			).trace(prefix:"event:voice,"++voicetype++",midinote,"),
		\dur, Pseq([basedur, Pxrand([1/8, 3/16, 1/16], 1)], cycles).trace(prefix:"event:voice,"++voicetype++",dur,"),
		\legato, Pseq( [ 1.2, Pwhite(0.6, 1, 1) ], cycles).trace(prefix:"event:voice,"++voicetype++",legato,")
	)
};

p1m= { arg cycles, basedur, lo, hi, scalenum, voicetype;
	Pbind(
		\instrument, \p_bowedstring,
		[ \lx, \ly, \lz, \lrho ], pLorenz,
		\sc, Pfunc( ~tempoDisplay ),
		\amp, Pkey(\lz).linlin(0,50, 0.01, 1.3).trace(prefix:"event:voice,"++voicetype++",amp,"),
		\midinote, Pn(
			PdegreeToKey(
				Pkey(\ly).linlin(-10,10, 0, hi).trunc, ~scl[scalenum]+lo, 12
				).clip(lo, lo+hi), cycles
			).trace(prefix:"event:voice,"++voicetype++",midinote,"),
		\dur, Pn(basedur, cycles).trace(prefix:"event:voice,"++voicetype++",dur,"),
		\legato, Pn( 1.2, cycles).trace(prefix:"event:voice,"++voicetype++",legato,")
	)
};

p2a= { arg cycles, lo, hi, scalenum, voicetype;
	Pbind(
		\instrument, \p_bowedstring,
		[ \lx, \ly, \lz, \lrho ], pLorenz,
		\sc, Pfunc( ~tempoDisplay ),
		\amp, Pkey(\lrho).linlin(12,96, 0.1, 1).linlin(12,96, 0.1, 1).trace(prefix:"event:voice,"++voicetype++",amp,"),
		\midinote, Pwrand([
			Pn(
				PdegreeToKey( Pkey(\ly).linlin(-10,10, 0, hi).trunc, ~scl[scalenum]+lo, 12 ).clip(lo, lo+hi), 1
				),
			\rest
			], [ 0.95, 0.05 ], cycles).trace(prefix:"event:voice,"++voicetype++",midinote,"),
		\dur, Pseq([
			Pgeom(1/4, 1 + Pxrand( [1/16, 1/8], cycles), cycles),
			Pgeom(1/4, 1 - Pxrand( [1/16, 1/8], (cycles/2).trunc), (cycles/2).trunc)
		].clip(0.015625, 0.25), cycles).trace(prefix:"event:voice,"++voicetype++",dur,"),
		\legato, Pwrand([0.5, 0.8, 1, 1.2], [1,3,8,2].normalizeSum, cycles).trace(prefix:"event:voice,"++voicetype++",legato,")
		)
	};

p2f= { arg cycles, lo, hi, scalenum, voicetype;
	Pbind(
		\instrument, \p_bowedstring,
		\sc, Pfunc( ~tempoDisplay ),
		[ \lx, \ly, \lz ], pLorenz1,
		\amp, Pkey(\lx).linlin(0,1, 0.1, 0.6).trace(prefix:"event:voice,"++voicetype++",amp,"),
		\midinote, Pseq([
			PdegreeToKey( Pkey(\ly).linlin(0,1, 0, hi).trunc, ~scl[scalenum]+lo, 12 ).clip(lo, lo+hi),
			Pwrand([
				PdegreeToKey( Pkey(\ly).linlin(0,1, 0, hi).trunc, ~scl[scalenum]+lo, 12 ).clip(lo, lo+hi),
				\rest
				], [ 0.8, 0.2 ], 1
				)
			], cycles).trace(prefix:"event:voice,"++voicetype++",midinote,"),
		\dur, Pseq([
			Pn(1/16, 4),
			Pseq([1/8, Pn(Pxrand([3/8, 1/8], 1) * 0.5, 4), 1/16], 1)
			], cycles).trace(prefix:"event:voice,"++voicetype++",dur,"),
		\legato, Pwrand([0.5, 0.8, 1], [1,8,3].normalizeSum, cycles).trace(prefix:"event:voice,"++voicetype++",legato,")
	)
};

p2i= { arg cycles, lo, hi, scalenum, voicetype; // interlude I
	Pbind(
		\instrument, \p_bowedstring,
		\sc, Pfunc( ~tempoDisplay ),
		[ \lx, \ly, \lz ], pLorenz1,
		\amp, Pkey(\lx).linlin(0,1, 0.3, 1).trace(prefix:"event:voice,"++voicetype++",amp,"),
		\midinote, Pn(
			PdegreeToKey(Pkey(\ly).linlin(0,1, 0, hi).trunc, ~scl[scalenum]+lo, 12).clip(lo, lo+hi), cycles
			).trace(prefix:"event:voice,"++voicetype++",midinote,"),
		\dur, Pseq([1/8, 1/8, 1/8, 1/8, 1/4, 1/4, 1/4], cycles).trace(prefix:"event:voice,"++voicetype++",dur,"),
		\legato, Pseq([0.5, Pfuncn({ 1 }, 4), 1.2, 0.8], cycles).trace(prefix:"event:voice,"++voicetype++",legato,")
		)
	};

p2j= { arg cycles, lo, hi, scalenum, voicetype; // interlude II - coda
	Pbind(
		\instrument, \p_bowedstring,
		\sc, Pfunc( ~tempoDisplay ),
		[ \lx, \ly, \lz ], pLorenz1,
		\amp, Pkey(\lx).linlin(0,1, 0.3, 1).trace(prefix:"event:voice,"++voicetype++",amp,"),
		\midinote, Pn(
			PdegreeToKey(Pkey(\ly).linlin(0,1, 0, hi).trunc, ~scl[scalenum]+lo, 12).clip(lo, lo+hi), cycles
			).trace(prefix:"event:voice,"++voicetype++",midinote,"),
		\dur, Pseq([1/4, Pn(1/8, 4), Pn(1/4, 2), Pn(1/8, 3)], cycles).trace(prefix:"event:voice,"++voicetype++",dur,"),
		\legato, Pseq([0.8, Pn(1, 4), 1.2, 0.8, Pn(1, 3)], cycles).trace(prefix:"event:voice,"++voicetype++",legato,")
		)
	};

// tuplets:
// cycles - number of notes in a tuplet
// notedur - base dur of one note in a tuplet
// tupletdur - duration of a whole tuplet
p3t= { arg cycles, notedur, tupletdur, lo, hi, scalenum, voicetype; //
	Pbind(
		\instrument, \p_bowedstring,
		\sc, Pfunc( ~tempoDisplay ),
		[ \lx, \ly, \lz], pLorenz1,
		\amp, Pkey(\lx).linlin(0,1, 0.1, 0.3).trace(prefix:"event:voice,"++voicetype++",amp,"),
		\midinote, Pn(
			PdegreeToKey(Pkey(\ly).linlin(0,1, 0, hi).trunc, ~scl[scalenum]+lo, 12).clip(lo, lo+hi), cycles // WARNING! why +lo-hi?? should be +lo only
			).trace(prefix:"event:voice,"++voicetype++",midinote,"),
		\dur, Pfuncn( { (tupletdur / cycles).round(0.00001) }, cycles).trace(
			prefix:"event:voice,"++voicetype++
			",tupletdur,"++tupletdur.asString++",notedur,"++
			notedur.asString++",notes,"++cycles.asString++",dur,"
			),
		\legato, Pfuncn({ 0.5.rrand(1.5) }, cycles).trace(prefix:"event:voice,"++voicetype++",legato,")
		)
	};

pRest= { arg cycles, start, end, voicetype; // interlude
	Pbind(
		\sc, Pfunc( ~tempoDisplay ),
		\midinote, Pfuncn({ \rest }, cycles).trace(prefix:"event:voice,"++voicetype++",midinote,"),
		\dur, Pfuncn({ end-start }, cycles).trace(prefix:"event:voice,"++voicetype++",dur,")
		)
	};

~tempoDisplay= {
	postf("\nbar:no,%,beats,%,quant,%,beat,%,tempo,%\n",
		~tempo.bar.asString,
		(~tempo.beatsPerBar*~tempo.baseBarBeat).asString,
		~tempo.baseBarBeat,
		(~tempo.beatInBar.round(0.03125)).asString,
		~tempo.tempo
		)
	};

// full section I
~sectionI= Pseq([ // 1st sequence
	Ptpar([
		0.0.ceil, pRest.value(1, 0, 1.25, "baritone")
		], 1),
	Ptpar([
		0.0.ceil, p1a.value(10, 43, 12, 0, "baritone"),
		0.0.ceil, p1a.value(5, 72, 12, 0, "sopranoI"),
		5.0.ceil, p1a.value(5, 60, 12, 1, "tenor"),
		5.0.ceil, p1b.value(2, 60, 12, 1, "sopranoII"),
		10.0.ceil, p2a.value(8, 72, 12, 2, "sopranoI"),
		10.0.ceil, p1a.value(8, 36, 12, 3, "bass"),
		12.0.ceil, p1a.value(5, 60, 24, 3, "tenor")
		], 1),
	Ptpar([
		0.0.ceil, p1a.value(10, 36, 12, 0, "bass"),
		0.0.ceil, p1a.value(10, 43, 12, 0, "baritone"),
		0.0.ceil, p1a.value(5, 60, 12, 0, "sopranoI"),
		5.0.ceil, p1a.value(5, 60, 12, 1, "tenor"),
		5.0.ceil, p1b.value(2, 72, 12, 1, "sopranoII"),
		10.0.ceil, p2a.value(8, 72, 12, 2, "sopranoI"),
		10.0.ceil, p1a.value(8, 36, 12, 3, "bass"),
		12.0.ceil, p1a.value(5, 60, 24, 3, "tenor")
		], 1),
	Ptpar([
		0.0.ceil, p1a.value(4, 36, 12, 0, "bass"),
		0.0.ceil, p1a.value(4, 43, 12, 0, "baritone"),
		1.0.ceil, p1a.value(5, 60, 12, 0, "tenor"),
		1.0.ceil, p1b.value(2, 62, 12, 0, "sopranoI")
		], 1),
	Ptpar([
		0.0.ceil, p1a.value(5, 55, 12, 2, "tenor"),
		0.5.ceil, p1a.value(3, 43, 12, 2, "baritone"),
		0.5.ceil, p1b.value(1, 72, 12, 3, "sopranoII")
		], 1),
	Ptpar([
		0.0.ceil, p1s.value(1, 36, 12, 2, "bass"),
		0.0.ceil, p1s.value(1, 43, 12, 2, "baritone"),
		0.0.ceil, p1s.value(1, 60, 12, 2, "tenor"),
		0.0.ceil, p1s.value(1, 64, 12, 3, "sopranoII"),
		0.0.ceil, p1s.value(1, 72, 12, 3, "sopranoI"),
		], 1),
// 2nd sequence
	Ptpar([
		0.0.ceil, p1s.value(3, 36, 12, 2, "bass"),
		0.0.ceil, p1s.value(3, 52, 12, 2, "baritone"),
		2.0.ceil, p1c.value(4, 64, 12, 2, "tenor"),
		2.0.ceil, p1c.value(4, 72, 12, 3, "sopranoI"),
		2.5.ceil, p1s.value(2, 72, 12, 3, "sopranoII"),
		], 1),
	Ptpar([
		0.0.ceil, p1s.value(3, 64, 12, 2, "tenor"),
		0.0.ceil, p1s.value(3, 72, 12, 4, "sopranoI"),
		2.0.ceil, p1c.value(4, 36, 12, 1, "bass"),
		2.0.ceil, p1c.value(4, 52, 12, 1, "baritone"),
		2.5.ceil, p1s.value(2, 72, 12, 4, "sopranoII"),
		], 1),
	Ptpar([
		0.0.ceil, p1s.value(2, 36, 12, 0, "bass"),
		0.0.ceil, p1s.value(2, 64, 12, 1, "tenor"),
		0.0.ceil, p1s.value(2, 64, 24, 3, "sopranoI"),
		0.0.ceil, p1s.value(2, 72, 24, 4, "sopranoII"),
		], 1),
// 3nd sequence
	Ptpar([
		0.0.ceil, p1s.value(3, 64, 24, 3, "sopranoI"),
		1.0.ceil, p1c.value(5, 36, 12, 3, "bass"),
		2.0.ceil, p1s.value(3, 48, 24, 3, "tenor"),
		], 1),
	Ptpar([
		0.0.ceil, p1s.value(3, 72, 24, 5, "sopranoI"),
		1.0.ceil, p1c.value(5, 36, 12, 5, "bass"),
		1.5.ceil, p1s.value(3, 52, 24, 5, "tenor"),
		2.0.ceil, p1c.value(5, 72, 12, 5, "sopranoII"),
		], 1),
	Ptpar([
		0.0.ceil, p1c.value(5, 64, 12, 1, "tenor"),
		0.0.ceil, p1c.value(5, 64, 24, 1, "sopranoI"),
		1.0.ceil, p1s.value(3, 36, 12, 1, "bass"),
		1.0.ceil, p1s.value(3, 48, 24, 1, "baritone"),
		1.5.ceil, p1s.value(3, 72, 12, 1, "sopranoII"),
		], 1),
	Ptpar([
		0.0.ceil, p1s.value(1, 36, 12, 4, "bass"),
		0.0.ceil, p1s.value(2, 48, 12, 4, "baritone"),
		0.0.ceil, p1s.value(2, 53, 12, 4, "tenor"),
		0.0.ceil, p1s.value(2, 68, 12, 4, "sopranoII"),
		0.0.ceil, p1s.value(2, 71, 12, 4, "sopranoI"),
		1.0.ceil, p1a.value(2, 46, 12, 0, "bass"), // transition to solo
		], 1),
// bass solo
// !!!
// 2 bars before:
// ~tempo.tempo_(20/60);
// !!!
	Ptpar([
		0.0.ceil, p1e.value(1, 42, 12, 0, "bass"),
		2.0.ceil, p1a.value(1, 67, 24, 0, "sopranoI"),
		2.5.ceil, p1a.value(2, 64, 24, 0, "sopranoI"),
		6.0.ceil, p1a.value(5, 48, 24, 0, "tenor"),
		5.0.ceil, p1a.value(3, 64, 12, 0, "sopranoII"),
		5.5.ceil, p1a.value(4, 67, 24, 0, "sopranoI"),
		6.0.ceil, p1a.value(3, 52, 12, 0, "tenor")
		], 1),
	Ptpar([
		0.0.ceil, p1e.value(1, 46, 12, 1, "baritone"),
		1.5.ceil, p1a.value(2, 38, 24, 1, "bass"),
		2.0.ceil, p1a.value(2, 67, 24, 1, "sopranoI"),
		2.5.ceil, p1a.value(3, 38, 24, 1, "bass"),
		4.0.ceil, p1a.value(5, 48, 24, 1, "tenor"),
		3.0.ceil, p1a.value(3, 64, 12, 1, "sopranoII"),
		4.5.ceil, p1a.value(4, 67, 24, 1, "sopranoI")
		], 1),
	Ptpar([
		0.0.ceil, p1e.value(1, 46, 12, 3, "bass"),
		0.0.ceil, p1e.value(1, 67, 12, 3, "sopranoI"),
		2.0.ceil, p1e.value(1, 52, 24, 4, "tenor"),
		2.0.ceil, p1a.value(3, 64, 12, 4, "sopranoII"),
		2.0.ceil, p1a.value(3, 46, 12, 4, "baritone"),
		3.5.ceil, p1a.value(4, 67, 24, 4, "sopranoII")
		], 1),
// single bar rest before the interlude
	Ptpar([
		0.0.ceil, pRest.value(1, 0, 1.25, "baritone")
		], 1),
// 1st interlude
	Ptpar([
		0.0.ceil, p2i.value(4, "C#3".notemidi, 12, 0, "bass"),
		0.2.ceil, p2i.value(4, "F#4".notemidi, 12, 0, "tenor"),
		1.5.ceil, p2i.value(3, "D3".notemidi, 12, 0, "baritone"),
		2.0.ceil, p2i.value(3, "G5".notemidi, 12, 0, "sopranoI"),
		5.3.ceil, p1s.value(1, "B5".notemidi, 12, 0, "sopranoII")
		], 1);
	], 1);



~sectionII= Pseq([ // 2nd sequence
	// starting rest
	Ptpar([
		0.0.ceil, pRest.value(1, 0, 1.25, "baritone")
		], 1),
	// -_-_
	Pseq([
		Ptpar([
			0.0.ceil, p1m.value(1, 1.25, "B2".notemidi, 12, 8, "bass"),
			0.0.ceil, p1m.value(1, 1.25, "D3".notemidi, 12, 8, "baritone"),
			], 1),
		Ptpar([
			0.0.ceil, pRest.value(1, 0, 1.25, "baritone")
			], 1),
		Ptpar([
			0.0.ceil, p1m.value(1, 1.25, "Eb5".notemidi, 12, 8, "sopranoI"),
			0.0.ceil, p1m.value(1, 1.25, "Bb5".notemidi, 12, 8, "sopranoII"),
			], 1),
		Ptpar([
			0.0.ceil, pRest.value(1, 0, 1.25, "baritone")
			], 1),
		// -_-_
		Ptpar([
			0.0.ceil, p1m.value(1, 1.25, "B2".notemidi, 12, 8, "bass"),
			0.0.ceil, p1m.value(1, 1.25, "C#3".notemidi, 12, 8, "baritone"),
			0.0.ceil, p1m.value(1, 1.25, "F#4".notemidi, 12, 8, "tenor"),
			], 1),
		Ptpar([
			0.0.ceil, pRest.value(1, 0, 1.25, "baritone")
			], 1),
		Ptpar([
			0.0.ceil, p1m.value(1, 1.25, "Bb2".notemidi, 12, 8, "bass"),
			0.0.ceil, p1m.value(1, 1.25, "C#5".notemidi, 12, 8, "sopranoI"),
			0.0.ceil, p1m.value(1, 1.25, "Bb5".notemidi, 12, 8, "sopranoII"),
			], 1),
		Ptpar([
			0.0.ceil, pRest.value(1, 0, 1.25, "baritone")
			], 1),
		], 2),
	// -\\_
	Pseq([
		Ptpar([
			0.0.ceil, p1m.value(1, 1.25, "D#2".notemidi, 12, 8, "bass"),
			0.0.ceil, p1m.value(1, 1.25, "Eb3".notemidi, 12, 8, "baritone"),
			0.0.ceil, p1m.value(1, 1.375, "C3".notemidi, 12, 8, "tenor"),
			], 1),
		Ptpar([
			0.0.ceil, p1n.value(2, 0.125, "B2".notemidi, 12, 8, "bass"),
			0.0.ceil, p1n.value(3, 0.0625, "D3".notemidi, 12, 8, "baritone"),
			1.0.ceil, pRest.value(1, 0, 0.125, "baritone")
			], 1),
		// -\\_
		Ptpar([
			0.0.ceil, p1m.value(1, 1.25, Pfunc({chrds.choose.at(0).notemidi}),    12, 8, "bass"),
			0.0.ceil, p1m.value(1, 1.25, Pfunc({chrds.choose.at(0).notemidi-12}), 12, 8, "baritone"),
			0.0.ceil, p1m.value(1, 1.375,Pfunc({chrds.choose.at(0).notemidi}), 12, 8, "tenor"),
			], 2),
		Ptpar([
			0.0.ceil, p1n.value(2, 0.125, Pfunc({chrds.choose.at(0).notemidi}),    12, 8, "bass"),
			0.0.ceil, p1n.value(3, 0.0625,Pfunc({chrds.choose.at(0).notemidi-12}), 12, 8, "baritone"),
			1.0.ceil, pRest.value(1, 0, 0.125, "baritone")
			], 2),
		// -\\_
		Ptpar([
			0.0.ceil, p1m.value(1, 1.25, "F#5".notemidi, 12, 8, "sopranoI"),
			0.0.ceil, p1m.value(1, 1.25, "A#5".notemidi, 12, 8, "sopranoII"),
			0.0.ceil, p1m.value(1, 1.375, "F2".notemidi, 12, 8, "bass"),
			], 1),
		Ptpar([
			0.0.ceil, p1n.value(1, 0.0625, "F2".notemidi, 12, 8, "bass"),
			0.0.ceil, p1n.value(2, 0.375, "A#5".notemidi, 12, 8, "sopranoI"),
			1.0.ceil, pRest.value(1, 0, 0.125, "baritone")
			], 1),
		// -\\_
		Ptpar([
			0.0.ceil, p1m.value(1, 1.25, "G3".notemidi, 12, 8, "baritone"),
			0.0.ceil, p1m.value(1, 1.25, "Bb4".notemidi, 12, 8, "tenor")
			], 1),
		Ptpar([
			0.0.ceil, p1n.value(1, 0.0625, "G#3".notemidi, 12, 8, "bass"),
			0.0.ceil, p1n.value(1, 0.125, "Bb4".notemidi, 12, 8, "tenor"),
			1.0.ceil, pRest.value(1, 0, 0.25, "baritone")
			], 1)
		], 2),
	// -\/\_
	Ptpar([
		0.0.ceil, p1m.value(1, 1.25, "E2".notemidi, 12, 8, "bass"),
		0.0.ceil, p1m.value(1, 1.25, "Bb5".notemidi, 12, 8, "sopranoI"),
		0.0.ceil, p1m.value(1, 1.25, "C5".notemidi, 12, 8, "sopranoII"),
		0.25.ceil, p1n.value(3, 0.125, "E3".notemidi, 12, 8, "baritone"),
		], 1),
	Ptpar([
		0.0.ceil, p1n.value(1, 0.0625, "E3".notemidi, 12, 8, "bass"),
		0.0.ceil, p1n.value(1, 0.125, "Bb4".notemidi, 12, 8, "sopranoII"),
		1.0.ceil, pRest.value(1, 0, 0.125, "baritone")
		], 1),
	// -\/\_
	Ptpar([
		0.0.ceil, p1m.value(1, 1, "D3".notemidi, 12, 8, "baritone"),
		0.0.ceil, p1m.value(1, 1.25, "G2".notemidi, 12, 8, "bass"),
		0.0.ceil, p1m.value(1, 1.25, "A3".notemidi, 12, 8, "tenor"),
		0.25.ceil, p1n.value(3, 0.0625, "D4".notemidi, 12, 8, "sopranoI"),
		], 1),
	Ptpar([
		0.0.ceil, p1n.value(1, 0.0625, "E4".notemidi, 12, 8, "tenor"),
		0.75.ceil, pRest.value(1, 0, 0.0625, "tenor")
		], 1),
	// -\-/-\_
	Ptpar([
		0.0.ceil, p1m.value(1, 1.25, "B2".notemidi, 12, 8, "bass"),
		0.0.ceil, p1m.value(1, 1.25, "D3".notemidi, 12, 8, "baritone"),
		0.0.ceil, p1n.value(5, 0.0625, "D4".notemidi, 12, 8, "tenor"),
		], 1),
	Ptpar([
		0.0.ceil, pRest.value(1, 0, 1.125, "baritone")
		], 1),
	Ptpar([
		0.0.ceil, p1m.value(1, 1.25, "Bb2".notemidi, 12, 8, "bass"),
		0.0.ceil, p1m.value(1, 1.25, "C#5".notemidi, 12, 8, "sopranoI"),
		0.0.ceil, p1n.value(5, 0.0625, "Bb4".notemidi, 12, 8, "sopranoII"),
		], 1),
	Ptpar([
		0.0.ceil, pRest.value(1, 0, 1.25, "baritone")
		], 1),
	// -\-/-\_
	Ptpar([
		0.0.ceil, p1m.value(1, 1.25, "D#2".notemidi, 12, 9, "bass"),
		0.0.ceil, p1m.value(1, 1.25, "Eb3".notemidi, 12, 9, "baritone"),
		0.0.ceil, p1m.value(1, 1.25, "D4".notemidi, 12, 9, "tenor"),
		0.0.ceil, p1n.value(6, 0.0625, "C5".notemidi, 12, 9, "sopranoI"),
		0.75.ceil, p3t.value(3, 1/8, 2/8, "C#5".notemidi, 12, 9, "sopranoII"),
		], 1),
	Ptpar([
		0.0.ceil, p3t.value(3, 1/8, 2/8, "D#5".notemidi, 12, 9, "sopranoI"),
		1.0.ceil, pRest.value(1, 0, 0.125, "baritone")
		], 1),
	Ptpar([
		0.0.ceil, p1m.value(1, 1.25, "F#4".notemidi, 12, 9, "sopranoI"),
		0.0.ceil, p1m.value(1, 1.25, "A#5".notemidi, 12, 9, "sopranoII"),
		0.0.ceil, p1m.value(1, 1.25, "F4".notemidi, 12, 9, "tenor"),
		0.0.ceil, p1n.value(5, 0.0625, "F#3".notemidi, 12, 9, "baritone"),
		], 1),
	Ptpar([
		0.0.ceil, p1n.value(5, 0.0625, "F#2".notemidi, 12, 9, "bass"),
		1.0.ceil, pRest.value(1, 0, 0.125, "baritone")
		], 1),
	// a massive chord
	Ptpar([
		0.0.ceil, p1m.value(1, 1.25, "F4".notemidi, 12, 9, "sopranoI"),
		0.0.ceil, p1m.value(1, 1.25, "A#5".notemidi, 12, 9, "sopranoII"),
		0.0.ceil, p1m.value(1, 1.25, "Bb4".notemidi, 12, 9, "tenor"),
		0.0.ceil, p1m.value(1, 1.25, "C3".notemidi, 12, 9, "baritone"),
		0.0.ceil, p1m.value(1, 1.25, "D#2".notemidi, 12, 9, "bass")
		], 1),
	// bg: bass + tenor, the rest voices are "messing around"
	Ptpar([
		0.0.ceil, Pseq([
			Ppar([
				p1m.value(1, 5/4, Pfunc({chrds.choose.at(0).notemidi}), 24, 9, "bass"),
				p1m.value(1, 5/4, Pfunc({chrds.choose.at(1).notemidi}), 24, 9, "tenor")
				]),
			pRest.value(1, 0, 5/4, "baritone")
			], 6),
		0.0.ceil, Pseq([
			Pseq([
				p1n.value(4, Prand([1/16, 1/8, 1/4], 1), "F#5".notemidi, 12, 9, "sopranoI"),
				pRest.value(1, 0, 1/16, "sopranoI")
				], 2),
			Pseq([
				p3t.value(3, 1/8, 2/8, "C#5".notemidi, 12, 9, "sopranoI"),
				pRest.value(1, 0, 1/16, "sopranoI")
				]),
			Pseq([
				p3t.value(3, 1/8, 2/8, "D#4".notemidi, 24, 9, "sopranoI"),
				pRest.value(1, 0, 1/16, "sopranoI"),
				Ppar([
					p1n.value(2, Prand([1/16, 1/8], 1), "F#3".notemidi, 24, 9, "baritone"),
					p1n.value(2, Prand([1/16, 1/8], 1), "F#5".notemidi, 12, 9, "sopranoII")
					])
				], 1),
			], 6)
		], 1),
	Ptpar([
		0.0.ceil, Pseq([
			// the trail of a massive chord
			p1m.value(2, 0.5, "C3".notemidi, 12, 8, "baritone"),
			p1m.value(2, 1, "D#2".notemidi, 12, 8, "bass"),
			Pseq([
				p1m.value(1, 1.25, Pfunc({ chrds.choose.at(0).notemidi }), 12, 9, "bass"),
				p1m.value(1, 1.25, Pfunc({ chrds.choose.at(1).notemidi }), 12, 9, "baritone"), // -12 from tenor
				])
			], 3),
		// "birds"-like
		0.0.ceil, Pxrand([
			Pseq([
				p1n.value(4, Prand([1/16, 1/8, 1/4], 1), "Bb4".notemidi, 12, 9, "sopranoI"),
				p3t.value(3, 1/8, 2/8, "A#4".notemidi, 24, 9, "sopranoI"),
				p3t.value(5, 1/16, 4/16, "D#4".notemidi, 24, 9, "sopranoI"),
				], 1),
			Pseq([
				p1n.value(4, Prand([1/16, 1/8, 1/4], 1), "C5".notemidi, 12, 9, "sopranoII"),
				p3t.value(3, 1/8, 2/8, "D#4".notemidi, 24, 9, "sopranoII"),
				p3t.value(5, 1/16, 4/16, "F4".notemidi, 24, 9, "sopranoII"),
				], 1),
			Pseq([
				p1n.value(4, Prand([1/16, 1/8, 1/4], 1), "D#5".notemidi, 12, 9, "tenor"),
				p3t.value(5, 1/16, 4/16, "Bb4".notemidi, 24, 9, "tenor"),
				p3t.value(3, 1/8, 2/8, "C4".notemidi, 24, 9, "tenor")
				], 1)
			], 10)
		], 1),
	Ptpar([
		0.0.ceil, Pseq([
			Pseq([
				p1m.value(1, 5/4, Pfunc({ chrds.choose.at(0).notemidi }), 12, 9, "bass"),
				p1m.value(1, 5/4, Pfunc({ chrds.choose.at(1).notemidi-12 }), 12, 9, "baritone"), // -12 from tenor
				])
			], 6),
		// only tuplets
		0.0.ceil, Ppar([
			Pseq([
				pRest.value(1, 0, 1/2, "tenor"),
				Pshuf([
					p3t.value(3, 1/8, 2/8, Pfunc({ chrds.choose.at(1).notemidi }), 24, 9, "tenor"),
					pRest.value(1, 0, 1/8, "tenor"),
					p3t.value(5, 1/16, 4/16, Pfunc({ chrds.choose.at(0).notemidi+12 }), 12, 9, "tenor")
					]),
				pRest.value(1, 0, 1/8, "tenor"),
				], 1),
			Pseq([
				pRest.value(1, 0, 5/4, "sopranoI"),
				p3t.value(5, 1/16, 4/16, Pfunc({ chrds.choose.at(1).notemidi }), 12, 9, "sopranoI"),
				pRest.value(1, 0, 1/4, "sopranoI"),
				p3t.value(5, 1/8, 4/8, Pfunc({ chrds.choose.at(1).notemidi+12 }), 12, 9, "sopranoI"),
				pRest.value(1, 0, 1/4, "sopranoI")
				], 1),
			Pseq([
				pRest.value(1, 0, 5/2, "sopranoI"),
				p3t.value(4, 1/8, 3/8, Pfunc({ chrds.choose.at(1).notemidi+12 }), 12, 9, "sopranoII"),
				pRest.value(1, 0, 1/8, "sopranoII"),
				p3t.value(5, 1/16, 4/16, Pfunc({ chrds.choose.at(0).notemidi+24 }), 12, 9, "sopranoII"),
				pRest.value(1, 0, 1/2, "sopranoII")
				], 1),
			], 4)
		], 1),
	// rhythmical structure begins here (background "breathing")
	Ptpar([
		0.0.ceil, Pseq([
			// the trail of a massive chord
			p1m.value(1, 1/2, "C3".notemidi, 12, 8, "bass"),
			p1m.value(1, 1/4, "D#2".notemidi, 12, 8, "bass"),
			pRest.value(1, 0, 1/4, "bass"),
			Pseq([
				p1m.value(1, 1/4, Pfunc({ chrds.choose.at(0).notemidi }), 12, 8, "bass"),
				p1m.value(1, 1/2, Pfunc({ chrds.choose.at(1).notemidi-12 }), 12, 8, "bass"), // -12 from tenor
				pRest.value(1, 0, 1/4, "bass")
				])
			], 3),
		0.0.ceil, Pseq([
			// the trail of a massive chord - baritone
			pRest.value(1, 0, 1/4, "tenor"),
			p1m.value(1, 1/2, "Bb3".notemidi, 12, 8, "tenor"),
			p1m.value(1, 1/4, "D#3".notemidi, 12, 8, "tenor"),
			Pseq([
				pRest.value(1, 0, 1/4, "tenor"),
				p1m.value(1, 1/4, Pfunc({ chrds.choose.at(1).notemidi }), 12, 8, "tenor"),
				p1m.value(1, 1/2, Pfunc({ chrds.choose.at(0).notemidi+12 }), 12, 8, "tenor"), // -12 from tenor
				])
			], 4),
		// "gust of wind"-like
		0.0.ceil, Pseq([
			pRest.value(1, 0, 1/4, "baritone"),
			p1m.value(5, 1/16, "Bb2".notemidi, 12, 8, "baritone"),
			p3t.value(3, 1/16, 1/8, "D#3".notemidi, 24, 8, "baritone"),
			Pxrand([
				pRest.value(1, 0, 1/4, "baritone"),
				p3t.value(5, 1/16, 4/16, "D#2".notemidi, 24, 8, "baritone"),
				], 1),
			pRest.value(1, 0, 5/16, "baritone")
			], 6),
		// "birds"-like
		0.0.ceil, Pseq([
			pRest.value(1, 0, 3/8, "sopranoI"),
			p1m.value(5, 1/16, "Bb4".notemidi, 12, 8, "sopranoI"),
			Pseq([
				pRest.value(1, 0, 1/4, "sopranoI"),
				p3t.value(5, 1/16, 4/16, Pfunc({ chrds.choose.at(1).notemidi }), 24, 8, "sopranoI")
				], 1),
			pRest.value(1, 0, 5/16, "sopranoI")
			], 6),
		], 1),
	// finishing section with soprano
	Ptpar([
		0.0.ceil, Pseq([
			Pn(p1n.value(1, 1/8, Pfunc({ chrds.choose.at(1).notemidi }), 12, 8, "sopranoI"), 3),
			pRest.value(1, 0, 1/8, "sopranoI")
			]),
		0.0.ceil, Pseq([
			Pn(p1n.value(1, 1/4, Pfunc({ chrds.choose.at(1).notemidi+12 }), 12, 8, "sopranoII"), 2),
			pRest.value(1, 0, 1/16, "sopranoII")
			])
		], 1),
	// rhythmic figure on bass; tenor and soprano continuing previous "lines"
	Ptpar([
		0.0.ceil, Pseq([
			Pn(p1m.value(1, 1/8, Pfunc({ chrds.choose.at(0).notemidi }), 12, 8, "bass"), 3),
			pRest.value(1, 0, 1/8, "bass"),
			p1m.value(1, 1/16, Pfunc({ chrds.choose.at(1).notemidi-12 }), 12, 8, "bass"),
			pRest.value(1, 0, 1/16, "bass")
			], 20),
		0.0.ceil, Pseq([
			Pseq([
				Pn(p1m.value(1, 1/8, Pfunc({ chrds.choose.at(1).notemidi+12 }), 12, 8, "sopranoII"), 3), // w/soprano
				pRest.value(1, 0, 1/4, "sopranoII")
				], 1),
			Pseq([
				Pn(p1m.value(1, 1/8, Pfunc({ chrds.choose.at(1).notemidi }), 12, 8, "tenor"), 3), // w/soprano
				pRest.value(1, 0, 1/4, "tenor")
				], 1),
			], 10),
		// "gust of wind"-like
		0.0.ceil, Pseq([
			pRest.value(1, 0, 1/4, "baritone"),
			p1m.value(5, 1/16, "Bb2".notemidi, 12, 8, "baritone"),
			p3t.value(3, 1/16, 1/8, "D#2".notemidi, 24, 8, "baritone"),
			Pxrand([
				p3t.value(5, 1/16, 4/16, "Bb2".notemidi, 24, 8, "baritone"),
				pRest.value(1, 0, 1/4, "baritone")
				], 1),
			pRest.value(1, 0, 5/16, "baritone")
			], 10),
		// "birds"-like
		0.0.ceil, Pseq([
			pRest.value(1, 0, 3/8, "sopranoI"),
			p1m.value(5, 1/16, "Bb4".notemidi, 12, 8, "sopranoI"),
			Pxrand([
				p3t.value(5, 1/16, 4/16, Pfunc({ chrds.choose.at(1).notemidi }), 24, 8, "sopranoI"),
				pRest.value(1, 0, 1/4, "sopranoI")
				], 1),
			pRest.value(1, 0, 5/16, "sopranoI")
			], 10),
		], 1),
	// short tuplet "fight"
	Ptpar([
		0.0.ceil, Pseq([
			Pn(p1m.value(1, 1/8, Pfunc({ chrds.choose.at(0).notemidi }), 12, 8, "bass"), 3),
			pRest.value(1, 0, 1/8, "bass"),
			p1m.value(1, 1/16, Pfunc({ chrds.choose.at(1).notemidi-12 }), 12, 8, "bass"),
			pRest.value(1, 0, 1/16, "bass")
			], 2),
		0.0.ceil, Pseq([
			pRest.value(1, 0, 1/4, "baritone"),
			p1n.value(5, 1/16, "D#3".notemidi, 12, 8, "baritone"),
			p3t.value(3, 1/16, 1/8, "Bb2".notemidi, 24, 8, "baritone"),
			Pxrand([
				p3t.value(5, 1/16, 4/16, "D#2".notemidi, 24, 8, "baritone"),
				pRest.value(1, 0, 1/4, "baritone")
				], 1),
			pRest.value(1, 0, 5/16, "baritone")
			], 2),
		0.0.ceil, Pseq([
			pRest.value(1, 0, 3/8, "sopranoI"),
			p1n.value(5, 1/16, "Bb4".notemidi, 12, 8, "sopranoI"),
			Pxrand([
				p3t.value(5, 1/16, 4/16, Pfunc({ chrds.choose.at(1).notemidi })+12, 24, 8, "sopranoI"),
				pRest.value(1, 0, 1/4, "sopranoI")
				], 1),
			pRest.value(1, 0, 5/16, "sopranoI")
			], 1),
		0.0.ceil, Pseq([
			pRest.value(1, 0, 3/8, "bass"),
			p1n.value(5, 1/16, "Bb2".notemidi, 12, 8, "bass"),
			Pxrand([
				p3t.value(5, 1/16, 4/16, Pfunc({ chrds.choose.at(0).notemidi }), 24, 8, "bass"),
				pRest.value(1, 0, 1/4, "bass")
				], 1),
			pRest.value(1, 0, 5/16, "bass")
			], 2),
		], 2),
	// unstable, but smooth (no tuplets) ~ willow song (bass and baritone supports sopranoII)
	Ptpar([
		0.0.ceil, Pseq([
			p1m.value(1, 1.25, "F#2".notemidi, 12, 8, "bass"),
			p1m.value(1, 1.25, "G#2".notemidi, 12, 8, "baritone"),
			], 5),
		0.0.ceil, Pshuf([
			p1n.value(4, Prand([1/8, 1/4], 1), "C#4".notemidi, 12, 8, "sopranoI"),
			pRest.value(1, 0, 0.125, "sopranoI"),
			p1n.value(4, Prand([1/8, 1/4], 1), "F#4".notemidi, 24, 8, "sopranoII"),
			pRest.value(1, 0, 0.125, "sopranoII"),
			p1n.value(4, Prand([1/8, 1/4], 1), "E3".notemidi, 24, 8, "tenor"),
			pRest.value(1, 0, 0.125, "tenor")
			], 3)
		], 1),
	Ptpar([
		0.0.ceil, Pseq([
			p1m.value(1, 1.25, "F#2".notemidi, 12, 10, "bass"),
			p1m.value(1, 1.25, "G#2".notemidi, 12, 10, "baritone"),
			], 5),
		0.0.ceil, Pshuf([
			p1n.value(4, Prand([1/8, 1/4], 1), "A4".notemidi, 12, 11, "sopranoI"),
			pRest.value(1, 0, 0.125, "sopranoI"),
			p1n.value(4, Prand([1/8, 1/4], 1), "G#4".notemidi, 24, 11, "sopranoII"),
			pRest.value(1, 0, 0.125, "sopranoII"),
			p1n.value(4, Prand([1/8, 1/4], 1), "D#3".notemidi, 24, 11, "tenor"),
			pRest.value(1, 0, 0.125, "tenor")
			], 3)
		], 1),
	// preparation to the chord
	Ptpar([
		0.0.ceil, Pseq([
			p1m.value(1, 1.25, Pfunc({ chrds.choose.at(0).notemidi }), 12, 8, "bass"),
			p1m.value(1, 1.25, Pfunc({ chrds.choose.at(1).notemidi-12 }), 12, 8, "baritone"), // -12 from tenor
			p1m.value(1, 1.25, Pfunc({ chrds.choose.at(1).notemidi+12 }), 12, 8, "sopranoI"),
			], 2),
		0.0.ceil, Pshuf([
			p1n.value(4, Prand([1/8, 1/4], 1), Pfunc({ chrds.choose.at(1).notemidi+12 }), 12, 8, "sopranoI"),
			pRest.value(1, 0, 0.125, "sopranoI"),
			p1n.value(4, Prand([1/8, 1/4], 1), Pfunc({ chrds.choose.at(1).notemidi+12 }), 12, 8, "sopranoII"),
			pRest.value(1, 0, 0.125, "sopranoII"),
			p1n.value(4, Prand([1/8, 1/4], 1), Pfunc({ chrds.choose.at(1).notemidi }), 12, 8, "tenor"),
			pRest.value(1, 0, 0.125, "tenor")
			], 3)
		], 2),
	// a massive chord
	Ptpar([
		0.0.ceil, p1m.value(1, 1.25, Pfunc({ chrds.choose.at(1).notemidi+12 }), 12, 8, "sopranoI"),
		0.0.ceil, p1m.value(1, 1.25, Pfunc({ chrds.choose.at(1).notemidi+12 }), 12, 8, "sopranoII"),
		0.0.ceil, p1m.value(1, 1.25, Pfunc({ chrds.choose.at(1).notemidi }), 12, 8, "tenor"),
		0.0.ceil, p1m.value(1, 1.25, Pfunc({ chrds.choose.at(0).notemidi }), 12, 8, "baritone"),
		0.0.ceil, p1m.value(1, 1.25, Pfunc({ chrds.choose.at(0).notemidi }), 12, 8, "bass")
		], 1),
	// a massive chord
	Ptpar([
		0.0.ceil, p1m.value(1, 1.25, Pfunc({ chrds.choose.at(1).notemidi+12 }), 12, 8, "sopranoI"),
		0.0.ceil, p1m.value(1, 0.5, Pfunc({ chrds.choose.at(1).notemidi+12 }), 12, 8, "sopranoII"),
		0.0.ceil, p1m.value(1, 0.25, Pfunc({ chrds.choose.at(1).notemidi }), 12, 8, "tenor"),
		0.0.ceil, p1m.value(1, 1, Pfunc({ chrds.choose.at(0).notemidi }), 12, 8, "baritone"),
		0.0.ceil, p1m.value(1, 1.25, Pfunc({ chrds.choose.at(0).notemidi }), 12, 8, "bass")
		], 1),
	Ptpar([ // the trail of a massive chord
		0.0.ceil, p1m.value(5, 0.5, "C3".notemidi, 12, 9, "baritone"),
		0.0.ceil, p1n.value(5, 1, "D#2".notemidi, 12, 9, "bass"),
		0.0.ceil, p1a.value(5, Pfunc({ chrds.choose.at(1).notemidi }), 12, 9, "tenor"),
		0.0.ceil, p1a.value(5, Pfunc({ chrds.choose.at(1).notemidi+12 }), 12, 9, "sopranoI"),
		]),
	Ptpar([ // the trail of a massive chord
		0.0.ceil, p1n.value(8, 1, Pfunc({ chrds.choose.at(0).notemidi }), 12, 9, "bass"),
		0.0.ceil, p1a.value(9, Pfunc({ chrds.choose.at(1).notemidi+12 }), 12, 9, "sopranoI"),
		])
	], 1);

~coda= Pseq([ // coda
	Ptpar([
		0.0.ceil, p2j.value(4, "G#2".notemidi, 10, 0, "bass"),
		0.7.ceil, p2j.value(3, "D#4".notemidi, 10, 0, "tenor"),
		1.7.ceil, p2j.value(3, "C3".notemidi, 11, 0, "baritone"),
		3.0.ceil, p2j.value(2, "Eb5".notemidi, 11, 0, "sopranoI"),
		5.5.ceil, p1s.value(1, "F5".notemidi, 11, 0, "sopranoII")
		], 1);
	], 1);
)


// section I
~tempo= TempoClock.tempo_(30/60); // beginning
~tempo.schedAbs(~tempo.nextBar, { ~tempo.setMeterAtBeat(1.25, 4); ~sectionI.play(~tempo); });
~tempo.tempo_(20/60); // bass solo
~tempo.tempo_(35/60); // interlude

// section II
~tempo.tempo_(20/60);
~tempo.schedAbs(~tempo.nextBar, { ~tempo.setMeterAtBeat(1.25, 4); ~sectionII.play(~tempo); });
~tempo.tempo_(35/60); // coda
~tempo.schedAbs(~tempo.nextBar, { ~tempo.setMeterAtBeat(1.625, 8); ~coda.play(~tempo); });

// report bar/beat (not in use)
~tempo.schedAbs(~tempo.nextBar, { |beat| postf("\nbar: %\tbeat: %\n", ~tempo.bar.asString, ~tempo.beatInBar.asString); 1 });


// ====----====----====----====----====----====----====----====----====----====----====----====----====
// INTERVALS
// "Oj u poli drevo":
// horizontally - first phrase
["G4", "F4", "Eb4", "B3", "Bb3"].reverse.notemidi-46; // -> [ 0, 1, 5, 7, 9 ]
// vertically - voices: treble 1, 2, 3, bass
// ||:
["Bb3", "G3", "E3", "Eb3"].reverse.notemidi-39; // -> [ 0, 1, 4, 7 ]; orig ["G4", "E4", "Bb3", "Eb3"]
["Ab4", "F4"].reverse.notemidi-53; // -> [ 0, 3 ]
["Bb4", "G4", "Bb3"].reverse.notemidi-46; // -> [ 0, 9, 12 ]
["F4", "E4"].reverse.notemidi-52; // -> [ 0, 1 ]
["C4", "G3", "Eb3", "D3"].reverse.notemidi-38; // -> [ 0, 1, 5, 10 ]; orig ["C5", "G4", "Eb4", "D3"]
["Bb3", "C3"].reverse.notemidi-36; // -> [ 0, 10 ]; orig ["Bb4", "C3"]
["Bb4", "F4", "D4", "Bb3"].reverse.notemidi-46; // -> [ 0, 4, 7, 12 ]; orig ["D5", "Bb4", "F4", "Bb3"].reverse.notemidi-46
["D5", "G4", "Eb4"].reverse.notemidi-51; // -> [ 0, 4, 11 ]
["Db5", "Ab4", "Db4"].reverse.notemidi-49; // -> [ 0, 7, 12 ]; orig ["Db5", "Ab4", "Db3"]
["Bb4", "G4"].reverse.notemidi-55; // 55 -> [ 0, 3 ]; *1 - one seqence of chords
["Ab4", "F4"].reverse.notemidi-53; // 53 -> [ 0, 3 ]; *2
["G4", "Eb4"].reverse.notemidi-51; // 51 -> [ 0, 4 ]; *3
["F4", "D4"].reverse.notemidi-50;  // 50 -> [ 0, 3 ]; *4
["G4", "D4", "G3"].reverse.notemidi-43; // 43 -> [ 0, 7, 12 ] ;orig ["G4", "D4", "G2"]
["Ab4", "E4", "Ab3"].reverse.notemidi-44; // 44 -> [ 0, 8, 12 ]; orig ["Ab4", "E4", "Ab2"]
["F4", "C4", "F3"].reverse.notemidi-41; // 41 -> [ 0, 7, 12 ]; orig ["F4", "C4", "F2"]
["G4", "D4", "B3", "G3"].reverse.notemidi-43; // 43 -> [ 0, 4, 7, 12 ]; orig ["G4", "D4", "B3", "G2"]
["Ab4", "Eb4", "Ab3"].reverse.notemidi-44; // 44 -> [ 0, 7, 12 ] ; orig ["Ab4", "Eb4", "Ab2"]
["Bb4", "F4"].reverse.notemidi-53; // -> [ 0, 5 ]
["G4", "G3", "G2"].reverse.notemidi-31; // -> [ 0, 12, 24 ]; actually shouldn't be used as is, but w/shift to voices registers
// :||
//
// "Oj Borovaja Zazulina":
// horizontally - first phrase
["C#3", "E3", "F#3", "G#3"].notemidi-37; // -> [ 0, 3, 5, 7 ]
// vertically - voices: 1, 2
// ||:
["F#3", "A3"].notemidi-42; // -> [0, 3]
["F#3", "G#3"].notemidi-42; // -> [0, 2]
["F#3", "B3"].notemidi-42; // -> [0, 5]
// :||
//
// "Divko Galochko":
// horizontally - first phrase
["B2", "E3", "F#3", "G#3"].notemidi-35; // -> [ 0, 5, 7, 9 ]
// vertically - voices: 1, 2
// ||:
["E3", "G#3"].notemidi-40; // -> [0, 4]
["E3", "A3"].notemidi-40; // -> [0, 5]
["D#3", "F#3"].notemidi-39; // -> [0, 3]
// :||
// ====----====----====----====----====----====----====----====----====----====----====----====----====


//--CLICK TRACK
(
var clk, barNo, currSeg= 0, currBar= 0, tempoTrack, tempoWarn=List.new, bars, firstBeatColor= Color.new255(255, 20, 147);
var beatFunc, playFunc, flash, flashOn= true;
var w, views= List.new, viewBg, clr, fontSize, barText, i, playback= false, buff, filename, click= true;

//// partI
//tempoTrack= [ [1, 120, 5, 4], [92, 80, 5, 4], [126, 130, 5, 4]]; // [beat no, tempo, measure size]
//bars= 143;
//playback= true;
//filename= "/Users/deniskolokol/Music/compositions/CalArts2012/Elxi/elxi_part1_piano.wav";
// partII
tempoTrack= [ [1, 80, 5, 4], [152, 260, 13, 8]];
bars= 156;
playback= true;
filename= "/Users/deniskolokol/Music/compositions/CalArts2012/Elxi/elxi_part2_piano.wav";

//TESTS
//tempoTrack= [ [1, 120], [92, 80], [106, 130]]; // [beat no, tempo] - TEST
//tempoTrack= [ [1, 120, 5, 4], [5, 80, 5, 4], [8, 260, 10, 8] ]; // [beat no, tempo] - TEST

tempoTrack.do({ |cm| tempoWarn.add(cm[0]) });
barNo= 0;
i= 0;
while({ barNo > tempoWarn[i] }, {
	i= i+1;
	currSeg= i;
	});

clk= TempoClock.new
	.tempo_(120/60)
	.setMeterAtBeat(5, 4); // initial

if(playback, {
	buff= Buffer.read(s, filename);
	});

w= Window("Elxi metro", Rect(412, 120, 500, 260));
w.view.background_(Color.white);

beatFunc= { |beat|
	if(barNo > bars, {
		clk.stop; // fin
		clk.clear;
		clk.free
		},
	{
		if(clk.bar != currBar, {
			{
				barText.remove;
				views.do({ |v| v.refresh; v.remove;});
				viewBg.remove; viewBg= nil;
				viewBg= SCUserView(w, Rect(0, 0, w.bounds.width, w.bounds.height))
					.background_(Color.white);
				w.refresh;
				}.defer;
			views= List.new;

			currBar= clk.bar;
			barNo= barNo+1; // add a bar

			if(barNo == tempoTrack[currSeg][0], {
				clk.tempo_(tempoTrack[currSeg][1].asInteger/60);
				clk.setMeterAtBeat(tempoTrack[currSeg][2], tempoTrack[currSeg][3]);
				if(currSeg < (tempoTrack.size-1), {
					currSeg= currSeg + 1
					})
				});
			});

		postf("barsize,%/%,tempo,%,bar,%,beat,%\t--\tbar/segment,%/%\n",
			clk.beatsPerBar.asString, clk.baseBarBeat, clk.tempo, clk.bar.asString, clk.beatInBar.asString, barNo.asString, currSeg.asString
			);

		{ // draw it
			clr= if(tempoWarn.includes(barNo+1), { Color.red }, {
				if(barNo % 2 == 0, { Color.new255(0, 0, 2378) }, { Color.new255(66, 66, 66) });
				});
			if( (clk.beatInBar.asInteger == 0) && (firstBeatColor != nil), { clr= firstBeatColor});
			fontSize= case
				{ barNo < 10 } { 380 }
				{ (barNo >= 10) && (barNo < 100) } { 260 }
				{ barNo >= 100 } { 160 };

			views.add(
				SCUserView(w, Rect(
					clk.beatInBar.round*(w.bounds.width/clk.beatsPerBar),
					10,
					(w.bounds.width/clk.beatsPerBar)-2,
					w.bounds.height-10)
					)
					.background_(clr);
				);
			barText= SCStaticText(w, Rect(50, 60, 300, w.bounds.height-100))
				.string_(barNo.asString)
				.stringColor_(Color.white)
				.font_(Font("Helvetica", fontSize))
			}.defer;

		// flash the first beat
		if(flashOn, {
			if(clk.beatInBar.asInteger == 0, {
				flash= Routine({
					inf.do({ |i|
						{
							if(i%2==0, {
								try{
									views[0].background_(Color.white);
									barText.stringColor_(clr);
									}
								},
							{
								try{
									views[0].background_(clr);
									barText.stringColor_(Color.white);
									}
								});
							}.defer;
						if(i==1, { flash.stop });
						(clk.tempo/(clk.baseBarBeat*4)).wait;
						});
					}).play;
				});
			});

		// click
		if(clk.beatInBar.asInteger == 0, {
			{ Pan2.ar(LPF.ar(WhiteNoise.ar(EnvGen.kr( Env.perc(0.001, 0.1, 0.5, -4), gate:1, doneAction: 2 )), 10000)) }.play;
			},
		{
			{ Pan2.ar(LPF.ar(WhiteNoise.ar(EnvGen.kr( Env.perc(0.001, 0.1, 0.3, -4), gate:1, doneAction: 2 )), 4000)) }.play;
			});

		});

	// return every whole beat
	1
	};

// play piano support
playFunc= {
	Synth(\gmpLoopMono, [ \bufnum, buff.bufnum, \out, 0, \vol, 1, \startPos, 0, \endLoop, buff.numFrames, \pan, 0, \trig, 1 ], s, \addToHead);
	};

w.front;
w.fullScreen;

CmdPeriod.doOnce({
	try{ buff.free };
	clk.stop;
	clk.clear;
	clk.free;
	w.close;
	});

clk.schedAbs(clk.nextBar, beatFunc);
clk.schedAbs(clk.nextBar, playFunc);
)


// aux tools
// midi table
(0..127).do({ |i| ("'"++i.asString++"': '"++i.midinotename++"',").postln })
s= Server.default
// keyboard
k = KeyboardWindow();
(
36.do({ |i| s.sendMsg( \g_new, 500 + 36 + i ); }); // run this line again after cmd-.
k.downAction = { |chan, note, velo| s.sendMsg( \s_new, "p_bowedstring", s.nextNodeID, 1, 500 + note,
	\freq, note.midicps,  \amp, (velo/127) * 0.25 );
	postf("midi %\t note %\n", note, note.midinotename);
	};
k.upAction = { |chan, note, velo|
	// release velo changes release time (0-1s)
	s.sendMsg( \n_set,  500 + note, "gate", -1 - (velo / 127.0) )
	};
)



// superfomus example
(
p = Pbind(
	\instrument, \p_piano,
	\note, Pif(Pwhite(0.0, 1.0, inf) < 0.7, Pwhite(-7.0, 0, inf), Pwhite(7.0, 14, inf)),
	\dur, Prand([0.125, 0.25, 0.5], inf)
	);
)
p.play

f= Fomus()
f.put(p.asStream, 80)
f.lilyPath = "/usr/bin/lilypond"
f.lilyViewPath = "/Applications/Preview.app/Contents/MacOS/Preview"
f.ly
