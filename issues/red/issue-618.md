
#618: object! expansion missing
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 10 comment(s).
[type.wish] [status.reviewed]
<https://github.com/red/red/issues/618>

red>> append context [] [a: 'b]

**\* Script error: action 35 not defined for type: 30

R3:

> > append context [] [a: 'b]
> > == make object! [
> >     a: 'b
> > ]

This is inefficient, because when constructing an object by iterating over some input, you first have to construct an intermediate spec block to construct the object from.



Comments:
--------------------------------------------------------------------------------

On 2013-12-18T16:41:19Z, dockimbel, commented:
<https://github.com/red/red/issues/618#issuecomment-30857544>

    It is not in my plans to support series actions like **append** for objects. However, it is necessary to have an extension mechanism for referenced objects, so they can be extended _in-place_. This will be provided using a **extend** native.
    
    _constructing an object by iterating over some input_ looks like a typical use-case for map! rather than objects.

--------------------------------------------------------------------------------

On 2013-12-18T23:40:05Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/618#issuecomment-30892615>

    Sometimes you want to get objects, in particular when you want to use them for binding. Such is the case in my CMS engine.
    
    Will EXTEND do the same as APPEND object! in R3?

--------------------------------------------------------------------------------

On 2013-12-19T14:34:25Z, dockimbel, commented:
<https://github.com/red/red/issues/618#issuecomment-30932697>

    I'm not sure to understand why you would need binding when storing only data and not functions?
    
    Yes, **extend** will provide the same feature as **append** _object!_ in R3.

--------------------------------------------------------------------------------

On 2013-12-19T23:00:27Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/618#issuecomment-30975090>

    I'm not storing only data: my CMS engine handles both data and code, like REBOL/Red itself. I'm using it like REBOL was meant to be used.
    
    I guess EXTEND will cover my needs then, but I don't really see why it couldn't be implemented as APPEND.

--------------------------------------------------------------------------------

On 2018-04-25T04:31:41Z, PeterWAWood, commented:
<https://github.com/red/red/issues/618#issuecomment-384157649>

    Following the introduction the [Red REP repository for enhancements and wishes](https://gitter.im/red/red?at=5adfeed527c509a7744a3dc8), this issue is being closed.
    
    If you believe that your wish is still valid, please open a new issue for it in the new [red/REP repo](https://github.com/red/REP). It would help if you could include a link to this issue when opening an issue in the REP repository.

