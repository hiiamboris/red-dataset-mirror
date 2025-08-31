
#2031: SPLIT with charset produces garbage, memory corruption or no string end  delimiter?
================================================================================
Issue is closed, was reported by xqlab and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2031>

red>> split "1,3,.3,," charset ".,"
== ["1" "3" "" "3" "" {^@^@^@^@^@^@^@^@^A^@^@ Pþ5^@^P^@^@^@¸G^B¿G^Bcharset^@^@^@^@^@^@^@^@^@^A^@^@ Lþ5^@^P^@^@^@ÜG^BÞG^B}]



Comments:
--------------------------------------------------------------------------------

On 2016-06-16T10:14:42Z, dockimbel, commented:
<https://github.com/red/red/issues/2031#issuecomment-226444931>

    This is actually a `parse` bug on matching bitsets.

