
#3482: indexing with path notation evaluates ANY-FUNCTION!, but not an OP!
================================================================================
Issue is open, was reported by 9214 and has 10 comment(s).
[type.design]
<https://github.com/red/red/issues/3482>

### Expected behavior
Indexing with path notation evaluates all `any-function!` values. Indexing with `pick` and similar functions doesn't trigger any of them.

### Actual behavior
Path notation works as expected for all `any-function!` values, except for `op!`:

```red
>> block: reduce [:add :+]
== [make action! [[
    "Returns the sum of the two values" 
    value1 [number! char! pair! tuple! vector! time! date!] 
    value2 [number! char! pair!...
>> block/1
*** Script Error: block/1 is missing its value1 argument
*** Where: catch
*** Stack:  

>> block/2
== make op! [[
    "Returns the sum of the two values" 
    value1 [number! char! pair! tuple! vector! time! date!] 
    value2 [number! char! pair! tupl...
>> pick block 1
== make action! [[
    "Returns the sum of the two values" 
    value1 [number! char! pair! tuple! vector! time! date!] 
    value2 [number! char! pair! ...
>> pick block 2
== make op! [[
    "Returns the sum of the two values" 
    value1 [number! char! pair! tuple! vector! time! date!] 
    value2 [number! char! pair! tupl...
```

### Steps to reproduce the problem
Examine code snippet above.
### Red and platform version
Latest, W10.

```
Red 0.6.3 for Windows built 20-Jul-2018/7:47:36+05:00 commit #c5a2921
```


Comments:
--------------------------------------------------------------------------------

On 2018-07-23T19:56:08Z, meijeru, commented:
<https://github.com/red/red/issues/3482#issuecomment-407181015>

    The same issue applies to selection by path notation with a "key" vs. the use of `select`.

--------------------------------------------------------------------------------

On 2018-07-23T20:06:11Z, 9214, commented:
<https://github.com/red/red/issues/3482#issuecomment-407183875>

    @meijeru good point!

--------------------------------------------------------------------------------

On 2019-04-10T16:07:25Z, nd9600, commented:
<https://github.com/red/red/issues/3482#issuecomment-481755361>

    I think at least part of the problem (in the compiler) seems to be that [the bit that checks if the program counter is at an infix operator](https://github.com/red/red/blob/master/compiler.r#L1082) thinks all `op!s` are `word!s`, though it's not as simple as also checking if it's a `path!` instead:
     - in the next line, it tries to find the spec of the function using the whole path, but it's in `'functions` indexed by the end of the `path!` (or the second section, I'm not sure), so `specs: select functions pos/1` would need to be `specs: select functions either (path? pos/1) [back tail pos/1] [pos/1]`
    -  [when it tries to process the `op!`](https://github.com/red/red/blob/master/compiler.r#L3852), it again thinks its a `word!` rather than a `path!` when emitting an open frame, so that doesn't work either.

--------------------------------------------------------------------------------

On 2019-05-28T16:53:55Z, nd9600, commented:
<https://github.com/red/red/issues/3482#issuecomment-496599773>

    I think I've fixed this for objects (with the compiler) in https://github.com/red/red/compare/master...nd9600:master - objects and blocks in the interpreter next.
    Obviously I'll need to squash all those to 1 commit before making a PR

--------------------------------------------------------------------------------

On 2019-05-28T18:00:38Z, greggirwin, commented:
<https://github.com/red/red/issues/3482#issuecomment-496624453>

    Thanks for digging in @nd9600! I'm sure the Deep Red team will review it in detail as soon as you're ready.

