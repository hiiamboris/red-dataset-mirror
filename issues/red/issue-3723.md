
#3723: [View] leftover font objects are spawning faces uncontrollably
================================================================================
Issue is open, was reported by hiiamboris and has 10 comment(s).
[GUI]
<https://github.com/red/red/issues/3723>

**Describe the bug**

It is sometimes required to assign a font to screen object in order to measure some text string size. But when that font isn't set to `none` afterwards, it will create new faces upon the destruction of old ones.

It's actually not a problem with the screen font itself, but with font being already tailored to a specific face. Fonts not assigned to a face do not produce this behavior.

Maybe font objects should be automatically cleaned up before being assigned to a new face? Otherwise it's quite hard to deduce the bug cause from the bug behavior.

**To reproduce**

Try this in the GUI console.
```
fnt: make font! [name: system/view/fonts/fixed size: 10]

last-id: 0
system/view/VID/styles/bomb: [
	template: [
		type: 'base
		size: 50x50
		font: copy fnt
		text: "TEXT"
		actors: [
			on-created: func [f] [
				f/color: random white
				f/extra: last-id: 1 + last-id
				print ["Created id=" f/extra]
				system/view/screens/1/font: copy f/font  ;-- this is the culprit line
				probe size-text/with system/view/screens/1 "long text^/paragraph"
				; system/view/screens/1/font: none       ;-- this will fix it
			]
			on-down: function [f e] [
				append f/parent/pane also
					g: make-face 'bomb
					g/offset: f/offset + (f/size * 1x0)
			]
		]
	]
]

view/options [bomb][size: 200x100]
```

Click on the bases and see it creating new bases. Keep an eye on the `id=` numbers.
Then close the window and see how it recreates those faces on it's own!
The output looks like this:
```
>> view/options [bomb][size: 200x100]
Created id= 1
70x32
Created id= 2
70x32
Created id= 3          ;-- last base that was actually created
70x32                  ;-- now it's closing
Created id= 4          ;-- this was uncalled for
Created id= 5          ;-- this too
70x32                  ;-- moreso, on-created of id=5 was called from inside of on-created of id=4!!!
70x32
```

**Expected behavior**
No new faces should be spawned.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 9-Jan-2019/5:46:16+03:00 commit #acf3492
```



Comments:
--------------------------------------------------------------------------------

On 2019-01-14T12:16:53Z, qtxie, commented:
<https://github.com/red/red/issues/3723#issuecomment-453985749>

    I got those on Win7 64bit:
    ```
    >> view/options [bomb][size: 200x100]
    Created id= 1
    70x32
    ```

--------------------------------------------------------------------------------

On 2019-01-14T13:54:54Z, hiiamboris, commented:
<https://github.com/red/red/issues/3723#issuecomment-454012141>

    @qtxie as I wrote, you should click on the base, at least once.

--------------------------------------------------------------------------------

On 2019-01-14T21:14:29Z, endo64, commented:
<https://github.com/red/red/issues/3723#issuecomment-454163744>

    Confirmed on Win10
    ```
    Created id= 1
    70x32
    Created id= 2 ;this one happened when I click on base
    70x32
    Created id= 3 ;this one happened when I close the window
    70x32
    ```

--------------------------------------------------------------------------------

On 2024-06-26T06:36:14Z, qtxie, commented:
<https://github.com/red/red/issues/3723#issuecomment-2190917440>

    Cannot reproduce it with latest version on Win11.

--------------------------------------------------------------------------------

On 2024-06-26T08:58:43Z, hiiamboris, commented:
<https://github.com/red/red/issues/3723#issuecomment-2191178481>

    I don't have access to W7, but on W10 recent builds seem fine.

