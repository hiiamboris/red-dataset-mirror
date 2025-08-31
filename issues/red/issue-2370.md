
#2370: simple-clock.red drawing needles off center
================================================================================
Issue is closed, was reported by OneArb and has 10 comment(s).
[status.built] [status.tested] [type.bug] [status.contribution]
<https://github.com/red/red/issues/2370>

red-latest.exe

needles off center
   second makes a circle

![Uploading simple-clock.png…]()

XP machine

Thanks


Comments:
--------------------------------------------------------------------------------

On 2016-12-19T23:40:53Z, geekyi, commented:
<https://github.com/red/red/issues/2370#issuecomment-268111278>

    @OneArb I can't see your image. Also, can you give a link to the demo you are referring to?
    
    Edit: probably https://github.com/red/code/blob/0.6.2/Showcase/simple-clock.red

--------------------------------------------------------------------------------

On 2016-12-20T02:57:01Z, geekyi, commented:
<https://github.com/red/red/issues/2370#issuecomment-268141058>

    Looks like the cause of this is 
    18ed2b2e006ee021f40b6bdee051567aa6070d1b
    @Zamlox ?

--------------------------------------------------------------------------------

On 2016-12-20T04:07:18Z, Zamlox, commented:
<https://github.com/red/red/issues/2370#issuecomment-268149508>

    I'll check it out

--------------------------------------------------------------------------------

On 2016-12-20T05:38:30Z, Zamlox, commented:
<https://github.com/red/red/issues/2370#issuecomment-268159941>

    Forgot to apply existing world transformation matrix on center point when rotation operation is used.  I will push a fix for it.

--------------------------------------------------------------------------------

On 2016-12-20T10:29:00Z, OneArb, commented:
<https://github.com/red/red/issues/2370#issuecomment-268208815>

    The image just in case:
    
    ![simple-clock](https://cloud.githubusercontent.com/assets/9049878/21347082/6a51ce88-c6a7-11e6-82c1-3fc436aeaf6b.jpg)
    
    Thanks

