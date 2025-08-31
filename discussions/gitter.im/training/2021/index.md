# Archived messages from: [gitter.im/red/training](/gitter.im/red/training/) from year: 2021

## Thursday 11st February, 2021

loziniak

[02:12](#msg6024929755359c58bf360199)Hi! Just made some changes to Excercism track:  
https://github.com/exercism/red/commit/ba808a83cfff5d864d6cacae660a4e4d47ead33b  
https://github.com/exercism/red/pull/2

[11:18](#msg6025128e9238c531ad3af7a9)Hi! Is it possible to connect this channel's "github-feed" to `exercism/red` repository?

rebolek

[11:58](#msg60251be7a0246860dc46c1b6)@loziniak I'm not sure, you can try asking at https://gitter.im/gitter/gitter . They're usually very fast to respond.

loziniak

[13:19](#msg60252efd9238c531ad3b4360)Thanks @rebolek , I'll check this.

greggirwin

[15:36](#msg60254eeb84e66b7f7ee7f10d)There's an option when you create the room, which I didn't use. Will check quickly here.

[15:38](#msg60254f66aa6a6f319d1c8aa1)Integrations and granting access I don't want to rush through, if that's the answer. Let me know what you find out @loziniak.

loziniak

[21:25](#msg6025a0bb55359c58bf38c259)I asked on \*gitter/gitter\*. @greggirwin, perhaps you could become a Exercism maintainer with write access to github.com/exercism/red, is that what you mean by "granting access" and want to stay away from?

greggirwin

[21:36](#msg6025a36a32e01b4f718d6727)I wasn't sure on granting webhook access, but it looks like that has to be done on the repo. I'm happy to be a maintainer there, or we can ask someone from Exercism to grant the access if they prefer.

loziniak

[21:39](#msg6025a420063b6c68d553eb7b)Anyway, there's also happily a green light from Gitter: https://gitter.im/gitter/gitter?at=60259f665500a97f82ffca27 . Indeed, a blazing fast response from them.

[21:51](#msg6025a6c484e66b7f7ee8dad8)Ok, seems not so green, because write access does not equal access to settings (and thus webhooks). So, I think let's leave it for now.

## Friday 12nd February, 2021

loziniak

[20:33](#msg6026e6295500a97f8202fb61)@greggirwin  
&gt; should we point people to a prebuilt console

What do you mean? Are you talking about how installation instructions should look like?

&gt; do we want a simple test runner

https://github.com/exercism/red/issues/5

greggirwin

[20:41](#msg6026e7ff32e01b4f71908bb3)Yes. In the very near future (we hope) the Red DL will be the prebuilt console directly, so you can run instantly, but it's not that way yet.

Agreed on testing. I roll special case testers, and we'll find what works well there. I don't think `quick-test` is the best choice for this purpose.

loziniak

[20:53](#msg6026eadb4f7d1b68e54aa85e)&gt; Agreed on testing

Thanks! Would you mind commenting also on GitHub?

greggirwin

[20:54](#msg6026eaf755359c58bf3bee94)Done.

loziniak

[21:17](#msg6026f070063b6c68d5571dba)&gt; if there are transcripts of mentoring sessions, that would be great too

They don't give that. Instead, I've been pointed at mentoring instructions, that are available to every exercise:  
https://github.com/exercism/website-copy/blob/main/tracks/ruby/exercises/resistor-color-duo/mentoring.md

greggirwin

[21:21](#msg6026f150a0246860dc4b6014):+1:

## Saturday 13th February, 2021

loziniak

[21:59](#msg60284bbf8621811d5875e065)Added first exercise: https://github.com/exercism/red/pull/7

greggirwin

[22:41](#msg602855b3e634904e609b08f5)Woohoo! Thanks @loziniak. I will try to review in the next few days.

## Sunday 14th February, 2021

wallysilva

[07:31](#msg6028d1c9726a881d4f733f19)Oooh, this is cool stuff! If you guys need some one to try the exercises, I will be happy to be your a guinea pig :D

greggirwin

[17:54](#msg602963baa7fc4b573bd45c7a)Thanks @wallysilva. We will indeed need people to do that.

loziniak

[21:01](#msg60298fa84c79215749e7e7cc)Exercism is now in a transition between v2 and v3. Current site is in maintenance mode, so I don't know if new tracks can be tested there. But there is also a test version of v3, and I hope it can be used to test fresh exercises. Athough, it's at dev/pre-alpha stage.

## Monday 8th March, 2021

loziniak

[13:17](#msg604623f0d2619a4f2e2ecc32)Hello. I created a summary page for Red: https://github.com/loziniak/red-1/blob/docs/docs/ABOUT.md  
Let me know if there's something you would change.

[14:12](#msg604630d9d1aee44e2dd125e0)Also couple words about installation: https://github.com/loziniak/red-1/blob/docs/docs/INSTALLATION.md

[14:22](#msg6046331195e23446e41e4c7b)Ah, and a code snippet: https://github.com/loziniak/red-1/blob/docs/docs/SNIPPET.txt

## Wednesday 10th March, 2021

wallysilva

[04:41](#msg60484de5e562cf54acae56d6)Great job!👏🏻👏🏻👏🏻

greggirwin

[05:11](#msg6048551222a5ce4a9145e7aa)Thanks @loziniak. Will try to catch up and review soon.

## Tuesday 6th April, 2021

loziniak

[13:31](#msg606c62a33153ce63a3c160aa)I've written a \[test runner for Exercism](https://github.com/exercism/red-test-runner). I'd appreciate a code review from Red point of view.

[13:36](#msg606c63c1d765936399d92c4c)Also – what's the requirement for a repo to be included in \*progress.red-lang.org\*? It'd be nice to see Exercism track changes there.

greggirwin

[14:58](#msg606c772c657d022d5a668237)Busy day here, but will try to review before long. I added @x8x here, as I agree that tracking Red on Exercism would be great for progress.red-lang.org.

x8x

[19:05](#msg606cb1051dbd860a23360870)@loziniak Add you repo \[here](https://github.com/red/red/wiki/%5BLINKS%5D-Scripts-collection) to have it tracked on progress site.

greggirwin

[20:29](#msg606cc4ad458fc52d5f344b78)@loziniak

\- You can include a literal none in maps with construction syntax: `map: #(message: #[none])`  
\- Be sure to `copy/deep` on your map templates for series in them. And look at ticket #2167 for gotchas.  
\- I would break out the prin/print/probe override/reset into helpers, to keep the main loop clean. Also note that to be like `print` your replacement should return unset.  
\- Some of the naming is a little confusing on a quick read. e.g. in the loop there's `result`, `case-result`, then `case` that uses `case-result` checks in it.  
\- Since you make files names at the top already, I'd do that for the results file too, rather than having an `arg/3` reference way down there.

loziniak

[22:01](#msg606cda2a9ecc541fc8df158d)Fantastic, thanks for feedback.

## Monday 12nd April, 2021

loziniak

[21:36](#msg6074bd4c97cf5067465ad245)Thanks, @greggirwin for review, I included all suggestions: https://github.com/exercism/red-test-runner/pull/5 . Also, I have a problem with isolating \*runner\*'s context: https://github.com/exercism/red-test-runner/issues/4, I don't have idea how to do it elegantly. Perhaps someone could help?

greggirwin

[21:56](#msg6074c1f72e5574669b31a3dd)When executing arbitrary Red code, there's no easy answer. When `protect` is added that will help, and modules should be restrictable, but we don't have those yet. In this case a catch is that you want it in your environment for the `print...` redefinitions. You've probably already thought of the inelegant solution of loading and binding to a context created for the runner (with words you want to catch).

loziniak

[21:59](#msg6074c2cc55d78266a63ed1e4)more something like:

```
test-runner: context [
	args: none
	slug: none
	input-dir: none
	...
]

test-runner/args: load system/script/args
test-runner/slug: test-runner/args/1
test-runner/input-dir: to-red-file test-runner/args/2
...
```

## Tuesday 13th April, 2021

loziniak

[22:15](#msg607617f8dc24646812bc9f3c)&gt; loading and binding to a context created for the runner

To be honest - not. Rebinding contexts is still a little bit of magic for me. I'll try to investigate this and maybe learn something useful in the process.

greggirwin

[22:20](#msg6076193646a93d4a19c4b573)It \*is* magic. :^) Partly because you can't see it, but also because we don't think of contexts as a thing that exists in natural language. So moving the same word around in contexts is an unnatural act.

## Wednesday 14th April, 2021

toomasv

[04:16](#msg60766ca11f84d71853b6e762)How so? Context in natural language is ubiquitous. We don't think of it because it is literally everywhere and we switch contexts all the time naturally. But in Red context switching is more explicit and we don't have ambiguous contexts (except in our heads) as in NL.

loziniak

[09:04](#msg6076b010c60826673ba2920c)I think I've nailed it, even without using `bind`. Elegant enough for me, as long as it's correct:  
https://github.com/exercism/red-test-runner/pull/6

greggirwin

[16:33](#msg6077193fc60826673ba3b775)@toomasv what I mean is that you can't take a word out of one context in NL and put it in another, where the same word also exists in a different context. e.g. the old `spoon` example just becomes a madman's mantra. The "rock" example from @9214 is different, and makes your point, so maybe there's a meta element here in contexts as data structures versus contexts as part of language. The structure of a sentence provides context in NL, but arbitrarily reassigning context without that "ordered, semantic container" leaves you in the dark about what a word's context might be.

toomasv

[16:34](#msg607719b3c60826673ba3b894)Ah, yes, now I understand what you mean.

greggirwin

[16:38](#msg60771a7d06e2e024e85287c5)Your word choice with "explicit" is interesting too, because we \*can* write dialects that support implicit context changes, though they'd necessarily be more advanced than simple word matching.

[16:47](#msg60771cb12e5574669b37ca2b)@loziniak are there explicit ordering rules in test cases, so `last words-of ...` is guaranteed to produce what you want?

## Thursday 15th April, 2021

loziniak

[14:27](#msg60784d58d7953918615d18ba)Yes. It's up to exercise description to request/enforce a specific form, like a function in \[hello-world exercise](https://github.com/exercism/red/blob/main/exercises/practice/hello-world/hello-world.red), where your task is only to modify existing code. A task can always be like "assign output to a word" or similar.

[14:29](#msg60784db6a2ac0d38e7ba0b4a)`last words-of ...` takes a value of last assignment in student's answer script.

[14:31](#msg60784e4cb6a4714a29c7842b)I realised though, that my solution only stops from overwriting \*test-runner* context by \*answer\*, and still access to this context is possible (like `append output "something"`, so it's just partially a success :-/

greggirwin

[18:54](#msg60788bd9c60826673ba780ad)You should be able to use a prototype object that contains the words you want to protect. But if you need access to those from the caller, you'll also have to use a path to the test runner.

## Friday 16th April, 2021

loziniak

[05:32](#msg607921732e5574669b3cfafe)Ah, so \[my example from monday ↑↑](https://gitter.im/red/training?at=6074c2cc55d78266a63ed1e4) seems to be the only solution? I'd like to protect all words if possible. Code will be messy unfortunately with all the paths to \*test-runner* context. Perhaps that could ne a good \*WISH\*? :-)

[08:21](#msg607948ff55d78266a64a887a)At small scale I managed to come up with this:

```
>> context [a: "12" context bind [ append a "3"] system/words]
*** Script Error: a has no value
*** Where: append
*** Stack: context context
```

but when I try to apply it to the test-runner script, I fail.

[09:14](#msg6079558681866c680c28758b)Ok, I made it! \[there was a word name collision](https://github.com/exercism/red-test-runner/pull/6/commits/38518e1cfe036ce8213bca455ac7dfcc2b9d94cc#diff-d30f0556f01e449182531e3ad1f25c99829e22d8956a3c8bbd4c793fcecb2862R119) between \*test-runner.red* and \*test-runner-test.red\*.

greggirwin

[19:41](#msg6079e869a2ac0d38e7be43d0)Glad you solved it. Be careful on the naming treadmill. %red-test-runner-runner-test.red may be next, and a palindrome to boot! :^)

## Friday 23th April, 2021

loziniak

[09:22](#msg608291e2a2ac0d38e7d33934)A nice article by Elm track maintainers on changes comming to Exercism:  
https://hackmd.io/60gYIZYYS-6\_l8kLH0QXAQ?view  
Most applies also to \[Red track](https://github.com/exercism/red/).

greggirwin

[13:39](#msg6082ce1e81866c680c3fb77a)Thanks @loziniak. Will try to read later today.

## Friday 11st June, 2021

loziniak

[11:47](#msg60c34d6cbed13a2dba7a3329)Exercism moves to a \["phased" beta](https://exercism.lol/) stage, and here is the Red track for preview:  
https://exercism.lol/tracks/red

greggirwin

[18:25](#msg60c3aab5c705e53c1c881eb0)Nice! I will try to check it out in detail soon. If someone, like me perchance, were to help, maybe wordsmitting the intro to start, how best to contribute?

loziniak

[22:10](#msg60c3df39d161a54f050e66ad)Wordsmitting would be especially great, given my non-native English. Also general testing, proof-reading and review. Also, check \["contributing"](https://github.com/exercism/red/#contributing) section in readme.

[22:18](#msg60c3e1345e8dfc4f1177c353)Also, as fresh \*reducer* I may have not enough practice and insight to create exhaustive \[concept](https://github.com/exercism/docs/blob/main/building/tracks/concepts.md) learning flow. Good example is in Elixir track: https://exercism.lol/tracks/elixir/concepts

greggirwin

[22:34](#msg60c3e4f88681550d4ee5e09d)Thanks. It's a great start. I just love to tinker with words. :^) @galenivanov might have some thoughts, as he's working on Python primers now.

## Monday 6th September, 2021

loziniak

[01:51](#msg6135741cd206b85e4f81b215)Exercism v3 is alive:  
https://exercism.org/  
And Red is almost there :-)

greggirwin

[02:36](#msg61357ec35b92082de1876079)Great! Thanks.

zentrog:matrix.org

[02:36](#msg61357ec55b92082de1876080)Cool!

## Friday 24th September, 2021

loziniak

[16:04](#msg614df704f428f97a9fa4444b)Hello. If anyone wants to solve some exercises in Red, I'm working on preparing first 20 exercises batch for Exercism, and the most work there is to provide example solutions. Here is the list: https://github.com/exercism/red/issues/31#issuecomment-859965936

[16:07](#msg614df7d1d206b85e4fb77f71)Anyone interested, just comment on this issue #31, or create separate issue.

## Saturday 2nd October, 2021

wallysilva

[21:48](#msg6158d3bccd4972068b266e6d)Hi @loziniak, I would be happy to try a couple of simple ones. I will do the "Hello World" one later today.

## Sunday 3th October, 2021

wallysilva

[01:34](#msg6159088ccd4972068b26cda8)@loziniak, I believe you can find some of the solutions in the Rosetta Code. For instance, the solution for the Roman Numerals problem: http://www.rosettacode.org/wiki/Roman\_numerals/Decode#Red

loziniak

[19:59](#msg615a0b9229ddcd029300ff46)Oh, nice. Thanks.

## Wednesday 20th October, 2021

zentrog:matrix.org

[18:46](#msg6170642229ddcd0293336e86)@loziniak: I've been casually interested in Excercism for a while, but now that there is someone driving this effort, it feels like the little chunks are small enough that I can actually contribute. I really appreciate your effort on this!  
I was thinking more about the exercise test runner, and the part which feels a little awkward to me is editing the file and knowing to change the `ignore-after` field. That and switching to use the example solution. What would you think about adding some optional arguments to the test script to specify how many tests to run, and a way to target the example solution?  
I should probably look at some other language tracks to see how they are doing it, but that was just based on my impression. I haven't seen yet how this compares with a user of the track vs someone adding examples.

loziniak

[23:59](#msg6170ad6929ddcd0293342213)Hi @zentrog:matrix.org . Thanks for contributions so far, the greatest of them is just being here and participating, so it doesn't feel being on my own anymore :-)  
The test script is certainly not perfect, the main problem being the code repeated in every exercise and I don't have a clear idea how to get over it.  
Editing the `ignore-after` value is a little awkward for me too, but it's just like this in every other track. Usually they use some testing framework, and all (except the 1st) test cases are manually bypassed (\[csharp track example](https://github.com/exercism/csharp/blob/main/exercises/practice/darts/DartsTests.cs)). Personally, I'd just enable all tests by default, although I think I've read somewhere, that enabling tests one-by-one is a recommended practice in TDD. Having this as an optional argument is probably ok. Perhaps @iHiD would have a say here?  
Switching to example solution is done only, when creating exercise. Final users "consume" the example just by copying it to main example file, which they then test.

## Thursday 21st October, 2021

zentrog:matrix.org

[00:10](#msg6170affc29ddcd0293342698)Oh, wow. Removing the Skips is way more cumbersome!  
If it helps, I think what you have so far seems great. And the fact that the test scripts can be auto-generated means they could potentially be updated the same way. I don't think it is a high priority, but I thought I should mention it to see if you think it's something worth pursuing.  
The idea I had was something simple like the first time you run the tests, it would give a hint like

```
red --cli darts-test.red
Running 1 of 13 tests...
<test results>
Run "darts-test.red 2" to run the next test
```

Then you just need to press &lt;up&gt; and change the number each time

loziniak

[00:27](#msg6170b3e9a41fd20699f59659)I'd probably go rather for the argument being a number of tests to run, than number of a test. Then user can easily fire all the tests at once. And if making test \*n* pass would break any earlier tests, it will be evident.  
Thanks for warm feedback. In fact, I thought also about automatic updates. Just didn't need it so far. And keeping custom changes intact (like for example adding few track-specific test cases) would need some thought.

[00:33](#msg6170b5432197144e8478b0f1)Btw now that I think about it, having an example solution just seems to be needed for unit-testing exercise's tests by CI/CD scripts, and not being copied by students :-)

zentrog:matrix.org

[00:56](#msg6170baa8a41fd20699f5a6e3)That's actually the way I was thinking about it as well - the number would just set ignore-after if it was present. The reason for that message is more to provide a hint as to what to do next, not explicitly describing the usage of the command

[00:57](#msg6170baf12197144e8478bdb0)That's quite interesting about the unit tests. It seems like it would need a way to run all the tests as well

loziniak

[12:02](#msg617156f27db1e3753e52f32e)There is some info on CI on Exercism, still a TODO on a Red track:  
https://exercism.org/docs/building/tracks/ci

greggirwin

[18:23](#msg6171b01bf2cedf67f99a8010)Thanks for jumping in @zentrog:matrix.org. I keep hoping to make time to dig into this, but my best laid plans...aren't.

zentrog:matrix.org

[18:43](#msg6171b4d1cd4972068b5e83b6)@loziniak: Thanks for the link!  
I found an interesting issue with the sgf-parser exercise, which is that the canonical data uses the property "parse", which makes the generated code use that name for the exercise stub function. That causes an obvious conflict with `parse`. The simple fix would be to just rename those to something that doesn't conflict. But it raises the question of whether there needs to be a mechanism to remap certain names, because it breaks the automation for that exercise.

[18:46](#msg6171b590a41fd20699f80252)@greggirwin: I'm shocked that your plans are a bit overloaded 😏 (&lt;- if it's hard to see what that is, it's the smirking/sly smile face, btw)

greggirwin

[18:50](#msg6171b683fb8ca0572bd5baa2)I got it. ;^)

## Friday 22nd October, 2021

loziniak

[14:23](#msg6172c95998c13e7550ed60b7)@zentrog:matrix.org I think it's just fine to rename it, as currently we don't have exercise re-generation code. I think when we do, then we'll start to worry. I think there will be little cases like that, and we can deal with them by manually merging changes with git to preserve edits. If it will be too much work, then perhaps would be a good moment to start thinking about renaming in case of system/words conflict.
