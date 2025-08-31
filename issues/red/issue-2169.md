
#2169: Let `copy` accept `any-type!`
================================================================================
Issue is closed, was reported by WiseGenius and has 6 comment(s).
[status.dismissed] [type.wish]
<https://github.com/red/red/issues/2169>

Current behaviour:

```
red>> foreach item ["a" [b] 3] [x: copy item ?? x]
x: "a"
x: [b]
*** Script Error: copy does not allow integer! for its value argument
*** Where: copy
```

Desired behaviour:

```
red>> foreach item ["a" [b] 3] [x: copy item ?? x]
x: "a"
x: [b]
x: 3
```

I see no reason for `x: copy 3` to error for not being `x: 3` which would have copied the value anyway. Why should redundancy cause an error?
Why the arbitrary requirement to check the type before attempting to copy? Just to avoid error, the above example would currently need to be rewritten as something like:

```
red>> foreach item ["a" [b] 3] [either find [series! any-object! bitset! map!] type?/word item [x: copy item][x: item] ?? x]
x: "a"
x: [b]
x: 3
```

`copy/deep` should not error in such cases either.
What `copy/part` should do, however, is a different matter.



Comments:
--------------------------------------------------------------------------------

On 2016-08-11T19:25:46Z, meijeru, commented:
<https://github.com/red/red/issues/2169#issuecomment-239264875>

    Quote `x: 3` _which would have copied the value anyway_ Unquote. I don't think this is a correct description of the semantics of the expression `x: 3`. What goes on is _binding_ and not copying. That is precisely the reason why copying is only relevant for a composite value which is represented internally _by reference_. 

--------------------------------------------------------------------------------

On 2016-08-11T22:01:00Z, greggirwin, commented:
<https://github.com/red/red/issues/2169#issuecomment-239306800>

    I don't think the type requirement is arbitrary. 
    
    What other functions do we have that are treated as no-ops when applied to a type where they don't make sense? `To` is a no-op if the type is already the same, though that may not be guaranteed.
    
    We could also ask: What makes `copy` special? Should `head`, `tail`, and others also act as pass-thru operations? If `copy` does, it works for your simple example, but chaining a `tail` in front of it won't work.

--------------------------------------------------------------------------------

On 2017-02-20T08:10:10Z, dockimbel, commented:
<https://github.com/red/red/issues/2169#issuecomment-281012889>

    @meijeru has a good point, setting a word to a value is a *binding* not a *copying* operation.
    
    Moreover, the purpose of `copy` is to duplicate a series (later extended to other kind of composite types like `object!` or `map!`) because series (like other composite types) have a buffer (or several) which is shared between all references to the same series. This kind of operation makes no sense for scalar values (integers, floats, etc...). Making `copy` a pass-thru for all types would IMO just confuse users even more about its purpose, and remove a useful type-checking opportunity, resulting in harder to find bugs (because the type mismatch would be postponed to a later place in the code).
    
    For your code above, if you are concerned about its shortness, it could be written like this:
    ```
    red>> composite!: union series! union any-object! make typeset! [bitset! map!]
    red>> composite?: func [value][to logic! find composite! type? value]
    red>> foreach item ["a" [b] 3] [x: either composite? item [copy item][item] ?? x]
    ```

