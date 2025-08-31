
#5610: WISH: reorder back the `bad-path-type` error
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/5610>

**Describe the bug**

Until recently we had this nice rule that all path-related script errors have their path as `error/arg1`:
```
>> ?? system/catalog/errors/script/unset-path
system/catalog/errors/script/unset-path: [:arg2 "is unset in path" :arg1]
>> ?? system/catalog/errors/script/invalid-path
system/catalog/errors/script/invalid-path: ["cannot access" :arg2 "in path" :arg1]
>> ?? system/catalog/errors/script/bad-path-type
system/catalog/errors/script/bad-path-type: ["path" :arg1 "is not valid for" :arg2 "type"]
>> ?? system/catalog/errors/script/bad-path-type2
system/catalog/errors/script/bad-path-type2: ["path element >" :arg1 "< does not apply to" :arg2 "type"]
```
But some recent commit broke that for `bad-path-type`:
```
>> ?? system/catalog/errors/script/bad-path-type
system/catalog/errors/script/bad-path-type: [:arg1 "returned a" :arg2 "value, so" :arg3 "could not be accessed"]
```
And now I need a special case for it in `sift` and `locate` code.

**To reproduce**

`?? system/catalog/errors/script/bad-path-type`

**Expected behavior**

I'd like `arg1` to be the path again, and `arg3` could be the returned value.

**Platform version**

`Red 0.6.6 for Windows built 16-Apr-2025/6:37:25+08:00  commit #b10fa54`


Comments:
--------------------------------------------------------------------------------

On 2025-04-16T09:59:43Z, dockimbel, commented:
<https://github.com/red/red/issues/5610#issuecomment-2809055893>

    Trivial change, will do.

