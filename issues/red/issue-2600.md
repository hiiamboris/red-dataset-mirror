
#2600: Hexadecimal number representation is recognized also at the beginning of the word
================================================================================
Issue is closed, was reported by Oldes and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2600>

```
>> EChat: 1
== 1
>> EChat
== 1
>> print EChat
236
== 1
```
It would be better to test, if there is one of value separator chars following after the `h`.


Comments:
--------------------------------------------------------------------------------

On 2017-04-20T11:43:02Z, Oldes, commented:
<https://github.com/red/red/issues/2600#issuecomment-295700278>

    Affects both Red and Red/System... interpreted and compiled.

--------------------------------------------------------------------------------

On 2017-04-20T11:53:55Z, Oldes, commented:
<https://github.com/red/red/issues/2600#issuecomment-295704170>

    It is interesting that `expand-string` in `loader.r` script keeps it ok.. it is replaced somewhere later.

--------------------------------------------------------------------------------

On 2017-04-20T12:02:47Z, Oldes, commented:
<https://github.com/red/red/issues/2600#issuecomment-295707586>

    So the compiler may be fixed by removing [this rule in the `lexer.r`](https://github.com/red/red/blob/master/lexer.r#L482) as the loader converts all hex to numbers anyway.

