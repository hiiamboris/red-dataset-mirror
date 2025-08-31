# Archived messages from: [gitter.im/red/red/map-datatype](/gitter.im/red/red/map-datatype/) from year: 2018

## Friday 10th August, 2018

giesse

[23:45](#msg5b6e239267eb9f60fec3318c)anybody with strong opinions about https://github.com/red/red/wiki/%5BDesign%5D-Removing-keys-from-MAP!-values

## Monday 13th August, 2018

Oldes

[21:13](#msg5b71f48d5ec2bc174ff488dc)I like both `remove/part`and also `unset`on path propositions.

greggirwin

[21:32](#msg5b71f8d467eb9f60fed7684d)Thanks Oldes!

x8x

[22:07](#msg5b720114cdc5fe3dfa45cc71)Been bitten by this recently expecting the presence of a key in a JSON object (created in Red) in some JS code, althought that is easly mitigated by checking for the presence of the key first, there is plenty of code out there that may need customization, also REST APIs.. I don't like `remove/part` because of the meaning, would be better to have `remove/key` but perhaps the last proposal, `unset 'map/("key")` is the more redbolish way to do it. Never used `unset` but time to start using it. And thanks for taking care care of that!

[22:13](#msg5b72029e9aef23712411c751)Should converting an `object!` to a `map!` be allowed? Why not?

```
make map! object [a: 1]
*** Script Error: cannot MAKE/TO map! from: make object! [a: 1]
```

greggirwin

[22:22](#msg5b7204a426e68560fdf022bf)Objects have a slight mismatch with maps. Currently the `none` issue, but that will likely change and not be a problem. `To` map should be OK, but going the other way opens you up to dupe key problems. As long as we doc that clearly, that should be acceptable as well. The current workaround isn't too painful, as it just requires using `body-of` on the arg.

x8x

[22:35](#msg5b72079c5cd1d528ceae037f)Yes, can't go from `map!` to `object!` because of keys type.  
I'd like to add to the previous comment that working inside Red, I find it cool that you remove a key by setting it to `none!`. If the problem is strictly related to passing data around like with JSON, then maybe the JSON loader/emitter shouldn't use `map!`.

greggirwin

[22:39](#msg5b7208a4a3a93d24225ea4bb)If the JSON codec doesn't use `map!`, but `object!` it can't represent JSON accurately, because that would rule out strings as well, unless we use `block!`, which is then not strictly a key-value structure.

x8x

[22:42](#msg5b7209385cd1d528ceae0381)Oh well... in JSON you can have a string as a key so `map!` is the only possible conversion to. In Rebol the `object!` `self` was problematic when REST APIs used it as a key.

greggirwin

[22:42](#msg5b72093f179f842c97342082)In the grand scheme, is the cool factor of implicit `none == remove` more important than consistency and the ability of maps to store the same values as blocks and objects? Still not perfect, but better.

x8x

[22:44](#msg5b7209cd5054ab1410e4a9af)Agreed! While cool, it's still something that needs to be learned and not really the first thing that logic would suggest for new comers.

[23:13](#msg5b72107f5054ab1410e4a9bc)`remove/part` or `remove/key` wouldn't work because `remove` description says `Returns the series at the same index after removing a value.`, which wouldn't make sense for this use case while `unset` already returns the proper value.

## Tuesday 14th August, 2018

rebolek

[06:04](#msg5b7270ea937eee2423152512)@giesse the document deals only with removing keys, but what about querying for non existent keys? If setting key to `none` would be removed, should `map/some-random-key` return `none`, or should it change also? I like this feature.

greggirwin

[16:03](#msg5b72fd39637ee66082ed0a7c)@rebolek, that's another hard call. Blocks return none, but objects throw an error. So maps could go either way. Blocks (and objects) throw an error if you try to set a reference for a non-existent key, maps do not. If maps don't throw an error assigning, I don't think they should throw an error reading.

If we then think in terms of overall strictness, objects are the most strict, maps the least. We can also provide a simple wrapper to test for key existence, in any key-value structure. It's not hard today, but does require different logic.

meijeru

[16:29](#msg5b730385a3a93d2422643322)Concerning conversion from object to map v.v., there was a discussion in which @dockimbel gave his (final?) judgment. See issues #2338 and #2339, now closed.

greggirwin

[16:43](#msg5b7306b549932d4fe4df7f9e)Thanks @meijeru !

toomasv

[17:34](#msg5b73128de9b96f2c980a53d8)May be precarious and confusing perhaps, but can't JSON `null` values be set to `none` as `word!`? Probably this is dismissed already, but:

```
>> m: #(a: none)
== #(
    a: none
)
>> type? get :m/a
== none!
>> o: object body-of m
== make object! [
    a: none
]
>> type? o/a
== none!
```

Otherwise I think `unset 'map/key` proposal is attractive, but so far only words and blocks of words are taken for arguments.

BTW:

```
unset body-of #(a: none)
```

kills the console.

greggirwin

[17:37](#msg5b73134b937eee242319032e)@toomasv, too precarious and confusing to use a word. It means the user has to special case everything, and doesn't leverage the types we have. Kind of like when people find Red and do all sorts of string manipulation rather than using blocks and direct values.

[17:37](#msg5b731359937eee2423190343)Please file a ticket for the `unset` issue with `body-of`.

[17:39](#msg5b7313ed937eee24231906f2)Design is that tricky balance of knowing consistency is a great thing, but also that it is just a means to an end, not the end goal in itself. So we want to be as consistent as we can, in the context of each type also being its own "domain" and should behave in a way that makes sense in isolation.

toomasv

[17:43](#msg5b7314cb988005174edbab15)Gee! `unset 'none` is the culprit -- this kills the console!

[17:48](#msg5b7315f5637ee66082eda74c)https://github.com/red/red/issues/3506

Oldes

[19:47](#msg5b7331e8179f842c973ad99e) 9

rebolek

[20:14](#msg5b73384049932d4fe4e0a9b3)@toomasv I agree with @greggirwin, using `none` word is too confusing.

[20:15](#msg5b7338755762ee4fe577c9d5)Regarding #3506 - it's not a bug, it's a feature ;) Until we get `protect`.

toomasv

[20:27](#msg5b733b4ae9b96f2c980b4c25):smile:

meijeru

[21:49](#msg5b734e69937eee24231a6dca)But @greggirwin wants to find out where the `unset 'none` trips up the toolchain. So #3506 is not off the table yet...

giesse

[21:57](#msg5b73503e179f842c973b915c)@rebolek

```
--== Red 0.6.3 ==-- 
Type HELP for starting information. 

>> m: #(a 1 b 2)
== #(
    a: 1
    b: 2
)
>> find m 'a
== true
>> find m 'b
== true
>> find m 'c
== none
```

## Tuesday 21st August, 2018

toomasv

[08:20](#msg5b7bcb3794f8164c177aa8d3)Could `trim` be used to drop `none`-valued fields from map? :confused:

9214

[08:20](#msg5b7bcb59d8d36815e56ad0b9)@toomasv prove me wrong, but I don't think map can have such fields.

[08:20](#msg5b7bcb67ff4451561618021a)Setting field to `none` effectively removes it from a map.

toomasv

[08:21](#msg5b7bcb8df86b741b059fca0e)@9214 It's about :point\_up: \[August 11, 2018 2:45 AM](https://gitter.im/red/red/map-datatype?at=5b6e239267eb9f60fec3318c)

In the document @greggirwin proposes `remove/part` or `unset!` or `unset`. I ask, whether `trim` can be considered.

9214

[08:26](#msg5b7bccabfd3c641b06ea7f81)What if I want to remove individual `none` keys?

x8x

[08:26](#msg5b7bccbb8d59fb7567e17694)@toomasv it's a nice idea and inline with `trim` definition regarding `block!` "Removes NONE from a block." This + `unset` +1

[08:27](#msg5b7bcd0d3815912505664348)@9214 `unset` single key, `trim` all `none!`

toomasv

[08:29](#msg5b7bcd54f86b741b059fdc53)@9214 Individual `none`-keys might be removed with `trim` from head and tail with corresponding refinements, otherwise I think all should be removed.

9214

[08:29](#msg5b7bcd74fd3c641b06ea8434)@toomasv map doesn't have neither head nor tail, it's not a series.

toomasv

[08:30](#msg5b7bcd9658a3797aa395720c)True :no\_mouth:

9214

[08:32](#msg5b7bce1a38a12915e4d4a2d4)Is this solely a JSON codec issue or a "grand scheme of things" proposal?

x8x

[08:36](#msg5b7bcf13844de2337cdc7711)Then if not `trim` a function to remove all `none!` with option to return a copy or modify original would still be useful.

9214

[08:43](#msg5b7bd0c5f5402f32aa6ddcb4)I lean towards `remove`. Question of "remove all `none` keys" could be rephrased, more generally, as "remove all keys with value X".

toomasv

[08:50](#msg5b7bd256fd3c641b06eaa319)But we need (also) to remove by value, not by key. Without major change in `remove` I don't see how to `remove` from map by value.

9214

[08:53](#msg5b7bd2fffd3c641b06eaa742)`if map/key = bad [remove map key]`?

toomasv

[08:55](#msg5b7bd38dac25fd11b5720e12)But would `map/non-existing-key` still return `none`? If so, what then?

9214

[08:56](#msg5b7bd3bc38a12915e4d4c270)Then we couldn't distinguish between existing `none` keys and non-existing keys.

[08:57](#msg5b7bd403a491f459177c5f97)Non-existing keys then can return `unset` or an `error!`. It's ugly either way though.

[08:58](#msg5b7bd43bf86b741b05a00821)I'd pick `error!`, since then I can at least use `attempt [...]` to emulate the old behavior (which I personally like quite a lot).

toomasv

[09:07](#msg5b7bd63ef5402f32aa6dfaaf)Could do something like

```
if all [find keys-of map 'key not map/key][
   remove/part map 'key
]
```

Not nice.  
For all `none` keys

```
foreach key keys-of map [unless map/:key [
   remove/part map key
]]
```

[09:35](#msg5b7bdcdafd3c641b06eae164)I'd like `trim map` better :smile:

9214

[09:36](#msg5b7bdd191d3a5711b67888c5)Okay, how about extending `delete`?

[10:06](#msg5b7be41dc53ee54c187fe7ce)Approach with setting key to `none` for deletion is general, in a sense that you can use both path (`map/key: none`) and map with key separately (`put map key none`). All of the proposed approaches can do one or the other, but not both, and I argue that in this way they open more design questions than they aim to answer.

[10:08](#msg5b7be4accff55e56173c94d8):point\_up: this is one question. The other one is whenever `none` should be allowed as a value, and if 'yes', then how to deal with key deletion and non-existent keys?

[10:10](#msg5b7be500a491f459177cc358)As I look on the second question, both `delete` and `exists?` immediately come to mind, which currently exist solely for the purpose of `file!` manipulation.

[10:45](#msg5b7bed3fc53ee54c18801ed2)Actually, with `unset!` one can write `map/key: :abracadabra` or `map/key: ()` with `put map key :abracadabra` and `put map key ()`.

toomasv

[11:10](#msg5b7bf32c4be56c5918757087)This is quite nice.

9214

[11:11](#msg5b7bf34bcff55e56173cebf6)Nice, but dealing with `unset` explicitly is kinda... eeewww.

Oldes

[11:55](#msg5b7bfd9438a12915e4d5c34b)Why? I think that not existing key from the map returning `#[unset]` is completely fine and logical.

rebolek

[12:00](#msg5b7bfeed1d3a5711b679487b)Except it leads to an error usually.

9214

[12:07](#msg5b7c007438a12915e4d5d550)@Oldes `unset` is cumbersome to deal with. It's more of a hidden detail and design quirk than something that should be explicitly used and passed around.

[12:08](#msg5b7c00da94f8164c177bf9cc)I mean, you can use `unset` to delete keys, sure, but `unset` itself is rarely a result of meaningful evaluation. That is, you won't be able to compose key deletion with something else, e.g. `map/key:`.

[12:09](#msg5b7c00ffd8d36815e56c08fc)But you can do that with `none`, because `none` is more commonly used in that setting.

[12:11](#msg5b7c0164c53ee54c18808fff)The third question is whenever `null = none` is a valid mapping between JSON and Red world.

[12:11](#msg5b7c017094f8164c177bfcad)I'd be fine with `'null`, honestly.

rebolek

[12:59](#msg5b7c0cb894f8164c177c3f03)JSON from red-tools supports setting your own value for `null` (default is `none`), so you have control over it.

Oldes

[13:00](#msg5b7c0cd61d3a5711b6799161)I don't see it as cumersome. Actually for me its name tells it. The key is not \_set_ in the map.

greggirwin

[14:40](#msg5b7c2470f86b741b05a1d7e2)A lot of internal chat led to the wiki page, where we tried to include only the options we thought were reasonable.

\- This is a "grand scheme" question, not a JSON question  
\- You can have `none` values in objects or block types  
\- Blocks don't throw an error if you `select` a non-existent key, they return `none`  
\- `Delete` suffers the same arity problem as `remove`, but also has the (current) meaning of "delete the entire target".

The goal is to find what makes the most sense, for overall consistency and intuition. It won't be perfect, unless `map!` changes to allow it, or other funcs change to support the need to specify a key, due to its no-series nature. Assigning to remove is clever, but not intuitive.

## Monday 1st October, 2018

giesse

[09:03](#msg5bb1e2dca9be136b94dacd5a)added two more options: https://github.com/red/red/wiki/%5BNOTES%5D-Design-notes-on-removing-keys-from-MAP!-values

rebolek

[09:04](#msg5bb1e32dc08b8b3067b5cfe0)\*Turn map! into a proper series* - that sounds interesting

giesse

[09:07](#msg5bb1e3d91e23486b936ea83a)It might be more trouble than it's worth... but it might also be an elegant solution. Though perhaps in practice it's not that useful outside of `remove`... I can imagine doing clever things with `copy/part`, but clever things are rarely good things :)

rebolek

[09:53](#msg5bb1eea8ef4afc4f28000f12):)

[09:54](#msg5bb1eef0a9be136b94db1d24)Anyway, having guaranteed key order is very useful.

greggirwin

[23:06](#msg5bb2a8735af4853068480bb5)The series model change seems separate from the remove-key aspect. It opens a \*lot* of questions I don't think we can answer easily. e.g. `at` and `find` then have to change as well, assuming you want to support consistent syntax. Does `remove` then mean "remove value and key" for maps, or do you still have to use `/part`?

@dockimbel mentioned that `delete` might be used for key removal, but that needs some more thought as well. We're talking about that now.

[23:10](#msg5bb2a956600c5f64233c72e1)A new action (`remove-key`) will not be easy to add either.

[23:30](#msg5bb2ae155af4853068482acf)But a new \*refinement* (`remove/key`) is doable.

## Tuesday 2nd October, 2018

giesse

[09:10](#msg5bb3360c600c5f64233f8f6c)@greggirwin the whole problem is based on the fact that for everything else we use the series abstraction to take care of mutation consistently across a wide range of types. Hence the idea of just making it work as a series; given that we already preserve the order of keys, it seems all it would be needed would be to add a current position; which seems really weird, but then again, before REBOL the concept of current position in a vector or array may have seemed really weird.

[09:12](#msg5bb33676ef4afc4f2807ebda)I do agree that it opens up a bunch of other questions as well. I'm not sure if it's a net-positive or a net-negative, we'd need to discuss it more and play with it and so on. So it's probably not a good candidate for a short term solution. I just figured it was worth mentioning.

[09:13](#msg5bb336c1c08b8b3067bde47c)The new refinement for `remove` seems like the best choice right now... but I hope others will spend some thought on this and give more feedback. :)

greggirwin

[11:50](#msg5bb35b89271506518da5f464)Agreed. One thing Nenad noted was that if we made the series-like change, it would completely block future implementations that \*didn't* use the current model, and which couldn't support it. Hard problems.
