
#4630: TRANSCODE/INTO ignores destination block
================================================================================
Issue is closed, was reported by 9214 and has 2 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/4630>

**Describe the bug**
`/into` refinement usually specifies that the result should either be appended or insterted into the provided destination block. `transcode` ignores this and always returns the result as-is.

**To reproduce**
```red
>> transcode/into "a" block: [b]
== [a]
>> block
== [b]
>> head block
== [b]
```

**Expected behavior**
```red
>> transcode/into "a" block: [b]
== [b] ; or [b a] if /INTO implies APPEND
>> block
== [a b] ; or [b a]
```

**Platform version**
b0e52d4, W10.



Comments:
--------------------------------------------------------------------------------

On 2020-09-25T09:28:37Z, dockimbel, commented:
<https://github.com/red/red/issues/4630#issuecomment-698826795>

    Not implemented yet.

