
#4719: ARM emitter silently ignores float+integer mixed arithmetic
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.built] [type.wish] [status.resolved] [Red/System]
<https://github.com/red/red/issues/4719>

**Describe the bug**

Given two almost identical scripts:
`1.red`:
```
Red/System []

f: 5.0
loop 10 [
	f: f - 1
	probe f
]
```
and `2.red`:
```
Red/System []

f: 5.0
loop 10 [
	f: f - 1.0
	probe f
]
```

---
The result of `1.red` is:
- on ARM:
```
5.0
5.0
5.0
5.0
5.0
5.0
5.0
5.0
5.0
5.0
```
On IA32:
```
4.0
3.0
2.0
1.0
0.0
-1.0
-2.0
-3.0
-4.0
-5.0
```

The result of `2.red` is the same on both CPUs:
```
4.0
3.0
2.0
1.0
0.0
-1.0
-2.0
-3.0
-4.0
-5.0
```

**Expected behavior**

For all platforms:
```
4.0
3.0
2.0
1.0
0.0
-1.0
-2.0
-3.0
-4.0
-5.0
```

**Platform version**

```
Red 0.6.4 for Windows built 16-Oct-2020/12:58:41+03:00 commit #e5876af
```



Comments:
--------------------------------------------------------------------------------

On 2020-11-11T11:37:27Z, hiiamboris, commented:
<https://github.com/red/red/issues/4719#issuecomment-725374211>

    I think the logic is flawed here:
    https://github.com/red/red/blob/738c45d5ca412950325d2e00e0c08392777ad603/system/targets/ARM.r#L2527-L2531
    and here:
    https://github.com/red/red/blob/738c45d5ca412950325d2e00e0c08392777ad603/system/targets/ARM.r#L2575-L2592
    
    I think it stores `1` (32 bit integer) in 32-bit register but forgets about it and uses the 64-bit register (uninitialized) to do the math.

--------------------------------------------------------------------------------

On 2020-11-11T13:37:00Z, dockimbel, commented:
<https://github.com/red/red/issues/4719#issuecomment-725427161>

    Implicit type casting in mixed float/int math is not an officially supported feature. From https://static.red-lang.org/red-system-specs.html#section-4.3.3, "_Both operands need to be of float! types (no implicit casting)._"
    

--------------------------------------------------------------------------------

On 2020-11-11T14:44:50Z, hiiamboris, commented:
<https://github.com/red/red/issues/4719#issuecomment-725463147>

    In that case the compiler should warn the user ;)

