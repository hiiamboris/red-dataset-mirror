
#5133: [GTK, Draw] CLIP is destroying most of the picture
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [type.bug] [GUI] [GUI.GTK]
<https://github.com/red/red/issues/5133>

**Describe the bug**

These your bases should look identical:
![](https://i.gyazo.com/8863585fe4543fe6be07e081a7680cba.png)

**To reproduce**
```
Red []                                               

img1: make image! reduce [100x100 teal]
img2: make image! reduce [100x100 purple]

b1: compose/deep [   
     clip 0x0 300x300 [   
         translate 50x0  [image (img1) 0x0 100x100] 
         translate 150x0 [image (img2) 0x0 100x100] 
     ]
]
b2: copy/deep last b1

view [
	base white 300x300 draw b1
	base white 300x300 draw b2
]
```

**Expected behavior**

Both bases like the left one.

**Platform version**
```
Red 0.6.4 for Linux built 15-Mar-2022/17:14:51+03:00  commit #af98e79
```



Comments:
--------------------------------------------------------------------------------

On 2022-05-02T18:40:31Z, hiiamboris, commented:
<https://github.com/red/red/issues/5133#issuecomment-1115234149>

    See also https://github.com/red/red/issues/4859

