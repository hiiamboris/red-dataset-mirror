
#212: Red/System cannot compile float for ARM target?
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/212>

I submitted the simplest possible program containing a float:

```
a: 1.0
```

and got the following error when compiling for ARM:

```
*** Compiler Internal Error: Script Error : emit-load expected value argument of type: char logic integer word string path paren get-word object decimal
*** Where: emit-set-stack
*** Near:  [emit-load value
    either frame [
    emit-i32 #{E1AB0000}
```



Comments:
--------------------------------------------------------------------------------

On 2012-03-08T22:59:05Z, dockimbel, commented:
<https://github.com/red/red/issues/212#issuecomment-4404918>

    Yes, it is broken for now, the ARM backends needs to be upgraded to match the changes in the compiler made for recent floats fixes. As I am currently on trip, I probably won't have time to do that upgrade until Sunday 11.

