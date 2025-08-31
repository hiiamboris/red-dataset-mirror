
#2682: Request-font crashes REPL and child windows when text is already present
================================================================================
Issue is closed, was reported by AlexanderBaggett and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2682>


On windows 7 and 10, if you change the font after typing text into the area, it crashes the window and the red REPL.

If you request the font first ***before*** you type any text or put the cursor in the area. It works fine.

It is only if changing the font requires there to be an update to the text, does the issue occur. 

[MVCE](https://stackoverflow.com/help/mcve):

```
view [area 200x200 button "change font" [face/parent/pane/1/font: request-font]]
```



Comments:
--------------------------------------------------------------------------------

On 2017-05-12T21:29:33Z, geekyi, commented:
<https://github.com/red/red/issues/2682#issuecomment-301190506>

    You don't have to type text into area, it simply has to be focused for the bug to happen

