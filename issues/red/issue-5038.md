
#5038: [Help] is not helpful when word refers to a datatype
================================================================================
Issue is open, was reported by hiiamboris and has 10 comment(s).
[type.review]
<https://github.com/red/red/issues/5038>

**Describe the bug**
```
>> f: func [x] [? x mold x]
== func [x][? x mold x]
>> x: 42 y: "zxc" z: function!
== function!
>> f x
X is an integer! value: 42

== "42"
>> f y
X is a string! value: "zxc"

== {"zxc"}
>> f z
    collect         => Collect in a new block all the values passed to KEEP...
    quote           => Return but don't evaluate the next value.
    scan            => Returns the guessed type of the first serialized val...
    load            => Returns a value or block of values by reading and ev...
  (ten pages of output)
```
In the last example I was debugging a function and I was asking "what `z` is"?
Instead it prints me all defined functions.


**Expected behavior**

From Oldes' R3 branch:
```
>> f: func [x] [? x mold x]
>> z: function!
== function!

>> f z
X is a datatype of value: function!

== "function!"
```

**Platform version**
```
Red 0.6.4 for Windows built 14-Jan-2022/17:48:17+03:00  commit #4923e32
```



Comments:
--------------------------------------------------------------------------------

On 2022-01-14T22:02:36Z, greggirwin, commented:
<https://github.com/red/red/issues/5038#issuecomment-1013503441>

    Another fun detail. `? datatype!` shows any words that refer to a datatype. They appear at the end of the list, because of system/words order, and they should be rare, but is that helpful or not? Similar for `typeset!`, but shows up in the middle of the list here. 

--------------------------------------------------------------------------------

On 2022-01-14T22:34:14Z, hiiamboris, commented:
<https://github.com/red/red/issues/5038#issuecomment-1013518736>

    In `? datatype!` `date!` and `event!` accessors alignment is messy. 
    Whether `? datatype!` and `? typeset!` should display custom defined words, I think it's okay to show them. Unlikely there will ever be a lot. You could output some preface, like "here go predefined datatypes" then "here go user datatypes".
    R3 doesn't show them btw.

--------------------------------------------------------------------------------

On 2022-01-14T23:28:28Z, greggirwin, commented:
<https://github.com/red/red/issues/5038#issuecomment-1013540331>

    The question is how much to add to `help`, in a console environment. Accessors are just molded today. To make them nice we need to find `new-line?` markers, or mold, split, and prepad lines. Should we do that in `help`, or build a GUI tool that gives us much more power?
    
    For user-defined words, that means we need to cache system words before anything else is done, to compare. I had a hack for this in R2, using `query`, so you could see all the words you had defined, which was quite helpful sometimes.

--------------------------------------------------------------------------------

On 2022-01-15T12:15:51Z, hiiamboris, commented:
<https://github.com/red/red/issues/5038#issuecomment-1013672264>

    > Should we do that in help, or build a GUI tool that gives us much more power?
    
    Since help shows them it should show them nice IMO.
    
    > For user-defined words, that means we need to cache system words
    
    It's easy, just choose some point of reference in system/words. E.g. index of `help` in it. Before it = builtin, after = user defined. That ofc is only needed for typesets which do not mold as single words.

--------------------------------------------------------------------------------

On 2022-01-28T02:43:40Z, greggirwin, commented:
<https://github.com/red/red/issues/5038#issuecomment-1023833356>

    This is what @Oldes does in his R3 fork:
    ```
     datatype? :value [
         spec: spec-of :value
         either :word <> to word! :value [
             output ajoin [
                 "^[[1;32m" uppercase mold :word "^[[m is a datatype of value: ^[[32m" mold :value "^[[m^/"
             ]
         ] [
             output ajoin [
                 "^[[1;32m" uppercase mold :word "^[[m is a datatype.^[[m^/"
                 "It is defined as" either find "aeiou" first spec/title [" an "] [" a "] spec/title ".^/"
                 "It is of the general type ^[[1;32m" spec/type "^[[m.^/^/"
             ]
             unless empty? value: dump-obj/match/only system/contexts/lib :word [
                 output ajoin ["Found these related words:^/" value]
             ]
         ]
         throw true
     ]
    ```

