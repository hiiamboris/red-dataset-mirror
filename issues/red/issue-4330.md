
#4330: [View] Button "focused" indicator disintegrates after unview
================================================================================
Issue is open, was reported by hiiamboris and has 6 comment(s).
[GUI]
<https://github.com/red/red/issues/4330>

**Describe the bug**

Normally when you focus a button, it's decoration changes to indicate the focused state. This works during the 1st call to `view`, but not after that.

**To reproduce**

`loop 3 [view [button focus "focused"]]`

**Expected behavior**
The decoration should be displayed on subsequent `view`s.

**Screenshots**

![](https://i.gyazo.com/7c84cbfc20a9d4e39bfd9e585d596f82.gif)

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 10-Mar-2020/16:22:26+03:00
```



Comments:
--------------------------------------------------------------------------------

On 2020-07-02T15:21:44Z, hiiamboris, commented:
<https://github.com/red/red/issues/4330#issuecomment-653070676>

    Funny, but adding `input`: `loop 3 [view [button focus "focused"] input]` removes the bug.
    And this `loop 3 [view [button focus "focused" [unview]]]` (when closed by the button, not by the "X")

--------------------------------------------------------------------------------

On 2023-02-17T19:19:38Z, luce80, commented:
<https://github.com/red/red/issues/4330#issuecomment-1435126566>

    On the same topic.
    `focus` or `set-focus` used upon opening a window works only **after** using keyboard:
    ```
    >> about
    Red 0.6.4 for Windows built 13-Feb-2023/16:56:05+01:00  commit #84ffb31
    
    view [text "close this window using mouse"]
    ; does not work also if `loop 1000000 [do-events/no-wait]` is placed here
    view [below text "close also this window" button "I am not selected" focus]
    view [text "close this window PRESSING Alt+F4" ]
    view [button "I AM selected" focus]
    ```

--------------------------------------------------------------------------------

On 2024-02-26T13:20:06Z, hiiamboris, commented:
<https://github.com/red/red/issues/4330#issuecomment-1964130005>

    Another [case](https://matrix.to/#/%23red_red%2Fgui-branch%3Agitter.im/%24tVCs4NIXS0pK6xz6w-8OAJcKIXMkf0yBlqpMc4JM748?via=tchncs.de&via=gitter.im&via=matrix.org) of focused frame disappearance - when font is customized:
    ![](https://i.gyazo.com/56299b42827e1d932aa008887107f942.gif)

