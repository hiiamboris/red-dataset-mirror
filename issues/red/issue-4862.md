
#4862: PARSE binary enforces /case vs string that disables datatypes
================================================================================
Issue is open, was reported by hiiamboris and has 8 comment(s).
[type.design]
<https://github.com/red/red/issues/4862>

**Describe the bug**

Currently we can parse binary (but not string) by datatype. Yet we can parse case-insensitively only string (but not binary). I was trying to make a command-line parse tool and this situation looks rather silly catch-22 kind...

One has to parse input as binary, then deeply convert all collected binaries into strings as an extra step.
This also renders /case refinement both useless in binary mode and misleading (as one should think that without /case it's case-insensitive).

**To reproduce**
```
>> parse to #{} "aaAa" [some #"a"]
== false
>> parse "aaAa" [some #"a"]
== true
>> parse to #{} "aaAa" [word!]
== true
>> parse "aaAa" [word!]
*** Script Error: PARSE - matching by datatype not supported for any-string! input
*** Where: parse
*** Stack:  
```

**Expected behavior**

I expect eventually that we overcome this implementation issue and become able to both parse strings using datatypes and case-insensitively parse binary data.

**Platform version**
```
Red 0.6.4 for Windows built 18-Mar-2021/22:28:01+03:00  commit #73d9bd2
```



Comments:
--------------------------------------------------------------------------------

On 2021-04-24T11:56:58Z, dockimbel, commented:
<https://github.com/red/red/issues/4862#issuecomment-826081961>

    Binary and strings are definitely not the same thing with Unicode support. I am not sure why you expect both to work the same and support the same features. Datatype matching implies invoking the lexer internally. As the lexer is implemented to work on UTF-8 encoded input, so it can only accept `binary!` as input. In order to let the lexer process `string!` series, the string needs to be UTF-8 encoded internally, which means converted to a binary. This process is done transparently for `load` in order to make it more convenient for common use-cases.
    
    For Parse, a back-and-forth conversion process being expensive (both in memory and processing time), it's up to the user to choose binary vs string parsing mode (and pre-convert the input series accordingly), with the related limitations each mode carries with it. If you have a way to solve that, please propose it, overwise I'll just close this ticket.
    
    > This also renders /case refinement both useless in binary mode and misleading (as one should think that without /case it's case-insensitive).
    
    `/case` could return an error when invoked in binary mode.

--------------------------------------------------------------------------------

On 2021-04-24T12:22:01Z, hiiamboris, commented:
<https://github.com/red/red/issues/4862#issuecomment-826084855>

    What you're saying is just low level details of the current implementation of the lexer.
    I'm thinking totally from the high level perspective here. Can I visually extract a datatype from a string? I can. Means my computer should be able too.
    
    Demand comes from here: https://gitlab.com/hiiamboris/red-cli/-/blob/master/mockups/parse/parse.red
    As I described it above, it makes me insert kludges into the code and cripples the tool with it's forced case sensitivity.
    Also this question gets raised on gitter from time to time.
    
    I don't mind some performance loss of `to binary!` and `to string!` as long as milliseconds of CPU time save me hours of my own, if that's the easiest fix. And think of possibilities that opens for every other eventual Red user down the road.
    I also don't see why lexer can't support case-insensitivity with a bit of effort.
    
    Certainly this can wait to 1.0 or whatnot, but would be a shame to leave it in the current state (;

--------------------------------------------------------------------------------

On 2021-05-13T17:48:04Z, greggirwin, commented:
<https://github.com/red/red/issues/4862#issuecomment-840723213>

    We could label this as a wish. I can see both sides. On the one hand, be flexible for users is nice, on the other, I almost want to remove parsing binary by datatype because we have redbin and we are mixing a lot of options related to case sensitivity and input formats. Options are often good, but we also need to consider extra complexity compared to focusing on using Red as Red. e.g. parsing binary data is great, as strict binary data. If you have strings, you can parse strictly or not, but they're still character strings. If you expect it to be Red, `load` it.

--------------------------------------------------------------------------------

On 2021-07-23T17:23:55Z, dockimbel, commented:
<https://github.com/red/red/issues/4862#issuecomment-885787097>

    >  If you have strings, you can parse strictly or not, but they're still character strings. If you expect it to be Red, `load` it.
    
    Exactly that.
    
    Though, I will have a look at case-insensivity support for binary parsing.

