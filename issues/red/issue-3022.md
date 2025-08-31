
#3022: Backdrop of Container is not properly filled under macOS
================================================================================
Issue is closed, was reported by PeterWAWood and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/3022>

When setting the backdrop of a container in macOS, the bottom two corners are not filled with the backdrop colour.

It can be seen by running this script:

```text
Red[
	needs: View
]
view [
	title ""
	size 232x300
	backdrop 230.230.230.192
	across
	text "0" right 230 font-size 24
	return
]
```
macOS and Windows screenshots of the output are attached.
<img width="316" alt="macos backdrop" src="https://user-images.githubusercontent.com/697434/30237168-eb5a25bc-955e-11e7-9c99-f7f44324aeaf.png">

<img width="264" alt="windows backdrop" src="https://user-images.githubusercontent.com/697434/30237169-f694c9a0-955e-11e7-9751-fa13b563bf54.png">

 


Comments:
--------------------------------------------------------------------------------

On 2018-03-22T08:40:06Z, qtxie, commented:
<https://github.com/red/red/issues/3022#issuecomment-375219106>

    Fixed in commit 73d8342fc71bc0c115cc693020e00a66ce743d3d .

