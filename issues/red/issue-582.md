
#582: ABSOLUTE crashes
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 6 comment(s).
<https://github.com/red/red/issues/582>

red>> absolute 1

**\* Runtime Error 1: access violation
**\* at: 00000000h

ABSOLUTE isn't defined for any datatype. Shouldn't it produce a controlled error message?



Comments:
--------------------------------------------------------------------------------

On 2013-11-27T23:54:54Z, dockimbel, commented:
<https://github.com/red/red/issues/582#issuecomment-29430042>

    ABOSOLUTE action has no implementation yet, see in %actions.reds:
    
    ```
    absolute*: func [][]
    ```

--------------------------------------------------------------------------------

On 2013-11-28T23:05:20Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/582#issuecomment-29488678>

    Yes, I wrote that it isn't defined. What I'm wondering is if it should result in a crash, while other unimplemented actions on datatypes result in an error message to that effect.

--------------------------------------------------------------------------------

On 2013-12-06T00:09:32Z, dockimbel, commented:
<https://github.com/red/red/issues/582#issuecomment-29952080>

    The error messages you get are possible because the wrapper action is defined, which is not the case for **absolute** and a few others.

