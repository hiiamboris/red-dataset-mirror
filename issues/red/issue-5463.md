
#5463: [Compiler] *** Compilation Error: datatype not allowed
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.built] [status.tested] [type.bug] [type.compiler]
<https://github.com/red/red/issues/5463>

**Describe the bug**

Pops up when meets `[manual]` in function spec (which I'm trying to have to have a macro defined at runtime, because compiler forgets all macro definitions):
```
Red [] func [[manual] s e] []
```
Output:
```
...using libRedRT built on 30-Dec-2023/18:19:25
...compilation time : 44 ms

Target: MSDOS

Compiling to native code...
*** Compilation Error: datatype not allowed
*** in file: %/D/devel/red/spaces/programs/2.red
*** at line: 386
*** near: [none #user-code]
The system cannot find the file specified.
```
Seems to be only erroring when in global scope. When I put the same thing into a block, no error.

**Expected behavior**

No errors.

**Platform version**
```
Red 0.6.4 for Windows built 30-Dec-2023/17:13:04+03:00  commit #f8f2559
```


Comments:
--------------------------------------------------------------------------------

On 2024-01-08T13:41:34Z, dockimbel, commented:
<https://github.com/red/red/issues/5463#issuecomment-1881030445>

    > macro defined at runtime, because compiler forgets all macro definitions
    
    What does one have to do with the other?

--------------------------------------------------------------------------------

On 2024-01-08T13:48:14Z, hiiamboris, commented:
<https://github.com/red/red/issues/5463#issuecomment-1881045052>

    Nothing. Just stating the use case. 
    By the way it's not trivial (nor clear which approach would be better) to make compiler's preprocessor produce code that compiled binary's preprocessor will then pick up. Something to consider in preprocessor's design, if we could simplify that.

--------------------------------------------------------------------------------

On 2024-01-08T13:55:22Z, dockimbel, commented:
<https://github.com/red/red/issues/5463#issuecomment-1881058712>

    Many simplification will come from high-level compiler removal, though, current "compiler-time" preprocessor would still be useful for encapper-time preprocessing. 

