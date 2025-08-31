
#168: Unable to compile anything
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/168>

A current Red checkout is unable to compile anything, for example empty.reds:

Compiling /resources/Red/tests/empty.reds ...
**\* Compiler Internal Error: Script Error : Cannot use path on none! value 
**\* Where: build-debug-lines 
**\* Near:  [records: job/debug-info/lines/records 
files: job/debug-info/lines/files 
rec-size:
]



Comments:
--------------------------------------------------------------------------------

On 2011-09-06T21:12:34Z, dockimbel, commented:
<https://github.com/red/red/issues/168#issuecomment-2022391>

    Regression issue was limited to ELF targets only. It is fixed by commit [265b49e7](https://github.com/dockimbel/Red/commit/265b49e7fd72d9c892dc719fe05190dd79f48159).

