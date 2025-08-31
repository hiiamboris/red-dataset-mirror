
#5113: [View] funny `area` horizontal scrollbar visibility logic
================================================================================
Issue is open, was reported by hiiamboris and has 2 comment(s).
[GUI]
<https://github.com/red/red/issues/5113>

**Describe the bug**

1. Button here adds `xx` to each line, but even though last `x` is obstructed by the vertical scrollbar, no horizontal scrollbar is shown:
![](https://i.gyazo.com/7ebe5477b81f08304b4041aebfed60d6.gif)
```
view append [
	button focus "+" [parse a/text [any [to "^/" insert "xx" skip]]]
	a: area font-size 10 150x100
] append/dup "" "abcdefghi abcedfgh^/" 10
```
To reproduce, it's important to tune layout so that before `xx` insertion line doesn't touch vertical bar, but after - doesn't exceed full face width. Also, the scrollbar always shows on second modification of text.

---

2. As in (1), text is obstructed but no horizontal scrollbar:
![](https://i.gyazo.com/6f27cdf23d5f194d074bd2548f55fbcc.gif)
```
view append [
	button focus "+" [
		parse a/text [any [to "^/" insert "xxx" skip]]
		append/dup a/text a/text 4
	]
	a: area font-size 10 150x100
] append/dup "" "abcdefghi abcedfghi^/" 2
```
---

3. Horizontal scrollbar is shown, even though text fully fits the line:
![](https://i.gyazo.com/10a83299c558fddf56c6177e5df0eb86.png)
```
view append [
	button focus "+" [append a/text a/text]
	a: area font-size 10 150x100
] append/dup "" "abcdefghix abcedfghix^/" 2
```
---

4. Here the same text leads to different layouts depending on how it is constructed:

| ![](https://i.gyazo.com/edcde4f353610d54a43937f2620894a9.png) | ![](https://i.gyazo.com/7c09bcea107e068ef1c324782659d7d5.png) |
|-|-|
Left:
```
view append [
	button focus "+" [
		t: copy a/text
		parse t [any [to "^/" insert "xxx" skip]]
		take/last append/dup t t 2
		a/text: t
	]
	a: area font-size 10 150x160
] append/dup "" "abcdefghi abcedfghi^/" 2
```
Right:
```
view append [
	button focus "+" [
		t: copy a/text
		parse t [any [to "^/" insert "xxx" skip]]
		append/dup t t 2
		take/last a/text: t
	]
	a: area font-size 10 150x160
] append/dup "" "abcdefghi abcedfghi^/" 2
```


**Expected behavior**

When part of the text is hidden by any scrollbar, another should show.
(4) is a tricky case, I don't insist on changing it.

**Platform version**
```
Red 0.6.4 for Windows built 11-Mar-2022/2:40:53+03:00  commit #27f71f9
```



Comments:
--------------------------------------------------------------------------------

On 2022-03-30T17:47:35Z, hiiamboris, commented:
<https://github.com/red/red/issues/5113#issuecomment-1083436408>

    See also https://github.com/red/red/issues/1904

