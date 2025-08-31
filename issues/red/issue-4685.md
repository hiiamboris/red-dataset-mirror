
#4685: GUI-Console crash when using help for system/words
================================================================================
Issue is closed, was reported by litew and has 6 comment(s).
[status.built] [status.tested] [type.bug] [type.GC]
<https://github.com/red/red/issues/4685>

**Describe the bug**
Red console crashes when trying to use help with system/words keywords.

**To reproduce**
Steps to reproduce the behavior:
1. Run red console with `red`.
2. Type `? system/words`
3. Program crashes with following output:

```
*** Runtime Error 1: access violation
*** at: 0000000Fh
```

**Expected behavior**
List of words used in Red.

**Platform version**
OS: Fedora 32 x86_64
Red:
```
Red 0.6.4 for Linux built 16-Oct-2020/21:35:47+03:00 commit #df54dcdf65cdf9dd37590225ac51aaedcd065f9a
```


Comments:
--------------------------------------------------------------------------------

On 2020-10-19T02:16:31Z, bitbegin, commented:
<https://github.com/red/red/issues/4685#issuecomment-711471826>

    after `recycle/off`, it runs ok

--------------------------------------------------------------------------------

On 2020-10-19T02:25:42Z, bitbegin, commented:
<https://github.com/red/red/issues/4685#issuecomment-711474149>

    windows platform just not easy to reproduce, but still exists this issue. you can use `loop 100 [? system/words]` to reproduce

--------------------------------------------------------------------------------

On 2020-10-19T02:48:48Z, litew, commented:
<https://github.com/red/red/issues/4685#issuecomment-711480298>

    > after `recycle/off`, it runs ok
    
    Indeed, works for me too.

