
#2135: Printing of float values with high exponent is broken
================================================================================
Issue is closed, was reported by dockimbel and has 14 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/2135>

```
Red/System []

probe 1.836E13
```

gives

```
1.836e+013.0
```



Comments:
--------------------------------------------------------------------------------

On 2016-07-27T11:53:10Z, dockimbel, commented:
<https://github.com/red/red/issues/2135#issuecomment-235563421>

    The culprit is a wrong `printf` format string [here](https://github.com/red/red/blob/master/system/runtime/libc.reds#L171).

--------------------------------------------------------------------------------

On 2016-07-27T16:31:00Z, greggirwin, commented:
<https://github.com/red/red/issues/2135#issuecomment-235642233>

    Does `printf ["%g" n]` do what you want? i.e. `1.836e+013`

--------------------------------------------------------------------------------

On 2016-07-27T16:34:13Z, greggirwin, commented:
<https://github.com/red/red/issues/2135#issuecomment-235643191>

    Looks like the 2 vs 3 E digits may vary by platform. 

--------------------------------------------------------------------------------

On 2016-07-28T09:10:36Z, dockimbel, commented:
<https://github.com/red/red/issues/2135#issuecomment-235841616>

    @greggirwin If you remove the `.0` part, then printing a rounded float will look like an integer, it will not have the tail `.0` anymore.

--------------------------------------------------------------------------------

On 2016-07-28T17:31:32Z, greggirwin, commented:
<https://github.com/red/red/issues/2135#issuecomment-235966583>

    I wasn't sure exactly what you wanted, since you only said "it's broken". Your digit has the decimal, so I guess I'm not clear why the exponent needs it. No coffee yet this morning. :^)

--------------------------------------------------------------------------------

On 2016-07-29T09:58:54Z, dockimbel, commented:
<https://github.com/red/red/issues/2135#issuecomment-236142181>

    We should not have the `.0` for the exponent, but if you remove ".0" from the formatting string, you're then breaking the rounded floats formatting.
    Currently:
    
    ```
    probe 1.836E13
    1.836e+013.0               ;-- incorrect
    
    probe 1.0
    1.0                        ;-- correct
    ```
    
    If you remove the ".0" from the formatting string, you'll get:
    
    ```
    probe 1.836E13
    1.836e+013               ;-- correct
    
    probe 1.0
    1                        ;-- incorrect
    ```

--------------------------------------------------------------------------------

On 2016-07-29T14:27:05Z, greggirwin, commented:
<https://github.com/red/red/issues/2135#issuecomment-236194817>

    Ah, I see. Without printing to a buffer and post-processing, I'm not finding a quick solution. 
    
    ```
    printf ["%#g" 1.836E13]     ;== 1.83600e+013
    printf ["%#g" 1.0]          ;== 1.00000     
    ```
    
    As soon as you spec a width/precision, it rounds (not what I expected). Well, it does anyway, with a default of 6. 

