
#1913: VID Dialect: problem with 'return'
================================================================================
Issue is closed, was reported by StephaneVeneri and has 4 comment(s).
<https://github.com/red/red/issues/1913>

Example:

```
Red [ need: 'view ]
view [
    group-box "Informations" 2 [
        return
        text "Vertices"
        lvertices: text "25"
        text "Edges"
        ledges: text "12"
        text "Faces"
        lfaces: text "12"
    ]
]
```

If you execute this code in REPL, this message appear:
`*** Script error: VID - invalid syntax at: [return text "Vertices"]`
`*** Where: do`

Work with red-19apr16-b4b71d5.exe 
Not work since at least red-12may16-00ebbcd.exe and the last red-17may16-8eb3e6e.exe



Comments:
--------------------------------------------------------------------------------

On 2016-05-18T11:10:24Z, ghost, commented:
<https://github.com/red/red/issues/1913#issuecomment-219995350>

    This is an intentional change as a fix for https://github.com/red/red/issues/1873

--------------------------------------------------------------------------------

On 2016-05-18T19:02:43Z, StephaneVeneri, commented:
<https://github.com/red/red/issues/1913#issuecomment-220125990>

    Thanks.

