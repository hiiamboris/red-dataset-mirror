
#1128: Set-paths wrongly loaded
================================================================================
Issue is closed, was reported by x8x and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1128>

Red wrongly interpret set-paths, see example:

``` rebol
red>> a: [series/:i:  series/(len - (i - 1)) series/(len - (i - 1)):  tmp]
== [series/i: series/(len - (i - 1)) series/len - i - 1: tmp]
red>> mold a
== {[series/i: series/(len - (i - 1)) series/len - i - 1: tmp]}
red>> 
```



Comments:
--------------------------------------------------------------------------------

On 2015-04-28T05:17:37Z, dockimbel, commented:
<https://github.com/red/red/issues/1128#issuecomment-96912853>

    Please add some text in addition to the code example to explain what is the problem you are reporting. This is not just for saving my time, but also the time of anyone else coming to read this ticket. Thanks. :-)
    
    The set-paths loading seems to be buggy, yes.

--------------------------------------------------------------------------------

On 2015-04-28T10:52:20Z, dockimbel, commented:
<https://github.com/red/red/issues/1128#issuecomment-97014914>

    It was a MOLDing issue.

