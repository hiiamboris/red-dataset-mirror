
#2824: [macOS View] Changing the size or the font-size of a 'Button will make its clicking effect changed
================================================================================
Issue is closed, was reported by JenniferLee520 and has 2 comment(s).
[status.resolved] [type.review] [GUI]
<https://github.com/red/red/issues/2824>

In the following code, click the two buttons respectively, you will see the difference.
```Red
view [ button "OK-1" button 50x50 "OK-2" ]
```
This bug is only on macOS.


Comments:
--------------------------------------------------------------------------------

On 2017-06-28T11:44:55Z, dockimbel, commented:
<https://github.com/red/red/issues/2824#issuecomment-311636032>

    VID will select the right class (according to [Apple Guidelines](https://developer.apple.com/macos/human-interface-guidelines/buttons/checkboxes/)) for buttons on macOS, depending on their height. Different classes can differ a bit in looks. Currently 4 buttons classes are supported: bevel (default), push/regular, push/small, push/mini.

