
#366: Compilation of code outside of the Red/ path fails under Windows
================================================================================
Issue is closed, was reported by PeterWAWood and has 64 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/366>

When compiling code outside of the Red/ path under Windows, the compilation from Red/System to machine code fails.

Code

``` rebol
Red []
print 1
```

Output

```
>> do/args %red.r %../../Code/Red/test.red
Script: "Red command-line front-end" (none)
Script: "Red compiler" (none)
Script: "Red/System compiler" (none)
Script: "REBOL code profiling tool" (none)
Script: "REBOL 3 Forward Compatibility Functions" (23-Feb-2011)
Script: "Red/System integer! to binary! conversion library" (none)
Script: "Red/System IEEE-754 library" (none)
Script: "Red/System struct! datatype replacement library" (none)
Script: "secure-clean-path" (19-Sep-2002)
Script: "Red/System linker" (none)
Script: "Red/System code emitter" (none)
Script: "Red/System code emitter base object" (none)

-= Red Compiler =-
Compiling ../../Code/Red/test.red ...

...compilation time:     79 ms
Compiling to native code...

Script: "Red/System IA-32 code emitter" (none)
Script: "Red/System PE/COFF format emitter" (none)
*** Red/System Compiler Internal Error: Access Error : Cannot open /c/program files (x86)/re
bol/view/test.exe
*** Where: build
*** Near:  [write/binary/direct file job/buffer
if find
]
```



Comments:
--------------------------------------------------------------------------------

On 2013-01-04T22:38:27Z, dockimbel, commented:
<https://github.com/red/red/issues/366#issuecomment-11903191>

    It seems the problem is caused by your `test.exe` file been locked, so it cannot be overwritten (it was probably running already). Can you try it again?

--------------------------------------------------------------------------------

On 2013-01-04T23:24:04Z, PeterWAWood, commented:
<https://github.com/red/red/issues/366#issuecomment-11904692>

    I tried again and checked that test.exe was not running. I guess the problem is the Red/System compiler trying to write to the program files directory. But why does it do that? I'll show the full console log:
    
    ```
    REBOL/View 2.7.8.3.1 1-Jan-2011
    Copyright 2000-2011 REBOL Technologies.  All rights reserved.
    REBOL is a trademark of REBOL Technologies. WWW.REBOL.COM
    
    
    Type desktop to start the Viewtop.
    >> change-dir %/e/Languages/Red
    == %/e/Languages/Red/
    >> do/args %red.r %../../Code/Red/test.red
    Script: "Red command-line front-end" (none)
    Script: "Red compiler" (none)
    Script: "Red/System compiler" (none)
    Script: "REBOL code profiling tool" (none)
    Script: "REBOL 3 Forward Compatibility Functions" (23-Feb-2011)
    Script: "Red/System integer! to binary! conversion library" (none)
    Script: "Red/System IEEE-754 library" (none)
    Script: "Red/System struct! datatype replacement library" (none)
    Script: "secure-clean-path" (19-Sep-2002)
    Script: "Red/System linker" (none)
    Script: "Red/System code emitter" (none)
    Script: "Red/System code emitter base object" (none)
    
    -= Red Compiler =-
    Compiling ../../Code/Red/test.red ...
    
    ...compilation time:     94 ms
    
    Compiling to native code...
    
    Script: "Red/System IA-32 code emitter" (none)
    Script: "Red/System PE/COFF format emitter" (none)
    *** Red/System Compiler Internal Error: Access Error : Cannot open /c/program files (x86)/re
    bol/view/test.exe
    *** Where: build
    *** Near:  [write/binary/direct file job/buffer
    if find
    ]
    
    >> pwd
    == %/e/Languages/Red/red-system/
    >>
    ```

--------------------------------------------------------------------------------

On 2013-01-05T10:28:41Z, dockimbel, commented:
<https://github.com/red/red/issues/366#issuecomment-11912480>

    Thanks, I will investigate that further.

--------------------------------------------------------------------------------

On 2013-01-06T11:50:43Z, dockimbel, commented:
<https://github.com/red/red/issues/366#issuecomment-11927403>

    The error message is caused by Windows forbidding to write to ProgramFiles folder. Beyond that, I cannot reproduce your problem:
    
    ```
    REBOL/View 2.7.8.3.1 1-Jan-2011
    Copyright 2000-2011 REBOL Technologies.  All rights reserved.
    REBOL is a trademark of REBOL Technologies. WWW.REBOL.COM
    
    
    Type desktop to start the Viewtop.
    >> change-dir %//dev/Red/
    == %/C/dev/Red/
    >> do/args %red.r "%../../tmp/tests/inc.red"
    Script: "Red command-line front-end" (none)
    Script: "Red compiler" (none)
    Script: "Red/System compiler" (none)
    Script: "REBOL code profiling tool" (none)
    Script: "REBOL 3 Forward Compatibility Functions" (23-Feb-2011)
    Script: "Red/System integer! to binary! conversion library" (none)
    Script: "Red/System IEEE-754 library" (none)
    Script: "Red/System struct! datatype replacement library" (none)
    Script: "secure-clean-path" (19-Sep-2002)
    Script: "Red/System linker" (none)
    Script: "Red/System code emitter" (none)
    Script: "Red/System code emitter base object" (none)
    
    -= Red Compiler =-
    Compiling ../../tmp/tests/inc.red ...
    
    ...compilation time:     97 ms
    
    Compiling to native code...
    
    Script: "Red/System IA-32 code emitter" (none)
    Script: "Red/System PE/COFF format emitter" (none)
    ...compilation time:     4265 ms
    ...linking time:         125 ms
    ...output file size:     101376 bytes
    ```
    
    You would need to put some PROBEs in %rsc.r and %compiler.r to see where Red/System does select such target path.

--------------------------------------------------------------------------------

On 2013-01-06T13:50:40Z, PeterWAWood, commented:
<https://github.com/red/red/issues/366#issuecomment-11928626>

    From a quick look at the source and a quick test, I'd guess the issue is line 101 in red.r:
    
    ``` rebol
    opts/build-prefix: system/options/path
    ```
    
    I'm guessing that you are running Rebol from the Red directory and so don't hit the problem.
    
    The program compiles if I specify the output file. This console session 
    
    ```
    Type desktop to start the Viewtop.
    >> systems/options/path
    ** Script Error: systems has no value
    ** Near: systems/options/path
    >> system/options/path
    == %/c/program%20files%20%28x86%29/rebol/view/
    >> change-dir %/e/Languages/Red
    == %/e/Languages/Red/
    >> do/args %red.r "-o test %../../Code/Red/test.red"
    Script: "Red command-line front-end" (none)
    Script: "Red compiler" (none)
    Script: "Red/System compiler" (none)
    Script: "REBOL code profiling tool" (none)
    Script: "REBOL 3 Forward Compatibility Functions" (23-Feb-2011)
    Script: "Red/System integer! to binary! conversion library" (none)
    Script: "Red/System IEEE-754 library" (none)
    Script: "Red/System struct! datatype replacement library" (none)
    Script: "secure-clean-path" (19-Sep-2002)
    Script: "Red/System linker" (none)
    Script: "Red/System code emitter" (none)
    Script: "Red/System code emitter base object" (none)
    
    -= Red Compiler =-
    Compiling ../../Code/Red/test.red ...
    
    ...compilation time:     94 ms
    
    Compiling to native code...
    
    Script: "Red/System IA-32 code emitter" (none)
    Script: "Red/System PE/COFF format emitter" (none)
    ...compilation time:     4734 ms
    ...linking time:         79 ms
    ...output file size:     101376 bytes
    >> do/args %red.r %../../Code/Red/test.red
    Script: "Red command-line front-end" (none)
    
    -= Red Compiler =-
    Compiling ../../Code/Red/test.red ...
    
    ...compilation time:     93 ms
    
    Compiling to native code...
    
    Script: "Red/System IA-32 code emitter" (none)
    Script: "Red/System PE/COFF format emitter" (none)
    *** Red/System Compiler Internal Error: Access Error : Cannot open /c/program files (x86)/re
    bol/view/test.exe
    *** Where: build
    *** Near:  [write/binary/direct file job/buffer
    if find
    ]
    
    >
    ```

--------------------------------------------------------------------------------

On 2013-01-06T13:53:11Z, PeterWAWood, commented:
<https://github.com/red/red/issues/366#issuecomment-11928655>

    Sorry I clicked the wrong button :-(
    
    If the fix is tricky, it's no problem for me to copy REBOL into the Red directory.

--------------------------------------------------------------------------------

On 2013-01-06T14:33:45Z, dockimbel, commented:
<https://github.com/red/red/issues/366#issuecomment-11929084>

    No, I run REBOL from %/c/dev/SDK/tools/.

--------------------------------------------------------------------------------

On 2013-01-14T20:04:49Z, dockimbel, commented:
<https://github.com/red/red/issues/366#issuecomment-12236948>

    Could you please re-test this issue with the last fixes from `fix-issue-277` branch to see if those fixes are efficient for this specific issue?

--------------------------------------------------------------------------------

On 2013-01-15T02:49:48Z, PeterWAWood, commented:
<https://github.com/red/red/issues/366#issuecomment-12251164>

    I get this error on the fix-issue-277 branch:
    
    ```
    >> pwd
    == %/e/Languages/Red/
    >> do/args %red.r %../../Code/Red/test.red
    Script: "Red command-line front-end" (none)
    *** Driver Internal Error: Script Error : .. has no value
    *** Where: fail
    *** Near:  [forall srcs [
    if slash <> first srcs/1 [
    srcs/1: clean-path join system/options/path srcs/1
    ]
    unless exists? srcs/1 [
    fail ["Cannot access source file:" src]
    ]
    ]
    reduce [srcs opts]
    ]
    ```
    
    Works on OS X

--------------------------------------------------------------------------------

On 2013-01-15T08:25:03Z, dockimbel, commented:
<https://github.com/red/red/issues/366#issuecomment-12257543>

    I have fixed this internal error. Now you should have a proper "Cannot access source file" error message.

--------------------------------------------------------------------------------

On 2013-01-15T08:51:38Z, PeterWAWood, commented:
<https://github.com/red/red/issues/366#issuecomment-12258166>

    Yes I now get the "Cannot access source file" error:
    
    ```
    >> change-dir %/e/Languages/Red
    == %/e/Languages/Red/
    >> do/args %red.r %../../Code/Red/test.red
    Script: "Red command-line front-end" (none)
    Script: "Red compiler" (none)
    Script: "Red/System compiler" (none)
    Script: "REBOL code profiling tool" (none)
    Script: "REBOL 3 Forward Compatibility Functions" (23-Feb-2011)
    Script: "Red/System integer! to binary! conversion library" (none)
    Script: "Red/System IEEE-754 library" (none)
    Script: "Red/System struct! datatype replacement library" (none)
    Script: "secure-clean-path" (19-Sep-2002)
    Script: "Red/System linker" (none)
    Script: "Red/System code emitter" (none)
    Script: "Red/System code emitter base object" (none)
    Cannot access source file: /c/program files (x86)/Code/Red/test.red
    ```
    
    The compiler is now using the directory of the REBOL executable as its base directory, previously it could find the source but was trying to write the Red executable to the directory of the REBOL executable.
    
    There is a simple workaround which is to use the fullpath of the source. It then demonstrates the issue with the Red executable:
    
    ```
    >> do/args %red.r %/e/Code/Red/test.red
    Script: "Red command-line front-end" (none)
    
    -= Red Compiler =-
    Compiling /e/Code/Red/test.red ...
    
    ...compilation time:     110 ms
    
    Compiling to native code...
    
    Script: "Red/System IA-32 code emitter" (none)
    Script: "Red/System PE/COFF format emitter" (none)
    *** Red/System Compiler Internal Error: Access Error : Cannot open /c/program files (x86)/re
    bol/view/test.exe
    ```
    
    Again, there is a simple workaround to specify the location of the executable:
    
    ```
    >> do/args %red.r "-o /e/Code/Red/test /e/Code/Red/test.red"
    Script: "Red command-line front-end" (none)
    
    -= Red Compiler =-
    Compiling /e/Code/Red/test.red ...
    
    ...compilation time:     93 ms
    
    Compiling to native code...
    
    Script: "Red/System IA-32 code emitter" (none)
    Script: "Red/System PE/COFF format emitter" (none)
    ...compilation time:     4875 ms
    ...linking time:         63 ms
    ...output file size:     103936 bytes
    ```
    
    I can happily live with the workarounds at this stage.

--------------------------------------------------------------------------------

On 2013-01-15T16:27:30Z, earl, commented:
<https://github.com/red/red/issues/366#issuecomment-12275485>

    If I understand correctly, the remaining problem is now due to differences between running the compiler via an OS command-line (`rebol path/to/red.r path/to/script.red`) vs running the compiler via the Rebol console (`do/args %path/to/red.r  %path/to/script.red`).

--------------------------------------------------------------------------------

On 2013-01-15T17:27:34Z, dockimbel, commented:
<https://github.com/red/red/issues/366#issuecomment-12278760>

    Basically yes. But my own tests seem to show that some cases are still broken, I need to do more tests after solving this "command-line vs console" paths mismatching.

--------------------------------------------------------------------------------

On 2013-01-15T18:16:22Z, earl, commented:
<https://github.com/red/red/issues/366#issuecomment-12281053>

    If we can't come up with a safe heuristic to detect `do/args` vs external calls, maybe it would be better to just use a wrapper to execute the compiler from the Rebol console. Basically something like the following:
    
    ``` rebol
    run-script: func [script [file!] args /local p r] [
        p: copy system/options/path
        system/options/path: what-dir
        r: do/args script args
        system/options/path: p
        r
    ]
    ```

--------------------------------------------------------------------------------

On 2013-01-15T18:43:16Z, dockimbel, commented:
<https://github.com/red/red/issues/366#issuecomment-12282346>

    It seems that `system/options/script` is set when run from command-line, but not from console.

--------------------------------------------------------------------------------

On 2013-01-16T10:30:44Z, dockimbel, commented:
<https://github.com/red/red/issues/366#issuecomment-12312575>

    Peter, could you give it a new try with the latest commit from `fix-issue-277` branch please?

--------------------------------------------------------------------------------

On 2013-01-16T12:35:50Z, PeterWAWood, commented:
<https://github.com/red/red/issues/366#issuecomment-12316607>

    I've tested with the latest commit on the fix-issue-277 branch butI'm afraid that I'm still getting the cannot access source file error:
    
    ```
    >> do/args %red.r %../../Code/Red/test.red
    Script: "Red command-line front-end" (none)
    Cannot access source file: /c/program files (x86)/Code/Red/test.red
    >> system/options/script
    == none
    >> system/script/path
    == %/e/Languages/Red/
    ```
    
    If I change lines 101 & 121 of %red.r to use system/script/path then it works just fine. I also tested compiling the same test program from the command line under both Ubuntu and OS X, again it worked. I ran the complete test suite successfully with these patches in all three environments, Windows from the REBOL/View console, the others from the command line.

--------------------------------------------------------------------------------

On 2013-01-16T12:38:20Z, dockimbel, commented:
<https://github.com/red/red/issues/366#issuecomment-12316671>

    Thanks Peter, I will test your fix here, that might just be the right trick to finish this series of path fixes.
    
    Actually, `any [system/options/script system/script/path]` at line 101, is probably what is required to make it work in all use cases.

--------------------------------------------------------------------------------

On 2013-01-16T13:40:54Z, PeterWAWood, commented:
<https://github.com/red/red/issues/366#issuecomment-12318756>

    Nenad
    
    Your change also needs to be applied to line 121:
    
    ```
    srcs/1: clean-path join system/options/path srcs/1  ;-- add working dir path
    
    ``
    ```

--------------------------------------------------------------------------------

On 2013-01-16T13:43:21Z, dockimbel, commented:
<https://github.com/red/red/issues/366#issuecomment-12318836>

    I saw that (too late), so I have pushed a new commit just now for that. Thanks for noticing.

--------------------------------------------------------------------------------

On 2013-01-16T14:00:10Z, PeterWAWood, commented:
<https://github.com/red/red/issues/366#issuecomment-12319435>

    I'm still getting the cannot access source file error. The 'ANY isn't working as expected because system/options/path is set to the dir of the REBOL executable (It seemed to be 'NONE before but I guess that must have been some unintended side effect). I've added some debug prints to show the effect of the inserted call of 'ANY: 
    
    ```
    Type desktop to start the Viewtop.
    >> change-dir %/e/Languages/Red
    == %/e/Languages/Red/
    >> system/options/path
    == %/c/program%20files%20%28x86%29/rebol/view/
    >> do/args %red.r %../../Code/Red/test.red
    Script: "Red command-line front-end" (none)
    Script: "Red compiler" (none)
    Script: "Red/System compiler" (none)
    Script: "REBOL code profiling tool" (none)
    Script: "REBOL 3 Forward Compatibility Functions" (23-Feb-2011)
    Script: "Red/System integer! to binary! conversion library" (none)
    Script: "Red/System IEEE-754 library" (none)
    Script: "Red/System struct! datatype replacement library" (none)
    Script: "secure-clean-path" (19-Sep-2002)
    Script: "Red/System linker" (none)
    Script: "Red/System code emitter" (none)
    Script: "Red/System code emitter base object" (none)
    system/options/path /c/program files (x86)/rebol/view/
    system/script/path /e/Languages/Red/
    base-path /c/program files (x86)/rebol/view/
    Cannot access source file: /c/program files (x86)/Code/Red/test.red
    ```
    
    I always seem to have problems with file paths in REBOL, I hope I'm not a jinx on them.

--------------------------------------------------------------------------------

On 2013-01-16T18:50:15Z, earl, commented:
<https://github.com/red/red/issues/366#issuecomment-12333657>

    Hmm, I don't think that `system/options/script` being set is a totally safe heuristic, but if you want to use that, [line 99](https://github.com/dockimbel/Red/commit/59f7ec82f5b5239f1c92c3b845cc16edae0fe311#L0R99) should probably rather be:
    
    `either none? system/options/script [system/options/path] [system/script/path]`
    
    (I think the current `any [system/options/path system/script/path]` should do nothing, as `system/options/path` _should_ always be set.)

--------------------------------------------------------------------------------

On 2013-01-16T21:09:15Z, dockimbel, commented:
<https://github.com/red/red/issues/366#issuecomment-12340166>

    Right Andreas, that shows you how confused I am with all the REBOL system paths and their confusing names...

--------------------------------------------------------------------------------

On 2013-01-16T21:10:26Z, dockimbel, commented:
<https://github.com/red/red/issues/366#issuecomment-12340223>

    Andreas, have you find use-cases, where `system/options/script` cannot be used to distinguish command-line from console script launching method?

--------------------------------------------------------------------------------

On 2013-01-16T21:41:26Z, dockimbel, commented:
<https://github.com/red/red/issues/366#issuecomment-12341747>

    Andreas, with your proposed fixed, the following use-case doesn't pass anymore:
    
    ```
    >> do/args %Red/red.r %Red/red/tests/demo.red
    Cannot access source file: /root/Bureau/Red/Red/red/tests/demo.red
    ```
    
    It still passes when run from console with:
    
    ```
    $ rebol -qws Red/red.r %Red/red/tests/demo.red
    ```
    
    EDIT: sorry, I've inverted the test cases results, it's now in the right order, the one failing is the one from the console.

--------------------------------------------------------------------------------

On 2013-01-17T00:24:13Z, dockimbel, commented:
<https://github.com/red/red/issues/366#issuecomment-12348367>

    Ok, it seems the only solution to overcome the REBOL internal bad working dir issue is to re-sync with OS path in order to compensate for REBOL's internal "cd" when DOing a script. I will test that solution tomorrow.

--------------------------------------------------------------------------------

On 2013-01-17T02:49:27Z, PeterWAWood, commented:
<https://github.com/red/red/issues/366#issuecomment-12352126>

    Changing line 99 of red.r as below fixes the problem for me. I've tested under Windows 7 (REBOL/View console). Ubuntu (command line) and OS X (command line). Also run-all.r continues to work after the change.
    
    from
    
    ``` rebol
    base-path: any [system/options/path system/script/path]
    ```
    
    to 
    
    ``` rebol
    base-path: either any [
        system/options/path = none
        system/options/path = first split-path system/options/boot 
    ][
        system/script/path
    ][
        system/options/path 
    ]
    ```
    
    It's a little verbose. Testing system/options/path = none may not be strictly necessary. 

--------------------------------------------------------------------------------

On 2013-01-17T02:57:59Z, earl, commented:
<https://github.com/red/red/issues/366#issuecomment-12352288>

    Hah! R2 has `system/script/parent/path` (which I never noticed before) which, from a few first tests, seems to be pretty reliable and exactly what we need: the current working directory a script was started from.
    
    I did the following tests using R2/Core 2.7.8 on Linux:
    
    <table>
    <tr><td>cwd</td><td>shell</td><td>rebol</td></tr>
    <tr>
    <td>/tmp/foo/red</td>
    <td>rebol2 -qws red.r red/tests/demo.red</td>
    <td>-</td>
    </tr>
    <tr>
    <td>/tmp/foo</td>
    <td>rebol2 -qws red/red.r red/red/tests/demo.red</td>
    <td>-</td>
    </tr>
    <tr>
    <td>/tmp/foo/red</td>
    <td>rebol2</td>
    <td>do/args %red.r %red/tests/demo.red</td>
    </tr>
    <tr>
    <td>/tmp/foo</td>
    <td>rebol2</td>
    <td>change-dir %red/ <br> do/args %red.r %red/tests/demo.red</td>
    </tr>
    <tr>
    <td>/tmp</td>
    <td>rebol2</td>
    <td>change-dir %foo/ <br> do/args %red/red.r %red/red/tests/demo.red</td>
    </tr>
    </table>
    
    So the fix would just be to use `base-path: system/script/parent/path`. Let's hope `system/script/parent/path` works on Windows/OSX as well.

--------------------------------------------------------------------------------

On 2013-01-17T03:07:06Z, PeterWAWood, commented:
<https://github.com/red/red/issues/366#issuecomment-12352477>

    The change that I suggested works in the REBOL console under OS X and Liunx provided that the pwd isn't changed by change-dir in the REBOL console session ... so it doesn't really work :-(
    
    I'll test Andreas fix.

--------------------------------------------------------------------------------

On 2013-01-17T03:41:19Z, PeterWAWood, commented:
<https://github.com/red/red/issues/366#issuecomment-12353187>

    I've tested Andreas's monumental discovery and resultant fix and found that it works in the following situations:
    
    Windows REBOL console
    OS X & Ubuntu command line and REBOL Console (with and without using change-dir)
    
    The change has no adverse affect on run-all.r

--------------------------------------------------------------------------------

On 2013-01-17T03:44:59Z, earl, commented:
<https://github.com/red/red/issues/366#issuecomment-12353262>

    As it really seems to work in all cases tested so far, I tentatively pushed a `system/script/parent/path` commit so that others can try directly using the `fix-issue-277` branch.

--------------------------------------------------------------------------------

On 2013-01-17T11:17:18Z, dockimbel, commented:
<https://github.com/red/red/issues/366#issuecomment-12363760>

    Andreas, your fix works well with all my test cases. Great job! Thank you very much for your help!

