
#2442: Cannot deviate output of help and source
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/2442>

I am trying to  capture the result of evaluating a Red source into a text area by redefining prin and print. This works fine for normal Red values, but curiously, the output of `help`  and `source` are alway going to the console.


Comments:
--------------------------------------------------------------------------------

On 2017-02-19T10:19:36Z, meijeru, commented:
<https://github.com/red/red/issues/2442#issuecomment-280909359>

    Striking example of this:
    ```
    red>> print: none
    == none
    red>> help print
    print is a none! of value: none 
    ```
    If you look at `source help`, the `help` function itself uses `print`, so how come?!?

--------------------------------------------------------------------------------

On 2017-02-20T15:35:48Z, dockimbel, commented:
<https://github.com/red/red/issues/2442#issuecomment-281109956>

    `help` and `source` are compiled function, changing `print` word binding will not affect them as their compiled code calls `natives/print*` directly. This is actually a good thing, as it keeps the console working if the user messes up some core global words (which would need to be *protected* anyway from accidental changes).
    
    In case you need to redefine those compiled function, so that they take such core words changes into account, you can use this way (using `probe` for example):
    ```
    print: none
    probe: func spec-of :probe body-of :probe
    
    red>> probe 123
    == 123
    ```
    This redefinition will force the reconstruction of the function dropping the compiled code and switching to an interpreted version.

--------------------------------------------------------------------------------

On 2017-02-20T16:44:56Z, meijeru, commented:
<https://github.com/red/red/issues/2442#issuecomment-281127843>

    Thanks for the explanation!

