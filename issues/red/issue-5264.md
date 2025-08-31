
#5264: Refreshing a generated tab-panel 15-20 times will crash Red
================================================================================
Issue is closed, was reported by mikeyaunish and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5264>

**Describe the bug**
Refreshing a generated tab-panel multiple times crashes Red

**To reproduce**
Steps to reproduce the behavior:
1. Run any version of Red after: red+view-debug-master-2022-09-09-2ba8188.exe
2. Run the following code:
```
view [
    vid-code: area 300x200 {
        tab-panel1: tab-panel 
            "tab-panel1" [
                "Tab-A" [tab-a-btn1: button "tab-A-btn1"] 
                "Tab-B" [tab-b-btn1: button "tab-B-btn1"]
            ]    
    }
    output-panel: panel 200x200 gray
    button "Refresh Panel" [
        output-panel/pane: layout/only load vid-code/text
    ]
]
```
3. Press the "Refresh Panel" button between 15-20 times 
4. Red Crashes

**Expected behavior**
Program should continue to run

**Platform version**

```Red 0.6.4 for Windows built 29-Dec-2022/13:00:14-07:00  commit #6af0b70```

According to hiiamboris:
red+view-debug-master-2022-09-09-2ba8188.exe and before doesn't crash
red+view-debug-master-2022-09-11-85fa7e7.exe and after all crashing



Comments:
--------------------------------------------------------------------------------

On 2023-01-03T16:34:07Z, hiiamboris, commented:
<https://github.com/red/red/issues/5264#issuecomment-1369977903>

    For me it takes just 3-5 clicks to ruin it (using CLI -d console, but same with others).
    
    Newer versions say:
    ```
    >> do read-clipboard
    root: 5767/8457, runs: 0, mem: 3254716 => 2719980, mark: 5.0ms, sweep: 1.3ms
    
    *** Runtime Error 1: access violation
    *** in file: /d/devel/red/red-src/master/modules/view/backends/windows/gui.reds
    *** at line: 146
    ***
    ***   stack: gui/get-face-values 00701AECh
    ***   stack: gui/paint-background 00701AECh 7D013081h
    ***   stack: gui/render-base 00701AECh 7D013081h
    ***   stack: gui/WndProc 00701AECh 20 2097229953 0
    ```
    Old 9/11 says:
    ```
    >> do read-clipboard
    root: 5117/7807, runs: 0, mem: 3252860 => 2695188, mark: 3.0ms, sweep: 0.0ms
    
    *** Runtime Error 1: access violation
    *** in file: /d/devel/red/red-src/master/modules/view/backends/windows/gui.reds
    *** at line: 144
    ***
    ***   stack: gui/get-face-values 00650E22h
    ***   stack: gui/WndProc 00650E22h 15 0 0
    ```
    Clearly a GC-related corruption here.

