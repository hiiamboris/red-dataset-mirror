
#3226: rejoin applies function to all occurencies of variable
================================================================================
Issue is closed, was reported by a-nick-fischer and has 4 comment(s).
<https://github.com/red/red/issues/3226>

It may be the expected behaivor, but its rather strange and undocumented.

### Expected behavior
```
i: "bla"
rejoin [i reverse i]    ; => "blaalb"
```
### Actual behavior
```
i: "bla"
rejoin [i reverse i]    ; => "albalb"
```
### Steps to reproduce the problem
See above.
### Red version and build date, operating system with version.
`Windows 10 x64`
`Red for Windows version 0.6.3 built 12-Aug-2017/21:38:44+02:00`


Comments:
--------------------------------------------------------------------------------

On 2018-02-18T12:37:51Z, 9214, commented:
<https://github.com/red/red/issues/3226#issuecomment-366513115>

    You're reversing string in-place, and this behavior is extensively documented both in Rebol and Red documentations. Use `copy` to achieve what you want:
    ```Red
    >> i: "bla"
    == "bla"
    >> rejoin [i reverse copy i]
    == "blaalb"
    ```

--------------------------------------------------------------------------------

On 2018-02-18T17:37:57Z, greggirwin, commented:
<https://github.com/red/red/issues/3226#issuecomment-366532721>

    We started adding "(modified)" to some doc strings, as an experiment (started with R2), to see if it helped. e.g. `sort` and `remove-each` have it today. The issue is that modifying is the case for many, maybe most, series args. It's not that we shouldn't include this info somewhere. Just a matter of whether it should be in the standard doc string or extended docs. Either way we need to defined a convention to keep it consistent.

