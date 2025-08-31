
#2247: Lexers process % followed by ] or ) differently
================================================================================
Issue is closed, was reported by rebolek and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2247>

```
red>> x: [% % % %]
== [% % % %""]
red>> x: [% % % % ]
== [% % % %]
red>> x: quote (% % % %)
== (% % % %"")
red>> x: quote (% % % % )
== (% % % %)
```



Comments:
--------------------------------------------------------------------------------

On 2017-03-02T10:10:42Z, dockimbel, commented:
<https://github.com/red/red/issues/2247#issuecomment-283612028>

    Reproducing this issue can be simplified to:
    ```
    red>> [%]
    == [%""]
    red>> quote (%)
    == (%"")
    ```

