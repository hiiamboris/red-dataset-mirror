
#3250: Wish: escaping support for op!
================================================================================
Issue is closed, was reported by a-nick-fischer and has 6 comment(s).
[type.wish]
<https://github.com/red/red/issues/3250>

### Wished behavior
```Red
>> add-and-assign: function ['word value] [print [word value] set word add get word value]
>> i: 0
>>
>> add-and-assign i 3
i 3
== 3
>>
>> +=: make op! :add-and-assign
>>
>> i += 1
i 1
== 4
```
### Actual behavior
```Red
>> i += 1
3 1
*** Script Error: set does not allow integer! for its word argument
*** Where: set
*** Stack:

```
### Steps to reproduce the problem
See above.

### Red version and build date, operating system with version.
```
Red for Windows version 0.6.3 built 12-Aug-2017/21:38:44+02:00
Windows 10 x64
```


Comments:
--------------------------------------------------------------------------------

On 2018-03-09T17:08:10Z, dockimbel, commented:
<https://github.com/red/red/issues/3250#issuecomment-371876825>

    I think there is already a ticket asking for literal argument support for user-defined infix function.

--------------------------------------------------------------------------------

On 2018-03-09T17:16:39Z, 9214, commented:
<https://github.com/red/red/issues/3250#issuecomment-371879427>

    https://github.com/red/red/issues/3179

--------------------------------------------------------------------------------

On 2018-03-09T17:29:20Z, greggirwin, commented:
<https://github.com/red/red/issues/3250#issuecomment-371883031>

    Closing as a duplicate of #3179, but also linked to this ticket from there.

