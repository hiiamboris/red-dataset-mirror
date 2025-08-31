
#1607: Random Crash when interpreting a script file in Gui-Console
================================================================================
Issue is closed, was reported by ghost and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1607>

For Gui-Console in debug mode --
`a.red`

```
Red []

print 1.0
```

In CMD - `gui-console a.red`

```
(Some Output Removed)

*** Runtime Error 1: access violation
*** in file: /C/Users/ABC/Desktop/red-master/environment/console/datatypes/string.reds
*** at line: 339
***
***   stack: red/string/get-char 02731000h 1
***   stack: terminal/string-width? 02633FE8h 0 196511 77
***   stack: terminal/string-lines? 02633FE8h 0 3960792 77
***   stack: terminal/select 025850F8h 286 5 true
***   stack: terminal/ConsoleWndProc 00090318h 513 1 5767454
```



