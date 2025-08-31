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

## July 29, 2022

[]()

### New Red binaries

Since many years, we are offering pre-built binaries for the Red toolchain, as a more convenient way to use Red, even if it is not strictly needed, as Red can be run [from its sources](https://github.com/red/red#running-red-from-the-sources-for-contributors), the toolchain being run by a Rebol2 interpreter. As the Red REPL and toolchain are not run by the same engine, the console (REPL) used to be compiled on first run of the \`red\` executable (when no arguments was provided or a Red script was passed). This resulted in a significant delay on the first use of the console (both for the GUI and CLI versions). 

We have now decided to change that by providing separate pre-built binaries for the consoles and toolchain. This is a temporary split until Red gets self-hosted, at which point we can recombine everything into a single binary.

Another change is the temporary dropping of the semantic versioning until version 1.0 and related "stable" releases, as it seems to be too confusing to some users (Red being still in alpha stage). This also will remove a tendency from some users to care more about version increments than feature availability and work being done overall. We will now be proposing only pre-built binaries for latest commit, though older binaries will still be available if that can be of any help to anyone.

So the pre-built binaries now are:

- Red GUI : Red interpreter + View + GUI console
- Red CLI : Red interpreter + CLI console
- Red Toolchain : Encapper for Red + Red/System compiler

We are also considering ways to merge the GUI and CLI consoles into a single binary which can work even if no GUI API is available, falling back on CLI mode. We will also have the console(s) act as a front-end for the toolchain, even downloading it for you in the background when needed. Though for that we need a proper asynchronous \`call\` function implementation. More news about this soon.

In the meantime, enjoy running Red consoles almost instantly from just a click on the [Download](https://www.red-lang.org/p/download.html) page!

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [6:18 PM](https://www.red-lang.org/2022/07/new-red-binaries.html "permanent link") [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=919150411537812740&from=pencil "Edit Post")

Labels: [binaries](https://www.red-lang.org/search/label/binaries), [console](https://www.red-lang.org/search/label/console), [download](https://www.red-lang.org/search/label/download)

[]()

#### 17 comments:

01. ![](//resources.blogblog.com/img/blank.gif)
    
    Anonymous[August 2, 2022 at 12:51 AM](https://www.red-lang.org/2022/07/new-red-binaries.html?showComment=1659394270972#c8060700291444411924)
    
    Been following for a very long time! Version 1.0 on the horizon and two posts in 30 days... I just wet myself!!!
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/8060700291444411924)
    
    [Replies]()
    
    1. [Reply]()
02. ![](//resources.blogblog.com/img/blank.gif)
    
    Anonymous[August 28, 2022 at 1:59 PM](https://www.red-lang.org/2022/07/new-red-binaries.html?showComment=1661687966662#c724325757770115185)
    
    Looking forward to 1.0 and 64-bit binaries, as my prefers OS for development is macOS, and they dropped support for 32-but binaries many versions ago.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/724325757770115185)
    
    [Replies]()
    
    1. [Reply]()
03. ![](//resources.blogblog.com/img/blank.gif)
    
    Anonymous[September 3, 2022 at 12:28 PM](https://www.red-lang.org/2022/07/new-red-binaries.html?showComment=1662200929134#c1447202628065681933)
    
    I will check in another 5 years to see how the plans got distracted by another stuff and maybe in 8 years to see 0.99 version.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/1447202628065681933)
    
    [Replies]()
    
    1. ![](//resources.blogblog.com/img/blank.gif)
       
       Anonymous[October 10, 2022 at 1:58 PM](https://www.red-lang.org/2022/07/new-red-binaries.html?showComment=1665403131987#c8825192604641645309)
       
       Wow, this dill is really easy to spot after you first notice his corrosive behaviour and infantile tantrums. Anyone care to play "psychoanalyse the troll" for a bit of fun?
       
       [Delete](https://www.blogger.com/comment/delete/5936111837781935054/8825192604641645309)
       
       [Replies]()
       
       1. [Reply]()
       
       ![](//resources.blogblog.com/img/blank.gif)
       
       Anonymous[October 13, 2022 at 2:28 PM](https://www.red-lang.org/2022/07/new-red-binaries.html?showComment=1665664131322#c5206414891371539358)
       
       I wish Rebol was still being maintained by Carl Sassenrath. Man, I really enjoyed Rebol.
       
       [Delete](https://www.blogger.com/comment/delete/5936111837781935054/5206414891371539358)
       
       [Replies]()
       
       1. [Reply]()
       
       ![](//resources.blogblog.com/img/blank.gif)
       
       Anonymous[April 6, 2023 at 12:37 AM](https://www.red-lang.org/2022/07/new-red-binaries.html?showComment=1680734229055#c1737430252972506557)
       
       I know the behavior may seem "hostile" and the urge to tell him to "fork" off might be strong... but at this point, after waiting for so stinking long, I'd be happy for the help if it moved things along. LOL. All kidding aside I'm excited that the team might FINALLY be close... maybe.
       
       [Delete](https://www.blogger.com/comment/delete/5936111837781935054/1737430252972506557)
       
       [Replies]()
       
       1. [Reply]()
       
       ![](//resources.blogblog.com/img/blank.gif)
       
       Anonymous[May 18, 2023 at 2:18 PM](https://www.red-lang.org/2022/07/new-red-binaries.html?showComment=1684412296903#c2023684776287687534)
       
       As I thought nothing happened. Keep going with your analysis. If it's going to be as finished as red-lang you might not finish it though. Jokes aside I remember red-lang aiming for 1 version around 2015 or so. Do you really feel that I'm trolling in 2022 doubting the releases?
       
       [Delete](https://www.blogger.com/comment/delete/5936111837781935054/2023684776287687534)
       
       [Replies]()
       
       1. [Reply]()
       
       [Reply]()
04. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [Barak Kleyman](https://www.blogger.com/profile/02009094379322030489)[February 12, 2023 at 2:20 PM](https://www.red-lang.org/2022/07/new-red-binaries.html?showComment=1676208005668#c5803808199856684434)
    
    I wish it'll see 1.0 very soon, plus maybe more apealing docs  
    this concept of language is very on the spot, can't wait....
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/5803808199856684434)
    
    [Replies]()
    
    1. [Reply]()
05. ![](//resources.blogblog.com/img/blank.gif)
    
    Anonymous[March 26, 2023 at 4:09 PM](https://www.red-lang.org/2022/07/new-red-binaries.html?showComment=1679839790718#c3811491984135254354)
    
    It's been about 9 months since this post, any progress since then?
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/3811491984135254354)
    
    [Replies]()
    
    1. ![](//resources.blogblog.com/img/blank.gif)
       
       Anonymous[May 11, 2023 at 10:50 AM](https://www.red-lang.org/2022/07/new-red-binaries.html?showComment=1683795002023#c7054653050266797165)
       
       I guess may be in Q3 2023 or at end of it finger cross
       
       [Delete](https://www.blogger.com/comment/delete/5936111837781935054/7054653050266797165)
       
       [Replies]()
       
       1. [Reply]()
       
       [Reply]()
06. ![](//resources.blogblog.com/img/blank.gif)
    
    Anonymous[May 3, 2023 at 2:18 AM](https://www.red-lang.org/2022/07/new-red-binaries.html?showComment=1683073087148#c8358597429981322148)
    
    It's been about 9 months since this post, any progress since then?
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/8358597429981322148)
    
    [Replies]()
    
    1. [Reply]()
07. ![](//resources.blogblog.com/img/blank.gif)
    
    Atto[May 3, 2023 at 2:20 AM](https://www.red-lang.org/2022/07/new-red-binaries.html?showComment=1683073219191#c4199735382623717898)
    
    It's been about 9 months since this post, any progress since then?
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/4199735382623717898)
    
    [Replies]()
    
    1. [Reply]()
08. ![](//resources.blogblog.com/img/blank.gif)
    
    Anonymous[May 22, 2023 at 2:33 PM](https://www.red-lang.org/2022/07/new-red-binaries.html?showComment=1684758819967#c4759876344927476953)
    
    What was the problem? What was the big deal to have have the console compiled and put into a .hidden directory?
    
    How about focusing on putting out some "get started" docs, for e.g., Chapter 2 of the REBOL docs that shows command line flags.
    
    The biggest hurdle for end users is knowing what we can and can not achieve by using Red right now.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/4759876344927476953)
    
    [Replies]()
    
    1. [Reply]()
09. ![](//resources.blogblog.com/img/blank.gif)
    
    [More info](https://neworleanscareercoachingcenter.com)[June 1, 2023 at 11:54 AM](https://www.red-lang.org/2022/07/new-red-binaries.html?showComment=1685613261176#c8909379285031390135)
    
    Great to see the improvements in the Red binaries! The separation of the console and toolchain binaries will definitely save users a significant amount of time, especially on the initial run. Removing the confusion caused by semantic versioning and focusing on the latest commit's pre-built binaries is a smart move, allowing users to prioritize feature availability and overall progress. I'm excited to hear about the upcoming plans to merge the GUI and CLI consoles, providing a seamless experience for both modes and even considering automatic downloads. Keep up the great work!
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/8909379285031390135)
    
    [Replies]()
    
    1. [Reply]()
10. ![](//resources.blogblog.com/img/blank.gif)
    
    Jason Cunliffe[August 9, 2023 at 4:46 PM](https://www.red-lang.org/2022/07/new-red-binaries.html?showComment=1691592373599#c3129457263229036264)
    
    Just please combine all 3 into ONE binary
    
    \_with init or config or ARGS to fine tune use and behavior
    
    Keep
    
    KIS
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/3129457263229036264)
    
    [Replies]()
    
    1. [Reply]()
11. ![](//resources.blogblog.com/img/blank.gif)
    
    Isoux[September 24, 2023 at 10:14 PM](https://www.red-lang.org/2022/07/new-red-binaries.html?showComment=1695586477011#c3432958498659401104)
    
    Compiling Red toolchain ...
    
    I can't find any instructions on how to compile the Red toolchain?
    
    I want to add the #asm directive to the rebol file red/system/compiler.r
    
    Any help is welcome!
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/3432958498659401104)
    
    [Replies]()
    
    1. [Reply]()
12. ![](//resources.blogblog.com/img/blank.gif)
    
    Isoux[September 24, 2023 at 10:18 PM](https://www.red-lang.org/2022/07/new-red-binaries.html?showComment=1695586682805#c2323034572108517573)
    
    I can't find any instructions on how to compile the toolchain?
    
    I want to add the #asm directive to the rebol file red-sistem-compiler.r
    
    Any help is welcome!
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/2323034572108517573)
    
    [Replies]()
    
    1. [Reply]()

[Add comment]()

[Load more...]()

[]()

[](https://www.blogger.com/comment/frame/5936111837781935054?po=919150411537812740&hl=en&saa=85391&origin=https%3A%2F%2Fwww.red-lang.org)

[Newer Post](https://www.red-lang.org/2023/06/dynamic-refinements-and-function.html "Newer Post") [Older Post](https://www.red-lang.org/2022/07/the-road-to-10.html "Older Post") [Home](https://www.red-lang.org/)

Subscribe to: [Post Comments (Atom)](https://www.red-lang.org/feeds/919150411537812740/comments/default)

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
