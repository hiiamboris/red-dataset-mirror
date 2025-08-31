
#2582: [draw][text] Text command doesn't work with draw function
================================================================================
Issue is closed, was reported by maximvl and has 4 comment(s).
<https://github.com/red/red/issues/2582>

This code creates window with "hello" string in it:
```
red>> view [ base 50x50 draw [text 0x0 "hello"]]
```
However the `draw` doesn't do anything with `image!`:
```
red>> i: make image! 50x50
red>> draw i [text 0x0 "hello"]
== make image! [50x50 #{
FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
FFFFFFFFFFFFFF
red>> view [image i]
```


Comments:
--------------------------------------------------------------------------------

On 2017-04-16T08:35:10Z, qtxie, commented:
<https://github.com/red/red/issues/2582#issuecomment-294340451>

    It works on my Win7 64bit box. @maximvl Which OS are you using?

--------------------------------------------------------------------------------

On 2017-07-28T16:10:43Z, dockimbel, commented:
<https://github.com/red/red/issues/2582#issuecomment-318695874>

    Works fine on Win7 and Win10.

