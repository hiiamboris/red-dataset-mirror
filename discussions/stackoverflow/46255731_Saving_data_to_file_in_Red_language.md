# Saving data to file in Red language

**Link:**
<https://stackoverflow.com/questions/46255731/saving-data-to-file-in-red-language>

**Asked:** 2017-09-16 15:54:52 UTC

------------------------------------------------------------------------

I am trying to save data to a file:

    a: 0
    b: 10
    c: 20
    d: 30

    save %redout.txt [a b c d]

I expected the file to contain the values. However, The file contains:

    a b c d

How can I save variable values rather than variable names to the file?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 5) --- by Graham Chiu

You\'re saving a block which hasn\'t been evaluated. Normally you would
reduce the block first to get the values before saving them.

So,

     Save %myfile.txt reduce [a b c d]

And if you want a loadable file with variables, use `save/all`

*Comment by rnso:* This page mentions that
`save/all - not available yet` :
[red-by-example.org/index.html#save](http://www.red-by-example.org/index.html#save){rel="nofollow noreferrer"}
. I tried but only values are saved as by simple save.

*Comment by Graham Chiu:* But it&amp;#39;s available in rebol, and
rebol3. And it\'s just a matter of time for red

*Comment by rgchris:* \@rnso I strongly recommend saving with a header
as well. It\'s a good way to add metadata to your data blocks. (look up
`SAVE/HEADER`)

------------------------------------------------------------------------

## Comments on question
