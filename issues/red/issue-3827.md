
#3827: [VID] `style` size application issues and incorrect `field` height
================================================================================
Issue is open, was reported by hiiamboris and has 6 comment(s).
[status.reviewed] [GUI]
<https://github.com/red/red/issues/3827>

## **Describe the bug**

![](https://i.gyazo.com/52d042cb139a94f0a0c39efbab2f1563.png)

You see **3 horizontal lines** containing 3 styles: `box`, `field`, `area`. Each face is wrapped into a panel to be visible.
**Left quarter** (6 faces) should have 0 width. **Right 3/4** (another 6 faces) should have width = 100.

Let's walk from left to right:

1. Purple column is a face with **explicitly** overridden size (as `face size`):
- 1st and 7th override width
- 4th and 10th override whole size as pair
2. Next column is a face with size overridden in the **style definition** (as `style1: face size`):
- 2nd and 8th override width
- 5th and 11th override whole size as pair
3. Then a column with size overridden in a style **derived** from other style (as `style2: style1 size`):
- 3rd and 9th override width
- 6th and 12th override whole size as pair

Let's analyze what we see:

- Column groups (2) and (3) should **not be any different**. Yet they are.
- Columns 5 and 11 show that `field` **height is not overridden** by the style ([also reported by @ralfwenske in /bugs room](https://gitter.im/red/bugs?at=5c90bfa7f3dbbd230c7ef750)).

Another, related, issue shown by @ralfwenske (follow the link above) is that the **field height** is incorrectly calculated on MacOS:
![](https://ralfwenske.net/Screen%20Shot%202019-03-19%20at%207.32.52%20pm.png)

## **To reproduce**

Styled columns test:
```
C: magenta + 0.0.0.200
view [
	backdrop cyan

	style boxe:      box
	style box0:      box  0
	style boxe0:     boxe 0
	style box0x0:    box  0x0
	style boxe0x0:   boxe 0x0
	style box100:    box  100
	style boxe100:   boxe 100
	style box100x0:  box  100x0
	style boxe100x0: boxe 100x0

	style fielde:      field
	style field0:      field  0
	style fielde0:     fielde 0
	style field0x0:    field  0x0
	style fielde0x0:   fielde 0x0
	style field100:    field  100
	style fielde100:   fielde 100
	style field100x0:  field  100x0
	style fielde100x0: fielde 100x0

	style areae:      area
	style area0:      area  0
	style areae0:     areae 0
	style area0x0:    area  0x0
	style areae0x0:   areae 0x0
	style area100:    area  100
	style areae100:   areae 100
	style area100x0:  area  100x0
	style areae100x0: areae 100x0

	panel [backdrop C
			 box 0     "BOX"]
	panel [box0      "BOX"]
	panel [boxe0     "BOX"]
	panel [backdrop C
			 box 0x0   "BOX"]
	panel [box0x0    "BOX"]
	panel [boxe0x0   "BOX"]

	panel [backdrop C
			 box 100   "BOX"]
	panel [box100    "BOX"]
	panel [boxe100   "BOX"]
	panel [backdrop C
			 box 100x0 "BOX"]
	panel [box100x0  "BOX"]
	panel [boxe100x0 "BOX"]
	return

	panel [backdrop C
			 field 0     "FLD"]
	panel [field0      "FLD"]
	panel [fielde0     "FLD"]
	panel [backdrop C
			 field 0x0   "FLD"]
	panel [field0x0    "FLD"]
	panel [fielde0x0   "FLD"]

	panel [backdrop C
			 field 100   "FLD"]
	panel [field100    "FLD"]
	panel [fielde100   "FLD"]
	panel [backdrop C
			 field 100x0 "FLD"]
	panel [field100x0  "FLD"]
	panel [fielde100x0 "FLD"]
	return

	panel [backdrop C
			 area 0      "ARE"]
	panel [area0       "ARE"]
	panel [areae0      "ARE"]
	panel [backdrop C
			 area 0x0    "ARE"]
	panel [area0x0     "ARE"]
	panel [areae0x0    "ARE"]

	panel [backdrop C
			 area 100    "ARE"]
	panel [area100     "ARE"]
	panel [areae100    "ARE"]
	panel [backdrop C
			 area 100x0  "ARE"]
	panel [area100x0   "ARE"]
	panel [areae100x0  "ARE"]
]
```

Field height test for MacOS:
```
view [
  style styledf1: field 150x30 font [size: 14]
  style styledf2: field 200x30 font [size: 14]
  below
  f1: field 150x30 "f1" font [size: 14]
  f2: field 150x30 "f2" font [size: 14]
  f3: styledf1 "f3"
  f4: styledf1 "f4"
  f5: styledf2 "f5"
  f6: styledf2 "f6"
]
```

## **Expected behavior**

1. Groups (2) and (3) should yield equal result. Two possibilities:
- consider group (2) valid: the size was overridden by style, and was not later provided by the user - so it's logical to use the size from style description
- consider group (3) valid: user specified a text facet and in doing so overrode the value defined in style description
2. `field` should allow it's height override if group (2) is chosen as valid.
3. `field` height should be correctly inferred on MacOS (may be related to https://github.com/red/red/issues/1871 and https://github.com/red/red/issues/3116).


## **Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 25-Mar-2019/13:11:08+03:00 commit #e6c96aa
```



Comments:
--------------------------------------------------------------------------------

On 2019-03-27T17:49:55Z, greggirwin, commented:
<https://github.com/red/red/issues/3827#issuecomment-477277675>

    Thanks for the detailed ticket @hiiamboris!

--------------------------------------------------------------------------------

On 2019-08-14T14:20:04Z, dockimbel, commented:
<https://github.com/red/red/issues/3827#issuecomment-521266033>

    The macOS issue is unrelated to the rest, it should be part of a different ticket. It's already hard enough to understand what is the issue about without adding extra unrelated issues on top of it.
    
    > Each face is wrapped into a panel to be visible.
    
    ?? Why does a face need a panel to be visible?
    
    
    >Purple column is a face with explicitly overridden size (as face size):
    > 1st and 7th override width
    > 4th and 10th override whole size as pair
    
    What do `1st`, `7th`, `4th`, etc... refer to in the context of the `Purple column`?
    
    
    > Left quarter (6 faces) should have 0 width
    
    That is an incorrect assumption. Native widgets can have minimal sizes > 0, and there is nothing we can do about that.

--------------------------------------------------------------------------------

On 2019-08-18T19:15:56Z, hiiamboris, commented:
<https://github.com/red/red/issues/3827#issuecomment-522347525>

    @dockimbel 
    > ?? Why does a face need a panel to be visible?
    
    Because of the face sizes: they are of zero area and so should not be seen. A panel wraps them in a 5px margin or so.
    
    > What do 1st, 7th, 4th, etc... refer to in the context of the Purple column?
    
    You can count that there are 12 columns in total. Columns 1, 4, 7 and 10 are made purple for easier counting.
    
    > That is an incorrect assumption. Native widgets can have minimal sizes > 0, and there is nothing we can do about that.
    
    Yet they do have a zero width using some styles. Compare cols 1&2 vs 3 for example.

