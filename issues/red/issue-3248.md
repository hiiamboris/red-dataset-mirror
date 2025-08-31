
#3248: WISH: extract should be more compatible with Rebol
================================================================================
Issue is closed, was reported by meijeru and has 28 comment(s).
[type.review] [status.contribution] [type.task.wish]
<https://github.com/red/red/issues/3248>

The `extract` function has a refinement `/index` with argument `pos [integer!]` which is superfluous because it can be replaced by the usage of `at`. Thus `extract/index some-series 2 4` is equivalent to `extract at some-series 2 4`. The refinement is perhaps there because of compatibility with Rebol, but in Rebol the refinement's argument is of `any-type!` instead of just `integer!` in Red. This would allow a series argument for the position, and that could be a reason for it to be there.

Thus, I would propose to broaden the type of the `pos` argument and thereby (a) make the refinement non-superfluous and (b) increase compatibility with Rebol.

An alternative could be to abolish the refinement altogether.

Rebol's `extract` has a further refinement missing from Red:

     /default -- Use a default value instead of none
         value -- The value to use (will be called each time if a function) (Type: any-type!)

but it is not clear to me what its use is, therefore I do not include that in this wish.



Comments:
--------------------------------------------------------------------------------

On 2018-03-09T06:23:17Z, dockimbel, commented:
<https://github.com/red/red/issues/3248#issuecomment-371724867>

    Agreed for `/index` support for sake of compatibilty.

--------------------------------------------------------------------------------

On 2018-05-02T22:54:08Z, greggirwin, commented:
<https://github.com/red/red/issues/3248#issuecomment-386146075>

    >  but in Rebol the refinement's argument is of any-type!
    
    @meijeru, I think this is a bug in R2. It was meant to be `[number! logic!]` but the doc string was put first, so the type was ignored. What is the use case/example for having a series argument as the index position?

--------------------------------------------------------------------------------

On 2018-05-03T19:02:17Z, meijeru, commented:
<https://github.com/red/red/issues/3248#issuecomment-386402643>

    @greggirwin The use case is the same as with any series function that allows an index position to be indicated by a series not at the head, think of copy/part etc.

--------------------------------------------------------------------------------

On 2018-05-03T21:52:35Z, greggirwin, commented:
<https://github.com/red/red/issues/3248#issuecomment-386448685>

    I understand the purpose of `/index` in the simple case, but the PR made for this (#3360) doesn't work that way, nor does R3 (which it's based on). They assume a block of indexes, to extract multiples. *That's* the case I doubt is justified at this point. And if I'm correct that R2 is bugged, and shouldn't allow `any-type!`, then we should only support `series!` for `pos`, if `/index` is not needed; and we should name the refinement `/part`.
    
    However, I'd still like to see where this has ever been used, or what a real world use case is, where a `series!` value for `pos` helps. If we name the refinement `/part`, then `pos` becomes `length` and we can extract multiple sequential values in one shot. I still dont' see how a series val works for length there though. Rebol never had that, and I don't recall it ever coming up in the past.

--------------------------------------------------------------------------------

On 2018-05-04T10:43:59Z, meijeru, commented:
<https://github.com/red/red/issues/3248#issuecomment-386564755>

    Suppose you have a block with a skip interval that is not known in advance, but depends on the presence of certain "end markers" that you can find using `find`. Then you could say `extract/index bl next find bl marker` and be sure that  your extraction interval is correct. I admit this is somewhat contrived. The same result can be obtained by `extract bl index? find bl marker`.

--------------------------------------------------------------------------------

On 2018-05-04T22:27:31Z, greggirwin, commented:
<https://github.com/red/red/issues/3248#issuecomment-386750813>

    The problem is that `extract` is not an atomic operation, like `copy`, so your implied index has to be treated as relative, rather than absolute, yes?

--------------------------------------------------------------------------------

On 2018-05-07T07:21:33Z, Heroide, commented:
<https://github.com/red/red/issues/3248#issuecomment-386980617>

    dear Gregg. You keep saying my PR is based on R3. This is not the case. Perhap the source is the same in R3 as it is in R2 console, The code is based on source from R2 which Red will rebuild but better. Further I found the use by trying out and I added a test case to show what does it do. I do not know of real use case too, or simple put kids secret message in long story.
    I do know in milestone this was marked 'contribution asked'. So now you have contribution that works as original and you talk about design of wanted function and all.  I think this very strange. Do you not?

--------------------------------------------------------------------------------

On 2018-05-07T19:09:38Z, greggirwin, commented:
<https://github.com/red/red/issues/3248#issuecomment-387170911>

    @Heroide my apologies for any confusion. The R3 version was backported to R2, hence the ambiguity. The original R2 version was *very* simple.
    
    What I'm calling into question is whether the original is what we want, because we haven't seen a good case for it yet. What I'm suggesting is that we look at `extract` without concern for compatibility. If the R2/R3 version is incorrect, we don't want to be compatible with it. The original R2 version was bugged on the `pos` type. R3 carried that bug forward, and the bug was successfully backported to R2. Not ironically, Red doesn't have the bug, because its stricter func spec parser catches the problem correctly.
    
    @meijeru's intent isn't wrong, it's just based on the assumption that the R2/R3 version is correct, which it isn't. This tripped us all up, me included.
    
    @meijeru correctly points out that we don't *need* `/index`, but it may express intent more clearly and so be useful. It also aids Rebol compatibility. I think the intent aspect is more important.
    
    Here's my suggestion. Unless someone has a *really good* use case, we don't change Red. We close this ticket and, unfortunately, your PR also. `/default` doesn't seem terribly useful to me (again, pending a good use case, not just an example of how it works), so we leave that out. I'm also not a fan of `/into`, but I think I've lost that battle in general, so it stays.
    
    What do you all think?

--------------------------------------------------------------------------------

On 2018-05-10T18:52:17Z, 9214, commented:
<https://github.com/red/red/issues/3248#issuecomment-388149772>

    My `extract` use-case by far was for extracting "columns" from tables. 
    
    I'd rather propose that `/index` accepts a container of indexes (say, block of integers) and extracts values only from this indexes -- either once per series (absolute) or per record with size defined by `width` (relative). If record goes out of the boundaries - no filler is used unless something like `/with` is provided.
    
    Extracting values only of specific type would also be useful (but I guess `copy/types` should cover that?) or those that match specific Parse rule (but then again you can use `parse` for that with `collect / keep`, or `collect` itself).
    
    What I *really* would like to see is an ability to use boolean vectors (maybe `bitset!`s?) for extraction.
    ```Red
    >> extract/index [a b c] reduce [yes no yes]
    == [a c]
    ```

--------------------------------------------------------------------------------

On 2018-05-13T00:01:52Z, greggirwin, commented:
<https://github.com/red/red/issues/3248#issuecomment-388591462>

    There are other `collect*` funcs we've mocked up, like https://gist.github.com/greggirwin/aa5615f051ca1b553c952ed460841e02. Lots of ways to do things, so lots of questions. 
    
    `Extract` has proved very useful to me through the years, so the question...damn this eternal question...is how things look if we step back, and what to call things. We can deprecate `extract` if we find a more general answer to this. I have a few versions of `cut`, `pick-multi`, etc. And maybe `extract` stays as is, because it's useful enough.

--------------------------------------------------------------------------------

On 2018-07-20T22:45:56Z, greggirwin, commented:
<https://github.com/red/red/issues/3248#issuecomment-406744907>

    https://github.com/red/red/pull/3360 is tied to this, and I'd like to close them both. We don't seem to have any really solid arguments for this IMO. Thoughts?

--------------------------------------------------------------------------------

On 2018-07-21T01:14:01Z, 9214, commented:
<https://github.com/red/red/issues/3248#issuecomment-406760029>

    @greggirwin close with postponed tag?

--------------------------------------------------------------------------------

On 2018-07-21T02:00:09Z, greggirwin, commented:
<https://github.com/red/red/issues/3248#issuecomment-406763054>

    I'd like to make a decision, one way or the other. My last stance was not to change Red, and I stand by that after reviewing. While you can achieve the same thing with `at`, there is still value in the convenience `/index` offers IMO, and is Rebol compatible. What I haven't seen are concrete use cases for broadening the scope. 
    
    Other functionality should, at the very least, be prototyped first, as mezzanines. Only if there's a clear win in altering `extract` should we integrate them there. 

--------------------------------------------------------------------------------

On 2018-08-16T00:16:44Z, greggirwin, commented:
<https://github.com/red/red/issues/3248#issuecomment-413380269>

    I'm closing this, and the related PR, as we haven't seen a concrete case for them yet.

