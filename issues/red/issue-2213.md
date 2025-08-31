
#2213: INSERT in PARSE cannot insert word’s value, insert word’s name instead
================================================================================
Issue is closed, was reported by rebolek and has 4 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/2213>

```
red>> value: "1234"
== "1234"
red>> string: "abcd"
== "abcd"
red>> parse string [insert value]
== false
red>> string
== "valueabcd"
```



Comments:
--------------------------------------------------------------------------------

On 2016-09-07T04:53:58Z, Zamlox, commented:
<https://github.com/red/red/issues/2213#issuecomment-245174802>

    it can insert the value of an evaluated expression:
    
    ```
    red>> parse string [insert (value)]
    == false
    red>> string
    == "1234abcd"
    ```

--------------------------------------------------------------------------------

On 2017-02-19T06:57:53Z, dockimbel, commented:
<https://github.com/red/red/issues/2213#issuecomment-280900631>

    For the sake of performance, I will add this ability to `insert` and `change`, as it will be orders of magnitude faster than going through the evaluation of a paren expression.

