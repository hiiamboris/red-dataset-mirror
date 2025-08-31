
#1099: New Red does not work together with ANSI binding
================================================================================
Issue is closed, was reported by iArnold and has 24 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/1099>

Hi, the new Redbin does not compile a program using the ANSI binding (http://www.red-lang.org/p/contributions.html) 

```
Red [   
    filename: %ansibinding.red
]

; ANSI for date and time functions
#include %../../bind/C-library/ANSI.red

print "ANSI binding now compiles again"
```

Results in

```
>> do/args %red.r "-c %../project/dummies/ansibinding.red"

-=== Red Compiler 0.5.2 ===-

Compiling /C/.../project/dummies/ansibinding.red ...
*** Driver Internal Error: Access Error : Cannot open ./crush.dll as library
*** Where: build-compress-lib
*** Near:  [crush-lib: load/library filename
crush-compress: make
]
```

This includes commit 4002.



Comments:
--------------------------------------------------------------------------------

On 2015-04-20T10:18:04Z, dockimbel, commented:
<https://github.com/red/red/issues/1099#issuecomment-94415529>

    Have you tried with the precompiled Red binary?
    
    Reading the report, it seems to have nothing to do with the ANSI.red script you're trying to build but rather with relative path of source code...

--------------------------------------------------------------------------------

On 2015-04-20T10:24:51Z, iArnold, commented:
<https://github.com/red/red/issues/1099#issuecomment-94416529>

    Hi,
    
    No I only know how to compile using sources. 
    You are right about the path being incorrect. Sorry about that, but the error with that version is:
    
    ```
    >> do/args %red.r "-c %../project/dummies/ansibinding.red"
    
    -=== Red Compiler 0.5.2 ===-
    
    Compiling /C/../project/dummies/ansibinding.red ...
    *** Compilation Error: include file not found: ../../bind/C-library/ANSI.red
    *** in file: %/C/.../project/dummies/ansibinding.red
    *** near: [#include %../../bind/C-library/ANSI.red print "ANSI binding now compiles again"]
    >>
    ```

--------------------------------------------------------------------------------

On 2015-04-20T11:35:26Z, iArnold, commented:
<https://github.com/red/red/issues/1099#issuecomment-94429464>

    I managed to compile with the old Red sources, using the new again gets me immediately a message window:
    
    ```
    REBOL - Security Check
    Script requests permission to open a port for read/write on: ./crush.dll
    ```
    
    It 'crushed' on Mac before too.
    Compiling using the precompiled red-20apr15-a59d071.exe does indeed not have this issue.

--------------------------------------------------------------------------------

On 2015-04-20T12:16:28Z, iArnold, commented:
<https://github.com/red/red/issues/1099#issuecomment-94436684>

    I have to add that I got used to compiling from source because I am mostly developing on a Mac and there are no daily builds for Mac, and sometimes I want or need a more recent version of Red than the available binary. 

--------------------------------------------------------------------------------

On 2015-04-20T13:22:23Z, dockimbel, commented:
<https://github.com/red/red/issues/1099#issuecomment-94449753>

    Is the error message you are reporting this one:
    
    ```
    REBOL - Security Check
    Script requests permission to open a port for read/write on: ./crush.dll
    ```
    
    ?
    
    We have automated builds for Mac since last release.

--------------------------------------------------------------------------------

On 2015-04-20T13:27:38Z, iArnold, commented:
<https://github.com/red/red/issues/1099#issuecomment-94450673>

    (It says 0MB on the downloadsite, so at least looks like there is no available)
    Yes, that is what I am reporting, and allowing the access results in the notification that crush.dll is not available, which was not a problem in last version.

--------------------------------------------------------------------------------

On 2015-04-20T13:41:28Z, dockimbel, commented:
<https://github.com/red/red/issues/1099#issuecomment-94453827>

    The security message is from Rebol, just reply "A" or run Rebol with the -s option. Check out the [documentation](http://www.rebol.com/docs/core23/rebolcore-2.html#section-2.7). The crush library is required to run Red from now on, so better allow it if you want to use Red.
    
    The Mac builds are available regardless if the size display is at zero or not. This particular issue is caused by long delays of Mac binaries generation and upload to our main server. The current backend scripts cannot cop with those long delays and I have no one available in my team to rewrite them, so just ignore those visual glitches for now.

--------------------------------------------------------------------------------

On 2015-04-20T17:31:34Z, iArnold, commented:
<https://github.com/red/red/issues/1099#issuecomment-94517282>

    Well I chose 'Allow All' but apparently that does not mean 'Allow' on windows-R2 :-( 
    Had the same experience with the downloadscript, had to 'Allow' each single step. Running Rebol with -a option is no option, I always start it from explorer.
    
    What kind of script is it?

--------------------------------------------------------------------------------

On 2015-04-21T01:49:28Z, dockimbel, commented:
<https://github.com/red/red/issues/1099#issuecomment-94609351>

    There is no `-a` option, it is `-s`. 
    
    Don't you know about making shortcuts on Windows where you can edit properties of the launched executable? Please google about that.

--------------------------------------------------------------------------------

On 2015-04-21T06:48:43Z, iArnold, commented:
<https://github.com/red/red/issues/1099#issuecomment-94655389>

    I know how to do that even without Google ;-)

--------------------------------------------------------------------------------

On 2015-04-21T19:02:36Z, iArnold, commented:
<https://github.com/red/red/issues/1099#issuecomment-94907384>

    Funny thing is also the documentation does not say why you should want to turn security off by using -s option.

--------------------------------------------------------------------------------

On 2015-04-22T12:41:06Z, iArnold, commented:
<https://github.com/red/red/issues/1099#issuecomment-95159514>

    Even placing the crush.dll in a folder in the path still generates this error when compiling from source:
    
    ```
    -=== Red Compiler 0.5.2 ===-
    
    Compiling /C/.../project/testprogram.red ...
    *** Driver Internal Error: Access Error : Cannot open ./crush.dll as library
    *** Where: build-compress-lib
    *** Near:  [crush-lib: load/library filename
    crush-compress: make
    ]
    ```

