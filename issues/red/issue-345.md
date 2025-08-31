
#345: spec of set function is wrong
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/345>

The spec of `set` is 

```
[word [lit-word!] /any value [any-type!] return: [any-type!]]
```

but in my opinion this should be

```
[word [lit-word!] value [any-type!] /any return: [any-type!]]
```

since the `value` argument should always be present 

I understand, BTW why this was not found earlier: `natives/set*` and `natives/get*` haven't been implemented yet!



Comments:
--------------------------------------------------------------------------------

On 2012-12-21T12:50:56Z, dockimbel, commented:
<https://github.com/red/red/issues/345#issuecomment-11611746>

    Agreed.

