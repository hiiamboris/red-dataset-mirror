
#4378: make bitset! <float> gives strange result
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/4378>

**Describe the bug**
`make bitset! <float>` is not forbidden, but `charset <float>` _is_, which suggests that `make bitset! <float>` should be forbidden as well; in any case `make bitset! 1.0` is _not_ interpreted as `make bitset! 1` which should be reasonable, but gives an arbitrary result

**To reproduce**
```
>> charset 1
== make bitset! #{00}
>> charset 1.0
*** Script Error: charset does not allow float! for its spec argument
>> make bitset! 1.0
== make bitset! #{40}
```


**Expected behavior**
```
>> make bitset! 1.0
*** Script Error: cannot make/to bitset! from 1.0
```


**Platform version (please complete the following information)**
```
all
```



Comments:
--------------------------------------------------------------------------------

On 2020-04-03T15:52:32Z, 9214, commented:
<https://github.com/red/red/issues/4378#issuecomment-608518947>

    Strange..?
    ```red
    >> make bitset! 1.0
    == make bitset! #{40}
    >> make bitset! [1.0]
    == make bitset! #{40}
    >> make bitset! [1]
    == make bitset! #{40}
    ```

--------------------------------------------------------------------------------

On 2020-05-15T06:07:16Z, qtxie, commented:
<https://github.com/red/red/issues/4378#issuecomment-629047469>

    Or we convert the float! to integer!.
    ```
    >> make block! 1.0
    == []
    >> make vector! 1.0
    == make vector! [0]
    >> make string! 1.0
    == ""
    ```

--------------------------------------------------------------------------------

On 2020-05-15T08:09:16Z, meijeru, commented:
<https://github.com/red/red/issues/4378#issuecomment-629096033>

    @qxtie That is in line with the rest, yes.

