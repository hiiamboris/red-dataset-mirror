
#4221: [View] Screenshots do not contain layered (alpha-enabled) windows
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
<https://github.com/red/red/issues/4221>

This concerns Windows OS only.

**Describe the bug**

Alpha-enabled windows do not appear on screenshots (`to-image system/view/screens/1`) at all

I've been aware of the bug for a long time. Many widely known screen grabbers contain the same flaw for years but are too busy with PR to notice it. Turns out the solution is as simple as adding a CAPTUREBLT flag to BitBlt.




