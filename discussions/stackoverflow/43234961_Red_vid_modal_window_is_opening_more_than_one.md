# Red vid modal window is opening more than one

**Link:**
<https://stackoverflow.com/questions/43234961/red-vid-modal-window-is-opening-more-than-one>

**Asked:** 2017-04-05 15:02:47 UTC

------------------------------------------------------------------------

    View [
        Size 400x400
        button "click" [
            view/flags [
                Size 300x100
                text "modal window"
            ]['modal 'pop-up]
       ]
    ]

Problem is if I click button 4 times it will create 4 modal window. But
I want no other modal window if 1 modal window is already open. How can
I do it

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by DocKimbel

You have several typos in your code preventing it from working properly:

-   should be `popup` instead of `pop-up`.
-   flags in the block are expected to be words not lit-words, so it
    should be `[modal popup]`.

After those fixes, your code works as expected.

Note: I think the `/flags` argument block should be improved to accept
lit-words.

EDIT: `/flags`
[now](https://github.com/red/red/commit/07d1e4ded08d3dcf8905d27669c9ff928f9a146c){rel="nofollow noreferrer"}
accepts lit-words.

------------------------------------------------------------------------

## Comments on question

*Comment by Eran W:* I see that DocKimbel answer solves this problem, If
you feel an answer solved the problem, please mark it as \'accepted\' by
clicking the green check mark. This helps keep the focus on older SO
which still don\'t have answers.
