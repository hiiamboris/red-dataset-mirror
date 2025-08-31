
#4507: Slow `dump-reaction` output when one of the target objects is big
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/4507>

**Describe the bug**
```
v: view/no-wait compose/deep [panel [b: image 500x500 (make image! 2000x2000)]]
react/link func [v b] [? b/data] [v b]
clock [dump-reactions]
```
Output:
```
4787 ms	[dump-reactions]
```

Bug source: https://github.com/red/red/blob/459046699f88e3bd97e835ece2ea4c3fe820d059/environment/reactivity.red#L192

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 28-May-2020/17:51:04+03:00 commit #36857eb
```



Comments:
--------------------------------------------------------------------------------

On 2020-07-21T21:51:40Z, hiiamboris, commented:
<https://github.com/red/red/issues/4507#issuecomment-662125231>

    View-less variant for tests:
    ```
    r2: make r1: make reactor! [i: make image! 2000x2000] []
    react/link func [a b] [b/i] [r1 r2]
    clock [dump-reactions]
    ```

