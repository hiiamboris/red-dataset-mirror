
#5535: [Compiler] `return` escapes `try/all`
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.built] [status.tested] [type.bug] [test.written] [type.compiler]
<https://github.com/red/red/issues/5535>

**Describe the bug**

https://github.com/red/red/commit/09d5aa3e2bdf9a43f5a3d2d1ec54a1a970059ac3#commitcomment-145380888
When compiled, `return` escapes the `try/all` block. The bug is abused in the current `attempt` implementation.

**To reproduce**

1. Compile and run this script without `-e`:
```
Red []

f: does [try/all [return 1] 2]
probe f
do [
	f: does [try/all [return 1] 2]
	probe f
]
```
2. Output is:
```
1
2
```

**Expected behavior**

```
1
1
```

**Platform version**
`Red 0.6.5 for Windows built 2-Jul-2024/1:21:21+08:00  commit #bbecb7e`


Comments:
--------------------------------------------------------------------------------

On 2024-08-14T17:31:08Z, hiiamboris, commented:
<https://github.com/red/red/issues/5535#issuecomment-2289409920>

    A correct `attempt` implementation is PRed here: https://github.com/red/red/pull/5536

--------------------------------------------------------------------------------

On 2024-10-03T16:53:40Z, dockimbel, commented:
<https://github.com/red/red/issues/5535#issuecomment-2391887029>

    @hiiamboris The expected output should be
    ```
    2
    2
    ```
    right?

--------------------------------------------------------------------------------

On 2024-10-03T17:00:27Z, hiiamboris, commented:
<https://github.com/red/red/issues/5535#issuecomment-2391900131>

    Oh right, my mistake 😅

