
#4540: ANY-FUNCTION!s are always compared by identity
================================================================================
Issue is open, was reported by 9214 and has 4 comment(s).
[type.design]
<https://github.com/red/red/issues/4540>

**Describe the bug**
Red has 3 types of comparison differing by strictness: lax comparison (default), strict comparison and identity comparison.

`any-function!` values are always compared by identity, regardless of the comparison operator being used.

**To reproduce**
```red
>> foo: does []
== func [][]
>> equal? foo does []
== false
>> equal? foo foo
== true
```

`function!` and `routine!` have their `more` nodes compared, while `op!`, `action!` and `native!` are compared by `code` fields.

https://github.com/red/red/blob/2142264a57ff0bae2384a20e465ad68d47845761/runtime/datatypes/function.reds#L1057

https://github.com/red/red/blob/2142264a57ff0bae2384a20e465ad68d47845761/runtime/datatypes/routine.reds#L167

https://github.com/red/red/blob/2142264a57ff0bae2384a20e465ad68d47845761/runtime/datatypes/op.reds#L199

https://github.com/red/red/blob/2142264a57ff0bae2384a20e465ad68d47845761/runtime/datatypes/action.reds#L113

https://github.com/red/red/blob/2142264a57ff0bae2384a20e465ad68d47845761/runtime/datatypes/native.reds#L271

**Expected behavior**
Both R2 and R3 exhibit the same behavior, so this at least should be documented.

Naive lax comparison can be defined in terms of comparison of spec and body blocks (i.e. implementation), strict comparison can check datatypes on top of it.

Operational comparison (i.e. behavior) is infeasible since one needs to compare domains and ranges of both functions.

**Platform version**
2142264a



Comments:
--------------------------------------------------------------------------------

On 2020-06-27T12:55:24Z, hiiamboris, commented:
<https://github.com/red/red/issues/4540#issuecomment-650557828>

    This became an issue for me recently as well.
    I need to loosely compare two objects, holding the results of View tests. That includes images. Images I store in PNG format because that requires way less RAM: `obj/image: does [load/as #{..} 'png]`. Alas, `obj1 = obj2` doesn't work even if `obj1/image = obj2/image` and function bodies are equal too.

--------------------------------------------------------------------------------

On 2020-08-04T13:44:10Z, 9214, commented:
<https://github.com/red/red/issues/4540#issuecomment-668604893>

    Comparison semantics across the entire language need a dedicated sweep: https://github.com/red/red/issues/4165 https://github.com/red/red/issues/2650 https://github.com/red/red/issues/4092 https://github.com/red/red/issues/4327 #4456 

