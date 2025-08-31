
#4672: Compile error on windows 10 x64
================================================================================
Issue is closed, was reported by Hoffenbar and has 10 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/4672>

```
c:\Users\matthiasu\Downloads>red-064 -c hello.red

-=== Red Compiler 0.6.4 ===-

Compiling c:\Users\matthiasu\Downloads\hello.red ...
...using libRedRT built on 9-Oct-2020/15:26:21
*** Red Compiler Internal Error: Script Error : copy expected value argument of type: series port bitset
*** Where: rejoin
*** Near:  [mold copy/part pos 40]
```
where hello.red is:

`print "Guten Tag!"`


Comments:
--------------------------------------------------------------------------------

On 2020-10-09T17:21:18Z, 9214, commented:
<https://github.com/red/red/issues/4672#issuecomment-706304971>

    @Hoffenbar please use the [latest](https://static.red-lang.org/dl/auto/win/red-latest.exe) release and reserve the issue tracker for the bug reports: our [Gitter community](https://gitter.im/red/red/welcome) is there to answer the common questions and help you to get on your feet with Red.

--------------------------------------------------------------------------------

On 2020-10-09T17:27:49Z, Hoffenbar, commented:
<https://github.com/red/red/issues/4672#issuecomment-706308189>

    Sorry. I just discovered Red today and I am a total novice to this language (my current favorite language for years is Tcl/Tk).
    Thanks.

--------------------------------------------------------------------------------

On 2020-10-09T17:36:14Z, Hoffenbar, commented:
<https://github.com/red/red/issues/4672#issuecomment-706312800>

    Now trying the simple "Hello..." again. After deleting old intermediate files it takes a good times before this;
    and yes, I switch to the forum later, currently in a rush and no time to register me there.....:
    ```
    -=== Red Compiler 0.6.4 ===-
    
    Compiling c:\Users\matthiasu\Downloads\hello.red ...
    Compiling libRedRT...
    ...compilation time : 5993 ms
    
    Compiling to native code...
    ...compilation time : 218779 ms
    ...linking time     : 2661 ms
    ...output file size : 1254400 bytes
    ...output file      : c:\Users\matthiasu\Downloads\libRedRT.dll
    
    *** Syntax Error: Invalid Red program
    *** in file: c:\Users\matthiasu\Downloads\hello.red
    *** line: 1
    *** at: {print "Guten Tag!"}
    ```

--------------------------------------------------------------------------------

On 2020-10-09T17:41:11Z, 9214, commented:
<https://github.com/red/red/issues/4672#issuecomment-706315305>

    No worries @Hoffenbar, and welcome! Here are the results with the latest build:
    ```
    $ cat scratch.txt
    Red []
    
    print "Guten Tag!"
    ```
    ```
    $ red -c scratch.txt
    
    -=== Red Compiler 0.6.4 ===-
    
    Compiling ...\scratch.txt ...
    Compiling libRedRT...
    ...compilation time : 2037 ms
    
    Compiling to native code...
    ...compilation time : 68974 ms
    ...linking time     : 823 ms
    ...output file size : 1254400 bytes
    ...output file      : ...\libRedRT.dll
    
    ...compilation time : 46 ms
    
    Target: MSDOS
    
    Compiling to native code...
    ...compilation time : 1811 ms
    ...linking time     : 128 ms
    ...output file size : 78336 bytes
    ...output file      : ...\scratch.exe
    ```
    ```
    $ scratch
    Guten Tag!
    ```
    Note that the script header (the `Red [...]` part) is mandatory; you receive a syntax error because your script doesn't have one.
    
    > After deleting old intermediate files it takes a good times before this
    
    Yes, that's because the toolchain recompiles the libRedRT runtime library that you deleted. With it in place, the compilation in development mode (`-c` flag) would be instantaneous.
    
    Gitter does not require registration, Github account (which you obviously have) is enough. Cheers.

--------------------------------------------------------------------------------

On 2020-10-09T18:10:58Z, Hoffenbar, commented:
<https://github.com/red/red/issues/4672#issuecomment-706329495>

    Many thanks! This works now, and very fast!
    Coming from Tcl/Tk and Starkits, I'm already very spoiled and wondering why a vast majority of programmers continue to use unproductive tools which are itself the problem ...
    I will definitely look further into things. Very promising.

