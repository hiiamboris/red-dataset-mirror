
#1436: font size too small
================================================================================
Issue is closed, was reported by WiseGenius and has 0 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/1436>

The displayed size of the text is smaller than its specified size in the code.

The following figures are true for:
- The text displayed in every type of face which displays text except for `'group-box` (which seems to ignore its `font` altogether) and maybe `'camera` since it's always black for me, and so I can't see if it displays any text.
- Text drawn in `draw`.

If the font name is "Times New Roman", the text is displayed 7/8ths (87.5%) the size that it is in any other app. Eg:
- `size: 72` is displayed as 63pt.
- `size: 16` is displayed as 14pt.

If the font name is "Comic Sans MS", the text is displayed 13/18nths (72.2̅%) the size that it is in any other app. Eg:
- `size: 72` is displayed as 52pt.
- `size: 18` is displayed as 13pt.

I havn't tested any other font names.

'
'
'
'
#### Ignore The Old Report

In the 4th of a short [list of preliminary reports on Gitter](https://gitter.im/red/red?at=56415d99565da33267ff78fd), I stated:

> “The quick brown fox jumps.” is not anti-aliased on Windows XP when it's italic, though it is in other apps, and it is in Windows 7, and it is when bold on both.

That was not correct.
1. The italic text _is_ anti-aliased, but didn't look like it because it's displayed at an incorrect size.
2. They look the same on both OSes when they have the same system settings.

**From here on is not important. It's just an explanation of how the mistake was made:**
##### 1

In every other app I had tried on Windows XP, “The quick brown fox jumps.” set to Times New Roman bold or italic at size 16pt looked like this:
![both-in-wordpad](https://cloud.githubusercontent.com/assets/7657453/11127829/f24e86a6-89c1-11e5-84f0-78895380f6f4.png)

In view-test, the bold looked the same, but smaller (because it is incorrectly displayed at 14pt):
![bold-in-view-test](https://cloud.githubusercontent.com/assets/7657453/11127842/04e0155a-89c2-11e5-8973-cfa5cdd47274.png)

But when it's italic, Times New Roman looks like this at 14pt:
![italic-in-view-test](https://cloud.githubusercontent.com/assets/7657453/11127871/2f33c612-89c2-11e5-83f1-255e1baf7ddc.png)

The above doesn't look anti-aliased, so when comparing it with the 16pt in every other app, I thought that was the difference. Actually it also looks that way in every other app when the size is 14pt.
##### 2

The reason it looked different in Windows 7, is that by default, Windows 7 is set to use ClearType to smooth fonts so that it looked like this:
![italic-in-view-test-clear](https://cloud.githubusercontent.com/assets/7657453/11127877/3d66167c-89c2-11e5-927d-db50ac3166ce.png)

Of course, this is actually still different from size 16 without the smoothing.

When Windows XP is also set to use ClearType, it looks the same as in Windows 7. And when ClearType is turn off in both, they are also identical.



