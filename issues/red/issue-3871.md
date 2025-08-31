
#3871: INPUT crashes on Windows
================================================================================
Issue is closed, was reported by qtxie and has 0 comment(s).
[status.built] [type.bug]
<https://github.com/red/red/issues/3871>

**To reproduce**
Compile and run the following script on Windows:
```
Red []
#include %red/environment/console/CLI/input.red
arg-str: ask ""
```

**Expected behavior**
Works fine without crashes

**Platform version (please complete the following information)**
All Windows Version



