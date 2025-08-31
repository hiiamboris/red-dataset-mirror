
#343: compiler error: function value cannot occur alone
================================================================================
Issue is closed, was reported by meijeru and has 10 comment(s).
[status.reviewed] [status.resolved]
<https://github.com/red/red/issues/343>

```
func[][]
-= Red Compiler =-
Compiling red/tests/mytest.red ...
*** Red Compiler Internal Error: Script Error :
    emit-block expected blk argument of type: block
```



Comments:
--------------------------------------------------------------------------------

On 2012-12-20T09:23:27Z, dockimbel, commented:
<https://github.com/red/red/issues/343#issuecomment-11565462>

    Anonymous functions are not supported yet. Function! is not yet a first-class datatype in the current implementation, and probably will not be until we can execute code dynamically. 
    
    However, there is a way to make function! first-class for the static compiler, by using local words declared as function! type. Such support will be added in a few weeks, as it requires some additions/changes to the way the Red compiler is processing variables.

--------------------------------------------------------------------------------

On 2012-12-30T13:23:43Z, meijeru, commented:
<https://github.com/red/red/issues/343#issuecomment-11764483>

    "until we can execute code dynamically" -- isn't that the case now with the introduction of the interpreter (i.e. the `do` native)?

--------------------------------------------------------------------------------

On 2012-12-30T14:33:11Z, dockimbel, commented:
<https://github.com/red/red/issues/343#issuecomment-11765007>

    Yes, it is, but there are still significant work to do on the interpreter and console support before.

--------------------------------------------------------------------------------

On 2015-05-05T07:54:54Z, meijeru, commented:
<https://github.com/red/red/issues/343#issuecomment-98986415>

    Can this now be closed?

--------------------------------------------------------------------------------

On 2015-05-05T08:20:01Z, dockimbel, commented:
<https://github.com/red/red/issues/343#issuecomment-98990912>

    It compiles with no errors no, so it can be closed.
    
    Note that the anonymous function support is still very limited in the compiler.

