#!/bin/bash

# git-hub can't fetch all closed issues
gh issue list -R red/red -s all -L 9999 >red-issues-list.tsv