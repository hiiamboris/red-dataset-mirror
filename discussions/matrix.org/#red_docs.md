# Archived messages from: https://app.gitter.im/#/room/#red_docs:gitter.im (https://app.gitter.im/#/room/!uxgDoTWOulbOtFgFJG:gitter.im)

## 31-Dec-2020

[21:28:00](#fqC6WPDZyCbHGJ9S8kk_Zg_ci7LTdHmn5Hx9cC_pDAc) <gltewalt (Greg T)>:
It was an eye-opener to see someone record themselves trying to use the docs that are present. 

[21:28:03](#8UNK9PHzFs6cwUWfN1adVQgNCFkFcMWFxWI4gKsxi-E) <gltewalt (Greg T)>:
I did a lot of things wrong

[21:28:10](#Jd5Sz0xDY9XBzp6-cDxJWgNOb98eLmVMQwd0qGWOFBQ) <gltewalt (Greg T)>:
https://youtu.be/HDMa4gcgEgI

[21:31:38](#OwVakhwOGniQ718Vk4l9C2OUJnkRmNQpyrYhAZirXWw) <gltewalt (Greg T)>:
You can save `what` to an html file replacing line breaks with <p>, but descriptions are truncated at a certain length

[21:41:25](#kZumgh2GWqmxpAiZ4wQcl2WQ53ABvdYXuhlP7Rpn99A) <greggirwin (Gregg Irwin)>:
This came up some time back. We can improve things, and having better search is key, but a lot of this is on the user. Coming from other langs is hard, and I still want to have a "Red for X programmers"  series. A quick intro for common tasks would also be good. 

[21:45:26](#HsRRmat9UpzY57tpYPwQFELroTLqArdmYoKNJ3HbGfk) <greggirwin (Gregg Irwin)>:
Watching it again, and he notes this himself, he's just banging around *really fast*.  

Having examples at the bottom of datatype pages, e.g. for actions, could help too.

[21:47:17](#TiqTRnyKFx2Kp3vSKijuaZLe7rQkSJBrI7pI7RZqjmU) <greggirwin (Gregg Irwin)>:
Maybe add some text above the action/func area to note what actions are, because `read, write` was right there and he just didn't know what it was.

[21:51:19](#yfL0GGDn-vARcS6UGHhczdnY7NwwC8PlXdDpZtZ0ezg) <greggirwin (Gregg Irwin)>:
I do love his reactions when things work. It's valuable feedback for us.

[21:53:05](#-TlYX7PJm4pmwtGdd-QluMUJR8P0CZn5JLqpi4PANxY) <greggirwin (Gregg Irwin)>:
`See Also:` links are also good to have. Lots of work to do. 

[22:05:59](#bAVOpmv8dcEixwjFGwLkoVjzf7Qpeh13zYlPHFUiUUw) <gltewalt (Greg T)>:
Easiest:
`write %RedWords.adoc what/buffer`

[22:07:04](#zvzFtxd1YSheey0MrCDG_Vbc-n1kIkiF3CD5zsktbV4) <gltewalt (Greg T)>:
Yes, I should have made links to the descriptions of the words instead of just plain text

[22:08:13](#02rCcYW9LhEs522l6NgVwbfHiPcmaPY32MHAHHKvxUY) <gltewalt (Greg T)>:
And apparently not evident that the console and help (should?) be the first stop

[22:09:15](#Jm4A5v2BkA_x0D0lrosiQYX8GalOOuXsOBtsuNsS9pI) <greggirwin (Gregg Irwin)>:
We just keep improving. Let's plan a small primer, which hits basic tasks new users will want to accomplish. 

[22:09:20](#UNa-v8vcBSKh0XJqkIcmhg0noTb-qFNkfF6gYR1Jc5U) <gltewalt (Greg T)>:
Having not looked back in yet, have you guys settled on asciidoc or markdown?

[22:10:20](#tw10p0gwft-0z88ZX-qa4RCgTGDvLx83R5K61UKCoFY) <greggirwin (Gregg Irwin)>:
It's all ADOC now.

[22:10:58](#48i1Q9EXzqlAFeOG5a6RC27jtAT3dq_CzZ5H2uvD2os) <greggirwin (Gregg Irwin)>:
And because of issues with github pages, it's just the raw repo, until we revisit @x8x's work, which would be a nicer official landing point for docs.

## 1-Jan-2021

[0:05:05](#q-enaNOg26R2IhwR7yxMGwhpvKqXc-EY6UbU--nptBI) <gltewalt (Greg T)>:
Can you think of a list of common tasks?

[19:50:52](#rzACjewLxaogpnVPWdxhgK1TMaraC0q2CVOPGW8ZfQU) <greggirwin (Gregg Irwin)>:
Let's start one. We can use wiki page, you can I can prime it, and we can post on the main channels for others to contribute.

## 4-Jan-2021

[1:45:15](#gOGfOIRr8InA6hNqRJDae8zQsGFKf2ChBSU6hhBMpvM) <gltewalt (Greg T)>:
Humbly ask for your additions to a "common tasks" list that I've started in the Wiki.

https://github.com/red/red/wiki/%5BHOWTO%5D-How-Do-I-Do-X-with-Red%3F

[1:48:25](#8nLtSyv7SYgb_zctMCgz139A1d-zrOmInMYoXoLvd9U) <gltewalt (Greg T)>:
Humbly ask for your additions to a "common tasks" list that I've started in the Wiki.

https://github.com/red/red/wiki/%5BHOWTO%5D-How-Do-I-Do-X-with-Red%3F

[2:51:24](#-5hYCRsD3_DoSMcnok_VVg9b8i9gJgHIaAlWjf1dl2k) <greggirwin (Gregg Irwin)>:
I made a list at the bottom. One of the keys to helping people find answers is using language they know. Then we can teach them our nomenclature. e.g. we think of reading URLs, but the rest of the world things of making HTTP requests.

[8:52:59](#hR3AuUcOW55cLZ_8QT5EVyVteL7YmKoGw2P3Pe5nm4Q) <mikeparr (mikeparr)>:
@gltewalt   as regards tasks, there is some  Red material in the Rosetta Code site at https://rosettacode.org/wiki/Category:Red    This site lets readers investigate tasks in a range of languages.  Some of the tasks are bigger than we want here, I think, but some are small - e.g. read a file

[14:54:57](#_TPv0rR4T8XALrGt-tqJqnzrfQEiouVso0lDIkIuY70) <gltewalt (Greg T)>:
Ah, ok

[19:49:27](#EjjhiUukJm3PJ62b-Ooq771sCTV-p4BH-32MfEowKOY) <greggirwin (Gregg Irwin)>:
We have RC in our advocacy list. Filling in entries there is valuable as well.

## 12-Jan-2021

[9:29:01](#o_6duXRWH_jpaf1s3kGCMtpjwM-X0ap9k9wTKrDO9Do) <meijeru (Rudolf Meijer)>:
I have submitted an issue on `refinement.adoc`which is part of a more general difficulty with the `all-word!`literals. @toomasv pointed out that my treatment in the spec document is now seriously flawed, because the specs for `any-word!` vs `issue!` and `refinement!` literals have significantly diverged. This is now a question of balancing the desire for allowing as much variety as possible, vs. consistency and ease of remembering. If one spells out the allowed characters in detail for each of the types, it becomes painfully obvious (e.g. `##` is allowed, but `/#` is not, `#,` is not allowed, but `/,` is ).

[16:48:15](#3k5CxOrVun4o_1rHIhcvB9ZlYLw53x6yVuMz3sQqqRM) <greggirwin (Gregg Irwin)>:
Thanks @meijeru. 

## 13-Jan-2021

[10:38:39](#ZyVxPfObvnXEmy_sar1v8ooL4NCuxhhU_q0noZD6Bow) <loziniak (Maciej ≈Åozi≈Ñski)>:
Perhaps a "Getting help" paragraph would be nice to have in this HOWTO?

[11:30:31](#nIW0gts5Rs3EttfVjrni5Eq8HAyWUo252vgAUXzUSrI) <meijeru (Rudolf Meijer)>:
This is now the spec of `<issue-literal>` as deduced from the lexer FSM:
``` 
An `<issue-literal>` consists of `#` followed by a sequence of one or more characters.
It is delimited by end-of-text, whitespace, semicolon, or any character from the set `[ ] ( ) { } " < @` .
Note that any of `[ ( { "` preceded by `#` introduces a (grouped) value of another type than `issue!`.

Restrictions: `/` is only allowed as first character of the sequence, while `<` `>` and `,` are only allowed if they are *not* the first character.
Also, the combinations `<>` and `<‚Ä¶‚Äã>` with any characters in between the `<` and `>` character are not allowed anywhere in the sequence.
```
Is this what the designers wanted?

[11:31:05](#f4ZJ2GFj0Nw5vxHITgNpynj3Mg8i3-w6IimIQrSb0gg) <meijeru (Rudolf Meijer)>:
* This is now the spec of `<issue-literal>` as deduced from the lexer FSM:
``` 
An `<issue-literal>` consists of `#` followed by a sequence of one or more characters.
It is delimited by end-of-text, whitespace, semicolon, or any character from the set `[ ] ( ) { } " < @` .
Note that any of `[ ( { "` preceded by `#` introduces a (grouped) value of another type than `issue!`.

Restrictions: `/` is only allowed as first character of the sequence, while `<` `>` and `,`
are only allowed if they are *not* the first character.
Also, the combinations `<>` and `<‚Ä¶‚Äã>` with any characters in between the `<` and `>`
characters are not allowed anywhere in the sequence.
```
Is this what the designers wanted?

[11:31:50](#FO872ICO-GCupyDachIKLwlUu50-AdnvOpnFkX6qWlA) <meijeru (Rudolf Meijer)>:
* This is now the spec of `<issue-literal>` as deduced from the lexer FSM:
``` 
An `<issue-literal>` consists of `#` followed by a sequence of one or more characters.
It is delimited by end-of-text, whitespace, semicolon, or any character from the set `[ ] ( ) { } " < @` .
Note that any of `[ ( { "` preceded by `#` introduces a (grouped) value of another type than `issue!`.

Restrictions: `/` is only allowed as first character of the sequence, while `<` `>` and `,`
are only allowed if they are _not_ the first character.
Also, the combinations `<>` and `<‚Ä¶‚Äã>` with any characters in between the `<` and `>`
characters are not allowed anywhere in the sequence.
```
Is this what the designers wanted?

[11:32:29](#D4dM5yt0DNr6k_mJu_Fn14L64rUp65jRXga4rrdpWAw) <meijeru (Rudolf Meijer)>:
* This is now the spec of `<issue-literal>` as deduced from the lexer FSM:
``` 
An `<issue-literal>` consists of `#` followed by a sequence of one or more characters.
It is delimited by end-of-text, whitespace, semicolon, or any character from the set `[ ] ( ) { } " < @` .
Note that any of `[ ( { "` preceded by `#` introduces a (grouped) value of another type than `issue!`.

Restrictions: `/` is only allowed as first character of the sequence, while `<` `>` and `,`
are only allowed if they are *not* the first character.
Also, the combinations `<>` and `<‚Ä¶‚Äã>` with any characters in between the `<` and `>`
characters are not allowed anywhere in the sequence.
```
Is this what the designers wanted?

[11:37:20](#Enr-DXJcX6CipGPavi4Mk31O5IogyjubVol5TO372SM) <meijeru (Rudolf Meijer)>:
For instance, what use is the fact that `#/` is allowed but no other issue literal with `/` in it is allowed?

[11:38:57](#6d02Y4KQ2bMxtAOHmemdETvma16WhMGrEL99GwHh5XQ) <meijeru (Rudolf Meijer)>:
More to come on refinements later.

[13:26:14](#TqFbI4EtB6bXMipkf9Q7HA569AxiAkksR1I4N3dKFEA) <meijeru (Rudolf Meijer)>:
Here is my draft for `<refinement-literal>`
```
A `<refinement-literal>` consists of a `/` followed by a sequence of one or more characters,
 subject to the restrictions below. It is delimited by end-of-text, whitespace, semicolon, or any character from the set `[ ] ( ) { } " @ : /` subject to the exceptions below.

A `/` followed by one or more `/` and possibly further characters is not a `<refinement-literal>` but a `<word-literal>`. This is delimited by the above-mentioned delimiters and also by `#`. The same goes for a single `/` before any of these delimiters, except obviously `/`. See further <<word,section 5.2.5>>.
```


[13:27:24](#5sTTFkrwVlA2Bory8AjkuT_npyqMgt15XRprWITFjIs) <meijeru (Rudolf Meijer)>:
* Here is my draft for `<refinement-literal>`
```
A `<refinement-literal>` consists of a `/` followed by a sequence of one or more characters,
 It is delimited by end-of-text, whitespace, semicolon,
 or any character from the set `[ ] ( ) { } " @ : /` subject to the exceptions below.

A `/` followed by one or more `/` and possibly further characters is not
a `<refinement-literal>` but a `<word-literal>`. This is delimited by the above-mentioned
 delimiters and also by `#`. The same goes for a single `/` before any of these delimiters,
except obviously `/`. See further <<word,section 5.2.5>>.
```

[13:28:05](#lHvHGGFLE8NYDXHiyBJzZXAywbdjBPM_RSbo0zqKy-A) <meijeru (Rudolf Meijer)>:
I have also found an issue in refinement lexing.

[14:01:58](#yKlc40xiqj_lcafpyT301cR5bKz-yYC96ZcgPuNIfcU) <meijeru (Rudolf Meijer)>:
The issue is not an error but a confusing consequence of the spec: `//a/b` is a regular `path!` value since the path "head" `//a` is lexed as a word. I would guess that most people confronted with the question: is`//a/b` a valid Red value and what is its type?,  would have difficulty analyzing it. Or am I the only one?

[17:55:16](#ypMMGxU8kRKiW8mmh68SMHsthXa77SIXJ_Z70bMEuu4) <greggirwin (Gregg Irwin)>:
@loziniak do you want to take a crack at an intro for that page? Even just some TBD notes about what you'd like to see there would help.

[20:25:54](#qNjjcyLY1XC9PZyF5NxG_Gq-XXZzfpy8kuCKtA6038w) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
@meijeru in Rebol `//a` is an invalid construct... maybe it should be also in Red.

## 14-Jan-2021

[2:08:41](#-JEXYtbVwHXu9UBBolZBmG3RWjU68jpDHe6cToHplsY) <greggirwin (Gregg Irwin)>:
@meijeru I'm going to respond with thoughts, just can't do it quickly like some other things here, as you raise issues that require more thought.

[9:09:13](#uBZn4AlrpJPBgedX6_j5TN4mjZ563i_5ErBaRPgbDTA) <meijeru (Rudolf Meijer)>:
All I have done is put into words what the lexer FSM actually accepts. Whether that is to everybody's liking is indeed another matter. For the time being, I will update the spec document to reflect the current, rather messy, state. I doubt that, even after some modifications in the lexical space,  the spec will be able to go back to its current, rather neat formulation using `<symbol-literal>`. 

[9:10:07](#YMr7cAQlNYYRXdSBqWBV0WsKQMq4AHLOOegVM263zww) <meijeru (Rudolf Meijer)>:
* All I have done is put into words what the lexer FSM actually accepts. Whether that is to everybody's liking is indeed another matter. For the time being, I will update the spec document to reflect the current, rather messy, state. I doubt that, even after some modifications in the lexical space,  the spec will be able to go back to its original, rather neat formulation using `<symbol-literal>`. 

[9:10:47](#qmUSvdlGmW5mlFYE3q2EsjpVKTFfpIVE_twefR7y06w) <meijeru (Rudolf Meijer)>:
* For the time being, I will update the spec document to reflect the current, rather messy, state. I doubt that, even after some modifications in the lexical space,  the spec will be able to go back to its original, rather neat formulation using `<symbol-literal>`. 

[11:30:51](#m6YhX8ZWowSDhT0i0gEITQiFTLk1P-Z9qTmsH-TxZFs) <GiuseppeChillemi (GiuseppeChillemi)>:
I have read that `/a/b` is lexed as 2 refinements. I like the idea of *headless/rootless* paths to later join `WORD /a/b`and have `word/a/b`. This would make relative paths a breeze.

[11:39:24](#5FRXRfmeIHbKAbsD4CrIeNbPf6y1IeinLjnpYcEB35A) <GiuseppeChillemi (GiuseppeChillemi)>:
Also, while exploring "relative paths", really missed a way how to have the first word reduced like:

(a)/x

```
>> a: 'x
== x
>> x: [y z]
== [y z]
>> (a)/y
== /y
>> 
```


[11:39:35](#385OjxW7_5iU0UaZPZCs5bqE4GawIpo-fA-RQ1bO1Is) <GiuseppeChillemi (GiuseppeChillemi)>:
* Also, while exploring "relative paths", really missed a way how to have the first word reduced like:

`(a)/x`

```
>> a: 'x
== x
>> x: [y z]
== [y z]
>> (a)/y
== /y
>> 
```


[11:42:24](#DafvkMHLvEckB2J2HTf3CDKgFWBB3x4-t7DCSBpJS7I) <GiuseppeChillemi (GiuseppeChillemi)>:
Also this is not what I expect:
```
a: 'x
Rejoin [to-path a to-path /y]
== x//y
```

[11:42:41](#mr1YnREhb4_Ku3Kc_C4W_nMq_sJVF41HCm8fFHWrP3o) <GiuseppeChillemi (GiuseppeChillemi)>:
* Also this is not what I expect:
```
a: 'x
Rejoin [to-path a  /y]
== x//y
```

[11:42:49](#nyCGfQymHQ-95LkT2yue5B0k46-ktBB9D3AKbslDGG0) <GiuseppeChillemi (GiuseppeChillemi)>:
* Also this is not what I expect:
```
a: 'x
Rejoin [to-path a /y]
== x//y
```

[11:43:17](#x5ZaxpMZwNpchE61LwXALrewRHH6wTS-JcGyT2stoRs) <GiuseppeChillemi (GiuseppeChillemi)>:
I have expected `x/y` 

[11:44:13](#7bPlLO2fIptCqLF9lLftblgwfKvMETP20UMkBieiK90) <GiuseppeChillemi (GiuseppeChillemi)>:
* Also, while exploring "relative paths", really missed a way how to have the first word reduced like:

`(a)/x`

```
a: 'x
x: [y z]
(a)/y
== /y 
```


[11:46:20](#wAq7nkB_5WaVNkhhCIvXgvxcvTk8mD-i4VM0Gd7rAiA) <GiuseppeChillemi (GiuseppeChillemi)>:
* Also, while exploring "relative paths", I have really missed a way how to have the first word reduced like:

`(a)/x`

```
a: 'x
x: [y z]
(a)/y
== /y 
```


[11:46:55](#ynnHaQO_3COF2gj-H6d98MLHW8bC493ICBQIeaMiZ_Y) <GiuseppeChillemi (GiuseppeChillemi)>:
* Also, while exploring "relative paths", I have really missed a way how to have the first word reduced like:

`(a)/x` but Red does not allow it.

```
a: 'x
x: [y z]
(a)/y
== /y 
```


[11:47:09](#FDB1PDus1Z6ewMHGLM11KiX6EgsvYZ4gQuH_8Dm5_Ys) <GiuseppeChillemi (GiuseppeChillemi)>:
* Also, while exploring "relative paths", I have really missed a way how to have the first word reduced like:

`(a)/x` 
but Red does not allow it.

```
a: 'x
x: [y z]
(a)/y
== /y 
```


[11:53:30](#b4lOdZ-Wm6UJkCPdk4QKO2Hra5Xfjsb9t4N-ggKG_kY) <GiuseppeChillemi (GiuseppeChillemi)>:
Also this does not work:

```
x: [y [z ww]]
a: 'y/z
x/(a)
== none

>> x/y/z
== ww
```

[12:00:29](#xx-3gYXVaFxSYdHyuZpaAJLpTr6_Ao2qZxF0yqmWHjw) <GiuseppeChillemi (GiuseppeChillemi)>:
The whole application scenery would be to have the relative structure of a data object stored like this:

```
mystruct: [
   size: /heading/size
   body: /body
   extra: /footer/extra/
]
```

And accessed as `DATA/(mystruct/size)`

Or for full relativeness:

`(DATA/(mystruct/size)`


[12:00:48](#DO2eQ9vSr4yHeG0Z5gjXnFpjUYkCt_dcOjnLgAFG_cA) <GiuseppeChillemi (GiuseppeChillemi)>:
* The whole application scenery would be to have the relative structure of a data object stored like this:

```
mystruct: [
   size: /heading/size
   body: /body
   extra: /footer/extra/
]
```

And accessed as `DATA/(mystruct/size)`

Or for full relativeness:

`(DATA)/(mystruct/size)`


[12:01:57](#eK82-EVebPVejwyMtQsFTz3BKW1IaEGRtQRb41EK9yk) <GiuseppeChillemi (GiuseppeChillemi)>:
* The whole application scenery would be to have the relative structure of a data object stored like this:

```
mystruct: [
   size: /heading/size
   body: /body
   extra: /footer/extra/
]
```

And accessed as `DATA/(mystruct/size)`

Or for full relativeness of paths:

`(DATA)/(mystruct/size)`


[12:03:00](#J4NznZGog7TKesl4RONzGByPENWZxAgnLxfJk_gQ9C8) <GiuseppeChillemi (GiuseppeChillemi)>:
* The whole application scenery would be to have the relative structure of a data object stored like this:

```
mystruct: [
   size: /heading/size
   body: /body
   extra: /footer/extra/
]
```

So you can access the parts of your data building the path as follow: `DATA/(mystruct/size)`

Or for full relativeness of paths:

`(DATA)/(mystruct/size)`


[12:03:19](#0crKPV0oYgyEttwHhMA31E1DKk4pIVzNic5fQ_2PacQ) <GiuseppeChillemi (GiuseppeChillemi)>:
* The whole application scenery would be to have the relative structure of a data object stored like this:

```
mystruct: [
   size: /heading/size
   body: /body
   extra: /footer/extra/
]
```

So you can access the parts of your data building the path as follow: 
`DATA/(mystruct/size)`

Or for full relativeness of paths:

`(DATA)/(mystruct/size)`


[12:05:15](#WUC-yiuuzC3bhzOWtFnH79bYXCqqAIPa4F_UxeVWfwI) <GiuseppeChillemi (GiuseppeChillemi)>:
* The whole application scenery would be to have the relative structure of a data object stored like this:

```
mystruct: [
   size: /heading/size
   body: /body
   extra: /footer/extra/
]
```

So you can access the parts of your data building the path as follow: 
`DATA/(mystruct/size)`
Which would be reduced to:
`data/heading/size`
Or for full relativeness of paths:

`(DATA)/(mystruct/size)`


[14:20:53](#FfF-0iyJWWfRX6JswLwmbwpcVr_7SSlwg5V2SHr5gKU) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
`/a/b` would have to be a new datatype which now even don't have a name... or you would have to kill `refinement!` datatype like HF did in Ren-C and have `/a` as a `path!` (but that is a `block!` type, not a `word!` like `refinement!`)

[14:25:45](#CMhN98MrBoia3sHjX1ZpIAIzTI2HVnK6F_3Et4YNAKg) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
But to be honest... I don't think that having `/a` to be a path with length of 2 and actually using blocks in function specification in place of refinements as it is in Ren-C is a good way.

[14:26:15](#fQAsngpe7QrT2wNqDAyyAWauZrl980mwwbUkNCCrhJc) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* But to be honest... I don't think that having `/a` to be a path with length of 2 and actually using blocks in function specification in place of refinements as it is in Ren-C (now - it can be changed in any hour) is a good way.

[14:26:24](#E_V8Yplr8wAAEOWCIXHwcW82ALm6Bjw2CcdgIF9Mams) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Please, no. HF doesn't understand Rebol so he decided to rewrite it and with each change he finds out he did something wrong so he needs to change it later to even more arcane construct... Ren-C has no documentation because it can't. It's always a moving target, it's impossible to document it.

[14:26:55](#Matq6tTCty9D2WLXTdp_QXy1NFxAw-g06GXc8Y923Ek) <rebolek (Boleslav B≈ôezovsk√Ω)>:
@Oldes why do you think it makes sense?

[14:27:14](#0yRGo2fJankswBa4DR35f6Jyf-OWrLoIPSNsO8L1kyg) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Have I said that it makes sense?

[14:27:39](#6dYNXOhQTViYUetKeUVhnopp9__BK4yx9XxFK39_YxA) <rebolek (Boleslav B≈ôezovsk√Ω)>:
@Oldes Oh sorry, I read it as "I think"

[14:28:21](#M4Tb8ssYGmaVy4h1zT03o_yAfhT7C4e8HChF1dymjac) <rebolek (Boleslav B≈ôezovsk√Ω)>:
I need to use a bigger font I guess :)

[14:29:37](#FZ5GAuttKXUdu0JYUxbWx_nXvb9ot5itLghOzxS8rI4) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
@GiuseppeChillemi why you think that:
```
mystruct: [
   size: /heading/size
   body: /body
   extra: /footer/extra/
]
```
is better than:
```
mystruct: [
   size:  heading/size
   body:  body
   extra: footer/extra
]
```

[15:42:37](#fZiE4aKyE9IYqtLBVCxxG5gHpvQtkq8YWDKzyiqQDss) <GiuseppeChillemi (GiuseppeChillemi)>:
@Oldes No particular reason, just to have a way to identify it has a "path with a missing part"., but your are right, it would make no difference.
The most important part to me is the ability to use `()` on any segment of the path but actually we cant.
```
>> x: [y z [d r]]
== [y z [d r]]
>> x/('z/d)
== none
```

The notation `(WORD|PATH)/(WORD|PATH)` is a really powerful one to have an absolute flexibly on the selection of elements.

[15:42:56](#PRu3UtiYcPgYC0x4yJ8CtzsOiISKEYo3rYsPABPyCcQ) <GiuseppeChillemi (GiuseppeChillemi)>:
* @Oldes No particular reason, just to have a way to identify it has a "path with a missing part"., but your are right, it would make no difference.
The most important part to me is the ability to use `()` on any segment of the path but actually we cant.
```
>> x: [y z [d r]]
== [y z [d r]]
>> x/('z/d)
== none
```

The notation `(WORD|PATH)/(WORD|PATH)` is a very powerful one to have an absolute flexibly on the selection of elements.

[15:43:39](#3gdMW3VveMGF1vyBAFo2aIPWnStjYJUl39m-H--xDAQ) <GiuseppeChillemi (GiuseppeChillemi)>:
@greggirwin Do you think I could make a request?

[15:43:47](#WJXZijlUlkV7m1B69i2EX2MXU1m8Isb73A9o8ANETEY) <GiuseppeChillemi (GiuseppeChillemi)>:
* @greggirwin Do you think I could make a request for it?

[15:45:12](#6Q5z_-QZR5F-jFpaEcL9-WN860MTlL_aFuBLDAOWrIg) <GiuseppeChillemi (GiuseppeChillemi)>:
* @Oldes No particular reason, just to have a way to identify it has a "path with a missing part"., but your are right, it would make no difference!
The most important part to me is the ability to use `()` on any segment of the path but actually we cant.
```
>> x: [y z [d r]]
== [y z [d r]]
>> x/('z/d)
== none
```

The notation `(WORD|PATH)/(WORD|PATH)` is a very powerful one to have an absolute flexibly on the selection of elements.

[15:45:21](#rUwSiS6l8nCFtZZIV4DYBmUdOF5mLeUbBhnXfM4YwHE) <GiuseppeChillemi (GiuseppeChillemi)>:
* @Oldes No particular reason, just to have a way to identify it has a "path with a missing part"., but your are right, it would make no difference!
The most important part to me is the ability to use `()` on any segment of the path but actually we can't.
```
>> x: [y z [d r]]
== [y z [d r]]
>> x/('z/d)
== none
```

The notation `(WORD|PATH)/(WORD|PATH)` is a very powerful one to have an absolute flexibly on the selection of elements.

[15:47:34](#RBUs1KUutCEnKUbCoMEmyNBZWNXHo-jy0JrAGZHQIE8) <GiuseppeChillemi (GiuseppeChillemi)>:
* @Oldes No particular reason, just to have a way to identify it has a "path with a missing part", but your are right, it would make no difference!
The most important part to me is the ability to use `()` on any segment of the path but actually we can't.
```
>> x: [y z [d r]]
== [y z [d r]]
>> x/('z/d)
== none
```

The notation `(WORD|PATH)/(WORD|PATH)` is a very powerful one to have an absolute flexibly on the selection of elements.

[15:50:11](#tsxwqbo7Ge9KxKZ8yIMnx2WG1I0mnGYJw22zXX03J2U) <GiuseppeChillemi (GiuseppeChillemi)>:
* @Oldes No particular reason, just to have a way to identify it has a "path with a missing part", but *you are right*, it would make no difference!
The most important part to me is the ability to use `()` on any segment of the path but actually we can't.
```
>> x: [y z [d r]]
== [y z [d r]]
>> x/('z/d)
== none
```

The notation `(WORD|PATH)/(WORD|PATH)` is a very powerful one to have an absolute flexibly on the selection of elements.

[15:50:30](#th3iJ1zBE1ZAxEezPyTn_0o3U9Of1SiR9y4LsvylzrI) <GiuseppeChillemi (GiuseppeChillemi)>:
* @Oldes No particular reason, just to have a way to identify it has a "path with a missing part", but *you are right*, it would make no difference!
The most important part to me is the ability to use `()` on any segment of the path because actually we can't.
```
>> x: [y z [d r]]
== [y z [d r]]
>> x/('z/d)
== none
```

The notation `(WORD|PATH)/(WORD|PATH)` is a very powerful one to have an absolute flexibly on the selection of elements.

[15:54:29](#ce7NvKn9szhDETrbkgNmRYBqwjUmYdiFA969kU9LS5c) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
What you don't see is how expensive such a code is internally.. and also dangerous, if you do some complicated code inside the parenthesis. I remember how Carl was long time refusing to implement it in Rebol.

[15:59:31](#Dyb-I8ZxjxMm8dLY0wVDZA8Wv0znu_1Q25gIc12cJaE) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
You could also play with code like:
```
>> p: as path! [a b/c d]
== a/b/c/d
>> length? p
== 3
>> p/('b/c)
== d
```

[16:00:01](#-tMxvFHospvGvWyDB8aJ2-Ayen2g9jqb1Dhwg806uqI) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* You could also play with code like:
```
>> p: as path! [a b/c d]
== a/b/c/d
>> length? p
== 3
>> p/('b/c)
== d
>> to block! p
== [a b/c d]
```

[16:14:26](#Y5jch8bSqFZqnivDgKX356ndNPLaayjI090oWdaWcQQ) <GiuseppeChillemi (GiuseppeChillemi)>:
Oldes, I can see it and I can understand the fears you have but I use the `WORD/(code)` syntax every single day and believe me, it makes things a lot easier if properly used.  Allowing `(code)/(code)` in paths would give *extreme power* to this selector in all its simplicity.

[16:17:43](#DhEuUq3Iwk6dBOHvcUMD9PU5jQblBM64gS7BeK0_hTs) <GiuseppeChillemi (GiuseppeChillemi)>:
(A personal note, I consider this feature the second most powerful thing after parse).

[16:17:58](#-ZWKmSDKJOzKf_jicDPpjy9zALF_6JNaaS0iPlC347A) <GiuseppeChillemi (GiuseppeChillemi)>:
* (A personal note, I consider this feature the second most powerful thing after `parse`).

[16:22:30](#eHEVsnKyF0k0L_bsG4Pv8e-P6q1dc2qgHx7dOQ3rJvc) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
`(code)/(code)` is a nonsense... you would not be able to write `(1 + 1)/(2 * 2)`

[16:22:45](#NCVsWwb_03zIc3oK9Eg7ONcNcPKiZsKhQ5VuwedVRGc) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* `(code)/(code)` (as a path) is a nonsense... you would not be able to write `(1 + 1)/(2 * 2)`

[16:26:07](#KFD8xyzdVqWaXIUdt32bOJrCpmVCKhl3SzLltQdOJoY) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
And I don't have any fears Ì†ΩÌ∏â  I have nothing against `word/(index + 1)`. I was requesting it in Rebol to be implemented years ago... I just see also the dark sides. Occasionally. 

[16:26:09](#VuNl7lNOr3BD0jH_3djnddVcIoxyRa8HvyvzZO6mzBM) <GiuseppeChillemi (GiuseppeChillemi)>:
I see, but if there could be a solution, I think it's whort trying to find it.

[16:27:16](#PzqCKMx-dhl5MRrS2_DqlCoU4H4Upcik8g2FN2p4sVI) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Every solution has its price and sometimes the price is too high. But go ahead and make a wish Ì†ΩÌ∏â

[16:37:26](#qHFnEk9l7yGKGknzjad_DiLYuxIo239eoCua9IZSEY4) <GiuseppeChillemi (GiuseppeChillemi)>:
@Oldes 
> `(code)/(code)` (as a path) is a nonsense... you would not be able to write `(1 + 1)/(2 * 2)`

/(code)/(code) could be the road to this but how to make it without disturbing refineents Ì†ΩÌ∏â 
Also, I think it is now time to move elsewhere, I propose [red/red](https://gitter.im/red/red)

[16:37:51](#uMfzxhrsH3zJLidNQrSxB8tacA_jMmrRbWFuGquxNd0) <GiuseppeChillemi (GiuseppeChillemi)>:
* @Oldes 
> `(code)/(code)` (as a path) is a nonsense... you would not be able to write `(1 + 1)/(2 * 2)`

`/(code)/(code)` could be a road to this but how to make it without disturbing refineents ;-) 
Also, I think it is now time to move elsewhere, I propose [red/red](https://gitter.im/red/red)

[16:41:19](#KRkmiqe2uE6nMTtA3-0SLdtm_vAn0ymz5mzerTJA1Vs) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
I don't think it should be more discussed in chat.. write a wish and you get it refused most probably... `/(code)/(code)` is imho ugly even without long expressions and I don't see any real usage why it should complicate everything.

[16:44:54](#m7Xwa0o0Yp1kCym5F3E6vx9stkRW-f8RwuWkN2lw6JI) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Btw... If you want to feed your brain, you can start here: https://www.curecode.org/rebol3/ticket.rsp?id=2094

[17:53:00](#cXNX77LzfhWhl1dJNMY0KeJ4m8m6_s8brRwhc6IZ3Yw) <GiuseppeChillemi (GiuseppeChillemi)>:
@Oldes In fact it is not LONG and COMPLICATED CODE the target use but simple things like: `(word)/(idx)/(word-with-path)`. Nothing more simple and powerful than this!

[17:53:22](#9LUWcMwl5KtlsW19Ejqi3S5ogiiQD5v-CX8IFzq93w4) <GiuseppeChillemi (GiuseppeChillemi)>:
* @Oldes In fact it is not LONG and COMPLICATED CODE the target use but simple things like: `(word)/(idx)/(word-reduced-to-path)`. Nothing more simple and powerful than this!

[17:53:34](#-PeXXpFe-seZR5MfH7I7Nn50SQjLWKqRCS7TN-JNEtU) <GiuseppeChillemi (GiuseppeChillemi)>:
* @Oldes In fact it is not LONG and COMPLICATED CODE the target use but a simple things like: `(word)/(idx)/(word-reduced-to-path)`. Nothing more simple and powerful than this!

[17:53:40](#dUIS1YioJzd-A0wQC4jBeY3zGOCMwNZEuRk527kWm-o) <GiuseppeChillemi (GiuseppeChillemi)>:
* @Oldes In fact it is not LONG and COMPLICATED CODE the target use but a simple thing like: `(word)/(idx)/(word-reduced-to-path)`. Nothing more simple and powerful than this!

[17:54:19](#gETTsslWc5xc8I51qyi5mWOaf5N2aOA4f3miVqSKIFM) <GiuseppeChillemi (GiuseppeChillemi)>:
To the team, if they will like it, to find a way to do this. 

[17:54:57](#38oSkii-1wlTmQzXjV5uop549QSlo9GGik9-lVAyTXY) <GiuseppeChillemi (GiuseppeChillemi)>:
* To the Red team, if they will like it, to find a way to do this. 

[17:55:06](#KHk3QG0zXWK0jmb_ddaXfx5-6Fgorc4BkTKkI5Qk-18) <toomasv>:
@GiuseppeChillemi Why not make your local adjustments, something like:
```
>> path: function [a b][to path! append to block! a to block! b]
== func [a b][to path! append to block! a to block! b]
>> length? probe path 'a 'c
a/c
== 2
>> length? probe path 'a/b 'c
a/b/c
== 3
>> length? probe path 'a/b 'c/d
a/b/c/d
== 4
>> length? probe path 'a 'c/d
a/c/d
== 3
>> length? probe path 'a [c d]
a/c/d
== 3
>> length? probe path [a b] [c d]
a/b/c/d
== 4
```
Or go even further:
```
>> //: make op! Ì†ΩÌ∏õath
== make op! [[a b]]
>> [a b] // [c d]
== a/b/c/d
>> 'a // 'c/d
== a/c/d
>> 'a // (to path! [c d e f])
== a/c/d/e/f
```

[17:57:34](#7bd_GyVvEkc0SOxFIIffqvnBVlGxMk3Lazs2w8-ZeyA) <GiuseppeChillemi (GiuseppeChillemi)>:
Isn't `//` already used?

[17:58:53](#Le7bggEUmwxuujFIIyv1cIh0tNlRSs_B9fOiG9HFMYc) <toomasv>:
If you use mod, then yes, just add one mor `/`

[17:58:59](#HqJZwBhLkrcYAD9Y99v3an_9tW67CeE3l5iUcQ7S2EQ) <toomasv>:
* If you use mod, then yes, just add one more `/` :)

[17:59:02](#DEstQZQX6ByuZobJf-_jnDH_mQ_004ZPPRSr8L_byhg) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
@GiuseppeChillemi you should be aware that Red in not in version 2.0.0 and that even that if you want to use just `word/(code)`, someone must solve a lot of complicated situations, because soon or later there will come someone who starts with:
```
p: [] p/(loop 100 [append p random 100] random 100)
```
and will continue until it starts to make problems, which someone else must again solve for you.

[18:00:30](#kUj3vyhroBZ2pHpSzhia83y1WeqypKHdWKK4GbAcj2w) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Still don't see any real use for `(code)/(code)` pattern.

[18:01:26](#jZTCJbIY1FjOg11YsZHzcQXVT2Tak2D1C3YgurZZuFg) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* Still don't see any real use for `(code)/(code)` pattern. Which would be so important that we would have to reconsider complete code evaluation.

[18:03:01](#CNnLUekjQJucRe-UffjIs8EH67W-tNQlSDd7i9GZp5w) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Especially when `(code)/(code)` can be written in a Redbol way like: `pick (code) (code)`

[18:05:17](#5s5mGOpjdCOFya48Fy2weVK2cOtTOUkIYwWnhslxHz0) <GiuseppeChillemi (GiuseppeChillemi)>:
Think about some series sharing the same structure and stored in different words:
```
mystruct: [
   size:  heading/size
   body:  body
   extra: footer/extra
]

foreach series [s-one s-two s-three s-four] [
  Print ["Size is:" probe (series)/(mystruct/size)]
]
```

[18:05:20](#lpXg3erCm1R5IwcaC98dVj5kgwhNkFKQW3gIMFQpz4M) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Not mentioning that someone must also write a compiler to support this theoretical code patern. Ì†ΩÌ∏ï

[18:06:22](#WTO3thfs_H5UNdEKBUMxkHKb0LIpIFd6jp0B-bjlIIU) <GiuseppeChillemi (GiuseppeChillemi)>:
* Think about some series sharing the same structure and stored in different words:
```
mystruct: [
   size:  heading/size
   body:  body
   extra: footer/extra
]

foreach series [s-one s-two s-three s-four] [
  Print ["Size is:" probe (series)/('mystruct/size)]
]
```

[18:06:29](#7xQn6jb5ZT99CglI6TPWk3gdlHRRk24S50qWTK9NEPk) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* Not mentioning that someone must also write a compiler to support this **theoretical** code pattern. :/

[18:10:18](#Z-mrY5q80feAKGFGkqpesIAKadC64VvWnECi2cuM5rc) <GiuseppeChillemi (GiuseppeChillemi)>:
And if you have multiple elements which have the same row structure:

foreach series [s-one s-two s-three s-four] [
  repeat idx length? series [
     Print ["Size is:" probe (series)/(idx)/('mystruct/size)]
  ]
]

[18:10:37](#aM1SVJrJOPKFptwrx6IIPEvDcUr6pzysXSFh9CXfYJ0) <GiuseppeChillemi (GiuseppeChillemi)>:
* And if you have multiple elements which have the same row structure:
```
foreach series [s-one s-two s-three s-four] [
  repeat idx length? series [
     Print ["Size is:" probe (series)/(idx)/('mystruct/size)]
  ]
]
```

[18:14:53](#39E9uIH4UJQW4e_9Sh1zV7eGBaO-qS32CPW2tyHyj_Q) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Just write a wish and forget it... because I don't believe it will happen! Or you can talk to HF.. which will figure out something.. he has open mind for [such a requests](https://www.curecode.org/rebol3/ticket.rsp?id=2178)

[18:25:00](#jjHV_3wd-vzDG6UIhNGPLVOXqFoL_TuCajPNtyk_Sm0) <GiuseppeChillemi (GiuseppeChillemi)>:
HF has just a couple of good ideas but he is totally changing the way Redbol languages works, without realizing the solid grounds, even neurological ones,  Carl ideas is based. Also, forgetting the importance of code/skill reuse (20 years of Rebol experience); and that everyone needs something stable to work with. I have seen different members suffering of this **experimental stage**. Red is now ready and has its first commercial application. As things are now, we will see REN-C apps in another 5 to 10 years time frame.

[18:25:12](#_KOrxXPkLJ-eDhRvG2AybkM8hpr0KGL-sWG1hjnJQcQ) <GiuseppeChillemi (GiuseppeChillemi)>:
* HF has just a couple of good ideas but he is totally changing the way Redbol languages works, without realizing the solid grounds, even neurological ones,  Carl ideas is based onto. Also, forgetting the importance of code/skill reuse (20 years of Rebol experience); and that everyone needs something stable to work with. I have seen different members suffering of this **experimental stage**. Red is now ready and has its first commercial application. As things are now, we will see REN-C apps in another 5 to 10 years time frame.

[18:25:21](#t9lKo9UyYPDLVf_zYwtrk0UWBhZA0hGJGMdnWcurcpE) <GiuseppeChillemi (GiuseppeChillemi)>:
* HF has just a couple of good ideas but he is totally changing the way Redbol languages works, without realizing the solid grounds, even neurological ones,  Carl ideas is based onto. Also, he is forgetting the importance of code/skill reuse (20 years of Rebol experience); and that everyone needs something stable to work with. I have seen different members suffering of this **experimental stage**. Red is now ready and has its first commercial application. As things are now, we will see REN-C apps in another 5 to 10 years time frame.

[18:25:41](#Id5wnNe9-GbbVjbAmUFcmnZJpMLxA8hRzEBWG8kMak8) <GiuseppeChillemi (GiuseppeChillemi)>:
* HF has just a couple of good ideas but he is totally changing the way Redbol languages works, without realizing the solid grounds, even neurological ones,  Carl ideas is based onto. Also, he is forgetting the importance of code/skill reuse (20 years of Rebol experience); and that everyone needs something stable to work with. I have seen different members suffering from this **experimental stage**. Red is now ready and has its first commercial application. As things are now, we will see REN-C apps in another 5 to 10 years time frame.

[18:26:31](#nsL_kSj65PAjK_bL5SWDBFCwP-kjDP9GqiL0QXcY_hc) <GiuseppeChillemi (GiuseppeChillemi)>:
* HF has just a couple of good ideas but he is totally changing the way Redbol languages works, without realizing the solid grounds, even neurological ones,  Carl ideas is based onto. Also, he is forgetting the importance of code/skill reuse (20 years of Rebol experience); and that everyone needs something stable to work with. I have seen different members suffering from this **experimental stage**. Red is now ready and has its first commercial application. As things are now, we will see REN-C apps in another 5 to 10 years time frame. I will deliver my fist application just after the new Android branch will be released.

[18:26:57](#b0FGAPBrgh8fis8bNBPL7Xhje36-NaPVCUD2psWyhzs) <GiuseppeChillemi (GiuseppeChillemi)>:
* HF has just a couple of good ideas but he is totally changing the way Redbol languages works, without realizing the solid grounds, even neurological ones,  Carl ideas is based onto. Also, he is forgetting the importance of code/skill reuse (20 years of Rebol experience); and that everyone needs something stable to work with. I have seen different members suffering from this **experimental stage**. Red is now ready and has its first commercial application. As things are now, we will see REN-C apps in another 5 to 10 years time frame. I will deliver my fist application *made with red (tm)* just after the new Android branch will be released.

[18:32:19](#xwP94O5nk3ygtCCUzkuvNNbOWfCAX_I6kRqwXEChcMU) <GiuseppeChillemi (GiuseppeChillemi)>:
@toomasv This one `//: make op! Ì†ΩÌ∏õath` is the way to start with.

[18:32:41](#9WJaUhuzYJU78mQIcULvjhksraJHZcy6qF8MEADRhFY) <GiuseppeChillemi (GiuseppeChillemi)>:
* HF has just a couple of good ideas but he is totally changing the way Redbol languages works, without realizing the solid grounds, even neurological ones,  Carl idea are based onto. Also, he is forgetting the importance of code/skill reuse (20 years of Rebol experience); and that everyone needs something stable to work with. I have seen different members suffering from this **experimental stage**. Red is now ready and has its first commercial application. As things are now, we will see REN-C apps in another 5 to 10 years time frame. I will deliver my fist application *made with red (tm)* just after the new Android branch will be released.

[18:33:12](#vc6_Bbnuz-Je6-72ilmujMkoTTUDEOIkn3WD8Ouf1m8) <GiuseppeChillemi (GiuseppeChillemi)>:
* HF has just a couple of good ideas but he is totally changing the way Redbol languages works, without realizing the solid grounds, even neurological ones,  Carl idea are based onto. Also, he is forgetting the importance of code/skill reuse (20 years of Rebol experience); and that everyone needs something stable to work with. I have seen different members suffering from this **experimental stage**. Red is now ready and it has its first commercial application. As things are now, we will see REN-C apps in another 5 to 10 years time frame. I will deliver my fist application *made with red (tm)* just after the new Android branch will be released.

[18:33:56](#M31zm1udpjq-kll2V8i1QNr3xWC3blk5N2w6qbD1eTM) <GiuseppeChillemi (GiuseppeChillemi)>:
* HF has just a couple of good ideas but he is totally changing the way Redbol languages works, without realizing the solid grounds, even neurological ones,  Carl idea are based onto. Also, he is forgetting the importance of code/skill reuse (20 years of Rebol experience); and that everyone needs something stable to work with. I have seen different members suffering from this **experimental stage**. Red is now ready and it has its first commercial application. As things are now, we will see REN-C apps in another 5 to 10 years time frame. I will deliver my fist application *made with red (tm)* just after the new Android+Ports branch will be released.

[18:34:15](#IZWYpWslfmtTrFz2GwcoxqVWn_beJNxnXKqAtqCEwTw) <GiuseppeChillemi (GiuseppeChillemi)>:
* HF has just a couple of good ideas but he is totally changing the way Redbol languages works, without realizing the solid grounds, even neurological ones,  Carl idea are based onto. Also, he is forgetting the importance of code/skill reuse (20 years of Rebol experience); and that everyone needs something stable to work with. I have seen different members suffering from this **experimental stage**. Red is now ready and it has its first commercial application. As things are now, we will see REN-C apps in another 5 to 10 years time frame. I will deliver my fist application *made with red (tm)* just after the new Android+Ports release.

[18:34:27](#vXdM3Z7R1ihO2S33lqDS2A7PWxDOzzZi1ep3jefHiWI) <GiuseppeChillemi (GiuseppeChillemi)>:
* HF has just a couple of good ideas but he is totally changing the way Redbol languages works, without realizing the solid grounds, even neurological ones,  Carl idea are based onto. Also, he is forgetting the importance of code/skill reuse (20 years of Rebol experience); and that everyone needs something stable to work with. I have seen different members suffering from this **experimental stage**. Red is now ready and it has its first commercial application. As things are now, we will see REN-C apps in another 5 to 10 years time frame. I will deliver my fist application *made with red (tm)* just after the new *Android+Ports* release.

[19:42:19](#zyPYPrMRiu22xA1Kh62TKfs51e9JdPB-ETJPHl1_pdM) <GiuseppeChillemi (GiuseppeChillemi)>:
I have created a gist to show the application field of relative paths: https://gist.github.com/GiuseppeChillemi/93febe44dffd5dfae764b3cd6ad86988

[19:42:40](#sG2i9MGoe3KrFdPb02WcxKmHK9xtjPzUy_9uo3XD5BE) <GiuseppeChillemi (GiuseppeChillemi)>:
(Thank you @toomasv !)

[20:43:52](#FTGqAFo3cMupSGOFGDv9jJfSt43OuJAY1bwCvYtDtV0) <toomasv>:
Ì†ΩÌ∏∏ 

## 15-Jan-2021

[2:07:20](#mS-rfk_Z40riVYMmBpwD9i0aQ_uZRqTjkFMgRarnfWM) <greggirwin (Gregg Irwin)>:
@Oldes' `resolve` on @GiuseppeChillemi's gist is very nice.  It gives it a name, is very idiomatically Red, and is simple and elegant.

[2:08:44](#pF8pk3Ug888SZbA17QZ_BHJrTuUENqu29wfT0glyD48) <greggirwin (Gregg Irwin)>:
I did this a long time back, for the refinement issues @GiuseppeChillemi noted:
```
to-path: func [spec][
	; LOAD FORM is used to clean up specs that have refinements 
	; in them. Refinement values get their sigil doubled, which
	; FORM removes, so they are sanitized. More overhead, but we
	; could make that optional if this func lives on.
	load form append clear '_/_ spec
]
```
It's really heavy though, with both `form` and `load` being used, and was just a quick workaround at the time.

[2:09:24](#riM5B-NV_XF1ve6MMJyRZyl0OJhMWup82I5AD74XIR0) <greggirwin (Gregg Irwin)>:
@toomasv's `path` func is nice too.

[2:32:05](#0ydrN3sfIeyrnj31cuFWDJF1X_Tcdw6f1uPNfKop6YA) <greggirwin (Gregg Irwin)>:
I don't remember where the paren-in-path/computed-selector chat was, and can't find it just now, but it is important to note that we intentionally left it out of the `path!` docs, because it may be removed. @Oldes correctly points out a number of issues with it, and allowing parens as the first element in a path's lexical form is very, very unlikely to happen. Coming from @meijeru's notes, I am looking at things from the other direction; how can we simplify rules for lexical forms.

I think what @GiuseppeChillemi wants could be called _indirect relative paths_ or even just _indirect paths_. Now, since words are already a level of indirection, they're really doubly indirect, but that's just more confusing to talk about.

An important aspect here is that paths themselves are not the problem, which we can see based on @Oldes and @toomasv finding other ways to express solutions. The only issue is the lexical form for `path!` values. @GiuseppeChillemi's suggestion of `/a/b` has a big problem in my mind in that *nix paths starting with a slash mean they start at the root (i.e. aboslute), so having it mean relative is backwards to that meaning.

It's true that common cases like `p/(n + 1)` are handy but, unless we make paren path segments a special dialect, their unrestricted power can be abused and hurt readability. Forcing the use of get-word selectors can seem like more work, but the benefit is that the user then *has to* give the selector a name, which is helpful.

So, @GiuseppeChillemi, no need to open a wish for this.

[2:35:28](#muhd7qhYaOEixrM33C9Srfxe5GtJkopGEMIgHOV-y08) <greggirwin (Gregg Irwin)>:
Nenad included paren support in paths for Rebol compatibility but, if we look at Red as a data format, with very tight and sometimes confusing lexical interactions, it does come with a cost. 

[6:54:24](#3jmesVHvvqAkKr5D5Bzjdp2N-Dw5RiuYMaBlB0fKgHk) <GiuseppeChillemi (GiuseppeChillemi)>:
@greggirwin Gregg, you have already asked time ago for examples that shows reasons to use parens and I did it. They are an essential part to have one line data structure selectors that summarize what needs more lines to be expressed. Everything can be abused and become hugly but it is the price of power. I remember me having written hugly parse expressions that made Ladislav gone grazy but the solution was not to restrict parse because  it can be used to write such code, I have simply learned write neat and readable one. So, removing power from a language for this reason, is not the right way to go: we should teach how to use that power, instead of removing it because it can wrongly used!

[10:13:50](#7YKfcST2kXnR9-XrFJBlni6X22QEKFF5juf7AUdo3ic) <GiuseppeChillemi (GiuseppeChillemi)>:
@greggirwin Also, about "hurting readability", I totally disagree, every day I face the problem of having too much information off-screen.  It confuses me because I have to move back and forth to find what-is-what in structures, words, and logic. It is nice to have "my-field" but coding is not just having a neat name, it is also defining and debugging its content, especially when your path accessor is not doing what it has been meant to do. When you have multiple data structures, it is really handy to have their access logic in one line because the information is all there. It is like function's specs, in the same line you have: `word [types!] "description"`; in this case, you have `name/(logic)/name`! No off-screen data, no scrolling headache, no large amount of new words,  no risk of polluting the global context, and no minding about words context. This is really hurts coding: too many elements to have in mind to understand what is happening and information scattered everywhere. Parens in paths (if done properly) solves this as Carl solved the problem of documenting the purpose of function arguments and types. 

[10:15:41](#tbr3lmaeT-TKnF0aBkUniHFVIULDDiik0pmUW1ob-18) <GiuseppeChillemi (GiuseppeChillemi)>:
* @greggirwin Also, about "hurting readability", I totally disagree, every day I face the problem of having too much information off-screen.  It confuses me because I have to move back and forth to find what-is-what in structures, words, and logic. It is nice to have "my-field" but coding is not just having a neat name, it is also defining and debugging its content, especially when your path accessor is not doing what it has been meant to do. When you have multiple data structures, it is really handy to have their access logic in one line because the information is all there. It is like function's specs, in the same line you have: `word [types!] "description"`; in this case, you have `name/(logic)/name`! No off-screen data, no scrolling headache, no large amount of new words,  no risk of polluting the global context, and no minding about words context. This is what really hurts coding: too many elements to have in mind to understand what is happening and information scattered everywhere. Parens in paths (if done properly) solves this as Carl solved the problem of documenting the purpose of function arguments and types. 

[10:17:57](#PdIN8UkDsxIHcTmjBOETg5c7YliQyy9eRXLzZEdmQnY) <GiuseppeChillemi (GiuseppeChillemi)>:
* @greggirwin Also, about parens "hurting readability", I totally disagree, every day I face the problem of having too much information off-screen.  It confuses me because I have to move back and forth to find what-is-what in structures, words, and logic. It is nice to have "my-field" but coding is not just having a neat name, it is also defining and debugging its content, especially when your path accessor is not doing what it has been meant to do. When you have multiple data structures, it is really handy to have their access logic in one line because the information is all there. It is like function's specs, in the same line you have: `word [types!] "description"`; in this case, you have `name/(logic)/name`! No off-screen data, no scrolling headache, no large amount of new words,  no risk of polluting the global context, and no minding about words context. This is what really hurts coding: too many elements to have in mind to understand what is happening and information scattered everywhere. Parens in paths (if done properly) solves this as Carl solved the problem of documenting the purpose of function arguments and types. 

[10:18:21](#3ZKKA3FoihIPsNzAk9mg5WAI-YvZCWiDkaIVjI3WDBY) <GiuseppeChillemi (GiuseppeChillemi)>:
* @greggirwin Also, about parens "hurting readability", I totally disagree, it's the opposite. Every day I face the problem of having too much information off-screen.  It confuses me because I have to move back and forth to find what-is-what in structures, words, and logic. It is nice to have "my-field" but coding is not just having a neat name, it is also defining and debugging its content, especially when your path accessor is not doing what it has been meant to do. When you have multiple data structures, it is really handy to have their access logic in one line because the information is all there. It is like function's specs, in the same line you have: `word [types!] "description"`; in this case, you have `name/(logic)/name`! No off-screen data, no scrolling headache, no large amount of new words,  no risk of polluting the global context, and no minding about words context. This is what really hurts coding: too many elements to have in mind to understand what is happening and information scattered everywhere. Parens in paths (if done properly) solves this as Carl solved the problem of documenting the purpose of function arguments and types. 

[10:19:16](#9jc1ZXhEy8b3DsUUQDLBdVPQ4sIrU6BE_ZsHoXIR8es) <GiuseppeChillemi (GiuseppeChillemi)>:
* @greggirwin Also, about parens "hurting readability", I totally disagree, it's the opposite. Every day I face the problem of having too much information off-screen.  It confuses me because I have to move back and forth to find what-is-what in structures, words, and logic. It is nice to have "my-field" but coding is not just having a neat name, it is also defining and debugging its content, especially when your path accessor is not doing what it has been meant to do. When you have multiple data structures, it is really handy to have their access logic in one line because the information is all there. It is like function's specs, in the same line you have: `word [types!] "description"`; in this case, you have `name/(logic)`! No off-screen data, no scrolling headache, no large amount of new words,  no risk of polluting the global context, and no minding about words context. This is what really hurts coding: too many elements to have in mind to understand what is happening and information scattered everywhere. Parens in paths (if done properly) solves this as Carl solved the problem of documenting the purpose of function arguments and types. 

[10:29:46](#Zb-WwDZ3nZlxTpG_R32Z0q4zOJhkO51Jt0LxPMb9jk8) <toomasv>:
@GiuseppeChillemi Another func you may like:
```
get-path: func [block [block! hash! paren!] path [path! block!]][
    forall path [block: block/(path/1)]
    ;foreach i path [block: block/:i]         ;This is slightly faster
]
a: [b [c [d e f g]]]
get-path a 'b/c/e 
;== f
get-path a 'b/c/2 
;== e
get-path [b [c [10 20]]] 'b/c/2 
;== 20
```
And of-course you can make it into op again.

[10:30:27](#W_Ug_KyIwZc-vVRnUH0KN46bPK0R5vNHDJC2YTlksig) <toomasv>:
* @GiuseppeChillemi Another func you may like:
```
get-path: func [block [block! hash! paren!] path [path! block!]][
    forall path [block: block/(path/1)]
    ;foreach i path [block: block/:i]         ;This is slightly faster
]
a: [b [c [d e f g]]]
get-path a 'b/c/e 
;== f
get-path a 'b/c/2 
;== e
get-path [b [c [10 20]]] 'b/c/2 
;== 20
get-path [b [c [10 20]]] [b c 2]
;== 20
```
And of-course you can make it into op again.

[10:33:40](#QRdodZOFQ8MFSloDSaQ--_Pw57AqcFCwPTPUdUijDuE) <toomasv>:
* @GiuseppeChillemi Another func you may like:
```
get-path: func [block [block! hash! paren! object! map!] path [path! block!]][
    forall path [block: block/(path/1)]
    ;foreach i path [block: block/:i]         ;This is slightly faster
]
a: [b [c [d e f g]]]
get-path a 'b/c/e 
;== f
get-path a 'b/c/2 
;== e
get-path [b [c [10 20]]] 'b/c/2 
;== 20
get-path [b [c [10 20]]] [b c 2]
;== 20
```
And of-course you can make it into op again.

[19:44:08](#L0P-f0526TfvR47YuZOS1fOvMINzfEmHPhwJxUGtlEM) <greggirwin (Gregg Irwin)>:
Moving to red/red/

[19:44:11](#BomA04zK6cIbX1k2mdaxD-flyDvdzfNu1aF2P5QaQ4k) <greggirwin (Gregg Irwin)>:
* Moving to red/red.

## 31-Jan-2021

[20:32:31](#Tvu9mplAI3YMGZWrGNPqW--bWbDlry1B3V_w-xl9zh4) <gltewalt (Greg T)>:
So here is a help-string writer script for function categories. Any of the `any-function!` types.
https://gist.github.com/gltewalt/ff429d629b495ef9fc9bb139030afb78

[20:33:13](#0S1qXtxWNs_Ncvy3epL0YB0Ow-HU_4rJe4s7pBrdwoE) <gltewalt (Greg T)>:
About 90% done, but still some duplication

[20:34:33](#Se5ShkAR8wdfXHt7MSAqLqMqpNYRTy6B6Nwcgk_k21Q) <gltewalt (Greg T)>:
I haven't tested it on Windows, so I don't know if the checking for Windows works or not - yet

[20:38:28](#VaS2iMstgIf64VW3kroTtfRiazJvz3l2XHs9CH_JQ3M) <greggirwin (Gregg Irwin)>:
Writes out help to other formats, like asciidoc and markdown. 

[20:47:11](#jubE94W2mXnE1Y-7jg6WgqfagzJ_jnLrGnfKNkM_gPM) <gltewalt (Greg T)>:
I started on an html template, but it gets messy quickly

## 1-Feb-2021

[21:41:06](#OojZV83wG3nE59zcrA81hZOSlWKVnP3tabUI4E932Ko) <gltewalt (Greg T)>:
https://github.com/gltewalt/help-writer

## 2-Feb-2021

[10:57:57](#wm0COek-K1PAld7ItbENc2LZIpN1zDvRUgPduU4YztY) <meijeru (Rudolf Meijer)>:
For HTML, have you tried <pre>? It is crude but probably OK for a quick result.

[16:46:00](#h3cvSLluVtJOxHlilNjyGju7B59STe_u-FUZntHMyvM) <gltewalt (Greg T)>:
Not yet. Ill get back to the html template soon. 

[19:04:58](#s543wW98PODgboQ6J0qTQD8i9snQPwus20M20320LQE) <gltewalt (Greg T)>:
Done.
Others are welcome to improve the styling for the html template.  (Or the code in general)

https://github.com/gltewalt/help-writer

## 3-Feb-2021

[1:50:28](#kiVo6R2DimC3xFKUsYTXbUZYF1j_A01-gn97K1GKz0U) <gltewalt (Greg T)>:
Not terrible.
https://imgur.com/a/SlcaUpb

[2:14:48](#6LIVcSAV8r6U7GBaFmn8KCybCEOz93Ma4uOe7Kp0m2E) <greggirwin (Gregg Irwin)>:
Nice. Is that rendered as MD, AD, or HTML?

[2:31:32](#eE-py847q0DzxEQsKZ30xbzMUKc0P8hW-HFrBTwtGRQ) <gltewalt (The other Greg)>:
Html

## 4-Feb-2021

[0:54:19](#tIEy1HQ003sXX4LgC19cum4mETzGUg51r0YActqntlU) <gltewalt (Greg T)>:
offset a bit with a border?
https://imgur.com/y1v5svS

[2:21:37](#QzQRTgQUrht3zANMpEP6dW7Lyr-Uq5fe75-cAMsR1CU) <gltewalt (Greg T)>:
https://imgur.com/izfPPtV

## 5-Feb-2021

[2:09:01](#XFGuzgbAFFQXLLmh5k8rIqeyE2-rsQUTLZwY9DIzUhA) <gltewalt (Greg T)>:
What is this? Is it something from the team?

https://red-language-documentation.readthedocs.io/en/latest/

[19:25:33](#b1iRxnvz9Ibf56BzAA2TM8m31Y6HmQ92tzyzxnMi9lA) <greggirwin (Gregg Irwin)>:
Interesting. I hadn't seen it. Looks experimental, and from almost 5 years ago. Doc is listed as the maintainer, but it's not in my head. It's a nice rendering, but I don't know what readthedocs maintenance involves. If you want to find out, post your thoughts here, that would be great. @x8x also has a really nice docs layout (https://w.red-lang.org/), but I think that requires manual upkeep as well. 

[21:01:59](#y_GFkJ-xCDnfymGDPeb0t9FwJZ2bIB9i68G2GhsOGlQ) <gltewalt (Greg T)>:
Ok, I will look into it tonight 

[21:31:54](#7MY7lpUGrb4mev5dJmtzmIxI3p8V_8bBqLvnRv1tL8k) <greggirwin (Gregg Irwin)>:
Thanks!

## 7-Feb-2021

[18:42:14](#lKE50YvgzRqXdetdVLc0zxrZRMSGQvxJhytt06BXvX4) <gltewalt (Greg T)>:
`readthedocs.io`

You can connect a readthedocs account to a github account, then can click import on a repostiory.
Once imported it builds out the docs.
Then you have to manually configure a webhook so that docs are updated with new changes.
So, doesn't seem like much maintanance is required, or much manual work after everything is set up.
Workload is mostly up front.

There are business accounts that probably give you more, but I didn't look at that.

I don't know the reasons for starting an account there and then abandoning it - possibly because at the time I believe the docs were in markdown?


Pros:
Free doc hosting.
Webhooks - when code is pushed with Git, docs are built. Stays in sync.
Multiple docs versions - branch or tag with git.
Can build multiple formats: pdf, ePub, html

Cons:
Relying on (or tied to) Python.
reStructuredText is the prefered markup (Part of Pythons javadoc-like attempt). No Asciidoc. 
Can use markdown but it is limited.

[19:06:17](#x-ELG724ngQhLAWpG_IPgZ5h2qNROojEQB42YhpVxWs) <gltewalt (Greg T)>:
Setting up a webhook on github and then using @x8x stuff (or other web dev) is an option. 

[19:07:08](#w15oImOWUBEKEkx_lSIPrPwLoAxNehyf-C0HXQ13YC0) <gltewalt (Greg T)>:
https://docs.github.com/en/github-ae@latest/developers/webhooks-and-events/webhooks

[19:31:52](#RPX_Z929_KdbeRR-dguyVZ7Ep4CIjn7Uk9fq_tHguAE) <greggirwin (Gregg Irwin)>:
Thanks @gltewalt. Great info. Now that we're using AD, it will be more work to support it, from what you say. However, if people think there's value in having reflective help there, your recent work could emit MD. 

How tightly are things tied to Python, or what parts are that would affect us and integrating with it?

[19:42:26](#c5A4ManHOWsHlg2zR7VJDpHnPtnrimT6VYE-GxycwuY) <gltewalt (The other Greg)>:
Fairly tightly knit with python - have to use python locally, install sphinx and recommonmark through the package manager, and edit a .py config file. I'm not sure that the Red team wants to lean on python tooling, though there is a balance somewhere between being reliant on other things, and doing everything in house. 

[19:44:42](#RhcFjHPbKF3nQ0LufuQ8Lg1cbo8gtEXc-1_i8h9LOz8) <gltewalt (The other Greg)>:
A local docs directory would be the sphinx project scaffolding 

[19:51:43](#thQfLNTEv_7jAlZ3jqoX-2EHXnNRI620d9wuxN-QyUc) <greggirwin (Gregg Irwin)>:
That's a bummer. Yeah, we may not want to do all that.

[19:52:11](#jC6PUhzzlh3BGIV-Ke0Ks8FpmUIOi2j1zzsfcNCfp4M) <greggirwin (Gregg Irwin)>:
@x8x do we have any other Python dependencies in our webhook chain for other stuff at this point?

[19:56:15](#wwjg6F8Mk86jblbkbrVw-2va3JvLKwUKKI3Zp_T2sLI) <gltewalt (The other Greg)>:
There is also asciidoctor which spits out htm from asciidoc by default.

https://asciidoctor.org

[19:56:37](#U51h6ZjjcowSFAjxkFh-oBSxiFC6z5lnbh1B8eXIiTE) <gltewalt (The other Greg)>:
Looks good to the viewer, pretty noisy when viewing source

## 8-Feb-2021

[19:20:04](#5yOuo_z1UJabbWjn0H7qETfmgfP1wZwGoTBENh2Q7z8) <greggirwin (Gregg Irwin)>:
Thanks @x8x. So we probably won't pursue that @gltewalt:matrix.org. If there's someone in the community that wants to host that process, knows Python, and all we need to do is provide content in a given format for them to pull, we could look at that.

## 10-Feb-2021

[12:32:47](#VzbAVepOW0iU1hT6O_7LsXyl9AXLXBS0CwK3CVWE5tY) <mxdpeep (Filip O≈°ƒç√°dal)>:
> There is also asciidoctor which spits out htm from asciidoc by default.
> 
> https://asciidoctor.org

I use it daily from a docker container, works

## 11-Feb-2021

[4:04:03](#NzBxCYRHJzyyPsNDHa1G3WYlCBs6pLvceG8lvjMRRT8) <gltewalt (Greg T)>:
I think asciidoctor is the best bet for right now - if you want html version of the asciidoc docs.

[4:06:31](#nkJvAR6dMI6B4Nyn-xWkXzplHyXsyhyZhpjNGsXKLzA) <gltewalt (Greg T)>:
Their site is composed in asciidoc. The html that you see if from asciidoctor, with their own css style.

https://asciidoctor.org/

[4:07:29](#l21mUp0ZYVyYwmz5-IiFfZssTPun5YJtqxwNCn04XYs) <gltewalt (Greg T)>:
Bonus - the headers are colored red

[12:07:09](#CfZwedzuXCzyhlY4_iikK55iOQ06t9xWP4ZtsmtNAio) <FLuX>:
@gltewalt we use asciidoctor since always.. and we also do SPA and PWA if that's the new buzz words.. Ì†ΩÌ∏É 

[12:38:29](#1-Ptb4QRouBHv4OKmR2mmhh2LN6PEYOsI-0Kr4sLQ58) <gltewalt (Greg T)>:
'We' as in?

[12:53:32](#TvtflXP3eStN4StzpgP2kmbthtje1E2jYoVkmflvIM4) <FLuX>:
> https://docs.github.com/en/github-ae@latest/developers/webhooks-and-events/webhooks

Thanks! That looks like an interesting option! :thumbsup: 

## 3-Apr-2021

[23:54:37](#I2qNtgF54bNROkEWpRwdp4uYJalvYaavY5JTz2B_cjU) <gltewalt (Greg T)>:
This could use some volunteers. Last touched in January.
https://github.com/red/red/wiki/%5BHOWTO%5D-How-Do-I-Do-X-with-Red%3F

[23:56:35](#hS2oeLP4WEBiiAvs8sQ-7pHrOAHu6dV5Aq_zt2WwjOk) <gltewalt (Greg T)>:
The common How-Tos could be factored out and used as a kind of parent class to the "How Do I", and the "Coming to Red from another language" writings

[23:57:33](#oGreEq2u0MHm_A6KRRhO7D4dMlmKitkj9suNL99S5UM) <gltewalt (Greg T)>:
Cross referenced, at least

## 4-Apr-2021

[2:54:25](#hOh2HpVq5xIBabbGK51WTcgJ4P8-1rGT4xfjscpXiyo) <greggirwin (Gregg Irwin)>:
:+1:

## 5-Apr-2021

[7:49:37](#bOVoEEvsZ4FGah-n9PSglgj4PfAU0WZ4f1zMz8qQDGo) <mikeparr (mikeparr)>:
@gltewalt  I wonder if this 'CommonTasks In Series' material is any use?  https://www.red-by-example.org/series.html#15

[11:12:24](#ySGoO3WPIN2tsK18_LIiQMpoRYO-NV2K0k7iaH0x-sk) <gltewalt (Greg T)>:
Yes, good information. Should probably link to those from "How Do I"

[22:55:10](#JQku5hn1-mXSIdH9SJ9q9iJCPi42XBO07WTuBZsqXIU) <rseger (rseger)>:
I added a suggested "potential gotchas" section to https://github.com/red/red/wiki/Coming-to-Red-from-Python. And added a note about namespaces (hopefully a helpful one) - feel free to tweak/remove as desired :)

[23:04:36](#EJ7_ooW5EvD7_IcUQG9FZ8LkozRewE_jtF9x1FT-mU8) <greggirwin (Gregg Irwin)>:
Good stuff @rseger , thanks!

Another thing you might hear is that "words carry their context with them".  

[23:06:27](#Az0UZRWngJHFLsJoW1T9ZMsEVflMpE0_LhEzvQ7_raE) <rseger (rseger)>:
my pleasure :)

## 29-Jul-2021

[5:01:14](#o8Hk744_qOLrkL_GSXv_aNKTTgU4Dt0EvTFZATQl4DM) <gltewalt (Greg T)>:
the "zipped" `Direct links to latest builds` are dead on the download page

[5:01:31](#XWNig84TdWvgWuPUwd7KUINd8yhsaWSNVcVsIbJ3T90) <gltewalt (Greg T)>:
* the "zipped" `Direct links to latest builds` links are dead on the download page

## 5-Aug-2021

[15:08:43](#S8gs8Wg3K6jrKZ1U6n4sut7r9ufmWf6p_hjHPeHk_Yk) <gltewalt (The other Greg)>:
Red by example still alive?

[15:08:51](#QkSrNdsxqW5IwRZawXRCROgTD4JOUUCvTWBjz7mvLBA) <gltewalt (The other Greg)>:
![](https://matrix-client.matrix.org/_matrix/media/v3/download/matrix.org/tYEsnOAHQbTZGHRDylQdqBFy)

[15:55:50](#iYnJkX8B5CuKJwfiTM7orma2DtA1otF2kuSooqCnT9Q) <greggirwin (Gregg Irwin)>:
It's an open effort now: https://github.com/red-by-example/red-by-example with @mikeparr and ArieVW as honorary advisors.

[19:34:26](#36TEg9ogs88tdDHebgK53JU3Bhu5_m_fHruC2aMA9Mo) <mikeparr (mikeparr)>:
Thanks Gregg

## 13-Aug-2021

[8:01:35](#bQFuS51uf-gO2mX41TTfrA_GtFvYnDX6H7Dyi7yAA7k) <toomasv>:
There is following proposition in `map` [documentation](https://github.com/red/docs/blob/master/en/datatypes/map.adoc):

> Trying to access a key not defined in a map will:
>*    produce an error if the path syntax is used.
>*    return a none value if select is used.
But on Windows accessing non-existing key with path syntax returns `none`, not error. Which is wrong, documentation or Windows' behavior?

[8:01:40](#btPAFyixtYQafHZu9u5C-W1vJfohfIrUXx4uxr2B6M0) <toomasv>:
* There is following proposition in `map` [documentation](https://github.com/red/docs/blob/master/en/datatypes/map.adoc):

> Trying to access a key not defined in a map will:
>*    produce an error if the path syntax is used.
>*    return a none value if select is used.

But on Windows accessing non-existing key with path syntax returns `none`, not error. Which is wrong, documentation or Windows' behavior?

[16:26:05](#20w73xoeqtt6uHU-g5g2_rPu_Gy3uETXvULdbLcT0oo) <greggirwin (Gregg Irwin)>:
Documentation is wrong. That was the original behavior, and docs never got updated. Good catch, and please file a ticket for it.

## 14-Aug-2021

[7:50:20](#ed-Jx9lgbjXk0cOL6l_hekt05d4ZO2mcpwjDE7lBObk) <toomasv>:
Ok, will do.

## 26-Dec-2021

[7:15:11](#WlzQuVLVSFV2QM4N5Kew5bZIrb_NtkWFS7DiLwFO_lQ) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
English is not my native language, but shouldn't `== Function attributs`be `== Function attributes`instead?

[19:56:42](#y6IRSx3WtAoUZ0vgoRNO71Z2DgQj8B_85IW8whNZBSg) <gltewalt (The other Greg)>:
Yep

## 27-Dec-2021

[19:05:30](#bG4jirETi5Lpw_T_5xzuJHbDFX4bGNl2E7fZGtlxoto) <greggirwin (Gregg Irwin)>:
Thanks @pekr. Fixed.

## 22-Jan-2022

[1:51:37](#kEYpmJ1I43SfX9j4TzsMIzovbPwssvqnsDTq-aXzzH4) <gltewalt (Greg T)>:
I saw the `split` comparison doc. Surprised you didn't look at haskell.
https://hackage.haskell.org/package/split-0.2.3.4/docs/Data-List-Split.html

[16:43:54](#mmabsEoNicRgR2ISsGa9Uac2rGt-pnJK9JBlbk9TTcI) <greggirwin (Gregg Irwin)>:
We can add it. Just can't cover everything. I, personally, didn't think of Haskell because any time I look at Haskell examples, it seems they don't use words. :^)

[16:45:59](#24ULoHzg34Y-bzTrjoifPNZRNaoPovMwzySxvuSI6JQ) <greggirwin (Gregg Irwin)>:
Link added.

[16:53:37](#gjhS9x-gybq1RrhjX_Uptp11KIcrmcq_OfEOhVdKtOY) <greggirwin (Gregg Irwin)>:
And when they do use words, they're things like "strategy transformers" and "derived combinators". I'm just a simple man. `splitWhen` is a really nice name though, using "when" for "When you encounter...".

[20:58:44](#fQR4vkDIca3F2EXXv99YudcnwknDJMVN8pbxcNquN5k) <gltewalt (The other Greg)>:
Yeah, I've only made it to understanding about 50% of the egghead stuff, but their utility functions mostly make sense, and that community geeks out with 50 different ways of solving everything.

[22:07:23](#0Y-QtiUzA7LzFiNcwOjyxcxBhuH24YCC9hRuwYMKZe8) <greggirwin (Gregg Irwin)>:
> that community geeks out with 50 different ways of solving everything.

They're catching up to us! ;^)

## 23-Jan-2022

[21:49:11](#C1SzgYymjKFz6IYi_oQUakQvvm5UrEB3K8JODBPQ4-s) <GiuseppeChillemi (GiuseppeChillemi)>:
Red is a readable language,  you understand what it does since the first reads.

## 24-Jan-2022

[0:10:41](#1XA0RpIMWV2T_TOrupG2yaKijcX_KMS-K7xR31noBug) <gltewalt (Greg T)>:
Depends on how you write.

[12:35:50](#wjuFjXtgg1tu0IcOkKXMCoilY2H9DtwtbiLB29QFmCg) <meijeru (Rudolf Meijer)>:
@dockimbel @greggirwin 
In the most recent blog post I read (to my satisfaction) the planned  work item:
Red Language Specification (Principles, Core Language, Evaluation Rules, Datatype Specs (including literal forms), Action/Native specs, Modules spec.
Let me reconfirm that the work I have put into the specification document [here](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc) is fully available for use in progressing this work item, in whatever way is thought appropriate.

[20:44:22](#KxAUPGbMS0a-O4t9OlVW6gzaD6u4xOA3ByZY4Cqj-Ro) <greggirwin (Gregg Irwin)>:
@meijeru absolutely. I imagine that will be the foundation we work from. We want to a) make it clear what parts of Red have a hard, unchanging (as much as we can), spec; b) firmer style guidelines for things like custom datatypes (not including new lexical forms) and how to make sure contributions (including those from the team), align with the big design picture. Finally, c) I'd love to be able to treat specs as data where we can, for more interactive tools, including analysis for new work. e.g. if we have specs we can apply as rules, how do we do that?

In any case, your work will be an important aspect, and we'll certainly reach out to leverage your knowledge and expertise.

## 19-Feb-2022

[12:18:20](#k2vovksYzCpQNL_yb1qSDcevH0-YGI4hQtgXbfauLHk) <meijeru (Rudolf Meijer)>:
I just (re-)discovered https://w.red-lang.org/en/. What is the status of this doc-site now?

[17:51:03](#rplGgZmXK8zAXw_eEbZgXimk6SFh-2N--dDMpMt2f6w) <Red-Beginner (Civan)>:
@meijeru  It looks like a fan site. Probably it copied from the original documents.

[18:53:17](#XX3fitEC5mNxpaiSu81oXQdr9WAO4yTbn1wvtkQFxFA) <greggirwin (Gregg Irwin)>:
That was @x8x's work, but doesn't seem to have been kept up to date. 

[21:04:07](#NQeOjoL8YfMFa6J8VdSRvvsKuxMoB5R4qFzFa5vgZt0) <meijeru (Rudolf Meijer)>:
 It seems to be derived from https://github.com/red/docs/tree/master/en/,  which  I hope IS up-to-date. Maybe @x8x can tell us what the status is.

## 20-Feb-2022

[5:04:40](#Ukfh_WVkKMSvIyQkHedXZklCyfP1MA6wibDpIjs5CnA) <greggirwin (Gregg Irwin)>:
Yes, I just don't know if it's kept up via automation.

## 4-Oct-2022

[14:52:37](#5muTMRIH0hqahoBG1uM68gf09oEXO44pblLqvKwU94s) <dsunanda (dsunanda)>:
I do all my Red development under Windows. But now I want to compile/encap a GUI app, and then run it on Linux (Fedora initially, probably).

Is there a handy, easy, how-to type guide for such things? (All I can find is how to install a dev environment under Linux - not want I want; just want a runtime environment).

Thanks!


[15:16:49](#ckgpT7gbsF0ZGcvZLQh8HN5Py2xK4g_MHzKSTa6bhKg) <rebolek (Boleslav B≈ôezovsk√Ω)>:
just add `-t Linux` when compiling

[15:17:11](#ggY9Pdr62IKbuRXoaGu7N50JzsQ64K5Nrbh6XPP15lw) <rebolek (Boleslav B≈ôezovsk√Ω)>:
`-t` means `target`

[18:50:39](#ftsMsk6aZAw8JciwqixcArLJTjxLBZR2J0NhVr2UnwA) <dsunanda (dsunanda)>:
Thanks .... And then just copy over the executable? No libraries need? That simple!?

[18:53:00](#_0qhEDt891U-eWEN7Uv1QOd9x53t7a3vq8JaHR6E-6s) <greggirwin (Gregg Irwin)>:
Be sure to set the executable bit for the binary on the target system.

[18:53:52](#C4QUjtKWwEd0oXzsNGzd2M7utNM0WdsmY9uxo0hNK90) <dsunanda (dsunanda)>:
Thanks. So that simple +1 bit :)

[18:54:15](#XNWhRYnkCfKAet9al0TGqxbMEC3zB3msJW5tw060r-o) <greggirwin (Gregg Irwin)>:
If you don't add any external dependencies, that's the magic of Red. It does still need 32-bit support libs from the OS, if you're Linux doesn't include them you'll need to install those.

## 18-Oct-2022

[15:53:21](#OlbmHlr_yj1D32gtNA7pITREvhiX5cJVVQDnOXYNqpM) <gltewalt (The other Greg)>:
https://roadmap.sh/

[22:02:46](#TtiCkcVYjgPy-LSZOVdIbvNIVbmBRaqiSYKpwdHZO7M) <GiuseppeChillemi (GiuseppeChillemi)>:
Nice link

## 29-Nov-2022

[12:30:41](#WUHO6ec2ClYUh3v--hzhu05rGQOmV-k5FjN8dBgJE6Y) <loziniak (Maciej ≈Åozi≈Ñski)>:
Hi! I [added links](https://github.com/red-by-example/red-by-example/commit/a95eeac11157043fdc1398ea60f6eafc17702213) to GitHub repo in Red-By-Example . Can someone from the team publish the site?

[12:31:02](#MIOR2FBOiBuHyFdVHxaB1FyyaR8sm1i-lhMhos4le-E) <loziniak (Maciej ≈Åozi≈Ñski)>:
* Hi! I added links to GitHub repo in Red-By-Example . Can someone from the team publish the site?
https://github.com/red-by-example/red-by-example/commit/a95eeac11157043fdc1398ea60f6eafc17702213

[19:14:22](#lGb47uliAL81y_VFuWleywwGO0TTr66HDNBEYpLt4EI) <greggirwin (Gregg Irwin)>:
I don't remember who is doing that job now.

[21:58:26](#DGakfjUO4rQBvSSRdckxMqQxl_sWjvFw936q8lBwgOw) <loziniak (Maciej ≈Åozi≈Ñski)>:
At the time of transitioning from Arie and Mike you [wrote](https://gitter.im/red/docs?at=5e5303dcdafa3029f64ca385) about @x8x .

[21:58:58](#JUaeXgHE-OXQQcU2jklpgVIPoikW5bZ8P7oBDH3NOXg) <loziniak (Maciej ≈Åozi≈Ñski)>:
* At the time of transitioning from Arie and Mike you [‚Üëwrote‚Üë](https://gitter.im/red/docs?at=5e5303dcdafa3029f64ca385) about @x8x .

[22:39:46](#11CkKYEzjjgkfvoGu8r1XE_p0TcAb9PYT9oQxhZk1dI) <greggirwin (Gregg Irwin)>:
OK, he's not around much these days, so if he doesn't respond we'll have to figure out a new plan.

## 10-Dec-2022

[9:19:54](#_Oyuli8HEzDSyqcgB_IUw6gP04jTl951WbuAFrQUtXA) <mikeparr (mikeparr)>:
Let me know if I can help.

## 12-Dec-2022

[3:48:51](#GbGY6HKuPSQBsHNd44saVFDDaFFr0Ad0WKiWmu3kg9k) <greggirwin (Gregg Irwin)>:
Will do. Thanks.

## 31-Jan-2023

[20:52:56](#KejUZidbrlvFSC86-9vwUcuqWVuuzHA-_eoYlZL3xWM) <greggirwin (Gregg Irwin)>:
@BaronRK pointed me to [this](https://muffinman.io/blog/draw-svg-rope-using-javascript/), which is a really nice article, and a great example for how to explain something, including code and interactive elements.

## 6-Feb-2023

[11:01:53](#qp0lOnDop4-tUL5C_cxJ1UR-FheSozpdLe-ZRVL-ZDg) <hiiamboris (NOT THIS ONE)>:
this query might actually be somewhat useful to see what we're missing:

me:
> What are most visited resources on the Red programming language? Provide links.

chatGPT:
> 1. Stack Overflow - https://stackoverflow.com/questions/tagged/red-programming-language
> 2. Red Programming Language Website - https://www.red-lang.org/
> 3. The Red Forum - https://forum.red-lang.org/
> 4. Red Programming Language Docs - https://doc.red-lang.org/
> 5. GitHub Repository - https://github.com/red/red
> 6. Red Tutorial - https://www.tutorialspoint.com/red_programming_language/index.htm
> 7. Red Cheat Sheet - https://www.cheat-sheets.org/saved-copy/red-language.pdf

[18:23:05](#hHazVJYhonjXAwA3HY8UO9xvCuh1TLHScGBVP2-wRt8) <greggirwin (Gregg Irwin)>:
What is https://forum.red-lang.org/ ?

[18:26:20](#jH9hqj_-oHblmDNhzRlTB8LF8H3YSTROCu1LcspLyF4) <hiiamboris (NOT THIS ONE)>:
what is half of the list? :)

[18:26:28](#yfpM5XwahVJRu-2rntVlacwkqAdIBxnE0W_VHRc42AM) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Most probably a glitch in the Matrix. Should exist, or just AI engine is Orca and knows it will exist one day ...

[18:26:34](#1KY9PmedLu_NnpFiElN5YGEt5PYa5-4xv1BntsmRsFw) <ne1uno (ne1uno)>:
imagination.  cheatsheet needs links too

[18:27:17](#TZh1lRFGXqDcpR_5jXkUIwDFymjloxK12qFoNY4Ihug) <hiiamboris (NOT THIS ONE)>:
IMO that's just how it's heuristics sees other languages evolve their docs

[18:27:40](#5NflBUvmnVtq2fxnUZo-npWGR4Emt20PSEfVZiMKBlE) <ne1uno (ne1uno)>:
https://cheat-sheets.org/   krassotkin@gmail.com

[18:27:43](#X2fzlAh5F1h2qjmWDEZWZUcJKikJHV_zVdxB6_AxsHc) <hiiamboris (NOT THIS ONE)>:
it likely projected forum.rebol.info -> forum.red-lang.org by subsituting the domain

[18:29:05](#mObJrPOS8wJF17iKsdr84SmTaqoJwka-8JRk_aii6uE) <ne1uno (ne1uno)>:
provide, but verify

[18:32:43](#VnAYEqRYjhZWHgw9ib3XHOg359gWiVs_Cx3aQuQMrG0) <hiiamboris (NOT THIS ONE)>:
I asked it, it cannot visit web links :) so verification is left up to users

[18:34:08](#4RPS7Lvf6THJBZYlP_qTJcmbO-ogh2C3ByeMGqOSeEk) <greggirwin (Gregg Irwin)>:
Agreed. It's teaching us how to squat domains what subs people expect.

[18:34:44](#oWk-tRkmyM-oWZFqm9kuZK7-7JQGQhHKeP6cL4wBuVU) <greggirwin (Gregg Irwin)>:
So it's not that it knows everything, it's that it trains *us* until its results are correct. Now *that's* smart.

[18:35:13](#13rqgm1iP-JpCaijSkEucXMairikFyolFveeCaBEXYI) <hiiamboris (NOT THIS ONE)>:
:)

[18:37:57](#LzWr6zFbHiP-IjwIC1TtMzrVq6xPq3dteJauO_JxK4E) <ne1uno (ne1uno)>:
I'm using webchatGPT,, all I got was red-lang.org. no prompt fu yet

## 7-Feb-2023

[7:36:23](#cKxl9R_0QcXnFXFzkT6v6fVdXzMJMb_kw-tIM1v0ZH4) <GiuseppeChillemi (GiuseppeChillemi)>:
> What is https://forum.red-lang.org/ ?

A hallucination of the AI, maybe it is on drug.

[7:36:29](#HNM12f9F1oc5Ga1OBiwyfIYlsqepIxGNCSsksT3dmAw) <GiuseppeChillemi (GiuseppeChillemi)>:
* > What is https://forum.red-lang.org/ ?

A hallucination of the AI, maybe it is on drugs.

## 25-Apr-2023

[14:15:06](#w80zChoGYo-DjcGG_j--1ctc9bU3_iRISBIDb78M3iE) <GiuseppeChillemi (GiuseppeChillemi)>:
Here: https://github.com/red/docs/blob/master/en/vid.adoc , VIEW is pointing to nowere: https://github.com/red/docs/blob/master/en/view.html

[14:15:18](#VVTaEMERjgujiOEnwsx4y6_nzXCcajtFZO1rL-96SWM) <GiuseppeChillemi (GiuseppeChillemi)>:
 * Here: https://github.com/red/docs/blob/master/en/vid.adoc , VIEW is pointing to nowhere: https://github.com/red/docs/blob/master/en/view.html

[16:00:05](#5iMHJEe7uEqy20601RPF7ZNR8u9syVi9N37ibn7eFIY) <greggirwin (Gregg Irwin)>:
Thanks for the report. Fixed.

## 8-Jun-2023

[18:19:37](#XTF3wPsGBlZ4AAAys8m826pjgcxrHZ5upoRcvWAJzqM) <hiiamboris>:
https://helpin.red seems down, probably for a while

[19:07:19](#FPwo1gsIoYvxvY1xqIgyCOtMrKgW3owfVDA_eI4vzIc) <greggirwin (Gregg Irwin)>:
It's up for me.

[19:14:29](#b-_0PdDC68nFqwDnPGtzZA28qEpacjlKCl5EEl0Iqis) <hiiamboris>:
interesting..
this is what I'm seeing on one browser: https://i.gyazo.com/5ef2deb1ad574170d9c7ba1f90126426.png (no way to pass thru)
this is on another https://i.gyazo.com/b625b13748aa8fc4bd93459b583c3236.png (but yet it works after confirming exception)

[19:15:42](#IPLH-TV7-vkAIG0Lb8AFycRA9LxwUGtEXSlQWGR0ZgQ) <greggirwin (Gregg Irwin)>:
Yes, seems it's http only.

[19:16:52](#yuMdlENHmKA0Z6FGWGbta-VeuWEuVxp2W7ZP8Gp4aPk) <hiiamboris>:
does http: not redirect you to https: ?

[19:17:18](#z-EgWoxZ90LZFd4i9Ah5Gkfn2labd4SWa_O7hAvxteM) <greggirwin (Gregg Irwin)>:
I just have to say "Yeah, I know it may be unsafe. Let me in."

## 25-Jun-2023

[22:59:38](#C12XquIOuH2tkghswzkfoyxYu8wbhrsn7WLgaPTd7tI) <GiuseppeChillemi (GiuseppeChillemi)>:
Broken links on: https://github.com/red/red



This: https://github.com/red/red/blob/master/usage.txt
In "Cross-Compilation Done Right" , word DONE
 

This: http://www.maxvessi.net/rebsite/Linux/ 
In LINUX
From here: https://github.com/red/red#running-red-from-the-sources-for-contributors

This:
https://github.com/red/red/blob/master/.gitignore-sample
From the same place, "git ignore sample"






[23:09:48](#elwLcK7KC8BhViqG7GGodyk197r0uNAuU8znyTCIguY) <GiuseppeChillemi (GiuseppeChillemi)>:
Also:

This: https://github.com/red/red/wiki/%5BDOC%5D-Introduction-to-ICOs,-wallets-and-cryptocurrencies
From: https://github.com/red/red/wiki/%5BLINKS%5D-Unofficial-Tutorials-and-Resources
(Last one)


[23:11:24](#9dgmtoV50R2wJjbZQ4js90tQMXB2101NsBO2TTJFMKQ) <GiuseppeChillemi (GiuseppeChillemi)>:
Nenad interview:
https://notamonadtutorial.com/interview-with-nenad-rakocevic-about-red-a-rebol-inspired-programming-language-681133e3fd1c#.zhif5dl17

From:
https://notamonadtutorial.com/interview-with-nenad-rakocevic-about-red-a-rebol-inspired-programming-language-681133e3fd1c#.zhif5dl17

Is not available

[23:13:47](#vT-DlPUh-eiNVp6oWMPA5CY1MRHN8MkHZkqWepCk7Oc) <GiuseppeChillemi (GiuseppeChillemi)>:
Gitter chat link in the same page does not work:
https://gitter.im/red/


[23:16:25](#ekp_sk9b7FABf6wTIpxYUw5O5QlLtWJKqaBxA7dDAiE) <GiuseppeChillemi (GiuseppeChillemi)>:
MyCode4Fun has disappeared, it should be changed with the wayback machine link:
https://web.archive.org/web/20220701000000*/http://www.mycode4fun.co.uk/

[23:19:22](#qg6OyyGPM3SQvXFr6_LONJhYg1eG2YDGGvXBB4V2BA0) <GiuseppeChillemi (GiuseppeChillemi)>:
This link has disappeared and isn't at archive.org
http://www.michaelsydenham.com/reds-parse-dialect/

[23:20:21](#FEjcd_v9aUmQkpKqMJSkmaCL-dQGDVLiIa9xj0r5wj0) <GiuseppeChillemi (GiuseppeChillemi)>:
Learning RED must be changed with this:
https://web.archive.org/web/20190718105203/http://learningred.com/


[23:25:06](#XUauQBcuosWAe-q0_0vQevin9_1AcnwkZv49gZcBWBY) <GiuseppeChillemi (GiuseppeChillemi)>:
Rebol Informe is GONE too, should be changed with this:
https://web.archive.org/web/20200902001629/http://rebol.informe.com/portal.html

[23:27:05](#PyEYXa_TSR54D4cyoW2nSn-xLzxC8vP_VHZJkMRRyus) <GiuseppeChillemi (GiuseppeChillemi)>:
Wikibook rebol programming links leds to nowhere:
https://en.wikibooks.org/wiki/Rebol_programming
The correct version has P as uppercase
https://en.wikibooks.org/wiki/Rebol_Programming

[23:28:48](#W3zSmoI7yCOMFIGXLkqSrgcz2WQLi_9ct9n19OFYqRs) <GiuseppeChillemi (GiuseppeChillemi)>:
Rebol Concepts links must be changed as follow:
https://web.archive.org/web/20210917101238/http://www.codeconscious.com/rebol/articles/rebol-concepts.html

[23:29:52](#7eUM4b163CD0fp_LAsxBhQq94sp3rfzPUy3RQ1JOSmg) <GiuseppeChillemi (GiuseppeChillemi)>:
An Apreciation of Rebol by Rudolf Mejer should be changed as follows:
https://web.archive.org/web/20201112014441/http://users.telenet.be/rwmeijer/proglang/rebol.htm

[23:32:32](#11DKCt0xnB7Hr2dc4Me6vA1kgJAB4udG8Xw5swBoT34) <GiuseppeChillemi (GiuseppeChillemi)>:
Rebol desktop project must be changed with this:
https://web.archive.org/web/20200225073718/http://desktop.rebol.info/

[23:36:33](#6_okEhjiX68McLVILOmMfhSfquI8_eRQ9ZJ_k0Fve5I) <GiuseppeChillemi (GiuseppeChillemi)>:
Revault has gone and can't find a working version, it must be removed

[23:38:24](#1qhkBwqmGcWrxYsjRwxHjWH7QaGdt-ej5wdN8ZniGus) <GiuseppeChillemi (GiuseppeChillemi)>:
CHANGING PAGE:
This: https://github.com/red/red/wiki/%5BHOWTO%5D-How-Do-I-Do-X-with-Red%3F
FROM here:
https://github.com/red/red/wiki/Beginner's-FAQ
Does not work

[23:41:34](#aewCVthAA5B4-RwvIeyrlnr-m9Y8Q2Y7dirSgddQ1Yo) <GiuseppeChillemi (GiuseppeChillemi)>:
CHANGING PAGE:
The link: 
https://gitter.im/red/red/help
From:
https://github.com/red/red/wiki/%5BLINKS%5D-Gitter-Room-Index
Is wrong

[23:43:25](#P0T-FfNtY2RPTOvgQGGUQoC2w8bV5vtbbDu69NjEwk4) <GiuseppeChillemi (GiuseppeChillemi)>:
Also: 
https://app.gitter.im/#/room/#red_red_links:gitter.im


[23:44:11](#qmQ-I6-sNyR0DJItmJuswFeMxHvJuMpaez1KYB-NUG0) <GiuseppeChillemi (GiuseppeChillemi)>:
This page is empty:
https://github.com/red/red/wiki/Room-suggestions

[23:45:02](#c9EuWLVmW8IMwhMtldICcFRdtrFPQuREMouSTvRkZWA) <GiuseppeChillemi (GiuseppeChillemi)>:
CHANGING PAGE:
This: 
https://gitter.im/red/red/links
From: 
https://github.com/Ren-data/Ren/wiki/Gitter-Room-Index

Does not work

[23:49:47](#_8P59sqaOCCZAxhEdsp3X4jiBpMiVT8vZqTXL01gC_M) <GiuseppeChillemi (GiuseppeChillemi)>:
In this page:
https://www.red-lang.org/p/about.html
The DONE RIGHT link is wrong


[23:51:38](#AvuZpKRvOXdEeER_NuPetPtgsknWbvIpfUHsd7Fq2bQ) <GiuseppeChillemi (GiuseppeChillemi)>:
And finally, the REBORCON on the same page must be changed with this:
https://web.archive.org/web/20160311090534/http://reborcon.esperconsultancy.nl/

## 26-Jun-2023

[0:57:06](#AaAxiN12mnLraUZD73tED8fopJcgl79I9ii2-OeG1IE) <greggirwin (Gregg Irwin)>:
Thanks GiuseppeChillemi (GiuseppeChillemi) ! Lots of things to fix.

[8:10:26](#r9zL2MCpII4YU08I_dkktDvMVkUKwK48qDRAxBhqlNc) <hiiamboris>:
https://github.com/r3n ?

[12:46:22](#pz7F6Yagak3T15Et1OKoz44OGaFNeiMIPnns4oyvuQ4) <dockimbel>:
Thanks! It would have been easier if you could submit PRs for the 404 in red/red repo.

[12:46:51](#puM-6zVOIw5DMBI1MNTZDPAJVmTyY_RjMPT_j1V0TaU) <dockimbel>:
 * Thanks for the review! It would have been easier if you could submit PRs for the 404 in red/red repo.

[13:30:43](#PXlJE3IAtRKMYj9x_vvc946AXTDWz1hFNaGCPbsI3cw) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@dockimbel-556597ad15522ed4b3e10020:gitter.im> Thanks for the review! It would have been easier if you could submit PRs for the 404 in red/red repo.

I could open a ticket with a reference to the first message on this topic or I could copy everything if you want. What you prefer?

[14:35:02](#z6IQ1bftryqggg--RXFg_CYwugRH0yBfrR6eACU1cAU) <dockimbel>:
Just a PR for red/red.

[14:35:11](#76eXUKjweqofayvPVhzji6rAl8cka336r6eesI_PEzY) <dockimbel>:
 * Just a PR for fixes in red/red.

[19:04:02](#dFTbfvM1Vyhri-X3npiuIcRkLCmMRiQGLFSZE6IDzVM) <GiuseppeChillemi (GiuseppeChillemi)>:
dockimbel: PR = Pull Request?

[19:08:15](#QUZGbfQnDWF4LnEHavtA0kXVr8Asprp6Xvm3Y2KJL3o) <hiiamboris>:
yes

## 12-Feb-2024

[14:42:51](#FvrUVTcg3NzMhFf_JPpLpz88NMNPpLX1Izaoj9ywkw8) <loziniak (Maciej ≈Åozi≈Ñski)>:
> <@giuseppechillemi-59045d00d73408ce4f5bcd9d:gitter.im> Nenad interview:
> https://notamonadtutorial.com/interview-with-nenad-rakocevic-about-red-a-rebol-inspired-programming-language-681133e3fd1c#.zhif5dl17
> 
> From:
> https://notamonadtutorial.com/interview-with-nenad-rakocevic-about-red-a-rebol-inspired-programming-language-681133e3fd1c#.zhif5dl17
> 
> Is not available

"We aim at launching the 1.0 release in 2016" :-)

[14:52:00](#o7pqBYzb1rJ5PShRzQX0qytTtzW4jiycqAXxYpWdFhA) <loziniak (Maciej ≈Åozi≈Ñski)>:
I recall, that some time ago I had an idea about adding "see also" references to `help-string` output, and probably talked about it on Gitter. Does anybody remember the outcome of this discussion? I remember at least greggirwin (Gregg Irwin) had an opinion on that. I searched wiki and REPs, and could not any record of that.
I'd like to work on that and would like to know, what chances are that this work would be useful and get merged into codebase.

[14:54:26](#rG9T3lcUTZ_yEofS26mhtqXoA_tdttOrFtxwsvtpbrU) <hiiamboris>:
good idea

[14:54:52](#uHM4dm6kfu3RPqG1tBEx3Momi9eKJnUrPZgHqRBrX3A) <loziniak (Maciej ≈Åozi≈Ñski)>:
Today morning I sat and outlined a simple sketch of rules for this:

- #red "related" in cli docs
	- All words are divided to **3 equal groups**, sorted by popularity.
	- Each word can have **max 6** links to other words or backlinks (links from other words).
	- There can be **only two** (back)links from/to each group per word.
	- Links can be made only to words from the same, or **less popular** group. This means for example, that words from group 1 cannot have backlinks from words from groups 2 and 3, and words from group 3 can link only to words from the same group. This rule could be checked with some **tolerance** (i.e. groups can overlap), like +/-5%.
	- **Links are selected** by developers, backlinks are automatic.
	- For words with less than 4 (back)links, they will be supplemented **randomly** with links to each other. It can be explained by them having one thing in common ‚Äì¬†be **unrelated** to any other word.
	- Related words are presented in docs **sorted** by popularity. Randomly selected links should be presented at the end.

[14:55:07](#zR9DFGNBw4TwpQTfcmLVru72ISCO6IGexDQ2GI-f4PQ) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@loziniak-5a7ad629d73408ce4f8c1077:gitter.im> "We aim at launching the 1.0 release in 2016" :-)

Rename Red to 1.0 and It will happen now 

[14:55:09](#xsJiuvXB-zSv38Ry-OE77kCx-f3jh3phYf8DCComj0c) <loziniak (Maciej ≈Åozi≈Ñski)>:
 * Today morning I sat and outlined a simple sketch of rules for this:

    - All words are divided to **3 equal groups**, sorted by popularity.
    - Each word can have **max 6** links to other words or backlinks (links from other words).
    - There can be **only two** (back)links from/to each group per word.
    - Links can be made only to words from the same, or **less popular** group. This means for example, that words from group 1 cannot have backlinks from words from groups 2 and 3, and words from group 3 can link only to words from the same group. This rule could be checked with some **tolerance** (i.e. groups can overlap), like +/-5%.
    - **Links are selected** by developers, backlinks are automatic.
    - For words with less than 4 (back)links, they will be supplemented **randomly** with links to each other. It can be explained by them having one thing in common ‚Äì¬†be **unrelated** to any other word.
    - Related words are presented in docs **sorted** by popularity. Randomly selected links should be presented at the end.

[14:56:08](#NvRVUC2Dv8Di9zNh7beHSaHbkLOQ7uFSnXyJHBCmeDE) <loziniak (Maciej ≈Åozi≈Ñski)>:
 * Today morning I sat and outlined a simple sketch of rules for this:

- All words are divided to **3 equal groups**, sorted by popularity.
- Each word can have **max 6** links to other words or backlinks (links from other words).
- There can be **only two** (back)links from/to each group per word.
- Links can be made only to words from the same, or **less popular** group. This means for example, that words from group 1 cannot have backlinks from words from groups 2 and 3, and words from group 3 can link only to words from the same group. This rule could be checked with some **tolerance** (i.e. groups can overlap), like +/-5%.
- **Links are selected** by developers, backlinks are automatic.
- For words with less than 4 (back)links, they will be supplemented **randomly** with links to each other. It can be explained by them having one thing in common ‚Äì¬†be **unrelated** to any other word.
- Related words are presented in docs **sorted** by popularity. Randomly selected links should be presented at the end.

[14:58:24](#p1JSNr8ZOoFiWnpWHrQfHaOFOwNFR7Su2PTYYbXPQy8) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@loziniak-5a7ad629d73408ce4f8c1077:gitter.im> Today morning I sat and outlined a simple sketch of rules for this:
> 
>     - All words are divided to **3 equal groups**, sorted by popularity.
>     - Each word can have **max 6** links to other words or backlinks (links from other words).
>     - There can be **only two** (back)links from/to each group per word.
>     - Links can be made only to words from the same, or **less popular** group. This means for example, that words from group 1 cannot have backlinks from words from groups 2 and 3, and words from group 3 can link only to words from the same group. This rule could be checked with some **tolerance** (i.e. groups can overlap), like +/-5%.
>     - **Links are selected** by developers, backlinks are automatic.
>     - For words with less than 4 (back)links, they will be supplemented **randomly** with links to each other. It can be explained by them having one thing in common ‚Äì¬†be **unrelated** to any other word.
>     - Related words are presented in docs **sorted** by popularity. Randomly selected links should be presented at the end.

I am working on a simple augmented help which searches on a links DB. It is no more an embryo and could do simple search. It Is the reason why I am investigating into help-string and brothers.

[14:58:56](#FIWPq9mt-UCcgbCOMJcjKm4q6OWzY9asC3qkZQ4Cpoo) <loziniak (Maciej ≈Åozi≈Ñski)>:
 * I recall, that some time ago I had an idea about adding "see also" references to `help-string` output, and probably talked about it on Gitter. Does anybody remember the outcome of this discussion? I remember at least greggirwin (Gregg Irwin) had an opinion on that. I searched wiki and REPs, and could not find any record of that.
I'd like to work on that and would like to know, what chances are that this work would be useful and get merged into codebase.

[14:59:13](#tuR1PBEXUpRxk08GniZx3N-EeTWeqAAAG7S6DFaNUHk) <loziniak (Maciej ≈Åozi≈Ñski)>:
 * I recall, that some time ago I had an idea about adding "see also" references to `help-string` output, and probably talked about it on Gitter. Does anybody remember the outcome of this discussion? I remember at least greggirwin (Gregg Irwin) had an opinion on that. I searched wiki and REPs, and could not find any record of that.
I'd like to work on that and would like to know what chances are, that this work would be useful and get merged into codebase.

[15:02:45](#uMsp07_g5lNSh291NcxmwJnPJxmBRtGVWVcXfeH02W8) <hiiamboris>:
loziniak (Maciej ≈Åozi≈Ñski) why this structure? why not just list a block of related words per each word?

[15:07:26](#rgU7PKYAruEGvZCSehi2MsQbrAB6MdsfrI5WPvm-KB8) <loziniak (Maciej ≈Åozi≈Ñski)>:
I think some structure is needed, so that we would not end up with groups of words relating to each other. The main purpose of this is to improve Red's **discoverability**, so that following the suggestions could take you into unexpected places and stimulate your creativity.

[15:09:21](#-W1Iv8ZrpKlZzUYEl88hZuIc46iYM--4D9Gaxm0cwiI) <hiiamboris>:
isn't it expected e.g. that `append` and `insert` would relate to each other?

[15:12:27](#WLAL1BDHh4PwAxqHNKDpy5Ihljb_CuI8XhsPqbSdtKs) <loziniak (Maciej ≈Åozi≈Ñski)>:
Yes, they could be linked of course, but there are [a lot of related words](https://www.red-by-example.org/#cat-s01), and I think we should try to include less popular constructs, like for example `poke`

[15:13:45](#r6iOA4TpNGHaTTouGNMLknIiUiX7BRHpZfa5eHJWIUQ) <hiiamboris>:
so basically you want the whole graph to be connected

[15:14:15](#xYm2lbDdL5Qjv1RAPBKCMxaklPY14F1A4Gu_99bfWD0) <loziniak (Maciej ≈Åozi≈Ñski)>:
as much as possible and sensible :-)

[15:23:03](#aSBPkkyuysTsItnYH2Gr99krm7f6b9-pewWiXT9Hdlg) <loziniak (Maciej ≈Åozi≈Ñski)>:
> <@hiiamboris:tchncs.de> loziniak (Maciej ≈Åozi≈Ñski) why this structure? why not just list a block of related words per each word?

List of related words would be a final result, but when creating it, we could use some rules.

[15:26:12](#8U-mu-ZeE-AdKDXgO7AsaRk_UW4VZen_WcIdkxEEFV0) <loziniak (Maciej ≈Åozi≈Ñski)>:
 * I recall, that some time ago I had an idea about adding "see also" references to `help-string` output, and probably talked about it on Gitter. Does anybody remember the outcome of this discussion? I remember at least greggirwin (Gregg Irwin) had an opinion on that. I searched wiki and REPs, and could not find any record of that.
I'd like to work on that and would like to know what chances are, that this work would be **useful** and get **merged** into codebase.

[15:28:52](#3lPXmjIs-smB5hLKwi4__0CsHJfS0c4AtvTKUK6_cUU) <hiiamboris>:
understood

[15:30:12](#i4fGoRn8Z91z03lF4O7PUyGUCpq93UFT3sbuc5PXqw8) <loziniak (Maciej ≈Åozi≈Ñski)>:
Is it some kind of web crawler? Seems interesting...

[16:06:57](#qSZ9eu56CbIrEQsj5gtFIsuEUTLZnTj9o95qIV6JKxc) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@loziniak-5a7ad629d73408ce4f8c1077:gitter.im> Is it some kind of web crawler? Seems interesting...

I have a collection of Red/Rebol Links. Also I am implementing crawling capabilities for repositories

[17:24:07](#AZW_JcHcWywXurMtfrF1OGNcyDtgPvHGvGgk0AaI-ro) <loziniak (Maciej ≈Åozi≈Ñski)>:
 * I think some structure is needed, so that we would not end up with groups of words relating to each other. The main purpose of this is to improve Red's [discoverability](https://www.interaction-design.org/literature/topics/discoverability), so that following the suggestions could take you into unexpected places and stimulate your creativity.

## 13-Feb-2024

[16:27:25](#PY20ViofmEDr6kxjXXAGzP9YFtcuIqLKE6p3RI7d6Ls) <greggirwin (Gregg Irwin)>:
The chances of it being merged depend on how much the change affects Red, and what @dockimbel thinks. I think the best approach is to get the work out there, in red/code or red/community, or even on their own repos, and build support. It's harder when something affects Red syntax directly.

For this feature, I wouldn't try to make it part of function syntax or doc strings, but as additional, even external data. Then have extended `help` that knows how to leverage it. Another aspect to this is user contributions. If we build it in, and it's part of the Red codebase, it will be harder to change. And the popularity aspect is either set by a designer, or adapts over time.

[16:29:43](#WZwHqBVX4mGkbJy5cirofFMjWvROVQ9jYgwVJqBhSXE) <greggirwin (Gregg Irwin)>:
I liked the old Rebol Word Browser, which inspired my DictMock experiment. (to be called DictDoc when done :^)

[16:29:51](#r5jCIXxeDED1dqZI1sL-B5ODTJQsCe6PnXqWj-4mUHI) <greggirwin (Gregg Irwin)>:
![](https://gitter.ems.host/_matrix/media/v3/download/gitter.im/8898f1dff76744cfb97d792290866a3e3f0f7f9b1757441965282033664)

[16:34:22](#vmbnTViWDQd8rQcPCtteMPz9E1iZwqCIUi1iRN9FZUE) <loziniak (Maciej ≈Åozi≈Ñski)>:
As an external tool it does not have much sense in my opinion. We have Red-By-Example and it serves its purpose, no need to duplicate that. My idea was to have something built-in. I could try to come up with some sketchy proposal, but if it's not accepted, I'd probably abandon it.

[16:35:19](#6OZB-QKthtuK__q9uegxcVdYHyTKx7G-_rCksibxPFs) <loziniak (Maciej ≈Åozi≈Ñski)>:
 * As an external tool it does not have much sense in my opinion. We have Red-By-Example and it serves its purpose, no need to duplicate that, better to update and extend. My idea was to have something built-in. I could try to come up with some sketchy proposal, but if it's not accepted, I'd probably abandon it.

[16:35:48](#GGpP6fEWalUscC_PeIkSJPw7ZsFn5g09PR_MFWtRafk) <greggirwin (Gregg Irwin)>:
I don't mean we *shouldn't* extend `help` for this, just that the more you try to add to Red, the less chance it has of getting merged. 

[16:37:40](#sNnIQ9K5jm3GaViqWvv_f6awe69MsPiznuhjKNbnS3U) <greggirwin (Gregg Irwin)>:
So show how it works, make it easy to work with the data, including user contributions, voting, etc., and extend to libraries and modules. Red is a messaging language, designed to work with its own data. That data doesn't have to live in the core binary.

[16:38:32](#6blCTJrteiFwVtqSST4mGXWdRxHHer7PgncUzm4d8j8) <hiiamboris>:
If it doesn't get merged you will be able to just make it a module for the Spaces console :)

[16:38:43](#qbM5Td40edis_2otVJHL5pAeFR5b6YJSC7atwLBiYsA) <hiiamboris>:
Plan B :)

[16:42:55](#D-WOrDORJI7Sum8gLTnuaMTp-yRv04L7w-yo3hEy5PE) <loziniak (Maciej ≈Åozi≈Ñski)>:
> a module for the Spaces console

Sounds nice!

[16:54:01](#m1DQZOdTGacBI88sz5UC0BeRTl6vIO1CCHMsO8Mjdi4) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> If it doesn't get merged you will be able to just make it a module for the Spaces console :)

Hey, there Is already my Augmented Docs project to be merged!

[16:54:08](#tWGrk0TUTzLWun5Nn4nYDkdZWrowH8V3W70sz3mcEmg) <GiuseppeChillemi (GiuseppeChillemi)>:
Ì†ΩÌ∏ÅÌ†ΩÌ∏ÅÌ†ΩÌ∏Å

[16:56:07](#i3qHWEjj3kuG4-dyePjzrRCiPpvAgKmVMdKEkXF-cvs) <greggirwin (Gregg Irwin)>:
I guess we should all get our work out there for evaluation.

[17:02:45](#snGEJgsNKoKM3T1bGBYCtEZXVL5gluYEV1Q4HFq8lhQ) <hiiamboris>:
> <@giuseppechillemi-59045d00d73408ce4f5bcd9d:gitter.im> Hey, there Is already my Augmented Docs project to be merged!

if *you* do that, no promises, knowing how complex your code always is ;)

[17:28:09](#9aOgyuNgxYQs3hYmP4NMXlGAfo1kIQmLegOhFQZpJ30) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> if *you* do that, no promises, knowing how complex your code always is ;)

But FYI I have found Red much more stable than I have supposed. I have bended the language a lot and still no great bugs have emerged. It is a good work!

[17:29:05](#nN4v44DRLmLNvZ4wDQkH_9zhub9uUup7SUpyVkA2S0M) <hiiamboris>:
indeed

## 14-Feb-2024

[9:08:15](#sbu_IiojKuQV-ts1-if47j0BPlMltZVW9lB8SE2K1M8) <loziniak (Maciej ≈Åozi≈Ñski)>:
Is there any word usage/popularity data available? Has somebody counted that? I know some word usage is often an argument in design discussions, so someone perhaps created a script for that?

[9:08:39](#BCHDpase08OS5O8fNdYtEbUChYWwjvDVc-xc6Dr6pEc) <loziniak (Maciej ≈Åozi≈Ñski)>:
 * Is there any word usage/popularity data available? Has somebody counted that? I know particular word's usage is often an argument in design discussions, so someone perhaps created a script for that?

[9:58:30](#Fa9DvxIjJe-ufjXqMcEHG8ScnMSw3tGQkSai7X7-m8c) <hiiamboris>:
I only counted loops in local files. But it should be easy.

[9:59:11](#T2896rqBQ4n3DvZlOO3NpaFWt1wSdGl7v1Neh-sz9z0) <hiiamboris>:
Harder part is to gather all big enough Red and Rebol repos in one place :)

[10:02:32](#XM-1S4L8N0HBVMrAIj0kRFv-thsg_VvqXZ52Ru5Kayw) <loziniak (Maciej ≈Åozi≈Ñski)>:
I thought I'd just use `red/code` github repo if the data is not available elsewhere.

## 15-Feb-2024

[19:25:54](#_5tWLs0tovN_vNOv26GKNzDK7YOP8X7ak4JVKIhEIZc) <greggirwin (Gregg Irwin)>:
I gathered func counts in 2012 for R2. :^)

[19:32:29](#I7QRhpNfSx3CpEadyvpyApeuWfkX5JWdKSRR-V-RzMk) <loziniak (Maciej ≈Åozi≈Ñski)>:
Did you write any script for that? This could be a good starting point.

[19:39:53](#0nPW1DZME7vahMRbQtbUIGQJbBfAhPx-dxLr4Wt2lwk) <greggirwin (Gregg Irwin)>:
I'll see if I can find it.

[19:41:07](#2O6kdPTkUrsfLWAJG_qv_QeZSudOX_571XjynUeaRXM) <hiiamboris>:
it should be a parse one-liner

[19:44:55](#6abakYJG3NLm1bQyqR0SaWepZNgiJNbgZMfMYI9nh-U) <greggirwin (Gregg Irwin)>:
Not turning up in a quick search here.

[19:46:33](#GxsqPiFpNOpoWDhG8kPi7EvwF57zAx5l19kx2KKXbC0) <loziniak (Maciej ≈Åozi≈Ñski)>:
> <@greggirwin-55659ddb15522ed4b3e1006f:gitter.im> I'll see if I can find it.

Ok, I'll try with my own, probably repeating your errors and adding my own to it ;-)

[19:47:43](#4qpnGk6EcKv2mfGSn4KS_0q3I-32eLkkr7p3k2HSny0) <loziniak (Maciej ≈Åozi≈Ñski)>:
But learning in the process for sure!

[19:49:44](#8WhO5WMfqTeWqfcYhP6_6QgxCPpz19JgKOgjASKZCxA) <greggirwin (Gregg Irwin)>:
One key is to read the files, not load them.

[20:04:00](#o3F8PLUbFdU6B8bhAAJo5Cq4krXIji17e4eAnghEfmI) <loziniak (Maciej ≈Åozi≈Ñski)>:
Oh, why? Loading the files was my first thought! :-D 

[20:07:44](#y39pDEVJcP3oUK05HSNeDcQZNvctTE8-KHOzLpdUYwE) <greggirwin (Gregg Irwin)>:
My instinct as well, because of block parsing. But any words in the files you load become part of system/words, and will eventually blow the global name space. Should test with loading to see how far it goes now. It used to be a real problem. Of course, in a code base where you *want* to count custom func calls, loading is great.

[20:10:30](#os6M167YgYAFeFDWN5iHX12fmyt__k8Tu5G1vT3uMB0) <loziniak (Maciej ≈Åozi≈Ñski)>:
Perhaps I could `copy system/words`, and restore it after loading?

[20:15:15](#G82n7Kbv3Ns_GirjvS469ckPrTUo18qIRbiDggHkCh4) <hiiamboris>:
IIRC word limit is only a thing in compiler right now

[20:16:00](#brE3naVtd1jOtidhQvGsJBcA-OyJgHwR3YhFa00ohwI) <loziniak (Maciej ≈Åozi≈Ñski)>:
Ok, THAT  kind of blowing!

[20:16:05](#XoAg1jXvGvY1Lz0KkkBqgug3noQwMtTmBwPlFHb9dLo) <greggirwin (Gregg Irwin)>:
Well, try loading and see if it blows up. :^)

## 15-Jul-2024

[17:02:20](#msSpmTYffHqFT133QP8nWP8F9C5jpK6A1ie4GZzZhRI) <3xtraterrestrial>:
Curious as to how far behind we are from this timeline given ?
https://www.red-lang.org/p/roadmap_2.html

[18:09:16](#Aw3E_tT2r1vCGPgc4c98TFbmDuUXIGuMuUo7E--Vp9Q) <greggirwin (Gregg Irwin)>:
New roads opened, old roads closed. Road construction continues. :^)

[19:14:09](#O_pXngw9krnuj9w7E9P1S5n55vLemrmFqPs_friMTYo) <3xtraterrestrial>:
Any Idea on expected ETA for 64 bit support ?

## 16-Jul-2024

[7:22:23](#k2Bb1Ym_yTLmY6XwnDlL5oD9G-DC_a9OHEdzDknitiU) <GiuseppeChillemi (GiuseppeChillemi)>:
My personal opinioni: 1,8 years 

[7:22:34](#GeCnwcXA96DDw2oAiaMVuhIfHBo8V6CPcf65urcSzeo) <GiuseppeChillemi (GiuseppeChillemi)>:
* My personal opinion: 1,8 years 

## 17-Jul-2024

[17:59:19](#cxpigprUO5gMcl8qgFphzKZHzpKy-2ucbgugWWWdGCk) <greggirwin (Gregg Irwin)>:
No ETA for 64-bit at this time.

## 19-Jul-2024

[17:38:01](#iBE-2iSDCL5R7-EP3uPLbODXJ80EaQWZ6mTIWMZOo-s) <3xtraterrestrial>:
So in your opinion, would you not recommend trying to build out a commercial application using Red at this moment?
Would it make more sense to choose something like Rebol and transition to Red later on with 64 bit support?

I do really want to try and use this language to support my clients but a little scary not knowing a hard set timeline of when to expect updates to the language, especially the 64 bit support . 

[17:40:18](#ZQa3HYMv9VbLTK7o_zXh_87wflDagjB7vdihsyS-dYU) <3xtraterrestrial>:
> <@giuseppechillemi-59045d00d73408ce4f5bcd9d:gitter.im> My personal opinion: 1,8 years

Thanks, is that 1 to 8 years OR roughly 1.8 meaning a year and some months ?

[17:56:58](#V17vLxOgE8h0hsB3uU5PFuISDRU9wj7Yh7-6Zxwo64c) <hiiamboris>:
do you really require 64 bit to go commercial?

[17:58:17](#X2PF7ZCfUGHqThteJr32Srv6gw8z1U2S-4kUwMccfFg) <hiiamboris>:
if you tell us what is your planned app domain, we may advise

[18:02:52](#BUUPouGYeM5ADTfSCUUvqAu7diUZDe8xtGex8BNlens) <3xtraterrestrial>:
Probably not from the get-go, but clients are weird in what they require from a application that they will pay for and I have had some come to me and deny services because language didn't support said feature. 

App domain, very user concentrated. Applications that have to do with, real time data delivery and placing orders or requests. So like sports betting, financial trading, etc... 

[18:03:53](#B_kwmYbr37SFzVOBCdjHMN-zo6oU2xe6dzGG8SUg2XY) <3xtraterrestrial>:
 * 
App domain, very user concentrated. Applications that have to do with, real time data delivery and placing orders or requests. So like sports betting, financial trading, etc... 

[18:04:19](#ERD6ZdIkF1Bx3KGsmlEgDJgwA9szj40-UI45GCYaVTA) <hiiamboris>:
then I would not recommend using Red atm, since it's both single threaded and worse - has no async networking

[18:06:18](#b9GVJHMQKb68UXras-XrZz60RD9QQUqAnho1tm-BuPA) <hiiamboris>:
also it crashes at times or just corrupts its own memory and does something odd..
simple scripts may run for months, but the more data crunching you're doing and the more sensitive that data is (money) the riskier it gets

[18:08:01](#-_ZjSJs5H9ceGBkNSUpJOOMHHNrl_9ZzYn5kjB2sp5c) <hiiamboris>:
though you still have an option of doing the risky work in the C lib, and using Red for the UI.. just more work and requires system level coding skills

[18:08:54](#WmDbeFHxZT7xoFY7DJCsVKSMXmFvGx5poVxywAEORLk) <3xtraterrestrial>:
Ì†ΩÌ±çÔ∏è

What about Rebol itself? Would the change from building out applications in Rebol then transitioning to Red when more stable not be worth the squeeze, in terms of the amount of work that would be required probably.

[18:10:05](#GLg6O_BMaeX0tCHbDvgP3esNzsrSNXIacMQeanqgO5E) <hiiamboris>:
since the foundations of both languages are very close, it may work, yes

[18:10:51](#tH-ZNsvOX_POkWNRyfX-x9dTGCpbyOhvu6CC0E0qwf0) <3xtraterrestrial>:
Thank you for your input

[19:59:58](#N6hRnxUFHMN4VsLkjwgywrAjOLD84hN0JEoKzGNmA5w) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@3xtraterrestrial:gitter.im> Thanks, is that 1 to 8 years OR roughly 1.8 meaning a year and some months ?

1 year, 8 months

## 20-Jul-2024

[10:59:36](#-xFeJf-EYypIjyujXfqWV4ww2_kQwGqMV9nDbfGbDx4) <gurzgri>:
Yes, estimates based on e.g. story points are well established and ubiquitous, but in my opinion, too, it‚Äôs a pity that far too less people in the industry are privy to duodecimal time based estimates /s

[10:59:58](#ybERUtCoR_RWpcmkKQ4CBDJbLs6ch1uAYNXdwlM3Bhk) <gurzgri>:
* Yes, estimates based on e.g. story points are well established and ubiquitous, but in my opinion, too, it‚Äôs a pity that far too less people in the industry are privy to duodecimal time based estimates /s Ì†ΩÌ∏â

## 26-Sep-2024

[19:00:14](#zbqMZB9C6U9i9cTE6ggAI30M-ZGhP9vCDM0pScOJjYQ) <GiuseppeChillemi (GiuseppeChillemi)>:
Why in this code in documentation we have COMPOSE?

[19:00:18](#eeO-bSiAOsvK9xNXNek_JJ0C8GrVSgK8taIHzWGDabg) <GiuseppeChillemi (GiuseppeChillemi)>:
![](https://gitter.ems.host/_matrix/media/v3/download/gitter.im/b32b91041ae10ff1425b1abd1542f789d39171631839379487037325312)

[19:00:25](#VEiUOSOBvBRg7AMLspuGRTfW--T4luHQd6egg1JJTAk) <GiuseppeChillemi (GiuseppeChillemi)>:
(It is from RTD section)

[19:00:36](#0W7DFfkZXxjNHf3oe4rQ9xwxKlrkuk9kTSZuuY3mQdE) <GiuseppeChillemi (GiuseppeChillemi)>:
I have tested but we don't need it

[19:16:34](#Xy5LRY6ttJAp_NbIgUzpTwlvbm5vgNtTWU7mna_m8yM) <hiiamboris>:
copy/paste typo

## 9-Jan-2025

[23:34:59](#WnHV8WzorwtzMZoNDV96DDS6trsjE1et8L0hfEW12rM) <GiuseppeChillemi (GiuseppeChillemi)>:
I have taken a look to the `parse-func-spec` function and found the following rule:

```
attr-val=: ['catch | 'throw | 'trace | 'no-trace] 
```

But it is not present in the specs in following document:

https://github.com/red/docs/blob/master/en/datatypes/function.adoc

meijeru (Rudolf Meijer) 

Is this by choice or just an overlook?

## 10-Jan-2025

[0:28:32](#igVsETG-1jbid9yDypSJihX3CA0qF494S-LJssj7GII) <greggirwin (Gregg Irwin)>:
Just an oversight. `[catch throw]` aren't finalized, but are there for compatibility and future use.

[0:36:39](#HM-HmgNI6ccMrjE733-jsGMlIe6b3HHqmpKqVDkL6x4) <GiuseppeChillemi (GiuseppeChillemi)>:
Written an issue in the documentation repository

