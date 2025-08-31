
#1530: Duplicated #import
================================================================================
Issue is closed, was reported by Oldes and has 4 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/1530>

When one does `#import ["kernel32.dll" stdcall [ GlobalAlloc: "GlobalAlloc" [..]]]` in one file and in second the same, it is currently imported twice.

Better would be to filter out duplicate import if the spec is same and throw an error or warning, when the spec for the import is different.



Comments:
--------------------------------------------------------------------------------

On 2016-01-15T10:29:04Z, dockimbel, commented:
<https://github.com/red/red/issues/1530#issuecomment-171927875>

    Fixing note: the check needs to be done in the compiler rather than linker and if the specs are the same, just drop the new imported function with no error.

--------------------------------------------------------------------------------

On 2016-02-03T09:42:01Z, dockimbel, commented:
<https://github.com/red/red/issues/1530#issuecomment-179127120>

    The duplicated import are now dropped, though, it is not possible to check if the provided specs are the same as the information is not kept during the compilation, so it would require a new data-structure. I'm not sure if it is worth the trouble.

