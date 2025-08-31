
#1096: Cannot use `either` in more than two OP!s
================================================================================
Issue is closed, was reported by qtxie and has 6 comment(s).
[Red/System] [status.wontfix]
<https://github.com/red/red/issues/1096>

```
Red/System []

a: 1
n1: 0 and 0 or either a = 1 [6][8]
n2: 1 + 2 + (either a = 1 [6][8])
n3: 1 + either a = 1 [6][8]
?? n1
?? n2
?? n3
```

Will output:

```
n1: 1638272              ;-- should be 6
n2: 3                    ;-- should be 9
n3: 7                    ;-- correct
```



Comments:
--------------------------------------------------------------------------------

On 2021-09-18T16:36:54Z, dockimbel, commented:
<https://github.com/red/red/issues/1096#issuecomment-922337028>

    Nested `either` inside expressions are officially not supported.

--------------------------------------------------------------------------------

On 2021-09-18T16:53:54Z, hiiamboris, commented:
<https://github.com/red/red/issues/1096#issuecomment-922339079>

    @dockimbel please add a compiler error in this case ;)

--------------------------------------------------------------------------------

On 2022-09-05T19:47:21Z, dockimbel, commented:
<https://github.com/red/red/issues/1096#issuecomment-1237419545>

    Error check added.

