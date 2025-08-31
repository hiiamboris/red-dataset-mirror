
#5541: VID considers the image drawn before issuing an ORIGIN 0x0 in its calculations after RETURN
================================================================================
Issue is closed, was reported by GiuseppeChillemi and has 4 comment(s).
[status.built] [status.tested] [type.review] [GUI]
<https://github.com/red/red/issues/5541>

**Describe the bug**

Drawing a BASE with an image and then issuing `origin 0x0`, at the first RETURN the BASE is considered as part of the ROW in the position calculation of the next face, while it is expected to be ignored.

**To reproduce**

```
myimage: load %sun-blasts-a-m66-flare.jpg 

view/flags/tight [
	base %stars1.jpg 
	origin 0x0
	button 200x200 %sun-blasts-a-m66-flare.jpg [
		probe "hello button"
	]

	i: image myimage 30% [
		probe "hello image"
	]
	
	button "Test" [
		i/image: load %stars1.jpg 
	]
	return
	button "quit" [quit]
		
] [no-border]
```

**Expected behavior**
I draw a `BASE` with an image, then I reset the `origin to 0x0`.
All the subsequent faces start from there to the right, one after another, without ever taking into consideration the starting `BASE` for the calculation of the next face position.

After issuing a `RETURN` I expected the `QUIT` button be positioned below the first face drawn in this sequence, I mean below `button 200x200 %sun...` just after the `origin 0x0`. _Instead VID takes into consideration the BASE face into the `ROW` calculation and draws the `quit` button below i, while I think it shouldn't._

**Screenshots**

![image](https://github.com/user-attachments/assets/c4a2357b-4438-4608-9c7e-6d811c02cd42)


**Image files**
Save this as `stars1.jpg`

![stars1](https://github.com/user-attachments/assets/865812c4-7386-419f-b2b7-6bf22df6d39f)

Save this as  `sun-blasts-a-m66-flare.jpg`

![sun-blasts-a-m66-flare](https://github.com/user-attachments/assets/6e636ed7-518c-4ec8-a6e3-801eb587c229)

**Platform version**

_-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.5 ahead: 186 date: 6-Sep-2024/10:31:12 commit: #f5c9214f6b545dc7aa7a551ac57851f86f8fd5ec ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 22631 ]
_--------------------------------------------



Comments:
--------------------------------------------------------------------------------

On 2024-10-02T14:42:42Z, dockimbel, commented:
<https://github.com/red/red/issues/5541#issuecomment-2388839299>

    In current VID, in order to remove a face from the auto-positioning, you have to switch to fixed positioning using `at` and that will give you the wanted result:
    ```
        origin 0x0
        at 0x0 base %stars1.jpg
        ...
    ```
    
    `origin` was not meant to be used to reset the auto-positioning in the middle of the layout, though I think it would be useful to support that, as it looks easier and more intuitive.

--------------------------------------------------------------------------------

On 2024-10-02T15:07:52Z, dockimbel, commented:
<https://github.com/red/red/issues/5541#issuecomment-2388918166>

    After this commit, it should work as you expect with no changes to your code.

