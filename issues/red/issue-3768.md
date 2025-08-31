
#3768: sort with comparator function returning number sorts incorrectly
================================================================================
Issue is closed, was reported by endo64 and has 12 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/3768>

**Describe the bug**
When comparator function returns a positive number (`integer!` or `float!`) `sort` treats it as `false`, and when the returned number is negative `sort` treated it as `true`. It should be the opposite.

**To reproduce**
```
>> sort/compare [1 2 3 4 5 6] func [a b] [5]
== [1 2 3 4 5 6]
>> sort/compare [1 2 3 4 5 6] func [a b] [5.3]
== [1 2 3 4 5 6]
>> sort/compare [1 2 3 4 5 6] func [a b] [-5]
== [6 5 4 3 2 1]
```

**Expected behavior**
Return value should be `[6 5 4 3 2 1]` as in R3 (note that R2's result is complete mess)

**Platform version**
```
Red 0.6.4 for Windows built 30-Jan-2019/9:03:13+03:00 commit #25ef631
```



Comments:
--------------------------------------------------------------------------------

On 2019-02-02T15:51:44Z, hiiamboris, commented:
<https://github.com/red/red/issues/3768#issuecomment-459975579>

    :point_up: [February 2, 2019 6:27 PM](https://gitter.im/red/bugs?at=5c55b6e054f21a71a1e84e42) discussion

--------------------------------------------------------------------------------

On 2019-10-02T10:33:22Z, dockimbel, commented:
<https://github.com/red/red/issues/3768#issuecomment-537434646>

    There is something wrong with the `compare` function return value processing now:
    ```
    >> sort/compare [1 2] func [a b] [a < b]
    == [2 1]
    >> sort/compare [1 2 3 4 5 6] func [a b] [a < b]
    == [6 5 4 3 2 1]
    ```
    
    We require `a` to be less than `b`, so the input series should be left unchanged as they are already rightly sorted (same as in Rebol).

--------------------------------------------------------------------------------

On 2019-10-02T11:03:47Z, hiiamboris, commented:
<https://github.com/red/red/issues/3768#issuecomment-537443424>

    Looks like we all read the intent of the compare func differently ☺
    We with @endo64 are apparently reading it as "swap if result is true or greater than zero". While you are reading it as "don't touch it if it's true or greater than zero". Perhaps this should be documented in the `sort` docstrings.

--------------------------------------------------------------------------------

On 2019-10-02T11:42:30Z, dockimbel, commented:
<https://github.com/red/red/issues/3768#issuecomment-537454229>

    The past fix was too broad, it should have changed only the behavior when numbers are returned by `compare` function.
    
    @hiiamboris After reverting partially the previous fix, it now works identically to R3, and uses the same rule as in all Rebol versions: swap on `false` (or greater than zero), which is the intuitive way (maybe more visible if I rename the local words):
    ```
    >> sort/compare [1 4 3 5 2] func [left right][left < right]
    == [1 2 3 4 5]
    >> sort/compare [1 4 3 5 2] func [left right][left > right]
    == [5 4 3 2 1]
    ```
    The comparison function expresses a constraint on a *couple* of values. If that constraint is satisfied, no change occur, if it's not, value positions are swapped.

--------------------------------------------------------------------------------

On 2019-10-02T15:25:42Z, endo64, commented:
<https://github.com/red/red/issues/3768#issuecomment-537545891>

     @dockimbel Did you fix it on another branch? I just pulled the latest version, my test results are different:
    
    ```
    >> sort/compare [1 2] func [a b] [a < b]
    == [2 1]
    >> sort/compare [1 4 3 5 2] func [left right][left < right]
    == [5 4 3 2 1]
    >> sort/compare [1 4 3 5 2] func [left right][left > right]
    == [1 2 3 4 5]
    ```

--------------------------------------------------------------------------------

On 2019-10-02T15:54:48Z, dockimbel, commented:
<https://github.com/red/red/issues/3768#issuecomment-537559253>

    It's on the `fast-lexer` branch.

