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

## March 27, 2018

[]()

### [Roadmap Updates](https://www.red-lang.org/2018/03/roadmap-updates.html)

After our successful token sale, we are making some changes to our old Red development roadmap.

0.6.4 release

We are merging the 0.6.4 branch into master today. There are still some features to add and polish, so we plan to release it in about a week.

We are still considering a 0.6.5 milestone for swapping the REPL and the toolchain thus making the Red console the new Red executable. If we cannot fit the required changes for that into 0.6.4, we will insert a small extra milestone for that before releasing 0.7.0.

Full I/O milestone

This gets higher priority now, as we don't need to rush Android support anymore, given the new funds we have now. We can now proceed in a more logical order which will result in the Android release having much more complete support.

0.7.0 will focus on bringing the port! datatype and with it, async networking I/O and some basic protocols. Work will start on it right after 0.6.4 release. This also means that a 0.7.x *could be* turned into a 0.9 release, providing a first Red beta version and a shortened path to 1.0. That depends on decisions about incorporating the module system and/or concurrency support in 1.0, or in a later version. We hope to decide on that with the help of the Red user community, using the voting power granted by the [RED token](https://ico.red-lang.org/RED-whitepaper.pdf). ;-)

Android milestone

It is still a very important milestone for Red, even if the work on it has currently slowed due to the big blockchain-related wave of tasks. It is now scheduled to be a 0.7.x release. We should accelerate work on it once new developers have joined the team. A new blog article (later this week) will provide a sneak peek at Red's current Android capabilities and what is left to do in order to complete it.

Red/C3

We are still working on combining the Red core roadmap and the Red/C3 roadmap and allocating resources adequately on the different branches of the whole project. So far, the Red/C3 roadmap (as described in the [whitepaper](https://ico.red-lang.org/RED-whitepaper.pdf)) remains unchanged.

The first milestone in the Red/C3 roadmap is:

> Q1 2018:
> 
> - Ethereum node wrapper for Red Dapps (alpha)
> 
> <!--THE END-->
> 
> - RED wallet Dapp (alpha)

We are glad to announce that we are finalizing those tasks, and will be releasing the wallet app (as alpha) next week! The wallet currently supports only the Nano Ledger S hardware key (no software keys support for now). More info about the wallet app in a blog post next week, including a list of all the features planned for the 1.0 wallet release.

For the Ethereum node wrapper, we have implemented a JSON-RPC library in Red, used by the wallet app. That library will be released alongside the wallet code. It only covers some basic features from the Ethereum node API for now. We plan to vastly extend the API coverage in subsequent versions. Once the 0.7.0 release is out, we could wrap that library code in an eth:// port and provide a nice, human-friendly interface for it. We believe that enabling an easy way to interact with the Ethereum blockchain (and some others later this year), will raise the interest of existing Red coders for the Ethereum ecosystem, and set a new standard for high-level scripting tasks for blockchains.

Last but not least, we are setting up an online Ethereum node, that will be controlled by the Red Foundation, as a backend for the wallet app (currently relying on [Infura](https://infura.io/)'s nodes) and all future Red Dapps.

We are now preparing to start work on the Red/C3 compiler first alpha, which is planned for release in June. After that, during the summer, we will review the next steps in the roadmap and eventually adjust them according to the feedback from users, how fast we can move Red/C3 to a 1.0, and the state of needs in the crypto world by then.

Red/Pro

Huh...what? :-) Yes, you read it correctly, we, at Fullstack, are cooking a great new product for Red users which should be our first commercial product. At the moment, I am directing Fullstack's key resources to work solely on the open source Red and Red/C3. Work on Red/Pro is postponed to the second part of this year. There will be more info about what Red/Pro is in a future blog post. ;-)

Until then, you can help us test the new console and features of 0.6.4 before the new release, you are welcome to report issues in our [red/red](https://gitter.im/red/red) or [red/bugs](https://gitter.im/red/bugs) rooms on Gitter.

Cheers!

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [2:08 PM](https://www.red-lang.org/2018/03/roadmap-updates.html "permanent link") [3 comments:](https://www.red-lang.org/2018/03/roadmap-updates.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=3726697507526231779&from=pencil "Edit Post")

## March 12, 2018

[]()

### [Red Foundation news](https://www.red-lang.org/2018/03/red-foundation-news.html)

We set up the Red Foundation structure at the beginning of January in Paris, France. The Red Foundation is kindly hosted by the [EPHE](https://www.ephe.fr/en), at the Human and Artificial Cognition research unit led by [François Jouen](https://www.ephe.fr/ecole/nos-enseignants-chercheurs/francois-jouen) ([author](https://www.researchgate.net/profile/Francois_Jouen) of the famous [RedCV](https://github.com/ldci/redCV) framework, among other image-processing related [projects](https://github.com/ldci) for Red).

![](https://files.gitter.im/x8x/3pBz/red-logo_bg333_82x126.png)

For a brief overview, the Red Foundation structure is composed of several teams:

- an administrative team: 
  
  - Nenad Rakocevic, President
  - Francois Jouen, Vice-President
  - Azouz Guizani, Treasurer

<!--THE END-->

- an operational team, led by [Gregg Irwin](https://github.com/greggirwin), and composed of regular members. [Peter W A Wood](https://github.com/peterwawood) is the first member, and will be followed by more in the future.

<!--THE END-->

- honorary members, who act as advisors.

The role of the Foundation, as explained in the [announcement article](http://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html) and in the [RED whitepaper](https://ico.red-lang.org/RED-whitepaper.pdf), is to manage the whole Red open source project, and set up a new economic model for open source projects using the RED token. In order to achieve that, all copyright holders in the Red codebase on Github will be asked to transfer their rights to the Foundation. As Nenad is the copyright owner of the biggest part of the source code, he will be the first one to do so (resulting in changing the copyright in the source files headers and license files).

The tasks the operational team is also working on currently, are:

- a website for the Foundation, featuring:
  
  - a blog platform where regular reports will be made.
  - full information about the RED token (usages, reward rules and amounts).
  - contributing task bounties for the Red community (paid in RED tokens).

<!--THE END-->

- defining the rules for retro-distribution of RED tokens for past contributions (since the opening of the Red github repo in 2011). We will proceed with the distribution as soon as the rules and correct amount of reward tokens are decided. This needs the list of contributions and contributors to be gathered.

<!--THE END-->

- defining the decision processes in the operational team.

<!--THE END-->

- defining the rules for membership of the Foundation.

<!--THE END-->

- managing the re-design of the red-lang.org site and moving it to a new platform.

All those tasks and their results will be published on the Foundation website, for the sake of information and transparency.

In order to absorb all these new tasks and the extended roadmaps for the new branches of development in the Red programming stack, we are recruiting new collaborators (non-exhaustive list):

- a Content and Marketing Manage
- a Community manager (to help Gregg)
- a [devops](https://en.wikipedia.org/wiki/DevOps) lead (for deployment and infrastructures management)
- a low-level system programmer (to reinforce the core Red dev team)
- an Android system programmer
- a Win32 system programmer (for maintaining the Windows backend)
- a Cocoa system programmer (for maintaining the macOS backend)
- a GTK system programmer (for maintaining the Linux backend)
- a QA engineer
- a Security Expert (for addressing the AV vendors issues and other security aspects in the project)
- a Tokenomics Expert (if such rare bird even exists ;-))

Some of those jobs are already being filled as you read those lines, whilst it might take longer to find right match for others. Most of those jobs will be handled by our supporting company, Fullstack Technology, on behalf of the Foundation. We will post the job descriptions asap.

In addition to that, the Red Foundation is searching for partners helping it fulfill his vision of simplified programming solutions for humans, especially in the blockchain industry. Discussions are undergoing already with some potential partners, like the [NEO council](https://neo.org/), or [Enuma](https://www.enuma.io/index.html), a leading blockchain services company in Hong Kong.

The Foundation will set up a monthly report on all its activities, published on his website (under construction).

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [6:37 PM](https://www.red-lang.org/2018/03/red-foundation-news.html "permanent link") [No comments:](https://www.red-lang.org/2018/03/red-foundation-news.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=4020849740898301206&from=pencil "Edit Post")

## March 11, 2018

[]()

### [Red, Rebol &amp; Carl](https://www.red-lang.org/2018/03/red-rebol-carl.html)

Another goal of our trip in California was to visit [Carl Sassenrath](https://en.wikipedia.org/wiki/Carl_Sassenrath), creator of [Rebol](http://rebol.com/), and spiritual grandfather of Red, as Red is the offspring of the Rebol language.

We had a great time with Carl and his wife Cindy, discussing Red and Rebol syntax &amp; semantics, the blockchain industry, smart contracts and the opportunities it presents for our technologies, while enjoying a good Italian restaurant and excellent red wine (selected by Carl, of course!). Carl was particularly interested in understanding more deeply how smart contracts work and how they are currently implemented using the Solidity language. We walked him through the complete source code of the [RED token contract](https://github.com/red/RED-token), commenting on pretty much every line of code in it and discussing the needs and possible improvements a [DSL](https://en.wikipedia.org/wiki/Domain-specific_language) like Red/C3 could bring over the existing tools. It seems obvious that we could make a huge difference in that domain, given our human-centric approach to software building.

Another aspect that got Carl's attention, was the tokenomics we are setting up for our community of users, using the RED token. Carl read the whole [whitepaper](https://ico.red-lang.org/RED-whitepaper.pdf) (he found it well-written), and was excited by how we could make the community grow, delegate more control over the projects to the community using the voting power, and increase the contributions by leveraging the token, as a reward model for useful contributions.

We were invited to stay at Carl's place, as the discussions lasted late into the night (many thanks to Carl &amp; Cindy for their kind hospitality). At our morning breakfast, we were delighted to hear that Carl accepted our invitation to join the Red Foundation as an *honorary* member, which means that Carl will be watching our work both on Red and on the Red/C3 DSL, bringing his unique experience and advice on building languages and dialects. As we are still setting up the Red Foundation operations and teams, we will give more information about our collaboration with Carl in later reports from the Foundation. In addition to that, we asked Carl to kindly free the Rebol/SDK (which is something Carl was already considering, as it is not sold anymore), so that Red users could encap their own toolchain binaries if they want to, without having to purchase it. Carl announced on [rebol.com](http://rebol.com/) that it will soon be unlocked, and provided for free to all!

For the old timers from Red and Rebol community, yes, it means we are on a course to finally join forces and build the dream team we've all wished for over these many years! ;-)

Next article will cover the current state of the Red Foundation and the related on-going tasks.

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [6:39 PM](https://www.red-lang.org/2018/03/red-rebol-carl.html "permanent link") [7 comments:](https://www.red-lang.org/2018/03/red-rebol-carl.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=7129498553042636874&from=pencil "Edit Post")

## March 10, 2018

[]()

### [Red in San Francisco](https://www.red-lang.org/2018/03/red-in-san-francisco.html)

For those eager to get some fresh news from Red, here are some great news items that we are sure you will appreciate a lot. As there are many different topics to talk about, we are splitting the news over several articles that we will publish over several days. This is the first part.

Together with Gregg Irwin, the Red community leader, who joined us from Idaho, we had a memorable time in SF, and the trip was successful beyond our wildest expectations! The goal of the trip was to attend the [GoBlockchainConnect](http://www.goblockchainconnect.com/) conference, the first big conference connecting the Asian and North American blockchain industries. The conference was promoted as bringing together developers, blockchain companies, and investors. More than 1'000 people attended.

Such events are really good for getting the pulse of the crypto community first hand, learning about the state of art in this emerging industry, and connecting with key people, including projects like NEO, and companies like... Google (yes, you read it correctly...more info about that below). ;-)

[![](https://pbs.twimg.com/media/DUiSE2PUMAAHSbK.jpg)](https://pbs.twimg.com/media/DUiSE2PUMAAHSbK.jpg)

One of the best sessions we saw was [Riccardo Spagni](https://twitter.com/fluffypony), lead developer of [Monero](https://getmonero.org/). He had good things to say, and presented himself well. We learned, very quickly, that there is a wide gap in the blockchain space between those who have real substance in product or knowledge, and those who don't.

We had a chance to pitch Red/C3 project to [Charlie Lee](https://twitter.com/SatoshiLite), [Litecoin](https://litecoin.com/)'s creator. He found it promising and asked if Litecoin's VM could be supported. As Litecoin is using an instruction set compatible with Bitcoin's [Script](https://en.bitcoin.it/wiki/Script), he was glad to hear that such support was already on our roadmap.

We also booked a meeting with [NEO](https://neo.org/) (a Chinese competitor of Ethereum, basically) at the conference. When we met NEO's team, including [Da HongFei](https://twitter.com/dahongfei), founder of NEO, and Johnson Zhao, their Global Development Director, it went so well that they asked us to attend the [NEO DevCon](https://twitter.com/neo_devcon?lang=en) in SF two days later, and have Nenad on a panel about smart contract programming. That panel was a resounding success for Red. Where NEO plans to support C#, Python, JS, and more for blockchain programming, it was clear that DSLs are what everyone really wants for smart contracts.

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh8ioMrHz2BadAGDczpxeV02OYg4imJEKBB5aZDjRPvm921gIqvpvcjUwukTuHxmAdV-11ULhFgthWmHmDFgwxL6eBNe7adzGzxQxyHxNoYD1xUieAgNKyseKKxiQd07mtXEQ3f4oDkDOET/s320/devcon1.jpg)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh8ioMrHz2BadAGDczpxeV02OYg4imJEKBB5aZDjRPvm921gIqvpvcjUwukTuHxmAdV-11ULhFgthWmHmDFgwxL6eBNe7adzGzxQxyHxNoYD1xUieAgNKyseKKxiQd07mtXEQ3f4oDkDOET/s1600/devcon1.jpg)

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEghSxYxdw_UTP1lu5haqOTMHSTvrKK4nlVagTr6UoD3lTLd_vZ2Lt7Wj6fxa_wuJdFaoGtNjs5G1pYzrz4k9CipG8ep1r9tZNhM7nHkIoR5yNviOobXGQ2hcqHWqafWFEjCPflPDrPfzxRF/s320/devcon3.jpg)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEghSxYxdw_UTP1lu5haqOTMHSTvrKK4nlVagTr6UoD3lTLd_vZ2Lt7Wj6fxa_wuJdFaoGtNjs5G1pYzrz4k9CipG8ep1r9tZNhM7nHkIoR5yNviOobXGQ2hcqHWqafWFEjCPflPDrPfzxRF/s1600/devcon3.jpg)

Now, about the big "G" company. :-) We were lucky to meet a Google manager and engineer at the GoBlockchainConnect conference, and talked with them several times about Red and our plans for covering smart contracts and Dapp development. They just happened to be the two people in charge of the internal blockchain group at Google, and found Red intriguing enough to invite us for a full demo at Google's HQ in Mountain View! The demo went very well, they were astonished by what Red could do already, and how we leverage dialects ([eDSLs](http://wiki.c2.com/?EmbeddedDomainSpecificLanguage)) to reduce complexity, especially in the UI domain. It quickly turned into a brainstorming session about the possible applications of Red and /C3 in the blockchain industry, and disruptive potential to traditional markets. This resulted in a further invitation to present Red to a much larger internal group at Google, as soon as we have a working prototype for smart contract coding. Do we need to emphasize the potential of such interest by big G? ;-)

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjDKl1PnWVB6ZiLML3WQOYc7xTF8dyaX6k-dAPjJ8v1pDOAyrwVNuKU-tzAGY3Nxy5xwTa6d2axOyU3H48_MhOZYUUhl8XCoQ_AghgPf-WT_WhNjCLk4hMpACfpKCwDKEY79pwZUyHJX8tJ/s320/google2.jpg)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjDKl1PnWVB6ZiLML3WQOYc7xTF8dyaX6k-dAPjJ8v1pDOAyrwVNuKU-tzAGY3Nxy5xwTa6d2axOyU3H48_MhOZYUUhl8XCoQ_AghgPf-WT_WhNjCLk4hMpACfpKCwDKEY79pwZUyHJX8tJ/s1600/google2.jpg)[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjD95FaZ-4oMpyCS3i6mw9_4Vc2nzPnWDf9FkF04RYfUilPyM7V8btgUNWCUC8VNmq-qvpghnvSJA2j71BvmgHJCaL9brNpnukxs7AXIKNweraolr8uVPFyV7Yop6b5heCSUjWbabiLWHjx/s320/google1.jpg)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjD95FaZ-4oMpyCS3i6mw9_4Vc2nzPnWDf9FkF04RYfUilPyM7V8btgUNWCUC8VNmq-qvpghnvSJA2j71BvmgHJCaL9brNpnukxs7AXIKNweraolr8uVPFyV7Yop6b5heCSUjWbabiLWHjx/s1600/google1.jpg)

*Photos taken at the entrance of Google's offices, taking shots inside is strictly forbidden.*

In light of all the new potential in the Silicon Valley, we are planning to open an office in the Bay Area, as soon as possible, and recruit a team there.

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEikHM7waSS-HQxn13JYKL0ckJN0bytjuUHD6ZYsM5XXuOY3F5hJprSe_0ukgdQjAsZaVlQGNQWgTKbUPagSAEn6xor-01pDiHdGqPkw8xLef4NRkFj2390bK74igxzwttSUL_KXFZNVG-PH/s320/office-sf.jpg)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEikHM7waSS-HQxn13JYKL0ckJN0bytjuUHD6ZYsM5XXuOY3F5hJprSe_0ukgdQjAsZaVlQGNQWgTKbUPagSAEn6xor-01pDiHdGqPkw8xLef4NRkFj2390bK74igxzwttSUL_KXFZNVG-PH/s1600/office-sf.jpg)

*Even with the ETH we raised, it's all we can afford in SV. ;-)*

It was a long week, with long hours, but well worth it in the end. We learned that Red is in a very solid position, and because we're able to move quickly, our chances of success are good. We have a much longer history than other projects out there, though our blockchain strategy is a new aspect. We have real, solid technology that works today, and that's huge. Our community (growing up over 7 years) is also one of our great strengths, and putting things in motion to make use of RED tokens to thank and reward you is near the top of our priority list.

Next article will be published tomorrow, and will talk about our meeting with Carl. ;-)

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [2:09 PM](https://www.red-lang.org/2018/03/red-in-san-francisco.html "permanent link") [6 comments:](https://www.red-lang.org/2018/03/red-in-san-francisco.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=4565138811788982686&from=pencil "Edit Post")

[Newer Posts](https://www.red-lang.org/search?updated-max=2018-10-20T19%3A38%3A00%2B02%3A00&max-results=7&reverse-paginate=true "Newer Posts") [Older Posts](https://www.red-lang.org/search?updated-max=2018-03-10T14%3A09%3A00%2B01%3A00&max-results=7 "Older Posts") [Home](https://www.red-lang.org/)

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

- [▼](javascript:void%280%29)  [2018](https://www.red-lang.org/2018/) (20)
  
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
  
  - [▼](javascript:void%280%29)  [March](https://www.red-lang.org/2018/03/) (4)
    
    - [Roadmap Updates](https://www.red-lang.org/2018/03/roadmap-updates.html)
    - [Red Foundation news](https://www.red-lang.org/2018/03/red-foundation-news.html)
    - [Red, Rebol &amp; Carl](https://www.red-lang.org/2018/03/red-rebol-carl.html)
    - [Red in San Francisco](https://www.red-lang.org/2018/03/red-in-san-francisco.html)
  
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
