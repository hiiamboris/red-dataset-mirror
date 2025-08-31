# Archived messages from: [gitter.im/red/sandbox](/gitter.im/red/sandbox/) from year: 2021

## Sunday 3th January, 2021

planetsizecpu

[11:15](#msg5ff1a7648bb73474696ecebf)Cool @toomasv 👌

## Friday 8th January, 2021

gltewalt:matrix.org

[23:39](#msg5ff8ed25d5f4bf2965d50e12)Docs converted to html via asciidoctor look ok on the rendered side. Source is ugly.

[23:39](#msg5ff8ed3991e9b71badc4bafa)\[draw.html](https://gitter.ems.host/\_matrix/media/v1/download/matrix.org/crzPvAevGLbKNveykZWRoozk)

## Tuesday 23th February, 2021

gltewalt

[00:11](#msg60344846a7fc4b573bf062f1)Vscode to gist pasting is giving me issues? Anyone else have this problem?

[00:13](#msg60344896dc108172e7945072)Been slowly building this small experiment:

https://gist.github.com/gltewalt/d3c2afc8ab011a09fc4ce62f409f5730

greggirwin

[02:53](#msg60346e3647585464db971301)Nice work @gltewalt !

[02:55](#msg60346eb44c7921574903e745)Nice experiment too. The output fields get cut off vertically for me, but I eventually got a green light.

[02:56](#msg60346eca7ba8124e5482314b)\[!\[image.png](https://files.gitter.im/57f22e43d73408ce4f2b38c1/aUiL/thumb/image.png)](https://files.gitter.im/57f22e43d73408ce4f2b38c1/aUiL/image.png)

gltewalt

[02:56](#msg60346edc8621811d58949f51)I edited it a bit. It's still shaky, but little by little, I suppose

greggirwin

[02:57](#msg60346f0c93539e2343925e4e)That's how work gets done. Coincidentally, I'm working on something (very) vaguely similar. At least it has `input` and `rule` aspects.

gltewalt

[02:57](#msg60346f0e93539e2343925e5a)The output, or results, can be fixed up to something much better than `text`.

greggirwin

[02:57](#msg60346f2a8031c8234bfb693d)It's a good example of live coding.

gltewalt

[02:58](#msg60346f6edc108172e794b333)And I should? probably use react eventually. I have to start crude and basic and chip away - more like sculpting than designing I guess

[03:00](#msg60346fbe9ba13e72e4490803)The index is interesting to me - showing the index of the next section to match. And `to`, `thru` are returning the same index

[03:00](#msg60346fe2e634904e60b95f1d)Yeah, if you'd release your expirement, everyone would be happy and good to go. (I still like to tinker though)

greggirwin

[03:07](#msg603471599337c51bc6a456b8)Mine isn't for `parse`, so doesn't overlap there. Still some things to work out for it. I chip away as well. Took me a while just to decide what to try, and now I'm on try number 3.

[03:07](#msg6034716a8031c8234bfb6fed)That is, how to present what I want to present.

gltewalt:matrix.org

[03:08](#msg6034719ca8c6a7784828eb95)3rd try is the charm?

greggirwin

[03:08](#msg603471c8a8c6a7784828ebd4)We'll see. I'm sure others will judge and provide feedback.

gltewalt:matrix.org

[03:11](#msg6034725f9337c51bc6a4583b)Do we get a hint?

greggirwin

[03:13](#msg603472d34c7921574903f1f0)Have I \*whetted* your appetite? You know what a \*cut up* I am.

gltewalt:matrix.org

[03:14](#msg6034730e9403f11bb59e94ad)Hmmm

[03:18](#msg603474146825b964d628af1d)linter?

[03:19](#msg603474459403f11bb59e981d)wet is the opposite of DRY

greggirwin

[03:21](#msg603474c39ba13e72e4491829)But \*whet* isn't the same as \*wet\*.

[03:22](#msg603474eca7fc4b573bf0d7dd)And I do have a habit of \*repeating* myself.

gltewalt:matrix.org

[03:36](#msg6034783da8c6a7784828fab0)Sharpening something

[03:37](#msg6034786fa8c6a7784828fae6)Cut/Paste..

[03:37](#msg603478778621811d5894b859)Editor?

greggirwin

[03:37](#msg6034789093539e2343927523)Warmer, then colder. But I've said too much already. ;^)

zentrog:matrix.org

[04:54](#msg60348a9ea37fc1784c3c91fb)I’m thinking ‘split’?

greggirwin

[06:38](#msg6034a2d59403f11bb59f0d24)Well, now the pressure is on. ;^)

rebolek

[06:39](#msg6034a322a8c6a7784829693e)@gltewalt:matrix.org  
&gt; Vscode to gist pasting is giving me issues? Anyone else have this problem?

You can upload to Gist directly from Red console with GitHub API.

GiuseppeChillemi

[07:03](#msg6034a8be8621811d58952fa1)@rebolek how?

zentrog:matrix.org

[07:15](#msg6034ab8da37fc1784c3cea4f)😄🔪

rebolek

[07:50](#msg6034b3dea37fc1784c3d05d6)@GiuseppeChillemi It seems that Github finally killed basic authentication so I need to update Github API to use tokens. So sorry, it’s currently not possible :-D

GiuseppeChillemi

[10:05](#msg6034d3739337c51bc6a55e5a)Please, remember I cannot use networking because of https://github.com/red/red/issues/4791

hiiamboris

[11:50](#msg6034ebff9337c51bc6a5a1a5)@rebolek Gitlab gives me this error lately and asks for a password every time:

```
Unhandled Exception: System.TypeLoadException: Method 'ConfigureAsync' in type 'Microsoft.AzureRepos.AzureReposHostProvider' from assembly 'Microsoft.AzureRepos, Version=2.0.0.0, Culture=neutral, PublicKeyToken=null' does not have an implementation.
   at Microsoft.Git.CredentialManager.Program.Main(String[] args)
```

Tried google-fu, but to no avail. Maybe you have any idea?

rebolek

[15:11](#msg60351b1a93539e2343942c7e)@hiiamboris Gitlab or Github?

hiiamboris

[15:12](#msg60351b694c7921574905bd8c)Gitlab!

rebolek

[15:13](#msg60351b9f47585464db98e8d9)I was confused by the Microsoft mentions :)

hiiamboris

[15:13](#msg60351bb0dc108172e7968a0e)Yeah looks like they host on Azure ;)

rebolek

[15:14](#msg60351bc493539e2343942f11)However I still have Gitlab only in queue and haven’t tried doing their API yet, so sorry, I’m not sure.

gltewalt

[17:21](#msg6035398b47585464db993978)Why do people use gitlab?

rebolek

[17:22](#msg603539d9dc108172e796e801)Gitlab has (had? maybe Github offers then also now) some better free plans, you can install it locally and it isn’t owned by Microsoft :-)

hiiamboris

[17:25](#msg60353a6c726a881d4f930767)Gitlab does not try to force their audience to switch to Chredge browser, for one.

gltewalt:matrix.org

[17:25](#msg60353a8a9337c51bc6a682ef)Never noticed

## Friday 26th February, 2021

gltewalt

[18:35](#msg60393f63d2619a4f2e0c5ebb)https://github.com/gltewalt/tppt

[18:36](#msg60393fa895e23446e4fbf260)I know... pink is probably not the coolest, but it was easy on my eyeballs.  
If you feel like hammering on the script, I'd be happy to hear suggestions.  
Binaries in the bin folder if you're trusting.

hiiamboris

[18:39](#msg6039406595e23446e4fbf438)Uh.. Pink Parse Panther

gltewalt

[18:42](#msg6039410f823b6654d26da9dc)If I use Panther... legal troubles?

[18:42](#msg6039412b457d6b4a948d1617)Chances are low, but I have good luck

hiiamboris

[18:42](#msg6039412ca3a2f04f1fbd9831)Probably ;)

gltewalt

[18:44](#msg603941a9b5131f4f28dbb654)Couple things I need to look up. How to keep console from running when I use the compiled version. Keep all the error messages from filling up console if in interpreted mode. (It reports a bunch because it's constantly checking the parse rul as you type)

hiiamboris

[18:45](#msg603941c044f5a454a43f5cd3)!\[](https://i.gyazo.com/47258633822fb6e1360d93f4a9b461c6.png)  
I had to use parens for init code

gltewalt

[18:48](#msg6039428ad1aee44e2daedbfd)Yep, looks like it

[18:53](#msg603943b2b5131f4f28dbbccc)`c: (charset " abcd") some c`

[18:53](#msg603943b9d71b6554cd0aa52f)should work

[18:53](#msg603943c1457d6b4a948d1db4)same as my console

[18:56](#msg60394455a3a2f04f1fbda18f)You're using GUI console for win? Button looks wonky in your pic

hiiamboris

[19:08](#msg60394732a3a2f04f1fbdaa39)W10 yes

## Sunday 28th February, 2021

gltewalt

[20:15](#msg603bf9cdb5131f4f28e2e7f4)Revamp

[20:15](#msg603bf9ce22a5ce4a9124c805)https://imgur.com/a/zaQ4uJt

[21:40](#msg603c0dc6e8267a46f2e2c650)https://github.com/gltewalt/parse-caddy

[23:33](#msg603c285022a5ce4a91253dc2)Updated to make Windows happy, and a boris line

## Saturday 6th March, 2021

gltewalt

[03:50](#msg6042fbffb5131f4f28f64fac)@greggirwin When is your similar thing coming out?

greggirwin

[04:05](#msg6042ff9cb5131f4f28f6576d)I wish I could say. A good foundation is in place, but progress is slow because I can't shut the rest of the world off.

gltewalt

[04:55](#msg60430b4a95e23446e416883b)24 hours?

greggirwin

[16:05](#msg6043a85c44f5a454a45b61c9)Maybe next week.

Oldes

[21:42](#msg6043f747d71b6554cd2794dd)I was playing with icon file on Windows 10 and found interesting thing... even when I have icon which has sizes 16, 24, 32, 48 and 128 pixels (each image with number, so I can see, which one is used), Windows is everywhere using just scaled version with size 48.

[21:43](#msg6043f78e120cd84f78fb6073)And it does not matter if I have system with scaling 100, 150 or 200%

[21:47](#msg6043f886457d6b4a94a9f150)Ah.. I found used version 24 in file explorer in list view

greggirwin

[21:51](#msg6043f953e5f1d949d48233f1)Interesting. That may be related to why UPXd exes have trouble with the desktop icon for shortcuts.

[21:51](#msg6043f970823b6654d28ab907)I wonder where the higher res versions are used.

[21:53](#msg6043f9bd5d0bfb4e58900225)I found that 128x128 caused the ICO size to balloon but 256x256 and 512x512 didn't. At least with the icon editor I use (Axialis IconWorkshop).

hiiamboris

[22:19](#msg6043fffba3a2f04f1fdacd3d)According to Reshacker you're using PNG only for 256 and 512. Any reason?

[22:19](#msg60440008e562cf54aca31238)It's not that we wanna stay win98-compatible here.

Oldes

[22:20](#msg6044003d5d0bfb4e58901036)Size 512 is only for Microsoft store

[22:21](#msg6044007fd74bbe49e0d9a54d)never mind... now I have icon with sizes 16, 20, 24, 30, 32, 36, 40, 48, 60, 64, 72, 80, 96, 128 and 256, but still see used only 24 and 48... maybe it's in some cache:/

greggirwin

[22:22](#msg6044009dd2619a4f2e29a281)@hiiamboris I'd have to see what the icon app controls are for those options.

hiiamboris

[22:22](#msg604400b0d71b6554cd27ab2b)maybe explorer limits the size to limit the size of the icon cache, @Oldes ?

greggirwin

[22:23](#msg604400ccd74bbe49e0d9a62b)Thanks @Oldes. They didn't add much size, so I thought they \*must* be used for something to make it look better. :^\\

Oldes

[22:25](#msg604401585d0bfb4e5890134c)I should also use icon version made from BMP images, and not PNGs as I have now.. will check later, if the cache will be updated with reboot

[22:30](#msg6044028d5d0bfb4e589015f2)Hm... now I see version 256 as a extra large icons view... even without reboot, and 72 in Tiles view

hiiamboris

[22:32](#msg60440305d2619a4f2e29a807)I think you have to nuke the cache to update it

Oldes

[22:32](#msg6044030722a5ce4a913abc26)so... so far I've seen used only sizes 24, 48, 72 and 256

[22:37](#msg6044042e22a5ce4a913abeb6)and now I see also 32 when I have 100% resolution (very tiny everything on my display)

[22:49](#msg604406e55d0bfb4e58902067)ok.. and version 16 seems to be used in Window title now... :) interesting experiment.. will keep the testing icon for a while to see where is used what:)

greggirwin

[22:49](#msg6044070ad74bbe49e0d9b3bf)Thanks @Oldes. Good info. Sounds like many of them will be used, maybe given enough different environments.

Oldes

[22:50](#msg6044073fe5f1d949d4824ffe)It's new for me, how important is the size 72.. I can see it quite a lot in many resolutions.

[22:51](#msg6044077295e23446e4190aeb)And it looks that Windows must have many different icon caches... because it is changing quite unexpectedly :)

greggirwin

[22:56](#msg60440893e5f1d949d4825392)Somehow I'm not surprised.

## Wednesday 10th March, 2021

gltewalt

[02:36](#msg604830a0d1aee44e2dd6d8d1)Bug...

[02:37](#msg604830d5b5131f4f2803f09d)It grabs the word `i` which points to a field. It will grab other words.  
hmmm

[02:37](#msg604830d622a5ce4a91458a5d)https://imgur.com/a/UeciJPa

[02:54](#msg60483500d2619a4f2e349f9b)compose/deep?

ne1uno

[03:09](#msg60483880823b6654d295b347)that is useful, can load words in rule tab. probably should rename simple words in use by the script.

gltewalt

[03:52](#msg6048427ee5f1d949d48c486d)Yeah, renaming simple words is kind of a way, but no guarantee that non-simple words won't be typed in by a user

[03:54](#msg604842ecd71b6554cd32e038)The only other thing I can think of is some kind of `protect` function that would do nothing if one of the protected words was typed in after `insert` or `change`

[04:42](#msg60484e40823b6654d295f191)Grabs Red words, too. `insert ask` will put `?function?` in the input field

[04:46](#msg60484f34a3a2f04f1fe62405)But that's parse/trace, or parse-trace

```
>> parse-trace [one] [thru word! copy x insert input]
 -->
   match: [thru word! copy x insert input] 
   input: [one]   
   -->
     ==> matched
   <--
   match: [copy x insert input] 
   input: []   
   -->
   <--
 <--
return: true
== true
>> x
== [func ["Wait for console user input"][ask ""]]
```

[04:51](#msg6048504f5d0bfb4e589b6eb3)Seems like I didn't have these issues earlier on. Oh well...

[05:52](#msg60485e9e44f5a454a46780bc):cat:

toomasv

[08:24](#msg60488242d74bbe49e0e45559)

```
x: func ["Wait for console user input"][ask ""]
parse input: [one] [thru word! (answer: x) insert (answer)] input
```

[08:40](#msg604885f6d2619a4f2e357cbd)Ah, better just

```
parse input: [one] [thru word! insert (x)] input
```

## Tuesday 16th March, 2021

gltewalt

[00:19](#msg604ff97b22a5ce4a915b41a2)@greggirwin How do you do a Change Log, like you did for Diagrammar?

greggirwin

[00:38](#msg604ffdeb95e23446e439e17c)I make @toomasv do it. :^) It's a manual process, because we obviously don't want every commit to be in there.

gltewalt

[01:24](#msg605008c1e5f1d949d4a148f8)Oh, manually slogging through

[01:39](#msg60500c4ca3a2f04f1ffc2ae9)make a tool :-)

greggirwin

[01:46](#msg60500e13e5f1d949d4a156bf)Of course, but then we have to figure out how it should work. :^)

## Monday 29th March, 2021

gltewalt

[02:28](#msg60613b596b7b535ee1e2426f)What do you think about 'predicate' functions?

[02:28](#msg60613b69f8add214d8000edb)

```
true?: function [
	"Returns true if the value is not false or none"
	value [any-type!]
][
	either :value [true][false]
]

false?: function [
	"Returns false if the value is false or none"
	value [any-type!]
][
	either not :value [true][false]
]
```

greggirwin

[02:44](#msg60613f096b7b535ee1e2499b)They come up from time to time, but are a tough sell. First, it hides the detail of what truthy values are a bit. More importantly, those words are only 2 of the names for logic that we use in Red. Should they get special treatment, or do we have `[true? false? on? off? yes? no?]` for consistency? What we need are some examples where we all agree they make things clearer, but I don't think that's happened in the past. Subjectivity rules. :^)

Here's how R2 does it:

```
true?: func [
    {Returns true if an expression can be used as true.} 
    value [any-type!]
][
    not not :value
]
```

9214

[02:46](#msg60613f8b679f465566aa1bd8)@gltewalt, `true?: :to-logic`, `false?: :not`.

gltewalt

[02:46](#msg60613f93c1c67842a3f4ce39)Could possibly build them all automagically. Nenad does something like it (building funcs) somewhere in the source - that I looked at in the past

[02:47](#msg60613fb9eb800601df06336d)There we go, even simpler

greggirwin

[02:51](#msg606140cd14188a5edfcf8ae7)Oh man, very nice @9214.

[02:52](#msg606140f8eb800601df063656)The point is not that they're hard to build. On the contrary, they're so easy that what's the point? :^) The question is whether they add value.

gltewalt

[02:53](#msg60614135af65792631b180ea)The same point as `url?`. That's also easy to check without `url?`

greggirwin

[02:54](#msg60614151eb800601df063717)One catch with the quick alias approach is that you can't use them with `unset!`.

gltewalt

[02:54](#msg6061416947b0403241a5e8c4)Good, I hate unset!

greggirwin

[02:55](#msg606141bdf8add214d8001d4e)Totally different than type checking IMO @gltewalt. It's more like `one? two? three? ...`. But what you need to do is make the case for them; show their value.

gltewalt

[02:56](#msg606141c61049fe429b86f3f3)well, hate is a strong word, and they say it's bad for the health

[02:56](#msg606141e71049fe429b86f427)Personal value is that it reads 'better'.

[02:59](#msg6061429e56debe325c49fd85)I couldn't say what the value would be, objectively, to Red users

[03:00](#msg606142d2f8add214d8001fca)Good to see you around @9214

9214

[03:01](#msg606142f3679f465566aa2410)Gee, thanks @gltewalt!

greggirwin

[03:02](#msg60614344cfd0b814eba8fd6e)I was going to say that too but, as usual, he keeps beating me both in time and with better answers. &lt;grrrr&gt;. ;^)

## Friday 30th April, 2021

hiiamboris

[18:07](#msg608c4773ff705616c7650205)Runtime \[profiling](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/raw/master/profiling.red) of code scattered anywhere across the project:  
!\[](https://i.gyazo.com/70605ed966ab4f5ddb72019b5b80c0f7.gif)

toomasv

[19:29](#msg608c5a95c651cb6a0004d9c2)Amazing! :clap:

pekr

[20:13](#msg608c64fb20d4f0263194cec2)Looks good :-)

greggirwin

[22:30](#msg608c84f92cc8c84d8501fe0a):+1:

GiuseppeChillemi

[23:04](#msg608c8cf1d5e2793379e51cd3)Great!

## Wednesday 5th May, 2021

planetsizecpu

[19:43](#msg6092f56e0845c416dcc7084d)Good job!

## Saturday 15th May, 2021

TimeSlip

[01:40](#msg609f26a7617459308f748f56)@hiiamboris Nice work on red-spaces.

[01:41](#msg609f26e6233397424dc2aa15)@pekr Thank you for posting that announcement on FB.

greggirwin

[03:08](#msg609f3b26b10fc85b569867cd)Yes, thanks @pekr !

## Thursday 20th May, 2021

rebolek

[11:57](#msg60a64ea76fe44c28cf23d728)@GiuseppeChillemi I believe this may be interesting to you:

```
>> do %mysql-client.red
#{85A6EF01}
== [
    print "mysql client"
    client: open tcp://192.168.45.162:3306
>> do start
mysql client
epoll_ctl fd: 6 op: 1 evts: -2147483644
events: 1 1
val: 0
=== Client event: connect
connect
socket/recv -1 state: 1028
epoll_ctl fd: 6 op: 3 evts: -2147483643
events: 1 1
events: 1 1
read-io in wait fd: 00000006
read-io in wait: 93
=== Client event: read
read
"client read done"
#{
590000000A352E352E352D31302E322E33312D4D61726961444200AC2F01004F
40327B3534454000FEF72D0200BF8115000000000000070000004E485F263D41
6E277331375F006D7973716C5F6E61746976655F70617373776F726400
}
---
Y....5.5.5-10.2.31-MariaDB.¬/..O@2{54E@.þ÷-..¿...........NH_&=An's17_.mysql_native_password.
---
FLAGS: #{7261332E}
FLAGS: #{81BFF7FE}
make object! [
    length: 89
    seq-id: 0
    type: 'handshake
    payload: make object! [
        server-version: "5.5.5-10.2.31-MariaDB"
        version: 10
        thread-id: 77740
        auth-plugin-data: "O@2{54E@NH_&=An's17_"
        capability-flags: [
            found-rows
            long-flag
            connect-with-db
            no-schema
            compress
            odbc
            local-files
            ignore-space
            protocol-41
            interactive
            ignore-sigpipe
            transactions
            reserved
            reserved2
            multi-statements
            multi-results
            ps-multi-results
            plugin-auth
            connect-attrs
            plugin-auth-lenenc-client-data
            session-track
            deprecate-eof
            remember-options
        ]
        character-set: #{2D}
        status-flags: #{0200}
        auth-plugin-name: "mysql_native_password"
    ]
]
--write--
#{
5000000185A6EF01FFFF00002D00000000000000000000000000000000000000
00000000726F6F740014F9D395DFB289EB584C1217F0C08CEF0400DADDF56D79
73716C5F6E61746976655F70617373776F726400
}
6 00000405 84
iocp/post: 4
queue/push: 1
insert#1
events: 1 1
queue/take: 0
=== Client event: wrote
wrote
socket/recv -1 state: 1029
events: 1 1
read-io in wait fd: 00000006
read-io in wait: 11
=== Client event: read
read
"client read done"
#{0700000200000002000000}
---
...........
---
make object! [
    length: 7
    seq-id: 2
    type: 'ok
    payload: make object! [
        affected-rows: #{}
        last-insert-id: #{}
        status-flags: [
            status-autocommit
        ]
        warnings: 0
        info: none
        session-state-info: none
    ]
]
```

GiuseppeChillemi

[12:39](#msg60a6587f30651c67e81c134a)@rebolek Would you marry me?

rebolek

[12:51](#msg60a65b6777c281623c691e46)No, I’m happy with my wife :)

[12:52](#msg60a65b7202556214c0da2bbb)now with prompt!

[12:52](#msg60a65b7824587f67f8867d5c)

```
mysql> ping
#{010000000E}
6 00000405 5
iocp/post: 4
queue/push: 1
events: 1 1
queue/take: 0
=== Client event: wrote
wrote
socket/recv -1 state: 1029
events: 1 1
read-io in wait fd: 00000006
read-io in wait: 11
=== Client event: read
read
"client read done"
#{0700000100000002000000}
---
...........
---
make object! [
    length: 7
    seq-id: 1
    type: 'ok
    payload: make object! [
        affected-rows: #{}
        last-insert-id: #{}
        status-flags: [
            status-autocommit
        ]
        warnings: 0
        info: none
        session-state-info: none
    ]
]
epoll_ctl fd: 6 op: 2 evts: 1029

*** Runtime Error 1: access violation
*** at: 080D7AE7h
```

hiiamboris

[12:57](#msg60a65ccb24587f67f886815e)epic ending :)

GiuseppeChillemi

[12:59](#msg60a65d3471431f7a08cf255a)I am currently working on SQL-Server via munge, and I am building some high level objects to work with different DBMS using a coherent interface. You work and mine will soon converge.

rebolek

[13:01](#msg60a65dc22af92c7a1fe82ea0)@hiiamboris :) That’s actually intended. It’s probably IO bug (caused by closing the client in the read event) but it helps me to stop the docker container without some unnecessary effort.

hiiamboris

[13:02](#msg60a65ddf30651c67e81c2027)Haha nice :)

rebolek

[13:02](#msg60a65deb2af92c7a1fe82f04)But now that I have a prompt I probably can get rid of it and stop it from prompt.

[13:03](#msg60a65e0d02556214c0da32dc)And report the bug :-D

Respectech

[17:43](#msg60a69fc177c281623c69cf35)@rebolek Awesome!

rebolek

[20:48](#msg60a6cb2924587f67f88796be)@Respectech thanks!

## Saturday 22nd May, 2021

hiiamboris

[18:11](#msg60a94946d0f55b33ba023d04)https://i.gyazo.com/d2bb4c569b7b796fe77bc5f572570dde.png  
flow layouts ☺

[18:15](#msg60a94a2f14d9cd234a5110eb)actually I wish this was the direction taken by VID, layout function being separate from the face creation, so faces could be laid out again at any time (e.g. after resize)

## Monday 24th May, 2021

greggirwin

[20:00](#msg60ac05cb801b07264e68cd43)Nice work @rebolek. :+1:

[20:02](#msg60ac0663d0f55b33ba07f903)Also \*really* nice @hiiamboris. What if we create an `arrange` function that operates on faces? At least to experiment.

hiiamboris

[20:15](#msg60ac097c78e1d6477d61e8a7)Good name. I'll add that to my 400 todos list.

greggirwin

[20:18](#msg60ac0a22a10461235d9871db)You're catching up to me! ;^)

## Tuesday 25th May, 2021

rebolek

[10:39](#msg60acd3f9d0f55b33ba09a903)I’ve been doing some HTTP requests from Red and looking at them with Wireshark and I noticed some funny things:

\* if you do `read http://www.google.com`, `User-Agent` is set to `Mozilla/5.0 (Windows NT 6.1; Win64; x64)` (I am on Mac)  
\* if you do `write/binary http://www.google.com [GET []]`, `User-Agent` is set to `Go-http-client/1.1`

If you set your own `User-Agent` the above values are replaced. I’m not sure what’s going on here :) Can someone confirm it?

[10:58](#msg60acd86bfec22b4786dd30b6)btw, cookie handling added to `send-request`

greggirwin

[18:12](#msg60ad3e2145c2185a5eeca152)Maybe @qtxie can say.

## Monday 21st June, 2021

gltewalt

[23:33](#msg60d121d36c992105fd9159aa)User-Agent on `read` is the same on Linux Mint.

[23:43](#msg60d1242b4e325e6132983655)I seem to have a foggy memory that it's a default when it can't identify the User-Agent. But... it could be a false memory :)

## Tuesday 22nd June, 2021

rebolek

[04:38](#msg60d169458a40b1172820064a)@gltewalt I now know the answer, it's comming from libcurl

gltewalt:matrix.org

[04:39](#msg60d1699b368d0e1d9a1c9fb5)Ah, ok.  
I was WRONNNNNG

rebolek

[04:44](#msg60d16a9c8c12474d8cc6b6ce)the second one. The first one is default set by qtxie :)

## Wednesday 7th July, 2021

greggirwin

[00:01](#msg60e4eedb9cf317173013f1f3)For @Respectech and others who mess with hardware.

https://eighty-twenty.org/2020/09/10/booting-samsung-galaxy-s7-modem

Respectech

[18:57](#msg60e5f9074e325e6132c5437b)Yes, that is pretty standard with cell modems nowadays. Most cell modems actually are a closed system that run a proprietary minimal Linux OS. The Quectel modem in the PinePhone was recently reverse engineered by the open source community to run an open OS firmware as that was the last bit of the phone to be a "binary blob".

[18:57](#msg60e5f91e6c992105fdbe79af)BTW @greggirwin - Have you received your PinePhones yet? If so, have you gotten Red/GTK to run on them yet?

greggirwin

[19:06](#msg60e5fb258a40b117284c7802)I did get the Pine phones, then life got crazy and there they sit. Waiting. Maybe I'll hand one off to @gltewalt:matrix.org to play with. Give me a reason to meet him for coffee. :^)

gltewalt

[23:21](#msg60e636ed457e19611a3e1068)That could be pretty fun setting one of those up. , or very "hair-pully", depending

[23:21](#msg60e636fb110daa37b128bd95):-)

## Thursday 8th July, 2021

greggirwin

[02:49](#msg60e667b0ec10653d5a2aab26)I'm in town for a couple meetings tomorrow @gltewalt. Let me know if you're free before 4:30 or after 7:30. I can do a quick exchange around 6:00 as well.

You have @Respectech on hand, and can then provide more feedback for them too. Good for everyone.

gltewalt:matrix.org

[03:17](#msg60e66e6238da567d828a6d65)Most likely free at some block of time before 4🕓

Respectech

[16:40](#msg60e72a6e23fd26511d9ec51f)I'm going to be driving to Wyoming and then Montana and back to California later this month. Boise is a bit out of the way depending on the route we take home from Montana, but it would be fun to meet up if I could work it into the schedule.

[16:41](#msg60e72ab57473bf3d78146825)I'll be using the PinePhone as my mobile 4G router on the trip. I'll probably use my Pinebook Pro as my main laptop on the trip as it doesn't download stuff without you allowing it to (unlike Windows).

greggirwin

[16:42](#msg60e72b01515cab3e4fa81cbd)Let me know timing and your route when the time comes. Would be great to see you.

Respectech

[16:50](#msg60e72cc967b72e1bfefe6708)Looks like it is 45 hours of road time if we bypass Boise, and 46 hours if we go through Boise. I'll see if I can sell Rosemary on the idea of an extra hour on the road. ;-p

greggirwin

[16:54](#msg60e72dd3049a0c3e53617145)I can come to you as well, if it's not too far. We can talk more privately.

gltewalt:matrix.org

[18:00](#msg60e73d4ad2556414f552d3a5)Tell her it's too far without nice services If you cut across to end up in Eastern Idaho

[18:02](#msg60e73da723fd26511d9ef6d1)Or it's better to cut down from boise area and go through Reno

[18:02](#msg60e73dcad2556414f552d4cc)You always wanted to race down Donner pass

greggirwin

[18:26](#msg60e74360f2b4077d6bb709e6)Everybody should see Winnemucca at least once. Or is it at most once?

Respectech

[18:31](#msg60e744677b5a415e65d573a3)Well, none of that will work with her. She's been all over multiple times. We've been to Winnemucca (and most other Nevada cities, especially on Hwy 50 and I-80) dozens of times. I joke and tell her she should be a long-haul trucker because of how much she drives, and how good she is at doing long stretches.

gltewalt:matrix.org

[18:31](#msg60e74476049a0c3e5361ab23)They used to have a great breakfast place along the business route. But it had been 11 years

Respectech

[18:31](#msg60e74479f2b4077d6bb70c68)But that also works in our favor, because she doesn't mind an extra hour on the road if it fits in the schedule.

gltewalt:matrix.org

[19:54](#msg60e757e9515cab3e4fa892f1)@greggirwin I have between right now and four something.  
Maybe another block after 7

pinephone:matrix.org

[23:12](#msg60e7866aec10653d5a2d55c2)pine phone, but it might be awhile to figure out Red android

## Friday 9th July, 2021

Respectech

[00:04](#msg60e79293951c58084ecae31b)PinePhone runs Linux, not Android.

[00:04](#msg60e7929af2b4077d6bb7c016)Well, it CAN run Android, but that's not the target.

[00:05](#msg60e792c97b5a415e65d630d7)So PinePhone will run Linux ARM, like Mobian, Ubuntu Touch, Nemo, Sailfish, etc.

[00:06](#msg60e792ebf1274d5e503a6ee7)PinePhone can also run Anbox on Linux, so some Android apps are also available through that compatibility layer.

gltewalt:matrix.org

[00:19](#msg60e79616f2b4077d6bb7c6fe)Yeah not sure why I typed android

Respectech

[00:22](#msg60e796ac7b5a415e65d6390b)BTW, I'll probably be coming through Idaho on July 26th.

gltewalt

[01:00](#msg60e79fba48f9b1084a1d082d)manjaro

gltewalt:matrix.org

[01:56](#msg60e7accdec10653d5a2da676)Might be a challenge with manjaro on the phone

Respectech

[17:42](#msg60e88a81515cab3e4fab4e19)Be forewarned that the PinePhone has a very low-end quad-core processor, so it will be a good opportunity to work on code optimization. :-)

rebolek

[18:15](#msg60e89239d2556414f555e3a2)quad-core? I'm using Red on rPi zero, so quad-core is like Cray compared to it :-)

greggirwin

[18:20](#msg60e89366049a0c3e5364ab1d)One of my thoughts is that playing with gestures, cameras, and a phone environment will help flush out issues we can address sooner, so they're solved for Android when we do that update.

gltewalt:matrix.org

[18:22](#msg60e893ef82dd9050f5e0f2dd)First issue, manjaro arm has no 32bit stuff. (That I can tell)

\*goes to see if there's an ARM branch*

Respectech

[18:52](#msg60e89ad17b5a415e65d8902d)Yes, the PinePhone is quite a bit more powerful than the Pi Zero.

[18:54](#msg60e89b7123fd26511da22d53)The 32-bit thing could be a challenge. I was finally able to get Red to run on my Garuda 64-bit Intel Arch Linux system - which was more of a challenge than I thought. I am running some encapped Rebol2 programs on Garuda as well, but I'm doing that through Wine. That works surprisingly well.

gltewalt:matrix.org

[19:52](#msg60e8a8fc7b5a415e65d8b15c)It came with this dongle that has USB, hdmi and ethernet. I can use a keyboard to type in the terminal out of the box.  
Can I install a different distribution from USB or does it have to be a flash via SD card?

pinephone:matrix.org

[20:20](#msg60e8af9682dd9050f5e13835)🐑

greggirwin

[20:54](#msg60e8b77248f9b1084a1f88c2)I don't know what the sheep means, but that's very cool about using a keyboard so easily.

gltewalt:matrix.org

[21:01](#msg60e8b90f951c58084ecd8e4d)Yes I was surprised, but it picks it up right out of the box

Respectech

[21:44](#msg60e8c338ec10653d5a3037fe)I believe you have to use a microSD to boot into a different distro. But you don't have to flash that image to the eMMC, so it makes it really easy to try different distros.

[21:45](#msg60e8c3747b5a415e65d8f3fc)Regarding 32-bit/64-bit, Box86 / Box64 may be useful as they are made for ARM Linux distros: https://box86.org/

## Thursday 15th July, 2021

TimeSlip

[17:25](#msg60f06f9982dd9050f5f22f8f)@greggirwin "so they're solved for Android when we do that update." A major teaser, you are!

## Saturday 31st July, 2021

gltewalt

[20:31](#msg6105b33eb8422d6f4f17b158)Vaporware?

https://imgur.com/a/ROBd2Jm

greggirwin

[21:30](#msg6105c0f19e84ba381e4def52)I still like this one: https://www.youtube.com/watch?v=y3RIHnK0\_NE

## Sunday 1st August, 2021

TimeSlip

[05:37](#msg6106330ed8381a2a83a24e38)@greggirwin Great.

## Tuesday 3th August, 2021

planetsizecpu

[13:12](#msg610940a24b7707158f61d6d9)Amazing @greggirwin 😄

## Sunday 12nd September, 2021

gltewalt

[17:36](#msg613e3aa84c7be06b79b429fe)@hiiamboris Which glob of docs did you like to use? I forget.  
(link)

hiiamboris

[18:13](#msg613e4364fd7409696e09b6af)Glob of docs?

gltewalt:matrix.org

[18:16](#msg613e440963dca81891570d8a)The docs for red that you prefer to reference

hiiamboris

[18:19](#msg613e44cc99b7d97528074e1c)I don't use any tools if that's what you mean

gltewalt:matrix.org

[18:20](#msg613e450567e789189cf46b63)No I mean the docs with the sidebar menu

hiiamboris

[18:22](#msg613e456c13ac9b6b83c6c03a)I guess your question points so far out of my cache, that I still have no idea what you're asking about ☻

gltewalt:matrix.org

[18:24](#msg613e45e44c7be06b79b43f58)You were using an alternate website that had at least some of the official red docs on it. Weren't you?

hiiamboris

[18:43](#msg613e4a497cd57813a8bfbcff)Ah.

[18:43](#msg613e4a52f428f97a9f81405b)http://w.red-lang.org/ ?

[18:44](#msg613e4a867cd57813a8bfbd4e)It's probably the official site now that the other one is down.

gltewalt:matrix.org

[18:46](#msg613e4aec4c7be06b79b448a6)That's it. Couldn't remember it for the life of me.

hiiamboris

[18:46](#msg613e4b2313ac9b6b83c6cbcb)Right :) So many disparate resources...

greggirwin

[19:54](#msg613e5ae11179346966131889)Which other one is down?

hiiamboris

[20:42](#msg613e662113ac9b6b83c7009b)doc.red-lang.org

## Monday 13th September, 2021

greggirwin

[01:43](#msg613eacc167e789189cf53781)Ah, right. I've been back to direct github viewing for so long I forgot.

## Saturday 25th September, 2021

toomasv

[09:12](#msg614ee7ea99b7d975282bf475)I played with idea Oldes presented in /red room :point\_up: \[September 22, 2021 9:11 PM](https://gitter.im/red/red?at=614b71d15b92082de1b754ee):

```
make-block: function [data /all /with selection [word! block!]][
	if word? selection [selection: to-block selection]
	either any [
		accessors: select system/catalog/accessors type?/word data 
		system/words/all [
			url? data 
			data: decode-url data 
			accessors: words-of data
		]
	][
		either selection [
			if not empty? weird: exclude selection accessors [
				cause-error 'user 'message rejoin ["make-block: Unknown accessor" pick [": " "s: "] single? weird weird]
			]
		][
			selection: accessors
		]
		collect [
			foreach sel selection [
				if all [keep to set-word! sel] 
				keep switch/default type?/word d: data/:sel [
					word! [to-lit-word d] 
					path! [to-lit-path d]
				][d]
			]
		]
	][
		if any [all with][
			cause-error 'user 'message rejoin ["make-block: Data of type `" mold type? data "` does not have accessors!"]
		]
		append copy [] data
	]
]
```

It helps to work with data that have accessors (date, email, event, image, pair, time, money) + url, including also the idea of `query/mode`. For other data it just en-blocks it.  
E.g.:

```
make-block 3x2
;== [3 2]
make-block/all tom@est.ee
;== [user: "tom" host: "est.ee"]
make-block/all url: https://tom@www.est.ee?q=me
;== [scheme: 'https user-info: "tom" host: "www.est.ee" port: none path: none target: none query: "q=...
vars: [query user-info host]
;== [query user-info host]
reduce make-block/with/all url vars    ;Careful -- modifies global query
;== ["q=me" "tom" "www.est.ee"]
reduce vars
;== ["q=me" "tom" "www.est.ee"]
make-block "hi"
;== ["hi"]
to-block "hi"
;== [hi]
```

Might also add accessors for other types, e.g. `file`, into `either any [...]` block:

```
system/words/all [
	file? data
	accessors: [path name suffix modified]
	data: object [
		path: 
		name: none
		set [path name] split-path data
		suffix: suffix? data
		modified: query data
	]
]
```

E.g.:

```
make-block %abc/def.red
;== [%abc/ %def.red %.red none]
make-block/all %entities.red
;== [path: %./ name: %entities.red suffix: %.red modified: 19-Dec-2018/21:08:35.815]
```

greggirwin

[17:11](#msg614f584d5b92082de1c01a16):+1:

## Sunday 31st October, 2021

toomasv

[09:24](#msg617e60e58c019f0d0b691ba5)@hiiamboris Any idea why closing mark of

# is eaten here: `print rejoin morph read %morph.md do %md.scan [<h1> 'h1 </h1> lf (<h2> 'h2 </h2> lf ...)] <h1[MORPH DSL - A dialect for efficient local series conversion](morph.red)</h1> <h2>Status</h2> <h2>Goals</h2> <h2>Origins</h2> <h2>Examples</h2> <h2>Data model</h2> <h2>How it works</h2> <h2>Scanner type rules</h2> <h2>Emitter type rules</h2> <h2>Default rule dictionaries</h2> <h2>Partial update logic</h2> <h2>Further considerations</h2>` with `md.scan` as `Red [] context [ line: [not lf skip ...] return [ "# " h1: line | "## " h2: line | sub: [not "## " [line lf] ...] | skip ... ] ]`

hiiamboris

[09:30](#msg617e62522197144e8499d31f)what do you mean by 'eaten'?

toomasv

[09:31](#msg617e626498c13e7550094827)

`hiiamboris 09:31ah 09:35 >> rejoin [<h1> {x} </h1>] == <h1x</h1>> 09:35I guess you need to add "" to rejoin 09:36or morph/into ... "" toomasv 09:40Ah, ok, thanks!`

`Tuesday 2nd November, 2021 hiiamboris 10:59@toomasv of note, morph is now tested to be able to convert files from one format into another: https://gitlab.com/hiiamboris/icu toomasv 11:07Great, thanks! I'll have to study it... Wednesday 3th November, 2021 rebolek 12:25cool profiler https://github.com/csurfer/pyheatmagic pekr 13:57Aren't we getting some kind of profiler with the upcoming Interpret events branch? greggirwin 15:25@pekr, yes. GaryMiller 18:37What is the interpret events branch? greggirwin 18:38Instrumentation added to the interpreter for profiling, debugging, and more. Info coming soon. GaryMiller 20:12Sounds Good! 20:13It will help with those missing ] that are so hard to find sometimes! hiiamboris 20:14https://gitlab.com/hiiamboris/red-cli/-/tree/master/mockups/bmatch @GaryMiller`
