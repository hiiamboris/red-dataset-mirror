
#1771: Support out of order arguments in the Compiler's Command Line parser
================================================================================
Issue is closed, was reported by ghost and has 12 comment(s).
[type.wish] [status.reviewed]
<https://github.com/red/red/issues/1771>

For eg., currently -
`red -v 11 -c a.reds` gives  -

```
-=== Red Compiler 0.6.0 ===-

Compiling /C/Users/ABC/Desktop/a.reds ...

Compiling to native code...
processing %common.reds
running string preprocessor...
running block preprocessor...

(etc etc etc....)

```

whereas 

`red -c a.reds -v 11` gives -

```
-=== Red Compiler 0.6.0 ===-

Compiling /C/Users/ABC/Desktop/a.reds ...

Compiling to native code...
...compilation time : 297 ms
...linking time     : 16 ms
...output file size : 24064 bytes
...output file      : C:\Users\ABC\Desktop\a.exe
```

Recursive argument parsing will make `red -c a.reds -v 11` equal to `red -v 11 -c a.reds`.



Comments:
--------------------------------------------------------------------------------

On 2017-02-16T11:11:39Z, dockimbel, commented:
<https://github.com/red/red/issues/1771#issuecomment-280302720>

    I'm not sure what recursivity has to do with parsing out of order arguments. The current command-line parser is very simple and primitive, supporting arbitrary order for arguments would require a full rewrite of that parser.

--------------------------------------------------------------------------------

On 2017-02-16T11:44:26Z, ghost, commented:
<https://github.com/red/red/issues/1771#issuecomment-280309183>

    Ah yes. That was what I meant. I agree that it is low priority.

--------------------------------------------------------------------------------

On 2017-03-07T09:54:33Z, dockimbel, commented:
<https://github.com/red/red/issues/1771#issuecomment-284674418>

    I don't think we should support such out of order arguments, as it could become confusing which part should the arguments belong too. For example:
    ```
    red -c a.reds -v 11
    ```
    The `-c` switch indicates we want to compile a script, so all the rest of the arguments belong to `red`. But if it's not used:
    ```
    red a.reds -v 11
    ```
    Without the `-c` switch, we ask for script interpretation and in such case, `-v 11` are arguments to the `a.reds` script then.

--------------------------------------------------------------------------------

On 2017-03-07T11:32:37Z, ghost, commented:
<https://github.com/red/red/issues/1771#issuecomment-284697039>

    Agreed.
    So, as far as i understand, all the arguments currently come in between `-c` and `filename`? Right? 
    Because there was this confusion - https://github.com/red/red/issues/2352

--------------------------------------------------------------------------------

On 2017-03-08T03:09:43Z, dockimbel, commented:
<https://github.com/red/red/issues/1771#issuecomment-284933575>

    The typical command-line format is described on our github's home page:
    ```
    red [options] [file]
    ```

--------------------------------------------------------------------------------

On 2017-03-08T11:15:17Z, ghost, commented:
<https://github.com/red/red/issues/1771#issuecomment-285014705>

    Okay then, I think this can be closed.

