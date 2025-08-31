# Rebol / Red VID: why is close event immediately sent ?

**Link:**
<https://stackoverflow.com/questions/50032530/rebol-red-vid-why-is-close-event-immediately-sent>

**Asked:** 2018-04-25 23:04:12 UTC

------------------------------------------------------------------------

I inspired from
[http://www.codeconscious.com/rebol/view-notes.html](http://www.codeconscious.com/rebol/view-notes.html){rel="nofollow noreferrer"}

I don\'t understand: why is close sent immediately: that\'s not what I
want and I would expect it to be sent when I click on Window close

        query-on-close: func[face event][
            print "query-on-close"
            remove-event-func :query-on-close
            RETURN event    

        ]

        view layout [
            do [ insert-event-func :query-on-close ]
        ]

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by Graham Chiu

    rebol []

    query-on-close: func [face event][
        prin event/type prin " "
        either 'close = event/type [
            print "^/query-on-close handler now removed. Next close will now close this window"
            remove-event-func :f
            return none
        ][
            RETURN event    
        ]
    ]
    f: insert-event-func :query-on-close

    view layout [
        title "Test screen"
    ]

As written the first event you receive will print the message, and then
remove the handler. You need to test specifically for the *CLOSE* event.

------------------------------------------------------------------------

## Comments on question
