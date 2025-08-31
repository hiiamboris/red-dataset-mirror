
#3532: enbase/base problems with image! components - Error, GUI and CLI console crashes.
================================================================================
Issue is closed, was reported by gltewalt and has 6 comment(s).
<https://github.com/red/red/issues/3532>

### Expected behavior
Return the correct type. Throw error instead of crashing consoles.

### Actual behavior

Alpha channel:

```
>> img: make image! [100x100 128.24.90.1]
== make image! [100x100 #{
    80185A80185A80185A80185A80185A80185A80185A80185A80185A80185A
    80185A80185A80185A80185A80185A80185A80185A80185A80185A80185A

>> type? load form enbase/base img/alpha 64
== word!

>> type? load form enbase/base img/alpha 58
*** Syntax Error: invalid integer! at "3RNjUkKqqjDMEfyxSGb7aesbxdCxs7gsRKfqd8ZQ"
*** Where: do
*** Stack: load  

>> type? load form enbase/base img/alpha 16
== float!
```

* Crashes consoles:

`type? load form enbase/base img/alpha 2` 

***

RGB:

```
>> type? load form enbase/base img/rgb 64
== word!

>> type? load form enbase/base img/rgb 58
== word!

>> type? load form enbase/base img/rgb 16
*** Syntax Error: invalid integer! at "80185A80185A80185A80185A80185A80185A8018"
*** Where: do
*** Stack: load  
```

* Crashes consoles:

`type? load form enbase/base img/rgb 2` 

***

ARGB:

```
>> type? load form enbase/base img/argb 64
== path!

>> type? load form enbase/base img/argb 64
== path!

>> type? load form enbase/base img/argb 58
*** Syntax Error: invalid integer! at "2LnsHEEsx41wTGf9eQG2janLe3r4g1k8RCmWaMzv"
*** Where: do
*** Stack: load  

>> type? load form enbase/base img/argb 16
*** Syntax Error: invalid integer! at "5A1880FE5A1880FE5A1880FE5A1880FE5A1880FE"
*** Where: do
*** Stack: load  
```

* Crashes consoles:

`type? load form enbase/base img/argb 2` 

### Steps to reproduce the problem

`make image! [<any-size> <any-value>.<any-value>.<any-value>.<any-value-greater-than-zero>`

### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 853 date: 4-Sep-2018/7:57:23 commit: #6115b00130e64436f0127e442a4fdd8316182371 ]
PLATFORM: [ name: "Windows 7 Service Pack 1" OS: 'Windows arch: 'x86-64 version: 6.1.1 build: 7601 ]
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 853 date: 4-Sep-2018/7:57:23 commit: #6115b00130e64436f0127e442a4fdd8316182371 ]
PLATFORM: [ name: "Windows 7 Service Pack 1" OS: 'Windows arch: 'x86-64 version: 6.1.1 build: 7601 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2018-09-12T07:41:13Z, endo64, commented:
<https://github.com/red/red/issues/3532#issuecomment-420545687>

    `load form enbase/base img/argb 2` crash is not related to `image` type.
    
    `load append/dup "" "1" 25000` also crashes on my PC.
    
    Interestingly if I open a fresh console and paste above line it crashes immediately, but if I go 25000 gradually then it works:
    
    ```
    >> load append/dup "" "1" 15000
    == 1.#INF
    >> load append/dup "" "1" 19000
    == 1.#INF
    >> load append/dup "" "1" 24000
    == 1.#INF
    >> load append/dup "" "1" 25000
    == 1.#INF
    ```
    
    I think there is an extending internal buffer.

--------------------------------------------------------------------------------

On 2018-09-12T07:52:26Z, endo64, commented:
<https://github.com/red/red/issues/3532#issuecomment-420548850>

    Additionally, `return the correct type` is not possible.
    
    `enbase` always returns a string (no need to `form`) but in base 16, 58 or 64 the string returned can start with an `integer!`, when you try to `load` it it gives error because of the rest of the string which is reasonable.
    
    I think we should close this issue and  open a new one (if it is not there already) for the crash problem.

--------------------------------------------------------------------------------

On 2018-09-12T22:44:39Z, gltewalt, commented:
<https://github.com/red/red/issues/3532#issuecomment-420822903>

    ok

