
#2126: remove-each returns unset
================================================================================
Issue is closed, was reported by greggirwin and has 30 comment(s).
[status.built] [status.tested] [test.written] [type.design]
<https://github.com/red/red/issues/2126>

Doc string says it returns removal count.

```
red>> remove-each val [a 1] [not any-word? val]
red>> 
```



Comments:
--------------------------------------------------------------------------------

On 2016-07-21T06:31:15Z, greggirwin, commented:
<https://github.com/red/red/issues/2126#issuecomment-234168484>

    It looks like the doc string changed, but it still returns unset. Is that the final behavior? Seems most people like the old R2 behavior of returning the series.

--------------------------------------------------------------------------------

On 2016-09-10T20:54:54Z, greggirwin, commented:
<https://github.com/red/red/issues/2126#issuecomment-246139710>

    Ping. Checking on this to see if that's the final behavior. 

--------------------------------------------------------------------------------

On 2019-01-05T20:40:57Z, endo64, commented:
<https://github.com/red/red/issues/2126#issuecomment-451688750>

    @greggirwin @dockimbel 
    Please reconsider following the R2's behavior as it seems the most useful one:
    
    `foreach data remove-each d load %data.red [ <remove unwanted data> ] [ <do something to the rest> ]` 

--------------------------------------------------------------------------------

On 2019-01-06T03:05:48Z, greggirwin, commented:
<https://github.com/red/red/issues/2126#issuecomment-451711216>

    I understand why Carl changed it in R3, as calc'ing the number of items removed means holding a copy or the length of the original, which is more work and more expensive. However, I don't think I ever needed to do that. If it's needed, the extra work isn't that great. I agree that returning the series is the most useful behavior.

--------------------------------------------------------------------------------

On 2019-01-06T20:12:51Z, endo64, commented:
<https://github.com/red/red/issues/2126#issuecomment-451770837>

    Returning the number of items removed could be provided by a refinement like `/count`, even tough it is ugly.
    I still prefer returning the series. Subtracting the count before and after isn't a terrible anyway.

--------------------------------------------------------------------------------

On 2019-08-10T01:39:11Z, greggirwin, commented:
<https://github.com/red/red/issues/2126#issuecomment-520107620>

    There's another option we could try as well. Return both the modified series and the removed count. We do want to be careful about heading down that slippery slope, but then you only need to know how it behaves, and use it consistently with `set [series count] remove-each ...` if you need the results.
    
    In the bigger scheme of things, that might affect the overall HOF design from a consistency standpoint.

--------------------------------------------------------------------------------

On 2019-08-10T01:50:07Z, greggirwin, commented:
<https://github.com/red/red/issues/2126#issuecomment-520108358>

    The series itself is the much more useful value, if we pick just one. For those who really need the functionality I just posted, it's a simple mezz.
    ```
    remove-each-and-count: function [
        "Like remove-each, but returns both modified series and count of removed items." 
        'word [word! block!] "Word or block of words to set each time" 
        data [series!] "The series to traverse (modified)" 
        body [block!] "Block to evaluate (return TRUE to remove)"
    ][
        orig-ct: length? data
        remove-each :word data body
        reduce [data  orig-ct - length? data]
    ]
    remove-each-and-count v [1 2 3 4 5] [odd? v]
    remove-each-and-count v [1 2 3 4 5 6 7 8 9 10] [odd? v]
    ```

--------------------------------------------------------------------------------

On 2019-08-12T09:30:48Z, 9214, commented:
<https://github.com/red/red/issues/2126#issuecomment-520356380>

    > There's another option we could try as well. Return both the modified series and the removed count
    
    An extremely bad design pattern which basically turns idiomatic usage of refinements (`remove-each/series`, `remove-each/count`) inside out.
    
    IMO creation of `*-each` functions themselves is misguided, because it tries to cover a vast domain of generic (and composable) operations over aggregate values, for which high-order functions are more suitable.

--------------------------------------------------------------------------------

On 2019-08-12T16:03:26Z, greggirwin, commented:
<https://github.com/red/red/issues/2126#issuecomment-520487950>

    It doesn't turn refinement use on its head, it just returns multiple values, which is entirely idiomatic.
    
    `*-each` functions *are* HOFs: High Order F-Exprs. ;^)

--------------------------------------------------------------------------------

On 2019-08-12T17:34:14Z, 9214, commented:
<https://github.com/red/red/issues/2126#issuecomment-520520641>

    > it just returns multiple values, which is entirely idiomatic.
    
    Except that no other function in standard library does that. This design hinges function application / composition on a very specific pattern revolving around `set  [...]`, which itself is rarely used.
    
    As for `*-each` (or rather `each`), my point was that it acts as a high-level modifier (an adverb if you want) for some function, `remove` in this case. Not ideal, but this is how I envision it:
    ```red
    >> block: [1 2 3 4 5]
    == [1 2 3 4 5]
    >> scan block :number?
    == [[1 2 3 4 5] [2 3 4 5] [3 4 5] [4 5] [5]] ; prefixes
    >> scan block :even?
    == [[2 3 4 5] [4 5]]
    >> remove each scan block :even? ; <function> each <series>
    == [[3 5] [5]]
    >> block
    == [1 3 5]
    ```
    
    Of course, you can combine `each` and `scan` together, but then `each` must be a `function!`, not an `op!`.

--------------------------------------------------------------------------------

On 2019-08-12T22:32:51Z, greggirwin, commented:
<https://github.com/red/red/issues/2126#issuecomment-520619666>

    It's true that no other funcs do this, but are there other funcs that are side-effectful, as their main purpose, but also have extra information that could be useful if returned? I don't know of any. If `remove-each` were like other control funcs, and returned only the last evaluation result, that wouldn't be useful at all, as it would only tell you if the last item was removed or not. I also agree returning both values is probably not best in this case, hence my mezz example to do so. I just didn't know how you got to "extremely bad design pattern" when it's just a different way of doing things. 
    
    "Set logic" is fine IMO, but we do want to be very careful with it of course. It can make some things very concise, but also easy to screw up en mass.
    
    `Scan` is interesting. Have to think about it and draft more examples myself. I'm not a fan of OPifying too many things, as I think that makes it harder to reason about code at a glance. It is a powerful feature though.

--------------------------------------------------------------------------------

On 2020-03-21T19:12:01Z, 9214, commented:
<https://github.com/red/red/issues/2126#issuecomment-602089388>

    https://github.com/red/red/issues/1706 https://github.com/red/red/issues/3158

--------------------------------------------------------------------------------

On 2020-03-22T02:42:58Z, greggirwin, commented:
<https://github.com/red/red/issues/2126#issuecomment-602139440>

    Thanks for finding related items. The `each op!` in comments above may also apply to `of op!` design thinking, and HOFs in general.

--------------------------------------------------------------------------------

On 2021-02-16T00:20:57Z, greggirwin, commented:
<https://github.com/red/red/issues/2126#issuecomment-779506336>

    @dockimbel unless somebody has a really good reason _not_ to return the series, or a suggestion for a result that is more useful than the series, can we make `remove-each` return the series? 

--------------------------------------------------------------------------------

On 2023-11-29T18:32:56Z, greggirwin, commented:
<https://github.com/red/red/issues/2126#issuecomment-1832484173>

    Woohoo!

