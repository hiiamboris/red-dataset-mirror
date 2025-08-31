
#1679: Empty switch blocks won't compile
================================================================================
Issue is closed, was reported by WiseGenius and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1679>

```
switch 1 []
```

When interpreted, the above returns `none` as it does in Rebol 2 and Rebol 3, but when compiled:

```
*** Compilation Error: wrong syntax in SWITCH block at: default 0
*** in file: %environment/codecs/gif.red
*** at line: 1
*** near: [[default [0]]
    stack/unwind
    stack/reset
    block/push get-root 548
    stack/reset
    stack/mark-func
]
```

Another example:

```
switch/default 1 [
][
    print {This is the default behaviour.}
]
```

When interpreted, this prints `This is the default behaviour.` as it does in Rebol 2 and Rebol 3, but when compiled:

```
*** Compilation Error: wrong syntax in SWITCH block at: default stack/reset unset/push
*** in file: %environment/codecs/gif.red
*** at line: 1
*** near: [[default [
            stack/reset
            unset/push
        ]]
    stack/unwind
    stack/reset
    block/push get-root 547
    stack/check-call
]
```



Comments:
--------------------------------------------------------------------------------

On 2016-03-17T14:40:34Z, dockimbel, commented:
<https://github.com/red/red/issues/1679#issuecomment-197908255>

    `switch` needs some fixes anyway, as it needs to also support multiple keys.

