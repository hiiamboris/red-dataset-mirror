# How to create Windows executable (.exe) from red lang?

**Link:**
<https://stackoverflow.com/questions/38941748/how-to-create-windows-executable-exe-from-red-lang>

**Asked:** 2016-08-14 11:25:48 UTC

------------------------------------------------------------------------

I\'m building a red lang application. How to create Windows executable
(.exe) from red lang???

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by sqlab

If you have already the red executable, you call from the command line

    red -c -t Windows yourprogram.red

and you will get **yourprogram.exe** as a Windows program

[README.md](https://github.com/red/red/blob/master/README.md){rel="nofollow"}

Of course I assume, you have also downloaded all the possibly
additionally needed source files from either
[red-lang/download](http://www.red-lang.org/p/download.html){rel="nofollow"}
or [github/red/red](https://github.com/red/red){rel="nofollow"}

If you have a recent rebol interpreter, you can compile with

    do/args %red.r "-t Windows yourprogram.red" 

or use an available GUI shell for the red compiler e.g
[redcompiler](http://www.rebol.org/download-a-script.r?script-name=redcompiler.r){rel="nofollow"}

------------------------------------------------------------------------

## Comments on question

*Comment by iArnold:* Perhaps you just should read the github Readme, it
is explained with all details needed. So this is asking for the sake of
asking.
