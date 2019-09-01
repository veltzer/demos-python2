#!/usr/bin/env python

"""
This is an example of how to read a tsv file with no header.

The idea is to pass the header=None parameter.
"""

import pandas

filename = "data_samples/2_by_2.tsv"
df = pandas.read_csv(
        filename,
        sep='\t',
        header=None,)
assert df.shape == (2,2)
