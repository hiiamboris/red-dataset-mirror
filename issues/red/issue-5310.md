
#5310: [View] `swap` is ignored by window pane (and surely many other actions)
================================================================================
Issue is open, was reported by hiiamboris and has 12 comment(s).
[type.bug] [GUI]
<https://github.com/red/red/issues/5310>

root issue: https://github.com/red/REP/issues/92

**Describe the bug**

I'm swapping pane contents but it's not visible so one may accidentally drive thru red light:
<img width=300 src=https://i.gyazo.com/11ea44891352a21b97f3ec71f62c1a5a.gif />

**To reproduce**

```
repeat i 2 [
	append w: [] view/no-wait/options compose [
		base (pick [green red] i) on-down [
			? w/1/pane/1/color
			swap w/1/pane w/2/pane
			? w/1/pane/1/color
		]
	] [offset: as-pair i * 100 + 400 300]
]
do-events
```
click on the bases


**Expected behavior**

visible color change:
<img width=300 src=https://i.gyazo.com/68e5f5557a8ec0dc307afa47accf15cb.gif />

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4667 date: 9-Apr-2023/3:24:34 commit: #d36108eeffeafbf14839b5a9cadc9a0acd87f34a ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-09-15T14:07:55Z, dockimbel, commented:
<https://github.com/red/red/issues/5310#issuecomment-1721343671>

    @hiiamboris For sake of curiosity, did you ever use the `swap` action?
    
    It seems to me that the use-cases on series are extremely rare... so much so that I wonder why it got promoted to an action in Rebol...
    
    If we decide not to get rid of it, it should at least be extended to work on `pair!` and `point2D!`, so at it least I could have a use for it (still rare though).

--------------------------------------------------------------------------------

On 2023-09-15T15:30:17Z, hiiamboris, commented:
<https://github.com/red/red/issues/5310#issuecomment-1721468594>

    > that I wonder why it got promoted to an action in Rebol...
    
    Always wondered about that too.
    
    IIRC this issue came from a real use case in [scrollpanel](https://codeberg.org/hiiamboris/red-common/src/commit/cd3a3a550b5742d3b3a27ecff24760492ab3aaf6/scrollpanel.red#L54). I also found another use of it in some old code, but that's it, two uses.
    
    I have a better use for it myself: given two words/paths swap their values: `swap 'obj/x 'obj/y`, so I override it in Spaces. Still rare use but more common. `move` is also very rare, for an action.
    
    For `pair!` and `point2D!` we have `reverse`.

--------------------------------------------------------------------------------

On 2023-09-15T17:24:06Z, greggirwin, commented:
<https://github.com/red/red/issues/5310#issuecomment-1721611705>

    Agreed on both `swap` and `move`. 

--------------------------------------------------------------------------------

On 2023-09-15T19:17:59Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5310#issuecomment-1721732584>

    I didn't know their existence and working. They seem suitable to be used when moving lange blocks of records in flat databases. I have tested the `/part` attributes and it moves `recordsize x records` blocks of data very quickly. If it doesn't cost too much, please leave there `move` and `swap` as actions.
    
    EDIT: A particular use comes into my mind. When you  have a gui with 2 list-views, `move` can take all the selected data elements from one list to another. `Swap`, on its side, could swap an entire list from source to destination and viceversa. I think we still need some real world use scenery apreciate them.
    
     

--------------------------------------------------------------------------------

On 2023-09-15T20:02:38Z, hiiamboris, commented:
<https://github.com/red/red/issues/5310#issuecomment-1721776149>

    This is absurd. Instead of swapping items around you can just exchange data blocks. For `move/part` case `change` won't be slower, since in case of intersection it has to allocate new buffer anyway, or worse - shift the original series in place.

--------------------------------------------------------------------------------

On 2023-09-16T01:14:26Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5310#issuecomment-1722091559>

    > This is absurd. Instead of swapping items around you can just exchange data blocks. For `move/part` case `change` won't be slower, since in case of intersection it has to allocate new buffer anyway, or worse - shift the original series in place.
    
    You can swap until the list is not referenced by multiple words/blocks; in this case you must find each structure. Ok, that's doable. But in case you have anonymous containers pointing to the lists, you can't swap just the data blocks.
     

