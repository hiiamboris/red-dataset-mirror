
#4834: Loading malformed file-name crashes console
================================================================================
Issue is closed, was reported by toomasv and has 6 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4834>

**Describe the bug**
`load {%"}` crashes console

**Platform version**
```
Red 0.6.4 for Windows built 9-Feb-2021/19:31:32+02:00 commit #18bc5f7
```



Comments:
--------------------------------------------------------------------------------

On 2021-02-25T09:04:29Z, hiiamboris, commented:
<https://github.com/red/red/issues/4834#issuecomment-785736912>

    Stack trace looks like a bug on it's own:
    ```
    >> load {%"}
    
    *** Runtime Error 1: access violation
    *** in file: ¸,
    *** at line: 1818845542
    ***
    ```

--------------------------------------------------------------------------------

On 2021-08-18T10:58:41Z, hiiamboris, commented:
<https://github.com/red/red/issues/4834#issuecomment-901019077>

    Related: https://github.com/red/red/issues/4547
    Another scenario: run this in the GUI console:
    ```
    gui-console-ctx/terminal/color?: yes
    %"^/"
    ```
    Output:
    ```
    *** Runtime Error 1: access violation
    *** in file: ç1
    *** at line: 1818845542
    ***
    ```

--------------------------------------------------------------------------------

On 2021-08-20T17:23:25Z, dockimbel, commented:
<https://github.com/red/red/issues/4834#issuecomment-902843054>

    > Stack trace looks like a bug on it's own:
    
    No bug there. What happens sometimes is that the debug records inside the executable image in memory get corrupted by a crash. We should move such data to a read-only segment once the linker will have support for that.

