
#3200: WISH: split function change
================================================================================
Issue is closed, was reported by endo64 and has 6 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/3200>

Split function's return value is missing the last one if there are delimiters at the end of the input value consecutively.

### Expected behavior

```
>> split "a-b--" "-"
== ["a" "b" "" ""]
```
### Actual behavior

```
>> split "a-b--" "-"
== ["a" "b" ""]
```

### Red version and build date, operating system with version.

Red v0.6.3
Build 21-Dec-2017/23:39:43+03:00
Win10 x64


Comments:
--------------------------------------------------------------------------------

On 2018-01-15T22:13:42Z, endo64, commented:
<https://github.com/red/red/issues/3200#issuecomment-357800904>

    I made a PR for this change: #3201

--------------------------------------------------------------------------------

On 2018-03-09T10:21:00Z, xqlab, commented:
<https://github.com/red/red/issues/3200#issuecomment-371773002>

    Omitting the last empty value is similar to the behavior how Rebol2 handles it. It has an advantage when dealing with files with lines of text. 

--------------------------------------------------------------------------------

On 2018-03-09T13:05:54Z, DideC, commented:
<https://github.com/red/red/issues/3200#issuecomment-371807057>

    Maybe a `/trim` refinment to have the R2 behaviour for times it's needed ?

