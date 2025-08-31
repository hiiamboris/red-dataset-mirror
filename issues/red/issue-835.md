
#835: Append of unset value adds text 'unset' at the end.
================================================================================
Issue is closed, was reported by Oldes and has 2 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/835>

```
red>> a: "123"
== "123"
red>> append a boo
*** Error: word has no value!
== "123unset"
```



Comments:
--------------------------------------------------------------------------------

On 2014-06-17T06:05:21Z, dockimbel, commented:
<https://github.com/red/red/issues/835#issuecomment-46270458>

    `append` does what it is supposed to do. The issue is that we don't have yet true error support, so errors are not blocking the code execution, they are just _informative_, that is why you get the series modified. This will not happen anymore when error support will be implemented.

