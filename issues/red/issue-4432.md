
#4432: [CRASH] involving Parse, Reduce & GC
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4432>

**To reproduce**

Variant 1 (always crashes):
```
Red []
s: "long long long string"
b: reduce [s s [1]]
print "HERE"
color: parse copy "." [change skip (b)]
print "THERE"
```
`red 1.red`:
```
HERE

*** Runtime Error 1: access violation
*** at: 7517AB60h
```
Or `gui-console 1.red`
```
HERE

*** Runtime Error 1: access violation      
*** Cannot determine source file/line info.
***                                        
```

---
Variant 2 (crashes only with GC on):
```
Red []
s: 1.21319613701372131
b: reduce [s s [1]]
color: parse copy "." [change skip (b)]
print "HERE"
cache: make block! 1'000'000
print "THERE"
```
Run it in debug console `gui-console 2.red`:
```
HERE
root: 5181/6970, runs: 0, mem: 2599840                                                                 
*** Runtime Error 98: assertion failed                                                                 
*** in file: /D/devel/red/red-src/red-master/runtime/allocator.reds                                    
*** at line: 365                                                                                       
***                                                                                                    
***   stack: red/free-node 00000062h                                                                   
***   stack: red/free-node 00000020h                                                                   
***   stack: red/cross-compact-frame 02C40004h 009E4FD0h                                               
***   stack: red/collect-frames 1                                                                      
***   stack: red/collector/do-mark-sweep                                                               
***   stack: red/collector/do-cycle                                                                    
***   stack: red/alloc-series-buffer 1000000 16 0                                                      
***   stack: red/alloc-series 1000000 16 0                                                             
***   stack: red/alloc-cells 1000000                                                                   
***   stack: red/block/make-at 02A59144h 1000000                                                       
***   stack: red/block/make 02A59144h 02A59154h 5                                                      
***   stack: red/actions/make 02A59144h 02A59154h                                                      
***   stack: red/actions/make*                                                                         
***   stack: red/interpreter/eval-arguments 02B404B8h 02D98970h 02D98990h 00000000h 00000000h          
***   stack: red/interpreter/eval-code 02B404B8h 02D98950h 02D98990h true 00000000h 00000000h 02B404B8h
***   stack: red/interpreter/eval-expression 02D98950h 02D98990h false true false                      
***   stack: red/interpreter/eval-expression 02D98940h 02D98990h false false false                     
***   stack: red/interpreter/eval 02A59104h true                                                       
***   stack: red/natives/catch* true 1                                                                 
***   stack: ctx||528~try-do 02151FACh                                                                 
***   stack: ctx||528~launch 02151FACh                                                                 
***   stack: ctx||561~launch 02151700h                                                                 
```

**NOTE:** Using `compose` instead of `reduce` crashes it too

**Expected behavior**
```
HERE
THERE
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 7-May-2020/13:14:21+03:00
master & fast-lexer & older builds
```
Build https://github.com/red/red/pull/4097 does not crash btw



Comments:
--------------------------------------------------------------------------------

On 2020-05-07T19:26:32Z, dockimbel, commented:
<https://github.com/red/red/issues/4432#issuecomment-625450906>

    Seems to be working fine in a console build from April 28th.

--------------------------------------------------------------------------------

On 2020-05-09T07:33:12Z, qtxie, commented:
<https://github.com/red/red/issues/4432#issuecomment-626122271>

    The code below no `reduce`, no GC triggered. We can be sure that something wrong in parse. I suspect that the `change` keyword in parse corrupt the memory.
    ```
    b: ["long long long string" "long long long string" [1]]
    print "HERE"
    color: parse copy "." [change skip (b)]
    print "THERE"
    ```
    I have an old version of Red (red-18feb20-b7c63740.exe) has the same crash.

