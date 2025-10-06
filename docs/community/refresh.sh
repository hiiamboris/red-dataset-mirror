#!/bin/bash

~/dataset/scrape-code.sh https://github.com/red/red.wiki wiki
wget -O specs/red-specs-meijeru.adoc https://raw.githubusercontent.com/meijeru/red.specs-public/refs/heads/master/specs.adoc