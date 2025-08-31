
#1127: Console: Weird behaviours and crashes when redefining action! used by console
================================================================================
Issue is closed, was reported by x8x and has 8 comment(s).
[status.resolved]
<https://github.com/red/red/issues/1127>

executing following code in the console:

``` rebol
]
trim: func [a /head][
    c: func [d][]
    head
    a
]
]
```

returns:

``` rebol
red>> ]
*** Syntax error: missing [ at ]
*** Where: do
red>> trim: func [a /head][
[     c: func [d][]
[     head
[     a
[    ]
== func [a /head][c: func [d] [] head a]
red>> ]

*** Runtime Error 1: access violation
*** at: 0001FCACh
```



Comments:
--------------------------------------------------------------------------------

On 2015-04-27T20:05:44Z, x8x, commented:
<https://github.com/red/red/issues/1127#issuecomment-96799393>

    no crash but wierd:
    
    ``` rebol
      % red
    --== Red 0.5.3 ==-- 
    Type HELP for starting information. 
    
    red>> ]
    *** Syntax error: missing [ at ]
    *** Where: do
    red>> trim: does []
    == func [][]
    red>> ]
    *** Script error: arg1 has no value
    *** Where: arg1
    red>> 
    ```
    
    ``` rebol
      % red
    --== Red 0.5.3 ==-- 
    Type HELP for starting information. 
    
    red>> trim: does []
    == func [][]
    red>> ]
    *** Script error: trim has no refinement called trim
    *** Where: trim
    red>> 
    ```

--------------------------------------------------------------------------------

On 2015-04-27T20:27:30Z, x8x, commented:
<https://github.com/red/red/issues/1127#issuecomment-96807789>

    btw,
    
    ``` rebol
    red>> source trim
    Sorry, trim is a action! so no source is available
    ```
    
    should be either
    `Sorry, trim is an action! so no source is available`
    or
    `Sorry, trim is a value of type action! so no source is available`
    or
    `Sorry, no source available for trim of type action!`

--------------------------------------------------------------------------------

On 2015-04-28T02:33:31Z, dockimbel, commented:
<https://github.com/red/red/issues/1127#issuecomment-96888991>

    Fixed the error message:
    
    ```
    red>> source append
    Sorry, append is an action! so no source is available
    red>> source +
    Sorry, + is an op! so no source is available
    red>> source equal?
    Sorry, equal? is a native! so no source is available
    ```

--------------------------------------------------------------------------------

On 2015-04-28T02:35:55Z, dockimbel, commented:
<https://github.com/red/red/issues/1127#issuecomment-96889243>

    About the "weird crashes", they happen because you redefine an action! of the Red language which is used internally by the console code. You are allowed to do that, but **_at your own risks_**. ;-) 
    
    We will have a protection system for words in the future, to protect by default users to shoot themselves in the foot and increase security when loading untrusted code.

