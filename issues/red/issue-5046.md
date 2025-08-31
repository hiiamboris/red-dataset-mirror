
#5046: `trim/tail` on `binary!` is incorrect, when there are just nulls
================================================================================
Issue is closed, was reported by Oldes and has 10 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5046>

There seems to 1-off error when using `/tail` on binary:
```red
trim/tail #{000000}
== #{00} ;<-- WRONG, should be #{}
```
also:
```red
>> head trim/tail probe at #{11000000} 1
#{11000000}
== #{11} ;<- OK
>> head trim/tail probe at #{11000000} 2
#{000000}
== #{1100} ;<- WRONG, should be #{11}
>> head trim/tail probe at #{11000000} 3
#{0000}
== #{110000}  ;<- WRONG, should be #{1100}
>> head trim/tail probe at #{11000000} 4
#{00}
== #{11000000}  ;<- WRONG, should be #{110000}
>> head trim/tail probe at #{11000000} 5
#{}
== #{11000000} ;<- OK
``` 

`trim/head` is ok:
```red
>> trim/head #{000000}
== #{}
```


Comments:
--------------------------------------------------------------------------------

On 2022-01-21T07:13:11Z, Oldes, commented:
<https://github.com/red/red/issues/5046#issuecomment-1018242876>

    Related to: https://github.com/red/red/issues/3663

--------------------------------------------------------------------------------

On 2022-03-03T13:11:29Z, dockimbel, commented:
<https://github.com/red/red/issues/5046#issuecomment-1058027498>

    > trim/tail #{000000}
    > == #{00} ;<-- WRONG, should be #{}
    
    Fixed by commit: https://github.com/red/red/commit/e707df880de6c9c3652886262eeb200e01f3a7b2
    
    > >> head trim/tail probe at #{11000000} 2
    > #{000000}
    > == #{1100} ;<- WRONG, should be #{11}
    
    This looks fine to me. `trim/tail` should not go back past the index you provide.

--------------------------------------------------------------------------------

On 2022-03-03T13:55:15Z, Oldes, commented:
<https://github.com/red/red/issues/5046#issuecomment-1058064729>

    It's not fine.. it should remove all 3 bytes visible from the `probe`, not just 2.

--------------------------------------------------------------------------------

On 2022-03-03T18:55:05Z, greggirwin, commented:
<https://github.com/red/red/issues/5046#issuecomment-1058381082>

    ```
    >> head trim at #{11000000} 2
    == #{11}
    >> head trim/tail at #{11000000} 2
    == #{1100}
    ```

--------------------------------------------------------------------------------

On 2022-03-11T15:04:13Z, dockimbel, commented:
<https://github.com/red/red/issues/5046#issuecomment-1065196176>

    You're right, I've overlooked it.

