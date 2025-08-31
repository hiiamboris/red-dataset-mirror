
#2372: Stack overflow may occur when combining explicit on-change with auto-syncing
================================================================================
Issue is open, was reported by meijeru and has 14 comment(s).
[status.reviewed] [type.review] [GUI]
<https://github.com/red/red/issues/2372>

Example program (from a larger application, reduced to essentials):
```
Red []
display: does [
	if empty? input-field/text [
		win/selected: input-field
		exit
	]
; do some processing to fill in result=field
]
win: layout compose [
	size 960x680
	at 20x20 result-field: area 920x490 ""
	at 20x570 input-field: field 910x60 "" 
		on-change [display]
	at 530x525 button 80x30 "Clear" [
		clear input-field/text
	]
	at 890x525 button 40x30 "Exit" [quit]
]
view win
```

Clicking the `Clear` button leads to stack overflow, presumably because the setting of `win/selected: input-field` in the `display` function triggers another `on-change [display]` and so forth. 


Comments:
--------------------------------------------------------------------------------

On 2016-12-19T13:51:43Z, meijeru, commented:
<https://github.com/red/red/issues/2372#issuecomment-267968581>

    Addendum: stack overflow occurs when interpreting; if compiled with `-t MSDOS` there is an access violation, and when compiled with `-t Windows` nothing happens (?!?) 

--------------------------------------------------------------------------------

On 2016-12-19T13:57:11Z, qtxie, commented:
<https://github.com/red/red/issues/2372#issuecomment-267969756>

    I think we need a `set-focus` function.

--------------------------------------------------------------------------------

On 2017-03-17T06:04:23Z, dockimbel, commented:
<https://github.com/red/red/issues/2372#issuecomment-287274672>

    @meijeru Did you forget to add a `Needs: 'View` entry in the header when compiling it?
    
    Compiling works fine here, and exhibits the same stack overflow error.

--------------------------------------------------------------------------------

On 2017-03-17T09:19:11Z, meijeru, commented:
<https://github.com/red/red/issues/2372#issuecomment-287304935>

    I may have forgotten. In any case, glad you took a look and confirmed.

--------------------------------------------------------------------------------

On 2019-05-22T11:27:00Z, hiiamboris, commented:
<https://github.com/red/red/issues/2372#issuecomment-494762847>

    It doesn't stack-overflow anymore by the looks of it, but wreaks havoc upon the colors of both the button and the field (W7):
    ![](https://i.gyazo.com/9a9acd9b30efd7768eeaa50e321ad05d.gif)
    
    Red 0.6.4 for Windows built 20-May-2019/0:54:25+03:00 commit #3951b6e

--------------------------------------------------------------------------------

On 2019-08-16T13:47:03Z, dockimbel, commented:
<https://github.com/red/red/issues/2372#issuecomment-522014605>

    I can still get a stack overflow error on clicking on `Clear` button, though, it takes several manipulations, switching back and forth between inserting some texts and clicking the button.

--------------------------------------------------------------------------------

On 2025-01-10T18:27:05Z, dockimbel, commented:
<https://github.com/red/red/issues/2372#issuecomment-2583498334>

    I cannot reproduce the issue at all with latest commit. I propose to close this ticket as solved.

