
#3822: [View] `modal` flag doesn't work with layered windows
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
[GUI] [GUI.Win7]
<https://github.com/red/red/issues/3822>

**Describe the bug**

`view/flags ... [modal]` should make the window block all other opened windows. The blocking doesn't work on windows that contain a non-opaque `base`.

**To reproduce**

Try the following script:
```
view [
  base 255.0.0.100 on-down [
    view/flags/options [
      base 0.255.0.100 on-down [unview]
    ] [modal no-border] [offset: random 500x300]
  ]
]
```
Click on the red base to spawn any amount of green bases.
Green bases are `modal` and should block further events, but they do not. When the color given to the initial base is opaque, it'll work - only one window can be spawned at any time:
```
view [
  base red on-down [
    view/flags/options [
      base 0.255.0.100 on-down [unview]
    ] [modal no-border] [offset: random 500x300]
  ]
]
```

**Expected behavior**

Proper blocking of the 1st window by the 2nd.


**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 13-Mar-2019/6:42:17+03:00 commit #0af69a5
Windows 7 x64
```



Comments:
--------------------------------------------------------------------------------

On 2019-03-27T17:02:30Z, greggirwin, commented:
<https://github.com/red/red/issues/3822#issuecomment-477256002>

    This works correctly on Win10, so it appears to be a Win7 issue. 
    
    Thanks for the clear ticket write-up and example.

--------------------------------------------------------------------------------

On 2020-02-26T15:47:02Z, hiiamboris, commented:
<https://github.com/red/red/issues/3822#issuecomment-591494684>

    Another issue here is that after closing the *last opened* child (green) window, modal or normal, the parent window ignores the next click it gets - whether I click the red base or try to close the window, I have to click twice.

