\version "2.14.2"

\paper {
	top-system-spacing #'basic-distance = #10
	score-system-spacing #'basic-distance = #20
	system-system-spacing #'basic-distance = #20
	last-bottom-spacing #'basic-distance = #10}

tFifthForths= \time 5/4
interBass= { 
	c8 c8 c8 c8 c4 c4 c4 c8 c8 c8 g8 g4 g4 g4 g8 g8 g8 g8 g4 g4 g4 g8 g8 gis8 gis8 gis4 gis4 g4 g64 
	}

interTenor= { 
	r1
	c''8 c''8 c''8 c''8 c''4 c''4 c''4 c''8 c''8 c''8 c''8 c''4 g''4 g''4 g''8 g''8 g''8 gis''8 gis''4 gis''4 bes''4 r4 bes''64
	}
 
interSoprI= { 
	r1 r4
	r1 r4
	gis''8 gis''8 gis''8 gis''8 gis''4 gis''4 gis''4 gis''8 gis''8 gis''8 gis''8 gis''4 gis''4 gis''4 gis''64
	}

interSoprII= { 
	r1 r4
	r1 r4
	r1 r4
	e'''1~ e'''1~ e'''1.  e'''4
	}

\score {
	\new ChoirStaff <<
		\new Staff = "highI" <<
			\clef treble
			\new Voice = "soprano" {
				\voiceOne
				<< \tFifthForths \interSoprII >>
			}
		>>
		\new Staff = "highI" <<
			\clef treble
			\new Voice = "soprano" {
				\voiceTwo
				<< \tFifthForths \interSoprI >>
			}
		>>
		\new Staff = "mid" <<
			\clef treble
			\new Voice = "tenor" {
				\voiceOne
				<< \tFifthForths \interTenor >>
			}
		>>
		\new Staff = "low" <<
			\clef bass
			\new Voice = "bass" {
				\voiceOne
				<< \tFifthForths \interBass >>
			}
		>>
	>>
}