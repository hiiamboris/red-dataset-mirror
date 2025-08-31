
#1509: Refinements are not recognized in a function defined in context
================================================================================
Issue is closed, was reported by rebolek and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1509>

Consider this code:

```
ctx: object [
    fn-test: func [val /ref] [print ["works:" val]]
    test1: does [fn-test 1]
    test2: does [fn-test/ref 2]
]

ctx/test1
ctx/test2
```

Calling the function `fn-test`without refinement works, but with refinement crashes:

```
works: 1
*** Script error: path none is not valid for function type
*** Where: test2
*** Stack: test2
```

We can see that the right function is called (output is `works` and not `_works`), but when we try to use the `/ref` refinement, we get error.



