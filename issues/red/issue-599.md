
#599: FORMing tag! in block! by INSERTion corrupts memory
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 16 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/599>

```
red>> form ["<?>"]
== "<?>"
red>> append "" ["<?>"]
== "<"
red>> head insert "" ["<?>"]
== "<"
```

The content of the ? doesn't matter. Seems to corrupt memory, because within a larger program, it crashes.



Comments:
--------------------------------------------------------------------------------

On 2013-12-09T08:09:46Z, qtxie, commented:
<https://github.com/red/red/issues/599#issuecomment-30111489>

    When I look into this issue, I find it's somewhat complicated.
    First, to fix this issue.
    Bug location: line number 1487 in file string.reds:
    
    ```
    if negative? part [part: block/rs-length? src]         ;-- if not /part, use whole value length
    s2: GET_BUFFER(src)
    cell: s2/offset + src/head
    limit: cell + part                                     ;-- /part support
    ```
    
    Modify above code to below will solve the issue:
    
    ```
    s2: GET_BUFFER(src)
    cell:  s2/offset + src/head
    either negative? part [
        limit: cell + block/rs-length? src  ;-- if not /part, use whole value length
    ][
        limit: cell + part                  ;-- /part support
    ]
    ```
    
    Second, for the behaviors of `APPEND/PART`
    In Rebol3:
    
    ```
    >> append/part "I" ["abc" "123"] 1
    == "Ia"
    
    >> append/part "I" ["abc" "123"] 2
    == "Iab"
    
    >> append/part "I" ["abc" "123"] 3
    == "Iab"
    ```
    
    In Red (already fixed this issue):
    
    ```
    red>> append/part "I" ["abc" "123"] 1
    == "Ia"
    red>> append/part "I" ["abc" "123"] 2
    == "Iab12"
    red>> append/part "I" ["abc" "123"] 3     ; error!
    ```
    
    I don't know which one is correct, but I expect those:
    
    ```
    >> append/part "I" ["abc" "123"] 1
    == "Iabc"
    >> append/part "I" ["abc" "123"] 2
    == "Iabc123"
    >> append/part "I" ["abc" "123"] 3
    == "Iabc123"
    ```
    
    Third, for the behaviors of `INSERT`
    In Rebol2 and Rebol3:
    
    ```
    >> head insert "I" ["abc" 123]
    == "abc123I"
    ```
    
    In Red:
    
    ```
    red>> head insert "I" ["abc" 123]
    ```
    
    == "123abcI"
    
    So what's you opinion?

--------------------------------------------------------------------------------

On 2013-12-10T00:47:15Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/599#issuecomment-30189914>

    Thanks for investigating, and good finds!
    
    That append/part behaviour is bizarre. Is it part of this issue? My expectation would be the same as yours.
    
    REBOL's INSERT looks most consistent with the rest of the language to me.

--------------------------------------------------------------------------------

On 2013-12-11T10:54:54Z, dockimbel, commented:
<https://github.com/red/red/issues/599#issuecomment-30310823>

    The Red's **/part** behaviors above are buggy, it should work exactly as in Rebol3, except for this following Rebol3 bug:
    
    ```
    >> append/part "I" ["abc" "123"] 3
    == "Iab"
    ```
    
    It should return `"Iabc"`.
    
    The reversed insertion is caused by a missing head position adjustment inside the loop after each atomic insertion (it's currently done in one step after the insertion loops exits).

--------------------------------------------------------------------------------

On 2013-12-12T10:54:09Z, qtxie, commented:
<https://github.com/red/red/issues/599#issuecomment-30406321>

    @dockimbel I got it. I will try to work out it if you have not written some code to fix this issue.

--------------------------------------------------------------------------------

On 2013-12-12T10:58:46Z, dockimbel, commented:
<https://github.com/red/red/issues/599#issuecomment-30406616>

    @qtxie Go for it, I haven't work on it so far, I'm currently preparing a new branch of code for Android support.
    
    Just make sure there's no regression using the tests suite. I remember that **/dup** + **/part** combined usage was tricky to get right, so changing **/part** will most probably required **/dup** adjustments. Also some other parts of the runtime relying on **block|string/insert/part** or **block|string/append/part** might be affected by the fixes (like in Parse for example).

--------------------------------------------------------------------------------

On 2013-12-17T19:52:17Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/599#issuecomment-30784472>

    I don't like the R3 behaviour:
    
    > > append/part "I" ["abc" "123"] 2
    > > == "Iab"
    
    I agree with qtxie that I would expect:
    
    > > append/part "I" ["abc" "123"] 2
    > > == "Iabc123"
    
    I think it's more natural.

--------------------------------------------------------------------------------

On 2013-12-19T14:02:22Z, dockimbel, commented:
<https://github.com/red/red/issues/599#issuecomment-30930241>

    The **/part** behavior in R3 is the same as in R2 and is well defined. If the argument is an integer!, only that number of characters (and not values) are taken from the value to be append-ed. When the value to append/insert is a block of values, this behavior is more helpful as it's costly and complicated to implement it by yourself. Moreover, that is what **/part** does for **mold/part** and **form/part** in Red.
    
    For the preferred behavior expressed by you both, you can have it easily using `copy/part`:
    
    ```
    >> append "I" copy/part ["abc" "123"] 1
    == "Iabc"
    >> append "I" copy/part ["abc" "123"] 2
    == "Iabc123"
    >> append "I" copy/part ["abc" "123"] 3
    == "Iabc123"
    ```
    
    So to be clear, these are the results Red should give:
    
    ```
    >> append/part "I" ["abc" "123"] 1
    == "Ia"
    >> append/part "I" ["abc" "123"] 2
    == "Iab"
    >> append/part "I" ["abc" "123"] 3
    == "Iabc"
    ```

--------------------------------------------------------------------------------

On 2013-12-19T17:10:27Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/599#issuecomment-30946766>

    I see. I agree with your conclusion, but not with the argumentation. /part is not well defined at all. R2 doesn't have it for APPEND, FORM and MOLD, only for INSERT, and it does this:
    
    ```
    >> head insert/part "I" ["abc" "123"] 2
    == "abc123I"
    >> head insert/part "I" ["abc" "123"] 1
    == "abc123I"
    ```
    
    In R3 it's equally useless through other bugs analysed above by qtxie.
    
    I agree with your argument to supply the hardest functionality. However, it leads to the surprising effect of /part semantics being different for COPY and the new /part refinements in Red, so this reasoning should be documented well.

