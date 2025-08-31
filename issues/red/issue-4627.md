
#4627: reported values in error messages are not properly displayed
================================================================================
Issue is closed, was reported by 9214 and has 6 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/4627>

**Describe the bug**
Script errors typically mention Red values in their message. At some point, [regression](https://github.com/red/red/commit/fdf7a3ace7a623eabd214712d0a1d9b2a847bcae#diff-ee5dd4447fbcfc9c5056cbcd379763b4L149) made said messages less informative.

**To reproduce**
```red
>> null < []
*** Script Error: cannot compare   with 
*** Where: <
*** Stack:  
```

`null` character literally follows after "compare", as if it was printed rather than `mold`ed. Same with `[]`.
```red
>> print [null []]
 ; here they are
```

**Expected behavior**
```red
>> null < []
*** Script Error: cannot compare #"^@" with []
*** Where: <
*** Stack:  
```

**Platform version**
0084083, W10.



Comments:
--------------------------------------------------------------------------------

On 2020-08-20T06:17:32Z, kuklip, commented:
<https://github.com/red/red/issues/4627#issuecomment-677260347>

    ```
    >> about
    Red 0.6.4 for Windows built 19-Aug-2020/18:44:35+05:30 commit #b0e52d4
    
    >> 2 > [10]
    *** Script Error: cannot compare 2 with 10
    *** Where: >
    *** Stack:  
    
    >> 
    ```
    
    "cannot compare 2 with [10]" would be good.

--------------------------------------------------------------------------------

On 2020-09-06T05:32:18Z, kuklip, commented:
<https://github.com/red/red/issues/4627#issuecomment-687704216>

    Tried the PR change for some time and also a version using "mold" always. To me, using "mold" gives **explicit** and clear error messages (except, the quotes around (line 1) look strange). 
    
    I am new to red/rebol way of things. I guess I do not grasp "form".  May be singe values should be "form" ed and blocks and parens to be "mold"ed?  But not "null" ? What about 'unset' value?  is "mold" correct here?
    
    ```
    >> form [ 10 [ 20 ] ]
    == "10 20"
    >> 
    >> form [ 10 first [ 20 30 ] ]
    == "10 first 20 30"
    >> 
    >> form [10 (first [ 1 2]) [20]]
    == "10 first 1 2 20"
    >>
    >> print mold  null
    #"^@"
    >> 
    >> print form null
    
    >>
    >> 
    >> print form ()
    
    >> print mold ()
    unset
    >> 
    ```
    
    edit: meant to paste this also.
    
    ```
    >> ()
    >> 
    >> 
    >> do mold ()
    *** Script Error: unset is missing its word argument
    *** Where: unset
    *** Stack:  
    
    >> 
    ```
    
    

--------------------------------------------------------------------------------

On 2020-09-29T09:53:54Z, 9214, commented:
<https://github.com/red/red/issues/4627#issuecomment-700597272>

    @ku-klip "forming" and "molding" are two different way to serialize Red values into a textual form. `form` is more human-friendly, but lossy, whereas `mold` is more machine-friendly and lossless.
    
    In the original issue, error messages always `form`ed the reported values, and that resulted in [very confusing error messages](https://github.com/red/red/pull/4634#issue-470946333) (because of the lossy-ness of `form`). OTOH, if values are `mold`ed instead, then lexical errors start to looks a bit weird: that's what you called "strange-looking quotes around (line 1)".
    
    Selective forming/molding that you propose would IMO only complicate error reporting.

