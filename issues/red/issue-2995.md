
#2995: A GUI code without [ needs: 'view] on header should cause an error on compile-time instead of on run-time.
================================================================================
Issue is closed, was reported by Blocode and has 4 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/2995>

```Red
Red []
view [button "OK"]
```
There is no problem while compiling. But running the generated executable code will show an error like this.
```Red 
*** Script Error: view has no value
*** Where: ???
```


Comments:
--------------------------------------------------------------------------------

On 2017-08-23T08:20:37Z, meijeru, commented:
<https://github.com/red/red/issues/2995#issuecomment-324257287>

    How should the compiler detect that this is GUI code?

--------------------------------------------------------------------------------

On 2017-09-13T13:25:56Z, dockimbel, commented:
<https://github.com/red/red/issues/2995#issuecomment-329167000>

    The compiler cannot guess if you meant `view` from the View module, or just made a typo, or just forgot to define a function called `view` in your code...

