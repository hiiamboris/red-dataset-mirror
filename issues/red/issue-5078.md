
#5078: Console truncates tags
================================================================================
Issue is closed, was reported by hiiamboris and has 14 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5078>

**Describe the bug**
GUI:
![](https://i.gyazo.com/610d5660f8da7b1528c21272d24a66a4.png)
CLI:
![](https://i.gyazo.com/778319f607fd7e0d858e4535984a3e9a.png)

**To reproduce**

type `loop 100 [append [] <abcdefghi>]`

**Expected behavior**

Ellipsis at the end.

**Platform version**
```
Red 0.6.4 for Windows built 25-Jan-2022/14:48:41+03:00  commit #dbbe6e0
```



Comments:
--------------------------------------------------------------------------------

On 2022-02-16T18:19:06Z, dockimbel, commented:
<https://github.com/red/red/issues/5078#issuecomment-1041974589>

    ```
    >> loop 100 [append [] <abcdefghi>]
    == [<abcdefghi> <abcdefghi> <abcdefghi> <abcdefghi> <abcdefghi> ...
    ```
    
    It works as it should. Can you explain what is the issue?

--------------------------------------------------------------------------------

On 2022-02-16T18:21:47Z, hiiamboris, commented:
<https://github.com/red/red/issues/5078#issuecomment-1041979313>

    Strange. Maybe my version?

--------------------------------------------------------------------------------

On 2022-02-16T18:26:12Z, hiiamboris, commented:
<https://github.com/red/red/issues/5078#issuecomment-1041986898>

    nope, tried the latest..
    
    on GUI console:
    ```
    >> system/console/size
    == 77x36
    ```
    on CLI:
    ```
    >> system/console/size
    == 192x46
    ```
    some sizes may not trigger it

--------------------------------------------------------------------------------

On 2022-02-16T18:29:06Z, dockimbel, commented:
<https://github.com/red/red/issues/5078#issuecomment-1041991622>

    Got it:
    ```
    >> system/console/size
    == 77x43
    >> loop 12 [append [] <abcdefghi>]
    == [<abcdefghi> <abcdefghi> <abcdefghi> <abcdefghi> <abcdefghi> ]
    ```
    
    Smells like a modulo issue.

--------------------------------------------------------------------------------

On 2022-02-16T18:44:06Z, dockimbel, commented:
<https://github.com/red/red/issues/5078#issuecomment-1042015067>

    There are two issues actually: the lack of ellipsis and the ending `]`.

--------------------------------------------------------------------------------

On 2022-02-16T19:05:30Z, hiiamboris, commented:
<https://github.com/red/red/issues/5078#issuecomment-1042047402>

    ```
    >> mold/part loop 100 [append [] <abcdefghi>] 55
    == {[<abcdefghi> <abcdefghi> <abcdefghi> <abcdefghi> <abcde}
    >> mold/part loop 100 [append [] <abcdefghi>] 54
    == {[<abcdefghi> <abcdefghi> <abcdefghi> <abcdefghi> <abcd}
    >> mold/part loop 100 [append [] <abcdefghi>] 53
    == {[<abcdefghi> <abcdefghi> <abcdefghi> <abcdefghi> ]}
    ```

--------------------------------------------------------------------------------

On 2022-02-16T19:07:12Z, dockimbel, commented:
<https://github.com/red/red/issues/5078#issuecomment-1042050155>

    Yes, `mold/part` and `form/part` are inserting the closing bracket even if the part limit has been reached.

