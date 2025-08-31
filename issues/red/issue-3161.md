
#3161: [feature request] /safe refinement on `all` and `any`
================================================================================
Issue is closed, was reported by maximvl and has 8 comment(s).
[type.wish]
<https://github.com/red/red/issues/3161>

Hi, I think it could be useful to have `/safe` refinement on `all` and `any` to treat exceptions as logical failures instead of raising an exception.

Here is an example:
```
; v can be a string in which case both `to-float` and `to-integer`
; may fail but it is expected
v: any [
         attempt [to-float   val]
         attempt [to-integer val]
         attempt [find-in-graph val]
         none
      ]
```

Would be easier to write and add new cases as:
```
v: any/safe [ to-float val to-integer-val find-in-graph val none ]
```

Same thing with `all`.


Comments:
--------------------------------------------------------------------------------

On 2017-12-28T09:16:27Z, greggirwin, commented:
<https://github.com/red/red/issues/3161#issuecomment-354256544>

    You shouldn't have to repeat your `attempt` calls if you just want to catch errors.
    
    `v: attempt [any [ to-float val to-integer-val find-in-graph val ]]`
    
    vs 
    
    `v: any/safe [ to-float val to-integer-val find-in-graph val none ]`

--------------------------------------------------------------------------------

On 2017-12-28T09:17:53Z, greggirwin, commented:
<https://github.com/red/red/issues/3161#issuecomment-354256726>

    Ah, wait, I'm too tired and now see what you mean.

--------------------------------------------------------------------------------

On 2017-12-28T09:24:18Z, greggirwin, commented:
<https://github.com/red/red/issues/3161#issuecomment-354257602>

    One of those "gray area" ideas. Errors are errors for a reason. Basically, you could do it with something like `until [attempt [do/next block 'block]]`, but I don't think that's safe, and may not even work.

--------------------------------------------------------------------------------

On 2018-04-25T06:36:09Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3161#issuecomment-384176052>

    Following the introduction of the [Red REP repository for enhancements and wishes](https://gitter.im/red/red?at=5adfeed527c509a7744a3dc8), this issue is being closed.
    
    If you believe that your wish is still valid, please open a new issue for it in the new [red/REP repo](https://github.com/red/REP). It would help if you could include a link to this issue when opening an issue in the REP repository.

