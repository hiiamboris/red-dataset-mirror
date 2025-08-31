
#2181: Unexpectable return on getting object function using object/(some expression).
================================================================================
Issue is closed, was reported by ifgem and has 6 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2181>

Same: 

```
monkey: make object! [
    hp: 100 
    eat: func [] [
         print "tasty"
         return "done"
    ]
]
```

Rebol2, Rebol3:

```
monkey/('eat)
tasty
== "done"

monkey/('hp)
== 100
```

Red:

```
monkey/('eat)
tasty
== eat ;(eat has no value)

monkey/('hp)
== 100 ; works as expected.
```



Comments:
--------------------------------------------------------------------------------

On 2018-03-26T11:11:20Z, nedzadarek, commented:
<https://github.com/red/red/issues/2181#issuecomment-376130241>

    Surrounding `obj/(fun)` expression with parens works: `foo: (monkey/('eat))`.
    The same bug (and the same fix as above) is with `map!`.

--------------------------------------------------------------------------------

On 2018-03-26T11:57:39Z, dockimbel, commented:
<https://github.com/red/red/issues/2181#issuecomment-376140793>

    The issue seems to have been fixed since a while:
    ```
    --== Red 0.6.3 ==-- 
    Type HELP for starting information. 
    
    >> monkey: make object! [
    [        hp: 100 
    [        eat: func [] [
    [             print "tasty"
    [             return "done"
    [        ]
    [    ]
    == make object! [
        hp: 100
        eat: func [][
            print "tasty" 
            re...
    >> monkey/('eat)
    tasty
    == "done"
    >> monkey/('hp)
    == 100
    ```

--------------------------------------------------------------------------------

On 2018-03-27T10:43:57Z, nedzadarek, commented:
<https://github.com/red/red/issues/2181#issuecomment-376479877>

    @dockimbel it's seems that certain sequence causes this bug ( https://gitter.im/red/bugs?at=5ab98024c574b1aa3e36bd0c ):
    ```
    monkey: make object! [
            hp: 100 
            eat: func [] [
                 print "tasty"
                 return "done"
            ]
    ]
    monkey/('hp)
    ; == 100
    h: monkey/('hp)
    ; == 100
    h
    ; == 100
    
    ; current behaviour:
    a: monkey/('eat)
    ; tasty
    ; == eat
    a
    ; == eat
    
    ; expected behaviour (should work without outer paren!):
    a: (monkey/('eat))
    ; tasty
    ; == "done"
    a
    ; == "done"
    ```

