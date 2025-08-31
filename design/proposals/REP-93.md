
#93: WISH: Support MAP! in REMOVE-EACH
================================================================================
Issue is open, was reported by rebolek and has 8 comment(s).
<https://github.com/red/REP/issues/93>

`foreach` supports `map!` however `remove-each` does not and for bulk key removal `foreach` + `remove/key` combo must be used.


Comments:
--------------------------------------------------------------------------------

On 2021-01-20T18:50:35Z, greggirwin, commented:
<https://github.com/red/REP/issues/93#issuecomment-763857640>

    How do you see it working? Maps are unordered, so the key you want to remove has to be implicit somehow.

--------------------------------------------------------------------------------

On 2021-01-20T22:56:57Z, Oldes, commented:
<https://github.com/red/REP/issues/93#issuecomment-764007538>

    Related R3's request: https://www.curecode.org/rebol3/ticket.rsp?id=806
    @greggirwin maybe working like this:
    ```rebol
    >> remove-each [key val] #(a 1 "b" 2 c #[none] d: 3) [any [string? key none? val]]
    == #(
        a: 1
        d: 3
    )
    ```
    in the same way how is possible to do:
    ```red
    >> foreach [key val] #(a 1 "b" 2 c #[none] d: 3) [print [key "is" val]]
    a is 1
    b is 2
    c is none
    d is 3
    ```

--------------------------------------------------------------------------------

On 2021-01-21T02:09:27Z, greggirwin, commented:
<https://github.com/red/REP/issues/93#issuecomment-764184022>

    I'm happy for people to play with it and comment. 
    ```
    remove-each_map: func ['word [block!] data [map!] body [block!]][
    	foreach [key val] data [
    		if do body [remove/key data key]
    	]
    	data
    ]
    ```
    The R/S today doesn't use the words when  `remove-each-next` call is made, so we'd need a `map!` version of that. I don't see where `remove-each-init` is called at all in the code base. @dockimbel is that dead code now?

--------------------------------------------------------------------------------

On 2021-01-21T07:42:54Z, rebolek, commented:
<https://github.com/red/REP/issues/93#issuecomment-764447105>

    Thanks @Oldes that's exactly what I meant.

