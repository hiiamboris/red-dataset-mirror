
#3427: `parse/part` meets `end` = strange behavior
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/3427>

### Expected behavior
```
>> parse/part %234 ["23" thru [end]] 3
== true
>> parse/part %234 ["23" to [end]] 3
== true
```
### Actual behavior
(`== true` cases are purely for comparison and are expected)
```
>> parse %234 ["23" thru [end]]
== true
>> parse/part %234 ["23" thru ["4" end]] 3
== true
>> parse/part %234 ["23" thru [end]] 100
== true
>> parse/part %234 ["23" thru [end]] 3
== false
```
Somehow it works without them brackets...
```
>> parse/part %234 ["23" thru [end]] 1
== true
>> parse/part %234 ["23" thru [end]] 2
== true
>> parse/part %234 ["23" thru [end]] 3
== false
>> parse/part %234 ["23" thru [end]] 4
== true
>> parse/part %234 ["23" thru end] 3
== true
>> parse/part %234 ["23" to [end]] 2
== true
>> parse/part %234 ["23" to [end]] 3
== false
>> parse/part %234 ["23" to [end]] 4
== true
>> parse/part %234 ["23" to end] 3
== true
```

### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 750 date: 12-Jun-2018/15:07:14 commit: #e62b63d51cdc5d5f6033eb3fa366fd94be0b2deb ]
PLATFORM: [ name: "Windows 7 Service Pack 1" OS: 'Windows arch: 'x86-64 version: 6.1.1 build: 7601 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2018-06-17T11:57:04Z, endo64, commented:
<https://github.com/red/red/issues/3427#issuecomment-397873893>

    This happens only if `part` is equal to the length of the given string:
    
    ```
    >> parse/part "12" ["1" to [end]] 1
    == true
    >> parse/part "12" ["1" to [end]] 2
    == false
    >> parse/part "12" ["1" to [end]] 3
    == true
    >> parse/part "12" ["1" to [end]] 4
    == true
    ```
    
    Works for block parsing:
    ```
    >> parse/part [a b] ['a 'b to [end]] 2
    == true
    ```

--------------------------------------------------------------------------------

On 2023-02-18T15:40:14Z, hiiamboris, commented:
<https://github.com/red/red/issues/3427#issuecomment-1435702387>

    I was checking a recent [commit](https://github.com/red/red/commit/1ea076c4177b31897663433490c45049f1e93045) and found more:
    ```
    >> parse "abcdef" [to [end] e:] 4 e
    == ""
    >> parse/part "abcdef" [to [end] e:] 4 e
    == "ef"
    >> parse/part "abcdef" [to end e:] 4 e
    == ""
    >> parse/part "abcdef" [any skip e:] 4 e
    == "f"
    ```
    4th case is a regression from early August, while 3rd case is from this commit
    
    (but root problem - lack of abstraction, see https://github.com/red/REP/issues/97)
    
    Ready test script:
    ```
    Red []
    prin parse      "abcdef" [to [end] e:] 4 probe e
    prin parse/part "abcdef" [to [end] e:] 4 probe e
    prin parse/part "abcdef" [to  end  e:] 4 probe e
    prin parse/part "abcdef" [any skip e:] 4 probe e
    ```

