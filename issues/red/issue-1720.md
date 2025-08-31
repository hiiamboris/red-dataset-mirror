
#1720: Console crashes when `compose` used with `url!` as an argument to `write`
================================================================================
Issue is closed, was reported by ghost and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1720>

```
red>> write http://abc.com compose []
*** Internal error: reserved for future use (or not yet implemented)
*** Where: write
```

But

```
red>> write http://abc.com compose [ {} {} ]
```

gives (in debug mode) -

```

*** Runtime Error 1: access violation
*** in file: /C/Users/ABC/Desktop/red/environment/console/datatypes/symbol.reds
*** at line: 137
***
***   stack: red/symbol/resolve 3514672
***   stack: red/url/write 027C3B90h 027C3BA0h false false false false 027C3B80h 027C3B80h 027C3B80h 027C3B80h ***   stack: red/actions/write 027C3B90h 027C3BA0h false false false false 027C3B80h 027C3B80h 027C3B80h 027C3B80h
***   stack: red/actions/write* -1 -1 -1 -1 -1 -1 -1 -1
***   stack: red/interpreter/eval-arguments 0285B310h 0287C828h 0287C828h 00000000h 00000000h
***   stack: red/interpreter/eval-code 0285B310h 0287C7F8h 0287C828h false 00000000h 00000000h 0285B310h
***   stack: red/interpreter/eval-expression 0287C7F8h 0287C828h false false
***   stack: red/interpreter/eval 027C3B80h true
***   stack: red/natives/do* false -1
***   stack: red/interpreter/eval-arguments 0285B4D0h 0284EEB0h 0284EEB0h 00000000h 00000000h
***   stack: red/interpreter/eval-code 0285B4D0h 0284EEA0h 0284EEB0h true 00000000h 00000000h 0285B4D0h
***   stack: red/interpreter/eval-expression 0284EEA0h 0284EEB0h false true
***   stack: red/interpreter/eval-arguments 0285AA70h 0284EE90h 0284EEB0h 0284EE70h 0284EEC4h
***   stack: red/interpreter/eval-code 0285AA70h 0284EE80h 0284EEB0h true 0284EE70h 0284EEC4h 0285AA70h
***   stack: red/interpreter/eval-path 0284EE70h 0284EE80h 0284EEB0h false false false false
***   stack: red/interpreter/eval-expression 0284EE80h 0284EEB0h false false
***   stack: red/interpreter/eval 027C3B50h true
***   stack: red/natives/catch* true 1
***   stack: ctx253~try-do 0035CE0Ch
***   stack: red/_function/call 0283914Ch 0035CE0Ch
***   stack: red/interpreter/eval-code 0283914Ch 0284F574h 0284F5C4h true 00000000h 00000000h 0283914Ch
***   stack: red/interpreter/eval-expression 0284F564h 0284F5C4h false true
***   stack: red/interpreter/eval-arguments 0285AA70h 0284F554h 0284F5C4h 0284F534h 0284F5D8h
***   stack: red/interpreter/eval-code 0285AA70h 0284F544h 0284F5C4h true 0284F534h 0284F5D8h 0285AA70h
***   stack: red/interpreter/eval-path 0284F534h 0284F544h 0284F5C4h false false false false
***   stack: red/interpreter/eval-expression 0284F544h 0284F5C4h false false
***   stack: red/interpreter/eval 027C3AD0h true
***   stack: red/natives/unless* false
***   stack: red/interpreter/eval-arguments 0285B370h 0284F410h 0284F430h 00000000h 00000000h
***   stack: red/interpreter/eval-code 0285B370h 0284F3E0h 0284F430h false 00000000h 00000000h 0285B370h
***   stack: red/interpreter/eval-expression 0284F3E0h 0284F430h false false
***   stack: red/interpreter/eval 027C3AB0h true
***   stack: red/natives/do* true -1
***   stack: ctx253~eval-command 0035CE0Ch
***   stack: ctx253~run 0035CE0Ch
***   stack: ctx253~launch 0035CE0Ch
```



Comments:
--------------------------------------------------------------------------------

On 2016-09-21T11:56:53Z, rebolek, commented:
<https://github.com/red/red/issues/1720#issuecomment-248589851>

    @qtxie, @dockimbel please take a look at this, it should be reopened IMO as it crashes still. Tested both with interpreter and compiler, same behaviour.

--------------------------------------------------------------------------------

On 2016-09-21T12:01:24Z, qtxie, commented:
<https://github.com/red/red/issues/1720#issuecomment-248590777>

    Yes. Seems we have some regressions on master branch.

--------------------------------------------------------------------------------

On 2016-09-21T12:12:49Z, rebolek, commented:
<https://github.com/red/red/issues/1720#issuecomment-248593131>

    I’m hunting them ;)

