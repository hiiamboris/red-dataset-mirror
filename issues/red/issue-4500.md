
#4500: Reactivity+Ownership mess tells tales about "invalid object event handler"
================================================================================
Issue is closed, was reported by hiiamboris and has 10 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4500>

**Describe the bug**

This was supposed to be simple change one value for another scenario:
```
r: reactor [
    x: 1
    on-change*: function spec-of :on-change* bind/copy body-of :on-change* self
]
src: reactor [a: b: none]
tgt: [0 "tgt block"]
react [tgt/1: src/a]
r/x: tgt
src/a: 100
```
first `src/a` <- 100
then `tgt/1` <- 100

What it really outputs:
```
*** Script Error: invalid object event handler: x: [1 0]
*** Where: set-path
*** Stack: check 
*** Near: [t/1: 1 s/a]
```
Now imagine how informative this error message in a complex View layout, where some face/data refers to a reactor? ;)

**To reproduce**

See above.

Some clues here...
1. Changing
`on-change*: function spec-of :on-change* bind/copy body-of :on-change* self`
To
`on-change*: function spec-of :on-change* body-of :on-change*`
magically disintegrates the bug (what???)

2. This is not working:
```
    on-change*: function [word old new] bind [
        if series? :new [modify new 'owned reduce [self word]]
    ] self
```
3. This is working:
```
    on-change*: function [word old new] [
        if series? :new [modify new 'owned reduce [self word]]
    ]
```
4. This throws an error (will raise a new issue):
```
    on-change*: function [word old new] compose/deep [
        if series? :new [modify new 'owned reduce [(bind 'self self) word]]
    ]
```
```
*** Script Error: self has no value
*** Where: reduce
*** Stack:
```

**Expected behavior**

No errors, especially such misleading ones.
`tgt/1 = none`.


**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 28-May-2020/17:51:04+03:00 commit #36857eb
```



Comments:
--------------------------------------------------------------------------------

On 2020-06-05T17:28:44Z, hiiamboris, commented:
<https://github.com/red/red/issues/4500#issuecomment-639651553>

    Even simpler scenario:
    ```
    r: object [
        x: none
        on-change*: function spec-of :reactor!/on-change* bind/copy body-of :reactor!/on-change* self
    ]
    r/x: [1 2 3]
    r/x/1: none
    ```
    Output:
    ```
    *** Script Error: invalid object event handler: x: [1 2 3]
    
    *** Where: set-path
    *** Stack: 
    ```

--------------------------------------------------------------------------------

On 2020-06-08T18:49:45Z, greggirwin, commented:
<https://github.com/red/red/issues/4500#issuecomment-640807213>

    I admit, I laughed when I saw "simple" followed by `on-change*: function spec-of :on-change* bind/copy body-of :on-change* self`. :^) I'll read the rest of the ticket shortly.

--------------------------------------------------------------------------------

On 2020-06-08T18:54:59Z, hiiamboris, commented:
<https://github.com/red/red/issues/4500#issuecomment-640809805>

    @greggirwin give me a simpler way to import a function from one object into another ;)

--------------------------------------------------------------------------------

On 2020-06-08T19:27:26Z, greggirwin, commented:
<https://github.com/red/red/issues/4500#issuecomment-640831422>

    Now _that's_ what I love; a use case. ;^)

--------------------------------------------------------------------------------

On 2020-07-09T10:37:54Z, hiiamboris, commented:
<https://github.com/red/red/issues/4500#issuecomment-656051369>

    See also https://github.com/red/red/issues/4501 and likely cause explained in https://github.com/red/red/issues/4552

