
#2032: LS does not work with words representing file paths
================================================================================
Issue is closed, was reported by xqlab and has 4 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2032>

red>> d: %/C/
== %/C/
red>> ls d
**\* Access error: cannot open: %/C/Users/user1/own/rebol/d/
**\* Where: read
red>> 



Comments:
--------------------------------------------------------------------------------

On 2016-06-16T16:27:23Z, dockimbel, commented:
<https://github.com/red/red/issues/2032#issuecomment-226538886>

    `ls` is not meant to evaluate its argument, `list-dir` should do that, but it's currently failing to do so (there should be a ticket about that).

--------------------------------------------------------------------------------

On 2016-06-17T08:55:43Z, dockimbel, commented:
<https://github.com/red/red/issues/2032#issuecomment-226716773>

    Now `list-dir` will work for such use-case.

