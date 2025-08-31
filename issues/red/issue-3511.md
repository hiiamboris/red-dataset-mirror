
#3511: Response of function ASK contains question
================================================================================
Issue is closed, was reported by DVL333 and has 8 comment(s).
<https://github.com/red/red/issues/3511>

Response of function ASK contains not only entered text, but a question also.

### Steps to reproduce the problem
```
>> name: ask "Enter your name "
Enter your name Sam
== "Sam"
>> print name
Enter your name Sam
```

It's wrong. Must be only "Sam"

### Red and platform version
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 839 date: 16-Aug-2018/9:37:36 commit: #22cf5fe67414ae44a9d731df3a9f8285d64c4a85 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 14393 ]
--------------------------------------------


Comments:
--------------------------------------------------------------------------------

On 2018-08-16T15:42:31Z, 9214, commented:
<https://github.com/red/red/issues/3511#issuecomment-413590675>

    ?
    ```Red
    >> name: ask "enter your name "
    enter your name Sam
    == "Sam"
    >> name
    == "Sam"
    >> print name
    Sam
    >> about
    Red 0.6.3 for Linux built 16-Aug-2018/14:00:15+05:00 commit #8cc5422
    ```

--------------------------------------------------------------------------------

On 2018-08-16T17:39:17Z, greggirwin, commented:
<https://github.com/red/red/issues/3511#issuecomment-413626590>

    @bitbegin was too fast! :^) Duped here on GUI console, but not CLI console. Fixed already. Thanks for the report @DVL333!

--------------------------------------------------------------------------------

On 2018-08-16T17:40:06Z, greggirwin, commented:
<https://github.com/red/red/issues/3511#issuecomment-413626834>

    I'm on simple-gc branch right now. @DVL333 please close this when you confirm the fix.

--------------------------------------------------------------------------------

On 2018-08-16T20:23:15Z, DVL333, commented:
<https://github.com/red/red/issues/3511#issuecomment-413673011>

    Confirm, the bug is fixed.

