
#5587: Path starting with `+` 
================================================================================
Issue is closed, was reported by GiuseppeChillemi and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5587>

**Describe the bug**
If you create a map with a path whose first element is `+` it is not correctly lexed and picking the first element you take 2

**To reproduce**
```
m: #["col1" +/1/5]

>> probe first m/"col1"
+/1
```

**Expected behavior**
The correct behaviour should be the following:
```
>> probe first '+/1/5 
+
```


**Platform version**
;-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.5 ahead: 374 date: 10-Jan-2025/11:17:29 commit: ;#68f6dd532a4cd9c53fa68656805bc59390a6ab42 ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 22631 ]
;--------------------------------------------



Comments:
--------------------------------------------------------------------------------

On 2025-02-05T13:49:15Z, hiiamboris, commented:
<https://github.com/red/red/issues/5587#issuecomment-2636905513>

    Unrelated to maps.
    ```
    >> first quote '+/1/5
    == +
    >> first quote +/1/5
    == +/1
    ```

