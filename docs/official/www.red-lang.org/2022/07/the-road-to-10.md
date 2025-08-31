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

## July 14, 2022

[]()

### The Road To 1.0

You cannot have missed that in the last months (and even last years), our overall progress has slowed down drastically. One of the main reasons is that we have spread our limited resources chasing different objectives while making little progress on the core language. That is not satisfying at all and would bring us most likely to a dead-end as we exhaust our funding. We have spent the last weeks discussing about how to change that. This is our updated action plan.

From now on, our only focus will be to finish the core language and bring it to the much-awaited version 1.0. We need to reach that point in order to kickstart a broader adoption and provide us and our users a stable and robust foundation upon which we can build commercial products and services necessary for sustainability.

Given the complexities involved in completing the language and bringing an implementation that can run on modern 64-bit platforms, we have devised a two-stage plan.

### Upgrade the current 32-bit Red implementation

#### 👉 Language specification

It is now time to do so in order to clean-up some semantic rules and address all possible edge cases which will help fulfill our goals of implementation robustness and stability. The process of writing down the complete language specs will result in dropping some features that we currently have that end up being problematic or inconsistent. OTOH, we might add some new features that will need to be implemented for 1.0.

#### 👉 Modules

We need a proper module system in order to be scalable. We also need to have a proper package management system which will be tied to a central repo where we can gather third-party libraries. That would also enable modular/incremental compilation (or encapping) which will be most probably supported in the self-hosted toolchain.

#### 👉 Concurrency

We need a proper model for concurrent execution in order to leverage multicore architectures. We will define one and make a prototype implementation in the 32-bit version.

#### 👉 Toolchain

Before starting to work on the new toolchain, we will make some changes to the existing version in order to prepare for the transition. The biggest change is the dropping of the Red compiler, which will only act as a (smart) encapper. Routines and #system directives will still be supported, but probably with some restrictions. The Red preprocessor might also see some changes. This change means that Red will only have one execution model instead of the two it has currently. The Red compiler has become more of a burden than a help. The speed gains are not that significant in real code (even if they can be in some micro-benchmarks), but the impossibility for the compiler to support the exact same semantics as the interpreter is a bigger problem. This move not only will bring more stability by eliminating some edge case issues but also will reduce the toolchain by almost 25% in size, which will help reduce the number of features to support in the new toolchain.

#### 👉 Runtime library

Some improvements are long overdue in the Red runtime library. Among them:

- unified Red evaluation stack.
- unified node! management.
- improved processing of path calls with refinements.
- improved object! semantics.

All those changes are meant to simplify, reduce the runtime library code and address some systemic issues (e.g. stack management issues and GC node leaks).

#### 👉 Documentation

We need proper, exhaustive, user-oriented documentation for the Red core language. This is one of the mandatory tasks that needs to be completed and done well for wider adoption.

### Self-hosted Red for 64-bit version

#### 👉 Toolchain

In order to go 64-bit, we have to drop entirely our current toolchain code based on Rebol2 and rewrite it with a newer architecture in Red itself. The current toolchain code was disposable anyway, it was not meant to live this long, so this was a move we had to do for 1.0 anyway.

So the new toolchain will feature:

- a new compilation pipeline with a plugin model.
- an [IR](https://en.wikipedia.org/wiki/Intermediate_representation) layer.
- one or more optimizing layers.
- modular/incremental compilation support.
- x64, AArch64 and WASM backends.
- linker support for 64-bit executable file formats for the big 3 OS.
- support for linking third-party static libraries.

32-bit backends will not be supported in 1.0, though, they could be added back in the future.

#### 👉 Runtime library

The current Red runtime library written in R/S will be kept and some adjustments will be needed in order to be fully compatible with a 64-bit environment (like updating all imported OS API to their 64-bit versions). 

View engine will not be part of that upgrade for 1.0, but will be done in a 1.1 version, priority is given to Red/Core for the 1.0.

### Roadmap

Here are the main milestones:

- v0.7   : Full I/O with async support.
- v1.0b : (beta) completed self-hosted Red with 64-bit support.
- v1.0r  : (release) first official stable and complete Red/Core language release.
- v1.1   : View 64-bit release.
- v1.2   : Android backend and toolchain release.
- v1.3   : Red/C3 release.
- v1.4   : Web backend for View release.
- v2.0   : Red JIT-compiler release.
- v3.0   : Red/...

The 0.7 should be the last version for the 32-bit Red version and current toolchain and we will be working on that first.

For reaching the 1.0-beta milestone, we target 12 months of intensive work, so that will bring us to Q3 2023. That's an ambitious goal but necessary to reach for the sake of Red's future.

The currently planned beta period for 1.0 is 2-3 months. We want a polished, rock-solid, production-ready 1.0 release.

For the 1.1, we will probably make some (needed) improvements to View engine architecture and backends.

For Red/C3, as the Ethereum network is transitioning to 2.0 and a new EVM, we need the WASM backend in order to support it.

Version 1.4 will bring a proper web runtime environment to the WASM backend, including GUI support.

The 2.0 will be focused on bringing a proper JIT-compiler to Red runtime, that should radically improve code execution of critical parts without having to drop to R/S.

Version 3.0 is already planned, but I will announce that once 1.0 will be released. ;-)

One major platform is missing from the above plan, that is iOS. Given how closed that platform is, we will need to come up with a specific plan on how to support it, as it won't be able to cross-compile for it (you would need a Mac computer), nor probably generate iOS apps without relying on Xcode at some point (not even mentioning dynamic code restrictions on the AppStore), which are layers of complexity that Red is trying to fight against in the first place... So for now, that platform is not among our priorities.

To finish, let me borrow some words from someone who succeeded more than anyone else in our industry:

Expect me to say "no" even more so from now on, as we get laser-focused on our primary goal.

Cheers and let's go!

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [6:41 PM](https://www.red-lang.org/2022/07/the-road-to-10.html "permanent link") [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=6648958451485192658&from=pencil "Edit Post")

Labels: [announce](https://www.red-lang.org/search/label/announce)

[]()

#### 33 comments:

01. ![](//resources.blogblog.com/img/blank.gif)
    
    Anonymous[July 14, 2022 at 11:01 PM](https://www.red-lang.org/2022/07/the-road-to-10.html?showComment=1657832495046#c2450828716649383647)
    
    When is sound coming to Red?
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/2450828716649383647)
    
    [Replies]()
    
    1. ![](//resources.blogblog.com/img/blank.gif)
       
       Anonymous[July 25, 2022 at 4:33 PM](https://www.red-lang.org/2022/07/the-road-to-10.html?showComment=1658759602220#c5480077293479731914)
       
       I think should be a part of ports
       
       [Delete](https://www.blogger.com/comment/delete/5936111837781935054/5480077293479731914)
       
       [Replies]()
       
       1. [Reply]()
       
       ![](//resources.blogblog.com/img/blank.gif)
       
       Anonymous[July 29, 2022 at 6:36 PM](https://www.red-lang.org/2022/07/the-road-to-10.html?showComment=1659112567692#c1071727914136352903)
       
       There are some contributed audio libs in https://github.com/red/code/tree/master/Library. Unless it is contributed don't expect sound support in the Red runtime library before 1.0.
       
       [Delete](https://www.blogger.com/comment/delete/5936111837781935054/1071727914136352903)
       
       [Replies]()
       
       1. [Reply]()
       
       [Reply]()
02. ![](//resources.blogblog.com/img/blank.gif)
    
    Anonymous[July 15, 2022 at 9:32 AM](https://www.red-lang.org/2022/07/the-road-to-10.html?showComment=1657870341795#c6976433724078458024)
    
    Following since 2014, finally some good news (priorities {core language}), hope you make it that in12 month timeline.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/6976433724078458024)
    
    [Replies]()
    
    1. ![](//resources.blogblog.com/img/blank.gif)
       
       dockimbel[July 29, 2022 at 6:44 PM](https://www.red-lang.org/2022/07/the-road-to-10.html?showComment=1659113074762#c1393760121787755323)
       
       Thank you! We will!
       
       [Delete](https://www.blogger.com/comment/delete/5936111837781935054/1393760121787755323)
       
       [Replies]()
       
       1. [Reply]()
       
       [Reply]()
03. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [-pekr-](https://www.blogger.com/profile/07020449092496153923)[July 15, 2022 at 4:36 PM](https://www.red-lang.org/2022/07/the-road-to-10.html?showComment=1657895795618#c8814973942569054012)
    
    Finally a concrete and focused plan, right to the point! Really thanks for that. I really like the plan I am seeing and keeping my fingers crossed.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/8814973942569054012)
    
    [Replies]()
    
    1. ![](//resources.blogblog.com/img/blank.gif)
       
       dockimbel[July 29, 2022 at 6:49 PM](https://www.red-lang.org/2022/07/the-road-to-10.html?showComment=1659113348105#c3874162925617524017)
       
       Thanks!
       
       [Delete](https://www.blogger.com/comment/delete/5936111837781935054/3874162925617524017)
       
       [Replies]()
       
       1. [Reply]()
       
       [Reply]()
04. ![](//resources.blogblog.com/img/blank.gif)
    
    Anonymous[July 15, 2022 at 5:10 PM](https://www.red-lang.org/2022/07/the-road-to-10.html?showComment=1657897822228#c7997959218661686347)
    
    "View engine will not be part of that upgrade for 1.0, but will be done in a 1.1 version, priority is given to Red/Core for the 1.0." Does that mean that one cannot write GUI applications in Red 1.0? Rudolf Meijer (meijeru)
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/7997959218661686347)
    
    [Replies]()
    
    1. ![](//resources.blogblog.com/img/blank.gif)
       
       dockimbel[July 29, 2022 at 6:50 PM](https://www.red-lang.org/2022/07/the-road-to-10.html?showComment=1659113413965#c1158640743525039241)
       
       Correct, but View will be back in 1.1. OTOH, you can still play with the 32-bit version in the meantime.
       
       [Delete](https://www.blogger.com/comment/delete/5936111837781935054/1158640743525039241)
       
       [Replies]()
       
       1. [Reply]()
       
       [Reply]()
05. ![](//resources.blogblog.com/img/blank.gif)
    
    Wally[July 16, 2022 at 1:05 AM](https://www.red-lang.org/2022/07/the-road-to-10.html?showComment=1657926308959#c8267154316499574371)
    
    That's awesome news!
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/8267154316499574371)
    
    [Replies]()
    
    1. [Reply]()
06. ![](//resources.blogblog.com/img/blank.gif)
    
    Anonymous[July 16, 2022 at 1:18 AM](https://www.red-lang.org/2022/07/the-road-to-10.html?showComment=1657927107540#c1465428876298769514)
    
    Zvuči sjajno
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/1465428876298769514)
    
    [Replies]()
    
    1. ![](//resources.blogblog.com/img/blank.gif)
       
       dockimbel[July 29, 2022 at 6:51 PM](https://www.red-lang.org/2022/07/the-road-to-10.html?showComment=1659113468829#c1701060266898224441)
       
       Hvala! Biće sjajno! ;-)
       
       [Delete](https://www.blogger.com/comment/delete/5936111837781935054/1701060266898224441)
       
       [Replies]()
       
       1. [Reply]()
       
       [Reply]()
07. ![](//resources.blogblog.com/img/blank.gif)
    
    Anonymous[July 16, 2022 at 12:48 PM](https://www.red-lang.org/2022/07/the-road-to-10.html?showComment=1657968531149#c572696464828378891)
    
    At last, a v1.0 version!!
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/572696464828378891)
    
    [Replies]()
    
    1. [Reply]()
08. ![](//resources.blogblog.com/img/blank.gif)
    
    Anonymous[July 17, 2022 at 7:13 AM](https://www.red-lang.org/2022/07/the-road-to-10.html?showComment=1658034794951#c4380310911458745740)
    
    Are you in the languages+tools industry or the cult leader industry? (Steve Jobs can only be considered a success in the latter--not the former.) I think a Nietzsche quote is more relevant here: "Many are stubborn in pursuit of the path they have chosen. Few in pursuit of the goal." But...if you someday experience a change of heart and find yourself actually interested in programming language design and being relevant, Ren-C is still here and enjoying success in many areas you are not--across the board in design, as well as on the web and in WASI containers. Let me be clear: this success \*could* belong to all of us, IF you cared more about actually solving problems than maintaining your odd cult. But seems you'd rather fail completely than admit you need my help and need the designs that Ren-C has painstakingly solved. In fact...if you paint yourself into a corner by insisting on doing things another way simply out of spite...you will be tying your hands, \*badly\*. Look at UPARSE, look at the Wasm stuff, learn about definitional errors and isotopes... and ask yourself if you really insist on going it on your own vs. coming and seeing what we could build together. That's really all on you--and always has been. I'm the one who cares enough to outreach, even now. If Red/System were compiling in the browser and integrating with Ren-C that would be impressive and we could say we did something cool. Or...hey...just do it your way--we've seen how well that's gone. Dungeon's on the web now, BTW: https://forum.rebol.info/t/enter-the-dungeon-if-you-dare/1865
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/4380310911458745740)
    
    [Replies]()
    
    1. ![](//resources.blogblog.com/img/blank.gif)
       
       Anonymous[July 22, 2022 at 5:59 AM](https://www.red-lang.org/2022/07/the-road-to-10.html?showComment=1658462351075#c3501108710302484627)
       
       I guarantee this is hostilef\*\*k... I don't even have to look. Still the same donkeyhat you were 7 years ago.
       
       [Delete](https://www.blogger.com/comment/delete/5936111837781935054/3501108710302484627)
       
       [Replies]()
       
       1. [Reply]()
       
       [Reply]()
09. ![](//resources.blogblog.com/img/blank.gif)
    
    Anonymous[July 17, 2022 at 11:16 AM](https://www.red-lang.org/2022/07/the-road-to-10.html?showComment=1658049398345#c8719123545402209877)
    
    Thanks for all your works.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/8719123545402209877)
    
    [Replies]()
    
    1. ![](//resources.blogblog.com/img/blank.gif)
       
       dockimbel[July 29, 2022 at 6:51 PM](https://www.red-lang.org/2022/07/the-road-to-10.html?showComment=1659113501627#c8378612585232165174)
       
       Thanks for your kind support!
       
       [Delete](https://www.blogger.com/comment/delete/5936111837781935054/8378612585232165174)
       
       [Replies]()
       
       1. [Reply]()
       
       [Reply]()
10. ![](//resources.blogblog.com/img/blank.gif)
    
    Anonymous[July 19, 2022 at 5:01 AM](https://www.red-lang.org/2022/07/the-road-to-10.html?showComment=1658199667254#c1857359677935894036)
    
    At last, you guys finally woke up to reality. We already knew that although we are not part of the project team. People have been asking for years when is 1.0 coming out, and the answer always was Red project team does not publish timelines. This was already a red flag that the team had lost direction. I think it is already too late now. Red has made the same deadly mistake that Rebol did i.e missed its main window of opportunity which came only once in the life of a product. Good Luck. Hopefully you still make it after all...
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/1857359677935894036)
    
    [Replies]()
    
    1. ![](//resources.blogblog.com/img/blank.gif)
       
       dockimbel[July 29, 2022 at 6:58 PM](https://www.red-lang.org/2022/07/the-road-to-10.html?showComment=1659113893201#c1412302882614690071)
       
       That main window of opportunity is still in front of us, we have not played our trump cards yet. ;-)
       
       [Delete](https://www.blogger.com/comment/delete/5936111837781935054/1412302882614690071)
       
       [Replies]()
       
       1. [Reply]()
       
       [Reply]()
11. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [KaiGuy](https://www.blogger.com/profile/01189192760631178251)[July 20, 2022 at 3:39 AM](https://www.red-lang.org/2022/07/the-road-to-10.html?showComment=1658281188140#c4327127567873223207)
    
    Finally! I was about to give up on Red...
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/4327127567873223207)
    
    [Replies]()
    
    1. ![](//resources.blogblog.com/img/blank.gif)
       
       Anonymous[September 2, 2022 at 7:48 PM](https://www.red-lang.org/2022/07/the-road-to-10.html?showComment=1662140891041#c6022315751582272889)
       
       I gave up on Red long ago when I saw they went into blochain "business". Otoh, I'm sad they were led away from original purposes and wasted so much time on practically not much. However, I'll check in Q3 2023 what is going on.
       
       [Delete](https://www.blogger.com/comment/delete/5936111837781935054/6022315751582272889)
       
       [Replies]()
       
       1. [Reply]()
       
       [Reply]()
12. ![](//resources.blogblog.com/img/blank.gif)
    
    Anonymous[July 20, 2022 at 5:40 AM](https://www.red-lang.org/2022/07/the-road-to-10.html?showComment=1658288424569#c6158494109181111092)
    
    Finally - was about to give up on Red…
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/6158494109181111092)
    
    [Replies]()
    
    1. ![](//resources.blogblog.com/img/blank.gif)
       
       dockimbel[July 29, 2022 at 6:47 PM](https://www.red-lang.org/2022/07/the-road-to-10.html?showComment=1659113272353#c1490996083498468610)
       
       Don't, the best is to come!
       
       [Delete](https://www.blogger.com/comment/delete/5936111837781935054/1490996083498468610)
       
       [Replies]()
       
       1. [Reply]()
       
       [Reply]()
13. ![](//resources.blogblog.com/img/blank.gif)
    
    Anonymous[July 24, 2022 at 7:52 AM](https://www.red-lang.org/2022/07/the-road-to-10.html?showComment=1658641943356#c9045721768206523239)
    
    Exiting news!
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/9045721768206523239)
    
    [Replies]()
    
    1. [Reply]()
14. ![](//resources.blogblog.com/img/blank.gif)
    
    Anonymous[August 2, 2022 at 2:11 PM](https://www.red-lang.org/2022/07/the-road-to-10.html?showComment=1659442314587#c4094028010216100032)
    
    At last! It has been a very long wait since I first discovered Rebol and later Red.
    
    Both projects seemed to stall or sidetrack forever or, in the case of Rebol, that even was abandoned more or less.
    
    From the Rebol "children" I find Red the most attractive, but I gave up on it some years ago because of never reaching a solid 1.0 and how much I appreciate that real steps are taken now (or are promised at least) I very much regret that the GUI won't be a part of 1.0. How long will it take between 1.0 and 1.1?
    
    BUT (a big but) I am \*VERY* grateful for all the folks that have worked on / work on Red and especially to Nenad Rakocevic who has shown relentless perseverance. Thank you all!!!
    
    As of now I'll start with fresh energy to be part of the Red family again.
    
    Thank you very much!
    
    Best regards,  
    Arie van Wingerden
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/4094028010216100032)
    
    [Replies]()
    
    1. [Reply]()
15. ![](//resources.blogblog.com/img/blank.gif)
    
    Anonymous[August 3, 2022 at 6:12 AM](https://www.red-lang.org/2022/07/the-road-to-10.html?showComment=1659499966142#c1260566749544516064)
    
    Oh thank God, a firm hand at last.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/1260566749544516064)
    
    [Replies]()
    
    1. [Reply]()
16. ![](//resources.blogblog.com/img/blank.gif)
    
    Anonymous[August 31, 2022 at 4:34 AM](https://www.red-lang.org/2022/07/the-road-to-10.html?showComment=1661913261690#c5579292029568430880)
    
    You must target Android as a platform ASAP or else risk suffering the same fate as REBOL for missing out on the browser as a platform. I still remember that discussion from around 2003 or so...I sooo wanted REBOL to succeed but Carl completely missed the boat.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/5579292029568430880)
    
    [Replies]()
    
    1. [Reply]()
17. ![](//resources.blogblog.com/img/blank.gif)
    
    Anonymous[September 22, 2022 at 8:05 PM](https://www.red-lang.org/2022/07/the-road-to-10.html?showComment=1663869945794#c207204659584059079)
    
    Based on this post, you are planning to do code generation yourself \*again\*, now adding to it by making your own IL. Oh, and multiple optimisation passes and so on. Doing codegen yourself was maybe defensible in 2011. It isn't in 2022. LLVM has solved all of those problems. You want to do all that in a year, yourself? The key to finishing projects is (besides overall competence) restricting scope where possible. Yet you've \*added* scope that amounts to one of the largest open source projects in the compiler space. It's not ambition, it's silliness, and it will end in tears.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/207204659584059079)
    
    [Replies]()
    
    1. [Reply]()
18. ![](//resources.blogblog.com/img/blank.gif)
    
    Anonymous[October 8, 2022 at 1:26 PM](https://www.red-lang.org/2022/07/the-road-to-10.html?showComment=1665228389318#c3353493099746787491)
    
    Good luck, i might try it once in a while from now on.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/3353493099746787491)
    
    [Replies]()
    
    1. [Reply]()
19. ![](//resources.blogblog.com/img/blank.gif)
    
    [elevator cab modernization](https://albuquerqueelevatorrepair.com/elevator-cab-modernization/)[May 26, 2023 at 8:28 AM](https://www.red-lang.org/2022/07/the-road-to-10.html?showComment=1685082491316#c5879438585987733492)
    
    Wow, it's refreshing to see the team's dedication to refocusing their efforts on completing the core language and reaching version 1.0. The decision to upgrade the current 32-bit Red implementation and make necessary changes to the toolchain shows their commitment to stability and scalability. The roadmap for future releases, including the plans for a self-hosted 64-bit version and a JIT-compiler, is ambitious but exciting. I'm looking forward to seeing Red's progress and the polished 1.0 release they aim to achieve.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/5879438585987733492)
    
    [Replies]()
    
    1. [Reply]()
20. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [Josh1](https://www.blogger.com/profile/04686704397228432928)[August 12, 2023 at 7:14 AM](https://www.red-lang.org/2022/07/the-road-to-10.html?showComment=1691817268355#c6929345507153427776)
    
    Is this project still alive?
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/6929345507153427776)
    
    [Replies]()
    
    1. [Reply]()
21. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [Gregg Irwin](https://www.blogger.com/profile/02841117907023902973)[August 12, 2023 at 9:08 PM](https://www.red-lang.org/2022/07/the-road-to-10.html?showComment=1691867304738#c3351486633893445846)
    
    Yes, see the recent blog posts.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/3351486633893445846)
    
    [Replies]()
    
    1. [Reply]()
22. ![](//resources.blogblog.com/img/blank.gif)
    
    Anonymous[January 1, 2024 at 8:27 AM](https://www.red-lang.org/2022/07/the-road-to-10.html?showComment=1704094031596#c4434349221491802123)
    
    Ok. It's now Jan 1st, 2024. Where are things right now?
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/4434349221491802123)
    
    [Replies]()
    
    1. [Reply]()

[Add comment]()

[Load more...]()

[]()

[](https://www.blogger.com/comment/frame/5936111837781935054?po=6648958451485192658&hl=en&saa=85391&origin=https%3A%2F%2Fwww.red-lang.org)

[Newer Post](https://www.red-lang.org/2022/07/new-red-binaries.html "Newer Post") [Older Post](https://www.red-lang.org/2021/12/2021-winding-down.html "Older Post") [Home](https://www.red-lang.org/)

Subscribe to: [Post Comments (Atom)](https://www.red-lang.org/feeds/6648958451485192658/comments/default)

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

- [▼](javascript:void%280%29)  [2022](https://www.red-lang.org/2022/) (2)
  
  - [▼](javascript:void%280%29)  [July](https://www.red-lang.org/2022/07/) (2)
    
    - [New Red binaries](https://www.red-lang.org/2022/07/new-red-binaries.html)
    - [The Road To 1.0](https://www.red-lang.org/2022/07/the-road-to-10.html)

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

- [►](javascript:void%280%29)  [2019](https://www.red-lang.org/2019/) (10)
  
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
  
  - [►](javascript:void%280%29)  [February](https://www.red-lang.org/2019/02/) (1)
  
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
