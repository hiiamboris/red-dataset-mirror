
#3141: Access violation when trying to bind `print:`
================================================================================
Issue is closed, was reported by roobie and has 2 comment(s).
<https://github.com/red/red/issues/3141>

Please forgive me if this issue already is reported. I did do a search of existing issues.

### Expected behavior
No access violation, but perhaps a better error message

### Actual behavior

```
PS D:\devel> c:\apps\red-063.exe --cli d:\devel\scratch.red

*** Runtime Error 1: access violation
*** at: 00000000h
```

### Steps to reproduce the problem

Evaluate this code:

```
Red [
    Title: "fault"
]

f: func [a [series!]][
    print: length? a
]

print f "a"
```

### Red version and build date, operating system with version.

Red 0.6.3
Windows 10 64b 1511

Edit - corrected example code


Comments:
--------------------------------------------------------------------------------

On 2017-12-10T17:48:17Z, greggirwin, commented:
<https://github.com/red/red/issues/3141#issuecomment-350565378>

    Closing as duplicate of #3140 

