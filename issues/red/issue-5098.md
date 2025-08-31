
#5098: [Regression] `#do` won't set words anymore
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5098>

**Describe the bug**
```
Red [] #do [abcd: 1]
```
this script used to work in commit `bfbcd8b` (23 Feb 2022) but not in latest builds
Now it says:
```
*** Script Error: PARSE - matching by datatype not supported for any-string! input
*** Where: parse
*** Near : none
*** Stack: expand-directives expand do-code
```

**To reproduce**

Run the script from console

**Platform version**
```
Red 0.6.4 for Windows built 8-Mar-2022/16:50:52
```



Comments:
--------------------------------------------------------------------------------

On 2022-03-08T17:57:08Z, hiiamboris, commented:
<https://github.com/red/red/issues/5098#issuecomment-1062050520>

    [`a388937cff7d3e543eebe3170a2abb19a0ff1443 is the first bad commit`](https://github.com/red/red/commit/a388937cff7d3e543eebe3170a2abb19a0ff1443)

