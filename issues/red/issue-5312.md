
#5312: `on-change*` skips component changes when path contains no object
================================================================================
Issue is open, was reported by hiiamboris and has 10 comment(s).
[status.dismissed] [type.review]
<https://github.com/red/red/issues/5312>

**Describe the bug**

After https://github.com/red/REP/issues/77#issuecomment-1327751918 setting of a scalar component should trigger `on-change*` events, but it doesn't always work:
```
>> o: object [x: 0x0 on-change*: func [w o n] [?? n]]
>> o/x/x: 1
n: 1x0
== 1
>> do bind [self/x/x: 2] o
n: 2x0
>> do bind [x/x: 3] o
== 3        <- no event triggered!
```

**To reproduce**
```
o: object [x: 0x0 on-change*: func [w o n] [?? n]]
o/x/x: 1
do bind [self/x/x: 2] o
do bind [x/x: 3] o
```

**Expected behavior**

Reliable change detection.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4667 date: 9-Apr-2023/3:24:34 commit: #d36108eeffeafbf14839b5a9cadc9a0acd87f34a ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-05-04T18:36:36Z, hiiamboris, commented:
<https://github.com/red/red/issues/5312#issuecomment-1535231830>

    Loosely related to https://github.com/red/red/issues/3804

--------------------------------------------------------------------------------

On 2023-08-16T19:31:27Z, dockimbel, commented:
<https://github.com/red/red/issues/5312#issuecomment-1681163434>

    It would be possible to extract the missing "grand-parent" info from the head word's context and trigger a reaction. The issue is that goes against the design described in #3804 and would cause unwanted reaction triggering within the reactive object itself when manipulating its private values. The `self` variant gives an alternative construct that will trigger the reaction even inside the reactive object if really needed.
    
    I need to review the docs and add some mentions/examples for such cases if needed.

--------------------------------------------------------------------------------

On 2023-08-16T20:12:20Z, hiiamboris, commented:
<https://github.com/red/red/issues/5312#issuecomment-1681209988>

    First word in path should use its context, but next words should use parent container.
    How do you see these two cases conflicting with each other? 
    
    If path semantics works everywhere one way, but in reactivity another way, it's a huge gotcha.

--------------------------------------------------------------------------------

On 2023-08-18T10:07:12Z, dockimbel, commented:
<https://github.com/red/red/issues/5312#issuecomment-1683681159>

    > If path semantics works everywhere one way, but in reactivity another way, it's a huge gotcha.
    
    Path semantics <> reactivity semantics. Path semantics work everywhere the same way. In the above example, it sets the field in the object every time.
    
    > How do you see these two cases conflicting with each other?
    
    The reactivity system is designed to signal changes to reactive objects triggered by external code (i.e. coming from outside of the object). That is why emphasis is made on paths to identify the cases where a reaction needs to be signaled to the target object. Paths are not needed to be used internally in the object's code to access its own words. So, we don't want internal code in reactive objects to trigger reactions, as that is considered "private" or "internal" space, where the object is in control of its content, so "knows" when/where his own referenced values are changed. If the context of first word was extracted to identify a reactive target,  that would go against that design and would trigger reactions each time a reactive object changes his own content. So `x/x` should not trigger anything (as it makes writing handler and object internal code much easier), while we leave an escape hatch to force the triggering of events internally (if needed) using the `self/x/x` path syntax (which is consistent with the general rule for triggering reactions).
    
    ```
    >> o: object [z: 0x0 foo: does [z/x: 4] on-change*: func [w o n] [?? n]]
    == make object! [
        z: 0x0
        foo: func [][z/x: 4]
    ]
    >> o/z/x: 1                     ; path with a reactor -> trigger
    n: 1x0
    == 1
    >> do bind [self/z/x: 2] o      ; path with a reactor -> trigger
    n: 2x0
    == 2
    >> do bind [z/x: 3] o           ; path without a reactor -> internal change, no reaction
    == 3
    >> o
    == make object! [
        z: 3x0
        foo: func [][z/x: 5]        ; path without a reactor -> internal change, no reaction
    ]
    >> o/foo
    == 4
    ```
    
    Additionally, imagine a `z/x: 5` in `on-change*` handler itself, you would get an infinite recursion if `z/x` would trigger a reaction...
    
    This is the current design and I think it gives the most flexibility for users (protecting them from internally generated reactions by default). Though, if a more useful general behavior can be (_objectively_) determined, I'm not against changing it.

--------------------------------------------------------------------------------

On 2023-08-18T11:35:04Z, hiiamboris, commented:
<https://github.com/red/red/issues/5312#issuecomment-1683787742>

    > The reactivity system is designed to signal changes to reactive objects triggered by external code (i.e. coming from outside of the object). That is why emphasis is made on paths to identify the cases where a reaction needs to be signaled to the target object. Paths are not needed to be used internally in the object's code to access its own words. So, we don't want internal code in reactive objects to trigger reactions, as that is considered "private" or "internal" space, *where the object is in control of its content, so "knows" when/where his own referenced values are changed.*
    
    This "in control" is only valid for tiny objects. In 500+LOC objects manually tracking changes is a tedious task. Without reliable change detection, consistency of object's internal state is always at risk.
    
    > If the context of first word was extracted to identify a reactive target, that would go against that design and would trigger reactions each time a reactive object changes his own content. So `x/x` should not trigger anything (as it makes writing handler and object internal code much easier), while we leave an escape hatch to force the triggering of events internally (if needed) using the `self/x/x` path syntax (which is consistent with the general rule for triggering reactions).
    
    This explanation is ruined by the simple test:
    ```
    >> o: object [x: 0x0 on-change*: func [w o n] [?? n]]
    >> do bind [x/x: 1] o
    == 1
    >> do bind [x: 2x2] o
    n: 2x2
    == 2x2
    ```
    Note that `x:` *does* trigger it, against the design above.
    
    > Additionally, imagine a `z/x: 5` in `on-change*` handler itself, you would get an infinite recursion if `z/x` would trigger a reaction...
    
    `on-change*` is up to the user to handle properly (and why we have set-quiet). But reactivity is built to cut off the cycles:
    ```
    >> r: reactor [x: 0 relate x: [x + 1]]
    >> r/x: 0x0
    == 0x0
    >> r
    == make object! [
        x: 1x1
    ]
    ```

