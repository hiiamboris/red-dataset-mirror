
#4372: SUM cannot handle tuple! value as first element
================================================================================
Issue is open, was reported by meijeru and has 20 comment(s).
[type.wish]
<https://github.com/red/red/issues/4372>

**Describe the bug**
SUM initializes its result to a value of `0` coerced to the type of the first element. Since `make tuple! 0` gives an error, this means that a tuple value must not be the first element of the block. All other elements of the block may be tuples.

**To reproduce**
```
>> sum [1.2.3 4.5.6]
*** Script Error: cannot MAKE/TO tuple! from: 0
>> sum [0 1.2.3 4.5.6]
== 5.7.9
```
**Expected behavior**
Sum should be initialized to `0` without coercion.

**Platform version (please complete the following information)**
```
all
```



Comments:
--------------------------------------------------------------------------------

On 2020-03-26T20:38:03Z, greggirwin, commented:
<https://github.com/red/red/issues/4372#issuecomment-604672386>

    Instead, I think the doc string should change from
        "Returns the sum of all values in a block." 
    to 
        "Returns the sum of all numeric values in a block."
    
    I can't think of a use case for summing tuples.

--------------------------------------------------------------------------------

On 2020-03-26T22:05:43Z, meijeru, commented:
<https://github.com/red/red/issues/4372#issuecomment-604711382>

    SUM is used in AVERAGE, and averaging tuples that represent colors is certainly thinkable...
    Anyway, the function does a simple ADD, so all types that are allowed for ADD are allowed for SUM, unless you restrict them further! I could have added `date!` to the example, since addition is also allowed for dates, and `make date! 0` will give an error.

--------------------------------------------------------------------------------

On 2020-03-26T22:26:07Z, hiiamboris, commented:
<https://github.com/red/red/issues/4372#issuecomment-604719320>

    This point requires design decision IMO:
    > Sum should be initialized to 0 without coercion.
    
    Technically, `sum []` is undefined and has an undefined type (raise an error?). Just as `average []` is at best NaN (0 / 0 kind). It's not so cool to have `sum` change it's type to integer when the list becomes empty.
    
    And I strongly agree with this:
    > all types that are allowed for ADD are allowed for SUM
    
    And should be allowed!
    
    Two possible implementations can look like:
    ```
        result: values/1
        foreach value next values [result: :result + value]
        result
    ```
    and
    ```
        result: either tail? values [0][values/1]
        foreach value next values [result: :result + value]
        result
    ```
    (removed `also` by request)

--------------------------------------------------------------------------------

On 2020-03-27T00:06:22Z, greggirwin, commented:
<https://github.com/red/red/issues/4372#issuecomment-604748261>

    - A quick definition check shows "numbers" being an operative term. As always with doc strings, we trade detail for quick guidelines.
    
    - Averaging tuples is a bad use case, because there is no overflow indication and segment values are capped at 255. This is also the reason `sum` doesn't make much sense for them. If you do average colors, it's likely to only be 2 at a time.
    
    - Summing dates also makes no sense to me. If we have a relative date/time/period type, sure, it could be used on that, but we don't. How do you picture it working @meijeru?
    
    - @hiiamboris you will find I am not a fan of `also`. It's just too clever, and should be reserved for  cases where the clarity it adds outweighs the clarity it removes.
    
    - @hiiamboris how does `sum` change its type when the list becomes empty? The way I see it, it would change its type if it didn't return a number for an empty block. From Wikipedia: "Summation of an empty sequence (a sequence with zero element) results, by convention, in 0." Is that not a generally accepted rule?
    
    - Average on a empty block *could* throw an error, rather than returning none.  It should be a specific one, rather than generic divide-by-zero passing through I think. If you're using the result in other calculations, an error or none will both make things fail later. But if you're displaying the result, `none` is more useful, as you'd have to trap errors yourself otherwise.
    
    - To nip another one proactively, does it make sense to `sum` `char!` values? No.

--------------------------------------------------------------------------------

On 2020-03-27T00:34:11Z, greggirwin, commented:
<https://github.com/red/red/issues/4372#issuecomment-604755562>

    The design decision, as I see it, is whether we keep things simple for now, or add more checks and try to nail them down because *someday* it will be important to have things spec'd at that level of detail. To me, this is a very low priority right now.

--------------------------------------------------------------------------------

On 2020-03-27T09:16:44Z, meijeru, commented:
<https://github.com/red/red/issues/4372#issuecomment-604896940>

    My proposal:
    1. `average [ ] == none` (as now)
    2. `sum [ ] == 0` (integer, as now)
    3. `sum <any-list>` requires each element to be of the set of types (a) whose values can be added to each other (and themselves), and (b) where addition has a use case; as per the discussion above, this leaves `number!` and `money!`, whereby `money!` values have to have the same currency or none
    4. `sum <vector>` forbids vectors of characters, as per the same discussion -- however in the absence of a reflector for the element type of vectors this is difficult to implement in a `function!`.
    5. presence of an element of the wrong type leads to an error
    6. if sufficient interest, a refinement `/ignore` on `sum` can skip the elements of the wrong type
    Actually, since `sum` is a function, anyone can program it to their liking in several minutes....

--------------------------------------------------------------------------------

On 2020-03-27T10:28:58Z, hiiamboris, commented:
<https://github.com/red/red/issues/4372#issuecomment-604926465>

    >     * Averaging tuples is a bad use case, because there is no overflow indication and segment values are capped at 255. This is also the reason `sum` doesn't make much sense for them. If you do average colors, it's likely to only be 2 at a time.
    
    Yes. I propose `average` should detect such case and sum their components as integers then divide and form a final tuple.
     
    >     * Summing dates also makes no sense to me. 
    
    ```
    >> sum reduce [now 1:0 2:0 3:0]
    *** Script Error: cannot MAKE/TO date! from: 0
    *** Where: make
    *** Stack: sum  
    
    >> add add add now 1:0 2:0 3:0
    == 27-Mar-2020/19:04:25+03:00
    ```
    
    >     * @hiiamboris how does `sum` change its type when the list becomes empty? The way I see it, it would change its type if it didn't return a number for an empty block. From Wikipedia: "Summation of an empty sequence (a sequence with zero element) results, by convention, in 0." Is that not a generally accepted rule?
    
    Yes, `0` but zero of what type?
    Why `sum []` = 0 and not 0.0? Or 0:0:0? Or 0x0? Or 3D vector `[0 0 0]`?
    When mathematicians say `0` they imply zero as defined in the space they operate upon. They don't have to deal with mixed types ;)
    ```
    >> sum [1:1 2:2]
    == 3:03:00
    >> sum [1:1]
    == 1:01:00
    >> sum []
    == 0
    ```
    This type switch is like a time bomb, worse IMO than a clearly defined error condition, because it will silently propagate unexpected results so far into your code you won't know where to start looking.
     
    >     * Average on a empty block _could_ throw an error, rather than returning none.  It should be a specific one, rather than generic divide-by-zero passing through I think. If you're using the result in other calculations, an error or none will both make things fail later. But if you're displaying the result, `none` is more useful, as you'd have to trap errors yourself otherwise.
    
    Again, why `none` and not `1.#NaN`? We don't know from the context of given data what result type we should generate. So a specific documented error seems more appropriate to me.
    
    ----
    
    Some other use cases of sum where it fails currently:
    ```
    >> sum reduce [make vector! [1 1 1] make vector! [2 2 2] make vector! [3 3 3] make vector! [4 4 4]]
    == make vector! []
    >> add add add make vector! [1 1 1] make vector! [2 2 2] make vector! [3 3 3] make vector! [4 4 4]
    == make vector! [10 10 10]
    
    >> sum reduce [make vector! [1 1 1] 2 3 4]
    == make vector! []
    >> add add add make vector! [1 1 1] 2 3 4
    == make vector! [10 10 10]
    ```
    This one is OK:
    ```
    >> sum [1x1 2x2 3 4.0]
    == 10x10
    ```
    
    And one I think should support too (it currently can't because of compiler limitations):
    ```
    >> f: does [1] g: does [2] h: does [3]
    >> sum': func spec-of :sum [
    [        result: values/1
    [        foreach value next values [result: :result + value]
    [        result
    [    ]
    >> sum' reduce [:f :g :h]
    == 6
    ```
    Imagine having a static block of functions that provide necessary values on demand depending on current state.
    
    > Actually, since sum is a function, anyone can program it to their liking in several minutes....
    
    I think @9214 will join me when I say that being a function is only a temporary measure until we find a suitable design, as it's of little practical use when slow. I think `sum` and `average` must be independently from each other (because `sum` can overflow) implemented in R/S, and should use pairwise summation for non-integral types. Vectors will especially benefit as their type is known and so no need to dispatch every pair of items separately.
    
    >     6. if sufficient interest, a refinement `/ignore` on `sum` can skip the elements of the wrong type
    
    Though a very rare scenario, but I've had at least one - where NaNs should be ignored and only valid results be summed. If we can agree to /ignore `1.#NaN` (also in vectors) and `none`, someone in the (far?) future will say thanks ;) Other incompatible types should be an error I think.

--------------------------------------------------------------------------------

On 2020-03-27T23:35:11Z, greggirwin, commented:
<https://github.com/red/red/issues/4372#issuecomment-605356923>

    We can set up a `sum` design wiki page, but most of this I see as not necessary right now. 
    
    - Tuples: very low importance and easy to do separately.
    - `sum reduce [now 1:0 2:0 3:0]` makes no sense to me. I vote not to support it.
    - `Sum` returning `0` for an empty list is only a time bomb if you don't know the behavior. The alternative is to return non-numeric or error, which are both less useful in the common case. 
    - `Average` could also return `0`, for consistency with `sum`. If it throws an error, the most common approach will be to use `attempt`. Back to `none`.
    - If we don't have `vector!` tests for `sum`, we should. 
    - `sum' reduce [:f :g :h]` Again, `sum` is basic right now, though this whole design discussion will carry over to HOF-based aggregators.
    - "it's of little practical use when slow" How slow is too slow? What is "practical use"? It is, IMO, entirely practical up to hundreds of thousands of items in non-real-time scenarios.

--------------------------------------------------------------------------------

On 2020-03-28T10:04:22Z, hiiamboris, commented:
<https://github.com/red/red/issues/4372#issuecomment-605423258>

    I agree that `none` is easier to handle than an error, as you can write `any [sum list  0x0]` or `unless mean: average list [exit]`. And if you forget about it, it likely trips up soon enough to be noticed.

--------------------------------------------------------------------------------

On 2020-03-30T18:42:00Z, greggirwin, commented:
<https://github.com/red/red/issues/4372#issuecomment-606172816>

    Would anyone like to use the notes from this chat for a wiki page? We can have sections for existing funcs like `sum` and `average`, but the main topic is really how type behavior may differ, leading to gray areas and design choices that are neither right or wrong. We can also use this info when we build extended help for funcs.

