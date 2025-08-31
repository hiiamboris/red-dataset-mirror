
#3288: Setting `/selected` facet in camera face crashes.
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/3288>

```
view [
	cam: camera 
	button "on" [list/data: copy/deep cam/data cam/selected: 1]
	list: text-list 150 [cam/selected: event/picked]
]
```

### Expected behavior
Setting the `camera/selected` property to a new value should not crash.
### Actual behavior
Crash.
### Steps to reproduce the problem
Click on "on" button, then after the list is filled, select the first entry in the list, it crashes the app.
### Red version and build date, operating system with version.
Red for Windows version 0.6.3 built 27-Mar-2018/11:52:41+08:00 (latest commit from master)


