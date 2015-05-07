#!/bin/bash

# Docs by jazzy
# https://github.com/realm/jazzy
# ------------------------------

git submodule update --remote

jazzy -o ./ --source-directory Cartography/ --readme Cartography/README.md -a 'Robert Böhnke' -u 'https://twitter.com/ceterum_censeo' -m 'Cartography' -g 'https://github.com/robb/Cartography'
