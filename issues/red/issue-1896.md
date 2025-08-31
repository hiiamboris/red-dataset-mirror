
#1896: possible rejoin problem
================================================================================
Issue is closed, was reported by mark-summerfield and has 22 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/1896>

Run this and change the value 1.00 to, say 2, and you'll get the error.
[currency-err.red.txt](https://github.com/red/red/files/260954/currency-err.red.txt)



Comments:
--------------------------------------------------------------------------------

On 2016-05-12T11:20:59Z, xqlab, commented:
<https://github.com/red/red/issues/1896#issuecomment-218729387>

    See my comment on gitter.The error results from loading the value/text

--------------------------------------------------------------------------------

On 2016-05-12T11:26:08Z, dockimbel, commented:
<https://github.com/red/red/issues/1896#issuecomment-218730312>

    @xqlab Thanks for pin-pointing the cause of the error. Now we need to figure out why it works with an alternative `rejoin` implementation (like the Rebol2's one) and not with @rebolek 's version.

--------------------------------------------------------------------------------

On 2016-05-12T19:08:47Z, greggirwin, commented:
<https://github.com/red/red/issues/1896#issuecomment-218855784>

    It's related to the name `value` in the foreach in Bolek's `rejoin`. If you change it to something else, the error goes away.

--------------------------------------------------------------------------------

On 2016-05-12T19:16:11Z, greggirwin, commented:
<https://github.com/red/red/issues/1896#issuecomment-218857716>

    Although there may be something else going on. If you comment out the `attempt` from around the assignments in `calculate` you get this error:
        **\* Script error: calculate has no value
        **\* Where: try

--------------------------------------------------------------------------------

On 2016-05-14T03:28:37Z, dockimbel, commented:
<https://github.com/red/red/issues/1896#issuecomment-219198020>

    Indeed, the `value` word is not made local in `rejoin` implementation, so it collides with `value` used in VID block. This is a fixed version (using `function` will capture the `foreach` word argument):
    
    ```
    rejoin: function [data][
        collect/into [foreach value reduce data [keep value]] make string! 1
    ]
    ```
    
    @greggirwin I cannot reproduce any error with that fix.
    
    @rebolek You should fix your `rejoin` function with above version.

--------------------------------------------------------------------------------

On 2016-05-14T03:56:46Z, greggirwin, commented:
<https://github.com/red/red/issues/1896#issuecomment-219198857>

    Doh! I hate not seeing the obvious.

--------------------------------------------------------------------------------

On 2016-05-14T03:59:19Z, greggirwin, commented:
<https://github.com/red/red/issues/1896#issuecomment-219198949>

    But, wait, shouldn't `foreach` be binding that?

--------------------------------------------------------------------------------

On 2016-05-14T04:00:57Z, greggirwin, commented:
<https://github.com/red/red/issues/1896#issuecomment-219199012>

    I guess this is a change I need to understand, it must be by design.

--------------------------------------------------------------------------------

On 2016-05-14T04:23:49Z, dockimbel, commented:
<https://github.com/red/red/issues/1896#issuecomment-219199792>

    @greggirwin Not in Red, there's no local context for iterators (for now). I might add such feature if we can figure out a cheap and safe way to do it, while avoiding the huge overhead of Rebol's copying and re-binding of the body block on each invocation.
    
    I have added a card about it on our Trello board to not forget it.

--------------------------------------------------------------------------------

On 2016-05-14T15:02:26Z, greggirwin, commented:
<https://github.com/red/red/issues/1896#issuecomment-219225034>

    Thanks Doc. It's a nice feature in REBOL, though `function` will help a lot. It's an important difference to note for those moving from REBOL.

--------------------------------------------------------------------------------

On 2016-05-16T10:30:40Z, rebolek, commented:
<https://github.com/red/red/issues/1896#issuecomment-219395641>

    @dockimbel Thanks for the fix and explanation. However, the locality of iterators should be fixed soon, as this is going to be source of bugs, troubles and problems.

