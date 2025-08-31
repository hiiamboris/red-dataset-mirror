
#3101: [windows-10][view] face/text don't seem to update with react
================================================================================
Issue is closed, was reported by akavel and has 2 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/3101>

### Expected behavior
When clicking the `>` button, all numbers in the panel change.
### Actual behavior
When clicking the `>` button, all `react` blocks seem to correctly recalculate (`probe`s get printed), but **only one number in the panel changes (the last one, in the bottom-right corner)** &mdash; see the gif screencast below:

![issue-view-react](https://user-images.githubusercontent.com/273837/32523833-5c717538-c41d-11e7-830e-1351dd258f55.gif)




### Steps to reproduce the problem

Run the following code using `red-063.exe` or `red-06nov17-bca8678.exe`:

```
state: make reactor! [
	month-start: do [d: now/date  d/day: 1  d]
]

month-pane: probe collect [repeat offset (7 * 6) [
	keep compose/deep [
		button react [
			d: state/month-start
			d/weekday: 1
			d: d + (offset - 1)
			face/data: d
			face/text: probe to-string d/day
		]
	]
]]

view [
	button ">" [ d: state/month-start  d/month: d/month + 1  state/month-start: probe d ] return
	group-box 7 month-pane
]
```

### Red version and build date, operating system with version.
- red-063.exe, red-06nov17-bca8678.exe
- Windows 10





Comments:
--------------------------------------------------------------------------------

On 2017-11-08T00:33:28Z, greggirwin, commented:
<https://github.com/red/red/issues/3101#issuecomment-342670503>

    Use `keep copy/deep compose/deep [` in your `repeat` block and it will work. More detailed comment in gitter chat.

