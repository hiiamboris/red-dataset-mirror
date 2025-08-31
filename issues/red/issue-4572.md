
#4572: compiler does not process OP! aliases properly
================================================================================
Issue is closed, was reported by 9214 and has 6 comment(s).
[status.deferred] [type.compiler]
<https://github.com/red/red/issues/4572>

**Describe the bug**
Even with a workaround for https://github.com/red/red/issues/2867 in place compiler still cannot handle `op!` aliases properly.

**To reproduce**
Compile the script below:
```red
Red []

set 'o get '//

probe 8 o 3 == 2
probe try [1 o 0]
```

Result:
```red
8
0
```

**Expected behavior**
```red
true 
make error! [...]
```

**Platform version**
 a1d1495, W10.



Comments:
--------------------------------------------------------------------------------

On 2020-07-10T17:39:15Z, hiiamboris, commented:
<https://github.com/red/red/issues/4572#issuecomment-656798489>

    Compiler is it's own DSL ;)

--------------------------------------------------------------------------------

On 2020-07-10T17:41:32Z, 9214, commented:
<https://github.com/red/red/issues/4572#issuecomment-656799427>

    [In my world, everyone's a pony...](https://www.youtube.com/watch?v=CJr4kPMVvpU)

--------------------------------------------------------------------------------

On 2020-10-27T17:46:03Z, dockimbel, commented:
<https://github.com/red/red/issues/4572#issuecomment-717413431>

    It is possible to improve the compiler to support an explicit form like `set 'o get '//`. However, it is easy to defeat it by indirectly referencing the `op!` value, like in:
    ```
    new: first reduce [get '//]
    set 'o :new
    ```
    There is no way the compiler could guess that `o` will be set to an `op!` during static analysis in the general case.
    
    As a reminder, only a subset of Red semantics are statically analyzable, therefore compilable. This set is quite large and covers most of the code written by users. Scripts using a more dynamic constructs should not be fed to the compiler, they should be evaluated only or compiled in encapped mode to fully preserve their semantics. That's the best we can achieve for now.
    
    I will set this ticket to "deferred" in case we come up with new ways to tackle this type of use-cases in the future, and close it.

