
#1059: Current Red cannot compile SQLite binding example script do-sql.red anymore
================================================================================
Issue is closed, was reported by iArnold and has 12 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1059>

Needed database for my project, so used the binding from Kaj's contributions
While Red 0.4.3 and Red 0.5.0 compiled the script do-sql.red from SQLite/examples without any problem, the newest Red doesn't:

Copyright 2000-2011 REBOL Technologies.  All rights reserved.
REBOL is a trademark of REBOL Technologies. WWW.REBOL.COM

> > cd red
> > == %/C/project/red/
> > do/args %red.r "-c %../bind/SQLite/examples/do-sql.red"

-=== Red Compiler 0.5.0 ===-

Compiling /C/project/bind/SQLite/examples/do-sql.red ...
**\* Red Compiler Internal Error: Script Error : Cannot use divide on none! value
**\* Where: make-typeset
**\* Near:  [forall symbols [
append init to set-word! symbols/1
new-line back tail init on
if symbols/1 = '~local [args?: no]
if all [
args?
blk: emit-type-checking symbols/1 spec
] [
append init blk
append init (index? symbols) - 1
]
either head? symbols [
append/only init 'stack/arguments
] [
repend init [symbols/-1 '+ 1]
]
]
unless zero?
]




Comments:
--------------------------------------------------------------------------------

On 2015-03-13T12:54:02Z, iArnold, commented:
<https://github.com/red/red/issues/1059#issuecomment-78958393>

    The error takes place in compiler.r script, it cites the lines 2147 thru 2164 where a change was authored 17 days ago: https://github.com/red/red/commit/3d15e1d3133a7d8229d6880c7b0b5ed5193a0fe9
    Likely that this change has something to do with this error.

--------------------------------------------------------------------------------

On 2015-03-13T14:09:52Z, iArnold, commented:
<https://github.com/red/red/issues/1059#issuecomment-78987230>

    Compiling with some prints and using compilestring
    do/args %red.r "-v 1 --red-only %../bind/SQLite/examples/do-sql.red"
    
    name log-error
    init and on
    [
        ctx: TO_CTX (ctx657)
        push ctx/values
        ctx/values: as node! stack/arguments
    ]
    true
    symbols
    [~db]
    **\* Red Compiler Internal Error: Script Error : Cannot use divide on none! value
    **\* Where: make-typeset
    **\* Near:  [forall symbols [
    
    So the error is triggered by the first function in do-sql.red
    log-error: function ["Log SQLite error."
        db          [sqlite!]
    ][
        print ["Error:" form-error db]
    ]
    
    Hope this helps track this error and make Red 0.5.1 also able to compile this example script like its predecessor releases.

--------------------------------------------------------------------------------

On 2015-03-13T15:10:17Z, dockimbel, commented:
<https://github.com/red/red/issues/1059#issuecomment-79028499>

    The compiler is crashing on the invalid datatype `[sqlite!]`, even if it crashes instead of reporting a proper error, that code construction still remains invalid. The previous versions of Red did not have proper error checking implemented, so that error was passing silently.
    
    I suggest asking Kaj to fix that invalid datatype (or you can do it yourself as it's very trivial).
    
    I will add a proper error reporting to the compiler for such cases.

--------------------------------------------------------------------------------

On 2015-03-13T15:22:21Z, dockimbel, commented:
<https://github.com/red/red/issues/1059#issuecomment-79040788>

    Now the compiler will provide a more helpful error reporting:
    
    ```
    *** Compilation Error: invalid datatype name: sqlite!
    *** in file: %/C/dev/Red/tests/bug.red
    *** near: ["Log SQLite error." db [sqlite!]]
    ```

--------------------------------------------------------------------------------

On 2015-03-13T20:25:14Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/1059#issuecomment-79347670>

    I tried to equate it to integer!, similar to Red/System, but I guess user defined types don't work.

--------------------------------------------------------------------------------

On 2015-03-14T05:53:02Z, dockimbel, commented:
<https://github.com/red/red/issues/1059#issuecomment-79952743>

    It's not supported by Red language. I'm not sure if we will support such feature in the future, though, it might be possible to implement it using the future Red macros system.

