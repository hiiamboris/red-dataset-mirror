
#3675: [View] `to-image` can't shoot an image face
================================================================================
Issue is closed, was reported by hiiamboris and has 8 comment(s).
<https://github.com/red/red/issues/3675>

**Describe the bug**

? (to-image view/no-wait [image 50x50])
![](https://i.gyazo.com/f8f88a057aca1cffe4b298b634783bfa.png)
(below is the to-image result)

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 18-Dec-2018/23:37:37+03:00 commit #873a756
W7 x64
```



Comments:
--------------------------------------------------------------------------------

On 2018-12-21T20:20:56Z, meijeru, commented:
<https://github.com/red/red/issues/3675#issuecomment-449489135>

    Works on W10

--------------------------------------------------------------------------------

On 2018-12-21T22:45:58Z, hiiamboris, commented:
<https://github.com/red/red/issues/3675#issuecomment-449517024>

    Yes it is most likely W7-specific bug.

--------------------------------------------------------------------------------

On 2018-12-30T03:03:19Z, qtxie, commented:
<https://github.com/red/red/issues/3675#issuecomment-450535935>

    Was it fixed by this PR #3683?

--------------------------------------------------------------------------------

On 2018-12-30T12:56:53Z, hiiamboris, commented:
<https://github.com/red/red/issues/3675#issuecomment-450558981>

    Yeah, it works for me now.

