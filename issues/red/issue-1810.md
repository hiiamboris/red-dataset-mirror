
#1810: Width of area determined by length of content
================================================================================
Issue is closed, was reported by WiseGenius and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1810>

The automatic width of the area is determined by the length of the entire initial content, rather than the length of the longest line.

```
view [area {
The quick brown fox jumps over the lazy dog^M
The quick brown fox jumps over the lazy dog^M
The quick brown fox jumps over the lazy dog^M
The quick brown fox jumps over the lazy dog^M
This is the longest line, so the right edge of the area should be about here->
}]
```

![too_long](https://cloud.githubusercontent.com/assets/7657453/14496993/9070cbbc-01d8-11e6-951c-2cc364781d90.png)

This is more like it:

```
view [area {This is the longest line, so the right edge of the area should be about here->}]
```

![just_right](https://cloud.githubusercontent.com/assets/7657453/14497010/add50efc-01d8-11e6-863a-da4ebbdf2a15.PNG)
#1488 might need to be sorted first.



