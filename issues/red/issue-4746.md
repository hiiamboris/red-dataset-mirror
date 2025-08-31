
#4746: i:1 no warning
================================================================================
Issue is closed, was reported by zwortex and has 14 comment(s).
<https://github.com/red/red/issues/4746>

There is no warning if one forgets the space after a colon in case of assignation, like in (1). It happens that i:1 is recognised as being a valid url ! (2)

```
unset 'i
i:1 ; (1)
print i
print type? i:1 ; (2)
```

Problem is : it is more likely to have forgotten the space after an assignation than to have used an url that happens to have i as protocol and 1 as a path.

This can easily lead to bugs that are hard to find, in particular when using contexts or objects. For instance, in the following code, the assignation (1) will trigger no warning at all in (2) and the mistake, if ever, can only be detected at runtime.

```
unset 'i
i: 0
print i
obj: context [
    i:1 ; (1)
    test: function [] [
        print i
    ]
]
obj/test ; prints 0 and not 1
```

Can the evaluation warn against such probable error ?

A more bold move might be to restrict url syntax to common protocols and use an extended syntax for "strange" cases, like none vs #[none].




Comments:
--------------------------------------------------------------------------------

On 2020-12-08T17:30:56Z, hiiamboris, commented:
<https://github.com/red/red/issues/4746#issuecomment-740784063>

    Please discuss your ideas with us in the [Gitter chat](https://gitter.im/red/help) before creating wish tickets. I'm 100% sure this wish will **not** be granted, and this is not a [proper place](https://github.com/red/REP/issues) for wishes.

--------------------------------------------------------------------------------

On 2020-12-08T21:00:35Z, greggirwin, commented:
<https://github.com/red/red/issues/4746#issuecomment-741024237>

    What Boris said. :^)

--------------------------------------------------------------------------------

On 2020-12-08T21:08:28Z, greggirwin, commented:
<https://github.com/red/red/issues/4746#issuecomment-741034472>

    @zwortex I will add a quick note though, that what may look like a problem in your example is a fundamental design aspect of Red, and won't be changed. We may say that URLs should only be for what we think of as common protocols, and they do have a name that implies that, but they are just values like any other. So I can use them in dialects with things like `line:25` or `RC:A/20`. As "passive" content, they still exist, and so can be used when you think in terms of data, rather than code. e.g. preprocessors could use them, code analyzers could insert them, or both. That is, they can be annotations for different passes and purposes.

--------------------------------------------------------------------------------

On 2020-12-09T17:41:03Z, zwortex, commented:
<https://github.com/red/red/issues/4746#issuecomment-741934958>

    Hi hiiamboris, greggirwin,
    
    Thanks for your replies.
    
    I'll see about Gitter chat however it looks to me that it is more relevant for troubleshooting. In this particular case, I understand it is part of the way it is meant to work, though I consider it an issue as it can lead to frequent errors, and potential bugs very hard to find.
    
    For me, it is an issue as assignments are not uncommon. As it happens, in the 650 lines of code that I have written to extend the calculator demo, 40% of these lines were assignments of some sort.
    
    I made a quick test replacing the semi colon in i:1 by another punctuation marks (see below). In most cases, an error is triggered. 
    
    There are only four cases of expressions that have triggered no warning at all : i:1 - i@1 - i;1 - i#1.
    
    - **i:1** is the problem already mentioned,
    - **i@1** is interpreted as an email but is not likely to be an issue as @ is not used otherwise,
    - **i;1** is a possible problem, but less likely as it would imply to forget a space as well as mixing ; for : - **Still** it should not be possible to have **;** that is not separated by a space from the current token
    - **i#1** looks strange as i and #1 are correctly interpreted separately. The same happens with **i"1** and **i\1** but it provokes an invalid character error. It don't get it why these should not be treated as i%1 and i,1 and provoke an error for invalid word.
    
    To wrap it up, **i:1** should be addressed in some way or another as too frequent a case, and too high a potential issue.
    
    How it is addressed is a different story. You may change the language to avoid the confusion of datatypes between word! and url!. You may adjust the lexical analysis to distinguish frequent, possible url, from more specialized formats more likely to get in conflict. You may add relevant warnings during the evaluation/compilation of a script only (at semantic level), or merely adapt the highlights of the language within an ide etc. There are plenty of ways of addressing the issue apart from dusting it.
    
    ```
    unset 'i
    i: 0
    
    ; == No warning or silent warning
    i:1 ; because valid url!
    i@1 ; because valid email!
    i;1 ; comment after i
    i#1 ; #1 strangely interpreted as a separate issue
    
    ; == Various errors
    i/1 ; no path on integer!
    i"1 ; "1 invalid string
    i\1 ; \1 invalid character
    i$1 ; invalid money
    i%1 ; invalid word
    i,1 ; invalid word
    
    ; == Error as missing closing or opening bracket
    i{1 }; curly bracket expected
    i(1 ); parenthesis expected
    i[1 ]; square bracket expected
    i}1 ; missing opening bracket
    i)1 ; missing opening bracket
    i]1 ; missing opening bracket
    
    ; == Script Error as word with no value ==
    i§1
    i&1
    i~1
    i'1
    i|1
    i-1
    i`1
    i_1
    i^1
    i=1
    i+1
    i*1
    iµ1
    i£1
    i¤1
    i!1
    i.1
    i?1

--------------------------------------------------------------------------------

On 2020-12-09T17:58:13Z, hiiamboris, commented:
<https://github.com/red/red/issues/4746#issuecomment-741946989>

    > To wrap it up, i:1 should be addressed in some way or another as too frequent a case, and too high a potential issue
    
    In a few years of Red & REBOL work, I've never had a single typo like this, so - this is very contrived argumentation.

--------------------------------------------------------------------------------

On 2020-12-09T22:21:40Z, zwortex, commented:
<https://github.com/red/red/issues/4746#issuecomment-742100482>

    Hi hiiamboris, 
    
    You have the experience. You're probably right. For me however, it looks very much like in c, the proximity between == and =. Only one character of difference. Very easy to type one instead of the other, completly silent, sometimes very hard to find.

--------------------------------------------------------------------------------

On 2020-12-10T01:01:11Z, greggirwin, commented:
<https://github.com/red/red/issues/4746#issuecomment-742163391>

    @zwortex thanks for your detailed reply. I'll suggest that you take some time to get comfortable with Red before suggesting deep language changes. Red inherits much of its design from Rebol, which was designed by a very smart guy over a long period of time. Not to say it's perfect, or things won't change, but it's a solid design.
    
    >  I consider it an issue as it can lead to frequent errors, and potential bugs very hard to find.
    
    Like Boris, I don't think I've _ever_ hit this problem, or if I did it was a 3 second issue. I've also never seen it mentioned in the Redbol community, and I've been here since 2001.
    
    > I'll see about Gitter chat however it looks to me that it is more relevant for troubleshooting. 
    
    We have rooms for many purposes and topics. Design chat is welcome there.

