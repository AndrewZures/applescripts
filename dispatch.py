#!/usr/bin/python

import subprocess
import sys

input = sys.argv[1]

options = { 'github': lambda: subprocess.Popen("pwd") }

stuff = { 'github': { args: [] } }

for key, value in options.items():
    if input == key: value()
