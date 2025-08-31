
#3328: High-level RTD does not seem to work as described
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/3328>

### Expected behavior

Calling `rtd-layout` with a block argument should yield a `rich-text` face i,e, an object with `/text` and `/data` set as described in the wiki.
### Actual behavior

The `data` facet is none
### Steps to reproduce the problem

>>f: rtd-layout ['b "abc" /b]
== make object! [...]
>>f/data
== none ; should be [1x3 bold], I suppose

### Red and platform version
```
Red 0.6.3 for Windows built 11-Apr-2018/14:56:31+02:00 commit #9b085fa
W10
```
Note: about/debug crashes, see next issue


Comments:
--------------------------------------------------------------------------------

On 2018-04-11T16:38:22Z, meijeru, commented:
<https://github.com/red/red/issues/3328#issuecomment-380517365>

    Further investigation:
    `red-layout/only` yields `["abc" [1x3 bold]]` as expected
    `red-layout/with` with a fresh `face!` object yields a correct `/data` facet, but does not set the `/type` facet to `'rich-text` which I would have expected 

