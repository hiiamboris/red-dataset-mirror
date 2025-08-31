
#511: Compiler doesn't support set-path! with SELECT index variable
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/511>

Actually, I meant #489 to include this.

```
Red []

b: [x 0]
i: 'x
b/:i: 1
```

Error: feature not implemented yet!

red>> b: [x 0]
== [x 0]
red>> i: 'x
== x
red>> b/:i: 1
== 1
red>> b
== [x 1]

I currently have to use this awkward implementation:

poke b  1 + index? find b i  1



Comments:
--------------------------------------------------------------------------------

On 2013-08-07T10:27:32Z, dockimbel, commented:
<https://github.com/red/red/issues/511#issuecomment-22242217>

    Sorry, forgot to implement that code branch for #489.

