
#3140: defining a word `print:` causes access violation
================================================================================
Issue is closed, was reported by roobie and has 8 comment(s).
[status.deferred]
<https://github.com/red/red/issues/3140>

Forgive me if this issue already has been reported, but I was not able to find any that looked exactly like this, so here goes.

### Expected behavior
Either a more descriptive error message or that the code works as "intended"

### Actual behavior

Shell input/output

```
PS D:\> c:\applications\red-063.exe --cli d:\scratch.red

*** Runtime Error 1: access violation
*** at: 00000000h
```

### Steps to reproduce the problem

Evaluate this code:

```
Red [
    Title: "fault"
]

f: func [a [series!]][
    print: length? a
]

print f "a"
```

### Red version and build date, operating system with version.

Red 0.6.3
Windows 10 64-bit 1511 10586.839




Comments:
--------------------------------------------------------------------------------

On 2017-12-10T17:50:02Z, greggirwin, commented:
<https://github.com/red/red/issues/3140#issuecomment-350565497>

    I just built a fresh CLI console here and it seems OK.
    ```
    >> f: func [a [series!]][
    [        print: length? a
    [    ]
    == func [a [series!]][print: length? a]
    >> f
    *** Script Error: f is missing its a argument
    *** Where: f
    *** Stack: f
    
    >> f "a"
    == 1
    >> print f "a"
    == 1
    ```
    
    Also in a GUI console:
    ```
    >> f: func [a [series!]][
    [        print: length? a
    [    ]
    == func [a [series!]][print: length? a]
    >> f "a"
    == 1
    >> print f "a"
    == 1
    ```
    
    However, if I don't call `f "a"` first, then it does segfault.
    
    If you use `function`, to capture the reassignment of `print`, it eliminates the problem. So it seems to be reassigning `print` while it's on the stack that's the problem.

--------------------------------------------------------------------------------

On 2017-12-10T17:51:51Z, greggirwin, commented:
<https://github.com/red/red/issues/3140#issuecomment-350565614>

    That's a good catch @roobie. Thanks.

--------------------------------------------------------------------------------

On 2017-12-10T18:05:29Z, roobie, commented:
<https://github.com/red/red/issues/3140#issuecomment-350566567>

    Happy to be of help.
    
    I too can work around the segfault if I call `f "a"` before `print f "a"`.

--------------------------------------------------------------------------------

On 2019-09-11T15:38:12Z, dockimbel, commented:
<https://github.com/red/red/issues/3140#issuecomment-530438056>

    System words protection is scheduled to be supported in 0.8.

