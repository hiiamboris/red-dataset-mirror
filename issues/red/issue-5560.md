
#5560: MOLD has trailing spaces in its output
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5560>

**Describe the bug**

While testing my `mold` alteration I'm using in Spaces, I've come across the following case, which don't seem by design to me:
```
>> mold new-line/all [a b c] on
== {[^/    a ^/    b ^/    c^/]}
;) note     ^       ^ the added spaces
```
It affects the output of all any-functions in particular. I guess that's also one reason why we had ellipsization errors in the console previously.

**Expected behavior**

I think there should be no trailing space before a new-line

**Platform version**
`Red 0.6.5 for Windows built 9-Nov-2024/4:54:12+07:00  commit #fc80690`


Comments:
--------------------------------------------------------------------------------

On 2024-11-26T19:24:48Z, dockimbel, commented:
<https://github.com/red/red/issues/5560#issuecomment-2501751495>

    R2 does the same. Though, it probably should be considered a bug.

