
#3432: regression: default `draw` matrix is not an identity matrix
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/3432>

@qtxie I believe this is related to https://github.com/red/red/issues/3336

### Expected behavior
rectangles should align (as they do in the stable rel)
![](https://i.gyazo.com/733cc5dcaec58cd896bb81adc51ff22b.png)
### Actual behavior
![](https://i.gyazo.com/b42edfa8a2d7847e04a153a1011effd3.png)
they don't
### Steps to reproduce the problem
```
view [base 300x300 coal draw [line-width 5 pen blue box 0x0 200x200 reset-matrix pen red box 0x0 200x200]]
```
### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 750 date: 12-Jun-2018/15:07:14 commit: #e62b63d51cdc5d5f6033eb3fa366fd94be0b2deb ]
PLATFORM: [ name: "Windows 7 Service Pack 1" OS: 'Windows arch: 'x86-64 version: 6.1.1 build: 7601 ]
--------------------------------------------
```




