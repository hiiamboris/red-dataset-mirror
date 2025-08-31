
#65: Using path notation for layout facets
================================================================================
Issue is open, was reported by GiuseppeChillemi and has 0 comment(s).
<https://github.com/red/REP/issues/65>

In layouts' definition, using paths for facets raises errors. As more and more data is stored in objects, maps, and blocks, this restricts too much the use of these data structures in GUIs. (Especially under the light of CSV code)


```
planets: [
    #(Name: "Mercury" Mass: 0.055 Orbit: 0.4)
    #(Name: "Venus" Mass: 0.815 Orbit: 0.7)
    #(Name: "Earth" Mass: 1.0 Orbit: 1.0)
    #(Name: "Mars" Mass: 0.107 Orbit: 1.5)
]

>> view layout [button planets/1/name on-click [probe face/text unview]]
*** Script Error: VID - invalid syntax at: [planets/1/name on-click [probe face/text unview]]
*** Where: do
*** Stack: view layout cause-error
```

I think that this way of getting values should be implemented.

Gitter thread which generated this request is located here: [Thread](https://gitter.im/red/help?at=5e375d7540da694c5e03ff24)





