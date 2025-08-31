
#2655: Request split accept none to allow for "exploding" series!
================================================================================
Issue is closed, was reported by gltewalt and has 10 comment(s).
<https://github.com/red/red/issues/2655>

```
split "Red" none
== [#"R" #"e" #"d"]
```

To behave like:
```
>> explode!: function [str [series!]] [
[        collect [foreach c str [keep c]]
[        ]
== func [str [series!] /local c][collect [foreach c str [keep c]]]
>> explode! "Red"
== [#"R" #"e" #"d"]
>> explode! @gltewalt
== [#"@" #"g" #"l" #"t" #"e" #"w" #"a" #"l" #"t"]
```


Comments:
--------------------------------------------------------------------------------

On 2018-12-23T21:57:37Z, endo64, commented:
<https://github.com/red/red/issues/2655#issuecomment-449665587>

    I'm not sure if this functionality should be added to `split` function, any thoughts @greggirwin ? Anyways this issue should go to REP as a wish.
    
    And here is a shorter explode function:
    `explode: func [s] [parse s [collect any [keep skip]]]`

--------------------------------------------------------------------------------

On 2018-12-24T00:46:19Z, hiiamboris, commented:
<https://github.com/red/red/issues/2655#issuecomment-449672840>

    Check this out ☺
    ```
    >> extract/into "Red" 1 []
    == [#"R" #"e" #"d"]
    ```

--------------------------------------------------------------------------------

On 2018-12-24T06:26:20Z, gltewalt, commented:
<https://github.com/red/red/issues/2655#issuecomment-449692001>

    This feels like 20 years ago in internet time.
    Extract/into is good enough, though as I look at split now I'd be happy if it mirrored R3's split.
    http://www.rebol.com/r3/docs/functions/split.html
    
    Do you want me to close this?

--------------------------------------------------------------------------------

On 2018-12-24T08:02:26Z, endo64, commented:
<https://github.com/red/red/issues/2655#issuecomment-449699789>

    @hiiamboris `extract/into` looks shorter but actually it is a mezz and much longer than above `explode` function.
    
    ```
    width: max 1 width
    if pos [series: at series pos]
    unless into [output: make series (length? series) / width]
    while [not tail? series] [
    	append/only output series/1
    	series: skip series width
    ]
    output
    ```
    
    @gltewalt I think we are good to close this ticket, but I'm wondering about below difference, may be we should follow its conversation on gitter or in a another ticket:
    
    ```
    >> extract/into "Red" 1 []
    == [#"R" #"e" #"d"]
    >> extract "Red" 1
    == "Red"
    ```

--------------------------------------------------------------------------------

On 2018-12-24T08:27:20Z, endo64, commented:
<https://github.com/red/red/issues/2655#issuecomment-449702234>

    Ah, no, `extract` returns the same type of series as the input, so my implication above was wrong.
    We can add a REP for ` /into` refinement for `split` as you mention @gltewalt 

