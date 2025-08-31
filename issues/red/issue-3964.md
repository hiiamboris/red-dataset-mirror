
#3964: Area wrapping on macOS faulty
================================================================================
Issue is open, was reported by ralfwenske and has 8 comment(s).
[GUI] [GUI.macOS]
<https://github.com/red/red/issues/3964>

**Describe the bug**
Prior issue #https://github.com/red/red/issues/2786 
Solutions on macOS seems to work partly only. As shown here: [area-wrapping-issue](https://github.com/ralfwenske/area-wrapping-issue) wrapping in area face works when area width is expanded (resizing). It does not wrap when width is reduced.

@toomasv confirmed the issue does **not** exist on W10

**To reproduce**
Create a resizable view with area (also resizing per react) in it and put some text into it.
Resizing will show the effect. (Code sample in above  repository).

**Expected behavior**
Text in area should stay visible when resizing into any direction

**Screenshots**
Four screen shots in above repository.

**Platform version (please complete the following information)**
```
Red 0.6.4 for macOS built 31-Jul-2019/18:54:05+10:00 commit #daa6120
```



Comments:
--------------------------------------------------------------------------------

On 2020-01-19T12:34:41Z, hiiamboris, commented:
<https://github.com/red/red/issues/3964#issuecomment-576000229>

    Haven't tested on MacOS but the minimal snippet should be:
    ```
    	txt: "wrap wrap wrap wrap wrap wrap wrap wrap wrap wrap wrap"
    	view [
    		area wrap 100 txt
    		area wrap 200 txt on-created [face/size/x: 100]
    	]
    ```
    And just compare that text in both areas looks the same or not.

--------------------------------------------------------------------------------

On 2020-01-19T19:41:11Z, greggirwin, commented:
<https://github.com/red/red/issues/3964#issuecomment-576039110>

    Good test. Confirmed that they match on Win10.

--------------------------------------------------------------------------------

On 2020-01-20T06:22:38Z, ralfwenske, commented:
<https://github.com/red/red/issues/3964#issuecomment-576124861>

    Is this expected?
    
    ![image](https://user-images.githubusercontent.com/6076206/72703254-d86c3e00-3ba0-11ea-8831-42f63d863b39.png)

--------------------------------------------------------------------------------

On 2020-01-20T06:31:22Z, ralfwenske, commented:
<https://github.com/red/red/issues/3964#issuecomment-576127023>

    Answering my own question :) Of course it's expected as the bug (on Mac) is still there. So, yes, the test shows it clearly...

