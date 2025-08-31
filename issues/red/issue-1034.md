
#1034: Switch cases not handled properly in compiled Red (0.5.0)
================================================================================
Issue is closed, was reported by iArnold and has 14 comment(s).
[type.review] [status.duplicate]
<https://github.com/red/red/issues/1034>

Hi there is a difference in how cases in a switch are handled in interpreted and compiled versions.
repeat i 10 [

```
switch/default i [
    1 3  5 7 9 [print ["Odd number found: " i]  ]
    2 4 6 8 10  [print ["Even number found:" i] ]
][ ; default 
    print ["Unknown if this number " i " is odd or even"]
]
```

]
In try.rebol.nl this results in:
Odd number found:  1
Even number found: 2
Odd number found:  3
Even number found: 4
Odd number found:  5
Even number found: 6
Odd number found:  7
Even number found: 8
Odd number found:  9
Even number found: 10
But in my compiled version both Win and MacOSX:
Odd number found:  1
Even number found: 2
Unknown if this number  3  is odd or even
Unknown if this number  4  is odd or even
Unknown if this number  5  is odd or even
Unknown if this number  6  is odd or even
Unknown if this number  7  is odd or even
Unknown if this number  8  is odd or even
Unknown if this number  9  is odd or even
Unknown if this number  10  is odd or even



Comments:
--------------------------------------------------------------------------------

On 2015-02-14T00:04:29Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1034#issuecomment-74349103>

    I can confirm this behaviour in the compiled version with this code:
    
    ```
    Red[]
    
    repeat i 10 [
      switch/default i [
        1 3 5 7 9 [print ["Odd number found: " i]  ]
        2 4 6 8 10  [print ["Even number found:" i] ]
      ][ ; default 
        print ["Unknown if this number " i " is odd or even"]
      ]
    ]
    
    do [
      repeat i 10 [
        switch/default i [
          1 3 5 7 9 [print ["Odd number found: " i]  ]
          2 4 6 8 10  [print ["Even number found:" i] ]
        ][ ; default 
          print ["Unknown if this number " i " is odd or even"]
        ]
      ]
    ]
    ```
    
    Results:
    
    ```
    Odd number found:  1
    Even number found: 2
    Unknown if this number  3  is odd or even
    Unknown if this number  4  is odd or even
    Unknown if this number  5  is odd or even
    Unknown if this number  6  is odd or even
    Unknown if this number  7  is odd or even
    Unknown if this number  8  is odd or even
    Unknown if this number  9  is odd or even
    Unknown if this number  10  is odd or even
    Odd number found:  1
    Even number found: 2
    Odd number found:  3
    Even number found: 4
    Odd number found:  5
    Even number found: 6
    Odd number found:  7
    Even number found: 8
    Odd number found:  9
    Even number found: 10
    ```

--------------------------------------------------------------------------------

On 2015-02-14T00:12:56Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1034#issuecomment-74349798>

    The compiler seems to support only a single value for each case which seems correct according to the HELP for SWITCH. The interpreter supports multiple values for each case.
    
    ```
    red>> ? switch
    
    USAGE:
        switch value  cases  /default  case
    
    DESCRIPTION:
         Evaluates the first block following the value found in cases. 
         switch is of type: native!
    
    ARGUMENTS:
         value  [any-type!] => The value to match.
         cases  [block!]
    
    REFINEMENTS:
         /default => Specify a default block, if value is not found in cases.
             case  [block!] => Default block to evaluate.
    ```

--------------------------------------------------------------------------------

On 2015-02-14T03:59:45Z, dockimbel, commented:
<https://github.com/red/red/issues/1034#issuecomment-74360400>

    Duplicate ticket with #611.

--------------------------------------------------------------------------------

On 2015-02-14T08:42:53Z, iArnold, commented:
<https://github.com/red/red/issues/1034#issuecomment-74367314>

    I see. You comment there:
    "
    
    Multiple keys in switch are not currently supported in the compiler. The issue is the handling of the blocks-as-keys cases, they are currently supported by the compiler, but they prevent the multiple keys support then because the compiler cannot statically determine which values are keys and which ones are action blocks.
    
    I really want to support multiple keys in the compiler too, so I think that we'll change the tradeoff and not allow block-as-key in the compiler. If the user really needs it, he will just wrap the switch in a do [...] block and let the interpreter handle it at runtime.
    "
    What exactly do you mean by blocks-as-keys? 
    switch value switch-block
    switch-block :: [case-block action-block] where the case-block is a block evaluating to true or false?
    
    Perhaps a refinement /block could come to the resque in the case this is needed?
    
    Then multiple choice could be supported without needing the interpreter. Besides the behaviour would become the same. Having to place code in a do block is 'unexplainable' and will give rise to many problems in such a common situation. 

--------------------------------------------------------------------------------

On 2015-02-14T09:13:03Z, dockimbel, commented:
<https://github.com/red/red/issues/1034#issuecomment-74368057>

    _What exactly do you mean by blocks-as-keys?_ 
    
    ```
    red>> switch [1] [ [1][print "1"] [2][print "2"] ]
    1
    ```
    
    Though, Rebol does not support that IIRC.
    
    Refinement: might be an option, `/only` would be a good fit for that (consistent with its other use-cases).
    
    _Having to place code in a do block is 'unexplainable'_
    Don't be so sure about what we can or cannot explain.
    
    _will give rise to many problems in such a common situation._
    Examples? Also, using block as keys is certainly not a _common situation_.

--------------------------------------------------------------------------------

On 2015-02-14T09:13:37Z, dockimbel, commented:
<https://github.com/red/red/issues/1034#issuecomment-74368070>

    Anyway, this ticket should be closed as it is a duplicate.

--------------------------------------------------------------------------------

On 2015-02-14T20:13:48Z, iArnold, commented:
<https://github.com/red/red/issues/1034#issuecomment-74390124>

    Yes close this duplicate.
    As "Don't be so sure about what we can or cannot explain." concerns: you can explain that to hell and back but it will be a killer for Red to have features like that differ for compiled and interpreted, or having programmers to put code in 'do blocks. Unacceptable imnsho ;)
    " using block as keys is certainly not a common situation." exactly! Where does Red need this for the compiler code or anything, drop that in favor of supporting multiselection.
    Discussion and ticket closed. Leaving #611 to be solved please.

