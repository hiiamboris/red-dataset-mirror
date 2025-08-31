
#5002: (Big) money overflow on rounding
================================================================================
Issue is open, was reported by hiiamboris and has 10 comment(s).
[type.review]
<https://github.com/red/red/issues/5002>

**Describe the bug**

This looks like some limitation of the implementation:
```
>> mold/all round/to $45678901234567.89012 $0.001
== "$45678901234567.89000"
>> mold/all round/to $45678901234567.89012 $0.0001
*** Script Error: money! overflow/underflow
*** Where: round
*** Stack:  

>> mold/all round/to $45678901234567.89012 $0.00001
*** Script Error: money! overflow/underflow
*** Where: round
*** Stack:  

>> mold/all round/to $12345678901234567.89012 $0.1
*** Script Error: money! overflow/underflow
*** Where: round
*** Stack:  
```

**Expected behavior**

All of the above should be valid operations.

**Platform version**
```
Red 0.6.4 for Windows built 6-Nov-2021/19:36:18+03:00  commit #30e5312
```



Comments:
--------------------------------------------------------------------------------

On 2021-11-29T18:16:10Z, greggirwin, commented:
<https://github.com/red/red/issues/5002#issuecomment-981891288>

    Very low priority IMO. We can notes these as current limitations. Even at the scale of the global economy, these should not be showstoppers.

--------------------------------------------------------------------------------

On 2021-11-29T18:51:51Z, hiiamboris, commented:
<https://github.com/red/red/issues/5002#issuecomment-981917674>

    I agree on low priority, but don't think global economy scale is needed here.
    What if banksters attack you?
    
    | ![](https://i.gyazo.com/9bddc0d274a322198716faec0f39997d.png) | ![](https://i.gyazo.com/3223c4f2ba5cfcd1676cea8482cb8144.png) |
    |-|-|
    
    At 3e14:1 rate, 1M US$ would be 3e20 Z$. Red money is limited under 1e18.

--------------------------------------------------------------------------------

On 2021-11-29T21:11:57Z, greggirwin, commented:
<https://github.com/red/red/issues/5002#issuecomment-982027107>

    Virtual economies can suffer the same problems. 

--------------------------------------------------------------------------------

On 2021-11-29T21:13:10Z, greggirwin, commented:
<https://github.com/red/red/issues/5002#issuecomment-982027937>

    > Red money is limited under 1e18.
    
    _Currently_, yes. :^)

--------------------------------------------------------------------------------

On 2021-11-30T11:56:16Z, dockimbel, commented:
<https://github.com/red/red/issues/5002#issuecomment-982566891>

    1e18 as upper limit is far enough to cover all use-cases for which `money!` has been designed for.

