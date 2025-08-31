
#4109: /INTO inconsistencies
================================================================================
Issue is open, was reported by hiiamboris and has 6 comment(s).
[type.review]
<https://github.com/red/red/issues/4109>

**Describe the bug**

LOAD & EXTRACT & COLLECT use *append* method:
```
>> load/into "1 2 3 4 5" s: [j k l]
== [j k l 1 2 3 4 5]
>> extract/index/into "abcde" 2 3 s: "jkl"
== "jklce"
>> collect/into [keep [j k l]] [1 2 3 4 5]
== [1 2 3 4 5 j k l]
```
REDUCE & COMPOSE use *insert* method:
```
>> reduce/into [1 2 3 4 5] s: [j k l] s
== [1 2 3 4 5 j k l]
>> compose/into [1 2 3 4 5] s: [j k l] s
== [1 2 3 4 5 j k l]
```

**Expected behavior**

I suggest for consistency of meaning that we use a single method everywhere. 
- `insert` allows finer control, though does so at the cost of efficiency (the need to shift the rest of the block). In fact, at a huge cost (see https://github.com/red/red/issues/3340#issuecomment-547436501) since it inserts items one by one.
- `append` is a more common variant, using it won't require the user getting an explicit `tail` of the target series every time, and guarantees O(1) insertion time.

Inspecting Red sources I have found the following occurrences of `reduce/into` & `collect/into`:
### 1) `reduce/into .. tail ..` pattern:
- 1 in `repend` https://github.com/red/red/blob/62ca5aa9647eeba9ea8fc64ab83f14dc27408c49/environment/functions.red#L206
- 1 in `print` https://github.com/red/red/blob/62ca5aa9647eeba9ea8fc64ab83f14dc27408c49/runtime/natives.reds#L701
- 1 in View `on-deep-change` https://github.com/red/red/blob/62ca5aa9647eeba9ea8fc64ab83f14dc27408c49/modules/view/view.red#L306-L308
- 1 in VID `layout` https://github.com/red/red/blob/62ca5aa9647eeba9ea8fc64ab83f14dc27408c49/modules/view/VID.red#L676
- 2 in RTD: https://github.com/red/red/blob/62ca5aa9647eeba9ea8fc64ab83f14dc27408c49/modules/view/RTD.red#L60 https://github.com/red/red/blob/62ca5aa9647eeba9ea8fc64ab83f14dc27408c49/modules/view/RTD.red#L80
### 2) `reduce/into` or `collect/into` head, where it won't matter head or tail:
- 1 in `register-scheme` https://github.com/red/red/blob/62ca5aa9647eeba9ea8fc64ab83f14dc27408c49/environment/networking.red#L21
- 1 in GUI console's `core.red` (into cleared series): https://github.com/red/red/blob/62ca5aa9647eeba9ea8fc64ab83f14dc27408c49/environment/console/GUI/core.red#L465  https://github.com/red/red/blob/62ca5aa9647eeba9ea8fc64ab83f14dc27408c49/environment/console/GUI/core.red#L477
- 1 in GUI console's `debug-print` (into cleared series) https://github.com/red/red/blob/62ca5aa9647eeba9ea8fc64ab83f14dc27408c49/environment/console/GUI/gui-console.red#L26
- 4 in the CSV codec (into cleared or new series) https://github.com/red/red/blob/62ca5aa9647eeba9ea8fc64ab83f14dc27408c49/environment/codecs/csv.red#L49-L57
In this one the intermediate string isn't needed at all: https://github.com/red/red/blob/62ca5aa9647eeba9ea8fc64ab83f14dc27408c49/environment/codecs/csv.red#L160-L171 https://github.com/red/red/blob/62ca5aa9647eeba9ea8fc64ab83f14dc27408c49/environment/codecs/csv.red#L183-L188 https://github.com/red/red/blob/62ca5aa9647eeba9ea8fc64ab83f14dc27408c49/environment/codecs/csv.red#L197-L203
### 3) `reduce/into` head where it will be more efficient to use tail instead:
- 7 in GUI console's `core.red` https://github.com/red/red/blob/62ca5aa9647eeba9ea8fc64ab83f14dc27408c49/environment/console/GUI/core.red#L649  https://github.com/red/red/blob/62ca5aa9647eeba9ea8fc64ab83f14dc27408c49/environment/console/GUI/core.red#L676  https://github.com/red/red/blob/62ca5aa9647eeba9ea8fc64ab83f14dc27408c49/environment/console/GUI/core.red#L681  https://github.com/red/red/blob/62ca5aa9647eeba9ea8fc64ab83f14dc27408c49/environment/console/GUI/core.red#L767  https://github.com/red/red/blob/62ca5aa9647eeba9ea8fc64ab83f14dc27408c49/environment/console/GUI/core.red#L798  https://github.com/red/red/blob/62ca5aa9647eeba9ea8fc64ab83f14dc27408c49/environment/console/GUI/core.red#L808  https://github.com/red/red/blob/62ca5aa9647eeba9ea8fc64ab83f14dc27408c49/environment/console/GUI/core.red#L885

And not a single occurrence of `compose/into`.

To conclude, I believe the usage statistics shows that *insert* method's usefulness is purely virtual. And it's better to shorten the pattern of `reduce/into a tail b` into just `reduce/into a b`, using *append* method for all /into functions.

We should also ask ourselves if `compose` deserves the `/into` refinement at all.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 18-Oct-2019/15:33:41+03:00 commit #ed913ef
```



Comments:
--------------------------------------------------------------------------------

On 2019-10-29T16:39:05Z, 9214, commented:
<https://github.com/red/red/issues/4109#issuecomment-547516064>

    https://github.com/red/red/issues/2927, https://github.com/red/red/issues/2189. IIRC Parse `collect` [has](https://github.com/red/red/blob/master/runtime/parse.reds#L1791) `after` keyword (as a supplement for `into`), which forces it to `append`.

--------------------------------------------------------------------------------

On 2019-10-29T16:59:36Z, hiiamboris, commented:
<https://github.com/red/red/issues/4109#issuecomment-547525897>

    Thanks! Totally forgot about `collect`. I'll add it to the ticket.

--------------------------------------------------------------------------------

On 2022-01-19T23:23:18Z, hiiamboris, commented:
<https://github.com/red/red/issues/4109#issuecomment-1016962408>

    Also worth mentioning here, Parse's `collect after` is of rather limited use because it just marks specific location and `insert`s at it. `keep` enforces `/only` and when I want to mix `/only` with non-`/only` my only option is to use `append`. But Parse will ignore appended things and will `insert` before them, messing up everything. Recursive calls to such facility are also not possible because inner `collect after` will mess outer `collect after`. 

