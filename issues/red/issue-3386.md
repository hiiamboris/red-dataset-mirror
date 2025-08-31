
#3386: How to hide the console for a GUI program in Red Language on Windows?
================================================================================
Issue is closed, was reported by ZJUGuoShuai and has 6 comment(s).
<https://github.com/red/red/issues/3386>

I wrote a simple "hello world" GUI program on Windows. And compiled it. When I double-clicked the `hello.exe`, it displayed a black console window behind my GUI program like this:
![img](https://wx2.sinaimg.cn/mw1024/8163951egy1fr7hnr2xljj20o90efjrr.jpg)
### Expected behavior
There is only my GUI program displayed.
### Actual behavior
An additional console window displayed behind.
### Steps to reproduce the problem
Double-click the `hello.exe` program.
### Red and platform version
Windows 10 / Red 0.6.3
```
Red [Needs: 'View]

view [text "Hello World!"]
```


Comments:
--------------------------------------------------------------------------------

On 2018-05-11T08:55:17Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3386#issuecomment-388304340>

    You need to supply the `-t Windows` compiler option to exclude the console.

--------------------------------------------------------------------------------

On 2018-05-11T09:00:14Z, ZJUGuoShuai, commented:
<https://github.com/red/red/issues/3386#issuecomment-388305546>

    @PeterWAWood Thanks. I'm a new hand on Red ;-)

--------------------------------------------------------------------------------

On 2018-05-12T19:05:21Z, 9214, commented:
<https://github.com/red/red/issues/3386#issuecomment-388576188>

    @ZJUGuoShuai use [community chat](https://gitter.im/red/help) instead of issue tracker to ask your questions.

