
#475: Doc-string corrupts function! struct!
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 4 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/475>

This breaks my JNI binding:

```
Red/System []

s: declare struct! [
    f [function! [""
        i       [integer!]
        return: [integer!]
    ]]
]

print [s/f]
```

It compiles without erroring out on the missing argument.



Comments:
--------------------------------------------------------------------------------

On 2013-05-12T18:07:05Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/475#issuecomment-17782275>

    Please note that this applies to Red/System, not Red.

--------------------------------------------------------------------------------

On 2013-05-12T22:39:29Z, dockimbel, commented:
<https://github.com/red/red/issues/475#issuecomment-17786719>

    Now a missing argument error is raised during compilation.

