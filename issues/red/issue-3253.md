
#3253: CRASH when binding `self` during a reactor object creation
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3253>

### ANY of the following lines
```
make face! [bad: self]
make reactor! [bad: self]
make font! [bad: self]
make para! [bad: self]
make scroller! [bad: self]
```
(and maybe more?)
### produce the output:
```
*** Runtime Error 19: stack error or overflow
*** at: 00422AE8h
```
note 1: actual address varies
note 2: gui-* consoles are just closing
### Red version and build date, operating system with version.
Red 0.6.3 system/build/config/build-basename = **%console-2017-8-3-49893** (stable) and **%console-2018-3-11-43723** (nightly)
OS: win7 x64 v6.1.7601



