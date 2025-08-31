
#3017: EXTERN only works the first time the parent function is called.
================================================================================
Issue is closed, was reported by WiseGenius and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3017>

Example code:

```
f1: function [][
	x: 1
	y: 2
	f2: function [/extern x][
		?? x
		x: 2
	]
	f2
	?? x
]
loop 3 [
	f1
]
```

Expected result:
```
x: 1
x: 2
x: 1
x: 2
x: 1
x: 2
```

Current result when interpreted:
```
x: 1
x: 2
x: none
x: 1
x: none
x: 1
```

Current result when compiled:

```
x: 1
x: 1
x: 1
```


Comments:
--------------------------------------------------------------------------------

On 2017-09-06T08:50:23Z, dockimbel, commented:
<https://github.com/red/red/issues/3017#issuecomment-327418759>

    As a temporary workaround, you can use:
    ```
    f2: function copy [/extern x][
    ```

