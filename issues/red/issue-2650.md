
#2650: Inconsistency in comparing char! and float! values
================================================================================
Issue is closed, was reported by meijeru and has 12 comment(s).
[status.reviewed] [type.review]
<https://github.com/red/red/issues/2650>

```
>> #"^@" = 0.0
== false
>> 0.0 = #"^@"
== true
```



Comments:
--------------------------------------------------------------------------------

On 2017-05-05T08:36:16Z, qtxie, commented:
<https://github.com/red/red/issues/2650#issuecomment-299411478>

    Should we allow this comparison?

--------------------------------------------------------------------------------

On 2017-05-05T09:11:10Z, meijeru, commented:
<https://github.com/red/red/issues/2650#issuecomment-299418036>

    It IS allowed explicitly in `%float.reds`. It is in line with the general tendency of treating floats and integers alike as much as possible.

--------------------------------------------------------------------------------

On 2017-05-06T10:22:34Z, dockimbel, commented:
<https://github.com/red/red/issues/2650#issuecomment-299630291>

    Yes, you can compare for equality any values. It should return `false` in both cases.

--------------------------------------------------------------------------------

On 2017-05-06T10:59:52Z, meijeru, commented:
<https://github.com/red/red/issues/2650#issuecomment-299632098>

    Thus the rule is: char and integer can be equal, and also integer and float/percent can be equal, but char and float cannot?? 

--------------------------------------------------------------------------------

On 2017-05-06T12:41:08Z, geekyi, commented:
<https://github.com/red/red/issues/2650#issuecomment-299637311>

    There are *two* cases for wildly different types when they can be compared to be same:
    1. The *empty* case:
    ```red
    >> zero? 0.0
    == true
    >> zero? #"^@"
    == true
    ```
    2. The rest, which is harder.. and sometimes doesn't make sense.
    Even in this case, you can compare if there is a 1:1 mapping. 
    a. Particularly easy for any type of data that can be mapped to a *totally ordered set*,
    you can compare the position of the order, for e.g.
    ```red
    >> to-integer #"2"
    == 50
    >> to-integer 50.5   ; not a 1:1 mapping here; case 2b?
    == 50
    ```
    Note that you can use other comparison operators too like `>` in this case
    b. When you don't have a 1:1 mapping, you could still compare. But it brings the question of dealing with the fine details of *when you can't compare*: `2 <> 2.2i` vs *when you can, but isn't the same*: `2 <> 3`
    
    ### Case 1
    This is @meijeru first comment. You could be more explicit and write `empty? a = empty? b`.
    If you extend `empty?` for all data types.
    
    ### Case 2a
    It's easy when you can map anything to an `integer!` like e.g. a `char!`
    
    ### Case 2b
    It's harder when one datatype isn't contained in another.
    For example, there can be many `float!`s  (round 2.0 2.1 2.221 etc), for an `integer!` 2 
    It also gives me this:
    ```red
    >> #"^@" < 0.0
    *** Script Error: cannot compare #"^@" with 0.0
    *** Where: <
    >> 0.0 < #"^@"
    == false
    ```
    Where the second one should be an error according to @dockimbel's reasoning. Does this need another bug report?
    
    

--------------------------------------------------------------------------------

On 2017-07-28T07:26:16Z, dockimbel, commented:
<https://github.com/red/red/issues/2650#issuecomment-318581766>

    @geekyi Thank for the detailed analysis. Comparison semantics need more work to be better defined.
    
    Not need for an extra ticket for that last issue for now.

