
#4429: [View] Rich-text `para` facet resets default settings when present
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/4429>

**Describe the bug**

Notice how specifying `para` immediately centers the text:

| Code | Layout |
| --- | --- |
| `view [rich-text {123^/234^/345^/456^/567^/678^/789}]` | ![](https://i.gyazo.com/fcac1d47d3cc19878c5c817874db1fd0.png) |
| `view [rich-text {123^/234^/345^/456^/567^/678^/789} para []]` | ![](https://i.gyazo.com/9729cc869062e7b40487e343ac364ffe.png) |
| `view [rich-text top {123^/234^/345^/456^/567^/678^/789}]` | ![](https://i.gyazo.com/6f55c5c853bc5e906624816220e96714.png) |
| `view [rich-text right {123^/234^/345^/456^/567^/678^/789}]` | ![](https://i.gyazo.com/0fa73c79cc98098bfa3cd994a5f359e3.png) |

**To reproduce**
```
view [rich-text {123^/234^/345^/456^/567^/678^/789}]
view [rich-text {123^/234^/345^/456^/567^/678^/789} para []]
view [rich-text top {123^/234^/345^/456^/567^/678^/789}]
view [rich-text right {123^/234^/345^/456^/567^/678^/789}]
```

**Expected behavior**

1 & 2 should look the same. As for what should be the default alignment, not sure. Likely top-left.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 18-Mar-2020/14:57:39+03:00 commit #101a64f
```



Comments:
--------------------------------------------------------------------------------

On 2020-05-06T01:39:09Z, 9214, commented:
<https://github.com/red/red/issues/4429#issuecomment-624399648>

    #4280 

