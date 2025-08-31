
#2962: GUI console text area is sometimes resized by the view function
================================================================================
Issue is closed, was reported by dander and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/2962>

The only steps needed are: launch red.exe, run `view []`. It seems to be reproducible with no view content. The size of the text area appears to be the same as the size of the new window.

![red-gui-display-resize-issue](https://user-images.githubusercontent.com/1302979/28993384-da16d586-7969-11e7-83e2-23f7f14c19b9.PNG)

```
>> about
Red for Windows version 0.6.3 built 4-Aug-2017/22:02:43-07:00
```

OS: Windows 10 build 15063


