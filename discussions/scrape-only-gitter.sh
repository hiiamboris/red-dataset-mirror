#!/bin/bash

~/dataset/scrape-website.sh https://rebol.tech/gitter.im/red/
mv ./rebol.tech/gitter.im/red ./gitter.im
rm -rf rebol.tech
