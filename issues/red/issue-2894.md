
#2894: HELP on object doesn't include value type in output
================================================================================
Issue is closed, was reported by greggirwin and has 2 comment(s).
<https://github.com/red/red/issues/2894>

e.g.,
```
>> ? o
O is an object of value:
...
```
via Oldes.


Comments:
--------------------------------------------------------------------------------

On 2018-03-14T02:14:39Z, greggirwin, commented:
<https://github.com/red/red/issues/2894#issuecomment-372881759>

    In testing, I think this was addressed some time back, but this ticket wasn't closed.
    
    ```
    >> o: object [a: 1]
    == make object! [
        a: 1
    ]
    >> ? o
         a  integer!      1
    
    >> ? face!
         type             word!         face
         offset           none!         none
         size             none!         none
         text             none!         none
         image            none!         none
         color            none!         none
         menu             none!         none
         data             none!         none
         enabled?         logic!        true
         visible?         logic!        true
         selected         none!         none
         flags            none!         none
         options          none!         none
         parent           none!         none
         pane             none!         none
         state            none!         none
         rate             none!         none
         edge             none!         none
         para             none!         none
         font             none!         none
         actors           none!         none
         extra            none!         none
         draw             none!         none
         on-change*       function!     [word old new /local srs same-pane? f saved]
         on-deep-change*  function!     [owner word target action new index part]
    ```

