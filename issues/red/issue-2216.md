
#2216: Adding a number to a vector changes the vector itself
================================================================================
Issue is open, was reported by meijeru and has 22 comment(s).
[type.review] [type.design]
<https://github.com/red/red/issues/2216>

See this fragment:

```
v: make vector! [1.0 2.0 3.0]
v + 1.0 ; => make vector! [2.0 3.0 4.0]
v ; => make vector! [2.0 3.0 4.0]
```

The same happens with integers and percents. I am sure this is not what is intended.



Comments:
--------------------------------------------------------------------------------

On 2016-09-11T15:28:18Z, meijeru, commented:
<https://github.com/red/red/issues/2216#issuecomment-246186217>

    Apparently (see gitter/red) the semantics are still to be defined. I can see two analogies:
    (1) with tuples:
    
    ```
    v: 1.2.3
    v + 1 ; => 2.3.4 and v is unchanged
    ```
    
    (2) with blocks (no element wise addition possible, hence nearest is append)
    
    ```
    b: [1 2 3]
    append b 4 ; => [1 2 3 4] and b is changed
    ```
    
    Doc's comments on gitter seem to show he is seeing vectors as series hence mutable, at least when addition of a number is done to them; but not when two vectors are added together!?! the block analogy to that would be `append b [4 5 6]` which changes the original block.
    
    My feeling is that addition of a number to a vector is more of a mathematical operation than a mutable series operation, hence I would wish `v` in the example to remain unchanged. IF that is not preferred, than the addition of two vectors should change the left one too, in order to remain consistent!

--------------------------------------------------------------------------------

On 2016-09-11T21:30:44Z, greggirwin, commented:
<https://github.com/red/red/issues/2216#issuecomment-246206018>

    If vector args are changed in place, the doc string needs to say so. As long as we know how to think of them, and how they behave, as with other types, either design choice is valid. I have `tuple!` funcs just to do mutation, incrementing build numbers, versions, etc.

--------------------------------------------------------------------------------

On 2016-09-13T13:56:47Z, Oldes, commented:
<https://github.com/red/red/issues/2216#issuecomment-246689372>

    If I can vote, I think current behavior is correct.

--------------------------------------------------------------------------------

On 2016-09-13T17:19:07Z, meijeru, commented:
<https://github.com/red/red/issues/2216#issuecomment-246755778>

    For consistency's sake, those who vote for the current behaviour of vector! + number! should also want the vector! + vector!  case to be mutable, i.e. changing the first vector. @Oldes do you agree?

--------------------------------------------------------------------------------

On 2016-09-13T18:04:22Z, Oldes, commented:
<https://github.com/red/red/issues/2216#issuecomment-246769575>

    Yes... I think so... you can always use `copy` when you need a new value. But it would probably require to see, what scenario would be more common.. I guess that `matrix!` type would be just `vector!` internally, so one could look at some matrix math scenarios (i'm not good in math;)

--------------------------------------------------------------------------------

On 2016-09-13T19:14:16Z, meijeru, commented:
<https://github.com/red/red/issues/2216#issuecomment-246792102>

    In any case, the current implementation is not consistent either way...

--------------------------------------------------------------------------------

On 2016-09-14T07:27:44Z, Oldes, commented:
<https://github.com/red/red/issues/2216#issuecomment-246928949>

    One should first answer a question, _what is main purpose of `vector!` datatype?_ If it is speed and memory efficiency, than creating a copy on each operation is a nonsense.

--------------------------------------------------------------------------------

On 2016-09-14T07:39:49Z, Oldes, commented:
<https://github.com/red/red/issues/2216#issuecomment-246931374>

    I'm using Starling framework elsewhere, so I can compare its [matrix utils](https://github.com/Gamua/Starling-Framework/blob/master/starling/src/starling/utils/MatrixUtil.as): You can see that all main functions (_skew, prependMatrix, prependTranslation, prependScale, prependRotation, prependSkew_) modifies existing matrix input and other functions, like _convertTo3D_, accepts matrix as an input argument to avoid allocations.
    
    But the true is, that `matrix!` is still not `vector!` and `vector!` is not a `tuple!`.... and above functions are not just about adding a value to a vector! type.

--------------------------------------------------------------------------------

On 2019-01-24T19:31:13Z, Oldes, commented:
<https://github.com/red/red/issues/2216#issuecomment-457326375>

    As I'm now using vectors to hold thousands values, I'm pretty sure that current behaviour is the good one. I definitely don't want to have copy of such a big arrays in memory on each math operation.

--------------------------------------------------------------------------------

On 2019-01-24T19:55:03Z, hiiamboris, commented:
<https://github.com/red/red/issues/2216#issuecomment-457334030>

    It's absurd from the design point of view, totally inconsistent and totally unexpected. I support @meijeru 100%.
    ```
    >> a: make vector! [1 1 1 1 1]
    == make vector! [1 1 1 1 1]
    >> b: make vector! [1 1 1 1 1]
    == make vector! [1 1 1 1 1]
    >> a + b
    == make vector! [2 2 2 2 2]
    >> a
    == make vector! [1 1 1 1 1]
    >> b
    == make vector! [1 1 1 1 1]
    >> a + 1
    == make vector! [2 2 2 2 2]
    >> a
    == make vector! [2 2 2 2 2]
    ```
    I however also agree with @Oldes that a modifying function is a must, but it should be separate from the `+` operator. Something in the lines of `math`, that will take an expression (e.g. `[a + b + 2 * 3]`) and modify the first vector inside that expression in place.

--------------------------------------------------------------------------------

On 2020-07-18T15:37:26Z, hiiamboris, commented:
<https://github.com/red/red/issues/2216#issuecomment-660499951>

    See also my thoughts here https://github.com/red/REP/issues/10#issuecomment-660499053

