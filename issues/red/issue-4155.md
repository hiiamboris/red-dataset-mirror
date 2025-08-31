
#4155: Red/System script header limitations
================================================================================
Issue is closed, was reported by 9214 and has 2 comment(s).
[status.built] [Red/System] [type.documentation]
<https://github.com/red/red/issues/4155>

**Describe the bug**

Red/System header has a couple of limitations WRT its content, which I think should be at least mentioned and documented for the time being.

**To reproduce**

* `date!` values cannot be processed
```red
Red/System [01/01/01]
```
```red
Compiling to native code...
*** Syntax Error: Invalid tuple! value
*** line: 1
*** at: "01/01/01]"
```

* `tuple!` values cannot be processed
```red
Red/System [1.1.1]
```
```red
Compiling to native code...
*** Compilation Error: invalid program header at: [#~010101]
*** in file: ...
*** at line: 1
*** near: [[#~010101]]
```

* Unicode `char!`s cannot be processed, which is expected, since Rebol2 has no support for them; ditto for `string!`s and symbol-based values:
```red
Red/System [#"🙃"]
```
```red
Compiling to native code...
*** Loading Error: unsupported literal byte: 0001F643
*** in file: ...
*** at line: 1
```

* header should strictly follow `set-word! any-value!` format

```red
Red/System [foo]
```

```red
Compiling to native code...
*** Compilation Error: invalid program header at: [foo]
*** in file: ...
*** at line: 1
*** near: [[foo]]
```

**Expected behavior**
I realize that all of that are either limitations of Rebol2 or attempts to bypass them, so I don't expect any miracles. Having truly free-form header, like in Red, would be nice though.

**Platform version**

```
Red 0.6.4 for Windows built 26-Nov-2019/13:34:30+01:00 commit #adfd221
```


Comments:
--------------------------------------------------------------------------------

On 2022-09-16T14:57:06Z, dockimbel, commented:
<https://github.com/red/red/issues/4155#issuecomment-1249472827>

    The R/S header syntax and limitations have always been documented:  https://static.red-lang.org/red-system-specs.html#section-17.2
    
    I'll improve a bit the visual emphasis for the implemenation note.

