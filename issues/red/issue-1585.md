
#1585: down key crashes gui-console
================================================================================
Issue is closed, was reported by WiseGenius and has 0 comment(s).
<https://github.com/red/red/issues/1585>

Open the gui-console.
Enter some multiline code, such as the following:

```
red>> [
[    ]
== []
red>> 
```

Press the down key.
The console disappears.

This issue is not present in the CLI console, but it is in the GUI console in both Windows XP and Windows 7.



