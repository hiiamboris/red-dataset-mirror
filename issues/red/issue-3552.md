
#3552: Improved function type reflection - values-of, self
================================================================================
Issue is open, was reported by PeterWAWood and has 18 comment(s).
[type.task.wish]
<https://github.com/red/red/issues/3552>

At the moment processing function meta data is not easy and processing a function's own meta data
is even more difficult. It is possible to retrieve the `spec` of a function value with `spec-of` (except for a function to introspect on its own specification). 

The `values-of` function will be extended to provide introspection of the arguments and local values for named functions. E.G. `foo: func [] [values-of :foo]

Also, `words-of` could be similarly extended to function values.

Allowing, `spec-of`, `values-of` and `words-of` to accept the word `self` as an argument to indicate the current function would be ideal. 

(This can be achieved for objects by `words-of context? '<word from context>` but `context?` does not return a context in a function but the function itself.). 


Comments:
--------------------------------------------------------------------------------

On 2018-10-05T05:05:27Z, 9214, commented:
<https://github.com/red/red/issues/3552#issuecomment-427247473>

    > (This can be achieved for objects by words-of context? '<word from context> but context? does not return a context in a function but the function itself.).
    
    It returns a context in form of a function, just like it returns a context in form of an object for `object!` value.

--------------------------------------------------------------------------------

On 2018-10-05T10:01:49Z, meijeru, commented:
<https://github.com/red/red/issues/3552#issuecomment-427311259>

    A function CAN introspect on its own specification:
    ```
    >> f: func [a][spec-of :f]
    == func [a][spec-of :f]
    >> f 1
    == [a]
    ```
    Admittedly this does not work for anonymous functions.

--------------------------------------------------------------------------------

On 2018-10-05T10:23:49Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3552#issuecomment-427316982>

    @meijeru Yes it can but only if it is "referred to" by a word. I don't see how you you can get the spec in without referring to an external word. Take the following function for example:
     ```text
    >> do [ func [i] [i] ] 1
    == 1
    ```

--------------------------------------------------------------------------------

On 2018-10-05T10:59:14Z, 9214, commented:
<https://github.com/red/red/issues/3552#issuecomment-427325520>

    ```
    has [reference][probe spec-of context? 'reference]
    ```

--------------------------------------------------------------------------------

On 2018-10-05T11:04:59Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3552#issuecomment-427327619>

    @9214 Thanks.

--------------------------------------------------------------------------------

On 2018-10-06T02:34:13Z, greggirwin, commented:
<https://github.com/red/red/issues/3552#issuecomment-427539453>

    @PeterWAWood what is the use case for this? I can think of the general "this is cool, and we can xxx with it" case, but wondering if it was something like test generation that brought this up.

--------------------------------------------------------------------------------

On 2018-10-06T04:34:03Z, 9214, commented:
<https://github.com/red/red/issues/3552#issuecomment-427545314>

    @greggirwin test generation, yes. Another problem is that it is far from trivial to access with which set of arguments and refinements function was called. @PeterWAWood proposes to make `values-of` do just that.

--------------------------------------------------------------------------------

On 2018-10-06T04:38:04Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3552#issuecomment-427545516>

    @greggirwin The main use case is to be able to implement decorator pattern which I believe will be useful for a generative test framework and far beyond. The wish has been granted by @dockimbel during discussions in Red/Core. 

--------------------------------------------------------------------------------

On 2018-12-14T13:32:42Z, dockimbel, commented:
<https://github.com/red/red/issues/3552#issuecomment-447326519>

    > Another problem is that it is far from trivial to access with which set of arguments and refinements function was called. @PeterWAWood proposes to make values-of do just that.
    
    That's a job for the future `stack` native, and not `values-of`. A function can be called recursively resulting in several instances of the _values_ part of its context.

