
#3679: Parse always reaches the tail with some combinations of iterators and TO / THRU
================================================================================
Issue is open, was reported by 9214 and has 10 comment(s).
[type.review]
<https://github.com/red/red/issues/3679>

**Describe the bug**
In Parse, the following combinations:
```
while to   <...>
any   to   <...>
while thru <...>
any   thru <...>
```
always reach the tail of the series regardless of the match.

**To reproduce**
```red
>> parse [a b][any to 'c p:] tail? p 
== true
>> parse [a b][any thru 'c p:] tail? p 
== true

>> parse [a b][while to 'c p:] tail? p 
== true
>> parse [a b][while thru 'c p:] tail? p 
== true
```

**Expected behavior**
Rules act according to their semantics; in the examples above, tail can be reached with `any | while thru 'c` only if `c` is the last element (and I guess in case with `while` it would require a manual `break`). 

**Platform version (please complete the following information)**
Latest.


Comments:
--------------------------------------------------------------------------------

On 2018-12-23T15:30:26Z, toomasv, commented:
<https://github.com/red/red/issues/3679#issuecomment-449643819>

    Also weird:
    ```
    >> parse "xaxab" [2 3 thru "a"]
    == true
    >> parse "xaxab" [2 thru "a"]
    == false
    >> parse "xaxab" [3 thru "a"]
    == false
    
    ```

--------------------------------------------------------------------------------

On 2018-12-25T09:26:32Z, dockimbel, commented:
<https://github.com/red/red/issues/3679#issuecomment-449830608>

    This is a generic issue when using variable-arity rules in Parse. Wrap the problematic sub-rules in a block, and all the results will be correct.
    
    Though, if we want to continue supporting such _flat_ rules nesting, Parse needs internally a way to calculate arity of the root rule, in order to skip the right number of elements in the rule block. This is a non-trivial feature to support.

--------------------------------------------------------------------------------

On 2018-12-26T07:02:28Z, endo64, commented:
<https://github.com/red/red/issues/3679#issuecomment-449917221>

    Noted on the [wiki](https://github.com/red/red/wiki/%5BDOC%5D-Parse)

--------------------------------------------------------------------------------

On 2018-12-30T01:36:07Z, greggirwin, commented:
<https://github.com/red/red/issues/3679#issuecomment-450533213>

    @9214, good things to note in your future `parse` articles.

--------------------------------------------------------------------------------

On 2019-05-16T21:50:21Z, hiiamboris, commented:
<https://github.com/red/red/issues/3679#issuecomment-493244104>

    :point_up: [May 17, 2019 12:14 AM](https://gitter.im/red/parse?at=5cddd2c45b63ea22b3b9b7e0)
    ```
    >> parse "1234" [a: skip opt to "." a:] ? a
    A is a string! value: ""    ;) should be "234"
    ```

