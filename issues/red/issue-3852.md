
#3852: [GUI Console] cannot process `'/` when highlighting is on
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/3852>

**Describe the bug**

Console syntax highlighting code can't process the `'/` character combo.

**To reproduce**

- Run the GUI console
- Set `gui-console-ctx/terminal/color?: yes`
- Type `'/`

Everything disappears (even retrospectively - if `'/` was typed before the `color?: yes`). Alt-Tabbing around makes it show the error:
```
*** Script Error: cannot MAKE/TO word! from: 0
*** Where: to
*** Stack: ask do-events do-actor do-safe to-word
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 13-Apr-2019/9:27:16+03:00 commit #fb18d4e
```



Comments:
--------------------------------------------------------------------------------

On 2019-04-19T19:59:01Z, greggirwin, commented:
<https://github.com/red/red/issues/3852#issuecomment-484999862>

    Confirmed on Win10 here.

