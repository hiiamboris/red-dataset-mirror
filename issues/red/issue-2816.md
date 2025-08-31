
#2816: Wish: red.exe options inside script header
================================================================================
Issue is closed, was reported by luce80 and has 2 comment(s).
[status.resolved]
<https://github.com/red/red/issues/2816>

I wish I could specify red.exe options from within red script header.
Such as:
```
Red [
	options: [--cli -t Windows]
]
; code here
```



Comments:
--------------------------------------------------------------------------------

On 2017-07-28T17:17:50Z, dockimbel, commented:
<https://github.com/red/red/issues/2816#issuecomment-318712105>

    There is already an header for that, it's `config: [...]` and you need to pass options as defined [here](https://github.com/red/red/blob/master/system/config.r). The command-line is transformed into those options internally, so you have even more finer-grained control there than on command-line.

