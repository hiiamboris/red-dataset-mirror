
#3431: console/eval-command is exposed
================================================================================
Issue is closed, was reported by gltewalt and has 6 comment(s).
<https://github.com/red/red/issues/3431>

### Expected behavior
Expect that `system/console/eval-command` not be accessible to the user.
### Actual behavior
In cli:
```
>> system/console/eval-command "1"
*** Script Error: set does not allow error! for its word argument
*** Where: set
*** Stack: load
== 1
== 1
== 1
== 1
== 1
== 1
== 1
== 1
== 1
== 1
== 1
== 1
== 1
== 1
== 1
== 1
== 1
== ""
```

In GUI console:
```
>> system/console/eval-command "1"
*** Internal Error: stack overflow
*** Internal Error: stack overflow
*** Where: set
*** Stack:  

== 1
== 1
== 1
== 1
== 1
== 1
== 1
== 1
== 1
== 1
== 1
== 1
== 1
== 1
== 1
== 1
== ""
>> 
*** Script Error: value out of range: 37
*** Where: poke
*** Stack: ask do-events do-actor do-safe
```
### Steps to reproduce the problem
Feed line number as string to `system/console/eval-command` in a fresh console.
### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 729 date: 29-May-2018/7:55:26 commit: #fcaf6df8c2e4fcdf82e6708dda7677e0eb10e9cd ]
PLATFORM: [ name: "Windows 7 Service Pack 1" OS: 'Windows arch: 'x86-64 version: 6.1.1 build: 7601 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2019-01-06T12:42:55Z, meijeru, commented:
<https://github.com/red/red/issues/3431#issuecomment-451738748>

    All fields of `system/console` are accessible to the user, not only `eval-command`. Is this one a more serious problem than all the others?

--------------------------------------------------------------------------------

On 2019-01-06T21:45:03Z, gltewalt, commented:
<https://github.com/red/red/issues/3431#issuecomment-451777780>

    If I remember right, I consulted with @greggirwin about this. I do not, however, remember the reason why it should be hidden.

--------------------------------------------------------------------------------

On 2019-01-07T04:19:40Z, greggirwin, commented:
<https://github.com/red/red/issues/3431#issuecomment-451817741>

    Let's start with the expectation:
    
    > Expect that system/console/eval-command not be accessible to the user.
    
    Why do you expect that? While it's possible to hide things, and we will make sure modules have a good design for this, it's really not the Red way. Smalltalk has similar issues. That "Great power..." thing. Are there things you shouldn't use, or expect to work, and may even cause huge problems. Yes. 
    
    I think we can close this ticket.

