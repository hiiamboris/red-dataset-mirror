#!/bin/bash

# individual pages
while IFS=$'\t' read -r url file; do
	~/dataset/scrape-page.sh $url $file
done < pages

# full (small) websites
for f in $(cat websites); do ~/dataset/scrape-website.sh $f; done

# specialized scrapers
for f in scrape-only-*; do $f; done