
#4400: MAKE-DIR fails silently if it has not a permission to make a directory
================================================================================
Issue is closed, was reported by rebolek and has 4 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/4400>

`make-dir` help text states that there is no error when creating already existing directory, which is a nice feature, however, there's also no error when creating a directory is not successful due to lack of access rights.

# Example
```
>> make-dir %/asdf
== %/asdf/
>> find read %/ %asdf
== none
```

# Expected behavior

I would expect an error, something like `cannot create directory: access denied`.

# Platform

```
>> about
Red 0.6.4 for Linux built 8-Apr-2020/13:22:20+02:00
```



Comments:
--------------------------------------------------------------------------------

On 2020-04-14T16:37:02Z, hiiamboris, commented:
<https://github.com/red/red/issues/4400#issuecomment-613549275>

    Confirmed on W7.

--------------------------------------------------------------------------------

On 2020-04-14T21:03:08Z, greggirwin, commented:
<https://github.com/red/red/issues/4400#issuecomment-613680144>

    I agree on the expected behavior.

