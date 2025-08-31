
#4261: GTK: crash with styles, custom font and appending field to pane.
================================================================================
Issue is closed, was reported by loziniak and has 10 comment(s).
[type.bug] [GUI] [GUI.GTK]
<https://github.com/red/red/issues/4261>

([Gitter message](https://gitter.im/red/GTK?at=5e2ae54b01914e3e043daaf0))
This crashes at the button click on Linux/GTK, when run from console-view or compiled with `-r`:
```
Red [Needs: 'View]

metrics-font: make font! []

styles: [
    panel-widget: [
        default-actor: on-down
        template: [
            type: 'panel
            pane: copy [] 
            actors: [
                on-create: func [face [object!] event [event! none!]] [
                    append face/pane make face! [
                        type: 'field
                        font: (metrics-font)
                        parent: face
                    ]
                ]
            ]
        ]
    ]

]

window: layout/styles [
    panel [
        panel-widget
        button "CLICK ME" [
            print "OK?"
            make metrics-font [style: 'bold]
            print "OK!"
        ]
    ]
] styles

view/flags window ['resize]
```

I get various error messages. The ones I noticed were:
```
free(): invalid pointer
[1]    5197 abort (core dumped) 

munmap_chunk(): invalid pointer
[1]    5138 abort (core dumped)

double free or corruption (out)
[1]    5270 abort (core dumped)

*** Runtime Error 1: access violation
*** Cannot determine source file/line info.
***
```

**Platform version**
```
Red 0.6.4 for Linux built 23-Jan-2020/16:19:08+01:00 (GTK branch)
```



Comments:
--------------------------------------------------------------------------------

On 2020-01-30T02:10:42Z, bitbegin, commented:
<https://github.com/red/red/issues/4261#issuecomment-580051859>

    https://github.com/red/red/issues/4227

--------------------------------------------------------------------------------

On 2020-01-30T10:40:51Z, 9214, commented:
<https://github.com/red/red/issues/4261#issuecomment-580193269>

    90% of the code is not related to the issue at hand.
    
    ```red
    view/no-wait [f: field font-size 1] make f/font [size: 1]
    ```

--------------------------------------------------------------------------------

On 2020-09-14T09:33:55Z, bitbegin, commented:
<https://github.com/red/red/issues/4261#issuecomment-691939380>

    you need use `make font` like this: `make f/font [state: none size: 1]`, because two font! use one font handle! in font/state, the new font copy the old font's state. 
    
    when the new one release the handle, the old font don't known, and it also release it, it will lead to unpredictable results.
    
    
    

--------------------------------------------------------------------------------

On 2020-09-14T09:41:44Z, bitbegin, commented:
<https://github.com/red/red/issues/4261#issuecomment-691943096>

    processing flow:
    
    1. `make f/font [size: 1]`, copy the state of the old font to new font (notes: new one will have a copy of handle!)
    2. the `make font!` spec not empty, so it will trigger `on-change*`, then call `system/view/platform/update-font`
    3. that is `update-font` in `font.reds`, so first release the copy of handle!, then replace it with a new one
    4. then notify the parent face to change-font
    5. in `change-font`, the old font's handle! also will be released, then replace it with a new one.

--------------------------------------------------------------------------------

On 2020-09-15T02:40:09Z, bitbegin, commented:
<https://github.com/red/red/issues/4261#issuecomment-692427227>

    another case `view [x: button "x" font-size 15 y: button "y" font x/font [y/font/size: y/font/size + 1]]`, but can't bypass it using `state: none`.

