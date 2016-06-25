#!/usr/bin/python

import optparse
from ConfigParser import ConfigParser
from itertools import *

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


def process_src( sf ):
    lines= ( l.strip() for l in sf if l[0]=='[' )
    
    for ln in lines:
        statlist_in= ln[1:-1].strip().split(',')
        statlist_out= []
        for elt in statlist_in:
            statlist_out.append(round(float(elt.strip()), 5))
        print '%s;%s;%s;%s' % tuple(statlist_out)



if __name__ == "__main__":
    # command line options
    cmdparser = optparse.OptionParser(usage="usage: python %prog [Options] text_file") 
    cmdparser.add_option("-v", "--verbose", action="store_true", dest="verb", default=False, help="be talkative")
    cmdparser.add_option("-s", "--sverbose", action="store_true", dest="sverb", default=False, help="be super-talkative")

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

    process_src(src_file)
