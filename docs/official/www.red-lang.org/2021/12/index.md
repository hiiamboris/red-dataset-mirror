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

## December 31, 2021

[]()

### [2021 Winding Down](https://www.red-lang.org/2021/12/2021-winding-down.html)

Another quarter, another blog post. Seems almost rushed after the previous drought. 

To set the stage, I'll start with a bit of a rant about complexity. If you just want the meat of what's happening in the Red world, feel free to skip the introduction. 

## Complexity Considerations: Part 1

I liked what the InfoWorld article, [Complexity is Killing Software Developers](https://www.infoworld.com/article/3639050/complexity-is-killing-software-developers.html) said, which we all know, about difficult domains (voice and image recognition, etc.) being available as APIs. This lets us tackle things we couldn't in some cases. Though I imagine @dockimbel or others also used Dragon Dictate's libraries back in the 90s. What we have now is massive data to train systems like that. Those work well, allowing us to add features we otherwise couldn't with a small team.

The problem I see is that the trend has become for *everything* to be outsourced, including simple features like logging, and those libraries have exploded. There must be graphs available to show the change. Moderately complex domains, UIs for example, have risen in number and lead to what @hiiamboris says about Brownian Movement. It's a random collection of things, not designed to work together, without a coherent vision. A quote from the above article says it this way:

"Complexity is less the issue than inconsistency in an environment."

It used to be that you could take a FORTRAN, COBOL, Lisp, VB, Pascal/Delphi, Access/PowerBuilder, dBase/Clipper/Paradox, or even a Java developer, drop them into a project, and they could work from a solid core, learning the team's custom bits and any commercial tools as they went. With JS leading the way, but not alone in this, a programmer can only rely on a much smaller core, relative to how many libraries are used.

Because those libraries, and the choices to use a particular combination of them were not designed to work together, there is no guarantee (or perhaps hope) of consistency to leverage. It's worse if you came from a history of other tools that were based on different principles or priorities, because you have to unlearn, breaking the patterns in your mind. Or you convince people to use what you did before, even if there is overlap with tools already in use.

Things are changing now, and will even more. New service-based companies are coming, and a drive to APIs rather than libraries. So we not only have risks like [LeftPad](https://qz.com/646467/how-one-programmer-broke-the-internet-by-deleting-a-tiny-piece-of-code/), but also companies going out of business under you. The modern trend means it's no longer dependent on an author or team committed to a project long term, but to what investors want, and what changes are made to gain adoption at all costs. As a service-based company you *can't* hold dearly to design principles if the investors tell you to pivot. Because it's no longer about your vision, but their return. If it *is* a solo FOSS author or small team, what is their incentive to maintain a project for free, while others profit from it? Success can be your worst enemy, and we need a more equitable solution than what we have now. The software business model has changed dramatically, and will likely continue to do so.

Here is what I personally see as the crux of the problem: the goal of scaling. FOSS projects and companies are only considered successful if they have millions (or, indirectly, billions) of users. Companies that want to be sustainable, providing long term, moderate profits don't make headlines, but they make the world go 'round. They are not the next big social media disruption where end users are the product, to be bought and sold. It is a popular business model and profit is the goal. It's nothing personal.

This has led us to the thinking that *every* project needs to be designed for millions of users at the very least. Sub-second telemetry for all the data collected, another explosion, giving rise to data analytics for everyone; not just Business Intelligence (BI) for large companies. I won't argue against having data. I love data and learning from it. But I do believe there is a point of diminishing returns which is often ignored. Rather, in this case, there is a cost of entry that small projects wouldn't otherwise need to pay.

What do you do, as an "architect" (see the previous blog post about my thoughts on software architecture) or developer on a team? Your small team (we all know small teams are best, plenty of research and history there) simply can't design and build every piece to support these scaling demands, while the sword of Damocles hangs over you in the form of potential pivots (dramatic changes in goals).

As an industry, we are being inexorably forced to make these choices. Either you're a leader and make your own Faustian bargain, or you're in the general mass of developers being whipped and driven to the gates of Hell.

Only you, dear reader, can decide the turns this tragic story will take, and what you forgive in this telling perchance I should exaggerate.

## Complexity Considerations: Part 2

Complexity doesn't come only in the form [McCabe](https://en.wikipedia.org/wiki/Cyclomatic_complexity) is famous for, the decision points in a piece of code, but in how many pieces there are and how often they change either by choice or necessity. Temporal Complexity if you will. This concept is unrelated to [algorithmic time complexity](https://en.wikipedia.org/wiki/Time_complexity). Rebol2 for any faults we can point out, still works to this day (except in cases where the world changed out from under it, e.g., in protocols). It was self-contained, and relied only on what the OS (Operating System) provided. As long as OSs don't break a core set of functionality that tools rely on, things keep working. R2 had a full GUI system (non-native, which insulated it from changes there), and I can only smile when I run code that is 20 years old and it works flawlessly. If that sounds silly, remember that technology, in most cases, is *not* the goal. It is a means to an end. A lot of very old code is still in production, keeping businesses running.

We talk about needing to keep up with changes, but some things don't change very much, if at all. Other things change rapidly, but for no good reason, and without being an improvement. If a change is just a lateral move there is no value in it, unless it is to align us on a different, and better, path in the future. I started programming with QuickBASIC, but also used other tools as I quickly learned my tool of choice came with a stigma attached, and I wanted to be a serious, "real" programmer. What became clear was that QB was a great tool, with a few companies providing terrific ASM libraries, and had a wonderful IDE to boot. It was simpler, not only as a language, but because every 12-18 months (the release cycle way back when) my new C compiler would break something in my code. But QB, and later BASIC/PDS and then VB very rarely broke working code. Temporal complexity.

Even then there were more complex options. The cool kids used Zortech C++ and there were various cross-platform GUI toolkits. But those advanced tools were often misapplied to simple projects. We still do that today. Much of that is human nature, and the nature of programmers. If it's easy we are no longer special. We may not mean to, but we make things harder than they need to be. Some of us are even elitist about what we do, to our own detriment. If you don't need to be cross platform, why do you have multiple machines or VMs each with a different compiler setup? If you need a GUI, why are you using a language that was not designed with them in mind? If you need easy deployment, which is simpler: a single EXE with no dependencies, or a containerization approach with all that entails? How many technologies do you *need* in your web stack? Are you the victim of peer pressure, where you feel your site has to be shiny and "responsive", or use the latest framework?

A big argument for using other's work is performance. They've taken time, and may be experts, to optimize Thing X far beyond what you could ever do. That JIT compiler, an incredible virtual DOM, such clever CSS tricks, the key-value DB with no limits, and yet...and yet our software is slower and more bloated than ever. How can that be? Is it possible we're overbuilding? Is software sprawl just something we accept now?

Earlier I mentioned that a hodge-podge assembly of parts that have no standards, norms, or even aesthetic sense applied does not make our lives easier. Lego blocks, the originals anyway, are limited, but consistent in how they can be used. We misapply that analogy, because the things we build are far from consistent or designed to interact. Even in the realm of UX and A/B testing on subsets of users that companies apply today. I *love* the idea of data-driven HCI to guide us to a more evidence-oriented approach. This includes languages. But when a site or service moves fast and changes their interface based on their own A/B testing, they don't account for the others doing the same. Temporal complexity.

As a user, every app or site I access may change out from under me in the flash of refresh or automatic update I didn't ask for. Maybe it's better, an actual improvement, if you only use that one site. But if all your tools constantly change out from under you, it's like someone sneaking into your office and rearranging it every night while you sleep. Maybe this is the developer's revenge, for the pain we inflict on ourselves by constantly changing our own tools. If we suffer, why shouldn't our users? For those who truly have empathy for their users and don't want to drive them mad, or away, perhaps the lesson is to have empathy for ourselves, for our own tribe. I don't want to see my friends and colleagues burn out, when it was probably the enjoyment and passion that solving problems with software can bring which led them here to begin with.

Every moving part in your system is a potential point of failure. Reduce the moving parts and reliability increases. Whether it's the OS you run on (we now have more of those than ever, between Linux distros and mobile platforms always trying to outdo each other), extra packages or commercial tools, FOSS libraries, environments, \[?]aaS, or platform components like containers and cluster management, every single piece is a point of failure. And if any of them break your code, or your system, even in the name of improvements or bug fixes, you may find yourself running just to stay in the same place. Many of those pieces are touted as the solution to reliability problems, but a lot of them just push problems around, or target problems you don't have. Don't solve problems you don't have. That adds complexity, and now you really have a problem.

## Less Philosophy, More Red

### Interpreter Events

Having a debugger in Red has been a request of many users for a long time, even since the Rebol era. We have tackled this feature from a larger perspective, considering general instrumentation of the interpreter (note: not the compiler), extending it with an event system and user-provided event handlers, similar to how parse and lexer tracing operate today. This approach allows us to build more than just a debugger, though it was a lot of work to design and we expect it will be refined once people start using it in earnest. It's a brave new world, with a lot of tooling possibilities.

It's important to note that this is not magic. Because it operates as the interpreter evaluates values and expressions, including functions, it can't see into the future. In order to get a complete trace, you have to evaluate everything. That means we'll see tools which silently collect data, like a profiler does, which can later be viewed and analyzed, perhaps up to the point where an error occurred. This is an important aspect, and plays once again into the power of Red as data. Your event handlers can easily collect data into any structure or model you like. And because event handlers can filter events, you can tailor them for specific needs. It should even be possible to build interpreter level [DTrace](https://en.wikipedia.org/wiki/DTrace)-like tools in the future. We also hope to build higher level observability and monitoring tools, based on eventing systems, in the future, but those are long term projects.

Event generation is not active by default, it is enabled using do/trace and by providing an event handler function. For example, here's a simple logging function:

```
  logger: function [
      event  [word!]                      ;-- Event name
      code   [any-block! none!]           ;-- Currently evaluated block
      offset [integer!]                   ;-- Offset in evaluated block
      value  [any-type!]                  ;-- Value currently processed
      ref    [any-type!]                  ;-- Reference of current call
      frame  [pair!]                      ;-- Stack frame start/top positions
  ][
      print [
          pad uppercase form event 8
          mold/part/flat either any-function? :value [:ref][:value] 20
      ]
  ]
```

Given this code:

```
  do/trace [print 1 + 2] :logger
```

It will output:

```
  INIT    none                    ;-- Initializing tracing mode
  ENTER   none                    ;-- Entering block to evaluate
  FETCH   print                   ;-- Fetching and evaluating `print` value
  OPEN    print                   ;-- Results in opening a new call stack frame
  FETCH   +                       ;-- Fetching and evaluating `+` infix operator
  OPEN    +                       ;-- Results in opening a new call stack frame
  FETCH   1                       ;-- Fetching left operand `1`
  PUSH    1                       ;-- Pushing integer! value `1` on stack
  FETCH   2                       ;-- Fetching and evaluating right operand
  PUSH    2                       ;-- Pushing integer! value `2`
  CALL    +                       ;-- Calling `+` operator
  RETURN  3                       ;-- Returning the resulting value
  CALL    print                   ;-- Calling `print`
  3                               ;-- Outputting 3
  RETURN  unset                   ;-- Returning the resulting value
  EXIT    none                    ;-- Exiting evaluated block
  END     none                    ;-- Ending tracing mode
```

Several tools are now provided in the Red runtime library, built on top of this event system:

- An [interactive debugger](https://github.com/red/docs/blob/master/en/interp-events.adoc#debug) console, with many capabilities (step by step evaluation, a flexible breakpoint system, and call stack visualisation).
- A simple [profiler](https://github.com/red/docs/blob/master/en/interp-events.adoc#profile) that we will improve over time (especially on the accuracy aspects).
- A simple [tracer](https://github.com/red/docs/blob/master/en/interp-events.adoc#trace-1). The current evaluation steps are quite low-level, but @hiiamboris has already built [an extended version](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/tracing.md), operating at the expression level that will soon be integrated into the master branch.

Full docs are [here](https://github.com/red/docs/blob/master/en/interp-events.adoc).

### Format

Boy, I really thought this was was going to be easy, or at least not *too* hard. I couldn't have been more wrong. When I did my format experiments, I imagined at least some of the code would be useful, requiring polish and more work of course, providing a foundation to work from. It turns out that I missed a key aspect, and my approach was just one of many possible. @hiiamboris and @giesse both weighed in, and we chatted about specific parts. Then it sat idle for a while, and I asked Boris to take it over to get it into production. He identified the key missing piece, which would have limited its usefulness until we eventually had to address it. Better now than later. He also made a strong case for a different approach to the core masked-number and I told him to run with it. That led to a lot of design chat about one aspect, which is as yet undecided. It's not a fight to the death, but there has definitely been some sparring. :^)

The missing piece I've alluded to is Localization (L10N). As an American who has never had to develop software requiring Internationalization (I18N), I've been blissfully ignorant of all the aspects that come into play when Globalization (G11N) becomes part of the process. We have talked about how to implement L10N in Red, and have system/locale for a months, weekdays, and currency codes. The first two we inherited from Rebol's design, the latter was added when @9214 designed the currency! datatype. Thinking of locale data in a system catalog of some kind is easy enough, but how to actually apply it (and not apply it when necessary) is a different story entirely. And I mean *entirely*. Format forced us to start down this path, and is a guinea pig feature that will guide future plans for all future L10N work. But keep my complexity rant in mind. While we want to make it as easy as possible for Reducers to write globally aware apps, if you don't need it, don't do it. We don't yet know if we can make it so magical that you can write your app ignoring that for the most part, and then flip a switch, or simply include local data, and have it work. Don't get your hopes up. There's a lot that can go wrong with that approach.

We agreed to start with masked numbers but, in order to do that, L10N R&amp;D had to be done. This led to broad and deep dives into unicode.org and other resources. While they cover far more than we need, and is overly complex in many cases (or just doesn't match our aesthetic sense for Red), the data they have there is enormously valuable, and we deeply appreciate it being available. We just draw the line around a smaller scope than they do, and no committees are involved where people fight to get their own bits included. Well, we do that too, to some extent. What Boris managed to do was identify the key elements needed for our work, and then wrote tools (using Red of course) to extract and reformat the data for use in Red. I can't stress how much work this was. Truly a heroic and mostly thankless effort most people will never know about.

In order to test masked number formatting, and give others an easy way to play, Boris created a [Playground App](https://files.gitter.im/5565a1d415522ed4b3e10094/r8VT/playground-signed.exe) and I can't tell you how important that was. You see, a particular piece of behavior came up while I was playing with it and got unexpected results. Unexpected to me, but Boris confirmed it was by design. I will just say here that it's about a significant digits mode, and let you play with the app from there. Named formats will be available, but everything will likely boil down to wrappers around masks, which should cover almost any need.

Next up is date formatting. This time I knew locales would play a role because some IETF RFCs specify that date elements be in English. So you may have localized dates for some things, but if you use RFC2822 dates or HTTP cookie dates, they *must not* be affected by any locale settings. Dates will use masks at the core, like numbers, because masks are an easy to understand WYSIWYG format. Well, easy if the masks make sense. If you look at printf and some other mask syntax, it can be quite obscure. By trying to cram things into a limited syntax, people end up using whatever low ASCII letters might be left over for some elements. We hope to avoid that. 

Our main choices are what Boris termed the stuttering format. e.g. MMDDYYYY/HHMMSS. Think in terms of "progressing in a hesitant or irregular way." rather than stuttering in terms of human speech. I prefer to call this a symbolic format, where the letters map to date elements. This, of course, isn't perfect. e.g. is MM month or minute? Context is required. We don't want to be case sensitive, or use other letters randomly to avoid that conflict. So there's an alternate approach; a literal mask. e.g. 1-Jan-2022. We're not the first to consider it, and it is in use elsewhere, but it's not a perfect solution either. Do masks have to be written in English terms, or can they use any locale? How do you disambiguate numbers (does 01-01 mean MM-DD or DD-MM, and how do you write that without the separator to get MMDD?) Does it make code more or less readable, because Red already has a literal date form, and it would add what look like literal dates as strings in code.

Play with the app, give us feedback, and stay tuned. We think this will be a crucial feature for a lot of users, and we want to make it the best it can be.

### Split

Like format, split seems a relatively simple subject at a glance. And if you limit it to basic functionality, it is. That's what other languages do, though some add a few extra features. See [this table](https://github.com/greggirwin/red-split/blob/master/split-in-other-languages.md) for examples. Wolfram *appears* quite broad in scope, because there are multiple variants for each named function. Something else common to all other languages is that they split only strings and sometimes byte arrays. In Red we have blocks, and while \`parse\` is great for string parsing, where it really shines is when applied to blocks to build dialects. We knew split should be block aware for more leverage. I (Gregg) helped design the version in R3, and used [DiaGrammar](https://www.redlake-tech.com/products/diagrammar-for-windows/) to design a new dialected interface that aimed to extend the functionality. Wanting to do more evidence based language design, I also prototyped a small practice/playground app, thinking we'd put it out and see what kind of feedback we could get. 

Toomas stepped up and suggested an alternative, refinement-based, interface. He did a number of versions of that, and then we had to decide what to do next. There was a great deal of design discussion, still going on, about behavior details. Once you start adding options, it's easy for things to become confusing for the user. We need to strike a balance between ease of use and flexibility. Split is meant to handle the most common cases, and those with the most leverage, not *every* case. And while a refinement-based interface seems natural for Reducers, we also know how readable [parse](https://github.com/red/docs/blob/master/en/parse.adoc), [draw](https://github.com/red/docs/blob/master/en/draw.adoc), and [VID](https://github.com/red/docs/blob/master/en/vid.adoc) dialects are. There are pros and cons to each, but we don't want dual interfaces, which will be confusing. If a function is dialected, any refinements should work in support of that dialect. So the test app was reimagined by @GalenIvanov to compare the two approaches.

Here's a screenshot of the test app, which we'll release to the community in January.

[![](https://blogger.googleusercontent.com/img/a/AVvXsEh8adjrXvAefvFESPdf33uk9UwaBwH5yVJ5IgXH8mj7k80H18t2oTOGJ-p9Lt_MJ64BNRQu6b5BAruex_MlVxYThBVXefYmlApk9c7jONbp1QxbamKR5f6khmaH7kAnqX1JFBl-HNzzrLN4J75K8OD8CiHaa2ilVbcJocj380vTXwEZ3FoE8moeUvSq=w479-h361)](https://blogger.googleusercontent.com/img/a/AVvXsEh8adjrXvAefvFESPdf33uk9UwaBwH5yVJ5IgXH8mj7k80H18t2oTOGJ-p9Lt_MJ64BNRQu6b5BAruex_MlVxYThBVXefYmlApk9c7jONbp1QxbamKR5f6khmaH7kAnqX1JFBl-HNzzrLN4J75K8OD8CiHaa2ilVbcJocj380vTXwEZ3FoE8moeUvSq=s817)

We learned by doing this that it's hard to compare them side by side, without having the user write full calls directly. That defeats some of the purpose, and the DRY principle, so we'll put this one out, then revise it based on feedback.

### Markup Codec

Who knew that parsing HTML and XML would be the easy part? Well, many Reducers would. What they, and we on the team, might not have guessed, is just how hard it is to decide on a data format for the output. Red gives us many options, and XML gives us many headaches. The two formats, while closely related, also have some critical differences. Fortunately, once @rebolek set things up so we could play, and made the emitter modular, we could look at real examples and dive even deeper. What we discovered is that there is no perfect solution. No elegant model to fit all uses and cases. Key to many insights was @dander's input, as he works with XML a lot. Turns out, an infinitely extensible format is infinitely challenging to nail down.

Should we emphasize path access? Being data driven, people probably *shouldn't* hardcode their field names, but working with known data makes it a clear access model. Should attributes come before or after the text/content for a tag? As we learned, attributes aren't always small, so the locality argument isn't won either way there. Is it better to provide an interface to the structure and tell people to always use that, or to create a bland and obvious data structure that is possible to access in many ways? Will these things all complicate HOF access, which we know we want to leverage? How much do we need to care about efficiency? We don't want to be wasteful without purpose, but if we're too miserly, users may pay the price because it's harder to use. If we make more things implicit, do we paint ourselves into a corner somehow?

What we settled on was a modular approach, so there will be more than one standard emitter. What is yet undecided is how other emitters might be supported. They will likely be quite custom, as the standard versions will cover most needs. But is it worth making the system extensible? Once you have a result, it's easy to post-process into your preferred format. For now that's our recommended approach.

### CLI Module

If you don't follow our channels on Gitter, you may not know about [Boris' CLI module](https://github.com/hiiamboris/red-cli-gitlab-mirror). It's very slick, very Reddish, and will become a standard part of Red in the near future. You won't believe how easy it is to create rich command line interfaces for your Red apps with this feature. Huge thanks to @hiiamboris for all his innovation and work on it.

### IPv6 Datatype

It hasn't been merged to the mainline yet, but it's fully operational. You can see the code [here](https://github.com/red/red/blob/IO/runtime/datatypes/ipv6.reds), and some lexer tests [here](https://github.com/red/red/blob/IO/tests/source/units/lexer-test.red#L415). You may be impressed that it's only a couple hundred lines of code, not counting the lexer changes, and think it was easy. It wasn't. As usual, there was a lot of design chat and compromise involved. For example, the name is not 100% finalized because, technically, the datatype itself is more generally applicable, being simply a vector of numbers internally. You can think of it like a tuple! on steroids. Less slots (8 vs 12), but each slot can hold a larger value (tuple! slots are limited to byte values).

Just as tuple! is a general name, used both for IPv4 addresses and colors, but also useful for other things, IPv6! could be used for things like GUIDs or extended time values. But the lexical form for GUID/UUID values is quite different, even ignoring the shortcut forms in the [IPv6 specification](https://datatracker.ietf.org/doc/html/rfc4291). As you probably know, lexical space is tight in Red, and the colon is an important character in other places, and URL lexical forms were impacted, so this is a deep change and commitment, in that regard. Why do it then?

Because IPv6 networking support was already in place in Red, and IPv6 is the future. How often people will write literal URLs like http://\[FEDC:BA98:7654:3210:FEDC:BA98:7654:3210]:80/index.html we can't say. But we do know that addresses often end up in config files as data and that modern, dynamic systems generate addresses dynamically. They will appear in log files, messages, and more. As with the value of other lexical forms in Red, it's an important one that is part of our modern networking vocabulary.

### Getting Near

@dockimbel created a new branch [here](https://github.com/red/red/tree/error-near), which will interest almost every Reducer. It's not ready yet, but expect it to be available in January. For those who used R2, you may recall that errors gave you a Near field, to hint at where the error occurred. Red will get this feature when the new branch is merged. e.g., in Red today you get this:

    &gt;&gt; 1 / 0

    \*\** Math Error: attempt to divide by zero

    \*\** Where: /

    \*\** Stack:  

Where in R2 you got this:

    &gt;&gt; 1 / 0

    \** Math Error: Attempt to divide by zero

    \** Near: 1 / 0

A little extra information goes a long way. We're anxious to see all the virtual smiles this features brings.

## The Daily Grind

We closed roughly 120 tickets in 2021, that's 10 per month. We also merged almost 50 PRs. These numbers don't sound large, but when you consider how much time and effort may go into the deep ones, along with all the other work done, it's steady progress. We'd love for both tickets and pending PRs to be at zero, but that's not practical for a project like Red. The deep core team must have uninterrupted time for design and bigger, more complex tasks.

## Roadmap

### Q4 2021 (retrospective)

- We hoped to have \`format\` and \`split\` deployed, but they will push back to Jan-2022.
- \`CLI\` module approved, needs to be merged, then refined as necessary.
- \`Markup Codec\` took longer than expected due to extensive design chat on formats.
- Interpreter instrumentation, with PoC debugger and profiler. Took longer than expected, but are out now.
- Async I/O, out but some extra bits didn't make it in. One unplanned addition was \`IPv6!\` as a datatype. It's experimental, and subject to change.
- @galenivanov did some great work on his animation dialect, but @toomasv's \`diagram\` dialect took a back seat and will move to Q1 2022.
- Audio has 3 working back ends and a basic port implementation. Next up is higher level design, device and format enumeration, and device control. A \`port!\` may not be the way to go for all this, but it was step one.
- Animation has more great examples all the time. Like [this](https://files.gitter.im/611aa1b26da03739848349bc/ppfZ/Anim-text-fx.gif) and [this](https://files.gitter.im/611aa1b26da03739848349bc/d4Pc/Animate-markers.gif). @GalenIvanov is doing great work, and we are planning to make his dialect a standard addition to Red.

### 2022

I'm not going to list items in any particular order, because our plans often change. This way you have things to look forward to, but still with an element of surprise.

- \`Table\` module, \`node!\` datatype and other REP reviews
- Full HTTP/S protocol and basic web server framework
- New [DiaGrammar](https://www.redlake-tech.com/products/diagrammar-for-windows/) release
- Animation dialect
- New release process
- New web sites updated and live
- Red/C3 (Including ETH 2.0 client protocol)
- Red Language Specification (Principles, Core Language, Evaluation Rules, Datatype Specs (including literal forms), Action/Native specs, Modules spec.
- 64-bit support (LLVM was a possibility, but we learned from Zig that LLVM breaking changes can be quite painful for small teams to keep up with. We may be better off continuing to roll our own, though it's a big task.)
- Android update
- Red Spaces cross-platform GUI
- Module and package system design
- RAPIDE (Rapid API Development Environment)

## RAPIDE, from Redlake Technologies

If you've used [Postman](https://www.postman.com/) or [Insomnia](https://insomnia.rest/), you know what the most popular tools in the API IDE space look like today. If you haven't used them, but use APIs, they're worth a look. For all that those tools do, and there are a few other players in the space, there is a lot they don't do. We think we can add a lot of value in the API arena, thanks to Red's superpowers and how important data-centric thinking is. For example, testing a group or series of APIs together seems like it could be greatly improved. Also, how APIs are found, and collaboration possibilities.

While we haven't set a release date, the plan is to start work on RAPIDE in Q2 2022, after we wrap up some infrastructure pieces it will rely on. 

## In conclusion

Happy New Year to all, and may 2022 see us all healthy, happy, and writing more Red. :^)

Posted by Gregg Irwin at [9:23 PM](https://www.red-lang.org/2021/12/2021-winding-down.html "permanent link") [11 comments:](https://www.red-lang.org/2021/12/2021-winding-down.html#comment-form) [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=5711583953912040602&from=pencil "Edit Post")

[Newer Posts](https://www.red-lang.org/search?updated-max=2024-05-27T19%3A37%3A00%2B02%3A00&max-results=7&reverse-paginate=true "Newer Posts") [Older Posts](https://www.red-lang.org/search?updated-max=2021-12-31T21%3A23%3A00%2B01%3A00&max-results=7 "Older Posts") [Home](https://www.red-lang.org/)

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

- [▼](javascript:void%280%29)  [2021](https://www.red-lang.org/2021/) (2)
  
  - [▼](javascript:void%280%29)  [December](https://www.red-lang.org/2021/12/) (1)
    
    - [2021 Winding Down](https://www.red-lang.org/2021/12/2021-winding-down.html)
  
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
