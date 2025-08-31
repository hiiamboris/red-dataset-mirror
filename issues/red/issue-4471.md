
#4471: Initial reaction is triggered once for every occurrence of the same path
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4471>

**Describe the bug**

See the title. This makes (sometimes complex) face initialization code fire multiple times resulting in slow GUI startup. Can be worked around, but since `react` also has no locals, it becomes ugly.
```
r: reactor [x: 1]
react [all [:r/x integer? r/x probe r/x]]
r/x: 2
r/x: 3
```
Output is:
```
1
1
1
2
3
```

**Expected behavior**
```
1
2
3
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 27-May-2020/16:53:12+03:00 commit #cfb6d30
```



Comments:
--------------------------------------------------------------------------------

On 2020-06-09T16:07:04Z, hiiamboris, commented:
<https://github.com/red/red/issues/4471#issuecomment-641404099>

    Same problem exists for react/link:
    ```
    >> a: make face! [] ()
    >> b: make face! [] ()
    >> react/link func [a b] [print "CALLED" a/text b/text b/text b/text] [a b]
    CALLED
    CALLED
    CALLED
    CALLED
    == func [a b][print "CALLED" a/text b/text b/text b/text]
    ```
    Expected: triggered only once

