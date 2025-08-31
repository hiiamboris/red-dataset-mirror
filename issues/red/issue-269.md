
#269: GTK+ access violation on ARM
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 14 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/269>

```
pi@raspberrypi /boot/Red $ ./hello-GTK-world

*** Runtime Error 1: access violation
*** at: 409A348Ch
```

This doesn't seem to be due to a callback. A :quit callback is set, but not called before the crash occurs.



Comments:
--------------------------------------------------------------------------------

On 2012-10-15T01:19:55Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/269#issuecomment-9430339>

    GTK-widgets shows that the crash happens somewhere halfway GTK interaction.

--------------------------------------------------------------------------------

On 2012-10-15T11:57:35Z, dockimbel, commented:
<https://github.com/red/red/issues/269#issuecomment-9442379>

    The crash is occuring inside `gtk-show-all` external call. The passed `window` argument points to a valid structure in memory, can you check if the values are right?
    
    ```
    window struct: 0x5e000
        class              : 0x55390
        reference-count    : 1
        flags              : 0
        private-flags-1    : 0x200610
        private-flags-2    : 0x3e00
        state              : 0
        saved-state        : 0x52188
        name               : 0
        style              : 0
        requested-width    : -1
        requested-height   : -1
        x                  : 1
        y                  : 1
        width              : 0
        height             : 0
        window             : 0
        parent             : 0x3000a
    ```

--------------------------------------------------------------------------------

On 2012-10-15T12:08:49Z, dockimbel, commented:
<https://github.com/red/red/issues/269#issuecomment-9442605>

    This minimal program works fine, a minimal window is opened and no crash on exit:
    
    ```
    win: as gtk-widget! gtk-new-window gtk-window-top-level
    gtk-set-container-border  as gtk-container! win  10
    g-connect-signal  as-handle win  "destroy"  as-integer :gtk-quit  none
    gtk-show-all win
    gtk-do-events
    ```

--------------------------------------------------------------------------------

On 2012-10-15T15:36:17Z, dockimbel, commented:
<https://github.com/red/red/issues/269#issuecomment-9449468>

    It seems that I have succeeded in isolating the issue (as I suspected, it's a typed function issue). The following code segfaults:
    
    ```
    print either true ["a"]["b"]
    ```
    
    while the non-typed version works:
    
    ```
    prin either true ["a"]["b"]
    ```

--------------------------------------------------------------------------------

On 2012-10-15T15:48:40Z, dockimbel, commented:
<https://github.com/red/red/issues/269#issuecomment-9449974>

    Of course, the issue is already documented in #192...Nothing we can do about it now except avoid EITHER as argument to typed functions.

--------------------------------------------------------------------------------

On 2012-10-15T15:55:30Z, dockimbel, commented:
<https://github.com/red/red/issues/269#issuecomment-9450215>

    I can't find any use of EITHER nested in an expression in the GTK binding...so it must be something else.

--------------------------------------------------------------------------------

On 2012-10-15T19:09:27Z, dockimbel, commented:
<https://github.com/red/red/issues/269#issuecomment-9457600>

    Fixed by commit [14172d5e](https://github.com/dockimbel/Red/commit/14172d5e1d1776d848547d80bed2e4cdc39139ee).

