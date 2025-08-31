
#3236: WISH: Push `line-width` in DRAW `push` block
================================================================================
Issue is closed, was reported by toomasv and has 2 comment(s).
[type.wish]
<https://github.com/red/red/issues/3236>

### Expected behavior
`push` block respects `line-width`-pushing and restores previous `line-width` after `push`-block.
### Actual behavior
`line-width` is not pushed. I.e. Setting `line-width` inside `push`-block affects `line-width` after `push`-block.
### Steps to reproduce the problem
```
view [box 300x300 draw [
   line-width 1 push [
      line-width 10 pen red line 65x75 187x166
   ] line 109x37 244x140
]]
```
### Red version and build date, operating system with version.
Build: date: 22-Feb-2018/14:54:23+02:00
W10Pro


Comments:
--------------------------------------------------------------------------------

On 2018-04-25T06:39:46Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3236#issuecomment-384176730>

    Following the introduction of the [Red REP repository for enhancements and wishes](https://gitter.im/red/red?at=5adfeed527c509a7744a3dc8), this issue is being closed.
    
    If you believe that your wish is still valid, please open a new issue for it in the new [red/REP repo](https://github.com/red/REP). It would help if you could include a link to this issue when opening an issue in the REP repository.

