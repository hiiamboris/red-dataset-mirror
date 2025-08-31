
#609: CR/LF included in INPUT string on Windows
================================================================================
Issue is closed, was reported by hostilefork and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/609>

On OS/X:

```
red>> input "test "
test a
== "a"
```

On Linux:

```
red>> probe input "test "
test a
"a"
== "a"
```

On Windows:

```
red>> probe input "test "
test a
"a^M^/"
== "a^M^/"
```

Using "0.4.1, 14-Dec-2013/20:20:51-5:00"



Comments:
--------------------------------------------------------------------------------

On 2013-12-15T01:42:02Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/609#issuecomment-30596078>

    Alternatively, you can use INPUT and ASK from my C library binding, here in ANSI.red:
    
    http://red.esperconsultancy.nl/Red-C-library/dir?ci=tip
    
    They're not afflicted by this issue. Ready interpreters here in `*/Red/red-*`:
    
    http://red.esperconsultancy.nl/Red-test/dir?ci=tip
    
    For example MSDOS/Red/red-base.exe for Windows.

--------------------------------------------------------------------------------

On 2014-02-13T20:57:20Z, dockimbel, commented:
<https://github.com/red/red/issues/609#issuecomment-35024952>

    A few notes about this issue:
    - The whole code in %console.red is temporary and will be trashed once the I/O and ports system will be in place, so we can implement a proper `console://` device instead.
    - `input` was not meant for user use, just for console internal use.

