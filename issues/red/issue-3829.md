
#3829: Text in text inputs can't be selected on start
================================================================================
Issue is closed, was reported by DVL333 and has 2 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/3829>

**Describe the bug**
If set `selected` attribute for the text input an appropriate part of its text won't be selected after creation 

**To reproduce**
```
fld1: make face! [type: 'field size: 150x20 offset: 10x10 text: "Hello world!" selected: 2x5]
repend p: [] fld1
view make face! [type: 'window size: 170x90 pane: p]
```

**Expected behavior**
Part of text must be selected  on start ("ello" from the example)

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 25-Mar-2019/13:11:08+03:00 commit #e6c96aa
```



Comments:
--------------------------------------------------------------------------------

On 2019-03-30T23:23:23Z, endo64, commented:
<https://github.com/red/red/issues/3829#issuecomment-478298000>

    Confirmed (On Win10)
    
    Simpler example:
    ```
    Red [Needs: View]
    view [
      fld: field "Hello world" with [selected: 2x5]
      button "Select" [fld/selected: 3x6]
    ]
    ? fld/selected
    ```

