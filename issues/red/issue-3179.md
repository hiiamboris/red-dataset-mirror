
#3179: OP! accepts get/literal arguments, but doesn't work with them as expected
================================================================================
Issue is closed, was reported by 9214 and has 8 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/3179>

### Expected behavior
`op!` behaves the same as its function counterpart.
### Actual behavior
While get/literal arguments syntax is accepted in `op!`'s specification, they're not recognized as such during usage.
### Steps to reproduce the problem
```Red
>> ?? is
is: make op! [[
    {Defines a reactive relation whose result is assigned to a word} 
    'field [set-word!] {Set-word which will get set to the result of the reaction} 
    reaction [block!] "Reactive relation" 
    /local words obj rule item
]]
```
You can see that `is` is an operator and supports literal argument `'field`. However, attempt to apply user-defined `op!` with get (or literal) argument results in:
```Red
>> test: func [:x y][append form :x y]
== func [:x y][append form :x y]
>> test abracadabra 1
== "abracadabra1"
>> test: make op! :test
== make op! [[:x y]]
>> abracadabra test 1
*** Script Error: abracadabra has no value
*** Where: test
*** Stack:
```
### Red version and build date, operating system with version.
This bug (?) is an old one, previously I thought that it's just a design decision, but since `is` supports such syntax and works as expected, I guess it should at least be reviewed (or considered as a wish :wink:)
```Red
>> about
Red for Windows version 0.6.3 built 28-Dec-2017/14:17:05+05:00
```


Comments:
--------------------------------------------------------------------------------

On 2018-03-09T17:28:54Z, greggirwin, commented:
<https://github.com/red/red/issues/3179#issuecomment-371882915>

    See also: https://github.com/red/red/issues/3250

--------------------------------------------------------------------------------

On 2018-03-20T11:24:10Z, 9214, commented:
<https://github.com/red/red/issues/3179#issuecomment-374563055>

    @dockimbel Unfortunately, it doesn't work quite well :confused: (unless I misunderstand how operators should work in such cases).
    ```Red
    >> test: make op! func [:x :y][append form :x form :y]
    == make op! [[:x :y]]
    >> abra test 1
    == "abra1"
    >> abra test cadabra
    *** Script Error: cadabra has no value
    *** Where: test
    *** Stack: 
    ```
    
    I know that `op!`s have short left scope but width right scope, but is that :point_up: expected behavior?

--------------------------------------------------------------------------------

On 2021-05-28T16:05:16Z, hiiamboris, commented:
<https://github.com/red/red/issues/3179#issuecomment-850520491>

    Still not working:
    ```
    >> ab/ra test cadabra
    *** Script Error: ab has no value
    *** Where: test
    *** Stack:  
    
    >> ab/ra: test cadabra
    *** Script Error: test operator is missing an argument
    *** Where: set-path
    *** Stack:  
    
    >> (1 + 2) test cadabra
    == "3cadabra"       ;) expected "1 + 2cadabra"
    ```
    Path examples above should also work for lit-args (they don't).

--------------------------------------------------------------------------------

On 2023-06-26T15:21:04Z, hiiamboris, commented:
<https://github.com/red/red/issues/3179#issuecomment-1607710287>

    Support for left get/lit-arg is [not planned](https://github.com/red/red/issues/5341#issuecomment-1607626539).

