"""
This example shows that if you are using python2 then you must
decorate your file handles with codecs.getreader and codecs.getwriter
if you want to read and write in 'unicode' type instead of 'str' type.
"""

import sys
import codecs

filename = "/etc/passwd"

handle = open(filename, mode="r")
handle = codecs.getreader(encoding="utf-8")(handle)
line = handle.readline()
assert type(line)==unicode

handle = open(filename, mode="r")
line = handle.readline()
assert type(line)==str
