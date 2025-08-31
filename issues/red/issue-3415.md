
#3415: There is a problem when set the image pixel on macOS
================================================================================
Issue is closed, was reported by hyzwhu and has 0 comment(s).
[status.built] [type.bug]
<https://github.com/red/red/issues/3415>

### Expected behavior
It should be show the complete small iamge in the bigger image after using the change-image func from code below
### Actual behavior
The small image lose something in the bigger image.(I have tested it on windows, it worked)
### Steps to reproduce the problem
```
all-image: load %all-image.png
	extrat: function [offset [integer!] size [pair!]][
		copy/part skip all-image offset size 
	]
	wall: extrat 270 30x30
	floor: extrat 300 30x30

change-image: function [src [image!] dst [image!] pos [pair!]][
		sx: src/size/x
		dx: dst/size/x 
		sy: src/size/y
		px: pos/x
		py: pos/y	
		repeat y sy [
			xs: y - 1 * sx  + 1 
			xd: y + py - 1 * dx  + 1 + px 
			repeat l sx [
				dst/:xd: src/:xs
				xd: xd + 1
				xs: xs + 1
			] 
		]
	]
pic: make image! 200x200
change-image wall pic 0x0
change-image floor pic 30x0
view [image pic image wall image floor]
```
![all-image](https://user-images.githubusercontent.com/30799534/41191250-27f2555c-6c1f-11e8-955a-08e8bbad5c5c.png)

### Red and platform version
```
RED: [ branch: "master" tag: #v0.6.3 ahead: 740 date: 9-Jun-2018/0:05:21 commit: #034b67cd9942cab03564072dc75b8f64664c3bea ]
PLATFORM: [ name: "macOS High Sierra" OS: 'macOS arch: 'x86-64 version: 10.13.4 build: "17E202" ]
```


