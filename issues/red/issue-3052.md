
#3052: Exception in compiled functions recursively called does not restore contexts
================================================================================
Issue is closed, was reported by dockimbel and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3052>

This issue happens only if:
* a compiled function is recursively called (interpreted functions don't have such issue)
* the exception stops in one of the recursive calls (if stopping out of recursive calls, no issue).

```
foo: func [a][
    switch a [
        1 [foo 2]
        2 [try/all [foo 3]]
	3 [cause-error 'math 'zero-divide []]
    ]
    ?? a
]
foo 1

foo: func [a][
    switch a [
	1 [foo 2]
	2 [attempt [foo 3]]
	3 [cause-error 'math 'zero-divide []]
    ]
    ?? a
]
foo 1
```
outputs:
```
a: a
a: 1
a: 3
a: 1
```
Correct result should be:
```
a: 2
a: 1
a: 2
a: 1
```


Comments:
--------------------------------------------------------------------------------

On 2017-09-25T12:44:17Z, dockimbel, commented:
<https://github.com/red/red/issues/3052#issuecomment-331869227>

    Additional test for throws:
    ```
    foo: func [a][
    	switch a [
    		1 [foo 2]
    		2 [try/all [foo 3]]
    		3 [throw 123]
    	]
    	?? a
    ]
    foo 1
    ```

