
#2375: panel inconsistent refresh
================================================================================
Issue is closed, was reported by OneArb and has 2 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/2375>

- [ ] With the inserted code
  - [ ] when changing the size of the button, panel
    -  [ ] does not refresh using `panel-background:  "#2C3339"`
    -  [ ] does refresh using `panel-background: black`

![panel refresh](https://cloud.githubusercontent.com/assets/9049878/21367341/1842bbd2-c6fe-11e6-876c-318fff2a652d.jpg)

```
Red [
]

field-demo: {

 Button 100x33 "Ok"
}

system/view/silent?: yes

panel-background: "#2C3339" ;black

view [
	title "Text entry"
	backdrop panel-background
	across
	
	source: area #13181E 410x300 no-border field-demo font [
		name: "Consolas"
		size: 9
		color: hex-to-rgb #9EBACB
	]
	
	panel 400x300 panel-background react [
		attempt/safer [face/pane: layout/tight/only load source/text]
	]
]
```


Comments:
--------------------------------------------------------------------------------

On 2016-12-21T01:51:14Z, qtxie, commented:
<https://github.com/red/red/issues/2375#issuecomment-268412153>

    You should use issue! rather than string! to specify the color.
    `panel-background: "#2C3339"` --> `panel-background: #2C3339`

