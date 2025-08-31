
#2556: Wrong error message when setting event component other than type
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2556>

The only component of an `event!`value that may be set is `type`. Setting another component results in an error message, which however is off the mark. It is not an unsupported type, but an unsupported field!
See `%events.reds` at line 105
```
>> view [button "push" [event/window: none]]
;; on pushing the button:
*** Script Error: unsupported type in event/window: set-path
*** Where: set-path
```


