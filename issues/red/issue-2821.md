
#2821: [macOS View] Changing font color will also change the font size.
================================================================================
Issue is closed, was reported by JenniferLee520 and has 4 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/2821>

In the following 2 pieces of code, only font-color is changed, but, after running the code, you will see that the font size is changed too.
```Red
view [ text "This is fun" ]
```
and
```Red
view [ text "This is fun" font-color red]
```
This bug is only on macOS.


Comments:
--------------------------------------------------------------------------------

On 2017-06-20T11:42:05Z, qtxie, commented:
<https://github.com/red/red/issues/2821#issuecomment-309727717>

    The default font size is 13 which cause the issue. I don't know why it sets to 13.
    ```
    layout [ t: text "This is fun" font-color red]
    t/font/size
    == 13
    ```

--------------------------------------------------------------------------------

On 2017-07-22T03:30:45Z, qtxie, commented:
<https://github.com/red/red/issues/2821#issuecomment-317150939>

    Should be fixed now.

