
#3855: Syntax Error: invalid binary!
================================================================================
Issue is closed, was reported by jefurry and has 8 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/3855>

**Describe the bug**
Syntax Error: invalid binary! at "2#{0000 1111}".

**Expected behavior**
for Rebol:
```
>> 16#{12 34}
== #{1234}

>> 64#{abcd efgh}
== #{69B71D79F821}

>> 2#{0000 1111}
== #{0F}
```

for Red:
```
>> 16#{12 34}
== #{1234}

>> 64#{abcd efgh}
== #{69B71D79F821}

>> 2#{0000 1111}
*** Syntax Error: invalid binary! at "2#{0000 1111}"
*** Where: do
*** Stack: load
>>
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for macOS built 22-Nov-2018/8:40:38+08:00 commit #755eb94
```



Comments:
--------------------------------------------------------------------------------

On 2019-04-21T09:30:20Z, qtxie, commented:
<https://github.com/red/red/issues/3855#issuecomment-485238053>

    The lexer only allows separate each **byte** by spaces. That why `2#{0000 1111}` throw an error.

--------------------------------------------------------------------------------

On 2019-04-21T09:50:31Z, jefurry, commented:
<https://github.com/red/red/issues/3855#issuecomment-485239238>

    @qtxie For binary, it is intuitive to separate by half-byte.

--------------------------------------------------------------------------------

On 2019-04-21T10:14:55Z, 9214, commented:
<https://github.com/red/red/issues/3855#issuecomment-485240523>

    Both R2 and R3 support this, so it makes sense to relax lexing rules a bit.

--------------------------------------------------------------------------------

On 2019-04-21T18:42:30Z, meijeru, commented:
<https://github.com/red/red/issues/3855#issuecomment-485273409>

    Not trivial, but doable.

