
#3659: treatment of unset value by reduce and compose is different
================================================================================
Issue is closed, was reported by meijeru and has 18 comment(s).
<https://github.com/red/red/issues/3659>

**Describe the bug**
`reduce` accepts `any-type!` i.e. including `unset!` and `compose` accepts only `default!` i.e. without `unset!`

**To reproduce**
>> type? reduce ()
== unset!
>> type? compose ()
*** Script Error: compose does not allow unset! for its value argument

**Expected behavior**
either `reduce` refuses `unset!` or `compose` accepts `unset!`

**Platform version (please complete the following information)**
```
Presumably all
```



Comments:
--------------------------------------------------------------------------------

On 2018-12-12T21:03:39Z, greggirwin, commented:
<https://github.com/red/red/issues/3659#issuecomment-446742930>

    I don't know why `reduce` was widened to accept `unset!`. It should be easy enough to change `compose`'s spec to `[any-type!]`, as it looks like the evaluation would be the same.

--------------------------------------------------------------------------------

On 2018-12-13T11:31:28Z, dockimbel, commented:
<https://github.com/red/red/issues/3659#issuecomment-446936564>

    I think `compose` should only accept `block!` as its first argument, as does the docstring imply. 
    
    In Red, `reduce` currently acts like `do` for non-block arguments. Whether we'll keep or not this behavior in 1.0 is not decided yet.

--------------------------------------------------------------------------------

On 2018-12-15T00:01:19Z, endo64, commented:
<https://github.com/red/red/issues/3659#issuecomment-447514211>

    Compose accepts any-value! in both R2 & R3, would it better to be compatible with R2 & R3? Though I don't think it would lead much inconsistency if we change it to block!

--------------------------------------------------------------------------------

On 2018-12-15T19:16:06Z, greggirwin, commented:
<https://github.com/red/red/issues/3659#issuecomment-447591362>

    I vote for restricting `compose` to blocks, unless there's a compelling argument (which I can't think of). 

--------------------------------------------------------------------------------

On 2018-12-15T19:37:28Z, 9214, commented:
<https://github.com/red/red/issues/3659#issuecomment-447592697>

    > a compelling argument
    
    Function composition (no pun intended) and consistency. `reduce` acts like `do` for non-blocks - a feature that I used a couple of times in function chaning; same goes for `compose` - it acts like `do` for non-blocks. The only difference is `unset` treatment. Another argument is compatability, which @endo64 already mentioned.
    
    And, on the contrary, I don't find "restrict `compose` to `block!` because docstring says so" argument compelling at all.

--------------------------------------------------------------------------------

On 2018-12-15T20:36:43Z, greggirwin, commented:
<https://github.com/red/red/issues/3659#issuecomment-447596190>

    > And, on the contrary, I don't find "restrict compose to block! because docstring says so" argument compelling at all.
    
    This is where we need to think in terms of intent, and humans. Let's go Rich Hickey for a moment. 
    ```
    compose
    v.	To make up the constituent parts of; constitute or form: an exhibit 
            composed of French paintings; the many ethnic groups that compose 
            our nation. See Usage Note at comprise.
    v.	To make or create by putting together parts or elements.
    ```
    
    The name itself implies the intent. `Reduce` is a bit trickier in that regard, as to whether it should support non-block values. But these are different functions, and if it makes sense for `reduce` to support non-block values, that doesn't mean `compose` has to. It isn't any less consistent than `if` vs `all` vs `load` supporting different args types that are evaluated differently.

--------------------------------------------------------------------------------

On 2018-12-31T23:56:29Z, greggirwin, commented:
<https://github.com/red/red/issues/3659#issuecomment-450699995>

    If there's no further comment on this, I'm going to close it.

--------------------------------------------------------------------------------

On 2019-01-01T18:22:29Z, endo64, commented:
<https://github.com/red/red/issues/3659#issuecomment-450748031>

    So the decision is restricting compose to blocks?

--------------------------------------------------------------------------------

On 2019-01-02T01:17:47Z, greggirwin, commented:
<https://github.com/red/red/issues/3659#issuecomment-450770971>

    Yes.

