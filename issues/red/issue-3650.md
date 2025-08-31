
#3650: absolute accepts char! but should not?
================================================================================
Issue is open, was reported by gltewalt and has 12 comment(s).
[type.review]
<https://github.com/red/red/issues/3650>

`absolute` accepts `char!`, but negative values are not possible with `char!` arithmetic.

```red
>> help absolute
USAGE:
     ABSOLUTE value

DESCRIPTION:
     Returns the non-negative value.
     ABSOLUTE is an action! value.

ARGUMENTS:
     value        [number! char! pair! time!]

RETURNS:
     [number! char! pair! time!]
```

* Examples

```red
>> to integer! #"a" - #"a"
== 0

>> to integer! #"a" - #"b"
*** Math Error: math or number overflow
*** Where: -
*** Stack:
```

`absolute` can have no bearing since an error is thrown:

```red
>> absolute #"a" - #"b"
*** Math Error: math or number overflow
*** Where: -
*** Stack:

>> absolute to integer! #"a" - #"b"
*** Math Error: math or number overflow
*** Where: -
*** Stack:
```


**Expected behavior**

Expect that `absolute` not accept `char!`

**Platform version(please complete the following information):**
```
Red 0.6.4 for Windows built 6-Dec-2018/22:41:53-07:00 commit #1bdbdc2
```


Comments:
--------------------------------------------------------------------------------

On 2018-12-11T22:11:41Z, gltewalt, commented:
<https://github.com/red/red/issues/3650#issuecomment-446382103>

    Seems to be related to #2700

--------------------------------------------------------------------------------

On 2018-12-11T22:17:45Z, gltewalt, commented:
<https://github.com/red/red/issues/3650#issuecomment-446383784>

    Alternately, if negative values should be allowed, then Math Error will be a new issue.

--------------------------------------------------------------------------------

On 2018-12-11T22:59:15Z, meijeru, commented:
<https://github.com/red/red/issues/3650#issuecomment-446395260>

    absolute was introduced on char! to avoid a problem in mod. That could be solved differently if desired.

--------------------------------------------------------------------------------

On 2018-12-13T11:57:00Z, dockimbel, commented:
<https://github.com/red/red/issues/3650#issuecomment-446943178>

    I also think that it was a mistake to allow `absolute` on `char!` as it makes no sense. The `mod` issue should be resolved in a different way.

--------------------------------------------------------------------------------

On 2018-12-15T20:51:27Z, endo64, commented:
<https://github.com/red/red/issues/3650#issuecomment-447597034>

    Also `mod` and `modulo` accepts tuple and vector types, but they cannot work as `absolute` doesn't accept tuple and vector. And also this line `if (r: a % b) < 0 [r: r + b]` in `mod` errors as `<` don't accept tuple and vector.
    
    ```
    v1: make vector! [3 4 5]
    v2: make vector! [3 4 5]
    mod v1 v2
    ; *** Script Error: cannot compare make vector! [0 0 0] with 0
    ; *** Where: <
    
    modulo v1 v2
    ; *** Script Error: absolute does not allow vector! for its value argument
    ```

--------------------------------------------------------------------------------

On 2019-11-24T13:53:26Z, hiiamboris, commented:
<https://github.com/red/red/issues/3650#issuecomment-557890659>

    This should be linked to the main modulo talk https://github.com/red/red/issues/2433 where a solution is pending

