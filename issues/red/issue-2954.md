
#2954: Set window title?
================================================================================
Issue is closed, was reported by DeadNumbers and has 6 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/2954>

```Red
Red [
        Title: "Test title"
        Needs: View
    ]

view[
        text "Input some text: " right 350 field return
        button "ok" button "cancel"
]
```

And instead of the title `Test title` we can see `Red: untitled` 


![_2017-08-01_17-25-32](https://user-images.githubusercontent.com/9416005/28830289-fae873ce-76de-11e7-958f-6568103ef8d1.png)

But we can see `Test title` on About file 
![_2017-08-01_17-26-07](https://user-images.githubusercontent.com/9416005/28830318-0d024de6-76df-11e7-853a-d5f95d190951.png)

So, how I can set window title on Windows? Also, keyword [Title:"Some title"] work on OS X?


Comments:
--------------------------------------------------------------------------------

On 2017-08-01T15:48:48Z, geekyi, commented:
<https://github.com/red/red/issues/2954#issuecomment-319411966>

    https://doc.red-lang.org/en/vid.html#_title
    ```red
    view[
        title "title"
        size 200x100
    ]
    ```

--------------------------------------------------------------------------------

On 2017-08-01T15:54:48Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2954#issuecomment-319413765>

    This is not a bug. If you can't get something to work, please try asking in either the [Red Russian Room](https://gitter.im/red/Russian) or the [Red Help Room](https://gitter.im/red/help).

--------------------------------------------------------------------------------

On 2017-08-01T17:02:12Z, dockimbel, commented:
<https://github.com/red/red/issues/2954#issuecomment-319432822>

    Extracting the title from the header to be used for the window is not yet supported, but it will in a future release.

