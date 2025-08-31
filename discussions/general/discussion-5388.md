URL: <https://github.com/red/red/discussions/5388>
Date created: 2023-09-22T09:51:20Z

# Use of UTF8 in Red including compiled

Hi!
I have scripts in R2, but they not accept UTF8.
I need UTF8 for some languages, so my question is "Is it possible to show and analyse text in UTF8?"
Thanks in advance,
Alain

## Comments

### hiiamboris commented at 2023-09-22T10:24:19Z:

By default text IO in Red (`read` and `write`) only supports UTF-8, so yes.

