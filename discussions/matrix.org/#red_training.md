# Archived messages from: https://app.gitter.im/#/room/#red_training:gitter.im (https://app.gitter.im/#/room/!uVgsFkQEOOssxbokqt:gitter.im)

## 11-Feb-2021

[2:12:40](#etxDcKt8QAFlxJ0P0p-Gy0CN75qYnZwFX1OULU2_bo4) <loziniak (Maciej Łoziński)>:
Hi! Just made some changes to Excercism track:
https://github.com/exercism/red/commit/ba808a83cfff5d864d6cacae660a4e4d47ead33b
https://github.com/exercism/red/pull/2

[11:18:39](#EfJKc1MFOM9XmdDYyuQY-f64uBBVGrV5V66sLtiFEy4) <loziniak (Maciej Łoziński)>:
Hi! Is it possible to connect this channel's "github-feed" to `exercism/red` repository?

[11:58:32](#DTZ2SyLG6oeBtPVpxTlpceOf7SlOtBJE_waTUKMg404) <rebolek (Boleslav Březovský)>:
@loziniak I'm not sure, you can try asking at https://gitter.im/gitter/gitter . They're usually very fast to respond.

[13:19:57](#R1W1ZAj9IRCzBCoUjFCaNM9K1Ybx9oAAGCAx0xli-Tw) <loziniak (Maciej Łoziński)>:
Thanks @rebolek , I'll check this.

[15:36:11](#TMwSJCFS-pUU1T1HF9A9o1mzFqDH8MoHA-YgmJZa9po) <greggirwin (Gregg Irwin)>:
There's an option when you create the room, which I didn't use. Will check quickly here.

[15:38:15](#Bu_uO23CN_2VTIdM6GfT-4Platg0JnTCSh2pGsNaWRI) <greggirwin (Gregg Irwin)>:
Integrations and granting access I don't want to rush through, if that's the answer. Let me know what you find out @loziniak.

[21:25:15](#ZlSUx1P9wiK_cXs53-Xj2zU8JrZSK8gLl3yw-V2dFLw) <loziniak (Maciej Łoziński)>:
I asked on *gitter/gitter*. @greggirwin, perhaps you could become a Exercism maintainer with write access to github.com/exercism/red, is that what you mean by "granting access" and want to stay away from?

[21:36:43](#_hDp7KH1LPyOfulR6TY2KW9WfEAj9evOK6M-4tnzRqs) <greggirwin (Gregg Irwin)>:
I wasn't sure on granting webhook access, but it looks like that has to be done on the repo. I'm happy to be a maintainer there, or we can ask someone from Exercism to grant the access if they prefer.

[21:39:44](#ROSgFO2smvjHd_H-nk-ngaTKnfmf0u9nk-5TMe9T0VA) <loziniak (Maciej Łoziński)>:
Anyway, there's also happily a green light from Gitter: https://gitter.im/gitter/gitter?at=60259f665500a97f82ffca27 . Indeed, a blazing fast response from them.

[21:51:01](#XUUlQQEbpchDnvFzaHDZmn5N_pJEqNj6ve_ihY-js2I) <loziniak (Maciej Łoziński)>:
Ok, seems not so green, because write access does not equal access to settings (and thus webhooks). So, I think let's leave it for now.

## 12-Feb-2021

[20:13:03](#STHQCMGhOKnLjTWKzKBoUnyrlk0DESZFvnReluVhfEM) <loziniak (Maciej Łoziński)>:
Ok, seems not so green, because write access does not equal access to settings (and thus webhooks). So, I think let's leave it for now.

[20:33:45](#9R1d2ZAdb6vD4FuX8QTuL92-ZUaKXZ6wRvxEwJWw9y0) <loziniak (Maciej Łoziński)>:
@greggirwin 
> should we point people to a prebuilt console

What do you mean? Are you talking about how installation instructions should look like?

> do we want a simple test runner

https://github.com/exercism/red/issues/5

[20:41:35](#yh2lczRiw4-dTWbRltykFdY4IuS13-tQsGcJYpfLruY) <greggirwin (Gregg Irwin)>:
Yes. In the very near future (we hope) the Red DL will be the prebuilt console directly, so you can run instantly, but it's not that way yet. 

Agreed on testing. I roll special case testers, and we'll find what works well there. I don't think `quick-test` is the best choice for this purpose.

[20:53:47](#MHuuMEQFdiXw0M1pQn6rlu9ha3GCgduWWRIOSwDmLq0) <loziniak (Maciej Łoziński)>:
> Agreed on testing

Thanks! Would you mind commenting also on GitHub?

[20:54:15](#m9XrUKZnYH8-ZrSrepcEciUzN7X5kU-W4YaF00AgTPQ) <greggirwin (Gregg Irwin)>:
Done.

[21:17:36](#hOldQT1t0DZ652Pt0JiOwnJi0nBS1eD5iG1pQtx4Nxc) <loziniak (Maciej Łoziński)>:
>  if there are transcripts of mentoring sessions, that would be great too

They don't give that. Instead, I've been pointed at mentoring instructions, that are available to every exercise:
https://github.com/exercism/website-copy/blob/main/tracks/ruby/exercises/resistor-color-duo/mentoring.md

[21:21:21](#wIKsr6qHnhDVZHXUe3ssj-QQUQNqCF3T8E0VKpG1_do) <greggirwin (Gregg Irwin)>:
:+1:

## 13-Feb-2021

[21:59:28](#vC50LvVitrMbeM-bL53DyweLhhTvWrM-9df-BpFmtxo) <loziniak (Maciej Łoziński)>:
Added first exercise: https://github.com/exercism/red/pull/7

[22:41:56](#v7koRgtjHd-B2jr_j-w4Ub8-lh9J-glDiJSO9zbUT3E) <greggirwin (Gregg Irwin)>:
Woohoo! Thanks @loziniak. I will try to review in the next few days.

## 14-Feb-2021

[7:31:24](#AD2ag1BUk1LwPlWYcLbutJKanLNC8nWeUjt43qozyzQ) <wallysilva (Wally)>:
Oooh, this is cool stuff! If you guys need some one to try the exercises, I will be happy to be your a guinea pig ������

[17:54:03](#IGaoVZ0f4OBQjwWyr17M0-XfxOS_mSZJfp3lXRffL3M) <greggirwin (Gregg Irwin)>:
Thanks @wallysilva. We will indeed need people to do that.

[21:01:29](#I_td6YvC5dZGjgh-oHaGYv4P39ncWWqAcBRHK6GWd84) <loziniak (Maciej Łoziński)>:
Exercism is now in a transition between v2 and v3. Current site is in maintenance mode, so I don't know if new tracks can be tested there. But there is also a test version of v3, and I hope it can be used to test fresh tasks. Athough, it's at==in dev/pre-alpha stage.

[21:01:40](#byn6t4ZupqHzjG7LCUJjvfPrdeUNN4OzYM6CcZUpG04) <loziniak (Maciej Łoziński)>:
* Exercism is now in a transition between v2 and v3. Current site is in maintenance mode, so I don't know if new tracks can be tested there. But there is also a test version of v3, and I hope it can be used to test fresh tasks. Athough, it's at dev/pre-alpha stage.

[21:02:51](#BfxwAR3aJjvasnIyFJr2yzjZVsxmzSB-tSXSs77ObrY) <loziniak (Maciej Łoziński)>:
* Exercism is now in a transition between v2 and v3. Current site is in maintenance mode, so I don't know if new tracks can be tested there. But there is also a test version of v3, and I hope it can be used to test fresh exercises. Athough, it's at dev/pre-alpha stage.

## 8-Mar-2021

[13:17:37](#HJn-XJq5Wyfr3SF4EwocOQCFCikzqDz_GBhs0g21FtI) <loziniak (Maciej Łoziński)>:
Hello. I created a summary page for Red: https://github.com/loziniak/red-1/blob/docs/docs/ABOUT.md
Let me know if there's something you would change.

[14:12:42](#qooEtaJxv2tG8i4WSMR_77xfSPCgFUKVi6tD9VfQ58k) <loziniak (Maciej Łoziński)>:
Also couple words about installation: https://github.com/loziniak/red-1/blob/docs/docs/INSTALLATION.md

[14:22:10](#8SF-XKBt8-ni4qX_lbq6osPCJqe6yalhQbYvI14JP7U) <loziniak (Maciej Łoziński)>:
Ah, and a code snippet: https://github.com/loziniak/red-1/blob/docs/docs/SNIPPET.txt

[14:52:51](#ewpRP6cueRyelSkWKV-JbMHg7xy4Y56xvLZGUCNhGtQ) <mxdpeep (Filip Oščádal)>:
I use this for automated Linux install/update: https://github.com/GSCloud/red_experiments/blob/master/bin/install_red.sh

[15:03:37](#ULIkia_hMx-fdTWJv7CUOZDs_hhNRxWBhXPwmSJrXHc) <loziniak (Maciej Łoziński)>:
Nice, thanks. I have to mention 32-bit libs!

[15:03:56](#KV4vodXTljgQMQZL7MR5j3TilzZIDkGMhZXl0-jPM8s) <loziniak (Maciej Łoziński)>:
And a lack of 64-bit support for newest macOS...

## 10-Mar-2021

[4:41:10](#XHgoPurdNI0EK7hrbL31ONqSsGI_cBAmCsIpH8hDSKs) <wallysilva (Wally)>:
Great job!������������������������������������

[5:11:46](#MmImfpy5di_Mfjq4mhEvgq0b9x2PwixQJNPNOSAqEJU) <greggirwin (Gregg Irwin)>:
Thanks @loziniak. Will try to catch up and review soon.

## 6-Apr-2021

[13:31:16](#4HuNiMehz40nM48ulBg7T9e_-Fp1hEJ4sMQWWdxy210) <loziniak (Maciej Łoziński)>:
I've written a [test runner for Exercism](https://github.com/exercism/red-test-runner). I'd appreciate a code review from Red point of view.

[13:36:02](#D-hcQuS5wuA3ua8-ZOOBxkLKOs8SEPNONuKrvYsiMTg) <loziniak (Maciej Łoziński)>:
Also – what's the requirement for a repo to be included in *progress.red-lang.org*? It'd be nice to see Exercism track changes there.

[14:58:53](#wdjaBCjkpGn5GdFEHBOICb7swPL5NJqOsCkTsIxWIIA) <greggirwin (Gregg Irwin)>:
Busy day here, but will try to review before long. I added @x8x here, as I agree that tracking Red on Exercism would be great for progress.red-lang.org.

[19:05:42](#PqceXzEQYSaceRyRo2d3tVjB7j232R43uI1mF-x25CE) <FLuX>:
@loziniak Add you repo [here](https://github.com/red/red/wiki/%5BLINKS%5D-Scripts-collection) to have it tracked on progress site.

[20:29:34](#Hbe6Utt-PLn7YyjSAi-VHafwGdZda-qtvDXOovNKt3I) <greggirwin (Gregg Irwin)>:
@loziniak 

- You can include a literal none in maps with construction syntax: `map: #(message: #[none])`
- Be sure to `copy/deep` on your map templates for series in them. And look at ticket #2167 for gotchas.
- I would break out the prin/print/probe override/reset into helpers, to keep the main loop clean. Also note that to be like `print` your replacement should return unset.
- Some of the naming is a little confusing on a quick read. e.g. in the loop there's `result`, `case-result`, then `case` that uses `case-result` checks in it. 
- Since you make files names at the top already, I'd do that for the results file too, rather than having an `arg/3` reference  way down there.

[22:01:15](#fd6lcE2YyOtLJqGordSzuI7bCrXGw3qHlenihPlxu3o) <loziniak (Maciej Łoziński)>:
Fantastic, thanks for feedback.

## 12-Apr-2021

[21:36:13](#YV2Bx4rHujKx2ap_5duvjV6-8R3WjBjzXO704J5zvlI) <loziniak (Maciej Łoziński)>:
Thanks, @greggirwin for review, I included all suggestions. Also, I have a [problem with isolating *runner*'s context](https://github.com/exercism/red-test-runner/issues/4), I don't have idea how to do it elegantly. Perhaps someone could help?

[21:36:32](#R0C_4QsL2yARi_foZkUDlTWmDWRc1Tnr4-OgH5dvM0s) <loziniak (Maciej Łoziński)>:
* Thanks, @greggirwin for review, I included all suggestions. Also, I have a problem with isolating *runner*'s context: https://github.com/exercism/red-test-runner/issues/4, I don't have idea how to do it elegantly. Perhaps someone could help?

[21:40:10](#ZB_p3xwYm2l05mUi1cxT99zzxVoA3G1bejKZ9rlxIrk) <loziniak (Maciej Łoziński)>:
* Thanks, @greggirwin for review, I included all suggestions: https://github.com/exercism/red-test-runner/pull/5 . Also, I have a problem with isolating *runner*'s context: https://github.com/exercism/red-test-runner/issues/4, I don't have idea how to do it elegantly. Perhaps someone could help?

[21:56:08](#U1Yq8LF2SgCJ6TGs5hWuAdyOxUHw9T0TZHJiyncCZKQ) <greggirwin (Gregg Irwin)>:
When executing arbitrary Red code, there's no easy answer. When `protect` is added that will help, and modules should be restrictable, but we don't have those yet. In this case a catch is that you want it in your environment for the `print...` redefinitions. You've probably already thought of the inelegant solution of loading and binding to a context created for the runner (with words you want to catch). 

[21:59:23](#pIhOBbOIykiGBlUXApEIA1vhcM1OA14KHN9skqPHRuo) <loziniak (Maciej Łoziński)>:
When executing arbitrary Red code, there's no easy answer. When `protect` is added that will help, and modules should be restrictable, but we don't have those yet. In this case a catch is that you want it in your environment for the `print...` redefinitions. You've probably already thought of the inelegant solution of loading and binding to a context created for the runner (with words you want to catch). 

[21:59:41](#4FZezZ0Q79w6TRjWmduSQ6VVCE4-pkguONHox9yHSTs) <loziniak (Maciej Łoziński)>:
more something like:
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

## 13-Apr-2021

[22:15:21](#DdxNUFfTXhHzzdiWjdRQfEFeyi_yeR5jUCmvLWjZzSk) <loziniak (Maciej Łoziński)>:
> loading and binding to a context created for the runner

To be honest - not. Rebinding contexts is still a little bit of magic for me. I'll try to investigate this and maybe learn something useful in the process.

[22:20:38](#Dx_vrZ3wwOZ5ezBKm4E3nAK_Sf65u8fuA1m0JazDVS0) <greggirwin (Gregg Irwin)>:
It *is* magic. :^) Partly because you can't see it, but also because we don't think of contexts as a thing that exists in natural language. So moving the same word around in contexts is an unnatural act.

## 14-Apr-2021

[4:16:34](#Zkb9oHbIjfLaAu8dZ_6GkuUYkJZ8daDraW6o5aOS-cY) <toomasv>:
How so? Context in natural language is ubiquitous. We don't think of it because it is literally everywhere and we switch contexts all the time naturally. But in Red context switching is more explicit and we don't have ambiguous contexts (except in our heads) as in NL.


[9:04:17](#WF8iQw5fnQl3Rz0lcQ54iQOZLKEv3fffSpYTk1N4WkE) <loziniak (Maciej Łoziński)>:
I think I've nailed it, even without using `bind`. Elegant enough for me, as long as it's correct:
https://github.com/exercism/red-test-runner/pull/6

[16:33:04](#vyTh6clCaNGF9BSXwSMn6ME2UdhAIt7Qw6ZbRzicZBY) <greggirwin (Gregg Irwin)>:
@toomasv what I mean is that you can't take a word out of one context in NL and put it in another, where the same word also exists in a different context. e.g. the old `spoon` example just becomes a madman's mantra. The "rock" example from @9214 strikes is different, and makes your point, so maybe there's a meta element here in contexts as data structures versus contexts as part of language. The structure of a sentence provides context in NL, but arbitrarily reassigning context without that "ordered, semantic container" leaves you in the dark about what a word's context might be.

[16:35:00](#pVA3vf0IdyfRzAxkPNT7wqgaRtXytitCTQJqMISJhNg) <toomasv>:
Ah, yes, now I understand what you mean.

[16:35:38](#uaJl7G9UUCbWGz8DSiDuH1Y6GbWijKLo5qQ5Q07YO2I) <greggirwin (Gregg Irwin)>:
* @toomasv what I mean is that you can't take a word out of one context in NL and put it in another, where the same word also exists in a different context. e.g. the old `spoon` example just becomes a madman's mantra. The "rock" example from @9214  is different, and makes your point, so maybe there's a meta element here in contexts as data structures versus contexts as part of language. The structure of a sentence provides context in NL, but arbitrarily reassigning context without that "ordered, semantic container" leaves you in the dark about what a word's context might be.

[16:38:22](#8IloOrgqdhJMooMhE5UHsBFJGv-W-h8nRGiddQBpek4) <greggirwin (Gregg Irwin)>:
Your word choice with "explicit" is interesting too, because we *can* write dialects that support implicit context changes, though they'd necessarily be more advanced than simple word matching. 

[16:47:46](#b0mwcfKnZw3ZAaFEI542vKlAqWiA-c33VyPDVsjXsn4) <greggirwin (Gregg Irwin)>:
@loziniak are there explicit ordering rules in test cases, so `last words-of ...` is guaranteed to produce what you want?

## 15-Apr-2021

[14:27:38](#nEMi7nWpfYMwaSYbY5UFvc2SEyfzvjIzvufWIoKdrrY) <loziniak (Maciej Łoziński)>:
Yes. It's up to exercise description to request/enforce a specific form, like a function in [hello-world exercise](https://github.com/exercism/red/blob/main/exercises/practice/hello-world/hello-world.red), where your task is only to modify existing code. A task can always be like "assign output to a word" or similar.

[14:29:11](#F-6XS34_ScdlizQeP20Uxe2hZwhOhbNDKTblFf8BeYc) <loziniak (Maciej Łoziński)>:
`last words-of ...` takes a value of last assignment in student's answer script.

[14:31:41](#JGhQt2avjsxaPZ6n4XQbXXMBGkLF_h6g87d3HLfI6Gg) <loziniak (Maciej Łoziński)>:
I realised though, that it only stops from overwriting *test-runner* context by *answer*, and still access to this context is possible, so it's just partially a success ������

[14:32:06](#OmpBravDLszaKTkMM2dxmSk1IuKGf8BDK6gXS4F5_Gk) <loziniak (Maciej Łoziński)>:
* I realised though, that my solution only stops from overwriting *test-runner* context by *answer*, and still access to this context is possible, so it's just partially a success :-/

[14:33:14](#APXYHtwf4LaWR9k4b61W0tCqRY8JQMHiaIsEDcQQz7Y) <loziniak (Maciej Łoziński)>:
* I realised though, that my solution only stops from overwriting *test-runner* context by *answer*, and still access to this context is possible (like `append output "something"`, so it's just partially a success :-/

[18:54:17](#7XaL2jakJlEhkUwRTbGlEjisam-W-Ra_E41NaHBt9l0) <greggirwin (Gregg Irwin)>:
You should be able to use a prototype object that contains the words you want to protect. But if you need access to those from the caller, you'll also have to use a path to the test runner. 

## 16-Apr-2021

[5:32:36](#WoLxIbQS_De4nad8r3DfEg8-V0ZGOaZIB8VgCE_TbVc) <loziniak (Maciej Łoziński)>:
Ah, so [my example from monday ↑↑](https://gitter.im/red/training?at=6074c2cc55d78266a63ed1e4) seems to be the only solution? I'd like to protect all words if possible. Code will be messy unfortunately with all the paths to *test-runner* context. Perhaps that could ne a good *WISH*? :-)

[8:21:20](#ycaS6OEiU3p8N-5eeH4XsjUrVBjSj8urnDPN-33Odrg) <loziniak (Maciej Łoziński)>:
At small scale I managed to come up with this:
```
>> context [a: "12" context bind [ append a "3"] system/words]
*** Script Error: a has no value
*** Where: append
*** Stack: context context  
```
but when I try to apply it to the test-runner script, I fail.

[9:14:47](#60wxzBrGJXVepsJJ_bKGl4BRMal3pPWOpn_PI8dH9DQ) <loziniak (Maciej Łoziński)>:
Ok, I made it! [there was a word name collision](https://github.com/exercism/red-test-runner/pull/6/commits/38518e1cfe036ce8213bca455ac7dfcc2b9d94cc#diff-d30f0556f01e449182531e3ad1f25c99829e22d8956a3c8bbd4c793fcecb2862R119) between *test-runner.red* and *test-runner-test.red*.

[19:41:29](#qYcFivXjhQ4jrN3Z1eYIeUaUspvKy3N2PYpJ-PBuWj0) <greggirwin (Gregg Irwin)>:
Glad you solved it. Be careful on the naming treadmill. %red-test-runner-runner-test.red may be next, and a palindrome to boot! :^)

## 23-Apr-2021

[9:22:42](#_L4fWb2nA9bnPqrGvUDIA_bdKf6S3uqkqctOcWZQ09w) <loziniak (Maciej Łoziński)>:
A nice article by Elm track maintainers on changes comming to Exercism:
https://hackmd.io/60gYIZYYS-6_l8kLH0QXAQ?view

[9:23:35](#-XId9v78FZ_wVjycl_Y4waKCk8YDaW7UAvhbiCF7rck) <loziniak (Maciej Łoziński)>:
* A nice article by Elm track maintainers on changes comming to Exercism:
https://hackmd.io/60gYIZYYS-6_l8kLH0QXAQ?view
Most applies also to [Red track](https://github.com/exercism/red/)

[9:23:45](#z166lo3r2BOFTpQbZ062WE1t_2HaIvPQR3sjtYCiQjY) <loziniak (Maciej Łoziński)>:
* A nice article by Elm track maintainers on changes comming to Exercism:
https://hackmd.io/60gYIZYYS-6_l8kLH0QXAQ?view
Most applies also to [Red track](https://github.com/exercism/red/).

[13:39:42](#OmF9_iWyc4xV2uPtDv4IGrXSJ8BiT-wC6RIiWU5lUXQ) <greggirwin (Gregg Irwin)>:
Thanks @loziniak. Will try to read later today.

## 11-Jun-2021

[11:47:57](#hTSSsX8XmFj8ezUzdQvHWqg_pBdFlf1d8dCx5WRSMlY) <loziniak (Maciej Łoziński)>:
Exercism moves to a ["phased" beta](https://exercism.lol/) stage, and here is the Red track for preview:
https://exercism.lol/tracks/red

[18:25:59](#L4SjwyjFhe16EvPdglH0GRMB2bX-xQtyoTl0m88Uu_E) <greggirwin (Gregg Irwin)>:
Nice! I will try to check it out in detail soon. If someone, like me perchance, were to help, maybe wordsmitting the intro to start, how best to contribute?

[22:10:02](#ByQ69tpKw1tAURtO_9T_rIocjkG01NzHLCz9U7N02CY) <loziniak (Maciej Łoziński)>:
Wordsmitting would be especially great, given my non-native English. Also general testing, proof-reading and review. Also, check ["contributing"](https://github.com/exercism/red/#contributing) section in readme.

[22:18:30](#SwTB4r_SIPuLI8OjzE0w8AJmhMUR-ID4ALMgku_J3Cc) <loziniak (Maciej Łoziński)>:
Also, as fresh *reducer* I may have not enough practice and insight to create exhaustive [concept](https://github.com/exercism/docs/blob/main/building/tracks/concepts.md) learning flow. Good example is in Elixir track: https://exercism.lol/tracks/elixir/concepts

[22:34:33](#fxIg7BwSj9hZ3t8A_LMrr0LaWEfQqRj9Ap6mXGFxP0Q) <greggirwin (Gregg Irwin)>:
Thanks. It's a great start. I just love to tinker with words. :^) @galenivanov might have some thoughts, as he's working on Python primers now.

## 6-Sep-2021

[1:51:26](#vA8DKc-3ApzXHYrsgfGa6AtrA-NJbSuI-H_R8AMSo8A) <loziniak (Maciej Łoziński)>:
Exercism v3 is alive:
https://exercism.org/
And Red is almost there :-)

[2:36:52](#bpG15rv0GmAU7dtA8nmqRElwuZvp44rRfDLSN_fqmjA) <greggirwin (Gregg Irwin)>:
Great! Thanks. 

[2:36:52](#yiEjUBwRlHA6-CJ-OZ925y_WmA9OWrvy5dpLWW0F7R8) <zentrog>:
Cool!

## 24-Sep-2021

[16:04:21](#nzi4TSI0A1wPRV4w8fzNm4gr4lWiUA5sI_qysSpn9H0) <loziniak (Maciej Łoziński)>:
Hello. If anyone wants to solve some exercises in Red, I'm working on preparing first 20 exercises batch for Exercism, and the most work there is to provide example solutions. Here is the list: https://github.com/exercism/red/issues/31#issuecomment-859965936

[16:07:45](#pOvG7mq9GUBCUefTxvxiH3Dr_D1C1bMX23PnEwO1rSk) <loziniak (Maciej Łoziński)>:
Anyone interested, just comment on this issue #31, or create separate issue.

## 2-Oct-2021

[21:48:45](#mdvgzOLViKCth-CfIkFV1OGIHcZznp7OZgLx0xj4uZs) <wallysilva (Wally)>:
Hi @loziniak, I would be happy to try a couple of simple ones

[21:53:17](#xk5S7hXRJ2gjoUr3L2e5edc_bLM0bNv9L3sJqITG32M) <wallysilva (Wally)>:
* Hi @loziniak, I would be happy to try a couple of simple ones. I will do the "Hello World" one later today.

## 3-Oct-2021

[1:34:04](#wIzJD0Y8Kw4PaoHdcF7ETFsJVPHTvDZoamx1mDCvuaM) <wallysilva (Wally)>:
@loziniak, I believe you can find some of the solutions in the Rosetta Code. For instance, the solution for the Roman Numerals problem: http://www.rosettacode.org/wiki/Roman_numerals/Decode#Red

[19:59:15](#06XD3Xy-kxSLDy-KeKNDafryhOdN4Rm-8rIYiOucOUw) <loziniak (Maciej Łoziński)>:
Oh, nice. Thanks.

## 20-Oct-2021

[18:46:57](#mPU_Rali3VO2IIooF3T870oSO4Jq4OnyMHUDOoBt21s) <zentrog>:
loziniak (Maciej Łoziński): I've been casually interested in Excercism for a while, but now that there is someone driving this effort, it feels like the little chunks are small enough that I can actually contribute. I really appreciate your effort on this!
I was thinking more about the exercise test runner, and the part which feels a little awkward to me is editing the file and knowing to change the `ignore-after` field. That and switching to use the example solution. What would you think about adding some optional arguments to the test script to specify how many tests to run, and a way to target the example solution?
I should probably look at some other language tracks to see how they are doing it, but that was just based on my impression. I haven't seen yet how this compares with a user of the track vs someone adding examples.

[23:59:38](#MdZmyhDDtr0T6fGnICj7fNsLxfQuL7jtuE5Q1FoGr0c) <loziniak (Maciej Łoziński)>:
Hi @zentrog:matrix.org . Thanks for contributions so far, the greatest of them is just being here and participating, so it doesn't feel being on my own anymore :-)
The test script is certainly not perfect, the main problem being the code repeated in every exercise and I don't have a clear idea how to get over it.
Editing the `ignore-after` value is a little awkward for me too, but it's just like this in every other track. Usually they use some testing framework, and all (except the 1st) test cases are manually bypassed ([csharp track example](https://github.com/exercism/csharp/blob/main/exercises/practice/darts/DartsTests.cs)). Personally, I'd just enable all tests by default, although I think I've read somewhere, that enabling tests one-by-one is a recommended practice in TDD. Having this as an optional argument is probably ok. Perhaps @iHiD would have a say here?
Switching to example solution is done only, when creating exercise. Final users "consume" the example just by copying it to main example file, which they then test.

## 21-Oct-2021

[0:10:35](#6yDb-uRHfPJZQ0I4aYd9EB4jd1Ko33nhDwgzzqDZ1eE) <zentrog>:
Oh, wow. Removing the Skips is way more cumbersome!
If it helps, I think what you have so far seems great. And the fact that the test scripts can be auto-generated means they could potentially be updated the same way. I don't think it is a high priority, but I thought I should mention it to see if you think it's something worth pursuing.
The idea I had was something simple like the first time you run the tests, it would give a hint like
```
red --cli darts-test.red
Running 1 of 13 tests...
<test results>
Run "darts-test.red 2" to run the next test
```
Then you just need to press <up> and change the number each time

[0:27:22](#a9W98Nd_LKfPf8_6ML6Mo_RuAWra3g6jX0C1tD3vnMo) <loziniak (Maciej Łoziński)>:
I'd probably go rather for the argument being a number of tests to run, than number of a test. Then user can easily fire all the tests at once. And if making test *n* pass would break any earlier tests, it will be evident.
Thanks for warm feedback. In fact, I thought also about automatic updates. Just didn't need it so far. And keeping custom changes intact (like for example adding few track-specific test cases) would need some thought.

[0:33:07](#JPBlFDJNuwbtXcVXUTahqtWFDbZ3ZOAT5EJ_kqvdaE8) <loziniak (Maciej Łoziński)>:
Btw now that I think about it, having an example solution just seems to be needed for unit-testing an exercise by CI/CD scripts, and not being copied by students :-)

[0:33:39](#DAHipL7JzONvq83ldAocucRLFJ09ZZdKj2JR7iPqYi0) <loziniak (Maciej Łoziński)>:
* Btw now that I think about it, having an example solution just seems to be needed for unit-testing an exercise tests by CI/CD scripts, and not being copied by students :-)

[0:34:00](#6gsWbHivMZ7adTaiADm0z3TaGn0ewmmAfbmFajM6ykA) <loziniak (Maciej Łoziński)>:
* Btw now that I think about it, having an example solution just seems to be needed for unit-testing exercise's tests by CI/CD scripts, and not being copied by students :-)

[0:56:06](#HkYqECOnv5_zcc8-BjGWhWTqgkEGnBl4USbdsyS5FpA) <zentrog>:
That's actually the way I was thinking about it as well - the number would just set ignore-after if it was present. The reason for that message is more to provide a hint as to what to do next, not explicitly describing the usage of the command

[0:57:20](#hCIwgZIzp5PYi-YFdKm0JXDZBIQ-wUNBXBQoENI3apM) <zentrog>:
That's quite interesting about the unit tests. It seems like it would need a way to run all the tests as well

[12:02:59](#Wes6K5W-lw_LZkJHSKs-JYN0lchS6cXKJk1LI0Kag-g) <loziniak (Maciej Łoziński)>:
There is some info on CI on Exercism, still a TODO on a Red track:
https://exercism.org/docs/building/tracks/ci

[18:23:24](#4HT1YnY2b13VSe2kyF3y8xN6RotGSxy0zU09enUSujs) <greggirwin (Gregg Irwin)>:
Thanks for jumping in @zentrog:matrix.org. I keep hoping to make time to dig into this, but my best laid plans...aren't. 

[18:43:28](#WFAAnkKqbRtBAuFKHm1doPreaw0_NspnoqKPJddvvsA) <zentrog>:
loziniak (Maciej Łoziński): Thanks for the link!
I found an interesting issue with the sgf-parser exercise, which is that the canonical data uses the property "parse", which makes the generated code use that name for the exercise stub function. That causes an obvious conflict with `parse`. The simple fix would be to just rename those to something that doesn't conflict. But it raises the question of whether there needs to be a mechanism to remap certain names, because it breaks the automation for that exercise.

[18:46:39](#6gTF7vQ5Xr3shMenqv7mNs8YQUMRvItG7rLUnramkpA) <zentrog>:
greggirwin (Gregg Irwin): I'm shocked that your plans are a bit overloaded ������

[18:47:58](#0YFHmSthmmxw912gnz0ZWkI1Rhefk3sg_WpubCY-t-k) <zentrog>:
 * greggirwin (Gregg Irwin): I'm shocked that your plans are a bit overloaded ������ (<- if it's hard to see what that is, it's the smirking/sly smile face, btw)

[18:50:44](#oH66A-CML_kTWck_JzR31CUIhicvwcIgNUW-4Rdi1-M) <greggirwin (Gregg Irwin)>:
I got it. ;^)

## 22-Oct-2021

[14:18:29](#_HGU_TWvVNqg0K1uvh_IuFY2_mmKnyJR_b7rP_6wAws) <loziniak (Maciej Łoziński)>:
something is cooking behind the stage as usual :-)

[14:23:22](#d6ZA_TWK4PP2fnwf2p_HJqbaSgs3Ne_XQkdw019fT7k) <loziniak (Maciej Łoziński)>:
@zentrog:matrix.org I think it's just fine to rename it, as currently we don't have exercise re-generation code. I think when we do, then we'll start to worry. I think there will be little cases like that, and we can deal with them by manually merging changes with git to preserve edits. If it will be too much work, then perhaps would be a good moment to start thinking about renaming in case of system/words conflict.

[17:09:41](#fRykzEmEo9h3fXS2viI1UImNdzlWBuC1FYQ0rITL-bk) <greggirwin (Gregg Irwin)>:
Coming soon. :^)

## 16-Nov-2021

[19:17:35](#L_Ee-TEDJKy2vG9JW8W_U5MsfmiX4zDW5skKZTEwh8M) <zentrog>:
Coming soon. :^)

## 12-Aug-2022

[10:10:01](#A2jQTqpKNN90gg3PnJY6wD0A9ti4M_1fDy-VbUsw5-I) <loziniak (Maciej Łoziński)>:
We have 20 exercises already on Exercism ready. I'll get our language track through release proess, and we're ready to go! So, now we need some mentors to check people's solutions and perhaps coach them a little :-)

https://exercism.org/mentoring

Anyone interested? I'll also do this for sure, but I'm not feeling super-knowledgeable about Red, so probably someone would be better for this task. I'll let you know here, when our track will be released.

I wonder how many people will start submitting exercises. Will we have a flood of curious developers, or just nobody will notice ������ 

[10:20:05](#9e1W_2swIMnioONvJ52SsJhcQC0-CiazOh2B1zm3dC0) <loziniak (Maciej Łoziński)>:
https://github.com/exercism/red/issues/31

## 15-Aug-2022

[16:20:07](#lSQzRJNfZyhG8aDjyQd8OkTz6XQSlx6685JLyQrjhs8) <endo64>:
������

## 18-Aug-2022

[9:43:15](#cygqku9UHeIaQ5wCBAEGDyk1EiUuo-sLgflYSySJqAE) <loziniak (Maciej Łoziński)>:
Please, give it a warm welcome!
https://exercism.org/tracks/red

[10:12:13](#nM7DbkfrRTlueLyoBX__lawy7RmBmr9mymiA_UzfwgA) <loziniak (Maciej Łoziński)>:
thanks @dander and @wallysilva for your involvement! anyway, it's just a beginning :-)

[12:03:55](#lGcpIDOy1JMRQDPiKN45DtyZxCU7kAo-s76lsNIKxFI) <dockimbel>:
Congrats! :+1:

[12:04:28](#P3fNtiH6dEGl7zqBl2kQcEcFj9guhrDcg5lZW_JN6z4) <dockimbel>:
This page is outdated: https://exercism.org/docs/tracks/red/installation

[12:36:52](#rzAx7PLA6IofOBwOqhlQiiW6hNaYYiMEgCYom-vlUJQ) <dockimbel>:
About the "Resistance Color" exercise, it's not clear from the instructions and template code (unless I missed it) if the color is passed as a string or a word. Is it part of the exercise to figure it out?

[16:13:00](#UWCOarPeGNB08oIOcuTYh0wf6uhwjuOCtNKmXFzjENk) <greggirwin (Gregg Irwin)>:
Thanks for continuing on this @loziniak.

[23:08:13](#MouIRJ3LBrV4MjwVe3f0ueQ8qyIdbfQtYS_zsGzl9m4) <zentrog>:
Yeah, great job getting this off the ground! It will be interesting to see what sort of engagement it will get

## 22-Aug-2022

[19:26:20](#X6FZGuPJp42F4x7xiyNSRI73nZaOpgddwZdondj-TjI) <zentrog>:
I didn't realize this before, but the Red Exercism exercises can be worked on tested, and submitted all right from the browser! I guess it just runs them through the cli console inside a docker container?

[20:33:46](#qptQXtjtHyD0eCHE3evisgVWBgOY_0AGINwVp6UazQE) <dockimbel>:
So far, I did all my exercices there online, I was surprised that it was supported. :+1: 

[20:33:56](#Z5VQgd4w3k3uoYpoteCMZkzac3Gjkt9UKURMFpo4IVU) <dockimbel>:
* So far, I did all my exercices there online, I was surprised to see that it was supported. :+1: 

## 2-Sep-2022

[5:25:24](#VBXSUmqCpymqRz5AcsRkvamsfFdTxUMRcn1aVoy448Y) <riprwwa (riprwwa)>:
@loziniak thank you for the exercises! A couple points:
1. It's not always obvious what format the results should be in. Example: I'm doing resistor-color-trio now, and it _seems_ to require a map, but I'm not entirely sure... initially I thought it was just a string
2. "How to debug" - it would be great if one could see the exact errors they were getting on that website, instead of copying code to and from their local console. Not sure how feasible this is, though.
Again, thank you for making these available!

[9:08:30](#4y3KfQEUv5KVB9Vc7PpSw-Y30yhmodmP_yC4fh-BQV4) <riprwwa (riprwwa)>:
I'm at "SGF Parsing". I must say, I got quite frustrated trying to write the largest product solution, as, again, it's not clear how errors are supposed to be presented. I tried initially to return an object with an "error" word inside, no luck. Using "cause-error" worked, but it's not obvious, nor user/beginner-friendly.
I guess if I want to be helpful I can submit some PR to this repo? https://github.com/exercism/red-test-runner

[9:51:54](#eRZvTeXsk-rOvXOIwYaLPTqjAl9EONLI8MA4gG4L1-M) <dockimbel>:
@riprwwa Thanks for the feedback. Please do submit some PR for improving the exercices. 

[23:52:31](#K3Ql7Mx0wQbW6HmOb3AsBqTTn5kfb-1j0zGUaRDwQOw) <zentrog>:
I’ve been a bit unclear in general on best practices for error handling. I tend to prefer `do make error! “Error message”` right now over `cause-error`, but I would like an easier way of doing it.

[23:53:32](#ZkvhYmmAyB-guQIzRGWQJfNGMnZ7wDiMNk7cn_eABm4) <zentrog>:
We could add some more explanation about what is expected in some exercises too 

## 4-Sep-2022

[14:00:37](#H2HE7xeUG1xJ7na1KSlU950N1K7fsfvcLPjjx-T39PM) <loziniak (Maciej Łoziński)>:
@riprwwa main repo for Red track is this: https://github.com/exercism/red , and *red-test-runner* is just a piece of track tooling. Thanks for great feedback! I'll try to address all the issues soon, and you can also try if you want :-)

## 18-Dec-2022

[20:56:48](#BiYYuGlhjSmoSDvMqCrLfWYnus2bHiPAtPwVMpWd1x4) <loziniak (Maciej Łoziński)>:
80 students, 743 solutions until now on Red Exercism track!
https://exercism.org/tracks/red/build

[23:00:12](#stw2dfTJLQfjew3ezl_kR_CG7kg-0rYvhrK4N9pzXTs) <greggirwin (Gregg Irwin)>:
:+1:

## 19-Dec-2022

[21:28:58](#9b2zPpzbqCuKkVA3ZKUO7_-cxNESzbQrE4SM759JL4o) <zentrog>:
Have people been submitting requests for mentorship? I haven’t delved into that area in so far

## 21-Dec-2022

[17:09:08](#iGhXY6NPMEXrvl6mduyirgv6SpgrHWp7gVOTn7iey0E) <loziniak (Maciej Łoziński)>:
On the Build page there are only 2 sessions listed. I did not see any mentoring requests beyond these.

[17:16:05](#ctGujGChhCpeNc4p5k_AXgS09xHCAh79L6UUnbY0CHk) <hiiamboris (NOT THIS ONE)>:
I think I applied to mentor there before, but didn't get any emails so far. I have to admit though, whole exercism website looks completely opaque to me. I just don't get it.

[17:18:21](#7G-kkD69vFt2KYSSKNruoa2XBlbw4sV4e808d4ixSA0) <hiiamboris (NOT THIS ONE)>:
If I was their boss I would fire whole UX team right away.

## 22-Dec-2022

[2:32:04](#saavXcRg7-4wmlWrGl9sRJkoj6oru3sllO-pxjVsBoA) <riprwwa (riprwwa)>:
Maciej and I had 2 mentoring discussions, they might be those 2 listed on the build page? :) (thanks, Maciej!)

## 24-Dec-2022

[0:05:50](#0qrR40ug_IzWhec4Ty92kJ8DYuzrmGcyZ6Ip8t6U3uI) <loziniak (Maciej Łoziński)>:
It was empowering, thanks too! :-)

[11:36:11](#CoHm5LhGEtIzrACOJ943-clsTzxV7csU9F6_5wGCL44) <loziniak (Maciej Łoziński)>:
@hiiamboris 
> If I was their boss I would fire whole UX team right away.

file a bug! :-)

[12:06:46](#zNNAaNQWdkzV-IG1tnjjyepKljcuFXCWYIRGGBzjC1U) <hiiamboris (NOT THIS ONE)>:
(: I feel like these worst UX of the year competitors spawn every day, but I'm just one person.

[12:07:08](#iczkI2pojloAo9X2Z6J3ba2__tpnLmWPnLwrEbsRC44) <hiiamboris (NOT THIS ONE)>:
Latest competitor: Mysterium VPN.

[12:11:16](#RagYFNh398fpkp_LLkcrQf2GelC7VEwJZLeyUAMFE4s) <loziniak (Maciej Łoziński)>:
I feel UX is often a matter of fashion, not science.

[13:15:41](#SouNTYgIuiLepUMjtSaDkQYdIeeN_mPWXj9zDebkJgE) <hiiamboris (NOT THIS ONE)>:
Unfortunately...

## 25-Feb-2023

[11:43:38](#HvI6WxB215v49KxuHBfXx1JKtQhMCZi5bMrfA1plHjM) <toomasv>:
������ All exercises done ������ Great work loziniak (Maciej Łoziński) ("Simple Linked List" seems unfinished?)

## 13-Apr-2023

[7:22:31](#6tzyduQv8HF6HSAFKq628fDHHYIV9wdAEc-FTV_34yY) <loziniak (Maciej Łoziński)>:
I'm glad! Thanks for trying it. Can you make issues on GitHub regarding Simple Linked List? I tried to make it as finished as possible, I could have missed some general Exercism changes that broke it.

[7:22:58](#xiBGX_SwK26PZHlLh1n6GYNZVp57eC7CrPLW_JpgZvo) <loziniak (Maciej Łoziński)>:
 * I'm glad! Thanks toomasv for trying it. Can you make issues on GitHub regarding Simple Linked List? I tried to make it as finished as possible, I could have missed some general Exercism changes that broke it.

## 9-May-2023

[19:36:22](#B4nqjh6Az0wTm2HarmMDICX_VepkyamP0hYum3Bg4Yg) <zentrog>:
Exercism is featuring Red during their [Mindshifting May](https://exercism.org/blog/mindshifting-may) event. They are also looking for people to do a live-streaming session on their [Twitch channel](https://www.twitch.tv/exercismlive) if anyone is interested in doing that.

## 10-May-2023

[4:59:38](#VWsPsNqJFzd5AHFar7UFIEzRK8pcKgixMnPnua-eiDo) <greggirwin (Gregg Irwin)>:
I only twitch in real life, but that's very cool! Thanks for the note zentrog !

## 12-May-2023

[11:23:28](#_SqGvgqNg09rRSdr_dHIiMvOhXOgyZfI37lUHBPxQV4) <loziniak (Maciej Łoziński)>:
I only twitch in real life, but that's very cool! Thanks for the note zentrog !

[11:27:10](#tpY-mTSqkuF-8D9ryffBsl5-seVdj81ek-FohOytTjE) <loziniak (Maciej Łoziński)>:
zentrog: will you stream?

[16:55:22](#GWR-Sxxxlug2x0DPP5qnK2mzqCMFPHPfzXlJEYdzPRE) <zentrog>:
loziniak (Maciej Łoziński): I had been considering it, but I'm already feeling pretty stressed lately, and didn't want to add another thing to be thinking about. Are you planning on doing one?

## 13-May-2023

[9:36:44](#F68olM1HwzG5ghT7tlqMeNZXiXC9m9SQtnZRo60KWbw) <loziniak (Maciej Łoziński)>:
Yes, I think I'll try :-)

[19:25:04](#ithLrReoaQtRPLRxPY35sO7SLSVWYnU9ICaZzwg1m9g) <zentrog>:
That’s great! Will you post when your time slot is?

## 16-May-2023

[13:16:11](#Qv7Ho2Sn0AUa-Q_1d3TIMORsJpJ7J77BYAGTd03rGAI) <loziniak (Maciej Łoziński)>:
Sure, but I still didn't get a response from Exercism team.

## 20-Jun-2023

[18:24:30](#wRLA9zpqxB7sY4lSXMuOWciDLydN_qc_eGvyYHqu9g4) <loziniak (Maciej Łoziński)>:
Hi, there are 3 solutions waiting in Exercism inbox. Perhaps someone wants to have a look and share some suggestions?
https://exercism.org/mentoring/queue (you may need to select Red from mentored languages list if you never mentored on Exercism before)

[18:25:08](#WZfEMKyefNidPru5ShU3qczj_reaccl_B2_1AwWlYY4) <loziniak (Maciej Łoziński)>:
 * Hi, there are 3 solutions waiting in Exercism mentoring queue. Perhaps someone wants to have a look and share some suggestions?
https://exercism.org/mentoring/queue (you may need to select Red from mentored languages list if you never mentored on Exercism before)

[18:30:08](#t-g5EgQ0S2kbx4nrQLxgGN0n5Wpiymu5M7kP7F57nZk) <loziniak (Maciej Łoziński)>:
These are more advanced ones, two of them using `parse`. One for *sgf-parsing* exercise done by you,dander (Dave Andersen) , perhaps you want to take a look?

[18:50:05](#YtAT8fSPXa-ziQ2PV2J86Yy96Ykt9OvTQLTCm2HAVf0) <hiiamboris>:
OK I commented the smaller one, left others to more involved dudes :)

[19:14:02](#kDlClZkd3tbvMNqYFymu5t3sRiyos4mVGsC-L9VwW3E) <greggirwin (Gregg Irwin)>:
Guess I need to build some rep there before mentoring.

## 21-Jun-2023

[11:51:26](#JYIqPRxXsx6PtRjA5R_-4BmQg_B2srzNl1KK2Cm5CNQ) <hiiamboris>:
Funny, Exercism adds trackers into the urls in its emails. And I thought of them as a small business. Apparently not so..

## 30-Jun-2023

[20:59:32](#chl_9z0xJn2vbfAvjXRTdbWCxoneo9dPkBD7FX2Jdc8) <loziniak (Maciej Łoziński)>:
Wow, great!

## 8-Nov-2023

[11:03:49](#lHIPJaUVDkMdZWlrNSfOHb6AoTdmc1f2njbKWHZ9J2w) <loziniak (Maciej Łoziński)>:
> <@hiiamboris:tchncs.de> Funny, Exercism adds trackers into the urls in its emails. And I thought of them as a small business. Apparently not so..

With almost 2 million student's it's hard to say it's a small business :-)
https://exercism.org/about/impact

[11:06:05](#V0oMtmCbSYv7lJsQ3VrIT1yOSBh2mGlyBbh56psk1vU) <hiiamboris>:
well, with 6 full-time staff as they say... and who knows how they count these other numbers

[11:11:19](#625psmpY6HG1zI0d8Sd61K5jz0mMHNd5hbvyokj3XVQ) <hiiamboris>:
total $100k donated in 2 years - it's like what? 2 months of teams salary? if these numbers are to be trusted, their data trading income must be like 10x bigger

[11:15:25](#KTvmbA7l4khCSZe4-xtmY0YhLVpVgxWHi2br_0y5PIM) <hiiamboris>:
maybe not so full-time :)

[11:15:50](#btT_P6B0-e-weDTa5QA6lKRXCQIuOBjmFwmTmA1J49g) <loziniak (Maciej Łoziński)>:
Maybe they have some other sources like grants... or just earn less than 8k per month..

[11:56:42](#qOatOfLIA4NhAVHUeJjWAzdYSCb6BuFJqum9scPOKgU) <loziniak (Maciej Łoziński)>:
> <@greggirwin-55659ddb15522ed4b3e1006f:gitter.im> Guess I need to build some rep there before mentoring.

I had an impression, that everybody can mentor. There's no info, that there are any requirements. Do you have any error message, or just can't access mentoring page?

[19:26:07](#SrI-8vVm_kS3QNh6xBvo4vkAGfDiRuY_eD3Jf08_des) <greggirwin (Gregg Irwin)>:
I'd have to check again. I think it stopped me.

## 10-Jul-2024

[6:26:59](#_eFs5qoRRF0AtXHy23aHD4qTpQxJvYjV77NN9G07_zc) <riprwwa (riprwwa)>:
a couple of points about exercism
- one needs at least 20XP to mentor

[6:31:00](#Y_ZT_8HXLurfq9NQla1_PRRGVf2QA-sVqTh2BWciSbU) <riprwwa (riprwwa)>:
 * a couple of points about exercism

- one needs at least 20XP to mentor
- some exercises are frustrating :( "high scores" is rather vague in requirements: there is a block coming in as param of all functions, yet some are expected to modify it. Looking at "latest score after personal top scores" - there's a block of scores (oddly enough already sorted high to low), then personal-top-three is called with that block of scores, then somehow that block is modified and "20" is removed, leaving "30" to be the returned result?

[6:33:12](#A9-o9PLF8S1unjdVVnv_R0fV96HvGajyFp1k21qLWXU) <riprwwa (riprwwa)>:
I will always appreciate the effort put into Red, by builders and all the people working on it, just so people don't think I'm ungrateful :)

[9:35:55](#KxwX1Eguka6C4jGjdte-6rxy0Nry_bz_PpYQdf79qLg) <riprwwa (riprwwa)>:
I'm giving up on Exercism, I find it too frustrating... Take "High Scores" - the [sample C# implementation](https://github.com/exercism/csharp/blob/main/exercises/practice/high-scores/.meta/Example.cs) seems straightforward enough, pretty much what I'd do. [The Ruby sample](https://github.com/exercism/ruby/blob/main/exercises/practice/high-scores/.meta/example.rb) - same. 
Looking at the requirements, though... 
"Scores after personal top scores" takes [30, 50, 20, 70] and returns the same numbers, in the same order? was there any processing expected on that list? hard to tell..
"Latest score after personal best" takes a list of scores and returns the last item - same question, was there anything at all expected to happen there?
"Scores after personal best" takes 5 element list and returns it (or a copy, maybe), unchanged.

I've never played the classic game Frogger, surely that's why I'm not getting this.

[I'd forked the repo](https://github.com/riprwwa/exercism-red/) thinking I could help make it better and give back to the community, but now I remember struggling through a few other problems before, not understanding the requirements, the expectations of the solution... the Simple Game Parser was one. And a few other bits are puzzling, like repeating the test lib in every exercise? I mean, making some changes to Red's track might actually hinder it, if it makes it different from the cannonical...

/rant, sorry, got carried away

## 3-Sep-2024

[2:15:52](#iDmBHeMvJVjv3EtqrP5Imfjx1OjnJIxh_h69DxBnlEQ) <BNAndras (BNAndras)>:
> <@riprwwa-6135cb2c6da037398484de3e:gitter.im> I'm giving up on Exercism, I find it too frustrating... Take "High Scores" - the [sample C# implementation](https://github.com/exercism/csharp/blob/main/exercises/practice/high-scores/.meta/Example.cs) seems straightforward enough, pretty much what I'd do. [The Ruby sample](https://github.com/exercism/ruby/blob/main/exercises/practice/high-scores/.meta/example.rb) - same. 
> Looking at the requirements, though... 
> "Scores after personal top scores" takes [30, 50, 20, 70] and returns the same numbers, in the same order? was there any processing expected on that list? hard to tell..
> "Latest score after personal best" takes a list of scores and returns the last item - same question, was there anything at all expected to happen there?
> "Scores after personal best" takes 5 element list and returns it (or a copy, maybe), unchanged.
> 
> I've never played the classic game Frogger, surely that's why I'm not getting this.
> 
> [I'd forked the repo](https://github.com/riprwwa/exercism-red/) thinking I could help make it better and give back to the community, but now I remember struggling through a few other problems before, not understanding the requirements, the expectations of the solution... the Simple Game Parser was one. And a few other bits are puzzling, like repeating the test lib in every exercise? I mean, making some changes to Red's track might actually hinder it, if it makes it different from the cannonical...
> 
> /rant, sorry, got carried away

Practice exercises (what the Red track has) have canonical test data and docs sourced from an upstream problem-specifications repo that all Exercism tracks can use. Each `X after Y` test is checking immutability for tracks where that might be a concern. Personal top score shouldn't affect the scores being looked at.   Getting the personal best shouldn't change the latest score and so on. However, the way the Red test suite is set up, we can only test one function per canonical case so those tests shouldn't have been included. I'll go ahead and mark them as not included and update the test suite.

[2:19:07](#0QiENl-KQlol1idInDof7C5eOP01dNT7HZ6QPPsagQQ) <BNAndras (BNAndras)>:
Changes like Red-specific tests can certainly be discussed for specific exercises. The test library needs to be in each exercise by design because there's no built-in test framework for Red like in some of the other tracks. Students should have everything they need to run the test suite for each exercise.

[2:27:45](#AaUU0Z2nRnQiOKGNVjjx9yvzuAjWQjgtw88vJMAM7gg) <BNAndras (BNAndras)>:
 * Practice exercises (what the Red track has) have canonical test data and docs sourced from an upstream problem-specifications repo that all Exercism tracks can use. Each `X after Y` test is checking immutability for tracks where that might be a concern. Personal top score shouldn't affect the scores being looked at.   Getting the personal best shouldn't change the latest score and so on. However, the way the Red test suite is set up, we can only test one function per canonical case so those tests might not be appropriate. I'll take a look tonight.

