
#3369: accessing series over the board
================================================================================
Issue is open, was reported by hiiamboris and has 18 comment(s).
[type.bug]
<https://github.com/red/red/issues/3369>

### Test script
```
a: "12345678"
b: skip a 6
c: tail a
d: skip a 2
remove/part a 4
b
copy b
c
copy c
d
copy/part d b
clear a
d
copy d
copy/part d b
```
### Expected behavior
R2 crashes, but R3 got it right:
```
>> a: "12345678"
== "12345678"
>> b: skip a 6
== "78"
>> c: tail a
== ""
>> d: skip a 2
== "345678"
>> remove/part a 4
== "5678"
>> b
== ""
>> copy b
== ""
>> c
== ""
>> copy c
== ""
>> d
== "78"
>> copy/part d b
== "78"
>> clear a
== ""
>> d
== ""
>> copy d
== ""
>> copy/part d b
== ""
```
### Actual behavior
```
>> a: "12345678"
== "12345678"
>> b: skip a 6
== "78"
>> c: tail a
== ""
>> d: skip a 2
== "345678"
>> remove/part a 4
== "5678"
>> b
== ""
>> copy b
== "56"
>> c
== ""
>> copy c
== "5678"
>> d
== "34"
>> copy/part d b
== "3456"
>> clear a
== ""
>> d
== ""
>> copy d
== "12"
>> copy/part d b
== "3456"
```
### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 688 date: 5-May-2018/11:50:50 commit: #9ce2aacce1509943ac11efa3b13457e8a66f03b4 ]
PLATFORM: [ name: "Windows 7 Service Pack 1" OS: 'Windows arch: 'x86-64 version: 6.1.1 build: 7601 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2018-05-07T17:18:37Z, greggirwin, commented:
<https://github.com/red/red/issues/3369#issuecomment-387137435>

    https://github.com/bitbegin/red/commit/c02cf06d2fe1e35d150021e293859e673b39bbea doesn't produce your expected output @hiiamboris. We may need to clarify each piece, to make sure we don't introduce regressions as well. Can we also name this ticket to include `series` and `copy` so we know exactly where the problem lies?

--------------------------------------------------------------------------------

On 2018-05-07T17:31:31Z, greggirwin, commented:
<https://github.com/red/red/issues/3369#issuecomment-387141335>

    Ah, not merged yet. My oversight. 
    
    @bitbegin, could you sync fresh with the main Red repo master, so your small change doesn't involve 250+ commits in the merge?

--------------------------------------------------------------------------------

On 2018-05-07T17:33:33Z, greggirwin, commented:
<https://github.com/red/red/issues/3369#issuecomment-387142058>

    Nevermind, looks like already done in the PR. Thanks! 

--------------------------------------------------------------------------------

On 2018-05-07T17:40:01Z, greggirwin, commented:
<https://github.com/red/red/issues/3369#issuecomment-387144175>

    Merged. Looks closer to expected output. Only the `copy/part d b` tests are still wrong.

--------------------------------------------------------------------------------

On 2018-05-07T17:41:55Z, greggirwin, commented:
<https://github.com/red/red/issues/3369#issuecomment-387144737>

    ```
    >> a
    == ""
    >> head a
    == ""
    >> b
    == ""
    >> head b
    == ""
    >> c
    == ""
    >> head c
    == ""
    >> d
    == ""
    >> head d
    == ""
    >> copy d
    == ""
    >> copy/part d a
    == "56"
    >> copy/part d b
    == "7856"
    >> copy/part d c
    == "785678"
    >> copy/part d d
    == ""
    ```

--------------------------------------------------------------------------------

On 2018-05-10T17:43:16Z, hiiamboris, commented:
<https://github.com/red/red/issues/3369#issuecomment-388128962>

    Let's continue with the other series funcs:
    
    #### setup
    ```
    s: does [a: copy "12345678" b: skip a 2 c: skip a 6 remove/part a 4] s
    
    >> ? a ? b ? c
    A is a string! value: "5678"
    B is a string! value: "78"
    C is a string! value: ""
    ```
    
    ### Results:
    #### uncalled for tail extension: extra "56"
    ```
    >> change c 1
    == ""
    >> b
    == "78561" ; R3: "781"
    >> a
    == "5678561" ; R3: "56781" 
    
    >> clear c
    == ""
    >> b
    == "7856" ; R3: "78"
    >> a
    == "567856" ; R3: "5678"
    
    >> remove c
    == ""
    >> b
    == "7856" ; R3: "78"
    >> a
    == "567856" ; R3: "5678"
    ```
    
    #### extra "5", or "85"?
    ```
    >> change/part c 99 -1
    == ""
    >> c
    == "9" ; R3: ""
    >> b
    == "78599" ; R3: "789" - I don't think this is right either
    ```
    
    #### I would rather expect b = "87", a = "5687"
    ```
    >> move b c
    == "78"
    >> b
    == "78"
    >> c
    == ""
    ```
    
    #### and here I'd expect b & a not change at all
    ```
    >> move c b
    == ""
    >> b
    == "77"
    >> c
    == ""
    ```
    
    #### inconsistent notion of "last"
    Should it be (none = last c) or rather (#"8" = take/last c) ? I vote for the second
    ```
    >> last c
    == #"8" ; R3: #"8"
    >> take/last c
    == none ; R3: #"8"
    >> b
    == "78" ; R3: "7"
    >> a
    == "5678" ; R3: "567"
    ```
    
    #### crash!
    ```
    >> insert c 1
    *** Runtime Error 1: access violation
    *** at: 76DAC30Bh
    ```
    R3:
    ```
    >> insert c 1
    == ""
    >> b
    == "781"
    >> a
    == "56781"
    ```

--------------------------------------------------------------------------------

On 2018-06-01T13:17:03Z, hiiamboris, commented:
<https://github.com/red/red/issues/3369#issuecomment-393877289>

    I asked the community's opinion about `change/part c 99 -1` behavior here
    :point_up: [May 31, 2018 9:36 PM](https://gitter.im/red/bugs?at=5b1040cb361a950a662f019b)
    The variant *first get back to series' tail, then move by -1 from the tail* is favored more for it's intuitivity. In this case `change/part c 99 -1` should result in `c = ""` and `a = "56799"`, `b = "799"`

--------------------------------------------------------------------------------

On 2018-06-01T15:04:40Z, toomasv, commented:
<https://github.com/red/red/issues/3369#issuecomment-393908934>

    Some problems with blocks also?!
    ```
    >> a: [1 2 3 4]
    == [1 2 3 4]
    >> c: at a 7
    == []
    >> change/part a [] 4 
    == []
    >> head a
    == []
    >> head c
    == []
    >> index? c
    == 5
    >> insert c [5 6]
    == []
    >> a
    == [5 6]
    >> c
    == []
    >> insert c [7 8 9]
    == [5 6] ; unexpected?! Why does it insert in `head c`?
    >> c
    == [6] 
    >> head c
    == [7 8 9 5 6]
    >> a
    == [7 8 9 5 6]
    ```

--------------------------------------------------------------------------------

On 2020-12-09T15:25:05Z, Oldes, commented:
<https://github.com/red/red/issues/3369#issuecomment-741842917>

    Here is my test case from current Red:
    ```red
    ; making a series with position past tail...
    >> a: [1 2 3 4]
    == [1 2 3 4]
    >> b: skip a 3
    == [4]
    >> remove/part a 3
    == [4]
    >> b
    == [] ;<--- looks empty
    >> empty? b
    == false ;<--- but its not?
    >> [] = b
    == false ;<--- b is past tail, so it's false, but should it be?
    ```

