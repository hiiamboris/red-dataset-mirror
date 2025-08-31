
#79: Function pointer (:f) is not an integer anymore
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/79>

The documentation states: 

> Note: Function address is curently returned as an integer! value but this could be changed in the future to a function
> pointer!.

Compiling 

```
s: 0 f: func [][] s: :f
```

I get the message

```
 Compilation Error: attempt to change type of variable: s from [integer!] to [function! []]
```

It almost seems that functions are becoming first class values!



Comments:
--------------------------------------------------------------------------------

On 2011-06-06T18:57:04Z, dockimbel, commented:
<https://github.com/red/red/issues/79#issuecomment-1311062>

    The specification draft has not been updated yet wrt all the recent changes.
    
    The `function!` symbol you can see there is a pseudo-type, which purpose is just to be able to verify functions signatures compatibility, when using a function as a callback. Actually, I hesitated between `callback!` and `function!` for that pseudo-type. It is still quite far from a full-featured first class value.

--------------------------------------------------------------------------------

On 2011-06-06T19:55:42Z, meijeru, commented:
<https://github.com/red/red/issues/79#issuecomment-1311418>

    Of course it is not a first-class value, but the documentation is not right either, and one cannot store values of this kind in a variable, owing to the type-check.

--------------------------------------------------------------------------------

On 2011-06-07T21:46:29Z, dockimbel, commented:
<https://github.com/red/red/issues/79#issuecomment-1322860>

    Updated specification draft (commit [cc5a72b7](https://github.com/dockimbel/Red/commit/cc5a72b71e6b2bce9ac4643e95d7c0b2b6053f50)) and implementation (commit [bf16cab6](https://github.com/dockimbel/Red/commit/bf16cab6df015cb5ab138ffe554bd46c03bf4d2e)) to allow using function pointer get-word syntax in expressions (a type casting would be required).
    
    Tested OK using following code:
    
    ```
    inc: func [[callback] a [integer!]][a + 1]
    i: as integer! :inc
    print form-hex i
    ```
    
    outputs (on my Windows instance):
    
    ```
    401434
    ```
    
    which is the right hex address for 'inc function as verified by disassembling the executable:
    
    ```
     L00401434:
            push    ebp
            mov ebp,esp
            mov eax,[ebp+08h]
            inc eax
            leave
            retn    0004h
    ```

