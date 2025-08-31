
#770: Wrong output from nested functions calls
================================================================================
Issue is closed, was reported by WayneCui and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/770>

(NOTE: This problem only occurs with the interpreter not the compiler.)

```
f: function [][
    blk: [1 2 3 4 5]
    foreach i blk [
        case [
            i > 1 [ return i ]
        ]
    ]
]

g: function [][ if f [ return 1] ]
probe g
; 5  should be 1
```

More tests

```
f: function [][
    case [
        2 > 1 [ return true ]
    ]
]
g: function [][ if f [ return 1] ]
probe g
; 1

;IF tests
f: function [][ if true [ return true ]  ]
g: function [][ if f [ return 1]]
probe g
; true  should be 1

g: function [][ if true [ return 1] ]
probe g
; 1

f: function [][ true ]
g: function [][ if f [ return 1] ]
probe g
; 1 

f: function [][ if true [ return true ]  ]
g: function [][ if (f) [ return 1] ]
probe g

f: function [][ if true [ return true ]  ]
g: function [][ if not not f [ return 1] ]
probe g
; 1 

f: function [][ if true [ return 'X ] ]
g: function [][ if f [ return 1] ]
probe g
; X   should be 1
```



Comments:
--------------------------------------------------------------------------------

On 2014-04-18T18:22:24Z, dockimbel, commented:
<https://github.com/red/red/issues/770#issuecomment-40831601>

    Sorry for the regression, we need to add some tests to avoid that happening again.

--------------------------------------------------------------------------------

On 2014-04-19T04:24:08Z, WayneCui, commented:
<https://github.com/red/red/issues/770#issuecomment-40860408>

    No worries. Hope Red will get better and better. :-)

--------------------------------------------------------------------------------

On 2014-04-19T15:32:06Z, dockimbel, commented:
<https://github.com/red/red/issues/770#issuecomment-40872332>

    Well, reporting bugs is a very good way to help make it better. :-)

