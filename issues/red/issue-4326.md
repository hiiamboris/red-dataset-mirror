
#4326: tag loading inconsistency
================================================================================
Issue is open, was reported by hiiamboris and has 18 comment(s).
[type.design]
<https://github.com/red/red/issues/4326>

**Describe the bug**

Some weird tags can be loaded in one by one, but not together.
(I wanted to put a single double-quote there, for tag composition)

```
>> [<tag flag=">]
== [<tag flag=">]
>> {tag flag=""}
== {tag flag=""}
>> [<tag flag=">] {tag flag=""}
*** Syntax Error: invalid tag! at {<tag flag=">] {tag flag=""}}
*** Where: do
*** Stack: load 
```
Note: last line was two of the above values, combined.

**Expected behavior**

Either this tag format should be invalid in both scenarios, or valid in both.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 10-Mar-2020/16:22:26+03:00
```



Comments:
--------------------------------------------------------------------------------

On 2020-03-11T02:33:58Z, qtxie, commented:
<https://github.com/red/red/issues/4326#issuecomment-597413214>

    It's correct on fast-lexer branch.
    ```
    >> [<tag flag=">]
    *** Syntax Error: (line 2) invalid tag at <tag flag=">]
    *** Where: transcode
    *** Stack: load
    ```

--------------------------------------------------------------------------------

On 2020-03-22T12:02:37Z, 9214, commented:
<https://github.com/red/red/issues/4326#issuecomment-602188719>

    Can we agree that this can be closed?
    ```red
    >> [<tag flag=">]
    *** Syntax Error: (line 2) invalid tag at <tag flag=">]
    *** Where: transcode
    *** Stack: load 
    
    >> {tag flag=""}
    == {tag flag=""}
    
    >> [<tag flag=">] {tag flag=""}
    *** Syntax Error: (line 2) invalid tag at <tag flag=">] {tag flag=""}
    *** Where: transcode
    *** Stack: load 
    ```

--------------------------------------------------------------------------------

On 2020-03-22T12:44:26Z, hiiamboris, commented:
<https://github.com/red/red/issues/4326#issuecomment-602194494>

    TBH I don't understand what's the situation on tags right now.
    Is `<tag flag=">` an invalid tag?
    Is it okay to have this:
    ```
    >> t: <tag flag="junk">
    >> p: copy/part t 10
    == <tag flag=">
    >> load mold p
    *** Syntax Error: (line 1) invalid tag at <tag flag=">
    *** Where: transcode
    *** Stack: load 
    ```
    ???
    So, whole tag is valid but it's part is not valid? ;)
    
    I think tags require more design thought that was put into them. And once there's a specification and rationale to justify it, then okay, out of sight out of mind.

--------------------------------------------------------------------------------

On 2020-03-23T01:06:15Z, 9214, commented:
<https://github.com/red/red/issues/4326#issuecomment-602311890>

    I think `tag!` should strive to be more than a `string!` with angle-bracket delimiters, so forbidding unmatched `"` makes sense to me, because, semantically, that's an invalid tag.
    
    But then again (tying this up with https://github.com/red/REP/issues/68) there are no accessors for tag's name, attributes and values, and no way to discern starting/ending tags from the content they enclose without textual processing.
    
    ```red
    pick   <a color="red"> 'name  → "a"
    select <a color="red"> 'color → "red"
    ```

--------------------------------------------------------------------------------

On 2020-03-23T02:53:10Z, greggirwin, commented:
<https://github.com/red/red/issues/4326#issuecomment-602347942>

    That makes them a hybird, between block and string. Do we know if, from SGML on, that all tags share a syntax and have a formal grammar defined?

--------------------------------------------------------------------------------

On 2020-10-05T11:55:02Z, dockimbel, commented:
<https://github.com/red/red/issues/4326#issuecomment-703583164>

    Making tags more than "a string! with angle-bracket delimiters" was never in the plans. Such features would make tags orders of magnitude more expensive to handle both in memory footprint and processing time. A destructuring model similar to URL<=>object could be done for tags, so that users can individually choose which tags should be expanded into a richer datastructure.

--------------------------------------------------------------------------------

On 2020-11-03T19:16:34Z, greggirwin, commented:
<https://github.com/red/red/issues/4326#issuecomment-721324876>

    We have `encode-url/decode-url` already. We could mezz up parallels for tag values, but a markup codec (as R2 had `load-markup`) is pending. One of the big decisions, maybe the only thing holding it up, is the output structure. I don't remember who was involved in that design discussion, but since there's no clear answer that won we just have to make a call and live with it.

--------------------------------------------------------------------------------

On 2020-11-03T19:17:06Z, greggirwin, commented:
<https://github.com/red/red/issues/4326#issuecomment-721325136>

    It was probably XML as a specific codec target.

--------------------------------------------------------------------------------

On 2021-03-25T21:22:34Z, Oldes, commented:
<https://github.com/red/red/issues/4326#issuecomment-807514269>

    I think that tag could be internally treated as a string (as it is now) as long as nobody want to access it's inner structure. If it's attributes are requested, it would be parsed internally and the info would be provided. Such a parsed structure would be connected with the tag itself. I can imagine such a scenario:
    ```red
    tag: <span>
    put tag 'color "red"
    ;== <span color="red">
    ```
    or
    ```red
    extend <a> [href: http://example target: _blank]
    ;== <a href="http://example" target="_blank">
    ```
    
    But I agree, that this is very low priority ;-)

