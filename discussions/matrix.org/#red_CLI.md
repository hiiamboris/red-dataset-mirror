# Archived messages from: https://app.gitter.im/#/room/#red_CLI:gitter.im (https://app.gitter.im/#/room/!FZXWJrOwDjCSQVVcUf:gitter.im)

## 12-Nov-2021

[19:27:14](#y2SjvW6wsF6hZXFcl53lxma5a9j3qACG0Qg8bZn_yq4) <greggirwin (Gregg Irwin)>:
We are going to push forward with @hiiamboris' [CLI](https://gitlab.com/hiiamboris/red-cli) work and make it standard in Red. It's quite a different approach than I used in my work for Rebol, and it took me a little time to adjust, but it's quite idiomatic and powerful. It's an important module, and will be widely used. So, first, thanks to @hiiamboris for his work and defending it when I said "I don't get it."

I'm planning to do a fresh review of it, but would like at least two other people to do so as well. He has a lot of examples to work from, but creating more is always good. On the review side, we need both high level (interface) feedback, and also at least one internal code review. Don't do the code review yet though, because CLI will be a Q1 2022 roadmap item, and HOFs will come first. Once HOFs are in Red, it's likely that CLI will use them internally. As always, though, I will press for clear and simple code.

[19:31:33](#yeqHyiIGGlArvyPLcuJNaVtRNaG8AdYF-48OrlbOxYM) <greggirwin (Gregg Irwin)>:
I've chatted a bit with Boris about interrogative interfaces, and how I see them applying to CLI, APIs, messaging systems, and more. The idea being that you may send a request or partial command, and what you get back (in a REST-like manner) is more information about what you can do next or detailed help for command parameters. In CLIs, my canonical example is `fsUtil` on Windows. Boris' CLI has sub-command support built in, which makes organizing rich CLIs really easy. 

[19:35:02](#n0hbTsnU20_2fB4MfFmSHZlEYOPo3X4UJ-awmrA-Wyk) <greggirwin (Gregg Irwin)>:
We're having a lot of chat on `split` right now as well, and how to evaluate designs (evidence oriented language design). For CLI the starting point is `process-into` and having more people (you) try it and provide feedback.

[21:24:07](#BmzsoCb4dFOz5xyT6VbEQnYPn3roBOI3QKu5L-YQZvM) <GalenIvanov (Galen Ivanov)>:
I might try to make a CLI version of TruTiles

[21:31:23](#6lKyakpnxLRI-cteul1jbt2-PJgLjdJBTuIcIelEkM8) <greggirwin (Gregg Irwin)>:
That would be a great use case, given all the options it has.

[21:32:12](#F8FqqgadP8fQKKvFxsX9eDE35TYKN5RqRNUCrgYtaVU) <greggirwin (Gregg Irwin)>:
@toomasv, it will also be good to pursue the idea of using it in DiaGrammar, as we discussed some time back.

## 13-Nov-2021

[7:58:16](#GQv8FbBNf5LBHtAA9zlCPfyD-pu4cVhX1YJWr89ueEc) <rebolek (Boleslav BÅ™ezovskÃ½)>:
CLI is very interesting to me, I live in console more than in GUI, so I definitely will take a deep look at it.

[18:17:58](#D_3xudeFp0_QdXu1FrcAhLuUkTVsS5PGOrh5qvQndQ4) <greggirwin (Gregg Irwin)>:
:+1:

## 15-Nov-2021

[10:24:16](#SabWo66uf4x6RDukhZ9ezkD46-l87gx9ESleizMnQn4) <GalenIvanov (Galen Ivanov)>:
I made a [CLI-version of TruTiles](https://github.com/GalenIvanov/Graphics-Red/blob/master/TruTiles-CLI.red) 

[10:24:37](#-NSl8-wqH4wtfY0Z8yk5B6gwVlfoDul23RvTkFg9tdk) <GalenIvanov (Galen Ivanov)>:
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

[10:27:44](#YoBQwawBwE_vC6jP_VnvYJhAv4_GHy3Wj2Atds8M2Dg) <toomasv>:
:+1:

[10:39:12](#q8jNdRIu6nqTE2dmAYID0orIsXTULUEx6EzYXNPLsLE) <hiiamboris (NOT THIS ONE)>:
Good job, and clever usage of tuples. Which opens up a question if we should support as CLI argument type.

[10:41:51](#p1z1-yOLSt3Ni7L8K2TkMjjjxPSHi71Jpz5eDCLF_xQ) <hiiamboris (NOT THIS ONE)>:
* Good job, and clever usage of tuples. Which opens up a question if we should support them as CLI argument type.

[10:43:28](#ySfIeqP5kS_O62h_OcTQbR4SSwedJPCVFMK_x2rJjX4) <hiiamboris (NOT THIS ONE)>:
We do not because most of the world has no idea about Red datatypes.

[10:43:44](#FLGMFJqi0Rj_4wQKp2AAsjGWmqkGLm4zVeX4IdjMISw) <hiiamboris (NOT THIS ONE)>:
But if we target Reducers with our tools it starts making sense.

[10:44:28](#uvFo9f4rAO5B5yPbUB6BXQcpeKBKbMu5BGdah4RPFS4) <rebolek (Boleslav BÅ™ezovskÃ½)>:
They should be strandartized as ISO 16711680.

[10:44:34](#_bggn6h6M4q1szX9Fo_D66TyZvdSZrsOkm7YBizSryg) <hiiamboris (NOT THIS ONE)>:
í ½í¸ƒ

[10:45:11](#X3FTHfUahs7ZrHPOa9lmz4t_wuUNqNGU7LEmWl0K71I) <rebolek (Boleslav BÅ™ezovskÃ½)>:
ISO 3840 is taken I guess.

[10:45:37](#oO-UiNDRjr-6kFzVv1sic6BIFA20Wtov6vxMg5utZtc) <hiiamboris (NOT THIS ONE)>:
These are not just random numbers? 

[10:45:43](#5fPzju1Pjt46U71YGT3BQRknOXt2nh4Ds8efUpGnbHQ) <rebolek (Boleslav BÅ™ezovskÃ½)>:
No :)

[10:46:03](#QpV4IL7sl2keoB8kQWAPktNHp-OFDGSmyX9deTMoQgU) <loziniak (Maciej ÅoziÅ„ski)>:
https://calculator.name/baseconvert/decimal/hexadecimal/16711680

[10:46:48](#7VAY7g2M91g-aF_TyItjVgJh6dehMTK4OJoSZykz3VY) <hiiamboris (NOT THIS ONE)>:
haha

[11:15:56](#2u_VjkJg26_fkscDpDUPriWpXfcUFSNpR6lm40H3O9M) <GalenIvanov (Galen Ivanov)>:
Thanks guys! Although my test was a very basic one, I find @hiiamboris' [CLI](https://gitlab.com/hiiamboris/red-cli) really powerful and easy to use. I hope it will be embeded into Red.

[19:44:30](#XU_55ep9ClD5iBidR9gxgHbmIYyeiy0IFDZCzLkod2I) <greggirwin (Gregg Irwin)>:
Agreed on the clever use of tuple for the mix value @GalenIvanov. 

Is there any downside to supporting tuples, or any other Red type? For those who don't want conversions, just don't specify a typeset.

[19:50:54](#g7FZdy-4uaTt-ZRCRmfG2m9vUdnXP9QjZ5Af6YeU64o) <hiiamboris (NOT THIS ONE)>:
Tuples lead to support of words, and words lead to their charsets not being defined. Then you build your program with different Red versions and may get previously accepted words to now report an error or vice versa. 

[19:50:59](#PSMqQkdpOIpVk6tZh8gs2VewVOX2w-u4cChh1JoPLng) <greggirwin (Gregg Irwin)>:
TruTiles shows how easy this can be. It leads to another piece of the puzzle, with CLI tying to app architecture, configs, and hierarchical environments.

[19:52:31](#4XbPGo03UnJUZvy-gAbErzLGfnSKjcNpRvk_mPUmbo8) <hiiamboris (NOT THIS ONE)>:
* Tuples lead to support of words, and words lead to their charsets not being defined. Then you build your program with different Red versions and may get previously accepted words to now report an error or vice versa. 
Not the end of the world but somewhat shaky ground.

[19:53:22](#NiH8Y7iolZpvu9IJ2HNeuOENuqyA2-grFS5qQvU-6TY) <greggirwin (Gregg Irwin)>:
@hiiamboris that's a general compatibility issue, isn't it? I also don't see how tuples tie to words. What's the dependency?

[19:54:50](#K0BYgnJ4zxj-2SfarHgmmo4z9MKJIsSl_z6IqaV_FUY) <hiiamboris (NOT THIS ONE)>:
Dependency is, we added first Red type (unknown to outsiders) into the mix, why don't we add them all. Words are next candidate simply. Used by Galen extensively, and I think I've used them myself.

[19:55:16](#HN96qI9RMoLcs07FNPxk6Vms83wqdgf-WLZnPD5zoqw) <hiiamboris (NOT THIS ONE)>:
* Dependency is, we added first Red type (unknown to outsiders) into the mix, why don't we add them all. Words are next candidate simply. Used by Galen extensively, and I think I've used them myself. Or though of using instead of strings.

[19:55:22](#ECUkHcIk45St0Ysb_nIPtHCSKtO8rVuRmSZH7xeGbac) <hiiamboris (NOT THIS ONE)>:
* Dependency is, we added first Red type (unknown to outsiders) into the mix, why don't we add them all. Words are next candidate simply. Used by Galen extensively, and I think I've used them myself. Or though of using instead of strings. Somewhere.

[20:17:23](#mj6zlTDt6kdG8btOmGU4OWua1DlL9q3CP9zYUisn1fE) <greggirwin (Gregg Irwin)>:
You already have `issue!` in there, which is a word type. But the compatibility issue comes down to specifications. As hard as it will be to nail those down, we need to. Because Red is data, we don't want to break it once it we do that. That's true for all types.

If we limit the types, based on the rest of the world, we lose a lot of potential value and leverage. For example, you can pass CLI args directly, but once they get larger, or may contain line breaks, can there be a standard switch to say "get the args from a file"? Why not? And if we can do that, why wouldn't we want that to be fully loadable Red?

[20:18:22](#VVfdKFQ4CMu4tUL2iWFNlD1frmHChOnKOOvZ2v42DaI) <greggirwin (Gregg Irwin)>:
It's just that standard POSIX CLI syntax is foreign to us, requiring processing.

[20:24:24](#c-2YVXNnLzJnaz4LeWDmzaRHKLzeHvFlWTeVNUcH_JA) <hiiamboris (NOT THIS ONE)>:
So you're for more types support.

[20:24:28](#YDDBOEdfaJYH3BWl8k2pXvdzdkUDD0Gl4QusTlqsNlQ) <greggirwin (Gregg Irwin)>:
Internally, CLI args map to a data structure of operands and options. There are some limitations in place, like options having only a single arg. Back to configs, that's what the CLI maps to, with the config being the func spec. It could also map directly to a config object. The CLI is just the last thing in the stack of environments that overrides everything else.

[20:26:11](#fZTqrGGfB11E_x3wFrTxAXTDidhW5ME6z_MwQrNwo6g) <greggirwin (Gregg Irwin)>:
> So you're for more types support.

Clearly :^) But I do want us to find the biggest problems they cause and then we can decide if they are so horrible that they must be disallowed, or if knowing about the risks is enough.

[20:28:26](#6fue53MqD3YOYzi_Xho0JnDY2sR_N0Tp5sFXNxeh0fM) <hiiamboris (NOT THIS ONE)>:
No objects. I'm just being conservative here. Allowing later is always easier than forbidding what we previously allowed.

[20:29:03](#UwompKwkzOvGZxPsEgC-_iWRIGg6VtgyfkOLbuRLxDs) <greggirwin (Gregg Irwin)>:
I just checked and it looks like I started to dust off my old rebol %config-lib.r in the `split` repo, but not enough to commit it.

[20:29:51](#GQI5wQ05B5teEziruWnI-o7EfzE7gNRmjQ_KiFQY-PA) <greggirwin (Gregg Irwin)>:
Agreed on extending later. Until we have serialized syntax, they're a pain. After we do, they'll just be ugly. :^)

[20:35:00](#nDQJbb8yytp9bvO0yIZqt6yd6Z4CX4zdxoVtHPYZ92U) <hiiamboris (NOT THIS ONE)>:
I would not want serialized values there at all. Especially any-functions.

## 30-Nov-2021

[21:41:27](#d0LU65T_F6gkZ8obajhDf122B7gWnoXxPkJGGmenVTg) <greggirwin (Gregg Irwin)>:
I need to review CLI again soon, but we got a thumbs-up from Nenad to move forward with it. :+1:

## 2-Dec-2021

[7:00:33](#IbwNSMYYBqrF01y_0CLaF9iPhiPfRVgcsQOuR672PVQ) <hiiamboris (NOT THIS ONE)>:
Yoohoo.

## 28-Feb-2022

[5:14:32](#LZtdQ9D3YN8tV8uTUGWU3UwqgYq_Ahh891eDGoImTyw) <cosacam1 (cosacam1)>:
Hi, I'm new here in gitter. RED is a great lang. I'm a REBOL/RED fan though I've used them not much (lack of time). However, I've been working recently. I'm creating a face (so to call it) which is actually a scrollable list of checks and multiline texts. However, my red.exe has stopped working. I use REEDITOR-11 and it still compiles ok (so slowly!) but it can't interpret because red.exe is broken. I can't use the console any more for the same reason (actually the GUI console is red.exe). It opens and close inmediatly. I've been googling but all I find is same problem with cmd for many users. But cmd works fine in my laptop. Only red.exe doesn't. Any suggestions? Thanks.


[10:27:47](#_SSVMI5XMsaUaYsOzB1FQxi2dUVEnWevSZ-s76cCDv8) <hiiamboris (NOT THIS ONE)>:
wrong room, you should ask in https://gitter.im/red/help

[10:28:29](#HZU105nlAaSAezs_HN3kN8mkk_lKypLV2qE1jVRXODc) <hiiamboris (NOT THIS ONE)>:
also mention versions of working and broken consoles

[11:27:23](#O8IU_LAoBs_Zp9S4US6tNOA9hZglyI9y_VTD3pEIFcQ) <hiiamboris (NOT THIS ONE)>:
and see if https://github.com/red/red/issues/5073 is relevant to you

## 1-Mar-2022

[2:01:43](#lUfhvCoIqYONcGVPpYnu-rFw6FiW53UBTaxRG861-e8) <cosacam1 (cosacam1)>:
thanks hiiamboris, I'll take a look to that link

[2:06:22](#GlxezfLtGZESbQ2SqBCA-uu6Qsg150iQgCOsr8XWta0) <cosacam1 (cosacam1)>:
actually I have several of red.exe s (one downloaded with red from github, other came with REDEDITOR-11 and other with RIDE) None of them work now. It happened some time ago with my computer at job which I finally changed for anotherone for different reasons. Now it happens in my HP laptop at home, running W10. Ok, let's see first your link. Thanks again

[2:30:38](#qzTDFGzbZKvOywZngr8ZyGdKf0FkOH4MFhHcQNNG1F8) <cosacam1 (cosacam1)>:
sorry I'm still here. I've just used rebol to compile gui-console. This is the ouput -=== Red Compiler 0.6.4 ===-

Compiling F:\red\red\environment\console\GUI\gui-console.red ...
...compilation time : 6252 ms

Target: Windows

Compiling to native code...
...compilation time : 127928 ms
...linking time     : 3389 ms
...output file size : 1226752 bytes
...output file      : F:\red\red\gui-console.exe

== none

[2:31:53](#ZLUA2XV33YpQxQVi3jdcahLCqPR1BzIvMTAxYXd3nKU) <cosacam1 (cosacam1)>:
gui-console.exe is certainly in the folder but IT DOES ANSOLUTELY NOTHING not even a blink

