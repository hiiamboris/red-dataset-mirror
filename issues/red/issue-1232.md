
#1232: can't interpret file before launching console
================================================================================
Issue is closed, was reported by WiseGenius and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1232>

When using a new build to interpret a file (on Windows XP):

```
H:\>red-10jun15-a048359.exe test.red
Pre-compiling Red console...
*** Driver Internal Error: Script Error : insert expected range argument of type
: number series port pair
*** Where: finish
*** Near:  [insert/part buffer out len]
```

And these files are written in `H:\Documents and Settings\All Users\Application Data\Red`:

```
help.red
input.red
POSIX.reds
red-console.red
wcwidth.reds
win32.reds
```

But if the console is launched (and then quit):

```
H:\>red-10jun15-a048359.exe
Pre-compiling Red console...
--== Red 0.5.3 ==--
Type HELP for starting information.

red>> q
```

Then the pre-compile succeeds and the files in `H:\Documents and Settings\All Users\Application Data\Red` are finally replaced with:

```
console-2015-6-10-48188.exe
crush-2015-6-10-48188.dll
```

And now it can interpret a file:

```
H:\>red-10jun15-a048359.exe test.red
This is the test output.

H:\>
```



Comments:
--------------------------------------------------------------------------------

On 2015-06-13T15:45:20Z, dockimbel, commented:
<https://github.com/red/red/issues/1232#issuecomment-111723029>

    Fixed by commit [d0d43432](https://github.com/red/red/commit/ef2b93a559ae3a2aa00e37fe27840aa9d0d43432).

