# Getting strings from a list into VID in Red language

**Link:**
<https://stackoverflow.com/questions/46280562/getting-strings-from-a-list-into-vid-in-red-language>

**Asked:** 2017-09-18 13:29:32 UTC

------------------------------------------------------------------------

I am trying to create a panel with dynamically created gui elements:

      sentlist: ["A" "B" "C"]
      main: function [slist] [
        view collect [
          keep [below]
          repeat i length? slist [
            keep[
                text slist/i    ; THIS STEP IS NOT WORKING
                field "" ] ] ] ]

      (main sentlist) 

A series of strings is sent to the function for putting text labels from
it. The GUI window/panel is opening all right but text elements do not
have any label on it. Where is the problem and how can it be solved?
Thanks for your help.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by sqlab

    sentlist: ["A" "B" "C"]
    main: function [slist] [
        view collect  [
            keep 'below
            repeat i length? slist [
                keep  compose [text (slist/:i) field "" ]
            ]
        ] 
    ]
    main sentlist 

*Comment by sqlab:* By the way, this is the official formatting. Don\'t
edit/deface it always. I do not understand that your editing of the
formatting is accepted by reviewers

*Comment by rnso:* I had tried `slist/:i` but not with parens
`(slist/:i)` and also without `compose`. Can you provide some
explanation about need for parens and compose keyword in your answer.
Regarding the formatting, I do not think it is logical to keep closing
braces on separate lines. Blocks of code are best seen by indentation
and not closing braces/brackets.

*Comment by sqlab:* I think it is logical. You see with ease and without
counting closing brackets, if there is a missing bracket or more
brackets. Compose evaluates/does only the parentheses in a block.

*Comment by rnso:* Missing or extra brackets can easily be seen by good
IDEs. Even otherwise, once code is working, one should pack away the
closing brackets- open them later if some problem needs to be debugged.
Of what use are 3 almost empty lines in your answer above.

*Comment by sqlab:* Not everyone uses an IDE. A simple editor is always
available on different platforms. Why format anew if problems arise?

*Comment by rnso:* We should agree to disagree! I have a new question:
[stackoverflow.com/questions/46285290/...](https://stackoverflow.com/questions/46285290/printing-out-text-of-all-gui-elements-in-red-language "printing out text of all gui elements in red language")

------------------------------------------------------------------------

## Comments on question
