
#2215: ? gives more information on a map and its components than on a map component individually.
================================================================================
Issue is closed, was reported by meijeru and has 10 comment(s).
[type.wish] [status.contribution]
<https://github.com/red/red/issues/2215>

When exploring `system/codecs` using `?` I found that `? system/codecs` lists all components of the map including the bodies of the routines `system/codecs/png/encode` and `.../decode` (idem for `.../jpeg/...` etc.), whereas `? system/codecs/png` does NOT give the bodies of the routines. This lacks consistency.



Comments:
--------------------------------------------------------------------------------

On 2016-09-08T16:00:17Z, greggirwin, commented:
<https://github.com/red/red/issues/2215#issuecomment-245646908>

    `Help` has a check for objects right now, but `map!` isn't part of that check. Easy to add, though `help` is probably going to get a rewrite at some point. Good to note for that.

--------------------------------------------------------------------------------

On 2017-03-24T23:17:55Z, Oldes, commented:
<https://github.com/red/red/issues/2215#issuecomment-289165318>

    I don't think this is an issue... when you do `? system/codecs`, it is like doing: `probe system/codecs` so you see everything, while `? system/codecs/png` displays key/value of the `png` object. The output is limited by design else you could not browse large object easily...
    
    Also `system/codecs` is a `block!`, so help system don't see it as a key/values like with object.
    
    You can test it yourself: `? system` versus `probe system`.

--------------------------------------------------------------------------------

On 2017-03-24T23:18:43Z, Oldes, commented:
<https://github.com/red/red/issues/2215#issuecomment-289165426>

    Or what is your proposition?

--------------------------------------------------------------------------------

On 2017-06-18T19:00:06Z, geekyi, commented:
<https://github.com/red/red/issues/2215#issuecomment-309296081>

    @Oldes 
    > Also system/codecs is a block!, so help system don't see it as a key/values like with object.
    
    I think the wish here is to show more summarized info for `help block!` (specifically, nested blocks) just as for other composite datatypes like `object!`
    
    In `object!`s themselves, `help` summarizes block with its length and a short list of contents:
    ```
    codecs      block!        length: 8  [png make object! [title: "" name: 'PNG mime-type: [image/png] suffi..
    ```
    Something similar to between that and current behavior in console :
    ```red
    >> test: [] repeat i 40 [append test i]
    == [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 3...  ; stops at 36 + half
    >> forall test [new-line test on]
    == [
        40
    ]
    >> test
    == [
        1 
        2 
        3 
        4 
        5 
        6 
        7 
        8 
        9 
        10 
        11 
        12 
        13  ; stops at 13
        ...
    >> ? test
    TEST is a block! value: [  ; say something about length here when using `help`
    ...    ; prints everything
    ```

--------------------------------------------------------------------------------

On 2017-06-18T20:45:44Z, greggirwin, commented:
<https://github.com/red/red/issues/2215#issuecomment-309301806>

    Right now there's no special check for blocks. The `value-is-type-str` internal func is called and it uses `mold` directly. It would be easy to change that to use `form-value`, which will make things more consistent. The tradeoff is that the output is intentionally limited, as with help on objects. We may want to change the format for maps in that case, as it only returns the keys right now, which matches objects. Where blocks get `length: n` metadata in the output, we could include "keys:" for both objects and maps, to make it clear that you aren't inspecting the values as well.
    
    We can mock up some different outputs to see what looks most helpful.

