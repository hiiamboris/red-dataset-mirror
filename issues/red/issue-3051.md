
#3051: Add a 'product modifier to faces and VID spec
================================================================================
Issue is closed, was reported by rgchris and has 12 comment(s).
[type.wish]
<https://github.com/red/red/issues/3051>

This could work in lieu of a formal validation language. This could sit between the transformation between `face/text` and `face/data` and moderate the product of that element.

```
view layout [
    field 'name 500  ; see #3050 for proposed lit-word! use
    field 'phone 500 product [
        if parse text ["+" some digit][
            to issue! text
        ]
    ]
]
```

PRODUCT is a literal description of the function—there may be a more appropriate name.


Comments:
--------------------------------------------------------------------------------

On 2017-09-21T07:47:44Z, rgchris, commented:
<https://github.com/red/red/issues/3051#issuecomment-331079556>

    Quite possibly an error!—intentional or not—returned from this function could trigger the face's error visual state.

--------------------------------------------------------------------------------

On 2017-09-21T17:42:19Z, greggirwin, commented:
<https://github.com/red/red/issues/3051#issuecomment-331229789>

    It seems like you would have to write the func to go both directions, yes? And only applies to free-form input faces, correct? For other styles, the standard actors provide all we need. Maybe I don't see the value, compared to creating a style that uses change detection via standard actors.

--------------------------------------------------------------------------------

On 2017-09-21T21:59:09Z, rgchris, commented:
<https://github.com/red/red/issues/3051#issuecomment-331293604>

    It's not necessarily just free-form input, but even if it were the idea is that a face has enough information to format/validate its own unit of data.
    As to the actors—the closest would be **on-change**, though a more appropriate name would be **on-get** where the code is only ran when trying to obtain the face's value.

--------------------------------------------------------------------------------

On 2017-11-17T10:42:26Z, planetsizecpu, commented:
<https://github.com/red/red/issues/3051#issuecomment-345208966>

    @rgchris @greggirwin   I remember some old text-mode lang validations like this definitions:
    
    !temp value_int4,"INT-VALUE:",i4,########;0-99999999                    <-- digit mask & range
    !temp value_real8,"REAL-VALUE:",r8,######00.00;0.01-99999999.99  <-- also forced 0 filling places
    !temp value_alpha10,"TEXT-VALUE:",a10,u               <--  "u" forced uppercase "s"  password displaying "*"
    !temp value_alpha1,"Y/N:",a1,u;Y,N            <-- accepted values
    
    So simply! even you could define this in data dictionary for indexed files fields  
    old times where easy :-)

--------------------------------------------------------------------------------

On 2017-11-17T17:10:42Z, greggirwin, commented:
<https://github.com/red/red/issues/3051#issuecomment-345304479>

    We can currently use `extra` to hold information about validation and formatting, to experiment with. Masked input can be very helpful, but is hard to get right. e.g., do invalid keys just fail to do anything or, along the lines Chris is thinking, do we just change the state of the face(s) if the input doesn't match a format mask? And use them to trigger the ability to save data and such.

--------------------------------------------------------------------------------

On 2018-04-25T04:50:47Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3051#issuecomment-384159929>

    Following the introduction of the [Red REP repository for enhancements and wishes](https://gitter.im/red/red?at=5adfeed527c509a7744a3dc8), this issue is being closed.
    
    If you believe that your wish is still valid, please open a new issue for it in the new [red/REP repo](https://github.com/red/REP). It would help if you could include a link to this issue when opening an issue in the REP repository.

