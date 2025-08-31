
#907: random on a path value returns a path, in contrast to REBOL2 and 3
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/907>

R2 returns a block, R3 refuses to perform random on a path value.

I asked myself which is the more sensible solution, and since paths have a head, it would seem that the same comment as for files and urls vs. strings applies (see my previous issue), therefore R3 is right in forbidding it.



Comments:
--------------------------------------------------------------------------------

On 2014-08-23T15:42:13Z, dockimbel, commented:
<https://github.com/red/red/issues/907#issuecomment-53156401>

    Agreed, (any-)paths should not be supported by RANDOM action as it could result in an invalid path (`a/b/1` => `1/a/b`).

--------------------------------------------------------------------------------

On 2015-01-29T02:59:57Z, qtxie, commented:
<https://github.com/red/red/issues/907#issuecomment-71961006>

    Type checking will solve this issue.

