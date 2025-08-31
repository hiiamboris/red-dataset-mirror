
#2634: Continue causes infinitive loop on forall
================================================================================
Issue is closed, was reported by maximvl and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2634>

```
>> repeat i 5 [ if 3 = i [ continue ] print i ]
1
2
4
5
>> x: [1 2 3 4 5]
== [1 2 3 4 5]
>> forall x [ if x/1 = 3 [ continue ] probe x/1 ]
1
2
^C
```

In `repeat` loop `continue` works as expected, but in `forall` it doesn't skip the value and loop repeats it, causing infinitive loop.


Comments:
--------------------------------------------------------------------------------

On 2017-07-28T12:14:35Z, dockimbel, commented:
<https://github.com/red/red/issues/2634#issuecomment-318636650>

    It seems to be working fine now:
    ```
    >> x: [1 2 3 4 5]
    == [1 2 3 4 5]
    >> forall x [ if x/1 = 3 [ continue ] probe x/1 ]
    1
    2
    4
    5
    == 5
    ```

