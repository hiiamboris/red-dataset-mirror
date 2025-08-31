
#3433: draw `fill-pen` isn't being reset properly
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/3433>

It looks like solid pens conflict with the gradients and are not being replaced unless `fill-pen off` is issued.

### Steps to reproduce the problem
```
view compose/deep [
	base (b: 200x200) coal draw [
		pen off
		scale (s: 20) (s)

		fill-pen red
;		fill-pen off
		fill-pen radial glass blue glass
		
;		fill-pen off
		fill-pen red
		box 0x0 (b / s)
		fill-pen radial glass blue glass
		box 0x0 (b / s)
	]
]
```
### Expected behavior
uncomment any of the commented out lines to see the expected result:
![](https://i.gyazo.com/d1b34636695f9126ace948f7aae2beeb.png)

### Actual behavior
![](https://i.gyazo.com/c4f4afa862e2b333a6744ed8bf6045e4.png)

### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 750 date: 12-Jun-2018/15:07:14 commit: #e62b63d51cdc5d5f6033eb3fa366fd94be0b2deb ]
PLATFORM: [ name: "Windows 7 Service Pack 1" OS: 'Windows arch: 'x86-64 version: 6.1.1 build: 7601 ]
--------------------------------------------
```
As I said, uncommenting works for the current nightly release, but in the stable one nothing I tried seems to work.


