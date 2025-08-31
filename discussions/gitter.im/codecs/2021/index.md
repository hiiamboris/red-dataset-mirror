# Archived messages from: [gitter.im/red/codecs](/gitter.im/red/codecs/) from year: 2021

## Tuesday 19th January, 2021

greggirwin

[17:44](#msg60071a846244ee14509bd753)New room for codec related chat.

[17:47](#msg60071b356244ee14509bd95f)We have some related wiki pages as well, for archiving things that come up here.

\- \[General](https://github.com/red/red/wiki/%5BHOWTO%5D-SYSTEM-CODECS,-LOAD-AS-and-SAVE-AS)  
\- \[JSON](https://github.com/red/red/wiki/JSON-codec)  
\- \[CSV](https://github.com/red/red/wiki/CSV-codec)

[17:56](#msg60071d34753011449b02e820)@GiuseppeChillemi started a conversation \[here](https://gitter.im/red/chit-chat?at=6003a0b7d5f4bf2965ef53bc) having loaded an 80M JSON file. I did some tests and posted results and some analysis \[here](https://gitter.im/red/red?at=600661c0cf8b8277343d15d2). Overnight @hiiamboris dove into the code and produced https://github.com/red/red/pull/4804.

This is the power of Red, and why a full stack language is empowering. Without having to resort to C or external libraries, Reducers can combine high level features and low level optimizations.

[17:57](#msg60071d9c753011449b02e908)Once @rebolek, who authored the JSON codec based on old R2 code, signs off on the PR we'll get it merged. What would be great, then, is to look for other JSON loader benchmarks and see how Red stacks up both in performance and code size.

hiiamboris

[18:04](#msg60071f403855dd07fd6570ee)I also recall Bolek working on it. However it says `Author: "Gabriele Santilli"` in the header ;)

GiuseppeChillemi

[18:08](#msg600720268816425540d8adf1)Do we have other JSON codecs?

greggirwin

[18:17](#msg6007222436db01248a8b3861)@rebolek should be in there as an author.

@GiuseppeChillemi with luck we won't need others, but a full R/S version is possible of course. And if someone wanted a different output format, they could do that. Ideally a single version covers almost every need, so we don't end up with a sprawl of competing libraries in the Red ecosystem.

[18:18](#msg6007225ccae490555f550e39)Oooh, or maybe I'm misremembering. Maybe @giesse did do JSON and Bolek did CSV.

[18:18](#msg6007227636db01248a8b393b)My brain melts a lot these days. :^\\

[18:19](#msg6007229d2cb18a437c2b126a)@giesse apologies for not remembering. Please also weigh in on the PR if you want.

giesse

[18:36](#msg600726b13855dd07fd6589d9)I did JSON, but based on your own code @greggirwin :) I only rewrote `to-json` because of a number of issues, `load-json` is mostly the original code.

GiuseppeChillemi

[18:43](#msg60072852ac653a0802cba6cb)@greggirwin you have talked about other json codes, so I have asked about them.

hiiamboris

[18:44](#msg600728a3753011449b030c84):D

greggirwin

[18:45](#msg600728d2ac653a0802cba817)Thanks @giesse. I will take blame but not too much credit. :^) Romano did the original. I've just been the maintainer for 15 years or so.

@GiuseppeChillemi yes. I'm thrilled that we could get such a speed increase without having to do R/S for the entire thing.

GiuseppeChillemi

[18:49](#msg6007299d3855dd07fd659190)@giesse have your changes been included in Red or there are still those issues?

giesse

[19:05](#msg60072d776b20cf7730c51a46)@hiiamboris if you are interested the whole history of the changes I made is in https://github.com/giesse/red-json/commits/compiler

[19:05](#msg60072d90410c2214400cf699)@GiuseppeChillemi the codec was included after my changes

hiiamboris

[19:13](#msg60072f5ed8bdab4739478d5c)@giesse curiosity.. why did you try to change to non-recursive version and why changed it back later?

greggirwin

[21:48](#msg60075398cae490555f5593d8)New JSON codec update merged. Here are some results:

```
change-dir to-red-file "C:\dev\giesse\red-json\tests\data"
big-100k: [load %really-big-1.json]
big-700k: [load %really-big-2.json]
big-2.5m: [load %really-big-3.json]
canada-5m: [load %canada.json]
twitter-600k: [load %twitter.json]

profile/show [canada-5m twitter-600k big-100k big-700k big-2.5m]
```

```
; Original codec
Time         | Time (Per)   | Memory      | Code
0:00:00.09   | 0:00:00.09   | 1486144     | big-100k
0:00:00.378  | 0:00:00.378  | 12368428    | twitter-600k
0:00:00.523  | 0:00:00.523  | 8389480     | big-700k
0:00:00.938  | 0:00:00.938  | 46031464    | canada-5m
0:00:01.994  | 0:00:01.994  | 32086040    | big-2.5m

; Updated codec
Time         | Time (Per)   | Memory      | Code
0:00:00.036  | 0:00:00.036  | 1486644     | big-100k
0:00:00.206  | 0:00:00.206  | 8389480     | big-700k
0:00:00.783  | 0:00:00.783  | 32086040    | big-2.5m
0:00:00.992  | 0:00:00.992  | 46031464    | canada-5m
```

[21:48](#msg600753b9cae490555f559409)Note that %twitter.json isn't tested with the new code. It crashes the new codec.

[21:52](#msg6007549336db01248a8bc942)The Chrome bookmark file that started all this also crashes it, so no speed comparison there yet.

[21:58](#msg6007560a3855dd07fd6607a7)Even a tiny Chrome bookmark file crashes it, so it's not size. @hiiamboris this crashes it:

```
{
   "checksum": "1e54fbb25d92a354f7aeaf576726429e",
   "roots": {
      "bookmark_bar": {
         "children": [  ],
         "date_added": "13250024635730629",
         "date_modified": "13250024643208696",
         "guid": "00000000-0000-4000-a000-000000000002",
         "id": "1",
         "name": "Bookmarks bar",
         "type": "folder"
      },
      "other": {
         "children": [  ],
         "date_added": "13250024635730662",
         "date_modified": "0",
         "guid": "00000000-0000-4000-a000-000000000003",
         "id": "2",
         "name": "Other bookmarks",
         "type": "folder"
      },
      "synced": {
         "children": [  ],
         "date_added": "13250024635730666",
         "date_modified": "0",
         "guid": "00000000-0000-4000-a000-000000000004",
         "id": "3",
         "name": "Mobile bookmarks",
         "type": "folder"
      }
   },
   "version": 1
}
```

[22:10](#msg600758c9d8bdab473947fe66)OK, all it takes is this:

```
s: {{
   "checksum": "1e54fbb25d92a354f7aeaf576726429e"
}}
j: load/as s 'json
```

Which loads fine in the old codec. Let's make sure we have a regression test for this once we know the cause.

[22:14](#msg600759d52cb18a437c2bb196)&lt;he he&gt; Seems to only happen because the string is 32 chars long. Happens at 16 chars s well.

[22:16](#msg60075a47a2354e44ac95567b)But not 4 or 8. Happens again at 64 chars.

hiiamboris

[22:29](#msg60075d5897132e2480ef4c1e)interesting

greggirwin

[22:43](#msg6007608997132e2480ef53a9)This is excerpted from the twitter file, and also crashes it:

```
{
    "location": "関西    ↓詳しいプロ↓"
}
s: read-clip  j: load/as s 'json
```

But that's technically malformed JSON, as they should be `\uXXXX` format chars.

[22:47](#msg6007617136db01248a8bed18)Sorry, JSON allows that form as well. `\u` escapes are just an alternative.

## Wednesday 20th January, 2021

rebolek

[07:43](#msg6007df07410c2214400ea7d5)@greggirwin No, I did just CSV, JSON is @giesse 's work. I just reported some problems, that's all.

[07:43](#msg6007df1bdfdbc1437f9df190)I did separate JSON codec that's not used in Red.

giesse

[09:55](#msg6007fdfca2354e44ac96e03f)&gt; @giesse curiosity.. why did you try to change to non-recursive version and why changed it back later?

The interpreter had a very small recursion limit and `to-json` just failed all tests. Eventually @dockimbel fixed it so I went back to an easier to read recursive version.

[10:12](#msg60080208cae490555f57353f)https://github.com/red/red/issues/3524

[10:13](#msg6008024197132e2480f0d65e)"Just pushed a non-recursive version of `to-json`. It is up to 2x slower on very small data (eg. `to-json none`), however, it is up to 2x faster on bigger data (like some of the files in the test suite).  
I'm about to run more tests, as well as add `/pretty` and `/ascii` refinements to `to-json`."

[10:13](#msg6008026136db01248a8d77fa)I think I had other performance notes somewhere but I haven't found them.

hiiamboris

[10:26](#msg60080547cf8b827734414b70)I see, thanks

greggirwin

[18:40](#msg60087917a2354e44ac983b2a)@hiiamboris any clues on the crash?

hiiamboris

[19:07](#msg60087f6e6b20cf7730c88c8a)https://github.com/red/red/pull/4805

greggirwin

[19:13](#msg600880d3a2354e44ac985153):+1: Thanks.

## Thursday 21st January, 2021

greggirwin

[18:54](#msg6009cdf0753011449b0a1c3c)Thanks to @hiiamboris, with support from @qtxie and @dockimbel, the JSON crash is fixed, and some R/S string code is improved. Thanks all!

[19:04](#msg6009d0458816425540dfd45f)Here are the results from the old and new codec, for the Chrome bookmarks file test I did:

```
; Original
Time         | Time (Per)   | Memory      | Code
0:00:00.001  | 0:00:00.001  | 12288       | [load/as bf-nano 'json]  ; ~1K
0:00:00.714  | 0:00:00.714  | 24276068    | [load/as bf-sm 'json] ; ~1.5M
0:00:02.439  | 0:00:02.439  | 118880976   | [load/as bf-lg-no-meta 'json] ; ~5M
0:00:05.148  | 0:00:05.148  | 173835384   | [load/as bf-lg 'json] ; `10M

; New 
Count: 1
Time         | Time (Per)   | Memory      | Code
0:00:00      | 0:00:00      | 12288       | [load/as bf-nano 'json]
0:00:00.157  | 0:00:00.157  | 24274472    | [load/as bf-sm 'json]
0:00:00.954  | 0:00:00.954  | 118866608   | [load/as bf-lg-no-meta 'json]
0:00:01.091  | 0:00:01.091  | 173821016   | [load/as bf-lg 'json]
```

@GiuseppeChillemi would you use a new build of Red and test on your 80M file, to see how much faster it is for you?

GiuseppeChillemi

[19:25](#msg6009d5356b20cf7730cc526c)@greggirwin I'll do!

[21:50](#msg6009f70d6b20cf7730ccb963)@greggirwin This is the result of my spartan `profile`

```
>> probe now b: load/as %prj-bookmarks/bookmarks 'json probe now
21-Jan-2021/22:45:30+01:00
21-Jan-2021/22:45:46+01:00
```

16 Seconds in place of 80: \*\*5x\** faster! Congratulations to everyone!

[21:53](#msg6009f7c26b20cf7730ccbacf)`Red 0.6.4 for Windows built 21-Jan-2021/13:10:58+01:00 commit #e0bb1d5`

greggirwin

[21:53](#msg6009f7cda2354e44ac9c58d1)Nice speedup indeed.

Is there anyone who uses other JSON libs or tools that would like to start a wiki page for comparisons?

[21:53](#msg6009f7f0410c221440148bd7)Even just finding and posting test data and benchmarks that we can run against Red.

[21:57](#msg6009f8d23855dd07fd6d28a7)Rather, we could add that info to the JSON codec page.

GiuseppeChillemi

[21:58](#msg6009f9202cb18a437c32da39)@greggirwin But performance drops on subsequent runs. I suppose we suffer from garbage collector kicking in:

2nd run:

```
>> probe now b: load/as %prj-bookmarks/bookmarks 'json probe now
21-Jan-2021/22:54:18+01:00
21-Jan-2021/22:54:40+01:00
```

22 Secs

3rd run:

```
>> probe now b: load/as %prj-bookmarks/bookmarks 'json probe now
21-Jan-2021/22:54:50+01:00
21-Jan-2021/22:55:20+01:00
```

30 Secs

4th run:

```
>> probe now b: load/as %prj-bookmarks/bookmarks 'json probe now
21-Jan-2021/22:55:28+01:00
21-Jan-2021/22:55:59+01:00
```

31 Secs

[22:02](#msg6009f9dc410c2214401490e4)From 4th on, all are at 31 secs. It seems it reaches an equilibrium.

greggirwin

[22:03](#msg6009fa1cd8bdab47394f31af)That's interesting too. I don't see any increase with my smaller test files (up to 10M). Could very well be GC I suppose.

Oldes

[22:10](#msg6009fbd73855dd07fd6d31de)@GiuseppeChillemi maybe it's good time when you should learn `dt` as `delta-time` function:

```
>> dt [wait 0:0:0.11]
== 0:00:00.11713
```

GiuseppeChillemi

[22:18](#msg6009fdd3753011449b0aa459)\*\*Old Version:\**

1st run

```
>> probe now b: load/as %prj-bookmarks/bookmarks 'json probe now
21-Jan-2021/23:02:43+01:00
21-Jan-2021/23:04:03+01:00
```

80 Secs

2nd run

```
>> probe now b: load/as %prj-bookmarks/bookmarks 'json probe now
21-Jan-2021/23:04:13+01:00
21-Jan-2021/23:05:38+01:00
```

85 secs

3rd run

```
>> probe now b: load/as %prj-bookmarks/bookmarks 'json probe now
21-Jan-2021/23:05:43+01:00
21-Jan-2021/23:07:15+01:00
```

92 secs

4th run

```
>> probe now b: load/as %prj-bookmarks/bookmarks 'json probe now
21-Jan-2021/23:07:42+01:00
21-Jan-2021/23:09:17+01:00
```

95 secs

5th run

```
>> probe now b: load/as %prj-bookmarks/bookmarks 'json probe now
21-Jan-2021/23:15:23+01:00
21-Jan-2021/23:16:58+01:00
```

95 secs

Again, the internal structures have stabilized.

[22:20](#msg6009fe3ad8bdab47394f3ce7)@Oldes We are men here, we do all the time diffs using our own internal computation units!

[22:21](#msg6009fe672cb18a437c32e9f8)(Thank you, I will learn `delta-time`)

greggirwin

[22:22](#msg6009fe9b410c221440149d87)I still own an abacus, though I haven't used it in so long I imagine I've forgotten how.

GiuseppeChillemi

[22:30](#msg600a00812cb18a437c32ef4c):D

[22:50](#msg600a051897132e2480f685ab)@Oldes  
Yes, it is simpler:

```
>> loop 5 [probe dt [b: load/as %prj-bookmarks/bookmarks 'json]]
0:00:17.1552
0:00:22.8579
0:00:32.3664
0:00:32.0836
0:00:31.8588
```

Oldes

[22:53](#msg600a05e23855dd07fd6d4eee)It looks like a GC issue... new allocations but no releases.

GaryMiller

[23:01](#msg600a07d02cb18a437c3303c0)You could run the garbage collector manually between runs to test that theory out.

## Friday 22nd January, 2021

GiuseppeChillemi

[06:10](#msg600a6c71ac653a0802d480d0)@GaryMiller how do I run it?

greggirwin

[07:14](#msg600a7b3a753011449b0bce6a)@GiuseppeChillemi see `recycle`.

GiuseppeChillemi

[10:33](#msg600aa9f46b20cf7730ce7251)Yes, it is the garbage collector:

With

```
>> loop 5 [probe dt [b: load/as %prj-bookmarks/bookmarks 'json]]
0:00:18.7711
0:00:28.5016
0:00:41.1943
0:00:43.6485
0:00:42.7504
== 0:00:42.7504
```

Without

```
>> recycle/off loop 5 [probe dt [b: load/as %prj-bookmarks/bookmarks 'json] recycle]
0:00:18.7421
0:00:18.4631
0:00:18.3451
0:00:18.306
0:00:18.3311
```

pekr

[11:55](#msg600abd19a2354e44ac9e53f3)Oh, quite big penalty, isn't it?

GiuseppeChillemi

[14:03](#msg600adb392cb18a437c351c36)Yes, it seems it is triggering during processing and taking more than the main code.

[14:11](#msg600adcf497132e2480f8ab6f)Well, it needs sone fine tuning on the parameters or a change of logic. The word goes to the experts.

hiiamboris

[14:30](#msg600ae1706b20cf7730cf0a49)What tuning? 80 MB of json is a \*lot* of Red values. Just how big is your bookmark file when it's loaded?

GiuseppeChillemi

[15:34](#msg600af06bdfdbc1437fa6511f)I don't know the logic that drives the garbage collector and what triggers it but the trigger could be a memory threshold that could be too tight.

hiiamboris

[15:37](#msg600af129cae490555f5f27fd)TIP: you can use `profile` to see how much memory your file occupies

greggirwin

[17:37](#msg600b0d57753011449b0d6037)The current GC is, like simple I/O, a starting point. @dockimbel has said it's not the final version. But it's also a huge task so not a high priority. With the ability to disable it temporarily, which few GC langs have, you still have some control. e.g. you can disable it temporarily, do your processing, then `recycle` manually when your app can breathe a bit.

GiuseppeChillemi

[19:10](#msg600b230dcf8b82773449c3f9)I know this, in fact I do not complain about GC, I am thankful we have it. I am just curious about the causes that let it take half of the processing time. I will look at its code to try to understand how it works.

## Saturday 23th January, 2021

GiuseppeChillemi

[17:16](#msg600c59f8dfdbc1437fa9a9bf)@greggirwin Is this the \[profile](https://gist.github.com/giesse/1232d7f71a15a3a8417ec6f091398811) function are you referring to?

hiiamboris

[17:34](#msg600c5e3ea2354e44aca24fe9)yes

BuilderGuy1

[23:04](#msg600cab8cdfdbc1437faa6d2f)Is the CSV functionality rolled in to the nightly builds yet?

hiiamboris

[23:11](#msg600cad168816425540e7084f)about 1.5 years ago: https://github.com/red/red/search?q=csv&amp;type=commits

BuilderGuy1

[23:20](#msg600caf3bcae490555f6369ce)Ok. Has there been any new additions to that with the new codecs or is that just JSON?

greggirwin

[23:24](#msg600cb01cd8bdab473955f36d)CSV and JSON are separate codecs. JSON has been around for quite a while as well though.

BuilderGuy1

[23:29](#msg600cb177ac653a0802da30ef)Ok. I misinterpreted the new channel as an announcement I guess. Thanks!

greggirwin

[23:33](#msg600cb248004fab47415ee377)We just didn't have a channel for codecs yet, but decided it would help.

## Sunday 24th January, 2021

pekr

[06:52](#msg600d192cdfdbc1437fab54a3)Will XML codec come too? I do vaguely remember something coming for 1.0 release?

rebolek

[06:54](#msg600d19b6ac653a0802db15da)It will but I think there's not yet an agreement how XML should be represented in Red.

greggirwin

[18:57](#msg600dc321dfdbc1437facea7e)@pekr yes. It raises a number of questions, hence the delay. Ironically, the codec won't be hard, and we could even work up the parser now, knowing that the output structure isn't finalized. It's also possible that the internal loader could be flexible like CSV, allowing more than one format to be returned based on refinements. The issue with XML is how to represent attributes, for which there is no right answer, just choices.

GiuseppeChillemi

[20:03](#msg600dd2948816425540e9ae78)@greggirwin is the discussion public, so I can read and understand?

hiiamboris

[20:05](#msg600dd2f6a2354e44aca5af33)xml has attributes and elements `value`

[20:08](#msg600dd3aa410c2214401de84d)I think question is how to at the same time:  
\- losslessly load/save this mess  
\- map both attributes and elements to words, so one doesn't have to look in both maps every time

(which is kinda impossible and requires tradeoffs)

[20:11](#msg600dd47fac653a0802dcde7c)I would probably just reserve a name that's invalid for xml, e.g. `!attributes` and set it to a list of words that \*are attributes\*.

zentrog:matrix.org

[20:49](#msg600ddd42004fab47416190e6)I don’t think a map could be used for elements (at least if going for lossless) since an element name can repeat, and the repeats don’t need to be contiguous. In some cases it would be nice to collect all the elements with the same name into a list, but sometimes that doesn’t make any sense. For example, the Apple plist format

[20:49](#msg600ddd6a410c2214401e0121)I like the !attributes suggestion

greggirwin

[22:55](#msg600dfac5004fab474161d41e)@GiuseppeChillemi some may be in https://gitter.im/red/HOF

Good, concise summary @hiiamboris. Even W3Cschools.com says:

&gt; There are no rules about when to use attributes or when to use elements in XML.

I think we need to use a block as the output, no matter what. As @dander points out, elements can exist more than once. That raises another possible output option though. Repeated elements can be kept as they are found, or collected into a sub-block. This is now the public design chat. :^) Where this matters ties to HOF design as well, in how it navigates structures, and what we expect them to be for common cases like XML and DOMs.

What we \*can* do, and probably came up in chat about it, is use a `map!` for attributes, which can't have repeating elements or deeper structures. We can also name it of course, but if each element is a block, the only time you have a `map!` is if there are attributes for it, and it's always the first value in the block. Don't get clever beyond that. If we name it, e.g. as @hiiamboris suggests, then each element is also a well-formed key-value block.

[23:00](#msg600dfc1b753011449b143616)Now I need to find my notes, because things like XPath and XQuery also came up when thinking about it.

[23:01](#msg600dfc5697132e2480002589)Found them. Whew!

hiiamboris

[23:04](#msg600dfcfb6b20cf7730d66aa2)Value vs block-of-values is a good enough polymorphism I think. Not in the least since it can catch you on your assumptions, e.g. you access something as a value but get a block and likely receive an error, and fix your code. And when everything is as expected, it simplifies access to this structure. We load it so we wanna work with it.

[23:08](#msg600dfdef3855dd07fd76e6df)Although, when you know something is a list, but this list for some reason becomes 1 item long, it gets turned into a value, and that's extra work to handle such a case...

[23:08](#msg600dfe09ac653a0802dd3c3d)Stupid format.

greggirwin

[23:11](#msg600dfea0d8bdab473958efe1)Maybe we should collect some small XML examples, or even just one, that show each way you can express things, so we can see attr vs elements vs repeated elements that don't each need their own key.

We'll never make everyone happy.

hiiamboris

[23:13](#msg600dff22410c2214401e514d)Another idea: `[name "value" name "value" unique-name "value"]` so you can still use path access when addressing a unique element (without constant `/1/` clutter), but with a dedicated mezz can collect every `name`'s value.

[23:14](#msg600dff68cae490555f665f53)Could be a good extension for `extract` btw: extract by key.

## Monday 25th January, 2021

pekr

[06:44](#msg600e68d4ac653a0802de2ff9)As for me, I prefer the one structure, sequenced. Not only can attributes and elements repeat, they also come in a nested structures. We should also remember the parsing aspects - e.g. I remember Doc considering a streamed XML version. IIRC, initial Postgress driver used parse everything, then provide output, later on was rewritten to parse as you go? Simply put - we should not require loading the whole XML file into memory first, but allow continuous parsing, if possible ....

Oldes

[10:37](#msg600e9f6b97132e248001aa98)I was extensively using XML parsing using code based on this Rebol2 script: http://www.rebol.org/view-script.r?script=xml-parse.r

hiiamboris

[11:11](#msg600ea75a36db01248a9e2e4e)@Oldes I wonder how do you `find` or directly refer to something in a `[name attr [..children..] uri]` tree. By writing a tree traversal mezz.. and using callbacks?

Oldes

[11:14](#msg600ea8256b20cf7730d7f8aa)I'm using:

```
get-node: func[dom path /flat /local tags node-name cont? result ][
		;probe path
		tags: parse path "/"
		node-name: last tags
		remove back tail tags
		foreach tag tags [
			cont?: false
			foreach node dom [
				;probe node
				if all [
					block? node
					node/1 = tag
				][
					dom: node/3
					cont?: true
					;dom: third cont
					break
				]
			]
		]
		result: copy []

		foreach node dom [
			if all [block? node node/1 = node-name][
				either flat [
					repend result node
				][	append/only result node ]
			]
		]
		result
	]
	get-node-content: func[dom path][
		third get-node/flat dom path
	]
	get-nodes: func[dom path /flat /local tags node-name cont? result ][
		;probe path
		tags: parse path "/"
		node-name: take/last tags
		foreach tag tags [
			cont?: false
			foreach node dom [
				;probe node
				if all [
					block? node
					node/1 = tag
				][
					dom: node/3
					cont?: true
					;dom: third cont
					break
				]
			]
			unless cont? [return none]
		]
		result: copy []
		foreach node dom [
			if all [block? node node/1 = node-name][
				either flat [
					repend result node
				][	append/only result node ]
			]
		]
		result
	]
```

hiiamboris

[11:15](#msg600ea837410c2214401fe88e)Haha. OK.

Oldes

[11:16](#msg600ea88d97132e248001c0c8)Used as:

```
shpNode: first get-nodes symbol %DOMSymbolItem/timeline/DOMTimeline/layers/DOMLayer/frames/DOMFrame/elements/DOMShape
```

[11:19](#msg600ea92ba2354e44aca7a4bb)I'm sure it could be improved.. but you know... for me was important to have the job done... no need to write something which may use anybody for whatever else.

[11:19](#msg600ea947cae490555f67ef01)Also it's code several years old, but it's still in use.

[11:20](#msg600ea99b3855dd07fd788606)I somehow feel, that it would be nice to have an optimized datatype for tree structures.

hiiamboris

[11:23](#msg600eaa472cb18a437c3e0523)Of course.

[11:27](#msg600eab046b20cf7730d80178)First thing to improve here is to build the output in a way that allows accessing it using Red paths.

greggirwin

[15:22](#msg600ee23b8816425540ec388b)@Oldes, something that came up during chat on this was @giesse's \[Niwashi](https://github.com/giesse/rebol-power-mezz/blob/master/mezz/niwashi.rlp), if you're interested in trees.

To add to @hiiamboris' thought, to design the XML structure we need to know all that has to be represented, and the relationships. e.g. the document/root part (prolog), elements, attributes, CDATA, etc. Who here knows all that from the XML side?

R2 kept everything as strings, including newlines as separate values. We could keep `new-line` markers when parsing, or normalize as we do JSON.

In any case, it's a big task that touches other things on the design side, and needs a leader and champion. @hiiamboris, care to volunteer? :^)

hiiamboris

[15:31](#msg600ee455a2354e44aca847eb)I never use xml so my experience with it is tiny (;

greggirwin

[15:35](#msg600ee5386244ee1450afac50)Same here. My notes were on the general design side. I'm buried but will try to make time to dig in a bit on the XML structure side if nobody else is already an expert.

[15:37](#msg600ee5a36244ee1450afae28)I do have some notes on path/structure/foreach access etc.

hiiamboris

[15:37](#msg600ee5ce8816425540ec4133)Gregg "No Time" Irwin ;)

greggirwin

[15:38](#msg600ee5e336db01248a9ecf3f)Well, it's all priorities. :^\\

hiiamboris

[15:39](#msg600ee644a2354e44aca84d7a)I'll upload a few series related designs soon, to keep you busy ;)

greggirwin

[15:48](#msg600ee8676244ee1450afb632)Oh joy. ;^)

@giesse's \[parse-ml](https://github.com/giesse/rebol-power-mezz/blob/master/parsers/ml-parser.rlp), if it could be leveraged, along with Niwashi, is an existing infrastructure. @giesse are you interested in seeing it used, and able to help with porting and design input?

rebolek

[15:49](#msg600ee86e36db01248a9ed5dd)I did XML codec some time ago https://github.com/rebolek/red-tools/blob/master/codecs/xml.red if anyone's interested.

greggirwin

[15:53](#msg600ee981ac653a0802df8c6d)Thanks @rebolek! Nice that you have \[tests](https://github.com/rebolek/red-tools/blob/master/tests/xml.red) as well. Isn't it funny how we can be so torn as developers. I love both approaches, but for very different reasons. One the one hand we have a very direct `parse` implementation, which is instantly accessible as code. On the other hand, we have a dialect and advanced system that lets you think in terms of the content (tree, children, etc.).

hiiamboris

[15:55](#msg600ee9e697132e248002729d)

```
>> xml/decode {<a b="v"></a>}
== [a [] #(
    "b" "v"
)]
>> xml/decode {<a><b>v</b></a>}
== [a [b [none "v" #()] #()] #()]
```

[15:55](#msg600eea036b20cf7730d8b15a)this is still too complicated for my head ;)

rebolek

[15:55](#msg600eea0797132e24800272ce)I'm not happy with the format my XML codec is producing but that's what I came up with when working on it.

[15:56](#msg600eea2f410c22144020a117)@hiiamboris I agree, it's certainly not perfect. OTOH it's easy to use programmatically :-)

hiiamboris

[15:56](#msg600eea4a2cb18a437c3ebe99)Yes and that's what I love about it when I decode server response! ;)

greggirwin

[16:00](#msg600eeb1ba2354e44aca85a94)From my notes, I hadn't found a perfect solution to this. For iterating, we need consistency, which means empty elements (potentially a LOT of them), and everyone pays that price. For path access we need keys. Parsing solves it all but variability makes other approaches harder. Then you have locality (attr distance from their related tag) if a human is reading it. Lower priority, but shouldn't be forgotten.

[16:02](#msg600eeba18816425540ec5333)Paths are interesting because they don't \*have to be* treated normally. If we want to treat them as generic Red structures they do, but if we have an accessor dialect it can do lookup magic internally.

[16:05](#msg600eec422cb18a437c3ec683)Then you have the idea of virtual slots. e.g. if you have empty maps as above, you can manipulate the structure easily. If you don't have any value, or use `none`, it's a bit more work.

giesse

[20:01](#msg600f23b6a2354e44aca90913)@greggirwin https://github.com/giesse/parse-markup

[20:02](#msg600f23c436db01248a9f8844)we were stuck on what it should return

[20:04](#msg600f245a2cb18a437c3f76e2)

```
>> parse-markup {<a b="v"></a>}
== [<a> #(
    b: "v"
) </a> none]
>> parse-markup {<a><b>v</b></a>}
== [<a> #() <b> #() text "v" </b> none </a> none]
>> parse-markup read https://www.red-lang.org/
== [declaration <!DOCTYPE html> whitespace "^/" <html> #(
    class: "v2"
    dir: "ltr"
    xmlns: "http://www.w3.org/1999/xh
```

[20:06](#msg600f24afac653a0802e03f20)ideally you'd have something like https://giesse.github.io/rebol-power-mezz/mezz/load-html.html

greggirwin

[20:40](#msg600f2cd96244ee1450b089f6)How to hide in your own context: `parse-markup: :parse-markup/parse-markup` :^)

[20:59](#msg600f311f6244ee1450b09539)`Make` just keeps asking me for the path to Topaz parse. Doesn't like anything I tell it apparently. But now I see that %compiled-rules.red was created.

hiiamboris

[21:53](#msg600f3dd82cb18a437c3fbf95)&gt; How to hide in your own context: `parse-markup: :parse-markup/parse-markup` :^)

Haha great!

## Tuesday 26th January, 2021

giesse

[13:54](#msg60101f26410c22144023e530)&gt; `Make` just keeps asking me for the path to Topaz parse. Doesn't like anything I tell it apparently. But now I see that %compiled-rules.red was created.

I was trying to get the preprocessor to do the compiling, but couldn't get it to work, so I gave up and hastily made that make.red file... in other words, it's probably not the best approach. :)

greggirwin

[16:58](#msg60104a2eac653a0802e35bc5)On closer inspection, %compiled-rules.red is an old one. I'll debug to see why it's not building.

[17:22](#msg60104fd16244ee1450b39587)`Make.red` doesn't show the error, just loops, but this is the problem.

```
*** Script Error: PARSE - invalid rule or usage of rule: keep/only
*** Where: do
*** Stack: do-file
```

giesse

[19:56](#msg601073de32e01b4f7155e09e)note that precompiled version is here: https://github.com/giesse/parse-markup/releases

[19:56](#msg601073f284e66b7f7eb0fb6d)(maybe you have an older version of `topaz-parse`?)

greggirwin

[20:17](#msg601078f484e66b7f7eb10a2b)I thought that too, so synced it. Tried removing %compiled-rules.red so it would rebuild, but then got an error that it was missing. I'll check the releases, thanks.

[20:20](#msg6010797f9fa6765ef8db3238)Same behavior with the release. I guess I need more instructions. :^\\

## Wednesday 27th January, 2021

giesse

[18:44](#msg6011b482a0246860dc141ce7)wait, this file https://github.com/giesse/parse-markup/releases/download/0.0.1/parse-markup.red does \*not* require any other file, do you still get an error?

greggirwin

[19:30](#msg6011bf5284e66b7f7eb48c77)%parse-markup.red in the release zip has `compiled-rules: #include %compiled-rules.red`, rather than the prebuilt version, in the zip I DL'd. :^\\

[21:10](#msg6011d6b8ae4b9b27c180ddf0)\[This](https://lemire.me/blog/2020/10/20/ridiculously-fast-unicode-utf-8-validation/) is really interesting to me. Came from looking for JSON benchmarks.

## Thursday 28th January, 2021

giesse

[19:59](#msg601317b8a0246860dc17e075)did you try the link I posted?

greggirwin

[20:06](#msg6013193c9d5c644f6636451e)I have not yet. Was getting the DG release out. May be tomorrow before I get to it.

giesse

[20:06](#msg6013195b4f7d1b68e516e214)I forget how to post an image here, but if you look at the release page, there is the parse-markup.red file I linked above, then a zip file with the \*source* (it says... Source code). That's exactly the same as what you get from cloning the repo.  
If you are looking at the source... then it's the same as what you already had. If you download the actual release, then there should be no dependencies.

## Saturday 6th March, 2021

GiuseppeChillemi

[09:04](#msg604345b0e562cf54aca13c9a)I am looking at the differences between json.red and `load/as.. json` one converts json object to Red objects, the other to maps. Is there any option to convert to injects using `load\as`? And why map has been chosen in place of objects?

hiiamboris

[09:26](#msg60434ad6e562cf54aca14866)you can extend maps

Oldes

[10:51](#msg60435ecc5d0bfb4e588e7c97)@GiuseppeChillemi also map have case sensitive keys:

```
>> #(a: 1 A: 2)
== #(
    a: 1
    A: 2
)
>> object [a: 1 A: 2]
== make object! [
    a: 2
]
```

[10:52](#msg60435f0144f5a454a45aa223)And I don't understand first part of the question.

GiuseppeChillemi

[11:15](#msg6043644044f5a454a45ab098)@Oldes very useful to know about case sensitive keys

[11:15](#msg60436455d74bbe49e0d837b5)@hiiamboris extend in which sense?

Oldes

[11:17](#msg604364af95e23446e417667c)

```
>> m: #(a: 1) m/b: 2 m
== #(
    a: 1
    b: 2
)
```

pekr

[11:24](#msg60436688a3a2f04f1fd95207)@GiuseppeChillemi simply with objects, you can't add (append) new attributes to them. That was available with R3 IIRC, but not sure either. Red does not have it I think.

GiuseppeChillemi

[13:24](#msg6043827d457d6b4a94a8c641)@Oldes

&gt;&gt; And I don't understand first part of the question.

If you refer to my phrase

&gt; Is there any option to convert to injects using load\\as?

I was referring to convert the JSON to `object!` instead of `MAP!`

[13:25](#msg604382b0d71b6554cd266b56)@hiiamboris  
&gt; you can extend maps

Now I have understood: you can add elements to maps

Oldes

[13:26](#msg6043831e457d6b4a94a8c7f6)@GiuseppeChillemi You can convert map to object

```
>> make object! to block! #(map: 1)
== make object! [
    map: 1
]
```

, but as shown above, you risk loosing information (as object has not case sensitive keys)

```
>> make object! to block! #(a: 1 A: 2)
== make object! [
    a: 2
]
```

[13:28](#msg60438387120cd84f78fa31a7)JSON is like JS case-sensitive.

GiuseppeChillemi

[13:28](#msg60438391d1aee44e2dcaaab7)I am investigating passing RED objects through the net using JSON instead of MOLDED form. This is the reason of my questions.

Oldes

[13:29](#msg604383c022a5ce4a91397e6f)If you are passing between two Red apps, you should use Redbin.

GiuseppeChillemi

[13:30](#msg604383f0120cd84f78fa335f)No need for the context.I need the object/block representation (The prototype)

[13:31](#msg6043842fd74bbe49e0d88594)Also I am looking at passing RED code BLOCKS via JSON.

Oldes

[13:34](#msg604384e3d74bbe49e0d887e5)If you are passing info between Redbol apps, I wonder if JSON should be used at all... it's useful if you need to communicate with systems, which cannot load Redbol data.

[13:35](#msg6043850ed1aee44e2dcaae94)Actually it's a nonsense to use it for Red-to-Red communication.

GiuseppeChillemi

[13:38](#msg604385ba457d6b4a94a8d0b5)Yes, it is for RED to non-RED and vice-versa

Oldes

[17:28](#msg6043bbcd5d0bfb4e588f6a96)@GiuseppeChillemi why not maps?

[17:31](#msg6043bc7fe562cf54aca26eaa)The only disadvantage of maps is, that there must be built hash table, so it requires a little bit more memory and creation may be a little bit slower.. instead of that I see only advantages over objects... like ability to return none on non existent values:

```
>> m: #(a: 1) m/b
== none
>> o: object [a: 1] o/b
*** Script Error: cannot access b in path o/b
```

hiiamboris

[17:35](#msg6043bd70e5f1d949d481ae59)Object lookups are based on hashtable too.

[17:37](#msg6043bdd4e562cf54aca27211)https://github.com/red/red/commit/bc7dbcf05a3a056545902006a34d7e74a2a541df

GiuseppeChillemi

[18:52](#msg6043cf84e8267a46f2f7e908)I still have to investigate if all Red OBJECTS and BLOCKS can be mapped to JSON and/or MAPS and return to their original form.

hiiamboris

[19:07](#msg6043d2e4823b6654d28a587b)obviously depends on the data

GiuseppeChillemi

[20:02](#msg6043dfe095e23446e418aa97)As I have said, I have not investigated this side of the story. Under the light of having functions that are "API oriented", I need make a choice about function arguments. Every function will receive its argument in a container:  
1\) A block in set-word form `[arg1: value arg2: value]`  
OR  
2\) As `Object`  
The JSON "container" will carry either one or another content coming from foreign non RED/REBOL applications.

hiiamboris

[20:18](#msg6043e381120cd84f78fb2a42)Well obviously blocks are lighter

GiuseppeChillemi

[21:01](#msg6043edb6e562cf54aca2e9f3)But set words are harder to access as paths.

greggirwin

[21:05](#msg6043ee97e5f1d949d4821d29)Only if you need Rebol compatibility @GiuseppeChillemi

```
>> blk: [a: 1 b: 2]
== [a: 1 b: 2]
>> blk/b
== 2
```

I have some old experiments, related to Hoare Logic/Design by Contract, but which can be generalized. The idea being that you can vet an input (block, map, object) against a spec, much like you would for a dialect.

[21:08](#msg6043ef3ce5f1d949d4821ea9)It's not a replacement for standard function interfaces or dialects, but another approach which may work better in some cases.

[21:10](#msg6043efb8823b6654d28a9fb3)It also overlaps with dependent types.

GiuseppeChillemi

[21:12](#msg6043f038a3a2f04f1fdaab2e)So in Red you have symbols equivalence in paths?

greggirwin

[21:12](#msg6043f040e5f1d949d482208d)The big difference from a grammar is that order doesn't matter. You're checking for the existence or absence of values and their attributes.

[21:13](#msg6043f091d2619a4f2e297b48)For set-words. Get-words still look up the value they refer to.

[21:15](#msg6043f0e5e5f1d949d48221b4)e.g. you can use it with `find/select`

```
>> blk: [a: 1 b: 2]
== [a: 1 b: 2]
>> find blk 'b
== [b: 2]
>> find blk quote b:
== [b: 2]
```

GiuseppeChillemi

[21:15](#msg6043f0fde8267a46f2f83f48)I am experimenting in this area too but in simpler ways. I'll test parse-based input grammars in the future, and also arguments value validation.

[21:17](#msg6043f15895e23446e418d702)I have even thought about embedding args validation in DESCRIPTION strings, so they are available to a validation parser!  
(EDIT: NOTE, I HAVE CHANGED THIS PHRASE!!)

[21:19](#msg6043f1ffb5131f4f28f8c01e)So, how do you `find/select` just words or set-words in Red?

hiiamboris

[21:21](#msg6043f240d74bbe49e0d9849b)'? find'

greggirwin

[21:24](#msg6043f319823b6654d28aaa2f)@GiuseppeChillemi my post above was to show that words and set-words work equivalently.

[21:25](#msg6043f33c44f5a454a45c1bd9)If you need to check \*strictly* use `find/case`.

GiuseppeChillemi

[21:35](#msg6043f5ae120cd84f78fb5b1a)Wow! There was a secret here:  
`/case => Perform a case-sensitive search.`

[21:56](#msg6043fa73e8267a46f2f854c8)So this road ends to nowhere:

```
>> blk: [a: 22 C: b b: 3]
== [a: 22 C: b b: 3]
>> w: 'b
== b
>> blk/(w)
== b:
>>
```

I admit I don't like it. Set word notation can't be used in paths but I can create workarounds:

greggirwin

[21:58](#msg6043faf9e8267a46f2f855bd)Path notation does have limitations, because you can't spec `/skip 2` or `/case`. Tradeoffs.

GiuseppeChillemi

[21:58](#msg6043fb09d71b6554cd279dd6)I was creating something like this for arguments constraining and checking:

```
arguments-block: [a: 50 b: 22]

;--- This is the checks block ---
checks: make object! [
   a: func [arg [number!]] [if arg > 10 [raise-error]]
   b: func [arg [number!]] [if arg < 2 [raise-error]]
]

f: func [args /local checks] [
	foreach wrd words-of checks [
		checks/(wrd) args/(wrd)
	] 
]

f arguments-block

;Alternate solution
f: func [args /local ff checks] [
	foreach wrd words-of checks [
		checks/(wrd) find/tail/case args wrd
	] 
]
```

[21:59](#msg6043fb2895e23446e418eeb1)Note: check should be inside the function but I have left it on the outside to maintain readability

[22:03](#msg6043fc19d71b6554cd27a04a)&gt; Path notation does have limitations, because you can't spec `/skip 2` or `/case`. Tradeoffs.

Yes, SKIP 2 can be avoided not having set-words arguments (!) but `/case` can't be used and you have to drop words the use of words as set-word arguments !!!!!

greggirwin

[22:04](#msg6043fc7395e23446e418f22f)You can bend Red farther than other langs, but it will still eventually break. ;^)

GiuseppeChillemi

[22:07](#msg6043fd0ae8267a46f2f85ac2)Sometime I have thought about having path evaluation options like:

`word/[options]/path/path` I will experiment with it making a custom operator to evaluate the path.

[22:07](#msg6043fd3ed71b6554cd27a38d)&gt; You can bend Red farther than other langs, but it will still eventually break. ;^)

I love this phrase!

[22:09](#msg6043fd87e5f1d949d4823ca3)But Red has 1.000 ways to do the same thing, so it won't break if you find the right way of bending it.

greggirwin

[22:12](#msg6043fe37a3a2f04f1fdac9fd)Correct.

[22:12](#msg6043fe5ae8267a46f2f85ec9)If you find that you're bending things so far that you feel the strain and resistance, bend in another direction.

GiuseppeChillemi

[22:28](#msg604401f5d74bbe49e0d9a8c4)Parse is now my friend here. I can bend it further using it. Like a BOOST! on the elasticity property of the materials.

[22:42](#msg6044053ee8267a46f2f86cc7)@greggirwin note: you should document the equality of `set-words` and `words` in find and paths \[here](https://github.com/red/red/wiki/%5BDOC%5D-Differences-between-Red-and-Rebol)

greggirwin

[22:50](#msg60440729d1aee44e2dcbee19)It's a wiki, so go for it.

GiuseppeChillemi

[23:15](#msg60440cf6b5131f4f28f8ffa4)You know why I don't write but maybe I am now a little better talking about Red and \*\*someone\** will accept my editings 😉

greggirwin

[23:56](#msg60441699e5f1d949d482711a)Good writing is rewriting. If we get something in there it can always be improved.

## Monday 8th March, 2021

GiuseppeChillemi

[16:06](#msg60464b6ed2619a4f2e2f3a23)So, JSON objects are converted to `maps` while arrays are converted to blocks. Is it right?

greggirwin

[17:51](#msg60466406e5f1d949d4879065)Correct.

GiuseppeChillemi

[22:35](#msg6046a699e562cf54aca9ba22)And do we have a way to transparently convert to JSON and then to Red, without losing resolution?

```
>> xx: ["a" %myfile.r 'a /hello true false none 1 3x2 make object! [c: 22 d: 33]]
== ["a" %myfile.r 'a /hello true false none 1 3x2 make object! [c: 22 d: 33]]
>> load/as save/as "" reduce xx 'json 'json
== ["a" "myfile.r" "a" "/hello" true false none 1 "3x2" #(
    c: 22
    d: 33
)]
```

Words, files, refinement and pairs are converted to strings. It would be nice if they retained to datatype in some way (serialized form?).

greggirwin

[22:36](#msg6046a6f644f5a454a462d9ad)You would have to encode the extra information yourself. JSON conversions are lossy because it only understands a few basic types.

GiuseppeChillemi

[22:38](#msg6046a763d1aee44e2dd2915f)I know I have documented myselft in the meantime. I will work on this topic. @reichart has made me curious about APIs and I am trying to understand how much of Red could be mapped to JSON.

greggirwin

[22:40](#msg6046a7d4d2619a4f2e305c15)The way I did this for XML (for Reichart in fact) was to create a schema that mapped known fields to Red value types. The principle is the same, but is predicated on knowing what's in the data.

GiuseppeChillemi

[22:42](#msg6046a843a3a2f04f1fe1887a)How do you suggest representing a Red datatype which has no counterpart in JSON?

[22:42](#msg6046a86ce5f1d949d4883ae0)(I am kindly asking for a suggestion for mapping datatypes)

greggirwin

[22:46](#msg6046a946e5f1d949d4883ccb)Almost everything has to become a string on the JSON side. If you have compound types they may map to objects or arrays. Then you have conversion funcs to do specialized processing that lets the other side understand it. e.g.

```
from-XML-date: func [val [string!]] [to-date replace val "T" "/"]
to-XML-date:   func [val [date!]] [to-ISO8601-date/T/no-zone val]

MSProject-type-map: [
	; XML type	REBOL type 	conversion funcs
	"integer"	integer!	[to-REBOL to-integer to-XML form]
	"string"	string!		[to-REBOL to-string  to-XML form]
	"boolean"	logic!		[to-REBOL from-XML-boolean  to-XML to-XML-boolean]
	"float"		decimal!	[to-REBOL to-decimal to-XML form]
	"decimal"	decimal!	[to-REBOL to-decimal to-XML form]
	"time"		time!		[to-REBOL to-time    to-XML form] 
	"duration"	time! 		[to-REBOL from-XML-duration  to-XML to-XML-duration]
	"dateTime"	date!		[to-REBOL from-XML-date  to-XML to-XML-date]
	; other name means it's an object type	
]
```

[22:49](#msg6046a9e5e5f1d949d4883e59)Then you have schemas for each type you need to translate.

```
"TimephasedDataType" [
        "Type" "integer" 
        "UID" "integer" 
        "Start" "dateTime" 
        "Finish" "dateTime" 
        "Unit" "integer" 
        "Value" "string"	; may contain a duration value that requires parsing
    ]
```

Which can have nested blocks that eventually boil down to fields with a type.

GiuseppeChillemi

[22:55](#msg6046ab45d1aee44e2dd29bcd)So, you use a `foreach` to iterate `MSProject-type-map` and then a `path` on the third element to select the appropriate conversion function?

greggirwin

[22:59](#msg6046ac6eb5131f4f28ff93ab)It first loads the XML into a raw block, then walks that and maps each value using the schema. If there's no schema entry for a field, it tries to `load` it.

## Wednesday 17th March, 2021

rebolek

[06:46](#msg6051a5aaef43061daa7a7d9b)@giesse Is there any specific reason why JSON codec returns an error instead of throwing one? Or is it just an oversight?

giesse

[19:18](#msg605256043a9448256c110d7f)I didn't change `load-json`. Looking at https://github.com/greggirwin/red-json/commit/d034df6268f81ad7b1dbc84e595ac51d055f141d#diff-7a2689d7c2ae95425eac90483c2810220659bf626bd012d97fe409a6d62dd2d7 I'm going to blame Gregg :P

[19:19](#msg60525641f07ffa1eb549f569)I guess it needs a `do` in there? or using `cause-error`.

rebolek

[19:19](#msg60525657ef43061daa7ca68e)Ha! :)

[19:20](#msg6052567d33346c16275b3679)Right, it needs `do` to trigger the error otherwise, you get `no catch for throw` error

greggirwin

[19:31](#msg6052590d563232374c27535e)Indeed. Now we know \*when* it happened, but given my current thinking, maybe I was just being future consistent with that. :^)

rebolek

[19:38](#msg60525ac5ad83ec3d7d373745):)

## Saturday 25th September, 2021

zwortex

[11:06](#msg614f02ac5739ab2df811a501)I have created a new repository \[zwortex/red-xml](https://github.com/zwortex/red-xml) for xml related stuff. It is an attempt to transpose into RED the SXML package used in Scheme, see \[original by Oleg Kiselyov](http://okmij.org/ftp/Scheme/xml.html) or its \[Racket version](https://docs.racket-lang.org/sxml/index.html). This is experimental stuff, all the more that I still don't feel yet entirely at ease with Red. In the package currently, there is  
\- \*\*sax.red\** : an implementation of SAX (the standard api for XML event driven parsers). This is nearly complete, except DTD that is not supported yet. The parser also is not yet a validating parser (no DTD, nor XML schema support). You find a similar parser as this one within Rebol3 XML codec, but this one is another implementation, closer to the current \[SAX2 API](http://www.saxproject.org/). As this parser does solely XML parsing, it can be easily targeted for whatever target format. For instance, I guess it could be used for loading SVG files directly into DRAW dialect.  
\- \*\*sxml.red\** : an implementation of SXML format. Originally SXML is an internal representation of XML that is used for Scheme and that is based on s-lists, therefore its name : see \[wikipedia](https://en.wikipedia.org/wiki/SXML) and above links for more details. The same structure is implemented here with blocks rather than s-list obviously. One difference also is the marker for the attribute set of nodes. In SXML, it is @. In Read, _ is used instead as @ is not allowed within a word. The script allows loading an XML file into an SXML tree and perform basic operations with that tree. Note however that the objective of SXML is the ability to manipulate an XML structures directly with the language, rather than through an API. As long as the final tree is compliant with the SXML structure, it can be used.  
\- \*\*sxpath.red\** : an implementation of SXPATH. This allows to interrogate an SXML tree with similar requests as XPATH. The script, currently, implements the sxpath primitives and the abbreviated format of requests. It does not implement yet the string format, which is the closest to XPATH.

What is lacking, on top of what was already mentioned :  
\- serialization : for the moment, this is a one-way ticket from XML to SXML but not the other way round (sorry).  
\- SXML transformation : similar to XSLT

Note that the SXML or SXPATH formats are not entirely settled. In particular, it may not leverage enough red capabilities to handle multiple data-types. In Lisp, symbols are used for XML tags as well as internal tags like \\\*COMMENT\\\*, \_, \\\*TOP\\\*, \\\*any\\* etc. Currently, word or issue! are used but this not entirely thought through. Similarly XML tags may be translated into word, tag, or url or combination of those. This, also, needs additional thinking.

There is limited, to no documentation, so that the best entry point are the test sets. There is one for each file.

greggirwin

[17:17](#msg614f598cd9a141754d0ea9c1)Thanks @zwortex! I will make time to check it out. The reason we don't have a markup codec yet is because of unanswered design questions, like those you hit. Also how it aligns with HOFs for processing, versus having an `xpath` API.

[17:18](#msg614f59d28065e87a8e028656)One issue you may run into with using words for all symbols is blowing the current symbol table space. Anytime you're loading external data, which may contain thousands of symbols, you run this risk.

[21:10](#msg614f9042fd7409696e2ff5a6)@zwortex wow! That is no small amount of work. :+1: It's nice to see parse-trace used, and you've done some nice work with reflective aspects. I have only skimmed a couple files so far, but appreciated the detailed comments.

## Sunday 26th September, 2021

zwortex

[09:16](#msg61503a535739ab2df81407ae)@greggirwin, thanks for your comments. For the use of words, I think it should be possible to configure the parser to produce either words, issues, tags, urls or a combination of them to handle symbols.

I don't understand your remark on HOFs for processing, versus having an xpath API. First of all, what does it mean HOF ? High order function ?  
Anyhow the SXPATH solution see \[original paper](http://okmij.org/ftp/papers/SXs.pdf) by Oleg Kiselyov is three folds :  
\- primitives functions, filters, selectors and combinators, that operate on a node set and return a node set. For instance the function node-closure scans through all descendants of a node and returns all the nodes that satisfy a given test, or the function node-type checks whether a node is of a specific type or tag)  
\- abbreviated request : that is a higher order shorthand format for writing a request. For instance to get all nodes that are html paragraphs, you provide the following block request \[#... p], which is translated using the primitives above. Here the node-closure and node-type with p tag.  
\- string request (not implemented yet) : are xpath requests, that are similarly translated into a combination of primitives functions.

Still, as SXML is regular blocks combined together into a tree : you might use whatever functions you like to build it, modify it or scan through it, as long as you respect the expected format. I should add also that XPATH allows providing your own functions to a request, so you may embark in the request whatever complex test you need to perform. All this is not entirely implemented, not entirely tested but that is the intention.

greggirwin

[18:20](#msg6150b9e08065e87a8e051f9e)We're on the same page. WRT HOFs, the design issues we're thinking about are how best to generalize things. For example, in Red, rather than a specific DOM processing model, you may have flat series, DOM-like structures (with or without node attributes), triples (see @hiiamboris \[`node!`](https://github.com/red/REP/issues/57) thoughts), and integration with iterators for imperative use. It would also be nice if we can make things sensible WRT other features in Red. e.g. the new `split` may be able to partition by function(s), so it overlaps with HOFs and DOM filters/selectors in some ways.

## Monday 27th September, 2021

zwortex

[10:52](#msg6151a28499b7d97528311713)I am not sure to understand fully (haven't red the REP), but I guess your story is : let's extend our own vocabulary (find, select, append etc.) to support also tree-like structures, and why not be foolish any kind of graph-like structure. And we would need to extend iterating capability, as filtering is not possible etc. And we don't like recursivity that is bad, for the mind and for the stack.

greggirwin

[16:48](#msg6151f5c267e789189c1f8086)`find, select, append` won't change in this regard. At least not anytime soon. I started an HOF project, and @hiiamboris took some ideas to the next level, but this will be new mezzanines for the most part.

## Monday 1st November, 2021

rebolek

[12:23](#msg617fdc2738377967f4882645)I’m not sure if this is the best room for it (I haven’t found other related directly to networking/protocols), but anyway. Here’s a Wiki describing my work on different protocols implementation so far. https://github.com/rebolek/red-tools/wiki/Red-networking-(layer-6-&amp;-7)

greggirwin

[18:29](#msg6180321929ddcd0293595423):+1: We should definitely have a group for this, but for now we could use red/red so people are aware. red/protocols is probably a good name, as it's more specific to the higher level aspect, versus things related to TCP stacks, IPv6, etc.

rebolek

[19:31](#msg61804078ee6c260cf753a3f1)red/protocols for layers 6&amp;7 and red/networking for layers 4&amp;5

greggirwin

[22:02](#msg618063f78c019f0d0b6dfa4d)@rebolek, you note that the server work currently focuses on security, which is absolutely the most important aspect. Functionality doesn't matter if we fail on security.

[22:04](#msg618064788c019f0d0b6dfaf7)Typo in link: "Red’s MQQT"

[22:14](#msg618066a9f2cedf67f9bdcdc6)Rebol had `dns://` built in as well. I actually used it quite a bit as a debugging tool, making sure names went where I thought they did. Handy for creating server dashboards as well.

For less used protocols, they can be good examples. We don't want to include everything as standard, and some will be more complicated or pose extra surface areas for attacks. e.g. FTP is a pain, and insecure as you note. However, there are still surely legacy systems out there and SFTP isn't dead yet AFAIK. So while they are a low priority, if somebody needs them, we can help them if needed.

## Tuesday 2nd November, 2021

rebolek

[08:29](#msg6180f6dd98c13e75500f6460)* typo fixed, thanks. I also added more links  
\* DNS - of course I want `dns://` too, what I meant is that it should be implemented at R/S level using OS calls instead of writing a complete DNS resolver  
\* my HTTP server focuses on security, but I believe we still need build-in very simple HTTP server that just serves static pages (for a local machine mostly) and nothing more. That doesn’t mean there can’t be another more advanced server. Should it be built-in? I don’t know, I guess it depends on the size of the codebase.  
\* SFTP certainly isn’t dead, but it shares only name with FTP, it’s SSH based (there’s also FTPS which is FTP over SSL/TLS). Would be nice to have SSH in Red? Oh boy, that would be wonderful!

xqlab

[10:33](#msg618113dd9d20982e4ff72810)SSH ++

rebolek

[10:43](#msg61811649f2cedf67f9bf5d8c)I’ve made a repo for the various protocols so they’re not shattered around. I also moved the wiki there: https://gitlab.com/rebolek/protocols/-/wikis/Red-networking-(layer-6-&amp;-7)

hiiamboris

[15:16](#msg6181563f8c019f0d0b70352d)secret wiki page ;)

rebolek

[15:40](#msg61815c0bee6c260cf7563d06)secret? :)

greggirwin

[19:34](#msg618192d029ddcd02935c930d)Agreed on DNS @rebolek.

We should be able to do SSH, but this is also an area where we have to weigh value to Red, and is it better to build a modern alternative that is more idiomatically Red. like Reb Services was. That is, can we make SSH better, more accessible, or more secure to help others that use it? Can we make tools that sit over it (think SCP) for particular uses? Zooming out, in today's world, how do we make it easy to create and manage secure, distributed systems?

On built-in HTTP servers, it probably needs to be kept very simple, though once we have modules, the ability to include it optionally will make that less important. I also think a Red native protocol would be great, and we can learn from Reb Services and other protocols there. The underlying protocol(s) will have, I expect, higher level protocols over them, so you can change your tuplespace protocol to a different transport without changing the high level code itself.

pekr

[21:10](#msg6181a92ba41fd206991e1fe7)One of the reasons for the Red project, IIRc, was to get Cheynne NG. As a web/app server. Cheynee was based upon an Uniserve multiplexing engine. I think, that apart from schemes/protocols, the ability to configure / instantiate servers / communication for various protocols, was the initial idea.

[21:11](#msg6181a98efb8ca0572bfc05a8)Rolling some 10-15 years to nowadays, I have to ask myself, if I can see a value in supporting protocols like IRC, ICQ and various protocols, which might not even exist nowadays, is the way to go.

greggirwin

[21:18](#msg6181ab40fb3dcd4e886383f8)@pekr we absolutely have to look forward, not back. We're learning this lesson now with 64-bit. For those who need legacy support, and there are many out there I'm sure, they should be able to build what they need...or contract us to build it for them. :^)

## Wednesday 3th November, 2021

rebolek

[05:55](#msg61822451ee6c260cf7580106)@pekr I don’t thik anybody mentioned ICQ :-) I might do IRC as I use it daily, IMO it’s much better than closed source alternatives like Slack or Discord.

[05:57](#msg618224bbfb3dcd4e886490ae)But most of the protocols in my list are things that are popular now - HTTP, websockets, some DB engines like MySQL and Redis, etc. I also mention few protocols that are implemented in Rebol, but are legacy IMO and I don’ think we should focus on them.

If you think something is missing in the list, just let me know, we can discuss it and I can add it to the list.

greggirwin

[18:31](#msg6182d568fb3dcd4e88663127)HTTP is by far the most important. Having a couple others as examples helps us refine the patterns used so we can write up docs and best practices to let others build protocols effectively.

## Thursday 18th November, 2021

greggirwin

[21:12](#msg6196c1afa9c8eb44c4e6b862)We're going to push forward on a markup codec. There are comments going back to early this year on it, and I have a bunch of notes as well. We're in the midst of a \*lot* of design discussions right now, and they often touch each other in some ways. It's a good time to hit this hard, and @rebolek will be our lead.

One of the most important things is the data structure, and how that makes various features at the API level easy or hard, and how and what we expose from an implementation standpoint, or how it's architected internally. We're dealing with this now in both `split` and `format`. Fortunately, there's a clear separation with codecs. The parser will be done with `parse`, and produce a data structure. The interface to that, and the implementation to support it is the second part. They meet at the data structure, but are otherwise no connected. The data structure is also important, because it doesn't have to come from a parsed markup document.

This makes the data structure the critical part, and unless someone sees something I don't, it comes down to a small set of options in how we choose to address attributes for nodes. That is, it's really just a simple tree with nodes... except for the added attributes each node can have. Since, in all these years, nobody has proposed a clear winner, it's just a choice. And that choice may be driven by what makes the API implementation clear and easy.

## Friday 19th November, 2021

rebolek

[08:49](#msg619765126104ea63b6a36696)Here are @greggirwin 's notes reformated as a Wiki https://gitlab.com/rebolek/markup/-/wikis/home feel free to edit it.

hiiamboris

[15:53](#msg6197c86b63c1e83c951990ef)My preference is:

```
input: {
	<tag-1 attr-1="t-1">
		<tag-2>
			<a attr-a="aa-1">aaaa</a>
			<b>bbbb</b>
			cccccc
		</tag-2>
	</tag-1>
}

xml: [
	tag-1 [
		#attr-1 [! "t-1"]
		tag-2 [
			! "cccccc"
			a [
				! "aaaa"
				#attr-a [! "aa-1"]
			]
			b [! "bbbb"]
		]
	]
]

xml/tag-1/#attr-1/!				;) "t-1"
xml/tag-1/tag-2/!				;) "cccccc"
xml/tag-1/tag-2/a/#attr-a/! 	;) "aa-1
```

\- `/!` implies we want content, not a branch, and short enough not to be annoying  
\- lexer will have to be adjusted to not append slash to the issue  
\- issues ensure we know attributes from elements and can reconstruct the tree back  
\- since attributes are not trees themselves, there will me at most one issue in the path  
\- output does not contain mandatory empty strings `! ""` for each value (for readability)  
\- absence of maps make tree lightweight  
\- no magic numeric indexes in the tree, nor there any need to interleave branch names with some selector name

[16:06](#msg6197cb6db5ba9e5a11c4d03a)Or alternatively:

```
xml: [
	tag-1 [
		#attr-1 "t-1"
		tag-2 [
			! "cccccc"
			a [
				! "aaaa"
				#attr-a "aa-1"
			]
			b [! "bbbb"]
		]
	]
]
```

`/!` here is for branches only, attrs do not require it

```
xml/tag-1/#attr-1				;) "t-1"
xml/tag-1/tag-2/!				;) "cccccc"
xml/tag-1/tag-2/a/#attr-a 		;) "aa-1
```

rebolek

[16:42](#msg6197d3edabdd6644e3941809)@hiiamboris it’s an interesting approach. I will test it.

zentrog:matrix.org

[19:10](#msg6197f68ecd3f06175dc514b9)Yeah, that `!` is interesting. Do you think multiple text fields should be combined into one, or appear multiple times in the output? And if each one appears separately, would they use the same or a different marker?

[19:13](#msg6197f7486104ea63b6a4cea4)I am very in favor of your attribute approach over including a data structure for attributes. Would `ref!` also be feasible for that, or is `issue!` superior for this? I guess `issue1` seems like it might be closer to the constraints of xml attributes...

hiiamboris

[19:31](#msg6197fb8bc6149e53493c2073)&gt; Do you think multiple text fields should be combined into one, or appear multiple times in the output?

My gut says if there's another item of the same name, turn it into a block of blocks. `item [[first...] [second...]]`

[19:32](#msg6197fbc3cd3f06175dc521c0)`ref!` isn't that good, because it's a string, while `issue!` is a word

giesse

[19:44](#msg6197feab197fa95a1c7e3689)@hiiamboris what you describe would be useless for HTML  
I'm not convinced it is useful for most XML either, but since I avoid XML like the plague I have no experience with it so I could be wrong.

hiiamboris

[19:47](#msg6197ff60197fa95a1c7e37e4)Why would it be useless for HTML?

[19:51](#msg619800258853d3164004e411)I'd love to hear what's \*possibly* wrong with it on XML side too ;)

[19:52](#msg6198007bc6149e53493c2e4f)I guess you mean that HTML is ordered. OK.

[19:53](#msg619800c175fa481649443a01)In that case we'll need to think about graceful adaptation. Like insert `! content` between other child elements any number of times.

## Monday 22nd November, 2021

rebolek

[17:13](#msg619bcfd06104ea63b6acc32e)How to store attributes is one problem, but XML is great at bringing much more problems.

hiiamboris

[17:14](#msg619bd00775fa4816494c16d1)Indeed. It's the worst data format probably ;)

rebolek

[17:14](#msg619bd01075fa4816494c16d8)For example, how to store processing information (tags enclosed in ) and stuff like `CDATA` ().

[17:15](#msg619bd02675fa4816494c1726)No doubt about that.

hiiamboris

[17:15](#msg619bd035abdd6644e39c6d3f)What is used for?

rebolek

[17:16](#msg619bd06063c1e83c9521fc5e) are so called processing information, they are used for ... hm ... processing.

[17:16](#msg619bd070026dc63ca60e3e92) are basically some metadata.

hiiamboris

[17:17](#msg619bd094abdd6644e39c6dfe)&gt; are so called processing information, they are used for ... hm ... processing.

Just a bit vague :D

rebolek

[17:19](#msg619bd11b63c1e83c9521fe17)If you think it’s vague, here’s the definition:

&gt; Definition: Processing instructions (PIs) allow documents to contain instructions for applications.

hiiamboris

[17:19](#msg619bd1358853d316400cd430)lol

rebolek

[17:19](#msg619bd13ecdb5c1081a269cc0)so it’s not information but instruction, sorry

hiiamboris

[17:20](#msg619bd146cdb5c1081a269cdb)okay, let's see what SO says

[17:20](#msg619bd15b76e3791755fcf25a)https://stackoverflow.com/questions/39115398/what-does-mean-in-xml  
https://stackoverflow.com/questions/60801060/what-does-mean-in-xml

rebolek

[17:20](#msg619bd172abdd6644e39c7029)Also,

&gt; PIs are not part of the document's character data, but MUST be passed through to the application.

So we need to preserve it.

hiiamboris

[17:23](#msg619bd1fbabdd6644e39c7212)from what I read on SO we can safely ignore that all

[17:23](#msg619bd20776e3791755fcf406)`is basically DTD embedded`

`17:23 is instructions for specific programs`

`rebolek 17:34I don’t agree we can ignore it, if we want to support XSLT transformations, we require that info. zentrog:matrix.org 17:59[Xml namespaces](https://en.wikipedia.org/wiki/QName) complicate things quite a bit too. It probably doesn't need to track which namespaces elements/attributes belong to, but the syntax is awkward. It implies : appearing in element/attribute names. 18:06I suppose it could be translated into something else which is legal in red words, but not allowed in xml names rebolek 18:21@zentrog:matrix.org we can probably translate that to paths, or just leave it alone as strings if it's going to be a problem greggirwin 19:331) We do want to plan for any features that *might* need to be supported, so we don't paint ourselves into a corner. That said, if we do a basic system now, without all the extra bits, and then someone needs them, there's no reason we *can't* have two separate codecs. 2) In that same vein, if we need to break out HTML and XML codecs separately, I have no issue with that. They really are different beasts, and we aren't going to have a generic SGML model. At least I don't see the value in doing that. 3) Ask how things would be used in Red, once the markup is loaded. Are we going to build systems that *evaluate* Processing Instructions? I doubt it. If we include them at all, they are chunks of data. Same for DTD, doc info, whitespace, and namespaces. All this means that the loaded data can be much messier than a plain tree, which is a shame. Here's my take: 80%+ of the value on our side, from XML, will be from plain structured data. This does unfortunately include attributes, which we have to handle for HTML as well. They are even more important there I think. If we can load that, people can extract the most valuable part of their data for processing. If they can, optionally, also get the rest of the content that's a plus. With that they can analyze their XML to see where DTDs, PIs, etc. are used and *they* can decide how to use it. It lets people build general XML analysis and other tools as well. If we want to think about stylesheet transformations, that's a much bigger and broader topic, but that would be built on top of a basic codec and can come later, when someone actually needs it. It ties to general processing and HOFs to support that as well. Right now, even if we know what PIs look like, do we know what they can contain and how they're "processed"? Without that, we have no hope of making use of them. If they get passed on to the app, to us they're just data. When someone comes to us and says they need that feature, they can pay us to build it and then we also know it will solve at least one person's problem correctly. :^) For me, the best thing we can do for humanity is to get data *out of* XML format, and simplify things. Make their lives easier overall. JSON won in that regard. But we also know that being just a basic data structure has caused others to extend it in non-standard ways. XML is at least a standard. XML and JSON come at the problem as polar opposites. Red comes at the problem sideways. It makes sense to map the tree model directly, as we're thinking about so far. It saves us a *lot* of design brainstorming and potential dead ends and wasted effort. But that doesn't mean we can't do something entirely different in the future. HTML is for documents, XML is quite often used for structured data. Two very different purposes. I don't expect us to save the world of markup with v1 of our codec. Right now it's about the simplest useful aspects that we can extend later.`

``Tuesday 23th November, 2021 rebolek 09:50Ok, so I decided to include this stuff on demand. There is a new /meta refinement that will include processing instructions and other metadata into the result. These metada have same structure as normal XML data (I use tag-name content attributes format, but that's easy to change if we decide to go with another one), there's one difference, meta names use issue! instead of word! as normal tags. I need to parse that stuff anyway and including it into output is almost free, so there's no reason to postpone it. 09:58@greggirwin > if we need to break out HTML and XML I believe we need to. I wrote XML parser that I used to parse HTML but then I needed to add support for HTML specific features. And then support for common mistakes (HTML parsers in webbrowser are very forgiving <---> lot of HTML pages are totally broken if you would use unforgiving parser). So as I see it, XML parser can be very strict and standard compliant, HTML parser must support a lot of common errors (and there's also a lot of differences between the two formats, HTML is not a subset of XML). > Ask how things would be used in Red, once the markup is loaded. Are we going to build systems that evaluate Processing Instructions? I doubt it. I don't. XSLT is used for transformations and it's not that hard to support it (it's XML anyway). > All this means that the loaded data can be much messier than a plain tree, which is a shame. I'm still trying to keep a simple tree and thanks to rich datatype system that Red has, it's possible. > If we want to think about stylesheet transformations, that's a much bigger and broader topic, but that would be built on top of a basic codec and can come later, when someone actually needs it. While I agree it's not a part of a basic codec, I think it can come soon as it's not going to be such a big problem. hiiamboris 16:00I'm working with xml.red right now (the older version) and it's completely impossible to work with (just saying) 16:00Such a headache to convert into anything useful... 16:02And having "^/^-^-^-^-" represented as *content* is very harmful too ;) rebolek 16:52@hiiamboris I was writing a sequel to my post but haven’t finished it due to other reasons. So here’s the crux of it: The original xml.red was made to parse both xml and html. It wasn’t a good idea, so I made separate html-codec.red that is now in castr and started working on xml2.red that I’m improving currently. > having "^/^-^-^-^-" represented as content is very harmful too Unless you care about HTML as explained above. The new XML codec ignores such stuff. hiiamboris 17:11makes sense 17:11keep me updated on your progress on xml2.red ;) 17:11I will need it for locale data extraction 17:11good testing data too 17:12right now xml2 just returns true :) greggirwin 19:50Thanks for the feedback @rebolek. :+1: 20:12> XSLT is used for transformations and it's not that hard to support it (it's XML anyway). This is where examples and research will help me. I don't know the main ways XSLT is used, or how widely. We do want, as I've said, transformation and selection interfaces to our own data structures, but is it worth our time to transform XSLT itself into ours? This is also where we have to look at Red's applications and other limitations. e.g., some big corp in-house dev may love the XML/XSLT support, but is the rest of Red up to their Enterprise needs? Leveraging datatypes is something I'm 100% behind, like @hiiamboris showed in his idea recently. :+1: rebolek 20:14> right now xml2 just returns true :) 20:15true pekr 21:20I have thought that XML, since the invention of simplified things like JSON, is used mostly by diehard nerds and lunatics :-) hiiamboris 21:43lunatics aren't hard to come by though ;) Wednesday 24th November, 2021 zentrog:matrix.org 06:09I've done a fair amount of work with XML and XSLT, and I mostly hate XML, but actually kind of like XSLT. I'm not sure which category that puts me into 😏 06:26To me the most important things are to be able to convert markup into a Red format, and also reliably generate markup from Red data. I don't think some implementation of XSLT makes a lot of sense to me because I could just call into one of the many existing xslt tools if I already have a style sheet for it, or feed the Red formatted data into parse 06:34I do think that having some xpath-like mechanism to filter/select into a tree of data would be really useful in general, but I don't think it's specific to markup formats greggirwin 07:04Good feedback. Thanks @zentrog:matrix.org. hiiamboris 07:24@zentrog:matrix.org as someone with xpath experience, can you say if [sift](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/sift-locate.md) will be of help given a tree iterator? or if something we could add to it for these use cases? rebolek 07:38@hiiamboris xml2.red now returns tree instead of logic! hiiamboris 08:11:+1: will test! rebolek 08:13It's a WIP and I'm working on it right now, so problems are expected. zentrog:matrix.org 09:15@hiiamboris: it looks interesting! I'll try to explore it some more and get back to you hiiamboris 09:16thanks! 09:25@rebolek yeah found a bug :) probe load-xml {<?xml version="1.0" encoding="UTF-8" ?> <symbols numberSystem="arab"> <decimal>٫</decimal> <group>٬</group> <list>؛</list> <percentSign>٪؜</percentSign> <plusSign>؜+</plusSign> <minusSign>؜-</minusSign> <approximatelySign>~</approximatelySign> <exponential>اس</exponential> <superscriptingExponent>×</superscriptingExponent> <perMille>؉</perMille> <infinity>∞</infinity> <nan>NaN</nan> <timeSeparator>:</timeSeparator> </symbols> } [symbols [decimal [] #() group [] #() list [] #() percentSign [] #() plusSign [] #() minusSign [] #() approximatelySign [] #() exponential [] #() superscriptingExponent [] #() perMille [] #() infinity [] #() nan [] #() timeSeparator [] #()] #( numberSystem: "arab" )] Oldes 10:34:point_up: [November 23, 2021 10:20 PM](https://gitter.im/red/codecs?at=619d5b28c2cc0e5343c6f9eb) sadly, Android sources are full of XML and it's not going to be replaced. Not to mention, that every web page is also XML based and that is also not going to be changed. rebolek 11:03> every web page is also XML based that's not true, XHTML which was XML based lost and we have HTML5 which is not XML based. Both XML and HTML are based SGML so they're certainly similar. 15:10@hiiamboris your test now should work as expected hiiamboris 15:21:+1: Oldes 16:02@rebolek right, HTML5 may be valid but also invalid XML... but it is just a detail... like that it does not require closing tags and can have attributes without quotes. Anyway... XML use is still very heavy and it's not going to be changed. rebolek 17:38No doubt about that. We may not like it but we need to support it. But I don't agree that the differences between HTML and XML are just a detail. I think that the differences are big enough that it makes sense to have two separate parsers. HTML one needs to deal with a lot of stuff that XML can safely ignore. zentrog:matrix.org 18:53The question is once you support all the HTML stuff, is it no longer able to handle XML? Or is XML actually a subset of HTML? rebolek 18:56It's not strictly a subset (XML requires a header/XMLDecl) but roughly yes. If you treat XML as a subset of HTML, invalid XML may pass. It's able to handle XML but it can't determine if it'đ a valid XML, unless you have a specific logic for it and then you're just complicating the code. zentrog:matrix.org 19:22How important is XML validation? I’d be mostly concerned with extracting data, and would prefer the ability to read broken XML. Of course any emitted XML must be correct. 19:24The other question is whether HTML can be always emitted as valid XML (minus the header I guess) or if there are special cases where it needs something else Thursday 25th November, 2021 rebolek 06:48I really don’t want to mix HTML and XML codecs, I did it already and found out it’s not a good idea. The HTML-specific logic has no use for XML and vice-versa. Reading broken XML makes sense and it would be useful to identify usual XML errors. They may be different than HTML ones or the same, I don’t know. Regarding the emitter, I believe they can be shared much easier than a parser. pekr 07:03I do agree here. If you know you are dealing with xml, use xml codec then. rebolek 08:33Another important difference between HTML and XML is that in XML there can be only whitespace between tags and you can ignore that, but in HTML there can be content which you can’t ignore. pekr 09:06@rebolek .... just go ahead! :-) zentrog:matrix.org 09:09@rebolek: That is actually not true. XML elements can contain any number of text and inner elements. In practice, I've only ever seen a single meaningful text section in an XML element, but they can theoretically occur before, after, or interspersed between other elements rebolek 09:16@zentrog:matrix.org sorry, you’re right, I was confused a bit here. zentrog:matrix.org 09:19No worries! And I believe you if you say that it makes more sense to keep them separate. I'm just trying to be helpful if I can 😊 greggirwin 20:02Your input is absolutely appreciated @zentrog:matrix.org. Especially the theory vs practice part. While it might be nice to say we match the theoretical spec, if nobody uses features, we have to ask how much effort to put into supporting them. I'm good with pragmatic implementations as standard, and others can build what they need for special cases. Friday 26th November, 2021 hiiamboris 09:04@rebolek I get some junk output from this: <?xml version="1.0" encoding="UTF-8" ?> <cyclicNameSet type="dayParts"> <cyclicNameContext type="format"> <cyclicNameWidth type="abbreviated"> <cyclicName type="1">zi</cyclicName> <cyclicName type="2">chou</cyclicName> <cyclicName type="3">yin</cyclicName> <cyclicName type="4">mao</cyclicName> <cyclicName type="5">chen</cyclicName> <cyclicName type="6">si</cyclicName> <cyclicName type="7">wu</cyclicName> <cyclicName type="8">wei</cyclicName> <cyclicName type="9">shen</cyclicName> <cyclicName type="10">you</cyclicName> <cyclicName type="11">xu</cyclicName> <cyclicName type="12">hai</cyclicName> </cyclicNameWidth> <cyclicNameWidth type="narrow"> <alias source="locale" path="../cyclicNameWidth[@type='abbreviated']"/> </cyclicNameWidth> <cyclicNameWidth type="wide"> <alias source="locale" path="../cyclicNameWidth[@type='abbreviated']"/> </cyclicNameWidth> </cyclicNameContext> </cyclicNameSet> 09:14this should be it: EmptyElemTag: [ #"<" copy value Name any [S Attribute] S? "/>" (value?: cont-val: copy "") push-stack pop-stack ] 10:30works fine now! I fed [CLDR archive](https://github.com/unicode-org/cldr/tree/main/common/main) to it, no issues found so far 10:31I'm using Morph to convert it into the usable form: >unxml.exe 1.xml ldml [ cyclicNameSet [ #type "dayParts" cyclicNameContext [ #type "format" cyclicNameWidth [ #type "abbreviated" cyclicName [#type "1" ! "zi"] cyclicName [#type "2" ! "chou"] cyclicName [#type "3" ! "yin"] cyclicName [#type "4" ! "mao"] cyclicName [#type "5" ! "chen"] cyclicName [#type "6" ! "si"] cyclicName [#type "7" ! "wu"] cyclicName [#type "8" ! "wei"] cyclicName [#type "9" ! "shen"] cyclicName [#type "10" ! "you"] cyclicName [#type "11" ! "xu"] cyclicName [#type "12" ! "hai"] ] cyclicNameWidth [ #type "narrow" alias [#source "locale" #path "../cyclicNameWidth[@type='abbreviated']"] ] cyclicNameWidth [ #type "wide" alias [#source "locale" #path "../cyclicNameWidth[@type='abbreviated']"] ] ] ] ] 10:38found issues on other data though ;) 10:47@rebolek your assumption on spaces count is wrong in most cases, e.g. STag: [#"<" copy value Name any [S Attribute] S? #">" push-stack] fails on: <attributeValues elements='dateFormatLength timeFormatLength dateTimeFormatLength decimalFormatLength scientificFormatLength percentFormatLength currencyFormatLength' attributes='type' order='given'>full long medium short</attributeValues> 10:49this should fix it: S1: charset reduce [space tab cr lf] S: [some S1] S?: S*: [any S1] 11:23consider also input like this: <numberingSystem id="adlm" type="numeric" digits="𞥐𞥑𞥒𞥓𞥔𞥕𞥖𞥗𞥘𞥙"/> <numberingSystem id="ahom" type="numeric" digits="𑜰𑜱𑜲𑜳𑜴𑜵𑜶𑜷𑜸𑜹"/> <numberingSystem id="arab" type="numeric" digits="٠١٢٣٤٥٦٧٨٩"/> <numberingSystem id="arabext" type="numeric" digits="۰۱۲۳۴۵۶۷۸۹"/> I have no idea why they emit some symbols using UTF8, and others using hex-encoding, or if such hex-encoding is standard in XML, but I had to manually turn it into strings. Probably what you were doing with your to integer! to issue! stuff. greggirwin 19:23Good work @hiiamboris. I like unxml, but maybe RexML (pronounced Wrecks-ML) would offer a small, subliminal commentary. ;^) hiiamboris 19:43:) Saturday 27th November, 2021 rebolek 11:35@hiiamboris thanks, I'll look at it. The current rules are mostly the original EBNF rules translated to Red and are expected to fail. It's xml2.red for a reason, until it will be on pair with xml.red. Monday 29th November, 2021 rebolek 06:46@hiiamboris the space problem is caused by direct translation from EBNF. Thanks for your fixes, I’ll have a new version soon. 07:03@hiiamboris S? is opt and S* is any so they shouldn’t be aliases. But maybe using S* everywhere where the specs have S? would be a good idea. 07:18If we could get Rebol-like parsing mode which would skip whitespace between rules automatically, it would simplify the rules very much. hiiamboris 07:33> @hiiamboris S? is opt and S* is any so they shouldn’t be aliases. But maybe using S* everywhere where the specs have S? would be a good idea. what's the point of opt any rule? any is already optional 07:35(I get that EBNF is just a mental toy that everyone on the web writes to look cool but no one uses, so it's never correct) rebolek 07:48Where do you see opt any rule? If you look at the current version, it says : S?: [opt S] S*: [any S]. However, it probably makes sense to just ignore the EBNF rules and replace them with something that is working. Like S* everywhere and forget about it. pekr 07:49Forget formal specs, if those are not being followed by the outer world. Just make a note to particular rule, where it diverges from EBNF and call it a day .... rebolek 07:51The problem here are whitespaces and as I wrote, having the Rebol-like parsing mode would make the problem go away automagically. The other option is to put S* (or whatever name you choose for the whitespace rule) basically everywhere. hiiamboris 07:54> Where do you see opt any rule? If you look at the current version, it says : S?: [opt S] S*: [any S]. opt S is deeply wrong because it makes spaces significant. One space - syntax works, 2 spaces - it's broken :) 07:54that's why I replaced it with any S rebolek 08:00I agree, I'm just saying that what's in the specs. I'll replace everything with S* and we'll see. 08:13Done, all S and S? have been replaced with S*. @hiiamboris can you please test it with the problematic data? hiiamboris 08:30You can't just replace S with any S. It's a required space, so it should be come some S rebolek 08:35Ah, that's what happens when I forget my morning tea. hiiamboris 08:50(: rebolek 09:00Ok, changed, I hope it's fine this time and now I'm going to make the tea. hiiamboris 09:06:+1: rebolek 14:46XML encoder added. 16:55encoder now supports /pretty for more readable output. pekr 17:05Couldnt it be pretty by default and somehow more packed for other purposes? rebolek 17:07It could but the question is if most of XMLs are read by people or machines. If by machines, having pretty as default would be just a waste of space(s). pekr 17:09For over 20 years I can hear about xml being for machines to talk yet all I can see is programners stearing at its output 😃 rebolek 17:15Well if I open the XML in for example Firefox, it will pretty-print it for me, I guess IDEs can do it too, so I 'm really not sure if it should be the default, but I can take a look how others do it. zentrog:matrix.org 17:25I like the dense output being the default. During development, 'pretty' is useful to have, but for normal usage, it isn't generally needed. I guess it depends on the particular use case. Some XML is edited by humans, others are mainly processed by machines. rebolek 17:26@zentrog:matrix.org yes, that's my feeling too. pekr 17:53When prototyping, I use console. I want to prettify it by default. Why bother with Red object output, then? Let's flatten it then. rebolek 18:12Thanks for your input. It's still a work in progress and many details can be changed. Actually even the format of XML representation in Red is not set in stone but a subject to debate. pekr 18:15Well, maybe some hofs could allow formatting (e.g. probe, form, etc.), but not sure. It is a no big deal, but I am versed on adding tonnes of refinements. E.g. yours prettyis not used anywhere in Red yet, so let's give it a few thoughts, and as I know @greggirwin, he tends to be very carefull in introducing new naming schemas :-) rebolek 19:16I'm thinking about how to handle XML namespaces. The obvious solution would be to translate them to path!. This has one downside, in some cases you won't be able to access values using path notation. However, the path notation isn't that useful anyway, let's for example look at this: <menu> <item id="1">one</item> <item id="2">two</item> </menu> Using menu/item would return only the first item anyway, so some XPath-like dialect is certainly a much better solution to access values. So IMO translating namespaces to paths is the way to go. 19:25However, there's still one problem with paths - namespaces can be used in attributes too and attributes are currently converted to map! where you obviously cannot use path! as a key. hiiamboris 19:28sift data/menu [/item] is all it takes to extract those items 19:30okay, with your complex layout: >> rejoin sift data/menu [('item) x - ..] == "onetwo" 19:35I think path inside path is a landmine, and we should just recreate the namespace structure if we want to keep it 19:35do you have examples of namespaces ? zentrog:matrix.org 21:14@hiiamboris: https://gitlab.com/rebolek/markup/-/blob/main/data/menu.xslt hiiamboris 21:17I don't know xml enough to interpret that :D zentrog:matrix.org 21:20I've spent a bit of time looking/thinking about the locate/sift functions. I like the idea of having a common pattern dialect. I don't think I have the full picture of what you can do with those, but the thing that stood out to me was that sift seems to be used to filter a flat data structure, while xpath is sort of like filesystem globbing + predicate filtering, so it's tuned for a tree structure. hiiamboris 21:21Yes. But a tree + an iterator (that defines visiting order) = linear sequence. 21:22Again, I've zero idea about XPath and it's uses :) 21:23So... can't know what's best approach in Red for that zentrog:matrix.org 21:23I'm not sure if sift is good at walking trees like that, or if it would make sense to have a sibling method that would handle like a path with patterns at different layers. I still want to spend some more time looking at them, but haven't been able to yet 21:24I'll try to find some good non-trivial examples of things you can do with it hiiamboris 21:25:+1: zentrog:matrix.org 21:26namespaces are imo the worst feature of XML. There is never a situation where you couldn't work around not having them, and they introduce a lot of complexity to work with (though they are not all that complex really) 21:27from the xslt example, xmlns:xsl="http://www.w3.org/1999/XSL/Transform" this defines a 'prefix' xsl which corresponds to the http... namespace 21:27So for all the children within that element, if you use that prefix xsl:output it is saying that the output element is in the xsl transform namespace specified above 21:29It's just used to differentiate different elements that have the same name, but are from different systems, like if you were going to randomly mix xml from separate systems I guess. A real use case where you would actually need this eludes me 21:30The annoying thing if you care about what which namespace goes to which element, the prefix can be whatever the XML document author decides, so some editors will just call them p1, p1, etc 21:32Most of the time, if you know what you are working with, you can assume all the documents use the same prefix, but there could be scenarios where that is not the case. I guess just having it loadable somehow would be fine for a great deal of cases 21:49It's kind of interesting that foo:bar is a valid url! type, but maybe not the best thing to work with in paths greggirwin 21:53The dual nature for HOFs targeting series and trees is a point of leverage, but may not be something we can unify completely. Just as blocks/maps/objects don't quite line up in all use cases. We'll do the best we can. 21:54> There is never a situation where you couldn't work around not having them This is *key*. If people *can* work around not having them, or adding pieces to support them at another level, we should be OK. zentrog:matrix.org 22:34Maybe the ns prefix could be treated as a special attribute, so it could be checked if needed. It’s a little more awkward that attributes can have namespace prefixes as well Tuesday 30th November, 2021 zentrog:matrix.org 07:44It could be stored inside the element as some sort of attribute, as a take off of @hiiamboris 's example >> test: [element1: [@ "ns-prefix" ! "text" element2: ["text2"]]] >> test/element1/@ == "ns-prefix" then you'd have the base element name by default, but could check the prefix name if needed 07:50I think that most of the time the prefix can just be ignored, and gets in the way more than anything, but if you do need it, you really need it. The thing I was saying about "never a situation where you couldn't work around not having them", what I really meant was from a schema designer's perspective. For instance, restructuring things to avoid collisions. But if you are producing XML for someone else's schema, the xml you generate will need to have the proper namespaces defined rebolek 07:58It’s not a bad idea, however, with all these @ and ! it starts to look like an alphabet soup, Perl or Regex. If we’re going to use this format I wonder if using more verbose words, like namespace and content. They would take the same amount of memory but would directly imply what they represent. @hiiamboris wrote: > /! implies we want content, not a branch, and short enough not to be annoying But looking at this after a few days, I find it annoying, because I have no idea what ! is. And with the introduction of another sigil, I’m getting lost completely. zentrog:matrix.org 08:06Yeah, I just meant it as an example. The tricky part of more descriptive names is that they can't be potentially valid element names rebolek 08:07Of course, the structure then would need to be different. zentrog:matrix.org 08:08I guess a related question is how much path lookup should be optimized for. In the simplest cases, it would be so nice to make it really easy to look up specific values rebolek 08:09The path access makes sense only when each key in the tree (axis) is unique. If you have two keys with same name (as item in my menu example above), path access is useless. hiiamboris 08:16@rebolek content will collide with XML elements, while ! is an invalid XML element. 08:17nvm, already mentioned :) 08:18if I have 2+ items with the same name, I just *filter by given path* then join. pekr 08:31I am with @rebolek here. Don't like crypting things to which you need a manual to work with. But as whatever word chosen might collide with the element name, not sure what would be optimal to do. But if we proceed with !~"^#@'?$ stuff, then let's scrap parse altogether and use just regexp. It will scare away many users to come :-) rebolek 08:34> I just filter by given path If I’ll have some filter function for XML, I can use path! as an argument there, even if the inner structure can’t be accessed using paths. hiiamboris 08:44Well, you can do that even for the plain XML. Goal here is to present it to reducers in the simplest form possible. Form that'll be pleasant to work with. 08:50For namespaces, would it be possible to use /#xmlns accessor? I think valid xml elements can't start with xml zentrog:matrix.org 08:56I don't think there are any keyword-like limitations like that. rebolek 08:58No, they can’t start with numbers and some other chars, but they can start with xml 08:59> Goal here is to present it to reducers in the simplest form possible. Form that'll be pleasant to work with. Those are two goals and they can be opposite ;-) hiiamboris 09:03![](https://i.gyazo.com/157ddff0066c9f8e6110de2977f78a7e.png) 09:04We can also exploit that elements can't start with .. E.g. .content. 09:04But then how is it better than !content, and how that is better than ! is beyond me. 09:07I favor shorter because it will be used *a lot*. I hate verbosity of XML paths. E.g. what is this tree/ldml/numbers/currencyformats/currencyformatlength/currencyformat/pattern/count? It occupies the whole editor line, leaving no space for functions or anything. zentrog:matrix.org 09:07To be fair, we already have all the syntax of [#()]. I don't think we need to be afraid of the other datatypes, if it ends up looking clear enough rebolek 09:08That verbose path can be accessed using XPath as /tree//count. We need a similar mechanism. 09:08That’s why I don’t care about mapping XML paths to Red paths that much. hiiamboris 09:21will it have to scan the whole XML tree to find that item? 09:22do we need to create an *index* for that tree for faster operation? rebolek 09:26What the above example does is to return all elements named count that are childer or (grand)*childern of tree. So yes, it needs to scan whole tree. 09:26We can probably create index on the fly and cache it, if we feel the need. hiiamboris 09:28complexity identified! :) options: 1. destroooy!! 2. slip away 3. embrace it.. let it crawl in.. rebolek 09:28It’s XML. It’s complex by definition :-) hiiamboris 09:28:D greggirwin 19:44I will chime in just on ! as a content accessor. It's not Reddish in that we *try* to use words when we can. ! also already has a strong meaning as a datatype suffix, so has to be learned as not type related in this context. If it does appear in the data structure as a key, that softens the blow. @hiiamboris mentioned that the lexer would need to be updated for one of his ideas. We should not do anything that requires such changes, unless they are lexer issues to begin with. 19:47@zentrog:matrix.org, do you know which XML libs are highly regarded, and anything we might learn from them? zentrog:matrix.org 20:02@greggirwin: Not really. I've mostly used what's built-in to .net. MS has two APIs for doing it, and they seemingly support every feature of XML. There is also object serialization. The newer API is based on LINQ, and is a lot nicer to use, but I think Red will already be way past that in terms of ease of use. I don't think their designs share a lot of the same goals probably... 20:04Maybe not goals, but priorities? Thursday 2nd December, 2021 rebolek 09:44My current feeling for handling namespaced keys and attribute names: - convert them to path!, select/only can be used for easy access - for attributes, use block! instead of map!, that way attribute names with namespace can be converted to path! also This has a minor disadvantage in that it would be visually harder to distinguish content from attributes as both would be block!. I believe it’s a small price to pay. I will implement it and test it to see how it works. I’m open to any ideas and suggestions. Also, I try to implement it in a way, so the parser would be output format-agnostic and we could replace the emitter easily. So if we decide to use some different format, it should be easy. Oldes 10:22Isn't easier and much more lightweight to use string-based parse to get data from XML files? At least that is what I did last 20 or more years. rebolek 10:29@Oldes I’m not sure what you mean. The parser is of course string based, what I’m talking about is the result format in Red. If you’re looking for one value is a specific XML file, you can probably write some throwaway oneliner, but if you want to handle various XMLs in Red, then you need some XML codec. hiiamboris 10:31Block is an improvement over maps, because each map is 4kB of extra RAM. rebolek 10:36Another good thing :-) hiiamboris 10:42But as you already know I don't like the whole structure: [ "menu" [none "234567^/ " none "item" "one" #( "id" "1" ) none "123456^/ " none "item" "two" #( "id" "2" ) ] #() ] And prefer this instead: [ menu [ ! "234567^/" item [#id "1" ! "one"] ! "123456^/" item [#id "2" ! "two"] ! "012345^/" ] ] That is: - trimming of trailing spaces (but not of trailing newlines) - attributes together with the data, leveraging Red's type richness - ! sigil to get data from elements (we can of course use none like you're doing today, but I don't think none is any better in readability and usability) You have a regression btw - words became strings. Also last value disappears from the input (in xml2.red all values were disappearing): <?xml version="1.0" encoding="UTF-8" ?> <menu> 234567 <item id="1">one</item> 123456 <item id="2">two</item> 012345 </menu> rebolek 10:44! is really confusing. hiiamboris 10:44none isn't? rebolek 10:44However, I'll try to implement an emitter for your format too. hiiamboris 10:45That's the spirit! ☻ rebolek 10:46maybe something like content: instead of ! and namespace: so tag names won’t have to be path!s if you don’t like them? also there’s a problem with your format, if you use issue! for attribute names, they can’ have a namespace. hiiamboris 10:48Also, what do you have against grouping namespaces in an extra block? That is: namespace [ #x "1" #y "1" ] instead of #namespace/x "1" #namespace/y "1" ? rebolek 10:50ok, that is a possibility hiiamboris 10:51I find b/x/y more Reddish than b/('x/y): >> b: [x/y 1] == [x/y 1] >> b/('x/y) == 1 Besides, if we later build an index for faster access, lookups by path key cannot be hashed. It's linear search. rebolek 10:55that grouping would work for attributes, but not for tags. For tags, you still need some mechanism how to cope with namespaces. hiiamboris 10:57why doesn't it work for tags? rebolek 11:02because it would mess order in some cases hiiamboris 11:02have an example? rebolek 11:04 <ns1:a>1</ns1:a><ns2:a>2</ns2:a><ns1:a>3</ns1:a><ns2:a>4</ns2:a> would become ns1 [ a 1 a 3 ] ns2 [ a 2 a 4 ] if I understand your proposal correctly. hiiamboris 11:06I see, thanks 11:07idk if it is desired or undesired effect though 11:07what about holding namespace as a kind of special attribute in the tag, like @dander proposed? rebolek 11:08Yes, that’s a possibility. 11:09In tags I believe it’s undesired effect as it would mess the document structure that is ordered. In attributes I guess it doesn’t matter. hiiamboris 11:09 a [#xmlns "ns1" ! 1] a [#xmlns "ns2" ! 2] a [#xmlns "ns1" ! 3] a [#xmlns "ns2" ! 4] pekr 12:58While I did not like syntax of Morph much, I surprisingly like most of the suggestions here made by @hiiamboris. I tend to be in favor of consistency, but I must not affect readability. Using none and maps seems to be messy. Prefer blocks and ! 13:02I have to admit thought, that I strongly hate how maps look visually. Can't stand parens there and wonder, idlf that's just me :-( Imo #[map here] or some other block form using @ or ! followed by block, would be more reddish. hiiamboris 13:10That's what Gregg pushes for too. rebolek 14:12I have first version of modular emitter, it now supports both my versions. I will implement Boris' format as a next step, however, I'm going to replace ! with something verbose and sane. hiiamboris 14:16but it will conflict with element names then, no? rebolek 14:32It won't, it would use a different type hiiamboris 14:41set-word? rebolek 14:59I guess so. 15:00I’ll have a prototype by tomorrow, so we can discuss it then. Now I need to leave. hiiamboris 15:03set-words and words aren't distinguished by paths, so it will conflict zentrog:matrix.org 17:49What about something like @text, @ns? Could also use that for things like @cdata, @comment if those are wanted hiiamboris 17:56:+1: zentrog:matrix.org 17:59I don't like using the namespace prefix in the path lookup, because it's possible to have documents from different sources that pick different prefixes for the same namespaces. <xml xmlns:ns1="foo"><ns1:bar/></xml> <xml xmlns:ns2="foo"><ns2:bar/></xml> Both of the 'bar' elements are in the "foo" namespace, but you would be forced to look up the prefix for that namespace, and calculate the correct path. Either of xml/ns1/bar or xml/ns2/bar. It's possible that you would need to differentiate via namespace anyway, but in my experience, it's almost always fine to just ignore it greggirwin 19:42One thought I have on ref! is a string type. Since attributes are used throughout a document, the same names may appear a *lot*. In that case, word types should offer a significant benefit; as long as we accept word syntax limitations, which I think was an earlier conversation. I love working from concrete examples, as we are doing in chat here. Does it make sense to take a small XML file as a common source and mock the Red structure for it, along with examples of how you access things? Then it's apples to apples. That's kind of what I did long ago, which is now part of https://gitlab.com/rebolek/markup/-/wikis/home. I keep scrolling back here to see what if new examples use old XML as their source. Having a modular emitter is cool, and may let us play with output options quickly. When the time comes, we need to define which one Red considers standard, for other tools that access the structure. Friday 3th December, 2021 rebolek 08:30I agree with @greggirwin that we should use any-word! type instead of any-string!. I should have a prototype of the alternative output today, so we can play with it then hiiamboris 08:40But any-word won't work in paths, and any-string will. 08:41Though yes, any-string will occupy 2-3 times the memory (still nothing even nearly compared to maps). 08:45Oh by the way, if you use the *same* any-string as key, it won't be bigger than the word. rebolek 08:46True. But that would be harder to implement. I’ll see. hiiamboris 08:47Just declare it context-wide as you usually do, and do not copy? 08:48The only issue is after save + load it's going to become bigger. Unless Redbin is used. 08:51Still, I'm not convinced that @text is a win over !text or just !. I'm just *okay* with all these variants. rebolek 08:51:P that’s what contexts are for 08:52@text is a win over ! because you immediately know what it means. pekr 08:53what type is @text? Isnt it a planned ref? hiiamboris 08:53@rebolek Yes, but you have to type it *every* time you access a key. It becomes a buzzword. 08:53@pekr It's a @ref yes pekr 08:54I know, but, does it serves the right purpose here? hiiamboris 08:54To us, right purpose is to distinguish it from XML elements. Any other purpose you have in mind? greggirwin 18:10Using strings and not copying them will either be a recipe for disaster or a brilliant feature. I can't say which. The fact that the behavior will change entirely when saved/loaded leans toward disaster. The idea that you could do simple field renaming by changing one instance leans toward clever feature. Taking steps to avoid disaster is always good though. 18:11> But any-word won't work in paths, and any-string will. Wont' a plain word! work? 18:16! is used in XML for comments and CDATA, which may make it confusing if we repurpose it. There will be a lot of people coming from that side, rather than the Red side, and they may think it's used as XML would. 18:16> what type is @text? Isnt it a planned ref? @pekr ref! has been around for some time now. 18:23I'm OK with the solution that gives us the best *usability*. As I noted to @rebolek in other chat: > As long as we're not 20x less efficient than a .NET or Java model, I'm OK with that. :^) If we think about how it may be used, there will likely be people who try it, see that it loads, and then just use the codec structure directly for all their work, because they aren't moving away from XML (yet), or need to emit it again. Over time, I hope people will use the decoder, transform it into better structures in Red, then keep it in Red. So if the codec's output structure is a little clunky to use, we can absolutely blame XML and show how much better life is once you can move away from it. But that move will never be 100%. Some people and systems will stick with XML, and if we can make their lives a little better, being part of the solution, that's still a win. Monday 6th December, 2021 rebolek 11:42@hiiamboris I am working on the emitter based on your format and I’m currently implementing the damned namespaces. Here’s an idea. What about refinement? So "html:a" would end up as a /html. I know it looks strange backwards, but it uses a special type for the namespace that is also word-based, so more efficient than a string. And it doesn’t need some special markup such as @ or namespace:. What do you think about it? hiiamboris 11:46I'm still noob when it comes to namespaces :) Why not /html a? Will this a be used in paths? 11:47Is it going to ruin the otherwise straight key-value ordering? rebolek 11:47Yes, this way you can use a in path and yes, it would ruin the ordering in case we want to have key name first. hiiamboris 11:49Can you show how it looks on a simple example data? rebolek 11:49Because refinement may look silly for a namespace, which is above tag name in the hierarchy, we can switch types of namespaces and attributes names, so parsed tag would look like: tag-name #namespace /attribute "att value" "content" 11:51 >> print read %data/namespace1.xml <?xml version="1.1"?> <html:html xmlns:html='http://www.w3.org/1999/xhtml'> <html:head><html:title>Frobnostication</html:title></html:head> <html:body><html:p>Moved to <html:a href='http://frob.example.com'>here.</html:a> </html:p> <html:p>Done by <html:a href='http://examle.com'>example.com</html:a> </html:body> </html:html> >> print mold load-xml %data/namespace1.xml [ head /html [ title /html "Frobnostication" ] body /html [ p /html ["Moved to ^/ " a /html #href "http://frob.example.com" "here." ] p /html ["Done by ^/ " a /html #href "http://examle.com" "example.com" ] ] ] hiiamboris 11:58this won't let me access it using paths 11:58/html head would work though 12:00and of course I need to access the content using paths rebolek 12:00If you have an attribute there, it won’t let you use paths either. Even if you switch the order body/p/a won’t return a’s value. And of course it’s usable for first a only, in case there would be multiple tags. hiiamboris 12:01first a is fine for the majority of use cases rebolek 12:01If you so insist on path access, then the order should be hiiamboris 12:02let attributes be inside a [..] like I proposed originally 12:03and /html won't hurt if it's before a, and I can just happily ignore it rebolek 12:03but then you need to prepend some markup to differentiate between content and attributes hiiamboris 12:03and we get back to the question of ! vs !text vs @text vs @ :) 12:04see, Red has facilities to work with it's data structures if we don't structure our data properly we have to invent kludges to access it but why? 12:05the data structure I proposed, so far perfectly works for my CLDR extraction tasks rebolek 12:12Why not text:? 12:13> let attributes be inside a [..] like I proposed originally That’s not solving the access problem if attributes would be before content. hiiamboris 12:15> Why not text:? Because there may be a subtag "text". rebolek 12:16Ok, so we’re back to problems with path access that’s obviously not a good fit for XML data :) hiiamboris 12:17Again. It works most of the time :) When it doesn't, I can iterate. 12:17But I clearly don't want to iterate over each path element. 12:19E.g. I don't want to write 10+ loops to get the data from tree/ldml/dates/calendars/calendar/gregorian/months/monthcontext/stand-alone/monthwidth/abbreviated/month rebolek 12:20I’m not sure if should optimize for one use-case. But OK, I’ll change the emitter and show you the new structure. pekr 12:21Maybe we need to introduce another forms like ![ ], @[. ], 16#[. ], Hash![. ]. Simply put, default is block, coul be literal forms, binary, hash, whatever. Kill the parens fornother thing than computation, evakuation precedence 🙂 12:21evakuation = evaluation. hiiamboris 12:22what will it solve though? rebolek 12:22I also can use paren! for attributes, that way I don’t need some markup to make it obvious it’s not content. 12:27Here’s the new structure. It uses issue! for namespaces and refinement! for attribute names as it looks more logically this way. It also puts attributes after the content so path access works (for first item only): [ #html head [ #html title "Frobnostication" ] #html body [ #html p ["Moved to ^/ " #html a "here." /href "http://frob.example.com" ] #html p ["Done by ^/ " #html a "example.com" /href "http://examle.com" ] ] ] hiiamboris 12:29No, make /html for namespaces and #href for attributes, otherwise we'll have to type body/p/(/href) to get the attribute contents. rebolek 12:30:rolls eyes: pekr 12:30Why cant multiple elements be always in block? Would that create too many sub blocks? rebolek 12:31I’m not sure I understand, they are in block. 12:32In the example above, body has children, so the content is block!. a doesn’t have children, so the content is string! 12:34@hiiamboris changed, I still need to implement support for namespaces in attribute names, but that should be straightforward as it would use same mechanism as tag names: /tag-namespace tag-name "content" /att-namespace #att-name "att-value" hiiamboris 12:41:+1: rebolek 12:58@hiiamboris Pushed. You can change the output type with xml/output-type. Supported values are wbm (word, block, map - I’ll probably remove it as it’s too limited). wbb (word, block, block) and boris (I wonder why it’s called that). hiiamboris 13:05:) 13:05thanks! 13:08still, the biggest issue with CLDR is aliases linking to other aliases linking to other aliases.. :D I guess it's not a standard XML thing, is it? rebolek 13:09Can you show me an example? hiiamboris 13:11Sure 13:11 months [ monthContext [ format [ monthWidth [ abbreviated [ alias [source "locale" path "../monthWidth[@type='wide']"] ] narrow [ alias [source "locale" path {../../monthContext[@type='stand-alone']/monthWidth[@type='narrow']}] ] wide [ month [ 1 "M01" 2 "M02" 3 "M03" 4 "M04" 5 "M05" 6 "M06" 7 "M07" 8 "M08" 9 "M09" 10 "M10" 11 "M11" 12 "M12" ] ] ] ] stand-alone [ monthWidth [ abbreviated [ alias [source "locale" path {../../monthContext[@type='format']/monthWidth[@type='abbreviated']}] ] narrow [ month [ 1 "1" 2 "2" 3 "3" 4 "4" 5 "5" 6 "6" 7 "7" 8 "8" 9 "9" 10 "10" 11 "11" 12 "12" ] ] wide [ alias [source "locale" path {../../monthContext[@type='format']/monthWidth[@type='wide']}] ] ] ] ] ] 13:12These bastards. stand-alone/abbreviated links to format/abbreviated which links to /format/wide 13:13I'm so happy to jump all over the tree for them :) rebolek 13:19There’s nothing about alias in the specs so it must be their own invention which I believe they are very proud of. hiiamboris 13:21yeah no kidding 14:53@rebolek no newlines anymore? :) rebolek 14:55@hiiamboris Ah, I need to fix it. The newline logic is now more complicated and currently works only for namespaced tags. I’ll push a new version soon. hiiamboris 15:02Smth doesn't add up here. Input: <?xml version="1.0" encoding="UTF-8" ?> <identity> <version number="$Revision$"/> <language type="root"/> </identity> Output (prettified): [ identity [ version "" #number "$Revision$" "" language "" #type "root" ] ] rebolek 15:03It’s actually the supposed output based on current rules. 15:03As the tags don’t have content, there's "". 15:03Maybe none would be better in such case? hiiamboris 15:04I expected: identity [ version [#number "$Revision$"] language [#type "root"] ] rebolek 15:06Ok and what do you expect from this input: <?xml version="1.0" encoding="UTF-8" ?> <identity> <version number="$Revision$">1.0</version> <language type="root"/> </identity> I added some content for the version tag. hiiamboris 15:07we discussed it like 100 times already ;) identity [ version [#number "$Revision$" ! "1.0"] language [#type "root"] ] or whatever sigil you insist on rebolek 15:08My current solution is that content comes first and attributes follow. 15:09So my idea is identity [ version ["1.0" #number "$Revision$"] language ["" #type "root"] ] 15:09Or none instead of the empty string!. hiiamboris 15:09No, ! is vastly preferable to numeric index or none. rebolek 15:10By you. hiiamboris 15:10Yes. pekr 15:12We should write some visual tool to enable users to define their preferrable XML outputter :-) hiiamboris 15:12Also, I thought about your idea of here -> a "here". It's not gonna work. E.g. I may have herethere and it will produce: list [a "here" a [#type "b" @bolek "there"]] This will be impossible to work with as there will be separate logic depending on whether an attribute is present or not. The input was uniform so the output should be uniform as well: list [a [@bolek "here"] a [#type "b" @bolek "there"]] pekr 15:12Keep the good work guys, it is interesting to watch! hiiamboris 15:13:) rebolek 15:14@hiiamboris I don’t understand. What separate logic? Also, it doesn’t look like anything I want to produce, there’s ! in it ;-) hiiamboris 15:14ok I'll change ! 15:15better? :) rebolek 15:15:D hiiamboris 15:16separate logic because I can't for-each [('a) b [block!]] list [..] anymore rebolek 15:16With my position-based content, it would be list [a ["here"] a ["there" #type "b"]] I’m not against having a block always present hiiamboris 15:16I don't like magic numbers. 15:17Besides, if attributes go after the content, the output becomes impossible to read because content may be hundreds of kBs. rebolek 15:17That’s not an argument, there may be hundreds of attributes too. hiiamboris 15:18I'd love to see that. What I'm talking is real XML files. rebolek 15:23You don’ like magic numbers, I don’t like magic sigils. And it’s actually not a magic number. What we’re producing here is a dialect that has few simple rules and one of them is that content always comes first before attributes. I’m not saying it’s the best rule and I hope we can come up with something better but I don’t believe ! is it. hiiamboris 15:24I do :) 15:24Why? Because I can compare XML to Red output visually and tell if it's okay or not. 15:25Why else? Because I can look at the Red file contents and figure how to access this or that thing, without jumping to the end of the scope somehow. rebolek 15:32Newlines have been fixed. Next steps: - content will be always a block and attributes would be part of it - add an alternative emitter (or a switch to the Boris emitter) that would hide content behind an accessor instead of putting it proudly in the first place pekr 15:33Guys .... couldn't we just ... agree to disagree? I thought, that's why we are prototyping various outputs? Sometimes just simple look into a list of examples show, how much you (dis)like to read it. You will e.g. realise, that you are overloading the look with some repetitive patterns you might be able to remove by a slightly different aproach .... rebolek 15:34@pekr that’s why the current XML implementation has an option to switch between various emitters, so we can try them and see what’s the best fit. pekr 15:48I know, but I somehow got a feeling that you kind of fight against the @hiiamboris proposal in terms of "his" emitter? :-) OK, will let you work and watch the outcome .... rebolek 15:50No, I like some of his ideas and I don’t like some too. I will implement them anyway so either I can say "hah, I told you so", or be convinced they weren’t bad. 15:51I call it his emitter just because it’s based on his ideas and I don’t have a better/more descriptive name yet. My emitter is called wbb because its structure is word-block-block. The other emitter has more free form structure, so I can’t choose some similar simple name. As always, I’m open to suggestions. hiiamboris 15:53I knew there will be Boris emitter a few days before you coded it :D 15:53On a different thing. I would also like some smart prettification algo for the future. For example here's what I'm working with: types [ type [#key "calendar" #type "buddhist" ! "буддийский календарь"] type [#key "calendar" #type "chinese" ! "китайский календарь"] type [#key "calendar" #type "coptic" ! "Коптский календарь"] type [#key "calendar" #type "dangi" ! "календарь данги"] type [#key "calendar" #type "ethiopic" ! "эфиопский календарь"] type [#key "calendar" #type "ethiopic-amete-alem" ! "Эфиопский календарь "Амете Алем""] type [#key "calendar" #type "gregorian" ! "григорианский календарь"] type [#key "calendar" #type "hebrew" ! "еврейский календарь"] type [#key "calendar" #type "indian" ! "Национальный календарь Индии"] type [#key "calendar" #type "islamic" ! "исламский календарь"] type [#key "calendar" #type "islamic-civil" ! "Исламский гражданский календарь"] type [#key "calendar" #type "islamic-rgsa" #draft "contributed" ! "исламский календарь (Саудовская Аравия)"] type [#key "calendar" #type "islamic-tbla" #draft "contributed" ! {исламский календарь (табличный, астрономическая эпоха)}] type [#key "calendar" #type "islamic-umalqura" #draft "contributed" ! "исламский календарь (Умм аль-Кура)"] type [#key "calendar" #type "iso8601" ! "календарь ISO-8601"] type [#key "calendar" #type "japanese" ! "японский календарь"] type [#key "calendar" #type "persian" ! "персидский календарь"] type [#key "calendar" #type "roc" ! "календарь Миньго"] type [#key "cf" #type "account" ! "финансовый формат"] type [#key "cf" #type "standard" ! "стандартный формат"] type [#key "colAlternate" #type "non-ignorable" #draft "contributed" ! "Сортировка символов"] type [#key "colAlternate" #type "shifted" #draft "contributed" ! "Сортировка без учета символов"] (...) It's mostly nicely aligned and I can visually analyze the data. But it's tricky and experimental. Right now I settled upon this rule: if block has no more than 8 items (4 pairs) and no other blocks, then I can remove newlines from it. Other idea I had is to mold part of the block, e.g. 100 chars, and if it's shorter than 100 chars, then strip newlines. rebolek 15:55Such smart prettification probably should be separate project as it’s generally useful. hiiamboris 15:56Could be.. pekr 15:56I have noticed some prettifier in terms of HOFs? hiiamboris 15:58There's only an old prettify experiment of mine. It was written for *code*. But now that I think of it, maybe it can work with data separately too. 15:59The big question is, what rules to code into it :) Where they will work and where not. pekr 16:18Unless you try, we might never know :-) hiiamboris 17:01I'm trying but it crashes :) 17:04I'm glad we have trace now 17:09I broke Red again https://github.com/red/red/issues/5003 17:40OK [pushed a new version](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/prettify.red) 17:41For our case it's prettify/data GiuseppeChillemi 23:40I have a design curiosity. Why to get a value in a map you have chosen: select map 'column and it has not been used pick map 'column? Tuesday 7th December, 2021 rebolek 06:18PICK - Returns the series value at a given index. There’s no index in map, as they are unordered. 09:56@hiiamboris I guess this is what you want? [ cyclicNameSet [#type "dayParts" cyclicNameContext [#type "format" cyclicNameWidth [#type "abbreviated" cyclicName [#type "1" ! "zi"] cyclicName [#type "2" ! "chou"] cyclicName [#type "3" ! "yin"] cyclicName [#type "4" ! "mao"] cyclicName [#type "5" ! "chen"] cyclicName [#type "6" ! "si"] cyclicName [#type "7" ! "wu"] cyclicName [#type "8" ! "wei"] cyclicName [#type "9" ! "shen"] cyclicName [#type "10" ! "you"] cyclicName [#type "11" ! "xu"] cyclicName [#type "12" ! "hai"] ] cyclicNameWidth [#type "narrow" alias [#path "../cyclicNameWidth[@type='abbreviated']" ! ""] ] cyclicNameWidth [#type "wide" alias [#path "../cyclicNameWidth[@type='abbreviated']" ! ""] ] ] ] ] hiiamboris 09:58Almost. No reason to leave ! "" though I guess. 09:58At least I removed these and had no problem. rebolek 09:59Ok, it's a WIP. I'll remove them. 10:00ok, removed 10:00I'll run some tests, cleanup the code and push it. hiiamboris 10:01:+1: rebolek 10:02@hiiamboris and what do you expect from this: <a> some text <b att="val">hello</b> </a> hiiamboris 10:07 $ unxml.exe 2.xml a [ b [#att "val" ! "hello"] ] 10:07oops, xml2.red ignored "some text" 10:08should be: a [ ! "some text" b [#att "val" ! "hello"] ] 10:10that is, text and tags may preserve original order 10:10there will be no such thing in CLDR data, but maybe somewhere it will be useful rebolek 10:36I would say that not MAY but SHOULD. Or MUST. GiuseppeChillemi 10:55@rebolek Thank you, I was thinking on which command use to get the Nth column without using index? find words-of table column rebolek 15:25@hiiamboris are you fine with using @ for metadata? e.g.: <!-- Comment --> becomes 15:26 @comment "Comment" 15:30Also, if you have a better name for "your" emitter, just let me know :-) hiiamboris 15:45didn't think about it :) rebolek 15:46It’s strange to write commit messages like "Boris now supports some metadata" ;) hiiamboris 15:46:D 15:47idk yet, maybe Gregg will have any ideas 15:47as for comments, I'm fine without them too 15:48!comment or @comment are okay rebolek 15:49I understand that, but there are other metadata too, like processing information that may be useful for someone. You need to use /meta to get them anyway. 15:50Ok, I’ll use @various-metadata so they can distinguished by type. hiiamboris 15:50sure greggirwin 23:48> also can use paren! for attributes, that way I don’t need some markup to make it obvious it’s not content. This is an interesting idea, as parens in natural language are used for "optional" information. On !, what about text. It's always going to be text, because we're parsing it from XML text, and then if we have a semi-mapped loader there could be data like GUI elements have for the duality of text and data content. ! is just not worth it, long term. Without analyzing *lots* of XML, which I don't think we have time for right now (as a single corpus, or just a few, will bias our results) we're doing a lot of guessing. @dander may have info up his sleeve, and it's worth a search to see if someone has done this, but what are the max/avg/percentile for content and number of tags. @hiiamboris makes a good point about being able to see a) if/how an XML doc maps to Red. Looking at just the result b) can you analyze it in raw form. Then we have c) clean path access for common cases and d) how hard it is to iterate for all possible access. It's all tradeoffs. You know I love being able to see raw data clearly, but this is where it only works for small or prettified data. And you can still miss things. So I think the raw data value is lower. Build good, lightweight tools. Having a standard viewer available is kind of like the editor in R2. Maybe seems a bit heavy, but if it works across data structures it packs a lot of punch. Aspect a (viewable mapping) is also nice, but may also be best served by a diff-like viewer. Maybe the XML module includes all these things, because if you need one, you probably don't care about another 50K in your app. ;^) This brings us to c and d, which is all about how we use and access the data structure. Wednesday 8th December, 2021 greggirwin 00:06This is all really good work, and will make a great writeup, but if we distill it, and update the middle of https://gitlab.com/rebolek/markup/-/wikis/home, where various structure options are listed, what have we learned, and what new options do we need to list there? Watching the chat here, I'm leaning toward a basic, fixed structure that easy easy to reason about, which makes it easier to write processors against, and where HOFs can be applied. The fly in the ointment is multiple values. For those cases, internal parse-based access may be the way to go. I'm OK with saying "Here's how it works, and these are the limitations. If your data is a simple tree of objects, path access works great. Here's how you access attributes. If your data is a document, with repeated sections, use parse-doc which is a dialected func where you can define actions for elements by tag name, ..." Another way to tackle this is to lay out a half dozen use cases for how loaded data will be used, and optimize for those. There are links in the markup notes on other systems that may help. And if we just choose the best or most popular system to emulate, so be it. We cannot solve the problem, fundamentally, because the data model is set in stone. 03:31I'll have to get my head back into XML from the core spec to be any help on thoughts for metadata. rebolek 07:23> what about text The problem with textis that it can be used as a tag name and then you wouldn’t be able to distinguish if it’s a tag name or a keyword. zentrog:matrix.org 08:36The nice thing with json is that it just has maps and lists, and those are well suited for distinct kinds of tasks. The problem with xml is it has more data structures, which are more general so they apply to more kinds of tasks, but are less well suited to all of them. So if you are trying to decide how to generate some schema, you might decide to store keys and values in attributes, or maybe elements and text. Maybe you would base it on humans editing the document and esthetics, or maybe it is machine generated and you just need to accept whatever nightmare it spits out at you. I guess what I'm trying to say is I don't think there are going to be any hard and fast rules for number or size of xml data, and almost certainly someone can come up with some gigantic xml that tips over the system, but they probably should be using a stream-based xml processor anyway. I agree with "basic, fixed structure that easy easy to reason about, which makes it easier to write processors against, and where HOFs can be applied". That should handle the vast majority of cases. If simple path lookup works for cases where there is no ambiguity, that's great! Make simple things easy, and complex things possible, right? 08:43[Flip64.xml](https://gitter.ems.host/_matrix/media/v1/download/matrix.org/adtaKVknEYNpGkKktdnfcUhZ) 08:47Here's a (pretty small) example that an application I work on generates. It can produce documents which have this entire xml embedded within an *attribute* of another xml document. I don't take any responsibility for this 😋 hiiamboris 09:10Scary :) rebolek 10:54@zentrog:matrix.org exactly, why does it allow both attributes and elements if there’s no clear distinction between them? hiiamboris 11:03but such attribute will have to be loaded manually, right? while element gets transformed into a tree automatically 11:03that is, I don't think they meant attributes to hold XML elements :) rebolek 11:08The problem is that the ambiguity. Should I write: <book author="J.R.R.Tolkien" name="Return of the King"/> or <book author="J.R.R.Tolkien"> <name>Return of the King</name> </book> or <book> <author>J.R.R.Tolkien <name>Return of the King</name> </author> </book> or <book> <author>J.R.R.Tolkien</author> <name>Return of the King</name> </book> ? This is of course a made-up example but the difference between attributes and elements is very blurry. hiiamboris 11:14Indeed. pekr 11:18Who's the president of United Nations? I will ask him to vote on prohibiting XML usage around the world :-) rebolek 11:22:) 11:23XML is a shitty format but at least it’s open and standardized. There are other formats that are shitty too but closed and proprietary. If you want to ban something start there ;) pekr 11:29"standardized" is a way too strong claim, but yeah, whatever :-) As for other formats - as far as they are kept being used in closed environments, I don't mind. XML is a typical example of overenginnered commitee kind of work and one of the reasons for JSON existence :-) 11:30But anyway - it is clear we still need it, because we are going to face it quite often, so definitely keep the work :-) dsunanda 11:31@rebolek > but the difference between attributes and elements is very blurry. It is! Technically, attributes can appear 0 or 1 times in an element while elements can appear 0 or more times in their parent element. There is no way to decide whether something should be an attribute or an element if it can appear only 0 or 1 times. In your example, it could be argued that books may have multiple authors and multiple titles - so both should be elements for future-proofing. That argument applies to almost anything you might want to put in XML format. So attributes are not very useful in reality. rebolek 11:50> "standardized" is a way too strong claim No, it’s not. There are two published standards, XML 1.0 and XML 1.1 and XMLs are much more standard conforming that HTMLs. It’s overengineered? I don’t doubt that. But most MXLs can be read with a standard parser, unlike HTMLs, which are full of errors and the parsers must conform to at least the most common errors. 11:52@dsunanda > attributes are not very useful in reality I wholeheartedly agree with it. It just complicates everything. It’s an alternative solution to a problem that was already solved. zentrog:matrix.org 17:35@hiiamboris: Yes, that's exactly right. There is a lot of serialization/deserialization going on. It is wasteful to do this, since all those angle brackets, quotes and other things need to be encoded. In this case, it's really less about the format, and more about preserving application state. We could as well have picked a binary format, though that would be even more opaque. In this case, the biggest influencing factor for getting to this point was probably just the existing tools that were built into the framework for state management. I would say this example is not very typical of an interoperability format, but could still be something I would want to process. greggirwin 17:44@rebolek's example makes @zentrog:matrix.org 's point concretely. You can do things how *you* want, *inside* the standardized format, so there's no way to standardize an interface that will work for everyone. zentrog:matrix.org 17:45Yeah, that was a great example! greggirwin 17:49I can also imagine, though don't know if it's true, that having the attrs before values was done for streaming processing order. That is, if you don't have all the attrs to apply to an element, you have to parse/load the entire element before finding them. 18:00Thanks for that sample file @zentrog:matrix.org. Makes me think that our structure, whatever it ends up being, can't make things too much worse. ;^) On a more serious note, how do you guys edit or manage data like this? Is it *all* machine processed, or do you have tools you like when having to work with raw XML? zentrog:matrix.org 18:09[image.png](https://gitter.ems.host/_matrix/media/v1/download/matrix.org/tjQRXvEhiijHdNEYPmaEKFjZ) 18:09@greggirwin: For serialized stuff like this, it is almost always just machine processed, but I still will look at it sometimes to make sure that changes I think should be in there are actually present. In those cases, pretty printing + code folding goes a long way to make it browsable, so long as it isn't too huge. Here's what that same document looks like in VS Code with the XML Tools extension after formatting and a bit of folding 18:10Helps a lot, right? greggirwin 18:12:^) I stand by my idea that we can build more helpful tools. Thanks for the input @zentrog:matrix.org. :+1: zentrog:matrix.org 18:12For really big nasty stuff that can't be parsed in a reasonable amount of time, or when I was doing more xslt work, I have an old (version 6) of https://www.oxygenxml.com/ which suits me well enough 18:12They went up a lot in price since then, and I never had a compelling reason to upgrade greggirwin 18:13Good to know. We can point people to that if our minimalist tools aren't enough. zentrog:matrix.org 18:17I haven't done any serious survey of similar tools, so take it with a grain of salt. I'm a little shocked to see that it was so long ago. Must have actually been version 8... Thursday 9th December, 2021 hiiamboris 11:31@rebolek there's still the empty string: [ identity [ version [#number "$Revision$"] ! "" language [#type "root"] ] ] input: <?xml version="1.0" encoding="UTF-8" ?> <identity> <version number="$Revision$"/> <language type="root"/> </identity> rebolek 12:03Yes, I’m trying to solve one bug, this must wait. 14:09F*#! The bug was not in the code but in the test file. Anyway, I can move on to the empty string elimination :) hiiamboris 14:52:D rebolek 14:58Fixed. hiiamboris 15:16:+1: GiuseppeChillemi 23:58As select on maps returns just the value, is there a command to have the values together with the key? >> m: make map! [a: 22 b: 33 d: 44] == #( a: 22 b: 33 c: 44 ) >> select m 'a == 22 a command like: >> select-col m 'a == #(a: 22) Or: >> select-col m [a b] == #(a: 22 b: 33) Friday 10th December, 2021 Oldes 07:14Why? 07:53select-col: func[m [map!] key][ make map! reduce [key select m key] ] but to be honest, it is really bad idea use something like this. GiuseppeChillemi 09:00@Oldes It's needed when you wish to make a subset of a table like in SQL: select a, b from table where table has columns a, b, c, d Oldes 09:03 red select-col: func[m [map!] key][ unless block? key [key: to block! key] collect [ forall key [ keep key/1 keep select m key/1 ] ] ] GiuseppeChillemi 09:05Thank you, I was just asking if it was already there but your code is appreciated. Oldes 09:05I don't think something like this will be ever directly there. It is not much efficient. 09:08Btw... although it quite short in Red (#(a: 1)), internally is construction of maps quite complex and you should avoid using too many small maps. At least until maps are not threated as simple blocks internally for small number of keys (not building hash tables). hiiamboris 12:21@rebolek codec eats attributes (missing #source below): [ calendar [#type "buddhist" months [ alias [#path "../../calendar[@type='gregorian']/months"] ] days [ alias [#path "../../calendar[@type='gregorian']/days"] ] ] ] input: <?xml version="1.0" encoding="UTF-8" ?> <calendar type="buddhist"> <months> <alias source="locale" path="../../calendar[@type='gregorian']/months"/> </months> <days> <alias source="locale" path="../../calendar[@type='gregorian']/days"/> </days> </calendar> rebolek 16:44@hiiamboris thanks, I added it to the test suite and will look at the problem. greggirwin 17:54@GiuseppeChillemi @Oldes I don't know if it's a common need, but in R2 I had a number of funcs for making objects based on what words you wanted or not. e.g. remove-words/keep-words. Along with spec block support funcs. Useful for sanitizing and minimizing objects, making from templates, etc. GiuseppeChillemi 20:56@greggirwin Do you have a list of all these commands? greggirwin 21:07No but I just cut a few out into a file. 21:07[R2-obj-word-funcs.r](https://files.gitter.im/600719b0d73408ce4ff93018/U3f9/R2-obj-word-funcs.r) Saturday 11st December, 2021 GiuseppeChillemi 16:43@greggirwin Thank you, nice read! Monday 13th December, 2021 greggirwin 22:43@rebolek what is your confidence rating (0-100%) that both XML and HTML decoders will be ready before end of year? Encoding is a lower priority, though we do want it before too long. And are you settled on a data model for the non-boris output? Tuesday 14th December, 2021 rebolek 06:25@greggirwin XML - 99%. Both XML encoder and decoder are ready, we just need to decide on the data format. I’m now looking for the edge cases and possible problems. greggirwin 18:36On the format, are others OK with what I suggested [here](https://gitter.im/red/codecs?at=61aff716026dc63ca6382936)? hiiamboris 19:39looks reasonable but too vague to say yes or no :) greggirwin 19:48It is vague, but the readme has examples. If it's fixed, it's either [tag attr value] or [tag value attr]. I lean toward the latter for path use. But if if 90% of access is via our API to it and HOFs, it really doesn't matter. hiiamboris 19:53well then you know I don't like either of these formats :) greggirwin 20:06I don't want to scan back through chat here, but will if nobody else does, to add other proposals to the markup notes and list pros and cons. I still don't like ! though. I remember that much. :^) 20:08Or maybe it would be easier, if each of you have a preferred format in your heads, to just list them there, so I don't misinterpret things from ongoing chat evolution. zentrog:matrix.org 21:48I like the general idea of having a key to match on text values. The benefit of ! is that it's short, and it's a word which can't be the name of an xml element or attribute. We could as well use a different data type, or other word which contains a character that xml won't allow. text! would be another option, or @text was also suggested (for example, if we wanted to have a common data type for various xml structural parts). I would be fine with any of these, really. The first time you deserialize an xml, it should be pretty clear what they are for. Being a little more verbose might help with other people reading the source if they aren't familiar with it, or non-reducers hiiamboris 21:55Plain comparison: Input: <?xml version="1.0" encoding="UTF-8" ?> <currencyFormats numberSystem="latn"> <currencySpacing> <beforeCurrency> <currencyMatch>[[:^S:]&[:^Z:]]</currencyMatch> <surroundingMatch>[:digit:]</surroundingMatch> <insertBetween> </insertBetween> </beforeCurrency> <afterCurrency> <currencyMatch>[[:^S:]&[:^Z:]]</currencyMatch> <surroundingMatch>[:digit:]</surroundingMatch> <insertBetween> </insertBetween> </afterCurrency> </currencySpacing> <currencyFormatLength> <currencyFormat type="standard"> <pattern>¤ #,##0.00</pattern> </currencyFormat> <currencyFormat type="accounting"> <alias source="locale" path="../currencyFormat[@type='standard']"/> </currencyFormat> </currencyFormatLength> <currencyFormatLength type="short"> <currencyFormat type="standard"> <pattern type="1000" count="other">¤ 0K</pattern> <pattern type="10000" count="other">¤ 00K</pattern> <pattern type="100000" count="other">¤ 000K</pattern> <pattern type="1000000" count="other">¤ 0M</pattern> <pattern type="10000000" count="other">¤ 00M</pattern> <pattern type="100000000" count="other">¤ 000M</pattern> </currencyFormat> </currencyFormatLength> <unitPattern count="other">{0} {1}</unitPattern> </currencyFormats> 21:55Output of boris format: [ currencyFormats [#numberSystem "latn" currencySpacing [ beforeCurrency [ currencyMatch [! "[[:^^S:]&[:^^Z:]]"] surroundingMatch [! "[:digit:]"] insertBetween [! " "] ] afterCurrency [ currencyMatch [! "[[:^^S:]&[:^^Z:]]"] surroundingMatch [! "[:digit:]"] insertBetween [! " "] ] ] currencyFormatLength [ currencyFormat [#type "standard" pattern [! "¤ #,##0.00"] ] currencyFormat [#type "accounting" alias [#path "../currencyFormat[@type='standard']"] ] ] currencyFormatLength [#type "short" currencyFormat [#type "standard" pattern [#type "1000" #count "other" ! "¤ 0K"] pattern [#type "10000" #count "other" ! "¤ 00K"] pattern [#type "100000" #count "other" ! "¤ 000K"] pattern [#type "1000000" #count "other" ! "¤ 0M"] pattern [#type "10000000" #count "other" ! "¤ 00M"] pattern [#type "100000000" #count "other" ! "¤ 000M"] ] ] unitPattern [#count "other" ! "{0} {1}"] ] ] Output of word-block-block format: [ currencyFormats [ currencySpacing [ beforeCurrency [ currencyMatch "[[:^^S:]&[:^^Z:]]" [] surroundingMatch "[:digit:]" [] insertBetween " " [] ] [] afterCurrency [ currencyMatch "[[:^^S:]&[:^^Z:]]" [] surroundingMatch "[:digit:]" [] insertBetween " " [] ] [] ] [] currencyFormatLength [ currencyFormat [ pattern "¤ #,##0.00" [] ] [type "standard"] currencyFormat [ alias "" [path "../currencyFormat[@type='standard']"] ] [type "accounting"] ] [] currencyFormatLength [ currencyFormat [ pattern "¤ 0K" [type "1000" count "other"] pattern "¤ 00K" [type "10000" count "other"] pattern "¤ 000K" [type "100000" count "other"] pattern "¤ 0M" [type "1000000" count "other"] pattern "¤ 00M" [type "10000000" count "other"] pattern "¤ 000M" [type "100000000" count "other"] ] [type "standard"] ] [type "short"] unitPattern "{0} {1}" [count "other"] ] [numberSystem "latn"] ] 21:56I agree with everything @zentrog:matrix.org sums up greggirwin 23:24Thanks for the comparison @hiiamboris. :+1: I was going to add it to the wiki, but I don't seem to have rights for that. Can we open that up @rebolek? source locale missing is a known issue, correct? I prefer word block block between these two. If we do end up with a special key, I bang my design gavel in favor of a decorated word, like text! or .text rather than !. If we *don't* have a special key, we can still define a named value to use in paths, e.g. a/b/c/:XTEXT, but that's just another tradeoff. Values could be none rather than an empty string, but not sure it's worth it, or how common they are. My guess is not, so the efficiency win isn't there. Attrs can be none, rather than an empty block. It does mean users have to create the block if they want to add them, but that's OK. If boris format doesn't work for HTML (due to [ordering](https://gitter.im/red/codecs?at=6197ff60197fa95a1c7e37e4)), do we want two different formats? I say No. Technically, XML is ordered as well, isn't it? Though many cases will work fine without preserving it. I haven't gotten back to the spec, sorry. Off to think a bit. zentrog:matrix.org 23:54Order _is_ important, but I don't understand how the boris format breaks it. Is there an example? Wednesday 15th December, 2021 greggirwin 00:03Scanning test files, I don't see one. We may need to synthesize one. @zentrog:matrix.org how common are multiple, separate pieces of content? zentrog:matrix.org 00:10When you say "content", I assume you mean text specifically? Just to distinguish that from other content like things, such as attribute values. I think for XML, it seems relatively less common to have multiple meaningful text sections with other elements interspersed, but I think it should still be supported some how. For HTML, it is certainly very common greggirwin 00:11Yes, text. zentrog:matrix.org 00:28Something like this? <body>some <b>bold</b> and <i>italic</i> text</body> greggirwin 00:29Yes. zentrog:matrix.org 00:31I tried decoding it with [xml.red](https://gitlab.com/rebolek/markup/-/blob/main/xml.red), but just get an empty block back. Not sure if I'm doing something wrong greggirwin 00:33It may want a prologue. I can't say just now. 00:37Given that the structure is rich and flexible, maybe trying to prioritize HOF use is a fool's errand. They can still be used effectively for some things I imagine (not knowing how DSSSL and XSLT work internally, but guessing they might do things that way), but will they work well (I hoped in the past they would) on trees as well as lists when the model is like XML? @hiiamboris, thoughts? I'm totally OK with a format that we can use parse against internally and provide a nice set of APIs, but (I hope) also imperatively or with HOFs when the data is simple and predictable. 00:43@hiiamboris does your suggested format still require a change to the lexer, as you noted early on? 00:44Unless it's a lexer bug already, just needing to be fixed, that's probably a showstopper for me. zentrog:matrix.org 00:46Oh, yep, that was it. Both forms need a bit of cleanup, but they both seem equally machine navigable. The wbb one is a bit harder for me to follow. >> xml/output-type: 'wbb >> xml/decode read %data/simple.html == [ body [none "some " none b "bold" [] none "and " none i "italic" [] ] [] ] >> xml/output-type: 'boris >> xml/decode %data/simple.html == [ body [! "some" b [! "bold"] ! "and" i [! "italic"] ] ] greggirwin 00:50Has anyone proposed key-val all the way down? 00:50 [ currencyFormats [ ; .text "" ;?? Omit empty .text values? .attr [numberSystem "latn"] ;?? Can .attrs always safely group to the top? currencySpacing [ beforeCurrency [ ; Always include .attr ? currencyMatch [.text "[[:^^S:]&[:^^Z:]]" .attr []] surroundingMatch [.text "[:digit:]" .attr []] insertBetween [.text " " .attr []] ] afterCurrency [ ; Omit empty .attrs ? currencyMatch [.text "[[:^^S:]&[:^^Z:]]"] surroundingMatch [.text "[:digit:]"] insertBetween [.text " "] ] ] currencyFormatLength [ currencyFormat [ pattern [.text "¤ #,##0.00" .attr [type "standard"]] currencyFormat [ .text "" .attr [type "accounting"] alias [ .text none ;?? to distinguish auto-closed tags? Probably not. .attr [path "../currencyFormat[@type='standard']"] ] ] ] currencyFormatLength [ .attr [type "short"] currencyFormat [ ; Can .attrs always safely group to the top with .text? ; Should they always come first? .attr [type "standard"] .text "" pattern [.text "¤ 0K" .attr [type "1000" count "other"]] pattern [.text "¤ 00K" .attr [type "10000" count "other"]] pattern [.text "¤ 000K" .attr [type "100000" count "other"]] pattern [.text "¤ 0M" .attr [type "1000000" count "other"]] pattern [.text "¤ 00M" .attr [type "10000000" count "other"]] pattern [.text "¤ 000M" .attr [type "100000000" count "other"]] ] ] unitPattern [.text "{0} {1}" .attr [count "other"]] ] ] 00:53Similar to boris, but attrs are in a keyed block. zentrog:matrix.org 00:55I was thinking about something like that. I couldn't figure out attribute namespace prefixes though. But that is still a consideration for the other forms too. I think @rebolek had a solution using paths... 00:57Anyway, thinking more on that, it is a nice consistency, and other things could be done that way as well, like cdata (if differentiating from text), comment, and other weird things like processing instructions 01:01It does make paths longer. It could be useful to be able to grab all the attributes in a single block greggirwin 02:17Everything is a tradeoff in this space. Your gut instincts, having digested more XML than the rest of us, are valuable. pekr 05:22Though dot convention is not particular redbolish, I kind of like that, especially as it is used in JS and ppl might be right at home. 05:26Not sure I undrestand empty block vs none, but I was always versed, when something had several possible different types as a return. none for no value, valuefor just one and [value1 value2]for multiple ones. But I can understand you don't want to have code full of []or "" .... hiiamboris 07:56/.attr is preferable to /3 magic number, though doesn't leverage type richness and the biggest downside after extra verbosity is that .attr [] will always have to be present, you can't omit it, or your paths b/.attr/x will error out on missing .attr in the scenario like this: a [.attr [x "1"] .text "1"] b [.text "2"] c [.attr [x "3"] .text "3"] 08:05For the tooling, @dander should advise from experience. But my limited experience tells me that use cases like this are going to be common: ;; select a subtree srcdays: cull/fetch 'tree/ldml/dates/calendars/calendar/(#type = "gregorian")/days ;; extract the days data for-each [('daycontext) b] srcdays [ type: select [format format stand-alone standalone] to word! b/#type cal/:type/days: days: copy #() for-each [('daywidth) b2 [block!]] b [ width: to word! b2/#type key: select [narrow char abbreviated abbr wide full short short] width days/:key: m: copy #() for-each [('day) b3] b2 [put m to word! b3/#type b3/!] ] ] ;; some days may be inherited from the other type, so I reflect both sides to one another for completeness foreach w [char abbr full short] [ unless format/days/:w [format/days/:w: standalone/days/:w] unless standalone/days/:w [standalone/days/:w: format/days/:w] ] cull is a helper I made to filter out things from the tree, cull/fetch returns only the /days leaf rather than the whole tree. I don't like it and it has big design issues, and is only occasionally helpful, but it helps me avoid the fourth for-each loop here. Better ideas how to handle this are welcome. 08:09morph could have been just the tool for it, but it's too early a prototype to be convenient rebolek 08:17> the biggest downside after extra verbosity is that .attr [] will always have to be present Isn’t it a good thing OTOH? With the tag content attributes model you can traverse the tree easily as there are always three values. With your approach, you can’t rely upon that, as the element’s length is always different. 08:18Instead of .attr I would use for example issue!, #attr. hiiamboris 08:42it isn't good from readability's perspective, and we're always going to look at our data, during debugging 08:43and #attr/x is currently a problem in the lexer that Gregg said isn't going to be addressed rebolek 09:05If it complicates automated access, is readability really such a strong argument? hiiamboris 09:09Does it complicate anything? 09:10Ah, you mean if .attr is absent, it complicates traversal? Yes. rebolek 09:10with the [tag content attributes] structure you can traverse the tree with a simple recursive foreach loop. 09:11I understand that omitting empty attributes/content looks better, OTOH it breaks the flow. hiiamboris 09:11That's why, for this model, I say .attr will always have to be present. For automated access and for less error handling. And readability will be sacrificed. 09:12I'm not proposing it the other way around :) pekr 09:13I just wonder. We are constantly trying to i troduce new forms. And all that time we ignore one Red native datatype, a tag. Consider .attr vs <attribute>. Would work in paths too, no? rebolek 09:16Yes, it would. pekr 09:17It might feel weird to decompose tags by using tags, but we are trying tosolve a structure problem. hiiamboris 09:17what does improve over .attr? pekr 09:18Expected that, you should know better. 09:19! Nor .attr are redbolish. We don't abbreviate like that. hiiamboris 09:20Who defines what is more Redbolish? pekr 09:20I myself hate tags and like dots more, but so far, tags in redbol, is most useless datatype, if nit used. 09:21Do you reallymean it? hiiamboris 09:22Yeah, why not? What's the guideline? pekr 09:25Rebol naming conventions are defined. I do 't mind dot, though that convention is hostile and confusing to those, who expect objects. 09:26But attr should be full word. In long worde we use hyphens, not hungariannotation, nir the camel case. rebolek 09:29@pekr so you prefer attribute instead of attr ? hiiamboris 09:31Why don't we call it attribute-block then? if a/attribute-block/x <> b/attribute-block/x [a/attribute-block/x: b/attribute-block/x] Now that ensures our code will not be readable :) rebolek 09:33Pushed new version, wbm emitter was removed and Gregg emitter was added. hiiamboris 09:44One of the reasons I proposed #attr "value" syntax is because having /attr/ everywhere in the paths distracts the eye from attribute and element *names* to the completely unimportant detail of how we name the attribute group. And also the reason I chose ! over text!: it's a *syntactic noise*, and I prefer to keep it to a minimum. I exaggerated the example above only to show that strictly abiding by "never abbreviate" law, and having attribute, is a step towards maximizing syntactic noise. I would prefer common sense to prevail in all decisions we make, and laws being taken as only guidelines, and every decision should be weighed in it's context (and that is true not only for the world of code). 09:50We can rename them to this purpose though, to flags. So what if it's not an official term? rebolek 09:56XML prolog is now optional. It may be enforced with /strict refinement. 11:51> I was going to add it to the wiki, but I don't seem to have rights for that. Can we open that up @rebolek? @greggirwin It seems to be open. @hiiamboris can you please try to edit the wiki to see if it’s accessible for others than me? hiiamboris 11:59Maybe I'm just dumb but I don't see any "edit" buttons there: https://i.gyazo.com/bcd002dcc50f45d2ee8ca95e065e4cc9.png 12:00Do you have a direct edit link so I can try it? rebolek 12:02Hm, strange. 12:02https://gitlab.com/rebolek/markup/-/wikis/home/edit 12:04The project is public, in settings it says that Wiki can be edited by anyone with access. 12:06@hiiamboris @greggirwin I invited you as members of the project, maybe it would help. hiiamboris 12:08Now I see it, yes. 12:08Anyone *with access* must be it rebolek 12:09The other option is "members only" hiiamboris 12:12Right, now that I look at settings, it certainly looks silly. 12:13I guess that's what you get when you continue killing the UI every day - bugs creep in :) zentrog:matrix.org 22:42Regarding the #attr/x lexer issue, it isn't a problem with @attr/x (which also conveniently matches up more closely to xpath syntax). However, would someone give a bit more explanation about the tradeoffs of using a word-based type vs string-based? I don't think I understand Red internals well enough for it. Is it mainly to do with memory usage or other performance characteristics? Like are the words just an index into a context somewhere, vs a string would be duplicated each time it appears? Maybe it would be useful to specify an initial constraint for minimal capacity, like "ability to handle a document up to 50MB" (just a random figure). Or a tool to detect the maximum capacity. Then we can see how much those decisions affect what the limit ends up being. Thursday 16th December, 2021 pekr 05:40I don't want to push for tags instead of issues or refs, as there seem not to be any fan of that aproach here, but just curious - what is happening here? >> type? <attr>/x == /x >> blk: [<attr> "test"] == [<attr> "test"] >> blk/<attr> == "test" In path, tags seem to work, but in first case, what is lexer doing, returning /x instead of a type? toomasv 05:46@pekr On first line there are two expressions type? and /x. Last is returned. pekr 05:55There is no space between those two elemens. And even more, in the second case of path access, it corrrectly returns the string type. Shouldn't just type function always return a type? toomasv 06:03Space is not always required between expressions. type? returns type, but it gets lost as you are not using it. Put probe before it to see. rebolek 06:07@zentrog:matrix.org yes, the main problem with word! vs. string! is the memory usage. However, we can cheat a little bit here and reuse the same string, I guess it shouldn’t be a problem, as we aren’t going to modify the string during the lifetime of the data structure. But I need to test it to see if there aren’t some problems I’m not aware of. 06:09@pekr the problem is that tag! can’t be the first value in path!. toomasv 06:12@pekr You an see how lexer treats it: [type? <attr>/x] == [type? <attr> /x] pekr 06:36Thanks. greggirwin 21:561) We all seem to agree that a fixed structure has a lot of pros, with the main con being readability of raw data. Secondarily it's less efficient. I'm OK with that tradeoff. Other options just mean different compromises. Agreed? 2) We need key names for text and attr that can't conflict with what may appear in the data. That means they have to be illegal in XML. We can't safely use refinement! or issue! types, due to paths. Using lit/get/set words as a hack doesn't solve the problem. This leaves us with a sigilled word or a string type. As I said [before](https://gitter.im/red/codecs?at=61aa5d92197fa95a1ca4b8ae), *not* copying strings is a recipe for disaster. So we either accept the overhead of copied strings for something like @text/@attr (tag! is a bad choice, as we are coming *out of* markup and don't want confusion there) or use a sigil on a word. I vote for word, and *prefer* . as the sigil not because I *like* it but because the other options are worse. :^) Vote for your sigil. 3) To @hiiamboris' point on explicit .attr and .text being noise, I disagree. They aren't *implicit*, but I think that's a good thing in this case. This is *my* priority sense for the design right now. The reason being that this format, fingers crossed, will never change. If it does, it will be at the edges and not at the core for text and attrs. If it's a long-lived format, it should be as plain and obvious as possible. If there is a *more* plan and obvious format, please post it with the rationale for it. > the biggest downside after extra verbosity is that .attr [] will always have to be present, you can't omit it, or your paths b/.attr/x will error out It's true that you can't write paths against unknown data and ignore error handling. This is always true, coming from XML data or not. It applies to any nested key, not just attrs. > With the tag content attributes model you can traverse the tree easily as there are always three values. I haven't tried the new gregg emitter yet. What I posted is not 3-value based, but recursive some [key value] all the way down. Does this description match [the example](https://gitter.im/red/codecs?at=61b93bee440178658b961df0) I posted? `.text` is always a string. More than one may appear throughout a tag's (node's) block. `.attr` is always a block and may only appear once. Any other key is a tag name, and is a node. We *can* choose to always include .text/.attr, which means we can never take them away. If we spec that they may be omitted, people have to write code to handle that. If we get lots of complaints, or find that code is massively uglified by it, we can later force them to always be included without it being a breaking change. And, No, I don't care about the argument that someone will load a doc now that later fails because empty values are forcibly included. hiiamboris 22:27With so many different tastes around, it's a great thing that Bolek's codec can use different emitters :) zentrog:matrix.org 22:40@greggirwin: Good summary. Maybe a nice checkpoint to copy over to the wiki page? @hiiamboris I agree! greggirwin 23:12@hiiamboris, yes, what we're talking about here is the standard emitter. Other formats will make great blog posts or something. rebolek 23:17@greggirwin thank you for your reply! Here are my thoughts. 23:18On the phone, so excuse me for all errors, there would be more of them than usual. 23:191) I agree. 23:222) we don't. If we agree with the fixed structure, why not go with tag content attributes. It's a fixed structure that makes sense and does not need magic keywords. 23:242a) we can offer alternative structure, which is basically what Boris proposed and let's be clear here, it's a dialect, with all the things that it can omit, like empty attributes and text. That's not wrong, dialects are good. So let's test it as one and see how far we can go. 23:26I'm obviously not going to comment on 3 23:28I've chatted about XML with Oldes a bit and he told me about XML library required for one project. That library is cca 2MB. 23:29My codec is 17kb with all the variants, so we have a lot of space for experiments ;-) Friday 17th December, 2021 zentrog:matrix.org 00:43I'm not convinced that tag content attributes is more of a fixed structure than the alternatives. It is very consistent when text appears just in leaf nodes, but when that is not the case, you still need to repeat the structure multiple times, and it adds a lot of extraneous none and empty blocks in those cases. So how much of a difference is it really to loop through elements in groups of 3 vs 1 at a time? Are you primarily considering the data transformation scenario where it would be a nicer structure? rebolek 06:21> it adds a lot of extraneous none and empty blocks in those cases Each solution has it'đ downsides and that's the downside of this one. Hwever, text outside of leafs is not very usual in XML. It's a common thing in HTML but I guess we should have a different format for HTML. > So how much of a difference is it really to loop through elements in groups of 3 vs 1 at a time? What structure do you mean that can be looped one element at time? toomasv 07:28I did some simple experiments, and I have to say for my taste @rebolek's solution won with large margin, as concerns working further with the result (especially when we have new split available). But there are some problems with it too: source: {<example>Some <bold>words</bold> in <italic>this</italic> string</example>} wbb: load-xml source == [ example [none "Some" none bold "words" [] none "in" none italic "this" [] ; <-- Hey, why is "string" missing? ] [] ] boris: load-xml source == [ example [! "Some" bold [! "words"] ! "in" italic [! "this"] ] ] gregg: load-xml source == [ example [.text "Some" bold .text "words" .attr [] .text "in" italic .text "this" .attr [] ] .attr [] ] Now, suppose we want to extract just pure text from this: extract/index wbb/example 3 2 == ["Some" "words" "in" "this"] parse boris/example rule: [collect any [ahead block! into rule | '! keep skip | skip]] == ["Some" ["words"] "in" ["this"]] parse gregg/example [collect any ['.text keep skip | skip]] == ["Some" "words" "in" "this"] Want to look at each element? pick split wbb/example 3 2 == [ bold "words" [] ] pick split boris/example 2 2 == [ bold [! "words"] ] ;gregg ?? rebolek 07:30@toomasv Thanks! > <-- Hey, why is "string" missing? Good catch! I exactly know why, the text is stored in the buffer but because it's at the end, the buffer never gets emitted. I'm going to fix it right now, thanks! toomasv 08:00You are welcome! :) But I am not sure about trimming unconditionally text-nodes. Whitespace may be signifiant too in many (or at least some) cases, although I agree that it mostly may be ignored. Can it be made optionally to be kept? Oldes 08:00If I may just jump in for a while, all results above are loosing information. There should be " in " and not just "in" for example! zentrog:matrix.org 08:02I think a better rule for trimming whitespace is to drop text which contains *only* whitespace Oldes 08:03In a parser I was using, I have to call /trim to trim the spaces. 08:05Also the order I have is [tag-name attr-block-or-none content-block]where attributes are just [key1 value1 ...] 08:15Btw... I'm not sure how much is important, if the decoded xml structure is good enough readable in console. From my experience I never needed it... what is important is, how looks the backwards encoded xml. rebolek 08:21> Can it be made optionally to be kept? Yes, that's my intention. 08:22@Oldes I prefer to have content right after the tag, so you can access the content using path notation. pekr 08:23I like Gregg's emitter probably most. With wbb, there's too many nones, Boris' one is nicely streamlined too, but with Gregg's one, I can clearly see, what is what ... toomasv 08:24The problem is not seeing it but working with it, though. 08:28Accessing elements with namespace specified is a bit cumbersome but doable, e.g.: source: {<example>Some <bold:rt>words</bold>^/in <italic:rt>this</italic> string</example>} wbb: load-xml source == [ example [none "Some" none bold/rt "words" [] none "in" none italic/rt "this" [] ] [] ] get to-path [wbb example bold/rt] == "words" Oldes 08:28@pekr if none is a problem it can be just _ or something not so much distracting. 08:35Btw... one important note! XML tags are case-sensitive! I don't think any current implementation cares about it. https://www.ibm.com/docs/en/scbn?topic=syntax-xml-rules toomasv 08:39As element-names are turned into words, there seems to be no way to enforce case-sensitivity. rebolek 08:48True. There is an option to leave the names as strings thought. And for most cases, I think that case sensitivity is not a problem. Oldes 08:53My preferred output for @toomasv example would be probably: <example> _ [ "Some " [<bold> _ "words"] " in " [<italic> _ "this"] " string" ] 08:54With smarter tag! it could be just: <example> [ "Some " [<bold> "words"] " in " [<italic> "this"] " string" ] 08:55(smarter tag! is a tag, which is not just another string syntax, but can handle also attributes internally, if there would be any) hiiamboris 08:56I came up with emitter names. boris -> compact, bolek -> triplet, gregg -> dotted, oldes -> tagged :) Oldes 08:58Maybe it could be just: <example> [ "Some " <bold> "words" " in " <italic> "this" " string" ] 08:59(my version would require parse for traversing) hiiamboris 09:00I also should remind everyone that HTML tests are no good to judge XML codec. Oldes 09:00Don't know... I'm quite happy that I don't have to work with XML now. I just wanted to put my little bit into the decision mess :-D 09:02Here is a little piece of real code where I used XML last time (years ago): shape-to-symbol: func[ "Converts existing shape into new symbol" shp [block!] "Shape's DOM" id [any-string! integer!] "New symbol's name id" /local name symbol shpNode file ][ name: join "__symbol_" id ;checksum mold shp/3 'crc32 symbol: load-xml [ {<DOMSymbolItem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://ns.adobe.com/xfl/2008/" name="} name {" itemID="} make-id {" sourceLibraryItemHRef="} name {" symbolType="graphic" lastModified="} to-timestamp now {"> <timeline> <DOMTimeline name="} name {"> <layers> <DOMLayer name="Layer 1" color="#4FFF4F" current="true" isSelected="true" > <frames> <DOMFrame index="0" keyMode="9728"> <elements> <DOMShape/> </elements> </DOMFrame> </frames> </DOMLayer> </layers> </DOMTimeline> </timeline> </DOMSymbolItem>}] shpNode: get-node symbol %DOMSymbolItem/timeline/DOMTimeline/layers/DOMLayer/frames/DOMFrame/elements/DOMShape if shpNode [ shpNode/3: shp/3 ] ;probe shpNode repend/only dom-symbols compose/deep ["Include" ["href" ( join name %.xml ) "itemIcon" "1" "loadImmediate" "false"] none] ;ask "" write file: xfl-target-dir/LIBRARY/(join encode-filename name %.xml) form-xfl symbol ;append files-to-parse file name ] make-symbol-dom: func[name][ first load-xml [ {<DOMSymbolInstance libraryItemName="} name {" name="" symbolType="graphic"> <matrix> <Matrix/> </matrix> <transformationPoint> <Point/> </transformationPoint> </DOMSymbolInstance>} ] ] rebolek 09:23smarter tag! would solve *a lot* of problems pekr 09:30Are we talking changing / extending tag datatype semantics? If tag would be supposed to be ever used in Red, then I am all for that. Do we have any statistics, how much is the tag type used at all? hiiamboris 09:39I've seen it used a lot in HTML generators in R2. pekr 09:46Is there any description, what the "smarter tag" would be all about? 09:47Just a note - it is clear that any change to the tag type is not a realistic expectation for the XML codec timeframe, right? hiiamboris 09:56Just forget about smart tags. Nenad strongly said No, and not just once. Oldes 10:13Who is Nenad? ;-) Btw... in czech.. Ne means No. hiiamboris 10:18:) 10:20In Russian too, the name could be read as "Not required" :) pekr 10:21Did not know it was discussed in terms of the Red team. OK then. Oldes 10:31I understand it... it is a lot of work and hard to make decisions. It's easier to just use block or none after the tag. rebolek 15:40we can fake them with accessor functions like attributes-of etc. But that of course would be slow. zentrog:matrix.org 16:01 What structure do you mean that can be looped one element at time? @rebolek I guess not one at a time, but a pair at a time. Any of these key-value-ish formats. I guess an important aspect of what makes a structure more or less convenient for processing is what interface you are expecting to use, and what you are actually doing with the data. Is it iteration with parse? foreach loops? Or filtering with something like [sift / locate](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/sift-locate.md)?> greggirwin 20:45- Consensus is not going to happen. :^) - We won't get a smarter tag!. <gavel> - [tag content attr] order for triples. <gavel> (unless someone makes a *really* strong, concise, and concrete case for [tag attr content]). - ! in boris needs to be a sigiled word, not just !, if it's going to be included as a standard emitter. <gavel> - Improved names @hiiamboris. :+1: How about [triples compact key-val]? Compact is a little tricky, because it may still be prettified, so it's not flat or minified in any way. I don't love dialect or rich-type but will let others weigh in. - We won't change the lexer unless it's a lexer bug, but I *think* issues for attrs in boris are problematic only in two use cases (correct me @hiiamboris), which is 1) setting them, because you can't use them literally in a set-path. They can't nest, so will always be the last thing in a path. 2) is accessing an index in them. e.g. .../#name/1. You can still use indirection for them. Is that acceptable, or do we need to use another type? - If the markup codec is going to handle both XML and HTML, they should use the same format(s). Having emitter options lets people choose the most convenient one for them. As long as things aren't lossy (not WRT whitespace), users can convert between any format pretty easily. - Are we OK with output-type as the emitter control name? Since codec implies 2 directions, I'm unsure. Format is no better in that case. - I don't hate _ as a none placeholder in this context. But we could also do NO_ATTRS or something along those lines. If a human is going to read it, our viewer could have an option for what to display for none values. In the same vein, replacement of unique keys is easy. e.g. change .text to ! - I think we can live without case sensitivity. Thanks for all your thoughts @Oldes. This is a good one. - I defer to @zentrog:matrix.org on whitespace preservation behavior. 20:46I copied some of my recent notes to the wiki. Hard to find where suggestions and their pro/con arguments are in chat now. 20:48Using @toomasv HTML example, here's what I get: File: %data/simple.html Format: wbb [ example [none "Some" none bold/rt "words" [] none "^^/in" none italic/rt "this" [] ] [] ] File: %data/simple.html Format: boris [ example [! "Some" /bold rt [! "words"] ! "^^/in" /italic rt [! "this"] ] ] File: %data/simple.html Format: gregg [ example [.text "Some" bold/rt .text "words" .attr [] .text "^^/in" italic/rt .text "this" .attr [] ] .attr [] ] Note the problem with refinements, e.g. /bold/rt, in boris @rebolek. 20:51I've looked at a couple XML examples and will comment once I think more on it. Won't be tonight though. 20:53Also, @rebolek there's a problem with gregg. bold/rt .text "words" .attr [] .text "^^/in" Should be bold/rt [.text "words" .attr [] .text "^^/in" ] Shouldn't it? hiiamboris 21:11refinements are by design so they don't interfere with path access 21:13I don't think ../#x/1 and ../#x: 2 are lexer bugs. Rather a grey design area where nobody thought about issues in paths. But since : and / are illegal for issues, I find it much more useful to support sub-paths and set-paths than to raise an error. zentrog:matrix.org 21:28Looking more closely at the html-ish sample, it's not actually valid xml. It should be more like this: (rt being a common namespace for related elements, and bold, italic being the 'local element names'). I just made up a namespace definition for it. One note is that the xmlns prefix is one of the rare places where you will see a namespace prefix on an attribute. source: {<example xlmns:rt="Red/rich-text">Some <rt:bold>words</rt:bold>^/in <rt:italic>this</rt:italic> string</example>} hiiamboris 21:30A few (rare) examples of multiline text from CLDR: <keyword> <key extension="t" name="k0" description="Keyboard transform: Used to indicate a keyboard transformation, such as one used by a client-side virtual keyboard. The first subfield in a sequence would typically be a 'platform' designation, representing the platform that the keyboard is intended for. The keyboard might or might not correspond to a keyboard mapping shipped by the vendor for the platform. One or more subsequent fields may occur, but are only added where needed to distinguish from others." since="21.0.2"> <type name="osx" description="Mac OSX keyboard." since="21.0.2" /> <type name="windows" description="Windows keyboard." since="21.0.2" /> --- <attributeValues dtds='supplementalData' elements='subdivisionAlias' attributes='replacement' type='choice'>AS AW BL BQ CW GF GP GU HK MF MO MP MQ NC PF PM PR RE SJ SX TF TW UM VI WF YT</attributeValues> --- <firstDay day="sat" territories="AE AF BH DJ DZ EG IQ IR JO KW LY OM QA SD SY"/> <firstDay day="sun" territories=" AG AS BD BR BS BT BW BZ CA CN CO DM DO ET ... SA SG SV TH TT TW UM US VE VI WS YE ZA ZW" /> --- <variable id='$oldLanguages' type='choice'> aa ace ada ady ain ale alt an anp arn arp ars av awa ay ba ban bho bi bin bla bug byn ch chk chm cho chy crs cv dak dar dgr dv dzg efi eka fj fon gaa gan gez gil gn gor gwi hak hil hsn hup hz ... udm umb ve wa wal war wuu xal ybb zun zza </variable> <variable id='$scriptNonUnicode' type='choice'>Afak Aran Blis Cirt Cyrs Egyd Egyh Geok Inds Jurc Kitl Kpel Latf Latg Loma Maya Moon Nkgb Phlv Roro Sara Syre Syrj Syrn Teng Visp Wole </variable> Note 3 of 4 examples put that into attributes. I would say that authors relied on the following logic here: - newlines between non-empty strings are significant and should be preserved - opening/trailing newlines are purely for reader's convenience - line indentation is clearly only for the reader of XML file, and is either supposed to be removed or ignored in the output; I guess we need newlines to be able to reproduce the XML, but can strip the indentation when reading and produce new indentation when saving greggirwin 21:32@zentrog:matrix.org your example doesn't seem to load. @rebolek? hiiamboris 21:33I think header should not be mandatory, for testing purposes. greggirwin 21:34Good examples @hiiamboris. Worth raising the issue! issue for Nenad. R2 allows it. zentrog:matrix.org 21:35It seems to work for me [ example [none "Some" none rt/bold "words" [] none "in" none rt/italic "this" [] ] [xlmns/rt "Red/rich-text"] ] [ example [/xlmns #rt "Red/rich-text" ! "Some" /rt bold [! "words"] ! "in" /rt italic [! "this"] ] ] greggirwin 21:39@zentrog:matrix.org interesting. Works if I paste source into the console and load it, but not if it's in my test file run by my script. zentrog:matrix.org 21:39Is it the newline? greggirwin 21:41No. It was having the original data in there as well, even as a comment it seems. 21:43Likely because there can only be one root. 21:43That was it. zentrog:matrix.org 22:26It's certainly safer for xml schema designers to keep newlines in the attributes to protect against the data being corrupted by someone using an xml formatter. I have opinions on what would be the best default whitespace handling, but I'm likely to be wrong about it. Ideally you're reading machine generated xml which doesn't have any extra whitespace. If it's been formatted, then it depends on the formatter. A smarter formatter might not break up sections if there are mixed elements with text. But there is no guarantee about that. Here's what the VSCode plugin I generally use does with that sample: <example xlmns:rt="Red/rich-text">Some <rt:bold>words</rt:bold> in <rt:italic>this</rt:italic> string </example> Kinda weird. Probably no matter what you do, it's not going to be quite like the original. 22:34So I guess the question is do we put in trimming by default for cleaning up stuff that might be a bit messy, or make people opt-in when they know their inputs are trimmable? If you have clean inputs, trimming *could* be problematic in some cases because it's possible to store a whitespace value as text, but hopefully rare. Trimming is probably nicer for explorational stuff, like testing with sample data which happens to be formatted, or API examples. greggirwin 23:22- If it's machine generated, it should be clean (pre-trimmed if necessary). - If we don't trim in the codec, nothing is lost and the user can still do it. A simple wrapper can even trim all strings in place so it's not a terrible efficiency hit. - If we *do* auto-trim, data is lost and we can never get it back. Then we have to add a /preserve refinement or something, which is no easier for users than a trim-strings helper. I vote to preserve whitespace. Saturday 18th December, 2021 rebolek 07:44@greggirwin Thanks for your thoughts! > ! in boris needs to be a sigiled word, not just ! I agree, that's the plan, I just haven't implemented it yet. > How about [triples compact key-val] Good suggestion, I'll use it unless we can come up with something better > If the markup codec is going to handle both XML and HTML There's so many sublte differences between those two formats that I prefer to have a separate parsers. A lot of code can be shared though. > Are we OK with output-type as the emitter control name? As I recently modularized emitters also, this is going to change. > I don't hate _ as a none placeholder in this context This can be optional probably too I'll comment on the other posts soon. hiiamboris 08:24I vote for auto trimming and a preserve option, because trimming indentation is not as simple as just 'trim' call. toomasv 15:16> Consensus is not going to happen. Yes, until there are no commonly accepted criteria. There are so many aspects -- composability, compactness, readability, efficiency, utilisability, accessibility, closeness to specification... from the top of my head. Are there more? Oh, yes, Red-ness. What weight to these have compared to each other? What value does each format have in each of these aspects? If we could get to some more-or-less agreed list of relevant aspects, their relative importance, and estimates for proposed formats in these aspects, only then would there be any hope to reach consensus, er.. of moral majority. IMHO. hiiamboris 15:27Thing is, different people care about different aspects. To me for example learning ! takes a few seconds - just enough to read the sentence explaining it's meaning and glancing at the output example. And then I immediately can reap the benefits of it not growing on my nerves. But some people will look at the output and think OMG what does this even mean?? Without a textual hint they will feel lost. So our preferences come down to our differences :) 15:31Obviously there are also people who are *opposed* to any kind of documentation. For them textual hint is a must. That's why Gregg insists on it I think. pekr 15:35We are hurrying up for the next release I think, and we might make some mistakes. But - it is "just" codec and as such can be adapted, reworked, or even replaced? There is so much in the naming, that sometimes the old Rebol discussions I remember, were tiresome. E.g. my notice to abbreviating attribute to attr was kind of downplayed, whereas we have funcitons like on-deep-reactor. And I can even understand, that reading such long names might really play on our nerves. I am afraid there is no simple answer to all of this. 15:35And as is mentioned above - the look of the Red generated code is one thing, the other thing is - how do we access, change, export the results? Paths? Accessors? Filters? Iterators? hiiamboris 15:36I haven't come up with a good extraction technique yet, but I'm thinking about it. pekr 15:54Well. How the output looks might be important when prototyping. And you are right, many users will not look into docs first. Will have to look into Carl's Altson proposal, if there is dot convention. If it eventually, due to its look, will help users of xml or html feel familiar, then - why not? hiiamboris 15:55I don't think you can convert XML to JSON (or any of it's alternatives). 16:00I mean you could change the structure completely, but will it be a win or not? E.g. <type>42</type> <x>1</x> <x a="a">2</x> <x b="b">3</x> Can become this JSON: "type": ["42"], "x": [ {"text!": "1"}, {"text!": "2", "attr!": {"a": "a"}}, {"text!": "3", "attr!": {"b": "b"}} ] Which is closer to Red in a way: it has arrays. But it's still the same iteration to find what you're looking for. 16:11Problem of XML is it does not provide you with the clue, whether each element is supposed to be unique, or can repeat array-like. So you have to create arrays for every element, just in case. pekr 16:13Dont want to convert xlm to json. Just stating the familiarity of certain devs with the dot convention. Dots, in many langs, mean object method access. I am mostly thinking of CSS accessors. Remember having a teplate html page with tables of prices, and jquery function calling recalculation for particular class. 16:16I think the reason for having a codec is two fold 1) import the data, do some tweakings, export back, or 2) import, take the data and use in terms of your app. rebolek 16:46@hiiamboris this is very interesting example because Red is closer to JSON than to XML so we should look how the conversion is solved there. hiiamboris 16:49I can tell how it's solved from two huge projects: CLDR and CLDR-JSON that's aimed to convert the former. There is almost nothing in common in data structure between the two projects. They just took the data out and created new files with data how it looked convenient for them. rebolek 16:53I meant libraries. Monday 20th December, 2021 greggirwin 23:24@rebolek separate parsers is fine, I just think having the same format(s) emitted is important. 23:28For this codec, I'm good with getting it out there and *not* freezing the emitters instantly. We'll find out if anybody uses it and provides feedback. Given the emitters we have now, there should be something for everyone, and if we want to make custom emitters possible, that can happen later. Tuesday 21st December, 2021 rebolek 08:54@greggirwin there are currently three parsers that return different Red formats and three emitters that return the same XML file as was the source (minus formatting of course). They should be fully consistent. greggirwin 21:51:+1: Wednesday 22nd December, 2021 rebolek 10:08For the format setting, output-type was a temporary solution, I’ll add /format to both to-xml and load-xml with triples being the default format and for people who don’t like that as the default format and don’t want to use the refinement every time, there would be an option to override it directly with setting xml/format. I guess this is the most sensible solution, but I’m of course open to suggestions. Oldes 11:02I just found, that Github is now returning "+1" as a key in its json data. That is not a valid word, so it breaks the codec. >> load-json {{"a": 1}} == #( a: 1 ) >> load-json {{"+1": 1}} *** Script Error: contains invalid characters Do we have any strategy, how to deal with something like this? 11:15I guess that only possible solution is keep it as a string. rebolek 11:50Right, keeping it as a string is a solution. I believe that JSON codec should fail back to strings when an unloadable key is hit but I’m not the author, so I don’t know the details of the implementation. I guess filling an issue would be appropriate, so I’ll look into it Oldes 11:59[This parse rule](https://github.com/red/red/blob/01d964636422c6a8d30b01dbd2beb439ccbe830f/environment/codecs/JSON.red#L177) must be enhanced to fail if there is [#"+" | #"-"] some digits end hiiamboris 12:04I think attempt [to word! str] will be much faster than parse there. 12:08Or maybe it should be just transcode/one and check of the loaded type to be word! 12:08Because: >> to word! "#x" == x we don't want this I think Thursday 23th December, 2021 greggirwin 02:55Just one quick question/comment for now. @rebolek would /as make sense, rather than /format? pekr 06:33+1 for /as rebolek 07:26@greggirwin good idea, it will be /as Wednesday 29th December, 2021 rebolek 11:46/as was implemented and the bug is fixed now. greggirwin 20:52:+1:``
