
#611: Compiled SWITCH does not honor multiple case values
================================================================================
Issue is closed, was reported by hostilefork and has 8 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/611>

In the Red interpreter (and in Rebol) you get "x is either a one or a two" if you write:

```
x: 2
switch x [
    1 2 [print "x is either a one or a two"]
]
```

But if you use Red's `-c` option to compile this code, it will not print anything.  Changing x to 1 will print the message, however.

Using "0.4.1, 13-Dec-2013/23:19:35-5:00"



Comments:
--------------------------------------------------------------------------------

On 2013-12-18T14:08:21Z, dockimbel, commented:
<https://github.com/red/red/issues/611#issuecomment-30843769>

    Multiple keys in **switch** are not currently supported in the compiler. The issue is the handling of the blocks-as-keys cases, they are currently supported by the compiler, but they prevent the multiple keys support then because the compiler cannot statically determine which values are keys and which ones are action blocks.
    
    I really want to support multiple keys in the compiler too, so I think that we'll change the tradeoff and not allow block-as-key in the compiler. If the user really needs it, he will just wrap the **switch** in a **do [...]** block and let the interpreter handle it at runtime.

--------------------------------------------------------------------------------

On 2013-12-19T18:14:26Z, hostilefork, commented:
<https://github.com/red/red/issues/611#issuecomment-30951915>

    Changing the bias sounds like a plan, but I don't think the compiler and interpreter should have different semantics.   If the compiler rejects something the interpreter will allow, then that may just be the answer to this kind of situation.

--------------------------------------------------------------------------------

On 2013-12-19T18:18:56Z, dockimbel, commented:
<https://github.com/red/red/issues/611#issuecomment-30952254>

    Sure, we don't want to have different semantics, but we'll encounter such cases that will be resolved one by one as we progress towards 1.0.
    
    There is a not-yet-implemented last-resort fallback strategy for the compiler when facing not statically analyzable code: invoke the interpreter on the code instead of trying to compile it. But the cost can be very high as from that code position, everything until the current block tail will be interpreted (as we can't statically determine where an expression ends if we can't analyze it at compilation time).

--------------------------------------------------------------------------------

On 2015-02-15T09:27:05Z, iArnold, commented:
<https://github.com/red/red/issues/611#issuecomment-74410313>

    I suggested /block refinement for the blocks-as-key handling. @ dockimbel countered this with /only refinement as option. Personally I feel /only says little about the way in which the handling differs, /block is more descriptive.
    There could be also an alternative for switch with blocks-as-key: 'FORK
    
    I want to mention some other point to the 'switch and that is I like Red/System way of dealing with the default better than the /default Red and Rebol are using.
    
    I sincerely hope this issue will be fixed soon, since my projectcode makes heavily use of these multiple case situations and the rewriting makes them unpretty code.

