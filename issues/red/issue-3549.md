
#3549: Access violation when calling `help` after `recycle`
================================================================================
Issue is closed, was reported by dander and has 14 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3549>

### Expected behavior
no access violation
### Actual behavior
Both GUI and console crash with the help call, though it doesn't always happen the first time.
### Steps to reproduce the problem
```
>> recycle loop 3 [? recycle]
USAGE:
     RECYCLE

DESCRIPTION:
     RECYCLE is a native! value.

REFINEMENTS:
     /on          =>
     /off         =>

USAGE:
     RECYCLE

DESCRIPTION:
     RECYCLE is a native! value.

REFINEMENTS:
     /on          =>
     /off         =>


*** Runtime Error 1: access violation
*** at: 00429DEAh
```
### Red and platform version
```
-----------RED & PLATFORM VERSION-----------
RED: [ branch: "master" tag: #v0.6.3 ahead: 1060 date: 2-Oct-2018/3:13:15 commit: #bceaf7c09b7c61a8a2bc77a4669ab91ef4058dd3 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 17134 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2018-10-06T01:07:11Z, dockimbel, commented:
<https://github.com/red/red/issues/3549#issuecomment-427534461>

    Cannot reproduce on latest version from master branch. Please confirm that the issue is gone.

--------------------------------------------------------------------------------

On 2018-10-06T04:39:51Z, 9214, commented:
<https://github.com/red/red/issues/3549#issuecomment-427545607>

    @dockimbel 
    
    ```
    >> about
    Red 0.6.3 for Windows built 6-Oct-2018/7:28:28+05:00 commit #dafc828
    
    >> recycle ? recycle ; 3 times
    
    *** Runtime Error 1: access violation
    *** at: 00429DEAh
    ```

--------------------------------------------------------------------------------

On 2018-10-06T05:57:16Z, dander, commented:
<https://github.com/red/red/issues/3549#issuecomment-427549018>

    I can also still reproduce with the latest automated build (same commit hash mentioned by @9214).

--------------------------------------------------------------------------------

On 2018-10-06T14:55:01Z, endo64, commented:
<https://github.com/red/red/issues/3549#issuecomment-427579902>

    Same error with latest build on master.
    
    ```
    --== Red 0.6.3 ==--
    Type HELP for starting information.
    
    >> recycle ? recycle
    
    *** Runtime Error 1: access violation
    *** at: 00429DEAh
    ```
    
    If I type `about` before `recycle ? recycle` then it crashes on fifth try, otherwise crashes on first try.
    
    `Red 0.6.3 for Windows built 3-Oct-2018/23:33:58+03:00 commit #f4d090b`

--------------------------------------------------------------------------------

On 2018-10-06T17:25:27Z, qtxie, commented:
<https://github.com/red/red/issues/3549#issuecomment-427591739>

    @dockimbel When compiled the console with release mode, I got the same error.

--------------------------------------------------------------------------------

On 2018-10-07T01:54:41Z, qtxie, commented:
<https://github.com/red/red/issues/3549#issuecomment-427619244>

    @dander I pushed a fix. Please check if the issue is gone.

--------------------------------------------------------------------------------

On 2018-10-07T03:04:10Z, dander, commented:
<https://github.com/red/red/issues/3549#issuecomment-427621911>

    I can no longer reproduce with the latest build 👍

