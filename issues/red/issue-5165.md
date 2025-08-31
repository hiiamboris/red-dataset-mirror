
#5165: [GTK] `caret-to-offset` is half working
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [GUI]
<https://github.com/red/red/issues/5165>

**Describe the bug**

On W10 it's possible to draw a caret over character by measuring it's size using `caret-to-offset`:
```
>> r: rtd-layout ["abc"]
>> (caret-to-offset/lower r 2) - (caret-to-offset r 2)
== 7x16
```
On GTK the same code returns `0x0`

**Expected behavior**

Same on all platforms.

**Platform version**
```
Red 0.6.4 for Linux built 16-Jun-2022/5:23:20+03:00  commit #15b93af
```



Comments:
--------------------------------------------------------------------------------

On 2022-07-19T10:39:40Z, hiiamboris, commented:
<https://github.com/red/red/issues/5165#issuecomment-1188894213>

    tags: GTK GUI View rich-text

