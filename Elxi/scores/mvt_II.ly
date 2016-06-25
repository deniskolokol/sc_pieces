% Abjad revision 4803
% 2012-01-10 13:36

\version "2.14.2"
\include "english.ly"
%\include "/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/Abjad-2.5-py2.7.egg/abjad/cfg/abjad.scm"
\include "abjad.scm"

#(set-default-paper-size "11x17" 'landscape)
#(set-global-staff-size 12)

\header {
	composer = #"Denis Kolokol, 2012"
	tagline = \markup { "Elxi (pt II), Denis Kolokol, 2012" }
	title = \markup { \bold \sans "Elxi (pt II)" }
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
				\set Staff.instrumentName = \markup { sopranoI ( S I ) }
				\set Staff.shortInstrumentName = \markup { S I }
				{
					\tempo 4=80
					\time 5/4
					r4 
					r1 
				}
				\repeat volta 2 {
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
					ef''4 \mf ~
					ef''1
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
					cs''4 ~ \mf
					cs''1
				}
				{
					\time 5/4
					r4 
					r1 
				}
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
					fs''4 \f ~
					fs''1
				}
				{
					\time 5/4
					r8
					cs''4. \p \< (
					ef''8.
					f''4.
					bf''16 \f \marcato )
					r8
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
					bf''4 ~ \pp ^"soave"
					bf''1
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
					f'16 \staccato \pp ^"but gentle!"
					g'8 \staccato
					a'16
					d''16
					d''16
					d''8.
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
					r16 
					r4 ~
					cs''2... \mf
				}
				{
					\time 5/4
					cs''16
					cs''4
					r2...
				}
				{
					\time 5/4
					r16
					r4
					d'16 \p
					ef'8
					f'16
					c''8 \mf \<
					c''16
					c''16
					c''16
					c''16
					c''16
					c''8 \f
					c''16
					c''16
				}
				{
					\time 5/4
					r16
					r4
					\times 2/3 {
						ef''8
						ef''8 \p
						ef''8
					}
					r16
					r8
					r2
				}
				{
					\time 5/4
					r8.
					fs'16 \f
					fs'1
				}
				{
					\time 5/4
					fs'8.
					r16
					r1
				}
				{
					\time 5/4
					f'16 \f
					r16
					f'8 ~
					f'1
				}
				{
					\time 5/4
					r16
					gs'4 ( \p \>
					a'16
					b'4
					fs''8
					b'4 
					a'4 ) \pp
				}
				{
					\time 5/4
					fs''8. \p
					gs'16
					a'8.
					b'8
					fs''16
					fs''4
					fs''8.
					fs''8.
				}
				{
					\time 5/4
					r8.
					\times 2/3 {
						cs''8
						cs''8 \p
						cs''8
					}
					r16
					\times 2/3 {
						ef''8
						ef''8 \pp
						ef''8
					}
					gs'4
					r4
				}
				{
					\time 5/4
					r4
					a'8 \p
					b'16
					fs''8.
					fs''8
					fs''16
					fs''16
					fs''8.
					r16
					gs'16 \p
					r16
				}
				{
					\time 5/4
					r8
					b'16 \mp
					fs''8.
					fs''4
					fs''16
					fs''4
					fs''16
					r16 
					r8.
				}
				{
					\time 5/4
					r8
					\times 2/3 {
						ef''8
						ef''8 \p
						ef''8
					}
					gs'8
					r2
					a'8
					b'16
					fs''16
				}
				{
					\time 5/4
					r8
					fs''16
					fs''16
					fs''16
					r8
					gs'16
					a'16
					b'16
					fs''8
					fs''4
					fs''16
					fs''8
					fs''16
				}
				{
					\time 5/4
					r8
					\times 2/3 {
						cs''8
						cs''8 \p
						ef''8
					}
					r4
					gs'8
					r4
					a'4 \mp
				}
				{
					\time 5/4
					r4
					fs''8.
					fs''4
					fs''8
					fs''8
					fs''16
					r16
					gs'8
					r16
				}
				{
					\time 5/4
					r8
					b'8 \p
					fs''4
					fs''8
					fs''8
					fs''8
					r16
					\times 2/3 {
						cs''8
						cs''8 \mp
						cs''8
					}
					r16
				}
				{
					\time 5/4
					r16
					r4
					gs'4 \p
					r8
					r4
					a'16 \mp
					b'16
					fs''8
					fs''16
				}
				{
					\time 5/4
					fs''8 \p
					fs''8
					r8
					gs'16 \mp
					a'16
					b'16
					fs''16
					fs''16
					fs''16
					fs''2 \>
				}
				{
					\time 5/4
					\times 2/3 {
						cs''8 \!
						cs''8
						ef''8
					}
					r2.
					gs'4
				}
				{
					\time 5/4
					a'4 ( \p
					b'16 )
					fs''16
					fs''8
					fs''8
					fs''4
					fs''8
					r16
					gs'8.
				}
				{
					\time 5/4
					a'4 (
					b'4 )
					fs''16
					fs''16
					fs''8
					fs''16
					fs''16
					r16
					\times 2/3 {
						cs''8
						cs''8
						cs''8
					}
					r16
				}
				{
					\time 5/4
					gs'4 \p
					r1
				}
				{
					\time 5/4
					r4 
					r1 
				}
				{
					\time 5/4
					c'16 \p (
					c'8
					cs'16
					ef'16
					bf'8 )
					bf'16
					bf'8
					bf'8
					bf'4
					\times 2/3 {
						bf''8
						bf''8
						bf''8
					}
				}
				{
					\time 5/4
					r4 
					r1 
				}
				{
					\time 5/4
					r2
					r4
					r8
					c'16 \p
					cs'8.
					ef'8
				}
				{
					\time 5/4
					r8
					bf'8.
					bf'4
					bf'8
					bf'4
					bf'16
					\times 2/3 {
						bf''8
						bf''8
						bf''8
					}
				}
				{
					\time 5/4
					ef'4 \f
					r1
				}
				{
					\time 5/4
					r16 
					r4
					c'4 ( \p
					cs'16
					ef'4
					bf'16
					bf'4
					bf'16 )
				}
				{
					\time 5/4
					r8
					bf'4 \p
					bf'8
					\times 2/3 {
						bf'8
						bf'8 \mf
						bf'8
					}
					\times 4/5 {
						ef'16
						ef'16
						ef'16 \f
						ef'16
						ef'16
					}
					r4
				}
				{
					\time 5/4
					r16
					r1
					c'8
					cs'16
				}
				{
					\time 5/4
					r8
					bf'8 \p
					bf'4
					bf'8
					bf'16
					bf'16
					r8
					\times 2/3 {
						bf''8
						bf''8
						bf''8
					}
					r8
				}
				{
					\time 5/4
					ef'8
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
					r1
					\times 4/5 {
						c''16
						cs''16
						bf''16 \mf
						bf''16
						c''16
					}
				}
				{
					\time 5/4
					\times 4/5 {
						bf''8
						bf''8
						bf''8 \mp
						fs''8
						fs''8
					}
					r2.
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r2...
					\times 4/5 {
						bf'16
						fs'16
						bf'16 \p
						f'16
						d'16
					}
					r16
				}
				{
					\time 5/4
					r8
					\times 4/5 {
						ef''8 (
						c'''8
						bf''8 \p
						e''8
						bf''8 )
					}
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
					r1
					\times 4/5 {
						ef''16 \staccato
						c''16 \staccato
						bf'16 \staccato \mf
						bf'16 ~
						bf'16
					}
				}
				{
					\time 5/4
					r8
					\times 4/5 {
						ef''8
						f''8
						cs''8 \p
						cs''8
						bf'8
					}
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
					r2
					r4
					r8
					\times 4/5 {
						gs'16
						e'16
						bf'16 \mp
						d''16
						bf''16
					}
					r8
				}
				{
					\time 5/4
					r8
					\times 4/5 {
						ef''8
						g'8
						f''8 \mf
						fs''8
						fs''8
					}
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
					bf'16 \p
					bf'16
					bf'16
					bf'16
					bf'16
					r2
					\times 4/5 {
						c''16
						d''16
						bf''16
						c'''16
						fs''16
					}
					r8.
				}
				{
					\time 5/4
					r4
					r8
					r16
					bf'16
					bf'16
					bf'16
					bf'16
					bf'16
					r8
					\times 4/5 {
						g'16
						ef''16
						bf''16
						cs'''16
						cs'''16
					}
					r8
				}
				{
					\time 5/4
					r4..
					bf'16 \p
					bf'16
					bf'16
					bf'16
					bf'16
					r2
				}
				{
					\time 5/4
					r8.
					bf'16
					r2
					r8
					bf'16
					bf'16
					bf'16
					bf'16
					r8
				}
				{
					\time 5/4
					\times 4/5 {
						cs'''16
						c'''16
						cs'''16 \p
						ef''16
						g'16
					}
					r4
					r2
					bf'16
					bf'16
					bf'16
					bf'16
				}
				{
					\time 5/4
					r4.
					\times 4/5 {
						bf''16
						b''16
						bf''16
						bf''16
						cs'''16
					}
					r8 
					r2
				}
				{
					\time 5/4
					r8
					c''16 \mf
					fs''16
					bf''16
					bf''16
					bf''16
					r2
					r16
					\times 4/5 {
						bf''16
						bf''16 
						fs''16 \p
						c''16
						g'16 (
					}
				}
				{
					\time 5/4
					bf'8 )
					f''8 [
					fs''8
					cs''8 ]
					c''2
					r8
					bf'8
				}
				{
					\time 5/4
					bf'16 \mf
					bf'16 [
					bf'16 ]
					r2
					r4
					r8.
					bf'16
					r16
				}
				{
					\time 5/4
					bf'16
					bf'16 [
					bf'16 ]
					\times 4/5 {
						ef''16 [
						g'16
						c''16 \p
						d''16
						gs''16 ]
					}
					bf'16
					r2
					r4
				}
				{
					\time 5/4
					bf'16 \mf
					bf'16
					bf'16
					r2
					r4
					r8.
					bf'16
					r16
				}
				{
					\time 5/4
					bf'16
					bf'16
					bf'16
					\times 4/5 {
						cs''16 [
						fs''16
						g''16 \p
						f''16
						g'16 ]
					}
					bf'16
					r2
					r4
				}
				{
					\time 5/4
					bf'16 \mf
					bf'16
					bf'16
					\times 4/5 {
						c''16 [
						d''16
						bf''16 \mp
						bf''16
						c''16 ]
					}
					bf'16
					r2
					r4
				}
				{
					\time 5/4
					bf'16 \mf
					bf'16
					bf'16
					r2
					r4
					r8.
					bf'16
					r16
				}
				{
					\time 5/4
					bf'16 \mf
					bf'16
					bf'16
					r2
					r4
					r8.
					bf'16
					r16
				}
				{
					\time 5/4
					bf'16
					bf'16
					bf'16
					\times 4/5 {
						c'''16 [
						bf'16
						bf''16 \p
						fs''16
						d''16 ]
					}
					bf'16
					r2
					r4
				}
				{
					\time 5/4
					bf'16 \mf
					bf'16
					bf'16
					r2
					r4
					r8.
					bf'16
					r16
				}
				{
					\time 5/4
					bf'16
					bf'16
					bf'16
					r2
					r4
					r8.
					cs'16
					r16
				}
				{
					\time 5/4
					r8
					f'16 \p
					bf'8.
					bf'16
					bf'16
					bf'16
					bf'16
					bf'16
					bf'8.
					\times 4/5 {
						bf'16 [
						c''16
						g''16
						ef'''16
						f'''16 ]
					}
					r8
				}
				{
					\time 5/4
					ef'8.
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
					cs'16 \p
					ef'16
					f'16
					bf'8.
					bf'16
					bf'8
					bf'16
					bf'8
					bf'16
					bf'8.
					\times 4/5 {
						bf''16
						cs'''16
						ef''16
						bf''16
						bf''16
					}
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
					e'8 \p ( \<
					fs'16
					gs'16 )  \mf
				}
				{
					\time 5/4
					r4
					cs''8
					cs''8
					cs''8.
					cs''8
					cs''8.
					r4
				}
				{
					\time 5/4
					gs'1 \mp
					r4
				}
				{
					\time 5/4
					r16
					r8
					r1
					e'16
				}
				{
					\time 5/4
					r8.
					fs'8 ( \mp
					gs'8
					cs''8 ) \mf
					cs''4
					r8.
					cs''4 ~
				}
				{
					\time 5/4
					cs''8
					r8
					r1
				}
				{
					\time 5/4
					e'4
					r1
				}
				{
					\time 5/4
					r8.
					e'8 ( \p \<
					fs'8
					gs'8
					cs''16 ) \f
					cs''8
					cs''16
					r4
					cs''8. \pp
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r4
					r2
					r8.
					c''8 ( \pp \<
					cs''16
					d''8 ) \!
				}
				{
					\time 5/4
					r8
					a''16 \p
					a''8
					a''16
					a''8
					a''8
					r8
					r2
				}
				{
					\time 5/4
					d''8
					a''4
					r2..
				}
				{
					\time 5/4
					r1
					c'8
					cs'8
				}
				{
					\time 5/4
					d'8
					a'8.
					a'8
					a'16
					a'8
					a'8
					r2
				}
				{
					\time 5/4
					r4 
					r1 
				}
				{
					\time 5/4
					r1
					c'4 \pp \<
				}
				{
					\time 5/4
					cs'16
					d'8 \p
					a'16
					a'4
					a'16
					a'8
					a'16
					r2
				}
				{
					\time 5/4
					cs'8
					a'4
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
					r2...
					ef''16
					ef''4
				}
				{
					\time 5/4
					r4
					r8
					fs'4 ( \mp \<
					cs''4
					f''8.
					bf''8 ) \f \> \marcato
					bf''16 (
				}
				{
					\time 5/4
					cs'''16
					cs'''4
					c'''16 ) \pp
					r2
					r4
					r8
				}
				{
					\time 5/4
					r2
					r16
					bf''8 \pp
					fs''8
					g''8.
					r4
				}
				{
					\time 5/4
					r1
					g'8 \mp
					c''16 \staccato
					g''16 \staccato
				}
				{
					\time 5/4
					cs'''8 \staccato
					g''8 \staccato
					d''8 \staccato
					d''8 \staccato
					cs''16 \staccato
					bf'8 \pp
					r2
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
					r2
					r8.
					e''4 \pp \staccato
					fs''16 \staccato
				}
				{
					\time 5/4
					f''4 \staccato
					c'''8 \staccato
					bf''4 \staccato
					fs''8 \staccato
					d''8 \staccato
					cs''16 \staccato
					bf'16 \pp
					r4
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
					d''8. \mf \staccato
				}
				{
					\time 5/4
					ef''8 \mp \staccato
					ef''16 \staccato
					c''8 \staccato
					bf'8 \staccato
					g'8 \staccato
					ef''16 \staccato
					d''4 \pp
					fs''4 ~
					fs''8
				}
				{
					\time 5/4
					d''1 \p
					r4
				}
				{
					\time 5/4
					r16
					r1
					cs'''8.
				}
				{
					\time 5/4
					r16
					ef''8
					ef''8.
					ef''8
					fs''8.
					c''8
					d''8.
					bf'4
				}
				{
					\time 5/4
					r8
					r1
					bf''8 \pp
				}
				{
					\time 5/4
					cs'''1
					r4
				}
				{
					\time 5/4
					r16
					r4
					r16
					cs''2 \mp (
					c''8 )
					ef''8
					bf''16
					r16
				}
				{
					\time 5/4
					g'4
					bf'8
					d''4
					ef''8
					bf''8
					r4.
				}
				{
					\time 5/4
					bf''1 \fff ~
					bf''8
					r8
				}
				{
					\time 5/4
					bf'2 \sfz
					r8
					bf'2 \f \glissando
					fs''8
				}
				{
					\time 5/4
					c'''2. \f \glissando
					fs''2
				}
				{
					\time 5/4
					fs''2. \mf \glissando
					bf''2
				}
				{
					\time 5/4
					bf''2 ( \p
					r2. )
				}
				{
					\time 5/4
					bf''2
					r2.
				}
				{
					\time 5/4
					ef''4 \mp
					r4
					bf''2. ( \pp
				}
				{
					\time 5/4
					bf''1 )
					r4
				}
				{
					\time 5/4
					bf''8. ( \pp
					cs'''16 )
					cs'''1
				}
				{
					\time 5/4
					cs'''2. (
					bf'2 )
				}
				{
					\time 5/4
					bf'1 \pp
					r4
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
					\tempo 4=130
					\time 13/8
					r8
					r1.
				}
				{
					\time 13/8
					r8
					r4
					r1
					d''4 \f
				}
				{
					\time 13/8
					d''8 \f
					d''8
					d''8
					d''8
					d''4
					c''4
					c''8
					c''8
					c''8
					c''4
				}
				{
					\time 13/8
					c''8 \f
					c''8
					c''8
					bf'8
					bf'4
					gs'4
					e'8
					e'8
					gs''8
					a''4 ~
				}
				{
					\time 13/8
					a''2 (
					gs'8
					r1 )
				}
			}
			\context Staff = "sopranoII" {
				\set Staff.instrumentName = \markup { sopranoII ( S II ) }
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
					bf''4 \mf ~
					bf''1
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
					bf''4 ~ \mf
					bf''1
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
					bf''4 \f ~
					bf''1
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
					c''4 ~ \pp
					c''1
				}
				{
					\time 5/4
					r4..
					cs'8
					ef'16
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
					r16 
					r4
					cs'16 \p
					ef'8
					f'16
					bf'16 \mf \<
					bf'16
					bf'8. ~
					bf'16 \f
					bf'16
					bf'16
					bf'16
					r8
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
					\times 2/3 {
						cs''8
						cs''8 \pp
						cs''8
					}
					r2...
				}
				{
					\time 5/4
					r8.
					bf''16 \f
					bf''1
				}
				{
					\time 5/4
					bf''8.
					r16
					r1
				}
				{
					\time 5/4
					bf''16 \f
					r16
					bf''8 \mf ~
					bf''1
				}
				{
					\time 5/4
					bf''8
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
					r16
					r2. \!
					gs'16 \mp (
					a'8
					b'8
					fs''8 )
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
					r4..
					gs'16 \p (
					a'16
					b'16
					fs''8 )
					r2
				}
				{
					\time 5/4
					r4 
					r1 
				}
				{
					\time 5/4
					r8
					r2
					gs'16 \p
					a'8
					b'16
					fs''8
					r4
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
					r4
					gs'8 ( \p
					a'16
					b'16
					fs''8 )
					r16
					r2
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r8
					r2
					gs'8 ( \p
					a'8
					b'8
					fs''4 )
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
					gs'8 \p
					a'8
					b'16
					fs''16
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
					d'4 \p
					ef'16
					f'4
					c''8
					c''8
					c''8
					c''16
				}
				{
					\time 5/4
					r8
					c''4 \p
					\times 2/3 {
						ef''8 [
						ef''8
						ef''8 ]
					}
					\times 4/5 {
						f''16 [
						f''16
						f''16
						f''16
						f''16 ]
					}
					r4.
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
					r1
					d'16 \p \<
					ef'16
					f'8
				}
				{
					\time 5/4
					r16 \!
					c''4 ~ \f
					c''4
					\times 2/3 {
						f'8 [
						fs'8
						fs'8 ]
					}
					\times 4/5 {
						f''16 [
						f''16
						f''16
						f''16
						f''16 ]
					}
					r8.
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
					r8
					r2
					d'4 \p \<
					ef'8.
					f'8
					c''16 \f
				}
				{
					\time 5/4
					r16 
					c''16 \p
					c''16
					c''16
					c''8.
					\times 2/3 {
						ef''8 [
						ef''8
						ef''8 ]
					}
					\times 4/5 {
						f''16 [
						f''16
						f''16
						f''16
						f''16 ]
					}
					r16
					r4
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
					\times 4/5 {
						d'16
						fs'16
						gs'16 \p
						gs'16
						bf'16
					}
					r2.
				}
				{
					\time 5/4
					\fraction \times 3/4 {
						cs'''8
						cs'''8
						fs''8
						g'8
					}
					r2..
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r8
					\times 4/5 {
						f'16 \staccato
						fs'16 \staccato
						a'16 \mf \staccato
						b'16 (
						fs'16 )
					}
					r8
					r4
					r2
				}
				{
					\time 5/4
					\fraction \times 3/4 {
						ef''8 \p
						fs''8
						bf'8
						fs''8
					}
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
					\times 4/5 {
						bf'16
						cs''16
						bf'16 \f
						d''16
						fs''16
					}
					r2.
				}
				{
					\time 5/4
					\fraction \times 3/4 {
						bf'8 ( \p
						bf'8
						cs''8
						ef''8 )
					}
					r2..
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r8
					\times 4/5 {
						fs'16
						g'16
						e'16 \mf
						f'16
						ef'16
					}
					r8
					r2.
				}
				{
					\time 5/4
					r4
					r8
					r16
					\fraction \times 3/4 {
						c''8 \p
						f''8
						bf''8
						bf''8
					}
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
					r16 
					r8 
					r1
					f'16 \p
				}
				{
					\time 5/4
					r8
					b'8
					ef''4
					ef''8
					r8
					bf''8 [
					bf''8
					bf''8 ]
					r8
				}
				{
					\time 5/4
					r4
					r2
					bf''8 [ ( \p
					fs''8
					d''8 ] )
					r8
				}
				{
					\time 5/4
					r4
					r2
					d''8 [ (
					cs'''8
					c'''8 ] )
					r8
				}
				{
					\time 5/4
					r4
					r2
					bf'8 [ ( \p
					bf''8
					fs''8 ] )
					r8
				}
				{
					\time 5/4
					r4
					r2
					c''8 [ (
					fs''8
					d''8 ] )
					r8
				}
				{
					\time 5/4
					r4
					r2
					cs'''8 [ ( \p
					bf''8
					c''8 ] )
					r8
				}
				{
					\time 5/4
					r4
					r2
					bf''8 [ (
					bf''8
					g'8 ] )
					r8
				}
				{
					\time 5/4
					r4
					r2
					a''8 [ ( \p
					d''8
					d''8 ] )
					r8
				}
				{
					\time 5/4
					r4
					r2
					g'8 [ (
					c''8
					c''8 ] )
					r8
				}
				{
					\time 5/4
					r4
					r2
					g'8 [ ( \p
					d''8
					bf''8 ] )
					r16
					f'16 ~

				}
				{
					\time 5/4
					f'8
					r16
					r1
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
					r1 
					b'4 \f
				}
				{
					\time 5/4
					fs'8. ( \mp \<
					b'4
					fs''16 )
					fs''4 \mf
					fs''16
					fs''4
					fs''8
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
					r16
					b8 ( \mp \<
					fs'16
					b'8
					fs''16 ) \mf
					fs''4
					fs''16
					fs''8
					fs''8
					r4
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
					b4 ( \pp \<
					fs'16
					b'4
					fs''8 ) \p
					fs''4
					fs''8.
					fs''8
				}
				{
					\time 5/4
					fs''8
					r8
					r1
				}
				{
					\time 5/4
					r1
					gs'8. ( \pp \<
					c''16
				}
				{
					\time 5/4
					gs''8 ) \p
					gs''4
					gs''8
					gs''8
					gs''8.
					r4..
				}
				{
					\time 5/4
					c''8 \p
					gs''16
					gs''4
					r2.
					r16
				}
				{
					\time 5/4
					r1
					gs'8 ( \pp \<
					c''8
				}
				{
					\time 5/4
					gs''8 ) \p
					gs''4
					gs''8
					gs''8
					gs''8
					r2
				}
				{
					\time 5/4
					c''8
					gs''4
					r2..
				}
				{
					\time 5/4
					r1
					c'8 ( \pp \<
					gs'16
					c''16
				}
				{
					\time 5/4
					gs''8 ) \p
					gs''4
					gs''16
					gs''4
					gs''16
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
					d'16 \pp ( \<
					g'4
					ef''8.
					bf''8 \mf \>
					bf''4
					g''8.
					ef''16
					ef''8 ) \pp
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					bf''4 \mf
					ef''8 \pp
					r2
					r4
					r8
				}
				{
					\time 5/4
					r2
					r4
					r8
					bf'8 \p \< \staccato
					ef''8 \staccato
					ef''8 \staccato
				}
				{
					\time 5/4
					c''8 \staccato
					fs''8 \staccato
					bf''16 \staccato
					c'''4 \staccato
					bf''8 \ppp
					r2
					r16
				}
				{
					\time 5/4
					ef''8
					r8 
					r1
				}
				{
					\time 5/4
					r8
					r1
					g'8 \p \staccato
				}
				{
					\time 5/4
					e''16 \staccato
					fs''8 \staccato
					fs''8. \mf \staccato
					c'''8 \f \staccato
					fs''16 \staccato
					fs''4 \staccato
					d''8 \pp
					r16
					r4
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
					cs''8 \mp \staccato
				}
				{
					\time 5/4
					bf'16 \p \staccato
					gs''8 \staccato
					cs''8. \staccato
					ef''4 \staccato
					cs''8 \staccato
					c''8 \staccato
					c'''8. ( \ppp
					cs''8 )
					r16
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
					r1
					bf'16 \p \staccato
				}
				{
					\time 5/4
					r16
					fs'8 \staccato
					f''4 \staccato
					g'16 \staccato
					bf''4 \staccato
					c''16 \staccato
					r4
					g'8. ( \pp
				}
				{
					\time 5/4
					bf'4 )
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
					r2
					bf'8 \mp \staccato
					cs''8 \staccato
					bf'16 \staccato
					g'8 \staccato
					c'''8 \staccato
					bf''16 \staccato
					d''16 \staccato
				}
				{
					\time 5/4
					c''16 ( \pp
					d''4
					c''16 )
					r2
					r4.
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					g''1 ~ \fff
					g''8
					r8
				}
				{
					\time 5/4
					a''2 \sfz
					r8
					a''2 \f \glissando
					a'8
				}
				{
					\time 5/4
					r4
					ef''2. \mf \glissando
					bf''4
				}
				{
					\time 5/4
					ef''1 ( \p
					r4 \! )
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
					c''2. \pp \glissando
					ef''4 \glissando
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
					r4
					r1
				}
				{
					\time 13/8
					r8
					r1.
				}
				{
					\time 13/8
					r8
					r1.
				}
				{
					\time 13/8
					r8
					r1.
				}
				{
					\time 13/8
					r8
					r1
					e''2 ~ \f
				}
				{
					\time 13/8
					e''1. ~
					e''16 ~
					e''32 ( \sfz
					a''32 )
				}
			}
			\context Staff = "tenor" {
				\set Staff.instrumentName = \markup { tenor ( T ) }
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
					fs'4 \p (
					fs'1 )
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
					c'4 ~ \p
					c'1
				}
				{
					\time 5/4
					c'8
					r8 
					r1
				}
				{
					\time 5/4
					ef4 ~ \pp
					ef1
				}
				{
					\time 5/4
					ef8
					fs8
					fs2 (
					r2 )
				}
				{
					\time 5/4
					r4
					r2. (
					fs4 \pp )
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
					bf'4 ~ \mf
					bf'1
				}
				{
					\time 5/4
					cs'8 (
					ef'16
					r16 )
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
					r4
					a'2... \p
				}
				{
					\time 5/4
					r8 
					r2
					g'16
					a'8
					r4..
				}
				{
					\time 5/4
					r4
					r8
					r16
					f16 \p
					g16
					a16
					d'16
					d'16
					d'8 ~
					d'16
					d'16
					d'16
					d'16
					d'8
				}
				{
					\time 5/4
					a16
					a4
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
					r16
					r4
					d'2... \mf
				}
				{
					\time 5/4
					d'16
					d'4
					r2...
				}
				{
					\time 5/4
					r8.
					f'16 \pp
					f'1 \<
				}
				{
					\time 5/4
					f'8. \f \>
					r16 \!
					r1
				}
				{
					\time 5/4
					bf'16 \f
					r16
					bf'8 ~ \mf
					bf'1
				}
				{
					\time 5/4
					r16
					bf''16 ~
					bf''8
					bf''1 \p \>
				}
				{
					\time 5/4
					bf''16 \pp
					r16
					r8
					r1
				}
				{
					\time 5/4
					r16
					bf''16
					bf''8 ~
					bf''1
				}
				{
					\time 5/4
					bf''4 \p
					r1
				}
				{
					\time 5/4
					r16
					fs''16
					fs''8 ~
					fs''1
				}
				{
					\time 5/4
					fs''8 \pp
					r8 
					r1
				}
				{
					\time 5/4
					r16
					d''16
					d''8 ~
					d''1
				}
				{
					\time 5/4
					d''8 \pp
					r8
					r1
				}
				{
					\time 5/4
					r16
					bf''16
					bf''8 ~
					bf''1
				}
				{
					\time 5/4
					bf''8 \p
					r8
					r1
				}
				{
					\time 5/4
					r16
					bf''16
					bf''8 ~
					bf''1
				}
				{
					\time 5/4
					bf''8 \p
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
					r16 (
					r8
					r2
					f'4 ) \p
					fs'8
					gs'8.
				}
				{
					\time 5/4
					r8
					ef''8
					ef''8
					ef''8
					ef''8
					ef''8
					\times 4/5 {
						bf''16
						bf''16
						bf''16
						bf''16
						bf''16
					}
					r4
				}
				{
					\time 5/4
					r1
					\times 2/3 {
						c''8
						c''8 \pp
						c''8
					}
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
					f'16 \f
					fs'16
					gs'16
					ef''2 \p ~
					ef''8.
					r8
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
					f'4
					fs'8. \p
					gs'4
					ef''16
					ef''4
					ef''16
					ef''16
					ef''16
				}
				{
					\time 5/4
					ef''16 \mf
					r16
					\times 4/5 {
						bf''16 [
						bf''16
						bf''16 \f
						bf''16
						bf''16 ]
					}
					\times 2/3 {
						c''8 [
						c''8 \mp
						c''8 ]
					}
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
					r8.
					\times 2/3 {
						c'''8 [
						bf''8 \f
						ef''8 ]
					}
					\times 4/5 {
						g''16 [
						gs''16
						ef''16 \mp
						ef''16
						ef''16 ]
					}
					r16 
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
					\times 4/5 {
						d'16 [
						b'16
						b'16 \mf
						ef'16
						e'16 ]
					}
					\times 2/3 {
						cs'''8 [
						ef''8 \p
						d''8 ]
					}
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
					r8
					r4
					\times 4/5 {
						ef'16 [
						ef'16
						ef'16 \pp
						cs'16
						d'16 ]
					}
					\times 2/3 {
						bf''8 [
						ef''8
						c'''8 ]
					}
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
					r4.
					\times 2/3 {
						e'8 [
						e'8
						c''8 ]
					}
					\times 4/5 {
						g'16 [
						ef''16
						e''16
						fs''16
						cs''16 ]
					}
					r4.
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
					bf8 \p
				}
				{
					\time 5/4
					r4
					r8
					r16
					ef'4 \p
					r8
					d''4
					e'8.
				}
				{
					\time 5/4
					r16
					r8
					r2
					bf'2
					ef'16
				}
				{
					\time 5/4
					r4..
					c'4 \p
					b2
					r16
				}
				{
					\time 5/4
					r8.
					bf2
					ef'4
					r4
					bf16
				}
				{
					\time 5/4
					r4
					d'2 \p
					r2
				}
				{
					\time 5/4
					r4
					ef'4
					r8.
					a'4
					ef'16
					ef'4
				}
				{
					\time 5/4
					ef'8 \f
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
					bf'8 [ \p
					d'8
					bf8 ]
					r2
					r4
				}
				{
					\time 5/4
					r8
					g8 [
					g'8
					d'8 ]
					r2
					r4
				}
				{
					\time 5/4
					r8
					a'8 [ \p
					d'8
					fs'8 ]
					r2
					r4
				}
				{
					\time 5/4
					r8
					d'8 [
					d'8
					c''8 ]
					r2
					r4
				}
				{
					\time 5/4
					r8
					bf'8 [ \p
					bf8
					fs'8 ]
					r4
					r2
				}
				{
					\time 5/4
					r8
					bf'8 [
					bf'8
					bf'8 ]
					r2
					r4
				}
				{
					\time 5/4
					r8
					c''8 [ \p
					a'8
					fs'8 ]
					r4
					r2
				}
				{
					\time 5/4
					r8
					bf'8 [
					c''8
					ef'8 ]
					r4
					r2
				}
				{
					\time 5/4
					r8
					bf'8 [ \p
					ef'8
					ef'8 ]
					r2
					r4
				}
				{
					\time 5/4
					r8
					d'8 [
					ef'8
					c'8 ]
					r2
					r4
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
					r1
					a'8 \p
					e''16
				}
				{
					\time 5/4
					a'4 \pp \<
					e''16 \p
					e''8
					e''8
					e''8
					e''8.
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
					r8.
					a'8 ( \mp \<
					e''16
					a''8
					e'''16 ) \mf
					e'''8
					e'''16
					e'''8
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
					a8 ( \p \<
					e'8.
					a'4
					e''16 ) \f
					e''4
					r8
					e''8 \pp
					e''8
				}
				{
					\time 5/4
					e'16 (
					r16
					r8
					r1 )
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
					g'8 ( \pp \<
					ef''8
				}
				{
					\time 5/4
					g''8
					ef'''16 ) \p
					ef'''4
					ef'''8.
					ef'''8
					ef'''8
					r4.
				}
				{
					\time 5/4
					r4 
					r1 
				}
				{
					\time 5/4
					r1
					g8 ( \pp \<
					ef'8
				}
				{
					\time 5/4
					g'8
					ef''8 \p )
					ef''4
					ef''8
					ef''8
					ef''16
					r4..
				}
				{
					\time 5/4
					r4 
					r1 
				}
				{
					\time 5/4
					r2
					r4.
					g8 ( \pp
					ef'8.
					g'16
				}
				{
					\time 5/4
					ef''16 ) \p
					ef''4
					ef''8.
					ef''8
					ef''8.
					r4
					r8.
				}
				{
					\time 5/4
					g8.
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
					bf4 ( \p \<
					bf4
					g'8
					fs'8 \mf \>
					bf'8
					cs''8 )
				}
				{
					\time 5/4
					g''4
					bf''8 \pp
					r2..
				}
				{
					\time 5/4
					r4 
					r1 
				}
				{
					\time 5/4
					r2
					r4
					r8
					g'4 \mp
					ef''8 \staccato
				}
				{
					\time 5/4
					d''8 \p \staccato
					d''8 \staccato
					bf''8 \staccato
					bf''8. \staccato
					bf''4 \staccato
					ef''8. \pp
					r4
				}
				{
					\time 5/4
					r4 
					r1 
				}
				{
					\time 5/4
					r1
					bf8 \p \staccato
					d'8 \staccato
				}
				{
					\time 5/4
					cs'8 \p \staccato
					ef'8 \staccato
					c'4 \staccato
					a'8 \staccato
					c'8 \staccato
					c'8. \pp
					r16
					r4
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					bf16 \pp \staccato
					ef'8 \staccato
					cs'8 \staccato
					fs'8. \staccato
					gs'8. \staccato
					bf'8. \staccato
					bf'8 \staccato
					bf'8 ( \ppp
					bf8 )
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
					d'8 \p \staccato
				}
				{
					\time 5/4
					fs'16 \staccato
					ef''4 \staccato
					c''16 \staccato
					c'''8 \staccato
					bf''8 \staccato
					d''8 \staccato
					d''8. ( \pp
					d'8 )
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
					f'4 \p
					cs''8 \staccato
					g''4
					g'8 \staccato
					bf'4
					g'8 \staccato
					cs''8 \staccato
				}
				{
					\time 5/4
					g'16 \pp
					bf''2
					r2
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
					c''1 ~ \fff
					c''8
					r8
				}
				{
					\time 5/4
					d'2 \sfz
					r8
					d'2 \f \glissando
					cs''8
				}
				{
					\time 5/4
					r8
					ef'2 \p \glissando
					bf'2 \glissando
					ef'8
				}
				{
					\time 5/4
					ef'2 \glissando
					bf'2 (
					r4 )
				}
				{
					\time 5/4
					c''2.. ( \mp
					r4. )
				}
				{
					\time 5/4
					r4 
					r1 
				}
				{
					\time 5/4
					r4
					c''2. \mp \glissando
					bf''8 \pp
					r8
				}
				{
					\time 5/4
					bf''2
					r2.
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
					\time 13/8
					r1
					cs''4 \f
					cs''8
					cs''8
					cs''8
				}
				{
					\time 13/8
					cs''8 \f
					cs''4
					cs''4
					cs''8
					cs''8
					cs''8
					cs''4
					cs''8
					cs''8
					cs''8
				}
				{
					\time 13/8
					cs''8 \f
					cs''4
					cs''4
					c''8
					c''8
					c''8
					c''4
					c''8
					c''8
					c''8
				}
				{
					\time 13/8
					c''8 \f
					bf'4
					bf'4
					gs'8
					gs'8
					gs'8
					r8
					r2
				}
				{
					\time 13/8
					r8
					r1.
				}
			}
			\context Staff = "baritone" {
				\clef "bass"
				\set Staff.instrumentName = \markup { baritone ( Br ) }
				\set Staff.shortInstrumentName = \markup { Br }
				{
					\time 5/4
					r4 
					r1 
				}
				{
					\time 5/4
					d4 \mp ~
					d1
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
					cs4 ~ \p
					cs1
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
					ef4 \p ~
					ef1
				}
				{
					\time 5/4
					r8
					f,16
					g,8
					a,16 (
					d8 )
					d8.
					r16 
					r2
				}
				{
					\time 5/4
					e4 ~ \pp
					e1
				}
				{
					\time 5/4
					r8
					d8 ~
					d1 \>
				}
				{
					\time 5/4
					r4 \!
					fs,16 \pp
					b,8.
					ef16
					d8.
					fs16
					ef8.
					r4
				}
				{
					\time 5/4
					r8
					b,16 (
					gs,8.
					ef16
					ef16
					gs16
					g8. )
					r2
				}
				{
					\time 5/4
					d8 \f \marcato
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
					g4 \mf ~
					g1
				}
				{
					\time 5/4
					r4 
					r1 
				}
				{
					\time 5/4
					r1
					g,8 \pp
					a,8
				}
				{
					\time 5/4
					b,8 (
					e16
					e8
					e8 )
					r16
					r2.
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
					r8
					r16
					d16 \marcato \p
					d2.
				}
				{
					\time 5/4
					d4.. (
					r16
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
					r16
					r4
					ef2... \mf
				}
				{
					\time 5/4
					ef16
					ef4
					r2...
				}
				{
					\time 5/4
					r8.
					gs,16 \p \<
					a,8
					b,16
					fs16 \f
					fs16
					fs8
					fs16
					fs16
					fs16
					fs8
					r4
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					c16 \f
					r16
					c8 ~ \p
					c1
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
					r16
					r2.
					a,8 \pp \<
					fs8
					a8
					fs'16 \mf
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
					r4..
					a,16 ( \mp
					fs8.
					a8
					fs'16 )
					r4.
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r8 
					r2
					a,16  \p (
					fs8
					a16
					fs'16 )
					r16
					r4
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
					r4 \!
					a,8 \mp
					fs8
					a16 \p
					fs'16 \mp
					r16 
					r2
				}
				{
					\time 5/4
					r4 
					r1 
				}
				{
					\time 5/4
					r8
					r2 (
					a,8 ) \p
					fs8.
					a8
					fs'16
					r8
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
					a,16 \p
					fs8
					a16
					fs'8.
					c2
					c16 ~
				}
				{
					\time 5/4
					c8
					r8
					r1
				}
				{
					\time 5/4
					c4 ( \p
					r1 )
				}
				{
					\time 5/4
					r1 (
					b4 )
				}
				{
					\time 5/4
					r2
					b2
					r4
				}
				{
					\time 5/4
					r4
					r8
					r16
					c2 \mf
					r16
					r4
				}
				{
					\time 5/4
					c2 \p
					r2.
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4
					fs'1 \p
				}
				{
					\time 5/4
					r4 ~
					c1 \p ~
				}
				{
					\time 5/4
					c4 (
					r1 )
				}
				{
					\time 5/4
					r4
					r1
				}
				{
					\time 5/4
					r1 (
					bf4 \p
				}
				{
					\time 5/4
					bf1
					r4 )
				}
				{
					\time 5/4
					r1 (
					bf4 \mf
				}
				{
					\time 5/4
					bf1
					r4 )
				}
				{
					\time 5/4
					r1 (
					d4 \mp
				}
				{
					\time 5/4
					d1
					r4 )
				}
				{
					\time 5/4
					r1 (
					fs4 \mp
				}
				{
					\time 5/4
					fs1
					r4 )
				}
				{
					\time 5/4
					r1(
					d4 \p
				}
				{
					\time 5/4
					d1
					r4 )
				}
				{
					\time 5/4
					r1 (
					bf4 \mf
				}
				{
					\time 5/4
					bf1
					r4 )
				}
				{
					\time 5/4
					r1
					bf4 \marcato \f \>
				}
				{
					\time 5/4
					r8 \!
					r1
					bf,8 \p
				}
				{
					\time 5/4
					r16
					bf,16 \p
					bf,16
					bf,16
					\times 2/3 {
						ef16 [
						ef16
						ef16 ]
					}
					bf,16
					r16
					r2.
				}
				{
					\time 5/4
					r16
					bf,16
					bf,16
					bf,16
					\times 2/3 {
						ef'16 [
						ef'16
						ef'16 ]
					}
					bf,16
					r16
					r2.
				}
				{
					\time 5/4
					bf,16 \p
					bf,16 [
					bf,16 ]
					\times 2/3 {
						ef16 [
						ef16
						ef16 ]
					}
					bf,16
					r8
					r2.
				}
				{
					\time 5/4
					r16
					bf,16
					bf,16
					bf,16
					\times 2/3 {
						ef16 [
						ef16
						ef16 ]
					}
					bf,16
					r16
					r2.
				}
				{
					\time 5/4
					r4
					\times 2/3 {
						ef'16 [
						ef'16 \p
						ef'16 ]
					}
					\times 4/5 {
						ef16 [
						ef16
						ef16
						ef16
						ef16 ]
					}
					r8
					r2
				}
				{
					\time 5/4
					bf,16
					bf,16
					bf,16
					bf,16
					\times 2/3 {
						ef'16
						ef'16
						ef'16
					}
					r2..
				}
				{
					\time 5/4
					bf,8 \f
					r8
					r1
				}
				{
					\time 5/4
					r1
					bf,16
					bf,16
					bf,16
					bf,16
				}
				{
					\time 5/4
					r16
					\times 2/3 {
						ef16 [
						ef16 \mp
						ef16 ]
					}
					\times 4/5 {
						bf16 [
						bf16
						bf16
						bf16
						bf16 ]
					}
					bf,16
					r2
					r16
					bf,16
					bf,16
					r16
				}
				{
					\time 5/4
					bf,16
					\times 2/3 {
						ef16 [
						ef16
						ef16 ]
					}
					\times 4/5 {
						bf16 [
						bf16
						bf16
						bf16
						f16 ]
					}
					bf,16
					r2
					r16 
					bf,16
					bf,16
					r16
				}
				{
					\time 5/4
					bf16 ~ \mp
					\times 2/3 {
						bf16 [
						gs16
						gs16 ]
					}
					\times 4/5 {
						ef16 [
						ef16
						cs16
						cs16
						cs16 ]
					}
					bf,16
					r2
					r16 
					bf,16
					bf,16
					r16
				}
				{
					\time 5/4
					bf,16
					\times 2/3 {
						fs16 [
						fs16
						fs16 ]
					}
					\times 4/5 {
						ef16 [
						ef16
						f16
						bf16
						bf16 ]
					}
					bf,16
					r2
					r16 
					bf,16
					bf,16
					r16
				}
				{
					\time 5/4
					bf,16 \mp
					\times 2/3 {
						ef16 [
						ef16
						ef16 ]
					}
					bf,16
					r2
					r4
					r16 
					bf,16
					bf,16
					r16
				}
				{
					\time 5/4
					bf,16
					\times 2/3 {
						ef16 [
						ef16
						ef16 ]
					}
					\times 4/5 {
						bf16 [
						bf16
						bf16
						bf16
						bf16 ]
					}
					bf,16
					r2
					r16
					bf,16
					bf,16
					r16
				}
				{
					\time 5/4
					bf,16 \mp
					\times 2/3 {
						ef16 [
						ef16
						ef16 ]
					}
					\times 4/5 {
						bf16 [
						bf16
						bf16
						bf16
						bf16 ]
					}
					bf,16
					r2
					r16
					bf,16
					bf,16
					r16
				}
				{
					\time 5/4
					bf,16
					\times 2/3 {
						ef16 [
						ef16
						ef16 ]
					}
					bf,16
					r2
					r4
					r16 
					bf,16
					bf,16
					r16
				}
				{
					\time 5/4
					bf,16 \mp
					\times 2/3 {
						ef16 [
						ef16
						ef16 ]
					}
					bf,16
					r2
					r4
					r16 
					bf,16
					bf,16
					r16
				}
				{
					\time 5/4
					bf,16
					\times 2/3 {
						ef16 [
						bf,16
						bf,16 ]
					}
					\times 4/5 {
						f16 [
						ef16
						ef16
						cs16
						cs16 ]
					}
					fs,16
					r2
					r16
					gs,8
					r16
				}
				{
					\time 5/4
					ef8. \f
					ef16
					ef16
					ef16
					ef8
					ef16
					ef8
					\times 2/3 {
						bf,16 [
						bf,16
						bf,16 ]
					}
					r4.
					r16
				}
				{
					\time 5/4
					r2
					gs,16
					bf,16
					ef8.
					ef16
					ef8
					ef16
					ef8
					ef16
				}
				{
					\time 5/4
					r4
					\times 2/3 {
						bf16 [
						bf16 \p
						bf16 ]
					}
					\times 4/5 {
						ef16 [
						ef16
						ef16 \pp
						ef16
						ef16 ]
					}
					fs,16
					r8.
					r8
					r8
					gs,8 \p
				}
				{
					\time 5/4
					r16
					bf,8
					ef16
					ef16
					ef8.
					ef16
					ef8
					ef16 [
					ef16 ]
					\times 2/3 {
						bf16 [
						bf16
						bf16 ]
					}
					r16 
					r4
				}
				{
					\time 5/4
					r2
					fs,16 ( \p
					gs,8.
					bf,16
					ef4
					ef8. )
				}
				{
					\time 5/4
					ef16
					ef8.
					\times 2/3 {
						bf16
						bf16
						bf16
					}
					r2..
				}
				{
					\time 5/4
					r2..
					gs,8 ~ \mp
					gs,4
				}
				{
					\time 5/4
					gs,1 \p
					r4
				}
				{
					\time 5/4
					r1
					gs,4
				}
				{
					\time 5/4
					gs,1 \p
					r4
				}
				{
					\time 5/4
					r1
					gs,4 \p
				}
				{
					\time 5/4
					gs,1\p
					r4
				}
				{
					\time 5/4
					r1
					gs,4 \p
				}
				{
					\time 5/4
					gs,1 \p
					r4
				}
				{
					\time 5/4
					r1
					gs,4 \p
				}
				{
					\time 5/4
					gs,1 \p
					r4
				}
				{
					\time 5/4
					r1
					gs,4 \p
				}
				{
					\time 5/4
					gs,1 \p
					r4
				}
				{
					\time 5/4
					r1
					gs,4 \p
				}
				{
					\time 5/4
					gs,1 \p
					r4
				}
				{
					\time 5/4
					r1
					gs,4 \p
				}
				{
					\time 5/4
					gs,1 \p
					r4
				}
				{
					\time 5/4
					r1
					gs,4 \p
				}
				{
					\time 5/4
					gs,1 \p
					r4
				}
				{
					\time 5/4
					r1
					gs,4 \p
				}
				{
					\time 5/4
					gs,1 \p
					r4
				}
				{
					\time 5/4
					r1
					g,4 \p
				}
				{
					\time 5/4
					g,1 \p
					r4
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r1
					bf4 \p
				}
				{
					\time 5/4
					bf1 \p
					r4
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
					cs8 \mp
				}
				{
					\time 5/4
					cs1 \pp
					r4
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
					c8 \mp
				}
				{
					\time 5/4
					c1 \mp
					r4
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
					b,1 ~ \fff
					b,8
					r8
				}
				{
					\time 5/4
					bf,2 \sfz
					r8
					bf,2 \f \glissando
					c'8
				}
				{
					\time 5/4
					r8
					c2 \p \glissando
					b,2 \glissando
					c8
				}
				{
					\time 5/4
					c2 \>
					r16 \<
					c2 ~
					c8. \mp
				}
				{
					\time 5/4
					r8
					c1 ( \mp
					r8 )
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
					\time 13/8
					r8
					r1.
				}
				{
					\time 13/8
					r4.
					b4 \f
					b8
					b8
					b8
					b8
					b4
					b4
				}
				{
					\time 13/8
					b8 \f
					b8
					b8
					b4
					a8
					a8
					a8
					a8
					a4
					a4
				}
				{
					\time 13/8
					a8 \f
					a8
					a8
					a4
					g8
					f8
					f8
					f8
					cs4
					f4 (
				}
				{
					\time 13/8
					g,8 ) \f
					a,8
					a,8
					r4
					r1
				}
			}
			\context Staff = "bass" {
				\clef "bass"
				\set Staff.instrumentName = \markup { bass ( B ) }
				\set Staff.shortInstrumentName = \markup { B }
				{
					\time 5/4
					r4 
					r1 
				}
				{
					\time 5/4
					b,4 \mp ~
					b,1
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
					b,4 ~ \p
					b,1
				}
				{
					\time 5/4
					r4 
					r1 
				}
				{
					\time 5/4
					bf,4 ~ \mf
					bf,1
				}
				{
					\time 5/4
					r4 
					r1 
				}
				{
					\time 5/4
					ef,4 ~ \p
					ef,1
				}
				{
					\time 5/4
					r8
					d,8 (
					e,8.
					fs,8
					b,8. )
					r2
				}
				{
					\time 5/4
					ef,4 \pp ~
					ef,1
				}
				{
					\time 5/4
					r8
					ef,8
					ef,1 \>
				}
				{
					\time 5/4
					r4 \!
					fs,8 ~ \pp
					fs,16
					d8
					ef16
					r8 
					r2
				}
				{
					\time 5/4
					r8
					fs,8 (
					gs,8.
					bf,8
					b8 )
					r16 
					r2
				}
				{
					\time 5/4
					f,4 ~ \f
					f,1
				}
				{
					\time 5/4
					f8 (
					gs,16
					bf,16
					r1 )
				}
				{
					\time 5/4
					ef,8 \mf
					r8
					r1
				}
				{
					\time 5/4
					b,16 \p
					cs8
					r16
					r1
				}
				{
					\time 5/4
					e,4 \pp ~
					e,1
				}
				{
					\time 5/4
					r4..
					g,16
					a,8
					r8
					r2
				}
				{
					\time 5/4
					r16
					r4
					g,2... \pp
				}
				{
					\time 5/4
					g,16
					g,4
					r2...
				}
				{
					\time 5/4
					r4
					r8
					r16
					b,16 \marcato \p
					b,2.
				}
				{
					\time 5/4
					b,4.. (
					r16
					r2. )
				}
				{
					\time 5/4
					r16 
					r4 ~
					bf,2... \mf \<
				}
				{
					\time 5/4
					bf,16 \f
					bf,4 \ff
					r2...
				}
				{
					\time 5/4
					r16
					r4
					ef,2... \p
				}
				{
					\time 5/4
					ef,16
					ef,4
					r2...
				}
				{
					\time 5/4
					r4 
					r1 
				}
				{
					\time 5/4
					r8.
					gs,16 \p \<
					a,8.
					b,16
					fs8 \f
					fs16
					fs8
					fs16
					fs8. ~
					fs16
					fs8
				}
				{
					\time 5/4
					ef,16 \p
					r16
					ef,8 ~ \mp
					ef,1
				}
				{
					\time 5/4
					r16
					g16 ~
					g8
					g1 \pp \<
				}
				{
					\time 5/4
					g16 \p
					r16 
					r8 ~
					r1
				}
				{
					\time 5/4
					r16
					g16
					g8 ~
					g1
				}
				{
					\time 5/4
					g4 \p
					r1
				}
				{
					\time 5/4
					r16
					ef16
					ef8 ~
					ef1
				}
				{
					\time 5/4
					ef8 \pp
					r8 
					r1
				}
				{
					\time 5/4
					r16
					fs16
					fs8 ~
					fs1
				}
				{
					\time 5/4
					fs8 \pp
					r8
					r1
				}
				{
					\time 5/4
					r16
					cs16
					cs8 ~
					cs1
				}
				{
					\time 5/4
					cs8 \pp
					r8 
					r1
				}
				{
					\time 5/4
					r16
					ef16
					ef8 ~
					ef1
				}
				{
					\time 5/4
					ef8
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
					r4 (
					ef,1 ) \mf
				}
				{
					\time 5/4
					r4
					ef,1 ~ \p
				}
				{
					\time 5/4
					ef,1 (
					r4 )
				}
				{
					\time 5/4
					ef,2 \p
					r2.
				}
				{
					\time 5/4
					r4
					r8
					r16
					r2
					ef,16 ~ \mf
					ef,4
				}
				{
					\time 5/4
					r2
					ef,2. \p
				}
				{
					\time 5/4
					r2
					d,2. ~
				}
				{
					\time 5/4
					d,4
					r1
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r4 (
					ef,1 \p )
				}
				{
					\time 5/4
					ef,2 \p
					r4
					cs,2
				}
				{
					\time 5/4
					cs,1 ( \mf \marcato
					r4 )
				}
				{
					\time 5/4
					r1 (
					ef,4 \p
				}
				{
					\time 5/4
					ef,1 \p
					r4 )
				}
				{
					\time 5/4
					r1 (
					ef,4 \p
				}
				{
					\time 5/4
					ef,1 \mp
					r4 )
				}
				{
					\time 5/4
					r1 (
					g,4 \p
				}
				{
					\time 5/4
					g,1 \mp
					r4 )
				}
				{
					\time 5/4
					r1 (
					bf,4 \p
				}
				{
					\time 5/4
					bf,1 \p
					r4 )
				}
				{
					\time 5/4
					r1 (
					g,4 \mf
				}
				{
					\time 5/4
					g,1 \mf
					r4 )
				}
				{
					\time 5/4
					r1 (
					b,4 \mf
				}
				{
					\time 5/4
					b,1 \mf
					r4 )
				}
				{
					\time 5/4
					c4 \f \marcato \>
					r1 \!
				}
				{
					\time 5/4
					d,4 ( \p
					ef,4 )
					r4
					r16
					d,4
					d8.
				}
				{
					\time 5/4
					r4..
					c2
					ef,4
					r16
				}
				{
					\time 5/4
					r8. 
					cs,4 \p
					fs2
					r4
					c16
				}
				{
					\time 5/4
					r4..
					ef,4
					r4 
					bf,4
					g,16
				}
				{
					\time 5/4
					g,4.. ( \p
					r2 )
					r4
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
					r2
					e,8 \mp [
					bf,8
					bf,8 ]
					r8
				}
				{
					\time 5/4
					bf16 \p
					r16
					b,8 [
					fs,8
					cs,8 ]
					r8
					c'16
					r16
					ef,8 [
					ef,8
					g,8 ]
					r8
				}
				{
					\time 5/4
					cs16
					r16
					ef,8 [
					ef,8
					ef,8 ]
					r8
					d16
					r16
					b,8 [
					gs,8
					fs,8 ]
					r8
				}
				{
					\time 5/4
					bf16 \p
					r16
					bf,8 [
					ef,8
					fs,8 ]
					r8
					fs16
					r16
					cs,8 [
					bf,8
					bf,8 ]
					r8
				}
				{
					\time 5/4
					d16
					r16
					g,8 [
					fs,8
					ef,8 ]
					r8
					fs16
					r16
					ef,8 [
					gs,8
					g,8 ]
					r8
				}
				{
					\time 5/4
					bf16 \p
					r16
					g,8 [
					ef,8
					d,8 ]
					r8
					a16
					r16
					ef,8 [
					bf,8
					d,8 ]
					r8
				}
				{
					\time 5/4
					c16
					r16
					cs,8 [
					ef,8
					d,8 ]
					r8
					bf16
					r16
					gs,8 [
					fs,8
					d,8 ]
					r8
				}
				{
					\time 5/4
					g,16 \p
					r16
					gs,8 [ \p
					cs,8
					e,8 ]
					r8
					bf16
					r16
					ef,8 [
					fs,8
					e,8 ]
					r8
				}
				{
					\time 5/4
					fs16
					r16
					bf,8 [
					bf,8
					cs,8 ]
					r8
					g16
					r16
					cs,8 [
					b,8
					fs,8 ]
					r8
				}
				{
					\time 5/4
					c16 \p
					r16
					ef,8 [
					cs,8
					gs,8 ]
					r8
					bf16
					r16
					ef,8 [
					b,8
					fs,8 ]
					r8
				}
				{
					\time 5/4
					cs'16
					r16
					gs,8 [
					g,8
					e,8 ]
					r8
					c16
					r8.
					g,8 [
					ef,8
					cs,8 ]
				}
				{
					\time 5/4
					f,16 \p
					c16
					bf,8
					g,8
					bf,16
					bf,8
					fs,8
					cs,8
					bf,16
					bf,16
					bf,16
					bf,8.
					r16
				}
				{
					\time 5/4
					\times 4/5 {
						b,16
						gs,16
						b,16
						e16
						gs16
					}
					r4
					cs,16
					ef,16
					f,8.
					f,16
					bf,8
					bf,16
					bf,8
					bf,16
				}
				{
					\time 5/4
					bf,16 \p
					bf,16
					bf,8
					r8 
					r2
					fs,8
					ef,8
					bf,8
				}
				{
					\time 5/4
					cs,16
					ef,8
					bf16
					r8
					bf,8 [
					gs,8
					ef,8 ]
					bf,16
					bf,8.
					fs,8
					r16
					bf,16
				}
				{
					\time 5/4
					bf,16 \p
					bf,4
					r2
					cs,16 (
					ef,16
					f,16
					bf,4 )
				}
				{
					\time 5/4
					bf,16
					bf,8.
					bf,16
					bf,16
					\times 4/5 {
						fs16 [
						g16
						fs16
						e16
						g16 ]
					}
					fs,8 ~
					fs,2
				}
				{
					\time 5/4
					fs,8 ~ \p
					fs,2
					r8 
					r2
				}
				{
					\time 5/4
					r1
					fs,4
				}
				{
					\time 5/4
					fs,1 \p
					r4
				}
				{
					\time 5/4
					r1
					fs,4 \p
				}
				{
					\time 5/4
					fs,1 \p
					r4
				}
				{
					\time 5/4
					r1
					fs,4 \p
				}
				{
					\time 5/4
					fs,1 \p 
					r4
				}
				{
					\time 5/4
					r1
					fs,4 \p
				}
				{
					\time 5/4
					fs1 \p
					r4
				}
				{
					\time 5/4
					r1
					fs,4 \p
				}
				{
					\time 5/4
					fs,1 \p 
					r4
				}
				{
					\time 5/4
					r1
					fs,4 \p
				}
				{
					\time 5/4
					fs,1 \p 
					r4
				}
				{
					\time 5/4
					r1
					fs,4 \p
				}
				{
					\time 5/4
					fs,1 \p 
					r4
				}
				{
					\time 5/4
					r1
					fs,4 \p
				}
				{
					\time 5/4
					fs,1
					r4 \p
				}
				{
					\time 5/4
					r1
					fs,4 \p
				}
				{
					\time 5/4
					fs,1 \p 
					r4
				}
				{
					\time 5/4
					r1
					g,4 \p
				}
				{
					\time 5/4
					g,1 \p
					r4
				}
				{
					\time 5/4
					r4 
					r1
				}
				{
					\time 5/4
					r1
					r16
					gs,8 \marcato \f
					gs,16 \p
				}
				{
					\time 5/4
					gs,1 
					r4
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
					b,8 \p
				}
				{
					\time 5/4
					b,1 \mp
					r4
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
					bf,8 \mp
				}
				{
					\time 5/4
					bf,1
					r4
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
					a,1 ~ \fff
					a,8
					r8
				}
				{
					\time 5/4
					g,2 \sfz
					r8 
					g,2 \f \glissando
					f,,8
				}
				{
					\time 5/4
					r4
					fs,2. \mf \glissando
					gs,4
				}
				{
					\time 5/4
					ef,1 (
					r4 )
				}
				{
					\time 5/4
					r8
					ef,1 \p (
					r8 )
				}
				{
					\time 5/4
					r4
					ef,1
				}
				{
					\time 5/4
					gs,1 \pp \glissando
					e,4
				}
				{
					\time 5/4
					r2
					e,4 (
					d,4
					cs,4 )
				}
				{
					\time 5/4
					cs,2. ( \pp
					ef,8 )
					r8
					g4 (
				}
				{
					\time 5/4
					g4
					ef,8
					g,8
					ef,2 )
					r4
				}
				{
					\time 5/4
					ef,2 ( \pp
					cs,2 )
					r4
				}
				{
					\time 5/4
					cs,4 \pp
					r16
					bf,8.
					r16
					b,8
					r16
					b,4.
					r8
				}
				{
					\time 5/4
					b,8 \ppp
					r4
					gs,8
					r4
					cs,16
					r8
					fs,16
					r4
				}
				{
					\time 5/4
					r4
					r1
				}					
				{
					\time 13/8
					fs,4 \f
					fs,8
					fs,8
					fs,8
					fs,8
					fs,4
					fs,4
					fs,8
					fs,8
					fs,8
				}
				{
					\time 13/8
					fs,4 \f
					fs,8
					fs,8
					fs,8
					fs,8
					fs,4
					fs,4
					fs,8
					fs,8
					fs,8
				}
				{
					\time 13/8
					fs,4 \f
					fs,8
					fs,8
					f,8
					f,8
					f,4
					f,4
					f,8
					f,8
					f,8
				}
				{
					\time 13/8
					f,4 \f
					ef,8
					ef,8
					ef,8
					ef,8
					cs,4
					a,4
					a,8
					cs,8
					cs,8
				}
				{
					\time 13/8
					r8
					r1.
				}
			}
		>>
	>>
\midi { }
\layout { }
}
