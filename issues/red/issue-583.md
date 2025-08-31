
#583: Android build failure on simple-io
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 8 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/583>

{r2 -sw ~/Red/Red/red.r -t Android  -o Android/Red/console ~/Red/Red/red/tests/console.red}

-=== Red Compiler 0.4.0 ===- 

Compiling /home/kaj/Red/Red/red/tests/console.red ...
...compilation time:     275 ms

Compiling to native code...
**\* Compilation Error: invalid path value 
**\* in file: %/home/kaj/Red/Red/red/tests/console.red 
**\* in function: exec/read-argument
**\* at line: 1 
**\* near: [1 str: simple-io/read-txt args/item stack/set-last as cell! str]
console.red for Android failed



Comments:
--------------------------------------------------------------------------------

On 2013-11-29T00:42:52Z, dockimbel, commented:
<https://github.com/red/red/issues/583#issuecomment-29490691>

    %simple-io.r is not included when building for Android target for several reasons:
    - the __fxstat() dependency is not defined in the Bionic C library
    - there is no simple way to run a command-line console on Android (root privileges required)
    
    Though, it's far from impossible to achieve, but given the difficulty to run it, I consider it's not worth the effort.

--------------------------------------------------------------------------------

On 2013-11-29T00:50:26Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/583#issuecomment-29490851>

    I know that, but it should not lead to a build error, I think. It always built before, and it makes it hard to automate my build processes.

--------------------------------------------------------------------------------

On 2013-12-05T23:31:39Z, dockimbel, commented:
<https://github.com/red/red/issues/583#issuecomment-29949928>

    The console code relies on simple-io library to run, the compilation error is the expected result as `simple-io/read-txt` path is undefined.
    
    You should exclude the console.red script from your automatic building process for the Android target or even the whole Android target as it is unlikely anyone is testing the generated binaries given the difficulty to load and run them on a Android device.

--------------------------------------------------------------------------------

On 2013-12-06T17:50:34Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/583#issuecomment-30014173>

    I'll have to remove the official console from all my builds then. It's too much trouble to make exceptions for single targets.

