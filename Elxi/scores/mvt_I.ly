% Abjad revision 4803
% 2012-01-10 14:46

\version "2.14.2"
\include "english.ly"
%\include "/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/Abjad-2.5-py2.7.egg/abjad/cfg/abjad.scm"
\include "abjad.scm"

#(set-default-paper-size "11x17" 'landscape)
#(set-global-staff-size 12)

\header {
	composer = #"Denis Kolokol, 2012"
	tagline = \markup { "Elxi (pt I), Denis Kolokol, 2012" }
	title = \markup { \bold \sans "Elxi (pt I)" }
}

\layout {
	ragged-right = ##t
}

\paper {
	markup-system-spacing #'basic-distance = #30
	paper-width = #190
	system-system-spacing = #'((spacing . 40) (padding . 10) (stretchability . 0))
}

\score {
	\new Score \with {
		proportionalNotationDuration = #(ly:make-moment 1 18)
	} <<
		\new StaffGroup <<
			\context Staff = "sopranoI" {
				\time 5/4
				\set Staff.instrumentName = \markup { sopranoI (SI) }
				\set Staff.shortInstrumentName = \markup { S I }
				{
					\tempo 4=120
					r4
					r1
				}
				{
					\time 5/4
					c'''4 \p
					c'''8
					c'''8
					c'''2 ~
					c'''4
				}
				{
					\time 5/4
					c'''2.
					r2
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					c'''4 \f \marcato
					c'''4 \p \marcato
					c'''4 \marcato
					c'''4 \marcato
					c'''4 \marcato
				}
				{
					\time 5/4
					c'''4 \marcato
					c'''4 \marcato
					c'''4 \marcato
					r2
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4.
					c''8 \p
					c''4
					c''8
					c''4.
				}
				{
					\time 5/4
					r8
					c''16 \staccato \f
					c''16 \staccato
					r1
				}
				{
					\time 5/4
					c''8
					r8
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					c'''4 \p
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4.
					c'''4 \mf \marcato
					c'''4 \marcato
					c'''4 \marcato
					c'''8 \marcato
				}
				{
					\time 5/4
					r8 
					c'''4 \f \marcato
					c'''4 \mf \> \marcato
					c'''4 \marcato
					c'''4 \mp \marcato
					r8 
				}
				{
					\time 5/4
					c'''8
					r8
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r1
					d''4 -\marcato \mf
				}
				{
					\time 5/4
					d''16 \f
					d''16
					d''8
					d''4
					d''16 \ff
					d''16
					d''8
					d''2
				}
				{
					\time 5/4
					d''1 \f \>
					d''16 \p
					d''8. \marcato
				}
				{
					\time 5/4
					d''16 \p
					d''2. -\marcato
					d''4.. ~
				}
				{
					\time 5/4
					d''16
					d''2
					d''16
					d''8
					d''2
				}
				{
					\time 5/4
					d''1 \p
					d''4 ~
				}
				{
					\time 5/4
					d''16 \p \<
					d''1
					r8. \f
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r8
					r1
					c'''8 \pp ~
				}
				{
					\time 5/4
					c'''4 ~ \p \<
					c'''1 \f
				}
				{
					\time 5/4
					r8
					r1
					c'''8 \f
				}
				{
					\time 5/4
					c'''8 \f
					r8 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r8 
					c'''4 \mf
					c'''16
					c'''8
					c'''8
					c'''4 ~
					c'''16
					c'''8
					c'''8 ~
				}
				{
					\time 5/4
					c'''2
					c'''8 \f
					c'''8
					c'''8
					c'''4.
				}
				{
					\time 5/4
					c'''4. \f ~
					c'''16
					c'''8
					c'''8
					c'''16
					c'''16
					c'''8
					c'''8
					c'''8.~
				}
				{
					\time 5/4
					c'''16
					c'''16
					c'''8
					c'''8
					c'''4 ~
					c'''16
					c'''8
					c'''8
					c'''16
					c'''4
				}
				{
					\time 5/4
					c'''8. \ff
					c'''8
					c'''8
					c'''8
					c'''16
					c'''8
					c'''2 ~
				}
				{
					\time 5/4
					c'''16 \pp
					c'''16
					c'''8
					c'''8
					c'''16
					c'''16
					c'''8
					c'''8
					c'''2 \< ~
				}
				{
					\time 5/4
					c'''8 \p
					r16
					c'''16 \mf -\marcato ~
					c'''1 \>
				}
				{
					\time 5/4
					c'''8 \p
					r8
					c'''4 ~
					c'''2.
				}
				{
					\time 5/4
					c'''4 \ff ~
					c'''1 \pp
				}
				{
					\time 5/4
					c'''4 ~
					c'''1 \mp \<
				}
				{
					\time 5/4
					c'''1 ~
					c'''4 \f
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					e'''1 \ff
				}
				{
					\time 5/4
					e'''4 ~ \f
					e'''1
				}
				{
					\time 5/4
					r4 ~
					e'''4 ~
					e'''2.
				}
				{
					\time 5/4
					e'''4 ~ \f
					e'''1 -\marcato
				}
				{
					\time 5/4
					e'''4
					r4
					e'''4
					r2
				}
				{
					\time 5/4
					r2
					e'''2. \f
				}
				{
					\time 5/4
					e'''4
					e'''1
				}
				{
					\time 5/4
					e'''2 \f
					r2 ~
					e'''4 -\marcato
				}
				{
					\time 5/4
					e'''4
					e'''1
				}
				{
					\time 5/4
					e'''4 ~ \f \<
					e'''1 \ff
				}
				{
					\time 5/4
					e'''2 ~ \>
					e'''8 \p
					r8
					e'''2
				}
				{
					\time 5/4
					e'''4 \p
					e'''1
				}
				{
					\time 5/4
					e'''4
					e'''1 -\marcato
				}
				{
					\time 5/4
					e'''4 \pp (
					r2
					\ottava #1
					c''''2 )
				}
				{
					\time 5/4
					c''''4
					c''''1
				}
				{
					\time 5/4
					c''''2. \p
					r2
				}
				{
					\time 5/4
					c''''4 ~
					c''''1
				}
				{
					\time 5/4
					c''''4 ~ \p
					c''''1
				}
				{
					\time 5/4
					c''''2.
					c''''4
					c''''4
				}
				{
					\time 5/4
					c''''4 \p
					c''''1 \<
				}
				{
					\time 5/4
					c''''4 \ff \>
					c''''1 \mf
				}
				{
					\time 5/4
					c''''4 ~ \mp
					c''''4
					\ottava #0
					r2.
				}
				{
					\time 5/4
					r16
					r4
					e'''4 \f
					e'''16
					e'''8
					e'''8
					e'''4
					e'''16
					e'''16
				}
				{
					\time 5/4
					r16
					e'''8 \f
					e'''2
					e'''8
					e'''8
					e'''8
					e'''8.
				}
				{
					\time 5/4
					e'''2
					r16
					e'''16
					e'''8
					e'''8
					e'''16
					e'''16
					e'''8
					e'''8
				}
				{
					\time 5/4
					e'''4 \mp \<
					e'''16
					e'''8
					e'''8
					e'''4 \p \<
					e'''16
					e'''8
					e'''8 \mf \<
					e'''8
				}
				{
					\time 5/4
					e'''4. ~ \f \<
					e'''8
					e'''8
					e'''8 \fff
					e'''2 \>
				}
				{
					\time 5/4
					e'''4 \f
					e'''16
					e'''8
					e'''8
					e'''16
					e'''16
					e'''8
					e'''8
					e'''4
					e'''16
				}
				{
					\time 5/4
					e'''8
					e'''8
					e'''4
					e'''16
					e'''8
					e'''8
					e'''4..
				}
				{
					\time 5/4
					e'''8. \f
					r16 
					r1
				}
				{
					\time 5/4
					e'''16
					r16
					r8
					r1
				}
				{
					\time 5/4
					r1
					b''4 \mf
				}
				{
					\time 5/4
					b''2.
					r2
				}
				{
					\time 5/4
					r16
					r4
					b''4 \mf
					b''16
					b''8
					b''2 \<
				}
				{
					\time 5/4
					b''4 \f \>
					b''2. \p
					r4
				}
				{
					\time 5/4
					r16 
					b''4 \f
					r2...
				}
				{
					\time 5/4
					b''16
					b''4
					r2...
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r16
					r2
					g'''4 \f
					r4..
				}
				{
					\time 5/4
					r16
					r4
					e'''4 \mf
					e'''8 (
					g''16 )
					r2
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r16
					r2. 
					\ottava #1
					g'''4 \f
					g'''8
					g'''16
				}
				{
					\time 5/4
					r8 
					g'''8 ~
					g'''2
					r2
				}
				{
					\time 5/4
					r8. 
					g'''16 ~
					g'''1 \mf \<
				}
				{
					\time 5/4
					g'''4 \f
					r1
				}
				{
					\time 5/4
					g'''8. \f
					\ottava #0					
					r16
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r1
					\ottava #1
					g'''4 \f ~
				}
				{
					\time 5/4
					g'''8
					\ottava #0
					r8
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4 \!
					\ottava #1
					g'''8 \ff
					g'''4
					g'''8
					g'''2
					\ottava #0
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r8 
					r1 
					c''8 \f
				}
				{
					\time 5/4
					g'8 
					g'8. 
					g'16 
					g'8 
					g'8. 
					g'16 
					g'8 
					g'8. 
					g'16 
					gs'8
				}
				{
					\time 5/4
					gs'8. \ff \<
					gs'16 
					gs'8 
					gs'16 \fff
					c''16 
					c''8 
					c''16 
					c''16 
					f''8 
					g''16 \f
					g''16 
					g''8 
					g''16 
					g''16
				}
				{
					\time 5/4
					g''16
					g''8
					g''8.
					g''16
					g''8
					g''8.
					g''16
					g''8
					g''8.
					g''16
					g''16
				}
				{
					\time 5/4
					g''8 \f
					g''8 
					g''16 
					g''16
					g''16 
					g''8 
					g''16 
					g''16 
					g''8 
					g''16 
					g''16 
					g''8 
					g''16 
					g''16
					g''16
				}
				{
					\time 5/4
					f''16 
					f''8 
					f''16 
					c''8 
					c''8. 
					c''16 
					c''8 
					c''8. 
					gs'16 
					gs'8 
					gs'8
				}
				{
					\time 5/4
					gs'16 \f
					gs'16
					gs'8
					gs'8.
					g'16
					g'8
					g'16
					g'16
					g'8
					g'16
					g'16
					g'8
					g'16
					gs'16
				}
				{
					\time 5/4
					gs'8
					gs'16
					gs'8
					gs'4
					gs'2 ~ \>
					gs'8.
				}
				{
					\time 5/4
					gs'16 \p
					c''4
					c''4 
					c''2 ~
					c''8.
				}
				{
					\time 5/4
					c''16
					c''4
					c''2
					f''4..
				}
				{
					\time 5/4
					f''16 \pp
					f''2
					f''16
					f''8
					f''4
					f''4 ~
				}
				{
					\time 5/4
					f''2
					f''16
					f''8
					f''2
					f''16
				}
				{
					\time 5/4
					f''4 \p \>
					e'2
					gs'4 \pp (
					r4 )
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r1
					r4 (
				}
				{
					\time 5/4
					b''1 ) \f ~
					b''4 \! ~
				}
				{
					\time 5/4
					b''1 ~
					b''4 ~
				}
				{
					\time 5/4
					b''4 ~
					b''32 (
					c'''32 ) \marcato
					r2.
					r8.
				}
			}
			\context Staff = "sopranoII" {
				\set Staff.instrumentName = \markup { sopranoII (SII) }
				\set Staff.shortInstrumentName = \markup { S II }
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					c''4 \pp
					c''16
					c''16
					c''8
					c''4
					c''16
					c''16
					c''8
					c''4 \<
				}
				{
					\time 5/4
					c''4
					c''16 \!
					c''2... \p
				}
				{
					\time 5/4
					c''16 \p
					c''1
					c''8. \marcato ~
				}
				{
					\time 5/4
					c''1 \p \>
					r4 \!
				}
				{
					\time 5/4
					c''16 \f
					c''2
					r16
					r8
					r2
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4. 
					c'''8 \mf
					c'''8
					c'''8 ~
					c'''2 \>
				}
				{
					\time 5/4
					c'''8 ~ \p
					c'''2
					r4. 
					c'''8 ~
					c'''8
				}
				{
					\time 5/4
					c'''4.
					c'''2..
				}
				{
					\time 5/4
					c'''8 \p
					c'''1
					c'''8
				}
				{
					\time 5/4
					c'''1 ~ \<
					c'''4 \mf
				}
				{
					\time 5/4
					c'''1 \pp \<
					c'''4 \mf \> ~
				}
				{
					\time 5/4
					c'''2.
					r2 \!
				}
				{
					\time 5/4
					c'''4. \p
					r2..
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r16 
					r2. 
					c'''4 ~ \p
					c'''16
					c'''16 -\marcato
					c'''16
				}
				{
					\time 5/4
					r16 
					c'''4 \mp \< ~
					c'''16
					c'''16 \p
					r16 
					r8 
					r2 \! 
					e''8 \p
				}
				{
					\time 5/4
					e''4 -\marcato 
					e''1 \mf
				}
				{
					\time 5/4
					e''4.
					r2.
					e''8 \f
				}
				{
					\time 5/4
					e''8 \ff
					r8 
					r1
				}
				{
					\time 5/4
					e''2. \fff
					r2
				}
				{
					\time 5/4
					r8 
					r1  
					c'''8 \f ~
				}
				{
					\time 5/4
					c'''1 \>
					c'''4 \mf
				}
				{
					\time 5/4
					r8
					r1 \!
					c'''8 \f \marcato
				}
				{
					\time 5/4
					r8 
					c'''8 ~
					c'''1
				}
				{
					\time 5/4
					c'''4 -\marcato \f ~
					c'''1
				}
				{
					\time 5/4
					r8 
					c'''4
					r2..
				}
				{
					\time 5/4
					c'''8 \f
					r8
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					c'''4 -\marcato \ff (
					c'''1 \pp )
				}
				{
					\time 5/4
					c'''4 ~
					c'''1 \f \>
				}
				{
					\time 5/4
					c'''2 ~ \p \>
					c'''4 \pp \>
					c'''2~ \ppp
				}
				{
					\time 5/4
					c'''4
					c'''1 \p
				}
				{
					\time 5/4
					c'''4 \p ~
					c'''1
				}
				{
					\time 5/4
					c'''4 \f \< (
					\ottava #1
					c''''1 \ff )
					\ottava #0
				}
				{
					\time 5/4
					\ottava #1
					c'''4 ~ \f
					c'''1
				}
				{
					\time 5/4
					c'''4
					c'''4 ~
					c'''2.
					\ottava #0
				}
				{
					\time 5/4
					\ottava #1
					c'''4 ~ \f
					c'''1
				}
				{
					\time 5/4
					c'''2 ~
					c'''4
					\ottava #0
					r2
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					c'''8 \f
					c'''8
					c'''2. \>
				}
				{
					\time 5/4
					c'''16 \p
					c'''8 
					c'''8 
					c'''16 
					c'''16 
					c'''8 
					c'''8 
					c'''4 
					c'''16 \f
					c'''8 
					c'''8
				}
				{
					\time 5/4
					c'''4 \f
					c'''16
					c'''8
					c'''8
					c'''2
					c'''8
					c'''16
				}
				{
					\time 5/4
					c'''16 
					c'''8 
					c'''2. 
					c'''16 
					c'''8 
					c'''8
				}
				{
					\time 5/4
					c'''16 \staccato \f
					e''16 \staccato
					c''8 \p
					c''8 
					c''4 
					c''16 
					c''8 
					c''8 
					c''4 
					c''16
				}
				{
					\time 5/4
					c''8 \ff
					c''8 
					c''2. \p
					c''8 
					c''8 ~
				}
				{
					\time 5/4
					c''8 \p
					c''2. 
					c''16 
					c''8 
					c''8 
					c''16
				}
				{
					\time 5/4
					c''16
					c''8
					c''8
					r2...
				}
				{
					\time 5/4
					r16
					r1
					c'''8. \f
				}
				{
					\time 5/4
					c'''4 (
					c'''1 )
				}
				{
					\time 5/4
					c'''2 \p
					r2.
				}
				{
					\time 5/4
					r16 
					r4 
					c'''4
					c'''16
					c'''8
					c'''2
				}
				{
					\time 5/4
					c'''4 ~ \p
					c'''1
				}
				{
					\time 5/4
					c'''2.
					r16
					r4
					c'''8.
				}
				{
					\time 5/4
					c'''16 \p
					c'''16
					c'''8
					c'''1
				}
				{
					\time 5/4
					c'''4 ~
					c'''1
				}
				{
					\time 5/4
					c'''16
					c'''2 \>
					r4 \!
					r16
					gs''4. \mf
				}
				{
					\time 5/4
					gs''4 ~
					gs''1
				}
				{
					\time 5/4
					gs''16 \p
					gs''4
					gs''4 \mf
					gs''16
					gs''8
					gs''2 \<
				}
				{
					\time 5/4
					gs''4 \f \>
					gs''1 \p
				}
				{
					\time 5/4
					gs''16 \f
					gs''4
					r2...
				}
				{
					\time 5/4
					c'''16 ~
					c'''4 \marcato
					r2...
				}
				{
					\tempo 4=80
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r16
					r1
					e''8. \mf
				}
				{
					\time 5/4
					e''1 \mf \>
					e''4 ~ \p
				}
				{
					\time 5/4
					e''8
					r8
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r2.
					e''2 \p
				}
				{
					\time 5/4
					c''2. (
					r2 )
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r16
					r8 
					r2 
					e''8. \p
					e''16
					e''8
					e''8. ~
				}
				{
					\time 5/4
					e''8 ~
					e''2
					r8 
					r2
				}
				{
					\time 5/4
					r8.
					\ottava #1
					g'''4 \p
					g'''8
					g'''16
					g'''8
					g'''2
				}
				{
					\time 5/4
					g'''8
					r8.
					g'''2...
				}
				{
					\time 5/4
					g'''16 \p
					g'''2
					r16
					r8
					r2
				}
				{
					\time 5/4
					g'''8.
					\ottava #0
					r16
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					gs''4 ~ \ppp
					gs''1
				}
				{
					\time 5/4
					gs''4 ~ \ppp
					gs''1
				}
				{
					\time 5/4
					e''4 ~
					e''1
				}
				{
					\time 5/4
					e''4 \ppp ~
					e''1
				}
				{
					\time 5/4
					e''4 (
					r1 )
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r2
					e''8 \f
					g''8
					g''8
					g''8
					g''8
					r8
				}
				{
					\time 5/4
					g''4 \f
					g''4 
					g''8 
					g''8 
					g''8 
					g''8 
					g''8
					r8 
				}
				{
					\time 5/4
					g''4 
					g''4 
					g''8 
					g''8 
					g''8 
					g''8 
					g''8
					g''8
				}
				{
					\time 5/4
					g''4 \f 
					g''1 ~
				}
				{
					\time 5/4
					g''4 ~
					g''1 ~
				}
				{
					\time 5/4
					g''4
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
			}
			\context Staff = "tenor" {
				\set Staff.instrumentName = \markup { tenor (T) }
				\set Staff.shortInstrumentName = \markup { T }
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					c''8 \pp
					c''4
					c''8
					c''2
					c''16 \staccato
					r8.
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r2.
					c'''8 \p
					c'''4
					c'''8
				}
				{
					\time 5/4
					c'''4 \p
					c'''1
				}
				{
					\time 5/4
					c'''2.
					c'''16
					r4..
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4.
					c''4
					c''8
					c''2
				}
				{
					\time 5/4
					c''4 ~ \mp
					c''1
				}
				{
					\time 5/4
					c''4
					c''1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r8
					r1
					c'''8 \f
				}
				{
					\time 5/4
					c'''4
					c'''2.. \>
					r8 \!
				}
				{
					\time 5/4
					c'''2 \mp
					r8 
					c'''2 ~ \<
					c'''8
				}
				{
					\time 5/4
					c'''2.. \mf
					r4.
				}
				{
					\time 5/4
					c'''8 \mf
					r8
					r1
				}
				{
					\time 5/4
					r1 \!
					c''4 \f
				}
				{
					\time 5/4
					r8 
					c''8 \ff \> ~
					c''1
				}
				{
					\time 5/4
					c''2.. \f
					r4
					c''8 ~
				}
				{
					\time 5/4
					c''8
					r8  
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r16 
					r1 
					g'8 \f ~
					g'16 \p
				}
				{
					\time 5/4
					r8.
					g'8 \pp ~
					g'2...
				}
				{
					\time 5/4
					g'2.. -\marcato \mp
					r8. 
					g'16 ( \pp
					c''8 )
				}
				{
					\time 5/4
					c''4 ~ \p \<
					c''1 \mf
				}
				{
					\time 5/4
					c''4 ~
					c''1
				}
				{
					\time 5/4
					c''4. \mf
					c''4
					r8
					r2
				}
				{
					\time 5/4
					g'8.
					r16 
					r1
				}
				{
					\time 5/4
					r8
					e''4~ \p
					e''16
					e''8
					e''8
					e''4
					e''16
					e''8
					e''8
				}
				{
					\time 5/4
					e''2 ~
					e''8
					e''8
					e''8
					e''4.
				}
				{
					\time 5/4
					e''4. \p ~
					e''16
					e''8
					e''8
					e''16
					e''16
					e''8
					e''8
					e''8. ~
				}
				{
					\time 5/4
					e''16
					e''16
					e''8
					e''8
					e''4 ~
					e''16
					e''8
					e''8
					e''16 ~
					e''4
				}
				{
					\time 5/4
					e''8. \ff
					e''8
					e''8
					e''8
					e'16
					e'8
					e'2 ~
				}
				{
					\time 5/4
					e'16 \pp
					e'16
					e'8
					e'8
					e'16
					e'16
					e'8
					e'8
					e''2 \< ~
				}
				{
					\time 5/4
					e''4 \f
					e''1 \>
				}
				{
					\time 5/4
					e''2. \p
					e''4 -\marcato
					e''4
				}
				{
					\time 5/4
					e''8. \ff
					r16
					e''1 \pp
				}
				{
					\time 5/4
					e''1
					e''4
				}
				{
					\time 5/4
					e''4 \mp \< ~
					e''1
				}
				{
					\time 5/4
					e''4 \p
					e''1
				}
				{
					\time 5/4
					e''4 -\marcato
					r1
				}
				{
					\time 5/4
					r4 \! 
					e''1 \p \<
				}
				{
					\time 5/4
					e''4 \mf
					e''1 \p
				}
				{
					\time 5/4
					e''2 \mf
					r4 \!
					e''4 
					e''4 \f
				}
				{
					\time 5/4
					e''4 -\marcato \mf
					e''1
				}
				{
					\time 5/4
					e''4
					e''1 \ff
				}
				{
					\time 5/4
					e''4 \p
					e''4
					r2.
				}
				{
					\time 5/4
					e''4 \f
					r1
				}
				{
					\time 5/4
					c''4 ~ \mf
					c''1 \>
				}
				{
					\time 5/4
					c''4 -\marcato \!
					c''1 \p
				}
				{
					\time 5/4
					c''4 \p ~
					c''1
				}
				{
					\time 5/4
					c''4 ~
					c''1
				}
				{
					\time 5/4
					c''4 ~ \p
					c''4
					c''2.
				}
				{
					\time 5/4
					c''4
					c''1
				}
				{
					\time 5/4
					c''2 -\marcato \p \>
					c''4 \pp
					r2
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					e''1 \p
				}
				{
					\time 5/4
					e''4 ~
					e''1
				}
				{
					\time 5/4
					r4
					e''4 \p
					e''2.
				}
				{
					\time 5/4
					e''4
					e''1
				}
				{
					\time 5/4
					e''4 \p
					r4
					e''4 ~ \<
					e''2 \ff
				}
				{
					\time 5/4
					e''4 \>
					e''1 \f
				}
				{
					\time 5/4
					e''2. ~ \p
					e''4
					r4
				}
				{
					\time 5/4
					r16 
					r4 
					e''4 \f
					e''16 
					e''8 
					e''8 
					e''4 
					e''16 
					e''16
				}
				{
					\time 5/4
					r16
					e''8 \p
					e''2.
					e''8
					e''8
					e''16
				}
				{
					\time 5/4
					r16
					e''2.
					e''16
					e''8
					e''8
					e''16
					e''16
				}
				{
					\time 5/4
					e''8 \mp 
					e''8
					e''4 
					e''16 \p 
					e''8 
					e''8 
					e''4 \mf 
					e''16 \f \<
					e''8 ~
				}
				{
					\time 5/4
					e''8 \ff
					e''2. \>
					e''8 
					e''8 
					e''8 \f
				}
				{
					\time 5/4
					e''2 \f
					r4
					e''16 \mf
					e''8
					b'8
					e'16
					e'16
					e'16
				}
				{
					\time 5/4
					e'16 \f
					e'8
					e'4
					e'16
					e'8
					e'8
					e'4
					e'16
					e'8
					e'16
				}
				{
					\time 5/4
					e'16 \mf
					e'2
					e'8
					r16
					r2
				}
				{
					\time 5/4
					e''16
					r16 
					r8 
					r1
				}
				{
					\time 5/4
					r1 (
					f'4 \f )
				}
				{
					\time 5/4
					f'2. \mf
					r2
				}
				{
					\time 5/4
					r16 
					r4 
					f'4 \pp
					f'16
					f'8 ~
					f'2 \<
				}
				{
					\time 5/4
					f'1 \ff \>
					r4 \!
				}
				{
					\time 5/4
					r16
					f'4 \p
					r2...
				}
				{
					\time 5/4
					f'16
					f'4
					r2...
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r16
					r2.
					c''4 \p
					e'8.
				}
				{
					\time 5/4
					c''4 (
					c''1 )
				}
				{
					\time 5/4
					c''4 ~ \p
					c''1
				}
				{
					\time 5/4
					c''4 ~
					c''1
				}
				{
					\time 5/4
					c''4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r2 (
					c''4 \p )
					c''8 ~
					c''4. \mf
				}
				{
					\time 5/4
					r8
					c''1 \p
					c''8
				}
				{
					\time 5/4
					c''4 ~
					c''1
				}
				{
					\time 5/4
					c''8
					r8 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r16 
					r8 
					r2 
					e'8. \p
					e'16
					e'8
					gs'8. ~
				}
				{
					\time 5/4
					gs'16 
					gs'8 
					gs'8. 
					gs'16 
					gs'8 
					gs'8. (
					b'16 
					b'8 
					b'16 
					e''16 
					e''8 )
					e''16
				}
				{
					\time 5/4
					gs'16 \ppp \<
					b'8
					e''16
					e''16
					e''8
					e''16
					e''16 \pp
					e''8
					e''8
					e''16
					e''8.
					e'8
					gs16
				}
				{
					\time 5/4
					e'8. 
					e''8 
					e''16 
					e''8. 
					e''8 
					e''16 
					e''8. 
					e''8 
					e''16 
					e''8
				}
				{
					\time 5/4
					e''16 \p
					gs'16 
					e'8 
					e16 
					gs16 
					e'8 
					gs'16 
					b'16 
					e''8 
					e''16 
					e''16
					e''4.
				}
				{
					\time 5/4
					b'16 \f
					b'8 
					gs'8. 
					e'16 
					e'8 
					b8. 
					gs'16 
					gs'8 
					b8. 
					e'16 
					e'16
				}
				{
					\time 5/4
					e'16 \f
					e'16 
					e'16 
					e'8 
					e'16 
					e'16 
					e'8 
					e'16 
					e'16 
					b8 
					b16 
					gs16 
					gs8 
					gs8.
				}
				{
					\time 5/4
					gs'16 \p
					e'2 
					e'4 
					e'4.. \>
				}
				{
					\time 5/4
					e'16 \pp
					e'4 
					e'2 
					e'4 
					e'8.
				}
				{
					\time 5/4
					e'16
					e'4
					gs'2
					b'16
					e'8
					e'4
				}
				{
					\time 5/4
					e'4 \pp
					e'16 
					gs'8 
					e''2 \> 
					e''16 \ppp
					e''4 (
				}
				{
					\time 5/4
					r4 )
					r1
				}
				{
					\tempo 4=130
					\time 5/4
					r2.
					b8 ~ \f
					b8
					b8
					b8 
				}
				{
					\time 5/4
					b4 
					cs'4 
					ef'4 
					fs'8 
					fs'8 
					fs'8
					fs'8
				}
				{
					\time 5/4
					fs'4 \f
					fs'4 
					fs'4 
					fs'8 
					fs'8 
					fs'8
					fs'8
				}
				{
					\time 5/4
					fs'4
					fs'4
					fs'4
					fs'8
					fs'8
					fs'8
					fs'8
				}
				{
					\time 5/4
					fs'4 \f 
					fs'4 
					fs'4 
					r2
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
			}
			\context Staff = "baritone" {
				\clef "bass"
				\set Staff.instrumentName = \markup { baritone (Br) }
				\set Staff.shortInstrumentName = \markup { Br }
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4 
					g8 \pp ~
					g2..
				}
				{
					\time 5/4
					g4.
					r4
					g8
					g2
				}
				{
					\time 5/4
					g4 ~ \p
					g1
				}
				{
					\time 5/4
					g2. ~
					g8
					g8 ~
					g4
				}
				{
					\time 5/4
					g4 \pp
					r2.
					g4 ~ \<
				}
				{
					\time 5/4
					g4 
					r1 \!
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4.
					g2 \f \>
					g4
					g8 \p
				}
				{
					\time 5/4
					g8 \f
					g2 \p
					r4.
					g4
				}
				{
					\time 5/4
					g1 ~ \p
					g4 \pp
				}
				{
					\time 5/4
					g1 ~ \p
					g4
				}
				{
					\time 5/4
					g4 ~
					g1
				}
				{
					\time 5/4
					g4 \mp ~
					g1
				}
				{
					\time 5/4
					g4
					g4
					g8
					g8
					r2
				}
				{
					\time 5/4
					g4. \p
					r2..
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					g4 -\marcato \mf
					g8 \pp
					g2.. \f
				}
				{
					\time 5/4
					g8
					g2 \ff \>
					g8
					g2
				}
				{
					\time 5/4
					g4. \f
					r2..
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4  
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r16 
					r2. 
					g8 \p
					g4 \mf
					g16
				}
				{
					\time 5/4
					r8 
					r1 
					g8 -\marcato
				}
				{
					\time 5/4
					g4 ~
					g1 \mf
				}
				{
					\time 5/4
					r8 
					r1 
					g8 \f
				}
				{
					\time 5/4
					r8 
					r2 
					e'8 \p
					e'2 \f ~
				}
				{
					\time 5/4
					e'2. \ff
					r2
				}
				{
					\time 5/4
					r8 
					e'4 \pp
					e'2..
				}
				{
					\time 5/4
					e'1 \p \>
					r8 \!
					e'8
				}
				{
					\time 5/4
					e'4 \p ~
					e'1
				}
				{
					\time 5/4
					e'2.. ~
					e'8
					r8
					e'8 ~
				}
				{
					\time 5/4
					e'8
					r8 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4
					e'4 \p ~
					e'16
					e'8
					e'8
					e'4
					e'16
					e'8
				}
				{
					\time 5/4
					e'8 \p
					e'2 ~
					e'8
					e'8
					e'8
					e'4 ~
				}
				{
					\time 5/4
					e'2
					e'16
					e'8
					e'8 ~
					e'16
					e'16
					e'8
					e'8 ~
					e'16
				}
				{
					\time 5/4
					e'8. \p
					e'16
					e'8
					e'8
					e'4
					e'16 \mp
					e'8
					e'8
					e'8.
				}
				{
					\time 5/4
					e'16
					e'4 ~
					e'8
					e'8 \!
					e'8 \p \<
					e'16
					e'2 ~
				}
				{
					\time 5/4
					e'8.
					e'16 \mf (
					e'8
					b8
					gs16
					e16
					e8 )
					e8
					r4.
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r16 
					c'16 \f
					c'8 ~ \ff
					c'1 \>
				}
				{
					\time 5/4
					c'4 \p
					c'1 \f
				}
				{
					\time 5/4
					c'2 \pp
					r16
					c'4 \p \<
					c'4..
				}
				{
					\time 5/4
					c'4 \ff \>
					c'1 \f
				}
				{
					\time 5/4
					c'4 \p
					c'1
				}
				{
					\time 5/4
					e16
					b16
					b8.
					c'2... \pp

				}
				{
					\time 5/4
					c'4 \pp
					c'1 \p
				}
				{
					\time 5/4
					c'16
					c'2. \< ~
					c'4
					r8. \mf
				}
				{
					\time 5/4
					r1
					c'4 \f
				}
				{
					\time 5/4
					c'4 \<
					c'1 \ff \>
				}
				{
					\time 5/4
					c'2 \p
					r2.
				}
				{
					\time 5/4
					c'4 \ff ~ \>
					c'2. \pp
					r4
				}
				{
					\time 5/4
					c'4 \p \<
					c'1 \f \>
				}
				{
					\time 5/4
					c'2. \p
					r16
					c'4
					r8.
				}
				{
					\time 5/4
					c'16
					r16 
					r8 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4 
					bf,8. ~ \pp
					bf,8 
					bf,16 
					bf,8. 
					bf,8 
					bf,16 
					bf,8. 
					bf,16
				}
				{
					\time 5/4
					bf,16 \p
					bf,8.
					b,8
					b,8
					b,16
					b,16
					b,8
					b,16
					b,16
					d8
					d16
					d16
					d8
				}
				{
					\time 5/4
					d16 \mf
					d16
					f8
					f8
					f8.
					d8
					d16
					d8.
					d8
					d16
					d8 ~ \<
				}
				{
					\time 5/4
					d16 \f
					f8
					f16
					f8.
					d8
					f16
					d8
					d16 \ff
					b,16
					b,8 \f
					bf,16 \ff
					bf,16
					bf,8 \f
				}
				{
					\time 5/4
					b,16 \ff
					b,16
					b,8
					b,16
					b,16
					b,8
					b,16
					b,8
					b,8.
					b,16
					b,8
					b,8.
				}
				{
					\time 5/4
					b,16
					b,8
					b,8.
					b,16
					b,8
					b,8.
					b,8
					b,16
					bf,16
					bf,8
					bf,16
					bf,16
				}
				{
					\time 5/4
					bf,8 \pp
					bf,16
					b,16
					b,8 \f
					b,16
					d16 (
					d8
					f4
					bf4. )
				}
				{
					\time 5/4
					bf8 
					bf4 
					bf2 
					bf4 
					bf8
				}
				{
					\time 5/4
					bf4. \ff
					bf4 
					bf2 ~
					bf8
				}
				{
					\time 5/4
					bf2 ~
					bf16 
					bf8 
					bf16 
					bf2
				}
				{
					\time 5/4
					bf4.. \ff
					bf16
					bf8
					bf2
					bf16
					r16
				}
				{
					\time 5/4
					bf,16
					r16 
					r8 
					r1
				}
				{
					\time 5/4
					r16
					r8
					r2
					bf8 \f
					bf4
					bf8
					r16
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r2
					d8 \f
					d8
					d8
					d8
					d8
					r8
				}
				{
					\time 5/4
					d4 \f
					d4
					d8
					d8
					d8
					d8
					d8
					r8 
				}
				{
					\time 5/4
					d4
					d4
					d8 
					d8 
					d8 
					d8 
					d8
					r8 
				}
				{
					\time 5/4
					d4 \f
					d4 
					d4
					r2
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
			}
			\context Staff = "bass" {
				\clef "bass"
				\set Staff.instrumentName = \markup { bass (B) }
				\set Staff.shortInstrumentName = \markup { B }
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					c4 \f \> ~
					c2..
					c8 \p
				}
				{
					\time 5/4
					c16 \staccato
					c16 \staccato
					c1 ~
					c8
				}
				{
					\time 5/4
					c2.. \p
					c4. ~
				}
				{
					\time 5/4
					c8
					c1 ~
					c8
				}
				{
					\time 5/4
					c4 ~ \p
					c1
				}
				{
					\time 5/4
					c8
					c4
					c4
					c8
					c2
				}
				{
					\time 5/4
					c1 \f
					c8 \p
					c8
				}
				{
					\time 5/4
					c4 \pp
					c1
				}
				{
					\time 5/4
					c8 \f
					c1 \p
					c8 ~
				}
				{
					\time 5/4
					c8
					r8
					c1
				}
				{
					\time 5/4
					c8 \p
					c8
					c4
					c8
					r8
					r2
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4. 
					c4 ~ \p \<
					c8
					c2 \mf
				}
				{
					\time 5/4
					c8 ~ \p
					c2
					r4. 
					c4 ~
				}
				{
					\time 5/4
					c4
					c1
				}
				{
					\time 5/4
					c4 \mp
					c1
				}
				{
					\time 5/4
					c4 ~ \mp \<
					c1 \mf
				}
				{
					\time 5/4
					c1 \p
					c4 ~
				}
				{
					\time 5/4
					c4
					c8 \mf
					c8
					c2
					r4
				}
				{
					\time 5/4
					c4. \mp
					r2.. 
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4  
					r1
				}
				{
					\time 5/4
					r8 
					r1 
					c8 \mf
				}
				{
					\time 5/4
					c4 ~
					c1 \f
				}
				{
					\time 5/4
					c2
					r2.
				}
				{
					\time 5/4
					r4. 
					c4 \fff ~
					c8 -\marcato ~
					c2
				}
				{
					\time 5/4
					c1 \> (
					r4 \! )
				}
				{
					\time 5/4
					r8 \! 
					c4 \mf ~
					c2..
				}
				{
					\time 5/4
					c1 \f \>
					r8 \!
					c8
				}
				{
					\time 5/4
					c8 \mf
					c8
					c1 -\marcato
				}
				{
					\time 5/4
					c2.. \pp
					c4
					r8
				}
				{
					\time 5/4
					c8
					r8
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					c4 \pp ~
					c16
					c8
					c8
					c4
					c16
					c8
				}
				{
					\time 5/4
					c8 \p
					c2. -\marcato \f
					c8 \p
					c8
					c8 ~
				}
				{
					\time 5/4
					c2. \>
					c16
					c8 \mp
					c8
					c16
					c16
					c16
				}
				{
					\time 5/4
					c16 -\marcato \p
					c8 ~
					c4 ~
					c16 \mf
					c8
					c8 \f
					c4 \ff ~
					c16
					c8
					c16
				}
				{
					\time 5/4
					c16 \p
					c2
					c'8 (
					e'8 -\marcato 
					c8
					c16 )
					r16
					c8.
				}
				{
					\time 5/4
					c4.. \ff ~
					c16 \f
					c8
					c8
					c16
					c16
					c8
					c8
					r8
				}
				{
					\time 5/4
					r4 
					c1
				}
				{
					\time 5/4
					c4 ~ \mf
					c1
				}
				{
					\time 5/4
					r4 \!
					c4 \fff
					c2. \>
				}
				{
					\time 5/4
					c4 ~ \f \>
					c1
				}
				{
					\time 5/4
					c4 \pp
					r4 \! 
					c4
					r2
				}
				{
					\time 5/4
					c4 \p
					r1
				}
				{
					\time 5/4
					r4
					c4
					c16
					c8
					c8
					c4 -\marcato \f
					c16 \pp
					c8
				}
				{
					\time 5/4
					c8 \pp
					c2 ~
					c8
					c8 \mp \<
					c8
					c4
				}
				{
					\time 5/4
					c2 ~
					c16 \!
					c8 -\marcato \p
					c8
					c16
					c16 \f
					c8
					c8 \fff
					c16
				}
				{
					\time 5/4
					c8. \ff \<
					c16
					c8
					c8
					c4 -\marcato \fff
					r16
					c8 \p
					c8
					c8.
				}
				{
					\time 5/4
					c16
					c4
					es8
					e8
					e8
					e16
					e2
				}
				{
					\time 5/4
					e8. -\marcato \f
					e16
					e8 \p
					e8
					e16
					e16
					e8
					e8
					e4
					e16
					e16
				}
				{
					\time 5/4
					e16
					e8 -\marcato
					e4 \pp
					e16
					e8
					e8
					e2
				}
				{
					\time 5/4
					e8 \p
					r8 
					r1
				}
				{
					\time 5/4
					r2
					c4 \pp
					c16
					c8
					c8
					c8.
				}
				{
					\time 5/4
					r16 
					c16 \p
					c8
					c8
					c2
					c8
					c8
					c8
				}
				{
					\time 5/4
					c4
					r2
					c16 \f
					c8
					c8
					c16
					c16
					c16
				}
				{
					\time 5/4
					c16 \f
					c8
					c4
					c16
					c8
					c8
					c4
					c16
					c8
					c16
				}
				{
					\time 5/4
					c16
					c2 ~
					c8 \mp
					c8
					c8
					c16
					c4 ~
				}
				{
					\time 5/4
					c4.. \p
					c16
					c8 \mf
					c8 \f
					c16 \fff
					c16 \>
					c8
					c8
					c8
				}
				{
					\time 5/4
					c8 \ff \>
					c16
					c8
					c8
					c4 \f ~
					c16 \p
					c8 \mp
					c8 \pp
					c4 \mp
				}
				{
					\time 5/4
					c4 ~ \p
					c8
					r2..
				}
				{
					\time 5/4
					c16 \marcato \f
					r16
					r8
					r1
				}
				{
					\time 5/4
					r16
					c16 \mf
					c8
					c1 \p
				}
				{
					\time 5/4
					c2.
					r16
					c4
					c8. \mf
				}
				{
					\time 5/4
					c4 \f
					c1 \<
				}
				{
					\time 5/4
					c16 \fff
					c2 \>
					c4
					c4.. \!
				}
				{
					\time 5/4
					c4 ~ \f
					c1
				}
				{
					\time 5/4
					c16
					c4 \!
					c4 \ff
					r16
					r8
					r2
				}
				{
					\time 5/4
					c16 \f
					r16
					r8
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r1
					c4 \mf
				}
				{
					\time 5/4
					c2.
					bf8 \f \>
					bf4
					r8 \!
				}
				{
					\time 5/4
					r16
					r4
					c4 \fff
					r16
					r8
					r2
				}
				{
					\time 5/4
					c4 \p
					c2. (
					r4 )
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r16
					r1
					fs,16 \pp
					fs,8
				}
				{
					\time 5/4
					fs,8. \pp
					fs,16
					fs,8.
					fs,8
					fs,16
					fs,8.
					fs,8
					fs,16
					g,8.
					g,16
				}
				{
					\time 5/4
					r16
					g,8
					g,16
					g,16
					b,8
					b,16
					cs16
					ef8
					fs16
					fs16
					fs8
					fs16
					fs16
					fs8
					fs16 \mp
				}
				{
					\time 5/4
					fs8 ~ \mp
					fs8.
					ef16 \p
					cs8 (
					fs,8. )
					fs16
					fs8 \mf
					fs8.
					fs16
					fs8 \f
				}
				{
					\time 5/4
					fs8.
					fs8 \ff
					fs16
					fs16
					fs8
					fs16 \f
					fs16
					b,8
					b,16 \mf \<
					fs16
					fs8
					fs16
					fs16
					fs16 \f
				}
				{
					\time 5/4
					fs16 \f
					fs16 
					fs8. ~
					fs8 
					fs16 \> 
					fs8. 
					fs8 
					ef16 
					b,8. 
					fs,8 
					fs,16 \!
				}
				{
					\time 5/4
					b,8. \mf 
					cs8 \> 
					cs16 
					cs8 
					cs16 
					cs16 
					b,8 
					b,16 
					b,16 \! 
					b,8 \p 
					b,16 
					b,16 
					cs8
				}
				{
					\time 5/4
					cs16 \p
					ef8
					ef4
					fs2
					fs4
					fs16
				}
				{
					\time 5/4
					fs4.. ~
					fs4 \mf 
					fs2 
					fs16
				}
				{
					\time 5/4
					fs8. \f
					fs2
					fs8
					fs16 \ff
					fs4. \fff
				}
				{
					\time 5/4
					fs8
					fs8
					fs16
					fs2 \p \>
					fs8 \pp
					fs16
					ef4
				}
				{
					\time 5/4
					ef4 \pp
					r1
				}
				{
					\time 5/4
					r1
					d'4 \f
				}
				{
					\time 5/4
					d'8 \mp
					r8
					r2
					d'8 \p
					d'4
					d'8
				}
				{
					\time 5/4
					g,2 (
					r2. )
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r8
					r1
					bf,8 \mf
				}
				{
					\time 5/4
					bf,8
					bf,8. \f \<
					bf,16
					bf,8
					bf,8.
					bf,16
					bf,8.
					bf,8
					b,16
					b,8 \!
				}
				{
					\time 5/4
					b,16 \ff \<
					b,8
					b,16
					b,8 \fff
					ef16
					ef16
					ef8
					gs16
					gs16
					gs8
					bf16 \f
					bf16
					bf8
					bf16
					bf16
				}
				{
					\time 5/4
					bf16 (
					bf8.
					gs8
					ef16
					b,8.
					bf,8
					b,16
					ef8.
					gs8
					gs16
					bf16 )
				}
				{
					\time 5/4
					bf'8 \f
					bf'8 
					bf'16 
					bf16 
					gs16 
					gs8 
					gs16 
					gs16 
					ef8 
					ef16 
					b,16 
					bf,8 
					bf,16 
					bf,16 
					bf,16
				}
				{
					\time 5/4
					bf,16 
					b,8 
					b,8. 
					b,16 
					b,8 
					b,8. 
					b,16 
					b,8 
					b,8. 
					b,16 
					b,16
				}
				{
					\time 5/4
					b,16
					b,8.
					b,16
					b,8
					b,16
					b,8
					b,16
					b,16
					b,8
					ef16
					ef16
					gs8
					bf16
					bf16
				}
				{
					\time 5/4
					bf8 
					bf16 
					bf8 ~
					bf2 
					bf4 ~
					bf8.
				}
				{
					\time 5/4
					bf16 \p
					bf4 
					bf4 
					bf2 ~
					bf8.
				}
				{
					\time 5/4
					bf16 
					bf2 
					bf4 
					bf16 
					bf4.
				}
				{
					\time 5/4
					bf8 \p
					bf2
					bf8
					bf16
					bf4..
				}
				{
					\time 5/4
					bf16
					bf2
					bf8
					bf16
					bf2
				}
				{
					\time 5/4
					bf2 ~ \p \>
					bf4 \ppp (
					r2 )
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					gs,8 \f
					fs,8
					fs,8
					fs,8
					fs,4
					fs,4
					fs,4
				}
				{
					\time 5/4
					fs,8
					fs,8 
					fs,8 
					gs,8 
					gs,4 
					bf,4 
					cs4
				}
				{
					\time 5/4
					cs8 \f
					cs8
					cs8
					cs8
					cs4
					cs4
					cs4
				}
				{
					\time 5/4
					cs8
					cs8 
					cs8 
					cs8 
					cs4 
					cs4 
					cs4 
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r1
				}
			}
		>>
	>>
\midi { }
\layout { }
}
