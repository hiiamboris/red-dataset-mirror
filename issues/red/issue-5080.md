
#5080: [View] `parent` facet is a source of all kinds of weird reactive glitches
================================================================================
Issue is open, was reported by hiiamboris and has 2 comment(s).
[GUI] [type.design]
<https://github.com/red/red/issues/5080>

**Describe the bug**

What's wrong with this code?
```
test: function [face] [probe face/font/color: black]
view [
	below
	t1: text "text"  t2: text "colored" font-color blue
	button focus "trigger" [t1/text: t1/text]
	text react [face/font: copy t2/font print "copied"] react [test face t1/text]
	text react [face/font: copy t2/font print "copied"] react [test face t1/text]
	text react [face/font: copy t2/font print "copied"] react [test face t1/text]
]
```
When button is pressed, `test` func is supposed to be called for each of 3 lower faces (2nd reaction), but 1st reaction should not be triggered. Instead, "copied" is printed 3x7=21 times (expected 0).

With this code, it's fixed: no more cascades of "copied" messages:
```
test: function [face] [probe face/font/color: black]
view [
	below
	t1: text "text"  t2: text "colored" font-color blue
	button focus "trigger" [t1/text: t1/text]
	text react [face/font: make t2/font [parent: none] print "copied"] react [test face t1/text]
	text react [face/font: make t2/font [parent: none] print "copied"] react [test face t1/text]
	text react [face/font: make t2/font [parent: none] print "copied"] react [test face t1/text]
]
```
In more complex code debugging of such issues becomes complete hell.

**To reproduce**

1. Run the script
2. Push the ~~red~~ button

**Expected behavior**

Well, this is the trickiest part, isn't it? What can we do in the current model?
Technically it doesn't know if I want to know if `font` facet was changed or if I want to know if *anything inside* `font` was changed.
It also doesn't currently distinguish between `parent` and other facets.
Simplest thing would be to ignore `parent` facet, as we ignore `extra`.
It can be useful to know if `parent` facet was replaced.
It can also be useful to know if some parent properties were changed (but this should better be specified with path into parent, e.g. `face/parent/size/x`).
However, letting `parent` generate events just like that is going to bounce them around totally unpredictably (as I've witnessed numerous times).
Primary issue with that is not even the sheer number of generated events, no.
Primary issue is that during this bouncing, cycles will be detected very often. And reactivity will cut these cycles at points where some unexpected event happened, but some events that are expected to follow it have not happened, leaving face tree in half-up-to-date state.

**Platform version**
```
Red 0.6.4 for Windows built 25-Jan-2022/14:48:41+03:00  commit #dbbe6e0
```

This issue should have a `type.design` label, but M$ has broken GH again this week, can't set labels.



Comments:
--------------------------------------------------------------------------------

On 2022-02-17T17:00:33Z, hiiamboris, commented:
<https://github.com/red/red/issues/5080#issuecomment-1043189631>

    This also makes me think that maybe we should consider some way to specify for each reactive source if we want all deep reactions on it, or only replacement of the source itself.

