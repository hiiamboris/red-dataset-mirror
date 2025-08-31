# Archived messages from: https://app.gitter.im/#/room/#red_red.js:gitter.im (https://app.gitter.im/#/room/!DeAPnTriRVWboJgoNA:gitter.im)

## 1-Dec-2020

[19:57:29](#DNxT5kApx_00-dmU9v1xEKzYtFTk8ni2XLLLpaI2iuA) <ALANVF (theangryepicbanana)>:
yay more things

[22:47:00](#bl0BFxHGvkaboIwh4u7PRYzcfqGRlfAo7fPth6mFjwI) <ALANVF (theangryepicbanana)>:
hey does anyone know how/where `self` is stored in objects?

[22:47:09](#i_HLVRZozaUsHWtkbkfJ3phTvwIsgkC8ZXx3ykKZMkQ) <greggirwin (Gregg Irwin)>:
Nice! With so many details and features, you really have your work cut out for you.

[22:51:25](#AD-ak2VSkB1swYu-D0w62ATMnRBs_MVvt_QHLTA5L98) <greggirwin (Gregg Irwin)>:
Check out `save-self-object` in %object.reds.

[22:51:43](#8Ltp_KlKVGP5y58QQPWa0K2DV2gqt0Ddan8ijfj1rwY) <ALANVF (theangryepicbanana)>:
cool thanks

[22:52:12](#w6AWOP7F3zcWTgDOKv__iMpBKrmvBsVOnMPJ7wxT-Qo) <ALANVF (theangryepicbanana)>:
I'm trying to figure out whether or not it's stored in the object's symbol table to prevent bugs that I may or may not have just run into

[22:52:17](#RnL_VYFXln8_WXH3Tc7KoxUaNTGoD9lWnRVd-1vJuak) <ALANVF (theangryepicbanana)>:
* I'm trying to figure out whether or not it's supposed to be stored in the object's symbol table to prevent bugs that I may or may not have just run into

[22:53:03](#jQmecU-PF10ctXPYqabq3_JGgRVvFWalXedu6WuWqfM) <greggirwin (Gregg Irwin)>:
It's a special hidden cell.

[22:53:16](#8daTtr9C0emdbcDekaOb6w_lYPNgXn2w3Li7OeXEwAw) <ALANVF (theangryepicbanana)>:
hmm ok then

[22:53:30](#9Q2O0D5m4IDRRYBgpjIxi8NdeRuEi0l84eVqMhxQ-ks) <ALANVF (theangryepicbanana)>:
that shouldn't be too hard to implement I don't think

[22:54:18](#gx-1s_uPPSCC8Ksk4rCXqA1TQygA3QpgZteMlT6ZNRU) <ALANVF (theangryepicbanana)>:
because I was implementing `get` and `set` and was accidentally changing the `self` value of objects because it's the first entry in their lookup tables

[22:56:15](#XFNS2pBb2bpmP4E0aZJI6dDztlV-E-aVp37_tewnnEE) <greggirwin (Gregg Irwin)>:
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
```

[22:57:58](#2SCWak_LnK_g4rxdeLZhkKl3HJYOIqGiLvt1ff9YJrY) <greggirwin (Gregg Irwin)>:
* ```
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

[22:59:24](#uaG13DENv7QaaXE9eXrG74smAHdiMlAAaP5-iy6HPcM) <ALANVF (theangryepicbanana)>:
ah gotcha

## 2-Dec-2020

[10:08:03](#EKtJll-tSKf3HjPho1oPp7e_QoCb9DIUn1atf5Mp3UU) <giesse (Gabriele Santilli)>:
that's different from R2 though...
```
>> o: make object! [a: 1]
>> o/self
>> in o 'self
== self
```

[17:04:27](#Z4rz8MkeLLlACbRgb0z6nSHv6-S_zfxp6Ml-xc5pcFE) <greggirwin (Gregg Irwin)>:
Indeed.

[17:04:58](#cnhP1NxvGIcFkMMvRzQHcxeC7EL6kNKrnmpyynqk-R0) <greggirwin (Gregg Irwin)>:
* Indeed. The change was made in R3. 

## 13-Dec-2020

[11:28:08](#YKVmq26Qxm25CSvg_9zV7Z-_XDeVbLlI40dv5w1ze1A) <Numeross__twitter (Lop)>:
Is there some not too hard work I could help with ?

[14:36:58](#_n7rJTYo6fuTGkk3XOBj6ONYygJg1qdDsGHrMRR4W2c) <ALANVF (theangryepicbanana)>:
@Numeross__twitter Yeah if you're familiar enough with Haxe, maybe you could try implementing the form/mold actions? Or if that's too hard (since there aren't many docs lol), maybe trybadding `date!` or `raw-string!` rules to the tokenizer?

[14:37:26](#9qgQ6pwjv6hzcEu7sUm_8AmNiYXr07nkbmJSLIERIYc) <ALANVF (theangryepicbanana)>:
(`raw-string!` would probably be the easiest though)

[14:37:39](#tIFbcUFQfcve6eET-jrloDQBBzwTXZiDtFUwVmqUiJM) <ALANVF (theangryepicbanana)>:
thanks btw!

## 1-Jan-2021

[22:37:12](#Zzw4mJNZJqTg8srx6a5nH_02n_o1bMCmyNmkJzz8ZSA) <GaryMiller (GaryMiller)>:
Merry Christmas and Happy New Year!   Any Red,js predictions/resolutions for 2021?

## 2-Jan-2021

[21:12:45](#gjFt8RKNUsNiWNKXgzNXp2WauBms0HvCWgzwvvpySXw) <ALANVF (theangryepicbanana)>:
@GaryMiller I'm hoping to finish the transition from TS to Haxe for Red.js this year (i.e getting back to where I was at in the original version)

## 3-Jan-2021

[5:04:30](#-O82HMoz3TM0PJKm6pxo3554BfXdcoaiqAZyLpT5na0) <GaryMiller (GaryMiller)>:
Will be great to see. Realize you are aiming at a moving target!  But its great to see that you're sticking with it!

## 21-Jan-2021

[20:33:28](#N42ypKWCey5junp_GW5PmBUbVcaZruazkDwJFeFc1AI) <ALANVF (theangryepicbanana)>:
so whenever I get to implementing Parse, I had the idea of maybe compiling Parse rules to WebAssembly or something similar

[20:33:49](#vyvVdSjBImTsvNI0zIWw3eRQ7YGZTuJyy0PLmetT4ho) <ALANVF (theangryepicbanana)>:
is Parse currently compiled, or is it still interpreted?

[20:55:18](#663F7TdOqhIx5uDRJqnKtMeaFQ92ocZ-SRYpWRP6CR8) <greggirwin (Gregg Irwin)>:
`Parse` is written in R/S and is compiled.

## 22-Jan-2021

[1:39:51](#nUza25fyv9YrlQ5yuJKih5YW2DPVE3UYgHQdhKIyOqk) <ALANVF (theangryepicbanana)>:
ah oh, thanks :thumbsup: 

[15:07:54](#9MrXZA-cOLL2az9SgggVXbrRSxF3wLkAHefR6vOWk9I) <giesse (Gabriele Santilli)>:
is the question, are rules compiled then executed? if so, they are not, `parse` is an interpreter. compilation would break some usage.

[15:08:18](#kcM_bAap8r3Gno0fsBxCf0ijcjpLN0BjRQgIu3-6H98) <giesse (Gabriele Santilli)>:
what @greggirwin means is that the interpreter is written in Red/System

[15:09:34](#YTKeYahDiDeeYnY2GKWF9XGhZOG5ZTfcpY4014X827E) <giesse (Gabriele Santilli)>:
`topaz-parse` uses a compiler if that's useful to look at.

[15:13:04](#hkIC_3OmdFDaLpaV8a9ap-eVN5Snr_ETRVz6iI2j6Zk) <giesse (Gabriele Santilli)>:
eg. this: https://github.com/giesse/red-topaz-parse/blob/master/parse-parse.red
gets compiled to this: https://gist.github.com/giesse/f18230b8f097a2fb43a46684638737aa

[17:21:31](#3dAP2yqViKMZZdKIlOObizmMoTH4jtXEjHzG8DJW6Xk) <greggirwin (Gregg Irwin)>:
Excellent point @giesse. I should have thought a little more before posting.

[20:05:44](#IaUOcHECkEz1nKj4R62-tFR2-R2sZnT24xGELK0Siss) <ALANVF (theangryepicbanana)>:
@giesse oh ok, still helpful though

[20:07:02](#3QOgLqiCBmiP6ZTwE0ry5_Kv9DOdBx1T3lHkLQYWbLs) <ALANVF (theangryepicbanana)>:
* @giesse oh ok, that's still helpful though

## 11-Feb-2021

[22:14:45](#38P7GBagOroRWmjlNB8eIelFeNtK7ypyvrgeIAmwKr0) <ALANVF (theangryepicbanana)>:
update: Haxe 4.2 has come out so I'm not transitioning to that

## 14-Feb-2021

[3:52:01](#u3RZfK-dy06w3yy-THCLcP4wbOwaaNjW2y_agclFS0k) <ALANVF (theangryepicbanana)>:
OOPS I meant to say "now" not "not" LMAO

[8:25:54](#NsGJDxdDtO5OmWM45ZjDGV7XFxEfoCQVeSFPvD_A9CA) <GiuseppeChillemi (GiuseppeChillemi)>:
I have thought, is HAXE so incompatible that @ALANVF will remain to a lower version?

[8:26:00](#IXDmjbGJ6cve6sV5sPJ-FA3WwbXqP7ZJQFGnfnF9AIs) <GiuseppeChillemi (GiuseppeChillemi)>:
:-))))))

## 19-Feb-2021

[18:14:31](#6qOYN0Vq08wr7QVOhV6gRBI9dwh3XpCi1MouqzN5mdU) <ALANVF (theangryepicbanana)>:
FINALLY GOT IT WORKING WITH HAXE 4.2 OMG

[18:14:42](#_5T7cv6-3ZFlcweV0sdyCN2jc0jppSnSH-gxCXi8HGw) <ALANVF (theangryepicbanana)>:
that took way too long

[18:24:49](#rjU6yvTuQl8GJgLpz27r9KEYNVHlFRe-Y7-KtrSk9pQ) <toomasv>:
:+1: Congratulations!

[18:25:07](#nf5urSxuZIFNlC14CYRK0kGPlfntw9dFeLRbjtdf0MI) <ALANVF (theangryepicbanana)>:
thank you!

[18:25:29](#OsWLPlIfxEthEENq5gTvwgZi3OpRRFTdysa6p_3d42o) <ALANVF (theangryepicbanana)>:
(this is what I've been doing for the past several weeks btw lol)

[18:25:54](#yGibP8dz3KIY4WhFWi5CoAJrAgLOmp0ExkJpGDCXLL8) <ALANVF (theangryepicbanana)>:
now we can hopefully have regular updates to red.js again

[18:26:26](#5oTAC9jlGqejA5nM1DuimWi6j-XHxfbBeKPQxOHdk54) <ALANVF (theangryepicbanana)>:
* hopefully we can now have regular updates to red.js again

[18:37:33](#OW625fVP5SognH1fpKsYmyI0NKj-5vdUc_DJi0qW8oU) <greggirwin (Gregg Irwin)>:
Updates to our tools, when things change, is one of the most painful things to deal with. Everything's working and then...months later...everything's working again. 

[18:37:46](#DhSsVROXRgP-rzWzP4BJ5Buio3QXRkZW2QniY3abPcg) <greggirwin (Gregg Irwin)>:
Glad you got through it. 

[18:38:41](#ENEKYOL_KP8LZmJcsYq2iPrqPAdgb6FHATPFwZIs3Yg) <ALANVF (theangryepicbanana)>:
yeah it wasn't the most pleasant thing to deal with, but it should make a lot of things much easier to work with now

[19:42:48](#_qA1DtRjiqDeQ2keLKwgZjXhhs8Przex5JYNpxGCEwo) <greggirwin (Gregg Irwin)>:
What were the biggest pain points? We try not to break things, but know what's hardest for users from a real world case like this is something we can learn from.

## 20-Feb-2021

[15:02:03](#gjujKyJGhO4Rnt5ElmOT0Sj-L8GhEkehrttdpb2y9-M) <GiuseppeChillemi (GiuseppeChillemi)>:
Nice question, I would like to see which difficulties you have encountered.

[16:09:43](#3Ql7pYWb14dBwYkwYxjSP1Yu5d9BEUqquWLjuAfbIK0) <ALANVF (theangryepicbanana)>:
@greggirwin A decent amount of it was just trying to work around Haxe's weird quirks, but a lot of it was mainly caused by not wanting to revisit (bad) old code

[16:10:43](#pbRA9k5pPmvh5klfs5chiOSE8ddAu4pzP_NtzmamBl4) <ALANVF (theangryepicbanana)>:
Red thankfully doesn't have as many issues as Haxe, but I'm sure that there's still some old code that should probably be revisited at some point in Red's codebase

[16:11:07](#1knpoeksOLCHIRUKilPIUusQEdc18REzvUuXe5qTU8c) <ALANVF (theangryepicbanana)>:
* Red thankfully doesn't have as many issues as Haxe, but I'm sure that there's still some old code that should probably be revisited at some point in Red's codebase (especially in R/S)

[16:12:28](#t4vwmn38N-sYo_ePr80rzKEaVgIs8ZiOr6qeFV61mSg) <ALANVF (theangryepicbanana)>:
* Red thankfully doesn't have as many issues here as Haxe does, but I'm sure that there's still some old code that should probably be revisited at some point in Red's codebase (especially in R/S)

## 21-Feb-2021

[23:54:05](#hdewDbWTQ75zx5sj248ItV6a432IaXWRSACf3BAV3RM) <GaryMiller (GaryMiller)>:
:+1: Congratulations! Keep up the good work!  Hopefully future Haxe releases will be more backward compatible.

## 22-Feb-2021

[1:34:26](#kDPZoIAXFE_DSTMdeGzlF180Z1Y7RmA9jl10mZShkcg) <ALANVF (theangryepicbanana)>:
ye

## 27-Feb-2021

[20:38:43](#i1FjbVgdHGtbLxVz5K9tA31MZ3l4Gu4qIqaEEN-X8m8) <GaryMiller (GaryMiller)>:
Just saw this and wondered if it would be synergistic with red.js under Haxe  with the graphics, UI and compression libraries...   https://hashlink.haxe.org/

## 6-Mar-2021

[2:45:41](#f9ZseBb0QYQ_bc6X8ceT1ynfPm0SfwV31UTbyQjM3kg) <ALANVF (theangryepicbanana)>:
@GaryMiller as cool as it seems, I'd say probably not. I currently have a lot of code that's optimized/written for Haxe's JS backend, so that wouldn't easily transition over to Hashlink very well without using a custom fork (which would not be convenient for others). I am also using Hashlink for another project of mine (my programming language [Star](https://github.com/ALANVF/star)), and it seems to be a lot more annoying/boilerplate-y than JS, at least in Red.js' case

## 17-Apr-2021

[16:37:52](#KvUKLrhbSssPt25WKpJso6v1P-pyb1NZFTK_nv0H1yc) <ALANVF (theangryepicbanana)>:
update: dealing with end-of-year stuff for school rn. once that's over with, I'll be able to work on this more regularly

[16:41:27](#KstPbOZew-JNcq4q54OwmDl7TKX6h2Ek-XmZUiyyk1I) <ALANVF (theangryepicbanana)>:
* update: dealing with end-of-year stuff for school rn. once that's over with, I'll be able to work on red.js more regularly

[16:48:25](#uiuyxnAlfLG1xbWmPXoM6eKfQD5rrGGDBdV9gE16qvY) <greggirwin (Gregg Irwin)>:
Thanks for the update!

## 18-Apr-2021

[4:10:17](#_GjEAxdTL_-jrvaN-Phw7ZVHflelSiIqr8ZwvyJfVZI) <GaryMiller (GaryMiller)>:
Looking forward to all the great progress!  

## 11-May-2021

[0:48:44](#jwElKm0yXWmI8DN0UKVtRgVNM9NNG_2wvDTodiWaYxc) <ALANVF (theangryepicbanana)>:
yay I'm done being dead for now

[0:48:48](#rzjYssTw0zaWciZK4B1L2SKf99KNV4K1s4iTedgryp0) <ALANVF (theangryepicbanana)>:
[![image.png](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/luqi/thumb/image.png)](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/luqi/image.png)

## 12-May-2021

[21:06:43](#zDSpjWX_JZlveTJtO8mIKNElh-w9FVp15MkzYuUuS2I) <GaryMiller (GaryMiller)>:
Does that mean schools out?   

[21:13:23](#4vm4gOvmCoUtNzwuY8pSnRX_LWucUsh1gqNcjDy8WaQ) <greggirwin (Gregg Irwin)>:
> yay I'm done being dead for now

I was going to ask if this was a zombie thing.

[23:06:36](#gyVlA6UH1HHOvUqcEmV3r2dJh6tpHpU5MyDBfHl8JYk) <ALANVF (theangryepicbanana)>:
@GaryMiller yeah I'm done with high school now

[23:07:16](#ULMIIRMtksx5WT3cUIzRLQVMbks4wFeuQsxpTD_DxUc) <ALANVF (theangryepicbanana)>:
@greggirwin does a screen zombie count?

[23:07:21](#lio7teAB6IbL-M9HnDI_TlaKiWsYc01lo91vTdffXB0) <ALANVF (theangryepicbanana)>:
* @greggirwin does being a screen zombie count?

[23:10:08](#i0g2OeKzaP7rqOPNJ605kkjtVrdVSXqYommD1eOiyn8) <greggirwin (Gregg Irwin)>:
I'm a fan of Fuzzy Logic, so yes. 

[23:10:58](#y2B9nLEefSlNdxnEuiw-zYh6J78FOgdSX8CB--WCIWU) <ALANVF (theangryepicbanana)>:
yay

## 4-Jun-2021

[1:59:20](#lw8flvcP967a7NLHHteGfosWqhUGXTry8h8sdnXOzxg) <ALANVF (theangryepicbanana)>:
btw as an update (yes, another 3 weeks later), I'm optimizing some of the red.js internals because `function!`s are kinda slow rn

[2:03:17](#Y-qRygBksHwvbtm6wkXNDYFAcMvYeAeTqTTkJmLXlCM) <ALANVF (theangryepicbanana)>:
this is mainly because haxe does not optimize `Option` values, which are basically type-safe nullable types because they're an enum (aka tagged union)

[19:59:09](#CRHRY2rg9Gnxc7uUH5IvYY9ogod9UjsrKMYgJ7_axNE) <GaryMiller (GaryMiller)>:
Haxe probably relies on the optimizers in the target compiler. Wouldn't the C compiler optimize them after the Haxe transpiles it?   Or are the code changes to extensive for GCC optimizer?

[21:29:16](#LwAN8FI2IShQH_kXkBqoyv1fGSMXAEh0bzautqQQJOU) <ALANVF (theangryepicbanana)>:
@GaryMiller well I'm targeting JS (cuz ya know, red.js) so C wouldn't help much anyways as haxe directly compiles to JS

[21:30:31](#zDYXbNKD4L2D25Os4YyR5V4KwOB-6_P8-CjonGtH1go) <ALANVF (theangryepicbanana)>:
the other issue is that Option is just a regular type, not a magical compiler built-in, so it can't optimize it like regular nullable types (aka `Null`)

[21:33:08](#Zw4zBULusk8pbze8oEZU5gvTGxJAQDRDX2TvNHE-9w4) <ALANVF (theangryepicbanana)>:
unless I figure out how to use haxe's outdated JS generator (used for custom codegen rules and stuff), I'm probably gonna have to manually go through and replace some uses of Option with Null (because Null is not boxed on JS, as anything can be null)

## 5-Jun-2021

[14:10:10](#-f8kBQGjoqJV9etbZ4N9OfZLaspwQn7kEBLV3jtVgCI) <GaryMiller (GaryMiller)>:
Just thought that since emscripten converts from C to Javascript with very little speed penalty that there might be an advantage in leveraging the code optimization that C does first.

But if as you say Option could not be optimized any by the C compiler then there would be not advantage to generating C first and then going to JavaScript.

Having to alter JavaScript code after it has been generated Haxe each each time would get very  tedious though unless you somehow automated the code changes in the make process correct?

## 6-Jun-2021

[20:31:42](#CMOD3KL6bwIB8wBTRmqDk8QgKBywBxnIlyBbL9DuXdg) <ALANVF (theangryepicbanana)>:
@GaryMiller well the thing is that the JS codegen thing that Haxe provides is part of the compiler api, so it directly changes how Haxe generates JS code at compile-time

[20:33:00](#ql9qHmEkSBTEzANsrC3qHa0dnLtYOXy2FGE1unnejMY) <ALANVF (theangryepicbanana)>:
the main issue with it is that it's pretty old/outdated compared to what the compiler itself does

[20:35:39](#NPSmqEN2dVe6woJ9Tz0mSZxV8jL-t9mRxZg77Fi3Tug) <ALANVF (theangryepicbanana)>:
here's the interface if you're curious: https://api.haxe.org/haxe/macro/JSGenApi.html

## 27-Jun-2021

[22:35:30](#cZcH98sswejJa53srWcLpTA3b5KKfx_hRLpHIuG-Eh4) <ALANVF (theangryepicbanana)>:
yay removed a bunch of boilerplate with some fancy macros and stuff

[22:36:15](#heFUIcI4EpGNa3gGJOTCQ15yvwXo6lVfLmxL4JXobD8) <ALANVF (theangryepicbanana)>:
now to figure out why dead code elimination is broken

## 28-Jun-2021

[0:15:35](#Ghg921CoP5sPO0RsyDIBh5j96LPd8donIBqy3p1lIFE) <greggirwin (Gregg Irwin)>:
Thanks for the update. Dead code elimination from your work, or Haxe back end?

[0:16:58](#hGHbvTIH2T_J-UNjuKtQFlXrR7SPA_OotoDRI8ut2vc) <ALANVF (theangryepicbanana)>:
I guess for the backend? dead code elimination is basically a haxe feature where it optimizes the output code (in this case, JS) to get rid of stuff like unused types, functions, and variables

[0:18:19](#CGj1gORZP90FsLj_K6MbrcwweWsdDsdfN7JjVoZU0B0) <ALANVF (theangryepicbanana)>:
unfortunately, it was ignoring a lot of types I had defined for natives, and the only solution was to disable DCE for the natives (which means they weren't optimized, not fun)

[0:18:56](#F7IjVu0gbxKi2lqQ-MQSabkN6FKGyqr_oGH-UBpav5Y) <ALANVF (theangryepicbanana)>:
I think I've got a fix now, but it's breaking something else so I gotta fix that too lol

[0:19:03](#35IGF6fDUFnH7d2ODxGFECmIBDV1tbZdpSAkj_ryS0w) <ALANVF (theangryepicbanana)>:
* I think I've got a fix for it now, but it's breaking something else so I gotta fix that too lol

[0:20:33](#_gec_kELw51FZDeHsAnu3UWOBdbFSAUigrxEgcWUz5o) <ALANVF (theangryepicbanana)>:
(and to no surprise, it was another DCE issue)

[0:21:46](#D4txZIMFKnXcKuwxM2Vgqx9k6aVjzP33pHDjcfr8-RI) <ALANVF (theangryepicbanana)>:
in general DCE is supposed to be really helpful, but sometimes it can be counterproductive when using macros and stuff

[0:38:55](#EUE0xxidpIe0cEppADhEvWex37xhbnT70_-cj9tpTmY) <greggirwin (Gregg Irwin)>:
Optimizations are always a double-edged sword. 

[0:42:36](#9YxeAHpBuMekgUS0LUWJT-iPvkm0vCnqhjbfUQ6YKnI) <ALANVF (theangryepicbanana)>:
yea

## 29-Jun-2021

[0:43:58](#_1zBdZTmzLHID_mVZbTZOuhVBgjukRic8WpvrwwT1jk) <GaryMiller (GaryMiller)>:
Have you chatted with any of the HAXE JS authors? They might have something on their RoadMap that would take of that allowing you to concentrate on the RED port.  By removing their boilerplate you may make it more difficult to upgrade to future versions of HAXE/JS.

## 23-Jul-2021

[22:58:11](#vciIta9HhE0AjSpk7Gl_EgPc2Sz668pac50OBnyVssc) <ALANVF (theangryepicbanana)>:
yay some progress

[22:58:14](#tbq0tN451k3UuvNezv4ks_-KBGm76rBPM_2x3QlPD5U) <ALANVF (theangryepicbanana)>:
[![image.png](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/ybtd/thumb/image.png)](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/ybtd/image.png)

[22:58:47](#jPiNcnK9l3k8h7mYnxO_QTaL6WH2-5AlOzvcB7-nf8U) <ALANVF (theangryepicbanana)>:
also rewriting some datatypes to be more efficient and reflect their red/system impl

[23:42:09](#08s4S4HzVMd3IwSsWsmtfE6BEGyuQdgwwxrn7qY5z00) <greggirwin (Gregg Irwin)>:
Nice. Thanks for the update.

[23:43:09](#2-SWihNi-iCF6n7wBkNA5CTfdx6Esep5jD3Rw4jF5SU) <ALANVF (theangryepicbanana)>:
ye

## 24-Jul-2021

[2:37:23](#0NiXhUP5QVmpwTbbiLBaQjeG-92Lz-SjlDlfUfSfclg) <GaryMiller (GaryMiller)>:
Exciting progress!

[7:42:21](#wls7KpR36Qj73Np6saNpQDe06Iew_ZqY4gCkJ1hm0B8) <GiuseppeChillemi (GiuseppeChillemi)>:
Good!

[17:33:28](#BSQLwlpLSdhsBMQyxfgOy-gtw6T17idYF7HhnFnXOGo) <ALANVF (theangryepicbanana)>:
thx

## 23-Aug-2021

[23:40:05](#c2u2TWtxme_v9TGDGjG-cGDuvNNVQtar6QKGcYlEugU) <ALANVF (theangryepicbanana)>:
yay new stuff

[23:40:13](#YuwaFC83XXp9iE23aRrToqpPNAzQSr125vOBE8QYoaU) <ALANVF (theangryepicbanana)>:
bind/in coming soon

[23:44:58](#dztBwUKn8wHnaxUZdguyyPz6B1WUEYybm6EpAlFmEXU) <ALANVF (theangryepicbanana)>:
I'm also gonna try putting up a runnable version of the new Red.js like the old version on replit sometime soon

## 24-Aug-2021

[3:50:20](#mNBiyEMBuVOZGmLLq-PBtCvmmUozvmRoX5GcD9VIkRI) <greggirwin (Gregg Irwin)>:
:+1:

[6:00:08](#zlheIwCPg2WVKw-id-92GXLg20TFCMZJ8VKk78ubEEY) <GaryMiller (GaryMiller)>:
Great news! Are you liking working with the new version a lot better than the old version?

[16:28:43](#5gZrFFGqe9Fs0_pDpV_bPhnrVm4Cfnxf7BmU0x92FyA) <ALANVF (theangryepicbanana)>:
@GaryMiller it's better in a lot of ways, although I haven't been too happy with how restrictive haxe's type system is

[16:28:48](#WzMJa3E7rpiH3Xqqc3qHhf1X-V-Oz-8cUYjYKBZLer4) <ALANVF (theangryepicbanana)>:
* @GaryMiller it's been better in a lot of ways, although I haven't been too happy with how restrictive haxe's type system is

[16:29:07](#pdQCCTrwDdNMMwKW9wlKRIpZmVe9btx2PGCYAA-QMhc) <ALANVF (theangryepicbanana)>:
* @GaryMiller it's been better in a lot of ways, although I haven't been too happy with how restrictive/incomplete haxe's type system is

[16:29:48](#sVLF3-RSqJaZ_xQIShDLvE5WLFzf6rXyIRdgZHyTLbU) <ALANVF (theangryepicbanana)>:
essentially, I've traded boilerplate for different boilerplate

[16:31:53](#O972Zn0RmAEsV_Uqws1QPKdPTA-_S7Eypx2rNprMVI4) <ALANVF (theangryepicbanana)>:
there's also the issue of haxe's codegen, which is frequently dumb and adds overhead when it's completely unnecessary

[16:35:57](#OCKzxHilelq8xLwsSMGtogXfYMIEzVSW98FXxtALpfM) <ALANVF (theangryepicbanana)>:
(can probably meddle with the codegen later, but eh)

## 26-Aug-2021

[1:15:49](#uZZx7GtIha84Ari8ue6xlQWbqcU-w0V8dpo9GmREFak) <ALANVF (theangryepicbanana)>:
yeeeeeeeee more natives added (`bind`, `in`, `switch`, and `case`) and fixed tons of bugs

[5:24:52](#BNUFKdfu0B6Cfuj9J49zOXeB2pmz7fmX8lHwWrlVOtE) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Ì†ΩÌ±è 

[5:32:11](#oh9EIolXVsEUTvN1jusH9DBEQScbupRs-FAaFpmQYxA) <greggirwin (Gregg Irwin)>:
Sounds like you're making great progress.

## 15-Nov-2021

[20:44:54](#KoJybWBMr7NXi8oSXZouEJvtmJgbUdpL3b5lMa3pZ4s) <ALANVF (theangryepicbanana)>:
been a few months, but I'm slowly getting more time to work on stuff

[20:45:20](#hVAmbYjquvQROY6Kn88cpHT4OD1ZpFNGvscRr8GH658) <ALANVF (theangryepicbanana)>:
I think I've also figured out how to make functions nested in objects work correctly

[20:53:43](#S0e5DRdyI06-ynWpwSS2hNSQjuSNsy16zlXZGpPfMuo) <greggirwin (Gregg Irwin)>:
:+1:

[20:54:38](#ZvJHAd7yl58PcrkawAUA5jhCcKIBq9syD3e8_yVuiBY) <ALANVF (theangryepicbanana)>:
in my old impl, I passed around the current context everywhere (which is how I made it work there), but that obviously caused some other issues

[20:55:43](#cWozhOzRwDjAsqwQIMDGaQ-mAk-cqEMVF4R19KWJSME) <ALANVF (theangryepicbanana)>:
apparently the object's context is bound to functions during creation only, although I'm still not 100% sure how `self` is bound but also inaccessible from the outside

[20:58:48](#KZHf9sqMvuALruliD1GeZgYlrSvEjOJ9HeSDIrKf7Fo) <ALANVF (theangryepicbanana)>:
will continue investigating, but expect more stuff coming soon

[23:25:30](#_w8n1dAZc52PnC06vd06VWQ5OYRPKLwg9UEm-uXhesQ) <ALANVF (theangryepicbanana)>:
yay that works ig

[23:25:34](#KwDej375vQlgKheB0MwjXSVgdoQ86wCzulFjPwBjlxA) <ALANVF (theangryepicbanana)>:
[![image.png](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/ftKz/thumb/image.png)](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/ftKz/image.png)

[23:26:58](#SKzmiEyutwnb6Y48nFcH7HuLTDbsQXMYCQo6qI9kB-0) <ALANVF (theangryepicbanana)>:
no typechecking yet, but it works for now

## 16-Nov-2021

[16:13:22](#rqU1PFcQgDVo2j_CsxFzXcVMMJE_9MAAy9hKD8DSUp4) <greggirwin (Gregg Irwin)>:
Cool. :+1:

## 25-Nov-2021

[18:07:12](#PAW-2oZw61IJIov93YET0poebi2E1kMxjY_r3WFK-wk) <gchiu (Graham Chiu)>:
What's the end game here for a GUI? Is it to implement VID in JS?

[18:23:10](#RI1v4y7CjD8Iro6MD3h-0Sd8z6rqGjHY9S_CojzU0Eg) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
I am not sure if it would not be wiser to map to something like Flutter. Btw, Graha - what is the state of Ren-C and WASM? Can it do R3 GUI?

[20:17:27](#KINwYRNjMBIPStzPGu05bACM7ZDvf1BGpWo0sBnYNmk) <cloutiy (yc)>:
`textfield "First Name:" [ required autocomplete .class1 .class2 .class3]

[20:19:16](#ynBDU0QUcxev_rD-zksdMWvzIFcX0nDedwrWZAUFZSs) <cloutiy (yc)>:
`button "Submit" [ post items/new ]`

## 26-Nov-2021

[2:54:15](#iXLhwf54bWpWdy8Yp31i7MHsQANRZMz-x2Zx2Nxcdak) <ALANVF (theangryepicbanana)>:
@gchiu either that, or a dialect similar to VID that's better for building/manipulating the DOM

[2:56:42](#Yrr05i2DpFGkhrtnUS-OQrYmXHLTOu5Iofx6Xxy4VRk) <ALANVF (theangryepicbanana)>:
I can imagine that there would be a handful of dialects that would be used to expose much of JS' functionality in a nice and clean way, like using the DOM, async/await stuff, events, canvas, and maybe a R/S-like dialect for mapping to raw JS

[14:51:06](#-osxxA0jJCs8yy_aPLFknJNccv-tII550_DqS1wmkAE) <gchiu (Graham Chiu)>:
@pekr i use renc regularly in browser for most of my work, but there's no current plan for a gui
 

[19:18:28](#Zlit6AFJuBoPk2XHX7Z8dXKaVJioyoG6qewW3ycqEoA) <cloutiy (yc)>:
Would be interesting to see how to take advantage of an object's on-change function combined with websockets to deliver realtime changes between data and ui.

[19:23:30](#3YgyfiAbPtMl98k9uZRzVXNAIOmrSfrGzZz80cF2Q9Y) <GiuseppeChillemi (GiuseppeChillemi)>:
@gchiu How do you use RENC in browser? Have you some examples script somewhere?

## 27-Nov-2021

[3:13:40](#I4kTeKT_ALq-KDY_xNARG3gmVf2xfvRqDjy8acTI-hk) <gchiu (Graham Chiu)>:
@GiuseppeChillemi  try this.  At http://hostilefork.com/media/shared/replpad-js/ once the renc has loaded into the browser, and you see the replpad prompt, type `do <latest-of>`

[3:14:04](#4P2_k07U7t2A5HCH_qvxl_HjcmlqqHsy8immw--mlgE) <gchiu (Graham Chiu)>:
once that loads, type `latest-of` , or, simply `latest-of 0.3.40`

[3:14:43](#jIjmxL0mhlxIDzxIzWtKOfriakqrC4e9AccHGHOrJ_A) <gchiu (Graham Chiu)>:
the first detects the browser OS, and gives you a link to the latest builds for that os.  in the second case I specify I want the build for windows 64

[3:16:48](#HpyA61hNtfssKk-Z1aF3cjWSiRX0P6D-0stn5LzzjUk) <gchiu (Graham Chiu)>:
I've got scripts that print out my timesheets and invoices which work by calculating various things and then populate docx with these values

[3:17:38](#xYWRRzt09_4G606RimVIdWwPq36OrREemwCANucz8Jk) <gchiu (Graham Chiu)>:
So, even though I'm working in a hospital where I can't install anything, I can still use rebol in any browser

[3:18:30](#XIScfrqk97-EixIKg8ErhdfL2UjrgpOuw7gjARMiNn4) <gchiu (Graham Chiu)>:
I've got another script that calculates which energy provider to use based on my current latest bill

[3:29:00](#G4rOrylZyvLwgsH9We_LrO4fmQbGM5QGtEOpJPaMZMM) <gchiu (Graham Chiu)>:
It's cool that we can use rebol in the browser to tell us where the latest build from CI is .. means we don't need to maintain a static web page

[10:41:09](#i2PusE6JgeUpRklZCPZAqBs-v-Y7FeHbaYoLbv5rd4g) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Sorry, but that is not Rebol anymore. At least for me.

[10:59:55](#X6VNd3GcXngrF73d4sRJItgXXcxvoCXvbFlfqmlYYoc) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
And btw.. `latest-of` is a pure name. I don't know why would anybody want to download ren-c for different os than the one currently using. And be forced to remember the cryptic system tuples. Does anybody remember the number for the Amiga version?

[11:00:41](#ibwzCNGiBiocsgKikeQyk-9vFrmeg6OO6anPhk05X3I) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Never mind.. wrong chanbel for such comments.

## 29-Nov-2021

[4:43:24](#Oz6LRjn9NaTZk2Q5zfsazRLxEPeT8h0-3mDeLGaLOPE) <gchiu (Graham Chiu)>:
My chess demo is working again.  http://hostilefork.com/media/shared/replpad-js/ and type `do <chess>`

[4:44:01](#Bp15wI4v3RXV9mA05NCzosR9rBPgrEgFqSM-N_Jhthg) <gchiu (Graham Chiu)>:
to play the demo game, type chiu-vs-jensen

[6:41:12](#1byKdioeqcIL_o_311jovNYMYU3zae2upOjTtqpcZN0) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Of course, Amiga was `.1` :-)

[6:54:48](#visIDt2sXWLX1NQiyeWc42DYHeaxuzkrmWE58JGvalM) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
:-)

[6:55:46](#Lst9pALg6-RIOfh1P2W9kZcwjz-IqiifquG65FMucF4) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
You know, there are always being some remnantns of the past. With Red, you can still find a long time abandoned Syllable deep in the structure. I would actually remove it ....

[7:25:11](#TPElh0ABTlvNRtiE0OAto4w130ZVK0o6dxh9I-K2HLQ) <gchiu (Graham Chiu)>:
Kaj is following red. He's using rebol to cross compile another language. 

[7:25:24](#BGgAV4YWOG1PpYML8bEaTElwJQxR8A5Bw7TW9YbyMDA) <gchiu (Graham Chiu)>:
Is syllable still alive?

[7:31:31](#briWv2ZrVeti4kCB1WQ8K72xk9106PaBcP3MwF4bnes) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
[Last update in 2013](https://sourceforge.net/projects/syllable/) so I would say that it's not alive. And I don't think that Kaj is following Red. He stated quite clearly that he was disappointed with Red's progress.

[7:48:04](#NzrrODIx4vVjUkdv164mQMjFjUazYMzTGNxxZ9izVhs) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Kaj also recently launched his own Rebol like language, called Meta, so far targetting stuff like Atari 2600, or something like that and claims having even commercial ideas in mind.

[7:49:23](#fkLbPxDN6t__8b2NoyX8NckQvjN7BymD1glP3U8XIBw) <rebolek (Boleslav B≈ôezovsk√Ω)>:
It‚Äôs unfortunate to name your language Meta and then half a year later seeing  Mark Zuckerberg to use the same name for his dystopian version of apocalypse.

[7:49:52](#W63ZHeuqhTqQf7Gu3Sx4DiuS5A0DVJHm8EfX3ZQPIm0) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
:-)

[8:46:26](#9FS5_CCgXWVTgEjMSIgMKnkx8Stv3IXSqisxGqE_1Qw) <zentrog>:
> <@rebolek-5565a4bf15522ed4b3e100bc:gitter.im> It‚Äôs unfortunate to name your language Meta and then half a year later seeing  Mark Zuckerberg to use the same name for his dystopian version of apocalypse.

lol, indeed! Unless you registered a trademark for it already, in which case you might get a payoff to change your name at least...

[9:33:53](#lPuJQhcvpAQUezNMD7TS-PtX1Ot40rkLbGZLTDeL4N4) <gchiu (Graham Chiu)>:
@Oldes he was following red by also using rebol to build a binary.

[9:48:16](#ClH_7ej5074qBkYRY5_IzG8DFkV9GtHp4adN5pcrK0Q) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
@gchiu Of course he was following, especially from Red's birth, [but according his own words](https://rebolforum.com/index.cgi?f=printtopic&topicnumber=45&archiveflag=new) he is not anymore:

> For many years, I planned to build my language on Red. But when I made the final evaluation a year and a half ago, I saw that Red was a non-starter. For a number of reasons, most importantly because it still doesn't support 64-bit.
>
> Efficiency is also an issue, because Red doesn't bring you anything. A compiled Red program is as slow as an interpreted REBOL program. An interpreted Red program is about eight times as slow as an interpreted REBOL program.

[9:50:35](#V8sUMksIg7nlfSVlHN7XSTKkMpvdjCkf_juk2qIwMu0) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Are his claims about interpreter being so much slower, correct? What would be the reason? Is it related to Red being compiled down to R/S, which is slower than C /native code of Rebol?

[9:50:52](#WR_9ybLG7pYLNCV1-vuDR6Odw53UqXdCe6HUXOEXAtc) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
He is actually still using the old Carl's Rebol3 alpha version.

[9:51:27](#zwPHRYDCezfzH0d8eWa5cWVXiBT90DlN5_tsjLDI7_8) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* He is actually still using the old Carl's Rebol3 alpha version.

[9:51:29](#Z2x8Os_uzxHPOpg-KGX1uNmeWiH_9TPBciwHCPqhf0o) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* He is actually still using the old Carl's Rebol3 alpha version.

[9:51:31](#P0r9F4U2hT6RZwWwEp0ZMZ_O_eHpuVlufatOTa5N0rI) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* He is actually still using the old Carl's Rebol3 alpha version.

[9:51:39](#R4ft1L6TocwYeKlbWkQ8-krDmf5_J8wpDiOSpSmLkrE) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* He is actually still using the old Carl's Rebol3 alpha version.

[9:51:53](#qR9_46hQtCZGgFJ2oz0Ug9Qxc1rffaFgPOczFvoCXBc) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
> Oldes' version gave me the confidence to return to R3, but eventually I settled on Carl's last version

[9:51:54](#gASNCwiRFYYP4pPGVN5XLgjfA0fAl_Yj7shZWEp9OPM) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* > Oldes' version gave me the confidence to return to R3, but eventually I settled on Carl's last version

[9:51:58](#Lw16WCxQ91kt7FMLOEk1yrC-vafDTJRX5zSbmWweNE4) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
> I needed some code differences to support both, but there were no debilitating problems in Carl's version

[9:52:41](#Ddosk3iu-7qLRl8XaciAhb8cj3EKy7xAswddZfULK-o) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
> The Meta compiler needs to report any occurred errors. In unfortunate cases, they can still be errors in the REBOL code. Oldes' version puts ANSI codes in the output, which I cannot report to all Meta platforms
> Perhaps they can be switched off somehow, I didn't look very hard for that. Carl's version is usable so far, and faster

[18:55:25](#-lUifAgTgjuGC1WM6yQSF1VqUlD_gOmPzWXqMWesBX4) <gchiu (Graham Chiu)>:
@Oldes - I was using the term "following" in the sense of copying an idea. Please don't take me literally.

## 2-Apr-2022

[20:17:04](#_jylIhtALPW48Yjr_1im8_hgEQk7jZdl8oolyDIgkKY) <GaryMiller (GaryMiller)>:
@ALANVF any news on red.js?

## 4-Apr-2022

[0:26:22](#dF8cSWAWWwLm-iltRdI9QeZDgidiZUX8GXWOnDhe1VQ) <ALANVF (theangryepicbanana)>:
@GaryMiller I'm still working on it on-and-off (also balancing with my work on Star), however I'm currently in search for a new job as... things happened and I dropped college, and was not accepted to work at Replit again, so I will probably be less active on both projects for a little while

[1:09:34](#qMgXZk6t4oDDU21dSW_-aQ7tyjJ12Vja3hRxT7pji5I) <GaryMiller (GaryMiller)>:
Sorry to hear about the job situation.  Obviously that takes first priority.  Best of luck in the job search!

[1:23:16](#mZlvfo6RBt8N6a6qUlleebTLimz4kMX8tzpkCwkSrUo) <ALANVF (theangryepicbanana)>:
thanks :thumbsup: 

## 6-May-2022

[20:44:35](#yPJum2LoN8RozTEGeBRAXSdcmGpdQS4bWksKB7RaKGo) <ALANVF (theangryepicbanana)>:
ok so thinking about an implementation issue

[20:44:40](#dcq1tORX_wM7Ls_fMEymY9c974hNbn9svqCe4RznCUU) <ALANVF (theangryepicbanana)>:
how does `context?` work?

[20:44:56](#unH02eve6mjd7s3naDenBjZjUQrrbfd3FopQRhNBX5U) <GiuseppeChillemi (GiuseppeChillemi)>:
What are you asking?

[20:45:00](#BA9v72PqpiyT8-lBjubz9OaIT3XbEpH2S7s5WI5ydvk) <ALANVF (theangryepicbanana)>:
I was under the impression that words only store the context they came from, not the object that the context belongs it

[20:45:48](#nP-t5IpxW_lqDt4jeP2yaTCbojt8Lkfyxg7KdqJIUSc) <ALANVF (theangryepicbanana)>:
this is why `func[/local a][context? 'a]` will return the function itself

[20:46:03](#AewuYDKvMIUsU_gDIdb7rI4_3vhy2N8cc5jbsUrygzQ) <ALANVF (theangryepicbanana)>:
but how/where is the function stored? is it stored with the context or the word?

[20:46:31](#FxPo06uDsct7is6FxbG6ANKYZ7jizotqZVSamjYBpKM) <GiuseppeChillemi (GiuseppeChillemi)>:
Words have values in a context. They point to a context where you have both the symbol and the value.

[20:47:53](#zjMopwmxYGmNs0dWa6HdYTFqjqJrgq8OQtr3OoKc6is) <ALANVF (theangryepicbanana)>:
sure, but say that word `a` belongs to context `b`, which is associated with object `c`. does `a` store a reference to `b` and `c`, or does `b` store a reference to `c` (as well as `c` storing a reference to `b`)?

[20:48:31](#DcqRStmsIUKD1L2EJrDDpCzqsrClOODAVjmXEjKiuBA) <ALANVF (theangryepicbanana)>:
hopefully that makes sense

[20:49:16](#VHWhGsot9F8hq4O1RYhVwMpyGmynP5iDknCRORYODGc) <ALANVF (theangryepicbanana)>:
maybe this is better asked in red/red

[20:50:01](#t-H0S9vAiGs-22YpTWoxdq5Z9bQmBfBM8gol6niOsgQ) <GiuseppeChillemi (GiuseppeChillemi)>:
`a` does store a reference to an anonymous context.

[20:50:12](#v6dzoXFzEv_UtwKu3OeGtYcifpJCGvDa-Aa_jOpWp1E) <ALANVF (theangryepicbanana)>:
yes

[20:50:30](#WcRJbrxywcGYHCDtcfT7J4yJiVM0EaIw8xndHq_35IU) <GiuseppeChillemi (GiuseppeChillemi)>:
`b` value is a reference to that context

[20:50:37](#NbNWrfT-bckE4gcDF6l6ALc2SeGq_7okMZEOFg2H75Q) <ALANVF (theangryepicbanana)>:
but does it also store a reference to the actual object the context belongs to, or does the context do that?

[20:50:46](#41bjQrGxHaZwmtaE-k72jL5rfoJgDHjMpcK2nSU0cEw) <GiuseppeChillemi (GiuseppeChillemi)>:
* `b` value is a reference to that anonyous context

[20:51:22](#pIPx-FjlYngtxAyaESpej17j42kzNC2ngfOc3gus3o0) <GiuseppeChillemi (GiuseppeChillemi)>:
it = ?

[20:51:35](#hvogLaa8PozhaC8eoNeDwQIqtd04Kmt3HB-ABAQo80U) <ALANVF (theangryepicbanana)>:
`a`

[20:52:36](#Gp0A2p4ZUjN1O03EtuPU_54Bz8utdgunfLJRechFRo8) <GiuseppeChillemi (GiuseppeChillemi)>:
Wait a minute, I need to search something

[20:52:38](#Vxb4syby1Xzhn2xUxhKZojOCDgYNRLUAhu2Y409bung) <ALANVF (theangryepicbanana)>:
I see this in the runtime code:
```red
red-context!: alias struct! [
	header 	[integer!]								;-- cell header
	symbols	[node!]									;-- array of symbol IDs
	values	[node!]									;-- block of values (do not move this field!)
	self	[node!]									;-- indirect auto-reference (optimization)
]
```
maybe `self` is the reference to the object, or the context (being a cyclic reference)?


[20:53:27](#SB2onFcp1czN5UtKgSit8a-Y74KXBXKHGvE6xUkbIKg) <GiuseppeChillemi (GiuseppeChillemi)>:
I can't answer this question, maybe @hiiamboris or @greggirwin could help

[20:53:39](#MdkVKRLUTA8Cf39jUK6VU6fWy8hKkek-HRcwRrVWQPA) <GiuseppeChillemi (GiuseppeChillemi)>:
* I can't answer this question,  @hiiamboris or @greggirwin could help

[20:53:47](#2xoYHxtGaUDlZd_fcyz0ru3T5a1CbAqW7J51LROKDqE) <GiuseppeChillemi (GiuseppeChillemi)>:
* I can't answer this question,  @hiiamboris or @greggirwin will

[20:57:24](#dwW15mxnZVLxiae7Mn9M1c6iB-cHp50OtfeG4rlUTK8) <GiuseppeChillemi (GiuseppeChillemi)>:
From my arkive, from my master: @9414

[20:57:26](#GNAFYe99Kn3hVPXYGvtOGYDVNRLWxShtEjbNjitx_Kg) <GiuseppeChillemi (GiuseppeChillemi)>:
https://gitter.im/red/help?at=5e7f658459057617f049a7ee

[20:57:36](#4NVkoSlnvIBWI_F_NcqZbgkpo_9Zh1t74FX_JHY7CDI) <GiuseppeChillemi (GiuseppeChillemi)>:
* From my archive, from my master: @9414

[20:58:17](#2xpseKqnf98jODw7JEHaiNZBJUipqr-Gk2JaypLdhuY) <hiiamboris (NOT THIS ONE)>:
what's the question

[20:58:41](#BRHwYIVoqohBuA1IiD87osNUmLNVBTyZIHYxxYa87wU) <ALANVF (theangryepicbanana)>:
> sure, but say that word `a` belongs to context `b`, which is associated with object `c`. does `a` store a reference to `b` and `c`, or does `b` store a reference to `c` (as well as `c` storing a reference to `b`)?

[20:59:28](#ZnkKVCVBnw_YPTeA5ALD8aXQlLV8zHwZEwA9tnP9yjg) <hiiamboris (NOT THIS ONE)>:
what's "associated"?

[20:59:48](#U93-F6xw2__4fhCtYDSBGbjJ2cQQ5hoSCc_bz_RZOcY) <hiiamboris (NOT THIS ONE)>:
ah, I see what you mean

[20:59:52](#MePtIfQoqqeQP8nr9HzfKImqcOran2JNTR34s74ianI) <ALANVF (theangryepicbanana)>:
yeah, objects store a reference to their context

[21:00:02](#r3KDG0pGrPHylO03tgYBwYE_WQaCDzmT_mhScBbva6k) <GiuseppeChillemi (GiuseppeChillemi)>:
@ALANVF https://gitter.im/red/help?at=5c345c64357dd7655d354ab3

[21:00:07](#bydtESmj0D2TdnyHiGj7kcRw6fp0fwaTBrgm67zxGU8) <GiuseppeChillemi (GiuseppeChillemi)>:
From Nenad

[21:01:23](#GRGLpd5vuDwesUEjJ8XBYORxowpVddbL3WtGqtVDnGc) <ALANVF (theangryepicbanana)>:
ok so that supports what I've already thought about, so does that mean that contexts store a reference to their associated object/function?

[21:01:38](#13gfCsfMI5yIfGS3rqz6Bjjbo80qUooxDW2fVrnw9Pc) <hiiamboris (NOT THIS ONE)>:
`a` should store a reference to context `b`, not object `c` (context can be a function too)

[21:01:54](#sIR6N7n9JDeDcr8abUZN9qC8UYopVdIIKJZdeWbvG_I) <ALANVF (theangryepicbanana)>:
sure, that's what I'm doing currently

[21:02:03](#DJ63vboC4np6DjCnWB5KWbgTwH9OolPvZVwRH_eK500) <ALANVF (theangryepicbanana)>:
but somehow, `context?` is able to access `c`

[21:02:30](#pRtoPv2bplP73GRAnOk1qbuW4FpDrozrvLjhl3hXQgI) <ALANVF (theangryepicbanana)>:
I am thinking about this from an implementation standpoint

[21:04:00](#dvop3KYLiAf73idrIIm9gjDQOHsiPKOVIGdbvzy2YD4) <ALANVF (theangryepicbanana)>:
or perhaps this can be thought of in an object-oriented way where objects and functions both have context as a base class?

[21:04:34](#HVg8WJlB9jVZ0Rdq32vlMzM-Lm25qKSYRCMhQbXv6aw) <ALANVF (theangryepicbanana)>:
* or perhaps this can be thought of in an object-oriented way where objects and functions both have context as a base class?, meaning objects/functions are types of contexts?

[21:04:46](#Nn9K0VcW69dXuP2bbqGzq2eWMY7rlO8fUiqhoVZVy40) <ALANVF (theangryepicbanana)>:
that doesn't seem to hold up when looking at the impl details though

[21:06:30](#1ilghSnpPqwrcdJJSKCNM8jJa8tF7WfDUza0JqMakk4) <GiuseppeChillemi (GiuseppeChillemi)>:
@ALANVF Here is what i was searching for: https://gitter.im/red/help?at=5accc5a91130fe3d36c0b7e9

[21:06:38](#YnPEPG49AJJWYxO3W7MiMMCqB4rVTxhhGOCM42nWcEw) <GiuseppeChillemi (GiuseppeChillemi)>:
* @ALANVF Here is what I was searching for: https://gitter.im/red/help?at=5accc5a91130fe3d36c0b7e9

[21:08:16](#xUg4SfYuSVPP5nIZCTsKPaGrQBJCrrKGmksT7f0eo-I) <ALANVF (theangryepicbanana)>:
hmm ok so it does appear that `b` does contain a reference to `c`, that's helpful thanks!

[21:09:14](#kZ_Jpu3cyeWS1yOc0SXn5pBLjJHGzKG-jIaWPuJRPl4) <ALANVF (theangryepicbanana)>:
this can however probably be modeled using the object-oriented approach I discussed earlier though

[21:10:24](#96EWK9BIO0k4KfHqqsgZoUpgXI5NK6VJNgrKryX4j78) <GiuseppeChillemi (GiuseppeChillemi)>:
Another link:
https://gitter.im/red/help?at=5dc6a5feeeb63e1a838156b4

[21:10:56](#5kmCIBqYrfcyTHo8ABV3BaFAbduyHax574JeN-7ylPc) <GiuseppeChillemi (GiuseppeChillemi)>:
It is the last one until you will request me to continue

[21:11:20](#M6G_-rVbTQTP0xYeCPa9eG3qZ7S7CiUoR1DURcrU5yQ) <ALANVF (theangryepicbanana)>:
no that's plenty helpful, thanks :+1: 

[21:26:41](#ILmpcOOB6Uni65LFbj75gH_UF8PAM8hOR4YIuXJ_LoY) <hiiamboris (NOT THIS ONE)>:
Red runtime is a damn maze

[21:26:57](#gVZW-CieVsTgD2GcRlxsPQMIN1ReNBD_E1r5LpQKgpo) <ALANVF (theangryepicbanana)>:
lol yeah kinda

[21:27:21](#55fZu-iLrdeJ_uHEbKNeSCwSak_bWx0caBoi_d59dsM) <hiiamboris (NOT THIS ONE)>:
my version is: `ctx/node` refers to a hashtable, and first value in that hash table contains the initial object/function

[21:27:53](#-bSozL0-ykiAZxXETUIa2Hw4sCLaz1S3M71RqQ2O-Ks) <ALANVF (theangryepicbanana)>:
yeah that lines up with my conclusion from earlier

[21:28:20](#J7BRXLucP4E6KIR4NFHkuEsWRp6K4GxrLMKVR86F0xM) <hiiamboris (NOT THIS ONE)>:
* my version is: `ctx/node` refers to a hashtable, and first value in that hash table contains the initial object/function (or maybe even 2nd value)

[21:28:25](#LgwYzq7pizm7GJ0UE3P_KWPcweN7p2uMape9NxH_6Ls) <ALANVF (theangryepicbanana)>:
I'm now rewriting some of the red.js code to follow this

[21:28:58](#zXXUsyAK9eqYEzxnj3sgoZRGrCzz_bZIjpPm-PF0dzo) <hiiamboris (NOT THIS ONE)>:
:+1:

[21:30:12](#I406iQAgHblAOR2-vsleZNaOO0LSJV_yRuT3nO9bB6A) <ALANVF (theangryepicbanana)>:
fun fact: while looking into this, I found that the object context has an id of -1

[21:30:19](#QE_4MsqIaROhMM6GgbTERkhYb3K9dGCbqO4TGWbWtNM) <ALANVF (theangryepicbanana)>:
* fun fact: while looking into this, I found that the global object context has an id of -1

[21:37:11](#Pw6SN1v_LgmMYFhhCN2j9vGy7NsOb5rUtd82VGQsMLk) <hiiamboris (NOT THIS ONE)>:
https://github.com/red/red/blob/38b42610d2ddd5af53f0133dfe81d9391785126e/runtime/datatypes/context.reds#L404
not a hashtable, just 2-cell series

[21:37:36](#nb79J7i-Ozc3SpwaeBj-lT1s8Wii325o16m7EIoXXu0) <hiiamboris (NOT THIS ONE)>:
https://github.com/red/red/blob/38b42610d2ddd5af53f0133dfe81d9391785126e/runtime/datatypes/object.reds#L912
second value is the object/func

[21:37:52](#5UbQfucfwjmqFyPM08n8CuUK6ixVPC04clOtifoxenI) <ALANVF (theangryepicbanana)>:
yeah that's what I figured, thanks

[21:38:12](#xrzFOOe92oOGHqpU7ITvL9yCMk1QXvfosQxeM-ftARg) <ALANVF (theangryepicbanana)>:
a lot of R/S code is a bit cryptic for me because of all the pointer arithmetic lol

[21:39:46](#gH1UhZ6eSwLcZ477mnEALpjH7tXYPpE317XhyENSuIM) <hiiamboris (NOT THIS ONE)>:
yeah it's like navigating a network of teleports without a map :)

[21:41:27](#atCfh_sPT8dRmSS9vB2Mzww7NFC2G9wZxWQIA4V4Y4w) <hiiamboris (NOT THIS ONE)>:
not so much the pointers, but how things depend on other things

[21:41:58](#OVsLkeItGhVsU7X3pKnr319mdVr8AuSPQVuuDl7Bu_k) <hiiamboris (NOT THIS ONE)>:
View is even more of a mess, esp. it's Draw part

[21:51:17](#04vBneb24ptdvg7xoOHsuAUl163IrUF-jImcAyuxeoI) <GiuseppeChillemi (GiuseppeChillemi)>:
OMG, I am loosing the faith to learn the inner working of RED!

[21:51:39](#jzbRG1IaKlBhYl6Z-3vz0IMEg6NA0tDwATr2M-fO3yQ) <GiuseppeChillemi (GiuseppeChillemi)>:
* OMG, I am loosing the hope to learn the inner working of RED!

[22:09:14](#3bOyj6IDGGX50zA9EuGsKTi4xiSeCCZbP7bFDeuFf3U) <ALANVF (theangryepicbanana)>:
ok got it working

[22:09:16](#B49oJLNfFiEgEjIk9i1Q_vU9EIUbacCXoToUiIxI_MA) <ALANVF (theangryepicbanana)>:
[![image.png](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/BHtp/thumb/image.png)](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/BHtp/image.png)

## 19-May-2022

[23:02:23](#O3sUyIexgsnUSlO9WDzltukwt6hNhYaUVhTN5PFkqVo) <ALANVF (theangryepicbanana)>:
ohhhh I just figured out how symbols work

[23:02:34](#jJbq-5l5a6WNxbvibEBvGKEHgCnctPhNdy2SnP5MKxA) <ALANVF (theangryepicbanana)>:
apparently words refer to symbols, and are not actually the same thing

[23:03:37](#MEHjsi7kKBMaknYRVVve0CklqT0cjOjLErRUvHwpnPE) <ALANVF (theangryepicbanana)>:
that makes a lot more sense

## 20-May-2022

[19:59:56](#_S4dFIfm82waY2m3X-xTr21k-IREybZIW0zftPHLZeo) <ALANVF (theangryepicbanana)>:
got words and contexts/objects working correctly

[19:59:59](#YKSD-Xb73jlruGBpgjafVceHFHn7XcbU1hP9lFBPXps) <ALANVF (theangryepicbanana)>:
[![image.png](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/CKwQ/thumb/image.png)](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/CKwQ/image.png)

[20:03:30](#Ix6t6yppuhI2oh8mJXoiNJBHmthiVzW5vQWPr92nffA) <GiuseppeChillemi (GiuseppeChillemi)>:
Nice!

[20:27:52](#JHT9MmrLFxtggx5wrUbina_zpk93Z_7tbU_4-ydAGCI) <greggirwin (Gregg Irwin)>:
:+1:

## 21-May-2022

[1:24:30](#4Q1EhCx5ZQRlHLjDTSZLR3mf9poZD9DJFUlJUIUTg7o) <ALANVF (theangryepicbanana)>:
finally figured out how to correctly implement `self`

[1:24:34](#xd9bYA7__umwz4VCljGZwTimwyIyPvvKzSfOULMhY8s) <ALANVF (theangryepicbanana)>:
[![image.png](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/2e7o/thumb/image.png)](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/2e7o/image.png)

[1:24:50](#gknrmeTVQLLUFtt0kW3Vqntqa3R2wBf9wjuBletkcPg) <ALANVF (theangryepicbanana)>:
that was a headache

[1:27:16](#RyeSjH54WS-Iz0VMAdlcipiTZ_3EsSbeOCyGN7qc02Y) <ALANVF (theangryepicbanana)>:
I personally don't like how `self` is configured in Red after spending a few hours trying to figure it out, and I think there's probably a better way to do it in the future

## 27-May-2022

[2:10:23](#EjN2IaZhus9VnN-azn4tUXyTj37-cz0EeBU2_UQ-E0s) <ALANVF (theangryepicbanana)>:
ok so thought

[2:10:50](#afgXUfp8CKRWS0tCEJL3yu2szaZSUEGjU3MkiRqbvoY) <ALANVF (theangryepicbanana)>:
https://github.com/red/red/blob/master/runtime/datatypes/float.reds#L669 is a pita to implement in js without tons of extra allocations because you cannot simply get the binary repr of a float

[2:11:56](#HieXF0JxHeKaFvE4Hn_HYZzOdJ_R7PuZl8Jmnc2paLE) <ALANVF (theangryepicbanana)>:
so uh, do I go with an expensive algorithm to do it with less allocations, use the bad solution, or do something else? (and if so, what?)

[22:44:22](#lkjsDlIaC3KOVKvVfPHkaBY1AEzsULYe9NsqEGmM3Dc) <ALANVF (theangryepicbanana)>:
the `compare` action is now available for many more datatypes, including numbers and words

[22:44:33](#LNBst08xPJN5v170BK5Oy6Fgzq0j6FnKxFoj1PAqnes) <ALANVF (theangryepicbanana)>:
many basic series actions are also now available

## 28-May-2022

[3:23:44](#34JEEgRQ87F_78AOtEL7BhdyuepVwo_pDYlEt7M2oD8) <toomasv>:
:+1: 

[17:13:07](#W8hS03YS2eO9YMOgmmEA1I_JNSdbYsHyaQHo9UjuNkU) <greggirwin (Gregg Irwin)>:
@ALANVF  on floats, the first thing I would do is the easy thing, i.e. what JS does naturally with numbers. Then find the cases where that differs from Red and document it. There should be tests for Red to help focus on where that's used. With that, it can be put on a list and prioritized against other features. 

[19:50:37](#WWaMu_g7FhxmUHxz22K_OIAiybExVyzcbYi7VjtQmoY) <ALANVF (theangryepicbanana)>:
@greggirwin yep that's what I've done for now. I think that worst-case scenario, I could use an external JS library that does something similar and determine how that differs from Red's behavior

[19:50:48](#wCoHQTtX3gqLSF53hyfUuPy2OX7XWRTltvSGalPGcRA) <ALANVF (theangryepicbanana)>:
* @greggirwin yep that's what I've done for now. I think that worst-case scenario, I could use an external JS library that does something similar and determine (and document) how that differs from Red's behavior

## 22-Aug-2022

[20:39:47](#Aps_OkD6cNgl94cbNsgaS3Rv2zjl-osVwImpGWIhxtc) <ALANVF (theangryepicbanana)>:
Red.js has now been updated to Haxe 4.3 preview since it's now stable

[20:40:52](#MX28ZtbU-M5d-I6hDj6TNDzTJyLCs6URC1EouTRLxBc) <ALANVF (theangryepicbanana)>:
(curious, it's not showing up in the activity log?)

## 23-Aug-2022

[0:35:12](#xaDEyeRYDQRanAiLcbQeK5461mMw-hpR1gaJb2GDSSM) <GaryMiller (GaryMiller)>:
Did 4.3 have any features you've been waiting for?  Still making any headway otherwise?

[0:35:52](#vESQC_oB9I2DDuLPLZWOAH8wVVZYaPF8_7K24NDg-kY) <ALANVF (theangryepicbanana)>:
4.3 added null-safety features (like `??` and `?.` operators), and it fixed a lot of compiler bugs

[0:36:16](#al4STTPv_jx0XPZmUMe0bsPQ5KgflelPphEUQ6AwIiQ) <ALANVF (theangryepicbanana)>:
it should be less annoying to work on new features now

## 26-May-2023

[23:57:43](#hMIbLmhM5bIR6Mn6QTNzwmcL9w2itt-7kklS4oamims) <ALANVF (theangryepicbanana)>:
Hey I know it's been a while, but I'm back (after dealing with some major health problems, though not fully gone yet) and working on Red.js again

[23:58:19](#t4jXQ4bHyW0DvVMMbYvzQu9ZvN5OGqjbpNSXb8PmIR8) <ALANVF (theangryepicbanana)>:
added some more `integer!` actions and updated the runtime to Haxe 4.3.1

## 27-May-2023

[3:44:48](#FMQdkxLCzEs3YM_4KZXK_Ql_5VF7tcJn9ei8MVwL6nQ) <greggirwin (Gregg Irwin)>:
Life often intrudes. Glad you're feeling better. Thanks for the update.

[5:01:22](#wxeyad3nyci7aSi7f_h6Da-vppEJPtF-VStgk_qCN7k) <GiuseppeChillemi (GiuseppeChillemi)>:
Welcome back!

## 29-May-2023

[17:11:03](#MbGp71v_v1G7py5Au42g9cbQ1Lti5gsmLA-HWxiGGaU) <endo64>:
Welcome back ALANVF (theangryepicbanana) 

## 30-May-2023

[3:07:52](#PtoHYKviQDzA8uZCQwpsN1kC_QTYtMnMqre2DAKDqbc) <ALANVF (theangryepicbanana)>:
hmm it seems that the github hook no longer exists due to gitter moving to matrix

[3:08:38](#qsmrv3_ce_c5kX9N_IGF0CxuHnrWLY5coXLWsdIEJSA) <ALANVF (theangryepicbanana)>:
well in that case, I have just added most of the remaining `integer!` and `char!` actions

[20:16:27](#wZd3N6c22Gs-uspUI2sL0kUYT1JXoL8k3ifMHNP5KMQ) <hiiamboris>:
see integrations in room settings - there's a github bot there

[20:17:52](#dGe3N9gxtTAga6US4MiufoLf5ccMo97vyMxyrelO0RA) <hiiamboris>:
not sure you'll have permissions to add it into room :) but you'll have them to install the repo hook

## 31-May-2023

[19:56:18](#xacf5Mgkc56lCsdHrJTlEzrlFSACCGmtCjcp_oKd6as) <ALANVF (theangryepicbanana)>:
forgot to post this yesterday, but I've now added many more actions for `float!`-based types

## 1-Jun-2023

[1:53:53](#2CogVj2yStriGqV3iZx7aPCB8qkjK-fqcRMdRGdihyw) <ALANVF (theangryepicbanana)>:
I've now added more actions for `pair!` and `tuple!` types

[3:00:26](#GLX7pdRi3NpWpaec2cAfdDz144V5znP1w8wj0qQoMeI) <greggirwin (Gregg Irwin)>:
Ì†ΩÌ±çÔ∏è

## 3-Jun-2023

[3:02:59](#Vrm6HdvVZmEwxL93imG7bug88fF7Tt14Kv3hVkSTvv8) <ALANVF (theangryepicbanana)>:
I've now added more actions for `typeset!` and `bitset!` types (they're actually completely finished except for reflect, form, and mold)

[3:04:40](#jKpkVhp7AjLLn1zEoPBmzSLWxif0P0AscqvdlgswkFw) <ALANVF (theangryepicbanana)>:
still not sure what I'm going to do about form and mold because js doesn't have any sort of growable native buffers, so any solution is going to be pretty inefficient

[3:24:48](#CvXJylJch12SVuCvhgNeO3czW0YjN1v4cu_qsImABz8) <greggirwin (Gregg Irwin)>:
Take a look at how Doc does it in R/S for ideas.

[3:25:48](#a5V5zPss9PvmeWlLu2Ocjv_oD2_pOJgZoHhq6sUxF-A) <ALANVF (theangryepicbanana)>:
yeah I could probably look at it again, now that I'm back I may come up with some new ideas

[3:28:11](#LOz4XnmotgyXnyPkhRc40Fv67DHk7odmVLBFSfr9-ZU) <greggirwin (Gregg Irwin)>:
You'll see %runtime/actions.red allocates a buffer, which is passed to the datatype's action handler, which adds to that, using `string` funcs.

[3:28:29](#u0xwxu7iFbja1ry4DLR4FusMdA4zKTEqmdENZ11TaK0) <ALANVF (theangryepicbanana)>:
by the way in case you missed it, I sent you a private message the other day. it doesn't show as read, so I thought you might have missed it

[3:29:43](#__KHgM5HGcRZpwKcUNWrC-UDwp26RJxumaXq8BXODl8) <greggirwin (Gregg Irwin)>:
I haven't seen it. Changes to Gitter and I miss the old UI.

[3:30:28](#PpGG2tyS6_7vrqloCY-qzcw8Cj_hJJQn4vRQ2ozebRA) <ALANVF (theangryepicbanana)>:
ah I see. I think my original issue with it is that allocating a MAX_INT sized buffer for every form/mold call is really inefficient and takes up a good amount of memory in the browser 

[3:31:12](#liOPWSA32YBPVOUvgfXegtuG12iJQ5IwGyT7QoBNA1w) <ALANVF (theangryepicbanana)>:
ah gotcha. I do miss the old ui, but at the moment the Element mobile app isn't terribly bad

[3:32:17](#z_aV9JhMcTsmUpL35rkSKYWhoci4SpUM6uerealLW0k) <greggirwin (Gregg Irwin)>:
No need to go that far. :^)

[3:34:09](#RdlA0KKwlDTV_133tej8cd67o2nzvMErGk1SrcKHSnw) <ALANVF (theangryepicbanana)>:
alright then, I'll see how all I can optimize it tomorrow 

## 4-Jun-2023

[5:50:43](#cIavbINSPK6CtW-P4yZ6Hs4qIQgkeoNpq9WNuHqBn30) <ALANVF (theangryepicbanana)>:
I decided to rewrite the internals of `series!`-based values so now I can use a `string!` for the form/mold actions without having to do a bunch of boxing/unboxing (and therefore faster) although it's still not ideal, it now behaves much more similarly to the R/S implementation 

[5:50:59](#Y5WdKqj0lbbtWBduhsz8if0Lfp8WJXwd3J-dolRSbqU) <ALANVF (theangryepicbanana)>:
* I decided to rewrite the internals of series!-based values so now I can use a string! for the form/mold actions without having to do a bunch of boxing/unboxing (and therefore faster). although it's still not ideal, it now behaves much more similarly to the R/S implementation

## 5-Jun-2023

[17:40:59](#S9y7NQGoCXWRQ8fcmQBCui9nYUV8WwegQbby9-eJs9k) <ALANVF (theangryepicbanana)>:
I've now added the `form`/`mold` actions (although only for a few types at the moment), and `print` now uses `form` on its argument

[18:43:09](#6hWncUcYYlC7V2CMd0gS3s6ttTpKyegZwnfbIK0PI7g) <greggirwin (Gregg Irwin)>:
Sounds like good progress. Ì†ΩÌ±çÔ∏è

## 14-Jun-2023

[20:25:53](#760Ovf9FNkfnLNxOYsjpa3BZ_xJu6rgOQjE0A4rC56c) <ALANVF (theangryepicbanana)>:
I've now added most of the remaining form/mold actions for each datatype

[20:26:18](#lfcBdAE29-ZLLc02IX67goiAHS8qZLrivO778F06sRs) <ALANVF (theangryepicbanana)>:
as well as cycle detection for compare/form/mold/etc

[23:13:30](#ySOfekFpB6sLfRL6vaYxarM8bPXm0BCwNxPqe1S51aY) <ALANVF (theangryepicbanana)>:
I've also just added the `reflect` action for some datatypes (`any-function!` and `object!`)

## 15-Jun-2023

[7:05:23](#x2ntXWNJeai9roOKDoWkDvNKG5FPUJvApNVvB2brThM) <GiuseppeChillemi (GiuseppeChillemi)>:
Good work

[7:06:31](#DSU61Ot4HDLBpRn_4NYNpDTerGEXB82H2oQfABFRl8c) <ALANVF (theangryepicbanana)>:
thanks

[7:06:56](#x2L0tMBZJOjuwhdHE62juIDvYrJgD4VJm_uyY1ptVVw) <ALANVF (theangryepicbanana)>:
I'm also hoping to get another online repl up for red.js sometime soon

[7:07:40](#ypmcfT6n-1I9-uSugFs2-MJ9u1NtJHb9KBi17xVZjDY) <ALANVF (theangryepicbanana)>:
now that I've made more progress on it (mainly adding form/mold actions)

## 4-Sep-2023

[4:07:06](#w9T0JO9bKkCd3Yelm94A8xSQN_dks7f_mS2dignrk_w) <ALANVF (theangryepicbanana)>:
I've now implemented `append`, `insert`, and `clear` for all types that currently support it

[4:07:46](#XQrJgSX04u3h_oHbhF4zwujfz0lDkPcAN7yrnLTGjjQ) <ALANVF (theangryepicbanana)>:
next up is hopefully making a red.js online replit (I'll probably host it on replit again?) for people to use without having to compile the code themselves

[4:08:10](#0D5hHKBlo-LEbsnfrsbJkyY1aQ7-NM5apz4cYCo2ozI) <ALANVF (theangryepicbanana)>:
and then I'll probably work on adding the new point2d/3d types

[4:08:58](#ewXVtMlz44k_LuZupf8laIT5GY16Dh2G_TDJmw46J_k) <ALANVF (theangryepicbanana)>:
(due to having to go off of my ritalin patch for reasons, I can now only code when my brain feels like it which is why I haven't made a ton of progress recently)

[13:54:39](#ijOBiWxF3wt_QzRKmO-RkXhTE0xut6Pds1fFTyVUVUk) <ALANVF (theangryepicbanana)>:
* next up is hopefully making a red.js online repl (I'll probably host it on replit again?) for people to use without having to compile the code themselves

[17:47:49](#C4ITCkH19WDuiYCOY9w_TaSCqzsoC4OAIJ6PorxwhVM) <greggirwin (Gregg Irwin)>:
We all have stages when we are productive, or not. Stay well.

## 9-Sep-2023

[1:09:54](#T5Zfxow85vxAQ53q6NbMiKFxo2yWrr0vpezRqCmiZAk) <ALANVF (theangryepicbanana)>:
Hey there, I've now made an online repl for Red.js so you can use it without needing to compile it yourself! It still doesn't have things Red's repl does like multiline input, but it should be good enough for now: https://replit.com/@theangryepicbanana/redjs

[1:10:40](#AIXHQoci5zdHj2di0E2niipGZfOglrtKXOY5YSNUZLc) <ALANVF (theangryepicbanana)>:
(for whoever's in charge of this room, could that link be put in the description of this room?)

## 18-Sep-2023

[17:06:44](#k-L-Mjz7zB6Rjv-3xfk_3VfXvt-C_Wpw4aKiAgfie5A) <ALANVF (theangryepicbanana)>:
Hey, I've now implemented `point2D!` and `point3D!` in Red.js

[17:07:05](#xakoqYyVbCZwHtSMK8B2oX7kVNYmpqZTUffo-fhIm-g) <ALANVF (theangryepicbanana)>:
you can try them in the online repl (linked above)

[17:07:11](#-Ak29VKF63bpA1ucQlFgjxQjhyzP5KxnRZOhwuG7W8g) <ALANVF (theangryepicbanana)>:
 * you can try them right now in the online repl (linked above)

[17:22:39](#0ikSC60GTQF15nZNW_hfHKR37Wwd-wPN9zLKdcW_pE4) <greggirwin (Gregg Irwin)>:
Thanks for continuing your work. Once I clear some time I'll try to take a look.

[17:24:43](#l9r4m5gv7BYyzRXnrfBwo2Oy5rdEAdEvTLoBEDJx7-I) <ALANVF (theangryepicbanana)>:
once I figure out how to efficiently implement it in js/haxe, I also plan to add the floating-point trickery you guys use to deal with floating-point impreciseness

## 2-Oct-2023

[16:32:01](#u2CStBiiCV731vfXbpyjWGBvnthlWiKOnbQizwzFDa8) <ALANVF (theangryepicbanana)>:
Hey, I've now added the `copy`, `take`, and `swap` actions to Red.js

[16:32:04](#UZIGa3akJ337YWMh5KU1JP_CNJBxVGh3vKRlmbP9pT0) <ALANVF (theangryepicbanana)>:
![](https://gitter.ems.host/_matrix/media/v3/download/gitter.im/17ce63a294a771407c45a405242c0ca55ecacb57)

[16:32:48](#87E37kOxbiHJ82uPoUffO9FJ0kS1A0TuL7QZQYQ9Fjk) <ALANVF (theangryepicbanana)>:
you can try it out in the online repl right now <https://replit.com/@theangryepicbanana/redjs#index.js>

[16:33:05](#h22H6jfOt_ESwF5_iGoyDnoBmL3mI9KewXUWWLR-s4M) <ALANVF (theangryepicbanana)>:
 * you can try it out in the online repl right now https://replit.com/@theangryepicbanana/redjs

## 3-Oct-2023

[12:03:28](#CjK8sgLewKzywqVhes1hqKYCLmf_Kj1tRzq0PsMdNUk) <dockimbel>:
ALANVF (theangryepicbanana): Is there a way to reun an external Red script from that REPL?

[12:03:35](#rrShobw55q0Og4F3EIM0cH90Fmd94R6rO4Pt1JqU628) <dockimbel>:
 * ALANVF (theangryepicbanana): Is there a way to run an external Red script from that REPL?

[19:37:51](#uaKaLiJ1ZFReEdN0OCeHGesUHvyEYY-Ssoa6seii27I) <ALANVF (theangryepicbanana)>:
> <@dockimbel-556597ad15522ed4b3e10020:gitter.im> ALANVF (theangryepicbanana): Is there a way to run an external Red script from that REPL?

No not yet unfortunately. Given given that it runs in a container, uploading any sort of file for it to run would be difficult

[19:39:03](#h0SPnPTr4JyxVXzWGZqygAAC3gC2cfB51D_dh5C2vfg) <ALANVF (theangryepicbanana)>:
> <@dockimbel-556597ad15522ed4b3e10020:gitter.im> ALANVF (theangryepicbanana): Is there a way to run an external Red script from that REPL?

 * No not yet unfortunately. Given that it runs in a container, uploading any sort of file for it to run would be difficult

[19:39:04](#DmYMMkOZFQt7Kq6OfX3IhDa_PNd_3qayIm_xb7dJmfY) <ALANVF (theangryepicbanana)>:
I would like to support it eventually though

[23:00:18](#jWdGLhndg_FKlgm99T3TYvVnjtZJ-UzhxjVdsvQReio) <pekr (Petr Krenzelok) (@pekr:matrix.org)>:
ALANVF (theangryepicbanana): not uploading, just doing a script from remote URL?

[23:14:22](#LGCCHg41kj6XYT7VcUdFAVf3Q6hBWfLmn4gzDGqmMHE) <ALANVF (theangryepicbanana)>:
> <@pekr:matrix.org> ALANVF (theangryepicbanana): not uploading, just doing a script from remote URL?

I might be able to do that, I'll see what I can do here in a bit

## 4-Oct-2023

[1:10:48](#Jl4nPR3Jl495L7T6_cMAYUM9HquS46SyLo0FPPSxc7s) <ALANVF (theangryepicbanana)>:
pekr (Petr Krenzelok): unfortunately, reading urls in nodejs is a massive pain in the ass and would require me to change the fundamental structure of my codebase 

[1:11:32](#T14nvt8vDTT8fRRKpaMQfbDUCAZuRGjHoXTzVnUxUvc) <ALANVF (theangryepicbanana)>:
this feature could still be available when using Red.js on the web, but nodejs (js without the web browser, which is how the repl runs) is not an option at the moment

[1:32:58](#7DSvvujdshf2f5A3A2oOCr7l4a5clpNNMgZ8CablCYs) <ALANVF (theangryepicbanana)>:
actually nevermind, I found a very stupid workaround that works for now lol

[1:33:26](#8knWRNs5P6M9e7HYcRDX3gzg1pqavZ7DbX8DTDrx8io) <ALANVF (theangryepicbanana)>:
(spawn a process, call `curl <url>`, get stdout, then eval)

[2:42:07](#A5Vl96sA9BxFbkwoWRqJVp1o4TBEjZWi8cZ_Q8CsL88) <ALANVF (theangryepicbanana)>:
Alright, you can now run Red files in Red.js via `do <url>`, and it's now live in the repl for you to try out https://replit.com/@theangryepicbanana/redjs

[2:42:42](#YQaWnhVqC7-Ez2JL3SXyaxnzU7RAXpqJznziYHY3UQ0) <ALANVF (theangryepicbanana)>:
I also fixed some issues with existing natives, and added `all`, `any`, and `prin` (which existed but weren't added for some reason)

[5:15:57](#k4hjlT_VCGCFnXVetuGiHIxCOmMMmtDWsER0mVcJ3I0) <pekr (Petr Krenzelok) (@pekr:matrix.org)>:
Perfect :-)

[5:16:17](#ShNjV7Exm-_0bOnvenr0K0RIdshifGUwtwtDY_oisNE) <ALANVF (theangryepicbanana)>:
Good to hear

[5:16:59](#ieDGeCAjD09QBIG5XXDcetOhdDE_4IY_swNSN6O_4zk) <ALANVF (theangryepicbanana)>:
Do note that Red.js still has some missing features (there are no mezz functions for example) so not every thing will work just yet

[22:52:47](#PCML_zyEOPAsytVJ6wa31tLu_qK8LMGbW4FVJpa-fIE) <greggirwin (Gregg Irwin)>:
:+1:.

[22:53:05](#tW6X2AI29OJetZIwPK0lvqaVE-4cIXza_r2OuHj_b7Y) <greggirwin (Gregg Irwin)>:
 * Ì†ΩÌ±çÔ∏è.

## 9-Oct-2023

[16:34:06](#965wdOvyfySCl-4jKCXkqbrkpi41PPyteyyzIHhHt64) <ALANVF (theangryepicbanana)>:
I have finally implemented the new `apply` native and the new refinement features (with get-word), as well as fixing some existing bugs with functions

[16:34:28](#onRbrlcGAF1aW3-HYV9pmrhV1kYvGGuQHXuvVDZxguE) <ALANVF (theangryepicbanana)>:
it's currently live in the online repl if you want to try it out

[17:45:07](#9sliF7TvTyFwnmOuoHEbOe0apkHEz1WXIWmK_IRcyyI) <greggirwin (Gregg Irwin)>:
Nice!

## 11-Oct-2023

[17:30:26](#HUAdLkYqt4ikf8gIl9PujruUXaQfLlK6K8YQB0mGn6U) <ALANVF (theangryepicbanana)>:
Actions for word types have now been added (string->word is not available yet sorry, need to rework the parser)

[17:31:41](#A22wXCDInhM6kNHEq_KfAqV19Bc3BNQb4TAWxJXtV5g) <ALANVF (theangryepicbanana)>:
I think next I'm going to try rounding out some of the missing series actions, and then get started on implementing Parse

[17:31:56](#EO8dq5SSXyX5DGd_3o56Xs2wnZrAUrTAzRKE-QMCHPc) <ALANVF (theangryepicbanana)>:
 * I think next I'm going to try rounding out some of the missing series actions, redo the parser a bit, and then get started on implementing Parse

[17:33:02](#I8glLmWoEd1MacaP_K40iBsL4VnoOZpylK6F3M_Lqew) <ALANVF (theangryepicbanana)>:
getting Parse added means that I can start including most of Red's mezz functions, and opens up more possibilities for Red.js usage

## 15-Oct-2023

[23:33:07](#91ffcEuCn7yXxM7iDp9sRSnKont56XjG20--0ZPb3_s) <ALANVF (theangryepicbanana)>:
I've now added several more `series!` actions: `change`, `move`, `remove`, and `trim`

[23:34:19](#VHkmfJ4C1mRy_5ZdHFzd79pYB5ScZ2AwfKbNFfOovoA) <ALANVF (theangryepicbanana)>:
(`change` might be buggy, but I'm not touching that crap again lol (see my comments in red/help for context))

[23:35:31](#dn4hTFS23md3RogfZJQ1BwR9KGXp2xE0bkxzYgSo890) <ALANVF (theangryepicbanana)>:
I'm planning to work on search-related actions like `sort`, `find`, `select`, and `put` next

## 17-Oct-2023

[4:36:36](#VOGJ4fU9m1k_cU_K1r3wi9mxJ9Onciz5jysl4uJij5g) <ALANVF (theangryepicbanana)>:
ok so I finally have find/select/put/sort done for block-based series

[4:36:45](#J7ixcxSvs6cFRDxQsmaO2TxA7bblUHmyWEyIX3mrZCI) <ALANVF (theangryepicbanana)>:
but holy cow are these impls extensive

[4:37:03](#7ggexqZ2BAUoPfD_OQfG-ZP033dUZEVbSS0R7SLVA3k) <ALANVF (theangryepicbanana)>:
`_string/find` alone is 300 lines of code and I get to work on that one next

[4:37:56](#C_RctnslRzjEusPNoPhmigfm0F96UGh0d_00oH36bFU) <ALANVF (theangryepicbanana)>:
for most of these I would just write my own impls, but things like searching and sorting should ideally have equal behavior across both Red and Red.js

[15:30:48](#oY6TczLuxyPvYjrzlSlz_CuWql_x0tMc8T3WsuVy0J4) <greggirwin (Gregg Irwin)>:
Yes, they are large, but powerful.

## 20-Oct-2023

[4:59:55](#xsZfSDtoH2yQGUUDmXZ1cD9g5SrFS2VQUsIIY3S0thg) <ALANVF (theangryepicbanana)>:
I've now added the `find`, `select`, `put`, and `sort` actions

[5:00:23](#XgZnYjVuPdRGOK36WoncZ_ar6jxul-n1eX02f0dx6eI) <ALANVF (theangryepicbanana)>:
(`sort` might be a bit buggy, please lmk if you encounter any weird behavior)

[5:02:14](#n0Vqyz_VvDg0ygaPKJ5C9yYYTNgJ2i9PrLcaUtxMgXk) <ALANVF (theangryepicbanana)>:
I'm now planning to work on the parser and improve it, and then try to implement some unfinished datatypes like `money!`, and `vector!`

## 22-Oct-2023

[4:03:23](#0hesYNBx0azevvRC_pwiQ78LxkXtL7JXpdQ5HbhP0k0) <ALANVF (theangryepicbanana)>:
The new parser is now out, and I've added `to <datatype> <string>` functionality that was previously left out

[4:04:22](#wHQd36tyVBCKisqLwYH1-7BWsmTbW8NM7DidkTZ2kpc) <ALANVF (theangryepicbanana)>:
the new parser is also faster than the old one, though not terribly noticeably I don't think (now using native js regex & no string copying)

[4:04:45](#6AjRHConcjXIKGuIBFHSl4OErfGZNXDsWoD_Q-YdAdE) <ALANVF (theangryepicbanana)>:
and I've also added back support for `money!` (though still not implemented) and `email!` parsing, as they used to cause severe slowdowns in parsing due to the old parsing method

## 23-Oct-2023

[18:38:41](#nCD0e9IwUShZsSm63wSHghxLO9iLekexP8_cUNv57II) <greggirwin (Gregg Irwin)>:
Nice to see continued progress ALANVF (theangryepicbanana) . Ì†ΩÌ±çÔ∏è

## 27-Oct-2023

[8:03:56](#03RCY3aX12NELYYWFkqSgQOSEKF5qH8Q6rbDMmmmzgI) <ALANVF (theangryepicbanana)>:
Hey, I've now (mostly) fully implemented the `money!` type in Red.js

[8:04:44](#W-yS764FksBCoJyMOigUn-mTrGWza6z8grI_DpuCg5o) <ALANVF (theangryepicbanana)>:
unlike Red, this uses a dec64 implementation that I ported from my dec64 impl that I wrote in Nim for my personal language Star

[8:05:29](#PFJcIy1WT_eiLGvYjwgTMwZyZbn_xRJsWQUo3QxluNQ) <ALANVF (theangryepicbanana)>:
dec64 is decently faster than the method Red is using, and it's a lot more flexible too

[8:06:16](#K-9nyURBdUu1A73T-cJ4JWc-vsf-pZH3Or7WLx7XQcY) <ALANVF (theangryepicbanana)>:
division operations still have some inaccuracies due to weird js behavior, but I'm planning to fix that in the future (it ideally shouldn't be an issue for now)

[8:06:27](#XAcHVLM4ZIVAIrsi2s1woGn91Y_-cvoJV3UeafUviM0) <ALANVF (theangryepicbanana)>:
 * division operations occasionally still have some inaccuracies due to weird js behavior, but I'm planning to fix that in the future (it ideally shouldn't be an issue for now)

[8:07:08](#GwZimHUSFLttqksxLbnMjQlMK4wPC2gkSFnD-NznU-w) <ALANVF (theangryepicbanana)>:
anyways, it's now available to use in the online repl

[8:08:39](#gDNP5XvSchxZ8VIaqMqXL1O58dd97RWFeUGbWVAF9Jo) <ALANVF (theangryepicbanana)>:
The next thing I plan to implement are likely maps, followed by dates and vectors, so look forward to that

[19:36:20](#GUds_rkIfVFrcufeuYIn15g5r7XyDhXXM6vy7MvRrmk) <greggirwin (Gregg Irwin)>:
Ì†ΩÌ±çÔ∏è.

[19:37:49](#HnMuMwEqwFol2HfuFCW68sIuhxxoNAic7VtJgaVkgP8) <greggirwin (Gregg Irwin)>:
We were going to try Dec64 for Red's as well, but no 64-bit slot to use, so it would have been limited to Dec-32 range, which wasn't enough. I really hoped we'd be able to just binary include Crockford's ASM version for Dec64 support. Still hopeful for that feature in general.

[19:38:53](#bVM8EfGk8gVdGet_KBMPB7shlOqquo0ewdM8T67UX7E) <ALANVF (theangryepicbanana)>:
yeah once Red gets 64-bit, I would also recommend moving to dec64 for the money type, and maybe even a separate (general-purpose) decimal type

[19:39:28](#mfMSlD49mXpGyin4CC_oARz3WwKiTMRveM9vE5CHw4o) <greggirwin (Gregg Irwin)>:
My thought as well.

## 28-Oct-2023

[2:41:30](#e5LSmtLQL3evj36TmJVRA_KNhdQS2VIFtgjnyZr1e0w) <ALANVF (theangryepicbanana)>:
I've now implemented the `map!` type in Red.js

[2:42:20](#AF-gnlhUD2fjv0LGB3MvRrne99PcpZYQUo-MJWJjU2c) <ALANVF (theangryepicbanana)>:
it even has all possible actions implemented (because it was pretty easy to do, thankfully)

[18:28:34](#KKLgEy0GJb2lp7vIsXY2TZLWT03uVE7Btc2Wd9RYMLM) <greggirwin (Gregg Irwin)>:
More good progress. Ì†ΩÌ±çÔ∏è

[18:51:10](#vVQVqbdYHAxsWJ1zJaWH4lgbgzpCJV7eaHnd-HdCwx8) <rebolek (Boleslav B≈ôezovsk√Ω)>:
ALANVF (theangryepicbanana): your progress is very fast, I'm really impressed. What features are missing?

[20:49:39](#7cGWHrsEa9TqnL72Ch75wwBJbYK2YKm1GMLc1FAIse8) <ALANVF (theangryepicbanana)>:
> <@rebolek-5565a4bf15522ed4b3e100bc:gitter.im> ALANVF (theangryepicbanana): your progress is very fast, I'm really impressed. What features are missing?

The big ones right now are vectors/dates and Parse, but there are still several natives and actions that aren't fully implemented yet either

[20:49:57](#JcVBQQT_ZaJcaLXMYWNGT9SX-N3sFIknUlDZjeUz-Y8) <ALANVF (theangryepicbanana)>:
> <@rebolek-5565a4bf15522ed4b3e100bc:gitter.im> ALANVF (theangryepicbanana): your progress is very fast, I'm really impressed. What features are missing?

 * The big ones right now are vectors/dates and Parse, but there are also still several natives and actions that aren't fully implemented yet either

[20:53:06](#5VYrE4LSq6pFaqsEFGK8TbmzcXgJH6Vukty6_IwBbOo) <ALANVF (theangryepicbanana)>:
after that, I'll likely spend a bit of time trying to optimize and rewrite older parts of the codebase (since I've been working on red.js for a while now), and then make it portable enough to release it as a package on npm

[20:54:47](#rVZ0HduJbY23fRvGClAoFaioiWMWxthXvT9Bu0k-o3g) <ALANVF (theangryepicbanana)>:
* after that, I'll likely spend a bit of time trying to optimize and rewrite older parts of the codebase (since I've been working on red.js for a while now), and then make it portable enough to release it as a package on npm (including a js interface and typescript types)

[22:05:32](#sIOONGFNI1qLyUryXVqvC8ctFGw7A5Vu6fmp62hKmGY) <ALANVF (theangryepicbanana)>:
Ah, I do also need to implement errors correctly. At the moment, I'm just throwing undescriptive js errors

[22:05:47](#Gu5g8PzuqMTLbYerHhElLkGXuE-yoLzx861ccn6H-8Q) <ALANVF (theangryepicbanana)>:
* Ah, I do also need to implement errors correctly. At the moment, I'm just throwing nondescriptive js errors

[22:05:59](#A3croH1frr9wePZKjm6rlQyDbbixHyfhr1CcDe7LFaA) <ALANVF (theangryepicbanana)>:
* Ah, I do also need to implement errors correctly. At the moment, I'm just throwing unhelpful js errors

## 29-Oct-2023

[0:37:49](#36yM-jTeXAubYXCMm3mQKSh7SAXeXydsiSj290gvhm4) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@alanvf-5ebb41e5d73408ce4fe38f2e:gitter.im> Ah, I do also need to implement errors correctly. At the moment, I'm just throwing unhelpful js errors

You have already done a lot

[0:38:21](#Bs3dG_adC_mZMfa4iffYElOX8d0zU0-_L5aWmUjTYng) <ALANVF (theangryepicbanana)>:
Thanks, I'm just doing what I enjoy :)

[0:39:36](#tJ9atC70YfpqyZBmhm2xnx5fDuuzOjnX9et9PYxPZNE) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@alanvf-5ebb41e5d73408ce4fe38f2e:gitter.im> Thanks, I'm just doing what I enjoy :)

I know that feeling, recently I am doing the same 

## 1-Nov-2023

[14:14:11](#uIMOxMe9Vf4V1k0bmNlCMAuCQm5AFJzxDoQOCqU5qeE) <dockimbel>:
> <@alanvf-5ebb41e5d73408ce4fe38f2e:gitter.im> dec64 is decently faster than the method Red is using, and it's a lot more flexible too

What about the silent math errors? I remember addition errors with quite low numbers in dec32. Can't find online those limits for dec64.

[14:14:44](#pDHdVYCgAEHFXuDnJx3t72vehlwbqzADfHe0QmkQF5Y) <ALANVF (theangryepicbanana)>:
yeah I had a discussion about that with some people on discord

[14:15:20](#9JOz_aApjaZpF-5xuJAzgzebkiL8ByPXFJMWtNpQQxo) <ALANVF (theangryepicbanana)>:
after doing more research on dec64, it's probably not a great option for any serious numerical work

[14:15:30](#dV7sJpQhaCdWj7LTnjtXSF8JGOMkSZEca96Iy7IUMvw) <dockimbel>:
> <@alanvf-5ebb41e5d73408ce4fe38f2e:gitter.im> dec64 is decently faster than the method Red is using, and it's a lot more flexible too

 * What about the silent math errors? I remember addition errors with shockingly low numbers in dec32. Can't find online those limits for dec64.

[14:15:49](#uVdpWWZ8UUfa7zX6qTi6QeqGFlfhqFU71yxHliRbUXM) <ALANVF (theangryepicbanana)>:
several algorithms are just wrong, and a non-zero amount of them have a chance to never terminate

[14:17:09](#VLP73wlSqu2mLiihRrKS1a8p75VVwRJwoKkfq6UeauQ) <dockimbel>:
Do you know if any language out there adopted it?

[14:17:45](#7_uVJr7N-jkJobObg9DxW7k2i3PNu2Q8NmnOxtSpli4) <ALANVF (theangryepicbanana)>:
none that I know of other than my own language Star, which I now plan to switch to decimal64 (floating-point)

[14:18:16](#BxQHB4x3kL6U38Rpb6nRcD9r_iDYBXddl6frBDK_Ai4) <ALANVF (theangryepicbanana)>:
unfortunately there isn't a ton of research in this area

[14:19:36](#7iysfN0fAulht6To3PFAQaaYmPlUiLHsYRfKGZtZwnc) <ALANVF (theangryepicbanana)>:
most people are just used to floats, and when they need precision they usually just use BigDecimal-like impls or fixed point numbers 

[15:46:48](#5PcxW78XHEOAzf3ICNznOtBrVMzYhikkTs5kOMMbk9I) <greggirwin (Gregg Irwin)>:
Do you have references to the errors and design issues? Also, how do we define "serious numerical work"?

[16:12:51](#6zY2k7MQcZwP559gpPHDX7qx7w_JbZcXNoaUqmNy8QE) <ALANVF (theangryepicbanana)>:
> <@greggirwin-55659ddb15522ed4b3e1006f:gitter.im> Do you have references to the errors and design issues? Also, how do we define "serious numerical work"?

I can pull up the discord messages I suppose, but [here's an article to get started](https://web.archive.org/web/20201112011954/http://blog.aventine.se/2014/03/09/a-silly-review-of-dec64.html)

[16:14:32](#PbMF_i0N_RthZAOkDkp43AB28zpaBjO_kDNfqXnVyfI) <ALANVF (theangryepicbanana)>:
as for "serious numerical work", I had been testing out the sqrt implementation, and discovered that for a case as simple as sqrt(16), it'll never terminate due to imprecision with large exponents, which I think is probably not good

[16:15:08](#YXzc-9-QTcMl9Vd66-tkRqd-rPCERQvsEfWe_DgqXt0) <ALANVF (theangryepicbanana)>:
there's also this https://github.com/douglascrockford/DEC64/issues/11

[16:17:11](#t_qv7MC2FOe4uvFt0xnIETGx7_z-p13GzGuh6OLTOFk) <ALANVF (theangryepicbanana)>:
the author's solution to it all seems to basically be "well my code is just a reference impl, any actual impl should have better code that actually works"

[16:24:36](#Ht_T64sb-4NP2sIiPu5QohpCmHB2z3fxv8fjetkJuz0) <greggirwin (Gregg Irwin)>:
Well, the author says it's a rant, and has their own bias. i.e. use binary floating point. But we know that has serious issues with some basic math, right? The second is life with early work. None of our code is complete or perfect either.

The key question is what do we use for accurate calcs with, e.g. money, because we CAN'T safely use floating point. The 96-bit model Ladislav built for Rebol? BCD? Fixed point? 

[16:25:02](#TkagljFGIGjXOolS0wZDuJ4EufU8Ri9kMt22GpnLCyo) <ALANVF (theangryepicbanana)>:
I think we should be fine for money

[16:25:22](#CTpBimSEnnyPCwCbwnF-KH2NtDFAwYPSBZPmYAy0Z6E) <ALANVF (theangryepicbanana)>:
especially since money will theoretically be using small exponents

[16:26:21](#gqwxbknNhI9T_AKXeMiMlohDi0xXmPqFRo7jbnCLAqQ) <ALANVF (theangryepicbanana)>:
alternatively, we could just use fixed point, as all money values have a limit of 5 digits after the decimal

[16:27:20](#uwFZDyKOBdYzivybU6KcjqXUUJr1VjicJU77ujOmhdg) <ALANVF (theangryepicbanana)>:
we could also use rebol's solution, although I have no experience or knowledge of it

[16:27:21](#C-a15eOmecM4X7dwZaDUxGXS2Syk1IjoPgdKpRTjduE) <hiiamboris>:
except for crypto :)

[16:27:25](#6udQvOP_IgzD390oAR6iHMfW_M2bv8ypvsUxxuaWkGE) <greggirwin (Gregg Irwin)>:
I don't know how crypto will play out in the future, but it needs to support more than 5 decimal places, should we care about that.

[16:27:32](#1CgtO4PuOQ7qA8esc2UWRfDEQh62c790MG22Zkvhtk0) <ALANVF (theangryepicbanana)>:
true

[16:27:39](#XTwz9RZTtWbUx94jdtHFHb2DZvU5UVO86PvPf_JYLew) <greggirwin (Gregg Irwin)>:
<Grrr> I typed more hiiamboris. :^)

[16:27:43](#QP4XsGnZVuK4AgwYlTp6MpP0K9r5TPJ4TeAXaPfoESw) <hiiamboris>:
haha

[16:27:57](#gMnL5gQ7jqIJ8gclEY6eKG2Vl_xYEOZti3cYzeQYGYg) <ALANVF (theangryepicbanana)>:
I wonder what .NET's decimal type uses?

[16:28:09](#0irT6bZu2K282uef65hBzlYX19l1x2kuJiYoUN1TM8Y) <ALANVF (theangryepicbanana)>:
maybe that would be worth looking into

[16:28:29](#f8DcCSJM7C1XdHfyCG4hQTfbRht_F_aDUShejTRJ0xI) <ALANVF (theangryepicbanana)>:
* maybe that would be worth looking into as well

[16:29:26](#nwCMZb3733s2Dg03OPh93zBPF7gqJZ0JEgg1T3dwWOU) <ALANVF (theangryepicbanana)>:
alternatively, we could spend the time to figure out how to fix dec64, although I personally think that would be a waste of time

[16:30:13](#OCMN5q8wUBBuNCyA8KCtYznbfdwWKW6fzYRREFouNIk) <hiiamboris>:
I would also think it's a waste because it won't be supported in hardware, no chance

[16:30:21](#KiumZQ1Xz_O5XspzdQzF6_HeLGRCTvNZKq0cj1lZ178) <ALANVF (theangryepicbanana)>:
yeah

[16:30:34](#oq4CErF3e-FDdt9DgnkJ76HnnAvar6oag0ASLTWdVA4) <ALANVF (theangryepicbanana)>:
either way, it's still fundamentally slower

[16:30:47](#6n43HdOj-e03hynxkZfTHnS9ooxQo7RwaYmydtR1Wqk) <ALANVF (theangryepicbanana)>:
the article I linked says it outright

[16:31:46](#2BcQcZNzwIrMQzkNNh1J65caVxd9wU2sv8mjiOwxM-4) <ALANVF (theangryepicbanana)>:
I think our best bet for now is rebol's impl or fixed-point, and then it can be changed in the future if we come across a better solution 

[16:32:56](#eXJwYkC2RhYIJoyrQfMxbIAtgBRJ5o2Edcv484NXT0Y) <ALANVF (theangryepicbanana)>:
(as a side note, I've been advised by my brother (an expert in numeric representations and impls) thar BCD would not be a good option for a variety of reasons)

[16:33:12](#HZR59j7-r8L0vomdA_NiebyFIWVhlKyi2FjVK3rk7ZY) <ALANVF (theangryepicbanana)>:
* (as a side note, I've been advised by my brother (an expert in numeric representations and impls) that BCD would not be a good option for a variety of reasons)

[16:34:01](#Bw81h1-hTBwAeN_gJ0FkPRJv5Ml-KwikWqeYLQ48tFY) <hiiamboris>:
one key note here is that money implementation may be significantly simpler than general purpose number, because it doesn't need trig or roots support (and why we have our own type right now)

[16:34:42](#wNV4ma9l9IJyXdpSH8Ur4WCTftHvXpq7wHP_41punkQ) <hiiamboris>:
I also wondered why they chose BCD for it, never got an answer

[16:34:58](#ix9wHESXOz7zhvHeAODnm7AH7v_Iqf0ELzgTEKakxgE) <ALANVF (theangryepicbanana)>:
right, which is why I said that dec64 is probably fine for now

[16:35:11](#6aXQ8hMbpPXb0PxB7qOgzk0rxasVZujJPoynTwBbC-I) <ALANVF (theangryepicbanana)>:
until things need scaled up for crypto, etc

[16:36:11](#HcJ7awaq2Vr9p0I4LHQpnqm7kRlxy5Xd4peXdkSMUG8) <ALANVF (theangryepicbanana)>:
but I personally don't think it's worth trying to implement it in R/S because it's not useful outside of being a placeholder anyways

[16:36:44](#0hZ0I2pz6-ZS3Wy3Izal7kLk8UsdFaDcv7Lbbqa9xDw) <ALANVF (theangryepicbanana)>:
R/S already uses a different solution, so it'll just be a placeholder for Red.js' impl

[17:05:52](#_W42F7DbfBM4lKTh4eD0ti7a-mCLlKs5UScIVdo3rY8) <greggirwin (Gregg Irwin)>:
My thought was based on the hope that we could include the machine code of Crockford's ASM version. Why does it matter if it's done in hardware or not? All we care about is whether it produces correct results and is fast enough for expected use cases.

[17:07:34](#GnSPzeaCFody25ym7c4_Xw9tVTM9_oNfA7QY8h-8eUA) <ALANVF (theangryepicbanana)>:
which is still an option, but ideally not a permanent one

[17:08:51](#KazR3xBUWe3wXQ7LlJ4_Wjfo2Xugk60IDDNuucEkMJc) <ALANVF (theangryepicbanana)>:
we've already established that even basic math is imprecise with larger exponents/numbers, so once we want to do something like support crypto, that'll be an issue

[17:09:58](#-QP2gom9DnaN3f6DAV82fbAU58l6pkUCNKd54GsP67Y) <ALANVF (theangryepicbanana)>:
I think the best long-term option is to just use fixed point with arbitrary precision ints or something 

[17:10:34](#NDPpV8MfcgRL4g_gIR4F4YyPsSs-Ftw6tIU6ol6Jpws) <ALANVF (theangryepicbanana)>:
* I think the best long-term option is to just use fixed-point with arbitrary precision ints or something

## 14-Nov-2023

[7:59:14](#Flvn3FnxHInlL0yC7qM31xALKmzLiLeOo-P-OIqAW9o) <ALANVF (theangryepicbanana)>:
Hey y'all, I likely won't be able to work on red.js for the next 1-2 months (possibly indefinitely) due to a major issue that's developed in my wrists

[8:00:36](#zjkehthxF8jilZBL0rIc6eaOUfIAJIgqqsye40ByxvA) <ALANVF (theangryepicbanana)>:
I don't want to go into a ton of detail, but I'll be getting some tests done and be seeing a specialist about it soonish

[8:01:45](#MFIvWrEykbRZif4JeyOqXX5zwXFPXn281TZJvCuypYM) <ALANVF (theangryepicbanana)>:
I'll try to finish up adding proper `date!` support, but then that'll be all for a while

[8:44:58](#qK9feR2EO8Q-QDC9RIr2838tiLR2o6BNwBfWQnHurQY) <rebolek (Boleslav B≈ôezovsk√Ω)>:
That's sad to read. Ì†ΩÌ∏ü I hope you get well soon! And thanks for all your great work!

[11:29:46](#BpeLjb80zs9CKxYrJQKZBE8wvDFzpCFffbnU0yFDcEE) <GiuseppeChillemi (GiuseppeChillemi)>:
It's not a terribile news, there are solutions. https://images.app.goo.gl/sNJvtjLEoHLY7rQp7

[15:36:01](#GIjdwNoAv2ApRsQuwmprHoLtDPITzak_bj_mUuZ2eZY) <endo64>:
Hope you get well soon ALANVF (theangryepicbanana) 
Simple exercises of cubital tunnel syndrome were very good for my hand and wrist, it could relief even if you don't have.

[20:45:51](#84IAl3zwESrVRoNrW5LWK8d6qOivFgpZnl-W1wn8R1k) <ALANVF (theangryepicbanana)>:
> <@endo64-556ed0ce15522ed4b3e157ed:gitter.im> Hope you get well soon ALANVF (theangryepicbanana) 
> Simple exercises of cubital tunnel syndrome were very good for my hand and wrist, it could relief even if you don't have.

unfortunately, this is not like carpel tunnel or anything similar (well, anymore at least). We're not sure what it is, but there's a good chance that it's severe nerve damage

[20:46:53](#_6h0axKV_EcTt3Cz9WPZ8fzI1XL-uEuGOGYmU8h-LeM) <ALANVF (theangryepicbanana)>:
thanks you all for your kind words though 

[20:50:11](#D915COuMxkgZfTPA6Pm3Mktd0MCNDjL3-iO3fUWVrGk) <hiiamboris>:
have loss of sensitivity?

[20:51:11](#tOvQZ8NyZiDgz1xs83iIfqzA_d0szbNDi5QGZT1BwdQ) <ALANVF (theangryepicbanana)>:
Weakness of grip and strength, as well as constant pain, especially when I try moving my fingers

[20:51:50](#L7KX20vJLAsR5zPWOYaTBBV3ip7TtKabStgYOqrEeyI) <ALANVF (theangryepicbanana)>:
* Weakness of grip and strength, as well as constant pain throughout my hand and wrist (sometimes up to my elbow), especially when I try moving my fingers

[20:52:22](#eqgqiQEAJZI9dwrSOCHYdknUrMnmLjY3aXfz5-lFpZQ) <hiiamboris>:
probably not a damage yet

[21:04:07](#vrTbJuGie9GrgErgefGQR7rAGh8qfdw0b-BEZBs9ovo) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@alanvf-5ebb41e5d73408ce4fe38f2e:gitter.im> unfortunately, this is not like carpel tunnel or anything similar (well, anymore at least). We're not sure what it is, but there's a good chance that it's severe nerve damage

What has caused this?

[21:06:51](#0KAxNzwmAwwYYvSPDEQ_n8cU5qZs_G0KVJ1PRuv-VF0) <ALANVF (theangryepicbanana)>:
Not sure. I initially damaged my wrist a year and a half ago by overexerting my wrists by playing too much rhythm games, however I went to PT and it was mostly fine for about a year

[21:07:46](#l0yaLsdGlaHahISy0diF8sU9zvupdjQI9umGwjqZJTw) <ALANVF (theangryepicbanana)>:
then a few months ago, I woke up with shooting pain in both hands/wrists, and it was diagnosed as carpel tunnel, but I have now confirmed that it's not that

[21:09:58](#eaSvv9aj1vNGBmg1vZEqnMI8z2BM8gNTet2AeHYlsbc) <ALANVF (theangryepicbanana)>:
* Not sure. I initially damaged my wrist a year and a half ago by overexerting my wrists by playing too much rhythm games (they are often very wrist/hand intensive), however I went to PT and it was mostly fine for about a year

## 15-Nov-2023

[19:55:59](#AB74y8C8XVomuO81jRtTO1XrOaEu9ujZ15MSsslnIR0) <greggirwin (Gregg Irwin)>:
Feel better ALANVF (theangryepicbanana) . Take care of yourself.

## 5-Jan-2024

[9:41:29](#2OVcvmcw2KOSH4he3Cp7kjpXnC5bg7nYw9MrgDMJ1mM) <ALANVF (theangryepicbanana)>:
Hi y'all, due to some new controversial changes by Replit, the Red.js repl is currently no longer runnable without logging in and cloning the project

[9:41:58](#n_xsw_jl03jMv5Ziv7AUDft-l4xlIyIdYzI1vVf9PqM) <ALANVF (theangryepicbanana)>:
I'm currently looking for an alternative solution, but for now that's unfortunately the situation 

[9:52:01](#yNQEqGTaBCkWl-W_Ys5DaoZVty9fZmXfGBZ7Sdi9u-I) <ALANVF (theangryepicbanana)>:
(and for those curious, I'm _still_ waiting to get in contact with a neurologist for my wrist issues Ì†ΩÌ∏≠)

[15:52:09](#QBTSUu7g0F4Lzfe9S9F-huPXmxQG5YtchAAz3UZqb1s) <endo64>:
I hope you get better soon Ì†ΩÌπè

[16:14:47](#ZFQ_SJPyQyF40nQeAPz0ZqMq9y4b9vI04zTA1-Ft02M) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@alanvf-5ebb41e5d73408ce4fe38f2e:gitter.im> (and for those curious, I'm _still_ waiting to get in contact with a neurologist for my wrist issues Ì†ΩÌ∏≠)

I thought It was resolved. It's a base problem and I pray you will find a solution soon 

[16:15:16](#D2HW79h0Of-shX2CNiRYdIn6AcsJQhwdaJnu6_0fHfA) <GiuseppeChillemi (GiuseppeChillemi)>:
*bad problem

[17:59:34](#IuF-TsptkZ56e34B2HpF5pmyfU1zR0wqrSt18qeCN2Y) <greggirwin (Gregg Irwin)>:
Thanks for the update ALANVF (theangryepicbanana).

[22:02:13](#2z0c3SJm4evz1C0ZyyNHmRs4YXf59x_E2clRZ6fEXJ4) <Boum69 (Boum69)>:
I hope that your wrist will be no more painful very soon. Be brave and patient Ì†ΩÌπè

## 6-Jan-2024

[8:51:53](#X_dV3Fd1YR0A50a3-A53r3FEHFdnLwdB4kCfgCMIia4) <hiiamboris>:
One friend of mine told me that he abandoned the healing practice when he saw the beauty of illnesses and the choice to be ill. To quote, "Illness is an indicator of controversy in human, and it can help him find the controversy. Removing illness without solving the controversy is only a temporary patch".

[9:02:40](#_lcLDWRM5Q6dCkWZsZrUUfY7YEzFSFwTAle3y9J2saY) <ALANVF (theangryepicbanana)>:
Unfortunately, ignoring this issue has only made it worse

[9:03:26](#fM0mgYSDElW3VsdlEyyuCDFIWWQIUsn9tOXw3jv8TX8) <ALANVF (theangryepicbanana)>:
I assure you that you would not choose to be ill like I have for the past 2 years if you were in my shoes

[9:17:53](#G6zTHmUJnWNU0iXThnSsXx7lbv-q8pFwPbC_a999ssM) <hiiamboris>:
Yes, ignoring issues makes them worse. One doesn't get ill in the first place unless some controversy is being ignored for a long time. And no, he wasn't talking of the *conscious* choice. 95% of choices people make they aren't aware of.

[18:25:10](#F-5lbAIwVI1doU3f6R0heDE26vdv3rMOiY26P4kyCiw) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@alanvf-5ebb41e5d73408ce4fe38f2e:gitter.im> Unfortunately, ignoring this issue has only made it worse

You if don't find a solution or the cause, I could try to contact the local community of neurologists asking for help.

[21:48:32](#AMyU_Xq8THb6-cFD0Jbd9_cncHuxHv7_q-zR5A6H0JM) <ALANVF (theangryepicbanana)>:
Nah it's fine. It's really just a case of finding somebody who accepts our weird insurance, which is unfortunately quite difficult here in the us

[22:04:52](#l0fkd7MJtsd0YvftIIjH22GWRtMbDGG03zTFFcaDjy8) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@alanvf-5ebb41e5d73408ce4fe38f2e:gitter.im> Nah it's fine. It's really just a case of finding somebody who accepts our weird insurance, which is unfortunately quite difficult here in the us

I can't read that you can't cure yourself because of insurance. It's a terrible thing.

## 6-Feb-2024

[23:32:09](#Z8oORbJPHx3EFYDyGuELbS9bVCKKRwFMeA1i_OD8igw) <GiuseppeChillemi (GiuseppeChillemi)>:
ALANVF (theangryepicbanana): Hi, how are things going?

[23:33:50](#Cvuh_oDBJ_fhHwF7GWxIuAMVy0R3UU_Ubbj6GiE1L4c) <ALANVF (theangryepicbanana)>:
well it could be better

[23:34:38](#1HyhwCXvEjGO_4xIKfM0gtISbwVNWRsCdujv5ImeL8c) <ALANVF (theangryepicbanana)>:
aside from the fact that I'm currently sick, we think we have a(n unofficial) diagnosis which is even worse than what I'd thought before: fibromyalgia 

[23:36:19](#q4Ona3S_5xzOsYfUvR3ncJos6G3OZpeq1kU04MEV32w) <ALANVF (theangryepicbanana)>:
and if that is in fact the case, it's incurable and I get to live with it the rest of my life, making coding much harder

[23:36:56](#K5osvlj9bzVwGzUoLKXl56AE3uBlT3Mm8pl6AnwXPZY) <ALANVF (theangryepicbanana)>:
* aside from the fact that I'm currently sick, we think we have a(n unofficial) diagnosis which is even worse than what I'd thought before: fibromyalgia (all of its side effects line up with the symptoms I've been having)

[23:38:58](#fg69QTwGkuYsP3SQLY5gxzFQxB597-tRjyCFJRMphdc) <ALANVF (theangryepicbanana)>:
mind you I'm only 20, so I somehow managed to beat all the odds if that is the case

## 7-Feb-2024

[4:18:13](#zJY7D09OkFAuX370FgI4iLP9BOuDhClM4ZEyUCaVfs0) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@alanvf-5ebb41e5d73408ce4fe38f2e:gitter.im> mind you I'm only 20, so I somehow managed to beat all the odds if that is the case

You are luky. You live in the era of AI. Give science a couple of years and It will generate code with your instrucutions. Also, low brain impulse will be captured you you won't have to move a muscle, just think about doing It.

[4:19:16](#HrOfXJb5B3A0nUB8ZQTRt79yZOFNe0cPYegsRhKb4mQ) <GiuseppeChillemi (GiuseppeChillemi)>:
This of this medical condition developed in a 20 years old of 1890... or earlier...

[4:19:32](#7RAxh2e0GpGjOdiW3uaolK-TbxRkzPt7_eH461JLDnE) <GiuseppeChillemi (GiuseppeChillemi)>:
* Think if this medical condition developed in a 20 years old of 1890... or earlier...

[4:21:13](#IHxlCpP6vRJuSTyxOhKCxEYFRaGwA30Sa_lcKhFhfK0) <GiuseppeChillemi (GiuseppeChillemi)>:
I suppose you will find also medication and other therapies to mitigate the pain. Now you have a name and you can fight or dance with It 

[5:09:10](#YG-qBGjtcjX4mJEO13xJt6Q_SDH39rYJL7CRoA-TJ0k) <greggirwin (Gregg Irwin)>:
"Fight or dance with it" I like this way of looking at life's challenges.

## 5-Mar-2024

[3:51:36](#EmJfqN6hb6vbti4pkMcNIYmhkNEbUX-kM25k3pZ4CAY) <ALANVF (theangryepicbanana)>:
A bit of an update: I finally have a treatment plan in place for my original health issues (colon problems), although I unfortunately still can't code due to my wrist issues

[4:15:09](#HazCVf3e-c8wM3mK6cpnGakCHxYu3LzkQN_HUFoDCgw) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@alanvf-5ebb41e5d73408ce4fe38f2e:gitter.im> A bit of an update: I finally have a treatment plan in place for my original health issues (colon problems), although I unfortunately still can't code due to my wrist issues

Thanks for the update. I have had a vision that everything could be caused by heavy stress and anxiety

[20:24:05](#JjduUHKzX3pVf9UhJm5k913hg6Nzn5ae7AVuGIFRpt8) <greggirwin (Gregg Irwin)>:
Best wishes.

## 26-Apr-2024

[4:01:52](#NQFIqpuudZgjBoU8dSQsGWUGF3cCuYyrqGoA7JkhpaU) <ALANVF (theangryepicbanana)>:
I got a diagnosis for my wrist problems today, apparently called cubital tunnel https://en.m.wikipedia.org/wiki/Cubital_tunnel

[4:02:36](#qZnA76WvwaeFCS33SqflY3rQrkeBYM6WHPIDaaaqx78) <ALANVF (theangryepicbanana)>:
gonna be getting some medication for it soon that should help with the pain until I can get proper treatment, so I'll hopefully be able to start on development again soon

[18:15:40](#cxTzHvRcGB0ZXARXgpaHoZHgU9uWQ_T83uD0NLPvKwE) <endo64>:
I told you ALANVF (theangryepicbanana)  (https://matrix.to/#/!DeAPnTriRVWboJgoNA:gitter.im/$GIjdwNoAv2ApRsQuwmprHoLtDPITzak_bj_mUuZ2eZY?via=gitter.im&via=tchncs.de&via=matrix.org) it looks like cubital tunnel.
There are a few simple exercises that really helps to relieve the pain, you can find them online.

I hope you get well very soon!

[19:54:31](#V3bauyHbwed1jWqYnvyh9Vn0NGmW2NN_WoJMpSRk0Uk) <ALANVF (theangryepicbanana)>:
> <@endo64-556ed0ce15522ed4b3e157ed:gitter.im> I told you ALANVF (theangryepicbanana)  (https://matrix.to/#/!DeAPnTriRVWboJgoNA:gitter.im/$GIjdwNoAv2ApRsQuwmprHoLtDPITzak_bj_mUuZ2eZY?via=gitter.im&via=tchncs.de&via=matrix.org) it looks like cubital tunnel.
> There are a few simple exercises that really helps to relieve the pain, you can find them online.
> 
> I hope you get well very soon!

haha yeah in hindsight this was definitely it, but I wasn't sure and wanted to see what all the possible options were lol

[23:15:26](#wPmT3qBPO46ptzLG9rABwxLWuBhLIAxocyw80XB6IQg) <greggirwin (Gregg Irwin)>:
Get well soon Alan.

## 6-Aug-2024

[3:49:39](#1QCMMvyCT3glxMu9v_WWflv3or0gVe4-XySVovAgJV0) <ALANVF (theangryepicbanana)>:
Hi y'all, I'm now on medication for my wrists and even though it isn't perfect (may need surgery sometime soon) I might be able to get back to coding again

[3:50:45](#ZysbCdST8B4KQybtvV2s79IALUPZLLuOKPN13ly49Ic) <ALANVF (theangryepicbanana)>:
I'm planning to finish up the `date!` stuff I had been working on previously, and then bring various language and stdlib features up to date with normal red

[3:50:59](#y4eNzavxN4IdNVbpbAwnN6FAiBv8RNDsyfeRaLt-Id8) <ALANVF (theangryepicbanana)>:
* Hi y'all, I'm now on medication for my wrists and even though it isn't perfect (may need surgery sometime soon) I might be able to get back to coding again here in a few weeks

[5:33:05](#f3xXgJfnWkKZ8fJmE8ZZWgWAoVecszPZq1yEvH5p4Rk) <greggirwin (Gregg Irwin)>:
Thanks for the update. Keep getting better. Your wrists have to last you a long time.

[13:03:26](#EANfkDgpv5dfKBXb_7JMsq0Vnxgjv-uZoCOAAVwwxo4) <GiuseppeChillemi (GiuseppeChillemi)>:
Nice but there is no need to hurry

[15:03:25](#_Y1KiID0LQ9eRWyGB9QuD5hAm_29aNqNU9ZdLTxzuHU) <endo64>:
Wow, I didn't know that it is that bad. Get well soon! Thanks for the update.

## 6-Sep-2024

[4:55:18](#2NMen_3POxuKOLBcpSzmszET2AwZ6OEnUMDUduHajsw) <ALANVF (theangryepicbanana)>:
![](https://gitter.ems.host/_matrix/media/v3/download/gitter.im/5b7d2429f33975346656050805ead6104220c20f1831919078218924032)

[4:55:19](#3mVreeoYJ69mbimNmUO14ERCeJhorbI6qf6wyLyeHbU) <ALANVF (theangryepicbanana)>:
After a bit of waiting, `date!` values and functionality have now been added!

[4:55:51](#HA7Zc9Mzh6yAOzuAnjfmZ9sCa8tH0nqim-FNyrrWDZQ) <ALANVF (theangryepicbanana)>:
there's still a bit that's not working quite well (which I'll figure out some other time lol), but it should work for most stuff

## 20-Sep-2024

[20:32:48](#u8Xx4vT3jDAHN94wN5wDxe5gIIV0J9LioMB0gemaGbU) <ALANVF (theangryepicbanana)>:
Just had some arm surgery today that I've been looking forward to which went well, however apparently I have an extra muscle in my elbows that helped cause these wrist issues in the first place

[20:33:17](#w0JfQnUZIe10oS8BLG6p67kVYAauSKPX6cgTWvsbn74) <ALANVF (theangryepicbanana)>:
Kind of amusing, but nobody could have possibly known beforehand lol

[21:42:05](#MZKRmt_lRrT6tbyzfmowpssXkNF4yoN8EJ2wA5PpHcI) <GiuseppeChillemi (GiuseppeChillemi)>:
[Voice message.ogg](https://gitter.ems.host/_matrix/media/v3/download/gitter.im/986df26382db37eb7169f9b5969de9156cf62b441837245872551755776)

[21:42:30](#MteG_WgEjfVwmd-DMlp_InrxD3k3EPaTS2hmr4gK3Xk) <GiuseppeChillemi (GiuseppeChillemi)>:
Do you hear me? 

[21:42:33](#tqaD6zuG9AKnROyxj8xo_DygLfAgZpLNFSlOAo5fOoE) <ALANVF (theangryepicbanana)>:
Yeah

[21:42:40](#d520mFvecLJ5npFyDLkOk6TBSkXMNaxreq-OaeI8I3c) <ALANVF (theangryepicbanana)>:
Thanks

[21:42:42](#KKOW7z_xslUck01W1qCku11LkijecKNZ0wwKxQw2pOA) <GiuseppeChillemi (GiuseppeChillemi)>:
Fantastic! 

[21:43:03](#ZYo4jXB09fzzkJWft6DLnfYt4C0KpdcWpeiJSAjVtwI) <GiuseppeChillemi (GiuseppeChillemi)>:
I am really happy for you

[21:43:11](#sRPIOTMqMRuCnCKwaLS2LZdgNJtHtMhjAERdjMWzF9U) <ALANVF (theangryepicbanana)>:
Thanks a bunch

[21:43:25](#RHWltceZDf5ARtrvj42rYwv78-lk4zl4jl-LENn7bEk) <ALANVF (theangryepicbanana)>:
I'll probably get the other arm done sometime next month or early November

[21:44:30](#wZ-jW7XTn759IioJEOca5xAbN2hOzC4co2kWOreAanA) <GiuseppeChillemi (GiuseppeChillemi)>:
You need only time and patience

[21:44:41](#6qqagjtPJcM83CNuZUNsUSEwcjiis22Qe6J8udUDOS4) <ALANVF (theangryepicbanana)>:
Yeah right

[21:44:51](#GOEQoAxeui8RbJbAv7Z2tQL9pQ4MfHynmecRvQGh4-s) <ALANVF (theangryepicbanana)>:
In the meantime, I'm working on an online repl for red.js 

[21:45:06](#gmC2mythzrQkk1FZYLU8Qeg_C8E8m3Gpyqf4YIg2NQY) <ALANVF (theangryepicbanana)>:
Will likely be hosted on cloudflare pages

[21:46:16](#Cm4wWBa0BRZzihAo6e8iqtROdDLlbbKpVGk1eBm7lK8) <ALANVF (theangryepicbanana)>:
And it may also be ready to publish as an npm package soon

## 21-Sep-2024

[2:17:50](#sOMIU_FUy2FXDxWio8mrCr7SNX5LkieqDFXmNs_69dM) <greggirwin (Gregg Irwin)>:
That's great. But why are you typing the day of your surgery? ;^) Heal quickly.

[2:18:14](#NJk50Fw4J7elYQUbvwjj3_iXyDB-6MzrT2QoeT3Jz3c) <ALANVF (theangryepicbanana)>:
I'm one arm today, the other is still fine ;)

[2:18:50](#KFSZmZwPXdgom3WEhz9pfmRvMsH7jLyh0eiblobpnak) <ALANVF (theangryepicbanana)>:
But yeah I'll be taking a break to heal for the next week or two

[2:19:30](#n1G9AWIPjZcLLiUwvSxafABhm9RntwbtMpC_a6zRjl0) <ALANVF (theangryepicbanana)>:
* I had only one arm done today, the other is still fine ;)

## 15-Mar-2025

[19:13:58](#aLjVIldvoRuwm4l34N4HpmjJK5e6HN4-SQ1gfqWFl_8) <ALANVF (theangryepicbanana)>:
hi y'all, I know it's been a while but I'm finally back to coding (back on adhd meds + wrists are healing). currently working on a web repl for red.js to make it more accessible to those who don't want to compile the project themselves 

[19:14:04](#c5PjGRu5GyPj2LLXuhhUQC7rWcbphyFZuwYhKKF7xfg) <ALANVF (theangryepicbanana)>:
![https://gitter.ems.host/_matrix/media/v3/download/gitter.im/df4137880bd824c4d332e3ef3c8e95dd3677c2471900988885660336128](https://gitter.ems.host/_matrix/media/v3/download/gitter.im/f8a57b1a2cfb77fbfbf5ccb4c511479b7764de611900988888118198272)

[19:14:50](#G-FMzq5ejpBRGCmq0oFpESOUAkl8fchp6HVOln2w9WI) <ALANVF (theangryepicbanana)>:
I'm also hoping to release red.js as a node library sometime in the near future, as I've already started work on an external js api

[19:15:28](#RYcvlpsn0Aq4Ebb2tztfHPdHS7HbE-xZxAaMPSBA9vQ) <ALANVF (theangryepicbanana)>:
unsure where the site will be hosted, but probably github pages or vercel

[19:54:39](#1Pf8Pl19i-dqwIhwXEkISSHndlM6Cuf8x2KY9jr7guQ) <ALANVF (theangryepicbanana)>:
I now have a basic version of it live via github pages: https://alanvf.github.io/Red.js/

[19:54:47](#o81AWSAzgglxxO5KWcloWAvyCpKSHSIh4uFl6DwS8Ts) <ALANVF (theangryepicbanana)>:
it should theoretically also work on mobile

[20:36:08](#GoxCYcvV4yH73fe6mfx4bOxlsFR3qW3ku3Ap-ME1hYM) <ALANVF (theangryepicbanana)>:
Oh I should also mention that since I haven't worked on it in a while, there may be some parity (behavior differences) issues from changes to regular Red since then. If you run across any, please lmk!

[21:42:47](#8i6nVD0MVr07QgUUs4lQ4RykTEQq1E3x4yBiVwON9Ro) <greggirwin (Gregg Irwin)>:
Good progress, and glad you're doing better.

[21:44:31](#pUNQL20aeaT4XbETjjJrNUMRDXLP5FkdbJVfKnTPsaU) <greggirwin (Gregg Irwin)>:
The REPL works! Will try to test more at some point.
```
>> print 'xxx
Word `xxx` doesn't exist!
>> print "xxx"
xxx
>> print ['xxx]
xxx 
>> print mold ['xxx]
Error while parsing block! at [1:0]
>> mold [xxx]
== "[xxx]"
>> print mold [xxx]
[xxx]
```

[21:50:05](#ce-6IbYxUwBBD1ggepnV1yqGX7x-atEdntX6aySTwhg) <ALANVF (theangryepicbanana)>:
ahh I think that I screwed up my impl of print somehow.. although I can't reproduce the block parsing error so that's fun

[21:50:32](#2Gp0Q6NKXdwBq7kG1Rw9Vv9aGWM4Bt2pf8joshJ40KQ) <greggirwin (Gregg Irwin)>:
It's still a working REPL, whiich is *great*.

[21:50:55](#oliJZwMqDbzeJ2i_Uh1KPnYWEiJSQwmLzAe580C2jnE) <ALANVF (theangryepicbanana)>:
yeah and I had to make it from scratch as xterm.js doesn't have readline support...

[21:51:13](#7qbL_7Ao-a5OWuOWgZJByYvmi0BxgDC8aseJJKdtA3w) <ALANVF (theangryepicbanana)>:
hoping to add history functionality soon, but yeah this is a great start I think

[22:01:05](#4lBmmdYGETjzjVbRH-dnj1LD284AkGRHm9u_K3Z0lgk) <ALANVF (theangryepicbanana)>:
should be fixed now Ì†ΩÌ±çÔ∏è

[22:01:13](#PK0QsA4gYyIqRm_wPwdYUdhXadJ-4Wk-iKkxKOb14lU) <ALANVF (theangryepicbanana)>:
no clue how I never noticed that lol

## 25-Mar-2025

[20:04:01](#Jaic8_ZoDrnCB3-DoF3Y-nVmPaZjPA3JBD7JsYwMyzw) <ALANVF (theangryepicbanana)>:
Just pushed a small fix for a newlines issue when printing multiline values (like objects)

[20:04:12](#J7KDnr9GEQsF1exRCFEcsVmHDztV9jBjyzkeWTYQeJs) <ALANVF (theangryepicbanana)>:
* Just pushed a small fix to the website for a newlines issue when printing multiline values (like objects)

[20:05:09](#QLZDTQS5CLj9m37tP3kyOEjjckwCeVhqzgZKnVBVvHI) <ALANVF (theangryepicbanana)>:
semi-related, would a mod/admin be able to change the "try it out" link in the channel description with the new github pages one?

## 26-Mar-2025

[21:26:33](#-nMVQxzK0UF23hK-nwPZE6NzYQh0SEc9LNQYAL2cjIA) <greggirwin (Gregg Irwin)>:
Done.

[21:26:58](#FyX5dV4WfcMA3FZhoHMnOIhV4TsTFdy6D-uhfnomkTo) <ALANVF (theangryepicbanana)>:
awesome, thanks Ì†ΩÌ±ç

## 24-Apr-2025

[23:51:26](#DhmEiGXWGUGanQrsq8yk8MV_TyXU1rJq44etuC2-qyU) <ALANVF (theangryepicbanana)>:
![https://gitter.ems.host/_matrix/media/v3/download/gitter.im/5a8e58bc39195c68098f7ec4170a208a3cce46551915554201212026880](https://gitter.ems.host/_matrix/media/v3/download/gitter.im/061f6ed315ee48cbc027efff26fad87da71cb9621915554203556642816)

[23:51:27](#LMpT60R-YnT4QW_cIvd_9Ihq_FLwYMpWEgruUfj9bw0) <ALANVF (theangryepicbanana)>:
currently working on this

[23:51:52](#9pVXidnvzB-ShdDCBseMEBEOeAobzZYt-aIP01tYFUw) <ALANVF (theangryepicbanana)>:
the ability to add custom js functions into red.js

[23:52:34](#_tpkCU4UHvwwU4LSpbF5G2zJScSkH1NUcYWvdmPPJU8) <ALANVF (theangryepicbanana)>:
useful for any programs (using red.js as a library) that may want to add custom stuff

## 25-Apr-2025

[0:43:39](#EJlZN3g_tnki_cIJO7eAMCH2Exxo-0njlD_RAd5l-iM) <GiuseppeChillemi (GiuseppeChillemi)>:
Red Native or Web Console?

[0:44:36](#CGyVjgdS-4kVwMO4XUB0yVFG2mIFljwK2ZPgvC0kAl8) <ALANVF (theangryepicbanana)>:
This screenshot is using native nodejs, but it also works running on the web

