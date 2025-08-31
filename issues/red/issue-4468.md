
#4468: [CRASH] GC causes R/S stack to overflow
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.built] [status.tested] [type.bug] [type.GC]
<https://github.com/red/red/issues/4468>

**Describe the bug**

Run this script - it crashes on `recycle` (I couldn't nail it down further, sorry):
```
Red [needs: view]

do https://gitlab.com/hiiamboris/red-mezz-warehouse/-/raw/master/clock.red
recycle/off
b: [[][][][][]]
s: reactor [x: 10 y: 2 t: 0 re: [this/t: that/x + that/y + that/t / 10]]
repeat i 5 [clock compose/deep [clear pick b (i) loop 1000 [append pick b (i) make s [re: copy/deep re]]]]
prev: s
repeat i 5 [clock compose [foreach r pick b (i) [react/link/later r/re: func [this that] r/re [r prev] prev: r]]]
clock [s/t: 1]
repeat i 5 [clock compose [foreach r pick b (i) [react/unlink :r/re 'all]]]
clock [recycle]
```
Output is:
```
31.0 ms [clear pick b 1 loop 1000 [append pick b 1 make s [re: copy/deep re]]] 
34.0 ms [clear pick b 2 loop 1000 [append pick b 2 make s [re: copy/deep re]]] 
49.0 ms [clear pick b 3 loop 1000 [append pick b 3 make s [re: copy/deep re]]] 
37.0 ms [clear pick b 4 loop 1000 [append pick b 4 make s [re: copy/deep re]]] 
41.0 ms [clear pick b 5 loop 1000 [append pick b 5 make s [re: copy/deep re]]] 
188 ms  [foreach r pick b 1 [react/link/later r/re: func [this that] r/re [r p 
449 ms  [foreach r pick b 2 [react/link/later r/re: func [this that] r/re [r p 
917 ms  [foreach r pick b 3 [react/link/later r/re: func [this that] r/re [r p 
841 ms  [foreach r pick b 4 [react/link/later r/re: func [this that] r/re [r p 
2403 ms [foreach r pick b 5 [react/link/later r/re: func [this that] r/re [r p 
558 ms  [s/t: 1]                                                               
928 ms  [foreach r pick b 1 [react/unlink :r/re 'all]]                         
714 ms  [foreach r pick b 2 [react/unlink :r/re 'all]]                         
519 ms  [foreach r pick b 3 [react/unlink :r/re 'all]]                         
321 ms  [foreach r pick b 4 [react/unlink :r/re 'all]]                         
113 ms  [foreach r pick b 5 [react/unlink :r/re 'all]]                         
root: 4720/6799, runs: 0, mem: 49337420                                        
*** Runtime Error 19: stack error or overflow                                  
*** in file: /D/devel/red/red-src/red/runtime/collector.reds                   
*** at line: 88                                                                
***                                                                            
***   stack: red/collector/keep 0030AF24h                  
***   stack: red/collector/mark-values 052FA4B0h 052FA5A0h 
***   stack: red/collector/mark-block 052FA488h            
***   stack: red/collector/mark-values 052FA488h 052FA498h 
***   stack: red/collector/mark-block 052FA378h            
***   stack: red/collector/mark-values 052FA378h 052FA418h 
***   stack: red/collector/mark-block 052FA2F0h            
***   stack: red/collector/mark-values 052FA2F0h 052FA340h 
***   stack: red/collector/mark-block-node 0527DE60h       
***   stack: red/collector/mark-values 052F9AF0h 052F9B40h 
***   stack: red/collector/mark-block-node 0527DEA8h       
***   stack: red/collector/mark-context 0527DEB0h          
***   stack: red/collector/mark-values 06A2C7E8h 06A2C7F8h 
***   stack: red/collector/mark-block 06A2C718h            
***   stack: red/collector/mark-values 06A2C718h 06A2C788h 
***   stack: red/collector/mark-block 06A2C6A0h            
***   stack: red/collector/mark-values 06A2C6A0h 06A2C6F0h 
***   stack: red/collector/mark-block-node 06B6F65Ch       
***   stack: red/collector/mark-values 052FB1E0h 052FB1F0h 
***   stack: red/collector/mark-block-node 0527DDC8h       
***   stack: red/collector/mark-context 0527DDD0h          
***   stack: red/collector/mark-values 06A2CC88h 06A2CC98h 
***   stack: red/collector/mark-block 06A2CBB8h            
***   stack: red/collector/mark-values 06A2CBB8h 06A2CC28h 
***   stack: red/collector/mark-block 06A2CB40h            
***   stack: red/collector/mark-values 06A2CB40h 06A2CB90h 
***   stack: red/collector/mark-block-node 06B6F628h       
***   stack: red/collector/mark-values 052FC890h 052FC8A0h 
***   stack: red/collector/mark-block-node 0527DCE8h       
***   stack: red/collector/mark-context 0527DCF0h          
***   stack: red/collector/mark-values 06A2D128h 06A2D138h 
***   stack: red/collector/mark-block 06A2D058h            
***   stack: red/collector/mark-values 06A2D058h 06A2D0C8h 
***   stack: red/collector/mark-block 06A2CFE0h            
***   stack: red/collector/mark-values 06A2CFE0h 06A2D030h 
***   stack: red/collector/mark-block-node 06B6F5F4h       
***   stack: red/collector/mark-values 052FDF40h 052FDF50h 
***   stack: red/collector/mark-block-node 0527DC08h       
***   stack: red/collector/mark-context 0527DC10h          
***   stack: red/collector/mark-values 06A2D5C8h 06A2D5D8h
```

**Expected behavior**

No crash.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 21-May-2020/6:17:34+03:00 commit #398d733
```



Comments:
--------------------------------------------------------------------------------

On 2020-07-09T11:19:53Z, hiiamboris, commented:
<https://github.com/red/red/issues/4468#issuecomment-656069077>

    Can't be sure, but probably the same thing as in https://github.com/red/red/issues/4514

--------------------------------------------------------------------------------

On 2022-09-20T03:18:52Z, qtxie, commented:
<https://github.com/red/red/issues/4468#issuecomment-1251786411>

    No crashes on commit 040d936091c394aa0ab7d8998d03bd5e24758806.

--------------------------------------------------------------------------------

On 2022-09-20T07:37:27Z, hiiamboris, commented:
<https://github.com/red/red/issues/4468#issuecomment-1251960301>

    Stopped crashing between Sep 18/2021 and Sep 30/2021.

