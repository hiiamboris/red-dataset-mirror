
#2423: DOC: insert into string does an implicit FORM 
================================================================================
Issue is closed, was reported by meijeru and has 20 comment(s).
[status.deferred] [type.review]
<https://github.com/red/red/issues/2423>

AFAIK this is undocumented. But I suppose the feature is intentional... It is present in R2/3 also.


Comments:
--------------------------------------------------------------------------------

On 2017-01-27T20:35:04Z, greggirwin, commented:
<https://github.com/red/red/issues/2423#issuecomment-275767737>

    I believe it is by design. 

--------------------------------------------------------------------------------

On 2017-01-28T14:50:04Z, meijeru, commented:
<https://github.com/red/red/issues/2423#issuecomment-275852325>

    Reason the more to document it. The docstring is now:
    ```
    Inserts value(s) at series index; returns series past the insertion. 
    ```
    I would add: `If series is string!, the value is FORMed`

--------------------------------------------------------------------------------

On 2017-01-28T16:08:24Z, greggirwin, commented:
<https://github.com/red/red/issues/2423#issuecomment-275856749>

    That will make the doc string much longer, without added benefit IMO. That is, what other *possible* behavior could there be? Only `mold`. If the change is made, `append` and `change` should probably be updated to match.

--------------------------------------------------------------------------------

On 2017-01-28T16:40:06Z, meijeru, commented:
<https://github.com/red/red/issues/2423#issuecomment-275858604>

    It is not so trivial, since in R2 `insert #{} 3` gives `#{33}` and in R3 it gives `#{03}`. Thus, `insert "" 3` might well give `"^(03)"`. In other words, any implicit conversions should preferably be flagged . Additional argument: there is no round trip in this case: `s: ""  insert s 3 s/1 <> 3`

--------------------------------------------------------------------------------

On 2017-01-28T20:24:37Z, greggirwin, commented:
<https://github.com/red/red/issues/2423#issuecomment-275872301>

    Inserting into a binary! is very different from inserting into a string. And of course there is no round trip, because you always get a char! when you pick from a string. I understand what you mean though.
    
    You make a good point with integers, but the same applies to tuples and other values. Assuming we agree that the implicit `form` behavior is the best choice, the doc string is the question. I believe the target length for doc strings is 70 chars or less, though some will surely be longer. The current doc string is 68 chars. Adding your extra text would make it 110. We should actually use slightly different added text, because it applies to `any-string!` types, not just `string!`.
    
    As soon as we say any implicit conversions should be noted in doc strings, I think things are going to explode, and perhaps be even more confusing. For example, if you insert a tuple! into a binary!, is it implied that the dots separating the segments, which are part of the lexical form, are excluded?
    
    Doc strings, by nature of needing to be brief, will sometimes be vague. Extended docs, elsewhere, can note detailed behaviors.

--------------------------------------------------------------------------------

On 2017-02-03T11:54:44Z, geekyi, commented:
<https://github.com/red/red/issues/2423#issuecomment-277230320>

    Agree with @greggirwin here. But from a different point of view:
    *Noting that `insert/only` is already taken for something else. But assume it's not; for argument's sake*
    
    If instead of changing the docstring, if there was a `/only` refinement which doesn't do any conversion, would it be better for you @meijeru?

--------------------------------------------------------------------------------

On 2017-02-03T12:23:24Z, meijeru, commented:
<https://github.com/red/red/issues/2423#issuecomment-277234981>

    On balance, I can live with a properly documented behaviour. I do not see a use for prohibiting the conversion with a refinement.

--------------------------------------------------------------------------------

On 2017-02-12T11:07:24Z, dockimbel, commented:
<https://github.com/red/red/issues/2423#issuecomment-279211041>

    @geekyi When you insert a non-string value in a string, you *must* convert that value to a string, so a conversion rule is required. The conversion function used by `insert` is FORM.

--------------------------------------------------------------------------------

On 2017-02-12T11:11:05Z, dockimbel, commented:
<https://github.com/red/red/issues/2423#issuecomment-279211206>

    Doc-string are not meant to provide an exhaustive description, just a short reminder of the purpose of the function. Such more in-depth explanation should IMHO have its place in a Red dictionary page (which the user could somehow access from the Red console).

--------------------------------------------------------------------------------

On 2019-09-11T15:49:13Z, dockimbel, commented:
<https://github.com/red/red/issues/2423#issuecomment-530442770>

    I will close this issue, as there is no official documentation for the Red Language, so it's pointless for now to report features to be documented in red/red as issues (unless the description is for the docstring specifically).

