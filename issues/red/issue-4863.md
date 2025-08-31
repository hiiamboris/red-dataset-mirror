
#4863: PARSE binary includes spaces into datatype match
================================================================================
Issue is closed, was reported by hiiamboris and has 20 comment(s).
[status.built] [status.tested] [test.written] [type.design]
<https://github.com/red/red/issues/4863>

**Describe the bug**
```
>> parse to #{} "   word" [word!]
== true
>> parse to #{} "   word" [copy w word! (probe to "" w)]
"   word"
== true
>> parse to #{} "   123" [copy i integer! (probe to "" i)]
"   123"
== true
>> to integer! "   123"
*** Script Error: cannot MAKE/TO integer! from: "   123"
*** Where: to
*** Stack:  
```

**Expected behavior**

Should skip leading spaces.
```
>> parse to #{} "   word" [word!]
== false
>> parse to #{} "word" [word!]
== true
```

**Platform version**
```
Red 0.6.4 for Windows built 18-Mar-2021/22:28:01+03:00  commit #73d9bd2
```



Comments:
--------------------------------------------------------------------------------

On 2021-04-13T19:34:59Z, meijeru, commented:
<https://github.com/red/red/issues/4863#issuecomment-819000651>

    The expected behaviour is explicitly stated in section 2.3 of the Parse doc:
    "binary!: matching by datatype or type set is supported for UTF-8 encoded values; such match succeeds if matched portion of the input represents one of the datatype’s literal forms. _Blank characters before tokens are automatically skipped_."
    
    I would presume that _blank_ means _whitespace_ since that is more general.

--------------------------------------------------------------------------------

On 2021-04-13T19:58:01Z, hiiamboris, commented:
<https://github.com/red/red/issues/4863#issuecomment-819013861>

    I think this is:
    1. A source of confusion: you expect `integer!`, whereas the result is not directly convertible 
    2. Less practically valuable than extracting the exact datatype match
    
    I understand this is a quirk of current design, but I don't know if it can't be improved.
    I'm okay with marking this a wish, or closing with an explanation why the design can't be better.
    Or maybe `to` converters should be more forgiving and skip spaces? (I'm not in favor of this option)

--------------------------------------------------------------------------------

On 2021-04-14T17:23:59Z, greggirwin, commented:
<https://github.com/red/red/issues/4863#issuecomment-819687943>

    @hiiamboris do we have a `to/load/transcode` table which compares them? In the case of `to` the behavior can be specific in how each type converts to another. We have https://github.com/red/red/wiki/%5BDOC%5D-%60to%60-vs-%60make%60, which only talks about logic values right now, which is a subtlety people can easily trip over.
    
    Why are you not in favor of `to integer!` ignoring spaces in strings? If we argue that it should be a valid integer based on the optimized `tokenizer/scan-integer` implementation, what about this?
    ```
    >> to integer! "123.45"
    == 123
    ```

--------------------------------------------------------------------------------

On 2021-04-14T17:28:03Z, greggirwin, commented:
<https://github.com/red/red/issues/4863#issuecomment-819690372>

    And we have other cases, which makes me think we need to address this in general. e.g. why are leading spaces allowed for pairs, but not trailing spaces?
    ```
    >> to pair! " 1x2"
    == 1x2
    >> to pair! " 1x2 "
    *** Script Error: cannot MAKE/TO pair! from: " 1x2 "
    *** Where: to
    *** Stack:  
    ```

--------------------------------------------------------------------------------

On 2021-04-14T17:35:14Z, hiiamboris, commented:
<https://github.com/red/red/issues/4863#issuecomment-819694606>

    > Why are you not in favor of `to integer!` ignoring spaces in strings?
    
    No solid reason, but IMO usually it's easier to extend a stricter design than to narrow a loose one.
    
    > @hiiamboris do we have a `to/load/transcode` table which compares them?
    
    @giesse has a `to` table stashed somewhere on google docs but I lost the link. Also https://github.com/red/red/blob/master/docs/conversion-matrix.xlsx but it says on string to integer that:
    > LOAD string as integer
    
    Which in no way explains why "123.45" rounds without error. Though if we interpret that as `to integer! load "123.45"` then makes sense.

--------------------------------------------------------------------------------

On 2021-04-14T18:03:31Z, giesse, commented:
<https://github.com/red/red/issues/4863#issuecomment-819723087>

    My table was in the context of `format` and compares `form` and `to string!`. 

--------------------------------------------------------------------------------

On 2021-04-15T17:57:12Z, greggirwin, commented:
<https://github.com/red/red/issues/4863#issuecomment-820621919>

    @hiiamboris agreed. Narrowing means breaking things. However, there's also Postel's law to consider: Be liberal in what you accept and conservative in what you send. That doesn't mean being _too_ liberal of course. In this case, we can ask what Red's behavior is for whitespace in general, how `load/transcode` work, and look at `to/make` to provide options and consistency (where @meijeru can weigh in with his broad knowledge). It is tricky though, and how. Having options that give you control are often just a small step from confusing behavior.
    
    Thanks @giesse.

--------------------------------------------------------------------------------

On 2021-07-27T14:39:05Z, dockimbel, commented:
<https://github.com/red/red/issues/4863#issuecomment-887569389>

    The leading space skipping was used to mimic the `parse` behavior in R2, where blanks are skipped automatically. That allowed to write nicer and easier rules like: 
    ```
    parse to-binary "hello 123 world" [word! integer! word!]
    == true
    ```
    Removing that feature will force the equivalent of `parse/all` mode in R2, so that the above example becomes then:
    ```
    parse to-binary "hello 123 world" [word! space integer! space word!]
    == true
    ```
    As said above, when someone wants to mostly match Red literal forms, he should rather use `load` or `transcode` and eventually customize the behavior using a lexer callback.
    
    So, I propose the following rules:
    * For `load` and `transcode`: allow blanks before/after tokens (already the case and necessary anyway).
    * For `to` and `parse`: strictly match the target datatype (need to change the implementation).
    
    E.g.:
    ```
    parse to-binary "word" [word!]				; true
    parse to-binary "   word" [word!]			; false
    parse to-binary "123" [integer!]			; true
    parse to-binary "123.456" [integer!]			; false
    parse to-binary "    123" [integer!]			; false
    ```
    ```
    >> to-integer "123"
    == 123
    >> parse to-binary "   word" [copy w word! (probe to-string w)]
    == false
    >> parse to-binary "word" [copy w word! (probe to-string w)]
    "word"
    == true
    >> parse to-binary "   123" [copy i integer! (probe to-string i)]
    == false
    >> parse to-binary "123" [copy i integer! (probe to-string i)]
    "123"
    == true
    ```

--------------------------------------------------------------------------------

On 2021-07-27T18:35:36Z, giesse, commented:
<https://github.com/red/red/issues/4863#issuecomment-887740256>

    I recently added a `load-next` keyword to `topaz-parse` as I needed it.
    
    ```
    >> topaz-parse "123" [load-next]
    == 123
    >> topaz-parse "   123" [load-next]
    == 123
    >> topaz-parse " word" [load-next]
    == word
    ```
    
    It's just calling `load/next` on the current position, which skips spaces.

--------------------------------------------------------------------------------

On 2021-08-20T15:06:29Z, dockimbel, commented:
<https://github.com/red/red/issues/4863#issuecomment-902760452>

    > For to and parse: strictly match the target datatype (need to change the implementation).
    
    This rule has been implemented.

