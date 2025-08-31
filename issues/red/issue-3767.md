
#3767: [CRASH] with `sort/compare`
================================================================================
Issue is closed, was reported by hiiamboris and has 12 comment(s).
[status.built] [type.bug]
<https://github.com/red/red/issues/3767>

**Describe the bug**

when 3 conditions are met:
- block is big enough
- custom compare func is specified
- /all refinement is used
```
sort/skip/all/compare
	append/dup [] [1.0 ""] 10000
	2
	func [a b] [ a/1 < b/1 ]
```

The script consumes ~2GB of RAM and then we have this:
```
*** Runtime Error 19: stack error or overflow
*** in file: /D/devel/red/red-src/red/runtime/allocator.reds
*** at line: 184
***
***   stack: red/allocate-virtual 2097168 false
***   stack: red/alloc-series-frame
***   stack: red/alloc-series-buffer 2 16 0
***   stack: red/alloc-series 2 16 0
***   stack: red/alloc-cells 2
***   stack: red/block/make-at 0294CBD4h 2
***   stack: red/block/push-only* 2
***   stack: red/error/create 02ACD5E4h 02AD1654h 00000000h 00000000h 00000000h
***   stack: red/fire 0 00093138h
***   stack: red/allocate-virtual 2101248 false
***   stack: red/alloc-series-frame
***   stack: red/alloc-series-buffer 2 16 0
***   stack: red/alloc-series 2 16 0
***   stack: red/alloc-cells 2
***   stack: red/block/make-at 0294CBC4h 2
***   stack: red/block/push-only* 2
***   stack: red/error/create 02ACD5E4h 02AD1654h 00000000h 00000000h 00000000h
***   stack: red/fire 0 0009327Ch
***   stack: red/allocate-virtual 2101248 false
***   stack: red/alloc-series-frame
***   stack: red/alloc-series-buffer 2 16 0
***   stack: red/alloc-series 2 16 0
***   stack: red/alloc-cells 2
***   stack: red/block/make-at 0294CBB4h 2
***   stack: red/block/push-only* 2
***   stack: red/error/create 02ACD5E4h 02AD1654h 00000000h 00000000h 00000000h
***   stack: red/fire 0 000933C0h
***   stack: red/allocate-virtual 2101248 false
***   stack: red/alloc-series-frame
***   stack: red/alloc-series-buffer 2 16 0
***   stack: red/alloc-series 2 16 0
***   stack: red/alloc-cells 2
***   stack: red/block/make-at 0294CBA4h 2
***   stack: red/block/push-only* 2
***   stack: red/error/create 02ACD5E4h 02AD1654h 00000000h 00000000h 00000000h
***   stack: red/fire 0 00093504h
***   stack: red/allocate-virtual 2101248 false
***   stack: red/alloc-series-frame
***   stack: red/alloc-series-buffer 2 16 0
***   stack: red/alloc-series 2 16 0
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 25-Jan-2019/6:49:24+03:00 commit #702ec38
```



Comments:
--------------------------------------------------------------------------------

On 2019-02-01T23:31:48Z, greggirwin, commented:
<https://github.com/red/red/issues/3767#issuecomment-459903979>

    Confirmed. Good find. Do you know how big "big enough" is? Not critical, as it shouldn't be too difficult to track down.

--------------------------------------------------------------------------------

On 2019-02-02T09:00:40Z, hiiamboris, commented:
<https://github.com/red/red/issues/3767#issuecomment-459948649>

    > Do you know how big "big enough" is?
    
    Clueless. Found by pure accident.

--------------------------------------------------------------------------------

On 2019-02-02T19:03:28Z, greggirwin, commented:
<https://github.com/red/red/issues/3767#issuecomment-459990429>

    It's not completely consistent, which is another clue. At 5700 it seems to crash consistently, but I see it intermittently at lower numbers too (3000+ confirmed so far). Sometimes crashes fast, sometimes very slow.

--------------------------------------------------------------------------------

On 2019-03-21T17:23:05Z, qtxie, commented:
<https://github.com/red/red/issues/3767#issuecomment-475325577>

    It's a known issue. When out of memory, Red tries to throw an error, but it will also allocate memory which cause an exception again.

--------------------------------------------------------------------------------

On 2019-03-21T19:44:07Z, hiiamboris, commented:
<https://github.com/red/red/issues/3767#issuecomment-475375695>

    @qtxie the origin of this issue is not a memory shortage, but likely a bug in sort. 10000 items is like what? 128kB?

--------------------------------------------------------------------------------

On 2019-03-22T20:14:18Z, qtxie, commented:
<https://github.com/red/red/issues/3767#issuecomment-475765540>

    @hiiamboris Yes, you're right. I overlooked it.

