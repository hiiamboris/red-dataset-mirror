
#3318: CRASH when making an object with a recursive block
================================================================================
Issue is closed, was reported by hiiamboris and has 20 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3318>

### Steps to reproduce the problem
```
>> append/only l: [1] l
== [1 [...]]
>> c: context [x: l]
== make object! [
    x: [1 [...]]
]
>> make c []
(crash)
>> bind l c
(crash)
>> copy/deep l
(crash)
```
### Actual behavior
```
*** Runtime Error 19: stack error or overflow
*** at: 0041A38Dh
```
### Expected behavior
A normal catchable error at least.
Better if there was a way to tell `make` not to use `copy/deep` and `bind` on inner blocks? or also inner objects? Sometimes recursive data is something valid, like a doubly-linked-list.

### Version (run `about` in the Red Console and paste the result here) also add OS version.
`Red 0.6.3 for Windows built 31-Mar-2018/3:49:39 commit #d8e9eaad`
and the stable 0.6.3
win7 x64 6.1.7601


Comments:
--------------------------------------------------------------------------------

On 2018-04-06T11:00:01Z, dockimbel, commented:
<https://github.com/red/red/issues/3318#issuecomment-379220439>

    > Better if there was a way to tell make not to use copy/deep and bind on inner blocks?
    
    Binding is part of object's creation process.

--------------------------------------------------------------------------------

On 2018-04-07T03:05:57Z, hiiamboris, commented:
<https://github.com/red/red/issues/3318#issuecomment-379427707>

    I just found an even worse limitation:
    ```
    >> make reactor! [x: l]
    (crash)
    >> r: make reactor! [x: 0]
    r/x: l
    (crash)
    ```
    It's totally impossible right now to use recursive series in the reactors :(
    
    > Binding is part of object's creation process.
    
    Is it impossible to make a *shallow* bind, sort of, as an option?

--------------------------------------------------------------------------------

On 2018-04-07T03:54:13Z, hiiamboris, commented:
<https://github.com/red/red/issues/3318#issuecomment-379429940>

    I guess cunning can get one anywhere though...
    ```
    append/only l: [1] l
    c: context [x: l]
    
    link: func ['w [any-word!] /with c [object!]] [
    	c: any [c context? :w]
    	func [/update v] compose/deep [
    		either update [set bind (to-lit-word :w) (c) v][get bind (to-lit-word :w) (c)]
    	]
    ]
    r: make reactor! [
    	x: link/with x c
    	y: link l
    ]
    >> r/x/update l
    >> r/x
    == [1 [...]]
    >> r2: make r []
    >> r2/x
    == [1 [...]]
    >> r2/y
    == [1 [...]]
    ```
    works like a charm, if just a bit slower..

--------------------------------------------------------------------------------

On 2018-04-07T03:57:21Z, greggirwin, commented:
<https://github.com/red/red/issues/3318#issuecomment-379430079>

    > Is it impossible to make a shallow bind, sort of, as an option?
    
    @hiiamboris, what would be the context of deep words then?

--------------------------------------------------------------------------------

On 2018-04-07T04:05:18Z, hiiamboris, commented:
<https://github.com/red/red/issues/3318#issuecomment-379430406>

    > what would be the context of deep words then?
    
    @greggirwin same as in the prototype maybe?

--------------------------------------------------------------------------------

On 2018-04-07T04:23:16Z, greggirwin, commented:
<https://github.com/red/red/issues/3318#issuecomment-379431088>

    But they still need to be bound, yes?

--------------------------------------------------------------------------------

On 2018-04-07T04:34:50Z, hiiamboris, commented:
<https://github.com/red/red/issues/3318#issuecomment-379431589>

    @greggirwin They were bound already, so how does that harm?

--------------------------------------------------------------------------------

On 2018-12-21T13:05:23Z, dockimbel, commented:
<https://github.com/red/red/issues/3318#issuecomment-449383391>

    For the record, both Rebol 2 and 3 are crashing on such code.

--------------------------------------------------------------------------------

On 2018-12-22T01:57:48Z, greggirwin, commented:
<https://github.com/red/red/issues/3318#issuecomment-449536951>

    @hiiamboris should we start (or see if we already have) a wiki page for advanced topics and cunning workarounds? 

--------------------------------------------------------------------------------

On 2018-12-23T11:52:50Z, dockimbel, commented:
<https://github.com/red/red/issues/3318#issuecomment-449631410>

    Now Red no longer will crash on those cases, returning just a catchable error in case the circular reference can't be handled:
    ```
    >> make c []
    *** Internal Error: block or paren series is too deep to display
    *** Where: make
    *** Stack:  
    
    >> bind l c
    == [1 [...]]
    
    >> copy/deep l
    *** Internal Error: circular reference not allowed
    *** Where: copy
    *** Stack:  
    ```

