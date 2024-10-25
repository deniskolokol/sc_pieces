(
// BUFFERS
SynthDef(\bufplay, {
    arg out=0, buf=0, rate=1, amp=1, pan=0;
    var signal = PlayBuf.ar(1, buf, BufRateScale.ir(buf)*rate, doneAction: 2);
    signal = signal * amp;
    signal = Pan2.ar(signal, pan);
    Out.ar(out, signal)
}).add;


// FX
SynthDef(\reverb, {
    arg in, out=0, predelay=0.1, revtime=1.8, lpf=4500, amp=1, mix=0.15;
    var dry, wet, temp, sig;
    dry = In.ar(in, 2);
    temp = In.ar(in, 2);
    wet = 0; // or `DC.ar(0)!2` or `Silent.ar(2)`
    temp = DelayN.ar(temp, 0.2, predelay);
    16.do {
        temp = AllpassN.ar(temp, 0.05, {Rand(0.001, 0.05)}!2, revtime);
        temp = LPF.ar(temp, lpf);
        wet = wet + temp
    };
    sig = XFade2.ar(dry, wet, mix*2-1, amp);
    Out.ar(out, sig);
}).add;
)