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
					
					c'''4 \p
					c'''8
					c'''8
					c'''2 ~
					c'''4
				}
				{
					
					c'''2.
					r2
				}
				{
					
					r4
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				\time 5/4    % measure on every new page
				{
					c'''4 \f \marcato
					c'''4 \p \marcato
					c'''4 \marcato
					c'''4 \marcato
					c'''4 \marcato
				}
				{
					
					c'''4
					c'''4
					c'''4
					r2
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4.
					c''8 \p
					c''4
					c''8
					c''4.
				}
				{
					
					r8
					c''16 \staccato \f
					c''16 \staccato
					r1
				}
				{
					
					c''8
					r8
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					c'''4 \p
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4.
					c'''4 \mf \marcato
					c'''4 \marcato
					c'''4 \marcato
					c'''8 \marcato
				}
				{
					
					r8 
					c'''4 \f \marcato
					c'''4 \mf \> \marcato
					c'''4 \marcato
					c'''4 \mp \marcato
					r8 
				}
				{
					
					c'''8
					r8
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r1
					d''4 -\marcato \mf
				}
				{
					
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
					
					d''1 \f \>
					d''16 \p
					d''8.->
				}
				{
					
					d''16 \p
					d''2. -\marcato
					d''4.. ~
				}
				{
					
					d''16
					d''2
					d''16
					d''8
					d''2
				}
				{
					
					d''1 \p
					d''4 ~
				}
				{
					
					d''16 \p \<
					d''1
					r8. \f
				}
				{
					
					r4
					r1
				}
				{
					
					r8
					r1
					c'''8 \pp ~
				}
				{
					
					c'''4 ~ \p \<
					c'''1 \f
				}
				{
					
					r8
					r1
					c'''8 \f
				}
				{
					
					c'''8 \f
					r8 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r8 
					c'''4 \mf 
					c'''16
					c'''8
					c'''8->
					c'''4 ~
					c'''16
					c'''8
					c'''8 ~
				}
				{
					
					c'''2
					c'''8 \f->
					c'''8
					c'''8
					c'''4.
				}
				{
					
					c'''4. \f ~
					c'''16
					c'''8
					c'''8
					c'''16->
					c'''16
					c'''8
					c'''8
					c'''8.-> ~
				}
				{
					
					c'''16
					c'''16
					c'''8->
					c'''8
					c'''4 ~
					c'''16
					c'''8
					c'''8
					c'''16
					c'''4->
				}
				{
					
					c'''8. \ff
					c'''8
					c'''8
					c'''8
					c'''16->
					c'''8 
					c'''2 ~ ^"switch to pp via breath"
				}
				{
					
					c'''16 \pp
					c'''16
					c'''8
					c'''8->
					c'''16
					c'''16
					c'''8
					c'''8->
					c'''2 \< ~
				}
				{
					
					c'''8 \p
					r16
					c'''16 \mf -\marcato ~
					c'''1 \>
				}
				{
					
					c'''8 \p
					r8
					c'''4 ~
					c'''2.
				}
				{
					
					c'''4 \ff ~
					c'''1 \pp
				}
				{
					
					c'''4 ~
					c'''1 \mp \<
				}
				{
					
					c'''1 ~
					c'''4 \f
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					e'''1 \ff
				}
				{
					
					e'''4 ~ \f
					e'''1
				}
				{
					
					r4 ~
					e'''4 ~
					e'''2.
				}
				{
					
					e'''4 ~ \f
					e'''1 -\marcato
				}
				{
					
					e'''4
					r4
					e'''4
					r2
				}
				{
					
					r2
					e'''2. \f
				}
				{
					
					e'''4
					e'''1
				}
				{
					
					e'''2 \f
					r2 ~
					e'''4 -\marcato
				}
				{
					
					e'''4
					e'''1
				}
				{
					
					e'''4 ~ \f \<
					e'''1 \ff
				}
				{
					
					e'''2 ~ \>
					e'''8 \p
					r8
					e'''2
				}
				{
					
					e'''4 \p
					e'''1
				}
				{
					
					e'''4
					e'''1 -\marcato
				}
				{
					
					e'''4 \pp (
					r2
					\ottava #1
					c''''2 )
				}
				{
					
					c''''4
					c''''1
				}
				{
					
					c''''2. \p
					r2
				}
				{
					
					c''''4 ~
					c''''1
				}
				{
					
					c''''4 ~ \p
					c''''1
				}
				{
					
					c''''2.
					c''''4
					c''''4
				}
				{
					
					c''''4 \p
					c''''1 \<
				}
				{
					
					c''''4 \ff \>
					c''''1 \mf
				}
				{
					
					c''''4 ~ \mp
					c''''4
					\ottava #0
					r2.
				}
				{
					
					r16
					r4
					e'''4 \f
					e'''16
					e'''8
					e'''8 ->
					e'''4
					e'''16
					e'''16 ->
				}
				{
					
					r16
					e'''8 \f
					e'''2
					e'''8
					e'''8
					e'''8
					e'''8
					r16
				}
				{
					
					e'''2
					r16
					e'''16
					e'''8 ->
					e'''8
					e'''16
					e'''16
					e'''8 ->
					e'''8
				}
				{
					
					e'''4 \mp \< ~
					e'''16
					e'''8
					e'''8
					e'''4 -> \p \<
					e'''16
					e'''8
					e'''8 
					e'''8 -> \mf \<
				}
				{
					
					e'''4
					r8 \!
					e'''8 \ff
					e'''8
					e'''8
					e'''2 \>
				}
				{
					
					e'''4 \f
					e'''16
					e'''8 ->
					e'''8
					e'''16
					e'''16
					e'''8 ->
					e'''8
					e'''4
					e'''16
				}
				{
					
					e'''8
					e'''8
					e'''4
					e'''16
					e'''8
					e'''8
					e'''4.. ->
				}
				{
					
					e'''8. \f
					r16 
					r1
				}
				{
					
					e'''16
					r16
					r8
					r1
				}
				{
					
					r1
					b''4 \mf ^"sharp"
				}
				{
					
					b''2.
					r2
				}
				{
					
					r16
					r4
					b''4 \mf ^"smooth"
					b''16
					b''8
					b''2 \<
				}
				{
					
					b''4 \f \>
					b''2. \p
					r4
				}
				{
					
					r16 
					b''4 \f
					r2...
				}
				{
					
					b''16
					b''4
					r2...
				}
				{
					
					b''16 \p
					b''4
					r2.
					\override TextSpanner #'(bound-details left text) = "ritard." 
					b''8 \pp \startTextSpan
					r16
				}
				{
					
					b''16
					b''16
					r8
					b''2. \ppp (
					r4 ) \stopTextSpan
				}
				\time 5/4    % measure at the change of the section
				{
					\partial 8*2 r8 r8 |
					r4
					r1
				}
				{
					
					r16
					r2
					g'''4 \f
					r4..
				}
				{
					
					r16
					r4
					e'''4 \mf
					e'''8 (
					g''16 )
					r2
				}
				{
					
					r4 
					r1
				}
				{
					
					r16
					r2. 
					\ottava #1
					g'''4 \f
					g'''8
					g'''16
				}
				{
					
					r8 
					g'''8 ~
					g'''2
					r2
				}
				{
					
					r8. 
					g'''16 ~
					g'''1 \mf \<
				}
				{
					
					g'''4 \f
					r1
				}
				{
					
					g'''8. \f
					\ottava #0					
					r16
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r1
					\ottava #1
					g'''4 \f ~
				}
				{
					
					g'''8
					\ottava #0
					r8
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4 \!
					\ottava #1
					g'''8 \ff
					g'''4
					g'''8
					g'''2
					\ottava #0
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r8 
					r1 
					c''8 \f
				}
				{
					
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
					
					gs'8
					gs'16
					gs'8
					gs'4
					gs'2 ~ \>
					gs'8.
				}
				{
					
					gs'16 \p
					c''4
					c''4 
					c''2 ~
					c''8.
				}
				{
					
					c''16
					c''4
					c''2
					f''4..
				}
				{
					
					f''16 \pp
					f''2
					f''16
					f''8
					f''4
					f''4 ~
				}
				{
					
					f''2
					f''16
					f''8
					f''2
					f''16
				}
				{
					
					f''4 \p \>
					e'2
					gs'4 \pp (
					r4 )
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r1
					r4 (
				}
				{
					
					b''1 ) \f ~
					b''4 \! ~
				}
				{
					
					b''1 ~
					b''4 ~
				}
				{
					
					b''4 ~
					b''32 (
					c'''32 )->
					r2.
					r8.
				}
			}
			\context Staff = "sopranoII" {
				\time 5/4
				\set Staff.instrumentName = \markup { sopranoII (SII) }
				\set Staff.shortInstrumentName = \markup { S II }
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
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
					
					c''4
					c''16 \!
					c''2... \p
				}
				{
					
					c''16 \p
					c''1
					c''8.-> ~
				}
				{
					
					c''1 \p \>
					r4 \!
				}
				{
					
					c''16 \f
					c''2
					r16
					r8
					r2
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4. 
					c'''8 \mf
					c'''8
					c'''8 ~
					c'''2 \>
				}
				{
					
					c'''8 ~ \p
					c'''2
					r4. 
					c'''8 ~
					c'''8
				}
				{
					
					c'''4.
					c'''2..
				}
				{
					
					c'''8 \p
					c'''1
					c'''8
				}
				{
					
					c'''1 ~ \<
					c'''4 \mf
				}
				{
					
					c'''1 \pp \<
					c'''4 \mf \> ~
				}
				{
					
					c'''2.
					r2 \!
				}
				{
					
					c'''4. \p
					r2..
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r16 
					r2. 
					c'''4 ~ \p
					c'''16
					c'''16 -\marcato
					c'''16
				}
				{
					
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
					
					e''4 -\marcato 
					e''1 \mf
				}
				{
					
					e''4.
					r2.
					e''8 \f
				}
				{
					
					e''8 \ff
					r8 
					r1
				}
				{
					
					e''2. \fff
					r2
				}
				{
					
					r8 
					r1  
					c'''8 \f ~
				}
				{
					
					c'''1 \>
					c'''4 \mf
				}
				{
					
					r8
					r1 \!
					c'''8 \f->
				}
				{
					
					r8 
					c'''8-> ~
					c'''1
				}
				{
					
					c'''4 -\marcato \f ~
					c'''1
				}
				{
					
					r8 
					c'''4
					r2..
				}
				{
					
					c'''8 \f
					r8
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					c'''4 -\marcato \ff (
					c'''1 \pp )
				}
				{
					
					c'''4 ~
					c'''1 \f \>
				}
				{
					
					c'''2 ~ \p \>
					c'''4 \pp \>
					c'''2~ \ppp
				}
				{
					
					c'''4
					c'''1 \p
				}
				{
					
					c'''4 \p ~
					c'''1
				}
				{
					
					c'''4 \f \< (
					\ottava #1
					c''''1 \ff )
					\ottava #0
				}
				{
					
					\ottava #1
					c'''4 ~ \f
					c'''1
				}
				{
					
					c'''4
					c'''4 ~
					c'''2.
					\ottava #0
				}
				{
					
					\ottava #1
					c'''4 ~ \f
					c'''1
				}
				{
					
					c'''2 ~
					c'''4
					\ottava #0
					r2
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					c'''8 \f
					c'''8
					c'''2. \>
				}
				{
					
					c'''16 \p
					c'''8 ->
					c'''8 
					c'''16 
					c'''16 
					c'''8 
					c'''8 
					c'''4 ->
					c'''16 \f
					c'''8 
					c'''8
				}
				{
					
					c'''4 -> \f
					c'''16
					c'''8
					c'''8
					c'''2 ->
					c'''8
					c'''16
				}
				{
					
					c'''16 
					c'''8 
					c'''2
					r8
					c'''8
					c'''16 
					c'''8 
					c'''8 ->
				}
				{
					
					c'''16 \staccato \f
					e''16 \staccato
					c''8 \p
					c''8 
					c''4 
					c''16 
					c''8 
					c''8 
					c''4 ->
					c''16
				}
				{
					
					c''8 \ff
					c''8 
					c''2. \p
					c''8 
					c''8 ~
				}
				{
					
					c''8 \p
					c''2. 
					c''16 
					c''8 
					c''8 
					c''16
				}
				{
					
					c''16
					c''8
					c''8
					r2...
				}
				{
					
					r16
					r1
					c'''8. \f
				}
				{
					
					c'''4 (
					c'''1 )
				}
				{
					
					c'''2 \p
					r2.
				}
				{
					
					c'''4
					r16 
					r4 
					c'''16 \ppp
					c'''8
					c'''2 \p
				}
				{
					
					c'''4 ~ \p
					c'''1
				}
				{
					
					c'''2.
					r16
					r4
					c'''8.
				}
				{
					
					c'''16 \p
					c'''16
					c'''8
					c'''1
				}
				{
					
					c'''4 ~
					c'''1
				}
				{
					
					c'''16
					c'''2 \>
					r4 \!
					gs''8
					r16
					gs''4 \mf
				}
				{
					
					gs''4 ~
					gs''1
				}
				{
					
					gs''16 \p
					gs''4
					gs''4 \mf
					gs''16
					gs''8
					gs''2 \<
				}
				{
					
					gs''4 \f \>
					gs''1 \p
				}
				{
					
					gs''16 \f
					gs''4
					r2...
				}
				{
					
					c'''16 ~
					c'''4->
					r2...
				}
				{
					
					c'''16 \p
					c'''4->
					r2.
					c'''8 \pp
					r16
				}
				{
					c'''16
					c'''16
					r8
					c'''2. \ppp (
					r4 )

				}
				{
					\tempo 4=80
					\partial 8*2 r8 r8 |
					r4
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r16
					r1
					e''8. \mf
				}
				{
					
					e''1 \mf \>
					e''4 ~ \p
				}
				{
					
					e''8
					r8
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r2.
					e''2 \p
				}
				{
					
					c''2. (
					r2 )
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r16
					r8 
					r2 
					e''8. \p
					e''16
					e''8
					e''8. ~
				}
				{
					
					e''8 ~
					e''2
					r8 
					r2
				}
				{
					
					r8.
					\ottava #1
					g'''4 \p
					g'''8
					g'''16
					g'''8
					g'''2
				}
				{
					
					g'''8
					r8.
					g'''2...
				}
				{
					
					g'''16 \p
					g'''2
					r16
					r8
					r2
				}
				{
					
					g'''8.
					\ottava #0
					r16
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					gs''4 ~ \ppp
					gs''1
				}
				{
					
					gs''4 ~ \ppp
					gs''1
				}
				{
					
					e''4 ~
					e''1
				}
				{
					
					e''4 \ppp ~
					e''1
				}
				{
					
					e''4 (
					r1 )
				}
				{
					
					r4
					r1
				}
				{
					
					r2
					e''8 \f
					g''8
					g''8
					g''8
					g''8
					r8
				}
				{
					
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
					
					g''4 \f 
					g''1 ~
				}
				{
					
					g''4 ~
					g''1 ~
				}
				{
					
					g''4
					r1
				}
				{
					
					r4 
					r1
				}
			}
			\context Staff = "tenor" {
				\time 5/4
				\set Staff.instrumentName = \markup { tenor (T) }
				\set Staff.shortInstrumentName = \markup { T }
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					c''8 \pp
					c''4
					c''8
					c''2
					c''16 \staccato
					r8.
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r2.
					c'''8 \p
					c'''4
					c'''8
				}
				{
					
					c'''4 \p
					c'''1
				}
				{
					
					c'''2.
					c'''16
					r4..
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4.
					c''4
					c''8
					c''2
				}
				{
					
					c''4 ~ \mp
					c''1
				}
				{
					
					c''4
					c''1
				}
				{
					
					r4
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r8
					r1
					c'''8 \f
				}
				{
					
					c'''4
					c'''2.. \>
					r8 \!
				}
				{
					
					c'''2 \mp
					r8 
					c'''2 ~ \<
					c'''8
				}
				{
					
					c'''2.. \mf
					r4.
				}
				{
					
					c'''8 \mf
					r8
					r1
				}
				{
					
					r1 \!
					c''4 \f
				}
				{
					
					r8 
					c''8 \ff \> ~
					c''1
				}
				{
					
					c''2.. \f
					r4
					c''8 ~
				}
				{
					
					c''8
					r8  
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r16 
					r1 
					g'8 \f ~
					g'16 \p
				}
				{
					
					r8.
					g'8 \pp ~
					g'2...
				}
				{
					
					g'2.. -\marcato \mp
					r8. 
					g'16 ( \pp
					c''8 )
				}
				{
					
					c''4 ~ \p \<
					c''1 \mf
				}
				{
					
					c''4 ~
					c''1
				}
				{
					
					c''4. \mf
					c''4
					r8
					r2
				}
				{
					
					g'8.
					r16 
					r1
				}
				{
					
					r8
					e''4~ \p
					e''16
					e''8
					e''8->
					e''4
					e''16
					e''8
					e''8
				}
				{
					
					e''2 ~
					e''8
					e''8
					e''8->
					e''4.
				}
				{
					
					e''4. \p ~
					e''16
					e''8
					e''8
					e''16->
					e''16
					e''8
					e''8
					e''8.-> ~
				}
				{
					
					e''16
					e''16
					e''8-> ~
					e''8
					e''4 ~
					e''16
					e''8
					e''8
					e''16-> ~
					e''4
				}
				{
					
					e''8. \ff
					e''8
					e''8->
					e''8
					e'16
					e'8
					e'2 ~
				}
				{
					
					e'16 \pp
					e'16
					e'8
					e'8->
					e'16
					e'16
					e'8
					e'8->
					e''2 \< ~
				}
				{
					
					e''4 \f
					e''1 \>
				}
				{
					
					e''2. \p
					e''4 -\marcato
					e''4
				}
				{
					
					e''8. \ff
					r16
					e''1 \pp
				}
				{
					
					e''1
					e''4
				}
				{
					
					e''4 \mp \< ~
					e''1
				}
				{
					
					e''4 \p
					e''1
				}
				{
					
					e''4 -\marcato
					r1
				}
				{
					
					r4 \! 
					e''1 \p \<
				}
				{
					
					e''4 \mf
					e''1 \p
				}
				{
					
					e''2 \mf
					r4 \!
					e''4 
					e''4 \f
				}
				{
					
					e''4 -\marcato \mf
					e''1
				}
				{
					
					e''4
					e''1 \ff
				}
				{
					
					e''4 \p
					e''4
					r2.
				}
				{
					
					e''4 \f
					r1
				}
				{
					
					c''4 ~ \mf
					c''1 \>
				}
				{
					
					c''4 -\marcato \!
					c''1 \p
				}
				{
					
					c''4 \p ~
					c''1
				}
				{
					
					c''4 ~
					c''1
				}
				{
					
					c''4 ~ \p
					c''4
					c''2.
				}
				{
					
					c''4
					c''1
				}
				{
					
					c''2 -\marcato \p \>
					c''4 \pp
					r2
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					e''1 \p
				}
				{
					
					e''4 ~
					e''1
				}
				{
					
					r4
					e''4 \p
					e''2.
				}
				{
					
					e''4
					e''1
				}
				{
					
					e''4 \p
					r4
					e''4 ~ \<
					e''2 \ff
				}
				{
					
					e''4 \>
					e''1 \f
				}
				{
					
					e''2. ~ \p
					e''4
					r4
				}
				{
					
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
					
					r16
					e''8 \p
					e''2
					r8
					e''8
					e''8
					e''8					
					r16
				}
				{
					
					e''2
					r16
					e''16
					e''8 ->
					e''8
					e''16
					e''16
					e''8 ->
					e''8
				}
				{
					
					e''4 \mp
					e''16 \p 
					e''8 
					e''8 
					e''4 -> \mf 
					e''16 \f \<
					e''8 ~
					e''4
				}
				{
					
					e''8 \! \marcato
					r4
					e''2 \ff \>
					e''8 
					e''8 
					e''8 \f
				}
				{
					
					e''2 \f
					r4
					e''16 \mf
					e''8
					b'8
					e'16 ->
					e'16 ->
					e'16 ->
				}
				{
					
					e'16 \f
					e'8
					e'4
					e'16
					e'8
					e'8
					e'4 \marcato
					e'16
					e'8
					e'16
				}
				{
					
					e'16 \mf
					e'2
					e'8
					r16
					r2
				}
				{
					
					e''16
					r16 
					r8 
					r1
				}
				{
					
					r1 (
					f'4 \f )
				}
				{
					
					f'2. \mf
					r2
				}
				{
					
					r16 
					r4 
					f'4 \pp
					f'16
					f'8 ~
					f'2 \<
				}
				{
					
					f'1 \ff \>
					r4 \!
				}
				{
					
					r16
					f'4 \p
					r2...
				}
				{
					
					f'16
					f'4
					r2...
				}
				{
					
					f'16 \p
					f'4
					r2.
					f'8
					r16
				}
				{
					f'1 \pp (
					r4 )
				}
				{
					\partial 8*2 r8 r8 |
					r4 
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r16
					r2.
					c''4 \p
					e'8.
				}
				{
					
					c''4 (
					c''1 )
				}
				{
					
					c''4 ~ \p
					c''1
				}
				{
					
					c''4 ~
					c''1
				}
				{
					
					c''4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r2 (
					c''4 \p )
					c''8 ~
					c''4. \mf
				}
				{
					
					r8
					c''1 \p
					c''8
				}
				{
					
					c''4 ~
					c''1
				}
				{
					
					c''8
					r8 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r16 
					r8 
					r2 
					e'8. \p
					e'16
					e'8
					gs'8. ~
				}
				{
					
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
					
					gs'16 \p
					e'2 
					e'4 
					e'4.. \>
				}
				{
					
					e'16 \pp
					e'4 
					e'2 
					e'4 
					e'8.
				}
				{
					
					e'16
					e'4
					gs'2
					b'16
					e'8
					e'4
				}
				{
					
					e'4 \pp
					e'16 
					gs'8 
					e''2 \> 
					e''16 \ppp
					e''4 (
				}
				{
					
					r4 )
					r1
				}
				{
					\tempo 4=130
					
					r2.
					b8 ~ \f
					b8
					b8
					b8 
				}
				{
					
					b4 
					cs'4 
					ef'4 
					fs'8 
					fs'8 
					fs'8
					fs'8
				}
				{
					
					fs'4 \f
					fs'4 
					fs'4 
					fs'8 
					fs'8 
					fs'8
					fs'8
				}
				{
					
					fs'4
					fs'4
					fs'4
					fs'8
					fs'8
					fs'8
					fs'8
				}
				{
					
					fs'4 \f 
					fs'4 
					fs'4 
					r2
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
			}
			\context Staff = "baritone" {
				\time 5/4
				\clef "bass"
				\set Staff.instrumentName = \markup { baritone (Br) }
				\set Staff.shortInstrumentName = \markup { Br }
				{
					
					r4
					r1
				}
				{
					
					r4 
					g8 \pp ~
					g2..
				}
				{
					
					g4.
					r4
					g8
					g2
				}
				{
					
					g4 ~ \p
					g1
				}
				{
					
					g2. ~
					g8
					g8 ~
					g4
				}
				{
					
					g4 \pp
					r2.
					g4 ~ \<
				}
				{
					
					g4 
					r1 \!
				}
				{
					
					r4 
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4.
					g2 \f \>
					g4
					g8 \p
				}
				{
					
					g8 \f
					g2 \p
					r4.
					g4
				}
				{
					
					g1 ~ \p
					g4 \pp
				}
				{
					
					g1 ~ \p
					g4
				}
				{
					
					g4 ~
					g1
				}
				{
					
					g4 \mp ~
					g1
				}
				{
					
					g4
					g4
					g8
					g8
					r2
				}
				{
					
					g4. \p
					r2..
				}
				{
					
					r4
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					g4 -\marcato \mf
					g8 \pp
					g2.. \f
				}
				{
					
					g8
					g2 \ff \>
					g8
					g2
				}
				{
					
					g4. \f
					r2..
				}
				{
					
					r4
					r1
				}
				{
					
					r4  
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r16 
					r2. 
					g8 \p
					g4 \mf
					g16
				}
				{
					
					r8 
					r1 
					g8 -\marcato
				}
				{
					
					g4 ~
					g1 \mf
				}
				{
					
					r8 
					r1 
					g8 \f
				}
				{
					
					r8 
					r2 
					e'8 \p
					e'2 \f ~
				}
				{
					
					e'2. \ff
					r2
				}
				{
					
					r8 
					e'4 \pp
					e'2..
				}
				{
					
					e'1 \p \>
					r8 \!
					e'8
				}
				{
					
					e'4 \p ~
					e'1
				}
				{
					
					e'2.. ~
					e'8
					r8
					e'8 ~
				}
				{
					
					e'8
					r8 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4
					e'4 \p ~
					e'16
					e'8 ->
					e'8 
					e'4
					e'16
					e'8
				}
				{
					
					e'8 \p
					e'2 ~
					e'8
					e'8
					e'8 ->
					e'4 ~
				}
				{
					
					e'2
					e'16
					e'8
					e'8 ->
					e'8
					e'8
					e'8 ~
					e'16
				}
				{
					
					e'8. \p
					e'16
					e'8
					e'8
					e'4 ->
					e'16 \mp
					e'8 ->
					e'8
					e'8.
				}
				{
					
					e'16
					e'4 ~
					e'8
					e'8 \!
					e'8 \p \<
					e'16
					e'2 ~
				}
				{
					
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
					
					r4 
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r16 
					c'16 \f
					c'8 ~ \ff
					c'1 \>
				}
				{
					
					c'4 \p
					c'1 \f
				}
				{
					
					c'2 \pp
					r16
					c'4 \p \<
					c'4..
				}
				{
					
					c'4 \ff \>
					c'1 \f
				}
				{
					
					c'4 \p
					c'1
				}
				{
					
					e16
					b16
					b8
					r16
					c'2... \pp

				}
				{
					
					c'4 \pp
					c'1 \p
				}
				{
					
					c'16
					c'2. \< ~
					c'4
					r8. \mf
				}
				{
					
					r1
					c'4 \f
				}
				{
					
					c'4 \<
					c'1 \ff \>
				}
				{
					
					c'2 \p
					r2.
				}
				{
					
					c'4 \ff ~ \>
					c'2. \pp
					r4
				}
				{
					
					c'4 \p \<
					c'1 \f \>
				}
				{
					
					c'2. \p
					r16
					c'4
					r8.
				}
				{
					
					c'2. \p %bookmark
					r16
					f4
					r8.
				}
				{
					
					f1 \pp (
					r4 )
				}
				{
					\partial 8*2 r8 r8 |
					r4
					r1
				}
				{
					r16
					r2
					c'4 \p
					r4..
				}
				{
					
					r4 
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4
					r1
				}
				{
					
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
					
					bf8 
					bf4 
					bf2 
					bf4 
					bf8
				}
				{
					
					bf4. \ff
					bf4 
					bf2 ~
					bf8
				}
				{
					
					bf2 ~
					bf16 
					bf8 
					bf16 
					bf2
				}
				{
					
					bf4.. \ff
					bf16
					bf8
					bf2
					bf16
					r16
				}
				{
					
					bf,16
					r16 
					r8 
					r1
				}
				{
					
					r16
					r8
					r2
					bf8 \f
					bf4
					bf8
					r16
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r2
					d8 \f
					d8
					d8
					d8
					d8
					r8
				}
				{
					
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
					
					d4 \f
					d4 
					d4
					r2
				}
				{
					
					r4 
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4 
					r1
				}
			}
			\context Staff = "bass" {
				\time 5/4
				\clef "bass"
				\set Staff.instrumentName = \markup { bass (B) }
				\set Staff.shortInstrumentName = \markup { B }
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					c4 \f \> ~
					c2..
					c8 \p
				}
				{
					
					c16 \staccato
					c16 \staccato
					c1 ~
					c8
				}
				{
					
					c2.. \p
					c4. ~
				}
				{
					
					c8
					c1 ~
					c8
				}
				{
					
					c4 ~ \p
					c1
				}
				{
					
					c8
					c4
					c4
					c8
					c2
				}
				{
					
					c1 \f
					c8 \p
					c8
				}
				{
					
					c4 \pp
					c1
				}
				{
					
					c8 \f
					c1 \p
					c8 ~
				}
				{
					
					c8
					r8
					c1
				}
				{
					
					c8 \p
					c8
					c4
					c8
					r8
					r2
				}
				{
					
					r4
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4. 
					c4 ~ \p \<
					c8
					c2 \mf
				}
				{
					
					c8 ~ \p
					c2
					r4. 
					c4 ~
				}
				{
					
					c4
					c1
				}
				{
					
					c4 \mp
					c1
				}
				{
					
					c4 ~ \mp \<
					c1 \mf
				}
				{
					
					c1 \p
					c4 ~
				}
				{
					
					c4
					c8 \mf
					c8
					c2
					r4
				}
				{
					
					c4. \mp
					r2.. 
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4  
					r1
				}
				{
					
					r8 
					r1 
					c8 \mf
				}
				{
					
					c4 ~
					c1 \f
				}
				{
					
					c2
					r2.
				}
				{
					
					r4. 
					c4 \fff ~
					c8 -\marcato ~
					c2
				}
				{
					
					c1 \> (
					r4 \! )
				}
				{
					
					r8 \! 
					c4 \mf ~
					c2..
				}
				{
					
					c1 \f \>
					r8 \!
					c8
				}
				{
					
					c8 \mf
					c8
					c1 -\marcato
				}
				{
					
					c2.. \pp
					c4
					r8
				}
				{
					
					c8
					r8
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					c4 \pp ~
					c16
					c8 ->
					c8
					c4
					c16
					c8
				}
				{
					
					c8 \p
					c2. -\marcato \f
					c8 \p
					c8
					c8 -> ~
				}
				{
					
					c2. \>
					c16
					c8 \mp
					c8 ->
					c16
					c16
					c16
				}
				{
					
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
					
					c4 \ff ~
					c4 \f
					c16
					c16
					c8
					c8
					c8
					c8
					r8
				}
				{
					
					r4 
					c1
				}
				{
					
					c4 ~ \mf
					c1
				}
				{
					
					r4 \!
					c4 \fff
					c2. \>
				}
				{
					
					c4 ~ \f \>
					c1
				}
				{
					
					c4 \pp
					r4 \! 
					c4
					r2
				}
				{
					
					c4 \p
					r1
				}
				{
					
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
					
					c8 \pp
					c2 ~
					c8
					c8 \mp \<
					c8
					c4
				}
				{
					
					c2 ~ \p
					c16
					c8 -\marcato
					c8
					c16
					c16 \f
					c8
					c8
					c16 -> \fff
				}
				{
					
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
					
					c16
					c4 ->
					es8
					e8
					e8 ->
					e16
					e2 ->
				}
				{
					
					e8. -\marcato \f
					e16
					e8 \p
					e8
					e16
					e16
					e8
					e8 ->
					e4
					e16
					e16
				}
				{
					
					e16
					e8 ->
					e4 \pp
					e16
					e8
					e8 ->
					e2
				}
				{
					
					e8 \p
					r8 
					r1
				}
				{
					
					r2
					c4 \pp ~
					c16
					c8
					c8
					c8. ->
				}
				{
					
					r16 
					c16 \p
					c8
					c8
					c2 ->
					c8
					c8
					c8
				}
				{
					
					c4
					r2
					c16 \f
					c8
					c8
					c16 ->
					c16 ->
					c16 ->
				}
				{
					
					c16 \f
					c8
					c4 ->
					c16
					c8
					c8
					c4 ->
					c16
					c8
					c16
				}
				{
					
					c16
					c2 ~
					c8 \mp
					c8
					c8
					c16
					c4 -> ~
				}
				{
					
					c4 \p ~
					c8
					r16
					c16
					c4 -> \f 
					c16 \fff
					c16 \>
					c8
					c8 ->
					c8
				}
				{
					
					c8 \ff \> ->
					c16
					c8
					c8
					c4 \f ~
					c16 \p
					c8
					c8
					c4 ->
				}
				{
					
					c4 ~ \p
					c8 ->
					r2..
				}
				{
					
					c16-> \f
					r16
					r8
					r1
				}
				{
					
					r16
					c16 \mf
					c8
					c1 \p
				}
				{
					
					c2.
					r16
					c4
					c8. \mf
				}
				{
					
					c4 \f
					c1 \<
				}
				{
					
					c16 \fff
					c2 \>
					c4
					c4.. \!
				}
				{
					
					c4 ~ \f
					c1
				}
				{
					
					c16
					c4 \!
					c4 \ff
					r16
					r8
					r2
				}
				{
					
					c16 \f
					r16
					r8
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r1
					c4 \mf
				}
				{
					
					c2.
					bf8 \f \>
					bf4
					r8 \!
				}
				{
					
					r16
					r4
					c4 \fff
					r16
					r8
					r2
				}
				{
					
					c4 \p
					c2. (
					r4 )
				}
				{
					
					r4
					r1
				}
				{
					r2.
					fs,16 \pp
					fs,4
					r8.
				}
				{
					r2.
					fs,16 \pp
					g,4
					r8.
					
				}
				{
					
					r4
					r1
				}
				{
					\partial 8*2 r16 fs,16 fs,8 |
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
					
					cs16 \p
					ef8
					ef4
					fs2
					fs4
					fs16
				}
				{
					
					fs4.. ~
					fs4 \mf 
					fs2 
					fs16
				}
				{
					
					fs8. \f
					fs2
					fs8
					fs16 \ff
					fs4. \fff
				}
				{
					
					fs8
					fs8
					fs16
					fs2 \p \>
					fs8 \pp
					fs16
					ef4
				}
				{
					
					ef4 \pp
					r1
				}
				{
					
					r1
					d'4 \f
				}
				{
					
					d'8 \mp
					r8
					r2
					d'8 \p
					d'4
					d'8
				}
				{
					
					g,2 (
					r2. )
				}
				{
					
					r4 
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4 
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r8
					r1
					bf,8 \mf
				}
				{
					
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
					
					bf8 
					bf16 
					bf8 ~
					bf2 
					bf4 ~
					bf8.
				}
				{
					
					bf16 \p
					bf4 
					bf4 
					bf2 ~
					bf8.
				}
				{
					
					bf16 
					bf2 
					bf4 
					bf16 
					bf4.
				}
				{
					
					bf8 \p
					bf2
					bf8
					bf16
					bf4..
				}
				{
					
					bf16
					bf2
					bf8
					bf16
					bf2
				}
				{
					
					bf2 ~ \p \>
					bf4 \ppp (
					r2 )
				}
				{
					
					r4
					r1
				}
				{
					
					gs,8 \f
					fs,8
					fs,8
					fs,8
					fs,4
					fs,4
					fs,4
				}
				{
					
					fs,8
					fs,8 
					fs,8 
					gs,8 
					gs,4 
					bf,4 
					cs4
				}
				{
					
					cs8 \f
					cs8
					cs8
					cs8
					cs4
					cs4
					cs4
				}
				{
					
					cs8
					cs8 
					cs8 
					cs8 
					cs4 
					cs4 
					cs4 
				}
				{
					
					r4 
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
				{
					
					r4
					r1
				}
			}
		>>
	>>
\midi { }
\layout { }
}
