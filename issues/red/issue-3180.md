
#3180: Background interferes with `text` in `view`
================================================================================
Issue is closed, was reported by toomasv and has 2 comment(s).
[type.bug] [status.reviewed] [GUI]
<https://github.com/red/red/issues/3180>

### Expected behavior
```
view [box white "split-^/text"]
```
would show multi-line text exactly as 
```
view [box "split-^/text"]
```
### Actual behavior
Line-break is ignored with background color
### Steps to reproduce the problem
^
### Red version and build date, operating system with version.
W10 Pro
```
system/build
== make object! [
    date: 29-Dec-2017/16:33:38+02:00
    config: make object! [
        config-name: 'Windows
```
### Additional notes
It will wrap with `wrap`, but then it will be vertically aligned to top:
```
view [box white wrap "split-^/text"]
```
It will also wrap when alpha channel of any value is included:
```
view [box 255.255.255.0 "split-^/text"]
view [box 255.255.255.255 "split-^/text"]
```


Comments:
--------------------------------------------------------------------------------

On 2018-12-30T16:08:15Z, hiiamboris, commented:
<https://github.com/red/red/issues/3180#issuecomment-450570320>

    I fixed this in https://github.com/red/red/pull/3683 and it's okay to close this one.

