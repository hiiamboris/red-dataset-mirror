
#1085: missing folding and hash files when precompiling
================================================================================
Issue is closed, was reported by WiseGenius and has 4 comment(s).
[type.bug] [status.resolved]
<https://github.com/red/red/issues/1085>

When running `red-03apr15-e801081.exe` on Windows XP, I get:

```
Pre-compiling Red console...
*** Loading Error: file access error: make object! [
    code: 500
    type: 'access
    id: 'cannot-open
    arg1: {/H/Documents and Settings/WiseGenius/My Documents/Downloads/case-folding.reds}
    arg2: none
    arg3: none
    near: [any [get-cache file read/binary file]]
    where: 'read-binary-cache
]
*** in file: %unicode.reds
*** at line: 36
```

That seems strange, since the last commit to `case-folding.reds` looks like it was made 6 days ago.
As a quick hack, I downloaded `case-folding.reds` from the source into the same Downloads folder, and got:

```
Pre-compiling Red console...
*** Loading Error: file access error: make object! [
    code: 500
    type: 'access
    id: 'cannot-open
    arg1: {/H/Documents and Settings/WiseGenius/My Documents/Downloads/hashtable.reds}
    arg2: none
    arg3: none
    near: [any [get-cache file read/binary file]]
    where: 'read-binary-cache
]
*** in file: %sort.reds
*** at line: 38
```

Also strange. Same hack gave:

```
Pre-compiling Red console...
*** Loading Error: file access error: make object! [
    code: 500
    type: 'access
    id: 'cannot-open
    arg1: {/H/Documents and Settings/WiseGenius/My Documents/Downloads/datatypes/hash.reds}
    arg2: none
    arg3: none
    near: [any [get-cache file read/binary file]]
    where: 'read-binary-cache
]
*** in file: %datatypes/vector.reds
*** at line: 75
```

Also Strange. Final hack works.



Comments:
--------------------------------------------------------------------------------

On 2015-04-04T03:48:50Z, dockimbel, commented:
<https://github.com/red/red/issues/1085#issuecomment-89495463>

    Confirmed. The files are referenced properly, the issue is most probably with our backend building server.

--------------------------------------------------------------------------------

On 2015-04-04T04:20:03Z, dockimbel, commented:
<https://github.com/red/red/issues/1085#issuecomment-89498525>

    The build server git repo now has the correct files, the new produced binaries are now working fine.

