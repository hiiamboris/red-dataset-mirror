
#3385: NOW silently ignores some refinements
================================================================================
Issue is closed, was reported by meijeru and has 10 comment(s).
[status.deferred] [type.review]
<https://github.com/red/red/issues/3385>

### Expected behavior

`now` should raise an error if it has more than one refinement and they are incompatible
### Actual behavior

`now/time/day` and `now/day/time` both act as if `/time` was not there, giving the result of `now/day`
### Steps to reproduce the problem

execute `now/time/day` in GUI console
### Red and platform version
```
Red 0.6.3 for Windows built 27-Apr-2018/12:07:23+02:00 commit #4c36108
```


Comments:
--------------------------------------------------------------------------------

On 2018-05-11T07:12:30Z, endo64, commented:
<https://github.com/red/red/issues/3385#issuecomment-388281109>

    R2, R3 and Red have different behaviors on multiple refinements:
    ```
    >> now/time/day
    ; Red == 11
    ; R2  == ** Script Error: Too many refinements
    ; R3  == 10:10:09
    ```

--------------------------------------------------------------------------------

On 2018-05-11T07:34:01Z, meijeru, commented:
<https://github.com/red/red/issues/3385#issuecomment-388285539>

    R2 seems the most sensible one

--------------------------------------------------------------------------------

On 2018-05-14T04:29:38Z, bitbegin, commented:
<https://github.com/red/red/issues/3385#issuecomment-388694071>

    I wanted fix this by disallow more than one refinements for `now`, but found another issue: "now/time/precise is allowed" 

--------------------------------------------------------------------------------

On 2018-05-14T06:39:22Z, bitbegin, commented:
<https://github.com/red/red/issues/3385#issuecomment-388712029>

    i set these refinements (year month day time zone weekday yearday) to be uniqued, and `date precise utc` can be existed with above refinements at the same time.

--------------------------------------------------------------------------------

On 2019-08-20T19:21:02Z, dockimbel, commented:
<https://github.com/red/red/issues/3385#issuecomment-523158320>

    Too many combinations to check:
    ```
    
    >> now/time
    == 21:19:47
    >> now/time/utc
    == 19:19:49
    >> now/utc
    == 20-Aug-2019/19:19:52
    >> now/utc/precise
    == 20-Aug-2019/19:19:56.783413
    >> now/time/utc
    == 19:20:14
    >> now/time/utc/precise
    == 19:20:40.798931
    ```
    R3 seems to give the priority to `/time` in erroneous cases, as the error checking in R2 were probably too expensive to keep.
    
    Maybe at best, we could define two groups, one for non-time related fields and one for time-related ones, and make them mutually exclusive. Though, that would add a lot of code for protecting against something harmless. Maybe it is better to leave such checkings to an IDE.

