# Archived messages from: https://app.gitter.im/#/room/#red_tests:gitter.im (https://app.gitter.im/#/room/!ngbvuBcvjMtGDWbqUE:gitter.im)

## 4-Dec-2023

[1:22:35](#P0PSOKJw6b5ipFJ0VlB19oy6i17wEc1BYE9-k_aIEUI) <SkySpiral7>:
So what's a recommended way to write tests for my red app? https://github.com/red/red/tree/master/quick-test doesn't have a read me so I'm guessing it wasn't intended to be used for anything besides the red repo. Right now I'm using https://github.com/koksyn/RedUnit which seems to have been built for an older red

[1:23:17](#4ffy1D-f6sTEXXy3Du7QSh3hdKLqdtIIGEAGxxN9qdM) <SkySpiral7>:
 * So what's a recommended way to write tests for my red app? https://github.com/red/red/tree/master/quick-test doesn't have a read me so I'm guessing it wasn't intended to be used for anything besides the red repo. Right now I'm using https://github.com/koksyn/RedUnit which was been built for an older red (0.6.3)

[1:25:31](#rGkbz4r58cGSzFbXwe7GleBTeZ6nIVNDEAlG8kzs0dA) <SkySpiral7>:
I haven't looked if there's a compatible REBOL test framework

[4:35:13](#kHHQkbSPWCPgDycctwLMWHsj0I5t7O4_nMWVIEjmaSY) <endo64>:
You can find some info about `quick-test` here https://static.red-lang.org/red-system-quick-test.html

[8:55:04](#9I55plZFxqDgFiQOYA8HrwsvRDslQcOawG7EOptqukI) <hiiamboris>:
I'm using `#assert` https://codeberg.org/hiiamboris/red-common/src/branch/master/assert.md

## 12-Dec-2023

[3:39:39](#sIU0n37O4H90kDoEw7Lk4Yudv-7mp5XjRs49xwzeNzI) <SkySpiral7>:
That assert looks super helpful however it's not a full testing framework. I may use that assert in combination with another thing

[10:47:38](#UG7sZT1EWuftXLVGbBOKYdlr3f007G4vnu0ARyOYxT4) <hiiamboris>:
You're welcome to extend it. My only advice is to design such framework from real world needs `#assert` may be unfit for, rather than copying something someone else built, because that's what e.g. RedUnit feels like to me: a complex tool that does something that nobody needs.

[10:52:43](#6yLViCB_czi8eT6qxzQDkXERUhJmHxIFZvYp45v7-ss) <hiiamboris>:
* You're welcome to extend it. My only advice is to design such framework from real world needs `#assert` may be unfit for, rather than copying something someone else built, because that's what e.g. RedUnit feels like to me: a tool that does a simple thing that nobody needs in a complicated way.

[11:07:48](#JcIrsbyck9Hw7yl_lEWB1gKkhw6m3nf2CFLmMb1zxV0) <hiiamboris>:
To take an illustration from RedUnit: `redunit/assert-not-equals <expected> <actual>`
It is beyond me why such a thing even exists. How is this better than `expected <> actual`?

[11:08:39](#PQZ2eDQo7WHQOzm6QJauqNT230i6lRiyi3YrNPFcHrU) <hiiamboris>:
* To take an illustration from RedUnit: `redunit/assert-not-equals <expected> <actual>`
It is beyond me why such a thing even exists. How is this better than just `expected <> actual`?

[11:09:00](#FevcYoLjAhb_uRLJBpcS4mAfHcf6oKic9qpmn1KMU5c) <hiiamboris>:
* To take an illustration from RedUnit: `redunit/assert-not-equals <expected> <actual>`
It is beyond me why such a thing even exists. How is this better than just `expected <> actual`? or `assert expected <> actual`?

[11:12:29](#Xx0SmTthO32FDytTXNfmxknZPzYuMV6lHe984rDRNJo) <hiiamboris>:
Or if it shows me the number of failed tests, what does this info tell me? Do I see high number and feel proud that I worked hard to have so many? Or how do I use this number?

[11:12:47](#UvawvmQv1Q0Y1hvQWv-0C5IQu4gyDcmxq1Wzamd3buk) <hiiamboris>:
* Or if it shows me the number of tests run, what does this info tell me? Do I see high number and feel proud that I worked hard to have so many? Or how do I use this number?

[11:15:21](#2NhYSzMJJ35EPnIxjFHrCHIUOxlNTBBXCm7731tQf40) <hiiamboris>:
Ultimately, Red is a language that allows you to bend itself to any task using dialecting. So test frameworks for bigger projects are expected to reflect specifics of those projects and there may not even be much common ground among them.

[11:19:21](#fzHA55iHG6Lf0ZoZjIns0oy5Fthm4R5Eb_adZHF4Uio) <hiiamboris>:
Using my (badly out of sync) GUI testing framework as an example, here's a typical dialected test in it that won't make sense outside GUI:
[`expect [box [100x300 at s 10x10 > 70% all blue]]`](https://codeberg.org/hiiamboris/red-view-test-system/src/commit/571f9d8e0725120e29d3c5afac07c0c40c53ece1/issues.red#L284)
But it makes description of expectations a breeze. It could have been 20-30 assertions, instead it's says I expect a box drawn, with roughly 100x300 size, located roughly at 10x10 on screenshot `s`, with over 70% of that box's area covered in opaque blue.

[11:21:29](#yholT5fWCZX97uzkDoeTucQaCSECOa9-yCx8MNN0TLw) <hiiamboris>:
* Using my (badly out of sync) GUI testing framework as an example, here's a typical dialected test in it that won't make sense outside GUI:
[`expect [box [100x300 at s 10x10 > 70% all blue]]`](https://codeberg.org/hiiamboris/red-view-test-system/src/commit/571f9d8e0725120e29d3c5afac07c0c40c53ece1/issues.red#L284)
But it makes description of expectations a breeze. It could have been 20-30 assertions, instead it's says I expect a box drawn, with roughly 100x300 size, located roughly at 10x10 on screenshot `s`, with over 70% of that box's area covered in opaque blue. And if that fails, it will show me a report where I will be able to investigate what went wrong on which stage, as well as store all the artifacts for deeper inspection.

[11:22:57](#Ia1labM0OuqZLNZ-MrMx7wnpI3Lxa1vLx6AHRhAq8ng) <hiiamboris>:
* Using my (badly out of sync) GUI testing framework as an example, here's a typical dialected test in it that won't make sense outside GUI:
[`expect [box [100x300 at s 10x10 > 70% all blue]]`](https://codeberg.org/hiiamboris/red-view-test-system/src/commit/571f9d8e0725120e29d3c5afac07c0c40c53ece1/issues.red#L284)
But it makes description of expectations a breeze. It could have been 20-30 assertions, instead it says I expect a box drawn, with roughly 100x300 size, located roughly at 10x10 on screenshot `s`, with over 70% of that box's area covered in opaque blue. And if that fails, it will show me a report where I will be able to investigate what went wrong on which stage, as well as store all the artifacts for deeper inspection.

## 21-Dec-2023

[17:59:38](#HGWIyW0HH2C3e11QIORuhrpbVzCiDSKamFViplNBFiU) <SkySpiral7>:
I initially used RedUnit because that's the only thing I found from a google search. My tests are currently written using RedUnit and it was easy enough to upgrade RedUnit to the latest Red.

I looked into quick-test but it wasn't designed for outside use and even if I did copy/paste it into my repo, the complex test-all I'd have to write in rebol. the only advantage is that it dog-foods latest red which isn't worth it.

`redunit/assert-not-equals expected actual` is the same as `redunit/assert-true expected <> actual` the only difference is source code readability (which one is more readable is an opinion). It probably exists because test frameworks for other languages have it. number of tests run: I've needed such a thing in java before because upgrading our testing framework caused some tests to not run. however for your `#assert` the tests are in the same file so you wouldn't need the count as long as you know that any of them have run (some way to verify that they aren't disabled).

Thinking about it: I have a couple questions about your `#assert` but if they work out then RedUnit would have no advantage. So I may try switching my tests over

[18:00:41](#Xrn474unp6lonvmbPmPRIyYoP5wKFZmNYThiXSDRVeg) <SkySpiral7>:
I may also look into that gui test you mentioned

[22:39:45](#LX3TgpvceRWZcnKLCFba0emrd4h1RpujJmH8uBddrjI) <SkySpiral7>:
I thought of a limitation of using `#assert` for unit testing is that it tests functions but not whole files. RedUnit has the ability to `do %main.red` each test. Example non-idempotent red files would be if it used system/options/args or read from files.

## 22-Dec-2023

[10:43:44](#btjnc6DLjxEheEfw0ph1VdA60Ju_uuW47NwYyr4MlpQ) <hiiamboris>:
IO and `system/options/args` simulation was indeed out of scope of `#assert`.

## 3-Jan-2024

[22:57:40](#FrpuX4mw4-NzVI9atjE9TbdZskIHmLs-zX9xfyhlu-8) <SkySpiral7>:
RedUnit vs `#assert` Meaningful Differences:
* Support: RedUnit is seemingly abandoned so I'd have to support it myself (I've already updated it) vs red-commons which has recent updates.
* Test execution speed: `#assert` is much faster (96ms vs 381ms) for my small app.
* Failure reporting: `#assert` prints a lot more info but that info isn't very useful. It's mostly just noise that makes it harder to see what failed.
* Quality assurance: `#assert` lacks a summary report which means that there's no way to tell the difference between "all pass" and disabled/not run. It is therefore possible for tests to be accidentally disabled, have some bugs creep in, and I'd never know that the tests would be failing if they were to be run. RedUnit shows a very clear "Status: Success" message and has test/assertion counts to prove that more than 0 were executed.
* Build check: for `#assert` I'd have to search the logs for a certain string and hope there's no false positive/negative. RedUnit's summary report is more easily read and more importantly it will have an exit code to indicate success.

When I tried to follow the read me's recommended style for `#assert` I ran into a few limitations/issues (eg: can't put assert in an object's context and can't test the use of `system/options/args`). However I was able to address them (and a few minor things) by moving `#assert` to its own test file at which point most of the considerations for RedUnit vs `#assert` were the same.

The "Quality assurance" point was a particular problem for me. For some reason (red bug? I'll work on making an issue for it) including red-commons in the same file that I'm using `#assert` didn't actually do the `#include`, so all the `#assert` were silently ignored (instead I had to `#include` in the parent file). Having tests but not knowing if they are passing kinda defeats the point of tests. Changing to use `assert` works around this issue since it'll fail to compile if not included correctly. However the "Quality assurance" point remains: without a summary report I have to just hope that I wrote my tests correctly so that they are executed. This point alone is condemning (plus `#assert`'s only real advantage is a speed diff that doesn't affect me much) so I'll be sticking with RedUnit for now.

I hope this doesn't sound mean. You made a fine tool and my decision was opinion based.

[23:10:54](#VVt0XDVafCX3SZWLN-D_jbGcFY196ZXQdzmCfZVf8lI) <SkySpiral7>:
That last line sounds like I'm breaking up with you so I guess I over corrected but whatever: it's fine

## 4-Jan-2024

[8:53:09](#3JA3Ev93ptL_1I60nSysE5Ygjiu84JUPyjGj0ogij9w) <hiiamboris>:
Thanks for your usage report

[8:54:16](#c0JUqIbHgt-WmpzwUiPi1cXo8UN5MZKVrgjv0AGjfzs) <hiiamboris>:
Some of your issues come from https://github.com/red/red/issues/5122

[11:20:43](#AzdeITiA-UATS1ZBG68l5fFqlmjggkm441qrjhb0vKA) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@skyspiral7:gitter.im> RedUnit vs `#assert` Meaningful Differences:
> * Support: RedUnit is seemingly abandoned so I'd have to support it myself (I've already updated it) vs red-commons which has recent updates.
> * Test execution speed: `#assert` is much faster (96ms vs 381ms) for my small app.
> * Failure reporting: `#assert` prints a lot more info but that info isn't very useful. It's mostly just noise that makes it harder to see what failed.
> * Quality assurance: `#assert` lacks a summary report which means that there's no way to tell the difference between "all pass" and disabled/not run. It is therefore possible for tests to be accidentally disabled, have some bugs creep in, and I'd never know that the tests would be failing if they were to be run. RedUnit shows a very clear "Status: Success" message and has test/assertion counts to prove that more than 0 were executed.
> * Build check: for `#assert` I'd have to search the logs for a certain string and hope there's no false positive/negative. RedUnit's summary report is more easily read and more importantly it will have an exit code to indicate success.
> 
> When I tried to follow the read me's recommended style for `#assert` I ran into a few limitations/issues (eg: can't put assert in an object's context and can't test the use of `system/options/args`). However I was able to address them (and a few minor things) by moving `#assert` to its own test file at which point most of the considerations for RedUnit vs `#assert` were the same.
> 
> The "Quality assurance" point was a particular problem for me. For some reason (red bug? I'll work on making an issue for it) including red-commons in the same file that I'm using `#assert` didn't actually do the `#include`, so all the `#assert` were silently ignored (instead I had to `#include` in the parent file). Having tests but not knowing if they are passing kinda defeats the point of tests. Changing to use `assert` works around this issue since it'll fail to compile if not included correctly. However the "Quality assurance" point remains: without a summary report I have to just hope that I wrote my tests correctly so that they are executed. This point alone is condemning (plus `#assert`'s only real advantage is a speed diff that doesn't affect me much) so I'll be sticking with RedUnit for now.
> 
> I hope this doesn't sound mean. You made a fine tool and my decision was opinion based.

Have you published your updated version of Red Unit?

[17:14:11](#p1rSw9FR5c2QatoMP3j2zSQcYX2E9Kwlp8qlizHw6E4) <SkySpiral7>:
Specifically https://github.com/red/red/issues/4128 which I just posted a comment on

[17:15:08](#l3G15E3vYbU_DMJW8dmqvcPzUxKZFVYyBVVrTX2l2KA) <SkySpiral7>:
Ideally red would fix all bugs but until then using a macro is less reliable

[17:42:21](#t2v-yDdvpWpONFaWa3r89LXlcq8Hah9cfjWIZgoabZo) <SkySpiral7>:
My fork is a public repo: https://github.com/SkySpiral7/RedUnit/tree/master
I've already made a PR to the original repo: https://github.com/koksyn/RedUnit/pull/17 which he hasn't commented on yet. It's been 3 weeks.

[20:05:59](#4qJqikXrxg2farHBadfLVuB3NWHAdYE5mjMU95haZS4) <SkySpiral7>:
https://github.com/SkySpiral7/BinaryDeltaCrud/tree/trunk/src/test/red
for where I use RedUnit in case you want concrete examples.

[20:21:59](#BMRC0o_PDgAqWt8VQcRJf2c5Vu5fWx1hyarSl56oZkc) <hiiamboris>:
FYI `func` leaks all set-words

[20:54:34](#s7nB9kJ-3cUCpvbeEdGN-zqf7rbP6Bw4BQ5WjKqftzg) <SkySpiral7>:
Is `function` any different? All my `func` are in a context so they can't leak outside that... Oh wait they could still leak between func. I hadn't considered that

[21:13:28](#70XMqnlzAiW9uwqGOto1XhzHgIhxkK5lgo5TtEEFCkU) <SkySpiral7>:
Looks like `func` defaults set-words to `/extern` but `function` defaults them to `/local`

[21:16:33](#xOikJ34jeaOLY7MmkOXlI4Je7l2JZKiPqFsfxr1hJtk) <SkySpiral7>:
And `does` is the same as `func []`

## 5-Jan-2024

[7:17:08](#lkfjbhPDWZ7wH2M3Qw4w2VWfOuiTbkYyGpQ6J2NoSpY) <endo64>:
`function` makes all set-words to be local, `extern` is to prevent/disable that behavior.

`func` doesn't do anything (saying defaults to `/extern` is just confusing), and `does` is only a shortcut to define a function with no argument and no local words.

[17:58:11](#9C7LUj7JBu4FjsQ59jQcn-LqoMdEC7siarvM0r4V_Es) <greggirwin (Gregg Irwin)>:
Also, be aware that `set 'x` is not captured by `function`; only set-word setting syntax is. And if you use loops that take words (e.g. `foreach`, `repeat`, their words will be captured by `function` but not `func`.

## 8-Jan-2024

[12:38:22](#aXppJatSmEVfcquI0KeYAF-zxP95Cdpau2BhwXz1Dug) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@greggirwin-55659ddb15522ed4b3e1006f:gitter.im> Also, be aware that `set 'x` is not captured by `function`; only set-word setting syntax is. And if you use loops that take words (e.g. `foreach`, `repeat`, their words will be captured by `function` but not `func`.

So they have no local context and each mentioned word Is global?

[18:08:26](#HCwuT0Z4rUnDYwRBgQJJSTT_h-EeQ0gpowYmVrt1Npc) <greggirwin (Gregg Irwin)>:
Correct.

[18:09:15](#xb_N3Mql_vJoQMts_Ft-_tWPZoxolULpt8yAh1AqG1A) <greggirwin (Gregg Irwin)>:
```

[18:09:46](#VSEPKG7_O0nSWFUBb5zgSaiYpq2Iu5Bh2022BMp66wc) <greggirwin (Gregg Irwin)>:
```

[18:09:53](#Td2z1j9wbRqK6ONVOo0zWkS6DFdKGipDdZMMirJ0Yxg) <greggirwin (Gregg Irwin)>:
 * ```
>> fn: function [][x: 0 set 'y 1]
== func [/local x][x: 0 set 'y 1]
>> fn
== 1
>> x
*** Script Error: x has no value
*** Where: catch
*** Near : x
*** Stack:  

>> y
== 1

## 10-Jan-2024

[1:28:43](#zziD6_xIHATLeJrl3FtFDy2itxJHe1L7DL5Bse2crkY) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> I'm using `#assert` https://codeberg.org/hiiamboris/red-common/src/branch/master/assert.md

The link inside the DOC points to a gitlab search query for assert. Is it correct?

[1:31:31](#ocKn5X7RoIhfBVRTX7kTptKtwrCQPLieiZelKIG48mc) <GiuseppeChillemi (GiuseppeChillemi)>:
@hiiamboris: I am starting my conding life with `assert`. What should I do if I want to test a object which has block whose position is not ad head? I want to test if it always contains the same element and it is at the same position, otherwhise it assertion should fail.

[7:34:45](#Zs9Ac-VEj99BMKCAxWtjsIS5zrWytT6vlW-yDLRa5G8) <hiiamboris>:
`head?` for head test, `find` for element test

[7:35:06](#Q5wz55Vk04DVYdi0IkL3EnrvpzD29oh4X7BU3Uk9M0Y) <hiiamboris>:
> gitlab
thanks

[7:35:08](#CUZaC7nOMpSEn5p6cnS7KPCvCoYfLwMsy5iCc_MZtLA) <hiiamboris>:
* > gitlab

thanks

[7:38:34](#irOS4l9KhgufBJu5Ent3WXvK6zU8mhi-DtTzQ4o3X2w) <hiiamboris>:
points to github now, since no search on codeberg yet

[18:52:31](#VMLKwZs5wipKkYTqlOlVkJdA3cs10A8VxsSWgictpfk) <greggirwin (Gregg Irwin)>:
You can also use `index?` to confirm the position of values in blocks.

## 12-Jan-2024

[21:47:59](#7RgN8dAXZqenI6H-rYo-hsPN2TpDzd0bVNZOh2e6nHk) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> `head?` for head test, `find` for element test

Ok, so I should check the content.

[21:48:37](#-5Cbh7x5YOKxAlMq85jW8xRQNciWOfi0jeBd1rfpkpw) <GiuseppeChillemi (GiuseppeChillemi)>:
Again: Should i perform 1 assert for test or multiple ones?

[22:01:39](#HWWnpc2J-IHR8jFlm_EEdR-aQe-BPnt1Q4FI6PpfCek) <hiiamboris>:
you're the boss

## 7-Feb-2024

[20:07:27](#FYoob8IYYI9dP6QWnylz_yEyQS3PFT_1em2Xw0ltHNE) <loziniak (Maciej Łoziński)>:
If anyone wants to take a try, I've written a unit-test utility for a Red track in Exercism:

https://github.com/exercism/red/blob/main/_templates/practice-exercise/testlib.red

[20:31:22](#mml5uJ-AHQT37R0gZT5m-otRQJb2ab9P7ahsS5iOSF8) <loziniak (Maciej Łoziński)>:
example usage:

https://github.com/exercism/red/blob/main/exercises/practice/hello-world/hello-world-test.red

[20:39:26](#FoSEDDHF0Lk3F07v9UYMhSV94gGyOrjw6YNqGqo72n0) <loziniak (Maciej Łoziński)>:
It tests entire files, creating a clean context for them plus injecting `assert`, `expect` and `expect-error` functions. Then, test cases are added with description and test code, which should include one of mentioned functions. Test results can be printed out, or retrieved as a map. You can limit number of tests performed, the rest is ignored.

[21:22:05](#YGsViKCP-qlomWVQxODnKy-c-adTodlqCEZgog3RJj4) <loziniak (Maciej Łoziński)>:
Updated version with documentation:
https://github.com/loziniak/red-scripts/blob/master/testlib.red

## 23-Feb-2024

[19:04:53](#zoFZ_yYoqMFC0QjJChvC0NeyHMiolwwsXwgz819mLe4) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@loziniak-5a7ad629d73408ce4f8c1077:gitter.im> Updated version with documentation:
> https://github.com/loziniak/red-scripts/blob/master/testlib.red

I promise I will try it

