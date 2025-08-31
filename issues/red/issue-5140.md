
#5140: `body-of`/`to block! object` are lossy
================================================================================
Issue is open, was reported by hiiamboris and has 10 comment(s).
[type.design]
<https://github.com/red/red/issues/5140>

chat :point_up: [May 15, 2022 6:02 PM](https://gitter.im/red/red?at=62811621fa846847c9678a96)

**Describe the bug**

There are plenty of reasons for converting object to block, either to iterate over (`foreach [word value]`) or to convert to a map, or just to insert as data somewhere.

However, current conversion is lossy:
```
>> o: object [a: quote 'v b: 'v]
== make object! [
    a: 'v
    b: 'v
]
>> to [] o
== [
    a: 'v 
    b: 'v
]
```
Words get converted to lit-words, and then there's no way to tell them apart from real lit-words in the object.

`body-of object` behaves exactly the same as `to block!` (lossy), but one would expect it to be an exact mix of `words-of` and `values-of`, otherwise it's a consistency surprise.

**To reproduce**
`to [] object [k: 'v]`
`body-of object [k: 'v]`

**Expected behavior**

No conversion of values into other types. If `mold` needs this, `mold` should handle it itself.

**Platform version**
```
Red 0.6.4 for Windows built 15-May-2022/2:37:39+03:00  commit #2b72c44
```



Comments:
--------------------------------------------------------------------------------

On 2022-05-15T21:09:43Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5140#issuecomment-1127032913>

    In Rebol `>> to-block make object! [a: 22 b: 'b]` converts to:
    
    ```
    == [make object! [
            a: 22
            b: 'b
        ]]
    ```
    
    Which is the same of
    ```
    append copy [] make object! [a: 22 b: 'b]
    == [make object! [
            a: 22
            b: 'b
        ]]
    ```
    
    But in RED it converts juts to block: 
    
    ```
    >> to-block construct [a: 22 b: b]
    == [
        a: 22 
        b: 'b
    ]
    ```
    
    Which is exactly the same result of `body-of`
    ```
    body-of construct [a: 22 b: 'b]
    == [
        a: 22 
        b: 'b
    ]
    ```
    
    My suggestion is to change `to-block` so it returns VALUES in the original unquoted format when `WORD` (like in R2 `body-of`) which construct could digest as:
    
    == [
        a: 22 
        b: b ;<<<----- Unquoted
    ]
    
    
    A last note:  we don't have any format that `make object!` could digest as: `[a: 22 b: quote 'b]`. `body-of` could return it while `to-object` could return `construct` syntax
    

--------------------------------------------------------------------------------

On 2022-05-15T21:27:28Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5140#issuecomment-1127041464>

    More about this topic here: https://github.com/red/REP/issues/100

--------------------------------------------------------------------------------

On 2022-07-03T21:27:31Z, Oldes, commented:
<https://github.com/red/red/issues/5140#issuecomment-1173174846>

    @GiuseppeChillemi you should be more specific when you say Rebol as there are at least 3 or 4 Rebol versions now.
    1. Rebol2
    2. R3-alpha (the abandoned Carl's version)
    3. My Rebol3 branch
    4. Ren-C (but who know what was changed there this week and is it still Rebol?)
    
    But regarding this issue, this is what is in my Rebol3 now:
    ```rebol
    >> to-block object [a: quote 'x b: 'x]
    == [
        a: 'x
        b: x
    ]
    
    >> body-of object [a: quote 'x b: 'x]  
    == [
        a: 'x
        b: x
    ]
    ```
    In Rebol2 `to-block` is equal to:
    ```rebol
    >> append [] object [a: quote 'x b: 'x]
    == [make object! [
        a: 'x
        b: 'x
    ]]
    ```
    The output of `mold` used for the result is lossy as well. Even in my version now.
    
    Ren-C has some concept of multi-quoting. I suppose that you would use `object [a: ''x b: 'x]`, but I don't have access to Ren-C for a try. 

--------------------------------------------------------------------------------

On 2022-07-03T21:37:57Z, Oldes, commented:
<https://github.com/red/red/issues/5140#issuecomment-1173176271>

    Possible solution for the `mold` issue is use of the construction syntax, which does not reduces the body:
    `#[object! [a: 'x b: x]]`. But that is buggy in Rebol3 as well for now:
    ```rebol
    >> body-of #[object! [a: 'x b: x]]
    == [
        a: x ;<--- should be: 'x
        b: x
    ]
    
    >> body-of #[object! [a: 'x b: now]]
    == [
        a: x ;<--- should be: 'x
        b: now
    ]
    ```

--------------------------------------------------------------------------------

On 2024-02-12T08:08:50Z, hiiamboris, commented:
<https://github.com/red/red/issues/5140#issuecomment-1938204757>

    Of special annoyance is the map construction case:
    ```
    >> m: to map! to block! object [
    	a: to word! "a"
    	b: to string! 'b
    ]
    >> ?? m
    m: #(
        a: 'a 
        b: "b"
    ) 
    >> type? m/a 
    == lit-word! 
    ```
    Requires another run through the map to convert lit-words into words.

