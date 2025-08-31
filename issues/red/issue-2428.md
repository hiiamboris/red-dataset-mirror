
#2428: no-wrap generates a script error
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/2428>

Issue #2355 shows `wrap` does not work. So I tried `no-wrap` to see what that does. Well, it is not recognized.
```
red>> view [area 100x100 no-wrap]
*** Script Error: VID - invalid syntax at: [no-wrap]
*** Where: do
```



