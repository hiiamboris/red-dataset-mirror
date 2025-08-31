
#4806: `toggle` style initial `true` state not honored
================================================================================
Issue is closed, was reported by toomasv and has 0 comment(s).
[status.built] [status.tested] [GUI]
<https://github.com/red/red/issues/4806>

**Describe the bug**
On Windows 10, if `toggle` data is initially set to `true`, it is not recognized in faces state.

**To reproduce**
Try following VID:
```
view [toggle "true" true [face/text: form face/data]]
```

**Expected behavior**
Initial state should reflect `true` state, like in the following case:
```
view [toggle "true" on-created [face/data: true] [face/text: form face/data]]
``` 

**Screenshots**
![image](https://user-images.githubusercontent.com/11960635/105199914-f8359980-5b47-11eb-850b-98a1063a6a17.png)

Expected:
![image](https://user-images.githubusercontent.com/11960635/105200705-cc66e380-5b48-11eb-9c31-c443137a8b33.png)

**Platform version**
```
Red 0.6.4 for Windows built 18-Jan-2021/11:06:33+02:00 commit #de5c05e
```



