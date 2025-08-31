# Archived messages from: [gitter.im/red/GTK](/gitter.im/red/GTK/) from year: 2022

## Friday 27th May, 2022

snotbubble

[10:19](#msg6290a5acd126691416b96d9e)Having a strange problem with text-list data becoming entangled with auto-generated faces. Is there something I'm doing incorrectly that would cause this?  
Posting here incase its a gtk issue.  
Sorry for the long example. Select list items, edit in field below, then do the same for the 2nd list. I get entangled data...

```
Red [ needs 'view ]
doup: true
mkp: func [ ] [
	n: copy []
	append n [ below ]
	repeat i 2 [
		append n compose/deep [ 
			(to-set-word rejoin [ "list" (i) ]) text-list 280x80 data [ "one" "two" ] select 1 on-change [
				;print [ "list on-change triggered and doup is" doup ]
				if doup [
					doup: false
					(to-set-path rejoin [ "edit" (i) " text" ]) (quote face/data/(face/selected))
					doup: true
				]
			]
			(to-set-word rejoin [ "edit" (i) ]) field 280x30 on-change [
				;print [ "field on-change triggered and doup is" doup ]
				if doup [
					if (quote face/text) <> "" [
						doup: false
						(to-set-path rejoin [ "list" (i) " data" "(list" (i) "/selected)" ]) face/text
						doup: true
					]
				]
			]
			pad 0x30
		]
	]
	probe n
	n
]
view/tight [ 
	title "face from func test - onchange"
	aa: panel 300x320 30.30.30 [ ]
	do [ append aa/pane layout/only mkp ]	
]
```

## Saturday 28th May, 2022

snotbubble

[09:13](#msg6291e7ae4aa6c31dca23e0f0)more ui woes, text-list below is updated by changes to its data from one fied, but not another:

```
Red [ needs 'view ]
a: [ "one" "two" "three" ]
doup: true
view [ 
	panel 200x500 [ 
		below 
		text "list block 'a'^/changes field below"
		aa: text-list 180x100 data a select 1 on-change [ if doup [ doup: false bb/text: a/(aa/selected) doup: true ] ]
		pad 0x30
		text "changes a/(listbox/selected)^/via on-change which^/auto-updates the listbox^/but not the field below"
		bb: field 180x30 with [ text: "one" ] on-change [ if doup [ a/(aa/selected): face/text probe a ] ]
		pad 0x30
		text "this is linked to a/2^/but doesn't update fields^/above"
		cc: field 180x30 with [ text: a/2 ] on-change [ probe a ]
	]
]
```

Is there any documentation that explains when widgets can or can't be updated by the data they use?

toomasv

[11:02](#msg6292012cdb6f627d25a484ef)@snotbubble My guess is, it's a feature of reactive system, that you have to reference data source you want to trigger the reaction. In your case, it's enough to use `a/2: face/text` (or even `a/2: a/2`) in `cc`'s `on-change` actor.

snotbubble

[11:23](#msg629206354e38f759e29142e5)Thanks Toomas. So in this example a text-list's `data` is included in the reactive system while a field's `text` isn't and has to be set explicity.

toomasv

[11:32](#msg6292083bef00bd1dc602b361)I don't know the low-level details of reactive system, just sharing guess based on observations. I think @hiiamboris can enlighten us on this.

hiiamboris

[11:39](#msg629209dfc9382316a6289603)let's see

[12:07](#msg6292109806a77e1e185b7a19)About the 2nd snippet (didn't run the 1st yet).

A series can only be owned by a single object currently. In this case `data` transfers ownership to `aa` of both `a` and it's subseries. Then `text` takes ownership of `aa/2` only from `aa` and gives it to `cc`. So `aa` won't see the changes in `a/2` anymore but it will see changes in `a`, that's why your `a/thing: other-thing` works, but the other one not.

[12:14](#msg62921212db6f627d25a4a5ee)In 1st snippet you need `text-list 280x80 data copy/deep [ "one" "two" ]` because you're assigning the \*same* block to both lists, which is clearly gonna go south.

toomasv

[12:44](#msg629219397df86c141ea9484e)But, @hiiamboris , why does `a/2: a/2` work in `cc`'s `on-change`?

[12:48](#msg62921a03deea5616bbcd6fd1)Aa.. that's because `a` is still owned by `aa`?

hiiamboris

[12:48](#msg62921a0edeea5616bbcd6feb)Because it's a change in `a` itself, yes.

toomasv

[12:48](#msg62921a264aa6c31dca243b93)Ok, thanks, got it!

hiiamboris

[12:48](#msg62921a2fc61b987d33cf358e):+1:

[12:48](#msg62921a3806a77e1e185b8d8f)Hope Craig gets it too :)

snotbubble

[13:12](#msg62921fbfe393a318062c9bf0)Hey I'm just faking it till I make it here... I'll sink in eventually :D  
So with the 1st problem, the series `[ "one" "two" ]` as it exists in the function \*is* whatever is duplicated in the output block... even though it has no name (like `theblock: [ "one" "two" ]`)

[13:33](#msg62922496d126691416bc63ae)and with the 2nd example: the best thing would be to decouple everything (copy instead) and change stuff explicitly via on-change, unless I want only one widget to be implicitly linked with the data (a)?

hiiamboris

[13:36](#msg629225527df86c141ea95e63)yeah

snotbubble

[13:36](#msg62922570f8daa71e07a08045)awesome thanks for clearing that up!

## Friday 22nd July, 2022

snotbubble

[07:02](#msg62da4b8722c53438bcc38618)having trouble attaching on-wheel to text

```
Red [ needs 'view ]
txtscroll: object [
	 on-wheel: function [face event] [ print [ "we're scrollin..." ] ]
	on-down: function [face even] [ print [ "click works" ] ]
]
view/tight [
	panel 50x50 [
		below center
		t: text "10"
	]
	do [ t/actors: txtscroll probe t/actors ] 
]
```

bug or feature??

hiiamboris

[21:18](#msg62db1418ef5ee44882d443aa)IIRC wheel doesn't work on GTK at all (bug)

Oldes

[21:52](#msg62db1c389f73251a2c7c8dc2)It does nothing under Windows either.

## Saturday 23th July, 2022

snotbubble

[12:55](#msg62dbefae76cd751a2f6ae88e)Got it thanks. No wheel-on-text.

## Sunday 24th July, 2022

hiiamboris

[11:57](#msg62dd33c476cd751a2f73ccbf)works fine on W10 for me

[11:58](#msg62dd33f79f29d42bedb2e094)if you're on W7, you might need to focus it to receive wheel events (different wheeling model there)
