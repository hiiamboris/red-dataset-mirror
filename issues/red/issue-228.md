
#228: Unit tests fc-5 and fc-9 not passing
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/228>

From float-test and float32-test.

```
    fcfoo: func [a [float!] return: [float!]][a]

    fcptr: declare struct! [a [float!]]
    fcptr/a: 3.0 

    --test-- "fc-5"
    --assertf~= 5.0 - fcptr/a 2.0 1E-10             ;-- imm/reg(path!)

    --test-- "fc-9"
    --assertf~= (fcfoo 5.0) - 3.0 2.0 1E-10         ;-- reg(block!)/imm

```



