# Keyboard events won't work on GTK #2

**State:** closed | **Created:** 2021-06-24T11:30:52+02:00 | **Updated:** 2022-03-11T21:28:22+01:00
**URL:** <https://codeberg.org/hiiamboris/red-spaces/issues/2>
---

No `field`, no tabbing, no pressing buttons with keys.

This is because GTK implementation does not support focusing `base` widget.

See https://github.com/red/red/issues/4251 for more info and watch for the fix of that issue. Or fix it and push a PR into Red ;)

As a temporary workaround something like this can be used:
```
view [
	kbcapture: field 0x0 focus
		on-key-down [spaces/events/dispatch host event]
		on-key-up   [spaces/events/dispatch host event]
		on-key      [spaces/events/dispatch host event]
	host: host [
		list with [axis: 'y] [
			button with [data: "button 1"]
			button with [data: "button 2"]
			button with [data: "button 3"]
		]
	] on-down [set-focus kbcapture]
]
```
However it has other issues, e.g. when you tab into this hidden field eventually.

---
## Comments

### Comment by **hiiamboris** (**Posted:** 24-Jun-2021/11:46:46+02:00 | **Updated:** 24-Jun-2021/11:46:46+02:00):

changed the description

---
### Comment by **hiiamboris** (**Posted:** 24-Jun-2021/12:38:16+02:00 | **Updated:** 24-Jun-2021/12:38:16+02:00):

changed the description

---
### Comment by **hiiamboris** (**Posted:** 11-Mar-2022/21:28:17+01:00 | **Updated:** 11-Mar-2022/21:28:17+01:00):

The underlying issue was fixed.

---
