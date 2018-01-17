#!/usr/bin/env python

"""
This example shows how to iterate all the values of an enum type
"""

import enum


class SampleEnum(enum.Enum):
    one = 1
    two = 2
    three = 3

for x in SampleEnum:
    print('actual enum value is [{}]'.format(x))
    print('int is [{}]'.format(x.value))
    print('name is [{}]'.format(x.name))
