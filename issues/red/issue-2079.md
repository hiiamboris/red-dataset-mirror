
#2079: FOREACH on IMAGE! crashes console
================================================================================
Issue is closed, was reported by rebolek and has 4 comment(s).
[type.bug] [status.resolved]
<https://github.com/red/red/issues/2079>

`foreach` on `image!` type works fine in Rebol, however it crashes Red's console.



Comments:
--------------------------------------------------------------------------------

On 2016-06-29T07:17:27Z, qtxie, commented:
<https://github.com/red/red/issues/2079#issuecomment-229275985>

    ```
    x: make image! 2x2
    foreach p x [probe p]
    ```
    
    Output in R2:
    
    ```
    #"^@"
    #"^@"
    #"^@"
    #"^@"
    ```
    
    In R3: 
    
    ```
    0.0.0.255
    255.0.0.0
    0.255.0.0
    0.0.255.0
    ```
    
    Both are not right for me.

--------------------------------------------------------------------------------

On 2016-06-30T07:33:59Z, rebolek, commented:
<https://github.com/red/red/issues/2079#issuecomment-229582296>

    @qtxie I used the loop for `poke` in Rebol, which works fine. `probe` should return pixel value IMO, like R3 that works fine for me:
    
    ```
    >> x: make image! 2x2 foreach p x [probe p]
    0.0.0.0
    0.0.0.0
    0.0.0.0
    0.0.0.0
    
    >> x: make image! 2x2 foreach p x [p: random 255.255.255 probe p]
    6.100.228
    11.147.245
    173.186.194
    222.56.115
    ```

