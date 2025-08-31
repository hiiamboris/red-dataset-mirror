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

## January 3, 2018

[]()

### Overview of Red development history

This video shows a fast-paced timelapse of the Red source code changes in the [main repository](https://github.com/red/red) over last 6 years, 9000 commits. You can see the avatars of all contributors, flashing commits on the files over time.

Here are a few stats showing the changes between Jan 1st 2017 and Dec 31th 2017:

- Github stars: 1214 to **2970**
- Github [programming languages](https://github.com/collections/programming-languages) ranking: #34 to **#22**
- Page views on red-lang.org: 1.06M to **1.65M**

As you can see, 2017 has been a great year, with interest in Red growing for some stats, faster than in all the previous years put together!

Short history of Red

Given that many newcomers arrived in Red community in the last two years, some might be confused about past Red history and timeline, so I would like to write it down now, and add some comments in retrospect on some of the choices made in the past.

The Red project was officially launched in March 2011, with the first public [announcement](http://www.red-lang.org/2011/02/journey-begins.html) and the release of the version [0.1.0](http://www.red-lang.org/2011/03/taking-redsystem-pill.html), which was developed in 3 months. That early version provided a fully working Red/System toolchain, with a compiler and linker, all in 60KB of [source code](https://github.com/red/red/releases/tag/v0.1.0). That was just for Red/System, the low-level DSL of Red.

The Red language had different goals at that time, it was meant to be a statically typed sub-set of Rebol, with static scopes and no dynamic binding. That Red would have been only compiled, so no interpreter, and would eventually had a REPL after 1.0, once a JIT was available. Given my old work on an experimental Rebol [clone](https://sourceforge.net/projects/r-sharp/) in C a few years ago (implemented in 9 months), I estimated that a 1.0 for such Red could be doable in a year. Such a version would only support Windows and x86 architecture, would have most, but not all of Rebol datatypes, no DSL, no GUI nor floating point support.

During 2011, a community of users and followers started forming around this early Red version, the daily interactions with the community had some influence on the goals I had initially set for Red, and at some point during that year, I realized that what I really wanted was a more dynamic language, closer to Rebol, rather than a crippled static version. I decided then to trace a new longer road to a different design for Red, more in line with my personal desires and community expectations.

The scope extended as we kept adding new features (sometimes initiated by contributors), like ARM support, floating point support and Parse dialect. We then replaced the early low-level lexer with a much more capable version using Parse. The community was pressuring for a more "production-ready" version, which meant adding more features, like extra datatypes, postponing the 1.0 milestone further away up to 2014.

I have been working full-time on the project since 2011, and invested all my personal money to fund it, helped by individual donations from community members. Frankly, without those extra donations, I wouldn't have made it. In late 2013, I was contacted by a China-based VC (Innovation Works) who was interested by Red project. They offered me the chance to join them in Beijing. I initially politely refused, as I thought that doing so would consume too much time and accepting investments never has a guaranteed outcome. But thinking more about it, I also considered that raising a seed round would allow some talents in the community to work full time on Red, speeding it up. So, I accepted the offer and relocated to Beijing in 2014, settling for a new life there.

Red in its command-line form was not good enough to attract any investor, nor make any good business plan. So I made a major decision to incorporate the GUI module in the roadmap as soon as possible. The original plan was to only add it after Red had reached version 1.0. I also thought that Android support would be a key element for Red's future, so I also move it forward too. It took me about 7 months to raise a seed round, and 4 more months to effectively get the money into the bank account of the newly formed company in mid-2015. Work on Red during that time went more slowly. It never stopped though as we could hire our first developers (using a loan) and the number of contributors from the community was increasing.

A new roadmap was set and a 1.0 was planned for 2016 focusing on Android GUI support. Though, the early prototype on Android showed that developing a cross-platform GUI engine starting with Android (as we wanted it asap) along with the VID DSL was not a good way to achieve it, as the development cycle with Android was too long, and debugging at low-level there was very limited and painful. It was way more convenient to do it on a desktop OS like Windows, which was also the platform of roughly half of our users. So we switched the GUI development to Windows first, as it would be much faster to design and polish the cross-platform parts there, then make an Android back-end for it after.

The GUI engine with the VID dialect and back-end for Windows was released in early 2016. We initially planned only a minimal support and just a few (5-6) widgets for the Windows back-end, but the community wanted more (and still does). At the same time, we were also working in parallel on a Red IDE engine based on [Scintilla](http://scintilla.org/). We needed more widget support, so we spent extra months doubling the initial number of widgets and polishing the features of VID, Draw dialect and View engine. The Scintilla IDE prototype was not as promising as we expected, some limitations with Scintilla were disappointing to say the least. They included awkward Unicode support and UI limitations. A Red GUI based IDE was a better option, allowing us to support any feature we could think of. We ran out of resources for such a side-project, so we put it to sleep until we can fund it (hint hint, the ICO would help there a lot too!).

After the initial GUI release, before we went back to Android support, we had to do some promotion about Red and our new shiny GUI system, in order to increase our userbase  (growth is a constant concern for VC-backed startups). Though, the competition was rough, as the new state of the art (on the web) was reactive frameworks which were providing a more powerful and simpler way to operate GUIs. Such reactive GUI was also something I had on my wish-list since 2010 for Red, and it seemed like the right time to add it, so that's what we did and [released](http://www.red-lang.org/2016/06/061-reactive-programming.html) it in mid-2016. That enabled the production of some pretty [impressive](http://www.red-lang.org/2016/07/native-reactive-spreadsheet-in-17-loc.html) [demos](http://www.red-lang.org/2016/07/eve-style-clock-demo-in-red-livecoded.html) I think, for a cross-platform native GUI system.

We went back to Android development after that, starting by adding a preprocessor to Red lexer, in order to move a lot of costly work done at runtime to resolve Java method signatures, to compile-time. This work consumed around a couple of months, especially as we also took that opportunity to add an experimental macro system. The preprocessor is currently used by the Red runtime to reduce code size, though, we late figured out a better way to handle the Java method signatures  without relying on the preprocessor. So, we could have saved some time there, even if it's always easier to come to such conclusion when looking back in time.

As we continued on Android support, we stumbled upon new unexpected issues. All the features added in the last releases significantly increased the runtime size, resulting in very long compilation times. Moreover, the GUI system and newest object features broke the ability for the Red compiler to produce functioning shared library files for Red programs (Red/System shared libraries were fine, it was a limitation of the Red runtime library and compiler). We then decided to launch the "libRed" branch, in order to solve all those issues by enabling the compilation of the Red runtime as a shared library in two different forms: one is libRedRT, used only for speeding up the compilation process, the other is [libRed](https://doc.red-lang.org/en/libred.html), which provides an external API for embedding Red into external software (which was on our todo-list anyway and in the Red initial goals). That work took more time than expected, roughly 7 months, as I had to travel across the globe many times (for personal reasons) going offline for a total of 2 months during that period, which made it harder to properly focus on some of the complex issues that needed solving. That is where we lost the most time in the last couple of years, although the macOS GUI branch was still advancing at the same time in parallel.

After macOS release earlier this year, we could finally continue the work on Android, and guess what, we could develop a GUI backend on par with Windows one in about a month and half only! All the preparation work done before was paying off in the end! Still, that is not enough for acceptable Android support, as mobile devices have many features which need first-class support, and we are working on them for 0.6.5 release (delayed by the ICO preparations and process). We will provide more info about Android support very soon.

Another important consequence of adding GUI support for macOS, was the need to have a GUI console there too (identical to the Windows one), as we have great plans for the GUI console itself. As a side-project, we started working on a new GUI console engine in early 2017, replacing the low-level OS-specific Red/System bindings with the Red/View engine, enabling cross-platform support out of the box, and adding some key features we needed on the Red roadmap, like rich-text support. Those features are available in our 0.6.4 branch, and will be part of the next release shortly after the ICO (though probably after Chinese New Year in february).

One thing I have greatly underestimated during all those years (especially at the beginning), was the amount of time that would be spent interacting with the community, as I tried to be as present as possible online to answer questions, welcome newcomers and help them get started. My [public posts](http://red.qyz.cz/stats/#top20) are just the tip of the iceberg, as many people just contacted me on direct channels (email, private messages on AltME, Gitter, skype, ...), and that consumed a lot of time too. But, I think it was a necessity anyway, just unaccounted for. Nowadays it is much easier for me, as we have community managers and many other members who are doing a great job handling newcomers, wave after wave. Another thing I didn't consider at the beginning was also how much impact and influence the community would have on the features that we would put into Red (especially pre-1.0). As old-timers from Rebol community were used to have a great amount of feature available out of the box, they expected Red to be on par with that, often without much concern about the costs involved in supporting the desired features. I think I should have said "no" more often than I did, or just postponing them after 1.0.

All in all, despite the bumpy road sometimes, the current version of Red is better in many ways than what I hoped for in 2011. We still have the option to rename the 0.7.0 or 0.7.1 upcoming milestones to a 1.0 candidate, as they would have all the features we initially planned for a 1.0, though there are pros and cons about pushing the other planned features post-1.0, but I understand that Red users nowadays are more interested in reaching a 1.0, than having a more feature-complete one. We can discuss about that on our Gitter channels.

This is a (very) short version of the Red history, there is so much more to say about it, maybe someday when I will have some spare time, I'll write down the whole thing in a book, including my views on language design, and all the non-tech related side stories. ;-)

Cheers!

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [12:23 AM](https://www.red-lang.org/2018/01/overview-of-red-development-history.html "permanent link") [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=7616926296108184745&from=pencil "Edit Post")

[]()

#### 6 comments:

1. ![](//resources.blogblog.com/img/blank.gif)
   
   [Martin](http://ceronio.net)[January 4, 2018 at 9:09 AM](https://www.red-lang.org/2018/01/overview-of-red-development-history.html?showComment=1515053372527#c522746762150704600)
   
   That is a very cool video! I hope it was generated with Red :-) I wish the Red project all the best for 2018. I am eagerly awaiting its fruit.
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/522746762150704600)
   
   [Replies]()
   
   1. [Reply]()
2. ![](//www.blogger.com/img/blogger_logo_round_35.png)
   
   [-pekr-](https://www.blogger.com/profile/07020449092496153923)[January 4, 2018 at 10:04 AM](https://www.red-lang.org/2018/01/overview-of-red-development-history.html?showComment=1515056692654#c5674532660781529551)
   
   Excellent. Very well written and much appreciated! Thanks for this extensive summary. This kind of internal project info is importand for the community to better understand, what is actually happening behind the close doors. If time permits, such nice and honest summary would be surely welcomed on even more frequent basis ....
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/5674532660781529551)
   
   [Replies]()
   
   1. [Reply]()
3. ![](//www.blogger.com/img/blogger_logo_round_35.png)
   
   [onetom](https://www.blogger.com/profile/02979871120845520534)[January 4, 2018 at 10:16 AM](https://www.red-lang.org/2018/01/overview-of-red-development-history.html?showComment=1515057408337#c876754778445938553)
   
   The non-tech related stories are just as exciting as the tech ones!  
   Maybe after Red 3.0, you shall sit down and write that book, before you forget what happened ;)
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/876754778445938553)
   
   [Replies]()
   
   1. [Reply]()
4. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjVkVFuDf1xwxDEym6ZtQVv7pbeN6IQ5mq_vtLfYyVij0aldy3RR0vvuXPNFkx5ZxnODYUmaTfag-6aXKhJhJ5_MFY8qJ1_XEaJNLj0QG98b_cHiybXc2L7CcA3kcQeFH8/s45-c/PIC_0005.jpg)
   
   [Semseddin Moldibi](https://www.blogger.com/profile/09088672468817290872)[January 4, 2018 at 1:01 PM](https://www.red-lang.org/2018/01/overview-of-red-development-history.html?showComment=1515067283044#c6278963483350613381)
   
   Great post &amp; video Doc! You are doing a great job for sure, we, cheeky-community-members, are always ask you to put more features that could be added after v1.0.. But, even now we have View, Draw, VID, GUI / Console REPL, compiler and much more!  
   It looks Android support is one of the hardest task that you constantly back to work on it.
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/6278963483350613381)
   
   [Replies]()
   
   1. [Reply]()
5. ![](//resources.blogblog.com/img/blank.gif)
   
   [Bo](http://ameridroid.com)[January 4, 2018 at 6:33 PM](https://www.red-lang.org/2018/01/overview-of-red-development-history.html?showComment=1515087214719#c5506358367711474157)
   
   Communication is one of the most important ways to incite empathy into the plight of unforeseen circumstances. Thanks for allowing us to empathize with you through this long challenge that is Red 1.0! We only care because we are excited. :-)
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/5506358367711474157)
   
   [Replies]()
   
   1. [Reply]()
6. ![](//resources.blogblog.com/img/blank.gif)
   
   iArnold[January 4, 2018 at 10:11 PM](https://www.red-lang.org/2018/01/overview-of-red-development-history.html?showComment=1515100307244#c3683092142503537320)
   
   Red has come a long way, the hard way. Great, I even saw that I have made it into this video! I really think there is more possible in attracting contributors for other development issues when some guidance is provided for example on the i/o and linux developing so the two of you do not have to do all the work. There are often a lot of skilled people around that could do plenty on top of a minimal basic feature. Hope to see a lot of new faces flying over the next video!
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/3683092142503537320)
   
   [Replies]()
   
   1. [Reply]()

[Add comment]()

[Load more...]()

[]()

[](https://www.blogger.com/comment/frame/5936111837781935054?po=7616926296108184745&hl=en&saa=85391&origin=https%3A%2F%2Fwww.red-lang.org)

[Newer Post](https://www.red-lang.org/2018/01/red-here-we-go.html "Newer Post") [Older Post](https://www.red-lang.org/2018/01/answers-to-community-questions.html "Older Post") [Home](https://www.red-lang.org/)

Subscribe to: [Post Comments (Atom)](https://www.red-lang.org/feeds/7616926296108184745/comments/default)

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
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2018/03/) (4)
  
  <!--THE END-->
  
  - [▼](javascript:void%280%29)  [January](https://www.red-lang.org/2018/01/) (5)
    
    - [RED Token Sale Success!](https://www.red-lang.org/2018/01/red-token-sale-success.html)
    - [Registration Special Offer](https://www.red-lang.org/2018/01/registration-special-offer.html)
    - [RED: here we go!](https://www.red-lang.org/2018/01/red-here-we-go.html)
    - [Overview of Red development history](https://www.red-lang.org/2018/01/overview-of-red-development-history.html)
    - [Answers to community questions](https://www.red-lang.org/2018/01/answers-to-community-questions.html)

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
