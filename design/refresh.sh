#!/bin/bash

~/dataset/scrape-code.sh https://github.com/greggirwin/red-hof HOF
~/dataset/scrape-code.sh https://github.com/greggirwin/red-L10N L10N
~/dataset/scrape-code.sh https://github.com/greggirwin/red-split split
~/dataset/scrape-code.sh https://github.com/hiiamboris/red-formatting formatting

./list-issues-red-REP.sh
./scrape-only-proposals.red
