0
s.boot

p = Pbind(
	\note, Pif(Pwhite(0.0, 1.0, inf) < 0.7, Pwhite(-7.0, 0, inf), Pwhite(7.0, 14, inf)),
	\dur, Prand([0.1, 0.1, 0.1, 0.1, 0.2, 0.3], inf)
);

p.play

f = Fomus()
f.put(p.asStream, 40)
f.ly
f.midi
f.xml

p = Pbind(
	\note, Prand((-12,-11.5..24), inf),
	\dur, Prand([0.125, 0.25, 0.3], inf)
);

p= Pbind(
	\note, Pseq([0, 11], inf),
	\dur, Pxrand([
		Pseq([1/4, 1/16, 1/8, 1/8, 1/4, 1/16, 1/8, 1/8, Prand([1/2, 3/4], 1), 1/8], inf),
		Pseq([1/8, 1/8, 3/4, 1/16, 1/8, 1/8, 1/16, 1/16, 1/8, 1/8], 1) // to match the number: last 1/4= 1/16+1/16+1/8 legato
		], inf),
	\legato, Pxrand([
		Pseq([0.7, 1.2, 1, 0.7, 1, 1.3, 1, 1, 1, 0.1], 1),
		Pseq([0.7, 0.7, 1.3, 0.5, 1.3, 1.3, 0.7, 1, 1, 0.1], 1)
		], inf)
	)

p.play;

f = Fomus()
f.put(p.asStream, 50)
f.ly
f.midi
f.xml

f.fileName = "~/Desktop/SuperFomusTest"

(
p= Pbind(
	\amp, 0.5,
	\midinote, Pseq([
		54,
		Pwrand([
			60,
			65 ],
			[ 0.8, 0.2 ], 1 )
		], inf).trace(prefix:"event:voice,"++"bass"++",midinote,"),
	\dur, Pseq([ [1, 0.75, 0.3].choose, 1/4], inf).trace(prefix:"event:voice,"++"bass"++",dur,")
	)
)

p.play