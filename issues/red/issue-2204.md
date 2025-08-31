
#2204: Odd make hash!, map! behavior.
================================================================================
Issue is closed, was reported by ifgem and has 4 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/2204>

#2203 #2202

hash!

```
make hash! [%] => make hash! [%""]
make hash! [% %] => make hash! [% %""]
make hash! [10x] => make hash! [10 x]
make hash! [10h-1] => make hash! [16 -1] ; don't know if it's a bug.
```

map!

```
make map! [@ 10] make map! [% 10] => why @,% aren't word!

make map! [10x] => %(10 x)
make map! [%]
*** Script Error: invalid argument: [%""]
*** Where: make
test: make map! [% %] => #(%: %"")
; But it can't be used:
test/%
*** Syntax Error: invalid path! at "h/%"
*** Where: do
; and so
select #(% %) '%
```



Comments:
--------------------------------------------------------------------------------

On 2016-09-05T22:27:23Z, qtxie, commented:
<https://github.com/red/red/issues/2204#issuecomment-244817451>

    Those are lexer issues, rather than `hash!` and `map` issues.

--------------------------------------------------------------------------------

On 2019-09-09T18:24:41Z, dockimbel, commented:
<https://github.com/red/red/issues/2204#issuecomment-529605938>

    Those are indeed lexer issues and not related to map or hash. Given that the aforementioned related tickets have been fixed, it now behaves as it should:
    ```
    >> [%]
    == [%]
    >> [% %]
    == [% %]
    >> [10x]
    *** Syntax Error: invalid pair! at "10x]"
    *** Where: do
    *** Stack: load 
    >> [10h-1]
    *** Syntax Error: invalid integer! at "10h-1]"
    *** Where: do
    *** Stack: load 
    ```
    
    > make map! [@ 10] make map! [% 10] => why @,% aren't word!
    
    `%` is allowed to be used as a standalone word, as Red/System relies on it for modulo operator. `@` denotes an email only for now.
    
    > test: make map! [% %] => #(%: %"")
    > ; But it can't be used:
    > test/%
    > *** Syntax Error: invalid path! at "h/%"
    > *** Where: do
    > ; and so
    > select #(% %) '%
    
    Literal paths don't support all literal values that can be used as keys in maps (like `char!` and `string!`). `select` can be used in such cases:
    ```
    >> select #(% %) '%
    == %
    ```

