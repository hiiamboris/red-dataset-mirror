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

## July 18, 2016

[]()

### Eve-style clock demo in Red, livecoded!

Like many others, we are fans of [Chris Granger](http://chris-granger.com/)'s work on Lighttable and more recently on [Eve](http://eve-lang.com/). The Eve project shares some similar goals with Red, though taking a different road by giving a new try at visual programming, while Red still tries to push further the limits of textual representation. A few days ago, the Eve team [tweeted](https://twitter.com/ibdknox/status/751169352632668160) a nice small clock demo using their framework. Here is our own version of that demo using Red and our native reactive GUI (Eve relies on a web engine):

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhBTVepHxzZ6V67hj9r1gBmDbaEZlI4eNeaKmN_zRhz2SWHxHchlxprCanC7-XP64VlS-TTdNiCLZQ02d_l_kwm39FvBE4GES2530uuvmhMlbDQFO-vrTqvLGCVar-OP0V475P0SheOnSFG/s1600/blue-clock2.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhBTVepHxzZ6V67hj9r1gBmDbaEZlI4eNeaKmN_zRhz2SWHxHchlxprCanC7-XP64VlS-TTdNiCLZQ02d_l_kwm39FvBE4GES2530uuvmhMlbDQFO-vrTqvLGCVar-OP0V475P0SheOnSFG/s1600/blue-clock2.gif)

The Eve demo has a "compile and run" button, which we thought was not necessary in our case, as we can easily build a *livecoding* editor in few lines. ;-)

Here is the full source of our [demo](https://github.com/red/code/blob/master/Showcase/eve-clock.red). Use our latest Windows [build](http://static.red-lang.org/dl/auto/win/red-latest.exe) to run it from the GUI console:

```
    clock-demo: {
    base 200x200 transparent rate 1 now draw [
        scale 2 2
        fill-pen #0B79CE pen off
        circle 50x50 45
        line-width 2
        hour: rotate 0 50x50 [pen #023963 line 50x50 50x20]
        min:  rotate 0 50x50 [pen #023963 line 50x50 50x10]
        sec:  rotate 0 50x50 [pen #CE0B46 line 50x50 50x10]
    ] on-time [
        time: now/time
        hour/2: 30 * time/hour
        min/2:  6  * time/minute
        sec/2:  6  * time/second
    ]
    }

    system/view/silent?: yes

    view [
        title "Eve clock demo"
        backdrop #2C3339
        across

        source: area #13181E 410x300 no-border clock-demo font [
            name: "Consolas"
            size: 9
            color: hex-to-rgb #9EBACB
        ]

        panel 200x300 #2C3339 react [
            attempt/safer [face/pane: layout/tight/only load source/text]
        ]
    ]
```

As you can see the clock demo code is held in a string, which will be used to feed an area widget that we use as a code editor. Each change in the area triggers a reaction which will try to interpret the code as VID dialect using thelayout function and feed the panel's content with it. We could have used a simple on-change handler here, but react is so simple and versatile, that we can forget about events in many cases.

Yes, livecoding (using native widgets!) in Red can be *that* simple. As you can see, there's no built-in "livecode" widget or feature, it's an emergent behavior resulting from the combination of existing Red features, [homoiconicity](https://en.wikipedia.org/wiki/Homoiconicity) being the most fundamental.

As a sidenote, the code above could be improved to avoid some light flickering.

If you want to see more Red feats and get more info about Red, check out:

- our [native spreadsheet in 17 LOC](http://www.red-lang.org/2016/07/native-reactive-spreadsheet-in-17-loc.html)
- our [reactive framework](http://www.red-lang.org/2016/06/061-reactive-programming.html) (not limited to GUI domain)
- our very flexible [native GUI system](http://www.red-lang.org/2016/03/060-red-gui-system.html)
- our built-in powerful [PEG parser DSL](http://www.red-lang.org/2013/11/041-introducing-parse.html)
- our built-in [system programming DSL](http://static.red-lang.org/red-system-specs-light.html)

Red is only at Alpha 0.6.1, and there is significant work still to do. Though, you can already imagine the sheer power that will be into your hands by the time Red reaches 1.0. ;-)

Cheers!

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [2:59 PM](https://www.red-lang.org/2016/07/eve-style-clock-demo-in-red-livecoded.html "permanent link") [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=8305993111013830439&from=pencil "Edit Post")

Labels: [demos](https://www.red-lang.org/search/label/demos), [GUI](https://www.red-lang.org/search/label/GUI), [livecoding](https://www.red-lang.org/search/label/livecoding), [reactive](https://www.red-lang.org/search/label/reactive)

[]()

#### 19 comments:

01. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [Gregg Irwin](https://www.blogger.com/profile/02841117907023902973)[July 18, 2016 at 5:27 PM](https://www.red-lang.org/2016/07/eve-style-clock-demo-in-red-livecoded.html?showComment=1468855640671#c3849820221884946975)
    
    Very cool!
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/3849820221884946975)
    
    [Replies]()
    
    1. [Reply]()
02. ![](//resources.blogblog.com/img/blank.gif)
    
    Anonymous[July 18, 2016 at 5:41 PM](https://www.red-lang.org/2016/07/eve-style-clock-demo-in-red-livecoded.html?showComment=1468856492726#c6882768702672038935)
    
    Copy pasting the code into a Red 0.6.1 gui console on windows 10 results in the following error:
    
    \*\** Script Error: VID - invalid syntax at: \[#2C3339 across source:]  
    \*\** Where: do
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/6882768702672038935)
    
    [Replies]()
    
    1. ![](//www.blogger.com/img/blogger_logo_round_35.png)
       
       [PeterWAWood](https://www.blogger.com/profile/13788805010272508513)[July 19, 2016 at 1:09 AM](https://www.red-lang.org/2016/07/eve-style-clock-demo-in-red-livecoded.html?showComment=1468883340067#c5607609015054063280)
       
       You need to download the latest Windows build from http://static.red-lang.org/dl/auto/win/red-latest.exe and run it from the GUI console.
       
       [Delete](https://www.blogger.com/comment/delete/5936111837781935054/5607609015054063280)
       
       [Replies]()
       
       1. [Reply]()
       
       [Reply]()
03. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [Gregg Irwin](https://www.blogger.com/profile/02841117907023902973)[July 18, 2016 at 6:16 PM](https://www.red-lang.org/2016/07/eve-style-clock-demo-in-red-livecoded.html?showComment=1468858586961#c5724223796412467738)
    
    It's exciting to think about the possibilities. Someday we'll have a great Red IDE/toolset, that is customizable and supports plug-ins. Until then, though, we can build little tools like this, so easily, for specific purposes. It isn't limited to building GUIs interactively. They can be automated test runners, interactive parse rule development with sample data it runs against, or anything else.  
    And I love how easily you can set references to locations in the draw block for later modification.  
    What Chris Granger, Jonathan Edwards (http://www.subtext-lang.org/), and others are doing is great, and I bet all the "new kids" will learn from each other as well.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/5724223796412467738)
    
    [Replies]()
    
    1. [Reply]()
04. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [Edoc](https://www.blogger.com/profile/17149439864339580053)[July 18, 2016 at 6:31 PM](https://www.red-lang.org/2016/07/eve-style-clock-demo-in-red-livecoded.html?showComment=1468859484197#c4697441269366464388)
    
    Ridiculously awesome!
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/4697441269366464388)
    
    [Replies]()
    
    1. [Reply]()
05. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [-pekr-](https://www.blogger.com/profile/07020449092496153923)[July 18, 2016 at 6:49 PM](https://www.red-lang.org/2016/07/eve-style-clock-demo-in-red-livecoded.html?showComment=1468860555872#c8710317925302102416)
    
    That's simply - excellent!
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/8710317925302102416)
    
    [Replies]()
    
    1. [Reply]()
06. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [Jo](https://www.blogger.com/profile/03111412594360576394)[July 19, 2016 at 4:41 PM](https://www.red-lang.org/2016/07/eve-style-clock-demo-in-red-livecoded.html?showComment=1468939301829#c1037034707091955945)
    
    Excellent !
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/1037034707091955945)
    
    [Replies]()
    
    1. [Reply]()
07. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [Unknown](https://www.blogger.com/profile/08008567136339269871)[July 19, 2016 at 9:12 PM](https://www.red-lang.org/2016/07/eve-style-clock-demo-in-red-livecoded.html?showComment=1468955537841#c4299145396912889190)
    
    Are you kidding me? That's amazing Doc.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/4299145396912889190)
    
    [Replies]()
    
    1. [Reply]()
08. ![](//resources.blogblog.com/img/blank.gif)
    
    Anonymous[July 19, 2016 at 9:46 PM](https://www.red-lang.org/2016/07/eve-style-clock-demo-in-red-livecoded.html?showComment=1468957583635#c9091719536548389085)
    
    Totally Awesome!!! Red is the language that made recursion make sense to me, I find myself making recursive solutions without even thinking about it. It takes the complexity out of algorithms and makes coding a truly enjoyable creative outlet. Combined with the goal to be capable from the metal to the meta, the age old question "What's the best language to learn?" will finally be answered... Red!!!
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/9091719536548389085)
    
    [Replies]()
    
    1. [Reply]()
09. ![](//resources.blogblog.com/img/blank.gif)
    
    Anonymous[July 19, 2016 at 9:51 PM](https://www.red-lang.org/2016/07/eve-style-clock-demo-in-red-livecoded.html?showComment=1468957863535#c487303532538681188)
    
    One question: I know that Red is meant to be about 90% compatible with Rebol, but does this hold for the VID dialect as well? In other words, if I learn and practice VID in Rebol2, will I be able to easily reuse what I learned once Red GUI support come to my OS?
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/487303532538681188)
    
    [Replies]()
    
    1. ![](//www.blogger.com/img/blogger_logo_round_35.png)
       
       [-pekr-](https://www.blogger.com/profile/07020449092496153923)[July 20, 2016 at 4:30 PM](https://www.red-lang.org/2016/07/eve-style-clock-demo-in-red-livecoded.html?showComment=1469025050139#c6414501410773496395)
       
       Some things will work, some will not. In R2, it was easy to do a simple stuff. Once you accessed the styles directly, you could mess up the GUI. Red uses accessors and in general, it is going to differ. I suggest you to start with Red directly, as it will improve its GUI with each new release ...
       
       [Delete](https://www.blogger.com/comment/delete/5936111837781935054/6414501410773496395)
       
       [Replies]()
       
       1. [Reply]()
       
       ![](//www.blogger.com/img/blogger_logo_round_35.png)
       
       [Gregg Irwin](https://www.blogger.com/profile/02841117907023902973)[July 20, 2016 at 6:51 PM](https://www.red-lang.org/2016/07/eve-style-clock-demo-in-red-livecoded.html?showComment=1469033499261#c1503164752793790029)
       
       You will be able to use a lot of what you learn, but not all. e.g. R2 has no reactivity, and event actors are more extensive in Red. Default action handlers are very close. In Red you'll use \`panel\` styles rather than the \`guide\` keyword in R2 VID, and you don't have things like \`edge\` facets or the effect pipeline in Red yet. If you stick to the basics, to get a feel for VID, that's a good place to start, but details (e.g. how face facets work) are different once you get beyond simple things like /text or /data for a face.
       
       [Delete](https://www.blogger.com/comment/delete/5936111837781935054/1503164752793790029)
       
       [Replies]()
       
       1. [Reply]()
       
       [Reply]()
10. ![](//resources.blogblog.com/img/blank.gif)
    
    Anonymous[July 21, 2016 at 5:13 PM](https://www.red-lang.org/2016/07/eve-style-clock-demo-in-red-livecoded.html?showComment=1469114028458#c8239226620060009362)
    
    Great. Works on Wine+Linux too. Had to remove the "transparent" word for the clock to appear.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/8239226620060009362)
    
    [Replies]()
    
    1. [Reply]()
11. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [mydoghasworms](https://www.blogger.com/profile/02355652082090843731)[July 25, 2016 at 1:26 PM](https://www.red-lang.org/2016/07/eve-style-clock-demo-in-red-livecoded.html?showComment=1469445971279#c5818852869240416374)
    
    I love seeing updates on this blog. Please post more posts more often about your adventures in Red and the things you come up with!
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/5818852869240416374)
    
    [Replies]()
    
    1. [Reply]()
12. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [TRAyres](https://www.blogger.com/profile/06362119850709238952)[July 29, 2016 at 4:16 PM](https://www.red-lang.org/2016/07/eve-style-clock-demo-in-red-livecoded.html?showComment=1469801795727#c4473693094342644430)
    
    "We could have used a simple on-change handler here, but react is so simple and versatile, that we can forget about events in many cases."
    
    What are the cases when we can't forget about events?
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/4473693094342644430)
    
    [Replies]()
    
    1. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhea2YYbfPYErJ2kMzpMFdFiDrDBPvhssWA1Qn02TAaWWxu8kEiK5bowqL6NuWMeh7zeXX_EPaDHk4u-PjPHeoJbyjbRSSmdlgN9tqBDEgvMcSriu8O_rgPXus5w61KGd4/s45-c/DSC05563-small2.jpg)
       
       [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055)[July 30, 2016 at 8:04 AM](https://www.red-lang.org/2016/07/eve-style-clock-demo-in-red-livecoded.html?showComment=1469858641398#c6260581643634875194)
       
       A reaction can be triggered by different kind of sources, user events or direct changes made by the program itself. Sometimes, you want to attach an handler to only one specific source event, in which case, the event handler way is the simplest option.
       
       [Delete](https://www.blogger.com/comment/delete/5936111837781935054/6260581643634875194)
       
       [Replies]()
       
       1. [Reply]()
       
       [Reply]()
13. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [PeterWAWood](https://www.blogger.com/profile/13788805010272508513)[August 16, 2016 at 12:09 PM](https://www.red-lang.org/2016/07/eve-style-clock-demo-in-red-livecoded.html?showComment=1471342161741#c2295160392121904179)
    
    We received a question in a comment that was written in Mandarin. As this is an English blog, we feel that we can only publish comments in English.
    
    The Red Team is multinational. Nenad comes from Paris, France and is now based in Xiamen, China.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/2295160392121904179)
    
    [Replies]()
    
    1. [Reply]()
14. ![](//resources.blogblog.com/img/blank.gif)
    
    Anonymous[August 29, 2016 at 11:06 AM](https://www.red-lang.org/2016/07/eve-style-clock-demo-in-red-livecoded.html?showComment=1472461592221#c172297025566282380)
    
    Red \[ needs: 'view]  
    view [  
    below  
    button "NEW" [  
    either (face/text = "NEW" )  
    \[ f1/text: "" f2/text: "" f3/text: "" face/text: "Save" ]  
    \[ print rejoin \[ f1/text f2/text f3/text ] face/text: "NEW"]  
    ]  
    f1: field "f1"  
    f2: field "f2"  
    f3: field "f3"  
    ]  
    When the second time I press the "NEW" button，why didn't the fields empty.  
    I'm not good at English,sorry.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/172297025566282380)
    
    [Replies]()
    
    1. [Reply]()
15. ![](//www.blogger.com/img/blogger_logo_round_35.png)
    
    [PeterWAWood](https://www.blogger.com/profile/13788805010272508513)[August 29, 2016 at 12:01 PM](https://www.red-lang.org/2016/07/eve-style-clock-demo-in-red-livecoded.html?showComment=1472464910421#c8561035562156425147)
    
    It's not really practical to help you through blog comments. If you ask your question in the Red Google Group (https://groups.google.com/forum/#!forum/red-lang) or the Red Gitter chat (https://gitter.im/red/red) somebody may be able to help you.
    
    [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/8561035562156425147)
    
    [Replies]()
    
    1. [Reply]()

[Add comment]()

[Load more...]()

[]()

[](https://www.blogger.com/comment/frame/5936111837781935054?po=8305993111013830439&hl=en&saa=85391&origin=https%3A%2F%2Fwww.red-lang.org)

[Newer Post](https://www.red-lang.org/2016/12/entering-world-of-macros.html "Newer Post") [Older Post](https://www.red-lang.org/2016/07/native-reactive-spreadsheet-in-17-loc.html "Older Post") [Home](https://www.red-lang.org/)

Subscribe to: [Post Comments (Atom)](https://www.red-lang.org/feeds/8305993111013830439/comments/default)

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

- [▼](javascript:void%280%29)  [2016](https://www.red-lang.org/2016/) (6)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2016/12/) (2)
  
  <!--THE END-->
  
  - [▼](javascript:void%280%29)  [July](https://www.red-lang.org/2016/07/) (2)
    
    - [Eve-style clock demo in Red, livecoded!](https://www.red-lang.org/2016/07/eve-style-clock-demo-in-red-livecoded.html)
    - [Native reactive spreadsheet in 17 LOC](https://www.red-lang.org/2016/07/native-reactive-spreadsheet-in-17-loc.html)
  
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
