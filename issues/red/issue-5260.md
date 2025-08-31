
#5260: [View] Regression: text-list/selected doesn't accept `none` anymore
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5260>

Likely this commit: https://github.com/red/red/commit/c6b15e4fe6d39fb3f854ec1e8863d01ddbc95d26

**Describe the bug**
```
>> view [text-list data ["a" "b" "c"] with [selected: none]]
*** Script Error: pick does not allow none! for its index argument
*** Where: pick
*** Near : all [word = 'selected block? data find [] ] 
*** Stack: view layout fetch-options 
```
Worked in `red-view-12aug22-1f3694334.exe` but not in `red-view-19aug22-19a4f16ef.exe`

**Version**

```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4612 date: 9-Dec-2022/7:12:47 commit: #ce6e33c1dc44fc32bdaeb7f804ac93d98b9af863 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2022-12-27T16:10:51Z, bubnenkoff, commented:
<https://github.com/red/red/issues/5260#issuecomment-1366016679>

    currently working solution:
    ```
    view [
    	t: text-list data ["aaa" "bbb"]  on-dbl-click [ 
    		print [ "Dbl click" "face/selected:" face/selected "event/picked:" event/picked ] 
    		face/selected: 0
    	]
    ]
    ```
    https://gitter.im/red/help?at=63ab1273ff1fd121b318798b

