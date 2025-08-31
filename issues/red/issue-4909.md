
#4909: Help functions do not expect unset values
================================================================================
Issue is closed, was reported by hiiamboris and has 14 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/4909>

**Describe the bug**
```
>> unset 'a
>> o: object [unset a: 'a]

>> ? a
(huge dump of all words containing "a")         ;) expected A is unset! value
>> help a
(huge dump of all words containing "a")

>> ? o/a
*** Script Error: o/a has no value              ;) expected O/A is unset! value
*** Where: get
*** Stack: ? help-string  
>> help o/a
*** Script Error: o/a has no value
*** Where: get
*** Stack: help help-string  

>> ?? a
a: unset!

>> ?? o/a
o/a: *** Script Error: o/a has no value        ;) expected o/a: unset!
*** Where: get
*** Stack: ??  

>> source a
A is an unset! value, so source is not available.

>> source o/a
*** Script Error: o/a has no value            ;) expected as above
*** Where: get
*** Stack: source  
```

**Expected behavior**

See in comments above

**Platform version**
```
Red 0.6.4 for Windows built 12-May-2021/6:12:03+03:00  commit #cebd5b9
```



Comments:
--------------------------------------------------------------------------------

On 2021-06-01T17:01:14Z, greggirwin, commented:
<https://github.com/red/red/issues/4909#issuecomment-852289297>

    ```
    >> ? a
    (huge dump of all words containing "a")         ;) expected A is unset! value
    ```
    
    You expect the wrong thing here. Use `help` without any arg for usage.
    
    For the "has no value" problem, it's Red itself it seems, when the source is a path. R2 didn't support paths with `get`, but R3 handles it correctly with `get/any`. Maybe not a small fix in Red, because `interpreter/eval-path` doesn't have `/any` support it seems. `Get` could check for `/any`  and trap that error, which should be both quick and safe, but @dockimbel would be able to say for sure.
    
    Red:
    ```
    >> get/any 'o/a
    *** Script Error: o/a has no value
    *** Where: get
    *** Stack:  
    ```
    
    R3:
    ```
    >> get 'o/a
    ** Script error: o/a has no value
    ** Where: get
    ** Near: get 'o/a
    
    >> get/any 'o/a
    >>
    ```
    
    Help and ?? handle objects with unset values correctly.
    ```
    >> ? o
    O is an object! with the following words and values:
         a  unset!    
    >> ?? o
    o: make object! [
        a: unset
    ]
    ```
    

--------------------------------------------------------------------------------

On 2021-06-01T18:35:28Z, hiiamboris, commented:
<https://github.com/red/red/issues/4909#issuecomment-852355096>

    Thanks for digging in. Didn't occur to me that `? a` is a special case on which it is based.
    
    I've opened https://github.com/red/red/issues/4910 but why don't we use `:o/a` in the help system as a workaround for now?

--------------------------------------------------------------------------------

On 2021-06-01T21:07:33Z, greggirwin, commented:
<https://github.com/red/red/issues/4909#issuecomment-852445579>

    It's not clear to me at a glance that we _can_ work around it that way. Doing `? :o/a` passes `help` `unset!`, overriding the lit arg spec (not _sure_ that's by design). Once we have it as an arg, we're into literal indirection. 

--------------------------------------------------------------------------------

On 2021-06-02T06:12:56Z, hiiamboris, commented:
<https://github.com/red/red/issues/4909#issuecomment-852765148>

    Replacing `get/any path` with `do to get-path! path` I mean

--------------------------------------------------------------------------------

On 2021-06-02T18:19:20Z, greggirwin, commented:
<https://github.com/red/red/issues/4909#issuecomment-853277751>

    Let's see if #4910 can be prioritized, as that has a much broader benefit.

--------------------------------------------------------------------------------

On 2021-07-02T20:20:45Z, dockimbel, commented:
<https://github.com/red/red/issues/4909#issuecomment-873238315>

    For the record, now it outputs a more accurate message:
    ```
    >> get/any 'o/a
    *** Script Error: o is unset in path o/a
    *** Where: get
    *** Stack: 
    ```
    
    In the case:
    ```
    >> ? o/a
    *** Script Error: o/a has no value              ;) expected O/A is unset! value
    ```
    the expectation is wrong. "`is unset! value`" can only apply to a word or a proper value slot reference. In `o/a`, if `o` is unset or if it's a datatype that does not support a path syntax to reference a value, then the expected result cannot be `unset!` but it is undefined and outputting an error is the right thing to do then. R3 follow the same logic.

--------------------------------------------------------------------------------

On 2021-07-02T20:44:26Z, hiiamboris, commented:
<https://github.com/red/red/issues/4909#issuecomment-873247838>

    `o` was set in the above example, but I agree it's fixed now

