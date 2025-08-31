# Creating pdf file in Rebol/Red

**Link:**
<https://stackoverflow.com/questions/46213788/creating-pdf-file-in-rebol-red>

**Asked:** 2017-09-14 08:09:31 UTC

------------------------------------------------------------------------

I need to create a pdf file of A4 sized page which will have a black and
white image and some text. Can I create a pdf file in Rebol or Red
programming language?

If not possible directly, what is the best way to do it- create an image
file which can be printed by external programs? Thanks for your help.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by sqlab

There are some scripts available [e.g.
pdf-maker.r](http://www.rebol.org/view-script.r?script=pdf-maker.r){rel="nofollow noreferrer"}

*Comment by rnso:* That seems like a great site.

------------------------------------------------------------------------

### Answer (score: 1) --- by Graham Chiu

There is also a Rebol to Haru PDF
[binding](https://github.com/jankom/RebHaruPDF){rel="nofollow noreferrer"}
that you can try in addition to Gabriele\'s PDF-Maker2.

And some of us used a Postscript
[dialect](http://www.fys.ku.dk/~niclasen/postscript/postscript.html){rel="nofollow noreferrer"}
that allowed us to generate PS directly, and then use something like
Ghostscript to convert the PS to PDF.

*Comment by rnso:* I think, on
[fys.ku.dk/\~niclasen/postscript/postscript.html](http://www.fys.ku.dk/~niclasen/postscript/postscript.html){rel="nofollow noreferrer"}
, in section 2 (Producing pdf output), test.txt should be test.ps
(rebps2pdf being used).

*Comment by rnso:* Any immediately available solution for Red language?
If not, can these scripts be easily adapted to Red also?

*Comment by Graham Chiu:* I\'ve not tried but you can. And if doesn\'t
work, all the authors are still around with Gabriele the only one not
active in Rebol. Cheers

------------------------------------------------------------------------

## Comments on question
