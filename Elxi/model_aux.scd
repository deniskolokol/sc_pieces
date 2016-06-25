// to work with superfomus (issues - wrong durations, no support for >1 staffs)
f = Fomus()
f.put(p2i.value(4, -18, -6, 0, "bass").asStream(~tempo), 55)
f.ly
// 1st interlude ~~ 10s
// time 5/4
~interludeI= Ptpar([
	0.0, p2i.value(4, -18, -6, 0, "bass"), // D1 + 24 (midinote) [0, 1, 5, 10]
	1.0.ceil, p2i.value(3, -2, 10, 0, "tenor"), // Eb2 + 12
	2.0.ceil, p2i.value(2, 8, 20, 0, "sopranoI"), // D4 + 12
	4.5.ceil, p1s.value(1, 8, 24, 0, "sopranoII") // D4 + 24
//	0.0, pRest.value(1, 0, 1.0.ceil, 4, "tenor"), // rest
//	0.0, pRest.value(1, 0, 2.0.ceil, 4, "sopranoI"), // rest
//	0.0, pRest.value(1, 0, 4.5.ceil, 4, "sopranoII"), // rest
	], 1);

// patterns should be changed like this:

		\note, Pseq([
			PdegreeToKey(Pkey(\ly).linlin(-100,100, lo, hi).round(0.5), ~scl1[scalenum], 12),
			Pwrand([
				PdegreeToKey(Pkey(\ly).linlin(-100,100, lo, hi).round(0.5), ~scl1[scalenum], 12),
				\rest ],
				[ 0.8, 0.2 ], 1 )
			], cycles).trace(prefix:"event:voice,"++voicetype++",midinote,"),
