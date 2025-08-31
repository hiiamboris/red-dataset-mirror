
#4106: Negative /PART inconsistencies
================================================================================
Issue is open, was reported by hiiamboris and has 18 comment(s).
[type.review]
<https://github.com/red/red/issues/4106>

## Find & Select situation with `/part/reverse` (other stuff is below)

**Describe the bug**

From FIND & SELECT docstring:
```
     /part        => Limit the length of the search.
     /last        => Find the last occurrence of value, from the tail.
     /reverse     => Find the last occurrence of value, from the current index.
```
First on the wording:
`     /last        => Find the last occurrence of value, from the tail.`
Obviously when searching from the tail this item comes *first*, not "last".
`     /reverse     => Find the last occurrence of value, from the current index.`
Same here, *first* value found when searching backwards from the current index.

Now for
`     /part        => Limit the length of the search.`
It's all cool when `/part` is an integer, but when it's a series the result is unexpected:
```
>> a: skip "1234" 2
>> find/reverse/part a "1" 0
== none
>> find/reverse/part a "1" 1
== none
>> find/reverse/part a "1" 2
== "1234"
>> find/reverse/part a "1" a
== none
>> find/reverse/part a "1" back a
== none
>> find/reverse/part a "1" head a
== none                            ;) expected "1234"
>> find/reverse/part a "1" next a
== none
>> find/reverse/part a "1" tail a
== "1234"                          ;) expected none

>> select/reverse/part a "1" 0
== none
>> select/reverse/part a "1" 1
== none
>> select/reverse/part a "1" 2
== #"2"
>> select/reverse/part a "1" a
== none
>> select/reverse/part a "1" back a
== none
>> select/reverse/part a "1" head a
== none                            ;) expected #"2"
>> select/reverse/part a "1" next a
== none
>> select/reverse/part a "1" tail a
== #"2"                            ;) expected none
```

Similar thing with `/last`, the brother of `/reverse`. I would expect it to have the same search direction as `/reverse` but start the search from the other side of `/part`.
```
>> a: skip "1213141" 3
== "3141"
>> find/last/part a "1" 0
== none
>> find/last/part a "1" 1
== "1"                             ;) expected none as part contains "3" only
>> find/last/part a "1" 2
== "1"  
>> find/last/part a "1" a
== "1"                             ;) expected none as part is empty
>> find/last/part a "1" next a
== "1"                             ;) expected none as part contains "3" only
>> find/last/part a "1" tail a
== "1"
>> find/last/part a "1" back a
== "1"                             ;) expected none
>> find/last/part a "1" head a
== none

>> select/last/part a "1" 0
== none
>> select/last/part a "1" 1
== none
>> select/last/part a "1" 2
== none                            ;) part is "31", so expected #"4"
>> select/last/part a "1" a
== none
>> select/last/part a "1" next a
== none
>> select/last/part a "1" tail a
== none
>> select/last/part a "1" back a
== none
>> select/last/part a "1" head a
== none
```

**Expected behavior**

I expect find & select to respect the given point in series.
Then `/reverse` with a positive series part should always be none, as well as forward search on a negative series part. 
I expect `/last` to search backwards as well, so with a negative series part it should be none, with positive series part - starting from the other side of part (it goes from the tail currently, effectively ignoring /part).
Other results as in the snippet above.

It's an interesting quality of `/part` that it makes `/reverse` superfluous. Both the sign of an integer part and the margins of a series part, may be used to define the direction of the search.
So, alternatively, `/part/reverse` combo can be forbidden. And `/reverse` will only make sense in absence of `/part`.

I would also think about forbidding using both `/last` and `/reverse` at once. These are mutually exclusive in the current docstring (one searches from the current index, another from the opposite), and it is unclear which one takes precedence or if they mix in an unexpected manner.

By the way, R2 behavior here is a piece of work ☺ I don't know what to make of it:
```
>> a: skip "1234" 2
== "34"
>> find/reverse/part a "1" 0
== "1234"
>> find/reverse/part a "1" 1
== "1234"
>> find/reverse/part a "1" 2
== "1234"
>> find/reverse/part a "1" -1
== "1234"
>> find/reverse/part a "1" -2
== none
>> find/reverse/part a "1" a
== "1234"
>> find/reverse/part a "1" back a
== "1234"
>> find/reverse/part a "1" head a
== none
>> find/reverse/part a "1" next a
== "1234"
>> find/reverse/part a "1" tail a
== "1234"
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 18-Oct-2019/15:33:41+03:00 commit #ed913ef
```



Comments:
--------------------------------------------------------------------------------

On 2019-10-27T16:34:09Z, hiiamboris, commented:
<https://github.com/red/red/issues/4106#issuecomment-546711381>

    Here's more details on `/part` inconsistencies (and R2 for comparison), considering only series here:
    
    |           | Red         | Red           | Red          | Red        | R2          | R2           | R2        | R2         |
    | :---      | ---:        | :---          | ---:         | :---       | ---:        | :---         | ---:      | :---       |
    | **func**  | **int /part suppo rted?** | **series /part suppo rted?** | **int /part symm etric?** | **series /part symm etric?** | **int /part suppo rted?** | **series /part suppo rted?** | **int /part symm etric?** | **series /part symm etric?** |
    |           |             |               |              |            |             |              |           |            |
    | copy      | +           | +             | +            | +          | +           | +            | +         | +          |
    | find      | +           | +             | - (as zero)  | - (as zero) | +          | +            | +         | +          |
    | select    | +           | +             | - (as zero)  | - (as zero) | +          | +            | +         | +          |
    | append    | +           | +             | - (bugged)   | - (bugged) | unsup ported | unsup ported  |           |            |
    | change    | +           | +             | +            | +          | +           | +            | +         | +          |
    | insert    | +           | +             | - (bugged)   | - (bugged) | +           | +            | +         | +          |
    | move      | +           |               | - (as zero)  |            | +           |              | - (weird) |            |
    | remove    | +           | +             | - (as zero)  | - (as zero) | +          | +            | +         | +          |
    | reverse   | +           | +             | - (as zero)  | - (as zero) | +          | +            | - (error) | - (error)  |
    | sort      | +           | +             | +            | +          | +           | +            | - (error) | - (error)  |
    | take      | +           | +             | +            | - (bugged) | +           | +            | +         | +          |
    | lowercase | +           | +             | - (as zero)  | - (as zero) | +          | +            | - (error) | - (error)  |
    | uppercase | +           | +             | - (as zero)  | - (as zero) | +          | +            | - (error) | - (error)  |
    | form      | +           |               | N/A (as zero) |           | unsup ported |              |           |            |
    | mold      | +           |               | N/A (as zero) |           | unsup ported |              |           |            |
    | load      | +           | - (bugged)  | - (bugged)   | - (bugged) | unsup ported | unsup ported  |           |            |
    | transcode | +           | - (bugged)  | - (as zero)   | - (bugged) | unsup ported | unsup ported  |           |            |
    | write     | +           |               | - (bugged)   |            | +           |   +          | +         |  +         |
    | read      | +           |               | N/A (as infinity) |       | +           |              | N/A (as zero) |        |
    | parse     | +           | +             | - (bugged)   | - (bugged) | unsup ported | unsup ported  |           |            |
    |           |             |               |              |            |             |              |           |            |
    | **func**  | **int /part suppo rted?** | **series /part suppo rted?** | **int /part symm etric?** | **series /part symm etric?** | **int /part suppo rted?** | **series /part suppo rted?** | **int /part symm etric?** | **series /part symm etric?** |
    |           | **Red**         | **Red**           | **Red**          | **Red**        | **R2**          | **R2**           | **R2**        | **R2**         |
    
    Notes:
     1) on `find` & `select`: in R2 negative part behaves strange with /reverse 
     2) on `change`: in R2 part is applied to 2nd argument (in Red - 1st)
     3) on `move`: lack of series part is unjustified
     4) on `form` & `mold`: negative part can be given purpose of returning N chars from the tail (where can this be applied though?)
     5) on `read`: negative part can be given purpose of seeking back in the stream, but it will be inconsistent with `write` and will only work for seekable streams
     6) on `remove`: it accepts a `char!` /part but I have no idea how it can be used
     7) on `write`: in R2 `write` supports symmetric series /part when it's given a series `value` (then /part applies to value rather than output), and only a nonnegative integer when the value is not a series (then /part applies to output). In Red /part is integer only, and always applies to the output (I consider this a more consistent approach than that of R2).

--------------------------------------------------------------------------------

On 2019-10-28T21:17:54Z, greggirwin, commented:
<https://github.com/red/red/issues/4106#issuecomment-547150113>

    Great research and thoughts @hiiamboris. It drives me to ask: What are the use cases for these `find|select + /part/reverse` features, and how badly do we need it? Of course, they make some things easier, but how much value do they add, especially if they're hard to understand from the user side? I haven't grep'd old Rebol code, but in Red's codebase, `find/reverse` is used (5 instance total in: %help.red, core.red, rtd.red), and two instances of `find/part`:
    
    - https://github.com/red/red/blob/master/compiler.r#L2701
    - https://github.com/red/red/blob/master/compiler.r#L2702
    
    `select/part` and  `select/reverse` are only in test code. `Find`, of course, is the big, complicated part. `Select` is pretty small, but relies on `find`.
    
    As you broaden the scope to other actions, the consistency looks nice, but not worth it if you can't understand it easily as a user. 

--------------------------------------------------------------------------------

On 2019-10-28T21:24:46Z, greggirwin, commented:
<https://github.com/red/red/issues/4106#issuecomment-547152619>

    My gut says that `/part/reverse` combo can safely be an error. If you have calculated indexes, which may be negative, you can't use `/reverse` in a reasonable way.

--------------------------------------------------------------------------------

On 2019-10-29T11:33:32Z, hiiamboris, commented:
<https://github.com/red/red/issues/4106#issuecomment-547377868>

    Fair enough ☺ Considering this and all the info I've gathered, I would suggest the following course of action:
    1. Forbid `/part/reverse` and `/last/reverse` combos for `find` & `select`.
    1. Let `find/part` always search from the left (lower index) side, and `find/part/last` always search from the right (bigger index) side, regardless of whether the /part is positive or negative. Otherwise it becomes less clear what's it doing. Same for `select`.
    1. Let all functions that support *series* part argument, treat part symmetrically:
    - `f/part a b` = `f/part b a` when `b` is a series
    - `f/part a n` = `f/part a skip a n` = `f/part skip a n a` when `n` is an integer
    I believe the current asymmetric state is simply an oversight. Also let's include `move` here if it's worth having at all.
    4. Let all functions that support only integer /part (mold, form, read, write) - because /part in their context is applied to an intermediary buffer - treat negative part as zero.
    
    And by the way, instead of the current duplicate-the-same-code-as-much-as-possible strategy, I would suggest using a single function that will deal with the /part argument, preparing the necessary data for subsequent use.

--------------------------------------------------------------------------------

On 2019-10-29T20:39:01Z, greggirwin, commented:
<https://github.com/red/red/issues/4106#issuecomment-547618852>

    1. Agreed.
    2. Agreed. And that's a good way to explain it in docs.
    
    3.1 Had to review a bit, but 2 series vals just mean "between", because we can't also have `/reverse` now. If so, agreed. Just has to be doc'd clearly, but opens up some new ways of thinking about "windows" into series.
    3.2 Agreed, as with 3.1
    3.3 I think the only place `move` is used today is https://github.com/red/red/blob/master/modules/view/RTD.red#L120 @dockimbel will have to say how important it is to him. Power users will love it, I'm sure. But it's like `swap` working between series. I think both could be served by mezzanines, but don't have the use cases in mind that Doc might.
    
    4. My gut says to make negative `/part`s an error. It's easy to explain either way. Not enough brain the run through scenarios in my head right now.

--------------------------------------------------------------------------------

On 2019-10-29T20:41:53Z, greggirwin, commented:
<https://github.com/red/red/issues/4106#issuecomment-547620011>

    I give up trying to format the numbered list. :^\

--------------------------------------------------------------------------------

On 2020-03-20T13:25:11Z, 9214, commented:
<https://github.com/red/red/issues/4106#issuecomment-601699015>

    ```red
    >> empty? mold/part 123 -123
    == true
    >> empty? ""
    == true
    >> "" == ""
    == true
    >> "" == mold/part 123 -123
    == false ; welp
    ```

--------------------------------------------------------------------------------

On 2020-03-20T13:33:07Z, hiiamboris, commented:
<https://github.com/red/red/issues/4106#issuecomment-601702970>

    In the build #4097 :
    ```
    >> "" == mold/part 123 -123
    == true
    ```

--------------------------------------------------------------------------------

On 2020-07-31T18:51:56Z, hiiamboris, commented:
<https://github.com/red/red/issues/4106#issuecomment-667298364>

    See also https://github.com/red/red/issues/4199#issuecomment-666570998 - `parse [remove]` needs more tests together with this issue's fix.

