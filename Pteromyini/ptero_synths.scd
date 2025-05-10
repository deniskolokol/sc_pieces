// Synth Defs

(
SynthDef(\moogy_1, {
    arg amp=0.2, freq=110, bufnum=0, cutoff=100, gain=2,
    atk=0.1, dec=0.1, rel=0.1,
    spread=0.6, center=(-0.2), out=0, fx=0, fxsend=(-25);

    var signal, env, freqOsc, trig, degree;

    env = Env.adsr(atk, dec, 1, rel).ar(Done.freeSelf, \gate.kr(1));
    degree = Duty.ar(
        Dseq([
            Dseq([1/4, 1/8], 4),
            Dseq([1/8], 4)
        ], inf),
        0,
        Dseq([0, Drand([2, 3, 4], 1), -1, -3], inf)
    );
    freqOsc = (DegreeToKey.ar(bufnum, degree) + freq.cpsmidi).midicps;
    freqOsc = freqOsc * { Rand(-0.1, 0.1).midiratio }.dup(4);
    signal = Saw.ar(freqOsc);
    signal = Splay.ar(signal, spread, center:center);
    signal = MoogFF.ar(signal, cutoff, gain, mul:amp);
    signal = signal * env;

    //direct out
    Out.ar(out, signal);

    // FX send
    Out.ar(fx, signal * fxsend.dbamp);
}).add;

SynthDef(\groove_drumline_1, {
    arg tempo=2, out=0, pan=0, amp=1, atk=0.1, dec=0.1, rel=0.1, ca=6, cr=(-3),
    fx=0, fxsend=(-25);

    var envPerc = Env.perc(0, 0.2, 1, -5);
    // var trig = TDuty.kr(
    //     [0.5, 1, 0.25] / tempo,
    //     TDuty.kr(
    //         Dser([0.75, 0.75, 0.5]/tempo, inf)
    //     )
    // );
    var trig = TDuty.kr(
        [0.5, 1, 0.25] / tempo,
        TDuty.kr(
            Dser([0.75, 0.75, 0.5]/tempo, inf)
        )
    );
    var kick = Ringz.ar(T2A.ar([trig[0], trig[1]]), [45, 330], [0.5, 0.1], [0.9, 0.1]);
    var pulse = Ringz.ar(T2A.ar(trig[2]), 90, 0.2,2).clip*0.2;
    var hat = HPF.ar(
        LPF.ar(
            WhiteNoise.ar(Decay2.ar(LFNoise1.ar(8, 0.3, 0.5), 0.02, 0.1)),
            1678
        ),
        17774
    ) * EnvGen.kr(envPerc, trig[1]);
    var snare = BPF.ar(LFNoise0.ar(98**2,0.4), 98**2, 1, 0.04)
    * EnvGen.kr(envPerc, trig[1]);
    var signal = MidEQ.ar(
        kick
        +
        snare
        +
        hat
        +
        pulse,
        14000, 0.7, 8
    );
    var env = Env.adsr(atk, dec, 1, rel).ar(Done.freeSelf, \gate.kr(1));
    signal = Limiter.ar(signal, amp) * env;
    signal = Pan2.ar(signal, pan);

    //direct out
    Out.ar(out, signal);

    // FX send
    Out.ar(fx, signal * fxsend.dbamp);
}).add;
)