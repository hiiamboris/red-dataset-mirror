
#426: Relative paths not intuitively handled with -o compiler options on Windows
================================================================================
Issue is closed, was reported by PeterWAWood and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/426>

If a relative path is specified with the -o compiler option, it appears to be relative to the red-system directory. Which doesn't seem very intuitive.

```

>> pwd
== %/c/Users/peter/Code/iBEAM/trunk/Archiver-2012/Red/
>> do/args %/e/Languages/Red/red.r "-o %file-mover %file-mover.red"
Script: "Red command-line front-end" (none)

-= Red Compiler =-
Compiling /c/Users/peter/Code/iBEAM/trunk/Archiver-2012/Red/file-mover.red ...

...compilation time:     125 ms

Compiling to native code...

Script: "Red/System IA-32 code emitter" (none)
Script: "Red/System PE/COFF format emitter" (none)
...compilation time:     6453 ms
...linking time:         94 ms
...output file size:     118272 bytes
>> ls
file-mover-test.r  file-mover.red     quick-unit-test.r
>> list-dir %/e/Languages/Red/red-system
.DS_Store       builds/         compiler.r      config.r
emitter.r       file-mover.exe  formats/        library/
linker.r        loader.r        rsc.r           runtime/
targets/        tests/          utils/
```



Comments:
--------------------------------------------------------------------------------

On 2013-03-12T15:44:58Z, dockimbel, commented:
<https://github.com/red/red/issues/426#issuecomment-14782972>

    Agreed.

--------------------------------------------------------------------------------

On 2013-08-05T16:33:11Z, dockimbel, commented:
<https://github.com/red/red/issues/426#issuecomment-22118335>

    This will be fixed once we merge both Red and Red/System front-end scripts.

--------------------------------------------------------------------------------

On 2014-02-14T15:58:29Z, dockimbel, commented:
<https://github.com/red/red/issues/426#issuecomment-35096160>

    It works fine now after the merge.

