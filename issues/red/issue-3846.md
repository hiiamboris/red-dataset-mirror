
#3846: Unable to compile test-wpf.red
================================================================================
Issue is closed, was reported by Guevara-chan and has 12 comment(s).
[status.built] [type.review]
<https://github.com/red/red/issues/3846>

**Describe the bug**
Something gone terribly wrong:
```Compiling c:\1EXE\test-wpf.red ...
...using libRedRT built on 16-Apr-2019/14:08:40
...compilation time : 546 ms

Target: MSDOS

Compiling to native code...
*** Loading Error: file access error: %COM.reds
*** in file: %/c/1EXE/runtime/datatypes/structures.reds
*** at line: 332
```

**To reproduce**
Steps to reproduce the behavior:
Run `red-064 -c wpf-test.red` in terminal

**Expected behavior**
It should've work.


Comments:
--------------------------------------------------------------------------------

On 2019-04-16T15:37:10Z, 9214, commented:
<https://github.com/red/red/issues/3846#issuecomment-483714817>

    Ask for help in our [community chat](https://gitter.im/red/help) and give us more details with regard to this issue (at the very least, provide `wpf-test.red` file and describe what problem you're trying to solve).
    
    Nothing in the original message indicates that this is a bug (most likely it's a mistake on your side).

--------------------------------------------------------------------------------

On 2019-04-16T16:40:36Z, Guevara-chan, commented:
<https://github.com/red/red/issues/3846#issuecomment-483739052>

    https://github.com/red/red/blob/master/bridges/dotnet/test-wpf.red
    You, like, welcome.

--------------------------------------------------------------------------------

On 2019-04-16T16:48:43Z, 9214, commented:
<https://github.com/red/red/issues/3846#issuecomment-483751675>

    @Guevara-chan Ah, my bad, somehow I've missed it during file search.
    
    In such case compile in release mode (`-r` flag), and note that .NET bridge is a PoC prototype that hasn't been maintained since a while, and isn't expected to work (although I recall that a year back someone tested it and it worked fine).

--------------------------------------------------------------------------------

On 2019-04-16T17:45:43Z, greggirwin, commented:
<https://github.com/red/red/issues/3846#issuecomment-483775137>

    It will compile with `-r` for MSDOS, but you'll get this error running it:
    ```
    Error: not found class System.Object
    *** Script Error: meta-class needs a value
    *** Where: set
    *** Stack:
    ```
    If you add `Needs: View` to the header (and somebody should make a PR for this I think), it compiles fun and runs for me...sometimes. 25% OK, 75% nothing shows up. So there is work to be done here, but doable if you need it, want to contribute, and have the requisite skills.

--------------------------------------------------------------------------------

On 2019-04-16T18:12:24Z, 9214, commented:
<https://github.com/red/red/issues/3846#issuecomment-483785045>

    @greggirwin there's no need (no pun intended) for `Needs: View` (we use .NET's WPF, not View engine).
    
    Compiled executable indeed fails to run most of the time (either with `System.Object`, `System.Console` or `System.Reflection.Assembly` error), but once in a while WPF window finally pops up.
    
    <img src="https://user-images.githubusercontent.com/15716466/56234259-56456b00-609e-11e9-8d4c-fc6224c7949d.png" width="300">

--------------------------------------------------------------------------------

On 2019-04-19T11:24:05Z, qtxie, commented:
<https://github.com/red/red/issues/3846#issuecomment-484863374>

    @Guevara-chan The tests need to be compiled in release mode (-r flag). 
    
    As it's a PoC prototype and is incomplete, I moved it to the [red/code](https://github.com/red/code/tree/master/Library/dotNET) repository.

