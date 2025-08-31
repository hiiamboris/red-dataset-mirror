
#4080: `insert` can add blocks to vectors, but not vectors to vectors
================================================================================
Issue is open, was reported by hiiamboris and has 8 comment(s).
[type.design]
<https://github.com/red/red/issues/4080>

**Describe the bug**
```
>> v: make vector! [1 2 3 4]
>> insert v [0]
>> insert v make vector! [-1]
*** Script Error: invalid argument: make vector! [-1]
*** Where: insert
*** Stack: 
>> u: make vector! [-1]
== make vector! [-1]
>> insert/part v u tail u
*** Script Error: invalid argument: make vector! [-1]
*** Where: insert
*** Stack:  
```
Same goes for append ofc.

**To reproduce**
```
v: make vector! [1 2 3 4]
insert v [0]
insert v make vector! [-1]
u: make vector! [-1]
insert/part v u tail u
```

**Expected behavior**

Same as with blocks.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 1-Oct-2019/19:41:56+03:00 commit #2976655
```

Likely fix: extend the typecheck here https://github.com/red/red/blob/a4ee537c4b7dd40594db5e5809be8918deef38bd/runtime/datatypes/vector.reds#L1001



Comments:
--------------------------------------------------------------------------------

On 2020-10-27T15:24:02Z, 9214, commented:
<https://github.com/red/red/issues/4080#issuecomment-717320497>

    What happens if two vectors hold values of different datatypes, or of different sizes?

--------------------------------------------------------------------------------

On 2020-10-27T15:45:23Z, hiiamboris, commented:
<https://github.com/red/red/issues/4080#issuecomment-717334828>

    Good question. My first thought is to maintain consistency: `(insert v1 v2) == insert (insert v1 first v2) next v2`. That is, follow the rules defined for vector elements. Which currently are not converting any types:
    ```
    >> insert make vector! [0] 1.0
    *** Script Error: invalid argument: 1.0
    *** Where: insert
    *** Stack:  
    
    >> insert make vector! [0.0] 1
    *** Script Error: invalid argument: 1
    *** Where: insert
    *** Stack:  
    
    >> insert make vector! [0.0] 100%
    *** Script Error: invalid argument: 100%
    *** Where: insert
    *** Stack:  
    ```

--------------------------------------------------------------------------------

On 2020-10-27T15:47:41Z, hiiamboris, commented:
<https://github.com/red/red/issues/4080#issuecomment-717336272>

    The only thing that works right now I think is automatically promoting/demoting floats to 32/64 bits, which I propose should work for mass insertion too.

--------------------------------------------------------------------------------

On 2020-10-27T15:49:45Z, hiiamboris, commented:
<https://github.com/red/red/issues/4080#issuecomment-717337697>

    And integers between 8/16/32 bits (sorry, MS broke GH again, can't edit my own messages)

