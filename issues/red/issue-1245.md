
#1245: error about documents when interpreting a file
================================================================================
Issue is closed, was reported by WiseGenius and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1245>

On Windows XP:

```
H:\>red-14jun15-406b783.exe test.red
'H:\Documents' is not recognized as an internal or external command,
operable program or batch file.
```



Comments:
--------------------------------------------------------------------------------

On 2015-06-17T00:14:41Z, qtxie, commented:
<https://github.com/red/red/issues/1245#issuecomment-112608534>

    I can't reproduce it with the latest version (red-16jun15-12a6ff4.exe).
    
    ```
    D:\>red-16jun15-12a6ff4.exe testsr.red
    Pre-compiling compression library...
    Pre-compiling Red console...
    compiled code says: true
    interpreted code says: true
    ```

--------------------------------------------------------------------------------

On 2015-06-17T01:09:08Z, WiseGenius, commented:
<https://github.com/red/red/issues/1245#issuecomment-112617328>

    ```
    H:\>red-16jun15-12a6ff4.exe test.red
    'H:\Documents' is not recognized as an internal or external command,
    operable program or batch file.
    ```
    
    I'll be back with more clues later.

--------------------------------------------------------------------------------

On 2015-06-17T06:30:15Z, WiseGenius, commented:
<https://github.com/red/red/issues/1245#issuecomment-112671444>

    On another computer, also running Windows XP:
    
    ```
    C:\>red-16jun15-12a6ff4.exe test.red
    Pre-compiling compression library...
    Pre-compiling Red console...
    'C:\Documents' is not recognized as an internal or external command,
    operable program or batch file.
    ```
    
    The console is successfully compiled in `C:\Documents and Settings\All Users\Application Data\Red`.
    My guess is that it's trying to run something like this without accounting for the spaces:
    
    ```
    C:\Documents and Settings\All Users\Application Data\Red\console-2015-6-16-70074.exe test.red
    ```
    
    @qtxie I don't have access to a later version of Windows right now, but I suspect the corresponding paths used by the later versions don't contain any spaces? That might explain why you can't reproduce it?
    I haven't had a chance to look at the code yet, but maybe this a regression caused by fixing #1232 or #1234?

