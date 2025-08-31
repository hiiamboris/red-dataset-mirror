
#1646: resize issue C
================================================================================
Issue is closed, was reported by WiseGenius and has 10 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1646>

```
red>> view l0: layout [a1: area "Hello, World!" b: button "resize" [l0/size: 100x100]]
red>> ;10 works as expected
red>> view l1: layout [a1: area "Hello, World!" a2: area "Χαῖρε, κόσμε!" b: button "resize" [a2/size: 100x100] react [a1/size: a2/size - 20]]
red>> ;11 works as expected
red>> view l2: layout [a1: area "Hello, World!" b: button "resize" [l2/size: 100x100] react [a1/size: l2/size - 20]]
*** Script error: l2 has no value
*** Where: get
red>> view l2: layout [text "Hello, World!"]
*** Script error: l2 has no value
*** Where: get
red>> view l2: [text "Hello, World!"]
*** Error: path value must start with a word!
```

With that, it crashes.
Same on Windows XP and Windows 7.



Comments:
--------------------------------------------------------------------------------

On 2016-02-21T11:53:57Z, Josh1-rtd, commented:
<https://github.com/red/red/issues/1646#issuecomment-186808825>

    This is working without error under Wine with 21 Feb build.

--------------------------------------------------------------------------------

On 2016-02-21T12:09:24Z, WiseGenius, commented:
<https://github.com/red/red/issues/1646#issuecomment-186812514>

    @RedJosh Did you type all of the following in order in the same session?
    
    ```
    view l2: layout [a1: area "Hello, World!" b: button "resize" [l2/size: 100x100] react [a1/size: l2/size - 20]]
    view l2: layout [text "Hello, World!"]
    view l2: [text "Hello, World!"]
    ```

--------------------------------------------------------------------------------

On 2016-02-21T12:26:02Z, Josh1-rtd, commented:
<https://github.com/red/red/issues/1646#issuecomment-186814668>

    @WiseGenius  You are right.-:)
    
    red>> view l2: layout [a1: area "Hello, World!" b: button "resize" [l2/size: 100x100] react [a1/size: l2/size - 20]]
    **\* Script error: l2 has no value
    **\* Where: get
    red>> view l1: layout [a1: area "Hello, World!" a2: area "Χαῖρε, κόσμε!" b: button "resize" [a2/size: 100x100] react [a1/size: a2/size - 20]]
    **\* Script error: l2 has no value
    **\* Where: get
    red>> view l0: layout [a1: area "Hello, World!" b: button "resize" [l0/size: 100x100]]
    **\* Script error: l2 has no value
    **\* Where: get
    red>> 

--------------------------------------------------------------------------------

On 2016-02-21T12:33:18Z, Josh1-rtd, commented:
<https://github.com/red/red/issues/1646#issuecomment-186815891>

    @WiseGenius Type like this and see what happens
    view l1: layout [a1: area "Hello, World!" a2: area "Χαῖρε, κόσμε!" b: button "resize" [a2/size: 100x100] react [a1/size: a2/size + 20]]

--------------------------------------------------------------------------------

On 2016-02-21T12:40:38Z, WiseGenius, commented:
<https://github.com/red/red/issues/1646#issuecomment-186817275>

    @RedJosh That gives the expected result for me. They overlap a little to begin with, but I expected that since `react` is already working before the button is clicked.

