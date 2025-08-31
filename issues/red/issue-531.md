
#531: Encapped compiler does not correctly resolve #include paths
================================================================================
Issue is closed, was reported by PeterWAWood and has 8 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/531>

The encapped compiler resolves #include paths differently from the compiler script as shown in the following example to compile one of the Red/System tests.

Encapped compiler

```
Schulz:Red peter$ /Users/peter/VMShare/Languages/Red/build/bin/red -o /Users/peter/VMShare/Languages/Red/quick-test/runnable/switch-test /Users/peter/VMShare/Languages/Red/red-system/tests/source/units/switch-test.reds

-=== Red Compiler 0.3.3 ===- 

Compiling /Users/peter/VMShare/Languages/Red/red-system/tests/source/units/switch-test.reds ...

Compiling to native code...
*** Loading Error: file access error: make object! [
    code: 500
    type: 'access
    id: 'cannot-open
    arg1: "/Users/quick-test/quick-test.reds"
    arg2: none
    arg3: none
    near: [read/binary input]
    where: 'process
] 
*** in file: %/Users/peter/VMShare/Languages/Red/red-system/tests/source/units/switch-test.reds 
*** at line: 10

```

Compiler script

```
Red peter$ Rebol -qs /Users/peter/VMShare/Languages/Red/red.r -o /Users/peter/VMShare/Languages/Red/quick-test/runnable/switch-test /Users/peter/VMShare/Languages/Red/red-system/tests/source/units/switch-test.reds

-=== Red Compiler 0.3.3 ===- 

Compiling /Users/peter/VMShare/Languages/Red/red-system/tests/source/units/switch-test.reds ...

Compiling to native code...
...compilation time : 345 ms
...linking time     : 23 ms
...output file size : 28672 bytes
...output file      : /Users/peter/VMShare/Languages/Red/quick-test/runnable/switch-test

```

These examples were run against the encap branch.



Comments:
--------------------------------------------------------------------------------

On 2013-09-14T14:27:49Z, dockimbel, commented:
<https://github.com/red/red/issues/531#issuecomment-24447960>

    What was the current folder where you typed those commands?

--------------------------------------------------------------------------------

On 2013-09-14T14:34:38Z, PeterWAWood, commented:
<https://github.com/red/red/issues/531#issuecomment-24448134>

    The current folder was the top level Red directory, in my case - /Users/peter/VMShare/Languages/Red
    
    ```
    Schulz:Red peter$ pwd
    /Users/peter/VMShare/Languages/Red
    Schulz:Red peter$ /Users/peter/VMShare/Languages/Red/build/bin/red -o /Users/peter/VMShare/Languages/Red/quick-test/runnable/switch-test /Users/peter/VMShare/Languages/Red/red-system/tests/source/units/switch-test.reds
    
    -=== Red Compiler 0.3.3 ===- 
    
    Compiling /Users/peter/VMShare/Languages/Red/red-system/tests/source/units/switch-test.reds ...
    
    Compiling to native code...
    *** Loading Error: file access error: make object! [
        code: 500
        type: 'access
        id: 'cannot-open
        arg1: "/Users/quick-test/quick-test.reds"
        arg2: none
        arg3: none
        near: [read/binary input]
        where: 'process
    ] 
    *** in file: %/Users/peter/VMShare/Languages/Red/red-system/tests/source/units/switch-test.reds 
    *** at line: 10
    Schulz:Red peter$ Rebol -qs /Users/peter/VMShare/Languages/Red/red.r -o /Users/peter/VMShare/Languages/Red/quick-test/runnable/switch-test /Users/peter/VMShare/Languages/Red/red-system/tests/source/units/switch-test.reds
    
    
    -=== Red Compiler 0.3.3 ===- 
    
    Compiling /Users/peter/VMShare/Languages/Red/red-system/tests/source/units/switch-test.reds ...
    
    Compiling to native code...
    ...compilation time : 399 ms
    ...linking time     : 17 ms
    ...output file size : 28672 bytes
    ...output file      : /Users/peter/VMShare/Languages/Red/quick-test/runnable/switch-test
    Schulz:Red peter$ pwd
    /Users/peter/VMShare/Languages/Red
    ```

--------------------------------------------------------------------------------

On 2013-09-15T01:12:27Z, PeterWAWood, commented:
<https://github.com/red/red/issues/531#issuecomment-24462287>

    The encapped compiler seems to resolve all relative paths from the Users home dir on OS X. This may throw some light on the #include issue
    
    ```
    Schulz:Red peter$ build/bin/red red/tests/source/units/loop-test.red
    Cannot access source file: /Users/peter/red/tests/source/units/loop-test.red
    Schulz:Red peter$ pwd
    /Users/peter/VMShare/Languages/Red
    Schulz:Red peter$ ls red/tests/source/units/loop-test.red
    red/tests/source/units/loop-test.red
    ```

--------------------------------------------------------------------------------

On 2013-09-20T11:50:31Z, dockimbel, commented:
<https://github.com/red/red/issues/531#issuecomment-24805119>

    It seems to work fine now, so I am closing this ticket.

