
#3583: sort/skip does not work on binary! values
================================================================================
Issue is closed, was reported by meijeru and has 20 comment(s).
[type.review]
<https://github.com/red/red/issues/3583>

**Describe the bug**
`sort` is defined for all `series!` values except `image!`. Without `/skip` it works on `binary!` values. However, with `/skip` it does not, and this is inconvenient.
**To Reproduce**
```
>> sort #{04030201}
== #{01020304}
>> sort/skip #{00000004000000030000000200000001} 4
== #{00000004000000030000000200000001}
```
**Expected behavior**
```
>> sort/skip #{00000004000000030000000200000001} 4
== #{00000001000000020000000300000004}
```
**Platform version(please complete the following information):**
```
all
```


Comments:
--------------------------------------------------------------------------------

On 2018-11-09T13:40:39Z, meijeru, commented:
<https://github.com/red/red/issues/3583#issuecomment-437362424>

    It *does*  work with explicit `compare` function and `/all`
    ```
    >> sort/skip/all/compare #{00000004000000030000000200000001} 4 func [a b][a < b]
    == #{00000001000000020000000300000004}
    ```
    but why it does not work straight away I don't know.

--------------------------------------------------------------------------------

On 2018-11-10T03:24:31Z, qtxie, commented:
<https://github.com/red/red/issues/3583#issuecomment-437554584>

    sort/skip compares the first element.
    ```
    >> sort/skip [0 0 0 4 0 0 0 3 0 0 0 2 0 0 0 1] 4
    == [0 0 0 4 0 0 0 3 0 0 0 2 0 0 0 1]
    >> sort/skip #{04000000030000000200000001000000} 4
    == #{01000000020000000300000004000000}
    ```

--------------------------------------------------------------------------------

On 2018-11-11T18:47:25Z, meijeru, commented:
<https://github.com/red/red/issues/3583#issuecomment-437694314>

    If that is a feature rather than a bug, this issue can be closed, especially since a workaround exists, as indicated.

--------------------------------------------------------------------------------

On 2018-11-11T20:07:51Z, endo64, commented:
<https://github.com/red/red/issues/3583#issuecomment-437700394>

    This explains the feature:
    
    ```
    >> sort/skip/compare [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16] 4 func [a b] [probe reduce [a b] 0]
    [5 1]
    [9 5]
    [13 9]
    == [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16]
    
    >> sort/skip/compare/all [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16] 4 func [a b] [probe reduce [a b] 0]
    [[5 6 7 8] [1 2 3 4]]
    [[9 10 11 12] [5 6 7 8]]
    [[13 14 15 16] [9 10 11 12]]
    == [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16]
    ```

--------------------------------------------------------------------------------

On 2018-11-11T20:48:32Z, meijeru, commented:
<https://github.com/red/red/issues/3583#issuecomment-437703453>

    Very instructive! But, since `f [a b][a < b]` is - as it were - the default comparison function, my workaround should work with `/all` and *without*  `/compare` -- only it doesn't!

--------------------------------------------------------------------------------

On 2018-11-11T21:37:16Z, hiiamboris, commented:
<https://github.com/red/red/issues/3583#issuecomment-437707304>

    Yep, I've also discovered the default sorting function is kinda lazy - it only takes the 1st byte into account:
    ```
    >> sort/skip/all #{00110000} 2
    == #{00110000}
    >> sort/skip/all/compare #{00110000} 2 func [a b] [a < b]
    == #{00000011}
    ```

--------------------------------------------------------------------------------

On 2018-11-12T02:44:27Z, qtxie, commented:
<https://github.com/red/red/issues/3583#issuecomment-437735216>

    Another way to choose which element to be compared:
    ```
    >> sort/skip/compare [0 0 0 4 0 0 0 3 0 0 0 2 0 0 0 1] 4 4
    == [0 0 0 1 0 0 0 2 0 0 0 3 0 0 0 4]
    >> sort/skip/compare [0 0 4 0 0 0 3 0 0 0 2 0 0 0 1 0] 4 3
    == [0 0 1 0 0 0 2 0 0 0 3 0 0 0 4 0]
    ```

--------------------------------------------------------------------------------

On 2018-11-12T06:33:52Z, 9214, commented:
<https://github.com/red/red/issues/3583#issuecomment-437771819>

    @qtxie except that it doesn't work with `binary!`:
    ```red
    >> sort/skip/compare #{00000004000000030000000200000001} 4 4
    == #{00000004000000030000000200000001}
    ```

--------------------------------------------------------------------------------

On 2018-11-12T07:44:24Z, meijeru, commented:
<https://github.com/red/red/issues/3583#issuecomment-437785702>

    Sort on binary! is inherited from string! and on string! it does not work either! So /skip in combination with /all needs serious revision.

--------------------------------------------------------------------------------

On 2018-11-12T08:33:56Z, qtxie, commented:
<https://github.com/red/red/issues/3583#issuecomment-437797374>

    @9214 Oops... :sweat: 
    @meijeru Yes. When using `/all`, the default comparison function should compare all the fields rather than the first one. The implementation is missing in the codebase.

