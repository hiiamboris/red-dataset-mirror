# Remove button faces

**Link:**
<https://stackoverflow.com/questions/62444806/remove-button-faces>

**Asked:** 2020-06-18 07:39:52 UTC

------------------------------------------------------------------------

**Hi all.**\
*I want to know that how can I remove two button face with a button.*

*I tried this:*

    gui: [
      en: button "English" remove [en es]
      es: button "Spanih" remove [en es]
    ]

*And than I have to append new buttons.*

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 4) --- by 9214

[View
engine](https://doc.red-lang.org/en/view.html){rel="nofollow noreferrer"}
models GUI interface as a tree of objects; each node in that tree is
called a face, and each field of that face is called a facet.

Two facets, `parent` and `pane`, interlink a face with its parent node
and its child nodes, respectively. So, by that theory, to remove a
button is to remove a `button` face from a pane of its parent:

    view [button "Poof!" [probe select take face/parent/pane 'text]]

This, however, is a bit limited approach. The removed face is detached
from View tree and can no longer be used unless you reattach the `face!`
object with the same specification back to the pane. It might be more
useful to simply disable a button, or to render it invisible for the
time being. `enabled?` and `visible?` facets can achieve just that:

    view [
        title "Face flags example"
        below
        toggle "Toggle" [foo/enabled?: not foo/enabled?]
        foo: button "Switch" disabled [bar/visible?: not bar/visible?]
        bar: base red
    ]

You can adapt this approach to the task at hand. As I understand, you
want to offer mutually exclusive localization options;
[`drop-list`](https://doc.red-lang.org/en/view.html#_drop_list){rel="nofollow noreferrer"}
might be a good fit for that:

    view [drop-list data ["en" "es"]]

*Comment by Civan Tunç:* Wow! A very explanatory answer. Thank you.

------------------------------------------------------------------------

### Answer (score: 3) --- by Maciej Łoziński

You can try this:

    Red [Needs: View]
    view [
        en: button "English" [remove find face/parent/pane en]
        es: button "Spanish" [
            remove find face/parent/pane en
            remove find face/parent/pane es
        ]
    ]

*Comment by Civan Tunç:* Thank you for your very quick answer. This code
is so good. Well, it is not run with Rebol but it run with Red.

*Comment by 9214:* Hi \@CivanTunç, welcome to StackOverflow! If you are
satisfied with Maciek\'s answer, please mark is as an accepted one.

------------------------------------------------------------------------

## Comments on question

*Comment by Maciej Łoziński:* 1) You have to use `view` function to
display a gui. 2) Button actions have to be enclosed in a block.

*Comment by Dave Andersen:* Hi Civan, rather than editing the title of
your question to say that it is solved, typically you should mark the
best answer as \"answered\" (the green checkmark). You can also say
thanks by upvoting any answers that you found helpful.

*Comment by Civan Tunç:* Okay, I got it.
