
#5540: [View] Platform discrepancy in image scaling on a button
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[type.review] [GUI]
<https://github.com/red/red/issues/5540>

**Describe the bug**

Running the same script on different platforms:
```
Red []
view [
    s: slider 100% react later [b/size: 500x500 * s/data ?? b/size] return
	b: button 500x500 black with [image: system/words/draw 400x400 [circle 200x200 190]]
]
```
Here's the behavior:

| W10 | GTK |
|-|-|
| ![](https://i.gyazo.com/e9cc8ece679a1b7d5c65f116218190fa.gif) | ![](https://i.gyazo.com/9c9d9eedec37decd0041b24c8cbf6884.gif) |
| Button can be of any size and clips the image | Button doesn't get smaller than the image |
| Image is not scaled by DPI (by design?) | [No DPI support](https://github.com/red/red/issues/4740) |
| Background color is ignored | Background color is as specified |

**To reproduce**

1. Run the provided script
2. Drag the slider around

**Expected behavior**

I realize that color is probably unsupported, and DPI is not yet there, but I think button downscaling behavior should be matched. Also it would be more sane to downscale the image to the button's size (smaller or bigger of its dimensions).

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.5 ahead: 182 date: 16-Aug-2024/3:34:58 commit: #dbc93da47047667023a66c5edf1aa1d63ff6f0d0 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19045 ]
--------------------------------------------
-----------RED & PLATFORM VERSION-----------
RED: [ branch: "master" tag: #v0.6.5 ahead: 186 date: 6-Sep-2024/10:31:12 commit: #f5c9214f6b545dc7aa7a551ac57851f86f8fd5ec ]
PLATFORM: [ name: "Ubuntu 20.04.1 LTS" OS: 'Linux arch: 'x86_64 version: 5.15.153 build: "#1 SMP Fri Mar 29 23:14:13 UTC 2024" ]
--------------------------------------------
```


