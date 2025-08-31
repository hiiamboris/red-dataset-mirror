
#4312: [VID] can't use `draw` inside the `do` block
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[status.resolved]
<https://github.com/red/red/issues/4312>

**Describe the bug**

```
view [do [? draw]]
```
says:
```
DRAW is a none! value: none
```
expected:
```
USAGE:
     DRAW image cmd

DESCRIPTION: 
     Draws scalable vector graphics to an image. 
     DRAW is a function! value.
...
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 24-Feb-2020/18:16:17+03:00
```



Comments:
--------------------------------------------------------------------------------

On 2020-02-29T14:07:32Z, 9214, commented:
<https://github.com/red/red/issues/4312#issuecomment-592949057>

    `do` block is bound to window's face in which `draw` facet is `none`.
    ```red
    view [do [? (context? 'draw)]]
    ```
    ```red
    view [do [? system/words/draw]]
    ```

--------------------------------------------------------------------------------

On 2020-02-29T14:28:57Z, hiiamboris, commented:
<https://github.com/red/red/issues/4312#issuecomment-592950972>

    Ah! Makes sense.

