
#3027: #switch directive crashes preprocessor if no match found.
================================================================================
Issue is closed, was reported by dockimbel and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3027>

```
expand-directives [
    print #switch config/OS [unknown ["KO"]]
]
```
outputs:
```
*** Script Error: syntax-error does not allow none! for its s argument
*** Where: syntax-error
*** Stack: expand-directives expand  
```



Comments:
--------------------------------------------------------------------------------

On 2017-09-12T09:05:37Z, dockimbel, commented:
<https://github.com/red/red/issues/3027#issuecomment-328790969>

    Now `#switch` and `#case` will not output an error if there is no match.

