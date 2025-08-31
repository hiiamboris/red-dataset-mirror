
#3332: 2 + instructions  not captured correctly in RTD block
================================================================================
Issue is closed, was reported by toomasv and has 4 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/3332>

### Expected behavior
```
>> r1: rtd-layout [i [font 24 red "Hello " /font]]
>> r1/data
== data: [
        1x6 24 255.0.0 italic
    ]
```
### Actual behavior
```
>> r1: rtd-layout [i [font 24 red "Hello " /font]]
>> r1/data
== data: [
        1x6 24 
        1x6 255.0.0
    ]
```
### Steps to reproduce the problem
As above
### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 631 date: 12-Apr-2018/8:03:59 commit: #862793cf09c8b9da856911688f3209a084777ae0 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 16299 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2018-04-12T08:54:00Z, toomasv, commented:
<https://github.com/red/red/issues/3332#issuecomment-380728582>

    Actually, the problem seems to appear whenever there are more then 2 formatting elements, e.g.:
    ```
    select r1: rtd-layout [b [i [u ["Hello "]]]] 'data
    == [
        1x6 underline 
        1x6 bold
    ]
    ```
    ```
    select r1: rtd-layout [i [u [b [font 24 "Hello " /font]]]] 'data
    == [
        1x6 24 
        1x6 
        1x6 italic
    ]
    ```

--------------------------------------------------------------------------------

On 2018-04-12T10:06:00Z, toomasv, commented:
<https://github.com/red/red/issues/3332#issuecomment-380749245>

    Path behaves better, but there are still problems:
    ```
    select r1: rtd-layout [i/u/b/s/red [font 24 "Hello " /font]] 'data
    == [
        1x6 24 bold underline italic 
        1x6 255.0.0
    ]
    ```
    while the following is correct
    ```
    select r1: rtd-layout [i/u/b/s/red ["Hello "]] 'data
    == [
        1x6 strike bold underline italic 255.0.0
    ]
    ```

