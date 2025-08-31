
#2850: WISH: Use SELECT/SKIP 2 behaviour for path select notation
================================================================================
Issue is open, was reported by rgchris and has 14 comment(s).
[status.reviewed] [type.task.wish]
<https://github.com/red/red/issues/2850>

To my mind when using the PATH! form of SELECT the intent more often than not is to assume that the target block is one of KEY/VALUE pairs.

    thing: [name id value 1234]

    >> thing/value
    == 1234

However when this assumption breaks, it can be surprising:

    thing: [name value value "abcd"]

    >> thing/value
    == value

I propose that the default path SELECT behaviour is that of SELECT/SKIP 2. The current behaviour would still be available using the unrefined SELECT function.

    thing: [name value value "abcd"]

    >> thing/value
    == "abcd"
    >> select thing 'value
    == value


Comments:
--------------------------------------------------------------------------------

On 2017-07-06T14:52:19Z, dockimbel, commented:
<https://github.com/red/red/issues/2850#issuecomment-313419909>

    That's an interesting proposition. I would need to dig a bit more to see if that would not cause any regression anywhere.

--------------------------------------------------------------------------------

On 2017-07-06T16:57:51Z, greggirwin, commented:
<https://github.com/red/red/issues/2850#issuecomment-313456239>

    I agree that the skip/2 case is the most common. 
    
    I think the big point of contention in the past was that R2 always returned a block if you used `/skip`. That is, a skip size of 2 was not a special case. I just realized that Red goes completely the other direction, and *never* returns a block when you use `/skip`.
    ```
    >> blk: [a b c d 1 2 3 4 #e #f #g #h]
    == [a b c d 1 2 3 4 #e #f #g #h]
    >> select/skip blk 'c 2
    == d
    >> select/skip blk 'd 3
    == 1
    >> select/skip blk 'a 5
    == b
    ```
    If this is by design, it seems like a big break with Rebol's select, and much more likely to cause regressions. It looks like there's no `skip` check after the `find` in block's select action, but no comment saying whether that's intentional or not. 

--------------------------------------------------------------------------------

On 2017-07-06T17:00:08Z, greggirwin, commented:
<https://github.com/red/red/issues/2850#issuecomment-313456858>

    Being able to `select` on key-value blocks, without having to un-blockify the result is nice, but it does make it an exception to `/skip` behavior if we add that for skip vals larger than 2. I think that's OK. At least it's better than not being able to select all values for fixed size records > 2.

--------------------------------------------------------------------------------

On 2017-07-06T22:45:41Z, rgchris, commented:
<https://github.com/red/red/issues/2850#issuecomment-313539667>

    @greggirwin I believe that /skip behaviour was introduced in Rebol 3 as well.

--------------------------------------------------------------------------------

On 2017-07-07T02:35:38Z, greggirwin, commented:
<https://github.com/red/red/issues/2850#issuecomment-313571455>

    Indeed. Any idea what the logic was there?

--------------------------------------------------------------------------------

On 2017-07-08T03:57:26Z, dockimbel, commented:
<https://github.com/red/red/issues/2850#issuecomment-313831541>

    @greggirwin The Red `/skip` behavior is intended (as it fits the use-cases I had for `select/skip` better), but this might not have been a wise departure from Rebol's behavior, especially if it breaks `/skip` consistency with other natives. We can revisit that choice.

--------------------------------------------------------------------------------

On 2017-07-22T01:13:29Z, rgchris, commented:
<https://github.com/red/red/issues/2850#issuecomment-317144068>

    @greggirwin [This](http://www.rebol.net/cgi-bin/r3blog.r?view=0194) is the only mention I'm aware of re. the Rebol 3 decision. Seems the author wasn't that clear what to do either. I still lean that Rebol 2 behaviour is desirable *except* in the case of `SELECT/SKIP thing 2`

