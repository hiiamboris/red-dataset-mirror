
#2411: Infinite loop on using copy any in #macro rule block
================================================================================
Issue is closed, was reported by ifgem and has 6 comment(s).
[status.resolved] [type.documentation]
<https://github.com/red/red/issues/2411>

```
expand [
	#macro [copy nums [any integer!]] []
]
```


Comments:
--------------------------------------------------------------------------------

On 2017-02-13T16:01:45Z, dockimbel, commented:
<https://github.com/red/red/issues/2411#issuecomment-279435191>

    I get a syntax error running your code from the console:
    ```
    *** Preprocessor Error: Syntax error
    *** Where: #macro [copy nums [any integer!]] []
    ```
    I can reproduce a freezing using the following code:
    ```
    expand [
        #macro [copy nums any integer!] func [[manual] s e][e]
    ]
    ```

--------------------------------------------------------------------------------

On 2017-02-14T05:11:21Z, dockimbel, commented:
<https://github.com/red/red/issues/2411#issuecomment-279610100>

    Actually, the issue is partially caused by a misuse of the return value in pattern-matching macros. The [documentation](https://doc.red-lang.org/en/preprocessor.html) is not up to date, and describes the old behavior of pattern-matching macros, and lacks mention of *manual* mode.

--------------------------------------------------------------------------------

On 2017-02-14T10:54:41Z, dockimbel, commented:
<https://github.com/red/red/issues/2411#issuecomment-279675468>

    The infinite loop is caused by your usage of `any`, matching 0 or more instances of `integer!`. You should have used `some` instead. Here is a fixed version:
    ```
    expand [
        #macro [copy nums some integer!] func [[manual] s e][?? nums e]
        print [1 2 3]
    ]
    ```
    which would output:
    ```
    nums: [1 2 3]
    [print [1 2 3]]
    ```

