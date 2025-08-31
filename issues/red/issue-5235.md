
#5235: Past-tail series access in new-line natives
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5235>

**Describe the bug**

Both `new-line?` and `new-line` do not check for series/tail and freely read/write past it. As a result `new-line?` may report arbitrary values at block's tail. `new-line` doesn't cause any memory corruption only because each series buffer is padded with 4 bytes right now.

**To reproduce**
```
>> b: copy/deep append/dup/only [] [] 1000'000
== [[] [] [] [] [] [] [] [] [] [] [] [] [] [] [] [] [] [] [] [] [] [] [] [] [] [] [...
>> n: 0 foreach x b [if new-line? x [n: n + 1]] n
== 5264
```

**Expected behavior**

No memory access past tail.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4559 date: 31-Oct-2022/7:53:59 commit: #4a12602b221e0d636b41614d7f91a25f9996a683 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2022-10-31T13:40:26Z, dockimbel, commented:
<https://github.com/red/red/issues/5235#issuecomment-1297108291>

    I can only reproduce it in the GUI console.
    ```
    b: copy/deep append/dup/only [] [] 1'000'000
    n: 0 foreach x b [if new-line? x [n: n + 1]] n
    ```

