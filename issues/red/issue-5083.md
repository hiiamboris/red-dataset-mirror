
#5083: [View] Window opened in `on-down`/`on-up` gets reopened over and over
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5083>

**Describe the bug**

Two scripts, the only difference is `return`:
1. `view [base red black "1. click me" on-down [view [field blue green "2. close me"]] return text "3. try to close the window"]`
2. `view [base red black "1. click me" on-down [view [field blue green "2. close me"]] text "3. try to close the window"]`

| how both work: | |
|-|-|
|![](https://i.gyazo.com/f027c11b553c68c455f34f54c3ef91e4.gif) | ![](https://i.gyazo.com/5ef9675913cbf764f66b8d34ccfb682b.gif) |

**To reproduce**

Just follow the numbers 1,2,3.

**Expected behavior**

Window is not reopened, like in 2nd example.

**Platform version**
```
Red 0.6.4 for Windows built 17-Feb-2022/14:39:17+03:00  commit #c976906
```



Comments:
--------------------------------------------------------------------------------

On 2022-02-19T17:54:53Z, hiiamboris, commented:
<https://github.com/red/red/issues/5083#issuecomment-1046072092>

    Found it! Similar bug: https://github.com/red/red/issues/4384

--------------------------------------------------------------------------------

On 2022-02-19T18:26:39Z, hiiamboris, commented:
<https://github.com/red/red/issues/5083#issuecomment-1046077833>

    Similar scenario, `text` instead of `base` is even worse (can't be closed):
    `view [text 80x80 red black "1. click me" on-up [view [field blue green "2. close me"]]]`
    <img src=https://i.gyazo.com/8a8c633a738a706d499f17a29969c009.gif width=250></img>

--------------------------------------------------------------------------------

On 2022-02-20T03:12:14Z, qtxie, commented:
<https://github.com/red/red/issues/5083#issuecomment-1046150402>

    Why the `return` makes the difference? 😅 

