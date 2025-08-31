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

## January 1, 2020

[]()

### Happy New Year!

Hello and happy new year, friends of Red! We have some exciting projects we’ve been working on that will be available this year, including a new product. Let’s talk a little about what the team has been working on behind the scenes.

(TL;DR: A cool **new product** with Red in 2020...plus, a robust preliminary draft of Parse documentation can now be previewed...**CLI library**...**fast-lexer to merge** soon...**GTK** on the horizon...and a new **native OS calendar** widget!)

[]()

**Documentation for Parse: Red’s Language Construction Tool**  
Our esteemed forerunner, Rebol, broke new ground with its Parse dialect, which Red has expanded on. Today, in Red, Parse has become an even more powerful built-in dialect (embedded domain-specific language) that processes input series with grammar rules in a clean and simple manner. Other language building tools exist, of course, such as Lexx and Yacc. ANTLR is a modern framework built in Java, and libraries exist for other languages, but the ease of use and power that Red’s Parse offers is unique.

This isn’t a new feature, by any means, with the first public introduction [here](https://www.red-lang.org/2013/11/041-introducing-parse.html). Parse is easy enough to use that those basic docs have been enough, for the most part. But over time, with new users joining the [Parse chat room](https://gitter.im/red/parse) to discuss the dialect, and it was time for full reference documentation.

For the uninitiated, Parse can be used to for searching, to surface various patterns; validation, in order to confirm an input’s compliance to a specification; extraction, to sift through data and aggregate values; and modification--that is, changing the input stream itself (insertion of values, removing or transforming matched input). And Parse’s true power lies in language processing (compilers, interpreters, and lexical analyzers), particularly for DSLs; and encoding/decoding, to “translate” data formats from one to another.

What makes Red’s Parse dialect a killer feature is that you can do more than parse at the character level in strings of text. That's what every other tool out there does, at best. But with Parse, you can process blocks of Red values, based on their datatype or specific literal matches, letting Red do all the work applying these layered or nested levels of analysis. By parsing blocks of values rather than character strings, we take language construction to the meta level.

We’re happy to announce that [@9214](https://github.com/9214) has completed a robust preliminary draft of Parse documentation, which you can see [here](https://github.com/red/docs/pull/204). Internal reviews by the core team are in process and public comment will be made possible after more analysis. In the meantime, you can view Parse itself [here](https://github.com/red/red/blob/master/runtime/parse.reds), and look at open issues there if you’re interested in contributing.

(As a final note, the first question people often ask is how Parse compares to regular expressions. Both are DSLs, to be sure, but regex is designed for flat pattern matching of text inputs. Formats with nesting, things like matching parentheses, etc. are difficult or impossible. Engines differ widely, as well (NFA vs DFA), so your code may have very different performance in different environments. Not all regex syntaxes are compatible either. But the real difference comes in readability. Parse is more verbose, but is very clear, readable, and composable. Regex patterns are not. For fun, look up the regex to match email addresses, written by Jeffrey Friedl, in his book Mastering Regular Expressions. It’s a 6.5Kib regex. Doesn’t seem to be online anymore, but is referenced in [this chat](https://stackoverflow.com/questions/201323/how-to-validate-an-email-address-using-a-regular-expression/). For more discussion on this specific area, [https://emailregex.com/](https://emailregex.com/) points to [https://www.regular-expressions.info/email.html](https://www.regular-expressions.info/email.html) about why there’s no perfect regex for email addresses. The point is not to criticize regular expressions. They are useful, especially in the more limited forms of wildcard matching and file globbing. But they can’t recognize all grammars, and quickly become impossible for a human to read and reason about.)

**Fast-Lexer To Be Merged Soon**  
Over the last few months work on the fast-lexer branch of Red has accelerated, beginning with [@dockimbel](https://github.com/dockimbel) prototyping the next lexer in R/S, faster than Red’s predecessors, with much smaller and simpler code, and more speed and features to come. Issues with the current lexer had brought the need for a revision: this included the goal of making the lexer instrumentable. The requirements of a callback function with the current non-re-entrant lexer could have caused serious problems.

Another hangup? An analysis of all Red's repos showed that the current lexer code was duplicated twice, beyond the basic lexing needed by load: once in the console code, once again in the VSCode plugin. The redundancy had to be eliminated. A merge of the updated lexer into master should be expected early in 2020.

**New Year, New Projects!**   
In 2020, Red’s commercial arm will release its first product! It will be helpful to CS programs and their students, researchers, and anyone interested in analyzing the grammar and syntax of languages—which is all of you, since you're here. But it is meant to have much broader appeal as well.

Every developer has probably see json.org, which brought railroad syntax diagrams to everyone’s attention. That’s right, syntax is for data formats too. But why would Douglas Crockford go to all the trouble of creating those diagrams? Communication. Visualizations create a different experience for readers, facilitating new understanding and discussion options. This applies to those designing rich data structures (think GraphQL) and APIs, as well as languages. If you want to look professional, foster adoption, show that your design is formally specified, and help people understand it, this tool is for you.

It does a lot more than create fantastic diagrams, too, to help spec and test your grammar. It’s in invite-only beta test now, but we’ll need a limited number of testers soon, so contact us at pr@red-lang.org if you’re interested.

Some of you may ask: Why is it a commercial product? Because we’re a multifaceted organization, and Open Source doesn’t pay. ;^) The Red Foundation supports the open source work done on the Red language, as well as sponsoring other work that promotes Red’s use and adoption. They’ve been mainly focused on supporting Team Red and core language work, but will expand their reach as resources allow. The first step in that direction was to get behind proving Red’s commercial viability. Redlake Technologies is a new business entity that will use Red to build tools the world needs, and will pay for, with the goal of creating a self-sustaining ecosystem of applications, services, and tokenomics that benefit both the contributors to the language and the world at large, working toward a better model of sustainable open source development.

**By Your Command (Line)**  
Also in the works: prolific community member [@hiiamboris](http://hiiamboris/) has been burning the midnight oil creating a fantastic CLI library, which will enable authors to accept and interpret arguments and define their types easily, in an expectable, standardized manner. Command lines are the API through which a program exposes its facilities to the outside world--to users and utilities. If you’d like to check it out, look at [the repo](https://gitlab.com/hiiamboris/red-cli/) and see how it works! By leveraging Red’s own function spec DSL we can, with this CLI library, turn any Red function into a command line utility with one or two words.

Suppose you have a \`grep\` function written in Red, that is to be used from the command line. Prefix it with \`process-into\` (the working CLI function name), add \`print\` for the output, compile it, and you have a standalone \`grep\` utility! Your feedback is important, because this design for a CLI library is quite unique.

As with Red itself, you may need to let go of old ideas about how CLI libraries like \`get-opt\` work (though you could recreate its model easily with what Boris has built), and think like a Reducer. Just write a function with parameters, refinements, types, and doc strings, and it does the rest.

**GTK on the Horizon**   
The GTK back end is nearing completion, with just GUI console support as the last big piece to be done. [@bitbegin](https://github.com/bitbegin) has done an enormous amount of work, with help, consultation, and testing from [@loziniak](https://github.com/loziniak) and @[rcqls](https://github.com/rcqls). Once the GUI console is in place, GTK should have feature parity with MacOS.

**Just In Time…**   
The New Year will see one more surprise, in the form of a [calendar widget](https://github.com/9214/red/tree/calendar) with support for Windows and Mac. It’ll just show up one day--a native OS widget joining you in the latest automatic build--so keep your eyes peeled.

Posted by [lucindamichele](https://www.blogger.com/profile/07911363385237731838 "author profile") at [8:23 AM](https://www.red-lang.org/2020/01/happy-new-year.html "permanent link") [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=2502592624740682729&from=pencil "Edit Post")

[]()

#### 14 comments:

1. ![](//www.blogger.com/img/blogger_logo_round_35.png)
   
   [aiguy](https://www.blogger.com/profile/15491417316027911062)[January 1, 2020 at 2:34 PM](https://www.red-lang.org/2020/01/happy-new-year.html?showComment=1577885662981#c3252054064632924871)
   
   Great Blog Post! Very excited about the coming year!
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/3252054064632924871)
   
   [Replies]()
   
   1. ![](//www.blogger.com/img/blogger_logo_round_35.png)
      
      [lucindamichele](https://www.blogger.com/profile/07911363385237731838)[January 5, 2020 at 6:35 PM](https://www.red-lang.org/2020/01/happy-new-year.html?showComment=1578245754417#c3895213934576604655)
      
      So am I! Thanks
      
      [Delete](https://www.blogger.com/comment/delete/5936111837781935054/3895213934576604655)
      
      [Replies]()
      
      1. [Reply]()
      
      [Reply]()
2. ![](//resources.blogblog.com/img/blank.gif)
   
   Anonymous[January 2, 2020 at 1:23 PM](https://www.red-lang.org/2020/01/happy-new-year.html?showComment=1577967809331#c482892421104148126)
   
   Great post! Thanks!
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/482892421104148126)
   
   [Replies]()
   
   1. ![](//www.blogger.com/img/blogger_logo_round_35.png)
      
      [lucindamichele](https://www.blogger.com/profile/07911363385237731838)[January 5, 2020 at 6:36 PM](https://www.red-lang.org/2020/01/happy-new-year.html?showComment=1578245806852#c6948225101519234050)
      
      Teamwork!
      
      [Delete](https://www.blogger.com/comment/delete/5936111837781935054/6948225101519234050)
      
      [Replies]()
      
      1. [Reply]()
      
      [Reply]()
3. ![](//www.blogger.com/img/blogger_logo_round_35.png)
   
   [Alex Baggett](https://www.blogger.com/profile/07378562104664742540)[January 2, 2020 at 7:48 PM](https://www.red-lang.org/2020/01/happy-new-year.html?showComment=1577990892615#c8576126547904676045)
   
   Great news. Keep up the awesome work!
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/8576126547904676045)
   
   [Replies]()
   
   1. ![](//www.blogger.com/img/blogger_logo_round_35.png)
      
      [lucindamichele](https://www.blogger.com/profile/07911363385237731838)[January 5, 2020 at 6:36 PM](https://www.red-lang.org/2020/01/happy-new-year.html?showComment=1578245793809#c1538151964101611843)
      
      Thanks Alex!
      
      [Delete](https://www.blogger.com/comment/delete/5936111837781935054/1538151964101611843)
      
      [Replies]()
      
      1. [Reply]()
      
      [Reply]()
4. ![](//resources.blogblog.com/img/blank.gif)
   
   Anonymous[January 4, 2020 at 5:36 PM](https://www.red-lang.org/2020/01/happy-new-year.html?showComment=1578155815118#c8330014191479474052)
   
   Fantastic! Happy New Year!
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/8330014191479474052)
   
   [Replies]()
   
   1. ![](//www.blogger.com/img/blogger_logo_round_35.png)
      
      [lucindamichele](https://www.blogger.com/profile/07911363385237731838)[January 5, 2020 at 6:36 PM](https://www.red-lang.org/2020/01/happy-new-year.html?showComment=1578245778054#c8768858010770471560)
      
      Happy New Year to you as well!
      
      [Delete](https://www.blogger.com/comment/delete/5936111837781935054/8768858010770471560)
      
      [Replies]()
      
      1. [Reply]()
      
      [Reply]()
5. ![](//resources.blogblog.com/img/blank.gif)
   
   Anonymous[January 6, 2020 at 2:31 AM](https://www.red-lang.org/2020/01/happy-new-year.html?showComment=1578274316297#c883660941207434927)
   
   Is the blockchain project still on going?
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/883660941207434927)
   
   [Replies]()
   
   1. ![](//www.blogger.com/img/blogger_logo_round_35.png)
      
      [Gregg Irwin](https://www.blogger.com/profile/02841117907023902973)[January 6, 2020 at 3:38 AM](https://www.red-lang.org/2020/01/happy-new-year.html?showComment=1578278300978#c3906749106331341702)
      
      Yes, well have more news on Red/C3 in the coming months.
      
      [Delete](https://www.blogger.com/comment/delete/5936111837781935054/3906749106331341702)
      
      [Replies]()
      
      1. [Reply]()
      
      [Reply]()
6. ![](//www.blogger.com/img/blogger_logo_round_35.png)
   
   [Bpiva](https://www.blogger.com/profile/01072673375066297647)[January 10, 2020 at 2:27 AM](https://www.red-lang.org/2020/01/happy-new-year.html?showComment=1578619669871#c5911246970320467404)
   
   Great job. Can't wait for Gtk. As a Linux user at home and at work waiting...
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/5911246970320467404)
   
   [Replies]()
   
   1. [Reply]()
7. ![](//www.blogger.com/img/blogger_logo_round_35.png)
   
   [Unknown](https://www.blogger.com/profile/05634956272518372386)[January 13, 2020 at 1:17 PM](https://www.red-lang.org/2020/01/happy-new-year.html?showComment=1578917820316#c4177846511008948767)
   
   How long will I wait for Red 1.0
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/4177846511008948767)
   
   [Replies]()
   
   1. ![](//www.blogger.com/img/blogger_logo_round_35.png)
      
      [Gregg Irwin](https://www.blogger.com/profile/02841117907023902973)[January 13, 2020 at 7:40 PM](https://www.red-lang.org/2020/01/happy-new-year.html?showComment=1578940810062#c5243862633149175222)
      
      We don't announce dates for Red version releases. The best thing to do is join the community and monitor progress as it occurs.
      
      [Delete](https://www.blogger.com/comment/delete/5936111837781935054/5243862633149175222)
      
      [Replies]()
      
      1. [Reply]()
      
      [Reply]()
8. ![](//resources.blogblog.com/img/blank.gif)
   
   Anonymous[January 16, 2020 at 7:24 AM](https://www.red-lang.org/2020/01/happy-new-year.html?showComment=1579155878829#c3238382874908589597)
   
   How is 64 bit cpu version? How is RED/C for blockchain smartcontract?
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/3238382874908589597)
   
   [Replies]()
   
   1. [Reply]()

[Add comment]()

[Load more...]()

[]()

[](https://www.blogger.com/comment/frame/5936111837781935054?po=2502592624740682729&hl=en&saa=85391&origin=https%3A%2F%2Fwww.red-lang.org)

[Newer Post](https://www.red-lang.org/2020/03/gtk-fast-lexer-money-deep-testing-and.html "Newer Post") [Older Post](https://www.red-lang.org/2019/12/november-2019-in-review.html "Older Post") [Home](https://www.red-lang.org/)

Subscribe to: [Post Comments (Atom)](https://www.red-lang.org/feeds/2502592624740682729/comments/default)

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

- [▼](javascript:void%280%29)  [2020](https://www.red-lang.org/2020/) (4)
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2020/08/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2020/03/) (1)
  
  <!--THE END-->
  
  - [▼](javascript:void%280%29)  [January](https://www.red-lang.org/2020/01/) (1)
    
    - [Happy New Year!](https://www.red-lang.org/2020/01/happy-new-year.html)

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
