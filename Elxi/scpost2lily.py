#!/usr/bin/python

import optparse
import abjad as aj
from ConfigParser import ConfigParser
from itertools import *
from collections import namedtuple

# defaults and other constants
default_amp= -0.0
default_midinote= -0.0
default_legato= -0.0
default_dur= -0.0
error_dur_li= 64

response_dict= {
    '0': {
        'httpresp': 200,
        'descr': 'OK',
        'fatal': False
        },
    '10': {
        'httpresp': 404,
        'descr': 'Source file is not specified. Please, use -h for help.',
        'fatal': True
        },
    '11': {
        'httpresp': 404,
        'descr': 'Page not found.',
        'fatal': True
        },
    '20': {
        'httpresp': 500,
        'descr': 'Unable to read from file.',
        'fatal': True
        }
    }

midi_table= { # created in SC: (0..127).do({ |i| ("'"++i.asString++"': '"++i.midinotename++"',").postln }) 
    'rest': 'r', '0': 'C-2', '1': 'C#-2', '2': 'D-2', '3': 'Eb-2', '4': 'E-2', '5': 'F-2', '6': 'F#-2', '7': 'G-2', '8': 'G#-2', '9': 'A-2', '10': 'Bb-2', '11': 'B-2', '12': 'C-1', '13': 'C#-1', '14': 'D-1', '15': 'Eb-1', '16': 'E-1', '17': 'F-1', '18': 'F#-1', '19': 'G-1', '20': 'G#-1', '21': 'A-1', '22': 'Bb-1', '23': 'B-1', '24': 'C0', '25': 'C#0', '26': 'D0', '27': 'Eb0', '28': 'E0', '29': 'F0', '30': 'F#0', '31': 'G0', '32': 'G#0', '33': 'A0', '34': 'Bb0', '35': 'B0', '36': 'C1', '37': 'C#1', '38': 'D1', '39': 'Eb1', '40': 'E1', '41': 'F1', '42': 'F#1', '43': 'G1', '44': 'G#1', '45': 'A1', '46': 'Bb1', '47': 'B1', '48': 'C2', '49': 'C#2', '50': 'D2', '51': 'Eb2', '52': 'E2', '53': 'F2', '54': 'F#2', '55': 'G2', '56': 'G#2', '57': 'A2', '58': 'Bb2', '59': 'B2', '60': 'C3', '61': 'C#3', '62': 'D3', '63': 'Eb3', '64': 'E3', '65': 'F3', '66': 'F#3', '67': 'G3', '68': 'G#3', '69': 'A3', '70': 'Bb3', '71': 'B3', '72': 'C4', '73': 'C#4', '74': 'D4', '75': 'Eb4', '76': 'E4', '77': 'F4', '78': 'F#4', '79': 'G4', '80': 'G#4', '81': 'A4', '82': 'Bb4', '83': 'B4', '84': 'C5', '85': 'C#5', '86': 'D5', '87': 'Eb5', '88': 'E5', '89': 'F5', '90': 'F#5', '91': 'G5', '92': 'G#5', '93': 'A5', '94': 'Bb5', '95': 'B5', '96': 'C6', '97': 'C#6', '98': 'D6', '99': 'Eb6', '100': 'E6', '101': 'F6', '102': 'F#6', '103': 'G6', '104': 'G#6', '105': 'A6', '106': 'Bb6', '107': 'B6', '108': 'C7', '109': 'C#7', '110': 'D7', '111': 'Eb7', '112': 'E7', '113': 'F7', '114': 'F#7', '115': 'G7', '116': 'G#7', '117': 'A7', '118': 'Bb7', '119': 'B7', '120': 'C8', '121': 'C#8', '122': 'D8', '123': 'Eb8', '124': 'E8', '125': 'F8', '126': 'F#8', '127': 'G8'
    }
# middle C: C3 -> c'
octaves= {
    '-2':",,,,",
    '-1':",,,",
    '0':",,",
    '1':",",
    '2': "",
    '3': "'",
    '4':"''",
    '5':"'''",
    '6':"''''",
    '7':"'''''",
    '8':"''''''"
    }

dynamics_marks= {
    'pppp': 0.01, # Pianississimo+
    'ppp': 0.05, # Pianississimo
    'pp': 0.10, # Pianissimo
    'mp': 0.20, # Mezzo piano
    'p': 0.40, # Piano
    'mf': 0.55, # Mezzo forte
    'f': 0.70, # Forte
    'ff': 0.80, # Fortissimo
    'fff': 1.50, # Fortississimo,
    'ffff': 1.80, # Fortississimo+,
    'sfz': 2.00 #Sforzando
    }

class Response:
    """
    returns dict with http response and description
    """
    def __init__(self):
        self.code= '0' # Response class is optimistic

    def get_response(self, code):
        self.code= str(code)
        self.rdict= response_dict[ self.code ]
        return self.rdict


def report_events(container):
    for bb in container:
        print 'bar %s; beats %s; quant %s; tempo %s' % (bb['bar'], bb['beats'], bb['quant'], bb['tempo'])
        for vk, vv in bb['voice'].iteritems():
            print '\t%s' % vk
            vcdur_total= 0
            for evv in vv:
                print '\t\t', evv
                vcdur_total += evv.dur
            print '\tTOTAL dur: %s\n' % vcdur_total


def process_src( sf ):
    voices= {} # dict of objects and their names { voice_name: voice_object }
    currvoice= None
    currvoice_name= None

    events= []
    currevent= None
    currevent_params= []

    beats= []

    lines= ( l.strip() for l in sf if (len(l.strip()) > 0) and (l[0] != '[') )
    for ln in lines:
        try:
            type, descr= ln.split(':')
        except:
            continue

        if type == 'bar':
            i= iter( descr.split(',') )
            bar_dict= dict( izip(i,i) )

            curr_bar, curr_beat= bar_dict['no'], bar_dict['beat']
            beats.append(bar_dict)

        elif type == 'event':
            i= iter( descr.split(',') )
            ev_dict= dict( izip(i,i) )

            proc_name= ev_dict.pop('voice')

            # voice
            if proc_name != currvoice_name:
                if currvoice is not None:
                    if currevent is not None:
                        currvoice.append( currevent )
                        currevent, currevent_params= None, []

                currvoice_name= proc_name

                if currvoice_name not in [k for k in voices.keys()]:
                    voices[currvoice_name]= []

                currvoice= voices[currvoice_name]

            # event params
            if ( len(currevent_params) == 0 ) or ( ev_dict.keys()[0] in currevent_params ): # new event

                if currevent is not None: # before creating a new one, save current
                    currvoice.append( currevent )
                    currevent, currevent_params= None, []
                
                currevent= nt(
                    int(curr_bar), round( float(curr_beat), 5),
                    default_dur, None, default_midinote, default_legato, default_amp, False,
                    None, None, None
                    )

            for k,v in ev_dict.iteritems():
                currevent_params.append( k )
                if k == 'midinote': currevent= currevent._replace( midinote= midi_table[v] )
                elif k == 'dur': currevent= currevent._replace( dur= float(v) )
                elif k == 'legato': currevent= currevent._replace( legato= round( float(v), 5) )
                elif k == 'amp': currevent= currevent._replace( amp= round( float(v), 5) )
                elif k == 'tupletdur': currevent= currevent._replace( tupletdur= float(v) )
                elif k == 'notedur': currevent= currevent._replace( notedur= float(v) )
                elif k == 'notes': currevent= currevent._replace( notes= int(v) )

    currvoice.append(currevent) # last event

    return voices, beats


def blank_containers(beats_list, voices_dict):
    """
    creates a container for both abjad mesures and SC events
    """
    measures= [] # container for abjad measures
    events= [] # list with notes doubling the positions in measure container (will later serve for filling it)

    beatbars= [ int(v['no']) for v in beats_list ] # all beats and bars
    bars= []
    br= min(beatbars)
    while br <= max(beatbars):
        bars.append(br)
        br += 1

    out= []
    for bar in bars:
        bar_dict= { 'bar': bar }

        for beat in beats_list: # curr bar info
            if int(bar) == int(beat['no']):
                k_beats= int(beat['beats'])
                k_quant= int(beat['quant'])
                k_tempo= float(beat['tempo'])
                break

        # some bars contain notes from prev bars, and are not in beats_list - they use values from prev bar
        measures.append( aj.measuretools.DynamicMeasure() ) # base dynamic measure
        # measures.append( aj.Measure( (k_beats, k_quant), [] ) ) # base for abjad measures
        bar_dict.update({
            'beats': k_beats, 'quant': k_quant, 'tempo': k_tempo,
            'voice': dict( (k, []) for k in voices_dict.keys() ) # info on events xgathered here
            })

        for voice, events in voices_dict.iteritems(): # voices and events info
            for event in events: # all current voice's events
                if int(event.bar) == int(bar):
                    # exclude events with no sufficient information
                    if event.dur != default_dur and event.amp != default_amp and event.legato != default_legato and event.midinote != default_midinote:
                        bar_dict['voice'][voice].append(event)

        out.append(bar_dict)

    return measures, out

def is_bar_empty( voice_events ):
    result= True
    if len(voice_events) > 0:
        for et in voice_events:
            if et.midinote != 'r': # at least one note in a bar
                result= False
                break
    
    return result

def note_spanner( events_list ):
    """
    span long notes (dur > bar_size) over bars
    """
    note_slur= {}
    
    for beat in events_list:
        bar_size= float(beat['beats']) / float(beat['quant']) # amount of whole notes!

        for vc, vc_ev in beat['voice'].iteritems():
            events_density= 0
            for ev in vc_ev:
                events_density += ev.dur

            # any slur from previous stage?
            try:
                note_slur_voice = note_slur[vc]
            except: # first encounter
                note_slur[vc]= []
                note_slur_voice = []

            if len(note_slur_voice) > 0:
                no_notes_in_bar= is_bar_empty( vc_ev )
                start_later_0= False
                gap= 0
                if not no_notes_in_bar: # bar not empty
                    start_later_0= ( vc_ev[0].beat > 0 ) # is the first note in a bar starts later than 0 time mark?
                    gap= round( vc_ev[0].beat - note_slur_voice.dur, 5) # still can be some gap

                if no_notes_in_bar or start_later_0:                    
                    vc_ev.insert(0, note_slur_voice) # we squeeze our note here
                    events_density += note_slur_voice.dur # increases event density

                    if gap > 0: # if note is shorter than the gap
                        newevent= nt(
                            beat['bar'], note_slur_voice.dur,
                            round( gap, 5), None, 'r', 0, 0, False, None, None, None
                            )
                        vc_ev.insert(1, newevent)
                        events_density += newevent.dur # increases event density

                    note_slur[vc]= []

            if events_density > bar_size: # last note continues to the next bar
                currevent= nt( # copy the data of the last event
                    vc_ev[-1].bar, vc_ev[-1].beat, vc_ev[-1].dur, vc_ev[-1].durmsr,
                    vc_ev[-1].midinote, vc_ev[-1].legato, vc_ev[-1].amp, vc_ev[-1].tie,
                    vc_ev[-1].tupletdur, vc_ev[-1].notedur, vc_ev[-1].notes
                    )
                
                diff= bar_size - events_density # negative number!
                # changing the duration of the note - the last note's dur + diff (negative)
                if vc_ev[-1].tupletdur is None: # leave the note but replace the duration
                    vc_ev[-1]= vc_ev[-1]._replace(tie= True)

                    next_bar_dur= round( abs(diff), 5) # the remaining duration for he next bar

                else: # tuplet can't be spanned over bar line!
                      # move the whole to the next bar, leaving a proper dur rest in a current one
                    vc_ev[-1]= vc_ev[-1]._replace(midinote= 'r')
                    vc_ev[-1]= vc_ev[-1]._replace(tupletdur= None)
                    vc_ev[-1]= vc_ev[-1]._replace(notedur= None)
                    vc_ev[-1]= vc_ev[-1]._replace(notes= None)
                    vc_ev[-1]= vc_ev[-1]._replace(tie= False)

                    next_bar_dur= currevent.tupletdur # the duration of tuple must remain unchanged!

                vc_ev[-1]= vc_ev[-1]._replace(dur= round(vc_ev[-1].dur + diff, 5))

                if currevent.midinote != 'r': # only if the event not a rest
                    note_slur[vc]= nt( # it can be copied to the next bar
                        beat['bar'], 0, next_bar_dur, currevent.durmsr,
                        currevent.midinote, currevent.legato, currevent.amp, currevent.tie,
                        currevent.tupletdur, currevent.notedur, currevent.notes
                        )

    return events_list


def fill_rest(events_list):
    """
    fill rests in bars
    """
    for beat in events_list:
        bar_size= float(beat['beats']) / float(beat['quant']) # amount of whole notes!
    
        for vc, vc_ev in beat['voice'].iteritems():
            if len(vc_ev) == 0:
                vc_ev.append( # whole beat size rest
                    nt( beat['bar'], 0, bar_size, None, 'r', 0, 0, False, None, None, None )
                    )
            else:
                voice_start_beat= vc_ev[0].beat
                if voice_start_beat > 0: # should be a rest if starts not from the beginning
                    vc_ev.insert( 0, nt(
                        beat['bar'], 0, voice_start_beat, None, 'r', 0, 0, False, None, None, None
                        ) )
    
            curr= 0
            total_decr= bar_size
            while curr < len(vc_ev):                    
                curr_note_end= vc_ev[curr].beat + vc_ev[curr].dur
                try:
                    next_note_start= vc_ev[curr+1].beat # next note
                except:
                    next_note_start= bar_size # then it's the last one

                if (curr_note_end < next_note_start): # start + dur finish earlier than next event                    
                    vc_ev.insert( curr+1,
                        nt( beat['bar'], round(curr_note_end, 5), round( next_note_start - curr_note_end, 5),
                            None, 'r', 0, 0, False, None, None, None
                            )
                    )
                    curr += 2
                else:
                    curr += 1

                total_decr -= (next_note_start - curr_note_end)

    return events_list


def lily_format(ptch):
    if ptch.strip() != 'r':
        ptch= ptch.replace('#', 's').replace('b', 'f')
        if '-' in ptch:
            octv= octaves[ ptch[-2:] ]
            ptch= ptch[:-2]
        else:
            octv= octaves[ ptch[-1:] ]
            ptch= ptch[:-1]
        ptch= ''.join([ ptch, octv ])

    return ptch.lower()
    

def get_lily_note(pitch):
    """
    create LilyPond representation of a note
    """
    if isinstance(pitch, list):
        new_pitch= []
        for pt in pitch:
            new_pitch.append( lily_format(pt) )
    else:
        new_pitch= lily_format(pitch)

    return new_pitch


def _get_durations_recurse(fraction, lily_durations):
    fractn= aj.Fraction(str(fraction))
    try:
        testnote= aj.Note(0, aj.Duration(fractn.numerator, fractn.denominator))
        lily_durations.append( tuple( (fractn.numerator, fractn.denominator) ) )
    except Exception as e:
        lily_durations.append( tuple( (1, fractn.denominator) ) )
        _get_durations_recurse( float((fractn.numerator-1))/float(fractn.denominator), lily_durations)


def _fix_durlist_recurse(dur_list, ddiff= 0):
    new_elt= dur_list[-1]._replace(dur= dur_list[-1].dur + ddiff)
    dur_list[-1]= new_elt
    if dur_list[-1].dur <= 0:
        ddiff= dur_list[-1].dur
        dur_list.pop(-1)
        _fix_durlist_recurse(dur_list, ddiff)


def resolve_tuplets(ev_list):
    """
    looking for tuplets and changinf the events content
    """
    out= []
    for bar in ev_list:
        newbar= bar.copy()
        for voice, vevents in bar['voice'].iteritems():
            newbar['voice'][voice]= []
            counter, newbeat= None, None
            for ev in vevents:
                if ev.dur <= 0:
                    continue

                if ev.tupletdur is None: # not a tuple but usual event - note or rest
                    nev= ev
                    if newbeat: # there were changes on previous stages, need to fix the start
                        nev= nev._replace(beat= newbeat)
                        chdur= nev.dur-(nev.dur % 0.015625) # neutralize the possible 1e-6 deviation (0.015625 = 1/64)
                        nev= nev._replace(dur= chdur)
                        newbeat= None
                    newbar['voice'][voice].append(nev)
                    counter= None # for the case some tuplet notes lost in the situation like the following:
                                  # announced 5 notes, but met only 3, thus counter never reaches 0,
                                  # never released to None, and tuplet doesn't appear in the list
                                  # NB: actually loosing part of tuple is a problem of SuperCollider!
                                  # but lost tuplet replaced by rest is better than incomplete tuplet

                else: # part of a tuple
                    if counter == None: # first note in tuple
                        notes_list= [ev.midinote]
                        counter= ev.notes-2 # we need to get to 0, that's why -2
                        newdur= ev.tupletdur
                        newbeat= ev.beat + newdur
                        newevent= nt( # initilize event
                            ev.bar, ev.beat, ev.dur, ev.durmsr, ev.midinote,
                            ev.legato, ev.amp, ev.tie, ev.tupletdur, ev.notedur, ev.notes
                            )

                    elif counter > 0: # current note in tuple
                        notes_list.append(ev.midinote)
                        counter -= 1

                    elif counter == 0: # previous note was the last in tuple
                        notes_list.append(ev.midinote)
                        newevent= newevent._replace(midinote= notes_list)
                        newevent= newevent._replace(dur= ev.tupletdur)
                        newbar['voice'][voice].append(newevent)

                        # reset things
                        notes_list= []
                        counter= None
        out.append(newbar)
  
    return out


def adjust_durations( events_list ):
    """
    adjust durations for abjad purposes
    """
    # check for negative durations
    events_copy= events_list[:]
    barno= 0
    for bar in events_copy:
        for voice, vevents in bar['voice'].iteritems():
            eventno= 0
            negative= False
            for ev in vevents:
                if ev.dur <= 0:
                    negative= True
                    break
            if negative:
                dur_list= vevents[:]
                _fix_durlist_recurse(dur_list)
                events_list[barno]['voice'][voice]= []
                events_list[barno]['voice'][voice].extend(dur_list)
        barno += 1
    events_copy= None

    # adjust durations for correct fractions calc
    out= []
    beat_no= 0
    for beat in events_list:
        quant= float(beat['quant'])
        curr_beat= {}
        curr_beat.update({
            'bar': beat['bar'], 'beats': beat['beats'], 'quant': beat['quant'], 'tempo': beat['tempo'], 'voice': {}
            })
        for vc, vc_ev in beat['voice'].iteritems():
            voice_events= []
            for ev in vc_ev:
                lily_sym= get_lily_note(ev.midinote)
                lily_durations= []
                curr_dur= ev.dur
                if curr_dur == 0:
                    continue

                # print '%s: %s - %s' % (beat['bar'], vc, ev.dur)
                fractn= aj.Fraction(str(ev.dur))

                lily_durations= []
                _get_durations_recurse(ev.dur, lily_durations)

                ev= ev._replace(midinote= lily_sym)
                ev= ev._replace(durmsr= lily_durations)
                voice_events.append(ev)

            curr_beat['voice'][vc]= voice_events

            beat_no += 1

        out.append(curr_beat)

    # splitting durations to single fractions
    for bar in out:
        voice_events= {}
        for vc, vc_ev in bar['voice'].iteritems():
            voice_events[vc]= []
            for ev in vc_ev:
                ev_pattern= nt(
                    ev.bar, ev.beat, ev.dur, ev.durmsr, ev.midinote,
                    ev.legato, ev.amp, ev.tie,
                    ev.tupletdur, ev.notedur, ev.notes
                    )
                if len(ev.durmsr) > 1:
                    new_start= ev.beat
                    new_dur= 0
                    for ev_msr in ev.durmsr:
                        new_start += new_dur
                        new_dur= round( float(ev_msr[0]) / float(ev_msr[1]), 5)
                        newev= ev_pattern._replace(beat= new_start)
                        newev= newev._replace(dur= new_dur)
                        newev= newev._replace(durmsr= ev_msr)
                        newev= newev._replace(tie= True)
                        if new_start > ev.beat: # short legato only for the first note
                            if newev.legato <= 0.1:
                                newev= newev._replace(legato= 0.2)
                        voice_events[vc].append(newev)
                else:
                    newev= ev_pattern._replace(durmsr= ev.durmsr[0])
                    voice_events[vc].append(newev)

        bar['voice'].update(voice_events)

    return out


def get_event_dynamics(amp):
    res= None

    if amp <= dynamics_marks['pppp']:
        res= 'pppp'
    elif amp > dynamics_marks['pppp'] and amp <= dynamics_marks['ppp']:
        res= 'ppp'
    elif amp > dynamics_marks['ppp'] and amp <= dynamics_marks['pp']:
        res= 'pp'
    elif amp > dynamics_marks['pp'] and amp <= dynamics_marks['mp']:
        res= 'mp'
    elif amp > dynamics_marks['mp'] and amp <= dynamics_marks['p']:
        res= 'p'
    elif amp > dynamics_marks['p'] and amp <= dynamics_marks['mf']:
        res= 'mf'
    elif amp > dynamics_marks['mf'] and amp <= dynamics_marks['f']:
        res= 'f'
    elif amp > dynamics_marks['f'] and amp <= dynamics_marks['ff']:
        res= 'ff'
    elif amp > dynamics_marks['ff'] and amp <= dynamics_marks['fff']:
        res= 'fff'
    elif amp > dynamics_marks['fff'] and amp <= dynamics_marks['ffff']:
        res= 'ffff'
    else:
        res= 'sfz'

    return res


def sort_voices(vd):
    # sort voices
    vc_sort= [{'soprano':'S'}, {'sopranoI':'S I'}, {'sopranoII':'S II'},
                  {'tenor':'T'}, {'tenorI':'T I'}, {'tenorII':'T II'},
                  {'baritone':'Br'}, {'baritoneI':'Br I'}, {'baritoneII':'Br II'},
                  {'bass':'B'}, {'bassI':'B I'}, {'bassII':'B II'}]
    vc_init= vd.copy()
    vc_list= []
    for vc in vc_sort:
        for vck in vc_init.keys():
            if vck == vc.keys()[0]: # every dict in vc_sort has always 1 elemnt
                vc_list.append( vc )
                del vc_init[vck]

    return vc_list


def fill_score(voices_dict, events_list):
    """
    fill abjad score structure
    """
    voice_score= {}
    for k in voices_dict.keys(): # for events_list to be re-allocated from beat-oriented to voice-oriented
        voice_score[k]= []
    
    score= aj.Score()
    staff_group= aj.scoretools.StaffGroup([])
    tempo_marks= []

    voices_list= sort_voices( voices_dict )

    # fill the voices
    for voice in voices_list:
        voice_staff= aj.Staff([])
        curr_voice_name= voice.keys()[0]
        curr_voice_short= voice[curr_voice_name]

        curr_voice_events_list= []

        voice_measures= aj.componenttools.copy_components_and_covered_spanners(beat_measures)
        curr_bar= 0
        tempo_mark= 0
        for beat in events_list:
            if len(staff_group) == 0: # getting tempo marks only
                if beat['tempo'] != tempo_mark: # when processing the first voice
                    tempo_mark= beat['tempo']
                    tempo_marks.append( tuple( (aj.Duration(1, beat['quant']), round(tempo_mark * 60), curr_bar) ) )
                
            for vc, events in beat['voice'].iteritems():
                if vc == curr_voice_name:
                    for event in events:
                        voice_score[curr_voice_name].append(event._replace(bar= curr_bar))

                        if event.tupletdur:
                            notes_list= []
                            for tnote in event.midinote:
                                notes_list.append( aj.Note(tnote, aj.Fraction(event.notedur)) )
                            note= aj.tuplettools.FixedDurationTuplet(aj.Fraction(event.tupletdur), notes_list)
                        else:
                            if 'r' in event.midinote:
                                note= aj.Rest( aj.Duration(event.durmsr[0], event.durmsr[1]) )
                            else:
                                note= aj.Note( event.midinote, aj.Duration(event.durmsr[0], event.durmsr[1]) )

                        voice_measures[curr_bar].append(note)
            # voice_measures[curr_bar].denominator= 8
            
            curr_bar += 1

        voice_staff.extend(voice_measures)
        voice_staff.name= curr_voice_name

        if curr_voice_name in ['bass', 'baritone']:
            aj.contexttools.ClefMark('bass')(voice_staff)

        aj.contexttools.InstrumentMark(
            ' '.join([ curr_voice_name, '(', curr_voice_short.strip(), ')']),
            curr_voice_short,
            target_context= aj.Staff)(voice_staff)

        staff_group.append(voice_staff)

    j= 0 # for some reason the only one mark can be attached to a staff!
    for tempo_tuple in tempo_marks: # tricking it by indexing staffs (voices) with TempoMark attached
        aj.contexttools.TempoMark( # which limits the number of marks to the number of voices!!!
            tempo_tuple[0], int(tempo_tuple[1])
            )(
            staff_group[j][tempo_tuple[2]]
            )
        j += 1

    score.append(staff_group)

    for vc, ev in voice_score.iteritems():
        for vc_stf in staff_group:
            if vc_stf.name == vc:
                break

        voice_slur_scope= []

        i= 0
        cresc_dim_start= None
        curr_amp= 0
        curr_midinote= None
        curr_dynamics= None

        for event in ev:
            if 'r' not in event.midinote:
                if event.legato <= 0.1:
                    art_marcato= aj.marktools.Articulation('marcato')
                    art_marcato.attach(vc_stf.leaves[i])

                if not isinstance(event.midinote, list):
                    if (event.tie) or (event.legato > 1.0):
                        if event.midinote != 'r': # additional check for strings
                            if event.midinote == curr_midinote:
                                aj.tietools.TieSpanner(vc_stf[i:i+1])
                            else:
                                aj.spannertools.SlurSpanner(vc_stf[i:i+1])

                curr_midinote= event.midinote

                curr_dyn_key= get_event_dynamics(event.amp)

                if (curr_dyn_key != curr_dynamics) and (not isinstance(vc_stf.leaves[i], aj.resttools.Rest)):
                    aj.contexttools.DynamicMark(curr_dyn_key)(vc_stf.leaves[i])

                    if cresc_dim_start is not None:
                        cr_dm_span= i-cresc_dim_start
                        if cr_dm_span >= 5 and cr_dm_span < 10: # crescendo or diminuendo can span over 5 to 10 notes
                            if (event.amp > curr_amp): # eliminating
                                aj.spannertools.CrescendoSpanner(vc_stf.leaves[cresc_dim_start:i])
                            elif event.amp < curr_amp:
                                aj.spannertools.DecrescendoSpanner(vc_stf.leaves[cresc_dim_start+1:i])

                    if not isinstance(vc_stf.leaves[i], aj.resttools.Rest):
                        cresc_dim_start= i
                    curr_dynamics= curr_dyn_key
                    curr_amp= event.amp

                i += 1 # warning! should be inside (if) block, since rests are not indexed events for abjad

    # print score
    # for staffgr in score:
    #     print staffgr
    #     for staff in staffgr:
    #         print staff
    #         for ms in staff:
    #             print ms

    return score


def lily_file(score):
    score.set.proportional_notation_duration= aj.schemetools.SchemeMoment(1, 18)
    lily= aj.lilypondfiletools.make_basic_lilypond_file(score)
    # header
    title= aj.markuptools.Markup('\\bold \\sans "Elxi"')
    composer= aj.schemetools.SchemeString("Denis Kolokol, 2012")
    # various settings
    lily.global_staff_size= 12
    lily.header_block.title= title
    lily.header_block.composer= composer
    lily.layout_block.ragged_right= True
    lily.paper_block.markup_system_spacing__basic_distance= 30
    lily.paper_block.paper_width= 190
    lily.default_paper_size= '11x17', 'landscape'
    lily.indent= '2'
    # spacing and padding
    spacing= aj.schemetools.SchemePair('spacing', 40)
    padding= aj.schemetools.SchemePair('padding', 10)
    stretchability= aj.schemetools.SchemePair('stretchability', 0)
    vector= aj.schemetools.SchemeVector(spacing, padding, stretchability)
    lily.paper_block.system_system_spacing= vector

    return lily


if __name__ == "__main__":
    # command line options
    cmdparser = optparse.OptionParser(usage="usage: python %prog [Options] text_file") 
    cmdparser.add_option("-v", "--verbose", action="store_true", dest="verb", default=False, help="be talkative")
    cmdparser.add_option("-s", "--show", action="store_true", dest="showpdf", default=False, help="show .pdf")

    opts, args = cmdparser.parse_args()
    response= Response()

    try: #file
        src_filename= args[0]
    except:
        resp= response.get_response(10)
        print 'ERROR! %s' % resp['descr']
        if resp['fatal']:
            print 'exiting now...'
            exit()

    try:
        src_file= open(src_filename, 'rb')
    except IOError as e:
        resp= response.get_response(20)
        print 'ERROR! %s\n%s' % (resp['descr'], e)
        if resp['fatal']:
            print 'exiting now...'
            exit()

    showpdf= opts.showpdf

    # global - used throughout the stages
    nt= namedtuple('voice_event', [
        'bar', 'beat', 'dur', 'durmsr', 'midinote', 'legato', 'amp', 'tie',
        'tupletdur', 'notedur', 'notes'
        ])
    # 1 - process source file
    vc_list, bt_list= process_src(src_file)
    # 2 - create a container for both abjad measures and SC events
    beat_measures, events_container= blank_containers(bt_list, vc_list)
    # 3 - adjust durations before filling out beat_measures, as folows:
    # 3.1 - compressing tuplets in a single event with notes list
    events_container= resolve_tuplets(events_container)
    # 3.2 - span long notes (dur > bar_size) over bars
    events_container= note_spanner(events_container)
    # 3.2 - fill rests
    events_container= fill_rest(events_container)
    # 3.3(3.1) - rests inflated beats, spanning should be repeated
    events_container= note_spanner(events_container)
    # 4 - adjust durations to the current measure
    events_container= adjust_durations(events_container)
    report_events( events_container )
    # 5 - fill the score
    ajscore= fill_score(vc_list, events_container)
    # 6 - markup and layout
    ajlily= lily_file(ajscore)
    # 7 - produce ly
    
    # 8 - show the score
    if showpdf:
        print "Producing PDF..."
        try:
            aj.show(ajlily)
        except Exception as e:
            print "ERROR: %s" % e
