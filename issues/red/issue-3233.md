
#3233: WISH: Add `float!` to `<begin>` and `<sweep>` parameters of `DRAW`'s arc
================================================================================
Issue is closed, was reported by toomasv and has 4 comment(s).
[type.wish]
<https://github.com/red/red/issues/3233>

### Expected behavior
`DRAW` `arc`'s angles can be specified as `float!` or `integer!` (like `SHAPE`'s `arc`)
### Actual behavior
`DRAW` `arc`'s angles can be specified only as `integer!`
### Steps to reproduce the problem
```
>> view [box 150x150 draw [arc 50x50 50x50 0 11.25]]
*** Script Error: invalid Draw dialect input at: [11.25]
*** Where: ???
```
### Red version and build date, operating system with version.
build: 22-Feb-2018
W10Pro


Comments:
--------------------------------------------------------------------------------

On 2018-02-23T21:20:53Z, rebolek, commented:
<https://github.com/red/red/issues/3233#issuecomment-368141839>

    Actually, support `float!` everywhere in Draw, where `integer!` is currently used only.

--------------------------------------------------------------------------------

On 2018-04-25T06:39:32Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3233#issuecomment-384176685>

    Following the introduction of the [Red REP repository for enhancements and wishes](https://gitter.im/red/red?at=5adfeed527c509a7744a3dc8), this issue is being closed.
    
    If you believe that your wish is still valid, please open a new issue for it in the new [red/REP repo](https://github.com/red/REP). It would help if you could include a link to this issue when opening an issue in the REP repository.

