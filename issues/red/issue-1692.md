
#1692: WINDOW/EXTRA field is overwritten when compiled
================================================================================
Issue is closed, was reported by rebolek and has 4 comment(s).
<https://github.com/red/red/issues/1692>

Have a look at this script:

```
Red [
    Needs: 'View
]

main: layout [text-list 100x200 data ["one" "two" "three"]]
main/extra: object [val: 0x0]
main/actors: object [
    on-resizing: func [
        face [object!]
        event [event!]
    ] [
        print type? face/extra
    ]
]

view/flags main [resize]
```

When you run in from interpreter and resize the window, it prints `object` in console as expected. However when you compile the script, it prints `float` instead (with value of 0.0).



Comments:
--------------------------------------------------------------------------------

On 2016-03-10T12:21:47Z, dockimbel, commented:
<https://github.com/red/red/issues/1692#issuecomment-194817673>

    I cannot reproduce it with the latest commit. The compiled code works fine and I only get `object` printed on screen, never `float` whatever I do with the window's size (even tried maximizing/minimizing).

--------------------------------------------------------------------------------

On 2016-03-10T13:20:53Z, rebolek, commented:
<https://github.com/red/red/issues/1692#issuecomment-194837068>

    I can confirm that it works fine now here too.

