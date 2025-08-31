
#1941: Copy text from GUI-console not complete
================================================================================
Issue is closed, was reported by iArnold and has 4 comment(s).
[status.reviewed] [type.review]
<https://github.com/red/red/issues/1941>

Copy from the GUI-console misses characters at the end
![2016-05-27_130532](https://cloud.githubusercontent.com/assets/1219809/15606322/caae0f38-240b-11e6-9033-f8b7397a87c3.png)
Select to the end of the line results in

```
ABC
DEF
G
```

![2016-05-27_130736](https://cloud.githubusercontent.com/assets/1219809/15606361/0498cf3a-240c-11e6-863f-d65ac24b19b3.png)
Selecting to start on next line results in 

```
ABC
DEF
GH
```



Comments:
--------------------------------------------------------------------------------

On 2016-05-27T11:12:10Z, qtxie, commented:
<https://github.com/red/red/issues/1941#issuecomment-222121258>

    Should be fixed since yesterday. Please try the latest version.

--------------------------------------------------------------------------------

On 2016-05-27T11:21:36Z, iArnold, commented:
<https://github.com/red/red/issues/1941#issuecomment-222122716>

    Confirmed to be fixed, I'll close this issue now.

