
#4853: [View] CRASH on extreme image sizes
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/4853>

**Describe the bug**

Testing DG has shown that Red can't make a 25000x25000 image. 25\*25\*4 = 2500MB, which should still work in Red. But it seems that image array size is being treated as signed integer somewhere, so it crashes:
```
>> 2 ** 31 / 4 / 25000
== 21474.83648             ;) that much should still be treated as positive
>> make image! 25000x21400
== make image! [25000x21400 #{
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFF...
>> recycle
root: 4667/7385, runs: 0, mem: 2221388 => 2192964, mark: 5.0ms, sweep: 2.0ms
>> make image! 25000x21500

*** Runtime Error 1: access violation
*** in file: /d/devel/red/red-src/red/runtime/platform/image-wic.reds
*** at line: 828
***
***   stack: red/OS-image/make-image 25000 21500 00000000h 00000000h 00000000h
***   stack: red/image/make 0289BF2Ch 0289BF3Ch 51
***   stack: red/actions/make 0289BF2Ch 0289BF3Ch
***   stack: red/actions/make*
***   stack: red/interpreter/eval-arguments 0289BF1Ch 02CC52D0h 02CC52D0h 00000000h 00000000h 029804C8h
***   stack: red/interpreter/eval-code 029804C8h 02CC52B0h 02CC52D0h false 00000000h 00000000h 029804C8h
***   stack: red/interpreter/eval-expression 02CC52B0h 02CC52D0h false false false
***   stack: red/interpreter/eval 0289BEFCh true
***   stack: red/natives/catch* true 1
***   stack: ctx||548~try-do 02811D60h
***   stack: ctx||548~do-command 02811D60h
***   stack: ctx||548~eval-command 02811D60h
***   stack: ctx||548~run 02811D60h
***   stack: ctx||548~launch 02811D60h
***   stack: ctx||566~launch 028117FCh
```

**Expected behavior**

1. `make image! 32000x32000` should work (leaving 200MB out of possible 4GB for the console):
```
>> 32000 ** 2.0 * 4 - (2 ** 32) / 1e6
== -198.967296
```
2. Out of memory error on bigger sizes instead of crash

**Platform version**
```
Red 0.6.4 for Windows built 2-Mar-2021/15:01:01+03:00 commit #6de9b93
```



Comments:
--------------------------------------------------------------------------------

On 2021-03-16T08:21:25Z, qtxie, commented:
<https://github.com/red/red/issues/4853#issuecomment-800055874>

    > make image! 32000x32000 should work (leaving 200MB out of possible 4GB for the console):
    
    We use OS API to create the image. The API returns with error, though it should work in theory.

--------------------------------------------------------------------------------

On 2021-03-16T08:36:52Z, hiiamboris, commented:
<https://github.com/red/red/issues/4853#issuecomment-800065745>

    How big does it allow with no error?

