
#2993: Loose group-box follows mouse arrow
================================================================================
Issue is closed, was reported by planetsizecpu and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/2993>

When a group-box is made "loose" and you move it to another place, then, after release the mouse button the group follows the mouse arrow by the screen whithout clicking if it passes over the group. Follow this example:
Red [	
	Needs:	 'View
]

w: [
	title "TEST"
	size 800x800
	FntGroup: group-box gray [ 
		below
		fnt1: radio bold "Console" data on on-down [] 
		fnt2: radio bold "Terminal" on-down [] 
		fnt3: radio bold "Fixed" on-down [] 
		SizSli: slider 80 50%
		return
	] loose
	
]

view w



Comments:
--------------------------------------------------------------------------------

On 2017-09-02T09:18:22Z, planetsizecpu, commented:
<https://github.com/red/red/issues/2993#issuecomment-326732908>

    Yesterday I tested drop-down & drop-list still following the mouse cursor

