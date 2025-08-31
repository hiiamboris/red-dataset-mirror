
#2475: CALL behaves unexpectedly
================================================================================
Issue is closed, was reported by meijeru and has 18 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2475>

I would have expected the new `call` to behave like the Rebol 2 one. However, in Red I get a `-1` result (error?) where Rebol 2 executes as expected.
Rebol 2:
```
>> call/show/console "dir"
 Volume in drive C is OS
 Volume Serial Number is EA0A-4A1B

 Directory of C:\Program Files (x86)\rebol-sdk\tools

21/06/2016  22:50    <DIR>          .
21/06/2016  22:50    <DIR>          ..
01/01/2011  16:06           647,168 enbase.exe
...
01/01/2011  16:06           864,256 rebview.exe
21/06/2016  22:50                 3 test.txt
              15 File(s)      7,699,265 bytes
               3 Dir(s)  44,753,403,904 bytes free
== 0
```
Red (--cli): 
```
--== Red 0.6.1 ==--
Type HELP for starting information.

red>> call/show/console "dir"
== -1
```




Comments:
--------------------------------------------------------------------------------

On 2017-03-11T15:02:08Z, dockimbel, commented:
<https://github.com/red/red/issues/2475#issuecomment-285871984>

    `dir` is not an executable, but a command from the CMD.exe interpreter, so you need either to provide the additional `/shell` option, or add the CMD processor to your command string:
    ```
    call/console/shell "dir"
    ```
    or
    ```
    call/console "cmd /c dir"
    ```
    
    I am not sure why it works from Rebol2, I guess the R2 console is using the Console API internally, so as a side-effect, it can maybe run DOS commands directly?...
    
    Moreover,
    -  `/show` is not needed in such case.
    - the current GUI console does not support IO redirection (for now).

--------------------------------------------------------------------------------

On 2017-03-11T15:14:05Z, dockimbel, commented:
<https://github.com/red/red/issues/2475#issuecomment-285872638>

    Monitoring system calls from Rebol2:
    ```
    	Time of Day	Thread	Module	API	Return Value	Error	Duration
    3	11:07:31.965 PM	1	rebcmdview.exe	CreateProcessA ( NULL, "dir", NULL, NULL, TRUE, CREATE_DEFAULT_ERROR_MODE, NULL, NULL, 0x0036fcf4, 0x0036fd48 )	FALSE	2 = The system cannot find the file specified. 	0.0008708
    	Time of Day	Thread	Module	API	Return Value	Error	Duration
    38	11:07:31.965 PM	1	rebcmdview.exe	CreateProcessA ( NULL, "C:\Windows\system32\cmd.exe /c dir", NULL, NULL, TRUE, CREATE_DEFAULT_ERROR_MODE | CREATE_NEW_CONSOLE, NULL, NULL, 0x0036fcf4, 0x0036fd48 )	TRUE		0.0202686
    ```
    It shows that Rebol tries twice, once directly, and if it fails, it tries again, forcing the `/shell` option. :smile: 

--------------------------------------------------------------------------------

On 2017-03-11T15:21:16Z, meijeru, commented:
<https://github.com/red/red/issues/2475#issuecomment-285873380>

    Thanks very much for the explanation. I was indeed "spoiled" by the leniency of Rebol 2. It is now clear to me. @greggirwin is this something for the Guru Meditations?

--------------------------------------------------------------------------------

On 2017-03-11T15:25:02Z, dockimbel, commented:
<https://github.com/red/red/issues/2475#issuecomment-285874194>

    You're welcome. I am looking into our CALL implementation to see if we can easily include such fallback on Windows platform.

--------------------------------------------------------------------------------

On 2017-03-11T15:47:26Z, dockimbel, commented:
<https://github.com/red/red/issues/2475#issuecomment-285876345>

    The fallback mode has been implemented in Red's CALL too now, so you can just use `call/console "dir"`.

--------------------------------------------------------------------------------

On 2017-03-11T20:41:44Z, geekyi, commented:
<https://github.com/red/red/issues/2475#issuecomment-285898542>

    Mmm.. I'm not sure if this is the right thing to do.. On the one hand it simplifies the interface, on the other.. It may make things harder to debug.
    (a problem I had with rebol2 call is it sometimes hanged.. and I wasn't sure how I had to go debugging it)
    
    I'd prefer if it shows an error suggesting to use `/shell` instead, after checking if such a command exists. My preference of course 
    
    Now that I understand more how stuff works internally.. I may feel different after using..

--------------------------------------------------------------------------------

On 2017-03-11T21:49:32Z, x8x, commented:
<https://github.com/red/red/issues/2475#issuecomment-285902781>

    Automatic fallback to using` /shell` would make debugging more cumbersome, and because it will execute the command 2 times it will make it slower. I think one should learn when `/shell` is needed instead, so returning an error telling to maybe try with `/shell` would be more appropriate.

--------------------------------------------------------------------------------

On 2017-03-12T02:24:51Z, dockimbel, commented:
<https://github.com/red/red/issues/2475#issuecomment-285916606>

    @x8x It never executes the command twice, only once, and if the file is not found (no execution), the `/shell` option is then enforced, and a second attempt is made. Moreover, this applies to Windows only.

--------------------------------------------------------------------------------

On 2017-03-17T19:17:12Z, greggirwin, commented:
<https://github.com/red/red/issues/2475#issuecomment-287447326>

    Another consideration is consistency across OSs. `/shell` should have a clear meaning, but we can include detailed docs, if needed, to explain OS differences. 

