
#3349: VIEW Camera: Access Violation in Red --cli and error bug in GUI Console
================================================================================
Issue is closed, was reported by gltewalt and has 8 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/3349>

### Expected behavior
Expect an error message with an invalid selection.
`view [camera select 0]`
`This device cannot preview!`
### Actual behavior
In Red --cli
```
*** Runtime Error 1: access violation
*** at: 772822E2h
``` 

In GUI Console:
Window loses focus and the following output is returned.
```
>> view [camera select 1]
This device cannot preview!
This device cannot preview!
```


### Steps to reproduce the problem
Make an invalid selection with `view [camera select <your-selection-number>]`
### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 657 date: 25-Apr-2018/2:03:29 commit: #e80f0759eaef05e18d65426cf25b7e5727a6737e ]
PLATFORM: [ name: "Windows 7" OS: 'Windows arch: 'x86-64 version: 6.1.0 build: 7601 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2018-04-25T23:20:53Z, qtxie, commented:
<https://github.com/red/red/issues/3349#issuecomment-384463902>

    @gltewalt I pushed a fix, let me know if it fixes your issue.

--------------------------------------------------------------------------------

On 2018-04-26T20:18:56Z, gltewalt, commented:
<https://github.com/red/red/issues/3349#issuecomment-384775979>

    Fixed except for GUI Console loses focus after:
    ```
    *** Access Error: cannot open: 0
    *** Where: make-view
    *** Stack: view show show  
    ```

--------------------------------------------------------------------------------

On 2018-12-24T06:36:01Z, gltewalt, commented:
<https://github.com/red/red/issues/3349#issuecomment-449692721>

    GUI Console still loses focus after an error, even though it doesn't appear to lose focus. 
    The GUI Console must be clicked on for it to respond to any keyboard input. After clicking in the window, it works as it should.

--------------------------------------------------------------------------------

On 2020-03-12T15:39:08Z, hiiamboris, commented:
<https://github.com/red/red/issues/3349#issuecomment-598257259>

    Dupe of https://github.com/red/red/issues/3288

