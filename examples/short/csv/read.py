#!/usr/bin/env python

"""
This example shows how to read a csv file with python using the 'csv' module.
"""

import csv

with open('data_samples/file.csv', 'r') as csvfile:
    r = csv.reader(csvfile)
    for row in r:
        print(row)
