
#2460: Interpreter gives wrong error message when when wrong arguments passed to `make image!`
================================================================================
Issue is closed, was reported by ghost and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2460>

Compiling 
```
img: make image! 123
```
gives - 
```
*** Script Error: cannot MAKE/TO image! from: 123
*** Where: make
*** Stack: set make
```
Whereas, interpreting it gives
```
*** Script Error: cannot MAKE/TO image! from: [script bad-to-arg]
*** Where: make
```


Comments:
--------------------------------------------------------------------------------

On 2017-03-03T14:54:30Z, dockimbel, commented:
<https://github.com/red/red/issues/2460#issuecomment-283974210>

    Good catch!

