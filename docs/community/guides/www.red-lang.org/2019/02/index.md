![Red](https://static.red-lang.org/red-logo.svg)

# [Red Programming Language](https://www.red-lang.org/)

## Pages

- [Home](http://www.red-lang.org/)
- [About](http://www.red-lang.org/p/about.html)
- [Getting Started](http://www.red-lang.org/p/getting-started.html)
- [Download](http://www.red-lang.org/p/download.html)
- [Documentation](http://www.red-lang.org/p/documentation.html)
- [Contributions](http://www.red-lang.org/p/contributions.html)
- [Roadmap](http://www.red-lang.org/p/roadmap_2.html)
- [Privacy Policy](https://www.red-lang.org/p/privacy-policy.html)

## February 14, 2019

[]()

### [January 2019 Update](https://www.red-lang.org/2019/02/january-2019-update.html)

## Stepping-up

2019 started with continued advances in the main development branch, implementation of features, and triage of pending tickets. For example, smart merging of a style's actors with the actors of a particular face instance was introduced in the [VID dialect](https://www.red-lang.org/2016/03/060-red-gui-system.html). Example:

```
view [
    style my-button: base
        on-down [face/color: face/color / 2 do-actor face event 'click]
        on-up   [face/color: face/color * 2]

    my-button "Say hi!" red on-click [print "hi"]
]
```

But this is just a tiny drop in the January ocean, and nothing special in the grand scheme of things. More than 50 commits to the mainline, lots of doc updates, and many improvements to the Red Wallet, which we'll talk about in another blog post. On the other hand, Red's progress is rarely trivial and silky smooth, and [this write-up](https://github.com/red/red/issues/3692#issuecomment-450722963) gives a deeper insight into our daily routine. Well, what did you expect, Pumpkin Juice? ;-)

Alas, as much as we love coding, organizational heavy-lifting needs to be done too — one of our short-term priorities this year is relocation of core team to Europe, and (ongoing) activity on this front took a lot of our time and resources in January. That is to say, after little overture, the core team's main activity shifted behind the scenes, giving the stage to our outstanding community's efforts. [1](https://www.red-lang.org/2019/02/january-2019-update.html#footnote-1)

## Community highlights

### GTK backend

Red strives to be a truly cross-platform language, but the [project's roadmap](https://trello.com/b/FlQ6pzdB/red-tasks-overview) always implies a certain order of priorities, where some milestones come later than others. One such missing cross-platform feature is the View engine's backend for Linux — its development requires dedicated resources, which the core team cannot fully afford, probably until near the 1.0 release.

With that in mind, it is much to our delight that [development of GTK backend](https://github.com/red/red/pull/3718) is being carried out as a dedicated community effort. We'd like to take an opportunity and thank all the people participating in it — their proactive contributions make Red a truly open-source project, and help us to advance it towards our collective vision. Big thanks to [@rcqls](https://github.com/rcqls) for taking the lead on this.

Last but not least, you can track development's progress in a recently created [GTK room](https://gitter.im/red/GTK). Don't forget to visit it and give our contributors all the praise they deserve! Or even better — become one of them and get a share of fame and glory! ;-)

### View and Rich-text tweaking

Not only do missing parts of the View engine get developed, but existing ones receive thorough maintenance too. Features *and* fixes.

Among fixes are `base` and `text` rendering, Red's codebase received a [contribution](https://github.com/red/red/pull/3683) for testing of image-related features on Windows platforms, accompanied by more than 300 tests. Coupled with our ["null" testing backend](https://github.com/red/red/tree/master/modules/view/backends/test) (covered in some detail in [here](https://www.red-lang.org/2017/07/063-macos-gui-backend.html)) this casts a wide net for catching regressions in View.

After the [0.6.4 release announcement](https://www.red-lang.org/2018/12/064-simple-gc-and-pure-red-gui-console.html), many users checked out rich-text support and gave Red's [Rich-text dialect](https://github.com/red/red/wiki/%5BDOC%5D-Rich-Text-support) a proper spin, with numerous [bug fixes and tweaks](https://github.com/red/red/pull/3698) being submitted in the process.

### Editing, with a capital E

As you can see from the above, native GUI support is one of our strongest aspects, which piques the interest of many community members.

Another special feature that catches everyone's fancy is Red's ["code as data"](https://en.wikipedia.org/wiki/Homoiconicity) nature. But, while giving Red enormous expressive power (metaprogramming and the creation of domain-specific languages, DSLs for short), it makes some things trickier — with the boundary between code and data being blurred, and multiple dialects (our term for embedded DSLs) at one's disposal, it is extremely challenging to assign any particular meaning to a given piece of code (data!); both for humans (esp. newr Red programmers) and automatic tools, such as syntax highlighters, static code analyzers, debuggers and linters.

Historically, this was the main argument when it came to Rebol's tooling. Sprinkling your code with `print` and `probe` is still the most common debugging method, and error reporting boils down to stack traces rather than source text info; text editing support can accommodate only cosmetic niceties like "keywords" highlighting and indentation, covering only general subset of the language.

Being a direct descendant of Rebol, we carried over this bag of concerns, aiming to resolve them at some point in development. A quite natural answer to points raised would be an editor written in pure Red and its dialects, integrated in our self-contained toolchain.

And while writing a basic version of such editor is [rather trivial](https://www.red-lang.org/2016/07/eve-style-clock-demo-in-red-livecoded.html), such a naive approach leaves much to be desired, and keeps questions about proper tooling surrounded with an air of uncertainty, begging for a detailed investigation. Thankfully, this is where community projects and experiments come to the rescue!

- **`@rebolek`** 's [Values](https://gitlab.com/rebolek/values), announced at last year's [RedCon](https://www.red-lang.org/2018/11/redcon-1-and-ethereum-devcon-4-world.html), is a sophisticated [projectional editor](https://en.wikipedia.org/wiki/Structure_editor) with Vim's flavor and an ingenious schtick — rather than working with textual form, it `load`s a program and directly manipulates its internal data structure (a `block!` of *values),* reflecting all changes back in the text area.
  
  Idiomatically written, and offering sheer power in a few keystrokes, it struck us in awe back at RedCon, and stimulated a lot of technical discussions. With our [new GUI console](https://www.red-lang.org/2018/12/064-simple-gc-and-pure-red-gui-console.html)'s plug-in API on its way for 0.6.5 release, we are eager to see how it will get integrated in day-to-day user experience, and what fresh insights it can bring to all of us.
- **`@toomasv`** is well-known in our community as an avid Draw and View tinkerer, and his recent [experiment](https://github.com/toomasv/syntax-highlighter) only firms this reputation.
  
  Datatype-aware syntax highlighting, contextual help, auto-completion, step-by-step evaluation and bunch of other niceties — all in ~1K lines of code! Magic, you say? No, Reducing at its finest. ;-)

[![](https://lh3.googleusercontent.com/blogger_img_proxy/AEn0k_tyYGfGAomNyw8qzak64OAy_emitBObtKMdYUWCGhr0IJ83OAJubkm997u1D7dVsrYykQgfclvvpLwdeUMhtdLVwzqqrcE=s0-d)](http://vooglaid.ee/red/syntax4.gif)

Projects like this (and all others that we didn't get a chance to mention) aren't just eye-candy for the public — they help us, core developers, to evaluate all options and to revisit old ideas in a new light. Besides, it's extremely rewarding to see Red (in its *alpha* stage) being put to real use.

Once again, our cheers go to all the people who dedicate their time and efforts to support us. No matter how small your contribution, it makes Red stronger and readier for the prime-time: day by day, bit by bit.

## C3 project

Since the core team relocation is our ongoing No.1 priority, development of the C3 project got sidetracked a bit. There are still a few final touches that need to be done (e.g. finishing AST parser, `hex!` and `bigint!` datatypes support) but, aside from that, the first alpha version of compiler is almost ready for a public release. The first 90% of a task takes 90% of the time, the last 10% takes the other 90%.

In the meantime, we have one appetizer to serve: RedCon talk about C3! Due to technical issues and time constraints, it became available only recently, and was captured on a nearby web-camera. Because of that, video quality and recording angle are so-so, but the good news is that you can gain a deeper insight into the blockchain aspect of Red... and witness the talking belly. :-)

As evident from the talk[2](https://www.red-lang.org/2019/02/january-2019-update.html#footnote-2), C3's design proved to be much more challenging than we initially anticipated, muddled by pesky EVM (Ethereum Virtual Machine) constraints (like gas), lack of good reference documentation, complex tooling and blockchain hype haze.

At this point, we're convinced that *at least two* layers are required for C3 to be a sound smart-contract development solution:

1. The low-level one, named *C3/System*, is a language with simple semantics (close to Solidity, but without foot-shooting), serving as a base for building high-level dialects on top of it. We also want to implement a couple of experimental features, like off-chain Cron-like scheduler of Smart Contract execution and embedded FSM (finite-state machine) sub-dialect.
2. Possibly *multiple* high-level layers, each covering different blockchain aspect and tailored to specific solutions: creation of crypto tokens, gambling, in-game collectibles, legal contracts and business logic, bids and auctions, asset tracking... who-knows-what people may come up with.

Despite all the media craze surrounding blockchains, the technology itself is still in a nascent state, constantly searching for a real-world use-case. Because of that, navigating this new and constantly shifting space (not to mention building a development platform like C3) is like sailing in stormy weather.

In light of the above, we owe much to [**`@9214`**](https://github.com/9214) for his help with C3 preliminaries and conducting in-depth research on Smart Contract languages. His constant background presence affirmed many of our assumptions, and guided us past many reefs and pitfalls.

Back in the day, our ["Red goes blockchain"](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html) announcement generated much controversy, and prompted many people (both community members and outsiders) to cast their doubts on this decision. Some go as far as to dismiss the Red project entirely, based on our new roadmap.

Yet, very few realize that, in some sense, we're picking up the game that Rebol left — with Carl's conception of [X-Internet](http://www.rebol.com/news/news3404.html)[3](https://www.red-lang.org/2019/02/january-2019-update.html#footnote-3) replaced by decentralized consensus-driven P2P networks, and EVM instead of [IOS](http://www.rebol.com/ios/ios-intro.html). Indeed, Smart Contracts are just very limited...slow [Reblets/services](http://www.rebol.com/reblets.html) in disguise ;-) And behind blockchain fatigue lies the brave new world, where Red can be the missing puzzle piece and stepping stone towards simple, human-friendly tooling.

All in all, we hold to our beliefs, and going to play this card, aiming to hit the jackpot. But we're also not putting all our eggs in one basket. Bear with us as we tread forward, and stay tuned for future updates!

## Wrapping-up

January, with its holidays and family reunions, is nothing but a calendar sheet. The work on Red never ceases, spans through weekends, occupies all time and space (both physical and mental) and now reaches across the globe. For some, it became the animating principle of their lives.

With our hard work at stake, and with 1.0 release in near sight, encounters with the outside world get more frequent and progressively challenging — criticism and cross-checks with reality are important, but it's equally important to apply a fair yardstick, and judge the project on its own merits.

That's why, when it comes to media coverage and public discussions, we expect outsiders to stay open-minded and not to cast aspersions lightly. We want Red to succeed, and welcome technical debate and comparisons with other projects (like, e.g., [Red vs. Racket](https://www.reddit.com/r/redlang/comments/aebxct/contrast_red_with_racket/edoerll/); again, kudos to **`@9214`** for writing such a well-articulated response). But, more often than not, discussion threads turn into exercises at damage control, with constructive points being hamstrung and torn to pieces in a cross-fire.

Our mission to fight software complexity is challenging, and not for the faint-hearted. Remember — the best way to prove one's case is not in word, but in deed... and the strongest argument is a tech-savvy pull-request. ;-)

Come to think of it, I can't help remembering Pierre Rabhi's tale:

> Once upon a time, the scorching fire swallowed the forest. All the animals, terrified and powerless, watched it destroying their homes from afar. Only little Hummingbird kept flying back and worth between the fire and nearby pond, carrying tiny drops of water in its beak and throwing them in the flames.

> Irritated by bird's constant flickering, grouchy Armadillo yelled: "Hummingbird! Don't you see that your pathetic attempts won't save the forest?"

> "I know.", answered Hummingbird, "but I'm doing my part."

Hectic 2018 barely passed by, but we're already steering wheels on our [new roadmap](https://www.red-lang.org/2019/01/full-steam-ahead.html). There is more news to announce, once the dust has settled. We'll be in touch. Until then, Happy Reducing!

*-- Post by 9214, edits and amendments by Gregg*

## *Footnotes*

1. [](https://www.blogger.com/null)Remember that you can track progress of Red projects (both community-driven and official ones) at [](https://progress.red-lang.org/)[https://progress.red-lang.org/](https://progress.red-lang.org/)
2. [](https://www.blogger.com/null)Reminder: C3 presentation slides in PDF format are available [here](https://static.red-lang.org/C3/Red-C3.pdf).
3. [](https://www.blogger.com/null)"X" here stands for eXecutable and eXtendable.

Posted by Gregg Irwin at [12:10 AM](https://www.red-lang.org/2019/02/january-2019-update.html "permanent link") [3 comments:](https://www.red-lang.org/2019/02/january-2019-update.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=8977953144105188919&from=pencil "Edit Post")

[Newer Posts](https://www.red-lang.org/search?updated-max=2019-12-04T23%3A07%3A00%2B01%3A00&max-results=7&reverse-paginate=true "Newer Posts") [Older Posts](https://www.red-lang.org/search?updated-max=2019-02-14T00%3A10%3A00%2B01%3A00&max-results=7 "Older Posts") [Home](https://www.red-lang.org/)

Subscribe to: [Posts (Atom)](https://www.red-lang.org/feeds/posts/default)

[Star](https://github.com/red/red)   [Follow @red\_lang](https://twitter.com/red_lang)

    

Follow [@red\_lang](https://twitter.com/red_lang) on Twitter or on [/r/redlang](https://www.reddit.com/r/redlang/) subreddit.

Chat with us in our [Gitter](https://gitter.im/red/red) room.

## Search This Blog

## Total Pageviews

[Loading...](http://github.com/red/red/commits/master.atom)

## Blog Archive

- [►](javascript:void%280%29)  [2025](https://www.red-lang.org/2025/) (2)
  
  - [►](javascript:void%280%29)  [April](https://www.red-lang.org/2025/04/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2025/03/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2024](https://www.red-lang.org/2024/) (4)
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2024/06/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [May](https://www.red-lang.org/2024/05/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [February](https://www.red-lang.org/2024/02/) (2)

<!--THE END-->

- [►](javascript:void%280%29)  [2023](https://www.red-lang.org/2023/) (3)
  
  - [►](javascript:void%280%29)  [November](https://www.red-lang.org/2023/11/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2023/08/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2023/06/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2022](https://www.red-lang.org/2022/) (2)
  
  - [►](javascript:void%280%29)  [July](https://www.red-lang.org/2022/07/) (2)

<!--THE END-->

- [►](javascript:void%280%29)  [2021](https://www.red-lang.org/2021/) (2)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2021/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2021/08/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2020](https://www.red-lang.org/2020/) (4)
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2020/08/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2020/03/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2020/01/) (1)

<!--THE END-->

- [▼](javascript:void%280%29)  [2019](https://www.red-lang.org/2019/) (10)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2019/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [November](https://www.red-lang.org/2019/11/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [October](https://www.red-lang.org/2019/10/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [September](https://www.red-lang.org/2019/09/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [July](https://www.red-lang.org/2019/07/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2019/06/) (1)
  
  <!--THE END-->
  
  - [▼](javascript:void%280%29)  [February](https://www.red-lang.org/2019/02/) (1)
    
    - [January 2019 Update](https://www.red-lang.org/2019/02/january-2019-update.html)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2019/01/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2018](https://www.red-lang.org/2018/) (20)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2018/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [November](https://www.red-lang.org/2018/11/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [October](https://www.red-lang.org/2018/10/) (3)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [September](https://www.red-lang.org/2018/09/) (3)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2018/06/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [May](https://www.red-lang.org/2018/05/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [April](https://www.red-lang.org/2018/04/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2018/03/) (4)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2018/01/) (5)

<!--THE END-->

- [►](javascript:void%280%29)  [2017](https://www.red-lang.org/2017/) (3)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2017/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [July](https://www.red-lang.org/2017/07/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2017/03/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2016](https://www.red-lang.org/2016/) (6)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2016/12/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [July](https://www.red-lang.org/2016/07/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2016/06/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2016/03/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2015](https://www.red-lang.org/2015/) (6)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2015/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2015/06/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [April](https://www.red-lang.org/2015/04/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2015/03/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2015/01/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2014](https://www.red-lang.org/2014/) (6)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2014/12/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2014/08/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [April](https://www.red-lang.org/2014/04/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [February](https://www.red-lang.org/2014/02/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2014/01/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2013](https://www.red-lang.org/2013/) (5)
  
  - [►](javascript:void%280%29)  [November](https://www.red-lang.org/2013/11/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [September](https://www.red-lang.org/2013/09/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2013/08/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2013/03/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2013/01/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2012](https://www.red-lang.org/2012/) (8)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2012/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [October](https://www.red-lang.org/2012/10/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [September](https://www.red-lang.org/2012/09/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2012/08/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2012/03/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [February](https://www.red-lang.org/2012/02/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2011](https://www.red-lang.org/2011/) (15)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2011/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [September](https://www.red-lang.org/2011/09/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2011/08/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [July](https://www.red-lang.org/2011/07/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [May](https://www.red-lang.org/2011/05/) (3)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [April](https://www.red-lang.org/2011/04/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2011/03/) (4)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [February](https://www.red-lang.org/2011/02/) (1)

## Tags cloud

[2D](https://www.red-lang.org/search/label/2D) (1) [alias](https://www.red-lang.org/search/label/alias) (1) [alpha](https://www.red-lang.org/search/label/alpha) (1) [Android](https://www.red-lang.org/search/label/Android) (3) [announce](https://www.red-lang.org/search/label/announce) (7) [apply](https://www.red-lang.org/search/label/apply) (1) [ARM](https://www.red-lang.org/search/label/ARM) (4) [armhf](https://www.red-lang.org/search/label/armhf) (1) [arrays](https://www.red-lang.org/search/label/arrays) (2) [AST](https://www.red-lang.org/search/label/AST) (1) [beta](https://www.red-lang.org/search/label/beta) (1) [binaries](https://www.red-lang.org/search/label/binaries) (1) [binary form](https://www.red-lang.org/search/label/binary%20form) (1) [bitset](https://www.red-lang.org/search/label/bitset) (1) [blog](https://www.red-lang.org/search/label/blog) (1) [booleans](https://www.red-lang.org/search/label/booleans) (1) [bridge](https://www.red-lang.org/search/label/bridge) (2) [bugfixes](https://www.red-lang.org/search/label/bugfixes) (4) [callback](https://www.red-lang.org/search/label/callback) (2) [casing](https://www.red-lang.org/search/label/casing) (1) [changelog](https://www.red-lang.org/search/label/changelog) (1) [China](https://www.red-lang.org/search/label/China) (2) [codecs](https://www.red-lang.org/search/label/codecs) (1) [collation](https://www.red-lang.org/search/label/collation) (1) [community](https://www.red-lang.org/search/label/community) (1) [compilation](https://www.red-lang.org/search/label/compilation) (6) [compiler](https://www.red-lang.org/search/label/compiler) (2) [conference](https://www.red-lang.org/search/label/conference) (2) [console](https://www.red-lang.org/search/label/console) (8) [context](https://www.red-lang.org/search/label/context) (2) [contribution](https://www.red-lang.org/search/label/contribution) (1) [CSDN](https://www.red-lang.org/search/label/CSDN) (1) [date](https://www.red-lang.org/search/label/date) (1) [Debian](https://www.red-lang.org/search/label/Debian) (1) [demos](https://www.red-lang.org/search/label/demos) (3) [development](https://www.red-lang.org/search/label/development) (1) [dialect](https://www.red-lang.org/search/label/dialect) (1) [dll](https://www.red-lang.org/search/label/dll) (1) [donations](https://www.red-lang.org/search/label/donations) (1) [download](https://www.red-lang.org/search/label/download) (1) [Draw](https://www.red-lang.org/search/label/Draw) (1) [DSL](https://www.red-lang.org/search/label/DSL) (1) [dynamic calls](https://www.red-lang.org/search/label/dynamic%20calls) (1) [ELF](https://www.red-lang.org/search/label/ELF) (1) [encap](https://www.red-lang.org/search/label/encap) (1) [enum](https://www.red-lang.org/search/label/enum) (1) [exceptions](https://www.red-lang.org/search/label/exceptions) (3) [explorable explanations.](https://www.red-lang.org/search/label/explorable%20explanations.) (1) [features](https://www.red-lang.org/search/label/features) (2) [floating point](https://www.red-lang.org/search/label/floating%20point) (3) [floats](https://www.red-lang.org/search/label/floats) (2) [FPU](https://www.red-lang.org/search/label/FPU) (4) [freebsd](https://www.red-lang.org/search/label/freebsd) (1) [functions](https://www.red-lang.org/search/label/functions) (1) [GC](https://www.red-lang.org/search/label/GC) (1) [gpio](https://www.red-lang.org/search/label/gpio) (1) [GTK+](https://www.red-lang.org/search/label/GTK%2B) (1) [GUI](https://www.red-lang.org/search/label/GUI) (9) [hash](https://www.red-lang.org/search/label/hash) (1) [HOF](https://www.red-lang.org/search/label/HOF) (1) [I/O](https://www.red-lang.org/search/label/I%2FO) (1) [IA-32](https://www.red-lang.org/search/label/IA-32) (2) [IEEE-754](https://www.red-lang.org/search/label/IEEE-754) (1) [implementation](https://www.red-lang.org/search/label/implementation) (2) [interpreter](https://www.red-lang.org/search/label/interpreter) (1) [iOS](https://www.red-lang.org/search/label/iOS) (1) [IW](https://www.red-lang.org/search/label/IW) (1) [java](https://www.red-lang.org/search/label/java) (2) [jni](https://www.red-lang.org/search/label/jni) (1) [lexer](https://www.red-lang.org/search/label/lexer) (2) [libc](https://www.red-lang.org/search/label/libc) (1) [libRed](https://www.red-lang.org/search/label/libRed) (2) [libRedRT](https://www.red-lang.org/search/label/libRedRT) (1) [linker](https://www.red-lang.org/search/label/linker) (1) [linux](https://www.red-lang.org/search/label/linux) (2) [literal arrays](https://www.red-lang.org/search/label/literal%20arrays) (2) [livecoding](https://www.red-lang.org/search/label/livecoding) (1) [load](https://www.red-lang.org/search/label/load) (2) [loader](https://www.red-lang.org/search/label/loader) (1) [macOS](https://www.red-lang.org/search/label/macOS) (1) [MacOSX](https://www.red-lang.org/search/label/MacOSX) (2) [macros](https://www.red-lang.org/search/label/macros) (2) [major](https://www.red-lang.org/search/label/major) (1) [map](https://www.red-lang.org/search/label/map) (2) [math](https://www.red-lang.org/search/label/math) (2) [meeting](https://www.red-lang.org/search/label/meeting) (1) [memory](https://www.red-lang.org/search/label/memory) (1) [migration](https://www.red-lang.org/search/label/migration) (1) [monitors](https://www.red-lang.org/search/label/monitors) (1) [namespaces](https://www.red-lang.org/search/label/namespaces) (1) [native](https://www.red-lang.org/search/label/native) (1) [navigation](https://www.red-lang.org/search/label/navigation) (1) [objective-c](https://www.red-lang.org/search/label/objective-c) (1) [objects](https://www.red-lang.org/search/label/objects) (3) [ownership](https://www.red-lang.org/search/label/ownership) (1) [pair](https://www.red-lang.org/search/label/pair) (1) [pairs](https://www.red-lang.org/search/label/pairs) (1) [parse](https://www.red-lang.org/search/label/parse) (5) [path notation](https://www.red-lang.org/search/label/path%20notation) (1) [paths](https://www.red-lang.org/search/label/paths) (1) [percent](https://www.red-lang.org/search/label/percent) (1) [pointers](https://www.red-lang.org/search/label/pointers) (2) [points](https://www.red-lang.org/search/label/points) (1) [port](https://www.red-lang.org/search/label/port) (2) [preprocessor](https://www.red-lang.org/search/label/preprocessor) (2) [presentation](https://www.red-lang.org/search/label/presentation) (2) [QEMU](https://www.red-lang.org/search/label/QEMU) (1) [questions](https://www.red-lang.org/search/label/questions) (1) [RaspberryPi](https://www.red-lang.org/search/label/RaspberryPi) (3) [react](https://www.red-lang.org/search/label/react) (1) [reactive](https://www.red-lang.org/search/label/reactive) (5) [Red](https://www.red-lang.org/search/label/Red) (2) [red/system](https://www.red-lang.org/search/label/red%2Fsystem) (4) [redbin](https://www.red-lang.org/search/label/redbin) (1) [release](https://www.red-lang.org/search/label/release) (13) [REPL](https://www.red-lang.org/search/label/REPL) (2) [routine](https://www.red-lang.org/search/label/routine) (1) [rules engine](https://www.red-lang.org/search/label/rules%20engine) (1) [runtime errors](https://www.red-lang.org/search/label/runtime%20errors) (3) [screen](https://www.red-lang.org/search/label/screen) (1) [sets](https://www.red-lang.org/search/label/sets) (1) [SFD](https://www.red-lang.org/search/label/SFD) (1) [shared libraries](https://www.red-lang.org/search/label/shared%20libraries) (2) [sorting](https://www.red-lang.org/search/label/sorting) (1) [sources](https://www.red-lang.org/search/label/sources) (1) [specs](https://www.red-lang.org/search/label/specs) (2) [stack](https://www.red-lang.org/search/label/stack) (1) [startups](https://www.red-lang.org/search/label/startups) (1) [stats](https://www.red-lang.org/search/label/stats) (1) [strings](https://www.red-lang.org/search/label/strings) (1) [subpixel](https://www.red-lang.org/search/label/subpixel) (1) [sum up](https://www.red-lang.org/search/label/sum%20up) (1) [SVG](https://www.red-lang.org/search/label/SVG) (1) [syntax](https://www.red-lang.org/search/label/syntax) (1) [tabbing](https://www.red-lang.org/search/label/tabbing) (1) [tests](https://www.red-lang.org/search/label/tests) (4) [time](https://www.red-lang.org/search/label/time) (1) [toolchain](https://www.red-lang.org/search/label/toolchain) (1) [tuple](https://www.red-lang.org/search/label/tuple) (1) [tutorial](https://www.red-lang.org/search/label/tutorial) (1) [type-checking](https://www.red-lang.org/search/label/type-checking) (1) [typeset](https://www.red-lang.org/search/label/typeset) (1) [Unicode](https://www.red-lang.org/search/label/Unicode) (4) [update](https://www.red-lang.org/search/label/update) (1) [user group](https://www.red-lang.org/search/label/user%20group) (1) [vector](https://www.red-lang.org/search/label/vector) (2) [VFP](https://www.red-lang.org/search/label/VFP) (2) [VID](https://www.red-lang.org/search/label/VID) (2) [View](https://www.red-lang.org/search/label/View) (3) [widgets](https://www.red-lang.org/search/label/widgets) (1) [x87](https://www.red-lang.org/search/label/x87) (1)

Copyright 2011-2020 Nenad Rakocevic &amp; Red Foundation. Powered by [Blogger](https://www.blogger.com).

[![Fork me on GitHub](https://camo.githubusercontent.com/82b228a3648bf44fc1163ef44c62fcc60081495e/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f6c6566745f7265645f6161303030302e706e67)](https://github.com/red/red)
