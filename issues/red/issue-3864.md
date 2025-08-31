
#3864: access violation on a specific pattern of function application
================================================================================
Issue is closed, was reported by 9214 and has 16 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3864>

**Describe the bug**
`function!` that accepts quoted `op!`s and returns `scalar!` (with exception of `date!`), if applied with `do reduce [<function> <quoted words>]` construct, results in access violation.

**To reproduce**
```red
f: func [:a :b][1] do reduce [:f '+ '-]
```
Yields:
```red
*** Runtime Error 1: access violation
*** at: 004304F1h
```

Stack trace from debugging console:
```red
*** Runtime Error 1: access violation
*** in file: .../runtime/datatypes/string.reds
*** at line: 1045
***
***   stack: red/string/concatenate-literal-part 028603F4h 00779000h 1350576
***   stack: red/datatype/mold 02C5A898h 028603F4h false false true 00000000h 0 0
***   stack: red/actions/mold 02C5A898h 028603F4h false false true 00000000h 0 0
***   stack: red/error/reduce 028603D4h 029808CCh
***   stack: red/error/form 029808CCh 028603C4h 028603A4h -18
***   stack: red/actions/form 029808CCh 028603C4h 028603A4h 0
***   stack: red/block/form 028603B4h 028603C4h 028603A4h 0
***   stack: red/actions/form 028603B4h 028603C4h 028603A4h 0
***   stack: red/actions/form* -1
***   stack: red/natives/prin* true
***   stack: red/natives/print* true
***   stack: ctx475~do-command 027D1BC4h
***   stack: ctx475~eval-command 027D1BC4h
***   stack: ctx475~run 027D1BC4h
***   stack: ctx475~launch 027D1BC4h
```

Also (note the weird error messages):
```red
>> do reduce [func [:a :b :c][1] '+ '- '*]
*** Script Error: object!: needs a value
*** Where: object!
*** Stack:  

>> do reduce [func [:a :b][1] '+ '-]
*** Script Error: + does not allow none! for its value2 argument
*** Where: +
*** Stack:  

>> do reduce [func [:a][1] '+]
*** Script Error: + operator is missing an argument
*** Where: do
*** Stack:
```


**Expected behavior**
I expect such function application to behave like in common-case scenario:
```red
>> f: func [:a :b][1] f + -
== 1      
```

**Platform version (please complete the following information)**
Latest.



Comments:
--------------------------------------------------------------------------------

On 2019-05-14T11:28:58Z, dockimbel, commented:
<https://github.com/red/red/issues/3864#issuecomment-492198787>

    > I expect such function application to behave like in common-case scenario
    
    It does not behave like that, as infix operators have precedence over operands evaluation, so you'll necessarily get a "operator is missing an argument" error.

--------------------------------------------------------------------------------

On 2019-05-14T12:22:23Z, dockimbel, commented:
<https://github.com/red/red/issues/3864#issuecomment-492214551>

    The crash is fixed and now those patterns will consistently produce an "operator is missing an argument" error.

--------------------------------------------------------------------------------

On 2019-05-14T14:11:10Z, 9214, commented:
<https://github.com/red/red/issues/3864#issuecomment-492254251>

    > It does not behave like that
    
    Code snippet in my example tells me the opposite. `+` and `-` are quoted and safely passed to `f`, as expected.

--------------------------------------------------------------------------------

On 2019-05-14T14:15:51Z, dockimbel, commented:
<https://github.com/red/red/issues/3864#issuecomment-492256184>

    @9214 The `+` and `-` words are passed to `f` but the corresponding ops are already on the call stack before `f` is evaluated (because infix ops _really_ do take precedence), so that when `f` returns, a left operand is provided, but the right operand is still missing.

--------------------------------------------------------------------------------

On 2019-05-14T14:23:44Z, 9214, commented:
<https://github.com/red/red/issues/3864#issuecomment-492259539>

    @dockimbel I see. This ticket ties with https://github.com/red/red/issues/3840.

--------------------------------------------------------------------------------

On 2019-05-14T15:00:50Z, 9214, commented:
<https://github.com/red/red/issues/3864#issuecomment-492275702>

    I've checked the fresh build:
    ```red
    >> f: func [:a :b][1] do reduce [:f '+ '-]
    *** Script Error: + operator is missing an argument
    *** Where: +
    *** Stack:  
    
    >> f + -
    == 1
    ```
    
    I'm not sure I agree. This difference either should be properly documented or changed to consistent behavior. Why `+` errors out in the former case but gets quoted in the latter? Logically it's the same function application.

--------------------------------------------------------------------------------

On 2019-05-14T21:00:05Z, greggirwin, commented:
<https://github.com/red/red/issues/3864#issuecomment-492407702>

    @9214 add it to your Guru Docs / articles to-do list. :^)

--------------------------------------------------------------------------------

On 2019-05-15T21:46:58Z, dockimbel, commented:
<https://github.com/red/red/issues/3864#issuecomment-492835900>

    @9214 Good catch. It can be improved for that case, but handling a path call (#3585) is still beyond reach.

