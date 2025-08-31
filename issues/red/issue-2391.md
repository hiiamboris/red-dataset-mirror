
#2391: [parse] `collect/keep` inconsistency
================================================================================
Issue is closed, was reported by maximvl and has 16 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2391>

`collect/keep` inside `parse` returns different structure depending on number of elements:
```
red>> parse [x -- ] [collect [keep to '-- ]]
== [x]
red>> parse [x y -- ] [collect [keep to '-- ]]
== [[x y]]
```
I suggest to return same structure without depending on number of elements, eg `[[x]]` in first case or `[x y]` in second one.


Comments:
--------------------------------------------------------------------------------

On 2017-02-14T15:05:03Z, dockimbel, commented:
<https://github.com/red/red/issues/2391#issuecomment-279731883>

    This is an intended behavior, `keep` captures a range of value as a block, so that the range information is preserved. This was meant to provide a larger number of options for the user, as it is always possible to rewrite your parsing rules to capture values one by one instead of a range (or the other way around). Though, this can lead sometimes to under-optimized or overly-complex rules. For example:
    ```
    red>> parse [x -- ] [collect [keep copy z to '-- ]]
    == [[x]]
    ```
    So far, I have always used `keep` to capture single values, so I have not encounter such issue.

--------------------------------------------------------------------------------

On 2017-02-14T15:39:11Z, dockimbel, commented:
<https://github.com/red/red/issues/2391#issuecomment-279742288>

    Another aspect to consider also is the behavior of `keep` when parsing string series. If we remove the range-capturing mode, then this is what you would get for strings:
    ```
    digit: charset "0123456789"
    parse "hello123world456" [collect any [keep 3 digit | skip]]
    == [#"1" #"2 #"3" #"4" #"5" #"6"]
    ```
    instead of:
    ```
    == ["123" "456"]
    ```
    If we would keep the range-capturing behavior for strings (and maybe binary series), but not for blocks, this would be a real inconsistency.

--------------------------------------------------------------------------------

On 2017-02-15T01:55:40Z, greggirwin, commented:
<https://github.com/red/red/issues/2391#issuecomment-279895213>

    For the non-`parse` version of `collect`, `keep` has an `/only` refinement. It might be confusing to have a `keep-only` keyword in `parse` though. Otherwise, I think the current behavior is good, and is consistent with `load`.

--------------------------------------------------------------------------------

On 2017-02-15T05:53:21Z, geekyi, commented:
<https://github.com/red/red/issues/2391#issuecomment-279923632>

    The first case does result in some loss of information. Can always get the second from the first by flattening the series.
    In practice, I've not thought much about the difference. It conveniently returns the result I want usually. Unless it's a recursive (or a sub-)rule, in which case I have to think. 

--------------------------------------------------------------------------------

On 2017-02-15T09:27:39Z, dockimbel, commented:
<https://github.com/red/red/issues/2391#issuecomment-279959875>

    We could maybe add a modifier keyword after `keep` when you want values to be collected individually instead of as a range. Maybe `keep flat` or `keep split`? (`only` is the default mode, so we need an opposite keyword).

--------------------------------------------------------------------------------

On 2017-02-15T11:45:24Z, Oldes, commented:
<https://github.com/red/red/issues/2391#issuecomment-279990109>

    `keep split` seems to be better for string result as mentioned above, although `keep flat` makes more sense for block. Hard work for dialect designers. I would vote for the first one.

--------------------------------------------------------------------------------

On 2017-02-22T09:54:25Z, dockimbel, commented:
<https://github.com/red/red/issues/2391#issuecomment-281621759>

    This ticket is related to #2295.

--------------------------------------------------------------------------------

On 2017-02-22T12:24:23Z, dockimbel, commented:
<https://github.com/red/red/issues/2391#issuecomment-281655108>

    So, now you have all the possibilities covered:
    * by default, nothing is changed, you get a single value or a list of value in range-capturing mode.
    * `keep pick` collects all the matched values separately
    * `keep copy <word>` collects all the matched values as a series (of same type as input).
    
    For example:
    ```
    red>> parse [x -- ] [collect [keep to '-- ]]
    == [x]
    red>> parse [x y -- ] [collect [keep to '-- ]]
    == [[x y]]
    
    red>> parse [x -- ] [collect [keep pick to '-- ]]
    == [x] 
    red>> parse [x y -- ] [collect [keep pick to '-- ]]
    == [x y]
    
    red>> parse [x -- ] [collect [keep copy _ to '-- ]]
    == [[x]]
    red>> parse [x y -- ] [collect [keep copy _ to '-- ]]
    == [[x y]]
    ```
    Note: `_` is a word, any word would do, here I use underscore to signify that we don't care about that word or his value, as it is immediatly collected by `keep`.

