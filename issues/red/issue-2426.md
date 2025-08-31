
#2426: Linux: cannot access argument file
================================================================================
Issue is closed, was reported by Skrylar and has 12 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2426>

Red: 0.6.1
OS: Linux, Arch
Reproducible: Always

https://asciinema.org/a/epxsugh4pyjhkoxh75ndrn2rd

Command line arguments can't be used, which in turn means the compiler doesn't appear to be invokable.


Comments:
--------------------------------------------------------------------------------

On 2017-01-29T05:12:04Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2426#issuecomment-275894459>

    ```-v``` is not a valid command line argument for the Red executable. ```-V``` or ```--version``` are the arguments to get Red to print its version.
    
    This does not affect Red's ability to compile Red programs:
    ```text
    $ red -v
    *** Error: cannot access argument file
    --== Red 0.6.1 ==-- 
    Type HELP for starting information.
    
    $ red -V
    0.6.1
    
    $ red --version
    0.6.1
    
    $ red -c test.red
    
    -=== Red Compiler 0.6.1 ===- 
    
    Compiling test.red ...
    ...compilation time : 574 ms
    ```
    
    I feel the error message is misleading so I have updated the title of the issue to reflect that.

--------------------------------------------------------------------------------

On 2017-01-29T08:14:07Z, ghost, commented:
<https://github.com/red/red/issues/2426#issuecomment-275900364>

    @PeterWAWood Agreed about `-v` but in the screenrecording by @Skrylar, even `red --help` does not work. I think it should be working? Looks like some issues in Skrylar's set-up. IDK, maybe...

--------------------------------------------------------------------------------

On 2017-01-29T09:51:22Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2426#issuecomment-275903902>

    I have tested both the 0.6.1 release and the latest automated build under Ubuntu32 and the error message is only displayed with ```red -v```.

--------------------------------------------------------------------------------

On 2017-01-30T16:02:00Z, Skrylar, commented:
<https://github.com/red/red/issues/2426#issuecomment-276102518>

    Additional commands (some valid, others not) tested on a second machine (still Arch, and 0.6.1)
    
    https://asciinema.org/a/740utrwaryfn4y07e9nbbzvc0

--------------------------------------------------------------------------------

On 2017-01-31T13:07:39Z, geekyi, commented:
<https://github.com/red/red/issues/2426#issuecomment-276358311>

    I have the same behavior as described by @PeterWAWood on windows 10.
    
    @Skrylar what is the output of `red>> ? system/options` after you type something like `--help` ?
    I suspect it may be caused by your shell messing with what's passed to red.
    For me:
    ```
    red>> ? system/options/args
    system/options/args is a string! of value: "-v"
    ```

--------------------------------------------------------------------------------

On 2017-01-31T17:58:35Z, Skrylar, commented:
<https://github.com/red/red/issues/2426#issuecomment-276440609>

    Zshell 5.3.1
    
    ```
    Raziel% red
    --== Red 0.6.1 ==--
    Type HELP for starting information.
    
    red>> ? system/options/args
    system/options/args is a none! of value: none
    ```
    
    ```
    Raziel% red -h
    *** Error: cannot access argument file
    --== Red 0.6.1 ==--
    Type HELP for starting information.
    
    red>> ? system/options/args
    system/options/args is a string! of value: {"-h"}
    ```
    
    GNU Bash 4.4
    ```
    [skrylar@Raziel ostar]$ red
    --== Red 0.6.1 ==--
    Type HELP for starting information.
    
    red>> ? system/options/args
    system/options/args is a none! of value: none
    ```
    
    ```
    [skrylar@Raziel ostar]$ red -h
    *** Error: cannot access argument file
    --== Red 0.6.1 ==--
    Type HELP for starting information.
    
    red>> ? system/options/args
    system/options/args is a string! of value: {"-h"}
    ```

