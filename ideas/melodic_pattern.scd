s.boot

(
SynthDef("moog", {
    arg out=0, trigID=80, freq=432, amp=1.0, pan=0,
        gate=1, atk=0.01, sustain=1, rel=0.5, ca=1, cr= -1,
        cutoff=750, rq=0.5;
    var signal, env;
    env = EnvGen.kr(Env.new([0, 1, 0], [atk, rel], [ca, cr]), doneAction: 2);
    signal = Mix.fill(8, {LFSaw.ar(freq) * 0.1});
    signal = RLPF.ar(RLPF.ar(signal, cutoff, rq), cutoff, rq);
    signal = signal * env;
    Out.ar(out, Pan2.ar(signal, pan, amp))
}).add;
)

(
Pdef(
    \moogpat,
    Pbind(
        \instrument, \moog,
        \dur, Pseq([
            1/4,
            1/8, 1/16, 1/16, 1/16, 1/16,
            1/8, 1/16, 1/16, 1/16, 1/16,
            1/8, 1/8, 1/16, 1/8, 1/8], inf),
        \stretch, 60/80 * 4,
        \scale, #[0, 3, 5, 6, 7, 10],
        \mtranspose, Pxrand((-9..2), inf),
        \degree, Pxrand([0, 3, 5, 6, 7, 10], inf),
        \atk, 0.005,
        \rel, Pseq([
            Pwhite(1, 2, 1),
            Pxrand((0.2..1), 14),
        ], inf),
        \amp, Pexprand(0.05, 0.5, inf),
        \pan, Pwhite(-0.4, 0.4, inf)
    )
).play;
)

s.plotTree