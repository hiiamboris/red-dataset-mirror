# Getting different paths in Red language

**Link:**
<https://stackoverflow.com/questions/46986237/getting-different-paths-in-red-language>

**Asked:** 2017-10-28 04:24:45 UTC

------------------------------------------------------------------------

I am trying to get different paths in Red language. If I cd to
`/myfolder` and run following command:

    /myfolder$ /path/to/red.exe /path/to/myscript.red

How can I get these 3 paths from code in script?

I tried:

    system/options/path        ; Gives path/to/myscript
    system/script/path         ; Gives none
    call/output "pwd" outstr   ; Gives path/to/myscript
    what-dir                   ; Gives path/to/myscript

I am able to get only one path. How can I get path of red.exe and path
of current working directory (In Red language- not Rebol)?

Note: this is related to my question on Rebol at [What-dir reporting own
directory as current directory in
Rebol](https://stackoverflow.com/questions/46461448/what-dir-reporting-own-directory-as-current-directory-in-rebol)

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 0) --- by draegtun

In Rebol (2 & 3), this is how you can get those three paths:

``` {.lang-lisp .prettyprint-override}
system/options/boot    ;; /path/to/red.exe
system/options/path    ;; /myfolder
system/script/path     ;; /path/to/myscript.red
```

At this moment only `system/options/boot` in Red matches what Rebol does
here.

------------------------------------------------------------------------

### Answer (score: 0) --- by tgbfroat

From the GUI Console:

    boot             string!       {C:\ProgramData\Red\gui-console-2017-11-30-4300.exe}
    home             none!         none
    path             file!         %/C/ProgramData/Red/
    script           none!         none
    cache            file!         %/C/ProgramData/Red/

From the cli:

    boot             string!       "C:\ProgramData\Red\console-2017-11-30-4430.
    home             none!         none
    path             file!         %/C/Users/Old%20Man/desktop/
    script           none!         none
    cache            file!         %/C/ProgramData/Red/

Using the GUI Console:

    system/options/boot   ; Red binary
    system/options/path   ; current dir
    system/options/cache  ; Red default dir "home"

system/options/boot is a `string!`, so you\'ll have to convert it with:

    to-red-file system/options/boot

------------------------------------------------------------------------

## Comments on question
