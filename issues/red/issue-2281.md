
#2281: regression: "do" vs "do load"
================================================================================
Issue is closed, was reported by x8x and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2281>

file `%data`:

```
#(
key: 'value
)
```

file `%code.red`:

```
Red []
probe do %data
```

run it:

```
  % red code.red
*** Script Error: expand-directives does not allow map! for its code argument
*** Where: expand-directives
```

Thought, replacing `do` with `do load` does work in this case. `do` was working fine alone before



