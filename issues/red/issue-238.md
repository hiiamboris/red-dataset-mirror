
#238: Compiler crashes (on function parameter referencing type from CONTEXT)
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/238>

```
c: context [
    s!: alias struct! [dummy [integer!]]
]

with c [
    f: function [
        p [s!]
    ][
    ]
]
```

  expr: <last>
  expr: [quit status]

> > > pushing status
> > > calling: quit [status]
> > > building: ***-ON-QUIT epilog
> > > ---
> > > 
> > >   function: f 
> > > ---
> > > 
> > >   **\* Compiler Internal Error: Script Error : max expected value1 argument of type: number pair char money date time tuple series 
> > >   **\* Where: arguments-size? 
> > >   **\* Near:  [size: size + max size-of?]



