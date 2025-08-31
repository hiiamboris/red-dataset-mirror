
#5529: Plenty of ways to accidentally break object's `on-change*`
================================================================================
Issue is open, was reported by hiiamboris and has 6 comment(s).
[type.review]
<https://github.com/red/red/issues/5529>

**Describe the bug**

Turns out that depending on the way I construct an object, it will work completely differently despite `mold/all` showing identical contents:
```
>> o1: object [x: 1 on-change*: func [w o n] [?? w]]
>> o1/x: 2                                ;) testing - on-change works
w: x
== 2
>> o1/on-change*: none                    ;) does the error prevent the value from being set?
*** Script Error: invalid object event handler: none
*** Where: set-path
*** Near : o1/on-change*: none
*** Stack:  

>> mold/all o1                            ;) no it doesn't
== {make object! [^/    x: 2^/    on-change*: #(none)^/]}
>> o1/x: 3        ;) now it will whine about every assignment
*** Script Error: invalid object event handler: none
*** Where: set-path
*** Near : o1/x: 3
*** Stack:  

>> o2: construct [x: on-change*: #(none)]        ;) what if it's initially none?
== make object! [
    x: none
]
>> mold/all o2
== {make object! [^/    x: #(none)^/    on-change*: #(none)^/]}
>> o2/x: 2                                ;) no whining here
== 2
>> o2/on-change*: func [w o n] [?? w]
== func [w o n][?? w]
>> o2/x: 3                                ;) but it also won't react to changes :/
== 3

>> o3: copy o2
== make object! [
    x: 3
]
>> o3/x: 4                        ;) yet a copy of the same object has been magically "fixed" and now reacts
w: x
== 4
```

**To reproduce**
```
o1: object [x: 1 on-change*: func [w o n] [?? w]]
o1/x: 2
o1/on-change*: none
mold/all o1
o1/x: 3
o2: construct [x: on-change*: #(none)]        
mold/all o2
o2/x: 2
o2/on-change*: func [w o n] [?? w]
o2/x: 3
o3: copy o2
o3/x: 4
```

**Expected behavior**

1. Allow disabling of on-change* by setting it to a non-function
2. Object should have no exploitable hidden state and be independent of the way it was created

**Platform version**
```
Red 0.6.5 for Windows built 2-Jul-2024/1:21:21+08:00  commit #bbecb7e
```


Comments:
--------------------------------------------------------------------------------

On 2024-07-23T16:53:49Z, hiiamboris, commented:
<https://github.com/red/red/issues/5529#issuecomment-2245754712>

    Related to on-change open tickets: https://github.com/red/red/issues/5312 https://github.com/red/red/issues/3800 https://github.com/red/REP/issues/115

--------------------------------------------------------------------------------

On 2024-07-23T20:14:39Z, greggirwin, commented:
<https://github.com/red/red/issues/5529#issuecomment-2246231454>

    > Allow disabling of on-change* by setting it to a non-function
    
    Should it allow *any* non-function value, or just `none`  to disable it? I think we don't want to allow just any value, as that could be terribly confusing and more logic to consider given the breadth of types and possible trickery (not just by you, @hiiamboris :^).
    
    I'm OK with requiring that it be an interface compatible function, which can do nothing if that's what you want. Yes, more overhead if it's called all the time, rather than a `none` check, but we can always relax that rule later if desired.
    
    > Object should have no exploitable hidden state and be independent of the way it was created
    
    Agreed.

--------------------------------------------------------------------------------

On 2024-07-24T10:35:40Z, hiiamboris, commented:
<https://github.com/red/red/issues/5529#issuecomment-2247555773>

    I think `unset` makes sense to allow, as this is its initial state anyway, so one way or the other it may surface:
    ```
    >> object [print mold/all self on-change*:]
    make object! [
        on-change*: unset
    ]
    ```

