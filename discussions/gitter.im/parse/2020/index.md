# Archived messages from: [gitter.im/red/parse](/gitter.im/red/parse/) from year: 2020

## Tuesday 7th January, 2020

cloutiy

[23:17](#msg5e151185e52f635378a0562f)Hello reducers, I have a question regarding modifying the parse subject. Looking at a couple different examples, it seems that this can be done via `insert`. My goal: I have a string, and I have a list of targets. What I'd like to do is before the matched target, I want to insert something. Additionally, after the matched target, and I want to insert something. I've tried a few different ways, one f which was using a set-word before and after the match, then using (some code) attempted to do an insert. The second approach I tried is as follows:

```
keywords: [ "chapter" | "caption" | "figure" | "image"  ]

parse content [ any [
    insert "<b>"
    keyword
    insert "</b>" ] | skip ]
```

However this does not work as I was expecting. The way I interpreted the above was "before keyword, insert this, after keyword insert that". But this never inserts "&lt;/b&gt;" after the keyword. Are there any additional resources that go into the finer details of modifying a subject string?

hiiamboris

[23:30](#msg5e15147891129970ca89faa0)what's the input?

[23:30](#msg5e15149be409da486ce145ab)&gt; Are there any additional resources that go into the finer details of modifying a subject string?

https://github.com/red/docs/blob/ba325f51247dc82f62750ee26c04114441b07ff0/en/parse.adoc#insert

[23:31](#msg5e1514d7a1e15049011dd0d8)my guess is you have skip in the wrong place (after ])

[23:45](#msg5e15181c04adee486b4c3418)and `keyword` is unset likely

## Wednesday 8th January, 2020

cloutiy

[00:04](#msg5e151c80e409da486ce18abb)@hiiamboris sorry that was a typo...should be keyword: \[ ...]

[00:05](#msg5e151cc5bdcaea189114c801)sample input is {chapter 1. The title^/Some text^/figure 1.1}

hiiamboris

[00:08](#msg5e151d70bdcaea189114cf1a)You should use `to keyword` or you'll turn everything into **things**

**[00:09](#msg5e151da4e52f635378a0b958)`insert` (as all modifying rules) is not cancelled on backtracking**

**dander**

**[00:10](#msg5e151df9a1e15049011e0942)could also use `ahead keyword` before the insert, since `to`/`thru` can introduce their own challenges**

**cloutiy**

**[00:56](#msg5e1528cae0f13b70c94d116c)@dander @hiiamboris thanks for your...`input`. pun intended ;)**

**[00:57](#msg5e1528fe0ba7b60f203f8e6a)And the winner is...**  
**`parse content [ to keyword any [ ahead keyword insert "<b>" thru keyword insert "</b>" to keyword ]]`**

**toomasv**

**[05:35](#msg5e156a3dc39503490262b78c)On phone, can’t check, but I think you can also try**  
**`[change copy _ keyword (rejoin [“<b>” _ “</b>”] | skip]`**

**[07:18](#msg5e1582293679536f962b303d)Corrected:**  
**`parse content [any [change copy _ keyword (rejoin ["<b>" _ "</b>"]) | skip]]`**

**cloutiy**

**[16:38](#msg5e1605739c13050f1f972948)@toomasv at a glance seems this could do the job too. Will experiment after work later tonight.**

****Thursday 9th January, 2020****

**bubnenkoff**

**[10:20](#msg5e16fe5be0f13b70c9596fbc)I am back and continue learning)**  
**Why next code is false?**  
**`parse "<bb><aa><bb><aa><aa>" [any [to "<aa>" | skip ] ]`**  
**it's work without `to`. But I can't understand what it's break**

**[10:35](#msg5e1701e00ba7b60f204be280)**  
**`parse "<bb><aa><bb><aa><aa>" [any [copy _ <aa> (print _) | skip] ]`**

**please explain me how this part of code works: `copy _ (print _)` copy is create temp word named `_` and copy to to it  or what?**

**pekr**

**[10:37](#msg5e17025c09534142ca36e338)Maybe you are making an infinite loop? `to`moves to just that tag, and stays there. With next iteration, if finds the same position. So fater matching the tag, you have to somehow skip it?**

**[10:38](#msg5e1702b409534142ca36e4e4)**  
**`>> parse "<bb><aa><bb><aa><aa>" [any [to "<aa>" s: (print s) | skip ] ] <aa><bb><aa><aa> <aa><bb><aa><aa> == false`**

**[10:39](#msg5e1702d809534142ca36e5f8)dunno why it matched two times the identical input and then failed? Would expect it looping around ....**

**[10:40](#msg5e170313e52f635378adb493)You have to "consume" the tag:**

**`>> parse "<bb><aa><bb><aa><aa>" [any [to "<aa>" s: "<aa>" (print s) | skip ] ] <aa><bb><aa><aa> <aa><aa> <aa> == true`**

**bubnenkoff**

**[11:45](#msg5e171250bdcaea18912211e4)@pekr thanks! Could you answer to question about how copy works?**

**toomasv**

**[11:51](#msg5e1713bc04adee486b59b7be)@bubnenkoff From \[blog](https://www.red-lang.org/2013/11/041-introducing-parse.html) introducing the `parse`:**

**&gt; copy word rule : set the word to a copy of the matched input.**  
**set word rule : set the word to the first value of the matched input.**

**bubnenkoff**

**[11:55](#msg5e1714b509534142ca376165)@toomasv `?` show help for in context of Red. How to get command description in context of Red Parse?**

**toomasv**

**[12:02](#msg5e171672821b826f5a8f68bb)Strictly speaking `parse` doesn't have commands, but keywords which are interpreted as described in different \[articles](https://github.com/red/red/wiki/%5BDOC%5D-Parse). There is also a new draft doc (https://github.com/red/docs/pull/204).**

**bubnenkoff**

**[13:52](#msg5e17302f91129970ca980569)&gt; And the winner is...**  
**&gt;**  
**`> parse content [ > to keyword > any [ ahead keyword insert "<b>" thru keyword insert "</b>" to keyword ]] >`**

**I am learning your example, what last part are doing? `to keyword` ? Move to next?**

**toomasv**

**[13:59](#msg5e1731cb0ba7b60f204d375e)Not my example, but yes, it is moving to next keyword.**

**pekr**

**[14:08](#msg5e1733d6e0f13b70c95aea23)@bubnenkoff Copy copies next matched rule, in your case it was only &lt;aa&gt; tag, you can use it along with `to` or `thru`**

**bubnenkoff**

**[14:16](#msg5e1735af55975518904a1c66)`Changes the first elements of a series and returns the series after the change`.**

**I can't understand why I am getting next result:**  
**`>> change "aabbcc" "g" == "abbcc"`**

**[14:16](#msg5e1735cf04adee486b5aa4fc)string is series, right?**

**Respectech**

**[14:25](#msg5e1737dd04adee486b5ab4ae)Try `head`in front of `change` and see what happens.**

**bubnenkoff**

**[14:26](#msg5e173813821b826f5a905430)**  
**`>> head change "aabbcc" "g" == "gabbcc" >> >> s: change "aabbcc" "g" == "abbcc" >> s == "abbcc"`**

**why `s` is not getting value?**

**toomasv**

**[14:29](#msg5e1738b909534142ca38688f)Changes the first elements of a series and \*\*returns the series after the change\*\***

**Respectech**

**[14:30](#msg5e173906c3950349026e5e75)Try `s: head change`**

**bubnenkoff**

**[14:31](#msg5e17394c810a1042cb8f9195)@toomasv Yeah, so series should be returned changed**  
**@Respectech `s: head change "aabbcc" "g"`works. But I do not understand why `head` is needed**

**toomasv**

**[14:32](#msg5e173967e409da486cf024ff)**  
**`>> head s: change "aabbcc" "g" == "gabbcc" >> s == "abbcc" >> s: head change "aabbcc" "g" == "gabbcc" >> s == "gabbcc"`**

**[14:33](#msg5e1739b80ba7b60f204d739e)As changed series is returned \*after* the changed part you'll need `head` to get series from head.**

**bubnenkoff**

**[14:42](#msg5e173be7e0f13b70c95b1f5f)If it's firstly changing the part then return it should return changed series %)**  
**I do not see how it can return and only then change first value**

**hiiamboris**

**[14:50](#msg5e173dc8810a1042cb8faf51)You should really try reading rebol/core manual. It's got pictures! ☻**

**toomasv**

**[14:55](#msg5e173ec491129970ca987045)(Hey! @hiiamboris stole my beginnig :)) You really need to understand how series works. `change` (or any other transform or move) does not return a new copy of series (unless you use `copy` of course), but a new position in series (index) and pointer to the same series.**  
**In following `s1` and `s2` point to same series but at different indexes:**  
**`>> s1: "aabbcc" == "aabbcc" >> s2: change s1 "g" == "abbcc" >> s1 == "gabbcc" >> s2 == "abbcc" >> head s2 == "gabbcc"`**  
**`>> same? s1 s2 == false >> same? s1 head s2 == true >> same? next s1 s2 == true`**

**bubnenkoff**

**[15:16](#msg5e1743d204adee486b5b090f)`change` is change index position, right? And it place new value on start position. right?**

**[15:18](#msg5e17445609534142ca38b892)But what is the logic of such behavour?**

**toomasv**

**[15:19](#msg5e174495810a1042cb8fe339)NO. `change` changes series at current position and returns same series at position after changed element.**

**bubnenkoff**

**[15:24](#msg5e17459891129970ca98a5f5)So `head?` is moved from start?**

**[15:25](#msg5e1745ce55975518904a8f1f)**  
**`>> s: change "aabbcc" "g" == "abbcc" >> head? s == false >> >> head? back s == true >> back s == "gabbcc" >> index? s == 2`**

**toomasv**

**[15:26](#msg5e174621e0f13b70c95b6a0e)`head?` checks if series' current position is at start. `head` returns series at start.**

**bubnenkoff**

**[15:27](#msg5e174665a74ac853777dc3a8)Yes, but why `change` do not change index position to start? What is the logic?**

**toomasv**

**[15:30](#msg5e1747070ba7b60f204dd579)So you can operate cosecutively on following elements. It is easy to move to start, but not so easy to go back to the position just changed if you want to continue from there but you are thrown back to start every time you change something.**

**Respectech**

**[17:12](#msg5e175ee391129970ca995bb7)@bubnenkoff The behavior is so you can do things like this:**  
**`>> a: "aabbcc" == "aabbcc" >> change a "z" == "abbcc" >> a == "zabbcc" >> change change a "1" "2" == "bbcc" >> a == "12bbcc"`**

**[17:12](#msg5e175f08821b826f5a917f18)Just to not confuse you, you can look at the double 'change statement like this:**  
**`change (change a "1") "2"`**

****Friday 10th January, 2020****

**bubnenkoff**

**[07:17](#msg5e182523e52f635378b5a87b)Thanks a lot! I was confused by example from docs:**  
**`colors: [blue red green gold] change next colors 'yellow >> colors == [blue yellow green gold]`**

**I expect that string will work in same manner. But it changed only `index` position, and I was very confused**

**@hiiamboris yes, I am reading docs every time, but sometimes I have problems as with this example.**

**rebolek**

**[07:24](#msg5e1826bd810a1042cb960eaf)the block above is changed at index position only also. `next colors` moves index to second position (`red` in this case) and changes it to `yellow`.**

**bubnenkoff**

**[07:31](#msg5e182837821b826f5a96e4da)But why it's do not move index like with string? Why we are getting:**  
**`>> colors: [blue red green gold] == [blue red green gold] >> >> change colors 'foo == [red green gold] >> >> colors == [foo red green gold]`**

**Instead of:**  
**`>> colors == [red green gold]`**

**rebolek**

**[07:32](#msg5e18287b04adee486b6149f9)**  
**`>> string: "rgbz" == "rgbz" >> change string #"y" == "gbz" >> string == "ygbz"`**

**[07:32](#msg5e182899559755189050d375)`change` returns series after change, but does not modify index, you would need to assign the result back to `colors`**

**bubnenkoff**

**[07:48](#msg5e182c5c04adee486b6165b8)it was hard for my mind, but seems I understood logic, thanks**

**rebolek**

**[07:49](#msg5e182c9fbdcaea189129eaa9)Both block and string are series, basic item in block is value (word, number, or any other red type) and basic item in string is character. So `"abcd"` has same length as `[red green blue yellow]`**

**bubnenkoff**

**[12:01](#msg5e18678f3679536f963f3c23)&gt; Consider this:**  
**&gt;**  
**`> list: ["Abel" "Cain" "Seth"] > add-names: func [/local names][names: [] append names list] > add-names > ;== ["Abel" "Cain" "Seth"] > add-names > ;== ["Abel" "Cain" "Seth" "Abel" "Cain" "Seth"] > add-names > ;== ["Abel" "Cain" "Seth" "Abel" "Cain" "Seth" "Abel" "Cain" "Seth"] > ;----------- > add-names: func [/local names][names: copy [] append names list] > add-names > ;== ["Abel" "Cain" "Seth"] > add-names > ;== ["Abel" "Cain" "Seth"] > add-names > ;== ["Abel" "Cain" "Seth"] >`**

**I am back to your example. I did a little bit small script:**  
**`>> t: func [/local n] [n: [] append n "aa"] == func [/local n][n: [] append n "aa"] >> >> t == ["aa"] >> t == ["aa" "aa"]`**

**here `n` is created inside function (not in global dict). Where it storing `n` and why it's appending more and more. `t` is creating new dict inside itself that continue to live after each call?**

**[12:04](#msg5e186853559755189052a56c)is there any way to dump `t` to see it's inner structure?**

**rebolek**

**[12:04](#msg5e186862e0f13b70c9637224)OK. So function body is a block that is evaluated each time function is called. Let's check it:**  
**`>> f: func [/local b][b: [] append b "aa"] == func [/local b][b: [] append b "aa"] >> f == ["aa"] >> f == ["aa" "aa"]`**

**Now let's take a look at the body:**

**`>> body: body-of :f == [b: ["aa" "aa"] append b "aa"]`**

**See? It's there. Can we change the body?**

**`>> body/5: "bb" == "bb" >> f == ["aa" "aa" "bb"]`**

**Yes.**

**bubnenkoff**

**[12:06](#msg5e1868cf04adee486b631ba1)Oh! Dumping is very simple!**  
**`>> :t == func [/local n][n: ["aa" "aa" "aa" "aa"] append n "aa"]`**

**[12:10](#msg5e1869a60ba7b60f2055eb0f)In which case I should use `body-of`?**

**rebolek**

**[12:11](#msg5e1869d79c13050f1fa7ad14)In your example `:t` returns whole function, `body-of` returns just function's body, just like `spec-of` returns function's specs.**

**bubnenkoff**

**[12:39](#msg5e18707ea1e15049013333bf)&gt; OK. So function body is a block that is evaluated each time function is called. Let's check it:**  
**&gt;**  
**`> >> f: func [/local b][b: [] append b "aa"] > == func [/local b][b: [] append b "aa"] > >> f > == ["aa"] > >> f > == ["aa" "aa"] >`**  
**&gt;**  
**&gt; Now let's take a look at the body:**  
**&gt;**  
**&gt;**  
**`> >> body: body-of :f > == [b: ["aa" "aa"] append b "aa"] >`**  
**&gt;**  
**&gt; See? It's there. Can we change the body?**  
**&gt;**  
**&gt;**  
**`> >> body/5: "bb" > == "bb" > >> f > == ["aa" "aa" "bb"] >`**  
**&gt;**  
**&gt; Yes.**

**`b: []` is creation block. But why `b: copy []` prevent duplication?**

**rebolek**

**[12:40](#msg5e1870b50ba7b60f20561da2)Because later in code you are referring to `b` and thanks to `copy`, it's initialized each time to empty block.**

**bubnenkoff**

**[12:44](#msg5e1871ac3679536f963f9241)second `b` works as reference? So it store value after `b: []` (b is setting to empty block)?**

**rebolek**

**[12:46](#msg5e187234a74ac8537786298a)in `b: []`, `b` is a reference to an empty block. So if you modify `b`, you are modifying original block.**  
**in `b: copy []`, `b` is a \*\*copy\** of an empty block and by adding to `b`, you're not modifiyng original block.**

**bubnenkoff**

**[12:47](#msg5e18724de52f635378b7e5ea)thanks!**

**rebolek**

**[12:47](#msg5e18726309534142ca40fd46)In Red, after you load a script, it's not a script anymore, it's an actual representation of data in memory, that you can modify.**

**bubnenkoff**

**[13:38](#msg5e187e55821b826f5a9959f5)&gt; in `b: []`, `b` is a reference to an empty block. So if you modify `b`, you are modifying original block.**  
**&gt; in `b: copy []`, `b` is a \*\*copy\** of an empty block and by adding to `b`, you're not modifiyng original block.**

**1. `b: []` is same that when we are writing `b: a` ? With only difference that here is not word, but block that work as word? But when we are writing `[]` from new line it's just block declaration.**  
**I mean somewhere under the hood `[]` begin work as accumulator of appending values, like other words do**

**[13:46](#msg5e1880313679536f963ff6ea)For example:**  
**``>> z: [] == [] >> >> f: func [/local b] [append copy z "bb"] == func [/local b][append copy z "bb"] ; z is local copy of global `z`, right? if yes what is the name of word where will be placed `bb`. It will be in `[]` block without name?``**

**toomasv**

**[14:06](#msg5e1884c9bdcaea18912c7e38)No. `z` in your func is global; `copy z` is also global but anonymous and lost. You can catch it with e.g. `b: f`.**

**greggirwin**

**[17:37](#msg5e18b646e0f13b70c965df88)To continue general Red chat, please move to red/red. But @bubnenkoff see https://github.com/red/red/wiki/%5BDOC%5D-Why-you-have-to-copy-series-values**

**hiiamboris**

**[17:58](#msg5e18bb39821b826f5a9b3e27)You didn't mean red/red ☻**

**greggirwin**

**[17:59](#msg5e18bb7d810a1042cb9a53aa)red/help would be fine too. :^\\**

****Sunday 12nd January, 2020****

**xaduha**

**[13:21](#msg5e1b1d4f6f604152992a310f)Hi, looking for an idiomatic way to do something like a filter, e.g.**

**$ echo some text foo some other text | ./redpipe**  
**some text bar some other text**

**pretty trivial with perl/regex one-liner, but what's the proper red/rebol approach?**

**endo64**

**[15:20](#msg5e1b395bcb2aaa2d782728fd)`input-stdin` is an internal function and may not be available later, but currently below code works on Win10:**

**`Red [] ;Current dir is /bin #include %../../environment/console/CLI/input.red probe input-stdin`**

**`C:\...\red\build\bin>echo test | pipe.exe "test ^M"`**

**[15:22](#msg5e1b399fc6897e1bc61e7a2a)It should be compiled.**

**xaduha**

**[15:41](#msg5e1b3e0fdbacf55b3df4f96d)I'd like to mangle the input with parse before outputting it, foo -&gt; bar**

**[15:42](#msg5e1b3e4d0e65654fa0cf285a)Basically analog to**

**$ perl -pi -e 's/foo/bar/g'**

**greggirwin**

**[18:40](#msg5e1b682b6be93b6b36ce4235)Mangle away. Just use the result of `input-stdin` and operate against that.**

****Monday 13th January, 2020****

**bubnenkoff**

**[12:49](#msg5e1c67448d9f831bc51f5b58)I mostly figure out how coping works and back to my code:**  
**`data: object [ id: "" lots: [ maxPrice: "" purchaseObjects: [ ] ] ] parse a [ (clear data/id clear data/lots/purchaseObjects clear data/lots/maxPrice) ; <--- this line thru "<id>" copy _ to "</id>" (append data/id _ ) thru "<maxPrice>" copy _ to "</maxPrice>" (append data/lots/maxPrice _ ) thru "<purchaseObjects>" collect any [ "<OKPD2>" [ thru "<code>" copy p to "</code>" thru "<name>" copy n to "</name>" ( append data/lots/purchaseObjects object compose [ code: (p) name: (n) ] ) ] | skip ] "</purchaseObjects>" ] write %file.txt to-json data to-json to-block data`**  
**Am I right understanding that here line `(clear data/id clear data/lots/purchaseObjects clear data/lots/maxPrice)` is hack?**  
**Only idea is write something like:**  
**`thru "<id>" copy _ to "</id>" (copy [] append data/id _ )`**  
**But it do not work**

**endo64**

**[14:18](#msg5e1c7c21dbacf55b3dfd71eb)It is there to cleanup when parsing starts, so you can copy &amp; append into the series that is already present in your object. You can take it out of parse if you like.**

**bubnenkoff**

**[14:25](#msg5e1c7dcd0e65654fa0d7a755)Yes, I see that it's for cleanup. But is it best way? Or only way to reorgaznize code move `(clear data/id clear data/lots/purchaseObjects clear data/lots/maxPrice)` outside parser?**

**toomasv**

**[15:50](#msg5e1c91d26be93b6b36d615ad)It is handy inside parse if you use parse in loop, or loop in parse and need to initialise things in loop. Or e.g. if you copy-paste parse rule several times in console. Otherwise initialisation is not necessary inside parse rule. Choose its proper place according to your needs.**

**Oldes**

**[16:19](#msg5e1c98971cf5106b35145b88)@bubnenkoff using `copy []` in this code:**  
**`thru "<id>" copy _ to "</id>" (copy [] append data/id _ )`**  
**is a nonsense, because you create an empty block, but it is not referenced anywhere and as it is not used, it will be just garbage collected.**

**[16:21](#msg5e1c9921a859c14fa1dc0d7c)as `data/id` is just a string, I would not used any `clear` on it and set it just as: `data/id: _`**

**[16:22](#msg5e1c9943dbacf55b3dfe5455)No need to `copy _`, because it is already copied by your parse rule.**

**[16:23](#msg5e1c99890e65654fa0d861da)You should keep `clear data/lots/maxPrice` as it is a block where you append multiple values.**

**[16:24](#msg5e1c99cc65badf754d801781)You should also avoid using `collect` in your code, as it is not used (there is no `keep` inside!)**

**[16:28](#msg5e1c9ac11cf5106b35146c32)And I would not use objects in `purchaseObjects`. Instead of:**  
**`append data/lots/purchaseObjects object compose [ code: (p) name: (n) ]`**  
**I would use just:**  
**`repend data/lots/purchaseObjects [ p n ]`**

**[16:30](#msg5e1c9b0cb720fa5b3c099e48)Which could be than used like:**  
**`foreach [code name] data/lots/purchaseObjects [ print ["Code:" code "name:" name] ]`**

**[16:35](#msg5e1c9c5e6f604152993480df)And when you initialize the `data` object, consider not using `id: ""`, because it will be replaced anyway. Using `id: none` is better as you don't create the empty unused string.**

**[16:37](#msg5e1c9cda43c3b62d79eb1a25)@bubnenkoff and last thing, if you still want to use objects, you don't have to use `compose` in your code... `object` constructor already \_reduces_ the values. Check this:**  
**`>> p: "foo" object [code: p] == make object! [ code: "foo" ]`**

****Friday 17th January, 2020****

**cloutiy**

**[23:23](#msg5e2241fb3ea53f0f6640a558)Hello, I've started a video series on how to parse text with `parse`. The first videos are up. More to come. https://youtu.be/k7VYAFPDnXc and https://youtu.be/1riJ1PYYOfQ**

****Saturday 18th January, 2020****

**endo64**

**[18:58](#msg5e2355404c1f9679ec0b78e7)Very nice @cloutiy , thanks for sharing!**

**greggirwin**

**[19:41](#msg5e235f54000f4978991c7df3)Indeed!**

**dockimbel**

**[20:04](#msg5e2364e23ea53f0f66480ab9)@cloutiy Great initiative! We need more tutorials, especially in video format.**

****Sunday 19th January, 2020****

**cloutiy**

**[23:07](#msg5e24e11bdd1429262d547ff7)Hi, 2 more videos have been added to my channel: https://youtu.be/lQT\_mowZVpA and https://youtu.be/mv8eEuXa4V0**

****Monday 20th January, 2020****

**mikeparr**

**[11:28](#msg5e258ed4c7647778a5f6085f)@cloutiy - excellent: clea screens, good sound.**

**bubnenkoff**

**[11:42](#msg5e259237ad195a0f673e4bb1)&gt; And I would not use objects in `purchaseObjects`. Instead of:**  
**&gt;**  
**`> append data/lots/purchaseObjects object compose [ code: (p) name: (n) ] >`**  
**&gt; I would use just:**  
**&gt;**  
**`> repend data/lots/purchaseObjects [ p n ] >`**

**I thinks is first variant is right, because I need to get not simple list (as your code do) but list of objects `[{code: 123, name: "sdf"}{code: 321, name: "zxc"}]`**

**Oldes**

**[12:33](#msg5e259e11000f4978992bc791)@cloutiy you could also provide \[gists](https://gist.github.com/) for the files you are using in your videos.**

****Tuesday 21st January, 2020****

**Oldes**

**[07:41](#msg5e26ab123b40ea043c760eeb)@bubnenkoff right.. but do you really need list of objects when you may do it in a lightweight version?**

**bubnenkoff**

**[08:00](#msg5e26af9afdee3c74f552fc1b)@Oldes yes I need list of objects.**

**[08:00](#msg5e26af9c9797b560f2c2b7d1)I have new more complex case. Simplified example look like:**  
**`a: {<root> <id>19160099</id> <purchaseNumber>0373200101018000262</purchaseNumber> <lots> <lot> <maxPrice>8186313.66</maxPrice> <purchaseObjects> <purchaseObject> <OKPD2> <code>11.131.11</code> <name>Foo111</name> </OKPD2> <currency> <code>666</code> </currency> <price>111</price> </purchaseObject> <purchaseObject> <OKPD2> <code>22.12.55</code> <name>Bar222</name> </OKPD2> <price>222</price> </purchaseObject> <purchaseObject> <OKPD2> <code>33.322.41</code> <name>Baz333</name> </OKPD2> <price>333</price> </purchaseObject> </purchaseObjects> </lot> </lots> </root>}`**

**Data that I would like to get. `Lots` always should be a list. Every `purchaseObjects` in it is also list.**  
**`{ "lots": [{ "maxPrice": 8186313.66, "purchaseObjects": [{ "code": "11.131.11", "name": "Foo111" }, { "code": "22.12.55", "name": "Bar222" }, { "code": "33.322.41", "name": "Baz333" }] }] }`**

**I do not know how to describe it in `Red`. Because `lots` content is multiple. I am sure that next code is wrong:**  
**`data: object [ id: "" lots: [ maxPrice: "" purchaseObjects: [ ] ] ]`**

**The next code is almost what I did above, but I am copy-pasting it to show all in one place.**

**`parse a [ ; some clearing need here thru "<maxPrice>" copy _ to "</maxPrice>" ( append data/lots/maxPrice _ ) thru "<lots>" collect any [ to "<OKPD2>" [ thru "<code>" copy p to "</code>" thru "<name>" copy n to "</name>" ( append data/lots/purchaseObjects object [ code: (p) name: (n) ] ) ] | skip ] "</lots>" ] write %file.txt to-json data`**

**Could you help me. I have not idea how to collect all objects and than place every object in lot (that multiple)**

**[08:19](#msg5e26b3f945c0577cffa2162d)There is should be way to iterate single `lot` and collect all objects from it, than move to another `lot`**

**Oldes**

**[08:40](#msg5e26b8e0364db33faa079ec2)@bubnenkoff have you noticed, that in the data source you have before ?**

**[08:41](#msg5e26b93a69a7b51d4d561d88)**  
**`parse a [ thru "<maxPrice>" copy _ to "</" ( data/lots/maxPrice: _ ) any [ thru "<code>" copy p to "</" thru "<name>" copy n to "</" ( append data/lots/purchaseObjects object [ code: p name: n ] ) ] ]`**

**[08:42](#msg5e26b95f42ae383fa95e3ce5)In case that there is always just one ... you would need to take more care to handle multiple lots.**

**bubnenkoff**

**[08:57](#msg5e26bd1242ae383fa95e53cc)Yes, the my code above it doing same. The problem exactly with I have multiple lots. So instead of:**  
**`{ "id": "", "lots": ["maxPrice:", "8186313.668186313.66", "purchaseObjects:", [{ "code": "11.131.11", "name": "Foo111" }, { "code": "666", "name": "Bar222" }, { "code": "33.322.41", "name": "Baz333" } ]] }`**

**I need:**  
**`{ "id": "", "lots": [{ "maxPrice:", "8186313.668186313.66", "purchaseObjects:", [{ "code": "11.131.11", "name": "Foo111" }, { "code": "666", "name": "Bar222" }, { "code": "33.322.41", "name": "Baz333" } ] } ] }`**

**dander**

**[09:01](#msg5e26bde93fd0cc7cfe0cc0b8)@bubnenkoff It is possible to use nested collect/keep, which allows you to preserve what structure you might need as well. So another approach is to collect the data you need while preserving enough structure to define which parts are which. Then convert that to some final format (if necessary). Here's a more simplistic example than what you need... but should illustrate what I mean**  
**`po-name: [<name> keep to </name> </name>] po-code: [<code> keep to </code> </code>] po: [<purchaseObject> collect [ any [ not ahead </purchaseObject> [po-name | po-code | skip] ] </purchaseObject>] ] >> parse a [collect any [po | skip]] == [["11.131.11" "Foo111" "666"] ["22.12.55" "Bar222"] ["33.322.41" "Baz3...`**

**Oldes**

**[09:02](#msg5e26be27342e1054d0591441)@bubnenkoff or you can split your parse into multiple parts, like:**  
**`data: object [ id: none lots: [] ] parse-lot: func[code /local price purchases p n][ purchases: copy [] parse code [ thru <maxPrice> copy price to </maxPrice> any [ thru <code> copy p to </code> thru <name> copy n to </name> ( append purchases object [ code: p name: n ] ) ] ] object [maxPrice: price purchaseObjects: purchases] ] parse-lots: func[code /local tmp][ parse code [ any [ thru <lot> copy tmp to </lot> (append data/lots parse-lot tmp) ] ] ] parse a [ thru <id> copy id to </id> thru <lots> copy tmp to </lots> ( data/id: id clear data/lots parse-lots tmp ) ] data`**  
**with result:**  
**`make object! [ id: "19160099" lots: [make object! [ maxPrice: "8186313.66" purchaseObjects: [make object! [ code: "11.131.11" name: "Foo111" ] make object! [ code: "666" name: "Bar222" ] make object! [ code: "33.322.41" name: "Baz333" ]] ]] ]`**

**bubnenkoff**

**[09:18](#msg5e26c20342ae383fa95e722b)Oh! Big thanks for example!**

**Oldes**

**[09:30](#msg5e26c4a8364db33faa07f0df)I think that it could be done within just one parse call using some more advanced features, but I'm usually just the \_brute `parse` user\_.**

**bubnenkoff**

**[09:38](#msg5e26c6856ced65043b57698e)Sorry that I am asking same question again and again, but I do not understanding how `copy` is working. Now I can use it. But it's not clear for me what happens when I am writing:**  
**`f: func[w] [d: copy [] append d w]`**  
**`d` - is global word here, yes?**  
**But what keyword `copy` do? In next code every call `d` should get empty block `[]`. But it's do not! It's not overwriting global word `d`? Or what?**  
**`f: func[w] [d: [] append d w]`**

**rebolek**

**[09:40](#msg5e26c6fb69a7b51d4d567849)@bubnenkoff you get empty block on each call:**  
**`>> f: func[w] [d: copy [] append d w] == func [w][d: copy [] append d w] >> f 1 == [1] >> f 2 == [2] >> f 3 == [3]`**

**Oldes**

**[09:41](#msg5e26c72f3b40ea043c76cd72)**  
**`>> f1: func[w] [d: copy [] append d w d] == func [w][d: copy [] append d w d] >> f2: func[w] [d: [] append d w d] == func [w][d: [] append d w d] >> f1 "a" == ["a"] >> f1 "a" == ["a"] >> f2 "a" == ["a"] >> f2 "a" == ["a" "a"]`**

**bubnenkoff**

**[09:44](#msg5e26c7fe78472574f4572233)Yes I see result, but can't understand why it work is this way. `copy` is clear global value?**

**rebolek**

**[09:45](#msg5e26c8343b40ea043c76d45e)On each call, you assign a copy of an empty block to the word `d`**

**bubnenkoff**

**[09:46](#msg5e26c8916b64bc54d125c1bf)but if I simply write `d: []` d will not be set to empty `[]`? Why? "I am assigning to `d` block `[]`"**

**[09:48](#msg5e26c8de258edf397bbf0aed)**  
**`>> a: ["a"] == ["a"] >> a: [] == [] >> a == []`**

**rebolek**

**[09:49](#msg5e26c90d78472574f4572845)In the above code, you have three blocks. But once the block is inside a function, it’s one block.**

**[09:49](#msg5e26c939342e1054d05967b4)**  
**`>> f: func[w] [d: [] append d w] == func [w][d: [] append d w] >> f 1 == [1] >> second body-of :f == [1]`**

**bubnenkoff**

**[09:53](#msg5e26ca1c45c0577cffa2bbf4)"three blocks" "But once the block is inside a function, it’s one block" ... could you explain. I am not fully understand how you calculate them**

**rebolek**

**[09:54](#msg5e26ca606ced65043b577eff)sorry, two. first is `a: ["a"]` and second is `a: []`**

**Oldes**

**[09:55](#msg5e26ca9645c0577cffa2c08f)1. function specification, 2. function body and 3. the d value**

**[10:00](#msg5e26cbdb075a19397cde443d)Imagine, that somewhere in the memory lives function f, which have body block and this block holds empty block value, which you assign to the variable d. It may be useful not to copy it in some examples, if you care about memory (with use of `clear`). But this is out of topic in the `/parse` room. Just remember that when you `copy`, you are safe.**

**[10:01](#msg5e26cc0d6b64bc54d125d7a1)Or you can use `d: make block! 8` which will also produce always new block with preallocated given size.**

**[10:04](#msg5e26ccb23b40ea043c76f077)@greggirwin is for example using initialization with `clear` here: https://gist.github.com/greggirwin/b08ffb5c9fa54a9b9387248387baf46d#file-url-parser-red-L157**

**[10:05](#msg5e26cce4fdee3c74f553be4e)**  
**`>> f3: func[w] [d: clear [] append d w d] == func [w][d: clear [] append d w d] >> f3 "a" == ["a"] >> f3 "b" == ["b"]`**

**[10:06](#msg5e26cd339797b560f2c38573)But it is advanced optimization and I would not recommend it to newbies:)**

**[10:10](#msg5e26ce059797b560f2c38ce8)Actually I don't understand, why is @greggirwin doing this, because at the end, he anyway must use `copy` https://gist.github.com/greggirwin/b08ffb5c9fa54a9b9387248387baf46d#file-url-parser-red-L195**

**[10:11](#msg5e26ce546b64bc54d125e5d1)Possibly to save some internal reallocations, so it is micro-optimization :-)**

**bubnenkoff**

**[13:05](#msg5e26f73145c0577cffa3f5db)I've found related link with same question about copy http://www.rebolforum.com/index.cgi?f=printtopic&amp;topicnumber=31&amp;archiveflag=archive**

**[13:17](#msg5e26f9ed6ced65043b58d3e6)And this link maybe helpful for me and other newcomers https://www.reddit.com/r/redlang/comments/4ecs9n/insane\_behavior\_in\_rebol\_lets\_put\_an\_end\_to\_this/**

**[13:42](#msg5e26ffcc69a7b51d4d580bdd)Important quote: "It's the same in Smalltalk. Compiled method contains reference to a concrete instance of sequence."**

**GiuseppeChillemi**

**[23:28](#msg5e27890b3b40ea043c7c35ee)@bubnenkoff one year ago, or more, I made the same question on function being 3 elements and then just one. It could be considered a faq.**

****Wednesday 22nd January, 2020****

**greggirwin**

**[03:28](#msg5e27c15d3b40ea043c7d9e0d):point\_up: \[January 21, 2020 3:06 AM](https://gitter.im/red/parse?at=5e26cd339797b560f2c38573) @oldes it is an optimization, but `result: clear url-buffer://` does two other things, which are more important: 1) it sets the datatype of the result. 2) it documents the purpose, as you would with a comment, but without needing a separate comment.**

**Oldes**

**[08:25](#msg5e28070a258edf397bc7b4ab)I don't say I don't like it.. actually I think it is clever. Just one cannot forget to `copy` the result at the end.**

**greggirwin**

**[18:01](#msg5e288e1178472574f463ce5a)Correct.**

****Thursday 23th January, 2020****

**bubnenkoff**

**[10:30](#msg5e2975bea420263e03850bae)@Oldes really big thanks for your example! Without it I could not finish! I learned how it's work and rewrote to be sure that I am understanding all right.**

**Could you look at my code and give some feedback. Maybe some things maybe done in better way:**  
**`data: object [ id: none lots: [] ] parse-lot: func[lot /local purchaseObjects] [ single_lot: object [ maxPrice: "" purchaseObjects: [] ] parse lot [ thru "<maxPrice>" copy _ to "</maxPrice>" (single_lot/maxPrice: _ ) any [ thru "<purchaseObjects>" copy obj to "</purchaseObjects>" (append single_lot/purchaseObjects parse-obj obj ) ] ] single_lot ] parse-obj: func[obj ] [ purchaseObjects: copy [] parse obj [ any [ thru "<OKPD2>" thru "<code>" copy c to "</code>" thru "<name>" copy n to "</name>" ( append purchaseObjects object [ code: c name: n ] ) to "</OKPD2>" ] ] purchaseObjects ] parse a [ (clear data/lots) thru "<id>" copy id to "</id>" (data/id: id) any [ thru "<lot>" copy lot to "</lot>" (append data/lots parse-lot lot ) ] ] write %file.txt to-json data`**

**result:**  
**`{ "id": "19160099", "lots": [{ "maxPrice": "8186313.66", "purchaseObjects": [{ "code": "11.131.11", "name": "Foo111" }, { "code": "22.12.55", "name": "Bar222" }, { "code": "33.322.41", "name": "Baz333" } ] } ] }`**

**[10:36](#msg5e2977393482927279131cda)Do I really need `/local purchaseObjects` in code? Or it can be dropped?**

**rebolek**

**[10:38](#msg5e2977a79ad22d5bd5c65354)You can drop it, if you don't care about leaking words. If you do, I suggest to add all other words to `/local` too.**

**[10:40](#msg5e297827f85dba0aabfddd6a)Actually, in `parse-lot` it makes no sense. But other words should be local: `single_lot _ obj`**

**[10:41](#msg5e297865f85dba0aabfddfcf)In `parse-obj`, `purchaseObjects` should be local, together with `c n`**

**Oldes**

**[11:12](#msg5e297fb4183449313bc31fa5)@bubnenkoff why you just don't use my version, which was more clear and without leaking words?**

**[11:15](#msg5e2980609ad22d5bd5c69521)You should be careful what names you use in parse rules when you `set` or `copy` data to these, as you can by accident overwrite important parts elsewhere.. like in this example:**  
**`>> foo: "hello" == "hello" >> f: func[][ parse "foo" [copy foo to end] ] f == true >> foo == "foo" ;<-------- not a "hello" anymore!`**

**[11:17](#msg5e2980d1f85dba0aabfe230e)Words used with `set` and `copy` in parse rules are not recognized by `function` construct, which normally collects `set-word`s and use these as a local for you.**

**[11:18](#msg5e29811b1a1c2739e3e5c96f)**  
**`>> a: b: 0 f: function[][ a: 1 parse "foo" [copy b to end] ] f == true >> a == 0 ;<--- was collected as a local >> b == "foo" ;<--- was not collected as a local`**

**bubnenkoff**

**[11:36](#msg5e298548a9b30639e2d0f9b7)@Oldes you version is good, I wrote own just to get more practice and be sure that I am understanding how it's work! Oh thanks! Now I am understanding important of `/local`! So it's good practice to declare all words inside function as local?**

**Oldes**

**[11:49](#msg5e2988494c3dae24f5d4e780)You may want to close the internal functions into a context.. like \[here](https://gist.github.com/Oldes/70a8e8c2d9e7e96645ba00c1a754b6ac)**

**bubnenkoff**

**[12:10](#msg5e298d52f196225bd6433b6c)Thanks, but I think context is a little bit early for me, it will only confuse me now.**

**Now I want to parse few hundreds of documents with not strict structure. Am I right understand that it's better to make parse return `true` for every document that grammar it can parse (now it parse but at result return `false`)?**

**[12:31](#msg5e29922d1a883c6196f582d8)How to find place that make parse to return `false`? Now I have few functions and I need to learn best debugging practice.**

**For example should I get every single parse function return at it's end `true` before start work on next?**

**endo64**

**[15:18](#msg5e29b934f196225bd64492ba)&gt; Now I want to parse few hundreds of documents with not strict structure. Am I right understand that it's better to make parse return true**

**If you just extract some parts it may not important that your parse returns true, but if you are also validating your input then yes it should return true so you can understand that you've parsed the whole input.**

**[15:20](#msg5e29b9bda420263e03871c03)&gt; How to find place that make parse to return false?**

**You can put some debug outputs inside the rule. Or you can mark some positions in your parse rule, so when it finishes you can check where it stops.**  
**`parse-trace` is also useful sometimes but its more difficult to understand and follow its output.**

**[15:21](#msg5e29b9e73482927279152063)**  
**`>> parse [a b c 1 d] [some [p: word!]] == false >> p == [1 d]`**

**[15:22](#msg5e29ba4f1a1c2739e3e77d5f)**  
**`>> parse [a b c 1 d] [some [word! (prin ".")]] ...== false ; it's the forth item >> parse [a b c 1 d] [some [p: word! (probe first p)]] a b c ; fails after c`**

**[15:23](#msg5e29ba6fe177666195b62a99)These are simple methods to find where it fails.**

**greggirwin**

**[19:45](#msg5e29f7efa420263e0388edcd)Just FYI, we're enabling Threaded Conversations in this room as a test, to see how it works. There's a mix here of tricks, bugs, and help, which we think makes it a good place to start.**

**Phryxe**

**[21:54](#msg5e2a16094c3dae24f5d92376)On iPhone I see `8 replies`, but I have trouble accessing them.**

**greggirwin**

**[21:57](#msg5e2a16c9348292727917d770)Ah, mobile.**

**dander**

**[22:01](#msg5e2a17beda04a624f46f84a2)On the official Android app, it just looks like a normal message with no mention of the replies :grimacing:**

**greggirwin**

**[22:04](#msg5e2a1867a420263e0389f059)Ah, mobile. :^\\**

****Friday 24th January, 2020****

**GiuseppeChillemi**

**[08:11](#msg5e2aa69a34829272791b910b)@greggirwin Have you said: "Ah, mobile" ?**

**greggirwin**

**[08:20](#msg5e2aa8c59ad22d5bd5ceba3d)Ah....maybe. ;^)**

**GiuseppeChillemi**

**[08:23](#msg5e2aa99b44c076313cd83d22)Ah... ok !**

**[08:24](#msg5e2aa9acda04a624f4734383)(Should we thread this conversation ?)**

**bubnenkoff**

**[10:37](#msg5e2ac900a9b30639e2d9d2dd)Oh guys! I have a problem. Red is hanging on parsing real file. I tried several times with same result. One moment I will provide example of code and file**

**[10:38](#msg5e2ac923dc07667042e3d6db)**  
**`Red [] ;file: read %/C/current_month/notice/notification_Moskva_2019020200_2019020300_001.xml/fcsNotificationEA44_0373200101018000262_19160099.xml data: object [ id: none lots: [] ] parse-lot: func[lot /local single_lot price obj] [ single_lot: object [ maxPrice: "" purchaseObjects: [] ] parse lot [ thru "<maxPrice>" copy price to "</maxPrice>" (single_lot/maxPrice: price ) any [ thru "<purchaseObjects>" copy obj to "</purchaseObjects>" (append single_lot/purchaseObjects parse-obj obj ) | skip ] ] single_lot ] parse-obj: func[obj /local c n] [ purchaseObjects: [] parse obj [ any [ thru "<OKPD2>" thru "<code>" copy c to "</code>" thru "<name>" copy n to "</name>" ( append purchaseObjects object [ code: c name: n ] ) to "</OKPD2>" ] ] purchaseObjects ] parse file [ (clear data/lots) thru "<id>" copy id to "</id>" (data/id: id) any [ thru "<lot>" copy lot to "</lot>" (append data/lots parse-lot lot ) | skip ] ]`**

**[10:38](#msg5e2ac93ca420263e038e7c82)\[fcsNotificationEA44\_0373200101018000262\_19160099.xml](https://files.gitter.im/red/parse/79Wg/fcsNotificationEA44\_0373200101018000262\_19160099.xml)**

**rebolek**

**[10:42](#msg5e2ac9f9f85dba0aab074aec)@bubnenkoff You certainly have infite loop in your rules. let me take a look at it...**

**bubnenkoff**

**[10:44](#msg5e2aca9734829272791c8499)But it works file with next data:**  
**`file: {<root> <id>19160099</id> <purchaseNumber>0373200101018000262</purchaseNumber> <lot> <maxPrice>8186313.66</maxPrice> <purchaseObjects> <purchaseObject> <OKPD2> <code>11.131.11</code> <name>Foo111</name> </OKPD2> <currency> <code>666</code> </currency> <price>111</price> </purchaseObject> <purchaseObject> <OKPD2> <code>22.12.55</code> <name>Bar222</name> </OKPD2> <price>222</price> </purchaseObject> <purchaseObject> <OKPD2> <code>33.322.41</code> <name>Baz333</name> </OKPD2> <price>333</price> </purchaseObject> </purchaseObjects> </lot> </root>}`**

**rebolek**

**[10:44](#msg5e2aca9c01914e3e043ceaa4)Hm, I tried with your code with your file and it returns `false`, no hangup here.**

**bubnenkoff**

**[10:45](#msg5e2acabbe177666195bd9b7b)Which version do you use? I am use latest (from January few weeks ago)**

**rebolek**

**[10:46](#msg5e2acaf944c076313cd93042)I've built my version today morning, but I think there were no changes to `parse` recently.**

**bubnenkoff**

**[10:47](#msg5e2acb28183449313bcc4c5b)\[!\[изображение.png](https://files.gitter.im/red/parse/VC18/thumb/izobrazhenie.png)](https://files.gitter.im/red/parse/VC18/izobrazhenie.png)**

**[10:47](#msg5e2acb4ff85dba0aab0757ba)What OS?**

**[10:48](#msg5e2acb704c3dae24f5ddf432)0.6.4 stable is also hanging**

**rebolek**

**[10:48](#msg5e2acb864c3dae24f5ddf53c)macOS, I try on Windows**

**[10:49](#msg5e2acbafa420263e038e8e82)This is on Windows:**

**`>> cd %../temp == %/y/Code/temp/ >> do %parser.red == false`**

**bubnenkoff**

**[10:51](#msg5e2acc22dc07667042e3ef6d)Is there any difference when you copy-paste red code in console or running from file?**

**rebolek**

**[10:51](#msg5e2acc3a44c076313cd93a4c)No, there shouldn't be. I try to copy it.**

**[10:52](#msg5e2acc80a9b30639e2d9ea52)Ah, I have an error there, let me check again...**

**[10:53](#msg5e2acca6e177666195bda9db)Ok, now it hangs.**

**bubnenkoff**

**[10:53](#msg5e2accab1a883c6196fdf7b1)I have run it from file. It's hang again**

**rebolek**

**[11:04](#msg5e2acf34f85dba0aab077b52)Ok, I added some debug code there and I believe it doesn't hang up, but runs \*very* \*\*\*very\*\** slowly towards end**

**[11:05](#msg5e2acf7cf85dba0aab077ca0)You can see it yourself if you change last `skip` into something like `p: skip (prin p/1)`**

**bubnenkoff**

**[11:06](#msg5e2acf9edc07667042e403a4)What make it run so slowly?!**

**rebolek**

**[11:06](#msg5e2acfb444c076313cd955f4)Your parse rules :smile:**

**[11:07](#msg5e2acfd634829272791caa37)See this rule: `any [thru "" copy lot to "" (append data/lots parse-lot lot ) | skip]`**

**bubnenkoff**

**[11:07](#msg5e2acfd701914e3e043d0c8c)Which part? How i can profile speed?**

**[11:07](#msg5e2acffacd53a80aac1874a5)And what wrong with rule above?**

**rebolek**

**[11:08](#msg5e2ad03f1a1c2739e3ef1b2d)It's not exactly wrong, it's just super slow. You have two sub-rules there, first it tries to find and if it's not found, it `skip`s to next character.**

**[11:09](#msg5e2ad085da04a624f4746956)So what it does? It must scan whole file for , then move to next character and scan again. Then move to next character and scan again. Etc, until it finally hits end.**

**[11:10](#msg5e2ad09f1a1c2739e3ef1de2)Try removing `thru` and see the speedup.**

**bubnenkoff**

**[11:33](#msg5e2ad620da04a624f4749b6a)After changing:**  
**`any [ "<lot>" copy lot to "</lot>" (append data/lots parse-lot lot ) | skip ; thru removed ]`**  
**it works very fast**

**`>> do %test.red == true`**

**rebolek**

**[11:35](#msg5e2ad66adc07667042e4359a)Of course, it just checks if is on current position, while `thru` needs to check whole string.**

**bubnenkoff**

**[11:40](#msg5e2ad7a69ad22d5bd5d00067)But why there is no problem with `thru` in another functions?**

**rebolek**

**[11:44](#msg5e2ad8aa183449313bccb99e)There's always problem with `thru` :) Your input file has ~700kB, so it check for  almost 2450000000000 instead of 700000. In your other functions, you are checking much smaller string, so it runs faster. Another optimization would be not use three function, but one with nested parse rules.**  
**Anyway, replace all `any [thru something | skip]` with `any [something | skip]`, as the second variant is much faster and the code is also smaller.**

**bubnenkoff**

**[11:50](#msg5e2ad9f1dc07667042e455af)But I can't understand how `any` works without `thru`. Or it do move?**  
**`>> parse "aabbccdd" [any "bb" s:] == false >> index? s == 1`**

**Oldes**

**[11:51](#msg5e2ada46e177666195be1440)`any [thru something | skip]` is a nonsense... because if `thru samething` is false, the `skip` rule never helps with finding `something` after skipping input by one char.**

**rebolek**

**[11:52](#msg5e2ada60183449313bccc842)no, `any` in itself doesn't do any moves. If you read the \[documentation](https://www.red-lang.org/2013/11/041-introducing-parse.html), you'll find that `any` \*repeats rule zero or more times until failure or if input does not advance\***

**bubnenkoff**

**[11:54](#msg5e2adae744c076313cd9af8e)So:**  
**`parse "aabbccdd" [any "bb"]`**

**Will try to match `aa` then `ab` than `bb` than `bc` etc?**

**Oldes**

**[11:54](#msg5e2adb091a883c6196fe5c07)no.. it will try to match just `bb`**

**rebolek**

**[11:55](#msg5e2adb159ad22d5bd5d01a6f)What your original rule does, simply said is: `thru` checks whole file if there is . If there isn't, `skip` moves one char forward and then `thru` \*\*checks the whole file again\*\*. This is repeated until end is finally hit. So inefficient that it looks like Red hangs.**

**bubnenkoff**

**[11:56](#msg5e2adb53e177666195be1e57)So when I should use `thru`?**

**rebolek**

**[11:56](#msg5e2adb80f196225bd64c84fb)I would say never, but let's be tolerant, it's fine in very simple cases.**

**[11:57](#msg5e2adbbfa420263e038f0e59)You either should use `some [thru something]` or `some [something | skip]`, but never ever `some [thru something | skip]`**

**pekr**

**[12:02](#msg5e2adcb9f196225bd64c907a)Why not?**

**[12:03](#msg5e2add06183449313bccdb1c)If there is no element to be found, you just skip by one char, but in your code, you put `thru`there, because you expect that. Of course if that is the case ...**

**rebolek**

**[12:07](#msg5e2ade0cdc07667042e47c45)@pekr if there was no `thru`, how would you write it? Of course as `some [something | skip]`. So `some [thru something | skip]` is `some [some [something | skip] | skip]`. As you can see, the complexity of this rule is not linear but exponential.**

**Oldes**

**[12:10](#msg5e2adec41a1c2739e3ef892a)@bubnenkoff you may want to use something like:**  
**`>> parse a [any [<name> copy n to #"<" thru #">" (probe n) | skip]] "Foo111" "Bar222" "Baz333" == true`**

**[12:12](#msg5e2adf371a883c6196fe7c99)But I'm surprised, that this does not works:**  
**`parse a [any [<name> copy name to #"<" thru #">" (probe name) | to #"<"] ]`**

**rebolek**

**[12:12](#msg5e2adf41f85dba0aab07f504)@pekr @bubnenkoff**  
**`>> dt [parse append/dup "" #"0" 10000 [some [#"1" | skip]]] == 0:00:00.002302 >> dt [parse append/dup "" #"0" 10000 [some [thru #"1" | skip]]] == 0:00:03.20431`**

**Oldes**

**[12:23](#msg5e2ae1ac4c3dae24f5dea9be)@bubnenkoff the `skip` itself is also not what you want sometimes... compare number of skips evaluated here:**  
**`>> s: 0 parse a [any [<name> copy name to #"<" thru #">" (probe name) | skip (s: s + 1)] ] s "Foo111" "Bar222" "Baz333" == 811`**  
**... and there:**  
**`>> s: 0 parse a [any [to #"<" [<name> copy n to "<" thru ">" (probe n) | skip (s: s + 1)]]] s "Foo111" "Bar222" "Baz333" == 42`**

**rebolek**

**[12:24](#msg5e2ae204183449313bccfc5e)@Oldes this ignores internal skips `to` has to do anyway.**

**Oldes**

**[12:24](#msg5e2ae21234829272791d2ed1)The second rule must be faster, because `to #"<"` tells that you want to get start of a tag, and ignores other charasters, which would be tested with the first version.**

**rebolek**

**[12:26](#msg5e2ae264f196225bd64cbd51)I haven't looked at internal implementation, but I would be surprised if it wouldn’t give up after `<` doesn't match in the first case.**

**pekr**

**[12:26](#msg5e2ae279dc07667042e49c1d)@rebolek of course you are cheating. There is no "1" in your parsed string, so logically to/thru don't make any sense. We are talking here a known protocol/data structure, not a randomly incoming data ....**

**[12:27](#msg5e2ae2b14c3dae24f5deb224)Simply put - if you know what you are doing, then even to/thru might get handy :-) I of course agree to your code, just wanted to state that to/thru are not automatically evil :-)**

**rebolek**

**[12:28](#msg5e2ae2f0183449313bcd02eb)@pekr we are talking about @bubnenkoff 's data that have relatively soon and then tons of uninteresting garbage, which is basically the same as my example. It's the garbage at the end what was causing supposed hangup.**

**[12:30](#msg5e2ae36f183449313bcd0717)@Oldes that `dt` is simple oneliner I wrote just for this test. I would post Red's number with your examples, but I don't have `a` in my Red :(**

**Oldes**

**[12:31](#msg5e2ae393da04a624f474ff8f):point\_up: \[21. leden 2020 9:00](https://gitter.im/red/parse?at=5e26af9afdee3c74f552fc1b) here is `a`**

**rebolek**

**[12:32](#msg5e2ae3f0cd53a80aac190476)1.85 vs 0.269**

**Oldes**

**[12:34](#msg5e2ae46844c076313cd9fcd4)ups.. I deleted it by accident!**

**[12:37](#msg5e2ae4f3183449313bcd1314)Here it is again (results from Rebol3):**  
**`>> dt [loop 10000 [ parse a [any [thru <name> copy name to #"<" thru #">" | skip]] ]] == 0:00:01.007076 >> dt [loop 10000 [ parse a [any [<name> copy name to #"<" thru #">" | skip]] ]] == 0:00:02.348254 >> dt [loop 10000 [ parse a [any [to #"<" [<name> copy n to "<" thru ">" | skip]]] ]] == 0:00:00.261976`**

**[12:52](#msg5e2ae874e177666195be828e)@bubnenkoff here is the fastest variant explained in comments:**  
**`parse a [ any [ ;- find any tags... to #"<" [ ;- seek the char used to start a tag [ <name> copy n to "<" (print ["n:" n]) ;- process <name> tag... | ;- .. or .. <code> copy c to "<" (print ["c:" c]) ;- process <code> tag... ] | skip ;- skips the "<" char so we can find another tag ] ] to end ;- just to let parse return TRUE when there is some left content ]`**

**[13:00](#msg5e2aea7001914e3e043dcb32)@bubnenkoff regarding the `thru` (and also `to`) rule, you should be aware that you may skip content which you may don't want to skip.. so it is always good to be careful, in complex rules... but of course it is useful in cases where you for example just want title of a web page:**  
**`>> parse read https://www.red-lang.org [thru <title> copy t to "<"] t == "Red Programming Language"`**

**greggirwin**

**[18:37](#msg5e2b396e01914e3e044048be)You guys are the best. There is great info here. I would love it if someone extracts it and puts it, or links to it with a short note \[here](https://github.com/red/red/wiki/%5BNOTES%5D-Parse-\_\_-performance,-data-loading,-alternatives). It will make a great article at some point.**

****Monday 27th January, 2020****

**bubnenkoff**

**[08:15](#msg5e2e9c04183449313be60495)&gt; What your original rule does, simply said is: `thru` checks whole file if there is . If there isn't, `skip` moves one char forward and then `thru` \*\*checks the whole file again\*\*. This is repeated until end is finally hit. So inefficient that it looks like Red hangs.**

**But why in next code `thru` do not calling?**  
**`>> parse "aabbccdd" [any [ thru "cc" print ("cc") | skip (print "skiped") ] ] skiped skiped skiped skiped skiped skiped skiped skiped == true`**

**I thought it will "moves one char forward and then `thru` \*\*checks the whole file again\*\*"**

**rebolek**

**[08:17](#msg5e2e9c96183449313be60967)`print ("cc")` -&gt; `(print "cc")`**

**bubnenkoff**

**[08:20](#msg5e2e9d4b1a1c2739e309756a)oh! Thanks!**

**rebolek**

**[08:20](#msg5e2e9d57f196225bd66680b0)no problem ;)**

**bubnenkoff**

**[08:22](#msg5e2e9db3da04a624f48ed289)But it does not seems that it run parsing again and again:**  
**`>> parse "aabbccdd" [any [ thru "cc" (print "cc") | skip (print "skiped") ] ] cc skiped skiped == true`**  
**`thru` is running only one time**

**rebolek**

**[08:22](#msg5e2e9de2cd53a80aac32b637)right, "cc" is found only once.**

**[08:25](#msg5e2e9e7344c076313cf37d82)put your `print` \*before* `thru`. You are checking if the rule succeeded, not if it was called.**

**pekr**

**[09:19](#msg5e2eab1cda04a624f48f30fd)The problem with thru is opposite. It is exoensive, in combination with skip, if things are not being found.**

**bubnenkoff**

**[10:37](#msg5e2ebd5c9ad22d5bd5ea9172)&gt; @Oldes that `dt` is simple oneliner I wrote just for this test. I would post Red's number with your examples, but I don't have `a` in my Red :(**

**Could you give me your `dt`?**

**rebolek**

**[10:37](#msg5e2ebd811a883c61961941cb)`dt: func [block /local t][t: now/time/precise do block now/time/precise - t]`**

**[10:38](#msg5e2ebdaaf85dba0aab2231d8)But you should use something like https://gist.githubusercontent.com/greggirwin/908d44dc069ed84cf69f053e1308390d/raw/f06faef36ffd443f62fd22f074bd27a7ae08d8a3/profile.red**

**bubnenkoff**

**[10:44](#msg5e2ebf26f196225bd6676036)&gt; put your `print` \*before* `thru`. You are checking if the rule succeeded, not if it was called.**

**I still can't reproduce problem with "moves one char forward and then thru \*\*checks the whole file again\*\*"**

**I see code above that work with `a`. But what about much more simple case?**

**`parse "aabbccdd" [any [ (print "cc") thru "cc" | skip (print "skiped") ] ]`**  
**If I right understand after every `skip` `thru` should re-scan string with index+1 (aka `next`)**

**hiiamboris**

**[10:53](#msg5e2ec114cd53a80aac33ac1c)`thru [(print "cc") "cc"]`**

**Oldes**

**[10:55](#msg5e2ec1a6183449313be711e2)@bubnenkoff the `skiped` is for each char after last `cc` found:**  
**`>> s: 0 parse "aabbccdd" [any [ thru "cc" | skip (s: s + 1) ] ] s == 2 >> s: 0 parse "aabbccdddd" [any [ thru "cc" | skip (s: s + 1) ] ] s == 4`**

**[10:57](#msg5e2ec20a9ad22d5bd5eaaff9)I would not say, that `it checks the whole file again`.. it checks from the current position to tail.**

**rebolek**

**[10:57](#msg5e2ec22401914e3e045815dc)@Oldes yes, that's what I meant, sorry for the confusion.**

**bubnenkoff**

**[12:01](#msg5e2ed1201a1c2739e30ae003)&gt; There's always problem with `thru` :) Your input file has ~700kB, so it check for  almost 2450000000000 instead of 700000. In your other functions, you are checking much smaller string, so it runs faster. Another optimization would be not use three function, but one with nested parse rules.**  
**&gt; Anyway, replace all `any [thru something | skip]` with `any [something | skip]`, as the second variant is much faster and the code is also smaller.**

**Sorry, but I really do not understanding why I am getting unneeded iterations.**  
**`thru "lot"` move index to next position after first lot it found. Than we will run function that collect body if `lot`, if current position is not `lot` me just skip symbol. What I am missing?**

**Ok we can drop `thru` but how it will change logic?**

**[12:05](#msg5e2ed1f044c076313cf4df2f)`thru` is doing iteration, but `skip` is also doing same**

**Oldes**

**[12:19](#msg5e2ed56bda04a624f4906b6e)The key is difference between `something` and `thru something`. The first check only if `something` is at current position, while the second traverse to end.**

**[12:20](#msg5e2ed5ab183449313be7a3e9)You can translate `any [something | skip]` as: \_check if something is at current position, if not, skip the position to next char\_**

**bubnenkoff**

**[12:21](#msg5e2ed5bba9b30639e2f5bd4e)yeah**

**[12:21](#msg5e2ed5d2cd53a80aac34415b)`thru` is just setting cursor to position after match is found**

**[12:22](#msg5e2ed600f196225bd667ff01)`parse aabbcc thru "bb"`**

**will set cursor before `cc`**

**Oldes**

**[12:22](#msg5e2ed60fa420263e03aa1cc3)Yes... but only if the match is found, if not... the `skip` change position to next char, but you are again seeking from position to the end.**

**bubnenkoff**

**[12:30](#msg5e2ed7ccda04a624f490775f)So simply I am doing same operation twice?**

**[12:36](#msg5e2ed967da04a624f49084ab)**  
**`>> parse "aabbccdd" [ (print "cc") thru "cc" ] cc`**

**Why it works different?**

**`>> parse "aabbccdd" [ thru [(print "cc") "cc" ]] cc cc cc cc cc`**

**Oldes**

**[12:39](#msg5e2ed9e43482927279388c40)**  
**`>> parse "aabbccdd" [ thru [p: (print ["cc" mold p]) "cc" ]] cc "aabbccdd" cc "abbccdd" cc "bbccdd" cc "bccdd" cc "ccdd"`**

**[12:39](#msg5e2eda16dc07667042fff539)This is not compatible with Rebol. Looks like `thru` on block always skip. I'm not sure if it is by design.**

**[12:50](#msg5e2edca7e177666195d971ea)Looks that it is a shortcut for:**  
**`>> parse "aabbccdd" [some [p: (probe p) "cc" break | skip ]] "aabbccdd" "abbccdd" "bbccdd" "bccdd" "ccdd"`**

**[12:57](#msg5e2ede32a420263e03aa521e)@bubnenkoff maybe you just want this:**  
**`>> parse "aabbccdd" [thru ["cc" (print "cc")]] cc`**

**[12:58](#msg5e2ede7801914e3e0458e205)If you put the `print` before the content check, you see the output even when the match is not found!**

**rebolek**

**[13:50](#msg5e2eeaa4f196225bd668975a)&gt; So simply I am doing same operation twice?**

**Yes.**

**bubnenkoff**

**[14:01](#msg5e2eed4ccd53a80aac34e9e3)When I do red parse I am iterate thru series, right? Or index pointer do not changing?**  
**`a: "aabbccdd" parse a [ thru "cc" (print index? a) ] 1`**

**Why it's still point to 1?**

**rebolek**

**[14:03](#msg5e2eeda81a883c61961a9327)It changes index internally, so input is not affected.**

**[14:04](#msg5e2eedd7e177666195d9e887)**  
**`>> parse s: "aabbccddee" [thru "cc" p: (print index? s print index? p)] 1 7`**

****Tuesday 28th January, 2020****

**bubnenkoff**

**[07:25](#msg5e2fe1e7bfe65274eaaee885)&gt; It changes index internally, so input is not affected.**

**Is it's doing internal copy of input? Or store some pointer that do not affect on input?**

**rebolek**

**[07:25](#msg5e2fe1fed9895b17c3a1379a)Store some pointer.**

**[07:25](#msg5e2fe20673ddad4acd636dff)You can modify input with `parse`.**

**bubnenkoff**

**[08:46](#msg5e2ff4f340da694c5edcd664)Is there any dababase drivers for red? MySQL\\PG?**

**rebolek**

**[10:09](#msg5e30085d73ddad4acd6483f0)@bubnenkoff Most DBs require TCP, so not yet, it will come with ports.**

**bubnenkoff**

**[10:26](#msg5e300c693aca1e4c5f367c7d)Maybe there is some ways to get it work? I have heap of files for processing...**

**[10:28](#msg5e300cd7ea9ba00b84835811)What current status of `ports`?**

**rebolek**

**[10:29](#msg5e300d0ed9895b17c3a2765f)Ports will be implemented soon™.**

**bubnenkoff**

**[10:41](#msg5e300fddf301780b833a2956)So I have no variants expect writing to file and than parse file with another language and mark field in DB?**

**rebolek**

**[10:43](#msg5e301049433e1d4039691397)You can of course write your own driver in Red/System. But if you don't want to go that way, then files are probably the best idea. OTOH when port will finally arrive, you'll be prepared and can use your functions directly.**

**bubnenkoff**

**[10:44](#msg5e301077f6945f41ef2e4a62)But if Red is compatible with syntax with Rebol I can try to use Rebol?**

**rebolek**

**[10:47](#msg5e30115d594a0517c23bba82)Yes, Rebol has ports and MySQL driver, so you can try it. There will be of course some small differences (Rebol's `parse` doesn't have all functionality of Red's one), but it's more or less same in this case.**

**bubnenkoff**

**[14:18](#msg5e3042c3f6945f41ef2fc04f)I want to wrap next part to function, so I can just pass here file name. But I want to return from function 2 value. The first one is status `true`/`false` and second is parsed `data`. How I can do it in right way?**

**`do-parsing: function[file] [ ; ..... some code skipped parse file [ ; result of parsing (clear data/lots) thru "<id>" copy id to "</id>" (data/id: id) any [ "<lot>" copy lot to "</lot>" (append data/lots parse-lot lot ) | skip ] ] data-for-return: to-json data ]`**

**[14:28](#msg5e3045186f9d3d3498f38509)and how to evaluate result `parse file` to false if any of top `parse` function was evaluated as fail?**

**[14:42](#msg5e304873fe0e6f74e9d56c7e)Why next code is `false`?**

**`>> parse "aabbccdd" [ thru "aa" copy v to "dd" (print v)] bbcc == false`**

**endo64**

**[14:50](#msg5e304a3b40da694c5edf2382)`to "dd"` stops where `dd` starts, you need `2 skip` to finish the input.**

**[14:52](#msg5e304aa5433e1d40396ab525)to return 2 values you can put them in a block:**  
**`parse-result: parse file [ ... ] ... data-for-return: reduce [parse-result to-json data]`**

**bubnenkoff**

**[14:54](#msg5e304b42dc52c34ace1be832)**  
**`f: function[v] [ parse v ["somewrongrule"] ] parse "aabbccdd" [ thru "aa" copy v to "dd" 2 skip (f v)]`**

**How to make parse return fail if sub-rule in function was fail?**

**Oldes**

**[15:52](#msg5e3058daf6945f41ef306be9)You should make your parse rule(s) not to use inner functions. I use these in the example just because it is faster to figure it out. Maybe you should play with the \_html_ parser example mentioned in this article: https://www.red-lang.org/2013/11/041-introducing-parse.html**

**[15:56](#msg5e3059c6ea9ba00b8485913d)@bubnenkoff or you can use `if` key word:**  
**`>> parse "abc" ["a" "bc"] == true >> parse "abc" ["a" if (true) "bc"] == true >> parse "abc" ["a" if (false) "bc"] == false`**

**[15:57](#msg5e3059f8dc52c34ace1c557c)So in your case above:**  
**`parse "aabbccdd" [ thru "aa" copy v to "dd" 2 skip if (f v)]`**

****Wednesday 29th January, 2020****

**bubnenkoff**

**[08:50](#msg5e31475bd9895b17c3aaf6f6)Thanks! It's working in example, but in my code next construction not work:**  
**`"<purchaseObjects>" copy obj to "</purchaseObjects>" (append single_lot/purchaseObjects if(parse-obj obj) ) | skip *** Script Error: if is missing its then-blk argument *** Where: if *** Stack: do-parsing`**

**[08:55](#msg5e31488b6f9d3d3498fac2ba)"You should make your parse rule(s) not to use inner functions"**  
**I have not idea how to do it :(**

**rebolek**

**[09:17](#msg5e314d96dc52c34ace22e87f)You have `if` as parse rule \*inside* code block. Move it out.**

**[09:17](#msg5e314dbad9895b17c3ab271e)Your inner functions are just doing parse. Take those rules out and use them in your main parse directly.**

**[09:20](#msg5e314e4340da694c5ee63dd6)What you are doing is equivalent of this:**  
**`>> bb-rule: ["bb"] == ["bb"] >> parse-bb: func [value][parse value bb-rule] == func [value][parse value bb-rule] >> parse "aabbcc" ["aa" copy value to "cc" (parse-bb value) to end] == true`**  
**But you can just do this directly:**  
**`>> parse "aabbcc" ["aa" bb-rule "cc" to end] == true`**

**endo64**

**[09:25](#msg5e314f8540da694c5ee64853)Another solution could be, you can put your outer parse in a function, so you can `(return f v)` inside your rule.**

**bubnenkoff**

**[09:34](#msg5e315188dc52c34ace2309ae)&gt; You have `if` as parse rule \*inside* code block. Move it out.**

**like:**  
**`"<purchaseObjects>" copy obj to "</purchaseObjects>" if (append single_lot/purchaseObjects parse-obj obj ) | skip`**  
**?**

**rebolek**

**[09:46](#msg5e31546bea9ba00b848c531b)yes, something like that**

**bubnenkoff**

**[09:49](#msg5e31550f73ddad4acd6dbf8d)Not working. If break any inner rule I am always getting `true`:**  
**`file: {<root> <id>19160099</id> <purchaseNumber>0373200101018000262</purchaseNumber> <lot> <maxPrice>8186313.66</maxPrice> <purchaseObjects> <purchaseObject> <OKPD2> <code>11.131.11</code> <name>Foo111</name> </OKPD2> <currency> <code>666</code> </currency> <price>111</price> </purchaseObject> <purchaseObject> <OKPD2> <code>22.12.55</code> <name>Bar222</name> </OKPD2> <price>222</price> </purchaseObject> <purchaseObject> <OKPD2> <code>33.322.41</code> <name>Baz333</name> </OKPD2> <price>333</price> </purchaseObject> </purchaseObjects> </lot> </root>} data: object [ id: none lots: [] ] parse-lot: func[lot /local single_lot price obj] [ single_lot: object [ maxPrice: "" purchaseObjects: [] ] parse lot [ thru "<maxPrice>" copy price to "</maxPrice>" (single_lot/maxPrice: price ) any [ "<purchaseObjects>" copy obj to "</purchaseObjects>" if (append single_lot/purchaseObjects parse-obj obj ) | skip ] ] single_lot ] parse-obj: func[obj /local c n] [ purchaseObjects: [] parse obj [ any [ "<OKPD2>" thru "<code>" copy c to "</code>" thru "<name>" copy n to "</name>" ( append purchaseObjects object [ code: c name: n ] ) to "</OKPD2>" ] ] purchaseObjects ] parse file [ (clear data/lots) thru "<id>" copy id to "</id>" (data/id: id) any [ "<lot>" copy lot to "</lot>" if (append data/lots parse-lot lot ) | skip ] ]`**

**Oldes**

**[09:49](#msg5e31551ce8a8383559f2f1d9)@bubnenkoff it looks you have problems with switching mental contexts ;-)... There is `if` as a key word in the parse dialect and `if` as a key word for the main evaluation.**

**[09:50](#msg5e315556433e1d403972163a)@rebolek your last example will not work for his case as he is using `thru` and `to`, so it will escape.**

**[09:50](#msg5e315581dc52c34ace232bf5)Isn't there xml decoder for Red already? Maybe it would be easier to use for @bubnenkoff**

**bubnenkoff**

**[09:51](#msg5e31559af6945f41ef376627)How can XML decoder help with parsing?**

**rebolek**

**[09:51](#msg5e3155bae8a8383559f2f7de)@Oldes There are multiple I believe. I have one at https://github.com/rebolek/red-tools/blob/master/codecs/xml.red**

**Oldes**

**[09:52](#msg5e3155e16f9d3d3498fb36a1)@bubnenkoff that you would not try to parse at all... because it looks you are fighting with it pretty hard.**

**rebolek**

**[09:52](#msg5e3155ea433e1d4039721f18)@bubnenkoff XML decoder will convert your data into Red format so it will be easier to work with them.**

**Oldes**

**[09:52](#msg5e3155f9e8a8383559f2f9a3)`if (append data/lots parse-lot lot )` is a nonsense.**

**[09:53](#msg5e31560c40da694c5ee6822d)because it will be always `true`**

**[09:53](#msg5e31562fdc52c34ace23305c)Sorry... I must focus on my work. And also I have problem that you switched to your version instead of mine, which I already provided to you (which could be enhanced).**

**bubnenkoff**

**[09:56](#msg5e3156cc3aca1e4c5f3fc05f)Thanks very much!**

**Oldes**

**[09:59](#msg5e31579ce8a8383559f301ec)I think that you should first of all decide, if you want to use quick to write data miner, where you don't care about all data and exceptions, or full parser, which can handle all input from your data files.**

**[10:00](#msg5e3157bf3aca1e4c5f3fc77e)I've provided you the first one so far.**

**[10:02](#msg5e315839f6945f41ef377c6b)If you want to be able to handle all data, it is better to use XML decoder, as you than don't have to write own parse rules, which may be quite complex.**

**bubnenkoff**

**[10:03](#msg5e31586215941335583364c6)The problem that I do not know how to use xml-decoder. I need any examples...**

**Oldes**

**[10:09](#msg5e3159bcbfe65274eab963f9)**  
**`do https://raw.githubusercontent.com/rebolek/red-tools/master/codecs/xml.red data: xml/decode file`**

**rebolek**

**[10:11](#msg5e315a38ea9ba00b848c7fcb)@bubnenkoff feel free to ask. It parses XML file into tree of tags.**

**Oldes**

**[10:11](#msg5e315a59e8a8383559f317d5)@bubnenkoff but if you just want to learn `parse`, than it is really good to start with the mentioned simple HTML parser from the article.**

**rebolek**

**[10:11](#msg5e315a5c73ddad4acd6deffc)I have some support functions also to traverse the tree.**

**bubnenkoff**

**[10:12](#msg5e315aa4f6945f41ef378e38)@rebolek ok, but what I should to do next with xml-decoder from Oldes?**  
**Ok, I got `data`? But how to make it's look structure that I need?**

**[10:13](#msg5e315ad840da694c5ee6ac43)I need at last any example. Because now for me it's look not simplier than parse it with `parse`**

**rebolek**

**[10:14](#msg5e315af1f301780b83436296)No problem, wait a moment.**

**bubnenkoff**

**[10:14](#msg5e315b13dc52c34ace2357c2)&gt; @bubnenkoff but if you just want to learn `parse`, than it is really good to start with the mentioned simple HTML parser from the article.**

**I read it, it helped me, but I sill have a lot of questions...**

**rebolek**

**[10:16](#msg5e315b84f6945f41ef3794ab)@Oldes Hm, it probably needs some improvements first :-)**  
**`>> data: xml/decode data *** Syntax Error: invalid character in: "ns2:export"`**

**Oldes**

**[10:30](#msg5e315eabdc52c34ace2373bf)@bubnenkoff if you want to learn parse... take this as a new starter:**  
**`ws: charset reduce [space tab cr lf] rule-lot: [ any ws <maxPrice> copy mp to "</" </maxPrice> (probe mp) any ws <purchaseObjects> thru </purchaseObjects> any ws ] parse file [ any ws <root> [ any ws <id> copy id to "<" (probe id) </id> any ws <purchaseNumber> copy pn to "<" (probe pn) </purchaseNumber> any ws <lot> rule-lot </lot> ] any ws </root> ]`**

**[10:30](#msg5e315ed515941335583394a3)You must write own rule for `purchaseObjects` as it is now just skipped.**

**rebolek**

**[10:31](#msg5e315ef6d9895b17c3abb6d7)Or write a rule that properly parses and outputs Markdown's bold and italic...no, that's evil.**

**Oldes**

**[10:32](#msg5e315f3758f02e34973ed371)@bubnenkoff above code expects, that your data always have `id`, `purchaseNumber` and `lot` in exact order!**

**[10:54](#msg5e31646c433e1d4039729929)Btw... in Rebol2 there were not required all these `any ws` parts as it was dealing with white spaces automatically and one had to use `parse/all` to handle the spaces manually. @dockimbel I wonder if this should not be available in Red too!**

**rebolek**

**[11:16](#msg5e31699c6f9d3d3498fbd53d)@Oldes I'm glad that `parse/all` is the default mode. Whitespace definition is so subjective that I used `parse/all` all the time.**

**Oldes**

**[11:20](#msg5e316a976f9d3d3498fbdc02)There is only one mode so far ;-) I agree, that `parse/all` is more common.**

**rebolek**

**[11:21](#msg5e316ad4ea9ba00b848d11d0)@Oldes ok, I believe you know what I meant :-) Rebol's `parse/all` -&gt; Red's `parse`. Wasn't it the same in R3? I may be wrong though.**

**Oldes**

**[11:23](#msg5e316b2a6f9d3d3498fbe06c)R3 is using `/all` only for parse splitting:**  
**`>> parse "a | b" "|" == ["a" "b"] >> parse/all "a | b" "|" == ["a " " b"]`**

**rebolek**

**[11:24](#msg5e316b5c6f9d3d3498fbe147)So R3's `parse` is working like Red's one?**

**Oldes**

**[11:24](#msg5e316b6673ddad4acd6e7ddc)Yes.**

**rebolek**

**[11:25](#msg5e316b91433e1d403972d3d0)https://www.youtube.com/watch?v=q3svW8PM\_jc**

**bubnenkoff**

**[12:19](#msg5e3178356f9d3d3498fc4c36)@rebolek I decided to try drop all functions as your said, but I do not know how to get code work. For example the first problem is to fill single `lot` with purchaseObjects:**  
**`parse file [ thru "<id>" copy id to "</id>" (data/id: id) any [ "<lot>" any [ "<purchaseObjects>" any [ "<OKPD2>" thru "<code>" copy c to "</code>" thru "<name>" copy n to "</name>" ( purchaseObjects: copy [] append purchaseObjects object [ code: c name: n ] ) "</OKPD2>" | skip ] "</purchaseObjects>" | skip ] "</lot>" | skip ] ]`**

**Oldes**

**[12:39](#msg5e317d0dd9895b17c3acc959)@bubnenkoff check this: https://gist.github.com/Oldes/70a8e8c2d9e7e96645ba00c1a754b6ac**

**bubnenkoff**

**[12:42](#msg5e317dc2d9895b17c3acce57)what mean asterics `*id`?**

**Oldes**

**[12:43](#msg5e317dd6e8a8383559f4306b)just a name:)**

**[12:43](#msg5e317dfcfe0e6f74e9de2525)**  
**`>> id: 1 object [id: id] *** Script Error: id has no value *** Where: id *** Stack: object >> *id: 1 object [id: *id] == make object! [ id: 1 ]`**

**bubnenkoff**

**[12:44](#msg5e317e103aca1e4c5f410cd4)ok, I will learn how it's work. By first look a little bit hard to understand the logic...**

**Oldes**

**[12:44](#msg5e317e3f3aca1e4c5f410e39)It would be more clear without all these `any ws` ;-)**

**[12:46](#msg5e317e8915941335583497d4)Anyway.. this version is strict, so parse will return `false` when the input is malformed. Not like the initial version.**

**[13:03](#msg5e3182acbfe65274eabaadc4)@bubnenkoff in your above code:**  
**`"<OKPD2>" thru "<code>" copy c to "</code>" thru "<name>" copy n to "</name>" (...) "</OKPD2>" | skip`**  
**It fails, because you have `to ""` and than expects `""`, which is not there yet!**

**greggirwin**

**[19:09](#msg5e31d86958f02e349742b2ca)@bubnenkoff you're making progress, but I am going to strongly suggest, again, that you focus on Red fundamentals and work your way up. `Parse` is an advanced feature, and I think it will benefit you greatly to get very comfortable with the basic functions, how series work, what helps you debug code, etc.**

**My concerns are a) making the best use of the community's time, and b) your long term success with Red. With @Oldes' and @rebolek's help, you may get a working solution for your current problem. But if you haven't developed the skills and understanding needed, you may not be able to maintain and extend it on your own in the future.**

**[19:15](#msg5e31d9b6f6945f41ef3b7c93)Debugging `parse` can be a \*lot* of work. We plan to build tools to help with this, but right now, it can mean a lot of `probe` calls, temp markers, or using `parse/trace`. Making rules robust in the face of real world data is not easy.**

****Thursday 30th January, 2020****

**bubnenkoff**

**[07:10](#msg5e328156594a0517c24cf7fe)@greggirwin I am totally agree, but it's not enough examples that how to parse docs in right way. So I need to experiment and drop wrong realizations again and again. And I think it's much better to learn on real tasks. Because simply reading docs do not help with understanding**

**Could anybody help me with next problem. I learned example from @Oldes (big thanks for it). And begin to write own base from his ideas. But I faced with problem:**  
**`parse-object: [ any [ "<OKPD2>" thru "<code>" copy c to "</code>" thru "<name>" copy n to "</name>" ( append purchaseObjects object [ code: c name: n ] ) "</OKPD2>" | skip ] ] parse-lot: [ (purchaseObjects: copy []) any [ "<purchaseObjects>" parse-object to "</purchaseObjects>" | skip ] ] parse file [ (lots: copy []) any [ "<lot>" parse-lot (print "hello") "</lot>" | skip ] ]`**

**In next code: (print "hello")`work only if it placed before`"&lt;/lot&gt;"`. And I can't understand why it's not working if write it as:`**  
**"&lt;lot&gt;" parse-lot "&lt;/lot&gt;" (print "hello") | skip**  
**\`**

**@Oldes bit thanks again, I will try to write something similar with your realization, but myself to be sure that I am understand how it work**

**rebolek**

**[07:17](#msg5e328326fe0e6f74e9e559bf)@bubnenkoff You have `to ""` in your `pare-lot` rule, so it ends before . Change it to either `to` or `thru`**

**[07:18](#msg5e328343fe0e6f74e9e55a54)@bubnenkoff Also, Red supports tags directly, so you don't need to write `""`,  is fine.**

**bubnenkoff**

**[07:19](#msg5e32838958f02e3497471622)Thanks!**  
**p.s. Thanks for mention. But I prefer to write quote marks, maybe I will stop to do it later**

**[07:28](#msg5e328593bfe65274eac1fb42)@rebolek do not help:**  
**`parse-object: [ any [ "<OKPD2>" thru "<code>" copy c to "</code>" thru "<name>" copy n to "</name>" ( append purchaseObjects object [ code: c name: n ] ) "</OKPD2>" | skip ] ] parse-lot: [ (purchaseObjects: copy []) any [ "<purchaseObjects>" parse-object to "</purchaseObjects>" "</purchaseObjects>" | skip ] ] parse file [ (lots: copy []) any [ "<lot>" parse-lot "</lot>" (print "hello") | skip ] ]`**  
**"Hello" still not printing**

**rebolek**

**[07:35](#msg5e32872df301780b834bc711)Ok, I took a lot at your original data, isn't right after so chage it to `to`, it should help.**

**bubnenkoff**

**[07:41](#msg5e3288b715941335583c0176)&gt; Ok, I took a lot at your original data, isn't right after so chage it to `to`, it should help.**

**What do you mean?**  
**`</purchaseObjects> </lot>`**  
**Or you about line break?**

**rebolek**

**[07:43](#msg5e32892dbfe65274eac214bc)I've got the `fcsNotificationEA44_0373200101018000262_19160099.xml` file and after  there are . Even if it's**  
**`</purchaseObjects> </lot>`**  
**you have newline there.**

**bubnenkoff**

**[07:44](#msg5e328956f301780b834bd6ab)Ah! Yes!**

**Oldes**

**[07:55](#msg5e328be96f9d3d349803e77d)@bubnenkoff have you noticed that I'm not using `| skip` in my last version?**

**bubnenkoff**

**[07:55](#msg5e328bf158f02e3497474e45)Yes, with `to` it works. I tried to replace `to` with `ws` and it's stop works. Why?**  
**`------------- file: {<root> <id>19160099</id> <purchaseNumber>0373200101018000262</purchaseNumber> <lot> <maxPrice>8186313.66</maxPrice> <purchaseObjects> <purchaseObject> <OKPD2> <code>11.131.11</code> <name>Foo111</name> </OKPD2> <currency> <code>666</code> </currency> <price>111</price> </purchaseObject> <purchaseObject> <OKPD2> <code>22.12.55</code> <name>Bar222</name> </OKPD2> <price>222</price> </purchaseObject> <purchaseObject> <OKPD2> <code>33.322.41</code> <name>Baz333</name> </OKPD2> <price>333</price> </purchaseObject> </purchaseObjects> </lot> </root>} ws: charset reduce [space tab cr lf] parse-object: [ any [ "<OKPD2>" thru "<code>" copy c to "</code>" thru "<name>" copy n to "</name>" ( append purchaseObjects object [ code: c name: n ] ) "</OKPD2>" | skip ] ] parse-lot: [ (purchaseObjects: copy []) any [ "<purchaseObjects>" parse-object to "</purchaseObjects>" "</purchaseObjects>" ] ] parse file [ (lots: copy []) any [ "<lot>" parse-lot ws "</lot>" (print "hello") | skip ] ]`**

**[07:55](#msg5e328c026f9d3d349803e79d)&gt; @bubnenkoff have you noticed that I'm not using `| skip` in my last version?**

**one moment I will look again. `upd`: Yes I just mentioned it**

**[07:58](#msg5e328ca0dc52c34ace2be69b)But your are using `ws`. But I am not sure that `ws` is good. Because real data could be very variate. For example there can be different sections like  etc in different places. So maybe `skip` will be more reliable**

**Oldes**

**[08:08](#msg5e328ee3ea9ba00b84953617)It will not be... `ws` is just for white spaces, so it will not handle unknown tags.**

**[08:09](#msg5e328f2415941335583c355c)If you don't know exact data structure, you should not construct object directly, but first store intermediate data (using blocks and not objects, as I recommended to you at the beginning) and than go thru these data and pick only the content you want.**

**bubnenkoff**

**[08:10](#msg5e328f6d433e1d40397ae84b)Yes, but in example above `ws` should work, because I do not have any other tags between:**  
**`</purchaseObjects> </lot>`**

**Oldes**

**[08:11](#msg5e328f993aca1e4c5f48a59d)Sorry... don't understand now.. what will not work?**

**bubnenkoff**

**[08:12](#msg5e328fe63aca1e4c5f48a741)I mean that rule:**  
**`"<lot>" parse-lot ws "</lot>" (print "hello") | skip`**  
**should print "hello"**  
**because I have structure like:**  
**`</purchaseObjects> </lot>`**  
**But it do not work**  
**Only rule with `to` work:**  
**`"<lot>" parse-lot to "</lot>" (print "hello") | skip`**

**Oldes**

**[08:13](#msg5e32904015941335583c3d98)I have problems reading your code. Use my \[gist](https://gist.github.com/Oldes/70a8e8c2d9e7e96645ba00c1a754b6ac) instead as it is working. If you have some data which it does not handle, you can send it and I will extend it. I like parsing as a procrastination, so it is not a big problem.**

**rebolek**

**[08:14](#msg5e32904d3aca1e4c5f48aa07):-)**

**Oldes**

**[08:16](#msg5e3290e373ddad4acd76b52f)@bubnenkoff also you still have the bug in `parse-object` as I mentioned earlier.**

**[08:16](#msg5e3290f5fe0e6f74e9e5b67b):point\_up: \[29. leden 2020 14:03](https://gitter.im/red/parse?at=5e3182acbfe65274eabaadc4) here.**

**bubnenkoff**

**[08:18](#msg5e32913c58f02e3497477114)&gt; I have problems reading your code. Use my \[gist](https://gist.github.com/Oldes/70a8e8c2d9e7e96645ba00c1a754b6ac) instead as it is working. If you have some data which it does not handle, you can send it and I will extend it. I like parsing as a procrastination, so it is not a big problem.**

**What problem with my code? It's hard to understand it's logic?**  
**I can't send data because it's to many bad structural data, and I am trying to find way to parse them. So I am trying to provide more or less real world examples to show my problems.**

**Oldes**

**[08:18](#msg5e3291503aca1e4c5f48b0d0)And noticed, that a few minutes I modified my script newly using:**  
**`whitespace: charset reduce [space tab cr lf] ws: [any whitespace]`**

**[08:18](#msg5e329160594a0517c24d6a0e)to make it more clear.**

**bubnenkoff**

**[08:19](#msg5e32918ffe0e6f74e9e5bc46)&gt; If you don't know exact data structure, you should not construct object directly, but first store intermediate data (using blocks and not objects, as I recommended to you at the beginning) and than go thru these data and pick only the content you want.**

**I am not sure that I understand your idea. It's look like I am trying to do same with your example. What principal difference?**

**Oldes**

**[08:19](#msg5e3291afdc52c34ace2c07ae)You are mixing a lot of different approaches.**

**[08:21](#msg5e329214ea9ba00b849548dc)And you showed just one data example... if you know, that tags in your data may be in random order.. none of current solutions will work.**

**bubnenkoff**

**[08:24](#msg5e3292a4bfe65274eac254b2)&gt; You are mixing a lot of different approaches.**

**You mean that I am trying to do some processing in `( )` ?**

**Oldes**

**[08:24](#msg5e3292bad9895b17c3b47cac)You will have to use the XML decoder, or parse the structure into intermediate structure, which may look like:**  
**`[ purchaseNumber "0373200101018000262" id "19160099" lot [ purchaseObjects [...] maxPrice "4343" garbage "..." ] foo "...." ]`**  
**and construct your object from this structure.**

**bubnenkoff**

**[08:25](#msg5e3292fadc52c34ace2c0de3)But what next? How to get from needed structure?**

**Oldes**

**[08:25](#msg5e329314f301780b834c1095)And if you want to know it, you don't see `"hello"` because your `parse-lot` fails. Definitely in the `parse-object` part.**

**[08:27](#msg5e32935ed9895b17c3b48014)And of course... if you use `| skip` in inner rules, you will skip to end and never reach**

**bubnenkoff**

**[08:43](#msg5e329720594a0517c24d95f1)&gt; And if you want to know it, you don't see `"hello"` because your `parse-lot` fails. Definitely in the `parse-object` part.**

**How to understand part where it fails?**

**rebolek**

**[08:50](#msg5e3298debfe65274eac2886a)You need to add some debug code there, or use `parse/trace`**

**bubnenkoff**

**[08:55](#msg5e329a0658f02e349747b7bb)it stupid question, but what debug code would be better? simply printing currently collection data?**

**rebolek**

**[09:03](#msg5e329bddf6945f41ef40acfa)@bubnenkoff it's not a stupid question. Currently, I'm debugging one parse rule, let's say `[sub1 opt sub2 sub3]`. To know how far I got, I've inserted few set-words there: `[p1: sub1 p2: opt sub2 p3: sub3]` Now when the rule end, I can check p1-3 values to see where exactly the parse was.**

**Oldes**

**[09:25](#msg5e32a1163aca1e4c5f4930fb)@bubnenkoff if I simplify your `parse-object` rule, you are having this:**  
**`data: "<a><b>a</b></a>" parse data [ <a> thru <b> copy b to </b> </a> ]`**

**[09:26](#msg5e32a13b73ddad4acd772e24)Which is wrong. Because as it was already mentioned, `to` does not skips the tag for you.**

**[09:26](#msg5e32a162433e1d40397b6a73)What you want is:**  
**`parse data [ <a> thru <b> copy b to "<" </b> </a> ]`**

**[09:27](#msg5e32a188f6945f41ef40db33)\*But* this works only if there are \*NO* spaces!**

**[09:28](#msg5e32a1cdfe0e6f74e9e63402)So you want to use:**  
**`whitespace: charset reduce [space tab cr lf] data: "<a> <b>a</b> </a>" parse data [ <a> thru <b> copy b to "<" </b> any whitespace </a> ]`**

**[09:30](#msg5e32a23fd9895b17c3b4e150)\*But* this of course will work only for well formed input, because `thru` may skip out of your [tag content!]()**

**[09:31](#msg5e32a282dc52c34ace2c875b)So that is the reason, why I used in my code something like:**  
**`parse data [ <a> any whitespace <b> copy b to "<" </b> any whitespace </a> ]`**

**[09:36](#msg5e32a39d594a0517c24dedfe)And here is example if you want to get multiple ` ` [contents (using skip):**  
**`data: "<a> <b>x</b> </a> <c/> <a> <b>y</b> </a>" parse data [ any [ <a> any whitespace <b> copy b to "<" </b> any whitespace </a> ( probe b ) | skip ] ]`]()**

**[09:38](#msg5e32a3f8bfe65274eac2e70f)You should really understand this, because in above parse rule is key knowledge.**

**[09:43](#msg5e32a53840da694c5eefbafb)And once you will know, what above does, you can extend it, like:**  
**`data: "<a> <b>b1</b><c>c1</c> </a> <c/> <a> <c>c2</c><b>b2</b> </a>" parse data [ any [ <a> any [ any whitespace <b> copy b to "<" </b> | any whitespace <c> copy c to "<" </c> ] any whitespace </a> ( print [b c] ) | skip ] ]`**

**[09:45](#msg5e32a5afd9895b17c3b4f996)And than... you will realize, that there may be \_empty_ tags in your data... so you will like to add:**  
**`data: "<a> <b>b1</b><c>c1</c> </a> <d/> <a> <c>c2</c><b/> </a>" parse data [ any [ <a> any [ any whitespace <b> copy b to "<" </b> | any whitespace <c> copy c to "<" </c> | any whitespace <b/> (b: none) | any whitespace <c/> (c: none) ] any whitespace </a> ( print [b c] ) | skip ] ]`**

**[09:45](#msg5e32a5cc40da694c5eefbe50)And.. so on.. :-)**

**[09:49](#msg5e32a69673ddad4acd775717)And one day... you will realize, that there may be garbage in the middle of your [, so you will ask us, and we will show you this:**  
**`data: "<a> <b>b1</b><c>c1</c> fooo </a> <d/> <a> <c>c2</c><b/> </a>" parse data [ any [ <a> any [ any whitespace <b> copy b to "<" </b> | any whitespace <c> copy c to "<" </c> | any whitespace <b/> (b: none) | any whitespace <c/> (c: none) | any whitespace </a> break | skip ] ( print [b c] ) | skip ] ]`]()**

**[09:54](#msg5e32a7c9bfe65274eac30275)... but that does not handle unclosed [... so you will learn new level:**  
**`data: "<a> <b>b1</b><c>c1</c> fooo </a> <d/> <a> <c>c2</c><b/> <a><b>b3</b></a>" parse data [ any [ <a> (b: c: none) any [ any whitespace <b> copy b to "<" </b> | any whitespace <c> copy c to "<" </c> | any whitespace <b/> (b: none) | any whitespace <c/> (c: none) | any whitespace ahead </a> break ;<--- check if there will be closing tag | skip ;<--- so this skip will not go until end ] ( print [b c] ) | skip ] ]`]()**

**[bubnenkoff]()**

**[]()**

**[]()[10:19](#msg5e32ad9b40da694c5eeff3a9)Oh))) Big thanks)) Be honestly I started learn Red Parse after fail with attempts to process millions of XML with Python. All of them may have dynamic structure. Some sections may exist, or may have nested and so on. So now I want to create new rule every time when current will return `false`. I am not sure that I would get success because I have problem even with single file, but at last I will try)))**

**[10:33](#msg5e32b10a433e1d40397be57f)&gt; @bubnenkoff in your above code:**  
**&gt;**  
**`> "<OKPD2>" > thru "<code>" copy c to "</code>" thru "<name>" copy n to "</name>" (...) > "</OKPD2>" | skip >`**  
**&gt; It fails, because you have `to ""` and than expects `""`, which is not there yet!**

**`whitespace: charset reduce [space tab cr lf] ws: [any whitespace]`**

**is it better:**  
**`parse-object: [ any [ "<OKPD2>" thru "<code>" copy c to "</code>" thru "<name>" copy n to "</name>" "</name>" whitespace ( append purchaseObjects object [ code: c name: n ] ) "</OKPD2>" | skip ] ]`**

**?**

**pekr**

**[10:38](#msg5e32b22eea9ba00b849643b1)I am not following the discussion, just joined now - `whitespace`- are you absolutly there is some whitespace involved? Maybe it would be more flexible to have it as `any whitespace`?**

**bubnenkoff**

**[10:41](#msg5e32b2ddbfe65274eac35bf6)I have updated code to show what Oldes mean by `whitespace`**

**[10:44](#msg5e32b392f6945f41ef41651d)@Oldes back to debugging. In which of this to parts it's better add `probe/prints` to be sure that they are completed?**  
**Here:**  
**`parse-object: [ any [ "<OKPD2>" thru "<code>" copy c to "</code>" thru "<name>" copy n to "</name>" whitespace ( append purchaseObjects object [ code: c name: n ] ) "</OKPD2>" | skip ] ]`**  
**or**  
**`parse-lot: [ (purchaseObjects: copy []) any [ "<purchaseObjects>" parse-object to "</purchaseObjects>" "</purchaseObjects>" ; maybe here? ] ]`**

**Oldes**

**[10:49](#msg5e32b4bedc52c34ace2d1e08)Why don't you simply drop your version and not try to play with mine? I really give up. You even still use strings instead of tags.**

**[10:52](#msg5e32b55115941335583d4f6d)At least please stop using `to "" ""` and use `to "<"` instead, because you are adding additional computation if you use `to ""` instead of just `to "<"` and even more optimal `to #"<"` which I'm not using with you, because you are confused enough even without knowing difference between string and char.**

**pekr**

**[10:54](#msg5e32b5cbf6945f41ef4176b9)Oldes - does using tags instead of strings make any difference? I mean - with the string parsing anyway?**

**rebolek**

**[10:56](#msg5e32b65ad9895b17c3b57296)No, both are strings, but this is Red, so why not using proper datatype, when you have the chance?**

**Oldes**

**[11:00](#msg5e32b748d9895b17c3b57931)@bubnenkoff I'm giving you last chance... please forget `thru` and `to` in your code, and use something from the explained example above... here is what you want for :**  
**`OKPD2-rule: [ <OKPD2> (c: n: none) any [ any whitespace <code> copy c to "<" </code> | any whitespace <name> copy n to "<" </name> | any whitespace ahead </OKPD2> break | skip ] </OKPD2> ( print ["code:" c "name:" n] ) ] file: { <OKPD2> <code>11.131.11</code> <name>Foo111</name> <name>Foo222</name> </OKPD2> <OKPD2> <name>Bar222</name> <code>22.131.22</code> </OKPD2> <OKPD2><code>Bla</code><name/><foo>moo</foo></OKPD2> } parse file [ any [OKPD2-rule | skip] ]`**

**pekr**

**[11:04](#msg5e32b842bfe65274eac383bd)@rebolek Any chance to improve our code is of course very welcomed. But I've got the feeling that Dmitry has still some concepts to learn. As for a suggestion to drop to/thru, I can tell you one thing - there would be no parse for me, if I would not be able to start with those two. Later on I have realised, what is Oldes suggesting now. But I needed to come to that with my own experience :-)**

**Oldes**

**[11:07](#msg5e32b90558f02e349748a44f)It is fine using `to` &amp; `thru`, but you must trust the input data you parse... else you will fail, if you for example have swapped `and , how I have in above test.`**

**`pekr 11:09I know :-) For me also, the completly next level was recursive rules :-) Your above code is nice and clean, nothing against that .... Oldes 11:13@bubnenkoff regarding debugging and your question.. it is like this: >> parse "<a><b/></a>" [thru <a> copy x to </a> position:] == false result is false, because the position of the input is not at tail! >> position == "</a>" 11:14This is the way: >> parse "<a><b/></a>" [thru <a> copy x to </a> position: </a> position2:] == true >> position2 == "" pekr 11:17@Oldes Do you use to endin your code? Oldes 11:18Often.. if I want to have true from parse and don't care about rest of the input. pekr 11:19The same here .... 11:20I am using Red mostly interpreted. Have you tried to compile the code? Will parse be faster then? rebolek 11:24IIRC parse runs same speed when compiled. bubnenkoff 11:35@Oldes ok, I understood. But where to place position if my parse have separate rules like: parse-object: [ any [ "<OKPD2>" thru "<code>" copy c to "</code>" thru "<name>" copy n to "</name>" whitespace ( append purchaseObjects object [ code: c name: n ] ) "</OKPD2>" | skip ] pos: ] I am getting error: Script Error: pos has no value 11:36ok, one moment I am looking what you wrote above. just seen it Oldes 11:36pos has no value, because your rule always fails and never reaches pos: part. I'm probably bad teacher... better to do something what I know. bubnenkoff 11:38oh! you are perfect teacher! 11:39Really, you very helped me. I was not able to continue without your explanations and examples 11:40Really. Sorry that I am not folowing 100% what are you saying, but I sometimes not fully understand reasons when I should do like this or like that, because all variants looks logical for me 12:53I will continue learn your examples, but hist want to mention, than I talked about different xml struct, I mean not thy are corrupted of have enclosed tags. I mean that can be few hundreds of variants, so readability is very important Rebol2Red 17:57How to parse this with Red? formula: "2d6" print parse formula [integer! "d" integer!] Expected to get true This used to work in Rebol but in Red i get this: *** Script Error: PARSE - matching by datatype not supported for any-string! input rebolek 17:58 digit: charset [#"0" - #"9"] rule: [digit #"d" digit] Rebol2Red 18:00I meant why is this not supported anymore rebolek 18:01Anymore? AFAIK it was never supported in Red. 18:03It works in Rebol, but Red doesn't share codebase with Rebol. Rebol2Red 18:05Ofcourse i meant it was used in Rebol and i still see Red as the successor of Rebol I have to get used that Red is not downwards compatible with Rebol But ... Thanks! dockimbel 18:38@Rebol2Red Some facts: * Rebol3 does not support such parsing mode: >> print parse formula [integer! "d" integer!] ** Script error: PARSE - invalid rule or usage of rule: integer! * Rebol2 supports it, because its lexer works on string! series, as strings are stored simply as byte arrays (no Unicode support!). * Red allows it in the fast-lexer branch, but only on binary! series and only strict literal values are supported: >> print parse to-binary "2 d 6" [integer! " d " integer!] true 18:47What you really want is the digit rule above and not integer!. 18:57> I have to get used that Red is not downwards compatible with Rebol Another blatantly false generalization... Rebol2 has no Unicode support, so I guess you want Unicode to be removed from Red to make it more compatible with Rebol2? greggirwin 20:18@Rebol2Red Red is not 100% compatbile with R2, or R3. But R3 isn't R2 compatible either. @dockimbel I don't think @Rebol2Red meant it as a criticism of Red, just managing their own expectations.`**

**````Friday 31st January, 2020 bubnenkoff 09:45I am back. How to check if pairs of tags exists in doc? some [ "<lot>" to "</lot>" | skip ] will not work because skip. But without skip I would not able to go next 09:57I have only one idea: some [ thru "<lot>" thru "</lot>" to end ] But I remember that I should not use some\any with thru pekr 09:59I am not sure. But I think something along the lines of what Oldes showed you yesterday. You create a subrule, which itself has to apply, or fail as a whole .... bubnenkoff 10:22I am not sure that I would able to maintain Oldes code(( I learned from it a lot, but the only way only to learn how to write code myself. I can't figure out why next code is return false. While it should be true. I think something wrong with to end, but can't understand what exactly: parse-lot: [ (purchaseObjects: copy []) some [ thru "<purchaseObjects>" to "</purchaseObjects>" "</purchaseObjects>" to end ; I think problem is here ] ] parse file [ (lots: copy []) some [ thru "<lot>" parse-lot "</lot>" to end ] ] pekr 10:26Maybe the problem is with the parse-lot some, which is 1 or more .... try to use any, which is 0 or more. What if the first thrufails in there? Then the whole rule fails .... bubnenkoff 10:26I tried to debug it with pos: thru "<purchaseObjects>" to "</purchaseObjects>" "</purchaseObjects>" to end pos: But I do not understand result: >> pos == "" 10:28> Maybe the problem is with the parse-lot some, which is 1 or more .... try to use any, which is 0 or more. What if the first thrufails in there? Then the whole rule fails .... Why any? There should be at last 1 sections with such name >What if the first thru fails in there Why it should fails? pekr 10:29And what if there is not? Then your parser returns false ... 10:29What I try to always do is for parse to return true. It is not needed, but I am used to that that way, as it means to me - I can always parse the file, no matter what kind of content of the file is .... bubnenkoff 10:29Yes, but in my test file all sections are exists: file: {<root> <id>19160099</id> <purchaseNumber>0373200101018000262</purchaseNumber> <lot> <maxPrice>8186313.66</maxPrice> <purchaseObjects> <purchaseObject> <OKPD2> <code>11.131.11</code> <name>Foo111</name> </OKPD2> <currency> <code>666</code> </currency> <price>111</price> </purchaseObject> <purchaseObject> <OKPD2> <code>22.12.55</code> <name>Bar222</name> </OKPD2> <price>222</price> </purchaseObject> <purchaseObject> <OKPD2> <code>33.322.41</code> <name>Baz333</name> </OKPD2> <price>333</price> </purchaseObject> </purchaseObjects> </lot> </root>} 10:31> What I try to always do is for parse to return true Not for my case. I should return fail if some sections do not exists pekr 10:32Your code is quite messy. First - what is purchaceObjects there for? In terms of your code, you are not using it .... bubnenkoff 10:33Yes, now I am not using it. I am just learining how to iterate pekr 10:34Second - the reason why it returns false is - in terms of your parse-lot rule you move the parser to the end ... once the rule ends, there is still "" to endto continue with ... and it fails, as already being at the end ... bubnenkoff 10:35so to end move it to end of file? Not to end of section? 10:36how I can skip all that can be after ""? Do not jumping to end of file? For example I can have something like: </purchaseObjects> </someanothertag> ; <-- </lot> </root>} pekr 10:52Either you can use to/thru to move between the sections, but most users here would probably prefer "proper" parsing, so just rules and using skip as an alternative, if the rule does not match. To/thru are nice helpers, but those might fail badly, especially if someone forgets to close the tag, etc. 11:02I am looking into what Oldes posted yesterday and you have mostly everything you need already. It escapes my mind, why are you starting over? 11:04If the XML is complicated, or it can contain various levels of subitems, it would be probably good to use some already made XML parser and work with the Red data it produces .... bubnenkoff 11:32The problem that XML very complicated. The XML parser have issue https://gitter.im/red/parse?at=5e315b84f6945f41ef3794ab I can use skip but it will skip section if it is not found. But I should be 100% sure that it exists or return fail 11:42For example if we add any tags to Oldes example it will return false. My xml are very complex and it may have any sections on any place. For example adding one section will break Oldes example: file: {<root> <id>19160099</id> <purchaseNumber>0373200101018000262</purchaseNumber> <foo> ; <------------------------------------ only one foo make it return false <lot> <maxPrice>8186313.66</maxPrice> <purchaseObjects> <purchaseObject> <OKPD2> <code>11.131.11</code> <name>Foo111</name> </OKPD2> <currency> <code>666</code> </currency> <price>111</price> </purchaseObject> <purchaseObject> <OKPD2> <code>22.12.55</code> <name>Bar222</name> </OKPD2> <price>222</price> </purchaseObject> <purchaseObject> <OKPD2> <code>33.322.41</code> <name>Baz333</name> </OKPD2> <price>333</price> </purchaseObject> </purchaseObjects> </lot> </root>} whitespace: charset reduce [space tab cr lf] ws: [any whitespace] rule-object: [ ws <purchaseObject> [ ws <OKPD2> [ ws <code> copy *cd to "<" </code> ws <name> copy *nm to "<" </name> ] ws </OKPD2> ws opt [<currency> thru </currency>] ;- currency is not used ws <price> thru </price> ;- price is not used ( append purchases object [code: *cd name: *nm] ) ] ws </purchaseObject> ws ] rule-lot: [ (purchases: copy []) ws <maxPrice> copy *mp to "<" </maxPrice> ws <purchaseObjects> any rule-object </purchaseObjects> ws ] parse file [ (data: none) ws <root> [ ws <id> copy *id to "<" </id> ws <purchaseNumber> copy *pn to "<" </purchaseNumber> ws <lot> rule-lot </lot> ( data: object [ id: *id lots: object [ maxPrice: *mp purchaseObjects: purchases ] ] ) ] ws </root> ] 11:59Yes I checked: thru "<purchaseObjects>" to "</purchaseObjects>" "</purchaseObjects>" to end pos: to end is jumping to the end of file toomasv 12:31@bubnenkoff If you want to check that all tags are properly paired you’ll have to do some book-keeping, i.e. register each tag’s opening and closing, while skipping through the file. GalenIvanov 12:34@toomasv Pushing to / popping from a stack? rebolek 12:35That's one of the easiest ways to implement recursive parsers. bubnenkoff 12:43it's seems that I got idea how to do what I want. I need co conception: tag: [any ["<" thru ">"] | ws] ; skip any tag or space\linebreak not_tag: [not any [ "" ]] ; tags that I **should not** skip pekr 12:53tag: [any ["<" thru ">"] | ws]not sure it is correct. Just stop fearing the general skip! What if there is no white-space contained in the charset, but just regular char? toomasv 13:26@bubnenkoff Here is an example without single : stack: clear [] parse file [some [ "</" copy _ to #">" [if (_ = take stack) | reject] | #"<" copy _ to #">" (insert stack _) | skip ]] == true And here is same with added: ... == false >> stack == ["/lot" "foo" "root"] pekr 13:31What kind of woodoo is that? My parse skills are frozen in the permafrost :-) 13:31Never used ifmyself, nor take toomasv 13:35Here is stack dynamics on each change on correct pairs: ["root"] ["id" "root"] ["root"] ["purchaseNumber" "root"] ["root"] ["lot" "root"] ["maxPrice" "lot" "root"] ["lot" "root"] ["purchaseObjects" "lot" "root"] ["purchaseObject" "purchaseObjects" "lot" "root"] ["OKPD2" "purchaseObject" "purchaseObjects" "lot" "root"] ["code" "OKPD2" "purchaseObject" "purchaseObjects" "lot" "root"] ["OKPD2" "purchaseObject" "purchaseObjects" "lot" "root"] ["name" "OKPD2" "purchaseObject" "purchaseObjects" "lot" "root"] ["OKPD2" "purchaseObject" "purchaseObjects" "lot" "root"] ["purchaseObject" "purchaseObjects" "lot" "root"] ["currency" "purchaseObject" "purchaseObjects" "lot" "root"] ["code" "currency" "purchaseObject" "purchaseObjects" "lot" "root"] ["currency" "purchaseObject" "purchaseObjects" "lot" "root"] ["purchaseObject" "purchaseObjects" "lot" "root"] ["price" "purchaseObject" "purchaseObjects" "lot" "root"] ["purchaseObject" "purchaseObjects" "lot" "root"] ["purchaseObjects" "lot" "root"] ["purchaseObject" "purchaseObjects" "lot" "root"] ["OKPD2" "purchaseObject" "purchaseObjects" "lot" "root"] ["code" "OKPD2" "purchaseObject" "purchaseObjects" "lot" "root"] ["OKPD2" "purchaseObject" "purchaseObjects" "lot" "root"] ["name" "OKPD2" "purchaseObject" "purchaseObjects" "lot" "root"] ["OKPD2" "purchaseObject" "purchaseObjects" "lot" "root"] ["purchaseObject" "purchaseObjects" "lot" "root"] ["price" "purchaseObject" "purchaseObjects" "lot" "root"] ["purchaseObject" "purchaseObjects" "lot" "root"] ["purchaseObjects" "lot" "root"] ["purchaseObject" "purchaseObjects" "lot" "root"] ["OKPD2" "purchaseObject" "purchaseObjects" "lot" "root"] ["code" "OKPD2" "purchaseObject" "purchaseObjects" "lot" "root"] ["OKPD2" "purchaseObject" "purchaseObjects" "lot" "root"] ["name" "OKPD2" "purchaseObject" "purchaseObjects" "lot" "root"] ["OKPD2" "purchaseObject" "purchaseObjects" "lot" "root"] ["purchaseObject" "purchaseObjects" "lot" "root"] ["price" "purchaseObject" "purchaseObjects" "lot" "root"] ["purchaseObject" "purchaseObjects" "lot" "root"] ["purchaseObjects" "lot" "root"] ["lot" "root"] ["root"] [] == true 13:40Ah, earlier second example was false - I forgot about the comment. 13:45Here is corrected code: stack: clear [] parse file [some [ "</" copy _ to #">" [if (_ = take stack) (probe stack) | reject] | not "</" #"<" copy _ to #">" (insert stack _) (probe stack) | skip ]] ... with the end of stack dynamics as follows ( included): ... ["purchaseObjects" "lot" "foo" "root"] ["lot" "foo" "root"] ["foo" "root"] == false pekr 13:51Nice! toomasv 14:34Some more musings. Due to some problems (#3478, #4193) the above would fail on some occasions, e.g. if single is last in file. Then the parse result is true but stack is not empty: ... == true >> stack == ["foo"] That's because reject does not return immediately, IIUC. To remedy this: stack: clear [] parse file [ some [ "</" copy _ to #">" [if (_ = first stack) (remove stack) | thru end] | not "</" #"<" copy _ to #">" (insert stack _) | skip ] if (empty? stack) ] == false >> stack == ["foo"] Saturday 1st February, 2020 dander 00:02@bubnenkoff >I am not sure that I would able to maintain Oldes code and >My xml are very complex and it may have any sections on any place. For example adding one section will break Oldes example But in your example, the introduced <foo> makes the xml malformed, so isn't failing appropriate in that case? I would suggest you spend some more time with Oldes' code and see if you can understand it better and adapt it. Either way with his or yours, it sounds like you have a fair amount of exploration to do. I have this sense that to and thru seem simpler/faster to everyone while they are first starting with it (it certainly was for me) and everyone just needs to spend some target practice with their foot to eventually realize that they make things more brittle and harder to troubleshoot. Especially with something as complex as xml. 00:04One other note - I noticed a couple people mentioning parse/trace in here, but no parse-trace? It provides its own callback, which is a bit verbose, but *extremely* useful for understanding what parse is doing greggirwin 18:47@dander +1. To/Thru can be very helpful for certain formats, and chunking, but as soon as the markers can appear in content elsewhere, they lose their value. They can also be handy when doing exploratory parsing on large inputs. I've also used find and non-parse approaches there to good effect. Monday 3th February, 2020 bubnenkoff 07:40Why not do not work? >> parse "aa" [not "bb"] == false >> parse "bb" [not "bb"] == false rebolek 07:44@bubnenkoff not does not advance. >> parse "aa" [not "bb" (print "ok")] ok == false >> parse "bb" [not "bb" (print "ok")] == false 07:44So your rule works, it just doesn't move to the end, so the result is false. toomasv 11:43@bubnenkoff These are semantically same: >> rejoin parse "aabca" [collect some [not "b" keep skip | skip]] == "aaca" >> rejoin parse "aabca" [collect some ["b" | keep skip]] == "aaca" Oldes 12:03@toomasv I'm not sure if this is good example, especially for @bubnenkoff ;-) toomasv 12:03Why not? Oldes 12:03Because he has troubles to understand easier things. toomasv 12:07Let's not lose hope! not is negative lookahead, i.e. like excluding condition: not a b means "b except a". :) Thursday 13th February, 2020 bubnenkoff 07:59I am back! So not invert rule. But how to make it to do advice? Am I right understand that correct rule are do advice? rebolek 08:02not dos not advance and correct rules do, right. 08:03But how should not know how far to advance? Let's say you have parse "abcdefgh" [not #"z"]. Where do you expect the not rule to stop? Sunday 16th February, 2020 GiuseppeChillemi 15:28diary note: I had a great emotion today: I have created a mini DSL for building queries and parsed my first instruction block.... And I did this all by myself ! pekr 15:40I know that feeling! :-) GiuseppeChillemi 15:46@pekr do you remember when you had it? pekr 17:163 weeks ago, when I delivered small app in Red, parsing https content, creating a CSV file, using calendar widget in a pop-up window, even if it is still a beta stuff :-) greggirwin 17:25Congratulations to both of you! It's a great feeling indeed. Monday 17th February, 2020 bubnenkoff 07:52> > do https://raw.githubusercontent.com/rebolek/red-tools/master/codecs/xml.red > data: xml/decode file > Let's assume that now I want to try xml parsing lib. How it can help me? Entry data: I have data-structure that I hope to find in xml file, but I can't be sure for 100% if it present in it. Can xml parser simplify this task? 07:54Data example: file: {<root> <id>19160099</id> <purchaseNumber>0373200101018000262</purchaseNumber> <lot> <maxPrice>8186313.66</maxPrice> <purchaseObjects> <purchaseObject> <OKPD2> <code>11.131.11</code> <name>Foo111</name> </OKPD2> <currency> <code>666</code> </currency> <price>111</price> </purchaseObject> <purchaseObject> <OKPD2> <code>22.12.55</code> <name>Bar222</name> </OKPD2> <price>222</price> </purchaseObject> <purchaseObject> <OKPD2> <code>33.322.41</code> <name>Baz333</name> </OKPD2> <price>333</price> </purchaseObject> </purchaseObjects> </lot> </root>} I it's synthetic example of course. rebolek 08:10@bubnenkoff If you also do https://raw.githubusercontent.com/rebolek/red-tools/master/html-tools.red, you'll get foreach-node function and then you can: >> foreach-node xml/decode {<parent><child id="1">Bob</child><child id="2">Alice</child></parent>} [print [tag mold content attributes]] parent [child [none "Bob" #()] #( "id" "1" ) child [none "Alice" #()] #( "id" "2" )] child [none "Bob" #()] "id" "1" none "Bob" child [none "Alice" #()] "id" "2" none "Alice 08:12Or for example: >> foreach-node xml/decode {<parent><child id="1">Bob</child><child id="2">Alice</child></parent>} [if tag = 'child [print [second content select attributes "id"]]] Bob 1 Alice 2 bubnenkoff 08:40ok, thanks 09:16I wrote function that extract tag name and return it. tn: function[tag] [ parse tag [thru "<" copy tag_name to ">" ] tag_name ] I want to use it's result (return value) in another function. The problem that I do not know how to do it. extract_data: function[tag] [ parse tag [ mytag_name: tn tag (print tag_name) ] ] mytag_name here will work as pointer, and will not receive value from tn rebolek 09:35Of course, you are mixing parse dialect with Red code. bubnenkoff 09:54is it possible to use value from function inside parse dialect? rebolek 09:57of course 09:57parse "abcd" [copy x to #"c"] print x 09:58nothing complicated here Oldes 09:59@bubnenkoff >> result-from-function: "foo" parse "foo" [result-from-function] == true 10:00Your problem is, that you are trying to call the function inside parse rules. bubnenkoff 10:00> Your problem is, that you are trying to call the function inside parse rules. it's not allowed? Oldes 10:01As Rebolek said... you are mixing parse dialect with Red code. And to be honest, I cannot read your extract_data function. I don't understand what you want to achieve. 10:03Why don't you have just: extract_data: function[tag] [ mytag_name: tn tag ] 10:05Not mentioning, that tag_name is local to tn function, so you cannot use it in extract_data bubnenkoff 11:30> As Rebolek said... you are mixing parse dialect with Red code. And to be honest, I cannot read your extract_data function. I don't understand what you want to achieve. I tried to pass in parse function, than use it's result in another parse expression 11:43is it possible to extend parse with own rules\words? Oldes 11:46Of course... that is the main usage.. that you write own rules and then use them. bubnenkoff 11:48oh, yeah, it's seems stupid question from me 11:50I world like to look how words like skip implemented. Where it's placed on source tree? https://github.com/red/red 11:51Oh it's seems here https://github.com/red/red/blob/master/runtime/parse.reds Oldes 11:51[skip](https://github.com/red/red/blob/d513c8f9b0882e541ec3068d0691ae6376302793/runtime/parse.reds#L1495-L1500) bubnenkoff 12:10oh, so it's really done without functions greggirwin 19:37@bubnenkoff you can include Red code in parse rules as actions, using parens. The important thing is to be clear on which is which, and once you call a function in an action, it has no idea that it was called from parse, so you need to manage any context and data sharing yourself. GiuseppeChillemi 22:00Is there a way to set the input position from the inside of code in parens (mycode) ? hiiamboris 22:03no GiuseppeChillemi 22:12Pardon, I can't actually test it. Is it the correct form to evaluate the content of a paren and insert the result value in current input and apply the rules set to new value? parse [mydata] [ set argument any [word! | integer! | paren! (x: do argument) insert x] ] 22:28note: parse mydata and not parse [mydata] endo64 23:15 >> parse b: [start (probe 3 * 5) end] [any [word! | integer! | p: paren! (x: do first p) insert x skip]] b 15 == [start (probe 3 * 5) 15 end] Tuesday 18th February, 2020 toomasv 04:20Also: >> parse b: [start (3 * 5) end] [any [word! | set arg paren! insert (do arg)]] == true >> b == [start (3 * 5) 15 end] > 04:26Or use change: >> parse b: [start (3 * 5) end] [any [word! | change set arg paren! (do arg)]] b == [start 15 end] 04:35Alternative: >> parse b: [start (3 * 5) end] [any [word! | change s: paren! (do first s)]] b == [start 15 end] GiuseppeChillemi 07:33@endo64 If I understand it correctly, skip is not needed as I want the evaluate the result under the light of the same rules. I will try it later. 07:39@toomasv Thanks, I like the second one a lot. toomasv 08:02@GiuseppeChillemi If you use insert, it is better to do it so: >> parse b: [start (3 * 5) end] [any [word! | p: paren! insert (do first p)]] b == [start (3 * 5) 15 end] 08:05Or put x in parens: parse b: [start (3 * 5) end] [any [word! | p: paren! (x: do first p) insert (x)]] 08:08Otherwise it may be treated as part of rule and generates error: *** Script Error: PARSE - invalid rule or usage of rule: 15 08:14This is actually interesting! The number (without parens) is inserted AND treated as rule. Maybe bug? Consider this: >> parse b: [start (2 * 3) a a a a a a end] [any [word! | p: paren! (x: do first p) insert x 'a]] == true >> b == [start (2 * 3) 6 a a a a a a end] 08:18In @endo64's example above it inserts 15 and then tries to match 15 skip but as there are not so many elements, it fails. If you leave out skip you'll get "Invalid rule" error, because integer rule needs something to loop over. 08:37@GiuseppeChillemi You could also do such things: >> parse b: [start (3 * 5) end] [any [word! | p: paren! q: (x: do first p) (r: insert q x) :r]] b == [start (3 * 5) 15 end] >> parse b: [start (3 * 5) end] [any [word! | p: paren! (change p do first p)]] b == [start 15 end] bubnenkoff 10:33> @bubnenkoff you can include Red code in parse rules as actions, using parens. The important thing is to be clear on which is which, and once you call a function in an action, it has no idea that it was called from parse, so you need to manage any context and data sharing yourself. Big thanks for this explanation. hiiamboris 11:11@toomasv looks like a bug indeed bubnenkoff 11:37Oh... my result rule is doing what I want ( @Oldes sorry that I was not able to use your code ) it's return true if every section is exists and parseable plus data from them, and false if any of them do not founded. I spend a lot of time thinking about how it can be simplifed but have not any idea. But at last it's doing exactly what I want: whitespace: charset reduce [space tab cr lf] ws: [any whitespace] parse file [ ( lots: copy [] id: none purchaseNumber: none responsibleOrg_regNum: none responsibleOrg_inn: none responsibleOrg_kpp: none responsibleOrg_fullName: none responsibleOrg_postAddress: none responsibleRole: none ) thru "<id>" copy _id to "</id>" (id: _id) thru "<purchaseNumber>" copy _purchaseNumber to "</purchaseNumber>" (purchaseNumber: _purchaseNumber) thru "<responsibleOrg>" thru "<regNum>" copy _responsibleOrg_regNum to "</regNum>" (responsibleOrg_regNum: _responsibleOrg_regNum) thru "<inn>" copy _responsibleOrg_inn to "</inn>" (responsibleOrg_inn: _responsibleOrg_inn) thru "</responsibleOrg>" some [ ( lot: copy [] maxPrice: none ) thru "<lot>" thru "<maxPrice>" copy _price to "</maxPrice>" (maxPrice: _price ) some [ thru "<purchaseObjects>" (purchaseObjects: copy []) some [ thru "<OKPD2>" thru "<code>" copy c to "</code>" thru "<name>" copy n to "</name>" "</name>" ( append purchaseObjects object [ code: c name: n ] ) | ws "</OKPD2>" ] thru "</purchaseObjects>" (print "Hello") ] ( append lot object [ price: maxPrice Objects: purchaseObjects]) thru "</lot>" ( append lots object [ id: _id purchaseNumber: _purchaseNumber responsibleOrg_regNum: _responsibleOrg_regNum responsibleOrg_inn: _responsibleOrg_inn lots: lot ] ) ] to end ] write %file.txt to-json lots rebolek 11:54How it can be simplified? You can start with removing (almost) duplicate words: thru "<purchaseNumber>" copy _purchaseNumber to "</purchaseNumber>" (purchaseNumber: _purchaseNumber) is same as thru "<purchaseNumber>" copy purchaseNumber to "</purchaseNumber>" endo64 12:48@toomasv Thanks, I thought it looks like a bug but didn't have time to dig so I just added skip to prevent the error :) toomasv 16:35@endo64 Yes, funny thing, took me a while to figure it out, too. endo64 21:39https://github.com/red/red/issues/4153 Wednesday 19th February, 2020 GiuseppeChillemi 22:57I like learning parse on cold winter days. When you make mistakes and your cpu runs an infinite cycle, you can feel the air of the cpu fan running at high speeds and warming your room. hiiamboris 23:12try compiling more ;) Thursday 20th February, 2020 GiuseppeChillemi 06:14Houston, I have a problem. I need to split each part of a text like the following by header and append it to an output block by [header-type content-including-headers-and-footer]. I failed and I have no idea on how to solve the problem: opening-header_random-data-and-lenght ---- header1 [a-random-name] ---- random-stuff-here ending-formula ---- header2 [a-random-name] ---- random-stuff-here ending-formula ---- header3 [a-random-name] ---- random-stuff-here ending-formula ---- header2 [a-random-name] ---- random-stuff-here ending-formula ---- header2 [a-random-name] ---- random-stuff-here [a-random-name] ending-formula ---- header1 [a-random-name] ---- random-stuff-here ending-formula ---- header1 [a-random-name] ---- random-stuff-here ending-formula ---- header2 [a-random-name] ---- random-stuff-here ending-formula ---- header3 [a-random-name] ---- random-stuff-here ending-formula ---- header4 [a-random-name] ---- random-stuff-here ending-formula ---- header4 [a-random-name] ---- random-stuff-here ending-formula ---- header4 [a-random-name] ---- random-stuff-here ending-formula ---- header5 [a-random-name] ---- random-stuff-here ending-formula ---- header6 [a-random-name] ---- random-stuff-here ending-formula ---- header7 [a-random-name] ---- random-stuff-here ending-formula ---- header6 [a-random-name] ---- random-stuff-here ending-formula ---- header6 [a-random-name] ---- random-stuff-here ending-formula ---- header7 [a-random-name] ---- random-stuff-here ending-formula ---- header6 [a-random-name] ---- random-stuff-here ending-formula ---- header5 [a-random-name] ---- random-stuff-here ending-formula closing formula I have tried something like: parse/all file-to-analyze [ some [ header-marker1 to ending-marker | header-marker2 to ending-marker | header-marker3 to ending-marker | header-marker4 to ending-marker | header-marker5 to ending-marker | header-marker6 to ending-marker | header-marker7 to ending-marker | skip ] copy script (code to be added here) ] But I failed. Note: I need it to be both Red and Rebol2 compatible if possible. 06:24[a-random-name] mean: two parens with one or more words inside of it. 06:27The output block should be [a-rand-name_content header-type content-of-blocks_including-headers-and-footer] (do not consider the previous one) toomasv 07:15@GiuseppeChillemi Can you show a piece of real input? And example of made-up expected output? GiuseppeChillemi 07:38@toomasv here you can find a complete file to parse: [sample](https://drive.google.com/open?id=1VodnpgR7eQ3UsJBhyw8bLtbajcyKskdv) 07:42[![image.png](https://files.gitter.im/red/parse/bA1A/thumb/image.png)](https://files.gitter.im/red/parse/bA1A/image.png) 07:43Output should be: [2 1 extracted session] 07:44 [ dotes check-constraint { -- ======================================================= -- Check Constraint Nochecks's for Table: [dbo].[DOTes] -- ======================================================= Print 'Check Constraint Nochecks''s for Table: [dbo].[DOTes]' ALTER TABLE [dbo].[DOTes] NOCHECK CONSTRAINT [CK_DOTes_AccontoPerc] ALTER TABLE [dbo].[DOTes] NOCHECK CONSTRAINT [CK_DOTes_Cambio] ALTER TABLE [dbo].[DOTes] NOCHECK CONSTRAINT [CK_DOTes_Cd_DoSottoCommessa] ALTER TABLE [dbo].[DOTes] NOCHECK CONSTRAINT [CK_DOTes_Cd_LS_2] ALTER TABLE [dbo].[DOTes] NOCHECK CONSTRAINT [CK_DoTes_Cd_LS_C] ALTER TABLE [dbo].[DOTes] NOCHECK CONSTRAINT [CK_DOTes_DataDocRif] ALTER TABLE [dbo].[DOTes] NOCHECK CONSTRAINT [CK_DoTes_DataPag] ALTER TABLE [dbo].[DOTes] NOCHECK CONSTRAINT [CK_DOTes_IvaSplit_IvaSospesa] ALTER TABLE [dbo].[DOTes] NOCHECK CONSTRAINT [CK_DOTes_NumeroDocRif] ALTER TABLE [dbo].[DOTes] NOCHECK CONSTRAINT [CK_DOTes_ScontoCassa] GO -- TRANSACTION HANDLING IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END GO } ] 07:45(table name, type of session, content of session from start to end) 07:49This is the ending marker which all sessions have in common: 07:50[![image.png](https://files.gitter.im/red/parse/xlpb/thumb/image.png)](https://files.gitter.im/red/parse/xlpb/image.png) 07:52This is the session start (the one which contains table name and session type) 07:52[![image.png](https://files.gitter.im/red/parse/JetG/thumb/image.png)](https://files.gitter.im/red/parse/JetG/image.png) 07:53@toomasv Hope I have given you everything 07:55If a Rebol2 compatible version is not possible, I drop its requirement. toomasv 07:59@GiuseppeChillemi To make it clear please write example output for this short extract: -- ======================================================= -- Trigger Disable's for Table: [dbo].[DOTes] -- ======================================================= Print 'Trigger Disable''s for Table: [dbo].[DOTes]' ALTER TABLE [dbo].[DOTes] DISABLE TRIGGER [xDoTes_BOW_U1] ALTER TABLE [dbo].[DOTes] DISABLE TRIGGER [xDoTes_BOW_D1] ALTER TABLE [dbo].[DOTes] DISABLE TRIGGER [DOTes_atrg_brd] GO -- TRANSACTION HANDLING IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END GO -- ======================================================= -- Trigger Disable's for Table: [dbo].[DORig] -- ======================================================= Print 'Trigger Disable''s for Table: [dbo].[DORig]' ALTER TABLE [dbo].[DORig] DISABLE TRIGGER [xDoRig_BOW_D1] ALTER TABLE [dbo].[DORig] DISABLE TRIGGER [DORig_atrg_brd] GO -- TRANSACTION HANDLING IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END GO And mark which is * a-rand-name_content * header-type * content-of-blocks_including-headers-and-footer GiuseppeChillemi 08:01@toomasv (Please take a look at my screenshots above) Trigger Disable's = header-type (there are 6 other types like Check Constraints, etc) a-rand-name_Content = DOTes , taken from: [dbo].[DOTes] 08:02content-of-blocks_including-headers-and-footer = -- ======================================================= -- Trigger Disable's for Table: [dbo].[DOTes] -- ======================================================= Print 'Trigger Disable''s for Table: [dbo].[DOTes]' ALTER TABLE [dbo].[DOTes] DISABLE TRIGGER [xDoTes_BOW_U1] ALTER TABLE [dbo].[DOTes] DISABLE TRIGGER [xDoTes_BOW_D1] ALTER TABLE [dbo].[DOTes] DISABLE TRIGGER [DOTes_atrg_brd] GO -- TRANSACTION HANDLING IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END GO toomasv 08:03Ok, thanks! GiuseppeChillemi 08:03You are welcome ! 08:05@toomasv Output block: [ a-rand-name_Content header-type content-of-blocks_including-headers-and-footer a-rand-name_Content header-type content-of-blocks_including-headers-and-footer a-rand-name_Content header-type content-of-blocks_including-headers-and-footer ... ] toomasv 08:05Working on it.. 09:02@GiuseppeChillemi out: parse read %input.txt [ collect some [ thru [s: "^--- =" thru "-- "] copy header-type to " for Table:" thru "].[" keep to #"]" keep (header-type) 2 thru ["^-GO"] e: keep (copy/part s e) ]] foreach [name type content] out [ print to-word lowercase replace/all name " " "-" print to-word lowercase replace/all type " " "-" print content print "" ] dotes trigger-disable's -- ======================================================= -- Trigger Disable's for Table: [dbo].[DOTes] -- ======================================================= Print 'Trigger Disable''s for Table: [dbo].[DOTes]' ALTER TABLE [dbo].[DOTes] DISABLE TRIGGER [xDoTes_BOW_U1] ALTER TABLE [dbo].[DOTes] DISABLE TRIGGER [xDoTes_BOW_D1] ALTER TABLE [dbo].[DOTes] DISABLE TRIGGER [DOTes_atrg_brd] GO -- TRANSACTION HANDLING IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END GO ... Is that it? 09:14Or better: out: parse read %input.txt [ collect some [ thru [s: "^--- =" thru "-- "] copy type to " for Table:" thru "].[" copy name to #"]" keep (to-word lowercase replace/all name " " "-") keep (to-word lowercase replace/all type " " "-") 2 thru ["^-GO"] e: keep (copy/part s e) ]] foreach [name type content] out [print [name type] print content print ""] 09:39You can add new-line/all/skip out true 3 >> probe out [ dotes trigger-disable's {^--- =======================================================^/^--- Trigger Disable's for Table: ... dotes foreign-key-constraint-nochecks's {^--- =======================================================^/^--- Foreign ... dotes check-constraint-nochecks's {^--- =======================================================^/^--- Check Constraint... ... ] GiuseppeChillemi 09:53@toomasv I see collect, so no Rebol2 here... rebolek 09:54So rewrite the rule to use append instead of collect. toomasv 09:55Ah, forgot about Rebol. Was just about to say what @rebolek said .. GiuseppeChillemi 10:13@toomasv Newline is new isntruction to me toomasv 10:14Notice that it is new-line not newline GiuseppeChillemi 10:14Yes, I mistyped it. 10:21I am loarning from you solution: thru [s: here you mark the input to the starting point... You set the input of the start of the commands session, then you skip until the session specification part: thru "-- "] Copying it until "for table:" copy type to " for Table:" 10:22I don't understand the need for the first thru [ 10:23Oh, yes, it skips the header. toomasv 10:29Here is version that appears to work in both Rebol and Red: out: clear [] parse read %input.txt [ some [ to "^--- =" s: thru "^/^--- " copy type to " for Table:" thru "].[" copy name to #"]" (append out to-word lowercase replace/all name " " "-") (append out to-word lowercase replace/all type " " "-") 2 thru "^-GO" e: (append out copy/part s e) | skip ]] | skip in the end isn't actually needed. xqlab 12:43you can also use a version with the function *collect [* outside of parse and then inside *(keep ..)* GiuseppeChillemi 18:11Thanks everyone. Today I have learned a lot. 18:12(I hope!) Friday 21st February, 2020 bubnenkoff 12:29Wow! it's seems that I can generate rules and then use it as code! x: "<id>123</id>" tag_name: parse x ["<" collect keep to ">" to end] parse_rule: rejoin ["thru <" tag_name "> to </" tag_name ">" ] rebolek 12:32Of course. And you can do it in one pass: >> parse "<id>123</id>" [#"<" copy tag-name to #">" thru "</" tag-name #">"] == true bubnenkoff 12:33Thanks! Now readability more important for me. I just realesed that I can do it! rebolek 12:35I'm not sure if your version is more readable. You can replace collect keep with copy, you're getting one value. And making parse rule with rejoin is wrong. You're constructing code, not string. 12:37Also there's a bug, you have to "/>" tag-name which clearly won't work. You need thru there. bubnenkoff 12:37What different between constructing code and string? I thought it's same rebolek 12:37Certainly not! That's one of the Red's main powers! bubnenkoff 12:40 tag_name: parse x ["<" copy x to ">" to end] But copy here will not return value to tag_name 12:42Look. At result I am getting string that look like parse rule: >> x: "<id>123</id>" == "<id>123</id>" >> tag_name: parse x ["<" collect keep to ">" to end] == ["id"] >> parse_result: rejoin ["thru <" tag_name "> copy " tag_name " to </" tag_name ">" " </" tag_name ">" ] == "thru <id> copy id to </id> </id>" rebolek 12:52> But copy here will not return value to tag_name Of course, that's not what parse does. Just do parse x [#"<" copy tag-name to #">"] directly 12:53Yes, you're getting string that looks like parse rule. Now you need to load that string to get actual parse rule. Why not generating the parse rule directly? 12:54Chceck the code I posted. It does the same thing and is much simpler. And if you need to create parse rule, you can always do it with compose or reduce (or any other method). bubnenkoff 13:05ok thanks 13:07> Why not generating the parse rule directly? Because I need generate very complex rule. And use it in another place rebolek 13:09One more reason to ignore strings and generate code directly. bubnenkoff 13:10> Of course. And you can do it in one pass: > > >> parse "<id>123</id>" [#"<" copy tag-name to #">" thru "</" tag-name #">"] > == true > But you generate code that execute immediately 13:29Why is true: >> parse "aabbccaagg" [some thru "aa"] == true it's not reach end 13:41or first rule is some thru and than it simply jump to end? hiiamboris 13:43it's a bug ;) bubnenkoff 13:43really? hiiamboris 13:43 >> parse "aabbccaagg" [some thru "aa"] == true >> parse "aabbccaagg" [some [thru "aa"]] == false bubnenkoff 13:43Yes, I tried so 13:44what difference? or it's really bug? and the should work same hiiamboris 13:46should work the same, but when too many rules are written in a flat manner like this it sometimes bugs (not the 1st time I see it) toomasv 13:47Compare execution: >> parse "aabbccaagg" [some thru [x: (print ["x:" x]) "aa" y: (print ["y:" y])] z: (print ["z:" z])] x: aabbccaagg y: bbccaagg x: bbccaagg x: bccaagg x: ccaagg x: caagg x: aagg y: gg x: gg x: g x: z: == true >> parse "aabbccaagg" [some [thru [x: (print ["x:" x]) "aa" y: (print ["y:" y])]] z: (print ["z:" z])] x: aabbccaagg y: bbccaagg x: bbccaagg x: bccaagg x: ccaagg x: caagg x: aagg y: gg x: gg x: g x: z: gg == false hiiamboris 13:53https://github.com/red/red/issues/3679 toomasv 14:05 >> parse "aabbccaagg" [some thru ["aa" y:] z: if (z = y)] == false >> parse "aabbccaagg" [some thru ["gg" y:] z: if (z = y)] == true Tuesday 25th February, 2020 bubnenkoff 10:05Where I can find\could you give more example of using if inside parse. At last how to use it for branching rebolek 10:08I'm not sure if there are many examples available but I can give you some 10:10take a look for example here https://github.com/9214/docs/blob/parse/en/parse.adoc#if toomasv 11:04@bubnenkoff Silly example of branching with if: >> parse "afirstbsecondcthird" [ some [s: if (find "ac" s/1) 6 skip | if (s/1 = #"b") 7 skip ]] == true It is basically same as: >> parse "afirstbsecondcthird" [ some [ ["a" | "c"] 5 skip | "b" 6 skip ]] == true bubnenkoff 11:52> I'm not sure if your version is more readable. You can replace collect keep with copy, you're getting one value. And making parse rule with rejoin is wrong. You're constructing code, not string. Oh! Now I am understand what you are meaning! 12:30What different between this two rules? thru will skip only first latter in first case? >> parse "<id>123</id>" [thru "<" "id" ">" copy tag_name to "</" "id" ">" thru "</" "id" ">" ] == false >> >> >> parse "<id>123</id>" [thru "<id>" copy tag_name to "</id>" thru "</id>" ] == true rebolek 12:51copy tag_name to " 12:53you are copying tag-name to "</" which means that the cursor is at "</....". Then you are checking for "id", but that fails, because " "id" 12:53to make it work, you need to skip "</" somehow bubnenkoff 13:31to " will set it before "</". So why you saying that I need skip "</"? I think I need to " (but it do not work)) rebolek 13:32 to " should work. skip takes integer argument **before** itself, so something like 2 skip. bubnenkoff 13:33 > parse "<id>123</id>" [thru "<" "id" ">" copy tag_name to "</" "</" "id" ">" thru "</" "id" ">" ] == false 13:34> to " should work. skip takes integer argument **before** itself, so something like 2 skip. ok! rebolek 13:34 thru "" part, which is superfluous. Try this: >> parse "<id>123</id>" [thru "<" "id" ">" copy tag-name to "</" "</" "id" ">"] == true> bubnenkoff 13:59Am I right that **every** operations like copy or creating words *always* make word global? Example: parse "123" [ thru ">" copy x to "<" to end] ; x is not global rebolek 14:02"global" makes no sense in Redbol, but if you're asking if the words exists outside of parse operation, then yes. Oldes 15:12@bubnenkoff no. >> f: func[/local x][parse "123" [copy x to end] probe x] == func [/local x][parse "123" [copy x to end] probe x] >> f "123" == "123" >> x *** Script Error: x has no value *** Where: catch *** Stack: >> c: context [x: none parse "123" [copy x to end] probe x] "123" == make object! [ x: "123" ] >> x *** Script Error: x has no value *** Where: catch *** Stack: 15:17Also... one should be careful with words inside parse rules, because these are invisible for function construct, which normally collects set-words and makes them _local_. 15:18 >> f: function[][y: 1 parse "123" [copy x to end] probe x] f "123" == "123" >> y *** Script Error: y has no value *** Where: catch *** Stack: >> x == "123" endo64 15:56context [a: b: none parse [... copy a ... set b ...] ] is useful in that case. rebolek 16:01Right, context [a: b: none rules: [... copy a ... set b ... ] parser: func [data] [parse data rules]] is preffered to parser: func [data /local a b rules][rules: [... copy a ... set b ... ] parse data rules] Something like closure should simplify this. Saturday 7th March, 2020 cloutiy 20:45Referring to "Introducing Parse", would there be any examples of if as well as while in use? 9214 20:48@cloutiy have you seen examples in the [documentation](https://doc.red-lang.org/en/parse.html)? cloutiy 20:50@9214 I had not. For a while that documentation page was a bit thin and had looked to other learning resources. But looks like it's beefed up since last time I referred to it. Will have a look! 9214 20:53@cloutiy you're confusing it with some other page; official Parse docs were in a beefed-up state from the get-go https://github.com/red/docs/pull/204. cloutiy 20:57@9214 No same docs. Previous versions. Up until at least v.0.6.2 documentation there was nothing related to parse. 20:58https://doc.red-lang.org/v/v0.6.2/en/ 9214 20:59I thought "that documentation page" refers specifically to Parse page that I linked to. Nevermind. Tuesday 10th March, 2020 toomasv 13:42Is this by design? >> about Red 0.6.4 for Windows built 7-Mar-2020/6:07:29+02:00 commit #87d8f52 >> non: none parse [a]['a non] == false >> non: [none] parse [a]['a non] == true In REBOL: >> about REBOL/Core 2.7.8.3.1 1-Jan-2011 >> non: none parse [a]['a non] == true >> non: [none] parse [a]['a non] == true 9214 13:46@toomasv meditate on none example in the docs, it's all there. 13:50none the Parse keyword and none the none! value are two different things. hiiamboris 13:53I think the difference is: R2: >> x: 'skip == skip >> parse [a b] [x x] == true Red: >> x: 'skip == skip >> parse [a b] [x x] *** Script Error: PARSE - invalid rule or usage of rule: skip *** Where: parse *** Stack: 9214 13:53 text >> n: none == none >> parse [a #[none]]['a n] == true >> parse [a #[none]]['a #[none]] == true >> parse [a #[none]]['a none #[none]] == true >> parse [a #[none]]['a [none] #[none]] == true hiiamboris 13:59@9214 I don't suppose your doc states anywhere that sub-rule in Red has to be a block? ☻ Also, is the behavior for non-block values defined at all? 9214 14:04@hiiamboris and why should they state that if it's not true? hiiamboris 14:05Hm. What non-block subrules are supported? And is there consistency in this matter I don't see? ☺ 9214 14:06I think you misunderstand what "sub-*" means. 14:09Anyway, Parse cannot currently distinguish cases like skip above and signals incorrect error, but some rules can be used that way. >> foo: quote (print "bar") == (print "bar") >> parse [a b c][3 word! foo] bar == true hiiamboris 14:14I see. I trust you will report it if you didn't yet ;) 9214 14:16That particular case is literally covered in the docs... hiiamboris 14:18I mean report > cannot currently distinguish cases like skip above and signals incorrect error 14:19Also, should non: none be treated as a none value or none keyword? 14:19Tricky ;) 14:20Maybe we shouldn't support non-block subrules (except maybe parens mentioned above), to avoid ambiguity. 9214 14:22What can be on the right-hand side of : is covered by "Values on the following datatypes" [here](https://doc.red-lang.org/en/parse.html#_parse_rules). Which means that you can stuff like ↑ paren! above and more: >> mark: quote mark: == mark: >> parse [a b c][2 word! mark to end] == true >> mark == [c] hiiamboris 14:26 >> x: 2 y: 'x z: 'char! t: char! == char! >> parse [x x] [x y] *** Script Error: PARSE - invalid rule or usage of rule: x *** Where: parse *** Stack: >> parse [x x] [x z] == false >> parse [x x] [x t] == false >> parse [x x] [2 t] == false >> parse [x x] [2 z] == false Should any of these work? 9214 14:30@hiiamboris are you sure about char!? 14:36[↑](https://gitter.im/red/parse?at=5e67a2a402dbe022a17afb20) to rephrase: everything covered [here](https://doc.red-lang.org/en/parse.html#_parse_rules) except for keywords. hiiamboris 15:13> @hiiamboris are you sure about char!? I was just exploring ;) 15:14You're right I meant word! though ;) 15:14 >> x: 2 y: 'x z: 'word! t: word! >> parse [x x] [2 t] == true >> parse [x x] [x t] == true These work 15:15Which is strange because I expected [x z] and [2 z] to work. 15:17Okay I get it, it's the same mechanism with [2 word!] - it evaluates word! into #[word!] 9214 15:17Again, word! the word and word! the datatype are two different things. hiiamboris 15:19> [↑](https://gitter.im/red/parse?at=5e67a2a402dbe022a17afb20) to rephrase: everything covered [here](https://doc.red-lang.org/en/parse.html#_parse_rules) except for keywords. ...and words, as [x y] example shows. And maybe something else as well 15:21But then what's the difference between these 2? >> x: 2 y: 'x z: 'word! t: word! >> parse [x x] [x y] *** Script Error: PARSE - invalid rule or usage of rule: x *** Where: parse *** Stack: >> parse [x x] [x z] == false As both z and y are evaluating to words 15:21What a mess Thursday 23th April, 2020 bubnenkoff 13:38Who can explain advantage of using parse vs xpath? I understand that parse is more powerful, but how to summarize it's advantages? Like 1... 2... 3... ? 9214 13:50You are comparing PEG parser to a query language, which doesn't make sense. Let's just say that XPath is a kind of thing that can be *built* with Parse. bubnenkoff 19:08@9214 what is the cases where xpath is more suitable than PEG? 9214 19:13XML queries, obviously. That's what XPath was created for. bubnenkoff 19:19Am I wrong or it seems to more easier to use parse than xpath? Or it's depend of task? 9214 19:24 text >> xml: [a [b node]] == [a [b node]] >> xml/a/b == node >> first parse xml [collect ['a into ['b keep skip]]] == node Which one is easier? bubnenkoff 20:10thanks! Friday 24th April, 2020 PierreChTux_twitter 16:09Do you know this resource? It's quite fun and to-the-point. http://www.codeconscious.com/rebol/parse-tutorial.html I must confess that it had taken me a great while before I could really get a grasp at the power that lies within parse and the miracles that it can achieve. greggirwin 16:27Yes, Brett Handley has done a lot of great Redbol work through the years. Carl has said that parse the The Crown Jewel of Rebol, but I don't think you can understand its true power without block parsing and all the datatypes. pekr 17:25@greggirwin I wonder if anyone apart from me thinks, that having something like parse.exe, basically encapped Red with CLI and parse, could be a popular tool? :-) PierreChTux_twitter 17:30@pekr and @greggirwin I T O T A L L Y A G R E E ! The idea to have an autonomous parse has been around for years. It would be a real killer-application for sysops! [off-topic] I just disagree with the .exe extension: this stinks like the remnant of an old thing that used to claim that it was an operating system... It was even sold for money, some say. [/off-topic] greggirwin 17:32@pekr, we've talked about how DiaGrammar could be used almost like that. You build your grammar in the tool, then have a "make exe" command that builds the processor for it. Step one, without actions of any kind, would allow it to vet input as parseable or not. pekr 17:37Hmm, sounds interesting. Difficult to judge, not having direct Diagrammar experience yet. But that way, you could create tailored parsers/grammars encapsulated for the CLI usage, right? greggirwin 17:44Correct. Saturday 25th April, 2020 cloutiy 15:52I have a question about creating blocks. during parsing. I've used collect, and also make block!. An approach I'm experimenting with is (while scanning a string, and extracting things into a collect) is to put a [ when I want to start a new block, and ] when I want to end the block. But so far none of the ways I've tried have been successful. I tried to keep (#"["), keep ('[). So then am I right to conclude the only way to create a block is with collect or make block!? I guess another alternative I could do is to insert [ and ] directly into the string I'm parsing then load the entire thing after it's done parsing. 16:08or maybe this would work...yes I think so...load form [ my-word #"[" 1 2 3 #"]" ]. This is how I could do it if I keep (#"[") and keep (#"]") while collecting. Think I answered my own question. rebolek 19:31@cloutiy that's not how to do it. If you want to start a new block, just do it, you can have more levels of collect in parse: >> parse [1 2 3][collect [keep integer! collect [some keep integer!]]] == [1 [2 3]] bubnenkoff 19:50I have got block of rules like: some [ (lot: copy []) thru "<lot>" thru "<lotNumber>" copy _lotNumber to "</lotNumber>" (lotNumber: _lotNumber ) thru "<maxPrice>" copy _price to "</maxPrice>" (price: _price ) (print _lotNumber) thru "<OKPD2>" thru "<code>" copy _code to "</code>" (code: _code) thru "<name>" copy _name to "</name>" (name: _name) thru "</OKPD2>" thru "</lot>" (append lot object [lot_number: lotNumber maxPrice: price _code: code _name: name ]) (append _lots lot) ] if at last one thru will success some become true. Is there any way to make some to true if every condition inside block is true? cloutiy 20:30@rebolek Ok great, thanks for the example rebolek! Sunday 26th April, 2020 cloutiy 00:31@bubnenkoff I'm not an expert, but I think everything between your some [ ... ] will ONLY execute if everything matches.... greggirwin 00:42@bubnenkoff you don't have any | rules here, so if I understand the question, that should be the case, but remember that thru is greedy, so your last thru "" might skip a whole bunch of data. Also if you get at least one match for all those rules, that indicates success for the opening some rule. bubnenkoff 06:19@greggirwin I need to be sure that every thru is success (every thru tag is exists: "" "" "" etc ). If I right understand you suggest to add or expresstion(|) to get it look like: thru "<lot>" | thru "<lotNumber>" copy _lotNumber to "</lotNumber>" (lotNumber: _lotNumber ) | thru "<maxPrice>" copy _price to "</maxPrice>" (price: _price ) | But it will simple work like: "if this fail try next after |" 06:35it's seems that it should be operator every any- zero or one some one or more everyall is true toomasv 06:59@bubnenkoff You can use ahead to check if the text ahead has required structure. Like this: ws: charset " ^/^-" ws*: [any ws] guard: [ ws* ahead [ "<lot>" ws* "<lotNumber>" any [not "</lotNumber>" skip] "</lotNumber>" ws* "<maxPrice>" any [not "</maxPrice>" skip] "</maxPrice>" ws* "<OKPD2>" ws* "<code>" any [not "</code>" skip] "</code>" ws* "<name>" any [not "</name>" skip] "</name>" ws* "</OKPD2>" ws* "</lot>" ] ] Then, given the following: lots: clear [] lot: clear [] _lotNumber: _price: _code: _name: none rule: [ some [ (clear lot) thru "<lot>" thru "<lotNumber>" copy _lotNumber to "</lotNumber>" thru "<maxPrice>" copy _price to "</maxPrice>" thru "<OKPD2>" thru "<code>" copy _code to "</code>" thru "<name>" copy _name to "</name>" thru "</OKPD2>" thru "</lot>" (append lot object [lot_number: _lotNumber maxPrice: _price code: _code name: _name ]) (append lots lot) ] ] text: { <lot> <lotNumber>1</lotNumber> <maxPrice>10</maxPrice> <OKPD2> <code>c</code> <name>ABC</name> </OKPD2> </lot> <lot> <lotNumber>2</lotNumber> <maxPrice>20</maxPrice> <OKPD2> <code>d</code> <name>XYZ</name> </OKPD2> </lot> } you can do this: parse text [(clear lots) some [guard rule]] probe lots [make object! [ lot_number: "1" maxPrice: "10" code: "c" name: "ABC" ] make object! [ lot_number: "2" maxPrice: "20" code: "d" name: "XYZ" ]] 07:22Wait! It does not work that way :flushed: 07:29Corrected: rule: [ (clear lot) thru "<lot>" thru "<lotNumber>" copy _lotNumber to "</lotNumber>" thru "<maxPrice>" copy _price to "</maxPrice>" thru "<OKPD2>" thru "<code>" copy _code to "</code>" thru "<name>" copy _name to "</name>" thru "</OKPD2>" thru "</lot>" (append lots object [lot_number: _lotNumber maxPrice: _price code: _code name: _name ]) ] parse text [(clear lots) some [guard rule | skip]] 07:53@bubnenkoff You can even add some error-reporting: Add s: to guard: guard: [ ws* ahead [ s: "<lot>" ws* s: "<lotNumber>" any [not "</lotNumber>" skip] "</lotNumber>" ws* s: "<maxPrice>" any [not "</maxPrice>" skip] "</maxPrice>" ws* s: "<OKPD2>" ws* s: "<code>" any [not "</code>" skip] "</code>" ws* s: "<name>" any [not "</name>" skip] "</name>" ws* s: "</OKPD2>" ws* s: "</lot>" ] ] And then: skipping: no error: [opt [if (not any [skipping empty? s]) (print ["Problem at: " probe copy/part s 30 "..."] skipping: yes)]] parse text [(clear lots) some [guard rule (skipping: no) | error skip]] pekr 09:38Remember that you can use thru with a block of options. That way it might return the closest match, but not sure right now, would have to try ... Oldes 09:55@bubnenkoff I thought that I have already provided full parser for your data and now I see that you still try to use thru although we tried to explain you, that it is bad way to go! bubnenkoff 10:42 @Oldes The problem is more complex than I show. Big thanks for your code, but I have very complex doc structure and many types of docs. I should understand how to write code myself because otherwise I will ask you to write code for me again and again. For example the next problem with docs will be that some one subset of rules is just subset of another rule. For example I make rule that look and in but in future I may find case when I also will need extract "<currency>". But for any other part of doc will have another structure. For example "lotNumber" may be named lotPosition or it may be absent. Same with any other field. It's better to say that I am trying to write parser for "float doc structure". So I need to prevent regressions for every case. I can add some code to rule only if I totally sure that this case is possible and I can test that all working. So I found only one way - to write rules for every founded case and if two ore more rule are valid to take result that have more collected data that another %) Oldes 10:47I understand that... and that is the main reason, why I recommend not even to try to and thru. And if your data are so variadic, I would probably used some general solution. 10:48Also all these code examples above does not deal with tags order, which is also quite important. pekr 11:41Oldes - what particularly do you find dangerouns on the to/thru usage? In a block mode, those seem to return the first option always, so no worry it will leak deeper into your document. Block options mode was the addition to the R3 parser and Red adopted it too. I know it is inefficient, as it does the scan for all your options and returns to lowest index in a series, but it is MUCH MORE EASIER for beginners, who are not able to write proper grammars imo. >> text: "Here is some text to parse." == "Here is some text to parse." >> parse text [any [thru ["parse" m: (print [3 m]) | "is" m: (print [1 m]) | "text" m: (print [2 m])]]] 1 some text to parse. 2 to parse. 3 . 11:43As you can see, it returned result in a correct order. It is imo a great helper .... Oldes 11:51I'm using to/thru too, but not with complex data structures. And if I understand it well, Dmitry's data may be huge. Something like code above may be nice for playing with console, but not for real use. It would be highly inefficient and don't think it is clear enough. 12:02@pekr to/thru is particularly dangerous when used for parsing nested data. 12:56Btw... I'm just playing with PDF files... here is my current [PDF parser](https://gist.github.com/Oldes/f83fd851cf74b5825ed27cc234ba15d5) It's not yet fully functional... fails with some creepy files, but is able to load PDF's made from old Rebol PDF maker (at least). hiiamboris 13:18Why do you use underscore instead of hyphen in names? Oldes 13:24Don't know... habit.. I use it only for rl_* (rules) and ch_* (charsets) cloutiy 14:35@bubnenkoff I'm don't know all the details of your project and your specific requirements, but maybe a different approach could be to convert your XML (as a string) into a red block form. You could have a function named the same as each tag which performs something with the data passed to is as the arg. So transforming your XML into the form: lot [ lotNumber [1] maxPrice [10] OKPD2 [ code [c] name [ABC] ] ] lot [ lotNumber [2] maxPrice [20] OKPD2 [ code [d] name [XYZ] ] ] 14:36I was able to transform your XML sample into the form above with: parse-lots: function [ text ] [ letter: charset [ #"a" - #"z" #"A" - #"Z" ] letters: [ some letter ] number: charset [ #"0" - #"9" ] numbers: [ some number ] end-tag: [ "</" some [letters | numbers] ">" ] start-tag: [ "<" copy tag-name [some [letters | numbers]] ">" ] parse text [ any [ change end-tag "]" | change start-tag (rejoin [tag-name " ["]) | skip ] ] print text comment { 1. Substitute print for load if you want to return a block of data. 2. If you return a block of data, you could make functions for each tag. 3. Each function doing something with the data passed to it. ex: lot: function [ data ] [ some code that will create an object from the data arg] lotNumber: function [ data ] [ ] OKPD2: function [ data ] [ reduce data ] code: function [ data ] [ data ] name: function [ data ] [ data ] } ] 14:41So basically, turning your XML file into a red program then executing that program. Oldes 14:46@cloutiy although your solution is nice, I should note, that using heavy in-place modifications (using change) will not result to the fastest solution if the source data are huge. But yes... I was already recommending that he should first build intermediate structure. cloutiy 15:01@Oldes Yes I understand. As a beginner myself I sympathize. When trying to learn something like parse I had to change my mode of thinking and try not to focus too much on what is fastest or not, but rather try to use the "minimum viable product" approach - get it to work, then improve on it as time permits. Here is some modified code that will modify the string in place which can then be loaded as a red block, which when run with do would create said objects: parse-lots: function [ text ] [ letter: charset [ #"a" - #"z" #"A" - #"Z" ] letters: [ some letter ] number: charset [ #"0" - #"9" ] numbers: [ some number ] end-tag: [ "</" some [letters | numbers] ">" ] start-tag: [ "<" copy tag-name [some [letters | numbers]] ">" ] parse text [ any [ remove {<OKPD2>} | remove {</OKPD2>} | change "<lot>" "make object! [" | change "</lot>" "]" | change end-tag "}" | change start-tag (rejoin [tag-name ": {"]) | skip ] ] load text ] giving make object! [ lotNumber: {1} maxPrice: {10} code: {c} name: {ABC} ] make object! [ lotNumber: {2} maxPrice: {20} code: {d} name: {XYZ} ] Oldes 15:04@cloutiy I like your approach :-) Although it is not the safest one also. Monday 27th April, 2020 cloutiy 14:25@Oldes It should be safe, if you wear a mask. Oldes 14:29@cloutiy mask does not save you from car accident. >> parse-lots "<lot><name>a</name></lot>" == [make object! [name: "a"]] >> parse-lots "<lot><name>{</name></lot>" *** Syntax Error: (line 1) invalid string at ] *** Where: transcode *** Stack: parse-lots load cloutiy 20:21@Oldes Making an assumption that the data was entered via a form that had field-level data validation ;) Thursday 7th May, 2020 cloutiy 20:03I have a question when parsing strings. In *rebol*, the default behavior for parse is to skip spaces I believe. Then if you want to not automatically skip over spaces you would use parse/all. Is there some equivalent in red parse? Otherwise I have to stick a lot of extra any space, opt space etc... everywhere, turning elegant and clean rules into something with a lot of visual noise. hiiamboris 20:24Use a shortcut: _: [any space] greggirwin 20:25Red doesn't have an option to work like R2. We generally...Boris beat me...use shortcut rules. cloutiy 20:26@hiiamboris @greggirwin Perfect, thanks for the tip. Will try that instead. greggirwin 20:28I often use + and * suffixes for some/any versions. 20:29e.g. _+ and _*. Though I also use ws as the base (old habits). _ is nice and clean. Wednesday 13th May, 2020 cloutiy 13:05I know there's a DiaGrammar tool that is being worked on. I would have liked to be a tester but I'm on linux. Saw some screenshots however and it looks great. I know one of the features is that given a grammar, the tool can generate valid sentences. I was wondering if it was possible to do the opposite - you provide the tool with the rules for terminals. Then you give it some examples of valid sentences and the tool identifies patterns for you, creating rules. So the opposite. Rather than generating sentences, it generates rules, given the pattern of terminals. toomasv 14:18@cloutiy Have to think about it. From the top of my head I think it may be possible to add this feature if you also provide (possibly a hierarchy of) categories for terminals. Then the tool may be able to "learn" the sequencies of different categories. Without provided categories the possibility is either to make each provided example a rule or to try to build up categeories for terminals by tool itself and base rules on these internally generated categories. But these would be hard to debug as catergories would have internally generated names. Then you can adjust its behavior only by providing more examples to persuade it to alter its rules. Or something like that. :) cloutiy 22:47@toomasv Well if using the second approach (internally generated categories) the user could have the ability to rename them to something more appropriate? I haven't put much thought into how it could be implemented or the different approaches that could be taken. But I think you got the jist of what I was trying to communicate. 1) Provide the rules of the terminals. 2) Feed it a couple of shorter sentences 2) It generates a rule for it (which you can categorize by giving it a meaningful name). 3) Repeat with larger more complex sentence structures Friday 15th May, 2020 bubnenkoff 13:52[![изображение.png](https://files.gitter.im/red/parse/Orik/thumb/izobrazhenie.png)](https://files.gitter.im/red/parse/Orik/izobrazhenie.png) 13:52I am see very strange picture. I run parsing heap of files. I expect that only one CPU core will be used, but I am getting 4 core loaded. How it can be? Red is single threaded GiuseppeChillemi 15:08While Red uses a Single Thread, your OS may be distributing the files reading over multiple sub-processes on multiple cores. The update of the cores load graph could be too low to let you see that that at each new file read a core switch is happening. greggirwin 16:41@bubnenkoff you should be able to see how much CPU each process is using individually. What OS are you on? bubnenkoff 19:42[![изображение.png](https://files.gitter.im/red/parse/fiUB/thumb/izobrazhenie.png)](https://files.gitter.im/red/parse/fiUB/izobrazhenie.png) 19:42I am using Windows 10 19:44>The update of the cores load graph could be too low to let you see that that at each new file read a core switch is happening. seemingly the most likely scenario greggirwin 19:46The process list in task manager shows how much CPU each task it using. Look for your Red task in there. hiiamboris 19:49I have observed also, that 100% CPU load is split 70/30 or 60/40 between 2 cores (on my PC). I guess it's some hardware thing, to keep the heat distributed for less fan load, and I guess to save energy as well. 19:50You screenshot shows 4x50% load though, which equals 2 fully loaded cores. Which is really strange ;) Sunday 17th May, 2020 bubnenkoff 12:08I looked at process section, and yes, it's show ~25% CPU usage, so graph is have too low update rate 12:08 >> parse "aabbcc" [copy x to "bb" (print x) if (1 = 2) [reject] "bbcc" ] aa == false Why false? endo64 12:27It stops because of if (1 = 2) >> parse "aabbcc" [copy x to "bb" if (1 = 1) "bbcc" ] == true >> parse "aabbcc" [copy x to "bb" if (1 = 2) "bbcc" ] == false bubnenkoff 12:32I need to do smething like this: 12:36 thru "<value>" copy _value to "</value>" if (_value = "false") [reject] ; stop parsing return false endo64 12:47What about reversing the condition? >> parse "<value>false</value>" [thru "<value>" copy _ to "</value>" if (_ <> "false") to end] == false >> parse "<value>test</value>" [thru "<value>" copy _ to "</value>" if (_ <> "false") to end] == true 12:47There will be other rules instead of to end of course. I just wanted to show that it stops there as you asked. bubnenkoff 13:24So I should not use square brackets in reject? endo64 14:15reject is irrelevant with if: >> parse [] [] == true >> parse [] [reject] == false It immediately fails the enclosing block. bubnenkoff 19:09@endo64 could you give an example where reject is useful? endo64 22:15 >> parse [There should be no integer here] [any [integer! reject | any-type!]] == true >> parse [There should be 0 integer here] [any [integer! reject | any-type!]] == false Monday 18th May, 2020 greggirwin 00:18Nice example. :+1: toomasv 04:28@endo64 Nice indeed! But reject can be tricky (#3478). Playing with it I noticed that a construct I expected to behave identically, does not: >> status: false parse [There should be 0 integer here] [any [set s skip opt [if (integer? s) reject]]] == true >> status: false parse [There should be 0 integer here] [any [set s skip [if (integer? s) reject |]]] == false 06:44Omps. status: false superfluous. Remained from eariler experiments. hiiamboris 07:52I also prefer not to use it, too esoteric. [any [integer! reject | any-type!]] => [any [not integer! skip]] is enough 07:54Also this: >> parse [There should be integer here 0] [any [integer! reject | any-type!] p:] == true >> ? p P is a block! value. length: 0 index: 7 [] pekr 08:34Why is a printstatement causing a stack overflow there? >> rule: [quote 1] == [quote 1] >> parse [1] [some rule] == true >> rule: [quote 1 (print rule)] == [quote 1 (print rule)] >> parse [1] [some rule] *** Internal Error: stack overflow *** Where: print *** Stack: 08:35I use master branch two days old ... hiiamboris 08:38print reduces (print rule) and calls itself rebolek 08:39@pekr: pekr 08:39ah rebolek 08:39 >> rule: [print rule] == [print rule] >> do rule *** Internal Error: stack overflow *** Where: print *** Stack: Wednesday 20th May, 2020 bubnenkoff 16:21@Oldes it's seems that I need your help. I have complex case and I can't solve it. The simplified version is: whitespace: charset reduce [space tab cr lf] ws: [any whitespace] d: { <apps> <app> <id>1</id> <good>true</good> </app> <app> <id>2</id> <good>true</good> </app> <app> <id>3</id> <good>true</good> </app> <app> <id>4</id> <foo>foo can be optional</foo> <rejected>true</rejected> </app> </apps> } I need to get: [ {id: 1, good: true}, {id: 2, good: true}, {id: 3, good: true}, {id: 4, good: false} ] I have not idea how to check check last case endo64 16:27@bubnenkoff You don't need to parse it as a string, you can simply load it, then it will be much easier to parse. bubnenkoff 16:53Yes, I made it for for clarity greggirwin 16:53Unless the more complete case is non-loadable. 16:54Though I can't tell what the exact problem or goal is. Thursday 21st May, 2020 bubnenkoff 05:38The problem that I have not idea how to branching. I have two different cases in app This is not working code, but I do not know how to do it another way: some [ [ thru "<app>" thru "<id>" copy _id to "</id>" thru "<good>" copy _good to "</good>" ] | [ thru "<app>" thru "<id>" copy _id to "</id>" thru "<rejected>" copy _rejected "</rejected>" ] thru "</app>" ] endo64 06:27No need for thru if you don't have different data. Something like this should work: parse b [collect [ <apps> some [ <app> some [ <id> keep integer! </id> | <good> keep word! </good> | <rejected> keep word! </rejected> | skip ] </app> ] </apps>] ] ; == [1 true 2 true 3 true 4 true] greggirwin 19:03@bubnenkoff it may help to think in terms of alternatives, rather than branching. And about commonalities. If your records all share common features [app id], those can be a single, shared rule. 19:04If [good rejected] are mutually exclusive, you can have an | rule just for those. Wednesday 27th May, 2020 cloutiy 12:56When doing a recursive descent parser, a programmer can provide some useful error messages when there are semantic errors. ex: "Expecting x, y or z at line:col". What would be the idiomatic way of doing something similar within parse? I tried a couple different approaches but not elegant and not specific enough. Here is one example: program: does [ CST: parse source-code [ collect [ any [ A | B | C | D | failure: (print [ "Parser error. Some problem here >>" failure ] quit) ] ] ] But this approach is a bit naive. It does provide info of the last successfully matched pattern. But if the failure was in the rule for B,because of a missing keyword, or invalid semantics,then I'd like to be able hone in and point that out. Simple examples if doing a RDP is expect "if" or expect "end" where unless it meets the expectation, an error is produced to point that out. What is the idiomatic approach to this when using parse? rebolek 13:39There's no right way to do this.It would be nice to have such helper functions, but right now you need to write them yourself. Let's say that your A, B, C, D would be in this form: [(error: "your input must look like xxx" error?: true) the-actual-rule (error?: false)] so then your failure rule can look like: [failure: (if error? [print ["Error:" error "at" failure]])] You can turn it into generator that will take block of alternate rules and error messages that will generate rule block for you. hiiamboris 13:57error: [p: (do make error! rejoin ["Parser error. Some problem here >> " mold/part p 100])] Then smth like parse ... [... A [B | error] opt [C [D | error]]...] 14:02Or parse ... [... A [B | (expected "B")] opt [C [D | (expected "D")]]...] where expected is your own "complaining" function cloutiy 15:39@rebolek @hiiamboris Thank you both for your suggestions. I'll experiment with these ideas to see how it goes. Monday 22nd June, 2020 TheHowdy_gitlab 19:47This question has probably been answered for half-a-hundred of times but I couldn't find anything on the web so... Can someone give me an example of how I can parse matching brackets? e.g. something like (foo (bar (baz))) is valid whereas (bar() is invalid? hiiamboris 19:52 >> parse "(bar())" rule: ["(" while [end (error) | ")" break | rule | skip]] == true >> parse "(bar()" rule *** Script Error: error has no value *** Where: parse *** Stack: TheHowdy_gitlab 19:54Whoa thx. Will spend some time trying to understand this :+1: greggirwin 20:08Note that you won't get an error for too many closing brackets in that case. >> parse "(bar()))" rule: ["(" while [end (error) | ")" break | rule | skip]] == false 20:12That may work for you, or you may need to count. e.g. (excerpted example) nested-curly-braces: [ (cnt: 1) any [ c-comment | #"{" (cnt: cnt + 1) | __end: #"}" if (zero? cnt: cnt - 1) break | not end skip ] ] rule-action: [ #"{" __start: nested-curly-braces ( if not zero? cnt [ missing: form pick "}{" positive? cnt cause-error 'syntax 'missing [missing __start] ] ) ] hiiamboris 20:21You get false though. dander 20:27I like this style. I guess the recursive rules could suffer from stack issues if there are lots of nested parens, but I feel like this is pretty easy to read. You need to be pretty specific about contents though. paren: [#"(" paren-items #")"] paren-items: [any [ws | some word-chars | paren]] ws: [space | tab | new-line | crlf] word-chars: charset [#"a" - #"z"] greggirwin 20:29This is all absolutely worth a wiki page to be turned into more docs, as it's a common pattern. Saturday 11st July, 2020 toomasv 11:04I usually use somehing like this: parse "(bar())" parens: [#"(" any [parens | not #")" skip] #")"] 11:08And if you have to deal with escape-sequences: parens: [#"(" any [parens | [escape | not #")"] skip] #")"] () escape: #"\" parse "(bar(\)))" parens ;== true parse "(bar(\))))" parens ;== false escape: #"^^" parse %{(bar(^)))}% parens ;== true parse %{(bar(^))}% parens ;== false parse %{(bar(^))))}% parens ;== false 11:50And inside longer string, with error message: err: func [msg][cause-error 'user 'message rejoin msg] rule: [any [ s: [escape | not [#"(" | #")"]] skip | ahead #")" (err ["Unmatched closing paren at " mold s "!"]) | parens ]] parens: [ #"(" any [parens | [escape | not #")"] skip] [#")" | end (err ["Unclosed paren at " mold s "!"])] ] >> parse %{foo (bar()) baz}% rule == true >> parse %{foo (bar()) (baz}% rule *** User Error: Unclosed paren at "(baz"! *** Where: do *** Stack: err cause-error >> parse %{foo (bar())) baz}% rule *** User Error: Unmatched closing paren at ") baz"! *** Where: do *** Stack: err cause-error >> parse %{foo (bar())^) baz}% rule == true Monday 13th July, 2020 toomasv 18:26Sometimes you can also use the new transcode to check your strings for balanced parens: >> transcode/trace %{a(b(c)d)e}% func [e i t l o][[open close] print [e mold i]] open "(b(c)d)e" open "(c)d)e" close ")d)e" close ")e" == [a (b (c) d) e] >> transcode/trace %{a(b((c)d)e}% func [e i t l o][[open close] print [e mold i]] open "(b((c)d)e" open "((c)d)e" open "(c)d)e" close ")d)e" close ")e" *** Syntax Error: (line 1) missing ) at (b((c)d)e *** Where: transcode *** Stack: >> transcode/trace %{a(b(c)d))e}% func [e i t l o][[open close] print [e mold i]] open "(b(c)d))e" open "(c)d))e" close ")d))e" close "))e" close ")e" *** Syntax Error: (line 1) missing ( at )e *** Where: transcode *** Stack: greggirwin 19:08@toomasv :+1: 19:09Aside from the overly verbose parameter names of course. ;^) toomasv 19:16:) It is easier to remember than [event input type line token]. Tuesday 14th July, 2020 greggirwin 18:29I put the above example in a new Transcode wiki page. toomasv 19:53Good! Thanks! Friday 24th July, 2020 bubnenkoff 09:01What is better way to extract values if I know tags but do not know their order? It could be: {112233} but also possible {113322} and any another combinations 9214 09:26Here's what I'd do: tag: [open ahead [to close] data] open: ["<" copy opening to ">" if (find tags opening) ">"] close: ["</" copy closing to ">" if (opening = closing) ">" mark:] data: [keep copy match to close :mark] tags: split "aa bb cc" space examples: [ {<aa>11</aa><bb>22</bb><cc>33</cc>} {<aa>11</aa><cc>33</cc><bb>22</bb>} {<aa>11</bb>} {<xx>22</xx>} ] foreach example examples [ probe parse example [collect some tag] ] bubnenkoff 11:51Thanks! what :mark is doing? 9214 11:53@bubnenkoff it restores position previously marked with mark:. See the [docs](https://github.com/red/docs/blob/master/en/parse.adoc#restoring) for details. bubnenkoff 18:29why [to close] is placed in brackets? 9214 18:33I was mindful of https://github.com/red/red/issues/3679 but I guess in this case it doesn't matter. Saturday 25th July, 2020 cloutiy 16:17@9214 And why ahead in this case? From what I understand, ahead checks to see if the rule that follows is true, and if so then goes on do do the next rule. If the rule after ahead is false, then it won't? If so, isn't this how rules rules move forward anyhow (only move forward if the rule matches) This is an area of parse where I would love more examples. Examples of when/how to use if, ahead, while, reject, then, fail. 9214 16:26open ahead to close data check that opening tag is followed by a matching closing tag; if that's true then data between these tags can be safely collected. By contrast, if you match an opening tag, then collect the data, and only then match a closing tag, as in open data close, it can turn out that there is no closing tag, or that it doesn't match the opening one (see the 3rd example), but at that point the data was already collected and you'll get the wrong result. 16:26@cloutiy there's a plethora of examples and explanations in Parse documentation, with a [gigantic taxonomy](https://github.com/red/docs/blob/master/en/parse.adoc#3-parse-rules) of all the rules that describe when (and if) they advance the input. 17:09@cloutiy to give you some concrete examples tied to use-cases. I use if for "semantic matching", i.e. when I matched some value and want to check if it satisfies certain properties. [Here](https://github.com/9214/7guis-red/blob/master/tasks/cells.red#L15) I match a word and [check](https://github.com/9214/7guis-red/blob/master/tasks/cells.red#L10) if it is set to an object which was derived from a specific [prototype](https://github.com/9214/7guis-red/blob/master/tasks/cells.red#L37). ahead is essentially "match but don't advance the input if it matches", literally "ahead of the current position". fail is bugged out currently, but [fail] is an always failing rule. Here's an excerpt from dialect-design-related essay that I'm in the process of writing, it's a redesign of math dialect: math: function [ "Evaluates expression using math precedence rules" datum [block! paren!] "Expression to evaluate" /local operator match ][ order: ['** [* / % //] [+ -]] redex: [skip infix [enter | skip]] infix: [set operator word! (do gauge) if (infix?)] gauge: [right?: attempt [lit-word? first do check]] check: [infix?: find to block! group operator] emend: [parse datum tally] tally: [any [enter [fail] | recur [fail] | count [fail] | skip]] enter: [ahead paren! into tally] recur: [ahead redex if (right?) 2 skip tally] count: [while ahead change only copy match redex (do match)] do also datum: copy/deep datum foreach group order emend ] You can see "semantic matching" here: in if (infix?) I match a word and check if it's one of the arithmetic operators, in if (right?) I check that matched infix operator is right-associative. ahead paren! preemptively checks that there's a paren! right under the current "cursor", and only then recurs into it with into. Same with ahead redex: it's a preemptive check that gives me an opportunity to analyze the input before I decide on how to process it, in particular, it sets infix? and right? flags on which I can dispatch inside if. [any [enter [fail] | recur [fail] | count [fail] | skip]] is the heart of the interpreter. Conceptually, it means "match the rule, and, _regardless of the result_, backtrack and match the next rule". [fail] is an always failing rule which forces Parse to retract its input "cursor" a few steps back (to the point where "failed" portion of the input started) and to go look for |, which delineates the next alternate rule. then was removed https://github.com/red/red/issues/3843 quite a while ago because it didn't make any earthly sense, but here I noticed that it can be re-introduced to cover this idiom: [any [enter then recur then count then skip]] while ahead change only copy match redex (do match) is a mind-bender. What it does can be described as: match the infix expression and substitute it for the result of its evaluation, but _do so without advancing the input_. If you ever saw car's wheel skidding in the mud, that's the Parse equivalent of it: the wheel rotates, but the car stands still, stuck in the mud. while is used here to indicate that the rule will continue to match regardless of the input advancing, but in fact some and any can be used as well, because the input "advances" when change modifies it. I'll go as far as to say that if you understand how this all works, then you understand the core principle behind Parse: controlling the input position, knowing exactly when and how you want it to either backtrack (go back) and advance (go forward), and then using that knowledge to your advantage. Sunday 26th July, 2020 endo64 10:32This great explanations may go to a wiki page. cloutiy 15:17@endo64 I second that motion. Really great explanation. @9214 Thanks for taking the time to share this example and running though the details. Monday 27th July, 2020 bubnenkoff 17:35Huston! I have a problem again :) I checked what I done few month ago, and found issue. It's copy-past ready: data: {<lots> <lot> <lotnum>1</lotnum> <objs> <obj> <name>Foo</name> </obj> <obj> <name>Bar</name> </obj> <obj> <name>Baz</name> </obj> </objs> </lot> <lot> <lotnum>2</lotnum> <objs> <obj> <name>Red</name> </obj> <obj> <name>Green</name> </obj> <obj> <name>Blue</name> </obj> </objs> </lot> </lots>} parse data [ ( _lots: copy [] ) some [ thru "<lots>" (_lot: copy []) some [ thru "<lot>" thru "<lotNum>" copy _lotNumber to "</lotNum>" (_objs: copy []) some [thru "<objs>" (_obj: copy []) some [ thru "<obj>" thru "<name>" copy _name to "</name>" thru "</obj>" ] thru "</objs>" ] (append _obj object [lot_number: copy _lotNumber name: _name ]) ] (append _objs copy _obj) (append _lot object [lot_number: to-integer copy _lotNumber objs: _objs ]) ] (append _lots _lot) ] probe to-json _lots I expected to get: [{lot: 1, objs: [ {name: "Foo"}, {name: "Bar"}, {name: "Baz"}] }, { lot: 2, objs: [ {name: "Red"}, {name: "Green"}, {name: "Blue"}]} ] But my code produce wrong result. Tuesday 28th July, 2020 toomasv 07:53Dangers of to and thru in such situations have been explained several times. Plus, err... , other things. Why not e.g.: lots: copy [] parse data [some [ <lotnum> copy _num to </lotnum> (_objs: copy []) | <name> copy _name to </name> (append _objs object [name: _name]) | </objs> (append lots object [lot: _num objs: _objs]) | skip ]] to-json lots == {[{"lot":"1","objs":[{"name":"Foo"},{"name":"Bar"},{"name":"Baz"}]},{"lot":"2","objs":[{"name":"Red"},{"name":"Green"},{"name"... rebolek 08:26to and thru should be unlocked only when you reach certain level in parse bubnenkoff 10:19Thanks! Would skip good for complex files like this? It have a lot of fields with similar fields and I need to collect only (for example) code tags but I need to collect only codes inside OKPD2 10:19[fcsNotificationZA44_0173200001419002048_22649697.xml](https://files.gitter.im/5b147b8fd73408ce4f9bc4b4/AVOz/fcsNotificationZA44_0173200001419002048_22649697.xml) toomasv 10:49You can use flags, e.g.: data: read %fcsNotificationZA44_0173200001419002048_22649697.xml collect?: no parse data [collect some [<OKPD2> (collect?: yes) | </OKPD2> (collect?: no) | <code> if (collect?) keep to </code> | skip]] ;== ["0101010.90.33.120" "11.111.1111111111111110" "27.90.33.120" "27.90.33.120" "27.90.33.120" "27.90.33.120" "27.90.33.120" "27.90.33.120" "27.90.... Wednesday 29th July, 2020 rebolek 06:45I believe this is a bug: >> parse " " [0 0 space] == true toomasv 07:15Seems so, yes. rebolek 07:16I can't find it in issues, so I'll report it. toomasv 07:16:+1: rebolek 07:22https://github.com/red/red/issues/4591 GalenIvanov 07:45@toomasv A nice example of use of flags in parse! :+1: toomasv 07:46@GalenIvanov Thanks! :smile: Monday 10th August, 2020 cloutiy 19:02seems I'm still struggling to understand ahead and friends. My understanding based on the docs is that 1) ahead does not advance. It's more like a lookahead. 2) If it is a match, perform the next rule. Is this correct? I'm playing with a simple example to help me understand it: letters: charset {abcdefghijklmnopqrstuvwxyz} parse "{ a b { d d d } c }" list: [ ahead not "{" [(print "Expecting {." quit)] "{" collect [ any [ space | keep letters | list ] ] ] ahead not "}" [(print "Expecting }." quit)] "}" ] In this example, if I comment out the lines with ahead, things work as expected. However with ahead it is not. Although now as I was writing this, I'm thinking this might be because it doesn't go any further than the first rule, since the first char *is* {, and so ahead not "{" is false, and so doesn't keep going. 9214 19:20@cloutiy >> parse "a" [ahead not "a" | (probe 'failed!)] failed! == false >> parse "a" [not "a" | (probe 'failed!)] failed! == false greggirwin 19:22@cloutiy where you say "perform the next rule", think of it more like "keep going". Ahead only knows the single rule it's given, and whether it succeeds or fails. 9214 19:27@cloutiy think of ahead as a yo-yo. You throw it _forward_ while _standing_ and when pull _back_. Sometimes you fail to pull back (the rules given to ahead fails and then ahead itself fails) and switch to alternate mode (jump over |) where you e.g. wind the thread by hand. toomasv 19:28@cloutiy ahead **is** positive lookahead and not is negative lookahead. 9214 19:31The simplest example is checking the type of the series before going into it: >> rule: [some [ahead block! into rule | keep string!]] == [some [ahead block! into rule | keep string!]] >> parse ["we" ["need" ["to" ["go" ["deeper"]]]]] [collect rule] == ["we" "need" "to" "go" "deeper"] Without ahead block! you'd go both into string! and block!. >> rule: [some [into rule | keep string!]] == [some [into rule | keep string!]] >> parse ["we" ["need" ["to" ["go" ["deeper"]]]]] [collect rule] *** Script Error: PARSE - input must be of any-block! type: we *** Where: parse *** Stack: greggirwin 19:35@9214, that would be a great example to include in the parse docs. I think you have some PRs there I need to catch up on. 9214 19:36@greggirwin [it is included](https://github.com/red/docs/blob/master/en/parse.adoc#into), albeit in a slightly different form. 19:39@cloutiy or maybe not yo-yo but a fishing rod. Sometimes you catch something, sometimes you don't, but you stay on the waterside either way; it's the hook that goes forward (and either _matches_ a fish or not) and then comes back. greggirwin 19:43@9214 would be good in the ahead section, or point to into examples as well. 9214 19:46Well it's a fractal yo-yo actually :alien: >> rule: [mark: skip (probe mark)] == [mark: skip (probe mark)] >> parse [a b c d][ahead [rule ahead [rule ahead [rule ahead rule rule] rule] rule] rule 'b 'c 'd] [a b c d] [b c d] [c d] [d] [d] [c d] [b c d] [a b c d] == true greggirwin 19:50:^) Or just "look at the thing in front of you. If it's what you are looking for, say yes; otherwise say no. " cloutiy 22:02Can it be used somewhat like a case? if-statement: [ "if" ... ] case-statement: [ "case" ... ] let-statement: [ "let" ... ] statement-list: [ any [ space | newline | ahead "if" if-statement | ahead "case" case-statement | ahead "let" let-statement | (print "Expecting if, case or let expression." quit) ] ] 9214 23:20@cloutiy how is that different from rules without ahead? endo64 23:26One of the great examples from @9214 is using ahead with keep (and if). if you don't use ahead you would already kept the value even if it is not the value you want. You already kept while you are checking it. dander 23:54[This puzzle](https://github.com/dander/advent-of-code/blob/master/2016/day-7.red) has an example of ahead usage. I was using these as a way of experimenting with different ways of doing things, so some of the code is a bit more obtuse than it needs to be, but I think the parse rules were pretty reasonable. cloutiy 23:54@9214 I guess you're right, it makes no difference. dander 23:57actually, re-reading @toomasv comment, I'm realizing I was mostly using not ahead, which should just be not Tuesday 11st August, 2020 9214 00:57@cloutiy are you struggling to come up with the use-cases for ahead, or is it more of a conceptual block for you? 01:10I think [this](https://gitter.im/red/parse?at=5f1aa95a2779966801fad96b) example is what @endo64 talks about, which in some sense is flawed because it won't handle nested tags correctly. cloutiy 02:30@9214 Yes I guess it's more of trying to find use cases. Conceptually I understand now I think. Just wondering now where I would apply it (in personal parsing projects). I'm tinkering with making a recursive descent parser generator, which would 1) Parse a ebnf spec 2) Generate a recursive descent parser which 3) Generates Red code as the backend to then 4) Compile. Ambitious I know ;). I have parts of it working, and was trying to see whether it would benefit (or not) to use other pieces of parse, whether it would make things easier/cleaner (or not). Monday 17th August, 2020 rebolek 07:35Another example of ahead usage is to parse stuff like Markdown for example, where you need to decide if e.g. an asterisk marks emphasis or is simply an asterisk. You can look ahead for matching asterisk to determine that it's emphasis: parse markdown-text [ ; match the start of emphasis #"*" ; look for emphasis end ahead [to #"*"] ; if the end was found, the rule will continue with the actual content emphasis-content ; otherwise, parse all stuff as normal content | normal-content ] Of course, the real rule would be more complicated, but this is good enough to get the idea. bubnenkoff 07:52Why brackets change behavior? >> parse [1 2] [any [fail | (print "A") skip]] == false >> >> parse [1 2] [any [[fail] | (print "A") skip]] A A == true pekr 07:54I am not skilled with block parsing, but in the second case, maybe the fail enclosed in the block is not going to be evaluated? 07:56Well, anyway - why would you use failthat way? "force current rule to fail, backtrack " (taken from the R3 docs), so for me, it is someting like break? 07:57It simply escapes your rule right after entering it ... bubnenkoff 08:01I am just going via this post https://github.com/red/red/issues/3478 and trying to understand logic of every example 11:37What is the best strategy to collect only data inside not ouside? a: { <apps> <app>1</app> <app>2</app> <app>3</app> </apps> <app>4</app> } parse a [ any [ thru "<app>" copy _ to "</" (print _) ] ] this will process even 4. Lets assume that structure can be: a: { <apps> <app>1</app> <app>2</app> <app>3</app> </apps> <foo> <app>4</app> </foo> } or: a: { <apps> <some> <app>1</app> <app>2</app> </some> <app>3</app> </apps> <foo> <app>4</app> </foo> } rebolek 11:59Something like [ <apps> some [ </apps> break | app-collection ] ] bubnenkoff 12:27Thanks! I wrote not exactly what I need, but I can't understand why it work not as expected: whitespace: charset reduce [space tab cr lf] ws: [any whitespace] a: { <apps> <app>1</app> <app>2</app> <app>3</app> </apps> <app>4</app> } parse a [ any [ thru "<app>" copy _ to "</" (print _) not [ahead ws "</apps>"] ] ] it should print all except 3 because ahead is rebolek 12:32except 4 you meant, right? You don't need not ahead, not is fine by itself (version with whitespaces): >> a == {<apps><app>1</app><app>2</app><app>3</app></apps><app>4</app>} >> parse a [<apps> any [<app> copy _ to "</" thru #">" (print _) not </apps>]] 1 2 3 == false bubnenkoff 12:40No I wrote code above and than tried to understand what it do. I read it as "read every app except app that have ahead apps". I am playing in attempts to understand how to process different cases. I expected that it should not process 3 because ahead of 3 is "</apps>" rebolek 12:46But your check is in the end, so 3 is already printed when you are doing the check. 9214 12:49> Why brackets change behavior? @bubnenkoff in the former case fail fails [... | (print "a") skip] block and makes any to instantly stop, in the latter it fails enclosing [...] and backtracks to an alternate rule. It's all described in the documentation, FYI. 12:55> What is the best strategy to collect only data inside <apps> not outside? Same as in all the other examples we gave to you. apps: [<apps> some app </apps>] app: [<app> keep copy match to "<" </app>] parse trim/all { <apps> <app>1</app> <app>2</app> <app>3</app> </apps> <app>4</app> }[ collect apps ] 13:06Unless you meant "collect only app at the top-level of apps". In that case: apps: [<apps> some [app | junk] </apps>] app: [<app> keep copy match to "<" </app>] junk: ["<" copy name to #">" thru ["</" name ">"]] parse trim/all { <apps> <some> <app>1</app> <app>2</app> </some> <app>3</app> </apps> <foo> <app>4</app> </foo> }[ collect apps ] cloutiy 13:58@rebolek Re: ahead ok I think I get it now. As a general summary... ; Lookahead for some-pattern. Does not advance the index. ahead some-pattern ; if true, continue with all the rules after 'ahead'. next-rule1 next-rule2 next-rule3 ; otherwise... | rule4 rule5 rule6 rebolek 14:20@cloutiy yup toomasv 14:54@9214 I think he only didn't want to see "3" in prints, as e.g. parse trim/all a [ any [ thru <app> copy _ to </app> </app> not </apps> (print _) ] ] 9214 15:04@toomasv 3 or 4? toomasv 15:383 Thursday 20th August, 2020 bubnenkoff 11:21Is it possible ti use function return value as value inside parse? f: func[] ["aa"] parse "aa" [f] or something similar endo64 11:46Using parens, yes it is possible. 11:46Ah you mean function as a rule? bubnenkoff 11:46data that return function of field of class endo64 11:49You may need to reduce/compose: parse ["aa"] compose [(f)] 11:50Otherwise it will match with itself, parse probe reduce [:f] [f] ; == true bubnenkoff 12:22@endo64 thank, but this code do not copy x: t: "bb" parse "<aa>111</aa><bb>222</bb>" compose [ thru "<" (t) ">" copy x to "</" (t) ">" ] It copy only if t: "aa" endo64 13:39It is the correct behavior, you go thru "<" then expect "bb" but you got "aa", so parse fails and stops. 13:40What you want is parse "111222" probe compose/deep [thru ["<" (t) ">"] copy x to [""]] I think. bubnenkoff 15:18Thanks! Why compose is change collecting behavior? >> parse "<aa>11</aa><bb>22</bb><dd>55</dd><cc>33</cc>" [ [ some [ [ thru ">" [ copy x to "</" (print x) [ ] [ [ ] 11 <bb>22 <dd>55 <cc>33 == false >> >> >> parse "<aa>11</aa><bb>22</bb><dd>55</dd><cc>33</cc>" compose/deep [ [ some [ [ thru ">" [ copy x to "</" (print x) [ ] [ [ ] <cc>33 == false 9214 15:22@bubnenkoff what do you think happens when compose/deep reaches (print x)? bubnenkoff 17:51it's try to evaluate print and x? So why print is ? 9214 18:00print is not . (print x) is evaluated and prints x, which is set to the result from the last usage of Parse, i.e. to "33". bubnenkoff 18:06is there any way to mix two behavior? I need way to use words value and red code in ( ) 9214 18:07@bubnenkoff [what is it that you are trying to do?](http://xyproblem.info/) bubnenkoff 18:12it seems that you are right. I will rethink my code 18:18> print is not . (print x) is evaluated and prints x, which is set to the result from the last usage of Parse, i.e. to "33". It's only question, why it's print only result from the last usage of Parse? Why not for example first result? 9214 19:00Put probe x between parse "..." [...] and parse "..." compose/deep [...] in the example above. Then try to understand from where the result comes from. 19:03If that doesn't help, put probe :x before parse "..." [...]. Then keep narrowing down the gap between the two probes until it clicks :smiley_cat: bubnenkoff 19:11I am still trying to learn from your code. Your example is great. For example above you used next construction: if (find tags opening) And I am trying to understand you did it to minimize example, or it's hard to pass data from parser to function and vice-versa? I decided to try next approach. It's proof of concept and do not work now. But I can't understand it's good or bad? o: object[ list: ["aa" "bb" "cc"] is-found: false to-next: func[] [ list: next list probe reduce ["now list: " list] ] is-found: func[tag value] [ print ["tag: " tag " value: " value] ] f: func[x] [ print ["==> " x] ] ] parse "<aa>11</aa><bb>22</bb><dd>55</dd><cc>33</cc>" [ (o/is-found: false) some [ thru ["<" (first o/list) ">"] (o/is-found: true) copy x to ["</" (first o/list) ">"] (print ["=>" x] o/to-next) ] ] I have object and methods that I want to touch from parser. The problem with calling things like: (first o/list). 9214 19:13> And I am trying to understand you did it to minimize example, or it's hard to pass data from parser to function and vice-versa? It literally reads as "if opening tag is in the list of allowed tags, then match, else fail and backtrack". bubnenkoff 19:17Does my approach above is potential working? Or it have some fundamental issues? 9214 19:22I repeat the question: what problem are you trying to solve here? Are you trying to instrument your parser somehow? bubnenkoff 19:30In code above I am trying to write function that will allow me to check if all tags in code exists. Potentially I need to check very complex structure, but now at last I want to pass only tags names and check if all of them in xml dander 19:34Are you trying to enforce that they come in that specific order? 19:36It might be easier to collect a list of tags that are there then check to see if you got all the ones you need after the fact rather than during the parsing bubnenkoff 19:37As I wrote I have *very* complex XMLs that have very crazy structure. I asked above about how to parse tags if I am not sure about tier order. And yes - it's part of problem. Now I am trying to split it to small tasks and learn how to do single operation. Now - checking if all tags exists. I already know that I can do it in parser like examples above (collected: false). But I need to check hundred files to their struct. So I need more elegant way. 19:41The problem with list of tags that I can have very similar section. And I need to know who is parent and grand-parent of tag, because section <data> <price> </price> </data> can meet in different places, but I need only one. 9214 19:51Well, if you need context-sensitive search (e.g. price but only if it's inside data) then you first need to convert linear XML to a tree. I already gave you a working prototype for that yesterday. dander 19:52Sorry, I'm still not clear. Are you saying that the list of tags you are looking for must be present AND in a specific order, or that they must all be present, but you aren't sure which order you will find them? I'm just asking because your PoC above seems to only accept them in-order Friday 21st August, 2020 bubnenkoff 06:36@9214 ok I will look it again. @dander the problem that I have too many conditions. Most of tags have order, but in some cases there is can be wrong order. I decided ti start with simplest cases. So yes PoC above is accept tags in-order. 08:27> Put probe x between parse "..." [...] and parse "..." compose/deep [...] in the example above. Then try to understand from where the result comes from. Am I right understand that I should do like this: parse "<aa>11</aa><bb>22</bb><dd>55</dd><cc>33</cc>" [ some [ thru ">" copy x to "</" ] ] probe x parse "<aa>11</aa><bb>22</bb><dd>55</dd><cc>33</cc>" compose/deep [ some [ thru ">" copy x to "</" ] ] 09:10I have only idea that compose/deep causes evaluation of () on last step Wednesday 2nd September, 2020 bubnenkoff 06:59@9214 could you answer please for question above. I still not sure that I understand it correctly. 07:01I have got new question. How to parse data structure if it have [. How to escape this symbol? For example I need add after every [ { to get: [{ ... }]: data: [[x: none] ] parse data [...] toomasv 07:02into? 07:07 >> data: [[x: none] ] parse data rule: [any [ahead block! into rule | change 'none 'something | skip]] data == [[x: 'something]] bubnenkoff 07:09thanks for example! toomasv 07:13My pleasure! rebolek 07:19Just a note, ahead block! before into is important, otherwise into will go into strings (and other serie types) also and you'll wonder why your rule doesn't work: >> parse ["abc" [abc]][some [into [word!] | skip]] *** Script Error: PARSE - matching by datatype not supported for any-string! input *** Where: parse *** Stack: >> parse ["abc" [abc]][some [ahead block! into [word!] | skip]] == true toomasv 07:33@bubnenkoff To convert your block contents into string: >> data: [[x: none] ] >> parse data rule: [any [ahead block! (inside?: yes) into rule (inside?: no) | if (inside?) s: copy _ to end :s change to end (mold/only _) | skip]] data == [["x: none"]] Are you sure you'lI need braces? May be use string parsing then: >> data: mold [[x: none] ] parse data rule: [any [change #"[" "[{" | change #"]" "}]" | skip]] data == "[{[{x: none}]}]" Or >> data: mold [[x: none] ] parse data rule: [skip any [change #"[" "[{" | #"]" end | change #"]" "}]" | skip]] data == "[[{x: none}]]" bubnenkoff 07:41@toomasv Let me explain the problem that I am trying to solve. I have data structure: data: [ name: none lots: [ lotNumber: none price: none objects: [ code: none ] ] ] The fields that placed in brackets can be multiple like: data: [ name: none lots: [ lotNumber: none price: none objects: [ code: none code: none code: none ] ] ] Or: data: [ name: none lots: [ lotNumber: none price: none objects: [ code: none ] lotNumber: none price: none objects: [ code: none ] ] ] or even: data: [ name: none lots: [ lotNumber: none price: none objects: [ code: none ] lotNumber: none price: none objects: [ code: none code: none code: none ] ] ] Do you remember code that fill this struct that you helped me to write? I am trying to understand how to dynamically add new fields for every new data. So I am trying to implementsuch logic: if we founding new block add new copy of it and then fill. I am not sure that it's good idea, but it's only idea that I have. Now I know to to add sections, and I am trying to make result look as json toomasv 09:35@bubnenkoff I'm not sure I understand fully your requirements. In following I assume * used data should be disregaded, i.e. not used again * with name tag new name and lots will be added * new data to lots will be added in bunches of lotNumber, price and objects * objects will contain only code fields data: [ name: none lots: [ lotNumber: none price: none objects: [] ] ] walk-data: func [/local out found] [ out: make block! 30 foreach [tag value] list [ switch/default tag [ name [ head out: skip insert tail out copy/deep data -4 out/name: copy value ] code [ append first find/last/tail out/lots 'objects reduce [quote code: copy/deep value] ] ][ either 'none = first found: find/last/tail out/lots tag [ found/1: value ][ append out/lots copy/deep data/lots change find/last/tail out/lots tag value ] ] ] head out ] list: [ name "Apples" lotNumber 1 price $13 code [print "first"] code [do [something]] lotNumber 2 price $32 name "Bananas" lotNumber 3 price $7 code [print "Bananas are only $7"] price $99.99 code [print "Price goes up"] ] probe walk-data Results in [ name: "Apples" lots: [ lotNumber: 1 price: $13.00 objects: [code: [print "first"] code: [do [something]]] lotNumber: 2 price: $32.00 objects: [] ] name: "Bananas" lots: [ lotNumber: 3 price: $7.00 objects: [code: [print "Bananas are only $7"]] lotNumber: none price: $99.99 objects: [code: [print "Price goes up"]] ] ] bubnenkoff 09:38Oh great! Thanks! I am reading the code! toomasv 09:41Ah, I forgot about JSON. bubnenkoff 09:42> with name tag new name and lots will be added No it should not, because name have only one value, but lots content is multiple. /me Reading ... Only data inside [] can\should be multiplicate. Other than root (data) because data is container. Your code have hardcoded words like lots. I have very complex data structure and can't hardcode anything... I think I should create copy of every multiple element every time I am touching it content. For example if I am accessing to lotNumber copy all parent lots to another place and fill it. Or something like it. toomasv 09:55Treat it as an example; play and adapt as necessary if at all. It is just a sketch of some techniques, not a code ready for your specific use-case :smile: bubnenkoff 09:59Ok, big thanks for example! I am trying to find proper approuch for solving this problem. Tuesday 29th September, 2020 bubnenkoff 06:44Is it's possible to insert reduce word after lots data: [ id: 123 date: "2020" lots: [lot: [lotNumber: 1 price: ] ] ] to make data look: data: [ id: 123 date: "2020" lots: reduce [lot: [lotNumber: 1 price: ] ] ] quote in next code do not work: parse data [thru quote lots insert quote reduce] probe data P.S. I need to insert reduce because later I will add object to make nested object evaluated (I am just playing here) rebolek 06:48you can use parse of course, but simple insert is enough here: insert next find data quote lots: 'reduce bubnenkoff 06:50Thanks! And how to do same with parse? rebolek 07:06parse data [thru quote lots: insert ('reduce)] bubnenkoff 07:09Could you explain how brackets work here? rebolek 07:09Parse's insert is weird. 07:09IMO it's a bug. 07:09Parenthesis evaluate what's inside, so 'reduce is evaluated to reduce and can be inserted. 07:10insert 'reduce inserts 'reduce and insert reduce insert func!. Weird behavior IMO. bubnenkoff 07:31M... and how to change word lot: to object (without colon): parse data [to quote lot: change 'lot: 'object] do not work rebolek 07:44there's no 'lit-set-word! type 07:45so 'lot: doesn't make sense 07:46However, you can do this: code: [reduce] parse data [to quote lot: change quote lot: code] 07:47code is evaluated in this case and reduce is inserted bubnenkoff 07:51Do not understand about idea about code. I want to change lot: to word object to make data look: data: [ id: 123 date: "2020" lots: [object [ lotNumber: 1 price: 777 ] ] ] P.S. omit the previous example with lots. I will integrate it later rebolek 08:02 code: [object] parse data [to block! into [change quote lot: code]] bubnenkoff 08:03M... it's look like I begin understand logic! One moment! 08:21Yes I understand your idea, but why are you using to block! into? Also if use some it's change only first lot:: data: [ id: 123 date: "2020" lots: [ lot: [ lotNumber: 1 price: 777 ] lot: [ lotNumber: 2 price: 888 ] ] ] code: [object] parse data [ some [ to block! into [change quote lot: code] ] ] probe data 08:47I have found solution. Not sure that it's good, but at last it readable: data: [ id: 123 date: "2020" lots: [ lot: [ lotNumber: 1 price: 777 ] lot: [ lotNumber: 2 price: 888 ] ] ] parse mold data [result: some [ to "lot:" change "lot:" "object" ] ] probe to-block result result: [[ id: 123 date: "2020" lots: [ object [lotNumber: 1 price: 777] object [lotNumber: 2 price: 888] ] ]] 09:12The issue with appearing addition [ :( rebolek 09:14@bubnenkoff why don't you use the solution I shown you? >> code: [object] == [object] >> parse data [to block! into [some [change quote lot: code | skip]]] == true >> data == [ id: 123 date: "2020" lots: [object [lotNumber: 1 price: 777] object [lotNumber: 2 price: 888]] ] bubnenkoff 09:16oh! I missed skip thanks! rebolek 09:23You're welcome. The example hadn't skip because there was just one lot:. bubnenkoff 10:19@rebolek does this code have any nesting limitation? I tried to hange with it nested block (the next task is change object: to object) and it do not work: data: [ id: 123 INN: "123213142" lots: [lot: [ lotNumber: 1 price: 777 objects: [object: [ name: "Apples" ] object: [ name: "Bananas" ] ] ] ] ] code: [object] parse data [ to block! into [ some [change quote object: code | skip] ] ] probe data rebolek 10:44@bubnenkoff as you can see, it looks for a block (to block!) and then jumps into that block (into ...). It doesn't look for other nested block, but you can change the rule so it would be recursive. bubnenkoff 10:48I tried to wrap it in yet another some rebolek 10:49How would that help? bubnenkoff 10:49no way :( rebolek 10:49Try something like this: parse data rule: [some [change quote object: code | ahead block! into rule | skip]] bubnenkoff 10:50wow! thanks! I will try it now rebolek 10:50You need recursive rule, if you want to deal with nested blocks, some will just make the rule match one or more times. Wednesday 7th October, 2020 GiuseppeChillemi 22:41Is it possible to SET a matched element to a word in a context? SET does not seem to work on paths. I need to write to OBJ/WORD when parsing. Even a SET in OBJ WORD would be welcome. XANOZOID 22:43Are you looking for set in obj 'a "val" ? 22:43Oh hmm. 22:44> Even a SET in OBJ WORD would be welcome. Can you define a quick example of where you're running into the problem? GiuseppeChillemi 22:50Yes but inside parse block rule. XANOZOID 22:51if you want to fudge it a little I imagine you could set it up where you create a structure that looks like do [ obj/word: your-val ] GiuseppeChillemi 22:52I want to set to context words the values I match with parse. 9214 22:53 text >> foo: object [bar: 'qux] () >> parse [baz][set match word! (set/any 'foo/bar :match)] == true >> foo/bar == baz GiuseppeChillemi 22:56Thanks Vladimir, I am already using this expressive form: parse [x] [set value word! (dd/value: value)] but I was asking if we can do it directly in PARSE SET without using a global word. 9214 22:59 text >> foo: object [bar: 'qux] () >> parse [baz][set match word! (set/any 'foo/bar :match unset 'match)] == true >> foo/bar == baz >> value? 'match == false >> parse [baz] bind [set bar word! (set/any 'foo/bar :bar)] foo: object [bar: 'qux] == true >> foo/bar == baz >> value? 'bar == false GiuseppeChillemi 23:03>> (set/any 'foo/bar :match unset 'match) This should delete any previous 'match content, shouldn't it? 9214 23:04Implementing support for paths is a bit expensive, this is the main reason why they are not handled by Parse yet (see [here](https://github.com/red/red/issues/3528#issuecomment-447033900) for details). GiuseppeChillemi 23:15Thanks, this is the reason why we can't use paths in VID, isn't it? No support on parse = no support in VID dialect, just direct words. 9214 23:17That's totally unrelated. You can parse paths in input (such as VID block), you cannot use them in rules. GiuseppeChillemi 23:18Ok 9214 23:18> This should delete any previous 'match content, shouldn't it? In this scenario, yes. You can easily check it yourself in a REPL though. Thursday 8th October, 2020 GiuseppeChillemi 20:12@9214 Just a last question on your note: if parse paths in rules would be implemented, would this slow down the whole parse or just when using paths in rules? greggirwin 20:38General overhead would take a slight hit, as you have another datatype to check for, but the main hit would be when you use them. That's something we can tell users, so they know that using them in heavy processing may have a noticeable impact. It would be a nice feature to have IMO. GiuseppeChillemi 20:44@greggirwin Thanks for your answer. I am just asking, I don't want to make any pressure. I Iike the idea of having paths either here and on VID styles setup values but actually Red has more important priorities. Sunday 11st October, 2020 GiuseppeChillemi 00:21Now that I am starting to handle parse In the correct way, I want to say that making dialects is really fun!!! How crazy genius has been Carl to invent parse based DSLs? 00:23I have made a small SET with custom containers in 15 minutes. Redbol make me say "that's the joy of coding" greggirwin 02:28:+1: Saturday 24th October, 2020 GiuseppeChillemi 22:15I am loving parse. I am thinking about a lot of use cases: as a grammar oriented case, as a record extractor, as for loop, as special switch, as for-case loop, as foreach. It's incredible how flexible it is! greggirwin 23:33It's the jewel in the crown. Monday 26th October, 2020 Oldes 21:02Why is parse so slow when I use it like this? data: read/binary http://avatars-04.gitter.im/gh/uv/4/oldes dt [loop 10000 [find/match data #{89504E47}]] ;== 0:00:00.0039912 dt [loop 10000 [parse data [#{89504E47} to end]]] ;== 0:00:13.6435 9214 21:07to. Oldes 21:10I believe it's a bug, because the speed of these 2 should be similar.. like in Rebol. Tuesday 27th October, 2020 giesse 07:40startup time for parse is likely to always be bigger than find. 07:46but I agree that to end shouldn't be that slow... :) >> profile/show [[find/match data #{89504E47}] [parse data [#{89504E47} (found?: true)]] [parse data [#{89504E47} to end]]] Time | Memory | Code 1.0x (331ns) | 512 | [find/match data #{89504E47}] 2.59x (858ns) | 168 | [parse data [#{89504E47} (found?: true)]] 5201.75x (2ms) | 168 | [parse data [#{89504E47} to end]] pekr 07:49I can agree too. We know that Red is supposed to be slower in certain operations, as R/S is not at C level yet, but the to endoperation looks suspicious :-) 9214 11:39Rebol2 likely does a peephole optimization for this specific case by checking for end presence. Friday 30th October, 2020 hiiamboris 18:39 >> ws: " " cs: charset "abcde" == make bitset! #{0000000000000000000000007C} >> parse "ab c de" [collect any [keep some cs some ws]] == ["ab" #"c" "de"] >> parse "ab c de" [collect any [keep copy some cs some ws]] == ["a"] >> parse "ab c de" [collect any [keep [copy some cs] some ws]] == [#"a"] Can't wrap my head around this. Am I doing smth stupid here? I want ["ab" "c" "de"] output. 18:40@9214 should know ;) 18:41Right! I forgot the underscore "variable" 18:43This idiom feels just so wrong on design level every time I forget how to use it ;) 9214 18:55@hiiamboris yes, that's the [keep copy poop wart](https://github.com/red/docs/blob/master/en/parse.adoc#collect) as I love to call it. > If rule matched a single value, this value is kept; if keep is followed by a copy rule, then matched value is enclosed into a series of the same type as input. hiiamboris 18:55:D 18:57Happens when we exploit side effects of design rather than design anew ;) Friday 13th November, 2020 GiuseppeChillemi 12:31@rebolek I would like to have a context for each instance of a function to isolate the words used by SET like: rule: [ (x: make object! [a: b: c: none]) set a word! set b word! set c! number! (append container x) ] So, each instance of rule would work on a different context. But I don't know how to bind the next code segment. 12:39Autoanswer: maybe I could do this way. I will try it when I can: rule: [ (x: make object! [a: b: c: none] bind segment-rule: [set a word! set b word! set c! number!] 'x) segment-rule (append container x) ] toomasv 15:26@GiuseppeChillemi Probably I don't see what you want to achieve. Simple solution could be following, but you probably intended something else: rule: [collect any [set _a word! set _b word! set _c number! keep (object [a: _a b: _b c: _c])]] container: parse [x y 1 z w 2] rule == [make object! [ a: 'x b: 'y c: 1 ] make object! [ a: 'z b: 'w c: 2 ]] rebolek 15:34@GiuseppeChillemi I use my own functor (function constructor) that allows me to do things like: rule: [set /local a skip] GiuseppeChillemi 18:03@toomasv I am trying to create isolated storage elements in recursive rule segments . So, at each round of recursion words used by parse SET, and OBJECTS I use I use to store those words too with (myobject/data: WORD-SET-BY-PARSE) , are unique and isolated. 18:13@rebolek Hai you published it? greggirwin 18:17Collecting data into structures is a common task. We really need to provide some good examples for people to work from, until we add more complete support for this kind of thing. I seem to recall that Ladislav had rule-local-vars parse examples. If nobody else knows where they are, I'll try to find them. GiuseppeChillemi 18:28My idea was to preserve a word used in parse SET, so if you execute a rule multiple times, when you come back to the previous level, after the continuation point, the subsequent code would use the word belonging to its level. Like scoping works in classic languages. greggirwin 18:33Yes, I know I'm not the only one to have dealt with that issue. I did it all in actions though, where a rule used words in a basic way, and actions did all the data construction. I also often used a naming convention where I added = to the end of production rule names, and *prepended* = to the name for the word that referred to the data it collected. toomasv 18:41Can you show a concrete example to help me get the idea. It somehow sounds familiar but.. misty still. rebolek 18:55@GiuseppeChillemi not yet, but I will. 18:56In Rebol, I had a function that was able to make parse rules with local variables. It's harder in Red as it used use, but I may try to rewrite it. GiuseppeChillemi 19:01@rebolek The code is not mine: use-local: func [locals blk] [ do reduce [ func compose [/local (locals)] blk] ] 19:42@toomasv It's still boiling in my mind. In theae days I am working on composing and nesting parse rules and I have spotted the need to isolate words used in code segment. I need some time to mature the idea. 19:44Also, I see I can't have a block of rules and do something line `parse [...] [rules/rule1 rules/rule2] I am forced to use only words to contain rules. Do you confirm? toomasv 20:15Generally yes. But there are also other ways, e.g. here is a strange one: math: func [a _ c d][a _ c = d] parse [1 + 2 3 2 * 4 8 3 - 1 2] [some [s: if (math s/1 get s/2 s/3 s/4) (s: skip s 4) :s]] == true GiuseppeChillemi 22:16@toomasv Thanks for the headache Saturday 14th November, 2020 GiuseppeChillemi 21:29@toomasv My needs are several: * set a structure passed to a function that uses parse to store it in a STACK or TABLE like storage. * Recover words set at each round of RULES1 if needed by further code. To archive this I have started experimenting. At its simplest, at each round of RULES1, if the grammar is matched by the input, then the structure elements are set. rules1: [set arg1 word! set arg2 word! set arg3 integer! (struct-to-set/a: arg1 struct-to-set/b: arg2 struct-to-set/c: arg3)] decode: func [phrase struct-to-set] [ parse phrase [rules1] ] In this first version I made an error: I have thought that the code would work to parse the block and set the structure. I have soon realized that struct-to-set ARG was not bound in the RULES1 block, where it is just a global unset word. So I have thought about binding the passed block to the decodefunction context. Then I have realized that as PARSE reduces each word in a nested way, so BIND would just bind only the words before any reduction. As solution, I have then thought about binding each rule *on the fly when used. After thinking this, a simpler solution came in mind: wrapping everything around a big context containing all the rules: mystruct: make object! [a: b: c: none] parse-ctx: make object! [ struct-to-set: none rules1: [set arg1 word! set arg2 word! set arg3 integer! (struct-to-set/a: arg1 struct-to-set/b: arg2 struct-to-set/c: arg3)] decode: func [phrase passed-struct] [ struct-to-set: passed-struct ;parse-ctx context! parse phrase [rules1] struct-to-set ] ] probe parse-ctx/decode [a b 2] mystruct probe struct-to-set When the basic working have been established, I have moved to the next task: Keep a version of the `SET` variables `ARG1` and `ARG2` or the `STRUCT-TO-SET` for each round of the rule. So, what should I do? Because if I add `ANY` in `parse` like: ``` parse phrase [ANY rules1]` then, each round of RULE1 would overwrite the previous arguments and print [ARG1 ARG2 STRUCT-TO-SET] would return the last round values. So my idea was to create a context for those words at each round and, eventually, store it in a block, in a stack like PUSH operation, and then recovering it at rules1 end with a PULL one is needed after next level RULES1 return. Also, storing the ARGS and STRUCT-TO-SET in a new context each round, and adding a KEY, would open the opportunity create an indexed storage for random retrieving instead of PUSH/PULL operations. These were the goal of my experiments: storing of an object representing an record in a block and push/pull of contexts in a block. Sunday 15th November, 2020 toomasv 06:39@GiuseppeChillemi Unless I left something unnoticed it seems to me your first version was already very close to your goal: structs: clear [] rules1: [any [set arg1 word! set arg2 word! set arg3 integer! (append structs make struct-to-set [a: arg1 b: arg2 c: arg3])]] decode: func [phrase struct-to-set] [parse phrase bind rules1 :decode] >> decode [a b 1 c d 2 e f 3] object [a: b: c: none] == true >> structs == [make object! [ a: 'a b: 'b c: 1 ] make object! [ a: 'c b: 'd c: 2 ] make object!... But it could be simplified as you don't need to pass the struct-to-set: structs: clear [] rules1: [any [set arg1 word! set arg2 word! set arg3 integer! (append structs object [a: arg1 b: arg2 c: arg3])]] decode: func [phrase struct-to-set] [parse phrase rules1] 06:56Oops, in the last decode I forgot to remove struct-to-set from function spec. GiuseppeChillemi 08:01@theSherwood I have noticed, but struct-to-set was there for a reason: in other scenarios, some grammars could return at some point and then be resumed later. Struct-to-set would carry some extra data like the dialect block where interrupted, and all the dialect parameters and values collected by the grammar processing: switches, operating modes, refinements; they are needed for interpreting the rest of the Phrase. toomasv 10:39@GiuseppeChillemi Sounds complicated. But here is one attempt with interruptions: rules: object [ top: [ (clear args) some [ current: gather [ if (args/3 >= stop) interrupt | (append result object [a: take args b: take args c: take args]) ] ] ] stop: 3 interrupt: [thru end] continue: [:current top] gather: [collect into args [word word number]] word: [keep word!] number: [keep number!] result: clear [] args: clear [] current: none ] data: [a b 1 c d 2 e f 3 g h 4 i j 5 k l 6] parse data rules/top ;== true rules/result ;== [make object! [ ; a: 'a ; b: 'b ; c: 1 ;] make object! [ ; a: 'c ; b: 'd ; c: 2 ;]] ;...Do something else rules/stop: 5 parse data rules/continue ;== true ;... Interrupted again length? rules/result ;== 4 rules/stop: 7 parse data rules/continue ;== true last rules/result ;== make object! [ ; a: 'k ; b: 'l ; c: 6 ;] length? rules/result ;== 6 GiuseppeChillemi 11:49Nice, parse rules state saving and resuming resembles me stack pushing and pulling, but hey, parse is used to make languages where stacks are needed! Wednesday 25th November, 2020 toomasv 19:34 :loudspeaker: Contest for transformational parse: 1) What is the best way to transform "a+b+c+d+e" into "((((a+b)+c)+d)+e)"? 2) What is the best way to transform "a+b+c+d+e" into "(a+(b+(c+(d+e))))"? Hmm.. And how to define "best"? greggirwin 20:17- Are all ops strictly binary? - Are parens allowed in the source, and need to be honored? toomasv 20:19To keep it simpler, ops are binary, no parens in source. greggirwin 20:20:+1: 20:48Draft 1: ; String based approach, not tree based insert-parens: function [src /right][ op: charset "+-*/" blk: parse src [ collect [ some [ keep copy w to [op | end] keep copy o skip ] ] ] dest: copy "" len: to integer! divide length? blk 2 either right [ append dest #"(" foreach [w o] blk [ repend dest either none? o [[w]][[w o #"("]] ] append/dup dest #")" len ][ append/dup dest #"(" len - 1 repend dest [#"(" blk/1] foreach [o w] next blk [repend dest [o w #")"]] ] ] print insert-parens "a+b-c*d/e" print insert-parens/right "a+b-c*d/e" 20:51Was going to [word op (insert paren incr count)] then insert count alt-paren at the end, but this helped me think about it, and was fun. toomasv 21:17:+1: Nice! Anyone else? Thursday 26th November, 2020 greggirwin 00:06It's interesting, because it doesn't look like a hard problem. That is, from a human perspective you can see what to do easily. But my code above is anything but obvious, isn't it? The gyrations completely hide the goal. 00:12It also has a subtle glitch in /right handling, where the last value is solely parenthesized. 00:49Started on a quick mod-in-place 'parse' version, solving the (e) edge case, but found another one. I won't spoil it for others yet. The trick is what you don't know, when taking a naive string mod approach. What seems simpler at a glance...isn't. rebolek 05:47I've been working on something similar recently, I need to find the code. toomasv 07:50Here is mine: enparen: function [str [string!] /right][ op: charset "+-*/" el: [some [not op skip]] n: 0 rule: either right [ [s: el opt [op e: :s insert #"(" :e skip rule insert #")"]] ][ [s: el any [op el insert #")" (n: n + 1)] :s n insert #"("] ;[s: el any [op el insert #")" e: :s insert #"(" :e skip]] ;alternatively ] parse str: copy str rule str ] enparen "a+a+a+a+a+a+a" ;== "((((((a+a)+a)+a)+a)+a)+a)" enparen/right "a+a+a+a+a+a+a" ;== "(a+(a+(a+(a+(a+(a+a))))))" pekr 08:27There could be more pleasant spacing, and without spaces it could use /tight option .... but of course dunno, what the original purpose was meant to be .... toomasv 09:11Good, why not! Show your solution. pekr 09:12I did not meant spacing of your code, but of the outputted code :-) toomasv 09:13Me too ;) pekr 09:25Just did some test with your code and (most probably insufficiently) changed one of your code lines to: [s: el any [insert #" " op insert #" " el insert #")" (n: n + 1)] :s n insert #"("] .... not sure if I should use some aheador so parse keyword, so that first space is inserted only after the opis matched with next rule .... The output I get is: == "((((((a + a) + a) + a) + a) + a) + a)" toomasv 09:27I thought of the following: current op: ... in my code should be replaced by sep: charset "+-*/" op: [change [any space set o sep any space] (rejoin [space o space])] Then >> enparen "a+b-c*d/f" == "((((a + b) - c) * d) / f)" >> enparen/right "a+b-c*d/f" == "(a + (b - (c * (d / f))))" pekr 09:27Of course it does not work, if I submit it already spaced code enparen "a + a + a + a + a + a + a" 09:28Well, really nic, the result looks better - well, for me anyway .... 09:28Maybe C fluent ppl are not used to write such spaced code, just dunno ... GalenIvanov 10:13@toomasv Nice exercise! This is my half prase- half imperative solution: 10:13 enparen: function [ str [string!] /right ][ op: charset "+-*/" el: [some [not op skip]] b: parse str [ collect [ keep any el some [ keep op keep any el ] ] ] par: "()" if right [reverse b reverse par] par-str: copy par insert next par-str take/part b 3 foreach [op el] b [ par-str: head insert next copy par reduce [par-str op el] ] if right [reverse par-str] par-str ] 10:16 s: "a+b-c*d/f" print ['enparen mold s '-> enparen s] print ['enparen/right mold s '-> enparen/right s] enparen "a+b-c*d/f" -> ((((a+b)-c)*d)/f) enparen/right "a+b-c*d/f" -> (a+(b-(c*(d/f)))) toomasv 10:32Nice juggling with strings, @GalenIvanov ! But why do you use any el in rule? GalenIvanov 10:32@toomasv Oh, it already has some 10:32I'll fix it 10:33It's already too late to edit my post 10:34 enparen: function [ str [string!] /right ][ op: charset "+-*/" el: [some [not op skip]] b: parse str [ collect [ keep el some [ keep op keep el ] ] ] par: "()" if right [reverse b reverse par] par-str: copy par insert next par-str take/part b 3 foreach [op el] b [ par-str: head insert next copy par reduce [par-str op el] ] if right [reverse par-str] par-str ] toomasv 10:34:+1: GalenIvanov 10:34@toomasv Thank you! toomasv 18:51Next step: left-associate + and -, right-associate * and /, and multiplicative ops do have higher precedence, e.g.: a+b+c*d*e*f -> ((a+b)+(c*(d*(e*f)))) a*b*c+d+e+f -> ((((a*(b*c))+d)+e)+f) a+b*c+d*e+f -> (((a+(b*c))+(d*e))+f) greggirwin 19:46@GalenIvanov I tripped over the same thing you did: >> enparen/right "a+" == ")a+(" @toomasv's code hasn't failed on my pathological tests yet. So this brings up the next interesting twist. If the parse fails, because the expression isn't valid, no change should be made. Friday 27th November, 2020 GalenIvanov 07:19@greggirwin I took for granted that there will always be at least two arguments surrounding an operator. That's why 07:19 enparen "a+" -> (a+) enparen/right "a+" -> (a+) 07:23@toomasv The next step is very interesting and most probably beyond my current capabilities. Too bad I'm too busy today to give it a try at work - I hope I'll find some time for it during the weekend. 07:28BTW the other languages I use (and continue to learn) don't have any precedence rules: APL/J/K, Racket, Factor. toomasv 08:18Glad you are interested! Take your time, no hurry. giesse 11:04@toomasv I'm going to re-post this just in case :) https://github.com/giesse/red-topaz-parse/blob/master/examples/expression-parser.red toomasv 11:23@giesse It is nice and clean, thanks! But we are trying here not just to parse expressions but first of all to transform expression-strings. Glimpse into future: string-expressions often contain implicit operations, e.g. -x+3y2 -> (-1 * x) + (3 * (y ** 2)). giesse 18:26the principle is the same greggirwin 19:12Another interesting approach, which I only tinkered with lightly a number of years back, is Vaughan Pratt's Top-Down-Operator-Precedence. GalenIvanov 19:32@toomasv I managed to find a solution for the next step: 19:32 enparen2: function [ str [string!]][ op: charset "+-*/" el: [some [not op skip]] arg: [ word! | number! | paren! ] addt: [ quote '+ | quote '- ] mult: [ quote '* | quote '/ ] b: copy [] parse str [ any [ copy t [ el | op ] (append b load t) ] ] parse reverse b [ some [ p: remove copy t [arg mult arg] (insert/only p to-paren reverse t) | skip ] ] parse reverse b [ some [ p: remove copy t [arg addt arg] (insert/only b to-paren t) | skip ] ] either paren? first b [mold first b] [form b] ] probe enparen2 "a+b+c*d*e*f" probe enparen2 "a*b*c+d+e+f" probe enparen2 "a+b*c+d*e+f" probe enparen2 "a+" 19:32 "((a + b) + (c * (d * (e * f))))" "((((a * (b * c)) + d) + e) + f)" "(((a + (b * c)) + (d * e)) + f)" "a +" 19:37 probe enparen2 "a+12*c+d*e+3.14" "(((a + (12 * c)) + (d * e)) + 3.14)" toomasv 20:32Great! :+1: My head is still dizzy from following your reversals :) Here is mine: enparen: function [str [string!]][ left-op: charset "+-" right-op: charset "*/" op: union left-op right-op el: [some [not op skip]] term: [t: el opt [right-op [end | m: :t insert #"(" :m skip term insert #")"]]] parse str: copy str [s: term any [left-op term insert #")" e: :s insert #"(" :e skip]] str ] enparen "a+b+c*d*e*f" ;== "((a+b)+(c*(d*(e*f))))" enparen "a*b*c+d+e+f" ;== "((((a*(b*c))+d)+e)+f)" enparen "a+b*c+d*e+f" ;== "(((a+(b*c))+(d*e))+f)" enparen "a+12*c+d*e+3.14" ;== "(((a+(12*c))+(d*e))+3.14)" greggirwin 21:11*Very* nice @toomasv. 21:18That is some *dense* code. By that I mean there is a *lot* going on in there. I'll suggest giving the main, anonymous rule a name, like expr, to separate it from the actual parse call. I can see others wanting to play with this. 21:19It's interesting to think about unnamed rules, which have a subtle implication. That is, you know they can't be recursive (by name). Saturday 28th November, 2020 toomasv 05:45Yes, good suggestion! For third step I propose to drop parens from around additive operations, make multiplicative operations left-associative and introduce right-associative exponentiation op ^ with yet higher precedence, e.g.: a*b^2+4*c/d-3 -> (a*(b^2))+((4*c)/d)-3 05:48Maybe with ^ transformed into redish **. 9214 06:09https://github.com/red/red/commit/f5e2c404 math: function [ "Evaluates expression using math precedence rules" datum [block! paren!] "Expression to evaluate" /local operator match ][ order: ['** [* / % //] [+ -]] redex: [skip infix [enter | skip]] infix: [set operator word! (do gauge) if (infix?)] gauge: [right?: lit-word? attempt check] check: [first infix?: find to block! group operator] emend: [parse datum tally] tally: [any [enter [fail] | recur [fail] | count [fail] | skip]] enter: [ahead paren! into tally] recur: [ahead redex if (right?) 2 skip tally] count: [while ahead change only copy match redex (do match)] do also datum: copy/deep datum foreach group order emend ] GalenIvanov 09:12@toomasv My reversals result in very slow code - I did some tests and it turned out that my solution runs at least 30 times slower than your, easily reaching 60x with longer strings. That's why I need to examine your code and start using recursive parse rules. Thank you for your exercises! toomasv 11:50@GalenIvanov I think reversals by itself add relatively little to time, but you are parsing whole thing three times, creating additional blocks in between... 13:24@9214 Thanks, this is illustrious example of block-expression parsing! 14:31My solution to third step (with primitive error handling): context [ op: union union add: charset "+-" mul: charset "*/" pow: charset #"^^" el: [some [not op skip]] expr: [term any [add [term | (probe "Missing term!") fail]]] term: [t1: factor any [mul [ factor insert #")" t2: :t1 insert #"(" :t2 skip | (probe "Missing factor!") fail]]] factor: [f1: el opt [pow [ ahead el f2: :f1 insert #"(" :f2 skip factor insert #")" | (probe "Missing exponent!") fail]]] set 'enparen function [str [string!]][ parse str: copy str expr str ] ] >> enparen %{2*a^3^b*4+c/5*d-e}% == "((2*(a^^(3^^b)))*4)+((c/5)*d)-e" >> enparen %{2*a^3^b*4+c/5*d-}% "Missing term!" == "((2*(a^^(3^^b)))*4)+((c/5)*d)-" >> enparen %{2*a^}% "Missing exponent!" == "(2*a)^^" >> enparen %{2*^b}% "Missing factor!" == "2*^^b" :joy: >> enparen %{What/s+that^?}% == "(What/s)+(that^^?)" Monday 30th November, 2020 toomasv 12:48OK, fast forward! 4th, 5th and 6th steps: 1. Restrict primitive elements to numbers and one-letter variables, and honor preset parens. 2. Keep only outer parens for each term. 3. Allow implicit operations (negation and multiplication for vars and parens, exponentiation for number). E.g.: ab+3c2 -> (a * b) + (3 * (c ** 2)) ab+3cd2^d/(2.5*-(e+f)) -> (a * b) + (3 * c * (d ** (2 ** d)) / ((2.5 * (-1 * (e + f))))) (3a2+1.5b)/c -> ((3 * (a ** 2)) + (1.5 * b)) / c 16:33[My try](https://gist.github.com/toomasv/9738f9ba87bf298c1da1228688b3f655): expression "(3a2+1.5b)/-c" ;== [((3 * (a ** 2)) + (1.5 * b)) / (-1 * c)] expression "ab+3c2" ;== [(a * b) + (3 * (c ** 2))] expression %{ab+3cd2^d/(2.5*-(e+f))}% ;== [(a * b) + (3 * c * (d ** (2 ** d)) / ((2.5 * (-1 * (e + f)))))] expression "3a2-2(b+c)3" ;== [(3 * (a ** 2)) - (2 * ((b + c) ** 3))] expression/eval/with "(3a2+1.5b)/c" [a: 3 b: 2 c: 10] ;== 3.0 expression "(3a2+1.5b)/-c" ;== [((3 * (a ** 2)) + (1.5 * b)) / (-1 * c)] expression %{(3a2+1.5b)^}% ;Expected exponent in the end! expression "3a2+*1.5b" ;Expected term at *1.5b! Tuesday 1st December, 2020 GalenIvanov 11:14@toomasv Great! I'll try to find a solution before examining your vesrion. toomasv 14:47:+1: ldci 17:09Hi everybody. Is there a simple way to create a son file with Red? hiiamboris 17:19save/as %test.json object [a: [1 2]] 'json like this you mean? Oldes 17:30@hiiamboris @ldci you can use just: >> save %test.json object [a: [1 2]] >> read %test.json == {{"a":[1,2]}} >> load %test.json == #( a: [1 2] ) 17:32(as long as you use *.json extension) hiiamboris 17:35Cool! ldci 17:35@Oldes Thanks a lot Wednesday 2nd December, 2020 ldci 19:22@Oldes and @hiiamboris : Story is more complicated. I need to generate a json file compatible with labelMe (https://github.com/wkentaro/labelme). Any idea are welcome. Oldes 19:38What does it mean _json file compatible with labelMe_? Any examples? 19:46It looks that Red does not use extension with urls... this works: url: https://raw.githubusercontent.com/wkentaro/labelme/master/examples/bbox_detection/data_annotated/2011_000003.json obj: load/as read url 'json rebolek 20:04With URLs Red should use MIME type Oldes 20:09Yes.. above can be just: obj: load/as url 'json Thursday 3th December, 2020 GiuseppeChillemi 10:10@ldci > @Oldes and @hiiamboris : Story is more complicated. I need to generate a json file compatible with labelMe (https://github.com/wkentaro/labelme). Any idea are welcome. What a nice tool. I have been thinking in those days about a way to annotate visible things and it is nice! Are you doing research on this field? rebolek 10:14@ldci you want to create JSON file that has same structure as labelMe JSON output? toomasv 18:07@GalenIvanov How is it going? greggirwin 18:59Very cool indeed @ldci. @rebolek we'll sponsor some time (though I know you're slammed) to help @ldci with this. I love this feature in https://www.anthropics.com/landscapepro/photo_editing_software/. pekr 19:20I once used an ultimate keying sw, called Fluidmask. It allowed to split zones into smaller pieces. But it was quite complicated to use. Nowadays tools mix various aproaches - edge detection, color gradients and some AI to identify faces or shapes in general. ldci 19:51@all. Thanks for your help. I'm currently linking redCV to neural networks for semantic classification (see PixelLib: https://pixellib.readthedocs.io/en/latest/ ) . Works fine. The idea is to improve the network using my own dataset. redCV code is able to export coordinates (polygons) of detected contours in image and the sole problem is to export these data in a JSON file compatible to labelMe. pekr 20:06Sounds nice! :-) ldci 20:21@pekr Very exciting ! rebolek 20:50@ldci thanks for explanation. I'll have a quick look at the lableMe file structure, if it's JSON it should be easy to match the structure in Red and export it as JSON. 20:54@ldci so I took a quick look, the easiest thing to do is take one of their examples, load it into Red and try to output same data structure from your code. Like this: >> data: load/as https://raw.githubusercontent.com/wkentaro/labelme/master/examples/semantic_segmentation/data_annotated/2011_000003.json 'json == #( version: "4.0.0" flags: #() shapes: [#( label: "person" points: [[250.8142292490119 106.96696468940974] [229.8142292490119 118.96696468940974] [22... >> probe words-of data [version flags shapes imagePath imageData imageHeight imageWidth] 20:56version is easy, for flags I need to find another example, shapes is a block of maps, which I can easily probe: >> data/shapes/1 == #( label: "person" points: [[250.8142292490119 106.96696468940974] [229.8142292490119 118.96696468940974] [221.8142292490119 134.96696468940974] [223.8142292490119 147.9... >> probe words-of data/shapes/1 [label points group_id shape_type flags] and so on Friday 4th December, 2020 GalenIvanov 07:23@toomasv I haven't started yet - I'm too busy at work/too lazy at home :) rebolek 07:50@ldci if you have any questios, just contact me privately so we don't polute this room ldci 09:49@rebolek OK Saturday 12nd December, 2020 Numeross__twitter 17:36Hello :) I have trouble to modify words in a nested block: from [(x * 3) + y] to [(x/result * 3) + y/result] hiiamboris 17:38Hi (; What exactly is the problem with it? toomasv 18:18@Numeross__twitter Like this? >> resultify [(x * 3) + y / z][x y] == [(x/result * 3) + y/result / z] >> resultify [(x * 3) + y / z][y z] == [(x * 3) + y/result / z/result] >> resultify/by [(x * 3) + y / z][y] 'my-path-to-result == [(x * 3) + y/my-path-to-result / z] >> resultify/by [(x * 3) + y / z][y] 'my/path/to/result == [(x * 3) + y/my/path/to/result / z] Numeross__twitter 18:57That would work, but here's some more context : x: vector [100. 0.] ; vector makes a graph node, here x/result = [100. 0.] y: vector [0. -100.] point1: vector [[( x * 3 ) + (y * 3)] ; * and + are custom, and I'd like to evaluate the result here I made a function that can find what are the parents: get-parents: func [expr[block!]] [unique collect [ parse expr rule: [ any [ word: path! (if object! = type? get word/1/1 [keep word/1/1]) | into rule | skip ] ] ]] This copy word word! keep (if object! = type? get word/1 [to-path [word/1 'result] ]) will give me none on words that don't refer to objects And I don't know how to keep what's not words 19:02For now I'll just put the /result myself hiiamboris 19:27Do you need keep? Use change instead Numeross__twitter 19:32oyoooo 19:34thanks x) toomasv 19:53I played with it so: resultify: function [expr vars /by ref][ ref: any [ref 'result] o: clear [] forall vars [ append o to-lit-word vars/1 if not last? vars [append o '|] ] parse expr rule: [any [ ahead any-block! into rule | ahead o change only set w word! (to-path append to-block w ref) | skip ]] expr ] 20:38There should be if (not empty? o) in beginning of the second alternative in parse :flushed: Numeross__twitter 21:00Oh that's neat ! Sunday 13th December, 2020 toomasv 06:30Simplify append to-block w ref into reduce [w ref]. Friday 18th December, 2020 mikeyaunish 16:00Given: SRC is a string! value: "button1: button {TWO^/LINES} loose" >> to-block src == [button1: button "TWO^/LINES" loose ] >> load produces a similar result. Is there a way to convert the code into a block format without losing the curly brackets surrounding TWO^/LINES ? hiiamboris 16:31Code doesn't have curly brackets. Code has a string! value, which may be molded in this or that form depending on it's length. mikeyaunish 16:47@hiiamboris The issue is I would like to find the actual code that has been typed in, so I need to search/parse for the original unmodified portion of text. hiiamboris 16:50Find - where? 16:51If it's a text file, why would you load the string first? mikeyaunish 16:51From within the original source code - either from a text file or text from a Vid area. 17:00I am loading the source so that I can correctly identify, modify and write back the portion of code that I am interested in. 17:05This is part of the [direct-code](https://github.com/mikeyaunish/direct-code) project that I am working on. hiiamboris 17:26But you're searching for *text* within *text file* right? 17:27If so, I don't understand why you would load code and mold it back. It's not a lossless operation, and quotation marks are only the first and easiest trouble on your way. mikeyaunish 19:45Yes - I am searching for text in the text file. My goal is to reflect changes to the VID object in the source code. Is there an existing code pattern that will help me with that? I think I can work around the quotation mark issue - what other issues can you see me running into? greggirwin 19:54@mikeyaunish once you load it "" and {} are the same. It's only that long strings are molded with curly braces, and they allow you to write multiline strings without the literal chars for CRLF. So if you need to identify strings by curly braces, you'll have to do that without loading. 19:58As to your goal, VID is like a preprocessor. Once you have a face, it's part of a tree of objects and has no back reference to the VID code that may have generated it. Consider that you could add a face to that tree dynamically, which didn't exist in the original VID. Even if you use words to refer to faces, which is easy enough, then you need to understand VID as a dialect so you can find values that are applied to facets the way it does. It's not that this is impossible, just a lot of work and thinking. :^) mikeyaunish 20:12@greggirwin Thanks for the heads up. I think I will continue with this experiment to see where it leads. At this point it seems to show some promise - but who knows how it will work out. hiiamboris 20:15Well if you're only mapping static strings and pairs & tuples, you should be okay. Consider also using [lexer's callback](https://github.com/red/docs/blob/master/en/lexer.adoc#52-transcodetrace) to build a table of offsets and strings (or other data), instead of searching for them. 20:17Otherwise, VID allows arbitrary Red expressions inside it, and there's no chance your code can interpret those. greggirwin 20:26Another trick which may work, if the user can only change one thing at a time, e.g. no group select to drag a number of faces, is to find all the faces that *haven't* changed, and the one you don't find with matching facets is the one they *did* change. 20:27Unless you're @hiiamboris and have a thousand faces in a dynamically generated layout, you should be fine performance wise. ;^) 20:28Keep us posted @mikeyaunish, as this type of feature is important in IDEs related to GUI design. hiiamboris 20:29A man with a thousand faces :D greggirwin 20:29We're happy to learn from both success and...less success. :^) Saturday 19th December, 2020 mikeyaunish 00:58Thanks for you help @greggirwin and @hiiamboris with this. I am hoping to release something workable soon. Thursday 31st December, 2020 mikeyaunish 02:19Can't quite figure out what is happening here >> parse {"" hi} [ some [ [ {""} | "" ] " " "hi" ]] == true >> parse {"" hi} [ some [ [ "" | {""} ] " " "hi" ]] == false parse-trace shows that the second parse matches the double quotes but doesn't advance the input. I thought it would advance the input once a match occurs. What is it that I am missing? greggirwin 02:26In the second example "" rule matches an empty input, so {""} that matches two quotes is never used. Then it looks for " ", but you're still at the first quote in your input, because matching an empty input doesn't advance. >> parse {""} [some "" {""}] == true mikeyaunish 02:56Thanks @greggirwin - too many strings on the brain. Didn't recognize double quotes as 'empty input'. greggirwin 06:29Happens to all of us. Or at least me. :^)````**
