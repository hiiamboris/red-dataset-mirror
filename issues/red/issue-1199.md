
#1199: GET followed by a path is not compiled correctly
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1199>

```
test: func [input [block!] /local exp-res reason] [
        exp-res: get input/expect
]
test ["" expect true]
```

Once compiled and run, it produces the following error:

```
*** Script error: exp-res has no value
*** Where: set
*** Stack: test set set
```



