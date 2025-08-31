
#5: Expose more APIs to control area face.
================================================================================
Issue is open, was reported by PeterWAWood and has 24 comment(s).
[Wish]
<https://github.com/red/REP/issues/5>

This was previously red issue [3194](https://github.com/red/red/issues/3194) opened by @qtxie.

Provide a way to let user to have a fine control of the area. like:

- scroll-lineup
- scroll-linedown
- scroll-to-bottom
- scroll-to-top
- move-caret
- select-text
more......



Comments:
--------------------------------------------------------------------------------

On 2018-04-23T02:20:47Z, PeterWAWood, commented:
<https://github.com/red/REP/issues/5#issuecomment-383436174>

    @dockimbel made this comment:
    
    The `/selected` facet should be used to handle selection in a reflective way (read/write). It should be set to a `pair!` value holding the index of first and last selected characters, defining a selection range. When there is no selected text, the facet should be set to `none`. Such interface should be used for `field` widget too.
    
    For scrolling control, the new `scroller` face type should provide the right interface for fine control (work in progress).
    
    For caret, we need to find the facet that fits it the best, or provide separate conversion functions, if maintaining the realtime binding between the facet and the OS API is too expensive.

--------------------------------------------------------------------------------

On 2022-06-28T07:52:28Z, meijeru, commented:
<https://github.com/red/REP/issues/5#issuecomment-1168365821>

    Given that the /selected facet now exists, the position of the caret can be encoded in the pair! value with second coordinate 0 (length of the selected substring). This is a minimal enhancement that would be very useful.

--------------------------------------------------------------------------------

On 2024-02-03T11:20:42Z, luce80, commented:
<https://github.com/red/REP/issues/5#issuecomment-1925284922>

    https://github.com/red/red/issues/3194#issuecomment-362781714 "The `/selected` facet [...] should be set to a `pair!` value holding the index of first and last selected characters."
    
    To be consistent with `rich-text/data` it should be set to a `pair!` value holding the index of first character and the number of selected characters.

--------------------------------------------------------------------------------

On 2024-02-03T11:35:26Z, hiiamboris, commented:
<https://github.com/red/REP/issues/5#issuecomment-1925292446>

    https://github.com/red/red/issues/5263

--------------------------------------------------------------------------------

On 2024-02-04T07:14:55Z, luce80, commented:
<https://github.com/red/REP/issues/5#issuecomment-1925607397>

    @hiiamboris about #5263 reasoning: for my personal tastes the notation `Nx0` is easier to "see" as a position and also as a range, at least for text selection and caret position porposes. It should also be as consistent throughout places as possible, but now the question is:
    what happens for out-of-range/negative values?

--------------------------------------------------------------------------------

On 2024-02-04T08:18:28Z, hiiamboris, commented:
<https://github.com/red/REP/issues/5#issuecomment-1925631197>

    Where do you "see" it that it's easier for you? And easier than what?

--------------------------------------------------------------------------------

On 2024-02-06T23:17:49Z, GiuseppeChillemi, commented:
<https://github.com/red/REP/issues/5#issuecomment-1930931026>

    > @hiiamboris about #5263 reasoning: for my personal tastes the notation `Nx0` is easier to "see" as a position and also as a range, at least for text selection and caret position porposes. It should also be as consistent throughout places as possible, but now the question is: what happens for out-of-range/negative values?
    
    I would prefer the face accepts an integer too and it is tied to cursor position. If you read a pair the text is selected, if you read an integer, you have just the cursor position.

--------------------------------------------------------------------------------

On 2024-02-09T17:04:03Z, luce80, commented:
<https://github.com/red/REP/issues/5#issuecomment-1936280322>

    @hiiamboris I "see" it easier in my brain, easier then NxN for example and see also Oldes comment. @GiuseppeChillemi that could be a valid alternative.

--------------------------------------------------------------------------------

On 2024-02-09T17:10:01Z, hiiamboris, commented:
<https://github.com/red/REP/issues/5#issuecomment-1936288698>

    I understand it's in your brain. Can you picture us how your brain represents it and how this representation is connected to the actual string? Let's use a `"--XX--"` string for example (Xs denote the range of interest).

--------------------------------------------------------------------------------

On 2024-02-09T18:40:50Z, luce80, commented:
<https://github.com/red/REP/issues/5#issuecomment-1936427537>

    Really should I ?
    <ins>**a**</ins>bcde ; 1x1
    a<ins>**bcd**</ins>e  ; 2x3
    a<ins>**bc**</ins>de  ; 2x2
    a<ins>**b**</ins>cde  ; 2x1
    a<ins>|</ins>bcde  ; 2x0 (caret inserted to see the zero-width range...)
    

--------------------------------------------------------------------------------

On 2024-02-09T18:49:15Z, hiiamboris, commented:
<https://github.com/red/REP/issues/5#issuecomment-1936437703>

    > Really should I ? 
    **a**bcde ; 1x1 
    a**bcd**e ; 2x3 
    a**bc**de ; 2x2 
    a**b**cde ; 2x1 
    a|bcde ; 2x0 (caret inserted to see the zero-width range...)
    
    OK. Do you see that there is nothing in your illustration that has lengths 1, 2, 2, 2, 2 respectively? So I'll ask again, do you really visualize these numbers, and how?
    

--------------------------------------------------------------------------------

On 2024-02-09T19:47:40Z, luce80, commented:
<https://github.com/red/REP/issues/5#issuecomment-1936510228>

    ?? Wheren't we talking about `index x length` ? I thought so, sorry.

