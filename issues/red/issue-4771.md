
#4771: [Regression, GTK] CRASH in requester dialogs
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI.GTK]
<https://github.com/red/red/issues/4771>

**Describe the bug**

Type `request-file` or `request-dir`, result:
```
*** Runtime Error 101: no value matched in SWITCH
*** in file: /home/test/unicode.reds
*** at line: 225
***
***   stack: red/unicode/str-to-utf8 00000065h 08076BF8h true
***   stack: red/unicode/str-to-utf8 0A29B744h FFE1CE3Ch false
***   stack: red/unicode/to-utf8 0A29B744h FFE1CE3Ch
***   stack: gui/_request-file 0A29B744h 0A29B754h 0A29B764h false false false
***   stack: gui/OS-request-file 0A29B744h 0A29B754h 0A29B764h false false
***   stack: ctx||470~request-file 0A29B744h 0A29B754h 0A29B764h false false
***   stack: request-file
***   stack: ***_start
```

**Platform version**
```
Red 0.6.4 for Linux built 19-Dec-2020/15:56:50+03:00 commit #d082313
```



