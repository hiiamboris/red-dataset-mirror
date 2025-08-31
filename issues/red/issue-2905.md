
#2905: keys-of not working when compiled / windows10
================================================================================
Issue is closed, was reported by kermitaner and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2905>

`Red[]
m: make map!["a" 1 "b" 2 "c" 3]
foreach k keys-of m[probe k]`
is giving an error :  "entry point exec/f_words-of"  when compiled with -u flag
OS windows10, with latest build from 20.7.2017
note from Gregg:
Looks like an aliasing issue on keys-of. If you change that to words-of, it works fine.


Comments:
--------------------------------------------------------------------------------

On 2017-07-21T04:54:22Z, dockimbel, commented:
<https://github.com/red/red/issues/2905#issuecomment-316902484>

    Good catch, thanks for reporting.
    
    The issue only happens in development mode (`-c` or `-u` compilation switches), not in release mode (`-r`).

--------------------------------------------------------------------------------

On 2017-07-21T08:04:32Z, dockimbel, commented:
<https://github.com/red/red/issues/2905#issuecomment-316933953>

    Please give it a try with the latest build. Try first compiling your code directly, if it fails, try with a `red clear` command first, then compile it again.

