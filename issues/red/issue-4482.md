
#4482: inconsistent treating of UNSET by conditional natives
================================================================================
Issue is open, was reported by 9214 and has 8 comment(s).
[type.design]
<https://github.com/red/red/issues/4482>

**Describe the bug**
Some natives treat `unset` as truthy:

```red
>> if () [1]
== 1
>> unless () [1]
== none
>> any [()]
>> all [()]
>> not ()
== false
```

While others don't even recognize it as a valid conditional value:

```red
>> either () [1][2]
*** Script Error: block did not return a value
*** Where: either
*** Stack:  

>> until []
*** Script Error: block did not return a value
*** Where: until
*** Stack: 
 
>> while [][]
*** Script Error: block did not return a value
*** Where: while
*** Stack: 

>> case [() 1]
*** Script Error: block did not return a value
*** Where: case
*** Stack:  
```

The culprit is `logic/true?` that has this line inside it:
https://github.com/red/red/blob/2417a84e2cefce5f365d6ae675be994e04328a3f/runtime/datatypes/logic.reds#L72

**To reproduce**
See above.

**Expected behavior**
I expect the behavior to be consistent across all the natives, either one way or another.

**Platform version**

`master`, 2417a84e



Comments:
--------------------------------------------------------------------------------

On 2020-05-31T03:08:19Z, greggirwin, commented:
<https://github.com/red/red/issues/4482#issuecomment-636413817>

    I wouldn't jump to change this too quickly. You have new doc strings in #4483, presuming a change to allow unset for all of them, but I'm not sure that's best. In R2, the `if/unless/not` error thus:
    ```
    >> if () []
    ** Script Error: if is missing its condition argument
    ** Near: if () []
    >> unless () []
    ** Script Error: unless is missing its condition argument
    ** Near: unless () []
    >> not ()
    ** Script Error: not is missing its value argument
    ** Near: not ()
    ```
    So `any/all` are different, while the others all error, which I think is OK. Having different errors is OK too, as they are specific to block/non-block scenarios.
    
    Unset is a strange beast, and we need to treat it as such. `Any/all` are different use cases for it, where all legitimate values have to be considered.

--------------------------------------------------------------------------------

On 2020-05-31T18:35:40Z, 9214, commented:
<https://github.com/red/red/issues/4482#issuecomment-636510354>

    @greggirwin no, not at all. #4483 merely casts in code what we reviewed so far in #4469; it can be refined as we proceed further, esp. in the light of this ticket, which I opened while working on #4484, which in turn proposes an alternative semantics described in https://github.com/red/red/issues/4469#issuecomment-635464683. Both PRs are meant for discussion and evaluation, nothing is set in stone.
    
    This is surely a place where we can apply the hard lessons of ornery error-throwing `money!`. I agree that `any` and `all` should permit `unset`, but that makes phrasing of their docstrings... non-trivial. The difference between `logic/false?` and `logic/true?` in runtime API is also worth reflecting upon.

--------------------------------------------------------------------------------

On 2020-05-31T19:22:05Z, hiiamboris, commented:
<https://github.com/red/red/issues/4482#issuecomment-636516147>

    https://github.com/red/red/blob/c2f0d8999dbd79ef458cfbe6e5d7c42f46d8b1fd/runtime/datatypes/logic.reds#L72
    This is a curious distinction indeed...

--------------------------------------------------------------------------------

On 2023-08-24T18:03:52Z, hiiamboris, commented:
<https://github.com/red/red/issues/4482#issuecomment-1692179040>

    Note:
    R2 allows unset for `all`/`any`, but not for `if`/`either`/`case`
    R3 allows it for `if`, `either`, `all`/`any`, but not for `case`
    Red allows it for `if`, `all`/`any` but not for `either`/`case`

