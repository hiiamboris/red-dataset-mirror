
#4839: Rich-text's `on-deep-change` does not detect `text` facet changes
================================================================================
Issue is closed, was reported by hiiamboris and has 10 comment(s).
[status.built] [GUI]
<https://github.com/red/red/issues/4839>

**Describe the bug**
```
>> r1: rtd-layout [""]
>> r2: rtd-layout [""]
>> r1/text: "abcd"
>> append r2/text "abcd"
>> size-text r1
== 26x16
>> size-text r2
== 0x16       ;) WRONG
```

**To reproduce**
```
r1: rtd-layout [""]
r2: rtd-layout [""]
r1/text: "abcd"
append r2/text "abcd"
size-text r1
size-text r2
```

**Expected behavior**

26x16 both

**Platform version**
```
Red 0.6.4 for Windows built 16-Feb-2021/11:41:34+03:00 commit #0187423
```



Comments:
--------------------------------------------------------------------------------

On 2021-03-02T07:42:14Z, qtxie, commented:
<https://github.com/red/red/issues/4839#issuecomment-788692557>

    Cannot reproduce it. I got the right results.

--------------------------------------------------------------------------------

On 2021-03-02T09:53:10Z, hiiamboris, commented:
<https://github.com/red/red/issues/4839#issuecomment-788778721>

    OK maybe I messed up the example. But:
    ```
    >> size-text r2
    == 25x15
    >> append r2/text "qq"
    == "abcdqq"
    >> size-text r2
    == 25x15
    >> append r2/text "www"
    == "abcdqqwww"
    >> size-text r2
    == 25x15
    ```

--------------------------------------------------------------------------------

On 2021-03-02T09:54:26Z, hiiamboris, commented:
<https://github.com/red/red/issues/4839#issuecomment-788779569>

    What was missing in the test snippet is an initial size-text:
    ```
    >> r2: rtd-layout [""]
    >> size-text r2           ;) <-- this one
    == 0x15
    >> append r2/text "abcd"
    == "abcd"
    >> size-text r2
    == 0x15
    ```

--------------------------------------------------------------------------------

On 2021-03-02T11:45:20Z, qtxie, commented:
<https://github.com/red/red/issues/4839#issuecomment-788848494>

    ```
    >> r2/state
    == none
    ```
    `Face/state` is none, `on-face-deep-change*` will do nothing in this case.

--------------------------------------------------------------------------------

On 2021-03-02T12:02:07Z, qtxie, commented:
<https://github.com/red/red/issues/4839#issuecomment-788859255>

    I made some changes in `size-text` to support it.

