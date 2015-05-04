#!/bin/bash

./build_docs.sh
git add .
git commit -am "auto-update docs"
git push
git status
