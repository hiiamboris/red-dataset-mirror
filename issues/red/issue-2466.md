
#2466: Debug-memory function has some side effects - app crash
================================================================================
Issue is closed, was reported by Oldes and has 32 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/2466>

Hi..
sorry, but cannot provide small script, but when playing with COM code in Red/System, I noticed, that app crashes not because my particular errors (there was many of these and still a lot to solve), but in this case it is crashing only because I call `debug-memory` function.

Here is not finished script for WebBrowser integration (no additional files needed)
https://gist.github.com/Oldes/8c9e0ce26c1536f2ac54d601abdd5b82

When compiled, it should open a window and print a lot of info in console.
But when you un-comment this line:
https://gist.github.com/Oldes/8c9e0ce26c1536f2ac54d601abdd5b82#file-dump-memory-issue-reds-L824
app crashes.



Comments:
--------------------------------------------------------------------------------

On 2017-03-07T01:59:30Z, qtxie, commented:
<https://github.com/red/red/issues/2466#issuecomment-284597174>

    That means `ppvObject` point to an invalid memory address which cannot be access.

--------------------------------------------------------------------------------

On 2017-03-07T09:05:05Z, Oldes, commented:
<https://github.com/red/red/issues/2466#issuecomment-284662319>

    It would crash directly inside `dump-memory` function, wouldn't it? Notice that even the `print-line` on the [next line](https://gist.github.com/Oldes/8c9e0ce26c1536f2ac54d601abdd5b82#file-dump-memory-issue-reds-L825) is evaluated.

--------------------------------------------------------------------------------

On 2017-03-07T11:22:33Z, dockimbel, commented:
<https://github.com/red/red/issues/2466#issuecomment-284694947>

    I cannot reproduce the issue on my Win7-64 box. It works fine when I uncomment all the memory dumping calls in your code.

--------------------------------------------------------------------------------

On 2017-03-07T13:02:06Z, Oldes, commented:
<https://github.com/red/red/issues/2466#issuecomment-284715212>

    ![image](https://cloud.githubusercontent.com/assets/454805/23657466/877e91e8-033e-11e7-9c9c-b0c28b6fcdc4.png)
    is what I get on Win10 with the uncommented line 824.

--------------------------------------------------------------------------------

On 2017-03-07T13:08:43Z, Oldes, commented:
<https://github.com/red/red/issues/2466#issuecomment-284716542>

    Without the debug line, the evaluation continues and you should see in console something like:
    ```
    SetClientSite 0
    SetHostNames: 0
    Rect: 0 0x0 584x465
    OleSetContainedObject: 0
    
    DoVerb: 0
    WINDOW hWnd:069B0B9C
    ```

--------------------------------------------------------------------------------

On 2017-03-07T13:12:55Z, Oldes, commented:
<https://github.com/red/red/issues/2466#issuecomment-284717497>

    I don't say I have it without bug... I'm still not able to init the browser widget later (using `iObject/DoVerb`), but it is really strange that single debug call makes such a difference. Notice that without the `debug-memory` call, other browserObject calls like `SetClientSite`,  `SetHostNames` and `OleSetContainedObject` does not report any issues.

--------------------------------------------------------------------------------

On 2017-03-07T13:46:38Z, dockimbel, commented:
<https://github.com/red/red/issues/2466#issuecomment-284725197>

    We will test it tomorrow on a W10 machine. Anyway, it is very unlikely that the debug functions are the cause of your issue, they just read memory and print formatted output. Most probably, your code creates some corruption in the used structures or on the stack, and the debugging calls are just triggering it, resulting in a later crash.
    
    Anyway, we'll do a test to see if we can spot any issue with the debug functions.

--------------------------------------------------------------------------------

On 2017-03-07T14:39:43Z, Oldes, commented:
<https://github.com/red/red/issues/2466#issuecomment-284739459>

    Thanks... I cleaned the `EmbedBrowserObject` a little bit... there is really not that much code, when you don't count the definitions, so I wonder what is it.

--------------------------------------------------------------------------------

On 2017-03-07T15:33:27Z, Oldes, commented:
<https://github.com/red/red/issues/2466#issuecomment-284755739>

    If it helps... I don't see the issue, when I [comment these lines](https://github.com/red/red/blob/master/system/runtime/debug.reds#L221-L225) in `debug.reds`.

--------------------------------------------------------------------------------

On 2017-03-07T21:53:40Z, Oldes, commented:
<https://github.com/red/red/issues/2466#issuecomment-284871828>

    Btw... I managed to initialize the browser COM object successfully meanwhile. But I'm not updating the script with the changes as it just adds more functionality. It still fails with the debug memory call.

--------------------------------------------------------------------------------

On 2017-03-11T07:16:11Z, dockimbel, commented:
<https://github.com/red/red/issues/2466#issuecomment-285849500>

    The cause of the crash is that the compiler cannot infer that the function your are registering in the COM structures, will be later called by the OS (so an external call), and the function will miss to generate then the right prolog/epilog for the OS ABI conformity (mostly saving/restoring most of the CPU registers). The `dump-memory` function is modifying the esi/edi registers, so corrupting them and triggering a crash once back into the OS caller function.
    
    The compiler can check when a R/S function is passed to an external imported function as argument, and produce the right code to honor the OS ABI, but in cases where a R/S function reference is called indirectly (like here, where the reference is simply stored in a table), the compiler cannot identify it properly and requires manual setting.
    
    So, in order to avoid such crashes, you need to add to every function you pass as a callback to the OS, a `[callback]` attribute in the beginning of each spec block. 
    
    As R/S and Windows API are both using `stdcall` calling convention by default, no other attribute is necessary. But, in the case of a C lib using tables of R/S function pointers, the attribute needs then to be: `[callback cdecl]` in order to enforce the default C calling convention.
    

--------------------------------------------------------------------------------

On 2017-03-11T11:56:22Z, Oldes, commented:
<https://github.com/red/red/issues/2466#issuecomment-285862246>

    @qtxie The COM code should be than updated to use `[callback]` too. 
    https://github.com/red/red/blob/master/runtime/platform/COM.reds#L110

--------------------------------------------------------------------------------

On 2017-03-11T12:10:41Z, Oldes, commented:
<https://github.com/red/red/issues/2466#issuecomment-285862904>

    I can confirm, that with using the `[callback]` attribute, it is not crashing with `debug-memory` call anymore.

--------------------------------------------------------------------------------

On 2017-03-12T03:21:34Z, qtxie, commented:
<https://github.com/red/red/issues/2466#issuecomment-285918950>

    @Oldes This function is not used as a callback in my case. Though it should be no harm to add this attribute.

--------------------------------------------------------------------------------

On 2017-03-12T07:09:56Z, Oldes, commented:
<https://github.com/red/red/issues/2466#issuecomment-285926986>

    @qtxie I know you don't need to use it as a callback yet. But `QueryInterface!`, `AddRef!` and `Release!` are basic COM functions used in every `vtbl`. So if someone want to extend View with own COM object implementation, there are 3 possibilities:
    
    1. write own `QueryInterface!`, `AddRef!` and `Release!` definitions and basically `/runtime/platform/COM.reds` file ignore.
    2. don't use the `[callback]` argument and hope that it will work
    3. don't try to extend View in Red/System at all.
    
    @dockimbel I wonder if there is any performance hit or something when used the `[callback]` attribute? Also compiler now throws error when function alias have different attributes.. Is this necessary? Maybe it should ignore this case and use the attribute from the function definition, shouldn't it?  Or maybe the compiler could use the attribute if alias or definition contains it. And reduce need to write it in both cases?

--------------------------------------------------------------------------------

On 2017-03-14T07:26:26Z, dockimbel, commented:
<https://github.com/red/red/issues/2466#issuecomment-286342327>

    @Oldes Performance hit is irrevelant as every software running on an OS *has to* conform to the OS ABI in order to work. Function specifications need to match, you cannot have different attribute, as this would lead to hard to debug side-effects.
    
    For the existing potential callbacks in COM.reds, we will add the attribute (@qtxie).

