
#3108: PARSE infinite loop causes access violation
================================================================================
Issue is closed, was reported by 9214 and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3108>

```Red
partition: function [elems [block!] group [integer!]][
    parse elems [
        collect some [keep group skip | collect keep to end]
    ]
]

probe partition [1 2 3 4 5 6 7 8 9] 2
```
Infinite loop comes from `to` keyword.

### Expected behavior
```Red
[[1 2] [3 4] [5 6] [7 8] [9]]
```
### Actual behavior
```Red
*** Runtime Error 1: access violation
*** at: 0805B3A3h
```
### Steps to reproduce the problem
Simply evaluate the snippet above.

### Red version and build date, operating system with version.
```Red
>> about
Red for Windows version 0.6.3 built 14-Nov-2017/13:37:54+05:00
```
```Red
>> about
Red for Linux version 0.6.3 built 14-Nov-2017/13:38:09+05:00
```


Comments:
--------------------------------------------------------------------------------

On 2017-11-14T17:59:10Z, greggirwin, commented:
<https://github.com/red/red/issues/3108#issuecomment-344343729>

    Memory use skyrockets while this runs, then it dies.

--------------------------------------------------------------------------------

On 2017-11-14T18:00:38Z, greggirwin, commented:
<https://github.com/red/red/issues/3108#issuecomment-344344182>

    It's good to note, but any code that allocates new values and runs forever will crash without GC in place. This does it pretty fast though! :^)

