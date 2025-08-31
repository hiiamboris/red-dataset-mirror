
#922: get-path!s don't work on object methods
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 4 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/922>

```
Red []

do [
    c: context [
        f: does [print 'c/f]
    ]
    g: :c/f
    g
]

d: context [
    f: does [print 'd/f]
]
h: :d/f
do [h]
h
```

d/f
**\* Error: word has no value!
**\* Error: word has no value!
**\* Error: word has no value!



Comments:
--------------------------------------------------------------------------------

On 2014-09-11T08:24:57Z, dockimbel, commented:
<https://github.com/red/red/issues/922#issuecomment-55234245>

    Get-path are not officially supported yet. I will see if such support can be implemented now.

--------------------------------------------------------------------------------

On 2014-09-11T17:12:12Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/922#issuecomment-55296280>

    The interpreted version still doesn't work.

