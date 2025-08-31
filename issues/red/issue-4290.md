
#4290: [Console] `?` is overworking a bit with long strings
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[type.bug]
<https://github.com/red/red/issues/4290>

**Describe the bug**

`?` does not check the output length of `help-string`, neither `help-string` checks it's own output length. So, given a very long string it hangs console for minutes or crashes.

**To reproduce**

Do this in GUI console:
```
s: form draw 1920x1080 []
? s
```
It's unresponsive for ~2 min, after which becomes unusable or crashes.

**Expected behavior**

Output should be truncated to a sane length.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 31-Jan-2020/17:12:41+03:00 commit #414cdb3
```



Comments:
--------------------------------------------------------------------------------

On 2020-02-06T18:26:10Z, greggirwin, commented:
<https://github.com/red/red/issues/4290#issuecomment-583043515>

    Good catch.

--------------------------------------------------------------------------------

On 2020-07-30T12:06:10Z, 9214, commented:
<https://github.com/red/red/issues/4290#issuecomment-666324898>

    @hiiamboris I propose to close this ticket in favor of #4464, which has a bit more contextual info to address the underlying problem.

--------------------------------------------------------------------------------

On 2020-07-30T17:53:40Z, hiiamboris, commented:
<https://github.com/red/red/issues/4290#issuecomment-666562985>

    I don't know. Technically fix for either of these issues does not guarantee that another is solved. Let @greggirwin decide. He's probably fixed it locally anyway ;) 

