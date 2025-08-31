
#90: Wish: make block! pair!
================================================================================
Issue is open, was reported by Oldes and has 6 comment(s).
<https://github.com/red/REP/issues/90>

It could be possible to preallocate block size using pair! value.
Now it is:
```red
>> make block! 2x2
*** Script Error: cannot MAKE block! from: 2x2
```
But it could be like `make block! 4` (preallocating block to hold at least 4 values)


Comments:
--------------------------------------------------------------------------------

On 2020-12-08T21:32:55Z, greggirwin, commented:
<https://github.com/red/REP/issues/90#issuecomment-741067292>

    I think this falls into `array` or `table` territory. Pair implies 2 axes, while blocks are flat, unless it worked as a preallocator like `make block! <int>`, but with sub-blocks like `array`.

--------------------------------------------------------------------------------

On 2020-12-08T22:46:32Z, Oldes, commented:
<https://github.com/red/REP/issues/90#issuecomment-741163309>

    Block can be used as a table.. to add pair is easy.. but I understand it's not a priority.
    
    Btw.. you talk about table quite often recently.. is there any proposal?
    
    I often have a block with given number of columns and I hate to do new-line/skip call when I need nice output in console.. and that is just the cheapest one.. I would like to have also chance to specify column widths and colors.. having a datatype which would do formating for me would be nice.

--------------------------------------------------------------------------------

On 2020-12-09T01:42:12Z, greggirwin, commented:
<https://github.com/red/REP/issues/90#issuecomment-741416480>

    We have a number of thoughts from months past, which overlap with other design elements. e.g. a formatted table is basically a spreadsheet, so ties to `format` and HOF.

