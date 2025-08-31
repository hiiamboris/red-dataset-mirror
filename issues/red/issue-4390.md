
#4390: Current subfolder persists in sequence of #includes in encap mode
================================================================================
Issue is open, was reported by loziniak and has 2 comment(s).
[type.bug]
<https://github.com/red/red/issues/4390>

When I create 4 files and 1 folder like that:
```
Red [Path: %./root1.red]
#include %root2.red
#include %root3.red
```
```
Red [Path: %./root2.red]
print "root2"    ;-- important!
#include %a/a1.red
```
```
Red [Path: %./a/a1.red]
```
```
Red [Path: %./root3.red]
```
I get an error, when trying to compile with `-e` or `-r -e`:
```
-=== Red Compiler 0.6.4 ===- 

Compiling /play/root1.red ...
*** Compilation Error: include file not found: root3.red 
*** in file: /play/root1.red
*** near: [
    #include %root3.red
]
```

Notes:
(1) Error can be worked-around by changing line 3 of `root1.red` to `#include %../root3.red`
(2) Also, removing line 2 of `root2.red` makes the error go away.
(3) Works fine also with `-r`.

Compiled using sources of latest `master` (commit c0f0fb619f6) under Arch Linux.

Seems similar to #2484, except for (2).


Comments:
--------------------------------------------------------------------------------

On 2020-04-08T14:05:15Z, hiiamboris, commented:
<https://github.com/red/red/issues/4390#issuecomment-610979953>

    Whole collection of unsolved #include trophies:
    #4422 https://github.com/red/red/issues/4249 https://github.com/red/red/issues/4139 https://github.com/red/red/issues/4128 https://github.com/red/red/issues/3921 https://github.com/red/red/issues/3550 https://github.com/red/red/issues/3464 https://github.com/red/red/issues/2484 https://github.com/red/REP/issues/56

