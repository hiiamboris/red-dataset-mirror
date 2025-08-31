
#4428: [View] CR char interpretation inconsistencies between faces
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[type.review] [GUI]
<https://github.com/red/red/issues/4428>

(At least on Windows)

**Describe the bug**

(this issue is not made up, but was born from #4427 putting `^M^M^J` in place of each new-line)

This is the main problem - `text` and it's derivatives do not consider `cr` char in size calculation, but do render it as new-line. `rich-text` seems to render it the same:

| Code | Layout |
| --- | --- |
| `view [text {123^M234^M345^M456^M567^M678^M789}]` | ![](https://i.gyazo.com/4ef566dd5986a0cd935fef7e384550fd.png) |
| `view [h1 {123^M234^M345^M456^M567^M678^M789}]` | ![](https://i.gyazo.com/cc1df156e72deae074fc91ed79f8ac16.png) |
| `view [rich-text {123^M234^M345^M456^M567^M678^M789}]` | ![](https://i.gyazo.com/55f69aef3a4baf39c0f90545ff255ba8.png) |

Although rich-text infers the size correctly:
```
>> r: rtd-layout [{123^M234^M345^M456^M567^M678^M789}]
>> size-text r
== 16x79
```

But all other faces consider this a single line:

| Code | Layout |
| --- | --- |
| `view [check {123^M234^M345^M456^M567^M678^M789}]` | ![](https://i.gyazo.com/59a6c49f961b5aa34560e1d54506ea9d.png) |
| `view [radio {123^M234^M345^M456^M567^M678^M789}]` | ![](https://i.gyazo.com/ce3b0f523a8bbe21e4dc1a46815955f8.png) |
| `view [drop-down {123^M234^M345^M456^M567^M678^M789}]` |  ![](https://i.gyazo.com/51b669e561bbe83555020d6b5d3bed05.png) |
| `view [drop-list data [{123^M234^M345^M456^M567^M678^M789}] select 1]` |  ![](https://i.gyazo.com/9216fe728387a9dddb9186667214d811.png) |
| `view [area {123^M234^M345^M456^M567^M678^M789}]` |  ![](https://i.gyazo.com/0a74ea7d580c0e0474a0547135fae46a.png) |
| `view [field {123^M234^M345^M456^M567^M678^M789}]` |  ![](https://i.gyazo.com/1e32631c8943c0f58f2685d35aadf7a4.png) |
| `view [box {123^M234^M345^M456^M567^M678^M789}]` |  ![](https://i.gyazo.com/27f87852cdead6cd06c5a41867b7555f.png) |
| `view [button {123^M234^M345^M456^M567^M678^M789}]` |  ![](https://i.gyazo.com/89f81cf7e3ad9e09a1b7d70280bc2038.png) |
| `view [group-box {123^M234^M345^M456^M567^M678^M789}]` |  ![](https://i.gyazo.com/49b9111709d1560564192f4def9053a2.png) |

`group-box` here doesn't infer it's size from the title, but from the content - must be by design.



**To reproduce**
```
view [text {123^M234^M345^M456^M567^M678^M789}]
view [rich-text {123^M234^M345^M456^M567^M678^M789}]
```

**Expected behavior**

I haven't checked the other platforms, can't say what's more consistent. From Windows it looks like if we somehow stop `text` from splitting rendered lines on `^M` chars, that would be a solution.

We can probably also tell `rich-text` to eat `^M` chars, but I'm not sure if it's worth it or not. It is at least consistent with it's size. Thoughts?

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 18-Mar-2020/14:57:39+03:00 commit #101a64f
```



