(
x = {
    [TDuty, Duty].collect { |n|
        n.ar(
            0.0005,
            0,
            Dseq([1, 7, 3], inf)
        )
    }
}.plot(bounds: 1100@600).parent.name_("TDuty vs. Duty");
)

[38, 43, 47, 50].midinote

~bufScale.plot.plotMode_(\plines)
Scale.ionian.degrees

(
[0, 2, -1, -3].do { |d|
    d.postln;
    { DegreeToKey.ar(~bufScale, d + [0, 3, 5, 7]).poll }.play
}
)

(
f = List.new;
[ [-1, 4, 7, 11], [4, 9, 12, 16], [-5, 0, 4, 7], [0, 5, 9, 12] ].do { |chord|
    f.add((chord + ~rootNote.notemidi).midiname)
};
f.do(_.postln)
)

~rootNote.notemidi.midiname

[ F#1, B1, D2, F#2 ]
[ B1, E2, G2, B2 ]
[ D1, G1, B1, D2 ]
[ G1, C2, E2, G2 ]


-> G1


[0, 1, 2, 3] [0, 2, -1, -3]


Duty.ar(
    dur: 1/4,
    reset: 0,
    level: Dseq(
        Ddup(4, Dseries(0, 1, 4)) + Dseq([0, Drand([2, 3, 4], 1), -1, Drand([-3, -4, -5], 1)], 4),
        inf
    )
);
