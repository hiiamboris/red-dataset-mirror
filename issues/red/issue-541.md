
#541: Compiler crash on existing output folder
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/541>

Target directory already exists:

{r2 -sw ~/Red/Red/red.r -t Linux  -o Linux/RedSystem/ ~/Red/C-library/examples/Fibonacci/Fibonacci.reds}

-=== Red Compiler 0.4.0 ===- 

Compiling /home/kaj/Red/C-library/examples/Fibonacci/Fibonacci.reds ...

Compiling to native code...
**\* Red/System Compiler Internal Error: Access Error : Cannot make directory /home/kaj/Red/test/Linux/RedSystem/ 
**\* Where: build 
**\* Near:  [write/binary/direct file job/buffer 
if fun:
]



