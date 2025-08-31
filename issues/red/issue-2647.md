
#2647: DOC: to-block <any-string> does not simply blockify its argument
================================================================================
Issue is open, was reported by meijeru and has 4 comment(s).
[type.documentation]
<https://github.com/red/red/issues/2647>

```
>> to-block "abc"
== [abc]
>> type? first to-block "abc"
== word!
>> to-block "a b c"
== [a b c]
>> type? second to-block "a b c"
== word!
>> to-block %abc
== [%abc]
>> type? first to-block %abc
== file!
```
Conclusion: `to-block <string>` does a `load` while on other types it simply blockifies. The conversion matrix is not clear about this.


Comments:
--------------------------------------------------------------------------------

On 2017-05-18T15:13:22Z, geekyi, commented:
<https://github.com/red/red/issues/2647#issuecomment-302434510>

    > The conversion matrix is not clear
    
    Which are you referring to? `conversion-matrix.xlsx` doesn't have anything on `block!` for me.
    However, there is `any-string!` to `any-list!`, which is documented for R3 `to-`:
    > LOAD string as list
    
    In this case, Red is supposed to *blockify* according to the doc:
    > [any-string]
    
    By blockify, I assume you mean:
    ```red
    >> to-block "abc"
    == ["abc"]
    >> to-block "a b c"
    == ["a b c"]
    ```
    
    
    This behaves same in Rebol 2 and 3, except in Rebol2:
    ```rebol
    >> to-block %abc
    == [abc]
    ```
    Since a `file!` is a `string!` underneath, this makes sense in Rebol2.
    
    
    ---
    *I should probably discuss this elsewhere, not in this bug*
    
    So, if you were to make a `block!` from a string you have to do `append [] "a b c"`.
    
    Actually, the following makes more sense for me:
    ```red
    >> to-block "abc"
    == [#"a" #"b" #"c"]
    >> to-block %abc/def    ; not exactly sure about the precise output here
    == [%abc %def]
    ```
    Intuitively, I want a `series!` to "explode" to it's constituent parts when I do `to-block`.
    However, the counter argument is about the use-case for this, as `[#"a" #"b" #"c"]` behaves almost like `"abc"`.
    In the case of `path!` however, it isn't the same:
    
    ```red
    >> blk-path: to-block %abc/def
    == [%abc/def]
    >> blk-path/1
    == %abc/def
    >> blk-path/1/1
    == %abc/def/1
    >> first blk-path
    == %abc/def
    >> first first blk-path
    == #"a"
    ```
    
    I'm close to hijacking this bug for something else, so I'll stop now 😄 

--------------------------------------------------------------------------------

On 2020-07-30T16:38:22Z, 9214, commented:
<https://github.com/red/red/issues/2647#issuecomment-666513247>

    I wonder if it should enclose value in a block in all cases, regardless of the type. For the reference, Rebol loads `any-string!` during conversion to `any-list!`, Red does that only with `string!`.

