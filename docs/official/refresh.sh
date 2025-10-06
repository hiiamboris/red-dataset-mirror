#!/bin/bash

mkdir -p specs
~/dataset/scrape-website.sh www.red-lang.org
~/dataset/scrape-page.sh https://static.red-lang.org/red-system-specs.html specs/red-system-specs.md
~/dataset/scrape-page.sh https://static.red-lang.org/red-system-quick-test.html specs/quick-test.md
~/dataset/scrape-code.sh https://github.com/red/docs specs/red