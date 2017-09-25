#!/usr/bin/env python

"""
An example of how to extract type hints from a class

This does not work in python2!
"""

from typing import get_type_hints


def func(param: int) -> int:
    # type: (int) -> int
    return param + 1


print(get_type_hints(func))
