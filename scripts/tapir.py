#!/usr/bin/env python3
# -*- coding: iso-8859-15 -*-

fname = 'tapir.ascii'
with open(fname) as f:
    content = f.readlines()
for line in content:
    print(line, end='')
print('')
