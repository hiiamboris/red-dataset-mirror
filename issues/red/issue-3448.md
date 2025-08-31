
#3448: VID: system colors override in a panel
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/3448>

An issue very similar to https://github.com/red/red/issues/3247

### Expected behavior

It **almost** works (except for some miscalculation of the width)

![](https://i.gyazo.com/48aa29446f51a333fa0b58247ec614ee.png)
`view [text font-size 20 "now u see me now u dont"]`

### Actual behavior

now - in a panel!

![](https://i.gyazo.com/f6162add8b530e293a3ba91fd03e4042.png)
`view [panel [text font-size 20 "now u see me now u dont"]]`

let's override the background:

![](https://i.gyazo.com/263c4fc4398f4305859f343572fd2adb.png)
`view [panel [text blue font-size 20 "now u see me now u dont"]]`

### Red and platform version
stable & nightly both
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 750 date: 12-Jun-2018/15:07:14 commit: #e62b63d51cdc5d5f6033eb3fa366fd94be0b2deb ]
PLATFORM: [ name: "Windows 7 Service Pack 1" OS: 'Windows arch: 'x86-64 version: 6.1.1 build: 7601 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2018-07-08T16:09:48Z, hiiamboris, commented:
<https://github.com/red/red/issues/3448#issuecomment-403298089>

    @qtxie it looks like the background color doesn't work anymore:
    `view [panel [text blue font-size 20 "now u see me now u dont"]]` this line is no longer on blue

--------------------------------------------------------------------------------

On 2018-07-08T17:20:12Z, greggirwin, commented:
<https://github.com/red/red/issues/3448#issuecomment-403302472>

    @hiiamboris, confirmed here.

--------------------------------------------------------------------------------

On 2018-07-12T09:12:18Z, qtxie, commented:
<https://github.com/red/red/issues/3448#issuecomment-404445803>

    @hiiamboris Thanks. Pushed a new fix.

