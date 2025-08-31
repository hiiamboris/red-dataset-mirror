
#3927: Parse infinite loop using Some
================================================================================
Issue is closed, was reported by endo64 and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/3927>

**Describe the bug**

`parse` cannot detect input does not advance in some cases when `some` and `any` used.

Here is the discussion: [Gitter](https://gitter.im/red/parse?at=5d1485adf040bc5fb6d4750e)

**To reproduce**

```
parse "bx" [some [not "b" | skip]]
```

**Expected behavior**
No infinite loop.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 13-Jun-2019/18:35:36+03:00 commit #10454ca
```



