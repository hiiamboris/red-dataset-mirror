
#35: Infix operator in compound expression crashes compiler
================================================================================
Issue is closed, was reported by meijeru and has 10 comment(s).
[status.tested]
<https://github.com/red/red/issues/35>

The following code

```
myand: func [[infix] a [integer!] b [integer!]][a and b]
17 myand 13 + 1
```

crashes the compiler with error:

```
** Script Error: size-of? expected type argument of type: word
** Where: set-width
** Near: width: emitter/size-of? either type [operand]
```



Comments:
--------------------------------------------------------------------------------

On 2011-05-15T19:27:50Z, dockimbel, commented:
<https://github.com/red/red/issues/35#issuecomment-1167072>

    This issue can be workaround by specifying a return value in 'myand definition. Currently the implementation requires that infix functions have a return type, I need to check the code to see if this dependency can be removed or if I need to add it to the specification draft.

--------------------------------------------------------------------------------

On 2011-05-16T06:15:38Z, meijeru, commented:
<https://github.com/red/red/issues/35#issuecomment-1171748>

    That workaround has itself a problem: the infix function may be polymorphic! At least 'myand is, since it is a copy of 'and. Are you planning to allow more than one type in argument and return specs? 

--------------------------------------------------------------------------------

On 2011-05-17T15:55:45Z, dockimbel, commented:
<https://github.com/red/red/issues/35#issuecomment-1191221>

    `myand' is part of an expression where it will be evaluated first (expressions are reduced from left to right reduction), so it requires parens on his right expression argument, else a compilation error will occur:
    
    With parens:
    `17 myand (13 + 1)`, it is reduced to the prefix form: `myand 17 + 13 1`
    
    Without parens:
    `17 myand 13 + 1`, it is reduce to the prefix form: `+ myand 17 13 1`
    
    `*** Compilation Error: return type missing in function: myand
    *** in: %tests/test.reds
    *** at:  [myand
        17 13 1
    ]`

--------------------------------------------------------------------------------

On 2011-05-18T12:32:10Z, meijeru, commented:
<https://github.com/red/red/issues/35#issuecomment-1196602>

    I fail to see what is wrong with + myand 17 13 1 ! Since myand has two arguments, 17 and 13, it will yield an integer that can be added to 1 by +.

--------------------------------------------------------------------------------

On 2011-05-18T12:38:34Z, dockimbel, commented:
<https://github.com/red/red/issues/35#issuecomment-1196635>

    It is not allowed to yield any value without a proper [return:] declaration in the function specification block. In my examples, in both cases, I have used your function declaration (so without any [return:] declaration).
    
    In the "with parens" example, 'myand doesn't need to return anything as it is the root of the expression, so the compiler let it pass. In the "without parens" example, 'myand needs to return a value to be used as argument for '+ operator, in contradiction to 'myand specification block, so the compiler raises an error.

