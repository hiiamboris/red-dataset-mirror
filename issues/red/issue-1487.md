
#1487: Reactor processing may lead to parse error
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1487>

My code, attempting to show slider value as percentage:

```
s: slider 100x20 data 50%
text right "50%" react [
    face/text: append to string! to integer! 100 * s/data #"%"
]
```

This works, BUT replacing `#"%"` by `"%"` gives the following error: 
**\* Script error: PARSE - matching by datatype not supported for any-string! input
**\* Where: parse
**\* Stack: view if set layout unless ctx174~process-reactors foreach parse



Comments:
--------------------------------------------------------------------------------

On 2015-12-04T13:26:55Z, dockimbel, commented:
<https://github.com/red/red/issues/1487#issuecomment-161967504>

    Good catch!

