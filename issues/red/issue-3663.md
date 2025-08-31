
#3663: Confusion about trim <binary>
================================================================================
Issue is open, was reported by meijeru and has 20 comment(s).
[status.deferred] [type.review]
<https://github.com/red/red/issues/3663>

**Describe the bug**
The brief announcement in the recent blog entry, that says `trim` is now working on binary values, does not make it clear if the `/all` refinement will still eliminate zero bytes or not. In fact, it does not. Is this intentional?

**To reproduce**
>> trim #{006120626300} 
== #{61206263}
>> trim/all #{006120626300} 
== #{0061626300}

**Expected behavior**
Undocumented

**Platform version (please complete the following information)**
```
All I presume
```



Comments:
--------------------------------------------------------------------------------

On 2018-12-14T23:05:41Z, endo64, commented:
<https://github.com/red/red/issues/3663#issuecomment-447505193>

    I remember that it's been noted somewhere, `trim` with binary runs always in `all` mode and default with `#{00}` (null byte).
    
    But I don't think `trim/all`s default is not null byte is intentional. 
    
    ```
    >> trim/all #{006120626300090D0A}
    == #{0061626300}
    >> trim/all/with #{006120626300090D0A} #{00}
    == #{61206263090D0A}
    ```
    
    See this [line](https://github.com/red/red/blob/25777f5ef828300f619a09efcdc18a6a28e41c9d/runtime/datatypes/binary.reds#L1226) , if we use `all` refinement `with` is not provided and default values will be used, see this [here](https://github.com/red/red/blob/25777f5ef828300f619a09efcdc18a6a28e41c9d/runtime/datatypes/string.reds#L2357)
    
    Can be fixed easily.

--------------------------------------------------------------------------------

On 2018-12-15T19:09:00Z, greggirwin, commented:
<https://github.com/red/red/issues/3663#issuecomment-447590951>

    In the blog I said " If you use the /all refinement, whitespace chars are trimmed as if it were a string", the doc string says "Removes space from a string or NONE from a block. ". What we need to do is clearly define "space" and "whitespace", while keeping things short. As always, doc strings necessarily trade length for clarity at times. That's what real docs are for.
    
    Not sure this is any better than what we have.
    ```
    USAGE:
         TRIM series
    
    DESCRIPTION: 
         Removes whitespace from strings, none from blocks, nulls from binary. 
      or
         Removes whitespace/none/null from string/block/binary respectively. 
    
         TRIM is an action! value.
    
    ARGUMENTS:
         series       [series!] 
    
    REFINEMENTS:
         /head        => Removes only from the head.
         /tail        => Removes only from the tail.
         /auto        => Auto indents lines relative to first line. (strings only)
         /lines       => Removes all line breaks and extra spaces. (strings only)
         /all         => Removes all whitespace. (treat binary as string)
         /with        => Same as /all, but removes characters in STR.
            str          [char! string! binary! integer!] 
    ```

--------------------------------------------------------------------------------

On 2018-12-15T19:22:56Z, 9214, commented:
<https://github.com/red/red/issues/3663#issuecomment-447591796>

    > Not sure this is any better than what we have.
    
    What we have is `trim/all` that does **not** follow the spec. It removes "spaces", not nulls:
    ```red
    >> to binary! space
    == #{20}
    >> trim/all #{AA20BB}
    == #{AABB}
    ```

--------------------------------------------------------------------------------

On 2018-12-15T19:43:24Z, greggirwin, commented:
<https://github.com/red/red/issues/3663#issuecomment-447593058>

    The current spec wasn't updated for binary. My proposed amendment above addresses the current behavior. I'm with @endo64 on this. `/all` without `/with` should trim all nulls.

--------------------------------------------------------------------------------

On 2019-09-07T15:38:43Z, dockimbel, commented:
<https://github.com/red/red/issues/3663#issuecomment-529118657>

    @greggirwin @endo64 Could we write down the rule with want for `trim` on binaries clearly and make the trivial fix for this ticket?

--------------------------------------------------------------------------------

On 2019-09-07T18:12:22Z, greggirwin, commented:
<https://github.com/red/red/issues/3663#issuecomment-529132800>

    My proposal:
    
    `Trim` on binaries trims nulls, always. If you want to trim whitespace, as if it were a string, use `trim/with bin " ^-^/^D"` (and decide on bitset support for the `/with` spec later).
    
    The other change I propose is that `/with` should *NOT* imply `/all`. If you want both behaviors, use both refinements.
    
    Updated doc strings:
    ```
    USAGE:
         TRIM series
    
    DESCRIPTION: 
         Removes whitespace from strings, none from blocks, nulls from binary. 
    
         TRIM is an action! value.
    
    ARGUMENTS:
         series       [series!] 
    
    REFINEMENTS:
         /head        => Removes only from the head.
         /tail        => Removes only from the tail.
         /auto        => Auto indents lines relative to first line. (strings only)
         /lines       => Removes all line breaks and extra spaces. (strings only)
         /all         => Removes all occurrences.
         /with        => Removes values in spec, rather than the default values.
            spec         [char! string! binary! integer!] 
    ```

--------------------------------------------------------------------------------

On 2019-09-08T00:11:30Z, endo64, commented:
<https://github.com/red/red/issues/3663#issuecomment-529156934>

    > The other change I propose is that /with should NOT imply /all. If you want both behaviors, use both refinements.
    
    @greggirwin +1 for that, but we should raise another issue for that. And may be rename this one to "TRIM/ALL should remove null bytes on binary values instead of whitespaces"
    
    @dockimbel Simple fix in my mind was changing below lines in [binary.reds](https://github.com/red/red/blob/25777f5ef828300f619a09efcdc18a6a28e41c9d/runtime/datatypes/binary.reds#L1226)
    
    ```
    case [
    	any  [all? OPTION?(with-arg)] [string/trim-with as red-string! bin with-arg]
    	any  [auto? lines?][--NOT_IMPLEMENTED--]
    	true [trim-head-tail bin head? tail?]
    ]
    ```
    
    to 
    
    ```
    case [
    	all  [all? not OPTION?(with-arg)] [string/trim-with as red-string! bin as red-value! as red-integer! 0]
    	any  [all? OPTION?(with-arg)] [string/trim-with as red-string! bin with-arg]
    	any  [auto? lines?][--NOT_IMPLEMENTED--]
    	true [trim-head-tail bin head? tail?]
    ]
    ```
    
    so `string/trim-with` would be called with `#{00}` in `with-arg` argument, and wouldn't use default values (`with-chars: [9 10 13 32]`), but it didn't work. I don't know how to turn `OPTION?(with-arg)` on.

--------------------------------------------------------------------------------

On 2019-09-09T08:48:31Z, endo64, commented:
<https://github.com/red/red/issues/3663#issuecomment-529364177>

    I've added a WISH ticket: https://github.com/red/REP/issues/52

--------------------------------------------------------------------------------

On 2019-09-20T02:52:31Z, greggirwin, commented:
<https://github.com/red/red/issues/3663#issuecomment-533383445>

    @dockimbel do you need any more on this, to make a decision?

--------------------------------------------------------------------------------

On 2022-03-03T13:07:25Z, dockimbel, commented:
<https://github.com/red/red/issues/3663#issuecomment-1058024032>

    I have changed the `trim` default behavior on `binary!` to remove NUL bytes (commit: https://github.com/red/red/commit/e707df880de6c9c3652886262eeb200e01f3a7b2)
    
    > The other change I propose is that /with should NOT imply /all.
    
    That one requires a complete re-implementation of TRIM for all supported datatypes. So I'll defer this ticket until we find time for that.

