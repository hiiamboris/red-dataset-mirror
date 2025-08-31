URL: <https://github.com/red/red/discussions/5005>
Date created: 2021-12-06T22:33:11Z

# black window showing behind a view script

On Windows, running the below example (or other View script) makes a black window appears in background:

do/args %red.r "-r %tests/draw.red"



## Comments

### hiiamboris commented at 2021-12-07T10:04:29Z:

Study `red --help` output:
```
    -t <ID>, --target <ID>         : Cross-compile to a different platform
                                     target than the current one (see targets
                                     table below).

Cross-compilation targets:

    MSDOS        : Windows, x86, console (+ GUI) applications
    Windows      : Windows, x86, GUI applications
    WindowsXP    : Windows, x86, GUI applications, no touch API
    Linux        : GNU/Linux, x86
    Linux-musl   : GNU/Linux, x86, musl libc
    Linux-ARM    : GNU/Linux, ARMv5, armel (soft-float)
    RPi          : GNU/Linux, ARMv7, armhf (hard-float)
    Darwin       : macOS Intel, console or GUI applications
    macOS        : macOS Intel, GUI-only, applications bundles
    Syllable     : Syllable OS, x86
    FreeBSD      : FreeBSD, x86
    NetBSD       : NetBSD, x86
    Android      : Android, ARMv5
    Android-x86  : Android, x86
```

Black window is called "terminal". To remove it you need to compile for Windows target.

