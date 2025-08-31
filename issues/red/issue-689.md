
#689: SETting a lit-word! in a parse rule changes it to word!
================================================================================
Issue is closed, was reported by IngoHohmann and has 4 comment(s).
[status.resolved]
<https://github.com/red/red/issues/689>

red>> parse [word 'lit-word :get-word set-word:][
   set w word! (print [mold w tab type? w]) 
   set w lit-word! (print [mold w tab type? w]) 
   set w get-word! (print [mold w tab type? w]) 
   set w set-word! (print [ mold w tab type? w]) 
]
word    word
lit-word    word
:get-word   get-word
set-word:   set-word
== true



Comments:
--------------------------------------------------------------------------------

On 2014-02-20T19:06:18Z, dockimbel, commented:
<https://github.com/red/red/issues/689#issuecomment-35656890>

    By default, lit-words are evaluated to words when referenced from another word. Rebol2 and Rebol3 do the same. In order to access an unevaluated version of the lit-word, you need to use `:w`.
    
    ```
    red>> parse ['lit-word][set w lit-word! (print [mold :w tab type? :w])]
    'lit-word       lit-word
    == true
    ```

--------------------------------------------------------------------------------

On 2014-02-20T21:00:57Z, IngoHohmann, commented:
<https://github.com/red/red/issues/689#issuecomment-35668320>

    Oops, I didn't realize this at the moment, Seems I need to practice a little more.

