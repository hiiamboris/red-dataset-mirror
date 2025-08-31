
#1830: form difference between red and rebol
================================================================================
Issue is closed, was reported by x8x and has 82 comment(s).
[status.waiting] [type.review]
<https://github.com/red/red/issues/1830>

red:

``` rebol
  form [a/:b]
;   "a/b"
```

rebol:

``` rebol
  form [a/:b]
;   "a/:b"
```

Is this on purpose?



Comments:
--------------------------------------------------------------------------------

On 2016-04-19T22:31:24Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1830#issuecomment-212155372>

    There is a typo in x8x's example, it should be:
    
    ```
    red>> form [a/:b]
    == "a/b"
    ```

--------------------------------------------------------------------------------

On 2016-04-20T12:03:08Z, dockimbel, commented:
<https://github.com/red/red/issues/1830#issuecomment-212397776>

    This change was done on purpose to give more value to `form` compared to `mold`, allowing `form` to clean-up decorations around words, to make them more human-readable (which is the purpose of `form`).

--------------------------------------------------------------------------------

On 2016-04-20T12:48:01Z, iArnold, commented:
<https://github.com/red/red/issues/1830#issuecomment-212409883>

    For the completeness here, mold gives "[a/:b]" where form gives one of the above.
    You want to make it more readable but b could be an index or a var containing the description of the referenced thing. So keeping the : makes more sense to me, because it is not the string "b" that is of interest here, but b's contents. Just my 2 cents.

--------------------------------------------------------------------------------

On 2016-04-20T15:09:33Z, Oldes, commented:
<https://github.com/red/red/issues/1830#issuecomment-212469174>

    I would keep the `:` char and this is my reason:
    
    ```
    >> x: [a 1 b 2]
    == [a 1 b 2]
    >> x/b
    == 2
    >> x/:b
    ** Script Error: Invalid path value: (missing value)
    ** Near: x/:b
    >> b: 1
    == 1
    >> x/:b
    == a
    ```
    
    Simply `a/b` does not have to be same as `a/:b`

--------------------------------------------------------------------------------

On 2016-04-20T15:38:45Z, dockimbel, commented:
<https://github.com/red/red/issues/1830#issuecomment-212481672>

    @Oldes How are your code example and FORM related? I don't get it. FORM is for serializing values as strings for human-friendly display.

--------------------------------------------------------------------------------

On 2016-04-20T15:54:13Z, Oldes, commented:
<https://github.com/red/red/issues/1830#issuecomment-212487650>

    @dockimbel I don't like when something is changing meaning behind my back. Also don't understand how removing one char can make something more human-friendly in such a case.

--------------------------------------------------------------------------------

On 2016-04-20T16:23:29Z, dockimbel, commented:
<https://github.com/red/red/issues/1830#issuecomment-212500079>

    A string has no meaning, and FORM is not to be used to create LOADable code, that's the job of MOLD. FORM is currently too similar to MOLD, which makes it not very useful. Having FORM undecorate word types adds a feature and doesn't remove any. That said, I don't have a real use-case for it right now, so I'm just wondering if such change would be really beneficial or not.

--------------------------------------------------------------------------------

On 2016-04-20T16:39:45Z, Oldes, commented:
<https://github.com/red/red/issues/1830#issuecomment-212506671>

    I don't agree.. content of the string has meaning... usually.. honestly I'm not sure if I use `form` in my code.. but I would rather prefer `mold` to provide really serialized values (`mold/all` as default) and `form` not changing meaning of the content. You wanted opinion, you have mine.

--------------------------------------------------------------------------------

On 2016-04-20T16:51:18Z, Oldes, commented:
<https://github.com/red/red/issues/1830#issuecomment-212511451>

    `form` for me has some meaning when one can automatically insert spaces between values in resulted string.. like this difference:
    
    ```
    >> to-string [x/:b x/b]
    == "x/:bx/b"
    >> form [x/:b x/b]
    == "x/:b x/b"
    ```
    
    Having result of the second expression just `x/b x/b` simply is strange in my eyes.

--------------------------------------------------------------------------------

On 2016-04-21T01:51:03Z, dockimbel, commented:
<https://github.com/red/red/issues/1830#issuecomment-212692209>

    You think too much about FORM as a MOLD alternative, which is not. If you think it would be strange, then what about this in Rebol:
    
    ```
    >> form [[a] (b) [c] "d"]
    == "a b c d"
    ```
    
    FORM is already undecorating other datatypes for more "readable" output where the content matters more than the origin datatype, that's its purpose. I'm just proposing to make that more consistent with how any-word! values are FORMed.

--------------------------------------------------------------------------------

On 2016-04-21T05:52:51Z, meijeru, commented:
<https://github.com/red/red/issues/1830#issuecomment-212754061>

    I am in two minds about this, but it is true that e.g. `form #"a" == "a"` and this is in the same vein. However, used this way, `form` approaches `to string!`. Will `form` find its place between `mold`and `to string!`????  

--------------------------------------------------------------------------------

On 2016-04-21T07:11:18Z, Oldes, commented:
<https://github.com/red/red/issues/1830#issuecomment-212777386>

    @dockimbel ok.. your argument is strong. Anyway, I don't care much.. I was searching in my code base and found almost none `form` usage except some really old scripts, where I could use `to-string` instead. I use mainly `reform` in case, where I want to insert spaces between strings, which was the main purpose of the `form`, I believe. But `reform` is different, as it reduces values first so one does not have to think, if result should be `a/:b` or just `a/b`.
    
    I still don't have any idea, why I would need to use `form` as in your use case above, but that does not mean that someone else could not find it useful somehow.

--------------------------------------------------------------------------------

On 2016-04-21T07:17:48Z, dockimbel, commented:
<https://github.com/red/red/issues/1830#issuecomment-212781087>

    I am not sure either if such change would be beneficial or not in practice, that's why I asked others opinion. FORM has always been an odd function anyway, so its sematics needs some clearing, we could even repurpose it for a text formatting dialect.

--------------------------------------------------------------------------------

On 2016-04-21T07:19:30Z, Oldes, commented:
<https://github.com/red/red/issues/1830#issuecomment-212781513>

    I would use it for text formatting dialect, if you want to modify it from the original functionality anyway.

--------------------------------------------------------------------------------

On 2016-04-21T07:21:30Z, Oldes, commented:
<https://github.com/red/red/issues/1830#issuecomment-212781995>

    Imho... when in Rebol is:
    
    ```
    >> form [:a]
    == "a"
    ```
    
    than probably even your proposed change in path is correct. `form` is simply confusing.

--------------------------------------------------------------------------------

On 2016-04-21T07:33:52Z, rebolek, commented:
<https://github.com/red/red/issues/1830#issuecomment-212786643>

    I don’ think `form` is confusing. If you read Rebol’s help string, it says `Converts a value to a human-readable string.` So IMO it makes sense to convert `a/:b` to `a/b`. Red also converts `'a` to `a`, which Rebol does not. This is +1 to Red.

--------------------------------------------------------------------------------

On 2016-04-21T07:40:47Z, dockimbel, commented:
<https://github.com/red/red/issues/1830#issuecomment-212788726>

    @Oldes In Rebol3, it's different than Rebol2, not sure why:
    
    ```
    >> form [:a]
    == ":a"
    ```

--------------------------------------------------------------------------------

On 2016-04-21T07:50:39Z, pekr, commented:
<https://github.com/red/red/issues/1830#issuecomment-212791226>

    I am with Oldes here, while not trying to solve the `form` vs the `mold` relation. What does the human readable argument mean anyway? For a programmer, it is going to be confusing imo. Hmm, but then all I want `form` to do is basically a `to-string` ... 

--------------------------------------------------------------------------------

On 2016-04-21T07:52:06Z, Oldes, commented:
<https://github.com/red/red/issues/1830#issuecomment-212791475>

    `to-string` is not placing spaces between values, which is the main difference. And the spaces are what makes the result human readable.

--------------------------------------------------------------------------------

On 2016-04-21T07:56:35Z, dockimbel, commented:
<https://github.com/red/red/issues/1830#issuecomment-212792627>

    For the record, in Rebol2:
    
    ```
    >> form ['a]
    == "a"
    >> form [:a]
    == "a"
    >> form [a:]
    == "a"
    >> form [/a]
    == "a"
    ```

--------------------------------------------------------------------------------

On 2016-04-21T07:57:08Z, Oldes, commented:
<https://github.com/red/red/issues/1830#issuecomment-212792765>

    @rebolek Ask yourself if you ever used `form` and in which cases. I'm pretty sure that you will not find many, because forming block with not reduced values somehow does not make sense. I found `form` just in very old scripts where it was used with `reduce` function, probably because there was not `reform` yet. Confusing it is, because there is so many string creating functions and form is probably the one which is the less useful.

--------------------------------------------------------------------------------

On 2016-04-21T07:58:41Z, dockimbel, commented:
<https://github.com/red/red/issues/1830#issuecomment-212793277>

    _What does the human readable argument mean anyway?_
    
    Did Carl ever define that precisely somewhere?

--------------------------------------------------------------------------------

On 2016-04-21T08:00:50Z, dockimbel, commented:
<https://github.com/red/red/issues/1830#issuecomment-212794271>

    @Oldes Indeed, the various ways to serialize values are messy in Rebol. That is one of the reasons I wanted to take the time to analyze `to` conversion matrix before deciding on the rules, and as a side-effect, how FORM should behave.

--------------------------------------------------------------------------------

On 2016-04-21T08:13:12Z, Oldes, commented:
<https://github.com/red/red/issues/1830#issuecomment-212798682>

    `form` in Rebol just takes not reduced values, converts them to string and join them with space char, if there is more than one. So in my view, it's all about the core conversion, like if `to string! first [a/b]` should be `a/b` or `ab` as it is in Rebol now. Note that this is also in Rebol inconsistent as in this case `form` is producing different result than just `to string!`, which is strange.

--------------------------------------------------------------------------------

On 2016-04-21T08:16:00Z, Oldes, commented:
<https://github.com/red/red/issues/1830#issuecomment-212799262>

    I still think that removing some chars from values is not making it human readable... if so, you could also remove `@` char from formed email datatype.

--------------------------------------------------------------------------------

On 2016-04-21T09:31:04Z, Dobeash, commented:
<https://github.com/red/red/issues/1830#issuecomment-212829681>

    Removing leading % from file is useful though.

--------------------------------------------------------------------------------

On 2016-04-21T12:16:02Z, ghost, commented:
<https://github.com/red/red/issues/1830#issuecomment-212887664>

    @Dobeash What is your use case for filenames without the leading `%` ? I don't think that would be of much use to me on Windows, since redbol, for consistency across platforms (which is a good thing) uses unix-like paths and not like that on windows. So even if % gets removed i will have to manipulate the string to get desired path on Windows.

--------------------------------------------------------------------------------

On 2016-04-22T10:07:47Z, iArnold, commented:
<https://github.com/red/red/issues/1830#issuecomment-213366236>

    You could even argue that "a/b" is more human readable than "a/:b" but then "ab" or "a b" will be even more human readable. 
    "/" is "Forward slash" or "over" "and within this"
    ":" is "colon" or "get the value of" 
    That makes "a/:b" human readable enough?

--------------------------------------------------------------------------------

On 2016-04-22T14:24:36Z, moliad, commented:
<https://github.com/red/red/issues/1830#issuecomment-213447624>

    Afaik, FORM is only really used by PRINT
    
    I use print only on data I previously construct (using various methods).  so my two cents is to completely remove the current FORM mechanism. its virtually useless

--------------------------------------------------------------------------------

On 2016-11-12T11:51:51Z, henrikmk, commented:
<https://github.com/red/red/issues/1830#issuecomment-260117758>

    For what it's worth, if FORM is supposed to take data and makes it human readable, then the actual output format is up for grabs and may change between versions. That means, it's always risky to parse FORMed data. It just hasn't been risky, since the output of FORM has been largely identical across different REBOL clones, AFAIK.
    
    The way that FORM is used in R2, where I have the most experience, serves as an alternative to MOLD in that it conveniently leaves out square brackets. I use it, because it happens to give the necessary output. This should not be how to use FORM. There ought to be very specific DEBRACKET and BRACKET functions for that.
    
    I always saw FORM as just the very basics of providing human readable REBOL values and if it were to become much more advanced, say, FORMing objects or even images, then the output is really up for grabs and should never be parsed back into Red, unless you really have no choice.
    
    This is because I see FORM eventually becoming configurable for your favorite date and time format, or for specific ways you want to output objects and blocks as ASCII tables or images as ASCII art.
    
    This is a big frustration for me in REBOL, because there's no formal way to configure things like date and time and number decimal formatting, and you always have to build your formatters as slow mezzanines.

--------------------------------------------------------------------------------

On 2020-03-21T18:32:02Z, 9214, commented:
<https://github.com/red/red/issues/1830#issuecomment-602084262>

    https://github.com/red/red/issues/3409
    
    Also, `GUI` tag does not apply here.

--------------------------------------------------------------------------------

On 2020-03-22T02:19:12Z, greggirwin, commented:
<https://github.com/red/red/issues/1830#issuecomment-602137667>

    > ...if FORM is supposed to take data and makes it human readable, then the actual output format is up for grabs and may change between versions.
    
    @henrikmk makes a good point here. I'll close this, and we can reopen if needed.

--------------------------------------------------------------------------------

On 2020-03-22T12:35:52Z, Oldes, commented:
<https://github.com/red/red/issues/1830#issuecomment-602193279>

    @greggirwin Ok.. so the decision was, that `form quote a/:b` should be `"a/b"` and so it is a Rebol bug, right?

--------------------------------------------------------------------------------

On 2020-03-22T12:43:29Z, Oldes, commented:
<https://github.com/red/red/issues/1830#issuecomment-602194368>

    Btw... there is this old blog: http://www.rebol.net/cgi-bin/r3blog.r?view=0304 where Carl said:
    
    > What I would really like to see is a table that lists all datatypes on left side, and a column for each of the the FORM, MOLD, and TO STRING! outputs.
    
    I wonder if there is any such a list now.

--------------------------------------------------------------------------------

On 2020-03-22T14:23:21Z, meijeru, commented:
<https://github.com/red/red/issues/1830#issuecomment-602208422>

    @Oldes I made one some time ago. See [my gist](https://gist.github.com/meijeru/f5cf9fccb1f3cf2e9d017c59ebf6f93f)
    If need be you can adapt and rerun the program which generates the html [this gist](https://gist.github.com/meijeru/6f4d37547a2ec16b9502812eb11c2dcd)

--------------------------------------------------------------------------------

On 2020-03-22T17:04:18Z, Oldes, commented:
<https://github.com/red/red/issues/1830#issuecomment-602240093>

    @meijeru yes... I've seen it, but I would prefer to see such a table with the suppose to be correct results. For example now I have in Red this:
    ```red
    >> form quote a/b/c:
    == "a/b/c:"
    ```
    but shouldn't it be just `"a/b/c"`?

--------------------------------------------------------------------------------

On 2020-03-22T18:47:33Z, meijeru, commented:
<https://github.com/red/red/issues/1830#issuecomment-602254007>

    The generating program will just show what is implemented currently. Thus it allows anyone to review and state what they would rather want the implementation to be. Nothing prevents you from making a WISH issue (or a REP) on particular items.

--------------------------------------------------------------------------------

On 2020-03-22T23:20:54Z, greggirwin, commented:
<https://github.com/red/red/issues/1830#issuecomment-602293073>

    @Oldes, they're only bugs if not doing what we want. :^) The table is enormously helpful, because we can see each case and point out what we think should change.

--------------------------------------------------------------------------------

On 2020-03-23T10:12:49Z, Oldes, commented:
<https://github.com/red/red/issues/1830#issuecomment-602501814>

    @greggirwin I agree, but where to see _what we want_? :-)

--------------------------------------------------------------------------------

On 2020-03-23T17:55:06Z, greggirwin, commented:
<https://github.com/red/red/issues/1830#issuecomment-602760292>

    In your mind. Then write it down for the rest of us. :^)

--------------------------------------------------------------------------------

On 2020-03-23T17:55:56Z, greggirwin, commented:
<https://github.com/red/red/issues/1830#issuecomment-602760772>

    People can certainly copy the table and tweak it manually. That lets us see everything in context.

