
#4266: [GTK] crash on creating FIELD with font of zero size
================================================================================
Issue is closed, was reported by 9214 and has 2 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/4266>

**Describe the bug**

Creation of `field` face with a font whose `size` equals `0` leads to a "divide by zero" runtime error.

**To reproduce**

```red
view [field font-size 0]
```
```
*** Runtime Error 13: integer divide by zero
*** in file: .../red/modules/view/backends/gtk3/gui.reds
*** at line: 1746
***
***   stack: gui/OS-make-view 08943F04h 145127976
***   stack: ctx||411~make-view 08943F04h 08943F14h
***   stack: show
***   stack: show
***   stack: view
***   stack: red/_function/call 08943BD4h F7F19884h
***   stack: red/interpreter/eval-code 08943BD4h F4E67CF8h F4E67CF8h false 00000000h 00000000h F5010080h
***   stack: red/interpreter/eval-expression F4E67CE8h F4E67CF8h false false false
***   stack: red/interpreter/eval 08943BB4h true
***   stack: red/natives/catch* true 1
***   stack: ctx||502~try-do F4E945F0h
***   stack: ctx||502~do-command F4E945F0h
***   stack: ctx||502~eval-command F4E945F0h
***   stack: ctx||502~run F4E945F0h
***   stack: ctx||502~launch F4E945F0h
***   stack: ctx||534~launch F4E938A8h
***   stack: ***_start
```

Creating font with negative size does not lead to a crash, but results in failed assertion inside Pango:

```
(debug:28283): Pango-CRITICAL **: 13:28:56.997: pango_font_description_set_size: assertion 'size >= 0' failed
```

**Expected behavior**

Currently, the behavior varies across 3 major platforms:

* macOS and Windows ignore zero values and reset it to default;
* macOS ignores the negative size, Windows renders tiny fonts;
* GTK crashes on zero but resets on negative values (+ prints debug info in the console).

I think macOS backend is the most sensible in this regard.

**Platform version**

```
Red 0.6.4 for Linux built 30-Jan-2020/13:22:38+01:00
```



Comments:
--------------------------------------------------------------------------------

On 2020-01-30T12:54:59Z, hiiamboris, commented:
<https://github.com/red/red/issues/4266#issuecomment-580239351>

    Just FYI, this is how it works on Windows on the OS level:
    ![](https://i.gyazo.com/38a9eb2335618663bf853bea126572c3.png)
    https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-logfonta

