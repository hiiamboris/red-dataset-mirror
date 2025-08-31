
#4123: [VID] When `style` is set to certain type, further styles can't be defined
================================================================================
Issue is closed, was reported by rebolek and has 0 comment(s).
<https://github.com/red/red/issues/4123>

**Describe the bug**

If the word `style` is set to certain type (`integer!`, `string!` and other types that are used in VID) before calling `layout` function, it's not possible to define more styles than one without workarounds.

**To reproduce**
Steps to reproduce the behavior:

```
>> style: 30% 
>> view [style s1: base red style s2: base blue s1 s2]
*** Script Error: VID - invalid syntax at: [s2 do [probe s1]]
```

However:

```
>> style: 'whatever
>> view [style s1: base red style s2: base blue s1 s2]
(works)
```

**Expected behavior**

Code above should work just fine
**Platform version (please complete the following information)**

Confirmed on Windows and Linux/GTK versions.


This bug is caused by `fetch-options` function in `%modules/view/VID.red`.
This function check for VID keywords in `parse` at line 289. If no keyword is matched, the function gets word's value and treats it like VID's value (see `'else` branch at line 341).  This is the reason, why types like `word!` or `tag!` don't cause the error, as they're not in the list of supported types.

One possible fix is proposed in https://github.com/rebolek/red/tree/fix-style . It adds `style` to list of keywords in `fetch-options` which causes the loop to stop fetching options and return spec block at `style` position.


