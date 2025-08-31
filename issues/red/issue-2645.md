
#2645: Inconsistency in integer! <-> logic!  conversion with TO 
================================================================================
Issue is closed, was reported by meijeru and has 12 comment(s).
[status.dismissed] [type.review]
<https://github.com/red/red/issues/2645>

```
>> to integer! true
*** Script Error: cannot MAKE/TO integer! from: true
*** Where: to
>> to integer! false
*** Script Error: cannot MAKE/TO integer! from: false
*** Where: to
>> to logic! 1
== true
>> to logic! 0
== true
```
See also #2644. I do not think that this conforms to the principle of least surprise 😈 


Comments:
--------------------------------------------------------------------------------

On 2017-04-30T17:25:17Z, greggirwin, commented:
<https://github.com/red/red/issues/2645#issuecomment-298244979>

    %integer.reds has special handling for `make` with a `logic!` val. `To` does not. It's possible that it's due to `make` being done, and `to` work coming later but not moving that piece. There are helpers for a couple other types, so a `from-logic!` may also make sense. If that works for Team Red, I can look at making the change.

--------------------------------------------------------------------------------

On 2017-07-28T10:54:00Z, dockimbel, commented:
<https://github.com/red/red/issues/2645#issuecomment-318623001>

    There is a reason why we have `to` and `make` and not a single action instead. The rules for *conversion* and the rules for *construction* can differ. And that is not an inconsistency, it is a on-purpose design choice, separating rules into these two category, in order to offer more features while keeping them meaningful to users.
    
    We don't have any principle of least surprise to abide by, as Rebol and Red live in their own abstraction layer, there isn't any mainstream language which comes close to them. What matters is only internal consistencies, not consistency with languages living at an opposite side of the abstraction scale.
    
    All values are `true` except `false` and `none`. From this, it means that:
    ```
    >> to logic! 1
    == true
    >> to logic! 0
    == true
    ```
    is the expected result. Consequently, `true` (and by extension `false`), cannot be mapped back to an integer value, so we block _conversion_ to integer!, returning an error.
    
    But for the sake of boolean logic support, we also provide a mechanism to _construct_ `true` and `false` values from 1 and 0, through `make`, so `make logic! <integer>` is allowed.
    
    For the sake of consistency and reducing confusion, we could to block `make` too, though, that would remove a feature and introduce an arbitrary incompatibility with Rebol3. Your opinions and better suggestions on that topic are welcome.
    
    Current behaviors:
    ```
    >> make integer! false
    == 0
    >> make integer! true
    == 1
    >> to integer! false
    *** Script Error: cannot MAKE/TO integer! from: false
    *** Where: to
    *** Stack:  
    >> to integer! true
    *** Script Error: cannot MAKE/TO integer! from: true
    *** Where: to
    *** Stack:  
    >> 
    >> make logic! 0
    == false
    >> make logic! 1
    == true
    >> to logic! 0
    == true
    >> to logic! 1
    == true
    ```
    In a more concise way:
    ```
     MAKE	    TO
    ------	  --------
    T -> 1	  T -> n/a
    F -> 0	  F -> n/a
    
     MAKE	    TO
    ------	  ------
    1 -> T	  1 -> T
    0 -> F	  0 -> T
    ```
    So we can say that `make` is relying on boolean logic rules for constructing those values, while `to` relies on Red semantics for his behavior.

--------------------------------------------------------------------------------

On 2017-07-28T11:47:26Z, 9214, commented:
<https://github.com/red/red/issues/2645#issuecomment-318631853>

    | Proposed behavior | Current Red behavior | Rebol2 behavior | Alternatives (same in Red and Rebol2) |
    | -- | -- | -- | -- |
    | `to integer! true/false` yields `1/0` | raises error | works as proposed | `make integer! true/false` |
    | `to logic! 1/0` yields `true/false` | all `integer!` values are treated as `true` | works as proposed |`make logic! 1/0` |
    
    One of the Red goals is to be "90% compatible with Rebol2". Thereby, @meijeru's proposal should be accepted.
    
    **Or**, since current `to` behavior _is expected and consistent with "everything is `true` except `false` or `none` rule_ as pointed out by @dockimbel , we should leave it as is and be only "89%" compatible ;-)
    
    Speaking for myself, I prefer to leave `to` as is, because its current behavior makes (no pun intended!) sense for me and we have `make ...` alternatives for proposed behavior which are both _compatible_ with Rebol2 and _consistent_ with Red/Rebol logic rules.
    
    **Summary:**
    - @meijeru's proposal should be **`accepted`** **if Red team wants** to keep **compatibility** with Rebol2 as better as possible.
    - @meijeru's proposal should be **`declined`** **if Red team wants** to keep Red semantics **consistent** with "everything is `true` except `false` or `none`" rule.
    - @9214 thinks that @meijeru's proposal should be **`declined`** and current `to` behavior should stay untouched, because it's **consistent** with Red semantics and we have `make ...` alternatives for proposed behavior which are **compatible** with Rebol2.

--------------------------------------------------------------------------------

On 2017-07-28T12:32:46Z, dockimbel, commented:
<https://github.com/red/red/issues/2645#issuecomment-318640035>

    Currently:
    ```
    list: [a 3 b 9 c 4 d 0 e 8]
    >> foreach w [a d] [if to-logic select list w [print "found!"]]
    found!
    found!
    >> foreach w [a d] [if select list w [print "found!"]]
    found!
    found!
    ```
    With the `to logic! 1/0 yields true/false` proposition, we would get:
    ```
    >> foreach w [a d] [if to-logic select list w [print "found!"]]
    found!
    >> foreach w [a d] [if select list w [print "found!"]]
    found!
    found!
    ```
    So, quite a big inconsistency, `0` value could mean `true` or `false` depending how you use it...

--------------------------------------------------------------------------------

On 2017-07-29T04:17:41Z, greggirwin, commented:
<https://github.com/red/red/issues/2645#issuecomment-318802728>

    Started https://github.com/red/red/wiki/%60to%60-vs-%60make%60

--------------------------------------------------------------------------------

On 2019-08-20T14:23:39Z, dockimbel, commented:
<https://github.com/red/red/issues/2645#issuecomment-523038660>

    The goal of Red is not to be `*xx% compatible with R2*, that is rather the result of the design decisions that are been made, where often the R2 human-friendlier semantics better match Red goals than R3's ones. Though, in cases like this one, the design choice of R2 has proven to be more of a burden for users than a help. This was fixed in R3, and Red adopted the same solution.

