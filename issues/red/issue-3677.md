
#3677: image doesn't move with group-box
================================================================================
Issue is open, was reported by ne1uno and has 6 comment(s).
[type.bug] [GUI] [GUI.Win7]
<https://github.com/red/red/issues/3677>

 message & test code  from `gitter red/gui-branch` 2018-12-21
 `image` doesn't move if you dynamically change `offset/x` of the `group-box` but the `button` does move with the `group-box`?

<greggirwin> ... works fine for me here in Win10, either with a loose group-box or setting the offset.
```
load %fstk-logo.png
view [size 640x480 gb: group-box loose [button [gb/offset/x: 200] image fstk-logo]]
```
**Expected behavior**
image remains with group like other items when group-box offset changes 

```
RED: [ branch: "master" tag: #v0.6.4 ahead: 72 date: 21-Dec-2018/12:27:32 commit: #f29eabefd525b173c00035671b04e92ab6f616a7 ]
PLATFORM: [ name: "Windows 7 Service Pack 1" OS: 'Windows arch: 'x86-64 version: 6.1.1 build: 7601 ]
same with stable 064 and few months ago 063 new & old gui console
```



Comments:
--------------------------------------------------------------------------------

On 2018-12-22T12:35:26Z, meijeru, commented:
<https://github.com/red/red/issues/3677#issuecomment-449567055>

    Works for me too on W10

--------------------------------------------------------------------------------

On 2018-12-23T00:48:34Z, endo64, commented:
<https://github.com/red/red/issues/3677#issuecomment-449606717>

    Works for me (Win10), looks like Win7 specific issue.

--------------------------------------------------------------------------------

On 2020-03-06T19:58:14Z, hiiamboris, commented:
<https://github.com/red/red/issues/3677#issuecomment-595941034>

    Indeed, it's a layered window problem, as usual. Image is based on `base` face, with no `color` specified in it's template:
    `system/view/VID/styles/image/template: [type: 'base size: 100x100]`
    So it gets initialized same as `box`, by adding a WS_EX_LAYERED flag. 
    
    This reproduces the bug too on W7:
    `view [size 300x200 gb: group-box loose [button [gb/offset/x: 200] base #FF000011]]`
    
    In essence, it's the same bug as in https://github.com/red/red/issues/4239
    
    A workaround, for opaque images could look like this:
    `view [size 300x200 gb: group-box loose [button [gb/offset/x: 200] base 100x100 with [image: img]]]`

