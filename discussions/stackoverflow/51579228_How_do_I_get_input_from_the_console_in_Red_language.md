# How do I get input from the console in Red language

**Link:**
<https://stackoverflow.com/questions/51579228/how-do-i-get-input-from-the-console-in-red-language>

**Asked:** 2018-07-29 10:06:32 UTC

------------------------------------------------------------------------

I\'m writing a console program (target MSDOS) in Red language and I need
to ask the user to enter a character or a string, then to press `Enter`.

I can\'t seem to find how to do it, I\'ve read the docs here
([http://www.red-by-example.org/index.html](http://www.red-by-example.org/index.html){rel="nofollow noreferrer"})
to no avail.

I tried something like this:

`read.red`

    Red [

    ]

    print "Please make your choice then press Enter"
    x: input
    print x

It works in the \"Red Console\" with `red read.red` but when I compile
with `red -r -t MSDOS read.red` I get an error:

` Compiling C:\apps\red-read\read.red ... *** Compilation Error: undefined word input *** in file: C:\apps\red-read\read.red *** near: [ input ] `

How do I ask for input from a Red console program?

I\'m using Red version: `--== Red 0.6.3 ==--`.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 5) --- by Alexander Ryan Baggett

Okay, I did some testing and got it working on my end. You need 2
things.

1\) You need the latest build, not 0.63. You can grab the automated
build from master from [the downloads
page](https://www.red-lang.org/p/download.html){rel="noreferrer"}.

2\) You need a reference in your file to use the console. Here is the
updated code which will work on Windows with the latest version.

    Red [

    ]
    #include %environment/console/CLI/input.red

    print "Please make your choice then press Enter"
    x: input
    print x

This info was buried away in an
[article](https://github.com/red/red/wiki/%5BNOTES%5D-Compiling-with-console-functions){rel="noreferrer"}
on github. Also, you were right about MSDOS.

*Comment by Alex Baban:* Your solution works, I was able to compile.
Thank you.

*Comment by endo64:* Link updated:
[github.com/red/red/wiki/...](https://github.com/red/red/wiki/%5BNOTES%5D-Compiling-with-console-functions---input,-ask){rel="nofollow noreferrer"}

------------------------------------------------------------------------

## Comments on question

*Comment by Alexander Ryan Baggett:* I believe you should be using
Windows as your compile target instead of MSDOS for Windows.

*Comment by Alex Baban:* \@AlexanderRyanBaggett thank you for your
suggestion, I\'m trying to make a console app, but just to see if it
works, I tried with target Windows and Darwin and I get the same error
about input
