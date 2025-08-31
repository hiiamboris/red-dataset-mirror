
#139: ASSERT compilation error on ANY/ALL
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/139>

An expression using `any` or `all` passed to  `assert` crashes the compiler.

Example:

```
Red/System []

assert all [1 = 2]
```

raises the following error when compiled:

```
*** Compiler Internal Error: Script Error : add-condition expected op argument of type: word
*** Where: emit-branch
*** Near:  [add-condition op copy pick [#{70} #{0F80}]]
```



