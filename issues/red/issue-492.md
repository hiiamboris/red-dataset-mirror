
#492: Declaring some but not all local variables triggers compiler error
================================================================================
Issue is closed, was reported by iArnold and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/492>

I stumbled upon a possible bug with local variables.

``` REBOL
flexfun-s: function [s [string!] return: [string!]][return s]
flexfun-i: function [i [integer!] return: [integer!] ][return i]
flexfun: function [n [integer! float! string!] return: [string! integer! logic!] /local rv uitstr uitint][
    rv: type? n
    either "string" = rv [uitstr: flexfun-s n][uitint: flexfun-i n]
]
```

When I do not declare the uitstr and uitint local variables, but I do declare rv as local variable, the compiler makes a ~local extra and notices double declaration:
Compiling to native code... 

```
Script: "Red/System IA-32 code emitter" (none)
*** Compilation Error: duplicate variable definition in function exec/f_flexfun  
*** in file: %/Users/Arnold/data/develop/red/testscripts/flextst1.red 
*** at line: 126 
*** near: [func [/local ~n ~local ~rv ~local ~uitstr ~uitint] [
        push ctx194/values
```

When I declare both uitstr and uitint as local variable too, everything is ok.



