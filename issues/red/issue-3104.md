
#3104: map: same date keys treated differently because of hidden timezone state
================================================================================
Issue is closed, was reported by akavel and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3104>

### Expected behavior
```
>> print [map/:d1 d1 == d2 map/:d2]
OK true OK
```

### Actual behavior
```
>> print [map/:d1 d1 == d2 map/:d2]
OK true none
```

### Steps to reproduce the problem
```
>> map: #()
== #()
>> d1: 18-Nov-2017
== 18-Nov-2017
>> map/:d1: 'OK
== OK
>> map
== #(
    18-Nov-2017 OK
)
>> d2: now/date
== 10-Nov-2017
>> d2/day: 18
== 18
>> print [map/:d1 d1 == d2 map/:d2]
OK true none
>> d3: now/utc/date
== 10-Nov-2017
>> d3/day: 18
== 18
>> map/:d3
== OK
>> repeat i 14 [print [pad i 4 pad system/catalog/accessors/date!/:i 10 pad pick d1 i 12 pick d2 i]]
1    date       18-Nov-2017  18-Nov-2017
2    year       2017         2017
3    month      11           11
4    day        18           18
5    zone       0:00:00      1:00:00
6    time       none         none
7    hour       0            1
8    minute     0            0
9    second     0.0          0.0
10   weekday    6            6
11   yearday    322          322
12   timezone   0:00:00      1:00:00
13   week       46           46
14   isoweek    46           46
```

### Red version and build date, operating system with version
red-063.exe, red-06nov17-bca8678.exe, Windows 10



Comments:
--------------------------------------------------------------------------------

On 2017-11-10T22:53:30Z, greggirwin, commented:
<https://github.com/red/red/issues/3104#issuecomment-343608320>

    Subtle differences we may want to doc on dates as well.
    ```
    >> dd: now
    == 10-Nov-2017/15:48:57-07:00
    >> ddd: now/date
    == 10-Nov-2017
    >> dddd: 10-nov-2017
    == 10-Nov-2017
    >> repeat i 14 [print [pad i 4 pad system/catalog/accessors/date!/:i 10 pad pick dd i 12 pad pick ddd i 12  pick dddd i]]
    1    date       10-Nov-2017  10-Nov-2017  10-Nov-2017
    2    year       2017         2017         2017
    3    month      11           11           11
    4    day        10           10           10
    5    zone       -7:00:00     none         none
    6    time       15:48:57     none         none
    7    hour       15           -7           0
    8    minute     48           0            0
    9    second     57.0         0.0          0.0
    10   weekday    5            5            6
    11   yearday    314          314          314
    12   timezone   -7:00:00     none         none
    13   week       45           45           45
    14   isoweek    45           45           45
                    now          now/date     10-Nov-2017
    ```

--------------------------------------------------------------------------------

On 2017-11-10T22:57:37Z, akavel, commented:
<https://github.com/red/red/issues/3104#issuecomment-343608962>

    - Notably, in \@greggirwin's example above, `now/date` vs. `10-Nov-2017` appear to have a different weekday! Is that correct?
    - Also, [per @dander's observation](https://gitter.im/red/red?at=5a062ede505b630c05ca6943), `map/(d2/date)` seems to strip timezone (?) and work again as expected:
    
          >> map/(d2/date)
          == OK

