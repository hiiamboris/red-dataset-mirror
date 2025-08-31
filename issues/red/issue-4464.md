
#4464: Unchecked output length in `help`/`?`
================================================================================
Issue is open, was reported by hiiamboris and has 76 comment(s).
[type.design]
<https://github.com/red/red/issues/4464>

**Describe the bug**
```
a: reduce [draw/transparent 1920x1080 []]
help a        ;) or ? a
```
This effectively hangs the GUI console with:
```
A is a block! value.  length: 1  [make image! [1920x1080 #{0000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000
...
```
Another variant of the above is:
```
a: load mold reduce [draw 1920x1080 []]
? a
```

**Expected behavior**

Not stepping on this rake anymore :/
https://github.com/red/red/issues/3713 https://github.com/red/red/issues/4430

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 21-May-2020/6:17:34+03:00 commit #398d733
```



Comments:
--------------------------------------------------------------------------------

On 2020-05-22T20:56:02Z, greggirwin, commented:
<https://github.com/red/red/issues/4464#issuecomment-632905783>

    > Not stepping on this rake anymore :/
    
    Nice metaphor. :^)
    
    Good catch. 

--------------------------------------------------------------------------------

On 2020-05-22T21:06:20Z, greggirwin, commented:
<https://github.com/red/red/issues/4464#issuecomment-632908812>

    OK, at a glance, `_print` is the place to do this, but I need to look at the code more to be sure. That's from when we added buffered output, and `help-string` support. A side effect is that then you'll get truncated output for `help-string` now as well, which may be used outside the console. Then we ask if the limit should be a config option and whether we just limit the size or consider newlines. We want it to apply everywhere, but not all output is the same shape. Certainly more work to consider newlines, but lines are really the problem, not bytes. I don't think we want to `mold/flat` to cheat around that either. 

--------------------------------------------------------------------------------

On 2020-05-23T17:28:34Z, hiiamboris, commented:
<https://github.com/red/red/issues/4464#issuecomment-633101119>

    `??` deserves a limit too. It might make sense to output a few pages of code with it - that's alright. But 50M image dump? No chance. I propose a limit on `??` of about 10k chars.

--------------------------------------------------------------------------------

On 2020-05-23T18:25:30Z, greggirwin, commented:
<https://github.com/red/red/issues/4464#issuecomment-633111595>

    Good point.

--------------------------------------------------------------------------------

On 2020-05-23T18:26:09Z, greggirwin, commented:
<https://github.com/red/red/issues/4464#issuecomment-633111714>

    @dockimbel are you OK with limiting both these outputs?

--------------------------------------------------------------------------------

On 2020-05-26T19:48:37Z, greggirwin, commented:
<https://github.com/red/red/issues/4464#issuecomment-634240932>

    See also https://github.com/red/red/issues/4290. I have a local change in place for that, but never PR'd it. 

--------------------------------------------------------------------------------

On 2020-06-05T10:03:16Z, hiiamboris, commented:
<https://github.com/red/red/issues/4464#issuecomment-639382576>

    So I typed `?? face/state` command today and received 480 MB of very useful output.
    
    `? face/state` is not much more helpful, as though it didn't output more than one line, it still took 45 seconds to produce that line.

--------------------------------------------------------------------------------

On 2021-09-16T19:19:10Z, greggirwin, commented:
<https://github.com/red/red/issues/4464#issuecomment-921179783>

    For `??` and `probe`, it will be easy to limit the output. I'm all for that. I'll take a look at the code for the `help` case. If we say that `help-string` is _part of_ `help`, then it's OK to truncate it, rather than showing the full value. From a usability standpoint, anything else that uses it, e.g. to display it in an IDE, is going to face the same issue and have to deal with it. If people need the full value, there are other ways to get that. We can also truncate it just before printing, so only `help` is affected. Doing it earlier lets us nip large outputs in the bud, though I'm not _terribly_ concerned about that, we could be talking about very large amounts of data here, so it has an outsize impact in those cases.

--------------------------------------------------------------------------------

On 2021-10-06T19:36:09Z, greggirwin, commented:
<https://github.com/red/red/issues/4464#issuecomment-936980503>

    @dockimbel are you OK with moving `ellipsize-at` from %help.red to %functions.red? It's needed if we want to trim the output of `??` and `probe`, unless we want to duplicate that logic directly in those funcs. `do-command` in %console/engine.red does it independently today.

--------------------------------------------------------------------------------

On 2021-10-06T19:39:37Z, greggirwin, commented:
<https://github.com/red/red/issues/4464#issuecomment-936986572>

    Something else to consider is if `ellipsize-at` should take any value, and anything that isn't `any-string!` does `mold/part` internally.

--------------------------------------------------------------------------------

On 2021-10-06T20:07:08Z, hiiamboris, commented:
<https://github.com/red/red/issues/4464#issuecomment-937034842>

    I don't think we should limit `probe` though.

--------------------------------------------------------------------------------

On 2021-10-06T20:09:55Z, hiiamboris, commented:
<https://github.com/red/red/issues/4464#issuecomment-937039591>

    I would also like `ellipsize` to have a bit of smarts and close the outermost block:
    - not `[1 2 3 4 5 ...` but `[1 2 3 4 5...]`
    - not `(1 2 3 4 5 ...` but `(1 2 3 4 5...)`
    - not `make object! [1 2 3 4 5 ...` but `make object! [1 2 3 4 5...]`
    
    - etc.

--------------------------------------------------------------------------------

On 2021-10-06T20:16:54Z, greggirwin, commented:
<https://github.com/red/red/issues/4464#issuecomment-937051662>

    > I don't think we should limit `probe` though.
    
    What good is more output than you can make sense of, as a human? Saving to a file, sure. And we can make the limit higher than for `??`. But beyond a certain point, scrolling and reading, without searching and bookmarking, etc. is not useful.

--------------------------------------------------------------------------------

On 2021-10-06T20:21:19Z, greggirwin, commented:
<https://github.com/red/red/issues/4464#issuecomment-937059404>

    Do you want the closing sigil to help see if something is a paren, block (can't disambiguate objects), or string? It does fight a bit against the idea of `...` being the last thing you see, as a trailing indicator, but I can also see some value there.

--------------------------------------------------------------------------------

On 2021-10-06T20:23:35Z, hiiamboris, commented:
<https://github.com/red/red/issues/4464#issuecomment-937063219>

    I was thinking `probe` is used not only for debugging. E.g. I might `probe` values and dump the output into a file to search in later. Useful if I want to search for certain patterns in output. Or I might use it to output full result (like in `aztools`). We can use `print mold` in those cases, but... less convenient. Perhaps we can limit `probe` for GUI console only.

--------------------------------------------------------------------------------

On 2021-10-06T20:39:08Z, greggirwin, commented:
<https://github.com/red/red/issues/4464#issuecomment-937089774>

    Ah, good point. I used `echo <file!>` _heavily_ for logging in the past. Very handy. But I don't remember ever using `probe` for that. 
    
    The distinguishing feature of `probe` is that it returns the result. It is designed for debugging, so you can inline it without side effects. It's probably not a name we want to change, but I can definitely see `probe` being used as a keyword in an instrumentation dialect.

--------------------------------------------------------------------------------

On 2021-10-06T20:43:24Z, hiiamboris, commented:
<https://github.com/red/red/issues/4464#issuecomment-937097173>

    > Do you want the closing sigil to help see if something is a paren, block (can't disambiguate objects), or string? It does fight a bit against the idea of `...` being the last thing you see, as a trailing indicator, but I can also see some value there.
    
    That was harder to recall than I imagined :D
    So the first solid use case was in View test system, where I would log sentences with molded output and found out I couldn't tell (at least when skimming) where the value ends and text continues.
    I then had to create [my own `mold-part`](https://gitlab.com/hiiamboris/red-view-test-system/-/blob/571f9d8e0725120e29d3c5afac07c0c40c53ece1/dope.red#L94) because I needed /only and /flat refinements in various parts of the code, and also didn't want to `mold` whole images to later `ellipsize` them.
    
    IIRC another value is to be able to tell where each huge block is closed in bigger dumps. 
    
    Since then, used this even in [the profiler](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/ad8db15a4137aca1cc6222d45c4466ead3b89a77/profiling.red#L119) mainly because it made output look nicer.

--------------------------------------------------------------------------------

On 2021-10-06T20:50:13Z, greggirwin, commented:
<https://github.com/red/red/issues/4464#issuecomment-937109058>

    I do know that many time I've added extra line breaks to make scanning data easier. We can't do that here, as the data may be used  in ways that don't want it, and more important that the name doesn't indicate it would do anything like that. :^\ But then we're back to the name and what it means. I _think_ it still makes sense, and because it's for human output, we can change it without deep ramifications. It just makes the function a bit more complicated.
    
    On naming, is `ellipsize` enough? I think I included `-at` for clarity, like a non-optional refinement with an arg.

--------------------------------------------------------------------------------

On 2021-10-06T20:59:51Z, hiiamboris, commented:
<https://github.com/red/red/issues/4464#issuecomment-937125577>

    `ellipsize` is enough IMO

--------------------------------------------------------------------------------

On 2021-10-07T08:08:00Z, Oldes, commented:
<https://github.com/red/red/issues/4464#issuecomment-937554942>

    I'm against truncating `probe`'s output... I may imagine it with `help`'s output. But to be honest, I think it's mainly GUI console's issue, that the output is slow.

--------------------------------------------------------------------------------

On 2021-10-07T16:35:22Z, greggirwin, commented:
<https://github.com/red/red/issues/4464#issuecomment-937964815>

    @Oldes  _why_ do you want unlimited output? How is it useful, or how have you used it?
    
    For logging purposes, we should use real logging support. `echo` was handy, but a bit of a hack. It is really nice when you have processes running, and want to see their progress, etc., for later analysis in a production system, but it's not great for debugging as you're working on something. That is, you have two modes: console and logged data. If you're script doesn't terminate, you can sometimes see the data in the console (R2 _severely_ limited the total output, so we don't need to support this for legacy reasons). If it terminates, you only have logs.
    
    There is a similar issue in many areas, where HCI is at the core. Should list faces support unlimited data? It sounds great in theory, but 10K, 100K, or 1M items in a text list is useless to a human (unless it's searchable, and then the list is still only useful for very narrow functionality after you find the item.
    
    So the first question is: What do we use `probe` for? Once we answer that we can think about how best to support the use case(s).

--------------------------------------------------------------------------------

On 2021-10-07T18:35:39Z, Oldes, commented:
<https://github.com/red/red/issues/4464#issuecomment-938053189>

    @greggirwin I'm not english native speaker, but I understand `probe` as something what I can put in the middle of the process and see what here actually is at the given moment. If it will be truncated in some cases and in others not, it would be loosing its main purpose.
    
    One of definitions of `probe` in the Cambridge Dictionary is: 
    > a careful and **detailed** examination
    
    But I agree, that it's useful to have `?` output truncated and `??` not.

--------------------------------------------------------------------------------

On 2021-10-07T18:37:57Z, Oldes, commented:
<https://github.com/red/red/issues/4464#issuecomment-938054625>

    And I'm pretty sure, that I don't want `probe` to be truncating. I use quite often output of it in the console and I don't want to be forced use `print mold something` instead.

--------------------------------------------------------------------------------

On 2021-10-07T19:20:14Z, greggirwin, commented:
<https://github.com/red/red/issues/4464#issuecomment-938085262>

    @Oldes you didn't answer my question. Unless the dictionary definition of "probe" is why you want it. :^)
    
    > Why do you want unlimited output? How is it useful, or how have you used it?
    
    @hiiamboris noted a 50M image output as one example, or this:
    
    > So I typed ?? face/state command today and received 480 MB of very useful output.
    
    Is 50M of output useful? 480M? You use it often, I would say use it moderately often. What is the largest amount of data you've used it with _where it was helpful to see **all** the output_? To be even more specific, what _kind_ of data do you generally probe? Images, objects, recursive or cyclic structures? 

--------------------------------------------------------------------------------

On 2021-10-07T19:21:58Z, hiiamboris, commented:
<https://github.com/red/red/issues/4464#issuecomment-938086466>

    @Oldes
    step 1: it outputs you 500MB of data to the console
    step 2: you either lost everything but the last screen (CLI console), or waited for a few hours for it to finish (GUI console)
    step 3: ?! what's your next move? ;) 

--------------------------------------------------------------------------------

On 2021-10-07T19:26:22Z, hiiamboris, commented:
<https://github.com/red/red/issues/4464#issuecomment-938089603>

    @greggirwin 🚀   @hiiamboris 🐢 

--------------------------------------------------------------------------------

On 2021-10-07T19:44:01Z, Oldes, commented:
<https://github.com/red/red/issues/4464#issuecomment-938101572>

    I don't think there is unlimited output... For real example, I was recently writing a codec. Instead of opening the file in some text editor, I just did `data: read file` and that `probe data` or `probe to string! data` to see in console, how the data looks like... and than I worked with them. I don't `probe` several MB large images.
    
    Another use case.. simplified is something like doing: `1 + 2 * probe 4 + 5`. I'm sure I'm putting such a `probe`s inside text/binary data processing and if the output would be truncated, it would not be useful anymore.
    
    Also if I'm not wrong, the issue is about `help` (`?`) function, and not about `probe`. As I said several times, I don't have anything against limiting size of the `? data` output.
    
    PS: again.. it's GUI console fault, that one cannot hit `ESC` or `CTRL-C` if the output seems to be infinite.

--------------------------------------------------------------------------------

On 2021-10-07T19:45:56Z, Oldes, commented:
<https://github.com/red/red/issues/4464#issuecomment-938102815>

    And while talking about it, I changed output of the `?` in Rebol3 to be a single line output. https://github.com/Oldes/Rebol3/commit/117e1607d7adaa826a55c6f2855fd3393d2a9a8b
    
    ![image](https://user-images.githubusercontent.com/454805/136452803-015bb254-ed6c-4edb-8f62-d8228555d30c.png)

--------------------------------------------------------------------------------

On 2021-10-07T20:20:42Z, greggirwin, commented:
<https://github.com/red/red/issues/4464#issuecomment-938126598>

    I proposed, in addition to `help`, that `??/probe` should also limit their output, but maybe you didn't catch that the limit will still be pretty high. e.g. 10K. Is that enough for you (and, no, I don't want to make it a system/option at this time)?
    
    Here, if I `probe read <file>` it's useless, because newlines are not rendered in the console.
    
    The question is, in the context of a console, where all you can do is _look at_ the data, how much data can you use before it becomes too much? Small data is the common case, and you still have ways to view all data if you need to. The goal is to eliminate pathological conditions that can easily ruin your day, or at least your workflow.

--------------------------------------------------------------------------------

On 2021-10-07T20:38:57Z, Oldes, commented:
<https://github.com/red/red/issues/4464#issuecomment-938138712>

    I'm ok with limiting also `??` into some high number of bytes, but I still don't get, why you want to touch also on the mentioned `probe`. If you will limit `probe`, than you ruin it. That is my opinion. Once you will do it, you may ask, why not to limit also `print`, which will have same issue in the GUI console, when used in the wrong time and location?

--------------------------------------------------------------------------------

On 2021-10-07T20:45:54Z, Oldes, commented:
<https://github.com/red/red/issues/4464#issuecomment-938143132>

    Btw... when we mentioned examination of binary data, I can imaging some sort of new `hex-dump` function, which may be interactive like `more` command in Linux shell... but still I want to have current `probe`, which does exactly what is in its doc-string: _Returns a value after printing its molded form._

--------------------------------------------------------------------------------

On 2021-10-07T21:43:02Z, greggirwin, commented:
<https://github.com/red/red/issues/4464#issuecomment-938177012>

    @Oldes when I ask questions, it's for a reason. When you then don't answer them (mine or @hiiamboris'), it gets frustrating. You say it will ruin it, but you don't say how much data is useful. You post an example (simplified I know) of something that will _not ever_ be truncated, and say you don't probe 50M images. I'm not a fan of "slippery slope" arguments, but you're right that we have to ask what each output function is used for, and how to make it most useful.
    
    Keep in mind, we inherited `probe` from Rebol, because it is useful. It's also pathological. You are right that the R2 console doesn't hang, and you can escape to halt it printing, but you've still lost the head of your data by the time you do. I just tested setting it to 10K lines and, you know what? It slows at times but keeps working. I can escape, but probing `system` never ends. That's why I asked about cyclic structures. What is most _useful_?
    
    All that said, I have noted your views, and understand that you're OK with `probe` as it is.

--------------------------------------------------------------------------------

On 2021-10-07T21:48:49Z, greggirwin, commented:
<https://github.com/red/red/issues/4464#issuecomment-938180230>

    Maybe another way to say it is: you _can't_ have unlimited output _and_ see it all quickly. That's what _I_ think `probe` is for, seeing data quickly. What we have to choose are the tradeoffs. But, _because_ `probe` is so problematic, and should not be in any running production system, maybe the solution is to deprecate it, so we can use the word for better purposes. Then we can come up with a word that tells us it's specifically for console output, for debugging purposes. Even better, make it take a callback func or something, so tools can hook into it.

--------------------------------------------------------------------------------

On 2021-10-08T07:53:37Z, Oldes, commented:
<https://github.com/red/red/issues/4464#issuecomment-938425914>

    As you wish... [now I have](https://github.com/Oldes/Rebol3/commit/e108cfc88b98a76cbbb63b957f87d8df31d781ad) new `system/options/probe-limit`, so I can limit its output to whatever length.

--------------------------------------------------------------------------------

On 2021-10-08T08:31:50Z, hiiamboris, commented:
<https://github.com/red/red/issues/4464#issuecomment-938451332>

    Let's just make sure we doc the limit in docstrings, esp. for `probe`.

--------------------------------------------------------------------------------

On 2022-01-21T13:35:50Z, dockimbel, commented:
<https://github.com/red/red/issues/4464#issuecomment-1018511022>

    > are you OK with moving ellipsize-at from %help.red to %functions.red? It's needed if we want to trim the output of ?? and probe, unless we want to duplicate that logic directly in those funcs. do-command in %console/engine.red does it independently today.
    
    This ticket should be fixed by limiting `help`'s output without touching a core function like `probe`. `probe` is the main debugging tool we use since 20+ years, so it's a very sensitive part of the language. The question about limitating `probe` should be discussed in a REP. I'm personally against limitating it arbitrarily, because it implies limitating `print` too, which no language I know of does, for good reasons (it's the user responsability). The point about very slow or long outputs in production apps should be considered and discussed fully before making any decision about how `probe` should work.

--------------------------------------------------------------------------------

On 2022-01-21T23:37:04Z, greggirwin, commented:
<https://github.com/red/red/issues/4464#issuecomment-1018957072>

    @dockimbel is there a benefit to moving to a REP when we have all this context and discussion here already? We can, especially if we want to change the name, but there's a _lot_ of info here. Not yet one strong defense for `probe` to be unlimited that I've seen. We can make it a higher limit than the 10K proposal, but a central point is what amount of data is _useful_, and perhaps even _what_ data is useful. Is the raw molded value all that's helpful? What about it's length if it's a series, like `help` shows? 
    
    I don't think it implies limiting `print`. `Probe` _wraps_ `print` and is free to behave differently. I also don't see it as a sensitive part of the language. It's 2 lines of code that only dumps to the console, so changing the output doesn't break anything. 

--------------------------------------------------------------------------------

On 2022-01-28T02:42:40Z, greggirwin, commented:
<https://github.com/red/red/issues/4464#issuecomment-1023832944>

    Here's the old bit I stashed as a possible solution:
    ```
    ; Limiting the output, and ellipsizing it could be done with only
    ; `ellipsize-at`, but using `mold/part` first (with a slightly
    ; longer limit) may save tens to hundreds of MB and lots of time.
    ; In this context, time is the much more important metric. Waiting
    ; tens of seconds for limited output makes for a bad user experience.
    ??: func [
    	"Prints a word and the value it refers to (molded)"
    	'value [word! path!]
    ][
    	prin mold :value
    	prin ": "
    	print either value? :value [
    		ellipsize-at mold/part get/any :value 10'005 10'000
    	]["unset!"]
    ]
    
    probe: func [
    	"Returns a value after printing its molded form"
    	value [any-type!]
    ][
    	print ellipsize-at mold/part :value 10'005 10'000
    	:value
    ]
    ```

