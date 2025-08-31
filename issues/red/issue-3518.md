
#3518: Ordinal number lookup for the error throw is not correct
================================================================================
Issue is closed, was reported by gltewalt and has 4 comment(s).
[status.built] [type.bug]
<https://github.com/red/red/issues/3518>

### Expected behavior
I expect `make error! 0` to return "no loop to break" 

In:
```
SYSTEM/CATALOG/ERRORS/THROW is an object! with the following words and values:
     code        integer!      0
     type        string!       "Throw Error"
     break       string!       "no loop to break"
     return      string!       "return or exit not in function"
     throw       block!        length: 2  ["no catch for throw:" :arg1]
     continue    string!       "no loop to continue"
     while-cond  string!       {BREAK/CONTINUE cannot be used in WHILE condition block}
```
### Actual behavior
>> make error! 0
*** Script Error: value out of range: 0
*** Where: make
*** Stack: 
### Steps to reproduce the problem
`make error! 0`
### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 847 date: 21-Aug-2018/3:45:37 commit: #04f07dfc243d8e1bc2f363287704f21bf66fc63f ]
PLATFORM: [ name: "Windows 7 Service Pack 1" OS: 'Windows arch: 'x86-64 version: 6.1.1 build: 7601 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2018-08-23T00:49:07Z, greggirwin, commented:
<https://github.com/red/red/issues/3518#issuecomment-415235182>

    Maybe this in %error.reds / `make`?
    ```
    				if any [
    					int/value <= 0
    					(sym + object/get-size errors) <= as red-value! w
    				][
    					fire [TO_ERROR(script out-of-range) spec]
    				]
    ```
    `<= 0` should allow 0?

--------------------------------------------------------------------------------

On 2018-08-23T03:23:11Z, gltewalt, commented:
<https://github.com/red/red/issues/3518#issuecomment-415271276>

    Yes, int/value < 0
    
    Looks like it is already fixed.

