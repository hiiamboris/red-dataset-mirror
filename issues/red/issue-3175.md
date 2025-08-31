
#3175: WISH: "dynamic" refinements
================================================================================
Issue is closed, was reported by 9214 and has 20 comment(s).
[type.task.wish]
<https://github.com/red/red/issues/3175>

Currently we write something like
```Red
either bar [foo][foo/baz]
```

I wish `refinement!` could also support (akin to `path!`s)
```Red
foo/(if bar ['baz])
```
which could also be chained to form full pack of refinements (i.e. `foo/(...)/(...)/(...)`). I have doubts that current compiler can support that, but when it comes to JIT, if there aren't any technical trade-offs for such syntax, why not?


Comments:
--------------------------------------------------------------------------------

On 2017-12-28T12:30:14Z, x8x, commented:
<https://github.com/red/red/issues/3175#issuecomment-354281265>

    @9214 Something like that would be useful.
    How would you menage if `/baz` need more arguments ?
    ```
    foo/(if bar ['baz arg1 arg2])
    ```
    Better idea?

--------------------------------------------------------------------------------

On 2017-12-28T12:52:56Z, 9214, commented:
<https://github.com/red/red/issues/3175#issuecomment-354283945>

    @x8x good point, although you can just
    ```Red
    foo/(if bar ['baz]) arg1 arg2
    ```
    If `foo` needs one argument, it will take just `arg1`, but if `foo/baz` requires two, it will take both.

--------------------------------------------------------------------------------

On 2017-12-28T15:45:14Z, x8x, commented:
<https://github.com/red/red/issues/3175#issuecomment-354308282>

    @9214 That way would break chainability:
    ```red
      a: pick sort/(if true ['part]) [4 3 2 1] 4 1 a
    ;   1
      a: pick sort/(if false ['part]) [4 3 2 1] 4 1 a
    ;   4
    ```
    Expected result would be `1` for both cases.

--------------------------------------------------------------------------------

On 2017-12-28T16:28:46Z, 9214, commented:
<https://github.com/red/red/issues/3175#issuecomment-354315439>

    @x8x indeed, totally missed that out. It seems that proposed feature is not that useful though :confused: 

--------------------------------------------------------------------------------

On 2017-12-28T19:23:31Z, greggirwin, commented:
<https://github.com/red/red/issues/3175#issuecomment-354343000>

    I think we'll get this covered in other ways. e.g. the `specialize` func that floated around, I have various `refine` mezz ideas out there, `apply` of some kind. We can chat on gitter, and if those cover this need, we can close this ticket.

--------------------------------------------------------------------------------

On 2018-03-15T13:01:29Z, dockimbel, commented:
<https://github.com/red/red/issues/3175#issuecomment-373367823>

    You can already achieve something similar with regular code:
    ```
    bar: true
    foo: func [/baz][either baz [2][1]]
    
    do append to-path 'foo (if bar ['baz])
    == 2
    ```
    
    Given how overloaded are `path!` semantics already, it is unlikely that we will introduce some other syntactic sugar for paths. Actually, desugaring is rather on the table, like limitating the parens support in path (which is syntactly inconsistent already).

--------------------------------------------------------------------------------

On 2018-03-15T15:05:46Z, DideC, commented:
<https://github.com/red/red/issues/3175#issuecomment-373408258>

    @dockimbel this code error out if:
    ```
    bar: false
    foo: func [/baz][either baz [2][1]]
    
    do append to-path 'foo (if bar ['baz])
    *** Script Error: foo has no refinement called none
    ```
    How do you handle this case simply?

--------------------------------------------------------------------------------

On 2018-03-15T15:08:15Z, 9214, commented:
<https://github.com/red/red/issues/3175#issuecomment-373409183>

    :neckbeard: 
    ```red
    >> do to path! trim compose [foo a (if no ['b])]
    == 2
    >> do to path! trim compose [foo a (if yes ['b])]
    == 1
    >> :foo
    == func [/a /b][either all [a b] [1] [2]]
    ```

--------------------------------------------------------------------------------

On 2018-03-16T06:33:24Z, greggirwin, commented:
<https://github.com/red/red/issues/3175#issuecomment-373616633>

    What is the concrete use case for this original wish? I imagine it will get as ugly as the alternative, and maybe moreso. If we decide to remove paren! support from paths, it also goes away as a possibility.
    ```
    foo/(if bar ['baz])/(if bax ['bip])/(if bim ['bok])
    ```
    Let's find a concrete use case and compare this wish against `specialize/refine/apply` approaches, and see which looks better. Overloading the syntax this way also seems like we're working against the language.

--------------------------------------------------------------------------------

On 2018-05-17T09:27:47Z, nedzadarek, commented:
<https://github.com/red/red/issues/3175#issuecomment-389804567>

    As for syntax of it: 
    Why not just `foo/(bar baz)/(bax bip)/(bim bok)` instead of `foo/(if bar ['baz])/(if bax ['bip])/(if bim ['bok])`?

