
#4802: [View] Event composition is unpredictable
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[type.bug] [GUI]
<https://github.com/red/red/issues/4802>

**Describe the bug**

Looks like the order of events definition in template affects the outcome.

Let's start with a simple example where a style has a default actor and I'm overriding it (successfully) in VID:
```
Red [needs: view]

system/view/VID/styles/base2: [
	default-actor: 'on-down
	template: [
		type: 'base
		size: 100x100
		color: blue
		actors: [
			on-down:
				func [face event] [print "OLD HANDLER"]
		]
	]
]
view/no-wait [b: base2 on-down [print "NEW HANDLER"]]
?? b/actors
```

Output is correct:
```
b/actors: make object! [
    on-down: func [face [object!] event [event! none!]][print "NEW HANDLER"]
]
```

---
Now let's add another actor after it:
```
system/view/VID/styles/base2: [
	default-actor: 'on-down
	template: [
		type: 'base
		size: 100x100
		color: blue
		actors: [
			on-down:
			on-focus: 
				func [face event] [print "OLD HANDLER"]
		]
	]
]
view/no-wait [b: base2 on-down [print "NEW HANDLER"]]
?? b/actors
```

Oops! One of the actors was eaten:
```
b/actors: make object! [
    on-down: func [face [object!] event [event! none!]][print "NEW HANDLER"]
]
```

---
Now what if we change the order?
```
system/view/VID/styles/base2: [
	default-actor: 'on-down
	template: [
		type: 'base
		size: 100x100
		color: blue
		actors: [
			on-focus: 
			on-down:
				func [face event] [print "OLD HANDLER"]
		]
	]
]
view/no-wait [b: base2 on-down [print "NEW HANDLER"]]
?? b/actors
```

Oh so now we have both old actors but not the new one!
```
b/actors: make object! [
    on-down: func [face event][print "OLD HANDLER"]
    on-focus: func [face event][print "OLD HANDLER"]
]
```

---
What will happen in this code?
```
system/view/VID/styles/base2: [
	default-actor: 'on-down
	template: [
		type: 'base
		size: 100x100
		color: blue
		actors: [
			on-wheel: 
			on-focus: 
			on-down:
			on-unfocus:
				func [face event] [print "OLD HANDLER"]
		]
	]
]
view/no-wait [b: base2 on-down [print "NEW HANDLER"]]
?? b/actors
```

Turns out:
```
*** Script Error: on-unfocus: needs a value
*** Where: on-unfocus
*** Stack: view layout context on-down 
```
What???

**Expected behavior**

For the last snippet - 3 old handlers, 1 new handler.

**Platform version**
```
Red 0.6.4 for Windows built 17-Jan-2021/14:47:41
```



