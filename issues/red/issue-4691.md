
#4691: to-json on object with self cause of StackOverflow
================================================================================
Issue is closed, was reported by bubnenkoff and has 10 comment(s).
[status.reviewed] [type.review]
<https://github.com/red/red/issues/4691>

**Before submitting**
The bug post in chat https://gitter.im/red/bugs?at=5f993d4a8a236947ba6dd250

**Describe the bug**
`to-json`  cast on object that include `self` cause crush. The code:
```
o: object [
        parent: self 
        number: 1 
        c: object [
            number: parent/number 
            name: "Apple"
            ]
        ]

to-json o
```
result:
```
>> to-json o
*** Internal Error: stack overflow
*** Where: =
*** Stack: to-json
```

**Expected behavior**
Work without error.

**Platform version**
```
Red 0.6.4 for Windows built 15-Oct-2020/12:39:12+03:00 commit #a9b26c7
```



Comments:
--------------------------------------------------------------------------------

On 2020-10-28T13:31:03Z, 9214, commented:
<https://github.com/red/red/issues/4691#issuecomment-717934161>

    This is not specific to `object!`, any cyclic structure will cause the codec to blow up the stack, simply because it doesn't account for self-referential relations.
    ```red
    >> to-json append/only block: [] block
    *** Internal Error: stack overflow
    *** Where: red-to-json-value
    *** Stack: to-json  
    
    >> to-json object [foo: self]
    *** Internal Error: stack overflow
    *** Where: append
    *** Stack: to-json 
    
    >> to-json put map: #() 'foo map
    *** Internal Error: stack overflow
    *** Where: append
    *** Stack: to-json  
    ```

--------------------------------------------------------------------------------

On 2020-10-28T13:39:56Z, bubnenkoff, commented:
<https://github.com/red/red/issues/4691#issuecomment-717939734>

    But is it a bug?

--------------------------------------------------------------------------------

On 2020-10-28T15:10:58Z, 9214, commented:
<https://github.com/red/red/issues/4691#issuecomment-717999424>

    @bubnenkoff it's not a bug, JSON format cannot directly encode cycles and references. Doesn't mean you _can't_ do that, it's a matter of designing a proper schema.
    
    JSON codec can perhaps implement cycle detection to make an error message more meaningful, but this will introduce an unwanted overhead for little to no gain in the general case.

--------------------------------------------------------------------------------

On 2020-10-28T16:59:44Z, greggirwin, commented:
<https://github.com/red/red/issues/4691#issuecomment-718073140>

    It's absolutely something we should note as expected. That's step one. Step 2 might be a `has-cycles` mezzanine, which would be general purpose and educational. Step 3 would be showing an example of how to create a schema that supports cycles. As part A of that, we can say we don't recommend it, but that we'll provide an example later if enough people ask. Of course, anyone can volunteer to do that, and reference other systems that face similar issues.

--------------------------------------------------------------------------------

On 2021-03-06T01:23:14Z, greggirwin, commented:
<https://github.com/red/red/issues/4691#issuecomment-791827398>

    I've noted this in the JSON codec wiki page, and am closing this ticket. 

