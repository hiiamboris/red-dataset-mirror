
#4501: bind 'self self doesn't work
================================================================================
Issue is closed, was reported by hiiamboris and has 8 comment(s).
[status.dismissed] [type.design]
<https://github.com/red/red/issues/4501>

**Describe the bug**

```
o: object [
    ? self
    ; x: bind 'self self       ;) this doesn't work either
    x: 'self
    ? x
    y: get x
    ? y
]
```
Output:
```
SELF is an object! with the following words and values:
     x  unset!        
     y  unset!        

X is a word! value: self

*** Script Error: self has no value
*** Where: get
*** Stack: object 
```

**Expected behavior**

Both `x: 'self` and `x: bind 'self self` should work

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 28-May-2020/17:51:04+03:00 commit #36857eb
```



Comments:
--------------------------------------------------------------------------------

On 2020-06-08T18:56:21Z, greggirwin, commented:
<https://github.com/red/red/issues/4501#issuecomment-640810420>

    It does work in R2.
    ```
    >> object: :context
    >> do-clip
    SELF is an object of value:
       x               unset!    none
       y               unset!    none
    
    X is a word of value: self
    Y is an object of value:
       x               word!     self
       y               object!   [x y]
    ```

--------------------------------------------------------------------------------

On 2022-04-29T12:50:04Z, hiiamboris, commented:
<https://github.com/red/red/issues/4501#issuecomment-1113274838>

    Also:
    ```
    context [probe :self  probe get/any 'self  probe get/any first [self:]]
    unset
    unset
    unset
    ```
    That is, `self` is only recognized as `word!` which makes it way too special

--------------------------------------------------------------------------------

On 2022-08-30T13:17:49Z, dockimbel, commented:
<https://github.com/red/red/issues/4501#issuecomment-1231656729>

    Let me dissipate a confusion: `self` in Red is not the same as in Rebol, especially R2. In R2 (not sure for R3), `self` is a first-class word in every object context (so it occupies a slot in the context table) as shown by this example:
    ```
    >> probe first make object! [a: none]
    [self a]
    ```
    So that word can be manipulated as any word in general, using the different derivative word types.
    
    In Red, `self` is a keyword that is part of an object construction dialect (along with the event handlers), it is not part of the object context (does not occupy any slot). It has meaning only when used in `word!` form either standalone or as the first item of a path. So all the reported limitations above are by design.
    
    In R2, `self` was often a burden, as it needed to be accounted for each time the object context was manipulated. Also ability to set it could caused weird effects and even crashes. In R3, IIRC, it's still takes a context slot, but it's more hidden to the user.
    
    Given `self` limited purpose as its existence has meaning only inside an object's body, I think the current Red design fulfill its purpose properly, even if it requires internally some extra code and runtime overheads. Though, the discussion about its design is not set in stone in case we can come up with a better trade-off.
    
    I'll close this ticket now. This topic can be reopened as a REP or during the work on the language specs.

--------------------------------------------------------------------------------

On 2022-08-30T19:45:31Z, greggirwin, commented:
<https://github.com/red/red/issues/4501#issuecomment-1232092103>

    Thanks for the explanation @dockimbel. :+1:

