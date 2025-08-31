
#170: Internal error when passing struct result to a typed function (Was: Internal error on returning struct from import)
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 10 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/170>

**\* Compiler Internal Error: Script Error : emit-push expected value argument of type: char logic integer word block string tag path get-word object 
**\* Where: emit-argument 
**\* Near:  [forall list [
if block? unbox list/1 [comp-expression list/1 yes] 
if type <> 'inline [
emitter/target/emit-argument list/1 type
]
]]

This happens when I change a return value of an imported function previously defined as byte-ptr! to a struct! Other imports already returned structs! so that in itself is not the problem. When I try to isolate the problem by making the code smaller, the problem disappears, so it seems to be some internal limit or such.



Comments:
--------------------------------------------------------------------------------

On 2011-09-07T20:42:12Z, dockimbel, commented:
<https://github.com/red/red/issues/170#issuecomment-2033425>

    Could you add the following log lines juste before the `forall list` part and send me their last value just before the error?
    
    ```
    ?? name
    ?? args
    ?? list
    ```

--------------------------------------------------------------------------------

On 2011-09-07T20:56:45Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/170#issuecomment-2033597>

    The bug turns out to be triggered by the test program, when the result of a function that now returns a struct instead of a byte-ptr is used as an argument for a typed function.

--------------------------------------------------------------------------------

On 2011-09-07T21:05:29Z, dockimbel, commented:
<https://github.com/red/red/issues/170#issuecomment-2033688>

    I tried with the following code, it compiles without any issue:
    
    ```
    z: declare struct! [a [integer!]]
    z/a: 123
    foo: func [return: [struct! [a [integer!]]]][z]
    
    print z
    print [lf z lf 456]
    ```

--------------------------------------------------------------------------------

On 2011-09-07T21:13:15Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/170#issuecomment-2033765>

    Try this:
    
    ```
    Red/System []
    
    #include %GTK.reds
    
    gtk-begin
    gtk-view window icon "icon.png"
    ```

--------------------------------------------------------------------------------

On 2011-09-07T21:35:12Z, dockimbel, commented:
<https://github.com/red/red/issues/170#issuecomment-2033988>

    Ok, I can reproduce the issue now.

