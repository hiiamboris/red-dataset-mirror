
#3668: VID `default` overruns provided text
================================================================================
Issue is open, was reported by toomasv and has 4 comment(s).
[GUI]
<https://github.com/red/red/issues/3668>

**Describe the bug**
If both text and `default` are provided for `text` or `field` style in VID specification block, `default` value is shown instead of given text.

**To reproduce**
Run this:
```
view [field "Provided" default 'Default]
```

**Expected behavior**
If text is provided, it should be shown, not default value. As said in [documentation](https://doc.red-lang.org/en/vid.html#_default):

> Defines a default value for data facet when the conversion of text facet returns none.

Behavior is correct if text is given in `with` block:
```
view [field with [text: "Provided"] default 'Default]
```

**Hypothesis**
My hypothesis is that `opts/data: ` in [VID.red L312](https://github.com/red/red/blob/master/modules/view/VID.red#L312) is superfluous and triggers change of `text` facet on line [436](https://github.com/red/red/blob/master/modules/view/VID.red#L436), because of `on-change*` definitions in [view.red](https://github.com/red/red/blob/master/modules/view/view.red#L442).

When text is specified in `with` block, the text is shown correctly because with-block is bound and done [after](https://github.com/red/red/blob/master/modules/view/VID.red#L473) `data` is set. But if the hypothesis is true, text facet is set several times.

If above is correct, I propose deleting `opts/data: ` on line 312, and adding following after line 436:
```
if all [
	find [text field] face/type	
	find opts/options 'default 
	empty? face/text
][
	face/data: opts/options/default
]
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 12-Dec-2018/5:05:14+02:00 commit #98106a8
```


Comments:
--------------------------------------------------------------------------------

On 2018-12-18T21:53:08Z, endo64, commented:
<https://github.com/red/red/issues/3668#issuecomment-448384518>

    Should `empty? face/text` be `none? face/text`?
    Otherwise it wouldn't be possible to explicitly set a field text to empty string:
    `layout [field ""]` vs. `layout [field]`

--------------------------------------------------------------------------------

On 2018-12-19T06:57:22Z, toomasv, commented:
<https://github.com/red/red/issues/3668#issuecomment-448489713>

    Yes, you are right. I think `none? face/text` is ok.

