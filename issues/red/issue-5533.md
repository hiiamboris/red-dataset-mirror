
#5533: Tired of tripping on set-words coming from the map!
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.design]
<https://github.com/red/red/issues/5533>

**Describe the bug**

`map!` does not distinguish `any-word!` key type, treats all types in the typeset equally.
When we write `map/key: value` we mean that `key` is a `word!`, same as if we write `obj/key: value`.

*We think of key as word* regardless of how it's stored internally.

And keys are reported as words as well:
```
>> keys-of m
== [a c]
```

However certain Red facilities turn all word-type keys into `set-word!`s, namely:
```
>> to [] m
== [
    a: b 
    c: d
]
>> body-of m
== [
    a: b 
    c: d
]
>> foreach [k v] m [?? k]
k: a:
k: c:
```
I understand the block conversion is just a kludge for `mold`, similar to https://github.com/red/red/issues/5140
However `foreach` behavior has no justification IMO.

In any case, it's been probably over 10 times already that I've tripped over the error of passing the key to a function that accepts a `word!` or wrongly constructing some data that's supposed to have `word!`s, while the key became a `set-word!`.

**Expected behavior**

I ask that we reconsider this behavior and report the key as it is intuitively thought of - as a `word!`, in all scenarios.

**Platform version**
```
Red 0.6.5 for Windows built 2-Jul-2024/1:21:21+08:00  commit #bbecb7e
```


Comments:
--------------------------------------------------------------------------------

On 2024-08-09T10:34:05Z, dockimbel, commented:
<https://github.com/red/red/issues/5533#issuecomment-2277652506>

    I agree that `foreach` should be consistent with `keys-of` in that context.

