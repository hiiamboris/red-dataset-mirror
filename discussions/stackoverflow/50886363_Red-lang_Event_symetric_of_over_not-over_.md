# Red-lang Event: symetric of over (not-over)?

**Link:**
<https://stackoverflow.com/questions/50886363/red-lang-event-symetric-of-over-not-over>

**Asked:** 2018-06-16 08:45:17 UTC

------------------------------------------------------------------------

[https://doc.red-lang.org/en/view.html](https://doc.red-lang.org/en/view.html){rel="nofollow noreferrer"}

over

mouse\
Mouse cursor passing over a face. This event is produced once when the
mouse enters the face and once when it exits. If flags facet contains
all‑over flag, then all intermediary events are produced too.

There is no symetric event ? How do I know mouse is not over anymore ?

In rebol there was
[http://www.rebol.com/how-to/feel.html](http://www.rebol.com/how-to/feel.html){rel="nofollow noreferrer"}
but this syntax doesn\'t exist anymore in Red or I am mistaken ?

        view layout [
            box "A Box" forest feel [
                over: func [face act pos] [print [act pos]]
            ]
        ]

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 0) --- by DocKimbel

No symetric event is needed as you can use the `event/away?` flag to
check if the `over` event is exiting the face area. See
[https://doc.red-lang.org/en/view.html#\_event_datatype](https://doc.red-lang.org/en/view.html#_event_datatype){rel="nofollow noreferrer"}

`feel` in Rebol/VID is just a keyword for listing event handlers, it\'s
not needed in Red/VID, as event handlers are first-class citizens. So in
Red/VID, you would write it:

    view [box "A Box" forest on-over [print [event/offset event/away?]]]

------------------------------------------------------------------------

## Comments on question
