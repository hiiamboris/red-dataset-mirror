
#2849: [Preprocessor] issue with macro validation code
================================================================================
Issue is closed, was reported by 9214 and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2849>

```Red
#macro whatever: func [/local some-word] []
```
Results in:
```Red
*** Macro Error: invalid specification
*** Where: [whatever: func [/local some-word]]
*** Throw Error: no catch for throw: halt-request
*** Where: throw
*** Stack: expand-directives expand
```


