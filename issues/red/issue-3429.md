
#3429: GUI console scrolling is bugged by ^L
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/3429>

### Steps to reproduce the problem
- open gui console, write `loop 300 [print "^/"]`, watch it scroll down
- press Ctrl-L to clear the buffer
- write `loop 300 [print "^/"]` again and watch it NOT scrolling down anymore
- type `1` then `enter` a few times and it scrolls down at some point
Apparently Ctrl-L does not reset some variable holding the buffer length or something.

### Expected behavior
Should scroll down and keep the input line visible.
### Actual behavior
Doesn't.

### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 750 date: 12-Jun-2018/15:07:14 commit: #e62b63d51cdc5d5f6033eb3fa366fd94be0b2deb ]
PLATFORM: [ name: "Windows 7 Service Pack 1" OS: 'Windows arch: 'x86-64 version: 6.1.1 build: 7601 ]
--------------------------------------------
```


