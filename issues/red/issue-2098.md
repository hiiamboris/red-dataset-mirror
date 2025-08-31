
#2098: Using `unview` in `on-close` handler crashes the console
================================================================================
Issue is closed, was reported by ghost and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2098>

Sample Code ([July 6, 2016 10:43 AM](https://gitter.im/red/red?at=577c9381ddcdcee623faae3d))-

```
view/options [
    size 300x200
    title "Main window"
    button "Opens a second window" [
        view/no-wait [
            size 200x100
            title "Sub window"
            button "Back to main" [unview]
        ]
    ]
][actors: object [on-close: func [face event][unview]]]
```

With GUI-Console, compiled in debug mode (On closing the main window, this is the error produced) ->

```
*** Runtime Error 1: access violation
*** Cannot determine source file/line info.
***
```

Minimal code to reproduce issue - 

```
view/options [
 ][actors: object [on-close: func [face event][unview]]]
```



Comments:
--------------------------------------------------------------------------------

On 2017-02-20T13:57:05Z, qtxie, commented:
<https://github.com/red/red/issues/2098#issuecomment-281085592>

    Fixed by this commit: 3dad71e33f084496fa86219db07c5aba67c94c4d

