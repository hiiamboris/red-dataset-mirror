
#5300: [Regression] `get` on path works as `get/any`, plus datatype inconsistencies
================================================================================
Issue is open, was reported by hiiamboris and has 12 comment(s).
[type.bug] [type.design]
<https://github.com/red/red/issues/5300>

**Describe the bug**

R3:
```
>> o: object [x: 1 unset 'x] b: reduce ['x ()] m: make map! b ()
>> get/any 'o/x
>> get/any 'o/y

** Script error: cannot access y in path o/y
** Where: get
** Near: get/any 'o/y

>> get/any 'b/x
>> get/any 'm/x
>> get 'o/x

** Script error: o/x has no value
** Where: get
** Near: get 'o/x

>> get 'o/y

** Script error: cannot access y in path o/y
** Where: get
** Near: get 'o/y

>> get 'b/x

** Script error: b/x has no value
** Where: get
** Near: get 'b/x

>> get 'm/x

** Script error: m/x has no value
** Where: get
** Near: get 'm/x

>> o/x
>> o/y

** Script error: cannot access y in path o/y

>> b/x
>> m/x
>> :o/x
>> :o/y

** Script error: cannot access y in path :o/y

>> :b/x
>> :m/x
>>
```

Red before https://github.com/red/red/commit/971f3ce41405287d24ec01cf1845dbaddd68a457: 
```
>> o: object [x: 1 unset 'x] b: reduce ['x ()] m: make map! b ()
>> get/any 'o/x
>> get/any 'o/y
>> get/any 'b/x
>> get/any 'm/x
>> get 'o/x
*** Script Error: cannot access x in path o/x
*** Where: get
*** Near : 'o/x
*** Stack:

>> get 'o/y
*** Script Error: cannot access y in path o/y
*** Where: get
*** Near : 'o/y
*** Stack:

>> get 'b/x
>> get 'm/x

>> o/x
*** Script Error: cannot access x in path o/x
*** Where: catch
*** Near : o/x
*** Stack:

>> o/y
*** Script Error: cannot access y in path o/y
*** Where: catch
*** Near : o/y
*** Stack:

>> b/x
>> m/x
>> :o/x
>> :o/y
>> :b/x
>> :m/x
>>
```
Red now:
```
>> o: object [x: 1 unset 'x] b: reduce ['x ()] m: make map! b ()
>> get/any 'o/x
>> get/any 'o/y
>> get/any 'b/x
>> get/any 'm/x
>> get 'o/x
>> get 'o/y
>> get 'b/x
>> get 'm/x
>> o/x
*** Script Error: cannot access x in path o/x
*** Where: catch
*** Near : o/x
*** Stack:  

>> o/y
*** Script Error: cannot access y in path o/y
*** Where: catch
*** Near : o/y
*** Stack:  

>> b/x
>> m/x
>> :o/x
>> :o/y
>> :b/x
>> :m/x
>> 
```

**To reproduce**
```
o: object [x: 1 unset 'x] b: reduce ['x ()] m: make map! b ()

get/any 'o/x
get/any 'o/y
get/any 'b/x
get/any 'm/x
get 'o/x
get 'o/y
get 'b/x
get 'm/x

o/x
o/y
b/x
m/x
:o/x
:o/y
:b/x
:m/x
```

**Expected behavior**

Either we drop `/any` or it should be the only thing returning unset.
R3 seems to have it partially correct and consistent.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4629 date: 28-Jan-2023/11:28:13 commit: #ec0c31279023590e285fb2e1869380670ee0239f ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```

Related:  https://github.com/red/red/issues/4550 https://github.com/red/red/issues/4988 https://github.com/red/red/issues/4910 https://github.com/red/red/issues/3112 https://github.com/red/red/issues/1499


Comments:
--------------------------------------------------------------------------------

On 2023-03-24T18:41:09Z, hiiamboris, commented:
<https://github.com/red/red/issues/5300#issuecomment-1483255320>

    Summary table:
    
    ## R3:
    
    | | unset global word | unset object word | unset list value | unset map value | missing object word |
    |-|-|-|-|-|-|
    | get 'path or 'word | error | error | error | error | error |
    | path or word evaluation | error | **UNSET** | **UNSET** | **UNSET** | error |
    | get/any 'path or 'word | unset | unset | unset | unset | error |
    | get-path or get-word evaluation | unset | unset | unset | unset | error |
    					
    ## Red:
    					
    | | unset global word | unset object word | unset list value | unset map value | missing object word |
    |-|-|-|-|-|-|
    | get 'path or 'word | error | **UNSET** | **UNSET** | **UNSET** | **UNSET** |
    | path or word evaluation | error | error | **UNSET** | **UNSET** | error |
    | get/any 'path or 'word | unset | unset | unset | unset | **UNSET** |
    | get-path or get-word evaluation | unset | unset | unset | unset | **UNSET** |
    
    @Oldes will have to say if R3 behavior is by design, but it looks like a bug to me.

--------------------------------------------------------------------------------

On 2024-03-12T09:59:03Z, Oldes, commented:
<https://github.com/red/red/issues/5300#issuecomment-1991231726>

    @hiiamboris could you be more specific, what looks like a bug in R3?

--------------------------------------------------------------------------------

On 2024-03-12T11:09:19Z, hiiamboris, commented:
<https://github.com/red/red/issues/5300#issuecomment-1991396627>

    @Oldes The bold cells in the above table.
    ```
    >> m: make map! b: reduce ['x ()] o: object [x: 1 unset 'x]
    == make object! [
        x: #[unset]
    ]
    
    >> m/x
    >> o/x
    >> b/x
    ```

--------------------------------------------------------------------------------

On 2024-03-14T08:59:21Z, Oldes, commented:
<https://github.com/red/red/issues/5300#issuecomment-1996913254>

    In this case I would say it is by design. The key is present, even when it is being _unset_ and so it does not throw an error. It would be easy to add a condition and throw the error if the value is unset, but I don't think it is needed.
    
    I was thinking, if `get/any` should not return `unset!` instead of error when accessing not an object key which does not exists, but again... it would require additional conditions which I don't want to add just to handle very rare use cases.

--------------------------------------------------------------------------------

On 2024-03-14T10:14:35Z, hiiamboris, commented:
<https://github.com/red/red/issues/5300#issuecomment-1997097261>

    @Oldes Isn't `/any` an enabler for unset returns *by design*? If `get` also returns unset, why the need for `/any` at all?

--------------------------------------------------------------------------------

On 2024-03-14T18:51:21Z, greggirwin, commented:
<https://github.com/red/red/issues/5300#issuecomment-1998110463>

    For objects the closest parallel seems `get in o 'x`, which is an error, so I think objects should be an error. Same for `get in o 'y`, which is a different error. Objects are more of a strict and expected structure. If you address something, you expect it to be there. Should objects become more extensible and dynamic, which could happen if `extend` and a change in implementation make it so, we have to re-evaluate.
    
    For blocks and maps it's a tougher call. `select b 'x` is not an error, nor is `select b 'y`. Maps are consistent with this.
    
    The fact that they _return_ `unset!` asks more of its truthiness and how it's used. For example, `a: b/x` still throws an error, and would require `set/any`. The reason objects match this behavior now may be for consistency (if it was by design), which is both good and bad. These types are *not*, and likely never will be, 100% consistent in their behavior. A detail here is also that blocks are not strictly key-value, which objects and maps are. Is the edge case of the "key" being the last item in a block always an error?

