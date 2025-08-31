
#617: object! iteration missing
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 8 comment(s).
[status.deferred] [type.wish]
<https://github.com/red/red/issues/617>

red>> foreach [x y] context [a: 'b] [?? x ?? y]

**\* Runtime Error 1: access violation
**\* at: 0809C4B1h

R3:

> > foreach [x y] context [a: 'b] [?? x ?? y]
> > x: a
> > y: b
> > == b



Comments:
--------------------------------------------------------------------------------

On 2013-12-18T16:37:34Z, dockimbel, commented:
<https://github.com/red/red/issues/617#issuecomment-30857178>

    I am not sure if this feature is worth having, as you can iterate easily already using **words-of** or **body-of**. Objects in Red have a clear purpose: provide a namespace container for code and data. For associative arrays needs, map! will be added in the future to Red and iteration, as well as series actions will be broadly supported.
    
    I'm keeping this ticket open for a few days for additional comments/feedbacks.

--------------------------------------------------------------------------------

On 2013-12-19T03:32:40Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/617#issuecomment-30902727>

    I'm iterating using words-of now, but it's inefficient. I suppose it creates a new block? And words-of has no /into option, so I can't use an existing buffer for it.
    
    Here's my code for converting an object! to JSON format:
    
    http://red.esperconsultancy.nl/Red-JSON/annotate?checkin=72d8c32e9635cd07&filename=JSON.red#a297
    
    R3 could use the same code for converting any-block! to JSON format to convert an object!:
    
    http://red.esperconsultancy.nl/Red-JSON/annotate?checkin=72d8c32e9635cd07&filename=JSON.red#a220
    
    This would save 40 lines of duplicate code in the emitter alone.

--------------------------------------------------------------------------------

On 2016-05-10T16:35:41Z, dockimbel, commented:
<https://github.com/red/red/issues/617#issuecomment-218215556>

    I think it is worth considering the addition of `/into` refinement to all `*-of` accessors, as they are producing a new block (except `body-of` on functions). In such case, iterating over objects directly will not be needed anymore.

--------------------------------------------------------------------------------

On 2022-09-15T15:48:59Z, dockimbel, commented:
<https://github.com/red/red/issues/617#issuecomment-1248288020>

    Closing this ticket, as object semantics will be reexamined in the language spec work and iterability will be considered.

