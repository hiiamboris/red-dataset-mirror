
#5573: [View] Still cuts the label text
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5573>

**Describe the bug**
```
view [text "Measuring... Turn off battery saving and close your browsers for best results"]
```
Eats for me the last word:
![](https://link.storjshare.io/raw/jxfnjjold7d4xtoupll4mp7ychkq/img/3cW2ddW.png)

For reference:
```
>> ? system/view/fonts
SYSTEM/VIEW/FONTS is an object! with the following words and values:
     system      string!       "Segoe UI"
     fixed       string!       "Consolas"
     sans-serif  string!       "Segoe UI"
     serif       string!       "Times New Roman"
     size        integer!      9

>> ? system/view/metrics/dpi
SYSTEM/VIEW/METRICS/DPI is an integer! value: 144
```


**Expected behavior**

Full text shown

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.5 ahead: 217 date: 28-Nov-2024/20:56:25 commit: #a69159226c6885ef7e67c7c9bc50514fd49f03b2 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19045 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2024-12-11T20:34:05Z, greggirwin, commented:
<https://github.com/red/red/issues/5573#issuecomment-2537079946>

    Looks OK here with these metrics:
    ```
    >> ? system/view/fonts
    SYSTEM/VIEW/FONTS is an object! with the following words and values:
         system      string!       "Segoe UI"
         fixed       string!       "Consolas"
         sans-serif  string!       "Segoe UI"
         serif       string!       "Times New Roman"
         size        integer!      9
    
    >> ? system/view/metrics/dpi
    SYSTEM/VIEW/METRICS/DPI is an integer! value: 96
    ```
    So, likely DPI related.

--------------------------------------------------------------------------------

On 2025-05-30T03:58:37Z, qtxie, commented:
<https://github.com/red/red/issues/5573#issuecomment-2921159382>

    It looks OK if removes all the space characters.

