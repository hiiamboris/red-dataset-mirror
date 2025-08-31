
#2145: More brackets don't match properly
================================================================================
Issue is closed, was reported by WiseGenius and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2145>

Some brackets still don't match since #2104 was fixed.

```
red>> {{}"}
{     
```

The following are all affected:

```
{{}"}
{{}a"}
{{"}"}
{{{}"}}
{"{}"}
{{"{}"}}
{"{"{}"}"}
{{{"{}"}}}
{{"{"{}"}"}}
{"{"{}"}"}
{"{""}"}
```

etc.



Comments:
--------------------------------------------------------------------------------

On 2017-02-23T08:39:29Z, dockimbel, commented:
<https://github.com/red/red/issues/2145#issuecomment-281929433>

    Good catch!

