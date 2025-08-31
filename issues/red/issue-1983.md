
#1983: silent crash on >> type?/word event!
================================================================================
Issue is closed, was reported by SteeveGit and has 16 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/1983>

Try `view [button "crash" [type?/word event]]`



Comments:
--------------------------------------------------------------------------------

On 2016-06-09T15:10:19Z, SteeveGit, commented:
<https://github.com/red/red/issues/1983#issuecomment-224925965>

    Update:
    event? is also crashing.
    `view [button "ok" [event? event] button "crash" [event? 1]]`

--------------------------------------------------------------------------------

On 2016-06-09T17:09:50Z, dockimbel, commented:
<https://github.com/red/red/issues/1983#issuecomment-224962198>

    The `event?` crash case is caused by unwanted conversion of integer! to Red/System integer!, while the `event?` routine code expects a pointer, hence the crash: 
    
    ```
    event?: routine [value [any-type!] return: [logic!]][TYPE_OF(value) = TYPE_EVENT]
    ```
    
    We need a mechanism for routines to block the automatic conversions.

--------------------------------------------------------------------------------

On 2016-06-09T17:35:14Z, dockimbel, commented:
<https://github.com/red/red/issues/1983#issuecomment-224969272>

    For the first case of crashing, it is caused by missing `name/word` entry for event! in the name-table. Those /word entries are created by `datatype/make-words`, which is called only once and before modules are loaded.

--------------------------------------------------------------------------------

On 2016-06-09T17:48:45Z, SteeveGit, commented:
<https://github.com/red/red/issues/1983#issuecomment-224973322>

    Doc, do you take hints just by looking at the source code or do you use some tools to debug?
    As a trainee, I'm interested to know your work flow in such cases.

--------------------------------------------------------------------------------

On 2016-06-10T07:03:04Z, dockimbel, commented:
<https://github.com/red/red/issues/1983#issuecomment-225108511>

    First thing to do is to compile the above code in debug mode (`-d` option) or re-compile a GUI console version in debug mode. Many assertions and debug logs through the Red runtime code are not available in release mode.
    
    For the first crash, I went straight to the `type?` native source in `%runtime/natives.reds` and put some debug logs there:
    
    ```
        type?*: func [
            check?   [logic!]
            word?    [integer!]
            return:  [red-value!]
            /local
                dt   [red-datatype!]
                w    [red-word!]
                name [names!]
        ][
            #typecheck [type? word?]
    probe "in type native"
            either negative? word? [
                dt: as red-datatype! stack/arguments        ;-- overwrite argument
                dt/value: TYPE_OF(dt)                       ;-- extract type before overriding
                dt/header: TYPE_DATATYPE
                as red-value! dt
            ][
                w: as red-word! stack/arguments             ;-- overwrite argument
    stack/dump          
                name: name-table + TYPE_OF(w)               ;-- point to the right datatype name record
    ?? name
    dump4 name
    dump4 name/word
                stack/set-last as red-value! name/word
            ]
        ]
    ```
    
    Once compiled and run in debug mode, I saw the crash happening at `dump4 name/word` with following output:
    
    ```
    Hex dump from: 00000000h
    
    00000000:
    *** Runtime Error 1: access violation
    *** in file: /C/dev/Red/system/runtime/debug.reds
    [...]
    ```
    
    Looking at the previous dump (`dump4 name`), was showing that the `/word` field in that entry was indeed null instead of pointing to a red-word! value.
    
    So, I then searched in `runtime/datatype.reds` where the `name-table` array is filled, for the code which is filling `/word` field. It appeared to be done by `make-words` function, which is called only once in `runtime/red.reds`. That's the runtime main wrapping code, loading all the datatypes. As event! is only loaded with View module, it seems logical that the `/word` field for event! entry cannot be filled by `make-words`, resulting in this null pointer crash.
    
    For the second crash, this is how I proceeded:
    
    I looked at `event?` routine, and inserted a `?? value` to check the argument value:
    
    ```
    event?: routine [value [any-type!] return: [logic!]][?? value TYPE_OF(value) = TYPE_EVENT]
    ```
    
    The value was `1` instead of a pointer to a `red-value!` structure, which is caused by the interpreter (`event?` is called by interpreter in the above case) forcing the conversion of integers from Red to R/S.
    
    The tools I used the most for debugging Red's runtime code are: `probe`, `??`, `dump4`, `stack/dump` and `print-symbol`. Most of them are only available when code is compiled in debug mode. When it's a code generation issue (branching on wrong address, wrong opcodes emitted, etc..) I use [PE Explorer](http://www.heaventools.com/overview.htm) for inspecting assembly code or [IDA](https://www.hex-rays.com/products/ida/) when I need to step through the assembly code. On Linux/Mac, I use `objdump` for inspection and `gdb` for debugging at native level.
    
    Hope this helps. ;-)

--------------------------------------------------------------------------------

On 2016-06-10T07:24:20Z, SteeveGit, commented:
<https://github.com/red/red/issues/1983#issuecomment-225111661>

    Wow, Thanks a lot. I will put that in good use. 

--------------------------------------------------------------------------------

On 2016-06-15T11:15:27Z, dockimbel, commented:
<https://github.com/red/red/issues/1983#issuecomment-226158146>

    First crash is fixed, second one needs a redesign of routines arguments marshalling by interpreter (compiler does it correctly).

--------------------------------------------------------------------------------

On 2017-10-10T10:45:02Z, dockimbel, commented:
<https://github.com/red/red/issues/1983#issuecomment-335433877>

    Now the interpreter will accurately convert the routines arguments when needed.

