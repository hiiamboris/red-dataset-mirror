
#4466: FIND/same on hash is linear with objects and blocks
================================================================================
Issue is closed, was reported by hiiamboris and has 22 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4466>

**Describe the bug**

Not only linear, but `find/same hash block` doesn't work with objects inside that block (returns none). Tried on a recent build where #4177 is fixed:
```
>> do https://gitlab.com/hiiamboris/red-mezz-warehouse/-/raw/master/clock.red
>> blk: collect [repeat i 10000 [keep i] keep o: object []]
== [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 ...
>> random blk
== [4644 1492 1929 1558 7348 1330 1543 2745 1677 3833 105 46 5454 4478 6473 60 4416 7825...
>> index? find blk o
== 5708
>> hsh: make hash! blk
== make hash! [4644 1492 1929 1558 7348 1330 1543 2745 1677 3833 105 46 5454 4478 6473 6...
>> clock/times [find/same blk o] 10000
148 μs	[find/same blk o]
== [make object! [] 3909 5021 835 6215 9029 3971 6996 2334 2463 834 445 4303 1529 6127 5...
>> clock/times [find/same hsh o] 10000
149 μs	[find/same hsh o]
== make hash! [make object! [] 3909 5021 835 6215 9029 3971 6996 2334 2463 834 445 4303 ...
>> clock/times [find hsh o] 10000
141 μs	[find hsh o]
== make hash! [make object! [] 3909 5021 835 6215 9029 3971 6996 2334 2463 834 445 4303 ...
>> clock/times [find/case hsh o] 10000
136 μs	[find/case hsh o]
== make hash! [make object! [] 3909 5021 835 6215 9029 3971 6996 2334 2463 834 445 4303 ...

>> ro: reduce [o]
== [make object! []]
>> clock/times [find hsh ro] 10000
0.50 μs	[find hsh ro]      ;) the only non-linear result so far!
== make hash! [make object! [] 5917 3046 7725 3356 1936 3688 6752 6646 9032 3988 6664 21...
>> clock/times [find/same hsh ro] 10000
4.00 μs	[find/same hsh ro]
== none                    ;) WRONG
```

**To reproduce**
```
do https://gitlab.com/hiiamboris/red-mezz-warehouse/-/raw/master/clock.red
blk: collect [repeat i 10000 [keep i] keep o: object []]
random blk
index? find blk o
hsh: make hash! blk
clock/times [find/same blk o] 10000
clock/times [find/same hsh o] 10000
clock/times [find hsh o] 10000
clock/times [find/case hsh o] 10000
ro: reduce [o]
clock/times [find hsh ro] 10000
clock/times [find/same hsh ro] 10000
```

**Expected behavior**

Both `find/same hsh o` and `find/same hsh ro` should return proper location and take half a microsecond.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 21-May-2020/6:17:34+03:00 commit #398d733
```



Comments:
--------------------------------------------------------------------------------

On 2020-05-25T13:59:12Z, hiiamboris, commented:
<https://github.com/red/red/issues/4466#issuecomment-633586199>

    @qtxie these tests succeed for me, but in more complex scenarios it's still slower than a block (I suspect not lookups but modification?). See https://gist.github.com/hiiamboris/4da1bccf63f4506b412977c1673c723c/#gistcomment-3317291
    
    I tried to merge your https://github.com/red/red/pull/4026 on top of current master and changing `reactivity/relations` and `reactivity/queue` to type `hash!`. But it crashes for me. I skipped the View tests as they are crashing too, only pure reactivity here:
    ```
    === ONLY REACTIVITY (NO VIEW) ===                                             
                                                                                  
    CREATING 1000 REACTORS x5                                                     
    51.0 ms [clear pick b 1 loop 1000 [append pick b 1 reactor [x: 10 y: 2 t: 0 re
    51.0 ms [clear pick b 2 loop 1000 [append pick b 2 reactor [x: 10 y: 2 t: 0 re
    68.0 ms [clear pick b 3 loop 1000 [append pick b 3 reactor [x: 10 y: 2 t: 0 re
    49.0 ms [clear pick b 4 loop 1000 [append pick b 4 reactor [x: 10 y: 2 t: 0 re
    53.0 ms [clear pick b 5 loop 1000 [append pick b 5 reactor [x: 10 y: 2 t: 0 re
    CREATING 15000 REACTIONS                                                      
    80.0 ms [foreach r pick b 1 [react/later r/re]]                               
    113 ms  [foreach r pick b 2 [react/later r/re]]                               
    130 ms  [foreach r pick b 3 [react/later r/re]]                               
    163 ms  [foreach r pick b 4 [react/later r/re]]                               
    169 ms  [foreach r pick b 5 [react/later r/re]]                               
    relations count: 15000                                                        
    b/1/1/t: 0                                                                    
    b/2/2/t: 0                                                                    
    FIRING 15000 REACTIONS                                                        
    3.00 ms [s/s: 2]                                                              
    b/1/1/t: 0                                                                    
    b/2/2/t: 0                                                                    
    DESTROYING 15000 REACTIONS                                                    
                                                                                  
    *** Runtime Error 98: assertion failed                                                                  
    *** in file: /D/devel/red/red-src/red/runtime/hashtable.reds                                            
    *** at line: 1366                                                                                       
    ***                                                                                                     
    ***   stack: red/_hashtable/refresh 00000062h 4409042 -1 83996664 true                                  
    ***   stack: red/_hashtable/refresh 0295AAB8h -4 4 59996 true                                           
    ***   stack: red/_series/remove 02A081D4h 02A081E4h 02A081C4h                                           
    ***   stack: red/actions/remove 02A081D4h 02A081E4h 02A081C4h                                           
    ***   stack: red/actions/remove* 1 -1                                                                   
    ***   stack: react 0224AE94h                                                                            
    ***   stack: red/_function/call 02A07FF4h 0224AE94h                                                     
    ***   stack: red/interpreter/eval-code 02A07FF4h 02DC0858h 02DC0858h true 02DC0828h 02DC0E80h 02B02DF0h 
    ***   stack: red/interpreter/eval-path 02DC0828h 02DC0838h 02DC0858h false false false false            
    ***   stack: red/interpreter/eval-expression 02DC0838h 02DC0858h false false false                      
    ***   stack: red/interpreter/eval 02A07FC4h false                                                       
    ***   stack: red/natives/foreach* false                                                                 
    ***   stack: red/interpreter/eval-arguments 02B00400h 066CE2E0h 066CE2E0h 00000000h 00000000h           
    ***   stack: red/interpreter/eval-code 02B00400h 066CE290h 066CE2E0h false 00000000h 00000000h 02B00400h
    ***   stack: red/interpreter/eval-expression 066CE290h 066CE2E0h false false false                      
    ***   stack: red/interpreter/eval 02A07F84h true                                                        
    ***   stack: red/natives/loop* false                                                                    
    ***   stack: red/interpreter/eval-arguments 02B003C0h 02DC9428h 02DC95C8h 00000000h 00000000h           
    ***   stack: red/interpreter/eval-code 02B003C0h 02DC9408h 02DC95C8h true 00000000h 00000000h 02B003C0h 
    ***   stack: red/interpreter/eval-expression 02DC9408h 02DC95C8h false true false                       
    ***   stack: red/interpreter/eval-arguments 02AFF8F0h 02DC93F8h 02DC95C8h 02DC93D8h 02DC9698h           
    ***   stack: red/interpreter/eval-code 02AFF8F0h 02DC93E8h 02DC95C8h true 02DC93D8h 02DC9698h 02AFF8F0h 
    ***   stack: red/interpreter/eval-path 02DC93D8h 02DC93E8h 02DC95C8h false false false false            
    ***   stack: red/interpreter/eval-expression 02DC93E8h 02DC95C8h false false false                      
    ***   stack: red/interpreter/eval 02DC92C0h true                                                        
    ***   stack: red/interpreter/eval-function 02A07E94h 02DC92C0h                                          
    ***   stack: red/_function/call 02A07E94h 02253884h                                                     
    ***   stack: red/interpreter/eval-code 02A07E94h 02DBFB50h 02DBFB50h false 00000000h 00000000h 02B07D00h
    ***   stack: red/interpreter/eval-expression 02DBFB30h 02DBFB50h false false false                      
    ***   stack: red/interpreter/eval 02A07E84h true                                                        
    ***   stack: red/natives/repeat* false                                                                  
    ***   stack: red/interpreter/eval-arguments 02B003D0h 02DBF138h 02DBF178h 00000000h 00000000h           
    ***   stack: red/interpreter/eval-code 02B003D0h 02DBF108h 02DBF178h false 00000000h 00000000h 02B003D0h
    ***   stack: red/interpreter/eval-expression 02DBF108h 02DBF178h false false false                      
    ***   stack: red/interpreter/eval 02A07E34h true                                                        
    ***   stack: red/natives/catch* true 1                                                                  
    ***   stack: ctx||563~try-do 02960678h                                                                  
    ***   stack: ctx||563~launch 02960678h                                                                  
    ***   stack: ctx||581~launch 029601C0h                                                                  
    ```
    
    Maybe crashes are the result of my merge, or an incompatibility of those branches, I don't know ☻
    Still, reactivity should be a good use case for hash, yes? I think #3536 is worth fixing if it makes reactivity faster.
    
    If `CREATING 15000 REACTIONS` results are not false and it's really that fast - then this fix is a must have!

--------------------------------------------------------------------------------

On 2020-05-25T16:18:08Z, hiiamboris, commented:
<https://github.com/red/red/issues/4466#issuecomment-633640385>

    Same issue with the blocks:
    ```
    Red []
    do https://gitlab.com/hiiamboris/red-mezz-warehouse/-/raw/master/clock.red
    bs: [] loop 100000 [append/only bs copy []]
    repeat n 5 [clock/times compose [find/same/only bs pick bs (10 ** n * 9 / 10)] 1000]
    ```
    Clearly linear:
    ```
    1.00 μs [find/same/only bs pick bs 9]     
    4.00 μs [find/same/only bs pick bs 90]    
    26.0 μs [find/same/only bs pick bs 900]   
    245 μs  [find/same/only bs pick bs 9000]  
    2.43 ms [find/same/only bs pick bs 90000] 
    ```

--------------------------------------------------------------------------------

On 2020-05-26T02:25:51Z, qtxie, commented:
<https://github.com/red/red/issues/4466#issuecomment-633774957>

    >  I think #3536 is worth fixing if it makes reactivity faster
    
    So those 15000 relations are the same in `reactivity/relations`?

--------------------------------------------------------------------------------

On 2020-05-26T08:22:19Z, hiiamboris, commented:
<https://github.com/red/red/issues/4466#issuecomment-633882114>

    No, in test 3 of that script they contain a global object, so this object repeats like 5000 times there. This is close to real world use case where parent window controls it's children.
    
    And test 4 ties each unique object only twice (so each object appears like 6 times only), but it's still slow and non-linear.

--------------------------------------------------------------------------------

On 2020-05-26T09:47:57Z, qtxie, commented:
<https://github.com/red/red/issues/4466#issuecomment-633924846>

    OK. I'll fix the PR. 

--------------------------------------------------------------------------------

On 2021-09-29T07:12:06Z, qtxie, commented:
<https://github.com/red/red/issues/4466#issuecomment-929900692>

    Is there any issue left in this thread?

--------------------------------------------------------------------------------

On 2021-09-29T07:57:57Z, hiiamboris, commented:
<https://github.com/red/red/issues/4466#issuecomment-929932861>

    Yes, issues don't fix themselves ;)
    ```
    do https://codeberg.org/hiiamboris/red-common/raw/branch/master/clock.red
    bs: make hash! [] loop 100000 [append/only bs copy []]
    repeat n 5 [clock/times compose [find/same/only bs pick bs (10 ** n * 9 / 10)] 1000]
    ```
    Output:
    ```
    0.99 μs	[find/same/only bs pick bs 9]
    1.98 μs	[find/same/only bs pick bs 90]
    17.0 μs	[find/same/only bs pick bs 900]
    170 μs	[find/same/only bs pick bs 9000]
    1.74 ms	[find/same/only bs pick bs 90000]
    ```

--------------------------------------------------------------------------------

On 2021-09-29T08:08:13Z, qtxie, commented:
<https://github.com/red/red/issues/4466#issuecomment-929940486>

    Is it expected result? All the values are the same in the hash, so the hash table degenerate to a list. 
    
    OK. I got what you mean. Using `/same` refinement should work better.

--------------------------------------------------------------------------------

On 2022-08-30T15:45:15Z, dockimbel, commented:
<https://github.com/red/red/issues/4466#issuecomment-1231846497>

    @qtxie What's the status with the fix on this ticket?

--------------------------------------------------------------------------------

On 2022-08-31T09:17:47Z, qtxie, commented:
<https://github.com/red/red/issues/4466#issuecomment-1232686079>

    @dockimbel @hiiamboris Added an optimization for find/same/only on hash.

--------------------------------------------------------------------------------

On 2022-08-31T11:14:18Z, dockimbel, commented:
<https://github.com/red/red/issues/4466#issuecomment-1232800350>

    After the fix:
    ```
    1.01 μs	[find/same/only bs pick bs 9]
    1.01 μs	[find/same/only bs pick bs 90]
    1.00 μs	[find/same/only bs pick bs 900]
    1.02 μs	[find/same/only bs pick bs 9000]
    0.0 μs	[find/same/only bs pick bs 90000]
    ```

