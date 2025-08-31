
#3193: VIEW: field/text does not display any-string! but only string!
================================================================================
Issue is closed, was reported by Oldes and has 10 comment(s).
[type.wish] [status.reviewed]
<https://github.com/red/red/issues/3193>

### Expected behavior

There should be visible content in the field even when `file!` or other `string!` based datatypes are used for field's `text` value.

### Actual behavior

Content is visible only when `string!` type is used.

### Steps to reproduce the problem

```
view/no-wait [f: field]
f/text: what-dir
probe f           ;- you may notice that f/text is holding a value of file! type 
do-events         ;- but the field appears to be empty
```

### Red version and build date, operating system with version.

0.6.3


Comments:
--------------------------------------------------------------------------------

On 2018-01-10T13:16:43Z, dockimbel, commented:
<https://github.com/red/red/issues/3193#issuecomment-356599275>

    Agreed, the current implementation for `/text` is minimal, extending it to `any-string!` is welcome.

--------------------------------------------------------------------------------

On 2018-01-10T14:14:47Z, meijeru, commented:
<https://github.com/red/red/issues/3193#issuecomment-356614018>

    A simple `to-string` would perhaps be enough??

--------------------------------------------------------------------------------

On 2018-01-10T14:36:26Z, dockimbel, commented:
<https://github.com/red/red/issues/3193#issuecomment-356620281>

    That's expensive, and that would reset the ownership flag of the series. A `as-string` would be way more efficient, but may not be very clean.

--------------------------------------------------------------------------------

On 2018-01-10T16:13:57Z, meijeru, commented:
<https://github.com/red/red/issues/3193#issuecomment-356651298>

    Does `as-string` reset anything else than the type bits in the value slot? If not, it looks clean enough to me.

--------------------------------------------------------------------------------

On 2018-04-25T06:38:30Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3193#issuecomment-384176487>

    Following the introduction of the [Red REP repository for enhancements and wishes](https://gitter.im/red/red?at=5adfeed527c509a7744a3dc8), this issue is being closed.
    
    If you believe that your wish is still valid, please open a new issue for it in the new [red/REP repo](https://github.com/red/REP). It would help if you could include a link to this issue when opening an issue in the REP repository.

