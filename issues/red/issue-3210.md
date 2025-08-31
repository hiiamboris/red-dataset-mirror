
#3210: Call with redirected output does not finish
================================================================================
Issue is open, was reported by Oldes and has 32 comment(s).
[status.deferred] [type.bug]
<https://github.com/red/red/issues/3210>

I'm using Red script as a build tool and noticed, that `call/wait` function sometimes does not finish.

Without output redirection, there is such a output:
```
>> call/wait/console {gcc.exe -o Lua.exe  objs/lua.o objs/lapi.o ...}
objs/lua.o:lua.c:(.text+0xa4): undefined reference to `__imp_lua_gettop'
objs/lua.o:lua.c:(.text+0xbb): undefined reference to `__imp_lua_pushcclosure'
objs/lua.o:lua.c:(.text+0xcd): undefined reference to `__imp_lua_rotate'
...
collect2.exe: error: ld returned 1 exit status
```
But when using `/output` with `/error` to catch the output results, it stays waiting:
```
>> e: copy "" o: copy ""
>> call/wait/output/error {gcc.exe -o Lua.exe  objs/lua.o objs/lapi.o ...} o e
```
Using just `/error` or `/output` is also finishing as expected. It is only when both are used.


Comments:
--------------------------------------------------------------------------------

On 2018-04-25T08:19:25Z, qtxie, commented:
<https://github.com/red/red/issues/3210#issuecomment-384201488>

    I did some tests, but cannot reproduce it. 
    @Oldes Does this issue still existing? 

--------------------------------------------------------------------------------

On 2018-04-25T08:48:07Z, Oldes, commented:
<https://github.com/red/red/issues/3210#issuecomment-384210776>

    I think it still exists as there is no reason why it should be magically fixed. To reproduce it, you probably need process, which needs more time to evaluate, like the compilation.
    
    I ended not using redirection at all, because there was one more reason - it prevents color output in console from the called process.

--------------------------------------------------------------------------------

On 2019-09-11T15:33:58Z, dockimbel, commented:
<https://github.com/red/red/issues/3210#issuecomment-530436219>

    @Oldes Can you still reproduce it? 
    
    Installing gcc + lua and finding a suitable Lua project to compile just to try to reproduce that case is too much for us.

--------------------------------------------------------------------------------

On 2019-09-11T17:25:26Z, Oldes, commented:
<https://github.com/red/red/issues/3210#issuecomment-530481019>

    @dockimbel @qtxie Unfortunately it is still there:
    ![image](https://user-images.githubusercontent.com/454805/64719777-41dc9180-d4c9-11e9-8ee5-a765777fedc2.png)
    
    
    You don't need any lua or lua project... I found it when compiling Lua using Red script. In the above screenshot you can see, that I _call_ gcc to make an exe from object... as there is just one object, it is of course an error. I guess. you can place any .o file to reproduce it.
    
    I guess that the problem is, that GCC is calling another process which throw an error (linker in this case).
    
    This is working just fine:
    ```
    e: copy "" o: copy "" call/wait/output/error {gcc.exe} o e ; will fill error into e and continue normally
    ```

--------------------------------------------------------------------------------

On 2019-09-13T16:04:48Z, dockimbel, commented:
<https://github.com/red/red/issues/3210#issuecomment-531296383>

    Could you compile Red console in debug mode and see if there's any error message showing up?

--------------------------------------------------------------------------------

On 2019-09-13T16:11:50Z, Oldes, commented:
<https://github.com/red/red/issues/3210#issuecomment-531298955>

    No messages in debug mode.

--------------------------------------------------------------------------------

On 2019-09-13T16:18:05Z, dockimbel, commented:
<https://github.com/red/red/issues/3210#issuecomment-531301068>

    Can you add a `/show` refinement to the `call/wait/output/error` to see if there's anything useful in the shell window?

--------------------------------------------------------------------------------

On 2019-09-13T16:20:55Z, Oldes, commented:
<https://github.com/red/red/issues/3210#issuecomment-531302013>

    `call/wait/output/error/show` shows nothing.

--------------------------------------------------------------------------------

On 2019-09-13T16:23:48Z, dockimbel, commented:
<https://github.com/red/red/issues/3210#issuecomment-531303085>

    Last debug request: could you please replace [this line](https://github.com/red/red/blob/master/runtime/call.reds#L173) by:
    ```
    res: platform/GetLastError
    ?? res
    res = ERROR_BROKEN_PIPE
    ```
    Also, you need to add `res` as the local variable to `read-from-pipe`.

--------------------------------------------------------------------------------

On 2019-09-13T16:33:47Z, Oldes, commented:
<https://github.com/red/red/issues/3210#issuecomment-531306373>

    No change... no output.

--------------------------------------------------------------------------------

On 2019-09-13T16:56:00Z, dockimbel, commented:
<https://github.com/red/red/issues/3210#issuecomment-531313265>

    Thanks for the tests. There's nothing else we can do about it for now, as we can't reproduce it locally to study it. The `call` implementation will be replaced in 0.7.x to become async and use a `call://` port, so there are chances that this issue will be gone in that new implementation.

--------------------------------------------------------------------------------

On 2019-09-13T17:16:20Z, dockimbel, commented:
<https://github.com/red/red/issues/3210#issuecomment-531319925>

    We tried running the Red test suite through `call`, creating many sub-processes and taking a long time to complete: no issue with it.
    ```
     call/wait/output/error/show {rebpro -s tests\run-all.r} o: "" e: ""
    ```

--------------------------------------------------------------------------------

On 2019-09-14T09:04:30Z, Oldes, commented:
<https://github.com/red/red/issues/3210#issuecomment-531463557>

    I believe it is not about time, but that the process/sub-processes are using `STD_ERROR_HANDLE` to output error messages, which is something what Rebol and Red never did. So above test makes no sense in this case. It is also [mentioned above](https://github.com/red/red/issues/3210#issuecomment-530481019) that it must be sub-process using the _error pipe_.
    

--------------------------------------------------------------------------------

On 2019-09-14T09:09:49Z, Oldes, commented:
<https://github.com/red/red/issues/3210#issuecomment-531463825>

    Maybe the problem is, when there are both outputs... (the regular and also with error) in use.

--------------------------------------------------------------------------------

On 2019-10-09T17:46:12Z, hiiamboris, commented:
<https://github.com/red/red/issues/3210#issuecomment-540111903>

    I tried it on a random .o file with TDM-GCC5:
    `loop 100 [o: copy "" e: copy "" call/wait/output/error {gcc -o junk.exe crt1.o} o e]`,
    and also with a simpler bat file `echo output! & ~~error_out~~` that uses both stdout and stderr:
    `{cmd /c my.bat 1>output.txt 2>errors.txt}`
    Can't reproduce either.

--------------------------------------------------------------------------------

On 2019-10-13T17:52:56Z, greggirwin, commented:
<https://github.com/red/red/issues/3210#issuecomment-541440737>

    Thanks for the test @hiiamboris.
    
    @Oldes, can you test from another lang that shells out to GCC+Lua?

