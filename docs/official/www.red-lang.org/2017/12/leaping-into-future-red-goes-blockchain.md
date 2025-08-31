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

## December 25, 2017

[]()

### Leaping into the future: Red goes blockchain!

Here we are, ready to leap into the future. This is a new page opening in the Red history book. It is a great day for us to finally be able to share with everyone some great news for Red and its community. Fasten your seat belts and enjoy the ride! ;-)

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEirtqDeN7Pyyk04MENSuYe5doF1-aN1UPZMJdngbhI_eaKWhxBk9cfDbufrBZT4kzUicp5YhnkdaqXpXBylQfCPYUkWJdbbbncwsCuLybLdJAhGeCcVxlSgxfvLXq72KE8lhMK1Q9mbn3Nw/s1600/logo3.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEirtqDeN7Pyyk04MENSuYe5doF1-aN1UPZMJdngbhI_eaKWhxBk9cfDbufrBZT4kzUicp5YhnkdaqXpXBylQfCPYUkWJdbbbncwsCuLybLdJAhGeCcVxlSgxfvLXq72KE8lhMK1Q9mbn3Nw/s1600/logo3.png)

Why the blockchain?

Unless you just woke up from prolonged hibernation under Artic ice crust, you cannot miss the hype around blockchains and their related coins. If you are new to [cryptocurrencies](https://en.wikipedia.org/wiki/Cryptocurrency) and [blockchains](https://en.wikipedia.org/wiki/Blockchain), let me give you the simple bird view on that: speculation on cryptocurrencies is currently very high, but whether it is a bubble or not, bursting soon or never, is not really relevant. The important part, shadowed by the coins market hype, is that the blockchain technologies are a new infrastructure that *should* help solve many issues we have. It is a missing piece that we need in order to rebalance the modern Internet landscape, and bring back the [decentralization](https://medium.com/@VitalikButerin/the-meaning-of-decentralization-a0c92b76a274) that was once promised in the early Internet days.

Though, the impact of such disruptive change goes way beyond just Internet infrastructure (for example, [IPFS](https://ipfs.io/) or [Storj](https://storj.io/)), it has the potential to reshape many industries (see the [Brave](https://brave.com/) browser and its [Basic Attention Token](https://basicattentiontoken.org/), bringing a saner alternative to online advertisement) and human activities, including in our daily lives. We are currently still just seeing the first generation of blockchains. Those pioneers have inefficiencies, like scalability and power consumption issues, though, after following and studying the evolution of blockchains during a year, I am now confident enough that those issues will be solved in a not-too-distant future by the next wave of blockchains (or upgraded versions of existing ones). For example, [zero-knowledge proof](https://en.wikipedia.org/wiki/Zero-knowledge_proof) and especially the [non-interactive variant](https://en.wikipedia.org/wiki/Non-interactive_zero-knowledge_proof) are really impressive and promising approaches.

So, how does Red fit there?

As Red aims to be a *fullstack* programming solution, we naturally look at what are the potential next big platforms we should support. Since last year, we are watching and studying the various blockchains, especially focusing on the ones supporting [smart contracts](https://en.wikipedia.org/wiki/Smart_contract), [Ethereum](https://www.ethereum.org/) being the leading chain in that domain. Basically, it is like a distributed computer, where you can run arbitrary sandboxed code, using the distributed ledger as its database. There are a few programming languages which can be used to implement those smart contracts, but [Solidity](https://en.wikipedia.org/wiki/Solidity) is the default one now for such tasks. If you are a Red follower, you know how much we care about *simplicity* and *efficiency* in our programming tools. Well, those concerns do not seem to be shared by people who created the existing tools for smart contracts coding and testing. Let's put it bluntly, the current state is a nightmare. It takes several hours, up to a full day to just figure out and set up a development environment the first time, even for a senior developer. The sheer complexity in such toolchains is really high. The [Remix](http://remix.ethereum.org/) initiative is still young, but it is a lifesaver compared to other existing toolchains. Still, you have to put up with a language that has many questionable design [choices](https://www.google.com/search?q=solidity%20design%20issues), for coding contracts which could handle billions of dollars worth of assets. Guess what [happens](https://www.google.com/search?q=solidity%20bug%20millions) under such conditions.

So, there is a huge need for a better, much simpler and safer contract development tool. We know that Red can deliver such solution, because that's our fight and our mission since the first release of Rebol 20 years ago. Still, people who work with me know how skeptical I am. So it took me several months of studying and discussions to figure out where and how Red could help in that domain.

Why now?

We are at an early point of a new revolution.We do know that much better development tools are needed, and the current offer is poor and disappointing to say the least. We know that we can provide a great solution based on Red, in an acceptable timeframe. This is an amazing opportunity, like we haven't seen since late 90's and the rise of the world wide web. This is our time now.

So this is what we will build, in a new branch of the Red project:

Red/C3

A new Red dialect (DSL) whose code-name is Red/CCC (Cross Chain Code) or just Red/C3, for smart contracts programming. Such dialect will compile to the Ethereum VM (EVM) bytecode directly as first target, and more backends will be added later to support other chains, like [NEO](https://neo.org/). We are at the design stage, the first alpha (prototype) is planned for end of Q1 2018. Our current design involves a combination of two small languages:

- A very high-level layer: a symbolic and highly declarative language with restricted computing semantics and restricted control flow (turing-incomplete), reading mostly like natural language (compared to mainstream languages). Coarse-grained code produced at this level by the compiler will exhibit higher safety, close to the level provided by templates, while still providing much greater flexibility. An intelligent visual program builder will also be considered for pre-generating such code.

<!--THE END-->

- A lower-level layer: a general-purpose, statically typed, subset of Red language.

Moreover, for testing such contracts, we plan to create:

- a simulator for the EVM (and later for other chains VM) coded in Red/System for fast performances.

<!--THE END-->

- a generative testing environment, for auto-testing user contracts extensively in addition to manually written tests using a simple testing framework we will provide too.

<!--THE END-->

- a GUI interface to handle all that in an easy way, without requiring deep knowledge of the blockchain infrastructure.

The toolchain will be an extension of the current Red toolchain, so it will be a standalone binary of 1-2MB.

Red Dapps

Smart contracts are used to power what is called Decentralized Apps ([Dapps](https://blockchainhub.net/decentralized-applications-dapps/))-- Basically a user-facing application operating on blockchains through smart contracts. Currently such Dapps are built using web stacks, but still need to connect to a blockchain node in order to interact with it. Light nodes could help solve that, but they break the decentralization model. So, in order to facilitate the deployment of the required blockchain nodes, such apps are often wrapped in a standalone native installer using an [Electron](https://en.wikipedia.org/wiki/Electron_%28software_framework%29) framework. This results in big downloads (50-150MB) and big memory usages inherent to web stacks.

The Red stack, with its ~1MB runtime (~300KB if compressed) can provide a much better alternative, and Red [GUI](http://www.red-lang.org/2016/03/060-red-gui-system.html) [capabilities](http://www.red-lang.org/2016/07/eve-style-clock-demo-in-red-livecoded.html) can lower drastically the entrance barrier and costs for coding apps and Dapps. In order to achieve that, we need to add a blockchain node connector in our runtime library, preferably wrapping a node in C library form, though using JSON-RPC is also an option.

For old Rebolers, maybe you remember [Rebol/IOS](http://www.rebol.com/ios/ios-intro.html) in early 2000's, for handling the [X-Internet](https://www.crcpress.com/X-Internet-The-Executable-and-Extendable-Internet/Keyes/p/book/9780849304187)? Well, guess what? [Carl](https://en.wikipedia.org/wiki/Carl_Sassenrath) was right all along (as usual). ;-) You can look at the Red Dapps as a modern blockchain-powered incarnation of that concept!

What about the existing Red roadmap?

The Red core language development continues with the *same* roadmap, we are just delaying a bit the 0.6.4 and 0.6.5 releases, in order to pass the big wave of changes in the incoming weeks. In order to achieve that, while opening a new branch of development, we need to grow bigger and structure the whole thing differently. Here are the plans to move the whole project to the next stage:

Red Foundation

We were thinking about that since last year, but now is the right time to do it for many reasons. We need a dedicated organization to handle the community and contributors' efforts for the work on Red core language. We also have plans for business activities, and it would be easier to separate the teams working on the open-source project and the ones working on commercial products and services. It is not an unseen set up, the Clojure project structured itself in a similar way.

So, we have filed an application to set up a Red Foundation in France, and will transfer to it the rights and governance for the open source parts of Red. The managers of that structure will be: Gregg Irwin, Peter W A Wood, François Jouen and myself, for starting. The foundation has a complex job and will require resources to operate, hence:

Red community 2.0: RCT token

We are embracing the blockchain philosophy fully and will empower the Red users and community using a decentralized organization ([DAO](https://en.wikipedia.org/wiki/Decentralized_autonomous_organization)), supported by a new [ERC20](https://theethereum.wiki/w/index.php/ERC20_Token_Standard) token called Red Community Token (RCT). There is no other programming language or tool that I have heard of, attempting to move their existing community to a DAO, so we will be exploring uncharted territories there, and setting an example for others to follow. The foundation will be setting up the rules with the help of the community, for the usages of the RCT token. Some of the target usages for the token holders, will include:

- voting rights: influence the Red roadmap, vote for features and issue tickets.

<!--THE END-->

- tipping: useful chat posts, code contributions, learning materials providers, etc.

<!--THE END-->

- intra-community *cryptoeconomics* (or rather *tokenomics*): selling/buying services from other community members (coding tasks, consulting, learning help, bug fixing, decentralized gaming, etc.)

<!--THE END-->

- paid Dapps, or in-app purchases.

In addition to that, the foundation will hold a significant amount of RCT, which will be used for rewarding:

- code contributions

<!--THE END-->

- Red-related online learning or presenting materials (blog, documentations, etc.)

<!--THE END-->

- promotional actions (presenting Red at a conference)

<!--THE END-->

- any other actions that will help spread Red and make the community grow up.

There will be an initial distribution of RCT tokens to the existing Red contributors (once the foundation defines the rules and allocation amounts), that will retro-actively cover existing contributions (like merged PR, tickets resulting in code changes, past donations, etc.).

Last but not least, the RCT might be used in the future as a *gas* token, to pay for cross-chain different gas currencies, or to power a future Red's own blockchain.

Those are just scratching the surface of the possibilities that such token and DAO (powered by smart contracts) could open. This gives you an idea of the disruptive potential of blockchains, when rightly used. It is not yet clear how far we can go into the decentralized model, it is something we will explore all together (we'll set up dedicated chat rooms on Gitter and other sites for that).

This will be our greatest challenge, but I trust we have enough brain power in the Red foundation and community to figure out the best rules for a healthy organization.

Initial coin offering

In order to kickstart the RCT token, and fund all the resources needed to accomplish the above tasks and roadmap, we need to raise some money. Initial Coin Offering (ICO) are the new way to achieve that. I have been reluctant to do that for a while, given how young and controversial it can be (the amount of scams in that domain is really high), but after studying many other ICO, I am convinced now that this is not just a short-lived fad, but a real new model to fund projects, and especially open-source projects related to blockchains.

We have produced a whitepaper earlier this year in October (co-authored by Tamas Herman and myself), to describe with more details and context what we are building. We will release it publicly in a few days.

The ICO itself should be held in early January 2018, starting with an angel round, then pre-sale and open rounds following right after. A new website will be available in a few days, giving the full information required for the ICO.

The ICO should provide us with enough funds to cover all the needs for this ambitious roadmap. A job list will be available after it, as we hope to hire the best profiles from the Red community, so update your CV and clean-up the source code of your Red apps. ;-)

Final words

These are intense and exciting days for us and the Red community, I wish you all a Merry Christmas, and have a good beer, maybe someday you'll pay it on your smartphone with a Red Dapp powered by RCT tokens. ;-)

Cheers!

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [5:05 PM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html "permanent link") [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=1689115368112494712&from=pencil "Edit Post")

[]()

#### 46 comments:

01. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [Unknown](https://www.blogger.com/profile/07892917694276618841)[December 25, 2017 at 7:17 PM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514225828196#c5987258798733524291)
    
    This is awesome. Looking forward to this.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/5987258798733524291)
    
    [Replies]()
    
    1. [Reply]()
02. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [onetom](https://www.blogger.com/profile/02979871120845520534)[December 25, 2017 at 7:25 PM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514226347084#c1156494089650655414)
    
    For those readers who code professionally, but haven't had a closer look at blockchains, here is a great guide for Ethereum specifically:
    
    https://medium.com/@mattcondon/getting-up-to-speed-on-ethereum-63ed28821bbe
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/1156494089650655414)
    
    [Replies]()
    
    1. [Reply]()
03. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [Unknown](https://www.blogger.com/profile/04312558635048670804)[December 25, 2017 at 7:25 PM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514226357868#c3476781564456593262)
    
    I new something big must had been in the works when the Roadmap development suddenly stalled.  
    Not that I fully understand what's going on but surely looks exciting.
    
    Joaquim
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/3476781564456593262)
    
    [Replies]()
    
    1. [Reply]()
04. ![](//resources.blogblog.com/img/blank.gif)
    
    [jb](http://www.archipelago.global)[December 25, 2017 at 7:48 PM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514227733461#c1722187222647316293)
    
    Very exciting development. A word about targets: while Ethereum is clearly the leader in terms of a Turing-complete smart contracts, Bitcoin (BTC) itself supports much more scriptabity than most folks realize, albeit not Turing-complete scripts (though that could be accomplished via a side-chain or payloading.) A major obstacle to the use of BTC this way has been the low-level nature of its script language. At least one other project, Ivy, has targeted BTC’s script language as a compile target for a higher-level language. You might want to check them out and consider this approach as well.
    
    Cf. https://blog.chain.com/ivy-for-bitcoin-a-smart-contract-language-that-compiles-to-bitcoin-script-bec06377141a?gi=a5c7eefbd548
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/1722187222647316293)
    
    [Replies]()
    
    1. ![](//www.blogger.com/img/blogger_logo_round_35.png)
       
       [onetom](https://www.blogger.com/profile/02979871120845520534)[December 26, 2017 at 5:28 PM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514305734350#c3018652425013360983)
       
       Thanks for the ivy-lang link; that was new to me!
       
       I do realize there is a lot more potential in bitcoin's scriptability.  
       I was a long-time forth programmer before I got into Rebol. :)
       
       MAST is an amazing technique too:  
       https://bitcointechtalk.com/what-is-a-bitcoin-merklized-abstract-syntax-tree-mast-33fdf2da5e2f
       
       worth reading the related paper too; it's short and clear:  
       http://www.mit.edu/~jlrubin/public/pdfs/858report.pdf
       
       [Delete](https://www.blogger.com/comment/delete/5936111837781935054/3018652425013360983)
       
       [Replies]()
       
       1. [Reply]()
       
       [Reply]()
05. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [Unknown](https://www.blogger.com/profile/03721551850320696289)[December 25, 2017 at 7:51 PM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514227918701#c5220060900787392758)
    
    so, april fools is still some time away
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/5220060900787392758)
    
    [Replies]()
    
    1. [Reply]()
06. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [hideous\_salamandra](https://www.blogger.com/profile/12594093285581057445)[December 25, 2017 at 8:36 PM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514230610166#c6659332137817677830)
    
    this was quite surprising, though I do concur that prioritizing crowd funding and getting on new technology wave is a good PR and strategic move
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/6659332137817677830)
    
    [Replies]()
    
    1. [Reply]()
07. ![](//resources.blogblog.com/img/blank.gif)
    
    Anonymous[December 25, 2017 at 9:01 PM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514232074626#c3199330694985197411)
    
    Can we get more information on how to get involved in the ICO?
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/3199330694985197411)
    
    [Replies]()
    
    1. [Reply]()
08. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [Pete](https://www.blogger.com/profile/04056680276327941200)[December 25, 2017 at 10:27 PM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514237258562#c1545860048096607367)
    
    Do you have an estimate how long establishing that foundation will take, couple weeks?
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/1545860048096607367)
    
    [Replies]()
    
    1. [Reply]()
09. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [Pierre](https://www.blogger.com/profile/17247949542544122874)[December 25, 2017 at 10:54 PM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514238860499#c6277959781848702756)
    
    Surprising news!  
    Merry Red Christmas!
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/6277959781848702756)
    
    [Replies]()
    
    1. [Reply]()
10. ![](//resources.blogblog.com/img/blank.gif)
    
    [Ajoy Singha](https://www.ajoysingha.com)[December 25, 2017 at 11:50 PM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514242214926#c2766395549316738506)
    
    Great news. How can we participate in the angel round and pre-sale event?
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/2766395549316738506)
    
    [Replies]()
    
    1. [Reply]()
11. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [Unknown](https://www.blogger.com/profile/09310869168863130959)[December 26, 2017 at 12:00 AM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514242815726#c9003774593243279821)
    
    In case that the horizon can be wider than Ethereum I can recommend neo.org.  
    It’s an open source Community with great amount of programing-languages... :)
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/9003774593243279821)
    
    [Replies]()
    
    1. ![](//www.blogger.com/img/blogger_logo_round_35.png)
       
       [onetom](https://www.blogger.com/profile/02979871120845520534)[December 26, 2017 at 5:58 PM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514307491191#c1263569683661982591)
       
       The post does mention NEO...
       
       [Delete](https://www.blogger.com/comment/delete/5936111837781935054/1263569683661982591)
       
       [Replies]()
       
       1. [Reply]()
       
       [Reply]()
12. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [gsham](https://www.blogger.com/profile/09224495468789953938)[December 26, 2017 at 12:08 AM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514243336030#c1284927856626714702)
    
    Can't wait. How will you get the information out to intetested parties ?
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/1284927856626714702)
    
    [Replies]()
    
    1. [Reply]()
13. ![](//resources.blogblog.com/img/blank.gif)
    
    Thomas Moreau[December 26, 2017 at 12:29 AM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514244552799#c6897789796071064197)
    
    What an amazing move, Nenad !  
    I'm totally ignorant in Blockchain field, but your post makes me feel like learning ! I've already gathered a few links.  
    Not that easy to enter this new world, I think !  
    Rebol / Red community has been searching for a killer app or use for years, missing different occasions like World Wide Web and Mobile...  
    As you said, this new technology may be the perfect opportunity for Red to show its full potential !  
    I wish you the best for the coming weeks and the ICO !  
    Does Red has to reach version 1.0 (or more) to be used on such architectures as Blockchains ? Does it need stuff like concurrency for instance ?  
    This time, it has to be ready before the "blockchain opportunity" window closes, i.e. before there are too many languages and actors in the place ! Regarding blockchain technology spreading, we are a little like at the beginning of the 90's, just before WWW emerging, no ?
    
    You said that the current Red roadmap will be delayed by a few weeks. You don't think it will be much more with all activities created by this big move ?
    
    Tous mes voeux pour cette nouvelle année, et pour le décollage de Red sur la Blockchain !
    
    Thanks / Merci !
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/6897789796071064197)
    
    [Replies]()
    
    1. [Reply]()
14. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [Unknown](https://www.blogger.com/profile/07091276277010592009)[December 26, 2017 at 12:42 AM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514245331457#c8337638070476804764)
    
    Love to see blockchain being used all over the place now! Love to know about pre-sale?
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/8337638070476804764)
    
    [Replies]()
    
    1. [Reply]()
15. ![](//resources.blogblog.com/img/blank.gif)
    
    Frank[December 26, 2017 at 12:44 AM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514245451622#c8805790959553141066)
    
    Let me predict something for the Roadmap:  
    \* No ICO in "early January 2018", mid-March 2018 at best.  
    \* No 0.6.4 and 0.6.5 in the first half of 2018.  
    \* No meaningful Android support in 2018.
    
    It may be a smart move to ride the ICO and Blockchain hype to extract some money much necessary by the Red project. Ignoring the hype, there is nothing here which could not be done better with traditional funding. Bending Red to become Red/C3 just to be able to ICO is genius. But there is nothing Red has to offer in this area. No safe coding background at all. It will become yet another Solidity, better in some aspects and worse in others. So lets hope the hype and ICO money scam works out, then all this will just sidetrack Red for a year or two but provide necessary funding.
    
    Good luck.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/8805790959553141066)
    
    [Replies]()
    
    1. ![](//www.blogger.com/img/blogger_logo_round_35.png)
       
       [onetom](https://www.blogger.com/profile/02979871120845520534)[December 26, 2017 at 12:30 PM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514287843465#c8711841300104182450)
       
       Frank, I also share the worry that this blockchain project would delay the Android support which might have an even larger impact on the software industry on the short term, than blockchain support. BUT as Nenad said in the post, he didn't make this decision easily.
       
       Look at the good side of it though!  
       Defining this specific, practical, real-world project of providing a blockchain development toolchain, should help informing Red's future development and I think it will help to mature it faster.
       
       [Delete](https://www.blogger.com/comment/delete/5936111837781935054/8711841300104182450)
       
       [Replies]()
       
       1. [Reply]()
       
       [Reply]()
16. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [Unknown](https://www.blogger.com/profile/15520374581488835084)[December 26, 2017 at 1:10 AM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514247032676#c3213900300713193529)
    
    New to Red, But after reading this, Not anymore. Nicely explained roadmap and It’s good to see more focus on Blockchain and the technology rather than just creating a new currency.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/3213900300713193529)
    
    [Replies]()
    
    1. [Reply]()
17. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiDdfqPnvQlAuYCfMAN1yXiSjLv5Fuk7UbXS5Uf4W6k3pKcIjai4IUzgdvz6LYu7BBLitAOGzu0elZPsk7waoHhKuxaXQjmH_uG8v5Z5oe7tFY-eKNYum2VTfnqezdxkA/s45-c/*)
    
    [gregdavidbailey](https://www.blogger.com/profile/12819058383012232066)[December 26, 2017 at 1:40 AM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514248824137#c6045910966784219097)
    
    Awesome,Red. Keep me in the loop.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/6045910966784219097)
    
    [Replies]()
    
    1. [Reply]()
18. ![](//resources.blogblog.com/img/blank.gif)
    
    Anonymous[December 26, 2017 at 1:44 AM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514249075285#c8094594906648876175)
    
    Build a bureaucracy before finishing the language? You don't really believe that'll work, do you?
    
    Look, if you need money to get Red to v1, add a Patreon button and a few other crowdsourcing buttons to bring it in. Don't go chasing pie-in-the-sky methods to get it.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/8094594906648876175)
    
    [Replies]()
    
    1. ![](//www.blogger.com/img/blogger_logo_round_35.png)
       
       [onetom](https://www.blogger.com/profile/02979871120845520534)[December 26, 2017 at 12:12 PM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514286721295#c2543428802961533639)
       
       I'm supporting some projects on Patreon:  
       https://www.patreon.com/user?u=2375354
       
       One of them is the Matrix/Riot.im project.  
       As a supported I get access to their project update videos.  
       From those videos I've learnt about how troublesome is it to accept money through their crowdfunding platforms and they can't even get enough support that way.  
       (they have raised some of their funding in cryptocurrencies, btw ;)
       
       On the other hand, please look beyond the funding aspect!  
       There is a pressing need to simplify blockchain application development.  
       Given Red's track record of being able to effectively remove complexity, Red is a very likely candidate for solving such problems.
       
       [Delete](https://www.blogger.com/comment/delete/5936111837781935054/2543428802961533639)
       
       [Replies]()
       
       1. [Reply]()
       
       ![](//resources.blogblog.com/img/blank.gif)
       
       Anonymous[December 26, 2017 at 3:01 PM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514296907630#c8294031907280883906)
       
       This is not very cautious to pretend being able to revolution a prospective and immature domain and not having finished the basic bricks of it's own tools before. Even less to tie up a whole community on it.
       
       I'm not against, everyone takes the risks he wants, but it seems to drift further and further from the initial idea of Carl.
       
       I only hope that the community does not turn around to see that it has lost focus to lock itself into a niche. If it's done well it can also open several parallel channels to finish the language and provide connectors for many applications.
       
       Wait and see.
       
       [Delete](https://www.blogger.com/comment/delete/5936111837781935054/8294031907280883906)
       
       [Replies]()
       
       1. [Reply]()
       
       ![](//resources.blogblog.com/img/blank.gif)
       
       Carl Read[December 27, 2017 at 11:34 PM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514414057385#c1562465021337025226)
       
       My worry is they've caught Rebol Inc's disease of starting new stuff before finishing what they were already working on. How does the addition of blockchain support not reduce the number of man-hours they can put into getting Red to v1?
       
       I think they should read this: http://paulgraham.com/top.html
       
       The main point being: "I'd noticed startups got way less done when they started raising money, but it was not till we ourselves raised money that I understood why. The problem is not the actual time it takes to meet with investors. The problem is that once you start raising money, raising money becomes the top idea in your mind. That becomes what you think about when you take a shower in the morning. And that means other questions aren't."
       
       Maybe an ICO will get them the money they need to continue - I don't know. But I can't see how it'll get them to focus on getting Red to v1.
       
       As to Patreon, well the button could be added today as a suck it and see experiment, even if they go ahead with an ICO - it's not an either/or choice. And it'd give a good indication of how many really care about Red. Knowing that might impact on an ICO, of course. Maybe for the better, or maybe not...
       
       [Delete](https://www.blogger.com/comment/delete/5936111837781935054/1562465021337025226)
       
       [Replies]()
       
       1. [Reply]()
       
       [Reply]()
19. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [Unknown](https://www.blogger.com/profile/00853272471611364214)[December 26, 2017 at 2:53 AM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514253210392#c2127764884264766307)
    
    That’s funny. Every one knows what it kinda is but has no idea how to bring it to market (aka corporate America). Let the new race begin! I know what I am going. 😂😂😂😂😂
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/2127764884264766307)
    
    [Replies]()
    
    1. [Reply]()
20. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [craigstorm](https://www.blogger.com/profile/16622281110174757741)[December 26, 2017 at 3:14 AM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514254478698#c9018778267844692242)
    
    Welcome to the 21st Century...Very exciting...A new evolutionary transformation..
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/9018778267844692242)
    
    [Replies]()
    
    1. [Reply]()
21. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [craigstorm](https://www.blogger.com/profile/16622281110174757741)[December 26, 2017 at 3:19 AM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514254748664#c2949584696209589462)
    
    Welcome to the 21st Century. This evolutionary approach is very exciting...
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/2949584696209589462)
    
    [Replies]()
    
    1. [Reply]()
22. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [Unknown](https://www.blogger.com/profile/17290379400889513013)[December 26, 2017 at 4:05 AM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514257549007#c472185515444248312)
    
    Welp might take a break from Nim lol
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/472185515444248312)
    
    [Replies]()
    
    1. [Reply]()
23. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEirHUP_YFOXJ4DuHjOISPBDaUwZkUP6IRmsWYKQ4r1IpT23kNVNczRd3dJ98Ramk3XBDEwjvf0UYVK-ifaZAjtF_c-RgafqrzvGV4VGAYVPmvYTz_inHRNTirlVzHOaog/s45-c/Zachary_Busc-avatar.jpg)
    
    [Zachary](https://www.blogger.com/profile/08644793395437219275)[December 26, 2017 at 4:41 AM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514259679142#c6776971579765943583)
    
    Also interested in how to be a part of the ICO.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/6776971579765943583)
    
    [Replies]()
    
    1. [Reply]()
24. ![](//resources.blogblog.com/img/blank.gif)
    
    Anonymous[December 26, 2017 at 4:49 AM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514260192203#c1339197695890756311)
    
    Merry Christmas
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/1339197695890756311)
    
    [Replies]()
    
    1. [Reply]()
25. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgAwscySCJ8TzMkUKef4sa05w_LzGJ311_CLrGA_WW5X2rV6VRtV-B_j5zFC6BmAfB0u9aHlo7lZ_ZXDgS3FujIBFqN2EcH9Lm6x1nopl_4CVOeejXTPmVi9-DGx_mstq8/s45-c/*)
    
    [Brian Dickens](https://www.blogger.com/profile/01873914328480997979)[December 26, 2017 at 5:22 AM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514262153710#c634457622098946551)
    
    This comment has been removed by the author.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/634457622098946551)
    
    [Replies]()
    
    1. ![](//www.blogger.com/img/blogger_logo_round_35.png)
       
       [Nathan DaCosta](https://www.blogger.com/profile/03905871461173359544)[December 26, 2017 at 11:03 AM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514282615949#c5483424644977609404)
       
       Wut
       
       [Delete](https://www.blogger.com/comment/delete/5936111837781935054/5483424644977609404)
       
       [Replies]()
       
       1. [Reply]()
       
       [Reply]()
26. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [onetom](https://www.blogger.com/profile/02979871120845520534)[December 26, 2017 at 12:45 PM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514288720451#c8329131258380642435)
    
    Here is another great, technical, but very digestable and well illustrated intro video for those who are just getting into blockchains:  
    https://www.youtube.com/watch?v=bBC-nXj3Ng4
    
    It was recommended by @9214 on the red/blockchain gitter.im chat:  
    https://gitter.im/red/blockchain?at=5a41340aba39a53f1a9fae74
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/8329131258380642435)
    
    [Replies]()
    
    1. [Reply]()
27. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [iArnold](https://www.blogger.com/profile/07150237639041884286)[December 26, 2017 at 3:02 PM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514296929087#c7144290596646336389)
    
    I largely agree with Frank on this issue.  
    Building blockchain tech without proper GC, or 64 bit support and just basic I/O imo again putting first things last.  
    Then we can go and buy in for voting rights to what should be done first and then get a place in the community development where we can work on it and getting 'paid' from our own ICO results? If priorities had been set right earlier the community would have been way bigger and development on CCC stuff on its way too.  
    I wish you all the best, but everywhere I show off Red language I come across all the same objections over and over again and I can assure you that doing Red advocacy does not wear well.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/7144290596646336389)
    
    [Replies]()
    
    1. ![](//www.blogger.com/img/blogger_logo_round_35.png)
       
       [onetom](https://www.blogger.com/profile/02979871120845520534)[December 26, 2017 at 5:05 PM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514304305767#c4101825580972416080)
       
       "Blockchain tech" is a bit broad term...
       
       A lot of the current tooling, like sending transactions, compiling smart contracts or the test environment doesn't have to be long-running processes, hence the GC is largely irrelevant for those applications and these are actually the primary areas where Red can help a lot.
       
       Regarding advocacy, I totally feel your pain; I had the same experience with Rebol in the past.  
       Red is open-source though and exhibits a steady progress, so its story should pan out differently!  
       It takes more time than we all would like, but then no one else managed to pull the same results off what Red is aiming for...
       
       [Delete](https://www.blogger.com/comment/delete/5936111837781935054/4101825580972416080)
       
       [Replies]()
       
       1. [Reply]()
       
       ![](//www.blogger.com/img/blogger_logo_round_35.png)
       
       [iArnold](https://www.blogger.com/profile/07150237639041884286)[December 26, 2017 at 7:45 PM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514313952834#c800473408311237065)
       
       The problem on Red is not the open source vs closed source, it is the other stuff that bloatware \*can already do* that proves bloatware to be right because obviously you need bloatware to provide the missing necessities.
       
       [Delete](https://www.blogger.com/comment/delete/5936111837781935054/800473408311237065)
       
       [Replies]()
       
       1. [Reply]()
       
       ![](//www.blogger.com/img/blogger_logo_round_35.png)
       
       [iArnold](https://www.blogger.com/profile/07150237639041884286)[December 26, 2017 at 7:47 PM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514314074133#c4175711974372744289)
       
       And for the visitors that do not already know: onetom is Tamas from the article.
       
       [Delete](https://www.blogger.com/comment/delete/5936111837781935054/4175711974372744289)
       
       [Replies]()
       
       1. [Reply]()
       
       ![](//www.blogger.com/img/blogger_logo_round_35.png)
       
       [iArnold](https://www.blogger.com/profile/07150237639041884286)[December 26, 2017 at 9:59 PM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514321944470#c4621722862381703286)
       
       Strange.. my reply to this post still not visible after a few hours.
       
       [Delete](https://www.blogger.com/comment/delete/5936111837781935054/4621722862381703286)
       
       [Replies]()
       
       1. [Reply]()
       
       [Reply]()
28. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [Unknown](https://www.blogger.com/profile/18443757067726295839)[December 26, 2017 at 5:04 PM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514304285995#c2892711954334272835)
    
    Be sure to show demos of your work to the Vyper team at Ethereum Research.
    
    https://github.com/ethereum/vyper
    
    You can also post partial deaigns for feedback at https://ethresear.ch.
    
    Looking forward to your progress.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/2892711954334272835)
    
    [Replies]()
    
    1. [Reply]()
29. ![](//resources.blogblog.com/img/blank.gif)
    
    [Bo](http://ameridroid.com)[December 26, 2017 at 6:31 PM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514309519394#c7033324775952934430)
    
    I have been investing in cryptocurrencies since 2012, and look forward to the Red team growing and the opportunity to invest in it.
    
    Even so, I would've loved for Red to be more complete first. However, with the additional resources that the ICO will provide, we may end up getting to 1.0 faster in the end.
    
    BTW, from recent conversations I've had with Carl in the past week, I believe he is on a similar page to Doc regarding this direction. If Carl wasn't so invested in Roku, he might be working in the same direction.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/7033324775952934430)
    
    [Replies]()
    
    1. [Reply]()
30. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [Goldevil](https://www.blogger.com/profile/11806378997997553509)[December 26, 2017 at 11:49 PM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514328596320#c9049689419867003356)
    
    Wow! Une sacré nouvelle.
    
    I'm happy to see the project continuing to progress. But I also wonder about the approach.
    
    On one side, I'm strongly convinced that "blockchain styles" of technologies will have a huge impact on the future of IT. In the same time I'm sure that RED is a fantastic programming language, even more than a programming language.
    
    After reading the article of Nenad, my question is: doing both in one project... isn't too ambitious ?
    
    I hope not, and I still believe in you. I expect to see the Red project progressing faster and reach a critical mass of users quickly.
    
    I wish you all the best for this project. I'll continue to follow and support it.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/9049689419867003356)
    
    [Replies]()
    
    1. [Reply]()
31. ![](//resources.blogblog.com/img/blank.gif)
    
    Greg[December 27, 2017 at 4:58 AM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514347096933#c7450897916968775222)
    
    Hi - I'm from France but living in Toronto and with links in SF. I've been diving into the blockchain over the past few months and got my company to do so as well. We have over 50 coders, and are looking to get further into a big play like the one you describe above, focused on fintech. Based on my observations, the consortium/private blockchain and smart contract golddiggers urgently need better tools...  
    If you want to chat, please let me know in the reply, and provide an email address where I can reach you.  
    Greg
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/7450897916968775222)
    
    [Replies]()
    
    1. [Reply]()
32. ![](//resources.blogblog.com/img/blank.gif)
    
    [Bo](http://ameridroid.com)[December 27, 2017 at 7:22 PM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514398970680#c5707595069150778442)
    
    My post from the #Red group on AltME rebol4 world reposted here:
    
    Here is my understanding of the Red announcement.
    
    Red's goal is to be a full-stack language. Blockchain is a part of the full stack.
    
    Red's goal is to complete its roadmap to 1.0. I believe the extra work required by the blockchain target is going to delay the roadmap when considering the existing human resources available.
    
    Red needs additional funding to expand the human resources available. An ICO is a very valid way to raise a lot of capital. One of my employees has over $500,000 in crypto assets and is very interested in investing in the RCT ICO, although he doesn't use Red or really understand why Red is important. I don't have quite as much in crypto assets as this employee, but it is still a significant amount. I intend to also invest in the RCT ICO. Of course, both of us are only going to invest a portion of our crypto assets, but when combined with others, it should be a significant amount.
    
    There are no good solutions for scripting smart contracts presently. There needs to be a tool that is easy and complete for developing smart contracts. Red is in a prime position to fill this void in an emerging market. If it is successful, this could be Red's big break (and validation of the Rebol philosophy). If it isn't wildly successful, all that is lost is some time that would need to be invested at a later date anyway in order to maintain the full-stack target of Red.
    
    Institutional investors don't understand blockchain because they are trying to use old knowledge to validate a new approach to currency, which doesn't necessarily map over. The Dot Com bubble bursting wasn't the end of the Internet or ecommerce, and ecommerce has moved on since then to displace many traditional forms of commerce. If we are in a cryptocurrency bubble, it won't be the end of cryptocurrency when the bubble bursts, and I believe cryptocurrency will displace much of the way currency presently works. My point in all this is that Doc needs to be looking forward. Carl was looking forward when he developed Rebol/IOS from which AltME was born. With proper marketing and development resources, AltME could be where Facebook is today (but most likely even farther). If Doc has a path planned and he has the resources and the "magic touch" of connecting with the global community, Red could be the new hot language and the backbone of something that the future is built upon.
    
    Honestly, I was excited for Red before, because I want to make efficient apps for a variety of OS targets. But there are too many other alternatives that aren't painful enough for most developers to warrant switching from the tools that they are already using. So Red was most likely going to be a tool only used by a small, elite group of developers. If Red/C3 can make an impact in the nascent field of smart contracts, then that could blow the doors open for Red to be a leader, and the developers that use Red/C3 could then extend their knowledge to create full-stack solutions. But first there has to be an open door for them to come through so they can see the light.
    
    We live in a time where there are only a few years between big leaps in technology. Surprisingly, there are always the "talking heads" that downplay or discredit those leaps before they are proven. I heard the "experts" downplay the impact of the personal computer, internetworking, email, the Internet, PDAs (personal digital assistants), mobile phones, ecommerce and cryptocurrency (among others), all which happened in the past 30 years and all which hugely impacted and shaped the way the world operates. I'd much rather prefer that Red would be part of the technology that shapes the future instead of being one of the pieces of technology that exists to fulfill a smaller purpose.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/5707595069150778442)
    
    [Replies]()
    
    1. [Reply]()
33. ![](//resources.blogblog.com/img/blank.gif)
    
    [GordonR](https://www.facebook.com/gordon.raboud)[December 29, 2017 at 3:37 PM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514558274494#c608359477659181931)
    
    Having just woke up from a long hibernation here in the near arctic next to the polar ice cap; I see how massive this new direction could impact what I'm doing. This would be ideal for what I'm developing as well. A Rebol3, (and eventually RED), based full accounting software - soon with BlockChain support.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/608359477659181931)
    
    [Replies]()
    
    1. [Reply]()
34. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [William Armstrong](https://www.blogger.com/profile/01790506275447076600)[December 30, 2017 at 10:56 AM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514627803453#c6596369170207383609)
    
    This is one of two industries that are becoming hyped enough that it makes sense for Red to be focusing on. The other being Machine Learning/AI that could also benefit from a Red dialect. This one has the opportunity to bring in funding from a source of dare I say younger individuals, and not corporations that are mainly pushing machine learning.
    
    I look forward to continue learning Red, and thanks for all the hard work.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/6596369170207383609)
    
    [Replies]()
    
    1. [Reply]()
35. ![](//resources.blogblog.com/img/blank.gif)
    
    Anonymous[December 30, 2017 at 10:56 PM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html?showComment=1514670995203#c8563491572879322333)
    
    https://developers.slashdot.org/story/17/12/30/1715210/blockchain-brings-business-boom-to-ibm-oracle-and-microsoft?utm\_source=rss1.0mainlinkanon&amp;utm\_medium=feed
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/8563491572879322333)
    
    [Replies]()
    
    1. [Reply]()

[Add comment]()

[Load more...]()

[]()

[](https://www.blogger.com/comment/frame/5936111837781935054?po=1689115368112494712&hl=en&saa=85391&origin=https%3A%2F%2Fwww.red-lang.org)

[Newer Post](https://www.red-lang.org/2018/01/answers-to-community-questions.html "Newer Post") [Older Post](https://www.red-lang.org/2017/07/063-macos-gui-backend.html "Older Post") [Home](https://www.red-lang.org/)

Subscribe to: [Post Comments (Atom)](https://www.red-lang.org/feeds/1689115368112494712/comments/default)

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

- [▼](javascript:void%280%29)  [2017](https://www.red-lang.org/2017/) (3)
  
  - [▼](javascript:void%280%29)  [December](https://www.red-lang.org/2017/12/) (1)
    
    - [Leaping into the future: Red goes blockchain!](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html)
  
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
