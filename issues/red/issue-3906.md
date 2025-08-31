
#3906: Crash scrolling while keeping mouse wheel clicked.
================================================================================
Issue is closed, was reported by GiuseppeChillemi and has 14 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/3906>

Compile this code:

```
Red [
	needs: view
]

recycle/off
txt: "" loop 1000 [insert txt rejoin ["Scroll me with mouse wheel up and down continuously" lf]]
view [area txt 600x300]
```

run it and scroll the text with mouse wheel clicked up and down continuosly.
After a couple of seconds the application exits with the followind error trace:

```
*** Runtime Error 13: integer divide by zero
*** in file: /C/Users/*****************/Desktop/bug/modules/view/backends/windows/events.reds
*** at line: 1499
***
***   stack: gui/process 0000000Dh
***   stack: win32-startup-ctx/exception-filter 0017FA24h
```

It happens more often on slow GUIS.

**Platforms:**

Tested on
Windows 10
Windows 2008R2 Terminal Server
Windows 2012 on Terminal Server


```
Red 0.6.4 for Windows built 29-May-2019/10:19:53+02:00 commit #073d191
```



Comments:
--------------------------------------------------------------------------------

On 2019-05-29T17:17:03Z, hiiamboris, commented:
<https://github.com/red/red/issues/3906#issuecomment-497029011>

    :point_up: [May 29, 2019 3:51 PM](https://gitter.im/red/bugs?at=5cee8038481ef4167b97526b)

--------------------------------------------------------------------------------

On 2019-05-29T17:24:31Z, 9214, commented:
<https://github.com/red/red/issues/3906#issuecomment-497031758>

    When you file bug reports:
    1. Use the standard issue template which was suggested to you on ticket creation;
    1. Format code snippets using backticks.
    
    I cannot reproduce this on W10. Perhaps View testing backend should be used instead of manual scrolling?

--------------------------------------------------------------------------------

On 2019-05-29T18:38:29Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/3906#issuecomment-497059544>

    I don't know what is the View testing backend. Could you please give me a link ?

--------------------------------------------------------------------------------

On 2019-05-29T18:42:38Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/3906#issuecomment-497061067>

    > When you file bug reports:
    > 
    > 1. Use the standard issue template which was suggested to you on ticket creation;
    > 2. Format code snippets using backticks.
    > 
    > I cannot reproduce this on W10. Perhaps View testing backend should be used instead of manual scrolling?
    
    I suggest to try to slow down a lot your GUI, maybe timing of events/answer is important here. I don't konw any software which is able to artificially slow down a windows system (apart windows upgrades :-) )... Just open a lot of applications !
    

--------------------------------------------------------------------------------

On 2019-05-29T19:55:18Z, 9214, commented:
<https://github.com/red/red/issues/3906#issuecomment-497085870>

    > I suggest to try to slow down a lot your GUI
    
    I suggest to make examples that can be reproduced at once and do not require developers to underclock their machines.

--------------------------------------------------------------------------------

On 2019-05-30T05:44:03Z, rebolek, commented:
<https://github.com/red/red/issues/3906#issuecomment-497210880>

    Some bugs are hard to reproduce and happen only in certain environment. It's hard to make examples that can be reproduced everywhere for such bugs.

--------------------------------------------------------------------------------

On 2019-05-31T20:09:54Z, hiiamboris, commented:
<https://github.com/red/red/issues/3906#issuecomment-497844573>

    So the [problem](https://gitter.im/red/bugs?at=5ceef3cd702b7e5e76f88e81) is [confirmed](https://gitter.im/red/bugs?at=5cf188b5b76eac527a7f8f51)

