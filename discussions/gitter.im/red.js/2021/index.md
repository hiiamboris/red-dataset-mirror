# Archived messages from: [gitter.im/red/red.js](/gitter.im/red/red.js/) from year: 2021

## Friday 1st January, 2021

GaryMiller

[22:37](#msg5fefa4168bb73474696a6a37)Merry Christmas and Happy New Year! Any Red,js predictions/resolutions for 2021?

## Saturday 2nd January, 2021

ALANVF

[21:12](#msg5ff0e1cc8bb73474696d2b79)@GaryMiller I'm hoping to finish the transition from TS to Haxe for Red.js this year (i.e getting back to where I was at in the original version)

## Sunday 3th January, 2021

GaryMiller

[05:04](#msg5ff1505d69ee7f0422dc274d)Will be great to see. Realize you are aiming at a moving target! But its great to see that you're sticking with it!

## Thursday 21st January, 2021

ALANVF

[20:33](#msg6009e5176b20cf7730cc856f)so whenever I get to implementing Parse, I had the idea of maybe compiling Parse rules to WebAssembly or something similar

[20:33](#msg6009e52c410c221440145700)is Parse currently compiled, or is it still interpreted?

greggirwin

[20:55](#msg6009ea358816425540e02649)`Parse` is written in R/S and is compiled.

## Friday 22nd January, 2021

ALANVF

[01:39](#msg600a2ce62cb18a437c3366f5)ah oh, thanks :thumbsup:

giesse

[15:07](#msg600aea49cae490555f5f14d3)is the question, are rules compiled then executed? if so, they are not, `parse` is an interpreter. compilation would break some usage.

[15:08](#msg600aea61dfdbc1437fa64019)what @greggirwin means is that the interpreter is written in Red/System

[15:09](#msg600aeaadd8bdab473951ad97)`topaz-parse` uses a compiler if that's useful to look at.

[15:13](#msg600aeb7f410c22144016f9ed)eg. this: https://github.com/giesse/red-topaz-parse/blob/master/parse-parse.red  
gets compiled to this: https://gist.github.com/giesse/f18230b8f097a2fb43a46684638737aa

greggirwin

[17:21](#msg600b099b8816425540e32252)Excellent point @giesse. I should have thought a little more before posting.

ALANVF

[20:05](#msg600b3017cae490555f5fdc17)@giesse oh ok, that's still helpful though

## Thursday 11st February, 2021

ALANVF

[22:14](#msg6025ac5484e66b7f7ee8e8f5)update: Haxe 4.2 has come out so I'm not transitioning to that

## Sunday 14th February, 2021

ALANVF

[03:52](#msg60289e608031c8234bdd7d88)OOPS I meant to say "now" not "not" LMAO

GiuseppeChillemi

[08:25](#msg6028de919ba13e72e42b900d)I have thought, is HAXE so incompatible that @ALANVF will remain to a lower version?

[08:25](#msg6028de97dc108172e77745c3):-))))))

## Friday 19th February, 2021

ALANVF

[18:14](#msg60300007dc108172e789a3c4)FINALLY GOT IT WORKING WITH HAXE 4.2 OMG

[18:14](#msg603000117ba8124e5476ec4b)that took way too long

toomasv

[18:24](#msg603002707ba8124e5476f3fb):+1: Congratulations!

ALANVF

[18:25](#msg6030028293539e23438741c8)thank you!

[18:25](#msg60300298726a881d4f85bf12)(this is what I've been doing for the past several weeks btw lol)

[18:25](#msg603002b293539e2343874230)hopefully we can now have regular updates to red.js again

greggirwin

[18:37](#msg6030056ca7fc4b573be59ced)Updates to our tools, when things change, is one of the most painful things to deal with. Everything's working and then...months later...everything's working again.

[18:37](#msg6030057adc108172e789b320)Glad you got through it.

ALANVF

[18:38](#msg603005b18031c8234bf070d0)yeah it wasn't the most pleasant thing to deal with, but it should make a lot of things much easier to work with now

greggirwin

[19:42](#msg603014b747585464db8c20d7)What were the biggest pain points? We try not to break things, but know what's hardest for users from a real world case like this is something we can learn from.

## Saturday 20th February, 2021

GiuseppeChillemi

[15:02](#msg6031246ba8c6a77848208ad4)Nice question, I would like to see which difficulties you have encountered.

ALANVF

[16:09](#msg603134469337c51bc69c279d)@greggirwin A decent amount of it was just trying to work around Haxe's weird quirks, but a lot of it was mainly caused by not wanting to revisit (bad) old code

[16:10](#msg603134839337c51bc69c282f)Red thankfully doesn't have as many issues here as Haxe does, but I'm sure that there's still some old code that should probably be revisited at some point in Red's codebase (especially in R/S)

## Sunday 21st February, 2021

GaryMiller

[23:54](#msg6032f29c6825b964d624a882):+1: Congratulations! Keep up the good work! Hopefully future Haxe releases will be more backward compatible.

## Monday 22nd February, 2021

ALANVF

[01:34](#msg60330a214c792157490015fb)ye

## Saturday 27th February, 2021

GaryMiller

[20:38](#msg603aadd25d0bfb4e5876dba7)Just saw this and wondered if it would be synergistic with red.js under Haxe with the graphics, UI and compression libraries... https://hashlink.haxe.org/

## Saturday 6th March, 2021

ALANVF

[02:45](#msg6042ecd4823b6654d2880e00)@GaryMiller as cool as it seems, I'd say probably not. I currently have a lot of code that's optimized/written for Haxe's JS backend, so that wouldn't easily transition over to Hashlink very well without using a custom fork (which would not be convenient for others). I am also using Hashlink for another project of mine (my programming language \[Star](https://github.com/ALANVF/star)), and it seems to be a lot more annoying/boilerplate-y than JS, at least in Red.js' case

## Saturday 17th April, 2021

ALANVF

[16:37](#msg607b0edf2e5574669b41d41b)update: dealing with end-of-year stuff for school rn. once that's over with, I'll be able to work on red.js more regularly

greggirwin

[16:48](#msg607b115855d78266a64ef1c4)Thanks for the update!

## Sunday 18th April, 2021

GaryMiller

[04:10](#msg607bb128b9e6de24d640e331)Looking forward to all the great progress!

## Tuesday 11st May, 2021

ALANVF

[00:48](#msg6099d46bf7e4221825cc92c3)yay I'm done being dead for now

[00:48](#msg6099d46f4d0065337e65b900)\[!\[image.png](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/luqi/thumb/image.png)](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/luqi/image.png)

## Wednesday 12nd May, 2021

GaryMiller

[21:06](#msg609c43625ca66330b03c5e36)Does that mean schools out?

greggirwin

[21:13](#msg609c44f2e263442db8240cef)&gt; yay I'm done being dead for now

I was going to ask if this was a zombie thing.

ALANVF

[23:06](#msg609c5f7b233397424dbbe325)@GaryMiller yeah I'm done with high school now

[23:07](#msg609c5fa3e263442db8244e0f)@greggirwin does being a screen zombie count?

greggirwin

[23:10](#msg609c604fb10fc85b56918309)I'm a fan of Fuzzy Logic, so yes.

ALANVF

[23:10](#msg609c60815fff1f4a98d25a83)yay

## Friday 4th June, 2021

ALANVF

[01:59](#msg60b988f63c544b55fd9071c3)btw as an update (yes, another 3 weeks later), I'm optimizing some of the red.js internals because `function!`s are kinda slow rn

[02:03](#msg60b989e437c03a78331eb2ae)this is mainly because haxe does not optimize `Option` values, which are basically type-safe nullable types because they're an enum (aka tagged union)

GaryMiller

[19:59](#msg60ba860c659c2227485f3327)Haxe probably relies on the optimizers in the target compiler. Wouldn't the C compiler optimize them after the Haxe transpiles it? Or are the code changes to extensive for GCC optimizer?

ALANVF

[21:29](#msg60ba9b2a21d6d00b1fb53291)@GaryMiller well I'm targeting JS (cuz ya know, red.js) so C wouldn't help much anyways as haxe directly compiles to JS

[21:30](#msg60ba9b7737c03a7833213813)the other issue is that Option is just a regular type, not a magical compiler built-in, so it can't optimize it like regular nullable types (aka `Null`)

[21:33](#msg60ba9c13d48a4547601303ac)unless I figure out how to use haxe's outdated JS generator (used for custom codegen rules and stuff), I'm probably gonna have to manually go through and replace some uses of Option with Null (because Null is not boxed on JS, as anything can be null)

## Saturday 5th June, 2021

GaryMiller

[14:10](#msg60bb85c11e6aa460c011229c)Just thought that since emscripten converts from C to Javascript with very little speed penalty that there might be an advantage in leveraging the code optimization that C does first.

But if as you say Option could not be optimized any by the C compiler then there would be not advantage to generating C first and then going to JavaScript.

Having to alter JavaScript code after it has been generated Haxe each each time would get very tedious though unless you somehow automated the code changes in the make process correct?

## Sunday 6th June, 2021

ALANVF

[20:31](#msg60bd30ad0f247f448ea0102c)@GaryMiller well the thing is that the JS codegen thing that Haxe provides is part of the compiler api, so it directly changes how Haxe generates JS code at compile-time

[20:32](#msg60bd30fb5f235f6950763919)the main issue with it is that it's pretty old/outdated compared to what the compiler itself does

[20:35](#msg60bd319a9cc69444a023d809)here's the interface if you're curious: https://api.haxe.org/haxe/macro/JSGenApi.html

## Sunday 27th June, 2021

ALANVF

[22:35](#msg60d8fd30bef0c66d9d29b601)yay removed a bunch of boilerplate with some fancy macros and stuff

[22:36](#msg60d8fd5e6c992105fda26979)now to figure out why dead code elimination is broken

## Monday 28th June, 2021

greggirwin

[00:15](#msg60d914a6110daa37b10c5df2)Thanks for the update. Dead code elimination from your work, or Haxe back end?

ALANVF

[00:16](#msg60d914f965513b4d91360bbe)I guess for the backend? dead code elimination is basically a haxe feature where it optimizes the output code (in this case, JS) to get rid of stuff like unused types, functions, and variables

[00:18](#msg60d9154bbcb3e8060eea2b20)unfortunately, it was ignoring a lot of types I had defined for natives, and the only solution was to disable DCE for the natives (which means they weren't optimized, not fun)

[00:18](#msg60d9156f110daa37b10c5f84)I think I've got a fix for it now, but it's breaking something else so I gotta fix that too lol

[00:20](#msg60d915d09cf3171730fa773f)(and to no surprise, it was another DCE issue)

[00:21](#msg60d916198c12474d8cd75e61)in general DCE is supposed to be really helpful, but sometimes it can be counterproductive when using macros and stuff

greggirwin

[00:38](#msg60d91a1f24f0ae2a242f7f50)Optimizations are always a double-edged sword.

ALANVF

[00:42](#msg60d91afbeffd491d8c8af2a0)yea

## Tuesday 29th June, 2021

GaryMiller

[00:43](#msg60da6ccd6c992105fda58c15)Have you chatted with any of the HAXE JS authors? They might have something on their RoadMap that would take of that allowing you to concentrate on the RED port. By removing their boilerplate you may make it more difficult to upgrade to future versions of HAXE/JS.

## Friday 23th July, 2021

ALANVF

[22:58](#msg60fb498223956a5aa451b404)yay some progress

[22:58](#msg60fb49857331d202b5c8bbe0)\[!\[image.png](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/ybtd/thumb/image.png)](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/ybtd/image.png)

[22:58](#msg60fb49a6e9aaeb7fbe1aad87)also rewriting some datatypes to be more efficient and reflect their red/system impl

greggirwin

[23:42](#msg60fb53d172c37b6f456e280e)Nice. Thanks for the update.

ALANVF

[23:43](#msg60fb540c7331d202b5c8cfbe)ye

## Saturday 24th July, 2021

GaryMiller

[02:37](#msg60fb7ce2b8422d6f4f01f5b5)Exciting progress!

GiuseppeChillemi

[07:42](#msg60fbc45c926ce249e580ec70)Good!

ALANVF

[17:33](#msg60fc4ee858232d5ab4e1c398)thx

## Monday 23th August, 2021

ALANVF

[23:40](#msg612431d4f428f97a9f4955b6)yay new stuff

[23:40](#msg612431dc7cd57813a887b0f8)bind/in coming soon

[23:44](#msg612432f98065e87a8ea45524)I'm also gonna try putting up a runnable version of the new Red.js like the old version on replit sometime soon

## Tuesday 24th August, 2021

greggirwin

[03:50](#msg61246c7ad9a141754db11363):+1:

GaryMiller

[06:00](#msg61248ae71179346966dbadc5)Great news! Are you liking working with the new version a lot better than the old version?

ALANVF

[16:28](#msg61251e3a99b7d97528d15a0d)@GaryMiller it's been better in a lot of ways, although I haven't been too happy with how restrictive/incomplete haxe's type system is

[16:29](#msg61251e7bd206b85e4f5eee5f)essentially, I've traded boilerplate for different boilerplate

[16:31](#msg61251ef963dca8189120f0ba)there's also the issue of haxe's codegen, which is frequently dumb and adds overhead when it's completely unnecessary

[16:35](#msg61251fed4c7be06b797e34b7)(can probably meddle with the codegen later, but eh)

## Thursday 26th August, 2021

ALANVF

[01:15](#msg6126eb44d9a141754db69093)yeeeeeeeee more natives added (`bind`, `in`, `switch`, and `case`) and fixed tons of bugs

rebolek

[05:24](#msg612725a3f3449e13a43ab8f4):clap:

greggirwin

[05:32](#msg6127275a5b92082de168af8c)Sounds like you're making great progress.

## Monday 15th November, 2021

ALANVF

[20:44](#msg6192c6c4cd4972068bab0417)been a few months, but I'm slowly getting more time to work on stuff

[20:45](#msg6192c6dfa41fd206994463ab)I think I've also figured out how to make functions nested in objects work correctly

greggirwin

[20:53](#msg6192c8d698c13e7550378f44):+1:

ALANVF

[20:54](#msg6192c90d2197144e84c822e0)in my old impl, I passed around the current context everywhere (which is how I made it work there), but that obviously caused some other issues

[20:55](#msg6192c94fa41fd20699446871)apparently the object's context is bound to functions during creation only, although I'm still not 100% sure how `self` is bound but also inaccessible from the outside

[20:58](#msg6192ca07f2cedf67f9e74751)will continue investigating, but expect more stuff coming soon

[23:25](#msg6192ec6aa41fd2069944b24c)yay that works ig

[23:25](#msg6192ec6dee6c260cf77d9ad3)\[!\[image.png](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/ftKz/thumb/image.png)](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/ftKz/image.png)

[23:26](#msg6192ecc13f09d8573674e03b)no typechecking yet, but it works for now

## Tuesday 16th November, 2021

greggirwin

[16:13](#msg6193d8a1cd4972068bad2c3c)Cool. :+1:

## Thursday 25th November, 2021

gchiu

[18:07](#msg619fd0cfcdb5c1081a2f2609)What's the end game here for a GUI? Is it to implement VID in JS?

pekr

[18:23](#msg619fd48c76e3791755059556)I am not sure if it would not be wiser to map to something like Flutter. Btw, Graha - what is the state of Ren-C and WASM? Can it do R3 GUI?

cloutiy

[20:17](#msg619fef55b5ba9e5a11d636cd)\`textfield "First Name:" \[ required autocomplete .class1 .class2 .class3]

[20:19](#msg619fefc3c2cc0e5343cc7409)`button "Submit" [ post items/new ]`

## Friday 26th November, 2021

ALANVF

[02:54](#msg61a04c56026dc63ca617d812)@gchiu either that, or a dialect similar to VID that's better for building/manipulating the DOM

[02:56](#msg61a04ceab5ba9e5a11d6ea08)I can imagine that there would be a handful of dialects that would be used to expose much of JS' functionality in a nice and clean way, like using the DOM, async/await stuff, events, canvas, and maybe a R/S-like dialect for mapping to raw JS

gchiu

[14:51](#msg61a0f459cd3f06175dd7f377)@pekr i use renc regularly in browser for most of my work, but there's no current plan for a gui

cloutiy

[19:18](#msg61a13303026dc63ca619af3e)Would be interesting to see how to take advantage of an object's on-change function combined with websockets to deliver realtime changes between data and ui.

GiuseppeChillemi

[19:23](#msg61a13431197fa95a1c91953c)@gchiu How do you use RENC in browser? Have you some examples script somewhere?

## Saturday 27th November, 2021

gchiu

[03:13](#msg61a1a262b5ba9e5a11d99107)@GiuseppeChillemi try this. At http://hostilefork.com/media/shared/replpad-js/ once the renc has loaded into the browser, and you see the replpad prompt, type `do`

[03:14](#msg61a1a27b8853d3164019049b)once that loads, type `latest-of` , or, simply `latest-of 0.3.40`

[03:14](#msg61a1a2a3b5ba9e5a11d99167)the first detects the browser OS, and gives you a link to the latest builds for that os. in the second case I specify I want the build for windows 64

[03:16](#msg61a1a320cd3f06175dd94bcb)I've got scripts that print out my timesheets and invoices which work by calculating various things and then populate docx with these values

[03:17](#msg61a1a35176e3791755093d9f)So, even though I'm working in a hospital where I can't install anything, I can still use rebol in any browser

[03:18](#msg61a1a3858f98cb08119140a0)I've got another script that calculates which energy provider to use based on my current latest bill

[03:28](#msg61a1a5fb76e3791755094200)It's cool that we can use rebol in the browser to tell us where the latest build from CI is .. means we don't need to maintain a static web page

Oldes

[10:41](#msg61a20b44026dc63ca61b45fb)Sorry, but that is not Rebol anymore. At least for me.

[10:59](#msg61a20fa963c1e83c952f013e)And btw.. `latest-of` is a pure name. I don't know why would anybody want to download ren-c for different os than the one currently using. And be forced to remember the cryptic system tuples. Does anybody remember the number for the Amiga version?

[11:00](#msg61a20fd8b5ba9e5a11da5dc9)Never mind.. wrong chanbel for such comments.

## Monday 29th November, 2021

gchiu

[04:43](#msg61a45a6b63c1e83c95337909)My chess demo is working again. http://hostilefork.com/media/shared/replpad-js/ and type `do`

[04:44](#msg61a45a918853d316401e4985)to play the demo game, type chiu-vs-jensen
