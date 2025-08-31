
#265: UCS2-to-UCS4 doesn't compile on ARM
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 4 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/265>

```
bash-4.0# red -t Linux-ARM /resources/Red/tests/hello.red 

-= Red Compiler =- 
Compiling /resources/Red/tests/hello.red ...

...compilation time:     103 ms

Compiling to native code... 

*** Compilation Error: a value in 0-7 range is required for this shift operation 
*** in file: %red/runtime/unicode.reds 
*** in function: red/unicode/UCS2-to-UCS4
*** at line: 114 
*** near: [<< (as integer! src/2) 8 src/1]
```



Comments:
--------------------------------------------------------------------------------

On 2012-10-04T12:53:01Z, dockimbel, commented:
<https://github.com/red/red/issues/265#issuecomment-9140126>

    I've fixed such issue for IA-32 backend recently (related issue #263), so this one should be quickly fixed too.

--------------------------------------------------------------------------------

On 2012-10-04T13:15:50Z, dockimbel, commented:
<https://github.com/red/red/issues/265#issuecomment-9140755>

    Untested fix, but should work.

