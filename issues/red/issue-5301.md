
#5301: Extremely slow `help` output on bigger data
================================================================================
Issue is closed, was reported by hiiamboris and has 16 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5301>

**Describe the bug**

```
>> system/console/size
== 93x46

>> append/dup b: [] pi 100000
== [3.141592653589793 3.141592653589793 3.141592653589793 3.141592653589793 3.14159265358...

>> clock [mold/part b system/console/size/x]
0.0 μs  [mold/part b system/console/size/x]
== {[3.141592653589793 3.141592653589793 3.141592653589793 3.141592653589793 3.1415926535...

>> clock/times [mold/part b system/console/size/x] 1e5
19.7 μs [mold/part b system/console/size/x]
== {[3.141592653589793 3.141592653589793 3.141592653589793 3.141592653589793 3.1415926535...

>> clock [? b]
B is a block! value.  length: 100000  [3.141592653589793 3.141592653589793 3.141592653589...

347 ms  [? b]
```
That's 17600x slowdown compared to `mold`.

**To reproduce**
```
system/console/size
append/dup b: [] pi 100000
clock [mold/part b system/console/size/x]
clock [? b]
```

**Expected behavior**

Reasonable output time.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4629 date: 28-Jan-2023/11:28:13 commit: #ec0c31279023590e285fb2e1869380670ee0239f ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-04-01T18:35:12Z, greggirwin, commented:
<https://github.com/red/red/issues/5301#issuecomment-1493069558>

    The crux of the matter being that `mold` is slow on large data, and we should use `mold/part` based on console width? I had to dig in to be sure it wasn't something else in `help`, but that looks like it.

--------------------------------------------------------------------------------

On 2023-04-01T18:37:30Z, greggirwin, commented:
<https://github.com/red/red/issues/5301#issuecomment-1493070256>

    The issue is that the outer part of formatting catches it, but block formatting has an inner part for the block contents that doesn't.

--------------------------------------------------------------------------------

On 2023-04-01T18:41:45Z, dockimbel, commented:
<https://github.com/red/red/issues/5301#issuecomment-1493072811>

    ```
    >> clock [help-ctx/form-value b]
    124 ms	[help-ctx/form-value b]
    ```

--------------------------------------------------------------------------------

On 2023-04-01T18:44:51Z, greggirwin, commented:
<https://github.com/red/red/issues/5301#issuecomment-1493073342>

    Fix is in, but there's another line change from old func-attr change some time back. :^\

--------------------------------------------------------------------------------

On 2023-04-01T18:49:42Z, greggirwin, commented:
<https://github.com/red/red/issues/5301#issuecomment-1493074189>

    Looks like that was never PR'd. :^\

--------------------------------------------------------------------------------

On 2023-04-01T18:51:42Z, greggirwin, commented:
<https://github.com/red/red/issues/5301#issuecomment-1493074513>

    Nvm. It was and I am out of sync here.

--------------------------------------------------------------------------------

On 2023-04-01T18:57:45Z, greggirwin, commented:
<https://github.com/red/red/issues/5301#issuecomment-1493075690>

    https://github.com/red/red/pull/5302

--------------------------------------------------------------------------------

On 2023-04-01T18:59:58Z, greggirwin, commented:
<https://github.com/red/red/issues/5301#issuecomment-1493076403>

    After the fix:
    ```
    0.0 μs	[mold/part b system/console/size/x]
    B is a block! value.  length: 100000  [3.141592653589793 3.141592653589793 3.141592653589793 3.141592653589793 3.141592653589793 ...
    
    6.97 ms	[? b]
    ```

