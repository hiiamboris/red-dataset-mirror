
#2777: [VIEW] In 'Draw block in a Face, "Set-word" used as a position mark is updated. It's not like what the document said.
================================================================================
Issue is closed, was reported by JenniferLee520 and has 4 comment(s).
<https://github.com/red/red/issues/2777>

According to [the "Draw" documentation](https://doc.red-lang.org/en/draw.html#_source_position)

> 6. Source position
>
> Set-words can be used in the Draw code in-between commands to record the current position in Draw block and be able to easily access it later.
> Note: 
> If the Draw block length preceding a set-word is changed, the recorded position will not be updated.

But somehow, the position can be updated.

```Red
view [ 
    origin 0x0
    base 800x400 draw [
        fill-pen green
        pos: box 400x0 450x100
    ] on-down [
        probe pos
        insert face/draw [pen red]
    ]
]
```
Run the code. "pen red" will be inserted into the draw block every time you click on the face. But as you will see: it's updated. In the following result, I clicked 4 times.
```Red
>> do %pos-test.red
[box 400x0 450x100]
[box 400x0 450x100]
[box 400x0 450x100]
[box 400x0 450x100]
```


Comments:
--------------------------------------------------------------------------------

On 2017-07-28T17:28:09Z, dockimbel, commented:
<https://github.com/red/red/issues/2777#issuecomment-318714642>

    It's a wording issue in the note, the "recorded position" refers to the initial position.
    
    I'm changing it to:
    > NOTE: If the Draw block length preceeding a set-word is changed, the original position will be changed accordingly, so the set-word will not point to the same reference anymore.

--------------------------------------------------------------------------------

On 2017-07-28T17:32:36Z, dockimbel, commented:
<https://github.com/red/red/issues/2777#issuecomment-318715731>

    Issue moved to [red/docs #20](https://github.com/red/docs/issues/20) via [**ZenHub**](https://www.zenhub.com/)

