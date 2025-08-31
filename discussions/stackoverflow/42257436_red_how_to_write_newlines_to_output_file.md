# red how to write newlines to output file

**Link:**
<https://stackoverflow.com/questions/42257436/red-how-to-write-newlines-to-output-file>

**Asked:** 2017-02-15 18:33:04 UTC

------------------------------------------------------------------------

I\'m working in Windows and appending lines to a text file in Red using

> write/append/lines %MC_testfile.txt \"output text here\"

And the output text is duly appended but not on a new line. How do I get
my appended text on a new line?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by HostileFork says dont trust SE

You appear to be encountering a bug that was fixed very recently
(apparently more recently than the build you are using):

[Issue #2430: write/lines only writes end-of-lines if argument is
block](https://github.com/red/red/issues/2430){rel="nofollow noreferrer"}

[FIX: issue
#2430](https://github.com/red/red/commit/0ca9c1d8cdaa44ba7f4ed48d6ed49bd6a036005e){rel="nofollow noreferrer"}

Two resources to help with this kind of thing in the future:

Given Red\'s early state, it\'s good to do a keyword search in the
issues database before posting to StackOverflow. You should search on
all issues (the search defaults to open, but you can remove that clause
to get closed ones too). It would have found this one:

[GitHub Query Filter
`is:issue write/lines`](https://github.com/red/red/issues?utf8=%E2%9C%93&q=is%3Aissue%20write%2Flines){rel="nofollow noreferrer"}

You also might find a related issue that helps inform whatever you\'re
seeing.

The other thing to know about is the automated builds of the master
branch from the download page:

[http://www.red-lang.org/p/download.html](http://www.red-lang.org/p/download.html){rel="nofollow noreferrer"}

If reporting a problem to a project, it always helps to try it in both
the stable and the latest, to see if it\'s a regression or possibly
fixed.

------------------------------------------------------------------------

### Answer (score: 0) --- by Dmitry Bubnenkov

There is another way:

    write/append %file.txt form reduce [newline now "some text"]

result:

    29-Jun-2020/17:33:22+03:00 some text

------------------------------------------------------------------------

## Comments on question

*Comment by HostileFork says dont trust SE:* On Windows, if I say:
`loop 5 [write/append/lines %testfile.txt "line"]` and then
`print read %testfile.txt`, there are linebreaks. There are also
linebreaks if it\'s loaded into Notepad.exe. Can you give a [Minimal,
Complete, Verifiable Example](http://stackoverflow.com/help/mcve)?

*Comment by ally bally bee:* Hi HF - thanks for all your Red stuff,
it\'s been very helpful! I copied and pasted your code and got no line
breaks on the console and none in notepad! I stuck your code in a file
and ran it - still no line breaks. I\'m on windows 10 - Red 0.6.1 -
it\'s a mystery!

*Comment by ally bally bee:* HF - Thanks for the pointer to the fix.
I\'ll have a look at getting the fixed version. I\'m afraid the block
solution raises another question! I can\'t write blocks to files - I get
this error - Script Error: write does not allow block! for its data
argument

*Comment by ally bally bee:* \@HostileFork - thanks for the help - as
you can tell I\'m very new to this. I\'ll get a newer build and retry.
Thanks again for taking the time.
