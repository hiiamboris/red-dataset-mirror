
#1798: Reactor code does not recognize face names that are defined later in the VID.
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.review] [GUI]
<https://github.com/red/red/issues/1798>

See this snippet, taken from Short Red Code Examples:

```
progress 100x20 data 20% react [face/data: s/data]
s: slider 100x20 data 20%
```

The `s` in the first line is undefined.



Comments:
--------------------------------------------------------------------------------

On 2016-04-09T19:27:42Z, iArnold, commented:
<https://github.com/red/red/issues/1798#issuecomment-207840276>

    If this is not simple to solve, use a predefine function or block?

