
#3398: BREAK in PARSE breaks beyond its scope.
================================================================================
Issue is open, was reported by rgchris and has 2 comment(s).
[type.design]
<https://github.com/red/red/issues/3398>

### Expected behavior

From Rebol 3 (and Rebol 2 replacing WHILE with ANY):

```
>> parse "aaa" [while ["a" | break]]
== true
>> parse "aaa" [while ["a" | [break]]]
; infinite loop
```

### Actual behavior

```
>> parse "aaa" [while ["a" | break]]
== true
>> parse "aaa" [while ["a" | [break]]]
== true
```

### Background

I'm not posting this as a bug, just an inconsistency. There's a couple of notes where Rebol Parse's BREAK has been clarified as only breaking it's immediate bounds:

* [Break only from Loops](https://github.com/revault/rebol-wiki/wiki/Parse-Project#break-only-from-loops): — *"Based on a misunderstanding of what constitutes a loop. Rejected."*

* [PARSE: do you want BREAK?](http://www.rebol.net/cgi-bin/r3blog.r?view=0262#comments) — *"although break could be defined that way (as a termination to repeated patterns), there is no distinction between repeated and non-repeated rules in the implementation. That is, ['a] actually means [1 'a]. It is simply the default. The loop still happens, but just once. So, it would be difficult for a break to determine what level to break. Some kind of special flag would need to be embedded in the state of the parser."*

I find it hard to conceive using BREAK other than to break out of a loop (perhaps specifically WHILE), it may be then this behaviour is desired. In which case, it should be noted that it is a deviation from Rebol.


Comments:
--------------------------------------------------------------------------------

On 2018-07-19T13:00:55Z, hiiamboris, commented:
<https://github.com/red/red/issues/3398#issuecomment-406267915>

    I agree that this should be just noted as a distinguishing feature from R3. See also https://github.com/red/red/issues/3478

