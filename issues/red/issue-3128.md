
#3128: Problem with functions from within objects
================================================================================
Issue is closed, was reported by toomasv and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3128>

### Expected behavior
```
n: object [l: none x: none asc: has [a l][l: copy [] a: x while [a][insert l a a: a/x] copy l]]
n1: make n [l: "1" x: none]
n2: make n [l: "2" x: n1]
foreach y n2/asc [probe y/l]
"1"
== "1"
```
### Actual behavior
```
n: object [l: none x: none asc: has [a l][l: copy [] a: x while [a][insert l a a: a/x] copy l]]
n1: make n [l: "1" x: none]
n2: make n [l: "2" x: n1]
foreach y n2/asc [probe y/l]
*** Script Error: invalid argument: make object! [l: "1" x: none asc: func [/local a l][l: copy [] a: x while [a] [insert l a a: a/x] copy l]]
*** Where: foreach
*** Stack:  
```
### Steps to reproduce the problem
As above
### Red version and build date, operating system with version.
0.6.3 
```
>> system/build
== make object! [
    date: 23-Nov-2017/9:38:11+02:00
    config: make object! [
        config-name: 'Windows
        OS: 'Windows
        OS-version: 0
        [...]
```
### Additional notes
```
>> type? n2/asc
== block!
```
Whith `copy` and `to-block` the function works:
```
>> foreach y copy n2/asc [probe y/l]
"1"
== "1"
>> foreach y to-block n2/asc [probe y/l]
"1"
== "1"
```
Also, it works in global scope:
```
n: object [l: none x: none]
asc: func [n /local a l][l: copy [] a: n/x while [a][insert l a a: a/x] copy l]
n1: make n [l: "1" x: none]
n2: make n [l: "2" x: n1]
>> foreach y asc n2 [probe y/l]
"1"
== "1"
```
But not in another object:
```
>> m: object [asc: func [n /local a l][l: copy [] a: n/x while [a][insert l a a: a/x] copy l]]
== make object! [
    asc: func [n /local a l][l: copy [] a: n/x while [a] [insert l a a: a/x] copy l]
]
>> foreach y m/asc n2 [probe y/l]
*** Script Error: invalid argument: make object! [l: "1" x: none]
*** Where: foreach
*** Stack:
``` 
And worst, while trying to set a word to the output of `n2/asc` the console crashes.


Comments:
--------------------------------------------------------------------------------

On 2017-12-02T18:56:02Z, toomasv, commented:
<https://github.com/red/red/issues/3128#issuecomment-348712246>

    Seems to be some problem with type recognition. If I add a function returning `asc` length, and try to assign it to a word, console crashes. Without setting integer is correctly returned. Crashing problem is avoided by explicitly converting the return value to integer (or by adding 0 to the return value):
    ```
    n: object [l: none x: none asc: has [a l][l: copy [] a: x while [a][insert l a a: a/x] copy l] h: does [length? asc]]
    n1: make n [l: "1" x: none]
    n2: make n [l: "2" x: n1]
    n2/h
    == 1
    g: to-integer n2/h
    == 1
    ; g: n1/h ;-- crashes the console
    ```

--------------------------------------------------------------------------------

On 2017-12-28T16:00:11Z, maximvl, commented:
<https://github.com/red/red/issues/3128#issuecomment-354310669>

    Hi guys I have this issue, do you think it's related?
    ```
    >> system/build/date
    == 27-Dec-2017/13:48:35+01:00
    >> week: make object! [
            conversions: #(
                s: 604800.0
            )
            base-unit: 's
            base-unit-value: func [][
                probe select/case conversions base-unit 
                if base-unit [select/case conversions base-unit]
            ]
        ]
    >> day: make object! [
            conversions: #(
                s: 86400.0
            )
            base-unit: 's
            base-unit-value: func [][
                probe select/case conversions base-unit 
                if base-unit [select/case conversions base-unit]
            ]
        ]
    >> week/base-unit-value
    604800.0
    == 604800.0
    >> day/base-unit-value
    86400.0
    == 86400.0
    >> week/base-unit-value / day/base-unit-value
    604800.0
    86400.0
    == 1.0 ;; wat? should be 7
    >> a: week/base-unit-value
    604800.0
    
    *** Runtime Error 1: access violation
    *** at: 08074D8Fh
    ```

--------------------------------------------------------------------------------

On 2017-12-28T19:29:30Z, greggirwin, commented:
<https://github.com/red/red/issues/3128#issuecomment-354343811>

    Seems to be.
    ```
    >> week/base-unit-value / to integer! day/base-unit-value
    604800.0
    86400.0
    == 7.0
    ```

