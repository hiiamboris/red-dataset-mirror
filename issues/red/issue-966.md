
#966: Windows compilation target option appears broken
================================================================================
Issue is closed, was reported by PeterWAWood and has 4 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/966>

When compiling using the -t Windows option, print statements don't display output.

I compiled a simple program on OS X using the following commands:

```
rebol -qs red.r -t MSDOS -o dostest ../../Code/Red/test.red
rebol -qs red.r -t Windows -o wintest ../../Code/Red/test.red
```

The program code is:

```
Red[]

print "hello, Pekr"
```

I ran the two programs in both the "command console" and powershell.

Console:

```
E:\Languages\Red>dostest
hello, Pekr

E:\Languages\Red>wintest

E:\Languages\Red>
```

PowerShell

```
PS E:\Languages\Red> ./dostest.exe
hello, Pekr
PS E:\Languages\Red> ./wintest.exe
PS E:\Languages\Red>
```

I compiled using the latest source on the Master branch.



Comments:
--------------------------------------------------------------------------------

On 2014-10-25T01:15:51Z, qtxie, commented:
<https://github.com/red/red/issues/966#issuecomment-60467038>

    *A CONSOLE PE is exactly like a GUI PE except that it comes with a pre-attached console. *
    So if compiling for Windows target, will print nothing to the console.

--------------------------------------------------------------------------------

On 2014-10-25T03:36:33Z, dockimbel, commented:
<https://github.com/red/red/issues/966#issuecomment-60470322>

    That is the expected behavior and the reason we have that MSDOS target in the first place. See their definition in %config.r file:
    
    ```
    MSDOS [                                 ; Windows default target
        OS:         'Windows
        format:     'PE
        type:       'exe
        sub-system: 'console
    ]
    ;-------------------------
    Windows [
        OS:         'Windows
        format:     'PE
        type:       'exe
        sub-system: 'GUI
    ]
    ```

