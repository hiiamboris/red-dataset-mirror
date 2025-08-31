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

## June 30, 2019

[]()

### June 2019 Update

If you are an active member of the Red community, you will have likely been keeping track of Red's progress through our Gitter rooms and Github repositories, but we wanted to officially bring everyone up to speed with a shiny new blog post. The team has been busy since January on many fronts, multiplexing its efforts on many different branches of development. Here is an overview of what we have been cooking and what is coming.

RED Wallet

We are preparing to release v0.4.0 of the [RED Wallet](https://www.red-lang.org/2018/06/red-wallet-tiny-simple-fast-and-secure.html) which will feature:

- Bitcoin support with both Legacy and SegWit addresses!
- Updated support for ERC-20 tokens for Ledger Nano keys (after Ledger externalized such token management to the wallet software earlier this year).
- Support for the latest firmware of the Trezor key.
- Some bug fixes.

The new wallet is currently under heavy testing, we plan to release it publicly in about a week.

C3

The first public alpha of the C3/System compiler is coming this summer. It is still under heavy development though. C3/High has made little progress as it needs real-world use-cases from the smart contract ecosystem for modelling the DSL(s). That ecosystem has not spread around much, probably due to the so-called "crypto-winter". As new big players are now entering the space, we are looking forward to the possibilities for providing new backends for the C3/System, like for the [Libra](https://libra.org/en-US/open-source-developers/) network.

We will be soon releasing our ETH connector for Red. The final part missing is the integration of hardware and software key support for signing transactions on real online networks (we use private networks during development). The code for hardware key support is already there in our wallet, so we just need to integrate it inside the connector. For software keys, we have developed specific [support](https://github.com/bitbegin/eth-wallet) for them, but it relies on third-party libraries, which are currently not a good match for our single binary distribution model.

GTK support

Red should offer soon a pretty good GUI backend for Linux, thanks to the community effort led by [R cqls](https://github.com/rcqls). The [last PR](https://github.com/red/red/pull/3928) for red/GTK branch weighs in at about 400 commits and covers most of View features.

The main remaining features to cover are:

- Camera widget support (already available in an experimental branch)
- Rich-text and Draw improvements
- Shape dialect support
- Some stability fixes

Here are some examples of scripts and apps using the GTK backend:

[![](https://files.gitter.im/red/GTK/TGpt/Capture-d_ecran-2019-04-28-a-22.18.03.png)](https://files.gitter.im/red/GTK/TGpt/Capture-d_ecran-2019-04-28-a-22.18.03.png)[![](https://files.gitter.im/red/GTK/E9v6/Capture-d_ecran-2019-03-31-a-19.44.04.png)](https://files.gitter.im/red/GTK/E9v6/Capture-d_ecran-2019-03-31-a-19.44.04.png)[![](https://files.gitter.im/red/GTK/QbWn/Capture-d_ecran-2019-04-20-a-17.23.42.png)](https://files.gitter.im/red/GTK/QbWn/Capture-d_ecran-2019-04-20-a-17.23.42.png)

GTK theming is also supported:

[![](https://files.gitter.im/red/GTK/n7t0/Capture-d_ecran-2019-04-25-a-13.43.27.png)](https://files.gitter.im/red/GTK/n7t0/Capture-d_ecran-2019-04-25-a-13.43.27.png)

[![](https://files.gitter.im/red/GTK/vUQT/Capture-d_ecran-2019-04-25-a-13.38.50.png)](https://files.gitter.im/red/GTK/vUQT/Capture-d_ecran-2019-04-25-a-13.38.50.png)

Red/System

The ARM backend got many improvements:

- Largely improved ARMhf (hard-float) support.
- Fixes on regressions for ARMsf (soft-float).
- Various libraries loading fixes, now all unit tests are passing again.
- New ARMhf target added to our [Travis CI](https://travis-ci.org/red/red) backend.

A few low-level features were [added](https://static.red-lang.org/red-system-specs-light.html#section-20), that would make it easier to write device drivers or operating systems directly in Red/System:

- Ability to save/reload all CPU registers on stack using intrinsics.
- Ability to read/write CPU I/O ports using new intrinsics.
- Ability to inline machine-code pretty much anywhere in R/S source code.
- Replacing hard native support for modulo operation on floats by the soft fmod() import.

VSCode plugin

The [Red plugin](https://marketplace.visualstudio.com/items?itemName=red-auto.red) for VSCode got a major refresh with a full [reimplementation](https://github.com/red/VScode-extension) using [LSP model](https://langserver.org/) improving the efficiency of existing features and adding some new ones:

- Smarter code completion
- Realtime syntax checking
- Goto definition support

[![](https://raw.githubusercontent.com/red/VScode-extension/master/images/goto-definition.gif)](https://raw.githubusercontent.com/red/VScode-extension/master/images/goto-definition.gif)[![](https://raw.githubusercontent.com/red/VScode-extension/master/images/completion.gif)](https://raw.githubusercontent.com/red/VScode-extension/master/images/completion.gif)

Other WIP features

**JSON support**

JSON format is now [supported](https://github.com/red/red/blob/master/environment/codecs/JSON.red) by Red's codec system. So it can be used in load/as and save/as to convert JSON data back and forth to Red values. More info about its usage in the Red 0.6.5 release notes.

**Shadows in Draw**

Some simple shadow effects in Draw have been [implemented](https://github.com/bitbegin/red/commits/blur-demo). They have the capabilities of the [box-shadow](https://developer.mozilla.org/en-US/docs/Web/CSS/box-shadow) model of CSS.

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhZhc-tLvwcS25Mh_pWQwCFIFQEZJYCSAAdAtkP2ADtDQv5npjJwwzrmQpPdYVXb-WwRQ9JPEiu6okX25eEggjnwwFAnpMoEWQH2xzfQnj5dQeNTWc5cERG_YPIadyYYf-p9O8CkTYFQjhe/s400/photo_2019-06-30_22-46-26.jpg)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhZhc-tLvwcS25Mh_pWQwCFIFQEZJYCSAAdAtkP2ADtDQv5npjJwwzrmQpPdYVXb-WwRQ9JPEiu6okX25eEggjnwwFAnpMoEWQH2xzfQnj5dQeNTWc5cERG_YPIadyYYf-p9O8CkTYFQjhe/s1600/photo_2019-06-30_22-46-26.jpg)

**GPIO library for Raspberry Pi**

Red has supported Raspberry Pi as a compilation target for many years, but we were still lacking a proper GPIO library, which is now under development. It will be implemented as a gpio:// port for now in the port-type branch. A dedicated library or dialect should be added also as a higher abstraction layer in order to simplify GPIO programming even further. Hobbyists and seasoned programmers will be able soon to build IoT projects on RPi easily using Red with GTK for the GUI support.

Next Red releases

**0.6.5: Splitting the console and compiler**

This is an important change that will be the new way to use Red and, hopefully, provide an even better experience, especially for newcomers. Not much coding is involved but we still need a prototype before giving the final go-ahead then proceeding with the code and infrastructure changes. We plan to finish those tasks during this summer (no precise ETA for now).

**0.7.0: Full async I/O**

Work started on this release many months ago but with a low-priority, as we have many other features to release first. The current state on the main features is:

- port! type is almost completed and already usable (e.g. the eth:// port)
- the native ports TCP, UDP, DNS should be implemented this summer.
- the async API still needs design work before being implemented.

Tokens retro-distribution

We are setting up the last steps for the RED tokens retro-distribution (past contributions) and the first monthly distribution for new contributors. We will publish the first article in July that will provide all the rules that we have established for that process. Then shortly after, we will publish the list of the contributors who were selected according to those rules, with the reward amounts and proceed with the distribution (using the batch transactions feature of the RED Wallet).

For example, as part of our tokens rewarding program for contributors, R cqls should receive a good amount of them in the next distribution,

The road ahead...

The most notable next planned milestones are:

- RED Wallet 0.4.0 in July.
- C3/System alpha release in August!
- Red/Android beta release in September!
- Red/Pro for New year!
- Red 64-bit will be split into two phases:
  
  - cross-compiled from 32-bit platform: end of the year
  - toolchain ported to 64-bit: 2020

We plan to give more information about each of those big new additions to the Red family this summer.

As several development tracks are coming to fruition in the next couple of months, new articles should come up more frequently.

Go Red Go!

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [4:44 PM](https://www.red-lang.org/2019/06/june-2019-update.html "permanent link") [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=1711373706537667785&from=pencil "Edit Post")

[]()

#### 8 comments:

1. ![](//www.blogger.com/img/blogger_logo_round_35.png)
   
   [aiguy](https://www.blogger.com/profile/15491417316027911062)[July 1, 2019 at 8:57 PM](https://www.red-lang.org/2019/06/june-2019-update.html?showComment=1562007467949#c6652826849573332054)
   
   I'm not sure I understand the significance of 0.6.5: Splitting the console and compiler. How will that give news as better experience as was mentioned. Are you saying there will be an option to disable the console from appearing inside the Red code. I can see how that would be nice?
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/6652826849573332054)
   
   [Replies]()
   
   1. ![](//www.blogger.com/img/blogger_logo_round_35.png)
      
      [-pekr-](https://www.blogger.com/profile/07020449092496153923)[July 2, 2019 at 11:56 AM](https://www.red-lang.org/2019/06/june-2019-update.html?showComment=1562061362310#c3529612703145425311)
      
      aiguy - I might be wrong, but my understanding is, that so far, you download an Rebol 2 encapsulated app as a red.exe and it produces the console for you. Imo the plan is to offer Red in a console form, pure red, and to compile download/call old R2 toolchain. I might be wrong though ....
      
      [Delete](https://www.blogger.com/comment/delete/5936111837781935054/3529612703145425311)
      
      [Replies]()
      
      1. [Reply]()
      
      [Reply]()
2. ![](//resources.blogblog.com/img/blank.gif)
   
   [Bo Lechnowsky](http://ameridroid.com)[July 1, 2019 at 9:38 PM](https://www.red-lang.org/2019/06/june-2019-update.html?showComment=1562009937794#c6259146508737291856)
   
   Great update! Looking forward to so many of these features!
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/6259146508737291856)
   
   [Replies]()
   
   1. [Reply]()
3. ![](//resources.blogblog.com/img/blank.gif)
   
   James\_Nak[July 1, 2019 at 10:23 PM](https://www.red-lang.org/2019/06/june-2019-update.html?showComment=1562012606335#c1160983105043260165)
   
   Ah, Android will finally be here! Go Doc Go!
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/1160983105043260165)
   
   [Replies]()
   
   1. [Reply]()
4. ![](//resources.blogblog.com/img/blank.gif)
   
   Anonymous[July 2, 2019 at 10:44 AM](https://www.red-lang.org/2019/06/june-2019-update.html?showComment=1562057086233#c485385011032204562)
   
   The GTK looks very maccy to me
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/485385011032204562)
   
   [Replies]()
   
   1. [Reply]()
5. ![](//www.blogger.com/img/blogger_logo_round_35.png)
   
   [Jeannot Chapdelaine](https://www.blogger.com/profile/12761310805429900677)[July 4, 2019 at 5:28 AM](https://www.red-lang.org/2019/06/june-2019-update.html?showComment=1562210883127#c6651196850814784273)
   
   Nenad, thank you for the update. Android will be a major positioning for RED.
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/6651196850814784273)
   
   [Replies]()
   
   1. [Reply]()
6. ![](//www.blogger.com/img/blogger_logo_round_35.png)
   
   [Kevin](https://www.blogger.com/profile/14704384146361509956)[June 27, 2021 at 2:49 PM](https://www.red-lang.org/2019/06/june-2019-update.html?showComment=1624798161730#c8049407105262073892)
   
   Is the Android version ready? If so where can I found it?
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/8049407105262073892)
   
   [Replies]()
   
   1. [Reply]()
7. ![](//www.blogger.com/img/blogger_logo_round_35.png)
   
   [Gregg Irwin](https://www.blogger.com/profile/02841117907023902973)[June 27, 2021 at 9:12 PM](https://www.red-lang.org/2019/06/june-2019-update.html?showComment=1624821177945#c584653324251778316)
   
   The Android version saw a lot of work a few months back, to bring it up to date. We hope to merge those changes in Q3. We haven't published Android binaries, letting people build it locally. We'll consider adding binaries in the future.
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/584653324251778316)
   
   [Replies]()
   
   1. [Reply]()

[Add comment]()

[Load more...]()

[]()

[](https://www.blogger.com/comment/frame/5936111837781935054?po=1711373706537667785&hl=en&saa=85391&origin=https%3A%2F%2Fwww.red-lang.org)

[Newer Post](https://www.red-lang.org/2019/07/red-wallet-040.html "Newer Post") [Older Post](https://www.red-lang.org/2019/02/january-2019-update.html "Older Post") [Home](https://www.red-lang.org/)

Subscribe to: [Post Comments (Atom)](https://www.red-lang.org/feeds/1711373706537667785/comments/default)

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
  
  - [▼](javascript:void%280%29)  [June](https://www.red-lang.org/2019/06/) (1)
    
    - [June 2019 Update](https://www.red-lang.org/2019/06/june-2019-update.html)
  
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
