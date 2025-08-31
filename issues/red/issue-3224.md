
#3224: Wish: Multiselection in `text-list`
================================================================================
Issue is closed, was reported by toomasv and has 2 comment(s).
[type.wish]
<https://github.com/red/red/issues/3224>

### Expected behavior
Shift-select selects consecutive indexes into block and returns it as `face/selected`.
Ctrl-select selects individual indexes into block and returns it as `face/selected`.
`event/picked` (which doesn't work right now) would return single index as integer.
`face/selected` might thus be integer or block.
### Actual behavior
Selecting `text-list` items doesn't react on `ctrl` and `shift` keys.
### Steps to reproduce the problem
### Red version and build date, operating system with version.
W10



Comments:
--------------------------------------------------------------------------------

On 2018-04-25T06:38:50Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3224#issuecomment-384176561>

    Following the introduction of the [Red REP repository for enhancements and wishes](https://gitter.im/red/red?at=5adfeed527c509a7744a3dc8), this issue is being closed.
    
    If you believe that your wish is still valid, please open a new issue for it in the new [red/REP repo](https://github.com/red/REP). It would help if you could include a link to this issue when opening an issue in the REP repository.

