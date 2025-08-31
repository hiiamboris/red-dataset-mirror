
#2113: function point assignment will launch the function when the assign path contain "self"
================================================================================
Issue is closed, was reported by red-eco and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2113>

```
a: make object! [
    act-state: make object! [
        finish?: false
        fn-callback: none
    ]
    start: function[callback][
        self/act-state/fn-callback: :callback
    ]
]
callback1: function[][print "aaa"]
a/start :callback1 ;-- callback1 should not be call

```



Comments:
--------------------------------------------------------------------------------

On 2016-07-14T10:08:00Z, red-eco, commented:
<https://github.com/red/red/issues/2113#issuecomment-232623132>

    code format

