
#3169: WISH: REACTOR mezzanine with /DEEP refinement
================================================================================
Issue is closed, was reported by 9214 and has 4 comment(s).
[type.wish]
<https://github.com/red/red/issues/3169>

### What we have
```Red
>> r: make reactor! [x: 1]
== make object! [
    x: 1
]
>> r: make deep-reactor! [x: [1 2 3]]
== make object! [
    x: [1 2 3]
]
```
### What would be nice to have
```Red
>> r: reactor [x: 1]
== make object! [
    x: 1
]
>> r: reactor/deep [x: [1 2 3]]
== make object! [
    x: [1 2 3]
]
```


Comments:
--------------------------------------------------------------------------------

On 2017-12-28T09:06:18Z, greggirwin, commented:
<https://github.com/red/red/issues/3169#issuecomment-354255182>

    Nice idea! Would `deep-reactor` be better than the refinement approach in this case? Hmmm.

--------------------------------------------------------------------------------

On 2018-04-25T06:36:56Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3169#issuecomment-384176206>

    Following the introduction of the [Red REP repository for enhancements and wishes](https://gitter.im/red/red?at=5adfeed527c509a7744a3dc8), this issue is being closed.
    
    If you believe that your wish is still valid, please open a new issue for it in the new [red/REP repo](https://github.com/red/REP). It would help if you could include a link to this issue when opening an issue in the REP repository.

