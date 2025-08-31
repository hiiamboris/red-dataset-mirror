
#795: Red 0.4.2 fails to crosscompile console.red to Android (on Linux)
================================================================================
Issue is closed, was reported by IngoHohmann and has 4 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/795>

I'm not sure wether the console is supported on Android, I get the following error when trying to compile.

```
-=== Red Compiler 0.4.2 ===- 

Compiling /tmp/red/runtime/console/console.red ...
...compilation time : 1156 ms

Compiling to native code...
*** Compilation Error: invalid path value 
*** in file: %/tmp/red/runtime/console/console.red 
*** in function: exec/read-argument
*** at line: 1 
*** near: [1 str: simple-io/read-txt args/item stack/set-last as cell! str]
```



Comments:
--------------------------------------------------------------------------------

On 2014-04-29T23:18:10Z, qtxie, commented:
<https://github.com/red/red/issues/795#issuecomment-41744073>

    @IngoHohmann Seems we have no `simple-io` support for `Android`, so it don't include in `%red.reds`.
    
    ```
    #if OS <> 'Android [
        #include %simple-io.reds                        ;-- temporary file IO support
    ]
    ```
    
    @dockimbel Have we already supported simple io on Andorid ?

--------------------------------------------------------------------------------

On 2014-04-30T12:45:02Z, dockimbel, commented:
<https://github.com/red/red/issues/795#issuecomment-41791830>

    We don't support console compilation on Android mainly because of the limited usage for it on a mobile device, and because we plan to provide a GUI-based console for Android.
    
    Simple-io has been added to the codebase only to support _temporary_ a few file I/O features we needed until the full I/O support will be done.
    
    IIRC, we had an issue with finding the right functions in Bionic library required by simple-io, so if someone wants to contribute it, we will accept it.

