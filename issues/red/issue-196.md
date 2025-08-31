
#196: Can modify bytes in a c-string argument but not assign a string
================================================================================
Issue is closed, was reported by PeterWAWood and has 14 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/196>

When a c-string is passed as an argument to a function, assigning a replacement string has no effect nor is a compiler error (or warning) message reported. It is possible to modify a c-string by accessing individual bytes.

Example Code:

``` rebol
Red/System []

f: func [
  s [c-string!]
][
  s: "12345" 
]

s: "abcde"
print ["before f: " s lf]
f s
print ["after f: " s lf]

f2: func [
  s [c-string!]
][
  s/1: #"1"
  s/2: #"2"
  s/3: #"3"
  s/4: #"4"
  s/5: #"5"
]

s: "abcde"
print ["before f2: " s lf]
f2 s
print ["after f2: " s lf]
```

Output:

```

-= Red/System Compiler =- 
Compiling /Users/peter/Code/Red-System/test.reds ...
Script: "Red/System IA-32 code emitter" (none)
Script: "Red/System Mach-O format emitter" (none)

...compilation time:     97 ms
...linking time:         8 ms
...output file size:     16384 bytes
before f: abcde
after f: abcde
before f2: abcde
after f2: 12345
```



Comments:
--------------------------------------------------------------------------------

On 2012-01-12T23:23:43Z, dockimbel, commented:
<https://github.com/red/red/issues/196#issuecomment-3472535>

    A c-string! is a pointer class of datatype. So assigning a c-string! local variable (arguments are local variables too) to a new string means making the local variable point to another memory area. This does not affect the initial memory area of the string referenced just before.
    
    When passing a c-string! reference to a local function, as long as the local variable still points to that memory area, you can freely modify it.
    
    This is all normal behavior in Red/System. You would get exactly the same behavior if you replace `c-string!` by `string!` and run the exact same code in REBOL.

--------------------------------------------------------------------------------

On 2012-01-13T02:36:18Z, PeterWAWood, commented:
<https://github.com/red/red/issues/196#issuecomment-3474511>

    On 13 Jan 2012, at 07:23, Nenad Rakocevic wrote:
    
    > A c-string! is a pointer class of datatype. So assigning a c-string! local variable (arguments are local variables too) to a new string means making the local variable point to another memory area. This does not affect the initial memory area of the string referenced just before.
    > 
    > When passing a c-string! reference to a local function, as long as the local variable still points to that memory area, you can freely modify it.
    > 
    > This is all normal behavior in Red/System. You would get exactly the same behavior if you replace `c-string!` by `string!` and run the exact same code in REBOL.
    > 
    > ---
    > 
    > Reply to this email directly or view it on GitHub:
    > https://github.com/dockimbel/Red/issues/196#issuecomment-3472535
    
    Thanks for the clarification. I thought that as c-string argument was being passed by reference, I could assign a new value to it. My misunderstanding came from not properly understanding how "set-word" assigns a new value to a "word". I didn't realise a new memory "slot" would be allocated and a new pointer be assigned to the argument (which must be a copy of the original pointer). [So effectively the pointer is passed by "value" and not by "reference").
    
    The reason that I wanted to assign a new value to the original memory location is that I wanted to avoid returning a c-string! from a function as I cannot see a way to avoid creating a memory leak. Again it may be a misunderstanding on my part. 
    
    Would the memory allocated to the values referred to by s1 and s2 in the following function be deallocated on exit from the function?
    
    ```
    f: func [
        s1      [c-string!]
        return: [c-string!]
        /local
        s2      [c-string!]
    ][
        s2: replace s1 #"a" #"1"                ;; replace function - to be written
        s1: "a2345"
        s2
    ]
    ```

--------------------------------------------------------------------------------

On 2012-01-13T13:26:21Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/196#issuecomment-3479607>

    No, they're not freed, but you wouldn't want them to. You're modifying the original s1 and then returning it as s2, so you need it outside the function. It's one and the same string.
    
    The new s1 is not returned, so it is useless data that stays within the function.

--------------------------------------------------------------------------------

On 2012-01-13T14:34:06Z, PeterWAWood, commented:
<https://github.com/red/red/issues/196#issuecomment-3480353>

    So returning a c-string! from a function can give rise to a memory leak as the calling program has no way to release the memory allocated to the c-string! 

--------------------------------------------------------------------------------

On 2012-01-13T20:01:30Z, dockimbel, commented:
<https://github.com/red/red/issues/196#issuecomment-3485309>

    No memory leak there, the literal c-string! inside the function is statically allocated once for all when the program starts. It is part of the executable data segment.

--------------------------------------------------------------------------------

On 2012-01-13T20:21:51Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/196#issuecomment-3485572>

    As Doc said, it's really the same behaviour as REBOL. The strings are series and s1 and s2 are references to them. The literal string is part of the program block. When you assign a literal string in a function to an outside reference, you would add a COPY in REBOL to prevent outside code from modifying the program code. The only conceptual difference in Red/System is that modern operating systems wouldn't allow you to modify the literal string, because it's in the data segment of the executable. If you were to implement COPY in Red/System, the literal string would be copied to a heap-allocated string, and only then would it need extra freeing.
    
    Not sure if that makes it clearer. :-)

--------------------------------------------------------------------------------

On 2012-01-13T23:44:47Z, PeterWAWood, commented:
<https://github.com/red/red/issues/196#issuecomment-3488424>

    Thanks for the explanations.

