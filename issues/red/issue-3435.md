
#3435: 1.#INF and 1.#NaN values corrupts percentage value scanner
================================================================================
Issue is closed, was reported by Oldes and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3435>

Currently:
```
>> 10%
== 10%
>> 1%
== 1%
>> 1.#NAN
== 1.#NaN
>> 1%
== 1.#NaN    ;<----------- WRONG
>> 1%
== 1.#NaN    ;<----------- WRONG
>> 1.#inf
== 1.#INF
>> 1%
== 1.#INF    ;<----------- WRONG
>> about
Red 0.6.3 for Windows built 18-Jun-2018/18:11:17+05:00 commit #6753157
```


Comments:
--------------------------------------------------------------------------------

On 2018-06-22T14:31:04Z, meijeru, commented:
<https://github.com/red/red/issues/3435#issuecomment-399462482>

    Smells of leakage.

--------------------------------------------------------------------------------

On 2018-06-22T15:50:02Z, greggirwin, commented:
<https://github.com/red/red/issues/3435#issuecomment-399488469>

    It looks like the problem persists until you use a % value that is not just a single digit. i.e. 1% - 9% suffer from it, but any 2 digit number, or decimal, clears it.

