
#5183: `transcode/next` at end-of-input design issue
================================================================================
Issue is open, was reported by hiiamboris and has 28 comment(s).
[type.design]
<https://github.com/red/red/issues/5183>

**Describe the bug**

Discussion originates from [here](https://gitter.im/red/bugs?at=62eb9aed11a6a83d04a501ed)
Summary:
```
>> s: "ab cd ef [] ;oops"
== "ab cd ef [] ;oops"
>> while [not tail? s] [set [x: s:] transcode/next s probe x]
ab
cd
ef
[]
[]
```
Getting 2 blocks above is crap. We can't tell real block from this illusion. Return `none`? Same issue - won't be able to tell `#[none]` from illusion. Return `unset`? Again the same issue.

This also concerns it's `transcode/one` sibling.

**Expected behavior**

My proposal is to throw an error from transcode if no value can be returned. Alternatively, `throw` some `end-of-input` token.

Then a dumb and reliable transcoding loop could look like:
```
try [forever [set/any [x: s:] transcode/next s probe x]]
;) here we're at the end of input, unless `try` caught another error
;) e.g. an invalid token, or an error elsewhere in the code
```
(one's burden here is to tell end-of-input from input errors and from other errors)
or
```
catch/name [forever [set/any [x: s:] transcode/next s probe x]] 'transcode
;) here we're totally at the end of input
```
I guess one more option is for `transcode/next` to return an empty block at end of input. One then could check for length:
```
while [not empty? set/any [x: s:] transcode/next s] [probe x]
```
This is not applicable to `transcode/one` however, which should in this scenario throw an error (requested `/one` value, but none are available). Probably not such a bad thing either, since where we use `transcode/one` we're *expecting something*.

**Platform version**
```
Red 0.6.4 for Windows built 21-Aug-2022/0:34:02+03:00  commit #948c3ac
```



Comments:
--------------------------------------------------------------------------------

On 2022-08-24T11:03:28Z, dockimbel, commented:
<https://github.com/red/red/issues/5183#issuecomment-1225567955>

    As a side note, `scan`  does not have the same issue:
    ```
    >> s: "ab cd ef [] ;oops"
    == "ab cd ef [] ;oops"
    >> while [not tail? s] [set [x: s:] scan/next s probe x]
    word!
    word!
    word!
    block!
    none
    ```
    So one possible solution could be to extend the `transcode/next` returned block with the scanned datatype, so `none` would signify if the loaded value is real or not. Though, that only solves it for `/next` mode.

--------------------------------------------------------------------------------

On 2022-08-24T11:57:35Z, dockimbel, commented:
<https://github.com/red/red/issues/5183#issuecomment-1225619663>

    I propose `transcode/next` returns an empty block when reaching the end.
    For `transcode/one`, it could indeed raise an error on empty input.

--------------------------------------------------------------------------------

On 2022-08-24T11:59:05Z, hiiamboris, commented:
<https://github.com/red/red/issues/5183#issuecomment-1225622854>

    I just thought a few moments ago, `transcode/next` could also return `none`, like `scan`. 

--------------------------------------------------------------------------------

On 2022-08-24T12:05:09Z, dockimbel, commented:
<https://github.com/red/red/issues/5183#issuecomment-1225630769>

    Notice this subtle difference in `scan/next` behavior:
    
    ```
    >> scan/next ""
    == none
    >> scan/next ";klklkl"
    == [none ""]
    ```

--------------------------------------------------------------------------------

On 2022-08-24T12:08:17Z, hiiamboris, commented:
<https://github.com/red/red/issues/5183#issuecomment-1225633985>

    Why doesn't it return `[none ""]` in both cases?

--------------------------------------------------------------------------------

On 2022-08-24T12:35:47Z, dockimbel, commented:
<https://github.com/red/red/issues/5183#issuecomment-1225664052>

    Seems that it was introduced by a (too) quick fix: https://github.com/red/red/commit/76c7d44014b4b2057df42e2799c6f0f8a340dd56

--------------------------------------------------------------------------------

On 2022-08-24T12:44:27Z, hiiamboris, commented:
<https://github.com/red/red/issues/5183#issuecomment-1225673011>

    I guess there's value in returning an empty string in cases like `parse`, so it could be used as a marker to return to, without extra `none` check that `set [x: pos:]` would otherwise require for `:pos`.
    
    And it's tempting to align `transcode/next` with `scan/next`. But if `transcode/next` always did this, there wouldn't be an easy way to check for the end. Quite a headache ;)

--------------------------------------------------------------------------------

On 2022-08-24T12:46:04Z, hiiamboris, commented:
<https://github.com/red/red/issues/5183#issuecomment-1225675043>

    Could the order be reversed? If it returned not `[value rest]` but `[rest value]`, end condition could be `[rest]` returned (and `single?` as a check).

--------------------------------------------------------------------------------

On 2022-08-24T13:13:15Z, dockimbel, commented:
<https://github.com/red/red/issues/5183#issuecomment-1225709107>

    That would not be convient for debugging, as the `value` part in most cases will be out of sight, especially in the console's output. Also, it looks more intuitive to first provide what you asked for, which is the next loaded value, then leave the "rest" as second element.
    
    If `single?` would be a valid check, why not just skip the `value` part and just have the `rest`? That's what R3 does:
    ```
    >> transcode/next to-binary "123"
    == [123 #{}]
    >> transcode/next to-binary ""
    == [#{}]
    ```
    Not fully satisfying either.
    
    Just returning `none` seems like the cleanest option, though it costs an extra check, at least it's fully explicit and intuitive.

--------------------------------------------------------------------------------

On 2022-08-24T14:19:29Z, hiiamboris, commented:
<https://github.com/red/red/issues/5183#issuecomment-1225792197>

    I guess so.
    @greggirwin @qtxie @Oldes what do you think?

--------------------------------------------------------------------------------

On 2022-08-24T18:00:22Z, greggirwin, commented:
<https://github.com/red/red/issues/5183#issuecomment-1226057131>

    We have 4 funcs, currently, that use `/next` and fall into this "area". One of them is `do`, which deals with evaluation, but can still inform the overall design of `/next`. 
    ```
    do
        /next        => Do next expression only, return it, update block word.
            position     [word!] "Word updated with new block position."
    load
        /next        => Load the next value only, updates source series word.
            position     [word!] "Word updated with new series position."
    scan
         /next        => Returns both the type and the input after the value.
    transcode
         /next        => Translate next complete value (blocks as single value).
         /one         => Translate next complete value, returns the value only.
    ```
    
    And how they behave:
    ```
    >> do/next [] 'pos
    ; Returns unset!
    >> pos
    == []
    >> do/next [()] 'pos
    ; Returns unset!
    >> pos
    == []
    
    >> load/next "" 'pos
    == []
    >> pos
    == ""
    >> load/next #{} 'pos
    == []
    >> pos
    == #{}
    >> load/next "[]" 'pos
    == []
    >> pos
    == ""
    >> load/next %/d/red/test/hello.red 'pos
    == Red
    >> pos
    == #{
    205B5D0D0A0D0A7072696E74202248656C6C6F20776F726C6421220D0A0D0A68
    616C74
    }
    >> to string! pos
    == { []^M^/^M^/print "Hello world!"^M^/^M^/halt}
    >> load/next pos 'pos
    == []
    >> load/next "none" 'pos
    == none
    >> type? load/next "none" 'pos
    == word!
    >> type? load/next "#[none]" 'pos
    == none!
    
    >> scan/next ""
    == none
    >> scan/next "[]"
    == [block! ""]
    >> scan/next "#[none]"
    == [none! ""]
    >> scan/next pos
    == [word! #{202248656C6C6F20776F726C6421220D0A0D0A68616C74}]
    ; Scanned word is `print`
    >> to string! second scan/next pos
    == { "Hello world!"^M^/^M^/halt}
    ; Getting the next position is more work here.
    
    >> transcode/next ""
    == [[] ""]
    >> transcode/next "[]"
    == [[] ""]
    >> transcode/next pos
    == [
        print #{202248656C6C6F20776F726C6421220D0A0D0A68616C74}
    ]
    >> transcode/one pos
    == print
    >> transcode/one ""
    == []
    >> transcode/one "[]"
    == []
    ```
    
    From this we can see that there are cases that it's impossible to tell an empty input from, e.g. `"[]"`. Or that you have to interrogate the result. Separately we can say that each makes sense, or is consistent with at least one other function, but overall it's quite a mix. The functions are mixed in their "level" as well (scan -> transcode -> load -> do), so we can say that each hides the more detailed steps of those used internally.
    
    I suggest we start with expected use cases and look at those code patterns. Not to aim for complete consistency in their interfaces, but to design them systemically, with the knowledge that they all exist. This wasn't possible in the past, because we didn't have `transcode` or `scan`. If we write up the design notes that explain the design, and where/how to leverage each func, that goes a long way in helping users. More than trying to predict what will be intuitive to everyone. Give them templates to work from. Per @hiiamboris' comment on Gitter, with that, empty checks are already there for them.

--------------------------------------------------------------------------------

On 2022-08-25T10:10:06Z, Oldes, commented:
<https://github.com/red/red/issues/5183#issuecomment-1227058137>

    In my Rebol3 version it throws an error now.
    https://github.com/Oldes/Rebol3/blob/047f0328b5aee74143eb30dd1068ca5d248014a9/src/tests/units/lexer-test.r3#L26

--------------------------------------------------------------------------------

On 2022-08-25T11:35:53Z, hiiamboris, commented:
<https://github.com/red/red/issues/5183#issuecomment-1227140917>

    Some profiling:
    ```
    Count: 1000000
    Time         | Time (Per)   | Memory      | Code
    0:00:00.318  | 0:00:00      | 44002320    | [transcode/one #{}]
    0:00:00.493  | 0:00:00      | 528         | [transcode/one b]
    0:00:00.532  | 0:00:00      | 484         | [transcode/one s]
    0:00:00.654  | 0:00:00      | 60000484    | [transcode/next s]
    0:00:00.873  | 0:00:00      | 60000716    | [try [transcode/next s]]
    0:00:02.004  | 0:00:00      | 884000484   | [try [transcode/next er]]
    ```
    <details><summary>Source...</summary>
    
    ```
    Red []
    
    #include %../../misc/profile.red
    recycle/off
    b: to #{} s: "abc" er: "ab$"
    profile/show/count [
    	[transcode/one #{}]
    	[transcode/one b]
    	[transcode/one s]
    	[transcode/next b]
    	[transcode/next s]
    	[try [transcode/next s]]
    	[try [transcode/next er]]
    ] 1'000'000
    print ""
    ```
    
    </details>
    
    We still need that `try` block in case input is malformed. On the other hand, if at end we always generate an error, we end up with 800+ bytes and some time overhead that will be significant when processing huge amount of small strings. 
    
    If it throws an error though, `trancode/next` can then use the same interface as `do/next`: `set/any 'x transcode/next pos 'pos`, eliminating the block allocation (about 20% overhead for simple tokens). So looks like a win overall?

--------------------------------------------------------------------------------

On 2024-08-23T13:32:31Z, hiiamboris, commented:
<https://github.com/red/red/issues/5183#issuecomment-2307105353>

    Relevant: Brian [has chosen](https://forum.rebol.info/t/re-imagining-eval-next/767) to go with `none` in `do/next []`, but also flipped position and value returns from it.

