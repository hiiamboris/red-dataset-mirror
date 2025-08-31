
#2567: 1.#NaN tests as negative
================================================================================
Issue is closed, was reported by greggirwin and has 0 comment(s).
<https://github.com/red/red/issues/2567>

```
>> negative? 1.#NaN
== true
>> positive? 1.#NaN
== false
>> zero? 1.#NaN
== true
```
See also #847 


