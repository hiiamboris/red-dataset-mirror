
#4836: Parse's `change` is inexplicably slow
================================================================================
Issue is open, was reported by hiiamboris and has 6 comment(s).
[type.bug]
<https://github.com/red/red/issues/4836>

**Describe the bug**

Given this code:
```
Red []
s4: copy s3: copy s2: copy s1: append/dup "" "0" 500'000
probe dt [parse s1 [any change skip #"1"]]
probe dt [parse s2 [while change skip ""]]
probe dt [parse s3 [while remove skip]]
probe dt [parse s4 [any [s: skip (change s #"1")]]]
probe empty? s2
probe empty? s3
```
`s1` and `s4` are expected to take O(n) time
`s2` and `s3` - O(n^2) time

What actually happens is that `s1` takes much more than O(n^2):
```
0:00:14.621
0:00:03.68974
0:00:03.82039
0:00:00.385983
true
true
```

**Expected behavior**

`s1` case should take O(n) time

**Platform version**
```
Red 0.6.4 for Windows built 16-Feb-2021/11:41:34+03:00 commit #0187423
```



Comments:
--------------------------------------------------------------------------------

On 2021-02-27T19:29:13Z, greggirwin, commented:
<https://github.com/red/red/issues/4836#issuecomment-787123294>

    Just a note that using `only` has no effect. Same results.

--------------------------------------------------------------------------------

On 2021-02-27T19:37:53Z, greggirwin, commented:
<https://github.com/red/red/issues/4836#issuecomment-787124455>

    For comparison:
    ```
    s6: copy s5: copy append/dup "" "0" 500'000
    probe dt [p: s5  forall p [change p #"1"]]
    probe dt [p: s6  while [not tail? p] [change p #"1" p: next p]]
    ```
    
    ```
    0:00:00.130035
    0:00:00.357997
    ```

--------------------------------------------------------------------------------

On 2021-02-27T20:10:57Z, hiiamboris, commented:
<https://github.com/red/red/issues/4836#issuecomment-787128573>

    https://github.com/red/red/issues/4840#issuecomment-787128288 can be the source of the issue

