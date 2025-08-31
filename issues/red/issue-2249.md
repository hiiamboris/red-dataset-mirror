
#2249: `in` object accepts block! for its word argument.. why?
================================================================================
Issue is closed, was reported by geekyi and has 4 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/2249>

Rebol2 doesn't accept `block!` for the `word` argument, but Red and Rebol3 does.

```
red>> ? in

USAGE:
    in object word
ARGUMENTS:
     object  [any-object!]
     word  [any-word! block! paren!]
```

But this doesn't work as expected:

``` rebol
obj: make object! [a: 10 b: 20 c: 30]
in obj [a c]
print in obj [a c]
```
### Rebol3

works as opposite(?) of `bind`:

``` rebol
== [a c]
10 30
```
### Red

looks like it's not implemented yet? :

``` red
== make object! [
    a: 10
    b: 20
    c: 30
]
a: 10
b: 20
c: 30
```

_Question is, what's the intent? To follow Rebol3's behaviour?_
For context: http://stackoverflow.com/questions/21059228/how-to-use-in-with-a-block-instead-of-an-object#comment66915731_21059228



Comments:
--------------------------------------------------------------------------------

On 2016-10-02T10:15:40Z, dockimbel, commented:
<https://github.com/red/red/issues/2249#issuecomment-250964035>

    That feature implementation was deferred, in order first to examine its usefulness, as it overlaps with `bind`:
    
    ```
    obj: make object! [a: 10 b: 20 c: 30]
    print bind [a c] obj
    
    10 30
    ```

--------------------------------------------------------------------------------

On 2017-02-21T09:35:22Z, dockimbel, commented:
<https://github.com/red/red/issues/2249#issuecomment-281291551>

    As `bind` is already covering most of the binding needs, `in` is kept as a single-word quick binding function, with the added benefit of returning `none` if the word is not defined in the target context. The block/paren types for second argument will be removed.

