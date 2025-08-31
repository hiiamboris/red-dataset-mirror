# Sublime Text shows &quot;NUL&quot; characters in build output

**Link:**
<https://stackoverflow.com/questions/36184920/sublime-text-shows-nul-characters-in-build-output>

**Asked:** 2016-03-23 17:30:49 UTC

------------------------------------------------------------------------

I\'ve coded a simple Red \"Hello world\" program in Sublime Text 3:

    Red []

    print "Hello world!"

I\'ve also created a build system that I\'m trying to use to compile and
run the program, where `G:\Red Programming Language\redlang.exe` is the
Red programming language compiler that I downloaded from the Windows
link
[here](http://www.red-lang.org/p/download.html){rel="nofollow noreferrer"}:

    {
        "shell_cmd": "\"G:\\Red Programming Language\\redlang\" \"$file\""
    }

The problem is that whenever I use my build system on a saved program, a
strange `NUL` character appears between each character of the build
output:

![Screenshot](https://i.sstatic.net/sHFAr.png)

This doesn\'t happen with any other build system I have installed. The
output appears fine if I run the `redlang.exe` from the Command Prompt,
so it\'s probably an issue with my Sublime Text setup; I\'m using
Sublime Text Build 3083 and Windows 10. How can I get rid of those `NUL`
characters?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by DocKimbel

The output of Red programs on Windows is using the native UTF-16LE
encoding, which is the cause of the NUL characters you are seeing, as
Sublime\'s output capturing defaults to UTF-8. You need to change it in
your build system using the `encoding` command as described in the
Sublime build system
[documentation](http://sublimetext.info/docs/en/reference/build_systems.html){rel="nofollow"}.

So you might try something like:

    {
        "shell_cmd": "\"G:\\Red Programming Language\\redlang\" \"$file\"",
        "encoding": "UTF-16LE"
    }

See the supported encodings list
[here](https://docs.python.org/3/library/codecs.html#standard-encodings){rel="nofollow"}.
Hope this helps.

------------------------------------------------------------------------

## Comments on question
