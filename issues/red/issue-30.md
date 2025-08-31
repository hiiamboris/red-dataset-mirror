
#30: Dividing zero by maximum negative number crashes compiler
================================================================================
Issue is closed, was reported by PeterWAWood and has 6 comment(s).
[status.tested]
<https://github.com/red/red/issues/30>

Code:
Red/System []
i: 0 / -2147483648

Result:

Note: following compiles okay 

Red/System []
i: 0 / -2147483647



Comments:
--------------------------------------------------------------------------------

On 2011-05-06T15:01:14Z, dockimbel, commented:
<https://github.com/red/red/issues/30#issuecomment-1111689>

    They both produces a compilation error after my last commit. It seems I have introduced a regression in addition to the problem you are reporting. Will fix them rapidly.

--------------------------------------------------------------------------------

On 2011-05-06T15:07:58Z, PeterWAWood, commented:
<https://github.com/red/red/issues/30#issuecomment-1111741>

    Thanks

--------------------------------------------------------------------------------

On 2011-05-09T11:46:49Z, dockimbel, commented:
<https://github.com/red/red/issues/30#issuecomment-1122381>

    Tested OK.

