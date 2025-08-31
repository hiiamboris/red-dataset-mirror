
#3593: `parse-func-spec` change (#3590) breaks using it directly
================================================================================
Issue is closed, was reported by greggirwin and has 2 comment(s).
<https://github.com/red/red/issues/3593>

**Describe the bug**
```
>> help-ctx/parse-func-spec :append
*** Script Error: clear does not allow integer! for its series argument
*** Where: clear
*** Stack:  
```
`func-spec-ctx` holds some vars outside the func, due to compiler limitations, and the new scoping to catch it in `help-ctx` breaks their use.

**To Reproduce**

See above. 

**Expected behavior**

Parsed func spec result, as in the past.


**Platform version(please complete the following information):**
```
-----------RED & PLATFORM VERSION-----------
RED: [ branch: "master" tag: #v0.6.0 ahead: 3854 date: 13-Nov-2018/15:49:48 commit: #7404492ac862ba811e289a14a3160c33a901d926 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 17134 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2018-11-19T19:30:11Z, greggirwin, commented:
<https://github.com/red/red/issues/3593#issuecomment-440013656>

    Also breaks `help` it seems.

