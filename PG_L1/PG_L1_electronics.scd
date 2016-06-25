// TO-DO:
// It is ugly solution to send interface values as function's parameters. Move it all to the `param` dictionary!

// ==== PG/L1 ====
// ---- CONTROLS ----
(
var wetBus= 16, effBus= 30;
var effSynthName= \pgl1_comb;
var synthNames= List[\pgl1_lflow, \pgl1_lfmid, \pgl1_lfmip, \pgl1_lfs];
var synthArgs= List[
	[\dryBus, 0, \wetBus, wetBus, \amp, 0.5, \dry, 1],
	[\dryBus, 2, \wetBus, wetBus, \amp, 0.5, \dry, 1],
	[\dryBus, 4, \wetBus, wetBus, \amp, 0.5, \dry, 1],
	[\dryBus, 6, \wetBus, wetBus, \amp, 0.5, \dry, 1]
];
var synthCtrlArgs= List[ [\kr_ml0, 0], [\kr_mg2, 1], [\kr_mg0, 2], [\kr_ml1, 3], [\kr_mg1, 4], [\kr_mh0, 5] ]; //[\synthName, ctrl bus]
var effSynth;
var synthList= [nil, nil, nil, nil];
var synthCtrl= List.new;
var channels= 52, chlistMono= Array.fill(channels, nil);
//MIDI
var ccResp, nOnResp, midiSrc= 1219363690; // X-Session Pro
//functions
var startStopSynth, setParam;
//interface
var w; //main window
var wLeft= 412, wTop= 500, wWidth= 500, wHeight= 260, ctrlTop= 20, ctrlHeight= 40;
var cvMainColor= Color.new255(210, 180, 140, 80), btColorOff=Color.new255(250, 250, 250), btColorOn=Color.new255(43, 43, 43), btColorBG = Color.new255(248, 248, 255);
var globalFont1=Font("Helvetica", 9);
var cvSynths, cvStreams, btSynthList= List.new, msvCtrlSwitch, pmDryBus= List.new, knWetLevel= List.new, knAmp= List.new;
var btTask= List.new;
//streams
var streamList= [nil], fillStream;
var arrBase= #[0, 2, 3, 6], arrDer0= #[2, 3, 6, 7];

channels.do({ |i| chlistMono.put(i, i.asSymbol) }); //fill channels list

// interface - window
w= Window("PG_L1 ctrl", Rect(wLeft, wTop, wWidth, wHeight), resizable:false);
cvSynths= CompositeView(w,Rect(5, 5, wWidth-10, ctrlHeight*synthNames.size+30)) //synth panel
	.background_(cvMainColor);
StaticText(cvSynths,Rect(ctrlHeight+65, 0, 40, 25)) //synths volume
	.string_("vol")
	.font_(globalFont1);
StaticText(cvSynths,Rect(ctrlHeight+105, 0, 40, 25)) //"send" label
	.string_("send")
	.font_(globalFont1);

synthList.size.do({ |i| // synth switch on/off
    btSynthList.add( // interface - synth on/off buttons
        Button(cvSynths, Rect(10, i*ctrlHeight+ctrlTop, 80, ctrlHeight))
        .states_([
            [synthNames[i].asString, btColorOn, btColorOff],
            [synthNames[i].asString, btColorOff, btColorOn]
        ])
        .canFocus_(false)
        .action_({ |bt| startStopSynth.value(i, synthArgs[i], knAmp[i].value)})
    );
	knAmp.add( //synths amp
        Knob(cvSynths,Rect(100, btSynthList[i].bounds.top+5, 30, 19))
        .value_(synthArgs[i][5])
        .action_({ |kn|
            synthArgs[i][5]= kn.value;
            setParam.value(i, synthArgs[i][4], synthArgs[i][5])
        });
    );
	knWetLevel.add( //dry/wet level
        Knob(cvSynths,Rect(140, btSynthList[i].bounds.top+5, 30, 19))
        .action_({ |kn|
            synthArgs[i][7]= 1-kn.value;
            setParam.value(i, synthArgs[i][6], synthArgs[i][7])
        });
    );
    pmDryBus.add( //dry signal busses
        PopUpMenu(cvSynths,Rect(440, btSynthList[i].bounds.top, 40, 19))
        .background_(btColorBG)
        .canFocus_(false)
        .font_(globalFont1)
        .items_(chlistMono)
        .value_(synthArgs[i][1])
        .action_({ |pm|
            synthArgs[i][1]= pm.value;
            if(synthList[i] != nil, {synthList[i].set(\dryBus, pm.value)});
        });
    );
});

StaticText(cvSynths,Rect(ctrlHeight+153, 0, 30, 25)) //ctrl synth labels
	.string_("---")
	.font_(globalFont1);

synthCtrlArgs.size.do({ |i|
	StaticText(cvSynths,Rect(135+(ctrlHeight*2)+((ctrlHeight-5)*i), 0, ctrlHeight-10, 25)) //ctrl synth labels
		.string_(synthCtrlArgs[i][0].asString.replace("kr_", ""))
		.font_(globalFont1);
});
// WARNING! elaborate the same interface with Grid (see help)
msvCtrlSwitch = MultiSliderView(cvSynths,Rect(180, ctrlTop, 235, synthList.size*ctrlHeight)) // interface - synth to control buss
	.step_(1/synthCtrlArgs.size)
	.valueThumbSize_(ctrlHeight-10)
	.indexThumbSize_(ctrlHeight)
	.indexIsHorizontal_(false)
	.colors_(btColorOff, btColorOn)
	.value_(Array.fill(synthList.size, { 0 })) // size is set automatically when you set the value
	.action_({ |msv|
		var tmpVar;
		synthList.size.do({ |i|
			if(synthList[i] != nil, {
				tmpVar= round(msv.value[i].linlin(0,1, 0,synthCtrlArgs.size), 1);
				if(tmpVar == 0, {
					synthList[i].set(\mod, "c")
				}, {
					synthList[i].set(\mod, "c"++(tmpVar-1).asString)
				})
			})
		});
	});
//stream controls

cvStreams= CompositeView(w,Rect(5, cvSynths.bounds.top+cvSynths.bounds.height+5, 250, ctrlHeight+10)) //synth panel
	.background_(cvMainColor);
btTask.add( //task 1 - melody
	Button(cvStreams, Rect(5, 5, 45, ctrlHeight))
		.states_([
			["Task 1", btColorOn, btColorOff],
			["Task 1", btColorOff, btColorOn]
		])
		.canFocus_(false)
		.action_({ |bt|
			if(bt.value == 1, {
				btTask.size.do({ |j|
					if(btTask[j].value == 1, { // first unpush other buttons
						if(j != 0, { btTask[j].valueAction_(0) })
					})
				});
				fillStream.value(0); // create the stream
				{
					streamList[0].do{ |val|
						var dur;
						val.postln;
						synthList[0].set(\mnote, (val*0.75).midicps);
						synthList[1].set(\mnote, val.midicps);
						synthList[2].set(\mnote, val.midicps);
						synthList[3].set(\mnote, (val * 0.2).midicps, \mod, val.linlin(0,32, 0, -1));
						dur= if(val < 18, {0.25}, {2.0.rand});
						dur.wait;
					}
				}.fork(TempoClock());
			}, {
				streamList[0].stop; streamList[0]= nil
			});
		});
);
btTask.add( //task 2 - melody with dynamics
	Button(cvStreams, Rect(55, 5, 45, ctrlHeight))
		.states_([
			["Task 2", btColorOn, btColorOff],
			["Task 2", btColorOff, btColorOn]
		])
		.canFocus_(false)
		.action_({ |bt|
			if(bt.value == 1, {
				btTask.size.do({ |j|
					if(btTask[j].value == 1, { // first unpush other buttons
						if(j != 1, { btTask[j].valueAction_(0) })
					})
				});
				fillStream.value(0); // create the stream
				{
					streamList[0].do{ |val|
						var dur;
						val.postln;
						synthList[0].set(\mnote, (val*0.75).midicps, \amp, 0.6);
						synthList[1].set(\mnote, val.midicps, \mod, 0);
						synthList[2].set(\mnote, val.midicps, \mod, 0);
						synthList[3].set(\mnote, (val * 0.2).midicps);
						dur= if(val < 18, {0.25}, {rrand(0.5, 1.5)});

						synthList[0].set(\gate, 1, \att, 0.05);
						synthList[2].set(\gate, 1, \att, 0.5);
						synthList[3].set(\gate, 0, \done, 0, \rel, 0.5);
						if(val < 18, {
							synthList[0].set(\gate, 0, \done, 0, \rel, [0.25, 0.5].choose);
							synthList[3].set(\gate, 1, \att, 0.5);
							2.0.rand.wait;
							synthList[0].set(\gate, 1, \att, rrand(0.05, 0.75));
							synthList[3].set(\gate, 0, \done, 0, \rel, 0.1);
							if(0.3.coin, {
								synthList[1].set(\mnote, val.midicps-12, \mod, val.linexp(0,18, 0.1, 0.6));
								synthList[2].set(\mnote, val.midicps-12, \mod, val.linexp(0,18, 0.1, 0.6));
								[0.15, 0.5].choose.wait;
							});
						}, {
							synthList[0].set(\gate, 1, \att, 0.05);
							synthList[3].set(\gate, 0, \done, 0, \rel, 0.75);
							[0.25, 0.75].choose.wait;
							synthList[3].set(\gate, 1, \att, 0.5);
						});
						dur.wait;
					}
				}.fork(TempoClock());
			}, {
				streamList[0].stop; streamList[0]= nil
			});
		});
);
btTask.add(
	Button(cvStreams, Rect(105, 5, 45, ctrlHeight))
		.states_([
			["Reset", btColorOn, btColorOff]
		])
		.canFocus_(false)
		.action_({ |bt|
			{
				synthList.size.do{ |i|
					if(synthList[i] != nil, {
						synthList[i].set(\mnote, 0)
					})
				}
			}.fork(TempoClock());
		});
);

// :: PROCEDURES ::
// :: start/stop current synth ::
startStopSynth = { arg curr, args;
	if(synthList[curr] == nil, {
		synthList[curr]= Synth.before(effSynth, synthNames[curr], args);
	}, {
		synthList[curr].set(\gate, 0, \done, 2);
		synthList[curr]= nil;
	})
};

// :: start/stop current synth ::
setParam = { arg curr, parm, val;
	if(synthList[curr] != nil, { synthList[curr].set(parm, val) })
};

// :: fill the stream ::
fillStream = { arg curr;
	streamList[curr]= Prout({
		loop {
			rrand(2,10).do({
				0.yield;
				arrBase.choose.yield;
				2.yield;
				arrDer0.choose.yield;
			});
			rrand(3,6).do({
				(arrDer0.choose + #[12, 24].choose).yield;
			});
		}
	}).asStream
};

// control
MIDIClient.init; // intialize the client
13.do({ arg i; MIDIIn.connect(i, MIDIClient.sources.at(i)); });
ccResp = CCResponder({|src, chan, num, val|
	[src,chan,num,val].postln;
    case
    {num == 86} {{btSynthList[0].valueAction_(1-btSynthList[0].value)}.defer}
    {num == 89} {{btSynthList[1].valueAction_(1-btSynthList[1].value)}.defer}
    {num == 119} {{btSynthList[2].valueAction_(1-btSynthList[2].value)}.defer}
    {num == 10} {synthCtrlArgs.size.do({|j| synthCtrl[j].set(\freq, val.linlin(0,127, 1,200))})}
    // Wet ctrl
    {num == 12} {{knWetLevel[0].valueAction_(val.linlin(0,127, 0,1))}.defer}
    {num == 11} {{knWetLevel[1].valueAction_(val.linlin(0,127, 0,1))}.defer}
    {num == 14} {{knWetLevel[2].valueAction_(val.linlin(0,127, 0,1))}.defer}
    {num == 15} {{knWetLevel[3].valueAction_(val.linlin(0,127, 0,1))}.defer}
    {(num >= 52) && (num < 56)} {{knAmp[num-52].valueAction_(val.linlin(0,127, 0,1))}.defer}
   },
    midiSrc, nil, nil, nil
);
nOnResp = NoteOnResponder({|src, chan, num, val|
    //	[src,chan,num,val].postln;
    case
    {num == 46} {{btSynthList[0].valueAction_(1-btSynthList[0].value)}.defer}
    {num == 43} {{btSynthList[1].valueAction_(1-btSynthList[1].value)}.defer}
    {num == 56} {{btSynthList[2].valueAction_(1-btSynthList[2].value)}.defer}
    {num == 57} {{btSynthList[3].valueAction_(1-btSynthList[3].value)}.defer}
    },
    midiSrc, nil, nil, nil
);

//effect synth goes to channels [0,1]
effSynth= Synth(effSynthName, [\inBus, wetBus, \outBus, effBus]);
//control rate synths
synthCtrlArgs.size.do({ |i|
	synthCtrl.add(Synth(synthCtrlArgs[i][0].asSymbol, [\outbus, synthCtrlArgs[i][1]]));
});

w.refresh;
w.front;

w.onClose = {
	synthList.size.do({ |i|
		synthList[i].set(\gate, 0);
		synthCtrl[i].free;
	});
	effSynth.free;
	ccResp.remove;
};
)

// ---- SYNTHS ----
(

SynthDef(\pgl1_lflow, { arg dryBus= 0, wetBus, mod= 0, panidx= 0.8, panshift= 0, amp= 0.1, dry= 0.5, mnote= 0, att= 0.25, rel= 1, crva= 3, crvr= -3, gate= 1, done= 2;
	var env, out, scale = FloatArray[0,2,5,7,10]; // scale
	env= EnvGen.kr( Env.asr(att, 1, rel, [crva, crvr]), gate: gate, doneAction: done );
	out= PanX.ar(4,
		LPF.ar(
			LFSaw.ar( mnote + LinLin.kr(mod, -1, 1, 0.01, MouseY.kr(1.5, 0.02, 1))*100 + #[300, 301, 80, 81], 0, 0.8 ).mean,
		2000),
		mod.linlin(-1, 1, -0.1, 1.1),
		amp*mod.linlin(-1, 1, 0.3, 1),
		4
	);
	Out.ar(dryBus, env * out);
	Out.ar(wetBus, env * out * (1 - dry));
}).load(s);

SynthDef(\pgl1_lfmid, { arg dryBus= 0, wetBus, mod= 0, panidx= 0.8, panshift= 0, amp= 0.1, dry= 0.5, mnote= 0, att= 0.25, rel= 1, crva= 3, crvr= -3, gate= 1, done= 2;
	var env, out;
	env= EnvGen.kr( Env.asr(att, 1, rel, [crva, crvr]), gate: gate, doneAction: done );
	out= PanX.ar(4,
		RLPF.ar(
			LFSaw.ar(mnote + LinLin.kr(mod, -1, 1, 0.1, 54) + #[300, 301, 80, 81], 0, 0.8).mean,
			LinLin.kr(mod, -1, 1, 10, 102).midicps, 0.1, 1
		) * 0.5,
		mod.linlin(-1, 1, -0.1, 1.1),
		amp * mod.linlin(-1,1, 0.2, 0.4),
		4
	);
	Out.ar(dryBus, env * out);
	Out.ar(wetBus, env * out * (1 - dry));
}).load(s);

SynthDef(\pgl1_lfmip, { arg dryBus= 0, wetBus, mod= 0, panidx= 0.8, panshift= 0, amp= 0.1, dry= 0.5, mnote= 0, att= 0.25, rel= 1, crva= 3, crvr= -3, gate= 1, done= 2, freqBase= 85;
	var env, out;
	env= EnvGen.kr( Env.asr(att, 1, rel, [crva, crvr]), gate: gate, doneAction: done );
	out= PanX.ar(4,
			RLPF.ar(
				LFSaw.ar(mnote + freqBase + mod.linlin(-1,1, -40, 40)),
				LinLin.kr(mod, -1, 1, 80, 30).midicps, 0.1, 1
			) * 0.5,
		mod.linlin(-1, 1, -0.1, 1.1),
		amp * mod.linlin(-1,1, 0.01, 0.2),
		4
	);
	Out.ar(dryBus, env * out);
	Out.ar(wetBus, env * out * (1 - dry));
}).load(s);

SynthDef(\pgl1_lfs, { arg dryBus= 0, wetBus, mod= 0, panidx= 0.8, panshift= 0, amp= 0.1, dry= 0.5, freqBase=85, mnote= 0, att= 0.25, rel= 1, crva= 3, crvr= -3, gate= 1, done= 2;
	var env, out;
	env= EnvGen.kr( Env.asr(att, 1, rel, [crva, crvr]), gate: gate, doneAction: done );
	out= PanX.ar(4,
		LFSaw.ar(mnote + freqBase + mod.linlin(-1,1, -50, 0)),
		mod.linlin(-1, 1, -0.1, 1.1),
		amp * mod.linlin(-1,1, 0.1, 0.3) * 0.3,
		4
	);
	Out.ar(dryBus, env * out);
	Out.ar(wetBus, env * out * (1 - dry));
}).load(s);


//SynthDef(\pgl1_lflow, { arg dryBus= 0, wetBus, mod= 0, panidx= 0.8, panshift= 0, amp= 0.1, dry= 0.5, mnote= 0, att= 0.25, rel= 1, crva= 3, crvr= -3, gate= 1, done= 2;
//	var env, out, scale = FloatArray[0,2,5,7,10]; // scale
//	env= EnvGen.kr( Env.asr(att, 1, rel, [crva, crvr]), gate: gate, doneAction: done );
//	out= Pan2.ar(
//		LPF.ar(
//			LFSaw.ar( mnote + LinLin.kr(mod, -1, 1, 0.01, MouseY.kr(1.5, 0.02, 1))*100 + #[300, 301, 80, 81], 0, 0.8 ).mean,
//		2000),
//		mod*panidx,
//		amp*mod.linlin(-1, 1, 0.3, 1)
//	);
//	Out.ar(dryBus, env * out);
//	Out.ar(wetBus, env * out * (1 - dry));
//}).load(s);
//
//SynthDef(\pgl1_lfmid, { arg dryBus= 0, wetBus, mod= 0, panidx= 0.8, panshift= 0, amp= 0.1, dry= 0.5, mnote= 0, att= 0.25, rel= 1, crva= 3, crvr= -3, gate= 1, done= 2;
//	var env, out;
//	env= EnvGen.kr( Env.asr(att, 1, rel, [crva, crvr]), gate: gate, doneAction: done );
//	out= Pan2.ar(
//		RLPF.ar(
//			LFSaw.ar(mnote + LinLin.kr(mod, -1, 1, 0.1, 54) + #[300, 301, 80, 81], 0, 0.8).mean,
//			LinLin.kr(mod, -1, 1, 10, 102).midicps, 0.1, 1
//		) * 0.5,
//		mod * [1, -1].choose * panidx,
//		amp * mod.linlin(-1,1, 0.2, 0.4)
//	);
//	Out.ar(dryBus, env * out);
//	Out.ar(wetBus, env * out * (1 - dry));
//}).load(s);
//
//
//SynthDef(\pgl1_lfmip, { arg dryBus= 0, wetBus, mod= 0, panidx= 0.8, panshift= 0, amp= 0.1, dry= 0.5, mnote= 0, att= 0.25, rel= 1, crva= 3, crvr= -3, gate= 1, done= 2, freqBase= 85;
//	var env, out;
//	env= EnvGen.kr( Env.asr(att, 1, rel, [crva, crvr]), gate: gate, doneAction: done );
//	out= Pan2.ar(
//			RLPF.ar(
//				LFSaw.ar(mnote + freqBase + mod.linlin(-1,1, -40, 40)),
//				LinLin.kr(mod, -1, 1, 80, 30).midicps, 0.1, 1
//			) * 0.5,
//		mod * [1, -1].choose * panidx,
//		amp * mod.linlin(-1,1, 0.01, 0.2)
//	);
//	Out.ar(dryBus, env * out);
//	Out.ar(wetBus, env * out * (1 - dry));
//}).load(s);
//
//SynthDef(\pgl1_lfs, { arg dryBus= 0, wetBus, mod= 0, panidx= 0.8, panshift= 0, amp= 0.1, dry= 0.5, freqBase=85, mnote= 0, att= 0.25, rel= 1, crva= 3, crvr= -3, gate= 1, done= 2;
//	var env, out;
//	env= EnvGen.kr( Env.asr(att, 1, rel, [crva, crvr]), gate: gate, doneAction: done );
//	out= Pan2.ar(
//		LFSaw.ar(mnote + freqBase + mod.linlin(-1,1, -50, 0)),
//		mod * [1, -1].choose,
//		amp * mod.linlin(-1,1, 0.1, 0.3) * 0.3
//	);
//	Out.ar(dryBus, env * out);
//	Out.ar(wetBus, env * out * (1 - dry));
//}).load(s);

//sum effect synth
SynthDef(\pgl1_comb, { arg outBus= 30, inBus;
	var input;
	input = In.ar(inBus, 2);
	CombN.ar(input, 0.31, 0.31, 2);
	Out.ar(outBus, input);
}).load(s);

//control synths - mod
SynthDef(\kr_ml0, { arg outbus= 0, att= 0.1, rel= 1, crva= -3, crvr= 3, gate= 1;
	var env, mod;
	env= EnvGen.kr( Env.asr(att, 1, rel, [crva, crvr]), gate: gate, doneAction: 2 );
	mod= env * LorenzL.ar( SinOsc.kr(0.1,20,0.49,0.51), LFNoise0.kr(5, 1, 25), LFNoise0.kr(1, 2, 15), LFNoise0.kr(10, 2, 1) );
	Out.kr(outbus, mod)
}).load(s);

SynthDef(\kr_mg2, { arg outbus= 0, att= 0.1, rel= 1, crva= -3, crvr= 3, gate= 1;
	var env, mod;
	env= EnvGen.kr( Env.asr(att, 1, rel, [crva, crvr]), gate: gate, doneAction: 2 );
	mod= env * Gendy3.kr(2,30,SinOsc.kr(1,0,0.49,0.51),LFNoise0.kr(5, 1, 25), 0.05, SinOsc.kr(0.1,0,0.3,0.1), SinOsc.kr(0.19,0,0.49,0.51),12,10);
	Out.kr(outbus, mod)
}).load(s);

SynthDef(\kr_mg0, { arg outbus= 0, att= 0.1, rel= 1, crva= -3, crvr= 3, gate= 1;
	var env, mod;
	env= EnvGen.kr( Env.asr(att, 1, rel, [crva, crvr]), gate: gate, doneAction: 2 );
	mod= env * Gendy3.kr(6,30,SinOsc.kr(0.1,0,0.49,0.51),SinOsc.kr(0.13,0,0.49,0.51), 0.1, SinOsc.kr(0.27,0,0.49,0.51), SinOsc.kr(0.19,0,0.49,0.51),12,10);
	Out.kr(outbus, mod)
}).load(s);

SynthDef(\kr_mg1, { arg outbus= 0, freq= 1, att= 0.1, rel= 1, crva= -3, crvr= 3, gate= 1;
	var env, mod;
	env= EnvGen.kr( Env.asr(att, 1, rel, [crva, crvr]), gate: gate, doneAction: 2 );
	mod= env * Gendy2.ar(minfreq: freq, maxfreq: freq*5, a:SinOsc.kr(0.4,0,0.05,0.05), c:SinOsc.kr(0.3,0,0.1,0.5), minfreq:0.1);
	Out.kr(outbus, mod)
}).load(s);

SynthDef(\kr_ml1, { arg outbus= 0, freq=100, att= 0.1, rel= 1, crva= -3, crvr= 3, gate= 1;
	var env, mod;
	env= EnvGen.kr( Env.asr(att, 1, rel, [crva, crvr]), gate: gate, doneAction: 2 );
	mod= env * LorenzL.ar( freq, LFNoise0.kr(1, 2, 10), LFNoise0.kr(1, 20, 38), LFNoise0.kr(1, 1.5, 2) );
	Out.kr(outbus, mod)
}).load(s);

SynthDef(\kr_mh0, { arg outbus= 0, att= 0.1, rel= 1, crva= -3, crvr= 3, gate= 1;
	var env, mod;
	env= EnvGen.kr( Env.asr(att, 1, rel, [crva, crvr]), gate: gate, doneAction: 2 );
	mod= env * HenonC.ar( MouseX.kr(1, 200), LFNoise0.kr(1, 0.2, 1.2), LFNoise0.kr(1, 0.15, 0.15) );
	Out.kr(outbus, mod)
}).load(s);
)