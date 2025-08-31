
#4977: [GUI console] errors out on blocks/parens within a map with highlighting on
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[type.bug]
<https://github.com/red/red/issues/4977>

**Describe the bug**

When `gui-console-ctx/terminal/color?: on`, try typing `#(a: [])` or `#(a: ())` in the input prompt. It won't let you close the map's brace and spams errors:
![](https://i.gyazo.com/c0b009f53fdf5a77bbf8cd94d0399316.gif)

Alternatively just paste any of `#(a: [])` or `#(a: ())` into it.

**Platform version**
```
Red 0.6.4 for Windows built 18-Sep-2021/18:49:23+03:00  commit #5d45a0e
```



Comments:
--------------------------------------------------------------------------------

On 2021-10-02T17:46:49Z, hiiamboris, commented:
<https://github.com/red/red/issues/4977#issuecomment-932791764>

    Related: https://github.com/red/red/issues/3852

--------------------------------------------------------------------------------

On 2021-10-10T03:46:49Z, qtxie, commented:
<https://github.com/red/red/issues/4977#issuecomment-939400777>

    Is it fixed in the latest Red? I cannot reproduce it.

--------------------------------------------------------------------------------

On 2021-10-10T12:58:36Z, hiiamboris, commented:
<https://github.com/red/red/issues/4977#issuecomment-939478070>

    Yes, seems like one of Nenad's recent commits fixed it.

