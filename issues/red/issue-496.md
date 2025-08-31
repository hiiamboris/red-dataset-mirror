
#496: Pointer arithmetic issue
================================================================================
Issue is closed, was reported by Respectech and has 4 comment(s).
<https://github.com/red/red/issues/496>

Perhaps related to issue #493 ...

In my code, I have a pointer named 'img3p.

If I try to access a nearby value using something like:

```
as-integer img3p + 4
```

I get the pointer value, and not the value of the memory location at that pointer.  However, if I use the following code:

```
i4: 4
as-integer img3p/i4
```

Then I get the value of the memory location at that pointer.

Am I doing something wrong, or misunderstanding how pointers work?  Do I have to do something like this for it to work as intended?:

```
tmp: img3p + 4
as-integer tmp/1
```



Comments:
--------------------------------------------------------------------------------

On 2013-07-08T18:36:44Z, dockimbel, commented:
<https://github.com/red/red/issues/496#issuecomment-20626467>

    These are two different levels of indirections. The first expression is simple pointer arithmetic, you get a new pointer value as a result:
    
    ```
    img3p + 4
    ```
    
    While in the second case, you are dereferencing the pointer with an offset, getting then the pointed value:
    
    ```
    i4: 4
    img3p/i4
    ```
    
    See in the reference documentation: [Derefencing](http://static.red-lang.org/red-system-specs.html#section-4.8.3) and [Pointer Arithmetic](http://static.red-lang.org/red-system-specs.html#section-4.8.4).

--------------------------------------------------------------------------------

On 2013-07-09T00:58:27Z, Respectech, commented:
<https://github.com/red/red/issues/496#issuecomment-20647056>

    Thanks for clarifying that.

