
#5616: Compiling with -r -t Windows, standalone executable won't run
================================================================================
Issue is open, was reported by aqtfox and has 8 comment(s).
[type.bug]
<https://github.com/red/red/issues/5616>

**Describe the bug**
Trying to compile to windows, however the standalone .exe would not run.
I used this command line: `.\red-toolchain-066.exe -r -t Windows .\a.red`

**To reproduce**
1. Use this source:
```red
Red [Needs: 'View]

view [
        text-list data collect [
            foreach event load https://api.github.com/repos/red/red/commits [
                keep event/commit/message
            ]
        ]
    ]
```

2. Compile with the following command line:

`.\red-toolchain-066.exe -r -t Windows .\a.red`

3. Won't run

The source:

```red
Red [Needs: 'View]

view [
        text-list data collect [
            foreach event load https://api.github.com/repos/red/red/commits [
                keep event/commit/message
            ]
        ]
    ]
```

**Expected behavior**
Application to run

**Screenshots**

https://github.com/user-attachments/assets/6644349e-4c7d-4294-b5f1-c47fc4fda397

**Platform version**
Windows 11 24H2

**Version**
v0.6.6 - 19-March-2025



Comments:
--------------------------------------------------------------------------------

On 2025-06-03T17:45:23Z, greggirwin, commented:
<https://github.com/red/red/issues/5616#issuecomment-2936472966>

    Gitter chat here: https://matrix.to/#/!EorVRCzrVpjojJtctJ:gitter.im/$jW84bJVEYtKcLpNMVIakJ6Koj7thdX3B1Wyvscdj9N0?via=gitter.im&via=matrix.org&via=tchncs.de

--------------------------------------------------------------------------------

On 2025-06-08T14:36:48Z, dockimbel, commented:
<https://github.com/red/red/issues/5616#issuecomment-2954112676>

    So the solution is to include the missing JSON module: `Red [Needs: [View JSON]]`
    
    Though, `load` should be reporting an error if the underlying codec is not present...

--------------------------------------------------------------------------------

On 2025-06-09T20:22:53Z, greggirwin, commented:
<https://github.com/red/red/issues/5616#issuecomment-2956934473>

    `Needs` solves *this* problem, yes, but not the larger error reporting one. that is, how can `load` *know* that the codec is needed? Only the user knows that, and even then they may not, in a large system. `load` gets data and says "Do I have a codec for this? No? OK, I'll just return the data for the user to deal with.". Now, if you say `load/as`, and a codec isn't found, it *does* report an error.
    
    The confusing part in this scenario was that dev mode worked, but release mode did not.
    
    `build-libRedRT` does this:
    ```
    		script: either all [
    			opts/GUI-engine
    			find [Windows macOS Linux] opts/OS
    		][ [[Needs: [View CSV JSON]]] ][ [[Needs: [CSV JSON]]] ]
    ```

--------------------------------------------------------------------------------

On 2025-06-09T20:35:25Z, greggirwin, commented:
<https://github.com/red/red/issues/5616#issuecomment-2956964857>

    For such common codecs, I think we can always include them. The argument against them may have been compile time. I think we had both speed and size numbers for compiled vs interpreted/encapped, but can't find them just now. @rebolek may know.

