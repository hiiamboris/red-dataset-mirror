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

## April 4, 2015

[]()

### 0.5.2: Case folding and hash! support

This is minor release mainly motivated by the need to fix some annoying issues and regressions we have encountered in the last release:

- the **help** function was displaying an error when used with no arguments, preventing newcomers from seeing the general help information

<!--THE END-->

- the console pre-compilation issue with timezones was back.

Some significant new features managed to sneak into this release too, along with some [bugfixes](https://github.com/red/red/issues?q=milestone%3A0.5.2).

Case folding

Red now provides **uppercase** and **lowercase** natives and more generally, better support for Unicode-aware case folding. Red runtime library contains now a general one-to-one mapping table for case folding that should cover most user needs.

```
    red>> uppercase "hello"
    == "HELLO"
    red>> uppercase/part "hello" 1
    == "Hello"
    red>> uppercase "français"
    == "FRANÇAIS"
    red>> uppercase "éléphant"
    == "ÉLÉPHANT"
    red>> lowercase "CameL"
    == "camel"
```

This applies also to words, so now case insensitivity is Unicode-aware in Red:

```
    red>> É: 123
    == 123
    red>> é
    == 123
    red>> "éléphant" = "ÉLÉPHANT"
    == true
    red>> "éléphant" == "ÉLÉPHANT"
    == false
```

For special cases, we will expose, in a future release, the collation table we use internally, so that anyone can provide a customized version that is a better fit for some local special rules or usages. For example, some lower case characters (such as "ß") actually map to two or more upper case code points ("SS" in this case). So in Red, by default, you will get:

```
    red>> lowercase "ß"
    == ß
    red>> uppercase "ß"
    == ß
```

You can read more about our plans for full Unicode support on the [wiki](https://github.com/red/red/wiki/Unicode-Issues-with-Proposed-Resolutions).

Hash datatype

The new **hash!** datatype works exactly the same way as in [Rebol2](http://www.rebol.com/docs/core23/rebolcore-16.html#section-2.5). It provides a block-like interface but with fast lookups for most values (block series can be stored in hash! too, but they will not be hashed, so no faster access). It is a very flexible container for any kind of hashed tables (not only associative arrays) while keeping the handy navigational abilities of blocks. The underlying hashing function is a custom implementation of the [MurmurHash3](https://code.google.com/p/smhasher/wiki/MurmurHash3) algorithm. Some usage examples:

```
    red>> list: make hash! [a 123 "hello" b c 789]
    == make hash! [a 123 "hello" b c 789]
    red>> list/c
    == 789
    red>> find list 'b
    == make hash! [b c 789]
    red>> dict: make hash! [a 123 b 456 c 789]
    == make hash! [a 123 b 456 c 789]
    red>> select dict 'c
    == 789
    red>> dict: make hash! [2 123 4 456 6 2 8 789]
    == make hash! [2 123 4 456 6 2 8 789]
    red>> select/skip dict 2 2
    == 123
```

A map! datatype (strictly associative array) should also be provided in the next release, though, we are still investigating some of its features and use-case scenarios before deciding to release it officially.

Good news also about our Mac build server, a new one was kindly provided by Will (thanks a lot for that).

Our next release should mainly feature the [Redbin](https://github.com/red/red/wiki/Redbin-specification) format support for the Red compiler, providing much faster compilation times and reduced generated binaries.

Enjoy! :-)

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [1:28 PM](https://www.red-lang.org/2015/04/052-case-folding-and-hash-support.html "permanent link") [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=628451470321380947&from=pencil "Edit Post")

Labels: [casing](https://www.red-lang.org/search/label/casing), [console](https://www.red-lang.org/search/label/console), [hash](https://www.red-lang.org/search/label/hash), [Unicode](https://www.red-lang.org/search/label/Unicode)

[]()

#### 14 comments:

1. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgAwscySCJ8TzMkUKef4sa05w_LzGJ311_CLrGA_WW5X2rV6VRtV-B_j5zFC6BmAfB0u9aHlo7lZ_ZXDgS3FujIBFqN2EcH9Lm6x1nopl_4CVOeejXTPmVi9-DGx_mstq8/s45-c/*)
   
   [Brian Dickens](https://www.blogger.com/profile/01873914328480997979)[April 4, 2015 at 1:38 PM](https://www.red-lang.org/2015/04/052-case-folding-and-hash-support.html?showComment=1428147521617#c6216187034338397401)
   
   Why not \`set-block-properties block \[hashed]\` or something (pick your notation here), and have it still be something you can pass to something that is \`func \[blk \[block!]] \[...]\`? Having a separate HASH! datatype creates a user-facing difficulty where a conscientious author would write \`func \[blk \[block! hash!]] \[...]\` every time. HASH! should be a property of a block, not an independent datatype. :-(
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/6216187034338397401)
   
   [Replies]()
   
   1. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhea2YYbfPYErJ2kMzpMFdFiDrDBPvhssWA1Qn02TAaWWxu8kEiK5bowqL6NuWMeh7zeXX_EPaDHk4u-PjPHeoJbyjbRSSmdlgN9tqBDEgvMcSriu8O_rgPXus5w61KGd4/s45-c/DSC05563-small2.jpg)
      
      [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055)[April 6, 2015 at 6:54 AM](https://www.red-lang.org/2015/04/052-case-folding-and-hash-support.html?showComment=1428296057196#c1667441790563237558)
      
      We will proceed with the merge of the two datatypes eventually once we decide on the semantics of the construction syntax, as such block property needs to be reflected ,once serialized, in a accurate and elegant way.
      
      [Delete](https://www.blogger.com/comment/delete/5936111837781935054/1667441790563237558)
      
      [Replies]()
      
      1. [Reply]()
      
      [Reply]()
2. ![](//resources.blogblog.com/img/blank.gif)
   
   [Gregg Irwin](http://www.greggirwin.com/)[April 4, 2015 at 7:17 PM](https://www.red-lang.org/2015/04/052-case-folding-and-hash-support.html?showComment=1428167859252#c2109483398650740805)
   
   Great stuff Nenad! Congratulations on another quick release.
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/2109483398650740805)
   
   [Replies]()
   
   1. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhea2YYbfPYErJ2kMzpMFdFiDrDBPvhssWA1Qn02TAaWWxu8kEiK5bowqL6NuWMeh7zeXX_EPaDHk4u-PjPHeoJbyjbRSSmdlgN9tqBDEgvMcSriu8O_rgPXus5w61KGd4/s45-c/DSC05563-small2.jpg)
      
      [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055)[April 6, 2015 at 6:59 AM](https://www.red-lang.org/2015/04/052-case-folding-and-hash-support.html?showComment=1428296342848#c937120674762560140)
      
      Thanks Gregg!
      
      [Delete](https://www.blogger.com/comment/delete/5936111837781935054/937120674762560140)
      
      [Replies]()
      
      1. [Reply]()
      
      [Reply]()
3. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhh8oQHlfL1w_ZgnjjiYb3MFZOJoDGl0oarVE2q-C2FuECNG0IqrEmsbXMIVxIrrQhS3dWnUWN2BB40w14ryACyKa5OA2C_t4G4yWc85c0Zvs9V1MDEu--AXZNWprRkD90/s45-c/IMG_0765.JPG)
   
   [Francois Jouen (ldci)](https://www.blogger.com/profile/14330391597272626484)[April 5, 2015 at 6:54 PM](https://www.red-lang.org/2015/04/052-case-folding-and-hash-support.html?showComment=1428252879796#c1584952101212514198)
   
   Excellent les caractères accentués pour les words!
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/1584952101212514198)
   
   [Replies]()
   
   1. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhea2YYbfPYErJ2kMzpMFdFiDrDBPvhssWA1Qn02TAaWWxu8kEiK5bowqL6NuWMeh7zeXX_EPaDHk4u-PjPHeoJbyjbRSSmdlgN9tqBDEgvMcSriu8O_rgPXus5w61KGd4/s45-c/DSC05563-small2.jpg)
      
      [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055)[April 6, 2015 at 6:55 AM](https://www.red-lang.org/2015/04/052-case-folding-and-hash-support.html?showComment=1428296155447#c1597137526799773281)
      
      Ca fonctionne aussi avec d'autre langues que le Français. ;-) Dans la prochaine release, les utilisateurs pourront modifier/étendre la table de conversion pour couvrir des besoins particuliers.
      
      [Delete](https://www.blogger.com/comment/delete/5936111837781935054/1597137526799773281)
      
      [Replies]()
      
      1. [Reply]()
      
      [Reply]()
4. ![](//resources.blogblog.com/img/blank.gif)
   
   Anonymous[April 5, 2015 at 8:59 PM](https://www.red-lang.org/2015/04/052-case-folding-and-hash-support.html?showComment=1428260399962#c784620882997135775)
   
   Agreed with Gregg, especially Hash! type is a surprise. I don't get the working of it from the examples, the final example I expected the result to be 8.
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/784620882997135775)
   
   [Replies]()
   
   1. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhea2YYbfPYErJ2kMzpMFdFiDrDBPvhssWA1Qn02TAaWWxu8kEiK5bowqL6NuWMeh7zeXX_EPaDHk4u-PjPHeoJbyjbRSSmdlgN9tqBDEgvMcSriu8O_rgPXus5w61KGd4/s45-c/DSC05563-small2.jpg)
      
      [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055)[April 6, 2015 at 6:58 AM](https://www.red-lang.org/2015/04/052-case-folding-and-hash-support.html?showComment=1428296328174#c5802908967295985758)
      
      The /SKIP refinement treats the series as records of fixed size (= 2 in the example). You can get that info from the console:
      
      red&gt;&gt; help select
      
      [Delete](https://www.blogger.com/comment/delete/5936111837781935054/5802908967295985758)
      
      [Replies]()
      
      1. [Reply]()
      
      [Reply]()
5. ![](//www.blogger.com/img/blogger_logo_round_35.png)
   
   [PeterWAWood](https://www.blogger.com/profile/13788805010272508513)[April 6, 2015 at 5:42 AM](https://www.red-lang.org/2015/04/052-case-folding-and-hash-support.html?showComment=1428291728005#c2500964030207087635)
   
   @Anonymous: The /SKIP refinement is not an action like 'NEXT which would move along the series. It is information to the 'SELECT function to treat the data as being records with two "fields" in each record.
   
   In this case, 'SELECT will match only every second word against the supplied criteria. For example:
   
   red&gt;&gt; select/skip dict 456 2  
   \== none
   
   red&gt;&gt; select/skip dict 6 2  
   \== 2
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/2500964030207087635)
   
   [Replies]()
   
   1. [Reply]()
6. ![](//resources.blogblog.com/img/blank.gif)
   
   Anonymous[April 25, 2015 at 8:40 AM](https://www.red-lang.org/2015/04/052-case-folding-and-hash-support.html?showComment=1429944025859#c5344870224066216489)
   
   Naive question: how should one report issues if (s)he doesn't have a github account? Is it okay to post a comment in this site? Maybe you could add a comment section to the Contributions page for this purpose? Thank you.
   
   By the way, there are some broken links at the bottom of the Contributions page:  
   \- ImageMagick binding: the link should be https://github.com/red/red/blob/master/system/library/lib-iMagick.reds  
   \- OpenCV binding: should be https://github.com/ldci/OpenCV-red  
   \- DAQmxBase binding: should be https://github.com/ldci/NI/tree/master/Red
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/5344870224066216489)
   
   [Replies]()
   
   1. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhea2YYbfPYErJ2kMzpMFdFiDrDBPvhssWA1Qn02TAaWWxu8kEiK5bowqL6NuWMeh7zeXX_EPaDHk4u-PjPHeoJbyjbRSSmdlgN9tqBDEgvMcSriu8O_rgPXus5w61KGd4/s45-c/DSC05563-small2.jpg)
      
      [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055)[April 25, 2015 at 10:15 AM](https://www.red-lang.org/2015/04/052-case-folding-and-hash-support.html?showComment=1429949734912#c1029059213142439494)
      
      As Peter answered, there are other places, like the mailing-list, our Facebook page or Stackoverflow chat group. We don't encourage anonymous posts as they usually left a door open to spamming. Thanks for the newer links, the page has now been updated with them.
      
      [Delete](https://www.blogger.com/comment/delete/5936111837781935054/1029059213142439494)
      
      [Replies]()
      
      1. [Reply]()
      
      [Reply]()
7. ![](//www.blogger.com/img/blogger_logo_round_35.png)
   
   [PeterWAWood](https://www.blogger.com/profile/13788805010272508513)[April 25, 2015 at 9:59 AM](https://www.red-lang.org/2015/04/052-case-folding-and-hash-support.html?showComment=1429948792206#c7334877826491197138)
   
   Whilst it is best to report issues on github, you can also tell us about issues on the Red Language Google Group / Mailing List (https://groups.google.com/forum/#!forum/red-lang).
   
   Posting to the Google Group does require registration as otherwise we will be overrun with spam.
   
   There is also a Red Development Chat on Stackoverflow.com which not only requires registration but also a stack overflow "reputation" before you can post - there rules not ours.
   
   Thanks for letting us know about the broken links.
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/7334877826491197138)
   
   [Replies]()
   
   1. [Reply]()
8. ![](//resources.blogblog.com/img/blank.gif)
   
   Anonymous[June 11, 2016 at 9:51 PM](https://www.red-lang.org/2015/04/052-case-folding-and-hash-support.html?showComment=1465674691820#c7381240433561177599)
   
   I came across another Red language - did anybody know that the Red name was already taken ?  
   http://iment.com/maida/computer/redref/toc.htm#toca.
   
   wet\_wet\_wet
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/7381240433561177599)
   
   [Replies]()
   
   1. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhea2YYbfPYErJ2kMzpMFdFiDrDBPvhssWA1Qn02TAaWWxu8kEiK5bowqL6NuWMeh7zeXX_EPaDHk4u-PjPHeoJbyjbRSSmdlgN9tqBDEgvMcSriu8O_rgPXus5w61KGd4/s45-c/DSC05563-small2.jpg)
      
      [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055)[June 12, 2016 at 5:37 AM](https://www.red-lang.org/2015/04/052-case-folding-and-hash-support.html?showComment=1465702636153#c8716975300969490555)
      
      Do you really think I didn't do extensive research before picking up the "Red" name?
      
      From the RED \[1979] documents: "The RED language \[Nestor and Van Deusen 79, Brosgol 79] was designed as a candidate for the Department of Defense common hlgh-order Language, Ada, in Phase 2 of the language design competition.\[...] No Implementation of RED, beyond the original translator delivered with the language design, has been planned \[Davis and Levine 79]."
      
      Basically, it's just a specification from 1979 with no implementation.
      
      [Delete](https://www.blogger.com/comment/delete/5936111837781935054/8716975300969490555)
      
      [Replies]()
      
      1. [Reply]()
      
      [Reply]()

[Add comment]()

[Load more...]()

[]()

[](https://www.blogger.com/comment/frame/5936111837781935054?po=628451470321380947&hl=en&saa=85391&origin=https%3A%2F%2Fwww.red-lang.org)

[Newer Post](https://www.red-lang.org/2015/04/053-faster-compilation-and-extended.html "Newer Post") [Older Post](https://www.red-lang.org/2015/03/051-new-console-and-errors-support.html "Older Post") [Home](https://www.red-lang.org/)

Subscribe to: [Post Comments (Atom)](https://www.red-lang.org/feeds/628451470321380947/comments/default)

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

- [▼](javascript:void%280%29)  [2015](https://www.red-lang.org/2015/) (6)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2015/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2015/06/) (1)
  
  <!--THE END-->
  
  - [▼](javascript:void%280%29)  [April](https://www.red-lang.org/2015/04/) (2)
    
    - [0.5.3: Faster compilation and extended vector! sup...](https://www.red-lang.org/2015/04/053-faster-compilation-and-extended.html)
    - [0.5.2: Case folding and hash! support](https://www.red-lang.org/2015/04/052-case-folding-and-hash-support.html)
  
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
