#!/usr/bin/env python

import os

source_dir = "/home/user/" # the folder you copied the files from
target_folder = "/usr/lib/" # the folder you copied the files to

for root, dirs, files in os.walk(source_dir):
    for name in files:
        try:
            os.remove(target_folder+"/"+name)
        except FileNotFoundError:
            pass
