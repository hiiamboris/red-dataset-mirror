
#2479: Red stopped running on Windows XP
================================================================================
Issue is closed, was reported by WiseGenius and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2479>

Although not an issue on Windows 7, the latest Red executables don't run on any of my Windows XP computers anymore:

`red-04mar17-b42db0b.exe` was working. Then I switched to `red-12mar17-f72fd48.exe` and although it precompiles, it crashes upon opening. For example nothing happens when I run the latest precompiled automated build:

```
H:\Applications\Red>red-14mar17-1b38042.exe

H:\Applications\Red>
```
Nothing happened.

Trying CLI for the first time:
```
H:\Applications\Red>red-14mar17-1b38042.exe --cli
Compiling Red console...

*** Runtime Error
H:\Applications\Red>
```

Try again:
```
H:\Applications\Red>red-14mar17-1b38042.exe --cli

*** Runtime Error
H:\Applications\Red>
```

I get the same result when compiling from sources.


