
#3561: DO ANY-PATH! misbehaves
================================================================================
Issue is closed, was reported by 9214 and has 4 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/3561>

### Description
`do` applied to some of `any-path!` values yields unexpected results.

### Steps to reproduce the problem
* Here I expected `c`:
```red
>> a: [b c]
== [b c]
>> a/b
== c
>> do 'a/b
== false
```
* And here too:
```red
>> do quote a/b
== a/b
```
* Here `lit-path!` should have decayed to `path!`:
```red
>> do quote 'a/b
== 'a/b
```
* And this one seems to be correct:
```red
>> do quote :a/b
== c
```
### Red version and OS
```
Red 0.6.3 for Windows built 6-Oct-2018/7:28:28+05:00 commit #dafc828
```


Comments:
--------------------------------------------------------------------------------

On 2019-11-22T13:05:39Z, hiiamboris, commented:
<https://github.com/red/red/issues/3561#issuecomment-557524108>

    It's even messier in compiler:
    ```
    Red []
    a: reduce ['b does [1 + 2] 'x 'y]
    print do 'a/b
    print do quote a/b
    print do 'a/x
    print do quote a/x
    ```
    Compiled:
    ```
    3  
    3  
    3    ;) what??
    a/x
    ```
    
    Or:
    ```
    Red []
    a: reduce ['b does [1 + 2] 'x 'y]
    print do 'a/x
    print do quote a/x
    ```
    Compiled:
    ```
    *** Script Error: b has no value
    *** Where: print
    *** Stack:
    ```
    Red 0.6.4 for Windows built 20-Nov-2019/21:01:43+03:00 commit #aa7c46e

--------------------------------------------------------------------------------

On 2020-09-28T16:22:14Z, dockimbel, commented:
<https://github.com/red/red/issues/3561#issuecomment-700139823>

    There were some back and forth on supporting path evaluation with `do`. One of the main issue in allowing `do <path>` if `<path>` evaluates to a function, is that it makes it possible to create variadic expressions

