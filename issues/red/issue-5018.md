
#5018: [Compiler] Has no `self` in exported methods
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.resolved] [type.compiler]
<https://github.com/red/red/issues/5018>

**Describe the bug**

This code:
```
Red []
fun: none
c: context [
	x: none
	set 'fun does [
		do [self/x: 123]
		?? x
	]
]
fun
```
Compiles (`-c`) but errors out when run:
```
*** Script Error: self is unset in path self/x:
*** Where: set-path
*** Stack:
```
Same thing if everything is wrapped in another `outer: context [fun: none ...]`

**Expected behavior**

As interpreted

**Platform version**
```
Red 0.6.4 for Windows built 22-Dec-2021/17:36:36+03:00  commit #328c904
```



Comments:
--------------------------------------------------------------------------------

On 2022-02-23T13:57:49Z, dockimbel, commented:
<https://github.com/red/red/issues/5018#issuecomment-1048808277>

    That code pattern cannot be handled by the Red compiler. The reason is that the `c` object is compiled while the `[self/x: 123]` part is encoded in Redbin format (because `do` implies a call to the interpreter), to be decoded and evaluated at run-time. Redbin cannot store information related to compiled code, so the link between that `self` and the `c` object cannot be salvaged and be restored at run-time.
    
    An alternative way to write such code that works with the compiler is by making that link explicit:
    
    ```
    fun: none
    c: context [
        x: none
        obj: self
        set 'fun does [
            do bind [obj/x: 123] 'x
            ?? x
        ]
    ]
    fun
    ```
    Note if that set-path expression is not wrapped in a `do` call, then the compiler can handle it fine:
    ```
    fun: none
    c: context [
        x: none
        set 'fun does [
            self/x: 123
            ?? x
        ]
    ]
    fun
    ```

--------------------------------------------------------------------------------

On 2022-02-23T14:22:41Z, hiiamboris, commented:
<https://github.com/red/red/issues/5018#issuecomment-1048831990>

    Hehe, tricky. This works too:
    ```
    Red []
    fun: none
    c: context [
    	x: none
    	set 'fun does [
    		do bind [self/x: 123] self
    		?? x
    	]
    ]
    fun
    ```

--------------------------------------------------------------------------------

On 2022-02-23T14:34:46Z, hiiamboris, commented:
<https://github.com/red/red/issues/5018#issuecomment-1048844834>

    And this works:
    ```
    Red []
    fun: none
    c: context [
    	x: none
    	obj: self
    	set 'fun does [
    		do [obj/x: 123]
    		?? x
    	]
    ]
    fun
    ```
    
    @dockimbel does it mean that `self` is not part of object's symbol table, or how is it special that all other words can be resolved by the interpreter except `self`?

