
#3109: Including text facet in style causes it to be `load`ed
================================================================================
Issue is closed, was reported by greggirwin and has 6 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/3109>

### Expected behavior

@qtxie says this is by design, so it currently is the expected behavior, but it was surprising to me. I expected the text to be used verbatim, which is not the case.

### Actual behavior

Setting a text value in a style, which is loadable, is loaded and formed, rather than being used as the literal string.

### Steps to reproduce the problem
```
view [
    style num: text ".01"
    num  text ".01" return

    style txt: text "2017-12-24"
    txt  text "2017-12-24" return

    style fld: field "2017-12-24"
    fld field "2017-12-24" return

    style blk: text {"a b c"}
    blk  text {"a b c"} return
]
```
### Red version and build date, operating system with version.

0.6.3 (latest source). Windows 7 x64.


Comments:
--------------------------------------------------------------------------------

On 2017-11-16T03:10:07Z, qtxie, commented:
<https://github.com/red/red/issues/3109#issuecomment-344802144>

    Adds a screenshot of the view window:
    ![20171116110546](https://user-images.githubusercontent.com/1673525/32871808-3addf5a2-cabe-11e7-89f2-ccf2995d2e2f.png)

--------------------------------------------------------------------------------

On 2017-11-16T04:15:43Z, dockimbel, commented:
<https://github.com/red/red/issues/3109#issuecomment-344811030>

    It seems unaltered here when using the 0.6.4 branch.

--------------------------------------------------------------------------------

On 2017-11-16T06:52:28Z, greggirwin, commented:
<https://github.com/red/red/issues/3109#issuecomment-344832373>

    ![image](https://user-images.githubusercontent.com/460079/32877686-f75bd5be-ca5f-11e7-8d61-d05bb14d9aa2.png)

