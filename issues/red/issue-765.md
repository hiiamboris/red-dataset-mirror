
#765: Problem with FIND at TAIL of BLOCK!
================================================================================
Issue is closed, was reported by WayneCui and has 16 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/765>

Both in Linux and Windows console (for compiler, both is fine):

```
board: [ 'a 'a 'a ]
while [ board: find board 'a ][
    print index? board 
    board: next board
]
```

will produce 

```
1
2
3

*** Script error: action 9 not defined for type: 0
```

while

```
board: [ 'a 'a 'a 0]
while [ board: find board 'a ][
    print index? board 
    board: next board
]
```

is fine:

```
1
2
3
```



Comments:
--------------------------------------------------------------------------------

On 2014-04-07T16:38:17Z, WayneCui, commented:
<https://github.com/red/red/issues/765#issuecomment-39753267>

    For your reference
    
    ```
    >>board: []  ;or board: ['a 'a 'a 0]
    >>while [board: find board 'a][board: next board]
    ```
    
    run the second statement twice(yeah, exactly twice, the first time is always fine), will get:
    
    ```
    ;in windows
    *** Runtime Error 1: access violation
    *** at: 0043A333h
    
    ;in linux
    *** Runtime Error 32:segmentation fault
    *** at: xxxxxxxxh
    ```
    
    While, if the second statement was changed to: `while [board: find board 'a][print index? board board: next board]`, in linux will get the same error with windows: `*** Runtime Error 1: access violation`

--------------------------------------------------------------------------------

On 2014-04-07T23:26:07Z, PeterWAWood, commented:
<https://github.com/red/red/issues/765#issuecomment-39796052>

    Your second example is to be expected:
    
    ```
    red>> board: []
    == []
    red>> while [board: find board 'a] [board: next board]
    red>> board
    == none
    red>> find board 'a
    
    *** Runtime Error 1: access violation
    *** at: 40040800h
    ```
    
    I think that there is a mistake in your code - why do you set the word 'board to the result of find? When 'a isn't found, you set 'board to none. Isn't this what you are trying to achieve:
    
    ```
    red>> board: []
    == []
    red>> while [find board 'a] [board: next board]
    red>> while [find board 'a] [board: next board]
    red>> while [find board 'a] [board: next board]
    red>> 
    ```

--------------------------------------------------------------------------------

On 2014-04-07T23:27:19Z, PeterWAWood, commented:
<https://github.com/red/red/issues/765#issuecomment-39796122>

    There seems to be a problem with 'FIND on blocks which your code highlighted:
    
    ```
    red>> b: "12345678"
    == "12345678"
    red>> find tail b "1"
    == none
    red>> b: tail b
    == ""
    red>> b
    == ""
    red>> b: next b
    == ""
    red>> find b "1"
    == none
    red>> b: [a b c d e]
    == [a b c d e]
    red>> b: tail b
    == []
    red>> find b 'a
    
    *** Script error: action 9 not defined for type: 0
    ```

--------------------------------------------------------------------------------

On 2014-04-07T23:32:53Z, PeterWAWood, commented:
<https://github.com/red/red/issues/765#issuecomment-39796485>

    I've updated the title of the issue.

--------------------------------------------------------------------------------

On 2014-04-08T00:04:17Z, PeterWAWood, commented:
<https://github.com/red/red/issues/765#issuecomment-39798434>

    NOTE: This problem only occurs with the interpreter not the compiler.

--------------------------------------------------------------------------------

On 2014-04-08T13:06:29Z, WayneCui, commented:
<https://github.com/red/red/issues/765#issuecomment-39844809>

    Quick fix! I can carry on with my code :-)
    From the tests above, there are two issue in fact:
    1. Problem with FIND at TAIL of BLOCK!
    2. Problem with FIND on none!
    I have tested the fix. The first one is fine. It solved my origin problem. But there is still another issue as the second one:
    
    ```
    >>find none 'a
    *** Runtime Error 1: access violation
    *** at: 0043A3B3h
    ```
    
    Hmm, it seems this one is not compatibility with the title.

--------------------------------------------------------------------------------

On 2014-04-08T13:17:36Z, PeterWAWood, commented:
<https://github.com/red/red/issues/765#issuecomment-39845879>

    Find does not take none! as an argument. In Rebol2, you would get this message:
    
    ```
    >> find none 'a
    ** Script Error: find expected series argument of type: series object port bitset
    ** Near: find none 'a
    ```
    
    The current console, as has been pointed out, is not error tolerant.

--------------------------------------------------------------------------------

On 2014-04-08T13:25:12Z, WayneCui, commented:
<https://github.com/red/red/issues/765#issuecomment-39846671>

    Rebol3 supports it, and in Red:
    
    ```
    >> ? find
    ARGUMENTS:
        series [series! none!]
        value [any-type!]
    
    ```
    
    So, should this works after proper error management was implemented?

