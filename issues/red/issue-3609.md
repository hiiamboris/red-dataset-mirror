
#3609: FIND/MATCH/REVERSE is not working
================================================================================
Issue is closed, was reported by Oldes and has 10 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/3609>

**Expected behavior**
This is how it was working in Rebol2:
```
>> find/reverse/match tail "abc" "abc"
== ""
```
**Actual behavior**
```
>> find/reverse/match tail "abc" "abc"
== none
```


Comments:
--------------------------------------------------------------------------------

On 2018-11-23T07:13:20Z, endo64, commented:
<https://github.com/red/red/issues/3609#issuecomment-441168361>

    It should at least able to find "abc" in the middle
    
    ```
    >> find/reverse/match probe back back back tail "abcabcabc" "abc"
    "abc"
    == none
    ```
    
    

--------------------------------------------------------------------------------

On 2018-11-23T08:53:54Z, qtxie, commented:
<https://github.com/red/red/issues/3609#issuecomment-441183373>

    I don't think Rebol2 support it. It works the same as `/tail` in Rebol2:
    ```
    >> find/reverse/match tail "abcd" "abc"
    == "d"
    >> find/reverse/tail tail "abcd" "abc"
    == "d"
    ```

--------------------------------------------------------------------------------

On 2018-11-23T11:25:58Z, endo64, commented:
<https://github.com/red/red/issues/3609#issuecomment-441217115>

    @qtxie also check this on R2, `/match` differ with `/tail`. But not sure if it is consistent:
    
    ```
    >> find/reverse/match tail "abcd" "b"
    == none
    >> find/reverse/tail tail "abcd" "b"
    == "cd"
    ```

--------------------------------------------------------------------------------

On 2018-11-23T23:37:56Z, greggirwin, commented:
<https://github.com/red/red/issues/3609#issuecomment-441329980>

    `Find` is worthy of its own docs and many examples. I imagine the community resources cover it to at least some extent, but don't have time to look at them right now.

--------------------------------------------------------------------------------

On 2018-12-29T09:07:44Z, dockimbel, commented:
<https://github.com/red/red/issues/3609#issuecomment-450477886>

    `find/match/reverse` should always return `none` in Redbol, because those modes are incompatible. See my explanations [there](https://github.com/red/red/issues/3339#issuecomment-450477223).
    
    @Oldes The above behavior of Rebol2 looks like a bug to me, that occurs when using a series for the pattern to search:
    ```
    find/reverse/match tail "abc" "abc"
    == ""
    find/reverse/match tail "abc" #"b"
    == none
    ```
    As you can see, the right result (`none`) is returned when passing a character instead of a string as argument.
    
    In R3, this bug has been fixed:
    ```
    find/reverse/match tail "abc" "abc"
    == none
    ```
    
    @qtxie Please revert your changes that are covering this ticket.

