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

## August 4, 2021

[]()

### Long Time No Blog

 It's been almost a year since our last blog post. Sorry about that. It's one of those things that falls off our radar without a person dedicated to it, and we run lean so don't have anyone filling that role right now. We know it's important, even if we have many other channels where people can get information. So here we are.

Last year was a tough year all around, even for us. We were already a remote-only team, but the effect the pandemic had on the world, particularly travel, hit us too. We had some team changes, and also split our focus into product development alongside core Red Language development. This is necessary for sustainability, because people don't pay for programming languages, and they don't pay for Open Source software. There's no need to comment on the exceptions to these cases, because they are exceptions. The commercial goal, starting out, is to focus on our core strengths and knowledge, building developer-centric tools. Our first product, [DiaGrammar for Windows](https://www.redlake-tech.com/products/diagrammar-for-windows/), was released in December 2020, and we've issued a number of updates to it since then. Our thanks to Toomasv for his ingenuity and dedication in creating DiaGrammar. We are a team, but he really accepted ownership of the project and took it from an idea to a great product. Truly, there is nothing else like it on the market. 

We learned a lot from the process of creating a product, and will apply that experience moving forward. An important lesson is that the product itself is only half the work. As technologists, we're used to writing the code and *maybe* writing some docs to go with it. We don't think about outreach, marketing, payments, support, upgrade processes for users, web site issues, announcements, and more. The first time you do something is the hardest, and we're excited to improve and learn more as we update DiaGrammar and work on our next product. We'll probably announce what it will be in Q4. One thing we can say right now is that the work on DiaGrammar led to a huge amount of work on a more general diagramming subsystem for Red. It's really exciting, and we'll talk more about that in a future blog post.

## So what *have* we been doing?

Since our last blog post we've logged over 400 fixes and 100 features into Red itself. Some of these are small, but important, others are headline-worthy; some are deep voodoo and some visible to every Reducer (what we call Red users). For example, most people use the console (the REPL), so the fixes and improvements there are easy to see. A prime feature being that the GUI console, but not the CLI console, didn't show output if the UI couldn't process events. This could happen if you printed output in a tight loop. The results would only show up at the termination of the loop, when the system could breathe again. That's been addressed, but wasn't easy and still isn't perfect. Red is still single threaded, so there's no separate UI thread (pros and cons there). We make these tradeoffs every day, and need feedback from users and real world scenarios to help find the right balance. Less obvious are things like improvements to **parse**, which not everyone uses. Or how **fmod** works across platforms, and edge cases for lexical forms (e.g. is **-1.#NaN** valid?). The latter is particularly important, because Red is a data language first.

JSON is widely used, but people may not notice that the JSON decoder is 20x faster now, unless they're dealing with extremely large JSON datasets. JSON is *so* widely used that we felt the time spent, and the tradeoffs made, were worth it. It also nicely shows one of Red's strengths. Profiling showed that the codec spent a lot of time in its **unescape** function. @hiiamboris rewrote that as a Red/System routine, tweaked it, and got a massive speedup. No external compiler needed, no need to use C, and the code is inlined so it's all in context. Should your JSON be malformed, you'll also get nicer error information now. As always, Red gives you options. Use high level Red as much as possible, for the most concise and flexible code, but drop into Red/System when it makes sense.

Some features cross the boundary of what's visible. A huge amount of work went into D2D support on Windows. D2D is Direct2D, the hardware-accelerated backend for vector graphics on Windows. For users, nothing should change as all the details are hidden. But the rendering behavior is not exactly the same. We try to work around that, but sometimes users have to make adjustments as well; we know because DiaGrammar is written in Red and uses the **draw** dialect heavily. It's an important step forward, but comes at a cost. GDI+ is now a legacy graphics back end, and won't see regular updates. Time marches on and we need to look forward. As if @qtxie wasn't busy enough with that, he and @dockimbel also pushed Full I/O forward in a big way. It hasn't been merged into the main branch yet, but we expect that to happen soon. @rebolek has been banging on it, and has a full working HTTP protocol ready to go, which is great. TLS/SSL support gets an A+ rating, which is also a testament to the design and implementation. It's important to note that the new I/O system is a low level interface. The higher level API is still being designed. At the highest level, these details will all be hidden from users. You'll continue to use **read, write, save, load** exactly as you do today, unless you need async I/O. 

Another big "feature" came from @vazub: NetBSD support. The core team has to focus on what stands to help the project overall, with regard to users and visibility. Community support for lesser known platforms is key. If you're on one of those platforms, be (or find) a champion. We'll help all we can, but that's what Open Source is for. Thanks for this contribution @vazub!

We also have some new Python primers up, thanks to @GalenIvanov. Start at [Coming-to-Red-from-Python](https://github.com/red/red/wiki/Coming-to-Red-from-Python). Information like this is enormously important. Red is quite different from other languages, and learning any new language can be hard. We're used to a set of functionality and behaviors, which sometimes makes the syntax the easiest part to learn. Just knowing what things are called is a learning curve. Red doesn't use the same names, because we (and Carl when he designed Rebol) took a more holistic view. That's a hard sell though. We feel the pain. A user who found Red posted a video as they tried to do some basic things. We learned a lot from watching it. Where other languages required you to import a networking library, it's already built into Red. When they were looking for **request** or **http.get**, and expecting strings to be used for URLs, they couldn't find answers. In Red you just **read http://...**. It's obvious to us, but not to the rest of the world. So these new primers are very exciting. We have reference docs, and [Red by Example](https://www.red-by-example.org/), but still haven't written a User's Guide for Red. We'll get there though. 

## Why do things take so long?

Even with that many fixes and features logged, and huge amounts of R&amp;D, it can still feel like progress is slow. The world moves fast, and software projects are often judged by their velocity. We even judge ourselves that way, and have to be reminded to stay the course, our course, rather than imitating others. Red's flexibility also comes into play. Where other languages may limit how you can express solutions, we don't. It's so flexible that people can do crazy things or perform advanced tricks which end up being logged as bugs and wishes. Sometimes we say No (a lot of times in fact), but we also try to keep an open mind. We have to ask "*Should* that be allowed?", "*Why* would you want to do that (even though I never have)?", and "What are the long term *consequences*?" We have to acknowledge that Red is a data format first, and we never want to break that. It has to evolve, but not breaking the format is fundamental. And while code is expected to change, once people depend on a function or library it causes them pain if we break compatibility. We don't want to do that, though sometimes we will for the greater good and the long view. There are technical bandages we can patch over things, but it's a big issue that doesn't have a single solution. Not just for us, but for all software development. We'll talk more about this in the future as well.

I'll note some internal projects related to our "slow and steady" process:

- [Composite](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/composite.md) is a simple function that does for strings what **compose** does for blocks. It's a basic interpolator. But the design has taken many turns. Not just in the possible notations, but whether it should be a mezzanine function, a macro, or both. Each has pros and cons (Side note: we don't often think about "cons" being an abbreviation for "consequences"). This simple design and discussion is stalled again, because another option would be a new literal form for interpolated strings. That's what other languages do, but is it a good fit for Red? We belabor the point of how tight lexical space is already, so have to weigh that against the value of a concise notation.
- Non-native GUI. Red's native GUI system was chosen in response to Rebol's choice to go non-native. Unfortunately it's another case of needing both. Being cross platform is great for Red users, but Hell for us. Throw in mobile and it's even worse. Don't even talk about running in the browser. But *every* platform has native widget limitations. Once you move beyond static text, editable fields, buttons, and simple lists, you're in the realm of "never the twain shall meet". How do you define and interact with grids and tables or collapsible trees? Red already has its own [rich-text](https://github.com/red/docs/blob/master/en/rtd.adoc) widget, so you don't have to embed (even if you could) an entire web browser and then write in HTML and CSS. To address all this, with much research and extensive use case outlines, @hiiamboris has spent a lot of time and effort on [Red Spaces](https://gitlab.com/hiiamboris/red-spaces). Show me native widgets that can do editable spiral text, put any layout inside a rotator, or define recursive UIs. I didn't think so. Oh, and the wiggling you see in the GIFs there are not mistakes or artifacts, they are tests to show that any piece of the UI can be animated.
- Other projects include [format](https://github.com/greggirwin/red-formatting/blob/master/formatting-functions.adoc), **split**, HOFs, and modules, each with a great deal of design work and thought put into them. As an example, look at Boris' [HOF analysis](https://github.com/greggirwin/red-hof/tree/master/code-analysis). They are large and important pieces, based on historical and contemporary research, but not something we will just drop into Red, though we could. A simple **map** function is a no-brainer, and could have been there day one. But that's not how we work. It's not a contest to see how many features we can add, or how fast; but how we can move software forward, make things easier, and push the state of the art. Not just in technical features (the engineering part), but in the design of a language and its ecosystem.

## Not Everyone Has These Problems

An important aspect of Red is being self-contained. We talk about this a lot. Yes, we're considering LLVM as a target, but that has a big cost, not just benefits. Using our own compiler for everything also has costs, like slowing the move to 64-bit which is an issue for Mac users now. Workarounds like VMs and Docker containers are just that. We want things to be easy for you, but that doesn't mean they're easy for us. Here's an example.

Boris found a [bug related to printing time values](https://github.com/red/red/issues/4875) in Red/System. @dockimbel finally tracked it down, and posted this investigative report:

[](https://github.com/hiiamboris)

> [@hiiamboris](https://github.com/hiiamboris) It was a (R/S) compiler issue afterall. ;-)`size? a` was the guilty part. The compiler was wrongly generating code for loading `a` even though `size?` is statically evaluated by the compiler and replaced by a static integer value. Given that `a` was a float type, its value was pushed onto the x87 FPU stack, but never popped. That stack has a 7 slots limit. Running the loop 5 times was enough to leave only 2 slots free. When the [big float expression](https://github.com/red/red/blob/master/runtime/dtoa.reds#L874) is encountered in `dtoa` library, it requires 3 free slots on the FPU stack, which fails and results in producing a NaN value, which wreaks havoc in the rest of the code.

The fix in the compiler was trivial (**fetch-expression/final** vs **fetch-expression**) but getting to that point was not. Understanding machine architectures at the lowest levels isn't for everyone, but even though our compiler code will be rewritten in the future, it's small and maintainable today. If we rely on GCC, Clang, or other compilers, hitting a bug may mean hitting a wall. So while there are costs to using our own compiler, there are also costs to depending on others. Robert Heinlein popularized  [TANSTAAFL](https://en.wikipedia.org/wiki/There_ain%27t_no_such_thing_as_a_free_lunch), but the concept is not science fiction. As a side note, just as we moved from GDI+ to D2D,  x87 for float support was an early choice meant to support older platforms and we are planning to switch to SSE.

If compilers are your thing, or you like system level programming, join our community and get to know Red/System. See how our toolchain works, and consider joining us.

## The Big Picture

I just read 101 things I learned in architecture school (which I heard about via [Kevlin Henney](https://www.youtube.com/watch?v=AbgsfeGvg3E), (though it may not have been that specific talk) and what struck me the most about it is how we've commandeered the word "architecture" for software but *completely removed* the human aspect. An architect does so much more than we do. Software architects are really structural engineers. If a single developer builds a complete app, they *have to* do the UI. They engineer a building and then slap on whatever sheathing is at hand, cutting doors and windows without concern for their location. And the app is viewed in isolation, as if it's the only thing a user has on their system, without consideration for its site, context, or relationships. What makes real architecture hard (and why the author notes that many architects hit their stride when they are older), is that you have to know so much. So many considerations, disciplines, and constraints are involved, and you have to unify them. It's both creative and scientific. What makes great architecture great is that it makes your experience better. Maybe even wonderful. If we only think about the mechanical aspects, our software will never be *beautiful*.

We haven't articulated this view for what we do, I think because we didn't realize it. At least I didn't. We talk about the whole being greater than the sum of its parts, and not just making everything libraries so it feels more natural and *less* mechanical. How a REPL and single exe make it easier to get started, and not having to use many tools is better. But we haven't explicitly said "Here's how it's laid out, and why. Here's how it's put together; these are the critical elements. Here's what it looks like from a distance, and when you enter its space." Implicitly we do that every day, through the work, but we don't *talk* about it. Or only once a year.

Posted by Gregg Irwin at [2:21 AM](https://www.red-lang.org/2021/08/long-time-no-blog.html "permanent link") [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=7342250242049122082&from=pencil "Edit Post")

[]()

#### 9 comments:

1. ![](//resources.blogblog.com/img/blank.gif)
   
   Timeslip[August 4, 2021 at 6:28 PM](https://www.red-lang.org/2021/08/long-time-no-blog.html?showComment=1628094499628#c7642535586110556963)
   
   Thanks Gregg. As usual, a thoughtful piece from a well-read guy. Keep up the good work. As you know, as much as I want the new stuff, I have my hands full with the existing features. :-)
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/7642535586110556963)
   
   [Replies]()
   
   1. [Reply]()
2. ![](//www.blogger.com/img/blogger_logo_round_35.png)
   
   [Scott Gray](https://www.blogger.com/profile/03834249700780155006)[August 4, 2021 at 6:49 PM](https://www.red-lang.org/2021/08/long-time-no-blog.html?showComment=1628095743442#c8926112307544605191)
   
   Thank you for this extensive interesting missive, with all its mouth-watering prospects. It prompts me to ask how, as a non-expert, may I help?
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/8926112307544605191)
   
   [Replies]()
   
   1. ![](//www.blogger.com/img/blogger_logo_round_35.png)
      
      [Gregg Irwin](https://www.blogger.com/profile/02841117907023902973)[August 4, 2021 at 8:21 PM](https://www.red-lang.org/2021/08/long-time-no-blog.html?showComment=1628101301542#c5194061217572734546)
      
      Great question!  
      1\) Use Red. Create things with it. Have fun.  
      2\) Talk to others about it. Not in a pushy way, but because it is a great topic of conversation for how software works, and what will make it better.  
      3\) Join us on https://gitter.im/red/red and let us know what you like. More importantly, what hurdles you face, information that's missing, bugs you find, etc.  
      4\) Get involved on the coding side. We do have a high bar for team members, and being part of the community is the first step. But we \*are* a community, and everybody adds value. Get to know us, help us get to know you, and together we can figure out where our needs and your skills and what you want to do overlap. Yes, code is a big aspect. But so are docs, examples, answering questions in the community, monitoring other channels like HN and reddit so we know when Red is mentioned, championing a cause, or identifying a need Red can help fill. Now that we have DiaGrammar out, we need more people to use it (it's free for anyone who wants to try it!), and show the value of syntax diagrams.
      
      [Delete](https://www.blogger.com/comment/delete/5936111837781935054/5194061217572734546)
      
      [Replies]()
      
      1. [Reply]()
      
      [Reply]()
3. ![](//resources.blogblog.com/img/blank.gif)
   
   GregP[August 10, 2021 at 10:50 PM](https://www.red-lang.org/2021/08/long-time-no-blog.html?showComment=1628628607688#c5989953496524804993)
   
   First of all, congratulation for Red, the amount of work here is just amazing.  
   Agreed that a business model based on a free and open source language looks unprofitable, however what about some services around it? I'd like to pay to get a Red app built on windows get packaged for this platform but also to some others like Android or Mac. What about Windows certificate thru an SDK or something like that?  
   Good to see blog updates.
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/5989953496524804993)
   
   [Replies]()
   
   1. ![](//www.blogger.com/img/blogger_logo_round_35.png)
      
      [Gregg Irwin](https://www.blogger.com/profile/02841117907023902973)[August 10, 2021 at 11:51 PM](https://www.red-lang.org/2021/08/long-time-no-blog.html?showComment=1628632292444#c4173014008213677652)
      
      Yes, these ideas are already on our list. Red/Pro is a possible optimizing back end (challenging if done as a service, because people have to share their code with us). That may also cover the cert feature, which means we also have to review apps like the app stores do, to keep the bad guys out.
      
      So our first step is client-side tools, which will tie to services in the future (e.g. collaboration and hosting features for DiaGrammar), and much more deeply with our next product. Training and tools around that, tied to RED token use as well as fiat payments, offer value to Red users, let people build audited skill reputation, and connect clients to Reducers with the skills they need. Also possible are blockchain backed package systems, which is part of the original set of RED use cases.
      
      [Delete](https://www.blogger.com/comment/delete/5936111837781935054/4173014008213677652)
      
      [Replies]()
      
      1. [Reply]()
      
      [Reply]()
4. ![](//www.blogger.com/img/blogger_logo_round_35.png)
   
   [OlivierLP](https://www.blogger.com/profile/09558127048978862945)[December 29, 2021 at 1:25 PM](https://www.red-lang.org/2021/08/long-time-no-blog.html?showComment=1640780758247#c965977267355782194)
   
   Hi,  
   good to know it's still going on  
   waiting so much for full I/O, ports and /as refinement for write and read (will there be a function given the encoding for a specified file?)  
   hope to get them in officila release (automated release is blocked by my company antivirus, the official 0.6.4 is working)  
   nice study on HOF, will for loop be implemented?  
   apply and function reflectivity will be implemented? apply in rebol can be useful in some cases even if it's probbaly less efficient, but handling refinements without apply can be so painful
   
   regards
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/965977267355782194)
   
   [Replies]()
   
   1. [Reply]()
5. ![](//www.blogger.com/img/blogger_logo_round_35.png)
   
   [OlivierLP](https://www.blogger.com/profile/09558127048978862945)[December 29, 2021 at 6:14 PM](https://www.red-lang.org/2021/08/long-time-no-blog.html?showComment=1640798086278#c5176632825738312084)
   
   Hi, great news that this project is carrying on  
   hope ful I/O, and maybe port will be merged on the main branch to get a new release (is th /as refinement of read and write are implemented? will there be a function to get the encoding used for a specified file?)  
   nice study for HOF, not sure to clearly understand when FOR loop is useful versus when it can be replaces by repeat. The function can be easily deported from rebol but maybe not as well optimized  
   last ask, reflectivity for function, and apply function which is so useful
   
   hope to get quick news, want so much to swith from rebol to red  
   regards and such a good work
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/5176632825738312084)
   
   [Replies]()
   
   1. [Reply]()
6. ![](//resources.blogblog.com/img/blank.gif)
   
   Anonymous[December 30, 2021 at 11:55 PM](https://www.red-lang.org/2021/08/long-time-no-blog.html?showComment=1640904934510#c5871512674137638416)
   
   A great read as always and a good breakdown of what's been accomplished along withe what's on the road ahead for the project. Sadly though one of my takeaways from this article is that Red has so far failed to generate major traction yet. And the team is at a crossroads, opting to make products to justify the language. And I don't particularly think that's a good place to be at.
   
   Usually I visit this site once or twice a year, often whenever it pops into my head, to check on how things are progressing. Years ago the language made a big impression on me and I've had a personal interest on the success of this project since first discovering it way back in 2012.
   
   Fundamentally the input from people not using your project is infinitely more valuable than people already using your project when you're trying to grow it's userbase. And I'll give that to you now but I hope you don't mind if I speak frankly.
   
   The big question that should be on your mind is why I keep coming back but haven't used Red yet in a major project. At least that answer is simple. I've been waiting for decent GUI support for Linux. And I've been watching the un-moving roadmap for years while reading about advances in mobile.
   
   Make a list of successful open source projects with incomplete Linux support and you'll see the list isn't very long. I can't think of one myself. It's become too often that I've watched wonderful open source projects fail to gain traction because they fail to fully support linux. Windows has great developers too and many open source developers as well. But if you want to look for the passionate open source developers who bleed GPL you'll find them on the largest open source platform out there. And as a programming language Red needs a healthy economy of passionate open source developers to thrive. I wonder how many potential developers have clicked on this site and saw Linux GUI support at 10% and clicked away.
   
   I imagine someone on this team was given some bad advice to first cater to corporate interests to be successful. Maybe for a commercial project that would work, but not for a programming language that's open source. Building an active community of developers always comes first.
   
   Issue number 2 is trying to compete with more established tools in crowded areas. Cryptocurrency is a wildcard and something other languages are better at. Mobile development is dominated by the platform maker's own tools and outside of that it's a crowded area. React native, C#, and flutter all do a good enough job there with the added support of giant tech companies.
   
   The biggest problem of all though is outreach, and something you nodded to in your post. If you want to raise awareness and interest for this project, there's no secret to it. Just look at what the creator of Zig has done. He writes constantly and goes out to give talks about his language. The fact that there's no clear role for telling people about what your doing should be a big red flag. Every big commit is a lost opportunity to spread awareness in a post.
   
   It's unfortunate that Red is trying to find its feet in a time where most problems in programming have been solved and in which the next paradigm shift isn't yet clear.
   
   But I didn't want to end on a low note. So I wanted to pitch an idea for a killer product if you're still thinking about this. And it's one that exposes the language to others. For me, the coolest feature that Red offered was the promise of painless cross-platform GUI. It would be amazing to have a simple cmake C library that allows me to define and script my GUI with Red and allowing callbacks to C. Similar to qt+qml but without all the baggage that comes with qt. Wouldn't be a bad idea with the fallout that qt6 is currently experiencing.
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/5871512674137638416)
   
   [Replies]()
   
   1. [Reply]()
7. ![](//www.blogger.com/img/blogger_logo_round_35.png)
   
   [Gregg Irwin](https://www.blogger.com/profile/02841117907023902973)[December 31, 2021 at 4:25 AM](https://www.red-lang.org/2021/08/long-time-no-blog.html?showComment=1640921121743#c3139126067063666559)
   
   Thanks for the input Anonymous, though I wonder what qualifies as decent Linux GUI support for you? What do you use now? Let me suggest that you write your killer app, using Red. You'll get plenty of help on Gitter. Maybe that's your first major project.
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/3139126067063666559)
   
   [Replies]()
   
   1. [Reply]()

[Add comment]()

[Load more...]()

[]()

[](https://www.blogger.com/comment/frame/5936111837781935054?po=7342250242049122082&hl=en&saa=85391&origin=https%3A%2F%2Fwww.red-lang.org)

[Newer Post](https://www.red-lang.org/2021/12/2021-winding-down.html "Newer Post") [Older Post](https://www.red-lang.org/2020/08/redsystem-new-features.html "Older Post") [Home](https://www.red-lang.org/)

Subscribe to: [Post Comments (Atom)](https://www.red-lang.org/feeds/7342250242049122082/comments/default)

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

- [▼](javascript:void%280%29)  [2021](https://www.red-lang.org/2021/) (2)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2021/12/) (1)
  
  <!--THE END-->
  
  - [▼](javascript:void%280%29)  [August](https://www.red-lang.org/2021/08/) (1)
    
    - [Long Time No Blog](https://www.red-lang.org/2021/08/long-time-no-blog.html)

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
