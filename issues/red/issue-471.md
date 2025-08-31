
#471: Missing .rsrc  entry in the data directory of the PE emitter
================================================================================
Issue is closed, was reported by Oldes and has 8 comment(s).
[type.wish] [status.reviewed] [Red/System]
<https://github.com/red/red/issues/471>

It's not possible to use tool like ResHacker to add resources (before we will have proper resource handling) , as there is missing rsrc entry in the PE emitter (probably) - so even when I add something using ResHacker, it's not visible, when I reopen the file again in it.



Comments:
--------------------------------------------------------------------------------

On 2013-05-04T22:21:44Z, dockimbel, commented:
<https://github.com/red/red/issues/471#issuecomment-17442458>

    After having a deeper look at it, it seems that it is significant work (probably several days) to add it properly (official documentation is sparse and incomplete). So I will not work on it in the short-term as it is a low priority task. In the meantime, can you try using the following tools to see if there's not a workaround:
    1. [XN Resource Editor](http://www.wilsonc.demon.co.uk/d10resourceeditor.htm)
    2. [Resource Editor](http://melander.dk/reseditor/)
    3. MS Resource Compiler: http://msdn.microsoft.com/en-us/library/aa381042(v=vs.85).aspx

--------------------------------------------------------------------------------

On 2013-05-05T12:19:17Z, PeterWAWood, commented:
<https://github.com/red/red/issues/471#issuecomment-17450911>

    Wish moved to v2 wish list on wiki.

--------------------------------------------------------------------------------

On 2013-05-05T19:45:37Z, Oldes, commented:
<https://github.com/red/red/issues/471#issuecomment-17457719>

    1) XN Resource Editor works (I was able to add icon to Red's exe).
    2) Resource Editor is not able to open Red's exe at all.
    3) not tested MS Resource Compiler yet.

--------------------------------------------------------------------------------

On 2013-05-05T20:57:49Z, dockimbel, commented:
<https://github.com/red/red/issues/471#issuecomment-17459023>

    Great! So we have at least one workaround until we add proper resource compilation to Red.

