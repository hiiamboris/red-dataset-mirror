
#2657: Inconsistency in comparing object with error
================================================================================
Issue is closed, was reported by meijeru and has 12 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2657>

```
>> e: try [1 / 0]
*** Math Error: attempt to divide by zero
*** Where: /
>> o: context?  in e 'id
== make object! [
    code: none
    type: 'math
    id: 'zero-divide
    arg1: ...
>> e = o
== true
>> o = e
== false
```



Comments:
--------------------------------------------------------------------------------

On 2018-11-16T21:47:00Z, meijeru, commented:
<https://github.com/red/red/issues/2657#issuecomment-439539249>

    The `false` result is the correct one. BTW in the above example also `e == o` yields `true` which it shouldn't.

--------------------------------------------------------------------------------

On 2018-11-17T20:06:44Z, endo64, commented:
<https://github.com/red/red/issues/2657#issuecomment-439644045>

    @meijeru Why `false` is the correct one?

--------------------------------------------------------------------------------

On 2018-11-18T09:33:11Z, meijeru, commented:
<https://github.com/red/red/issues/2657#issuecomment-439679402>

    I thought so at the time. Meanwhile I am convinced that `=` should give true in both directions, and that `==` should give false (`==`  requires equality of types).

--------------------------------------------------------------------------------

On 2019-01-23T11:05:02Z, hiiamboris, commented:
<https://github.com/red/red/issues/2657#issuecomment-456761313>

    It's crazier even:
    ```
    >> o = e
    == false
    >> e = o
    == true
    >> e == o
    == true
    >> o == e
    == false
    
    >> f: e
    >> f = e
    == false
    >> e = f
    == false
    >> e == f
    == false
    >> f == e
    == false
    ```
    `Red 0.6.4 for Windows built 11-Jan-2019/5:18:27+03:00 commit #5e37a10`

--------------------------------------------------------------------------------

On 2019-01-23T18:32:26Z, greggirwin, commented:
<https://github.com/red/red/issues/2657#issuecomment-456915387>

    It's because error inherits object's comparison action, and that checks if the right hand side is TYPE_OBJECT, so it will always fail if an error is on the right. There is currently no `#define ANY_OBJECT?(type)` def in %macros.reds, or `#define TYPE_ANY_OBJECT`, to match others. It also looks like `#define ANY_LIST(type)	[` should have a `?` at the end of `ANY_LIST`, which may necessitate other changes.

--------------------------------------------------------------------------------

On 2019-08-15T20:20:43Z, dockimbel, commented:
<https://github.com/red/red/issues/2657#issuecomment-521783071>

    It will now return `false` for the `o = e` and `o == e`, so no loose comparison allowed. Supporting a loose mode would require significantly more code for all the combinations, as it needs to include other object-like types (like `port!`  and maybe others to come). Moreover, the nature of `object!` might change before 1.0, so that it will affect other object-like types and how they relate to each-others.

