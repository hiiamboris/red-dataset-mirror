# Archived messages from: [gitter.im/red/CLI](/gitter.im/red/CLI/) from year: 2021

## Friday 12nd November, 2021

greggirwin

[19:27](#msg618ec01138377967f4aaa4d3)We are going to push forward with @hiiamboris' \[CLI](https://gitlab.com/hiiamboris/red-cli) work and make it standard in Red. It's quite a different approach than I used in my work for Rebol, and it took me a little time to adjust, but it's quite idiomatic and powerful. It's an important module, and will be widely used. So, first, thanks to @hiiamboris for his work and defending it when I said "I don't get it."

I'm planning to do a fresh review of it, but would like at least two other people to do so as well. He has a lot of examples to work from, but creating more is always good. On the review side, we need both high level (interface) feedback, and also at least one internal code review. Don't do the code review yet though, because CLI will be a Q1 2022 roadmap item, and HOFs will come first. Once HOFs are in Red, it's likely that CLI will use them internally. As always, though, I will press for clear and simple code.

[19:31](#msg618ec114fb3dcd4e8881ac96)I've chatted a bit with Boris about interrogative interfaces, and how I see them applying to CLI, APIs, messaging systems, and more. The idea being that you may send a request or partial command, and what you get back (in a REST-like manner) is more information about what you can do next or detailed help for command parameters. In CLIs, my canonical example is `fsUtil` on Windows. Boris' CLI has sub-command support built in, which makes organizing rich CLIs really easy.

[19:35](#msg618ec1e5a41fd206993c4a30)We're having a lot of chat on `split` right now as well, and how to evaluate designs (evidence oriented language design). For CLI the starting point is `process-into` and having more people (you) try it and provide feedback.

GalenIvanov

[21:24](#msg618edb769d20982e4f1733dc)I might try to make a CLI version of TruTiles

greggirwin

[21:31](#msg618edd2aee6c260cf775760a)That would be a great use case, given all the options it has.

[21:32](#msg618edd5cfb8ca0572b1aa3c7)@toomasv, it will also be good to pursue the idea of using it in DiaGrammar, as we discussed some time back.

## Saturday 13th November, 2021

rebolek

[07:58](#msg618f7017fb3dcd4e8882f7f8)CLI is very interesting to me, I live in console more than in GUI, so I definitely will take a deep look at it.

greggirwin

[18:17](#msg61900156d3ae402e47a70bf2):+1:

## Monday 15th November, 2021

GalenIvanov

[10:24](#msg6192354fd78911028a3bc76f)I made a \[CLI-version of TruTiles](https://github.com/GalenIvanov/Graphics-Red/blob/master/TruTiles-CLI.red)

[10:24](#msg61923564fb3dcd4e88885bc2)

```
Syntax: TruTiles-CLI [options] <rule>

Options:
                    <rule>        Type of tiling to be used - one of r3, r4, 
                                  r6, r6-3, r6-3-3, r6-4-3, r8-4, r12-3, 
                                  r12-6-4, r4-3 or r4-3a
      --size        <cell-size>   Size of the cell, between 15 and 250. 
                                  Default: 40 pixels
      --rotate      <rotation>    Rotation angle. Default: 0 degrees
      --width       <cell-line>   Line width. Default: 3 pixels
      --color       <edge-clr>    Cell edge color. Default: sky
      --bg-color    <bg-clr>      Backgraound color. Default: aqua
      --shadow                    Turn on shadow. Default: off
      --sh-color    <shadow-clr>  Shadow color. Default: black
      --sh-line     <shadow-size> Shadow line width. Default: 9 pixels
      --sh-offset   <shadow-offs> Shadow offset. Default: 0x0
      --tile-mix    <ratio>       Share of each effect in the image: Tile, 
                                  Dual, Diamond, Truchet, Diagonal. Default: 
                                  100.0.0.0.0
      --seed        <rand-seed>   Random seed. Default: 0
  -o                <output>      Output file name. Default: TruTiles.png
  -v                              Display result in a window
      --version                   Display program version and exit
  -h, --help                      Display this help text and exit
```

toomasv

[10:27](#msg61923620d78911028a3bc928):+1:

hiiamboris

[10:39](#msg619238d0a41fd206994318e0)Good job, and clever usage of tuples. Which opens up a question if we should support them as CLI argument type.

[10:43](#msg619239cf98c13e7550363870)We do not because most of the world has no idea about Red datatypes.

[10:43](#msg619239e08c019f0d0b965dd8)But if we target Reducers with our tools it starts making sense.

rebolek

[10:44](#msg61923a0c29ddcd029381e967)They should be strandartized as ISO 16711680.

hiiamboris

[10:44](#msg61923a123f09d85736733f49):D

rebolek

[10:45](#msg61923a36f2cedf67f9e5f703)ISO 3840 is taken I guess.

hiiamboris

[10:45](#msg61923a50d78911028a3bd383)These are not just random numbers?

rebolek

[10:45](#msg61923a57a41fd20699431c83)No :)

loziniak

[10:46](#msg61923a6bd3ae402e47ab69d6)https://calculator.name/baseconvert/decimal/hexadecimal/16711680

hiiamboris

[10:46](#msg61923a98f2cedf67f9e5f810)haha

GalenIvanov

[11:15](#msg6192416cd78911028a3be48d)Thanks guys! Although my test was a very basic one, I find @hiiamboris' \[CLI](https://gitlab.com/hiiamboris/red-cli) really powerful and easy to use. I hope it will be embeded into Red.

greggirwin

[19:44](#msg6192b89d98c13e7550376455)Agreed on the clever use of tuple for the mix value @GalenIvanov.

Is there any downside to supporting tuples, or any other Red type? For those who don't want conversions, just don't specify a typeset.

hiiamboris

[19:50](#msg6192ba1ed78911028a3cf935)Tuples lead to support of words, and words lead to their charsets not being defined. Then you build your program with different Red versions and may get previously accepted words to now report an error or vice versa.  
Not the end of the world but somewhat shaky ground.

greggirwin

[19:50](#msg6192ba228c019f0d0b978271)TruTiles shows how easy this can be. It leads to another piece of the puzzle, with CLI tying to app architecture, configs, and hierarchical environments.

[19:53](#msg6192bab1ee6c260cf77d2c06)@hiiamboris that's a general compatibility issue, isn't it? I also don't see how tuples tie to words. What's the dependency?

hiiamboris

[19:54](#msg6192bb0ad78911028a3cfbb4)Dependency is, we added first Red type (unknown to outsiders) into the mix, why don't we add them all. Words are next candidate simply. Used by Galen extensively, and I think I've used them myself. Or though of using instead of strings. Somewhere.

greggirwin

[20:17](#msg6192c053ee6c260cf77d3b9d)You already have `issue!` in there, which is a word type. But the compatibility issue comes down to specifications. As hard as it will be to nail those down, we need to. Because Red is data, we don't want to break it once it we do that. That's true for all types.

If we limit the types, based on the rest of the world, we lose a lot of potential value and leverage. For example, you can pass CLI args directly, but once they get larger, or may contain line breaks, can there be a standard switch to say "get the args from a file"? Why not? And if we can do that, why wouldn't we want that to be fully loadable Red?

[20:18](#msg6192c08e9d20982e4f1f0cc1)It's just that standard POSIX CLI syntax is foreign to us, requiring processing.

hiiamboris

[20:24](#msg6192c1f83f09d85736747fc4)So you're for more types support.

greggirwin

[20:24](#msg6192c1fcfb3dcd4e8889a3ac)Internally, CLI args map to a data structure of operands and options. There are some limitations in place, like options having only a single arg. Back to configs, that's what the CLI maps to, with the config being the func spec. It could also map directly to a config object. The CLI is just the last thing in the stack of environments that overrides everything else.

[20:26](#msg6192c26229ddcd02938328af)&gt; So you're for more types support.

Clearly :^) But I do want us to find the biggest problems they cause and then we can decide if they are so horrible that they must be disallowed, or if knowing about the risks is enough.

hiiamboris

[20:28](#msg6192c2e9fb8ca0572b225db7)No objects. I'm just being conservative here. Allowing later is always easier than forbidding what we previously allowed.

greggirwin

[20:29](#msg6192c30fd3ae402e47aca84f)I just checked and it looks like I started to dust off my old rebol %config-lib.r in the `split` repo, but not enough to commit it.

[20:29](#msg6192c33fcd4972068baafbe9)Agreed on extending later. Until we have serialized syntax, they're a pain. After we do, they'll just be ugly. :^)

hiiamboris

[20:35](#msg6192c47438377967f4b2b825)I would not want serialized values there at all. Especially any-functions.

## Tuesday 30th November, 2021

greggirwin

[21:41](#msg61a69a8576e3791755139100)I need to review CLI again soon, but we got a thumbs-up from Nenad to move forward with it. :+1:

## Thursday 2nd December, 2021

hiiamboris

[07:00](#msg61a86f106104ea63b6c759b3)Yoohoo.
