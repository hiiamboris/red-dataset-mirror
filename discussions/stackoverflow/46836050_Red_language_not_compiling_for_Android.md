# Red language not compiling for Android

**Link:**
<https://stackoverflow.com/questions/46836050/red-language-not-compiling-for-android>

**Asked:** 2017-10-19 17:54:18 UTC

------------------------------------------------------------------------

I have a small GUI program in Red language that runs very well but is
not compiling for Android. I am using following command on Debian Stable
Linux (which successfully makes applications for Windows and for Mac):

    $ wine red-063.exe -c -r -t Android-x86 myapp.r 

But I get following error messages:

    Target: Android-x86 

    Compiling to native code...
    *** Warning: OS_TYPE macro in R/S is redefined
    *** Compilation Error: invalid path value: image/encode 
    *** in file: %environment/codecs/png.red 
    *** in function: exec/ctx259~encode
    *** at line: 1 
    *** near: [as cell! image/encode img where IMAGE_PNG]

I get same error messages if I use `Android` instead of `Android-x86`.
Where is the problem?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by sqlab

GUI for Android is planned for
[0.65](https://trello.com/b/FlQ6pzdB/red-tasks-overview){rel="nofollow noreferrer"}

*Comment by rnso:* It should be clarified on
[github.com/red/red](https://github.com/red/red){rel="nofollow noreferrer"}
where Android and Android-x86 are listed.

------------------------------------------------------------------------

## Comments on question
