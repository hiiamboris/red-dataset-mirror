# Archived messages from: [gitter.im/red/red/welcome](/gitter.im/red/red/welcome/) from year: 2022

## Wednesday 5th January, 2022

ams02468

[02:53](#msg61d508105ee4df335acb40df)Hi everyone, I had a question, how can make the program delete itself after running?

gltewalt:matrix.org

[02:58](#msg61d50971d143b14f83ff37ff)Delete the files, or delete source in the console?

[03:09](#msg61d50be4e1a1264f0a3e15de)What do you mean by "delete itself"?

ams02468

[03:11](#msg61d50c7246529077f56b75b5)delete the file

[06:32](#msg61d53b985dc6213cd4c7321a)i used this method but it doesn't work ( after compile )

```
a: system/options/path
b: system/options/boot
del: func [a][call/console rejoin [{del "}a{" /s /q}]]
DATA: rejoin [ a b]

 delete to-red-file DATA
 del to-local-file DATA
```

gltewalt:matrix.org

[06:58](#msg61d5419ed143b14f83ff979c)How about `call/shell` ?

toomasv

[07:32](#msg61d5497d526fb77b31636fef)@ams02468 Why DATA? Doesn't your `b` contain full path already?

duskhorn:matrix.org

[07:41](#msg61d54bc0e1a1264f0a3e8d6c)Hello everyone. If I embed Red using libRed in my project, how does the runtime treat red files? Are they interpreted or do they get compiled at first use, or something else?

ams02468

[07:52](#msg61d54e29526fb77b3163782d)i used it before `call/shell` but not work

Oldes

[07:52](#msg61d54e38f5a3947800ecba97)Interpreted.

[08:00](#msg61d5501b9b470f38974efb07)@ams02468 you cannot delete a running app. So you must start a process, which will delete it after it quits.

[08:08](#msg61d5520546529077f56bf12c)You may try something like this https://stackoverflow.com/a/19748576

[08:10](#msg61d5527b46529077f56bf1da)@ams02468 are you writing a malware or why you need it?

ams02468

[08:16](#msg61d553e69b470f38974f03d0)@Oldes No, I'm not writing malware. I'm creating an installation file that does the entire installation by click

[08:17](#msg61d5542fd143b14f83ffbcde)And then deleted

Oldes

[08:17](#msg61d5543246529077f56bf52e)Installers usually don't delete itself ;-)

ams02468

[08:22](#msg61d555562a210c38c1b1f55f)@Oldes If I want to write a virus or malware, there are much better languages, but in general, I am creating an installation file my own way.

Oldes

[08:27](#msg61d5567c5ee4df335acbccbf)@ams02468 this works:

```
call/shell rejoin [{/C choice /C Y /N /D Y /T 3 & Del "} system/options/boot {"}] quit
```

ams02468

[08:43](#msg61d55a1c742c3d4b21804b19)@Oldes thanks If you are curious what this installation file is for, I have to say makeing a installation file. for the old game ;)

Oldes

[08:51](#msg61d55c0b82a4667b255df2e8)The first `/C` should be removed btw.

[15:08](#msg61d5b4669b470f38974fc33a)Is there alternate terminal for fvwm?

## Monday 10th January, 2022

chunes3

[03:29](#msg61dba82ebfe2f54b2e0de88e)Hey all, quick question: what is the easiest way to get from `["a" "b" "c"]` to `"a,b,c"`?

ldci

[03:37](#msg61dba9f45dc6213cd4d397c0)a suggestion  
`blk: ["a" "b" "c"] str: "" foreach v blk [append str rejoin [v ","]] == "a,b,c, »`

chunes3

[03:38](#msg61dbaa4d5ee4df335ad82275)Thanks, was mainly wondering if there was some kind of `join` word I was missing or something.

[03:39](#msg61dbaa569b470f38975b3a2c)Also, do you not have to `copy` `""`?

ldci

[03:43](#msg61dbab54f5a3947800f8f2fc)Better  
`n: length? blk str: "" repeat i n - 1 [append str rejoin [blk/:i ","]] append str blk/:n`

[03:43](#msg61dbab71f5a3947800f8f327)`== "a,b,c »`

[03:45](#msg61dbabd15ee4df335ad824e8)@chunes3 copy must be. used for creatinga new string :)

gltewalt:matrix.org

[03:47](#msg61dbac4dbfe2f54b2e0def8b)Or something like: replace/all form \["a" "b" "c"] space ","

ldci

[03:48](#msg61dbaca482a4667b256a16d4)@gltewalt:matrix.org Better solution :)

chunes3

[04:08](#msg61dbb146d41a5853f94176fa)Thanks, that's slick

gltewalt:matrix.org

[04:25](#msg61dbb5206d9ba23328b3655f)Thanks @ldci

[04:25](#msg61dbb54f9b470f38975b4e61)Or `space ", "` if need the command and a space

[04:26](#msg61dbb5835dc6213cd4d3abba)Comma and space before element

ldci

[04:26](#msg61dbb588526fb77b316fc7af)@gltewalt:matrix.org With Red we always find various and better solutions:)

Oldes

[09:00](#msg61dbf5b0e1a1264f0a4b55b7)What if you once get `blk: ["a a" "b b"]`?

gltewalt:matrix.org

[12:55](#msg61dc2caa82a4667b256b202f)rejoin it first

toomasv

[14:20](#msg61dc40bed143b14f830d2d75).. use \[concat](https://gist.github.com/toomasv/fd651f24e18d7bc85d05204cc5f828d2)?

gltewalt

[17:10](#msg61dc688f2a210c38c1bfd146)

```
>> blk: ["aa" "bb"]
== ["aa" "bb"]
>> replace/all unique form blk " " ", "
== "a, b"
```

[17:10](#msg61dc68a26d9ba23328b4efc5)But... unique does weird things with more elements

[17:18](#msg61dc6a77f5a3947800fa8ca8)

```
>> b2: ["aa" "bb" "cc" "dd"]
== ["aa" "bb" "cc" "dd"]
>> blk: replace/all unique form b2 space ", "
== "a, bcd"
```

toomasv

[17:38](#msg61dc6f045ee4df335ad9d2fc)Of course, it leaves only one space after `unique`.

[17:49](#msg61dc71ae742c3d4b218e32a1)

```
join: func [series sep][forall series [if not last? series [insert series: next series sep]] series]
join [a b] '|
;== [a | b]
join [[a b] [c d]] '|
;== [[a b] | [c d]]
join "abcd" ","
;== "a,b,c,d"
rejoin join ["aa" "bb" "cc" "dd"] ", "
;== "aa, bb, cc, dd"
rejoin join ["a a" "b b"] " - "
;== "a a - b b"
```

gltewalt:matrix.org

[17:52](#msg61dc7269d41a5853f9431860)Technically doing what it's supposed to do

toomasv

[17:55](#msg61dc732d2a210c38c1bfebf1)But :(

```
rejoin join [<a> <b>] <c>
== <a<c><b>>
```

gltewalt:matrix.org

[17:56](#msg61dc734a2a210c38c1bfec72)With a unique/deep it would be easy

[17:57](#msg61dc736f7842bd3ca93c369d)Each series within the series would get uniqued

toomasv

[18:30](#msg61dc7b51bfe2f54b2e0fa377)Something like this?

```
uniq: function [series [string!] /except sep][
    either except [
        splitted: split series sep 
        forall splitted [splitted/1: unique splitted/1] 
        rejoin join splitted sep
    ][unique series]
]
uniq/except "aba bab cdc dd" " "
;== "ab ba cd d"
uniq "aba bab cdc dd"
;== "ab cd"
```

gltewalt

[20:19](#msg61dc94be526fb77b3171bb44)

```
>> unique-each: func [s][forall s [s/1: unique s/1 head s]]
== func [s][forall s [s/1: unique s/1 head s]]

>> blk: ["aa" "bb" "cc" "d"]
== ["aa" "bb" "cc" "d"]
>> unique-each blk
== ["a" "b" "c" "d"]
```

toomasv

[20:46](#msg61dc9b10d41a5853f9437d88):+1:

## Wednesday 12nd January, 2022

henrikmk

[12:08](#msg61dec4bf6d9ba23328ba31ba)With functions like that, I would wish for effective means of passing all refinements from UNIQUE-EACH to UNIQUE, simply by reading the list of refinements for UNIQUE and have them integrated into UNIQUE-EACH.

hiiamboris

[12:22](#msg61dec8219a335454061bb7b9)like \[this](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/raw/master/new-apply.red) ?

henrikmk

[12:40](#msg61decc2f7842bd3ca941558e)No, lifting all refinements from one function to a wrapper function. APPLY doesn't help with that. Maybe it's just about using SPEC-OF UNIQUE, when building the outer function header.

hiiamboris

[12:59](#msg61ded0ced41a5853f948419b)yeah, though actually it's more like `head clear find spec-of :unique /local`

[13:00](#msg61ded0e482a4667b257101fa)because `function` is stupid enough to put two `/local`s into spec :)

[13:01](#msg61ded13b46529077f57f43fd)probably no need for `unique` but for interpreted functions I've used this pattern some times

## Tuesday 18th January, 2022

henrikmk

[12:44](#msg61e6b6192a210c38c1d4d20a)Should it really matter if there are two

```
/local
```

s ? Would there not be a formal way to read locals in a spec?

greggirwin

[19:39](#msg61e7178682a4667b2581d652)We need to formally define the function spec, so all tools and constructors know what rules to play by.

## Thursday 20th January, 2022

laturk

[23:32](#msg61e9f1045ee4df335af58aa1)Can I get help converting a short rebol program (23 lines of code) to red?

Oldes

[23:38](#msg61e9f27a7842bd3ca957d3f0)Sure. (but not from me now, as it is too late in my timezone)

laturk

[23:39](#msg61e9f2b75dc6213cd4f10667)Do I need to post the code here or in a paste bin?

gltewalt:matrix.org

[23:43](#msg61e9f3ae2a210c38c1db87f1)Paste bin would probably be better

laturk

[23:49](#msg61e9f51682a4667b2587afdb)Thanks Oldes and gltewalt, here's my program: https://controlc.com/96919138

gltewalt:matrix.org

[23:52](#msg61e9f5ac7842bd3ca957da5c)Did you try it as is, in Red?

laturk

[23:53](#msg61e9f60d6d9ba23328d0de49)\[master¹²//firman]% sudo red find-replace.r (l@lat:~/firman/)  
\[sudo] password for l:  
PROGRAM ERROR: Invalid encapsulated data.  
\[master¹²//firman]% (l@lat:~/firman/)

[23:57](#msg61e9f6d9bfe2f54b2e2b40a3)Perhaps red for linux doesn't have view yet?

[23:58](#msg61e9f73c5ee4df335af596f3)Well, view isn't needed for that script.

gltewalt:matrix.org

[23:59](#msg61e9f764526fb77b318d066e)It has it.  
Have to ask,  
Did you change the program header to Red \[ ] instead of rebol?

## Friday 21st January, 2022

laturk

[00:00](#msg61e9f780bfe2f54b2e2b41b1)Yes, I did.

[00:00](#msg61e9f7b99a335454063263c2)But that is the only change I made.

gltewalt:matrix.org

[00:01](#msg61e9f7d45dc6213cd4f10fdb)Can you run the red console? Or does it error on that also?

laturk

[00:03](#msg61e9f864bfe2f54b2e2b436a)\[Downloads]% ./red (l@lat:~/Downloads)  
\--== Red 0.6.4 ==--  
Type HELP for starting information.

&gt;&gt;

[00:04](#msg61e9f871d41a5853f95eeaf9)Yes.

[00:07](#msg61e9f92f5dc6213cd4f1127e)Does the script run for you? Or do you get the same error?

greggirwin

[00:08](#msg61e9f9935ee4df335af59cb3)@laturk see if you can `do` it from a Red console. `Ask` is part of the console, not the core.

gltewalt

[00:11](#msg61e9fa4dbfe2f54b2e2b467a)https://gist.github.com/gltewalt/629dcaf357ec6ffae3f134f423d4e4ec

laturk

[00:11](#msg61e9fa4e742c3d4b21a9e24b)Gregg Irwin, that works.

gltewalt

[00:12](#msg61e9fa5c742c3d4b21a9e256)Need some 32 bit libs in linux

laturk

[00:15](#msg61e9fb28d41a5853f95ef0df)\[master¹²//firman]% locate libXaw7.so.7 (l@lat:~/firman/)  
/home/l/r/cp/libXaw7.so.7  
/home/l/r/cp/libXaw7.so.7.0.0  
/usr/lib/libXaw7.so.7  
/usr/lib/libXaw7.so.7.0.0  
\[master¹²//firman]% (l@lat:~/firman/)

[00:16](#msg61e9fb439b470f389778c017)Are the libs not in the right place?

[00:18](#msg61e9fbf17842bd3ca957e5bb)I'm using archlinux, and that's where pacman placed them. And then you can see I copied them to /home/l/cp which is where rebview is located.

gltewalt

[00:26](#msg61e9fdce5ee4df335af5a643)After getting Red to run:  
Change the program header to `Red []`  
Add `rejoin` before the `ask` blocks:  
`go: ask rejoin ["Replace " :find-str " with " :replace-str "? (y/n): "]`  
`choice: ask rejoin [newline "Done: press to continue, or to quit. "]`

Should work after that.

laturk

[00:28](#msg61e9fe1f9b470f389778c6ca)Great. Thank you, Greg.

gltewalt

[00:29](#msg61e9fe609a3354540632702f)Oh, and change `find-str` and `replace-str` to get-words, as above ^.

[00:29](#msg61e9fe6ff5a3947800166f8a)https://gist.github.com/gltewalt/26a6585644c98ef2d45e8cb6928be24c

[00:29](#msg61e9fe80e1a1264f0a684149)The "whys" I leave to you to learn about.

laturk

[00:30](#msg61e9feb35ee4df335af5a877)OK. Thanks to all of you for your time. Much appreciated.

gltewalt

[00:44](#msg61ea01ed7842bd3ca957eea3)Also, there were old issues concerning running red from relative paths.

[00:44](#msg61ea01f746529077f595e0b5)try an absolute path

[00:45](#msg61ea02209a33545406327851)https://github.com/red/red/search?q=Invalid+encapsulated+data&amp;type=issues

gltewalt:matrix.org

[01:06](#msg61ea07037842bd3ca957f7c2)And somehow I missed Gregg Irwins response, and just kept babbling on

philipperbd

[10:42](#msg61ea8dfe6d9ba23328d205c5)Hi everyone, I have an issue trying to install Red on Ubuntu 20.04.3 (Ryzen 7). I downloaded the "Automated builds, master branch" for GNU/Linux and followed the instructiions for "Ubuntu 18.04+ version". When I try to run "./red-\[my-version] it outputs: "error while loading shared libraries: libgdk\_pixbuf-2.0.so.0: cannot open shared object file: No such file or directory". If you have any advice on solving this issue it would be really nice! Thanks

hiiamboris

[11:44](#msg61ea9ca75dc6213cd4f24f6b)hi @philipperbd

[11:44](#msg61ea9cb3d41a5853f9602469)did this command fail for you?

```
apt-get install libc6:i386 libcurl4:i386 libgtk-3-0:i386 libgdk-pixbuf2.0-0:i386
```

planetsizecpu

[12:03](#msg61eaa102526fb77b318e47b0)Welcome btw @philipperbd

philipperbd

[13:37](#msg61eab706f5a394780017d603)@hiiamboris Thank you very much it worked perfectly!

hiiamboris

[13:40](#msg61eab7b89b470f38977a304e)I just copied it from the download page :)

[13:40](#msg61eab7bd9b470f38977a3053)You're welcome

philipperbd

[13:57](#msg61eabbba9a3354540633dd20)\[!\[image.png](https://files.gitter.im/570387cd187bb6f0eaddec47/vnE5/thumb/image.png)](https://files.gitter.im/570387cd187bb6f0eaddec47/vnE5/image.png)

[13:57](#msg61eabbe66d9ba23328d260e1)I tried what is said in the download page but did not worked for me. But thanks! :)

Oldes

[14:06](#msg61eabdcd9a3354540633e2f4)I think that having only 32bit Red version is a top issue and should be solved asap. Unfortunately that is a huge task.

hiiamboris

[15:01](#msg61eacab4742c3d4b21ab8c12)@philipperbd I don't get it how come your screenshot doesn't show the full command. This is what I'm seeing:  
!\[](https://i.gyazo.com/9a6b8415772e31f119daa61c32e198c0.png)

greggirwin

[23:01](#msg61eb3b5a2a210c38c1de079a)@Oldes it is important to us too, but what makes it a top issue in your mind? That is, in the grand scheme of things, are other things more important? This is our constant struggle. What mix of features and projects give us the best of survival?

Oldes

[23:24](#msg61eb40bf82a4667b258a3776)32bit system are dying fast... maybe too fast. One may ask, why use tiny Red app, which fits on one floppy disk, when it depends on installing so many libraries. `apt-get-update` downloads 16MB, and the rest needs 332MB (in clean 64bit Docker image) :/

[23:26](#msg61eb4122742c3d4b21ac839b)But I don't want to play this \_devil advocate_ role.

laturk

[23:38](#msg61eb43e49b470f38977b5aa4)\[master¹²//firman]% red -c find-replace.red (l@lat:~/firman/)

-=== Red Compiler 0.6.4 ===-

Compiling /home/l/firman/find-replace.red ...  
...using libRedRT built on 21-Jan-2022/14:08:06  
\*\** Compilation Error: undefined word ask  
\*\** in file: /home/l/firman/find-replace.red  
\*\** near: [ask rejoin "Find string: "  
replace-str: ask rejoin "Replace string: "  
go:  
]  
Why the above error message?

greggirwin

[23:39](#msg61eb4444bfe2f54b2e2de3a7)I think someone already pointed to this @laturk , but just in case: https://github.com/red/red/wiki/%5BNOTES%5D-Compiling-with-console-functions---input,-ask

## Saturday 22nd January, 2022

gltewalt:matrix.org

[01:10](#msg61eb59697842bd3ca95aa158)I dont think we did, because I didn't know he was compiling

TUA\_Platy\_twitter

[01:10](#msg61eb5976d41a5853f961a414)Hi - is there any support for config files (TOML/INI/XAML ..) or do I need to make my own?

gltewalt

[01:19](#msg61eb5ba746529077f5988633)json

TUA\_Platy\_twitter

[01:39](#msg61eb60595dc6213cd4f3daf6)thanks

[02:02](#msg61eb65a09b470f38977b9751)

links: [  
https://www.acme.com/a.html  
https://www.acme.com/a.png  
https://www.acme.com/c  
https://www.acme.com/b.jpg  
https://toplist.sk/dot.asp?id=1044625  
]

exclude: [  
".jpg" ".png" ".gif"  
]

1\. remove all URLs from the links block that are external to the site domain, i.e. the toplist.sk URL  
2\. remove all URLs from the links block that reference an exclude criterion  
3\. Thus, when done, the block should only contain 2 URLs

I suppose I'd be using parse here? All the examples/tutorial I have seen so far, operate on blocks of strings (or on strings with whitespace).  
Can someone give this newbie some pointers?

Thanks in advance!&gt;

gltewalt:matrix.org

[02:06](#msg61eb66bf9b470f38977b990e)url is a datatype

[02:07](#msg61eb66e05dc6213cd4f3e6c2)Block of url!

gltewalt

[02:44](#msg61eb6f81d41a5853f961c8f5)Several ways to solve that. You can play with parse if you want, but you can solve it with no parse.

laturk

[03:06](#msg61eb74bc2a210c38c1de72cb)Thanks Greg Irwin and gltwalt. It compiles now.

gltewalt

[03:22](#msg61eb78685ee4df335af894a9)

```
remove-each l links [any [find l '.sk find l '.jpg find l '.png find l '.gif]]
```

[03:29](#msg61eb7a1e6d9ba23328d3d480)Some things to looks at.  
Type in the console:  
`help remove-each`, `help find`, `help url`, `help any`, `help series!`, `help "series"`

[03:31](#msg61eb7a8082a4667b258a9ee7)And

https://www.red-lang.org/2013/11/041-introducing-parse.html

Or

https://github.com/red/docs/blob/master/en/parse.adoc

ne1uno

[03:31](#msg61eb7a95d143b14f832c69cd)`split-path`

gltewalt

[03:32](#msg61eb7ab27842bd3ca95ad7cf)`suffix?`

[03:32](#msg61eb7ad35dc6213cd4f40963)`decode-url`

ne1uno

[03:32](#msg61eb7ad5bfe2f54b2e2e42e3)tld acme

[03:33](#msg61eb7b0c46529077f598be0f)+suffix?

gltewalt

[03:36](#msg61eb7bba2a210c38c1de8017)another (maybe strange) way:

```
remove-each l links [
    u: decode-url l any [
        "toplist.sk" = u/host
        ".jpg" = suffix? u/target 
        ".png" = suffix? u/target
        ".gif" = suffix? u/target
    ]
]
```

gltewalt:matrix.org

[03:41](#msg61eb7cf7742c3d4b21acec92)If you want to try with parse, there's a red/parse room

[03:43](#msg61eb7d5a5dc6213cd4f40d25)I'm no good at parse

gltewalt

[03:54](#msg61eb7fddf5a3947800195b99)Or "acme.com" &lt;&gt; u/host

ne1uno

[03:54](#msg61eb800e2a210c38c1de88c7)that's the one

[04:00](#msg61eb8172bfe2f54b2e2e4d2b)not quite, don't exclude no suffix  https://www.acme.com/c

[04:05](#msg61eb8281bfe2f54b2e2e4eea)`none? u/target`

[04:12](#msg61eb843a9b470f38977bc9fc)maybe add `all [u/host <> "www.acme.com" none? <> u/target]` at this point, I would setup some tests to cover the exclusions

gltewalt:matrix.org

[04:52](#msg61eb8da69b470f38977bd7d6)Yeah, flipping the logic

TUA\_Platy\_twitter

[05:06](#msg61eb90bdbfe2f54b2e2e67b4)thanks all - that'll get me going again - much appreciated!

greggirwin

[18:43](#msg61ec503d742c3d4b21ae6499)@TUA\_Platy\_twitter there are some R2 INI parsers \[here](http://www.rebol.org/search.r?find=ini&amp;form=yes), which could be ported. I just changed a couple lines in my old R2 version and it seems to work in Red. If you'd do some more testing (or anyone else, for that matter), we could add it to red/code or red/community. Improvements welcome, too, of course.

[18:43](#msg61ec50482a210c38c1dff83c)\[ini-file.red](https://files.gitter.im/570387cd187bb6f0eaddec47/AA8Q/ini-file.red)

[18:43](#msg61ec504e46529077f59a392f)\[test-ini-file.red](https://files.gitter.im/570387cd187bb6f0eaddec47/NgVD/test-ini-file.red)

[18:44](#msg61ec50a19a3354540636e192)For XAML, our XML codec is very close to ready. Might make it by the end of this month.

[18:46](#msg61ec50ffd41a5853f9635f2c)I don't know if it's worth making INI a codec, but it would be easy enough. Everyone please share your thoughts on that. Then you'd have `load/as 'ini` and `save/as 'ini` available directly. It is a widely used format.

[18:56](#msg61ec53726d9ba23328d55543)For TOML, we include a grammar for it with \[DiaGrammar](https://www.redlake-tech.com/products/diagrammar-for-windows/) (which you can use for free). You can see by the large number of test files that it works quite well. That said, it's just the parser. There are no data collection aspects included to build an output structure. That would be a great project IMO, and whoever wants to do it will get plenty of help. We also have other codecs to model it on.

[19:01](#msg61ec5493526fb77b319183b3)You can see that %toml.rule (in DiaGrammar) was ported directly from \[TOML's ABNF spec](https://github.com/toml-lang/toml/blob/master/toml.abnf). No attempt was made to make it more idiomatically Red in any way.

[19:03](#msg61ec54f282a4667b258c199a)Here's the rendered diagram for it, for anyone who's curious.

[19:03](#msg61ec54fb6d9ba23328d5587e)\[!\[toml.png](https://files.gitter.im/570387cd187bb6f0eaddec47/JHvB/thumb/toml.png)](https://files.gitter.im/570387cd187bb6f0eaddec47/JHvB/toml.png)

[19:16](#msg61ec580ee1a1264f0a6cbe80)@TUA\_Platy\_twitter on your coding problem:

```
data: [
	site: https://www.acme.com

	exclude: [
		%.jpg %.png %.gif
	]

	links: [
		https://www.acme.com/a.html
		https://www.acme.com/a.png
		https://www.acme.com/c
		https://www.acme.com/b.jpg
		https://toplist.sk/dot.asp?id=1044625
	]

]

remove-links: func [test][
	remove-each link data/links test
]

; 1) Remove all URLs from the links block that are external to 
;    the site domain, i.e. the toplist.sk URL

;remove-each link data/links [not find/match link data/site]
remove-links [not find/match link data/site]

; 2) Remove all URLs from the links block that reference an 
;    exclude criterion

;remove-each link data/links [find data/exclude suffix? link]
remove-links [find data/exclude suffix? link]

print mold data
```

[19:18](#msg61ec586ed41a5853f9636c83)Note the change to use `file!` values for the exclusions, so it works directly with `suffix?`. Other ways around it, but this makes the data do the talking.

[19:31](#msg61ec5b9f9b470f38977d4a0e)So that boils down to

```
remove-links: func [test][remove-each link data/links test]
remove-links [not find/match link data/site]
remove-links [find data/exclude suffix? link]
```

Which you can add more names to for the tests

```
remove-links: func [test][remove-each link data/links test]

not-this-site: [not find/match link data/site]
excluded: [find data/exclude suffix? link]

remove-links not-this-site
remove-links excluded
```

And if there are more than a few tests, you might want to do it this way

```
remove-links: func [test][remove-each link data/links test]

not-this-site: [not find/match link data/site]
excluded: [find data/exclude suffix? link]
reasons: reduce [not-this-site excluded]

foreach reason reasons [remove-links reason]
```

And maybe it helps to make sure all your tests are being processed

```
remove-links: func [test][remove-each link data/links test]

not-this-site: [not find/match link data/site]
excluded: [find data/exclude suffix? link]
reasons: [not-this-site excluded]

foreach reason reasons [
	print ["Removing links that are" reason]
	remove-links get reason
]
```

You'll see some subtle differences in these versions (e.g. the use of `reduce` vs `get`) which you and others may find useful as you play.

Happy Reducing!

hiiamboris

[19:35](#msg61ec5c996d9ba23328d5657f)&gt; INI

Is there a formal definition of it though, or like CSV?

greggirwin

[19:36](#msg61ec5cba742c3d4b21ae7c8b)Like CSV.

hiiamboris

[19:37](#msg61ec5ce146529077f59a5126)I think git and probably a lot of other linux-originating tools use if not the same then at least suspiciously similar format, i.e. `[section]^/name = value`

[19:37](#msg61ec5ced9a3354540636f99d)Also `.reg` files.

[19:37](#msg61ec5d132a210c38c1e01035)It certainly will help those working with configs and registry to be able to load them as Red data.

greggirwin

[19:38](#msg61ec5d44526fb77b3191945a)Yes, that's noted in https://en.wikipedia.org/wiki/INI\_file

[19:39](#msg61ec5d709a3354540636fa77)Maybe worth being a codec then, if the most common variants don't bloat it too much.

[19:41](#msg61ec5dd7e1a1264f0a6cc937)Mine parses at least a simple git config file successfully.

[19:43](#msg61ec5e67d41a5853f9637635)%.reg files are different. Not compatible.

hiiamboris

[19:45](#msg61ec5ec9742c3d4b21ae8186)Because of what?

[19:45](#msg61ec5ee5d143b14f832df19b)Double quotes?

[19:46](#msg61ec5f037842bd3ca95c6f5d)Header?

greggirwin

[19:47](#msg61ec5f4246529077f59a54fe)- Initial value outside sections (could be allowed of course)

\- Quoted keys

\- Line continuations

At a glance anyway. Hardly showstoppers. Just doesn't work in mine right now. :^)

hiiamboris

[19:47](#msg61ec5f505ee4df335afa35b3)I see ;)

greggirwin

[19:48](#msg61ec5f98d143b14f832df2ad)I spent 0:0:30 porting mine, so you get what you pay for. :^)

hiiamboris

[19:48](#msg61ec5fa2d41a5853f9637854)lol

greggirwin

[19:49](#msg61ec5fbed143b14f832df33a)Really, changed REBOL to Red and removed `/all` from `parse`.

hiiamboris

[19:49](#msg61ec5fd07842bd3ca95c7098)so I thought

[19:58](#msg61ec61f2bfe2f54b2e2fe774)this codec then will have to adapt it's input/output rules from the extension (or /as argument)

greggirwin

[20:11](#msg61ec64e29b470f38977d5cbe)Right. An underlying parser could share most rules, with the codec registered for each one separately by extension.

[22:21](#msg61ec8380f5a39478001b2dc1)On TOML, I vote that it \*not* be included as a standard codec. It's not common enough. Once we have a working version, though, what we \*should* do is note it in \[the wiki](https://github.com/red/red/wiki/%5BHOWTO%5D-SYSTEM-CODECS,-LOAD-AS-and-SAVE-AS).

hiiamboris

[22:38](#msg61ec87639b470f38977d970b)can't it be just a variant of ini?

## Sunday 23th January, 2022

greggirwin

[19:30](#msg61edacdcf5a39478001d383b)TOML is much more complex, and has a hard spec.

[19:49](#msg61edb167bfe2f54b2e322c5c)The main thing, though, is that I just don't think the value is there. Not enough to be standard.

hiiamboris

[19:56](#msg61edb2d4d41a5853f965d871)maybe... idk how widespread .toml files are, never seen one myself

gltewalt:matrix.org

[20:03](#msg61edb4889b470f38977f9a0b)Hugo has it as an option,, along with yaml and json.

[20:03](#msg61edb4ae46529077f59ca579)https://gohugo.io/hugo-modules/configuration/

greggirwin

[20:58](#msg61edc170d143b14f83306755)Compare its use to JSON, CSV, XML, and INI. It's not even on the radar. I'm all for having one people can plug in, because some dev tools use it. But even YAML is far ahead of it, and I don't think YAML should be standard in Red either. Easy to plug in, yes; standard, no.

## Monday 24th January, 2022

rebolek

[09:03](#msg61ee6b63d41a5853f96722ad)YAM specs are really complicated. (amlost-)JSON is part of the specs too.

greggirwin

[19:46](#msg61ef020e9a335454063bc715)YAML is a beast. When I've had to deal with it as a user, I quite often mess things up due to case or tabs. Did we learn nothing from `make`?

## Tuesday 25th January, 2022

greggirwin

[00:46](#msg61ef4871f5a3947800205456)\[parse-YAML.r](https://files.gitter.im/570387cd187bb6f0eaddec47/lbP3/parse-YAML.r)

[00:46](#msg61ef487de1a1264f0a72212e)Should anyone feel masochistic.

## Wednesday 26th January, 2022

ams02468

[07:27](#msg61f0f7ec5ee4df335a02ca9e)Hello, does anyone have a link to simple red/system examples?

greggirwin

[07:28](#msg61f0f83ad41a5853f96c4982)Have you checked out the red/code and red/community repos?

## Friday 28th January, 2022

gltewalt

[21:40](#msg61f462e45dc6213cd405637f)Francois made a pdf.  
https://github.com/ldci/Red-System/tree/main/doc

Respectech

[21:43](#msg61f4638946529077f5a9f8c8)Nice!

## Saturday 29th January, 2022

ams02468

[01:22](#msg61f496d16d9ba23328e54a75)First of all, thanks for the pdf file, it was very good

Now I have a question, how can I display this binary in the same way in a string?  
for examp convert this #{616D73} to this "616D73"

gltewalt:matrix.org

[01:25](#msg61f49775d41a5853f9738e05)form

[01:27](#msg61f4981cd41a5853f9738fb5)Or to-string

gltewalt

[01:37](#msg61f49a6ef5a39478002b16df)Well, that wont quite do it

ne1uno

[01:38](#msg61f49aab5dc6213cd405ccc4)`enbase/base #{616D73} 16`

[01:41](#msg61f49b4846529077f5aa613d)same way, form works

gltewalt

[01:42](#msg61f49b81526fb77b31a1aba2)No he wants "616D73"

[01:51](#msg61f49da2d41a5853f9739897)

```
stringify-binary: function [b [binary!]][
    trim/with form b "#{}"
]
```

[01:52](#msg61f49dd0d41a5853f9739904)`trim/with form #{616D73} "#{}"`

ams02468

[02:03](#msg61f4a06182a4667b259c30dc)thanks @gltewalt &amp; @ne1uno @gltewalt

pekr

[03:01](#msg61f4ae24f5a39478002b39c5)`third split form #{616D73} charset "#{}"`

[03:37](#msg61f4b6876d9ba23328e581fd)

```
parse form bin [2 skip copy result to #"}" to end]
parse form bin [collect [2 skip keep to #"}" to end]]
remove-each char result: form bin [find [#"#" #"{" #"}"] char]
```

[03:44](#msg61f4b81b2a210c38c1f050e2)`copy/part at s: form bin 3 (length? s) - 3`

ne1uno

[03:54](#msg61f4ba826d9ba23328e58966)`to-string to-hex to-integer #{616D73}`

pekr

[03:56](#msg61f4bafe5dc6213cd406002e)it is padded with leading zeroes though, but nice aproach :-)

ne1uno

[04:15](#msg61f4bf56bfe2f54b2e401f6c)`to string! {616D73}` woops

[04:17](#msg61f4bfc7f5a39478002b55e8)forgot #, false alarm. not sure what to-string is doing either

gltewalt

[04:27](#msg61f4c214742c3d4b21becf57)`enbase/base to-string #{616D73} 16`

[04:28](#msg61f4c2862a210c38c1f061a0)trim/with is probably the best to be had

ne1uno

[04:35](#msg61f4c41fd143b14f833e60c4)enbase is very picky about what it thinks is valid input

[08:21](#msg61f4f921742c3d4b21bf2ecc)`to-string take/part at form #{616D73} 3 6`

[08:22](#msg61f4f9545ee4df335a0ab5b6)`take/part at form #{616D73} 3 6`

pekr

[08:30](#msg61f4fb339b470f38978df732)Yes, but 6 is hardcoded there, no? You can have variable length binary. To which I provided solution above, using a `lenght?`function.

ne1uno

[08:46](#msg61f4fed7526fb77b31a258e2)I conveniently forgot your copy/part above... profiling now, pretty close

Oldes

[08:59](#msg61f502027842bd3ca96d37bc)This issue is so often coming back, that Red should do something with it... https://github.com/red/red/issues/3133 https://github.com/red/REP/issues/62

[09:00](#msg61f5022a9b470f38978e0184)In Rebol I already have:

```
>> mold #{3132}
== "#{3132}"

>> form #{3132}
== "3132"

>> to string! #{3132}
== "12"
```

[09:05](#msg61f5035ef5a39478002bc599)It is sad, that there was even implementation done, but banned by Nenad :/ https://github.com/red/red/pull/4148

pekr

[09:21](#msg61f507176d9ba23328e611c8)Yes, I miss an easy way too. Dunno, why I needed that string from in the past, but it kind of made me crazy, had to create a wrapper function for that. That deserves an easy solution. I even imagined the name `as-string`, which would just do that.

ne1uno

[10:02](#msg61f5109d5dc6213cd40693e1)rough profile, just for reference. won't matter unless in a tight loop, or something.

[10:02](#msg61f5109d742c3d4b21bf5a07)https://gist.github.com/ne1uno/b73a2d7a180ba2fdf081abe8567f0e03

Oldes

[12:19](#msg61f530bc46529077f5ab62a8)Btw... I did profiling in my Rebol3 and `enbase` is still the winner.

```
>> profile/show [[form bin][enbase bin 16]]
Time                 | Code
1.0x (126ns)         | [enbase bin 16]
1.35x (170ns)        | [form bin]
```

hiiamboris

[12:24](#msg61f53201bfe2f54b2e40e744)

```
>> recycle/off prof/each/times [enbase/base #{616D73} 16 form #{616D73}] 99999
<99999> 53%      .00094ms          76 B [enbase/base #{616D73} 16]
<99999> 47%      .00083ms          44 B [form #{616D73}]
```

pekr

[12:55](#msg61f53938f5a39478002c243d)Nice

ne1uno

[12:56](#msg61f539907842bd3ca96d9aab)thanks @Oldes, updated gist w/gc off. I noticed running multiple times aren't exactly the same. probably need to reboot and turn everything off then run high priority as well as gc off.

gltewalt:matrix.org

[18:28](#msg61f587675dc6213cd4076c61)@Oldes: the REBOL results on binary are what I expected

greggirwin

[18:53](#msg61f58d3e6d9ba23328e6fecf)To be clear, @dockimbel said that PR was \*premature\*. Lots of good comments in the tickets. It seems reasonable, but does have some open questions.

Since there are a number of easy ways to do it at the mezz level, and performance is not likely an issue if we're talking about display, this doesn't seem like a pressing issue. Remember, this is a lossy operation we're talking about, so it's not useful for data interchange, where performance might matter.

Oldes

[19:01](#msg61f58efad143b14f833fc480)I think that there is equality that with more closed pull request with reason like \_prematurity\_, the higher chance there is, that the person will not try any pull request anymore.

[19:02](#msg61f58f3146529077f5ac0efc)And if there is a question, which repeats so often like this one, it deserves some response.

[19:07](#msg61f5908de1a1264f0a7e76ce)And I must repeat, that I consider just one proper way to do it now in Red.. the solutions which does not use `enbase` should not be counted.

[19:29](#msg61f595b12a210c38c1f1d68f)@greggirwin what are the open questions? I think that if there is `mold` and `form` producing same result and people are repeatedly trying to get own solution to have `form` output, than there is no question to me.

greggirwin

[20:09](#msg61f59ef782a4667b259df131)&gt; I think that there is equality that with more closed pull request with reason like \_prematurity\_, the higher chance there is, that the person will not try any pull request anymore.

Agreed, 100%. This is something that makes open source work, or teamwork of any kind, challenging. It's like the old humorous saying "Be open minded, but not so open minded that your brains fall out." Deciding what to accept and what to reject is not a simple binary question.

Let's find the best place, wiki page or red-by-example, for FAQs like this, and make sure `enbase` is the answer there.

Open questions are things like what @meijeru notes in #3133 and newline issues. Next up would be this one:

```
>> system/options/binary-base: 64
== 64
>> form #{616D73}
== "64#{YW1z}"
```

Red doesn't work like R2 (above) \*yet\*, but should it? If so, does `64#{YW1z}` become `YW1z` when formed? Now we have global state involved, as we discussed with codec options, where PitL becomes \*much* more treacherous. Some lib changes `system/options/binary-base` and suddenly `form` produces different results behind your back.

&gt; I think that if there is mold and form producing same result and people are repeatedly trying to get own solution to have form output, than there is no question to me.

I'd like to see \*why* people want this form. What are the use cases? Do we know that?

Oldes

[20:20](#msg61f5a19bf5a39478002ce308)

```
rebol
>> system/options/binary-base: 64 print ["MD5 is" res: checksum data 'md5 "(" mold res ")"]
MD5 is D41D8CD98F00B204E9800998ECF8427E ( 64#{1B2M2Y8AsgTpgAmY7PhCfg==} )
```

[20:21](#msg61f5a1d89a3354540648d535)I thought that this question was resolved... base64 is not for humans.

[20:23](#msg61f5a237f5a39478002ce3e1)And I made result on one line only. As it is not practical to have it multiline.

greggirwin

[20:26](#msg61f5a302e1a1264f0a7e9acd)&gt; base64 is not for humans.

Neither is base-16. :^)

Agreed on base-64. It's a workaround for binary transmission.

gltewalt

[20:43](#msg61f5a6d6e1a1264f0a7ea1ef)What I expected, as a reader, was for `form` to present #{616D73} as 616D73, like rebol.  
However... "#{}" are valid characters in a string. Without `form` doing any extra work, the Red result is technically correct, right?  
Maybe it should be the concern of the conceptual "presentation layer". `format`, `print`, etc

[20:44](#msg61f5a728f5a39478002ceedd)Since what he wanted was a typical string representation, and wasn't concerned with transforming the type

greggirwin

[23:18](#msg61f5cb4c46529077f5ac7c31)R2:

```
>> form #{616D73}
== "#{616D73}"
```

R3:

```
>> form #{616D73}
== "#{616D73}"
```

Formed values are determined on a type by type basis, as to what is best. We \*could* make hard and fast rules, but that would produce more technically consistent, but perhaps less useful results. When `form` says "user-friendly string representation" it's a softer, more flexible rule than `mold`.

[23:19](#msg61f5cb797842bd3ca96eaadf)Here's the question I asked:

&gt; I'd like to see why people want this form. What are the use cases?

Start there.

gltewalt:matrix.org

[23:24](#msg61f5ccbbe1a1264f0a7ee5a8)Oldes output

```
>> mold #{3132}
== "#{3132}"

>> form #{3132}
== "3132"

>> to string! #{3132}
== "12"
```

greggirwin

[23:26](#msg61f5cd1bd41a5853f975adb5)We all need to be clear, unfortunately, about which "rebol" does what. :^\\

gltewalt:matrix.org

[23:28](#msg61f5cda45dc6213cd407ea59)Use case is that a consumer doesn't care that about our particular lexical identifiers. That is, #{ } means nothing to them. They expect to see 616D73

[23:29](#msg61f5cdd382a4667b259e3fca)Presenting data for outsiders

[23:31](#msg61f5ce5f9a3354540649246b)As we know, we can make it so, with mezzanic incantations

greggirwin

[23:34](#msg61f5cf035dc6213cd407ecb3)Let me clarify: Concrete use cases. Who has used this in an actual app?

gltewalt:matrix.org

[23:38](#msg61f5cfeed143b14f834034de)I haven't ran into it.. maybe ask @ams02468

[23:38](#msg61f5d00cd143b14f83403519)I can see why it cones up periodically, though

greggirwin

[23:49](#msg61f5d27746529077f5ac87a9)I found one place I used it , generating v4 UUIDs. `enbase/base` occurs in a lot of old R2 code, not always base 16. Without digging in, the use case that jumps out at me is emitting data, because other formats, like XML or JSON, may want values as hex strings, and the return value of `checksum` is a key partner there. But that's not really where `form` is best applied, since it's for data interchange.

Oldes

[23:51](#msg61f5d2f0742c3d4b21c0b064)@greggirwin I can find many examples in my years old code.. like \[this](https://github.com/Oldes/rs/blob/d96d7ba96e9fd2a6ac998ed3be98212feb21df6e/projects-rswf/xfl/latest/dat-functions.r#L16) or \[that](https://github.com/Oldes/rs/blob/d96d7ba96e9fd2a6ac998ed3be98212feb21df6e/projects-rswf/xfl/latest/rules\_resize.r#L104)... and many more.

ne1uno

[23:53](#msg61f5d369d143b14f83403af0)html hex colors, though names are nicer you still need RGB

[23:53](#msg61f5d394d143b14f83403aff)can also be tuple, not specifically binary

[23:55](#msg61f5d3d49b470f38978f7c4a)why to-string #{..}renders aschII? is it utf8 also?

Oldes

[23:55](#msg61f5d400d143b14f83403b70)\[here](https://github.com/Oldes/rs/blob/d96d7ba96e9fd2a6ac998ed3be98212feb21df6e/projects-rswf/swf-parser/latest/parsers/swf-rescaling.r#L187) I would now use:

```
md5: form checksum skip inBuffer 2 'md5
```

instead of:

```
md5: enbase/base checksum/method skip inBuffer 2 'md5 16
```

ne1uno

[23:56](#msg61f5d434526fb77b31a3d02c) seems like form could go either string or hex. need at least 2 forms

## Sunday 30th January, 2022

greggirwin

[00:17](#msg61f5d936f5a39478002d4cf2)@Oldes, I think we're seeing the same patterns.

@ne1uno where are hex colors used as `binary!` in Red? e.g. pixels in images are tuples.

My suggestion is to look at `to-hex` and see if it can be extended (I wish it were a mezz, for easier playing). It's used in the Red codebase is in the JSON emitter, for `\u` chars, but a dozen places or so in %.r support files in the core. It returns an issue, as R2 did, but bear in mind that they were a string type in R2 and a word type in Red. @ne1uno already noted that it's an alternative approach to `enbase`.

`Format` will likely have hex output support, as a side note.

For now, I'd wrap `enbase`, though we have a number of places "hex" is used in a name, but for different purposes. `form-as-hex` could be a name to use as a playground.

Oldes

[00:20](#msg61f5d9e92a210c38c1f24e44)I wonder why there must be so many words about it.. as I said.. if there is `mold` and `form` producing same result, why not to have `form` produce something different and reduce the required code? Never mind.. time to read some book and sleep ;-)

[00:24](#msg61f5dabbd41a5853f975c5aa)I introduced this change in my Rebol fork 2 years ago, and I was not hit with any side effect. I can just enjoy the result, because when I trace some binary values, I really don't have to see them decorated with `#{` and `}`.

[00:31](#msg61f5dc579b470f38978f8c29)And as I review quickly some code.. I should remove many `mold` calls... bad habit from R2 days... because:

```
Time               | Evals  | S.made | S.expa | Memory      | Code
1.0x (1μs)         | 2      | 2      | 0      | 80          | [append "" #{CAFE}]
1.5x (2μs)         | 3      | 2      | 0      | 80          | [append "" mold #{CAFE}]
```

olivier\_lp\_twitter

[13:03](#msg61f68cafbfe2f54b2e4338c8)Hi, Ive discovered Red a few years ago, as the rebol next generation. I came a a few time ago and trying to get compilation option. I try to understand why sometimes the release mode has to be done because -c option fails. And the no-runtime option I really dont get it

hiiamboris

[13:38](#msg61f694cc46529077f5adc27e)I can't say what `--no-runtime` is used for, maybe testing the compiler. Never used it.

[13:39](#msg61f6951182a4667b259f9674)`-c` may fail for numerous reasons, depends on your code

[13:40](#msg61f695455ee4df335a0d74fc)most importantly, when libRedRT lacks some runtime exports your script might use

zentrog:matrix.org

[17:59](#msg61f6d1f3bfe2f54b2e43b6ab)—no-runtime is probably useful if you have only Red/System code and want the smallest possible executable size

hiiamboris

[18:08](#msg61f6d4032a210c38c1f3f43d)in that case you can just declare `Red/System` header

zentrog:matrix.org

[19:07](#msg61f6e1d99b470f3897914f5c)Oh, that has the same effect?

hiiamboris

[19:23](#msg61f6e5c17842bd3ca970935b)runtime is only included into `Red` scripts

## Monday 31st January, 2022

zentrog:matrix.org

[08:09](#msg61f799376d9ba23328ea853d)I seem to remember reading that there is a way to call Red functions from Red/System. So does that mean there is also a way to tell the compiler to include the runtime?

ldci

[08:15](#msg61f79a88f5a3947800305343)Yes; https://github.com/ldci/Red-System/tree/main/doc

hiiamboris

[09:05](#msg61f7a659d41a5853f978d966)You just start with 'Red' and then go down to '#system'.

## Saturday 5th February, 2022

ams02468

[03:40](#msg61fdf1a1e4c979478d608343)hi guys how can hide text in field?

ne1uno

[03:48](#msg61fdf39151bd8b580c8a322f) password?

greggirwin

[03:48](#msg61fdf39a0779373db8cbeb57)`password`, e.g. `view [field password]`

ams02468

[03:53](#msg61fdf4a81fe6ba5a970d1193)This is a good method, but is not it a way that does not even show the number of characters?

[03:54](#msg61fdf502e4c979478d60884d)Inside the cli, I matched the background color with the color of the words

ne1uno

[03:57](#msg61fdf5b0e4c979478d60896e)select too?

[03:59](#msg61fdf609708e9c3dd7628183)`on-change []` could append chars and reset face/text: "\*\*\*\*\*\*"

ams02468

[04:11](#msg61fdf8eaced11857f99484ee)@greggirwin and @ne1uno thanks

## Thursday 10th February, 2022

ams02468

[17:04](#msg6205459b3e52f56a26f9b862)Hello guys , how can find the pc resolution with red ?

dsunanda

[17:06](#msg62054622708e9c3dd770e84c)eg: system/view/screens/1/size

ams02468

[18:29](#msg620559a2d4102444805695ab)I tried this command before, but it did not give the correct specifications. My PC resolution is 1080, but it gave me 1536x864

hiiamboris

[18:32](#msg62055a5bb8b082448229cd56)`system/view/screens/1/size * system/view/metrics/dpi / 96`

ams02468

[18:34](#msg62055aa91fe6ba5a971b9e0d)thanks @hiiamboris @dsunanda

hiiamboris

[18:34](#msg62055abbd410244480569883)maybe even  
`system/view/screens/1/size * system/view/metrics/dpi / 96 + 3 and complement 3`

[18:35](#msg62055b081fe6ba5a971b9ebe)but this needs testing on nonstandard resolutions / dpis

greggirwin

[18:37](#msg62055b7ea41d896a208c285d)We need to make sure that's doc'd somewhere.

## Monday 14th February, 2022

ams02468

[14:12](#msg620a6363708e9c3dd77b075f)Hello, how can I write two correlation commands in one line, for example?  
`create -dir % test change -dir % test`  
If they are separated, space is occupied, for example cmd  
`md test && cd test`

hiiamboris

[14:28](#msg620a671ddc191b3d69af6901)what have you tried?

ams02468

[14:34](#msg620a686c41e3293d65f10783)I want to fit two commands in one line

hiiamboris

[14:36](#msg620a68daced11857f9ad03ec)Red does not distinguish new line from space or tab.

ams02468

[14:44](#msg620a6ac0e4c979478d791fb4)ok thx @hiiamboris

## Thursday 17th March, 2022

ams02468

[15:00](#msg62334d0109092523182beef6)Hello, is there a way to run it without write the file?

```
test: #include-binary %z.exe

write/binary %z.exe test

call %z.exe
```

hiiamboris

[15:04](#msg62334e0b99d94f5f0c5623f8)no

ams02468

[15:39](#msg623356419a09ab24f3ab8dc3)Is there any example for how use the dll library like 7z in red?

hiiamboris

[15:49](#msg6233587f161ffc40d7bd0bbf)both red/red and red/community repos are full of examples

[15:49](#msg6233589609092523182c05c8)https://github.com/ldci/redCV/blob/master/docs/RedCV\_Manual.pdf maybe smth here too

ldci

[21:12](#msg6233a43d99d94f5f0c56d0d9)@hiiamboris Thanks for the link to redCV:)

hiiamboris

[21:19](#msg6233a5c7c61ef0178e7a9bd7)I was looking for a link to your Red/System introduction, but haven't found it, so posted random one

[21:19](#msg6233a5caddcba117a2287077):)

ldci

[21:32](#msg6233a8e8f43b6d783f07c1e9)@hiiamboris . Here: https://github.com/ldci/Red-System

hiiamboris

[21:37](#msg6233aa1399d94f5f0c56dd10)I meant the PDF

## Friday 18th March, 2022

ldci

[06:49](#msg62342b6499d94f5f0c57c4c0)in doc directory

ams02468

[17:34](#msg6234c2ac6b912423203dc86e)thx @ldci @hiiamboris

## Monday 28th March, 2022

laturk

[19:20](#msg62420a97c435002500125ef3)I'm trying to take a script that converts 4K MP4 video from my Sony RX10 iii camera to a format editable by Davinci Resolve. For testing, I have the script print the string before it calls it. If i manually copy that string direct to the command line it works perfectly. But when the script calls it, it makes a video from just one frame. How call I correct this? Here's the script:

[19:21](#msg62420a9d161ffc40d7d8d64b)red \[]  
f: request-file  
str: to-string mold f  
in-str: trim/with str "%"  
out-str: copy in-str  
replace out-str "MP4" "mov"  
print out-str  
ffm-str: rejoin \["ffmpeg -i " in-str " -c:v dnxhd -profile:v dnxhr\_hq -pix\_fmt yuv422p -c:a pcm\_s16le -f mov " out-str]  
print ffm-str  
call/wait ffm-str  
quit

hiiamboris

[19:32](#msg62420d320466b352a43e14f7)see if `print` outputs the correct string, minding the quotes

laturk

[19:58](#msg62421374257a3578254fba0e)hiiamboris, it does.

hiiamboris

[20:01](#msg6242142df43b6d783f22fed4)no idea

greggirwin

[20:15](#msg6242175399d94f5f0c71f1b4)@qtxie, any ideas? @laturk have you tried with `/shell` or `/show`? I know R2 had some issues in later releases if `/show` wasn't used. I haven't tried FFMPEG from Red though.

hiiamboris

[20:37](#msg62421c84f43b6d783f230ea0)it's possible that Red calls 32-bit version of ffmpeg, with 32-bit codecs, and those have some bugs resulting in this

[20:37](#msg62421c9d0466b352a43e3487)if it's windows we're talking about

[20:38](#msg62421cc4090925231847f7a9)also ensure you're using latest, not stable, build

laturk

[22:01](#msg62423034c61ef0178e95f986)Greg, using /shell or /show doesn't help.

greggirwin

[22:02](#msg6242306cc43500250012a793)OK, thanks for trying and reporting back.

laturk

[22:02](#msg624230933ae95a1ec1bf20a1)hihambrois, I think you are probably right that it is a codec problem.

[22:04](#msg624230d70466b352a43e5c3b)I'm using archlinux, not windows. The build of red I'm using is about a week old.

[22:05](#msg6242312a3ae95a1ec1bf21c4)Is there any way to make the resulting file overwrite the existing file?

hiiamboris

[22:06](#msg62423179ddcba117a243d19f)that's up to ffmpeg

laturk

[22:15](#msg6242338fc61ef0178e95ff0e)hiiamboris, yes, I just needed to add the -y option to ffmpeg. I should have realized that.

[22:18](#msg6242341b9bd1c71ecac51cf6)I don't understand how red can call the wrong codecs though.

[22:20](#msg624234c299d94f5f0c722833)I can upload a short video file if anyone would like see what is happening. It is only a few seconds long, but still 74.3 MB.

hiiamboris

[22:31](#msg62423746161ffc40d7d92d9d)I've no idea how it works in linux under the hood, but since Red is using 32-bit libraries, it's possible that it's child processes are using those libs too, and that those are buggy.

cloutiy

[22:33](#msg624237bf9bd1c71ecac52368)Red needs some tweeters. I can try to get the ball started if there is any interest.

laturk

[22:33](#msg624237cb9a09ab24f3c79782)Will red eventually be using 64-bit libraries. 32-bit is pretty well a thing of the past.

hiiamboris

[22:34](#msg624237fc161ffc40d7d92ef2)eventually yes

laturk

[22:37](#msg62423891ddcba117a243def3)Rebol view no longer works for me. I get: \** User Error: Bad face in screen pane!  
\** Near: size-text self

[23:02](#msg62423e85d1b64840db8b3f04)Does "eventually" mean any time soon?

hiiamboris

[23:04](#msg62423f0dc61ef0178e96169f)Unlikely.

laturk

[23:25](#msg62424406d1b64840db8b4918)hiiambrois, I was afraid of that. Thanks for replying.

dsunanda

[23:58](#msg62424b9ed1b64840db8b566f)@laturk If Red is somehow calling the wrong version of ffmpeg, you may be able to bypass that by writing a short shell script to call ffmpeg, and then CALLing that from within Red.

## Tuesday 29th March, 2022

laturk

[04:13](#msg6242875de9cb3c52ae3ae880)dsunanda, thanks, but I only have one version of ffmpeg installed, and even if I call it using its full path the result is the same.

[04:28](#msg62428ad70466b352a43f012c)Success. Use call/console, and it works.

[05:07](#msg624294083ae95a1ec1bfcf04)But compile for release fails.

[05:07](#msg624294198db2b95f0a8d274c)\[red-code]% red -r -t linux mp4todr.red (l@lat:~/red-code)

-=== Red Compiler 0.6.4 ===-

Compiling /home/l/red-code/mp4todr.red ...  
\*\** Compilation Error: undefined word request-file  
\*\** in file: /home/l/red-code/mp4todr.red  
\*\** near: [request-file  
str: to-string f  
in-str: replace str "%"  
]

hiiamboris

[08:00](#msg6242bc8e9bd1c71ecac61d1d)Needs: view

laturk

[12:36](#msg6242fd443ae95a1ec1c0a266)hiiamboris, thank you. I can now convert files from my camera to a form Davinci Resolve can edit, and then convert the edited files back to mp4 for posting to Youtube, and I can do it without having to type even one letter.

hiiamboris

[13:14](#msg62430636161ffc40d7dab271):+1:

[13:17](#msg624306cc8db2b95f0a8e0c2e)it's kinda weird that Resolve would only support Quicktime format

[13:17](#msg624306d66b9124232058cc9e)it's a very ancient format

[13:21](#msg624307c4257a357825518351)maybe you should try \[Shotcut](https://en.wikipedia.org/wiki/Shotcut)

greggirwin

[15:13](#msg6243222b161ffc40d7daeb8e)Glad you got it working @laturk.

## Wednesday 30th March, 2022

planetsizecpu

[08:25](#msg624413f59bd1c71ecac8b6e9)Welcome btw @laturk

## Friday 8th April, 2022

laturk

[02:56](#msg624fa446e9cb3c52ae541ca5)@planetsizecpu Thanks. I've been watching RED for a long time, waiting for RED View to be available on Linux. RED has the potential to be the most productive computer language ever. I'm hoping for events that will enable the speed of development to greatly increase.

cloutiy

[15:11](#msg62505097257a3578256b1c25)@laturk Red view is available on linux. Download the gui branch.

[15:11](#msg625050a5f43b6d783f3e57e5)I been playing with it. It uses gtk

## Monday 11st April, 2022

rebolek

[07:46](#msg6253dcc93ae95a1ec1e0af6d)@cloutiy @laturk I believe you don’t need the gui branch anymore and Linux View is in the master for some time.

cloutiy

[21:24](#msg62549c97e9cb3c52ae5d72d9)Even better.

[21:24](#msg62549ca73ae95a1ec1e236a1)Great to see lots of new faces lately.

## Sunday 17th April, 2022

ams02468

[07:59](#msg625bc8fa9bd1c71ecaf5e019)Hi, this is part of my code, but whatever I do, I can't compile it with the red flag -r. Can anyone help me please?

```
Red [needs: view]
#include %./environment/console/CLI/input.red
tar: #include-binary %tar.exe
data: split-path request-dir
cdd: to-local-file what-dir
write to-red-file rejoin [data/1{tar.exe}] tar
change-dir data/1
call/wait rejoin [{tar -cf "}replace/all cdd "\" "/" {test" }data/2 ]
delete to-red-file rejoin [data/1{tar.exe}]
change-dir to-red-file cdd
```

this is error message  
\**  
Compiling c:\\Users\\username\\Desktop\\ams\\tar.red ...  
\*\** Syntax Error: Missing #"]" character  
\*\** in file: c:\\Users\\username\\Desktop\\ams\\tar.red  
\*\** line: 261  
\*\** at: ""  
\**

hiiamboris

[09:23](#msg625bdc74e9cb3c52ae6b8949)Try adding spaces between tokens.

ams02468

[10:37](#msg625bedf58db2b95f0abde24d)It was my fault(I forgot to update the source code XD) but thanks for the reply anyway @hiiamboris

## Sunday 3th July, 2022

TheLastGuard

[21:08](#msg62c2056a904f20479a789807)it is possible to include a file written in Red/System in normal Red

[21:09](#msg62c205809f29d42bedf0761c)and Hi, sorry

hiiamboris

[21:41](#msg62c20cf376cd751a2fb29231)`#system [#include %file.reds]`

TheLastGuard

[21:41](#msg62c20cfbb408e830dc85869b)thanks

## Monday 4th July, 2022

greggirwin

[02:34](#msg62c251a28fe56a38b50faafa)Welcome @TheLastGuard. No need to apologize.

## Saturday 9th July, 2022

ams02468

[12:48](#msg62c979079a314a3ec4569993)Hi, I had a question how can I give this example two inputs?

```
a: system/options/args

     -p: func [x y] [
    
         print rejoin [{ren "}x{" "}y{"}]]
   
            
            if find a "-p" [ 
                 
                  remove a
                     
                     -p remove a a ]
```

hiiamboris

[13:00](#msg62c97c09568c2c30d37531ea)what inputs?

[13:01](#msg62c97c2a1227f62be3473e86)`system/options/args` contains all the arguments from command line

ams02468

[14:14](#msg62c98d34b408e830dcbb14dc)@hiiamboris i solved the problem thanks anyway

ldci

[15:32](#msg62c99f959f29d42bed26b31c)What’s wrong in this function?

```
bitExtract: function [
	number 	[integer!]
	n		[integer!]
	p		[integer!]
][
	((1 << n) - 1) AND (number >> (p - 1))
]
```

[15:33](#msg62c99fb1b408e830dcbba3c7)`print bitExtract 140 3 6 print bitExtract 140 3 4`

[15:33](#msg62c99fc89f29d42bed26b5bc)OK : we get 4 and 1

[15:34](#msg62c9a01b3bbb38488925def8)But `print bitExtract 45 3 6 print bitExtract 45 3 4`  
I’m waiting for 6 and 6 and I get 1 and 5

hiiamboris

[16:06](#msg62c9a76fb408e830dcbbd963)45 is `101101`, how do you expect 6 and 6?

ldci

[16:26](#msg62c9ac3822c53438bc4cf9a6)@hiiamboris Code given by Gif code table :)

hiiamboris

[16:46](#msg62c9b0fc9a314a3ec4581d2a)54 maybe not 45

[16:47](#msg62c9b111568c2c30d376b3fa)those bloggers...

## Sunday 31st July, 2022

ams02468

[16:22](#msg62e6ac4e11a6a83d0480e5d5)hi hope you guys have a good day, I wanted to know what code editor you use for red? I want to change my editor and I need your experience

ldci

[16:26](#msg62e6ad4d3a42316d33ba7d65)@ams02468 Depends on your OS. With macOS, I use sublime Text or BBEdit.

greggirwin

[17:55](#msg62e6c21b7ccf6b6d45a2ba51)UltraEdit.

## Monday 1st August, 2022

rebolek

[06:28](#msg62e77272999499629336b4f7)Vim

hiiamboris

[10:31](#msg62e7ab95d020d223d30cd9ca)@ams02468 \[CudaText](https://i.gyazo.com/e960e5091ec72eda2103ce50e0a7f74f.png) (cross-platform)

[10:33](#msg62e7abeb647d633cf6f306db)I dropped Sublime for it's too hard to extend, and decided against UltraEdit for it's too sluggish for my taste.

ams02468

[16:12](#msg62e7fb51647d633cf6f578da)10q 4 the answers you gave, very helpful

GaryMiller

[16:16](#msg62e7fc5005ad4a3701c53931)Notepad++

dsunanda

[16:37](#msg62e801617ccf6b6d45abebf2)Also using Notepad++ .... Recently changed from Programmer's Notepad because it is getting a bit crufty with UNICODE support.  
Both have syntax coloring for Rebol (and therefore Red) which is nice.

## Wednesday 3th August, 2022

planetsizecpu

[07:51](#msg62ea28f0f4d7a323deb8c873)Notepad++ + @Ungaretti 's pluggin

## Tuesday 9th August, 2022

ams02468

[17:04](#msg62f293927ccf6b6d45f7b1a7)Hi, is there a command to show numbers smaller than one number, something like a countdown?

dsunanda

[17:07](#msg62f294387ccf6b6d45f7b6a3)You could adapt something like this:

```
num: 7 repeat n num [print num - n]
6
5
4
3
2
1
0
```

ams02468

[17:17](#msg62f2968e9994996293870e4e)thx @dsunanda

## Wednesday 10th August, 2022

ams02468

[16:15](#msg62f3d9859d3c1862992abbc8)hey guys why the output of this code is none ?

```
z: [ 1 2 3 4 5]

a: 1

print z/a
```

toomasv

[16:25](#msg62f3dbec3a42316d331a3e20)@ams02468 `z/:a` or `z/(a)`

ams02468

[16:53](#msg62f3e2937ccf6b6d45011051)thx @toomasv

toomasv

[17:01](#msg62f3e451999499629390c3c2):+1:

## Monday 15th August, 2022

ams02468

[18:24](#msg62fa8f5072ad51741f3954f4)Hello . there is way to convert the output of code to the string again ?

```
print checksum "test" 'MD5
```

dsunanda

[18:27](#msg62fa900c05ad4a37014a28ba)@ams02468 There's not supposed to be :). The point of hashes is that they are a one-way secure function.  
MD5 though is so badly broken, that a search on the internet is often all you need:  
https://md5.gromweb.com/?md5=098f6bcd4621d373cade4e832627b4f6  
`test`

ams02468

[19:35](#msg62fa9fe805ad4a37014aa32d)I wanted to know if red has sup reverse function? anyway thanks @dsunanda

## Thursday 10th November, 2022

fabianorezende26\_gitlab

[19:23](#msg636d4fa7ff5546644b3ba546)Is red a language from the lisp family?

dsunanda

[20:10](#msg636d5ab925ca105c88add3a6)Joe Marshall thought so: http://ll1.ai.mit.edu/marshall.html

Respectech

[22:50](#msg636d8043473cf96648dd4f79)Carl told me that Lisp was one of the inspirations for Rebol. However, there were some things in Lisp that he didn't like, so he only took the parts of Lisp that he liked.

[22:51](#msg636d8054a34b51121125a99e)Smalltalk and C are other inspirations for Rebol.

[22:51](#msg636d8069f9491f62c9aa33d5)(If I remember correctly from my conversations with Carl when I worked for him over 20 years ago)

## Sunday 13th November, 2022

greggirwin

[18:46](#msg63713b74abfb5860bb14dce9)Redbol langs inherit from Lisp, Forth, and Logo (Lisp without parens effectively), and prototype object design from Self.

## Monday 14th November, 2022

Respectech

[18:39](#msg63728b6525ca105c88b75b72)Gregg obviously has a much better handle on where Rebol got some of its inspirations from.

[18:40](#msg63728b8bff5546644b454311)Thanks for the clarification, Gregg.

## Friday 18th November, 2022

fabianorezende26\_gitlab

[05:37](#msg63771a100513b562e8b69392)yeah i can see forth in it but there seems to be a bit of awk in it : )

greggirwin

[06:35](#msg6377279b473cf96648ef3989)Not really. No automatic line processing, field splitting, or pattern-action core. I do have a `rawk` dialect built for R2 however, so it's applicable to that space, and others in shell-world. I hoped we'd get to build a `reddy-box` and other things along those lines someday.

## Sunday 20th November, 2022

WayneCui

[05:22](#msg6379b9ad18f21c023bbde42c)Hello guys, any way to change a timestamp value to a date! value? eg. 894621091000 =&gt; 1998-05-08 09:51:31

[05:44](#msg6379beaf18f21c023bbded95)

```
from-timestamp: func [ ts ][
    days: to-integer round/down ts / 1000 / 3600 / 24
    seconds: round/down mod (ts / 1000) (3600 * 24)
    return (1970-01-01 + days) + (00:00:00 + seconds)
]

print  from-timestamp 894621091000
```

[05:48](#msg6379bfc10513b562e8bb3c69)just wrote a function, is there any better ways?

ne1uno

[06:30](#msg6379c972abfb5860bb24771f)this used to work? way off now. `1-Jan-1970 + to time! 894621091000`

WayneCui

[06:38](#msg6379cb7c655bc46025d5dcac)

```
1-Jan-1970 + to time! 894621091   
== 8-May-1998/9:51:31
```

[06:41](#msg6379cc16f9491f62c9c0acfd)@ne1uno Thanks for reply, it works, just change millisecond to second ;-)

ne1uno

[06:47](#msg6379cd744fee72663c837224)👍

[06:57](#msg6379cfdc18f21c023bbe0b8f)the other way, `to float! difference to date! 8-5-1998/09:51:31 1-Jan-1970` from an @x8x post

WayneCui

[08:36](#msg6379e714abfb5860bb24a32a)👍

dockimbel

[13:44](#msg637a2f3e4fee72663c8412ce)See \[documentation](https://github.com/red/docs/blob/master/en/datatypes/date.adoc#epoch-time):

```
>> to-date 894621091
== 8-May-1998/9:51:31
```

ldci

[13:46](#msg637a2f9bf9491f62c9c15d2c)\[!\[image.png](https://files.gitter.im/570387cd187bb6f0eaddec47/FZ61/thumb/image.png)](https://files.gitter.im/570387cd187bb6f0eaddec47/FZ61/image.png)

[13:47](#msg637a2fe1655bc46025d68310)A simple way to create nice forms: use zenity inside your Red code :)

[13:48](#msg637a302ff9491f62c9c15dd2)zenity runs under Linux, MacOS and Windows. See https://gitlab.gnome.org/GNOME/zenity

greggirwin

[19:24](#msg637a7ee115a3885c70fd832d)@ldci nice reminder. Zenity has come up before.

## Monday 21st November, 2022

WayneCui

[06:20](#msg637b18c315a3885c70fe82d1)@dockimbel Thanks Doc, my CLI is too old. It works with a new version

## Friday 25th November, 2022

WayneCui

[04:30](#msg638044e9b1a7596436891ba0)

```
Red []

from-timestamp: func [ ts ][
   return 1970-01-01 + to time! round/down ts / 1000 
]

hessian-proxy: make object! [

    run: func[ method ][
        data: rejoin [to-binary "c^A^@m" (at to-binary length? method 7) to-binary method to-binary "z"]
        result: write http://hessian.caucho.com/test/test compose [
            post [
                Host: "hessian.caucho.com"
                Content-type: "application/x-hessian"
                Accept-Encoding: "identity"
                User-Agent: "rebol-hessian/0.0.1"
                Accept-Charset: "*"
            ]
            (data)
        ]

        print to-binary result
        probe from-timestamp to-integer copy/part at result 5 8
    ]
]

hessian-proxy/run "replyDate_1"
```

[04:31](#msg6380451f4fee72663c8f0be2)\[!\[image.png](https://files.gitter.im/570387cd187bb6f0eaddec47/ejNB/thumb/image.png)](https://files.gitter.im/570387cd187bb6f0eaddec47/ejNB/image.png)

[04:33](#msg63804582ff5546644b5e1546)

```
>rebol3 hessian-red.red
#{72010064000000D04B9284B87A}
8-May-1998/9:51:31

> red-latest hessian-red.red 
#{
72010066530004636F64655300154E6F537563684D6574686F64457863657074
696F6E5300076D65737361676553002B54686520736572766963652068617320
6E6F206D6574686F64206E616D65643A20706C79446174655F317A7A7A
}
*** Script Error: cannot MAKE/TO integer! from: "S^@^DcodeS"
*** Where: to
*** Near : probe from-timestamp to-integer copy/part 
*** Stack: run probe from-timestamp to-integer
```

[04:35](#msg6380461925ca105c88d04187)Hello, I am working on a hessian client project，sending/receiving binary data over HTTP. It seems there is something not working well about Red HTTP

ne1uno

[07:19](#msg63806c6d25ca105c88d0888b)&gt;{r^A^@fS^@^DcodeS^@^UNoSuchMethodExceptionS^@^GmessageS^@+The service has no method named: plyDate\_1zzz}

[07:57](#msg6380756715a3885c70083f07)@WayneCui, `at` maybe needs `series!`? try something like `(to binary! at form to-hex length? method 8)`

WayneCui

[08:14](#msg6380795f18f21c023bca1261)Thanks @ne1uno , I know what's wrong

[08:22](#msg63807b40abfb5860bb306b0d)request is correct, another error

[08:37](#msg63807edb18f21c023bca1cb8)

```
#{6301006D000B7265706C79446174655F317A}
*** Access Error: invalid UTF-8 encoding: #{D04B9284}
*** Where: write
*** Near : result: write http://hessian.caucho.com/ 
*** Stack: run
```

[08:38](#msg63807ef5a34b5112114811e0)

```
Red []

from-timestamp: func [ ts ][
   return 1970-01-01 + to time! round/down ts / 1000 
]

hessian-proxy: make object! [

    run: func[ method ][
        ; probe data: rejoin [to-binary "c^A^@m" (to-binary at form to-hex length? method 8) to-binary method to-binary "z"]
        probe data: rejoin [to-binary "c^A^@m" (at to-binary length? method 3) to-binary method to-binary "z"]
        result: write http://hessian.caucho.com/test/test compose [
            post [
                Host: "hessian.caucho.com"
                Content-type: "application/x-hessian"
                Accept-Encoding: "identity"
                User-Agent: "rebol-hessian/0.0.1"
                Accept-Charset: "*"
            ]
            (data)
        ]

        probe "==========="
        print to-binary result
        probe from-timestamp to-integer copy/part at result 5 8
    ]
]

hessian-proxy/run "replyDate_1"
```

ne1uno

[08:39](#msg63807f47b1a75964368987f8)`(at to-binary length? method 4)` ?

[08:43](#msg63808033326f06602c644c6a)seems like it's looking fo 2 byte length, not 1 or 4

WayneCui

[10:42](#msg63809c1aa34b511211484be1)I think it's about the response. Request is the same with Rebol

[10:56](#msg63809f45426f9311ffbeeda2)Simplified the code, but this url (http://hessian.caucho.com/test/test) has often been timeout :-/

[10:56](#msg63809f74bcdb0060b839c550)

```
Red []

data: #{6301006D000B7265706C79446174655F317A}
probe result: write http://hessian.caucho.com/test/test compose [
    post [
        Host: "hessian.caucho.com"
        Content-type: "application/x-hessian"
        Accept-Encoding: "identity"
        User-Agent: "rebol-hessian/0.0.1"
        Accept-Charset: "*"
    ]
    (data)
]
```

[10:57](#msg63809f97ff5546644b5ebe50)

```
>redl hessian-red.red  
*** Access Error: invalid UTF-8 encoding: #{D04B9284}
*** Where: write
*** Near : data: #{6301006D000B7265706C79446174655F 
*** Stack: probe 

>rebol3 hessian-red.red
#{72010064000000D04B9284B87A}
```

[11:10](#msg6380a2c315a3885c70089478)It seems Red try to explain response data as UTF-8

[11:13](#msg6380a340426f9311ffbef419)\[!\[image.png](https://files.gitter.im/570387cd187bb6f0eaddec47/q2hz/thumb/image.png)](https://files.gitter.im/570387cd187bb6f0eaddec47/q2hz/image.png)

ne1uno

[11:13](#msg6380a359655bc46025e2358d)why compose? I got a 404 using reduce instead

[11:13](#msg6380a359a34b51121148596d)= {&lt;html&gt;^/&lt;head&gt;&lt;title&gt;404 Not Found&lt;/title&gt;&lt;/head&gt;^/&lt;body&gt;^/&lt;h1&gt;404 Not Found&lt;/h1&gt;^//test/test2%A0 was not found ...

WayneCui

[11:19](#msg6380a4dca34b511211485c9b)`compose` evaluates a block of expressions, only evaluating parens, and returns a block. (http://www.rebol.com/r3/docs/functions/compose.html)

ne1uno

[11:26](#msg6380a67318f21c023bca6b5a)I get the 404 now with compose too. not a utf8 error

[11:45](#msg6380aac615a3885c7008a138)could it be a hessian v1 v2 v3 thing?

[11:46](#msg6380ab2418f21c023bca72fa)if r3 works, must be something in the post is different

WayneCui

[11:48](#msg6380ab9cabfb5860bb30c1f4)Never met that. Is there any typo? Can you open http://hessian.caucho.com/test/test in the browser?

ne1uno

[11:49](#msg6380abaeff5546644b5ed1e9)Hessian Requires POST

[11:49](#msg6380abdd15a3885c7008a3e6)seems to work

[11:57](#msg6380ad92bcdb0060b839e124)I used to have a proxy to look at messages in or outgoing, haven't done that in awhile.

[12:02](#msg6380aec2655bc46025e24b90)should I be using the I/O branch maybe? woops

[12:16](#msg6380b212326f06602c64aada)same w/older red I/O

[12:22](#msg6380b370655bc46025e2546c)Red 0.6.4 for Windows built 18-Jul-2022/15:26:27-05:00 commit #d09220b

[14:53](#msg6380d6d2426f9311ffbf5549)@WayneCui, which red version are you using? continuing in https://gitter.im/red/IO

WayneCui

[16:13](#msg6380e9b0655bc46025e2bbe5)@ne1uno Red 0.6.4 for Mac Cli, November 20 or 21

[16:18](#msg6380ead6bcdb0060b83a55e5)the same with red-24nov22-e6ae842b4 for Mac cli

ne1uno

[16:22](#msg6380ebd5473cf9664800a9d3)@WayneCui, try separating the `odata: compose ...` from the `write ... odata`, it might improve the error message?

greggirwin

[17:06](#msg6380f60cbcdb0060b83a69bd)Have you tried using `/binary`?

ne1uno

[17:31](#msg6380fc00326f06602c653aaa)`/binary` same w/recent. current red IO, `write` seems not to handle a block after the url at all

greggirwin

[17:36](#msg6380fd35a34b511211490141)With current main branch:

```
data: #{6301006D000B7265706C79446174655F317A}
probe result: write/binary http://hessian.caucho.com/test/test compose [
    post [
        Host: "hessian.caucho.com"
        Content-type: "application/x-hessian"
        Accept-Encoding: "identity"
        User-Agent: "rebol-hessian/0.0.1"
        Accept-Charset: "*"
    ]
    (data)
]
```

```
== #{72010064000000D04B9284B87A}
```

ne1uno

[18:04](#msg638103a815a3885c7009472b)^works recent cli not view. there was a Unicode space or control code between /test and compose I picked up from copy &amp; paste that errored.

## Saturday 26th November, 2022

WayneCui

[01:11](#msg638167cb2cb6570240440d24)@greggirwin It works, thanks a lot

[01:44](#msg63816f702cb6570240441976)

```
>> to-integer #{000000D04B9284B8}
== 208
>> to-binary 208
== #{000000D0}
>> to-integer #{D04B9284B8}
== -800353660
>> to-binary -800353660
== #{D04B9284}
```

When convert a binary! to integer! , it seems only first 4 byte matters. Or there is other ways for this converting ?

[01:44](#msg63816f83ff5546644b603916)In rebol3 , I can do this:

[01:44](#msg63816f8f426f9311ffc06375)

```
>> to-integer #{000000D04B9284B8}
== 894621091000

>> to-binary 894621091000
== #{000000D04B9284B8}
```

[01:47](#msg63817031abfb5860bb322779)`to-float` can not work either

```
--== Red 0.6.4 ==-- 
Type HELP for starting information. 

>> to-float #{000000D04B9284B8}
== 0.0
>> to-number #{000000D04B9284B8}
*** Script Error: to-number has no value
*** Where: catch
*** Near : to-number #{000000D04B9284B8}
*** Stack:
```

Oldes

[06:34](#msg6381b388326f06602c667331)There is no `to-number`. `number!` is not datatype. It is a typeset:

```
>> ? number!
NUMBER! is a typeset! value: [integer! float! percent!]
```

[06:36](#msg6381b3f825ca105c88d2cf93)And Red has only 32bit integer and float values:

```
>> to binary! 1
== #{00000001}
```

[06:46](#msg6381b636326f06602c6676f6)Years ago I used my \[Stream-IO](https://github.com/red/code/tree/master/Library/Stream-IO) written in Red/System for binary conversions in Red.

greggirwin

[18:12](#msg6382572a655bc46025e53de8)As @Oldes noted, there are no 64-bit ints in Red yet.

## Sunday 27th November, 2022

WayneCui

[01:06](#msg6382b826473cf9664803cd2d)I see, thanks for your info @Oldes @greggirwin

## Thursday 29th December, 2022

lylgithub2021

[11:49](#msg63ad7ebac4fec572d65d021a)

```
a: ["A" "B"]
view [
drop-down data a
react [face/data: a]
]
```

In this example, I try to refresh the face "drop-down" by "react" so as not to close/restart program when the value of "a" changes. Yet it does not work when the value of "a" changes from \["A" "B"] to \["A" "B" "C"]. Here the value of "a" comes from direct input. In the real program, it comes from reading a file. So, how to refresh a face in Red without restarting program?

dockimbel

[18:50](#msg63ade176fb195421bd5d70b5)@lylgithub2021 You do not need to add a reaction for tracking face property changes, as faces are already reactive. The following code works fine:

```
a: ["A" "B"]
view [
	drop-down data a
	button "Add" [append a pick ["C" "D" "E"] random 3]
]
```

## Friday 30th December, 2022

lylgithub2021

[00:53](#msg63ae36768f8df4262acac1d7)@Nenad Rakocevic thank you so much for your idea. In my program, the value of "a" read and changes from a file. If no another button is introduced, any other better way to do it?

greggirwin

[01:47](#msg63ae431fbe2c3c20c7243a0f)@lylgithub2021 if you want to maintain a reference to the same series, and update it, you can do something like `append clear a load`.

[01:48](#msg63ae4367ff1fd121b31e36b7)What happens in your case is that the face references the actual series, not `a` (which also refers to the series).

lylgithub2021

[01:55](#msg63ae45193b37dd2c11551543)@Gregg Irwin many thanks. I still do not understand why "a" can not be referenced directly.

greggirwin

[02:22](#msg63ae4b7d378d512c1839689d)It is, as @dockimbel 's example shows. You just need to \*change* `a`.

[02:24](#msg63ae4bc43b37dd2c11552229)Show your actual code that affects `a` and I will hazard a guess that you are changing what `a` \*refers to\*, not the original series it referred to when the face's data was set.

lylgithub2021

[06:29](#msg63ae853bfb195421bd5e8c19)I just wonder why "append" can reactive drop-down, and derect change value of a(a: \["A" "B" "C"] for example) can not.

greggirwin

[08:46](#msg63aea56ffb195421bd5ec300)

```
>> a: [1 2 3]    ; here is your original a
== [1 2 3]
>> b: :a      ; b now refers to the same block
== [1 2 3]
>> a: [4 5 6]   ; a now refers to this new block
== [4 5 6]
>> b         ; b still refers to the old one
== [1 2 3]
```

So if you do something like `a: load`, `face/data` is like `b` in this example, and doesn't know or care that `a` now refers to something else. It only knows about what series it \*still* refers to.

lylgithub2021

[13:26](#msg63aee700410c633d48003864)Oh, Thank you so much for this !!
