
#2005: Wish: FIND and CLEAR could be defined on image! values
================================================================================
Issue is open, was reported by meijeru and has 10 comment(s).
[type.task.wish]
<https://github.com/red/red/issues/2005>

`find` would look for a single pixel specified as a tuple or a binary value, both of length 3 or 4, or for a series of pixels specified as a binary value of length a multiple of 4.

`clear` would set all pixels, from the current position to the end, to `0.0.0.0`



Comments:
--------------------------------------------------------------------------------

On 2019-05-01T16:25:46Z, nedzadarek, commented:
<https://github.com/red/red/issues/2005#issuecomment-488332187>

    I think `clear` should set color to the default colour (`255.255.255.0`) which is set by `i: make image! 1x1 i/1`.
    `find` should expect another types than `tuple` & `binary` because `find` have `/any` refinement (TBD). 

--------------------------------------------------------------------------------

On 2019-09-23T14:32:04Z, hiiamboris, commented:
<https://github.com/red/red/issues/2005#issuecomment-534125823>

    I agree that `clear` may set pixels to the default color, from the current head. But is there a real world need for resetting all pixels from a given index? The other means (`i/argb: white`) sets *every* pixel in an image, regardless of the head position.
    
    `find` part is tricky. Pretty straightforward to do for a tuple, but allowing it to accept a binary argument needs a thought. If `/argb` value is valid across different platforms then exposing it to other utilities (like find) is no risk (but making it cross-platform is a speed penalty). If it's not, then `find i bin` may give a false impression of it being cross-platform and encourage people to write weak code.

--------------------------------------------------------------------------------

On 2019-09-23T14:51:07Z, meijeru, commented:
<https://github.com/red/red/issues/2005#issuecomment-534134329>

    Where is it stated that `/argb` is platform dependent?

--------------------------------------------------------------------------------

On 2019-09-23T17:00:49Z, hiiamboris, commented:
<https://github.com/red/red/issues/2005#issuecomment-534190240>

    It's not stated, but I'm wondering if it is. Just a guess :)
    What other reason can there be for it not to follow Red's alpha-channel convention (0 = opaque, 255 = transparent) ? In your other ticket https://github.com/red/red/issues/2812 I notice that `argb`'s behavior follows the Windows' convention instead (0 = transparent, 255 = opaque).

--------------------------------------------------------------------------------

On 2019-09-23T18:45:50Z, meijeru, commented:
<https://github.com/red/red/issues/2005#issuecomment-534231997>

    @dockimbel and/or @qtxie need to weigh in on this.

