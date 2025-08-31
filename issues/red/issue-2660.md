
#2660: Pairs are wrongly compared for greater etc.
================================================================================
Issue is closed, was reported by meijeru and has 14 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2660>

The algorithm used is suitable for (in)equality but NOT for greater than etc.
```
>> 1x2 > 2x1
== true
```
 This is because `y` is first tested and if there is a difference, that is taken for the whole.


Comments:
--------------------------------------------------------------------------------

On 2017-05-18T07:10:59Z, dockimbel, commented:
<https://github.com/red/red/issues/2660#issuecomment-302320539>

    Which algorithim do you suggest for that? We could calculate the corresponding vector length for each pair, and compare it, though I'm not certain this would be the best option.

--------------------------------------------------------------------------------

On 2017-05-18T07:24:17Z, meijeru, commented:
<https://github.com/red/red/issues/2660#issuecomment-302323113>

    In contrast to tuples, which can be compared "lexicographically" I don't see a sensible algorithm for pairs. Neither do I see a use case. So the best could be to forbid this comparison.

--------------------------------------------------------------------------------

On 2017-05-18T09:18:36Z, geekyi, commented:
<https://github.com/red/red/issues/2660#issuecomment-302349143>

    1. Going multidimensional for values of more than one dimension:
    ```red
    == falseXtrue
    ```
    or using ranges, `[false true]` etc. This is the approach taken by some array programming languages (J).
    I like this way
    
    2. Giving a `logic!` when all the individual values satisfy, and something akin to `none` when not:
    ```red
    >> 2x2 > 1x1 ; strictly  true
    == true
    >> 1x1 > 2x2 ; strictly  false
    == false
    >> 1x2 = 1x2
    == true
    >> 1x2 > 2x1 ; indeterminate
    == none
    >> 2x1 > 1x2
    == none
    ```
    
    3. Using the same gradient as `x = y` line to determine what is greater and what is less. Probably too obscure to be useful tho.
    Any pairs which have the same 

--------------------------------------------------------------------------------

On 2017-05-24T17:05:38Z, greggirwin, commented:
<https://github.com/red/red/issues/2660#issuecomment-303788660>

    Geekyi's idea is interesting. Need to think about how useful it would be though. Rebol doesn't allow comparisons, so I think we can leave it out. There's no clear answer, other than what geekyi suggests. 
    
    On a related note, Rebol *does* support `max/min`, which is nice.
    ```
    >> max 1x2  2x1
    == 2x2
    ```

--------------------------------------------------------------------------------

On 2017-05-25T20:26:54Z, greggirwin, commented:
<https://github.com/red/red/issues/2660#issuecomment-304114761>

    It occurred to me that a use case for this is a block with pairs as keys, e.g., representing a sparse table, which would lead to sorting like tuples. 

--------------------------------------------------------------------------------

On 2017-05-25T20:38:10Z, meijeru, commented:
<https://github.com/red/red/issues/2660#issuecomment-304117503>

    Essentally, you are then using pairs as 2-element tuples, which would suggest lexicographic comparison (x first, then y). That is easy to implement.

--------------------------------------------------------------------------------

On 2019-08-20T14:56:44Z, dockimbel, commented:
<https://github.com/red/red/issues/2660#issuecomment-523053487>

    Comparison for pairs was modified to adopt lexicographic order.

