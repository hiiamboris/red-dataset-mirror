This repo hosts tools to prepare Red locale data from CLDR, and the prepared data itself.

- `minimal/` contains ready to use locale data
- `locales/` contains extracted but not yet minified data
- `extract-locales-from-cldr.bat` extracts data into `locales/` from `.red` files obtained with `unldml.red`
- `convert-locales.bat` minifies extracted data (into `/minimal`) and shapes it into release state (into `../format/locales`)
- `diff-all.red` converts `locales/` into `minimal/` (called by `convert-locales`)                           
- `make-all.red` creates an all-inclusive `locales.red` (called by `convert-locales`)
- `extract-locale.red` converts single CLDR locale into Red locale (called by `extract-locales-from-cldr`)
- `unxml.red` (and exe) converts .xml into .red
- `unldml.red` (and exe) also converts it but also removes aliases (in production data only root requires unaliasing, and it also doesn't work across files anyway)
- `currencies.red` - default currency per region
- `firstday.red` - first day of the week for regions (manually extracted)
- `numbering-systems.red` - 10-digit numbering systems for all locales
- `extract-numbering-systems.red` - script that produces `numbering-systems.red`
- `extract-default-currencies.red` - script that produces `currencies.red`
- `plural.red` - plural (ordinal, cardinal) spelling rules for included locales (manually extracted from [here](https://unicode-org.github.io/cldr-staging/charts/latest/supplemental/language_plural_rules.html))

Dependencies: https://codeberg.com/hiiamboris/red-common

Lots of hardcoded paths in scripts, but I don't expect anyone but me to use these tools for now.

Notes (and a reminder):

CLDR data is theoretically [here](https://github.com/unicode-org/cldr/) but it's all messed up with aliases and triple up arrows which seemingly indicate inheritance but it's never clear where to inherit from (in fact even inheritance in the production data is rather wayward)

There's also [icu4c](https://github.com/unicode-org/icu/tree/main/icu4c/source/data/locales) but it's an even worse mess, data scattered around many files in a format which [grammar](https://raw.githubusercontent.com/unicode-org/icu-docs/main/design/bnf_rb.txt) is a joke (so it's basically a guessing game to read it)

So instead this repo uses what they call *production data* that can be downloaded from [here](https://cldr.unicode.org/index/downloads) by clicking on the 4th column in the table (I'm using CLDR40, as 41 link is dead)


