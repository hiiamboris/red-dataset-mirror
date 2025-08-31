# Archived messages from: [gitter.im/red/red/welcome](/gitter.im/red/red/welcome/) from year: 2021

## Thursday 7th January, 2021

JohnBlood\_gitlab

[17:24](#msg5ff743b091e9b71badc07313)Hi. I've been trying to learn how to program for a while, but always seem to get busy with something else. I just recently stumbled upon REBOL and then Red. Would Red be a good first language would you recommend learning something else first?

Red-Beginner

[17:52](#msg5ff74a5efb85d46e04c9a2db)I'm not sure. Maybe python or lua would be better. There are less document on Red/Rebol for beginners.

toomasv

[18:00](#msg5ff74c2103529b296bd6b683)@JohnBlood\_gitlab Sure it is good for first language too, and it is probably easier to learn as first language than as tenth. :)

gltewalt

[18:01](#msg5ff74c78cd31da3d9a9a0fd0)Rebol has plenty of tutorial material.

[18:01](#msg5ff74c7dfb85d46e04c9a8c2)http://business-programming.com/business\_programming.html

[18:01](#msg5ff74c8b81c55b09c7f31983)https://easiestprogramminglanguage.com/easiest\_programming\_language.html

[18:04](#msg5ff74d41252c0a6dedf6ef14)Red has a lot of people who are friendly and will try to help you along. If you decide to stick with programming you will end up learning about more than one language over the years

[18:28](#msg5ff752e4d5f4bf2965d0e4f5)Have you tried any languages, or just looked around?

greggirwin

[19:04](#msg5ff75b2c91e9b71badc0b47f)Welcome @JohnBlood\_gitlab! It won't hurt you to try Red, but you should also try other languages. One of them may click in your head more than others. It also depends on your OS preference and what kind of programs you want to write. If you're on Windows and want to write GUI apps, I don't know what else comes close to Red. If you're on Mac, note that we're 32-bit only so won't run on Catalina. Older versions of OSX are fine.

If you try other languages first, don't let them turn you off of programming if you don't like them. Red is like BASIC or Logo from earlier days of computing, making it more accessible for exploration and learning. Other langs very much expect you to be, or want to be, a full time programmer. Not everyone needs to do that. It's a good thing to learn \*something* about, and see if you like it.

A nice thing about Red is that you can just drop the exe on your system and you're good to go. Use the automated build, not the old "stable" version which is quite out of date for fixes and features now.

The first time you run Red, it will compile a local console you can play in, so be a little patient. Startup should be instant after that.

JohnBlood\_gitlab

[20:23](#msg5ff76db0787d8f79c8e9f0e0)&gt; I'm not sure. Maybe python or lua would be better.

@Red-Beginner I am working to learn Lua to make games with Love

[20:23](#msg5ff76ddddc2e4809aa0a6730)&gt; Have you tried any languages, or just looked around?

@gltewalt I've looked at Ruby, Python, and BASIC.

[20:26](#msg5ff76e5c787d8f79c8e9f1f6)@greggirwin I downloaded and ran the "stable" version. If I run the latest automated build, will it cause an issue?

greggirwin

[20:28](#msg5ff76ed59632f63d87023542)No issues at all. It should build you a new console (in %Programdata/Red/ on Windows) and you're all set.

## Friday 8th January, 2021

planetsizecpu

[08:18](#msg5ff8155081c55b09c7f51031)Welcome @JohnBlood\_gitlab hope you like programming &amp; Red 😉

JohnBlood\_gitlab

[18:50](#msg5ff8a9934498e01bbf962852)@planetsizecpu Here's hoping

gltewalt

[19:32](#msg5ff8b3479632f63d87057538)@JohnBlood\_gitlab @JohnBlood\_gitlab made a game with Red if youre interested in game making

greggirwin

[19:45](#msg5ff8b674fe007479e4fd0d2c)I think @gltewalt means @planetsizecpu made a game. Gitter does that to me as well, selecting a ref I didn't want. I have to catch it frequently.

[19:46](#msg5ff8b69ed5f4bf2965d484c7)@planetsizecpu is your chat on that mainly in red/sandbox? And where can people download it if they want to play? I haven't in some time, sadly. :^(

gltewalt

[21:28](#msg5ff8ce77d5f4bf2965d4c297) Yes, I thought the second name was @planetsizecpu. oops

[21:29](#msg5ff8cea4fe007479e4fd4eac)https://github.com/planetsizecpu/Cave-In

## Saturday 9th January, 2021

planetsizecpu

[13:40](#msg5ff9b23efb85d46e04cf8873)@gltewalt Thanks for be hands on! @greggirwin I do chat about the game on \[gui-branch](https://gitter.im/red/red/gui-branch) and the code is ready on the link @gltewalt wrote 👌

## Wednesday 13th January, 2021

ams02468

[23:46](#msg5fff8660dc2e4809aa1e9f71)Does red language support email sending to smtp server?

## Thursday 14th January, 2021

greggirwin

[00:47](#msg5fff949e4498e01bbfa73cd6)Not yet. That will come after full I/O and ports in 0.7.0.

Sergey\_Vladivostok\_gitlab

[05:24](#msg5fffd59c4498e01bbfa7d4a1)Sorry for the off-topic question. Where is it possible to get/buy a license key (file license.key) for Rebol/SDK. on the site http://www.rebol.com/cgi-bin/feedback/post2.r is not responding. Where can I look/ask more? Google isn't helping.

rebolek

[11:09](#msg60002661252c0a6ded0ce24f)@Sergey\_Vladivostok\_gitlab I'm afraid it's not possible anymore.

[11:09](#msg600026789632f63d8717bd89)What do you need it for?

Sergey\_Vladivostok\_gitlab

[12:14](#msg60003599252c0a6ded0d0b11)@rebolek many reasons, for example  
1\) I really like the technology, I want to "touch" it all.  
2\) Compile scripts  
3\) Use encryption (http://www.rebol.com/docs/encryption.html)  
4\) Perhaps I can solve the problem with access to sites via SSL3, for example

```
>> read https://gitter.im/red/red/welcome
** Command Error: SSL Error: error: 14077410: SSL routines: SSL23_GET_SERVER_HELLO: sslv3 alert handshake failure
** Where: build-port
** Near: system / words / set-modes port / sub-port [secure: true]
>>
```

P.S. If could get some more code AltME, Rebol/IOS etc. the sale of these products is no longer carried out, but they are of great academic interest, and can become a great textbook.

rebolek

[13:04](#msg6000414214cec811ec9a245b)@Sergey\_Vladivostok\_gitlab  
1\) I understand that :-)  
2\) If you mean Red scripts, you don't need SDK for compilation. Free Rebol is enough. I can give you the details, it's really easy. If you mean Rebol scripts, SDK doesn't really compile them, just bundles then together with an interpreter.  
3\) That's Rebol's encryption which was last updated about ~10 years ago, Red doesn't have all the stuff yet, but it's getting there.  
4\) Again, are you talking about Red or Rebol? Rebol hasn't been updated in ~10 years and SDK license won't help you with stuff that's newer than 2010 or so (TLS 1.x for example) . Rebol can't and won't deal with it, sorry. OTOH Red can, be it in the current version or with the comming full IO.

## Friday 15th January, 2021

Sergey\_Vladivostok\_gitlab

[05:37](#msg60012a169632f63d871a8718)@rebolek Unfortunately, Red has not yet reached some of the Rebol2 capabilities that I need at the moment. It seems to me incorrect to talk about the obsolescence of technologies and the Rebol2 platform. About SSL - if Red is written in Rebol (I could be wrong), then theoretically i can take the required part and use it...

pekr

[07:07](#msg60013f465562a61e9aa82ef8)Red is absolutly not written in Rebol. It works like that - Red gets compiled down to intermediate Red/System code. Then Rebol is used to compile it down to the native code for particular target platforms. The code is agnostic, which means you can use Win OS to compile down to Linux or OS-X.

[07:09](#msg60013fa214cec811ec9cca51)Sure, it is kind of written in Rebol, but that absolutly does not mean, it shares any of the Rebol shortcomings. Simply put - Red has https, security is going to be done to modern / recent terms. You can't fix Rebol 2, as it is long time abandoned, not anymore updated, and closed source. So Rebolek is absolutly right with his remarks.

rebolek

[07:10](#msg60013fef99549911fc22ac01)As @pekr wrote, only Red's compiler is written in Rebol. Red's SSL is not dependent on Rebol in any way.

[07:10](#msg60013ffe99549911fc22ac31)@Sergey\_Vladivostok\_gitlab what Rebol capabilities do you miss in Red?

pekr

[07:11](#msg6001401f99549911fc22ac74)Is Red on par with R2? Well, not yet. The UI might have better foundation, security is better, for me, GUI console is better, what we miss is IO and related stuff - useful protocols as email, ftp, odbc, mysql, etc.. Looking at the state of IO, I would say that we might be close to being merged into mainline. Sure - can't say when it happens.

Sergey\_Vladivostok\_gitlab

[07:44](#msg600147dc4498e01bbfabba81)@rebolek IO ( https://gitter.im/red/red/welcome?at=5fe72fcbe7f693041f32079a )

@pekr Rebol2 is long time open source (https://github.com/rebol/rebol) on Apache License 2.0... Or im wrong?

rebolek

[08:02](#msg60014c3191e9b71badd99cba)@Sergey\_Vladivostok\_gitlab I see. The IO branch is fortunately getting very usable so let's hope it will get merged soon.

[08:03](#msg60014c3991e9b71badd99cc3)Rebol 3 is open source, not Rebol 2.

Sergey\_Vladivostok\_gitlab

[08:07](#msg60014d4fe578cf1e95ec616a)@rebolek Got it. Sorry, I misled the "Version: 2.101.0" in README

rebolek

[08:08](#msg60014d725562a61e9aa85489)Yeah, that was versioning for alpha releases, it started at 2.99 IIRC.

## Sunday 17th January, 2021

Slownite

[01:30](#msg60039343252c0a6ded158f07)Hi everybody, it’s a beginner question but how can you load a csv file in red? Thank you for your help

dsunanda

[01:41](#msg600395ca03529b296bf52bcb)@Slownite Welcome! - Yes, you can use LOAD-CSV, eg

```
data: load-csv %my-file.csv
```

Try help load-csv in the console to find the options - eg if you need a non-standard field separators.  
Here's loading a CSV file held in a string to a block, with ";" as field separator:

```
load-csv/with {a;b^/c;d} ";"
== [["a" "b"] ["c" "d"]]
```

Slownite

[01:50](#msg600397d003529b296bf5316b)Thank you!

dsunanda

[01:52](#msg60039843e578cf1e95f1ecee)And there is some documentation on it - https://github.com/red/red/wiki/CSV-codec

Slownite

[02:05](#msg60039b829632f63d87207766)thank you very much @dsunanda

greggirwin

[02:50](#msg6003a5fb14cec811eca2cb0f)You can use `load`, and the codec will be applied automatically based on file extension. If you use a different extension, you can use `load/as`. The codec uses `load-csv` internally but doesn't support `file!` arguments directly. Just a small typo in @dsunanda's example.

[02:51](#msg6003a63e81c55b09c711f465)So `load %file.csv` is like doing `load-csv read %file.csv`

Slownite

[15:58](#msg60045ea899549911fc2a1850)Oh I see thank you!

## Tuesday 19th January, 2021

GiuseppeChillemi

[20:39](#msg600743692cb18a437c2b6db4)@Sergey\_Vladivostok\_gitlab I would also access Rebol SDK and IOS from very long time. I would like to learn from it and maybe, one day, do something similar in Red but I can't.

[20:39](#msg6007438bd8bdab473947c651)@toomasv  
&gt; \[!\[HNRY](https://toomasv.red/images/Misc/HNRY.gif)](https://toomasv.red/images/Misc/HNRY.gif)

I have not see it, nice, great!

## Wednesday 20th January, 2021

toomasv

[04:19](#msg6007af5c004fab474151e2b7):)

Slownite

[15:00](#msg6008458136db01248a8e21f1)Hi everybody, does Red have a function to write from blocks to csv (the opposite of load)?

dsunanda

[15:06](#msg600846ee6244ee14509ee364)@Slownite Yes - to get it as a string, with various formating options:

```
to-csv/with [[1 2 3] [4 5 6]] tab
```

To save direct to a file with default options:

```
save/as %my-file.csv [[1 2 3] [4 5 6]] 'csv
```

use HELP TO-CVS to find all the options

Slownite

[15:07](#msg600847196244ee14509ee3a6)@dsunanda thank you very much !

greggirwin

[19:10](#msg6008803e36db01248a8ece1c)If you use %.csv as the file extension, you don't even need `/as`.

```
>> save %temp.csv [[1 2 3][4 5 6]]
>> read %temp.csv
== "1,2,3^/4,5,6^/"
```

But if you're saving to, e.g., a string, you need to:

```
>> csv-str: copy ""
== ""
>> save/as csv-str [[1 2 3][4 5 6]] 'csv
== "1,2,3^/4,5,6^/"
```

Red lets the user control things with `/as` but if you do `source save`you can see that it uses the extension for files and URLs. `Load` works the same way, but uses the mime-type for URLs.

## Thursday 21st January, 2021

innitheblindsw

[02:38](#msg6008e9173855dd07fd6a4127)Gr

[02:38](#msg6008e928cf8b82773443c1fe)Greetings from Cuba

greggirwin

[02:53](#msg6008ecbb8816425540dd6724)Welcome @innitheblindsw !

## Friday 22nd January, 2021

Slownite

[23:17](#msg600b5d26cf8b8277344a4f63)Hello everyone, I try to do an interface for drawing plot and other stuff, for this I would like to create a window with a base of the size of the window and I want it to be able to resize the base when the window resize but I didn't find any way to programmatically have the size of the window, is it possible to have it programmatically?

greggirwin

[23:29](#msg600b5ff7d8bdab473952e393)

```
main-lay: [my-base: base 400x400 red]
view/flags/options main-lay [resize] [
	actors: object [
		on-resizing: function [face [object!] event [event!]][
			w: face
			my-base/size: w/size - 20
		]
	]
]
```

Slownite

[23:32](#msg600b60a3a2354e44aca00710)oh ok thank you very much !

greggirwin

[23:39](#msg600b6229004fab47415bd1f6)You bet. https://github.com/red/docs/blob/master/en/view.adoc#event-names lists all the events. For windows rather than faces, it's just a bit more involved to set up the actors.

## Saturday 23th January, 2021

tinulac-leinad

[10:16](#msg600bf78e410c221440198111)Hi All,  
3 question on this code that I cant figure the way to resolve...  
questions in the code after ;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;  
Many thanks for help ans answers,  
Daniel

```
w: layout [
  title "Sets Lists Tools"
  size 1200x850
  across

  list-of-tunes: text-list 585x400 data [
                  %test1.png
                  %test.png
                ] 
               on-up [
                  path: to-file rejoin [D_TMP pick face/data face/selected]
                  img: to-image load path
                  ns: reduce [new-size 585x400 img/size]
                  prin img/size prin " - " prin path prin " - " print ns ; <<<<<<<<<<<<<<<< 1) one mouse Up, printed 2 times ?
                  the-score: image ns to-file path  ; <<<<<<<<<<<<<<<<<<<<<<<<< 2) dont works. mabe with actor ? But how ?
                                                                                    ; <<<<<<<<<<<<<<<<<<<<<<<<<      in view [  the-score: image ns to-file path ] that works fine
                  print "---------------------------------------------------" ; <<<<<<<<<<<<<<<<<<< never printed as long de previous line is is not commented (logical :)
                ]

  tp: tab-panel bold 585x400 [
    "partition " [
      the-score: image 200x200 %music.png react [face]

		]
	]
]

w/menu: [
  "Fichiers" [
    "Fichiers ABC" [
      "Create PDF" to-pdf
      "Create incipit PDF" incipit-pdf
    ]
    ---
    "Quit Ctrl-Q" kwit
  ]
  "Aide"[
    "A propos" about-help
  ]
] 

w/actors: context [
  on-close: func [face event][ save-data]
  on-key: func [face event][  ;<<<<<<<<<<<<<<<<<<<<<<<<<<< 3 ) All reactors works but  on-key not ?
    print reduce event/key     ;<<<<<<<<<<<<<<<<<<<<<<<<<<< I have tested few samples that works fine and I don't understand why not here...
		switch event/key [
		"^Q"  [
			      save-data
                             quit
		      ]
		]
	]
  on-menu: func [ face event][
    if event/picked = 'to-pdf [
      abc-to-pdf request-file/title/file/filter
      "Select ABC Files "
      D_SOURCE_ABC_FILES
      ["ABC Files " "*.abc"]
    ]
    if event/picked = 'incipit-pdf [
      incipit-abc-file request-file/title/file/filter
        "Select Abc File"
        rejoin [D_SOURCE_ABC_FILES %*.*]
        ["ABC Files " "*.abc"]
    ]
    if event/picked = 'about-help [
    ]
    if event/picked = 'kwit [
      save-data
      quit
    ]
  ]
]
view  w
```

Thanks again if you have some light for me ;)

[21:25](#msg600c942f8816425540e6cbbb)about my previous post  
For my first question: for each clic on an Item in the list the action is executed 2 times ? Curious ?  
For the question 2 I get some result if I use draw replacing  
the-score: image ns to-file path  
By  
do \[the-score: base 585x400 draw \[image img]]  
and in the tp panel the-score: image 200x200 %music.png changed with the-score: base 585x400 draw \[image img]  
That work but ...  
I hope I have to deal with draw and rate function ... calling something like that :

```
update-the-score: func [] [     
  the-score/draw:  img
]
```

calling this function here :

```
tp: tab-panel bold 585x400 [
    "partition " [
      the-score: base 585x400 rate 4
      on-time [update-the-score]
]
```

The question 3 is more enigmatic for me... why my key events are not picked ?

Apologies for my ... bad English.

greggirwin

[23:16](#msg600cae6acf8b8277344d5dd9)@tinulac-leinad no need to apologize for your English. But with references to files we don't have, we can't run your code to help debug. If you put it all in a gist, or better yet reduce the code to a minimum example, you may get more help.

[23:20](#msg600caf4897132e2480fd20cc)I can remove the missing image facet, making it just a color, but then I still can't quit the app.

[23:25](#msg600cb05dd8bdab473955f454)I also don't see \*any* output in the console when interacting with it.

[23:27](#msg600cb0d5dfdbc1437faa7ab3)Ah, because you're loading those files in the list and they don't exist for me. This is another case of errors being silently eaten in View. https://github.com/red/red/issues/4784

## Sunday 24th January, 2021

tinulac-leinad

[00:46](#msg600cc34acf8b8277344d8884)@greggirwin Oh, yes, sorry, it is just a a part of my code and it can(t run ....  
I resolved a part of my problems with :  
tp: tab-panel bold 585x400 [  
"partition " [  
the-score: box 585x400 draw \[] rate 25  
on-time \[update-the-score]  
]  
]  
.......  
update-the-score: func \[] [  
the-score/draw: \[image img]  
]  
selection in the list give an image in the-score : perfect.  
Slowly, thing take a place in my old poor head :)  
the more curious thing for me now i the raison the on -key event don't picked, I try to reproduce it in a small sample but unfortunately all my small samples works fine....  
Your help and kindness is really appreciate, it is an encouragement to continue learning Red and at each step I am cmnforted that the solution is always concise and clear...With some efforts and doubts at learning time...

greggirwin

[02:51](#msg600ce0afd8bdab4739565846)Glad you got it working. :+1:

tinulac-leinad

[19:48](#msg600dceff2cb18a437c3c05c6)On-key... curious thing (for me ;) )  
a simplified code (can run with no extra dependencies)  
The first code works but on-key as no effect

```
Red [needs: view]
w: layout [ 
title "Sets Lists Tools"
  size 1200x850
  across

  tl-tunes: text-list 585x400 data [
                  %test1.png
                  %soggys.png
                  %test.png

                ]
  tp: tab-panel bold 585x400 [
    "partition "[
      t;- he-score: box 585x400 draw [] rate 25
      ;- on-time [update-the-score]
      print "some test"
		] 
	]
]
w/menu: [
  "Fichiers" [
    "Fichiers ABC" [
      "Create PDF" to-pdf
      "Create incipit PDF" incipit-pdf
    ]
    ---
    "Quit Ctrl-Q" kwit
  ]
  "Aide"[
    "A propos" about-help
  ]
]

w/actors: context [
  on-close: func [face event][ print "closed"]
  
  on-key: func [face event][
    probe event/key
		switch event/key [
		#"^Q"  [     
            quit
		      ]
		]
	]
   on-menu: func [ face event][
    if event/picked = 'to-pdf [
      print "ABC fil selected"
    ]
    if event/picked = 'incipit-pdf [
      print "incipit selected"
    ]
    if event/picked = 'about-help [
        print "About seleted"
    ]
    if event/picked = 'kwit [
      quit
    ]
  ]
]
view w
```

And the same code with a very simple layout works fine ....

```
Red [needs: view]
w: layout [ area 100x100]
w/menu: [
  "Fichiers" [
    "Fichiers ABC" [
      "Create PDF" to-pdf
      "Create incipit PDF" incipit-pdf
    ]
    ---
    "Quit Ctrl-Q" kwit
  ]
  "Aide"[
    "A propos" about-help
  ]
]

w/actors: context [
  on-close: func [face event][ print "closed"]
  
  on-key: func [face event][
    probe event/key
		switch event/key [
		#"^Q"  [     
            quit
		      ]
		]
	]
   on-menu: func [ face event][
    if event/picked = 'to-pdf [
      print "ABC fil selected"
    ]
    if event/picked = 'incipit-pdf [
      print "incipit selected"

    if event/picked = 'about-help [
        print "About seleted"
    ]
    if event/picked = 'kwit [
      quit
    ]
  ]
]
view w
```

[20:08](#msg600dd3b9cae490555f65fa8a)@tinulac-leinad @greggirwin  
oh ! is it impossible to have an actor for keyboard events without an editable element in the layout ?

## Monday 25th January, 2021

Slownite

[16:40](#msg600ef49acae490555f68c060)Hi everybody, I would like to display the content of a csv file in a table in red GUI system how can I do that? thank you for your help

greggirwin

[16:43](#msg600ef547a2354e44aca87a45)We don't have a table/grid style yet. It's a big cross-platform design space. :^\\ But others can probably jump in and point you to experiments done with read-only displays, using `draw`.

Slownite

[16:45](#msg600ef594004fab4741644a3a)ok thank you @greggirwin !

tinulac-leinad

[18:05](#msg600f08828816425540ecacc8)Hello,  
I have create a script close to two thong, key events and change one image from buttons.  
The script use draw ... rate to refresh the image.  
All works but:  
\- the key event need a mall area that keep focused : ok but is there a better solution ?  
\- My resizing function works but I cant use the pair size tu resize the image if I use draw ... rate  
The short and commented script that need only 3 of your images in the same directory to run i here.  
https://gist.github.com/tinulac-leinad/0084a4ef6eb20e605b2b5e30fe218d96  
Thanks for your help,  
Cordialy,  
Daniel

greggirwin

[18:18](#msg600f0b913855dd07fd79a628)@tinulac-leinad I had to fix some typos to get your code from yesterday to run, but then it handles `on-key` just fine.

```
w: layout [ 
title "Sets Lists Tools"
  size 1200x850
  across

  tl-tunes: text-list 585x400 data [
                  %test1.png
                  %soggys.png
                  %test.png

                ]
  tp: tab-panel bold 585x400 [
    "partition " [
            the-score: box 585x400 draw [] ;rate 25
      ;- on-time [update-the-score]
            [print "some test"]
        ] 
    ]
]
w/menu: [
  "Fichiers" [
    "Fichiers ABC" [
      "Create PDF" to-pdf
      "Create incipit PDF" incipit-pdf
    ]
    ---
    "Quit Ctrl-Q" kwit
  ]
  "Aide"[
    "A propos" about-help
  ]
]

w/actors: context [
  on-close: func [face event][ print "closed"]

  on-key: func [face event][
    probe event/key
        switch event/key [
        #"^Q"  [     
            quit
              ]
        ]
    ]
   on-menu: func [ face event][
    if event/picked = 'to-pdf [
      print "ABC fil selected"
    ]
    if event/picked = 'incipit-pdf [
      print "incipit selected"
    ]
    if event/picked = 'about-help [
        print "About seleted"
    ]
    if event/picked = 'kwit [
      quit
    ]
  ]
]
view w
```

[18:21](#msg600f0c4036db01248a9f41c2)Your latest question I'll have to make time for, if nobody else answers.

tinulac-leinad

[19:36](#msg600f1dac36db01248a9f74b8)@greggirwin Thanks for your time Gegg,  
My last post is there because I have solved some problems, and... more precise question. I have rewrite my sample code in a gist with a lot of comments, to explain around the code.  
So, it's realy a good Idea to isolate the code. Sometime, the errors message produced by the interpreter are actualy not alway very helpful and sometime there is no message at all ;)  
I don't need a quick answer for this last post, I can work in may others parts of the small app I am writing to lean Red.  
Thanks for help.  
Daniel

[19:50](#msg600f2120cae490555f694b67)@greggirwin Ho, yes, I want now to explore if i can solve better my two panes , list and liked image with react.. I work from the code in my Gist https://gist.github.com/tinulac-leinad/0084a4ef6eb20e605b2b5e30fe218d96 and post an update if i find a better solution....

[21:24](#msg600f36fe753011449b17658c)&gt; @greggirwin Ho, yes, I want now to explore if i can solve better my two panes , list and liked image with react.. I work from the code in my Gist https://gist.github.com/tinulac-leinad/0084a4ef6eb20e605b2b5e30fe218d96 and post an update if i find a better solution....

Finaly, not a good idea...

## Wednesday 3th February, 2021

planetsizecpu

[12:29](#msg601a973d1ed88c58d819f1b6)These days @ykprog as done some improvements in my \[forms](https://github.com/planetsizecpu/forms) app just while he learn Red lang, now it is credited as contributor, so THX and welcome!

[12:30](#msg601a975b55359c58bf1bc2cc)\[!\[formstest01.gif](https://files.gitter.im/570387cd187bb6f0eaddec47/P7YS/thumb/formstest01.gif)](https://files.gitter.im/570387cd187bb6f0eaddec47/P7YS/formstest01.gif)

greggirwin

[19:24](#msg601af87455359c58bf1cd6f2)Nice! Thanks to both of you.

ldci

[21:47](#msg601b19eeaa6a6f319d01f1c1)@planetsizecpu interesting code but a lot of problems with macOS

planetsizecpu

[22:14](#msg601b204e4f7d1b68e52c0fee)@ldci Unfortunately I don't have a Mac machine for testing 😔

ldci

[22:59](#msg601b2aeb24cd6b60d817f679)@planetsizecpu Don’t worry.If I had time I’ll check for OSX

## Friday 5th February, 2021

Slownite

[14:47](#msg601d5a994f7d1b68e532b047)Hi everybody, I want to use Red for data science task (visualization, preprocessing and model), I would like to know, if there is some existing libraries to do these task in Red? If there isn’t I will be glad to try to build some of them !

ldci

[16:42](#msg601d75844f7d1b68e533003a)@Slownite You’re welcome for developing such tools :)

greggirwin

[19:18](#msg601d99ed24cd6b60d81f3e6b)@Slownite it would be great to have someone in that area start on ideas. Thanks! Of course, you can come here and we can help with the general Red side, help with design ideas from a Red perspective, etc.

Slownite

[19:18](#msg601d9a164f7d1b68e5336fc6)Thank you very much!

greggirwin

[19:26](#msg601d9be60eed905f18951aeb)This could help ignite some projects we have back burnered as well. Like `[split HOF aggregators]`.

## Monday 8th February, 2021

Sergey\_Vladivostok\_gitlab

[09:54](#msg60210a671ed88c58d82aa480)Guys, is Windows XP no longer supported? Red-19apr19....exe works great, but red-05-Feb-21....exe first required d3d11.dll, and then gives an error in gui-console-2021-2-5-378.exe - "procedure entry point \_except\_handler4\_common not found in library msvcrt.dll (version 7.0.2600.5512) What are the minimum system requirements for the future Red v 1.0?

rebolek

[10:03](#msg60210c5a0eed905f189d256e)Direct2D branch was merged into master so for Red/View, WinXP is not supported anymore as D2D needs W7 at least (or maybe Vista). Non-View version should work I guess.

pekr

[10:07](#msg60210d739d5c644f665a8227)@rebolek But there is a GDI+ fallback IIRC. But even then, I think that WindowsXP support was oficially abandoned.

[10:09](#msg60210dc49fa6765ef8069286)Guys, if we concentrate upon supporting 20 years old system, it is going to slow us down .... not sure how much work would it be to make GDI+ version to work with XP. @qtxie will know for sure, but most probably - "the case is closed" ....

rebolek

[10:10](#msg60210e05063b6c68d54814b3)I believe if someone really needs it they can maintain their own fork.

Sergey\_Vladivostok\_gitlab

[10:31](#msg602113175500a97f82f3e007)@rebolek Are there separate "core" and "view" versions of Red? The one that downloading from red-lang.org gives an error. D3d11.dll I shoved (ver 7.0.6002.18107 work in XP), but what to do with msvcrt.dll I don’t know :( About fork - not everyone can make their own clothes from wool, their medicines from herbs, their own fork of the programming language from source :) Although the presence of such a possibility is a huge plus.

@pekr if "closed", then "closed". For now, I'm using the old version.

pekr

[10:40](#msg6021152524cd6b60d8275a9b)I don't have official answer to that, just from what I remember. Don't even remember, when that cut happened exactly and how much is missing in that regards ....

Sergey\_Vladivostok\_gitlab

[10:42](#msg6021157fa0246860dc3c7b92)Progress - I understand ...

rebolek

[10:49](#msg602117301ed88c58d82ac481)@Sergey\_Vladivostok\_gitlab You need to compile it yourself, which is really easy.

[10:49](#msg6021174b9238c531ad30bba9)If you need help with compiling, just let me know.

Sergey\_Vladivostok\_gitlab

[10:54](#msg6021187bae4b9b27c1a91227)@rebolek Thank you very much for your desire to help. I think a simple compile will not be enough to disable/replace functions that are missing in the operating system, otherwise the support of old systems would not be so expensive.

rebolek

[10:56](#msg602118e184e66b7f7edcf80d)D2D is required only for View functionaity. So if you don't need GUI, you can compile a version that I believe would work on XP. If you need GUI than of course it won't help.

Sergey\_Vladivostok\_gitlab

[11:00](#msg602119d00eed905f189d491e)Got it. Thanks. When I get together, I will definitely stick with questions. You allowed! :)

rebolek

[11:01](#msg602119f532e01b4f71817a09)No problem :-)

greggirwin

[19:45](#msg602194c34f7d1b68e53cf61b)These are always hard calls. MS officially stopped supporting it 7 years ago, including things like security updates. It's less of a target now, but it also means more and more effort goes into working around issues, or holding back new features modern OSs offer. But this is also the benefit of FOSS, as we look forward. If you come to depend on Red, especially as a business, and we stop supporting Win10 in 15 years, you aren't stuck. You take that code base and can still fix any bugs that might affect you. True, you may not get new features, but that's where things like paid support come into play.

## Tuesday 9th February, 2021

Sergey\_Vladivostok\_gitlab

[09:26](#msg6022553e32e01b4f7184aea8)I think this is a topic for a philosophical discussion. You can write a program in tens of kilobytes, compile an executable file for hundreds of kilobytes and ... require libraries in gigobytes to execute it. Gradually DirectX, dotNET, Unity3D, etc. and then the minimum PC requirements will increase, following the minimum OS requirements ...  
Sorry for off-topic.  
Now on the subject - ANSI Escape Codes unsupported? I would like to set the cursor position, like print "^ [[20; 40HCenter!"

rebolek

[09:30](#msg6022563f5500a97f82f72481)In GUI console? Unfortunately no. IIRC they were expected to come with console plugins but console plugins aren't here yet. The of course work fine on Linux and Mac terminal versions.

Slownite

[14:23](#msg60229af55500a97f82f7dbb3)Hi everybody, I try to write an installer/launcher  
does somebody have an example of one wrote in red?

mxdpeep

[19:22](#msg6022e0da55359c58bf319ace)@rebolek @greggirwin howdy :)

greggirwin

[20:12](#msg6022ec909d5c644f665f6e60)@Sergey\_Vladivostok\_gitlab time marches on, requirements increase, but let's still use ANSI escapes. ;^)

@Slownite I did, in Rebol, many years ago. It's a big task.

Welcome @mxdpeep !

Sergey\_Vladivostok\_gitlab

[21:39](#msg6023012e55359c58bf31fa62)@greggirwin Exactly! Time passes, and we still use the round wheel, alphabet letters and the "MOV" command in the assembler ... Urgently throw away everything old and make new, youthful? :) Looking at the world around me, I sometimes notice regression and degradation where someone sees progress. I may be mistaken, but others do not lag behind me :)  
P.S. C:\\WINDOWS\\System32\\ansi.sys - Microsoft Windows \[Version 10.0.10240]

## Wednesday 10th February, 2021

rebolek

[12:08](#msg6023ccd70eed905f18a432e2)@mxdpeep welcome :)

planetsizecpu

[13:05](#msg6023da2084e66b7f7ee41dce)Welcome @mxdpeep

## Friday 12nd February, 2021

Sergey\_Vladivostok\_gitlab

[23:41](#msg602712478621811d58732ae6)how can the number of words/letters be counted as a result of the work of the function "source"?

```
>> print length? [source print]
2
```

I want to get 10 because "source print" gives out a text of ten words.

```
>> source print
PRINT is a native! value, so source is not available.
```

is it possible?

greggirwin

[23:43](#msg602712a79337c51bc682a3df)10?

`print length? trim/all mold/only [source print]`

[23:44](#msg602712e58621811d58732c1d)Ah, I see what you mean now.

[23:46](#msg602713448621811d58732cff)The key here is to do `source source` so you can see how it works. It's an interactive function, so always prints and doesn't return a value, so the console output is cleaner.

[23:47](#msg6027137f7ba8124e54609a08)But you can take the inner core of it and reuse it for your own function that returns the result as a string, then parse that.

Sergey\_Vladivostok\_gitlab

[23:56](#msg602715c94c79215749e26978)Got it. Thank. Is it impossible to redirect the result of the print command to a variable for subsequent parsing? If I reassign the "print" with my function (print: func \[...]), will it be called, including from the "source"? And can i send word from program to function "ask"? (Emulited enter from user)

dsunanda

[23:59](#msg6027166447585464db753dc8)You can adapt SOURCE like this (creating a function X):

```
x: mold get 'source replace/all x "print" "reduce" x: first reduce load x
x print
== ["PRINT" "is" "a native!" "value, so source is not available."]
```

End result: response from SOURCE in a block

## Saturday 13th February, 2021

greggirwin

[00:01](#msg602716c44c79215749e26b67)@Sergey\_Vladivostok\_gitlab the best way to learn is to try it. The worst thing that happens is that you mess up a console session and start a new one. :^)

Sergey\_Vladivostok\_gitlab

[00:16](#msg60271a4b7ba8124e5460ab05) @dsunanda Am...

```
>> length? x print
== 4
>> length? x source
== 2
```

Probably more correct to say what exactly I plan to implement. I am trying to write a keyboard treining, but so that a person does not type incomprehensible text, I want to display it as the source code required for typing. So that he, along with the skill of speed dialing, immediately gets used to the syntax of a wonderful programming language :) Accordingly, I try to get the source code in the form of a string/letters.

@greggirwin I'm trying. Slowly reading the documentation with the translator and trying to figure out the syntax :)

dsunanda

[00:18](#msg60271ae2a37fc1784c1ac615)What X / SOURCE has returned is a block of 4 strings. To get the words you wanted originally:

```
split form x print " "
eg:
length? split form x print " "
== 10
```

Sergey\_Vladivostok\_gitlab

[00:20](#msg60271b44a7fc4b573bcf390f)@dsunanda got it. Thank!

Slownite

[17:11](#msg602808354c79215749e48694)Hi everybody, is it possible to use pair! on float coordonate for example 2.8 and 4.5 and have this result 2.8x4.5 and not 2x4?

ldci

[17:15](#msg6028094147585464db7773e2)@Slownite : as-pair makes an integer transform when creating a pair datatype.

Slownite

[17:19](#msg60280a299403f11bb57f1aca)@ldci : So there is no way to have float coordonate using pair! datatype?

ldci

[17:21](#msg60280a9e7ba8124e5462c6b9)@Slownite you can create an object for this purpose  
\`  
myPair: object \[x:0.0 y:0.0]

Slownite

[17:31](#msg60280ce49337c51bc684cd7f)@ldci : I see, I thought about it but can I use this new object with a draw command?

ldci

[17:36](#msg60280e319ba13e72e429cc9f)I suppose you want draw lines or similar splines: they require pair as coordinates since screen cordinates are integer:)

Slownite

[17:37](#msg60280e749403f11bb57f23a8)Oh yes I didn't think about that thank you very much!

ldci

[17:40](#msg60280ef9726a881d4f719974)you’re welcome. in redCV we can use float matrices for accurate computation, but in final we need integer for a correct rendering on display

Slownite

[17:41](#msg60280f4b6825b964d6093c72)I will take a look ! :)

greggirwin

[19:51](#msg60282dd56825b964d609831a)Float support in pairs is a design possibility. It comes up a lot. One of the main issues is that they look really ugly. We have to weigh how important that is against the value they bring.

## Saturday 27th February, 2021

Slownite

[21:13](#msg603ab605d1aee44e2db2aecc)Hi everybody, can I control the mouse on windows and linux with a red script?

## Sunday 28th February, 2021

GiuseppeChillemi

[01:03](#msg603aebcdd2619a4f2e10abb6)Do you want to move it via script?

Slownite

[01:11](#msg603aedce22a5ce4a91220483)Yes!

Respectech

[14:09](#msg603ba42c95e23446e402150e)You can. On Windows, a DLL package like AutoIt is a good option. I believe there are similar ways to do it on Linux.

toomasv

[14:44](#msg603bac5f95e23446e4022b92)@Slownite You can use draw's matrix to \*\*place\** things with sub-pixel accuracy:

```
view [
   b: box 300x300 draw [matrix [1 0 0 1 0 0] box 1x1 29x29] 
   slider 16x290 data 100% on-change [b/draw/matrix/6: b/size/y * (d: 100% - face/data) - (30 * d)] return 
   slider 290x16 data 0% on-change [b/draw/matrix/5: b/size/x * (d: face/data) - (30 * d)]
]
```

But this cannot be used in shapes' definitions.

[14:52](#msg603bae2c22a5ce4a9123ea6f)To move it alone among other things, use `push`:

```
view [
   b: box 300x300 draw [push [m: matrix [1 0 0 1 0 0] box 1x1 29x29] circle 100x100 20] 
   slider 16x290 data 100% on-change [m/matrix/6: b/size/y * (d: 100% - face/data) - (30 * d)] return 
   slider 290x16 data 0% on-change [m/matrix/5: b/size/x * (d: face/data) - (30 * d)]
]
```

Slownite

[15:16](#msg603bb3dd44f5a454a4459c5b)Ok thank you I will try !

toomasv

[17:11](#msg603bcec0d1aee44e2db574a8):+1:

## Wednesday 7th April, 2021

ElCarvoOficial\_twitter

[15:44](#msg606dd3590d35e85af94728de)Hi 🙋🏻‍♂️

rebolek

[15:45](#msg606dd388c0f3842b4191243c)Hi!

[15:46](#msg606dd3ddc0f3842b419124de)@ElCarvoOficial\_twitter feel free to ask any question here, me and others are glad to help you.

## Friday 9th April, 2021

Sergey\_Vladivostok\_gitlab

[08:19](#msg60700e2697cf5067464fa116)Cannot download source from https://www.red-lang.org/p/download.html. On click https://static.red-lang.org/dl/auto/red-latest-source.zip i get "not here"...

ne1uno

[08:34](#msg6070118397cf5067464fa971)@Sergey\_Vladivostok\_gitlab you can get latest source from https://codeload.github.com/red/red/zip/master or use git clone.

[08:34](#msg6070118481866c680c1184c6)there should be source link to same static and latest version. usually best to use latest nightly

Sergey\_Vladivostok\_gitlab

[08:39](#msg607012d6b9e6de24d6244065)@ne1uno Thanks. How can create bug reports for patch site links? Is the message in this chat enough?

rebolek

[08:44](#msg607013d9c60826673b92a9e4)@Sergey\_Vladivostok\_gitlab I reported it so let’s hope it can get fixed soon.

[08:44](#msg607013fb81866c680c118a00)But message in this chat should be enough.

Sergey\_Vladivostok\_gitlab

[08:58](#msg6070175397cf5067464fba2a)Is it possible to build a static executable file for Linux, which does not need any libraries to work in the console?

rebolek

[08:59](#msg60701786a2ac0d38e7a5c390)I think you would need to patch the compiler to do this.

Sergey\_Vladivostok\_gitlab

[09:06](#msg60701902a9dd556843c94ea5)This seems to be a non-trivial task. I think it will be difficult for me so far.

rebolek

[09:07](#msg6070194dd79539186148f34f)Yes, I’m afraid it won’t be very easy.

## Saturday 10th April, 2021

lylgithub2021

[06:54](#msg60714bbf97cf50674652b133)I try to do something when keys combination "ctrl a" on keyboard are hit like this: view\[on-key \[if all \[event/ctrl? event/key = #"a"]\[print "ok"]]], but it does not work. How to achieve it?

hiiamboris

[08:14](#msg60715e7c55d78266a636d953)face must have focus in order to receive a keyboard event

[08:15](#msg60715e87d7953918614c11a2)https://w.red-lang.org/en/view

[08:15](#msg60715e99c60826673b95d7d4)or use `on-detect`

lylgithub2021

[08:16](#msg60715ed22e5574669b29b311) @hiiamboris Would you please show a code example?

hiiamboris

[08:19](#msg60715fa706e2e024e844a16e)`view [base focus on-key [...]]`

[08:20](#msg60715fdb969f8b38ee6caa0d)`system/view/capturing?: yes view [on-detect [if event/type = 'key [...]]]`

lylgithub2021

[08:21](#msg6071601bb9e6de24d6277b85)How to present "ctrl a" in the block of `on-detect` for example?

hiiamboris

[08:22](#msg6071602fb9e6de24d6277bbf)same way you did

lylgithub2021

[08:23](#msg6071609a969f8b38ee6cab79)Could you help me with the code that can run?

[08:26](#msg607161291f84d71853aac083)I tried like this `view [on-detect [if all [event/ctrl? event/key = #"a"][print "ok"]]]`, but it doest work yet.

hiiamboris

[08:28](#msg607161aeb9e6de24d6277f7e)use `print`, `probe`, `??` to debug your code

lylgithub2021

[08:35](#msg6071636306e2e024e844a9e4)As there is very few example in red doc, I still can't understand how to achieve it. So would you provide with a code example for my case?

hiiamboris

[08:38](#msg60716411b6a4714a29b683f2)I did just above

toomasv

[13:53](#msg6071add346a93d4a19ba0cdc)@lylgithub2021  
Global:

```
system/view/capturing?: yes view [on-detect [if all [event/type = 'key event/key = #"^A"][print "Yesss!"]]]
```

With `base`:

```
view [base focus on-key [if event/key = #"^A" [print "Yesss!"]]]
```

lylgithub2021

[14:00](#msg6071af60dc24646812b1f3de) @toomasv Thank you for your code! I learned through your code that `event/key = #"^A"` means `ctrl a`, and how to express `alt a`?

toomasv

[14:17](#msg6071b35fc60826673b9696ff)@lylgithub2021 You are welcome!

```
view [base focus on-key-down [if all [event/key = #"A" find event/flags 'alt] [print "Yesss!"]]]
```

You can investigate different attributes of events with this:

```
system/view/capturing?: yes 
view [on-detect [
    foreach attr exclude system/catalog/accessors/event! [face window] [
        print [attr event/:attr]
    ] print ""
]]
```

lylgithub2021

[14:47](#msg6071ba8fb6a4714a29b73ef8)Perfect solutions! That's just what I want. Many thanks again! And why is `event/key = #"a"` not right, but `event/key = #"A"` ?

hiiamboris

[14:53](#msg6071bbe5969f8b38ee6d7e04)`key` event converts the key into char (most notably Shift+keys, but Ctrl too)

[14:53](#msg6071bbf72e5574669b2a8ebf)`key-down` and `key-up` give you raw keys

## Sunday 11st April, 2021

planetsizecpu

[11:18](#msg6072daec1f84d71853adeda6)Welcome @lylgithub2021

## Tuesday 13th April, 2021

lylgithub2021

[02:56](#msg60750877ae90f36840794954)

```
scrn: system/view/screens
view [size (scrn/1/size / 2)] 
 ;; it fails. I want to get a window sized 1/4 of the screen. What's wrong with my code?
```

ne1uno

[03:55](#msg6075163cd79539186154a35a) `view compose [size (scrn/1/size / 2)]` is one way

lylgithub2021

[04:30](#msg60751e5155d78266a63fa000)Why is this a wrong way --`view [do [a: scrn/1/size / 2] size a ]`

ne1uno

[04:36](#msg60751fcca9dd556843d52134)that should work if you set 'a`outside of`view\`. I think the do block is evaluated last in view? view has more limited syntax than red, paths and math need something like compose

lylgithub2021

[04:37](#msg6075201e97cf5067465bc28c)@ne1uno Many thanks!

[04:39](#msg6075207046a93d4a19c2024c)and this works `view [do [a: (to-string 1)] text a]`

toomasv

[06:19](#msg6075380c46a93d4a19c2360d)@lylgithub2021 It fails in first case and suceeds in second because in VID block window properties (`size`, `title`, `backdrop` and window events) are handled first, then everything else. So, when `do [...]` is handled, `size a` is not understood anymore, although `a` is set. But in second case, `text a` is handled after `do`, because it is not a window property but style. You can learn about VID handling \[here](https://github.com/red/red/blob/master/modules/view/VID.red#L508).

lylgithub2021

[12:22](#msg60758d0eb9e6de24d6315894)  
view \[size (scrn/1/size / 2)] not understood by VID since `scrn` has been defined before?&gt;

hiiamboris

[14:40](#msg6075ad6dc60826673ba00035)VID allows arbitrary expressions only after a few facets (like data or extra), but not after size.

greggirwin

[16:48](#msg6075cb542e5574669b345282)@lylgithub2021 look again at @ne1uno's first response to your question. You may have missed `compose` there.

toomasv

[16:56](#msg6075cd3a97cf5067465d9b9e)@lylgithub2021 As said above, either

```
view compose [size (scrn/1/size / 2)]
```

or

```
view reduce ['size scrn/1/size / 2]
```

or

```
a: scrn/1/size / 2 view [size a]
```

or

```
view/options [][size: scrn/1/size / 2]
```

or

```
view make-face/size 'window scrn/1/size / 2
```

greggirwin

[17:39](#msg6075d76d2e5574669b34784c)It's a source code salad bar!

toomasv

[19:47](#msg6075f54eb6a4714a29c17ae8):) Dessert too:

```
view make face! [type: 'window size: scrn/1/size / 2]
```

hiiamboris

[20:00](#msg6075f86e969f8b38ee77f307)where's `do` variant? ;)

[20:19](#msg6075fcd281866c680c1fd874)🛎

greggirwin

[20:41](#msg607601ec2e5574669b34f36d)We really need super-sized emojis.

hiiamboris

[20:45](#msg607602eeae90f368407bf9d1)true

## Wednesday 14th April, 2021

lylgithub2021

[01:09](#msg607640c0a2ac0d38e7b4bb73)@toomasv @ne1uno Many thanks! I learnd a lot from all of you!

toomasv

[03:56](#msg607667efdc24646812bd5780)@lylgithub2021 You are welcome! Keep digging in and ask whenever stuck.

lylgithub2021

[06:31](#msg60768c5597cf5067465f7324)Is there a method in Red to construct a function with indefinite number of arguments, when calling it like this:

```
(f 1)  ;; return 1
(f 1 2) ;;return 3
(f 1 3 5) ;; return 9
(f 1 2 5 8) ;; return  16
......
```

hiiamboris

[06:50](#msg607690d3b6a4714a29c2f38f)Use a block argument.

lylgithub2021

[06:55](#msg607691f506e2e024e8511401)Except for block argument, no other better way to achieve my idea?

hiiamboris

[06:59](#msg607692ba06e2e024e8511602)Write your own dialect. Or declare 'f' with thousands of literal arguments of type 'unset! integer!' ;)

[06:59](#msg607692d5a2ac0d38e7b5757a)But latter is a joke. Don't do that.

toomasv

[12:42](#msg6076e33a2e5574669b372302)@lylgithub2021 Just playing here. I have not used macros before, but the thing you ask can be done with \[pattern matching macros](https://github.com/red/docs/blob/master/en/preprocessor.adoc#pattern-matching-macros):

```
save/header %tmp.red [
    #macro [ahead paren! into ['f a: some integer!]] 
    func [[manual] s e /local a][
        change/only/part a to-block a tail a 
        s
    ] 
    f: func [blk [block!]][sum blk] 
    probe (f 1 2) 
    probe (f 10 20 30)
][]
do %tmp.red
;3
;60
;== 60
```

I'm sure @hiiamboris can give more details.

[12:53](#msg6076e5cdd7953918615970af)Oops! `/local a` is wrong, delete this.

hiiamboris

[12:53](#msg6076e5d9dc24646812be989e)`tail a` is `e`

[12:54](#msg6076e60a97cf5067466061e7)and yes, it's better not to use any set-words in those rules, as.. global namespace pollution when interpreted

toomasv

[13:26](#msg6076ed9e81866c680c222f09)Thanks @hiiamboris Here is version without global words:

```
save/header %tmp.red [
    #macro [ahead paren! into ['f some integer!]] 
    func [[manual] s e][change/only/part at s/1 2 to-block at s/1 2 tail s/1 s] 
    probe (f 1 2) 
    probe (f 10 20 30)
][]
do %tmp.red
;3
;60
;== 60
```

NB! `tail a` \*\*is not\** `e`

hiiamboris

[13:28](#msg6076ee1a46a93d4a19c6bc54)`s/1` wouldn't be more readable? ;)

[13:30](#msg6076ee78a9dd556843d9ece1)&gt; NB! tail a is not e

Riiight. Good catch.

toomasv

[13:30](#msg6076ee7a97cf506746607926)Yes, thanks, corrected!

[13:41](#msg6076f0f6b6a4714a29c3f1ed)From last version function `f` itself was left out. Insert this before first `probe:`:

```
f: func [blk [block!]][sum blk]
```

greggirwin

[16:18](#msg607715d6969f8b38ee7ad2e2)@lylgithub2021 Let me know how we can improve this answer: https://github.com/red/red/wiki/%5BDOC%5D-Red-Should...-(Feature-Wars)#support-variable-arity-functions.

Respectech

[17:07](#msg6077215b969f8b38ee7af0b9)Sounds good to me.

greggirwin

[18:11](#msg607730371f84d71853b9011c)Thanks @Respectech.

@toomasv, the macro approach is cool, but `some integer!` probably isn't that useful as a rule. :^) I think this is where evaluation complicates var-args in Red. Not that we can't solve it technically, but they may end up being harder to read, especially if any lit args are involved.

toomasv

[18:15](#msg60773136ae90f368407efe35)I agree that this in itself in not much worth, it was just interesting adventure into macros.

greggirwin

[18:16](#msg6077316b55d78266a64515dc)Yes. Could add to https://github.com/red/red/wiki/%5BNOTES%5D-Macro-Notes.

toomasv

[18:25](#msg6077338d06e2e024e852d447)Hmm, the kind of thing I did is discouraged in starting note there, so maybe not to push in this direction?

greggirwin

[18:36](#msg60773621d7953918615a59d9)We can probably add examples, with caveat emptor clauses. :^)

[18:36](#msg6077363d46a93d4a19c78e74)As you noted, this is about exploration and learning.

hiiamboris

[18:54](#msg60773a6b97cf50674661569e)Well,  
&gt; There is nothing macros can do that you can't do with regular code, with the same expressive power. Macro support in interpreted code is just for compatibility with the compiler.

I have already collected a bunch of macro solutions that disprove the above statement ;)

greggirwin

[19:50](#msg607747a006e2e024e853089a)Good thing it's a wiki then.

## Friday 16th April, 2021

lylgithub2021

[07:38](#msg60793ee081866c680c283d32)Thank you.@greggirwin Refinement is too heavy for some matter. To pass blocks of values is the easist way, but seems not quite elegant. I don't quite unserstand "free ranging evaluation". Further info or examples would be highly appreciated!

greggirwin

[19:37](#msg6079e77f97cf506746683d4c)Free ranging evaluation just means there are no parens around args for function calls. So you can't tell when an expression ends without knowing how many args each piece consumes, and whether they themselves are evaluated. As far as being elegant, is Lisp an less so just because the bracket is one token to the left? `(my-fn 1 2 3)` vs `my-fn [1 2 3]`.

## Saturday 17th April, 2021

lylgithub2021

[01:03](#msg607a33f1dc24646812c720c9)@toomasv I tried your code `save/header...do %tmp.red`, but get message `*** Script Error: f has no value`, why?

toomasv

[03:58](#msg607a5ce3b6a4714a29ccd211)@lylgithub2021 :point\_up: \[April 14, 2021 4:41 PM](https://gitter.im/red/red/welcome?at=6076f0f6b6a4714a29c3f1ed)

lylgithub2021

[05:07](#msg607a6d0fdc24646812c7912e)\[!\[image.png](https://files.gitter.im/570387cd187bb6f0eaddec47/KnYA/thumb/image.png)](https://files.gitter.im/570387cd187bb6f0eaddec47/KnYA/image.png)

[05:07](#msg607a6d1c1f84d71853c14c14)@toomasv

toomasv

[06:02](#msg607a79e4969f8b38ee837f01)@lylgithub2021 Do you use latest nightly build?

[06:02](#msg607a79ecc60826673bac4833)\[!\[image.png](https://files.gitter.im/570387cd187bb6f0eaddec47/9rVV/thumb/image.png)](https://files.gitter.im/570387cd187bb6f0eaddec47/9rVV/image.png)

lylgithub2021

[06:18](#msg607a7da897cf506746698ca8)\[!\[image.png](https://files.gitter.im/570387cd187bb6f0eaddec47/tBSQ/thumb/image.png)](https://files.gitter.im/570387cd187bb6f0eaddec47/tBSQ/image.png)

hiiamboris

[06:54](#msg607a8631d795391861629c0d)That's what happens when you type the code instead of copy-pasting (:

toomasv

[08:08](#msg607a979706e2e024e85b81af)@lylgithub2021 Ah, yes, `into ['f ...`. Thanks, @hiiamboris!

lylgithub2021

[08:57](#msg607aa309a9dd556843e36686)Thanks! @toomasv @hiiamboris

toomasv

[11:08](#msg607ac19b2e5574669b411558):+1:

## Wednesday 21st April, 2021

lylgithub2021

[12:43](#msg60801e0f55d78266a65b1394)Both file name and file path are dataype of `file!` in Red language. Is there any function or other way to tell whether a `file!` is a file or a path?

hiiamboris

[15:51](#msg608049f62e5574669b4e8bc2)not in runtime

[15:51](#msg608049ffa2ac0d38e7cd925b)you just need to check the first char

lylgithub2021

[16:02](#msg60804c85c60826673bb97287)`chck the first char` seems to fail in checking all returns in `read %.` whose path contain sub-directory .

hiiamboris

[16:02](#msg60804cae1f84d71853cf9e5b)ah

[16:03](#msg60804cbbb9e6de24d64c4a8c)so maybe you're just looking for `dir?`?

lylgithub2021

[16:08](#msg60804e1ab9e6de24d64c4dfd)Yes, It is. Many thanks! And, is there a way to convert a reletive path to absolute path?

dsunanda

[16:11](#msg60804eaa06e2e024e86961fb)&gt; a way to convert a reletive path to absolute path

```
clean-path %rel/path
```

lylgithub2021

[16:41](#msg608055b1b9e6de24d64c6459)It seems that the returned absolute path refers to the current working path, not always the real file path.

[16:43](#msg60805636b9e6de24d64c658d)No function such like "red-complete-path" in Red to acquire the real absolute path?

greggirwin

[17:16](#msg60805ddbd79539186170d6aa)If you have a relative path, it has to use \*something* as a base to make an absolute path out of it, so I'm not sure what you mean by "the \*real* absolute path".

## Thursday 22nd April, 2021

lylgithub2021

[00:49](#msg6080c8241f84d71853d0eb3b)@greggirwin I'd like to list all files in a given directory(which contains sub-directories) to a block with this:

```
Red []
all-files: function [dir] [
collect [
  foreach i read dir [keep 
    either dir? i
    [all-files i]
    [i]
]]]
```

The return of `all-files` just give file names, but absolute file path is also needed for the reason of later file loading. This is why I want to convert a relative file path to a absolute path.

greggirwin

[01:38](#msg6080d393a9dd556843f2abf7)There are a number of tree loaders people have done. If you need absolute paths in a flat list, you need to prepend the current dir as you walk.

[01:46](#msg6080d57e55d78266a65d0eeb)Something like this:

```
all-files: function [
    {Returns a block of fully qualified filenames for the directory.}
    spec  [file!]   "Starting Directory"
    block [block!]  "Block to append to"
    /deep           "Recurse sub-directories."
][
    spec: dirize spec
    foreach file read spec [
        f-spec: repend copy spec file
        either all [deep dir? f-spec] [
            all-files/deep f-spec block
        ][
            append block f-spec
        ]
    ]
    block
]
```

[01:48](#msg6080d600dc24646812d75971)In this version, if you pass a relative path as the spec, that's used. If you pass an absolute path, that's used, so you are in control. If you want to use `clean-path` your walker needs to change to the current dir you're reading as it goes.

lylgithub2021

[06:09](#msg6081132c81866c680c3b8599)@greggirwin Many thanks for your code!!

[06:57](#msg60811e3ed79539186172b358)And, given a relevant directory(maybe not current working dir), how to get its real absolute path in Red?

hiiamboris

[07:45](#msg608129a8d79539186172d11f)Two people already gave you the function to do that :)

[07:46](#msg608129ba97cf50674678c369):point\_up: \[April 21, 2021 7:11 PM](https://gitter.im/red/red/welcome?at=60804eaa06e2e024e86961fb) :point\_up: \[April 22, 2021 4:46 AM](https://gitter.im/red/red/welcome?at=6080d57e55d78266a65d0eeb)

[08:05](#msg60812e48d79539186172db1e)I guess the docstring could be more specific about it though.

## Monday 26th April, 2021

ldci

[05:00](#msg6086490a969f8b38ee9f6c9c)Do you include needs: view in Red header?

## Tuesday 27th April, 2021

lylgithub2021

[04:44](#msg60879695be3536391591bbfb)Where to find out the concrete meaning of these `Escaped Control Characters`: `#"^A" - #"^Z"`, `#"^["`, `#"^\"`, `#"^]"`, `#"^_"`

dsunanda

[05:21](#msg60879f3d471bee582e188d11)@lylgithub2021

```
Characters: [#"^A"  #"^Z" #"^[" #"^\" #"^]" #"^_"]
foreach c characters [print [mold c  to-integer c]]
#"^A" 1
#"^Z" 26
#"^[" 27
#"^\" 28
#"^]" 29
#"^_" 31
```

lylgithub2021

[06:11](#msg6087ab0e69231732f4c2d5bb)@dsunanda Thank you so much! And which is 30?

dsunanda

[06:16](#msg6087ac20d24b290497873855)@lylgithub2021 Best I got is:

```
print mold to-char 30
#"^(1E)"
```

Don't know if there is a more compact way to represent it.

lylgithub2021

[06:25](#msg6087ae750e19524c6429ba6b)@dsunanda I get it. Thank you!

## Tuesday 4th May, 2021

lylgithub2021

[02:33](#msg6090b29475aeb43be72649e3)I experiment `do` a string like this, and get an error message:

```
f: function [x] [
result: case [
  block? x [copy []]
  string? x [copy ""]
]
prin "result is: " probe result
ex: "append result x"
do ex
]

f [1]

result is: []
*** Script Error: result has no value
*** Where: do
*** Stack: do-file
```

Why does`result` has no value here?

toomasv

[03:46](#msg6090c3ab98ee821821a9d8ee)@lylgithub2021 Although `result` is local to your function, when you `do ex` then `ex` string is loaded and `result` in this loaded block is not bound to context of `f`. Therefore it is expected to be found in global context. But as it is not declared there error is raised. You can bind it to you function this way:

```
do bind load ex :f
```

But if you use block for `ex` instead of string, then you don't need to explicitly bind it.

Oldes

[10:34](#msg6091233775aeb43be7275194)@lylgithub2021

```
with: func [obj code][do bind code obj]
obj: object [a: 1]
with obj [a: a + 2]
```

## Wednesday 5th May, 2021

lylgithub2021

[01:17](#msg6091f22e93ac573bba849321)@toomasv Thank you. And, as you say, "result in this loaded block is not bound to context of f. Therefore it is expected to be found in global context". I tried to redesign the function `f` with `func` rather than `function` to make the variable `result` global, but it does not work either. I still don't quite understand the principal of variable context in Red.

toomasv

[02:57](#msg609209a0963923553ae40f05)@lylgithub2021 When you use `func` then the same binding problem applies to `x`. It is local to `f` but loading it from string without explicitly binding to the context of function leaves it global. Value searched in global context and not found results in error. You need either to bind `x` to `f` or better use block instead of string for `ex` - then it is automatically bound.

lylgithub2021

[04:50](#msg609224030845c416dcc4eee4)Thank you ! @Oldes @toomasv

toomasv

[05:45](#msg6092310598ee821821ad5600)@lylgithub2021 You are welcome!

lylgithub2021

[10:53](#msg6092793198ee821821ae09a0)@toomasv Then I tried `do [append result x]` in my code, it's all right. But when I tried `do to-block ex`, same error appeared. Why is it not automatically bound after turning string `ex` to `block!`?

toomasv

[10:55](#msg6092798bd5e2793379f2c21e)@lylgithub2021 Because blocks are automatically bound on creation of function, not on its calling. `to-block` is similar to `load`, you can do `do bind to-block ex :f` as well as `do bind load ex :f`.

lylgithub2021

[11:04](#msg60927bd831d2306a0e90dfab)@toomasv Post defination of the function `'f`, I write `do bind load ex :f`. Then I run the code , I get `*** Script Error: ex has no value`.

toomasv

[11:10](#msg60927d0ed261cc4d74abc060)

```
f: function [x] [
   result: case [
      block? x [copy []]
      string? x [copy ""]
   ]
   prin "result is: " probe result
   ex: "append result x"
   do bind load ex :f
]
f [1]
result is: []
== [1]
```

lylgithub2021

[13:12](#msg609299aed5e2793379f31005)many thanks! @toomasv

toomasv

[13:28](#msg60929d9575aeb43be72afec4):+1:

greggirwin

[18:46](#msg6092e811963923553ae6311e)@lylgithub2021 why do you want to use a string rather than a block?

## Thursday 6th May, 2021

lylgithub2021

[07:48](#msg60939f52d5e2793379f5911a)@greggirwin Because sometimes needs input from console by which the input has to be string format.

[14:05](#msg6093f7c731d2306a0e9487b2)I make a function named `filter` to acquire elements from a block:

```
filter: func [a-func series  /clean ] [
  ex: compose[
    (either clean ['unless] ['if])
    (:a-func) element
    [keep element]
  ]
  collect [
    foreach element series [
       do ex
    ]
  ]
]

probe filter :string? [1 2 "a" 3]
;;["a"] wanted, but get:
;;*** Script Error: keep has no value
```

Why `keep` has no value in the above example?

hiiamboris

[14:08](#msg6093f85c963923553ae8c3e9)Does output of `?? collect` tell you anything?

lylgithub2021

[14:13](#msg6093f98275aeb43be72e622a)I use `collect...keep` to collect those elements in block that conform with `a-func`. Am I wrong in using it in this case?

hiiamboris

[14:13](#msg6093f9930845c416dcc968d5)keep is currently undefined outside of the collecting block.

[14:15](#msg6093f9eb93ac573bba89947a)Make sure keep stays inside and you're out of trouble.

lylgithub2021

[14:16](#msg6093fa482cc8c84d85136892)I don't understand why `keep` is outside of collecting block in my case since `do ex` which contains `keep` is in the `collect` block.

hiiamboris

[14:20](#msg6093fb1ac651cb6a001683f4)No, your keep is in another block that was created before collect could give meaning to it.

[14:21](#msg6093fb854d0065337e581d94)What you have to understand is that 'keep' is not a function. It's a word that may or may not refer to a function.

[14:22](#msg6093fbb2c651cb6a00168580)In your block that word has no reference to any function. It's unset.

[14:23](#msg6093fbe74d0065337e581f72)Try '? keep' in console.

lylgithub2021

[14:50](#msg60940225963923553ae8deda)Though my `keep` in `ex` is before the `collect`, it's just in block, so it's just a word! not evaluated in `ex`. When `keep` is called by `do ex`, it is in the `collect` scope. So why does the `collect` not identify the `keep` in `ex`?

hiiamboris

[14:51](#msg6094027e31d2306a0e94a6d1)There are no scopes in Red. Wordss are bound at load time and after that only when `bind` is called (`collect` calls it).

[14:55](#msg6094037f98ee821821b1efc5)In another language you would do something like:

```
c = collection()
foreach element series [c.keep(element)]
```

You would reference `keep` defined by `c` object. If you tried `c.keep` before creating object `c` with `keep` in it, it would error out.  
In Red words carry their context of definition `c` with them, so prefix `c.` is not needed most of the time. But the error condition is still applicable.

[14:58](#msg609404110845c416dcc98b00)`keep` in your block is the same as `system/words/keep` (which is unset).

greggirwin

[18:50](#msg60943a6dd964ec5538931c66)@lylgithub2021 thanks for the console use case. As @hiiamboris notes, when you start creating dynamic code, you may wander (unknowingly) into the parallel universe of binding. It's stepping off the lake's ledge and plunging into the depths. :^)

Red uses "definitional binding", meaning that \*where* something appears in code (where it is defined) matter. Here's your code, with the block moved inline with `collect`. By doing that, Red knows to bind `keep` so `collect` can use it. Look at the source of `collect` as @hiiamboris suggested.

```
filter: func [a-func series  /clean ] [
    collect [
        foreach element series [
            do compose [
                (either clean ['unless] ['if])
                (:a-func) element
                [keep element]
            ]
        ]
    ]
]

probe filter :string? [1 2 "a" 3]
```

hiiamboris

[18:59](#msg60943c9f20d4f02631a75e5d)@greggirwin you just made his code very inefficient ;)

greggirwin

[19:03](#msg60943d94f7e4221825bf9913)As I am wont to do. :^) I just wanted to show that dropping it inside, the "where" part, is important to Red. Besides, if I don't write slow, inefficient code, what are you going to do with all your free time?

hiiamboris

[19:04](#msg60943dc6ff705616c777daeb):D

## Friday 7th May, 2021

lylgithub2021

[03:04](#msg6094ae3ac651cb6a00184500)Thank you @hiiamboris @greggirwin so much for these info!! Would you please provide with more efficient method to my code?

hiiamboris

[06:30](#msg6094de6c31d2306a0e96c733)Move 'collect [' the lines above.

[06:30](#msg6094de7cf7e4221825c10b81)Three lines*

lylgithub2021

[06:31](#msg6094dea94d0065337e5a4840)Ok, I get it. Thanks again!

## Sunday 9th May, 2021

ams02468

[11:22](#msg6097c60d20d4f02631af98f7)hi guys how i can outeput value something like this

```
echo hi >test.txt
```

hiiamboris

[11:28](#msg6097c74875aeb43be7372f0f)`call/shell`

ams02468

[11:42](#msg6097cabac651cb6a001f7760)

```
st: ask "enter code :"
```

i need output st value in text file

hiiamboris

[11:43](#msg6097cae5d261cc4d74b8836e)so write it to the text file

[11:45](#msg6097cb4ac651cb6a001f78be)https://www.red-by-example.org/#cat-o02

ams02468

[11:47](#msg6097cbe5f7e4221825c7c3b1)thx

[12:38](#msg6097d7d34d0065337e6120a3)Hi, I want to enter this path

```
C:\Users\userprofile\
```

but as you know, the userprofile folder is a folder with a variable name. How can I enter this folder?

hiiamboris

[12:44](#msg6097d93ff7e4221825c7e102)https://www.red-by-example.org/#cat-s05

ams02468

[13:03](#msg6097ddaed964ec55389b964d)I want to use Windows special directories / shortcuts (like% TEMP%) Does red have such a thing?

hiiamboris

[13:12](#msg6097dfc398ee821821bb02d1)yes, I just gave you the link

ams02468

[13:17](#msg6097e0d1d5e2793379ff9609)i find nothing to help me

hiiamboris

[13:20](#msg6097e18898ee821821bb07e7)those special directories are called "process environment"

[14:35](#msg6097f325f7e4221825c82074)I don't think a function to replace environment vars in any path exists in Red runtime, but you can write your own with little effort

[14:38](#msg6097f3e20845c416dcd2b3a5)Question is, do you need it? Shell should do that on it's own.

## Monday 10th May, 2021

Oldes

[05:18](#msg6098c20cd261cc4d74baa845)@ams02468

```
>> get-env "userprofile"
== "C:\Users\Oldes"
>> get-env "TEMP"
== "r:\Temp"
```

ams02468

[10:17](#msg609908462cc8c84d851f1b45)guys sources file link is removed?  
\[Sources](https://static.red-lang.org/dl/auto/red-latest-source.zip)

hiiamboris

[10:20](#msg609908fdf7e4221825ca8f29)Yeah, I think they decided to discontinue it. Just download it from Github directly.

## Tuesday 11st May, 2021

lylgithub2021

[07:21](#msg609a307772823a6a04656d63)On console of an operating system (windows for example), is there a way to run a Red expression, such like

```
E:\Red> red.exe "add 1 2"
```

hiiamboris

[07:50](#msg609a37421105953e3d41eadc)yes: https://gitlab.com/hiiamboris/red-cli/-/tree/master/mockups/reddo

[07:55](#msg609a38883710274512cf2e6a)

```
>reddo "probe 1 + 2"
3
```

[07:58](#msg609a391a2212f12e7c17df81)I should probably make it accept multiple arguments though

lylgithub2021

[09:52](#msg609a53c63f08296a02961af7)Good job! Thank you. @hiiamboris

[10:15](#msg609a592a44c1b94d35771dd8)@hiiamboris And if this can be used by `Emacs`? Or is ther a `red mode` for Emacs?

hiiamboris

[10:52](#msg609a61e2fbcd854d3a18c576)I never liked emacs, so no idea.

## Wednesday 12nd May, 2021

meijeru

[12:31](#msg609bcabaf1397c69073e6348)&gt; Yeah, I think they decided to discontinue it. Just download it from Github directly.

Direct link to sources.zip: https://github.com/red/red/archive/refs/heads/master.zip

ams02468

[15:36](#msg609bf5f9ba27415f9b91c621)hi guys i have simple code example

```
a: {
    1.test
    2.test
    3.test
    4.test
    5.test
}
print a
```

How to print only lines 2 to 4?

hiiamboris

[15:43](#msg609bf789ebf93257bb478b93)use `split`

greggirwin

[17:27](#msg609c10185cd9f42ddfcc5572)And maybe `copy/part` after splitting.

ams02468

[20:21](#msg609c38d36a950f3d46df597f)how use `split` for two type string for example

```
a: {{
    1.test
    2.test
    3.test
    4.test
    5.test
}}
```

I want this "}" "{" not to be showed in output

hiiamboris

[20:35](#msg609c3c082ee2b13d95a57ea6)`remove` them

dsunanda

[21:32](#msg609c495d01edef5b503f6e6a)@ams02468 It's hard to advise, as it is not clear which parts of your data matter - is line 1 the blank line? Do the leading spaces matter, or can they be lost? Do you really want lines 2 through 4, or do you want all but the first and last? etc.  
Under one set of assumptions, this works:

```
b: next next split trim/tail load a newline
repeat n 3 [print b/:n]
    2.test
    3.test
    4.test
```

zentrog:matrix.org

[21:51](#msg609c4dd05ca66330b03c75a7)@ams02468: if you `load a`, you will get a string like your previous example with just a single pair of wrapping curly-braces

## Friday 14th May, 2021

ams02468

[06:37](#msg609e1aa117d35f3d9fc6ceb3)thanks guys for help

## Saturday 15th May, 2021

m\_a\_j\_ch\_rz\_a\_k\_twitter

[08:33](#msg609f8759416d8734b94886ca)Hello, is there anything like "async" in Red?

hiiamboris

[09:19](#msg609f9233d523ee3d3e33a526)No concurrency yet.

lylgithub2021

[10:17](#msg609f9f9f617459308f758f02)I have a Red script in which there is only one command: `print 0`. Then, I run this script on win7 console by `red --cli test.red`. `0` is not printed on console. Why? And how to get a Red print on console of an oprating system?

hiiamboris

[10:31](#msg609fa2eb416d8734b948bdb6)never heard of this problem

```
>red --cli 1.red
0
```

lylgithub2021

[10:32](#msg609fa33cc60a604255be67db)\[!\[image.png](https://files.gitter.im/570387cd187bb6f0eaddec47/LI8o/thumb/image.png)](https://files.gitter.im/570387cd187bb6f0eaddec47/LI8o/image.png)

hiiamboris

[10:33](#msg609fa35e6a950f3d46e78c0f)and `type test.red` output

[10:34](#msg609fa3b0e263442db82c008f)also Red version from `about`, and W7 `ver`

lylgithub2021

[10:38](#msg609fa48d5fff1f4a98da2f91)So So So Sorry. I got wrong script! Yes, it works all right. Really sorry wasting your time!!

hiiamboris

[10:39](#msg609fa4d8b10fc85b56994027)no problem :)

lylgithub2021

[10:48](#msg609fa7199f2c352db10eed6c)I want to limit input of a GUI `field` that only digits(`0,1,2,3,4,5,6,7,8,9`) and `ctrl+c`,`ctrl +v`(copy/paste in windows) are permitted by using `parse` which needs something like `digit: charset ["0123456789"]`. I wonder how to put `ctrl c` and `ctrl v` into the variable `digit`.

hiiamboris

[10:58](#msg609fa956c60a604255be75aa)

```
>> view [field focus on-key [probe event/key]]
#"^A"
#"^C"
#"^V"
```

[11:00](#msg609fa9c2e263442db82c0d51)Ctrl+letter produces chars #"^A" to #"^Z" that have ascii codes 1-26

[11:05](#msg609faaeb5ca66330b0445a49)Something to start with: `system/view/capturing?: yes view [field focus on-detect [all [event/type = 'key not find "1234567890^A^C^V^X" event/key 'stop]]]`

lylgithub2021

[11:24](#msg609faf766a950f3d46e7a582)That's just I need. Thank you so much for these very useful info! And I tried `view [field focus on-key [probe event/key]]`, fund that `ctrl a` and `ctrl shift a` are the same: `#"^A"`. Is there any way to distinguish them?

hiiamboris

[11:29](#msg609fb0a56a950f3d46e7a77a)`event/shift?`

lylgithub2021

[13:08](#msg609fc7c0c12aec4aa2c81a6b)`view [base focus on-key-down [if all [event/key = #"1" event/shift?] [print "Yesss!"]]]` is a correct way. Why is `if event/key = #"!" [print...]` wrong way?

hiiamboris

[13:22](#msg609fcb20e263442db82c5655)because `key-down` and `key-up` events do not translate keys into characters

greggirwin

[15:29](#msg609fe8c29f2c352db10f8816)Looks like a good time to start a keyboard-handling wiki page. Anyone game?

lylgithub2021

[16:14](#msg609ff375b10fc85b5699f3f3)Thanks to @hiiamboris and other guy's help, I'd like to sumarize as this: All keys(or key-combination) belongs to two catagories: 1)those who have `ASCII value` or `Red special designation`(ie. #"^C", #"^(back)" that can be directly handled by `event/key = ...`; 2) those without ASCII valve or Red special designation can be handled respectively in `key-down` or `key-up` event. Thank you all!

hiiamboris

[16:21](#msg609ff51a233397424dc474c1)https://docs.microsoft.com/en-us/windows/win32/inputdev/using-keyboard-input here's some background if you're wondering

lylgithub2021

[16:22](#msg609ff548c12aec4aa2c88735)Many thanks again!

greggirwin

[16:54](#msg609ffcc817d35f3d9fcb3fd7)https://github.com/red/red/wiki/%5BNotes%5D-Keyboard-Handling

## Sunday 16th May, 2021

ams02468

[14:09](#msg60a127aab10fc85b569c9d95)Hello everyone, I am working on an identification program. I encountered a problem with part of the code. This is part of the program

```
a: read https://ipwhois.app/json/8.8.8.8
print a
call/console "pause >nul"
```

The output i need to display should look like \[this](https://ipwhois.app/json/8.8.8.8)  
But the output is as follows

```
{"ip":"8.8.8.8","success":true,"type":"IPv4","continent":"North America","continent_code":"NA","country":"United States","country_code":"US","country_flag":"https:\/\/cdn.ipwhois.io\/flags\/us.svg","country_capital":"Washington","country_phone":"+1","country_neighbours":"CA,MX,CU","region":"California","city":"Mountain View","latitude":"37.3860517","longitude":"-122.0838511","asn":"AS15169","org":"Google LLC","isp":"Google LLC","timezone":"America\/Los_Angeles","timezone_name":"Pacific Standard Time","timezone_dstOffset":"0","timezone_gmtOffset":"-28800","timezone_gmt":"GMT -8:00","currency":"US Dollar","currency_code":"USD","currency_symbol":"$","currency_rates":"1","currency_plural":"US dollars","completed_requests":40}
```

hiiamboris

[14:16](#msg60a129599f2c352db112422a)what you see on the site is not json per se, but converted into something readable

[14:17](#msg60a12990d523ee3d3e374569)replace `,` with`^/` and `:` with `:^-` for a start

greggirwin

[18:00](#msg60a15db89f2c352db112c0f1)Looks like JSON to me: `print load/as read https://ipwhois.app/json/8.8.8.8 'json`

And the output @ams02468 posted seems to match the output in the link. What am I missing?

gltewalt

[19:14](#msg60a16f106a950f3d46eba0e3)Nothing, it just isn't formatted "correctly" if not loaded as json.

[19:15](#msg60a16f6b5fff1f4a98de49a4)`a: load/as read https://ipwhois.app/json/8.8.8.8 'json`  
`print a`, `print a/city`, etc

## Monday 17th May, 2021

m\_a\_j\_ch\_rz\_a\_k\_twitter

[08:50](#msg60a22e50e263442db831aba2)Hello. Is is possible to run shell command from Red and don't wait the the response but attach a function which should be used when the result would be ready? Like "then" in javascript. I know that we could use the IO branch but is there other option? :)

hiiamboris

[09:01](#msg60a230d29f2c352db1149009)You could divert the output into a file and read it later

m\_a\_j\_ch\_rz\_a\_k\_twitter

[09:13](#msg60a233c4d523ee3d3e399d28)Hehe true. A little bit hack'y. Is it so complicated to add "then" in Red? I am just wondering. Maybe by adding libuv ? That one lib could solve problems with web server, client and IO stuff.

hiiamboris

[15:18](#msg60a2895b2ee2b13d95b41fd1)We don't want a lot of dependencies.

pekr

[15:24](#msg60a28a9bb10fc85b569fca15)IIRC libuv and other event libraries were source of inspiration to implement an event loop? But that was a long time ago and even related to Rebol 3.

greggirwin

[17:40](#msg60a2aa799f2c352db115d32b)&gt; A little bit hack'y.

Less performant, perhaps, but why do you think it's a hack?

&gt; Is it so complicated to add "then" in Red?

Yes. But let's start with your use case. What is your goal?

&gt; I am just wondering. Maybe by adding libuv ? That one lib could solve problems with web server, client and IO stuff.

Technically one lib, but...

1\) Add CMake to our toolchain to build it. And learn it.  
2\) Add static linking of object files from other compilers.  
3\) Build libuv.  
4\) Design Red's I/O, and map that to libuv. If we have mismatches in what we want, adapt that to libuv's model.  
5\) Stay in sync with both CMake and libuv.

The upside is that it's well known and battle tested. If there's a shared library version writing a binding for it should be doable for those who want to use it. But it looks like the project doesn't do binary releases. The downside is that our own I/O work is in really good shape and quite far along. At this point, moving to libuv would take more time than finishing it.

rebolek

[19:13](#msg60a2c05a416d8734b94fdbbf)#2 would be amazing.

## Wednesday 19th May, 2021

ams02468

[01:05](#msg60a464595623c55ed4116c80)Hello everyone, thank you for answering our previous question. Now I have another question. This is part of example script.

```
;a = Binary codes of executable file 
a: {
;binary 
}
write %test.exe a
```

As you know, binary code takes up a lot of space. Does anyone have any idea how to prevent this code from cluttering the script?

greggirwin

[01:06](#msg60a4649b86a4ae5efea7c305)You can put it in a separate file and `#include` it.

[01:07](#msg60a464b90b07f074d0943ae8)But if it's binary, be sure to use the `binary!` type, not `string!`.

ams02468

[01:41](#msg60a46cb6fcb66d74d9cf1bfb)I'm looking for a way to insert the required exe file into my program, something like sfx, which can be extracted from the program after executing exe files. Now the only solution I know of is to read binary files with the `read/binary` command. Then save them in a variable. Then write them as an executable file

greggirwin

[02:16](#msg60a475075623c55ed4118f83)Yes, there's no `#include-binary` at this time. Ladislav had that for his R2 version, which was useful at times. In Red you need to `read/binary` the file, then `save` the resulting binary value in a new file so you can include it.

ams02468

[02:49](#msg60a47cc6d770155f10f3637b)Thank you very much

hiiamboris

[05:56](#msg60a4a8a24e4b874d642b0836)`#do keep read/binary %file`

ams02468

[16:58](#msg60a543c7308dd91a93c0bfb8)Hi, I tried to convert this code to with the -r flag as test

```
#include %./red/environment/console/CLI/input.red
ams: #include-binary %rz.exe

zz: request-file
write %ttt.exe ams
```

but I got this error

```
Compiling c:\Users\username\Documents\red\compress.red ...
*** Compilation Error: undefined word request-file
*** in file: c:\Users\username\Documents\red\compress.red
*** near: [request-file
```

hiiamboris

[17:01](#msg60a5447afcb66d74d9d1401a)you need the View module for requesters

[17:01](#msg60a5448040194369b6de9406)`Red [needs: view]`

## Thursday 20th May, 2021

ams02468

[01:03](#msg60a5b54a5fcfdb5ebd775a0f)Does red have anything like the `request-file` command to save the file?

[01:25](#msg60a5baa6d770155f10f67730)path

greggirwin

[02:13](#msg60a5c5e711fe9c1aa4736cd9)`? req` will show you what requestors are currently built in. There are other experiments out there as well.

lylgithub2021

[02:22](#msg60a5c7db5fcfdb5ebd77816d)My question is: where to find the file "input.red". I just have red.exe from the red website.

greggirwin

[02:23](#msg60a5c83240194369b6dfd5fa)In %environment/console/CLI/ of the Red source.

lylgithub2021

[02:27](#msg60a5c9075623c55ed414e1ba)I searched my C disk and the folder which contains red.exe, not finding `input.red`.

greggirwin

[02:30](#msg60a5c9ded770155f10f69bb2)You need to clone the repo or look at the source on github. You can also download the zip of the source so you have it all. https://github.com/red/red

lylgithub2021

[02:35](#msg60a5caf3ee77a74d6860bdfc)Thank you very much!! @greggirwin

ams02468

[02:44](#msg60a5cd02308dd91a93c216a6)Does red support SaveFileDialog?

greggirwin

[03:11](#msg60a5d35440194369b6dfefb0)@ams02468 yes, see my message above.

m\_a\_j\_ch\_rz\_a\_k\_twitter

[12:45](#msg60a659f971431f7a08cf1bd1)Hello, how I can use gui on Linux? I have "view has no value".

hiiamboris

[12:47](#msg60a65a5d71431f7a08cf1c71)use a nightly build

## Friday 21st May, 2021

ams02468

[17:04](#msg60a7e80fbdecf719a06fb4ad)How much volume can be placed in the `#include-binary` command?  
I tried to put a 1GB file in it, but I get this error for compile

```
Red Compiler Internal Error: Script Error : Not enough memory
Where: emit-string
Near:  [str: to string! str
either
]
```

hiiamboris

[17:19](#msg60a7eb89df5c362d4be2c2ca)

[17:20](#msg60a7ebdb84a2f633a765435f)To think of it, no idea.. Depends on how compiler uses it (:

[17:21](#msg60a7ec14bdecf719a06fc198)Let me guess. You wanted to bloat your exe with random junk to make it big and solid looking? :D

ams02468

[18:04](#msg60a7f628bdecf719a06fde4f)No I'm trying to make something like sfx

[18:05](#msg60a7f68414d9cd234a4e0821)Put the compressed file with the executable file inside an executable file

hiiamboris

[18:06](#msg60a7f6ac14d9cd234a4e0865)Ideally then you should just append the binary payload to the already compiled exe.

[18:07](#msg60a7f6d443fc4a24c5b9dc8e)Still, Red being 32-bit won't be able to decompress 1-2GB binaries (until full I/O with stream compression/decompression)

[18:17](#msg60a7f95145c2185a5ee073f1)One thing you can do is decode that payload in chunks, e.g. 100M each.

[18:18](#msg60a7f9809d18fe19981a4daa)Next limit will be max file size Red can read or write, which I haven't tested.

## Saturday 22nd May, 2021

lylgithub2021

[08:33](#msg60a8c1cdbdecf719a0719ef2)I have two files named "`1.red`", "`2.red`" in the folder `%./0/`.I tried to get them with relevant path like this:

```
collect [
foreach i ["1.red" "2.red"] [keep %./0/(to-file i)]
]
```

`[%./0/1.red %./0/2.red]` is expected, but what I got is: `[%./0/ %./0/]`  
Why? And how to deal with this?

hiiamboris

[08:35](#msg60a8c246fec22b4786d40b37)

```
>> [keep %./0/(to-file i)]
== [keep %./0/ (to-file i)]
```

file! is not a path!, it's a string! variant, you can't use parens in it, so the expression above is lexed separately

[08:39](#msg60a8c358bdecf719a071a1c2)options:

```
>> root: %./0
== %./0
>> root/:i
== %./0/1.red
```

```
>> rejoin [%./0/ i]
== %./0/1.red
```

```
>> composite[] %"./0/(i)"
== %./0/1.red
```

(last uses https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/composite.md)

lylgithub2021

[08:58](#msg60a8c7b13d43a15a65bc5ee1)Good solutions and perfect jobs on `composite`! Thank you! @hiiamboris

[09:14](#msg60a8cb91688a2624b8a5a70d)@hiiamboris Where can I find detail descriptions about Red macro?

hiiamboris

[09:16](#msg60a8cc0443fc4a24c5bbad5b)https://w.red-lang.org/en/preprocessor/

lylgithub2021

[09:19](#msg60a8cc8a0ff6de262b212681)Thank you.

## Wednesday 9th June, 2021

abdllhygt

[13:05](#msg60c0bcac84c2f15b796db79b)is the next version 0.7? not 0.6.5?

## Tuesday 15th June, 2021

brk-klymn

[21:40](#msg60c91e4b5e8dfc4f1182ea6a)hey, I

[21:41](#msg60c91e6cd855766185dc89d4)when I try the view example in get started section it says script error view has no value

[21:42](#msg60c91ed1d855766185dc8aa0)any suggestions on fixing it?

greggirwin

[21:52](#msg60c9210d56df183c23183e49)@brk-klymn do you have `needs: view` in the header?

[21:52](#msg60c92128d161a54f05199fc0)@abdllhygt we're still hoping to change the release model...soon.

brk-klymn

[22:03](#msg60c923abc705e53c1c93bb6a)I'm using the red console, how can I check the header?

[22:15](#msg60c9267e8681550d4ef1396b)even when I compile and add Red \[Needs: 'View] it says view has no value. I'm using fedora linux if it helps

greggirwin

[22:56](#msg60c93023d855766185dcaf7f)Use the GUI console.

brk-klymn

[22:57](#msg60c93044d20143617e49262e)sorry for the ignorance, how do I use it?

greggirwin

[22:57](#msg60c93071d161a54f0519c20c)If you're compiling, it should work. What does `about` say, just to make sure you're running a GTK enabled version.

Just run `red` and it should build and run the GUI console.

brk-klymn

[23:01](#msg60c9313fd855766185dcb27a)Red 0.6.4 for Linux built 22-Nov-2018/3:40:38+03:00 commit #755eb94

greggirwin

[23:05](#msg60c9321dbed13a2dba86e973)Use the automated build. No GTK in that version.

brk-klymn

[23:14](#msg60c9346cd855766185dcb95f)works perfectly! thank you very much!

## Friday 25th June, 2021

hardkorebob

[00:47](#msg60d527b1258ebf6d92e96ecc)Just getting Red compiled! :)

[00:50](#msg60d5284bf862a72a30d06d05)Unfortunate the Last update on 20-Dec-2019 for red by example website

[00:50](#msg60d52866bcb3e8060ee1fb67)Yet soo much to learn

gltewalt

[01:05](#msg60d52bf78c12474d8ccf2db8)What do you need? I recommend downloading from Automated builds, master branch.  
https://www.red-lang.org/p/download.html

[01:06](#msg60d52c01effd491d8c82c36b)Examples? Learning material?

[01:12](#msg60d52d8065513b4d912df8cf)https://www.red-lang.org/p/getting-started.html

[01:12](#msg60d52d88effd491d8c82c668)http://helpin.red/

[01:12](#msg60d52d938a40b11728288f32)https://github.com/red/red/wiki/%5BHOWTO%5D-How-Do-I-Do-X-with-Red%3F

[01:12](#msg60d52d99f862a72a30d0792b)https://github.com/red/red/wiki/Examples

[01:16](#msg60d52e84bef0c66d9d21e02c)And for good measure... bookmark it and worry about it after you get your feet under you:  
https://github.com/red/docs/blob/master/en/style-guide.adoc

hardkorebob

[01:24](#msg60d53053b60c3137c38eb1a3)/hello: error while loading shared libraries: libgdk\_pixbuf-2.0.so.0: cannot open shared object file: No such file or directory

[01:24](#msg60d5305a457e19611a1955df)I have that library

[01:24](#msg60d5305c6c992105fd9a814c)Ugh

[01:26](#msg60d530aa24f0ae2a24275ad5)Cant run ./console either

gltewalt

[01:29](#msg60d53178368d0e1d9a255787)linux?

[01:31](#msg60d531e4457e19611a19598f)If so, remember to chmod the binary

[01:32](#msg60d5321ff862a72a30d08326)Follow the getting started page, if you haven't, and let me know  
https://www.red-lang.org/p/getting-started.html

[01:34](#msg60d5328c8a40b117282899b9)I usually change the name of the download to `red`, move it into my home directory and `chmod` it. Then `./red` should start the console building process.

hardkorebob

[01:57](#msg60d537fc24f0ae2a242769fe)I followed building from source using Rebol

[01:57](#msg60d538119cf3171730f263b1)Running Red from the sources (for contributors) &lt;&lt;&lt;

[01:58](#msg60d53856457e19611a196600)chmod it? its already an executable

[01:59](#msg60d538658a40b1172828a4d2)rwxr--r-- 1.2M hardkorebob 24 Jun 21:19 console

[02:01](#msg60d538de8a40b1172828a5b3)doing $ chmod +x == rwxr-xr-x 1.2M hardkorebob 24 Jun 21:59 console... and even then I get the same error

gtzip

[02:04](#msg60d53994f862a72a30d0910e)Try downloading the automated build. There may be something thats out of date in the build from source directions.

ne1uno

[02:14](#msg60d53c1c258ebf6d92e99bd1)needs 32 bit version of any libs

gltewalt

[02:15](#msg60d53c2e110daa37b1045238)Yeah. Like `yum install gtk2.i686`

hiiamboris

[07:26](#msg60d58516f862a72a30d13105)Instructions are on the downloads page.

hardkorebob

[19:13](#msg60d62ad6258ebf6d92ebbcb7)Running the autobuild

[19:16](#msg60d62b7065513b4d9130413a) ╰─λ ./red-25jun21-fe27c1d30  
Compiling compression library...  
Compiling Red console...  
/home/hardkorebob/.red/console-2021-6-25-57821: error while loading shared libraries: libgdk\_pixbuf-2.0.so.0: cannot open shared object file: No such file or directory

╭─hardkorebob@krsnaloka in /mnt/red took 2m7s  
╰─λ find /usr -name libgdk\_pixbuf-2.0.so.0  
/usr/lib/x86\_64-linux-gnu/libgdk\_pixbuf-2.0.so.0

[19:16](#msg60d62b8b8c12474d8cd17367)Where is it looking for the library

Respectech

[19:28](#msg60d62e438a40b117282ad090)OT: @hardkorebob It looks like you're running Konsole - what distro are you running on?

[19:28](#msg60d62e7ab60c3137c390fb77)On topic: Red is looking for the 32-bit lib, and yours is a 64-bit lib. You're going to have to install the 32-bit libs as well.

hiiamboris

[19:29](#msg60d62eb28a40b117282ad189)downloads page is this one: https://www.red-lang.org/p/download.html

Respectech

[20:00](#msg60d635c26c992105fd9cd9cb)@hardkorebob On Arch (Garuda), I had to perform the following command to get red-latest to run: `sudo pacman -Syu lib32-curl lib32-gtk2 lib32-gtk3`

hardkorebob

[22:22](#msg60d6571d8c12474d8cd1db8b)Oh lord! Im such a dummy

[22:22](#msg60d657274e325e6132a3f97c)I never saw the instructions on the download page

[22:22](#msg60d657296c992105fd9d2588):(

[22:22](#msg60d65734f862a72a30d324de)Thank you @Respectech

[22:30](#msg60d6592265513b4d9130a5cb)Reporting after installation of 32bit deps. I have the Red prompt from the AutoBuild! :)

[22:33](#msg60d659c06c992105fd9d2a47)Compiled from latest git clone. Success as well.

[22:37](#msg60d65aae4e325e6132a400fd)This normal?

[22:37](#msg60d65ab16c992105fd9d2c5f)https://nopaste.net/gtkWarningsForLatestRedHelloProgram

[22:37](#msg60d65ac4258ebf6d92ec27b0)I get the Hellos in the terminal not a seperate window

gtzip

[22:47](#msg60d65d0ebcb3e8060ee4b86d)I occasionally get gtk warnings but nothing like that.

[22:47](#msg60d65d1765513b4d9130ac6c)@qtxie

Respectech

[23:12](#msg60d662c74e325e6132a4146f)I also get gtk warnings. See red/gui-branch for an example. :-)

## Saturday 26th June, 2021

qtxie

[02:15](#msg60d68dd38a40b117282b9269)&gt; This normal?

It's normal. The warning messages are different on different GTK versions.

hiiamboris

[07:11](#msg60d6d3218a40b117282c122d)wow :) I usually get just one warning

greggirwin

[18:45](#msg60d775ce368d0e1d9a2a35eb)@hiiamboris cultural differences. Russians always get only one warning. Here we give endless warnings with no consequences.

hiiamboris

[18:55](#msg60d7780d9cf3171730f7240f)ROFL

greggirwin

[21:33](#msg60d79d1ebcb3e8060ee731c9)We need to consider that in our L10N/I18N system. :^)

## Monday 28th June, 2021

hardkorebob

[00:04](#msg60d91210f862a72a30d88bea)@greggirwin lol

[01:47](#msg60d92a479cf3171730fa99c6)Live coding yet for Linux?

[01:47](#msg60d92a4e110daa37b10c87b0)GUI i meant

[01:48](#msg60d92a8b6c992105fda2bf1e)Sorry I may be confusing what Im reading

greggirwin

[01:49](#msg60d92a94bcb3e8060eea548e)I haven't tried the live code demos there, but that's an easy thing to do if you're on Linux already.

[01:50](#msg60d92ad724f0ae2a242f9d31)\[Basic](https://github.com/red/code/blob/master/Showcase/livecode.red)

[01:51](#msg60d92b20258ebf6d92f1b819)Have to find Didier's enhanced version. @DideC might step in, or others who are working on GUI designers.

[01:52](#msg60d92b5df862a72a30d8bd18)A couple are \[here](https://github.com/red/community/tree/master/apps)

[01:53](#msg60d92b94bcb3e8060eea566c)\[Didier's](https://gist.github.com/DideC/85d60c99f97f2e4972a6f7b09a1fe630)

gltewalt

[02:05](#msg60d92e528c12474d8cd78a2d)Other GUI samples  
https://github.com/red/code/tree/master/Showcase

hardkorebob

[13:01](#msg60d9c83b368d0e1d9a2f03ce)This is an amazing thing, its soo Red and gorgeous as a rose. I must give you guys mad props for doing all this. I will start evangelizing soon on YouTube and other mediums like a web page written with Red to help other newbies like me get into this really cool tech.

[13:34](#msg60d9cfc9bef0c66d9d2b7d3c)https://youtu.be/GCxoNCn5PzA

[13:34](#msg60d9cfd4b60c3137c3985286)I will get better at presenting things.

[13:35](#msg60d9d00f9cf3171730fbf548)But I have never preached for any tech before. I have used a lot of it. Been running online since I was 12 yo and Im 37 now. So I have a good bit of knowledge. Thirsty for more daily. Thanks for the time.

hiiamboris

[14:51](#msg60d9e1eb258ebf6d92f34c3c)Haha man you're so random in your video :) But I'm sure you will get better at it. Good audio quality btw.

On a side note: there are no keywords in Red.

hardkorebob

[15:03](#msg60d9e4b865513b4d9137d659)https://www.youtube.com/channel/UC0Z2PaRSV06dRJ62h\_S7bPw

[15:03](#msg60d9e4caeffd491d8c8cabd9)@hiiamboris :) Im liking the feel of this.

[15:28](#msg60d9ea85b60c3137c3988e06)https://youtu.be/buTEKR2sKLo

cloutiy

[15:56](#msg60d9f1254e325e6132ab4c23)@hardkorebob nice videos. Here are a couple videos on my channel where i go step by step on how to use 'parse' to parse a markup language to generate a document. Not finished yet...having a hard time finding a quiet place to record. https://youtu.be/1riJ1PYYOfQ

hardkorebob

[16:16](#msg60d9f5c6bcb3e8060eec0c24)@cloutiy Yes I love your videos dude! You are responsible for mine. lol You inspired me to get into this. I need to finish your tutorials.

Respectech

[16:44](#msg60d9fc7865513b4d91380dde)@cloutiy I found the best place to record quiet videos was in a car in my garage with the windows rolled up. May or may not work for you.

[16:45](#msg60d9fc9c6c992105fda493cf)@hardkorebob I also run Garuda Linux and I'm into Red. What are the chances?

## Tuesday 29th June, 2021

hardkorebob

[00:10](#msg60da64d9bcb3e8060eed083b)@Respectech I tried it but the rolling idea doesnt appeal. Too many breaks and unexplained issues with OBS for recording so I stick to Devuan. I do like the name and eye-candy of Garuda Linux. Garuda is sanskrit and I love Vedic truth.

[13:57](#msg60db26d7258ebf6d92f6474c)So is Red a dialect of Red/System or is R/S a dialect of Red?

rebolek

[14:00](#msg60db2784258ebf6d92f64905)R/S is a dialect of Red.

[14:01](#msg60db27b9f862a72a30dd50c4)It may seem strange because Red is build in R/S, but you should think of Red as a data format, not a language (it’s also a language but the data format part is really important).

hardkorebob

[15:17](#msg60db399e65513b4d913ae6d3)Yes Im letting that sink in

[15:18](#msg60db39a824f0ae2a24344a8e)Thank you @rebolek

[15:27](#msg60db3bd6b60c3137c39ba856)\*\** Script Error: append does not allow none! for its series argument  
\*\** Where: append  
\*\** Stack: view do-events do-actor do-safe open

[15:27](#msg60db3be98c12474d8cdc3733)open: function \["Open selected file, read contents"][  
if picked: request-file [  
ide-file-name/data: picked  
append clear ide-the-text/text read picked  
]  
]

[15:27](#msg60db3bf28a40b117283581f9)what am i doing wrong?

[15:27](#msg60db3bfebef0c66d9d2ebeb9)I cant see the contents of the file

hiiamboris

[15:30](#msg60db3c7965513b4d913aee4a)first, there's a markdown cheatsheet below and to the right of input line here ☺ ---&gt;

hardkorebob

[15:30](#msg60db3c98457e19611a2658b8)Sorry I pasted directly from terminal without realizing the *

[15:30](#msg60db3c9b368d0e1d9a326811):)

[15:31](#msg60db3cb58a40b1172835851e)Oh I see also I can do code blocks. my bad, im not used to such cool features

hiiamboris

[15:31](#msg60db3ce2b60c3137c39baad7)second, you can use `probe` to inspect intermediate values  
obviously your `ide-teh-text/text` is none as `append` says

hardkorebob

[15:33](#msg60db3d3d9cf3171730ff5207)fixed it

[15:33](#msg60db3d404e325e6132ae53e6)by adding

[15:33](#msg60db3d67b60c3137c39babaf)an empty string ""

## Sunday 11st July, 2021

ams02468

[07:40](#msg60eaa06bf2b4077d6bbe2516)Hi, I hope you have a good day. I have a problem now  
I want the output answer of this code to be variable, but it gives me a string answer, please help me

```
set [a A b B c C d D]func [] [print "ams"]
set [e E f F g G h H i I j J k K]func [] [print "nod"]
set [l L m M o O p P q Q r R s S t T u U]func [] [print "gdi"]
set [v V w W x X y Y z Z]func [] [print "zoc"]
aa: random/only/secure [a A b B c C d D e E f F g G h H i I j J k K l L m M o O p P q Q r R s S t T u U v V w W x X y Y z Z]
print aa
```

hiiamboris

[09:32](#msg60eaba9bec10653d5a340c9d)I've not the slightest idea what this code is supposed to do :)

[09:32](#msg60eabac7f1274d5e50410509)What output do you expect?

[09:34](#msg60eabb1b7473bf3d781bf34d)Also, words in Red are not case-sensitive.

ams02468

[15:01](#msg60eb07dd7473bf3d781c95d5)I want to run some code randomly as a function

dsunanda

[15:08](#msg60eb097d17929c14e67faa02)@ams02468 Something like this?

```
random-functions: reduce [
    func [] [print "ams"]
    func [] [print "nod"]
    func [] [print "gdi"]
    func [] [print "zoc"]
    ]
aa: random/only/secure random-functions
print aa
```

ams02468

[15:52](#msg60eb13b838da567d8294a7f2)ye tnx @dsunanda

greggirwin

[16:25](#msg60eb1b93049a0c3e5369c760)@ams02468 you can see now that something like `reduce` is needed so your block refers to functions. But if you use `reduce` on your block, you'll see that you run into issues. A good experiment for you. So another way to do what you want is to evaluate the single word you get. e.g.

```
set [a A b B c C d D]func [] [print "ams"]
set [e E f F g G h H i I j J k K]func [] [print "nod"]
set [l L m M o O p P q Q r R s S t T u U]func [] [print "gdi"]
set [v V w W x X y Y z Z]func [] [print "zoc"]
loop 10 [
	aa: random/only/secure [a A b B c C d D e E f F g G h H i I j J k K l L m M o O p P q Q r R s S t T u U v V w W x X y Y z Z]
	do aa
]
```

gltewalt

[16:39](#msg60eb1ed0ec10653d5a34ec2d)What about?

```
obj: object [
  a: does [print "foo"]
  b: does [print "bar"]
  c: does [print "baz"]
]
do random/only words-of obj
```

greggirwin

[16:41](#msg60eb1f4023fd26511da74265)That works too. Also `/secure` doesn't make sense here, but I can't edit my post now.

ams02468

[16:52](#msg60eb21d10853e41c0d5061a4)Thanks for your answer. Now I want to delete any function that was randomly selected in the next selection (I want to use the loop).

dsunanda

[17:21](#msg60eb28957473bf3d781cd9b1)@ams02468 Do you mean something like this?

```
random-functions: reduce [
    func [] [print "ams"]
    func [] [print "nod"]
    func [] [print "gdi"]
    func [] [print "zoc"]
    ]
loop length? random-functions [
    aa: random/only/secure random-functions
    print aa
	remove find random-functions :aa
	]
probe random-functions ;; now empty!
```

Note there are much better ways to do this if yoyu refactor the code....The above is just a minimum edit of the previous code.

greggirwin

[17:21](#msg60eb289c82dd9050f5e62403)There's more than one way. `remove find ...` or use `random` to get an index and use `remove at ...`

[17:22](#msg60eb28f367b72e1bfe06fa45)You could also use `random` without `/only` and `take` from that to get your func.

[17:23](#msg60eb2926f1274d5e5042042b)In Red there are almost always multiple ways to do something. What's important is using the one that makes your intent the clearest.

gltewalt

[17:29](#msg60eb2a727473bf3d781cde6e)

```
loop 3 [
 do set 'temp random/only words-of obj
]
obj/(temp): none
```

[17:30](#msg60eb2ac767b72e1bfe06fd98)I don't know if you want a random function to fire and then be deleted, or if you want to fire the next random function and then delete the previous function

ams02468

[20:08](#msg60eb4fa07b5a415e65de082b)For example, if ams is selected in the above code, this ams function will be removed from the random-functions variable. This process will continue until all functions are removed from the variable.

gltewalt

[21:28](#msg60eb627067b72e1bfe077319)Might be better to use block! rather than object if you want a bunch of "variables" or functions, but...

```
>> obj: object [
[      a: does [print "foo"]
[      b: does [print "bar"]
[      c: does [print "baz"]
[    ]
== make object! [
    a: func [][print "foo"]
    b: func [][print "bar"]
    c...
>> num-times: 3
== 3
>> loop num-times [
[     attempt [do set 'temp random/only words-of obj unset temp]
[    ]
bar
foo
== none
>> ?? obj
obj: make object! [
    a: unset
    b: unset
    c: func [][print "baz"]
]
```

## Tuesday 13th July, 2021

ams02468

[13:28](#msg60ed94f523fd26511dacc2a3)Hello everyone for your answers to the previous question. Thank you. I wanted to know if there is a code or command for moving and renaming files and directories? Or should I write its function?

hiiamboris

[13:33](#msg60ed962617929c14e685647e)`? rename`

ams02468

[13:35](#msg60ed96ad82dd9050f5eb9155)for move file ? (cut)

hiiamboris

[13:56](#msg60ed9b7a67b72e1bfe0c6588)same.

ams02468

[15:35](#msg60edb2bb049a0c3e536f9be3)can you give an example for move and rename for file?

greggirwin

[17:04](#msg60edc78e049a0c3e536fd5ff)@ams02468 the best thing is to try it and learn how it works. Start with `help rename` in the console.

[17:05](#msg60edc7f6ec10653d5a3b010f)https://www.red-by-example.org/ also has a lot of info, but it doesn't look like there's an entry for `rename` yet.

## Wednesday 14th July, 2021

leibniz:matrix.org

[10:58](#msg60eec34682dd9050f5ee55c7)What's the embedded story? Arm, ESP, AVR ?

[14:04](#msg60eeeed882dd9050f5eec24b)What is Red/System really? Is it another language or is it a language written in Red?  
Suppose one wants full control over memory (happens on embedded dev). Does one need to write in both Red and Red/System?

greggirwin

[16:24](#msg60ef0fae48f9b1084a2d553f)ARM is a working target. We don't have anything on ESP or AVR.

Red/System is a C level language. If your hardware is tightly constrained you can write purely in that and have total control. If your hardware has more memory, you can leverage Red and it's high level runtime, mixing in Red/System as needed for performance or hardware access.

## Thursday 15th July, 2021

leibniz:matrix.org

[13:30](#msg60f0387b951c58084ede0469)@greggirwin: Thanks! If this "Red/System" is another language, could it also have been named something else? I mean, why is there a "Red" and a "/" in there that seem to suggest it is a DSL written in RED? (sorry my question may seem obvious)

[13:32](#msg60f038e523fd26511db2de3f)By C-level, do you mean low-level as C programming language? Or is it so that "C-level" has a meaning in programming language design?

pekr

[13:55](#msg60f03e5d38da567d82a0830e)Whatever you do / program in Red and try to compile, compiles down to Red/System intermediate language first. Then there is a second stage compiler, which compiles R/S down to a native code. You can eventually use R/S directly for some low level stuff too. The reason why Red does not support 64 bit yet, stems down to the secondary compiler - it does not output 64 machine code yet and needs to be rewritten / adapted. Sorry if innacurate by the guru measures :-)

[13:58](#msg60f03eeaec10653d5a40a364)What is probably meant by the "C-level" is the fact, that in the end, it produces the native target platform code. In comparison to some GCC and such, there is a little to none optimisations yet. So far, R/S apps are claimed being cca 4 times slower, than the C app counterpart. After the compiler gets some optimisations, it might get into 1.x-2 times slower ballpark ....

[14:00](#msg60f03f6d951c58084ede180c)You can look into red\\runtime\\platform folder to see the targets and study how it is done recently ....

hiiamboris

[14:23](#msg60f044d50853e41c0d5c23a3)@leibniz:matrix.org Don't confuse implementations with languages.  
\- Red/System is a DSL of Red. Red being dynamic and versatile, while R/S uses a subset of it, giving it a strict meaning.  
\- Red is implemented so that it compiles down to R/S. R/S being a bit lower level language than C, allowing you to work with hardware directly.

leibniz:matrix.org

[14:50](#msg60f04b52049a0c3e5375a6a4)Thanks. I know only C, Java and Python. No experience in LISP, PROLOG, REBOL or Haskell... Should I first learn one of them to somehow appreciate a different programming language like Red?

[14:52](#msg60f04bbc82dd9050f5f1d819)Many of folks who seem to like Red, are coming from lisp, rebol...It seems I don't have the background for it

[23:35](#msg60f0c635515cab3e4fbd79fc)I gather Android GUI support is not finished yet...but if it is done, would it be dependent of Android SDK/NDK?

## Friday 16th July, 2021

Respectech

[13:37](#msg60f18bb2d2556414f569a2dd)No, it won't require the Android SDK.

leibniz:matrix.org

[14:56](#msg60f19e0917929c14e68e8422)@Respectech: wow! So it would be the \_only_ solution to develop GUI apps for android without needing to download those ~5GiB of Android SDKs

Respectech

[16:11](#msg60f1af94f1274d5e50510113)As far as I know, yes.

xmonader

[17:03](#msg60f1bbcb82dd9050f5f50f4b)Hi, the latest post on the website is a year ago? does it mean it's not active anymore?

greggirwin

[18:45](#msg60f1d3ca0853e41c0d5f95ba)@xmonader we are active every day. Follow the chat here and watch https://progress.red-lang.org/. We hope to get a new blog post out soon.

leibniz:matrix.org

[18:55](#msg60f1d62548f9b1084a3374ee)@greggirwin: By the way, you guys are on HN :D  
https://news.ycombinator.com/item?id=27835400

greggirwin

[19:02](#msg60f1d7b1ec10653d5a4439f4)Thanks for the heads-up!

## Saturday 17th July, 2021

planetsizecpu

[13:15](#msg60f2d7d417929c14e6912432)@greggirwin it would be great to read some word from @dockimbel as we miss his input since long time, I'm sure he is a lot to tell us. 😉

greggirwin

[17:35](#msg60f314d6951c58084ee44c01)I'll work on that. :^)

ams02468

[22:13](#msg60f355ef515cab3e4fc30eea)Hello, how can I just get the file name from the request-file command?

[22:25](#msg60f358f5951c58084ee4da03)for example

```
a: request-file
== %"/C/22.exe"
```

but i just need 22.exe

greggirwin

[22:30](#msg60f359f223fd26511db99ab1)`split-path`

ams02468

[22:52](#msg60f35f2a951c58084ee4e636)tnks

## Sunday 18th July, 2021

gltewalt

[01:38](#msg60f3860c7473bf3d782fad5a)`last split-path request-file`

## Tuesday 20th July, 2021

ams02468

[02:58](#msg60f63bbdd8381a2a838016ff)Hi, I have a block type variable when I convert it to a string

```
>> zx
== [z1 z2 z3 z4 z5 z6 z7 z8 z9 z10]
>> to-string zx
== "z1z2z3z4z5z6z7z8z9z10"
```

What I want is an output like this  
"z1 z2 z3 z4 z5 z6 z7 z8 z9 z10"  
Thank you for your help

greggirwin

[03:39](#msg60f6456ee9aaeb7fbe0f5cdb)`form` or `mold` is what you're after.

[03:39](#msg60f6458d23956a5aa4466af8)Look at the help for both to note the important difference between them.

mikeyaunish

[21:30](#msg60f740769e84ba381e2ec5d7)@hardkorebob you can find livecode and GUI manipulation here:\[https://github.com/mikeyaunish/direct-code](http://https://github.com/mikeyaunish/direct-code)

## Thursday 29th July, 2021

ams02468

[06:53](#msg6102505bf4d1dc69f30eb75d)Hello, is there a way to extract the names of variables from this code, not their data?

```
ra: reduce
[
    a1: "x"
    a2: "x1"
    a3: "x3"
    a4: "x3"]

print pick ra 1
```

toomasv

[09:21](#msg6102731a23956a5aa460be58)@ams02468 It is possible until you haven't reduced the block, e.g.

```
ra: reduce ar: [
    a1: "x"
    a2: "x1"
    a3: "x3"
    a4: "x3"]

extract ar 2
;== [
;    a1: 
;    a2: 
;    a3: 
;    a4:
;]
```

Or, if you create a context:

```
ra: context [
    a1: "x"
    a2: "x1"
    a3: "x3"
    a4: "x3"]
words-of ra
;== [a1 a2 a3 a4]
```

But if you first `reduce` the block, you'll have only values in the block and words referring to these values in global context.

## Monday 2nd August, 2021

ams02468

[05:12](#msg61077ecf926ce249e5995520)@toomasv tnks

## Friday 6th August, 2021

Sergey\_Vladivostok\_gitlab

[01:06](#msg610c8b2d9484630efa226bd8)Hi!  
Ubuntu 18.04 (Linux 4.15.0-136-generic #140 i686)  
red-05aug21-e01002f7c  
clock1.red

```
Red []

View [
    base 200x200 black transparent rate 1 now draw [
        scale 2 2
        fill-pen #0B79CE pen off
        circle 50x50 45
    fill-pen black
    circle 50x50 44
        line-width 5
        hour: rotate 0 50x50 [pen #033333 line 50x50 50x25]
        line-width 3
    min:  rotate 0 50x50 [pen #023963 line 50x50 50x10]
    line-width 1
        sec:  rotate 0 50x50 [pen #CE0B46 line 50x50 50x10]
    fill-pen #0b79ce
    circle 50x50 5
    ] on-time [
        time: now/time
        hour/2: 30 * time/hour
        min/2:  6  * time/minute
        sec/2:  6  * time/second
    ]
   ]
```

trying compile

```
user@dell:~$ red -c clock1.r

-=== Red Compiler 0.6.4 ===-

Compiling /home/user/clock1.r ...
Compiling libRedRT...
...compilation time : 15717 ms

Compiling to native code...
...compilation time : 537005 ms
...global words     : 21274 (64.67%)
...linking time     : 9299 ms
...output file size : 1214724 bytes
...output file      : /home/user/libRedRT.so

...compilation time : 664 ms

Target: Linux

Compiling to native code...
...compilation time : 15390 ms
...global words     : 21719 (66.02%)
...linking time     : 1604 ms
...output file size : 79436 bytes
...output file      : /home/user/clock1


user@dell:~$ ./clock1

*** Runtime Error 1: access violation
*** at: B7E62A23h

user@dell:~$ red -c -d clock1.r

-=== Red Compiler 0.6.4 ===-

Compiling /home/user/clock1.r ...
Compiling libRedRT...
...compilation time : 16110 ms

Compiling to native code...
^[[D...compilation time : 588362 ms
...global words     : 21297 (64.74%)
...linking time     : 86613 ms
...output file size : 4150544 bytes
...output file      : /home/user/libRedRT.so

...compilation time : 1019 ms

Target: Linux

Compiling to native code...
...compilation time : 18075 ms
...global words     : 21742 (66.09%)
...linking time     : 2991 ms
...output file size : 166252 bytes
...output file      : /home/user/clock1

user@dell:~$ ./clock1

*** Runtime Error 1: access violation
*** in file: /home/user/datatypes/money.reds
*** at line: 40
***
***   stack: ***-boot-rs
***   stack: ***-main
```

how fix?

greggirwin

[01:08](#msg610c8ba5933ee46b75410502)If you're using `view`, be sure to put `needs: view` in the header.

Sergey\_Vladivostok\_gitlab

[01:11](#msg610c8c33933ee46b75410632)I will take into account.

[01:12](#msg610c8c6c3eec6d41d13f8a3e)`red ./clock1.r` work fine

[03:26](#msg610cabef2453386b6c381f44)@greggirwin, Does not help. the error remained

gltewalt

[04:07](#msg610cb56caedfa70f0d7b344d)

```
-=== Red Compiler 0.6.4 ===- 

Compiling /home/gt/clock.red ...
...using libRedRT built on 2-Aug-2021/2:13:12
...compilation time : 44 ms

Target: Linux 

Compiling to native code...
...compilation time : 1652 ms
...global words     : 11051 (33.59%)
...linking time     : 101 ms
...output file size : 79400 bytes
...output file      : /home/gt/clock
```

[04:07](#msg610cb58e4b7707158f696237)Compiles and runs fine.

[04:08](#msg610cb5b2949a3d73861fdb7f)`Red 0.6.4 for Linux built 28-Jul-2021/20:30:34-06:00 commit #6e09c00`

[04:08](#msg610cb5cb949a3d73861fdbbf)

```
>> print os-info
name: "Linux Mint 20"
arch: 'x86_64
version: 5.4.0
build: "#90-Ubuntu SMP Fri Jul 9 22:49:44 UTC 2021"
```

[04:25](#msg610cb9adaedfa70f0d7b3c0f)@Sergey\_Vladivostok\_gitlab Are you using automated build binary, or your own build?

Sergey\_Vladivostok\_gitlab

[04:26](#msg610cb9e8933ee46b75416757)@gltewalt nightly build binary

gltewalt

[04:29](#msg610cba914bfde341d945fa4c)I'm grabbing the august 5th build to test

[04:31](#msg610cbb32933ee46b75416961)The latest works for me. No errors.

[04:32](#msg610cbb474bfde341d945fb6c)https://static.red-lang.org/dl/auto/linux/red-latest

Sergey\_Vladivostok\_gitlab

[04:38](#msg610cbcc24b7707158f69714c)@gltewalt could the old cpu be causing it?

```
Architecture: i686
CPU op-mode (s): 32-bit
Byte Order: Little Endian
CPU (s): 1
On-line CPU (s) list: 0
Threads per core: 1
Cores per socket: 1
Sockets: 1
Manufacturer ID: GenuineIntel
CPU family: 6
Model: 11
Model Name: Mobile Intel (R) Pentium (R) III CPU - M 1000MHz
Stepping: 4
CPU MHz: 997.500
CPU max MHz: 997.5000
CPU min MHz: 731.5000
BogoMIPS: 1993.68
Flags: fpu vme de pse tsc msr pae mce cx8 sep mtrr pge mca cmov pse36 mmx fxsr sse cpuid pti
```

[04:46](#msg610cbea34b7707158f697566)confuses `datatypes/money.reds` in error

```
user@dell:~$ ./clock1

*** Runtime Error 1: access violation
*** in file: /home/user/datatypes/money.reds
*** at line: 40
***
***   stack: ***-boot-rs
***   stack: ***-main
```

gltewalt

[05:21](#msg610cc6dc7555e33351f7c464)I don't know - that error doesn't make sense in this

[05:23](#msg610cc7564b7707158f698696)Here's that line in `money.reds`

[05:23](#msg610cc75729b165332e60541d)https://github.com/red/red/blob/ef6ca5e864b2117853f794a34f9af920cbe4328e/runtime/datatypes/money.reds#L40

[05:35](#msg610cca28f31bc0605a49dcf4)If you cast your `sec/2` to an integer, still error?

[05:39](#msg610ccaf4949a3d7386200641)If it really is something in money.reds, it would more likely be `KEEP_FRACTIONAL` or `HALF_FRACTIONAL`. Before line 40

[05:45](#msg610ccc718fc359158c56adfd)`sec/2: to-integer 6 * time/second`

Sergey\_Vladivostok\_gitlab

[06:17](#msg610cd3e77555e33351f7e0cd)@gltewalt The error remains. If you just run it, then everything works, but the compiled program does not. Can the output of diagnostic information be increased?

[06:35](#msg610cd8427555e33351f7e843)compiled

```
a: now/time
print to-integer a/second
```

error on cpu P3  
works on cpu I3

[06:38](#msg610cd8eef31bc0605a49fbd2)run \`red ./tmp16546.red' work on P3, but if compilet, then error

gltewalt

[06:42](#msg610cd9ea7bc44d0a4708e6aa)

```
-v <level>, --verbose <level>  : Set compilation verbosity level, 1-3 for Red, 4-11 for Red/System.
```

[06:47](#msg610cdaf609a1c273826110b8)`./red -c -d -v 3 clock.red`

[06:47](#msg610cdb15949a3d73862027d0)Then probably take the information to `red/bugs`

Sergey\_Vladivostok\_gitlab

[07:21](#msg610ce2ed29b165332e609076)@gltewalt -v adds information when compiling, but not when running the compiled program. The error text is the same.

hiiamboris

[07:36](#msg610ce672949a3d73862040ee)Tried `-r`?

Sergey\_Vladivostok\_gitlab

[09:17](#msg610cfe44aedfa70f0d7bcaae)@hiiamboris has started, but the second hand does not move. Once per second, the error appears in the console:

```
*** Script Error: to-integer has no value
*** Where: set-path
*** Stack: view do-events do-actor do-safe
```

[09:19](#msg610cfe90aedfa70f0d7bcba3)Minute hand moves

hiiamboris

[09:24](#msg610cffbf2453386b6c38d613)weird

[09:26](#msg610d004729b165332e60d151)well, the previous crash may be due to libRedRT.dll

[09:26](#msg610d004e3eec6d41d1407dff)you have to delete it to recompile

[09:27](#msg610d008e3eec6d41d1407e77)but `to-integer` should be there

[09:30](#msg610d01344bfde341d94695e8)'? to-integer' says what?

Sergey\_Vladivostok\_gitlab

[09:31](#msg610d018e3eec6d41d14080b0)removed `to-integer` from `sec/2: to-integer 6 * time/second` and all working

[09:34](#msg610d020d3eec6d41d140818b)@hiiamboris displaying help about `to-integer`

[09:36](#msg610d02929484630efa236cdc)

```
a: now/time
print to-integer a/second
```

when I compile with `-r` it works without errors

[09:48](#msg610d057569ca4d0a5135cdee)hm... compiling

```
Red []
? to-integer
```

getting error

```
*** Compilation Error: undefined world ?
...
```

[09:50](#msg610d05cb4b7707158f6a0ef6)and `help` undefined world...

[10:10](#msg610d0ab269ca4d0a5135d901)

```
Red []
source to-integer
```

`./red tmp3625.red`

```
to-integer: func ["Convert to integer! value" value][to 
    integer! :value
]
>>
```

`./red -c -r tmp3625.red`  
`./tmp3625`

```
*** Compilation Error: missing argument
*** in file: /home/user/tmp3625.red
*** near: [to-integer]
```

hiiamboris

[11:28](#msg610d1cdc09a1c27382619f0c)`help` and `?` are undefined because they're part of the console. But `??` is part of the runtime and should work.

[11:29](#msg610d1d1bf31bc0605a4a8fcc)`source to-integer` must be compiler issue, but `source` is also part of the console

Sergey\_Vladivostok\_gitlab

[12:29](#msg610d2b2309a1c2738261be62)It's sad that not what is interpreted is compiled

[12:41](#msg610d2df78fc359158c5783ea)can be make round window or transparent angles?

hiiamboris

[14:00](#msg610d408729b165332e615746)using OS API: https://gitlab.com/hiiamboris/red-alpha/

gltewalt

[16:10](#msg610d5f05aedfa70f0d7c9fad)Use this please: https://static.red-lang.org/dl/auto/linux/red-latest

[16:11](#msg610d5f292453386b6c39a113)Then rename the download to `red`. Then move into your home directory. Then `chmod u+x red`

[16:11](#msg610d5f362453386b6c39a11d)Then build console with `./red`

## Saturday 7th August, 2021

Sergey\_Vladivostok\_gitlab

[01:50](#msg610de6cb2453386b6c3abb57)@hiiamboris Thanks. Is there no cross-platform solution?

[01:53](#msg610de7a8025d436054b85934)@gltewalt I use it. `system/build/date` is `5-Aug-2021/3:55:53`

[01:58](#msg610de8be7555e33351fa2b36)in \[i3wm](https://i3wm.org/), the program window is not displayed in a standard way, but in the middle of the screen, on top of other windows. Is it fixable?

greggirwin

[02:39](#msg610df26c025d436054b86bf9)@Sergey\_Vladivostok\_gitlab there is no built-in solution for window transparency.

[02:50](#msg610df5063eec6d41d1428d48)On i3wm it would take someone who knows that window manager, but since it's a tiling model, it may require its own branch, which is not something the core team can work on at this time.

Sergey\_Vladivostok\_gitlab

[03:49](#msg610e02d269ca4d0a5137e41e)@greggirwin, understood. Thank you!  
Is it possible to adjust the speed of repetition of keystrokes and the delay time by means of the language? (like `xset r rate 200 50`)

hiiamboris

[07:36](#msg610e37e1949a3d738622ffba)Yes, you can generate repetition events yourself (though only on nix you will get precise enough timers). Otherwise the OS sends them, so it's not language's role to mess with user settings.

[07:38](#msg610e38772453386b6c3b54c8)I'm using 200/50 too btw. But is there a reason doing it not system-wide?

Sergey\_Vladivostok\_gitlab

[07:49](#msg610e3aee09a1c2738263f2b6)for example, for programs with keyboard control (games), so that a press/hold is worked out immediately and more evenly in time

```
view [ on-key [ if [event/key][print now/time/precise]]]
```

hiiamboris

[07:56](#msg610e3ca73eec6d41d14313c1)it cannot work more evenly unless OS schedules your thread more often, or you're ready for 100% CPU load  
e.g. Windows schedules your thread once per 16ms usually

[07:57](#msg610e3cfd3eec6d41d1431452)in https://gitlab.com/hiiamboris/red-spaces/ I'm providing delay argument to the timer so it can adjust the animation (or number of key events your case), if that's some help

Sergey\_Vladivostok\_gitlab

[08:47](#msg610e48a7933ee46b75449f98)Thanks. Your work is impressive! As well as the work of the whole team!

hiiamboris

[09:00](#msg610e4bba4b7707158f6cb761)thanks ;)

gtzip

[17:11](#msg610ebec269ca4d0a513947c1)Sergey, that doesn't seem to be the build that ypu compiled clock with. Latest build from website wouldn't report usr/datatypes/ on error

## Sunday 8th August, 2021

Sergey\_Vladivostok\_gitlab

[00:31](#msg610f25d829b165332e65341c)@gtzip One assembly compiles one file. This file works flawlessly on a PC with an I3 processor and throws an error on a P3 processor. Works the same with the `-r` option on both processors. libRedRT.so removed / re-created - nothing changed.

hiiamboris

[07:00](#msg610f810669ca4d0a513ac3ba)have you tried older builds, from a year ago, 2 years, etc?

[07:05](#msg610f8237f31bc0605a4f5730)I don't believe we're using any instructions not supported on P3 though

[07:08](#msg610f82ff7bc44d0a470e53a6)Since it's a View app, could be D2D incompatibility? We merged D2D during this winter, so try older GDI+ builds.

gltewalt

[16:48](#msg61100ae52453386b6c3ef04c)Weird thing is the error reports a local directory `in file: /home/user/datatypes/money.reds`. Shouldn't that only be so for building from source?

greggirwin

[16:55](#msg61100c9faedfa70f0d81f519)Yes.

Sergey\_Vladivostok\_gitlab

[23:46](#msg61106cd7f31bc0605a51326c)Once upon a time, I building it on this PC from source, but for compilation I used the just downloaded version. I will try to clean the system of all old files.

## Monday 9th August, 2021

Sergey\_Vladivostok\_gitlab

[05:37](#msg6110bf2a09a1c2738268e265)Deleted all files named libRed\*.  
Compiled with -c option - error.  
Compiled with -r option - works.

greggirwin

[16:27](#msg6111575d9484630efa2c44b0)@Sergey\_Vladivostok\_gitlab what does `about/debug` say on your end?

Sergey\_Vladivostok\_gitlab

[22:39](#msg6111aea5025d436054c00cd0)

```
>> about/debug
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 3821 date: 5-Aug-2021/3:17:56 commit: #e01002f7cbbf7d3a039785f0ce4a8f668ba7f87c ]
PLATFORM: [ name: "Ubuntu 18.04.5 LTS" OS: 'Linux arch: 'i686 version: 4.15.0 build: "#140-Ubuntu SMP Thu Jan 28 05:19:23 UTC 2021" ]
--------------------------------------------
```

gltewalt

[23:55](#msg6111c06b949a3d73862a426b)Maybe `./red clear` just in case it's is strangely hanging on to some previous info. (I don't know, just a guess)

## Tuesday 10th August, 2021

Sergey\_Vladivostok\_gitlab

[01:18](#msg6111d3ca2453386b6c42b2e7)without changes

toomasv

[05:45](#msg61121261f31bc0605a54a6dc)@Sergey\_Vladivostok\_gitlab I haven't followed closely the discussion above, but if you haven't tried it yet, try `-u` (update libRedRT) option too with `-c`.

Sergey\_Vladivostok\_gitlab

[23:30](#msg61130c1329b165332e6d5df0)@toomasv I've already tried it. Now I tried again - an error. With only `-r`, the working program is compiled. Or run without compilation.

## Saturday 14th August, 2021

ams02468

[08:17](#msg61177bfc949a3d738636a77a)Hi everyone I have a question what should I use to make a flag for cli? Like \*\*help -h\**

Sergey\_Vladivostok\_gitlab

[08:51](#msg611783fa025d436054cca430)@ams02468 see `? system/script/args`

ams02468

[09:31](#msg61178d5f933ee46b7558110b)thx

hiiamboris

[10:19](#msg611798953eec6d41d156d0ac)https://gitlab.com/hiiamboris/red-cli

## Tuesday 17th August, 2021

gvolk0

[09:31](#msg611b81fd29b165332e7efeee)Hello all, I'm new to Red and curious about the relationship between Red and Ren (the data format) - is there something Ren can do that Red cannot? Or does better?

hiiamboris

[09:37](#msg611b83738fc359158c7549c2)@rebolek might tell

pekr

[10:13](#msg611b8be729b165332e7f1345)Ren is not a language, it is just a data format. The idea was to create kind of next gen JSON format, or at least the one, which could be shared between the Redbol lang implementations. Author of Rebol, Carl Sassenrath, defined a new initiative in that regard, called ASON - https://altscript.com/

[10:15](#msg611b8c4069ca4d0a51541584)For us, Redbollers, it would most probably mean a conversion via a codec system anyway ...

gvolk0

[10:48](#msg611b93e4025d436054d4c931)interesting, thanks, but I still don't see why bother with Ren or ASON when Red/Rebol "is it's own data format" with 50 supported types (most of which can be ignored if not used)?

rebolek

[15:26](#msg611bd527f31bc0605a69367b)@3dc1d3 the idea was to make implementations of the data format in different languages, it was done in time when Rebol development was dead and there was no Red yet. And I still think that having loader/save for rebol-like format for i.e. Python, Javascript etc makes sense.

greggirwin

[15:50](#msg611bdab8933ee46b7560c3bf)Also, because people feel strongly about their languages, but not so much their data formats (except us of course :^), they may be willing to use a data format outside the context of Red, where if we push them to use a Redbol lang, they may write off the value of the data format as well.

## Wednesday 18th August, 2021

gvolk0

[07:19](#msg611cb496025d436054d737c9)Ah I see, thank you both.

## Thursday 19th August, 2021

RayMPerry

[02:48](#msg611dc6999484630efa46afb2)Been working with Red again. I'm trying to make a simple calculator application but I keep running into problems. So, `calculator-working.red` works as expected but the other file doesn't? I'm not sure why. Additionally, I'm finding it hard to build faces programmatically. I keep running into the same error I have here ("invalid syntax at"). tl;dr: "How do I generate faces with a foreach? What is the correct way to approach the View dialect?" https://gist.github.com/RayMPerry/c58b966cf064bd100f6cdabf614598aa

gltewalt

[03:09](#msg611dcb6f7555e333511b62d6)

```
initial-number: mold 0
display: [text right initial-number]

view compose [
    title "Calculator"
    below (display)
    across button "7" button "8" button "9" return
    across button "4" button "5" button "6" return
    across button "1" button "2" button "3" return
    across button "C" button "0" button "CE" return
]
```

[03:40](#msg611dd2a92453386b6c5bfd74)to use a block of regular Red code use `do`

gvolk0

[05:34](#msg611ded703eec6d41d163ff94)sorry for the dumb question but what am I missing here? (tried searching the docs but can't understand what to search for) - where should i look to better understand red's parsing logic?

```
ls [get-env "HOME"]
ls do [get-env "HOME"]
```

rebolek

[05:38](#msg611dee6e9484630efa46fc64)`ls` takes next value, does not evaluate it, and turns it into `file!`. It's meant for usage in the console, so you can write `ls my-dir` instead of `ls %my-dir`. Normally, a function would evaluate the word `my-dir` to get its value.

[05:40](#msg611deec19484630efa46fd46)If you want to evaluate, use `list-dir` instead. However, `list-dir` expects file and `get-env` returns `string!`. So you need to manually convert:

```
>> list-dir to file! get-env "HOME"
        .bashrc         .bash_logout    .bash_pro...    .config/        .dir_colors     .Xclients       .dmenurc        .gimp-2.8/    
        .gtkrc-2.0      .i3/            .icons/         .local/         .makepkg....    .moc/           .profile        .xinitrc      
(...)
```

gvolk0

[06:07](#msg611df52329b165332e8428b2)ahhh ok, so `ls` is like a macro then and feeds the raw first arg. what happens to the rest of the args to `ls`? are they simply ignored by the parser?

rebolek

[06:10](#msg611df5bb29b165332e8429db)If there is an error, the evaluation stops, if there is no error, it continues:

```
>> ls print print "hello"
*** Access Error: cannot open: %/home/sony/print/
*** Where: read
*** Stack: ls list-dir  

>> make-dir %print
== %print/
>> ls print print "hello"
hello
```

gvolk0

[06:19](#msg611df7ed933ee46b75654b46)ah ok so it's like a newline. is that special to `ls` or is all of rebol/red a continuous sequence of commands (ie. new lines are not special)?

rebolek

[06:55](#msg611e005e69ca4d0a5159710e)newlines are not special at all, red/rebol is a continuos sequence.

[06:57](#msg611e00df29b165332e843fcc)the evaluator takes first value and evaluates it. if it's a function, it evaluates its arguments based on its arity. then it continues

DideC

[07:34](#msg611e0973f31bc0605a6e07ca)@RayMPerry According to the VID documentation:  
\- First, let `title "Calculator"`be the first line of your view block as its a container statement \[see](https://github.com/red/docs/blob/master/en/vid.adoc#code-structure).

gvolk0

[07:56](#msg611e0ea57555e333511be676)thank you for holding my hand @rebolek, I promise to come back with harder questions :)

rebolek

[07:58](#msg611e0f0e2453386b6c5c7736)@3dc1d3 I hope you will ;)

gvolk0

[08:03](#msg611e106daedfa70f0d9fa04e):+1:

[11:27](#msg611e40134b7707158f8e4155)ok I'm back with something more complicated... trying to compile the view eg \[here](https://www.red-by-example.org/vid-misc-faces-red.html).

it works fine interpreted. it works fine compiled in dev mode. but in release mode i get:

```
*** Script Error: view has no value
*** Where: ???
```

I'm running `red-12aug21-5398bf076` on linux.

I noticed there are fewer libraries linked into the release build:

rel: 23  
dev: 73

RayMPerry

[12:09](#msg611e49e2f31bc0605a6e9740)Thanks, @DideC @gltewalt

hiiamboris

[13:28](#msg611e5c71949a3d738644f0a0)@gvolk0 `needs: view` in the header

RayMPerry

[13:55](#msg611e62b53eec6d41d1650c40)I think I'm coding myself into a corner here. https://gist.github.com/RayMPerry/c58b966cf064bd100f6cdabf614598aa Running into weird issues switching between contexts. Is there a better way to structure something like this? How should I structure this in a more idiomatic fashion?

hiiamboris

[14:07](#msg611e6585933ee46b756648be)I don't see any context problems in your code. You're trying to convert arbitrary text into integer though, that is an issue ;)

RayMPerry

[14:07](#msg611e65aa8fc359158c7b9af1)Oh? What would be a better way to do that?

hiiamboris

[14:09](#msg611e66097bc44d0a472db5cc)Well, you should consider evaluating your expression (with `do`), and also insert spaces because these are important in Red.

[14:11](#msg611e66ad949a3d73864508a3)Here's two calculators to draw inspiration from (on extreme ends of Red-ness scale ;)  
https://github.com/red/code/blob/master/Showcase/calculator.red  
https://github.com/zwortex/recalculator/blob/main/recalculator.red

RayMPerry

[14:22](#msg611e694009a1c2738285cbbd)@hiiamboris Thank you for the links. I'll take a look.

gltewalt:matrix.org

[19:51](#msg611eb65229b165332e85de28)6600 line file? ...could probably make an OS in that many lines

hiiamboris

[19:54](#msg611eb713025d436054db991e)CalcOS ☻

greggirwin

[22:05](#msg611ed5b3949a3d73864609ec)@gltewalt:matrix.org it's a pretty polished app. Not your basic math calculator. It really is on the spectrum of a CalcOS.

[22:07](#msg611ed61a025d436054dbd911)Play with it and look how beautifully the equations are rendered.

## Friday 20th August, 2021

gvolk0

[00:38](#msg611ef980404bc13a10584aa0)@hiiamboris i do have that:

```
Red [
    needs 'view
    file: %view.red
]
```

I tried without the tick as well.

greggirwin

[01:34](#msg611f06b277497e3ef5eff1b5)You need a colon. `needs:`

gltewalt

[02:54](#msg611f194977497e3ef5f01410)@gvolk0 @RayMPerry These are good "getting going" examples:  
http://redprogramming.com/Short%20Red%20Code%20Examples.html

[02:55](#msg611f198d77497e3ef5f0146e)Then try out the VID docs: https://github.com/red/docs/blob/master/en/vid.adoc

gvolk0

[03:42](#msg611f24b95359685f89a4dc27)ahh geez I feel silly but then again this was an example from the red docs...

why does it work in dev mode then? and why is there no error? `needs` is not a function

[03:43](#msg611f24ddcff4797d18442608)thanks for the links

[03:45](#msg611f25595359685f89a4dd1a)to add to the above questions: it seems to work with `needs: view` as well as `needs: 'view` - what's the significance of the quote?

gltewalt

[04:12](#msg611f2bb39f2c833efc942a4c)Are you using a Red console build and not building from source?

[04:14](#msg611f2c111663407d0cecfba6)See the note:  
https://github.com/red/docs/blob/master/en/view.adoc#13-including-view-component

[04:15](#msg611f2c5d9f2c833efc942b6c)If I recall correctly (and I may not), you have to specifically include it in release mode `-r`

[04:16](#msg611f2c9695e9341de0310161)And honestly I don't remember about the quote

gvolk0

[05:05](#msg611f3801eb72173430d81339)i downloaded the latest current build, did not compile from source.

[05:08](#msg611f38d6cff4797d18444cc6)&gt; Using consoles auto-generated by red binary will include the View component on platforms where it is available,

i think dev mode builds link to the same console? that would explain why dev builds work without the header.

doesn't explain why there's no error thrown on the bogus `needs view` line I had (no colon)

greggirwin

[05:59](#msg611f44cf01bec84358e92b1b)If you run interpreted, from the GUI console, the view module is already loaded.

[06:01](#msg611f453eeb72173430d82c9d)The difference the quote makes is that it's a `lit-word!` value, which is normally treated as a symbol and not evaluated. In the header, you \*can* use it but don't have to. The difference will be important as you get more into words in blocks and the fact that blocks are not evaluated by default. You're off to a good start.

[06:04](#msg611f45fdcff4797d1844674a)No error was thrown because...well, Red \*could* do that but how strict we are is sometimes based on the current implementation rather than a hard design choice. So how Red treats the header internally is up to it. The header is just a block and can contain any value(s) you want. It's just that Red looks for specific keys for certain things. I could ramble more, but that may be enough for now.

gvolk0

[06:20](#msg611f499d01bec84358e934e5)Understood, thanks for the low down.

One thing though: i'm not running it from the gui console, nor interpreted (but as I mentioned that does work fine). What confused me is that /compiling/ worked only in the default development mode - my understanding is that this is because it links to the same library that's used by the interpreter console, but in release mode it strips out everything that wasn't explicitly (and correctly) listed.

greggirwin

[16:28](#msg611fd8130da82e46aabcea08)Correct. A shared runtime has to include everything, as any app may use different pieces.

## Sunday 22nd August, 2021

RayMPerry

[12:20](#msg61224101e8de9946b434b223)I find myself doing consecutive `if` statements when I want to do an `or` statement for the condition. So, instead of `if (none? largest-item) or (item > largest-item) [largest-item: item]`, I end up doing:

```
if none? largest-item [largest-item: item]
        if item > largest-item [largest-item: item]
```

[12:20](#msg6122410bcff4797d184a4922)Which kinda sucks.

[12:21](#msg6122413177497e3ef5f649eb)What's the idiomatic way to do this?

hiiamboris

[13:24](#msg612250059780661dcdd48f8b)Why `or` doesn't work for you?

[13:24](#msg612250289f2c833efc9a5bd3)Idiomatic way would be `if any [] [...]`

RayMPerry

[13:27](#msg612250c91663407d0cf31a48)I think it's because I'm trying to `>` with `none`?

[13:28](#msg612250e39f2c833efc9a5d3c)But I was hoping it was just short-circuit after seeing the first part was truthy

hiiamboris

[13:49](#msg612255f701bec84358ef2b37)Right.

gltewalt

[15:17](#msg61226aa7cff4797d184a9968)

```
>> largest-item: 9
== 9
>> item: 99
== 99
>> largest-item: if any [none? largest-item item > largest-item][item]
== 99
```

RayMPerry

[15:25](#msg61226c4fe2e2ad3a069ff09d)Right. But if `largest-item` starts as `none` and try using an `or` statement instead, what happens?

hiiamboris

[15:30](#msg61226d7ecff4797d184aa0bf)or is not short circuiting in Red.

RayMPerry

[15:32](#msg61226e0d1663407d0cf3525c)Ah, okay. I can see why it isn't.

[15:34](#msg61226e815359685f89ab5d2b)Another question for you all: is there a word bound to the global context? I'm making a library and I wanted to keep track of all the words I create so I can output their specs. I figured the global context is too jam-packed already so, I threw all of my functions into a new context but now I can't figure out how to bind the words to the global context again

[15:34](#msg61226e9ceb72173430de6536)The main reason for putting them into their own context was to use `words-of`

[15:42](#msg6122704fcff4797d184aa7d2)UPDATE: Think I found it. `system/words`?

gltewalt

[15:45](#msg61227107c578d54348bbad16)yeah

greggirwin

[20:01](#msg6122ad0acff4797d184b1d7a)@RayMPerry `any` and `all`, like `either` quickly become very natural to use and read.

[20:06](#msg6122ae5495e9341de037f207)

```
o: object [
	internal: does ['Hey]
	set 'external :internal
]
external
o/internal
internal
words-of o
```

Words can be bound to only one context at a time, so if you want a global reference to it, use `set`. You don't have to have an internal version as well, but it may make things clearer. Eventually we'll have modules (big design space, so lots of R&amp;D), where you'll be able to declaratively express this. In the meantime, many of us have old `export` funcs. Good subject for tinkering and chat.

[20:07](#msg6122ae70eb72173430dee3ad)And yes, `system/words` is what you're after as far as the context if you're using `bind` yourself.

## Monday 23th August, 2021

gvolk0

[00:11](#msg6122e7b4404bc13a10600f4c)What happened to Rebol's ~map-each~ and ~apply~ in Red? Red seems to be perfect for functional style but it seems to be devoid of it - what's the rationale? (I saw the SO post to "implement your own apply" but I don't understand why something so useful isn't part of the language)

RayMPerry

[00:52](#msg6122f164cff4797d184b9c73)`map-each`, I don't miss too much. I agree with you for `apply`, though.

greggirwin

[01:43](#msg6122fd5a0da82e46aac2fbea)`Apply` has a \[new candidate](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/apply.red) implementation by @hiiamboris. But we need more input and @Dockimbel has to sign off on it.

`map-each` falls under the HOF umbrella, which has a lot of experimental R&amp;D in place already.  
\- https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/new-each.red (any much more in that repo)  
\- https://github.com/greggirwin/red-hof Pay particular note to the code analysis section by @hiiamboris.  
\- We have a private room here for HOF work as well.

gvolk0

[04:53](#msg612329c401bec84358f0c652)so in a nutshell it comes down to being difficult to implement well due to the nature of Red's syntax?

hiiamboris

[07:04](#msg612348885359685f89ad09c1)No ;) Implementation is the easiest part ;)

[07:05](#msg612348cf77497e3ef5f84ddc)Difficult to evaluate how it will work within the big picture in the years ahead, with all the other planned features.

[07:08](#msg6123497f5359685f89ad0be4)I'm myself pretty confident in `map-each` design. Not so in the `map` (FP-style) design.

gvolk0

[08:08](#msg61235762aa48d1340c297cf7)hmm alright, thanks

RayMPerry

[12:13](#msg612390f63d8b825fab335160)&gt; https://gitlab.com/hiiamboris/red-mezz-warehouse

[12:13](#msg612391039780661dcdd70b35)Oh. Well, guess I don't need my library

hiiamboris

[12:32](#msg6123955d1663407d0cf5ae6e)☻ You're welcome.

[12:34](#msg612395b91663407d0cf5afca)When you get to apply it please share your experience, as I'm probably the only user of it so far (and getting feedback is important part of design ;)

greggirwin

[16:17](#msg6123ca180da82e46aac4afa1)&gt; Difficult to evaluate how it will work within the big picture in the years ahead, with all the other planned features.

:+1:

[16:33](#msg6123cdc79780661dcdd79a7e)&gt; so in a nutshell it comes down to being difficult to implement well due to the nature of Red's syntax?

If we change "implement" to "design" this is more correct. It's not hard to do because of Red's limitations, but because of it's flexibility and rich set of datatypes. Every day we run up against questions about what is most intuitive for a human user, but which may conflict with consistency in the language. And we are \*incredibly* fortunate to have a team and community where different people focus on each of these aspects, argue their merits in a civil and patient manner (most of the time anyway; we are human after all. ;^), and understand that compromise is often the best path forward.

## Tuesday 24th August, 2021

gvolk0

[23:57](#msg612587835b92082de1653e90)&gt; but because of it's flexibility and rich set of datatypes.

that's what i meant.

## Wednesday 25th August, 2021

RayMPerry

[19:22](#msg612698735cfd665e52ed233e)Does anyone exclusively use Red here? If not, what else are you using?

planetsizecpu

[19:35](#msg61269b70d206b85e4f622533)Yes @RayMPerry I use Red exclusively, just to learn &amp; have fun by now. Welcome btw!

Respectech

[19:59](#msg6126a1245739ab2df8b9a45b)I use Red and Rebol exclusively. Well, also MySQL, HTML, etc.

## Thursday 26th August, 2021

ldci

[10:04](#msg6127671f7cd57813a88ea317)@RayMPerry Only Red with sometines links to Python :)

## Friday 27th August, 2021

gvolk0

[02:04](#msg61284811d9a141754db9987c)is this the canonical/correct way of working with computed list expressions?

`reduce [1 2 do [1 + 2]]`

greggirwin

[02:54](#msg612853d5f3449e13a43d5b44)There is no single correct way, but since there is no `reduce/deep` (it comes up as an idea from time to time), the most common approach is to use `compose`.

gvolk0

[05:45](#msg61287bedfd7409696edae935)ah that's a bit better, thanks

## Sunday 29th August, 2021

ams02468

[04:02](#msg612b06cd5cfd665e52f6a545)Hi, how can delete a variable completely?

planetsizecpu

[06:17](#msg612b269767e789189ccaee3d)@ams02468 just `unset` the word, GC will take care.

ams02468

[07:08](#msg612b3269d206b85e4f6bb944)thx

## Monday 30th August, 2021

RayMPerry

[19:07](#msg612d2c8e13ac9b6b83a2006c)Are you able to make custom datatypes?

greggirwin

[19:14](#msg612d2e045739ab2df8c79db0)Yes. You need to write them in Red/System (R/S). All the source is available to see how the \[existing datatypes](https://github.com/red/red/tree/master/runtime/datatypes) are implemented.

RayMPerry

[19:25](#msg612d309d5cfd665e52fb27cf)Ah. That seems pretty involved for what I'm trying to do (a bit of OOP)

greggirwin

[19:51](#msg612d36a67cd57813a89ad8dd)Using objects as prototypes may be a better fit then.

RayMPerry

[19:58](#msg612d386113ac9b6b83a21b60)Ah, there it is. Thank you.

greggirwin

[20:10](#msg612d3b37f428f97a9f5c9f46)If you happen to tinker with \[reactors](https://github.com/red/docs/blob/master/en/reactivity.adoc) in the process, \[this](https://github.com/red/red/wiki/%5BDOC%5D-Reactivity) may save you some hair pulling.

RayMPerry

[23:48](#msg612d6e42f428f97a9f5d0c8b)Well, I am having trouble with reactors but for a completely separate thing. https://gist.github.com/RayMPerry/fe352905966b4189c42f2d723e124033

[23:48](#msg612d6e5ad9a141754dc46e5b)For some reason, that `react` block doesn't work.

## Tuesday 31st August, 2021

toomasv

[05:02](#msg612db7db4c7be06b79907230)@RayMPerry You need "\[at least one reactive source](https://github.com/red/docs/blob/master/en/reactivity.adoc#react)" in your `react` block. I.e. instead of `context` use `reactor` -- `files: reactor [...]`.

Some remarks more:  
To save one click you may add `focus` keyword to `search-bar` field.  
As `read` returns block of filenames, there is no need to use `/lines` refinement -- that is useful if you read a string with line-breaks only.

[05:35](#msg612dbfb4fd7409696ee5f537)Also, at least on Windows, changing series in reactive source does not trigger the reaction unless explicitly referred to by set-word (tried also `deep-reactor`). I.e. in `delete-item`, although `files/filtered-files` is changed when item is deleted, this is not enough to trigger reaction so that `file-listing/data` is updated. You need to use explicit set-word to trigger the reaction by adding e.g. `files/filtered-files: files/filtered-files` into `delete-tem`. Or use `show file-listing`to force updating after deleting an item.

And you can use `react [face/data: files/filtered-files]` instead of `do` block.

[06:46](#msg612dd059f3449e13a448d87e)^ this can be used for `file-listing` instead of `data files/filtered-files`.

RayMPerry

[10:01](#msg612dfdecfd7409696ee68430)Thank you for the insight. Will fix.

toomasv

[10:15](#msg612e01535cfd665e52fceca4)You are welcome!

## Wednesday 1st September, 2021

cjglo

[03:51](#msg612ef8afd206b85e4f73fdc9)Hello all! I am junior developer who is diving into Red and I am spinning up a small project to learn. Out of curiosity, is there a way to read from a file in Red/System? Or is it better to read a file in Red (using the built in command), then pass the data to Red/System? I didn't see any "file stream" info in the Red/System Documentation. Thanks!

rebolek

[05:31](#msg612f103cf428f97a9f60ac1a)Hi @cjglo ! File IO in R/S is implemented using OS calls. Have a look at https://github.com/red/red/blob/master/runtime/simple-io.reds . These functions are used for the IO in Red.

planetsizecpu

[06:32](#msg612f1e7df428f97a9f60cbb8)Welcome btw @cjglo

RayMPerry

[13:01](#msg612f79ad7cd57813a89fe528)Do you feel what's currently in Red is pretty stable? I know there's a ton of things on the roadmap but nothing's gonna be deprecated or removed from the core vocabulary, right?

hiiamboris

[14:55](#msg612f94598065e87a8ebd00ee)No guarantees on alpha stage. If you want stability, compile your exe or stash the Red build that works for you with the script. Or just write down what commit the script works in, then you'll be able to build Red at that particular commit from Github at any later time.

RayMPerry

[14:59](#msg612f9545fd7409696eea308b)Got it. Thank you.

ldci

[15:19](#msg612f99f9d206b85e4f756dca)@RayMPerry, I began developing redCV with the red 0.24 version and redCV remains compatible with all other versions with a very little effort. Red is now sufficiently stable for a quotidien use in bio-medical applications in hospital.

cjglo

[16:38](#msg612fac8cfd7409696eea6a33)A little to replying but thanks for the info and the welcome!

## Thursday 2nd September, 2021

RayMPerry

[21:30](#msg6131427f5739ab2df8d0d191)Trying to wrap my head around Red/System ATM. In the context of Red/System, what is the difference between `print message`, `print as [c-string!] message`, and `print as [c-string!] string/rs-head message`? Why is the last version the only one that prints the string correctly and what is `string/rs-head`? Is `string` a namespace?

hiiamboris

[21:36](#msg613143f913ac9b6b83ab26c6)`as [c-string!]` is not a valid syntax at all

[21:37](#msg61314408f3449e13a450ba21)of what type `message` is?

[21:37](#msg6131441999b7d97528ebc5f8)what type `string/rs-head` is supposed to work with?

RayMPerry

[21:37](#msg6131441c5b92082de17ebc56)`string!`

hiiamboris

[21:37](#msg613144345b92082de17ebd5c)nope, in R/S there's no `string!` type

[21:38](#msg6131443d1179346966f76bc8)you're confusing Red types and R/S types ;)

RayMPerry

[21:38](#msg6131445dfd7409696eee11fa)Hmm. Then, why does this compile?

hiiamboris

[21:38](#msg6131445e63dca818913b64c9)R/S is described here btw: https://static.red-lang.org/red-system-specs.html#section-9.4

[21:39](#msg613144854c7be06b79989607)I suppose you're compiling a routine?

RayMPerry

[21:39](#msg613144928065e87a8ec0dcef)

```
Red []

print-message: routine [message [string!]] [
  print as [c-string!] string/rs-head message
]

print-message "This is a test"
```

[21:39](#msg6131449899b7d97528ebc6fb)yes

hiiamboris

[21:40](#msg613144b9f3449e13a450bbb6)for routines, compiler automatically translate their Red types into R/S types, so `string!` Red \*datatype* becomes `red-string!` R/S \*structure*

[21:40](#msg613144e363dca818913b6547)

[21:41](#msg613144f24c7be06b799896e4)https://github.com/red/red/blob/master/runtime/datatypes/structures.reds#L106

RayMPerry

[21:43](#msg6131456767e789189cd8a253)Interesting.

hiiamboris

[21:43](#msg6131456ef428f97a9f65aa47)why this above compiles - can't say, probably some side effect of current implementation

RayMPerry

[21:44](#msg613145c27cd57813a8a406e4)The syntax looks pretty valid to me. https://static.red-lang.org/red-system-specs-light.html#section-4.9

hiiamboris

[21:46](#msg6131462263dca818913b6785)also, generally you can't print Red strings from R/S, because Red may convert the string between 8-bit, 16-bit and 32-bit UTF encodings, while R/S `print` prints plain ASCII, and I'm not sure it's defined what happens if it meets char 128 or higher

RayMPerry

[21:46](#msg61314645fd7409696eee1720)That makes sense.

hiiamboris

[21:46](#msg61314653d9a141754dcd1282)&gt; The syntax looks pretty valid to me. https://static.red-lang.org/red-system-specs-light.html#section-4.9

I stand corrected. It's a valid syntax then.

[21:50](#msg613147144c7be06b79989b86)why `string/rs-head` worked for you, is because:  
1\) string was as UTF-8 in internal buffer (because it has no unicode chars and did not contain them ever, so was not expanded)  
2\) all codepoints were below 128th, so R/S print had no issues with it  
3\) rs-head returned the pointer to the buffer itself, rather than the `red-string!` structure

RayMPerry

[21:51](#msg6131475167e789189cd8a5fa)Number 3 seems like it shouldn't be able to do that?

hiiamboris

[21:52](#msg61314784d9a141754dcd1541)no, it's by design, `rs-head` and `rs-tail` are used to loop over the buffer char by char

RayMPerry

[21:52](#msg6131479a5cfd665e520477c3)Ah. Okay.

hiiamboris

[21:52](#msg613147adf428f97a9f65af37)e.g.

```
p: string/rs-head thing  
tail: string/rs-tail thing
while [p < tail] [... p: p + 1]
```

[21:53](#msg613147db99b7d97528ebd030)(simplified)

[21:57](#msg613148d967e789189cd8a90c)try using `unicode/to-utf8` function

[21:58](#msg613148fd1179346966f7758b)(more reliable/official)

## Friday 3th September, 2021

ldci

[04:26](#msg6131a40ffd7409696eeedac6)@RayMPerry .Some notes and samples about Red/S here: https:https://github.com/ldci/Red-System

RayMPerry

[09:16](#msg6131e7e7d9a141754dce672e)Thank you both for that information.

## Wednesday 8th September, 2021

ams02468

[15:12](#msg6138d2e2f3449e13a460c2e6)Hello everyone, I do not know for sure if this is a bug or my mistake  
I entered these commands in the terminal but the output was problematic  
`>> a: to-red-file get-env "homepath" == %/Users/Administrator >> change-dir a *** Access Error: cannot open: %/Users/Administrator/ *** Where: do *** Stack: change-dir cause-error`

dsunanda

[15:37](#msg6138d8c37cd57813a8b4019a)@ams02468 Assuming this is Windows, homepath does not include the home drive, try something like this:

```
a: to-red-file rejoin [get-env "homedrive" get-env "homepath"]
```

RayMPerry

[15:38](#msg6138d8da67e789189ce8c4cb)Yeah, you're missing the `/C/` bit (or whatever the home drive is)

ams02468

[15:39](#msg6138d94bf3449e13a460d1d3)tnx guys &lt;3

## Friday 17th September, 2021

quid-agis

[11:30](#msg61447c3c99b7d9752814dff8)Hi all, I am having trouble getting Red-Language to run with the GUI on Debian 10/AMD64. Does someone have a definitive &amp; tested install tutorial that works?

[11:32](#msg61447cba7cd57813a8cd5bdc)The specific error that I am getting is &gt;&gt; view: unset!  
Although I downloaded Rebol-view, made it executable and placed it into the same directory as the red-064 binary but no joy.

hiiamboris

[11:32](#msg61447ce95739ab2df8fa3d1b)Hi! You should download automatic build instead.

quid-agis

[11:38](#msg61447e4cfd7409696e175e4d)Oh I saw that, but was not aware of it's functionalities. Why would the automatic work, and the GNU/Linux version .064 will not?

hiiamboris

[11:39](#msg61447e8f5739ab2df8fa419f)Because GTK GUI was added after 0.6.4 release about 3 years ago.

quid-agis

[11:54](#msg6144820e7cd57813a8cd68ba) OK, GTK GUI, well that explains a lot then 8-)  
I'll try that in the morning, thank you :+2:

## Tuesday 21st September, 2021

quid-agis

[11:09](#msg6149bd70d9a141754d01c365)Back, finally got it to work, there were two issues:  
A). Trying to build and compile Red Language via a VNC Client/Server setup was never going to work, and  
B). The instructions for GNU/Linux to install the ia32 libs are slightly out of date (Required `libcurl4` &amp; `libcurl3:i3864`) Note v3 &gt; v4

[11:10](#msg6149bdaaf3449e13a4855e2b)All in all, it was far harder than I thought that it might be. But shift happens 8-)

hiiamboris

[11:24](#msg6149c0dc5cfd665e5238e22d)Why would it need two different `libcurl`s?

[11:24](#msg6149c0f0f428f97a9f9a3400)Besides, 64-bit one has nothing to do with 32-bit Red.

[11:26](#msg6149c1524c7be06b79cd1844)and `libcurl3:i386` is mentioned on the \[download page](https://www.red-lang.org/p/download.html)

quid-agis

[11:28](#msg6149c1f2fd7409696e22bf29)My Debian 11 stated that `libcurl3` is not longer valid, and it only offered `libcurl4`.  
All I did was s/3/4 and it all worked.

hiiamboris

[11:30](#msg6149c25763dca81891700f7e)so same instructions as for `Ubuntu 18.04+`

quid-agis

[11:31](#msg6149c28a7cd57813a8d89e07)I asked on Twitter that other day about potential support for `ARMv7L`, is this going to happen?

hiiamboris

[11:32](#msg6149c2dd11793469662bf167)Is `RPi` target not working for it?

quid-agis

[12:00](#msg6149c960d9a141754d01deb1)I am studying &amp; using the Daml smart contract language, which has React/UI included by default. A Daml application is actually a Daml Archive (DAR) so is essentially Java-based. I read that Red-Lang can integrate with the JVM, is that correct?

hiiamboris

[12:23](#msg6149cebd63dca81891702dd8)https://github.com/red/red/tree/master/bridges/java

## Tuesday 28th September, 2021

quid-agis

[04:59](#msg6152a11ffb3dcd4e88f7fa22)https://doc.red-lang.org/en/view.html =&gt; Error 404.

[05:32](#msg6152a8d2fb3dcd4e88f809b0)Can Red be used to make a GUI for any Linux-based application or process? Something like `nano new_file.txt` or `cat /etc/ssh/sshd_config` ?

ne1uno

[10:32](#msg6152ef3b38377967f42159ce)@quid-agis, `help system/options`

greggirwin

[16:47](#msg615347312197144e8437646f)@quid-agis you can use https://w.red-lang.org/en/gui/#view or https://github.com/red/docs/blob/master/en/view.adoc.

## Tuesday 5th October, 2021

ams02468

[09:00](#msg615c141dee6c260cf7ff3903)Hello everyone, I am trying to create a loading animation in cli. There is a problem. I do not want to clean the page every time.  
And now I need help, I wrote a simple code, if you have a better method, you can help me

```
cls: has [][call/console "cls"]
z: "loading"
a: [
    forever [
     print z
     wait .5
     cls
     z: rejoin [z "."]
     if z = "loading....." [z: "loading"]
    ]
]
print a
```

hiiamboris

[09:15](#msg615c179d7db1e3753e22894b)just return \[your carriage](https://en.wikipedia.org/wiki/Carriage\_return)

## Wednesday 6th October, 2021

ams02468

[02:45](#msg615d0dc3d78911028ac16edb)My main problem is that if I compile this code and run it on the terminal page  
Every time it cleans the whole page (cls) I'm looking for a way to replace (cls)  
Something like this  
\[loading] (https://lzinga.github.io/ASCII-Loader/)

hiiamboris

[07:10](#msg615d4bd6a41fd20699c97c86)have you read the wiki page? ;)

Oldes

[08:56](#msg615d64ca9d20982e4fa46892)@ams02468 I think that you can print back-space character to remove and than replace content on the line.

[09:04](#msg615d66863f09d85736f9d73f)Hmm... it does not work in the GUI console... `print "ab^(8)Xc"` should print just `aXc`

[09:05](#msg615d66e229ddcd029308810c)@qtxie is it possible to make above working?

[09:08](#msg615d6773ee6c260cf7023cb3)If so, one could use something like:

```
show-progress: function[][
    x: "|/-\"
    BS: #"^(8)"
    prin "Loading [*]"
    forever [
        prin rejoin [BS BS x/1 #"]"]
        if tail? x: next x [x: head x]
        wait 0.1
    ]
]
```

qtxie

[12:35](#msg615d98257db1e3753e260e23)@Oldes Not easy. We could add an API to let the user to preprocess the string. The GUI console is basically a RELP. No support for terminal features.

Oldes

[19:41](#msg615dfbf6d78911028ac3aead)Preprocessing string would not help in this case as the back-space is there used to delete previously printed chars.

## Thursday 7th October, 2021

ams02468

[06:07](#msg615e8e8a2197144e844fb308)thanks guys so helpful

## Friday 8th October, 2021

supergrass71

[00:29](#msg615f90d2fb8ca0572bac8a67)Hello all, just wondering if anyone has an opinion of the Red book on Pakt by Ivo Balbaert (https://www.packtpub.com/product/learn-red-fundamentals-of-red/9781789130706). My background is procedural/object oriented programming in VBA and I have dabbled a little with Red but have not got far. Is this a good resource?

gltewalt:matrix.org

[01:26](#msg615f9e2938377967f43cfb71)I dunno, but I don't recall ever seeing him around the community

GaryMiller

[03:56](#msg615fc160cd4972068b35ad73)It is a good way to get started. It needs a second edition though very bad! I still refer to it when I remember stuff. I'll probably never be an expert like the most of they guys that hang out on here. But the book got me over those first hurdles.

greggirwin

[04:37](#msg615fcb26fb8ca0572bad029a)@supergrass71 welcome! Ivo is a nice guy. He's a serial writer, so finds a tech, tries to ramp up quickly, and writes a book. Opinions are mixed on his book, but if you can get it for a good price, saving you even an hour is probably worth it.

cloutiy

[14:41](#msg616058b3ee6c260cf7091e97)I would love to write a red book. Or some red learning videos. The book by ivo is a good start but as others pointed out it needs an update. I contacted him but he said most of his writing projects are on hold for other priorities. So it will be up to us to take the bull by the horns.

hiiamboris

[15:33](#msg616064b9d78911028ac954ee)To have a deep Red book we should first finish it's design ;)

[15:33](#msg616064e1a41fd20699d0d691)So that book and helpin.red is probably all we'll have for a while

greggirwin

[16:07](#msg61606cc32197144e84541dc6)The Rebol Core Guide is still the best definitive user guide IMO.

## Tuesday 12nd October, 2021

ams02468

[11:23](#msg61657016d3ae402e4743c19c)How can I find older red versions, such as 1 month ago?

hiiamboris

[11:26](#msg616570e4a41fd20699dbe49b)you can download older sources and compile it

ams02468

[13:26](#msg61658d1c9d20982e4fb6e881)I don't know, the problem is with my computer or not, but after testing it a few times, I realized that red extension is not able to recognize the code properly for the new versions coming this month, and autocomplete does not work properly in the visual studio code.

hiiamboris

[13:38](#msg61658fc838377967f44a29dc)no one's maintaining it (the extension)

ams02468

[14:03](#msg616595b33f09d857360c5120)So what do you use (editor)?

hiiamboris

[14:06](#msg6165964898c13e7550cefc69)CudaText

[14:08](#msg616596de38377967f44a3c1b)it took a bit of time to configure Red LSP, completion, hotkeys  
but it's lightweight, relatively fast, very configurable and the dev is responsive to feature requests &amp; bug reports

[14:18](#msg616599299d20982e4fb70534)although it uses the same LSP plugin from VSCode

[14:18](#msg616599363f09d857360c5bfd)I haven't tested if recent builds ruin it

[14:18](#msg616599509d20982e4fb705ac)I don't really have much use for LSP at all

[14:19](#msg6165995dcd4972068b42b4b7)code tree and completion work without it

greggirwin

[17:33](#msg6165c6dc2197144e845fe129)@bitbegin was our main dev on the plugin. We need a new champion.

## Thursday 14th October, 2021

qtxie

[02:36](#msg6167979ed3ae402e4748b88c)@ams02468 It works properly here. You can try to regenerate the CLI console:

```
> red-latest.exe --cli
```

lylgithub2021

[07:12](#msg6167d8539d20982e4fbc1533)

```
f: function [str] [append "." str]
f "a" ;;  ".a" as expected
f "a" ;; ".aa" Why same input gets different output?

g: function [str] [append str "."]
g "a" ;; "a."
g "a" ;; "a." Same input gets same output.
```

Why does `append` play such odd roles in function "f" and "g"?

rebolek

[07:27](#msg6167dbf92197144e8464967d)This is a common error and understanding why it works this way is very important. If you define a function, its body is a block of values. You can still access them. Let me explain with some code:

```
>> f: function [str] [append "." str]
== func [str][append "." str]
```

Now let’s take a look at the body of the function:

```
>> body-of :f
== [append "." str]
```

Append a dot and take a look at the body again:

```
>> f "."
== ".."
>> body-of :f
== [append ".." str]
```

See? The body changed. Let's try to change it directly:

```
>> change next body-of :f "__"
== [str]
>> body-of :f
== [append "__" str]
```

And try to append now:

```
>> f "."
== "__."
```

As you can see, by appending to a string, you are modifying the original string. This is very important to understand. If you don’t want this to happen, use something like `append copy "." str`.

[07:29](#msg6167dc5c2197144e846497b1)It works this way with every series.

lylgithub2021

[07:39](#msg6167de96cd4972068b47f206)Application of function will change the function. It's so dangerous!!

hiiamboris

[07:58](#msg6167e324fb8ca0572bbf1715)https://github.com/red/red/wiki/\[DOC]-Why-you-have-to-copy-series-values

lylgithub2021

[07:59](#msg6167e34b38377967f44f72fc)@rebolek @hiiamboris Many thanks!

pekr

[08:56](#msg6167f0bad78911028ada0cfa)Yes, sometimes the freedom of expression is too dangerous and we prefer to live in between the given boundaries :-)

rebolek

[11:09](#msg616810059d20982e4fbc9e48)There are people that prefer that `body-of` would return a copy of the function’s body, so you won’t be able to modify the function. I believe @Oldes is one of them? You can find arguments for both directions, it’s one of those problems where it’s hard to say who is right. I tend to support modification, but then we need a way to mark blocks as immutable which I hope would come.

Oldes

[12:14](#msg61681f403f09d85736122611)&gt; To \_copy\_, or not to \_copy\_, that is the question:  
&gt; Whether 'tis nobler in the mind to suffer  
&gt; The slings and arrows of outrageous fortune,  
&gt; Or to take Arms against a Sea of troubles,  
&gt; And by opposing end them: to die, to sleep;

I'm just following @carls here \[CC\_166](https://www.curecode.org/rebol3/ticket.rsp?id=166)

[12:45](#msg6168266b29ddcd029320c21f)@rebolek protecting just the body is not enough, you would have to deeply protect all the function's values as well.

rebolek

[14:06](#msg6168397f38377967f4504b24)@Oldes of course

greggirwin

[18:28](#msg616876bd38377967f450e59e)Only those practicing the dark arts should cause themselves problems with func body modification, though I've never heard of anyone doing so. Perhaps they just vanished when it happened. The basic "why you have to copy" issue is something everyone trips over at some point, but is also fundamental to Red. It's a great rule for static analysis tools to include.

The main reason to prevent these kinds of modifications is security. As soon as we start talking about untrusted code the rules change. But simple copying of func bodies isn't nearly enough. We need systemic thinking and design to hold the gates.

[18:51](#msg61687c1da41fd20699e3015a)We few, we happy few, we band of brothers.

## Friday 15th October, 2021

Sergey\_Vladivostok\_gitlab

[02:37](#msg6168e960fb3dcd4e88293a63)

```
>> a: b: 1
== 1
>> c: d: [1 2]
== [1 2]
>> a =? b
== true
>> c =? d
== true
>> a: a + 2
== 3
>> b
== 1
>> a =? b
== false
>> c: append c [3 4]
== [1 2 3 4]
>> c =? d
== true
>> d
== [1 2 3 4]
```

"a" and "b" have different memory cells, and "c" and "d" have one. Accordingly, shouldn't "a =? b" return a "false" initially?

gltewalt

[02:49](#msg6168ec26d3ae402e474be1be)They "point" to the value

Sergey\_Vladivostok\_gitlab

[02:49](#msg6168ec3338377967f451f4a3)likewise

```
>> e: copy d
== [1 2 3 4]
>> e = d
== true
>> e =? d
== false
```

[03:18](#msg6168f30ecd4972068b4a8570)@gltewalt "a" and "b"? Or "c" and "d"?

```
>> e
== [1 2 3 4]
>> d
== [1 2 3 4]
>> c/1 =? d/1
== true
>> e/1 =? d/1
== true
>> e/2 =? d/2
== true
>> e/3 =? d/3
== true
>> e/4 =? d/4
== true
>> e =? d
== false
```

can't understand the logic. elementwise identical, together not.

[03:26](#msg6168f4dafb8ca0572bc1b2ac)

```
>> a: "1"
== "1"
>> b: "1"
== "1"
>> a =? b
== false
>> (to-integer a) =? (to-integer b)
== true
>> (to-float a) =? (to-float b)
== true
>> (to-char a) =? (to-char b)
== true
>> (to-string a) =? (to-string b)
== false
>> (to-block a) =? (to-block b)
== false
>> (to-block a) = (to-block b)
== true
>> (to-block a) == (to-block b)
== true
```

what is wrong with a "string" or a "block" in "=?" ?

gltewalt

[03:34](#msg6168f6df8c019f0d0b36a0b4)"can't understand the logic. elementwise identical, together not. "

You copied it, so it doesn't have the same identity even though the elements are identical

Sergey\_Vladivostok\_gitlab

[03:38](#msg6168f7c5fb8ca0572bc1b924)why are the elements of the copy not a copy like the whole block?  
String is not element?

gltewalt

[03:40](#msg6168f8393f09d85736143b58)  
\=? is to compare identity  
&gt;

[03:43](#msg6168f8e1fb3dcd4e882957df)I'm not sure, but im guessing that `to` creates a new entity for `series!`

[03:45](#msg6168f9682197144e846741a5)With that hypothesis, all of these types should report `false` with `=?`

```
>> help series!
SERIES! is a typeset! value: [block! paren! string! file! url! path! lit-path! set-path! get-path! vector! hash! binary! tag! email! ref! image!]
```

[03:45](#msg6168f97529ddcd029322bb22)When using `to`

Sergey\_Vladivostok\_gitlab

[03:53](#msg6168fb56f2cedf67f986a844)

```
>> a: ["abc" "cde"]
== ["abc" "cde"]
>> b: copy a
== ["abc" "cde"]
>> a/1 =? b/1
== true
>> ? a/1
A/1 is a string! value: "abc"
>> a/1/2 =? b/1/2
== true
>> c: "abc"
== "abc"
>> d: copy c
== "abc"
>> c =? d
== false
>> ? c
C is a string! value: "abc"
```

"c" string, "d" string, "a/1" string, "b/1" string... why "c =? a/1" "==false"

```
>> series? c
== true
>> series? a/1
== true
>> series? a
== true
>> series? d
== true
```

gltewalt

[04:01](#msg6168fd0e98c13e7550d6d0f9)c is different chunk of data in memory than a/1.

Sergey\_Vladivostok\_gitlab

[04:03](#msg6168fd8a38377967f452171f)like "a" and "b" after "a : b: 1"

gltewalt

[04:03](#msg6168fd8aee6c260cf71c8728)Is there a reason you need to compare identity?

[04:03](#msg6168fda5ee6c260cf71c8740)No a and b point to the same chunk in memory in that case

[04:04](#msg6168fdc5cd4972068b4a98aa)Or, this does `a: b: "1"`

Sergey\_Vladivostok\_gitlab

[04:04](#msg6168fde72197144e84674a86)just trying to figure out how it works, without a specific task

gltewalt

[04:06](#msg6168fe2a2197144e84674b05)

```
>> a: "1"
== "1"
>> b: "1"
== "1"
>> a =? b
== false
>> c: d: "1"
== "1"
>> c =? d
== true
```

[04:07](#msg6168fe93fb3dcd4e88296370)`a` and `b` in my example point to different created strings. `c` and `d` point to the same created string.

[04:11](#msg6168ff6b29ddcd029322c7ce)A guru will be better to give you the details. Or `why` series! seem to be newly created when using `to`

Sergey\_Vladivostok\_gitlab

[04:12](#msg6168ff958c019f0d0b36b13e)

```
>> a: ["abc" "cde"]
== ["abc" "cde"]
>> b: copy a
== ["abc" "cde"]
>> a/1 =? b/1
== true
```

"a/1" and "b/1" are different strings?

gltewalt

[04:14](#msg6169001c9d20982e4fbedd18)Now that one is strange to my understanding

[04:14](#msg6169002afb8ca0572bc1c9fe)We need a guru

[04:15](#msg616900579d20982e4fbedd8a)

```
>> a =? b
== false
```

[04:15](#msg616900732197144e84674fc5)Different blocks

[04:16](#msg6169009b3f09d85736144dcc)I assumed that a/1 =? b/1 would be false

[04:18](#msg61690109a41fd20699e42bfc)

```
>> a
== ["abc" "def"]
>> b: copy/deep a
== ["abc" "def"]
>> a/1 =? b/1
== false
```

[04:18](#msg6169012a29ddcd029322cc28)ahh, `copy/deep`

[04:19](#msg61690140a41fd20699e42ca7)Still, I'd like to hear from someone with deeper knowledge on your questions

hiiamboris

[08:05](#msg616936368c019f0d0b3728ee)@Sergey\_Vladivostok\_gitlab `same?` compares cell contents bitwise. See \[here](https://github.com/red/red/blob/022211cb1199a740e2e73ebe499104bfbbc101ce/runtime/allocator.reds#L39) and \[here](https://github.com/red/red/blob/022211cb1199a740e2e73ebe499104bfbbc101ce/runtime/datatypes/structures.reds#L17) for what cell is.

[08:06](#msg616936a1fb8ca0572bc2431b)Where it's used in practice mostly is to check if two series are actually the pointers to the same buffer at the same index, or if two words are spelled identically and are bound to the same context.

Sergey\_Vladivostok\_gitlab

[09:11](#msg616945c13f09d8573614e6f3)@hiiamboris two different variables with the same values for `integer` have the same header and data, but the `string` does not? How else to explain the difference in bitwise comparison?

```
>> 1 =? 1
== true
>> "a" =? "a"
== false
```

\*I don't understand the source code well yet :(*

hiiamboris

[09:17](#msg6169472d29ddcd02932370ea)cell does not contain series data, only a pointer to where it's stored in memory

[09:19](#msg616947bb9d20982e4fbf8358)`"a"` &lt;- this creates a single series buffer  
`"a" "a"` &lt;- this creates \*two* different buffers  
`"a" "a" "a"` &lt;- 3 series buffers  
`a: "a" a a a` &lt;- only one series buffer

[09:21](#msg61694835f2cedf67f987562d)you have to read this too: https://github.com/red/red/wiki/\[DOC]-Why-you-have-to-copy-series-values

Sergey\_Vladivostok\_gitlab

[10:26](#msg6169575cd78911028add507f)@hiiamboris Thanks. I'll read it.

[11:50](#msg61696b0ffb3dcd4e882a5c46)with `copy` understood, without `/deep` in different blocks pointers point to the same memory area, as well as `a: b: "abc"`. But why then does `c: d: 123` point to different areas? When you change one, the second does not change? "Shared" memory is a property of only series, or does the `+` in `d: d + 5` do something like `copy/deep`?

Oldes

[13:55](#msg61698868ee6c260cf71dd097)`integer!` is one of `scalar!` values... which means, that the value is stored directly in the value slot, not by reference to a more complex values, like series are.

[13:58](#msg616988f49d20982e4fc01ccb)`a` and `b` shares reference to the same string `abc`, but `c` and `d` have the value in its slots.

[13:59](#msg6169894838377967f4536272)To see other scalar types, do `help scalar!`

[14:01](#msg616989cdfb8ca0572bc30c5e)You can also see how the value slots looks like internally \[here](https://github.com/red/red/blob/master/runtime/datatypes/structures.reds)

[14:03](#msg61698a34d78911028addc9b6)Its the `node` struct's part, which is copied (or not).

Sergey\_Vladivostok\_gitlab

[22:12](#msg6169fce58c019f0d0b38fe7f)@Oldes Understood thanks. `=?` returns `true` for `scalar!` only if their types and values are the same, and for `series!` if their pointers are the same.

## Monday 18th October, 2021

cloutiy

[00:53](#msg616cc58c3f09d857361c656a)Are there any browser automation tools written in red or rebol? An example would be selenium webdriver which allows to programatically simulate a user interacting with a page in the browser, clicking buttons, filling out fields etc...

greggirwin

[03:11](#msg616ce5dc29ddcd02932b1c00)Nope.

Slownite

[09:05](#msg616d38da8c019f0d0b3fccb4)Hi everyone, I tried to install the latest build of red on window10 64bit, and I had this error when compiling red GUI console:  
\*\** Driver Internal Error: Script Error : select expected series argument of type: series object port  
\*\** Where: none  
\*\** Near: [select res [1 "Could not open the file."  
2 "Could not map the file."  
3 "Could not map a view of the file."  
4 "Could not convert the file name to Unicode."  
]]  
Do you know how to resolve it?

hiiamboris

[09:08](#msg616d3993fb8ca0572bcaef59)Hi Slownite, pls disable your AV software ;)

Slownite

[09:27](#msg616d3e119d20982e4fc7fd39)Thank you very much it's working :)

hiiamboris

[09:30](#msg616d3eb9cd4972068b53ba07)@greggirwin the warning should be on the download page right under the links  
"On Windows if installation fails, try disabling your antivirus!"

ne1uno

[09:37](#msg616d406a8c019f0d0b3fde68)excluding a few directories may be enough

[09:38](#msg616d4095f2cedf67f98fd829)easier said than done

## Monday 25th October, 2021

lylgithub2021

[02:46](#msg61761a6a2197144e84859149)How to use "anonymous function" in Red as the following example shows :

```
a: [-2 -1 0 1 2]
collect [foreach i a [if function[x][x > 0] i [keep i]]]
```

greggirwin

[02:49](#msg61761b50fb3dcd4e88478899)`collect [foreach i a [if do [function[x][x > 0] i] [keep i]]]`

lylgithub2021

[03:42](#msg617627b47db1e3753e5e7f73)Many thanks!! @greggirwin

[03:54](#msg61762a692197144e8485b239)@greggirwin following your instruction, I tried this:

```
>> a: [-2 -1 0 1 2]
== [-2 -1 0 1 2]
>> collect [foreach i a [if do [function[x][x > 0] i] [keep i]]]
== [-2 -1 0 1 2]
```

[03:54](#msg61762a7b98c13e7550f565da)But what I want is \[1 2].

greggirwin

[04:00](#msg61762be198c13e7550f568d5)Sorry, I was just thinking about getting the function evaluated, but missed a detail.

```
collect [foreach i a [if do reduce [function[x][x > 0] i] [keep i]]]
```

My question now is why you want/need it to be anonymous, since it's faaaarrrr less efficient to recreate the function inside a loop.

[04:12](#msg61762e929d20982e4fdd2f1f)Just like you normally would.

```
>> fn: function [x][x > 0]
== func [x][x > 0]
>> collect [foreach i a [if fn i [keep i]]]
== [1 2]
```

[04:12](#msg61762eaefb3dcd4e8847b233)Remember, functions are first class values you can pass around.

lylgithub2021

[04:15](#msg61762f769d20982e4fdd3113)Thank you! I get it. So explicitly calling a function is better than anonymous function inside a loop.

greggirwin

[04:19](#msg617630523f09d8573632a16f)If it's not performance critical, or your loops are small, don't worry about it. It's just a lot more overhead in evaluation and added GC pressure. It's late here, but I'll try to profile it tomorrow so you can see the difference.

lylgithub2021

[04:21](#msg617630c9fb3dcd4e8847b58b)Thank you!!

Sergey\_Vladivostok\_gitlab

[09:23](#msg61767785d3ae402e476b2d42)Is it possible, without using php-&gt;file-&gt;red, to transfer data from an html form using the POST method? When transmitted by the GET method, it is only if there is no sign equal (=) to (http://rebol.scienceontheweb.net/red.cgi?aaa123) works, but (http://rebol.scienceontheweb.net/red.cgi?aaa=123) does not work, system/script/args is empty. Why is it that when you just call (http://rebol.scienceontheweb.net/red.cgi) everything starts up, but when you call the same script from a form with parameters, it gives an error? Rebol/core 2 also behaves strangely, and Rebol 3 works as it should, you can type the code in the \[editor] (http://rebol.scienceontheweb.net/editor.html) and when you click the button, it will be executed, displaying the result in a new window.  
And another question - is it possible to statically build Red so that all the required libraries are in it?

hiiamboris

[09:39](#msg61767b6ff2cedf67f9a5e1e8)looks like the issue is in CGI script or server config

Sergey\_Vladivostok\_gitlab

[09:47](#msg61767d318c019f0d0b55cb38)I do not have access to server logs :(

[09:48](#msg61767d79d3ae402e476b3d2e)maybe someone experimented with the CGI mode

greggirwin

[18:15](#msg6176f434fb8ca0572be22dbb)@lylgithub2021, using https://gist.github.com/greggirwin/908d44dc069ed84cf69f053e1308390d to profile:

```
n: 100'000
a: make block! n
repeat i n [append a i]

anon: [
	res: collect [
		foreach i a [if do reduce [function [x][even? x] i] [keep i]]
	]
]
funcy: [
	fn: function [x][even? x]
	res: collect [foreach i a [if fn i [keep i]]]
]

profile/show [anon funcy]
```

For 100K elements:

```
Time         | Time (Per)   | Memory      | Code
0:00:00.063  | 0:00:00.063  | 2098980     | funcy
0:00:00.223  | 0:00:00.223  | 101300148   | anon
```

I ran it with 1M items as well, which showed that this crude profiler doesn't work very well. What felt like a full minute of wall clock time reported ~0:0:2.5. @giesse's profiler may do better. It may have been waiting for the GC in the console, since the `anon` reported used 1GB of memory use.

## Tuesday 26th October, 2021

lylgithub2021

[04:30](#msg6177846ca41fd2069905a86e)@greggirwin great!

## Friday 29th October, 2021

ams02468

[17:17](#msg617c2c9a7db1e3753e6dc611)Does red support multiple colors in cli?

hiiamboris

[17:22](#msg617c2de1fb8ca0572bef6f99)!\[](https://i.gyazo.com/d193959ab5f4dd6912902867d1eb1100.png)

[17:23](#msg617c2e0fd3ae402e4779d0cd)took it from \[here](https://gist.githubusercontent.com/mlocati/fdabcaeb8071d5c75a2d51712db24011/raw/b710612d6320df7e146508094e84b92b34c77d48/win10colors.cmd)

[17:24](#msg617c2e45f2cedf67f9b4304a)but if you're asking if CLI console has a highlighting module, then no

ams02468

[18:04](#msg617c37c6cd4972068b77f7d1)thanks @hiiamboris

ne1uno

[18:28](#msg617c3d378c019f0d0b647132)interp-events branch has `profile` now, but it doesn't like `even?` in `anon`, no /count too

[18:28](#msg617c3d3798c13e7550047c33)&gt;\*\** Script Error: even? does not allow date! for its number argument

greggirwin

[19:25](#msg617c4abaee6c260cf74a83e2)Thanks for the report @ne1uno.

[21:56](#msg617c6e08cd4972068b7877c7)@ne1uno do you have some example code you can put in a gist?

ne1uno

[22:06](#msg617c7057fb3dcd4e885778d6) /show is default. I think the idea is `do/trace` to enable. /count might be more difficult to implement since /trace gives you a breakdown of all words and gc timing.

[22:06](#msg617c705738377967f48072d6)\`function timing of 00:00 might make it more difficult to make your point.

[22:06](#msg617c7057a41fd20699123236)`profile` appears to be a wrapper on deeper `profiler` that has no help or source.

## Wednesday 3th November, 2021

ams02468

[10:13](#msg618260afd78911028a184dfe)Hello everyone, I hope you have a good day. I had a question  
How to extract the contents of a string value in regedit?

hiiamboris

[10:30](#msg618264d3d78911028a18576f)have an example of input and output?

pekr

[10:35](#msg618265f72197144e84a36dd2)Maybe his idea was to read registry value using Red? Rebol/Command could do it in the past, here we would need some win32 API wrapper imo ...

hiiamboris

[10:43](#msg618267b73f09d857365007d6)like this?

```
>> call/output {reg query HKLM\Software\Microsoft\Windows\CurrentVersion /v ProgramFilesDir} s: ""
>> find/tail trim/lines s "REG_SZ "
== "C:\Program Files (x86)"
```

pekr

[10:45](#msg6182685d7db1e3753e7bf947)Perfect :-)

ams02468

[11:16](#msg61826f9e2197144e84a38594)thanks @hiiamboris

## Friday 5th November, 2021

ams02468

[12:14](#msg6185201b7db1e3753e823ccb)Is there a way to call the variable or function on the next line of the script before we get to it? for example

```
print test
test: "hi"
```

hiiamboris

[12:16](#msg6185208098c13e7550190f43)what are you trying to achieve?

ams02468

[12:28](#msg618523648c019f0d0b792b5f)I want to see, instead of defining, can functions be defined in the first lines and then in the last lines of the script? (My goal is to keep the script clean of clutter)

hiiamboris

[12:33](#msg6185249b8c019f0d0b792e07)

```
f1: does [print 1]
f2: does [print 2]
code: [
	;-- uses functions defined after it
	f1 f2 fx
]
fx: does [print x]
x: "123"
do code
```

ams02468

[12:43](#msg6185270838377967f494992e)Thanks @hiiamboris it was helpful

greggirwin

[20:43](#msg618597577db1e3753e8351ea)A value has to exist before it is \*evaluated\*, but you can have references to a value in any order. This comes back to the fundamental concept in Red that everything is data until it is evaluated.

## Sunday 7th November, 2021

ams02468

[19:31](#msg618829877db1e3753e893fc3)@qtxie After testing different versions of red a few times, I realized that red extension (vs code)does not work properly from September onwards and is not able to understand the code. In simple terms, I realized that "red.intelligence": does not work for new versions

## Monday 8th November, 2021

cprinos

[00:49](#msg61887406f2cedf67f9d06ca1)Been a while since I have done things with red— had to leave it behind without 64 bit mac support. I was wondering if the Mac M1 Arm chips have changed anything in terms of future releases or it’s actualy still more related to 64 builds and not the architecture.

greggirwin

[06:26](#msg6188c3212197144e84b2350d)64-bit first, but the architecture is an issue when that time comes.

qtxie

[07:01](#msg6188cb48ee6c260cf7676e4d)@ams02468 I used an October version on Windows and it works fine. Which OS are you using?

ams02468

[14:41](#msg61893713d3ae402e47980446)@qtxie I do not know exactly, but I always came up with red updates, I think the versions that came earlier this month, after that, the extension did not work properly anymore.Procedure for my operating system  
windows 10 ltsb versions 17763, 1909, 2004 and windows 7 2009, 2011, 2020 did not work I now have the version Red 0.6.4 for Windows built 25- Sep-2020/16: 30: 23 + 03: 30 has no problem

## Tuesday 9th November, 2021

qtxie

[02:22](#msg6189db79ee6c260cf769fc57)@ams02468 25- Sep-2020? That's quite an old version. What error message did you get? Did you try to do a fresh installation?

1\. uninstall the red vscode plugin and delete all the Red settings in vscode config file.  
2\. delete all the CLI consoles (console-\*.exe) in folder `C:\ProgramData\Red`  
3\. generate the latest CLI console: `> red-latest.exe --cli`  
4\. install the red vscode plugin.

That should be enough to use the plugin, \*\*no need to config\** it in vscode.

ams02468

[04:45](#msg6189fd043f09d85736618f28)@qtxie As I said before, it works but it does not work perfectly, for example  
If we put a slash after the call command, it will not show the options that this command supports, if it does in older versions, or by writing the first letter, it will not show the list of commands that are displayed with this letter, or it will not show it completely. Does not

qtxie

[07:15](#msg618a200dee6c260cf76abee0)@ams02468 Ah, you mean the plugin's version. Indeed, the new plugin lost this feature. The new plugin was rewritten completely by @bitbegin, seems he forgot to add it.

[07:44](#msg618a26cd3f09d85736620291)The new plugin should have better understand of the red code than the older one. It should be able to show refinements for user defined functions too. The older one is quite simple and only be able to complete built-in functions.

ams02468

[20:57](#msg618ae0a29d20982e4f0e91c6)@qtxie Maybe what you are saying is true and does not make a difference for professional users, but showing the details in the old extension is much more than the new type, which increases the speed of work and familiarity with red codes for novice users. my purpose It's not a comparison, I just wanted to raise this issue because it's very annoying for me personally

## Wednesday 10th November, 2021

ams02468

[22:03](#msg618c41998c019f0d0b8a05f5)Hi all I have a problem with a CMD command that runs well in CMD or batch file well, but whenever I run it in red, the order runs, but nothing happened after i tried to Write the command inside a BAT file and run it by red, but not working

```
call { Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Embedded\EmbeddedLogon" /v "BrandingNeutral" /t REG_DWORD /d "1" /f  }
```

hiiamboris

[22:04](#msg618c4207cd4972068b9d7f34)are you \*sure* it's not working?

[22:08](#msg618c42c02197144e84baa4cd)and are you sure it's working in cmd \*with* that extra space before it?

ams02468

[22:35](#msg618c491d29ddcd029375b6e1)ye

## Thursday 11st November, 2021

ams02468

[05:35](#msg618cab98ee6c260cf770a028)I tried these too

```
call {cmd /c Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Embedded\EmbeddedLogon" /v "BrandingNeutral" /t REG_DWORD /d "1" /f  }
call/console {cmd /c Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Embedded\EmbeddedLogon" /v "BrandingNeutral" /t REG_DWORD /d "1" /f  }
write %z.bat {Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Embedded\EmbeddedLogon" /v "BrandingNeutral" /t REG_DWORD /d "1" /f  }
call/console %z.bat
```

but still not working

hiiamboris

[06:42](#msg618cbb6629ddcd029376b0b3)idk, works for me just fine:

```
>> call/console {Reg.exe /?}

REG Operation [Parameter List]

  Operation  [ QUERY   | ADD    | DELETE  | COPY    |
               SAVE    | LOAD   | UNLOAD  | RESTORE |
               COMPARE | EXPORT | IMPORT  | FLAGS ]

...
```

greggirwin

[07:16](#msg618cc36b2197144e84bbb842)@ams02468 or others who might know, since I may not have time to test anytime soon, could it be that your Red doesn't have enough permissions, and those are inherited when `call` is used?

ams02468

[08:22](#msg618cd2c998c13e75502b1b0b)@hiiamboris Go into the registry and check from there. You probably saw the message (The operation completed successfully.) And thought it worked, but this is not the case. No changes have been made to the registry.

hiiamboris

[08:57](#msg618cdb0bd78911028a30de9d)I don't have "Windows Embedded" key so start with, but for an existing path it works.

greggirwin

[18:56](#msg618d677bcd4972068ba00c06)@ams02468 if the message Red gets back says "It worked!", but it didn't, I think that falls outside Red's responsibility.

ams02468

[22:55](#msg618d9f4dcd4972068ba0841e)@greggirwin But why does it not work only on red? If you mean that there is a problem with the operating system, then it should have the same problem when using it in cmd or bat file, but their procedure works. I even put this command in red command line. I also ran the administrator, but it didn't work. Regarding access to Windows system's, I must say that the entire Windows partition has full access.

greggirwin

[23:44](#msg618daaf3ee6c260cf772dff3)If running as admin didn't work, then I don't have any other ideas. When we issue a `call`, we can only know what the OS tells us about success. That said, it's quite possible that something \*internal* to Red's `call` implementation has some effect. If it works for Boris then it will take some research. Feel free to search for tickets and open a new one if needed.

## Monday 15th November, 2021

XavierFVJDebecq

[23:05](#msg6192e7c1d3ae402e47acf62d)Hello everybody, does anyone has ever used logical programming with RED ? I would like to code a prolog 4 interpreter (or any logical programming with constraint langage) in Red in order to use it as a dialect, i am looking if its feasible. My long term objective is to have a dialect that enable declarative programmation with the possibility of generating a part of the code with Red by parsing information on any type of support (net, documents , ...)

zentrog:matrix.org

[23:12](#msg6192e956d78911028a3d697a)@ams02468: Did you check in the 32-bit registry hive?

## Tuesday 16th November, 2021

ne1uno

[02:50](#msg61931c5f8c019f0d0b984934)@XavierFVJDebecq,  have you seen http://www.rebol.org/view-script.r?script=prolog.r

ams02468

[13:36](#msg6193b3eb29ddcd029385178b)@zentrog:matrix.org well done, but now that as you said I check it, but why does it change? I give it a 32-bit address, but why does it change to 64-bit?  
The order I give him

```
call/console {Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Embedded\EmbeddedLogon" /v "BrandingNeutral" /t REG_DWORD /d "13" /f }
```

The command that is executed

```
call/console {Reg.exe add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows Embedded\EmbeddedLogon" /v "BrandingNeutral" /t REG_DWORD /d "13" /f }
```

hiiamboris

[13:41](#msg6193b523f2cedf67f9e92897)Interesting. WOW6432 is for 32-bit apps. So perhaps `reg` knows it's invoked by a 32-bit process and transforms the address accordingly.

[13:43](#msg6193b567d78911028a3f098e)What if you add `/shell` to `call`?

[13:47](#msg6193b65729ddcd0293851dca)There seems to be two `reg` commands, one in System32, another in SysWOW64. Maybe you simply need to run the other one?

ams02468

[14:26](#msg6193bf88d3ae402e47aeb6ea)I also used call / shell but it did not work. Now how can I execute this command as 32 bits?

cloutiy

[16:49](#msg6193e131fb8ca0572b24b9ca)Hello, maybe its just me but i seem to be seeing more and more propaganda about web3, blockchain and dapps. In the Red Fundamentals book by Ivo there is mention about Red's intended role in this space. Would be interested in getting on the Web3 train early, and was wondering how red was progressing towards this emerging trend.

zentrog:matrix.org

[17:03](#msg6193e470fb8ca0572b24c0f5)@ams02468: It looks like you can specify `/reg:32` or `/reg:64` to target the appropriate side. https://stackoverflow.com/a/51594448/116311  
My best guess is maybe 32bit vs 64bit processes have different PATH variables defined, so a different reg.exe is found. I'm not sure if that is the case though...

greggirwin

[17:16](#msg6193e7517db1e3753ea2b6f4)@cloutiy that's where C3 comes in. It's not "early" anymore, but the train only runs between a couple towns so far. :^)

## Wednesday 17th November, 2021

ams02468

[02:23](#msg619467b0dce0995a6f9ef590)@zentrog:matrix.org Thank you very much. And to thank all the friends who helped, I must say that Red had no problem and the problem was the details of my order.

greggirwin

[19:13](#msg619554474e0be23f8f431001)Something we may want to note in a wiki page. @zentrog:matrix.org any idea what page might be best, or do we need an "OS Tips and Tricks" page?

## Thursday 18th November, 2021

duskhorn:matrix.org

[09:23](#msg61961b8d42fc2863b2146dea)Hello everyone!  
I am having a problem loading an image using the `load` function; the console just says

```
*** Access Error: cannot open: %file.png
*** Where: decode
*** Stack: load
```

and I really don't know what I could be doing wrong

rebolek

[09:32](#msg61961d94197fa95a1c79ecbd)Hi @duskhorn:matrix.org

The error message is really not very helpful and should be improved. Can you check if it’s really a PNG file? Maybe it has the wrong extension.

duskhorn:matrix.org

[09:36](#msg61961eb176e3791755f0d1a7)It is a png file, I can use GIMP or Firefox to open it and it displays fine.  
I even checked I entered the path correctly

What I'm doing is just

```
>> load %file.png
```

And I have file.png in the folder I'm running the red console in

hiiamboris

[09:37](#msg61961edd026dc63ca6021307)type `probe read/binary/part %file.png 4`

[09:37](#msg61961ee1b5ba9e5a11c10226)what's it saying?

duskhorn:matrix.org

[09:39](#msg61961f5076e3791755f0d337)It displays  
`#{89504E47}`

hiiamboris

[09:39](#msg61961f6ec2cc0e5343b75b26)that's not a PNG file

[09:40](#msg61961f8363c1e83c9515d304)nor jpeg or gif

[09:41](#msg61961fc1c2cc0e5343b75ba4)wait I may be wrong

[09:42](#msg61961ffa63c1e83c9515d44c)it is a PNG alright ;)

[09:43](#msg6196205442fc2863b2147912)forgot it starts with a strange symbol

pekr

[09:44](#msg6196206242fc2863b2147926)upload the png file somewhere then, so that others can test too ....

hiiamboris

[09:44](#msg6196207aa9c8eb44c4e54722)yes

duskhorn:matrix.org

[09:44](#msg6196208e6104ea63b6a09aae)Let me try this in the latest automated build first, I noticed mine is a cuple weeks old

hiiamboris

[09:45](#msg619620a5cdb5c1081a1a66f9)nothing has changed in the image codec I believe

duskhorn:matrix.org

[09:47](#msg6196212f63c1e83c9515d6f7)oh well, I just updated it nonetheless

hiiamboris

[09:47](#msg6196214e8f98cb081178ccbf)I suggest opening an issue and attaching that PNG

duskhorn:matrix.org

[09:50](#msg619621d5cd3f06175dc0e437)it still doesn't work, same error, opening an issue

ldci

[15:12](#msg61966d4a63c1e83c951688b2)@duskhorn:matrix.org Try this in red console

```
view layout [image %file.png]
```

[15:42](#msg61967455b5ba9e5a11c1c33a)@duskhorn:matrix.org Did you try to just open a basic terminal and launch red?

greggirwin

[18:44](#msg61969ef88f98cb081179efd7)@duskhorn:matrix.org can you load other image files successfully? If so, there's something about that specific image causing the problem.

[18:45](#msg61969f5576e3791755f1f64e)Ah, I see this chat continued in red/bugs.

XavierFVJDebecq

[21:25](#msg6196c4bba9c8eb44c4e6be14)@ne1uno That sounds interesting. i go to check it and eventually adapt it. Thanks for the advice. Did you use it ?

## Friday 3th December, 2021

chunes3

[09:35](#msg61a9e4ce42fc2863b23e3909)Hey all, new to Red. Sorry if this is a silly question, but does Red come with the ability to change numbers into other bases? I saw enbase and debase, but those seem more for encoding and decoding and I couldn't figure out how to change the base of a number with them.

ne1uno

[09:56](#msg61a9e9c6c2cc0e5343e1666a)'to-integer debase/base "00000001" 2\` string may need length 0 padded for different base?

[09:58](#msg61a9ea6175fa48164969b8ba)@chunes3&gt; `pad/with/left "1001" 8 #"0"`

chunes3

[10:03](#msg61a9eb88b5ba9e5a11eaf867)I did not realize it only works with certain length strings. Thank you

ne1uno

[10:11](#msg61a9ed3dcdb5c1081a442a9f)seems like an unnecessary error but I'm not sure why it has that limitation

dsunanda

[12:44](#msg61aa1124b5ba9e5a11eb4941)@chunes3 Red is the direct descendant of Rebol. There's a script in the Rebol library that converts to and from any base:  
http://www.rebol.org/documentation.r?script=base-convert.r  
Sadly, the Rebol version doesn't quite work in Red - minor syntax changes. But I've got a converted version that does, if you want it.

toomasv

[13:13](#msg61aa17e3c6149e5349620317)Will this count as converter from 10-base to &lt;=10-base :)

```
rebase: func [num base][
    either base <= 10 [
        res: reduce [num % base] 
        while [base <= num: to integer! num / base][
            insert res num % base
        ] 
        to integer! rejoin head insert res num
    ][cause-error 'user 'message "Bases below 10, please!"]
]()

>> rebase 64 32
*** User Error: "Bases below 10, please!"

>> rebase 64 10
== 64
>> rebase 64 9
== 71
>> rebase 64 8
== 100
>> rebase 64 7
== 121
>> rebase 64 6
== 144
>> rebase 64 5
== 224
>> rebase 64 4
== 1000
>> rebase 64 3
== 2101
>> rebase 64 2
== 1000000
```

cloutiy

[14:41](#msg61aa2ca9a9c8eb44c40fa188)Hello, for those who speak french and cone from rebol, which books are available in french? I own `Programmer en Rebol` by `Magaud et Claude Petit`. Also `Rebol` by `Auverlot`. Are there others? Are there books in languanges other than french and english that you know of?

greggirwin

[18:03](#msg61aa5beaa9c8eb44c4100cfd)I don't know of any others in French @cloutiy.

[18:04](#msg61aa5c3eabdd6644e3bb2d78)In English there was Rebol for Dummies, Rebol The Official Guide, and the Pakt book from Ivo Balbert.

cloutiy

[20:13](#msg61aa7a778853d316402ba538)@greggirwin ok thanks gregg

ams02468

[22:12](#msg61aa964f75fa4816496b270f)Hi, I had a question. I have a series of files whose names I do not know and I want to transfer them from one directory to another. I wanted to know how can I do this? I can do this with cmd, but I want to do it in the red method, if you can help me

cmd method

```
copy * a\
```

## Saturday 4th December, 2021

gltewalt:matrix.org

[00:24](#msg61aab528cdb5c1081a45cfec)You dont want to call the shell ?

ams02468

[01:10](#msg61aac01a63c1e83c95413a05)I can use call / console but I want to use red as much as possible

gltewalt

[03:29](#msg61aae0b5b5ba9e5a11ecf65e)Can do something like this:  
http://rebol.net/cookbook/recipes/0011.html

[03:35](#msg61aae2066104ea63b6cc77cb)If you want to ignore subdirectories as you iterate, you can use `unless dir?`, like...  
`foreach item source [unless dir? item [ *do stuff* ]]`

ams02468

[04:55](#msg61aaf4a875fa4816496bc738)tanks @gltewalt

pekr

[05:11](#msg61aaf8846104ea63b6cc9e3f)You can also use ultra fast (at least in Rebol) `remove-each`filter to remove unwanted itesm. Something like:

```
files: read %.
remove-each dir files [#"/" = last dir]
```

ams02468

[23:22](#msg61abf838026dc63ca62fd1e8)tanks @pekr

## Tuesday 7th December, 2021

ams02468

[09:46](#msg61af2d5c8f98cb0811ad0350)Hello, can you tell me if there is a code or command to find the file in red? For example, this command

```
dir /s /b| find "test.txt"
```

scans all subfolders of the folder to find the file. I wanted to see if there is a similar example in red?

rebolek

[09:47](#msg61af2dbe6104ea63b6d4f9c3)@ams02468 there's no such command built-in, you would need to write it yourself

hiiamboris

[09:57](#msg61af300075fa4816497418ca)https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/glob.red

[09:57](#msg61af300b197fa95a1cae4f52)`glob/only "test.txt"`

ams02468

[10:06](#msg61af3216197fa95a1cae53ec)@hiiamboris thx

## Monday 13th December, 2021

lylgithub2021

[01:44](#msg61b6a598c2cc0e5343fc465e)I'd like to get such a result: if the value of an expression is not none, then return the value itself, else return %"". This is not difficult as the following example shows:

```
either none? 3 + 2 [%"][3 + 2]
```

In the above code, the expression `3 + 2` has to be written twice, and I don't like introducing another variable to express `3 + 2`. So, is there a simple way by which the expression is written only once?

zentrog:matrix.org

[04:00](#msg61b6c553cdb5c1081a5f0e43)lylgithub2021 (lylgithub2021): `any [3 + 2 %""]`

lylgithub2021

[04:02](#msg61b6c5e6abdd6644e3d528c4)Oh! So easy! Many thanks! @zentrog

## Tuesday 14th December, 2021

lylgithub2021

[06:27](#msg61b8395d197fa95a1cc22bf2)When I read a text file with `read`, I get a wrong message: invalid UTF-8 encoding. Does that mean `Red` is not able to read a non-utf8 encoding file such like `ansi`? Or is there any other way to read this kind of file?

rebolek

[06:41](#msg61b83cb08f98cb0811c0f9b7)@lylgithub2021 Look at https://gitlab.com/rebolek/castr/ there is a file `%codepages.red` that is able to read 10 most popular non-CJK codepages (others can be added of course).

badre\_enam\_twitter

[16:50](#msg61b8cb4fc2cc0e534301411d)Hello. Is there a way to set user agent while downloading a url?

## Wednesday 15th December, 2021

lylgithub2021

[01:51](#msg61b94a365a172871a90671a2)

```
>> dup: function [str n] [loop n [append "" str]]      
== func [str n][loop n [append "" str]]
>> dup "0" 4
== "0000"
>> dup "0" 4
== "00000000"
```

The same input gets different output. I know the problem comes from `append`. But how to clear it before the next loop without introducing new variables?

gltewalt:matrix.org

[02:04](#msg61b94d30b6d55b5adce9ba5f)copy str

[02:05](#msg61b94d7aaaf17f33271460e8)Err, copy ""

lylgithub2021

[02:07](#msg61b94de0440178658b964373)@gltewalt You mean `loop n [append copy "" str]`? This get "0" when `dup "0" 4`, not "0000"

greggirwin

[02:18](#msg61b95091d40eb146b0d1511a)https://github.com/red/red/wiki/%5BDOC%5D-Why-you-have-to-copy-series-values

gltewalt

[02:22](#msg61b951499a9ec834fbccf136)`dup: func [str n /local temp] [temp: copy "" loop n [append temp str]]`

lylgithub2021

[02:32](#msg61b953ad3c20302242694392)@gltewalt So another variable "temp" has to be introduced. Is there a version without using a temp variable?

ne1uno

[02:35](#msg61b9548efd9244223e460750)`append/dup`

gltewalt

[02:40](#msg61b955a04024f534f2bd0cba)`append/dup "" "0" 4`

lylgithub2021

[02:46](#msg61b957143c20302242694c5d)Oh, That's it! Many thanks @gltewalt @ @ne1uno @ @greggirwin !!

ne1uno

[02:47](#msg61b957360c681346aee6f8d6)`? append`

gltewalt

[02:50](#msg61b95802aaf17f3327147d19)break stuff `write/append %E.txt append/dup "" "e" 4000'000`

## Monday 20th December, 2021

lylgithub2021

[03:49](#msg61bffd58b6d55b5adcf7edb7)I put some variables/functions which may change often（added，deleted，modified） in a file named "aux.red". For example, the content of aux.red is: `Red [] a: 1 b: 2`. In the main program "main.red", the content of aux.red is introduced by `do %aux.red`. The reason for the above handling is that I don't like to compile every time the main programme when the aux.red is modified(for example, `a: 2`, or delete `b`). This works well when running the main programme by interpreter. However,to compile the main programme, `do %aux.red` has to be replaced by `#include %aux.red`. This causes another problem -- when the content of aux.red is modified, the main programme has to be compiled again which is not my initial intention. So, how to handle this item?

toomasv

[04:44](#msg61c00a33fd9244223e54798d)Leave just `#include…`.

[04:45](#msg61c00a6b3c2030224277ab00)It is interpreted like `do`.

lylgithub2021

[06:55](#msg61c028ff9a9ec834fbdb66a8)Thank you @ @toomasv !

## Tuesday 21st December, 2021

duskhorn:matrix.org

[09:00](#msg61c19794fd9244223e57ec4a)Hello people it's me again, the Void Linux bug guy. I still don't know what's wrong, but I have another question since I can't find much stuff around

How does one embed Red into another language?

rebolek

[09:06](#msg61c199189a9ec834fbdead17)@duskhorn:matrix.org there’s libRed that you can use

[09:07](#msg61c19963fd9244223e57efa3)https://github.com/red/docs/blob/master/en/libred.adoc

duskhorn:matrix.org

[09:08](#msg61c199714024f534f2cefcc8)Ohh thanks!

## Friday 31st December, 2021

ams02468

[18:38](#msg61cf4e17d143b14f83f4e18b)Happy New Year everyone, I hope you have a good year in perfect health with friends and family :)
