# Archived messages from: [gitter.im/red/blockchain](/gitter.im/red/blockchain/) from year: 2020

## Thursday 20th February, 2020

loziniak

[07:43](#msg5e4e388d0c4514126679983b)Hey. Any ideas how `random/secure` should be implemented? I'm currently in need of it, and could spend some time on implementation.

[12:24](#msg5e4e7a8e8b2d4664ef139739)Would it be sufficient to use AES in CTR mode with IV and key initialized from /dev/random?

rebolek

[12:32](#msg5e4e7c5a6053e67dc4d4414f)This may be a question for @BeardPower . Cryptography is hard.

loziniak

[12:35](#msg5e4e7d06ff00c664eed4afa4)Or perhaps just using /dev/urandom is ok? In lack of entropy in Linux ChaCha20 is used (kernel &gt; 4.8), Yarrow in macOS and Fortuna in FreeBSD, so generally, it should be secure. And in Windows there is CryptGenRandom, also meant to be secure.

rebolek

[12:53](#msg5e4e8137c2c73b70a448cee2)That's probably the way to go, Red tries to use OS functions whenever possible, so it's a good start. If there are problems, it can be improved later, but it's IMO better than having no `random/secure` at all.

greggirwin

[17:52](#msg5e4ec743ff00c664eed5b2fd)Agreed.

## Sunday 23th February, 2020

BeardPower

[12:37](#msg5e5272133ca8a67fb8128152)@loziniak Yes, it would.  
https://stackoverflow.com/questions/36446608/random-number-generator-with-aes-counter-mode-ruby  
https://en.wikipedia.org/wiki/Cryptographically\_secure\_pseudorandom\_number\_generator  
https://csrc.nist.gov/publications/detail/sp/800-90a/rev-1/final

## Friday 28th February, 2020

loziniak

[14:31](#msg5e592427d045e25825034c03)Just implemented `random/secure`: https://github.com/red/red/pull/4309

[14:31](#msg5e59243e7fef7f2e898e5b3a)Based on `crypto/urandom`.

proksi21

[15:28](#msg5e5931a62e398f46abcd5eb8)Great news!

greggirwin

[20:27](#msg5e5977cf53fa513e285cdd6d):+1:

## Monday 2nd March, 2020

BeardPower

[16:49](#msg5e5d392e90a8295824fe1f2e)Awesome!

## Thursday 9th July, 2020

15926222352

[22:13](#msg5f07967664ef9d04b2a2a04d)It's been a long time since the red project team. Are you ok

[22:13](#msg5f0796a6f6b74162842431b4)It seems that the blockchain project in 2018 is very difficult

greggirwin

[23:03](#msg5f07a23c64ef9d04b2a2c02d)We're OK. Best laid plans are just that. As the world has changed, we've adjusted as best we can. C3 is still in our plans, and we wish (more than anyone on the outside) that it was in a state we could release.

15926222352

[23:42](#msg5f07ab807455046699ebdd4d)When can I release it? I've been waiting for two years

## Friday 10th July, 2020

greggirwin

[00:01](#msg5f07afd73e4a827d19b66b9d)We don't have a release date set at this time.

siriusye

[11:08](#msg5f084c27a5ab931e4f794ba6)No matter c3 will be released or not, the token is surely a loss for majority of ico participants.

[11:11](#msg5f084ce9dbf01050ab66c4b6)good luck with the funding and hopefully it can support the team to do something good. Under the current market, there wont be such chance anymore in the future.

15926222352

[23:33](#msg5f08fab03e4a827d19ba2cbd)@siriusye Indeed, as you said, tokens are a nightmare for ICO participants

## Thursday 6th August, 2020

loziniak

[09:25](#msg5f2bcc9e93579d2e34616f6a)Hi! Can `money!` extendable by custom currencies?

endo64

[09:27](#msg5f2bcd1f85494a652319ceaf)Yes

```
>> probe system/locale/currencies/list
[
    AED AFN ALL AMD ANG AOA ARS AUD AWG AZN BAM BBD BDT BTC BGN BHD BIF BMD BND BOB BRL BSD
    BTN BWP BYN BZD CAD CDF CHF CKD CLP CNY COP CRC CUC CUP CVE CZK DJF DKK DOP DZD EGP ERN
    ETB ETH EUR FJD FKP FOK GBP GEL GGP GHS GIP GMD GNF GTQ GYD HKD HNL HRK HTG HUF IDR ILS
    IMP INR IQD IRR ISK JEP JMD JOD JPY KES KGS KHR KID KMF KPW KRW KWD KYD KZT LAK LBP LKR
    LRD LSL LYD MAD MDL MGA MKD MMK MNT MOP MRU MUR MVR MWK MXN MYR MZN NAD NGN NIO NOK NPR
    NZD OMR PAB PEN PGK PHP PKR PLN PND PRB PYG QAR RED RON RSD RUB RWF SAR SBD SCR SDG SEK
    SGD SHP SLL SLS SOS SRD SSP STN SYP SZL THB TJS TMT TND TOP TRY TTD TVD TWD TZS UAH UGX
    USD UYU UZS VES VND VUV WST CFA XAF XCD XOF CFP XPF YER ZAR ZMW
]
```

[09:28](#msg5f2bcd2bc6dbab65124408d8)

```
>> m: XYZ$30
*** Syntax Error: (line 1) invalid money at XYZ$30
>> append system/locale/currencies/list 'XYZ
>> m: XYZ$42
== XYZ$42.00
```

loziniak

[09:28](#msg5f2bcd3d028fac5e4d9ce069)

```
>> append system/locale/currencies/list 'X3MB
*** Script Error: protected value or series - cannot modify
*** Where: do
*** Stack: cause-error
```

endo64

[09:28](#msg5f2bcd55d0282f0336804770)It has some constraints

[09:29](#msg5f2bcd63c6dbab6512440978)It must be 3 letters

loziniak

[09:29](#msg5f2bcd89a8636a6f169484dc)Any reason for that?

endo64

[09:30](#msg5f2bcda093579d2e34617199)Here is the code to check that constraints:

```
>> ?? system/locale/currencies/on-deep-change*
system/locale/currencies/on-deep-change*: func [owner word target action new index part][
    if any [
        word <> 'list
        not find [append appended] action
        not word? :new
        all [action = 'append any [find list new 255 < length? list]]
        3 <> length? form new
    ] [cause-error 'script 'protected []]
    if action = 'appended [set-slot-quiet back tail list to word! uppercase form new]
]
```

[09:31](#msg5f2bcdfea2fddd66442866b1)`3 <> length? form new` line.

[09:31](#msg5f2bce0487210f2e29bbe7f6)It is the official ISO 4217 standard.

[09:31](#msg5f2bce0aa8636a6f16948688)See http://currencysystem.com/codes/

loziniak

[09:34](#msg5f2bcec285494a652319d286)https://en.wikipedia.org/wiki/ISO\_4217#Cryptocurrencies

interesting, that DASH is there.

endo64

[09:35](#msg5f2bcee283a82b0f05a39fea)Yes, but it is noted `Dash does not conform to any standard.`

loziniak

[09:35](#msg5f2bcefb83a82b0f05a3a09b):-/

endo64

[09:36](#msg5f2bcf34d0282f0336804b8e)May be in the future, it may change because of the crypto currencies.  
Also there might be more than 255 currencies but currently it is limited to 255 in Red, which should be enough for most cases.

loziniak

[09:54](#msg5f2bd35b83a82b0f05a3acce)thanks, @endo64

9214

[10:24](#msg5f2bda7b87210f2e29bc0af6)@loziniak see also \[`money!` documentation](https://github.com/red/docs/blob/master/en/datatypes/money.adoc#currency-list).

loziniak

[11:00](#msg5f2be2cf45cf645e4a1160c2)Ah, the mystery is over :-) I've been looking for it in documentation, but there was no link in types list. Thanks :-)

[11:00](#msg5f2be2e351ed3a73fe15d082)Btw I made a PR to fix it: https://github.com/red/docs/pull/242

[11:02](#msg5f2be33f85494a65231a07c8)To the currency discussion – ETH and BTC also do not conform to ISO 4217 standard. Tough decisions, I know :-)

[11:07](#msg5f2be488d0282f0336807c2d)Also, it seems that numbers are also not allowed in ISO currencies, but there is no check for this in `system/locale/currencies/on-deep-change*`. So, if we do not comply fully with ISO 4217, why not dropping \*3 characters* limitation?

[11:15](#msg5f2be65f51ed3a73fe15d98c)Moreover, ISO 4217 seems to be a complete list of currencies. So it seems that ANY currency not on this list is simply out of standard. Keeping the standard would mean blocking ability to extend the list at all.

9214

[11:16](#msg5f2be67d85494a65231a1266)@loziniak `RED`, `BTC` and `ETH` were added on top of ISO 4217 as relatively "mainstream" currencies.

loziniak

[11:16](#msg5f2be69a71c83e6f0fc0f7de)I'd say DASH is more mainstream than RED ;-)

9214

[11:19](#msg5f2be74345cf645e4a116c5d)@loziniak I don't follow, supporting ISO 4217 doesn't preclude us from allowing user-defined currencies. It's a reference standard, not a mandate. Red complies with it in a sense that it uses the same currency codes, not e.g. `DLR` for a dollar or `ERO` for a euro.

loziniak

[11:21](#msg5f2be7cbd0282f0336808491)I understand that. All I want to say is when we don't follow the standard strictly, limittation to 3 characters is excessive to me.

[11:22](#msg5f2be804a541217404e3350e)If RED is allowed to be a currency, DASH should also be at least possible to add to the list.

9214

[11:24](#msg5f2be87b03112566198e806c)OK, but without some upper boundary we're setting up a fertile ground for things like `MYCOOLTOKEN$1337`.

Anyway, if using currencies with more than 3 letters is something urgent for your project, I can look into that, but the usual procedure is that you open a wish ticket and wait for eons for it to be evaluated and then \_maybe_ fulfilled :wink:

loziniak

[11:27](#msg5f2be92ea541217404e337a3)I don't see anything wrong with `MYCOOLTOKEN$1337` as long as somebody needs it in his app. Probably we could make a record in wish ticket acceptance speed! :-D

9214

[11:28](#msg5f2be954a8636a6f1694d470)&gt; we don't follow the standard strictly

As I said, ISO 4217 doesn't mandate that "all the rest of the currency codes not in the list are forbidden to be in use, and if you do use them then you are Bad and you should feel Bad!". By saying that ISO 4217 is supported we say that e.g. `PHP` is Philippine peso and not some token that PHP Language Foundation decided to create, like Red Foundation did with RED.

loziniak

[11:30](#msg5f2be9ddd0282f0336808a77)&gt; &gt; we don't follow the standard strictly

To be clear - I'm strongly against following the standard strictly.

9214

[11:33](#msg5f2bea7245cf645e4a117355)@loziniak may I ask you what's the use-case? Do you need currency codes purely for displaying/formatting? Or do you need arithmetic/comparison operations with a bulk of multiple currencies, and `DASH` is among them?

loziniak

[11:34](#msg5f2beabf93579d2e3461c362)The latter, but my own currency (X3MB) not DASH.

9214

[11:37](#msg5f2beb5f45cf645e4a117581)OK, so you propose to remove a limitation on currency code length and to allow usage of non-alphabetic characters (or at least to permit digits)?

loziniak

[11:38](#msg5f2beba683a82b0f05a3ef85)Exactly. Except that digits are already allowed if I'm correct.

9214

[11:39](#msg5f2bec0785494a65231a2126)Yes, but only if digit is not the first character, because then it won't be a `word!`.

loziniak

[11:41](#msg5f2bec5987210f2e29bc378a)That's OK for me.

9214

[11:44](#msg5f2bed1c45cf645e4a117b02)In the meantime, it's worth opening a \[wish ticket](https://github.com/red/REP/issues) with a link to this discussion. AFAIK this proposal, if accepted, would require modifications in lexer and runtime code (+ writing extra tests), so it's not an overnight change. You can always try to hack your way in a separate branch though.

loziniak

[11:44](#msg5f2bed3ac6dbab651244628d)I'll try. Thanks.

greggirwin

[15:59](#msg5f2c28dc028fac5e4d9de94d)The goal is to be useful to the most people, and the standard helps with that as a guideline. BTC, ETH, and RED are special crypto cases. Beyond that, we may want to consider a model like the standard uses (country code + currency letter, or X + precious metal symbol). There are pros and cons to short names too. In finance it's well known, and makes it easy to format things uniformly. That is, the codes are not meant to be self explanatory. That may help normal people, but not experts in the domain.

The proliferation of cryptocurrencies is insane, but it's a new world too. We have to choose between playing favorites (RED) and blessing some, eliminating limits, or telling people that they just need to come up with a moniker that fits our 3-letter model. Right now we've blessed a few, and if someone wants to use theirs with money, how painful is it to use `_X3` or `_DA`?

3 letters is certainly limiting, but we should think about other issues, e.g., special characters.

## Friday 7th August, 2020

9214

[13:25](#msg5f2d563a51bb7d3380d70688)@loziniak

```
>> append system/locale/currencies/list 'x3mb ()
>> X3MB$1330 + 7
== X3MB$1337.00
>> append system/locale/currencies/list 'moon-soon ()
>> negate -moon-soon$42
== MOON-SOON$42.00
```

\[Exclusive offer](https://github.com/9214/red/tree/currencies)! :wink: Hacked in a few hours and not thoroughly tested though, so play with that and see how bad it is. I'll keep the branch around as a PoC for your wish, in case it will be granted.

pekr

[14:21](#msg5f2d637188719865d94694d1)First language supporting crypto currencies as a datatype might be a nice marketing claim 😀

## Tuesday 11st August, 2020

loziniak

[13:56](#msg5f32a38a65e829425e777f18)@9214 thanks a lot!

## Thursday 13th August, 2020

siriusye

[02:46](#msg5f34a97358afd2462606b1a0)if you guys still have eth, can put the token on Uniswap. it is a quite interesting idea, and fully open source dex..https://github.com/Uniswap

## Thursday 20th August, 2020

siriusye

[06:39](#msg5f3e1aba78f4a80180167577)defi is so hot, a quite interesting idea for pongzi, team has good development ability, can do a good defi project

## Friday 28th August, 2020

15926222352

[13:41](#msg5f4909a049a1df0a12b18dc0)@siriusye Good advice if your red team is ethical

[13:43](#msg5f490a0ba5788a3c29ba9f03)@greggirwin I know that red language teams are all technical experts, but marketing and token are equally important, and leaders need the masses

## Tuesday 1st September, 2020

siriusye

[02:30](#msg5f4db245ec534f584fd578bf)&gt; @siriusye Good advice if your red team is ethical

The team is not immoral at least in comparing to many other pure scam projects back to 2018. RED ICO is just yet another money grab project. However, the cold blooded attitude from the team is the worst part. Most of the team members were simply showing no care about the token community/ico participants. They only care about their RED language. And ICO participants paid for their dream.

[02:35](#msg5f4db37549148b41c9873fee)Due to the crazy market back to 2018, people invested money they cannot afford to lose to many projects. That was another problem.

[02:39](#msg5f4db44bec534f584fd57ce1)The ICO is a double sword, team got the money for a long time development, however, there are thousands of ICO participants having bad memory about the project. Even though one day the project successes , there will be people talking about those stories.

Respectech

[22:49](#msg5f4ecfe049148b41c98a70ec)https://decrypt.co/40388/ethereum-miners-earn-500000-in-just-one-hour

[22:49](#msg5f4ed00bd4f0f55ebbf755c5)TL;DR is that the Eth gas prices are getting out of hand.

## Saturday 24th October, 2020

15926222352

[15:10](#msg5f9443ecbbffc02b5838b3a8)When can the red language really connect with the blockchain? The information update once a few months is too slow. Can you be more responsible to the supporters

greggirwin

[23:47](#msg5f94bcfc61007f7d1b91d29a)It's true we got stuck with internal work that wasn't ready to release before the pandemic hit. We'll include blockchain plans in our next roadmap.

## Sunday 25th October, 2020

15926222352

[15:54](#msg5f959fd0955f6d78a9500d93)OK, I hope more communication

## Monday 26th October, 2020

siriusye

[08:25](#msg5f96880ac990bb1c39310598)i dont think they actually will do it before the main red language reaches the stage it can be used for blockchain. Technically i even don't think it is possible to write contract with RED as planned in the white paper. just accept it, this is a money grab ICO. The team never cared about ICO investigators.

rebolek

[08:27](#msg5f96886d631a250ab29249e5)No, it's not possible with Red and that was never the plan. However, it's possible with the Red-based C3 dialect. Calling this money grab is an unfair insult.

## Tuesday 27th October, 2020

siriusye

[05:57](#msg5f97b6dbbbffc02b5841381e)&gt; No, it's not possible with Red and that was never the plan. However, it's possible with the Red-based C3 dialect. Calling this money grab is an unfair insult.

well, this project causes people lost 99% of their investment. The token price went from $0.6 to now $0.0029. Roadmap on the originally white paper has been delayed for 2 years. There is no updates about c3 at all. Tell me why this is not a money grab project? Team simply wants money to continue this project and their RED lang dream. They are not willing to do anything for the investment return even only for implementing c3 as they suggested on the white paper. If you think i am insult the project, show me something about C3, anything, on the code level or even a more clear plan. It is not on the github, not on the task list, it is not even exist.

[11:33](#msg5f980584955f6d78a95608a5)it has been nearly 3 years since the ICO, there must be something.

## Saturday 14th November, 2020

15926222352

[05:13](#msg5faf6761c6fe0131d4f44f35)It's been three years. It's really sad

[05:20](#msg5faf6934d37a1a13d6a6152b)Fil started almost with you. Now the main network has been online. Why is the difference so big? It's mainly about technology for three years. I don't even know what you're doing. At least I didn't see it

pekr

[06:30](#msg5faf7993c6fe0131d4f4732e)Red as a technology still evolves. If you want to watch daily progress, you can do so here - https://progress.red-lang.org/

[06:32](#msg5faf79f87cac87158fa68364)Other than that, with particular releases, there are blog articles. There are also certain milestones at Trello board, though not sure how accurate those are. Maybe Red should have some Roadmap published at the website, just dunno, but updated Trello would be good enough .... https://trello.com/b/FlQ6pzdB/red-tasks-overview

9214

[07:55](#msg5faf8d638a236947baa4a21e)To @siriusye and @15926222352:

&gt; I don't even know what you're doing.

I'm afraid that makes all the opinions you voice in this room either uninformed or misleading. To learn what we are doing you can simply follow the \[official blog](https://www.red-lang.org/) or our \[main technical chat](https://gitter.im/red/red), or stay up-to-date \[elsewhere](https://github.com/red/red/wiki/%5BNOTE%5D-Release-model#staying-up-to-date). Granted, all the announcements are framed for the technical audience passionate about the project, not passive "investors".

Why? There's a committed sin of dichotomy: a line drawn in the sand between people following the long-term technological lineage that Red embodies as a guerilla in the trenches of war \[against](https://www.red-lang.org/p/about.html) software complexity, and people interested only in short-term gains from RED token price fluctuations and changes in liquidity from listings on exchanges. That's the contrast as striking as the difference between nomadism and capitalism, but I'm going \[a bit over my head](https://www.researchgate.net/publication/249838359\_Deleuze%27s\_War\_Machine\_Nomadism\_Against\_the\_State) here. These people genuinely \_do_ care, but about entirely different things: Red the tech and RED the token.

&gt; They are not willing to do anything

With that being said, here is a listicle of a huge, stinky pile of utter \_nothing_ (as you claim) that has been done (or hasn't?) in the last year, in no specific order:

1\. \[`money!` datatype](https://github.com/red/docs/blob/master/en/datatypes/money.adoc), which allows you to specify both fiat and cryptocurrencies, so that you can write in C3 `RED$0.123 + 4`. Then there's also a dedicated \[branch](https://gitter.im/red/blockchain?at=5f2d563a51bb7d3380d70688) that extends the support beyond 3-letter currency identifiers, which are quite common in crypto space;  
1\. \[`ref!` datatype](https://github.com/red/docs/blob/master/en/datatypes/ref.adoc) — more of a syntactical nicety, which nevertheless allows modeling various references and identifiers in C3, e.g. `send @siriusye ETH$0.88`;  
1\. \[Instrumented lexer](https://www.red-lang.org/2020/08/a-new-fast-and-flexible-lexer.html), which from now on permits usage for custom literal forms not directly supported by the base language, e.g. Ethereum addresses in the `0xabcd..ef` form;  
1\. \[JSON codec](https://github.com/red/red/blob/master/environment/codecs/JSON.red) grants Red the ability to talk with Ethereum nodes via JSON-RPC protocol that they implement;  
1\. Major rehaul of \[Redbin](https://gitter.im/red/red?at=5fabc7aff2fd4f60fc68a305) format: in the context of C3, this allows the implementation of, say, an image-based development environment where the state of the interpreter can be serialized and send for troubleshooting or verification, or maybe time-traveling debugger where you can jump between the states of contract execution step-by-step;  
1\. \[GTK backend](https://gitter.im/red/GTK?at=5f3e67be582470633b6a0d96) have been brought on par with Win32 and Cocoa, so that native DApps can be truly cross-platform and bane Electron bloat from existence, or so Red/C3 pitches;  
1\. The foundation for \[ports](https://gitter.im/red/red?at=5fa9bc1206fa0513dda22cab) have been laid down, so that not only regular Red programs, but also C3 scripts can connect to the Ethereum network.

And that doesn't cover all the internal work on tokenomics, prototyping, design discussions &amp;c.

[08:04](#msg5faf8fa42a35440715249ffa)The upshot is that C3 is an \_embedded_ domain-specific language, and that the degree of its completion is largely dependant on the evolution of the \_host_ language. Red's team is a small and dedicated one, it can't redirect all the man-power solely to C3, and has to kill not just two, but three or even five birds with one (mile)stone; we advance not directly, but laterally.

Yet, you have the nerve to call all of that a "money grab".

&gt; show me something about C3

All of the bullet points that I listed above are about C3 one way or another. Besides, \[here](https://files.gitter.im/5a535581d73408ce4f86e328/Af4q/Red\_C3-Research-and-Development.pdf) is an extensive R&amp;D I did on C3 design and dusted off the shelf.

It's a draft, yes; it's shaggy, incomplete and cut in pieces, because some of them weren't finished, some went directly to prototyping stage, and some are too biased to share or closed under informal NDA. I'm not gonna apologize for the state of it, rather, I expect an apology from \_you_ for insulting my and other's hard work.

&gt; it is not even exist

It does, albeit in a private repository sitting on a back-burner... and then it doesn't. "Existing" is an essentialist category denoting a fixed entity with definite qualities and no capacity for change; Red's ontology is, on the contrary, immanent to the world of matter-energy-information flow — there's no being, only \_becoming_ of an open-source project. It's an emergent process driven by human singularities scattered across the globe (an \[entrainment](https://en.wikipedia.org/wiki/Entrainment) phenomenon; boy, do I like to digress).

And you can join us by contributing, anytime, anyplace — after all, it's not a matter of extensive (geographical distance, timezone, amount of free time alloted to you on weekends) but intensive (well-preparedness of pull-requests, frequency of helping advices, usefulness snippets) properties. Are you tired of waiting for C3 for too long? \_Make it come!_ Or plates are truly full, yet we keep piling more and more on top.

Being a financial contributor and benefactor is hugely appreciated, but that does not give you any right to come with your rules in someone else's monastery, doing not as Romans do — attacking the project, assigning blame for the allegedly lost investment, even though \_no financial returns_ were ever promised (see \[p.13 about legal considerations](https://token.red-lang.org/RED-whitepaper.pdf)).

&gt; The token offering involves and relates to the development and use of experimental software and technologies that may not come to fruition or achieve the objectives specified in this white paper. The purchase of tokens represents a high risk to any contributors.

"It's really sad", as you have put it.

## Monday 16th November, 2020

MohamedDenta

[16:52](#msg5fb2ae5bf2fd4f60fc79453a)Any payment gateways that accept (visa and cryptocurrency) ?

## Tuesday 17th November, 2020

siriusye

[13:55](#msg5fb3d649f2fd4f60fc7c49f0)All those information just shows that C3 is stopped at an early research stage. Then it has been decided for an infinite pause. If the team needs 10 years to finish RED, then C3 will only start after that. I dont know why mentioning official blog or main technical chat, if someone search C3 there, nothing turns out. Also Vlad you refer to the white paper for the no financial returns part, why you don't refer to the road map part? If the no financial returns is true, the road map should be true too. In addition to that, create a private repo costs very little effort, we all can create as much as we can. Show something real and systemically done is a more solid prove.

[14:16](#msg5fb3db58c10273610a0f4b19)i don't really want to attack the project. I don't hate RED. but sometimes the attitude of the team makes me feel really outrage. How people can really don't care? In the ICO, people contributed 28137 eth in the ICO. Back to the ICO time, it worth 40million dollars. The team just walked away with the money with an attitude of i dont want to allocate manpower for this direction. This left thousands of investigators strangling in a huge loss without any chance...

9214

[15:41](#msg5fb3ef40d5a5a635f2c852ce)@siriusye

&gt; All those information just shows that C3 is stopped at an early research stage

A lengthy research paper and 7 factual statements about C3 being developed laterally with each new milestone show that everything has ground to a halt before it even started? If you say so.

&gt; If the team needs 10 years to finish RED, then C3 will only start after that

Or the team can throw out an incomplete prototype just to satisfy your urge and move the RED price up (or not). Is that what you want?

&gt; Show something real and systemically done is a more solid prove.

All the blog announcements and news in the official channels are done more-or-less systematically (granted, we lack an up-to-date roadmap as @pekr noted). We also have a dedicated \[aggregator](progress.red-lang.org/). Have you read them before making such claims? Also: 7 factual statements about the work being done in the last year, all of which provide direct benefits to C3. Have you read them too? If you did, then you saw everything there is to publicly show.

&gt; If the no financial returns is true, the road map should be true too.

Non sequitur. Re-read the p.13 and direct quotation I referred to earlier in full, without selectively skipping parts.

&gt; i don't really want to attack the project

Yet you do. Is that an apology for insulting other's work?

&gt; but sometimes the attitude of the team makes me feel really outrage

I cannot speak on behalf of the project and the Red team, but personally, I'm very, \*very* sorry for working on Red non-stop for the last year, sometimes skipping weekends and dedicating all my spare time to contributions (roughly 3.1 out of 7 above-mentioned bullet points) — truly, one can see how such an attitude can be outraging. Friggin' nerds!

But alas, I cannot help myself but keep pumping. So, I suggest you simply leave this room and stop getting into such a bad mood, wasting your nerve cells on peasant coders who can't make you rich in a blink of an eye.

&gt; How people can really don't care?

Indeed, how? That's what I keep asking myself every time I look at the similar exchanges in this room and elsewhere.

&gt; Back to the ICO time, it worth 40million dollars.

Yes, and then Ethereum badly crashed, and so is RED, because it's an ERC-20 token. And after that "investors" spread the liquidity of an already illiquid asset with unauthorized listings on exchanges. Let's keep our facts straight.

&gt; The team just walked away with the money with an attitude of i dont want to allocate manpower for this direction

That makes me think you simply dismissed all the points I've raised in the previous message, preferring instead to pose as a victim of the bad Red team, "the disingenuous thieves who left thousands of contributors without a dime \_after said contributors consciously made a highly risky, speculative purchase\_".

Be that way.

greggirwin

[18:53](#msg5fb41c3f2a354407152fbcf8)&gt; How people can really don't care? ... The team just walked away with the money with an attitude of i dont want to allocate manpower for this direction.

Now you're speculating on what we feel and why we've made the decisions we have. Please understand that every day we show up and make the best decisions we can in where to put our time and efforts.

To say the ICO was a cash grab, and to say we don't care, is insulting and unfounded. We started down the blockchain path after a great deal of consideration, knowing it was a new and risky area.

@siriusye, let me ask you a few questions, if I may. How do you feel about other blockchain projects, which are run well, and which have succeeded? This can include projects like ours, or from big companies like FAANG, MS and others. Have they made blockchains a successful technology, widely adopted, and with a strong user base? Have we missed that window of opportunity? Has another project done what we set out to do, and done it successfully?

We have been very clear, from day one of the blockchain related projects associated with Red, that we are not about the crypto craze; we are about the technology. Our stance has consistently been that our goals were long term, though we really, really hoped to keep step with our roadmap. For many reasons that hasn't happened.

This is where we are now. And we continue to make decisions based on the long view. If you invested in MS, a FAANG company, etc. do you do so expecting to cash out in a few years and make a huge profit? That's not investing, that's gambling, and unrealistic. What happens now, with modern VC-backed companies? They raise money, burn it as fast as they can, and raise more. Either they sell out or they fail. That's the model. Maybe you like that model, but we don't.

Is it possible we'll try to raise more money? Yes. Do we want to? No. We are doing our best to use the resources we have for long term success. If you don't like the way we're doing things, you can continue to complain, but if you really want Red (and RED) to succeed, be constructive. Offer your skills and knowledge in the blockchain dev area. Other deep core skills are needed too.

@9214 pointed out a number of technical pieces that have been done, which are needed for C3. We didn't have a complete design 2+ years ago, so we didn't know what all the pieces would be, or the challenges. You may approach development differently, but we don't want to slam things out and compromise long term design and usability. If you follow any other Red channels, you'll see we get pushback on this and don't "move fast and break things" like other projects. That can be frustrating from the outside, and we understand that. So we take time to be visible here in the community and try to keep the lines of communication open.

## Friday 20th November, 2020

15926222352

[06:09](#msg5fb75d8a29cc4d73481d6fe0)@siriusye We support you and speak your mind. As you said above, we don't hate the red team at all, but their attitude is very angry. We just want an attitude that the team should have

[06:13](#msg5fb75e7c33d7764bde7e30af)@greggirwin Keep going

## Tuesday 24th November, 2020

loziniak

[13:08](#msg5fbd05c76a738b71d35e6e2c)@9214 nice C3 state summary, thanks. It clarifies a lot. Things like this should go on a webpage. Probably not so much work, but benefits are probably worth it, just to mention increase of RED token value, which translates to faster development and pushing in direction of everyone's goals. Not to mention making my day :-)

Besides, thanks for creating a \[REP](https://github.com/red/REP/issues/84) for long currency names. I postponed it couple times and finally forgot about it.

[13:09](#msg5fbd05f629cc4d73482ada23)In the meantime, ETH limitations (energy consumption, transaction costs) make some earlier use cases obsolete, and make people move to other platforms (EOS, TRON). Crypto world moves so fast, 3 years may mean a totally different landscape and a need to re-design some solutions, or even make some tech (Ethereum VM?) irrelevant.

greggirwin

[17:49](#msg5fbd47a1477a8b480c1549f8)@loziniak indeed, genuine use cases are the rarest commodity in the blockchain world.

[17:51](#msg5fbd4830bba6a3778b7d34fb)But I still believe we'll see people address this. Not all chains need to be global, or even public. If a consortium works together for their own benefit, or a government requires it for auditing purposes, side chains could work. As with fiat, grouping micropayments is a way to reduce overhead.

## Friday 27th November, 2020

siriusye

[14:12](#msg5fc1094866dcfa77e2a7d0b0)&gt; blockquote Yes, and then Ethereum badly crashed, and so is RED, because it's an ERC-20 token. And after that "investors" spread the liquidity of an already illiquid asset with unauthorized listings on exchanges. Let's keep our facts straight.

For this, there is no transparency about how the funding is used. At least at the time the ICO happened, ETH worth 40million dollars. Even in the worse case scenarios, it still worth a few million dollars. I've never said I expect red to do all the speculation things. I was trying to emphases that the price crash because it caused people lost a lot money. I surely know this changed some people life in a bad way. But after doing all those things to benefactors, RED is even not willing to spend some real resource on the promised C3. The information @9214 shows is good, but it is not worth for 3 years of R&amp;D. I don't know he is full time working on the blockchain area or just do it part time, or even just do it when he have time. $40million cannot even hire 1 people to work full time for this area.

@loziniak i agree with you, there should be a page to show the C3 progress.

Respectech

[16:15](#msg5fc1261a6ebe7532e6a6c87a)With Red, there is hope. With most other ICOs of the time, they were junk and have no hope now. All money has been taken by the creators of those scam ICOs. Red is different because it is a long-term strategy to make software development better. It is hard to wait, but I am willing to wait because I don't see any other effort that has as much hope as Red to make things better. I also have money invested in Red as well as other crypto. At one point I had lost well over $100K, mostly due to ETH. But I didn't invest anything that I could not afford to lose. That should be everyone's strategy. I don't understand how people are not willing to take responsibility when they gamble with money they cannot afford to lose, and then want to place the blame on the gamble instead of on themselves for taking the gamble.

15926222352

[18:52](#msg5fc14b067850f66b60494871)@siriusye I agree with you and hope to have a page to do C3 well

[18:52](#msg5fc14b0aed05c659158da581)@Respectech I agree with you and hope to have a page to do C3 well

[18:54](#msg5fc14b7502560e32e9242957)The red token has almost disappeared from people's view. There is no transaction volume, no news. All right, keep waiting for your success

## Sunday 29th November, 2020

siriusye

[04:24](#msg5fc3226c150b213e98ffe3b6)&gt; With Red, there is hope. With most other ICOs of the time, they were junk and have no hope now. All money has been taken by the creators of those scam ICOs. Red is different because it is a long-term strategy to make software development better. It is hard to wait, but I am willing to wait because I don't see any other effort that has as much hope as Red to make things better. I also have money invested in Red as well as other crypto. At one point I had lost well over $100K, mostly due to ETH. But I didn't invest anything that I could not afford to lose. That should be everyone's strategy. I don't understand how people are not willing to take responsibility when they gamble with money they cannot afford to lose, and then want to place the blame on the gamble instead of on themselves for taking the gamble.

it is a not a blame. I am trying to push RED team spend some resources on the promised C3. As i said, i didn't ask anything for speculators. I just ask two things why they are not following the roadmap they provided and why there is not information about the C3 development.

Everyone is here talk about long term, how long is a long term, 10 years, 20 years? There should a roadmap to show the long term, long term is not equivalent to forever. It can be delayed, but there should be a plan. If the old roadmap is not applicable then make a new one.

In addition to that, revealing some information about C3 development is also not something to much to ask. People thrown millions in the project, they even dont have a right to know how is the progress.

## Monday 30th November, 2020

15926222352

[00:18](#msg5fc43a4df621032cde15246f)@siriusye It is also true that there is still a need for the plan. We can talk about a long-term but more responsible attitude towards the supporters

[00:20](#msg5fc43acb9af4396683ca8511)The price and trading volume of red token are already unbearable. Why should excellent projects treat themselves like this? I don't know what the project side thinks of this problem

greggirwin

[22:05](#msg5fc56cb8a83ffc46af8691e4)@siriusye @15926222352 would either of you care to respond to my message from 17-Nov, rather than just repeating past complaints? The goal being to improve things going forward, and understanding and managing expectations.

## Tuesday 1st December, 2020

15926222352

[00:44](#msg5fc591f99af4396683cdfbd3)What we need to improve is to learn from everyone and the team

[00:53](#msg5fc593f99cdc3e0d754fd781)@greggirwin I don't know what the significance of issuing red token is, or what is the use value of red token? Is it for the purpose of financing? Can we create a decentralized community and use red token to jointly determine the development direction of red language

[00:54](#msg5fc5944f8292a93eb10bee41)@greggirwin I don't care about the price of the red token. I just hope to make the red language change and develop well through your opinions

[00:57](#msg5fc594f4150b213e9805d2fa)@greggirwin Just like sushi and uniswap, the popular decentralized exchanges, isn't using token community voting the real meaning of decentralization

[00:59](#msg5fc59574f621032cde18948f)@greggirwin What is the nature of blockchain? I hope your team will seriously consider why it is necessary to issue red token if it is not for decentralization

## Thursday 10th December, 2020

15926222352

[11:48](#msg5fd20afd5a63c56105200541)It's time to update the blog of the scientists in red language. I haven't seen any news about the project for four months in a row. It's OK to take a moment to write a few words https://www.red-lang.org/

greggirwin

[19:01](#msg5fd2709e28a57c581b05d919)We generally point people to https://progress.red-lang.org/ for ongoing status. We hoped to do regular blog posts, but that hasn't happened.
