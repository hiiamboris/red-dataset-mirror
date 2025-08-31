
#4190: Crash in `fire-on-set` on facet update
================================================================================
Issue is closed, was reported by loziniak and has 8 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4190>

([original gitter post](https://gitter.im/red/bugs?at=5df9eab18dfce538b5c8aca1))
After release-compiling this code and clicking a button the app crashes:
```
Red [Needs: 'View]
a: make face! [
    type: 'base color: red size: 20x20
    showw: function [
        parent [object!]
        offs [pair!]
    ] [
        self/offset: offs
        self/parent: parent
        append parent/pane self
    ]
]

view [
    panel 500x500 [
        button "show a" [a/showw face/parent 30x30]
    ]
]
```

Stack trace:
```
*** Runtime Error 98: assertion failed
*** in file: XXXred/gtk/red-github/runtime/datatypes/object.reds
*** at line: 384
***
***   stack: red/object/fire-on-set 00000062h 080951FEh 00000000h FFE69840h
***   stack: red/object/fire-on-set F54FBFB0h 091DCF94h 091E43E4h 091E43D4h
***   stack: red/object/fire-on-set* 091DDF24h 091DCF94h
***   stack: ctx||458~showw F7EE3C8Ch
***   stack: red/_function/call 091E43A4h F7EE3C8Ch
***   stack: red/interpreter/eval-code 091E43A4h F531C788h F531C788h false F531C758h F531C7B0h F54FA000h
***   stack: red/interpreter/eval-path F531C7B0h F531C768h F531C788h false false false false
***   stack: red/interpreter/eval-expression F531C768h F531C788h false false false
***   stack: red/interpreter/eval F531C6F0h true
***   stack: red/interpreter/eval-function 091E4374h F531C6F0h
***   stack: red/_function/call 091E4374h F7EE4428h
***   stack: red/interpreter/eval-code 091E4374h F5284A38h F5284A38h false 00000000h 00000000h 091E42D4h
***   stack: red/interpreter/eval-expression F5284A18h F5284A38h false false false
***   stack: red/interpreter/eval 091E4364h true
***   stack: red/natives/do* false -1 -1 -1
***   stack: red/interpreter/eval-arguments F54F94C0h F52849F0h F52849F0h 00000000h 00000000h
***   stack: red/interpreter/eval-code F54F94C0h F52849E0h F52849F0h false 00000000h 00000000h F54F94C0h
***   stack: red/interpreter/eval-expression F52849E0h F52849F0h false false false
***   stack: red/interpreter/eval 091E4344h true
***   stack: red/natives/try* true 0
***   stack: do-safe
***   stack: do-actor
***   stack: ctx||403~awake F7EEFC68h
***   stack: gui/make-event 093A7100h 0 9
***   stack: gui/button-clicked 093A7100h 093A7100h
```

Arch Linux with latest Red sources, GTK branch.
Bug confirmed by others on [Windows 10](https://gitter.im/red/GTK?at=5df982fec6ce6027ebdddecd) and [Windows 7](https://gitter.im/red/bugs?at=5df9f7bc49314a1d459b2033).


Comments:
--------------------------------------------------------------------------------

On 2020-01-30T12:16:48Z, 9214, commented:
<https://github.com/red/red/issues/4190#issuecomment-580226097>

    [Boom boom boom](https://www.youtube.com/watch?v=LcdQ2AzY2Qw&t=1271s).
    
    ```red
    Red [Needs: View] boom: make face! [boom: does [self/parent: 'boom]] boom/boom
    ```
    ```text
    *** Runtime Error 98: assertion failed
    *** in file: .../red/runtime/datatypes/object.reds
    *** at line: 384
    ***
    ***   stack: red/object/fire-on-set 00000062h 004497B3h 00000000h 0019FF0Ch
    ***   stack: red/object/fire-on-set 02C73000h 02B67634h 02B6FE34h 02B6FE24h
    ***   stack: red/object/fire-on-set* 02B69C24h 02B67634h
    ***   stack: ctx||461~boom 00E21B58h
    ```

--------------------------------------------------------------------------------

On 2020-03-18T22:20:53Z, loziniak, commented:
<https://github.com/red/red/issues/4190#issuecomment-600887919>

    Failed assertion is `assert TYPE_OF(obj) = TYPE_OBJECT` in *object/fire-on-set*. obj's type is TYPE_UNSET. My bet is that it's because compiler generates code like this: `object/fire-on-set* ~self exec/~parent`, and `_context/get` in *object/fire-on-set** does find `self` word in global context, which is *unset!* (see *word/load* and *symbol/make*).
    
    Probably some clever change would be needed in `parent: either 2 < length? path` condition in **compiler.r** not to treat *self* as a global in this case.

--------------------------------------------------------------------------------

On 2020-03-19T20:10:16Z, loziniak, commented:
<https://github.com/red/red/issues/4190#issuecomment-601392920>

    Clever or not, fix is ready :-)

--------------------------------------------------------------------------------

On 2020-03-19T20:17:45Z, loziniak, commented:
<https://github.com/red/red/issues/4190#issuecomment-601396209>

    May be related to #3797 ?

