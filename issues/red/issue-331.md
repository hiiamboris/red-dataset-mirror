
#331: Redefinition of builtins is silently ignored
================================================================================
Issue is closed, was reported by earl and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/331>

Trying to redefine a user-defined function:

```
Red []
foo: func [] ["ERR"]
foo: func [] ["ok"]
print foo
```

This leads to a compile error (`*** Compilation Error: attempt to redefine existing function name: exec/f_foo`).

But when we redefine a builtin, the redefinition attempt is silently ignored. The following code prints `fail`:

```
Red []
print: func [x] [x]
print "fail" 
```

I'd expect the redefinition attempt to either fail with an error message, or to succeed.



Comments:
--------------------------------------------------------------------------------

On 2012-12-05T13:47:14Z, dockimbel, commented:
<https://github.com/red/red/issues/331#issuecomment-11041772>

    The first case is caused by the compiler not updating its internal functions table when a function name is referencing a new function. We can allow that, the first function definition would then become "anonymous".
    
    EDIT: removed wrong analysis. Redefinition of any word should be allowed as long as it is not treated as a keyword by the static compiler (the dynamic compiler should not have this limitation).

