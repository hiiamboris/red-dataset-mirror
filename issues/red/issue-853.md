
#853: /extern misbehaving in interpreter
================================================================================
Issue is closed, was reported by WiseGenius and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/853>

All of the cases in issue #825 have been fixed except the one interpreting `function [/extern theText]`:

**Code**:

```
theText: "outside"
theFun: function [/extern theText] [theText: "Hello, World!" ?? theText]
?? theFun
theFun
?? theText
```

**Expected** output:

```
theFun: func [][theText: "Hello, World!" ?? theText]
theText: "Hello, World!"
theText: "Hello, World!"
```

**Interpreter** gives:

```
theFun: func [/extern theText][theText: "Hello, World!" ?? theText]
theText: "Hello, World!"
theText: "outside"
```

**Compiler** behaves **as expected**:

```
theFun: func [][theText: "Hello, World!" ?? theText]
theText: "Hello, World!"
theText: "Hello, World!"
```



Comments:
--------------------------------------------------------------------------------

On 2014-06-16T06:29:01Z, dockimbel, commented:
<https://github.com/red/red/issues/853#issuecomment-46144793>

    Thank you for retesting it.

