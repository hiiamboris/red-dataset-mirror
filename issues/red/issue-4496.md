
#4496: [View] Event func returning unset blows up the event pipeline
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[GUI]
<https://github.com/red/red/issues/4496>

**Describe the bug**

Quoting https://doc.red-lang.org/en/view.html#_event_flow:
![](https://i.gyazo.com/21f023b8e71eda40e32199181d5ddea5.png)
That means returning `unset` or `none` or `123` should have the same effect.

However:
`insert-event-func func [fa ev][]` will hang the GUI console.

This prevents one from using `exit` in event functions.

**Expected behavior**

`exit` and `return ()` to work as `return none`

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 28-May-2020/17:51:04+03:00 commit #36857eb
```



