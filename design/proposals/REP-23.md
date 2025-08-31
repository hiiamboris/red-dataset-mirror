
#23: WISH: Make ARCTANGENT2 degree-based version of ATAN2
================================================================================
Issue is open, was reported by rebolek and has 2 comment(s).
<https://github.com/red/REP/issues/23>

There's a convention in Red that shortened names of trigonometric functions take radians as argument and full names take degrees (**sin** and **sine**, **cos** and **cosine**, etc).
However there is one exception to the rule and that is `arctangent2` that takes radians, same as `atan2`.
It would only make sense to follow the convention set in other trigonometric functions.
Also, the docstring for `arctangent2` is 190 chars long and should be shortened.


Comments:
--------------------------------------------------------------------------------

On 2018-11-23T19:09:42Z, hiiamboris, commented:
<https://github.com/red/REP/issues/23#issuecomment-441305213>

    I remember shortening the docstring. And for the sake of correctness: it doesn't take radians, it returns radians.
    
    I agree though that currently `atan2` and `arctangent2` are redundant. Suppose `arctangent2` should take a refinement `/radians`, as `arctangent` does. I support your wish and may incorporate if it will be accepted.

