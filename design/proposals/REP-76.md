
#76: WISH: A reflective area facet that indicates/manipulates the cursor position
================================================================================
Issue is open, was reported by temperfugit and has 6 comment(s).
<https://github.com/red/REP/issues/76>

I have a couple of ideas I'd like to play with which would require me to know and be able to change the location of the caret in an `area`.

In 2017 a [similar request](https://github.com/red/red/issues/2422) was made and deferred, DocKimbel commented that `text-box` (which I think became `rich-text`) was on the way and may be integrated into `area`, which would then expose caret information.  That has not happened (I expect it will eventually) and perhaps in the meantime we could get caret info in `area`?

In 2018 a more [thorough request](https://github.com/red/REP/issues/5) was made for selection, scroller and caret control.  I don't know the progress of scroller but a reflective selected facet has been implemented since then.  Doc's note on caret manipulation at the time was:

> For caret, we need to find the facet that fits it the best, or provide separate conversion functions, if maintaining the realtime binding between the facet and the OS API is too expensive.


Comments:
--------------------------------------------------------------------------------

On 2020-05-22T20:13:59Z, greggirwin, commented:
<https://github.com/red/REP/issues/76#issuecomment-632893902>

    Have you read up on https://doc.red-lang.org/en/rtd.html? @toomasv is the most experienced with it I think, and has some great examples out there.

--------------------------------------------------------------------------------

On 2020-05-23T04:12:16Z, temperfugit, commented:
<https://github.com/red/REP/issues/76#issuecomment-632981912>

    I've played around with RTD's multi-box mode a fair amount.  I like it a lot but it's a lot of work to make a fully functional text editor out of it.
    
    I have a very rough, semi-functional rich-text editor prototype that I've been playing around with, but life intervenes and I've stalled out on it.  Basically it uses text stored as a block of strings that are split at line breaks.  Each on-screen paragraph is rendered in its own rich-text box (but all on the same rich-text pane). Even if or when it gets finished it would be nowhere near as portable or as easy to deploy as a View widget would be.  I realized this week that what I wanted it for I could do with `area` instead, if I could manipulate the caret directly---which is why I posted this wish :)

--------------------------------------------------------------------------------

On 2020-05-23T21:13:47Z, greggirwin, commented:
<https://github.com/red/REP/issues/76#issuecomment-633141317>

    Good feedback, thanks. :+1:

