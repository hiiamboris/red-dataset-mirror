
#1063: HELP without an argument throws an error
================================================================================
Issue is closed, was reported by rebolek and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1063>

I just downloaded latest Red 0.5.1. After compilation I get this message:

```
--== Red 0.5.1 ==-- 
Type HELP for starting information. 
```

So I did exactly that and it returns an error:

```
red>> help
*** Script error: help is missing its word argument
*** Where: help
```



Comments:
--------------------------------------------------------------------------------

On 2015-03-15T09:45:09Z, dockimbel, commented:
<https://github.com/red/red/issues/1063#issuecomment-80936294>

    Thanks for reporting it... Annoying regression caused by too aggressive argument type-checking.

