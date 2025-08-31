
#1234: Can't open Windows paths with spaces
================================================================================
Issue is closed, was reported by WiseGenius and has 8 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1234>

In Windows XP:

```
H:\>red-10jun15-a048359.exe some-useful-folder/test.red
This is the test output.

H:\>red-10jun15-a048359.exe some folder with an unfortunate name/test.red
*** Error: File not found

H:\>red-10jun15-a048359.exe "some folder with an unfortunate name/test.red"
--== Red 0.5.3 ==--
Type HELP for starting information.

red>> q

H:\>
```

For some reason, it just launches the console instead.



Comments:
--------------------------------------------------------------------------------

On 2015-06-12T23:18:05Z, endo64, commented:
<https://github.com/red/red/issues/1234#issuecomment-111639904>

    Same for file names (on Win8)
    
    ```
    red>red "te st.red"
    --== Red 0.5.4 ==--
    Type HELP for starting information.
    ```

--------------------------------------------------------------------------------

On 2016-02-02T15:52:50Z, WiseGenius, commented:
<https://github.com/red/red/issues/1234#issuecomment-178650746>

    Regression back to this issue:
    
    ```
    H:\>console "folder with spaces\test.red"
    *** Error: cannot access argument file
    --== Red 0.5.4 ==--
    Type HELP for starting information.
    
    red>>
    ```
    
    Same error for both console and gui-console in both Windows XP and Windows 7.

--------------------------------------------------------------------------------

On 2016-02-03T02:02:22Z, qtxie, commented:
<https://github.com/red/red/issues/1234#issuecomment-178956406>

    Should be fixed with this commit 7e38407

--------------------------------------------------------------------------------

On 2016-02-03T03:39:23Z, WiseGenius, commented:
<https://github.com/red/red/issues/1234#issuecomment-178983791>

    Working again for both consoles on both OSes.

