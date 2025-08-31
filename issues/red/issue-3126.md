
#3126: VID: camera - selecting any index other than 1 crashes GUI Console
================================================================================
Issue is closed, was reported by gltewalt and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3126>

### Expected behavior
```
view [camera 300x300 select 2]
```
Expected an error as the index of the only camera on my laptop is 1.

### Actual behavior
Crashes the GUI Console. Window disappears.

### Steps to reproduce the problem
Changing 1 in `view [camera 300x300 select 1]` with any other integer, ie, `view [camera 300x300 select 2]`
### Red version and build date, operating system with version.
Red for Windows version 0.6.3 built 21-Nov-2017/23:45:27-07:00



