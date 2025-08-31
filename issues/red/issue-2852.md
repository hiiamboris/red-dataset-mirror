
#2852: Wish: Localization of document strings
================================================================================
Issue is open, was reported by JenniferLee520 and has 42 comment(s).
[type.task.wish] [type.design]
<https://github.com/red/red/issues/2852>

I would like the doc strings to be localized, for education purpose. So I can translate them into Chinese, and compile Red into a Chinese version.
```Red
>> ? add
用法:
     ADD value1 value2

描述: 
     返回两个值之和。 
     ADD 是 action!。

参数:
     value1       [number! char! pair! tuple! vector! time! date!] 
     value2       [number! char! pair! tuple! vector! time! date!] 

返回值:
     [number! char! pair! tuple! vector! time! date!]
```


Comments:
--------------------------------------------------------------------------------

On 2017-07-06T14:07:47Z, dockimbel, commented:
<https://github.com/red/red/issues/2852#issuecomment-313406663>

    It's not just the docstrings you're asking for, but also the HELP function display.

--------------------------------------------------------------------------------

On 2017-07-06T15:47:23Z, greggirwin, commented:
<https://github.com/red/red/issues/2852#issuecomment-313436537>

    This came up on chat not long ago. @rebolek showed actually modifying funcs from a locale map, but then we talked that being able to set a locale (map!) and have `help` use that dynamically would be better. Also noted that `help`, itself, needs localization in that case.

--------------------------------------------------------------------------------

On 2017-07-07T03:19:11Z, dockimbel, commented:
<https://github.com/red/red/issues/2852#issuecomment-313576826>

    @greggirwin What's the best option you see for localizing HELP function internal strings?

--------------------------------------------------------------------------------

On 2017-07-07T09:20:11Z, meijeru, commented:
<https://github.com/red/red/issues/2852#issuecomment-313632064>

    system/locale has language(*) components -- what is the intended purpose? I suppose they are for internationalization, but that would involve error messages as well. It would be a major task to provide complete translations...

--------------------------------------------------------------------------------

On 2017-07-07T09:52:04Z, ghost, commented:
<https://github.com/red/red/issues/2852#issuecomment-313639029>

    Well, if you intend to provide error messages in different languages, then I think it would be better to provide error-codes with the error messages, so that a person will be able to ask for help from other language speaking people. (Rust uses error codes to provide extended description/explanation/help for errors - https://doc.rust-lang.org/error-index.html)

--------------------------------------------------------------------------------

On 2017-07-07T15:40:53Z, greggirwin, commented:
<https://github.com/red/red/issues/2852#issuecomment-313717473>

    @nc-x, errors already have a code, in addition to the ID. I don't think they're used yet, but that may be the plan. Even using the ID as a "code" will work though. 

--------------------------------------------------------------------------------

On 2017-07-07T15:42:29Z, ghost, commented:
<https://github.com/red/red/issues/2852#issuecomment-313717932>

    @greggirwin Good to know that!

--------------------------------------------------------------------------------

On 2017-07-07T16:28:06Z, greggirwin, commented:
<https://github.com/red/red/issues/2852#issuecomment-313729596>

    @dockimbel, the first question is whether we want and need a G11N/L10N/I18N system in Red, and `help` is the guinea pig, or do we want to consider what we do for `help` as a temporary measure? We all know how temporary things go. 
    
    Question 2 is whether you want it all dynamic, compiled, or optionally either one. A macro could be used to hide those details.
    
    Then it's a simple matter of defining the interface to it. If we use a wrapper func, it needs to have a very short name, because it may be everywhere. If we use a datatype or marked up strings to dialect it for automatic processing, that *really* lends itself to a macro approach. One downside to the data-as-key approach is that it's easier to change a piece of text without thinking that it's a key, and will break references to it. Tools will help. In that regard, for user-built apps, https://pontoon.mozilla.org/ looks interesting.
    
    Accessibility is another facet of this.

--------------------------------------------------------------------------------

On 2017-07-08T11:30:48Z, rebolek, commented:
<https://github.com/red/red/issues/2852#issuecomment-313850560>

    @greggirwin do we want localization in Red? My answer is yes. Having this provided on language level is better approach than to reinvent the wheel again and again by everyone who wants to localize their apps. 

--------------------------------------------------------------------------------

On 2017-07-08T15:49:04Z, greggirwin, commented:
<https://github.com/red/red/issues/2852#issuecomment-313864048>

    I agree, completely, that it's better to build it once. I just don't know if Doc wants it in the core, at least right now. It's another *great* example of how being data is a huge win in a language, where others have to invent a format or adopt another one (e.g. YAML, XML) to represent localized data. `Help` is probably as good a test case as any for a core func, but we should also create GUI examples, and maybe a data transformer/reporting tool, while considering contexts for its use.

--------------------------------------------------------------------------------

On 2020-07-15T11:30:24Z, hiiamboris, commented:
<https://github.com/red/red/issues/2852#issuecomment-658714775>

    See also my [notes here](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/composite.md#localization)

--------------------------------------------------------------------------------

On 2020-07-15T19:20:06Z, greggirwin, commented:
<https://github.com/red/red/issues/2852#issuecomment-658957134>

    L10N is a hard problem. Technically we can do it a number of ways. That's not the hart part. The hard part is the indirection and complexity it adds, not just for us, but for everyone who touches code or content. And where a poor translation may be a bad user experience in documentation, translating code-related content is a different story. Think of it like this. 
    
    You're a security guard. Your instructions say "If someone comes through the door with a gun, kill them." After translation it turns into "If someone comes through the door, with a gun, kill them." 
    
    So we localize doc strings, which may refer to other functions, args, behavior, etc.  Rebol had `alias`, and Red can do the same, so do we also translate function names? Everywhere or using `alias`? Or are doc strings a pidgin language? I enjoy many foreign films, and watch with subtitles on. But in many modern Bollywood movies, the mix of spoken Hindi and English phrases or words triggers a response for me. I hear words I don't understand, reading along, then hear English and my brain jumps back and forth a bit.
    

--------------------------------------------------------------------------------

On 2020-07-15T19:40:12Z, hiiamboris, commented:
<https://github.com/red/red/issues/2852#issuecomment-658967927>

    Localized function names are a way to hell ;)
    Anyone familiar with Red can read code despite the comments/docstrings being in foreign language. If all Red runtime funcs were written in Kanji for example, you wouldn't be able to tell a thing.
    Besides, naming is hard as you well know. How much distortion of meaning would translation cause to these fragile carefully written names?
    
    > Or are doc strings a pidgin language?
    
    When I first heard how Japanese mix their own terms with English that sounded strange too. But then you get used and realize the same thing exists in your language as well, you just never paid enough attention. I don't think this is a problem. No more problem than Arabic numerics intermixed with graphic writing anyway ;)

--------------------------------------------------------------------------------

On 2020-07-16T02:19:46Z, greggirwin, commented:
<https://github.com/red/red/issues/2852#issuecomment-659116520>

    Something to consider is how painful it makes "normal" coding, whatever locale is normal to you, and if it's done at a build stage, how that affects things. Also, what needs to be localized and how. We don't want to build a system that isn't used a) because it's painful, or b) because it's not needed. 
    
    In the context of this ticket, the example shows that `help` has hard-coded strings in the output. Do we need L10N for those? No.
    
    ```
    help-string_CN: function ['word [any-type!][
    	str: help-string :word
    	texts: [
    		"USAGE:"       "用法:"
    		"DESCRIPTION:" "描述:"
    		"ARGUMENTS:"   "参数:"
    		"RETURNS:"     "返回值:"
    	]
    	foreach [EN CN] texts [replace str EN CN]
    	str
    ]
    help_CN: function [
    	"Displays information about functions, values, objects, and datatypes."
    	'word [any-type!]
    ][
    	print help-string_CN :word
    ]
    ?_CN: :help_CN
    ```
    
    Of course, the unset case for `help` usage and needs to be handled as well. And internal error strings. Do we add L10N and the associated indirection everywhere by default? Next we see that `help` uses the doc string(s) parsed from the spec, which we can solve with an external dictionary and tooling rather than inline-L10N. But those can get out of sync, and do you need a localized build of Red...oh, wait, then your users will only get your locale, not theirs. So we need a user-local locale setting, and all possible translations available. We can do that, but is it worth it (at this point)? As @rebolek says, we don't want everyone rolling their own system for it, but before _everyone_ needs it, _someone_ will need it. Let's wait for them to show up. 
    
    Until then, we can add wiki content (https://github.com/red/red/wiki/%5BHOWTO%5D-Windows-Locale-Handling) and explore how best to deal with the basic use cases of month and weekday names, standard UI texts (OK, Cancel, etc.) and formatting.

--------------------------------------------------------------------------------

On 2020-07-16T16:13:53Z, hiiamboris, commented:
<https://github.com/red/red/issues/2852#issuecomment-659516327>

    Okay good thoughts. Let me continue.
    
    First, let's not mix the L10N of Red docstrings and of programs' UI. Different tasks, different solutions.
    Ultimately I want it:
    - effortless for programmer to the point that he may have never thought of L10N, and yet his script can be localized
    - straightforward for the translator so that he can take *any* script and add L10N to it, and only parts he deems important ATM
    
    Here's how I see **code l10n** in more detail:
    ```
    Red [title: "original script or library"]
    #include %l10n.red      ;) added by the translator (or the tools he's using)
    ...rest of it unchanged...
    ```
    `%l10n.red` is:
    ```
    #macro [string!] [
        ..substitution logic..
    ]
    #do keep [load-time initialization]
    run-time initialization
    ```
    *Load-time initialization*:
    - loads string table both into preprocessor's memory and maybe leaves some Red code it in place for later access at runtime.
    - loads L10N config (when it becomes more advanced)
    
    *Macro* checks every string for a localized equivalent and either replaces it, or prints a warning that string is not found. This will grow of course. E.g. if heuristics tells that this is not a text - no warning. Or we may mark strings in the table with a special token "I'm aware this string is absent, I'll deal with it later" to suppress warnings. Or we may add source info to strings: where each one came from? Or we can identify strings by some ID/checksum to ease tracking of changes. Maybe macros will only check if strings are present in the table, but will let runtime code do substitution. It will grow with the tooling but use the same interface, so nothing breaks.
    
    *Runtime initialization* is for the 2nd task - UI L10N.
    
    Red is dynamic enough that we can never inject some loader code before strings, because we don't know code from data. E.g. `strings: ["abc" "def"] a: strings/1` - we can't inject substitution code into the `strings` block. Nor it will work on function spec. So, global runtime substitution has it's limits: you can only apply it to a program *designed* with L10N in mind. But chin up.
    
    While macro substitution has the limit of being compiled-in. An upside is, again, that any piece of code can be localized - funcs used in libs, error messages of those libs, log messages, etc. Will preprocessor substitution be useful enough to have it? I don't know.
    
    Over `help` and error strings we have full control. We can just make `form error` and `help` smart enough to look up the strings at runtime, before printing and that's it. For teacher's purposes both approaches will work I think. `form value` may also get smarter by localized formatting of time, money, numbers. Maybe not a priority though. E.g. Github has no localization of it's site at all, and nobody cares. Let your `format` deal with it eventually.
    
    **UI l10n** requires dynamic locale switching, and can be done with a hook in `on-change*` for the `text` and `menu` facets (maybe also `data` of rich-text and drop-list). In this case the hook will look into the string table and try to replace the text, at runtime, according to configured or automatic locale setting. As easy as `on-click [system/locale/lang: 'de_DE  show main-view]`. That's why we need the tables available at runtime, either loadable from a language file or inlined by the compiler during #inclusion, and provide runtime functions to look up strings and configure everything.
    
    

--------------------------------------------------------------------------------

On 2020-07-18T00:03:39Z, greggirwin, commented:
<https://github.com/red/red/issues/2852#issuecomment-660387071>

    I agree with the goals, but don't agree that global/macro substitution can work automagically. It's the data, which is everything. We need a way to tell L10N that instances x and y of a string are targets, but not z because that's used as data elsewhere. And we need a way to process things at runtime because a system may be made of scripts from various places, not a definitive build. e.g. local extensions.
    
    We can guess at what's most common, and have a tagging system, so the 90% case is transparent, while the 10% becomes explicit. Except that guess could be backwards for half the cases.

--------------------------------------------------------------------------------

On 2020-07-18T09:53:35Z, hiiamboris, commented:
<https://github.com/red/red/issues/2852#issuecomment-660458665>

    > We need a way to tell L10N that instances x and y of a string are targets, but not z because that's used as data elsewhere.
    
    The way is easy. Just don't include the translation into the string table, and that string will be left alone. Surely anybody can tell that "1" does not need translation, while "Press any key" does.
    The alternative is to tag every string manually e.g. `#LOC "Translatable message"`, which is boring and error-prone.
    
    I forgot another limitation of runtime substitution - it can't substitute macros, e.g. #composite, and you know how bad it will be when used not as a macro but as a function. Also facet hooks won't be able to translate already composed expressions that contain formatted values, only fixed strings. So, as we need runtime substitution, and localizing `rejoin` is also a bad idea, we'll have to deal with `composite` as a function. And either explicit tags or functionality embedded into `composite` func, just for runtime composition and `format`ting.
    
    P.S. we can make a hybrid composition macro, e.g. `#composite/later "string with (word1) and (1 + word2)"` that will expand into something like `composite/with "string with (word1) and (1 + word2)" [word1 word2]` (all symbols collected), and then `composite` function will have the binding info of each operand from the attached block, while also be able to lookup the message in the string table at runtime.

--------------------------------------------------------------------------------

On 2020-07-18T22:50:12Z, greggirwin, commented:
<https://github.com/red/red/issues/2852#issuecomment-660553496>

    > > We need a way to tell L10N that instances x and y of a string are targets, but not z because that's used as data elsewhere.
    
    > The way is easy. Just don't include the translation into the string table, and that string will be left alone. Surely anybody can tell that "1" does not need translation, while "Press any key" does.
    
    My example wasn't clear, sorry. 
    ```
    <show result>
    "Press any Key"  ; L10N this one
    log "Press any Key"  ; Do NOT L10N this one
    ```

--------------------------------------------------------------------------------

On 2020-07-19T09:28:54Z, hiiamboris, commented:
<https://github.com/red/red/issues/2852#issuecomment-660615878>

    Contrived example, no?

--------------------------------------------------------------------------------

On 2020-07-19T14:47:07Z, greggirwin, commented:
<https://github.com/red/red/issues/2852#issuecomment-660656324>

    Minimal example. :^) I've written enough program generators to say that it's not completely contrived. It's not the common case, but we will need a way to deal with it. More common will be a distributed/cloud system where you return content to users, and where L10N occurs for that scenario.

--------------------------------------------------------------------------------

On 2020-08-18T18:55:30Z, DideC, commented:
<https://github.com/red/red/issues/2852#issuecomment-675654521>

    Don't mixed localizing Red or localizing program we create with it.
    The first is a hole toward the hell.
    The second would be welcome: having an included mecanism to localized.

