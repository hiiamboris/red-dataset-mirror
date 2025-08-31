
#5181: [Regression] CRASH during mold of copied image slice
================================================================================
Issue is closed, was reported by hiiamboris and has 8 comment(s).
[status.built] [type.bug] [test.written] [GUI]
<https://github.com/red/red/issues/5181>

**Describe the bug**

Regressed after D2D merge.
```
>> i: make image! 4x4
>> copy i
== make image! [4x4 #{
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    }]
>> copy next i

*** Runtime Error 1: access violation
*** in file: /d/devel/red/red-src/master/runtime/platform/image-wic.reds
*** at line: 543
***
***   stack: red/OS-image/lock-bitmap 04A8D81Ch false
***   stack: red/image/serialize 04A8D81Ch 04A8D82Ch false false false 04A8D82Ch 179 1
***   stack: red/image/mold 04A8D81Ch 04A8D82Ch false false false 04A8D82Ch 194 0
***   stack: red/actions/mold 04A8D81Ch 04A8D82Ch false false false 04A8D82Ch 194 0
***   stack: red/actions/mold* -1 -1 -1 1
***   stack: ctx||600~do-command 04A00E70h
***   stack: ctx||600~eval-command 04A00E70h
***   stack: ctx||600~run 04A00E70h
***   stack: ctx||600~launch 04A00E70h
***   stack: ctx||619~launch 04A00880h
```

**To reproduce**

`probe copy next make image! 4x4`

**Expected behavior**

A 2D part of image copied (until `image/size`). With `/part pair!` - until part (intersection can be negative, which should still produce a valid image (`min xy1 xy2` to `max xy1 xy2`)). 

**Platform version**
```
broken between red-20dec20-7a6d9a9fe.exe and red-28jan21-bae0c3400.exe
```



Comments:
--------------------------------------------------------------------------------

On 2022-08-20T10:28:02Z, hiiamboris, commented:
<https://github.com/red/red/issues/5181#issuecomment-1221274292>

    Actually, it was a mess in pre-D2D builds too.
    ```
    >> about
    Red 0.6.4 for Windows built 20-Dec-2020/21:04:56+03:00 commit #7a6d9a9
    >> i: make image! 4x4
    == make image! [4x4 #{
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF...
    >> i2: copy at i 2x2
    == make image! [4x2 #{}]
    ```
    How is `i2` empty? And the size 4x2 implies scanline extraction, which is hardly useful for images.
    
    Proper fix for this issue prompts 2D support for other actions as well, e.g. `change` (overlay), `remove` (background-fill). Not sure it's worth supporting these over `draw` way. But if not, they should be forbidden then rather than produce an invalid unexpected result.

--------------------------------------------------------------------------------

On 2022-08-20T18:20:43Z, hiiamboris, commented:
<https://github.com/red/red/issues/5181#issuecomment-1221380673>

    How R2 handled it http://www.rebol.com/docs/image.html#section-1

--------------------------------------------------------------------------------

On 2022-08-24T03:45:45Z, qtxie, commented:
<https://github.com/red/red/issues/5181#issuecomment-1225149527>

    In R2:
    
    ```
    i: make image! [4x4 #{
        010000020000030000040000
        050000060000000000000000
        0000000000000000000C0000
        0D00000E00000F0000100000
    }]
    
    i2: copy next i
    
    == make image! [4x3 #{
    020000030000040000050000000000000000000000000000000000000000
    000000000000
    }]
    ```
    
    R2 copies 4 pixels of the image and make a 4x3 image. Should we do the same?

--------------------------------------------------------------------------------

On 2022-08-24T07:44:16Z, hiiamboris, commented:
<https://github.com/red/red/issues/5181#issuecomment-1225323668>

    4 pixels is weird.

