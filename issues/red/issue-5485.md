
#5485: Misleading 'duplicate refinement' error
================================================================================
Issue is closed, was reported by hiiamboris and has 8 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5485>

**Describe the bug**
```
>> f: func [x][]  f/x 1
*** Script Error: duplicate refinement usage in: f/x
*** Where: f
*** Near : f/x 1
*** Stack: f  
```

**Expected behavior**

It should rather say non-existent refinement or something :)

**Platform version**
`Red 0.6.5 for Windows built 17-Feb-2024/10:32:56+03:00  commit #58b8f89`


Comments:
--------------------------------------------------------------------------------

On 2024-02-22T11:59:44Z, dockimbel, commented:
<https://github.com/red/red/issues/5485#issuecomment-1959303808>

    That is a symptom of a deeper issue:
    
    ```
    >> f: func [x][]  f/x false
    >>
    ```

--------------------------------------------------------------------------------

On 2024-02-22T13:06:26Z, dockimbel, commented:
<https://github.com/red/red/issues/5485#issuecomment-1959420273>

    Compiling the following code in debug mode shows a failing assertion:
    
    ```
    Red []
    do {
        f: func [x][]  
        f/x 1
    }
    ```
    ```
    *** Runtime Error 98: assertion failed
    *** in file: /C/dev/Red/runtime/interpreter.reds
    *** at line: 941
    ***
    ***   stack: red/interpreter/eval-arguments 055522A8h 05759850h 05759850h 04B7C874h 05759830h 057598B8h 0 false
    ***   stack: red/interpreter/eval-code 055522A8h 05759840h 05759850h 04B7C874h true 05759830h 057598B8h 055522A8h 0 false
    ***   stack: red/interpreter/eval-path 05759830h 05759840h 05759850h 04B7C874h false false false false
    ***   stack: red/interpreter/eval-expression 05759840h 05759850h 04B7C874h false false false
    ***   stack: red/interpreter/eval 04B7C874h true
    ***   stack: red/natives/do* true -1 -1 -1 -1
    ```

--------------------------------------------------------------------------------

On 2024-03-06T16:33:18Z, greggirwin, commented:
<https://github.com/red/red/issues/5485#issuecomment-1981280466>

    Semi-related chat: https://matrix.to/#/!mjbZGzLqlsqlDLaQVP:gitter.im/$lynhia7ZCdmNyA1EbrYDlM56OaIUp2x6Vkpn2ap9tZQ

--------------------------------------------------------------------------------

On 2024-03-06T23:22:48Z, dockimbel, commented:
<https://github.com/red/red/issues/5485#issuecomment-1982025453>

    I've improved the error message as it's only used in a single place. The error happens either when passing a refinement using `apply` or using a regular path call.

