
#3538: New GUI Console not redrawing/scrolling properly
================================================================================
Issue is closed, was reported by gltewalt and has 8 comment(s).
[type.bug] [status.resolved] [GUI]
<https://github.com/red/red/issues/3538>

### Expected behavior
To scroll properly so that the next input line is visible and available.
### Actual behavior
https://imgur.com/a/6UGEbhz
### Steps to reproduce the problem
Type `help datatype!` in GUI Console.
### Red and platform version
```
RED: [ branch: "master" tag: #v0.6.3 ahead: 857 date: 16-Sep-2018/5:12:03 commit: #09de884db66698de77464e42ffdb91445991fe2d ]
PLATFORM: [ name: "Windows 7 Service Pack 1" OS: 'Windows arch: 'x86-64 version: 6.1.1 build: 7601 ]
```


Comments:
--------------------------------------------------------------------------------

On 2018-09-21T17:14:59Z, 9214, commented:
<https://github.com/red/red/issues/3538#issuecomment-423609640>

    W10, output expressions get doubled and partially malformed if I directly copy-paste from GUI console session:
    ```red
    >> [
    [    a
    [    b
    [    c
    [    ]
    == [
        a 
        b 
        c ; <-- WTF? Note the missing closing bracket.
    == [
        a 
        b 
        c
    ]
    >> object []
    == make object! []
    >> object [x: 1 y: 2]
    == make object! [
        x: 1
        y: 2
    == m ;<-- WTF? Note the missing closing bracket above.
    ```

--------------------------------------------------------------------------------

On 2018-09-26T20:13:23Z, qtxie, commented:
<https://github.com/red/red/issues/3538#issuecomment-424853946>

    @gltewalt @9214 Does the issue still exist in the latest red version?

--------------------------------------------------------------------------------

On 2018-09-26T20:21:37Z, 9214, commented:
<https://github.com/red/red/issues/3538#issuecomment-424856390>

    @qtxie can't reproduce with latest automated build, I guess it's fixed. 👍 

--------------------------------------------------------------------------------

On 2018-09-26T23:11:53Z, gltewalt, commented:
<https://github.com/red/red/issues/3538#issuecomment-424900119>

    Issue is resolved in the latest automated build.

