
#4768: Crash when trying to get body of  any not-native `op!`
================================================================================
Issue is closed, was reported by Oldes and has 4 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4768>

It's simple:
```red
>> body-of :+
== 11 ;<-- of, but strange (I understand it is native's id/index)

>> body-of :is ;<-- crash!
```

Gitter: https://gitter.im/red/bugs?at=5fde280f69ee7f0422affa79


Comments:
--------------------------------------------------------------------------------

On 2020-12-19T16:30:24Z, hiiamboris, commented:
<https://github.com/red/red/issues/4768#issuecomment-748495226>

    regressed after August somewhere
    ```
    *** Runtime Error 1: access violation
    *** in file: /d/devel/red/red-src/red/runtime/datatypes/native.reds
    *** at line: 579
    ***
    ***   stack: red/native/reflect 00EFE714h 53
    ***   stack: red/actions/reflect 00EFE714h 00EFE724h
    ***   stack: red/actions/reflect*
    ***   stack: body-of
    ***   stack: red/_function/call 00EFE6F4h 028F3884h
    ***   stack: red/interpreter/eval-code 02911E58h 02CF6AE0h 02CF6AE0h false 00000000h 00000000h 02911E58h
    ***   stack: red/interpreter/eval-expression 02CF6AD0h 02CF6AE0h false false false
    ***   stack: red/interpreter/eval 00EFE6D4h true
    ***   stack: red/natives/catch* true 1
    ***   stack: ctx||566~try-do 02AC1BC0h
    ***   stack: ctx||566~do-command 02AC1BC0h
    ***   stack: ctx||566~eval-command 02AC1BC0h
    ***   stack: ctx||566~run 02AC1BC0h
    ***   stack: ctx||566~launch 02AC1BC0h
    ***   stack: ctx||600~launch 02AC1328h
    ```

--------------------------------------------------------------------------------

On 2021-01-14T19:18:58Z, hiiamboris, commented:
<https://github.com/red/red/issues/4768#issuecomment-760412657>

    ~~Still buggy on Linux:~~
    nvm forgot to update Red

