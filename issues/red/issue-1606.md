
#1606: Gui-Console closes itself without showing error when executing script
================================================================================
Issue is closed, was reported by ghost and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1606>

`filename: test.red`

```
Red []

print
```

`red --cli test.red` produces

```
*** Script error: print is missing its value argument
*** Where: print
```

Whereas red test.red opens the gui-console and immediately automatically closes it.
Expected behaviour: The gui-console should open, print the error and pause itself waiting for user input.
![](https://files.gitter.im/red/red/gui-branch/g2fc/doesnt-show-errors.gif)



