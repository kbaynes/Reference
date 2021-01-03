#!/usr/local/bin/python3

'''
Usage:
Pipe ls of a directory contents into this file, run using python3

Example:
ls ~/GitLab/php-opm/test.unique.fashion/images/Dress_Icons_UF/ | python3 ~/mypy/dirListToArr.py
'''

import sys
from pprint import pprint

data = sys.stdin.read()
arr = data.split()

pprint(arr)
