
#3521: run-time lexer does not check Unicode numbers and crashes if > 10FFFFh
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3521>

### Expected behavior
escaped characters using Unicode hex numbers should be checked by the run-time lexer for validity (<= 10FFFFh) like the  compile-time lexer does
### Actual behavior
`#"^(110000)"` and higher crash the console
### Steps to reproduce the problem
type `#"^(110000)"` or higher in console
### Red and platform version
```
all
```


Comments:
--------------------------------------------------------------------------------

On 2018-08-27T20:14:23Z, endo64, commented:
<https://github.com/red/red/issues/3521#issuecomment-416353463>

    It crashes only on GUI console, not on CLI console (tested on Win10 x64)

--------------------------------------------------------------------------------

On 2018-08-28T12:07:11Z, meijeru, commented:
<https://github.com/red/red/issues/3521#issuecomment-416559816>

    Strange, because it uses `%lexer.red` -- which omits the test -- and I suppose this is also used by CLI.

