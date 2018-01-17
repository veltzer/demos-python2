#!/usr/bin/env python

"""
Example of an enum in python2
"""

import enum


class SampleEnum(enum.Enum):
    one = 1
    two = 2
    three = 3

print(type(SampleEnum.one))
# convert an int to a name
print(SampleEnum(2).name)
print(SampleEnum.one.value)
