
#4742: [GUI Console] can be affected by `prin`
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [GUI]
<https://github.com/red/red/issues/4742>

**Describe the bug**

<img width="400" src="https://i.gyazo.com/aed62da47e574927e6ef35b33094d92c.gif">

**To reproduce**

`view/no-wait [button "CLICK" [prin "[^/" unview]]`
or a more real-world example, save & run this file (for some reason it won't glitch if pasted directly into console):
`Red [] view/no-wait [button "CLICK" [x: load "[^/1^/]" ?? x unview]]`

**Expected behavior**

Console prompt shouldn't be affected by printing.

**Platform version**
```
Red 0.6.4 for Windows built 11-Nov-2020/5:05:03+03:00 commit #738c45d
```



Comments:
--------------------------------------------------------------------------------

On 2020-12-04T12:25:33Z, hiiamboris, commented:
<https://github.com/red/red/issues/4742#issuecomment-738756493>

    thanks!

