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

### [Leaping into the future: Red goes blockchain!](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html)

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

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [5:05 PM](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html "permanent link") [46 comments:](https://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=1689115368112494712&from=pencil "Edit Post")

[Newer Posts](https://www.red-lang.org/search?updated-max=2018-03-12T18%3A37%3A00%2B01%3A00&max-results=7&reverse-paginate=true "Newer Posts") [Older Posts](https://www.red-lang.org/search?updated-max=2017-12-25T17%3A05%3A00%2B01%3A00&max-results=7 "Older Posts") [Home](https://www.red-lang.org/)

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
