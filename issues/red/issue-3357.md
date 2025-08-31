
#3357: INSERT in PARSE inserts UNSET rather than WORD! from PAREN! expression
================================================================================
Issue is closed, was reported by 9214 and has 4 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/3357>

### Expected behavior
```Red
>> parse x: [][insert ('foo)]
== true
>> x
== [foo]
>> parse x: [][insert (quote foo)]
== true
>> x
== [foo]
```
### Actual behavior
```Red
>> parse x: [][insert ('foo)]
== true
>> x
== [unset]
>> parse x: [][insert (quote foo)]
== true
>> x
== [unset]
```
### Steps to reproduce the problem
See above.
### Red and platform version
```
Red 0.6.3 for Windows built 18-Apr-2018/0:24:50+05:00)
```


Comments:
--------------------------------------------------------------------------------

On 2019-01-06T21:22:02Z, meijeru, commented:
<https://github.com/red/red/issues/3357#issuecomment-451776031>

    The problem is more general: `insert` will insert the value of the following expression if its result is not a `word!` value. Try `parse x: [ ][insert foo]` which should be equivalent to your code, since `('foo) == foo`.
    This gives an error. The problem seems to be that words in that position are interpreted as rules. This needs to be looked at seriously by @dockimbel I suppose.

--------------------------------------------------------------------------------

On 2019-07-26T21:05:35Z, dockimbel, commented:
<https://github.com/red/red/issues/3357#issuecomment-515599433>

    @meijeru See #2213.

