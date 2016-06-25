// 2 groups of voices
// 3 simultaneous harmonic streams - "main":
// - baritone or bass
// - tenor or counter
// - soprano or mezzo
// plus 2 more - "support":
// - tenor
// - soprano
//
// Models:
// 1.
// Each voice from "main" in their own scope with different tonalities.
// Material for scores - Lorenz attractor: x, y, z
// Every N's time the same note is eventually reached, group "main" should keep it,
// develop into the chord, and then split up again into the new tonality
// While "main" are split, "support" follows them by non-harmonic, noisy sound-lines.
// When they develop a chord, "support" supports
// Voices from "main" and "support" should be interchangeable to enrich the texture
// Dynamics should be build based on Lorenz as well.
// Feeling: masses of air furiously swirling and eventually turning into heavy matter

// Typical bass range:
\G1.namemidi // 43 lowest
\E3.namemidi // 64 highest
// but presume this scope:
\C1.namemidi // 36 lowest
\C3.namemidi // 60 highest

// Typical tenor range:
\C3.namemidi // 60 lowest
\C5.namemidi // 84 highest

// Typical soprano range:
\C4.namemidi // 72 lowest
\A5.namemidi // 93 highest
// but presume this scope:
\C4.namemidi // 72 lowest
\C6.namemidi // 96 highest



// temp N1
(
var iter= 2000, pLorenz, pScale;
var p1, p2, p3, p;
var arrBass= [43, 64], arrSopr= [60, 95];

TempoClock.default.tempo = 70/60;

pScale= Prout({
	var scl= [
		#[0,2,3,7,9],
		#[0,1,5,6,10],
		#[0,4,5,7,10]
	];

	loop({
		scl.choose.yield;
	})
});

pLorenz= Prout({
	var x, y, z, x0=2.0, y0=3.0, z0=5.0;
	var rho= 20, sigma= 10, beta= 2.667;
	var h= 0.01, i= 0, step= 1, stepNext, behavior= 2;
	var stepRhoBorders= [ [10,30], [12,96], [20,40], [35,80], [12, 96] ], currBorder= stepRhoBorders[0];
	#x, y, z= [-10, 10, 25];

	stepNext= [45, 60].choose;

	loop({
		if( i >= (stepNext * step), {
			step= step + 1;
			currBorder= stepRhoBorders.choose;
			behavior= [0,1,2].choose; // models of behavior
			("=== NEW STEP " + step + "===").postln;
			stepNext= [45, 60].choose;
			i= 0;
		});
		case
			{ behavior == 0 } { rho= exprand(rho, currBorder.choose) }
			{ behavior == 1 } { rho= exprand(currBorder[0], currBorder[1]) }
			{ behavior == 2 } { rho= rho+((i/(stepNext/2))**3) };

		rho= rho.clip(12,96);

		x= (x0 + ( h * ( sigma*(y0-x0) ) ) ).clip2(100);
		y= (y0 + ( h * ( x0*(rho-z0)-y0 ) ) ).clip2(100);
		z= (z0 + ( h * ( (x0*y0)-(beta*z0) )) ).clip2(100);

		i= i+1;
		x0=x; y0=y; z0=z;

		[
			x.linlin(-100,100, 0,11),
			y.linlin(-100,100, 0,11),
			z.linlin(0,100, 0,11),
			z.linlin(0,100, 0,1),
			rho.linlin(12,96, 0,1)
		].yield;
	});
});

// -- old concept
p1= Pbind(
	\instrument, \p_bowedstring,
	\scale, pScale,
	\octave, Pseq([ Pxrand([3, 4, 5, 6], 12), Pxrand([5, 6, 7, 8], 15) ], inf),
	[\tmp0, \degree, \tmp1, \tmp2, \amp], pLorenz,
	\dur, Prand( [Pgeom( 0.5, 1 + Pwhite( 0.1, 0.2, inf), 25), Pgeom( 0.2, 1 - Pwhite( 0.1, 0.2, inf), 25)].clip(0.03125, 2), inf),
	\legato, Prand( [Pwhite( 0.1, 0.2, inf), Pwhite( 0.2, 0.7, inf), Pwhite( 0.5, 1.2, inf)], inf)
	);
p2= Pbind(
	\instrument, \p_bowedstring,
	\scale, pScale,
	\octave, Pxrand([2,3,4], inf),
	[\degree, \dur, \tmp1, \amp, \tmp2], pLorenz
	);
p3= Pbind(
	\instrument, \p_bowedstring,
	\scale, pScale,
	\dur, Pxrand([Pgeom( 1, 1-Pwhite(0.1, 0.2, inf), 15), Pgeom( 4, 1 - Pwhite( 0.1, 0.2, inf), 40)], inf),
	\n, Pwhite(3, 10, inf),
	\dur, Pstutter(Pkey(\n), Pwhite(0.1, 1, inf)),
	[\tmp0, \degree, \oct, \tmp2, \amp], pLorenz,
	\octave, round(Pkey(\oct).linlin(0,11, 3,6))
	).trace;
p= Ppar([p1, p2, p3]);
p.play;
)


// Quant (!!!)



// instruments:
(
SynthDef(\p_bowedstring, { arg freq = 440, gate = 1, dec= 0.3, amp = 0.5, slideTime = 0.17, ffreq = 1100;
	var	sig, env = Env.adsr(0.01, dec, 0.4, 0.1);
	freq = Lag.kr(freq, slideTime);
	sig = Klank.ar(`[
			Array.series(12, freq, freq),
			Array.geom(12, 1, rrand(0.7,0.9)),
			Array.fill(12, {rrand(1.0,3.0)})
		], {ClipNoise.ar(0.003)}.dup).softclip
		* amp
		* EnvGen.kr(env, gate, doneAction: 2);
	sig = LPF.ar(sig, ffreq);
	Out.ar(0, sig ! 2)
}).store;

SynthDef(\p_piano, { arg freq = 440, gate = 1, amp = 0.5, slideTime = 0.17, ffreq = 1100;
	var	sig, delayTime, detune, strike, hammerEnv, hammer, env = Env.adsr(0.01, 0.3, 0.4, 0.1);
	freq = Lag.kr(freq, slideTime);
	strike = Impulse.ar(0.1+0.4.rand, 2pi.rand, 0.1); // random period for each key
	hammerEnv = Decay2.ar(strike, 0.008, 0.04); // excitation envelope

	sig= Pan2.ar(
			// array of 3 strings per note
			Mix.ar(Array.fill(3, { arg i;
				// detune strings, calculate delay time :
				detune = #[-0.05, 0, 0.04].at(i);
				delayTime = 1 / (freq.cpsmidi + detune).midicps;
				// each string gets own exciter :
				hammer = LFNoise2.ar(3000, hammerEnv); // 3000 Hz was chosen by ear..
				CombL.ar(hammer,		// used as a string resonator
					delayTime, 		// max delay time
					delayTime,			// actual delay time
					6) 				// decay time of string
			})),
			Rand(-0.5, 0.5)
		)
		* amp
		* EnvGen.kr(env, gate, doneAction: 2);
	sig = LPF.ar(sig, ffreq);
	Out.ar(0, sig ! 2)
}).store;
)


// Routines - more irregular
(
var pScale;
var r1a, r1b, r1c, r1d, r1e, r2a;
var durations= #[ 0.0625, 0.125, 0.375, 0.25, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2, 2.25, 2.5, 2.75, 3, 4 ],
	strictLong= #[ 0, 0, 0, 0, 1, 0, 1, 2, 2, 2, 3, 4, 4, 5, 6, 7 ].normalizeSum,
	tendLong= #[ 1, 1, 1, 2, 2, 4, 4, 4, 4, 7, 5, 5, 5, 6, 6, 4 ].normalizeSum,
	strictShrt= #[ 7, 7, 7, 5, 4, 3, 2, 1, 0, 0, 1, 0, 2, 0, 0, 0 ].normalizeSum,
	tendShrt= #[ 7, 5, 7, 8, 7, 6, 5, 4, 3, 2, 1, 1, 0, 0, 0, 0 ].normalizeSum;
var syn1, syn2, syn3, noteDur, restDur, currScale, noteStart, slideEnv;

TempoClock.default.tempo = 70/60;

pScale= Prout({
	var scl= [ #[0,2,3,7,9], #[0,1,5,6,10], #[0,4,5,7,10] ];
	loop({
		scl.choose.yield;
	})
}).asStream;

r1a= Routine({
	inf.do({
		currScale= pScale.next;
		rrand(2, currScale.size).do({
			noteDur= durations.wchoose(strictLong);
			restDur= durations.wchoose(tendShrt);
			syn1= Synth(\p_bowedstring, [\amp, 0.5, \freq, (44+currScale.choose).midicps, \dec, noteDur]);
			noteDur.wait;
			syn1.set(\gate, 0);
			[\r1a, restDur].postln;
			restDur.max(0.01).wait;
		});
		0.01.wait;
	})
});

r1d= Routine({
	var direct;
	inf.do({
		currScale= pScale.next;
		rrand(2, currScale.size).do({
			noteDur= durations.wchoose(strictLong);
			restDur= durations.wchoose(tendShrt);
			direct= [-1,1].choose;
			noteStart= if(direct == 1, { currScale[0] }, { currScale[currScale.size-1] });
			noteStart= noteStart + [44, 84].choose;
			syn2= Synth(\p_piano, [\amp, 1, \freq, noteStart.midicps, \dec, noteDur]);
			slideEnv= Env.new([noteStart, noteStart+(direct*[5,12,22].choose)], [noteDur], 'exponential').asStream;
			rrand(100, 200).do({ |i|
				var nxt;
				nxt= slideEnv.next.midicps;
				//[\nxtnote, nxt].postln;
				syn2.set(\freq, nxt);
				0.01.wait;
			});
			syn2.set(\gate, 0);
			[\r1d, restDur].postln;
			restDur.max(0.01).wait;
		});
		0.01.wait;
	})
});

r2a= Routine({
	var stepsUp, stepsDown, indNext=0, i= 0, baseNote;
	inf.do({
		stepsUp= rrand(4, 10);
		stepsDown= rrand(13, 15) - stepsUp;
		currScale= pScale.next;
		baseNote= [44, 64, 70].choose;
		rrand(currScale.size, currScale.size+10).do({ // rand melody - in-between 4 and 11 notes
			if(i < stepsUp, {
				indNext= (indNext+[0,1,2,3].choose).min(currScale.size-1);
			}, {
				indNext= (indNext-[0,1,2,3].choose).max(0);
			});
			[i, stepsUp, indNext].postln;
			noteDur= durations.wchoose(strictShrt);
			restDur= durations.wchoose(tendShrt);
			syn3= Synth(\p_bowedstring, [\amp, 0.5, \freq, (baseNote+currScale[indNext]).midicps, \dec, noteDur]);
			noteDur.wait;
			syn3.set(\gate, 0);
			[\r2a, restDur].postln;
			i= i+1;
			restDur.max(0.01).wait;
		});
		i= 0;
		restDur.max(1)*3.wait; // make a long pause between phrases
	})
});

r1a.play(TempoClock(0.8));
r1d.play(TempoClock(0.5));
//r2a.play(TempoClock(120/60));
)