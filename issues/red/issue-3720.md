
#3720: hash! doesn't accept set-path notation (apart from numeric indexes)
================================================================================
Issue is closed, was reported by hiiamboris and has 22 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/3720>

**Describe the bug**

```
>> x: make hash! [a: 1]
== make hash! [a: 1]
>> x/a: 2
*** Script Error: cannot set none in path x/a:
*** Where: set-path
*** Stack: 
```

**Expected behavior**

Same works for map! and block!:
```
>> x: make block! [a: 1]
== [a: 1]
>> x/a: 2
== 2
>> ? x
X is a block! value.  length: 2  [a: 2]

>> x: make map! [a: 1]
== #(
    a: 1
)
>> x/a: 2
== 2
>> ? x
X is a map! with the following words and values:
     a  integer!      2
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 5-Jan-2019/4:37:59+03:00 commit #1c0642e
```



Comments:
--------------------------------------------------------------------------------

On 2019-01-09T12:16:16Z, meijeru, commented:
<https://github.com/red/red/issues/3720#issuecomment-452676561>

    This is not true when the hash component to be selected is indicated by a `word!` instead of a `set-word!`.
    ```
    >> x: make hash! [a 1]
    == make hash! [a 1]
    >> x/a
    == 1
    >> x/a: 2
    == 2
    >> x
    == make hash! [a 2]
    ```
    The same issue is present for the use of `select/put`
    ```
    >> x: make hash! [a: 1]
    == make hash! [a: 1]
    >> select x 'a
    == none
    >> put x 'a 2
    == 2
    >> x
    == make hash! [a: 1 a 2]
    ```
    In other words, ONLY for evaluating `x/a` is no difference made between `a` and `a:`. In all other cases, `a` and `a:` are treated as different elements.

--------------------------------------------------------------------------------

On 2019-01-09T13:24:01Z, endo64, commented:
<https://github.com/red/red/issues/3720#issuecomment-452694976>

    As per @meijeru 's comment, this one works:
    
    ```
    >> x: make hash! [a: 1]
    >> x/(quote a:): 2
    >> x
    == make hash! [a: 2]
    ```

--------------------------------------------------------------------------------

On 2019-01-09T13:29:13Z, meijeru, commented:
<https://github.com/red/red/issues/3720#issuecomment-452696523>

    The `hash!` type is the only one with this behaviour. Curiously, `hash!` inherits from `block!`  and it is not immediately obvious where the subtle difference is introduced.

--------------------------------------------------------------------------------

On 2019-01-11T01:47:30Z, qtxie, commented:
<https://github.com/red/red/issues/3720#issuecomment-453338989>

    FYI
    In Rebol2:
    ```
    >>  x: make block! [a: 1]
    == [a: 1]
    >> x/a
    ** Script Error: Invalid path value: a
    ** Near: x/a
    >> x/a: 2
    ** Script Error: Invalid path value: a
    ** Near: x/a: 2
    ```
    In Rebol3: 
    ```
    >>  x: make block! [a: 1]
    == [a: 1]
    >> x/a
    == 1
    >> x/a: 2
    == 2
    ```
    I'm not sure which is better.

--------------------------------------------------------------------------------

On 2019-01-11T05:19:52Z, greggirwin, commented:
<https://github.com/red/red/issues/3720#issuecomment-453381869>

    It seems like it should work to me, unless @dockimbel made it an intentional design choice, in which case he can tell us the reason.

--------------------------------------------------------------------------------

On 2019-01-14T06:43:13Z, dockimbel, commented:
<https://github.com/red/red/issues/3720#issuecomment-453913177>

    Seems like an implementation issue in hash! to me. I agree on the need for consistency between `block!` and `hash!`, but `map!` has specific semantics, so cannot be compared here with the two others (maps will normalize words to set-words):
    ```
    >> #(a 1)
    == #(
        a: 1
    )
    ```
    
    With regard to the path access and the relaxed behavior, keep in mind that being able to select accurately words with the right type is then lost using paths:
    ```
    >> x: [a 1 a: 2 'a 3]
    == [a 1 a: 2 'a 3]
    >> w: 'a
    == a
    >> x/:w
    == 1
    >> w: quote a:
    == a:
    >> x/:w
    == 1
    >> w: quote 'a
    == 'a
    >> x/:w
    == 1
    ```
    One would need to use `select/case` in order to distinguish words by type in such case. `/case` uses a stricter comparison mode (`strict-equal?`), so will do the job here. Though the `/case` naming here becomes unrelated and a `/strict` refinement would be better. So this is an unresolved design point for now, the different options are:
    
    1. Keep using `/case` to cover case-sensitive search + strictness.
    2. Rename `/case` to `/strict` and loose a bit of consistency with other functions' `/case` refinement.
    3. Keep `/case` and add `/strict`, and clearly separate the two modes, though that would add a new refinement to an already overloaded function spec.

--------------------------------------------------------------------------------

On 2019-01-14T07:00:04Z, hiiamboris, commented:
<https://github.com/red/red/issues/3720#issuecomment-453915311>

    @dockimbel looks like `/case` isn't even needed:
    ```
    >> x: [a 1 a: 2 'a 3]
    == [a 1 a: 2 'a 3]
    >> select/same x quote a:
    == 2
    >> select/same x quote 'a
    == 3
    ```

--------------------------------------------------------------------------------

On 2019-01-14T11:44:19Z, qtxie, commented:
<https://github.com/red/red/issues/3720#issuecomment-453978125>

    @hiiamboris The `/case` refinement is mainly for this case:
    ```
    select/case ["abc" 1 "Abc" 2 "ABC" 3] "Abc"
    ```

--------------------------------------------------------------------------------

On 2019-09-09T16:43:24Z, dockimbel, commented:
<https://github.com/red/red/issues/3720#issuecomment-529565898>

    @hiiamboris Indeed, I forgot we added `/same` to `select`.
    
    @qtxie Red relies on the same behavior as R3 for this case. Can you implement it in `hash!`?

--------------------------------------------------------------------------------

On 2019-09-10T09:15:39Z, qtxie, commented:
<https://github.com/red/red/issues/3720#issuecomment-529848476>

    @dockimbel `hash!` support same already.
    ```
    >> x: make hash! [a 1 a: 2 'a 3]
    == make hash! [a 1 a: 2 'a 3]
    >> query quit quit-return quote
    >> select/same x quote a:
    == 2
    >> select/same x quote 'a
    == 3
    ```

--------------------------------------------------------------------------------

On 2019-09-10T11:48:31Z, dockimbel, commented:
<https://github.com/red/red/issues/3720#issuecomment-529898440>

    @qtxie I meant the behavior for paths on blocks described at the beginning of the ticket. Can we easily support it for hash too?

