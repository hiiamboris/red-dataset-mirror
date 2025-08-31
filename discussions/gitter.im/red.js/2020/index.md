# Archived messages from: [gitter.im/red/red.js](/gitter.im/red/red.js/) from year: 2020

## Saturday 16th May, 2020

ALANVF

[22:11](#msg5ec0652b90f6db31beeebc8c)Red.js repo: https://github.com/ALANVF/Red.js

[22:13](#msg5ec06583eb9b6f3162290859)Red.js interactive REPL link: https://redjs-compiled-repl.theangryepicbanana.repl.run

[22:15](#msg5ec0661d6675d830b1adef86)I feel like something else should be here, but I can't figure out what...

GiuseppeChillemi

[22:29](#msg5ec0694d347a503172f5b668)I am here, Waiting to see your progress!

ALANVF

[22:30](#msg5ec069770e8a3131e4c6bd6d):thumbsup:

GaryMiller

[23:40](#msg5ec079e0347a503172f5d43d)Very Exciting! Also exciting there are a few talented people working on getting a cross platform TypeScript compiler and others a TypeScript to C transpiler which would allow you to compile your TypeScript Red to a .exe https://deepu.tech/deno-runtime-for-typescript/ Since MicroSoft's .Net Core is crossplatform now it could be quicker path to 64 bits.

ALANVF

[23:40](#msg5ec07a08f3ce603074c26283)ah nice :thumbsup:

[23:41](#msg5ec07a12aac441316a819569)can't wait for 64 bits!

[23:42](#msg5ec07a54f3ce603074c26307)for now, I think that you could compile Red.js to WebAssembly and then turn that into an executable maybe?

## Sunday 17th May, 2020

ALANVF

[00:39](#msg5ec087ba28b53131490dc28b)Feature progress is now documented here: https://github.com/ALANVF/Red.js/blob/master/FEATURES.md

greggirwin

[01:34](#msg5ec094c1eb9b6f3162296010)Great chart! `B = Just broken.` :^)

ALANVF

[01:35](#msg5ec094f2347a503172f607ff)thanks (yes lol)

[01:35](#msg5ec094fd13878c30b583c68d)thought that summed it up pretty well

GiuseppeChillemi

[06:19](#msg5ec0d7560e8a3131e4c788e8)Yes, great chart, I have liked it a lot!

meijeru

[08:39](#msg5ec0f84c20d9bf30576d8447)The charts are great, and show your thoroughness. I am waiting with interest for your chart on `actions`.

planetsizecpu

[09:44](#msg5ec1076d28b53131490ebe47)Great stuff @ALANVF push hard!

endo64

[11:31](#msg5ec12080aac441316a82dd0a)Great work @ALANVF !

pekr

[11:38](#msg5ec122220e8a3131e4c82060)It would be nice if the `help` would somehow work? That might be the first thing ppl might try in a console?

ALANVF

[15:35](#msg5ec159dd347a503172f7a5bd)ah yea, I'll try adding that soon @pekr :thumbsup:

[15:36](#msg5ec159f290f6db31bef0b9d0)thank you @planetsizecpu and @endo64 :)

meijeru

[17:10](#msg5ec1701beb9b6f31622b2484)@ALANVF I have an up-to-date table of actions vs types, with inheritance indicated. Are you interested, if only for completeness check?

ALANVF

[17:11](#msg5ec1703cecc55a312d0b3488)Definitely!

[17:12](#msg5ec1707949a1b731847ea991)that would be very helpful

meijeru

[17:17](#msg5ec171c0b7b93c3189d73f7b)I will send it to you by e-mail. Meanwhile, this is a bug, I think:

```
> tail? []
RawLogic { cond: false }
```

ALANVF

[17:18](#msg5ec171d313878c30b5859df2)oh nice, thanks!

[17:18](#msg5ec171d6b7b93c3189d73f9d)will fix

meijeru

[17:20](#msg5ec17278863019312a661483)What e-mail address can I use for you?

ALANVF

[17:22](#msg5ec172bb20d9bf30576e97c4)theangryepicbanana@gmail.com should be good :thumbsup:

[17:44](#msg5ec1781b20d9bf30576ea3f2)\[!\[image.png](https://files.gitter.im/red/red.js/Ll96/thumb/image.png)](https://files.gitter.im/red/red.js/Ll96/image.png)

[17:44](#msg5ec1781b49a1b731847eba0e)fixed

hiiamboris

[18:07](#msg5ec17d65b7b93c3189d758b4)At some point you might want to run parts of the \[Red test suite](https://github.com/red/red/tree/master/tests) to become confident in the interpreter's quality

ALANVF

[18:08](#msg5ec17d88b7b93c3189d7594e)Ah yeah probably

[18:10](#msg5ec17e066675d830b1b035a0)I'll probably try doing that once I add more natives and actions

[18:35](#msg5ec1840a347a503172f80b75)\[!\[image.png](https://files.gitter.im/red/red.js/dhyP/thumb/image.png)](https://files.gitter.im/red/red.js/dhyP/image.png)

[18:36](#msg5ec1842ff3ce603074c495ca)it's not complete (due to most datatypes not having actions) but it works

[20:02](#msg5ec1984990f6db31bef14863)New update for version 0.0.5:  
\- Added `case` native.  
\- Added basic actions for `datatype!`.  
\- Fixed bug where `tail? []` would return false.  
\- Added basic actions for `path!`, `lit-path!`, `set-path!`, and `get-path!`.  
\- Added an interactive help function (although it's fairly incomplete).  
\- Added some of the built-in helper functions.  
\- Error messages related to missing type actions are now more descriptive.

[20:04](#msg5ec198b46675d830b1b06eb2)The \[Red.js REPL](https://redjs-compiled-repl.theangryepicbanana.repl.run) has also been updated to version 0.0.5

hiiamboris

[20:08](#msg5ec199d4347a503172f83d88):+1:

## Monday 18th May, 2020

Respectech

[02:04](#msg5ec1ed15347a503172f8f0ea)Is it possible to control the DOM using Red.js?

hiiamboris

[07:56](#msg5ec23f976675d830b1b1d4aa)It's in the `TODO.md` ;)

GaryMiller

[10:57](#msg5ec26a2a16ae6a315f26d309)I don't think DOM control is possible in Web Assembly directly yet though. So you may have to choose betweenn DOM and speed if transpiling to Web Assembly is a lot faster. But the following article seems to state that it's not under some circumstances.

Rossberg said that WASM is really just this sandboxed virtual instruction set. It doesn't have any capabilities in itself. But one of the first questions you get is, how do I access the DOM? The answer is you can't directly, you have to go through JavaScript, and that's by design.

https://www.theregister.co.uk/2020/01/17/webassembly\_key\_to\_a\_highperformance\_web\_or\_ideal\_for\_malware/

hiiamboris

[12:21](#msg5ec27de670f28c384b818810)Interesting that this room also gets the full commit activity on the right. If anything it should receive the activity from Red.js repo

[12:22](#msg5ec27e05e8153a39805c2fe1)I wonder if there's a mask like `/red/red*` that pushes it here

[12:25](#msg5ec27ec53854713815b73a6b)@x8x would you happen to know anything about this?

greggirwin

[15:54](#msg5ec2af9a0f31e03a3071fdfe)I entered the red.js repo name when setting it up, but it seems Gitter doesn't use that because it's not under the Red organization on github. My best guess anyway.

ALANVF

[15:54](#msg5ec2afc3990d343a5f36c333)Yeah I noticed that

[15:55](#msg5ec2afe12f83c139ef8bf231)maybe put the repo link in the description for now?

greggirwin

[15:57](#msg5ec2b04d70f28c384b821cce)Done.

ALANVF

[15:57](#msg5ec2b07770f28c384b821d1d):thumbsup:

meijeru

[16:52](#msg5ec2bd5d6773a13b23ebb714)A suggestion to add one tiny feature to `help`: if the user types it without an argument (which is what many users will do first, I suppose), answer with a short explanation of how to use help. This is what the Red console does too.

ALANVF

[16:53](#msg5ec2bd8d0506d43ab18f18cb)yeah that's supposed to happen

[16:54](#msg5ec2bdbb940fa238d6fe5b14)but I somehow have accidentally fixed the "bug" that lets you leave out function arguments at some point in time

[16:54](#msg5ec2bdc5990d343a5f36e969)so I need to go back and "unfix" it

hiiamboris

[17:10](#msg5ec2c19b6773a13b23ebc18c)This should only be allowed for arguments accepting `unset!` type

ALANVF

[17:11](#msg5ec2c1ae0f31e03a30722ea6)yeah

[17:11](#msg5ec2c1b5e8153a39805ce1b5)or `any-type!`

hiiamboris

[17:11](#msg5ec2c1c66773a13b23ebc215)which includes unset ;)

ALANVF

[17:11](#msg5ec2c1cab8869e38c4972c0a)yea

[17:12](#msg5ec2c217f7c0af39ee15a2e5)I'd probably have to add a hack/special case for that temporarily, since type signatures aren't actually checked yet

## Tuesday 19th May, 2020

dockimbel

[18:02](#msg5ec41f3b0506d43ab1928373)@x8x So, could you figure out how to tie the activity panel in this room to the right repo?

## Wednesday 20th May, 2020

ALANVF

[18:04](#msg5ec5712ea1aa566f083a911a)new stuff coming soon-ish

[18:04](#msg5ec57130b761400e29d9600d)\[!\[image.png](https://files.gitter.im/red/red.js/uKvG/thumb/image.png)](https://files.gitter.im/red/red.js/uKvG/image.png)

greggirwin

[18:14](#msg5ec573736e837c7743c25fd9):+1:

rebolek

[18:29](#msg5ec576ef63c8e90e43ff0077)@ALANVF so I tried Red.js again, still no success.  
I have Node 13.13.0  
I installed typescript with `npm install -g typescript`, says `+ typescript@3.9.3`  
I copied example from README to file `test.ts` and tried to run it with `node test.ts`  
I got error `(node:2711185) Warning: To load an ES module, set "type": "module" in the package.json or use the .mjs extension.`  
so I added `"type": "module"` to `package.json` and  
now I get error:

```
(node:2727770) ExperimentalWarning: The ESM module loader is experimental.                                                                                                                                          
internal/modules/run_main.js:54
    internalBinding('errors').triggerUncaughtException(
                              ^

TypeError [ERR_UNKNOWN_FILE_EXTENSION]: Unknown file extension ".ts" for /home/sony/code/Red.js/test.ts
```

ALANVF

[18:29](#msg5ec57719d7f8a20ddf80d0c9)hmm that's odd

rebolek

[18:40](#msg5ec579873be96c0df9954417)Ok, thanks. I try and let you know.

ALANVF

[18:40](#msg5ec579920fbf8b1758835988):thumbsup:

[18:40](#msg5ec579aeb761400e29d97545)if you still can't do it, the web repl should work until I fix whatever is causing this issue

rebolek

[20:24](#msg5ec591fd13b79205dc880fdc)So my journey continues...after some tries I found out I need to `npm i @types/node` and then I can `tsc --target es2020 test.ts`which finally runs without any errors!

[20:24](#msg5ec5921963c8e90e43ff461f)Now I've got `test.js` which is compiled `test.ts` I suppose. So, what is next step?

[20:39](#msg5ec595879832dd6f046520b6)Ok, this one was ugly. I manually added `.js` to every `import` in every `.js` file and now \*\*it works\*\*!

x8x

[20:41](#msg5ec595e7cf55346b5fbd5fab)@dockimbel @hiiamboris Activity panel should now display Red.js/master commits.

ALANVF

[20:43](#msg5ec596703d81ad77584871bb)nice @rebolek !

[20:44](#msg5ec59697b761400e29d9ccd9)(although I thought that you should be able to just do `node test.js` but whatever)

hiiamboris

[20:45](#msg5ec597020fbf8b175883a280)@x8x this is what I'm seeing:  
!\[](https://i.gyazo.com/c02c3cea1f04354ac87797c062605bca.png)

[20:46](#msg5ec597090fbf8b175883a296)could be a gitter glitch though

ALANVF

[20:46](#msg5ec5971113b79205dc881c70)yea same here

rebolek

[20:46](#msg5ec59715b761400e29d9cdab)@ALANVF I tried but it gives error message on every `import`, like

```
Error [ERR_MODULE_NOT_FOUND]: Cannot find module '/home/sony/code/Red.js/red-types' imported from /home/sony/code/Red.js/runtime/datatypes/series.js
```

ALANVF

[20:46](#msg5ec59730d7f8a20ddf812b54)hmm

[20:46](#msg5ec5973cb761400e29d9ce13)I'll have to look into that I guess

[20:47](#msg5ec5974b13b79205dc881cf7)glad you got it working though!

rebolek

[20:47](#msg5ec597763d81ad7758487460)Yeah, I'm glad too :-) I'll write a guide what needs to be installed in order to get it running.

ALANVF

[20:48](#msg5ec597873be96c0df99593ce)sounds good :thumbsup:

hiiamboris

[20:50](#msg5ec59814cf55346b5fbd6495)okay next commits are visible it seems

ALANVF

[20:50](#msg5ec5981a0fbf8b175883a646)nice

[20:51](#msg5ec5983563c8e90e43ff552b)Changelog for update 0.0.6:  
\- Added basic construction syntax support.  
\- Added `value?` native.  
\- Improved some code formatting.  
\- `number!` and `any-word!` are now located in `system/words`.  
\- Added `and`, `or`, and `xor` operations for `typeset!`s.  
\- `pair!`, `tuple!`, and `time!` no longer box their values (internal).

[20:52](#msg5ec598920fbf8b175883a718)I'm thinking that I should probably look at using the "releases" feature for future releases btw

[20:53](#msg5ec598b53be96c0df995971e)that way I can make commits without it having to be an entire update

x8x

[20:55](#msg5ec59926cf55346b5fbd67c4)There is no way to manipulate or clear current items in the activity panel, flushing the wrong ones with empty items is one workaround.

dockimbel

[21:44](#msg5ec5a4a2cf55346b5fbd8626)@x8x Thank you, seems to be working fine now! :+1:

greggirwin

[22:09](#msg5ec5aa83b761400e29d9ff8e)Thanks @x8x. What is the fix, for future reference?

blue13144\_twitter

[22:37](#msg5ec5b14313b79205dc886150)hi

x8x

[23:01](#msg5ec5b6c9e4e9556b5c909017)@greggirwin A custom webhook, unfortunately colors can not be set to make it look like the real one.

## Thursday 21st May, 2020

greggirwin

[00:00](#msg5ec5c4b1c6541c05d8ee62fb)OK, thanks.

meijeru

[11:11](#msg5ec661ed4c9b0f060d151ac2)@blue13144\_twitter Welcome! May we know a little bit about yourself? There is no profile on Github, I think.

## Sunday 24th May, 2020

ALANVF

[19:01](#msg5ecac49027513a72fbad7bbc)Changelog for update 0.0.7:  
\- Fixed `to` action.  
\- Reimplemented `char!` and `string!`.  
\- Added basic actions for `char!`.  
\- Fixed inconsistent `mold` behavior for `string!` and `char!`.  
\- Fixed `pick` and `poke` bugs.  
\- Added `unset` native.  
\- Added more utility functions.  
\- Fixed a context bug.  
\- Added `union` native (paritally).  
\- Added more supported types for `make block!`.  
\- Added `to` action for `block!`.  
\- Added `copy` action for `string!`.  
\- Fixed an issue where function refinements that didn't take any arguments would be ignored.  
\- Made the interactive help function better.  
\- Added all typesets.

hiiamboris

[19:02](#msg5ecac4e04412600ccd655490):+1:

ALANVF

[19:08](#msg5ecac62d89941d051a1d3de0)the repl has also been updated to the latest version for those who want to try it out

endo64

[19:22](#msg5ecac9614c9b0f060d1f0a2f)Good progress 👍

ALANVF

[19:22](#msg5ecac97127513a72fbad8761)thank you!

## Monday 25th May, 2020

rcqls

[05:23](#msg5ecb5649225dc25f54a35d9b)@ALANVF Nice project! I have just tried to execute the code you provide in the REAME and everything works fine with node (not considering the 83 errors in the typescript compilation but I guess it is normal). Following your README you'll plan to offer to run `Red.js` in the browser (not the repl.it that does not work for me BTW). I guess you have in mind to create a self-contained `Red.js` file. When do you plan to start it since I think it would be awesome (above all in combination with red/view ).

rebolek

[07:46](#msg5ecb77b989941d051a1ebcef)@rcqls what errors do you have in Typescript? I managed to get it down to zero.

rcqls

[07:59](#msg5ecb7acdf0b8a2053ab01df5)@rebolek As I said it is just in the compilation (in fact transpilation) process but the generated `test.js` (and all other js files) was perfect to execute with `node`. As a part of the output:

```
red-types.ts:38:6 - error TS1056: Accessors are only available when targeting ECMAScript 5 and higher.

38  get word() {
        ~~~~

red-types.ts:48:6 - error TS1056: Accessors are only available when targeting ECMAScript 5 and higher.

48  get word() {
        ~~~~
…..

514  		return ((1n << (7n - (BigInt(byte) & 7n)) & this.bytes) != 0n) != this.negated;
     		                                                           ~~

red-types.ts:525:16 - error TS2

…..

tokenizer.ts:48:6 - error TS1056: Accessors are only available when targeting ECMAScript 5 and higher.

48  get eof() {
        ~~~

tokenizer.ts:99:27 - error TS2339: Property 'startsWith' does not exist on type 'string'.

99  	const res = this.stream.startsWith(str, this.pos);
    	                        ~~~~~~~~~~


Found 83 errors.
```

rebolek

[08:27](#msg5ecb816eb101510b20160cc1)@rcqls try `tsc -t es2020 test.ts`, were `-t` is target and enables newer features.

rcqls

[08:29](#msg5ecb81e9a91f120a6cbf1a06)@rebolek Thanks but still 4 errors:

```
$ tsc -t es2020 test.ts
red.ts:9:28 - error TS2307: Cannot find module 'fs' or its corresponding type declarations.

9 import {readFileSync} from "fs";
                             ~~~~

runtime/actions.ts:29:20 - error TS2307: Cannot find module 'process' or its corresponding type declarations.

29 import {send} from "process";
                      ~~~~~~~~~

runtime/natives.ts:28:6 - error TS2580: Cannot find name 'process'. Do you need to install type definitions for node? Try `npm i @types/node`.

28  	if(process == null) {
    	   ~~~~~~~

runtime/natives.ts:31:4 - error TS2580: Cannot find name 'process'. Do you need to install type definitions for node? Try `npm i @types/node`.

31  		process.stdout.write(RedActions.$$form(ctx, val).toJsString());
    		~~~~~~~


Found 4 errors.
```

rebolek

[08:30](#msg5ecb82162280c80cbfc7f801)For the `process` error, do what it says: `npm i @types/node`

rcqls

[08:30](#msg5ecb82344412600ccd66ef6c)@rebolek but it is worth since the `test.js` no more works!

rebolek

[08:30](#msg5ecb823a3ffa6106f1d13479)It may probably fix the `fs` error too, I'm not sure, I need to look.

[08:31](#msg5ecb82689da05a060a2c22e8)@rcqls oh...anyway, I was able to get rid of all errors and final `test.js` worked.

rcqls

[08:34](#msg5ecb82fbff7a920a720d5666)@rebolek In my case, the `test.js` generated by`tsc test.js` just works fine even after 83 errors of transpilation.

rebolek

[08:34](#msg5ecb83307da67d06facce3e4)Interesting.

[08:35](#msg5ecb836989941d051a1ede18)I actually first solved the errors and then tried if it's working, so maybe my "broken" version would be able to work too, I just haven't tried before I had error-free compilation.

ALANVF

[15:07](#msg5ecbdf25ff7a920a720e442a)@rcqls for the record:  
`tsc`: Used for compiling TypeScript to JavaScript.  
`node`: Used for running JavaScript.

[15:10](#msg5ecbe0029da05a060a2d1358)other things you may want to do as well:  
\- make sure you have TypeScript 3.9.2 (or later) installed.  
\- make sure you have Node 12.13.1 (or later) installed.  
\- verify that `tsconfig.json` is in the project directory.  
\- make sure that you have the NPM package `@types/node` installed.

[15:12](#msg5ecbe0522c49c45f5a9efd3f)if all of those check off but you're still getting errors, let me know and I can try to see what's going on

rcqls

[15:59](#msg5ecbeb52f0b8a2053ab15244)@ALANVF Everything is as you mentionned:

```
rcqls@macbook-3 ~/tmp/AlanVS/Red.js $ node --version
v14.3.0
rcqls@macbook-3 ~/tmp/AlanVS/Red.js $ tsc --version
Version 3.9.3
rcqls@macbook-3 ~/tmp/AlanVS/Red.js $ npm i @types/node
npm WARN red.js@0.0.7 No repository field.
npm WARN red.js@0.0.7 No license field.

+ @types/node@13.13.9
updated 1 package and audited 1 package in 1.054s
found 0 vulnerabilities
```

Only 35 errors now after @rebolek told me about `npm i @types/node` (put above just to check if my install was good).

ALANVF

[15:59](#msg5ecbeb734412600ccd680610)hmm

rcqls

[16:00](#msg5ecbeb9aa91f120a6cc02fc8)@ALANVF As I told you, the `test.js` runs properly.

ALANVF

[16:00](#msg5ecbebba7da67d06face0180)oh ok, so that works?

[16:01](#msg5ecbebc9ff7a920a720e663f)I'm not sure why you get 35 errors however

rcqls

[16:01](#msg5ecbebdb4412600ccd680782)As a wish, I would prefer to run the test in the browser…. :smile:

ALANVF

[16:01](#msg5ecbebe2b101510b20172a2e)have you tried `tsc --build`?

[16:02](#msg5ecbec0db101510b20172a8f)oh there's a repl that you can use in the browser if you'd like

[16:02](#msg5ecbec27a91f120a6cc03135)https://redjs-compiled-repl.theangryepicbanana.repl.run/

rcqls

[16:05](#msg5ecbecb9225dc25f54a4e90d)As I mentionned in my first message, I am not really interested to have a repl, `red` is perfect. Some sort of transpiling red code to js is much more interesting (or simply as you mentionned it in your README executing red code in the browser). Do you have plan for that?

[16:06](#msg5ecbecf54c9b0f060d21b58c)BTW:

```
rcqls@macbook-3 ~/tmp/AlanVS/Red.js $ tsc --build ./test.ts
error TS5083: Cannot read file '/Users/rcqls/tmp/AlanVS/Red.js/test.ts/tsconfig.json'.


Found 1 error.
```

ALANVF

[16:06](#msg5ecbed1727513a72fbb028ea)Transpiling to js would be very cool, however due to the structural differences between js and red, it would take a very long time to implement, and it'd probably be more buggier than the interpreter

rcqls

[16:10](#msg5ecbedda549761730b57dcc5)I thought one of your choice about choosing development with typescript would be creation of a standalone file `libred.js`. In the same spirit \[https://opalrb.com/](https://opalrb.com/) is awesome for transpiling `ruby` to `js`.

ALANVF

[16:11](#msg5ecbee2089941d051a2004ed)Yeah I'm not saying that it'll never happen, but rather that it'll take quite a while to be able to get there

rcqls

[16:13](#msg5ecbee922c49c45f5a9f281a)Ok, many thanks for your answer! :ok\_hand:

ALANVF

[16:13](#msg5ecbee9fb101510b2017331f)glad I could help :)

rcqls

[16:15](#msg5ecbef21b101510b20173416)BTW `tsc —build` works. The default target is `es5` on my computer and the tsconfig mentionned `esnext`. So everything is fine with this target.

ALANVF

[16:15](#msg5ecbef343ffa6106f1d2582f):thumbsup:

rcqls

[16:40](#msg5ecbf4e24412600ccd682955)@ALANVF Also, I quickly created this `run.ts` script that allows us to execute any red file.

```
import Red from "./red";

/* this stuff is temporary */
Red.evalRed(`
	get: make native! [[
			"Returns the value a word refers to"
			word	[any-word! refinement! path! object!]
			/any    "If word has no value, return UNSET rather than causing an error"
			/case   "Use case-sensitive comparison (path only)"
			return: [any-type!]
		]
		get
	]
`);
Red.evalFile("./core/natives.red");
Red.evalFile("./core/actions.red");
Red.evalFile("./core/operators.red");
Red.evalFile("./core/scalars.red");
Red.evalFile("./core/functions.red");
Red.evalFile("./core/interactive.red");
/* ------------------------------------- */

var redfile=process.argv[2];
Red.evalFile(redfile);
```

Maybe you could adapt your `app.rb` (that looks like a repl) in order to include the execution of red file. Even you could create a bashfile which would be some sort of red-console but with `typescript/node` engine.

ALANVF

[16:41](#msg5ecbf52f7da67d06face1dd1)Yeah that's a good idea, I just haven't thought of doing that because it's not practical to use during development :sweat\_smile:

[16:42](#msg5ecbf55e9da05a060a2d4f38)and command-line parameters won't work for those who actually run this using browser javascript (as opposed to node, which runs natively)

[16:42](#msg5ecbf585778fad0b1325d591)(although now that I think about it, readline doesn't work in browser.js either)

rcqls

[16:43](#msg5ecbf59989941d051a201f4c)I think it could be good too to execute red test file….

ALANVF

[16:43](#msg5ecbf5a2b101510b201749ae)yea probably

meijeru

[19:58](#msg5ecc23512c49c45f5a9fb8b9)@ALANVF I notice in your `/core/scalars.red` the following:

```
number!:		make typeset! [integer! float! percent! money!]
scalar!:		union number! make typeset! [char! pair! tuple! time! date!]
```

but in Red, in `/environment/scalars.red`:

```
number!:		make typeset! [integer! float! percent!]
scalar!:		union number! make typeset! [money! char! pair! tuple! time! date!]
```

I suppose you need to correct this.

ALANVF

[21:03](#msg5ecc32904c9b0f060d227da6)@meijeru Yeah that's because Red.js has the `money!` type but the official Red repo does not yet

## Tuesday 26th May, 2020

hiiamboris

[08:31](#msg5eccd3c92c49c45f5aa13521)even in fast-lexer, it does not belong to numbers, only to scalars

ALANVF

[12:57](#msg5ecd123a9da05a060a3026dd)@hiiamboris ah ok. I'll make sure to change that :thumbsup:

[14:49](#msg5ecd2c692c49c45f5aa260ef)yay fixed `unset!` function arguments

[14:49](#msg5ecd2c6b2c49c45f5aa260f3)\[!\[image.png](https://files.gitter.im/red/red.js/yDHj/thumb/image.png)](https://files.gitter.im/red/red.js/yDHj/image.png)

hiiamboris

[14:57](#msg5ecd2e47549761730b5b3511);)

meijeru

[19:24](#msg5ecd6cd1778fad0b1329ee9d)@ALANVF Is `repl.it` updated on the network everytime you update the source, or not? When I go to `https://redjs-compiled-repl.theangryepicbanana.repl.run/` I get "not implemented" for many features that you announce as having been implemented. Or do I do something wrong?

ALANVF

[19:41](#msg5ecd7102549761730b5c3b3f)@meijeru The version of Red.js on repl.it is updated for every major release (most recent was version 0.0.7)

meijeru

[20:14](#msg5ecd7888225dc25f54a94f8c)OK so we are still at 0.0.7, which explains why `help` without argument errors out, right?

ALANVF

[20:58](#msg5ecd82f7b101510b201ba1c4)yes

## Saturday 30th May, 2020

ALANVF

[18:21](#msg5ed2a4362280c80cbfdb5174)Making some progress on parsing `date!` literals: https://repl.it/@theangryepicbanana/red-date-parsing

greggirwin

[18:56](#msg5ed2ac76a91f120a6cd262d0):+1:

```
 12-jan-2020
[eval].ts:1:4 - error TS2304: Cannot find name 'jan'.

1 12-jan-2020
     ~~~
```

ALANVF

[19:07](#msg5ed2aef07da67d06fae0549e)yeah it's not implemented yet

[19:07](#msg5ed2af074c9b0f060d33ebbc)but the parsing rules exist (in the current beta version)

[19:09](#msg5ed2af4fb101510b20294487)\[!\[image.png](https://files.gitter.im/red/red.js/lIWw/thumb/image.png)](https://files.gitter.im/red/red.js/lIWw/image.png)

greggirwin

[19:18](#msg5ed2b181225dc25f54b717ad)Ah, OK.

## Sunday 31st May, 2020

ALANVF

[20:20](#msg5ed411714c9b0f060d37033e)Changelog for version 0.0.8:  
\- Added `negative?`, `positive?`, `max`, and `min` natives.  
\- Added support for `binary!` literals.  
\- Added support for `map!` literals.  
\- File loading now works in browser js.  
\- `do` now accepts `file!`s.  
\- `lit-word!` arguments that accept `unset!` now work.  
\- Added support for `tag!` literals.  
\- Added support for `date!` literals.

[20:22](#msg5ed412057da67d06fae35e2f)as a fun fact, Red.js now supports all literal values (at least to some extent)

greggirwin

[20:45](#msg5ed41761a91f120a6cd59092)Nice! Note that we recently add a `ref!` form for `@reference` values.

GaryMiller

[22:10](#msg5ed42b59549761730b6d6f96)@ALANVF Great Progress! Checking for your updated Changelog has become the most exciting part of my day!

ALANVF

[22:11](#msg5ed42b7c4c9b0f060d373f2f)Thank you for your support! :)

## Monday 1st June, 2020

ALANVF

[22:22](#msg5ed57f95225dc25f54bdb5a8)Got refinements working for natives/actions now :)

[22:22](#msg5ed57f98a3a1b13679bf4b9b)\[!\[image.png](https://files.gitter.im/red/red.js/2U85/thumb/image.png)](https://files.gitter.im/red/red.js/2U85/image.png)

[22:22](#msg5ed57fb7225dc25f54bdb5f4)(and also fixed refinements for functions in the process)

greggirwin

[22:32](#msg5ed5820cf0b8a2053aca1c37)Cool!

## Tuesday 2nd June, 2020

GaryMiller

[01:32](#msg5ed5ac452c49c45f5ab8372d)Bravo!

endo64

[10:43](#msg5ed62d44778fad0b1340162c)Nice!

## Friday 5th June, 2020

GiuseppeChillemi

[20:11](#msg5edaa704daf4cf366ee41046)I don't know if this question has already been asked. Why not a transpiler?

GaryMiller

[21:26](#msg5edab87e2c49c45f5ac5b89b)Isn't that what the current compiler does? It has to have some semblance of a interpreter in it to handle all the really dynamic code. Unless it was compiled by a language that was just as dynamic as RED like a common lisp compiler.

ALANVF

[21:27](#msg5edab8b34c9b0f060d487537)perhaps, but there's a good reason why there aren't a whole lot of lisp-&gt;js transpilers out there

## Saturday 6th June, 2020

pekr

[04:42](#msg5edb1eab4c9b0f060d4945a9)I think that for a full fledged Red in a browser (including GUI), it might be more sufficient to have a WASM target and use browser only as a transport layer / container to display the Red app.

ALANVF

[18:14](#msg5edbdd17225dc25f54cdef3f)new release hopefully coming out sometime today!

rebolek

[18:22](#msg5edbdee7b101510b20406480):clap:

ALANVF

[21:59](#msg5edc11df7f08394226cf48c6)Changelog for update 0.0.9:  
\- Fixed `skip` bug.  
\- Added `extract` helper function.  
\- Fixed refinement arguments.  
\- Improved `poke` for `series!` types.  
\- Unified `percent!` behavior.  
\- Added `shift` native.  
\- Added trigonometric natives.  
\- Added `nan?` and `zero?` natives.  
\- Added more math natives.  
\- Added `absolute`, `negate`, and `power` actions.  
\- Added (partially incomplete) `make`/`to` actions for `integer!` and `float!`.  
\- Added some more helper functions.

[23:08](#msg5edc220a9da05a060a573367)yay update 0.1.0 will be able to run the Red demo

[23:09](#msg5edc220ea91f120a6ce9f678)\[!\[image.png](https://files.gitter.im/red/red.js/9169/thumb/image.png)](https://files.gitter.im/red/red.js/9169/image.png)

## Sunday 7th June, 2020

rcqls

[00:15](#msg5edc3199a91f120a6cea16e7):clap: Really good news!

GaryMiller

[02:19](#msg5edc4ea73ffa6106f1fca979)Will Red.js programs have any size or memory limitations? If for example you had a very large Red program with say 200,000 lines.

[03:08](#msg5edc5a41a3a1b13679d0c322)@ALANVF I found this.. By default, Node. js (up to 11. x ) uses a maximum heap size of 700MB and 1400MB on 32-bit and 64-bit platforms, respectively.May 16, 2019

But not really sure you could translate those numbers to lines of code very easily or accurately

I was surprised though that jumping from 32 bit to 64 bit only doubled maximum heap size.

toomasv

[04:05](#msg5edc67732c49c45f5ac96a0c)@ALANVF Great work! :+1:

ALANVF

[15:19](#msg5edd05773ffa6106f1fe3dca)thank you :)

## Tuesday 9th June, 2020

greggirwin

[00:34](#msg5eded90aa3a1b13679d6d769)Indeed. Progress is made by many small steps.

ALANVF

[01:26](#msg5edee5444c9b0f060d5256c8):100:

## Saturday 20th June, 2020

ALANVF

[01:50](#msg5eed6b68a813c72dcffb7125)ye been busy lately

[01:50](#msg5eed6b83c4bdd83475f47882)0.1 will hopefully come out by/before the end of of june

greggirwin

[18:40](#msg5eee582a6c06cd1bf444a166):+1: Thanks for keeping us posted.

## Sunday 21st June, 2020

ALANVF

[20:47](#msg5eefc764a813c72dcf005ea7)Red.js version 0.1.0 is now out with the following changes:  
\- Fixed `#include` directive.  
\- Fixed get-path/set-path bugs.  
\- Fixed `pick` bug.  
\- `print` now prints values correctly.  
\- Added `string!` comparison.  
\- Added bit-shift operators.  
\- Fixed a `case` bug.  
\- Added some testing scripts.  
\- Carets are now allowed in identifiers.  
\- Fixed `to block!` for strings and maps.  
\- Fixed a typo in the tokenizer.  
\- Fixed some `block!` and `paren!` actions.  
\- Fixed a thing related to `map!` keys.  
\- Added some actions for `pair!`s.  
\- Fixed `bitset!` internals.  
\- Fixed `form` for `refinement!` values.  
\- Fixed `mold` issues for:  
\- `op!`  
\- `native!`  
\- `action!`  
\- `function!`  
\- `context!`  
\- `object!`  
\- `logic!`  
\- Added `form`/`mold` support for most remaining datatypes:  
\- stringy types  
\- `map!`  
\- `unset!`  
\- `binary!`  
\- `issue!`  
\- `time!`  
\- `tuple!`  
\- `percent!`  
\- `hash!`  
\- `vector!`  
\- `bitset!`  
\- `date!`  
\- Accidently broke tests/demo.red (but I'll fix that later).

[20:48](#msg5eefc789a813c72dcf005f0a)(the REPL has also been updated to 0.1.0)

greggirwin

[20:51](#msg5eefc867c223cc536a29621a)Looks like good progress!

ALANVF

[20:52](#msg5eefc8886c06cd1bf4478649)Thanks!

[21:24](#msg5eefd0227ba3965373bedeb4)I think I've mentioned this before, but please feel free to report any bugs you find with Red.js (since I can't possibly find all of them myself)

GaryMiller

[21:28](#msg5eefd107613d3b3394fde554)Amazing Progress!

What has been your strategy for deciding what to work on next?

Are you starting with the most low level code and working your way up from there?

Isn't there a higher of top layer code called mezzanine layer that is written in Red code.

At that layer would you just use the existing mezzanine functions in your RED interpreter that has been transpiled to JS or would you need to transpile the mezzanine level functions too for performance or because your lower level data structures for Red internals are different maybe?

meijeru

[21:36](#msg5eefd2ddec4a341beedf2dc2)What progress! But I noticed a small error: `extract` gets stuck when presented with a block that does not contain a number of components that is a multiple of the second argument.

ALANVF

[21:36](#msg5eefd2f6b8152d348456a66d)o

[21:38](#msg5eefd339bb149531edc1e8cf)hmm ok I'll look into that. I think I had the change the source for `extract` at some point because it used something that I haven't implemented yet (so that's probably why it breaks)

rcqls

[22:08](#msg5eefda6b613d3b3394fdf7eb)@ALANVF playing with `demo.red`, `i > gap-end` returns integer 0 (instead of logic `false`) for i=1 and gap-end=20 interpreted wrongly as `true`.

ALANVF

[22:20](#msg5eefdd15a813c72dcf008c54)ah thanks @rcqls !

[22:20](#msg5eefdd38a813c72dcf008c88)yeah I must have overlooked that at some point because the demo was working like a week ago

rcqls

[22:25](#msg5eefde54a813c72dcf008e79)@ALANVF BTW great job! :clap:

ALANVF

[22:26](#msg5eefde893a0d3931faa70698)thank you :)

rcqls

[22:28](#msg5eefdf1bec4a341beedf4530)@ALANVF replacing `i > gap-endf` with `greater? i gap-end` makes the demo.red working!

[22:29](#msg5eefdf53c4bdd83475f9aa66)

```
~/tmp/AlanVS/Red.js $ ./red.sh demo.red

		RedRed              d
		d     d             e
		e     e             R
		R     R   edR    dR d
		d     d  d   R  R  Re
		edRedR   e   d  d   R
		R   e    RedR   e   d
		d    e   d      R   e
		e    R   e   d  d  dR
		R     R   edR    dR d
```

ALANVF

[22:29](#msg5eefdf546c06cd1bf447b2dc)ah ok (that works for some reason?)

[22:29](#msg5eefdf65c223cc536a299035):thumbsup:

[22:30](#msg5eefdf7bec4a341beedf4618)that makes me wonder if I accidentally typed an extra 0 at some point somewhere :sweat\_smile:

rcqls

[22:31](#msg5eefdfc13a0d3931faa708b4)

```
rcqls@macbook-3 ~/tmp/AlanVS/Red.js $ node app.js
> 1 > 10
RawInteger { value: 0 }

> 10 > 1
RawInteger { value: 5 }
```

ALANVF

[22:31](#msg5eefdfda3a0d3931faa708ff)waaa

[22:32](#msg5eefdff1b8152d348456c2e0)oh I wonder if it's from the bit-shift ops I added

[22:32](#msg5eefe00ac4bdd83475f9aba4)https://github.com/ALANVF/Red.js/blob/master/core/operators.red#L19

[22:32](#msg5eefe00f613d3b3394fe031a)lemme see something then

[22:33](#msg5eefe040e0e5673398c818e9)yes it is apparently

[22:33](#msg5eefe0437ba3965373befd71)\[!\[image.png](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/H5Wb/thumb/image.png)](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/H5Wb/image.png)

## Monday 22nd June, 2020

rcqls

[04:04](#msg5ef02db3613d3b3394fe8fb5)@ALANVF You’re right something goes wrong if you compare `:>=` and `:>`:

```
> :>=
Op {
  name: '>=',
  func: Native {
    name: 'greater_or_equal_q',
    docSpec: RawString { values: [Array], multiline: false, index: 1 },
    args: [ [Object], [Object] ],
    refines: [],
    retSpec: null,
    func: [Function: $$greater_or_equal_q],
    arity: 2
  }
}

> :>
Op {
  name: 'bits',
  func: RawFunction {
    name: '',
    docSpec: RawString { values: [Array], multiline: false, index: 1 },
    args: [ [Object], [Object] ],
    refines: [],
    retSpec: null,
    body: RawBlock { values: [Array], index: 1 },
    locals: [],
    arity: 2
  }
}
```

[04:10](#msg5ef02f44e6668d35db12e8bc)And sometimes, `:>` returns different results:

```
> :>
Op {
  name: '',
  func: RawFunction {
    name: '',
    docSpec: RawString { values: [Array], multiline: false, index: 1 },
    args: [ [Object], [Object] ],
    refines: [],
    retSpec: null,
    body: RawBlock { values: [Array], index: 1 },
    locals: [],
    arity: 2
  }
}
```

but also:

```
> :>
Op {
  name: '>',
  func: RawFunction {
    name: '',
    docSpec: RawString { values: [Array], multiline: false, index: 1 },
    args: [ [Object], [Object] ],
    refines: [],
    retSpec: null,
    body: RawBlock { values: [Array], index: 1 },
    locals: [],
    arity: 2
  }
}
```

[04:16](#msg5ef030a73a0d3931faa79afb)Since `:<` is ok, `demo.red` works perfectly when replacing `i > gap-end` with `gap-end < i`.

ALANVF

[11:59](#msg5ef09d29c4bdd83475fb47a0):thumbsup:

[13:06](#msg5ef0acf2c4bdd83475fb74c1)I'll hopefully have a fix out sometime today or tomorrow

rcqls

[14:13](#msg5ef0bc9e613d3b3394000179)Great! I had no doubt about that BTW! :thumbsup:

ALANVF

[19:06](#msg5ef10149c223cc536a2c639b)ok it's fixed

rcqls

[19:23](#msg5ef105277ba3965373c1bc1b)github seems out of order now. I’ll test later your fix!

ALANVF

[19:57](#msg5ef10d1ae0e5673398caff17):thumbsup:

rcqls

[20:50](#msg5ef1198eec4a341beee23b93)@ALANVF Fix confirmed as expected :clap: !

[20:53](#msg5ef11a5147fdfd21eddc2fcf)(..subtle fix…great job...)

## Tuesday 23th June, 2020

ALANVF

[14:04](#msg5ef20bd154d7862dc4a3c17f)ye it seems to be a weird regex bug

[14:04](#msg5ef20c0347fdfd21edde5ff1)because `<[<=>]|>>>` apparently ignores the `|>>>` or something

[14:05](#msg5ef20c2c405be935cdba2bf0)add an FAQ btw

## Sunday 28th June, 2020

ALANVF

[21:24](#msg5ef90a8dd65a3b0292b6c53a)btw reimplemented all `series!` types, so now mutation works correctly :thumbsup:

greggirwin

[22:06](#msg5ef91467613d3b3394140cdc)That sounds like a good bit of work, and very important of course.

## Monday 29th June, 2020

GaryMiller

[00:47](#msg5ef93a09bb149531edd8757b):clap: Great progress!

ALANVF

[21:16](#msg5efa5a35a813c72dcf19a9af):100:

ralfwenske

[23:45](#msg5efa7d15e0e5673398e1bb25)\[!\[image.png](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/7GPj/thumb/image.png)](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/7GPj/image.png)

## Friday 3th July, 2020

ALANVF

[17:49](#msg5eff6faa3a0d3931facdf3df)yay finally got `insert` mostly implemented

[17:53](#msg5eff70a6d65a3b0292c76746)(which also means that I can now add `repend` :tada:)

toomasv

[18:08](#msg5eff742e405be935cddb95cd)Congratulations! :+1:

ALANVF

[18:36](#msg5eff7a94405be935cddba7a3)thanks!

[21:28](#msg5effa30ee0e5673398efa65b)might get a new release out between now and sunday I think

[22:06](#msg5effabd2405be935cddc2cbf)Red.js version 0.1.2 now out with the following changes:  
\- Removed `pre1` from the preprocessor.  
\- Reimplemented several `series!` types.  
\- Fixed `form`/`mold` for `binary!` values with an offset.  
\- Added `clear` action.  
\- Added `remove` action.  
\- Added `insert` action for `any-list!`, `any-path!`, and `any-string!`.  
\- Added `pad` and `repend` helper functions.  
\- Redid `email!`'s implementation.  
\- Finished implementing `append` for `any-list!`, `any-path!`, and `any-string!`.

[23:54](#msg5effc528fa0c9221fc78eeab)(oh yea, the repl has also been updated)

## Saturday 4th July, 2020

GaryMiller

[01:26](#msg5effdad1fa0c9221fc791df9)Great Progress! :thumbsup:

## Sunday 5th July, 2020

ALANVF

[00:14](#msg5f011b72c223cc536a54b5c1)thank you!

[17:18](#msg5f020b6f7ba3965373ec00cc)yay vectors now exist

[17:18](#msg5f020b7154d7862dc4cc0358)\[!\[image.png](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/RmLG/thumb/image.png)](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/RmLG/image.png)

[17:24](#msg5f020cc2fa0c9221fc7e5360)I was able to make them use JS' typed arrays, so they should hopefully be pretty fast compared to normal blocks and stuff

GaryMiller

[19:44](#msg5f022d99405be935cde207fe)Very Cool! Can't wait to see some of those benchmarks once you get enough working to run some to the more CPU intense Red demos.

Do you have to worry about the Red Garbage Collector or will the Javascript garbage collector take care of the Red memory fragmentation for you just by marking the variables that go out of scope.

greggirwin

[19:46](#msg5f022e2e7ba3965373ec561c)@ALANVF are JS typed arrays the same as, or built on, arraybuffers?

ALANVF

[20:56](#msg5f023e9554d7862dc4cc86f9)@GaryMiller Yeah I can't wait to run some benchmarks on this stuff. Re: GC, JavaScript's garbage collector should work just fine, however if I ever have it target WebAssembly I'll definitely need to worry about it at some point

[20:58](#msg5f023ed9e0e5673398f5c896)@greggirwin They're more similar to ArrayBuffers, as described here: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Typed\_arrays

[21:00](#msg5f023f566c06cd1bf4758db8)the only thing I ran into is that they might be kinda inefficient if you resize them a lot since typed arrays are immutable (for some reason?)

[21:01](#msg5f023f97405be935cde234b6)so I have it where whenever you resize a vector, it reassigns the underlying typed array with the new values

greggirwin

[21:11](#msg5f0242183a0d3931fad4be1b):+1:

## Friday 10th July, 2020

ALANVF

[22:39](#msg5f08ee1da9378637e8beda36)Red.js version 0.1.3 is now out with the following changes:  
\- Reimplemented `vector!`s.  
\- Added `make` action for `vector!`s.  
\- Add `change` action.  
\- Fix `insert` action.  
\- Correctly implement `copy` action.  
\- Improved `form`/`mold` internals.

greggirwin

[22:41](#msg5f08ee9e3e4a827d19ba110d)Nice to see you're still cranking away!

ALANVF

[22:42](#msg5f08eed77455046699ef960f)yep, I'm still trying to work on it when I'm not at work whenever I can :)

[22:43](#msg5f08ef1286ccb45b599ac80d)(although it'd be nice if others could contribute too at some point)

[22:44](#msg5f08ef348342f4627409aa91)(I would probably have to actually document stuff first though, so it's fine for now I guess)

greggirwin

[23:42](#msg5f08fcdfc7d15f7d0f8563f6)We know that challenge well.

## Saturday 11st July, 2020

ALANVF

[00:01](#msg5f0901658342f4627409d6bd)Yeah, I've wanted to contribute to Red for a long time, but the source isn't really that well documented (especially on the R/S side of things)

[00:02](#msg5f09019246c75b1e5e398000)Red.js contributes a decent amount though I think ;)

greggirwin

[00:05](#msg5f0902536e1b8050c3e83c5d)From what I've seen, it's excellent work, and adds a lot of value.

GaryMiller

[00:48](#msg5f090c5c7a4e99049e0237c3)Red.js opens new hope and potential for the growth of the language!

[00:52](#msg5f090d627455046699efdf43)Thanks for all your hard work!

ALANVF

[16:35](#msg5f09ea5c64ef9d04b2a9008d)Thank you all, I'm glad that you all appreciate it!

## Saturday 25th July, 2020

ALANVF

[21:38](#msg5f1ca644bc41f3681724bbbc)\[!\[image.png](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/esGv/thumb/image.png)](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/esGv/image.png)

[21:38](#msg5f1ca65477eccd0e147539f2)yay finally got searching working (only for strings atm)

[21:38](#msg5f1ca67349bae206011c6d05)oh wait that's supposed to return `"de"`

[21:40](#msg5f1ca6b3c83e6242ed54ab7e)\[!\[image.png](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/9Rzj/thumb/image.png)](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/9Rzj/image.png)

[21:40](#msg5f1ca6b4d7efe5438f1ff97b)ok that's better

GiuseppeChillemi

[22:46](#msg5f1cb654bc41f3681724df09)Great!

## Sunday 26th July, 2020

endo64

[10:14](#msg5f1d5791c83e6242ed563037)👏

## Saturday 8th August, 2020

GaryMiller

[14:22](#msg5f2eb53fe20413052e745340)How is Red.JS coming along? Hitting any snags?

GiuseppeChillemi

[14:38](#msg5f2eb8cbb103e45c83041a6e)We are all waiting for you Red/web

meijeru

[19:16](#msg5f2ef9f0d4bc1a71bc8a2394)I have noticed that your RawIntegers are not constrained to 32 bits; try 2 \** 33 and it gives you a result without decimal point, unlike Red propoer, which promotes such a number to float.

ALANVF

[22:07](#msg5f2f223679da21426f217e6a)@GaryMiller it's going decently (although converting R/S to JS is not the easiest thing ever), but I've also been preoccupied with some other things recently too (one of them I might share later since it's Red-related)

[22:10](#msg5f2f22ded28b99685e4fe15c)@meijeru yeah that's because JS doesn't distinguish integers from floats, so I'm either stuck with the standard "number" type, or the newer "bigint" type once it's added to the EMCAScript standard (because it's currently not supported everywhere)

[22:12](#msg5f2f233d79da21426f21813a)I \_could_ use "typed arrays" like Int32Array, but that'd be fairly inefficient unless I treated it as linear memory (and uh, I'll pass on that for now)

## Sunday 9th August, 2020

meijeru

[12:55](#msg5f2ff226733c00338fffc6b0)In order to be more Red-compliant you could at least check integers for overflow, although that would also be an overhead...

ALANVF

[18:25](#msg5f303fac88719865d94d9f6e)Yeah that extra overhead would be redundant considering the fact that the values are already boxed

## Monday 10th August, 2020

greggirwin

[01:07](#msg5f309dca811d3571b3b899dd)If it's performance vs correctness, always choose correctness.

ALANVF

[16:37](#msg5f3177bafe39ca5d6592c838)Perhaps, but because this has to run in the browser (rather than locally), it needs to be able to run efficiently enough that it doesn't degrade client-side operations (if that makes sense)

[16:38](#msg5f3178014c89605c7f892192)so I can probably add some more checks to make sure that it stays as an integer value, there's a very low chance that I'll be able to emulate the 32-bit overflow/underflow behavior too

[16:39](#msg5f31785fb103e45c830ad9d1)(although `Math.imul` does treat its arguments as 32-bit integers iirc)

GaryMiller

[20:20](#msg5f31ac2251bb7d3380e1dc95)Wouldn't it be just like runtime bounds checking anytime an integer is evaluated you'd just insert lines to raise an exception if it exceeded maxint or was less than minint? You could also have a runtime flag perhaps to turn off integer range checking for those who can't live with the slow down.

ALANVF

[20:48](#msg5f31b2a4a4768b685685df91)@GaryMiller the bounds checking is the slow part because I'd have to do the bounds checking in the `RawInteger` constructor, which is so inefficient that I may as well just give every `RawInteger` its own `Int32Array`. Adding a flag for it would also clutter up the codebase quite a bit, and it's a decent disaster as it is already.

## Tuesday 11st August, 2020

giesse

[08:08](#msg5f32520d88719865d952cf42)i am on the side of purposefully breaking bad code.  
one day Red may want to use more than 32 bits for `integer!` as well.

ALANVF

[18:27](#msg5f32e2f5d4bc1a71bc9430de)@giesse yeah because the only reason why Red currently doesn't have 64-bit integers is because Red is currently only 32-bit

[20:49](#msg5f33046da350275ece0bc415)Hmm so I've been thinking a bit, and what are y'all's thought's on switching Red.js over to something like Haxe instead of TypeScript? Although it would be a bit slower and probably come with some extra bloat (in the runtime), it would be far easier to work with than TS because of it has so many more features than TS will ever have (for the foreseeable future)

[20:50](#msg5f33049f4bb58d31818de586)Dart could be another viable option too, although it sits somewhere inbetween TS and Haxe in terms of language features

[20:51](#msg5f3304d617acb15fdf151609)but honestly like obviously TS compiles directly to JS and is much faster/optimized that way, but it's a lot less fun and productive than alternatives

[20:53](#msg5f33053879659c5fbfe9546a)(the reason I mention this is because Dart and Haxe can also compile to JS, and therefore run in the browser)

[21:00](#msg5f3306d1a350275ece0bcafc)For example, the following TS code:

```
let str2: string;

if(value instanceof Red.RawWord) {
	str2 = value.name;
} else if(value instanceof Red.RawString) {
	str2 = value.toJsString();
} else if(value instanceof Red.RawBinary) {
	str2 = value.bytes.ref.toString();
} else {
	str2 = RedActions.$$form(ctx, value).toJsString();
}
```

could easily be written in Haxe as:

```
final str2 = switch(value) {
	case Red.RawWord: value.name;
	case Red.RawString: value.toJsString();
	case Red.RawBinary: value.bytes.ref.toString();
	case _: RedActions.form(ctx, value).toJsString();
};
```

[21:01](#msg5f3307339ad3cd3205bfd1ad)not only is the Haxe code cleaner and more concise, but it also allows me to declare `str2` as a constant rather than a regular variable (like in the TS code), which can obviously make the code a bit faster

theSherwood

[21:02](#msg5f3307701f13b45edb6f3036)Seems like it depends a lot on what your long term goals are for the project.

ALANVF

[21:04](#msg5f3307d7f3d6d26b0d8cb8bd)Yeah I haven't really thought too much about Red.js' long-term goals yet, but I mainly just want it to act as web runtime for Red

[21:04](#msg5f3307ee58afd24626025327)although maintainability is definitely important to keep in mind, which is what got me thinking about this

theSherwood

[21:06](#msg5f33083a670d137032834650)Right. My take is that if you are going to be doing the maintenance long term, do it in the language that is going to work best for you. If you want more community involvement at some point in the future, Typescript may be best.

[21:09](#msg5f3308f53cf046461e2bc2ec)Simply on account of it being fewer languages for contributors to need to know in order to contribute.

ALANVF

[21:13](#msg5f3309de9ad3cd3205bfdad8)Yeah that's what I'm thinking

[21:15](#msg5f330a6e1f13b45edb6f3727)I've considered using something like Babel to be able to use stuff like "do-expressions proposal" (basically turns a statement into an expression), but many editors don't support Babel extensions, and I also want to keep the number of dependencies that Red.js requires to a minimum (similarly to normal Red)

theSherwood

[21:19](#msg5f330b7a79659c5fbfe9654b)I was not aware of that proposal. Very cool.

[21:21](#msg5f330bc92376a9317f120a16)Are you wanting to minimize all dependencies or just runtime dependencies? Because Typescript is already a sizable build dependency. I don't see what harm a few Babel plugins could do in that regard.

ALANVF

[21:21](#msg5f330bcc4bb58d31818df777)Yeah I'm really hoping that the TC39 proposal gets past stage 2 because I absolutely love the idea

[21:21](#msg5f330be4f3d6d26b0d8cc4f3)I would like to minimize runtime dependencies at a minimum

[21:22](#msg5f330c241f13b45edb6f3c87)Babel could be fine as a dev dependency (and will probably be added at some point), but then there's the editor issue that I mentioned earlier regarding the do-expressions thingy

theSherwood

[21:24](#msg5f330c7d9ad3cd3205bfe180)Yeah. That's an issue. Though if someone is going to be writing much Typescript, they might be better off using an editor built for the ecosystem anyway...

ALANVF

[21:26](#msg5f330cf517acb15fdf152d6d)Well sure, but the issue is that there aren't any editors that support plugin/proposal (yet)

[21:26](#msg5f330d239ad3cd3205bfe3f4)I'd imagine that basic support would be added when it hits stage 2, but that could take even another year to happen

theSherwood

[21:30](#msg5f330dea9ad3cd3205bfe5a1)Gotcha. That makes sense.

ALANVF

[21:40](#msg5f33103458afd24626026b81)I suppose that the best thing to do for now is to use the most up-to-date versions of TS to enable newer features and whatnot

GaryMiller

[21:44](#msg5f331157a350275ece0bea12)Interesting... The advantage I see with Haxe is you can compile it to C. From there you can use Emscipten to compile the C code to WASM which should be a lot faster than JavaScript but you lose the DOM.

The other advantage is you could compile the C to a 64 bit .exe and lose any of the 32 bit size limitations which would really float my boat.

The only con I see is that Haxe has been around for a while and it hasn't climbed very far up the Tiobe Index as far as I can see.

ALANVF

[21:46](#msg5f3311bd2aa0fd6b0aa9b30b)Yeah and I also think that Haxe is bigger for gamedev rather than appdev as a whole

[21:47](#msg5f331200670d13703283640f)although tbh, It couldn't hurt to at least make a small prototype in Haxe sometime I guess

[22:17](#msg5f3318df17acb15fdf154c49)Red.js version 0.1.4 is now out with the following changes:  
\- Implemented `reflect` action for `object!` and `map!`.  
\- Finished implementing `foreach`.  
\- Added more helper functions.  
\- Fixed quoting issues with `set-word!` and `set-path!`.  
\- Fixed quoting bugs for `get-word!` and `lit-word!` function arguments.  
\- Fixed `lit-word!` and `lit-path!` behavior.  
\- Removed multiline property from `string!`s because it wasn't needed.  
\- Fixed file error bug.  
\- Added `to-` helper functions.  
\- Added `find` action for `any-string!` and `typeset!`.

theSherwood

[22:53](#msg5f33216e2376a9317f1240fb):thumbsup:

## Wednesday 12nd August, 2020

GaryMiller

[01:03](#msg5f333fcc670d13703283d16f):100:

[01:15](#msg5f3342be514c484540a2c591)The run-time performance of Haxe programs varies depending on the target platform:

ActionScript 3: Programs produced using the Haxe compiler usually run faster than programs produced using the Apache Flex SDK ActionScript Compiler. However, using ActionScript Compiler 2 (ASC2) with manual optimizing, many have reported comparable performance.

JavaScript: Programs produced using the Haxe compiler run at a comparable speed to handwritten JavaScript programs. OpenFL is a common Haxe-powered framework that can run in HTML5-JavaScript, but content built with OpenFL currently suffers performance issues on mobile devices.

C++: Programs produced using the Haxe compiler rival handwritten C++ programs, but C++ applications built with OpenFL suffer major performance issues.

https://en.wikipedia.org/wiki/Haxe#Performance\_comparison

GiuseppeChillemi

[07:43](#msg5f339d963cf046461e2d36fa)Haxe "a language built to transpile in other languages" interesting.

ALANVF

[14:23](#msg5f33fb713cf046461e2e3717)Yeah it's definitely an interesting concept, because it can essentially run anywhere with little modification

GiuseppeChillemi

[20:38](#msg5f34534a3cf046461e2f3e84)There is a lot of knowledge in Haxe transpiling technology, it's worth to keep a foot it that shoe. The run everywhere feature is very appealing and despite some possible performance problem a version of Red written in that language can really run everywhere!

## Sunday 16th August, 2020

ALANVF

[01:40](#msg5f388e885ccdf30c584b1733)conversation in red/red just reminded me that I need to figure out how to implement `bind` somehow

[01:40](#msg5f388e9a083f3b79c33360a0)it seems to be more magical than I'd prefer

giesse

[07:39](#msg5f38e2acb7818b3998fdef69)that suggest that your implementation of `word!` is wrong :)

ALANVF

[13:38](#msg5f3936e13e6ff00c289841e1)@giesse yes that's highly likely, as I didn't know what bind did (and still don't completely know) when I was first making Red.js

GiuseppeChillemi

[14:03](#msg5f393c9c5ccdf30c584c7beb)It's incredible how you are porting Red without binding. It is the most basic concept behind relative words.

[14:19](#msg5f39407f1226fc2133594c06)I can summarize it as follow: in Red the value of a word is taken from multiple tables, you have `system/words` table and all the others which are created at runtime when you make an object. Each word has a connection that can be to any of these tables ) but only if it already exists in that table). The interpreter uses this connection to take the value of the word. `Bind` role is just to change the connection of a word, or the words of an entire block, to another table (object) you express in the form `bind WORDs TABLE(object)`. If the word exists in the target table it will be reconnected. After the binding, all the words value of the block will be taken by the interpreter from this table.

giesse

[18:42](#msg5f397e2922a7e979dbe5b1e7)in case it's helpful as a reference: https://gist.github.com/giesse/3ebac89c91ec8cbb06420f62d6b9dff2#file-topaz-js-L1013

[18:44](#msg5f397e89a1190a2e95f79f63)https://gist.github.com/giesse/3ebac89c91ec8cbb06420f62d6b9dff2#file-topaz-js-L1393 etc.

[18:45](#msg5f397eafce98da26eccf6f5b)note that `offset` is an optimization and is not really necessary in principle.

ALANVF

[23:51](#msg5f39c679367ff60c32b9636a)ahhhhh ok that seems a lot easier than what I've been doing so far

[23:52](#msg5f39c6c04d3fd87ee7dba66c)that would also explain my frustration with various parts of the implementation such as objects and functions

[23:54](#msg5f39c71b87848e2119eda6fc)honestly at this point, I actually think that it'd be worth switching to another language or something to make it easier to redo everything

[23:55](#msg5f39c759083f3b79c3362847)or, if it's ok with y'all, I can try to redo it in typescript but it'd take much more time to do so

[23:57](#msg5f39c7ed083f3b79c336292b)although lately, I've been brainstorming some ideas for alternatives that I could use for Red.js instead of typescript, due to many of its minor annoyances

[23:59](#msg5f39c86187848e2119eda98c)Haxe (which has been discussed here already) seems like an ideal solution

## Monday 17th August, 2020

ALANVF

[00:00](#msg5f39c8b4aecae32e8ec9694a)ReScript (new version of ReasonML) also seems viable, but it still shares a lot of the issues that ReasonML failed to fix

[00:01](#msg5f39c8e360892e0c69774aed)Fable (F#-to-js compiler) also seems nice, but also seems to come with a decent amount of overhead

[00:02](#msg5f39c919c7637c27000bbdf5)Scala.js also seems nice (and just recently hit 1.0!), but it also has a lot of runtime overhead

GaryMiller

[00:04](#msg5f39c990083f3b79c3362ca7)What would be the target language for Haxe still js?

Would it still be web enabled?

Would Haxe still be a simple distribution model? (Just an .exe and a few DLLs)

ALANVF

[00:06](#msg5f39ca23a1190a2e95f8567e)Well, the thing about Haxe is that you can run it essentially anywhere

[00:07](#msg5f39ca4287848e2119edade3)so it can be compiled to js, php, c++, java, c#, and so on

[00:08](#msg5f39ca98a1190a2e95f8576a)and while there are minor inconsistencies between targets, they all essentially work the same way

[00:10](#msg5f39cb09b7818b3998001466)I think that for now, I might try writing a small subset of Red.js in Haxe and see what happens

giesse

[09:07](#msg5f3a48db367ff60c32bab142)Personally, if I was doing this, I would write my own compiler.  
But, as a general advice, you want a language that is as high level as possible and that compiles down to as many different platforms as possible. If Haxe works for you, go for it, in the worst case you'll learn why it's not a good idea :)

ALANVF

[23:35](#msg5f3b142e07c30d132a9435dc):100:

## Sunday 23th August, 2020

ALANVF

[20:06](#msg5f42cc60d4f0f55ebbd71ab3)\[!\[image.png](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/iLjG/thumb/image.png)](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/iLjG/image.png)

[20:07](#msg5f42cc66ddc2d041c0c15bcc)New parser written in Haxe :)

[20:27](#msg5f42d1289566774dfe2a009b)although there have been some minor inconveniences (such as \[this](https://pastebin.com/fwqeAy7K) taking &gt; 30min to compile due to a codegen bug), I definitely think that Haxe was the right way to go

[20:48](#msg5f42d60e89cf2d584b6fc024)\[!\[image.png](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/b9Pr/thumb/image.png)](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/b9Pr/image.png)

[20:48](#msg5f42d61459ac794e02bfc95f)oh yeah it also seems to be pretty fast

## Monday 24th August, 2020

GaryMiller

[03:04](#msg5f432e4f36e6f709fdfaac37)Surprising that you would find a codegen bug this early on in your conversion since the language is so mature. Were you able to work around the bug or is the 30 min compile time something you'll have to live with going forward?

Do they have a symbolic debugger for Haxe for when you run into logic issues or will you still have to rely on good old probe?

ALANVF

[14:08](#msg5f43c9cf9566774dfe2c78ec)@GaryMiller I was able to work around the bug by rewriting that section of code differently, so it's no longer an issue :thumbsup:

GaryMiller

[20:00](#msg5f441c4cec534f584fbbf516)@ALANVF Found this .... Haxe is supported in a number of editors and IDEs. Some IDEs, such as Visual Studio Code (with the vshaxe extension), support debugging of Haxe code with breakpoints, stack tracing, etc. More information is available on the vshaxe wiki. https://haxe.org/manual/debugging-ide-integration.html

## Thursday 27th August, 2020

ALANVF

[18:21](#msg5f47f9b049148b41c977fe9b)@GaryMiller yeah but I'm too lazy to learn how the debugger works. plus, I found an issue on their github about the problem I was having, and it seemed valid to me (it was generating massive if/else chains), so it's fine now

## Tuesday 1st September, 2020

ALANVF

[22:02](#msg5f4ec507dfaaed4ef525449d)Status update for Red.js: https://github.com/ALANVF/Red.js#status-update

[22:06](#msg5f4ec5c85580fa092b3ba937)making the switch from TS to Haxe :)

## Monday 14th September, 2020

GaryMiller

[15:47](#msg5f5f90afb190f2328e71fc04)@ALANVF How's the JS to HAXE code conversion going. Is the new context implementation going smoother now?

ALANVF

[18:14](#msg5f5fb321ea62d70e65105927)@GaryMiller Yeah it's going pretty nicely. Definitely easier than the TS implementation

[18:15](#msg5f5fb33cea62d70e65105976)I'll probably make a temp repo for it once I get most of the core datatypes added

[18:17](#msg5f5fb3b9ea62d70e65105ae2)Haxe has required a lot more boilerplate code than TS (it doesn't even have builtin sets?!), but it's otherwise been nice

GaryMiller

[18:41](#msg5f5fb9483651184d30ee7d07)@ALANVF Glad that it's easier than TS. I read that HAXE has pretty good macro capability but that its an advanced feature and harder to learn. They may be good for some of those boilerplate situations though.

## Friday 18th September, 2020

ALANVF

[17:42](#msg5f64f18089b38d092137b8ec)the Haxe version Red.js is now on github! https://github.com/ALANVF/Red.js-haxe

theSherwood

[17:47](#msg5f64f2b9d993b837e070fc15)Well done!

ALANVF

[17:47](#msg5f64f2c5d993b837e070fc2b)Thank you!

[17:48](#msg5f64f2d2df4af236f9171c43)it's definitely taken quite a bit to get to this point

[17:48](#msg5f64f2dbea62d70e651e4821)but it was definitely worth it imo

theSherwood

[17:48](#msg5f64f2f45fde567ffa56b4ea)Seems like a whole lot of work. I'm excited to take it for a spin when it's ready!

ALANVF

[17:48](#msg5f64f308b468994d0d39a9e9)yep I can't wait for it to be functional

[17:50](#msg5f64f358d993b837e070fd75)and for those of you who couldn't try it because node.js was being a pain (or something related), Haxe can compile to more languages than just js :)

[17:52](#msg5f64f3c7f969413294f3f163)so you could theoretically just have it compile to lua or python and use it instantly

theSherwood

[18:11](#msg5f64f86cdf4af236f9172be6):thumbsup:

GiuseppeChillemi

[23:28](#msg5f6542a0ea62d70e651f1554)Wow!

## Saturday 19th September, 2020

ALANVF

[02:49](#msg5f6571c689b38d092138ed96)oh yeah if anyone wants to help with the transition process, please feel free to do so!

[02:50](#msg5f657206c1d1a53705b05d86)Haxe is a lot easier than TypeScript, so that might be more appealing to those who weren't a huge fan of TypeScript

## Wednesday 23th September, 2020

greggirwin

[01:57](#msg5f6aab931c5b0d210ac5ce98)Thanks for the update @ALANVF!

GiuseppeChillemi

[22:01](#msg5f6bc59defefe620f2451c47)This room should be RED.haxe ;-)

[22:02](#msg5f6bc5de4002c640b5e1f6a1)Also, it would be great a RED would compile to HAXE, then the HAXE transpiler could output it to any HAXE supported language.

ALANVF

[22:22](#msg5f6bcabdb8a99f4519a23441)Yeah maybe, although the original intention of the project was to be able to run Red in the browser

## Thursday 24th September, 2020

greggirwin

[17:56](#msg5f6cddb1f41f4105e4d578de)@GiuseppeChillemi :^)

GiuseppeChillemi

[20:33](#msg5f6d02b0e1dd7c195492cebe)@greggirwin "subliminal hypnotic suggestion"

greggirwin

[22:02](#msg5f6d177f6a6e094525b4aa0e)It's not \*very* subliminal.

GiuseppeChillemi

[22:07](#msg5f6d1890b8a99f4519a5b903)Yes, direct and not concealed!

## Thursday 1st October, 2020

ALANVF

[16:27](#msg5f76036f1bb53378feaa780e)More progress made today: https://github.com/ALANVF/Red.js-haxe/commit/721bcf0319e7f6b9024ffc57e61cdfe7fb720541

[20:21](#msg5f763a5afcce3e6c18e7a876)also hoping to get some docs in the code (somewhat) soon for anyone who wants to contribute

## Friday 2nd October, 2020

GiuseppeChillemi

[06:28](#msg5f76c8a9f9cfbe19f9335952)@ALANVF great work, you are giving us a dream: having Red in the browser.

ALANVF

[14:46](#msg5f773d47a5ac94398069478e)tysm :)

[14:47](#msg5f773d91a5ac943980694840)I've wanted Red in the browser ever since I discovered it, and now we're getting closer to making that reality

## Sunday 25th October, 2020

ALANVF

[01:23](#msg5f94d37a7be0d67d27956856)had some ideas about a JS dialect for Red.js:

```
Red/JS []

#import [
	console: "console" object! [
		log: "log" function! [
			[variadic]
			args    [block!]
			return: [unset!]
		]
	]
]

console/log [1 2.3 "abc"] ;=> 1 2.3 'abc'

;-- Resulting JS code:
; console.log(1, 2.3, "abc");
```

[01:26](#msg5f94d430c990bb1c392cfa77)tried to make it look a bit similar to R/S

[01:35](#msg5f94d64957fe0a4f3030a61c)(more is available in the latest commit)

[01:38](#msg5f94d700a0a3072b43a28712)apologies for the inactivity btw. been occupied with school and stuff

greggirwin

[05:11](#msg5f9508ff7be0d67d2795e232)Cool idea. Thanks for the update. We all get busy at times.

## Sunday 1st November, 2020

ALANVF

[20:27](#msg5f9f1a24d37a1a13d67da67d)Yay more progress today

[20:27](#msg5f9f1a2eb4283c208a3b76c2)started working on evaluation

[20:28](#msg5f9f1a552a35440715fbc3ca)https://github.com/ALANVF/Red.js-haxe/blob/master/src/runtime/natives/Do.hx

[20:28](#msg5f9f1a7cb86f640704252229)and this time, no obscure hacks were required when parsing operators ;)

greggirwin

[20:30](#msg5f9f1aebbf955735eb524eac):+1:

GaryMiller

[22:57](#msg5f9f3d727cac87158f7e2e9e)Great progress! Glad you're sticking with it.

GiuseppeChillemi

[22:58](#msg5f9f3d8ac10273610add0cea)Nice!

ALANVF

[22:59](#msg5f9f3db5b4283c208a3bcca4)thanks for the support!

## Wednesday 4th November, 2020

ALANVF

[01:35](#msg5fa2057e8a236947ba83c0b4)(Basic) evaluation is now done! https://github.com/ALANVF/Red.js-haxe/blob/master/src/runtime/natives/Do.hx

[01:36](#msg5fa205bb7cac87158f85b04d)planning to move this code to the main Red.js repo once I get some basic actions/natives added

greggirwin

[02:20](#msg5fa2100a7cac87158f85c90f):clap:

rcqls

[08:20](#msg5fa2646406fa0513dd908e45):clap: :clap:

meijeru

[15:02](#msg5fa2c2882a354407150553cb)Did anyone notice that the "FizzBuzz" example in the Red.js Readme is flawed?

```
repeat i 100 [
	switch 0 [
		i % 15 [print "FizzBuzz"]
		i % 3  [print "Fizz"]
		i % 5  [print "Buzz"]
		0      [print i]
	]
]
```

The body-block of the `switch` should have `reduce` in front of it, since `switch` guards are literals .

[15:04](#msg5fa2c30c8d286f20768c2958)With that amendment, it is an interesting idiom, that I had not encountered before. Who would think of putting the constant as the switch value and the variable expressions in the guards? Naively, one would write a `case`with guards `zero? i % 15` etc.

[15:05](#msg5fa2c342f2fd4f60fc5300cf)Interesting to speculate about relative timing of `switch` vs `case`.

ALANVF

[15:15](#msg5fa2c5842a60f731f7357199)hmm

[15:18](#msg5fa2c650c6fe0131d4d5c28a)@meijeru I could have sworn that switch reduced its contents

[15:19](#msg5fa2c676b86f6407042ec7f5)I happened to get the idiom from js though, since it's pretty common there

[15:20](#msg5fa2c6b5b4283c208a45279e)I wonder if there could be a refinement or something for `switch` that'd reduce its contents as it goes through each case

[15:21](#msg5fa2c6ddb4283c208a452814)kinda like `all`/`any` short-circuit evaluation

greggirwin

[17:51](#msg5fa2ea302a60f731f735d406)It's interesting but, having never used it, doesn't make sense to me. Most interesting is why `switch` even supports literal values rather than variables. That is, `switch` by its very name implies dispatching based on a value that may change. It's like saying `if true ...`. `Switch` already doesn't let you use blocks as values to dispatch on. @meijeru please think on that as a design point and pose it to the community with your thoughts.

[17:53](#msg5fa2ea922a60f731f735d4e9)I have an old `select-case` mezz, which is a dialected version of the old BASIC construct, which makes common dispatching cases on ranges convenient and declarative.

GiuseppeChillemi

[18:05](#msg5fa2ed84bf955735eb5c5cd4)@greggirwin Have you it as gist?

greggirwin

[18:11](#msg5fa2eebfbf955735eb5c5fab)I don't know if I've even ported it to Red. Will have to look, but have other pressing tasks ATM.

GiuseppeChillemi

[18:11](#msg5fa2eeebd37a1a13d687bc7e)Not so urgent, just curious

greggirwin

[18:15](#msg5fa2efa6dc70b5159af0d001)You may have gotten lucky....

[18:21](#msg5fa2f13c8a236947ba861c3e)I just now pulled old tests, some of which are failing, so clearly haven't used this in Red. It will give you the idea though.

\[select-case gist](https://gist.github.com/greggirwin/5020d92e4e8f3785b307785cacdab5ce)

GiuseppeChillemi

[18:23](#msg5fa2f1aff2fd4f60fc537780)Thank you. I have in mind a Select which works on different types of selections/grouping. So your will be a source of further ispiration.

greggirwin

[18:35](#msg5fa2f48f2a60f731f735ee02)Note that `between?` is one of those tricky things, which has to be considered for pragmatic clarity versus, perhaps, a more rigorously correct interpretation. e.g. do you want to spec ranges as `1..10 10..20` or `1..10 11..20`.

[18:37](#msg5fa2f505c6fe0131d4d64727)I don't remember why I changed it in the Red version, but I see my old R2 version used `<=` for the upper bound.

## Friday 13th November, 2020

ALANVF

[17:08](#msg5faebda8dc70b5159a0d83f6)more things are working!

[17:08](#msg5faebdabb4283c208a621bf3)\[!\[image.png](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/zPM0/thumb/image.png)](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/zPM0/image.png)

rebolek

[17:39](#msg5faec4d78a236947baa2c75e):+1:

greggirwin

[18:12](#msg5faecc81bf955735eb7997a6)Are "things" literal `logic!` syntax, or `either`? Either way, cool.

ALANVF

[18:12](#msg5faecca074152347c231621a)literal `logic!` syntax has existed for a while, but functions are new

[18:12](#msg5faecca8c10273610a035a44)either way, yeah pretty cool

[18:13](#msg5faeccc1d5a5a635f2bc1ebe)right now, I'm trying to figure out how to structure the dispatch functionality for actions

[18:14](#msg5faecd09c10273610a035b35)RTTI would be easy, but it's a cheap shortcut and won't work on static Haxe targets (like c++ and java)

[18:18](#msg5faece06f2fd4f60fc7042b9)(for reference, RTTI does not preserve static type information, which results in a loss of type safety and static type information)

greggirwin

[18:19](#msg5faece3874152347c2316667)You can't add actions at runtime, so just a table of function pointers, as in Red itself, should work. I don't know how the rest of it is structured in red.js, so it may not be as simple as I imagine.

ALANVF

[18:20](#msg5faece697cac87158fa4e66e)it's similar to that, but in Red.js I was not preserving type information because I was lazy (and TS probably didn't care much anyways lol)

[18:21](#msg5faeceb92a60f731f752717c)hmm I might have an idea actually

[18:22](#msg5faecefcc6fe0131d4f2ef27)do you know if there are any actions that are intentionally not inherited (from the inherited actions table) for any datatypes?

greggirwin

[18:24](#msg5faecf71b86f6407044c02cc)It seems like if you don't have type information, it will be hard to do even things like `type?`, won't it?

Every type chooses what to override or not. The more that a base type can handle, the less code we have to write, but that can also lead to unexpected behavior, where an action later has to be overridden to make a type work more as users expect.

ALANVF

[18:25](#msg5faecfb38a236947baa2e878)well with `type?` it's pretty easy because the actual type system uses class inheritance to emulate Red's hierarchy

[18:26](#msg5faecfe374152347c2316acf)so each class has a function (generated by a macro, thankfully) that returns its datatype info

[18:27](#msg5faed01e74152347c2316b3f)the issue with actions is that they are separate from the actual type system

greggirwin

[18:30](#msg5faed0c88a236947baa2eb9c)Bearing in mind that I'm ignorant of the internals, what I say may not make sense. But if you're generating funcs like that, can't you also generate the actions? I have no idea how ugly that will be when it comes to inheritance, but you could bake the inherited funcs into each class, rather than relying on class inheritance in the target lang. Basically, actions are only used as values to map to those funcs.

ALANVF

[18:31](#msg5faed0eabf955735eb79a3c5)so basically, I have 2 options: put the code for each datatype's actions in the corresponding class implementation (easy, but will make files absolutely massive), or implement them separately and use some sort of tagging mechanism to lookup a value's dispatch table (harder (and possibly slower), but will make files shorter and more organized)

[18:31](#msg5faed0f8d37a1a13d6a4b5c0)yeah basically

[18:32](#msg5faed12bf2fd4f60fc704bd4)however, putting the code for the actions in their corresponding classes will probably clutter up the codebase

[18:33](#msg5faed15dd5a5a635f2bc2d80)because then you have dozens 2k+ loc files for the datatypes

[18:33](#msg5faed16eb86f6407044c07de)hopefully that's making sense

[18:34](#msg5faed1a774152347c2316ec0)I do have some actions implemented like this already, but they are fairly basic and do not interface with Red itself, which is fine I guess

[18:35](#msg5faed1d5dc70b5159a0dbdb4)here's an example: https://github.com/ALANVF/Red.js-haxe/blob/master/src/types/base/\_SeriesOf.hx

[18:37](#msg5faed25db86f6407044c0a67)so yeah it implements some common `series!` methods, but they're really only made for Haxe code so they're a lot shorter than implementations of the actual Red functions

greggirwin

[18:38](#msg5faed295bf955735eb79a8b5)This is where you want a dialect that lets you write things in a clear way, then generates all the ugly guts. ;^) And 2KLOC isn't terrible. Go for what's obvious and easy to understand and maintain, unless it's absolutely unworkable.

ALANVF

[18:38](#msg5faed2b9c6fe0131d4f2f846)Yeah I could probably make some macros for the actions and stuff I guess

[18:39](#msg5faed2f88a236947baa2f1fd)I have a "build macro" in the Value class for generating things like the type info methods that I mentioned earlier: https://github.com/ALANVF/Red.js-haxe/blob/master/src/types/Value.hx#L13

[18:40](#msg5faed331bf955735eb79aaa7)otherwise, that sounds like a plan :thumbsup:

GaryMiller

[20:42](#msg5faeefa774152347c231c1ac)If I am understanding correctly wouldn't generics help here?

You could have a base class where the common methods (actions) were inherited where possible.

And still override them when the inherited method was not correct for that datatype's action.

ALANVF

[20:44](#msg5faef0218a236947baa348a1)I don't think generics are exactly related (I also tried using them for actions in TS, and did not like the result), but yes the latter part is what I've doen

GaryMiller

[20:48](#msg5faef13bd37a1a13d6a50b4a)Great progress! :thumbsup:

## Tuesday 24th November, 2020

ALANVF

[22:27](#msg5fbd88e1e6f2b51c68b51b4e)lots of progress today :tada:

[22:27](#msg5fbd88e4f5849839adf01870)\[!\[image.png](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/iwWr/thumb/image.png)](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/iwWr/image.png)

GiuseppeChillemi

[22:47](#msg5fbd8d99b03a464f082e111e)@ALANVF :clap: :clap: :clap: :clap:

## Wednesday 25th November, 2020

greggirwin

[00:58](#msg5fbdac422cb422778f36d976)Nice. :+1:

GaryMiller

[05:34](#msg5fbdece929cc4d73482d29d1)Keep up the great work! :clap: :clap: :clap: :clap:

## Monday 30th November, 2020

ALANVF

[16:34](#msg5fc51f28223b350d80e5ca0d)code from Red.js-haxe has now been moved to the main repo!

GaryMiller

[17:02](#msg5fc525c2223b350d80e5dec1)Great!

greggirwin

[22:00](#msg5fc56b87afc2922cf2cb84db)Thanks for keeping up posted.

ALANVF

[23:10](#msg5fc57bde9af4396683cdc894):thumbsup:

## Tuesday 1st December, 2020

ALANVF

[19:57](#msg5fc6a02547d76318fd23fd80)yay more things

[19:57](#msg5fc6a027489041542ff117fc)\[!\[image.png](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/6sJC/thumb/image.png)](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/6sJC/image.png)

[22:46](#msg5fc6c7e387cac84fcd01913b)hey does anyone know how/where `self` is stored in objects?

greggirwin

[22:47](#msg5fc6c7ebc6d7a6543d0daf56)Nice! With so many details and features, you really have your work cut out for you.

[22:51](#msg5fc6c8ec4b2a214fbdc39051)Check out `save-self-object` in %object.reds.

ALANVF

[22:51](#msg5fc6c8ff87cac84fcd019372)cool thanks

[22:52](#msg5fc6c91ae30e0e0d50d5601d)I'm trying to figure out whether or not it's supposed to be stored in the object's symbol table to prevent bugs that I may or may not have just run into

greggirwin

[22:53](#msg5fc6c94e489041542ff186cf)It's a special hidden cell.

ALANVF

[22:53](#msg5fc6c95b32153f0d443e73ac)hmm ok then

[22:53](#msg5fc6c969c6d7a6543d0db37f)that shouldn't be too hard to implement I don't think

[22:54](#msg5fc6c9997db659462afa9313)because I was implementing `get` and `set` and was accidentally changing the `self` value of objects because it's the first entry in their lookup tables

greggirwin

[22:56](#msg5fc6ca0e924a486dd9e013a4)

```
>> o: object [who-am-I?: does [self]]
== make object! [
    who-am-I?: func [][self]
]
>> o/self
*** Script Error: cannot access self in path o/self
*** Where: catch
*** Stack:  

>> o/who-am-I?
== make object! [
    who-am-I?: func [][self]
]
>> in o 'self
== none
```

ALANVF

[22:59](#msg5fc6cacb7fe316314d9aacc8)ah gotcha

## Wednesday 2nd December, 2020

giesse

[10:08](#msg5fc7678287cac84fcd0305ed)that's different from R2 though...

```
>> o: make object! [a: 1]
>> o/self
>> in o 'self
== self
```

greggirwin

[17:04](#msg5fc7c91af2a33f3163aef965)Indeed. The change was made in R3.

## Sunday 13th December, 2020

Numeross\_\_twitter

[11:28](#msg5fd5fac767034a3e90062049)Is there some not too hard work I could help with ?

ALANVF

[14:36](#msg5fd6270955c9c37b30626758)@Numeross\_\_twitter Yeah if you're familiar enough with Haxe, maybe you could try implementing the form/mold actions? Or if that's too hard (since there aren't many docs lol), maybe trybadding `date!` or `raw-string!` rules to the tokenizer?

[14:37](#msg5fd62725c829e14ef2909f85)(`raw-string!` would probably be the easiest though)

[14:37](#msg5fd627323dd3b251a403349b)thanks btw!
