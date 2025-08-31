
#2361: script's preface evaluation with a <do %file> in console
================================================================================
Issue is closed, was reported by 9214 and has 2 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/2361>

``` Red
text that appears before the header is called the preface and is ignored during evaluation

Red []

42
```
`>> do %file` on a script above results in:
```
*** Script Error: text has no value
*** Where: do
```



Comments:
--------------------------------------------------------------------------------

On 2017-02-16T15:52:09Z, dockimbel, commented:
<https://github.com/red/red/issues/2361#issuecomment-280369480>

    Now `do %file` will skip the content until a `Red` word is found.

