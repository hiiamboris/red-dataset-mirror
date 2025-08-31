
#4092: FIND/same SELECT/same & PUT don't work with NaNs
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
[type.bug]
<https://github.com/red/red/issues/4092>

**Describe the bug**
```
>> nan1: 0.0 / 0
== 1.#NaN
>> nan2: sqrt -1
== 1.#NaN
>> same? nan1 nan1
== true
>> same? nan1 nan2
== false
>> b: reduce [nan1 1 nan2 2]
== [1.#NaN 1 1.#NaN 2]
>> h: make hash! b
== make hash! [1.#NaN 1 1.#NaN 2]
>> m: make map! b
== #(
    1.#NaN 1
    1.#NaN 2
)
>> select/same b nan1
== none
>> select/same b nan2
== none
>> select/same h nan1
== none
>> select/same h nan2
== none
>> select/same m nan1
== none
>> select/same m nan2
== none
```

**To reproduce**
```
nan1: 0.0 / 0
nan2: sqrt -1
same? nan1 nan1
same? nan1 nan2
b: reduce [nan1 1 nan2 2]
h: make hash! b
m: make map! b
select/same b nan1
select/same b nan2
select/same h nan1
select/same h nan2
select/same m nan1
select/same m nan2
```

**Expected behavior**

I believe `select/same .. nan1` should return `1` and `select/same .. nan2` - `2`. It'll be possible to abuse the containers to have multiple NaN "keys" with different payload ☺

`select` and `select/case` should return none (as they do).

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 1-Oct-2019/19:41:56+03:00 commit #2976655
```



Comments:
--------------------------------------------------------------------------------

On 2019-10-18T12:28:11Z, hiiamboris, commented:
<https://github.com/red/red/issues/4092#issuecomment-543715111>

    PUT has a problem with that too. It uses strict-equal comparison when searches for the key. So, using the `b`, `h`, `m` from above, we get:
    ```
    >> put b nan1 3
    >> put b nan1 4
    >> put b nan1 5
    >> b
    == [1.#NaN 1 1.#NaN 2 1.#NaN 3 1.#NaN 4 1.#NaN 5]
    
    >> put h nan1 3
    >> put h nan1 4
    >> put h nan1 5
    >> h
    == make hash! [1.#NaN 1 1.#NaN 2 1.#NaN 3 1.#NaN 4 1.#NaN 5]
    
    >> put m nan1 3
    >> put m nan1 4
    >> put m nan1 5
    >> m
    == #(
        1.#NaN 1
        1.#NaN 2
        1.#NaN 3
        1.#NaN 4
        1.#NaN 5
    )
    ```

--------------------------------------------------------------------------------

On 2020-07-09T18:43:48Z, hiiamboris, commented:
<https://github.com/red/red/issues/4092#issuecomment-656289807>

    Other problems of `find` and it's relatives: https://github.com/red/red/issues/4327 https://github.com/red/red/issues/4165

