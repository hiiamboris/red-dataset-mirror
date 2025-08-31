# Archived messages from: [gitter.im/red/red/code](/gitter.im/red/red/code/) from year: 2018

## Thursday 10th May, 2018

meijeru

[12:48](#msg5af43fadd245fe2eb79d5d5f)I have written a function `to-local-time` which adjusts a time or date to the local timezone. See \[this gist](https://gist.github.com/meijeru/9371b91f8cf7f9a09e760db1de41dcae). If there is interest, it can go into the code repo (where exactly?).

Oldes

[14:42](#msg5af45a4de1cf621dba0c804f)Here? https://github.com/red/community/tree/master/mezz

rebolek

[15:45](#msg5af469105666c42eb6ff020a)I'm afraid of that repo.

greggirwin

[22:50](#msg5af4cccb5a1d895fae2ea4e9)@meijeru, I agree with @Oldes on the location, though I'd like to see us break things down more over time. e.g. I have libs broken out by datatype where possible.

I also side with @rebolek, and we should make an effort to care more for that repo. @maximvl did a great job of getting some content in there to prime the pump, but it needs a mission statement and direction.

## Friday 11st May, 2018

meijeru

[07:34](#msg5af5479db84be71db9faf420)I have no write access to any repo. I am happy with it going to `/mezz` if anyone with access can move it there.

Oldes

[08:18](#msg5af551dca2d95136332fd169)@meijeru You must fork the repo, make a change and send a pull request to the origin repo. And Nenad or maybe Gregg would have to approve it. That is how it works. I wonder if there is someone else than these 2 (+ qtxie ) with direct access.

greggirwin

[08:21](#msg5af5529fa2d95136332fd3af)There are a few others that can merge PRs for that repo, yes. We can open it up to more managers, but it hasn't been used much, so no discussion on that yet.

maximvl

[09:26](#msg5af561df5a1d895fae303d75)I'd love to continue putting code there but so far when I'm trying to make something I hit missing / undocumented things, there are about 5 Red programs I can't finish yet for different reasons :(

greggirwin

[17:53](#msg5af5d8b3d245fe2eb7a2c310)We're here to help. :^)

## Sunday 7th October, 2018

GiuseppeChillemi

[08:36](#msg5bb9c5a4271506518dccb0db)@maximvl could you enumerate the "stoppers" ?

## Wednesday 10th October, 2018

maximvl

[16:10](#msg5bbe248fc7bf7c3662e9eebe) @GiuseppeChillemi main one being some unobvious crashes, like this one:  
https://github.com/red/red/issues/3080  
and this: https://github.com/red/red/issues/2614

[16:12](#msg5bbe25066e5a401c2d4ac0a3)I also faced some view bugs, they might be fixed on the new builds but I'd rather wait for a new stable release :)

[16:15](#msg5bbe2593ef4afc4f284e2d9d)it's more like the feeling that I can spend few days writing something which finally will be blocked by some bug =\\

dockimbel

[18:20](#msg5bbe42dcef4afc4f284f2c2b)@maximvl Please advertise for your favorite tickets in red/bugs, as we are at a bugfixing stage before the new release.

## Saturday 24th November, 2018

greggirwin

[00:32](#msg5bf89c39f048fa1051125f43)@meijeru , https://github.com/greggirwin/red-code/blob/master/Showcase/tile-game.red doesn't work (hasn't for a while I'm guessing. Due to button size including OS metrics (e.g. you say 60x60 is what you want, but you get 62x62). Looks like I tinkered up https://gist.github.com/greggirwin/6d3c3adc9525cd759258f85be817dc45 some time ago in response. Would you review and decide what should be in the showcase repo?

meijeru

[15:37](#msg5bf97045f048fa1051175661)I like your version (which does indeed work) for its generalization, which shows some nice properties of Red and VID in particular. So this one definitely has a place in the showcases. But a simplified (non-generalized) version which only updates the adjacency test to be metric-independent would also not be amiss, because it shows very well the compactness of Red and VID.

## Sunday 25th November, 2018

greggirwin

[20:00](#msg5bfaff67ed6bcf1ef85c7ff6):+1: If you update yours, I'll look at adding mine.

meijeru

[21:19](#msg5bfb11d8ced7003fe1858800)I need to replace

```
unless find [0x60 60x0 0x-60 -60x0] face/offset - empty/offset [exit]
```

by

```
delta: absolute face/offset - empty/offset
		if delta/x + delta/y > 90 [exit]
```

that's all -- to remain as compact as possible.

[21:20](#msg5bfb122c958fc53895eba23a)You have access to `red-code`, and I don't do PRs, so please...

[21:22](#msg5bfb12b3f048fa10512135e2)I checked that this works with the newest version.

## Friday 14th December, 2018

meijeru

[09:33](#msg5c1378dab4c74555ccc6fb21)I notice @rgchris is uploading some Rebol3 code. Would be nice to see how much work it needs in order to become Red (if that is his intention...)

[10:00](#msg5c137f4ab18e825e3b28e956)On the other hand, this seems to be more in the world of Ren-C. Thus one can ask why the repository rgchris/Scripts is figuring in the Red progress site @fluxloop.

[11:58](#msg5c139b02c428e9539d3901e2)Sorry, that last addressee was @x8x rather!

greggirwin

[18:24](#msg5c13f5680a86bc6f8daa6c6b)@rgchris has ported some of his work to Red IIRC. We should certainly ask if he's OK with it, before diving in.

[18:26](#msg5c13f5e1392d8c6f8e5feef9)A lot of his stuff will take at least one core change. He uses `use` in a unique way to create contexts, which is very non-standard, and we don't have `use` in Red. It's inclusion is TBD.

rgchris

[20:12](#msg5c140e9de86b0460b39ad90d)@meijeru I'm tidying up my \[script library](https://github.com/rgchris/Scripts) there. It was originally only Rebol 3 scripts (should work against the last published community build), but seemed the right place to put my Red and other scripts. I have been tempted to make hybridized scripts (the markup parser is probably the most ambitious), but I think that most would need a dedicated rewrite—especially (as is the case with \[AltJSON](https://github.com/rgchris/Scripts/blob/master/red/altjson.red)) if a goal is to work in compiled scripts.

[20:27](#msg5c14123cc428e9539d3c4fcd)I'd certainly have no problem if someone wanted to convert any of them—most all have the Apache license. It is my intention to convert them at some point (except where there's a good chance it'll overlap with built-in functionality or the standard library).

meijeru

[21:03](#msg5c141aabb512ce0b9d8fc5fd)I have meanwhile looked a little at Ren-C and noticed that is drifting apart from Rebol/Red quite considerably. So a dedicated rewrite would indeed be necessary...

rgchris

[21:06](#msg5c141b4b039551387f9b6158)Yes—those scripts especially will need to be rewritten, but those targeting Rebol 3 Alpha (or indeed Rebol 2) should be a bit more trivial.

## Saturday 15th December, 2018

meijeru

[15:12](#msg5c1519c9ae1ab5539eee539f)I am impressed by Toomas' `thru` op. It occurred to me that this can be used in the idiom `foreach i 1 thru 15 [...]` to emulate a `for` loop. And with an additional operator `step` which is `make op! func [a b][extract a b]` one can have `foreach i 1 thru 15 step 2 [...]`. This is of course not space- and time-efficient, but for rapid prototyping it could be enough. Because of issue #3344 one cannot use words instead of numbers, but that may come.

rebolek

[15:26](#msg5c151d12b18e825e3b32f298):+1:

toomasv

[16:35](#msg5c152d46e806954a9a21d918)@meijeru Indeed! :+1:

[16:54](#msg5c1531ce539aca60b2150270)Something more convoluted:

```
step: make op! func [a [series!] b [integer!]][
    case [
        b = 0 [a] 
        b < 0 [reverse extract (last a) thru (first a) 0 - b] 
        'else [extract a b]
]]
>> foreach a 3 thru 10 step 2 [print a]
3
5
7
9
>> foreach a 3 thru 10 step -2 [print a]
4
6
8
10
>> foreach a 10 thru 3 step 2 [print a]
10
8
6
4
>> foreach a 10 thru 3 step -2 [print a]
9
7
5
3
```

greggirwin

[20:42](#msg5c156753b18e825e3b34b546)I love these kinds of experiments. :^)

[20:43](#msg5c156765539aca60b21646c3)And thanks for weighing in @rgchris.
