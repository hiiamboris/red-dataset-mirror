
#5159: [CONSOLE / HELP] Access Violation when calling system/words/what
================================================================================
Issue is closed, was reported by gltewalt and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5159>

**Describe the bug**

```
>> system/words/what

*** Runtime Error 1: access violation
*** at: 080943BBh
```

**To reproduce**

Type above into the console.

**Expected behavior**

The output of `what`

`what` entered by itself works as expected, `system/words/what` does not.

**Platform version**
Red 0.6.4 for Linux built 4-Jul-2022/2:48:56-06:00  commit #ccc7e08





Comments:
--------------------------------------------------------------------------------

On 2022-07-19T12:22:23Z, dockimbel, commented:
<https://github.com/red/red/issues/5159#issuecomment-1188985399>

    Relevant stack trace:
    ```
    *** Runtime Error 1: access violation
    *** in file: /c/dev/Red/runtime/datatypes/word.reds
    *** at line: 167
    ***
    ***   stack: red/word/get-local 00000000h 10
    ***   stack: what 00000000h
    ***   stack: red/_function/call 0532FCC4h 01253884h 05810B40h 0
    ***   stack: red/interpreter/eval-code 05415DE8h 05810B50h 05810B50h 0532FCA4h false 05810B40h 05810B18h 054DB9E0h
    ***   stack: red/interpreter/eval-path 05810B18h 05810B50h 05810B50h 0532FCA4h false false false false
    ***   stack: red/interpreter/eval-expression 05810B50h 05810B50h 0532FCA4h false false false
    ***   stack: red/interpreter/eval 0532FCA4h true
    ***   stack: red/natives/catch* true 1
    ***   stack: ctx||587~try-do 01270D1Ch
    ***   stack: ctx||587~do-command 01270D1Ch
    ***   stack: ctx||587~eval-command 01270D1Ch
    ***   stack: ctx||587~run 01270D1Ch
    ***   stack: ctx||587~launch 01270D1Ch
    ***   stack: ctx||622~launch 012703E8h
    ```
    
    `what` is a compiled mezz declared in an object, so it requires that parent's object context reference when invoked. In the trace the passed context reference is `null` which is causing the crash when that context is dereferenced in `get-local` call:
    
    ```
    f_what: func [octx [node!] /local ctx saved ~with ~text ~spec ~buffer ~local ~found-at-least-one? ~word ~val] [
        ctx: TO_CTX (ctx||585) 
        saved: ctx/values 
        ctx/values: as node! stack/arguments 
        ~with: stack/arguments 
        ~text: type-check-alt ~with ts||791 1 ~with + 1 
        ~spec: ~text + 1 
        ~buffer: ~spec + 1 
        ~local: ~buffer + 1 
        ~found-at-least-one?: ~local + 1 
        ~word: ~found-at-least-one? + 1 
        ~val: ~word + 1 
        _function/init-locals 4 
        stack/mark-func-body words/_body 
        stack/reset 
        stack/mark-native ~clear 
        word/get-local octx 10 
        [...]
    ```
    
    The `null` context is passed because the interpreter wrongly considers that `system/words` is the parent object instead of using the intrinsic context reference (`help-ctx/func-spec-ctx`) from the function itself.

--------------------------------------------------------------------------------

On 2022-07-19T12:45:02Z, dockimbel, commented:
<https://github.com/red/red/issues/5159#issuecomment-1189008261>

    The fix ensures that the global context reference is not used when passing the parent's context on compiled function declared inside an object.

