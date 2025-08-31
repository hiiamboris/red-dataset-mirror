
#4384: [View] `on-up` event locking on clicks
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/4384>

**Describe the bug**
![](https://i.gyazo.com/f51b310dc42731009e3ab4db243ca362.gif)

**To reproduce**

`view [base on-up [print "UP" view [base green]]]`
1. Click the gray base - it displays green base window
2. Click anywhere you want - on the green window, outside it, on taskbar - `on-up` will be registered by the gray base, which is long hidden by now (which is clear from both the console output and the number of windows spawned)

**Expected behavior**

1. Clicks on green window should go to green window
2. Clicks outside of Red windows should not be caught

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 30-Mar-2020/20:20:44+03:00
```



