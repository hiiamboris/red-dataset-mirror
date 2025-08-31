
#4562: left shift (<<) words are not lexed correctly
================================================================================
Issue is closed, was reported by 9214 and has 4 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/4562>

**Describe the bug**
`any-word!` values that have a type other than `word!` and a `<<` spelling are not lexed correctly.

**To reproduce**
```red
>> [>> '>> >>: :>>]
== [>> '>> >>: :>>]

>> [<< '<< :<<] 
== [<< '< < :< <]
>> <<:
*** Syntax Error: (line 1) invalid word at <<:
*** Where: transcode
*** Stack: load 
```

**Expected behavior**
```red
>> [<< '<< <<: :<<] 
== [<< '<< <<: :<<]
```

**Platform version**
 b452716


Comments:
--------------------------------------------------------------------------------

On 2021-05-16T11:06:45Z, hiiamboris, commented:
<https://github.com/red/red/issues/4562#issuecomment-841802031>

    This issue prevents me from making `<`-based operators:
    ```
    >> -<-
    *** Syntax Error: (line 1) invalid word at -<-
    *** Where: case
    *** Stack: load 
    >> =<=
    *** Script Error: <= operator is missing an argument
    *** Where: catch
    *** Stack:  
    
    >> _<_
    <    
    (escape)
    >> ~<~
    <    
    (escape)
    >> !<!
    <    
    (escape)
    >> |<|
    <    
    (escape)
    >> *<*
    <    
    (escape)
    >> .<.
    *** Script Error: .<. has no value
    *** Where: =
    *** Stack:  
    ```
    `.<.` is the only one that works. But it's ugly.
    I have to use unicode in operators names because of that: `◄=`, `◄`, etc.

--------------------------------------------------------------------------------

On 2021-09-11T12:45:58Z, dockimbel, commented:
<https://github.com/red/red/issues/4562#issuecomment-917401626>

    "-<-" and "=<=" are now allowed. 
    
    Why the other literal forms are not supported too? `-` and `=` are special characters in the lexer main table, so specific parsing rules can be applied to them (to some extent). The other proposed characters are valid words, but the "sticky word in front of a tag" rule will detach them as standalone words. Moreover, those characters are not specifically identified in the lexer table. We could add them, but the extra footprint in the table could impact the performances as the table has been optimized to fit in most CPU L1 caches. If the need arises to support specific forms, we could consider adding them to the lexer table on a case by case basis.

