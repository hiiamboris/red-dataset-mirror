
#5517: case, case/all and their returning values
================================================================================
Issue is closed, was reported by gor77 and has 10 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5517>

So, just a few examples I created while trying to learn _case_ and _case/all_. Comments are right below each case.

case [
    false true
    false true
]
;-- here, the result is _none_. 
;-- It makes sense if results of *condition* evaluation are being discarded (by discarded I mean evaluated to _none_) 


case/all [
    true true
    none true
]
;-- here, the result is _none_...

case/all [
    true true
    no true
    ]
;-- ...but here, it is _false_. 


case/all [    
    false true
    false true
]
;-- again, the result is _none_, I was expecting _false_. 
;-- Here, it acts like results of evaluation are being discarded (evaluated to _none_).


case/all [
    true true
    false false
]
;--The result is false - here it acts like the last condition wins (it's obviously **not** discarded)

So the idea is: if I know the rules, simply by looking at case block (or case/all), 
I should unambiguously know what the end result is going to be: will it return _false_, or _none_. 

But is it possible to know that now? 


Comments:
--------------------------------------------------------------------------------

On 2024-06-29T11:59:08Z, hiiamboris, commented:
<https://github.com/red/red/issues/5517#issuecomment-2198126238>

    So the bug here is that `case/all` returns `false` instead of `none` if last condition evaluates to `false`.

--------------------------------------------------------------------------------

On 2024-06-29T12:06:36Z, hiiamboris, commented:
<https://github.com/red/red/issues/5517#issuecomment-2198128386>

    Sister bug: https://github.com/red/red/issues/4899
    Loop return values are of some relevance: https://github.com/red/red/issues/1706#issuecomment-660306764 https://github.com/red/red/issues/3158#issuecomment-539618980 as well as `any/all` return values https://github.com/red/REP/issues/85

--------------------------------------------------------------------------------

On 2024-06-29T13:15:32Z, gor77, commented:
<https://github.com/red/red/issues/5517#issuecomment-2198189577>

    So, as a general rule: is it safe to say that the correct behavior (when the bug is fixed) of _case_ and _case/all_  is such that the results of evaluation of **conditions**  is **always** discarded?
    
    In other words, result of evaluation of any **condition** should never "slip through" and become the end result of 
    case (or case/all), it is just being used for making decision whether to execute corresponding block or not.
    
    I know this might seem naive, but Red is so much different that I'm really not sure about anything anymore.

--------------------------------------------------------------------------------

On 2024-06-29T14:06:24Z, hiiamboris, commented:
<https://github.com/red/red/issues/5517#issuecomment-2198205972>

    My opinion is failed conditions should never affect the result.

--------------------------------------------------------------------------------

On 2024-07-01T16:47:07Z, dockimbel, commented:
<https://github.com/red/red/issues/5517#issuecomment-2200613001>

    After the fix, if no condition is met (`case`) or ending condition is `false` (`case/all`), the returned value will be `none`. In all other cases, the last evaluated value is returned.

