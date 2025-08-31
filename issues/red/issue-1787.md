
#1787: GUI Console: Unicode characters become question marks on click
================================================================================
Issue is closed, was reported by ghost and has 10 comment(s).
[status.deferred] [GUI]
<https://github.com/red/red/issues/1787>

Typing a unicode character (say `👀` ) in the GUI-Console and then clicking **anywhere** on that line converts it to question marks.
![a](https://cloud.githubusercontent.com/assets/16458742/14250109/8daaeeb6-fa9a-11e5-9ec4-4a03c39716c1.gif)



Comments:
--------------------------------------------------------------------------------

On 2016-04-04T14:06:02Z, qtxie, commented:
<https://github.com/red/red/issues/1787#issuecomment-205308378>

    Good catch!

--------------------------------------------------------------------------------

On 2016-05-12T12:33:34Z, qtxie, commented:
<https://github.com/red/red/issues/1787#issuecomment-218743154>

    It should be fixed by this commit  69321f7 , though it still has a glitch.(the width of the eye is not correct)
    It need a big change in the code to fix it, so I'm closing this issue and postpone it.

--------------------------------------------------------------------------------

On 2016-05-13T06:55:37Z, ghost, commented:
<https://github.com/red/red/issues/1787#issuecomment-218965896>

    @qtxie By 
    
    > though it still has a glitch.(the width of the eye is not correct)
    
    do you mean **this** (after pasting the eye, and then clicking on the same line, it does not become question mark, but little bit from the right side gets cut) **or is it a regression** ?-
    ![a](https://cloud.githubusercontent.com/assets/16458742/15240200/996d2dfc-1905-11e6-8562-c7cd00aacf53.gif)

--------------------------------------------------------------------------------

On 2016-05-13T07:55:31Z, qtxie, commented:
<https://github.com/red/red/issues/1787#issuecomment-218975951>

    @nc-x Yes. The width of the eyes is bigger than normal letter. We need to change our string length (in screen unit) calcuate algorithm to fix it.
    Also on Window 7, I cannot see the eyes, always a question mark. 

--------------------------------------------------------------------------------

On 2016-05-13T08:28:10Z, iArnold, commented:
<https://github.com/red/red/issues/1787#issuecomment-218982206>

    Here on win7 it is a little block containing a question mark. When I click on the line and hold the mouse button down a second block with question mark appears on the right side of the first block. After releasing the mouse button is disappears again.

