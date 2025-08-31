
#4757: Halt from within a view
================================================================================
Issue is closed, was reported by zwortex and has 4 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/4757>

Halt from within a view opened from the gui console triggers an error and does not return to the input prompt.

```
view [
    b: button "The Button" [ halt ]
]
```

gives the error :

```
*** Throw Error: no catch for throw: halt-request
*** Where: =
*** Stack: view do-events do-actor do-safe halt
```

The same in Rebol2 returns to the input prompt.

```
In Rebol 2 :
view layout [
    b: button "The Button" [ halt ]
]
```


Comments:
--------------------------------------------------------------------------------

On 2020-12-13T10:28:37Z, dockimbel, commented:
<https://github.com/red/red/issues/4757#issuecomment-743984905>

    A fix has been pushed on a development branch, as it needs to be implemented for other platforms (only Windows for now). Also, exiting the event loop that way should activate the (GUI) console window and show the blinking cursor.

--------------------------------------------------------------------------------

On 2020-12-14T19:34:10Z, dockimbel, commented:
<https://github.com/red/red/issues/4757#issuecomment-744662557>

    This new fix supersedes the previous one.

