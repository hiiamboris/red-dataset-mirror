
#3196: Red console not compiling on a Linux 32bits
================================================================================
Issue is closed, was reported by gregit and has 4 comment(s).
[status.built] [status.tested] [type.review] [status.contribution]
<https://github.com/red/red/issues/3196>

### Expected behavior
First time running RED executable should compile the console.



### Actual behavior
`Compiling compression library...
Compiling Red console...
*** Runtime Error 23: illegal operand
*** at: 0806202Dh
`
note: using wine and windows binary works

### Steps to reproduce the problem
launch linux executable:
 `./red-063`

### Red version and build date, operating system with version.

Debian Stretch

`$uname -r
4.9.0-5-686-pae`

`$ lscpu
Architecture :        i686
Mode(s) opératoire(s) des processeurs : 32-bit
Boutisme :            Little Endian
Processeur(s) :       1
Liste de processeur(s) en ligne : 0
Thread(s) par cœur : 1
Cœur(s) par socket : 1
Socket(s) :           1
Identifiant constructeur : GenuineIntel
Famille de processeur : 15
Modèle :             2
Nom de modèle :      Intel(R) Pentium(R) 4 CPU 2.40GHz
Révision :           7
`




Comments:
--------------------------------------------------------------------------------

On 2018-01-11T04:01:49Z, dockimbel, commented:
<https://github.com/red/red/issues/3196#issuecomment-356818234>

    The automatic check for SSE3 presence has only been implemented on Windows so far, so the compiled code generates some SSE3 instructions, resulting in a crash.
    
    It should just need a couple of lines of code to implement such detection reading from `/proc/cpuinfo` from `red.r`.
    
    In the meantime, you can also manually compile the Red console:
    1. Add `cpu-version: 1.0` entry into the `Linux` target definition in `system/config.r`
    2. Compile the console using manually using:
    `do/args %red.r "-r %environment/console/console.red`

--------------------------------------------------------------------------------

On 2018-01-13T11:31:31Z, gregit, commented:
<https://github.com/red/red/issues/3196#issuecomment-357428081>

    ```
    ./red-13jan18-a27989f 
    ** Script Error: Invalid argument: flags any space :
    ** Where: context
    ** Near: SSE3?: parse cpuinfo [any [thru ["flags" any space ":"] to "sse3" to newline to end]]
    ```

