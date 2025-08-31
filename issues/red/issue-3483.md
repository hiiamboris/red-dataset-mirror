
#3483: LIT-WORD! does not decay to WORD! with PARSE CHANGE
================================================================================
Issue is closed, was reported by 9214 and has 2 comment(s).
<https://github.com/red/red/issues/3483>

### Expected behavior
Matched input is substituted with `word!` value.
### Actual behavior
Matched input is substituted with `lit-word!` value.

### Steps to reproduce the problem
```red
>> get also 'x parse x: [a b c][skip change 'b 'x to end]
== [a 'x c]
```
### Red and platform version
Latest, W10.
```
Red 0.6.3 for Windows built 20-Jul-2018/7:47:36+05:00 commit #c5a2921
```


Comments:
--------------------------------------------------------------------------------

On 2019-11-25T12:24:01Z, 9214, commented:
<https://github.com/red/red/issues/3483#issuecomment-558132349>

    In fact, any value (except for `word!` or `paren!`) is treated literally.
    
    I don't have any strong opinions about this, and frankly cannot remember why I filed the ticket. The current behavior is consistent with `insert` (except for https://github.com/red/red/issues/4153).
    
    Handling of extra cases, if desired, can be tucked at the end of these two `switch`es, for `insert` and `change`, respectively:
    
    https://github.com/red/red/blob/640c00ed5792602d43c06f828860df478ef800b9/runtime/parse.reds#L1648
    
    https://github.com/red/red/blob/640c00ed5792602d43c06f828860df478ef800b9/runtime/parse.reds#L1701
    
    Feel free to reopen this issue if you deem it relevant.

