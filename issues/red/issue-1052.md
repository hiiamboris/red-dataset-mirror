
#1052: SET-WORD! and GET-WORD! cannot be used as a datatype! with the TO action!
================================================================================
Issue is closed, was reported by JerryTsai and has 2 comment(s).
<https://github.com/red/red/issues/1052>

red>> to set-word! 'name
**\* Script error: to does not allow word for its type argument
**\* Where: to

REBOL>> to set-word! 'name
== name:



Comments:
--------------------------------------------------------------------------------

On 2015-03-09T01:39:29Z, JerryTsai, commented:
<https://github.com/red/red/issues/1052#issuecomment-77788430>

    I've just learned that "TO" is not supported yet. So I close the ticket.

