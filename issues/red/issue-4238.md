
#4238: GTK: draw's box and field background rendering differences between Windows and Linux
================================================================================
Issue is closed, was reported by loziniak and has 2 comment(s).
[status.resolved] [GUI.GTK]
<https://github.com/red/red/issues/4238>

Given the code:
```
view [
	panel 100x100 red draw [box 0x0 100x100 10] [
		field "abc" blue no-border
	]
]
```
There is difference in rendering in Windows (Wine) and Linux GTK:
![obraz](https://user-images.githubusercontent.com/5331492/72355788-5edbd800-36e8-11ea-8ee7-3e4b8b773995.png)

Please note:
1. Blue background is only on text, not entire `field`.
2. Black frame on red `panel` is 1px smaller.


Comments:
--------------------------------------------------------------------------------

On 2020-03-10T12:44:47Z, hiiamboris, commented:
<https://github.com/red/red/issues/4238#issuecomment-597065981>

    Related bug occurred on W8+ backend as well: https://github.com/red/red/issues/3473

