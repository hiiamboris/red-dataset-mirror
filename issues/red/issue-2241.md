
#2241: To string! different between Red and Rebol
================================================================================
Issue is closed, was reported by dsunanda and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2241>

red>> to string! #"a"
== "97"

Would expect "a" for R2 and R3 compatibility.

Tested with Red-061, Windows.



Comments:
--------------------------------------------------------------------------------

On 2016-09-29T12:00:51Z, dockimbel, commented:
<https://github.com/red/red/issues/2241#issuecomment-250446725>

    `to` is not officially supported yet, the current implementation is partially done, so please don't open any ticket about it, until it becomes official.

