# Archived messages from: [gitter.im/red/red](/gitter.im/red/red/) from year: 2020

## Wednesday 1st January, 2020

SergeyVladivostok

[00:15](#msg5e0be4b90c3aeb107d84ee26)ok. how last old version Red, have support dos? Or dos never not support?

TheHowdy\_gitlab

[00:55](#msg5e0bededeac8d1511e8ff0f3)Afaik Red never supported MSDOS. The "DOS" compile target produces Win32 console-only executables.

vazub

[06:49](#msg5e0c410389701b511d4421ea)Then the target seems to be a misnomer. I also believed until this very moment, that it was actuually MS-DOS.

[06:51](#msg5e0c415604a1900497e4ed7f)

ne1uno

[07:01](#msg5e0c43b46ff7ae03fc7f9fd3)msdos v7. maybe early rebol 1 could be compiled for dos6?

pekr

[09:08](#msg5e0c61abd31dba03fddbc4ca)So the blog articles is out and fun about to come :-) Long live the Redlake Technologies!

SergeyVladivostok

[10:59](#msg5e0c7badd31dba03fddc6f08)@ne1uno to compiled in rebol 1 i need rebol1/sdk? Where i can get him? In rebol.com cant finde old version.

ne1uno

[11:05](#msg5e0c7d01d5a7f357e6b78727)@SergeyVladivostok maybe someone knows how to find it, or the wayback machine at archive.org. you might get lucky http://web.archive.org/web/19980530155043/http://www.rebol.com/

[11:09](#msg5e0c7df307a1a67d1d931bd1)building old versions 1 not automatically usable in DOS, but more likely than newer versions if you can even get source or executable. they often don't archive everything on a site

pekr

[11:12](#msg5e0c7e99d5a7f357e6b79105)@SergeyVladivostok You don't need Rebol/SDK, Rebol/View is good enough ...

PeterWAWood

[11:12](#msg5e0c7e9d2d574c7d1ef0d10a)Rebol2 was first released in 1999. It has never been released under an open-source licence.

[11:15](#msg5e0c7f368ba16b107c040f46)It is unlikely that Rebol/View would run on an MSDOS machine as it uses Anti Grain Graphics.

GiuseppeChillemi

[11:23](#msg5e0c8123d31dba03fddc9293)Has the new diagram software the diagram dialect of Toomas behind it?

PeterWAWood

[11:41](#msg5e0c854d2d574c7d1ef0f975)@SergeyVladivostok The "smallest" Rebol-like language is \[Boron](http://urlan.sourceforge.net/boron/). It is written in C (but I don't know which C standard). It is actively maintained by its author, Karl Robillard, but you would need to port it to MSDOS yourself. I have found Karl helpful in the past but his availability limits him to answering a question or two.

SergeyVladivostok

[12:03](#msg5e0c8a7405298604981f89b4)@ne1uno unfortunately, DOS is missing and the number of supported platforms has decreased over time (http://web.archive.org/web/20011217222437/http://www.rebol.com:80/platforms.html)

[12:04](#msg5e0c8ad3fd580457e7a878fd)@PeterWAWood Thanks, I'll watch Boron

[12:23](#msg5e0c8f5d89701b511d4618d9)@pekr Rebol/View can compilet script whisout SDK? How?

PeterWAWood

[12:37](#msg5e0c9295833c373f4d9025fc)@SergeyVladivostok Rebol is an interpreted language, there is no compile stage.

pekr

[13:13](#msg5e0c9b13eac8d1511e9444e2)I am talking about compiling a Red programs. I do start a Rebol/View and type: `do/args %red.r "-r -t Windows %environment/console/gui/gui-console.red"` to get Red based GUI console for example ....

SergeyVladivostok

[13:55](#msg5e0ca4b4eaa2cd096fd81a19)@PeterWAWood yes, but @pekr say - i don't need SDK... To compile need SDK, but wend i trye buy (http://www.rebol.com/sdk.html) i have error 404 (https://secure163.inmotionhosting.com/~rebolc5/cgi-bin/order.cgi?cmd=buy&amp;prod=sdk-cmd). Where i can get license.key for /Pro?

pekr

[14:46](#msg5e0cb0d08ba16b107c0558ce)@SergeyVladivostok What do you want to compile? Rebol/SDK is a tool to produce (encap) Rebol script executables. You don't need it in order to being able to compile Red scripts. If you want to compile Red scripts, just use Rebol/View or even Rebol/Core. No /Pro licence needed. And follow the insructions here - https://github.com/red/red/blob/master/README.md

## Thursday 2nd January, 2020

PeterWAWood

[00:39](#msg5e0d3bce0fd3413f4c902d53)@SergeyVladivostok You don't need to install any version of Rebol to compile Red programs if you download Red from the downloads page of Red-lang.org.

[00:40](#msg5e0d3becd31dba03fde14695)Here is an example of compiling a Red program on Windows:

[00:42](#msg5e0d3c90eac8d1511e986802)\[!\[Compiling Red on Windows.png](https://files.gitter.im/red/red/3NMn/thumb/Compiling-Red-on-Windows.png)](https://files.gitter.im/red/red/3NMn/Compiling-Red-on-Windows.png)

SergeyVladivostok

[02:25](#msg5e0d548f6ff7ae03fc8672aa)Thanks you patience. Use Rebol to run Red and use Red for compiling Red scripts - thish is im undisputed. Red have GUI support in Linux? In linux version Rebol GUI application running. In Red-064 and Red-28dec19 not running. So for compileng linux&amp;windows GUI programs i need Rebol SDK /Pro?

PeterWAWood

[02:31](#msg5e0d55f207a1a67d1d9887da)No you don't need Rebol SDK to compile Red programs. You don't use Rebol to run Red.

SergeyVladivostok

[02:34](#msg5e0d56cfb4ed68096e173f96)@PeterWAWood can i compile linux gui programs?

greggirwin

[03:09](#msg5e0d5efc0c3aeb107d8e1e72)@SergeyVladivostok we just announced in the new blog post that the GTK branch is almost ready.

SergeyVladivostok

[03:25](#msg5e0d62a589701b511d4b4f67)@greggirwin Great! I look forward to it. Thanks for your works!

loziniak

[09:38](#msg5e0dba0907a1a67d1d9b04c0)@SergeyVladivostok you can find more details here: https://github.com/red/red/wiki/\[NOTES]-Gtk-Bindings-Development

[09:39](#msg5e0dba6e04a1900497ee5be8)But it seems now that all team workforce is concentrated on fast-lexer and direct2d branches.

SergeyVladivostok

[12:41](#msg5e0de4ea2d574c7d1ef9d699)@loziniak Thanks very much! Red-gtk work good, but compiled program say "\*\** Script Error: view has no value"

rebolek

[13:02](#msg5e0de9e90fd3413f4c947946)@SergeyVladivostok you need to add `Needs: 'View` to header of `%console.red`

SergeyVladivostok

[13:29](#msg5e0df04e2d574c7d1efa2533)@rebolek i get binary (https://cqls.dyndoc.fr/users/RCqls/Red/red-gtk)... i need get source and recompiled?

loziniak

[16:12](#msg5e0e1651833c373f4d99e1dd)@SergeyVladivostok this one is probably outdated.

[16:13](#msg5e0e16a089701b511d4fd94e)these are up-to-date: https://rebolek.com/builds/

rebolek

[17:34](#msg5e0e2992eaa2cd096fe1e3a1)@SergeyVladivostok Oh, I thought you're compiling from sources, sorry.

## Friday 3th January, 2020

SergeyVladivostok

[02:11](#msg5e0ea2d02af31b403d0bf064)@loziniak last "linux-gui-200102" not compilet (Access Error: cannot open: %-c), not quit (Script Error: \_save-cfg has no value)... red-gtk better.

[02:18](#msg5e0ea46c1c3a592052c0de1d)@rebolek i trye compiling from sources

hiiamboris

[09:59](#msg5e0f107ba86f9758ccbe898b):point\_up: \[November 26, 2019 10:14 PM](https://gitter.im/red/red?at=5ddd7988983a872a1a7fdc58)

loziniak

[10:31](#msg5e0f180c3062aa3e8dea8cf8)I've updated \[GTK wiki page](https://github.com/red/red/wiki/%5BNOTES%5D-Gtk-Bindings-Development). @bitbegin I suppose this \*"Instead of using GTK3's recommended CSS-like API, we try to use deprecated low-level API"* is no longer valid? I saw some CSS code in last commits.

pekr

[13:24](#msg5e0f40a6be6bab58cd67dc5c)Why `request-file/filter`opens in the Documents section under Windows, and not a current dir, as simple `request-file` does?

hiiamboris

[13:58](#msg5e0f487714328863c004219b)It looks like OS' heuristics. Also after a single successful `request-file` it now always starts from the directory where it succeeded.

SergeyVladivostok

[14:06](#msg5e0f4a8014328863c0042ee6)@rebolek, i do all have set in \[wiki](https://github.com/red/red/wiki/\[NOTES]-Gtk-Bindings-Development) , add `Needs: View`, compiling, launch and have error `Script Error: view has no value` on command `view []`... wot i miss?

[14:09](#msg5e0f4b142af31b403d104325)@hiiamboris https://static.red-lang.org/dl/branch/GTK/linux/red-latest say `*** Compilation Error: module not found: View'`

loziniak

[14:47](#msg5e0f5406809bc77efee0f1f4)@SergeyVladivostok it's `'View`, not `View'`.

## Saturday 4th January, 2020

SergeyVladivostok

[00:36](#msg5e0fde04c23234403cc4cf33)@loziniak i tray add `Needs: View`, `Needs: 'View`, `Needs: View'`, `Needs: 'View'` all time error:

```
>> view []
*** Script Error: view has no value
*** Where: catch
*** Stack:
```

```
$ ./console -c aaa.r
*** Access Error: cannot open: %-c
*** Where: read
*** Stack:
```

loziniak

[00:37](#msg5e0fde54c23234403cc4d190)It's not possible to compile with console.

SergeyVladivostok

[00:41](#msg5e0fdf2ba86f9758ccc44e07)@loziniak how i can compileting Red for make gui Red script binary?

[00:43](#msg5e0fdfc6a86f9758ccc4535d)i find my error in add `Needs: 'View`... now `view []` make window! But cant compilet to binary...

loziniak

[00:43](#msg5e0fdfc7c23234403cc4df44)You can compile using Red sources, just as you compile console (see \[wiki](https://github.com/red/red/wiki/\[NOTES]-Gtk-Bindings-Development), compilation section, point 6)

[00:46](#msg5e0fe05814328863c0086d01)You just need to change path to the .red script

SergeyVladivostok

[00:49](#msg5e0fe11fbe6bab58cd6c45d5)@loziniak Thank you very much! It worked!

loziniak

[00:50](#msg5e0fe1594e9ea12051ae6925)@SergeyVladivostok you're welcome :-)

SergeyVladivostok

[00:53](#msg5e0fe1eea769bf30fd330979)Now beginner user Rebol/Red +1 :)

MichaelCMcCann

[02:52](#msg5e0ffdd2f6ee9c3e8e01ab13)Hi there. New to Red, but not to Rebol. Trying to port a working Rebol script and getting this error:  
\*\** Syntax Error: missing #"]" at "]"  
\*\** Where: do  
\*\** Stack: do-file expand-directives load

greggirwin

[03:04](#msg5e1000ba316c14732710c096)@MichaelCMcCann is your file UTF-8? Any other clues you can give us?

MichaelCMcCann

[03:13](#msg5e1002e3316c14732710cfc0)@greggirwin Yes, UTF-8, Mac. Here's a big hint if you are familiar with old Rebol files: It is Henrik Mikael Kristensen's Relations Engine.

greggirwin

[03:16](#msg5e10039fa86f9758ccc537a8)Binary hunt and trim perhaps. I haven't used that, though his %list-view.r is part of my life forever.

MichaelCMcCann

[03:18](#msg5e10041b2af31b403d1553fe)Great, thanks. I'll try that. I'm a big %list-view.r fan as well.

ne1uno

[03:26](#msg5e1005f7cbd2c97eff883eb6)few gist to check balance https://gist.github.com/search?utf8=%E2%9C%93&amp;q=check+language%3Ared&amp;ref=searchresults

[03:27](#msg5e100635a769bf30fd33df09)could use rebol mode, Balance Braces, Parentheses, Brackets, and Tags in Your Code http://balancebraces.com/

MichaelCMcCann

[03:34](#msg5e1007d5316c14732710f326)@ne1uno Interesting. Wasn't aware of either of those tools. Thanks.

ne1uno

[03:35](#msg5e1007f43062aa3e8df122a2)could be different function spec too

[03:44](#msg5e100a15a86f9758ccc55eb9)https://github.com/BrianHawley/r2-forward

[03:44](#msg5e100a153062aa3e8df13003)https://github.com/red/red/search?q=rebol&amp;type=Wikis

MichaelCMcCann

[03:59](#msg5e100daebe6bab58cd6d5d00)@ne1uno Thanks again. Good stuff.

hiiamboris

[22:05](#msg5e110c2b809bc77efeec9f95)Any way we can get images garbage collected anytime soon?

## Sunday 5th January, 2020

dockimbel

[00:00](#msg5e1127362af31b403d1c9e0c)@qtxie What is the state of GC for images?

lucindamichele

[18:07](#msg5e1225e54e9ea12051bd4ac0)@pekr Thanks!

[18:09](#msg5e12264ba86f9758ccd307ba)As @pekr mentioned, we have a new update on the site for 2020! https://www.red-lang.org/2020/01/happy-new-year.html

## Monday 6th January, 2020

rebolek

[07:49](#msg5e12e67d865af87363c8758e)What is special about `\`? According to \[Core manual](http://www.rebol.com/docs/core23/rebolcore-3.html#section-3) it shouldn't be disallowed in words, but:

```
>> type? quote \
*** Syntax Error: invalid value at "\"
*** Where: do
*** Stack: load
```

Oldes

[08:12](#msg5e12ec0a809bc77efef88ef2)@rebolek I believe that HF would tell you, that it should be empty path not a word ;-)

rebolek

[08:13](#msg5e12ec47865af87363c897d7)@Oldes yeah, well, I'm not interested about info from astral planes ;-)

endo64

[08:14](#msg5e12ec6b14328863c01c196f)Even on R2 &amp; R3:

```
>> [\]
** Syntax Error: Invalid word -- \
```

On Red:

```
>> [\]
*** Syntax Error: missing #"]" at "\]"
```

rebolek

[08:15](#msg5e12ec8fc23234403cd8b534)I can't remember any type where `\` is used.

Oldes

[08:17](#msg5e12ed1df6ee9c3e8e14bcd7)I think that `\` is in the same group as `,`

[08:18](#msg5e12ed59865af87363c89f0b)And I was requesting `,` to be a valid word in old R2 times. But don't remember why was Carl refusing it.

[08:20](#msg5e12edc23062aa3e8d03c3fe)`\` is used as a escape char in Mac (\*nix?) consoles, so maybe that is the reason.

rebolek

[08:20](#msg5e12edcb2af31b403d27fa9c)I would prefer it being whitespace, but I really don't want to start comma discussion, or we all end up in coma ;-)

I'm just curious about `\`.

[08:20](#msg5e12ede0be6bab58cd7ff2ae)It is used as escape char, but Redbol uses `^` which is allowed in words...

Oldes

[08:21](#msg5e12ee07316c1473272396f2)Right.. and as `^` is escape char in CMD on windows and still can be a valid word in redbol, than I think that `\` could be also supported.

rebolek

[08:23](#msg5e12ee86a769bf30fd46bd0d)OTOH if `\` is disallowed in words, it opens up new possibilities like types starting with `\` (`\ABCD0102` for hexa for example)

Oldes

[08:25](#msg5e12eee02af31b403d280377)But for hexa is better to use syntax, which would support not only hexa numbers. I don't know what was the conclusion of all these old debates.

rebolek

[08:27](#msg5e12ef7acbd2c97eff9b03ce)That was just an example. The question is, what so special about `\`.

Oldes

[08:36](#msg5e12f175809bc77efef8b106)I don't know. Maybe the fact, that words with `\` would look strange in paths? `second 'aa/b\b/cc`

[08:37](#msg5e12f1d74e9ea12051c24f23)I think that the reason will be, that `\` is quite valuable and waits to be used in some new datatype.

rebolek

[08:38](#msg5e12f21b6dda2430fed95dd1)I have no problem with that, I just wonder why it's nowhere mentioned

Oldes

[08:39](#msg5e12f246be6bab58cd800c1f)Btw... using words in dialects to hold numbers like in you hexa example is a very bad idea as words are allocated in `system/words` and never released.

rebolek

[08:42](#msg5e12f2dfbe6bab58cd800ee9)@Oldes no, you misunderstood me. In my example `\0102` isn't word, but hexadecimal number.

[08:42](#msg5e12f2f9a86f9758ccd816ac)Because `\` isn't allowed in words.

Oldes

[08:42](#msg5e12f2fccbd2c97eff9b15ce)Ah.. right. Yes... as I said.. I believe that was the reason why it is not allowed... to be used somehow else, not just as a char in a word.

rebolek

[08:43](#msg5e12f33514328863c01c4669)Ok, then let's use it ;-)

Oldes

[08:43](#msg5e12f343809bc77efef8bb5a)How? ;-)

greggirwin

[09:19](#msg5e12fb9d1c3a592052dd2036)`0#...` is a leading option for based numeric syntax, though we have to weigh the value in Red vs R/S. The `system/words` point has come up at times, because `issue!` changed from string to word type, as it was in R2. There are ways around that, e.g., `#"..."`, but it's another addition and complexity.

`\` is an interesting character. If we look at `/`, it has various punctuation meanings, the closest that may have inspired Carl (outside \*nix file paths and URLs) is:

&gt; The slash, as a form of inclusive or, is also used to punctuate the stages of a route.

To reverse that, so `\` means "reversed stages of a route", you could have paths that walk backwards through a data structure (equal to `..` in file terms). That seems like a bad idea offhand, because we think in terms of children not knowing anything about parent nodes in a hierarchy. But @hiiamboris might chime in with thoughts, because we've been talking about how \*do* you syntactically walk backwards\\upwards through a tree?

We shouldn't use it just because we can, but because there's a really good use for it.

hiiamboris

[09:55](#msg5e130403a86f9758ccd887fa)Consider also Haskell-like lambda function constructor possibility, e.g. `filter xs \x[x > 0]`

dockimbel

[11:25](#msg5e13192e2af31b403d29201e)`\` is a reserved character for future literal forms (once we figure out a good use-case for it).

rebolek

[11:26](#msg5e131950316c14732724b614)That's what I thought. Thanks for answer!

tdorzhi

[14:18](#msg5e1341bebe6bab58cd8239ab)hello, I have a problem with vscode extension's LSP not running on NixOS, anyone had encountered this?

## Tuesday 7th January, 2020

pekr

[05:48](#msg5e141b9ca1e1504901166408)@dockimbel , @hiiamboris or @greggirwin Just curioius about the CLI interface - could it be used later as a means of a general interfacing mechanism (e.g. via ports too), or just suited to the command line only? Maybe I got misslead by the "command" word, so I somehow mapped it to R3 extension mechanism.

greggirwin

[07:09](#msg5e142eb43679536f96219f6d)This is a Command Line Interface library.

SergeyVladivostok

[13:17](#msg5e1485035597551890376b69)Is this normal? "1" participates in the formation of the result for "a" but does not participate for "a/1" (also for "a" and "a/2/2"). It seems to me that length? "a/1" should be "1", because length "a" = 2, e.t. 1 (1) + 1 (\["aaa" a])...

```
>> a: [ 1 ["aaa" a]]
== [1 ["aaa" a]]
>> print length? a
2
>> print length? a/1
*** Script Error: length? does not allow integer! for its series argument
*** Where: length?
*** Stack:  

>> print length? a/2
2
>> print length? a/2/1
3
>> print length? a/2/2
*** Script Error: length? does not allow word! for its series argument
*** Where: length?
*** Stack:  

>> :a/2/2
== a
```

[13:23](#msg5e14866dc3950349025c6aee)

```
>> about
Red 0.6.4 for Linux built 15-May-2019/12:15:03+06:00 commit #c7ad8f4
```

hiiamboris

[13:30](#msg5e14880b04adee486b47fbb7)This is by design. There's a \[dedicated room](https://gitter.im/red/help) for learning ;)

SergeyVladivostok

[13:33](#msg5e1488a291129970ca85bf75)

```
>> print a
1 aaa a
>> print a/1
1
>> print a/2
aaa 1 aaa a
>> print a/2/1
aaa
>> print a/2/2
a
```

Why `print a/2` return `aaa 1 aaa a`, and `print a/2/2` return `a`?

[13:34](#msg5e1488fa04adee486b4803a7)Sory

hiiamboris

[13:35](#msg5e148904a1e1504901197be7)http://www.rebol.com/docs/core23/rebolcore-7.html#section-2

SergeyVladivostok

[13:36](#msg5e148959a1e1504901197d5c)i go in dedicated room  
@hiiamboris thanks

## Wednesday 8th January, 2020

cloutiy

[16:43](#msg5e1606ab3679536f962ece97)Hello, i used to have cloud9 ide where i had red installed. But seems since then they moved to different infrastructure and pricing strategy. Is anyone else using red in a (free) cloud ide? Any recommendations? Found it very useful when i had random flashes of genius or ideas i wanted to try out while away from home laptop.

meijeru

[20:15](#msg5e16386c9c13050f1f988521)Latest Red build (including calendar widget) crashes while compiling GUI console on W10. Anyone else?

endo64

[20:23](#msg5e163a4a3679536f96304738)Testing...

[20:24](#msg5e163a69821b826f5a89a444)

```
Compiling compression library...
Compiling Red GUI console...
*** Loading Error: file access error: %calendar.reds
*** in file: %/C/Users/endo/Documents/Red/red/build/bin/modules/view/backends/windows/button.reds
*** at line: 49
```

hiiamboris

[20:25](#msg5e163aaa810a1042cb88e95c)Yep. Just saw this message on W7.

[20:26](#msg5e163af391129970ca91b8e2)build/includes.r missing something ;)

meijeru

[20:29](#msg5e163b92e409da486ce971f9)@9214 We would love to test this new widget!

[21:34](#msg5e164afce0f13b70c954c36f)The FIX worked, am testing it now. It works!

endo64

[22:24](#msg5e1656a9810a1042cb89b0d2)Thanks for the fix @hiiamboris  
Interesting, I got access violation just after re-compiling with the fix, and tested with `view [calendar]`, but now it works.

hiiamboris

[22:32](#msg5e16589191129970ca92743e)could have been wrong libredrt.dll :)

## Thursday 9th January, 2020

greggirwin

[04:32](#msg5e16acf4e0f13b70c9574d4e)This is a Red language channel, not Crystal.

pekr

[06:59](#msg5e16cf61e409da486ced355a)What's with Crystal? Can't see any related messages :-)

spTorin

[07:06](#msg5e16d0f4e409da486ced3fe6)I'm delete it, just miss chat. Sorry.

pekr

[07:08](#msg5e16d1563679536f9634157c)Ok

greggirwin

[09:32](#msg5e16f31a810a1042cb8d9dd8)Happens to all of us @spTorin.

ldci

[12:45](#msg5e172084e0f13b70c95a64bf)https://github.com/ldci/redCV  
redCV Update JANUARY 9 2020  
Most of functions are now defined as routines for a faster image processing and redCV is now modular. This means, that you can use only required libraries for your code and not all redCV library. This modular organization reduces compilation duration, reduces the size of the executable application and, helps in maintaining redCV.

GiuseppeChillemi

[12:47](#msg5e1720f191129970ca9797a1)@ldci 👍

hiiamboris

[12:51](#msg5e1721b45597551890498d0d)Some files do not get proper linefeed translation: https://github.com/ldci/redCV/blob/master/samples/image\_contours/imagecontour.red

ldci

[13:09](#msg5e17261ee52f635378aeaa7a)@hiiamboris Thanks, I'll check ASAP

hiiamboris

[13:39](#msg5e172d08a74ac853777d07a6)@ldci have you considered patching Red runtime and building a GUI console that includes all of redCV, so you won't have to compile scripts?

ldci

[14:57](#msg5e173f6ca74ac853777d8fa4)@hiiamboris linefeed translation done, repo updated. If you're interested for building GUI console including redCV, you're welcome :)

## Friday 10th January, 2020

pekr

[06:44](#msg5e181d36e409da486cf68481)Is there any way of how to run a Red script in a Gui console, started from a command line, while hiding the console itself?

[08:52](#msg5e183b3ec3950349027491bf)I am not strong with compilation, but tried to compile my small utility. While the script runs OK in console (interpreted), I have difficulcy in getting it compiled. It complains about some undefined words. Well, my code is not surely clean, but here is the problem - I have some helper functions at the beginning of the script, where I refer words, which are set later, once the gui is instantiated. Compiler tells me it is undefined ....

```
emit: func [log] [
   append a/text reduce log
   append a/text newline
]

Compiling C:\!Red\red\instructor.red ...
*** Compilation Error: undefined word a
*** in file: C:\!Red\red\instructor.red
*** near: [a]
```

[08:54](#msg5e183bb2bdcaea18912a58c1)In above example, I have simply created a gui to my script, which printed processed csv files into a console. Instead of that, I redirected it to the area, which is later on being referenced by word `a`inside the View code. Does compiler need to know about the words beforehand?

[09:10](#msg5e183f85e409da486cf768ae)Simply put, I want to reference global words ...

rebolek

[09:13](#msg5e18403de409da486cf76b89)try something like putting `a: none` before your `emit` function

GalenIvanov

[09:20](#msg5e1841e404adee486b61fc29)@pekr I have another problem: the code runs perfectly in the GUI console (started by Rededitor) - reads a .csv file, converts the characters to Win1251 (it's cyrillic), loads the data as csv, extracts several columns and fills additional data, shows a window with simple representation of the data, saves it as .csv (and puts it in the clipboard). Too bad it doesn't do anything when compiled - no window is shown, no .csv is created, no data is copied to the clipboard. I'll start compiling it incrementally by commenting parts of the code to try to find the problem.

rebolek

[09:22](#msg5e184238810a1042cb96c4c2)@GalenIvanov do you compile in console mode so you can see potential error messages?

GalenIvanov

[09:22](#msg5e18425b04adee486b61fe73)@rebolek No, I don't know how to do it.

rebolek

[09:23](#msg5e184289e52f635378b66952)@GalenIvanov you just need to set target to MSDOS (assuming you are on Windows). Add `-t MSDOS` to your build command.

GalenIvanov

[09:24](#msg5e1842daa74ac8537784c79f)@rebolek Yes, I compiled it with `-t Windows`

[09:25](#msg5e1842fc810a1042cb96c84a)Will try with `-t MSDOS`

[09:37](#msg5e1845f0a1e15049013218b9)@rebolek Hmm, `Script Error: load-csv has no value`

[09:38](#msg5e18462a9c13050f1fa6966d)I used also `-e`

rebolek

[09:38](#msg5e18462f0ba7b60f2054d103)@GalenIvanov What are you using for compilation? Stable Red, or are you doing it manually using Rebol?

GalenIvanov

[09:39](#msg5e18465fe52f635378b68691)Stable Red, 26-Sep-2019

rebolek

[09:41](#msg5e1846cf821b826f5a97b273)CSV was added relatively recently, maybe it's not in your version yet.

GalenIvanov

[09:42](#msg5e1846f50ba7b60f2054d604)@rebolek But then how does it work correctly in the console?

rebolek

[09:42](#msg5e18470d04adee486b621e01)I compile using Rebol and latest Git sources, I just tried to compile simple example with `load-csv` and it works.

[09:42](#msg5e18471ae409da486cf7949f)@GalenIvanov hm, that is strange.

[09:43](#msg5e18474009534142ca3fc7b7)@GalenIvanov do you use `-r` also?

[09:43](#msg5e18475d09534142ca3fc919)Maybe you have old version of libRed?

GalenIvanov

[09:44](#msg5e18477991129970ca9f984a)@rebolek Yes, I did. `red-064 -c -r -e -t MSDOS myredfile.red`

rebolek

[09:45](#msg5e1847bb04adee486b622313)you have both `-c` and `-r` there, you should use just one of them (try `r` only)

GalenIvanov

[09:46](#msg5e18480004adee486b622574)@rebolek I feel stupid...

rebolek

[09:47](#msg5e184828559755189051b4c2)Don't feel, if you'd see my mistakes...

pekr

[10:37](#msg5e1853f09c13050f1fa70c46)So I have managed to compile my code - rearranged it so that the words are defined at the right time ....

[10:38](#msg5e185430810a1042cb97448d)As for compilation, I prefer using rebol placed in the red directory and calling: `do/args %red.r "-r -t Windows %my-script.red"`

[10:39](#msg5e1854619c13050f1fa7102c)That way I can compile from actual sources, being downloaded via a Github Desktop

GalenIvanov

[11:11](#msg5e185be309534142ca405e54) @rebolek I said I feel stupid and it's still true - it turned out that I was trying to compile the source with a different, older instance of Red. Now everything is fine.

rebolek

[11:40](#msg5e1862a33679536f963f1778)@GalenIvanov :) great to know it works fine now!

GiuseppeChillemi

[22:10](#msg5e18f64904adee486b6737aa)A big thank you to @9214 for the new parse documentation.

## Saturday 11st January, 2020

rebolek

[11:25](#msg5e19b0913254b6754c8cc58a)`random` doesn't support `binary!`?

```
>> random #{FF}
== #{FF}
>> random #{FF}
== #{FF}
>> random #{FF}
== #{FF}
```

hiiamboris

[11:44](#msg5e19b52365badf754d6cafc5)

```
>> random #{010203}
== #{020103}
```

[11:44](#msg5e19b5293254b6754c8ce67a)byte-reordering

rebolek

[11:46](#msg5e19b58d1cf5106b35011922)Ah, ok. Thanks.

## Sunday 12nd January, 2020

btiffin

[00:42](#msg5e1a6b830e65654fa0c9b57e)@rebolek, mostly.

Just tried the pre-builds for linux-gui-200110. Nice.

Except, there is no \_save-cfg defined, and `q` craps out, doesn't complete. Need to run `quit-return 0` to get out of the console, even for `^D` the `q` function borks. Is there an easy my end of the chain way to add \_save-cfg as a fix?

Excuse the rusty. I've been on a wait for 64bit Red for too long now. Had to start dipping toes again. :-)

To all, seeing Red View on GNU/Linux is somethin' somethin'. Nice. Go Red Go.

Another; not to @rebolok, mostly.

&gt;&gt; a: read http://red-lang.org  
\*\** Access Error: invalid UTF-8 encoding: #{A078D8F7}  
...

Pages like rebol.com work ok, as expected.

Doing a to string! on the red-lang.org read result ends up with a garbage ending once it trips up in the decoder.

Excuse if this is not the right place for bug tickets; there are far more giddy enthusiasms at the moment, than gripes. Visions of 2020. \*Will have to hang out for a while to find out where the Go Go goes to\*. ;-)

Have good, make well

greggirwin

[00:52](#msg5e1a6dc43254b6754c91f9de)Nice to see you @btiffin! What build are you running (use `about/debug`)?

```
>> a: read http://red-lang.org
== {<!DOCTYPE html>^/<html class='v2' dir='ltr' xmlns='http://www.w3.org/1999/xhtml' xmlns:b='http://www.google.com/2005/gml...
```

[00:52](#msg5e1a6de6b720fa5b3cfaf61c)That said, Red doesn't like invalid UTF-8.

btiffin

[00:55](#msg5e1a6e931cf5106b350614ca) \[~]$ redbol  
\--== Red 0.6.4 ==--  
Type HELP for starting information.

&gt;&gt; about  
Red 0.6.4 for Linux built 15-Dec-2019/1:52:15-05:00

&gt;&gt; about/debug  
Looks like this Red binary has been built from source.  
Please download latest build from our website:  
https://www.red-lang.org/download.html  
and try your code on it before submitting an issue.  
&gt;&gt; q  
\*\** Script Error: \_save-cfg has no value  
\*\** Where: do  
\*\** Stack: q

&gt;&gt; quit-return 0

greggirwin

[00:59](#msg5e1a6f736be93b6b36c7bd37)I'll let @rebolek jump in then, as he may be familiar with this from his builds.

btiffin

[00:59](#msg5e1a6f8c0e65654fa0c9d209)From https://rebolek.com/builds/

And sorry, missed Compose mode on a paste. Should be fixed now.

greggirwin

[01:00](#msg5e1a6f9943c3b62d79dc4bec):+1:

btiffin

[01:01](#msg5e1a6feb0e65654fa0c9d4c0)Always nice, @greggirwin

[01:15](#msg5e1a734865badf754d71cc61)Just from a fan boy not wanting to see Red look bad in the eat your own product department... Does someone have the ability to screen red-lang.org from bad UTF-8 from time to time then? Just, so, there isn't a BSOD demo moment, or what not. :-)

[01:23](#msg5e1a74f83254b6754c922947)Weird one, by fluke

[01:24](#msg5e1a756aa859c14fa1cdad2c) &gt;&gt; help !

works

&gt;&gt; source to-string  
&gt;&gt; what  
&gt;&gt; help !

causes

\*\** Runtime Error 1: access violation  
\*\** at: 0808514Bh

[06:19](#msg5e1aba5ca859c14fa1cf6ed1)Just an aside, related to proper names.

Doc? How does it make you feel when people use Redbol as a name? In particular, as the binary, /usr/bin/redbol?

/usr/bin/red is restricted ed, and I doubt there will be any sympathy on using that claimed name in distro repositories.

More to the point, Nenad, you don't see this as a derogatory or misuse of your name choice rights, or anything?

As we live in the age of using the search engine we mistrust the least, pages tagged redbol would keep binging on google a lot more focused. red is swamped in terms of seo, no?

But, don't want to mistreat naming rights, Doc, and those would be your rights. For the now, I'm using `redbol` to unleash all the powers, would rather find out early if it is unwelcomed slang. :-)

Have good

rebolek

[07:36](#msg5e1acc776f604152992814ce)Hi @btiffin , good to see you again! Re: Invalid UTF-8 encoding - my builds are done from unmodified sources, so this shouldn't be some specific error. As @greggirwin pointed out, Red requires UTF-8 text so my suspicion is that this is Google's fault.  
Let me explain - http://red-lang.org runs on Blogger, which is owned by Google and Google is known to not use UTF-8, but codepages. So the easiest thing you can do is use `read/binary` instead and do a manual conversion from binary to string using something like `collect/into [foreach byte binary-data [keep to char! byte]] ""`

pekr

[07:36](#msg5e1acc7b65badf754d73e649)You can use redball then, use an amiga boing ball logo and claim it being an AmigaOs 5.0 :-) But - in the latest blog we have also learned about the Redlake Technologies, so it could be just a Redlake, but my guess is, that change of the Red name is not on the to-do list anytime soon :-)

rebolek

[07:37](#msg5e1acca50aba1f0d801d0aba)Usually I would suggest using `send-request` from my https://github.com/rebolek/red-tools/blob/master/http-tools.red , but I just tried it and there some bug I need to look at :joy:

greggirwin

[07:41](#msg5e1acd968d9f831bc514bcb8)@btiffin we use Redbol when talking about the larger universe of Rebol inspired languages. Red will stay Red, as the only way to avoid naming conflicts is to come up with a random word or spelling. With luck, semantic search will eventually happen and get us out of the dark ages.

pekr

[07:59](#msg5e1ad1cd0e65654fa0cc369a)@greggirwin does Redlake Technologies replaces the FullStack Technologies?

rebolek

[08:29](#msg5e1ad8e63254b6754c947dc8)Hm, it's not `send-request` error, but looks like Red on. Moving to bugs...

greggirwin

[09:06](#msg5e1ae19f1cf5106b3508cc75)@pekr Fullstack is HQ'd in China, Redlake is HQ'd in the U.S. Not a replacement, but an addition.

pekr

[09:13](#msg5e1ae328b990d50d819be609)OK, thanks ...

endo64

[14:19](#msg5e1b2ae90e65654fa0ce9f51)@btiffin https://gitter.im/red/red?at=5e1a74f83254b6754c922947 No issue here, on Win10 with latest daily build.

dockimbel

[17:44](#msg5e1b5b1a43c3b62d79e28b13)@btiffin  
&gt; /usr/bin/red is restricted ed, and I doubt there will be any sympathy on using that claimed name in distro repositories.

`ed` is a relic from the early Unix days. It was obsolete already in 1993 when I started using Unix systems. `/usr/bin/red` is a two-line bash script on `ed`:

```
bindir=`echo "$0" | sed -e 's,[^/]*$,,'`
exec "${bindir}"ed --restricted "$@"
```

I expect Linux distro maintainers to drop such old tools at some point, and free the namespace for modern tools.

[17:50](#msg5e1b5c636f604152992bfbfd)&gt; red is swamped in terms of seo, no?

Do you have any issue finding relevant content for C, D, Go,...? No. Therefore this is a non-issue. Moreover, in these still early days for Red, pretty much all the important content can be easily reached from the red-lang.org pages, so your statement is pointless.

[17:51](#msg5e1b5cb0dbacf55b3df5e658)@btiffin BTW, where are the hundreds of new users for Red you promised me if I gave you the `load-any` feature? ;-)

pekr

[17:52](#msg5e1b5cc71cf5106b350c2e04)Ha, I thought it would come :-)

[17:53](#msg5e1b5d2a43c3b62d79e29d6d)@Dockimbel - what could be achieved by having Lexer callback functionality, any example?

GiuseppeChillemi

[18:32](#msg5e1b663065badf754d781c8d)@btiffin FYI, you are not the only one who experienced a low number of search engine results and proposed a name change. :point\_up: \[November 20, 2019 10:49 AM](https://gitter.im/red/red?at=5dd50c130bb46a64a5eed5c1) Doc has expressed against it multiple times. While strongly maintaining my opinion and suggestion, I will remain silent on this topic in RED/RED apart from this message. We could continue it on RED/CHIT-CHAT just to mutually help each other finding results. Here Is a link to a (removed) \[FAQ article](https://github.com/red/red/wiki/%5BDOC%5D-FAQ/118381c50ad0e76277148f655fd60f9266c12f09#searching-for-red-documentation-and-sites-on-the-web) which will be the most basic help in your searches

giesse

[19:03](#msg5e1b6d7b6be93b6b36ce648d)@dockimbel  
&gt; I expect Linux distro maintainers to drop such old tools at some point, and free the namespace for modern tools.

LOL. That will never happen. :)

dockimbel

[19:11](#msg5e1b6f4a65badf754d786411)@giesse I wouldn't be that certain, old bearded maintainers are not immortal, new generations are coming and they don't carry with them the weight of the past. ;-)

[19:12](#msg5e1b6fb50aba1f0d80218349)@pekr I am writing a short doc for that right now. I might add examples there or keep them for the next release article.

pekr

[19:52](#msg5e1b790143c3b62d79e37416)Cool, thanks, was just curious ... will happily wait, as I most probably will not be able to utilise it myself anyway ... but ....

btiffin

[19:56](#msg5e1b79f8a859c14fa1d48af7)Hey @dockimbel, so nice. And just to clarify, I'm more than ok with Red the language as a name. I was more curious if the term \*redbol* was ok to fling around? Which \*would* be a more specific search term to use while binging on the ducks of google land. Seems people have done a pretty good job at keeping Red resources easy-ish to find, \*red lang* works. But, redbol is growing on me, so that term may slip out from this seat from time to time, when I mean "the binary that runs Red".

On the load-any... I've been a bad REBOL for quite a few years now, Nenad. Ignoring all the sweetness. That state of mind changed with the ease of the @rebolek builds and View on GNU/Linux. So. My fist question to was going to be

Does anyone remember when Doc discussed some code to allow non lexed data for loading into a block? I wrote notes, and lost the notes. Where do I find that code fragment again? :-)

No thousands yet, Doc, seeing as I never spent any minutes demonstrating the use cases since we last talked. A situation that should change over the next few days.

[19:59](#msg5e1b7aa86be93b6b36cecd2a)@giesse @pekr, long time, nice to see the old guard still guarding.

pekr

[20:03](#msg5e1b7b87b720fa5b3c022b77)Brian - how you stick around for quite some time. Don't forget that Red is supposed to be a fun too :-)

btiffin

[20:06](#msg5e1b7c366be93b6b36ced959)Too much fun, Petr. Need to get serious at least a few minutes a year to advance some flag posts. :-) Lots of back fill learning in the days ahead. So many features.

[20:11](#msg5e1b7d76b990d50d81a033ac)@dockimbel, Careful who you call old beards. :-) I work on the COBOL Standards committee now. Anyone under 50 is treated with suspicion, too young to \*get it\*.

pekr

[20:12](#msg5e1b7db8a859c14fa1d4a295):-)

greggirwin

[20:12](#msg5e1b7dbab990d50d81a034f8)@btiffin check out `load/trap` .

[20:15](#msg5e1b7e48b720fa5b3c023fc8)From the blog:  
&gt; Instead of raising an error, load/trap will just stop and return a block made of:  
\- a block of successfully loaded values.  
\- the input string at the position where the lexer failed.  
\- an error! value (or none! value if the tail of the string has been reached).

[20:16](#msg5e1b7e800e65654fa0d111cb)https://github.com/red/red/wiki/%5BDOC%5D-Guru-Meditations#using-load-with-next-and-trap

btiffin

[20:17](#msg5e1b7ebd65badf754d78c643)And a moment of seriousness with how life works. The chairperson for this round of COBOL 202x was the youngest person in the committee. Passed away in November from heart complications. We miss Chris. A reminder to grab horns, ride bull.

greggirwin

[20:19](#msg5e1b7f596f604152992d0a5f)

```
>> s: "This is a 1A mess  of )( input"
== "This is a 1A mess  of )( input"
>> set [v p e] load/trap s
== [[This is a] "1A mess  of )( input" make error! [
    code: 200
    type: 'syntax
    id: 'invalid
    arg1: integer!
  ...
>> set [vv pp ee] load/trap find p #" "
== [[mess of] "( input" make error! [
    code: 201
    type: 'syntax
    id: 'missing
    arg1: #"("
    arg2: ")( input"
...
```

[20:19](#msg5e1b7f693254b6754c991b9a)Stay ahead of the wolves.

[20:20](#msg5e1b7f8b8d9f831bc5197a11)Happy to see your virtual face again @btiffin.

btiffin

[20:24](#msg5e1b80861cf5106b350d32f6)Thanks for the links, @greggirwin. Details starting to flood back in. A task is at hand. ;-)

[20:41](#msg5e1b847e6f604152992d2f49)Excuse the off topic: @greggirwin. You met Clinton Jeffery? I got named \*Documentarian Extraordinaire* in the Unicon Citizen list, and all I really did was rehash old docs into a Sphinx based book. Now to just keep up the facade of pretending to know things... :-)

greggirwin

[20:51](#msg5e1b86dddbacf55b3df70fa9)I haven't met him, but exchanged some emails. We're working on a product we hope can be used in CS programs. It's a small world.

btiffin

[21:06](#msg5e1b8a660e65654fa0d1614d)Nice.

cloutiy

[21:07](#msg5e1b8a798d9f831bc519c44a)brian is omniscient and omnipresent

greggirwin

[21:09](#msg5e1b8b01b990d50d81a09240)There's a fisherman joke in there...

btiffin

[21:09](#msg5e1b8b1a1cf5106b350d79f1)Yves! @cloutiy I think that might be because we both find the best tech to get curious about. :-)

dockimbel

[21:12](#msg5e1b8bc665badf754d792724)@btiffin  
&gt; @dockimbel, Careful who you call old beards. :-) I work on the COBOL Standards committee now. Anyone under 50 is treated with suspicion, too young to \*get it\*.

Congrats! 8-) I should join the 50+ club quite soon too. Any spoilers about the future of COBOL?

btiffin

[21:14](#msg5e1b8c3db720fa5b3c02a455)@endo64, Yeah, Semseddin, I can't reproduce the seg fault today. Same binary. I'll rack it up as a problem between chair and keyboard for now.

dockimbel

[21:17](#msg5e1b8cdb0e65654fa0d16f16)@greggirwin I am not sure about the future of `load/trap` given the new lexer capabilities.

btiffin

[21:17](#msg5e1b8cf7dbacf55b3df73c4b)Well, Doc. We might be getting datetime, and I could not convince the current Working Group to consider crypto currency for this round. We modernize COBOL verrryyy slllooowwly it seems. :-)

greggirwin

[21:17](#msg5e1b8d0165badf754d792f0b)Meaning the new lexer will make it obsolete?

dockimbel

[21:18](#msg5e1b8d31b720fa5b3c02a62f)@greggirwin It will be trivial to write it as a lexer callback, catching the `error` event and repositioning the input as you see fit. So I'm not sure it is worth maintaining a specific refinement in `load` for that.

greggirwin

[21:18](#msg5e1b8d34a859c14fa1d5110d)@btiffin let us know if you want to generate syntax diagrams for the 202x standard. ;^)

[21:19](#msg5e1b8d710aba1f0d80225fab)I don't imagine it will break much code if changed at this point. If they do the same thing, and are equally easy to use, we don't need both.

dockimbel

[21:20](#msg5e1b8d9265540a529a0694e3)@btiffin Do you see any opportunity to plug Red into COBOL in any useful way? With LibRed, it should be easy to achieve. Also a COBOL to Red compiler should be pretty doable too if there's a market for that.

btiffin

[21:23](#msg5e1b8e4c1cf5106b350d8f6b)@greggirwin. I do generate diagrams, Gregg. I use the tool Richard Hipp developed for SQLite, a Tcl/Tk script with a little ImageMagick post processing. Discussed a little bit, here: https://sourceforge.net/p/open-cobol/discussion/lounge/thread/2de0f1b7/#7918

If there is a Red tool that can compete. please let me know.

greggirwin

[21:26](#msg5e1b8f180e65654fa0d17e94)Now you know. :^)

btiffin

[21:34](#msg5e1b90d743c3b62d79e4156a)@dockimbel. :-)

I absolutely see an opportunity. My mistake was waiting too patiently for 64bit Red, instead of digging in. ;-)

I'm working on a thing I call FLI COBOL, Foreign Language Intrinsics. So far, prototypes for FUNCTION PYTHON, FUNCTION REXX, FUNCTION LUA, FUNCTION JVM, and FUNCTION TCL are in testing. FUNCTION RED is on the plate. Some early trials hinted at at https://sourceforge.net/p/open-cobol/discussion/cobol/thread/76b86442/#1464/a75a

(When you build two or more scripting intrinsics into a cobc build, you get to call it Super FLI COBOL) :-)

## Monday 13th January, 2020

rebolek

[09:26](#msg5e1c37b5dbacf55b3dfb9a82)I've added TAR and ZIP un/packers to \[Red tools](https://github.com/rebolek/red-tools). Both files provide four functions:  
`make-tar` and `make-zip` accept file or block of files and return `binary!` archive  
`load-tar` and `load-zip` accpet `binary!` archive and return `map!` of files (filename as key, binary content as value)  
`tar` and `zip` have two arguments, filename of archive and file or block of files to archive  
`untar` and `unzip` have one argument, filename of archive to unpack. Unpacking is done into current directory.

planetsizecpu

[09:28](#msg5e1c38556f6041529931bac7)Wow useful @rebolek good job!

rebolek

[09:29](#msg5e1c388565540a529a0af3c1)@planetsizecpu thanks! There may still be some bugs, so use with care and report potential problems.

planetsizecpu

[09:53](#msg5e1c3e0b6be93b6b36d3c108)Ok, I will try when time permits. 😉

## Tuesday 14th January, 2020

loziniak

[10:35](#msg5e1d99776f604152993b3af4)@dockimbel @btiffin @greggirwin probably I'm not in a position in this hierarchical world of Red to speak about this, but you remember about chit-chat room, right?

greggirwin

[19:12](#msg5e1e12acb990d50d81b1df61)Thanks @loziniak. We're all subject to conversation continuity. :^\\

## Wednesday 15th January, 2020

henrikmk

[08:05](#msg5e1ec7bb94656d7d57041de8)@rebolek wonderful :-)

## Thursday 16th January, 2020

nivpgir

[13:41](#msg5e20681aa50f33623f48cc24)hi all

[13:42](#msg5e20682cdd1429262d361948)I'm trying to start playing with red to see if it fits my wants

[13:42](#msg5e2068474c1f9679ecf7bdb8)the documentation seems a bit messy so I thought I would come ask here about something

[13:44](#msg5e2068d95b81ab262e379327)I want to read a url but access to that path requires a header , in bash, using curl i would do:

```
curl https://some.url.io/api/command -H 'Authorization: key 1234567899'
```

and that would give me a string representing a json.  
how do i do something like that from red?

rebolek

[14:08](#msg5e206e67000f497899084640)Hi @nivpgir !  
You need to use `write/info` for that:

```
>> write/info http://some.url [GET [Authorization: "1234"]]
```

or you can use `send-request` from my \[http-tools](https://github.com/rebolek/red-tools/blob/master/http-tools.red), that makes it bit easier and has built-in support for things like authentication:

```
send-request/with http://some.url 'GET [Authorization: "1234"]
```

If you have other questions, feel free to ask!

greggirwin

[23:43](#msg5e20f532ea55e3623e6885c1)We have some URL related chat in red/bugs, which reminded me of https://github.com/red/red/issues/3571. Does anyone want to take a crack at that?

## Friday 17th January, 2020

btiffin

[02:56](#msg5e212251a1dfaa3ba13162c8)&gt; I am not sure about the future of load/trap given the new lexer capabilities. @dockimbel

Yeah, this isn't going to plan yet. ;-)

s: "; comments trip things up?"

What should the expected v be? I'm getting empties and no advancing of pos when load nexting and trapping semi-colons.

Excuse the forever of this Nenad, but I'm pretty sure that a load/any with Red doing it's best to load tokens and converting what it can't to binary! or special! or poop!, or you know, an S word I didn't use. ;-)

Even Carl has mentioned interest from those in the humanities and data munging crowd. Getting a random text into Red blocks, and sets in particular, to let non programmers in computable fields have a go at mashing from an interactive console. Let people manually prune out the fragments of the text that create poop (in the loadable block trees), and then let them have at some sums and sorts. Inside reactors, which are pretty capable CLI spreadsheets, right? Hand some power to the people, and allow some fuzz, that can be refined in the tool, but not abort an initial load attempt. Feels doable, with little risk of weakening purposely crafted source code. (see note following)

Forever, Go Doc Go. :-)

And, will admit Doc, and @greggirwin and et al, parse and the Red lexer nuances?... from this seat; a whoosh barely heard, so far over head. ;-)

Have good, make well

[03:16](#msg5e2127155cd7964660634aad)(can't edit out an it's for an its, up there. its best and it is best, for Red maybe that's interchangeable) ;-)

[03:20](#msg5e21280ba1dfaa3ba1318279)&gt; remember about chit-chat room, right?

Oops, umm, not really? Been a while, where's the chat at? @loziniak, et al.

[03:28](#msg5e2129f08e073f465f058e2b)Nevermind, found the search

giesse

[05:57](#msg5e214cdda1dfaa3ba1326c37)@btiffin you have to realize that `load` cannot be magic. The only solution to the general problem of parsing random data is... `parse`.

dockimbel

[16:53](#msg5e21e677a1dfaa3ba136a366)@btiffin  
&gt; s: "; comments trip things up?"  
&gt; What should the expected v be? I'm getting empties and no advancing of pos when load nexting and trapping semi-colons.

That snippet loads fine using simply `load`. I don't know what code you used to parse it, so I can't say anything more than that on this specific case.

`load/any` was given to you a while ago (the source code should be in the history of this group).

&gt; Red doing it's best to load tokens

In order to parse something, you need grammar rules. "doing its best" means nothing until you provide a complete set of rules to describe the grammar you want to support. There are no specific set of grammar rules that can parse random input and extract meaningful information from it. That is mathematically impossible, and we had that discussion in the past several times already.  
You need specific rules to parse a given class of input data, so you need to define such rules each time you encounter a new class. There is no algorithm for that, it needs to be defined by a human each time... hence `parse` is your friend, as @giesse said. ;-)

greggirwin

[19:45](#msg5e220ec4000f49789913bad5)May need Bolek's Gritter to find `load/any`. I did find a `load-safe` in my notes here, credited to @endo64:

```
load-safe: function ["Loads all values, convert unloadable values to string" value] [
    ws: charset " ^-^/^M^(00A0)"
    r: load/trap value
    while [error? r/3] [
        ;Stringfy the unloadable value
        either pos: find insert r/2 {"} ws [insert pos {"}] [append r/2 {"}]
        r: load/trap/into r/2 r/1
    ]
    r/1
]

>> load "a 1k b 2xx4"
*** Syntax Error: invalid integer! at "1k b 2xx4"

>> load-safe "a 1k b 2xx4"
== [a "1k" b "2xx4"]
```

dockimbel

[21:24](#msg5e2226104c1f9679ec03e7fc)Here is `load-any`: https://gist.github.com/dockimbel/bffe92eb070b24f5573b677589a94591

greggirwin

[22:17](#msg5e2232790dbd9379ed538e18)Thanks!

## Saturday 18th January, 2020

luce80

[16:10](#msg5e232df04c1f9679ec0a6eb1):point\_up: \[January 12, 2020 10:23 PM](https://gitter.im/red/red?at=5e1b8e4c1cf5106b350d8f6b) This should be a nice "side-project" for @toomasv :)

toomasv

[17:54](#msg5e23463b8e073f465f13a42e)@btiffin How do you like this:

[17:54](#msg5e23464a4c1f9679ec0b113c)\[!\[cobol.png](https://files.gitter.im/red/red/bItu/thumb/cobol.png)](https://files.gitter.im/red/red/bItu/cobol.png)

[18:03](#msg5e23487a7148837898994d1f)@luce80 :smile:

[18:15](#msg5e234b52dd1429262d499f5a)@btiffin Here is grammar:

```
comment-syntax: [
   [start | newline] 
	"6-spaces" "*" any anything-except-newline
   [newline | end-of-input]
|  "*>" any anything-except-newline
   [newline | end-of-input]
]
cobol-program: [
   opt [
      identification-division
      opt environment-division
      opt data-division
      procedure-division
   ]
]
cobol-statement: [
   opt [
    accept-statement
    |    add-statement
    |    allocate-statement
    |    call-statement
    |    cancel-statement
    |    close-statement
    |    compute-statement
    |    continue-statement
    |    delete-statement
    |    display-statement
    |    divide-statement
    |    evaluate-statement
    |    exit-statement
    |    free-statement
    |    generate-statement
    |    go-statement
    |    goback-statement
    |    if-statement
    |    initialize-statement
    |    initiate-statement
    |    inspect-statement
    |    invoke-statement
    |    merge-statement
    |    move-statement
    |    multiply-statement
    |    open-statement
    |    perform-statement
    |    raise-statement
    |    read-statement
    |    release-statement
    |    resume-statement
    |    return-statement
    |    rewrite-statement
    |    search-statement
    |    set-statement
    |    sort-statement
    |    start-statement
    |    stop-statement
    |    string-statement
    |    subtract-statement
    |    suppress-statement
    |    terminate-statement
    |    transform-statement
    |    unlock-statement
    |    unstring-statement
    |    use-statement
    |    validate-statement
    |    write-statement
    ]
]
```

btiffin

[22:21](#msg5e2384e6a1dfaa3ba1415609)Like. @toomasv I'm eventually going to have to update the entire collection of diagrams for the GnuCOBOL FAQ (and add a few rail diagrams that are missing). So, yeah. One thing I tweaked with Richard Hipp's code was the ability to gray out non-standard extensions; for instance, the `transform-statement` is supported by GnuCOBOL but not in the spec, so I used an initial character in the token (+, -, = etc) to manage the text fonts and box/bubble styles (and colour control should be possible too). I haven't really documented the DSL Richard uses, but the Tcl bubble diagram engine supports `line`, `stack`, `indentstack`, `rightstack`, `toploop`, `or`, `opt`, `optx`, `loop`, `optloop` and `tailbranch` keywords. Should I plan to make another pass and go Red instead of Tcl? I'd be proud to advertise these diagrams as `Made in Red`. Some of the diagrams get fairly hairy, ala https://open-cobol.sourceforge.io/faq/index.html#inspect Ending with Nice!

[22:32](#msg5e238760000f4978991d83e5)Not quite ready to demo a load-any. The current samples trip up on things like semi-colon comments, paren! and block! markers, so I started with Carl's older REBOL parser in 10 lines with pretty print cookbook entry, and capturing outliers from `try` of `load/next`. Getting close to being able to show off what I've meant all these years, and how `load-any read %dataset.dat` might attract some technical but primarily non-programmer types. Many thanks to @greggirwin and @dockimbel for putting up with the "Mount Splashmore" (a Simpson's reference), and to @giesse for keeping it real. ;-) Well, and to @Oldes who I think it was, who posted code to Altme way back in the day when this whole idea started fermenting.

[23:08](#msg5e2390078e073f465f159e6e)Oh, and a question on Red naming conventions. Current `load-any` function is starting to find need of refinements. I'm using the pretty print capture (as string!) intermediates and may or may not want to explicitly `load` the result of that. I'm using /preload to skip the final block loading step, which might be a poor choice of word (/preload that is). And I'd like to add an optional count of the number of out-of-band entries, so /count 'word ? Or /errors or ... ?

GiuseppeChillemi

[23:10](#msg5e239080ad195a0f67309577)@btiffin do you know Toomas has created a nice diagram dialect for VID ?

[23:23](#msg5e23936a8e073f465f15b3e5)Don't you think `a/b` would be more appropriate because `a//b` is not a valid syntax ?

```
>> to-path [a /b]
== a//b
>>
```

## Sunday 19th January, 2020

btiffin

[00:13](#msg5e239f40a1dfaa3ba1420fad)Sorry, @GiuseppeChillemi all those examples assume load-any/preload load-any/errors stuff 'errcount etc. I'm a diehard rebol, everyone in the world knows that text starting with a slash is a `refinement!`. Or they will, someday. ;-)

GiuseppeChillemi

[00:35](#msg5e23a46fc7647778a5e9311d)My question is detached from your discussion.

btiffin

[00:36](#msg5e23a4974c1f9679ec0d924f)Starting to look at Red diagrams, seems View/GTK does not like drop-list with a block of file! data. That's just an off the cuff comment, but I'll add an @toomasv. Changing the block items with to string! worked much better for examples/examples.red I assume the real place for this chatter is some other Red gitter room?

[00:37](#msg5e23a4c1ea55e3623e7aa114)Sorry, @GiuseppeChillemi Will pay more attention before reacting to messages. ;-)

toomasv

[05:40](#msg5e23ebea20d0f078a6a25d41)@btiffin Thanks! I understand that basically these keywords describe the steps to build diagram, right?  
(Ah, yes, for GTK notes please visit red/GTK room.)

[06:09](#msg5e23f2b7dd1429262d4e2b93)These SQLite diagrams are pretty nifty, yes. But ours can be nifty too :) Here is example of exploring the `date-rule` from Red's old lexer:  
\[!\[date-rule](https://toomasv.red/images/Railroad/exploring.gif)](https://toomasv.red/images/Railroad/exploring.gif)

BeardPower

[13:19](#msg5e245765ad195a0f6735c790)@toomasv Very nice!

planetsizecpu

[14:17](#msg5e2464ff3ea53f0f664ebc5a)Good job @toomasv push hard!

[14:23](#msg5e2466447148837898a0e462)@btiffin I loved COBOL good to know still being mantained

zeroexcuses

[16:56](#msg5e248a204c1f9679ec1380f5)Is Red GC or ref-counted? Does it support RAII / predictable destructors / finalizers ?

hiiamboris

[16:58](#msg5e248acda50f33623f653788)simple tracing GC for now

[16:59](#msg5e248addc7647778a5ef5c5d)https://www.red-lang.org/2018/12/064-simple-gc-and-pure-red-gui-console.html

zeroexcuses

[17:01](#msg5e248b590dbd9379ed633226)@hiiamboris : Thanks for the linke, so this means no RAII / predictable destructors ?

[17:03](#msg5e248bd3ad195a0f67374f11)According to wikipedia: By version 0.6.4 Red includes a garbage collector "the Simple GC".\[1]

So if we go before 0.6.4, we can get a non-GC version of Red ?

hiiamboris

[17:04](#msg5e248c23c7647778a5ef661f)Yes, before 0.6.4 - not collected. But you can use `recycle/off` to switch it off in 0.6.4.  
And no, no RAII

zeroexcuses

[17:05](#msg5e248c4f0dbd9379ed633622)Does Red "objercts/classes" have a notion of C++ destructors of Rust Drop?

[17:06](#msg5e248c78a50f33623f653faf)(I'm looking for a "scripting/glue" language for a large Rust codebase, and trying to see how the language semantics match.)

hiiamboris

[17:07](#msg5e248cbb8e073f465f1c4a63)Redbol langs are not aiming to be object-oriented, so objects are kept very simple (at least in the current state of things). Think key/value tables.

zeroexcuses

[17:08](#msg5e248cfcea55e3623e80d982)Got it. I'm reading that Red has it's own toolchain (&lt; 1MB !) and doesn't use external code generators. Does it run on WASM32 ?

hiiamboris

[17:16](#msg5e248f0020d0f078a6a6a2bc)On OS API

[20:08](#msg5e24b73020d0f078a6a7a614)@zeroexcuses regarding RAII, it's a only huge fuss in languages boasting for their complexity. In Red, every feature can be written yourself with ease. Like a week ago, I reinvented something in D style in just a few strings, that worked like this:

```
scope [
    w: view [...some windows...]       ;) window is something I'd like to close upon leaving the scope
    leaving [unview/only w]            ;) scope guard that closes it
    ... rest of the code that uses window w ...
]
```

endo64

[21:47](#msg5e24ce8d5cd79646607c5550)`load/trap` points different positions of input for different types of errors.

```
load/trap {"test}
; == [[] {"test} make error! [ ;invalid value. Points to the first char.
load/trap "{test"
; == [[] "t" make error! [ ;invalid string!. Points to the last char.
load/trap "[test"
; == [[] "test" make error! [ ;missing #"]". Points to the second char.
load/trap "3x"
; == [[] "3x" make error! [ ;invalid pair!
load/trap "3b"
; == [[] "3b" make error! [ ;invalid integer!
```

dockimbel

[21:59](#msg5e24d14fdd1429262d5415bc)@endo64 The new lexer is more accurate for that. Though no `/trap` support for now, you would have to use a lexer event handler instead.

## Tuesday 21st January, 2020

DideC

[08:27](#msg5e26b5e93b40ea043c765395)Hi all,  
I remember there was an OpenSSL binding done for Red? I'm unable to find it (google).  
May be I'm confuse, was it only for Curl?  
My real needs is to use OpenSSL from Rebol (I need to do HMAC-SHA-256 from a Rebol CGI), but it would be easier to start coding from a Red binding, if any.  
I can use `call` of Openssl command, but I suppose that library binding would be faster (dunno ?)

rebolek

[09:12](#msg5e26c08d62d24d60f1fb38a1)@DideC You can do HMAC SHA256 in Red, `checksum/with data 'sha256 key`

dockimbel

[11:23](#msg5e26df45364db33faa08aabb)@DideC I don't remember any previous OpenSSL binding for Red. The only one we have is in the 0.7.0 dev branch for the official async networking support as backend on non-Windows platforms. Pre-0.7.0 does rely on libCurl for networking on Linux. Maybe another option in your case would be to use a SSL tunnel proxy rather (like `stunnel`)?

[11:34](#msg5e26e1d2075a19397cdedd99)Here is an \[old R/S binding](https://github.com/kealist/RS-fossil-mirror/blob/master/cURL/cURL.reds) for libCurl if that's useful to you.

pekr

[13:13](#msg5e26f90042ae383fa95ff865)Is my understanding correct, that since 0.7, libcurl is not going to be used anymore?

dockimbel

[13:58](#msg5e2703949797b560f2c4f786)Correct.

DideC

[14:51](#msg5e270fd76ced65043b5977bb)@rebolek @dockimbel Thanks.  
As I said, it is for HMAC SHA256 \*\*with Rebol 2\** ! I need this for a "web server to payment server" signing of HTTP messages.  
The CGI is run by R2. Calling Red for the hashing seems overkill and will be slow, I guess. I can call Openssl command for that.  
But would .SO binding and library call be quickier ? What do you think ?

rebolek

[15:01](#msg5e271267fdee3c74f555a251)Ah sorry, I misunderstood. Binding probably would be faster than `call`, but it seems `call` is fast enough, for signing ~2MB file, I get 0.05sec in console and 0.09sec using `call`.

[15:07](#msg5e27139a342e1054d05b86a9)Red's `call` seems to be faster than R2 one. I get 0.057 sec in Red with same `call`. It’s actually faster than signing with Red’s `checksum`, that takes 0.065 sec :)

## Saturday 25th January, 2020

greggirwin

[18:14](#msg5e2c857ecd53a80aac24f907)We're looking for a couple more testers for our syntax diagramming tool. If you use `parse`, or if you know anyone in other communities who builds languages and DSLs, contact me for details. Needs to be Windows users right now.

GiuseppeChillemi

[18:38](#msg5e2c8b10f85dba0aab141cb0)Do you think it would be possible to use a switch and from there on, the code flow would be passed to a parse statement that will act as interpreter, until an EXIT statement is met?

hiiamboris

[19:25](#msg5e2c961b34829272792977ed)@GiuseppeChillemi it's the craziest thing I've ever heard, congrats on that :) But quite possible indeed. Just make your own evaluator function that switches between `parse` and `do` with some commands.

GiuseppeChillemi

[21:38](#msg5e2cb53df85dba0aab1531e6)@hiiamboris could you provide a starter example? Then I would move on from that. And thanks for the congratulations: being crazy using thing in a very different way than

[21:39](#msg5e2cb57b183449313bd9b83f)intended is a positive quality for me.

[21:39](#msg5e2cb58a183449313bd9b856)\*things

hiiamboris

[21:45](#msg5e2cb6f41a1c2739e3fcc2db)to /help you go ;)

## Sunday 26th January, 2020

ScotSutherland

[02:49](#msg5e2cfe521a883c61960d96ec)@greggirwin Is the Rebol4 AltMe world still working. Can't seem to log in as Scot. Could be I've forgotten my password.

greggirwin

[02:54](#msg5e2cff5534829272792c2be0)Done.

ScotSutherland

[04:31](#msg5e2d162334829272792cc126)Thanks.

gour

[20:03](#msg5e2df08dcd53a80aac2e5108)evening. read a new-year's post - i'm excited seeing that gtk-branch might be ready soon, just wonder what is the status of 64bit support for linux?

endo64

[21:14](#msg5e2e0124183449313be20a70)64bit support is not a priority, it probably won't happen in a short-term.

gour

[22:22](#msg5e2e112d44c076313cefe817)@endo64 ok, although it's a bit strange running 32 bit today... :confused:

greggirwin

[23:41](#msg5e2e23c3a9b30639e2f11745)It's an artifact of being bootstrapped in Rebol2. 32-bit is fine for the vast, vast majority of use cases. But, yes, we'll get there because it's the modern world.

## Monday 27th January, 2020

gour

[05:57](#msg5e2e7bc49ad22d5bd5e8e297)@greggirwin ok, now it's clear...some (Linux) distros are, afaik, dropping their lib32 support., so it would be good

[06:32](#msg5e2e83f3da04a624f48e2a72)how are the terms static-typing &amp; null-safety connected with Red?

[06:33](#msg5e2e84389ad22d5bd5e91a1e)the possibility to use Red even for the desktop and e.g. Android, having GUI DSL in it etc. are certainly very tempting...

loziniak

[09:22](#msg5e2eabbbda04a624f48f34e5) Unless you are talking about Red/System, in Red there is no such thing as null. There is `none!` and `unset!` types, but other types cannot be \*none* or \*unset\*. Although, types are checked only on function call. You can assign any type you want to your variables.

gour

[09:37](#msg5e2eaf3df196225bd666fb5b)@loziniak no, i am thinking about Red, not Red/System which I understand to be for interfacing with the C libs etc....so, considering that "types are checked only on function call" and not during compile-time, can we say that Red is dynamically-typed language, like e.g. Python?

loziniak

[10:05](#msg5e2eb5e601914e3e0457c01c)This will compile, but running will result in error: `Red [] f: function [x [integer!]] [print x] f 12.0`. I don't know Python, but I think you cannot restrict argument types there?

hiiamboris

[10:09](#msg5e2eb6e944c076313cf41688)@gour dynamically-typed, yes.  
Considering how often this is asked, perhaps the kiwipedia article should contain this info.

rebolek

[10:20](#msg5e2eb956dc07667042ff1251)I think this is more complicated in Red.

hiiamboris

[10:25](#msg5e2eba98e177666195d87303)In Red or in it's dialects? :)

rebolek

[10:31](#msg5e2ebbf39ad22d5bd5ea86ee)In Red. It's both interpreted and compiled, types are not check in run-time, but at `load` phase...

hiiamboris

[10:52](#msg5e2ec0d0f196225bd6676c0d)&gt; types are not check in run-time, but at `load` phase...

What do you mean?

rebolek

[10:58](#msg5e2ec251a420263e03a99324)if you have "1 + 1", you `load` it and assign type to each value.

hiiamboris

[11:03](#msg5e2ec3794c3dae24f5f94743)I wouldn't call that type checking though ;)

gour

[11:24](#msg5e2ec873a9b30639e2f56308)hmm, interesting

rebolek

[14:34](#msg5e2ef4e31a883c61961ac61b)@gour @hiiamboris something about \[Types in Red](https://github.com/red/red/wiki/\[DOC]-Type-system) by @9214

hiiamboris

[14:39](#msg5e2ef634cd53a80aac352631)@9214 answers our prayers ;) Nice article!  
I'd change 'one or more lexical forms' to 'zero or more' (unless we are considering runtime construction syntax a lexical form - and even that is not available for some types like `handle!`)

gour

[14:51](#msg5e2ef90044c076313cf5fdfc)@9214 thanks a lot!!

## Tuesday 28th January, 2020

ldci

[12:10](#msg5e3024af594a0517c23c3c35)redCV is 100% compatible with Linux-GTK branch. See https://github.com/ldci/redCV

rebolek

[12:19](#msg5e3026c840da694c5ede2144)@ldci great news! :clap:

greggirwin

[20:07](#msg5e30947e40da694c5ee15d86):+1:

## Wednesday 29th January, 2020

planetsizecpu

[11:08](#msg5e3167aff301780b8343c52f)Go François go!

gour

[13:01](#msg5e3182243aca1e4c5f412b83)@9214 just re-read your \[answer](https://www.reddit.com/r/redlang/comments/aebxct/contrast\_red\_with\_racket/) great info for someone considering Red/Racket. any important issue you would change \*\*today\*\*?

BeardPower

[13:39](#msg5e318b11159413355834fdd4)@9214 More gold, more! ;-)

loziniak

[17:10](#msg5e31bc9658f02e349741da48)Hi! I've found couple bugs recently, that block my work more and more. I already have couple branches in Git that I cannot merge due to Red's bugs. I've spent long hours creating bug reports and finding minimal examples. What is the chance of somebody take a look at them? I know it's open-source and alpha, I'm just asking for an information on project's status, because it's already 3-4 months, when Red development slowed down. Maybe with a little guidance I could try to fix some of these bugs?

greggirwin

[18:07](#msg5e31c9df3aca1e4c5f436f82):point\_up: \[January 29, 2020 6:01 AM](https://gitter.im/red/red?at=5e3182243aca1e4c5f412b83) @gour I'm not @9214, but his answer addresses deeps fundamentals of each language, so I don't know what would change.

[18:10](#msg5e31cab2d9895b17c3af4a9e)@loziniak we deeply appreciate all your efforts, and if you can point to the specific bugs affecting you, maybe @bitbegin can prioritize those.

dockimbel

[19:45](#msg5e31e0daf6945f41ef3bae56)@loziniak  
&gt; because it's already 3-4 months, when Red development slowed down.

The numbers are showing the opposite, so I guess you don't understand how Github works and are only looking at the master branch \[commits](https://github.com/red/red/graphs/commit-activity).

pekr

[19:48](#msg5e31e18540da694c5eeab594)For an end user it is better to watch the red-progress page and / or some contributor's Github branches too. And I can imagine that there might be even some stuff developed in non-public branches :-)

greggirwin

[20:25](#msg5e31ea2240da694c5eeaf1d4)The page @pekr refers to is https://progress.red-lang.org/. And, yes, there is heavy internal work going on right now.

loziniak

[23:03](#msg5e320f323aca1e4c5f455acd)@dockimbel @pekr you're right. I've written this from my needs point of view, and I'm most interested in master and GTK branches. It's up for dispute if a development in a branch can be seen as a development of a whole project. From end user point of view development could be happening more at merge to master.  
@dockimbel your guess is partly right :-)  
@greggirwin @bitbegin it would be awesome, I could help if possible. The bugs are from most important to less: #4227 #4190 #4261 #4251 #4265. Thanks!

## Friday 31st January, 2020

greggirwin

[16:32](#msg5e3456a373ddad4acd836887)&gt; It's up for dispute if a development in a branch can be seen as a development of a whole project. From end user point of view development could be happening more at merge to master.

How can it be disputed? It's fundamental to some DVCS workflows. Consider Linux. Is it not progressing until there's a new distro built, even if tens of thousands of changes have been made in branches?

The distinction may be the term "end user". Git and I are not best friends, so I absolutely understand (and suffer too) that it's not human friendly or obvious. That's why our progress page exists.

vazub

[17:06](#msg5e345e8aea9ba00b84a25d90)&gt; That's why our progress page exists.

BTW, @greggirwin, the progress page is amazing - so helpful. Thanks for setting it up!

greggirwin

[17:10](#msg5e345f97433e1d4039889479)That's @x8x's great work.

vazub

[17:19](#msg5e3461b1594a0517c25ae61b)I mean "you" as the Red Team + community as a whole :)

greggirwin

[17:47](#msg5e346839d9895b17c3c209a7)Yes, just want to make sure credit is given where credit is due.

vazub

[17:59](#msg5e346b18dc52c34ace397146)Fair enough)

x8x

[18:02](#msg5e346bcea2e4890bb6938775)While on the subject, we scan what is on this list https://github.com/red/red/wiki/%5BLINKS%5D-Scripts-collection and list new commits on the progress page, IIRC the original work was done by @luce80 , but it's a long time since nothing has been added. We tried to use github APIs to scan for Red code but it didn't work well, it would require excluding a lot of false results manually. Maybe a better approach would be to have a submission system, but well adding to that list would still be the easiest submission system anyway, so maybe it just need to be known, add your Red code projects to that list if you're happy to make them visible. Or if someone has a great idea, then we really welcome it!

vazub

[18:22](#msg5e34704fea9ba00b84a2ee53)@x8x thanks for sharing this!

hiiamboris

[18:32](#msg5e3472a015941335584a128d)&gt; While on the subject, we scan what is on this list https://github.com/red/red/wiki/%5BLINKS%5D-Scripts-collection and list new commits on the progress page  
&gt; Or if someone has a great idea, then we really welcome it!

@x8x well, it could be less troublesome for the users if they could describe a set of 'roots' to scan in (e.g. github &amp; gitlab homepages, gist homepages) so it could then automatically:  
\- scan those homepages for whole Red projects (i.e. projects with Red scripts inside) and add those as single units  
\- scan gists and projects added individually as roots and list every Red script in those projects (for script collections)

I also believe that checking for a Red header should be enough to tell a positive hit.

vazub

[19:01](#msg5e34799aea9ba00b84a33440)@x8x this request seems to work, if that is what you need `https://api.github.com/legacy/repos/search/Red?language=Red`. More here - https://stackoverflow.com/questions/16417162/github-api-how-to-get-all-repositories-written-in-a-given-language

[19:13](#msg5e347c6df6945f41ef4ea672)also, for newer API, these topics might help:  
https://developer.github.com/v3/search/#search-repositories  
https://developer.github.com/v3/search/#search-topics

Searching by topics would require the authors to put a `red` topic/tag explicitly in the repository head though.  
This seems to work well, but obiously limited to 100 results, if used without privileges:  
https://api.github.com/search/repositories?q=language:red

x8x

[22:36](#msg5e34abd51ba66f2a7ffa9f98)@hiiamboris @vazub Thank you for your feedback! So then, the way forward is to go automated listing. 😃

hiiamboris

[22:37](#msg5e34ac13fe0e6f74e9f4ddda):+1:

## Tuesday 4th February, 2020

ldci

[14:55](#msg5e3985f4594a0517c267c358)redCV February Update: All samples are functional with macOS, Windows 10 and Linux-GTK (https://github.com/ldci/redCV)

endo64

[15:47](#msg5e39920c433e1d403995bdd1)Cool! Thanks @ldci

greggirwin

[18:34](#msg5e39b93a3aca1e4c5f635f66):+1: I hope others will make more use of it, and create visual examples for Red. Great work.

## Wednesday 5th February, 2020

GiuseppeChillemi

[18:32](#msg5e3b0a48433e1d403999ae21)Could I kindly ask to increase the priority for a Money! datatype? I am stuck on Rebol2 for code on financial operations.

[18:33](#msg5e3b0a6b594a0517c26bc7f7)So I think is anyone who needs to use Red for business calculations.

greggirwin

[20:02](#msg5e3b1f3dfe0e6f74e90417dc)You can ask, but it won't have any effect. ;^) You do want to be careful though. R2's money type is subject to floating point issues.

```
>> n: $.1
== $0.10
>> loop 100000 [n: n + $.1]
== $10000.10
>> to decimal! second n
== 10000.1000000188
```

Respectech

[21:03](#msg5e3b2db815941335585ab38c)Just use decimal! and convert to money at the end if necessary.

greggirwin

[21:09](#msg5e3b2ef215941335585ab6ff)R2 decimal is float.

```
>> type? n: .1
== decimal!
>> loop 100000 [n: n + .1]
== 10000.1000000188
```

[21:11](#msg5e3b2f7cdc52c34ace4a4465)R3 decimal is also float, but R3 money gets it right, aside from default formatting. In R3:

```
>> n: $.1
== $0.1

>> loop 100000 [n: n + $.1]
== $10000.1

>> to decimal! n
== 10000.1
```

GiuseppeChillemi

[21:58](#msg5e3b3a74fe0e6f74e90461a9)@greggirwin remaining silent does not causes effects, asking could make some difference. I did not know R2 had those precision problem too. I reason more to ask for its implementation and leave Rebol behind.

[21:58](#msg5e3b3a8b73ddad4acd954720)Hope you will find the time.

[21:58](#msg5e3b3a9615941335585ad49f)(and willingness)

greggirwin

[22:12](#msg5e3b3dbad9895b17c3d33a60)Believe me, I want it too.

GiuseppeChillemi

[22:42](#msg5e3b44ee73ddad4acd955eb4)I believe in all of you developers of Red. I have given this incarnation of Carl's Rebol ideas another chance because you did a great work with them. Otherwise, I would have long gone to walk on phyton and C# fields.

[22:44](#msg5e3b4563fe0e6f74e9047819)Let's wait. You have another couple of years of time to reach 1.0 before I will start thinking about leaving. In the meantime, I will try to help the way I can.

## Thursday 6th February, 2020

vazub

[12:53](#msg5e3c0c6773ddad4acd974480)I have a language design question, that applies both to Red and Rebol. What is the reasoning behind having different words for some similar categories of effects, instead of having one word and specifying those different effects with refinements? For a more concrete example - there are several words for iteration with different parameters. Wouldn't it be more idiomatic in terms of reducing cognitive complexity to have, say, one word, ex. `iterate`, and provide different variation forms with refinements to it? Is there any technical limitation or maybe something else? To be clear, this is not a request or anything - just trying to understand design choice rationale.

loziniak

[12:56](#msg5e3c0ce1fe0e6f74e9065819)I'm seeing it as an attempt to get more natural language feeling.

rebolek

[12:56](#msg5e3c0d063aca1e4c5f696481)Naming functions is hard. Would the hypothetical function `iterate` with X refinements be clearer to users than having current functions?

GiuseppeChillemi

[13:07](#msg5e3c0f8bfe0e6f74e9065f98)@vazub I made myself the same question. Func, Function, Does, Has... are similar and we could have the same FUNC with variations using refinements. A refinement declines a word in different versions but it makes it longer and also refinement could have some computing cost. Also, functions have different arity and arguments datatypes and refinement mechanism could not be good enough to cover the needed combination. Also some arguments could have a different description for their datatypes in other versions, even having similar working compard to other functions.

[13:12](#msg5e3c10a8594a0517c26e48da)It would be easy if we introduce the ability to have a function with different SPECS and/or BODY, using a new notation to indicate a declination: `for`, `for//all`, `for//each` or `for`, `for!all`, `for!each`

Oldes

[13:25](#msg5e3c13dcea9ba00b84b5f3dd)@vazub could you be more specific, when you say: \_.. having different words for some similar categories of effects\_? Just a more concrete example how it is and how it could be.

vazub

[13:39](#msg5e3c16ff40da694c5e0f871d)&gt; @vazub could you be more specific, when you say: \_What is the reasoning behind having different words for some similar categories of effects\_? Just a more concrete example how it is and how it could be.

| current | idea example |  
| --- | --- |  
| loop | for \[number!] \[block!] |  
| forever | for/ever \[block!] |  
| forall | for/all \[word!] \[block!] |  
| foreach | for/each \[word! block!] \[series! map!] \[block!] |  
| while | for/true \[block!] \[block!] |  
| until | for/false \[block!] |  
| repeat | for/count \[word!] \[integer!] \[block!] |

Now, nevermind the use of `for` or other terrible wording, it can be anything else, like the aforementioned `iterate`. Also, I am aware that there is an ordering issue with refinement arguments and body block here and some other inherent issues, but this is just a crude example to my question.

Oldes

[14:03](#msg5e3c1ca215941335585d011d)Fine... and now show me.. how you would make a help system for your versions.. not mentioning.. that it is not possible to have different number of arguments per function.

vazub

[14:08](#msg5e3c1dd115941335585d07cf)@Oldes For what it is worth, I was not doing any design on it yet, so I have no quick answer to your suggestion, other than agreeing this would be challenging from technical standpoint - no denying that, sir! But that is essentially a part to my question - is current state of things defined by technical limitations/challenges or by some other design aspect - like personal preference or clarity or beauty or anything?

rebolek

[14:09](#msg5e3c1e06ea9ba00b84b61a28)It's a bit of everything you mentioned.

Respectech

[15:24](#msg5e3c2f97ea9ba00b84b64992)Your `for example above is a good one. Here is my understanding. When one monolithic function is made for a whole class of functionality, the function becomes bloated and harder to maintain. In addition, it trades more natural words for a less natural approach. Plus, refinements aren't designed to cancel each other out. What would`for/ever/all/each be expected to do? Also, there are often different approaches taken between different words, like `foreach and`forall behave differently internally, on purpose.

[15:25](#msg5e3c2fee6f9d3d34982508e9)And apparently, it isn't possible to edit a gitter posting on mobile. Sorry about that.

Oldes

[15:31](#msg5e3c314b594a0517c26eaf2c)@vazub it is exactly how @rebolek said. It's a bit of everything. It is that current version has natural language beauty, it's performance wise (as using single purpose native is faster than bloated function) and also the ease how to get help in console using for example `help loop`. I really don't know, how you could provide all the information from docstrings of all these mentioned natives, when you would have only one `for` function.

[15:32](#msg5e3c31a96f9d3d3498250c84)Not mentioning that you cannot swap argument types as you do. That is not a way how refinements work.

GiuseppeChillemi

[16:33](#msg5e3c3fd1bfe65274eae3cce9)Having multiple selectable functions for the same word, is the solution that catches all the issues you have raised.  
Just use function in blocks and you can code all the declination of the same word needed. No issues with arity, refinements, help: no issues of any kind !

I have thought about this technique since the beginning of my red experience but I had no skill to implement it.

```
for: reduce [
   'all func [] []
   'each func [] []
   'ever func [] []
  'while func [] []
  'until func [] []
]
```

Try it: (You can even use refinements as you have NO LIMITATIONS)

```
for: reduce [
   'all func [arg1 /ref aref] [print ["all" arg1 attempt [reduce aref]]] 
   'each func [arg] [print ["each" arg]]
]
```

```
>> for/all 1 
all 1 none
>> for/all/ref 1 2
all 1 2
>> for/each 50
each 50
>>
```

That's all !

hiiamboris

[16:41](#msg5e3c41d758f02e349768e165)Beautiful solution ☻ Why a block and not an object though?

GiuseppeChillemi

[16:42](#msg5e3c420cea9ba00b84b687f1)@hiiamboris Because you can extend and shrink it.

pluckyporcupine

[16:42](#msg5e3c42106f9d3d3498254202)hi, so I just finally sat down and started learning Red today. I am going through the re-bol.com tutorial to get the hang of the overall language, as I've read that Red is 95% compatible with Rebol2. is there anywhere that the differences between the two languages are listed? eg. request-pass, request-color, request, and editor are all undefined in Red. I've tried searching through Red by Example, but I'm not finding analogues. when this is the case, should I just assume that there are no analogues?

hiiamboris

[16:44](#msg5e3c4274433e1d40399ce126)@pluckyporcupine some of the advanced widgets/requesters are not implemented yet in Red.

pluckyporcupine

[16:45](#msg5e3c428d594a0517c26eef96)okay, so they're just not there yet. got it. thanks :D

hiiamboris

[16:52](#msg5e3c4447d9895b17c3d5e619)@pluckyporcupine Good decision to start with Rebol documentation. You'll find Red very similar in core parts, while more advanced and less frequently used features will vary significantly (and much friendlier in Red IMO). Be sure to visit our https://gitter.im/red/help room while you're learning ;)

pluckyporcupine

[16:57](#msg5e3c458840da694c5e102261)thanks. done :)

rebolek

[17:02](#msg5e3c46be594a0517c26f00cd)@pluckyporcupine Hi! Great you are learning Red! For the differences see https://github.com/red/red/wiki/%5BDOC%5D-Differences-between-Red-and-Rebol and feel free to ask, we're happy to help!

Respectech

[17:21](#msg5e3c4b2cfe0e6f74e90723ac)@GiuseppeChillemi That is a neat approach. Nice way to think outside the box.

Oldes

[17:23](#msg5e3c4b9415941335585da895)@GiuseppeChillemi have you noticed, that your \_approach_ will be slower than using normal natives? Especially with such a core functions? Not mentioning, that I don't see any reason, why to do it... still consider this:

```
while [true] [ do-something ]
```

more human friendly, than:

```
for/true [true] [ do-something ]
```

... and I'm not a native English speaker.

[17:28](#msg5e3c4cb215941335585dac60)You should at least use `map!` instead of simple `block!`

GiuseppeChillemi

[17:31](#msg5e3c4d593aca1e4c5f6a3b67)@Oldes you are right, we have a drawback but only for high frequency function calls. And yes, I have thought about using `map!`s but I am scared to use them, because I have read words from Doc that functions could not be allowed in future revisions of `map!` datatype.

hiiamboris

[17:33](#msg5e3c4dfd594a0517c26f188c)map will be slower though

Oldes

[17:36](#msg5e3c4eb5433e1d40399d0ec7)Why?

hiiamboris

[17:38](#msg5e3c4f05d9895b17c3d6171b)hash lookup is more computationally intensive than just comparing a few word cells to one another

GiuseppeChillemi

[17:46](#msg5e3c50f9f301780b836dae44)@Respectech Thanks, I have made a lot of work during the last months on this topic, exploring various unusual coding styles for code composition/stacking and other aspects of Red/Rebol coding. It has been a very intense mind journey which has been possible thanks to the help of the Red team.

rebolek

[18:00](#msg5e3c5428bfe65274eae416eb)@hiiamboris is hash lookup going to slowdown Red loops enough to even notice? :-)

hiiamboris

[18:03](#msg5e3c54dfe8a83835591d113a)Depends on what you're doing. But in 99.9% cases I'd say no ;)

rebolek

[18:04](#msg5e3c5548f301780b836db928):-)

vazub

[18:09](#msg5e3c5675d9895b17c3d62ab6)@GiuseppeChillemi aparently, we were wondering the same question)) but you have made quite a progress in researching it, kudos)  
@Respectech @Oldes @rebolek thanks for clarifying!

My personal interest in this topic stems from some frustration with getting around Red documentation for self-learning purposes. Having multiple words here and there makes some sense for me, as it reminds me of Forth, but on the other hand - unless there is some reference vocabulary compilation (like RedByExample), it is not always easy for a newcomer to find what one might need for some specific task. Also, I am initially coming from Go, and I do believe their decision to have one single construct for iteration was a sound one for the sake of simplicity. But I fully understand that Red/bol is different, and does have different design priorities.

GiuseppeChillemi

[18:30](#msg5e3c5b3440da694c5e1069ec)@vazub There are words where the declination via refinement makes sense. I think about `func` where `func/local`, `func/only`, `func/all-locals` have the effect of representing the purpose of the various versions of `func`. I would like them more over `does`, `func`, `has`, `function`, `funct` and so on.  
As rule, when words properly represent their purpose, they should be used in place of the declined form. `Until`and `while` are just an example: you would loose readability with `for/true` or `for/false` but you cold change the base word and `loop/until` and `loop/while` would make sense. But the final test is reading aloud the code on your screen: `until [... a = 10]` makes sentences more readable than `loop/until [... a = 10]`, so I would choose the former version.

Oldes

[20:18](#msg5e3c74a4ea9ba00b84b72ee2)I'm pretty sure you cannot expect such a change. You are free to redefine `func`, `loop` or whatever, but you will probably just broke everything, because some of us, who are using Rebol/Red for years will not rewrite all our code bases just because your taste. Sorry.

greggirwin

[20:55](#msg5e3c7d496f9d3d3498260413)https://github.com/red/REP/blob/master/REPs/rep-0101.adoc

@hiiamboris and I have talked about this quite a bit as well, including `loop /while /until`. There is always room for improvement, but as others have noted, it's hard because...people. The \*great* thing is that Red is the perfect language for experimenting with ideas like this.

I often hold up `round` as an example. Some people wanted separate funcs (`ceil floor trunc ...`), but `round` with refinements won out because it tells you what it does in the name, and the various refinements are truly that. They all round, but in different ways. It also helps with `help`, because those other funcs don't have anything in their name to indicate rounding. We face this issue with `does has` vs `func function`.

The balance between too many granular funcs and too few massively overloaded funcs is always going to be a process of...refinement.

[21:03](#msg5e3c7f3258f02e349769a436):point\_up: \[February 6, 2020 9:42 AM](https://gitter.im/red/red?at=5e3c42106f9d3d3498254202) @pluckyporcupine here are some tinkerings:

\- https://gist.github.com/greggirwin/9cd640ca42bdfd56c5ff4432c4765d2c  
\- https://gist.github.com/toomasv/0a1495870d27a97073c3b94374a2c572  
\- https://gist.github.com/greggirwin/cb2c32d247549e5647fa49dd5eb91d98

GiuseppeChillemi

[21:06](#msg5e3c7fcefe0e6f74e907bc7a)@Oldes I do not want to ask for such a change. Maybe in Red 2.0 or 3.0. But as @greggirwin noted, some functions are better expressed via root-word and refinements, while other functions need standalone words.

Oldes

[21:16](#msg5e3c8244594a0517c26fbeef)@greggirwin I think that it would not hurt to have heavy `round` and \_also_ faster mentioned natives.

greggirwin

[21:18](#msg5e3c82a2594a0517c26fbff5)`Round` is an action now, so should be fast enough. If you need more speed, you're probably in R/S anyway. There is a cost, in cognitive overhead, to having extra funcs.

Oldes

[21:20](#msg5e3c831873ddad4acd98b41a)`round` is action, but still must push 9 values on stack with each call. But I don't think it is a big problem for me now.

## Friday 7th February, 2020

GiuseppeChillemi

[16:37](#msg5e3d9260df1153705e1f767c)I remember a Red Source code (file tree?) navigator. Is it something that exists or just in my head?

hiiamboris

[16:39](#msg5e3d92cb63c15921f465b006)https://github.com/red/red/wiki/\[LINKS]-Projects-showcase-%28links-to-remember%29

GiuseppeChillemi

[16:45](#msg5e3d941719597421f3b576a0)\[!\[image.png](https://files.gitter.im/red/red/5YyX/thumb/image.png)](https://files.gitter.im/red/red/5YyX/image.png)

[16:45](#msg5e3d941b37545d247d265d6c)Bingo !

[16:45](#msg5e3d943737545d247d265e94)@hiiamboris Do you know who is the author?

hiiamboris

[16:46](#msg5e3d944a62e9db4bf784847f)Hmm, I have a guess...

GiuseppeChillemi

[16:46](#msg5e3d944f19597421f3b577a0):-D

## Thursday 13th February, 2020

GiuseppeChillemi

[07:50](#msg5e44ffdb3716b919ba15a26e)I have a simple question. Why there has been to change refinements not used value from `NONE` to `FALSE` ? Which is the advantage?

hiiamboris

[11:55](#msg5e45391562e9db4bf7967968)You must be confusing it with refinement arguments

Oldes

[11:59](#msg5e453a3d37545d247d381c02)@GiuseppeChillemi I think because it just look better.  
In Red:

```
>> f: func[/a][a]  print [f f/a]
false true
```

In Rebol:

```
>> f: func[/a][a]  print [f f/a]
none true
```

As `none` is falsey, there is no difference.

hiiamboris

[12:16](#msg5e453e1962e9db4bf7968712)Ah, change from Rebol... Advantage of `false` - it can be used with `pick`

GiuseppeChillemi

[14:20](#msg5e455b39cd2d737bb0766498)@hiiamboris I remember pick could be used for a special selection form, but I do remember how!

greggirwin

[17:08](#msg5e45829319597421f3c8ad78)

```
>> pick [a b] true
== a
>> pick [a b] false
== b
```

GiuseppeChillemi

[21:51](#msg5e45c4c6b612cc7bb1666206)@greggirwin thanks

Oldes

[22:32](#msg5e45ce75b612cc7bb1667aad)Maybe someone find it useful: \[GitHub-graphql-request.red](https://gist.github.com/Oldes/777fb32915fe2f9dbcd8175c98b1a3c5)

## Friday 14th February, 2020

greggirwin

[00:01](#msg5e45e360f3718e705dfecd91)Thanks @oldes. :+1:

rebolek

[06:14](#msg5e463aaab3023d5025ec5e5f)@Oldes \[Here](https://github.com/rebolek/red-tools/blob/master/apis/github-v4.red)'s GitHub's GraphQL API for Red.

## Sunday 16th February, 2020

greggirwin

[17:53](#msg5e49819ad3507e0fb60ddc57)Coming from red/bugs. @Oldes noted this old behavior:

```
>> append <a> <b>
== <a<b>>
```

`Append/Insert/Change` behavior is tricky. It tripped people up in R2, but may lead to other questions. I hope @meijeru is watching, because he is really good at thinking about big picture consistency. Consider these:

```
>> append "a" <b>
== "a<b>"
>> append "a" "b"
== "ab"
>> append "a" mold "b"
== {a"b"}
>> head change <a> <b>
== <b>
>> head insert <a> <b>
== <<b>a>
```

For tags, the brackets are included, except for `change`. To get them for normal strings, you need to use `mold`. I think consistency would be better there. But why does it happen? Because of how `form` works for tags. This was clearly done for Rebol compatibility, and if we change it, we break old code. I don't know how much relies on it, but I will guess not much.

```
>> form <b>
== "<b>"
>> head insert <a> form <b>
== <<b>a>
```

How you get around that today is not great:

```
>> head insert <a> as string! <b>
== <ba>
```

Of course, the current `form` behavior makes sense. The user-friendly version of a tag is still a tag.

`Append` doesn't say it `form`s the value if the series is a string, but we all learn that pretty quick. There is no rule to say it \*has to* do strictly that though. There are conflicting consistencies at play.

We could \*almost* get tricky and say `/only` with strings includes quotes/brackets, but it's no shorter than `mold`, and is then inconsistent with `mold/only` on blocks which \*excludes* the brackets.

It \*may* be as simple as adding a check for tags \[here](https://github.com/red/red/blob/master/runtime/datatypes/string.reds#L2273) to change this, and then you would need to use `mold`, as with strings, to get the brackets.

Thoughts?

hiiamboris

[17:59](#msg5e49830bb401eb68a57fa198)I can't remember using tags even once, can't say about including or not decorations. But `change` should work as `remove/part` + `insert`, not be an outlier, else it's an ill design IMO.

greggirwin

[18:11](#msg5e4985d1d56ddb68a4ab8237)I haven't used tags much historically, having been lucky enough not to need to generate markup too often. Of course, people can always use "&lt;fake tag&gt;" formats when doing that, but it would be nicer not too. And a lot of people will use tags, if the world at large is any indication.

[18:16](#msg5e4986f0b3023d5025f3dbd8)Since I don't use markup much, I have to rely on memory of people expecting things like this to work:

```
>> append <img > <src="red.png">
== <img <src="red.png">>
```

[18:16](#msg5e49870d25f1d250feddaad9)And I don't remember ever using `build-tag` in R2, so someone else will have to comment on how well it worked and for what use cases.

hiiamboris

[18:22](#msg5e498878292ff243d3cf5413)Could be something one would expect with tags (on question of form-ing):

```
>> rejoin ["" <a> 'text </a>]
== "<a>text</a>"
```

greggirwin

[18:25](#msg5e49891e48ca2e297455a76a)Indeed, which may be the reason for the original design, as that's a common idiom.

Oldes

[19:12](#msg5e49940c46e99d431f7dcbea)I don't think that `>` is a valid tag in HTML. I quite think, if there should not be an error when user tries to append tag to tag?

[19:12](#msg5e4994350ec5ff431e97902f)I don't think that there is anybody using tags for something else than parsing, because current tags are quite not clever enough.

[19:16](#msg5e4995240d257250fdeea422)Imho... it would be more practical to have: `"" = append`

**[19:17](#msg5e49956518ac9b0fb5c3e4cf)Because this is a nonsense:**  
**`>> rejoin [<a> <b>] == <a<b>>`**

**greggirwin**

**[19:18](#msg5e4995885f82805026df7773)Sounds like we need to write up a tag design RFC.**

**Oldes**

**[19:18](#msg5e499589d56ddb68a4aba5b0)And main reason, why tags are not used.**

**[19:20](#msg5e4995fbd56ddb68a4aba7eb)On the other side, I can imagine, that someone may want to build a tag using:**  
**`>> append <a> { href=http://} == <a href=http://>`**

**[19:21](#msg5e4996535f82805026df797f)But maybe it would be more practical not to need the space:**  
**`>> append <a> {href=http://} == <a href=http://>`**

**hiiamboris**

**[19:23](#msg5e4996bfae97f129757e96d9)With automatic space you won't be able to remove it easily when you \*don't* need it ☻**

**Oldes**

**[19:24](#msg5e4996d1b3023d5025f3fe08)Exactly.. so I don't know :-/ hard to decide.. but making tags, which are not a tags is a nonsense.**

**[19:25](#msg5e4997360d257250fdeea99e)But that can be done in many ways, like:**  
**`>> append <a> "<b>" == <a<b>>`**

**[19:27](#msg5e49979646e99d431f7dd432)And I suppose, this is a possible security hole:**  
**`>> append <a> "><c" == <a><c>`**

**[19:29](#msg5e499825d56ddb68a4abad05)Although building a markup without input sanitation is a nonsense too:)**

**[19:31](#msg5e499881292ff243d3cf74fd)Maybe there should just be a scanner on the second value and if it would contain `<` or `>` chars, there should be an error when first value is a tag.**

**hiiamboris**

**[19:33](#msg5e4999190ec5ff431e9799f3)What if it's `append { text=""}`[?]()**

**[greggirwin]()**

**[]()**

**[]()[19:38](#msg5e499a25d3507e0fb60e17ad)&gt; Maybe there should just be a scanner on the second value and if it would contain `<` or `>` chars, there should be an error when first value is a tag.**

**That's outside the scope of data manipulation at this level.**

**meijeru**

**[19:48](#msg5e499c7218ac9b0fb5c3f5cb)Here's my intitial thought: tags are a special kind of "string" in that the delimiters are somehow part of the value. I would not find it inconsistent therefore, nor overly inconvenient, to have `> = append`[. It can be successfully argued that, because of this special property, construction of a tag from several elements will need exactly one tag value, with the remaining ones being non-tag "strings". That being said, I could even be surprised about the behaviour of `change`. For consistency, I would expect `change`]()`  ` [to yield `<>`.]()**

**[endo64]()**

**[]()**

**[]()[21:45](#msg5e49b7f718ac9b0fb5c435d5)For series actions like `append/insert/change` if both arguments types are `tag!` returning an error looks better to me. Because that action is meaningless.**

****Monday 17th February, 2020****

**meijeru**

**[08:59](#msg5e4a55e618ac9b0fb5c56576)I would not \_a priori_ consider such actions meaningless. Just make the user aware of this behaviour...**

**toomasv**

**[09:13](#msg5e4a59230d257250fdf018ca)If we consider `tag!` to represent always and only markup tags, then yes, it doesn't make much sense to have folded tags. But we don't have to take `tag!`s to represent exclusively markup tags. I agree with @meijeru that they can also represent interesting stringy folded structures. E.g. given HOF `foldR`:**  
**`foldR: func [block fn acc][ either empty? block [acc][ fn block/1 foldR next block :fn acc ] ] >> foldR [<a> <b> <c>] :append <x> ;== <a<b<c<x>>>>`**  
**Downside is that these structures can't be constructed manually as matching opening/closing is not considered:**  
**`>> <a<b>> *** Script Error: > operator is missing an argument`**  
**Which means folding tags is not originally intended.**

**Oldes**

**[09:25](#msg5e4a5c14b401eb68a5814d0e)@meijeru if you:**

**&gt; .. expect `change` [to yield `<>`.**  
**\**
**than you should also expect: `change "a" "b"` to yield `{"b"}`, don't you?]()**

**[09:27](#msg5e4a5c90b401eb68a5814e13)I quite incline, that `rejoin [ ]` [should yield  instead of current `>`, even if it breaks compatibility with R2.]()**

**[09:29](#msg5e4a5cffb401eb68a5814e83)And use `append form` [to yield `>`, if someone really needs it.]()**

**[loziniak]()**

**[]()**

**[]()[09:31](#msg5e4a5d64d56ddb68a4ad3557)So, tags should be treated just like strings, but with added `<` and `>`?**

**Oldes**

**[09:31](#msg5e4a5d850c50da598c163b2f)And use `append form` [to yield `"`]()`"`[.]()**

**[endo64]()**

**[]()**

**[]()[09:33](#msg5e4a5ded18ac9b0fb5c57a19)`append` keeps &amp; returns the type of the first argument. Do it should return s tag! value.**

**[09:33](#msg5e4a5e05292ff243d3d1022f)* So (sorry on mobile)**

**Oldes**

**[09:34](#msg5e4a5e190ec5ff431e991ebc)Yes.. sorry.. typo.. fixed!**

**hiiamboris**

**[11:35](#msg5e4a7a9f48ca2e2974579b5f)@Oldes so to summarize your idea:**  
**`>> append "a" <b> == "a<b>" >> append <a> <b> == <ab> ;) currently - <a<b>> >> head insert <a> <b> == <ba> ;) currently - <<b>a> >> head change <a> <b> == <b> >> find "a b <b>" <b> == "<b>" ;) currently - "b <b>" >> find as tag! "a b <b>" <b> == <b <b>> >> parse "a b <b>" [to <b> p: (probe p)] "<b>" == false >> parse as tag! "a b <b>" [to <b> p: (probe p)] <b <b>> ;) currently - <<b>> == false >> rejoin ["a" <b>] == "a<b>" >> rejoin [<a> <b>] == <ab> ;) currently - <a<b>>`**  
**Yes?**

**Oldes**

**[11:48](#msg5e4a7da65f82805026e14cf0)Yes. But I may be wrong :-) It's just an idea.**

**[11:50](#msg5e4a7deb46e99d431f7fa12c)I can also imagine, that it is a bad idea... if it would slow down every append/insert/change action. I was not checking, how it is implemented.**

**hiiamboris**

**[11:56](#msg5e4a7f6dd3507e0fb60fecf0)It won't. Just skip `form`ing the 2nd tag when 1st operand is also a tag**

**endo64**

**[12:00](#msg5e4a806f48ca2e297457ada6)@hiiamboris this could be an RFC. Thanks for summarizing.**

****Wednesday 19th February, 2020****

**pr-yemibedu**

**[14:29](#msg5e4d46373ca8a67fb805490a)is there are way to compile RED without the RED compiler?**

**[14:29](#msg5e4d46524609ce3a881180d4)if i have issues with AV, where is the safe starting point?**

**loziniak**

**[14:30](#msg5e4d4682c2c73b70a445aafb)maybe you can send sources to somebody, who will compile it for you.**

**[14:31](#msg5e4d46aeff00c664eed1832e)online compiler would be cool :-)**

**rebolek**

**[15:20](#msg5e4d522e4609ce3a8811a5d6)@pr-yemibedu do you mean without Red downloaded from https://red-lang.org ? You can compile from sources, just clone the Red repo, download Rebol and you're set. It takes about five minutes.**

**pekr**

**[15:29](#msg5e4d546ac2c73b70a445d371)I am doing what Rebolek suggests since the beginning, using Rebol/View and in the console running: `do/args %red.r "-r -t Windows %environment/console/guI/gui-console.red"` to get Red/View out of that ...**

**rebolek**

**[15:36](#msg5e4d5611d97c107ed261b1ca)@loziniak I've been thinking about online compiler, but it would need strong spam protection, as the compiling takes a lot of time.**

**[15:37](#msg5e4d5631ff00c664eed1ab8a)@pekr good boy! :dog: :smile:**

**loziniak**

**[15:39](#msg5e4d56c98e726c7dc5b4a08d)@rebolek perhaps rate limit by IP would be sufficient. let's say 1 file / minute. or dependant on last compilation time: if last compilation from given ID took 5 minutes, next is allowed in 20 minutes.**

**[15:42](#msg5e4d57568b2d4664ef10a7bd)maybe with source file size limit?**

**[15:43](#msg5e4d57a88e726c7dc5b4a2ad)although, one could include files from remote urls. gets complicated indeed :-)**

**rebolek**

**[16:13](#msg5e4d5eb689f30b126518c266)dependant on last compilation time seems most reasonable**

**[16:15](#msg5e4d5f1eff00c664eed1c2c9)It probably has to be compiled in `-r` mode, so every build will take about ~30 seconds depending on the CPU. That is another problem that needs to be solved, how to notify user that the buld is ready.**

**loziniak**

**[16:20](#msg5e4d60648e726c7dc5b4beb6)results could be sent by email.**

**pekr**

**[17:08](#msg5e4d6ba489f30b126518eee8)Yes, generating temporal folders and sending link to the client, deleting later ...**

**rebolek**

**[17:21](#msg5e4d6ea06053e67dc4d1baf0)Yes, that's an idea, but it means setting up mail server.**

**loziniak**

**[17:25](#msg5e4d6f7214b4d670a3357b77)Or using SMTP**

****Saturday 22nd February, 2020****

**hiiamboris**

**[11:34](#msg5e5111aeff00c664eedb925e)@dockimbel @qtxie Any updates on garbage collecting images?**

**smotti**

**[16:06](#msg5e5151a08b2d4664ef1b0c0a)Greetings. How to access functions in `simple-io`? For example i downloaded the red binary of the latest automated build of the master branch. And now is just wanted to make a simple test by getting the size of a file using `simple-io/file-size? %/tmp/test` but when compiling it fails with: `*** Compilation Error: invalid path value: simple-io/file-size?`.**

**hiiamboris**

**[16:09](#msg5e51522c40ac4a7fb9ff9ced)just `size?`**

**[16:10](#msg5e51527bff00c664eedc34ce)`simple-io` can be accessed using R/S as it's written in R/S (e.g. with `routine`) if you're sure that's what you really want**

**smotti**

**[16:13](#msg5e51534714b4d670a33f8340)**  
**`Red/System [ ] print-line simple-io/file-size? %/tmp/test`**

**that's the script. and the command to compile: `./red -t Linux script.reds`**

**hiiamboris**

**[16:16](#msg5e5153d6a0aa6629f5e63486)I see. You have to make a `Red []` file to include Red runtime.**

**[16:18](#msg5e51544714b4d670a33f8759)`Red [] #system [... your code...]` and also add `-r` to the command line `./red -r -t Linux script.red`**

**smotti**

**[16:19](#msg5e5154998e726c7dc5bf0d0b)cool thanks a lot!**

**[16:22](#msg5e51552fb662483a875a6fc7)**  
**`*** Compilation Error: datatype not allowed *** in file: %/tmp/io.red *** at line: 1 *** near: [%/tmp/io.red #script %/tmp/io.red #user-code ]`**

**hiiamboris**

**[16:25](#msg5e5155e5dafa3029f64864d2)As you can see from the \[source code](https://github.com/red/red/blob/master/runtime/simple-io.reds#L668) `file-size?` accepts a 32-bit integer open file handle. `%/tmp/io.red` is an invalid construct in Red/System (it's a Red value)**

**[16:25](#msg5e5155ff40ac4a7fb9ffac48)Why don't you use Red `size?` function instead?**

**[16:25](#msg5e51560dff00c664eedc407c)**  
**`>> ? size? USAGE: SIZE? file DESCRIPTION: Returns the size of a file content. SIZE? is a native! value. ARGUMENTS: file [file!] RETURNS: [integer! none!]`**

**smotti**

**[16:28](#msg5e5156a84880f07ed1f08362)sorry my bad for not reading the function definition properly. my goal is to understand how to use `simple-io`. that's why i don't use `size?`.**

**[16:32](#msg5e5157893ca8a67fb8100c72)thanks a lot for the help!**

**hiiamboris**

**[16:32](#msg5e51579740ac4a7fb9ffaf86)you're welcome ;)**

**[16:32](#msg5e5157a140ac4a7fb9ffaf94)we have a dedicated https://gitter.im/red/help room btw**

**smotti**

**[16:33](#msg5e5157ca8b2d4664ef1b225e)great. thanks!**

**[16:34](#msg5e515820dafa3029f6486ca5)one last question. i see that the rebol sdk can be downloaded for free. but it still requires a license key. and that can only be got by directly contacting carl?**

**hiiamboris**

**[16:35](#msg5e51586940ac4a7fb9ffb273)Yes.**

**endo64**

**[19:33](#msg5e51821a89f30b126523af9a)@smotti Just a reminder, Rebol license is not necessary to compile Red scripts, you can use Rebol/View (free version).**

****Sunday 23th February, 2020****

**qtxie**

**[03:12](#msg5e51edb6c2c73b70a45203c5)@hiiamboris No update. :pensive:**

**hiiamboris**

**[11:19](#msg5e525fab3ca8a67fb8125aac)okay, it's up to me to implement then ;)**

**phillvancejr**

**[12:50](#msg5e52751ed97c107ed26eafc0)Hello all, I was just wondering if someone could tell me or point me to an article or something that explains how the Red compiler/runtime can be so small? Particularly with the View/Gui system, how can the compiler and the generated files be so tiny?**

**hiiamboris**

**[13:14](#msg5e527ad0b662483a875d0f72)It's not exactly tiny, it's just not intentionally bloated ☻**  
**Look \[here](http://www.pouet.net/prod.php?which=1221) for what tiny is ;)**

**GalenIvanov**

**[15:36](#msg5e529c018e726c7dc5c20147)@hiiamboris Are you a demoscener?**

**hiiamboris**

**[15:37](#msg5e529c4589f30b1265261d20)No, just a bit familiar with it ;)**

**GalenIvanov**

**[18:55](#msg5e52caa96053e67dc4df5903)@hiiamboris I've written several 256b and 4k intros in x86 assembler ~20 years ago**

**hiiamboris**

**[19:09](#msg5e52ce054609ce3a881fd142)Nice! :D**

**GiuseppeChillemi**

**[19:11](#msg5e52ce4a4880f07ed1f40ec7)`Compose` is one of the most beautiful Red and Rebol commands ever.**

**greggirwin**

**[20:24](#msg5e52df89b662483a875e2bc4)I recall Carl saying once that he originally resisted `compose` when Sterling (Newton) proposed and implemented it.**

**GiuseppeChillemi**

**[20:31](#msg5e52e13d6053e67dc4df9c8d)@greggirwin who is he?**

**[20:33](#msg5e52e18314b4d670a3435dca)I have found only 5 scripts from him on Rebol.org. The last one just 12 years ago.**

**greggirwin**

**[21:00](#msg5e52e7daff00c664eee01d77)Sterling worked at Rebol Technologies with Carl and @respectech.**

**GiuseppeChillemi**

**[22:59](#msg5e5303c4d97c107ed2705a6a)21 years have passed from those days, I can feel our whole life.**

****Monday 24th February, 2020****

**planetsizecpu**

**[08:35](#msg5e538ab8dafa3029f64dd7f8)It would be a pleasure for me to see Sterling and Bodhan here, and of course Carl, I have great respect for these people. As I found Rebol right at the end of his commercial life, I had no opportunity to interact and learn from his wisdom. Although there are undoubtedly still very experienced staff at Red, the fact that I missed that stage of Rebol makes me feel somehow a bit novice, as B-side personnel, sometimes. 😕**

**pekr**

**[08:36](#msg5e538b24dafa3029f64dd895)Bo is here imo, under the @Respectech nick 😀**

**[08:38](#msg5e538ba24609ce3a8821b661)I miss a Cyphre here, GUI might benefit from his participation. Cyphre did AGG backend for R2 I think ....**

**planetsizecpu**

**[08:46](#msg5e538d5ba0aa6629f5ebb152)mmm, I want them to hear you and come back, for the benefit of all who learn Red 😍**

**rebolek**

**[08:49](#msg5e538e00c2c73b70a45600bf)@cyphre is on Gitter but only \*very* sporadically.**

**pekr**

**[09:06](#msg5e539230dafa3029f64defac)@rebolek I thought that Red/View would be a dream situation for him. I remember him doing some OpenGL R2 experiments in the past, not being able to influence R2 sources of course. But maybe his recent job does not require Redbol in any way, so ...**

**rebolek**

**[09:11](#msg5e5393283ca8a67fb8156e61)@pekr I haven't seen him for a while, so I can't tell. When he comes to Brno I'm usually in Jeseníky :/**

**Oldes**

**[09:46](#msg5e539b768e726c7dc5c4c29f)@pekr he is not using Redbol for his current work. I think he is working on some Electron (or similar technology) apps ... and spending his free time in multiplayer VR (don't know which game currently) instead of coding for a fun of coding.**

**[09:48](#msg5e539bff8b2d4664ef20e055)Also I think, that with 3 kids, he cannot afford to work for free.**

**pekr**

**[09:59](#msg5e539e84c2c73b70a4563b4c)Re working for free - I know. Did some occassional sponsoring, but it was mostly a bargain finance-wise, can't pay a full developer myself from my salary - I've got a family lately too :-) It is just nostalgy that we have lost some good Redbol buys. Another ones being Ladislav, BrianH, Earl (Andreas) ...**

**[09:59](#msg5e539e923ca8a67fb8159bcb)Ah, we are in Red group, sorry for being off-topic here ....**

**loziniak**

**[10:35](#msg5e53a6d70c4514126687bf8c)Hi! I'd like to write a test for #4297. Where should I put it? Where are tests for \*random* or \*float!\*?**

**hiiamboris**

**[10:42](#msg5e53a88f101adb4160c2545a)I would suggest `regression-test-red.red`**

**loziniak**

**[11:11](#msg5e53af6f1ec15e021199916f)Thanks! More questions in red/tests room :-)**

**GiuseppeChillemi**

**[14:02](#msg5e53d7739aeef6523215fa55)I think @qtxie should also have on par or greater experience. Don't forget Atronix rewrote the gfx engine because its performance was suffering for the high number of objects.**

**rebolek**

**[14:06](#msg5e53d8741c4f1707f8c91130)No one is doubting @qtxie!**

**[14:08](#msg5e53d8ca3e6ef64161706fee)IIRC Atronix didn't rewrite gfx engine. They based their on GOBs instead of faces for reasons you've described. But I may be wrong here.**

**Oldes**

**[15:10](#msg5e53e780901209179b38218e)Atronix is using GOBs, but year ago they moved to SKIA from the original AGG. With this change Atronix' Rebol version is not open sourced, because they never released the required dependencies (modules). Last commit is from last summer, so it looks that they are now completely closed, or moved to completely different technology.**

**[15:15](#msg5e53e8a6101adb4160c327d9)I would bet on the second variant, because zsx was actively experimenting with Rust.**

**GiuseppeChillemi**

**[19:14](#msg5e542089901209179b38e2ef)Would like to ear from them.**  
**Also, I hope someday we can all be under the same flag: one language for all !**

****Tuesday 25th February, 2020****

**Respectech**

**[00:05](#msg5e5464b21c4f1707f8cad6a3)@planetsizecpu Yes, this is Bo (Bohdan). I worked as Quality Assurance and Technical Support for Rebol. I worked closely with Carl for several years, and his wife, Cindy, worked for me for 8 years until she recently retired and moved to Reno, NV. I haven't heard from Sterling, Jeff, Holger, or any of the other guys for years. However, I did see Gabe in Maui last month, as well as Reichart.**

**[00:06](#msg5e5465033e6ef64161723edc)Both my businesses run on Rebol-powered backends. Respectech's backend software, Worklog, was written originally in 2003 and is still running today. Only on v2.46 at the moment, containing about a million records. :-)**

**planetsizecpu**

**[07:38](#msg5e54cef63e6ef6416173218a)Wow! Thank you for your time Bohdan, because I visited your website and I liked it a lot, but I deduce that your business does not let you have much of it. The fact that you go to visit this forum, gives us who are learning this language (or at least to me) a boost. I did not know of some people that you mention, surely experts in Rebol, I hope they know about the Red project that comes from Rebol. (Oops, it seems we should move to the chit-chat room) 😃**

**qtxie**

**[07:49](#msg5e54d19b901209179b3a8d27)Yes. We'll need GOB! or native face! in order to achieve good performance when creating thousands of faces.**

**pekr**

**[07:57](#msg5e54d387e40da4526f1319d8)face is not native?**

**[08:02](#msg5e54d47a1be0ff01d5a968dd)Ah, maybe an object .... on a cell phone, so can't check**

**greggirwin**

**[18:08](#msg5e5562b01ec15e02119e4d9d)Face is native (child window), which makes it heavy. Gobs (Graphical OBjects) are lightweight data structures. Here's how Rebol did it: http://www.rebol.com/r3/docs/view/gobs.html**

**dander**

**[18:33](#msg5e5568748f8af6553a032bbf)I'm curious if people have looked at \[Flutter](https://flutter.dev/) by Google. It looks like it has some similar characteristics to Red, like compiling to native code with a built-in runtime, declarative UI for cross-platform dev, though their priorities are somewhat flipped comparatively. They primarily seem to be targeting mobile, then web, then desktop. And I think they are using custom UI components instead of native ones. The dev environment seems ginormous though... looks like a hello world app size comes out around 4-8 MB (shrug).**

**[18:34](#msg5e5568b89c3b2f07f7183499)maybe there is some knowledge to be gained there**

**GiuseppeChillemi**

**[18:44](#msg5e556b0f901209179b3c3881)I have a question for seniors which works often with databases tables: in your experience, is there the risk to find a table column name that is not compatible with represented by Red words? I need it to establish the container format to store those tables and I would not user `strings` for speed reasons (it will be used as key for data retrieval)**

**pekr**

**[18:46](#msg5e556b843e6ef6416174de49)Our internal team as well as our two suppliears, are switching to Flutter for the mobile app development, and Angular TS (Typescript) for the browser apps.**

**[18:49](#msg5e556c44476ff13c43b3f9c6)Native apps sounded like a really good aproach, when introduced. But then it hit a reality a bit - you can hardly find any cross platform common denominator for compound styles, as list views, grids, etc. But that's where custom styles based upon draw + events, should help. There's always going to be a trade off. Drawing a custome button is not a problem and R2/R3 did it nicely, but the real "fun" starts with edit fields/areas and mimicking all related behaviour and functionality ....**

**GiuseppeChillemi**

**[22:19](#msg5e559d541ec15e02119ef781)I am not an exper in GUI area. My feeling was that AGG and SKIA like approaches would be a winner in the long period for its portability but Red choice to use native widgets let me think I could be wrong.**

**greggirwin**

**[22:49](#msg5e55a4961c4f1707f8ce05d5)@dander \[:point\_up:](https://gitter.im/red/red?at=5e5568748f8af6553a032bbf) I looked at Flutter some time back, and now it seems like Dart emphasizes being a client-side lang. There are good things in both, which are evolutionary. e.g. a focus on movement in UIs and thinking more in data. We don't yet do the former, but need to, and I'm glad to see others leaning our direction. Some other langs use colon syntax now too, which is interesting.**

**The fact that neither have taken over the world, while working so hard to be familiar, tells us how hard it is to break in as a new language. There is no silver bullet.**

**Key things I found at a glance:**

**- Flutter Clock Challenge. We should do things like this, and the old R2 demo contests.**

**- \[control flow in literals](https://github.com/dart-lang/language/blob/master/accepted/2.3/control-flow-collections/feature-specification.md) and \[collections](https://github.com/dart-lang/language/blob/master/accepted/2.3/spread-collections/feature-specification.md)**

**The literal+logic idea is really interesting, and the motivation (all I read in those pages) makes sense. I was going to suggest that somebody could tinker up an example for how we'd do that in Red, and we could, but that was me reacting in a one-up-them way. As soon as I thought "use `compose`", there's no need. It's a little uglier, and I absolutely want to think on a feature flags model because we already need it for DiaGrammar. But this idea should be generalized as a dialect. Why? Because literals are data, and should stay that way. Any special processing is domain specific. e.g. \[inject](https://gist.github.com/greggirwin/29836d25de0c68eaba0e6dbd268a20f5)**

**Now the question is what to call the unifying dialect for literal block mixins/optionality, and what are the target use cases to drive the initial design? Fun and manageable. Let's thinker on it.**

**This is \*very* interesting to me, because feature flags, for example, are cross cutting concerns (and dual alliterations :^) . This is \*not* easy, but could be quite a unique approach. Imagine a combination of `[key data macro ref]`, where an AOP-style concern (the key) maps to a data structure which is triggered from a macro that passes a reference for \*that specific macro call\*, so the macro has context, and can use all the data in the structure for that key to generate the right code at that call site. Then you have a single place to manage all aspects of that concern.**

****Wednesday 26th February, 2020****

**giesse**

**[05:43](#msg5e560566e40da4526f1643f2)@greggirwin that's kind of what I mean when I talk about using a dialect for `format` etc. Having control flow at the dialect level is really nice, but of course people need to be able to understand that it's a separate dialect, and that can be confusing when it looks very close to "code".**

**GiuseppeChillemi**

**[08:56](#msg5e5632d7e40da4526f16b4aa)@giesse I faced this problem too last year when I choosen to go deep in Red. Red dialects enclosed in blocks have the same building elements of Red and people tend to use the standard knowledge as: it seems Red code, so it is Red code. In real life when things are too similar you should either put a differentiating element or a clear warning. If you put a transparent chemical element into a water bottle people could exchange it for normal water and die drinking it. Here in Italy the law forces you avoid this cause of error in work environments. For this reason you either change the container or put a warning label in front of it. In RED it's the same: we need a clear distinction in the container or a having a word preceding it to inform the elements in the following block are different than what they seem. Also putting great emphasis on dialects would help: we could either write more about dialects documentation and make evident in the description of the specs-block of functions that the argument block is a dialect. Those solutions could help to mitigate the problem but the real solutions are those written above.**

**[09:12](#msg5e5636811ec15e0211a04c79)\*I have choosen (first line). I am on mobile and can't correct it.**

**Oldes**

**[09:16](#msg5e56376f1ec15e0211a04e72)Isn't the word like `parse` or `view` in front of the block with dialect code the mentioned \_waning label\_?**

**GiuseppeChillemi**

**[09:22](#msg5e5638f1d7bb4e179ca188f4)It seems they are not.**

**rebolek**

**[09:26](#msg5e5639b2d7bb4e179ca18a35)How so?**

**GiuseppeChillemi**

**[09:26](#msg5e5639c09aeef652321c4c36)Ideas (they are not proposals)**

**`view`**

**`ARGUMENTS: spec [block! object!] "Layout block or face object. (DIALECT)"`**

**or**

**`ARGUMENTS: spec* [block! object!] "Layout block or face object. (DIALECT)"`**

**rebolek**

**[09:27](#msg5e5639e6476ff13c43b5e6bd)you can do `WARNING!!!!-WHAT-FOLLOWS-IS-VIEW-DIALECT!!!!!!!!!!!!!!1!11!!!: :view`**

**GiuseppeChillemi**

**[09:28](#msg5e563a441be0ff01d5acf3df)The proposal above are shorter but if there is consensus we can user your**

**`WARNING!!!!-WHAT-FOLLOWS-IS-VIEW-DIALECT!!!!!!!!!!!!!!1!11!!!: :-----view-----`**

**[09:46](#msg5e563e898f8af6553a0523ab)Also, a (transparent?) word before the block could do this work:**

**`dialect[word set-word string tuple block]`**  
**Or**  
**`*[word set-word string tuple block]`**

**rebolek**

**[09:53](#msg5e564004d7bb4e179ca19d3e)It feels really superfluous to me, but of course, you can do something like `dialect: func [value][value]` if you prefer doing `view dialect [button "why?"]`**

**Oldes**

**[10:07](#msg5e5643511c4f1707f8cf58f5)The true is, that the console's `help` could handle dialects somehow. But I guess it is low priority.**

**GiuseppeChillemi**

**[10:13](#msg5e5644d2fa9f20553b50b347)Our natural neural networks (minds) work with simple rules: they tend to interpret what they see by its shape and what shapes trigger in their minds is the thing they are looking at. This happens until there is a differentiating element that instruct/forces them to interpret in another way. The only people that do not exchange this for that without visual difference or instruction are those who already know the topics, like you ! (they can be fooled only in very particular circumstances)**

**rebolek**

**[10:16](#msg5e56456c901209179b3e4cfa)Well, the dialect can be constructed. Would you mark each element somehow? I think it's better to read the documentation and learn everythin in Red is data and their interpretation depends on context.**

**GiuseppeChillemi**

**[10:16](#msg5e56456d9c3b2f07f71a4292)@rebolek This is my choice:**

**`ARGUMENTS: spec [block! object!] "(DIALECT) Layout block or face object. "`**

**Zero changes to the language.**

**rebolek**

**[10:16](#msg5e5645879c3b2f07f71a42ad)@GiuseppeChillemi so just marking it in help text? I guess that's possible.**

**GiuseppeChillemi**

**[10:17](#msg5e5645b99c3b2f07f71a4341)@rebolek I agree. There is no need to change the language. Yes, mark it in the help.**

**[10:19](#msg5e5646239c3b2f07f71a44fb)Personally, in my dialects I will also mark the ARGUMENT BLOCK NAME with some special characters or abbreviation to distinguish it.**

**pekr**

**[11:36](#msg5e5658413e6ef641617738fa)In the old Rebol days, I have suggested the extension to the help system. Was thinking about something like `help/dialect button 'vid`, but it would be too complicated for users too. We would have to have an option, of how to register a doc strings for various dialects. As with VID, you can use some filed during the style creation or stylize function, but what about other kind of dialects?**

**rebolek**

**[11:58](#msg5e565d5c5cd3836098cdb8f9)Adding help to dialects is a very interesting area. I certainly have any answers, but it's something that I really would like to see.**

**dander**

**[19:03](#msg5e56c108aecedb30bd224acc)There has been some discussion of having a dialect for building dialects as well. If such a thing took hold, the documentation for the dialect could be built in with the definition of the dialect itself. So that various forms of tooling, such as `help` and editor tools could leverage that.**

**giesse**

**[19:23](#msg5e56c5ad4c3951679d264e6b)This is not a problem with the language. This is a problem of too superficial understanding on the human side. It's not that it's hard to see or recognize. It's not that it's hard to understand either. It's mostly that (most) humans strongly resist having to understand things; I've seen people put more effort into avoiding to understand than it would take to actually understand a system. (E.g. fixing bugs or writing code by trial and error rather than sitting down and figuring out how the system works.)**

**pr-yemibedu**

**[19:26](#msg5e56c67f819be7679e937469)thank you for suggesting to use rebol to compile red to get my local clean copy. Also about never actually saving the binary, but using it inline to compile red sources. Should that be on a Wiki somewhere as an option for people with AV issues on Windows?**

**dander**

**[19:38](#msg5e56c92065b2fe6ccff2c2ff)@giesse 100% agree with that. Even for simple things like reading an error message and thinking about what it says. Usually there are improvements that can be made to reduce the friction though, like having more clear error messages, more accessible documentation, etc**

**hiiamboris**

**[20:05](#msg5e56cf7309aede7d924a961a)I've heard that to understand a totally new concept requires brain to consume ~1000 times more energy than in the normal state of comfortable denial ☻**

**GiuseppeChillemi**

**[21:34](#msg5e56e4594c3951679d26a755)We start our life needing to learn anything to survive in this world but the older we get the more our brain switches from learning to using. All elders have problems learning new things because our brains use what we already now first. Also many have learnt to abandon the attempt as they usually could live without this new knowledge and use the old familiar tools. This happens until the new topic become really important. Then the brain switches back to learning mode to acquire the new skills.**

**[21:34](#msg5e56e46eaaf81d4d547c143b)Motivation is the key.**

**[21:40](#msg5e56e5e6819be7679e93d266)@dander you are right, newcomers frustration for not being able to understand the language and produce the code they need, may trigger the abandonment of the attempt to enter the Red planet atmosphere.**

**hiiamboris**

**[21:47](#msg5e56e7565c32162f5b9c6e98)They have to move away fast though, or they'll be pulled down by the gravity well anyway ;)**

**dander**

**[21:53](#msg5e56e8e1aaf81d4d547c1dfc)Right, it's a way to lower the barrier to entry. At this stage, it seems like it would be counter productive to intentionally try to draw in larger numbers of less... (energetic? / self-guided? / motivated?) users. Do you think we would be ready for them?**

**greggirwin**

**[21:57](#msg5e56e9bc8de2ac3c9a4a7c38)We absolutely want and need higher level dialect features. My guess is that there will be one we offer, and others will come from outside. It's a big task, because languages constrain us, so when we design them, we need to choose the right set of constraints.**

**What we have today are "parts" that can be used to build dialects, but no plans or templates for how to do so. Like a bag of lego blocks or erector set pieces without instructions. What can we learn from ANTLR, xText, and Rascal, and what are the big architectural patterns that we can start with? This comes right back to AOP in some ways, and languages have a \*lot* of pieces to coordinate: design, syntax, semantics, runtime, docs, error handling, symbol tables, code generation, recursion, paradigm-specific elements (funcs, objects, etc.), and domain logic, just off the top of my head.**

**One of my long-time dreams is to have simple versions of languages built in Red, using it as a tool to \*teach* and \*show* how different languages and paradigms can be implemented. We need more learning materials in general, and this is part of that. As always, finding the biggest pain points and addressing those first is a good tactic. But this may not mean "write a lot more docs." It may mean, figure out how to take the best 5% of literate programming, promote best practices, and offer simple tools that move us forward in a new way. There are a couple things coming that I think will help with this in a significant way.**

**The human side is the hard part, yes. I enjoy my comfortable denial as much as anyone. Saving energy seems a side bonus.**

**[22:04](#msg5e56eb6faaf81d4d547c28c8)We're not ready, but we're also not at risk of a massive influx of new people. :^)**

****Thursday 27th February, 2020****

**giesse**

**[06:02](#msg5e575b7baecedb30bd2360bd)My point is that, at this stage of the game, it doesn't really save energy. As a society we spend much more energy because of the overwhelming complexity which leads to chaotic behavior which leads to everybody running around putting out fires instead of actually solving problems and improving things. But, oh well, no point ranting about it either I guess.**

**planetsizecpu**

**[06:50](#msg5e5766bc86e6ec2f5c5f528a)&gt; We're not ready, but we're also not at risk of a massive influx of new people. :^)**

**Unfortunately @greggirwin 😟**

**pekr**

**[07:06](#msg5e576a664c3951679d276218)@greggirwin is there any ETA on fast lexer merge or even 0.6.5 release?**

**loziniak**

**[09:12](#msg5e57881986e6ec2f5c6057cd):-)**

**rebolek**

**[09:16](#msg5e5788fcc446986cd00bcaf8)Soon™**

**pekr**

**[10:11](#msg5e5795b55c32162f5ba03125)With our Amiga heritage, I would accept even an announcement about future announcement :-)**

**rebolek**

**[10:17](#msg5e57974efcb6354d55dd6bdb):-)**

**planetsizecpu**

**[12:07](#msg5e57b0f786e6ec2f5c61f77a)😅**

**henrikmk**

**[12:25](#msg5e57b5475c32162f5ba175df)Lately, I've found that making functions with dialects as single arguments makes for really good use of dialects, even for small things.**

**Your argument block can contain information that otherwise might have to be found in other locations, making your code less esoteric. You can decide input order, leave out inputs or use inputs as a replacement for refinements.**

**You only ever need one argument to your function. We have talked a lot about refinements and complex arguments in the past, but dialects mostly solve this.**

**It may seem obvious, but it was for me about finding a balance between code size and conveying intent with a function call without leaving out essential information, resorting to having a long set of hard to read arguments, resorting to code comments and also spending a lot of time deciding where to put that information. Code size bloats a little bit, because you are forced to be more descriptive in your argument, but you gain tons of readability.**

**Instead of this:**

**`You get:`my-func \[special-mode value 1 method 'f level 6 message "test"] \`**

**One could think of dialects as huge sub-domains, like LAYOUT, or as some kind of "mode switch", but I think there is some merit in dialects that consist only of two or three words or values and interpreting input orders that way. Say, a date output formatter, or a way to describe or convert between colors in pretty much any format. String or value builders come to mind.**

**My point is that dialects should be more common and trivial, and saying "I'm going to make a dialect for X" doesn't mean inventing a new programming language or taking out a week of your time to make something really clever, but simply making a habit of \*starting out* with a dialect as your only function argument and starting your first line in that function with PARSE arg \[...], if you don't know if your function will grow more complex over time.**

**Oldes**

**[12:38](#msg5e57b85486e6ec2f5c62440a)@henrikmk that is quite normal.. I'm using it in many \[bindings under Red/code](https://github.com/red/code/blob/master/Library/Bass/bass-test.red#L26-L34), the problem is, how to define a system for documenting the dialect, so it is easily accessible from console using `help`.**

**[12:46](#msg5e57ba105c32162f5ba1a797)Because when I would like to use your function after several year break (which is normal), I could use `help my-func` and see, what each argument is used for (if it is documented), but if there is just one argument which is a dialect block, seeing `(DIALECT)` in the doc-string as @GiuseppeChillemi proposes will not help me much to remember, what are the options.**

**pekr**

**[12:47](#msg5e57ba5086e6ec2f5c625abf)Do you guys remember R3's DELECT? It was an interface for simple command dialects, with an ordered arguments, to serve for fast interfacing of R3 plugins .... later on, it was deprecated though, or so I remember ....**

**Oldes**

**[12:48](#msg5e57ba8086e6ec2f5c625bc9)Not mentioning, that the same system for documentation in runtime should be used also for offline documentation.**

**pekr**

**[12:48](#msg5e57ba8caaf81d4d54815738)http://www.rebol.com/r3/docs/functions/delect.html**

**GiuseppeChillemi**

**[13:01](#msg5e57bd8e86e6ec2f5c627a69)@Oldes (DIALECT) does not help you to remember the semantic of the dialect. It warns the developers that the content in the block is different than the normal Red code. Also, it helps to raise the awareness that Red has DIALECTS.**

**henrikmk**

**[13:31](#msg5e57c4a286e6ec2f5c62c86c)@pekr the DELECT function is really only useful for specifying values of particular datatypes in any order. something that dialects aren't good at. but DELECT isn't very flexible.**

**[13:33](#msg5e57c52bc446986cd00bed27)and IMHO, being esoteric is part of what limits dialects like VID. I would much rather have had**  
**`[button offset 20x20 size 50x60 string "foo"]` than**  
**`[button 50x60 "foo"]`, because it's more extensible and easier to parse.**

**GiuseppeChillemi**

**[14:03](#msg5e57cc2e86e6ec2f5c631e3f)@henrikmk I agree that this way of expressing things is more expressive and helps a lot. When passing configuration data via blocks it is more readable having the names of the value before them.**  
**Once I thought about using neutrals element which are skipped by the intepreter like: {read 'file %my-table.r}**

**[14:20](#msg5e57d035aaf81d4d54824aa4)Obviusly `'` is alread used but I have put it there to escape a neutral word. Also we should have a starting and ending char to enclose multiple words, like string does, but without being considered as argument**

**hiiamboris**

**[14:42](#msg5e57d56f5c32162f5ba2e414)@henrikmk**  
**This `[button offset 20x20 size 50x60 string "foo"]` you can already do in VID:**  
**`[button with [offset: 20x20 size: 50x60 text: "foo"]]`**  
**And `my-func [special-mode value 1 method 'f level 6 message "test"]` is also not the best example as it just mimicks key-value way of passing data around: `my-func [mode: 'special value: 1 method: 'f level: 6 message: "test"]`. This is in fact what @giesse \*enforces* in Topaz for functions of more than 3 arguments.**

**rebolek**

**[14:51](#msg5e57d7686aefb130be967601)It simply shows how much we need `apply`.**

**pekr**

**[15:01](#msg5e57d9b3fe718a1ae8f0e474)Wasn't `apply`a mezzanine in R3? If so, and if found useful, why it is not added to Red then?**

**hiiamboris**

**[15:39](#msg5e57e2bbaaf81d4d54831d4d)It's design is not decided yet.**

**rebolek**

**[15:43](#msg5e57e3b25c32162f5ba38c9e):-)**

**[15:44](#msg5e57e3dafcb6354d55e0c10e)Tell me about it :-)**

**hiiamboris**

**[15:50](#msg5e57e5445c32162f5ba3a128):D Right.. I suppose you're waiting for it more years than I do...**

**henrikmk**

**[15:50](#msg5e57e56386e6ec2f5c64568a)@hiiamboris the latter example provides type protection over the key-value method, and allows subdialects for each value in the same parser. you can of course reduce the complexity of a dialect to be key-value like, but that's not taking advantage of it.**

**hiiamboris**

**[15:56](#msg5e57e69486e6ec2f5c6465de)Yes, it's a great idea. Multiple dialects within the same expression block. Dangerous but powerful. And it reminds me of @GiuseppeChillemi's idea of mixing Parse and normal Red ;)**

**[16:02](#msg5e57e827fe718a1ae8f0f487)On a more practical note, I agree with Gregg that every new dialect means a new set of rules to remember, so for it to be justified, it should either be used in a lot of places, or only by a few people.**

**rebolek**

**[16:06](#msg5e57e8f6fcb6354d55e100f1)@pekr No, I believe it was native, but I may be wrong, @Oldes is expert on R3, he should know it exactly.**

**henrikmk**

**[16:06](#msg5e57e923fcb6354d55e10256)it might be interesting to dry-run dialects, i.e. skip any paren!s blocks, and through that: 1. use them for double checking your input. 2. simple documentation of the dialect.**

**Oldes**

**[16:10](#msg5e57ea0f4c3951679d27dcd5)`apply` is native in R3. But still I think that you should avoid it if possible as it slows down evaluation.**

**rebolek**

**[16:17](#msg5e57eb8d5c32162f5ba3ed2b)If you want to pass refinements from one function to another, is there a faster way?**

**Oldes**

**[17:07](#msg5e57f7615c32162f5ba47336)You may just use Henrik's approach ;-) At least for own functions.**

**rebolek**

**[17:13](#msg5e57f8b286e6ec2f5c653312)@Oldes do you really think that's faster than native `apply`?**

**Oldes**

**[17:16](#msg5e57f9545c32162f5ba48b80)no, but have no time to measure it.**

**rebolek**

**[17:22](#msg5e57fad686e6ec2f5c654cb3):-)**

**greggirwin**

**[18:11](#msg5e58064218ae2a1ae7635e45)Gitter isn't letting me alt-click to ref messages, so...**

**@giesse, it's true, and human nature, and something we just have to accept and change as we can.**

**&gt; It might be interesting to dry-run dialects, i.e. skip any paren!s blocks, and through that: 1. use them for double checking your input. 2. simple documentation of the dialect.**

**@henrikmk I don't understand what you mean here.**

**There are many ways to deal with passing information, e.g., args to funcs, and none a universally best.**  
**- Current func approach (good for a small number of args and options, general, `help`)**  
**- Dialected funcs (flexible, handles optionality and sparse inputs well)**  
**- Object args (can be used and vetted like `interfaces` in OOP)**  
**- Shared state (can be very convenient for small scripts with a global state for job processing)**  
**- Messages and events rather than direct func calls (makes asynchrony and communication topology explicit, receivers can pattern match, easy to log and trace)**

**Each has strengths, weaknesses, and contexts where they are more appropriate and useful.**

**Dialects, Object Args, and Messages are powerful in a very different way. They are data centric, grouped, can be templated, generated, and more. With func calls, every arg is a separate piece of data.**

**giesse**

**[19:43](#msg5e581bf564079d6659c66bcb)@henrikmk once again, I must point someone to https://github.com/giesse/Project-SnowBall/blob/master/topaz/types/function.topaz#L28 (That's from 2011)**

**GiuseppeChillemi**

**[23:35](#msg5e585226cb91b5224ffbd140)@henrikmk**  
**&gt; Yes, it's a great idea. Multiple dialects within the same expression block. Dangerous but powerful. And it reminds me of @GiuseppeChillemi's idea of mixing Parse and normal Red ;)**

**I have a vision where the interpreter passes red data stream to a parse based interpreter and when parse returns the normal flow continues.**

****Friday 28th February, 2020****

**pekr**

**[07:20](#msg5e58bf51cb91b5224ffcaad0)I really like the Topaz function `options`mechanism. Could be even unified with VID's `with`one. Haven't thought of it more deeply, but on the surface, it seems like a nice aproach.**

**Oldes**

**[10:04](#msg5e58e5baec379e558e94a7c0)@giesse why you are not working on Topaz anymore?**

**pekr**

**[10:34](#msg5e58ecaeb873303e276b69c4)The question is, what is optimal to get into the browser nowadays? Isn't Topaz pure JS implementation? What about WebAssembly aproach, etc?**

**giesse**

**[19:36](#msg5e596babd045e25825042e3f)@Oldes back at the time, I had to stop because of other priorities, which I kind of regret because I think my other projects would have worked out much better if I had just focused on Topaz first instead.**  
**Today, if I decided to do my own language, I'd go even higher level that Topaz. But I don't have much motivation.**  
**A more practical idea is to write a Red to Red compiler (for the purpose of optimization, and easy implementation of experimental features), with a Topaz mode (so you'd get a Topaz to Red compiler for almost free). But, again, I don't know if I'll ever work on this, if anyone wants to tackle it I'm very happy to help keep the project on track.**

**[19:38](#msg5e596c2b7fef7f2e898f3446)@pekr Topaz runs on JS just because that's the easiest/fastest way to do it. Eventually the compiler could have targeted C or any other platform. The browser is just the first platform anybody should target because it immediately gives you access to every single device out there.**

**Respectech**

**[19:42](#msg5e596d20ff6f6d2e8875e47a)@giesse +1 to browser support giving "access to every single device out there."**

**pekr**

**[20:05](#msg5e5972a590a8295824f598e2)+1 too**

**meijeru**

**[21:26](#msg5e5985a0376d882250bff361)I notice fast-lexer support coming up for `money!` literals and "rawstrings". I think I know what money values will look like (although there isn't any documentation about that), but what on earth are rawstrings?**

****Saturday 29th February, 2020****

**henrikmk**

**[10:52](#msg5e5a4278ec379e558e980f38)@giesse I would personally probably go more for a JS code generator, although I know that Topaz wasn't specifically meant for JS. I've thought about one, that emulates REBOL/View. Sort of having REBOL meet another language in the middle, by having that other language behave a bit like REBOL/View.**

**meijeru**

**[13:16](#msg5e5a642db873303e276effbd)The latest commit on the fast-lexer branch sheds some light: raw strings look like `%{...}%, with multiple matching leading/trailing % allowed.` This is in contrast to the file syntax `%"..."` which does not have a closing `%`.**

**GiuseppeChillemi**

**[13:20](#msg5e5a652ad045e25825062ccd)@meijeru I have a lot of curiosity too!**

**meijeru**

**[14:18](#msg5e5a72a6b873303e276f2278)The lexical space for "brackets" is slowly filling up. We have for now: `( ) [ ] { } < > " "` and their `#`-prefixed equivalents `#( ) #[ ] #{ } #" "` as well as `%" "`; none of these prefixed constructs uses a postfix; the newly proposed one for raw strings is the exception. The lexical space has room for `#< > %( ) %[ ] %< >` still; whether these should be "symmetrically closed" as well is to be discussed.**

**GiuseppeChillemi**

**[14:55](#msg5e5a7b7790a8295824f7d9bf)@meijeru `!{}` `:{}` ?**

**[14:58](#msg5e5a7c332e398f46abd04620)A `mytype#[]` and add `add-datatype 'mytype '` would make the lexicall space infinite**

**pekr**

**[15:14](#msg5e5a7fcf2e398f46abd04ef7)@meijeru not sure you know that historically there was some discussion about the Rebol space significancy, the thread was started by our old good reboller Ladislav. HF came out with something being called a "Plan -4", stating:**

**&gt;blockquote "So I now align myself with @earl (and any others) who have been suggesting a plan for respecting space significance with four exceptions: ]\[, ](, )\[, )(. These would be equivalent to ] \[, ] (, ) [, ) ( respectively. Although a tweak like this might not have the pleasure of a "absolutist formalism", it is solidly defined and doesn't seem to have any "holes" in a mechanical sense. It also seems to permit the cases that people find hardest to accept about what a "totally Outer-Space" proposal would break. Also, nothing stops anyone--in their own code--from always using the spaced version. From where I'm sitting right now, it seems a good compromise."**

**[15:15](#msg5e5a801e2e398f46abd04f8e)The discussion has happened here. If it is not related (as I can't envision many deep things Redbol related), my message can be freely deleted .... https://github.com/rebol/rebol-issues/issues/2094**

**[15:17](#msg5e5a807f4eefc06dcf274a06)My idea was, that it would free some space to allow some other syntactic forms, while not giving up much and not pushing ppl to be strictly space aware in their code. But - last time (some year or more ago) I have checked with HF, he did not find it a point of significant importance IIRC ...**

**rebolek**

**[15:19](#msg5e5a810c376d882250c1fa94)HF will change his mind again, I guess. And then once more. :-)**

**pekr**

**[15:24](#msg5e5a8217ca2f5a558d59355f)He did not change his mind re the topic. Maybe he just does not feel the need to introduce other datatypes or syntactic forms ...**

**hiiamboris**

**[16:02](#msg5e5a8b05a157485cb465c320)An argument against space significance:**  
**`print ["abcd: " abcd " efgh: [" efgh "] ijkl: " ijkl ...]` becomes more readable when I write it like:**  
**`print ["abcd: "abcd" efgh: ["efgh"] ijkl: "ijkl ...]` as it creates an illusion that Red words are inlined by double quotes. Sort of composite-like**

**meijeru**

**[16:03](#msg5e5a8b62ec7f8746aaa4b89a)Pardon my ignorance, who is HF??**

**hiiamboris**

**[16:04](#msg5e5a8b8b8e04426dd0141a4f)The Ren-C guy**

**meijeru**

**[16:05](#msg5e5a8bb7ca2f5a558d594a83)Got you, Hostile Fork!**

**GiuseppeChillemi**

**[17:03](#msg5e5a99592e398f46abd08891)🐪\[]🐪**

**[17:03](#msg5e5a9975ca2f5a558d596742)Whe still have a lot of characters. This is what I suggest for camel notation.**

**[17:05](#msg5e5a99f4376d882250c23986)🎼\[]🎼**

**[17:06](#msg5e5a99f9ca2f5a558d596843)Block containing musical scores (good for Nick Antonaccio)**

**[17:15](#msg5e5a9c4f376d882250c23f35)However, I can't believe we are in 2020 and we can't use colored emoticon and symbols to, at least, comment our code.**

**pekr**

**[17:45](#msg5e5aa327ec379e558e98f0b0)@hiiamboris have you actually read the whole thread and the possible -4 outcome?**

**hiiamboris**

**[18:19](#msg5e5aab4bff6f6d2e8878a4aa)@pekr no, not really ;)**

**GiuseppeChillemi**

**[19:29](#msg5e5abba4d045e2582506f94e)What are these words on fast lexer?**

**`S_HDPER_ST;T_ERROR;T_ERROR;S_FILE_HEX2; S_FILE_HEX2;T_ERROR;T_ERROR;T_ERROR;T_ERROR; S_HERDOC_ST;T_ERROR;T_ERROR;T_ERROR;T_ERROR; T_ERROR;T_ERROR;T_ERROR;T_ERROR;S_FILE_HEX2; S_FILE_HEX2;S_FILE_HEX2;S_FILE_HEX2;T_ERROR; T_ERROR;T_ERROR;T_ERROR;T_ERROR;S_HDPER_ST; T_ERROR;T_ERROR;T_ERROR;T_ERROR;T_ERROR; T_ERROR;T_ERROR;T_ERROR;T_ERROR;T_ERROR; T_ERROR;T_ERROR`**

**which is their purpose?**

**hiiamboris**

**[20:37](#msg5e5acb90a157485cb466580d)'S' must stand for 'State', 'C' for 'Character' and 'T' for 'The Terminator' ☻**

**rebolek**

**[20:42](#msg5e5accba8e04426dd014b43b)Plan 4 from outer space was actually not a bad proposal. It requires more discipline when writing code, but that's not a bad thing either. I doubt it will get adopted, but but I sort of liked it.**

**GiuseppeChillemi**

**[21:44](#msg5e5adb51ec379e558e996cfc)@hiiamboris thanks, now I need the other 99% of the theory**

**hiiamboris**

**[21:45](#msg5e5adb678e04426dd014d953)https://en.wikipedia.org/wiki/Finite-state\_machine may do**

**greggirwin**

**[23:27](#msg5e5af362a157485cb466a98e)@GiuseppeChillemi :^)**

**@meijeru et al, rawstring/heredoc is not the same as space significance. It was another old chat, and has been discussed quite a bit by the core team, with the final syntax decision not being made yet AFAIK. What's there now is one possibility.**

****Sunday 1st March, 2020****

**Oldes**

**[09:26](#msg5e5b7fbbff6f6d2e887a4a2a)@greggirwin I don't know who came with this syntax, but it looks quite good to me.**

**[09:29](#msg5e5b8064d045e25825088462)Funny that it was me who was requesting it 11 years ago:) https://github.com/rebol/Rebol-issues/issues/1194**

**meijeru**

**[13:15](#msg5e5bb5628e04426dd01689be)@greggirwin The space significance discussion does not interest me so much at the moment. I am more interested in the Team's vision on "brackets", i.e. paired delimiters.**

**[15:43](#msg5e5bd82e8e04426dd016dcea)Now that the `%lexer.r` code for raw strings has been published, I understand better what the delimiters are: one or more `%` followed by `{` and `}` followed by an \_equal number_ of `%`. This was not so clear from the fast-lexer code...**

**greggirwin**

**[18:38](#msg5e5c01117fef7f2e8994e4a2)@Oldes some things take time. :^)**

**[19:34](#msg5e5c0e404eefc06dcf2ad2c7)Fast lexer code is deep magic @meijeru.**

**In an analysis I did on possible `lit-string!` syntaxes, I found that aligning with existing syntax makes things easier to reason about (for me anyway). The `%{`-based syntax is because these values are both string-like and file-like. I've used `:(...):` syntax in my `composite` because the colon and paren imply, to me, get/set and evaluation, which is what it does.**

**The goal is not to add as many types as possible to Red, or fill the available lexical space, but quite the reverse; to have the minimum number of lexical forms that give us the most power to express things we need to communicate. As you start overloading things, it quickly becomes a question of why \*not* to use a block with multiple values. The key difference comes in dialect processing, where identifying values by type provides enormous leverage.**

**meijeru**

**[21:40](#msg5e5c2beb3ca0375cb394c243)@greggirwin Thanks for your vision statement. I can only agree with the minimal approach. Nevertheless, it is useful to know what "obvious" choices one has if there are some literal forms to be added. I for one buy in to the argument from similarity/analogy.**

**[21:43](#msg5e5c2c80376d882250c5c57a)On the fast lexer code: deep magic may be fine for speed, but what about maintainability???**

**[21:45](#msg5e5c2ce7cb91b5224f04d046)There have been quite a few subtle changes in the transition tables and more will come. Is Doc the only one person who can do this maintenance?**

**greggirwin**

**[22:01](#msg5e5c30a1cb91b5224f04d782)Doc may be the only one right this minute, but and of the deep core team should be able to ramp up without trouble. It's always a tradeoff, but there's also opportunity, because we can do a high level version with `parse`, so they can cross verify each other.**

**meijeru**

**[22:06](#msg5e5c31e8b873303e277308c3)Are you saying the state transition approach is in one-to-one correspondence to a Red parse approach?**

**greggirwin**

**[22:07](#msg5e5c3234ec379e558e9c6ef5)No, just that both should correctly parse the same formally specified Red grammar.**

**[22:08](#msg5e5c326aca2f5a558d5d13e7)Which implies that we'll \*have* a formally specified grammar, and the best way to do that is with `parse` rules. For me, that becomes the definition of correctness.**

**meijeru**

**[22:24](#msg5e5c360aa157485cb46988f7)I had a hope that the parse formulation could serve as documentation, not only as specification, of the state transition approach...**

****Tuesday 3th March, 2020****

**mbk**

**[10:15](#msg5e5e2e4e8e04426dd01c97e4)I know that a year ago or so we saw the beginning of port! implementations for async tcp. UDP and DNS needed to be added - @greggirwin , do you know whether any progress has been made or is planned? Maybe once that's there @giesse and I can join forces to implement some network schemes. I'm especially thinking about the one we had in R2, but also more advanced ones like HTTP/2.**

**rebolek**

**[10:18](#msg5e5e2f05a157485cb46e3d30)@mbk there has been some progress, but it's developed in a private repo for now.**

**meijeru**

**[13:34](#msg5e5e5cd090a829582400f057)A small function to check how many commits you are behind:**  
**`behind: func [/local s c n][ c: load https://api.github.com/repos/red/red/commits s: to-string system/build/git/commit forever [ n: (index? c) - 1 if c/1/sha = s [ alert either n = 0 ["you are up-to-date"][rejoin ["you are " n " commits behind"]] break ] c: next c ] ] ; end behind`**

**rebolek**

**[13:42](#msg5e5e5ed0b873303e277850d9):+1:**

**GiuseppeChillemi**

**[15:54](#msg5e5e7d9eec379e558ea20c71)Wow**

**meijeru**

**[17:01](#msg5e5e8d533ca0375cb39a8bbb)Efficiency improvement: put `n: (index? c) - 1` inside the `if` body.**

**[17:17](#msg5e5e913c4eefc06dcf310f3a)Still more efficient and fool-proof version:**  
**`behind: func [/local s c][ c: load https://api.github.com/repos/red/red/commits s: to-string system/build/git/commit while [not tail? c] [ if c/1/sha = s [ alert either head? c ["you are up-to-date"][rejoin ["you are " (index? c) - 1 " commits behind"]] exit ] c: next c ] alert "commit not found" ] ; end behind`**

**rebolek**

**[18:17](#msg5e5e9f53376d882250cbc53a)You've got `alert` there so it's probably meant for View. So I checked my Core version and - surprise surprise - `alert` is defined there too- Why not, it can be just an alias to `print` with some bells and whistles probably. But no, it's the same `alert` as in View. So a bug.**

**greggirwin**

**[20:02](#msg5e5eb7b9376d882250cc0853)Good catch @rebolek. And I am apparently uncommitted here (commit not found).**

**[20:07](#msg5e5eb8edd045e25825106e29)@meijeru is there a reason you prefer `while` over `foreach` here? I ask because @hiiamboris has done some incredible analysis for HOF design, and I'm interested in how other people think, or why they choose a particular approach, as we move forward on that.**

**hiiamboris**

**[20:49](#msg5e5ec2e03ca0375cb39b2570)he's using `head?`, so probably because of that**

**greggirwin**

**[21:20](#msg5e5eca0a2e398f46abda53a2)Ah, good catch, and `index?` as well, rather than a counter.**

**hiiamboris**

**[21:38](#msg5e5ece597fef7f2e899bce19)An \*integer* index I must add ;)**

**GiuseppeChillemi**

**[21:46](#msg5e5ed03ab873303e27798542)&gt; has done some incredible analysis for HOF design**

**[21:46](#msg5e5ed0402e398f46abda611d)What is "HOF design" ?**

**Oldes**

**[21:48](#msg5e5ed0a353fa513e286925ce)It would be better, if `system/build/git` would be defined even when you do your own home build.**

**greggirwin**

**[21:48](#msg5e5ed0a9cb91b5224f0b4e7e)&gt; An \*integer* index I must add ;)**

**Well played.**

**@GiuseppeChillemi High Order Functions.**

**hiiamboris**

**[21:50](#msg5e5ed136a157485cb46ffc18)@greggirwin I mean, I haven't decided yet if it should be series or integer, not even with a working prototype.**

**greggirwin**

**[22:00](#msg5e5ed39a90a829582402415d)And do we have to choose? Implicit features can be tricky, but sometimes worth it. Much trickier with nesting though.**

**hiiamboris**

**[22:14](#msg5e5ed6b1ec7f8746aaaf04f2)Yeah, maybe so..**

**greggirwin**

**[22:22](#msg5e5ed8aab873303e27799a43)The careful melding of standard HOF (functional) thinking, and pattern-action processors, applied to flat series and structures, as declaratively as possible, with easy to remember rules.**

**I leave it to you. ;^)**

**hiiamboris**

**[22:23](#msg5e5ed8fd7fef7f2e899bea02):D**

**[22:24](#msg5e5ed902376d882250cc5aff)no sweat**

****Wednesday 4th March, 2020****

**loziniak**

**[10:26](#msg5e5f824bca2f5a558d651a72)Hi! Do you think if Red does not have a `view` module implemented for a particular platform, an error could be displayed, when `needs: view` is in header?**

**rebolek**

**[10:27](#msg5e5f82907fef7f2e899d7f00)It makes sense, I guess.**

**loziniak**

**[10:48](#msg5e5f878e2e398f46abdc2a8b)does it qualify this for red/REP?**

**rebolek**

**[11:01](#msg5e5f8a8553fa513e286aef3a)Certainly.**

**x8x**

**[11:27](#msg5e5f90a3ed3fa820211ff522)&gt; It would be better, if `system/build/git` would be defined even when you do your own home build.**

**It should if you build form a git repo, not if you downloaded sources.**

**Oldes**

**[12:28](#msg5e5f9eefec379e558ea50767)I build using git repo, but it is not set. But maybe it is because I'm using build script which is not called from Red's root.**

**meijeru**

**[12:29](#msg5e5f9f203ca0375cb39d53be)@greggirwin Presumably `foreach` would work too, but that would reintroduce an explicit counter. In fact, `forall c` would work best!**

**[12:29](#msg5e5f9f357fef7f2e899de57a)It makes `c: next c` unnecessary.**

**[12:30](#msg5e5f9f5c2e398f46abdc76c6)This is getting to be an interesting exercise in "idiomatic programming".**

**[12:32](#msg5e5f9ff07fef7f2e899de849)On another refinement, I quote "It would be better, if `system/build/git` would be defined even when you do your own home build.". Now if it is not defined, then what value does it have, `unset` or `none`. One could check for this value and exit the function immediately in that case.**

**[12:59](#msg5e5fa64d2e398f46abdc8f75)Interestingly, `forall w [...]` is almost equivalent to `while [not tail? w][... w: next w]`with \_this_ difference: in the `while` formulation the value of `w`at the end is `[ ]` and in the `forall` formulation it is reset to the value at start. If the loop is exited beforehand, both yield the same value of `w`.**

**hiiamboris**

**[13:01](#msg5e5fa6aeca2f5a558d659c48)In my analysis, this feature (offset of the original series being changed) is most often either being forgotten or fought against, rather than leveraged.**

**meijeru**

**[13:11](#msg5e5fa9142e398f46abdc9746)Pity!**

**pierrechtux**

**[13:42](#msg5e5fb05c53fa513e286b6893)Buon giorno, @GiuseppeChillemi**

**&gt; I have a question for seniors which works often with databases tables: in your experience, is there the risk to find a table column name that is not compatible with represented by Red words? I need it to establish the container format to store those tables and I would not user `strings` for speed reasons (it will be used as key for data retrieval)**

**I work quite a lot with databases, and with Rebol, and I can hardly think of a table field name that would not be compatible with Red word naming.**

**But maybe I misunderstood your question.**

**(sorry for late answer: trying to catch up!)**

**greggirwin**

**[18:44](#msg5e5ff70b90a8295824057c55)The analysis on loops Boris did was \*really* interesting to me, because he evaluated how people use one type of loop when another might be more appropriate. As with many things in life, we may not use the best approach, but the one that seems best at the time. This is why some langs that strive to have only one way to do things may seem like a good idea. The more restricted a language, certainly, the more it makes programmers a commodity. That's good for business, but may lead to worse software (hypothesis mine), because it \*prevents people from thinking in new ways when solving problems\*. Here I'll appeal to paraphrased Wittgenstein quotes as authority, about the limits of one's language being the limits of one's world.**

**This came up for me, in a big way, when working on `for/loop`, and questioning whether we can have just one dialected func to rule all loops, but still have flexibility. Same kind of thing for `split`, which I \*really* want to get back to. And `format`, `HOF`, modules, systems... It means we will never have consensus on code, but we can build more restricted systems where that's possible.**

**I do love the idea of a single, well-designed system that everyone agrees is best, but I don't know what the world will look like in 10 or 20 years, when even the 2 other people that think like I do now disagree about what's best.**

**GiuseppeChillemi**

**[20:00](#msg5e6008d5ec379e558ea65db1)@pierrechtux Hi Pierre, I have searched on internet and as SQL server is Redbol word compatible, Maria DB isn't. It permits having numbers in front of the word used as field names like '2move'.**

**[20:03](#msg5e6009a5a157485cb4734d17)This complicates a little the actual code I use to manipulate data in block of block with headings on the first one. Also conversion of headings to objects members is not safe as I have thought, it must be validated first.**

**greggirwin**

**[20:05](#msg5e6009fcd045e25825141cd3)The question is how often that happens, as with JSON key values that aren't valid Red words. But, yes, if a system supports things that aren't compatible with Red, they have to be validated, or use maps instead of objects, which allow strings as keys.**

**[20:05](#msg5e600a1eec7f8746aab259e8)Or separate schema and data objects, so data is just blocks, and a set of wrappers provide access.**

**GiuseppeChillemi**

**[20:24](#msg5e600e8353fa513e286c977d)I have worked on a coding style where I have a set of couples of placeholder/values in a block. They are fed to a `run-query` function together with the query which has the placeholder names which are changed with respective values. Often placeholders are field names and I have to choose if I should store them as words or strings. Words make more simple and faster accessing and modifying the placeholders values with path notation. But if I make this choice I will have problem with some code which auto composes itself querying field names list. I will take a couple of more days to establish the data formats considering the usage patterns.**

**[20:25](#msg5e600ec890a829582405bebe)Probably I will drop support for rare field names or have only a partial support for them.**

****Thursday 5th March, 2020****

**planetsizecpu**

**[08:31](#msg5e60b8ee8e04426dd02379e0)@greggirwin**

**As I have been producing management software for many years, I have read with great interest the conversation about access to databases, I'm not very used to work with SQL although I use it sometimes, but I have really worked in host environment with ISAM files and more archaic tools with direct access to data and rows or records, it sounds to me more familiar instructions like `rewind`, `find`, `insert`, etc, what reminded me of RIF room and the conversation here.**

**Now I think if given the ease of Red to create new dialects, it would be legitimate to think of a specific future dialect (after 1.x) 😐 for the treatment of persistent data, a kind of Hibernate embedded in the language, that provides easy (as Red is) access to data. It is just an idea, but I thought it would be useful and time saver.**

**Do you see it feasible in the long term? or there are other plans.**

**greggirwin**

**[16:39](#msg5e612b41376d882250d301c4)@planetsizecpu we have similar thoughts and experiences. I have some big ideas here, based on old and new designs. The interesting thing, in the more mainstream DB view, is that SQL is no longer the only king. Now, it's data access via APIs fighting for the crown.**

**GiuseppeChillemi**

**[17:03](#msg5e6130efec379e558ea99ac1)@greggirwin Could you provide some links to the relevant trends in data access via API as I wish to update my knowledge?**

**atorres617**

**[18:06](#msg5e613f8fb873303e27803187)I had a quesrion-Not sure if this is the best place. When will Red be at v 1.0, production ready for web development. Also, my hope is to be able to create apps and support the project in the near future.**

**9214**

**[18:23](#msg5e6143b4376d882250d35b86)Hi @atorres617, we don't give any ETAs for version releases (it's done when it's done). Web target is not a high priority in the current roadmap, but Red/Pro will give you some options.**

**&gt; my hope is to be able to create apps and support the project in the near future**

**That's cool! Learning the language and participating in the community is a great way to start. You can find a list of learning resources \[here](https://github.com/red/red/wiki/\[LINKS]-Learning-resources) and see the list of all the chat rooms \[here](https://gitter.im/orgs/red/rooms).**

**atorres617**

**[19:29](#msg5e61530790a8295824096c69)Thanks @9214**

****Friday 6th March, 2020****

**proksi21**

**[03:31](#msg5e61c41153fa513e28715201)What is Red/Pro**

**hiiamboris**

**[10:05](#msg5e62204f17e80330db4f70f5)^ A candidate into FAQ**

**proksi21**

**[11:51](#msg5e62394dafdc1e2033d324c1)I’ve found some answers in the blog :-)**

**planetsizecpu**

**[14:27](#msg5e625dde17e80330db503e71)Thx Gregg, IMHO doing well and easy in the sense of DB will allow Red to enter the big players league and succeed.**

**henrikmk**

**[14:33](#msg5e625f1f4aa9482c9ba4d45f)Red/Pro should come with a black console and dark gray VID style to imply that it's professional and more serious. :-)**

**rebolek**

**[14:37](#msg5e62601cf953aa4499ce4348):)**

**GiuseppeChillemi**

**[20:02](#msg5e62ac4c63d3f32034645185)We should also dress like a Men in Black agent!**

**rebolek**

**[22:25](#msg5e62cdf263d3f3203464ac0d)Wait, you don't?**

**GiuseppeChillemi**

**[22:30](#msg5e62cf05f953aa4499cfadfb):-D**

**greggirwin**

**[22:56](#msg5e62d53aafdc1e2033d52b3a)@GiuseppeChillemi on data access and APIs, simply look at the cloud trend, GraphQL, and SaaS services that really only provide a data model and store for specific use cases.**

****Saturday 7th March, 2020****

**pierrechtux**

**[17:35](#msg5e63db78e203784a5592278b)@planetsizecpu Oh yes, I totally agree.**

**[17:37](#msg5e63dbcbcc10be22a0705467)@greggirwin Yes, this is a quite funny trend; on the other side (I mean, the server's side) though, SQL is still quite widely used.**

**[17:37](#msg5e63dbf7a2ccef3232db18ba)Maybe I'm biased on this matter, as I'm a PostgreSQL quite heavy user.**

**greggirwin**

**[18:16](#msg5e63e4e947b4247925315890)@pierrechtux, look at it this way, whether it's better or not, if you're a SaaS provider, using SQL directly lets your customers move to another vendor much more easily. Once you lock them into your API, it's much harder for them to leave.**

****Sunday 8th March, 2020****

**pierrechtux**

**[11:15](#msg5e64d3efcc10be22a0723eee)@greggirwin You're very right. But should Red only focus on customers' side? Why not also focussing on servers' side?**

**Personaly, I think we should just simply focus on conquering the whole world, without any fear nor any mercy for all other languages.**  
**Oops. Sorry.**

**GiuseppeChillemi**

**[13:07](#msg5e64ee025348b33231ae0c6d)I have read that the semantic space is tightening and I have a question: could we have a semantic with 2 characters reserving one as "escaper"? (#! #/ #&amp; are just ideas....)**

**meijeru**

**[17:09](#msg5e6526d78011bb652afe708e)Pardon me, but I think you mean "lexical space". I refer to an earlier post of mine on this subject, where I pointed out that, as far as brackets were concerned, several combinations were still free. I did not mention non-bracketed constructs, but obviously, these have to be considered as well. Some are already reserved, like @... for the coming `ref!` type, if I am not mistaken. The Red team might be able to shed more light.**

**GiuseppeChillemi**

**[17:39](#msg5e652dd380cc7b7924afbcf8)@meijeru thanks for the correction, I still do not manage such terms but you have understood.**

**greggirwin**

**[18:36](#msg5e653b4502dbe022a174819f)@pierrechtux world domination is the goal. ;^)**

**@GiuseppeChillemi `#!` and `#&` are already valid issues, though not likely used. The main question, though, is what is the use case, and once you have an escaped form, how is it used? How does it differ from construction syntax? What is the driving need for it?**

**GiuseppeChillemi**

**[21:54](#msg5e65697fff8bf14a54437ab3)@greggirwin As I have read about the danger that lexical space is tightening, I have thought that a character could be reserved to extend the lexical space. We are ending it for 1 character forms but 2/3 characters forms are possible and reserving one character for this purpose could be useful Note: it is not a request, just an observation.**

**greggirwin**

**[22:04](#msg5e656be0a2897318a996f8bf)There is no such thing as extending the lexical space. All we can do is divide up how it's used. If you reserve space for one use, it takes that space away from all other uses.**

**GiuseppeChillemi**

**[22:39](#msg5e657422e203784a55958a85)Yes but adding a character at the start of any other, all the previously used combination become available again. So, reserving a char (choose a free one) for this purpose create a new free lexical space. Let's suppose `#` is free. Then you can have `#:` `#@` `#'` `#"` and so on. If you add 2 `##` you can have all the previous combination in 3 characters form: `##:` `##@` `##'` `##"`. Is it wrong?**

**greggirwin**

**[23:41](#msg5e6582a3d17593652b6f626f)First, don't suppose `#` is free, because it's not. Choose another char like `&`.**

**Second, yes, your analysis is incorrect. Reserving a character does \*not* create new free lexical space. As I said, it takes that space away from everything else. It simply allocates space that wasn't used yet. Now there's less space, not more.**

**And you didn't answer my questions. The reason I ask questions is because we need to look at root causes, not symptoms. Please answer my questions before asking any more.**

**GiuseppeChillemi**

**[23:51](#msg5e6584e7cc10be22a073c9fa)@greggirwin simply I am thinking of a way of freeing the characters combinations which have been already used, that's the purpose. I think that each `%` we add make the combinations of the previous level avaliable again.**

****Monday 9th March, 2020****

**Oldes**

**[06:37](#msg5e65e40fe203784a559669f9)The question is for which purpose?**

**GiuseppeChillemi**

**[13:21](#msg5e6642d2cc10be22a07593fe)&gt; simply I am thinking of a way of freeing the characters combinations which have been already used, \*\*that's the purpose\*\*.**

**beenotung**

**[15:42](#msg5e6663de80cc7b7924b2c4c8)will red support the web platform?**

**9214**

**[15:46](#msg5e6664c802dbe022a1777060)@beenotung that was already \[answered](https://gitter.im/red/red?at=5e6143b4376d882250d35b86) a few messages above yours.**

**beenotung**

**[15:51](#msg5e6665eed17593652b71be90)Just want to see it the plan is changed**

**9214**

**[15:54](#msg5e66669b02dbe022a17775e2)No, nothing changed in the past 4 days. We stick to the roadmap and don't plan to deviate from it.**

**beenotung**

**[15:55](#msg5e6666e7145f4d69562dcfa2)thumbs up for your concentrated focus**

**proksi21**

**[17:04](#msg5e6677258011bb652a01ca0b)Btw, is there a roadmap for 2020 anywhere?**

**9214**

**[17:23](#msg5e667b87a2897318a999d982)@proksi21 the main gist can be inferred from the blog posts.**

****Tuesday 10th March, 2020****

**justinthesmith**

**[01:51](#msg5e66f2b2145f4d69562f7c87)Hey @GiuseppeChillemi, your method does not create new lexical space. Suppose for example `@` was used for a `ref!` type. Using `@@` as an escape sequence as you suggested gains lexical space in one place, but loses the same amount of lexical space elsewhere--in this case we'd lose the ability to specify `ref!`s that begin with `@`. The net lexical space is the same--you've just shifted the problem somewhere else. There's a law of conservation of lexical space: you cannot create free lexical space out of nothing.**

**GiuseppeChillemi**

**[06:15](#msg5e67309202dbe022a179abf0)@justinthesmith you are right, taking a character lexical space is always lowered, but let's take a free one for a moment (I don't know which one is actually free) and use it to define a subspace. Does not seem true to you the affirmation that in this subspace all the symbols of the main one are now available again apart the symbol used to define the subspace? It seems, as generic law, that using this technique we can have infinite subspaces where each of them has all character combinations available -1, which is the one we use to define them.**

**Oldes**

**[06:19](#msg5e673188f046a30bbe5412e5)For which purpose? Why you need infinit subspaces? Which would look ugly btw.**

**GiuseppeChillemi**

**[06:30](#msg5e6734025348b33231b3efd4)Oldes, I have shared an observation about lexical spaces where all characters -1 are again free using an escaper. I don't know if this is real and we can call it a law. If it is real we can keep it for further use as lexical space is lowering. You are free to confute it if my intuition is wrong.**

**greggirwin**

**[08:25](#msg5e674f10d17593652b7443da)@GiuseppeChillemi if you want to continue this conversation, please take it to chit-chat.**

**GiuseppeChillemi**

**[08:39](#msg5e67524a8e423969577c0480)@greggirwin I know where it ends this road: its a sentence of death for the discussion as no one follows what has been moved to chit-chat. About this topic, I think that I gave myself an answer on subspaces while discussion with you. So we can end it here.**

**rebolek**

**[08:41](#msg5e6752acff8bf14a54488df4)It's no death sentence, it's a request for keeping conversation on topic.**

**pekr**

**[08:42](#msg5e67530e80cc7b7924b5563d)@rebolek But sometimes good things emerge from chaos ... or at least that is the theory :-)**

**GiuseppeChillemi**

**[08:43](#msg5e675320a2897318a99c1b9e)properties of the lexical subspaces when someone writes "charactes avalabiity is tightening in Red" = on topic ;-)**

**rebolek**

**[08:43](#msg5e675347d17593652b744dbd)@pekr yes, but we would like to keep chaos in chit-chat or sandbox :-)**

**pekr**

**[08:46](#msg5e6753dbcc10be22a07896ef)If 0.6.5 or IO release would emerge out of the chaos universe this week, I would not protest :-) OK .... enough ....**

****Saturday 14th March, 2020****

**realTopXeQ\_twitter**

**[13:29](#msg5e6cdc351f0d285eb27b3c2d)Hi, is it possible to use regex in red code?**

**[13:30](#msg5e6cdc6f391cb312fadaca46)and when will version 0.65 be released?**

**[13:30](#msg5e6cdc751f0d285eb27b3c8e)I need JSON parsing**

**hiiamboris**

**[13:37](#msg5e6cde10d86c595eb101653d)@realTopXeQ\_twitter Red supports JSON directly with `load/as` and `load-json`**

**realTopXeQ\_twitter**

**[13:38](#msg5e6cde47d86c595eb10165ad)already in 0.6.4 or 0.6.5?**

**hiiamboris**

**[13:39](#msg5e6cde7a034f6b7b24df89ac)Already in 0.6.4 (nightly builds)**

**realTopXeQ\_twitter**

**[13:43](#msg5e6cdf9a17d3e742347be847)ok, thanks**

**greggirwin**

**[15:32](#msg5e6cf8fd1cf20f12f95e3ab7)@realTopXeQ\_twitter you can use \[this](https://gist.github.com/toomasv/58040ccbbfb70150dee90ba0e27b16b8) for regexes, but we recommend learning `parse` for Red work.**

**loziniak**

**[15:37](#msg5e6cfa4c17d3e742347c27d0)Seems like \[this](https://github.com/toomasv/regex) is more up-to-date.**

**greggirwin**

**[15:45](#msg5e6cfc189f25f2238b8065f3)Thanks @loziniak.**

**toomasv**

**[18:53](#msg5e6d2835d86c595eb10225ff)I'm afraid both are broken.**

****Sunday 15th March, 2020****

**realTopXeQ\_twitter**

**[04:49](#msg5e6db3c89f25f2238b81e947)Thanks @greggirwin @loziniak**

****Monday 16th March, 2020****

**meijeru**

**[17:00](#msg5e6fb0a6d86c595eb108f7a2)I greet the advent of the `money!` datatype (see the new `money` branch), but ask myself if the `fast-lexer` branch is now complete to the point where it can be merged. I notice that the `money` branch incorporates all (?) of the `fast-lexer` branch, so my hopes are high...**

**[20:27](#msg5e6fe129de52695245db0dca)I note that, when used as part of a money literal (after the `$`), float literals may not use the exponent notation, must have at most 5 decimal digits and at least one digit before the decimal point. At least that is what `lexer.r` says. What the runtime (fast) lexer does is not so clear to me.**

**greggirwin**

**[20:55](#msg5e6fe7b78245036ed258c21e)Money with exponents makes no sense, which is by design for the lexical form. The 5 digit limit is based on the current implementation. Requiring a leading digit is a tradeoff. It may seem less convenient (R2 didn't require it), but in terms of consistency it's nice, as that's the normalized form. Floats don't do this, but they serve different purposes and so can have different rules.**

**[20:57](#msg5e6fe824de52695245db2040)Imposing a limit on decimal digits provides a check against the current implementation, which won't break anything if removed later.**

**meijeru**

**[21:04](#msg5e6fe9f3c8ddaf238c8cc558)Thanks for the explanation. My question on the finalizing of the fast-lexer branch has not been answered, nor is it obvious what the distinctive properties of the money datatype are/will be.**

**greggirwin**

**[21:23](#msg5e6fee43391cb312fae31a91)I can't speak to fast lexer, but money's goal is to not suffer floating point rounding errors.**

**hiiamboris**

**[21:24](#msg5e6fee8d65758a0f97f92a5a)Any reason for using BCD instead of just 90+bit integer arithmetic?**

**greggirwin**

**[21:25](#msg5e6feec569387244e3986e96)Another thing I can't speak to. :^)**

**hiiamboris**

**[21:25](#msg5e6feec91cf20f12f9668a21);)**

**[21:27](#msg5e6fef33c8ddaf238c8cd8be)I thought there was a 128-bit integer implementation even, somewhere in Red/C3.**

**GiuseppeChillemi**

**[21:30](#msg5e6feff02e5bb1702b52a5ee)@9214, @dockimbel and anyone else involved: thanks for \[this](https://github.com/red/red/commit/a44ab7c5ef22862cd649a9f716f4fe3fa3107367)**

**hiiamboris**

**[21:31](#msg5e6ff03f69387244e3987332)And shouldn't we consider also cryptocurrencies in money datatype? I think they are usually expressed with 8 digits after the decimal point. Fiat seems so dead today ;)**

**meijeru**

**[21:33](#msg5e6ff0c3de52695245db35ac)`red-money!` structure has 11 bytes room for BCD payload (unsigned); with 1 nibble per digit I come to 22 digits precision; I suppose the sign must be in the first byte even thought this is labeled "currency index" (will we have euros and pounds in addition to dollars?); furthermore I see no evidence of a scale factor, therfore with maximum 5 decimals, I suppose the range is at least 10\*\*17.**

**hiiamboris**

**[21:34](#msg5e6ff0dbde52695245db35ed)Sign is in the cell header.**

**meijeru**

**[21:36](#msg5e6ff1608245036ed258db87)Then we have room for 256 different currencies; how are these indicated when there is only one literal format?**

**hiiamboris**

**[21:39](#msg5e6ff220391cb312fae32494)https://www.iban.com/currency-codes lists \*\*265\** fiat currency codes, ~~so even for fiat it's not enough.~~ Nevermind. There are duplicates there so should be OK.**

**GiuseppeChillemi**

**[21:55](#msg5e6ff5e427fc6910a4253aac)@hiiamboris what is "fiat" ?**

**loziniak**

**[21:57](#msg5e6ff630de52695245db43de)"fiat" is traditional currency – USD, EUR, etc., in contrast to cryptocurrency like ETH or BTC.**

**greggirwin**

**[21:59](#msg5e6ff6a765758a0f97f93e88)Whether to treat crypto values as money was a talk we had, and under the dust my brain says the needs were quite different, and that we would keep them separate. Some things are still TBD, like a big decimal type, Dec64, etc.**

**loziniak**

**[22:00](#msg5e6ff71269387244e39882ae)BTC has 8 decimal places, smallest indivisible part being "satoshi", but ETH has default of 18 decimal places, smallest indivisible part is called "wei".**

**hiiamboris**

**[22:01](#msg5e6ff73e27fc6910a4253e1a)Wow. That's \*precision\*. Thanks for clarification ☻**

**greggirwin**

**[22:02](#msg5e6ff779c5c6b744e218b1e9)Yes, the 18 decimal limit is something that came up on the Dec64 work, because it's only good to 16. :^\\**

**[22:03](#msg5e6ff7a79f25f2238b888203)There's "future-proof" and there's "not useful except maybe in the future".**

**hiiamboris**

**[22:03](#msg5e6ff7c827fc6910a4253f75)Dec64 is probably only good for 16 \*total* digits, not 16 after the decimal point ;)**

**loziniak**

**[22:06](#msg5e6ff8772e5bb1702b52b9d7)From what I know ETH balances are expressed as 256bit numbers, so 11 bytes could be not enough.**

****Tuesday 17th March, 2020****

**meijeru**

**[09:06](#msg5e70930430ea7f57f72c6b80)"Some things are still TBD, like a big decimal type, Dec64, etc." What about `bignum!` -- that is already on the books, I thought.**

**greggirwin**

**[09:27](#msg5e7097e5ebcea00e68fbbd9d)That's part of "etc.". :^) It should really be called `bigint!` for the normal cases, but that's also where `big-decimal!` or `dec64!` go a long way. Not all the way for special cases though. These decisions are hard, because there is no right answer, just tradeoffs. Not-huge values are the norm, and correctness is primary, so that should be the default use case. Ideally, if you're not writing code that requires hundreds of digits, or highly optimized math, you never have to think about it. If you need those things, you do.**

**meijeru**

**[20:13](#msg5e712f5dd7ed052d75d11287)Currency indicators have made their appearance (e.g. `EUR$100.0`). Interesting question: will the toolchain allow operations between two money values with different currency indicators (e.g. `EUR$100.0 + USD$50.0`)? And how about adding an "anonymous" money value (no indicator) to one having an indicator?**

**greggirwin**

**[20:39](#msg5e71356bebcea00e68fe1ab2)We must support a `$0.00` form. Operations between different currencies should not be allowed. If we ever add `unit!` support, conversions within compatible units will be allowed, but not others. Different currencies fall into that area, not because they are different "unit" types, but because there is no normalized value for them. i.e., we can't provide an internal formula for the conversions.**

**pekr**

**[20:40](#msg5e7135c163cbdf33ea405df2)What is the money type good for? Does it serve as kind of BCD type?**

**greggirwin**

**[20:46](#msg5e71370a30ab0c3ff01e3dae)It currently \*is* BCD. The goal is to avoid financial rounding errors.**

**pekr**

**[21:27](#msg5e7140a6c5f8ab54fcaf6b1d)OK, with R2, it was not BCD, right?**

**endo64**

**[22:18](#msg5e714cb77037fe0c8d024e8f)No it wasn't BCD in R2/R3.**

**greggirwin**

**[22:23](#msg5e714de95062e96f7148e52d)R2 money was float, so not correct. R3 had `decimal!`, which was correct, and also used for `money!`.**

****Wednesday 18th March, 2020****

**CodingFiend\_twitter**

**[04:40](#msg5e71a6575062e96f7149a3d8)In my Beads language i have toyed with a money type, as i already have physical units of measurement such as Angle, Energy, Power, Pressure, etc. and store internal exponents so you can track the units at runtime for mistakes. Money presents some intriguing problems. Depending on the currency you select, you might want 0 or 2 digits after the decimal point (but probably never 1). You don't want to see a monetary amount in USD of $3.1, $3.10 is the correct form. And when one is doing percentage splits, where for example you have 3 people splitting $100, you get 33.33, 33.33 and 33.34. In clever banking programs they always take that penny and put it into the house's account. I remember in the 70's a mainframe programmer for some firm put the fractional amounts into their own account and made some serious money as every transaction will typically have some rounding issues. In strict financial products these fractional amounts cannot disappear. So one wants to truncate calculations except for the final one which gets the leftover so it all adds up. There are some other subtleties as well, but i would have to refresh my mind in a conversation with a COBOL programmer which was the dominant language for the financial industry back in the day when all these problems came to light.**

**realTopXeQ\_twitter**

**[14:40](#msg5e7232e6c0def7582156585e)How could I extract all the mobile phone numbers from a piece of text using Parse? Could you show me an example?**

**rebolek**

**[14:48](#msg5e7234d1097e6b696142cf09)@realTopXeQ\_twitter what if format of your mobile numbers?**

**[14:50](#msg5e723530ffcccd0a9ed93065)Here is some simple example:**  
**`>> text: "My number is 123456 and your number is 987654" == "My number is 123456 and your number is 987654" >> digit: charset "1234567890" == make bitset! #{000000000000FFC0} >> parse text [collect [some [keep some digit | skip]]] == ["123456" "987654"]`**

**realTopXeQ\_twitter**

**[14:56](#msg5e723681c01f9314d88949de)really helpful, thanks @rebolek**

**rebolek**

**[14:56](#msg5e7236ba7bba3a76f628b98d)You're welcome. Of course, if your number is in a more complex format, you need to change the rule accordingly, but this is the basic idea.**

**realTopXeQ\_twitter**

**[15:02](#msg5e7237fdffcccd0a9ed9391f)That's OKk thanks.**

**meijeru**

**[15:10](#msg5e7239d8d5205d3f78e2fbd4)I have added quite a bit of semantics for the new money type to the \[specification document](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc); perhaps the originator @9214 could have a look to see if it is OK. Sections 5.2.18, 5.3.14 and 5.4.7 apply.**

**greggirwin**

**[17:20](#msg5e7258493039fa3d9286eb84)Thanks @meijeru. E notation should not be allowed at all for `money!`, not just for decimal (part) values.**

**meijeru**

**[18:13](#msg5e7264ccc01f9314d889e9c3)I thought I wrote just that; or are you referrring to the float value in the block that is argument to `make`?**

**greggirwin**

**[18:17](#msg5e7265a74aec312c1f8f3999)https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#money**

**&gt; Float literals may not use the exponent notation**

**meijeru**

**[18:17](#msg5e7265ab21a6aa338c172fa4)I would be interested in the rules governing arithmetic operations involving money and other type values (char, integer, float, percent). It is possible to deduce these from the implementing code, but it is somewhat tedious...**

**greggirwin**

**[18:21](#msg5e7266c1c01f9314d889f07a)@9214 is the best choice to write initial `money!` docs, which should cover that, and from which questions can be addressed. `Char!` should not be supported for money ops.**

**meijeru**

**[22:24](#msg5e729f818efb7417d7c8cdb6)I have anyhow made a first attempt, and it proved simpler than I thought. I note that currency indicators are not checked (yet).**

****Friday 20th March, 2020****

**meijeru**

**[13:25](#msg5e74c45699ee91115b336d88)Nevertheless, I added the (intended) restriction (note to table in 8.1).**

**greggirwin**

**[19:01](#msg5e7513064f537701a0b47f55)New blog post up: https://www.red-lang.org/2020/03/gtk-fast-lexer-money-deep-testing-and.html**

**pekr**

**[19:03](#msg5e75138f671a621fe0a21974)Ha! Thanks :-)**

**GiuseppeChillemi**

**[23:20](#msg5e754fc2546ed07a6e802df7)I have seen the announce and the Railroad diagram creator. I have a question: will @toomasv diagram dialect be kept on par with the engine used into this product?**

****Saturday 21st March, 2020****

**greggirwin**

**[00:25](#msg5e755f0889723051b6a5372e)@GiuseppeChillemi, no. There will surely be open source experiments and examples, but also closed source projects like DiaGrammar that have more secret sauce in them.**

**GiuseppeChillemi**

**[09:56](#msg5e75e4b37510440e452324f6)@greggirwin you know my position on this topic. I available to support a model where I (we) yearly fund even an higher price that cost of each software you create and have it open. Closed software removes values to a community like our.**

**GaryMiller**

**[20:02](#msg5e7672e40c192537c60c762e)**

**[20:12](#msg5e76751f3d7c627ce1aba1f7)Will each new feature added to Red reduce the maximum program size that the user's program can be because of the constraint of the 32 bit memory model of Red2 compiler? This is what seems to have happened to my project with the new Lexer branch. As I get an error saying the console and compiler ran out of global memory. I am still able to use console and compiler fine with red-03dec19-c0b8ff49.exe and am adding to size of my code with that version on a daily basis. Since 64 bit is currently not on the roadmap, are there any other features like virtual memory or modules coming down the road that would prevent programs from being constrained by the 32 bit address space.**

**hiiamboris**

**[20:31](#msg5e7679be5831300e1e1e06d6)You seem to be confusing 32-bit address space and R2's limitation on 32'000 words.**

**[20:34](#msg5e767a5825555d195ebbcc51)Also don't you think that if you're using so many words in your program then it's a deficiency in your design? Or am I recalling it all wrong, and it's not the word count problem you experienced?**

**GaryMiller**

**[21:18](#msg5e7684b0bcd4df6263185911)The message from the compiler was as follows...**

**My number of words was not that high around 2,700 but my number/length of string constants that get assigned to the words used is very high.**

**I have over 20K Pattern strings and 20K Response strings that get assigned to the same two variables in a loop that are passed to the Levenshtein function, And 2 large objects with a few hundred attributes each to store short-term memory inductions from the conversation taking place.**

**So I am assuming that global variable space that it mentions is where it stores the strings.**

**PS C:\\Red&gt; .\\red-latest.exe -r .\\ZandraGUI.red**

**-=== Red Compiler 0.6.4 ===-**

**Compiling C:\\Red\\ZandraGUI.red ...**  
**\*\** Red Compiler Internal Error: Internal Error : No more global variable space**  
**\*\** Where: duplicate-symbol**  
**\*\** Near: [forall path [**  
**append words either integer? item: path/1 \[item] [**  
**get?: to logic! any \[head? path get-word? item]**  
**get-path-word item clear blk get?**  
**]**  
**]**  
**emit words**  
**]**

**PS C:\\Red&gt;**

**9214**

**[21:26](#msg5e7686701d73bb22eb977b2b)&gt; My number of words was not that high around 2,700**

**Are you counting all the unique `any-word!` values being used across the entire project?**

**hiiamboris**

**[22:51](#msg5e769a8999b62156fe87cc0d)Declaring 7517 words is enough for Red 28-Feb-2020 to crash during compiling**

**[22:56](#msg5e769ba599b62156fe87cdae)I suppose, every word found x four variants (normal, get-, set-, lit- ?) + 2.7k words native to rebol or used by the compiler itself. At least that's what makes 32.7k**

**9214**

**[23:29](#msg5e76a349794f3a56b38bce86)No need for `* 4`, `any-word!`s of different datatypes but with the same spelling have the same symbol (and sometimes a chain of differently cased symbols, all resolving to the very first one). Though, you might extend it to `all-word!` by counting `refinement!` and `issue!` which are also symbol-like datatypes. Anyway, the limit comes from Rebol2 (even the error message is doubled: one from Red compiler, another from Rebol itself).**

**GaryMiller**

**[23:46](#msg5e76a76699b62156fe87e439)I remembered high. Here is the image with my debug statement for word count.**  
**https://files.gitter.im/GaryMiller/SJrr/image.png**  
**The numbers on the upper left are the debug statement I got from Greg to get the word count.**

****Sunday 22nd March, 2020****

**9214**

**[00:30](#msg5e76b18b5831300e1e1e7aa1) @GaryMiller FYI, face's text is synced with data facet by loading it; anything that looks like a word will add up to the count. This was actually one of the issues that kickstarted work on the new lexer, and it should be fixed by now. Anyway, you never give us any specifics WRT you code, so all we can do is just to hazard a guess and speculate.**

**GaryMiller**

**[01:57](#msg5e76c5ee05db386b5f2c043a)\[Zandra.zip](https://files.gitter.im/red/red/QVAU/Zandra.zip)**

**[01:58](#msg5e76c6603d7c627ce1ac4267)Zip file should contain all the files needed to run under Windows 10. It uses a speech program for Windows so will not work under Linux.**

**greggirwin**

**[03:18](#msg5e76d8f32b09863595a3d652)@GaryMiller DiaGrammar is a separate product, unrelated to Red/Pro.**

**JesterOrNot**

**[03:55](#msg5e76e1a74f537701a0b84937)How can I print ansi codes in Red?**

**[03:55](#msg5e76e1cf2b09863595a3e43d)I tried `print "Hello world from \x1b[31mred\x1b[m"` and it did not work**

**[04:20](#msg5e76e78f6241ff2ebca12ea6)Never mind figured it out for future reference it is `print "Hello world from ^(esc)[31mred^(esc)[m"`**

**greggirwin**

**[04:48](#msg5e76ee381d73bb22eb9831eb):+1:**

**hiiamboris**

**[14:56](#msg5e777c9c2b09863595a5242a)@GaryMiller I reported your issue here: https://github.com/red/red/issues/4361**  
**As a temporary workaround I suggest either replacing every repeatable path with words only, e.g. `AI/Memories:` -&gt; `set in AI 'Memories`. It will compile after that. Or better, refactor the code to minimize the repetition.**

**GaryMiller**

**[17:31](#msg5e77a0e61caa0d55ba9f5626)@hiiamboris A thousand thanks for being able to reproduce the problem! I can continue to use the older version Dec-19 which still works until I can see if this bug can be fixed. I can continue to grow my code and if the bug doesn't get fixed then if I am understanding you correctly I just need to change any object attribute (path) that gets repeatably assigned to like AI/Memories with a simple global word like AIMemories and that should correct the problem? I tried to use object attribute (path) so that later I could have two instances of the AI active at one time and I could have them talk to each other and add additional response variability when they got stuck in a repetitive conversational loop. Eventually when program message passing is possible I'd like to have different AI's running in separate .exe conversing and if not using the object attributes is more efficient I could eliminate them at that time.**

**greggirwin**

**[18:25](#msg5e77ad93dca65f4b20e3fd68)Thanks for diving into that @hiiamboris.**

**GiuseppeChillemi**

**[20:42](#msg5e77cdd1677c311b0ab53a7f)@hiiamboris great work!**

****Wednesday 25th March, 2020****

**meijeru**

**[10:26](#msg5e7b31f28b56d536b4948ca7)I have noticed (before) that there are a number of functions labeled "For internal use only". There is a (theoretical) danger that users define another function with the same name and and impede the working of the toolchain. One solution could be to start the names of these functions by a chosen character (say back-tick or exclamation mark) and advise the users to avoid this initial character in their names.**

**rebolek**

**[10:31](#msg5e7b3302e7ae032e73c68d10)@meijeru I hope that with modules these functions won't be exposed, so the problem will disappear. Changing the codebase temporarily seems like unnecessary work to me.**

**meijeru**

**[10:40](#msg5e7b3522da0214537b04aaa5)I hope so too, but what is your estimate for "temporarily"?**

**rebolek**

**[10:42](#msg5e7b35b39ee489692833a0d0)Soon™ ;-) How much work would it be to change \*and* test everything?**

**meijeru**

**[10:58](#msg5e7b39590686790f6183bb1c)At least I have warned :smirk:**

**greggirwin**

**[19:45](#msg5e7bb4d5b25fc07b7cf09171)`Protect` is probably the simpler solution. I believe Smalltalk has always had this risk, though never marked anything as "internal use only".**

****Thursday 26th March, 2020****

**BeardPower**

**[21:43](#msg5e7d221928248e1cff37807e)I got a compilation error:**

**C:\\Users\\haral\\Development\\languages\\red&gt;red-064.exe -t RPi -o console\_rpi.exe -r environment\\console\\CLI\\console.red**

**-=== Red Compiler 0.6.4 ===-**

**Compiling C:\\Users\\haral\\Development\\languages\\red\\environment\\console\\CLI\\console.red ...**  
**...compilation time : 1736 ms**

**Target: RPi**

**Compiling to native code...**  
**\*\** Compilation Error: undefined symbol: init-console**  
**\*\** in file: %/C/Users/haral/Development/languages/red/environment/console/CLI/input.red**  
**\*\** in function: exec/terminal/setup**  
**\*\** at line: 521**  
**\*\** near: [**  
**init-console**  
**]**

**C:\\Users\\haral\\Development\\languages\\red&gt;**

**Respectech**

**[22:57](#msg5e7d334d10235831bf015899)I haven't run into anything like that. But I also haven't done much compilation for ARM targets either.**

****Friday 27th March, 2020****

**Oldes**

**[16:07](#msg5e7e24dc7f06b57bd8232cd9)Would it be too radical change (breaking backward compatibility) to modify `debase` and `enbase` to always accept the `base` value as a first argument?**

**So instead:**  
**`debase/base something 32`**  
**It would be:**  
**`debase 32 something`**

**greggirwin**

**[17:47](#msg5e7e3c45426d5b06bf8ed29a)Then it would be backwards from the normal order of args, where the value you're operating on comes first.**

**Oldes**

**[18:14](#msg5e7e429eb407e11e3cbb2f86)Is it so important in this case?**

**9214**

**[18:18](#msg5e7e43674a4f8e0a100cae93)@Oldes the onus is on you to convince everyone why \*your* case is important and worth diverging from 20-something years old conventions.**

**\[Red should...](https://github.com/red/red/wiki/%5BDOC%5D-Red-Should...-%28Feature-Wars%29)**

**Respectech**

**[18:19](#msg5e7e43b0f465c801f873b926)Generally, conventions are put in place so one does not have to keep in mind all the exceptions.**

**Oldes**

**[18:31](#msg5e7e467ff95592102b2e8e6d)@9214 I just politely (I hope) asked. Don't need to start any wars.**

**[18:32](#msg5e7e46b7dbf843195f2e1957)@Respectech Have you told it to Carl, when he introduced `decode` in R3?**  
**`>> ? decode USAGE: DECODE type data DESCRIPTION: Decodes a series of bytes into the related datatype (e.g. image!). DECODE is a function value. ARGUMENTS: type -- Media type (jpeg, png, etc.) (word!) data -- The data to decode (binary!)`**

**9214**

**[18:38](#msg5e7e480d426d5b06bf8ef124)No one is starting any wars, I merely asked for rationale and substantive arguments.**

**Oldes**

**[18:38](#msg5e7e4843426d5b06bf8ef18f)http://www.rebol.net/cgi-bin/r3blog.r?view=0184**

**greggirwin**

**[18:39](#msg5e7e485c770a892bfb15c1f2)@Oldes, I do believe it's important to be as consistent as possible with this particular convention. What is your reason for wanting to change it? There may be a middle ground, where we remove the refinement and always require a base argument. The idea of `system/options/binary-base` to shorten that was a nice idea, but more problematic than helpful IMO.**

**Oldes**

**[18:42](#msg5e7e4919b407e11e3cbb3fe4)`system/options/binary-base` is how binary data are displayed in console, I'm talking about using functions to convert some data on demand.**

**[18:43](#msg5e7e4936c8bfec7e2c60d5ba)I have two reasons: I visually don't like `*base/base` and if not used on variable, you have to look which base to use at tail of the value/expression, which should be encoded. And the expression may be quite long.**

**[18:45](#msg5e7e49d2f95592102b2e97af)I don't say, Red should be changed. I just asked if the change would be a big problem.**

**greggirwin**

**[18:47](#msg5e7e4a4b63c1c130d5cc93bd)Ah, I misremembered that R2 also used the option for default basing.**

**So what about always requiring a `base` arg, and removing the refinement? The arg order affects a \*lot* of funcs, so that's only making it inconsistent with others, which are used much more often. e.g. `append`.**

**Oldes**

**[18:48](#msg5e7e4a6c63c1c130d5cc9465)Imagine that you want to teach someone about this type of encodings in a console.. I don't know how for you, but need to write this `base/base` is a problem for me. It is really anoying.**

**9214**

**[18:49](#msg5e7e4ad4284f2a59a9c9e28f)Then create mezzanine wrappers that suit your teaching needs.**

**Respectech**

**[18:50](#msg5e7e4af1c8bfec7e2c60db1d)@Oldes I wasn't involved much in the R3 discussions. I was excited about some of the new things introduced in R3 that never materialized, like /services. But Red can pick up where R3 left off.**

**Oldes**

**[18:51](#msg5e7e4b33f95592102b2e9c73)I still think that be able to see the `base` value next to the `base` word makes sense. (without need to write mezzanines)**

**greggirwin**

**[18:54](#msg5e7e4bdcdbf843195f2e2681)It looks like `enbase` isn't used and `debase` only in a couple places, in the Red codebase. Many tests to update, but that's OK.**

**I disagree on arg order. It just makes it different from everything else.**

**Oldes**

**[18:55](#msg5e7e4c3af465c801f873cf01)Ok... even always requiring the `base` value would be an improvement.**

**[18:57](#msg5e7e4c7c59057617f0473b77)What @dockimbel thinks?**

**[19:00](#msg5e7e4d556eb8380abcde2d26)Here is example of my code (from year 2001):**  
**`b: enbase/base copy/part icxor 1 2`**  
**isn't better:**  
**`b: enbase 2 copy/part icxor 1`**  
**or:**  
**`b: enbase copy/part icxor 1 2`**  
**?**

**hiiamboris**

**[19:02](#msg5e7e4da98266bd2129584a48)or `copy/part icxor 1 enbase . 2` ;)**

**Oldes**

**[19:03](#msg5e7e4e01f95592102b2ea52b)@hiiamboris definitely not for me.**

**hiiamboris**

**[19:05](#msg5e7e4e7e426d5b06bf8f03aa)I'm only pointing here out that the rule you're fighting with is a general problem that sometimes arises but never became fatal to anyone ;)**

**[19:07](#msg5e7e4ef2fb12256c0982796e)In fact there's a even a positive side to it: it makes more likely that you'll use an intermediate set-word and make your code more self-documenting**

**[19:09](#msg5e7e4f5cc8bfec7e2c60e815)I somewhat support removing `/base` though. It always looked bad to me.**

**giesse**

**[20:11](#msg5e7e5e02f95592102b2ecd32)removing `/base` seems fair, but the argument order part is not really about argument order... @hiiamboris is right and this is about function composition after all.**  
**so which style is actually more readable to people?**  
**`enbase copy/part icxor 1 2 enbase (copy/part icxor 1) 2 icxor . copy/part 1 . enbase 2`**  
**(`then` seems to be a good way to read the `.`)**

**greggirwin**

**[21:13](#msg5e7e6c624a4f8e0a100d26da)@dockimbel @qtxie, are you OK with removing `/base` from `enbase/debase`?**

**loziniak**

**[21:22](#msg5e7e6e92d7d8504dee6f07ae)wow, the dot notation is new to me! and I like it :-)**

**[21:25](#msg5e7e6f41d7d8504dee6f0a3f)`*** Script Error: . has no value` hmm...**

**[21:26](#msg5e7e6f8dfb12256c0982d62b)probably some bleeding edge fast lexer gizmo?**

**hiiamboris**

**[21:26](#msg5e7e6fa059057617f0479f8a)@loziniak dot notation is a quest reward, so you have to complete it (the quest of writing it) yourself first**

**loziniak**

**[21:28](#msg5e7e6fe0c8bfec7e2c614595)quest reward is also new to me! :-o**

**[21:33](#msg5e7e713d63c1c130d5ccfffc)i'll wait for some other quests to get merged/rejected first :-)**

****Saturday 28th March, 2020****

**pekr**

**[05:42](#msg5e7ee3b4f95592102b2fecba)I don't seem to like the dot notation (yet), does not feel rebolish :-) So we are dissmissive to change almost anything rebollish and then we can see something as a dot notation? :-)**

**giesse**

**[05:52](#msg5e7ee632fb12256c0983cd6f)to me, it's just a dumbed down version of Forth :P**

**[05:55](#msg5e7ee6bb63c1c130d5cdf843)but... perhaps it's easier for humans to process? don't forget that the above it's the same as:**  
**`.: icxor .: copy/part . 1 .: enbase . 2`**  
**except with the repetition removed. (see @9214 post for an implementation that does that).**

**pekr**

**[05:55](#msg5e7ee6c04a4f8e0a100e260d)We could introduce `->`and `<-`so that you better know, what direction the flow of the code goes, lol :-)**

**[05:55](#msg5e7ee6d0f465c801f8752cbd)I wonder if any language has such an arrow notation :-)**

**giesse**

**[05:55](#msg5e7ee6ea8266bd2129599c6e)well, if you use `|` then it looks a lot like unix pipes...**

**[05:56](#msg5e7ee716f95592102b2ff251)so, again... this is nothing new... just a different kind of syntactic sugar... but it's interesting to me that it seems to click better with people?**

**pekr**

**[05:57](#msg5e7ee74cb407e11e3cbc9def)I suggested pipes and it was accepted by Ren-C .... but it got useful only for the separation of expression in terms of one line, hence readability. Not useful for chained expressions**

**[05:58](#msg5e7ee774fb12256c0983cffe)`x: 10 | append series x`.... `|`basically means noop**

**[05:58](#msg5e7ee781f465c801f8752e40)I found it nicely readable ....**

**giesse**

**[05:58](#msg5e7ee796f95592102b2ff303)in the style above it would be more like `series | append 10`**

**[05:59](#msg5e7ee7b4f95592102b2ff33b)in Java / Javascript / C++ etc. it would be like `series.append(10)`**

**pekr**

**[05:59](#msg5e7ee7d0f95592102b2ff386)I know, a different purpose. In my case it was a simple separator, when you want to have more stuff in terms of one line.**

**[06:00](#msg5e7ee81059057617f048938c)`series <- append 10`might be even more clearly understandable, though more difficult to read**

**giesse**

**[06:01](#msg5e7ee8218266bd2129599e4f)well, but if you have multiple operations it looks strange.**

**[06:01](#msg5e7ee8338266bd2129599e77)`ixcor <- copy/part 1 <- enbase 2`**

**pekr**

**[06:01](#msg5e7ee846426d5b06bf9055f3)But in both cases can't see much advantage to `append series 10`.... with more complicated code, as was mentioned above (intermediary results), might be more useful, yes ....**

**[06:03](#msg5e7ee896d7d8504dee6ff6c1)Doesn' it stems down to ppl not wanting to introduce new words for the intermediary assignments?**

**giesse**

**[06:04](#msg5e7ee8e9d7d8504dee6ff74d)well, ultimately, something like:**  
**`first-char: copy/part ixcor 1 enbased: enbase first-char 2`**  
**is going to be more readable, but it's verbose and people are lazy when writing, not to mention all the locals (which sometimes you have to keep track of)**

**pekr**

**[06:05](#msg5e7ee91ffb12256c0983d34a)I like pipes more than dots. Dots mostly suggest objects. And beware, some ppl even use dots in words, might be confusing**

****Sunday 29th March, 2020****

**GiuseppeChillemi**

**[19:26](#msg5e80f66fc1880d2c9b4be318) In the past months an idea has came to my mind: a context is basically an object so when you bind a word to a context the companion symbols and their values are there but not accessible via path notation. In other words we have an hidden object. Do you think it would be easy to have a way to access them as path elements using the current word as head of the path? Something like `myword//contextword`? Then, if the element is a function you could write `myword//contextword myword` to execute a "method" of the word in that context on the word value or just get a value of another word in that context. I have called it "reverse object" where you retain `set-word/get-word` notation but you also have object functionality.**

****Monday 30th March, 2020****

**rebolek**

**[06:12](#msg5e818db9770a892bfb1d1fb7)I'm late to the discussion, but if there's a movement for removing `/base` from `*base`, count me in!**

**endo64**

**[17:54](#msg5e82326f2ba6e313142f77d9)I'm for removing `/base` but not changing the order.**

****Tuesday 31st March, 2020****

**greggirwin**

**[01:00](#msg5e829641ac3c3909b2db77b3)No naysayers for removing `/base` yet, but @dockimbel has veto power.**

**[01:03](#msg5e8296d81ecde251e914cc6b)@GiuseppeChillemi mock it up at the mezz level, without requiring a new lexical form. Play and let others do the same to get feedback.**

**[01:09](#msg5e82984e8b14736a77370cc6)On the `.<-|` pipe/thread/forward model...a dialected func is the way to experiment IMO. They aren't a "win", just different. We should encourage writing readable code, and terse ops and dialects may be more readable in some cases. Just keep in mind that Redbol langs are very much word oriented by design. In \*some* domains, those words may be short symbols.**

**giesse**

**[06:03](#msg5e82dd48986fdc2438a4ec4f)My general issue is that as much as implied arguments are a nice way to improve write-ability and reduce repetition, I'm not convinced about readability. But, perhaps, this specific case works well with humans and that's why it's common in other languages (ie. `object.method()` rather than `method(object)`). I'd still just write a Forth dialect, but I have to conclude that's just because I'm weird.**

**9214**

**[06:52](#msg5e82e8c0f7cff9290c837eb2)Forth is a bit more than tacit programming and stack shuffling though. I would be extremely interested to see how concatenative and homoiconic properties can be aligned (see e.g. \[Om](http://www.om-language.org/) language) and what the \[Joy](https://hypercubed.github.io/joy/joy.html) (pun intended) of concatenative combinators can bring to the HOF table (@giesse you're not the only weirdo here).**

**Thinking aloud, one can define an operator that accepts a data stack (`block!`) and a program (also a `block!`) which then can be combined together; that would be weaving (two threads), and `.`-style would be threading (evaluator's IP needle thru the eyelet of `.`).**

**GiuseppeChillemi**

**[07:34](#msg5e82f28e8dcf3e3c6326eeeb)@greggirwin &gt;&gt;mock it up at the mezz level, without requiring a new lexical form**

**[07:36](#msg5e82f2efb0044a0a55870565)I have never worked at mezzanine level. I need some help. Could you please give some starter advice for this task on red/help?**

**rebolek**

**[07:38](#msg5e82f3781703e336f6070a81)@GiuseppeChillemi**  
**&gt; I have never worked at mezzanine level.**

**Have you ever written a function that you used in another function? Then you worked at mezzanine level :-)**

**[07:39](#msg5e82f3b48dcf3e3c6326f444)It's usually used as a group name for Red functions that are not native, like `rejoin` for example.**

**[07:41](#msg5e82f44083f9b44b03898f9e)So what @greggirwin suggested is to write a function that would do what you proposed without requiring new syntax.**

**cloutiy**

**[12:44](#msg5e833b269a1e483f3d34031a)in F# and Elixir the "pipe" operator is `|>`. The `.` example which I had submitted (which I think it seems this discussion is still going on!) was my attempt to replicate a similar behavior. When working withthose anguages I found it very readable since it allowed me to express a sequence of steps or transformations from left to right, or top down. As an alternative to the `.` I thought `->` was also nice.**

**hiiamboris**

**[18:00](#msg5e83854e419c4a022ec2bce8)Why is `complement` not allowed on tuples?**

**greggirwin**

**[18:15](#msg5e8388da74c36c7bc6783cc0)Maybe just not done yet. R2 supports it.**

**meijeru**

**[19:22](#msg5e839889419c4a022ec2f996)A comprehensive set of requests for extending operations to as many types as feasible is REP # 10. This exists since 30 April 2018. Speaking about not done yet...**

**greggirwin**

**[19:46](#msg5e839dfcc6e44255a1c8618d):+1: Priorities are always hard. Until someone \*needs* a feature, they're "nice to have", and we have to also focus on survival aspects.**

**meijeru**

**[20:43](#msg5e83ab67b6d72077bcab6e7a)Am I the only one who finds that the latest Windows `.exe` (commit `84d5ccb0a`) does not compile the console??**

**endo64**

**[21:11](#msg5e83b20a1ead89590e9e3c0c)@meijeru It works for me, same commit ID, do you get any errors?**

**GiuseppeChillemi**

**[21:13](#msg5e83b291f0f4677566d6d153)@greggirwin @rebolek to my knowledge, at this level the idea is only doable in a function which accepts a block of Red code to be parsed. This because you have variable arity of functions in the context, and also you have to "manually" decode those paths. I'll try!**

****Friday 3th April, 2020****

**realTopXeQ\_twitter**

**[14:13](#msg5e87447acc4b7b6f66427199)Have read the documents, but I cannot find out how to convert a string to another encoding (utf-8 to iso-8859-1, or gbk to utf-8 and vice versa),**

**[14:13](#msg5e87448365be83628f91e28e)Thanks**

**hiiamboris**

**[15:21](#msg5e8754723a802a49d8752840)https://stackoverflow.com/questions/43379932/access-error-invalid-utf-8-encoding-ffd8ffe0**

****Saturday 4th April, 2020****

**realTopXeQ\_twitter**

**[03:12](#msg5e87fb14b740e91655c4b85d)thanks，hope the encoding convertion library to be released**

**Rebol2Red**

**[11:51](#msg5e8874b50073445dc5631759)I hope too. No more using a slow poor's man converter.**

**GiuseppeChillemi**

**[12:00](#msg5e8876d5b740e91655c5c233) I think that the comments to document the code are somehow limiting. I would like to add other data like extra tables, diagrams, rich notes. Is there any tool which is able to integrate with the code, either in place, or using an external file for such purpose?**

**419928194516**

**[18:28](#msg5e88d1bcd75d5d2873368323)So I saw mod and modulo mentioned in the March 20th blog post, and I opened https://github.com/red/red/issues/2997 years ago, and still see that `source mod` returns the same incorrect implementation. Is there a branch where it isn't busted?**

**[18:29](#msg5e88d218f6083b20d44c4721)If nothing else, the type signature should be altered: `a [number! char! pair! tuple! vector! time!]` is a lie**

**hiiamboris**

**[18:31](#msg5e88d26d30ec2e5a259a8e5f)@419928194516 only https://gitlab.com/snippets/1901617 so far**

**419928194516**

**[18:39](#msg5e88d4579cb75f6083f7857c)Interesting, is mod intended to be the 'kitchen sink' impl? I feel like I'd still just end up using a % b for most of my use cases if I know the types ahead of time**

**hiiamboris**

**[18:41](#msg5e88d4e6f6083b20d44c4e4e)`%` is the fastest**

**[18:42](#msg5e88d51453faed44f7a6c1f9)You can coin your thoughts here https://github.com/red/red/issues/2433 if you wish**

**419928194516**

**[18:44](#msg5e88d59b1796f20a81f1ea22)Ty, I need to think about it some more, there's a lot of cases to consider that I'm sure you've thought about more deeply**

****Sunday 5th April, 2020****

**meijeru**

**[12:50](#msg5e89d40038198d56a1812e32)As some may have noticed, I am reviewing all open issues, in first instance to make pertinent references in my spec document. I have observed that there are 21 `open` issues that have `status.built` among which 12 that have `status.tested`. I strongly suggest these are now closed since they pollute the list of issues. I don't need to list them here since they are easily filtered in Github.**

**hiiamboris**

**[13:21](#msg5e89db56f450c25cc8bd89a3)They were reopened, obviously nobody cared to clear the status flags.**

**meijeru**

**[14:40](#msg5e89edc9f87c5956a23b0c00)Were \_all_ 21 of them reopened???**

**hiiamboris**

**[14:46](#msg5e89ef59c52b6a38abc6d5ff)Most of them I guess. Just browse around.**

**meijeru**

**[16:12](#msg5e8a037a3a85536c430d6fec)In any case, I suppose you agree to the need for a comprehensive review of where issues are.**

**hiiamboris**

**[16:24](#msg5e8a0649c52b6a38abc70f72)Well, from what I saw (I reviewed hundreds and opened hundreds more, though more often View-related), they are in order. What they need is a fix, but even more - a bit of attention from the core team ;)**

**[21:12](#msg5e8a49c0fea5216d695ce3fe)From code inspection it occurs to me that `system/build/git` was made intentionally `none` for custom built consoles (or it was meant for other scripts?). Is there a rationale behind it?**

****Monday 6th April, 2020****

**meijeru**

**[11:54](#msg5e8b1861fea5216d695edadf)For whom it is of interest ( @dockimbel? @qtxie?): of the 21 open issues that have `status.built` there are 3 that can be closed as far as I can see (4329, 4212, 3767) and one that @dockimbel "believes can be closed" (3991) plus 2 where a PR is ready to be merged (3369 and 497) as well as one duplicate (3349). The rest has been reopened at some point, often after heavy discussion, but without adjusting the status.**

**hiiamboris**

**[13:49](#msg5e8b33645b98016d6a19c06a)You misread https://github.com/red/red/issues/3991 last comments. https://github.com/red/red/issues/3767 requires tests written. https://github.com/red/red/issues/4329 has never been fixed - see discussion \[here](https://gitter.im/red/bugs?at=5e68cbada2ccef3232e78c83)**

**meijeru**

**[14:29](#msg5e8b3cbad021c45cc7ca3b27)I may have misread 3991. In any case I learn now that both 3767 and 4329 are equally badly annotated as the other "reopened" ones. The issue collection is unfortunately not as well maintained as it could be, if we want it to be an effective management instrument.**

**greggirwin**

**[17:08](#msg5e8b62266823cb38acb3324d)@hiiamboris I think the `system/build/bit` issue was related to local builds updating it and making it look like your repo was out of sync. Maybe @x8x can confirm.**

**[17:10](#msg5e8b629be7ca460b0641ca61)&gt; obviously nobody cared to clear the status flags.**

**If it was me, it's not the lack of caring, just new processes and details to deal with. Another case where features (labels in this case) are great, but also make for more work. Like out of date comments in code. :^)**

**[17:11](#msg5e8b62d53a85536c4310f4db)Having extra eyes on this helps enormously, and is greatly appreciated.**

**[17:17](#msg5e8b6434cc370f0b07c81eee)For #3767, @hiiamboris can we use your initial example from the ticket as a test, and do we need more than that?**

**hiiamboris**

**[17:23](#msg5e8b659038198d56a1853796)Be my guest ;) Just add some, like 50'000.**

**greggirwin**

**[17:48](#msg5e8b6b85fea5216d695fee99)Will have to be someone other than me at this point.**

**I just did a quick pass and cleared some labels. Managing these things can be time consuming and imperfect. We'll just continue to do the best we can, and try to clear labels when we reopen things.**

**hiiamboris**

**[17:50](#msg5e8b6bf8e24b4d6c44edffc5):+1:**

**dander**

**[18:55](#msg5e8b7b3cd021c45cc7caf475)I think I heard that GitHub actions can do things with metadata based on various events, like a PR being merged. Maybe some of those tag operations can be automated**

**greggirwin**

**[19:53](#msg5e8b88a6d021c45cc7cb1669)All help is welcome in figuring that out.**

**hiiamboris**

**[20:57](#msg5e8b97bdd021c45cc7cb3c55)Funny, I just by accident discovered a nice feature of View: when I click on any `text`, it jumps into the clipboard (which also prevents me from using `write-clipboard` in `on-dbl-click` to push a custom text).**

**Is this documented anywhere? Is it cross-platform? I can't seem to find the code that does this magic ☻**

**greggirwin**

**[22:20](#msg5e8bab1af87c5956a23f7fc1)It doesn't do that on Win10 for me.**

**endo64**

**[22:21](#msg5e8bab5dc52b6a38abcb568f)Is it really a feature or a bug? @greggirwin It does for me on Win10.**

**[22:21](#msg5e8bab7fc52b6a38abcb56b7)`view [text "testing"]` double click on the text and `testing` is now in clipboard.**

**greggirwin**

**[22:22](#msg5e8baba85b98016d6a1b1b3d)You know what's really funny. I wrote the same code \*verbatim* @endo64. :^)**

**[22:22](#msg5e8babc2e24b4d6c44eea252)I single clicked. It does do it when I double click.**

**[22:27](#msg5e8bacb63a85536c4311bceb)https://stackoverflow.com/questions/17048395/double-clicking-net-label-control-copies-its-text-to-clipboard-on-vista**

**endo64**

**[22:27](#msg5e8bacdd9316f34b8d84cc9e)Great minds think alike :) (hope this is the correct use)**

**[22:28](#msg5e8bad01e24b4d6c44eea68e)So it's a feature of the OS. Cool!**

**greggirwin**

**[22:29](#msg5e8bad3038198d56a185ef83)@endo64 correct use indedd. But I've always thought that if great minds think alike, where does that leave me? :^)**

**hiiamboris**

**[22:35](#msg5e8baec4f450c25cc8c22f7f)But we're not using .net and I've tried a few other programs - they don't do that ;)**

**[22:36](#msg5e8baf0be7ca460b06429320)Although that thought visited me indeed - as I haven't found the code that would do it**

**greggirwin**

**[22:37](#msg5e8baf17cc370f0b07c8e377)It's the OS, but depends on window creation specifics it seems. I just skimmed.**

****Tuesday 7th April, 2020****

**qtxie**

**[03:18](#msg5e8bf119e7ca460b0643339c)issue 4329 was fixed, I cannot reproduce it anymore.**

**hiiamboris**

**[09:51](#msg5e8c4d17f87c5956a240f8ee)IIRC you couldn't reproduce it in the first place ;) It was @9214 and @rebolek who could**

**qtxie**

**[13:55](#msg5e8c865c16f84f0461611030)@hiiamboris I reproduced it before it be fixed. That's why I pushed a fix.**

**meijeru**

**[18:49](#msg5e8ccb26f87c5956a242a8d1)Just now on the `money` branch: "FEAT: completed work on MONEY! datatype." So it will soon be merged into `master`?**

**greggirwin**

**[18:49](#msg5e8ccb43f450c25cc8c551e8)Yes, soon :tm: .**

**meijeru**

**[18:51](#msg5e8ccb95d021c45cc7ceb1f7)Likewise, when will `fast-lexer` be merged?**

**greggirwin**

**[18:54](#msg5e8ccc69f87c5956a242acd6)Also soon. :^)**

**GiuseppeChillemi**

**[21:38](#msg5e8cf2c0f87c5956a2433259)I want to meet Mr. Soon, he seems on everyone mouth!**

****Wednesday 8th April, 2020****

**pekr**

**[12:31](#msg5e8dc43ff450c25cc8c8000b)I wonder if Github has some easter eggs, so that in few days some secret branch is going to be displayed, and 0.6.5 surfaces :-)**

**[13:08](#msg5e8dccd5f450c25cc8c81faa)I might have one suggestion, guys. What about changing the policy of official releases? I know that we can pretty much use what is available on Github, but last 0.6.4 release is quite old. I wish fast-lexer, money, or any such effort would end in an official release. Let's make it 0.6.5 and call it a day. What was originally planned for 0.6.5 might become 0.6.6 :-)**

**rebolek**

**[13:22](#msg5e8dcffbf87c5956a24581be)I've got a friend who's trying to start with Red and the first thing he did is, of course, downloading 0.6.4 (that's understandable, there's a huge red button, so it seems to be preferred version) and shortly after that hitting some bugs that are already fixed. He can ask me how to solve it but I think that for some newcommers this may be bad user experience. Having more frequent "stable" releases (even in the form of 0.6.4.x) would be more welcoming, I guess. 0.6.5 or 0.6.4.1, I don't care about the number that much, but having something more recent than a version from December 2018 is a good idea IMO.**

**9214**

**[13:46](#msg5e8dd5a4e24b4d6c44f4ba9b)&gt; Having more frequent "stable" releases**

**That's called rolling release model (continuous delivery) and that's what Red already has. Stable releases receive an extra effort of bug fixing, regression testing (including all 3 View backends), writing documentation, changelogs and blog-post announcement. They are called "stable" because, at the time of the build, they are more stable than any others before, and can serve as a fallback and comparison point if things go South; it doesn't mean that they are bug-free (nothing is).**

**Doing more intermediate stable releases just puts an extra burden on us. If people cannot understand that the most feature-complete and relatively bug-free release is the nightly one and that project's development is ongoing, then there's no point in introducing them either. Swapping the hierarchy and giving nightly by default isn't that great either, as they might as well contain bugs and lead to what you call "bad user experience".**

**[13:50](#msg5e8dd69316f84f046165064a)`0.6.4` at this point is an artifact of an unplanned long release cycle.**

**pekr**

**[14:45](#msg5e8de387c52b6a38abd1a308)When I saw Rebolek mentioning the word "stable", I knew it is going to be neglected. Guys, it is imo more a marketing issue. We know that the development is far from being stalled, but download section simply suggests otherwise. Interim releases also might mean shorter bkog articles ...**

**9214**

**[15:30](#msg5e8dee29fea5216d69670bb8)The scope of the project is different from those that use frequent releases (like e.g. Rust with 2-week release cycle), the team is small, and the project does not attract enough quality contributions to keep up that kind of pacing, not to mention that development is most often carried in parallel branches.**

**Like I said, `0.6.4` is an artifact, and I don't recall anyone demanding shorter release cycles before it (and even if they did, they were rightfully pointed to nightly build). Making "interim releases" then would require us to take slices from all the development branches, cram this half-baked work into master, resolve conflicts, test it, fix the bugs, test it again, check regression, write a changelog AND a release announcement. And sometimes there will be no actual progress since all the features pulled from all the development branches are TBD, and that would literally mean content-free releases... for the sake of "marketing", no less. Have a heart, @pekr; if giving you reasons as of why this model is not feasible is called "neglecting" in your book, then I might as well talk to myself.**

**We can change the website layout and give people two big buttons to choose from, that's IMO more sensible. But then I won't be surprised to see things like "Oh, which button should I click, which release is better? You are making me think, that's a bad user experience!". If people are unfamiliar with open source and CI, thinking that static binary somehow reflects the state of the project, then no amount of buttons or releases-per-week will help. Perhaps describing our release model and project-specific workflow on the Download page will help people make more informed decisions.**

**hiiamboris**

**[15:39](#msg5e8df0425d148a0460f28500)!\[](https://i.gyazo.com/3480e926ec0b06ceb7b467fb40a7ab1f.png)**  
**Simplest solution IMO would be to add an automatic counter like "1 years N months ago; M commits behind" after the "last stable" words. Otherwise who knows when it was released?**

**[15:42](#msg5e8df0e338198d56a18c7349)Or even right under the button... Cause most newcomers won't look past the button ;)**

**9214**

**[15:42](#msg5e8df0f91aaf8e4b8e6cb706)All that info is given \[here](https://github.com/red/red/releases). Again, if people don't know how to interact with projects hosted on Github, then no amount of handholding will help.**

**hiiamboris**

**[15:44](#msg5e8df1625b98016d6a219ce0)Come on, how does one get from \[here](https://www.red-lang.org/p/download.html) to \[there](https://github.com/red/red/releases)? That's an inside info with no visible clues to it.**

**9214**

**[15:50](#msg5e8df2cde7ca460b0649128f)By clicking on Github project button in the top-right corner? Or on the top-left red ribbon? Choices are so hard...**

**hiiamboris**

**[15:52](#msg5e8df34f1aaf8e4b8e6cbd71)Why would anyone even decide to click any project or whatever when there's a big red button right there saying "click me now!" ;)**

**9214**

**[15:54](#msg5e8df3a9cc370f0b07cf7c35)At this point we're dissing website design instead of discussing the release model. Although both are connected to UX improvement, I'm not going down that road.**

**pekr**

**[16:01](#msg5e8df57516f84f0461657285)I definitely don't want to argue. It was mostly a question about Red Team's point of view. I use many products, and the release cycle differs. No model is acutally being 100 % right or wrong. I was also used to visit Trello, where there used to be at least some kind of a roadmap. But 0.6.5 / 0.7.0 shines there like forever, with a bullet points, which don't seem to reflect latest developments. No mention of money type, fast-lexer, etc. I am not asking RT to update various sources for my own comfort, but general roadmap would be still useful to have.**

**[16:04](#msg5e8df5fbd021c45cc7d209c5)There's imo more to the marketing than big blog article once per a year re the release. It's mostly about keeping the community being vital. I am not sure I am the right person in redbolland, to be asked to have a heart :-)**

**[16:06](#msg5e8df6689316f34b8d8b776d)But - most probably I will not continue to present my pov on this point furtner on, as I fear being marked as a troll again .... It's up to you guys to decide, what would the project and its users benefit from ...**

**9214**

**[17:40](#msg5e8e0c99e24b4d6c44f573b4)I can say that there's always room for improvement, and that we should be thankful to each other for sticking together in such turbulent times and keeping the fire burning.**

**But I also want to remind everyone that the team consists of mere humans, each with 1 head and 2 hands (last time I checked anyway), some even daring to have a personal life (!) in-between work on Red. We solve hard problems when we can and muse over design questions when we can't, all at the cost of being slightly disorganized and making an "unmarketable" appearance, sitting in a perpetual cave mode, all against the odds and nay-saying.**

**That being said, if you think that something should be improved in this area (or in any other), the best thing to do, aside from providing constructive criticism, is to contribute and offer a helping hand by contacting @greggirwin. Complement our skillset the best you can. Granted, there are not enough areas to match everyone's experience, but you can \_at least_ try, since even the smallest thing helps; or you can step up your game and come back later — being determined to help also helps.**

**Start being more proactive and supportive, people. Sitting in the stands and pushing for features is not only counter-productive, but makes the community utterly unwelcoming.**

**[17:54](#msg5e8e0fb95b98016d6a22077a)@pekr since you want `0.6.5` more than anything else in your life, would you (or anyone else for that matter) help us with View regression tests? It's not technically complicated, just time-consuming. All View-related tests and `red/code` scripts need to be checked on 3 platforms, including Linux with GTK.**

**No? Then there is a backlog of issues, you can help by organizing them into related groups and checking at what point regressions crept in.**

**Also no? Well, you can monitor this chat and collect links and messages worth highlighting in a blog post, or you can even draft a blog post yourself.**

**Or write regressions tests, or organize wiki, or help @meijeru with his specification project (e.g. with proofreading), since he's doing it all single-handily. Or monitor HN/Lobsters/Reddit for Red-related discussions/questions and help to fight FUD with trolls on these platforms, or go on StackOverflow and earn badges by answering `red`-tagged questions, or write a Red-related entry in your personal blog, spread the word. I can go on and on, really, there's no shortage of checkboxes on the todo list to cross out.**

**I think you can do any of the above, I'll even help you to get started if needed. But what you \_cannot_ do is to say "no" and then keep asking "When Moon? Get the release out of the door, guys!"— that would indeed make you a troll.**

**hiiamboris**

**[18:22](#msg5e8e1676c52b6a38abd26a40)Here's how recent March 18 build compares to 0.6.4 stable with regard to View subsystem based on \[115 currently implemented View issues tests](https://gitlab.com/hiiamboris/red-view-test-system):**  
**!\[](https://i.gyazo.com/b37b81a34c1cd76f5c66495b1b897471.png)**  
**A great testimony of progress (hinted by arrows pointed up) ;)**

**dander**

**[19:08](#msg5e8e212d1aaf8e4b8e6d6a4f)@hiiamboris wow, looks like you've been making a lot of progress on your test system!**

**greggirwin**

**[19:28](#msg5e8e25ccd021c45cc7d2ab94)@hiiamboris :+1: So great.**

**@9214 thanks for jumping in.**

**@pekr we've known each other long enough that I won't mark you as a troll. :^)**

**@9214 laid things out well. None of this is easy or has black and white answers. Do we want to be more "user friendly"? Yes. That's good for everyone. We want people to have their first experience be a good one, but no two cases are alike. Do we have hard numbers on how many people will hit bugs in old stable builds versus those that hit bugs in nightly builds? Nope. And we won't until we build in lots of telemetry and data analysis.**

**What the current system does is check stable against things like red/code and red/community, demos, etc., so if they use the big red button, then go find examples, they should work. Of course they may also come here and get live examples which don't work on the stable build, because we're all on nightly or building locally. Which is more important?**

**There is also a technical barrier, which will take some time to resolve. Eventually we should have an archive of curated/stable builds (see Bolek's work for how he does this for automated builds). Then people can get old ones if they need them. If we go back to "user friendly", that's more major version oriented, and we're still Alpha.**

**Maybe the best way to view the Red project right now is like an invited beta. You get inside information, sneak peeks, even a chance to weigh in on features and design decisions. If someone wants more input than that, e.g. on \*how* we're doing things, expect that we'll ask them to step up (you do this by managing the FB group Pekr). For more project management and "process", commitment needs to be commensurate/matched with what someone asks for. I'm sure I drive the team, and even the community, mad by asking for specifics and concrete examples. e.g.**

**&gt; What about changing the policy of official releases? ...Let's make it 0.6.5 and call it a day.**

**That's very broad, and @9214 listed many tasks that go into it. What we don't have is someone dedicated to this entire process. Everybody on the team wears many hats, and Nenad leads releases, meaning he has to stop core dev, tickets assigned to him, merging system related PRs, and more, to do all those things. We would \*LOVE* to optimize this, not require him to do so much, all without compromising quality. If there's anyone who thinks they can help with this, contact me.**

**We deeply appreciate our community, and all the moral support, seeing the great things people are doing with Red. That's a form of contributing, simply using it and telling us what you want and need in order do to more. Other ways to contribute are things @9214 laid out, or paying for specific features or having contract work done in Red.**

**&gt; There's imo more to the marketing than big blog article once per a year re the release. It's mostly about keeping the community being vital.**

**Agreed, which is why you see Team Red here on a regular basis.**

****Thursday 9th April, 2020****

**rebolek**

**[06:25](#msg5e8ebff45b98016d6a23ae25)&gt; If people cannot understand that the most feature-complete and relatively bug-free release is the nightly one and that project's development is ongoing, then there's no point in introducing them either.**

**This is a very non-inclusive approach.**

**pekr**

**[06:59](#msg5e8ec7d7cc370f0b07d19cf1)@9214 @greggirwin Thak you both guys for your points, I just hope that you didn't find it offensive, as it was not meant that. I can understand most arguments here, maybe apart from - if you are not able to help, then you are mostly a troll :-) Vladimir - music critics are not trolls just because they can't play/compose next Metallica album, you know? Well, let's move to some more useful points of view.**

**Nowadays, I work in the IT management mostly, so I am definitely not much useful for coding. Looking at my sources you would not call me a good coder anyway. But - I do some testing, architecture overview, networking, marketing and IT management. You know, coming from Amiga / Rebol heritage, what we miss a bit imo is some kind of a community coordinator. Those things come naturally, especially with the Amiga - I still have many friends just because of the Amiga heritage. You simply have to keep ppl "warm".**

**Lucinda was supposed to take over the FB channel, but it is imo not enough to post just a blog posts, but cherry pick from here or ther and keep ppl in a possitive attitude, that the project is still alive and kicking. You might guys work your assess off, but if it can't be seen, ppl might wonder, if the project is alive and kicking. So for the time being, I am asking for a permission to step-in again and being more active on a FB group.**

**I can see the whole idea of making an official stable releases is more complex, then I first though, so sorry for not seeing a related consequences. It is just that I was sorry for seeing so much useful work being done (money, fast-lexer) and not providing them to ppl. What we miss a bit, really, is a roadmap. As Trello is not being updated, ppl still might think, that they will get 0.6.5. with the library loading functionality, even if the focus seems to be shifted already and another useful things are being done. That's just all ...**

**meijeru**

**[08:49](#msg5e8ee18c38198d56a18ed4b7)\*\*Equality and the `money!` type.\*\***  
**With the impending introduction of the `money!` type, an interesting design question has come up. After a first discussion with the designer @9214, and at his suggestion, I lay it here before everyone.**

**In Red, every two values, of whatever type, can be arguments of a comparison operator (`= == =? <> < <= > >=`). There is a clear definition of which types are "compatible" with each other, which governs whether two values, one of each type, can be usefully compared with each other. E.g. one can compare an integer with a float, and a string with a file. Until the introduction of `money!`, the rules for the result type were also clear: the result of an "equality operators" (`= == =? <>`) is \_always_ of `logic!` type, and if the types are \_not_ compatible, the result of `<>` is `true` and of the others is `false`; if the types are compatible, the result may be `true` or `false`. On the other hand, for the "ordering" operators (`< <= > >=`), incompatible types give an `error!` value. See doc's comment to issue #2656.**

**For `money!` the question poses itself: are two values with different currency code to be considered of compatible type or not? They are of the \_same_ type as regards the `type?` function, but intuitively, they cannot really be compared. To be concrete: what should be the result of `USD$1.07 = EUR$1.00`? Is it `false` (but some days it might be true in the market :-), or is it an error? The philosophical question behind this, as @9214 remarked, is whether one is comparing the values thenselves (as Red data) or the things that the values denote. Especially with a datatype that models such concrete values as monetary amounts, this question poses itself inescapably.**

**The current implementation by @9214, to be found in the `money` branch, and accepted by @dockimbel, declares `money!` values with different currency code incompatible for \_all_ comparisons, and raises an error in all cases. That means an extra rule, creating an exception to the notions that values can always be compared for equality, and that values of equal type are compatible. It also leads to a different coding paradigm. What does the community think?**

**[10:06](#msg5e8ef3a0e7ca460b064ba7e3)Observed that `money` branch was merged into `fast-lexer` branch. Probably last stage before total merge into `master`?**

**hiiamboris**

**[10:15](#msg5e8ef5ade7ca460b064bac7c)Nice catch there @meijeru . Can't we have dumber (distributive) comparison, like treat money value as a pair of (currency, amount) and define equality (c1, a1) = (c2, a2) if and only if both c1 = c2 and a1 = a2 ? Otherwise that indeed produces a lot of overhead in common coding patterns like `a <> select b x`, requiring error handling and all the boring stuff.**

**[10:33](#msg5e8ef9decc370f0b07d24355)Another thing here is do we allow integer = money to return true or not? It will result in either `m1/amount = m2/amount` or `m1 = m2/amount` amount comparison patterns. I like the 1st one, implying always money &lt;&gt; integer.**

**[10:37](#msg5e8efad0d021c45cc7d4b154)And the funniest thing with that, is - what type of is the `m/amount`? If it's a float, we lose precision. It doesn't look to me that money datatype can be completed without support for a general purpose high precision decimal number type.**

**[10:38](#msg5e8efb321aaf8e4b8e6f9222)Sure, one can work around that by creating a money value with no currency, but that's it, just a design workaround to me.**

**greggirwin**

**[18:46](#msg5e8f6d856823cb38acbf2298)@pekr you have my blessing, and my thanks, for managing the FB group as you see fit.**

**[19:20](#msg5e8f7571cc370f0b07d3f494)&gt; what we miss a bit imo is some kind of a community coordinator.**

**@pekr can you be more concrete here? There are a number of us who spend a lot of time here, so it would be good to know what we're missing, and how to do better.**

**9214**

**[19:54](#msg5e8f7d715d148a0460f730ed)Thanks for stepping in @pekr. If you want to revive the Facebook group, here's what you might want to say as a general reminder:**  
*** we have public development \[branches](https://github.com/red/red/branches) where people can regularly see progress and build console from sources (they can find instructions \[here](https://github.com/red/red#running-red-from-the-sources-for-contributors));**  
*** if that's too intimidating and technical, then we have progress tracking \[website](https://progress.red-lang.org/) and automated builds for all the development branches (`fast-lexer` with `money!` merged into it \[included](https://static.red-lang.org/dl/branch/fast-lexer/win/red-latest.exe), ditto \[GTK](https://static.red-lang.org/dl/branch/GTK/linux/red-latest));**  
*** then there is the official \[blog](https://www.red-lang.org/) and this very \[chat](https://gitter.im/red/home), with an active community and presence of the team;**  
*** you can also spruce it up with something from \[this](https://github.com/red/red/wiki/%5BLINKS%5D-Projects-showcase-%28links-to-remember%29) page.**

**GiuseppeChillemi**

**[20:56](#msg5e8f8c12f450c25cc8cd61db)When someone dresses for one week with the same shirt, even if he cleans and dries it every day, generates the image of a shabby person. The same happens for software projects. If the last stable release is too old people will start thinking the project is not maintained, development team is not full time working on it.**  
**Said this, I can affirm that this \*\*won't happen\** to RED because of a particular reason: it does \*\*NOT\** show the date of the latest stable release on the download page. So people won't start judging. The front page is updated with sufficient frequency to give an image of a live a dynamic project (a little more frequency would increase this perception).**  
**Also there is a little trick to give the sensation of a live project...**

**[21:02](#msg5e8f8d7038198d56a1912e22)Put in the following region of the site (or just a couple of mouse wheel rounds belows) a small version of the updates that appear here: https://progress.red-lang.org/ . The date which is always near the current one will surely give the sensation of freshness. (But beware, don't let the gap between the lates blog post be too big!)**

**[21:03](#msg5e8f8d8a1aaf8e4b8e7193e4)\[!\[image.png](https://files.gitter.im/red/red/bLog/thumb/image.png)](https://files.gitter.im/red/red/bLog/image.png)**

**[21:10](#msg5e8f8f59e7ca460b064dcb43)(I retire this statement: \*(a little more frequency would increase this perception)\*: latest updates are frequent enough, I have taken another look at the dates)**

****Friday 10th April, 2020****

**pekr**

**[06:28](#msg5e901216cc370f0b07d554cf)@greggirwin What is the situation with the Red FB group and Red FB page? I will explain - with the FB group, we were facing basically two situations - 1) ppl complaining, that there is too much posts and that if it will continue, they will leave the group. So we tightented it and made it mostly a news channel, allowing occasional user posts ... 2) Ppl complaining, that it is a group, not a FB page, so that they will leave, if it is not free to post just by anyone.**

**Lucinda also told me, there is a FB Red dedicated page, which I did not know even exists. There are just few posts there, dating back to 2018, related to Cryptocurrencies stuff. I don't know, who has access to that page, I am not the one.**

**So - the ideal situation would be to start over on the FB Red page, make it a news channel mostly, bringing small tidbits from around the development front, as well as community efforts, etc. In contrast, FB group might become more open to other ppl posts ...**

**Basically, that's the scenario I would vote for. But - if Red page is not going to be (re)maintained, I will continue with the FB group the way it is - mostly a substitute to a FB page, with a more closed nature ....**

**qtxie**

**[08:01](#msg5e9027c51aaf8e4b8e72e6b9)@hiiamboris Great work! :+1:**

**meijeru**

**[08:34](#msg5e902fa616f84f04616b8ea6)Observation: `money!` has appeared in the `0.6.5` version of the official documentation; but that version is not (yet) readable from the documentation main page `https://doc.red-lang.org/`**

**[08:42](#msg5e903165e7ca460b064f37e4)The very curious can look at \[this page](https://github.com/red/docs/blob/0.6.5/en/datatypes/money.adoc)**

**qtxie**

**[08:52](#msg5e9033bffea5216d696d480c)@pekr The main issue that slowing down the release is that we're lacking developers and each one of the team is working on different projects. For example, for me, just fixing bugs can easily used up all of my time.**

**For the downloading page, I think it's better to use the big red download button for automatic build until we reach 1.0. Then we do release for feature release instead of stable release (Anyway people don't think it's stable unless it reach 1.0 ;-) ) , each feature release will increase version number and maybe a blog article if the new features is big enough.**

**cloutiy**

**[15:19](#msg5e908e8df450c25cc8cfb860)Since there's been some posts re: development, and the future, I'll take the opportunity to ask about modules, which is on the roadmap. Just curious to know what the syntax for modules will (or might) look like. If it's still too far down the road to discuss no worries, I completely understand.**

**pekr**

**[15:57](#msg5e90977d1aaf8e4b8e73f7c7)I don't remember how complete R3 modules were, threre might have been even more models in the past, but maybe worth scanning the Internet. IIRc, it is basically like having an object header, where you specify, which things are visible (extern) to the module, or something like that .... Even Carl was fighting to get the modules right: http://www.rebol.net/r3blogs/0339.html**

**[16:06](#msg5e90998916f84f04616c8fb6)@cloutiy you can read some R3 related blog article and from the related comments see, that opinions on that really differed. There were users wanting reverse operations - import functions, instead of defining what's going to be exported - http://www.rebol.net/r3blogs/0300.html . But - R3 is mostly a history, maybe Doc and the team has clear idea on modules already and we just need to wait for them to emerge ....**

**cloutiy**

**[16:16](#msg5e909bf39316f34b8d92a9b6)@pekr ok thanks will do some reading**

**[16:54](#msg5e90a4adcc370f0b07d6d1f5)Another side topic. Has there ever been any thought into having the interpreter/compiler send errors to a central location for analysis? For example, how many of us get errors or warning when loading and running programs/compiling. I would imagine I'm not the only one. Imagine each time you get some error or warning the interpreter sends a report. All these reports are collected and parsed to generate stats of somekind. For example 95% of the errors/warnings relate to this or that form, this or that concept, this or that syntax or semantic. This could provide useful (silent) feedback loop that could be useful for understading where developers get tripped up, where there is most misunderstanding of the language, where additional learning material or documentation might be needed etc...**

**9214**

**[17:00](#msg5e90a63538198d56a193bdb5)I can tell you all that even without telemetry.**

**cloutiy**

**[17:08](#msg5e90a818d021c45cc7d94bc5)ok**

**greggirwin**

**[20:11](#msg5e90d302fea5216d696ee2e0)@hiiamboris I want a high precision decimal type as well. It will come, but money is implemented as BCD right now.**

**@meijeru thanks for raising the question. For those interested, you can preview `money!` docs \[here](https://github.com/red/docs/blob/0.6.5/en/datatypes/money.adoc). Note that some decisions are yet to be finalized. e.g. is `code` the best name for the currency code component. `Amount` is pretty much settled though, beating `value` by a landslide.**

**Talk about a tough design space! To make matters worse, consider if Red ever supports a `quantity!` type, which shares characteristics with `money!`, and would benefit from consistency with it. No fluctuating exchange rates to contend with there, but other questions arise.**

**If `USD$456 = EUR$456` raises an error, as R2 did, we have to ask what the benefit is over simply returning `false`. R3 doesn't support currency codes at all, so all money values are generic in that regard, and you need to use a block to group a denomination/unit-type with an amount. That eliminates the problem, but also makes them non-atomic lexically. If we \*think of* money values as 2 component parts--an infix `$`-based block if you will, they simply aren't equal.**

**WRT modules, I have a \*lot* of notes and research. There are a number of big design considerations and a thousand details.**

**@9214, can you tell us please? :^)**

**@pekr, on FB, thanks. I will try to find that page myself. Starting fresh sounds good, and I don't use FB to know what will annoy people the least. It sounds like the channel is sort of a no-win situation.**

**(Sorry for any disjointed thoughts. Wrote this over time.)**

**9214**

**[20:41](#msg5e90d9efcc370f0b07d75aa6)@greggirwin tell what? `=` permits comparison between generic and specific currencies, you can think of it as comparison of amounts. `==` is stricter and allows comparison only between identical currencies, you can think of it as comparison of denominations; at least for testing purposes that's useful.**

**All other forms of comparison make no sense without conversion ratio, which in reality changes as soon as you compared two `money!` values; so even if it returned `false`, by the time you read the result it might already be wrong. For me it makes sense, because in Rebol values are not just boxed chunks of bytes, but denotations of real-world objects. You cannot compare apples with oranges just like you cannot compare USD with EUR (that is, without having an exchange rate), and returning `false` is opening a can of worms (aka so-called `none` transparency). The same denotational reasoning applies to `*`, `/` and `%` (see the docs) — if you divide `money!` by `integer!` you get `money!` (if I split this pile of money into that number of groups, how much cash will be in each group?), but if you divide `money!` by `money!` you get `float!` (how many groups of that amount can I make, and how much will remain ungrouped?).**

**`=?`'s implementation is actually a form of low-level "structural" equality that just compares the contents of two slots and their types, but I made it identical with `==`; I might change it back if there are any sound arguments for that, but in such case `money!` will have 3 different comparison semantics, which IMO is too much. At that point @greggirwin usually starts to ask for use-cases, mockups and playground experiments. I personally would be interested in feedback from vetted fintech and algotrading people, because that's where `money!` coupled with dialects can shine the most.**

**There is comparison of amounts with `=` and comparison of denominations (amount + currency code) with `==`, what might be missing is comparison of currency codes, which is what `attempt` or `a/code = b/code` gives.**

**[20:48](#msg5e90dba416f84f04616d3d92)Perhaps `=` should be relaxed even further so that it compares amounts only and completely ignores currency codes; `==` and `=?` then would take both amounts and currency codes into account. But then what to do with other types of comparison (less than, greater than, inequality &amp;c)?**

**hiiamboris**

**[20:57](#msg5e90ddb3c52b6a38abd9c808)So, this:**  
**`>> () = 1.#NaN == false`**  
**makes perfect sense, but `money1 = money2` returning `false` is a can of worms? I don't follow the logic ;)**  
**But think not of just `money1 = money2`! Think of generic `value1 = value2`, where you don't know what values you're processing.**

**9214**

**[21:18](#msg5e90e2b6c52b6a38abd9d41f)You are jumping into the argument without reading much into what @meijeru and I have already said. Comparison of `money!` with non-`money!` is not the same as comparison of `money!` with `money!` — the former is (in)equality between two different types that might have different (or compatible) semantics, the latter is (in)equality \_within_ one specific semantics, which I'd call "common sense" (i.e. conversion rates and apples with oranges). In the former case it's enough to compare the type IDs and do conversions, in the latter, it's datatype-specific (recall e.g. case-insensitivity and grouping of types into typesets, which implies at least some sort of similarity).**

**The question once again can be reformulated — if two values can be compared, it means they can be converted/coerced one into another without loss of information. Can you do this sort of conversion (and thus comparison) for different currencies?**

**And, again — use-cases. `fast-lexer` build with `money!` merged into it is up for grabs, and I said all that there is to say.**

**greggirwin**

**[21:36](#msg5e90e6c8f450c25cc8d0a22a)&gt; I can tell you all that even without telemetry.**

**@9214 this is what I was asking about, WRT general errors in Red.**

**hiiamboris**

**[21:38](#msg5e90e746d021c45cc7d9e8d9)@9214 I gave you the idea of use cases ☺ But repeating again - e.g. a library or mezz code, which compares values it doesn't know about. Like you wanna count how many times `x` appears in block `b`, and then poof - `x` were passed a money value and the whole thing started throwing errors and you're forced to slow it down by myriad of checks. There literally can be thousands of examples like that.**

**greggirwin**

**[21:49](#msg5e90e9fe16f84f04616d5e07)Ignore any external oracle needs (exchange rates). They are a red herring. Once you go down that path EUR$10 is no longer guaranteed to equal itself at another time.**

**"...think of money values as 2 component parts". What are the problems with that? Can we explain it and reason about it? What \*can't* we do with it?**

**I will say "let's not overthink and over-complicate this", but there may be something I'm missing.**

**9214**

**[21:52](#msg5e90eab61aaf8e4b8e74d203)@hiiamboris how much time did you actually spend writing code that uses `money!`, or reading the documentation for that matter? For all your hypothetical thousands of examples, there are thousands where raising an error on incompatible denominations might make sense, and datatype accessors give you enough flexibility to come up with whatever mezz code you want.**

**The particular case you describe makes no sense to me — if you want to find all occurrences of `money!` values, `money?` predicate is enough; if you want values with specific currency (ignoring amount) then there's `/code` and `pick`; if you want values with the specific amount then there's `=`; if you want specifically \_this_ amount of \_that_ currency — there's `==`; and then there's a question of `=?` as low-level structural comparison and less than / greater than / unequal (all of which you ignored of course).**

**greggirwin**

**[21:55](#msg5e90eb635b98016d6a298ac1)Cool down @9214.**

**9214**

**[21:58](#msg5e90ebed9316f34b8d937065)@greggirwin if people are satisfied with things like `[USD 1.2345]`, then I don't see the point in having `money!` at all, or in keeping the idea of "syntactically-rich, human-friendly, homoiconic language" alive for that matter. And we can always ask ourselves "what the man who spent 20-something years designing Rebol2 was thinking when he made this design decision?".**

**&gt; EUR$10 is no longer guaranteed to equal itself at another time**

**\[\_Gasps...\_](https://www.youtube.com/watch?v=KrrFqtgQjUA)**

**greggirwin**

**[22:03](#msg5e90ed275d148a0460fa9aee)@9214, I didn't suggest that we use blocks, but that we \*think* of money values as two component parts, while defending the benefit of it's current syntax.**

**hiiamboris**

**[22:06](#msg5e90edc8e24b4d6c44fd1a59)Like I'm using `maybe` that sets set-path to value only if it's current `value <> new-value`, to keep reactions from firing when there's no real change. That has to be lightweight as it's used a lot. I can fill the whole room with examples, but I think those who wanted to see my point - did that already ;)**

**greggirwin**

**[22:06](#msg5e90ee036823cb38acc2b285)&gt; Think of generic value1 = value2, where you don't know what values you're processing.**

**This is how I view the comparison situation as well.**

**[22:28](#msg5e90f303e7ca460b06511f89)In/equality is easier than lesser/greater. The latter adds the question of whether currency codes are compared lexicographically, by symbol, or by position in the list of codes. I think it should be by what people see or it will be confusing.**

**hiiamboris**

**[22:31](#msg5e90f3a5cc370f0b07d7935c)Yes, sortability... Tricky ;)**

**[22:34](#msg5e90f460cc370f0b07d79503)**  
**`>> sort [USD$1 EUR$1] *** Script Error: USD$1.00 not same denomination as EUR$1.00 *** Where: sort *** Stack:`**

**[22:35](#msg5e90f4b35d148a0460faa9f6)R2 sorted by comparing amounts only**

**greggirwin**

**[22:36](#msg5e90f4fde24b4d6c44fd2a2a)Even trickier. What is most useful will differ by context. e.g. by value alone or grouped by currency. Back to HOFs and a `group-by` func.**

**9214**

**[22:47](#msg5e90f78df87c5956a24e1f04)1. Relax `=` even further so that it compares only amounts;**  
**1.1. `<` and `>` compare only amounts;**  
**1.2. `<` and `>` compare both currency codes (either lexicographically or by index in currency list) and amounts;**  
**2. Keep current semantics and change `=?` back low-level comparison of slots;**  
**3. Drop all of that and let people come up with their own error-throwing wrappers as needed. Comparison always return `logic!` value and differ only in their level of strictness.**

**[23:02](#msg5e90faed3a85536c43206349)(1) with (1.1) matches the definition of "lax comparison" for me; (1.2) makes sense for sorting only, and can come as a surprise in other contexts; I can't remember if we actually have `COMP_SORT`, but if we do then it might be a sort-specific thing. (2) is an extra complexity and mental burden for little to no gain and (3) implies (1) while being as a generic functionality to build all all kinds of logic upon.**

**[23:04](#msg5e90fb615b98016d6a29aa13)There's also an open question of how `sort` should handle compatible datatypes, e.g. a block of `integer!`s, `float!`s and `money!`s.**

**greggirwin**

**[23:05](#msg5e90fbc0f450c25cc8d0ccee)Sort order, following R2 is `[integer! float! money!]`**

**9214**

**[23:07](#msg5e90fc28e7ca460b06512f53)@greggirwin aren't you up for a surprise:**  
**`>> sort random [1 1.0 $1 2 2.0 $2 3 3.0 $3] == [1.0 1 2.0 2 3 3.0 $1.00 $2.00 $3.00] >> sort random [1 1.0 $1 2 2.0 $2 3 3.0 $3] == [1 1.0 2 2.0 3.0 3 $1.00 $2.00 $3.00]`**

**[23:08](#msg5e90fc586823cb38acc2d141)Think also of `any-string!`. In general there should be some sort (pun intended) of typeset-tower, where types are arranged by specificity.**

**greggirwin**

**[23:15](#msg5e90fe289316f34b8d939531)Indeed. I shouldn't trust myself. :^)**

**[23:48](#msg5e9105df38198d56a194a3c0)\[The reference](https://en.wikipedia.org/wiki/ISO\_4217#XXX) is vague on `XXX`, but \[this](https://stackoverflow.com/questions/46929879/unicode-generic-currency-%C2%A4-translitteration) has a more helpful note: "XXX : code reserved for contractual transactions where no currency is involved (for example information transfer about non monetary characteristics of an account, a contract or a transaction, zero exchange rate, but possible direct debit of associated transaction costs in another currency)."**

**OK, not \*much* more helpful.**

**I think the current rules are good, except for throwing errors on comparisons. 3 doesn't completely imply 1 to me in that regard, but +1 for the intent.**  
**`m0: [word! 100] ; == $100 m1: [XXX 100] m2: [USD 100] m3: [EUR 100]`**  
**If you think of it that way, does it make sense? `m0` is generic, and can work with any of the others, while even `XXX` is strict in saying it's not compatible with any other specific currency.**

**Ops involving a generic currency are allowed against any money value, and the user can choose to use strict comparisons when needed. They can also choose to use generic money values everywhere and build their own system that supports any label they want to go with those in a block or other structure. We can't say what's best for everyone, but we can make it easy to pass around common values that humans understand.**

**It's been a long week, but I \*think* this makes the normal case easy to use and understand, and flexible, while giving the user control when they need it. Only throwing errors when trying to do math on different, non-generic currencies which seems like an obvious mistake we all want to avoid.**

**[23:51](#msg5e91066d3a85536c43208270)One of my points here is that ISO 4217 has guidelines for generic, unknown, and special currency types. We're not implementing a standards-compliant datatype here, but we're also not stopping one from doing that themselves, while still getting \*some* benefit from what `money!` offers.**

**[23:56](#msg5e9107a9e24b4d6c44fd561f)`Extra` currency codes, have a reserved space, and \[the doc](https://github.com/red/docs/blob/0.6.5/en/datatypes/money.adoc#7-currency-list) notes they can go in the header. I might defer that feature, as it doesn't stop people from including them outside the header.**

**[23:58](#msg5e91083f38198d56a194a8a5)What I mean is, they can still do it, without header support, and we can easily wait to see how many people ask for it. Certainly for games and virtual economies they could be useful, but it also doesn't limit your script in what it uses. i.e., you can't list currencies in the header to denote that your script only supports those currencies listed there.**

****Saturday 11st April, 2020****

**9214**

**[00:49](#msg5e91141acc370f0b07d7e40f)The more I muse over it the more I lean towards (3) + lexicographical niceties of `COMP_SORT`. Recalling C3-related R&amp;D, there were at least 2 ideas that caught my attention: path-dependent types (cf. Obsidian, I think Scala might also have them) and gas-bound computation in general; also linear resources.**

**The idea of path-dependent types is that objects or other entities can "mint" their own type of resources (i.e. money), which are depended on their internal state or other properties; linear resources are basically Rust ownership system in disguise — resource's allocation, acquisition and expenditure have tightly controlled boundaries (in the context of `money!` that would mean e.g. prevention of double-spend and modeling of ownership/borrowing relations between actors).**

**So we can have reactive objects caught up in Petri-net-like exchange of token-currencies between each other, establishing their own virtual economies and equalities. Not saying it's practical, just interesting to think about. Imaging infecting one object so that it passes to all others a code that binds to object's internal state and mutates it, and then watching how `TOILET-ROLL$0.75` goes Moon because of that.**

**Gas-bound computation can be generalized from fancy buzzword to utility computing and serverless architecture, where, for example, each function or block of code has a `money!` cost backed in; currencies then might denote specific resources that computation involving this code takes (energy, bandwidth, memory &amp;c).**

**So in that light, (3) is general enough to accommodate all of the above. The current model still has its merits, but it might not be a good choice \_by default\_, as it's too biased towards specific use-case (fiat). People won't use REPL to tally up their financial portfolios, the will likely use Red-based spreadsheet for that. And spreadsheet, as an application (or rather domain of applications), can create its own rules (e.g. notifying when I try to compare apples with oranges, which can mess up my retirement plan).**

**[01:10](#msg5e9118f01aaf8e4b8e7544bc)But then the currency code has no semantic weight to it, being a mere syntactic nicety, and `money!` itself would be an ad-hoc decimal type with very few unique properties. How much effort on the user's side will it take to make a more ornery comparison that we have now? How surprising and unexpected will `USD$123 < EUR$456` returning `true` be? I can easily imagine politically inclined ones starting a flamewar over that, it's the Internet after all. Is `money!` a transition between what we have (integers with floats) to what we might have (units with bigints), or is it something that will be with us for a long haul?**

**hiiamboris**

**[09:43](#msg5e91915c6823cb38acc42f2f)It should be okay for `USD$123 < EUR$456` to throw an error, same as it's okay for:**  
**`>> "s" < [b] *** Script Error: cannot compare "s" with [b] *** Where: < *** Stack:`**  
**whereas it's still sortable and supports silent inequality:**  
**`>> sort ["s" [b]] == [[b] "s"] >> "s" = [b] == false`**  
**The point here is simply to not introduce special cases that break more than they build (and generally try to avoid them).**

**pekr**

**[10:00](#msg5e91952d1aaf8e4b8e7648db)Please let's not compare USD to EUR etc. - you would need to have an updated conversion rates tables, or the whole database for particular dates, etc. Any such comparison should yield an error imo.**

**[10:00](#msg5e9195455d148a0460fc1110)As for sorting ... well, not sure what to say ...**

**Oldes**

**[11:52](#msg5e91af8c5b98016d6a2b31c0)When talking about `money!`, wouldn't it be more useful to have `form CZK$10` returning in \_czech_ case `"10,00 Kč"` instead of `"CZK$10.00"`?**

**[11:54](#msg5e91afddc52b6a38abdb95cb)Also I'm not sure, if the decimal part is correct when it does not \_round\_, but \_truncates\_: `form CZK$10.128 == "CZK$10.12"`**

**hiiamboris**

**[11:56](#msg5e91b05d1aaf8e4b8e768222)&gt; When talking about `money!`, wouldn't it be more useful to have `form CZK$10` returning in \_czech_ case `"10 Kč"` instead of `"CZK$10.00"`?**

**that's a scope of \[`format`](https://github.com/hiiamboris/red-formatting/commit/802bf7fb67cdd30d4a60aeb18e8afe4fa28a84ae#r35975232) I think**

**Oldes**

**[11:59](#msg5e91b1266823cb38acc46f67)I'm not sure if `form` should not be a native `format`.**

**[12:01](#msg5e91b17f9316f34b8d95141b)Honestly... I never used the currency code in Rebol, because it is annoying to write it and in 99.99999% you are counting with just one currency anyway.**

**[12:01](#msg5e91b1a8e7ca460b0652b762)In my case I never needed 2 currencies in the same script.**

**[12:13](#msg5e91b47838198d56a196101c)And also I think, that `mold` should not truncate the number like it does now:**  
**`>> mold EUR$123.45678 == "EUR$123.45"`**  
**(although I know, that there is also `mold/all` which doesn't truncate)**

**[12:16](#msg5e91b52c6823cb38acc478a0)Because I can imagine that many people would be surprised with:**  
**`>> save %/r/data [$1.23456] >> load %/r/data == $1.23`**

**greggirwin**

**[21:10](#msg5e9232575d148a0460fd6d3f)&gt; How surprising and unexpected will USD$123 &lt; EUR$456 returning true be?**

**This, and related comments, come back to a fundamental problem/decision: Are `money!` values more Red values or real world values? Once we go real world, exchange rates etc. apply, as @pekr notes, which is not something we should build into the core datatype. So they are simply Red values to me. I think this lines up with @hiiamboris' recent comment, as well as @meijeru's original note from what he and @9214 discussed \[:point\_up:](https://gitter.im/red/red?at=5e8ee18c38198d56a18ed4b7). e.g.**

**&gt; for the "ordering" operators (&lt; &lt;= &gt; &gt;=), incompatible types give an error! value**

**How do these rules sound?**

**1) In/Equality comparisons produce `logic!` results. Generic money values cause only amount to be compared.**  
**2) Strict in/equality comparisons produce `logic!` results. Generic money values cause both currency and amount to be compared. That is, generic only matches generic.**  
**3) Lesser/Greater comparisons cause an error if currency types don't match.**  
**4) There are no strict versions for lesser/greater, so generic money values match all currency types.**

**[21:22](#msg5e923525f87c5956a250e8f6)@Oldes, `form` could end up going deep into @meijeru's territory, with specifics on what values may become unloadable when formed. We have tables for string conversion results. But I agree that there's a difference between "user friendly" (while likely still loadable) and "formatted for presentation". I'm not saying that `form` \*must* produce loadable results, and may not in all cases today, and there is certainly a deep appeal to making it smart for money in this case. Still, if `format` does this, maybe that combination of choices is good.**

**I also never needed two currencies in Rebol, but my main issue was that money there wasn't decimally correct, so there were things I didn't write. Ultimately, this is a much bigger issue, because business people \*will* need this functionality.**

**[21:37](#msg5e92389ae7ca460b0653f2cf)`Save` is a good example, and should not be lossy. `Mold` is a harder call, as we have only our imaginations to go from right now, as to what's best. If it molds all, excluding trailing fractional zeros... still hard. What R3 does is interesting:**  
**`>> $100 * 6.125% == $6.12500 >> $100 * 6.25% == $6.2500 >> $100 * 6.5% == $6.500 >> $100 * 6% == $6.00 >> $100 * 60% == $60.0`**  
**Having worked on some financial software in the past (mortgage systems), there are two needs: 1) what the user and bankers/accountants see, to the penny. 2) what you may need to see internally, where sub-penny amounts matter. So it's context sensitive. In the bigger scheme, and thinking about digital currencies, stored values matter and need to be precise. I can think of a couple scenarios already.**

**If we think of spreadsheets (again), there is data and there is presentation. `Mold` is about the data IMO, and should be full precision.**

**[21:38](#msg5e9238d31aaf8e4b8e77c52e)I kind of want to ask about always including group separators too, but we already have a lot going on.**

**Oldes**

**[21:50](#msg5e923b9df87c5956a250fc6a)@greggirwin I thought that the decision was, that `form` does not have to produce backward loadable results. And it should be clever enough, with a help of user system settings, to for example use `,` in decimal numbers instead of `.` if it is what user (and or regional settings want).**

**[21:51](#msg5e923bd4fea5216d69720efe)And if `form` result is such a free, `mold` really should not hide anything like it does now with money values.**

**[21:53](#msg5e923c546823cb38acc5c473)And in R3 is bug.. it should not add the last two zeros.**

**hiiamboris**

**[21:56](#msg5e923d085b98016d6a2c8345)&gt; How do these rules sound?**

**Should we continue? If we allow `m1 < m2` we should allow `+`, `-` as well.**  
**5) `$1 + USD$2 = USD$3` (commutative, always returns specific currency)**  
**6) `$1 - USD$2 = -$1` ?? (non commutative, but should it return specific currency of that of the 1st operand?)**

**greggirwin**

**[22:02](#msg5e923e6316f84f0461704424)@Oldes do you remember if that decision was noted somewhere?**

**[22:11](#msg5e924079cc370f0b07da805e)@hiiamboris my gut says commutative, because it's lossy otherwise.**

**[22:12](#msg5e9240e4e24b4d6c4400051e)@pekr, I found https://www.facebook.com/Redprogramminglanguage/, but don't seem to have admin rights to manage it. I will ping Lucinda.**

****Sunday 12nd April, 2020****

**planetsizecpu**

**[09:30](#msg5e92dfc36823cb38acc71019)@greggirwin I had a problem similar to yours with the bankers, in the ERP that I maintained we had the type `r8` (for real numbers) that always stored the complete number with 8 bytes and you could define the mask by code. We also had the type `m8` (for currency) that also stored the full number with 8 bytes, but always showed a fixed mask defined by the system, also had `visual self-rounding`.**

**The problem, as in your case, was that some data needed different roundings, for example, the totals fields had two decimal places, while the prices had four.**

**In the end we only used the money `m8` fields for document totals, to take advantage of the `visual self-rounding` instead the prices were always used with `r8` types, in that sense there were no problems with operations `< > =` since the number was always stored completely as `r8`, so `m8` was just a workaround that helped.**

**I don't think it applies to the problem to be solved with `money!` and there was also no literal part `USD $ EUR $` etc just to**  
**take into account that sometimes not everything can be solved, and an arrangement is necessary. Remember what Nenad says in some video at FB: Red is intended for human use, and will keep it as simple as possible.**

**hiiamboris**

**[20:02](#msg5e9373c53a85536c43260f11)**  
**`>> f: 4.5 loop 10 [print [f attempt [mold/all to money! f / 1e5]] f: f - 1] 4.5 $0.00004 3.5 $0.00003 2.5 $0.00002 1.5 $0.00001 0.5 none -0.5 none -1.5 -$0.00001 -2.5 -$0.00002 -3.5 -$0.00003 -4.5 -$0.00004`**  
**@9214 I think you should just return $0.00000 in near-zero case rather than throw an error. I do not see what purpose does this 'underflow' error error serve.**

**greggirwin**

**[20:13](#msg5e93767ae7ca460b0656c120)Looks like `about` in the GUI console emits an extra newline now.**  
**`>> about Red 0.6.4 for Windows built 7-Apr-2020/21:07:41-06:00 commit #9203479 >>`**  
**May have been a recent fix to the REPL that `about` worked around before.**

**hiiamboris**

**[20:18](#msg5e937795e24b4d6c4402b96e)Same here:**  
**`>> $100000000 / 1000000 == $100.00 >> $100000000 / 1000000.0 == $100.00 >> $100000000 * 1e-6 ;) same result expected *** Script Error: money overflow/underflow *** Where: * *** Stack: >> $10000000.1 * 1e-5 ;) I'm losing money silently == $100.00 >> $10000000.1 * 1e-6 ;) losing same amount - error *** Script Error: money overflow/underflow *** Where: * *** Stack:`**

**GiuseppeChillemi**

**[20:19](#msg5e9377bec52b6a38abdfa7b8)About the underflow error, @hiiamboris I agree, it is not good to have to change the way you express your code in near zero situation. It creates a particular case where, there is (seems to be) no need.**  
**It already happens when you `copy` strings with a start and end point in a `loop`: you must to handle the 1 character problem that triggers an error and you must insert conditional code and copy it in another way.**  
**However, there should be reasons that have led Vladimir evaluate this option.**

**greggirwin**

**[20:21](#msg5e9378393a85536c4326183c)Other situations coerce to zero silently.**  
**`>> $0.000001 == $0.00000`**

**[20:24](#msg5e93790b9316f34b8d991e31)I haven't thought it through yet, but consider that you really shouldn't ever mix floats with money.**

**hiiamboris**

**[20:26](#msg5e937971f450c25cc8d68722)How do you accrue interest without it?**

**[20:27](#msg5e9379b7cc370f0b07dd51f4)Oh... About that:**  
**`>> $100 * 10% *** Script Error: percent type is not allowed here *** Where: * *** Stack:`**

**[20:28](#msg5e9379e05d148a0460005668)Must be some case in TYPE\_* check missing.**

**greggirwin**

**[20:28](#msg5e937a01e7ca460b0656c7bf)Well, this is our current problem with `percent!` being float based as well, which I think I mentioned might leverage Harald's Dec32 work for now, or even Vladimir's BCD work for money, as a common base implementation.**

**As soon as we add float to the money mix, we're back to being victims of floating point errors.**

**hiiamboris**

**[20:30](#msg5e937a4e16f84f04617316dd)Floats have 16-17 digits of precision.**

**[20:32](#msg5e937acc5d148a04600058df)Simple something like `m1 * (m2 / m3)` would lose a lot more precision if `m2 / m3` yielded `money!`**

**greggirwin**

**[20:34](#msg5e937b4e16f84f046173186d)We need to find or create examples, and see where issues arise.**

**meijeru**

**[20:39](#msg5e937c80e24b4d6c4402c42e)`*` and vice versa should be allowed in my opinion, otherwise we have to fall back on `to-float` which is awkward.**

**hiiamboris**

**[20:40](#msg5e937cd9e24b4d6c4402c54b)So, about that underflow. The only reason to keep it I think - is if it guaranteed not a penny lost in an operation. That is, no loadable `$0.000001` or `$10.00001 / 10` or even `$10.00001 * 1.1` - which becomes really harmful as a lot of real world operations won't work with it and it's unclear how does one override the behavior.**

**greggirwin**

**[20:42](#msg5e937d196823cb38acc891e5)I was just playing with 1.1 myself. :^)**

**hiiamboris**

**[20:42](#msg5e937d245d148a0460005de1);)**

**greggirwin**

**[20:43](#msg5e937d65f450c25cc8d69067)Percents should be supported, yes.**

**hiiamboris**

**[21:07](#msg5e938325fea5216d6974fc87)On currencies.**  
**1) What's the advantage of `/code` over `/currency`? Brevity?**  
**2) Are we going to support returning and constructing with \*numeric* ISO codes, or should users load the tables themselves? (that won't be possible for `RED`/`BTC`/`ETH` but those are a joke in such precision limits anyway)**  
**3) I don't see `XTS` (the testing unit), `XAU`/`XPT`/`XAG`/`XPD` (precious metals) and some other codes used by the standard - by design? Also `USN` code for US dollar.**  
**4) Why not allow `XXX` (in e.g. `make money! [XXX 10]`) as an alias to no currency (`make money! [#[none] 10]` is not allowed and only works as `make money! 10`) - more special cases for programmatic constructors**

**greggirwin**

**[21:19](#msg5e9385d238198d56a19a306c)1) We did an internal survey on Telegram and votes were mixed. `/code` is the current, but not definitively final name. In the wider scope of a possible `quantity!` type, I like `/unit`, but all thoughts are welcome.**  
**2) Do you mean like 978 for EUR and 840 for USD? How would the codes be used, or be better?**  
**3) Extensions are done via `extra`, but we can look at what others should be in the standard list.**  
**4) I thought about that, when I posted a day or two ago with block-like examples. My feeling is that allowing `XXX` as its own code/unit type gives people the \*choice* to use it, but making it equivalent to generic money will be more confusing than helpful. Generic money values already fill its purpose, IMO, with less clutter and in a more friendly way.**

**[21:20](#msg5e93860a5b98016d6a2f641e)Supporting `none` in a `make` spec should be possible as well, and makes the intent clear.**

**hiiamboris**

**[21:36](#msg5e9389f55b98016d6a2f6f6c)2) Yes, those. Well, maybe the only thing you \*have* in your input data is the numeric code? We could allow them in `make` for example, and make an accessor that would return them.**  
**3) I'm sure `XAU` (gold) is much more widespread than `CDF` (Congo franc) for example. `extra` is all cool, but not interchangeable between Red instances unless they are synced about what they fill the `extra` with.**

**greggirwin**

**[21:54](#msg5e938e0916f84f0461733ed2)2) We could add support for that later, without breaking anything, so I vote we defer it for now. See if anybody asks for it.**  
**3) It makes sense to include the precious metals, since they are standard, and small set. Probably USN as well.**

**[21:56](#msg5e938ea2e7ca460b0656f840)I wonder how XTS is used in the real world?**

**[21:59](#msg5e938f545d148a04600082ef)Certainly, if exchange systems and others use it for interchange testing, etc., it would be good to have. We're flying a bit in the dark, as we don't have someone from that domain to help inform the design. Finding someone to do that would be \*GREAT\*.**

**Any volunteers from the community to find someone and reach out on our behalf?**

**GiuseppeChillemi**

**[22:59](#msg5e939d4a5d148a0460009e5e)Why currency code has fixed size and not a variable one? I have read here that some digital currencies have more than 3 characters in their code**

**greggirwin**

**[23:09](#msg5e939fbf1aaf8e4b8e7af57c)It follows the ISO4217 standard.**

**GiuseppeChillemi**

**[23:44](#msg5e93a7fad021c45cc7e02196)I reformulate my question: why more standards can't be adopted ? Red has open its doors to digital currencies, it seems to me strategic to create a ground to have a wider base of possible uses like having variable length currency codes. Would it be so difficult to have such feature?**

****Monday 13th April, 2020****

**greggirwin**

**[00:17](#msg5e93afa8f87c5956a25447f6)What other standards are there, in this domain, to be adopted? Digital currencies are an interesting issue, because some of them use 16 decimal places of precision, which `money!` doesn't currently support either. But, as always, there are tradeoffs. By limiting the codes to a table, with 255 entries maximum, the code can be stored in 1 byte, allowing money values to be stored in a single slot, rather than requiring a reference to another word or string value for the currency. This makes them \*much* more resource efficient. It also doesn't prevent people from building their own systems using blocks to store other currency labels.**

**For the hypothetical wider base of possible uses, I don't see a strategic use there that justifies a different design for `money!`.**

**GiuseppeChillemi**

**[01:25](#msg5e93bfa49316f34b8d99a66b)@greggirwin I can't discuss on this topic more as it's a new one for me and I would make so many assumptions that would not respect reality. Thanks for your explanation.**

**pekr**

**[06:24](#msg5e940583cc370f0b07de63de)Was away for 2 days. There was some talk about money! type and associated sort, errors, etc. My preference most probably is, to not actually give a currency ANY meaning. Well at least for sorting - just compare by values only. As for other operators like =,&lt;,&gt;, I can imagine two scenarios - ignore it currency code just again and compare only values. Make comparing a values a strong rule in documentation and call it a day. Would be consisted with sorting. If you are an idiot, then write your code like USD$1.0 &lt; EUR$2.0 and argue about what is actually expected. Or ... second, throw an error. But if we throw an error, why sorting would be expected to work then? Let's absolutly not enter the territor of exchange rates, when acutally banks emit them, etc., it can be real hell imo ....**

**hiiamboris**

**[11:05](#msg5e944772f450c25cc8d8418d)Sorting works on all values that are not directly comparable, so it alone should not enforce comparison operators design. And also `<`/`>` operators involve much more context than `=`/`==` as they imply that one expects compatibility of left and right operands, so an error coming from `<` and `>` should not enforce an error from `=`, where no such expectation is made.**

****Tuesday 14th April, 2020****

**Rebol2Red**

**[09:50](#msg5e95876b38198d56a1a010dc)What's wrong with https://doc.red-lang.org/**  
**Perhaps a major update?**

**greggirwin**

**[14:06](#msg5e95c34e6823cb38accf7613)Seems OK here.**

**Rebol2Red**

**[17:50](#msg5e95f80338198d56a1a1d6b7)@greggirwin Maybe the site is cached on your pc? Even when trying on a phone with a seperate 4G connection the site is only loading a very small part of it. Saying "This it is a work in progress. Only a few pieces are available as reference documentation."**

**hiiamboris**

**[17:52](#msg5e95f85b3a85536c432ddf8b)On the left should open a navigation panel**

**[17:53](#msg5e95f8981aaf8e4b8e824764)https://i.gyazo.com/10e2fbb8be026dea327a53f188cbb5dd.png**

**Rebol2Red**

**[17:57](#msg5e95f9849316f34b8da101ed)On a phone everything is ok. But on my pc (windows 10) there is only an error saying the site is not reachable, ip not found and DNS\_PROBE\_FINISHED\_NXDOMAIN.**  
**I have reset winsock to no avail. This is as far as i can see the only site which do not load. I disabled my adblocker.**

**dander**

**[17:59](#msg5e95f9f91aaf8e4b8e824bef)what do you get for `nslookup doc.red-lang.org`?**

**Rebol2Red**

**[18:00](#msg5e95fa405d148a04600826c6)**  
**`Server: UnKnown Address: 84.116.46.21 *** UnKnown can't find doc.red-lang.org: Server failed`**  
**Is the ip address wrong?**

**hiiamboris**

**[18:04](#msg5e95fb3ecc370f0b07e53b50)Must be your DNS server's IP. Should be `cdn.gitbook.com [95.85.1.232]`. So maybe try another DNS, e.g. 8.8.8.8**

**Rebol2Red**

**[18:07](#msg5e95fbf19316f34b8da10bfe)Strange when i type 95.85.1.232 in my browser i get only: {"message":"Welcome to microcdn !","version":"3.8.6"}**  
**If i type cdn.gitbook.com i get the same error as before. https://www.gitbook.com/ shows the site**

**hiiamboris**

**[18:10](#msg5e95fc951aaf8e4b8e825522)Yeah, probably no direct IP for those docs.**

**dander**

**[18:11](#msg5e95fcee5d148a0460083558)that IP is likely hosting multiple things, so if it doesn't have the host name in the address, it can't route the request to the site. You could hard-code the ip in your hosts file, but switching to a different dns would be a better solution**

**Rebol2Red**

**[18:16](#msg5e95fdf4cc370f0b07e544cd)Thanks a lot! After setting (was automatic) the dns to 8.8.8.8 and 8.8.4.4 i get the site working. But should people change their dns to see the page and must this not be mentioned somewhere?**

**hiiamboris**

**[18:22](#msg5e95ff566823cb38acd07d82)So far you're probably the only one who has troubles. Could be your provider's fault.**

**Rebol2Red**

**[18:27](#msg5e96007e5d148a0460084554)I know I am unique :P Hell no, but there are a lot of people using my provider in the netherlands. Should i contact my provider about it or ...?**

**hiiamboris**

**[18:39](#msg5e960366e24b4d6c440aa6b3)If it's not a one-time glitch then worth a shot I guess.**

**Rebol2Red**

**[19:00](#msg5e96085638198d56a1a21695)Provider's answer is to change it yourself. Maybe they can do it but it is too difficult or they are unwilling to change this. It does not depends on their helpdesk very friendly and helping but their hands are tied.**

**@hiiamboris**  
**It was a one time glitch but now after changing the DNS i won't get this any more on any site i suppose.**

**[19:07](#msg5e960a04e24b4d6c440abe8e)@dander Have i contacted the wrong people (my provider) instead of gitbook?**  
**Correct me if i'm wrong: gitbook doesn't have the ip in their DNS-server but Google does?**

**dander**

**[19:33](#msg5e960fece7ca460b065ed9f4)Given that it seems to be working fine for others, it seems like it's a problem with your provider DNS. Maybe it's just a transient issue though, like if the IP changed, and it hasn't propagated to there yet. I'm no network engineer though. That's just my impression**

**endo64**

**[19:57](#msg5e961593f450c25cc8dec2ff)Works for me too, from Turkey. Can you test from your mobile thru 4/5G? @Rebol2Red**

****Wednesday 15th April, 2020****

**Rebol2Red**

**[08:37](#msg5e96c7cbd240da2433707be4)I have tested the page on a phone with 4G. It works fine but on my pc i have to change the DNS to 8.8.8.8 8.8.4.4**

**Oldes**

**[20:15](#msg5e976b74c38aa05a1a74ba66)Is there any rationale for this?**  
**`>> round/to 12:34:56 30% == 12:34:56.1`**

**greggirwin**

**[20:25](#msg5e976db9a9ca1862063a6ea4)56.1 is evenly divisible by .3.**

**Oldes**

**[21:08](#msg5e9777b2c38aa05a1a74efb3)That is nice, but how useful it may be?**

**greggirwin**

**[21:14](#msg5e97792e85b01628f04ed2f7)You didn't say what you expected, or what you think would be more useful, so...**

**[21:15](#msg5e97795574bfed5a1b39e284)I just gave the rationale you asked for. :^)**

**Oldes**

**[21:45](#msg5e9780764711086205327c0a)I was just reading unit tests. So wondered why it is even supported. I would expect an error.**

**greggirwin**

**[22:04](#msg5e9784f2a412254f21889c8f)Why do you expect an error? If I keep asking questions, to narrow it down, it's because I don't know why you think what you think, \*specifically\*.**

**[22:05](#msg5e97852de920022432a822d5)Sometimes we can just say "this looks wrong", and it's clear, but more often it helps to be as specific as possible.**

**Oldes**

**[22:19](#msg5e97886385b01628f04f0ec2)I expected an error becase something like that was not supported in Rebol and I have problem to understand.. how it should work and mainly for which purpose. That's all. It definitely isn't clear to me.**

**[22:19](#msg5e97888de920022432a82f74)Not that it is an issue.. I was just surprised.**

**greggirwin**

**[22:30](#msg5e978aeac7dcfc14e2be9eb1)Percents are just a helpful notational convenience for a decimal value scaled by 100. They work like that for consistency, but we (me too) sometimes want to give them more semantic weight. e.g. `100 + 5%` seems like it could easily return 105, rather than 100.05. In this case, time already disallows money as a scale, but treats percents just as floats. We could disallow that as well. Or we could make a note somewhere, that when you round a time using a percent, you need to think of it as a percentage of a second.**

**hiiamboris**

**[22:46](#msg5e978eb874bfed5a1b3a3367)`100 + 5% = 105` that would be bad because `5% + 100` would have to return `5% + 10000% = 10500%` (because `(a + b) = (b + a)` in all the world), same for `5% + 100.0` as we clearly want integer/float interchangeable. While \*simple* rules tell us that `5% + 10000% = 10005%`. Same as we might expect `10% + 10%` to return `10% + (10% * 10%) = 11%` rather than `20%`. So that would need another exception.**  
**And exceptions are a way to hell (or complexity) ;)**

**[22:50](#msg5e978fbc8e987f3a5e1aa322)I already have troubles generalizing this pattern to all additions of only 3 types :/**

**greggirwin**

**[23:07](#msg5e9793b7a412254f2188d517)@hiiamboris yes, this topic came up not long ago. I don't know if anybody wrote down conclusions.**

****Thursday 16th April, 2020****

**Oldes**

**[09:13](#msg5e9821aa74bfed5a1b3c36aa)Ok... so the logic behind is:**  
**`>> to-time round/to (to-float 12:34:56) (to-float 30%) == 12:34:56.1`**

**[09:42](#msg5e98286a0480c128efbf3e6b)When I'm in the `round` function... in Rebol3 the behaviour was set, that result has type of the `to` value, while in Red it is unchanged. `round/to 1.234 10%` is `120%` in R3 but `1.2` in Red. Is it good or not?**

**hiiamboris**

**[11:45](#msg5e98453fe920022432aa9d1d)Red makes more sense here. Like, you don't expect `round/to time! percent!` to return percent, do you?**

**Oldes**

**[11:55](#msg5e98479ea412254f218b1e1d)I think that Rebol wanted to be consistent with this:**  
**`>> round/to 1.2 1 == 1 >> round/to 1.2 1.0 == 1.0 >> round/to 1.2 $1 == $1.00`**

**hiiamboris**

**[12:04](#msg5e9849da5706b414e1ce874a)Good argument**

**greggirwin**

**[17:32](#msg5e9896c8a412254f218c4473)It's a good question @Oldes. Should it always be based on arg order, or should it be based on not losing information. In some cases it could go either way, and we either have to make an arbitrary call or use arg order in those cases. Same as with other math ops.**  
**`>> 1.234 + 10% == 1.334 >> 10% + 1.234 == 133.4% >> $10 + 1.234 == $11.23 >> 1.234 + $10 == $11.23`**  
**Results are not always going to be intuitive, but if they are something we can reason about, and explain, that may be the best we can do. Otherwise we \*force* people to cast values around, which may not lead to more clarity.**  
**`>> round/to 123.4% 10 == 1 >> round/to 123.4 10 == 120 >> round/to 123.4% 10.0 == 1.2`**

****Friday 17th April, 2020****

**Oldes**

**[11:39](#msg5e999575a1284c4f209808be)@greggirwin maybe we should move to bugs channel**

**[13:21](#msg5e99ad7785b01628f0572fa1)@dockimbel To change a topic now.. I was thinking about the money type a little bit and wanted to ask, if the list of the currencies must be fixed? If I'm not wrong, there can be 255 codes. What if the block off currency types would be dynamic as user loads the money values?**

**I don't think that there will be many users who would need all types and if the currency codes would be dynamic, one could use own codes (up to the max currency type limit).**

**[13:22](#msg5e99ad92e920022432b05b1f)At least this is something what was mentioned by Ladislav in \[these comments](http://www.rebol.net/cgi-bin/r3blog.r?view=0201#comments)**

**[13:27](#msg5e99aec074bfed5a1b4275b9)Maybe it could be also possible not to have strict 3 chars per type and use the money type not just for money, but for other units too...**  
**Like: `m$1 cm$100 kg$300`**

**[13:28](#msg5e99af1185b01628f05737a4)And there could be user defined option with some type of formatting rules, so one could have: `form kg$100 == "100 kg"`**

**[13:30](#msg5e99af9247110862053ab9ad)And if there would be options for formating, there could be also user defined conversion rules.**

**hiiamboris**

**[13:43](#msg5e99b28da1284c4f20988f86)That would not need precise underlying implementation though. Also, units can benefit greatly from automatic conversion (`km -> m` and such), collection (e.g. `m$10 / sec$60 / sec$1` should contain all units (m/sec/sec)) and mutual destruction (`km$1 / m$10 =` just `100` without unit). Otherwise it's a joke type IMO.**

**Oldes**

**[13:47](#msg5e99b36463e7b73a5fe28b00)I don't think that there must be math involved now... just as a possible way to go... the question was if it is really needed to have just fixed list of ids or if enable user defined ids, like `LID$1` requested by Sunanda in year 2009. It looks that @henrikmk had same view in these days.**

**[13:50](#msg5e99b421d240da24337c0429)Btw.. is it possible to get list of all supported currency codes now? I think it should be accessible from `system/catalog`**

**hiiamboris**

**[14:02](#msg5e99b6e763e7b73a5fe29928)it's in the `system/locale` now**

**greggirwin**

**[19:10](#msg5e99ff155706b414e1d59ea3)Using `$` for a general quantity values conflates a very specific symbol, with clear meaning, and arbitrary values. That's a bad idea IMO. `Quantity!` has its own design and discussion, as there is a lot of potential value there.**

**[19:11](#msg5e99ff4a74bfed5a1b43c6cd)For money, there is a fixed base list, which all Red users can count on, but custom entries can be added, for use in your own scripts.**

**Oldes**

**[22:44](#msg5e9a313ea1284c4f209a96c3)Where is quantity! design?**

**greggirwin**

**[22:45](#msg5e9a316e8e987f3a5e24d1cc)Not public at this time.**

****Sunday 19th April, 2020****

**GiuseppeChillemi**

**[20:06](#msg5e9caf608e987f3a5e2c82b1)\*\*I wish to let you all now that\** WWW.REBOL.ORG \*\*domain is GONE\*\*, it has probably expired. To \*\*everyone\** \*which has direct voice contact with Carl\*, \*\*please make a phone call ASAP\*\*. Rebol.org is our history and Encyclopedia; it's our roots where all the code created in those 23 years of Rebol is kept like a treasure (together with past Rebol Altme words, mailing list and articles). @Respectech and anyone at the upper levels ( @greggirwin , @dockimbel, @dsunanda ) please, take this situation in your hands. Thanks!**

**PierreChTux\_twitter**

**[20:10](#msg5e9cb0524711086205448b7c)This is most annoying.**

**«rebol.org expired on 04/17/2017» =&gt; ??? This is 1098 days ago!**  
**Strange: I'm quite sure that I visited rebol.org later than that date...**

**GiuseppeChillemi**

**[20:12](#msg5e9cb0c285b01628f0610527)Please note: this has happened in the past and then all other domains have gone offline in sequence in just a few days. I am sure the same sequence will happen again.**  
**@PierreChTux\_twitter Network solutions probably uses the time of update as time of creation. It's a bug from their side or something else I do not know.**

**[20:30](#msg5e9cb4eb63e7b73a5fec474f)I confirm it's the expiration date of 3 years ago. I remember I have pushed the alarm button as I am doing today and then it spread to places like \[Rebol Forum](https://www.rebolforum.com/index.cgi?f=printtopic&amp;topicnumber=594&amp;archiveflag=archive) (Please note the date in the first message)**

**greggirwin**

**[20:31](#msg5e9cb506c38aa05a1a86fa9d)I thought someone had archived the content, for safe-keeping.**

**GiuseppeChillemi**

**[20:34](#msg5e9cb5d98e987f3a5e2ca071)I have mirrors since the days I have reported \*that* problem to you.**

**[20:34](#msg5e9cb5e18e987f3a5e2ca07f)\[!\[image.png](https://files.gitter.im/red/red/bArB/thumb/image.png)](https://files.gitter.im/red/red/bArB/image.png)**

**PierreChTux\_twitter**

**[20:35](#msg5e9cb61463e7b73a5fec4d39)In the name of the whole community, G R A Z I E M I L L E , G I U S E P P E ! !**

**GiuseppeChillemi**

**[20:35](#msg5e9cb61c2ff88975b432bfb4)But I would like to not loose the domains and the usable form of their content.**

**dsunanda**

**[20:39](#msg5e9cb6ee63e7b73a5fec5156) Nothing lasts forever :) I've ha d no involement since the Montreal Team put themselves forward as the necesssary successors in 2013.**  
**(I think) I still have a backup of the scripts from a couple of years ago, and the Mailing List archive in Rebol-readable data structures. And probably the Altme archives.**  
**Someone a couple of years back took on to mirror the script library part - maybe that has already happened.**  
**It was a great project for the 10 years or so that I was involved - thanks mainly to Gregg and Peter W for lots of support at that time.**

**GiuseppeChillemi**

**[20:44](#msg5e9cb83ca1284c4f20a2803c)@dsunanda It is a great work. I do not want to see it die. It is still \*\*essential\** and I use it very often. Hope Carl will resurrect it.**

**dsunanda**

**[20:46](#msg5e9cb89da412254f219b269c)Thanks - me too.**  
**Looks like there is a re-publication of the script library from a couple of years ago here:**  
**http://www.cobolrebol.com/pages/RebolOrgscripts/**

**PierreChTux\_twitter**

**[20:46](#msg5e9cb8a885b01628f06129c9)Yes, we all hope. Resurrections don't happen very often, in history; it should be very important if you (I'm talking to Carl now, if you can listen/read) could manage to hand over a few things, if you cannot or do not want to keep on managing them.**

**[20:47](#msg5e9cb8ec85b01628f0612b54)@dsunanda Interesting. Something to be quickly downloaded, just in case...**

**GiuseppeChillemi**

**[20:51](#msg5e9cb9b4471108620544bbd0)@PierreChTux\_twitter I don't think I have a good working mirror as I have taken it in emergency from a side door when I have spotted a problem a couple of months ago.**

**dsunanda**

**[20:52](#msg5e9cba0c471108620544bd23)I have the script library in a 4MB zip file from April 2017 if anyone wants it....Same vintage as the cobolrebol mirror, I think.**  
**That does not include the packages (multi-script contributions) but ther weren't ever many of those.**

**hiiamboris**

**[20:52](#msg5e9cba1aa9ca1862064d035a)https://web.archive.org/web/20190915162606/http://www.rebol.org/index.r**

**GiuseppeChillemi**

**[20:53](#msg5e9cba2e63e7b73a5fec5f78)I can see rebol.org still running from there with no access to external world. I'll try to grab it again.**

**dsunanda**

**[20:59](#msg5e9cbbb074bfed5a1b4c7cf1)Also I do have the mailing list archive (all structured in Rebol objects) and various old Altme worlds (ditto). So, if anyone wants to rebuild, the main data does all exist (though not scripts from the last three years - unless they can be grabbed from archive.org**

**GiuseppeChillemi**

**[21:00](#msg5e9cbbfbd65bcf75b5d54755)@dsunanda It seems they can be grabbed.**

**[21:03](#msg5e9cbca674bfed5a1b4c8160)But I don't understand why the top ones on the right do not work:**

**[21:03](#msg5e9cbcaba412254f219b38cc)\[!\[image.png](https://files.gitter.im/red/red/TcDR/thumb/image.png)](https://files.gitter.im/red/red/TcDR/image.png)**

**dsunanda**

**[21:05](#msg5e9cbd12a1284c4f20a2921b)Archive.org It has the desktop version as at 24-Aug-2019, so fairly recent - click the Download: desktop link in the left-hand-side menu**

**GiuseppeChillemi**

**[21:14](#msg5e9cbf282ff88975b432e258)I have it.**

**[21:14](#msg5e9cbf3285b01628f0614917)Thanks God!**

**PierreChTux\_twitter**

**[21:14](#msg5e9cbf4dd65bcf75b5d5546d)\[off-topic wandering thought]**  
**After all, websites without all those javascripty bells and whistles are sometimes quite useful and friendly for archiving...**  
**\[back on-topic]**

****Monday 20th April, 2020****

**meijeru**

**[07:54](#msg5e9d551bd240da2433881b04)I observe actviity on a new `ref!` datatype. I find it regrettable that the (virtually complete) work on `fast-lexer` and `money!` datatype is not merged first. Several of us have expressed their desire to see all that good stuff available in `master` and I join them . Please!**

**dockimbel**

**[10:12](#msg5e9d759874bfed5a1b4f2fe3)@meijeru**  
**1. Merging of `fast-lexer` does not depend on the work on `ref!` type.**  
**2. The work on `ref!` is carried out by Vladimir and is done in parallel to my own work on `fast-lexer`.**  
**3. Once we complete testing and documentation for the lexer, it will be merged into `master`. In the meantime, you can pull that branch and help us by testing all your existing scripts for issues or regressions.**

**meijeru**

**[10:44](#msg5e9d7d1485b01628f064167a)We must have confidence, then, in the team's ability to eventually merge several independently developed branches together. Hopefully, there there will not be too many conflicts...**

**pekr**

**[10:58](#msg5e9d80572ff88975b435b96a)As we are not talking any new official release here, is the merge into the mainline such a big problem, if e.g. fast-lexer is in its final stages of development? Couldn't it be eventually fixed along the way. Well, maybe the problem is, that what actually might look like a final stage for an average reducer, might not be considered being so, for its author 😀**

**dockimbel**

**[11:05](#msg5e9d81e4c38aa05a1a8a06da)@meijeru It might surprise you but we happen to talk to each other about our work on different branches and some of us even share the same office. ;-)**

**[11:10](#msg5e9d832974bfed5a1b4f744c)@pekr See point 3. in my reply above. We can merge in master any incomplete work at once, but I fail to see how that is helpful.**

**Respectech**

**[15:22](#msg5e9dbe2a8e987f3a5e310328)I've sent a text message to Carl about Rebol.org.**

**[15:23](#msg5e9dbe8ee920022432bea33d)Carl broke his leg a few weeks ago skiing. I talked to Cindy last week and she said he is healing well.**

**greggirwin**

**[15:26](#msg5e9dbf1ee920022432bea696)Oy! Send him our best.**

**Respectech**

**[17:41](#msg5e9dded385b01628f065dd75)Carl responded and said he got rebol.org renewed. It's back online for me, and if it isn't online for you yet, your DNS just needs to propagate which should happen soon.**

**greggirwin**

**[17:49](#msg5e9de0c0471108620549713c)Thanks @Respectech.**

**[19:00](#msg5e9df15b8e987f3a5e31dc76)Finally moving here from red/bugs, should the `percent!` design chat continue.**

**In the same vein as a limited 0-100% range, `time!` can have multiple interpretations. The way it works now, it is general, not saying whether it's a time of day, a relative amount of time or offset, or a duration/period. In different contexts, only positive values might be allowed, and for a time of day they are absolute and limited to a 24 hour period.**

**Red's design must balance flexibility in each datatype, with what limits they impose. Too specific and we'll need thousands of types. Too general and each type adds less value. As some design chat has mentioned, dependent (constrained) types can be built on top of standard datatypes, providing rules that narrow their behavior.**

**GiuseppeChillemi**

**[21:39](#msg5e9e169ae920022432c01a64)@dockimbel So Red has an office and people sharing its space? Could I ask which of the team members works together in it?**

**meijeru**

**[21:56](#msg5e9e1a982ff88975b438782b)@dockimbel I am not surprised, and even reassured, if only by the fact that the `ref!` work is done in the `fast-lexer` branch. Please accept that I was only worried about the potential difficulties of coordinating such diverse improvements as a completely new lexer and two new datatypes, each with their own literals. There is one thing though: because of the set-up of fast lexer it is impossible, at least for me, to glean from the code what the allowable characters in a `ref!` value are. And since the documentation is not made at the same time, the code is all we have.**

****Tuesday 21st April, 2020****

**greggirwin**

**[02:53](#msg5e9e601c85b01628f067e6b3)@meijeru details will be forthcoming once they are firm. There is ongoing design discussion at this point, though the lexical form is largely nailed down. Just details now.**

**[02:56](#msg5e9e60e963e7b73a5ff318fb)@GiuseppeChillemi people can move around, except for the pandemic, but there are normally 3 people there full time. Of course, it's also normally quick to move around the EU, so many others will be able to gather when we do our next RedCon. :^) A couple of us are farther away.**

**dockimbel**

**[09:06](#msg5e9eb79ba412254f21a302d5)@meijeru You can find the detailed description of each datatype syntax in this \[text file](https://github.com/red/red/blob/fast-lexer/docs/lexer/lexer-states.txt) that describes the lexer's state machine. Though, the delimiter lists are not entirely accurate anymore. Updating that description is on my todo-list before merging. It can already give you some good info about the syntax. For a fully accurate list you can look into the \[Excel table](https://github.com/red/red/blob/fast-lexer/docs/lexer/lexer-FSM.xlsx) version, that is used to generate the transition table in code.**

**[09:09](#msg5e9eb859d65bcf75b5dd3dbd)I am thinking about publishing a blog post to describe how the new lexer works once it is merged in master. This will make the 0.6.5 release post much more digestible, because there's a big amount of other features and changes to present aside from the new lexer itself.**

**pekr**

**[09:12](#msg5e9eb8eed240da24338e1909)That woudl be nice. Or - what was supposed to be 0.6.5 could become 0.6.6., etc. .... just an idea .... not sure, if Trello featureset is still actual, or not, for 0.6.5. and onwards ....**

**meijeru**

**[09:26](#msg5e9ebc4fa1284c4f20aaa262)@dockimbel Thanks for the helpful pointers. The way I read the state machine description, after the `@` can follow anything but `# ' : > = , @ $ |` and it is terminated by `[ ] ( ) { } " ; <`.**

**dockimbel**

**[09:29](#msg5e9ebd0a63e7b73a5ff46002)@meijeru Basically yes, though I have just reused `delimit10` list but allowed `:` (it needs a new `delimit`list in the description). See the `S_REF` row in the Excel table, it will give you the most accurate list.**

**meijeru**

**[09:36](#msg5e9ebea3a412254f21a323cd)In the latest Excel I still see C\_COLON leading to T\_ERROR !**

**GiuseppeChillemi**

**[09:57](#msg5e9ec3972ff88975b43aec64)This topic (lexer) it's like quantum computing: I don't undestand anything I see but would like to know!**

**dockimbel**

**[16:06](#msg5e9f1a16a367111c364beb36)@meijeru Indeed, that change slipped away in last commits. Fixed now.**

**meijeru**

**[19:50](#msg5e9f4e7171a34b0149fe1084):+1:**

****Thursday 23th April, 2020****

**PierreChTux\_twitter**

**[10:09](#msg5ea169509a04a259f229053a)&gt; This topic (lexer) it's like quantum computing: I don't undestand anything I see but would like to know!**

**I must confess that I don't even understand the basic concept of "fast-lexer". I've read it over and over, I tried to get the idea; I've (stupidly) googled those terms in order to try to understand the concept: I miserably failed.**  
**I must also confess that I'm quite happy to read that I'm not the only one not understanding the thing...**

**pekr**

**[10:21](#msg5ea16c101eb8bd3978ed24ae)You don't need to understand it, all you need is to use it :-) It "just" faster loads your Red code and once merget, you will not even know it exists ....**

**PierreChTux\_twitter**

**[10:24](#msg5ea16ced11ffed12682c3f1d)Thanks @pekr for that explanation. It now is even more mysterious to me... I've tried to "use" it, and I -again- miserably failed: nothing comes at completion on the Red prompt, when I stupidly type "fas&lt;TAB&gt;".**  
**No worries: if it is just for speed, I just don't care, at this point of my Red life.**

**pekr**

**[10:29](#msg5ea16e23a634f42f7af98441)I am not sure how is tab completion related to lexer ... might be, dunno. Are you able to load/run the Red file? If so, fast-lexer works (at least for that particular one file).**

**PierreChTux\_twitter**

**[15:04](#msg5ea1ae7c2bf9ef12699c4178)I've just tried to "use" the fast-lexer, I merely thought that it would be a word: obviously not. So it must just be a feature, I guess.**

**[15:11](#msg5ea1b02e1eb8bd3978ee02db)&gt; Are you able to load/run the Red file?**  
**Which Red file are you referring to?**

**Is it this red.r file?**  
**`# pierre@latitude: ~/dev/Red < 2020_04_23__17:07:49 > [bashpid_23162] head red.r REBOL [ Title: "Red command-line front-end" Author: "Nenad Rakocevic, Andreas Bolka" File: %red.r Tabs: 4 Rights: "Copyright (C) 2011-2018 Red Foundation, Andreas Bolka. All rights reserved." License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt" Usage: { do/args %red.r "path/source.red" } # pierre@latitude: ~/dev/Red < 2020_04_23__17:10:18 > [bashpid_23162]`**

**I'm able to load it, yes, it ends up in whichever word I wanted to be in:**

**`>> a: load %/home/pierre/dev/Red/red.r == [REBOL [ Title: "Red command-line front-end" Author: "Nen...`**

**9214**

**[15:12](#msg5ea1b05a568e5258e47c8851)@PierreChTux\_twitter please move to `/help` room.**

**PierreChTux\_twitter**

**[15:14](#msg5ea1b0d09a04a259f229f11f)@9214 Why? I'm not asking for help. I was just replying to @GiuseppeChillemi 's statement.**  
**I will shut up, rather.**

**9214**

**[15:18](#msg5ea1b1c82bf9ef12699c505b)You are asking questions that can be better addressed in a place dedicated to answering them, with an additional benefit for other newcomers. It's as simple as that, no need to be offended.**

**PierreChTux\_twitter**

**[15:39](#msg5ea1b69a568e5258e47c9e83)So I won't ask any more questions here. Got it, thanks.**

**greggirwin**

**[17:21](#msg5ea1ceac11ffed12682d8fef)General questions here are fine @PierreChTux\_twitter. In this case, it's not really about help in using Red, so I'm OK answering here.**

**The fast lexer is entirely internal, and you will never see it. Just as if you tried to get help on `compiler` or `symbol-table`. It underlies `load/transcode`, and simply means that when you `load` Red data it will happen a lot faster, and with more features available (which \*some* people may use).**

**PierreChTux\_twitter**

**[19:39](#msg5ea1eed961a0002f79450b28)@greggirwin Okay, understood. Thanks!**

****Friday 24th April, 2020****

**meijeru**

**[11:02](#msg5ea2c74df6a6e539797318a7)This is a contribution to the general discussion about priorities/future directions of Red development:**  
**I have started to design and partially implement a serious application, viz. an email client. Some \_features_ I encountered the need for are:**

*** a \_TCP_ implementation with \_TLS_ (or better still, `request-smtp`, `request-pop3` and `request-imap`)**  
*** a \_tree view_ face (but I managed to simulate one using `rich-text`)**  
*** ideally, an \_HTML_ face (there must be native ones in the various OSs)**  
*** for ease of decoding: `as` defined between `string!` and `binary!` values (is in the pipeline)**  
*** ability to `sort/skip/compare` on more than one "column" (already signalled in #3868)**

**I know some of this is in the Trello board, but I would appreciate reactions on the rest (and even on those in Trello).**

**pekr**

**[11:18](#msg5ea2cb19f6a6e53979732277)I would not count on the trello board. E.g. 0.6.5 has a loading of dynamic libraries, IIRC it was even supposed to come earlies, and with recent situation, the question is, if it will come with 0.6.5 at all. Saying that, I would really regroup, as Red Team sees fit. Trello was imo not updated for quite some time, not sure stuff like fast-lexer is even mentioned there.**

**[11:21](#msg5ea2cb9c94ac2758e3059bd4)From the publicly known branches, we know, that there are some branches for IO, I have even found some experiment with gob! based faces, which would be cool, if it would found its place in Red's View engine in the end. We can't mostly heaer about Red/C3 anymore nowadays, we've heard about some CLI component, Red/Pro, but noone can really say, what comes next and when.**

**[11:21](#msg5ea2cbd23ea9b172a488adcf)So - my take is, that at least some rough roadmap towards the 1.0 could be done, iven if there would be no dates, so that ppl could plan a bit ahead ...**

**dockimbel**

**[11:34](#msg5ea2cec25d245d59f3153f57)@meijeru**  
**&gt; a TCP implementation with TLS (or better still, request-smtp, request-pop3 and request-imap)**

**It's already implemented in our async-io development branch, so it will be available in 0.7.0.**

**&gt; a tree view face (but I managed to simulate one using rich-text)**

**That's the next widget planned for View, along with a proper table one.**

**&gt; ideally, an HTML face (there must be native ones in the various OSs)**

**That's in the plans, but low-priority so far and there's a big design work there for the interfacing API.**

**&gt; for ease of decoding: as defined between string! and binary! values (is in the pipeline)**

**I don't understand the request. What you ask for is already covered by `to`.**

**&gt; ability to sort/skip/compare on more than one "column" (already signalled in #3868)**

**The block-mode comparator is not yet implemented, but you can still use a function to cover such needs:**  
**`>> sort/skip/compare/all [blue 3 red 1 green 4 pink 2] 2 func [a b][a/2 < b/2] == [red 1 pink 2 blue 3 green 4]`**

**pekr**

**[11:39](#msg5ea2cff2f6a6e53979732e98)@dockimbel as for table - some native OS wrapped widget on each platform, or a cross-platformu custom widget instead?**

**dockimbel**

**[11:47](#msg5ea2d1e6568e5258e47fa8b5)The roadmap on Trello has been updated.**

**meijeru**

**[11:48](#msg5ea2d1fa61a0002f794754ab)\_for ease of decoding: as defined between string! and binary! values (is in the pipeline)**  
**I don't understand the request. What you ask for is already covered by to.\_**  
**May I refer you to pull request #4363, in waiting**

**dockimbel**

**[11:48](#msg5ea2d2121e3d5e20633f6372)@pekr Native first.**

**[11:49](#msg5ea2d25c11ffed1268303836)@meijeru That PR is going to be rejected, the role of `as`is to coerce type, not convert data (that's the purpose of `to`).**

**meijeru**

**[11:54](#msg5ea2d36961a0002f79475761)But the PR does precisely that: Coercing type, NOT converting data. One use case is to interpret ISO-8859-1 data as Red string. This is regularly needed in an email client application. Of course I have written my own `as-string` and `as-binary` for the moment. I could even do that as routines. But the rationale remains strong in my view.**

**[11:54](#msg5ea2d38511ffed1268303b49)BTW :+1: for updating Trello**

**dockimbel**

**[11:56](#msg5ea2d3d511ffed1268303bda)See my comment about that \[there](https://github.com/red/red/issues/4131#issuecomment-618965502).**

**meijeru**

**[11:56](#msg5ea2d3e8f6a6e539797336eb)Yes, seen and waiting expectantly!**

**dockimbel**

**[11:59](#msg5ea2d496568e5258e47fade2)The conversion tables from Gab's power-mezz could be used to cover the most used locales.**

**GiuseppeChillemi**

**[11:59](#msg5ea2d4ae9a04a259f22d0a5b)@dockimbel**  
**&gt;&gt; That's the next widget planned for View, along with a proper table one.**

**A good table Style and spec is Henrik Vid Extension Kit one. It supports conditional colorization of cell, different input and output data, custom sorting, high speed custom filtering, sub lists, images and widget in list. Cell editing was planned but that part never completed. Boleslav has made a similar one for R3.I have started a bounty and half paid it but never completed due to personal company company problems that required me and took me me some willingness to complete the specs. If a table style will be created from the foundation, please take in high consideration specs of Vid Extension Kit and R3 one as it is the most complete and "business ready" style out there.**

**meijeru**

**[12:07](#msg5ea2d67ea634f42f7afd891a)The table style in RebGUI by @Dobeash is also to be considered. I have written quite a few DB+GUI applications with it.**

**[12:19](#msg5ea2d966f6a6e5397973471e)I am always an avid reader of the \[progress site](https://progress.red-lang.org/). Suddenly appears the `GOB` branch in @qtxie 's work. What is the idea there?**

**dockimbel**

**[12:24](#msg5ea2da9794ac2758e305bf18)@meijeru Experimental hardware-accelerated base face! renderer without using OS windows/widget objects.**

**GiuseppeChillemi**

**[12:32](#msg5ea2dc6bafa1f51d4e1980b5)@dockimbel Note: once completed, the remaining part of the Bounty will be give to the foundation or anyone who does this work.**

**GaryMiller**

**[13:57](#msg5ea2f04d3ea9b172a4892637)How does Bounty work. I don't remember seeing anything about Bounty assigned to tasks. Is that a program to get attention assigned to bugs you care about by donating cash to get them completed sooner rather than later?**

**9214**

**[14:08](#msg5ea2f2c2e5ed621d4dda1a2d)Red Foundation does not setup any bounties yet.**

**planetsizecpu**

**[14:10](#msg5ea2f36d61a0002f7947badb)@dockimbel 🎈🎆✨🎉**

**GiuseppeChillemi**

**[14:26](#msg5ea2f7085d245d59f315c9e6)@GaryMiller I have set the bounty for this task more than one year ago. If Red foundation creates the List View/Table style, they will receive it.**

**pekr**

**[14:47](#msg5ea2fc0861a0002f7947daf1)YES to gobs! :-)**

**[14:51](#msg5ea2fce061a0002f7947dd83)I have paid to Cyphre for the nice grid style for RebGUI. My requiremenets were - scrolling of infinite data, working on the "data window" purpose. Next - no need to reshuffle the data returned from query, hence - virtual columns. Row or column hilite. Column resizing and rearrangement. Whatever data in the cell (just a face). Unfortunately, exactly at the time of the delivery Ashley has changed the RebGUI in a mayor style, so it did not work. I would be able to find the code for others to eventually study. With draw and/or gobs, we should be able to create a cross-platform grid style ....**

**[14:55](#msg5ea2fdf9e5ed621d4dda404a)@dockimbel Thanks a lot for the Trello update. I would probably delete the first column, which has 0.6.5 / 0.7.0 list, which is incompatible with 0.6.5 features of the second column?**

**9214**

**[15:03](#msg5ea2ffd4f6a6e5397973ca1e)You are basically saying that we should delete an overview of the `0.6.5 - 0.7.0` segment because it doesn't fit in the `0.6.5` milestone alone.**

**pekr**

**[15:05](#msg5ea300271e3d5e2063400d10)You are basically saying you did not bother to read the differences.**

**[15:09](#msg5ea3010f501f8f72a5008a9a)I would like to start short, once in a 1-3 weeks FB posts. So what should I eventually use - will 0.6.5. contain loading of DLL, or not? :-) As in the milestone To-do list, it's not there ....**

**GiuseppeChillemi**

**[16:09](#msg5ea30f37a634f42f7afe621b)@pekr If you find the code and the specs of the Grid Style I would like to receive them.**

**luce80**

**[17:30](#msg5ea3224161a0002f79485edc)@pekr Putting grid style on rebol.org for all to study would be nice. We could possibly translate it to Red.**

**pekr**

**[17:40](#msg5ea324895d245d59f3166a7c)I will have to dig out some old hardisks and will do so. But - it was not complete, just a prototype. It would require some old version of RebGUI in order to run. OTOH I remember @rebolek was working on some Red grid too?**

**GiuseppeChillemi**

**[18:02](#msg5ea329c0f6a6e53979745a49)@pekr that's the one I was writing about when I have written that I had to complete the specs. The work was half done because rebolek was waiting for my "phase2" specs.**

**9214**

**[18:44](#msg5ea33388501f8f72a5013077)&gt; You are basically saying you did not bother to read the differences.**

**I bothered enough to contribute features that made these differences, and am well aware of them, being one of the core developers. I am also not surprised to see you having zero respect for that.**

**&gt; will 0.6.5. contain loading of DLL**

**Libary loading won't happen until `struct!` datatype is implemented, and the planned `0.6.5` feature set is listed on Trello; the left column contains implementation checklists for parts that will make it into one of the milestones in the central column, like e.g. `struct!` and `library!` that form the basis of FFI — into which milestone specifically we can't say, because that requires a long-term commitment and our plates are already full, not to mention the situation with the pandemic. Hence the `0.6.5 / 0.7.0` title. Feel free to propose improvements to this layout.**

**greggirwin**

**[19:25](#msg5ea33d1b1eb8bd3978f28578)&gt; I am also not surprised to see you having zero respect for that.**

**@9214, I don't believe that's the case, but will take this offline with you.**

**[19:41](#msg5ea341003c03d3206266a91e)@pekr, the best place to pull topics for PR posts may be chat or the progress site. We're not back in the swing of regular blog posts, unfortunately. You can also post a short note here about what you plan to include in your next FB post, so we can give a 👍 or offer suggestions.**

**GiuseppeChillemi**

**[19:53](#msg5ea343a81eb8bd3978f2972b)I have read all the changes and progresses. While on the outside you have appeared as silent, you have made really an huge work. Congratulations and thanks to the whole team.**

**[19:57](#msg5ea344ab1eb8bd3978f299f1)\[!\[image.png](https://files.gitter.im/red/red/fgNo/thumb/image.png)](https://files.gitter.im/red/red/fgNo/image.png)**

**[19:58](#msg5ea344f9f6a6e5397974a881)Just these ones should have taken months of development and testing, and this together with Money! datatype, Fast Lexer, Diagrammar and all the other developments**

**[19:58](#msg5ea344fae5ed621d4ddb1b66)Thanks again.**

**meijeru**

**[21:26](#msg5ea3598294ac2758e3074bd9)I agree, and my only regret is that we did not see this earlier, because it would have taken away quite a lot of uneasiness...**

**GiuseppeChillemi**

**[21:40](#msg5ea35cebafa1f51d4e1b1349)@meijeru Yes Rudolf but after today I see the light at the end of the tunnel. It's far but I can see it. :sunny:**

****Saturday 25th April, 2020****

**PierreChTux\_twitter**

**[00:26](#msg5ea383a4e5ed621d4ddbb8bf)@GiuseppeChillemi tcp:// is working??**  
**Does this mean that PostgreSQL (and any other client/server database working through TCP ports) support is on sight?**

**pekr**

**[04:59](#msg5ea3c3b2f6a6e5397975b1b4)@9214 I think I know very well who you are, what you do for Red and in fact I have very big respect for your skills, because I need to spend my whole brain capacity to actually understand 10% of what you guys are doing. My suggestion is just not jumping so quickly onto someone not eventually posting a scientifically precise claims. As once Carl said - there is no wrong question ....**

**[04:59](#msg5ea3c3b7a634f42f7a001137)Now back on topic ...**

**[05:02](#msg5ea3c4733ea9b172a48b3f4b)My plan was to post some short FB post re the roadmap. Nothing concrete in mind, just to keep ppl interested, teased a bit. That's what I did historically for a very long time with many projects. One week ago I was trying to mediate some claims at the Rebol forum and most of the arguments were something - but Red is stalled, we can't know, what comes next, and when, it will take forever. And I simply found it bad, because that's actually a disrespect to all the work you guys are doing and I really mark it to kind of insufficient communication.**

**[05:04](#msg5ea3c4f33ea9b172a48b407d)I am even willing to sign some kind of NDA, to have more internal access to the stuff in development. I work that way in a photo business with 2 producers and from my posts in public, you would not recognise I have access to some internal information. You simply need more context to understand, to provide some rounded info to the public.**

**[05:08](#msg5ea3c5be61a0002f7949cc29)And that's what might happened with my Trello understanding. If I look into the Milestones, I can see 0.6.6 and 0.6.7 added. Reading a milestone to-do list from 0.6.5 to 0.7.0, I can's see items from the leftmost column, which was either not updated, or is simply correct (as you point out), but I miss the link. E.g. the Red/Core contains struct!, library!, xml parser, float based pairs, etc., which I can't see related to any milestone to-do list.**

**[05:09](#msg5ea3c60c61a0002f7949cca0)And my usual take is - If I am confused, and everage user is going to be probably confused too. Or I am just extreamly stupid, that's still a possibility :-) So, for now, I might make some screenshot of 0.6.5 and just generally state, that things are moving forward ... that's just all that's to my line of thinking ....**

**GiuseppeChillemi**

**[05:57](#msg5ea3d1583c03d3206267d9f5)@PierreChTux\_twitter it means that the foundations are ready and when ports will be too the db interfaces will start appearing. We are halfway there. Now everything is a lot closer than before.**

**PierreChTux\_twitter**

**[10:29](#msg5ea410f89a04a259f2303b64)@GiuseppeChillemi Yes!**

**[10:37](#msg5ea413069a04a259f2303f27)@pekr , if I can try to reassure you a bit, be sure that you're not the only one to feel extremely stupid.**  
**Also, I agree with your points: some kind of lack of publicity or visibility about Red has had bad effects on some projects, which eventually took another way, away from Red and away from Rebol, hélas.**

**Now I have the sort of feeling that this discussion should rather take place on tchit-tchat or somewhere else...**

**GiuseppeChillemi**

**[10:43](#msg5ea414531eb8bd3978f465d2)@PierreChTux\_twitter I agree, let's move there!**

**wkoszek\_twitter**

**[16:19](#msg5ea4631d3c03d32062695e24)Where can I learn more about plans for supporting Catalina?**

**cloutiy**

**[16:32](#msg5ea46612a634f42f7a01b55e)what is the chit-chat room called in gitter? Can't seem to find it using the room search?**

**hiiamboris**

**[16:37](#msg5ea4674c1e3d5e206343a338)https://gitter.im/red/chit-chat**

**cloutiy**

**[18:46](#msg5ea4857b61a0002f794baa9c)@hiiamboris thanks!**

**greggirwin**

**[20:34](#msg5ea49ec59a04a259f231bb54)@wkoszek\_twitter Catalina support is not a priority at this time. People are using containers there IIRC.**

****Sunday 26th April, 2020****

**GiuseppeChillemi**

**[14:06](#msg5ea5956211ffed126836e610)As Red is 95% compatible to Rebol2, sometime I think of a Rebol2 compatibility mode. I write here just to share this vision with you, no request involved.**

**greggirwin**

**[18:10](#msg5ea5ce96e5ed621d4de0dd3b)Brian Hawley wrote %r2-forward.r to help people move from R2 to R3. We have a wiki page noting some key differences, and someone could write mezzanines (%R2-backward.red ?) to fill those gaps. We won't have a standard compatibility mode though, as changes to Red are made intentionally, and the small effort of updating code (we can provide consulting services to help with that) should be small when compared to the alternative.**

**wkoszek\_twitter**

**[18:29](#msg5ea5d3012bf9ef1269a693be)Hm. I see. Help me understand--why one can't recompile Red on Catalina? Is it b/c of Rebol dependency?**

**hiiamboris**

**[18:32](#msg5ea5d3a55d245d59f31cabc2)See https://github.com/red/red/issues/4359#issuecomment-602205340**

**greggirwin**

**[18:33](#msg5ea5d3e53c03d320626c7e8e)Yes. Red is bootstrapped on R2, which is 32-bit only. But the bigger issue is producing full 64-bit EXEs, which requires a huge amount of work, both design and coding.**

**wkoszek\_twitter**

**[18:47](#msg5ea5d732568e5258e486e63f)Ok, got it.**

**[18:47](#msg5ea5d75194ac2758e30cf8fc)Came here mostly because I found macOS UI backend a very appealing feature.**

**greggirwin**

**[19:00](#msg5ea5da423ea9b172a48ffec2)It is, and works up to Catalina. :^\\**

**wkoszek\_twitter**

**[19:44](#msg5ea5e4ae61a0002f794e9181)Is 64-bit Rebol something that could somehow be funded?**

**[19:45](#msg5ea5e4c25d245d59f31cd531)I know some hardcore OS folks in Poland and it seems like a project for them.**

**[19:45](#msg5ea5e4d43ea9b172a4901940)But I suspect they'd prob need some $ for a project of this scale.**

**greggirwin**

**[19:58](#msg5ea5e7e8a634f42f7a050152)Moving to PM.**

**GiuseppeChillemi**

**[20:42](#msg5ea5f23f3c03d320626cc9b8)@greggirwin Come back Gregg, we want to know ! :eyes: :ear:**

**greggirwin**

**[21:08](#msg5ea5f84a1eb8bd3978f8de30)Patience is a virtue. :^)**

****Monday 27th April, 2020****

**pekr**

**[05:48](#msg5ea6721b5d245d59f31dfac9)@GiuseppeChillemi :-)**

****Tuesday 28th April, 2020****

**jceel**

**[13:31](#msg5ea8301f7975db7ebfcf31ea)Hello everyone**

**hiiamboris**

**[13:42](#msg5ea832b914b48f0698976415)@jceel Hello and welcome ;)**

**planetsizecpu**

**[15:04](#msg5ea845fa97338850a2d477c2)Hi! @jceel welcome on board**

**greggirwin**

**[18:50](#msg5ea87aeda9de3d01b1d649e0)Greetings @jceel,**

**This is our main room, from where we spin off into `/help` (as you have specific questions), `red/welcome` for more general new-to-Red stuff, `/chit-chat` for chatter, `red/system` for system level discussion, and more.**

**Happy Reducing!**

**jceel**

**[18:53](#msg5ea87b9d3d58de7a38e0ae93)Thank you @greggirwin for this introduction!**

****Wednesday 29th April, 2020****

**mbk**

**[08:19](#msg5ea9389222f9c45c2a5a7f41)Wrt Trello, roadmap, more predictability - I think we're all on the same page there's room for improvement.**

**If you do feel the need to ask questions, or have frustrations, try to phrase them in such a way that they are a positive suggestion for us to improve something.**

**That's:**  
**a) culturally better**  
**b) most likely more clear on what the improvement should be**

**[08:24](#msg5ea939a17a24ff01b0eda755)Off note, though we're on 0.6.4 for &gt; 1y, you can build products with it!**

**See: https://www.red-lang.org/2020/03/gtk-fast-lexer-money-deep-testing-and.html**

**@greggirwin has asked me to work on the business side, so I have some market research questions - survey like. That means we'll have to get you access to the first product to test it too.......**

**I'll post more later on the market segments we look at and the survey (roughly 15-20 questions). If you think you fall into a particular (1 or more segments) and want to answer the survey, DM me or email me at `maarten.koopmans at redlake-tech dot com`**

**[08:27](#msg5ea93a5a347bd616304330af)Segments we look at are doc teams, api developers, language designers, parser writers, DSL designers, workflow designers. More coming soon, but I want to get good groups, so hence the heads-up.**

**[08:28](#msg5ea93a9d31a6d25d7c994bee)In case you wonder if I abuse red / red - NO. A first moderately successful commercial RED product will validate RED! And having answers to market research questions from a representative group will increase our chances of success!**

**[08:30](#msg5ea93b1ed898fe7a37543739)Once we get this activity really started, we should maybe move it into a different group. That could act as a continuing online focus group for the product.**

**[08:31](#msg5ea93b7c5cd4fe50a3da416d)Finally - based on our product we'll come with a FREE initiative for COVID-19. When the time is there, we'll post it on social media, and I'll repeat what I ask now: help spread the message**

**hiiamboris**

**[09:54](#msg5ea94edc3d58de7a38e2a490)Now I'm wondering what Red has to do with this COVID-19 hoax :/**

**PierreChTux\_twitter**

**[10:03](#msg5ea950e43d58de7a38e2ab34)Is it a hoax? A friend of mine just spent three weeks in coma, due to that hoax, and a great-aunt just died from it.**

**Apart from that, I can (hopefully) see Red being similar to that Covid-19 as a virus spreading around the whole world...**

**meijeru**

**[10:03](#msg5ea950e65cd4fe50a3da8abd)I don't know if everyone else was aware, but I sure was not, of the fact that Redlake Technologies is the US brand name for Fullstack Technologies. On the (new?) website I read:**  
**`Fullstack Technologies is a great name. So great, in fact, that it’s used by a number of companies around the world. During our planning and development process, we worked to keep the name for all our global ventures, but in the U.S. we hit a logistical issue that forced us to consider a name change. While Fullstack Technologies will live on, the new branding (company name) in the U.S. will be Redlake Technologies.`**

**PierreChTux\_twitter**

**[10:05](#msg5ea95158a9de3d01b1d85c56)@meijeru this is it, I suppose?**  
**https://www.redlake-tech.com/**

**meijeru**

**[10:07](#msg5ea951fa22f9c45c2a5ad074)Yes, did you know already?**

**PierreChTux\_twitter**

**[10:08](#msg5ea9520b97338850a2d726ae)No, not at all, I'm just discovering this.**

**[10:09](#msg5ea9524c0b23797ec04e938d)The name reminds me of a pretty thoughtful article from Carl:**  
**http://www.rebol.com/article/0103.html**

**mbk**

**[10:21](#msg5ea955143d58de7a38e2bb37)Let me know if you're willing tto help. I'm trying (with @greggirwin) to define and implement evidence based processes to make successful RED based products, and RED itself a success.**

**dockimbel**

**[10:25](#msg5ea9562f7975db7ebfd2335f)@mbk :+1:**

**pekr**

**[11:26](#msg5ea9647e22f9c45c2a5b05e6)@mbk first and foremost - welcome ;-)**

**[11:28](#msg5ea964f5b6dd2306979444b9)Just a note to APIs. Last year, there was one Czech company acquired by Oracle, called APIary. The product servers to document/collaborate on APIs. Just an idea for inspiration ....**

**mbk**

**[12:01](#msg5ea96c9a3d58de7a38e307ca)@pekr I've never been gone, but was 1y+ out because of a busted knee. Still can't walk normally, but can work time so @greggirwin and I took advantage of the situation.**

**Do you know people at ApIary that you could convince to help. I'm looking into the possibility / budget (have to ask @dockimbel ) of rewarding participants with a $10 AMZ gift card or so. Or could you play proxy for API designers, and or/other segments?**

**Note: `Could you play proxy for API designers, and or/other segments?` is a question I ask from all.**

**[12:03](#msg5ea96d2c7a24ff01b0ee5156)What we need is a representative picture, and the first run is a test, especially during COVID-19 times. But ones we have done that, we'll tweak the processes, and subsequent quarterly or bi-yearly runs on market eligibility can "just go". Also for \*\*new products\** and \*\*RED\*\***

**[12:05](#msg5ea96d847975db7ebfd27821)Off note @pekr - with you being the public face on FB informing people, we should talk somewhere over the next two weeks how you can shepherd diverse people in for the research. Provided @dockimbel and @greggirwin are OK.**

**pekr**

**[12:12](#msg5ea96f36a9de3d01b1d8b2a6)I actually don't know anyone from the APIary myslef. Just have read the interview with its author. To be hones, I even did not know it exists as a startup, beofere they were acquired by Oracle. Maybe we could create two new channels - marketing (or the other name) and Advocacy - that could serve guys to ask exactly the questions which might be felt even as a bit controversional - why Red does not do this, or then, when it will have functionality like ..... (advocacy was on Altme too, IIRC, but I agree that having too many channels might be tricky as well)**

**dsunanda**

**[13:21](#msg5ea97f6d0b23797ec04f2173)@mbk though we're on 0.6.4 for &gt; 1y, you can build products with it!**  
**Sadly, I had to fall back to Rebol 2 for a product that was written in Red (and went live today).**  
**I remain hopeful for Red, but I was defeated by random failures when (I assume) stressing the memory management.**  
**Happy to contribute to any survey.**

**meijeru**

**[13:47](#msg5ea9858fd898fe7a375521d9)To come back to the name question, "Redlake" is also having quite a few interpretations, amongst which some are technology-related.**

**mbk**

**[14:06](#msg5ea989d922f9c45c2a5b760b)@dnusanda, I'm sorry for you - let's stay in touch. If I forget to ask for your input (given hopefully many others), please ping me**

**jceel**

**[14:21](#msg5ea98d52adb0ec5c2bd398d7)Has anyone ever tried/considered compiling Red/System code for a bare metal target like ARM MCU?**

**dockimbel**

**[14:27](#msg5ea98eb897338850a2d7da47)@jceel If you are referring to Cortex-M class, our toolchain does not have a Thumb instruction set backend, so we don't support them. We do have support for Cortex-A class though (using the standard ARM instruction set).**

**jceel**

**[14:28](#msg5ea98efe0b23797ec04f4f84)@dockimbel right, I forgot that the ARM code generator only supports ARMv5 ISA**

**dockimbel**

**[14:29](#msg5ea98f2c0b23797ec04f4fd6)Our ARM backend does support a few v6-v7 features.**

**jceel**

**[14:31](#msg5ea98fa5adb0ec5c2bd3a03a)@dockimbel anyway, this use case sounds quite appealing to me, as bare metal firmware space is occupied in 90-95% by the C language**

**[14:31](#msg5ea98fd00b23797ec04f5118)offering a much nicer language for such applications might be interesting**

**[14:33](#msg5ea99029f0377f163157a98d)there's for example Nerves Project: https://www.nerves-project.org/ that attempts to bring Erlang/Elixir to the embedded IoT space, but in my opinion their approach is stupid**

**[14:33](#msg5ea99040a9de3d01b1d91985)they're bringing the whole Linux kernel to just run a BEAM VM on it**

**dockimbel**

**[14:37](#msg5ea991420b23797ec04f54ea)@jceel Our Red/Pro offer will cover those targets. Anyway I think that taking market shares from C in that space will require much more than we can currently offer with our solution.**

**[14:39](#msg5ea9918b3d58de7a38e37620)&gt; they're bringing the whole Linux kernel to just run a BEAM VM on it**

**That certainly does not sound like a good fit, indeed.**

**GiuseppeChillemi**

**[20:35](#msg5ea9e52e14b48f06989c53a6)@mbk Red has ample room to be used in business. Personally I have 3 big project in this area (but one could have died becouse Diagram Dialect seems won't be developed as OSS and it is continuing its life in DiaGrammar as close source). To me the current path of Red is good and I want just see it complete and Android version available. We have an huge market in front of us and it is important to complete the main project before opening new ones as we (I) can create and release our software.**

****Thursday 30th April, 2020****

**toomasv**

**[04:45](#msg5eaa57f60b23797ec051da99)@GiuseppeChillemi Diagrammar (DG) has nothing to do with Diagram Dialect (DD) (if you mean my little dabbling with it). DG uses single face with huge draw facet, while DD uses separate face with relatively simple draw facet for each component of diagram. So, DD is open for development (and waiting for your contributions :)).**

**greggirwin**

**[04:49](#msg5eaa58e014b48f06989da5cd)@pekr, I'm familiar with Apiary and API tooling is on our list.**

**toomasv**

**[04:58](#msg5eaa5ae07975db7ebfd56979)@GiuseppeChillemi I'd be very interested in your opinion on another \[dialect](https://github.com/toomasv/units), which tries to anticipate some prospective developments in Red.**

**GiuseppeChillemi**

**[08:25](#msg5eaa8b8b7a24ff01b0f1c55b)@toomasv Thanks, for the information. I have misunderstood a previous talk with Gregg, my fault. Your Diagram Dialect is be the central piece of about 3 projects, most of them devoted to help new Red user and one for in factory environments. I will put these project again on route ahead**

**[08:29](#msg5eaa8c4d3d58de7a38e669db)About contributing, as you can see from my spare observation and questions I am becoming more and more skilled to Red but your creations need more skills than I actually have, you will see my contributions on diagram dialect and concrete application later in the future (I am doing my first work with GUIS ans simple parsing, so I have reached the area of the skills requisites needed to work with DD)**

**[08:29](#msg5eaa8c7a22f9c45c2a5e6efc)(About the new dialect, I will take a look at it and give you my humble opinion)**

**[11:59](#msg5eaabd84b6dd230697987e51)@mbk**  
**\[!\[image.png](https://files.gitter.im/red/red/XlBh/thumb/image.png)](https://files.gitter.im/red/red/XlBh/image.png)**

**[21:04](#msg5eab3d78b6dd2306979a1afb)@toomasv I have taken a look at your units dialect and I like it a lot. In the ERP area everything is moved expressing units of a kind. Relativeness of scales is also an important topic there as when we manage products a PIECE (or another unit) of an article converts to KG or METERS or LITERS (or anything you want) with different scales in different articles. (but I have not seen if relativeness has been implemented in UNITS dialect).**

****Friday 1st May, 2020****

**toomasv**

**[10:03](#msg5eabf3ef31a6d25d7ca10bc9)@GiuseppeChillemi Thanks for your thoughts! I'll sit on it a bit.**

**GiuseppeChillemi**

**[12:48](#msg5eac1a885cd4fe50a3e29ed3)@toomasv a nite: relative units that those unit can be called container units where**

**[12:49](#msg5eac1ad831a6d25d7ca1896e)Pardon... don't consider the previous message, it has escaped from my mobile phone while editing it.**

**[13:04](#msg5eac1e400b23797ec056b42d)@toomasv I was writing that in ERP relative units are implemented with a 3 columns table: unit name, base unit flag and conversion factor. Base name has conversion factor 1 and all the others have a conversion rate to the base one. Each article has its how table with different units, base one and conversion factor. This is the way relativeness is implemented. (units codes is the only thing shared in these tables)**

**[13:04](#msg5eac1e62b6dd2306979c36ca)\*base name = base unit**

**CodingFiend\_twitter**

**[19:25](#msg5eac77a831a6d25d7ca2b6c1)As for your prior discussion on the relative importance of IOS vs. Android, as someone who made their living from mobile apps years back, although iOS only has 20% market share of devices, in terms of paying customers for apps, the IOS universe is more than 50% of the dollar volume, and is by far the most important single software market in the world today. The Apple iTunes App Store revenues exceed 30 billion a year. It is a thriving business, with hundreds of thousands of developers making their primary living from that app store. In the history of publishing no company ever offered 70% royalties payable to the authors, with no funny business on the accounting side. In contrast book publishing and music publishing never paid more than about 7% average royalty to authors. So Steve Jobs set up a publishing empire that is far larger than anyone realizes. The Google Play App Store and the Amazon store are smaller, and not nearly as well run. The Google play store is riddled with apps that are spyware, stealth bitcoin miners, etc, and the lack of app scrutiny means that nasty things exist in that space and thus consumers don't trust it. If you are planning to do mobile, you do IOS first, because it is the best market. Android devices typically never get updated in terms of their android version, and thus get locked into a host of bugs that never get fixed. This is something that Google has never fixed. I don't want you to be misled by sheer numbers. When making software you want customers with money, and Apple has a majority of them!**

**GiuseppeChillemi**

**[20:39](#msg5eac88f9347bd616304cdd34)@CodingFiend\_twitter you are right but moving to a project to another without completing one is really dangerous as we all need a market to sell to. If we jump from a platform to another without completing one we will have no market at all for long time. So, let's end Windows, Android and Linux and then add something else.**  
**Personally I am already working to build part of my applications right know, so when the needed platform will be ready I'll have only to finalize them.**

**[20:41](#msg5eac896fd898fe7a375dd5bc)I have seen the last messages escaped from the thread, does someone know how to move them there ?**

**greggirwin**

**[20:45](#msg5eac8a7d14b48f0698a3d0a0)@GiuseppeChillemi I don't know if you can move messages from threads. Maybe the internet knows.**

**@CodingFiend\_twitter thanks for the input. If the dollar volume is 50/50, it's a coin toss. Certainly Apple users have more money, but we have a lot of work on the Android side already.**

**PeterWAWood**

**[23:36](#msg5eacb27731a6d25d7ca34255) I believe that the iOS/Android choice for Red depends on which market segment is being targetted. I see two different segments, Store developers who devlop apps speculatively to sell in the various stores, and Bespoke App developers, who develop Apps for organisations who wish to publish apps for their users (e.g. mobile banking apps, supermarket loyatly apps).**

**The overwhelming majoirty of Store Apps are games. I believe that this is especially true of the Google Play Store. Not many businesses commission developers to write games.**

**For the reasons @CodingFiend\_twitter mentioned Store developers do much better from iOS apps.**

**[23:49](#msg5eacb573f0377f1631609524)From what I see from the LiveCode community, Bespoke App developers get more Android only work than iOS only work. E.G. From companies wanting internal Apps for their staff wishing to keep the cost down by using cheaper Android devices.**

**So if Red is primarily targetting Bespoke App developers, I believe that there is a market for Android only development tools.**

**My concern with targetting only Android would be that many organisations who commission Apps want both Andriod and iOS apps. If Red could only be used to develop Android Apps, what would attract Bespoke App developers to adopt Red?**

****Saturday 2nd May, 2020****

**CodingFiend\_twitter**

**[00:09](#msg5eacba4231a6d25d7ca3568c)The 50-50 split is really a worldwide overall number. If you look at the USA, probably 80% of all money spent on apps goes through Apple devices, but in countries like Russia, and other places where they don't even have a single store, the Apple share is negligible. Apple is super strong in France, Japan, USA, and some of Scandinavia. For obvious reasons Korea is a Samsung stronghold. Anyway in the mobile app space, if you don't support both Apple and Android, many app developers such as myself will ignore Red because we simply have to do both at the same time in terms of delivering product.**

**Linux by itself has near zero market share for dollar volume, because the Linux are the biggest cheapskates on the planet; they belittle and berate anyone daring to try and earn a living on that platform. It is sad that in certain circles any non-tangible work product is considered to have zero value; it is very bad for artists, musicians, composers, and inventors to have their IP stolen consistently, and the marketplaces suppressed. This is all part of Google's unfair trade practices, where everything is free, except banner ads for which you pay dearly. It has kept tool development almost at a standstill for a decade, because outside of JetBrains i can't think of a tool company charging for their product and thriving. Jet Brains managed to sell Google itself licenses for its IDEs and is doing very well. But most of the other tool ecosystems have withered under the "free free free" onslaught. As someone brought up very Nederlands in philosophy, there is no free lunch, and i prefer to have a paid supported product that i know will survive. Anyway Red has an unusual position in the ecosystem due to Nenad's astuteness, and so you will chart your own path. But don't sell Apple short; Steve Jobs used to boast that he had the best customers in the world; loyal, and well-heeled. Apple milks their user base like a cow. Have you seen their latest creation, the cheesegrater mac, with the monitor stand that costs $1000, and the wheels that cost $400? Outrageous.**

**GiuseppeChillemi**

**[00:10](#msg5eacba6314b48f0698a43c95)@PeterWAWood I agree with your view and we can start with Bespoke Android internal apps Market and then add iOS later. One area of interest for me is building a customizable store creator for Mobile where companies "Access type" personnel could build their own goods/services store with simple rules and publish it on Android/iOS App stores. It a distant and difficult project/dream but why not sharing with you?**

**ralfwenske**

**[05:12](#msg5ead014522f9c45c2a64f94e)Making my living being a council bus driver (and enjoying it) I have the luxury of also enjoying computers without having to worry (about money). Also having learned to code (360 Macro Assembler) in 1969 and having played with computers since, I thought I might throw in my 5 centsworth of dreaming.**  
**A little project I handled recently:**  
**As a (casual) bus driver I have to be able to serve around 150 different routes. When I started I (privately) created and printed a booklet which I carried with me while working so I could find my way. Many of my collegues needed it too - so I provided the booklet to them too (for a small fee). Routes of course change over time. The booklets needed to be updated.**

**Then mobiles and tablets became popular: this booklet should be accessable from a handy: so Red or Rebol (at the time) were of course my preference.**  
**And the question how to target IOS / Android etc came up first.**  
**To cut it short I used Rebol to create an app that would generate a website in HTML / Javascript. A route change means to just run the app and upload the generated site to the server. No play store or app store involved.**  
**My code is not very elegant but it works out of the box and I haven't had maintenance issues with my users at all.**  
**And only a SINGLE GUI to worry about - as I find Red works equally well on all platforms - except for the different GUI's which seem to be the cause of tremendous efforts to make them behave identical.**  
**My app (webpage) works for the many old and new Android versions as well as IOS and nearly anything that has a web browser.**  
**An advantage shows when I just type the URL into some one's browser and save that to their home screen - it has even the most (computer) illiterate driver using it within seconds.**  
**Admittedly this is a very simple app, yet I am amazed to see what's possible in the browser eg https://www.tradingview.com/chart/.**

**Back to my 5 cents: If I can make software where I don't have to worry about OS versions, installation and maintenance and I would want anyone anywhere being a potential user, a Red backend and the browser would be my preference. (The web app then can of course also run on an isolated machine by using local server).**  
**I am aware that (Red Foundation) resources are limited - still my dream would be for Red to generate a HTML/JS frontend via VID (maybe a subset) and red fashioned simple mechanisms to allow interaction with the (Red) backend (CGI or server itself).**  
**Being able to reach huge numbers of clients by means of the web browser and given the elegance of Red must make it attractive to software developers. Monetising for them (and/or their employers) could be somehow embedded in their app (eg.restricted functionality and motivation for subscriptions).**  
**Tradingview.com for example shows daily charts to every one - subscribers get access to charts updated every second.**

**Reduced development time and thus significant cost reductions should make Red the only option for developers - and on my part I would be happy paying for it.**  
**(just my angle - remember: I'm dreaming..)**

**GiuseppeChillemi**

**[06:03](#msg5ead0d19a9de3d01b1e29b62)@ralfwenske I have seen multiple times how great it is that open a page an have your application there without installing everything. This dream:**

**&gt;&gt; still my dream would be for Red to generate a HTML/JS frontend via VID (maybe a subset) and red fashioned simple mechanisms to allow interaction with the (Red) backend (CGI or server itself).**

**Is mine too. And I would give him priority over iOS which would come just after it.**

**pekr**

**[06:08](#msg5ead0e6031a6d25d7ca3ed91)@ralfwenske do you mean clean html/css/js comboo for frontend, or a full translation of an app to something like the Webassembly?**

**ralfwenske**

**[06:15](#msg5ead1013347bd616304de64e)@pekr I would want to think mostly in Red and yes - have a html/css/js being generated that knows how to communicate with my Red backend. Having said that I don’t know enough about Webassembly to have an opinion wether that could play the same role as a frontend.**

**hiiamboris**

**[16:31](#msg5eada04797338850a2e28d2d)FYI I have collected and exported the whole set of mezzanines &amp; macros that I found helpful while writing my Red code so far. Everyone can access it here:**  
**https://gitlab.com/hiiamboris/red-mezz-warehouse**

**Some of these may help you write more high level / readable / declarative code.**  
**Some may be used to draw inspiration from.**

**They range from battle-proven one-liners to experimental killer beasts. `for-each` and `map-each` can be considered crown jewels of this collection, as quite a lot of design work was put into those. Personally once I learned to think in `map-each` categories, I started missing it all the time ;)**

**Although almost every script there should be considered for eventual inclusion into the runtime, as the needs they cover are recurring, at least in my experience.**

**toomasv**

**[16:47](#msg5eada42c347bd616304f2584)@hiiamboris Great work! Thanks!**

**GiuseppeChillemi**

**[17:49](#msg5eadb2ab31a6d25d7ca55886)@hiiamboris I have dreamed to see your private repository since the beginning. Now that your jewels are on the outside, everyone can use and appreciate them. Thank you!**

**hiiamboris**

**[19:22](#msg5eadc88722f9c45c2a66ab9b)You're all welcome ;) Don't hesitate to report any bugs or where you think these functions are limiting you, so we can make them better.**

**GiuseppeChillemi**

**[19:42](#msg5eadcd43b6dd230697a0394f)(I have always the sensation I write phrases that have also another meaning... Maybe I still have to learn more about Contexts and Bindings)**

**hiiamboris**

**[19:51](#msg5eadcf517a24ff01b0f9f106):D**

**planetsizecpu**

**[20:15](#msg5eadd4d131a6d25d7ca5a21e)Gorgeous job @hiiamboris well done I will look deep when time permits**

**greggirwin**

**[21:36](#msg5eade7e1347bd616304fc71a)@ralfwenske, thanks so much for posting. Very helpful thoughts, but I miss how your link ties to your bus driving app.**

**[21:37](#msg5eade80597338850a2e32b7f)@hiiamboris, there goes my weekend. ;^) :+1:**

**hiiamboris**

**[21:38](#msg5eade86222f9c45c2a66eea3):D :D**

**[21:39](#msg5eade87914b48f0698a6af53)¯\\\\\_(ツ)\_/¯**

**greggirwin**

**[21:39](#msg5eade89d31a6d25d7ca5c7d0)I \*really* appreciate that you included a category index. And how you've explored so many areas and new ways to approach problems. Makes me happy to see the Red pill take effect.**

**GiuseppeChillemi**

**[22:38](#msg5eadf65097338850a2e34870)I appreciate the categories too. It is the touch of the pro.**

**[22:53](#msg5eadf9cdadb0ec5c2bdf4b85)@greggirwin I can answer for him.**  
**&gt;&gt; To cut it short I used Rebol to create an app that would generate a website in HTML / Javascript.**

**He has made an application able to render a web page and, looking at that link, he was really amazed about how much beauty can be an app on the browser, also hoping that Red takes that path.**

**greggirwin**

**[23:48](#msg5eae06cfb6dd230697a0b45c)Thanks @GiuseppeChillemi. It's true, but it comes at a steep cost. A big task for us is refining our target audience for Red and its tooling. That's why we need to build specific products to seel. JS may be the solution in the browser, but who is making money selling JS tools?**

****Sunday 3th May, 2020****

**ralfwenske**

**[04:02](#msg5eae424d0b23797ec05b9b93)@greggirwin, the main point I wanted to make was that I would be able to provide something very useful with little effort. My concern beforehand - when thinking about 'app store', 'play store' etc. and maintenance - was the effort (=cost) and the obligations involved besides the finding out how to deal with all these different environments, rules, languages which I don't ( want to :) ) know much about.**

**The (web)app is more like just a single (jquery) webpage, nothing to brag about - but here you go: \[Routemaps](http://bt.ralfwenske.net).**  
**My focus was on extreme ease of use and reliability: three clicks to provide the needed map and also working in flight mode and no concern as to what (device) it runs on. And for several years it has fulfilled these expectations (lately some browsers seem to not accept the 150 jpgs into \[web storage](https://www.w3.org/TR/webstorage/) - in those cases I simply recommend to install Firefox).**

**pekr**

**[04:58](#msg5eae4f83adb0ec5c2bdfdeb6)@greggirwin "who is making money selling JS tools?" - wrong question/perspective imo. And apart to that, the answer is - Red users are eventually going to make money being able to present their interface to the browser target. Now let's "just" find the way, of how to monetize on that for the Red company. Well, on the other hand, I even think, that users desperately wanting to have browser as a target platform, would be even willing to pay for that.**

**toomasv**

**[05:55](#msg5eae5cbdb6dd230697a140b2)@ralfwenske Sound principles and very nice app!**

**GiuseppeChillemi**

**[07:42](#msg5eae75d1f0377f163164002a)@greggirwin I understand your concerns. Everyone at Red Foundation, and Red foundation itself, needs money to live. Your first target should be having Red adopted on huge target markets, as everything multiplied by "huge" is huge itself. A 10USD tool sold to 100.000 developers magically becomes 1 Million dollars. So, even the smallest side utility sold to a big developers base can make a sustained income flow. iOS developers and developers of applications whose interfaces output to a browser are such giant markets. Then an approach where core tools are free and small tools have a price could be a successful one. But the most important question is: why should they adopt Red and how we communicate this: it's your "find the adoption driver" challenge, good luck!**

**endo64**

**[09:10](#msg5eae8a6ea9de3d01b1e5a34c)@hiiamboris @greggirwin @rebolek What do you think adding `/case` and `/same` refinements to `alter`?**  
**I needed it recently and current implementation doesn't have them so doesn't behave correctly:**

**`>> b: [] == [] >> v: ["a" "A"] == ["a" "A"] >> alter b v mold b == {["a" "A"]} >> alter b v mold b == {["A"]} >> alter b v mold b == {["A" "a" "A"]}`**

**hiiamboris**

**[09:11](#msg5eae8abcadb0ec5c2be04cee)https://github.com/red/red/issues/3190 there's a lot of opinions about that ;)**

**[09:13](#msg5eae8b4f3d58de7a38f01a52)Meanwhile it's a mezz so you can improve it.**

**endo64**

**[09:14](#msg5eae8b67d898fe7a3761d2bf)I did actually, I would ask for your review :)**

**[09:14](#msg5eae8b6cf0377f16316428c2)**  
**`alter: func [ "If a value is not found in a series, append it; otherwise, remove it. Returns true if added" series [series!] value /case "Case-sensitive comparison" /same {Use "same?" as comparator} /local find' ][ find': copy either same ['find/same][ either case ['find/case] [to path! 'find] ] if series? :value [append find' 'only] not none? unless remove do compose [(find') series :value] [ either series? :value [append/only series :value] [append series :value] ] ]`**

**[09:14](#msg5eae8b7ff0377f16316428ea)Here are some tests:**  
**`>>: ==: none >> b: [] == [] >> v1: ["a" "B"] == ["a" "B"] >> v2: ["A" "b"] == ["A" "b"] >> also alter b v1 b == [["a" "B"]] >> also alter b v2 b == [] >> also alter/same b v1 b == [["a" "B"]] >> also alter/same b v2 b == [["a" "B"] ["A" "b"]] >> also alter/case b v2 b == [["a" "B"]] >> also alter b v2 b == []`**

**[09:15](#msg5eae8ba57975db7ebfdf8263)I should have checked the issues first.**

**hiiamboris**

**[09:16](#msg5eae8be3adb0ec5c2be04f43)I think you can always add `/only` in your case, unconditionally, no?**

**endo64**

**[09:17](#msg5eae8c1f97338850a2e44b25)If the value is a series.**

**[09:18](#msg5eae8c6a7975db7ebfdf83e6)Otherwise searches for `["a" "b"]` but it adds `"a" "b"` which I can't see any use for that.**

**hiiamboris**

**[09:19](#msg5eae8c9d3d58de7a38f01c37)But `/only` will have no effect for non-series (actually, non-any-blocks) anyway, right? so why not include it?**

**endo64**

**[09:21](#msg5eae8d1731a6d25d7ca6ea0e)You mean adding it as a refinement? Yes, that would ok.**

**[09:23](#msg5eae8d9097338850a2e44ed8)Then should we keep `if series? :value [append find' 'only]` and make it explicit it the `value` is a series?**

**hiiamboris**

**[09:29](#msg5eae8f16a9de3d01b1e5ac5d)I just mean it would save you from 2 extra checks and make it a 2-liner.**

**endo64**

**[10:42](#msg5eaea001f0377f163164527b)But it should be there otherwise `/same` wouldn't be useful, would be?**

**hiiamboris**

**[10:46](#msg5eaea0fb0b23797ec05c4534)Of course. See Gregg's implementation btw, in the ticket. He implied /only.**

**GiuseppeChillemi**

**[14:15](#msg5eaed213f0377f163164b873)@meijeru About your \[observation](https://github.com/red/REP/issues/69#issuecomment-602277187) I am starting to think that it would be good having a context at `datatype!` level that contains all of its accessors. Then we would have path like notation and methods in every(?) Red datatype like your:**

**`a: USD$1.07 a/currency => USD`**

**Values could then be queued (or even manipulated) using these methods.**

**meijeru**

**[16:36](#msg5eaef2f29f0c955d7da0529a)This has been implemented as `a/code` already, which is the reason I closed the issue! Also `system/catalog/accessors` will contain this. Isn't that enough for you?**

**GiuseppeChillemi**

**[16:42](#msg5eaef487a9de3d01b1e68484)@meijeru Didn't know it has been implemented something similar (But without contexts). Just I was proposing the idea.**

**Here it is and I am happy to see it!**

**`>> probe system/catalog/accessors [ date! [ date year month day zone time hour minute second weekday yearday timezone week isoweek julian ] email! [user host] event! [ type face window offset key picked flags away? down? mid-down? alt-down? aux-down? ctrl? shift? ] image! [size argb rgb alpha] pair! [x y] time! [hour minute second] ]`**

**Now we need just the next step: editable accessors?**

**meijeru**

**[16:45](#msg5eaef51631a6d25d7ca7c9c8)They are editable at the moment, which I think is unfortunate because there is no semantics attached, and no mechanism to do so. What is your idea?**

**GiuseppeChillemi**

**[17:17](#msg5eaefc93347bd6163051e1d6)My idea was just having \*datatype level contexts* to create accessors (methods) for datatypes and eventually expand and modify them.**  
**The general idea was to have them with another path syntax to distinguish them from normal contexts, \*so words can have `system/catalog/accessors` at the same time of their normal path syntax (otherwise you can't have accessors for word! datatype like you are doing with money as context words could have same name)\***

**`word/accessor ;normal path syntax word//accessor ;datatype level accessor (system/catalog/accessors)`**  
**(I have changed my message because of error, italic parts are the modified ones)**

**greggirwin**

**[18:24](#msg5eaf0c54347bd616305208bc)@ralfwenske yours is an absolutely excellent case, and site. :+1:**

**@pekr, "just", as you note is the hard part. I don't see how it's the wrong question though. Run some numbers. How many current Red users might buy Red if it targeted the browser, how much should we charge, and how much money does that equal? We can't count on new users, because they already use JS (and don't pay). Those who \*would* pay (mainly to support us) are so small in number that it's just not enough.**

**Maybe we can start selling Red, at 0.7.0, to see who buys it. You can do a lot with it, and it will just get better with time. Sort of "Ongoing crowdfunding" where you already have the product in hand.**

**[18:28](#msg5eaf0d3222f9c45c2a691f37)@GiuseppeChillemi build your accessor system at the mezz level. It doesn't need to be internal to datatypes.**

**[18:35](#msg5eaf0ed77975db7ebfe09f1f)I don't have anything new to add to the `alter` chat, after re-reading the ticket.**

**GiuseppeChillemi**

**[18:36](#msg5eaf0f1a31a6d25d7ca80b76)@greggirwin Many things are on the todo list when I will reach different skill levels. I am happy to have discovered `system/catalog/accessors`. I just ask why the current path syntax has been maintained implementing them, because `object!`, `block!` and 'Word' itself can't have accessor with the current syntax, otherwise they would interfere with the path mechanism.**

**[20:49](#msg5eaf2e4bb6dd230697a30a57)@greggirwin Gregg, why don't you open a Patron account? I would like a lot to support you this way and I am sure many others would support you too!**

****Monday 4th May, 2020****

**greggirwin**

**[03:29](#msg5eaf8c083d58de7a38f23a6a)It's a possibility. Github Sponsors may be the best fit there.**

**pekr**

**[07:29](#msg5eafc46eadb0ec5c2be2d890)@greggirwin Haha :-) The same day morning I was thinking about "donations", and how I have supported Red by sending some money on a monthly basis, so we are imo thinking along the same lines. Maybe that way, if the community is a bit bigger, users can select a support program (because donations as per se migh be obliged to some taxes), e.g. one month (one-off), 1-4 quarters ...., one year. That would buy such ppl some advantage (that can be debated). And maybe, who knows, we would be able to pay for one more fulltime programmer, or special project, etc.? That could imo work, while the tool could stay free, because as you have said - browser / js stuff is expected being free. On the other hand, those, who would like to have the possibility to get Red into other scenarios (browser, iOS, embedded MCUs etc.), would pay even for that .... Does it make at least a little of a sense?**

**GaryMiller**

**[09:01](#msg5eafd9d3347bd6163053bbcb)I'd be in favor of a bug bounty where the developers estimate the cost of fixing each bug and feature request. And users fund the bug or feature according to how much they want it. When donations match the bounty then that is the next one worked on in First Funded, First Out basis. That way you're not funding pieces that you will never use but you can afford to fund more on must have features that are holding back your development.**

**pekr**

**[10:21](#msg5eafec98f0377f16316710f3)That is nice, but development should not be driven by commitee. We need to find some balance, where Red teams still can work on things as they see fit.**

**dockimbel**

**[12:03](#msg5eb0048d31a6d25d7caa1fc2)@hiiamboris My quick review/comments on your Red-mezz-warehouse library:**

**`with`: two reasons why I have not added it to Red core so far:**

**1. Such construct promotes inlined dynamic binding instead of a pre-binding approach (using `bind`). Binding is a slow process, so generalizing such approach will come at expense of code performance.**

**2. Such construct leads to non-compilable code patterns, which means even more (eventually significant) performance losses.**

**`bind-only`: selective binding is something I've been considering from time to time. It's not a so common need, but comes handy when needed. The hard part is figuring out an efficient implementation speed-wise, as it can easily go O(n^2), so could become too slow on bigger blocks arguments.**

**`apply`: definitely something on our roadmap to provide natively. Passing a dynamically built object can be really expensive if it's called in loops. That's one the of design aspects to solve: firgure out the best way to pass a list of arguments constructed dynamically without too much pressure on the memory manager (otherwise it could disqualify the use of `apply` in big loops).**

**`timestamp` and `format-number`: a job for our upcoming `format` dialect.**

**`stepwise`: that's an old possible improvement that surfaces from time to time. I have not given it much thought beyond considering the use of `|` or `&` to implicitly pass an argument between multiple expressions. Your macro approach is interesting as it keeps the resulting code compilable.**

**`trace`, `trace-deep`: definitely something we will cover soon with an instrumentable interpreter. Tracing is a big topic that we need to explore more.**

**`selective-catch`: there are some missing pieces currently in Red's exception handling that might cover or at least overlap with those functions.**

**`prettify`: cool experiment. Given the general inability to accurately distinguish code from data in Redbol world, I'm interesting in seeing how far we can go just relying on (clever) heuristics. I guess this kind of utility mezz will come handy when we'll get full networking and start passing flattened code around.**  
**In the parse rules you're using, wouldn't `set w ['function | 'func] if (word? w)` be faster if written as `ahead word! set w ['function | 'func]` rather (avoiding a paren expression to evaluate)?**

**`extremi`: I think your `minmax-of` function could be a candidate for inclusion as native. Depends on what we will end up with our HOF support.**

**`count,`keep-type`: same as previous one.`collect-set-words`: this one already exists at R/S level, we need to expose it as native. "Loops" constructs: that's digging into the same direction as the general`loop`construct proposed in [REP0101](https://github.com/red/REP/blob/master/REPs/rep-0101.adoc). That's something I'm in favor of, unifying all basic iterations constructs into a dialected one. Though, it's a long design work, having to consider many aspects, including static analysis constraints for the compiler to be able to hanlde such dialect. "Debug" functions: same remark as for`trace`. Moreover, the way you use`#assert`for unit testing purpose is something I am considering with a`#test`directive combined with a`do/test`refinement. Same for a`#debug`one with a`do/debug`mode.`clock`: we do have a`dt`(delta-time) function in Rebol, that's a candidate for inclusion in Red too (in its most basic form, just including normalization by removing the time taken by an "empty"`dt`run), so that more specialized wrappers like yours could be built upon.`composite`: Again, interesting use of macros for that. It's a big topic, so I'll keep it for the moment when we officially open the work on it. One remark: have you considered not targeting`rejoin`on expansion but instead a simplier form that will remove the need for intermediary "reduction" and extra block allocation?`glob\`: I think we all have somewhere a version of such filesystem walker. Last time when I thought about including a simple version of it in Red, I was wondering if we could not provide a polymorphic event**

**[12:05](#msg5eb0051f3d58de7a38f34e63)@hiiamboris Addendum (reached the Gitter post limit in the previous one, couldn't even fix typos...): thanks for sharing it, lots of good stuff and food for thought \[there](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/README.md). :+1:**

**GaryMiller**

**[12:09](#msg5eb005e87975db7ebfe2adbe)@pekr Maybe have a general fund and 25% of each bug/feature donation would go to general fund for Red Teams general agenda. Kind of like a tax. Or if those things that the Red Teams are working on are for paid products then those could come out of Venture Capital. So long as the people making donations got their feature in a timely manner then most would still be happy.**

**hiiamboris**

**[12:42](#msg5eb00dbc14b48f0698ab1725)@dockimbel thanks a lot for the review and great thoughts! :+1:**

**&gt; `composite`: Again, interesting use of macros for that. It's a big topic, so I'll keep it for the moment when we officially open the work on it. One remark: have you considered not targeting `rejoin` on expansion but instead a simplier form that will remove the need for intermediary "reduction" and extra block allocation?**

**I find that most expressions I put into `#composite` are not final values, but something to be evaluated. Plus, `form` inserts spaces between items.**

**&gt; In the parse rules you're using, wouldn't set w \['function | 'func] if (word? w) be faster if written as ahead word! set w \['function | 'func] rather (avoiding a paren expression to evaluate)?**

**I will check that. Thanks for the tip ;)**

**&gt; `apply`: definitely something on our roadmap to provide natively. Passing a dynamically built object can be really expensive if it's called in loops. That's one the of design aspects to solve: firgure out the best way to pass a list of arguments constructed dynamically without too much pressure on the memory manager (otherwise it could disqualify the use of `apply` in big loops).**

**That's an important consideration indeed. I'm of an opinion that we could support both positional and key/value formats (like @giesse did in Topaz). I don't have enough use cases for positional approach to judge, but for key/value mode we can let `apply` reduce expressions passed to it as a block (just skip the set-word, then `do/next`, and so on). So there will be no extra allocations.**

**dockimbel**

**[13:21](#msg5eb016c7adb0ec5c2be3a65e)Gitter has cut out the last part of my review post, and I've erased the draft... (Gitter, I hate U!). Let me write it again.**

**[13:24](#msg5eb017a731a6d25d7caa57f9)@hiiamboris**  
**`glob`: I think we all have somewhere a version of such filesystem walker. Last time when I thought about including a simple version of it in Red, I was wondering if we could not provide a polymorphic event-based tree-walker function taking a callback function, that could be used to implement all the other listing/filtering/searching utilities. Again something to ponder against our HOF design decisions. On implementation note, your `function [...] bind [...] context [...]` seems a bit convoluted to me. Why not just use an anonymous wrapping context that would permit compilation of `glob`?**

**`relativity`: that's a big topic, relative units vs pixels, the plan is to take some decisions after we complete View support on Android, so we can have a good testbed for such needs (given the large range of different DPI in Android devices).**

**`do-queued-events`: the `event` system should get some improvement in 0.7.0, with the unified event loop. We'll see then if we can avoid the need for loops at the user level for emptying the event queue.**

**`do-atomic`: &lt;not reviewed yet&gt;**

**hiiamboris**

**[13:29](#msg5eb018cc3d58de7a38f38071)&gt; Gitter has cut out the last part of my review post, and I've erased the draft**

**FYI, at least in Firefox-based browsers, Ctrl+Z in the input field helps me with that usually ;)**

**&gt; polymorphic event-based tree-walker function**

**Nice plan. Also ties to https://github.com/red/red/wiki/\[PROP]-Node!-datatype**

**&gt; your `function [...] bind [...] context [...]` seems a bit convoluted to me. Why not just use an anonymous wrapping context that would permit compilation of `glob`?**

**Will do ;) It's an old version, written like 2 years ago :D**

**[13:59](#msg5eb01fded898fe7a37653d06)&gt; In the parse rules you're using, wouldn't `set w ['function | 'func] if (word? w)` be faster if written as `ahead word! set w ['function | 'func]` rather (avoiding a paren expression to evaluate)?**

**No. Checked these expressions on real code (GUI console core, functions.red):**  
**`parse data rule: [any [ahead block! into rule | set w ['function | 'func] if (word? w) | skip]] parse data rule: [any [ahead block! into rule | ahead word! set w ['function | 'func] | skip]] parse/case data rule: [any [ahead block! into rule | set w ['function | 'func] | skip]]`**  
**2nd one is ~7% slower, because of sole `ahead word!` overhead on everything that's not a `function`. 3rd version is buggy of course, but sometime in the future we'll switch to it ;)**

**dockimbel**

**[14:38](#msg5eb028f7a9de3d01b1e932be)@hiiamboris Thanks for the feedback. So with your dataset, `ahead word!` is letting pass too many cases.**

**greggirwin**

**[20:54](#msg5eb0810a0b23797ec060a80d)My quick thoughts:**  
**- `with` is something I used quite a bit in the past. No block support, and simple imperative model with objects. In that context it is can reduce code a lot, and also associated bugs. Also makes it much clearer where \*other* objects are being addressed.**  
**- HOFs apply to a lot of this thinking, exposed for usability.**  
**- `collect-set-words` is nice to have native, but general value collection as well, along with parse-based template matching.**  
**- One of my old `glob` versions offered a callback, which was handy at times.**

**Some of this comes back to a unifying theme of pattern-action models, and building things around a unified eventing system. e.g. my old `rgrep` just wraps `rawk`, which uses `file-list`, but could also work on blocks, rather than line oriented files. I think this pattern can be applied to non-flat HOFs as well.**

****Thursday 7th May, 2020****

**cloutiy**

**[01:16](#msg5eb3615bf0377f16317045d1)Want to know the type of an object?**  
**`new: function [ 't data ] [ insert data [type: t] reduce make object! data ] typeof: function [ thing ] [ either object? thing [ thing/type ] [ type? thing ]] jim: new User [ name: {James} last: {Jones} ] comment { == make object! [ type: 'User name: "James" last: "Jones" } typeof jim ;== User`**

**greggirwin**

**[01:45](#msg5eb3681d9f0c955d7dabb5ee)That's the Red way. :^) But if you're using it all internally, consider making the naming more collision resistant.**

**[01:50](#msg5eb3697c9f0c955d7dabb987)It's fun to think about how we're \*used to* doing things, and how \*else* they could work. For example, `type` could be a func that looks at other values and returns a result based on those, or even a collection of those. Say your object is warm-blooded, has fur, and mammary glands. You could return those as a block, for a `mammal?` mezz, or it could do that internally. It's more interesting where you have things evolve, I think `Spore` was a game that did that.**

**hiiamboris**

**[08:48](#msg5eb3cb4eadb0ec5c2bed67b0)@cloutiy there's also `class-of`:**  
**`>> a: object [x: 1] >> b: make a [x: 2] >> class-of a == 1000045 >> class-of b == 1000045`**  
**It will change with the introduction of new words into the object though.**

**endo64**

**[12:37](#msg5eb400fa9f0c955d7dad31ec)Once I wrote a simple test function to check object's similarity. But `class-of` is way better :) (even though it is not exactly doing the same thing)**  
**`o: object [name: "James" age: 27] p: object [age: 42 name: "John"] k: object [age: 42 name: "John" gender: "Male"] similar?: func [o p] [equal? sort words-of o sort words-of p] similar? o p ;== true similar? o k ;== false`**

****Friday 8th May, 2020****

**Oldes**

**[08:32](#msg5eb51931f0377f163174fa73)To be honest, I wonder what was the main design goal of this `class-of` function.. I understand, that one may use it to track if object was made from a given \_template\_, but what if one create same object like:**  
**`>> o1: object [a: 1] o2: object [a: 1] equal? (probe class-of o1) (probe class-of o2) 1000029 1000030 == false`**

**[08:39](#msg5eb51aab7a24ff01b00c4dcd)It looks that there is only one use case in the Red runtime:**  
**`face?: function [ "Returns TRUE if the value is a face! object" value "Value to test" return: [logic!] ][ to logic! all [object? :value (class-of value) = class-of face!] ]`**

**hiiamboris**

**[09:19](#msg5eb52432b6dd230697b31162)Once could use a hash of object's words, but then one would have to sort them. And sort is slow (not that hash is fast ;).**

**[09:28](#msg5eb5264d22f9c45c2a792e76)Also**  
**`>> (class-of face!) = class-of make-face 'base == true >> (class-of face!) = class-of make-face 'scroller == false >> (class-of face!) = class-of make-face 'rich-text == false`**

**[09:36](#msg5eb5282d14b48f0698b92b88)Or maybe we shouldn't use `sort` at all, because:**  
**`>> (object [a: 1 b: 2]) = object [b: 2 a: 1] == false`**  
**And use `find/match words-of obj words-of prototype` instead**

**Yamoon2018**

**[11:48](#msg5eb546f7d898fe7a37737211)I'm new here and I'm trying to install RED on VScode but its not working , this is the error**

**[11:48](#msg5eb546f8adb0ec5c2bf1c4af)\[Error - 3:38:47 PM] Starting client failed**  
**Launching server using command C:\\ProgramData\\Red failed**

**dockimbel**

**[11:50](#msg5eb547777a24ff01b00cd8b4)@qtxie ^---**

**qtxie**

**[13:43](#msg5eb56205347bd6163062dd2d)@Yamoon2018 Are you using the automated builds? The VScode plugin needs some functions which doesn't exist in Red 0.6.4 stable.**

**planetsizecpu**

**[16:01](#msg5eb58255f0377f16317663ea)Welcome on board @Yamoon2018**

**greggirwin**

**[16:48](#msg5eb58d4914b48f0698ba82f6)@qtxie I don't use VSCode regularly, but fired it up. Language server (0.3.6) crashes, but I'll guess that's because I'm running on `fast-lexer` here.**

**qtxie**

**[22:49](#msg5eb5e1eca9de3d01b1f903a9)I don't use VSCode either. Just tried with the latest automated build Red (red-08may20-5a4401b94.exe) and Red VSCode plugin (0.3.6). I saw some error messages at the beginning, but after reboot the VSCode, it works. :sweat\_smile:**

**[22:54](#msg5eb5e32b347bd61630645ec8)I found two problems after playing it a while. @bitbegin First, the syntax error checking may be false alarm. This is worse than no checking at all IMO. Most of the Red VSCode plugin users are newbies. It will make the them confused.**

**[22:54](#msg5eb5e3329f0c955d7db2cf5b)\[!\[image.png](https://files.gitter.im/red/red/UOUL/thumb/image.png)](https://files.gitter.im/red/red/UOUL/image.png)**

**[22:58](#msg5eb5e421d898fe7a3775572c)Second, only function!s show the docstrings completed when mouse hover on them. Native!s or Action! show part of the docstrings.**

**[23:00](#msg5eb5e476347bd61630646131)\[!\[image.png](https://files.gitter.im/red/red/lrDp/thumb/image.png)](https://files.gitter.im/red/red/lrDp/image.png)**

****Saturday 9th May, 2020****

**bitbegin**

**[02:30](#msg5eb615c83d58de7a380401d2)not support fast-lexer yet.**

**[02:33](#msg5eb6165c347bd6163064c633)the lexer for Red has limits, this issue should be fixed when port it to fast-lexer**

**GiuseppeChillemi**

**[05:05](#msg5eb639fed898fe7a37760206)Please, don't forget the in path space problem issue (there is a ticket for it) on the next round of fixings. I can't use VSCode because of this.**

**meijeru**

**[09:13](#msg5eb674207a24ff01b00fea93)If I see the large number of commits in various branches, waiting to be merged (I suppose), I cannot but wonder: are we close to a new milestone? and if so, what are the prospects that all these commits will be merged conflict-free? or are we in for a prolonged period of adjustment between the various branches...**

**GiuseppeChillemi**

**[13:32](#msg5eb6b0fb7975db7ebff4b7f4)I can see you dreaming waiting for the completition of the process (I am dreaming about this too). I have started to perceive signals something big was about to happen 2 months ago. And then, day after day more and more signals were coming. Apart release 0.6.5 and 0.7.0 , I can see in the near future that other announcements will be made. Lets wait and see!**

**GaryMiller**

**[13:50](#msg5eb6b53a31a6d25d7cbc5a68)Please don't forget the size limitation 4361 \[Compiler] fails on repeatable patterns!**

**GiuseppeChillemi**

**[14:09](#msg5eb6b98d31a6d25d7cbc62bf)@meijeru where do you see the list of commits?**

**meijeru**

**[15:36](#msg5eb6cdebb6dd230697b760be)(1) On the Github main page, when selecting other branches than `master`. (2) On the progress page \[here](https://progress.red-lang.org/).**

**greggirwin**

**[16:17](#msg5eb6d78131a6d25d7cbca4d6)@meijeru there's always a big push with larger branch merges, and conflicts to be addressed.**

**meijeru**

**[17:12](#msg5eb6e48514b48f0698bda041)I wish you guys lots of success!**

**greggirwin**

**[17:13](#msg5eb6e4aa5cd4fe50a3fd7e2d)Thanks! :^)**

**meijeru**

**[17:39](#msg5eb6eacc3d58de7a3805e74f)Has anybody made a Red syntax coloring file for Notepad++, the source editor?**

**greggirwin**

**[17:42](#msg5eb6eb86a9de3d01b1fb4309)I think there was one for R2. I've got one for UltraEdit, and TextMate/E (long ago). I can't even remember if Crimson had highlighting.**

**[17:45](#msg5eb6ec527a24ff01b0110784)Rebol is listed \[here](https://npp-user-manual.org/docs/programing-languages/). I don't know if you can access that to customize it for Red.**

**GiuseppeChillemi**

**[18:42](#msg5eb6f99031a6d25d7cbcf476)@meijeru Waiting for the updates of your great specs document!**

**temperfugit**

**[19:44](#msg5eb708203d58de7a38062391)@meijeru I've never used it but \[helpin.red](http://helpin.red/Homepage.html) has put together a tool called \[Rededitor](http://helpin.red/Rededitor.html), which is Notepad++ with Red syntax highlighting.**

**greggirwin**

**[19:57](#msg5eb70b1dd898fe7a3777f230)I forgot about https://github.com/red/red/wiki/%5BNOTES%5D-Editor-Integrations. @temperfugit would you add that there if it's not already listed? Thanks!**

**toomasv**

**[19:58](#msg5eb70b6397338850a2fa4d60)@meijeru I have one too for personal use so far, not polished.**

**meijeru**

**[20:06](#msg5eb70d43347bd6163066eddc)Thanks for all the tips!**

**temperfugit**

**[21:09](#msg5eb71c097a24ff01b01179fc)@greggirwin I added it**

**GaryMiller**

**[22:03](#msg5eb728ad5cd4fe50a3fe21ad)@meijeru Notepad++ came out with a new version some months ago which rendered a good many of the add-ins incompatible so if it does not work you might need to try with an older version is still downloadable. There is now a separate plugin manager now available for NotePad++ to manage plugins. https://www.techspot.com/downloads/4547-notepad-plugin-manager.html**

****Sunday 10th May, 2020****

**planetsizecpu**

**[08:55](#msg5eb7c17da9de3d01b1fcecfe)@meijeru I use @Ungaretti 's \[config](https://github.com/Ungaretti/Notepad-config-file-for-Red-Language) file, works well for me, so many thanks to him!**

**ldci**

**[10:25](#msg5eb7d6b69f0c955d7db7062b)I'm really happy to announce that redCV is now able to identify faces in image: https://twitter.com/fjephe/status/1259400320762986498**  
**redCV repository will be updated asap**

**hiiamboris**

**[10:49](#msg5eb7dc28d898fe7a37799a38)Cool!**  
**@ldci is there something in redCV that can help:**  
**- identify text strings on an image (no need in text recognition, although it could be used too)**  
**- locate a given image inside another image (possibly scaled/stretched)**  
**- fuzzily compare 2 images to say if it's the same image or not (ignoring tiny differences in overall lighting, but should be sensitive to specks or features present only on one of the images)**

**dockimbel**

**[11:07](#msg5eb7e0785cd4fe50a3ff9779)@ldci Great! :+1!**

**meijeru**

**[11:43](#msg5eb7e8ec31a6d25d7cbef69c)@GiuseppeChillemi \_"@meijeru Waiting for the updates of your great specs document!"_ I try to keep my document in step with new developments, even if they are not in `master` but in other, publicly available, branches. S0 there should not be (m)any surprises when the long awaited merge(s) will occur.**

**ldci**

**[12:52](#msg5eb7f910347bd6163068e229)@hiiamboris probably yes, in association with Tesseract for text identification. Then for comparing images you can use DTW for example. Need more detail :)**

**hiiamboris**

**[13:10](#msg5eb7fd5e22f9c45c2a801939)@ldci It's a few ways in which https://gitlab.com/hiiamboris/red-view-test-system can be improved in the future (provided I will find algorithms simple enough to implement, or good enough to link against).**  
**E.g. I know a string of text (chars) and I want to:**  
**1) find it on the displayed layout to check if it's alignment is all in order**  
**2) ensure it's not clipped**  
**3) be able to compare text rendered using different engines (e.g. non-isochromatic ClearType vs isochromatic TrueType, etc)**

**[13:13](#msg5eb7fddda9de3d01b1fd8411)I have full control over tests code, so (1) is usually not a problem, but (2) and (3) still are**

**ldci**

**[13:15](#msg5eb7fe7f5cd4fe50a3ffe52e)@hiiamboris OK, I'll have a look**

**hiiamboris**

**[13:17](#msg5eb7fecdd898fe7a3779f384)Thanks! Let me know if you come up with any ideas ☻**

**ldci**

**[14:42](#msg5eb812ec5cd4fe50a3001739)@hiiamboris, for comparing any image or text rendering, with redCV you can use the histograms of oriented gradients (HOG) and then consider that each histogram as temporal series. After it is really easy to make a distance calculation between series and decide, according to a threshold value, if the series are similar or not. You'll find in redCV a lot of distance computation, but very often I'm using dynamic time warping algorithm which is non-linear and more sensitive. I'll send you an image.**

**pekr**

**[15:27](#msg5eb81d745cd4fe50a3003030)@ldci Is there any way of how to identify a face? I mean, not just a face recognition, but comparison against some saved patterns?**

**ldci**

**[15:36](#msg5eb81f6eb6dd230697ba5028)@pekr Yes, this is the idea behind HOG. You consider your face as a template and then you calculate the distance between this template and all candidates. According to a fixed threshold value, you can know if it's the same or a different face.**

**pekr**

**[15:38](#msg5eb81fdbd898fe7a377a454e)Perfect, thanks. And this is the method not necessarily involving a neural networks, right?**

**ldci**

**[15:39](#msg5eb8202297338850a2fca5ae)@pekr No needs for neural. networks. DTW algorithm is sufficient. BTW, redCV GitHub repository will be updated as soon as possible.**

**greggirwin**

**[18:17](#msg5eb845409f0c955d7db817ea)@ldci :+1: :+1:**

****Monday 11st May, 2020****

**pekr**

**[17:15](#msg5eb98821a631562f52a39c85)@greggirwin from your Inject script .... re the Ladislav's version of Build function, I have found this? Seems to be stored by Rebolek :-) https://gist.github.com/rebolek/edb7ba63bbaddde099cb3b1fd95c2d2c**

**greggirwin**

**[18:08](#msg5eb994ab40e3122a8810437f)Yes, he noted it as well. :+1:**

****Tuesday 12nd May, 2020****

**meijeru**

**[13:24](#msg5ebaa38ac210aa6c75e3d31f)There are 5 `open` issues with `status.built`and `status.tested` as of today.**

**Oldes**

**[15:14](#msg5ebabd3ca631562f52a6bf59)\[decode-HTML-entities](https://gist.github.com/Oldes/01fb15df1e7d2abd04ed83ebdaedb0cb) function.**  
**`>> decode-html-entities {Test: ♠ & ¢ <a> and Δδ} == "Test: ♠ & ¢ <a> and Δδ"`**

**hiiamboris**

**[15:26](#msg5ebac024a631562f52a6ca0e)@Oldes nice! :+1:**  
**One optimization I can think of is to replace `s: copy char .. e:` with `s: .. e: (insert/part clear char s e)`, to reduce the number of allocations done**

**Oldes**

**[15:28](#msg5ebac096a631562f52a6cc5d)I'm not sure if I understand your optimization.. it is per purpose creating a new string to avoid `memcpy`.**

**hiiamboris**

**[15:30](#msg5ebac10cfaa128031cc914bc)Parse's `copy` does `memcpy`**

**Oldes**

**[15:32](#msg5ebac18b10d5ec031a017766)I know.. but you can avoid some of these:)**

**[15:33](#msg5ebac1c13f5b01031943ec01)You can time it with your possible changes.**

**hiiamboris**

**[16:07](#msg5ebac9d5a631562f52a6efa0)Turns out not worth the performance loss ;)**  
**I'll post in /chit-chat**

**dockimbel**

**[16:39](#msg5ebad14af25ee47806916b8f)&gt; @Oldes nice! :+1:**  
**&gt; One optimization I can think of is to replace `s: copy char .. e:` with `s: .. e: (insert/part clear char s e)`, to reduce the number of allocations done**

**What about this one: `( append out copy/part s e )` =&gt; `( insert/part out s e )`?**

**hiiamboris**

**[16:48](#msg5ebad3662cf0da0ad9fab303)In the end I decided to go with `keep` and `collect into` instead ;) Escaping into Red is too much overhead**

**greggirwin**

**[19:05](#msg5ebaf38b40e3122a8814017c)@Oldes :+1:**

**cloutiy**

**[20:49](#msg5ebb0bbc7c04b92f535c98bd)What is the probability of introducing a new type `closing-tag!` to differentiate between  and  ?**

**hiiamboris**

**[20:49](#msg5ebb0bf78c044c1914984625)Zero ;) But why `tag!` isn't sufficient for you?**

**cloutiy**

**[20:55](#msg5ebb0d3520eaac1853063185)@hiiamboris if parsing a block matching on types, `[ tag! tag! ]` would match both  and . What is your approach to check whether the second tag is a closing tag?**

**hiiamboris**

**[20:56](#msg5ebb0d6e3c51a11913f6c8b5)`closing-tag!: [set t tag! if (t/1 = #"/")]`**  
**`opening-tag!: [set t tag! if (t/1 <> #"/")]`**

**cloutiy**

**[20:58](#msg5ebb0df13f5b01031944e8e0)@hiiamboris ok I guess that works;) But integers and floats are the same, except for the `.` character. They are distinct types.**

**hiiamboris**

**[20:59](#msg5ebb0e3b3f5b01031944e9b9)I'm not sure why we have both. Maybe simply to save RAM, esp. with vectors of integers.**

**[21:00](#msg5ebb0e7a2cf0da0ad9fb5781)I recall there was a talk about removing integer, like in lua.**

**[21:01](#msg5ebb0ea3a631562f52a7bfc3)It's still useful in datatype checks in functions specs though. I guess.**

**greggirwin**

**[21:23](#msg5ebb13d3f25ee47806922aa3)It's a good thought experiment, and certainly start a wiki page for notes if you pursue it @cloutiy.**

**Tags today are very simple, basically strings with different end caps. That makes them very easy to reason about, apply general string and series processing to, etc. Once the `/` becomes part of the lexical form, are they as easy to reason about?**

**As well as building rules on, as @hiiamboris shows.**

**With two types, we probably also want to add an `any-tag!` typeset. And if they are treated, semantically, as opening and closing elements, all `tag!` references have to change to `any-tag!`. A subtle naming detail here is the `any` part. Are there other types of tags, or only two? "Any" doesn't strictly \*dis\*allow that, but it isn't the best word if there are only two options. So maybe it's `tag!` as the typeset name.**

**I'm not saying \*not* to think about this. Maybe there's a huge win here for markup processing and management. My gut says that processing matching tags won't benefit greatly, because you want to match the exact tag, not a generic `closing-tag!` value. In any case, it's worth noting in a wiki page, as it may make a good article someday, and tag this chat there. :^)**

**cloutiy**

**[22:03](#msg5ebb1d4a3f5b010319450e4c)@greggirwin re: adding a wiki page sure I could. Just point me to it;) Are there any protocols or recommended structures to follow? Also have some ideas regarding how compose could work for tags. For example paren! don't get evaluated inside tags. But as you pointed out that's probably because they are just strings with different caps. But would be nice to be able to do:**  
**`class: {btn red big} compose <div class='(class)'> == <div class='btn red big'>`**  
**I've written a `render` function to do this for me, used as:**  
**`render: function [ content ] [ ... ] button: function [ label properties ] [ render [ <button class=(properties/class) id=(label) onclick=(either properties/onclick [ properties/onclick ] [ otheraction ])> ] ] button "Click me!" [ class: {btn red big} onclick: {theaction} ]`**

**hiiamboris**

**[22:07](#msg5ebb1e3310d5ec031a028c5c)@cloutiy https://gitlab.com/hiiamboris/red-composite-macro**

**cloutiy**

**[22:08](#msg5ebb1e708c044c19149879c4)@hiiamboris thanks!**

**hiiamboris**

**[22:09](#msg5ebb1eaf10d5ec031a028d55)Or rather https://gitlab.com/hiiamboris/red-mezz-warehouse/#string-interpolation ;)**  
**It might have some updates over the previous link. Don't remember :)**

**greggirwin**

**[22:16](#msg5ebb20233f5b01031945154a)@cloutiy just create a new page called Tag! and put it there.**

**cloutiy**

**[22:20](#msg5ebb21202cf0da0ad9fb8800)@hiiamboris Great documentation. Also, thanks for reminding me of the existence of `macro`s! Had completely skipped this early on while trying to learn the basics. Will have to revisit it to see how else my head can break open. This is what I enjoy about `red`. And the company. You guys are great.**

**greggirwin**

**[22:38](#msg5ebb25527312422a87dffe46)We melt and mold minds daily, including our own. :^)**

****Wednesday 13th May, 2020****

**ALANVF**

**[00:41](#msg5ebb422c7c04b92f535d21c6)Hello all. Just joined**

**[00:41](#msg5ebb4253852efc0adad50c49)I thought I'd share a rather large Red-based project that I've been working on for a long time**

**[00:42](#msg5ebb428810d5ec031a02e1cd)Red.js is a web runtime for Red: https://github.com/ALANVF/Red.js**

**[00:43](#msg5ebb42b28c044c191498cee3)While it's fairly incomplete at the moment, I've tried to emulate as much of Red as I can so far**

**[00:43](#msg5ebb42c2496be6031dfb7130)any feedback would be appreciated :)**

**[00:44](#msg5ebb42e5496be6031dfb7169)been a fan of Red for a long time, so I thought I'd try doing something that could benefit other Red users**

**greggirwin**

**[02:34](#msg5ebb5cbc2cf0da0ad9fc1005)Nice! You've put a lot of work into that. Fun project. Have you seen @giesse's Topaz work. It's older, and along the same lines. Keep us posted on progress, how useful you find it, and what hurdles you have to get over.**

**ALANVF**

**[02:35](#msg5ebb5d0c8c044c19149902ba)Ah yeah I've checked out Topaz before, it's really cool :)**

**[02:36](#msg5ebb5d2a3f5b01031945a243)Thanks for your support on my project!**

**greggirwin**

**[02:36](#msg5ebb5d2d3c51a11913f78962)The more you can do at the mezz level, the easier things will be IMO. Even things like `round` were mezzanines in R2 and should be portable.**

**ALANVF**

**[02:37](#msg5ebb5d647312422a87e0798e)I'm afraid I'm not completely fluent with Red/Rebol terms, but I assume that mezzanines are natively implemented routines?**

**greggirwin**

**[02:37](#msg5ebb5d6efaa128031ccabb36)And note, if you have't caught wind already, that a couple new datatypes are coming, as well as a new raw-string lexical form.**

**ALANVF**

**[02:37](#msg5ebb5d87496be6031dfba4b8)Ah yeah, I've seen the new `ref!` datatype (even checked out the fork for it)**

**greggirwin**

**[02:38](#msg5ebb5d893f5b01031945a2da)Mezzanines are functions written in Red/Rebol, so high level with lots of leverage.**

**ALANVF**

**[02:38](#msg5ebb5d92852efc0adad54089)ah ok**

**[02:38](#msg5ebb5d9540e3122a8814fb92)yeah I can try that**

**[02:38](#msg5ebb5dadfaa128031ccabb83)but yeah I've even already started implementing the `money!` datatype as well, since it already exists in Rebol**

**greggirwin**

**[02:38](#msg5ebb5dbefaa128031ccabb8b)Just make sure not to use floating point internally for it. ;^)**

**ALANVF**

**[02:39](#msg5ebb5de32baa191854669e57)ah yeah I'm planning to use something like double.js or just represent it as a fraction**

**[02:41](#msg5ebb5e3c496be6031dfba58a)oh also, I've considered trying to add R3 datatypes like `module!` and `utype!` and such**

**[02:41](#msg5ebb5e4cf8ac2178074323fd)as I think it'd be cool to have those as a feature :)**

**[02:41](#msg5ebb5e737c04b92f535d59e7)but yeah I'll definitely try implementing more stuff in Red rather than TS**

**[02:42](#msg5ebb5eada631562f52a87d26)once I get to Parse, I'll probably try porting the original implementation from R/S since that'll probably be easier**

**greggirwin**

**[02:43](#msg5ebb5eba3c51a11913f78c5c)Nice work, and a very professional approach to Star as well. :+1:**

**ALANVF**

**[02:43](#msg5ebb5ee9f25ee4780692d48b)Thank you, and thanks for checking that out as well :)**

**[02:44](#msg5ebb5f0e7c04b92f535d5aff)Red has definitely inspired many of Star's potential meta-programming features**

**[02:45](#msg5ebb5f4cf25ee4780692d557)(mainly Parse and Red's macro preprocessor)**

**[02:47](#msg5ebb5faf496be6031dfba7a0)but yeah, I'll definitely keep you all updated about Red.js :thumbsup:**

**greggirwin**

**[02:47](#msg5ebb5fd5496be6031dfba801):+1:**

**ALANVF**

**[02:48](#msg5ebb5fed40e3122a88150065)I've been working on it for nearly 8 months, so I've been very excited to show it to the Red community**

**[02:49](#msg5ebb603b20eaac185306eecb)I think it'd be cool to be able to use Red on the web for front-end stuff, possibly even using Red/View and its other visual dialects**

**greggirwin**

**[03:00](#msg5ebb62d73f5b01031945af79)It's a common request.**

**ALANVF**

**[03:00](#msg5ebb62e83c51a11913f793a1)Yeah**

**[03:01](#msg5ebb6301faa128031ccac468)I'm hoping that I can accomplish it with Red.js since it runs using js**

**[03:03](#msg5ebb639d7c04b92f535d63ea)I have to go for today, but it was good talking with you :)**

**greggirwin**

**[03:05](#msg5ebb63eb7312422a87e086d0)You as well.**

**hiiamboris**

**[08:12](#msg5ebbabe2a631562f52a92fcc)@ALANVF Nice project :+1: Keep us posted ;)**  
**Is there an easy way to test it btw?**

**ALANVF**

**[12:56](#msg5ebbee893c51a11913f90425)@hiiamboris I had originally been developing it on repl.it, so maybe try that?**

**[12:57](#msg5ebbeeac496be6031dfd25df)in fact, I think I still have an older version on repl.it that I could probably update**

**[12:59](#msg5ebbef38a631562f52a9f482)if you want to run it locally, just make sure that you have Node and TypeScript installed**

**[13:06](#msg5ebbf0e77312422a87e1f2cc)I can try to add a "repl from repo" option that repl.it has that lets you just run the repo's code on repl.it though**

**hiiamboris**

**[13:08](#msg5ebbf14940e3122a881675c4)Just found that button ;) Trying to figure out what's next..**

**ALANVF**

**[13:09](#msg5ebbf16cf25ee478069443f4)yeah just have it run `app.ts` and it should start a REPL that I made for the program**

**hiiamboris**

**[13:16](#msg5ebbf34aa631562f52a9fee7)**  
**``` chmod 777 app.ts  ./app.ts ./app.ts: line 1: $'\357\273\277import': command not found ./app.ts: line 3: //: Is a directory ./app.ts: line 14: syntax error near unexpected token `$'`\n\tget: make native! [[\n\t\t\t"Returns the value a word refers to"\n\t\t\tword\t[any-word! refinement! path! object!]\n\t\t\t/any "If word has no value, return UNSET rather than causing an error"\n\t\t\t/case "Use case-sensitive comparison (path only)"\n\t\t\treturn: [any-type!]\n\t\t]\n\t\tget\n\t]\n`'' ./app.ts: line 14: ``);'```**  
**No luck so far ;)**

**ALANVF**

**[13:17](#msg5ebbf35b40e3122a88167b94)wat**

**[13:17](#msg5ebbf36e3c51a11913f911f2)uh, that shouldn't have happened**

**[13:17](#msg5ebbf3728c044c19149a8ba5)oh**

**[13:17](#msg5ebbf383f25ee47806944937)you have to run typescript with tsc**

**[13:32](#msg5ebbf6ea7c04b92f535ee72d)\[!\[image.png](https://files.gitter.im/red/red/OQ6D/thumb/image.png)](https://files.gitter.im/red/red/OQ6D/image.png)**

**[13:32](#msg5ebbf6fbfaa128031ccc4585)(ah, it appears that I can't send screenshots in a thread)**

****Thursday 14th May, 2020****

**ALANVF**

**[00:29](#msg5ebc90f910d5ec031a0644ee)New update for \[Red.js](https://github.com/ALANVF/Red.js) (version 0.0.2):**  
**- Completely rewrote `context!`s.**  
**- Fixed lots of scoping issues.**  
**- Added the `object!` datatype.**  
**- Fixed `path!`s (`set-path!`s are still kinda broken though).**  
**- Optimized some code.**

**greggirwin**

**[00:34](#msg5ebc9207f8ac2178074642fd):+1:**

**cloutiy**

**[00:42](#msg5ebc93f3852efc0adad86b8a)On the way to fullstack!**

**ALANVF**

**[00:46](#msg5ebc94cba631562f52abb999):thumbsup:**

**rebolek**

**[06:41](#msg5ebce81b20eaac18530ad3dc)@ALANVF this looks interesting! I tried to run it locally in Node and Deno, but no luck, Node throws this error:**  
**`~/code/Red.js >>> node test.ts (node:2888061) Warning: To load an ES module, set "type": "module" in the package.json or use the .mjs extension. /home/sony/code/Red.js/test.ts:1 import * as Red from "./red.ts"; ^^^^^^ SyntaxError: Cannot use import statement outside a module`**

**where test.ts is the example from your README. My experience with Node is basically non-existent, so can you help me how to fix this problem, please?**

**GiuseppeChillemi**

**[10:22](#msg5ebd1c0158741e40952f232d)I have 1MB file full of strings which are about 20-40 characters each one before Carriage Return. When the file is below 100K I have no visible slow down, but at 1MB I have a visible delay on cut&amp;past operations. Will FAST LEXER help here ?**

**rebolek**

**[10:26](#msg5ebd1cf119af2534f3b078e5)what do you mean by cut'n'paste?**

**GiuseppeChillemi**

**[10:38](#msg5ebd1fa309f78877805a1730)@rebolek**

**I mean this:**

**`add-word: func [txt area][ txt2: take/part at txt area1/selected/1 area1/selected/2 - area1/selected/1 + 1 if system/platform = 'Windows [ parse txt [some [newline remove newline | skip]] parse txt2 [some [newline remove newline | skip]] ] area1/text: txt append append area/text txt2 newline ] ....................... copycut: func [pname] [if area1/selected [ nls1: nls2: 0 if system/platform = 'Windows [ parse txt: copy area1/text [some [newline c: (c: insert c newline) :c | skip]] ] add-word txt B2 area1/selected: none ] set-focus area1 ]`**

**rebolek**

**[10:40](#msg5ebd20112ac6ef4e88c65c30)Ah, so the slowdown is in Windows `area`widget, right?**

**[10:41](#msg5ebd206e0abb6d4e87f46fc8)I guess this is problem of the widget, not Red one. Anyway, the text in area is `string!`, there's no loading, so `fast-lexer` isn't going to help.**

**hiiamboris**

**[12:39](#msg5ebd3c03e36f1840e56155a9)I added an experimental code construction func `reshape` to my repo:**  
**https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/reshape.md**

**It's goal is to cover complex construction scenarios where `compose` is simply not enough. Let me know what you think. Did you ever feel that `compose` is limiting/fighting you? ( @GiuseppeChillemi I know you did ☺ ) Does it help you with your use cases or what would you like to improve?**

**GiuseppeChillemi**

**[14:27](#msg5ebd556109f78877805ab65f)@hiiamboris I am at work, but I am looking forward to read how it works. I am very interested!**

**greggirwin**

**[15:31](#msg5ebd64527606a5777f640de3)@GiuseppeChillemi I don't know `area` limits, but basic Windows controls generally don't like huge data. I often remember this after trying to open a large file in Notepad and having it hang. You'd think in this day that we wouldn't have to worry at the 1MB level, but it's also something you should be able to test easily. Please report back if you do.**

**GiuseppeChillemi**

**[16:37](#msg5ebd73ca519b852e93f082ba)@greggirwin I made a mistake: it is less !**

**[16:37](#msg5ebd73cd20d9bf305765567b)\[!\[image.png](https://files.gitter.im/red/red/0Vi9/thumb/image.png)](https://files.gitter.im/red/red/0Vi9/image.png)**

**[16:38](#msg5ebd7411da74582e921bbb1e)0,25MB**

**hiiamboris**

**[16:48](#msg5ebd7651f3ce603074bb45c1)@GiuseppeChillemi you can use \[clock-each](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/clock-each.red) on real code to profile it**

**greggirwin**

**[16:48](#msg5ebd76775dcf0263d4e523b3)Yes, find out what specific parts are slow.**

**[16:51](#msg5ebd7704ecc55a312d01feea)It may be doing 8K inserts on a 250K string, where everything following has to shift.**

**[16:52](#msg5ebd775aecc55a312d01ff76)Not sure why you have to add and remove newlines. Maybe that can be avoided.**

**GiuseppeChillemi**

**[17:05](#msg5ebd7a3f0fe1ce34f2e602a2)This is an old project started with Toomas code. I select text in an area to the first newline and then cut and paste it to another one. I strip also newlines in excess clicking the same "move button". It is a simple `Select->take->insert` text to another area process. I will look at it with `clock-each` and report but it makes Red suffer like and infinite `any` in parse.**

**pekr**

**[17:32](#msg5ebd8091519b852e93f0afe2)Are we able to read from or write to the cloud based services, as Google Docs, O365, Twitter, Facebook, etc., or do we have to wait for the 0.7.0? Did not find anything relevant yet ...**

**greggirwin**

**[17:32](#msg5ebd80b413878c30b57c7622)If they have HTTP APIs, yes you can.**

**[17:32](#msg5ebd80cb13878c30b57c76d9)Or you can write a binding in R/S if they have SDKs.**

**pekr**

**[17:33](#msg5ebd80d319af2534f3b1a4ae)How do you specify a header? Have found read/info only ....**

**greggirwin**

**[17:34](#msg5ebd811c519b852e93f0b18b)We need an HTTP page, and ref @rebolek's http-tools as well.**

**https://github.com/red/red/wiki/%5BDOC%5D-Guru-Meditations#how-to-make-http-requests**

**pekr**

**[17:35](#msg5ebd814c2ac6ef4e88c770a9)Thanks ....**

**greggirwin**

**[17:35](#msg5ebd8170519b852e93f0b25a)If you knock out some examples, please make a wiki page. :^)**

**[17:36](#msg5ebd81afecc55a312d021ea6)Bolek's HTTP-tools is in \[here](https://github.com/rebolek/red-tools)**

**Respectech**

**[18:41](#msg5ebd90d22ac6ef4e88c7a4b9)@ALANVF When you have an install and quick start guide ready to go for your code, let me know and I'll be happy to test it on a few systems I have here. I do a lot of Rebol/Red in the browser, but using a less-flexible method.**

**giesse**

**[19:44](#msg5ebd9f8d863019312a5d6261)@hiiamboris my main issue with `reshape` is that it's so different from everything else that it's basically a completely new language to learn. that's not necessarily a bad thing, but i suspect it's bad enough in this specific case.**  
**eg. I prefer to use regular `if ... [...]` or `either ... [...] [...]` syntax instead of coming with a new one, and the newline awareness is way too unique here.**

**greggirwin**

**[19:45](#msg5ebd9fe5ecc55a312d027b75)I was thinking the same thing, for common Red-code building. It's a great example though.**

**[19:46](#msg5ebda00013878c30b57cd742)New things take time to click in my head, so don't want to judge too quickly.**

**hiiamboris**

**[19:56](#msg5ebda28613878c30b57cdd6c)@giesse ;)**  
**Thanks for your thoughts. I agree this version can be too mind bending. At first I wanted to do normal `if`s (but more visible): `(condition) => true-expression || false-expression .` but it turned out to be less readable than this option because there's no separation of conditionals and code.**

**ALANVF**

**[21:13](#msg5ebdb475f3ce603074bbfd82)@Respectech Sure thing! I'm hoping to work on documentation stuff once I get out of school in about a week, so I'll let you know :thumbsup:**

**[21:15](#msg5ebdb4d96675d830b1a7978b)New update for \[Red.js](https://github.com/ALANVF/Red.js) (version 0.0.3):**  
**- Restructured the main Red.js module.**  
**- Switched to polymorphism for the type system.**  
**- Fixed `foreach`, `repeat`, and several `series!`-related actions.**  
**- (Mostly) unified `series!` types interally.**  
**- Optimized a bit more code.**  
**- Fixed bug where existing variables that were re-assigned in a new scope were accidently shadowed.**

**GaryMiller**

**[21:43](#msg5ebdbb99f3ce603074bc0e07)@ALANVF I imagine it's a bit early to tell but since you mentioned optimizing a bit more, have you ran any simple benchmarks to compare the speed of Red.js to regular Red? I imagine Red.js would not have any size restrictions as far as size of programs since TypeScript/JavaScript does not seem to have any. Also I had the impression that some of the source to Red written in R2 or at least the compiler was unavailable but since TypeScript is JIT not having the R2 code would not be a problem?**

**ALANVF**

**[22:13](#msg5ebdc28d519b852e93f16f00)@GaryMiller Re: benchmarks, I haven't run any benchmarks yet because the antivirus on my computer that I'm using to develop Red.js doesn't like Red. I could probably run some benchmarks against R3 at some point though**

**[22:17](#msg5ebdc38370997963d559646c)Re: Compiler, the entire source for Red's compiler is available on GitHub as far as I know, but Red.js is currently interpreted so I haven't really needed to look at Red's compiler anyways**

**[22:18](#msg5ebdc39fecc55a312d02d99c)being able to compile to WebAssembly at some point would be pretty cool though**

****Friday 15th May, 2020****

**cloutiy**

**[00:02](#msg5ebddc1c19af2534f3b28fd8)@ALANVF Your github profile says you're 17 years old. If that's really true, much respect. You have a really bright future ahead of you.**

**ALANVF**

**[00:02](#msg5ebddc2decc55a312d030f57)Thank you :)**

**[00:03](#msg5ebddc55519b852e93f1a97a)yes it's true, I'm 17 and even still in high school**

**greggirwin**

**[00:04](#msg5ebddc8f519b852e93f1a9ea)It's clear you enjoy programming. Keep that joy and your positive attitude. :+1:**

**ALANVF**

**[00:05](#msg5ebddcb55dcf0263d4e6290e)will do :smile:**

**cloutiy**

**[00:05](#msg5ebddccc0fe1ce34f2e6ffd3)@ALANVF Don't know what's more mind-blowing. That code is data and data is code. Or this.**

**ALANVF**

**[00:06](#msg5ebddcf6863019312a5df51f)that's a good question**

**[00:06](#msg5ebddd0370997963d5599b03)I like to think they're both pretty mind-blowing :)**

**greggirwin**

**[00:07](#msg5ebddd37aac441316a7b875a)LOL. Indeed @cloutiy. :^)**

**ALANVF**

**[00:07](#msg5ebddd3eda74582e921cdc79)\[!\[image.png](https://files.gitter.im/red/red/hsFw/thumb/image.png)](https://files.gitter.im/red/red/hsFw/image.png)**

**[00:07](#msg5ebddd3f2ac6ef4e88c8628b)Nice, just got towers of hanoi working in red.js!**

**greggirwin**

**[00:08](#msg5ebddd6cecc55a312d0311ad)Cool. :^)**

**ALANVF**

**[00:08](#msg5ebddd75863019312a5df579)Gonna try doing some performance tests soon**

**[00:08](#msg5ebddd992ac6ef4e88c86362)the only time I've ever purposely optimized Red.js so far is when I was rewriting the lexer**

**greggirwin**

**[00:09](#msg5ebdddd50abb6d4e87f67719)Here's an old Hanoi: https://gist.github.com/greggirwin/5da11ee2893f87ccdfc883f670f70368**

**[00:10](#msg5ebdddf16675d830b1a7f420)Probably needs some updates for newer versions of Red.**

**ALANVF**

**[00:10](#msg5ebdde0628b5313149079402)I'd try that, but I don't have `to` or `pair!`s correctly implemented yet :sweat\_smile:**

**[00:11](#msg5ebdde2d19af2534f3b2942a)oh wait I can't even test that because it uses view lol**

**[00:11](#msg5ebdde36519b852e93f1ae15)nice though :thumbsup:**

**[00:14](#msg5ebddedb13878c30b57d7b94)By the way, there wouldn't happen to be any specs defining the exact behavior of `get-word!` and `lit-word!` function arguments in Red, would there?**

**psilotorp**

**[00:36](#msg5ebde40720d9bf3057668ddb)@ALANVF very excited to check out red.js, thanks for sharing it**

**ALANVF**

**[00:36](#msg5ebde41e13878c30b57d89a4)No problem!**

**[00:37](#msg5ebde4622ac6ef4e88c87148)I've been wanting to share it with the Red community for quite a while, but it wasn't until recently that it was complete-enough for me to be comfortable sharing it :)**

**[00:47](#msg5ebde6b820d9bf30576692fc)Oh, for anybody who has experience with TypeScript and wants to help develop Red.js, I'm planning to work on documenting the source code within the next week or so to make things easier**

**psilotorp**

**[01:00](#msg5ebde9c820d9bf3057669889)This is probably obvious to everyone, but if you are on Catalina, like me, and want to try out red, you can install Mojave as a virtual machine and keep Catalina as a host. Obviously it's far, far from ideal but if you are just obsessively itching to try red that is a solution.**

**[01:06](#msg5ebdeb0f863019312a5e1170)So I just do all my editing in my host and run it via a shared folder in the container**

**GiuseppeChillemi**

**[06:05](#msg5ebe3110519b852e93f2556f)@ALANVF I suppose it is a rewrite of Red from scratch. Is there something you share with the original source code?**

**hiiamboris**

**[08:20](#msg5ebe50bbecc55a312d040e67)&gt; By the way, there wouldn't happen to be any specs defining the exact behavior of `get-word!` and `lit-word!` function arguments in Red, would there?**

**@ALANVF https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#741-function-type**

**pekr**

**[08:32](#msg5ebe53b028b5313149089e5d)Lots of cool talk here recently 😀 Is red.js something as Gabriele' Topaz was for Rebol? I mean, implementation of Red in js?**

**rebolek**

**[09:27](#msg5ebe6092347a503172f0e157)@pekr yes**

**GaryMiller**

**[09:37](#msg5ebe62d2e6f167317500be8a)So how far did Topaz make it and why did it stop?**

**cloutiy**

**[12:57](#msg5ebe91d4e6f16731750131e8)@ALANVF Alan, out of curiosity, have you tried having a web server send a block of red data as a string to have redjs interpret it in the browser?**

**ALANVF**

**[13:08](#msg5ebe9441863019312a5f99e3)@psilotorp I have tried to structure it similarly to how it's structured in Red/System**

**[13:08](#msg5ebe945eecc55a312d04c0fc)@hiiamboris thanks!**

**meijeru**

**[13:47](#msg5ebe9d86aac441316a7d40bb)@ALANVF As the principal author of the specs document that hiiamboris referred to, I am of course happy to recommend it :smirk: -- however, (as also remarked in the introduction) the final source of information on how Red behaves is the source code of the toolchain -- but I understand you are consulting that also.**

**ALANVF**

**[15:20](#msg5ebeb33f20d9bf3057687638)yes, I have been :thumbsup:**

**greggirwin**

**[16:37](#msg5ebec543b7b93c3189d17529)@psilotorp, thanks for posting! Would you please add a note to https://github.com/red/red/wiki/%5BDOC%5D-Installing-Red-and-Getting-Started, maybe a subsection under MacOS specifically for Catalina? Thanks!**

**meijeru**

**[17:16](#msg5ebece5f49a1b7318478eeb6)Following my improved understanding of `load/save` (see recent conversation in `red/help`) I am still puzzled about one thing: `save` without `/as` produces a molded value, that should be reconstructed by `load`. But for types that have no literals this does not work directly. See this example:**  
**`>> i: make image! 2x2 == make image! [2x2 #{FFFFFFFFFFFFFFFFFFFFFFFF}] >> save %test.txt i >> read %test.txt == "make image! [2x2 #{FFFFFFFFFFFFFFFFFFFFFFFF}]" >> load %test.txt == [make image! [2x2 #{FFFFFFFFFFFFFFFFFFFFFFFF}]] >> type? first load %test.txt == word! >> reduce load %test.txt == [make image! [2x2 #{FFFFFFFFFFFFFFFFFFFFFFFF}]] >> first reduce load %test.txt == make image! [2x2 #{FFFFFFFFFFFFFFFFFFFFFFFF}] >> type? first reduce load %test.txt == image!`**  
**Note the subtle difference between `load` and `reduce load`. The problem is that the molding of an image value produces three values, and therefore `load` puts them in a block as three unreduced values. It takes `first reduce` to reconstruct the original value.**

**greggirwin**

**[17:25](#msg5ebed09613878c30b57fdc79)@meijeru we don't have `mold/all save/all` support yet, pending final "construction syntax" (serialized form) for all types. When we get there, another important note for the specs is that `load/all` is \*not* an inverse of `save/all`. Naming is tricky there, and Rebol compatible.**

**GiuseppeChillemi**

**[20:42](#msg5ebefe9e16ae6a315f1f46ff)@greggirwin what is a serialized form?**

**[20:44](#msg5ebeff1e6675d830b1aacd67)Also another question: I suppose red emits x86 code when running or in compiled form. Which are the relevant files in the repository? How does it work the passage from Red to machine code?**

**greggirwin**

**[21:02](#msg5ebf035e863019312a60da11)**  
**`>> b: [none #[none] true #[true]] == [none none true true] >> foreach v b [print type? v] word none word logic`**

**[21:04](#msg5ebf03e3ecc55a312d0601ce)`red/system/targets/`**

**GiuseppeChillemi**

**[23:23](#msg5ebf2474eb9b6f3162263ed3) I see a sequence of types but I don't understand if `none` is returned because `#[none]` is not implemented or because it is the correct output: Have to see a more real example with some "human words" :)**

**greggirwin**

**[23:33](#msg5ebf26c720d9bf305769ac6f)Does this help?**  
**`>> type? first [none] == word! >> type? first [#[none]] == none!`**

**GiuseppeChillemi**

**[23:44](#msg5ebf2956347a503172f2fce1)No, :( I see something I know but I don't understand in the context of the following phrase:**

**&gt;&gt; we don't have mold/all save/all support yet, pending final "construction syntax" (serialized form) for all types**

**Is this `first [none]` a fully implemented form and this `first [#[none]]` a form which is not fully implemented ?**

****Saturday 16th May, 2020****

**greggirwin**

**[00:17](#msg5ebf311fecc55a312d067379)`none` is just a word, if you have it in a block. You have to evaluate it to get `none!` as a value. But `#[none]` is a serialized form of `none!`. It's just that only a few serialized forms are implemented today. Eventually all datatypes will have them.**

**GiuseppeChillemi**

**[00:35](#msg5ebf3538aac441316a7ed1ba)Ok, I am understanding it. Good night**

**ALANVF**

**[01:18](#msg5ebf3f7e0e8a3131e4c42a6e)does anyone know if there's a Discord api for Red or Rebol?**

**[01:21](#msg5ebf4002ecc55a312d069119)I've seen \[this](https://github.com/CFTheMaster/discord.red), but it just a port of Go's discord api, it doesn't even work, and the repo has been archived**

**[18:56](#msg5ec03774b7b93c3189d4bc55)New update for \[Red.js](https://github.com/ALANVF/Red.js) (version 0.0.4):**  
**- Fixed `set-path!`s (so now `a/1/2: 3` works).**  
**- Fixed an issue where `path!`s were evaluated twice.**  
**- Fixed various `paren!` bugs.**  
**- `unset!`, `none!`, and `logic!` values are now treated as singletons to speed things up.**

**dockimbel**

**[19:59](#msg5ec04604f3ce603074c1fd68)@ALANVF Is there a web page somewhere with a simple console for playing with Red.js?**

**ALANVF**

**[19:59](#msg5ec046220e8a3131e4c670f2)No not yet, but I'm hoping to work on it soon!**

**[20:00](#msg5ec046420e8a3131e4c67123)Once I get out of school in a few days, I'm hoping to create a web playground for Red.js so people can try it out**

**dockimbel**

**[20:09](#msg5ec04871863019312a63a181)Great! Let us know when it's available, so we can advertise it.**

**ALANVF**

**[20:09](#msg5ec0487928b53131490d44f4)Will do :thumbsup:**

**[20:09](#msg5ec04887ecc55a312d08da09)thanks for having interest in my project :)**

**[21:40](#msg5ec05db6ecc55a312d090b21)Ok so it's not a "website" exactly, but I've made a project using repl.it that uses Red.js compiled to javascript to run the Red.js interactive repl: https://redjs-compiled-repl.theangryepicbanana.repl.run/**

**[21:41](#msg5ec05e11f3ce603074c22e2f)I'll still have to manually update it every so often, but this should be pretty good for now**

**[21:44](#msg5ec05ea7e6f16731750568e9)@dockimbel do you think that could be sufficient until I get an actual website up and going?**

**meijeru**

**[21:45](#msg5ec05efa0e8a3131e4c6a602)This is already quite impressive!**

**ALANVF**

**[21:45](#msg5ec05f17eb9b6f316228fb18)ah, thanks!**

**GiuseppeChillemi**

**[21:46](#msg5ec05f2df3ce603074c23096)\[!\[image.png](https://files.gitter.im/red/red/7RYf/thumb/image.png)](https://files.gitter.im/red/red/7RYf/image.png)**

**[21:46](#msg5ec05f3a16ae6a315f224d1b)Yes! Nice work!**

**ALANVF**

**[21:46](#msg5ec05f42eb9b6f316228fb41)thanks! :)**

**[21:47](#msg5ec05f8d863019312a63d59b)there's still a lot of work to be done, but I'm very happy that it has been able to come this far already**

**GiuseppeChillemi**

**[21:48](#msg5ec05fb1eb9b6f316228fcd5)I will rub your head when we will meet too express a couple of extra desires other than having Red in the browser.**

**greggirwin**

**[21:48](#msg5ec05fc7347a503172f5a5de)Indeed! Very nice @ALANVF. :+1:**

**ALANVF**

**[21:49](#msg5ec05fe7863019312a63d60e)thank you**

**[21:50](#msg5ec06034347a503172f5a681)@GiuseppeChillemi I don't think I understood all of that :sweat\_smile:**

**greggirwin**

**[21:51](#msg5ec06061e6f1673175056c58)@ALANVF neither did I. But take it as a nice comment. :^)**

**[21:51](#msg5ec0606590f6db31beeeb44e)\[!\[image.png](https://files.gitter.im/red/red/IxaO/thumb/image.png)](https://files.gitter.im/red/red/IxaO/image.png)**

**ALANVF**

**[21:52](#msg5ec060806675d830b1ade28f)yeah that's what I got from it**

**GiuseppeChillemi**

**[21:53](#msg5ec060c990f6db31beeeb4ee)You have to Rub the lamp of the Genius to have your wishes fulfilled. So when we will meet in a DevCon, I will rub your head to have more desires fulfilled other than the one you are already realizing: Red in the browser.**

**[21:53](#msg5ec060e320d9bf30576c5f5a)(Hope it is now more clear! and yes, it is very positive!)**

**greggirwin**

**[21:54](#msg5ec0610d347a503172f5a7e6):+1: :^)**

**[21:54](#msg5ec06127eb9b6f3162290003)Make smoking good ideas come out of @ALANVF's head.**

**ALANVF**

**[21:54](#msg5ec06129b7b93c3189d514c7):thumbsup:**

**[21:55](#msg5ec0614228b53131490d7afb)yeah I like to think that :smile:**

**[21:56](#msg5ec061a0f3ce603074c235d3)thank you all for the support :)**

**[21:56](#msg5ec061a6aac441316a8167c7)I can't even express it enough**

**greggirwin**

**[21:58](#msg5ec061efeb9b6f31622901df)It's very cool what you're doing, and I think you were wise to wait until you had a certain amount working before showing us, because we will immediately bang on it and find its limits. Having some of the basics "just work" tells us a lot.**

**ALANVF**

**[22:00](#msg5ec0626916ae6a315f2254a8)yeah, I knew that it'd be a lot more impressive to show off once I had a good amount of features implemented, rather than only having the parser finished or something**

**[22:03](#msg5ec0633120d9bf30576c6404)because starting with more features helps to show that it's actually a serious project rather than a small side project**

**GiuseppeChillemi**

**[22:04](#msg5ec06357f3ce603074c238f1)To me it's already impressive. I am not a pro, so everything is incredible to me!**

**greggirwin**

**[22:05](#msg5ec063a6b7b93c3189d5196a)\[!\[image.png](https://files.gitter.im/red/red/M9Pk/thumb/image.png)](https://files.gitter.im/red/red/M9Pk/image.png)**

**ALANVF**

**[22:05](#msg5ec063c3b7b93c3189d51983)hmm I thought I fixed append for strings**

**greggirwin**

**[22:06](#msg5ec063e7b7b93c3189d51991)It's the extra `copy` that does it.**

**[22:06](#msg5ec063ea49a1b731847c8501)\[!\[image.png](https://files.gitter.im/red/red/AoXe/thumb/image.png)](https://files.gitter.im/red/red/AoXe/image.png)**

**ALANVF**

**[22:06](#msg5ec063f7e6f167317505745b)ah probably**

**[22:07](#msg5ec06422b7b93c3189d519d3)now that I think about it, I should really make a checklist of what features are and aren't currently implemented so far**

**[22:07](#msg5ec06437e6f16731750574b2)think it would make everyone's lives easier**

**greggirwin**

**[22:08](#msg5ec0644213878c30b5836ed3)That would be great. And we can set up a new room here to focus feedback for you.**

**ALANVF**

**[22:08](#msg5ec0644d20d9bf30576c659d)ah that'd be great!**

**[22:08](#msg5ec0645349a1b731847c85bd)thank you**

**greggirwin**

**[22:10](#msg5ec064db90f6db31beeebbf8)https://gitter.im/red/red.js**

**ALANVF**

**[22:10](#msg5ec064e949a1b731847c86bc):thumbsup:**

****Sunday 17th May, 2020****

**ALANVF**

**[00:43](#msg5ec088a26675d830b1ae2ebf)Feature progress for Red.js is now documented here: https://github.com/ALANVF/Red.js/blob/master/FEATURES.md**

**meijeru**

**[08:35](#msg5ec0f749eb9b6f31622a1e80)I compliment you again. I have some questions but they go to the dedicated room.**

**ALANVF**

**[19:06](#msg5ec18b26347a503172f81c3d)Oh, what's this? https://github.com/red/red/blob/master/runtime/datatypes/vector2d.reds**

**[19:06](#msg5ec18b2a6675d830b1b05290)seems cool**

****Monday 18th May, 2020****

**dockimbel**

**[23:01](#msg5ec313d37da13f3a0ac0ec12)Looks like an error to me. @qtxie ^---**

**qtxie**

**[23:31](#msg5ec31ac06773a13b23ecaede)@ALANVF There are some functions perform vector related operations in this file. It's the `vector` in mathematics, not the `vector!` datatype in Red. It's used in the image perspective transformation algorithm.**

**[23:31](#msg5ec31ade990d343a5f37ddc6)@dockimbel You mean it's in the wrong folder?**

****Tuesday 19th May, 2020****

**ALANVF**

**[01:30](#msg5ec336b37da13f3a0ac13db8)@qtxie ah ok. a 2d vector type would be pretty cool to have in red at some point though**

**dockimbel**

**[08:35](#msg5ec39a4af7c0af39ee17a04a)&gt; @dockimbel You mean it's in the wrong folder?**

**Yes, it should not be there.**

**meijeru**

**[12:55](#msg5ec3d731940fa238d600f6bd)It looks like an addition to `%image-utils.reds` so it could be incorporated inside that file...**

****Wednesday 20th May, 2020****

**BeardPower**

**[11:20](#msg5ec51299e06728175b7d965a)I want to call refinements based on the content of a block. Is there a "better" or "nicer" way for doing that instead of this?:**

**`a: [left right] b: func [/left][if left [print "l"]] do rejoin ['b "/" (a/1)]`**

**rebolek**

**[11:38](#msg5ec5169fe06728175b7da3f7)for example `do make path! reduce ['b a/1]`**

**BeardPower**

**[11:47](#msg5ec518d1c6541c05d8ec6309)The disadvantage of this is that I cannot use 'left but in my example I can use left and 'left in the a block.**

**[11:48](#msg5ec519069d1d2310cc378061)**  
**`>> do make path! reduce ['b a/1] *** Script Error: b has no refinement called 'left *** Where: b *** Stack: b >> do make path! reduce ['b 'left] l`**

**[11:49](#msg5ec5193663c8e90e43fdbc31)Is this a bug? Why does 'left work if used directly but not reduced from a/1?**

**[11:49](#msg5ec5195526d26710bba851e8)**  
**`>> a == ['left right]`**

**[11:50](#msg5ec5196826d26710bba851f5)Shouldn't it work both ways?**

**[11:53](#msg5ec51a1cd7f8a20ddf7f9331)**  
**`>> a: ['left] == ['left] >> reduce ['b 'left] == [b left] >> reduce ['b a/1] == [b 'left]`**

**[11:53](#msg5ec51a35e06728175b7dad11)A bug? By design?**

**rebolek**

**[11:54](#msg5ec51a6f9832dd6f0463a9db)I don't understand why you have `['left right]`**

**BeardPower**

**[11:55](#msg5ec51a96e06728175b7dae44)As a test do see the different outcome of reducing a/1 or using 'left directly.**

**[11:55](#msg5ec51aa63be96c0df994003e)As you can see in the example above.**

**rebolek**

**[11:55](#msg5ec51aa663c8e90e43fdc1e6)don't forget that when you pick from block, the value is not evaluated**

**dockimbel**

**[11:55](#msg5ec51aabb761400e29d83272)@BeardPower Nothing wrong there. `'b` evaluates to `b` and `a/1` evaluates to `'left`. There is no "double" or recursive evaluation.**

**rebolek**

**[11:55](#msg5ec51aaca1aa566f083965ad)if you use it directly, it is**

**BeardPower**

**[11:56](#msg5ec51ad76e837c7743c1308e)@dockimbel Yeah, I noticed. I just used \['left] to make sure that I don't get an error if I reduce the block by accident.**

**[11:56](#msg5ec51b0b3d81ad775846e6e6)**  
**`>> a: [left] == [left] >> reduce a *** Script Error: left has no value *** Where: reduce *** Stack:`**

**dockimbel**

**[11:57](#msg5ec51b20e4e9556b5c8eaef7)@BeardPower If you have to dynamically call a function with or without a refinement, better make that refinement a mandatory argument to the function then.**

**BeardPower**

**[11:57](#msg5ec51b233be96c0df994013e)**  
**`>> a: ['left] == ['left] >> reduce a == [left]`**

**dockimbel**

**[11:58](#msg5ec51b4fa1aa566f08396811)@BeardPower That's basic Red evaluation rules. A word evaluates to its value in its context. A lit-word evaluates to a word.**

**BeardPower**

**[11:58](#msg5ec51b65a1aa566f083968a7)@dockimbel Yeah, that would mitigate some of those "issues".**

**[12:01](#msg5ec51c3526d26710bba85f1d)@dockimbel What would you suggest: using "do to-path" or "do rejoin" if I want to still use the "dynamic calling"?**

**rebolek**

**[12:02](#msg5ec51c5263c8e90e43fdc793)certainly not `rejoin`**

**BeardPower**

**[12:03](#msg5ec51c756e837c7743c136fa)Why not?**

**rebolek**

**[12:09](#msg5ec51de763c8e90e43fdccd4)It's slow, ugly , doesn't follow \*data as code* principle, ...**

**[12:09](#msg5ec51e0f26d26710bba86674)`rejoin` is for strings**

**BeardPower**

**[12:11](#msg5ec51e8dc6541c05d8ec778a)strings are just data as well.**

**[12:12](#msg5ec51eb4e06728175b7dbe8b)And I use that data as code so it still follows that principle.**

**[12:13](#msg5ec51ed3e06728175b7dbf55)But it being slow is a good argument. Thanks for the input!**

**dockimbel**

**[12:13](#msg5ec51ed50fbf8b1758823114)@BeardPower `to-path` as much as possible. Building code dynamically using strings has a high overhead when serializing/loading.**

**BeardPower**

**[12:13](#msg5ec51ee463c8e90e43fdd0e1)Alright!**

**[12:14](#msg5ec51f143d81ad775846f744)I assume make-path is calling the same function as to-path?**

**dockimbel**

**[12:14](#msg5ec51f1d9832dd6f0463bacd)&gt; And I use that data as code so it still follows that principle.**

**Not really, there are no "values" in string buffers, only a stream of characters. So it's just text and not Red values anymore. You loose all the typing/binding/... info. When we mention "data as code", we are talking about \*loaded* values.**

**BeardPower**

**[12:15](#msg5ec51f6ac6541c05d8ec79ac)Yes, but I just wanted to point out that machine code is also a stream of characters. Depending on what those characters are, the machine will interpret it as code or as data.**

**[12:16](#msg5ec51fa4d7f8a20ddf7fa3ad)Ah, I understand.**

**dockimbel**

**[12:17](#msg5ec51fc6cf55346b5fbbec4c)@BeardPower In Redbol world, text input is not directly interpreted as code. It goes through a \*loading* phase that converts it to Red values. Then the values are interpreted/compiled according to the main language semantic rules or according to a dialect rules. That's a foundamental difference with most other programming languages out there.**

**BeardPower**

**[12:17](#msg5ec51ff46e837c7743c145f7):thumbsup:**

**[12:19](#msg5ec52049b761400e29d84731)This helps me explaining Red to others!**

**[12:22](#msg5ec520eba1aa566f08397f82)@dockimbel You said that "you loose" all the typing. Do you really mean loosening the binding or losing it?**

**rebolek**

**[12:22](#msg5ec520f7cf55346b5fbbf0de)losing**

**BeardPower**

**[12:22](#msg5ec52103e4e9556b5c8ec781)Thanks.**

**rebolek**

**[12:23](#msg5ec5215e13b79205dc86a4e5)**  
**`>> reduce [in object [a: 1] 'a in object [a: 2] 'a] == [a a] >> reduce reduce [in object [a: 1] 'a in object [a: 2] 'a] == [1 2] >> form reduce [in object [a: 1] 'a in object [a: 2] 'a] == "a a" >> load form reduce [in object [a: 1] 'a in object [a: 2] 'a] == [a a] >> reduce load form reduce [in object [a: 1] 'a in object [a: 2] 'a] *** Script Error: a has no value *** Where: reduce *** Stack:`**

**BeardPower**

**[12:24](#msg5ec5216163c8e90e43fddd80)@rebolek Your suggestion using make-path/to-path works great!**

**Shaping**

**[13:53](#msg5ec53675a1aa566f0839cdbb)Hi everyone. I've just rediscovered Red after almost a decade away. I just tried to join the Google group, but the server failed. This is not a general GG problem. My other groups are working. Should I not bother with the GG? Is this the best place to communicate about technical issues?**

**rebolek**

**[13:57](#msg5ec5375fc6541c05d8ecd7d7)@Shaping Hi! Most communication happens here, don't bother with GG.**

**hiiamboris**

**[13:58](#msg5ec5377fa1aa566f0839d38b)Hi @Shaping and welcome ;)**  
**GG must be abandoned, all life is here mostly ☻**  
**This room is mainly for language design discussions, https://gitter.im/red/help for learning and https://gitter.im/red/bugs for discussing issues.**

**Shaping**

**[13:59](#msg5ec537c80fbf8b17588289fa)I'm a 25-year Smalltalker (mostly VisualWorks and Pharo). I'm looking for a dynamic programming experience in Red, with a leaning toward actor-based programming and efficient use of multicore CPUs. Can you tell me what is happening with the JIT? Is there an effort to parallelize Red? If you are looking for ideas on the concurrent collector needed by actors with small heaps, consider Pony-Orca (https://www.ponylang.io/) and Verona (https://github.com/microsoft/verona), which will probably replace the current Orca -based runtime/collector.**

**[13:59](#msg5ec537d9e4e9556b5c8f1c2e)Hi @hiiamboris. Okay I'll post in those three rooms.**

**[14:04](#msg5ec538d33d81ad775847523a)https://www.ponylang.io/media/papers/orca\_gc\_and\_type\_system\_co-design\_for\_actor\_languages.pdf**

**[14:04](#msg5ec538dd9832dd6f04640c75)Above is a good paper on Orca.**

**PierreChTux\_twitter**

**[14:06](#msg5ec5396d63c8e90e43fe2b78)Hi, and welcome here!**  
**&gt; I'm a 25-year Smalltalker (mostly VisualWorks and Pharo).**

**Funny, one of the most proficient French writers about Rebol and Red, Mr Olivier Auverlot, is also a Smalltalker and Pharoist!**

**[14:07](#msg5ec539a63be96c0df99473ad)Maybe there is some kind of relationship between Red/Rebol and Smalltalk?**

**Shaping**

**[14:22](#msg5ec53d13c6541c05d8ece969)Well, there is based on syntax preferences: I very much like the colons, the spaces and the huge lack of unneeded parentheses and commas. The ordering however is reversed in some ways. I would like to experiment with syntax and postfix actions (as modifiers in the grammatical sense). This makes any Red express amenable to display in a tree, which is where I'm going with code (not free-form text in a method pane or text editor). But I need to be fluent with the existing syntax first.**

**[14:22](#msg5ec53d3063c8e90e43fe3909)The Red Console windows needs work**

**[14:22](#msg5ec53d389d1d2310cc37fe42)Fonts don't really work correctly**

**[14:23](#msg5ec53d47e4e9556b5c8f302b)I can't get FiraCode or FixedSys to display.**

**[14:23](#msg5ec53d5ed7f8a20ddf800aff)Also, the prompt is not lined up with the font, if you make it a little large.**

**[14:24](#msg5ec53dbbe06728175b7e249c)Has anyone proposed a hierarchical kind of browser for Red expressions? I understand the minimalist way, but a text editor, even a good one, is too bare for me. I want smaller bit of text to look at with each click, as in a 5-pane Smalltalk browser, when clicking on method selectors.**

**hiiamboris**

**[14:28](#msg5ec53e81e4e9556b5c8f3567)@Shaping Red has not reached it's concurrency and JIT milestones yet (\[roadmap](https://trello.com/b/FlQ6pzdB/red-tasks-overview)), but actor model is planned for it as you have guessed.**

**There is also no IDE yet, although I might reinvent an object browser in a few weeks, as I'm using parts of it anyway.**

**Console bugs should be reported to the /bugs room for confirmation (with the explanation how to reproduce them). "FixedSys" most likely won't be supported btw as it's not DirectDraw compatible IIRC.**

**[14:29](#msg5ec53ec8b761400e29d8b976)@Shaping What kind (or domain) of projects would you like to use Red for?**

**pekr**

**[14:49](#msg5ec5439663c8e90e43fe5954)@Shaping Before Rebol was created, I have found out Smalltalk, but that's more than 20 year ago :-) Carl himself mentioned Smalltalk several times.**

**PierreChTux\_twitter**

**[15:00](#msg5ec546193be96c0df994a8c0)&gt; https://www.ponylang.io/media/papers/orca\_gc\_and\_type\_system\_co-design\_for\_actor\_languages.pdf**

**I thought you were referring to the project ORCA which stands for "Open-source Rebol Can be Achieved": http://freshmeat.sourceforge.net/projects/rebol-orca**

**But obviously, the Orca you mentioned is another subject.**

**It seems like the global namespace is getting a bit narrow, with a few name conflicts, isn't it? :-s**

**endo64**

**[15:07](#msg5ec5479dc6541c05d8ed0ee5)@Shaping Welcome, check also other Gitter rooms by clicking the globe symbol upper-right corner.**

**ALANVF**

**[15:47](#msg5ec5511463c8e90e43fe904b)Ah nice, always awesome to see Smalltalk users :thumbsup:**

**[15:48](#msg5ec5513513b79205dc875067)Pharo is also cool**

**PierreChTux\_twitter**

**[15:48](#msg5ec5515513b79205dc875140)Hm. I think I should definitely try that Smalltalk thing...**

**ALANVF**

**[15:48](#msg5ec551679d1d2310cc3845b3)I'd recommend it**

**[15:49](#msg5ec551833be96c0df994d141)using a smalltalk language like Pharo is definitely a fun experience**

**PierreChTux\_twitter**

**[15:50](#msg5ec551d7d7f8a20ddf8059ef)Okay, will do. This should be around the 5435th line on my to-do list.**

**ALANVF**

**[15:51](#msg5ec551e5d7f8a20ddf805a13)lol ;)**

**greggirwin**

**[17:49](#msg5ec56da8cf55346b5fbcf789)Welcome @Shaping. Feel free to try this \[object browser](https://gist.github.com/greggirwin/91dc1c3971998e0babeedba9f7e60bc5) and report any issues. It's a port of an old R2 script.**

**[17:50](#msg5ec56e0126d26710bba97957)Note that the `Set Value` feature isn't implemented. Should put a TBD message behind that button. :^)**

**hiiamboris**

**[17:58](#msg5ec56fb4cf55346b5fbcfc13)At least this one works! :+1:**

****Thursday 21st May, 2020****

**Shaping**

**[03:21](#msg5ec5f3ab26d26710bbaab0ca)My domain is math-modeling/simuation/3D graphics. I have a strong interest as well in language ergonomics and language design.**

**[03:32](#msg5ec5f659cf55346b5fbe3277)Hi @greggirwin. I just compiled the object browser. It's up, but I can't resize the window. And I really need to choose a different font and size.**

**[03:34](#msg5ec5f6b1e06728175b800e0f)Nice speed. I prefer action on single-click leading edge. How can I change that? You can't make the tactile aspects of a GUI too fast. Every bit of extra speed greatly improves mental continuity and reduces fatigue.**

**hiiamboris**

**[07:55](#msg5ec633e7e4e9556b5c91991e)&gt; Every bit of extra speed greatly improves mental continuity and reduces fatigue.**

**That's why I never considered using any Electron bloat for an editor. I always thought it's only me who feels that way though ;)**

**Shaping**

**[08:41](#msg5ec63eb96e837c7743c433d6)Yup. You're right. I use VS Code (Electron), but the feel is a bit soft, but still much snappier than Pharo. Go look in the Pharo dev list about how I'm trying to show everyone that after 12 years of development the input loop is processing key events and clicks too slowly. The latencies put me to sleep. I'll probably correct the event loop someday, if someone else doesn't do it first. But Pharo currrently just looks great. It does not feel great or even good. It feels mushy and there are measurable reasons for that. And no one noticed or complained for 12 years. WTF?**

**ALANVF**

**[17:01](#msg5ec6b3f5225dc25f54994c78)Have you tried mentioning it on pharo's discord server or something?**

**greggirwin**

**[19:25](#msg5ec6d5a83ffa6106f1c70871)@Shaping \[basic resizing added](https://gist.github.com/greggirwin/91dc1c3971998e0babeedba9f7e60bc5)**

**[19:26](#msg5ec6d5ca7da67d06fac2c093)&gt; I prefer action on single-click leading edge**

**I don't know what that means.**

**[19:27](#msg5ec6d6134c9b0f060d165391)If you read up on \[VID](https://doc.red-lang.org/en/vid.html), adding font selection is a good exercise. :^)**

**hiiamboris**

**[19:28](#msg5ec6d65c27513a72fba4e821)&gt; Where is Boris' `elastic` when you need it? ;^)**

**It's where it always was https://gitlab.com/hiiamboris/red-elastic-ui ;)**

**[19:29](#msg5ec6d69e778fad0b131a6079)It's a dependency though ;)**

**greggirwin**

**[19:29](#msg5ec6d6af7da67d06fac2c361):^)**

**[19:30](#msg5ec6d6d089941d051a14a28c)More a time constraint in the moment.**

****Friday 22nd May, 2020****

**Shaping**

**[11:59](#msg5ec7bea84412600ccd5ed7df)@alan.invents, I've done this extensively in pharo-dev and vm-dev. I've not mention it in the Discord, which is where I'm currently discussing Seaside issues, which I'm not digging into for the first time. Perhaps the folks there are more inclined to do something about it. I don't current have time to dig into Pharo code.**

**[12:02](#msg5ec7bf3b778fad0b131c6866)@Gregg Irwin, 'leading-edge' is the digit-signal notational equivalent of the mouse button down event, which always leads mouse button up event, in any click-event scenario.**

**[12:17](#msg5ec7c2e1b101510b200defaa)@greggirwin , I get the following error when compiling: Compiling F:\\\_personal\\red projects\\objectBrowserWithResizing.red ...**  
**...using libRedRT built on 20-May-2020/11:36:53**  
**\*\** Red Compiler Internal Error: Script Error : Invalid path value: ctx491**

**[12:18](#msg5ec7c30b225dc25f549bbe94)The old code still compiles. So is the problem in the new code or in my build config?**

**[12:21](#msg5ec7c3b77da67d06fac4d656)&gt; @alan.invents, I've done this extensively in pharo-dev and vm-dev. I've not mention it in the Discord, which is where I'm currently discussing Seaside issues, which I'm not digging into for the first time. Perhaps the folks there are more inclined to do something about it. I don't current have time to dig into Pharo code.**

**typo: now digging into for the first time.**

**[12:22](#msg5ec7c4233ffa6106f1c91610)I'm wondering whether using Smalltal to host Red is a better path. This way I can develop a top-notch GUI for representing all Red code and then later when I'm more fluent with Red, rewrite the browser in Red too. This would be a convenient Smalltalk bootstrap of the Object Browser.**

**[12:24](#msg5ec7c47a89941d051a16bdca)6. Faces definition**

**A face can be inserted in the layout, at the current position, simply by using the name of an existing face type or one of the available styles.**

**[12:24](#msg5ec7c4884c9b0f060d186d09)So where is the actual definition of the term 'face'?**

**hiiamboris**

**[12:27](#msg5ec7c5394412600ccd5ee5b2)Have you looked at https://doc.red-lang.org/en/view.html ?**

**[12:45](#msg5ec7c95489941d051a16ca11)The glitch there is because of `object` in place of `make object!`.**  
**@dockimbel is it expected that we get internal compiler error from that?**

**dockimbel**

**[12:55](#msg5ec7cbb0f0b8a2053aa80bb6)@hiiamboris Can't say without reproducing the issue locally and examining the compiler output first. Probably not expected, but he seems to be using libRedRT, so in such cases, there are known limitations about objects compilation (like limited "inheritance" support). If you can reproduce the issue, please open a ticket so it's not lost.**

**hiiamboris**

**[12:55](#msg5ec7cbbb27513a72fba714f0)okay \[done](https://github.com/red/red/issues/4463)**

**Shaping**

**[14:46](#msg5ec7e5ad2c49c45f5a963927)I'm not understanding the problem. libRedRT is a standard component of Red. What would it have limited inhertance support?**

**dockimbel**

**[15:31](#msg5ec7f05e225dc25f549c365c)@Shaping**  
**&gt; libRedRT is a standard component of Red**

**That's an odd way to define it. LibRedRT is an early attempt at incremental compilation support, by precompiling the Red runtime library and saving the compiler internal state for re-use in another compilation job. There is no simple way to save the states corresponding to object inheritance support that way for re-use in another compilation session (internal context binding is lost). That is what we call "development mode" compilation (vs "release mode" compilation). The existence of libRedRT is contingent on that specific compilation mode, it's not used anywhere else. So it's just a temporary disposable support file for faster compilations in "dev" mode.**

**pekr**

**[17:10](#msg5ec807a02c49c45f5a9694c2)libRed &lt;&gt; libRedRT, right?**

**[17:13](#msg5ec8082b4c9b0f060d192a5b)@greggirwin just spotted your object browser. Looks really nice. I wonder, if such tools could become part of some of the language setups, e.g. packed with gui console, so that users could inspect objects?**

**greggirwin**

**[20:42](#msg5ec83927225dc25f549cf206)@Shaping, use the `on-mouse-down` event for your "leading edge" event.**

**There are ways around compiler issues. My most common is just to run interpreted. But compiling with `-e` (encap mode) also allows more dynamic code to be compiled. That works in this case. But it sounds like @hiiamboris tracked it down even more. I updated the \[gist](https://gist.github.com/greggirwin/91dc1c3971998e0babeedba9f7e60bc5) so it compiles without `-e` now as well.**

**&gt; I'm wondering whether using Smalltalk to host Red is a better path. This way I can develop a top-notch GUI for representing all Red code**

**If you're new to Red, but know Smalltalk, sure. But be aware that Red is its own data format, and Smalltalk won't know anything about that, so can only treat it as text. An interesting experiment to be sure, and a way to compare multiple approaches.**

**&gt; libRed &lt;&gt; libRedRT, right?**

**Correct @pekr. libRedRT is just an external version of the runtime, while libRed is an API to use Red from other languages.**

**Things like the object browser, or MaximV's old GUI `help` system can certainly be built in. Worth some chat to see what people think.**

****Saturday 23th May, 2020****

**Shaping**

**[04:45](#msg5ec8aa854c9b0f060d1a8676)&gt; @Shaping**  
**&gt; &gt; libRedRT is a standard component of Red**  
**&gt;**  
**&gt; That's an odd way to define it. LibRedRT is an early attempt at incremental compilation support, by precompiling the Red runtime library and saving the compiler internal state for re-use in another compilation job. There is no simple way to save the states corresponding to object inheritance support that way for re-use in another compilation session (internal context binding is lost). That is what we call "development mode" compilation (vs "release mode" compilation). The existence of libRedRT is contingent on that specific compilation mode, it's not used anywhere else. So it's just a temporary disposable support file for faster compilations in "dev" mode.**

**Why is it odd? LibRedRT is part of the system if the system creates it in the course of doing work. Why would the file cause the stated "inhertitance" problem?**

**[04:49](#msg5ec8ab4c549761730b50cf2a)@greggirwin @greggirwin**  
**&gt; @Shaping, use the `on-mouse-down` event for your "leading edge" event.**  
**&gt;**  
**&gt; There are ways around compiler issues. My most common is just to run interpreted. But compiling with `-e` (encap mode) also allows more dynamic code to be compiled. That works in this case. But it sounds like @hiiamboris tracked it down even more. I updated the \[gist](https://gist.github.com/greggirwin/91dc1c3971998e0babeedba9f7e60bc5) so it compiles without `-e` now as well.**  
**&gt;**  
**&gt; &gt; I'm wondering whether using Smalltalk to host Red is a better path. This way I can develop a top-notch GUI for representing all Red code**  
**&gt;**  
**&gt; If you're new to Red, but know Smalltalk, sure. But be aware that Red is its own data format, and Smalltalk won't know anything about that, so can only treat it as text. An interesting experiment to be sure, and a way to compare multiple approaches.**  
**&gt;**  
**&gt; &gt; libRed &lt;&gt; libRedRT, right?**  
**&gt;**  
**&gt; Correct @pekr. libRedRT is just an external version of the runtime, while libRed is an API to use Red from other languages.**  
**&gt;**  
**&gt; Things like the object browser, or MaximV's old GUI `help` system can certainly be built in. Worth some chat to see what people think.**

**In what context and where is on-mouse-down event used to create a leading-edge mouse click response. You guys know that this stuff can be much better organized for reading (speed-reading), right?**

**[04:50](#msg5ec8ab97f0b8a2053aaa20d3)Yes, Smalltalk will treat Red as text and off load it to the compiler, until the browser can be written in Red too.**

**[04:52](#msg5ec8abf19da05a060a263bb9)What is an external version of a runtime? Why are there two runtimes? Where is the internal runtime?**

**temperfugit**

**[05:40](#msg5ec8b74189941d051a18e5ec)@Shaping Regarding left mouse click, `down` is the left mouse click event so in the appropriate part of the View block you would use:**  
**`on-down [code to execute goes in this block]`**  
**The event names are \[here](https://doc.red-lang.org/en/view.html#\_event\_names) (section 11.1, the link is taking me to the wrong section), and `on-` is the general syntax in a View block. I would also recommend checking out \[helpin.red](http://helpin.red/EventsandActors.html) to get your footing, I sometimes find it easier to read than the official documentation (but the documentation is more thorough).**

**Shaping**

**[06:27](#msg5ec8c25dff7a920a7207710a)Can someone explain what Red/Pro is? I read about it in Reddit. Has that happened yet?**

**[06:46](#msg5ec8c6da3ffa6106f1cb65bb)http://helpin.red/EventsandActors.html does look better. I'll give it a go. For the new guy, like me, you really want a single bold root node at which to start. That root should fan out gently into a not-so-wide tree and then take you back to the main trunk so that you can continue the learning journey in a logic way, which the creators of Red would know best.**

**[06:47](#msg5ec8c6ea4412600ccd6126f0)I really like the idea of a full stack PL. It's exciting**

**[06:48](#msg5ec8c7399da05a060a266e51)Then the only stuff left is the markup languages (HTML and similar), data encodings (JSON, XML...), and external libraries (SDL, OpenGL, Direct3D...). That's about as elegant as it gets without creating a silo. Is that how Red folks look at the situation? What are we doing about the Web. I hate JavaScript, but can't deny that it's very useful, and must be dealt with accordingly, even vendors of JS libs slowly retarget to Wasm.**

**[06:50](#msg5ec8c7b54c9b0f060d1abcbf)If I'm new to a complex topic and crunching on some critical project work and trying to learn a new thing efficiency, I really do want the gurus tell me exactly what to read and in what order. I think that is good, natural, and effective. A glossary would be nice. But I still want a program of study (the narrow tree path mentioned).**

**[06:56](#msg5ec8c90d2c49c45f5a983630)The problem I'm having with the doc is that definitions of terms are neither pre-order nor in-order. This takes some knowledge engineering and forethought and is not actually easy to do. I see that the doc is nascent. Sympathies. How many people work on the Red project? What's the spread of workload? Does one guy do 80% of the coding and doc? Can someone break it down for me? Practically, I need to know what a 'face' is. It's clearly something graphical. But I want a definition. You never want to introduce a new term and then immediately tell the reader what it's used for without first giving him a clear definition. Any other path through the idea matrix is a mistake and is not productive. I'm jumping around the doc, and every time I do, I conclude that I've started in the wrong place.**

**[06:56](#msg5ec8c9359da05a060a26726e)I don't like Gitter. You can't keep editing until your typos are gone. That sucks. Why don't we switch to Discord?**

**hiiamboris**

**[08:24](#msg5ec8ddc29da05a060a269ac8)For `face` I will point you (again) to the official docs: https://doc.red-lang.org/en/view.html#\_face\_object**

**[08:34](#msg5ec8e02aff7a920a7207ac69)Generally though, I would recommend learning how to learn:**  
**1) outline in your mind what parts you're interested in, parts not covered by your previous coding experience**  
**2) look for those parts in google, e.g. `red-lang term I'm looking for`, in \[official docs](https://doc.red-lang.org/en/), in \[the wiki](https://github.com/red/red/wiki) (you can use the search box at the top of the page), on \[RbE](https://www.red-by-example.org/), in \[unofficial specification](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc) and ask in \[help room](https://gitter.im/red/help). Get familiar with \[R2 manual](http://www.rebol.com/docs/core23/rebolcore.html) as it covers the basics of Redbol language family. But take a look as well at each of the pages to see what topics they are covering.**  
**3) play play and play again - in the console (`help` and `?` commands are your best friends)**

**That would save you a huge lot of time.**

**greggirwin**

**[09:01](#msg5ec8e6537da67d06fac75c49)@hiiamboris +1.**

**@Shaping slow down, take a breath, and follow Boris' advice. :^) Since every new person is different, there is no single, right way to organize things for everyone. As a new user, you know best what struggles you have, and you can absolutely use the wiki to make informal notes about that, and even a page with links that are organized well for your tastes, which others may share.**

**We're happy to have you here, and will help, but consider (my personal view here) that if you show up and immediately tell me I'm doing it all wrong...it's not a great way to start a relationship.**

**As to Discord, and many other systems, it's not better, just different. We're sticking with Gitter for now.**

**cloutiy**

**[13:04](#msg5ec91f779da05a060a272333)@Shaping Just don't start with `parse`.;) There are some foundation concepts you need to nail before trying to jump in to `parse`. Boris has laid out some good starting points.**

**theSherwood**

**[15:26](#msg5ec9409f4c9b0f060d1bc5a7)Looking at that doc that @hiiamboris linked to, a face sounds like a widget. Is that correct?**

**hiiamboris**

**[15:38](#msg5ec94368225dc25f549f0adc)I guess that's the closest analogy one can get ;)**  
**Let me also quote Rebol view guide:**  
**&gt; The entire REBOL graphics engine is built around a single, powerful element: the `face` object (named after inter\*face\*).**

**theSherwood**

**[15:40](#msg5ec943fb9da05a060a2779dc)Okay. Are they composable?**

**hiiamboris**

**[15:41](#msg5ec944347da67d06fac824bd)Indeed.**

**theSherwood**

**[15:41](#msg5ec9444227513a72fbaa5c4b)Very cool. Thanks @hiiamboris**

**[15:49](#msg5ec94609549761730b521c4f)I hope it is alright I ask a lot of questions...**

**hiiamboris**

**[15:50](#msg5ec94634778fad0b131fe8b4)Totally. Though https://gitter.im/red/help is a better place for them ;)**

**PierreChTux\_twitter**

**[15:50](#msg5ec9465627513a72fbaa61b2)&gt; @greggirwin just spotted your object browser. Looks really nice. I wonder, if such tools could become part of some of the language setups, e.g. packed with gui console, so that users could inspect objects?**

**Yes, such an interface used in conjunction with AnaMonitor would be great! AnaMonitor is already very efficient, but adding that kind of browsing UI would be a convenient plus.**

**theSherwood**

**[15:51](#msg5ec946863ffa6106f1cc81e3)@hiiamboris Ah. okay. I'll head over there then. Thanks!**

**PierreChTux\_twitter**

**[16:24](#msg5ec94e55f0b8a2053aab849b)&gt; The problem I'm having with the doc is that definitions of terms are neither pre-order nor in-order. This takes some knowledge engineering and forethought and is not actually easy to do. I see that the doc is nascent. Sympathies. How many people work on the Red project? What's the spread of workload? Does one guy do 80% of the coding and doc? Can someone break it down for me? Practically, I need to know what a 'face' is. It's clearly something graphical. But I want a definition. You never want to introduce a new term and then immediately tell the reader what it's used for without first giving him a clear definition. Any other path through the idea matrix is a mistake and is not productive. I'm jumping around the doc, and every time I do, I conclude that I've started in the wrong place.**

**Pedagogy. Pedagogical support is what you seem to need.**  
**Same for me: although I've been Rebolling for decades, I find myself often quite frustrated when it comes to Red, and I share some of your experiences and feelings.**

**In terms of pedagogy, Nick Antonaccio has a proven record of enormous work: check:**  
**https://redprogramming.com/Home.html**  
**for instance, or this one, for Rebol:**  
**http://re-bol.com/rebol.html**  
**There's plenty of stuff.**

**But as you pointed out, an \*official* pedagogical thing would be better, maintained in parallel as Red evolves. Note also that it's quite difficult for people who swim daily within a subject to write something for a newcomer, with pedagogy: one must avoid acronyms, (not so)well-known conventions and abbreviations, "obvious" things may not be obvious at all for the newcomer, etc.**

**(and yes, this should take place in the /help discussion thing)**

**greggirwin**

**[18:07](#msg5ec966769da05a060a27c96e)@PierreChTux\_twitter @Shaping if you can point us to examples of a system done well in this regard, that would be most helpful. We've evaluated other lang doc systems, and are still spread so thin that we haven't moved from Reference and Specs into Tutorials and Articles (which are both planned).**

**[18:08](#msg5ec966984412600ccd62841a)Also why we still point people to the Rebol core guide, as it's very well done.**

**PierreChTux\_twitter**

**[18:13](#msg5ec967c2778fad0b132038eb)&gt; @PierreChTux\_twitter @Shaping if you can point us to examples of a system done well in this regard, that would be most helpful. We've evaluated other lang doc systems, and are still spread so thin that we haven't moved from Reference and Specs into Tutorials and Articles (which are both planned).**

**Olivier Auverlot's book on Rebol was just great, in my opinion, as a proper pedagogical support. It has been my favourite book for years.**

**I'm not sure that other languages' documentation may be such a good source of inspiration, as Rebol and Red languages are so different from the rest. To me, the work of Nick is just great: he perfectly outlines the Pure Efficiency of the language, so that any newcomer may have his eyes open (and his brain bubbling) in no time.**

**[18:13](#msg5ec967d89da05a060a27cd6d)You know, that famous « W A O U H » effect that we all felt that day when we first discovered Rebol or Red and their amazing power.**

**[18:17](#msg5ec968d0778fad0b13203b76)"Creating Business Applications With REBOL" by Nick Antonaccio is a quite amazing reference from my point of view:**  
**http://business-programming.com/business\_programming.html**

**greggirwin**

**[18:18](#msg5ec96900ff7a920a7208e204)Nick's work is great, agreed.**

**[18:19](#msg5ec9693327513a72fbaab1c2)I have Peter Wood's translation of Olivier's book here. Will pull it out and remind myself of the format.**

**PeterWAWood**

**[22:33](#msg5ec9a4c33ffa6106f1cd58b4)Olivier wrote two books, I suspect that @PierreChTux\_twitter is referring to the first. It was only available in French in hardcopy. I suspect this as Olivier would have had to assign the rights to the book to the publisher.**

**I translated (with Olivier's help) his second book which was self-published. It is freely available as a pdf from Lulu.com.**

**[22:37](#msg5ec9a5902c49c45f5a9a25ac)The second book is probably not so relevant to someone wanting to learn Red as it covers the Viewtop, Rebol/Command and Rebol/IOS.**

**[22:39](#msg5ec9a626a91f120a6cbb4df1)It was as much an introduction to the old Rebol eco-system as Rebol the language.**

**ALANVF**

**[23:03](#msg5ec9abac7da67d06fac90ab1)Rebol had an IOS port?**

**PeterWAWood**

**[23:28](#msg5ec9b1b33ffa6106f1cd6ed4)No Rebol had an Internet Operating System. The product name was REBOL/IOS. It predated Apple's iOS by some years.**

**ALANVF**

**[23:38](#msg5ec9b3e6b101510b20124dd3)ah ok**

****Sunday 24th May, 2020****

**cloutiy**

**[13:22](#msg5eca752a2280c80cbfc5a373)There's also "Programmer en REBOL" by Francois-Xavier Magaud &amp; Clause Petit, published by Vuibert. It's in french though. Somewhat similar to "Fundamentals of Red". It's out of print now. I have a hardcopy. I had reached out to the publisher to see if there was any interest in an english translation but not even sure they still in business.**

**PierreChTux\_twitter**

**[14:10](#msg5eca804b89941d051a1c9a64)@PeterWAWood I'm not sure whether it is the first book or not: I have it right here, the cover shows a lightning across a dark sky.**

**[14:10](#msg5eca80529da05a060a29f012)I suppose that it's a representation of what happens internally to the mind of someone who finally understands the Immense Power of Rebol (and Red).**  
**The title is "Rebol - Guide du programmeur".**

**[14:12](#msg5eca80c49da05a060a29f0bd)Browsing through the book, there's an ultraconcentrate of programming wisdom at page 2:**  
**«Programmer, c'est construire des mots»**  
**«To program consists in building words»**

**Even in other programming languages, this very simple phrase often helps a lot.**

**[14:13](#msg5eca80f9f0b8a2053aadf427)&gt; Rebol had an IOS port?**

**Rebol had what, twenty years of advance?...**

**[14:16](#msg5eca81bd4c9b0f060d1e62ac)@PeterWAWood There's another book, I remember now, its cover was lighter, and it featured the writing of a Forth dialect: that's a quite amazing introduction to Rebol's power. I'm sure I have it somewhere.**

**GiuseppeChillemi**

**[14:25](#msg5eca83c0778fad0b13226f9b)I have found the links:**  
**https://www.cristal.univ-lille.fr/profil/olivier.auverlot/rebol\_guide\_du\_programmeur.pdf**  
**https://www.cristal.univ-lille.fr/profil/olivier.auverlot/rebol\_a\_programmer\_s\_guide.pdf**

**PeterWAWood**

**[23:01](#msg5ecafcdb778fad0b13238eb9)@PierreChTux\_twitter The book that I translated was "Rebol - Guide du programmeur". Olivier's first book was \[Progrmmation Rebol](https://www.amazon.com/Programmation-Rebol-Olivier-Auverlot/dp/2212110170). I believe this first book was more detailed than Guide du Programmeur.**

****Monday 25th May, 2020****

**Shaping**

**[10:32](#msg5ecb9ebe549761730b57105f)&gt; @hiiamboris +1.**  
**&gt;**  
**&gt; @Shaping slow down, take a breath, and follow Boris' advice. :^) Since every new person is different, there is no single, right way to organize things for everyone.**

**[10:32](#msg5ecb9ed2b101510b20165bb5)Actually, there is. And that's what I'm suggesting in the ordering of ideas.**

**[10:33](#msg5ecb9f06f0b8a2053ab07c85)Is http://helpin.red/Homepage.html currently the most up-to-date doc?**

**[10:35](#msg5ecb9f88a91f120a6cbf62d1)Basic heuristics are evident in any case.**

**[10:35](#msg5ecb9f8e2c49c45f5a9e5418)Which documents should be avoided?**

**[10:41](#msg5ecba0c94c9b0f060d20e52d)2. Face object**

**Face objects are clones of face! template object. A field in face object is called a facet.**

**[10:41](#msg5ecba0cf4412600ccd673e70)An example is above.**

**[10:43](#msg5ecba1672280c80cbfc847e7)The definition is mostly mechanical/superficial. We then need to know (quickly if possible) wha a 'template object' is as a category of object, and what the face! template object is and does in particular. In this case, hyperlinks for both would be best. That shortens the learning path by eliminating the need to search for yet another term. Is there an effort under way to link all basic Red/REBOL terms to a glossary?**

**[10:45](#msg5ecba1b9225dc25f54a425a5)I'm mostly describing document ergonomics we all know about.**

**hiiamboris**

**[10:53](#msg5ecba3b6778fad0b1324f3e5)As Gregg pointed out, you're welcome to start a tutorial as you see it, on \[our wiki](https://github.com/red/red/wiki) or where it pleases you ☻ Build it in a way that would save everyone some learning effort and we will be grateful ;)**  
**Reference documentation, which you are reading, of course presumes some basic knowledge of Red and/or Rebol and elaborates only on specific implementation details.**

**endo64**

**[14:33](#msg5ecbd7483ffa6106f1d2173a)@Shaping Better to start with some Rebol documents to understand the basics about the language itself and the View/VID/Draw:**  
**http://www.rebol.com/docs/core23/rebolcore.html**  
**http://www.rebol.com/docs/easy-vid.html**  
**http://www.rebol.com/docs/view-guide.html**  
**http://www.rebol.com/docs/view-system.html**

**Last one answers the question of what is a `face` object, but better start with core manual, then VID and then View. Compare and check what you learn from those docs on REPL, Wiki and Red's reference doc. There are some minor differences and improvements.**

**greggirwin**

**[21:59](#msg5ecc3fb97da67d06faceef5b)@Shaping helpin.red is @ungaretti's work, not official docs. It certainly fills the gap we have for a User Guide, and where we also point to the Rebol Core Guide as a great doc.**

**[22:03](#msg5ecc40b22280c80cbfca08bb)Understand that we know the importance of good, complete, user-friendly docs. Since you have an idea of what those look like, you probably also know how much work they are to create. What we do, every day, is make choices about where to put our efforts.**

****Tuesday 26th May, 2020****

**dockimbel**

**[09:16](#msg5eccde5589941d051a223749)+++**  
**FYI, fast-lexer branch has been merged into master. It brings a big number of new features and fixes. The new features will be documented in form of blog entries during next days/weeks. One change that might affect your existing code is that integer division in Red does now return a `float!` value. Please update your existing code accordingly.**  
**+++**

**rebolek**

**[09:17](#msg5eccdea0225dc25f54a73181):clap:**

**hiiamboris**

**[09:25](#msg5ecce07e2c49c45f5aa15722)Hooray! ☺**

**planetsizecpu**

**[09:27](#msg5ecce1092280c80cbfcb6ac4)🎈✨🎉🎊 Yeah! push hard!**

**GaryMiller**

**[10:04](#msg5ecce9917da67d06fad06891)Congratulation!**

**Fast Lexer now correctly loads all 22,642 patterns (113,901 lines of Red code) of my AI application in less than 3 seconds down from 32 seconds! I still get the following error when trying to compile with -r though.**

**Compiling C:\\Red\\ZandraGUI.red ...**  
**\*\** Red Compiler Internal Error: Internal Error : No more global variable space**  
**\*\** Where: decorate-symbol**  
**\*\** Near: [forall path [**  
**append words either integer? item: path/1 \[item] [**  
**get?: to logic! any \[head? path get-word? item]**  
**get-path-word item clear blk get?**  
**]**  
**]**  
**emit words**  
**]**

**I believe @hiiamboris examined my code investigating that error and created issue #4361 for it a while back. Hopefully it will be possible for that bug to be fixed before the next official release so that I'll be able to use all the new functionality in the compiled version as well.**

**Thanks again for the great work!**

**dockimbel**

**[10:15](#msg5eccec57778fad0b1328166b)@GaryMiller Thanks. #4361 is not a bug, it's a limitation of the current toolchain and it's unlikely to be improved before Red gets self-hosted. You should write your 22642 patterns as "data" rather than "code" and you won't have any problem then.**

**ldci**

**[11:26](#msg5eccfcf2ff7a920a7210f78d)@dockimbel Congratulations. Fast lever is really impressive for speed. I confirm, some problems with mixing float and integer division.**

**GiuseppeChillemi**

**[12:06](#msg5ecd06309da05a060a2ff8a3)Congratulations! About 1 year of work efforts became reality just now!**

**dockimbel**

**[12:18](#msg5ecd09092c49c45f5aa1dd8b)&gt; About 1 year of work efforts became reality just now!**

**It's 8 months, so closer to half a year and not "about 1 year". It includes a lot more than just the new lexer. And it was "reality" all along, as it was all in a public branch in red/red repo, available to everyone.**

**meijeru**

**[12:19](#msg5ecd09443ffa6106f1d52339)My congratulations also. Now forward to 0.6.5!**

**dockimbel**

**[12:20](#msg5ecd0994225dc25f54a7bcec)@meijeru Thanks. We are considering dropping that versioning scheme, as many people complained about such "releases" both from users and internally from the team.**

**ALANVF**

**[12:56](#msg5ecd120b225dc25f54a7dbcd)yay!**

**[12:57](#msg5ecd1221b101510b2019fa7b)how much long do you think it'll be until 0.6.5 is released?**

**BeardPower**

**[12:57](#msg5ecd1247f0b8a2053ab437d3)Soon :tm:**

**ALANVF**

**[12:58](#msg5ecd125d778fad0b13289324)yeah but hasn't 0.6.4 been out for like 2 years?**

**[12:58](#msg5ecd12632280c80cbfcc041b)that's quite a while**

**BeardPower**

**[12:58](#msg5ecd128d778fad0b1328946a)Well, compared to what? ;-)**

**ALANVF**

**[12:59](#msg5ecd129f2280c80cbfcc048b)good point**

**[12:59](#msg5ecd12c07da67d06fad0fc05)most languages (with maybe rust as an exception) take quite a while to have new releases**

**BeardPower**

**[13:01](#msg5ecd13362280c80cbfcc0730)Yeah. Take Nim, Zig, Odin, Pony or Haiku Beta (Operating System) as examples. There is a lot of work on a daily basis going into all those projects. Just because there is no version bump does not mean that there is no progress.**

**ALANVF**

**[13:02](#msg5ecd1348549761730b5ac8d2)Yeah**

**[13:02](#msg5ecd136a3ffa6106f1d54d72)there's definitely been lots of progress made for Red, even without a major version release**

**BeardPower**

**[13:03](#msg5ecd138f4412600ccd6b05b0)Absolutely but people take those version bumps as an indicator of progress, which is very unfortunate.**

**endo64**

**[13:03](#msg5ecd13bb778fad0b13289964)And that's why Red team will drop that versioning scheme.**

**pekr**

**[13:15](#msg5ecd1674225dc25f54a7ec42)@dockimbel "We are considering dropping that versioning scheme" - so what the naming scheme would be like instead?**

**Rebol2Red**

**[13:48](#msg5ecd1e333ffa6106f1d575a1)Is Rebol's Viewtop for Red "in the make" by someone or by the developers or will it never be resurrected.**  
**Maybe into a new form?**

**Here's some Rebol code related to Viewtop in case someone will look into it.**  
**`REBOL [] ; next line writes source of viewtop write %viewtop.txt mold ctx-viewtop ; next line starts viewtop viewtop http://rebol.com/index.r`**

**hiiamboris**

**[13:58](#msg5ecd207db101510b201a3074)What is the point of it?**

**Rebol2Red**

**[13:59](#msg5ecd20bdf0b8a2053ab4697e)I just liked to use it and think it will connects users.**  
**btw. What's the point of programming as a hobby? Well ... FUN**

**GiuseppeChillemi**

**[14:00](#msg5ecd20e2a91f120a6cc34fb4)@dockimbel**

**&gt; &gt; About 1 year of work efforts became reality just now!**  
**&gt;**  
**&gt; It's 8 months, so closer to half a year and not "about 1 year". It includes a lot more than just the new lexer. And it was "reality" all along, as it was all in a public branch in red/red repo, available to everyone.**

**Nenad, It's not important if it took about 8 months or 1 year, My words have a sense of appreciation for the long and important effort on fast lexer and not a complaint. You pushed hard on this project and now we have this gift, together with all the goodies I have seen in the last Trello update. Thank you Nenad and everyone involved.**

**planetsizecpu**

**[15:02](#msg5ecd2fa32c49c45f5aa26e75)@dockimbel I can confirm that the fast-lexer is several times faster during loading, see here the difference between the previous version and the new version of today during the loading of my game:**  
**YESTERDAY'S BUILD**  
**&gt;&gt; about**  
**Red 0.6.4 for Windows built 25-May-2020/4:53:39+02:00 commit #5aa78a6**

**&gt;&gt; do %cave.red**  
**Start load 16:26:24.947**  
**End load 16:26:26.2754**  
**Difference 0:00:01.32839**  
**&gt;&gt;**

**TODAY'S FAST LEXER**  
**&gt;&gt; about**  
**Red 0.6.4 for Windows built 26-May-2020/11:24:10+02:00 commit #bcd449e**

**&gt;&gt; do %cave.red**  
**Start load 16:27:41.0243**  
**End load 16:27:41.4304**  
**Difference 0:00:00.406102**  
**&gt;&gt;**

**dockimbel**

**[15:07](#msg5ecd30a22c49c45f5aa27248)@GiuseppeChillemi**  
**&gt; Nenad, It's not important if it took about 8 months or 1 year**

**You don't get it. Posting false information online about other's people work \*is* detrimental to say the least. If you care about Red, get your facts straight when posting in public channels.**

**[15:07](#msg5ecd30c13ffa6106f1d5c1dc)@planetsizecpu Good! I hope you are measuring the `load` time and not the `do` evaluation time?**

**planetsizecpu**

**[15:08](#msg5ecd30d79da05a060a30a46f)I have also had to modify in the game some divisions, due to the `float return` without problems, simply using`to-integer` when necessary. The game cycle seems work well, if a bit slower the elvators due to integer conversion inside the loop, but but you can play perfectly. Here is the fast-lexer game working:**

**[15:09](#msg5ecd31144412600ccd6b7eb0)\[!\[cavetest201.gif](https://files.gitter.im/red/red/ykkk/thumb/cavetest201.gif)](https://files.gitter.im/red/red/ykkk/cavetest201.gif)**

**dockimbel**

**[15:10](#msg5ecd31709da05a060a30a62a)@pekr We are actually considering dropping the "stable" releases altogether as they tend to get more hate than love, until we reach 1.0. We could also replace the current `red.exe` by the precompiled console and let people use the toolchain from sources (downloading Rebol executable). Though we still need some reference points for people depending on those "stable" releases (like RedCV project and a few companies using Red). All options are on the table to ponder.**

**planetsizecpu**

**[15:10](#msg5ecd317327513a72fbb3a5e7)@dockimbel I measured all the load time from first line to the game running.**

**dockimbel**

**[15:13](#msg5ecd32004412600ccd6b828b)@planetsizecpu Load time is just the time required for `load` function to run, if it includes anything else, it's not measuring the loading time.**

**I'll post some extra improvements for `loop` and maybe other natives, to support float arguments.**

**planetsizecpu**

**[15:23](#msg5ecd3483a91f120a6cc39c96)@dockimbel I revised the code and think the measurements are correct, I measured from first line to just when `does` block is loaded to create funcs, then printed the data and next`view` started the game.**

**dockimbel**

**[15:30](#msg5ecd3632a91f120a6cc3a280)@planetsizecpu "from first line to..." sounds wrong. It should just measure `load` function call. If you are loading using `do`, you should split it in `file: load <...> do file` and make the measurement around `load <...>`. Including anything else is not part of loading process by the lexer, but already evaluation process.**

**GiuseppeChillemi**

**[15:48](#msg5ecd3a43a91f120a6cc3b0b9)@dockimbel**  
**&gt; @GiuseppeChillemi**  
**&gt; You don't get it. Posting false information online about other's people work \*is* detrimental to say the least. If you care about Red, get your facts straight when posting in public channels.**

**Also, you don't get it: it's the not number of months spent on fast lexer important here but the spirit of the people in a group. Who has a good spirit will appreciate whatever you will do, and any time you will take. The others would complain about any number. They would have a complaint for an 8 months lexer, one for 12, another for 6 or just 1; they would complain because you did or if you don't make it and if you did it by yourself or if you have created a specialized multi-developer team. I don't care about such kind of persons, I live a lot better in my life and company since the days I have learnt that anything I would give them, even a pile of gold coins, they would have a lament. So please, get the good spirit of my words and be happy and proud for the sincere appreciation you have received: Nenad, you did a great job!**

**dockimbel**

**[17:17](#msg5ecd4f3a27513a72fbb40e07)FYI, `loop` and `repeat` now accept a `float!` value as argument. That should reduce the number of places where you would need to upgrade your scripts.**

**toomasv**

**[18:31](#msg5ecd607a4412600ccd6c36fa):+1:**

**GiuseppeChillemi**

**[21:06](#msg5ecd84cdb101510b201ba893)Could I ask in which timeframe of the Red Foundation plan is the Android version? I have a commercial project I would like to create in Red and it is really important to me to know when it would be available. If it would be released by the 4th quarter of 2020 or 1st of 2021 I could start coding the foundations just now and finalize them when the Android version is ready. Your answer is important to let me take this project otherwise, I will drop it. Thank you in advance.**

**greggirwin**

**[21:10](#msg5ecd85db89941d051a24adc3)It's risky to plan commercial projects on projected timelines. Even if we provide a date, that's not a guarantee of any kind. Plans change.**

**GiuseppeChillemi**

**[21:39](#msg5ecd8cac27513a72fbb4ebfd)Gregg, your answer contains everything I need to know: I will cancel my project.**

**ALANVF**

**[21:40](#msg5ecd8cc84c9b0f060d2678ec)or you could just put it off for a while rather than canceling it altogether**

**GiuseppeChillemi**

**[21:46](#msg5ecd8e442c49c45f5aa3c4de)I could try next year but by then the interest of the market would be a lot colder. From now to the next spring there will be a peak for such kind of applications.**

****Wednesday 27th May, 2020****

**pekr**

**[04:45](#msg5ecdf06f7da67d06fad3aae3)@dockimbel Thanks for your reply, appreciated! I always loved the R2 console experience, dunno why. It became mostly my CLI for simple stuff. That's why I really did not like R3, the console experience was simply terrible. What I also like is, that Red, for the first time in Redbol history, brings drink-our-own-cool-aid here. I do remember Cyphre producing Console in R2 View itself, but it was hardly usable. Just that one, is a great achievement! Of course, pringing in loops need fixing, but we (users) already know, that it needs full IO.**

**Stating above, I am really a long time proponent of Red/View console becoming the main distributable product. Dunno if it could be auto-built and downloadable on a daily basis, but then we would have to come up with some release marks, so that we know the exact version where the eventual problem happens. It could be part of the About dialog.**

**As for the building Red - I used red.exe just few times. Then switched to Github desktop and compiling in R2 console. If I find it convenient, many will do too. First I though that View console could have some built-in build-red function, downloading distro in .zip, downloading Rebol to compile, but realy not sure it is worth the hassle. Those who want to compile their stuff, already know how to. But of course, you might want to compile your own app ... well, trade-offs.**

**My final take is, that Red View console is going to be appreciated by many users, especially those who start with Red.**

**rebolek**

**[06:03](#msg5ece02ba9da05a060a331def)&gt; I though that View console could have some built-in build-red function, downloading distro in .zip, downloading Rebol to compile**

**@pekr I have such a function, I may make it public.**

**planetsizecpu**

**[09:55](#msg5ece38fc27513a72fbb69691)Ah @dockimbel now I get you, that's the result:**  
**&gt;&gt; about**  
**Red 0.6.4 for Windows built 27-May-2020/4:38:12+02:00 commit #3e9a772**

**&gt;&gt; t1: now/time/precise x1: load %loadlevel.red do x1 x2: load %makegame.red do x2 t2: now/time/precise print t2 - t1**  
**0:00:00.0154296**  
**&gt;&gt;**

**pekr**

**[10:00](#msg5ece3a3af0b8a2053ab7a0eb)I don't have commit info there?**

**planetsizecpu**

**[10:07](#msg5ece3bcb9da05a060a33b6ce)And that's the result for non fast-lexer last built:**  
**&gt;&gt; about**  
**Red 0.6.4 for Windows built 25-May-2020/4:53:39+02:00 commit #5aa78a6**

**&gt;&gt; t1: now/time/precise x1: load %loadlevel.red do x1 x2: load %makegame.red do x2 t2: now/time/precise print t2 - t1**  
**0:00:00.87623**  
**&gt;&gt;**

**[10:10](#msg5ece3c7c2c49c45f5aa57052)So it makes a lot of sense this fast lexer improvement!**

**dockimbel**

**[11:27](#msg5ece4eb02c49c45f5aa59bdb)@planetsizecpu You got it. :+1: ~57 times faster, that's more like it. ;-)**

**[11:28](#msg5ece4efa2c49c45f5aa59cb5)@pekr**  
**&gt; &gt; I though that View console could have some built-in build-red function, downloading distro in .zip, downloading Rebol to compile**  
**&gt;**

**Something along those lines is the main option. Though, auto-downloading an exe and storing it in the filesystem will probably be badly flagged by AVs.**

**rebolek**

**[11:41](#msg5ece51f227513a72fbb6dd9c)If you download Rebol from official location, it's in ZIP/TAR, so AV probably shouldn't complain.**

**pekr**

**[11:46](#msg5ece5327b101510b201dc26c)It might, most AVs can see inside an unencrypted archives. So we will see ....**

**rebolek**

**[12:01](#msg5ece567cf0b8a2053ab7f54e)And do they complain about official version of Rebol?**

**[12:01](#msg5ece56a84412600ccd6ee4dd)I'll prepare the building script (I need to extract it from another project) and let you know, so you can try it.**

**hiiamboris**

**[15:08](#msg5ece82732c49c45f5aa6534d)&gt; FYI, `loop` and `repeat` now accept a `float!` value as argument. That should reduce the number of places where you would need to upgrade your scripts.**

**@dockimbel Another annoyance is that all `/part` refinements now require a `to integer!` cast**

**dockimbel**

**[15:25](#msg5ece865d27513a72fbb7a66f)@hiiamboris We'll internalize `/part` argument truncation when processing the related tickets/PRs.**

**Rebol2Red**

**[22:56](#msg5ecef02427513a72fbb92f18)Is this behaviour changed by accident or on purpose? (I know the Reddish way is forward slashes)**  
**`do %\C\RED\defaults.red ; backward slashes`**  
**The error you get is:**  
**`*** Access Error: cannot open: \C\RED\defaults.red`**  
**This used to work but now MUST be changed to:**  
**`do %/C/RED/defaults.red ; forward slashes`**

**greggirwin**

**[23:33](#msg5ecef8c89da05a060a364543)It is by design, pending deeper review WRT UNC support and general value weighed against consistency.**

**[23:34](#msg5ecef92289941d051a2911f2)Using `to-red-file` will likely be the answer to that.**

****Thursday 28th May, 2020****

**blkstph\_gitlab**

**[00:49](#msg5ecf0a92f0b8a2053aba60d0)Red hits the TIOBE top 100 programming languages? https://www.tiobe.com/tiobe-index/**

**[00:50](#msg5ecf0ae5b101510b20203a04)The Next 50 Programming Languages**

**The following list of languages denotes #51 to #100. Since the differences are relatively small, the programming languages are only listed (in alphabetical order). (look 4th line down far right)**

**(Visual) FoxPro, ABC, Awk, Bash, BBC BASIC, bc, Bourne shell, C shell, cg, Clean, Clojure, CoffeeScript, Common Lisp, Crystal, cT, Elixir, Euphoria, Falcon, Forth, Hack, Icon, Inform, Io, Korn shell, Ladder Logic, LiveCode, Maple, Mercury, ML, MQL4, NATURAL, Object Pascal, OCaml, OpenCL, Oz, PL/I, PostScript, Programming Without Coding Technology, Q, Raku, Red, Ring, S, SPARK, Standard ML, Stata, Tcl, Vala/Genie, Verilog, VHDL**

**[00:57](#msg5ecf0c69b101510b20203c69)I can think of dozens of languages which are less a secret, not alpha, and are nowhere to be found. If this was April I'd say God has a sense of humor; but it May be more than that....**

**ALANVF**

**[00:57](#msg5ecf0c943ffa6106f1db8dbd)eyy Red's up there now**

**greggirwin**

**[01:47](#msg5ecf183b549761730b6127f6)"Next" is a funny moniker to apply to some of the languages. :^)**

**ne1uno**

**[01:57](#msg5ecf1a92778fad0b132ef4bf)next 50. when was it out of the top 100?**

**greggirwin**

**[02:24](#msg5ecf20c14412600ccd7188c4)I meant "next" is funny considering how old (and mostly dead) many of them are.**

**GalenIvanov**

**[07:15](#msg5ecf64fc549761730b61c946)Yes, some of the "next" languages are really old. I was surprised that Racket is nowhere to be seen - maybe it counts as a Scheme.**

**planetsizecpu**

**[08:27](#msg5ecf75e8f0b8a2053abb69f8)It may be (the possibility exists) that "next" may refer to next generation languages, so it may be a compliment haha**

**Rebol2Red**

**[08:35](#msg5ecf77cff0b8a2053abb6fdf)@greggirwin Thanks for answering my question. I will replace the backslashes to forward slashes in my sources. It was my bad to do this wrong in the first place. The lesson is to think deeper about something despite it works.**

**ALANVF**

**[13:31](#msg5ecfbd1da91f120a6ccb2ac1)I also like how Raku and Red are right next to each other there**

**[13:31](#msg5ecfbd3a2280c80cbfd420e1)have any of y'all considered taking some ideas/inspiration from Raku for Red? it's a very solid language imo**

**Oldes**

**[14:11](#msg5ecfc69ea91f120a6ccb4a08)@ALANVF I think that Perl/Raku and Rebol/Red are on opposite sides of language spectrum.**

**ALANVF**

**[14:12](#msg5ecfc6bd89941d051a2b161f)perhaps, but they all have pretty cool ideas (which is why I brought it up)**

**meijeru**

**[15:23](#msg5ecfd76b778fad0b1330e6cd)Just noticed that the console `help -- about` screen says "Copyright 2011-2019" -- this should be "2020" in my view. It's possible to have the current year computed for display so that you don't have to update it explicitly every New Year.**

**PierreChTux\_twitter**

**[16:40](#msg5ecfe9629da05a060a38ca55)&gt; have any of y'all considered taking some ideas/inspiration from Raku for Red? it's a very solid language imo**

**There's probably one idea \*not* to be taken from Raku: it is a common word, therefore it makes the language virtually un-searchable by any one who is not deeply interested, but just wants to get a quick idea.**

**ALANVF**

**[16:41](#msg5ecfe9a0225dc25f54b04c7a)&gt; There's probably one idea not to be taken from Raku**

**?**

**PierreChTux\_twitter**

**[16:41](#msg5ecfe9c57da67d06fad989a9)This happened too often to me: when I mention the Red programming language, people quickly google that, find nothing relevant, so they just ignore my enthusiasm; when I mention Rebol, they quickly google and find out that it seems to be dead...**  
**And then those people ask me to learn javascript...**

**ALANVF**

**[16:41](#msg5ecfe9c789941d051a2b8406)Are you implying that Raku is too complex to take ideas from?**

**PierreChTux\_twitter**

**[16:41](#msg5ecfe9d0a91f120a6ccbba89)No, no, not at all!!**

**ALANVF**

**[16:42](#msg5ecfe9db3ffa6106f1dde43e)ah you mean like googling it**

**PierreChTux\_twitter**

**[16:42](#msg5ecfe9ec3ffa6106f1dde458)I'm just mentioning a practical inconvenient of choosing a common word to name something.**

**ALANVF**

**[16:42](#msg5ecfe9f32c49c45f5aaa88fa)generally, `raku programming`, `raku-lang`, or `perl6` turns up more relevant results than just `raku`**

**PierreChTux\_twitter**

**[16:42](#msg5ecfea0589941d051a2b84e1)Yes, that's it. Googling, or duckduckgoing, etc.**

**[16:43](#msg5ecfea37778fad0b13312284)Yes, and `red lang` leads to relevant results, but still, people with light motivation, such as the people I was referring to, don't bother with such things.**

**ALANVF**

**[16:43](#msg5ecfea3aff7a920a7219bfca)there are other languages with this issue, but generally adding `-lang` will produce helpful results**

**[16:43](#msg5ecfea4027513a72fbbbb757)ah yeah I see that**

**PierreChTux\_twitter**

**[16:44](#msg5ecfea64778fad0b133122f7)It is only after the language has reached some kind of success that the search engines begin to rank the language higher than its previous meaning.**

**ALANVF**

**[16:45](#msg5ecfeaaab101510b20228613)Yeah**

**[16:45](#msg5ecfeab79da05a060a38cedc)like python or ruby or java**

**PierreChTux\_twitter**

**[17:36](#msg5ecff6b6a91f120a6ccbe57b)Exactly, Nick Antonaccio pointed this out, a long time ago: Rebol was such a good name, searching it always led to the very right information.**

**dockimbel**

**[18:23](#msg5ed001bea91f120a6ccc0447)@PierreChTux\_twitter You should tell that to the creators of C/D/E/J/V/... one-letter languages. Googling for "C" returns one relevant result only. So I guess nobody is using C because nobody can find any resource about it, right? You either know how to use a web search engine, or you don't. We can't do anything for the second category.**

**greggirwin**

**[19:44](#msg5ed01495778fad0b1331aca0)&gt; have any of y'all considered taking some ideas/inspiration from Raku for Red? it's a very solid language imo**

**@ALANVF see https://github.com/red/red/wiki/%5BDOC%5D-Red-Should...-(Feature-Wars)**

**ALANVF**

**[19:44](#msg5ed014af2280c80cbfd53464):thumbsup:**

**greggirwin**

**[19:45](#msg5ed014e527513a72fbbc3de2)@dockimbel we still don't have a mascot. Perhaps we could have Redunculus the homunculus. But then people would just say that's ridonculous.**

**Respectech**

**[19:58](#msg5ed0180389941d051a2c0a7a):D**

**GiuseppeChillemi**

**[20:00](#msg5ed01859549761730b63ddd2)&gt;&gt; This happened too often to me: when I mention the Red programming language, people quickly google that, find nothing relevant, so they just ignore my enthusiasm;**

**I am working on it. I have different ideas and I am creating my muscles on Red to help.**

**[20:02](#msg5ed018d0225dc25f54b0dc8d)&gt;&gt; Exactly, Nick Antonaccio pointed this out, a long time ago: Rebol was such a good name, searching it always led to the very right information.**

**We can't change this, there has been ample debate but Doc loves this name.**

****Friday 29th May, 2020****

**dockimbel**

**[00:16](#msg5ed0544ba91f120a6ccce336)&gt; but Doc loves this name.**

**How do you know what I think? When did I give you the right to speak in my name? Stop putting your words in my mouth and stop spreading fake information here about Red. Last warning.**

**[00:19](#msg5ed054f94c9b0f060d2e5574)&gt; @dockimbel we still don't have a mascot. Perhaps we could have Redunculus the homunculus. But then people would just say that's ridonculous.**

**I'm afraid even with that, people will find ways to complain. ;-)**

**theSherwood**

**[01:54](#msg5ed06b687da67d06fadae270)&gt; How do you know what I think? When did I give you the right to speak in my name? Stop putting your words in my mouth and stop spreading fake information here about Red. Last warning.**

**Am I missing some context here? This seems like a really disproportionate response.**

**GiuseppeChillemi**

**[07:16](#msg5ed0b6e83ffa6106f1dfe84c)@dockimbel You defended this name even in the situation where a lot of newcomers have written here about the invisibility of Red on search engines. So I have accepted this fact, and this time, instead of agreeing and fuelling "Red" name should be changed topic, I have written my honest thought and stopped there. But you are now menacing me even for this. So I should now make a personal choice: being dishonest to what I think and start writing what you like to read or being honest and say what I think. I have chosen the latter. I will continue posting about the dangers I see and opinions even if I touch open nerves. I will do this for the love of Red project I have and for the respect have chosen to give to you: never be fake but be sincere even when you don't like what I say . So Doc, it's now up to you to choose to have around honest and sincere people or dishonest ass licking that would say only what you like to read. Feel free to hit the kill button. Keep in mind that with this actions, as leader, you are also communicating to everyone to remain silent even in front of dangers that could harm the project. Is it this what you really want?**

**hiiamboris**

**[07:47](#msg5ed0be1c2280c80cbfd6c875)He's simply telling you not to impose your opinion as facts, I presume ;)**  
**Simple "... probably" or "... I think" would have fixed it.**

**pekr**

**[08:12](#msg5ed0c3f6549761730b656b4a)Yes, we should not put words into others mouth, simple as that. But we should most probably calm down a bit, as my personal opinion is, that any such personal accusations and warnings do more harm in the end, than an original claim. Noone's intention imo is to spread any missinformation or lies. We are all here for the same reason and I vote for clearing up the missunderstandings and just moving forward. Friendly place should be our moniker ....**

**rebolek**

**[08:14](#msg5ed0c471225dc25f54b26b4c) @GiuseppeChillemi take a look at other language names: C, Rust, Go, Java, Perl, Python, ... everything is a common word, even a letter.**

**loziniak**

**[08:18](#msg5ed0c56da91f120a6ccde661)"Last warning" is too much in my opinion, too authoritarian. Although I understand Nenad's anger for being depicted as the only person that stands against changing the name of Red (authoritarian indeed). Which is simply not true, many people, including me, just love the name "Red". Maybe being shown as an authoritarian just induced an authoritarian answer...**

**[08:25](#msg5ed0c6fc4c9b0f060d2f5a7a)Language list can go forever: Basic, Forth, Swift, Assembly, Scratch, Rust, Dart, Logo, Groovy, Julia, Scheme ... In Poland there's even a company makin ketchups called Kotlin, with headquarters in town of Kotlin :-)**

**pekr**

**[08:33](#msg5ed0c8cf3ffa6106f1e013b8)Red ketchup :-) Well, I can't imagine, at the recent days, that Red would change its name ... I mean - I like it a lot and anyone interested, can find its resources quite easily ....**

**dockimbel**

**[09:56](#msg5ed0dc574412600ccd75fc79)&gt; He's simply telling you not to impose your opinion as facts, I presume ;)**  
**&gt; Simple "... probably" or "... I think" would have fixed it.**

**Thank you! At least one rational person here. I already warned several times Guiseppe before about not posting his illusory opinions as facts, because, by definition, those are fake information that he's spreading in public channels. Fake information is detrimental.**

**[10:03](#msg5ed0de08549761730b65b09f)@loziniak This channel is public but moderated. Some people don't understand that and we do have to remind them when not to cross the border sometimes. In rare occasions, we do have to ban someone when it becomes obvious that they don't want to abide by any rules. This is not perfect, but we haven't found out any better ways. If you have a better solution, I would be glad to hear it.**

**[10:07](#msg5ed0deff27513a72fbbe2b67)@loziniak Moreover, about that naming topic, it has been debated countless time in the past both here on Gitter and other channels. Once all the arguments were presented, the weight of pro-change arguments drop down to near zero. It's a closed topic since a long time because noone has ever presented a good alternative. The supposed searching issue is close to non-existent, it arises only among the few people here who have limited ability to use a web search engine and didn't give more than 5 seconds thought on that topic.**

**[10:13](#msg5ed0e063225dc25f54b2b719)More generally, the case with Guiseppe is just another reminder for me that our setup and interface with the community here on Gitter is inadequate. It's a mix of contributors to Red and pure users (non-contributing). This kind of setup seems increasingly wrong to me since several years. We should have a semi-public space (with filtered write-access) where we meet with contributors and a separate fully public space for users (where the Red team will be represented by community managers only). Gitter does not offer enough flexibility for such finer-grained access control, it's either fully public or fully private.**

**loziniak**

**[10:21](#msg5ed0e246225dc25f54b2bca6)@dockimbel My solution would be to create a wiki page with all the repeated arguments on the topic and just post a link in case of somebody forgets about them and include team's official standpoint and a warning about consequences of repeatedly discussing this topic on official channels. When somebody continues to repeat these arguments, then I'd say it's a good moment for moderation. But maybe a simple link/reminder would be sufficient after just first post.**

**[10:24](#msg5ed0e2d03ffa6106f1e05772)Anyway, I'm curious what @GiuseppeChillemi had in mind by saying:**  
**&gt; I am working on it. I have different ideas and I am creating my muscles on Red to help.**

**dockimbel**

**[10:25](#msg5ed0e308225dc25f54b2be23)&gt; a warning about consequences of repeatedly discussing this topic on official channels.**

**My warning to him was not about the topic, but his tendency to confuse his imagination with reality, post his misguided opinions as facts and never ever acknowledge his wrong-doing when called upon it. Here is a recent example:**

**&gt;&gt; Giuseppe: About 1 year of work efforts became reality just now!**

**&gt;&gt; Me: It's 8 months, so closer to half a year and not "about 1 year". It includes a lot more than just the new lexer. And it was "reality" all along, as it was all in a public branch in red/red repo, available to everyone.**

**&gt; Giuseppe: Nenad, It's not important if it took about 8 months or 1 year,...**

**His initial post was misleading readers in many ways, yet that's "not important" in his eyes.**

**[10:35](#msg5ed0e58689941d051a2dee00)@loziniak We do have such wiki pages, but no entry on that topic. I guess nobody in our team thought that there was even a topic there to address for the wiki...**

**[10:37](#msg5ed0e5f14412600ccd7613a4)BTW, we do have one unmoderated group (chit-chat room) where people who have issues with rules (like the netiquette) and reality can freely post about whatever irrelevant topic they want. Additional bonus of that room: I'm not part of it. ;-)**

**pekr**

**[10:41](#msg5ed0e6cd9da05a060a3b3880)Yes, chit-chat was a good addition. Not contributing myself, I find a comfort zone in the community space, eventually mediating stuff fir newcomers. But still I would like the ability to being able to at least read stuff from developers. Pity Gitter does not provide a mix.**

**GiuseppeChillemi**

**[10:44](#msg5ed0e7702280c80cbfd732ba)Nenad, which bad consequences have you seen for Red when I have written that fast lexer has been done in a time frame of 12 months instead of 8? Which damage could this do?**

**PierreChTux\_twitter**

**[10:47](#msg5ed0e82f27513a72fbbe414b)&gt; @PierreChTux\_twitter You should tell that to the creators of C/D/E/J/V/... one-letter languages. Googling for "C" returns one relevant result only. So I guess nobody is using C because nobody can find any resource about it, right? You either know how to use a web search engine, or you don't. We can't do anything for the second category.**

**Yes. And within that second category are numerous deciders, bosses, people who auto-claim that their time is precious, etc. And there's just no way to get them convinced to go on the Red way. I've got a very hard time trying to convince many of those to just try red: unsuccessfully, every time.**

**And also, note that C was there a looong time ago, it is just a letter and not a colour.**

**Even if you know how to use a search engine, when you search for Red language, you often end up with a whole lot of irrelevant answers, such as this one:**  
**https://github.com/Microsoft/vscode/issues/54574**  
**and you just waste your time figuring out those resources are not relevant.**

**Resources about Red language are fine and one can browse through them correctly; but what about resources \*outside* of that world: for instance, a stackoverflow discussion, or a blog where someone suggests using Red (and forgets about writing Red Language or Red Lang or RedLang or Red-Lang): this entry will be unsearchable, very unfortunately.**  
**Remember the old Rebol days? Googling Rebol was always leading to very relevant hints, and sometimes excellent surprises lying outside the Rebol world/community.**

**dockimbel**

**[10:49](#msg5ed0e8ae4412600ccd76187d)@GiuseppeChillemi False information asserted as fact gets picked up as true by readers and spread on the Internet as a truth. What do I have to explain such obvious thing?**

**PierreChTux\_twitter**

**[10:51](#msg5ed0e920549761730b65cb01)&gt; @dockimbel You defended this name even in the situation where a lot of newcomers have written here about the invisibility of Red on search engines. So I have accepted this fact, and this time, instead of agreeing and fuelling "Red" name should be changed topic, I have written my honest thought and stopped there. But you are now menacing me even for this. So I should now make a personal choice: being dishonest to what I think and start writing what you like to read or being honest and say what I think. I have chosen the latter. I will continue posting about the dangers I see and opinions even if I touch open nerves. I will do this for the love of Red project I have and for the respect have chosen to give to you: never be fake but be sincere even when you don't like what I say . So Doc, it's now up to you to choose to have around honest and sincere people or dishonest ass licking that would say only what you like to read. Feel free to hit the kill button. Keep in mind that with this actions, as leader, you are also communicating to everyone to remain silent even in front of dangers that could harm the project. Is it this what you really want?**

**oops... Sorry, it seems that this subject was a whole lot more touchy than I couldn't imagine!...**

**Sorry, let's all calm down and breathe sloooowly...**

**dockimbel**

**[11:00](#msg5ed0eb5f2c49c45f5aad122f)@PierreChTux\_twitter**  
**&gt; Yes. And within that second category are numerous deciders, bosses, people who auto-claim that their time is precious, etc. And there's just no way to get them convinced to go on the Red way.**

**When talking to such people or non-programmers about Red, you gave them a direct link, you don't let them search on their own.**

**&gt; And also, note that C was there a looong time ago, it is just a letter and not a colour.**

**Single-letters are even worse than a common word, as they catch even more irrelevant content. Try "b" on Google.**

**&gt; Even if you know how to use a search engine, when you search for Red language, you often end up with a whole lot of irrelevant answers, such as this one:**

**Searching for "red language" gives 10/10 relevant results on first page on Google, 9/10 on Bing.**

**&gt; what about resources outside of that world: for instance, a stackoverflow discussion, or a blog where someone suggests using Red (and forgets about writing Red Language or Red Lang or RedLang or Red-Lang): this entry will be unsearchable, very unfortunately.**

**When that "someone" does it correctly, he will include a link to Red website, so such referent links can be searched for in Google.**

**&gt; Remember the old Rebol days? Googling Rebol was always leading to very relevant hints, and sometimes excellent surprises lying outside the Rebol world/community.**

**Rebol was a unique name, but at the same time the "ol" ending mislead a lot of people thinking it has to do with COBOL, making some newcomers run away (though the closed-source nature was by far the biggest bouncing factor).**

**rebolek**

**[11:01](#msg5ed0eb754412600ccd761dac)@PierreChTux\_twitter C was there a long time ago, but that doesn't stop people making new languages called just by a letter: V.**

**Irrelevant answers are unfortunately common even for very preicous search terms, that's not a Red related problem, but that the search engines don't care about the context (aha!)**

**And I remember that even Rebol name was disliked by some, as it sounded like "rebel" and wasn't very good with some CE* managers.**

**It's like `brainfuck`. This is a language that is probably very easy to search for, but...**

**[11:04](#msg5ed0ec51b101510b20251092)Also, StackOverflow, I need to look at how many points you need to remove wrongs tags. If I have enough, I'll remove every wrong question marked "red" (it's a good excuse for writing SO bot ;) )**

**dockimbel**

**[11:06](#msg5ed0ec99778fad0b1333a3c8)@GiuseppeChillemi**  
**&gt; I will continue posting about the dangers I see and opinions even if I touch open nerves.**

**If you continue posting your personal illusions as facts here, you will get kicked out. You should read about the difference between "opinion" and "fact" and reflect upon it, because you seem deeply confused. I already told you about that before, but you don't seem to have made any progress at all.**

**rebolek**

**[11:08](#msg5ed0ed1f4412600ccd762196)It's easy: "People can't live on surface of Sun" - fact, "I think that people can't live on surface of Sun" - opinion.**

**loziniak**

**[11:08](#msg5ed0ed3c9da05a060a3b45dd)@rebolek**  
**&gt; I'll remove every wrong question marked "red"**

**@9214 is doing a great job there! :-)**

**rebolek**

**[11:10](#msg5ed0edb8f0b8a2053abf3c28)@loziniak good! I'm not going to interfere with whatever he's doing, he's too good! :-)**

**dockimbel**

**[11:11](#msg5ed0eddef0b8a2053abf3c45)@loziniak Is that about Stackoverflow?**

**loziniak**

**[11:11](#msg5ed0edeb7da67d06fadc1c9d)@dockimbel yep!**

**dockimbel**

**[11:12](#msg5ed0ee0a4c9b0f060d2fb8a8)I have personally removed quite a lot of wrongly used `[red]` tags there too.**

**loziniak**

**[11:12](#msg5ed0ee334412600ccd762540)I'm also subscribed to "red" tag on SO, but I'm mostly too late with fixing tags :-)**

**dockimbel**

**[11:13](#msg5ed0ee583ffa6106f1e07213)There seem to be a race for the +1 or +2 easily earned SO points on tag removal. ;-)**

**loziniak**

**[11:16](#msg5ed0ef22ff7a920a721c5348)@dockimbel Then I've probably been outrun by you as well!**

**GiuseppeChillemi**

**[11:39](#msg5ed0f48a7da67d06fadc2e5e)@PierreChTux\_twitter Red is different, so we have to promote it in a different way than other languages. You have to be innovative and change the classic patterns of introduction, explanation, documentation. Rebol 2.3, while a nice reference manual is dangerous for newcomers. To introduce Red you have to break every style used until now or will you always end up with people trying to apply prior coding knowledge on Red. This creates a disaster, either with developers that do not understand its full potential or them ending up with coding patterns that will be corrected more and more times until they reach Redbol famous "enlightenment" moments (if they persist so long to have them). Red must make them say WOW since they look at it for the first time and then guided to the right way of using it. I have a few innovative ideas that break the previous patterns (but very limited time to build them) and I will start releasing something during the next year. This will be my attempt to help Redbol world go out from the niche where it has been during the last 22 years. Stay tuned!**

**pekr**

**[11:45](#msg5ed0f5cc778fad0b1333bd18)@dockimbel Maybe you remember that the first name for Rebol was actually Lava (Language for Audio and Video applications). Carl came out with Rebol lately and I remember several times wondering, if he should change the name. It was mostly about the Rebol = rebel connotations and I remember RT being close to really choose a different name.**

**I like Red name, just not sure anymore what it stood for initially? Was it a Rebol Endhanced / Extended Dialect? I also like users being called reducers (as in red users) more than rebollers ...**

**GiuseppeChillemi**

**[13:11](#msg5ed10a033ffa6106f1e0b47c)@dockimbel**  
**&gt; @GiuseppeChillemi False information asserted as fact gets picked up as true by readers and spread on the Internet as a truth. What do I have to explain such obvious thing?**

**So, I should consider obvious that a lonely voice which has written 12 months instead of 8, in totally good faith and spirit, will spread all over the internet as some kind of dangerous and terrible accusation? In a place where participants could also write back "no Giuseppe, it has been created in only 8 months!" or the author could say in a kindly and friendly manner "hey, Giuseppe we did it less time!"? And this in a niche world which is 0.000000000001% of the internet, In a situation where we should help each other to overcome this situation? Really?**

**And also should I blame myself because I have put water on the starting flame thread "Red should change its name..." to avoid it taking fire? Wasn't to you \*\*obvious\** such sudden change in my answers (should have been: you are right!) an attempt to keep the peace here? An act of love?**

**My words, as always, have a good spirit behind and they have been written with constructive intent for Red, for us and the whole community. Ask to yourself why you are misinterpreting and taking them so bad.**

**hiiamboris**

**[13:25](#msg5ed10d5ef0b8a2053abf8c64)Sometimes the sanest and the hardest thing one can do is to say "I hear you, I accept and respect your view, and will learn to be more considerate from now on" ;)**

**dockimbel**

**[13:27](#msg5ed10dbe4c9b0f060d3005b1)@hiiamboris :+1:**

**[14:14](#msg5ed118c44412600ccd769028)@GiuseppeChillemi You haven't listened to anything I have told you (as usual and unfortunately as expected). Your understanding of online social dynamics among the tech channel groups where Red sometimes pops up is more than questionable. Nobody cares about what's happening in your brain when you post, people care about what they read in the posts. Getting your facts straight when posting here (or at least showing that you've tried to) is an expected mark of respect for other readers. Logical reasoning and fact-based statements seem out of reach for you. Until you show that you are capable of distinguishing facts from opinions and brain states from arguments, I strongly suggest you post in other rooms than this one, to avoid lowering the signal/noise ratio here further more. I hope I have been clear enough.**

**PierreChTux\_twitter**

**[14:32](#msg5ed11ce627513a72fbbec245)&gt; More generally, the case with Guiseppe is just another reminder for me that our setup and interface with the community here on Gitter is inadequate. It's a mix of contributors to Red and pure users (non-contributing). This kind of setup seems increasingly wrong to me since several years. We should have a semi-public space (with filtered write-access) where we meet with contributors and a separate fully public space for users (where the Red team will be represented by community managers only). Gitter does not offer enough flexibility for such finer-grained access control, it's either fully public or fully private.**

**I totally agree on the fact that this gitter is fine for fun, quick conversations, but if there's a quite serious subject, where one has to argue, show arguments, discuss, etc. nothing beats a good old mailing list (in my very humble opinion). Or a forum, there used to be a few of them dedicated to Rebol.**

**GiuseppeChillemi**

**[14:35](#msg5ed11d9789941d051a2e7bec)@dockimbel**  
**&gt;&gt; Nobody cares about what's happening in your brain when you post, people care about what they read in the posts.**

**Contexts are needed to understand the meaning of words, you can't read my brain but I can explain what is behind my words. This is why I show the context where they are bound.**

**(See you soon!)**

**PierreChTux\_twitter**

**[14:39](#msg5ed11e97ff7a920a721cd4dd)&gt; When talking to such people or non-programmers about Red, you gave them a direct link, you don't let them search on their own.**

**Well, such people often don't "trust" you: they think that you're some kind of fanatic, that you have something to "sell" them, so they just want to make up their mind by themselves. If you provide them with a URL, they may look at it very fast, and then google on their own.**  
**It's unfortunately true, I've lived it, several times.**

**&gt; Searching for "red language" gives 10/10 relevant results on first page on Google, 9/10 on Bing.**

**Well, you're lucky. It's not the same for me. The URL mentioned above was found using "red language", precisely. I can't remember my full search, though, I think I was looking for some information I had seen previously on stackoverflow, or something.**

**&gt; &gt; what about resources outside of that world: for instance, a stackoverflow discussion, or a blog where someone suggests using Red (and forgets about writing Red Language or Red Lang or RedLang or Red-Lang): this entry will be unsearchable, very unfortunately.**  
**&gt;**  
**&gt; When that "someone" does it correctly, he will include a link to Red website, so such referent links can be searched for in Google.**

**Some people do. Some don't.**

**&gt; &gt; Remember the old Rebol days? Googling Rebol was always leading to very relevant hints, and sometimes excellent surprises lying outside the Rebol world/community.**  
**&gt;**  
**&gt; Rebol was a unique name, but at the same time the "ol" ending mislead a lot of people thinking it has to do with COBOL, making some newcomers run away (though the closed-source nature was by far the biggest bouncing factor).**

**Yes, true. That closed-source nature made other people whom I had met run away, also... I feel kind of desperate, sometimes...**

**[14:46](#msg5ed12048b101510b20259b19)(sorry for noise/signal ratio: I switch myself off...)**

**theSherwood**

**[14:50](#msg5ed1211cf0b8a2053abfc165)I'm new here. So maybe I have a mistaken impression. Maybe I came at a bad time. Or maybe I can say these things, because I have invested the least and so have the least to lose by angering @dockimbel, whereas many of the rest of you have learned to work with him. But if making a mistake, such as a rounding error (1 year vs 8 months), when trying to emphasize the monumentality of someone's work, or making a claim without first prefacing it with "I think..." is met with accusations of attempting to spread misinformation, condescension, and threats of banning; then your community has a problem. I have seen nothing from @GiuseppeChillemi in my time here to indicate that he is doing anything but making a good faith effort. My impression of you, @dockimbel, offers more than a whiff of paranoia.**

**In my experience here so far, everyone has been helpful, has acted in good faith, and made charitable interpretations of the words of others until @dockimbel enters the chat. Then everyone walks on eggshells.**

**Again, I have not been here long. Maybe this is a false impression. But I am not in the habit of standing idly while people are mistreated, and, as far as I can tell, @GiuseppeChillemi has been mistreated.**

**dockimbel**

**[14:51](#msg5ed121594412600ccd76a740)@PierreChTux\_twitter It's not as much about the display medium but rather the writing access control. This channel is supposed to be a working channel, for the Red team and contributors to collaborate. It's fully public, yet it's not an open bar for anyone passing by to jump in, grab a beer and start talking nonsense.**

**[14:53](#msg5ed121df778fad0b13342ff6)@theSherwood Your views are understandable and I'm sorry for giving that impression. There's a long history with Giuseppe.**

**PierreChTux\_twitter**

**[14:53](#msg5ed121e5549761730b666798)@dockimbel All right, sorry. Thanks for clarification, because that wasn't obvious. I thought this room was just the "main" one.**

**theSherwood**

**[14:56](#msg5ed122b42280c80cbfd7ca03)@dockimbel I appreciate your response. And I hope your ideas about changing up the rooms/chats/fora help to address some of these issues.**

**dockimbel**

**[15:06](#msg5ed125052c49c45f5aada9e3)I wonder how other open-source projects handle the splitting between pure users and active contributors. We have many private channels for that, but not all contributors are there, so there's a buffer area (which is currently this chat group), where we can interact with new potential contributors. If it wasn't for that, I would not burden people here with my annoying presence. ;-)**

**GiuseppeChillemi**

**[15:11](#msg5ed126159da05a060a3bd7eb)@dockimbel Doc, I am a sincere man and I don't want to embellish/change my thoughts to please anyone. This is because you have what you call "a long history with me". In the long term I am sure you will appreciate someone who is sincere about Red choices than writing "its all ok, Nice done Doc".**  
**Also, I ask to everyone if we move to chit-chat as if you talk about me I have to reply here, prolonging this discussion in red/red.**

**dockimbel**

**[15:16](#msg5ed127379da05a060a3bdbbf)@GiuseppeChillemi You still show no understanding at all about what I told you so far. It has nothing to do with sincerity or good/bad intentions. It's hopeless, so I give up. I know you always need to have the last word, right? :-)**

**GiuseppeChillemi**

**[15:24](#msg5ed1292b2280c80cbfd7dff2)It's the opposite:**

**[15:24](#msg5ed1293a27513a72fbbee545)&gt;&gt; Also, I ask to everyone if we move to chit-chat as if you talk about me I have to reply here, prolonging this discussion in red/red.**

**[15:25](#msg5ed12973f0b8a2053abfd9e6)I am asking everyone to move on chit chat to respect your request to move away from here with such discussion.**

**pekr**

**[15:28](#msg5ed12a042c49c45f5aadb794)@dockimbel As a long time Rebol community member, and rebel and sometimes a trouble maker without the u derstanding for political correctness, I was historically contacted by few ppl, asking about the hostility of this channel, in private. Some ppl even left because of that. Sometimes I refrain from asking some questions, especially when I can feel I might not be technically correct, just to not upset anyone here or facing the claims of harming Red.**

**[15:30](#msg5ed12a8e2280c80cbfd7e3a4)From Carl I remember "there is no wrong question" moniker. I also don't remember myself from refraining to ask something on Altme. I know that it was a closed space.**

**[15:34](#msg5ed12b6f2280c80cbfd7e607)I was quite surprised, that statement like fast-lexer is finally here after one year of development, did get you started. Sometimes I also think, that there is a language barrier. And maybe, we need some devcons too, to actually have a beer ;-)**

**vazub**

**[16:18](#msg5ed135e83ffa6106f1e137fb)Hey guys, may I kindly inquire what is the status of VSCode extension development? It appears to be on hold - is that correct?**

**greggirwin**

**[16:30](#msg5ed1389f778fad0b133474f5)@vazub one of the driving reasons behind the fast lexer work was for the VSCode extension, so it will be the focus of some effort soon.**

**vazub**

**[17:14](#msg5ed142fb9da05a060a3c2bde)Sounds good! thanks!**

**greggirwin**

**[17:20](#msg5ed14461549761730b66c603)Dear Reducers,**

**We're fortunate that flare-ups are rare in our community, but, we're human, chat is an imperfect medium, we are a diverse group, and English isn't a first language for most here. Episodes like this can happen for a number of reasons. We work through them, and move on. Our diversity is our strength, but also a challenge. Developers aren't always the most socially adept or patient. While defending strongly held views and debating their merits (sometimes heatedly) is how progress is made, it's also hard work. Add to that the stresses of work and life, miscommunication, some personalities simply rubbing each other the wrong way, and you have a recipe for periodic pressure release.**

**Unfortunately, there is no easy solution. Nenad and I had a long chat this morning, and I understand there has been some private chat between others. It's fine to be angry, and it happens to all of us. We have community guidelines to help keep us on track, and every person here is expected to abide by them or be called out on their behavior.**

**We do try to note issues that come up repeatedly, and the best way to deal with them is to point people to those. I will add an entry on the Red Should... wiki page about naming.**

**On behalf of Team Red, know that we do our best and want this to be a welcoming and friendly place. With so many channels we often have to work from incomplete information, or with little context. Bear with us, be patient with each other, be as kind as you can, and remember that we all have our moments.**

**Respectech**

**[17:28](#msg5ed1462a549761730b66cbd1)Thanks Gregg.**

**theSherwood**

**[17:34](#msg5ed147ab549761730b66d015):thumbsup:**

**hiiamboris**

**[17:46](#msg5ed14a622c49c45f5aae17d9)@greggirwin won't \[FAQ](https://github.com/red/red/wiki/\[DOC]-FAQ) be a better place for naming stuff?**

**greggirwin**

**[17:46](#msg5ed14a77f0b8a2053ac037ec)Probably so. Thanks.**

**rebolek**

**[18:36](#msg5ed156319da05a060a3c6262)@pekr according to Carl there was no wrong question but there also wasn't an aswer for a few years sometimes :-D**

**[18:38](#msg5ed156b32c49c45f5aae396a)Anyway, there's no wrong question, but if it's "Red is a wrong name, you can't google it, blablabla" for thousand time, it gets boring.**

**GiuseppeChillemi**

**[19:03](#msg5ed15c6d7da67d06fadd5127)@rebolek I made some time ago the choice to not debate Red name because if people keep their position on a topic they have made a choice. This is the reason why today I have not fuelled the discussion about it. I don't know the motivation behind but the choice appears to be definitive and won't change, whatever good reason you can bring in the debate. So I have to move forward and respect it.**

**[19:05](#msg5ed15d112c49c45f5aae48f2)@greggirwin Thanks for your words, they have been written with deep knowledge of humans and their dynamic.**

**planetsizecpu**

**[19:45](#msg5ed1664b7da67d06fadd712e)Wow! it was a Fire&amp;Fury day. Thx Gregg for your kind words.**

**`The reasonable man adapts himself to the world; the unreasonable one persists to adapt the world to himself. Therefore all progress depends on the unreasonable man.`**  
**George Bernard Shaw**

****Saturday 30th May, 2020****

**blkstph\_gitlab**

**[02:06](#msg5ed1bfa7549761730b67f6bb)Hope I'm not too late to vote! I think red is a great name! First of all, it hints of the lineage: redol :-). Second, it is super terse: three letters. Third, it has pun value: reducers, reduce, etc. Fourth, it is very very memorable: what other language is a bright red color...or a color at all? Even if someone somehow hears the name and forgets it - does anyone think they won't at least remember it is a primary color? Fifth, doc likes it -- and that counts for at least 5 points all by itself. It is really important that the primary architect of a language likes the name.**

**theSherwood**

**[02:46](#msg5ed1c8f127513a72fbc076ec)With respect to variable arity functions (a la https://github.com/red/red/wiki/%5BDOC%5D-Red-Should...-(Feature-Wars)#support-variable-arity-functions). I don't know enough Red to understand how difficult this might be to implement., but in terms of syntax, is there anything wrong with the following:**

**`foo: func [ a b c. ][ print [ a b c ]] foo 1 2 3 4 5 6 . ; => 1 2 3 4 5 6`**

**[02:47](#msg5ed1c94d225dc25f54b50b34)Where any function argument terminated with `.` collects the remaining values into a block up until the `.` of the function call site.**

**[02:48](#msg5ed1c974778fad0b1335d8af)**  
**`foo: func [ a [integer!] b [integer!] c. [block!] ][ print [ a b c ] ]`**

**pekr**

**[04:39](#msg5ed1e376549761730b683648)The problem is, that `c.`is a regular word! value. So you can have words like `person.name`for e.g. But maybe the separate dot or other char, might do it . But I am not expert at functions, so not sure how deep change it would be ...**

**toomasv**

**[04:47](#msg5ed1e5643ffa6106f1e2ccdc)@theSherwood You can do this, if you really need, with source transformation by `lexer/pre-load`. You will need extra care though to target your transformations.**

**greggirwin**

**[05:06](#msg5ed1e9d0f0b8a2053ac1b69e)Consider unevaluated parameters. e.g. `func [a :b.][...] func [a 'b.][...]` as well. I believe people have played with the idea of an expression terminating symbol before. Experiments are fun.**

**theSherwood**

**[05:23](#msg5ed1edde549761730b684beb)Thanks for the feedback. I may play around with this a bit.**

**giesse**

**[05:54](#msg5ed1f50c3ffa6106f1e2efb0)@theSherwood is that really any better than `(foo 1 2 3 4 5 6)` (write your own Lisp-like dialect) or `foo [1 2 3 4 5 6]` (the Red way)?**

**pekr**

**[06:08](#msg5ed1f8497da67d06fadeb388)@giesse is right. I have always thought that ppl find enclosing args in block too heavy. Now as I can see it written, it does not look so bad. Not sure why there is such a reluctance historically for rebollers to think along the lines ....**

**[06:10](#msg5ed1f8cba91f120a6cd0c846)Could we also use following form? `foo (1 2 3 4 5 6)` ? In comparison to block the difference would be that the paren would get evaluated before submitting to a function?**

**toomasv**

**[06:47](#msg5ed2016cb101510b2027a7bd)@pekr In simple case this will evaluate to `foo 6`. I.e. unless `foo` is defined with get-word arg.**

**[07:19](#msg5ed2091df0b8a2053ac1f34e)@theSherwood E.g.:**  
**`system/lexer/pre-load: function [source][ parse source [ some [ #"f" "oo " change [s: to #"." e:] (rejoin [#"[" copy/part s e #"]"]) remove skip | skip ] ] ]`**  
**`>> "foo 1 2 3." == "foo [1 2 3]" >> foo: func [arg][sum reduce arg] == func [arg][sum reduce arg] >> foo 1 2 3. == 6 >> foo 1 2 3 4 5. == 15 >> set [a b c] [11 12 13] foo a b c. == 36 >> 10 + foo 1 2 3 4. == 20 >> a: foo 1 2. b: foo 3 4 5. foo a b 2 3. == 20`**

**hiiamboris**

**[07:32](#msg5ed20c2a27513a72fbc0f4ed)@theSherwood You can do this at the DSL level too, without preload. But keep in mind that "rest of the arguments" in Red extends to the end of the enclosing block, or to the end of file**

**pekr**

**[07:56](#msg5ed211c3ff7a920a721f0aa1)@toomasv nice example. And sorry for such an amateurish try with the paren, I should know better :-)**

**toomasv**

**[08:01](#msg5ed212f127513a72fbc104b2)@pekr But it works with get-word :) :point\_up: \[May 19, 2020 8:02 PM](https://gitter.im/red/chit-chat?at=5ec41108520b7a38fbde6d39).**

**giesse**

**[19:42](#msg5ed2b72c778fad0b1337f358)@pekr also don't forget, that depending on your keyboard, () require shift while \[] do not.**

**GiuseppeChillemi**

**[22:18](#msg5ed2dbcd2280c80cbfdbcf61)@greggirwin**  
**&gt; @vazub one of the driving reasons behind the fast lexer work was for the VSCode extension, so it will be the focus of some effort soon.**

**Driven by curiosity and the needing to learn, I ask why VSCode extension has needed fast lexer? Was the previous one unable to handle the text to code conversion sufficiently fast?**

**greggirwin**

**[22:32](#msg5ed2df092280c80cbfdbd664)Coming from \[Red/Help :point\_right:](https://gitter.im/red/help?at=5ed1ec53f0b8a2053ac1bc33) WRT JS as a target.**

**&gt; So everytime we mention JS here, there dies one little kittie somewhere around the world, right? :-)**

**Yes. A really cute one. Sometimes it's a baby duck. That's why I never mention it. ;^)**

**Companies target the browser because that's where the users are. Same reason for mobile. Same reason they write things to work inside social media systems. Red running on every possible platform would be a great thing. But \*being* on those platforms won't make Red successful. It has to achieve a certain level of success \*first\*.**

**At most companies, the corporate desktop OS is still Windows. On the server side it's now split, with Linux taking a large share, especially on the cloud. But the cloud changes things, just like the internet did. With the rise of the 'net, you could move servers \*away* from Windows, now you can move them \*back\*. Just as you can now write in any language you want, if it runs on a server.**

**Zero deployment (the brower model) is big for IT, as well as forcing updates and preventing users from installing things. But it doesn't come for free. Just as Linux doesn't come for free. Zero install can also be a win for users, a big one. Mobile is close to that now, but app stores allow people to make money, so those won't go away anytime soon.**

**@GiuseppeChillemi https://www.red-lang.org/2019/10/a-deeper-dive-into-fast-lexer-changes.html**

**GiuseppeChillemi**

**[22:58](#msg5ed2e51b9da05a060a3fe744)Thanks, I have missed that article.**

****Monday 1st June, 2020****

**meijeru**

**[16:06](#msg5ed52781a91f120a6cd80c8b)I have a problem checking the latest commit. See below**  
**`>> c: load https://api.github.com/repos/red/red/commits == [#( sha: "f246514f19dceb958bf5430e791b6db411ab70df" ... >> ? system/build/git SYSTEM/BUILD/GIT is an object! with the following words and values: branch string! "master" tag issue! #v0.6.4 ahead integer! 2023 date date! 1-Jun-2020/17:43:56+02:00 commit issue! #5b133520e86005a264f71c6ccb02b85a98a57f70 message string! {Merge branch 'master' of https://github.com/red/red}`**  
**The date and time checks, so I have the latest. But the commit data do NOT check. `system/build/git/commit` is NOT equal to `c/1/sha`. Or do I do something wrong?**

**[16:15](#msg5ed529b5a3a1b13679be5c0a)I have checked, but there is no commit `#5b13352` as far as I can see. So where does this number come from?**

**[16:27](#msg5ed52c5aff7a920a72262c77)Also, the message is odd, because there is a commit with that message, but it has another number `#2417a84`**

**hiiamboris**

**[16:28](#msg5ed52c9f3ffa6106f1ea53f0)That's pretty common commit message**

**meijeru**

**[16:28](#msg5ed52cb4225dc25f54bcd0a3)I looked up the most recent one...**

**Respectech**

**[17:53](#msg5ed540a6daf4cf366ed5b3e8)"Companies target the browser because that's where the users are." That may be true for some companies. For us, we have to use the browser because it is the only way to have cross-platform compatibility to achieve our paperless workflow. If Red with GUI ran on Linux (x86 and ARM), Windows and Android, we'd rather use a native Red UI. IIRC, there may be a way to run Linux apps on Android - haven't tested it with Red/GTK yet.**

**[17:54](#msg5ed540cab101510b202f2957)Another big win for using the browser is that printing, history, and other features are zero-effort.**

**greggirwin**

**[18:33](#msg5ed54a0f3ffa6106f1eaa3c4)The browser is a new, higher level, OS.**

**[18:52](#msg5ed54e52daf4cf366ed5dba0)@meijeru, @x8x can correct me, but at a glance it looks like the `commit` is actually the SHA of the commit, as it uses `git rev-parse HEAD` to get that value. Git and I have a tenuous relationship, so I may be wrong here.**

**hiiamboris**

**[18:56](#msg5ed54f5989941d051a381a8f)Both things are SHA-1 of it.**

**[18:56](#msg5ed54f7b89941d051a381abf)Compare `git rev-parse HEAD` and `git log`**

**greggirwin**

**[19:07](#msg5ed551f2778fad0b133ded4a)Indeed. I confused myself due to local replays. :^\\ So where did `5b13...` come from? Recent CI issues?**

**GiuseppeChillemi**

**[19:26](#msg5ed5566589941d051a382f88)&gt; The browser is a new, higher level, OS.**

**You are right, soon PCs will become only targets to install browsers, like thin client are for RDP. Browsers will dominate just because everything is equal everywhere and also because companies can easily implement SaaS software politics which is the golden cow of money and control.**

**Oldes**

**[20:19](#msg5ed562d02c49c45f5ab78187)@GiuseppeChillemi I don't think so. I'm definitely not interested to do my data processing or gaming in browser. Browser is good for chats.. news.. streaming movies.. but I don't want to be dependent on any browser.**

**[20:22](#msg5ed5638bd137513704336bfa)Actually I want to use lightweight browsers and not monsters which will try to become selfhosted systems in each tab I open.**

**pekr**

**[20:27](#msg5ed564b089941d051a385975)So because you don't need it, you write-off all the corporate guys? :-)**

**greggirwin**

**[20:28](#msg5ed564e74c9b0f060d3a3935)I think Oldes is just stating his personal preferences.**

**Oldes**

**[20:32](#msg5ed565de7da67d06fae68a74)Yes.. my personal prefetence is to use raw pc.. and not just use pc to run browser in it.**

**[20:33](#msg5ed56630a3a1b13679bf08e0)And I personally don't care about any corporate guys who just hardly know what URL neans.**

**GiuseppeChillemi**

**[20:52](#msg5ed56a7bff7a920a7226df5c)@Oldes I don't want too but it will happen. Big money is being put on SaaS inside the browser for a lot o strategic reasons. PCs will not disappear but there will be the tendency to clientify our machines and us. Even games will be remote based (If you want, lets' continue in chit/chat)**

**Oldes**

**[21:03](#msg5ed56d0ddaf4cf366ed63366)@pekr Just to make it clear.. I have nothing against browsers.. I'm still maintaining some webpages... and I started as a game developer where browser was our main (currently dead) target.. so I think.. that I'm not just some unknown corporate guy.. I just don't agree with @GiuseppeChillemi**  
**that PCs future is in browser space.**

**greggirwin**

**[21:04](#msg5ed56d452c49c45f5ab79c56)If anybody can predict the future, we'll hire them. :^)**

**x8x**

**[23:45](#msg5ed5931db101510b202ffb73)&gt; I have checked, but there is no commit `#5b13352` as far as I can see.**

**Thank you @meijeru and great catch (as always!)! A recent commit message amendment or force push on the main repo brought the builder's clone out of sync, it was doing an extra merge commit (#5b13352 in your case) on top of every commit. This is now fixed and builder will account for possible forced events on the main repo.**

****Tuesday 2nd June, 2020****

**greggirwin**

**[21:44](#msg5ed6c830a91f120a6cdc97c9)Do we have any React experts in the community? If so, ping me.**

****Wednesday 3th June, 2020****

**meijeru**

**[11:30](#msg5ed789c59da05a060a4b54a3)@x8x Commits are synchronized again!**

**PierreChTux\_twitter**

**[13:21](#msg5ed7a3e5a91f120a6cde9e8e)&gt; If anybody can predict the future, we'll hire them. :^)**

**I'm able to (partially) predict the future, surprisingly accurately (others say that, not me).**  
**Don't hire me for that reason, though.**

**cloutiy**

**[14:15](#msg5ed7b0784c9b0f060d405e3e)@greggirwin I often react. Not sure that makes me an expert.**

**greggirwin**

**[16:36](#msg5ed7d19bb101510b2036182b)@PierreChTux\_twitter send me your predictions, and we'll award you for every correct one. ;^)**

**[16:37](#msg5ed7d1c9225dc25f54c3d3d8)@cloutiy I suppose, like Reducers, for flow-based work we could be called Reactionaries.**

**GiuseppeChillemi**

**[17:11](#msg5ed7d9dd7f08394226c4bcb5)We are Revolutionaries!**

**PierreChTux\_twitter**

**[20:33](#msg5ed809004c9b0f060d416c5d)&gt; @PierreChTux\_twitter send me your predictions, and we'll award you for every correct one. ;^)**

**Okay.**  
**So: the Earth will keep on turning, and a glaciation is going to happen. Probably in ca. 0.013 My. Yes, my base unit for time measurement is 1E6 years.**

**greggirwin**

**[21:02](#msg5ed80ffab101510b2036d104)On confirmation of those events, a check will be mailed. :^)**

****Thursday 4th June, 2020****

**meijeru**

**[16:09](#msg5ed91cbf7f08394226c7e744)Just finished writing up the facilities `transcode`, `scan` and `rawstring` in the spec document. It occurred to me that with `scan`, Red has increased its ability for dialecting!**

**ALANVF**

**[16:18](#msg5ed91ed122dd444224fb3666)all it needs now is the `delect` native from R3**

**GiuseppeChillemi**

**[20:15](#msg5ed9564f89941d051a42d544)@ALANVF I don't know what it does.**

**greggirwin**

**[21:00](#msg5ed9610a778fad0b1348d91b)Thanks @meijeru!**

**I never used `delect`, as I had my `parse` habits well in place by the time it arrived in R3. :^)**

****Friday 5th June, 2020****

**pekr**

**[04:51](#msg5ed9cf5e7f08394226c9b56a)DELECT was initial means for the R3 componenent architecture, passing an ordered arguments, providing some speed advantage for command interfacing. Later on, I remember Carl stating, that with some update to Core, the speed advantage was lost, or something like that, and that DELECT is going to be deprecated. Well, I might remember it wrongly though ....**

**meijeru**

**[11:36](#msg5eda2e57225dc25f54c9d9eb)Since @qtxie published the repo address for his port implementation work, I have been looking at it with interest. I know it is very much WIP. I still have one remark already: the \_scheme_ names are spelled with lowercase letters in the `port!` and `spec` objects (also by `decode-url`) but with uppercase letters in the `scheme`objects. Since words in Red and Red/System are not case-sensitive, this cannot give confusion, but it is not "neat".**

**[17:16](#msg5eda7e079da05a060a53691e)Another question to be raised: if ports may represent external resources of any kind, what is the significance of the `spec` field of the port in case the resource has no URI (e.g. the GPIO port already provided). Is it obliged to have the same structure as a URI spec (`system/standard/url-parts`)?**

****Saturday 6th June, 2020****

**meijeru**

**[12:43](#msg5edb8f6a778fad0b134e4619)On REBOL wiki DocBase: it is also copied (or re-created) on Github! See \[here](https://github.com/revault/rebol-wiki/wiki)**

**[13:21](#msg5edb983edaf4cf366ee62b09)@rebolek Have I missed something? Your unofficial builds page \[https://rebolek.com/builds/](https://rebolek.com/builds/) gives `403 Forbidden` for each of the OS versions.**

**rebolek**

**[18:21](#msg5edbdeb022dd4442240216f2)@meijeru I had troubles with my old VPS provider (he deleted my VPS without prior warning) and had to reinstall everything elsewhere. Building is working fine but I switched from Apache to lighttpd and haven't figured how to make softlinks work. True is that nobody complained until now so I haven't actually spent much time fixing it. :-) I'll go thru the guides again to solve it, or if anyone has experience with lighttpd, I'll appreciate some advice.**

****Monday 8th June, 2020****

**artthoumad\_gitlab**

**[09:41](#msg5ede07b49da05a060a5b74d1)Hello everyone. I've just stumbled upon red lang and I'm amazed by it. However, I can't seem to find any runtime performance data. I'm just looking for an estimation on how Red measures up on average when compared with something familiar like C or C++. Does anyone have any links or personal experience on this?**

**rebolek**

**[09:52](#msg5ede0a6a22dd44422406ef96)@artthoumad\_gitlab Hi and welcome! Red is higher-level interpreted language, so its speed should be compared more to Python or other interpreted languages. However, there is Red/System dialect (in which Red is written) that is more on pair with C in terms of closeness to HW and also compiled, like C. Red/System is currently unoptimized and is about 2-5x slower than C.**

**artthoumad\_gitlab**

**[10:05](#msg5ede0d54ff7a920a723c37b6)@rebolek Thanks. I was reading a discussion on reddit about the suitability of Red for 3d games and visualisations and it was proposed that using Red/System for the core "engine" and Red for the higher level logic could achieve this. That doesn't seem too bad at all for its current state. I'm looking forward to tinkering with it after work :)**

**rebolek**

**[10:50](#msg5ede18017da67d06fafc58fd)@artthoumad\_gitlab yes, splitting higher level logic to Red and lower level math to Ted/System is good idea.**

**meijeru**

**[15:35](#msg5ede5aa74c9b0f060d50dba7)A new feature: caret `^` is allowed in words (also at the start). Not allowed remain `/ \ , [ ] ( ) { } " # $ % @ : ;`. Each of these disallowed ones has an obvious motivation, namely that they occur in literals/constructs of other types, except `\`. So my question is: if we are liberalizing the make-up of words, why not allow `\`?**

**[15:36](#msg5ede5b044c9b0f060d50dcdc)One reason could be that `\` may be needed in literals of a, as yet undefined, new type. But that could have been the case for `^` as well...**

**rebolek**

**[16:13](#msg5ede638cb101510b2046204a)@meijeru I was asking about `\` recently and as I understand it, it's reserved for future use.**

**hiiamboris**

**[16:28](#msg5ede673489941d051a4f234d)**  
**`>> ^_^ == -_-`**  
**Wow great! One more step towards emoji programming ☺**

**ALANVF**

**[16:49](#msg5ede6c33daf4cf366eecbbc5)that's awesome**

**PierreChTux\_twitter**

**[18:41](#msg5ede865aa3a1b13679d6007e)«emoji programming»: would this be a sort of regression, from an alphabet-driven language towards an ideogram-driven language?**  
**Well, actually, it may not be a regression at all; that depends much on the cultural point of view...**

**[18:45](#msg5ede8736a91f120a6cef924c)I had a \*crazy idea* (you've been warned), some time ago: building an LFS (Linux From Scratch: http://www.linuxfromscratch.org/lfs/) BUT using Red/System and Red instead of C.**

**[18:46](#msg5ede876c22dd444224085781)I had already built an LFS, ca. 20 years ago, and it's extremely interesting and self-educative.**

**meijeru**

**[18:50](#msg5ede885e7da67d06fafd9855)Is there a reason why the JSON and CSV decoders do not accept a `url!` source? The image decoders \_do\_.**

**PierreChTux\_twitter**

**[18:56](#msg5ede89d522dd444224085f94)Now, I recently read an article about Guix: https://linuxfr.org/news/guix-un-outil-pour-les-remplacer-tous (sorry, it's in French). One paragraph got me particularly interested, I'll try to translate it here:**

**&gt; It may seem a rather innocent choice to use a programming language instead of «static» configuration files for a GNU/Linux distribution (and even a package manager), but in fact it changes the whole picture.**  
**&gt; When using languages dedicated to a specific domain (DSLs), one is always limited in the possibilities of configuration and by the necessary step of learning a new syntax. Guile becomes a kind of universal language, extremely flexible and allowing infinite abstraction levels, typical of programming languages.**  
**&gt; Moreover, thanks to bindings with the various software packages, on can completely configure his machine in Guile language, without going through configuration files editing of such or such service.**

**While reading this, I obviously s/Guile/Red/g in my mind, and I felt like there was a \*very* deep lake underneath.**

**[19:00](#msg5ede8adfdaf4cf366eed17ac)Writing a LFS in Red/System and Red, instead of C, is quite a \*huge* job. But rewriting a Red version of Guix by using Red/Rebol instead of Guile may be a slightly more reachable goal.**

**rebolek**

**[22:18](#msg5edeb94af0b8a2053ae152ec)@meijeru How they don't accept `url!`?**

**`>> load https://www.reddit.com/r/amiga/comments/gz12b2/beyond_a_steel_sky_official_story_trailer.json == [#( kind: "Listing" data: #( modhash: "" dist: 1 children: [#( kind: "t3" data: #( approved_at_utc: none subre...`**

**Do you mean `load-json` and `load-csv`? If yes, what are image equivalents?**

**BenStigsen**

**[23:07](#msg5edec4b0daf4cf366eedb166)Hello! If I remember correctly Red had some kind of way to make functions take the prefix? Such that you could define a function called `div` and then you'd be able to call `5 div 2` somehow? How do I do that?**

****Tuesday 9th June, 2020****

**dander**

**[00:47](#msg5ededc2a2c49c45f5acf5eca)@BenStigsen the infix functions are called `op!`, and are documented \[here](https://doc.red-lang.org/en/datatypes/op.html#\_creation). The quick answer is `div: make op! :divide`**

**ALANVF**

**[01:27](#msg5edee59f2c49c45f5acf7115)the examples on that page seem a bit off, but maybe that's just me? `&&` and `||` are generally short-circuiting, are they not?**

**[01:28](#msg5edee5c7225dc25f54d52299)you'd probably want to quote the args or use a macro**

**dander**

**[02:23](#msg5edef2937f08394226d617bf) I believe `any` and `all` short-circuit**

**GalenIvanov**

**[07:07](#msg5edf35364c9b0f060d530891)&gt;«emoji programming»: would this be a sort of regression, from an alphabet-driven language towards an ideogram-driven language?**

**[07:08](#msg5edf35574c9b0f060d5308d3)@PierreChTux\_twitter : What about APL? \[Notation as a Tool of Thought](https://www.jsoftware.com/papers/tot1.htm#0)**

**meijeru**

**[10:01](#msg5edf5e142cf2f36eae4a7c2b)@rebolek Then `load` must do the reading before calling `decode` apparently. But then why does `decode` admit `file!` because `load` will also have done the reading of the file contents...**

**[10:04](#msg5edf5eac49260560aa4c9866)In other words, will `decode` ever be called other than with a `string!` argument?**

**rebolek**

**[10:07](#msg5edf5f545dcbb760b6dad32d)Now I understand hat you are asking. See the `load` source, in case of `url!` data are read with `read/info/binary` and decoder is selected based on MIME type.**

**[10:08](#msg5edf5f9e7c64f31f114c834c)`decode` is called also for `file!` where it selects right decoder based on suffix.**

**[10:09](#msg5edf5fcea85de30394011254)So unless you feed `url!` to `decode` manually, it can't encounter it.**

**[10:11](#msg5edf605d30401c1f24457f92)If you have `string!`, `decode` is not used actually, it uses `transcode` as it doesn't know what's the type of the data (unless you use `/as`)**

**meijeru**

**[12:15](#msg5edf7d5c29d8bc28f9e5db67)OK thanks for the explanation**

**rebolek**

**[13:46](#msg5edf92b130401c1f24460d43)you're welcome**

**BenStigsen**

**[14:05](#msg5edf971a49260560aa4d442c)@dander**  
**&gt; @BenStigsen the infix functions are called `op!`, and are documented \[here](https://doc.red-lang.org/en/datatypes/op.html#\_creation). The quick answer is `div: make op! :divide`**

**I'm 99% sure I've seen an example where it's possible to do this while defining the function. Something like so: `some-function: function [/infix a b]` I just can't remember how to do it.**

**rebolek**

**[14:11](#msg5edf98a42cf2f36eae4b2a99)@BenStigsen that's possible in Red/System: https://static.red-lang.org/red-system-specs.html#section-6.3**

**BenStigsen**

**[14:12](#msg5edf98ce5dcbb760b6db6fbc)Aha! That's where it was. Thanks!**

**rebolek**

**[14:15](#msg5edf999d7a7f8d2d63246126)you're welcome**

**BenStigsen**

**[15:20](#msg5edfa8be1e099b0388b66a18)**  
**`red Red [Title: "Test Script"] avg: func [[infix] a [integer!] b [integer!] return: [integer!]][ (a + b) / 2 ] 10 avg 6`**

**I've simply copied the example from https://static.red-lang.org/red-system-specs.html#section-6.3, and it's not working. I'm getting the error:**  
**`*** Compilation Error: invalid function spec block: [[infix] a [integer!] b [integer!] return: [integer!]]`**

**hiiamboris**

**[15:29](#msg5edfaaf730401c1f2446527f)You're declaring a Red function, not Red/System.**

**BenStigsen**

**[15:31](#msg5edfab5c24a3382d5d572ee1)Oh right, I've been messing with it for 30 minutes now just looking at it trying to understand what's wrong. Thanks**

**jedavis47**

**[15:38](#msg5edfacf924a3382d5d5734d7)Very basic question... I am exploring RED as an alternative language. I am having terminal problems. Down load it and follow instructions which say - first time click compiles console app &amp; second click thereafter runs the app. Not so... Every click causes a recompile that takes about 2 minutes. Amazing for 1.2 MB of script. What am I missing here? Why does the console window disappear after about 30 secs? Same thing with compiled scripts. Script compiles ok generating .exe file which runs perfectly. If I watch the directory the .exe file disappears on its own. I obviously don't get something. Is there any organized documentation other than the basic script demos? Thanks in advance.**

**hiiamboris**

**[15:42](#msg5edfadf8013105125a24443a)@jedavis47 I wonder if you have admin rights to your PC?**

**[15:43](#msg5edfae2e5782a31278eb2ba1)On a second thought, that must be your AV. 99.9%**

**[15:44](#msg5edfae71013105125a244584)I recommend whitelisting Red in the AV and reporing a false positive to the AV vendor.**

**jedavis47**

**[15:45](#msg5edfae8524a3382d5d573b25)Yes, all programs were run as administrator.**

**[15:47](#msg5edfaf2f29d8bc28f9e671f7)The program is running under Windows 10. There is no whitelisting that I know of.**

**hiiamboris**

**[15:49](#msg5edfaf6e013105125a244a1a)Well, if you didn't install AV yourself, then it came with your PC preinstalled. Likely MSE.**

**[15:51](#msg5edfaff8035dfa12610d3174)@jedavis47 https://www.google.com/search?q=what+antivirus+is+installed+on+my+PC**

**jedavis47**

**[15:53](#msg5edfb0955dcbb760b6dbb711)The AV is just the standard MS defender. It finds no problem with the download of RED. I assume RED is clean as it is downloaded from the official site. None of this makes any sense to me. This should be straight forward.**

**hiiamboris**

**[15:55](#msg5edfb0da29d8bc28f9e677ce)Well, I haven't heard of MS Defenerer deleting files silently so there should be something else.**

**jedavis47**

**[15:58](#msg5edfb1c25dcbb760b6dbba3f)Nor have I. I have never seen this before. Doesn't speak well of RED. "It's just that easy!" seems to be a misnomer. I think I'll go back to Rebol and wait. Thanks for your help.**

**hiiamboris**

**[16:00](#msg5edfb2097a7f8d2d6324a5ec)Red has no control over your OS or the software you have installed.**

**pekr**

**[16:00](#msg5edfb2327a7f8d2d6324a645)" Doesn't speak well of RED" - sorry, but it sound almost as an insult. Your exe disappearing from your OS after compilation is hardly Red related issue.**

**jedavis47**

**[16:07](#msg5edfb3a6013105125a245838)Agreed. Therefore, it makes even less sense. You completely misunderstand me. I am not insulting RED by any means. I am just trying to get it working so I can evaluate it.**

**pekr**

**[16:08](#msg5edfb3ec7c64f31f114d8550)Just downloaded a Red executable, created small hello.red program, just printing "Hello world", run red.exe -r hello.red and got an executable, which just prints "Hello world".**

**[16:11](#msg5edfb4985dcbb760b6dbc35d)Apart from that, I never liked red.exe much, so I do it differently. I download the sources (I use Github desktop). I put R2/View into the same directory and then I start R2 and type `do/args %red.r "-r %hello.red"`**

**[16:12](#msg5edfb4fe5dcbb760b6dbc566)But generally, to play with Red, you don't need to generate exe, you might be fine to use it interpreted. You can compile a GUI console: `do/args %red.r "-r -t Windows %environment/console/gUI/gui-console.red"`**

**hiiamboris**

**[16:13](#msg5edfb5357a7f8d2d6324b002)My bet: it will still get deleted ;)**

**pekr**

**[16:14](#msg5edfb57a035dfa12610d4181)Most probably so :-)**

**jedavis47**

**[16:26](#msg5edfb84e24a3382d5d575aeb)OK... erased everything in the directory. Downloaded red-064.exe from the site - https://www.red-lang.org/p/download.html... do following from Getting Started - For Windows users, run it by double-clicking on the Red binary file. It will then automatically build the Red GUI-console. Next time you double-click on the file, the GUI-console will automatically open. Shows " Compiling RED console. 1.5 minutes later Console appears. Enter hello world script. Executes in interpreted mode OK. Sitting in my chair like zombie looking at screen. The console disappears - no keys touched not even a mouse shake. Click on rred-064.exe in the directory it was downloaded to. Anaing it starts to compile the console. Another 1.5 minutes.**

**hiiamboris**

**[16:49](#msg5edfbdb124a3382d5d576e82)@jedavis47 once your figure it out, let us know what the issue was**

**jedavis47**

**[16:53](#msg5edfbe93035dfa12610d6872)Will do... &amp; thanks, jd**

**[18:30](#msg5edfd54e5dcbb760b6dc4b1b)Further to the above problem. I spent considerable time and think I may have located the problem. Executing the file red-064.exe from "https://www.red-lang.org/p/download.html" produces a number of files in "c:/programdata/red"... One of these files is the file: "C:\\ProgramData\\Red\\gui-console-2018-11-22-8164.exe" which The AV program Windows Defender definitely does not like. It apparently is infected with "Program:Win32/Unwaders.A!ml" which after about 30 seconds Defender eliminates along with all the associated files. You have to look quickly as it is erased quickly.**

**hiiamboris**

**[18:41](#msg5edfd7da013105125a24f6e6):+1: So in the end, solution is whitelist it in the Defenerer and report false positive to MS.**

**[18:42](#msg5edfd81f24a3382d5d57e68a)What I find funny is that not `red-064.exe` (the unpacker) gets flagged, but the resulting exe ;)**

**[18:42](#msg5edfd8297c64f31f114e19c6)This is \*so MS\*...**

**[18:44](#msg5edfd87224a3382d5d57e783)@jedavis47 be sure to also read https://github.com/red/red/wiki/%5BNOTE%5D-Anti-virus-false-positives**

**dander**

**[19:22](#msg5edfe15d7a7f8d2d63255d90)Microsoft has a site where you can \[submit files for analysis](https://www.microsoft.com/en-us/wdsi/filesubmission), either if you believe a file is infected or a false positive. If enough people are doing this, they may fix it eventually. Certainly only report false positives if you are getting them though. It seems like it only happens periodically and not for everyone.**

**greggirwin**

**[20:40](#msg5edff3c1a85de30394030d40):point\_up:(https://gitter.im/red/red?at=5ede5aa74c9b0f060d50dba7) @meijeru you can use `\` in refinements and issues, which are both word types, so there is some flexibility there. Red follows Rebol here, thus far. With an exception that you couldn't have `/\` in Rebol, but you can in Red.**

**It's a tricky char, because it's very "path like", and also used widely as an escape char in other langs. Limiting its use can prevent confusion and avoid leaning toothpick syndrome.**

**ALANVF**

**[23:39](#msg5ee01db329d8bc28f9e82310)curious, what's the recently added `transcode` native for?**

**dander**

**[23:57](#msg5ee021fe1e099b0388b831ab)@ALANVF that's the public function for the fast lexer. If you want more information about it, check out the last couple blog posts, but basically it allows you to convert text into Red values, and has interaction points for that process that can be used by various tools**  
**`>> trace: function [event input type line token][probe reduce [event input type line token] true] == func [event input type line token][probe reduce [event input type line token] true] >> transcode/trace "[foo bar]" :trace [prescan "[foo bar]" block! 1 1x1] [open "[foo bar]" block! 1 1x1] [prescan " bar]" word! 1 2x5] [scan " bar]" word! 1 2x5] [load " bar]" word! 1 foo] [prescan "]" word! 1 6x9] [scan "]" word! 1 6x9] [load "]" word! 1 bar] [prescan "]" block! 1 9x9] [close "]" block! 1 9x9] == [[foo bar]]`**

****Wednesday 10th June, 2020****

**meijeru**

**[11:33](#msg5ee0c4f2035dfa1261109603)@greggirwin Thanks for the more precise specification of what goes into a symbol-like literal (value of `all-word!` types). It gets rather subtle...**

**[11:33](#msg5ee0c5057b6da9126a8796bd)See the latest update of the spec document.**

****Thursday 11st June, 2020****

**greggirwin**

**[18:13](#msg5ee2743024a3382d5d5f215b)Thanks @meijeru. I notice you have `bigint!` in there, which I don't think is guaranteed yet.**

**[18:14](#msg5ee274695dcbb760b6e3aaff)Nice example @dander. We'll get more docs out on it, but are happy to have people here play and make notes to help others along in the meantime.**

****Saturday 13th June, 2020****

**djrondon**

**[02:38](#msg5ee43c1e5782a31278f7a987)Folks, did you try to install red on Termux, android? is that possible? or run R2 or R3 there using Termux ?**

**rebolek**

**[06:09](#msg5ee46db72cf2f36eae58118b)@djrondon interesting idea, I haven't tried it yet.**

**rcqls**

**[07:54](#msg5ee4861f7c64f31f115a7580)@djrondon Just tried but my cell phone is arm 64bit and no foreign armhf or armel architecture is authorized…. So no luck!**

**[07:58](#msg5ee4870a24a3382d5d641501)seems however. I386 architecture (unstable-repo) is possible but I could not manage to have it working too!**

**pekr**

**[09:27](#msg5ee49c1224a3382d5d644413)I have looked into IO2 branch, as it was suggested as a newest attempt at a complete IO implementation. I have found runtime/threads.reds and just wonder:**

**- Are OS threads used as a final decision, being considered good-enough, scaling, etc.? Remember, rebollers lived till today with mostly a single thread anyway.**  
**- Or is that just a temporal solution, before some green threads alternative aproaches are considered, etc.?**

**I have read following article, so am just curious, nothing more - https://rcoh.me/posts/why-you-can-have-a-million-go-routines-but-only-1000-java-threads/**

****Sunday 14th June, 2020****

**greggirwin**

**[21:45](#msg5ee69a627a7f8d2d6335e730)Red will have an actor model @pekr, as there is no one-size solution. Pre-emptive vs cooperative tasking both have their place. And simply using OS processes is simple and goes a long way. The main issue with threads is not scaling, but coordination. We can easily say "It uses OS threads" and people will know what the limits are, or find them easily enough. But as soon as your app does something strange on an irregular basis, and you have to debug deadlocks and race conditions, you're in a world of pain.**

**What would be \*great* is to have a wiki page that looks not at the various ways other langs work (we've done a lot of that already), but the end user and production examples where millions, or tens or hundreds of millions are needed. A web server is a classic example, Apache vs nginx and others, which also ties to non-blocking I/O.**

****Monday 15th June, 2020****

**meijeru**

**[18:41](#msg5ee7c0cd013105125a388342)Observation: `transcode "[]"` =&gt; `[[]]` but `load "[]"` =&gt; `[]`. In otherwords: `transcode` \_always_ puts its result in a block, but `load` only does that if the result is not already a block \_and_ consists of more than one value. Is this a gotcha for people?**

**hiiamboris**

**[18:46](#msg5ee7c2187a7f8d2d63389204)`load` was always quite a gotcha ;) e.g. https://github.com/red/REP/issues/44**

**meijeru**

**[18:56](#msg5ee7c47b29d8bc28f9faa498)I have added something there, just now -- nothing to do with `load`BTW**

**hiiamboris**

**[18:58](#msg5ee7c4e5013105125a388d42)Indeed. Thanks.**

**toomasv**

**[19:19](#msg5ee7c9d2035dfa126121898c)@meijeru Also `load/all`.**

****Wednesday 17th June, 2020****

**rebolek**

**[13:36](#msg5eea1c6e3316c66e00d4910d)I've updated https://github.com/rebolek/red-tools/blob/master/http-tools.red to support sending `multipart/form-data`. Usage is simple:**  
**`send-request/data server 'POST [#multi key: "value" json-key: {{"json": "value"}} application/json file: %some.file]`**  
**It's a simple dialect of key/value pairs (`set-word!`and `string!`), optionally followed by Content-Type. You can also send files, in such case replace `string!` with `file!`. Handles both text and binary files.**

**See also https://github.com/rebolek/red-tools/blob/master/send-request.md**

**If you have any questions, feel free to ask, if you find any bugs, let me know, it's a fresh work and, so some problems are to be expected :-)**

**Respectech**

**[14:15](#msg5eea256ed7c1da0adc94bea7)Great job! That's an awesome tool to have in the kit!**

**ldci**

**[16:08](#msg5eea3ffe0c34bc5cccb1b1e0)@rebolek Really nice tool**

**rebolek**

**[16:37](#msg5eea46b22f05280988ca738f)@ldci @Respectech thanks guys!**

**greggirwin**

**[17:37](#msg5eea54ec539e566fc93f61d1):+1:**

**[17:41](#msg5eea55af3ca1e1625e8673e1)@rebolek be sure to add a couple examples at the bottom for this new feature.**

**planetsizecpu**

**[18:20](#msg5eea5ed77c62240ad2ba68af)Much encouragement @rebolek**

**rebolek**

**[20:41](#msg5eea7feb7c62240ad2bac478)@greggirwin thanks for the suggestion, I will.**

****Thursday 18th June, 2020****

**GalenIvanov**

**[06:30](#msg5eeb09fc3a0d3931fa9c1938)Hi! I have a suggestion for extending `extract` with two more refinements - `part` and `full`as follows:**

**[06:30](#msg5eeb0a0bb8152d34844bcce6)**  
**`extract: func[ {Extracts a value or a subseries from a series at regular intervals} series [series!] width [integer!] "Size of each entry (the skip)" /index "Extract from an offset position" pos [integer!] "The position" /into "Provide an output series instead of creating a new one" output [series!] "Output series" /part "Length of each subseries" length [integer!] /full "Extract only full length parts" /local stop ][ width: max 1 width if pos [series: at series pos] unless into [output: make series (length? series) / width] length: either part [length][1] stop: do pick [length 1] full while [(length? series) >= stop] [ append/only output copy/part series length series: skip series width ] output ]`**

**[06:31](#msg5eeb0a37b8152d34844bcd38)**  
**`>> extract "Red-lang" 2 == "Rdln" >> extract/part/into "Red-lang" 1 2 [] == ["Re" "ed" "d-" "-l" "la" "an" "ng" "g"] >> extract/part/into "Red-lang" 2 3 [] == ["Red" "d-l" "lan" "ng"] >> extract/part [1 2 3 4 5 6 7 8 9 10] 1 2 == [[1 2] [2 3] [3 4] [4 5] [5 6] [6 7] [7 8] [8 9] [9 10] [10]] >> extract/part [1 2 3 4 5 6 7 8 9 10] 1 3 == [[1 2 3] [2 3 4] [3 4 5] [4 5 6] [5 6 7] [6 7 8] [7 8 9] [8 9 10] [9 10] [10]] >> extract/part [1 2 3 4 5 6 7 8 9 10 11] 4 4 == [[1 2 3 4] [5 6 7 8] [9 10 11]] >> extract/part/full [1 2 3 4 5 6 7 8 9 10 11] 4 4 == [[1 2 3 4] [5 6 7 8]]`**

**[06:34](#msg5eeb0ae1e0e5673398bd42c7)The motivation is to have an easy way of splitting series into regular chunks (overlapping if needed).**

**pekr**

**[06:36](#msg5eeb0b6abb149531edb716c4)This is what `skip`refinement was for in Rebol IIRC, to extract kind of "records".**

**GalenIvanov**

**[06:37](#msg5eeb0ba9e6668d35db076308)@pekr Thanks, I'll take a look at it.**

**toomasv**

**[14:21](#msg5eeb7856ec4a341beed56b4c)@GalenIvanov This will probably be job for refined `split`. See some half-baked experiments \[here](https://gist.github.com/toomasv/52a0d91fa6cd1f27b9dfa9bfb2dfbc3d)**

**GalenIvanov**

**[14:28](#msg5eeb7a02405be935cdab271d)@toomasv Thank you for the link, I'll examine the code later.**

**greggirwin**

**[19:24](#msg5eebbf50405be935cdabe145)I agree with @toomasv. @GalenIvanov, what is the use case for the overlapping behavior?**

****Friday 19th June, 2020****

**GalenIvanov**

**[06:44](#msg5eec5ee67ba3965373b7582e)@greggirwin In cases when one needs to know the neighbours (to have a sliding window/frame) - for example to find differences of adjacent pairs of numbers (of course there a many ways to do it), to find a local median value, to smooth a a signal and so on.**  
**@toomasv 's experiments are really nice.**  
**The reason I suggested `extract` is that it currently works with blocks too and not only with strings as `split` does (if I'm not mistaken).**  
**I'll embrace any reasonable refinements of the current functions or introduction of new ones (if needed) that help splitting/reshaping not only string, but also blocks.**

**[06:57](#msg5eec61d0e0e5673398c08737)**  
**`len: 10 signal: make block! len smooth: make block! len loop len [append signal random 10] foreach frame extract/part signal 1 3 [append smooth round/to average frame 0.25] probe signal probe smooth`**

**[06:57](#msg5eec61d9c4bdd83475f1f884)**  
**`[3 1 7 1 3 4 3 1 8 2] [3.75 3.0 3.75 2.75 3.25 2.75 4.0 3.75 5.0 2.0]`**

**[07:00](#msg5eec6284b8152d34844f0e47)Please note that this example is not totally correct - the first and last groups can be padded with zeroes on the left/right for more precise results.**

**hiiamboris**

**[09:27](#msg5eec84e93a0d3931fa9fb548)&gt; find differences of adjacent pairs of numbers (of course there a many ways to do it), to find a local median value, to smooth a a signal and so on.**

**`extract` would be a bad fit for that, for these tasks are usually done on a big series, and you wouldn't want to duplicate it 2-3 times. \[Foreach](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/for-each.red#L52) IMO should be doing all that.**

**GalenIvanov**

**[10:53](#msg5eec993dec4a341beed81b15)@hiiamboris Yes, you are right and your `for-each` is great. I just thought that `/part` be useful for `extract`, as it is for `copy`, `move` and `take`.**

**hiiamboris**

**[10:56](#msg5eec99f447fdfd21edd1f24b)Sometimes I wished `extract` could extract chunks of 2 items instead of 1. Don't remember where ;)**

**GalenIvanov**

**[10:57](#msg5eec9a357ba3965373b7e651)So I'm not the only one :)**

**greggirwin**

**[20:11](#msg5eed1be0c223cc536a23c14e)@GalenIvanov @hiiamboris :+1:**

**`Split` will absolutely work on all series values, for maximum utility. That's the goal.**

**[20:13](#msg5eed1c556c06cd1bf441ed9d)You might be able to play with the version from R3. I don't remember right now if it's Red compatible though.**

**Oldes**

**[21:03](#msg5eed282fc223cc536a23e133)Red version is yet missing the `/skip` (previously `/into`) refinement.**

****Saturday 20th June, 2020****

**GalenIvanov**

**[07:28](#msg5eedba9efa0c9221fc4c9bb9)@greggirwin That's good news, looking forward to the updated `split`.**

**ldci**

**[12:27](#msg5eee00a5613d3b3394fa1f5e)for macOS users: a simple way to make 64-bit Red applications. Use https://sveinbjorn.org/platypus. For a simple script**

**[12:27](#msg5eee00bac4bdd83475f5b2a6)We get**  
**`file Fonts Fonts: Mach-O 64-bit executable x86_64`**

**[12:29](#msg5eee0121fa0c9221fc4d3a76)BTW, this also works for Rebol scripts**

**rcqls**

**[14:34](#msg5eee1e657ba3965373bb5fe6)@ldci Not for Catalina OS I guess...**

**ldci**

**[14:56](#msg5eee23a56c06cd1bf4442cc0)@rcqls : You're right!**

****Sunday 21st June, 2020****

**hiiamboris**

**[16:31](#msg5eef8b65bb149531edc14952)After getting (once again!) an error message that I have an extra open bracket left somewhere in a 1000+ lines file, I decided to add \[this CLI utility](https://gitlab.com/hiiamboris/red-cli/-/tree/master/mockups/bmatch) which would detect brackets mismatches based on indentation.**

**[16:34](#msg5eef8c18613d3b3394fd475f)As a bonus, I can now see \[indentation issues in the Red code base](https://github.com/red/red/blob/4d864b1d25a01abec60297ea6b22296ded8082ee/modules/view/draw.red#L312) ;)**

**TimeSlip**

**[17:47](#msg5eef9d44e6668d35db11ce47)@hiiamboris Sweet!**

**meijeru**

**[20:24](#msg5eefc20b613d3b3394fdc4c2)@hiiamboris Thanks for `bmatch` -- I have incorporated it in my source editor's menu, it is a great help!**

**greggirwin**

**[20:28](#msg5eefc2e5e6668d35db121db9)@hiiamboris nice!**

**ALANVF**

**[22:29](#msg5eefdf3e54d7862dc49e8b9b)had a thought today: how cool would it be to have stuff from J in Red?**

**Oldes**

**[22:39](#msg5eefe187e0e5673398c81bc8)To answer this question.. what do you do in J?**

**ALANVF**

**[23:10](#msg5eefe8d9e0e5673398c82974)J is kinda like APL but less annoying and doesn't unicode**

**[23:10](#msg5eefe8f8a813c72dcf00a33e)really good for list/matrix processing and math stuff**

**[23:16](#msg5eefea56c4bdd83475f9c0af)https://en.wikipedia.org/wiki/J\_%28programming\_language%29**

**[23:18](#msg5eefeacce0e5673398c82c84)honestly, roughly 80% of the language could even be implemented by using a DSL**

****Monday 22nd June, 2020****

**GaryMiller**

**[01:16](#msg5ef0067cc223cc536a29d917)I think it has a full relational database in it though too doesn't it for data analysis. doesn't it?**

**[08:53](#msg5ef07173e6668d35db138761)Not sure if it would strip that out for a Hello World program or not.**

**ALANVF**

**[12:00](#msg5ef09d52bb149531edc3aefe)Yeah it does**

**mosee101**

**[16:40](#msg5ef0df05ec4a341beee19bad)Hello, I searched many places but cannot find my answer, how can I create a program in Red that can play an mp4 file? also how do I make an exe with the mp4 embed in it.**

**hiiamboris**

**[16:54](#msg5ef0e23b7ba3965373c161c4)Hi @mosee101 . There's no embedded support for codecs and video playback controls.**

**greggirwin**

**[17:56](#msg5ef0f0b9e0e5673398cab386)@hiiamboris `bmatch` is fantastic, just played a bit, and could be part of a linting suite or auto-formatter. For testing against old Rebol code, we do have the UTF-8 issue, which is something we should address for general data processing.**

**hiiamboris**

**[17:58](#msg5ef0f14ba813c72dcf03189f)Also, Rebol doesn't have rawstrings, so I entitled this a Red-only tool ;)**

**[18:03](#msg5ef0f271c4bdd83475fc39eb)&gt; part of a linting suite or auto-formatter**

**Ideally, why not make such analysis available in the interpreter? Instead of reporting a worthless error it should try to analyze the code and provide meaningful insights where such error might come from.**

**greggirwin**

**[18:06](#msg5ef0f343c223cc536a2c39e1)So, in cases of an error it would `form` the input and analyze it as a string?**

**hiiamboris**

**[18:07](#msg5ef0f36b54d7862dc4a12372)It's a `load`-phase error, so `load` already has the input as text. File or URL. Or a user-generated string (but then there's little reason to analyze it IMO)**

**greggirwin**

**[18:08](#msg5ef0f3a7d65a3b0292a3900e)Ah, got it, I was thinking of general error help, per the recent `do file` topic.**

**hiiamboris**

**[18:09](#msg5ef0f3c47ba3965373c18af5)Like this: `load` fails on unbalanced brackets -&gt; enters analysis phase -&gt; shows possible culprits -&gt; user is happy ☻**

**GalenIvanov**

**[18:09](#msg5ef0f3d047fdfd21eddbcfd6)@ALANVF Yes, it would be cool. I have some (intermediate) experience in APL/J/K and I think that K would be more suitable for a DSL, being much more compact and working on list and not arrays.**

**greggirwin**

**[18:10](#msg5ef0f424b8152d3484595a5a):^) `Load` is a mezz, and analysis will be OOB so not have an impact if there's no error. Since you have `bmatch` already, it's worth a tinker.**

**hiiamboris**

**[18:11](#msg5ef0f45b54d7862dc4a12691)Great. I'll see what can be done ☺**

**greggirwin**

**[18:12](#msg5ef0f48fe0e5673398cac195)To start, you don't even have to hack directly in `load`, maybe.**

**[18:14](#msg5ef0f4e9d65a3b0292a393a5)That is, for PoC, trap `load` errors in a wrapper that calls the analyzer.**

**hiiamboris**

**[18:14](#msg5ef0f4fa3a0d3931faa9a2b7)Got it.**

**greggirwin**

**[18:15](#msg5ef0f55d47fdfd21eddbd347)Just thinking it might be easier than worrying about how to handle the various `load` refinements where it does the transcoding.**

**[19:21](#msg5ef104d76c06cd1bf44a8aff)Also good for finding matching brackets in an editor, to go with @toomasv's visualization tools.**

**hiiamboris**

**[22:01](#msg5ef12a3f3a0d3931faaa2f4d)@greggirwin Done. Clone \[this](https://gitlab.com/hiiamboris/red-mezz-warehouse) and play with `smartload.red` ;)**

**[22:02](#msg5ef12a84fa0c9221fc54755d)(it was easier to copy/paste `load` than to wrap it into `apply`)**

**greggirwin**

**[22:07](#msg5ef12bbba813c72dcf03b07d)Thanks! :+1: Will try to play soon.**

****Tuesday 23th June, 2020****

**theSherwood**

**[03:39](#msg5ef17977a813c72dcf045619)I believe I've discovered a bug and want to confirm.**  
**`Red [] view [ h5 200x20 "Source" h5 200x20 "Output" return source: area 200x150 "a: area" panel react [ attempt/safer [face/pane: layout/tight/only load source/text] ] ]`**

**Click on the output `area`. Click away. Click back into the output `area`. Crash:**  
**`*** Runtime Error 1: access violation *** at: 00036A78h`**

**[03:41](#msg5ef179f5bb149531edc5db84)In contrast, `source: area 200x150 "f: field"` does not crash. But it takes two clicks to give the `field` focus as opposed to one.**

**[03:42](#msg5ef17a1647fdfd21eddd00d6)I'm on macOs running Mojave**

**[03:42](#msg5ef17a2bb8152d34845a9090)Should I create a bug report for this?**

**hiiamboris**

**[07:28](#msg5ef1af0dec4a341beee37d65)Yes. No crash on W7 btw.**

**theSherwood**

**[07:42](#msg5ef1b283405be935cdb94048):thumbsup:**

**rebolek**

**[12:16](#msg5ef1f2b8bb149531edc6f297)Is there a way to suppress evaluation of `spec` block with `make`?**

**hiiamboris**

**[12:25](#msg5ef1f4b0c223cc536a2e9b2e)`construct/only`**

**rebolek**

**[12:36](#msg5ef1f735ec4a341beee435a3)Hm but that doesn't bind:**  
**`>> c: construct reduce [to set-word! 'a 1 to set-word! 'f func [][print a]] >> c/f *** a has no value`**

**hiiamboris**

**[12:41](#msg5ef1f874d65a3b0292a60537)**

**[12:42](#msg5ef1f8a6ec4a341beee43b90)**  
**`>> c: construct reduce [to set-word! 'a 1 to set-word! 'f func [][print a]] == make object! [ a: 1 f: func [][print a] ] >> c/f 1 >> about Red 0.6.4 for Windows built 20-Jun-2020/20:24:25+03:00 commit #4d864b1`**

**rebolek**

**[12:43](#msg5ef1f901bb149531edc70758)My build is from 15. June, I try to make a new one and will see.**

**Oldes**

**[12:45](#msg5ef1f97dbb149531edc7083f)@hiiamboris I've version from today and have the same error as Bolek**

**hiiamboris**

**[12:46](#msg5ef1f993e0e5673398cd2643)Platform differences in `construct`?**

**Oldes**

**[12:46](#msg5ef1f9b5bb149531edc708c6)Btw... it reminded my, that Rebol3 introduced `reduce/no-set`, so one can write:**  
**`>> c: construct reduce/no-set [a: 1 f: func [][print a]] == make object! [ a: 1 f: make function! [[][print a]] ]`**

**[12:47](#msg5ef1f9ce405be935cdb9f333)(btw... R3 also does not bind)**

**hiiamboris**

**[12:49](#msg5ef1fa3d613d3b33940308fb)Confirmed: doesn't bind. I must have had `a` set to `1` or idk :D**

**rebolek**

**[12:51](#msg5ef1fad1b8152d34845bc951)@hiiamboris ok :)**

**[12:51](#msg5ef1fae5613d3b3394030a6a)`reduce/no-set` would help a lot**

**[12:52](#msg5ef1faf7405be935cdb9f6d9)I am using some arcane `compose` based workarounds for now.**

**hiiamboris**

**[12:52](#msg5ef1fb1efa0c9221fc565024)Consider \[reshape](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/reshape.md) if it's not performance-critical**

**rebolek**

**[12:55](#msg5ef1fbc2c223cc536a2eb095)The `compose` part is not that arcane, but that I must create get-path just to get the value is something I consider arcane.**  
**`(to set-word! word) (to get-path! reduce ['some-context word])`**  
**is something I don't like.**

**hiiamboris**

**[13:07](#msg5ef1fe76a813c72dcf058c34)An alternative would be `select some-context (word)` I think. Or in some cases `set new-obj some-context` might do all the work.**

**rebolek**

**[13:13](#msg5ef2000eb8152d34845bdca1)`select` may work, I need to test it. `set new-obj some-context` can't be used in my case, because `some-context` is actually `just-some-words-from-some-context`.**

**dander**

**[20:48](#msg5ef26a92d65a3b0292a73af5)I'm curious how frequently people rely on `reduce` changing things outside the block being reduced. I'd never intentionally used it for that, and hadn't actually considered that it would, but it makes sense now that I know about it. Reflexively, I would say that the non-side-effect version would be preferable to me by default**

**hiiamboris**

**[20:50](#msg5ef26b286c06cd1bf44e0298)I'm using it's side effects at times. \[Example](https://gitlab.com/hiiamboris/red-elastic-ui/-/blob/master/elasticity.red#L102)**

**dander**

**[21:00](#msg5ef26d80613d3b3394044bcf)Nice example. Thanks!**

****Wednesday 24th June, 2020****

**greggirwin**

**[00:36](#msg5ef2a01a613d3b339404c30a)We have so many options for controlling evaluation, yet don't think about it after a while.**

**@dander, I don't use `reduce` explicitly for side effects, except in rare cases. Using different functions to control evaluation is part of expressing the intent in a piece of code, IMO. How would you have a non-side-effect version of `reduce` though? It would mean that everything evaluated would also have to be side effect free.**

**cloutiy**

**[01:29](#msg5ef2ac76fa0c9221fc581133)Has anyone done any work with NoSQL databases with Red?**

**dander**

**[03:50](#msg5ef2cd94d65a3b0292a80f50)@greggirwin, that is an interesting point. I guess the only way would be to have some sort of sandboxing capability (though useful in itself, seems way too heavy for this). I was probably just thinking about `reduce` in too limited a way. It keeps surprising me how such simple things have unexpected depths**

**greggirwin**

**[04:13](#msg5ef2d303bb149531edc925b1)@dander that's Red for ya'. :^)**

**@cloutiy there are no bindings in the red/code repo that I know of for modern NoSQL DBs. We'll see a flurry of activity on that front when ports come I imagine. I keep trying to find time to tinker on an old-fashioned record manager, but alas...**

**rebolek**

**[06:02](#msg5ef2ec92ec4a341beee69c29)@cloutiy I did experimental binding for Redis based on my Rebol3 bindings, but that requires ports.**

**Oldes**

**[17:51](#msg5ef392a5c4bdd8347502c002)I have a use case, where I have a large map and I need to get first value from it... is there better way than this one?**  
**`>> m: #(a: 1 b: 2 c: 3) == #( a: 1 b: 2 c: 3 ) >> first values-of m == 1`**

**[17:53](#msg5ef39334c4bdd8347502c195)(I somehow wish to be able use `first m` and avoid getting all values when I need just the one)**

**greggirwin**

**[17:53](#msg5ef393373a0d3931fab01798)Maps are unordered, so if you don't know the key that's all you can do. Since that's a heavy solution, you may want to cache it if you can.**

**Oldes**

**[17:54](#msg5ef3935fb8152d34845fd5e6)I see quite nice order in my example above.**

**greggirwin**

**[17:54](#msg5ef3936ee0e5673398d14130)"Cache me if you can" is a new memoization thriller I plan to write.**

**hiiamboris**

**[17:59](#msg5ef39489ec4a341beee85ad6):D**

**[18:00](#msg5ef394b03a0d3931fab01c01)@Oldes `foreach [k v] m [break]` ?**

**greggirwin**

**[18:00](#msg5ef394c747fdfd21ede23829)Oooh, nice one @hiiamboris. :+1:**

**Oldes**

**[18:01](#msg5ef394ecfa0c9221fc5a6e1c)`first m` would be shorter, if implemented.**

**greggirwin**

**[18:01](#msg5ef39507e0e5673398d1464d)@Oldes it would, but maps are noted \*not* to be series.**

**hiiamboris**

**[18:01](#msg5ef39509bb149531edcb352f)I think you shouldn't rely on current implementation saving it's order. That may change.**

**greggirwin**

**[18:02](#msg5ef3953ea813c72dcf099623)Maps have no guarantee of ordering.**

**pekr**

**[18:40](#msg5ef39e24405be935cdbe217f)Seeing the map syntax, I kind of agree with Chris, that map as a storage, would be better using brackets, and parens might be used for the molded values ...**

**greggirwin**

**[18:58](#msg5ef3a256b8152d34845ffe06)No easy choices. `Map!` syntax was deeply discussed, and is now highly unlikely to change.**

**[19:19](#msg5ef3a726e0e5673398d17cd8)To clarify, this would be painful to change, and break a lot of stuff. It will be more painful to change later of course. IIRC, the R2 construction syntax weighed in heavily.**

**Oldes**

**[19:26](#msg5ef3a8cad65a3b0292aa5281)I think it is still not too late to swap it. Red is still in alpha version.**

**pekr**

**[19:42](#msg5ef3ac92c4bdd83475030ba9)That was not a proposal on my side, just an observation, feeling and personal preference, without any deep thoughts about possible consequences, so please feel relaxed about it.**

****Thursday 25th June, 2020****

**rebolek**

**[06:15](#msg5ef441126c06cd1bf4526c69)@Oldes**  
**&gt; I see quite nice order in my example above.**

**This is an implementation artifact and may change in future releases. Key order is not guaranteed.**

****Friday 26th June, 2020****

**meijeru**

**[17:03](#msg5ef62a48e0e5673398d7aafa)When trying to get the commit information from Github I get the following message:**  
**`API rate limit exceeded for 81.164.73.145. (But here's the good news: Authenticated requests get a higher rate limit. Check out the documentation for more details.)`**

**[17:03](#msg5ef62a54fa0c9221fc60c847)What should I do?**

**[17:08](#msg5ef62b9a405be935cdc46729)I use the commit information to check whether I should download a new version of the toolchain.**

**hiiamboris**

**[22:01](#msg5ef67030405be935cdc51fdb)What it's trying to tell you is that you need to get an API token and specify it in the request, so it can track you better.**

****Saturday 27th June, 2020****

**meijeru**

**[08:49](#msg5ef70816fa0c9221fc62bd18)How do I get an API token? I did not need it until very recently!**

**hiiamboris**

**[09:39](#msg5ef713e9405be935cdc66ad6)https://www.google.com/search?q=github+api+token**

**meijeru**

**[10:07](#msg5ef71a69c4bdd834750b3ab9)I have now obtained the API token but, curiously, my non-token access to Github has been restored?!? So for the moment I do not need it. That being said, I still don't know where to insert it in my Red code which for the moment is `load https://api.github.com/repos/red/red/commits` and mind you, this works...**

**hiiamboris**

**[10:12](#msg5ef71b89bb149531edd3be3e)It's usually like `https://address?token=my-token` or smth. Only Github can tell you exactly.**

**meijeru**

**[15:21](#msg5ef763f5fa0c9221fc639c8b)Cannot try it now, since the token is disregarded.**

**rebolek**

**[20:18](#msg5ef7a9966c06cd1bf45ad24a)@meijeru my Github bindings support authorized access, so you may try it.**

****Monday 29th June, 2020****

**rebolek**

**[18:06](#msg5efa2daed65a3b0292b9764e)Windows people: do you know about a webserver like `thttpd` for Windows? Single small executable with CGI support?**

**toomasv**

**[19:47](#msg5efa4564e0e5673398e12e2d)\[This](https://github.com/eantcal/thttpd) one or rather \[that](https://acme.com/software/thttpd/)? Dunno either.**

**greggirwin**

**[20:37](#msg5efa50f5b8152d34846fb144)@rebolek Xitami...shoot, long gone. Cheyenne...maybe wait a bit. I just searched and found http://smallsrv.com/ (which seems to have the same antivirus issues we do).**

****Tuesday 30th June, 2020****

**rebolek**

**[03:12](#msg5efaad9e613d3b339417e240)@toomasv the second one. I don'ŧ know the first, but it seems \*too* lingthweight, no CGI etc.**

**[03:14](#msg5efaae1bc4bdd834751385d5)@greggirwin hm, I don't know about AV warnings, but Firefox isn't letting me to even show the page.**

**hiiamboris**

**[07:32](#msg5efaea7247fdfd21edf3890f)It was up yesterday but not anymore.**

**meijeru**

**[08:36](#msg5efaf981c223cc536a4435ed)Chrome does not show smallsrv either.**

**[09:00](#msg5efaff146c06cd1bf462794d)Anyone missing the `use` function from Rebol 2&amp;3? I made it myself, naively, as follows:**  
**`use: func [ {Defines words local to a block.} locals [block!] body [block!] /local f ][ f: has locals body f ] ; end use`**  
**But I noticed that R2 has it as `native!` and R3 has it as function using `make closure!` and it does `copy/deep body`. Is my naive implementation vulnerable?**

**Oldes**

**[13:08](#msg5efb3935b8152d348471d7e9)@rebolek Nginx is too heavy for you?**

**meijeru**

**[13:09](#msg5efb39a4a813c72dcf1bc3f7)To continue the questions on `use`, it is the case that `has` does itself a `copy/deep` on the `body` argument?**

**hiiamboris**

**[13:19](#msg5efb3bca6c06cd1bf4632895)I like the word `using` more. `using [a b c] [..do this code..]` reads less awkward. But though tempting in it's simplicity I don't remember it appearing often in my code. Probably because the use cases are in actors or reactions, and creating a new function or context, and calling bind every time is an overhead best avoided.**

**[13:23](#msg5efb3cccfa0c9221fc6ca0ec)And don't forget, context rebinds `self`, so becomes not usable inside other contexts, and `func` rebinds `local` and traps `return` and `exit`, which becomes an annoyance inside other functions.**

**meijeru**

**[13:25](#msg5efb3d476c06cd1bf4632c2e)I employ it to prevent words from becoming global, without wrapping code in an object.**

**cloutiy**

**[13:25](#msg5efb3d4f7ba3965373da4dfe)I have a question about "reflection", for lack of better word. When inside a function, is there a way to check what is the word bound to the function you are currently inside?**

**meijeru**

**[13:25](#msg5efb3d62c223cc536a44fe16)If there is (will be) a better way, I will use that gladly.**

**hiiamboris**

**[13:26](#msg5efb3d73e0e5673398e38b52)@cloutiy functions are not required to be bound to a word, and they may be bound to multiple words. So, no.**

**[13:27](#msg5efb3da43a0d3931fac26674)@meijeru a better way would be to persuade the team to make it a native ;)**

**cloutiy**

**[13:27](#msg5efb3dd9a813c72dcf1bd051)@hiiamboris Ok thanks for the quick response.**

**hiiamboris**

**[13:28](#msg5efb3df56c06cd1bf4632e71)@meijeru where do you use it? For VID I have https://github.com/red/REP/issues/47**

**meijeru**

**[15:56](#msg5efb60b1d65a3b0292bc808f)I have an `%init.red` program that runs when I start the console. I don't want any of its words to leak into the global space.**

**rebolek**

**[16:32](#msg5efb69146c06cd1bf463ba60)@Oldes for this purpose actually yes. I am not looking for a webserver per se, but for a temporary solution how to solve OAuth2 webflow in Red until we get ports. On Linux, I run thttpd that waits for a callback from OAuth2 provider, runs Red CGI which signals to main Red process that we have the token back and web server can be terminated.**  
**It would be nice to have such a solution on Windows too.**

**ne1uno**

**[17:40](#msg5efb791fbb149531edde5e94)@rebolek http://rebol.org/view-script.r?script=webserv.r**

**ALANVF**

**[20:59](#msg5efba7a0405be935cdd160bb)would love to have `use` as a builtin function/native**

**[20:59](#msg5efba7c6613d3b33941a9d3b)actually, what's been the hold-up for adding natives like `apply`, `use`, and `map-each`?**

**hiiamboris**

**[21:16](#msg5efbaba4405be935cdd16b63)Mainly because their design is not finished.**

****Wednesday 1st July, 2020****

**BenStigsen**

**[00:20](#msg5efbd6e1b8152d348473a3c4)Is it possible to make the Red window see-through?**

**rebolek**

**[05:17](#msg5efc1c51b8152d34847434e4)@ne1uno that'đ a possibility too. I'll probably leave it up to user for now, t's just a temporary solution anyway.**

**hiiamboris**

**[06:45](#msg5efc30f2fa0c9221fc6f28ae)@BenStigsen https://gitlab.com/hiiamboris/red-alpha**

****Thursday 2nd July, 2020****

**Oldes**

**[14:18](#msg5efdecbfd65a3b0292c35063)I know that this is compatible with Rebol, but what is explanation of this inconsistency?**  
**`>> type? either false [][] == unset! >> type? if false [] == none!`**

**hiiamboris**

**[14:19](#msg5efdecf454d7862dc4c16842)`if` returns `none` if condition fails.**

**Oldes**

**[14:19](#msg5efded06b8152d3484795044)I know.. that is visible above. But cannot remember the reason.**

**hiiamboris**

**[14:20](#msg5efded2254d7862dc4c1694f)What is the inconsistency then? `either` never fails.**

**Oldes**

**[14:20](#msg5efded38405be935cdd782a2)Hm.**

**[14:21](#msg5efded62fa0c9221fc73e9f5)Is it useful enough that `if` is not returning `unset!` when it fails?**

**hiiamboris**

**[14:23](#msg5efdeddf3a0d3931fac9c660)I saw some R2 project that relied heavily on it. Although - it's too implicit, and logic is hardly readable.**

**[14:23](#msg5efdedfbbb149531ede4ff1c)Is there a reason why unset would be better though?**

**Oldes**

**[14:24](#msg5efdee11e0e5673398eaed95)If it would be returning `unset!`, than there wouldn't be this annoyance:**  
**`>> append "a" either false [][] == "a" >> append "a" if false [] == "anone"`**

**hiiamboris**

**[14:27](#msg5efdeedf405be935cdd7860c)Also this would have been usable: `compose [.. (if condition thing).. ]`**

**toomasv**

**[14:42](#msg5efdf26f7ba3965373e1b20c)But this gives more variability. You can always use `either condition thing []`.**

**hiiamboris**

**[15:10](#msg5efdf8d1bb149531ede52a5d)Not sure I get the point about variability**

**toomasv**

**[15:41](#msg5efe001f613d3b339420ee4f)I mean sometimes you may need `none` returned, sometimes `unset`, and mostly it doesn’t matter.**

**greggirwin**

**[18:22](#msg5efe25d87ba3965373e2537a)&gt; Is it useful enough that `if` is not returning `unset!` when it fails?**

**Yes, absolutely, no question.**

**`Unset!` is an artifact of how Red works, and is not something we want to promote the use of. It would also be backwards for the result of `if`, because `unset!` is truthy.**

**Oldes**

**[18:28](#msg5efe276447fdfd21edfc8b2d)Sorry @greggirwin, but I don't accept this explanation. And truthy `unset!` is another bonus, why `if false []` could be used.**

**greggirwin**

**[18:32](#msg5efe2857bb149531ede5ba86)You don't have to accept my view, but you're going to have to provide a \*really* strong case for yours if you want it changed.**

**Oldes**

**[18:33](#msg5efe286c7ba3965373e25a85)I could use:**  
**`if all [ if has-some-module [ do-some-module-test ] common-test ][ do-something ]`**  
**instead of:**  
**`if all [ either has-some-module [ do-some-module-test ] [ true ] common-test ][ do-something ]`**

**[18:33](#msg5efe2893a813c72dcf240f13)There are already 3 use cases.**

**[18:34](#msg5efe28cdd65a3b0292c40b54)I would like to see use case for current `if` returning `none`**

**hiiamboris**

**[18:35](#msg5efe28f76c06cd1bf46b4401)`if has-some-module [ do-some-module-test ]`**  
**This is the implicit unreadable logic I talked about ☻ Would you want to read this code in a few years?**

**greggirwin**

**[18:46](#msg5efe2b9ffa0c9221fc74a72e)@oldes, what you're asking for is something \*different\*. Show me how it's \*better\*, and worth potentially breaking lots of code when, for Rebol's entire history, I don't recall seeing anyone request this. If it was a pain point, or a source of bugs, we'd have known about it long ago.**

**hiiamboris**

**[18:46](#msg5efe2ba254d7862dc4c2338d)&gt; I would like to see use case for current `if` returning `none`**

**https://github.com/henrikmk/VID-Extension-Kit/blob/master/source/vid.r#L527**  
**This is the baddest one I have seen so far:**  
**https://github.com/rgchris/Red-Lang.org/blob/92210ddd95673ff5f46087e9c61c8ab3a0bc1da2/qm/qm.r#L392**

**dander**

**[18:48](#msg5efe2bf0e0e5673398ebaf77)I have to agree the `if all` was confusing to me. When I see `all`, it makes me think all these statements need to \_succeed\_. `if do`... would work instead, right? Would that be a bit clearer?**

**hiiamboris**

**[18:53](#msg5efe2d19e0e5673398ebb299)@dander**  
**&gt; all these statements need to succeed**

**But they do.**

**dander**

**[18:56](#msg5efe2dd3ec4a341bee02ae20)Wasn't the intent of the example to evaluate `common-test` regardless of whether the `if` statement passes or fails?**

**hiiamboris**

**[18:59](#msg5efe2e76fa0c9221fc74b050)No, the point was that if `if` condition succeeds, then `all` would also consider tests from `if`'s body and if they fail, common tests are not run.**

**[19:09](#msg5efe30f17ba3965373e271f3)Another case where `if` returning unset would have been useful is composition of `print` lines:**  
**`print ["stuff" if cond ["more stuff"] "other stuff"]`**

**dander**

**[20:04](#msg5efe3dcffa0c9221fc74dad3)@hiiamboris thanks, that made it clear. Your print example is similar to `append "a" if false []` isn't it? Since `form none` -&gt; `"none"`. I'm curious about the reasoning for that decision, instead of `""`... I could see the desire for either case**

**greggirwin**

**[20:20](#msg5efe41786c06cd1bf46b863d)That's the problem with design decisions. The grass is always greener...**

**[20:26](#msg5efe4301c223cc536a4d8fe2)Sometimes a decision comes down to "What can't we undo?" For example, you can do `print trim reduce ["stuff" if cond ["more stuff"] "other stuff"]` to eliminate the `none` values. That said `none` forming to `""` \*has* come up a number of time in the past, and that's a tough call. If we did that, you still have `mold` which could return `"none"`.**

**[20:28](#msg5efe436ba813c72dcf245c51)Red follows Rebol for the current behavior, so that would be a significant incompatibility. Maybe not a showstopper though. For debugging, having `none` values disappear when using `print` is something we'd all see on a regular basis.**

**hiiamboris**

**[20:29](#msg5efe43ae7ba3965373e2aa78)`trim` is perennially buggy though, not an option. Besides, that's 2 more words. Line is not that big. 70 chars - indents ;)**

**greggirwin**

**[20:33](#msg5efe449654d7862dc4c280ac)If `trim` is buggy, that's a separate issue.**

**If your standard mode for print is to redact none values, just use a wrapper.**

**If `none`s vanish, how do you show them when you want to? You have to use `mold` for each of them, right?**

**hiiamboris**

**[20:37](#msg5efe45a3405be935cdd884ae)I do not advocate for `none` formed to `""` ☻**  
**I also think changing `if`s to `unset` need more justification than that. They are useful both ways. Plus I made a \[`when` operator](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/for-each.red#L149) I'm happy with. Just bringing up the arguments so we can all weigh in.**

**dander**

**[20:56](#msg5efe49f3a813c72dcf246f31)@greggirwin There could be a different method besides `print` for debugging, like a logger. Your other comments are nice food for thought. It seems like it would take a lot of work to figure out the implications of changing it.**

****Friday 3th July, 2020****

**Oldes**

**[06:57](#msg5efed6f46c06cd1bf46cec76)@hiiamboris thank you for your examples. Both can be easily replaced... for example the \[henrik's code](https://github.com/henrikmk/VID-Extension-Kit/blob/master/source/vid.r#L527) from:**  
**`any [ if test1? [...] if test2? [...] ]`**  
**to:**  
**`case [ test1? [...] test2? [...] ]`**

**[07:01](#msg5efed7d8a813c72dcf25c3d1)Personally I cannot remember if I ever needed `if` to return `none`, but I'm pretty sure that I used many times this:**  
**`rejoin ["a" if true ["b"] either false ["c"][]]`**  
**where I could do just more clearly:**  
**`rejoin ["a" if true ["b"] if false ["c"]]`**

**hiiamboris**

**[07:03](#msg5efed85254d7862dc4c3f475)@Oldes `any` fails not only when `if` fails but when `if` succeeds but the code inside it's body fails ;)**

**Oldes**

**[07:06](#msg5efed8e9b8152d34847bc75e)I know... but don't want to study Henrik's code if it depends on it... as it is already pretty crypted.**

**[07:07](#msg5efed918c223cc536a4ef687)And I think, that if it does, there could be comments about it.... but that is another issue.. that people don't comment enough.**

**hiiamboris**

**[07:07](#msg5efed947c223cc536a4ef6f7)Yeah ;) And using such strange coding patterns at times...**

**henrikmk**

**[09:07](#msg5efef548c223cc536a4f3f1a)I think when I wrote that code (edit: whoops, I didn't write that!), I wasn't using CASE as much as I am today. However, I use the IF =&gt; none pattern quite a lot for single questions, so I don't have to provide a specific NONE!, it's shorter than using ALL, and the IF block can be referenced elsewhere, if needed. I would be sad to lose it in Red.**  
**`face/font/style: if highlight ['bold]`**

**[09:08](#msg5efef597e0e5673398edac03)btw, the code bit examined in my code is actually Carl's. :-)**

**[10:09](#msg5eff03bec223cc536a4f6938)&gt; I do not advocate for none formed to ""**

**Agree**

**hiiamboris**

**[10:11](#msg5eff043de0e5673398edd845)Good use case :+1:**

**Oldes**

**[10:41](#msg5eff0b5f47fdfd21edfebbb5)`none formed to ""` is a nonsense imho.**

**[10:46](#msg5eff0c78bb149531ede803fd)But I see, that there would be big problem with `any` as `any [if false [1] 2]` would not return `2`, but `unset!`.**

**henrikmk**

**[11:01](#msg5eff1010e0e5673398edf66c)If question is reversed, when is it useful for IF to return unset! ?**

**[11:05](#msg5eff10e5c223cc536a4f8ec7)Sorry, just saw the first mention of this IF thing above. IMHO, that is not an inconsistency. EITHER simply provides another code path to take, where unset! is an option, so unset! is a side effect.**

**`if true []` also returns unset!**

**Oldes**

**[11:23](#msg5eff1544c223cc536a4f9d12)Yes... the main reason is this one: `rejoin ["a" if true ["b"] if false ["c"]]` to return just `"ab"` and not `"abnone"`**

**[11:25](#msg5eff15aeb8152d34847c6d50)Ren-C introduced `spaced` and `unspaced` and `null` to solve it:**  
**`>> unspaced ["a" if true ["b"] if false ["c"]] == "ab" >> type of if false ["c"] ; null >>`**

**[11:25](#msg5eff15beec4a341bee04f7db)But to be honest, I don't like these names.**

**[11:32](#msg5eff173bec4a341bee04fb44)I'm not sure, if there is any `unset!` in Ren-C, because it looks that in cases where we were used to have `unset!` is there the `null`:**  
**`>> type of first reduce [()] ; null`**

**henrikmk**

**[11:38](#msg5eff18c6a813c72dcf2679e6)&gt; Yes... the main reason is this one**

**I've had this issue too. It might be better to simply offer a different string composition process, where NONE just doesn't emit characters. Something like:**

**`emit ["Foo" 6 age: 10 if age > 12 ["You're old!"] #[none!] "Boo" [form #[none!]]] ; == "Foo610Boonone"`**

**[11:46](#msg5eff1ab2a813c72dcf267f77)**  
**`emit/space ["Foo" 6 age: 10 if age > 12 ["You're old!"] #[none!] "Boo" [form #[none!]]] ; == "Foo 6 10 Boo none"`**

**greggirwin**

**[14:35](#msg5eff42417ba3965373e541e7)@Oldes the most common place I've used `if`'s `none` result is for a function's return value. e.g.**  
**`locals: function [fn [function!]][ if loc: find/tail spec-of :fn /local [copy loc] ]`**

**`>> locals :average == none >> locals :replace == [p rule s e many? len pos do-parse do-find]`**

**Oldes**

**[14:36](#msg5eff427147fdfd21edff56a0)That is good example.**

**[14:44](#msg5eff4465bb149531ede89fc7)So it is clear, that it would be too big change... it looks that there is many such a cases.. like:**  
**`suffix?: func [{Returns the suffix (extension) of a filename or url, or NONE if there is no suffix} path [file! url! string! email!] ][ if all [ path: find/last path #"." not find path #"/" ] [to file! path] ]`**

**[14:54](#msg5eff46bcc223cc536a503377)But still, these could be rewritten like:**  
**`suffix?: func [{Returns the suffix (extension) of a filename or url, or NONE if there is no suffix} path [file! url! string! email!] ][ all [ path: find/last path #"." not find path #"/" to file! path ] ]`**  
**and**  
**`locals: function [fn [function!]][ all [ loc: find/tail spec-of :fn /local copy loc ] ]`**

**greggirwin**

**[14:56](#msg5eff4700fa0c9221fc7797cc)Anything can be rewritten in another way. But we need to ask why.**

**[14:57](#msg5eff474747fdfd21edff63e5)When I did a func count on Rebol code back in 2012, `if` was by far the most used function. Changing it may affect a lot of code, which comes back to needing a really good reason to do so.**

**Oldes**

**[14:57](#msg5eff4772d65a3b0292c6f01a)@greggirwin :point\_up: \[to reduce the code?](https://gitter.im/red/red?at=5efed6f46c06cd1bf46cec76)**

**greggirwin**

**[15:01](#msg5eff483647fdfd21edff65b6)@Oldes you haven't made a strong case for this. Or any case at all really. Your examples show a different way, but it is not \*better\*. You like it more, but I don't. Since I'm not convinced it's a good change, you either need to make me a believer, or get a lot of other people on your side to help you make the case for it.**

**Oldes**

**[15:03](#msg5eff48b37ba3965373e555b4)@greggirwin for me, being able to avoid `either` in code like: `rejoin ["a" either false ["c"][]]` is a strong case.**

**[15:03](#msg5eff48d5ec4a341bee058af2)And I don't take @hiiamboris ' `when` op!.**

**[15:04](#msg5eff4919fa0c9221fc779d27)And I don't say I like the change or not... I'm asking for opinions.**

**hiiamboris**

**[15:06](#msg5eff496bbb149531ede8af2f)`when` is one level of brackets less sometimes:**  
**`rejoin ["a" "c" when false]` vs `rejoin ["a" if false ["c"]]`**

**greggirwin**

**[15:06](#msg5eff49706c06cd1bf46e30da)You're just saying the same thing. You'll have to do better than that.**

**Here's my argument back to you. If you prefer this pattern, what's stopping you from writing a mezz to do it?**

**Oldes**

**[15:10](#msg5eff4a6654d7862dc4c539ba)@hiiamboris but that is just a very simple truncated example... instead of `"c"` may be `some-very-heavy-computation` which would be done event when the condition would be `false`**

**hiiamboris**

**[15:12](#msg5eff4ad1405be935cddb2172)True. Although it's better to move long expressions out of composed/rejoined block, to keep it readable so you can tell by it's look what the result will be.**

**Oldes**

**[15:19](#msg5eff4c683a0d3931facd88a8)And what if you just want to join two values? I'm really not fun of `op!`s.**

**[15:20](#msg5eff4cb654d7862dc4c5401c)Anyway... code like above `suffix?` should be changed anyway.. as my version is saving one native call.**

**hiiamboris**

**[15:20](#msg5eff4cbc6c06cd1bf46e3a4e)`op!`s are 2x faster than functions. That should make you love them ;)**

**greggirwin**

**[15:27](#msg5eff4e6e613d3b3394246038)@Oldes at a glance, I prefer the existing `suffix?` code, because the `if` makes it more explicit to me.**

**I'm as guilty of writing for performance or cleverness as much as anyone, but intent and understanding, which aid correctness, really need to be our main goals. If it takes me an extra 5 seconds to understand something, that's an anti-optimization. ;^)**

**[15:34](#msg5eff501be0e5673398eeaf9c)**  
**`>> f: %abcdefg.xyz == %abcdefg.xyz >> profile/show/count [[suffix? f][new-suffix? f]] 10'000 Count: 10000 Time | Time (Per) | Memory | Code 0:00:00.011 | 0:00:00 | 440440 | [suffix? f] 0:00:00.017 | 0:00:00 | 440284 | [new-suffix? f] >> profile/show/count [[suffix? f][new-suffix? f]] 100'000 Count: 100000 Time | Time (Per) | Memory | Code 0:00:00.099 | 0:00:00 | 1724308 | [suffix? f] 0:00:00.17 | 0:00:00 | -593804 | [new-suffix? f] >> f: %abcdefg == %abcdefg >> profile/show/count [[suffix? f][new-suffix? f]] 10'000 Count: 10000 Time | Time (Per) | Memory | Code 0:00:00.004 | 0:00:00 | 440 | [suffix? f] 0:00:00.007 | 0:00:00 | 284 | [new-suffix? f] >> profile/show/count [[suffix? f][new-suffix? f]] 100'000 Count: 100000 Time | Time (Per) | Memory | Code 0:00:00.043 | 0:00:00 | 440 | [suffix? f] 0:00:00.072 | 0:00:00 | 284 | [new-suffix? f]`**

**hiiamboris**

**[15:35](#msg5eff50437ba3965373e56b8c)Are they both compiled or both interpreted?**

**greggirwin**

**[15:36](#msg5eff50767ba3965373e56c4e)Ah, good point!**

**Oldes**

**[15:37](#msg5eff509e47fdfd21edff7c34)the `-593804` value looks quite suspicious. Looks like your measures are affected by GC.**

**greggirwin**

**[15:37](#msg5eff50a5b8152d34847d1751)Both interpreted now:**  
**`>> profile/show/count [[suffix? f][new-suffix? f]] 10'000 Count: 10000 Time | Time (Per) | Memory | Code 0:00:00.017 | 0:00:00 | 440284 | [new-suffix? f] 0:00:00.019 | 0:00:00 | 440796 | [suffix? f] >> profile/show/count [[suffix? f][new-suffix? f]] 100'000 Count: 100000 Time | Time (Per) | Memory | Code 0:00:00.174 | 0:00:00 | -585312 | [new-suffix? f] 0:00:00.185 | 0:00:00 | -564612 | [suffix? f]`**

**Oldes**

**[15:37](#msg5eff50bfc223cc536a5052fc)Anyway... I tried returning `unset` instead of `none` from `if` in my Rebol and I needed to modify just `file-type?` function.**

**greggirwin**

**[15:37](#msg5eff50bf6c06cd1bf46e483d)@Oldes crude profiling, yes.**

**giesse**

**[19:01](#msg5eff809654d7862dc4c5d9a2)the actual solution here is to offer a better way to build strings than `rejoin`. (if you ask me, `unset!` should not even exist)**

**ALANVF**

**[19:02](#msg5eff80dac223cc536a50dca4)imo, I see no issue with `unset!` existing because you can limit where it's allowed by using type annotations**

**meijeru**

**[19:17](#msg5eff842d3a0d3931face2eaf)@giesse My understanding of the existence of `unset!` is that it is an unavoidable consequence of the notions that (1) all values have a type (2) all words are bound to some value in some context.**

**greggirwin**

**[20:24](#msg5eff93ec613d3b339425274e)@giesse +1. @meijeru mostly correct. Whether or not a word refers to a value, if a value exists it has a type. So it's more that a value "slot" is why we can't do away with unset. Or choose not to, because using `none` instead is a different set of tradeoffs.**

**PeterWAWood**

**[22:45](#msg5effb505b8152d34847e2863)&gt; `op!`s are 2x faster than functions. That should make you love them ;)**

**It's more that having infix operators slow down function calling due to the "look ahead". In Rebol the penalty was only about 20%. If Red's infix operators really slow functions that much, there is a lot of room for improvement.**

**In the early days, when I advocated for Red to not have infix operators, Nenad said don't worry there won't be a performance penalty for function calls with the compiler.**

****Saturday 4th July, 2020****

**giesse**

**[07:46](#msg5f0033e9fa0c9221fc79e02f)@meijeru actually, it is just an implementation detail (words have to be bound to some context, so "unknown" words are added to the `system/words` "global" context and given a value of `unset!`; an alternative that was proposed for R2 back in 2004 was to give them an `error!` value instead). the no value/does not exist type in REBOL is `none!`.**

**hiiamboris**

**[08:42](#msg5f0040ffc223cc536a529b65)@PeterWAWood Looks like Nenad was right then:**  
**`t0: now/precise loop 10'000'000 [1 + 2] print difference t: now/precise t0 t0: t loop 10'000'000 [add 1 2] print difference t: now/precise t0`**  
**Interpreted:**  
**`0:00:01.49709 0:00:02.52814`**  
**Compiled:**  
**`0:00:00.610035 0:00:00.577033`**

**meijeru**

**[18:45](#msg5f00ce67ec4a341bee095db7)@giesse I do not agree that "no value" in REBOL is `none`. See this REBOL snippet:**  
**`>> type? get/any 'a == unset!`**  
**Exactly the same as in Red**

**greggirwin**

**[20:49](#msg5f00eb5cb8152d3484811b24)@meijeru I think what @giesse means is that `none` is our `nil/null/nothing` value in all Redbol langs. For 20 years `unset!` has been questioned. For 20 years it has remained. Now even a wholly new implementation would have to consider it for compatibility and legacy issues. The less we depend on, and expose it, the less code will break if it eventually goes away.**

****Sunday 5th July, 2020****

**ALANVF**

**[00:15](#msg5f011ba8bb149531eded458b)(reminder that we can't emulate optional arguments if `unset!` is gone)**

**giesse**

**[06:40](#msg5f0175ceb8152d3484823afe)@meijeru "a word that has not been set to any value" and "an expression representing nothing" are not the same thing. the very existence of an `/any` refinement for `get` is an implementation detail, and, if you look at it from some distance, quite weird. in fact, writing code that can deal with "any value" in R2 has always been tricky, and the resulting code often inscrutable. often the very mezzanines that came with R2 didn't handle things correctly.**

**[06:42](#msg5f01765e54d7862dc4ca9e81)@ALANVF but, there's no such thing as optional arguments in REBOL or Red. you can pass `unset!`, sure, but it's more cumbersome than passing `none!`. the only case where not providing a full set of arguments to a function makes any sense is at the console, but I'll argue that I'd rather see a console dialect than having built-in functions that are only supposed to be usable at the console and use tricks that are confusing to people.**

**pekr**

**[07:22](#msg5f017facbb149531edee180c)@greggirwin there are some ideas re none/null/void in the Ren-C. I think that nowadays we are not competing with that project, which is moving to stackless area, etc., but it might be interesting to look at that language wise. The discussion re unset! is hitting us back again and again ....**

**[07:25](#msg5f01807cd65a3b0292cc65ec)I don't have any concrete suggestion, just some point of view - are we defending 20 years old ideas? Imagine where would Carl take Rebol with Rebol 4 for example? Those things are not mantra which needs to stay for the next 100 years :-)**

**hiiamboris**

**[08:08](#msg5f018a63405be935cde07335)Dealing with zero and NaNs has always been tricky too. How many times you've seen divide by zero errors or totally weird results with NaNs? People aren't usually focusing on special cases, which is a separate problem.**

**Unset may be as well seen as a convenience of having something like a 'void' type, and being used to explicitly state that "there's no usable result this function can return, and if something tries - let there be an error". If we had `none` returned by `:word` that wasn't initialized, we would never be able to distinguish an "intentional nothing" from "unintentional nothing". No?**

**greggirwin**

**[09:55](#msg5f01a39047fdfd21ed052713)Here's my stance. If anybody wants `unset!` gone, they need to offer a better design, a complete design, and show how it's better. A fully detailed spec would be good, but a working implementation that makes it concrete even better. Sound good?**

**I want Red to be the best language it can be. If that means getting rid of `unset!`, I'm all for it. But it's a complete non-issue for us right now, and no Team Red resources can be allocated to it.**

**[10:01](#msg5f01a50aa813c72dcf2cb64d)Do I agree that `unset!` is an oddity? Yes. Do I have a better solution? No. Do I believe a better solution can be found? Ooooooh, maybe, but I also think that an unset-less version could end up creating more pain and problems, even if it's more pure and beautiful from design standpoint.**

**hiiamboris**

**[10:06](#msg5f01a635405be935cde0b0fb):+1:**

**Shaping**

**[15:03](#msg5f01ebd147fdfd21ed05db63)Can someone fix the console so that I can use it? I need a heavier font because of my monitor situation and distance. You can select a font, but the two I tried are not actually rendered. You do see a change in size, but the text is misaligned with the prompt. Can VS Code be used productively with Red?**

**hiiamboris**

**[15:50](#msg5f01f6e2b8152d34848371c1)You mean you pushed your monitor so far away that you don't see the letters?**

**wallysilva**

**[17:08](#msg5f02091a54d7862dc4cbfc4d)@Shaping yes, you can use VS Code, just get the extension: https://marketplace.visualstudio.com/items?itemName=red-auto.red**

**giesse**

**[19:26](#msg5f022953bb149531edefb2dc)&gt; If we had none returned by :word that wasn't initialized, we would never be able to distinguish an "intentional nothing" from "unintentional nothing". No?**

**It shouldn't return `none`, it should cause an error. The fact that the error is caused by an internal hidden type, an exposed `unset!` (which then needs to be handled specially every time you need to handle all types), or some other mechanism is not really important to the user.**

**[19:28](#msg5f0229e2bb149531edefb487)&gt; a working implementation that makes it concrete even better.**

**`>> print "something" something == "something" >> do [] == none >> probe :get native [ "Return the value of a word in its context" word [any-word!] options: any: no [logic!] "If value is not set, return NONE instead of causing an error" return: value ] == native [ == "Return the value of a word in its context" == word [any-word!] == option... >> get/any 'unset-word == none >> get 'unset-word *** Script error: Word has no value: unset-word *** Stack: get 'unset-word`**

**been around since 2011 :P**

**hiiamboris**

**[19:32](#msg5f022ab1b8152d348483f616)But this just means you still have a hidden unset type, just you don't expose it. As a result you lose the ability to replicate things 1-to-1: `a: get/any 'b` will transform unset into none.**

**[19:37](#msg5f022bdc6c06cd1bf4755c89)FIY `:word` and `:some/path` in Red are shortcuts to `get/any 'word` and `get/any 'some/path`, so `:word` returns `none` ;)**  
**But Gregg's question is how is this \*better\*?**

**greggirwin**

**[20:12](#msg5f023413405be935cde216cf)@Shaping what fonts did you try, and can you post a screen shot? If they just don't render at all, no need, but if there are alignment issues, it will help us to see them and know the exact font. Maybe your OS scale settings as well.**

**meijeru**

**[20:15](#msg5f0234d6a813c72dcf2e20dc)@greggirwin In `red/bugs` I read "we have new file! rules that require quoting rather than using percent encoding". Is this implemented already? If so, I need to adapt the specs document. And what about urls, do they still admit percent encoding?**

**greggirwin**

**[20:17](#msg5f02355c54d7862dc4cc7278)@meijeru those changes should be in place for `file!` yes, but "trust but verify". :^)**

**On `url!` there is active design chat on percent encoding, which also has no perfect solution.**

**meijeru**

**[20:20](#msg5f0235f5e0e5673398f5b41c)I checked now, and indeed it is in place. Urls still admit percent encoding.**

**greggirwin**

**[20:22](#msg5f02367f47fdfd21ed069b0b)Yes. No changes have been made to URLs yet, because we have to weigh alternatives about when things are encoded and decoded. It applies not only to single, literal values, but when you, for example, append a string to a URL and there is content in the string that looks like percent-encoded data.**

**[21:07](#msg5f02412d54d7862dc4cc8d87)On `unset!` if there is old chat we can pull links for into a wiki page, that would be great.**

**@giesse and others who have run up against `unset!` pain, examples will help. I've rarely felt that pain myself, so need to make comparisons of how we'd do things each way. In your error example, @giesse , I don't see a huge benefit. You \*do* get an error in the normal case, so I \*think* your idea there is not that `unset!` goes away; it just gets pushed further in to the shadows when `get/any` is used. Is that right?**

**I'll see if I can write a "Who's On First?" routine about it.**

**A: We have words in Red, which refer to values, like `who: 'Gregg`.**  
**C: So `who` refers to `'Gregg`.**  
**A: Right, but it could also refer to nothing, which we call `none`.**  
**C: What refers to `none`.**  
**A: No, `who` refers to `none`. `What` refers to a function that lists functions.**  
**C: So what refers to a list of functions?**  
**A: Anything can refer to a list of functions. They're just values.**  
**C: I'm confused. Can `anything` refer to `nothing`?**  
**A: Yes, but anything doesn't refer to `nothing` unless you tell it to.**  
**C: But if `anything` doesn't refer to `nothing`, until I tell it to, what does it refer to?**  
**A: It doesn't.**  
**C: Doesn't what?**  
**A: `What` does, yes, but only prints the list. There is no result.**  
**C: `Nothing` is the result, got it.**  
**A: No, `what` doesn't give you `nothing`.**  
**C: So what does it give me?**  
**A: `It` doesn't.**  
**...**

****Monday 6th July, 2020****

**giesse**

**[08:30](#msg5f02e118405be935cde3bc87)@hiiamboris "how is this better" - first of all, I'm not arguing about changing anything in Red really, it's just that people were arguing about having \*more* `unset!` and I'm clearly against that. As to how it is better, any function that can take any argument (eg. because you're iterating over values in a block, where it is reasonable to encounter `unset!`) needs to be written \*very carefully* if you don't want it to blow up one day when it does actually stumble upon an `unset!` value; the arguments need to be specified as `[any-type!]`, then you need to use `get/any` and `set/any` every time you are using one of those arguments, and possibly any other local word that may end up `unset!` because of one argument being `unset!` and so on. (BTW, the fact that `:a` in Red is the same as `get/any 'a` actually defeats the argument that we need `unset!` to be able to catch typos.)**

**Once again, the whole point of `unset!` and it causing an error was to be able to catch typos; if it's exposed then you have to constantly work around it.**

**[08:33](#msg5f02e1e8d65a3b0292cfd816)@greggirwin honestly I don't recall right now if I have a hidden `unset!` in Topaz or some other mechanism (eg. I don't have any optimization on word lookup if I recall correctly so there actually is no need to have a special value, because a word can be bound to the system context even if it is not present there). I'm ok with `unset!` existing under the hood, there is nothing wrong with that, it's just a pain if it's allowed to be returned in any case.**

**[08:36](#msg5f02e282c223cc536a58f2e6)For examples on how it is a pain, look at any code that is using `get/any` and `set/any`, eg. @hiiamboris mezzanines.**

**hiiamboris**

**[09:08](#msg5f02ea0c405be935cde3d341)&gt; needs to be written very carefully if you don't want it to blow up one day**

**Unset is not the primary cause of that though. I'd be more careful with `foreach x s [if x = ..]`-like constructs because of function values ;) A lot of Red runtime code can't be copy-pasted into the interpreter because of it.**

****Thursday 9th July, 2020****

**hiiamboris**

**[10:55](#msg5f06f7988342f4627403e470)Dangers of unset: https://github.com/red/red/issues/4496 ;)**

****Friday 10th July, 2020****

**hiiamboris**

**[19:03](#msg5f08bb78a5ab931e4f7ad5e2)@giesse I wonder. Did you have the \[error? try](https://github.com/red/red/issues/3755) problem with Topaz at all? Or, Topaz like R2 rethrows any error it encounters?**

****Saturday 11st July, 2020****

**giesse**

**[08:04](#msg5f09729ec7d15f7d0f867768)different design:**  
**`>> attempt [make error! [category: 'User id: 'message message: "User error"]] == make error! [ == category: 'User == id: 'message == message: "User error" == stac... >> attempt [cause make error! [category: 'User id: 'message message: "User error"]] == none`**

**[08:05](#msg5f0972bf6e1b8050c3e939a8)error values need to `cause` -ed to blow up**

**[08:05](#msg5f0972ddf6b7416284292dfd)this, again, means that in general you can pass around error values safely.**

**[08:06](#msg5f09732146c75b1e5e3a8c67)(normally you'd use `cause-error` rather than `make error! ...`)**

**`>> probe :cause-error func [ "Cause an error according to the given spec" spec [block! string!] ] [ cause make error! either block? spec [spec] [[ category: 'User id: 'message message: spec ]] ]`**

**hiiamboris**

**[08:09](#msg5f0973a2f6b7416284292f3e)This looks like Red to me (in Red you `do` an error to blow it up). How do you avoid the super ugly `error? err: try [result: make error! [...] 'ok]` solution?**

**[08:16](#msg5f097575f6b7416284293447)Ah. I see. You uglified `try` for that ;)**  
**`>> probe :try native [ "Try to evaluate CODE; if it causes an error, evaluate DEFAULT with WORD set to the ERROR! value" code [block!] word [any-word!] "Local to the DEFAULT block" default [block!] return: result "Either the result of evaluating CODE or that of evaluating DEFAULT" ]`**

**GiuseppeChillemi**

**[17:59](#msg5f09fe0b7a4e99049e048e3b)Would it be so bad for `index?` to accept `none` as argument and return `none` as result? This would help to propagate `find` returning `none` and have shorten code.**

**I think about:**

**`if found? series-pos: find [a b c d] 'x [series-pos: index? series-pos]`**

**Becoming**

**`series-pos: index? find [a b c d] 'x`**

**I don't see the bigger implications of not triggering an error on `index? none` and propagating none but I ask you for comments.**

**ALANVF**

**[18:00](#msg5f09fe2e8342f462740c5c21)it would fit with some of the other series functions, so I'd say yes**

**hiiamboris**

**[18:02](#msg5f09febadbf01050ab6b75e9)@GiuseppeChillemi did you mean:**  
**`if found? series-pos: find [a b c d] 'x [series-pos: index? series-pos]`**

**GiuseppeChillemi**

**[18:03](#msg5f09fef0a9378637e8c18bd6)Pardon, I forgot to remove INDEX? while editing it... I am changing the post**

**[18:03](#msg5f09fef4a5ab931e4f7e15e8)(Thanks!)... @hiiamboris, ok, changed!**

**hiiamboris**

**[18:04](#msg5f09ff388342f462740c5e7b)Just rewrite it as:**  
**`series-pos: attempt [index? find [a b c d] 'x]`**

**GiuseppeChillemi**

**[18:09](#msg5f0a004486ccb45b599d6d9b)Yes, I am aware of this solution. I think the propagation of `none` could make more linear code, that's the reason behind my question.**

**hiiamboris**

**[18:09](#msg5f0a006164ef9d04b2a93c17)It will also lead to hard to find errors in my opinion, though it's just a hunch**

**GiuseppeChillemi**

**[18:20](#msg5f0a02fc6e1b8050c3eabf6c)Hiiamboris, that's why I have made this RFC.**  
**I have thought too about it being useful to find errors but I don't know many times you have used it for this.**

**[18:24](#msg5f0a03f9bd3edf666fc46bff)@ALANVF**  
**&gt; it would fit with some of the other series functions, so I'd say yes**

**Yes, it fits to other series functions too.**

**hiiamboris**

**[18:25](#msg5f0a04343e4a827d19bcc9e9)Why not write your own `nondex?` function (none + index) and see how it improves your code and if it causes any unwanted effects?**

**[18:27](#msg5f0a048a3e4a827d19bccab8)By the way, I'm sure this came up a lot of times, but was always rejected, so there must be a reason.**

**GiuseppeChillemi**

**[18:28](#msg5f0a04b73e4a827d19bccaf9)WFC!**

**[18:28](#msg5f0a04c37455046699f2483d)(Waiting For Comments!)**

**ALANVF**

**[18:29](#msg5f0a050c6e1b8050c3eac4f1)btw somwhat unrelated, but what does `reflect ... 'changed` do on an `object!`?**

**[18:29](#msg5f0a05266e1b8050c3eac50c)I can't seem to figure out what it does when looking at the implementation https://github.com/red/red/blob/master/runtime/datatypes/object.reds#L1035**

**hiiamboris**

**[18:30](#msg5f0a05528b72655b556769f0)@ALANVF https://github.com/red/red/commit/05f996354ecc28eb8bd8ceafd5181126ba1a76b6**

**ALANVF**

**[18:31](#msg5f0a0595dbf01050ab6b8987)ah ok, so it shows you the words that have been changed since the creation of the object? interesting, thanks @hiiamboris**

**GiuseppeChillemi**

**[18:47](#msg5f0a09267455046699f25319)@hiiamboris I will try, it is very easy to do.**

**greggirwin**

**[20:36](#msg5f0a22b63c217837fd920adc)I have a very old safe `index?` variant (`index??`) and, IIRC, @giesse did as well. There may have been CureCode or AltMe chat about it, but I don't recall. There was a lot of chat at one point, about series indexing offsets related to negative values and `skip` vs `at`.**

**I'll discuss it with Nenad. It's a breaking change, and a reasonable convenience, with virtually no code cost, as `none!` just needs to support it as an action, along with the spec change.**

**[20:36](#msg5f0a22c946c75b1e5e3c5de9)@giesse, any thoughts?**

****Sunday 12nd July, 2020****

**giesse**

**[07:11](#msg5f0ab7a9bd3edf666fc60815)I used a different approach in Topaz:**  
**`>> find [a b c d] 'b == [b c d] >> find [a b c d] 'x == [] >> found? find [a b c d] 'b == true >> found? find [a b c d] 'x == false`**

**[07:14](#msg5f0ab85046c75b1e5e3db3a9)that being said, i'd guess that passing `none!` through in `index?` shouldn't cause too many problems. I'm still not sure how much this helps though, since you'll still need to check the index anyway, so perhaps a wrapper is a better compromise.**

**GiuseppeChillemi**

**[08:25](#msg5f0ac8e66e1b8050c3ec8cf1)It changes the order of words to not break the concatenation of the expression and make it more readable. It won't change the logic at all.**

**toomasv**

**[08:52](#msg5f0acf306e1b8050c3ec9c1b)Following @hiiamboris advice:**  
**`>> nondex?: func [what [series! none!]] [if what [index? what]] == func [what [series! none!]][if what [index? what]] >> series-pos: nondex? find [a b c d] 'x == none >> series-pos: nondex? find [a b c d] 'b == 2`**

**hiiamboris**

**[09:52](#msg5f0add76bd3edf666fc66616):+1:**

**GiuseppeChillemi**

**[11:21](#msg5f0af2463e4a827d19bef56e)Great**

**ldci**

**[11:41](#msg5f0af6ee7455046699f47f9b)Hi folks, just for fun with redCV: https://twitter.com/fjephe/status/1281956578019557376**

**toomasv**

**[11:52](#msg5f0af986f6b74162842d0708)@ldci Nice blend! :+1:**

**greggirwin**

**[21:36](#msg5f0b824a46c75b1e5e3fb83a)Thanks @giesse. How can you tell not found from, e.g., `find/tail [a b c d] 'd`?**

**[21:38](#msg5f0b82e37455046699f5e9e0)@ldci \*really* nice. With recent chat about image editing, undo, more programmable control and "what if" playing, I'm thinking more about what we could build in Red that shows off redCV.**

****Monday 13th July, 2020****

**ldci**

**[07:09](#msg5f0c08b4bd3edf666fc9549f)@greggirwin @toomasv : thanks for comment. redCV will be updated with a lot of new samples (around 200), new libraries, and new documentation ASAP.**

**hiiamboris**

**[07:31](#msg5f0c0dc986ccb45b59a26171)@greggirwin `find` has no refinements in Topaz, at all :)**

**planetsizecpu**

**[08:01](#msg5f0c14c046c75b1e5e4110ba)Good job @ldci**

**ldci**

**[08:01](#msg5f0c14eea5ab931e4f8332a8)@planetsizecpu Thanks!**

**Oldes**

**[11:10](#msg5f0c41433e4a827d19c247b2)@GiuseppeChillemi**  
**&gt; Would it be so bad for index? to accept none as argument and return none as result?**

**My opinion is, that it would be good. And Rebol3 accepts none as an argument.**

**[11:14](#msg5f0c420746c75b1e5e4188c8)@greggirwin**  
**&gt; It's a breaking change, and a reasonable convenience...**

**Could you please provide an example, what it would break?**

**greggirwin**

**[13:50](#msg5f0c6690bd3edf666fca58b8)Thanks @hiiamboris.**

**[13:54](#msg5f0c67a98342f46274124b56)@GiuseppeChillemi**  
**`>> blk: [a b c d] == [a b c d] >> either error? try [idx: index? find blk 'e][print "Not found"][print mold idx] Not found`**

**Oldes**

**[13:57](#msg5f0c682edbf01050ab71651f)@greggirwin in R3:**  
**`>> print either idx: index? find blk 'e [mold idx]["Not found"] Not found`**

**endo64**

**[13:59](#msg5f0c68a4bd3edf666fca5e5e)See also https://github.com/red/red/issues/3144 on `index?` returns none issue.**

**hiiamboris**

**[14:01](#msg5f0c692446c75b1e5e420053)I knew I saw this topic somewhere! ;)**

**greggirwin**

**[14:05](#msg5f0c6a227a4e99049e0a9ed7)Thanks for finding that @endo64. :+1:**

**GiuseppeChillemi**

**[14:19](#msg5f0c6d7d46c75b1e5e420d5b)There should be also a chat on gitter, it is mentioned there.**

**endo64**

**[14:58](#msg5f0c768da9378637e8c7b7f5)@GiuseppeChillemi we should use @rebolek 's gritter tool to find it :)**

**GiuseppeChillemi**

**[17:12](#msg5f0c960b6e1b8050c3f134ea)I like Doc observation on `none` being a way to avoid newcomers using the index instead of the series on the position itself. I have understood the intention.**

**giesse**

**[18:37](#msg5f0ca9e9bd3edf666fcb383c)@greggirwin perhaps `find/tail` would have to return `none`. It all depends on use cases, I didn't have any for `/tail` in Topaz back then.**

****Tuesday 14th July, 2020****

**rebolek**

**[09:05](#msg5f0d754ca9378637e8ca645e)@endo64 I should make just search app and offer it, it would be a hit :-)**

**meijeru**

**[10:01](#msg5f0d8297a9378637e8ca8c44):+1:**

**ldci**

**[15:27](#msg5f0dcecd3fb51c4967a0d5f8)redCV will be updated tomorrow, but you can have a look here https://redlcv.blogspot.com for new functions for face recognition with red langage.**

**GiuseppeChillemi**

**[15:46](#msg5f0dd3469aa33c558427bcdc)@ldci Wow, I will try it.**

**toomasv**

**[16:33](#msg5f0dde5b0d37916fda74eebe)Very interesting overview, @ldci ! Thanks!**

**[17:57](#msg5f0df1fe3fb51c4967a14fb4)@GiuseppeChillemi et al :point\_up: \[Dec 16, 2017 15:28](https://gitter.im/red/red?at=5a351f7ec65707ba2b5cbd08)**

**TimeSlip**

**[17:59](#msg5f0df26554d58c013a4138f3)@ldci That's great.**

**bkalef88\_gitlab**

**[20:58](#msg5f0e1c8cd6039801464e9968)@ldci Awesome work!**

**GiuseppeChillemi**

**[21:35](#msg5f0e253a9c75aa256b3e6647)@toomasv Grazie!**

****Wednesday 15th July, 2020****

**Respectech**

**[01:11](#msg5f0e57d99aa33c5584292965)@ldci Amazing work! I'm looking forward to trying this with my cameras here at work. I read through the whole article which was written very well. But I was wondering if it would be possible to identify a face based off of some sample images of a person. It would be nice to know who is coming through the door. :-)**

**toomasv**

**[03:20](#msg5f0e75ffe3505d7736fe09a4)@GiuseppeChillemi Prego :)**

**ldci**

**[06:16](#msg5f0e9f4554d58c013a42fa4b)Hi everybody , thanks for comments about redCV. @Respectech : you'll find in new redCV\_Samples doc, an example of how to use Histograms of Gradients (HOG) and Dynamic Temporal Warping (DTW) to compare faces without neural network.**

**planetsizecpu**

**[06:50](#msg5f0ea74754d58c013a430f3f)Wow! @ldci very interesting work, leaving aside the lady who is on her knees in the oil, has caused me some concern :^)**

**Maybe you are interested in the opposite side of your work, that is, to protect images for privacy, from being detected by deep machine learning, I saw yesterday \[this](https://github.com/Shawn-Shan/fawkes) project from Chicago university interesting too.**

**ldci**

**[07:12](#msg5f0eac6b26b22649721fd860)@planetsizecpu Thanks a lot for the link: very interesting project.**

**[07:40](#msg5f0eb2ec1c84e5557926962c)As promise, summer break 2020 update for redCV is here https://github.com/ldci/redCV. Enjoy.**

****Friday 17th July, 2020****

**GiuseppeChillemi**

**[23:15](#msg5f12310cf8b05b39f951271d)I am working on some code that works on either block and objects. I check if elements exist via `empty?` or `empty? words-of`. But I ask why not having a unique and uniform querying method for data containers ? I see good if `empty?` would accept objects as argument too. Do you see limits or dangers on this?**

**greggirwin**

**[23:44](#msg5f1237cdf8b05b39f95135f9)We can easily patch `empty?` or make `empty??` to do that, as it's a mezzanine. There is a higher cost for checking objects, as `words-of` has to allocate a block, but if that check is made last, it would only affect object use cases.**

**My question in return is how you're creating empty objects. Since they can't have words added to them, they are not very useful.**

****Saturday 18th July, 2020****

**meijeru**

**[11:16](#msg5f12da1c4a9e2578a0a7a159)Objects cannot YET have words added to them. The function `extend` admits a `map!` or `object!` argument but for objects it is not yet implemented.**

**GiuseppeChillemi**

**[16:40](#msg5f132618f8b05b39f9534ac8) @greggirwin**  
**I use objects to store DB rows and their respective table columns names are the elements of the object. If the foreign table has no columns then the object will be with no elements.**

**I have an alpha `SET` function which permits to name the source and destination elements when objects are provided (and some other new workings). This set function is useful to selective copy to another object just the columns I want.**

**To manage the `empty? object!` or `block!` scenario one of my case condition is as follows:**

**`any [ (block? destination-element) and (not empty? destination-element) (object? destination-element) and (not empty? words-of destination-element) ] [`**

**While writing it I have asked to myself: as objects are containers of elements, why can't `EMPTY?` just work on them? It is congruent with the whole concept of containers, numbering, and emptiness.**

**Having objects accepted by empty? This simplified checking would be possible:**

**`any [ (block? destination-element) or (object? destination-element) not empty? destination-element ]`**

**Hope this is the answer you were asking from me.**

**hiiamboris**

**[17:00](#msg5f132ab4564e6b39f5652103)**  
**`not empty? switch type?/word destination-element [ block! [destination-element] object! [words-of destination-element] ] [`**

**[17:06](#msg5f132c2882ccdc78add07814)`not empty? do head change [none destination-element] pick [none words-of] block? destination-element`**

**[17:07](#msg5f132c63775d59377cff11a8)That's a bit too dynamic though ;)**

**GiuseppeChillemi**

**[17:59](#msg5f133883a28d973192e232cc)Well, I was not asking for a different way (which is always nice as you give food to my mind) but I was annotating that an object is a container and `empty?` is perfectly applicable to it.**

**hiiamboris**

**[18:05](#msg5f1339ddb2dad248b6c48376)@GiuseppeChillemi https://github.com/red/red/issues/614**

**[18:06](#msg5f133a2118ddba6ef5e1089e)6.5 yrs old question ;)**

**GiuseppeChillemi**

**[18:12](#msg5f133ba082ccdc78add09ec3)In case it will not have an answer I will resurrect it after another 6.5 years.**

**hiiamboris**

**[18:30](#msg5f133fd0fd3832489b1948f0)It was answered there.**

**GiuseppeChillemi**

**[18:44](#msg5f1342fdf8b05b39f9539297)Yes I have read that:**

**[18:44](#msg5f134305a28d973192e24b7a)"Objects in Red won't support series-like actions as extensively as Rebol3. So, I'm dismissing this ticket."**

**[18:44](#msg5f134324fd3832489b195030)But 6.5 year is a long time, maybe minds can change**

**[18:46](#msg5f134373564e6b39f5655c0f)But I think it is still not the time: find support for objects has been removed. So nothing ha changed.**

**[18:48](#msg5f1343f7564e6b39f5655dc9)I don't know the reason for his position. I find useful working in containers in a common way.**

**hiiamboris**

**[18:49](#msg5f13441f82ccdc78add0b2bc)Well, you need a solid argument ;) "Hi! I'm creating empty objects" is not a solid argument..**

**[18:50](#msg5f13447c18ddba6ef5e11ebc)Because you're proposing to change the language for an esoteric use case.**

**[18:55](#msg5f13459ca874ff08d283f570)If you could find an argument to support `length? object` that would automatically make `empty?` support it. That should be your plan IMO ☻**

**GiuseppeChillemi**

**[19:15](#msg5f134a55775d59377cff54b2)I have not mentioned `length?` on purpose because I have waited for the first answers on `empty?`as the family where they come is the same.**

**[19:16](#msg5f134a8582ccdc78add0c22f)\*family where they come from**

**greggirwin**

**[21:15](#msg5f13666364b6213da147c6a7)It's a tricky thing @GiuseppeChillemi. If you want `empty?`, do you also want all other series operations? Decisions have to be made on a case by case basis.**

**wallysilva**

**[21:18](#msg5f136736775d59377cff9851)Hi guys, so I'm playing with the console and I got an odd behavior:**  
**`>> prin ["hello" "hello"] hello hello >> prin ["hello" lf "hello"]hello hello >> prin ["hello" newline "hello"] hello hello >> prin ["hello" lf "hello"] hello hello >> prin ["hello" lf "hello"]hello hello`**  
**Is that a bug or an expected behavior?**

**greggirwin**

**[21:25](#msg5f1368ada874ff08d28446b9)`Prin` has some issues in the GUI console, depending on the build you're running. Do you also have `hello` defined?**  
**`>> prin ["hello" lf "hello"] hellohello hello*** Script Error: hello has no value *** Where: catch *** Stack:`**

**[21:25](#msg5f1368d5724012319bb572c4)In the CLI console:**  
**`>> prin ["hello" lf "hello"] hello hello hello*** Script Error: hello has no value *** Where: catch *** Stack:`**

**[21:26](#msg5f1368ec18ddba6ef5e171c3)@qtxie may be able to say what the current state of things is there.**

**wallysilva**

**[21:32](#msg5f136a54a874ff08d2844ac6)@greggirwin Not defined, it's just `"hello"` as a string. I was just playing to see the difference between `lf` and `newline`.**  
**I'm using the latest auto build: `Red 0.6.4 for Windows built 17-Jul-2020/5:41:29-07:00 commit #7f2db9b`**

**hiiamboris**

**[21:34](#msg5f136ac8f8b05b39f953ebee)@wallysilva please add your findings to https://github.com/red/red/issues/2986**

**[21:34](#msg5f136aeffd3832489b19b0b7)quite a mess indeed**

**greggirwin**

**[21:35](#msg5f136b145ed1d537746b9b5e)Ah, yes, I thought you typed the last `hello`. :^\\**

**GiuseppeChillemi**

**[21:37](#msg5f136b8000ae3b3d99fb97b4)Gregg, I answer positively. If the containers paradigm is applicable why not having all the relevant functions? So you have not to express some code flows with variations but in a unique way. `Append`, `pick`, `find` are all applicable so manipulation, (especially when `extend` will be available) can happen with the standard methods we apply to other containers..**

**wallysilva**

**[21:38](#msg5f136bef8e9a3a6ef09e4404)@hiiamboris Will do!**  
**Thanks guys.**

**greggirwin**

**[21:39](#msg5f136c23b2dad248b6c4f7f0)@GiuseppeChillemi does `append` work the same for blocks and map/objects in your mind?**

**hiiamboris**

**[21:42](#msg5f136cb5a28d973192e2b0b8)I'm more interested in `find object`, which would imply working `next object`**

**9214**

**[21:44](#msg5f136d4da874ff08d2845235)`find` on objects was ditched in favor of `in`.**

**GiuseppeChillemi**

**[21:46](#msg5f136dac00ae3b3d99fb9d70)I see it making this operation:**

**````object: make object! [ a: 22 b: 33 ] c: 44 append object 'c ``` Then:````**  
**object: [**  
**a: 22**  
**b: 33**  
**c: 44**  
**]**  
**\`**

**9214**

**[21:48](#msg5f136e218a9a0a08cba86072)And how would `append` figure out that `44` is associated with `c`?**

**GiuseppeChillemi**

**[21:50](#msg5f136e888e9a3a6ef09e4a18)Because it get its value from the current `c` context (If I have understood correctly your question)**

**greggirwin**

**[21:50](#msg5f136e915ed1d537746ba6d8)@GiuseppeChillemi that won't work unless the arg is a lit-arg, or you use `'c` 1) what happens when you `append object` 2) what happens when you `a: 44 append object a`?**

**GiuseppeChillemi**

**[21:51](#msg5f136ec918ddba6ef5e18008)Pardon, I have corrected the example**

**[21:52](#msg5f136f0082ccdc78add11a76)I remember having read that a lit-word has a context in one of Vladimir lessons.**

**[21:52](#msg5f136f07b2dad248b6c4fddd)But I may be wrong!**

**[22:00](#msg5f13711ab2dad248b6c50160)@greggirwin**  
**&gt; 1) what happens when you append object &lt;any-non-word value or values&gt; 2) what happens when you a: 44 append object a?**

**It just does not work. `append object 'c` is one of the valid combinations and also:**

**`append object [c d e]` where words are bounded and set (all other values are discarded),**  
**or**  
**`append object object2` and**  
**`append object [c: 22 d: 33: e: 44]`**

**greggirwin**

**[22:05](#msg5f13720c5ed1d537746bae4b)So then you can't write common code, because many cases no longer work. That is, in your code, you have to check to make sure if the target is an object, do one thing, if it's a series, do another. And you're back where you started.**

**GiuseppeChillemi**

**[22:21](#msg5f1375d74a9e2578a0a915ad)I could agree but partially because it would be a nonsense for a programmer to feed a `string` to an `append` you perform on an `object`.**  
**I am not thinking about reusing the code for all the available combinations but just to handle the subset of data of the target container of your operations.**

**greggirwin**

**[22:33](#msg5f1378cc775d59377cffbeb8)It's a contradiction, and why language design is hard. You want `empty?` to work transparently, but are OK with other actions not so.**

**Come back to `append object 'a` then, where `a` is already in the object. Now `append` really means `change`, right?**

**[22:34](#msg5f1378db4a9e2578a0a91cac)There always has to be logic to handle differences, or accept ambiguity and add logic to deal with it later.**

**[22:35](#msg5f137926775d59377cffbf6b)This is a case where it's easy to mock up your own variant to show its worth. My gut says we're just pushing logic around.**

**GiuseppeChillemi**

**[23:12](#msg5f1381fa00ae3b3d99fbcb22)@greggirwin:**

**&gt; You want empty? to work transparently, but are OK with other actions not so.**

**I am expressing something different: you should abstract and try to let actions work on all the structures which share the same paradigm. `append object 22` is a non-sense so I wont't generalize this. But `empty? object` has sense and let you reuse some coding patterns. `append object [a b c]` or `append object [a: 22 b: 33 b: 33]` have a sense for this subset of data so it will globally diminish the number of code variations.**

**Abstraction is good and valid until this operation does not let you lose important information: think about REBOL `first|second|third` on `objects`. It is FAR BETTER having `words-of`; `values-of`; `specs-of` as the command word carries more information that just the word expressing an ordinal position. But if we have `APPEND object [block]`, which is the advantage using `EXPAND object [block]` over it ? I see nothing until refinements are needed.**

****Monday 20th July, 2020****

**rebolek**

**[07:33](#msg5f1548e44a9e2578a0ad4777)I've pushed a new version of \[Red Tools](https://github.com/rebolek/red-tools) that introduces new function `make-reply` (and `send-reply`). This is server counterpart of `send-request`. Basically it saves you from doing**

**`print "Content-Type: what/ever" print "" print some-stuff`**

**by providing a simple interface with one function that autodetects content type and sets it. So if you do `make-reply {hello world}`, Content-Type will be `text/plain`, `make-reply {`**

**`hello world}`, Content-Type is set to `text/html` and for `make-reply {{"hello": "world"}}` you get Content-Type `application/json`.**

**You can override the autodetection in a simple dialect. Support for more header values and cookies will come soon. There's also simple documentation in `make-reply.md`.**

**As the number of lines of `%http-tools.red` quickly approaches one thousand (oh the horror!), I'm thinking about splitting the file and moving it into a separate repository. If/when that happens, I let you know here.**

**GiuseppeChillemi**

**[08:53](#msg5f155ba6a28d973192e72638):clap: :clap:**

**endo64**

**[09:29](#msg5f1563f000ae3b3d9900174a)@rebolek 👍, could it be better naming `send-response & make-response` ? We usually use request &amp; response for HTTP operations.**

**rebolek**

**[09:30](#msg5f15643c18ddba6ef5e60bf2)@endo64 I'm all for short names, but this makes sense. I'll push renamed version soon.**

**[09:30](#msg5f1564448a9a0a08cbace1d9)Thanks for suggestion**

**[09:40](#msg5f156676775d59377c042b96)Done**

**endo64**

**[13:14](#msg5f15989c724012319bba9cdd)Thanks!**

**greggirwin**

**[17:56](#msg5f15dad500ae3b3d99017f44):+1:**

**TimeSlip**

**[17:57](#msg5f15db018e9a3a6ef0a45da7)@rebolek Thank you!**

****Tuesday 21st July, 2020****

**vazub**

**[16:54](#msg5f171dd0a4b25c73c1df29bd)While working on Docker image for Red, I've also looked into the possibility of building Red console with \*\*musl\** instead of \*\*Glibc\** on Linux - to be able to use Red with Alpine Linux and other musl-based distros. This turned out to be pretty trivial, with minor additions to Red targets/config files (PR submitted moments ago).**

**Used my Rebol 2 Docker flow (Ubuntu-based) to build the console and then used typical i386/alpine docker image to run it - works like a charm, with no issues so far. Hope this brings some value to the project.**

**greggirwin**

**[16:59](#msg5f171edf9419f46bf5bdcbce)Thanks @vazub.**

**rcqls**

**[17:58](#msg5f172cb515e5e72fb368b2d3)@vazub is red/GTK running properly on alpine/musl ? My previous try did not work 1 year ago….**

**vazub**

**[18:17](#msg5f17313d273e723b7ff6d262)&gt; @vazub is red/GTK running properly on alpine/musl ? My previous try did not work 1 year ago….**

**Not yet. I've literally just submitted a PR to compile Red with musl. If it gets merged and propagated to GTK branch - I'll be testing it with Alpine-based docker images.**

**rcqls**

**[19:43](#msg5f17457b43d5173b8c0d5d35)My last try permitted only to open the window but unfortunately without drawing the widget….**

**greggirwin**

**[19:44](#msg5f1745a77a668c64e9f8819b)@rebolek noted that when he tried it a year ago there were issues with musl and file access.**

****Wednesday 22nd July, 2020****

**rebolek**

**[06:27](#msg5f17dc3a9419f46bf5bfbe48)There are some differences between glibc and musl (see https://wiki.musl-libc.org/functional-differences-from-glibc.html). I will try your PR today @vazub to see if the old problems are still there.**

**cloutiy**

**[13:52](#msg5f18449a273e723b7ff9b1f9)@rebolek @ALANVF Next steps: 1. Send the reply to the red.js in the browser and red.js make send requests to the server. 2. Save the internet.**

****Thursday 23th July, 2020****

**ALANVF**

**[19:53](#msg5f19ead3a050df43000fbd71)hmm yes would be nice**

**[19:55](#msg5f19eb15a050df43000fbe05)we're not there yet, but hopefully at some point soon**

****Friday 24th July, 2020****

**rebolek**

**[14:20](#msg5f1aee28c83e6242ed5050fe)As promised, HTTP-tools have a new home now - \[CASTR](https://gitlab.com/rebolek/castr) - Client And Server Tools for Red.**

**I've split HTTP-tools into two (three) files, `%client-tools.red` and `%server-tools.red` (and `%common-tools.red` that have stuff used by both client and server).**  
**There are also other useful tools, mainly for server-side, like `%transform.red` and `%users.red`. As this repo is really fresh, there may be some problems caused by file splitting. As I'll be updating my projects to use this repo, all the problems will be fixed eventually. `%HTTP-tools.red` would stay in the old repo for some time, but would be replaced with a placeholder pointing to the new repo once I'm confident that all possible problems are gone.**  
**Another thing is that because of this change, I no longer guarantee that `send-request` will be backward compatible which will allow me to switch to a newer dialect-based version.**

**planetsizecpu**

**[14:24](#msg5f1aef3bb1409c060f7eff04)@rebolek Good job!!!**

**rebolek**

**[14:25](#msg5f1aef7149bae2060117fba6)@planetsizecpu Thanks, but not yet. It will be a good job once it's all tested properly :-D**

**greggirwin**

**[15:02](#msg5f1af80d77eccd0e14710170):+1:**

**pekr**

**[16:29](#msg5f1b0c6b25cae90e6d7b2e1f)@rebolek Should be called CASTRO :-)**

**TimeSlip**

**[18:10](#msg5f1b242fd50f2b289a920f1d)@rebolek Awesome.**

**GiuseppeChillemi**

**[18:27](#msg5f1b280725cae90e6d7b78f1)@rebolek could I suggest CASTOR? It is a nice animal and could be great to use its image associated to your tool, like GNU in for FFS and GPL!**

**ldci**

**[18:58](#msg5f1b2f3a2779966801fc5611)@rebolek +1 for CASTOR**

****Saturday 25th July, 2020****

**rebolek**

**[05:36](#msg5f1bc4e53eef7e1ffe3165a4)Why not, thanks for the suggestion. I suck at naming.**

**wallysilva**

**[05:48](#msg5f1bc79177eccd0e14731cdb) @rebolek CASTR is not bad at all, specially if it sounds like "caster" - a tool to cast Red to the Web!**

**pekr**

**[09:56](#msg5f1c01b8a050df430014e6a6)I do agree, my suggestion was mosty a joke, no need to rename at all 😀**

**GiuseppeChillemi**

**[12:15](#msg5f1c225ea050df43001534c0)CASTOR is more complete as it sounds like CASTR. So you can rapresent it as a Castor with an antenna on its head!**

**[12:15](#msg5f1c2275bc41f36817236aa1)😁**

**wallysilva**

**[21:26](#msg5f1ca36c2779966801ffd0a0)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/Vvxw/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/Vvxw/image.png)**

**GiuseppeChillemi**

**[22:46](#msg5f1cb63249bae206011c942e):-D**

****Sunday 26th July, 2020****

**rebolek**

**[05:49](#msg5f1d196c49bae206011d715a):+1:**

****Monday 27th July, 2020****

**Yamoon2018**

**[04:28](#msg5f1e580725cae90e6d8326ac)Hello, I need a reference on how to find keyboard short cuts like Control+z and so on.**

**toomasv**

**[04:45](#msg5f1e5bfbf8dfed4382bfc101)Hi @Yamoon2018 , here are console shortcuts from code**  
**`#"^M" [exit-ask-loop] ;carriage-return (or just enter) #"^H" [delete-text/backward ctrl?] ;backspace #"^~" [delete-text/backward yes] #"^-" [unless empty? line [do-completion line char]] ;tab left [move-caret/event -1 event] right [move-caret/event 1 event] up [either ctrl? [scroll-lines 1] [fetch-history 'prev]] down [either ctrl? [scroll-lines -1] [fetch-history 'next]] insert [if event/shift? [paste exit]] delete [either event/shift? [cut] [delete-text ctrl?]] #"^A" home [ if shift? [select-text 0 - pos] pos: 0 ] #"^E" end [ if shift? [select-text (length? line) - pos] pos: length? line ] #"^C" [copy-selection exit] #"^V" [paste exit] #"^X" [cut] #"^Z" [undo undo-stack redo-stack] #"^Y" [undo redo-stack undo-stack] #"^[" [exit-ask-loop/escape] #"^L" [clean] #"^K" [clear line pos: 0]`**

**rebolek**

**[04:47](#msg5f1e5c63bc41f3681728ccf1)@wallysilva would you mind if I'll use it as a logo? :-)**

**wallysilva**

**[04:50](#msg5f1e5cf977eccd0e14793ff0)@rebolek It's not mine, I found it \[here](https://drawception.com/game/mY8P43zYdp/permanent-markers-stalk-dry-erase-board/#panel-7632065)**

**rebolek**

**[04:50](#msg5f1e5d27bc41f3681728ced0)then I have to draw mine :-)**

**wallysilva**

**[04:58](#msg5f1e5ef4e9066820051d38d6)I believe in you, you can do it! 🙌**

**Yamoon2018**

**[04:59](#msg5f1e5f3e49bae20601208377)Thanks @toomasv**

**toomasv**

**[05:06](#msg5f1e60b9a050df43001aa51f)You are welcome!**

**rebolek**

**[06:52](#msg5f1e79b4d50f2b289a9a31e7)It needs some work to be recognizable... https://i.imgur.com/7I0vO2X.png**

****Tuesday 28th July, 2020****

**wallysilva**

**[02:00](#msg5f1f86afe90668200520624a)@rebolek I made \[this one](https://imgur.com/hkaDq2g) inspired by yours.**

**rebolek**

**[04:24](#msg5f1fa88e2779966801074658)@wallysilva \*much* better. Can I use it?**

**wallysilva**

**[04:31](#msg5f1faa28b1409c060f8ae857)@rebolek Sure, but that's just a draft. You know what, maybe you should do a contest to choose CASTR's logo. That could be fun!**

**rebolek**

**[04:33](#msg5f1faa89f8dfed4382c2f42b):)**

**greggirwin**

**[16:46](#msg5f2056573eef7e1ffe3cf29c):^) Nice @wallysilva.**

**wallysilva**

**[17:20](#msg5f205e42fe6ecd28887ce021)Thanks, @greggirwin**  
**I sent the final version to @rebolek, but I still think that a contest could be fun to shake things up a bit! :D**

****Wednesday 29th July, 2020****

**ldci**

**[11:34](#msg5f215ec9b1409c060f8f6ed6)A new developer for redCV project: https://twitter.com/fjephe/status/1288437050555936768**

**GiuseppeChillemi**

**[11:41](#msg5f21606db1409c060f8f7277)I have my mouth open and can't close it.**

**pekr**

**[11:41](#msg5f21607ccd7bed0e379b09a1)Is the matrice datatype going to become part of the Red itself, or will it live in terms of the RedCV codebase?**

**[11:42](#msg5f2160c13eef7e1ffe3fb4b4)Sounds good anyway, we all know Toomas is kind of a Red genius :-)**

**ldci**

**[11:47](#msg5f2161cffe6ecd28887f7f21)@pekr With Toomas we are designing a general matrix datatype based on vector! datatype**  
**`;-------------------------------Matrix (mx)---------------------------------------------- ;--mx is a special vector where matrix properties are inserted at the head of matrix ;--mType: matrix type as integer [1: Char, 2: Integer, 3: Float] ;--bitSize: bit-size as integer [8 | 16 | 32 for integer! and char!, 32 | 64 for float!] ;--mSize: matrix size as pair with m rows and n columns (e.g 3x3) ;--mData: matrix values as block transformed into vector for fast computation ;----------------------------------------------------------------------------------------`**  
**Then this design will be proposed to Nenad and Qingtian for integration in Red language.**  
**Toomas is talented and elegant developer :)**

**rebolek**

**[11:53](#msg5f2163293eef7e1ffe3fbb80)great news!**

**GiuseppeChillemi**

**[12:21](#msg5f2169defe6ecd28887f9862)&gt;Toomas is talented and elegant developer :)**

**I agree**

**pekr**

**[12:36](#msg5f216d6b3eef7e1ffe3fd861)He surely is! I do remember Carl planning on object specs ... maybe it could be designed, so that multiple Red datatypes would benefit from such a principle - http://www.rebol.net/r3blogs/0350.html**

****Thursday 30th July, 2020****

**Yamoon2018**

**[04:27](#msg5f224c2877eccd0e148417b1)I'm trying to figure out how to change view title each time I open a file as I want the file name to be displayed in the view title, but it's not working**

**window-title: ""**

**open-img: func\[][**

**img-file-name: request-file/filter \["png" "\*.png" "jpeg" "\*.jpg" "gif" "\*.gif"]**  
**only-file-name: find/last img-file-name "/"**

**window-title: rejoin\["File name: " only-file-name]**  
**]**

**menu-block: layout [**  
**title window-title**  
**]**

**view/options/flags menu-block \[offset: 0x0]\[resize]**

**toomasv**

**[07:09](#msg5f227237f8dfed4382ca71f1)@Yamoon2018 Please go over to the \[help room](https://gitter.im/red/help?at=5f2271f625cae90e6d8d379e)**

****Friday 31st July, 2020****

**9214**

**[12:18](#msg5f240c3096bd3446a7c4dcc5)@ldci `mType` and `bitSize` are redundant since `vector!` already contains such information (`type` in value slot, `unit` inside series buffer); so, technically, `matrix!` is a `vector!` coupled with an `integer!` that represents row or columns size.**

**You should also take the limitations of value slot size into account, e.g. there's no space for `mSize` in 32-bit representation, unless you pack it into 3 bytes inside \[`type`](https://github.com/red/red/blob/master/runtime/datatypes/structures.reds#L290) field. And what about alternative/optimized matrix representations, e.g. for storing sparse arrays, row- and column-major orders? If they are supported then the differences in format need to be indicated somehow, probably with bit flags in the header.**

**That's an interesting datatype to design, esp. considering the applications to CV and scientific computing in general — you'll also need to design `matrix!` actions in a way that is both useful (think NumPy and APL) and idiomatic with Red. There's also a whole sleuth of \[open design questions](https://github.com/red/red/issues?q=is%3Aissue+is%3Aopen+vector%21) about `vector!`.**

**Best of luck to you and @toomasv with that. :smiley\_cat:**

**[12:56](#msg5f24151036563560f2b4cb06)&gt; maybe it could be designed, so that multiple Red datatypes would benefit from such a principle - http://www.rebol.net/r3blogs/0350.html**

**Red already can do that with object ownership system, see \[`system/locale/currencies`](https://github.com/red/red/blob/master/environment/system.red#L314) as an example — it keeps tabs on the data, enforces the immutability of object's fields, and blocks malformed entries from being added to currency list. OTOH it's too heavy-handed approach, but the one that gives you a fine-grained control.**

**The basic premise in Carl's blog post is protocoling: the way APIs are written right now in Redbol is that you write some code, wrap it in a "module", and expose user-facing functions. `function!` acts as a gateway to functionality and enforces certain guarantees, like the number of arguments and their types — a protocol that user is supposed to follow. With ownership and typed fields we can take a step away from that and represent API as an object where you set "argument" fields and get the result in "return" field; e.g. \[GPIO](https://www.red-lang.org/2019/07/gpio-port-for-raspberry-pi.html) can give you an object where each field is a pin that you can set to values of certain datatypes, like `integer!` and `logic!`, while other datatypes (or values out of specified range) would generate an error. By setting object's fields you can interact with the system in real-time, something that View's virtual tree of faces already does in a certain sense. The "protocol" of this user interaction is forced by what Carl calls object's operational specification (or just a spec), in our case that would be ownership code. So one can implement a framework of pre- and post-conditions on top of that idea, and make his code self-healing and self-protecting — abovementioned `system/locale/currencies` was a PoC for that ,made in the absence of Secure dialect.**

**And then there's also a generalization between `function!` and `object!` which are not really that different between each other:**  
**`foo: func [a b /bar c][a + b - c] foo/bar 1 2 3`**  
**Is the same as**  
**`do bind [a + b - c] context [a: 1 b: 2 bar: true c: 3]`**  
**With a few caveats:**  
**1. `function!` provides "protocoling" in the form of argument's order and typing;**  
**1. `function!` provides optimization by keeping argument values off the heap and on the evaluation stack;**  
**1. `function!` provides niceties like embedded docstrings and different modes of argument passing.**

**So I see Carl's blog entry as a vague hint on unification between the two. Or maybe on an idea behind Clojure's \[spec](https://clojure.org/guides/spec) and dependent types, who knows.**

**ldci**

**[13:46](#msg5f2420b414c413356f49aa57)@9214 Thanks Vladimir for the insight. You're right matrix! will be close to vector! datatype. But it will be also different for some actions such as multiply which will implement dot product for matrices and not only terms to terms multiplication. With Toomas, we're testing all the properties ans methods we want for matrices. Work under progress.**

**pekr**

**[14:09](#msg5f24260a61a83168462baeb7)Nice description - should be wikified :-)**

****Saturday 1st August, 2020****

**meijeru**

**[10:23](#msg5f2542a70ff358499bc98841)I just discovered that any number of `<` signs make up a valid `word!` literal. The only ones pre-defined are of course `<` and `<<`, but `<<<`, `<<<<` etc. are valid. Same remark for `>`, where `>`, `>>` and `>>>` are pre-defined.**

**[10:28](#msg5f2543d703d73b60ee5cbbcf)In view of the above I have simplified the description of in the spec document. I suspect this simplification is the result of the new fast lexer, or was it always so?.**

**endo64**

**[11:17](#msg5f254f5303d73b60ee5cd303)There was a discussion about it recently, they are made valid with recent commits I think.**

**hiiamboris**

**[19:23](#msg5f25c1186334d26a7e6ac68e)what about `><`? allowed?**

****Sunday 2nd August, 2020****

**meijeru**

**[08:13](#msg5f2675aa36563560f2ba3c61)It is not, currently. `load "><" ==> [> <]` (two words).**

**GiuseppeChillemi**

**[09:01](#msg5f2680e736563560f2ba540e)We have `/local aword` on function specs for local words, why not having `/myname mycallname` to get the current function call name or `none` if anonymous?**

**endo64**

**[09:06](#msg5f26821da2be90499087de6e)Functions have no name, there can be many words point to same function.**

**rebolek**

**[09:07](#msg5f26825010aa4562550fa967)so it would be always `none` :)**

**[09:08](#msg5f2682988d82e66252fd3a5b)@GiuseppeChillemi however, you can write your own functor which would do that. I am actually using something very similar in my logging framework, so functions log with some name.**

**GiuseppeChillemi**

**[09:14](#msg5f268407a2be90499087e2f5)Yes, in fact I am talking about the call name: I mean the name used to invoke the function if any. While there could be many words pointing to a function, if you use a name to access it you have one. I have meant this for 'callname'.**

**[09:19](#msg5f26851b86ad126839e1c7a5)I suppose the interpreter should have it somewhere and could make it available if you ask for it with `/myname` or `callname` to be more precise.**

**rebolek**

**[09:20](#msg5f268544477381102337c04d)The function doesn't know under which name it was invoked (it doesn't make any sense in Redbol world, but whatever) however, you can make the function think it has some name which th function and you would understand.**

**[09:22](#msg5f2685e610aa4562550fb059)let's say you write your own functor that would accept `/myname foo` in the header and would interpret it somehow like this:**  
**`>> foo: gcfunc [/myname foo][print "hello world"] == func [][myname: 'foo print "hello world"]`**

**GiuseppeChillemi**

**[09:39](#msg5f2689cab9bc40357bb0e80e)Boleslav, I actually have an use that makes sense: I want to know the context of the callword without passing it as argument. And yes, your logging framework is another good example.**

**hiiamboris**

**[18:43](#msg5f27096e6334d26a7e6dbc94)I think access to Red call stack (including words/paths) will be provided later down the road.**

**[18:45](#msg5f2709c714c413356f50848e)You can still call any function anonymously with `do` or `reduce`, but it may have uses, I agree.**

**9214**

**[20:09](#msg5f271d5cb9bc40357bb25be8)\[Meanwhile](https://i1.wp.com/www.twinpeaksblog.com/wp-content/uploads/2020/06/04\_TPB\_TPS6\_June10\_Shilat\_2022\_Meanwhile2.jpg).**  
**`Red [Note: "Compile in release mode."] name?: routine [/local frame sym root?][ frame: stack/ctop - 3 ; caller <body> name? <body> root?: frame < stack/cbottom unless root? [sym: symbol/get frame/header >> 8 and FFFFh] probe [ "My name is: " either root? ["Red programming language"][ as c-string! (as series! sym/cache/value) + 1 ] ] ] foo: does [name?] bar: does [name?] baz: does [name?] foo bar baz do [name?] reduce [name?] name?`**

**GiuseppeChillemi**

**[21:02](#msg5f2729e586ad126839e3623f)Thank you.**

****Monday 3th August, 2020****

**9214**

**[01:32](#msg5f276914a2be9049908a06bd)**  
**`text Red [ Date: 3-Aug-2020 Note: "Compile in release mode." ] name?: routine [/local frame name body?][ frame: stack/ctop until [ body?: frame/header and stack/FLAG_IN_FUNC <> 0 frame: frame - 1 if body? [ name: word/push* frame/header >> 8 and FFFFh SET_RETURN(name) exit ] frame = stack/cbottom ] SET_RETURN(none-value) ] foo: does [print ["My name is" name?]] foo probe name?`**

**endo64**

**[07:59](#msg5f27c3f014c413356f522a97)A great R/S lesson :) Thanks @9214**

**[10:46](#msg5f27eb23b6f7406a740556e3)I've created a wiki page for Red/System HowTo's: https://github.com/red/red/wiki/%5BHOWTO%5D-Red-System**  
**Added the above function.**

**9214**

**[12:27](#msg5f2802b10ff358499bcff046)@endo64 :+1: we have another page for \[Red/System related notes](https://github.com/red/red/wiki/%5BNOTES%5D-Red-System-Notes) though. Technically it's less about R/S and more about the interaction with runtime library.**

**toomasv**

**[13:04](#msg5f280b7014c413356f52e49b)New blog article \[A New Fast and Flexible Lexer](https://www.red-lang.org/2020/08/a-new-fast-and-flexible-lexer.html) is out.**

**vazub\_gitlab**

**[13:25](#msg5f28104f8d82e662520104c5)Wow, this is huge! Well done, team! And thanks for illuminating read as well - this is really good stuff!**

**theSherwood**

**[14:57](#msg5f2825c7b9bc40357bb4da8f)Amazing work! And the article is really good, too.**

**endo64**

**[15:21](#msg5f282b9386ad126839e5d012)@9214 I saw that page but it looks more like notes about Red/System itself (design notes, known issues, etc.), so I created a new how-to page and will try to collect more complete functions &amp; solutions that use R/S.**

**9214**

**[15:41](#msg5f28302647738110233bd1ae)@endo64 another very common question is how to convert `c-string!` to `red-string!` and vice versa. I think you can copy-paste an example from \[here](https://github.com/red/red/wiki/%5BDOC%5D-Guru-Meditations#convert-c-string-to-red-string).**

**greggirwin**

**[17:35](#msg5f284adb03d73b60ee63fdf0)Great explanations and examples @9214.**

**endo64**

**[18:02](#msg5f28513536563560f2bedd39)Thanks @9214 , added.**

**[18:17](#msg5f2854b686ad126839e64f06)What does `[open close]` on this script: https://github.com/red/code/blob/master/Scripts/lexer/flatten.red#L23**  
**How does it used by the trace function?**

**planetsizecpu**

**[18:18](#msg5f2854fa47738110233c3a1f)Great article and instructive**

**toomasv**

**[18:20](#msg5f2855896334d26a7e71097b)@endo64 tracing is restricted to those events only which are listed in brackets.**

**endo64**

**[18:22](#msg5f2855d261a831684635c2a5)I understand that, but how that "flags" read by the trace function? Examining the source of the function?**

**[18:27](#msg5f285721b9bc40357bb56613)Are they used like function attributes as in R2/R3 which currently not supported by Red? http://www.rebol.com/r3/docs/concepts/funcs-attributes.html**

**toomasv**

**[18:32](#msg5f28584236563560f2bef246)Someone more knowledgeable than me is needed :flushed:**

**9214**

**[18:34](#msg5f2858ceb9bc40357bb56b0c)@endo64 yes, lexer uses a special \[decoder](https://github.com/red/red/blob/master/runtime/lexer.reds#L323) to analyze callback's body.**

**endo64**

**[18:38](#msg5f2859b936563560f2bef5c8)Cool, why the body and not the spec? Just curios 🤔**

**[18:41](#msg5f285a5096bd3446a7cf3d1c)Ah it would require to change handling of func's specs. More work.**

**I just thought it is already supported by the lexer:**

**`>> f: func [[open close]] [] == func [[open close]][] >> spec-of :f == [[open close]]`**

**[18:41](#msg5f285a6ba2be9049908c7bdc)But it is not if there are arguments:**  
**`>> f: func [arg1 [x]] [] *** Script Error: x has no value`**

**9214**

**[18:43](#msg5f285ac28d82e6625201de1c)That's a good question. Perhaps to not conflict with eventual support for function attributes, perhaps it was done with flexibility in mind: you can modify the list of events after-the-fact if its in function's body, but not in spec (changing spec has no effect on functions currently).**

**[18:43](#msg5f285aeca0bdc3101d4f643d)&gt; But it is not if there are arguments**

**In this case `[x]` is assumed to be a typeset, and `x` a datatype specification.**

**endo64**

**[18:49](#msg5f285c40b9bc40357bb577ae)Ah right..**

**Here is a function that cannot be called :)**  
**`test: 'test f: func [arg1 [test]] [] ; == func [arg1 [test]][] f 4 ; *** Script Error: f does not allow integer for its arg1 argument f "x" ; *** Script Error: f does not allow string for its arg1 argument`**

**9214**

**[19:17](#msg5f2862be10aa4562551458b7)@endo64 https://github.com/red/red/issues/4541.**

****Tuesday 4th August, 2020****

**ocket8888**

**[05:59](#msg5f28f9398d82e6625203720e)hey, is there any way to open raw TCP connections with Red? Obviously reading URLs is easy, but for a code golf challenge I need to read HTTP-served HTML documents using only TCP-level functionality; `read url!` is forbidden**

**[06:00](#msg5f28f96647738110233dddd5)I think I got the HTML parsing working okay**

**[06:05](#msg5f28fa8c0ff358499bd2a285)(`parse i[any[thrucopy p to(print p)]]` - I only gotta print the contents of paragraphs)**

**greggirwin**

**[06:06](#msg5f28facca0bdc3101d50fa2a)@ocket8888 ports are coming in 0.7.0.**

**[06:06](#msg5f28faec86ad126839e800a0)Some parsing tasks are \*really* easy in Red. :+1:**

**ocket8888**

**[06:07](#msg5f28fb19a0bdc3101d50fac1)does that mean they're only planned, currently, or that I can get them from a master build atm?**

**greggirwin**

**[06:13](#msg5f28fc6e96bd3446a7d0d34e)They are not in master, and their high level interface is in the design stage.**

**ocket8888**

**[06:14](#msg5f28fcb603d73b60ee65bc6c)dang. Sounds like no golfing for me.**

**greggirwin**

**[06:14](#msg5f28fcc46334d26a7e72a1c5)Some days you win, some days you lose. :^)**

**ocket8888**

**[06:30](#msg5f29009003d73b60ee65c64f)well, I guess I'll just save what I have - which assumes that `port!` objects can be constructed from strings like `to-port "host:80"` and supports `read` and `write` for TCP streaming operations - and check back in whenever 0.7.0 drops**

**greggirwin**

**[06:33](#msg5f29014ab6f7406a74083e79)Not likely that strings will be used, but URLs will. e.g., `tcp://127.0.0.1:80`**

**ocket8888**

**[06:34](#msg5f29018096bd3446a7d0e1ae)yeah, I suppose without protocol schemes you'd need refinements like `read/udp` and `write/udp` specific to `port!`s. Which isn't great.**

**greggirwin**

**[06:35](#msg5f2901b4b6f7406a74083fe0)And that approach wouldn't allow new, user-defined schemes.**

**ocket8888**

**[06:37](#msg5f29022f03d73b60ee65cb84)yeah, that too**  
**Will the new "ports" thing be transport-layer only? What about internet-layer things like ICMP? Not really interested in constructing my own IP packets, but I could see a use for ICMP.**

**greggirwin**

**[06:39](#msg5f2902aeb6f7406a74084258)Ports are simply a mechanism. e.g. https://www.red-lang.org/2019/07/gpio-port-for-raspberry-pi.html**

**R2 had encryption ports, and Red could do that too.**

**[06:40](#msg5f2902eab9bc40357bb71981)The GPIO experiment isn't using a real port of course.**

**[06:43](#msg5f290393b6f7406a7408441f)Rather, it's a special implementation for that example, not the upcoming `port!` datatype.**

**ocket8888**

**[06:44](#msg5f2903d60ff358499bd2bd97)ah, I see.**  
**Then I have two questions left: can I set/manage cookies in Red? Like if I were to make a UI backed by a REST server somewhere that uses cookies for authentication, how do I pass those cookies in subsequent requests?**  
**and**  
**Is there an `#include`-like system for Red, so that I can write code across multiple files?**

**endo64**

**[09:01](#msg5f2923f814c413356f55cc01)You can use `#include` in your Red scripts, it simply `do` the given file when interpreted, and includes the file in compiled mode.**

**[09:03](#msg5f29245f96bd3446a7d14454)For cookies you can use @rebolek 's `http-tools` https://github.com/rebolek/red-tools/blob/master/http-tools.red**

**TimeSlip**

**[18:22](#msg5f29a760107f3a0efaab3303)@toomasv Thanks for the heads up. It's like Christmas for me!**

****Wednesday 5th August, 2020****

**vazub\_gitlab**

**[19:25](#msg5f2b07c585494a652317d530)@rebolek @9214 I fixed musl :) #4605**

**9214**

**[19:31](#msg5f2b090583a82b0f05a1b533)@vazub\_gitlab :muscle: (muscle → musl). I bet that will make Bolek very happy. Thanks for digging into it!**

**[19:32](#msg5f2b0949d0282f03367e5a03)@x8x :point\_up: I think it's time to create a wiki page with a list of containerized options for Red. IIRC you have something, I think @rcqls also has, and now @vazub\_gitlab also.**

****Thursday 6th August, 2020****

**rebolek**

**[09:29](#msg5f2bcd6785494a652319cfbb)@vazub\_gitlab wonderful! Once ARM backend is fixed I am going to test it on OpenWRT.**

**vazub\_gitlab**

**[09:49](#msg5f2bd21d71c83e6f0fc0bafb)@rebolek, I can not guarantee that it would work on ARM, this is targeting x86 specifically :)**

**[09:53](#msg5f2bd325107f3a0efab0ee71)With this line `/lib/ld-musl-$ARCH.so.1`. So in order to support it on ARM, there is a need for another target to be added**

**[09:57](#msg5f2bd3ed107f3a0efab0eff1)However, once ARM is working, adding such a target should not pose any additional difficulties.**

**rebolek**

**[10:19](#msg5f2bd92085494a652319ed34)I have the ARM target added locally, I can make new PR once I have it tested.**

****Friday 7th August, 2020****

**kidd**

**[20:12](#msg5f2db59ffe39ca5d658998f3)Hi there, I'm coming from "the HN thread", @9214 thanks for the answer and pointers. I'll try to stick around and lurk for some time while I get more familiar with red**

**9214**

**[20:16](#msg5f2db6a765e829425e6b590c)Hey @kidd, welcome to the pack! To get the ball rolling, grab the \[automated build](https://www.red-lang.org/p/download.html), and take a peek at \[FAQ](https://github.com/red/red/wiki/Beginner's-FAQ) with community-provided \[learning resources](https://github.com/red/red/wiki/%5BLINKS%5D-Learning-resources).**

**kidd**

**[20:24](#msg5f2db87888719865d9478e42)Thanks Vladimir! I tried red some time ago and was absolutely amazed at the code size and malleability on one hand, and the everything-in-1mb, and thought it was some kind of black magic, really. And "I come" from Lisp and all that stuff, so it's not that I've only seen Java, but wow! Happy to be around learning from everyone.**

**9214**

**[20:38](#msg5f2dbbb3d4bc1a71bc872106)@kidd since you know Lisp, there's a \[Racket vs. Red](https://www.reddit.com/r/redlang/comments/aebxct/contrast\_red\_with\_racket/) thread that you might find interesting.**

**Rebol embodies the spirit of Lisp in terms of malleability that you've mentioned, but implements in a totally different spirit: e.g. Lisp historically relies on powerful macro facilities, whereas in Red the same can be achieved with regular functions; the majority of Lisps AFAIK use lexical scoping, some rely on dynamic scoping, but Red takes an approach that resembles \[f-expressions](https://en.wikipedia.org/wiki/Fexpr), like in \[Kernel Scheme](https://web.cs.wpi.edu/~jshutt/kernel.html).**

**Furthermore, Red's preprocessor was inspired by \[Shen](http://shenlanguage.org/)'s pattern-matching macros — as you might guess, it's implemented in Parse, which means that you can whip up a similar thing yourself, targeted specifically at your needs.**

**kidd**

**[20:41](#msg5f2dbc67811d3571b3b1c0b1)nice! yep, most lisps use lexical scoping nowadays. even emacs lisp got lexical scoping in recent years and are trying to move elisp code to use it and "deprecate" the dynamic scoping. Thanks a lot for the pointers! that'll give me some stuff to chew on this weekend**

**[20:41](#msg5f2dbc76dca038052a54d13c)shen is indeed another rare beast :)**

****Sunday 9th August, 2020****

**RayMPerry**

**[14:58](#msg5f300efd733c00338f000e52)Hi. I'm evaluating Red again and I'm trying to make a zip operator. The hope is that I can do something akin to this `[1 2] Z [3 4] Z [5 6]` and get `[[1 3 5] [2 4 6]]`. I was wondering how to signify that a function takes any number of arguments of a certain type. Does Red have an easy way to express this?**

**9214**

**[15:09](#msg5f3011affe39ca5d658f2d60)Hey @RayMPerry! in your example `Z` is an operator, so it always takes 2 arguments. All functions in Red have fixed arity and optional typing; usually when you want variable-arity you pass a block of values (like you do in your example).**

**RayMPerry**

**[15:13](#msg5f30128ee20413052e778e94)Ah, that makes sense. Should I be worried about early evaluation? So, if I did something like what I had above, would I end up with `[[[1 3] 5] [[2 4] 6]]` and if so, what is a good way to flatten blocks?**

**[15:13](#msg5f3012b19b76045d5b8a755a)At least, I \*think* that's a possibility... :thought\_balloon:**

**9214**

**[15:25](#msg5f30155ea4768b685681b11a)Indeed, if you do**  
**`z: make op! func [ x [block!] y [block!] ][ collect [forall x [keep/only reduce [x/1 pick y index? x]]] ]`**  
**then you end up with**  
**`>> [1 2] z [3 4] z [5 6] == [[[1 3] 5] [[2 4] 6]]`**  
**But if you do**  
**`z: make op! func [ x [block!] y [block!] ][ collect [forall x [keep/only append to block! x/1 pick y index? x]] ]`**  
**then**  
**`>> [1 2] z [3 4] z [5 6] == [[1 3 5] [2 4 6]]`**  
**but**  
**`>> [(1) (2)] z [(3) (4)] == [[1 3] [2 4]] ; not [[(1) (3)] [(2) (4)]]`**

**RayMPerry**

**[15:27](#msg5f3015d19231d665df67ad9d)That's wild**

**[15:27](#msg5f3015eab103e45c830761d9)Okay, lemme see if I can break this down**

**9214**

**[15:29](#msg5f301674d28b99685e520540)The rub is that in the 2nd example you can't distinguish between element as a list and element as a result of previous `z`. In the former case you want element to stay as-is, but in the latter you want to use it as a container to append to.**

**RayMPerry**

**[15:32](#msg5f301729e20413052e77998c)Okay, that tracks. So, are you allowed to use words from any of the dialects in Red? I thought `collect` and `keep` were `parse` words**

**[15:35](#msg5f3017a465e829425e70f9e3)Or is there no association of dialect to word like that?**

**9214**

**[15:37](#msg5f30183be20413052e779d9e)@RayMPerry `collect` and `keep` are merely symbols that each dialect can interpret in whatever way it wants. In pure Red, for example, `collect` is a function that recognized `keep` as a "keyword" (like in an anaphoric macro, sort-of). Parse has `collect` too, and has the same idea behind it (to collect what you keep), but it's not related to the above-mentioned `collect` at all. You can say that they are the same in spirit, but not in body.**

**RayMPerry**

**[15:39](#msg5f3018a0811d3571b3b75d44)Got it.**

**9214**

**[15:41](#msg5f30193a51bb7d3380ddc2bd)Another example is `to`: in Red it's a kitchen sink for type conversion, in Parse it's "match until that given rule". So:**  
**`>> block: [to string! "string"] == [to string! "string"] >> do block == "string" >> parse ["string"] block == true`**  
**Each evaluator (`do` and `parse`, respectively) interprets the same block differently.**

**RayMPerry**

**[15:42](#msg5f301972fe39ca5d658f3ef3)That's pretty cool, actually.**

**[15:43](#msg5f30199c9b76045d5b8a83e0)There is no inherent value on each symbol outside of the literals.**

**[15:43](#msg5f3019b54c89605c7f85a940)Which makes building DSLs much easier, I'd imagine.**

**9214**

**[15:44](#msg5f3019dad4bc1a71bc8cb203)Precisely!**

**RayMPerry**

**[15:46](#msg5f301a3e88719865d94d481f)I wonder how far you could take this. Now, I've heard about this `Red/System` thing. Surely, the same freedom don't apply 1:1 there, does it?**

**[15:46](#msg5f301a5551bb7d3380ddc595)That would be a game-changer, regarding systems programming.**

**9214**

**[15:53](#msg5f301bfc65e829425e710520)@RayMPerry Red/System is a C-level dialect without any metaprogramming facilities if that's what you mean. But it shares the data format with Red by a virtue of homoiconicity, so you can e.g. seamlessly generate Red/System from Red. Take a look at `as-ipv4` for example, it creates an IPv4 `tuple!` our of 4 members.**  
**`>> ?? as-ipv4 as-ipv4: routine ["Combine a, b, c and d values into a tuple" a [integer!] b [integer!] c [integer!] d [integer!] ][ err: case [ a < 0 [a] b < 0 [b] c < 0 [c] d < 0 [d] true [0] ] if err <> 0 [fire [TO_ERROR (script invalid-arg) integer/push err]] arr1: (d << 24) or (c << 16) or (b << 8) or a stack/set-last as red-value! tuple/push 4 arr1 0 0 ]`**  
**The spec is in Red (or rather in "spec dialect" of Red), the body is in Red/System.**

**[15:56](#msg5f301caa88719865d94d4de7)Current bootstrapping compiler, written in Rebol, exploits that: all what it does is emitting data that looks like Red/System code, but can be manipulated by Rebol because it's 90% compatible with Red :wink: e.g. `stack/set-last` is a call to a low-level function that sets the bottom of the stack frame to the final result, but it's also a `path!`.**  
**`>> type? 'stack/set-last == path!`**

**RayMPerry**

**[16:01](#msg5f301dd951bb7d3380ddd0f7)Perhaps I've been looking at the wrong ecosystem this whole time. I've been struggling for years to find a go-to language for non-$$$ work. There are a lot of cool things happening here.**

**[16:02](#msg5f301e2fa4768b685681c7ed)For context on my programming tastes, it was a toss-up between D, Nim, Raku, and Racket.**

**[16:03](#msg5f301e5179da21426f23b2ce)But now that I'm starting to understand this better, I'm very interested in REBOL and Red.**

**9214**

**[16:04](#msg5f301e944c89605c7f85b416)It's definitely worth to stick around and see if it clicks with you! Bear in mind though that Red is in active development and is not ready for production. This is a great opportunity to get involved and to contribute though.**

**RayMPerry**

**[16:06](#msg5f301eed65e829425e710d72)True. Maybe in a few months, I can try contributing. I'm nowhere near fluent with the language and I'm sure there are some concepts I need to grok before writing idiomatic code**

**9214**

**[16:07](#msg5f301f4e4c89605c7f85b661)Red/System is more humble and simple language than D or Nim, at least for now, and Red obviously doesn't live up to the Lispy coolness of Racket. So it's a grey (or maybe iridescent?) zone somewhere in-between.**

**RayMPerry**

**[16:18](#msg5f3021ccdca038052a5a7212)Let's say I make a prototype and then I want to scale that out into a larger program. If Red isn't ready for production, would a safe choice be REBOL instead? If so, 2 or 3?**

**9214**

**[16:22](#msg5f3022cbd4bc1a71bc8cc898)@RayMPerry I'd say if Red isn't ready for production, then Rebol2 with Rebol3 aren't ready either; their development stopped since a long while. It ultimately depends on what you have in mind.**

**RayMPerry**

**[16:26](#msg5f3023b865e829425e7118e9)Ah. Nothing too crazy. I was thinking about using Red for workflow augmentation and possibly a web server. I need an expressive language when I want to do things like read a CSV or do text processing/data munging or make a small CLI tool. It would be cool to also push that language past what it normally does but I know I'm not there yet.**

**[16:26](#msg5f3023c8d4bc1a71bc8ccafd)Web server would not be high-traffic either.**

**9214**

**[16:31](#msg5f3024ea811d3571b3b77d65)Workflow augmentation sounds doable, web server would require ports and I/O which are not quite here yet. Red will likely offer its own web server out-of-the-box, based on \[Cheyenne](https://www.cheyenne-server.org/). Consider to look into small-scale data processing and munging, since that's where Red shines the most.**

**RayMPerry**

**[16:35](#msg5f3025b8dca038052a5a7df3)Understood. Thanks for the pointers and advice. I appreciate it.**

**9214**

**[16:36](#msg5f3025fa733c00338f004772)You're welcome! Have fun :smiley\_cat:**

**RayMPerry**

**[22:56](#msg5f307f3265e829425e71efd2)Does Red load the entire file into memory when you use `read/lines` and similar things?**

**9214**

**[23:09](#msg5f30823365e829425e71f6ec)@RayMPerry for now, yes. With ports, you'll be able to read them in streaming mode.**

**RayMPerry**

**[23:10](#msg5f30824888719865d94e30f2)Got it.**

****Monday 10th August, 2020****

**greggirwin**

**[01:22](#msg5f30a13d4c89605c7f86e496)Good chat! My take on the R/S question was what you can do with dialects. @kidd the thing to note there is that Red/System \*is* a Red dialect.**

****Friday 14th August, 2020****

**theSherwood**

**[07:38](#msg5f363f64a1190a2e95efda62)For fun, I put together a \[function](https://gist.github.com/theSherwood/e2e680e13d86bdd4dd2842b2af449f73) for Python-esque series comprehensions so you can do stuff like this:**

**`>> a: [1 2 3 4 5 6 7 8 9 10] == [1 2 3 4 5 6 7 8 9 10] >> produce [i * 2 for i in a if even? i] == [4 8 12 16 20]`**

**endo64**

**[07:56](#msg5f36439f60892e0c696ef511)Nice function @theSherwood 👏**

**theSherwood**

**[08:14](#msg5f3647d3a1190a2e95efee9a)Thanks! I'm amazed at how little code that took. That said, If anyone has any pointers as to how it could be better, I'd love to learn.**

**toomasv**

**[08:58](#msg5f36521b4d3fd87ee7d37a4e)@theSherwood Nice!**  
**(You don't need `any` before `to`)**

**theSherwood**

**[09:01](#msg5f3652ee60892e0c696f2008)@toomasv Huh. It crashes for me if I take it out. Any ideas?**

**toomasv**

**[09:03](#msg5f36535fba27767ee5ed98dc)Do you have it this way?**  
**`parse src [ copy mapping to 'for skip copy word to 'in skip copy wrapped-series to 'if skip copy filter to end ]`**  
**Works fine here.**

**theSherwood**

**[09:05](#msg5f3653df3e6ff00c28916323)Yeah. I get this error when I try to use it:**  
**`*** Script Error: foreach does not allow none for its series argument *** Where: foreach *** Stack: probe produce`**

**toomasv**

**[09:37](#msg5f365b55b7818b3998f85c67)Here's a little bit modified version. Does it work for you?**  
**`produce: func [ src [series!] /into buffer [series!] /local mapping word filter series result ][ parse src [ copy mapping to 'for skip set word skip 'in set series skip 'if copy filter to end (probe filter) ] series: get series result: either into [buffer][to type? series []] either filter compose/deep [ foreach (word) series [ if (filter) [append result (mapping)] ] ] compose/deep [ foreach (word) series [append result (mapping)] ] result ]`**

**theSherwood**

**[09:45](#msg5f365d32ba27767ee5edb475)Yep! Thanks, @toomasv . I need to get accustomed to using `compose`. That's quite a powerful tool**

**toomasv**

**[10:17](#msg5f3664d522a7e979dbde743e):+1:**

**9214**

**[12:05](#msg5f367dfda1190a2e95f074e7)\[A 'compiler' for list comprehension in Rebol](https://stackoverflow.com/questions/59706298/a-compiler-for-list-comprehension-in-rebol).**

**greggirwin**

**[16:35](#msg5f36bd3dce98da26ecc91181)@9214, make sure that becomes an article, so it's not just on SO. :+1:**

****Saturday 15th August, 2020****

**theSherwood**

**[00:25](#msg5f372b8d367ff60c32b371e4)@9214 The ability to use 2 blocks and zip them together in your implementation is really slick!**

**TheHowdy\_gitlab**

**[16:06](#msg5f3808001226fc213356c24d)Just interested: are there any ideas on a type system for Red? I'm aware of the optional type declarations in functions, but are there any thoughts on type inference, guard clauses, interfaces/mixins, dependent types, etc? Or maybe even mechanics using which one could enhance the type system with said features?**

**ALANVF**

**[16:43](#msg5f38109b4d3fd87ee7d7e91c)iirc Red has some type inference already, but I don't think that it needs things like mixins or dependent types imo. Really, I think that it just needs user-defined types (like Rebol's `utype!`)**

**9214**

**[17:00](#msg5f3814a1a1190a2e95f48209)@TheHowdy\_gitlab I don't follow, Red \[has](https://github.com/red/red/wiki/%5BDOC%5D-Type-system) a type system. Mechanics are there too: type inference makes no sense in Red (compiler does it to some extent which often causes more troubles than it's worth), fine-grained guard clauses can be done with Parse, interfaces were \[discussed](https://gitter.im/red/red?at=5f24151036563560f2b4cb06) recently, mix-ins are `bind` in disguise, dependent types were done by @rebolek as a PoC (see the linked wiki article).**

****Monday 17th August, 2020****

**TheHowdy\_gitlab**

**[07:44](#msg5f3a356ca1190a2e95f95b0e)@9214 Well yes, Red of course has a type system. What I meant are compile-time safety features. Afaik @rebolek dependent type poc is a runtime check, as well as misc. tricks with parse. They don't give you any compile time guarantee that your code is safe, but they make your program slower. Feel free to correct me**

**rebolek**

**[08:06](#msg5f3a3a93b7818b39980131a9)@TheHowdy\_gitlab I actually don't care about compile-time guarantees that much, as I usually run my code interpreted.**  
**Is it slower than the standard function? Yes, you're right. As @9214 wrote, it's a proof of concept. It can be made faster with a rewrite to R/S, but OTOH, any code with checks would be always slower than code with no checks :-)**

**9214**

**[12:46](#msg5f3a7c27aecae32e8ecb3330)&gt; They don't give you any compile time guarantee that your code is safe**

**@TheHowdy\_gitlab safe in what sense, and how do these compile-time guarantees (static) relate to the dynamic type system? Can you elaborate? Red is a high-level language, so obviously it comes with a set of memory-safety guarantees, if that's what you mean. Strong typing guarantees that you will not shoot yourself in the foot.**

**The compiler cannot guess the semantics of what you are implementing and mark it as either right or wrong. For example, if it sees that you `find 1 'foo`, it cannot go and say "Sir, what you are doing is blasphemy, please be ashamed of yourself. Good day." because at this point in run-time `find` might be a thing totally remote from the built-in action. It might not even be "code"!**

**`code: find 1 'foo ; code! data: [find 1 'foo] ; data! append [bar] code ; nope, data! do data ; nope, code after all!`**

**Generally, AOT compilation cannot handle Red 100% of the time because of how dynamic it is. Even today's bootstrap compiler understands only a tiny subset of the language, which in the future can become a dedicated dialect, e.g. Red/Strict, which can be fully statically analyzed. It won't be as powerful as Red, but most of the time it turns out that this is all that people use.**

**If you run the tests before compiling and they all pass, does that qualify as a guarantee? And if you hit the performance rock-bottom you can always swap these "slow" and custom run-time constructs for standard or optimized ones. What's missing is an easy and standardized way to do so. Speaking of performance, the compile-time of a script is a run-time of a compiler. Naturally, with compile-time guarantees you'll get slower compilation times. It's all a trade-off.**

**Consider also that "code" may not exist at compile-time (e.g. it is generated, or loaded from a file, or fetched over the wire). In such case run-time checks are the only way. And that Red is a habitat for sub-languages that can have type systems entirely different from their host, and may or may not be statically compiled.**

**TheHowdy\_gitlab**

**[13:32](#msg5f3a86d1c7637c27000da716)@9214 Red, as you just said, is a highly dynamic language where most things are hard to probably impossible to check at compile time. I understand that. But after all, I'm not the smartest person around, and my question was if someone thought of some magic way to make the compiler/interpreter more aware of what one's trying to archive.**

**[13:36](#msg5f3a87f45ccdf30c584fc2dd)Take, for example, Elixir, a dynamic homoiconic language too. If used in a serious production environment, (I guess) most people want to be sure their code works as intended, so one can use dyalizer (if I remember the name correctly) to apply some static-ish type checking to this dynamic language. In many cases, this won't work in Red, because it is too dynamic. But in simpler cases, e.g. those which can be compiled, it may help make Red more secure.**

**[13:38](#msg5f3a8868367ff60c32bb6716)Alright, I'm not sure if one can apply the term "homoiconic" to Elixir just because it has powerful macros. But you get my point.**

**9214**

**[14:16](#msg5f3a91541226fc21335ca0c8)@TheHowdy\_gitlab uhm, Elixir is not homoiconic, and never was. It does have a macro system that operates on AST though.**

**&gt; But you get my point.**

**Frankly, I don't. :smiley\_cat: Red does not require macros, and does not use any AST, intermediate representations, or virtual machines. It operates on the product of lexing (concrete syntax tree) directly. Elixir and Red are totally remote languages.**

**The fact that your code compiles in no way guarantees that it's secure (OTOH that depends on what you mean by "security") or that it "works as intended". Rebol had \[Secure dialect](http://www.rebol.com/docs/words/wsecure.html) for that, which Red plans to adapt and possibly extend. If you meant that Elixir is somehow more secure than Red, then maybe it's because of BEAM on top of which it sits, and which provides sandboxing with all the guarantees. The above-mentioned dialyzer works with both Erlang bytecode and source files, probably on the AST level. I don't know how well it performs static analysis and how useful the results are in the production environment. It does not prove the absence of type errors, but tries to find as much of them as it can: current Red compiler tries to do that too, to some extent. Dead code elimination and removal of redundant tests sounds more like optimization to me.**

**The static compiler does not have enough contextual information to magically become aware of what you will do at run-time. \[It perhaps could, but nobody is quite sure how](https://blog.plover.com/misc/half-baked.html). In the future, JIT compiler can monitor the run-time and figure out the "user profile" for example, and store useful profiling meta info inside value slots, e.g. a number of times the block was accessed or function was called. A set of such indicators can effectively form a heatmap: hottest paths then will be compiled just-in-time. One idea that we keep noodling around is to write a simple neural network that will sit on top of memory allocator and apply different garbage collecting strategies depending on the type of allocated objects and memory load.**

**I'm of an opinion that only critical sections of the code need to be statically analyzed, and in such case they can be written in a stricter, reduced dialect, which compiler can fully understand and work with. If you want a mathematical proof, then perhaps this dialect can feature a sequent calculus a-la \[Shen](https://github.com/Shen-Language/wiki/wiki/Sequent-Calculus). It can even expose what it learned about the statically analyzed piece of code at run-time, so that you can e.g. do some specific passes over it and double-check the job done. Just like dialyzer does with PLT files.**

**sq16**

**[15:28](#msg5f3aa22f5ccdf30c5850121a)When opening web page https://www.red-lang.org/p/download.html I get the error SSL\_ERROR\_RX\_RECORD\_TOO\_LONG.**  
**Any ideas?**

**theSherwood**

**[15:35](#msg5f3aa3c2aecae32e8ecbab09)@sq16 If you are talking about getting an error on the iframe on the page, I've experienced this a lot. I think it must be some network settings, though I don't understand what exactly. If I use TOR in Brave browser to make my requests invisible to my network, I don't see any errors.**

**TheHowdy\_gitlab**

**[15:55](#msg5f3aa865e8eb3939a49a3430)@9214 alright, thanks for elaborating. :thumbsup:**

**[15:56](#msg5f3aa8975ccdf30c58502625)(i meant explaining...)**

**sq16**

**[17:07](#msg5f3ab959ba27767ee5f8603c)@theSherwood It appears that MalwareBytes blocks the site static.red-lang.org because of a trojan ... After excluding this url all goes well.**

**9214**

**[17:09](#msg5f3ab9d160892e0c6979c8ed)@sq16 this is a \[false positive](https://github.com/red/red/wiki/%5BNOTE%5D-Anti-virus-false-positives).**

**GiuseppeChillemi**

**[19:43](#msg5f3adde0750a274130271839)@9214 About your discussion: words in Red can be set to anytype, but often I use to store just one or a couple of datatypes, any other value would be an error. So if I read a file with `myfile: attempt [read filename]` then `myfile` could be a string or `none` while `filename` will be only `file!`. Restricting those words to be set just to some allowed types would help making better code when flexibility could be an enemy and not a friend. In my simple view, I see that \*if we add to the context tables a list of allowed types for specific words\*, then we can easily have type checks. It seems to me too simple to have and I am certainly missing a ton of implications, could I have your opinion on this?**

**hiiamboris**

**[19:56](#msg5f3ae0edef8d4e243b44fa04)It's possible to do with a custom object template (using on-change\*)**

**greggirwin**

**[20:12](#msg5f3ae4a58b8d4f633efa6b6f)Typing is different in Red, but allows us to build other models on it as @9214 explained. The reason Red's approach is important is because of Red's focus on data. Other langs focus on variables, where Red makes values themselves the thing to think about in terms of what is allowed.**

**What we often \*don't* think about is that strict typing comes with extra costs that have to be weighed against the benefits. @9214 also talked about this. Only use it where it provides enough value. Systems like Erlang have very strong opinions which came from their target domain. This is another key aspect to consider. What is the domain, and can a single model work for all of them? I don't think so. If you want compile time checks, you can build those. If you need massive parallel support and resilience for a system like OTP, an Erlang model makes sense. It also matters if you have a small team or multiple large teams.**

**[20:12](#msg5f3ae4ba855be416a236ac4c)As with methodologies, one size does not fit all.**

**GiuseppeChillemi**

**[20:24](#msg5f3ae77b5d0f8f2440790c28)@hiiamboris could you make an example?**

**[20:28](#msg5f3ae857ef8d4e243b450e5e)@greggirwin what you think about my thought on having types associated to a word in the contex table?**

**9214**

**[20:44](#msg5f3aec2f855be416a236bcc3)@GiuseppeChillemi \[at this point I will be repeating myself](https://gitter.im/red/red?at=5f24151036563560f2b4cb06).**

**greggirwin**

**[20:50](#msg5f3aed9a855be416a236c00e)@GiuseppeChillemi Carl talked about that at one point, but it would be a deep change. ;^) I, and others I'm sure, have written functions to vet specs and impose constraints. I haven't ported mine to use `on-change*`, though. One model would be to have a parallel "spec" object or map that contains the constraints. When a word is changed in a target object, you use that spec to vet the new value.**

**GiuseppeChillemi**

**[22:46](#msg5f3b08d907c30d132a941ae7)`on-change*` is new to me. I do not know anything about it. I know about it as actor in GUIs.**

**greggirwin**

**[23:30](#msg5f3b13198b8d4f633efadc2d)There is a default handler, which you can hack easily.**  
**`typed-obj: reactor [ a: 1 b: "test" ;on-change*: func [word old new][ ; ; vet here ;] ] system/reactivity/debug?: on o: make typed-obj [] o/a: 2 o/b: "new!"`**

****Tuesday 18th August, 2020****

**theSherwood**

**[20:11](#msg5f3c360d8b8d4f633efde6d2)Are there any design documents regarding eventual concurrency in Red? Or is that still very much up in the air?**

**9214**

**[20:24](#msg5f3c391a78f4a8018011b0dc)@theSherwood only that actor model is the most likely candidate.**

**theSherwood**

**[20:32](#msg5f3c3af83dac53434016ae92)Thanks, @9214**

****Thursday 20th August, 2020****

**theSherwood**

**[03:56](#msg5f3df47f85c0f2132fdd52a2)I revisited the List Comprehension topic and using @9214 's code as a jumping-off point I added support for grabbing the index and a couple other minor tweaks. https://github.com/theSherwood/red-utils/tree/master/series The fact that Red can do this in about 30 lines of code is pretty staggering.**

**[04:00](#msg5f3df56a07c30d132a9bc5c8)I'm still growing accustomed to how much one can expect Red to do in under 100 lines of code.**

**kuklip**

**[04:18](#msg5f3df97b85c0f2132fdd5e84)**  
**`>> 2 < [10] *** Script Error: cannot compare 2 with 10 *** Where: < *** Stack:`**

**[04:19](#msg5f3df9c85d0f8f2440812328)Do I need rebol sdk (licensed) to play with this error msg?**

**endo64**

**[05:02](#msg5f3e03d65d0f8f2440813b21)No, you don't need Rebol SDK. And the error message you got is expected since you are comparing an integer with a block.**

**kuklip**

**[06:13](#msg5f3e1484ee58011680ba238a)just saw #4627. sorry did not check earlier.**

**pekr**

**[11:08](#msg5f3e599733878e7e602f6c4c)New blog article posted - https://www.red-lang.org/2020/08/redsystem-new-features.html**

**endo64**

**[11:43](#msg5f3e61c678f4a801801730a9) 👏👏**

**vazub\_gitlab**

**[12:30](#msg5f3e6cda5d0f8f2440824535)Awesome, thanks!**

**cloutiy**

**[13:21](#msg5f3e78c9ef8d4e243b4e59b2)@theSherwood Very cool!**

**pekr**

**[13:42](#msg5f3e7dce582470633b6a50c9)Yes, very inspiring, especially the section about the lock-free atomic intrinsics and future concurrency and parallelism techniques :-)**

**ALANVF**

**[14:47](#msg5f3e8d1e8b8d4f633e03e3d8):tada:**

**GiuseppeChillemi**

**[15:35](#msg5f3e9828efafab7e3a888536)The article is really terrible, despite my intuition has helped to understand the most of it, I will have to google for 90% of terms found there! :sweat: (But it will be a source of great knowledge expansion! Thanks!)**

**theSherwood**

**[16:15](#msg5f3ea1a5582470633b6ad16e)@cloutiy Thanks!**

**[16:17](#msg5f3ea22b33878e7e60304c19)As for the article, I don't know much about low-level programming. So this is somewhat over my head. But all the atomic stuff is prepping for concurrency, right? Seems to suggest that there will be some support for shared state?**

**GiuseppeChillemi**

**[16:28](#msg5f3ea4c0855be416a24079fa)Yes, over the head for mere mortals but I feel like the days when I have started reading the Amiga ROM Kernel Manual Hardware. The first month It was obscure black magic but 3 years later I have had a knowledge that only current low level GFX Card and Hardware coders have. Everything which forces you to grow is a wonderful thing. Here comes my welcome to this and other articles of such level! GREAT! Waiting for the next!**

****Friday 21st August, 2020****

**planetsizecpu**

**[07:20](#msg5f3f75a149a1df0a1298366e)Great article @TheRedTeam things are going forward, push hard!**

****Saturday 22nd August, 2020****

**rebolek**

**[06:13](#msg5f40b776765d633c54a5aada)**  
**`>> to char! #{41} == #"A"`**

**as expected, but**

**`>> to char! #{0041} == #"^@"`**

**why?**

**I know I can `trim/head` it, but I'm curious anyway.**

**endo64**

**[07:59](#msg5f40d07749a1df0a129bc3b4)It just gets the first char:**  
**`>> to char! "abcd" == #"a"`**

**[08:00](#msg5f40d0b1dfaaed4ef5006e74)Ah you mean should it consider UTF-8?**

**rebolek**

**[17:07](#msg5f4150c2ddc2d041c0bdcbe5)@endo64 that's what I expected, but getting first char makes sense also. I can get around this, so it's not a pressing issue.**

****Sunday 23th August, 2020****

**rebolek**

**[06:50](#msg5f4211c7765d633c54a8ee31)New version of https://gitlab.com/rebolek/codepage was released. Functions are now named `read-cp` and `to-cp`, still take two args - `text` (`string!` or `binary!`) and `codepage` (`word!`).**  
**Codepages are now built-it, no need to download anything. There are 11 most popular non-CJK codepages, Windows 1250-1259 and ISO 8859-1 and ISO 8859-2. If you think that your favourite codepage is missing, just let me know and I can add it.**  
**CJK codepages may be added at a later point, but I would need to get the map of chars for them first.**

**[06:52](#msg5f42122636e6f709fdf80050)I will add the codepage code to \[CASTR](https://gitlab.com/rebolek/castr/) so if the headers are set properly on the server, it will automatically decode webpages from a codepage to UTF-8 with simple `send-request`.**

**GiuseppeChillemi**

**[08:39](#msg5f422b37c3aa024ef995d7cc):clap:**

**planetsizecpu**

**[09:02](#msg5f4230b79bad075eaccf711c)Well done @rebolek 👍**

**rebolek**

**[19:14](#msg5f42c022ddc2d041c0c13c7e)thanks**

**kidd**

**[21:38](#msg5f42e1e259ac794e02bfe694)I'd like to update the nix package of red to the latest "stable" version. Now there's 0.6.3, and I got to build 0.6.4. But noticed 0.6.4 is pretty old anyway. Should I go wild and create `red-git`? Is there any release planned in the near future?**

**[21:40](#msg5f42e247ddc2d041c0c18e7b)At this stage releases don't mean much probably, but I guess it's easier to get a package accepted if it pins to a tag (distrowise)**

****Monday 24th August, 2020****

**rebolek**

**[06:17](#msg5f435b8389cf2d584b70ee8e)@kidd I would go with `red-git`.**

**[06:18](#msg5f435bb659ac794e02c0fe54)Codepages have been integrated into \[CASTR](https://gitlab.com/rebolek/castr) so `send-request` is now doing autoconversion when needed:**

**[06:18](#msg5f435bba49a1df0a12a1e1fd)**  
**`>> read http://idnes.cz *** Access Error: invalid UTF-8 encoding: #{96207320} *** Where: read *** Stack: >> do %client-tools.red == make object! [... >> r: send-request http://idnes.cz 'GET == #( code: 200 headers: #( Location: ["https://idnes.cz/" "https://www.idnes.cz/"] Server: "BigIP" Connection: ["Keep-Alive" "... >> r/headers/Content-Type == "text/html; charset=windows-1250" >> r/data == {<!doctype html>^M^/<html>^M^/<head>^M^/ ^M^/ <meta http-equiv="X-UA-Compatible" content="IE=edge">^M^/ ^M^/^M^/<script>var Unidata = ^{ "exdomena": "www.idnes.cz...`**

**endo64**

**[09:34](#msg5f4389b0a5788a3c29abc871)@rebolek Great work, there is a missing part in `gep-cp` function I think, probably it is not used: https://gitlab.com/rebolek/codepage/-/blob/master/codepage.red#L8**

**rebolek**

**[09:57](#msg5f438ef036e6f709fdfba375)@endo64 thanks for noticing, it's an oversight. `get-cp` is not used, `select-codepage` is used instead, I forgot to delete it.**

**[09:58](#msg5f438f4da5788a3c29abd5df)Fixed.**

**endo64**

**[10:06](#msg5f439140c3aa024ef99926e8)👍**

**kidd**

**[10:07](#msg5f43917659ac794e02c18dff)@rebolek ok, I'll try the `red-git` when I have some time (a simple bump of the sha didn't work OOTB). For now, there's https://github.com/NixOS/nixpkgs/pull/96161 which is something**

**rebolek**

**[10:08](#msg5f4391b3a5788a3c29abdac7)@kidd great!**

**vazub\_gitlab**

**[10:38](#msg5f439893c3aa024ef9993a38)If anyone loves NetBSD as much as I do, you are in for a treat today, because I have just finished the port :) #4639**

**pekr**

**[10:42](#msg5f43999a765d633c54ac9e47)I buy you a beer if you start to love Android and iOS too :-)**

**vazub\_gitlab**

**[10:43](#msg5f4399b848237809373c9bfb):D**

**[10:45](#msg5f439a5336e6f709fdfbc7a2)I was just scratching my own itch with this one, but who knows, maybe I'll look soon into mobile as well)**

**rebolek**

**[10:59](#msg5f439da849a1df0a12a29ca7)Go, @vazub\_gitlab , go!**

**endo64**

**[13:27](#msg5f43c03fddc2d041c0c3be9a)@vazub\_gitlab Well done!**

**GiuseppeChillemi**

**[22:30](#msg5f443f7a49a1df0a12a480ff)For those interested, there is a \*\*bounty\** for \[RED List-View component](https://gitter.im/red/red/gui-branch?at=5f443ced59ac794e02c38bb5). Anyone interested can increase the bounty amount and participate.**

****Tuesday 25th August, 2020****

**ghost~5f44e0b5d73408ce4fed1a80**

**[10:01](#msg5f44e1674823780937401422)Is the gtk backend really only 10% done as-per https://www.red-lang.org/p/roadmap.html ?**

**[10:03](#msg5f44e202d4f0f55ebbdc971c)Oh, just found https://trello.com/c/aoO1zUGr/156-gtk3-gui-backend**

**rebolek**

**[10:10](#msg5f44e37c49a1df0a12a61e18)@jsgrant certainly not, the page just hasn't been updated. GTK has been recently merged into master branch, so it's more or less done.**

**ghost~5f44e0b5d73408ce4fed1a80**

**[10:12](#msg5f44e425765d633c54b02f78)Yeah, attempting to build master now. Is there a reason why x86\_64 is ranked after CLR &amp; JVM on that page?**

**[10:31](#msg5f44e87e4823780937402558)Well, evidently I just built the tests; lol The ./hello test ran though and even though it ran in my terminal it seemed to require some gtk depends so I'm guessing things are working**

**rebolek**

**[10:37](#msg5f44ea0189cf2d584b75297c)If you are missing GTK dependencies, don't forget you need 32bit GTK libs, as Red is 32bit only yet.**

**ghost~5f44e0b5d73408ce4fed1a80**

**[10:41](#msg5f44eaf0765d633c54b03fe0)Yeah, figured that out earlier when I "dnf install gtk3\\\*" and it still was complaining at me lol**

**theSherwood**

**[21:53](#msg5f458846dfaaed4ef50c9fc7)This is likely a dumb question. But what are the advantages of Red/System over C? I'm pretty unfamiliar with both. They both strike me as similarly simple languages.**

**[21:55](#msg5f4588c8c3aa024ef99e9616)Are the advantages mostly high-level design choices or are there some nitty-gritty things that are simply more convenient in Red/System?**

**dander**

**[21:58](#msg5f4589759bad075eacd83f94)@theSherwood I think the main benefit (for Red) is that Red/System uses the same syntax as Red, so it can be manipulated from and integrated into Red sources, where you couldn't do the same with C. Probably the main downside is that we don't get to reuse the highly optimized compilers that have been developed for C.**

**theSherwood**

**[22:18](#msg5f458e22c3aa024ef99ea521)Thanks @dander ! So basically just for the sake of interoping with Red. Gotcha.**

**GiuseppeChillemi**

**[22:23](#msg5f458f46ec534f584fbfd32e)@theSherwood I have not gone deep with it but the main advantage I see is doing low level coding with an human friendly syntax like Red one.**

**theSherwood**

**[22:27](#msg5f4590674823780937420515):thumbsup:**

**9214**

**[22:28](#msg5f45909a89cf2d584b770751)@theSherwood if you don't know either of the languages, then the list of benefits will sound more like a nerdy gibberish, so, let's just say that Red/System has a more reasonable design, fewer pain points, and more flexibility (as far as low-level languages go) compared to C. The disadvantages are that R/S is a bit more limited for the time being, its compiler is less optimized than e.g. GCC, and that there's no library ecosystem and tooling around it.**

**The biggest advantage, as @dander already said, is that Red/System and Red share the same notation, so you can generate R/S code from Red as if it was a regular Red data (FYI, that's how the current Rebol compiler works, it just spits out values that in the end look like a chain of runtime calls) or evaluate Red code from Red/System.**

**kidd**

**[22:30](#msg5f4591005580fa092b230885)with the gtk branch merged into master, do I have to pass anything special to compile the gtk support? I'm building it in nixos, and I think the `red` binary is compiled without gtk support. I suspect it might be because at compile time it couldn't find the `libgtk-3.so`. But I don't know for sure.**

**9214**

**[22:34](#msg5f4591dec3aa024ef99eb079)@kidd no, no specific flags are needed. The View module is included by default (see also https://github.com/red/red/pull/4638).**

**kidd**

**[22:40](#msg5f45935b49148b41c9716e03)aha, thx!**

**theSherwood**

**[22:43](#msg5f4593ff9566774dfe3164d5)@9214 Thanks! Would you mind highlighting a couple of the main pain points in C that R/S addresses?**

**9214**

**[22:54](#msg5f4596b29bad075eacd862ca)@theSherwood off top of my head:**  
*** Mind-boggling precedence and associativity rules;**  
*** Absence of namespaces, everything is global by default;**  
*** No run-time type-checking or exception handling;**  
*** No easy way to support custom calling conventions;**  
*** No out-of-the-box support for concurrency primitives.**

**theSherwood**

**[22:59](#msg5f4597eec3aa024ef99ec1b4)Interesting. What's the argument against namespaces and in favor of global by default?**

**9214**

**[23:13](#msg5f459b04d4f0f55ebbdea478)@theSherwood can you come up with any?**

**theSherwood**

**[23:17](#msg5f459c1ec3aa024ef99eca50)The thing that comes to mind is databases, which are global in nature. It seems useful if the strategy is to concentrate data in one place to support a functional style. Is that the idea?**

**9214**

**[23:44](#msg5f45a24e36e6f709fd0166d5)@theSherwood imagine that your project is split into logical modules, each in a dedicated file. One module implements `foo` and the other one too. In C that would result in a name collision once they are included into the `main.c` or something by the preprocessor. Ditto if you compile your modules as libraries and want to link them together: they both will export the same symbol `foo`, with no way of telling which one is which. So the order in which you link the libraries will determine which `foo` your code will call.**

**You then either need to use a custom naming convention like `module_foo`, abuse C macros, reimplement OOP with structs and function pointers, or rely on dynamic loading, or modify symbol tables with external utilities, or god-knows-what-else.**

**theSherwood**

**[23:48](#msg5f45a35389cf2d584b7733d6)Hmm. Okay. But couldn't you simply refer to them prepended by their namespaces? `namespace-1::foo` and `namespace-2::foo`?**

**9214**

**[23:53](#msg5f45a47d49148b41c97197d7)@theSherwood what do you mean by that? As I said, there are no namespaces in C (well, there are actually but they don't alleviate the problem with name collisions). Your examples look like a C++ code actually.**

**theSherwood**

**[23:56](#msg5f45a51859ac794e02c751e2)That's where I pulled the syntax from; C++. I misunderstood you. I thought you were saying that C had namespaces and that that is a pain point that R/S fixes by making things global by default.**

**[23:57](#msg5f45a562a5788a3c29b1a729)I was trying to think up an argument against namespaces and having trouble. haha**

****Wednesday 26th August, 2020****

**9214**

**[00:00](#msg5f45a62649a1df0a12a84593)@theSherwood ah, OK, sorry for the confusion. I listed the pain points of C (as you asked) that Red/System addresses. \["Mind-boggling precedence and associativity rules"](https://cdecl.org/?q=int+%28\*%28\*foo%29%28void+%29%29%5B3%5D) does not sound like a boon :wink:**

**theSherwood**

**[00:01](#msg5f45a674dfaaed4ef50ce29c)You're right. For some reason the namespace one was the only one I flipped in my mind. Forget programming. I probably ought to learn to read first. ;)**

**[00:07](#msg5f45a7c549148b41c9719d79)In any case, thanks @9214 for all the good info!**

**9214**

**[00:08](#msg5f45a7ef9bad075eacd88c19)@theSherwood np, you are welcome.**

****Thursday 27th August, 2020****

**GiuseppeChillemi**

**[12:35](#msg5f47a89089cf2d584b7c8adb)There has been an \[unexpected increase](https://gitter.im/red/red/gui-branch?at=5f47a7b036e6f709fd06d4f5) in the bounty for List-View component.**

****Saturday 29th August, 2020****

**limenleap**

**[15:17](#msg5f4a717949a1df0a12b52a35)Pardon for asking a few obvious questions. I have programmed in Rebol, but not so much in Red. I have made a simple Red program that kind of works (will explain later what I mean) . It has 3 files. It was orginally written in Rebol, but as Rebol does not have support for https I moved over to Red. Hence I continued to use the .r extension. The file header is now Red \[ ] instead of Rebol\[ ]**  
**a) The first file is main.r which has a forever loop. That loop basically keeps pinging Syncthing event API (which is basically a "GET" method on the localhost server started by Syncthing) and when something happens at Syncthing, it then calls a web api on the net**  
**b) The second file (second.r) is a utility file; parsesyncxml.r which reads the Syncthing XML config file; as the APIkey for Syncthing is needed in main.r This was kept in a global variable (I know, shoddy programming but I am just getting an MVP here) Another value from the Syncthing XML (DeviceID) was also kept in a global variable**  
**c) The third file (third.r) is another utility file for doing the web api call using https ... Both second.r and third.r loads a few configuration files, which also has global vars. Those files are to be made available to the user; so that the values therein can be changed by the user (even when I compile this into an application, the cfg files should be placed outside)**

**All that works kind of well in interpreted mode. The standard Red console seems to hang but it works (I suspect, the various http and https calls are blocking calls; and does not let Windows operating system handle the GUI when the loop is going) It is not a pleasant experience, but job seems to be getting done. Since its MVP; I am going along**

**When I try to compile it; it first insisted on putting "Needs: view" i n the header. I did that. But then it cant find the two global variables. I guess thats is because those 2 global vars are implicitly created during interpretation when the following "do" calls get executed**

**do %second.r**

**do %third.r**

**Questions to you:**  
**1. How do I compile a program when there are multiple files? I tried specifying all the 3 files on the command line when calling the compiler. That did not work.**  
**2. How to NOT use "Needs: view"and just compile a console application? I dont really need any gui. This is a simple pinging utility. Let it keep print out statements on the cmd console. No problem for me**

**[15:18](#msg5f4a71bc5580fa092b2fc716)I would really appreciate some help. Thanks in advance**

**ne1uno**

**[15:57](#msg5f4a7ada765d633c54beef15)`@include f1.r` will work interpreted or compiled, `-e` will just encap so might also work for you**

**[15:58](#msg5f4a7b0f49148b41c97e737c)sorry `#include`**

**limenleap**

**[16:06](#msg5f4a7d1fdfaaed4ef5198526)Ah. THanks**

**[16:07](#msg5f4a7d4636e6f709fd0e3e00)How do I send a new line with write-io to the console?**

**9214**

**[16:08](#msg5f4a7d665580fa092b2fe4a1)@limenleap please move to \[`/help`](https://gitter.im/red/help) room.**

**limenleap**

**[16:16](#msg5f4a7f72d4f0f55ebbeb77b4)Ok. Thanks**

****Sunday 30th August, 2020****

**addos**

**[16:56](#msg5f4bda2f59ac794e02d79694)Hi, I was testing out one of the nightly red builds and noticed that it now says this, even when trying to use --cli. error while loading shared libraries: libgtk-3.so.0: cannot open shared object file: No such file or directory**

**[16:56](#msg5f4bda4449a1df0a12b8b5ed)can the binary be made to run in cli mode without needing libgtk?**

**9214**

**[16:58](#msg5f4bdaad49a1df0a12b8b6db)@addos https://github.com/red/red/pull/4638.**

**addos**

**[16:59](#msg5f4bdaea4823780937523721)interesting**

**[16:59](#msg5f4bdaefddc2d041c0d8dfb5)I thought that was already what --cli was doing**

**[16:59](#msg5f4bdaf4c3aa024ef9aebb45)or should have been doing**

**[17:00](#msg5f4bdb10d4f0f55ebbeef512)glad that someone has reported it, and hopefully it will get fixed soon**

**9214**

**[17:03](#msg5f4bdbdddfaaed4ef51cde0a)&gt; I thought that was already what --cli was doing**

**`--cli` couldn't do that because there was no GTK backend in the master branch, until recently.**

**addos**

**[17:04](#msg5f4bdc2459ac794e02d79c0b)ah**

**[17:05](#msg5f4bdc4fd4f0f55ebbeef7aa)well thank you very much for your help**

**9214**

**[17:05](#msg5f4bdc5fdfaaed4ef51cdec3)@addos you're welcome!**

**addos**

**[17:05](#msg5f4bdc7659ac794e02d79c96)you guys are doing a fantastic job, so many exciting things going on**

****Saturday 5th September, 2020****

**Palaing**

**[19:25](#msg5f53e632d4f0f55ebb0470f5)I'm desperately seeking the doc "How Red Works..." from @9214 that @endo64 had put on the wiki, which is not there anymore: https://github.com/red/red/wiki/%5BNOTES%5D-How-Red-Works---A-brief-explanation ...**

**ne1uno**

**[20:04](#msg5f53ef5d9566774dfe5796a2)https://github.com/red/red/wiki/%5BDOC%5D-How-Red-works,-a-brief-explanation renamed?**

**Palaing**

**[20:40](#msg5f53f7c949a1df0a12ceb388)@ne1uno Thanks a lot!**

****Sunday 6th September, 2020****

**endo64**

**[06:50](#msg5f54869b49148b41c9991bc6)@ne1uno Thanks. @Palaing you can use the search function on right side of the wiki page to find.**

**planetsizecpu**

**[07:56](#msg5f54964089cf2d584b9ea996)@TheRedTeam Just noticed the downloads page is not working, I get `ERR_CERT_DATE_INVALID` error**

**Palaing**

**[10:48](#msg5f54be8e36e6f709fd292de2)@endo64 Thanks. I knew there had to be a search field but missed it so far. Just found it. 😶**

****Monday 7th September, 2020****

**x8x**

**[08:43](#msg5f55f2a148237809376c89ea)@planetsizecpu Thank you! Issue should be fixed.**

**planetsizecpu**

**[15:54](#msg5f5657c048237809376db08a)Fixed! Thx**

****Tuesday 8th September, 2020****

**henrikmk**

**[13:51](#msg5f578c699bad075eac074921)Would love to have a FIND/NOT:**

**`find/not "0000000000000001" "0" ;== "1"`**

**Searching for changes in bitmaps could benefit from this.**

**rebolek**

**[13:58](#msg5f578e2349148b41c9a0ae28)**  
**`>> find-not: func [series value /local mark][parse series [any [not value skip] mark:] mark] == func [series value /local mark][parse series [any [not value skip] mark:] mark] >> find-not "0000000000000000001" "1" == "1"`**

**[13:59](#msg5f578e4236e6f709fd3067cd)Find has 11 refinements already, I'm not sure if adding another is the best way.**

**[14:00](#msg5f578e609566774dfe605922)OTOH I understand that having such a function as native would have speed benefits.**

**henrikmk**

**[14:00](#msg5f578e7d5580fa092b51cfb6)That's exactly the scenario. I often miss having it as native.**

**giesse**

**[17:08](#msg5f57ba93ddc2d041c0f81f14)**  
**`>> find "abcd" charset "abc" == "abcd" >> find "abcd" complement charset "abc" == "d"`**

**henrikmk**

**[17:16](#msg5f57bc549bad075eac07dfd0)and for image! ?**

**giesse**

**[19:04](#msg5f57d5cc5580fa092b52a968)that's a pretty weird use case to have as native :)**

**endo64**

**[20:26](#msg5f57e8fcd4f0f55ebb0e4cfb)**  
**`f: func [s v] [forall s [unless v = s/1 [break/return s]]] f "0000123" #"0" ; == "123" i: make image! 10x10 i/5: 5.6.7 f i 255.255.255 ;== make image! [10x10 #{ ; 050607FFFFFFFFF ...`**

****Wednesday 9th September, 2020****

**pekr**

**[10:37](#msg5f58b06dddc2d041c0fa9931)Watching the IO2 branch a bit. Always, when I see the `wrote` event type (since its introduction in R3), it sounds kind of weird to me. Is that a past tense of "write" word? Then why `close` is not `closed`? I know that it's probably not going to change, so just saying :-)**

**henrikmk**

**[11:21](#msg5f58bac89566774dfe637ab8)@giesse "that's a pretty weird use case to have as native :)" - My use case at the moment is searching for non-background colored pixels in bitmaps or searching for upcoming changes compared to the current pixel position. A typical image that isn't a photograph may contain lots of one background color and smaller portions of any other color. This can be useful in auto-cropping scenarios, region searching and size measurements.**

**For non-images, it can be useful when traversing sorted lists, where it makes sense to skip identical values without having to use a mezzanine to test each value for change. This could be for counting number of occurrences of a value in a sorted list or to find the number of unique values.**

**Having spent a number of hours optimizing such code, a native FIND/NOT would be an obvious optimization.**

**rebolek**

**[12:04](#msg5f58c4bfec534f584ff1f581)@pekr yes, it's past tense. I believe Carl explained it probably in R3-aplha AltME word or somewhere else. Internally, there are both `write` and `wrote` events.**

**pekr**

**[12:13](#msg5f58c703ddc2d041c0fad838)Yeah, it is just that wrote is a write, which has just been written 😀**

**giesse**

**[18:14](#msg5f591b784823780937750b96)@henrikmk image stuff calls for image specific code, IMHO. I don't think it make much sense for it to be built in. I'll bet RedCV does what you need and better. :)**  
**For blocks... `parse` is probably good enough, and if you are really trying to cut CPU cycles, you should drop to Red/System... or not use Red for that :)**

**But in any case... manually optimizing code in 2020 is so sad... machines can paint better than humans and we are still dealing with this by hand?**

**rebolek**

**[18:18](#msg5f591c5c49148b41c9a4f217)&gt; machines can paint better than humans**

**That's debatable.**

**But I agree with the rest :-)**

****Thursday 10th September, 2020****

**henrikmk**

**[01:27](#msg5f5980eb9566774dfe65b401)@giesse FIND/NOT would get rather frequent use, I think. And "use RedCV" is a non-answer. Honestly, adding a refinement to FIND vs. adding a whole 3rd party library of untested code?**

**giesse**

**[08:04](#msg5f59de0649148b41c9a6d232)@henrikmk you get RedCV one `find/not` at a time.**

**henrikmk**

**[12:15](#msg5f5a18ec9566774dfe6726bf)Flipping the discussion around, I've never used FIND/SAME and it seems to be a Red only feature. I don't know where I would use it. Why was it added? There must be frequent or critical use of it somewhere.**

**endo64**

**[12:48](#msg5f5a2090a5788a3c29e6b6f3)`find/same` is very useful when needed, I used it a few times already.**  
**`>> b: [1 2 3] c: [1 2 3] >> find/only reduce [b c] c == [[1 2 3] [1 2 3]] >> find/only/same reduce [b c] c == [[1 2 3]]`**

**rebolek**

**[17:57](#msg5f5a68f8603d0b37f422f816)`find/same` makes sense**  
**`>> find [a A b] 'A == [a A b] >> find/same [a A b] 'A == [A b]`**

**giesse**

**[19:01](#msg5f5a78225fde567ffa3bb7bc)@henrikmk I'm consistent, `/same` shouldn't be there either probably. (Worse... if you add `/not`, you'll probably need a `/not-same` or some-such as well...)**  
**The proper solution would be to be able to pass a compare function to `find`... but once again we fall into the performance trap.**

**endo64**

**[19:28](#msg5f5a7e6fa9c2c8511e88240d)@rebolek `find/case [a A b] 'A` would be better use in that case.**

****Friday 11st September, 2020****

**theSherwood**

**[18:19](#msg5f5bbfa9a9c2c8511e8b64db)Are generators on the radar as a potential datatype?**

****Tuesday 15th September, 2020****

**cloutiy**

**[13:03](#msg5f60bba94f19dd09334eb507)@theSherwood Could you share an example or two of a generator? I think many of the more experienced people here would say that whatever constructs are not out of the box can be built using what is provided out of the box. For example:**  
**`yield: function ['items] [ f: first get items set items next get items f ] data: [ 1 2 3 4 ] while [i: yield data] [print i]`**  
**I consider this a generator. There are other examples I know of. for example:**  
**`for book books [ <option value=(book/name)</option> ]`**  
**Which doesn't exist, but one can hand build to 1) Do value substitution 2) Collect the generated "stuff" as a block (or string) and have the function return that on exit. There are options, I think it all depends on your use case/vision/skill/determination.**

**theSherwood**

**[15:20](#msg5f60dbb2b468994d0d2ee5d1)@cloutiy Yeah, I could have been more specific about what I was talking about.**

**Being able to yield within loops would be nice. I’m sure that’s possible within red, but it seems like it could be quite convoluted to cover all the possible yield cases within red. Might that be easier to manage and pause execution in R/S?**

**`some-gen-func: generator [max][ yield -1 yield 0 repeat i max [ yield i ] ]`**

**The other thing I had in mind was to be able to use Red looping constructs to loop over a generator:**

**`g: some-gen-func 10 foreach item g [ print item ]`**

**cloutiy**

**[15:51](#msg5f60e2f7ce5bbc7ffdc86279)@theSherwood Regarding your second example, since the second argument `g` can be a block of data, you could simply make `some-gen-func` return a block of data , then foreach will just do its thing. For example, this already does what you want:**  
**`foreach item [ 1 2 3 4 5 6 7 8 9 10 ] [ print item ]`**  
**So in this case, it is easily achieved with something like:**  
**`numbers-upto: function [max] [ collect [repeat i max [ keep i ] ] ] ; Calling numbers-up-to returns a block containing numbers 1 to 10 foreach item numbers-upto 10 [ print item ]`**

**[15:53](#msg5f60e36e89b38d09212d23fb)I know the topic of generators is more complex than this, but just showing some examples that might already fit some of the use cases. BTW take with a grain of salt, I'm also just a beginner here.**

**theSherwood**

**[16:00](#msg5f60e501f969413294e94a73)Yes. That works well for small amounts of synchronous data. I think where generators really shine is with large amounts (or possibly infinite) data and/or asynchronous data.**

****Wednesday 16th September, 2020****

**theSherwood**

**[14:41](#msg5f62240db190f2328e78e0af)The ability to use a generator in a loop could probably just be solved by a `utype!` datatype. That would probably make more sense than having a special built-in datatype for generators.**

****Thursday 17th September, 2020****

**Oldes**

**[06:21](#msg5f630069ce5bbc7ffdcddf9b)@theSherwood I wonder why \_generator_ is so important for you? Btw.. in Rebol3 one can use `closure`, like:**  
**`>> g: closure/with [][a: a * 2.0][a: 1.0] >> loop 10 [print g] 2.0 4.0 8.0 16.0 32.0 64.0 128.0 256.0 512.0 1024.0`**  
**but I never needed it.**

**[06:27](#msg5f6301bda857200e6d66c555)One could also use \_ports_ as generators. I cannot imagine how it should work with `utype!` or built-in datatype.. I would need real life usage exaples.**

**theSherwood**

**[08:52](#msg5f6323dfea62d70e6519741c)@Oldes I don't know that generators are so important to me. But I like some of the options that they open up. I've enjoyed what lazy programming I have done in other languages and so I suspect I'd enjoy the paradigm in red too. I don't know anything about ports so I'd be curious about that.**

**My thinking with `utype!` is dependent on a few things, of course. But the `utype!` design for Rebol3 involved methods that you could create on your datatype, such as `.add`, that would be invoked by built-in functions. So the `+` `op!` would invoke the `.add` method in its operands. So you could make your `utype!` work with the `+` operator, as an example. I don't know how things work under the hood in Red, but if looping functions were to invoke a `.next` method or similar in the datatype they are called on, then with a `utype!` you could configure a `.next` method that would be called by the looping function. That way, you could define any type you wanted that could be used in a loop or what have you.**

**rebolek**

**[08:58](#msg5f63253fd993b837e06c31d4)Red has actions that act upon datatypes (basically what you describe with methods). You can get full list of available actions with**  
**`foreach word words-of system/words [if action! = type? get/any word [probe word]]`**

**[08:59](#msg5f63256a603d0b37f43994e2)Not every type support every method (for example `clear` on `word!` makes no sense).**

**[09:02](#msg5f632612a9c2c8511e9e5fa5)You can write pseudo-types right now using `on-deep-change*` function with some effort, but you are limited to modify just to actions that change content (you can't modify e.g. `pick` or `length?` behaviour in your pseudo-type).**

**Oldes**

**[09:05](#msg5f6326caf51808513b4bc6e3)I would not say that defining own `utype!` with all possible actions and types supported belongs to sort of \_lazy programming\_.**

**theSherwood**

**[09:10](#msg5f6327e9f51808513b4bc9a1)@Oldes I don't understand what you mean**

**[09:11](#msg5f63282bea62d70e65197dd9)@rebolek That is very interesting news. Do you have an example handy, by chance?**

**Oldes**

**[09:11](#msg5f632830a857200e6d67354b)I mean to define useful `utype!` would be too much work.**

**theSherwood**

**[09:11](#msg5f63284bd993b837e06c3a70)Hmm. I don't understand why that would be the case.**

**[09:12](#msg5f632872a9c2c8511e9e661b)Why would your utype! need all possible actions?**

**Oldes**

**[09:12](#msg5f632886f969413294ef24c8)I never seen any useful `utype!` even as a theoretical draft.**

**theSherwood**

**[09:13](#msg5f6328bb3651184d30f7ae90)Interesting. Is the Rebol3 design not good to your eye?**

**Oldes**

**[09:14](#msg5f6328dfce5bbc7ffdce4ebe)Also `utype!` was from time where Rebol was closed sourced and one could not create real datatype.**

**theSherwood**

**[09:14](#msg5f6329035fde567ffa51f9f7)"real datatype"?**

**Oldes**

**[09:15](#msg5f63292b4f19dd09335529ec)real -&gt; https://github.com/red/red/tree/master/runtime/datatypes**

**theSherwood**

**[09:16](#msg5f632975b468994d0d34f430)Oh, I see. But I, as a user of Red, might want to be able to create some types. Seems like I can't do that unless I change the Red source or can define one through a `utype!` or similar construct.**

**[09:18](#msg5f6329e6f51808513b4bceb7)I feel like I'm missing something here.**

**Oldes**

**[09:18](#msg5f6329f1b468994d0d34f523)I would like to see draft of your `utype!` with usage examples.**

**theSherwood**

**[09:19](#msg5f632a07df4af236f912481d)A draft for my design for how `utype!` would work under the hood?**

**[09:19](#msg5f632a28a9c2c8511e9e6a27)Or a draft for a type designed by me that I might define through `utype!`?**

**Oldes**

**[09:19](#msg5f632a3a5fde567ffa51fcbd)Draft how it would be used by ordinary lazy programmer:)**

**theSherwood**

**[09:20](#msg5f632a71f51808513b4bd110)What I had in mind was something like Clojure's `protocol` system. Or something like Rust's `trait` system.**

**[09:21](#msg5f632a825fde567ffa51fd24)Probably leaning towards Clojure's `protocol` system.**

**Oldes**

**[09:21](#msg5f632ab1ea62d70e651985e0)I think that instead of heaving `utype!` it is easier to deal with typed native handles which can be easily implemented in Red/System.**

**theSherwood**

**[09:22](#msg5f632abcea62d70e651985f7)But I don't know if that would work with Red because I don't know how red works under the hood. @rebolek indicated that it works similarly enough.**

**[09:22](#msg5f632ac2b468994d0d34f7e1)Typed native handles?**

**[09:22](#msg5f632aedb468994d0d34f86f)So, implement the type in Red/System and then have it callable (or whatever) from Red?**

**[09:23](#msg5f632b29f969413294ef2c58)Is that currently possible?**

**Oldes**

**[09:23](#msg5f632b2ab468994d0d34f90c)For example `sound` defined \[here](https://github.com/red/code/blob/master/Library/Bass/bass-test.red#L27) is a native handle.**

**theSherwood**

**[09:24](#msg5f632b69a857200e6d673eb4)So it's a type that manages the data from a .wav file?**

**Oldes**

**[09:26](#msg5f632bc8a9c2c8511e9e6e70)It's handle to internal structure which represents Bass sound object.**

**theSherwood**

**[09:26](#msg5f632bc9603d0b37f439a4c2)Hmm. I don't understand how this works. Where is the type actually defined?**

**Oldes**

**[09:27](#msg5f632bfeb190f2328e7b91d4)But that is my 3 years old experiment. Red does not have handles how I would like them.**

**theSherwood**

**[09:28](#msg5f632c53ea62d70e651989d0)Okay. I'm very curious about this. How does the `load` create and instance of the `Bass` datatype?**

**Oldes**

**[09:29](#msg5f632c7d603d0b37f439a72c)It's inside of the `Bass/do` so it is dialected.**

**theSherwood**

**[09:30](#msg5f632ca25fde567ffa52019a)Oh, I see. Interesting.**

**[09:30](#msg5f632cbfb468994d0d34fd10)What do you see as the advantages of this approach over utype!, and how would you like the handles to work, ideally?**

**Oldes**

**[09:32](#msg5f632d32a857200e6d6743b3)The main advantage is, that I can use \_Bass_ library in this case.. which would not be possible in pure Red (or Rebol) without FFI.**

**[09:33](#msg5f632d5ec1d1a53705aa7034)Also the dialect could be done in a way, that the internal implementation could be switchable.. the same commands could be send to FMOD or any other implementation.**

**theSherwood**

**[09:37](#msg5f632e553651184d30f7bbd4)Gotcha. Is there the implication that types defined this way would need a dialect for interacting with most Red built-ins? Say I had a `fraction` type defined this way. Would I need a dialect in order to use `+ 1` with my fraction type?**

**Oldes**

**[09:39](#msg5f632eb6d993b837e06c4e20)But I should also note, that my use of `handle!` datatype is currently a hack... there is nothing like a handle's type in Red... I just used unused bytes in the cell... there is no real support.. Nenad wanted `handle!` to be just an immutable integer (pointer).**

**[09:46](#msg5f633062ce5bbc7ffdce60e5)I had an idea, that one could in Red/System side register a named handle using some standard way.. with possibility to register also its destructor, which would be called one the GC would found the handle to be releasable.**

**[09:50](#msg5f63314aa9c2c8511e9e7b8c)And one could use these names to differentiate various handles... so if I used the Bass example... I could have:**  
**`>> ? sound == #[handle! BassSound]`**  
**Instead of just `handle!`**

**theSherwood**

**[09:51](#msg5f6331a1a857200e6d674e3b)That seems like it would be quite a handy thing.**

**Oldes**

**[09:54](#msg5f633272a9c2c8511e9e7e18)And of course it should be working with not yet implemented native modules... so I could `import %Bass.dll` and have it available without need to compile own Red console.**

**theSherwood**

**[09:56](#msg5f6332b5ea62d70e6519979b)What impediments are there to being able to write a datatype in the same way as `string!` and `block!` and then being able to use it from red?**

**Oldes**

**[09:58](#msg5f6333353651184d30f7c729)You may study work on `ref!` datatype: https://github.com/red/red/commits/master/runtime/datatypes/ref.reds**

**[10:01](#msg5f6333e2c1d1a53705aa821f)(the above commits are not all what must be done)**

**theSherwood**

**[10:03](#msg5f6334794f19dd09335547aa)Interesting. Thanks for the link. So, saying someone created a new datatype, like `ref!`, is there any way to use it without compiling a new Red console?**

**Oldes**

**[10:44](#msg5f633df3df4af236f9127ca3)No, you must compile it. And @9214 is author of the datatype, maybe he has notes, what else must be edited.**

**rebolek**

**[12:12](#msg5f6352cab190f2328e7bf390)@theSherwood if you are instersted how to implement pseudo-type with `on-deep-change*`, see for example my experiments with set and serted set types: https://github.com/rebolek/red-tools/blob/master/set.red**

**cloutiy**

**[12:22](#msg5f6355135fde567ffa526906)I have a question regarding the new `scan` function. I understand it scans and returns the type of the token. `scan/next` does the same but also returns the buffer at the position following the token recognized by `scan`. Maybe a silly question, but how would you get the value of what was scanned? knowing the type is good, but how would I get the value? Is it stored somewhere or would I need to manually do some calculation of the buffer index before and after then scan to extrapolate what the value was?**

**rebolek**

**[12:31](#msg5f63572ac1d1a53705aad9c0)@cloutiy**  
**do you mean something like this?**  
**`>> source: "a: 1" == "a: 1" >> scanned: scan/next source == [set-word! " 1"] >> copy/part head scanned/2 scanned/2 == "a:"`**

**cloutiy**

**[12:42](#msg5f6359c6b468994d0d3573bb)@rebolek Yes, something like that. Trying do get it to do something that scans the entire string and gives the value of each token. Your example is useful. Will play around with it to see how I can achieve what I have in mind. Thanks!**

**rebolek**

**[12:46](#msg5f635a8adf4af236f912c94d)You're welcome!**

**[12:51](#msg5f635bc3df4af236f912ccc4)**  
**`>> source: "a: 1 + 1" == "a: 1 + 1" >> until [ scanned: scan/next source mark: scanned/2 append result to scanned/1 trim copy/part source mark tail? source: mark ] == true >> result == [a: 1 + 1]`**

**cloutiy**

**[12:59](#msg5f635da0f51808513b4c5819)@rebolek lol was just going to post my solution:**  
**`source: "a: 1 b: 3 c: {hello}" until [ scanned: scan/next source token: copy/part head scanned/2 scanned/2 source: copy scanned/2 print [ scan token token ] source = "" ] set-word a: integer 1 set-word b: integer 3 set-word c: string {hello} == true`**

**rebolek**

**[13:05](#msg5f635efdce5bbc7ffdcedc7b):+1:**

**theSherwood**

**[15:17](#msg5f637e17ea62d70e651a656f)Thanks, @rebolek !**

**Oldes**

**[16:03](#msg5f6388d44f19dd09335624d7)@cloutiy**  
**`source: "a: 1 b: 3 c: {hello}" until [ set [type pos] scan/next source value: copy/part source pos print [type value] empty? source: pos ]`**  
**or**  
**`source: "a: 1 b: 3 c: {hello}" until [ set [type pos] scan/next source value: take/part source pos print [type value] empty? source ]`**

**cloutiy**

**[16:12](#msg5f638ae5ce5bbc7ffdcf5f19)@Oldes Brilliant! I forgot that with `set` one can set values to more than one word at the same time. This is much more idiomatic. Thanks!**

**Oldes**

**[16:14](#msg5f638b48a9c2c8511e9f8119)Note that the initial `source` should be trimmed at tail else you will get an error:**  
**`>> scan/next " " == [error! ""]`**

**theSherwood**

**[17:59](#msg5f63a3f85fde567ffa534c0f)@rebolek That limitation on only being able to modify actions that change content is a real gotcha. It makes any numeric datatypes a non-starter.**

**[18:00](#msg5f63a4454f19dd0933567885)Interesting approach though.**

**rebolek**

**[20:06](#msg5f63c1ad4f19dd093356cff6)@theSherwood yes, it's suitable for series types only. And the change-only ability is limiting, for sorted sets I wanted to modify `length?` so it would report just number of elements, not twice it, but :frowning: Maybe we'll get something like `on-deep-access*` later, who knows? :)**

**theSherwood**

**[20:45](#msg5f63cadac1d1a53705ac2b3a):thumbsup: That would be great! I'd really like to make a couple of numeric datatypes if that happens.**

**[20:49](#msg5f63cbd0c1d1a53705ac2ea5)I'm thinking a fraction datatype and an arbitrary size integer type and an arbitrary size and precision float type. Then one could build a library around those types that would make red well-suited to math research.**

**ALANVF**

**[21:06](#msg5f63cfc3ce5bbc7ffdd02d0b)I think that `utype!` would be a better solution tbh**

**theSherwood**

**[21:12](#msg5f63d153603d0b37f43b82f6)I tend to agree that `utype!` seems like the best solution. I think an easy R/S interface for registering types that doesn't require recompiling the console would be really nice as well.**

**[21:22](#msg5f63d38eb190f2328e7d7964)In some ways an R/S interface for registering types might align more closely with Red's design goals (as I have come to understand them in a very limited fashion). Having new types at the R/S level would allow for a lot of power to build dialects, without making new types so convenient to make that they distract from the some of the programming idioms that are common to red (as I suspect utype! might?). Of course, my understanding of this is all very limited as I'm a newcomer to Red and don't have any prior Rebol experience. So... just a thought.**

**ALANVF**

**[21:24](#msg5f63d3fb89b38d092134dc39)I just like `utype!` because it'd allow for proper type-checking in functions, and action overloading (if you'd like to call it that)**

**theSherwood**

**[21:33](#msg5f63d640ea62d70e651b6ad1):thumbsup:**

****Friday 18th September, 2020****

**cloutiy**

**[01:50](#msg5f64124b89b38d0921357810)@Oldes @rebolek**  
**`line: 1 col: 1 source: trim {a: 1 b: 4 c: "hello"} until [ set [type pos] scan/next source value: copy/part source pos if find/match value space [ col: col + (length? value) - (length? trim/head value) ] if find/match value newline [ line: line + (length? value) - (length? trim/lines value) col: 1 ] print [type value "at" rejoin [line ":" col]] col: col + (length? value) empty? source: pos ] ------ set-word a: at 1:1 integer 1 at 1:4 set-word b: at 2:1 integer 4 at 2:7 set-word c: at 3:1 string "hello" at 3:6 == true`**

****Monday 21st September, 2020****

**NjinN**

**[01:32](#msg5f680294f969413294fad08b)Hi, I am back**

**[01:32](#msg5f6802945fde567ffa5db395)i have written a interpreter whick supports a rebol-ish language. And it supports the expression like `if……elif……else……` by cache the result of previous expression**

**[01:33](#msg5f6802f7f969413294fad1b2)\[!\[微信截图\_20200921093303.png](https://files.gitter.im/5565a1d415522ed4b3e10094/0uf5/thumb/Wei-Xin-Jie-Tu\_20200921093303.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/0uf5/Wei-Xin-Jie-Tu\_20200921093303.png)**

**[01:34](#msg5f68032fb190f2328e8745ba)i am thinking about if Red will supports this expression**

**ALANVF**

**[02:43](#msg5f681339b190f2328e87654f)you could probably do that with pattern-matching macros**

**endo64**

**[06:45](#msg5f684bfcea62d70e6525e3a1)`all` and `any` looks better, any advantage on them?**

**GalenIvanov**

**[07:59](#msg5f685d5c89b38d09213f8de6)I prefer LISP-style `cond`**

**cloutiy**

**[12:16](#msg5f6899acea62d70e6526b93c)@NjinN Could it not be done with a `case` ?**  
**`case [ something = true [ ... ] something = false [ ... ] ; otherwise true [ ... ] ]`**

**guaracy**

**[14:09](#msg5f68b41ba9c2c8511eabed2f)@NjinN No elif at all and you know your expression will never return 3. But you can use something like this.**

**`i: either false [1][either true [2][3]]`**

**NjinN**

**[15:42](#msg5f68c9fd89b38d092140b9d8)@cloutiy Of course it could be done, I just talk about the style of coding，`case` need more `block`**

**[15:47](#msg5f68cb0adf4af236f9201cf1)@guaracy i just think that `if……elif……else` is more friendly for reading**

**theSherwood**

**[15:47](#msg5f68cb28c1d1a53705b816b5)Are you wanting to be able to support multiple `elif` expressions?**

**NjinN**

**[15:50](#msg5f68cbb4f969413294fccfd5)yes，and i have make it on my interpreter**

**theSherwood**

**[15:53](#msg5f68cc96b190f2328e895a7b)Seems like you could implement this without it being a core part of the language, but it would mean overwriting the native 'if**

**XANOZOID**

**[16:20](#msg5f68d2c7d993b837e07a3efb)Hello, I was trying to get the red server to connect with VSCode but it keeps restarting the connection. I installed Red with chocolatey and it's available globally - but I linked the redPath to that specific Red.exe. I also compiled the console. Is there anything else I need to do?**

**dander**

**[16:41](#msg5f68d7ae4f19dd093362e2d4)@XANOZOID I think the current VSCode plugin only works with the automated build currently. The 'last stable' build is quite old at this point. The automatic build is generally pretty stable anyway.**

**dufresnep**

**[16:43](#msg5f68d81cea62d70e65276e20)Hi! I am new here. I am using OpenSuse Tumbleweed (rolling release). I first downloaded from the web site. I rapidly discovered the GUI was not working on Linux, and after reading I understand it to be normal for 0.6.4. However I have read how to compile a new version from source code and was happy to see I was able to produce a new gui-console version from the source using Rebol 2.7.8 (I think). When I tried the gui-console I realized it was not finding gtk3 library. Doing "file gui-console" I realized it is a 32 bit executable. So I "sudo zypper install libgtk-3-0-32bit" and now I am very happy to see I am able to run gui-console, and even the two view dialect examples from the web server. But I am a bit unsure why the gui-console is 32 bit... Is there a way to request a 64 bit version?**

**theSherwood**

**[16:45](#msg5f68d8c3a857200e6d75279f)@dufresnep Welcome! There's currently no 64 bit version available.**

**XANOZOID**

**[16:48](#msg5f68d9665fde567ffa5fe00b)@dander Thanks, Dave! I didn't even see those! So chocolatey just not relevant now?**

**[16:50](#msg5f68d9dbb190f2328e8980c4)No - the automated build is 0.6.4 still. . . Maybe I'm looking in the wrong place?**

**dander**

**[16:54](#msg5f68dadca9c2c8511eac5a1a)@XANOZOID The version number hasn't changed yet. If you run `about` in the console, it will tell you when it was built. It's a bit trickier to make a chocolatey package for the automated build, since it needs to be submitted and approved for each build produced, but I suppose it could be done. I generally prefer using \[scoop](https://github.com/red/scoop-bucket) over Chocolatey for light-weight installs**

**theSherwood**

**[16:58](#msg5f68dbd1a857200e6d752f76)@NjinN**  
**`if: function [flag expr otherwise][ either flag expr otherwise ] elif: function [flag expr otherwise][ either flag [expr][otherwise] ] else: function [block][block] probe if true [1][] ; 1 probe if false [1][] ; unset probe if true [1] else [2] ; 1 probe if false [1] else [2] ; 2 probe if true [1] elif true [2][] ; 1 probe if false [1] elif true [2][] ; 2 probe if false [1] elif false [2][] ; unset probe if true [1] elif true [2] elif true [3] else [4] ; 1 probe if false [1] elif true [2] elif true [3] else [4] ; 2 probe if false [1] elif false [2] elif true [3] else [4] ; 3 probe if false [1] elif false [2] elif false [3] else [4] ; 4`**

**XANOZOID**

**[17:23](#msg5f68e1805fde567ffa5ffa2a)@dander thanks, it's working :)**

**[17:37](#msg5f68e4cbdf4af236f9206b35)hmm but running script has issues**

**[17:37](#msg5f68e4e64f19dd093363090e)the run script command gives this output**

**[17:38](#msg5f68e519603d0b37f447a9f3)**  
**`cmd /c '"C:/Users/X/Documents/tools/red.exe" --cli "c:/Users/X/Documents/projects/red/example.red"' The filename, directory name, or volume label syntax is incorrect.`**

**[17:38](#msg5f68e52ab190f2328e89a4b7)But it definitely was correct**

**[19:44](#msg5f6902a3f969413294fd72dc)How's the development progress and community of Red? Does anyone know?**

**dander**

**[20:06](#msg5f6907b95fde567ffa606ae0)@XANOZOID I'm not quite sure about the extension error. Have you run `red --cli` from the command line so that the non-gui console is compiled? For following the project, the \[blog posts](https://www.red-lang.org/) give a broad overview, and \[this site](https://progress.red-lang.org/) shows more granular things going on (which are public anyway).**

**theSherwood**

**[20:06](#msg5f6907bf3651184d30062856)Here's a good link for keeping up to date on that. https://progress.red-lang.org/**

**[20:06](#msg5f6907d3ea62d70e6527fc10)@dander beat me to it! ;)**

**XANOZOID**

**[21:37](#msg5f691d2a5efe9467b1098610)@dander Yes - it's compiled and all. I was actually referencing the wrong path in my settings, but I've fixed that and I'm still getting the same issue. I've tested running it in cli mode myself and that doesn't error out**

**[21:38](#msg5f691d47417bf140aa04d397)@theSherwood Thanks also!**

****Tuesday 22nd September, 2020****

**XANOZOID**

**[00:56](#msg5f694bcfb39cb873c0759341)@theSherwood those examples with the "if... elif..." freeze for me**

**[00:57](#msg5f694c061c5b0d210ac24673)Oh I guess I kinda understand why**

**NjinN**

**[01:06](#msg5f694e16e1dd7c1954892338)@theSherwood That’s awesome.**

**theSherwood**

**[02:31](#msg5f6961ebb39cb873c075c4b0)@XANOZOID They freeze?**

**XANOZOID**

**[02:34](#msg5f6962c61c5b0d210ac27c67)Yes - in the repl putting those exact functions in will lock my execution**

**[02:37](#msg5f696381efefe620f23edcc2)@theSherwood Meant to @ you lol**

**theSherwood**

**[02:50](#msg5f69668daaff36059b4b5095)Hmm. Strange. I can't imagine why.**

**[02:51](#msg5f6966bd5a56b467a5e08608)@XANOZOID I only ran it as a script. I didn't test it in the repl. I'll take a look.**

**XANOZOID**

**[02:52](#msg5f6966f38fe6f1196352a54a)@theSherwood - all good. Actually just tried it as a script and it worked. Reply definitely didn't like it though**

**[02:52](#msg5f6966f8b8a99f45199bf2a7)Repl\***

**[02:53](#msg5f69670ce1dd7c1954895d2f)Okay, the "Gui" based repl**

**[02:53](#msg5f6967101c5b0d210ac28678)the cli worked okay I think**

**[02:53](#msg5f69671a8fe6f1196352a590)Interesting behavior**

**[02:53](#msg5f696732efefe620f23ee449)So far I'm liking Red . . .still trying to wrap my head around some things though**

**theSherwood**

**[02:53](#msg5f696740417bf140aa058582)Ah. Okay. I just tested it in the console without issue. I've never used the GUI repl though, so I couldn't say.**

**XANOZOID**

**[02:54](#msg5f69674defefe620f23ee494)Gotcha**

**theSherwood**

**[02:56](#msg5f6967f86a6e094525ab17ce)Red is definitely an adjustment. I've only just started using it recently as well. Hopefully it will sink in for both of us. : )**

**XANOZOID**

**[02:59](#msg5f696897f41f4105e4cc6aa0)haha yes it is**

**[02:59](#msg5f6968a96e85e0058c491c8f)I noticed some blocks let me do things and some don't. It's a little confusing**

**theSherwood**

**[03:00](#msg5f6968ea6a6e094525ab1975)Some blocks let you do things and some don't? How so?**

**XANOZOID**

**[03:19](#msg5f696d426e85e0058c49281c)Notice . . .**  
**`values: [1 2 3] collect [ min: 1 foreach val values [ if val > min [keep val] ] ]`**

**[03:20](#msg5f696d695efe9467b10a453e)**  
**`red >> view [ title "Working title" dim: 600x400 size dim ] *** Script Error: VID - invalid syntax at: [600x400 size dim] *** Where: do *** Stack: view layout cause-error`**  
**(edited)**

**[03:20](#msg5f696d991c5b0d210ac293d0)I can define an arbitrary identifier inside of collect, but I can not do the same thing inside of view?**

**theSherwood**

**[03:24](#msg5f696e558fe6f1196352b53b)Ah. I'm not so familiar with the view dialect, but Red is kind of DSL driven. `collect` and `view` are different dialects. `view` is much more structured than `collect`.**

**XANOZOID**

**[03:25](#msg5f696e975a56b467a5e097f6)I need more Red experience P:**

**theSherwood**

**[03:25](#msg5f696ea9b39cb873c075dcac)I find this guide to be a pretty good starting point: http://helpin.red/Containersettings.html**

**XANOZOID**

**[03:28](#msg5f696f75f41f4105e4cc7d5a)Thanks! Looks great**

**[03:40](#msg5f697219b8a99f45199c0ae3)Ha yeah. What I came across is mentioned in what you posted. "Some pitfalls of Red learning:" point 3**

**theSherwood**

**[03:43](#msg5f6972c58fe6f1196352c21d):thumbsup:**

**endo64**

**[05:38](#msg5f698de98fe6f1196352fddd)`collect` is not a dialect, see its details by `source collect`. it is just a (very clever) function that `do` the given block with a `bind`ing trick.**

**theSherwood**

**[05:46](#msg5f698f996a6e094525ab6c06)@endo64 Okay. The binding trick it does with `keep`? What makes that distinct from a dialect?**

**[05:47](#msg5f698fd8e1dd7c195489b9ed)The fact that it doesn't use `parse`?**

**endo64**

**[05:54](#msg5f699191f41f4105e4ccc94a)The argument block you are given to `collect` is evaluated as any other regular Red code, see `do body` in the function definition. it is not parsed as a dialect, like in `view` or in `draw` function.**

**[05:55](#msg5f6991ee0b5f3873c9e56ad8)`parse` is used to find the positions the `keep` words in the block and bind it to its own context, so the `keep` word inside your block becomes (points) to local `keep` function. That is the trick.**

**[05:56](#msg5f69921ce1dd7c195489be35)it could be done without using `parse`.**

**theSherwood**

**[06:18](#msg5f6997536e85e0058c498823)I see. So something needs more parsing to be considered a dialect?**

**XANOZOID**

**[06:21](#msg5f6997f0b39cb873c0763b03)I think the idea Semseddin is explaining is that because `do body` is used inside of collect the block used is executed by Red. The body is parsed as data and the "keep" inside of the body is injected with bindings to the function's keep.**

**[06:21](#msg5f6997f48fe6f11963531350)At least that's my understanding so far.**

**[06:22](#msg5f69983ce1dd7c195489cdab)So something about the "View" "dialect" probably doesn't ever perform "do" on the block, but perhaps individual "groups". I'm really just speculating to be honest.**

**[06:27](#msg5f69993daaff36059b4bc038)Ha, I basically just rephrased Semseddin . . at least means I kinda get it xD**

**endo64**

**[06:28](#msg5f6999995a56b467a5e0f990)&gt; So something needs more parsing to be considered a dialect?**

**Not exactly, for example, words inside the block given to `view` (or `layout`), they don't have any value in the Red's (global) context, `button` or `box red 10x10` doesn't mean anything for Red interpreter. But view or layout function takes those words and values inside the block, and builds an object, generates an output or a new block that can be evaluated by Red (by `do` or other evaluators)**

**[06:29](#msg5f6999d11c5b0d210ac2f8e2)Of course Red is also a dialect of itself, that is another story :)**  
**See these links to have a more insight:**  
**http://www.rebol.com/r3/docs/concepts/parsing-dialects.html**  
**http://www.codeconscious.com/rebol/dialects.html**

**XANOZOID**

**[06:31](#msg5f699a415efe9467b10aadc9)&gt; REBlog is a prolog-dialect for REBOL**

**wowowowow. I am just learning but I really hope this language lives up to everything I hope it can**

**endo64**

**[06:33](#msg5f699aac1c5b0d210ac2fac1)Here is an meaningless example of a dialect:**  
**`>> run: function [b] [parse b [any [t: ['left | 'right | 'up | 'down ] (print ["Go" first t])]]] == func [b /local t][parse b [any [t: ['left | 'right | 'up | 'down] (print ["Go" first t])]]] >> >> run [left up down] Go left Go up Go down == true`**

**Here `[left up down]` is a dialect for `run` function.**

**[06:34](#msg5f699b0c417bf140aa05fcfd)For a meaningful example see `source math` :)**

**XANOZOID**

**[06:36](#msg5f699b798fe6f11963531bfc)That's crazy . . . Smalltalk can do similar things, but not nearly as elegantly as that. Nowhere near as natural.**

**pekr**

**[06:42](#msg5f699cede1dd7c195489d97f)Shouldn't such discussion be moved to Help or some other channel? :-)**

**endo64**

**[06:45](#msg5f699d8e6e85e0058c4999af)Ah @pekr is right, I thought we are in help room. 🤦‍♂️**

**XANOZOID**

**[06:45](#msg5f699d9c1c5b0d210ac302e5)I wish Gitter was better for finding these things! I had to change the URL to find the channel list . . .**

**rebolek**

**[18:39](#msg5f6a44ec4002c640b5dde9b2)I've added \[moustache](https://mustache.github.io) parser to \[castr](https://gitlab.com/rebolek/castr/) so now you can use Moustache templating with Red CGI or with the Hub webserver (not directly yet, it needs some kind of module system first).**

****Wednesday 23th September, 2020****

**GiuseppeChillemi**

**[21:32](#msg5f6bbf0baaff36059b515d84)REQ: Please, could you add `/only` to `replace` to support this coding pattern?**

**`>> x: [foreach %values c [print %values]] == [foreach %values c [print %values]] >> z: [a b] == [a b] >> sss: [1 5 2 6 3 7] == [1 5 2 6 3 7] >> replace/deep/all x %values z == [foreach a b sss [print a b]] ; !!! ; !!!! It should be replace/deep/all/only ; !!!! The result should be: [foreach [a b] sss [print [a b]] >>`**  
**(Note, the filetype, could be any usable type)**

**theSherwood**

**[22:43](#msg5f6bcf9c4002c640b5e2114c)@rebolek Great work! I too am looking forward to a module system. Other than ports, a module system feels like the last significant barrier to Red being production ready.**

****Thursday 24th September, 2020****

**toomasv**

**[03:20](#msg5f6c108e1c5b0d210ac97175)@GiuseppeChillemi Besides `only`, how did you get `sss` in your desired result?**

**rebolek**

**[04:33](#msg5f6c21a48fe6f1196359ca97)@toomasv I belive @GiuseppeChillemi is just missing part of code there.**

**[04:34](#msg5f6c21f08fe6f1196359cb19)@GiuseppeChillemi write a proposal here https://github.com/red/rep , IMO it's a good idea.**

**[04:37](#msg5f6c227c5b75b305ddc00697)@theSherwood thanks! By modules I actually meant just modules for the webserver, not full module system for Red. Which would be nice, of course, but is not required for this :)**

**GiuseppeChillemi**

**[05:44](#msg5f6c324f6a6e094525b22d10)@toomasv maybe it because I have just woken up, but I don't get the question**

**[05:47](#msg5f6c32ec1c5b0d210ac9bb8f)Ok I have got it! I have edited the code and replaced `C` with `SSS` to avoid printing `A B C` but I have forgotten to do this in the first lines!**

**[06:36](#msg5f6c3e505a56b467a5e7dc84)This is the correct one:**

**`>> x: [foreach %values SSS [print %values]] == [foreach %values SSS [print %values]] >> z: [a b] == [a b] >> SSS: [1 5 2 6 3 7] == [1 5 2 6 3 7] >> replace/deep/all x %values z == [foreach a b SSS [print a b]] ; !!! ; !!!! It should be replace/deep/all/only ; !!!! The result should be: [foreach [a b] SSS [print [a b]] >>`**

**toomasv**

**[09:06](#msg5f6c618c5b75b305ddc0a5c8)@GiuseppeChillemi Try \[this](https://gist.github.com/toomasv/4b4d46eb90eb2814bc79e7bb4084f04f). I haven't tested it thoroughly, please report any errors you'll find.**  
**`x: [foreach %values SSS [print %values]] z: [a b] SSS: [1 5 2 6 3 7] replace/only/deep/all x %values z ;== [foreach [a b] SSS [print [a b]]]`**

**xqlab**

**[11:16](#msg5f6c8016f41f4105e4d46b47)You can achieve that not so elegantly with**  
**`>> replace/deep/all x %values reduce [z] == [foreach [a b] SSS [print [a b]]]`**

**GiuseppeChillemi**

**[12:30](#msg5f6c9158e1dd7c1954918b35)@toomasv Thanks Toomas, I'll test it. My proposal is to make this `/only` standard in Red `Replace`.**

**[12:49](#msg5f6c95db417bf140aa0ddc19)@xqlab Yes, no so elegant but it works!**

**[20:27](#msg5f6d0128e1dd7c195492cb08)@toomasv I hate you Toomas!**

**[20:31](#msg5f6d023ab39cb873c07f3f32)In my ideas notebook I have written some notes about using parse rules to have an advanced find... Now I am looking a your code and I have discovered you have already implemented using parse rules in this `replace`!**

**[20:32](#msg5f6d02581c5b0d210acbebcc)Great, but don't do this again... bad boy!!!**

**rebolek**

**[20:34](#msg5f6d02e46a6e094525b4764f)@GiuseppeChillemi have you actually checked the `replace` source?**

**GiuseppeChillemi**

**[21:17](#msg5f6d0ced6e85e0058c529e3f)@toomasv no, just the specs! Is it something different?**

**[21:17](#msg5f6d0d05b8a99f4519a59899)Pardon.. @rebolek**

**rebolek**

**[21:18](#msg5f6d0d3db39cb873c07f5d3a)@GiuseppeChillemi `replace` has been always `parse` based :)**

**[21:20](#msg5f6d0d94e1dd7c195492ec5c)(with `/deep` refinement)**

**GiuseppeChillemi**

**[22:00](#msg5f6d16e05b75b305ddc2a7f4)Coming from Rebol, I have not looked deeply because I thought it was the same, as `replace` is not mentioned \[here](https://github.com/red/red/wiki/%5BDOC%5D-Differences-between-Red-and-Rebol) (but it should). Looking better, it I different in may ways.**

****Friday 25th September, 2020****

**toomasv**

**[03:39](#msg5f6d6656f41f4105e4d6ce41)@GiuseppeChillemi I only added little bit to the already existing code of `replace`. If `/only` will be supported officially it will probably be something similar.**

**rebolek**

**[06:18](#msg5f6d8bbab8a99f4519a6bbd7)@toomasv as @dockimbel is now on request-merging spree, it would probably be worthturnng your Gist into proper merge request, what do you think?**

**toomasv**

**[06:25](#msg5f6d8d4c4002c640b5e66737)@rebolek Yes, good idea! Have you looked at it? Do you think it is ok?**

**rebolek**

**[06:29](#msg5f6d8e2ff41f4105e4d72d3a)@toomasv I've glanced over it, you just add a new brach for every `insert` right? If you want to be fancy, maybe you can use same trick as `replace` does with `do-parse: pick [parse/case parse] case` and the `do compose` every block where `insert` is, but I'm not sure it's worth it.**

**[06:29](#msg5f6d8e4f5a56b467a5eb58d8)(if only we had `apply` ;) )**

**the-man-with-a-golden-mind**

**[06:34](#msg5f6d8f6d4002c640b5e66dc4)Hello. I am trying to find something about Red performance...benchmarks etc. Do you know something about it?**

**rebolek**

**[06:36](#msg5f6d8ffc5b75b305ddc3c88a)@the-man-with-a-golden-mind Hi! What kind of benchmarks are you interested in? Comparing Red to what languages in what area?**

**the-man-with-a-golden-mind**

**[06:37](#msg5f6d90240b5f3873c9efe627)For example Python: Number processing, arrays, lists?**

**rebolek**

**[06:39](#msg5f6d9098f41f4105e4d732cd)I see. I'm not aware of any benchamrks, do you have some links for Python? Then the benchmarks can be ported and we can do some comnparison. Anyway, Red is not optimized, so if we talk just about some math and looping, it would probably be slower.**

**toomasv**

**[07:18](#msg5f6d99c3aaff36059b560d1e)From what I have read on this topic in earlier posts, Red proper is generally comparable to other interpreted langs of similar level, but R/S is about 2-5 times slower than C due to being not optimized yet. On Red level there can also be large differences depending on how a specific function is implemented - is it compiled as just a high level sugar func or at R/S level. R/S level compiled code runs typically about two orders of magnitude faster than comparable Red level code.**

**Some relevant posts ordered by recency:**  
**:point\_up: \[ldci 2020-06-07](https://gitter.im/red/red/system?at=5edcafe8ff7a920a72390fbf)**  
**:point\_up: \[greggirwin 2020-05-23](https://gitter.im/red/red/welcome?at=5ec8e287a91f120a6cb9a09b)**  
**:point\_up: \[dockimbel 2019-05-11](https://gitter.im/red/red?at=5cd6bce75a1d435d462284f9)**  
**:point\_up: \[dockimbel 2018-03-20](https://gitter.im/red/red?at=5ab0fabfe4d1c636041e8a82)**  
**:point\_up: \[dockimbel 2017-10-17](https://gitter.im/red/red?at=59e5dcb0614889d475c58632)**  
**:point\_up: \[dockimbel 2017-04-15](https://gitter.im/red/red?at=58f23aa8ad849bcf4288adfb)**

**the-man-with-a-golden-mind**

**[07:29](#msg5f6d9c644002c640b5e69090)2.5 times slower then C ...is still amazing. Is it save?**

**toomasv**

**[07:53](#msg5f6da1f96a6e094525b5f396)I am no expert on this, so I'll let others to talk:**  
**:point\_up: \[9214 2020-08-17](https://gitter.im/red/red?at=5f3a7c27aecae32e8ecb3330)**  
**:point\_up: \[greggirwin 2019-09-25](https://gitter.im/red/red/system?at=5d8bea5986eddb6ea0d51e07)**  
**:point\_up: \[9214 2019-09-25](https://gitter.im/red/red/system?at=5d8beb5486eddb6ea0d523b5)**  
**:point\_up: \[dockimbel 2018-10-16](https://gitter.im/red/red?at=5bc52eeb1e23486b93c6ea44)**

**GiuseppeChillemi**

**[08:36](#msg5f6dac235a56b467a5eba8f2)@toomasv**  
**Why not `change` instead of `remove / insert`? It ha `/only` refinement**

**`head change/only find [a b c] 'c [x y z] == [a b [x y z]]`**

**toomasv**

**[08:46](#msg5f6dae6d1c5b0d210acda1f9)@GiuseppeChillemi I looked it over and there were several mistakes :flushed: I did also some \[changes](https://gist.github.com/toomasv/4b4d46eb90eb2814bc79e7bb4084f04f) according to @rebolek's suggestion.**

**[08:59](#msg5f6db17c4002c640b5e6d2e7)@GiuseppeChillemi Now \[changed](https://gist.github.com/toomasv/4b4d46eb90eb2814bc79e7bb4084f04f) according to your suggestion too.**

**GiuseppeChillemi**

**[09:27](#msg5f6db8030b5f3873c9f04fc7)Great, I'll test it later**

**drpsy77**

**[16:23](#msg5f6e198a5efe9467b116929e)Hi there, don't Know if I am in the right place. I want to get the selected text in an area, but in multi-lines content, the pointer x is shifted by the number of lines before the starting point of the selection. I think it's because the code that evaluates the positions also counts an escape symbol ^.**

**toomasv**

**[17:07](#msg5f6e23db5efe9467b116af05)@drpsy77 Are you using nightly builds? This problem was fixed some time ago. E.g. the following code works well with nightly builds:**  
**`pairs: clear {} tx: {one^/two^/three^/four^/five^/} beg: 1 while [t: find tx newline][ repend pairs rejoin [as-pair beg e: index? t newline] beg: e + 1 tx: next t ] tx: head tx view [title "Test selection" ar: area tx panel [origin 0x0 below button "Select" [r: f/selected ar/selected: load copy/part at f/text r/1 r/2 - r/1 + 1] f: area 60x100 pairs ]]`**  
**Select pair from right and click "Select".**

**GiuseppeChillemi**

**[19:10](#msg5f6e40c3b39cb873c0829813)So, newer builds have not the newline drift problem?**

**drpsy77**

**[22:20](#msg5f6e6d216a6e094525b828c9)Works fine with the last build ! thanks ! I was using the "last stable" version (-064) which has the bug... I like Rebol / Red very much. So "Hypercard" in the approach ! ;-)**

****Saturday 26th September, 2020****

**toomasv**

**[03:07](#msg5f6eb05d6a6e094525b8b448):+1:**

****Monday 28th September, 2020****

**greggirwin**

**[18:24](#msg5f722a650b5f3873c9fb3dd4)On the subject of what defines a dialect, it's another tricky task. "I know one when I see it." is one way, as how some people define obscenity. :^) Technically, they are embedded DSLs, which is still broad. "DSL" is used a lot outside of Red where I think it shouldn't be. When a term is hot, people want to use it.**

**It will be shades of gray no matter what. I think of a dialect as a more complete "language", and wouldn't call `collect` a dialect. It would be at the very bottom of what I call "dialected functions", which is a term I use to talk about things like `split` (in Rebol, and coming to Red), or the forthcoming `format`. Dialected functions, for me, are funcs that use their inputs in advanced ways, basing their behavior on the data.**

****Tuesday 29th September, 2020****

**XANOZOID**

**[09:47](#msg5f73029e417bf140aa1ddd20)I played around with Red/System over the weekend and made some rough bindings to Raylib. I'm pretty happy with the experience and results 😄!**

**[09:47](#msg5f73029f5a56b467a5f91704)https://i.imgur.com/mhhkwqw.gif**

**[09:49](#msg5f730337f41f4105e4e4a7fc)Will probably continue toying with this throughout the week - the Ludum Dare (# 47) game jam is in about 3 days so I'm aiming to make a small game using Red 🙂**

**9214**

**[10:02](#msg5f730639efefe620f25740a7)@XANOZOID impressive result, and the code looks very clean :+1:**

**Interesting selection of \[themes](https://ldjam.com/events/ludum-dare/47/theme/2) this year, I'd vote for "play against yourself", because IMO there's a shortage of original, non-card-based solitaire games.**

**ldci**

**[10:43](#msg5f730fd1e1dd7c1954a1d40d)@XANOZOID Congratulations.**

**planetsizecpu**

**[10:44](#msg5f731002aaff36059b63ba1b)Much encouragement for LD47 @XANOZOID we are expectant to see what you come up new!**

**GalenIvanov**

**[12:03](#msg5f7322776a6e094525c398e0)@XANOZOID Looks great, congratulations!**

**rebolek**

**[12:33](#msg5f7329ae1c5b0d210adb55fa)@XANOZOID pretty cool! :+1:**

**XANOZOID**

**[15:18](#msg5f73505d8fe6f119636c0fc6)Wow, thanks everyone!**

**[15:19](#msg5f7350745efe9467b12390af)😄**

**ALANVF**

**[16:14](#msg5f735d5defefe620f2584a83)@XANOZOID do you have the source on github somewhere?**

**XANOZOID**

**[16:22](#msg5f735f2a417bf140aa1eeee6)@ALANVF nice seeing you around man - I wasn't going to mention that unless someone asked . . . but the only reason I wasn't jumping on that gun was because I kind of worked on these bindings as a motivation for diving into Red/System. So yes I can put this on Github, but it's all very messy haha. Maybe I'll post a gist instead just for references purposes but I'd be surprised if anyone wants to do anything with this just yet 😆**

**greggirwin**

**[16:49](#msg5f7365aeaaff36059b64bd1f)@XANOZOID very cool! Thanks for posting.**

**[16:50](#msg5f7365d5b39cb873c08f3fc3)We all suffer the same "not ready for anyone else to see" problem. :^)**

**XANOZOID**

**[17:21](#msg5f736d205efe9467b123e6e2)Thanks, Gregg! And I absolutely agree that's very true hahaha**

**ALANVF**

**[17:55](#msg5f73752d6a6e094525c49907)@XANOZOID sweet! (also have I seen you on the Haxe discord or something?)**

**XANOZOID**

**[18:02](#msg5f7376ca417bf140aa1f3883)You've seen me on Haxe, Raku, and Pharo - last time (maybe first?) we spoke was on Pharo briefly 🙂**

**ALANVF**

**[19:14](#msg5f73878db39cb873c08fa687)Oh nice lmao**

****Wednesday 30th September, 2020****

**henrikmk**

**[10:37](#msg5f745fe6735ff4509f3c15af)@XANOZOID looks very interesting. I really miss a more dynamic approach to DRAW instead of endlessly composing blocks.**

**pekr**

**[12:03](#msg5f74742a7004ab397df13252)How could it be made more dynamic, while keeping a performance? Any ideas?**

**XANOZOID**

**[14:42](#msg5f74995b6557712101ac3f05)@henrikmk when you say "miss" I'm not sure what you're referring to in the past you've used. . . I'm not really sure what you're referring to either that uses several blocks either.**

**henrikmk**

**[14:46](#msg5f749a589331433de02abdd6)IMHO, there are 3 things that would be helpful in a DRAW engine. Maybe Red does them all, I don't know:**

**1. Layered draw, meaning you render layers to separate bitmaps that then go through composite for a final image. This allows you to make small changes to a single layer in a complex drawing without having to redraw everything. So that means that from the draw block, you have layer controls. A fast compositor is key.**  
**2. DRAW dialect focuses on layers, shapes, pens and pointers to coordinates, scalar values and colors. The draw block is parsed into sets of fast draw instructions just once, one set per layer.**  
**3. Separate structure (block! maybe) for the coordinates, scalar values and colors, that are accessible via conventional means, i.e.**  
**`coords/412: 50x50`. If you then have a complex drawing, you may just change one value in this block and call a SHOW, and you would get a very economical update to the drawing.**

**I've talked about binding draw blocks to objects before, but it doesn't scale well to hundreds or thousands of coordinates.**

**XANOZOID**

**[14:47](#msg5f749a7114eb5d0326902724)So sounds like you're interested in a scenegraph**

**[14:47](#msg5f749a840dbbcf3dfa49b5cf)To some extent, with some other less general stuff**

**henrikmk**

**[14:48](#msg5f749aaf7d3e8c6b2795678e)Developing complex graphing widgets led to this conclusion.**

**XANOZOID**

**[14:58](#msg5f749d311ca73a6c416b1c22)Hmm. So this is something you're running into trouble with right now? If so, I'm interested in what you've currently been doing to do those things . . . But mostly I'm interested in where the tools you've used are seeing performance hits. Hearing that there's an issue from "hundreds to thousands" I can think it might be more beneficial to let a sub-system in Red/System do most of the data-lifting and control, for starters. But also there could be some areas where optimizing calls with the GPU needs to be made. I'm not a Red expert (I hope to be eventually) or a GPU/CPU expert - but I have a high level understanding. I am curious of thinking about some approaches though - I feel like Red can do a lot of lifting. If there's generalized performance benchmarks that helps get a good feel for things. Especially for understanding what might be making "binding draw blocks to objects" slow. Is it literally just a matter of block-context magic?**

**henrikmk**

**[15:01](#msg5f749db7aa7388396e8643f8)REBOL allows binding DRAW blocks to objects, so you can say:**

**`coords: make object! [upper-left: 0x0 lower-right: 50x50 color: red] draw make image! 100x100 bind [pen color box upper-left lower-right] coords`**

**[15:03](#msg5f749e320dbbcf3dfa49c561)But the point really is that draw blocks should focus on structure rather than data. I might need a box. That's structure. How big it is, what color it is, where it is, is a separate and should be, an easily adjustable, matter, without needing to know the structure of the draw block. That's data.**

**9214**

**[15:04](#msg5f749e9af9cfbe19f92d2d01)@henrikmk binding is not specific neither to Rebol nor to Draw. Red simply forbids using words in some of the cases (see https://github.com/red/red/issues/1434).**

**henrikmk**

**[15:06](#msg5f749ee3aa7388396e8648b3)@9214 yes. it's an odd limitation.**

**XANOZOID**

**[15:12](#msg5f74a056a7389b19f0eb30f0)Still pretty hard to say where the bottleneck is here given my limited Red experience - but I'm thinking there's some nasty "gotchas" with a bind-heavy approach. My hypothesis is you may experience better overall performance with functional composition or a prototypal approach . . . but not sure for now. The declarative-ness of reusing an object's fields are sort of a thing I'd give to a more oop approach if you don't want to always have to understand the composition at the time of "drawing". Otherwise I'd for sure want to try to minimize the amount of binding necessary unless Red somehow gets around that issue cleverly already**

**[15:14](#msg5f74a0de1b444b4eafaa0d09)Ah I read what you said wrong. Didn't realize this was \_only_ Rebol and not related to Red. Or does it still apply?**

**henrikmk**

**[15:14](#msg5f74a0e9717f8e4eb5ed8c28)@XANOZOID I'm spending most of my time right now defining a technical drawing dialect, which can handle primitives and vertices and will contain a constraint system. it will be used to draw interactive graphs and allow the user to interact with pretty much arbitrary shapes. So, it means that if you want to draw a box, you make a "box primitive", which draws a box on a draw layer, draws another box on one of multiple mouse event layers, generates vertices for each corner and sides and center of the box, and then you should be able to reference any one of the vertices in other primitives to constrain them to the box. The challenge has been mostly to figure out how to wire a draw block to a set of values without using bindings.**

**[15:15](#msg5f74a112fcce3e6c18e2d631)@XANOZOID yes, the performance bottleneck are related to REBOL, but I'm thinking there are similar ones in Red. I expect PARSE to be not so fast, but compositing to be faster.**

**XANOZOID**

**[15:16](#msg5f74a14faa7388396e86509a)When you use PARSE though you can do an in-place conversion that only happens once, though, right? I wish I had more time, I'm always interested in the technical challenges of a language :)**

**henrikmk**

**[15:16](#msg5f74a152f9cfbe19f92d390b)in any case, it's always interesting to find ways to minimize drawing updates.**

**XANOZOID**

**[15:16](#msg5f74a1649331433de02ada40)I got work though . . . and should have started about 30 minutes ago xD**

**9214**

**[15:17](#msg5f74a192d5337c048e023294)@XANOZOID binding is dirt cheap. On the other hand, objects, esp. reactive ones and/or with many unique symbols, are quite memory-intensive.**

**XANOZOID**

**[15:19](#msg5f74a207a5ac94398061c95d)@9214 ooh - thanks. That's good to know! So by objects we're not talking about blocks, right? Anyhow . . . do we have any libs for creating benchmarks? I'm totally interested in making some/seeing some in my spare time 🙂**

**[15:19](#msg5f74a20f929dd3764d7b9910)For now though - have a good day everyone!**

**henrikmk**

**[15:20](#msg5f74a23ba7389b19f0eb3738)&gt; My hypothesis is you may experience better overall performance with functional composition or a prototypal approach . . .**

**Whatever method is used, there is a process of creating a series of draw instructions from some kind of command sequence, either with functions or using PARSE, but I'm not sure if Red has a low level draw instruction buffer. It would of interest to produce an instruction buffer once that you then can spool through really quickly many times with minor changes without having to revisit the original command sequence. (I probably should just have said, some kind of DRAW compiler)**

**9214**

**[15:20](#msg5f74a251f9cfbe19f92d3d3a)@XANAZOID**

**&gt; So by objects we're not talking about blocks, right?**

**Right, they are different beasts.**

**&gt; do we have any libs for creating benchmarks?**

**Only a few benchmarking scripts here and there. IMO it doesn't make much sense to compare apples to apples when the project is still in development, with many parts being unoptimized.**

**XANOZOID**

**[15:30](#msg5f74a4a4d5337c048e023ff4)@9214 Definitely! I'm talking about what's the most helpful for me to understand the current limitations . . . gotta be adaptive more-so now than later. But that's why being able to benchmark is important (for me) in this specific situation. For us brave travelers who want to make something out of Red before it leaves beta 😄**

**9214**

**[15:48](#msg5f74a8b91b444b4eafaa2c2e)@XANOZOID are you interested in Draw, View, or Red in general?**

**For View, I have an unfinished \[review](https://github.com/9214/7guis-red/blob/review/review.adoc) of 7GUIs tasks implementation that nevertheless offers some critique and lists the desiderata.**

**Red by its nature is a very dynamic language that only an interpreter can fully handle, so there's a hard cap of an interpretive overhead that puts it in the ballpark of the other script languages.**

**AOT compiler doesn't provide any significant performance gains, except for number crunching and tight loops: its biggest benefit, in fact, is bridging Red and Red/System together. Moreso, AOT compiler handles only a tiny, static subset of the language, delegating the rest to the interpreter when it can. This can be alleviated only with JIT techniques.**

**WRT Parse: it's a PEG parser based on pushdown automata, basically an interpreter. IIRC there were some plans to offer a static compiler for data-intensive tasks, but it was not deemed urgent.**

**XANOZOID**

**[16:14](#msg5f74aef3fcce3e6c18e31348)I am interested more-so in Red in general. I probably won't ever be doing anything absolutely intensive using Draw or View - I will be implementing my own solutions using a cross-platform library that wraps around things like Vulkan, Metal, OpenGL2+ and DirectX13+.**

**[16:18](#msg5f74afd1a7389b19f0eb6eef)I sort of figured that the AOT wasn't doing anything intensive . . . and, correct me where I'm wrong, but Red isn't doing much for JIT at the moment, no? Anyhow - a really big interest of mine is definitely language design and performance. Red kind of reminds me of a stack-based programming language, like Forth, so that makes for some really interesting problems and solutions. I wonder though - does Red/Rebol fit into a concatenative programming architecture (boiling it down to its most fundamental interpreter steps and ignoring the symbol-expression heavy stuff)?**

**9214**

**[16:22](#msg5f74b0b5a7389b19f0eb7157)@XANOZOID JIT is planned for post-1.0 development. Interpreter is stack-based, yes, but Red by itself is not concatenative. Similarities with Forth are more on a conceptual level, in terms of language-oriented programming.**

**XANOZOID**

**[16:39](#msg5f74b4dedaf8227643aa9ddc)Thanks Vladimir :)**

**9214**

**[16:44](#msg5f74b5f7f9cfbe19f92d8feb)@XANOZOID for historical roots and general explanation of Rebol/Red design, see \[here](https://news.ycombinator.com/item?id=24083108). Perhaps that will give you some research pointers.**

**XANOZOID**

**[16:46](#msg5f74b667929dd3764d7beb1d)There is a very good chance I've read that haha (if not I am reading it now). . I've read a few of your posts online. Really surprised (or not?) about all the same names I see from the early 2000s Rebol stuff are still here today as vocal and active as ever 😁**

**9214**

**[16:52](#msg5f74b7bfcfe2f9049a14966e)@XANOZOID nay, in 00's I went to the 1st grade and thought of PC as a magic box to play \[Hugo](https://en.wikipedia.org/wiki/Hugo\_%28video\_game%29) on :wink: Rebol was beyond my reach. But you are right that there are a lot of old-timers here; it's a tightly knit community.**

****Thursday 1st October, 2020****

**pekr**

**[07:38](#msg5f75878fd5337c048e04e02f)@henrikmk Not sure it would be the same as your "layers" concept, but I remember Cyphre planning to add a push/pop to the Draw dialect, to save various state and having it accessible for usage.**

**rebolek**

**[08:14](#msg5f758fed9331433de02db337)I believe `push`/`pop` were implemented in R3.**

**henrikmk**

**[14:22](#msg5f75e640f9cfbe19f93111eb)\[!\[Screenshot (79).png](https://files.gitter.im/5565a1d415522ed4b3e10094/XXNT/thumb/Screenshot-79-.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/XXNT/Screenshot-79-.png)**

**[14:23](#msg5f75e6441bb53378feaa2039)@pekr not really the same at all. the idea is to incorporate handling of multiple draw blocks to multiple bitmaps and a separate container for values. this is a model for minimizing updates via changes to the values without having to rebuild draw blocks.**

**pekr**

**[14:25](#msg5f75e6dfdaf8227643ae369a)OK ok, that almost sounds as a proposal. Is that based upon some other compositing engine, or just an idea of how it could potentially work in Red?**

**henrikmk**

**[14:26](#msg5f75e705fcce3e6c18e6af6f)@pekr it's based on my work on the technical draw framework, I'm presently working on.**

**pekr**

**[14:28](#msg5f75e78eaa7388396e8a436b)OK, I just thought that there are some graph based compositors out there, so that we could follow the model. E.g. working with Davinci Resolve, you have nodes, inputs, outputs, you attach effects to the pipeline/nodes, etc.**

**henrikmk**

**[14:34](#msg5f75e8ebfcce3e6c18e6b511)This is more related to the update model. Presently, you will have to build it all yourself including coming up with your own update model, but IMHO, there's a lot of repeated work and optimization work in that. But if you have layers built directly in, as well as having the ability to reference values more easily in DRAW, the optimized update model almost solves itself.**

**hiiamboris**

**[16:46](#msg5f7607eaa7389b19f0ef8616)@henrikmk layers will multiply memory requirements.**

**Oldes**

**[17:30](#msg5f761226fcce3e6c18e72ea0)@henrikmk isn't subblock + bitmap in your diagram = GOB in R3? Btw.. to have compiled draw rules is the right way to go to get a better performace. I was alrady thinking about it.**

**pekr**

**[17:44](#msg5f7615841bb53378feaaab88)There is even a Red GOB experiment, just not sure, how far it went and if it is ever going to be considered as the right way to go?**

**henrikmk**

**[19:29](#msg5f762e28a7389b19f0effe08)@hiiamboris have to break some eggs to get the performance.**

**[19:31](#msg5f762e8ccfe2f9049a190e9b)I don't see this as something you would use on a per-widget basis, not as a way to draw up a regular GUI.**

**[19:34](#msg5f762f352e334178fbfcc602)@Oldes more like a single compiled list of draw instructions tied to a single bitmap. then you would have multiple sets of those and update triggers for each one.**

**[19:41](#msg5f7630ef1b444b4eafaee051)since compositing is not related to drawing in this design, you can use any draw library to paint on the bitmaps. you can even use different libraries simultaneously. if you want to poke pixels directly, that shouldn't be a problem.**

****Friday 2nd October, 2020****

**giesse**

**[08:54](#msg5f76eadaf9cfbe19f933b1b1)isn't this just what faces should be in the first place?**

**henrikmk**

**[11:20](#msg5f770d0fcfe2f9049a1b35c9)in terms of having a renderable tree structure, then yes, but it requires being able to have faces be completely irregular and unconnected shapes and have dozens of different click areas.**

**jflipp**

**[20:13](#msg5f7789f8a7389b19f0f394c8)Hi!**  
**I'd like to open a resizable window with red/view.**  
**Resizable means that the user can dynamically resize the window by dragging its edges and corners with the mouse, you know? :-)**  
**I looked through https://www.red-by-example.org/ and other resources but couldn't find something appropriate.**  
**Is there a window style which does that?**  
**I'm looking for something like view \[title "test" resizable], but this doesn't work.**  
**I am aware of view \[title "test" size 400x200], but this fixes the window size once and for all, which is not what I want.**  
**Thanks for your help.**

**9214**

**[20:24](#msg5f778c8aa5ac9439806a2962)@jflipp a good place to start is the \[official documentation](https://github.com/red/docs/blob/master/en/view.adoc#window).**

**&gt; `resize`: enable window resizing (default is fixed size, not resizeable).**

**`view/flags [title "test"] 'resize`**

****Saturday 3th October, 2020****

**ghost~5826a72ed73408ce4f354d4f**

**[04:42](#msg5f78014aed7be16b3cb40b6b)Hi all I am new to red.**

**rebolek**

**[06:25](#msg5f7819683d3d0d749a275013)hi @ghost~5826a72ed73408ce4f354d4f**

**luce80**

**[14:44](#msg5f788e5b17377c6b5dd6c2cc)@henrikmk In R2 the `draw` block is only one of the possible face's `effect`s and you can have as many draw block as you want for a single face. Perhaps that is/will be possible for Red too.**

**henrikmk**

**[15:18](#msg5f78965c6e0eb84469622643)@luce80 yes, I know. Unfortunately compositing multiple draw blocks that way is unacceptably slow, for two reasons: DRAW blocks are forcibly parsed, even though they might not require any updates. The R2/View compositor is slow as well, and you have no control over it. The fastest solution is to make an external image and then use DRAW to superimpose other separate images on top of each other. That way you can control whether a DRAW block is parsed or not, and whether that image needs updating.**

**That's the reason I would want a design where one draw block is coupled with one bitmap, as the image serves as a result buffer. Each result buffer is simply composited into the final image, and simply compositing the same images over and over is much cheaper than parsing and executing DRAW instructions.**

**luce80**

**[15:41](#msg5f789bbb00f5b82075afd6b4)@henrikmk Nice idea. But then what ultimately we will need is an images compositing engine and then use the `draw` function to draw to those many images wouldn't we ?**

**henrikmk**

**[15:50](#msg5f789dc44603547484f878bd)You basically need two (three) things: 1. The fastest possible way to combine multiple bitmaps into one, i.e. simply slapping each bitmap on top of each other. 2. A way to alter the pixels of each bitmap. That can be DRAW or POKE or whatever. (3). A method to figure out which bitmap to update from input values.**

**drpsy77**

**[21:06](#msg5f78e7d14603547484f92827)Hi there ! just finished a little thing. for those who like Brainfuck too. https://github.com/drpsy77/Rebol/blob/main/brainfuck.red**

****Sunday 4th October, 2020****

**toomasv**

**[03:46](#msg5f7945a7b949c45310bd54c5)@drpsy77 Nice!**

**GalenIvanov**

**[07:47](#msg5f797e1e2bd487530932f3ac)@drpsy77 Good job! I wrote an interpreter for Brain-Flak (a stack-based esoteric language) myself: \[Red-Flak](https://github.com/GalenIvanov/Red-Flak)**

**planetsizecpu**

**[17:28](#msg5f7a06342bd487530934422c)@drpsy77 well done!**

****Monday 5th October, 2020****

**XANOZOID**

**[10:41](#msg5f7af874ed7be16b3cbaf592)@drpsy77 that's real nice and concise! Awesome 😀!!**

**9214**

**[11:29](#msg5f7b037ddfe47e4d574b6f48)@drpsy77 it would be interesting, once you learn Parse, to compare the two approaches, a-la "then and now". For Parse-based implementation of BF, you can take \[this article](https://www.red-lang.org/2013/11/041-introducing-parse.html) ("What about DSL support?" section) and @nickkoro02's \[compiler](https://github.com/nickkoro02/bf-to-8085) targeting 8085 Intel CPU as starting points.**

**greggirwin**

**[15:54](#msg5f7b41b966ee4e44a883bc3a)@drpsy77 @GalenIvanov thanks for posting!**

**XANOZOID**

**[23:52](#msg5f7bb1c300f5b82075b743b9)"Redolution" lol. Is that yours drpsy?**

****Thursday 8th October, 2020****

**Imperatorn**

**[06:18](#msg5f7eaf3fed7be16b3cc4d9e6)Red rox**

****Saturday 10th October, 2020****

**XANOZOID**

**[00:59](#msg5f81076f02e81701b010c508)@Imperatorn Seconded!**

****Tuesday 13th October, 2020****

**drpsy77**

**[11:31](#msg5f858ffc24a20801a8e41bfe)Hi, I tried to do it using Parse, but I didn't understand how to roll back inside the parse loop when on the "]". SO finally, I did it with a simple loop and it works fine. My first version was using recursivity, which was quite elegant, but in my opinion using too much "shadow memory" of the interpreter. Redolution = Rebolution (https://www.sassenrath.com/ but the page for Rebolution no longer exists), and also Revolution (which became LiveCode https://livecode.com/), a modern but commercial version of HYPERCARD (https://en.wikipedia.org/wiki/HyperCard)**

**rebolek**

**[11:45](#msg5f85936943fa5d19e609e149)You can hit stack limit with recursive rules but in real live it doesn't happen very often**

****Wednesday 14th October, 2020****

**draegtun**

**[09:12](#msg5f86c0e5aacbfa2248d8884b)@drpsy77 The Rebolution page moved to - http://www.rebol.com/cgi-bin/blog.r**

****Sunday 18th October, 2020****

**litew**

**[16:09](#msg5f8c68cdea6bfb0a9a423262)Hello! Is this right room for sending bug reports or it's better to file issue on github?**

**hiiamboris**

**[16:11](#msg5f8c693abbffc02b5824a4f1)@litew Hi and welcome!**  
**Confirm your bugs in https://gitter.im/red/bugs room, then feel free to file an issue ;)**

**litew**

**[16:12](#msg5f8c6972631a250ab2787680)@hiiamboris Understood. Thank you!**

****Monday 19th October, 2020****

**ALANVF**

**[01:03](#msg5f8ce5f1a7e77a0ff156be2c)updated my REON data format thing to support function-like macros https://github.com/ALANVF/reon/blob/master/test/macros/input.reon**

**[01:04](#msg5f8ce60bc7ef520fffad23f1)so now it's like a subset of red/rebol**

**Oldes**

**[20:20](#msg5f8df50f57fe0a4f301f140a)@ALANVF something like `compose #(a: (1 + 1))` is not supported in Red and or Rebol. So how it can be a subset of these?**

**ALANVF**

**[21:52](#msg5f8e0a84a0a3072b43914b10)@Oldes it's like a "flavor" of red/rebol then I guess. I added that specific feature for ease-of-use**

**[21:52](#msg5f8e0abb98a7774f1b539528)since not everyone is a redbol (red/rebol) programmer, it's going to have a lot less "surprises" than regular redbol**

**[21:53](#msg5f8e0af157fe0a4f301f51a4)not only will it make macros more predictable, it will also (hopefully) make it easier to implement REON in other languages since it will require less work**

**[22:07](#msg5f8e0e3dc7ef520fffb02a16)a brief list of unsupported features:**  
**- `any-path!`**  
**- `refinement!`**  
**- `bitset!`**  
**- `any-object!`**  
**- `vector!`**  
**- `any-function!`**  
**- `hash!`**  
**- `handle!`**  
**- `datatype!`/`typeset!`**  
**- `unset!`**  
**- Construction syntax**  
**- Binary operators**

**[22:10](#msg5f8e0ed398a7774f1b539dfd)oh, it's also worth noting that macros are pure within the file they are defined in; no I/O is supported (nor planned to be)**

**[22:10](#msg5f8e0eeb7be0d67d2783ccb3)might add errors but probably not**

**[22:11](#msg5f8e0f26ea6bfb0a9a4687fd)(as I said earlier) it ideally needs to be simple enough so that it can be implemented in other languages without much hassle**

**[22:40](#msg5f8e15e7a0a3072b43916711)(oh, for those following Red.js, don't worry I'm still working on it. this was just a side-project)**

****Thursday 29th October, 2020****

**meijeru**

**[13:04](#msg5f9abdf52a35440715f1aa55)I notice contributions to the documentation from @drkameleon who apparently is the author of a language called Arturo, written in Nim. There are quite many similarities between Arturo and Red. Is he coming on board? One would hope...**

**GiuseppeChillemi**

**[13:14](#msg5f9ac04db86f6407041af35a)It would be nice.**

**rebolek**

**[15:38](#msg5f9ae1f6b4283c208a31baf4)@meijeru you can ask him in arturo-lang room here on Gitter, he's quick to respond from my experience**

**XANOZOID**

**[15:44](#msg5f9ae37bb86f6407041b5750)It looks quite similar to Rebol yet makes no mention of it as far as I've seen yet . . .**

**[15:45](#msg5f9ae3b02a35440715f218de)Even suggest to use very similar mechanics " block has no meaning until it is given one, or interpreted within some specific context, "**

**[15:47](#msg5f9ae416b4283c208a31c168)It's got some interesting ideas though! https://github.com/arturo-lang/arturo/wiki/Language#pipe-operator-**

**9214**

**[15:47](#msg5f9ae42406fa0513dd7e5d19)\[HN discussion](https://news.ycombinator.com/item?id=24834636).**

**XANOZOID**

**[15:48](#msg5f9ae457dc70b5159add4695)Sweet, thanks Vladimir 😄!**

**pekr**

**[16:37](#msg5f9aefdaf2fd4f60fc3fcc37)@meijeru I don't expect any language author, working on his brain-child for many years, to join other language efforts . But of course, anything is possible :-)**

**greggirwin**

**[19:16](#msg5f9b150706fa0513dd7ee5fe)I haven't talked to them at all, but was very happy to see them help us out with small improvements to the docs. It's generous and community minded, when their plate is surely very full with Arturo.**

**Kelendria**

**[20:08](#msg5f9b2158b86f6407041c007a)Quick question. When was 0.6.4 actually released? Help -&gt; About from the GUI Console says 21-Nov-2018. The blog post from August 3rd indicates that it's at least as new as July of 2020.**

**hiiamboris**

**[20:16](#msg5f9b2317b4283c208a327289)Download the nightly build. Stable one is old.**

**Kelendria**

**[20:17](#msg5f9b2373dc70b5159addf502)So 21-Nov-2018 is the actual build date of 0.6.4?**

**hiiamboris**

**[20:18](#msg5f9b23a7f2fd4f60fc406099)About right.**

**9214**

**[20:27](#msg5f9b259ddc70b5159addfb19)@Kelendria Red's release model is described \[here](https://github.com/red/red/wiki/%5BNOTE%5D-Release-model).**

**Kelendria**

**[20:29](#msg5f9b263ec6fe0131d4c33aa9)That's what I was looking for. Thanks, @9214**

**9214**

**[20:30](#msg5f9b26592a35440715f2d30b)You're welcome!**

**Kelendria**

**[20:32](#msg5f9b26d406fa0513dd7f115e)I do have to mention that it's really confusing to use the same build number for nightly builds that is being used for the stable release. That number really should be bumped so it's clear you're not using the stable release.**

**9214**

**[20:37](#msg5f9b281f2a35440715f2d6a8)@Kelendria you should rather look at SHA of Git commit and build date, e.g. in `about` output.**

**Kelendria**

**[21:25](#msg5f9b334ec10273610ad3ce6c)Which doesn't show in the gui console Help -&gt; About dialog. I suppose I should be used to obscurity in the REBOL community by now. LOL**

**greggirwin**

**[21:31](#msg5f9b34c5b4283c208a32a217)Indeed. I'll be glad when we get beyond exposing hashes to users, including ourselves, as points of reference. It gets tricky, trying to use something more friendly like patch numbers, with automated builds and local builds in the mix.**

**Kelendria**

**[21:34](#msg5f9b3559b4283c208a32a48b)Agreed. I still argue that the nightly build should have a higher version number than the stable release even if it's just 0.6.5. Anything that makes it clear we're not talking about the stable release.**

**9214**

**[21:55](#msg5f9b3a5fbf955735eb498c42)&gt; Which doesn't show in the gui console Help -&gt; About dialog**

**I see version number \*\*and\** build date in there. More than enough to differentiate between different versions.**

**pekr**

**[21:59](#msg5f9b3b4206fa0513dd7f48a8)I have to agree with Celeste here. When you boot the console, it just states 0.6.4, ditto for `system/version`. I can find it confusing too ...**

****Friday 30th October, 2020****

**pekr**

**[07:40](#msg5f9bc38374152347c202b546)Hmm, I stand corrected - just when I thought that it would be nice to have some system/build info available so that one could check programmatically, that is exactly such structure being available :-)**

**Oldes**

**[09:41](#msg5f9bdfacc10273610ad5562b)I agree that the info from `about` should be visible at start.**

**giesse**

**[09:44](#msg5f9be063dc70b5159adfb08c)what about just showing 0.6.4-nightly for the nigthly builds?**  
**also... I would like to hear the argument for keeping the stable build as the default download. either take it out completely and tell people to clone the git repo (this is an alpha after all), or make it very clear from the download page what's going on.**

**Oldes**

**[09:45](#msg5f9be0bbd37a1a13d67647f2)I would not consider 2 years old build as a stable first of all.**

**giesse**

**[09:47](#msg5f9be118bf955735eb4b111c)well, it is stable if it never changes :P - the point is that it's outdated and not what the "people in the know" are using (even in production! - as much as we can say that for Red)**

**pekr**

**[09:47](#msg5f9be131b86f6407041dc789)+1**

**giesse**

**[09:47](#msg5f9be141f2fd4f60fc422bce)Red is alpha, there's not much point in having a stable release to begin with, especially given that the team doesn't have the resources to deal with this kind of stuff**

**greggirwin**

**[21:43](#msg5f9c890f8d286f20767d071a)I believe the plan is to make nightly the default when we make the console download the default as well.**

**atorres617**

**[23:00](#msg5f9c9b1bd37a1a13d6783b7a)When will the version for download bere be updated from 0.6.4? https://www.red-lang.org/p/download.html?m=1**

**9214**

**[23:06](#msg5f9c9c83d37a1a13d6783e75)@atorres617 are you asking when the next stable release is due? There are two "versions for download" on that page, nightly and stable.**

**atorres617**

**[23:53](#msg5f9ca76fbf955735eb4d02f0)@9214 hi Vladimir-I had assumed that st somw point a stable v 1.0 release will be available.**

**greggirwin**

**[23:54](#msg5f9ca7ab06fa0513dd82b8b2)"at some point" :tm: :^) 1.0 is still "some way out".**

****Saturday 31st October, 2020****

**9214**

**[00:00](#msg5f9ca9388d286f20767d4f03)@atorres617 there are no ETAs for stable releases. The best you can do is to follow the official announcements and to contribute — that will move 1.0 a bit closer in time.**

**greggirwin**

**[00:06](#msg5f9caa728d286f20767d520e):+1: @9214**

**addos**

**[23:16](#msg5f9df05a74152347c207d529)is the patch for "error while loading shared libraries: libgtk-3.so.0: cannot open shared object file: No such file or directory" going to get merged at some point into the nightlies?**

**9214**

**[23:36](#msg5f9df4e02a35440715f94ddc)@addos there's nothing to patch, you simply need to install the required GTK \[dependencies](https://github.com/red/red/wiki/%5BNOTE%5D-Linux-GTK-dependencies), or compile console with `--no-view` flag if you don't need View module.**

**addos**

**[23:49](#msg5f9df7eeb4283c208a3904ba)if it has view compiled into it, why doesn't --cli not allow me to use it without gui?**

**[23:50](#msg5f9df84b2a35440715f9539c)that is supposedly what the patch was supposed to allow it to do**

**9214**

**[23:50](#msg5f9df84edc70b5159ae48bae)&gt; compile console with `--no-view` flag if you don't need View module.**

**That and `--cli`.**

**addos**

**[23:51](#msg5f9df8658d286f20768019e9)why can't a view compiled binary load the cli with --cli, without needing gtk?**

**[23:51](#msg5f9df8957cac87158f7b66d3)using --cli with a view compiled binary fails with the error about missing gtk**

**9214**

**[23:51](#msg5f9df89c2a60f731f72983a3)Because someone might still want to develop View-based apps using CLI console rather than GUI one.**

****Sunday 1st November, 2020****

**9214**

**[00:01](#msg5f9dfaf28d286f2076801e6a)The toolchain can do two things for you the first time you launch it: either compile GUI console or compile CLI console if you passed `--cli` flag; both will include View module by default, since Red comes with batteries included. If you don't need that module, supply `--no-view` flag. Technically `--no-view` implies compilation of CLI console, because GUI console is View-based, but in case that doesn't work, specify both `--cli` and `--no-view`.**

**In case you already have CLI console compiled with View module and don't want to install GTK dependencies: purge the compiled binary from `~/.red` folder and re-launch the toolchain with `--cli --no-view`, or compile the console binary the way you want from sources.**

**addos**

**[00:02](#msg5f9dfb2dd37a1a13d67b4357)let me try that**

**[00:03](#msg5f9dfb3c7cac87158f7b6e82)if that works, then I might have misunderstood you**

**[00:03](#msg5f9dfb6dbf955735eb4fe10c)testing that now**

**[00:04](#msg5f9dfb93b4283c208a390b7c)I think I noticed, --no-view isn't in the help output**

**9214**

**[00:05](#msg5f9dfbe57cac87158f7b6f4d)It is if you use the latest build.**

**addos**

**[00:06](#msg5f9dfc06c6fe0131d4c9ad2a)that worked**

**[00:06](#msg5f9dfc0bb4283c208a390c53)I have the latest nightly**

**9214**

**[00:07](#msg5f9dfc277cac87158f7b7034)Huh, my bad, it's not listed there.**

**addos**

**[00:07](#msg5f9dfc32c10273610ada529f)yeah, that was my problem, I never saw that in the help output**

**[00:07](#msg5f9dfc3bb4283c208a390ca0)but you are right, those options worked perfectly**

**[00:08](#msg5f9dfc7a2a35440715f95dba)Thank you for your help @9214**

**[00:09](#msg5f9dfccd06fa0513dd85963a)It apparently only needs --no-view as part of compilation**

**9214**

**[00:18](#msg5f9dfed62a60f731f72990e8)@addos you're welcome. Good to know.**

**blkstph\_gitlab**

**[11:04](#msg5f9e96322a35440715fa8f99)One of my favorite sayings is "Work expands to fill the time available". Against that, humans sustain vitality via regular time demarcation -- imagine a day without notable progression of hours or a lifetime without periodic weeks, holidays and years...just one long slog that seems like it goes on forever. There are plenty of decimal points remaining before 7.0 becomes a problem and I remain puzzled why GTK completion, at least, didn't merit acknowledgment with a 6.5 bump and a little celebration and PR? I'm sure there are good reasons, but I have no idea what they could be. Holding off on publicly acknowledging GTK until perhaps a year after it is functionally complete seems more than a little odd and demotivating to me...and I guess to some others. Please don't take this as a complaint; I have no valid grounds for complaining about anything. But for a lot of people (like the entire Linux community) GTK is a lot more notable than a faster lexer or a better console.**

**pekr**

**[11:25](#msg5f9e9b327cac87158f7cb77e)Generally, I do agree. I know that blog articles take some time to write, but releasing 6.x versions in 2 years timespan is contraproductive, if there is very good progress in certain areas.**

**On the other hand, GTK progress has been tweeted, as well as posted to the Facebook group (which I do care for voluntarily) ...**

**https://twitter.com/red\_lang/status/1296920676104908800**

**[11:27](#msg5f9e9b988d286f20768168bd)I can see also an IO branch with probably already working client / server secure examples, which could attract the community. But as I don't have internal info, don't want to propagate some work-in-proggress and eventually cause a stress to the branch authors, by some user requests ...**

**blkstph\_gitlab**

**[15:45](#msg5f9ed817c6fe0131d4cb8194)I think GTK deserves a short PR/news announcement - qualified on Linux 1st; GUI 2nd; and lisp 3rd. I would suggest submitting to a swath of programming sites including: Reddit/programming; linuxdaily; lamda-the-ultimate, etc. A longer article or two would be nice but I understand those take a lot more in the way of resources and time. I don't think that is as important, and the longer article can be saved for the faster lexer, etc. Especially if you can get a short announcement published to Linux sites I think red could find itself with a bunch of qualified systems-type people who can use it, as is, for short system-maintenance type work and will contribute back. What are the alternatives in that space for short scripts where a Linux GUI is also desired? Just a thought, but I don't think red's "alpha" stage would be much of a deterrent for Linux systems-people who are seriously hungry for such a tool.**

**greggirwin**

**[18:24](#msg5f9efd53dc70b5159ae6b9ad)This comes up a lot. What we \*do* versus what we \*announce\*. We spend much more time \*doing* and (unfortunately) not so much announcing. We're happy for everyone to contribute, and have them be leaders in their channels, as @pekr is on the FB page. We can even add a section to \[Advocacy](https://github.com/red/red/wiki/Advocacy) with different channels and who hangs out there. It's just too much for us to be everywhere, or be in tune with what other communities care about.**

**GiuseppeChillemi**

**[20:15](#msg5f9f175bd37a1a13d67d9f21)Ports and listview/Datagrid are the most wanted elements after Money! Datatype. They are propedeutic to database interfaces and protocol implementation. Then, a new Android version will be the only big missing Red part to me. When you will implement them,make big announcements as we will be near to release 1.0**

**[20:16](#msg5f9f1785f2fd4f60fc496fff)This will attract a lot of developers**

**blkstph\_gitlab**

**[23:23](#msg5f9f4379dc70b5159ae75d45)@greggirwin I am making a case for more announcements - not more articles. I am very aware that you, @dockimbel, @qtxie and others are stretched very thin and it benefits red the most if you guys aren't distracted. In the case of red, however, I think the amount of articles, tutorials, and general documentation already written - especially for beginning users who might use red as an alternative to shell scripting - is probably more than adequate. I think the main argument for point releases and is to generate a brief press release. The more of these you do, the more name recognition the project ought to obtain. I think red can actually speak well for itself - especially since it has a very, very long history if we consider it an outgrowth of rebol. At the moment I think (and I acknowledge I could be wrong, as I am not an expert on red, nor linux, nor press releases) the red GTK (linux) availability is potentially huge news - even in alpha form - because I can imagine lots of people preferring it in place of shell scripting plus something like zenity (https://www.howtogeek.com/435020/how-to-add-a-gui-to-linux-shell-scripts/). But they don't know red even exists - much less that there is now a built in GUI for the linux release.**

**[23:56](#msg5f9f4b1db4283c208a3bea7b)Further explicating my suggestion, I just did a quick search for linux news aggregator sites and I picked this brief listing of popular linux sites: (https://alltop.com/linux). Many of these seem angled toward longer articles or tutorials. But linuxtoday.com (which I follow almost daily) and (linux.softpedia.com) which I haven't until now, both apparently accept new release announcements. So, a 6.5 release including GTK for linux for the first time would be, I think, more than worthy of a short press release which would direct people to the red-lang.org site for download and not require a bunch of time from @dockimbel nor @qtxie. Anyway, that is my idea. I do have a question, though: When I go to the roadmap link on red-lang.org it shows the GTK at only 10% vs Windows at 100%. Am I correct that is simply the status of 6.4 and that the GTK nightly is at least close to the 100%?**

****Monday 2nd November, 2020****

**greggirwin**

**[01:37](#msg5f9f62d68a236947ba7c9526)Just tracking and doing announcements is a lot of work. There are so many places they could go, right? We have to focus on those that provide the most benefit, but we don't know what those are beyond the big names like Reddit. We need lieutenants and people in those communities too, so we don't just appear as outsiders.**

**Yes, GTK is close to 100%. The roadmap will get an end of year update. It is another thing that isn't kept up on a regular basis.**

**[01:39](#msg5f9f6347c6fe0131d4ccb98b)I'm not complaining about your suggestion in any way, but if we can't keep up with what we try to do now, adding new things just means something else doesn't get done.**

**giesse**

**[10:45](#msg5f9fe34c8a236947ba7db645)@blkstph\_gitlab the reason GTK is not big news is that it's still only 32bits, so the general public (meaning your average programmer) wouldn't care that much about it.**

**pekr**

**[12:35](#msg5f9ffd2106fa0513dd89fc19)Ah, that's unfortunately very valid argument ....**

**rebolek**

**[13:04](#msg5fa003fb74152347c20c6a99)Whole Red is 32bit only, unfortunately.**

**blkstph\_gitlab**

**[16:29](#msg5fa033d0b4283c208a3e2451)@giesse @pekr : My LInux Mint, 19.3 Cinnamon, which runs a recent red with gui, is 64 bit. I just ran "uname -m" and it says "x86\_64". Am I missing your point?**

**9214**

**[16:31](#msg5fa0347fc10273610adf65ff)@blkstph\_gitlab `uname` tells the information about your OS, not the binary. 64-bit system can run 32-bit apps. Try `file ./red` instead.**

**blkstph\_gitlab**

**[16:50](#msg5fa038c32a60f731f72e90ec)@9214 I know red is 32 bit. I also know that as OS's move forward 32 bit app support is being dropped. Are you saying the latest 64 Mint (and Ubuntu) won**

**[16:57](#msg5fa03a7e8d286f2076854246)...don't support 32 bit apps? For me that is a reason not to rush to upgrade OS - and I have drawn the line on my Mac at iOS Mohave for that reason. I didn't know Linux was similarly making that IMO sad decision.**

**9214**

**[16:59](#msg5fa03af3c10273610adf7718)Your average programmer thinks that 64-bit is somehow "better" than 32-bit because `64 > 32`. Doesn't matter if it introduces a certain trade-off (memory usage vs. minor increase in performance) as long as it sounds cool. Red can run perfectly fine in most of the 64-bit environments, except for Catalina, but eventually the rest of the platforms will follow the example set forward by it.**

**blkstph\_gitlab**

**[17:16](#msg5fa03ef474152347c20d138f)Thank you for clarifying things. I knew this was a problem already with MacOS. I didn't know Linux Mint had taken that dark path as well. For myself, I stop "upgrading" OS's when it threatens my ecosystem of vital applications. I proudly stopped "upgrading" iOS on my phone at 10.X for the same reason. Right now Apple is trying to force 14.x down my throat; the arrogance of certain parties boggles my mind.**

**pekr**

**[17:26](#msg5fa041612a35440715fe86c2)@9214 Isn't that the other way around? E.g. some systems eventually dropping 32 bit support, so that if you want to use the "latest and greatest", you have to keep up with new versions, and you're forced to step into a 64 bit territory? I am not fluent with Linux (nor OS-X), but on my Win10 64 bit I can still use 32-bit apps. Isn't there usually some subsystem available for Linuxes, so that you could install it, to allow 32 bit app usage?**

**9214**

**[17:38](#msg5fa04403b86f64070427efaa)&gt; I didn't know Linux Mint had taken that dark path as well**

**At no point did I say that about Mint, in fact I myself develop with Red on it from time to time. Maybe they will drop 32-bit, maybe they won't, you probably know better than me. I only heard that Canonical \[tried](https://ubuntu.com/blog/statement-on-32-bit-i386-packages-for-ubuntu-19-10-and-20-04-lts) to remove 32-bit support at one point and got a backlash from the gaming community (most videogame titles from golden era are 32-bit).**

**blkstph\_gitlab**

**[17:38](#msg5fa0440b2a35440715fe8dc8)Ubuntu supposedly was going to drop and then backtracked due to complaints. But Mint apparently went forward. Interesting. I won't go with an y Os that breaks my existing software - I am surprised that anyone does.**

**addos**

**[18:41](#msg5fa052d6d5a5a635f297f7c5)tried the latest nightly with --no-view, and now getting this error**

**[18:41](#msg5fa052d6c6fe0131d4cf159d)error while loading shared libraries: libgdk\_pixbuf-2.0.so.0: cannot open shared object file: No such file or directory**

**9214**

**[19:01](#msg5fa0576fbf955735eb55559a)@addos https://github.com/red/red/pull/4701**

**&gt; Notes this PR will add another dependency (libgdk-pixbuf2.0) in Red/Core on Linux.**

**That dependency is now mandatory, since `image!` became a part of /Core, not /View.**

**[19:04](#msg5fa0582dc10273610adfd040)@x8x @greggirwin :point\_up: worth updating the list of dependencies on \[download](https://www.red-lang.org/p/download.html) page. @qtxie already gave an example for Debian-based distros.**

**addos**

**[19:05](#msg5fa05860dc70b5159ae9f625)damnit**

**GiuseppeChillemi**

**[19:37](#msg5fa06005f2fd4f60fc4ca688)@9214 Vladimir what does change moving from 32 to 64 Bit? I imagine the Addressing, the width of the register and maybe the memory fetch size.**

**9214**

**[20:19](#msg5fa069c32a35440715feff24)Are you asking what are the architectural differences between x86 and x86\_64 or what changes need to be made to port Red to 64-bit?**

**GiuseppeChillemi**

**[21:41](#msg5fa07cf58a236947ba7f6b8a)Architectural differences and advantages of 64 but processors.**

**9214**

**[22:09](#msg5fa083afdc70b5159aea7298)Refer to \[Intel manuals](https://software.intel.com/content/www/us/en/develop/articles/intel-sdm.html). @Respectech can probably comment on ARM-related differences.**

**GaryMiller**

**[22:10](#msg5fa083d4b4283c208a3f096c)First is the fact that 32-bit CPU's are largely dying out and thus killing off support for a dying architecture means they can focus on improving the 64-bit architecture.**

**[22:15](#msg5fa084f88a236947ba7f8154)A 64 bit processor, given 64 bit code, is going to perform better, especially with mathematically difficult things like transcoding and VoIP data - in fact, any sort of 'math' applications should benefit by the usage of 64 bit CPUs and operating systems.**

**greggirwin**

**[22:20](#msg5fa08645f2fd4f60fc4d10d9)@x8x, yes, please update the dependencies on red-lang.org when you get a chance.**

**GiuseppeChillemi**

**[22:26](#msg5fa0878e8a236947ba7f86f1)@GaryMiller I suppose this happens because of specialized instructions and because of 64bit architecture. However, lets go to chit chat.**

**greggirwin**

**[22:27](#msg5fa087cd8d286f207686241f)64-bit is like optimizing, benefits (sometimes huge ones) in small areas but not needed for most things. But you can't generate profits and stay in business without offering something new. Of course 64-bit is far from new, along with IPv6 and others. My gripe isn't with 64-bit, as we can realistically hit 32-bit limits now. It's just that there are so many problems that affect us much more on a daily basis, that I think are more important.**

**GiuseppeChillemi**

**[22:32](#msg5fa08916c10273610ae05716)I am 100% with you. 64bit is mostly a marketing problem. We have a lot of other priorities.**

****Tuesday 3th November, 2020****

**pekr**

**[05:53](#msg5fa0f058d37a1a13d6824547)Whatever the problem it is, neglecting the problem like that, does not help situation at all, as far as we can see complaints towards the lack fo the 64 bit support imo. So what do you tell the the OS-X users - to stick with the old OSes?**

**ne1uno**

**[06:14](#msg5fa0f55e8d286f207687249f)vm**

**rebolek**

**[07:17](#msg5fa10409c6fe0131d4d0e661)IPv6 support is another thing that Red should deal with soon. IPv6 accounts for 20-40% of traffic and that number is getting higher. IPv4 address exhaustion is a real propblem and with IoT and 5G this will only get more significant.**

**IMO Red should be written for tomorrow, not for yesterday.**

**drkameleon**

**[09:12](#msg5fa11ef7b86f6407042a3162)So, \[Arturo](https://github.com/arturo-lang/arturo) author here :)**

**I've obviously been watching Red too - although, unfortunately, I can't see how easy it would be for me to contribute to this project, given that \[I can barely run it natively](https://github.com/red/red/issues/4652).**

**Feel free to ask me whatever you want - I think we could all benefit from some exchange (at least of ideas :))**

**giesse**

**[09:35](#msg5fa12472f2fd4f60fc4e9735)@greggirwin just like you guys have more important problems than 64bit support right now, people that make Linux distributions as well as other OSes have more important problems than supporting 32bit dev environment (one thing is an old 32 bit game, another is a tool for programmers that is being developed today and it's not even out of alpha). This creates a divergent path between Red and the rest of the world - and we're already pretty divergent to begin with.**  
**So in the end this could be a much bigger problem for you guys as a company than you think it is. It is also a lot about perception, reality matters little in this kind of things.**

**pekr**

**[09:54](#msg5fa128c0b4283c208a40b08d)+1 - could not say it better ....**

**blkstph\_gitlab**

**[16:55](#msg5fa18b878d286f2076890d3e)If there was a good list of OS versions where the cutoff occurs this would be helpful. I wouldn**

**[17:04](#msg5fa18d8e06fa0513dd8e737e)I have just spent a few minutes trying to search for such a list, because it ought to exist, but I have not yet found it. I'm getting a lot of hits on 64 bit OSes vs 32 big OSes, but that is not the issue that concerns most people with legacy applications - it is the vendor decision to discontinue 32 bit support in their 64 bit distribution that is the issue and vendors and search engines are not being very up-front about this in general. On the commercial side, both Apple and Microsoft are clearly and deliberately trying to force "updates" which break existing applications and, rather obviously, this is mostly in order to force users to spend a lot more money. In the case of Linux I am puzzled why this information isn't crystal clear and more widely available. Asking for 32 bit support in a distro has nothing to do with the distro itself being 32 vs 64 bit. Further, with linux distros, older distros are generally easy to get and unless you have some pressing need for the latest distro there is a happy medium where both 32 bit and 64 bit applications both work together.**

**greggirwin**

**[17:08](#msg5fa18e9406fa0513dd8e7552)Welcome @drkameleon! I don't see an easy collaboration path either, but let's keep in touch and maybe Arturo will be close enough to Redbol/Ren format that everyone benefits.**

**blkstph\_gitlab**

**[17:11](#msg5fa18f408d286f2076891711)In the case of running red on Linux, at least, if we could pick, say, the top 10 distros and just ascertain and keep current, which ones support 32 bit apps, and keep this list current, along with any instructions for special libraries, this would buy us time. It would also allow us to go forward with my proposal for a "6.5" release and PR in the near future. The benefit of that could be considerable and have very little cost. The only other alternative is for red to become increasingly marginalized pending a 64 bit rewrite, which I would think would be prohibitive short of 1.0. 1.0 would seem to be many years in the future. The pace of forced migration from 32 bit apps is really an ugly scenario, and not just for red.**

**greggirwin**

**[17:12](#msg5fa18f7306fa0513dd8e77b4)To be clear, Red \*will* be 64-bit. It's a huge problem, and we're well aware that perception is a large part of it. It also won't always be clear when I'm speaking for the project versus expressing my own personal views, but I do try.**

**[17:13](#msg5fa18f9c2a60f731f7326546)@blkstph\_gitlab I hereby authorize you to create and maintain that list, and I hope others join to help you.**

**blkstph\_gitlab**

**[17:13](#msg5fa18fb106fa0513dd8e7809)You are great, @greggirwin -- as is the whole team from what I can see. Just trying to be constructive and realistic.**

**drkameleon**

**[17:18](#msg5fa190d0b86f6407042bb0b0)@greggirwin Nice to meet you all! :)**

**blkstph\_gitlab**

**[17:20](#msg5fa19172c6fe0131d4d2b9ee)Ok. I will contribute to it as I can. It just so happens I was planning to evaluate most of the top 5 Linux distros for personal use anyway. I have red running on my Linux Mint and didn't know about the recent cliff at Mint 20. At this point, according to distrowatch, the top distros over the last 6 months are, in order, MX Linux 3538&lt;**  
**2 Manjaro 2414&lt;**  
**3 Mint 2219&lt;**  
**4 Pop!\_OS 1578&gt;**  
**5 Ubuntu 1468&lt;**  
**6 Debian 1291&lt;**  
**7 elementary 1206&lt;**  
**8 Fedora 983&lt;**  
**9 Solus 945&lt;**  
**10 KDE neon**

**greggirwin**

**[17:21](#msg5fa191a3c6fe0131d4d2ba63)As a company, to @giesse's point, what matters depends on what we're selling. If it's SaaS, we only have to please ourselves and run on what we want to run. We'll fall victim to deprecations by OS vendors there too. If it's desktop apps, who pays for those? We only need to run there. If it's mobile, Android first, and then have to find resources to support iOS. If it's server side/containerized tools, Linux is critical. If it's contract work, we can only take jobs where Red runs, so more platforms means more chances of getting work.**

**As a language, and a FOSS project, we have to pick our resource battles and draw lines where others have to step up and contribute.**

**When choosing where to put our efforts, we make the best decisions we can with the goal of surviving as a project and a company. That has to be our top priority.**

**9214**

**[17:21](#msg5fa191a47cac87158f8478e0)No Slackware... puny mortals.**

**blkstph\_gitlab**

**[17:21](#msg5fa191a7f2fd4f60fc500b85)Debian supposedly still supports. I think / hope MX does also, as that is what I was primarily aiming for.**

**greggirwin**

**[17:22](#msg5fa191d974152347c210f167)@blkstph\_gitlab nice! Pop that in a wiki. Maybe @9214 knows a good place.**

**[17:22](#msg5fa191e88a236947ba828b2b)Though it may be best as a new page.**

**rebolek**

**[17:41](#msg5fa196482a60f731f7327966)@blkstph\_gitlab As MX is based on Debian it should support 32bit, even if not out of the box. Manjaro/Arch definitely does, I use it daily. Anything else to #7 included is Debian/Ubuntu based so 32bit support is there. #8 is Fedora and I don't know and don't even want to know what Fedora supports. They cursed Linux with such gems as systemd and pulseaudio and that's enough for me to know.**

**blkstph\_gitlab**

**[18:08](#msg5fa19c9adc70b5159aed8542)@rebolek Thank you. :-) for Fedora. The question of Ubuntu is a big one, as many of the distros are based off it, including Neon and Pop, I think. If anyone can answer that definitely re the latest releases, please speak up. Mint also derives from Ubuntu, of course, so that is not a good omen.**

**rebolek**

**[18:54](#msg5fa1a74e7cac87158f84b662)There was a strong push against droping 32bit from Ubuntu so it's safe for a few years but eventualy the time will come ant support will be dropped anyway. In a few years, only controller OSes will be 32bit based, consumer/developer machines, would be 64bit only.**

**[18:59](#msg5fa1a89ac6fe0131d4d2fd76)It's not a bad thing, 64bits give you plenty of space and if you need more, there are techniques to deal with such boundary.**

**[19:00](#msg5fa1a8d28a236947ba82cac9)And for older stuff, you can use VM if you're really nerdy.**

**greggirwin**

**[19:00](#msg5fa1a8d9b86f6407042bf6ae)640K should be enough for anyone.**

**rebolek**

**[19:01](#msg5fa1a8ed06fa0513dd8ebc5c)It should be, right. But it wasn't.**

**[19:01](#msg5fa1a907c6fe0131d4d2fe7e)It' more that 13x RAM than my ZX Spectrum had.**

**greggirwin**

**[19:01](#msg5fa1a920b4283c208a426524)Yeah, but QEMM solved that. Do you remember having to distinguish between high memory and extended memory? Ah, the good old days.**

**[19:03](#msg5fa1a99f8a236947ba82cca3)\[The first computer my Dad got](http://www.oldcomputers.net/hp85.html) He paid a lot for an \*extra* 8K of RAM. He could see the future.**

**[19:06](#msg5fa1aa2b8d286f20768961a5)&gt; Most forthcoming software will necessarily have to be written in high-level language, making it independent of the actual processor used. The reason is due to increasing software costs and the desire to implement more complex programs. No one will be able to afford to develop important new applications in machine language, especially since it will be unnecessary. Because of the increased capabilities of future-generation microprocessors, coding efficiency won't really matter. Stretch it to the limit and you'll see what I mean - perhaps by the year 1999 all the software ever written will run in less than a minute.**

**:^)**

**[19:07](#msg5fa1aa7b7cac87158f84bcaf)Remind me never to predict or write about what the future holds.**

**rebolek**

**[19:21](#msg5fa1adaa7cac87158f84c463)&gt; Do you remember having to distinguish between high memory and extended memory?**

**I do remember laughing at that as I had Amiga at that time.**

**dsunanda**

**[20:09](#msg5fa1b8e62a3544071502bcab)Some of us are old enough to remember mainframes going through almost exactly the same evolution as we went from 24-bit to 31-bit (not a typo - 31 not 32) and then 64-bit addressing. Plus the short-term expedient of 2-gig swappable "address spaces" (similar to the 286's expanded memory).**  
**How we laughed when we saw Intel making the same mistakes :)**

****Wednesday 4th November, 2020****

**addos**

**[16:26](#msg5fa2d62e7cac87158f87bf7d)is there a way to have --no-view compile a red binary that depends on no gnome libraries?**

****Thursday 5th November, 2020****

**XANOZOID**

**[10:43](#msg5fa3d76a8d286f20768ee878)I think when this comes out of beta, Red could 100% benefit from this (specifically "Discussions"): https://github.blog/2020-05-06-new-from-satellite-2020-github-codespaces-github-discussions-securing-code-in-private-repositories-and-more/#discussions**

**[10:44](#msg5fa3d78ed37a1a13d689f203)A project I follow seems to already have access to it: https://github.com/Kode/Kha/discussions**

**loziniak**

**[13:18](#msg5fa3fb9a8a236947ba88a8db)Seems like part of Microsoft's \[Embrace, Extend and Extinguish](https://en.wikipedia.org/wiki/Embrace,\_extend,\_and\_extinguish) strategy :-/**

**greggirwin**

**[19:22](#msg5fa450f5f2fd4f60fc56d49a)We'll have to see how things really work. We've talked about similar things, on a small project and team scale. Given that chat is a huge space, it's a smart move for them.**

**XANOZOID**

**[19:28](#msg5fa4527bd5a5a635f2a29825)Whether or not Microsoft has that sort of reputation, I've been wanting this sort of integration for a long long time . . . I'm just finally happy to see more integrations into the project space instead of it spread out everywhere. If anything I'm hoping more GIT hosts start thinking about user experience innovations like this**

**greggirwin**

**[19:43](#msg5fa455c52a354407150955a9)It absolutely makes sense to integrate things, but this is also a step, not an end game. Step back and look at projects from a lifecycle vantage point, high up, and code is still only one piece. It's probably considered a human rights violation to expose non-devs to git in any way. :^) Manual threading is also crude, but better than nothing to be sure.**

**Key, for me, is the data (which includes the people involved). If you have that, you can view things and present it in different ways. Picture a project as a tree. You see the end result from the outside, but if you look at slices of the tree you can see how it got there. Years of vigorous growth and drought, where branches broke off. Now look at the forest, where the whole ecosystem comes into play, and timelapse that. What could we learn, and how can we use that information to plan for a better future?**

**[19:48](#msg5fa45701c6fe0131d4d9bd7d)And if we think that an organic analogy isn't appropriate, consider that we humans still call the shots, and how trends and "new ideas" are simply mutations that either benefit their hosts and spread, or don't. But mutations, like bacteria, don't see the big picture. What becomes "popular" is not the same as "optimal" and you can't know what's best long term, just as with local hill climbing.**

****Sunday 8th November, 2020****

**q60**

**[17:38](#msg5fa82d28b86f6407043b8586)Hi. I have some issues with using `input` function. All works perfectly unless i compile my code and then launch executable. It yields `*** Script Error: input has no value` and i've no idea how to solve it. linux x86\_64, latest red-06 and red-04nov20-277584b4c - both do not allow me to use `input` in compiled code...**

**[17:40](#msg5fa82d73bf955735eb690652)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/WLMv/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/WLMv/image.png)**

**[17:40](#msg5fa82d8abf955735eb6906a8)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/vYj5/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/vYj5/image.png)**

**9214**

**[17:42](#msg5fa82e082a60f731f7424e5f)@llathasa-veleth please follow \[this](https://github.com/red/red/wiki/%5BNOTES%5D-Compiling-with-console-functions---input,-ask) instructions.**

**q60**

**[18:01](#msg5fa8327b8a236947ba92874e)so i need to clone the repository, then do this? can't i do this with only `input.red`?**

**9214**

**[18:07](#msg5fa833ea8d286f2076992c1d)@llathasa-veleth no, I'm afraid you cannot. It's a temporary workaround until a proper I/O is implemented.**

**q60**

**[18:38](#msg5fa83b1774152347c220f8b3)ok, thanks for help**

****Monday 9th November, 2020****

**pekr**

**[19:20](#msg5fa9968306fa0513dda1c674)I can see various activities in IO area, by bitbegin and qtxie.There even seems tobe a https client server exmple.Just womder what is an overall state of IO? Still a lomg way to go? Or its core mostly done and for something like 0.7 it is mostly about adding various protocol support?**

**greggirwin**

**[22:00](#msg5fa9bc1206fa0513dda22cab)The foundation is largely complete, but needs some high level design to be finalized.**

****Tuesday 10th November, 2020****

**pekr**

**[05:02](#msg5faa1ed2b4283c208a569b22)Thanks Gregg. Looking at examples it seems like functionality is similar to R3 TCP handling ...**

**rebolek**

**[06:21](#msg5faa31782a60f731f7470ed5)@pekr you're not wrong, it's very similar to R3, although bit simpler I would say. HTTP server works almost fine (there are still some SSL related problems) so if anyone wants to experiment with it, it's a great opportunity.**

**pekr**

**[07:00](#msg5faa3a932a60f731f74721fc)I am a bit confused though. Saw @bitbegin doing some fixes / extensions in his branch, related to SSL, certificates, etc., but now @qtxie continues with his branch, but I am not sure I see the merges. So which one should I start with? :-)**

**rebolek**

**[07:22](#msg5faa3fb0d37a1a13d69937c6)I believe @qtxie 's branch has everything.**

**[07:23](#msg5faa3fe674152347c225d807)Using that branch I was able to get A- score for a webserver on SSLlabs test, so certificate support is top notch :-)**

**pekr**

**[07:24](#msg5faa402bdc70b5159a024c1a)Just curious, look at the commits in terms of the bitbegin's one 🙂**

**rebolek**

**[07:38](#msg5faa4365f2fd4f60fc64c831)Well, let's hope they would show up and tell us what's the difference :)**

**qtxie**

**[08:03](#msg5faa4934c10273610af81bd7)@pekr bitbegin's branch is a feature branch, it will be merged once it's ready.**

**pekr**

**[10:22](#msg5faa69e78a236947ba97e4e2)OK, thanks ....**

**dillonKneeland**

**[14:34](#msg5faaa4f274152347c226e558)Hey everyone, anybody use the vscode red extension?**

**hiiamboris**

**[16:52](#msg5faac55edc70b5159a03a762)@bitbegin ^**

**greggirwin**

**[18:16](#msg5faad915c6fe0131d4e916d0)@dillonKneeland VSCode broke the old version, and now it needs to be synced with fast lexer. @bitbegin or @qtxie can probably tell us its status. Reporting issues you see always helps though.**

**dander**

**[18:41](#msg5faadecdb86f640704421d7e)@dillonKneeland @greggirwin It has been working again for a while for me with recent Red builds.**

**greggirwin**

**[18:42](#msg5faadf14d37a1a13d69ad9ad)Excellent! Thanks @dander.**

****Wednesday 11st November, 2020****

**pekr**

**[11:14](#msg5fabc7aff2fd4f60fc68a305)It seems that Redbin was merged to Master? What an extensive work! Thanks to @9214 or whoever participated on that :-)**

**endo64**

**[17:43](#msg5fac22af74152347c22aa60b)Huge work, congratulations!**

**greggirwin**

**[18:47](#msg5fac31d7d37a1a13d69e1b67)@9214 has been leading the charge on that, yes. :+1: to him. We still need someone to add validation checks in the decoder, and his time is limited right now. If someone is interested, he and Nenad can say exactly what's needed and offer guidance.**

**dander**

**[20:03](#msg5fac4397b4283c208a5c1221)I wonder if it would be useful to build a test case generation system for this. If we could generate valid Red data using something like the input generator of DiaGrammar. Then test to see if it can be round-tripped to redbin and back. Inputs which break can be converted to unit tests.**

**greggirwin**

**[20:25](#msg5fac48ba2a60f731f74c46c5)I like that idea. Long ago I wrote permutation related generators, so it can be much more automated than using DiaGrammar (but I like that idea as well).**

**dander**

**[20:56](#msg5fac4fe82a354407151c8d15)Sure, I just meant it seems like DiaGrammar already has that tech, or using it as inspiration**

**greggirwin**

**[20:57](#msg5fac503274152347c22b2434)Yes, and we should definitely drink our own wine.**

****Thursday 12nd November, 2020****

**9214**

**[03:48](#msg5facb09674152347c22c0498)@dander Redbin tests already do that.**

****Friday 13th November, 2020****

**Oldes**

**[17:14](#msg5faebedabf955735eb796bcd)@9214 what is missing in Redbin so far? I tried self referencing object as my first test, which was handled correctly, but `system` object encoding (as my second test) throws an error.**

**[17:14](#msg5faebef4dc70b5159a0d86bb)hm.. it will be `routine` which is not handled.**

**[17:16](#msg5faebf658a236947baa2b986)also.. have you been doing some performance tests on huge data? I wonder how efficient it is in comparison with classic `load`.**

**9214**

**[17:19](#msg5faec02b8d286f2076a95610)@Oldes you can find all the info with a link to relevant documentation \[here](https://github.com/red/red/pull/4586#issue-455272169). Codec misses moderately sane validity checks and can easily blow up internal hardcoded limits in certain cases. Encoding format of some values (e.g. word and refinement) also needs to be updated to match the recent changes in the runtime. Redbin test suite is a hot mess riddled with crufts and crude workarounds over compiler limitations that needs some major cleanup.**

**[17:22](#msg5faec0cbd37a1a13d6a484bc)&gt; have you been doing some performance tests on huge data?**

**I did not, because at the time I worked on the codec fast lexer wasn't finalized, and, like I said, it misses validation of Redbin records, which will obviously penalize the performance. I would hazard a guess that even with validation checks in place it will be faster on average that `load`, but that difference will vary depending on the datatype: e.g. `date!`with all its supported formats is insanely hard to lex, while in serialized form it's trivial (supposedly).**

**Oldes**

**[17:27](#msg5faec1fcd37a1a13d6a4888e)I see.. thanks... it's very interesting work anyway!**

****Saturday 14th November, 2020****

**mitranim**

**[13:08](#msg5fafd6b506fa0513ddb14da2)Good day everyone. I'm learning Rebol/Red and must say that it's the most incredible language I've used so far, beating even Lisp in how alien and awesome it is at the same time. The credit of course goes to Carl, but Nenad gets a huge share for going for fullstack as well**

**[13:10](#msg5fafd746b4283c208a64bc8a)Got a question about editor support. Anyone here using Sublime Text? The existing Rebol and Red packages are extremely outdated. I'm writing a better syntax highlighting implementation based on Rebol's spec. Planning to simply replace the existing packages, if the maintainers give their OK. But this also needs an "OK" from some \_users_ to ensure it doesn't break people's expectations of the syntax. Anyone interested in trying?**

**[13:33](#msg5fafdcaaf90b2e28b372ef22)And if not, I'm curious what editors people are using for this, and what's their impression of the quality of language support**

**toomasv**

**[13:40](#msg5fafde662a35440715255d55)Welcome @mitranim Have you looked at \[Editor Integrations](https://github.com/red/red/wiki/%5BNOTES%5D-Editor-Integrations)? I use Notepad++ with locally adjusted syntax highlighting and am quite content so far.**

**mitranim**

**[13:50](#msg5fafe09d2e11a27b41d6f0f1)Thanks, good to know**

**[13:50](#msg5fafe0b62e11a27b41d6f0f5)Gives me a rough idea what people expect**

**henrikmk**

**[14:10](#msg5fafe55fd37a1a13d6a72385)VSCode has reasonable Red support**

**9214**

**[14:44](#msg5fafed57d5a5a635f2beb87b)&gt; based on Rebol's spec**

**Red and Rebol have slightly diverging syntax. You should rather use \[lexer specs](https://github.com/red/red/tree/master/docs/lexer).**

**mitranim**

**[14:45](#msg5fafed72c950f95c4a8d33af)Interesting, thanks**

**Oldes**

**[15:43](#msg5faffb2374152347c23417e8)@mitranim I'm using Sublime Text and I'm author of these packages... if there is not more versions from other people.**

**[15:46](#msg5faffbba06fa0513ddb1a427)Here is source of the Red version https://github.com/Oldes/Sublime-Red**

**[15:46](#msg5faffbc3b86f6407044eb8c1)Feel free to improve it.**

**mitranim**

**[15:48](#msg5faffc502e11a27b41d6f0fc)Yes I've seen it. My version uses the new `.sublime-syntax` format so it's a complete rework. Still a work in progress, but I've put it up at https://github.com/mitranim/sublime-rebol**

**[15:49](#msg5faffc7c747be107c1c75e34)That's as much as I could knock out while learning the language today. The readme says what's missing 🤷‍♀️**

**[15:50](#msg5faffcdec950f95c4a8d33b4)Nice to meet you here because if I have the time to finish this rework, we'll need to discuss the best way to update those packages**

**[15:51](#msg5faffd1d2e11a27b41d6f0fe)There might be conflicting expectations, e.g. some people may really want support for built-in names, and this one is completely lacking them for now**

**[15:52](#msg5faffd59c950f95c4a8d33b6)So it needs to be adapted to existing expectations before we can even consider an update**

**Oldes**

**[15:54](#msg5faffdcfc10273610a061c65)No problem.. I will not block the progress...it's true that I'm quite satisfied with current 6 year old version and I was not following changes in Sublime changes. I can give it a try to your version.**

**mitranim**

**[15:55](#msg5faffdeef433175b7cfb3fd4)Sounds good!**

**Oldes**

**[15:56](#msg5faffe39dc70b5159a106f71)Btw... I also did Highligth.js Red support https://github.com/Oldes/highlight.js/commit/3a976f884f9b5f693085d30ca3f23d5d8dcdd058 5 years ago.**

**mitranim**

**[15:57](#msg5faffe4cc950f95c4a8d33b8)Would be great if you're interested in trying it out. I'm very familiar with Sublime syntax development and can knock out a decent implementation, but on the other hand I'm not familiar with Red. With out powers combined, it could be made a lot better**

**[15:58](#msg5faffeabf90b2e28b372ef31)The new syntax format allows interesting things. For example, it now supports branching and backtracking, which allows to correctly scope `ident: func[][]` as a function declaration, even if there are multiple lines and comments between `ident` and `func`**

**[16:00](#msg5fafff13747be107c1c75e36)One of the things that existing implementations don't seem to do, which I consider really important, is to correctly identify all root-level declarations for search/goto, and my rework does that, among other things**

**[16:00](#msg5fafff23747be107c1c75e38)Anyway you'll see :)**

**Oldes**

**[16:10](#msg5fb00189c10273610a0623d6)Sounds good.. I'm quite busy now, but I will try to find some time.**

**[16:20](#msg5fb003c57cac87158fa7bb6c)Btw.. I'm also responsible for the Pygments colorizer (the one used in GitHub for example). The sources were originally under Bitbucket, but not there anymore.. now the project is under GitHub and I can see, that \[Red is part](https://github.com/pygments/pygments/blob/master/pygments/lexers/rebol.py#L247-L431) of the Rebol's lexer -&gt; https://github.com/pygments/pygments/blame/master/pygments/lexers/rebol.py**

**mitranim**

**[16:21](#msg5fb003ef747be107c1c75e3e)Neat**

**[16:21](#msg5fb004043fdde5257d8aa1ba)What does Gitter use?**

**Oldes**

**[16:23](#msg5fb004712a3544071525b7fb)I don't know now.. I just know, that I was trying to get it here too, but there were some issue with the language recognition and the maintainers were refusing to enable it. I had no time to solve it.**

**[16:23](#msg5fb00482c10273610a062b1a)But I think there should be my pull request somewhere.**

**[16:24](#msg5fb004cfd5a5a635f2beefbb)And when you want to modify the Sublime version, you should be aware, that Linguist is using it... https://github.com/Oldes/linguist/commit/63f54bdf06a20c715c1161f551a8e5fe6e7b966a**

**mitranim**

**[16:26](#msg5fb005262e11a27b41d6f10e)Ooh interesting, didn't know this existed. Do they support `.sublime-syntax`, or only `.tmLanguage`?**

**Oldes**

**[16:28](#msg5fb00596c6fe0131d4f5b661)https://github.com/github/linguist/pull/1150**

**[16:31](#msg5fb00648d37a1a13d6a76d53)As I said.. I'm not much following the scene. But as I see now... Github is probably now using the linguist, which depends on Sublime's syntax file.**

**mitranim**

**[16:31](#msg5fb006673fdde5257d8aa1c5)👍**

**Oldes**

**[16:32](#msg5fb006842a3544071525bce1)If there is something, which I don't like, than it is how the current syntax does not allow spaces and comments in binary types.**

**[16:33](#msg5fb006bf06fa0513ddb1bda0)Like this: https://github.com/9214/red/blob/f28da794e2d38913884d8c27ef48f22c812349dd/runtime/redbin.reds#L57-L63**

**mitranim**

**[16:33](#msg5fb006d3c950f95c4a8d33cc)My rework actually supports that 🙂**

**[16:34](#msg5fb006fff90b2e28b372ef44)Mostly by accident since it currently doesn't try to differentiate valid from invalid content inside binaries. Comments are scopped appropriately though**

**Oldes**

**[16:34](#msg5fb00701d37a1a13d6a76ee2)That is good to know.. one more reason to give it the try soon.**

**[16:35](#msg5fb0073e2a3544071525befc)If Github is using Linguist with the linkage to Sublime, than I guess Gitter depends on Pygments.**

**[16:35](#msg5fb007442a3544071525beff)Something like that.**

**mitranim**

**[16:35](#msg5fb00755f90b2e28b372ef46)Gitter runs on JS so you'd expect Highlight.js or whatever**

**Oldes**

**[16:36](#msg5fb00776bf955735eb7c7f2d)On server? I think it was Ruby some years ago.**

**mitranim**

**[16:36](#msg5fb0078a3fdde5257d8aa1c7)Don't know about server, but pretty sure all rendering is done client side**

**Oldes**

**[16:37](#msg5fb007b0c10273610a0631ba)I remember that one argument why they don't wanted to add new language was speed of the language recognition.**

**mitranim**

**[16:37](#msg5fb007b2c950f95c4a8d33d0)They do have server-side rendering in addition to the fat client. Not sure what they use for that**

**Oldes**

**[16:40](#msg5fb0088174152347c234367a)Hm... maybe you are right.. looks that Red and Rebol are still missing in the current repo: https://github.com/highlightjs/highlight.js/tree/master/src/languages**

**mitranim**

**[16:41](#msg5fb008abc950f95c4a8d33d4)Seems like a weird argument. Just don't include them into automatic recognition, and be done with it**

**[16:41](#msg5fb008cef433175b7cfb3ff1)There are too many languages to reliably auto-detect, just give up and use explicit tags, everyone happy 🤷‍♀️**

**Oldes**

**[16:44](#msg5fb00950c6fe0131d4f5c024)Yes... maybe I should try to add it into Highlight.js repo. I don't remember why it's not there as I'm using it for years. I was fighting on too many places:)**

**[16:45](#msg5fb009b7f2fd4f60fc7323ca)Ah... here it is! https://github.com/highlightjs/highlight.js/pull/988**

**mitranim**

**[16:47](#msg5fb00a06f433175b7cfb3ff3)They made it easy for you: all new languages are automatically rejected 😁**

****Monday 16th November, 2020****

**Oldes**

**[23:21](#msg5fb3096206fa0513ddb90015)Ok.. so there is module which they wanted: https://oldes.github.io/highlightjs-redbol/**

**[23:21](#msg5fb30997b86f640704560e9b)I merged Rebol and Red together as it does not make sense to have these separated for something like syntax colors on web.**

**[23:23](#msg5fb309d8d37a1a13d6aea30c)To have support here on Gitter.. hm... they would have to be so kind to enable it :-/ I may try to ask again, but I don't give it much chances.**

**[23:24](#msg5fb30a32d37a1a13d6aea41f)The code of the grammar is at least 5 years old and I'm not the best in regexps, so any improvements are welcome.**

****Tuesday 17th November, 2020****

**greggirwin**

**[02:58](#msg5fb33c5fd37a1a13d6af2a04)Welcome @mitranim! Thanks for jumping in with such support @Oldes. :+1:**

**micahwelf**

**[06:26](#msg5fb36cfdb86f64070456fec1)I have made some 5-star quality regular expressions for Nano syntax coloring of Zsh and others and I have been watching Red for years. My problem is I still don't understand Red well enough to make a useful program. The Actions/Syntax just doesn't follow linear thought in my mind. If I can understand it well enough, I might be able to write the regular expressions for syntax highlighting for you. Do you have any interest in collaborating with me? &lt;dev@micahwelf.us&gt;**

**vazub\_gitlab**

**[09:08](#msg5fb393202a354407152e5b92)@micahwelf I am currently working on Red syntax highlighting for Micro editor - there are definitely lots of challenges. We can talk and share some experiences if you like.**

**Oldes**

**[11:42](#msg5fb3b714c6fe0131d4fe8528)Hi @micahwelf , thanks for the offer, but to be honest, I'm now not much interested in it. I just had to force myself to finish the HLJS story, which started 5 years ago. While doing it now, I had a chance to touch `node.js` testing and development and I must say, that it was not the most pleasure part of it. I also tried the use of Github pages and there I can say, that I was quite surprised how useful it can be to make a simple presentation for a project without need of self hosting.**

**[11:47](#msg5fb3b841b86f64070457b8fa)The lexer is pretty usable for my purposes and if someone want to improve it, \[there is the source](https://github.com/Oldes/highlightjs-redbol/blob/master/src/languages/redbol.js). It's just that I'm not too proud of it .. it can be definitely better written, I would not give myself 5 starts ;-)**

**greggirwin**

**[18:25](#msg5fb4158eb4283c208a6ef2ca)Every little bit of collaboration can help. Thanks all!**

****Wednesday 18th November, 2020****

**ALANVF**

**[02:22](#msg5fb4857274152347c23f1c80)I've done a lot of syntax highlighting myself. could help if anyone is interested**

**[02:25](#msg5fb48614b4283c208a700670)for example, this is one I made for Red's sister language Io: https://marketplace.visualstudio.com/items?itemName=theangryepicbanana.language-io**

****Saturday 21st November, 2020****

**Oldes**

**[12:07](#msg5fb902ef2a6c794bd8fadc13)While working on the syntax rewrite.. there come to my mind, if it would be really so heretical to ask addition of real multiline comments?**

**GiuseppeChillemi**

**[19:28](#msg5fb96a73477a8b480c0c3b47)@Oldes without `comment {}` ?**

****Sunday 22nd November, 2020****

**greggirwin**

**[00:51](#msg5fb9b6202a6c794bd8fc80df)@oldes, a) What's the biggest benefit of them? b) what syntax do you propose? We put quite some thought into the heredoc format as an option a while back.**

**luce80**

**[09:35](#msg5fba30f1fe857d71dc89e9e1)@greggirwin a) Being able to put comments inside expressions. b) We could copy from @Geomol 's World language if he don't bother.**

**GiuseppeChillemi**

**[10:58](#msg5fba4454fe857d71dc8a1381)Non full line comments.**

**hiiamboris**

**[16:04](#msg5fba8c122a6c794bd8fe4535)@luce80 a) unlikely expressions will be readable after that**

****Monday 23th November, 2020****

**Oldes**

**[07:45](#msg5fbb688b29cc4d734826c294)World language seems to use `\{ ... }` for multiline comments.**

**[07:51](#msg5fbb6a0e0451324f152dcb32)@greggirwin the biggest benefit would be, that one could comment out big chunks of code which would not be loaded like with use of `comment` function, which only ignores the value and return `unset`. The new heredoc format does not solve this... you still end up with possibly large strings being loaded.**

**[07:53](#msg5fbb6a94ba69631c74956413)But if there is not strong need for it... I can live with single line comments... all good editors today allow multiline editing and so adding `;` at start of each line is not so difficult.**

**[07:54](#msg5fbb6ac7e6f2b51c68afb7b7)I would not want to use comments inside (single line) expressions.**

**planetsizecpu**

**[07:58](#msg5fbb6bbf2cb422778f311bbc)I use comments in practically all lines of code and feel very comfortable with the current comment system, I don't see any need for more. IMHO there are more important aspects where to put the effort.**

**henrikmk**

**[12:18](#msg5fbba8b1477a8b480c11312b)I don't think I would want embeddable comments, as that leaves less room for Red to generate or interpret data and makes it easier to accidentally make data into comments and comments into data. Having semi-colon to go to the end of the line is good enough for me.**

**GiuseppeChillemi**

**[16:05](#msg5fbbddc6bba6a3778b79a5ce)I like inline comments because you can use to embed foreign precise documentation structures in them and also you can add comments like `select [block] /{<- the search element} 'b /{<-the value to search for}`. A good editor could also show/hide comments on demand.**

**greggirwin**

**[21:21](#msg5fbc27bdb03a464f082a86a9)The overhead of `comment` strings shouldn't have a measurable impact. If you're commenting out so much that they do, it would be good to know where. Now, if you use `comment` with a block, it will lex everything, so there's more overhead. Like most people I use the block/multiline comment support in my editor, which works better for me. We already have the issue in languages where missing brackets can be a pain to track down in some cases. Having less opportunities to mess them up helps.**

**@GiuseppeChillemi that's where I use line breaks or an out-of-band comment.**

**For Red itself, we have single line and `comment` syntax. We can also include values that are simply ignored in some cases. What you can't do is inline values in expressions that are invisible to Red. But because we are what we are, writing a preprocessor to do so is the way to add it for yourself or show others how you want it to work.**

**GiuseppeChillemi**

**[21:48](#msg5fbc2e29fe857d71dc8ecac8)@greggirwin Toomas has already given me a solution at pre-lexer level some time ago. Things here are boiling but I have very little available time. But I promise to show something sooner or later.**

****Tuesday 24th November, 2020****

**hiiamboris**

**[16:36](#msg5fbd367ee6f2b51c68b4392c)on my gitlab**

**[16:37](#msg5fbd36dbba69631c7499e8c5)(this was supposed to be put by Gitter into /gui-branch)**

**GiuseppeChillemi**

**[22:47](#msg5fbd8d792cb422778f3690b3)@hiiamboris who are you answering to?**

****Wednesday 25th November, 2020****

**greggirwin**

**[00:54](#msg5fbdab5c771c185e0ec59681)I think it was about the transparency question.**

**GiuseppeChillemi**

**[10:06](#msg5fbe2cc12cb422778f380973)Kaspersky total security is really annoying: even if you disable any check and add Red to the exclusion list, it keeps warning and blocking it. I have to disable the antivirus!**

****Saturday 28th November, 2020****

**Rebol2Red**

**[17:34](#msg5fc28a09afc2922cf2c48557)@greggirwin "We already have the issue in languages where missing brackets can be a pain to track down in some cases"**

**Maybe have a look at geany (absolutely free). If clicked after or before a opening paren [({ the closing paren is blue highlited. Too bad i have not found syntax highliting for Red or Rebol. But i use it a long time and i am still very happy with it. There are a lot of (very) usefull things like a color selector, plugins (to autosave), show all whitespace (tabs, newlines and spaces), automatically loads the files you were editing (after closing and reopening geany) and build commands to name a few.**

**https://www.geany.org/**  
**Geany is a powerful, stable and lightweight programmer's text editor that provides tons of useful features without bogging down your workflow. It runs on Linux, Windows and MacOS is translated into over 40 languages, and has built-in support for more than 50 programming languages.**

**Note: It is easy to make build commands for Red or Rebol or any other language.**

****Sunday 29th November, 2020****

**greggirwin**

**[00:42](#msg5fc2ee76ba0b7a0fc5363afb)I looked at geany some time back. Maybe I'll check it out again. The issue, though, is with language itself. Also how we build small and large software artifacts.**

**Numeross\_\_twitter**

**[17:50](#msg5fc3df658c7c4215bb9877c6)Hello everyone ! I'm getting hooked by this language, and I came across it when I was getting really disinterested by programming, which means a lot.**  
**I really love the syntax and its elegance/flexibility, and I'm wondering how I could implement something like @'2+2x\*cos(2)' for math formulas. I'd like to do that as a first exercise, but I'm a bit lost. Would that be a type ? Could someone point me what I need to know, without revealing too much ? Thanks !**

**hiiamboris**

**[21:11](#msg5fc40e75b956e94695a7f6a9)Hi @Numeross\_\_twitter and welcome ;)**  
**If you want to build a formula-to-code translator, you should learn \[Parse dialect](https://www.red-lang.org/2013/11/041-introducing-parse.html). Check out the https://gitter.im/red/parse room for maybe you'll find some ready bits. There's also https://gitter.im/red/help room for general help and learning.**

**loziniak**

**[21:35](#msg5fc414288292a93eb1082f6e)@Numeross\_\_twitter and perhaps you just want to compute the result of this formula. Then most important is to watch out for operator precedence, which is unusual in Red. Read about \[evaluation order](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#expressions-and-evaluation-order).**

****Monday 30th November, 2020****

**ldci**

**[09:09](#msg5fc4b6cd9cdc3e0d754d8362)Hi folks. A new version of redCV is here: https://github.com/ldci/redCV. This version is compatible with the new Red compiler and includes a new matrix object developed with Toomas Vooglaid during the summer break.**

**GiuseppeChillemi**

**[16:02](#msg5fc517afa83ffc46af859986)@ldci Is Matrix also a Datatype other than an object?**

**ldci**

**[16:26](#msg5fc51d23b956e94695aa8543)@GiuseppeChillemi : only an object but with a lot of methods. After discussion with Xie Qingtian this seems sufficient.**

**GiuseppeChillemi**

**[16:51](#msg5fc5231c9af4396683ccc721)Ok, I have hoped to see the birth of a new datatype and learn from it.**

**rebolek**

**[17:09](#msg5fc5274c150b213e98049eec)@GiuseppeChillemi have a look at `money!`, it's a very recent newborn type**

**GiuseppeChillemi**

**[17:20](#msg5fc529c4226043667c2564f6)Yes, this one is interesting too as it seems more complex but I could be wrong.**

**[17:24](#msg5fc52ad4223b350d80e5edf0)GIT Hub commits are a source of treasures. Every addition lets you understand how the whole system is orchestrated and what you should do to add a similar feature.**  
**I think we should create a page linking all the new features commits to let people study the work that has been done.**

**greggirwin**

**[22:18](#msg5fc56f9ef7e4510fcefe4141)Welcome @Numeross\_\_twitter ! Coincidentally, @toomasv recently started some fun chat on \[expression processing](https://gitter.im/red/parse?at=5fbeb1d329cc4d73482f3a92) in the `parse` room. It is diving into the deep end if you're new to Red, but we're here with life preservers.**

****Tuesday 1st December, 2020****

**MarkoSchuetz\_gitlab**

**[17:48](#msg5fc681f23975226f4a3d9cb8)I just came across red a few days ago and have so far only found time to read a bit about it. I would be curious to see discussions of architectural/design ideas including clean architecture or domain-driven design in relation to red.**

**greggirwin**

**[19:47](#msg5fc69dc0c6d7a6543d0d3b0b)Welcome @MarkoSchuetz\_gitlab! If you start at red/home here, you'll find all the rooms. We don't have a specific room for design, so this one is fine for that right now. It's general.**

**You'll find that DDD in Red falls heavily into the realm of Red as data, and leveraging dialects. e.g. if you're writing a GUI, you use `view` and VID (Visual Interface Dialect). If you're writing parsers and your own DSLs or dialects, you use `parse`. `View`, `parse`, `draw`, and one more are the primary standard dialects in Red.**

**But you can't use dialects without having underlying data, and that's one of the most important things to understand in Red. There are a lot of datatypes, which allows you to combine them in ways that suit your needs. Just as natural language is built up from parts of speech, but combined in endless ways.**

**Red is a descendent of Rebol, which was originally design as a messaging language. Not just IPC, but the exchange of information between people and machines. This is central to architectural thinking, and more languages would benefit from it, Red just makes it more visible.**

**[19:54](#msg5fc69f8732153f0d443e0216)A couple old examples. I hope others will post links to some as well.**

**- https://gist.github.com/greggirwin/38883ca5109175a60896d2f406ee49f6**  
**- https://gist.github.com/greggirwin/e8b2b3c9310df477d31529297292c2de**

**MarkoSchuetz\_gitlab**

**[21:45](#msg5fc6b98d489041542ff15e1e)@greggirwin: Thank you for the welcome and the starting points.**

**GiuseppeChillemi**

**[22:45](#msg5fc6c78532153f0d443e6ded)@MarkoSchuetz\_gitlab Go away, the community very helpful, the language is powerful, everything is addictive. Once you get in, you'll never go out. You have been warned!**

**ALANVF**

**[22:45](#msg5fc6c79a32153f0d443e6dfc)lmao**

**greggirwin**

**[22:46](#msg5fc6c7b07fe316314d9aa4ca):^) It's true. Once you take the Red Pill, there is no going back.**

****Wednesday 2nd December, 2020****

**Numeross\_\_twitter**

**[12:50](#msg5fc78d7cf2a33f3163ae60dc)Imagine if the pill was easier to swallow :x**  
**This makes me think of this http://worrydream.com/LearnableProgramming/**  
**It's an incredible collection of ideas to make programming easier to learn**

**hiiamboris**

**[15:42](#msg5fc7b5d832153f0d4440ad72)Great site, thanks ;)**  
**I especially loved how seamlessly they turned a table into a plot.**

**toomasv**

**[17:02](#msg5fc7c8b3924a486dd9e27144)Yes, good reading!**

**greggirwin**

**[17:47](#msg5fc7d3464b2a214fbdc616a3)Two quick thoughts:**

**1) This is where I hope the idea of our lab tools will go. I think `playground` is the other term some langs use now.**  
**2) For an IDE, the idea of templates, or complete calls with default args, can work with Red even though we have free ranging evaluation. Maybe because I never quite got used to them, I rarely make use of the templates in my editor, though they pop up and remind me they are there. I still think they're useful, especially when learning.**

****Thursday 3th December, 2020****

**ghost~5f44e0b5d73408ce4fed1a80**

**[21:19](#msg5fc9564d653db67162830ca3)Are there legal reasons why one would have to manually fetch Rebol and not just have a script that pulls it, or?**

**[21:20](#msg5fc95689a8af805088fe0eac)Ideally you'd think there would be a "bootstrap.red" file or something and you use the latest supplied binary -- and have that do the rest for you.**

**[21:23](#msg5fc9575a3d46ef481c66c0ec)I guess it's not too-too different from my stated ideal; Like basically would do the same process you do with Red right now ... just the Rebol step would be hidden lol**

**greggirwin**

**[21:25](#msg5fc957e4653db671628310a1)We haven't gotten requests for a different bootstrap setup, but we have https://github.com/red/red/wiki/%5BDOC%5D-Installing-Red-and-Getting-Started and I think some other notes (@dander did a Chocolatey setup I think). Most people pull the binary, leaving the Rebol single download dependency to the more hardcore. ;^)**

**ghost~5f44e0b5d73408ce4fed1a80**

**[21:29](#msg5fc958beff927f50824ba08e)Might contribute to that wiki; If I pick anything useful / worthwhile from the experience lol**

**[21:44](#msg5fc95c4e7707e845d5089ecf)Is x86\_64 support planned or somepoint or is it not a priority?**

**hiiamboris**

**[21:50](#msg5fc95daccb64ed40a5d7c01b)@jsgrant https://gitter.im/red/red?at=5e09152cd5a7f357e6a1af83**

**ghost~5f44e0b5d73408ce4fed1a80**

**[21:56](#msg5fc95f047707e845d508a92c)@hiiamboris Think that's completely fair; thank you**

****Friday 4th December, 2020****

**dander**

**[19:09](#msg5fca898456507459cc624499)@greggirwin @jsgrant There is a Chocolatey package, but only for the last release version (which is quite old by this point). It'd be possible to do nightly choco packages, but would require integration with the build system, as each build needs to be re-submitted/approved in the Chocolatey repository. I think the simplest way (for me anyway) is the \[Scoop package](https://github.com/red/scoop-bucket). I periodically run `scoop update red -f ; "q" | red --cli ; red` to update and compile both consoles. No need to fiddle with the PATH or script wrappers this way too.**  
**I suppose the scoop instructions should be added to the download page.**

**greggirwin**

**[21:34](#msg5fcaab7954596159c63cba25)Thanks @dander. @x8x can you make that happen?**

**rgchris**

**[21:43](#msg5fcaad6e538b144f11d8e323)@Oldes Do changes to your Sublime package propagate to Linguist? Do you have changes that address the binary whitespace issue?**

****Saturday 5th December, 2020****

**Oldes**

**[07:22](#msg5fcb3547c5f7642d2ed818b3)@rgchris it should.. but it takes time.. I think that to have it propagated to Github.. there first must be a new Linguist release https://github.com/github/linguist/releases**

**planetsizecpu**

**[10:39](#msg5fcb6369c5f7642d2ed88536)Welcome on board @jsgrant**

**x8x**

**[12:31](#msg5fcb7dac2d8b7c76384309ce)Looks like Telegram has issues at the moment https://twitter.com/hashtag/telegramdown**

**greggirwin**

**[19:08](#msg5fcbda9ccf3760558c0e0695)We have an open ticket for \[SQLite binding](https://github.com/red/code/issues/70), and SQLite support would be great to have. If someone wants to tackle that, we will sponsor the work.**

**GiuseppeChillemi**

**[21:11](#msg5fcbf79d3b3e7e2a2f9ec400)There are experienced coders on this topic. I think good thing can be done.**

**rgchris**

**[22:13](#msg5fcc06215f4d634d9dcbbf5a)@Oldes Ooft, that's too bad—hopefully not too long until the next release**

****Sunday 6th December, 2020****

**Oldes**

**[00:59](#msg5fcc2d0c75f7397e29f69034)I wonder why it is so important to you now. Current version was there several years and there was no complain.**

**greggirwin**

**[01:03](#msg5fcc2dcced6fe038e56ba23c)So I should say "Yeah, we don't care about that."? Things fall through the cracks, times change, and...isn't it a good thing for us to support the community, no matter when it happens?**

**Oldes**

**[01:05](#msg5fcc2e6ba03ad8762a00ecb5)It shoud be fixed now.. when it propagates.. it is not that I don't want to fix something.. I wonder what is @rgchris working on now.. wn**

**[01:05](#msg5fcc2e762b3e824d8c299a84)When he need it.**

**greggirwin**

**[01:06](#msg5fcc2ea0cf3760558c0ec8cf)Apologies if that's snarky of me, so let me add that maybe it struck me as worth supporting now because full I/O is coming, we have more features in place, and it's a lightweight cross platform data solution that seems like a good first foray into DB support.**

**Oldes**

**[01:07](#msg5fcc2ed4ed6fe038e56ba575)Btw..`zerofill dbs-head dbs-tail` was R/S runtime call which should be now replaced with `zerofill dbs-head dbs-tail 0`**

**[01:07](#msg5fcc2ee81281b03575c671d8)Sorry.. `fill ....`**

**[01:08](#msg5fcc2ef8ccac732a3a02ab9d)I'm just on mobile.**

**Numeross\_\_twitter**

**[11:39](#msg5fccc303c980287e367b5c1f)I wonder how a DOM in Red would be like... Not tied to XML, would that allow for a graph structure instead of a tree ?**  
**Would that allow "this thing is in between these two other" or "trace a line between these" more easily ?**

**GiuseppeChillemi**

**[12:50](#msg5fccd3b34b6e8f2d3c819ad5)@greggirwin Could I make a proposal?**

**rgchris**

**[15:42](#msg5fccfbe675f7397e29f85dbf)@Oldes I'm not sure what you're implying—I was commenting on it because you'd brought it up earlier in this thread. I had a similar request from the Linguist folks based on the TextMate bundle after you didn't initially respond to them, but their preference was to base it on Sublime. I would have offered a patch based on whether you had or hadn't addressed it**

**[15:59](#msg5fccffcba03ad8762a02bddd)On reflection, you may have interpreted my comment 'that's too bad' as directed at you. It was not—just disappointed that there's no quick recourse on the Github/Linguist side of things. All the same, your response was still uncalled for**

**greggirwin**

**[19:04](#msg5fcd2b3dcf3760558c10ed91)@Numeross\_\_twitter you can create graph structures easily using blocks, maps, or objects.**

**[19:07](#msg5fcd2be02d8b7c763846dbab)In the context of UIs, it's sometimes called a scene graph.**

**[19:07](#msg5fcd2bf6c5f7642d2edc9b34)@GiuseppeChillemi people can always make proposals. :^)**

**Numeross\_\_twitter**

**[19:07](#msg5fcd2c0175f7397e29f8ceb6)I see, thanks**

**greggirwin**

**[19:09](#msg5fcd2c5dccac732a3a04e247)@rgchris and here I thought Oldes' comment was about me and SQLite. Ah, chat confusion.**

**rgchris**

**[19:11](#msg5fcd2ce1cf3760558c10f197)I could still be misreading the intent too. Chat is a limited medium 🤷‍♂️**

**GiuseppeChillemi**

**[20:13](#msg5fcd3b78ccac732a3a0505b1)@greggirwin Why don't we port the PostgreSQL driver of this obscure developer https://www.softinnov.org/rebol/pgsql.shtml ? It seems a nice start to add everything needed!**

**greggirwin**

**[20:20](#msg5fcd3cfe2b3e824d8c2bec48)Postgres and MySQL will come after ports. SQLIite, I think, can all be done via FFI. Of course, it can wait, too, so there's a consistent interface.**

**[20:20](#msg5fcd3d0ecf3760558c1117a5)Personally I think SQLite is much more valuable to a Red audience.**

**GiuseppeChillemi**

**[20:39](#msg5fcd41831281b03575c8d85d)I was supposing that a big database engine could give a better picture for a consistent interface, that it would be easier to scale down. The opposite is more difficult (I think, but I have no experience about this topic)**

****Monday 7th December, 2020****

**rebolek**

**[06:50](#msg5fcdd0c8c980287e367dcf63)@GiuseppeChillemi checkout the IO branch and you can start porting today.**

**GiuseppeChillemi**

**[09:35](#msg5fcdf771ed6fe038e56fb8c5)I would like a lot, I am starting to have some good skills but not so good for such task. (I think)**

**Oldes**

**[10:37](#msg5fce05cd5f4d634d9dd042d4)@rgchris I just wanted to know, if you are using comments inside binary values already... that's all... could you please tell me, where I was not responding to Linguis folks? I'm not aware about it.. maybe I just missed it, because all other activities I have. Btw... I was recently asking in \[Linguist chat here in Gitter](https://gitter.im/github/linguist?at=5fbd10a8f5849839adeed219) how it is with their support of the new Sublime syntax, but without any answer. I suppose they are still only using the old `tmLanguage` file.**

**[10:39](#msg5fce0651ed6fe038e56fdd12)Or maybe `JSON-tmLanguage` file instead... if they don't want to use your TextMate bundle.**

**rebolek**

**[10:59](#msg5fce0b062b3e824d8c2dda3a)@GiuseppeChillemi try it, you§ll be surprised how easy it is. Of course, you can ask questions, I would be glad to help.**

**Numeross\_\_twitter**

**[11:13](#msg5fce0e583b3e7e2a2fa381dd)Where is this branch ?**

**rebolek**

**[11:34](#msg5fce13441281b03575cac4e1)https://github.com/qtxie/red/tree/IO2 It’s an experimental branch, so expect problems. Reporting them is unnecessary.**

**Numeross\_\_twitter**

**[11:40](#msg5fce149e4b6e8f2d3c848bab)thanks !**

**GiuseppeChillemi**

**[11:50](#msg5fce1718fb7f155587acf363)@rebolek I assume your phrase as "reporting them if not already reported" or "don't report any issue" ?**

**rebolek**

**[12:18](#msg5fce1d995f4d634d9dd081dd)Don’t report any issue. It's not in master yet and there's high probability that the issue is known already.**

**rgchris**

**[15:45](#msg5fce4e1cc980287e367f1912)@Oldes I’m not using comments in binary (which I believe is only supported in Red) but it’s still apparent that whitespace characters in binary values are being marked as an error. I did update the tmbundle to support that after spotting your post (I’m not actually aware if anyone other than me is still using TextMate or the bundle, but hey, you never know, and there was that \[one issue](https://github.com/rgchris/rebol-tmbundle/issues/1)). If they do use the tmbundle, both issues (comments/whitespace in binary) were addressed as of two weeks ago (though I thought I’d already addressed the whitespace issue—made doubly sure), but I’m skeptical that they do and that the very least hasn’t propagated in that time.**

**MarkoSchuetz\_gitlab**

**[18:20](#msg5fce727a2d8b7c76384a249b)Is there a resource addressing the (operational and denotational) semantic foundations of Red/REBOL?**

**ldci**

**[18:49](#msg5fce795575f7397e29fc18bf)Have a look : https://twitter.com/fjephe/status/1336017911903870981**

**hiiamboris**

**[18:54](#msg5fce7a68ccac732a3a0827db):+1:**

**toomasv**

**[20:01](#msg5fce8a10c5f7642d2ee01da7)Congratulations!**

**greggirwin**

**[20:16](#msg5fce8d9accac732a3a086488)Fantastic @ldci!**

**[20:17](#msg5fce8dc6c980287e367fdc3f)@MarkoSchuetz\_gitlab sadly, Carl only talked about it informally here and there.**

**GiuseppeChillemi**

**[22:21](#msg5fceaae94336ca04e5dacc18)@rebolek I have looked at PostgreSQL driver and I agree with you: it's not so difficult, I think I can do port it!**

**[22:22](#msg5fceab393a841040f848e351)I need documentation on Red ports and Schemes implementation and some support. Is there something available? Demos/Docs/Tests?**

****Tuesday 8th December, 2020****

**rebolek**

**[06:55](#msg5fcf23742e3275286a111bc6)@GiuseppeChillemi see `%tests/IO`. If you start with TCP-client or HTTP-client, you can turn it into Postgre-client easily. If you need some advice, feel free to ask.**

**MarkoSchuetz\_gitlab**

**[14:24](#msg5fcf8cb0af63371fc876720b)@greggirwin ... an informal execution model then?**

**GiuseppeChillemi**

**[18:13](#msg5fcfc2642e3275286a12bfea)Please, take a look at the development news update scheme of \[this project](https://gajim.org/): they are short and concise and have a monthly base. I think they would be nice to adopt it on our main site as it takes really no time to write one.**

**greggirwin**

**[19:56](#msg5fcfda6e8cdd4340ff0ae691)@MarkoSchuetz\_gitlab my guess is that Carl studied and used denotational semantics more from a language perspective, domain specificity, and data types, than a mathematical one.**

**[20:00](#msg5fcfdb71ec880b6e73ed27a9)@GiuseppeChillemi yes, we hoped to do that, and Lucinda headed it up, but as the team changed, it fell off our radar. We even have a wiki page of interesting things that come up in chat, for topics. We haven't been able to keep that up either.**

**[20:03](#msg5fcfdbfe2e3275286a130a1e)It's actually quite a bit of work, though it may not look like it.**

**GiuseppeChillemi**

**[20:35](#msg5fcfe375f69c5c540c37c776)@greggirwin I guessed from the recent unusual silence that you were more working than chatting and something big was involved. So I have kept the silence. I prefer more having a new Android Version than reading a bulletin every day ;-) but also I think that such a simple monthly bulletin is a single task and would help to keep the faith.**

****Thursday 10th December, 2020****

**MarkoSchuetz\_gitlab**

**[17:48](#msg5fd25f8303da931ac243eda1)Having everything in place for writing web apps with mobile clients (i.e. red server, red client on Android) would be #1 on my personal wish list...**

**[17:55](#msg5fd260f85a63c5610520ebc3)BTW, I get**  
**`Downloading Android binary tools... aapt...** User Error: Error. Target url: https://static.red-lang.org/droid-tools/linux/aapt could not be retrieved. Server response: HTTP/1....`**  
**when running `rebol build.r` in `red/bridges/android`**

**[18:40](#msg5fd26ba691e8cb3e8cf28f2a)OK, I put aapt, ziplalign, and android.jar in the corresponding directory. Now I get**

**[18:41](#msg5fd26bbd28a57c581b05ca33)**  
**`*** Compilation Error: undefined symbol: red/platform/prin-2hex* *** in file: %/home/marko/src/red/system/runtime/utils.reds *** in function: prin-molded-byte *** at line: 40 *** near: [red/platform/prin-2hex* i prin-byte #")"]`**

**GiuseppeChillemi**

**[18:47](#msg5fd26d59b6b8f41abb838110)Maybe it's an old version. I have to wait for the new updated one. Many things have changed!**

**greggirwin**

**[19:02](#msg5fd270e0b6b8f41abb838b1d)There have been 3'000 commits since the old Android code was working, but Christmas is coming. :^)**

****Friday 11st December, 2020****

**MarkoSchuetz\_gitlab**

**[15:42](#msg5fd393720697c1210db60878)@greggirwin Do you remember a tag, date, ... when the Android target was working?**

**Numeross\_\_twitter**

**[16:03](#msg5fd3984b67034a3e9000d370)@MarkoSchuetz\_gitlab this might help https://github.com/red/red/commits/e0a31a954b223ca9767c73d99ce26891d83440c1/runtime/platform/android.reds**

**[16:03](#msg5fd398630697c1210db6143e)the 3rd pass the checks**

**[16:05](#msg5fd398d11f36292125e5bde4)oh it's older than \[this](https://www.red-lang.org/2018/04/sneak-peek-at-red-on-android.html) post nvm**

**greggirwin**

**[21:02](#msg5fd3de611f36292125e67cb4)@MarkoSchuetz\_gitlab I'm sorry, but I don't. Every day new information comes in and pushes old stuff out of my wetware cache.**

****Sunday 13th December, 2020****

**ALANVF**

**[04:27](#msg5fd598290697c1210dbaa230)anyone doing AoC in Red? just curious**

**Oldes**

**[08:30](#msg5fd5d131c829e14ef28fe0da)@ALANVF what is AoC?**

**toomasv**

**[08:40](#msg5fd5d36603da931ac24c07f1)\[Adventofcode](https://adventofcode.com/2020) puzzles**

**[08:40](#msg5fd5d39a2a954a51a9ca9745)@ALANVF I've done it three years, but not this year.**

**ALANVF**

**[18:13](#msg5fd659cc3dd3b251a403b39c)ah ok**

**greggirwin**

**[22:55](#msg5fd69be03646a85814e92441)I did it a couple times, but also not this year.**

****Monday 14th December, 2020****

**qtxie**

**[08:31](#msg5fd722f53dd3b251a4057580)If anyone want to try the Direct2D Draw backend, here you go : https://github.com/red/red/discussions/4764**

**pekr**

**[08:59](#msg5fd7297a82222960e4e459a4)Awesome, thanks 🙂**

****Wednesday 16th December, 2020****

**MarkoSchuetz\_gitlab**

**[19:37](#msg5fda61f58deebc230c82634a)Is**  
**`do func [ /local x y z ] body`**  
**equivalent to the Rebol**  
**`use [x y z] body`**  
**?**

**greggirwin**

**[20:06](#msg5fda68da3a35fc2758ed82f0)Not quite, because Red simply returns the func when you `do` it. The concept is the same, you just need to call the func, rather than `do`ing it. e.g.**  
**`>> body: [print 'x] == [print 'x] >> do func [ /local x y z ] body == func [/local x y z][print 'x] >> fn: func [ /local x y z ] body == func [/local x y z][print 'x] >> fn x >> do reduce [func [ /local x y z ] body] x`**

**hiiamboris**

**[20:53](#msg5fda73b13a35fc2758eda161)Keep in mind `func` traps `return`/`exit` and redefines `local`. So it's not a solution.**

**MarkoSchuetz\_gitlab**

**[20:54](#msg5fda741d3f9a136cf2b98ab7)Ahh, so this is still insufficient**  
**`use: func [ vars [block!] body [block!] ][ do reduce [func insert vars to-refinement 'local body]]`**

**hiiamboris**

**[20:56](#msg5fda74697beb2f6e63b76c06)Yes, it's not sufficient. `context` is an alternative but it also traps `return`, and also redefines `self`.**

**[21:15](#msg5fda78e22ab96f3c5f7f06e9)BTW your solution modifies original `vars`.**

**greggirwin**

**[21:48](#msg5fda80a48deebc230c82b516)Good points @hiiamboris.**

**mbennette68**

**[21:55](#msg5fda82651a5c0e6cec096b96)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/o62y/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/o62y/image.png)**

**[21:56](#msg5fda82a61082b94fe1d6068b)Hello, I am trying to use Red with Visual Studio Code using Red 0.4.2 Extension but no matter what I do, I can't seem to get it to work. It only seems to work for me with extension version 0.3.5 or below but it throws multiple errors thus it is unstable at best. Has anyone been able to get the newer Red 0.4.2 extension to work with latest Stable Red Language ?**

**GiuseppeChillemi**

**[22:10](#msg5fda85bf3f9a136cf2b9bc2c)help func**

**[22:10](#msg5fda85e77beb2f6e63b79c59)Ooops, I have exchanged GITTER for the consolle! I must be really tired!**

**qtxie**

**[23:07](#msg5fda931c3f9a136cf2b9de8e)@mbennette68 Seems you didn't regenerate the Red CLI console.**  
*** Try to delete all the `console-xxx` executables in folder`C:\ProgramData\Red`(Windows) or `~/.red`(Linux or macOS).**  
*** Then download the latest Red binary (Automated builds), run `red.exe --cli` in the terminal.**

**[23:09](#msg5fda93a2b685314fe7858c61)@mbennette68 Latest Stable Red version cannot work, use the Automated builds one.**

**mbennette68**

**[23:22](#msg5fda96c1297f0c4de887f69d)@qtxie Thank you! I will try and see if it works :)**

****Thursday 17th December, 2020****

**mbennette68**

**[00:22](#msg5fdaa4c53f9a136cf2ba07ec)@qtxie**  
**Hello,**  
**I deleted all the console-xxx executables in folderC:\\ProgramData\\Red(Windows).**  
**I deleted everything in that folder, actually.**  
**I downloaded latest automated build and executed red-15dec20-708c7c277.exe --cli**  
**This gave me two files, console-2020-12-15-57547.exe &amp; crush-2020-12-15-57547.dll**  
**I installed the latest VSCode Red Extension (v0.4.2)**  
**Renamed red-15dec20-708c7c277.exe to red.exe and saved @ C:/Development/RED/red.exe**  
**I set the VSCode Red Path to C:/Development/RED/red.exe in both User and Workspace.**  
**Tried to run interpreter on simple red script:**  
**-------------------------------------------------------------**  
**Red \[]**  
**print "Hello World"**  
**-------------------------------------------------------------**  
**VSCode output:**  
**\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\***  
**Microsoft Windows \[Version 10.0.18363.1256]**  
**(c) 2019 Microsoft Corporation. All rights reserved.**

**C:\\Development\\Source\\Rebol**  
**&gt;cmd /c '"C:/Development/RED/red.exe" --cli "c:/Development/Source/Rebol/hello.red"'**  
**The filename, directory name, or volume label syntax is incorrect.**

**\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\***  
**What am I doing wrong?**

**Thanks,**  
**MB**

**qtxie**

**[03:43](#msg5fdad3dd65ba284dd8392e71)@mbennette68 It's a bug. There is a PR for it: https://github.com/red/VScode-extension/pull/48**

**mbennette68**

**[04:30](#msg5fdadeebefa9c806fbd6b4d7)@qtxie**  
**Ok, I understand.**  
**I will stop using the VSCode editor until a solution is found and go back to nodepad++**  
**and a regular DOS Terminal. It is just my opinion, but I think there is a need for a, dedicated, IDE for this language as it has a lot of potential especially for people sick of other bloated languages. If Red had something similar to the RStudio IDE for the R Language, it would surely accelerate adoption.**

**Thank you for your help.**

**Best regards,**  
**MB**

**qtxie**

**[04:58](#msg5fdae570e83452230f640885)@mbennette68 I merged the fix. I'll try to push a new version today. It'll take a lot of time to build a dedicated IDE. The core part of the IDE is the editor. VSCode is quite good as an editor. I don't think we can build a better one given that how many man months has been put into it.**

**[04:59](#msg5fdae5cc297f0c4de888a591)BTW, The plugin follows the \[Language Server Protocol](https://langserver.org/), any editor supports it will be able to use it.**

**MarkoSchuetz\_gitlab**

**[14:12](#msg5fdb67597cf32836bfc37916)@qtxie That's interesting to know. Is the red executable already implementing the LSP? With \[Emacs support for LSP](https://emacs-lsp.github.io/lsp-mode/) that might pave the way to editing Red in Emacs.**

**[14:13](#msg5fdb676c99256527beb7496e)Has anyone tried this?**

**[14:29](#msg5fdb6b5aa849dc4e10712524)How does one hide definitions in a `context`? From what I understand all the words introduced in a context are accessible from outside the context using path notation, right?**

**rebolek**

**[14:33](#msg5fdb6c2638044236c4b1f782)Yes, it’s all accessible. However, you can create anonymous context. Once modules are added, it would be possible to hide deffinitions.**

**Oldes**

**[14:34](#msg5fdb6c5c38044236c4b1f883)In R3 there is available `protect/hide`:**  
**`>> o: context [a: 1 b: 2 f: does[b] protect/hide 'b] == make object! [ a: 1 f: make function! [[][b]] ] >> o/b ** Script error: cannot access b in path o/b >> o/f == 2`**

**[14:36](#msg5fdb6ce56800ee401344ff08)@MarkoSchuetz\_gitlab you can use something like this in Red already:**  
**`>> f: context [a: 0 f: does[a: a + 1]] f: get in f 'f == func [][a: a + 1] >> f == 1 >> f == 2`**

**rebolek**

**[14:39](#msg5fdb6da69b548427b61915c8)@Oldes but:**  
**`>> context? second body-of :f == make object! [ a: 2 f: func [][a: a + 1] ]`**

**Oldes**

**[14:40](#msg5fdb6dc4b2edb34e15dd0a36)Yes... because Red does not copy.. which I consider to be an issue! But someone else may see it as a feature :-)**

**rebolek**

**[14:42](#msg5fdb6e6b3eb88d047f055dba)right :)**

**[14:43](#msg5fdb6e849b548427b61918a4)Anyway, proper support for this feature will come with modules**

**MarkoSchuetz\_gitlab**

**[14:49](#msg5fdb6fee38044236c4b2020b)Is a specification of the modules feature available somewhere?**

**rebolek**

**[14:51](#msg5fdb70797cf32836bfc3923f)You can find info about R3 modules, I believe it’s going to be similar (but somehow easier to use, I hope)**

**[14:52](#msg5fdb70a17cf32836bfc392cc)http://rebol.com/r3/docs/concepts/modules.html**

**Oldes**

**[14:54](#msg5fdb712027eaac4d64310243)I wonder what you consider to be difficult on R3's modules?**

**rebolek**

**[14:58](#msg5fdb7224a849dc4e1071374c)I haven’t used them in ages, but IIRC some stuff wasn’t very intuitive. Something with the isolated stuff as described here https://stackoverflow.com/questions/14420942/how-are-words-bound-within-a-rebol-module**

**Oldes**

**[15:02](#msg5fdb72f938044236c4b208ff)I should bookmark this SO link.. too long for reading it now.. but I'm sure there will be deep insight as it is Brian's post and he authored R3's modules.**

**rebolek**

**[15:03](#msg5fdb735bb2edb34e15dd1b14)Yes, I’ve read it in the past like 100x :-)**

**Oldes**

**[15:05](#msg5fdb739ee4b9a57b20421b62)I think that the biggest problem of R3's modules is lack of tests/examples.**

**[15:06](#msg5fdb7406b2edb34e15dd1d3c)And as Brian put many hours into this topic... if you request \_somehow easier\_, you basically request something more limiting.**

**rebolek**

**[15:08](#msg5fdb746627eaac4d64310d52)I believe that some of the options were confusing.**

**Oldes**

**[15:08](#msg5fdb74899b548427b61929e0)My second issue with R3's modules is that imported module does not overwrite existing words in user's context (for security reasons).. so it makes difficult to develop modules in console without restarting it (or manually unsetting all affected words).**

**rebolek**

**[15:09](#msg5fdb74c54e3d554d678178c1)I see I had the same problem: https://stackoverflow.com/questions/24904804/how-do-i-force-module-reload**

**Oldes**

**[15:27](#msg5fdb78ef3eb88d047f057dda)But again.. what you see as an issue someone else (Brian) may see as a feature.**

**[15:28](#msg5fdb792895a4c604c4375bfd)I'm looking forward to see, which way will Nenad choose one day.**

**[15:35](#msg5fdb7ad06800ee4013452bae)I wonder how it is in other languages.**

**mbennette68**

**[15:49](#msg5fdb7e0bb2edb34e15dd3d7a)@qtxie**  
**Great!**  
**I'll try it when it becomes available.**

**I appreciate the help,**  
**MB**

**bferris413**

**[17:04](#msg5fdb8fa2b2edb34e15dd6fa4)Is there anything like a Red package manager around? @toomasv I've been looking over the last 6 months of (really cool) posts and demos in the sandbox room...is any of that stuff publicly released? I'm particularly interested in the inspector work. I haven't updated Red in months, forgive me if that's already a part of the console. In general though, is there somewhere I should be looking for collections of other people's Red code?**

**[17:05](#msg5fdb8fe8e4b9a57b2042697d)Also, is there a layout-management engine that handles dynamic GUI creation? (ie flexible layouts, autosizing, etc)**

**[17:10](#msg5fdb90f0d75db604c19691a7)I've seen posts in the past about works-in-progress, I think by both @hiiamboris and @toomasv, but I'm just curious where to find other's code beyond private or personal repos**

**[17:15](#msg5fdb921ab2edb34e15dd77f5)(longtime lurker, big fan of this project by the way. I hope to become a full-time user once sockets and networking are available)**

**Oldes**

**[17:39](#msg5fdb97cb7cf32836bfc40843)There is no module and package manager in Red yet.**

**dander**

**[17:43](#msg5fdb98d395a4c604c437b61e)@bferris413 there are lots of things to poke around through in the \[Examples on the wiki](https://github.com/red/red/wiki/Examples)**

**bferris413**

**[17:56](#msg5fdb9bd0a849dc4e1071ad11)Thank you, I'll take a look**

**toomasv**

**[18:13](#msg5fdb9fc64e3d554d6781ef0b)@bferris413 Thanks for your kind words! Console stuff is available \[here](https://github.com/toomasv/console-tools). I haven't touched it for some time now. But I use it locally, especially "history" and "notes". It was just a fun hack (unfinished) into console code, most probably not to be incorporated.**

**[18:24](#msg5fdba24d4e3d554d6781f825)I see it doesn't play well anymore :(, sorry.**

**mbennette68**

**[18:29](#msg5fdba3909b548427b619ab0f)@qtxie**  
**Hi, VSCode Red fix works now.**

**Thank you,**  
**MB**

**bferris413**

**[18:59](#msg5fdbaaa7e4b9a57b2042b3a2)Thanks for the responses all around! I'll check it out at least, I'm looking forward to getting back into the Red ecosystem**

****Friday 18th December, 2020****

**greggirwin**

**[02:21](#msg5fdc1236dbb17f28c585587e)I did quite a bit of module R&amp;D, and made notes. The main thing is that modules will be interpreted only to begin with, as modular compilation is a big task. On the bright side, that will let us vet the design before work goes into the compiler side.**

**We do need flexibility, but also constraints, and taking into consideration how packages and remote resources will work over time, e.g. versioning. That means it may end up with basic features that other things can be built on.**

**VuthHS**

**[09:02](#msg5fdc701293af5216fc4b4e7f)...using libRedRT built on 18-Dec-2020/8:28:41**  
**\*\** Red Compiler Internal Error: Script Error : copy expected value argument of type: series port bitset**  
**\*\** Where: rejoin**  
**\*\** Near: \[mold copy/part pos 40]**

**[09:02](#msg5fdc702cc746c6431cc08042)=&gt;type hello.red**  
**print "Hello World"**

**[09:02](#msg5fdc7040acd1e516f89d292f)=&gt;red-064.exe -c hello.red**

**-=== Red Compiler 0.6.4 ===-**

**Compiling D:\\\_scoop\\hello.red ...**  
**...using libRedRT built on 18-Dec-2020/8:28:41**  
**\*\** Red Compiler Internal Error: Script Error : copy expected value argument of type: series port bitset**  
**\*\** Where: rejoin**  
**\*\** Near: \[mold copy/part pos 40]**

**[09:03](#msg5fdc7076de608143152bc9ef)am new to red-lang, now try to compile hello.red in Windows 10, but get error as above**

**[09:04](#msg5fdc70a2c746c6431cc08118)Red expert please help to resolve the error above**

**[09:06](#msg5fdc71098bb73474693df2e2)Thanks.**

**[09:15](#msg5fdc733397312f4b6bd627a7)Well, now I know my problem, Thanks.**

**loziniak**

**[11:39](#msg5fdc94e48bb73474693e485a)Hello. I've come across this lovely list: https://github.com/sudhakar3697/electron-alternatives**  
**It's linked from Electron's Wikipedia article: https://en.wikipedia.org/wiki/Electron\_(software\_framework)#cite\_note-18 . Perhaps it would be nice to include Red on it? I can make a PR.**

**[12:51](#msg5fdca5e997312f4b6bd69ea9)&gt; There have been 3'000 commits since the old Android code was working, but Christmas is coming. :^)**

**Our families will hate you.**

**pekr**

**[14:43](#msg5fdcc00293af5216fc4c1d07):-)**

**greggirwin**

**[19:29](#msg5fdd03194eba353cdfe60446)Ah, Christmas, a time for technology to disrupt families. ;^)**

**[19:30](#msg5fdd0354aa6bb528c35a715d)@VuthHS Glad you solved it. What was your problem, in case others hit the same thing?**

**XANOZOID**

**[21:27](#msg5fdd1eab69ee7f0422adc7c6)Howdy guys! I'm looking through the libred document (https://github.com/red/docs/blob/master/en/libred.adoc)**  
**I'm trying to understand - what are the limitations and portability of LibRed? All I can find is that the build process doesn't seem to care about the OS target, it only cares about ABI. The only limitation I see is expected, which is just that it's 32bit. Any takers?**

**[21:30](#msg5fdd1f6f97312f4b6bd7df3f)Being that I see it (the libred header) exposes a way to read files, I would have assumed it depends on the platform**

****Saturday 19th December, 2020****

**loziniak**

**[14:10](#msg5fde09beac9d8e7463bc7521)&gt; I can make a PR.**

**Done: https://github.com/sudhakar3697/electron-alternatives#others**

****Thursday 24th December, 2020****

**GiuseppeChillemi**

**[14:12](#msg5fe4a1ce63fe03449617e04b)This is my way to support the Red team:**

**[14:12](#msg5fe4a1d3ce40bd3cdbfd7fa8)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/4qXE/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/4qXE/image.png)**

**mikeparr**

**[14:49](#msg5fe4aa7797312f4b6be9c72a)Honorable mention for Red in Sliding Block Puzzle challenge https://www.reddit.com/r/ProgrammingLanguages/comments/kgij3z/testing\_a\_new\_programming\_language\_to\_build\_a/**

**greggirwin**

**[18:43](#msg5fe4e15b4eba353cdff8aa46)Thanks @GiuseppeChillemi!**

**[18:45](#msg5fe4e1e2dbb17f28c59a816d)It's that time of year, and time to thank you all for being part of our community. It's been a challenging year for all of us, but being virtually together is where we lived even before the pandemic. I'm grateful to have been part of the team and community for another year, and look forward to a brighter 2021.**

**[18:48](#msg5fe4e29097312f4b6bea4e03)Now, it's time for the public announcment. @GiuseppeChillemi sneaked down the stairs early to open his gift from the Red team ;^), but for those who need a little Christmas, or a light in the dark winter night, \[DiaGrammar 1.0 is available!](https://www.redlake-tech.com/blog/2020/12/christmas-comes-a-few-days-early/). It's our first commercial effort, built entirely with Red technology, and we hope it will help developers everywhere, no matter what language they use.**

**[19:00](#msg5fe4e557dbb17f28c59a87e0)Thanks for posting @mikeparr!**

**&gt; Rebol / Red clearly smokes the competition -- concise and GUI**

**Woohoo!**

**[19:10](#msg5fe4e79297312f4b6bea59cf)We also have https://github.com/red/community/blob/master/games/tile-game.red.**

**[19:12](#msg5fe4e81363fe03449618862c)Should that be tweaked for inclusion on RC? There are no issues with it, but some comments and the `randomize` func aren't necessary.**

**hiiamboris**

**[19:29](#msg5fe4ec2f4eba353cdff8c42c)What would be cool for DG as the next step IMO is a youtube video demonstrating how it helps one achieve this or that use case.**

**greggirwin**

**[19:30](#msg5fe4ec6be7f693041f2d4515)We have prototype videos in the works.**

**hiiamboris**

**[19:31](#msg5fe4ec7969ee7f0422c03d6c):+1:**

**GiuseppeChillemi**

**[22:04](#msg5fe51073ac9d8e7463cd5a6b)@greggirwin I apologize for having ran too fast but for some unknown reason I have thought it was officially on sale. I was soo excited! Next time I will be more careful. And yes.. Your " Giuseppe has sneaked dowd the stairs" example is perfect!**

**[22:06](#msg5fe510ea22f12e449b0e450a)However, that's was my Christmas gift for myself! Later I will check the email for the registration number.**

**greggirwin**

**[22:33](#msg5fe517354eba353cdff9263b)It \*was* officially on sale @GiuseppeChillemi, not to worry. I just hadn't gotten around to posting on the main channel here. I know you were excited and waiting for your gift. :^)**

****Friday 25th December, 2020****

**pekr**

**[06:12](#msg5fe582dfde60814315414664)So we've got two blogs now? Is that going to be referenced on Red's site too? Official website was not announced, IIRC?**

**[06:21](#msg5fe584f4aa6bb528c36e606f)The reason why I ask is to know if I could link it via a FB post. Not sure if the website is officially out to the public already?**

**[06:26](#msg5fe58605c746c6431cd5f9bf)What is OpenME please? :-) Is that AltME on steroids? As it is part of the new website, I regard it being more than just the community former plan to reimplement AltME?**

**GiuseppeChillemi**

**[07:11](#msg5fe590a5c746c6431cd6100b)I think I have the official license #1 O:-) :-)**

**[07:14](#msg5fe5916097312f4b6bebbd05)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/iE2v/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/iE2v/image.png)**

**hiiamboris**

**[10:59](#msg5fe5c608ce40bd3cdb0009a7)it's `1` for everyone**

**GiuseppeChillemi**

**[11:15](#msg5fe5c9ea93af5216fc613cc3)Noooooooooooooooooooooooooooooo!**

**[11:15](#msg5fe5c9eec746c6431cd69107):-(**

**[11:16](#msg5fe5c9f04eba353cdffaa427):-D**

**[11:26](#msg5fe5cc4ce7f693041f2f259e)The difference between relative and absolute is always hard to learn and accept.**

**hiiamboris**

**[12:28](#msg5fe5dad0dbb17f28c59c94ad):D**

**greggirwin**

**[16:41](#msg5fe616214eba353cdffb4e8d)@pekr we will get a full blog post out on red-lang.org before too long, and include the DiaGrammar announcement there. It's fine to make it public, but also fine to wait for that.**

**We have a lot of product plans, some of which may be open source, but any of us who used AltME want an open version as a priority. That doesn't guarantee it will be the next thing Redlake works on, but it's something we want to do.**

****Saturday 26th December, 2020****

**pekr**

**[05:34](#msg5fe6cb5ae7f693041f31389b)Thanks. I will wait for the official blog-post then.**

**zentrog:matrix.org**

**[22:46](#msg5fe7bd3b4eba353cdffed7f5)For those of us who never used AltME, I'm curious what made it so special? From poking around on the website, it gives me the impression of something like a chat system with some additions like calendar and checklist sharing. It sort of makes me think of Teams or G Suite, but is it federated instead of siloed?**

**greggirwin**

**[23:06](#msg5fe7c1e12084ee4b78748e4d)It was small and fast. Lacked modern features, as it's quite old now. e.g. no emojis or edit time on posted messages, but it was about efficient communication in a team.. The added features were plugins, so some versions had a bug tracker too, for example. Worked great up to a hundred people or so, which is probably the largest group I knew of. Easy access control for groups and files. Also very simple to host your own server, as that was built into the same EXE. Run it with CLI switches, make sure one port is open on your firewall, and you're up and running. Foretold a lot of what we see in chat now, but in a "no distractions" mode like some modern editors. Also, all the data was plain Rebol so it was easy to process. One issue was speed when a lot of messages were in a group, so some of us wrote a read-only viewer since the data was accessible. Also easy to write tools to monitor folders and parse messages for special processing. Flexible search too.**

**GiuseppeChillemi**

**[23:31](#msg5fe7c7bc8bb734746958721e)To me a chat Widget in Red would be really nice once we will have ports**

****Sunday 27th December, 2020****

**greggirwin**

**[00:09](#msg5fe7d0d569ee7f0422c65929)Chat, as a face style is really list `list` from R2. It's generic on the UI side, because so much is dependent on other things beyond that.**

**GiuseppeChillemi**

**[11:24](#msg5fe86ef3c746c6431cdc1e96)@greggirwin How could I position the list to the bottom of it after adding an element (a chart message)**

**[11:24](#msg5fe86eface40bd3cdb05a471)\*chat**

**greggirwin**

**[21:07](#msg5fe8f79cc746c6431cdd5bea)I'd have to look at old code to remember. `LIST` was an iterative face, which called back to code with the index to display via its `supply` facet. It didn't have a slider built in, so you had to connect a slider face to it, mapping the slider position against the number of items, and tracking the top item to show. So to add an item programmatically, you just increment the current top number and show the list face again.**

**[21:08](#msg5fe8f7cb22f12e449b1680ff)It gets trickier if your items aren't all the same height, as they likely won't be in chat.**

**GiuseppeChillemi**

**[21:39](#msg5fe8ff1393af5216fc6816d0)@greggirwin I apologize, I was talking about Red text list https://github.com/red/docs/blob/master/en/view.adoc#69-text-list asking for a way to append a line to the end and have the list repositioned at that point.**

****Monday 28th December, 2020****

**toomasv**

**[07:38](#msg5fe98b77c746c6431cde9088)IIRC It is not programmatically scrollable. May be in R/S...**

**GiuseppeChillemi**

**[08:07](#msg5fe9924adbb17f28c5a473f7)@toomasv it would be good even redrawing it and setting the current position the end of the list.**

**greggirwin**

**[18:28](#msg5fea23c463fe03449623cbba)**  
**`view [ lst: text-list data [] button "New Item" [ append lst/data rejoin ["Item " n: 1 + length? lst/data] lst/selected: n lst/selected: none ; if you don't want the item selected after moving to it. ] ]`**

**GiuseppeChillemi**

**[18:42](#msg5fea272263fe03449623d40f)@greggirwin Thanks. I have tried inserting at head and scroll down the past item, it works!**

**`insert head lst/data rejoin ["Item ---x" n: 1 + length? lst/data] lst/selected: 1`**

****Thursday 31st December, 2020****

**ldci**

**[11:00](#msg5fedaf65acd1e516f8c51b1e)redCV under progress: we can use infra-red thermal images: https://twitter.com/fjephe/status/1344597676478836736**

**toomasv**

**[12:02](#msg5fedbdeddbb17f28c5ae62d8)Cool! (.. or rather Hot!)**

**planetsizecpu**

**[16:42](#msg5fedff63acd1e516f8c5e2e3)👍François, now we all know you are building skynet 😜**

**GiuseppeChillemi**

**[18:49](#msg5fee1d34e7f693041f4215f2)@ldci Some time ago I have had an idea about an AI looking at User Interfaces an interacting with a program in place of humans. I have thought that this project would bring RPA (robotic process automation) of programs to another level. Well, today I have made some research and discovered this technology exists. Sikuli http://sikulix.com is based on OpenCV, which is able to fully automate a GUI. I think it would be great to have RedCV recognize GUI elements, then only the interaction layer would be needed . This would bring RedCV and Red great power; also it could create lot of opportunities for us and acknowledgement for this project. I think that RedCV could have this capability but only its author could confirm this and make it possible. This is the reason I want to share this idea with you and all the other Red coders.**

**hiiamboris**

**[18:59](#msg5fee1fa793af5216fc7425ec)RPA requires identification of UI items by text labels, which is based on 2 strategies:**  
**1) low-level navigation of all controls of all windows**  
**2) OCR of screen shots**

**(1) is too far out of RedCV's scope, while (2) requires an external library dependency (namely, Tesseract)**

**[19:07](#msg5fee216dacd1e516f8c636cd)Though I guess OCR layer itself (without layout detection) isn't that big a task, and if one plugs into it Tesseract's trained data, it could actually work.**

**GiuseppeChillemi**

**[19:14](#msg5fee232063fe0344962d6006)We have discussed about navigating UI items in a previous chitchat thread but this one is just (2): recognizing UI elements from their visual aspect, not just OCRed text.**

**hiiamboris**

**[19:59](#msg5fee2dacaa6bb528c3823c75)Look at the browser: most of the clickable items have no borders, just text.**

**greggirwin**

**[21:13](#msg5fee3ef0ce40bd3cdb137c80)@ldci exciting stuff! Thanks for posting.**

**[21:17](#msg5fee3ff9acd1e516f8c67ed3)The modern, interactive nature of hover feedback makes this trickier, but you could probably still use rules to help guide learning. e.g. seeing the UI as panes, where some are nav-based and some content centric.**

**[21:20](#msg5fee409dde60814315553b1b)Happy New Year to everyone in the Red community. We're so grateful for your continued support and camaraderie, and look forward to sharing a bright 2021 with all of you.**
