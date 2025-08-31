# Archived messages from: https://app.gitter.im/#/room/#red_red/welcome:gitter.im (https://app.gitter.im/#/room/!djuzrjVoKzmdqtWwQv:gitter.im)

## 6-Dec-2020

[10:24:04](#TSd8FF2qsYVPzljTjXXoYnsBt7RrsMbnHiF-rbD2JIA) <guibus (guibus)>:
@qtxie Thanks. Still got an error : Failed to load module "appmenu-gtk-module" but view is working

## 22-Dec-2020

[1:54:19](#XvuzOtlzFlUKqgyV8duesyLkmaBgkAHpsUyhjLqosPs) <greggirwin (Gregg Irwin)>:
Welcome @Slownite. Unfortunately Red is 32-bit only at this time. People use VMs if they're on Big Sur.

[1:55:59](#S7fjTKaB2uniM8l-c0YTdLge-CQJJTfRMmZRfW7Hzl8) <Slownite (Samuel .D)>:
@greggirwin ok thank you very much for your help!

[3:02:21](#NCUWQuVCc7A88asdcT59NE-JUl-O7zhxGrbPT9iJrEY) <greggirwin (Gregg Irwin)>:
Happy to help.

## 23-Dec-2020

[23:32:52](#GEKEhG5guDpmzSPlXv0O4xU810jpFok8JMBSzXPfZ7Y) <gtzip (gtzip)>:
Happy Holidays.

[23:33:18](#UEFEyh9d6qO3pjRPhzDTns4WhaOOKH0AQYLwo56Mlf0) <gtzip (gtzip)>:
May the final days of 2020 pass swiftly 

## 26-Dec-2020

[12:42:54](#DS5OMLK7zu1vlbesy8398cMlgBMM2my8EfMlVwcZ_iw) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
Hello. Please tell me how in the program can be access to the COM port (rs232)? Im want comunication whith Arduino. 

[20:03:24](#qINlzHfhILzMUoOVrkUfjdqE8xAO1XLnQpsgykc-QVo) <greggirwin (Gregg Irwin)>:
Ports are coming soon, with the full I/O work, but COM ports haven't been specifically discussed. R2 supported them, so you could start there to get some playtime in. Not saying Red will work exactly the same though. You can also seen some [GPIO R&D](https://www.red-lang.org/2019/07/gpio-port-for-raspberry-pi.html) done by @dockimbel last year.

[23:35:39](#G3xw0PQPDs4d9unDYqiwVi81jgzWS-e_1ogiGlcRupw) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
R2-Rebol 2? For the "Write-IO" / "read-io"function, the port must be open. Com COM port? What argument should be in the "open" function? It seemed to me that these functions are for working with port isernet connections, such as "http://site.com:80". Or do I need to open the device's system file ( "\\\. \ \ COM2 " or "COM2:" on Windows and "/dev/ttyusb " on Linux)?

## 27-Dec-2020

[0:06:56](#r2q4owZTIu-8J7ARWbJD1q_8OElAOokKgdBBJ-vLcMM) <greggirwin (Gregg Irwin)>:
I haven't used them in a long time, but did quite a bit many years ago. Here are a couple search hits:

[0:07:19](#xNuX6xWf1PfxeykMGtEWPtTG6zNyv2WGX7NrYGa4Mbg) <greggirwin (Gregg Irwin)>:
* I haven't used them in a long time, but did quite a bit many years ago. Here are a couple search hits:

- http://www.rebol.com/docs/changes-2-5.html#section-81
- https://codeconscious.com/rebol/rebol-net.html#SerialPorts

[0:08:22](#5a0vdeT6EG8iU113viMkxo1_MqqiSLJukt2VcCzBhqw) <greggirwin (Gregg Irwin)>:
You can spec the port either as a URL or with a block scheme. Once open, the standard port actions work normally. There might be a couple gotchas, but I don't remember right off.

[0:09:01](#LnyiGvy__aa24BaQrA5u9CdrztghscjgXSkgU4cqTA0) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
@greggirwin  Thank you very much

[0:22:23](#d3v8nhSDN9m8g9lX4an6zSE6m5tP-2nqRxDDbitKhXU) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
R2 dont see COM4 Ì†ΩÌ∏ü https://ibb.co/Y0HDsG5

[0:24:14](#xhhrWwWSAi2l-goSursL4zFrlX6cJj7F37FTxvn10sI) <greggirwin (Gregg Irwin)>:
Is it built in, or via a USB adapter?

[0:26:06](#lMbZFlKnmc_jE_WfwMcske8RcTtoZjfJNjvB7IInX70) <greggirwin (Gregg Irwin)>:
I believe I had to work around that issue at times, so it's possible.

[0:33:32](#D05gCgZj0sKt4-7bvhYginAFJjxSTHCDcAgKYWfGRUU) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
USB adapter.

[0:34:39](#NJLMCpUrCKCdZN1HelS6YEE-_aXUYsASnab5Ui-wqds) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
I will try.

[0:46:43](#DjnXkrjZaHmgm0djOHXPj9oVf3j3h9fZEb2kK6h81GY) <greggirwin (Gregg Irwin)>:
I'll post some notes to you privately, since it's not generally useful in Red right now.

## 29-Dec-2020

[17:36:59](#yIJ6wpRymvkxdx81vhU40to6lY1ZFztX-ADumyDRJpM) <jakubiszon (Jakub Z)>:
Hi. I have a fairly noob question https://stackoverflow.com/questions/65496326/how-do-i-set-an-icon-to-a-view-in-red-program

[17:45:00](#SmhBhfHyBXDSWZiIc3_bU3vvE2DA0S-9gEhmztFIJGU) <ne1uno (ne1uno)>:
I think windows ico needs to be below a minimum size too?

[17:45:58](#TNb50JnLbPFO4jLNDxK4ouidD4E06DTAi-OLuqtTgzI) <jakubiszon (Jakub Z)>:
the file itself is 766 bytes

[17:46:50](#CG5JfwXB3XgV0sxgEXXHUKClSgbo_yQqBN7UqOjwhcg) <jakubiszon (Jakub Z)>:
the file itself is 766 bytes

[17:48:23](#zsNWgDZUmtS14fE_WFfuqB4YcPIFph9s23hbtNfS5rA) <ne1uno (ne1uno)>:
may be only compiled too, can't recall

[17:49:29](#Vu-YgTwhBGQcBHtKO8y0F53vn-4UbaGHb-4mhPZM-LI) <jakubiszon (Jakub Z)>:
ok, I'll try compiling

[17:53:29](#NgVS1tVRgoXpAo3y9ftccMqM_V5AzOHbaHwwqa6E-vI) <jakubiszon (Jakub Z)>:
Yes, it actually worked when compiled and it does require `icon: %icon1.ico` syntax

[17:53:34](#EmEwDe6a6cp6Cw_iVdvbLOatqC7MryUO9a5_Ry3Kvdk) <jakubiszon (Jakub Z)>:
thanks!

[18:42:03](#76iYVLdtqxzGxCMwbx_M0flKdXGHRDVuw6S3gMqs6GA) <greggirwin (Gregg Irwin)>:
There shouldn't be a size limit for the icon. 

## 31-Dec-2020

[20:31:42](#WdbOkXdsI1PlkwFhn4kqpj2HYkIVUi2_0EnfYLCeuCA) <bkalef88_gitlab (Brock Kalef)>:
Let me just say Happy New Year to the Rebol/Red community as a whole.  I have 'known' some of you for over 17 and maybe as long as 20 years now.  And since coming back to Red have been helped out by some very talented new followers.  This community has always been very helpful and welcoming.  May 2021 be better for us all.  May we all see some success in our Red projects, and may Red and Red Lake see lots of progress and success this year.

[21:12:26](#hvGbaR9ss5T2pB08sflebollg-pIAKizdi4W8AzB_rw) <greggirwin (Gregg Irwin)>:
Thanks Brock, and Happy New Year to everyone!

[21:48:41](#YBm12-2_veDw5WOBUzSAPogNi9pMc6Mm7z9pTQlV-nQ) <toomasv>:
[![HNRY](https://toomasv.red/images/Misc/HNRY.gif)](https://toomasv.red/images/Misc/HNRY.gif)

[21:51:42](#LGmDBTWb08M97beUcri8UywEEbGOzk7Uya0i55-pWeI) <greggirwin (Gregg Irwin)>:
Woohoo! Somehow I knew this was coming. ;^)

[22:09:02](#BoHny1q6luckMhbSwdVzdImfXEU7YvBSdUwa7VZ_Jf0) <toomasv>:
 Ì†ΩÌ∏Æ

## 7-Jan-2021

[17:24:03](#JpvFYM8U5ONiLpbcUWf55Stvadxvd9sFpqLwxT9fQwA) <JohnBlood_gitlab (John Paul Wohlscheid)>:
Hi. I've been trying to learn how to program for a while, but always seem to get busy with something else. I just recently stumbled upon REBOL and then Red. Would Red be a good first language would you recommend learning something else first?

[17:52:33](#Vkk7nF0UIrKHoyuJ8D0i4pFUHz23rCj0uxi4iqHucuw) <Red-Beginner (Civan)>:
I'm not sure. Maybe python or lua would be better. There are less document on Red/Rebol for beginners.

[18:00:02](#AYjZ3k7IX04-fx6QsIwA1qZbhcTLP4qLUOGrOR5pRaE) <toomasv>:
@JohnBlood_gitlab Sure it is good for first language too, and it is probably easier to learn as first language than as tenth. :)

[18:01:29](#Udn5_q0dzg98-xZxvI1ulqpf9TUt2YK8KWNyFsHTgmE) <gltewalt (Greg T)>:
Rebol has plenty of tutorial material. 

[18:01:34](#j-56Q_RRZVw8_nnqoGA65h7xkksHvE1Xc_M9JzcbOiM) <gltewalt (Greg T)>:
http://business-programming.com/business_programming.html

[18:01:48](#hVlaApbrZIR0FDJT0Sf_BsCQP0Kle0nZq94a-MSV0EY) <gltewalt (Greg T)>:
https://easiestprogramminglanguage.com/easiest_programming_language.html

[18:04:50](#GrrdxhefP7EqMn7RiYu1rmuwFdmHwWNh3bVGI6uFMEw) <gltewalt (Greg T)>:
Red has a lot of people who are friendly and will try to help you along. If you decide to stick with programming you will end up learning about more than one language over the years

[18:28:53](#qEn8h5rYYaqrgERRpDxLayiClogRJ-62Kt9fftOgMcg) <gltewalt (Greg T)>:
Have you tried any languages, or just looked around?

[19:04:13](#Z9_yyDPm57PaA-O-yxVnYA-u0x1Eysqg6ee2bvFvP8I) <greggirwin (Gregg Irwin)>:
Welcome @JohnBlood_gitlab! It won't hurt you to try Red, but you should also try other languages. One of them may click in your head more than others. It also depends on your OS preference and what kind of programs you want to write. If you're on Windows and want to write GUI apps, I don't know what else comes close to Red. If you're on Mac, note that we're 32-bit only so won't run on Catalina. Older versions of OSX are fine.

If you try other languages first, don't let them turn you off of programming if you don't like them. Red is like BASIC or Logo from earlier days of computing, making it more accessible for exploration and learning. Other langs very much expect you to be, or want to be, a full time programmer. Not everyone needs to do that. It's a good thing to learn *something* about, and see if you like it.

A nice thing about Red is that you can just drop the exe on your system and you're good to go. Use the automated build, not the old "stable" version which is quite out of date for fixes and features now. 

The first time you run Red, it will compile a local console you can play in, so be a little patient. Startup should be instant after that.

[20:23:13](#sXCVZN_g6yIKt2GtQWVB4dfrLUeVMT_gxXv2xYQtnqY) <JohnBlood_gitlab (John Paul Wohlscheid)>:
> I'm not sure. Maybe python or lua would be better. 

I am working to learn Lua to make games with Love

[20:23:58](#AE8VJLcxpS4M4nonpRxfKIIlkbGf46BavmCaizylAdU) <JohnBlood_gitlab (John Paul Wohlscheid)>:
> Have you tried any languages, or just looked around?

I've looked at Ruby, Python, and BASIC.

[20:26:04](#N6bvJK2ByHPL5brqAzUTw-au_GBkn7pY6oWYmgET0PM) <JohnBlood_gitlab (John Paul Wohlscheid)>:
@greggirwin  I downloaded and ran the "stable" version. If I run the latest automated build, will it cause an issue?

[20:26:35](#TcvjI9BoGmCTZageChPsn6IGq5NsJ2hwulJnBNt5tdI) <JohnBlood_gitlab (John Paul Wohlscheid)>:
* > I'm not sure. Maybe python or lua would be better. 

@Red-Beginner  I am working to learn Lua to make games with Love

[20:27:02](#y1YXQzOlQx013vZQPy5cc6UMBrdp_P1lziE7T43xXsw) <JohnBlood_gitlab (John Paul Wohlscheid)>:
* > Have you tried any languages, or just looked around?

@gltewalt  I've looked at Ruby, Python, and BASIC.

[20:28:06](#8ew9KwH4mNBtV5KJ1rdTdMfxwRgOzGW0vte8eZUF6zY) <greggirwin (Gregg Irwin)>:
No issues at all. It should build you a new console and you're all set.

[20:28:29](#15-_8b5ElJynOIx8U7HkFWMYRDQjalFW1Bu4pay3x7k) <greggirwin (Gregg Irwin)>:
* No issues at all. It should build you a new console (in %Programdata/ on Windows) and you're all set.

[20:28:43](#lfMZ2c2MHElMiWbGOsWv_3aNo5tIx5K2SEgfzy3gPlg) <greggirwin (Gregg Irwin)>:
* No issues at all. It should build you a new console (in %Programdata/Red/ on Windows) and you're all set.

## 8-Jan-2021

[8:18:25](#qBEkv86WzbV-z8BTU2lPn-oi4GT7jAjQEpZYNtTR0LI) <planetsizecpu (Jose Luis)>:
Welcome @JohnBlood_gitlab hope you like programming & Red Ì†ΩÌ∏â

[18:51:00](#e1d_gYBMnetE3mSrrtVdiCd_NGoOWCSi0NmHMDMcYkc) <JohnBlood_gitlab (John Paul Wohlscheid)>:
@planetsizecpu Here's hoping

[19:32:24](#1Rjf3Bsb6zhWJ41J4QRUyHInJiwgDOUsUqJde8oN9Uo) <gltewalt (Greg T)>:
@JohnBlood_gitlab @JohnBlood_gitlab made a game with Red if youre interested in game making

[19:45:56](#AHqRszGksAw17D5hmubx_joR24wP9StshObt9qpqSDY) <greggirwin (Gregg Irwin)>:
I think @gltewalt means @planetsizecpu made a game. Gitter does that to me as well, selecting a ref I didn't want. I have to catch it frequently.

[19:46:39](#IsCgNNHQvR-mDmF4hm6LkCHAZkh69SAxAa4gJIvhLGA) <greggirwin (Gregg Irwin)>:
@planetsizecpu is your chat on that mainly in red/sandbox? And where can people download it if they want to play? I haven't in some time, sadly. :^(

[21:28:24](#vLKveM0THzjH1euU8AEO13J_8Bv0iG3va3E-xVVdk9o) <gltewalt (Greg T)>:
 Yes, I thought the second name was @planetsizecpu. oops

[21:29:08](#qq9igtSSgrjm3wZ5qI7jGYiIYcGaFcQxwnL1N3lL0XM) <gltewalt (Greg T)>:
https://github.com/planetsizecpu/Cave-In

## 9-Jan-2021

[13:40:15](#kZ-iE4GDdOfvGQJsXxSE8t7VdqSUmWgpO8v-Ki67LyM) <planetsizecpu (Jose Luis)>:
@gltewalt Thanks for be hands on! @greggirwin I do chat about the game on [gui-branch](https://gitter.im/red/red/gui-branch) and the code is ready on the link @gltewalt wrote Ì†ΩÌ±å

## 13-Jan-2021

[23:46:42](#HI2GgnmJ392GyON34h4GUB2FrnrbsK_jed9nlRXVY0o) <ams02468 (ams02468)>:
Does red language support email sending to smtp server?

## 14-Jan-2021

[0:47:27](#onLKwmy2f8MvCrJTEcjdpZSzgqTHME0FYH7GLLK3Oo4) <greggirwin (Gregg Irwin)>:
Not yet. That will come after full I/O and ports in 0.7.0.

[5:24:44](#SoL28AdIe09wNBKU4qzfhUNX6gk2UasQlyapp7QjUk4) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
Sorry for the off-topic question. Where is it possible to get/buy a license key (file license.key) for Rebol/SDK. on the site http://www.rebol.com/cgi-bin/feedback/post2.r is not responding. Where can I look/ask more? Google isn't helping.

[11:09:22](#RnEpmeJf-YTSOAtxU2M_d0gvJCOBcj2zLTPyjNfjrQQ) <rebolek (Boleslav B≈ôezovsk√Ω)>:
@Sergey_Vladivostok_gitlab I'm afraid it'ƒë not possible anymore.

[11:09:29](#aeQa0dhpgJYkd-HjBHd5_CVtYOqHxaHA_pcUKtfIAaE) <rebolek (Boleslav B≈ôezovsk√Ω)>:
* @Sergey_Vladivostok_gitlab I'm afraid it's not possible anymore.

[11:09:44](#-HDDfIL2AyUfOZYL1ooWH3GVpVs_yEg5HEgbH5JBEmg) <rebolek (Boleslav B≈ôezovsk√Ω)>:
What do you need it for?

[12:14:18](#nGljRlbS8ItUOUvY_Hdy03BDXsfT1wgTMwi_LK2-sV8) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
@rebolek many reasons, for example
1) I really like the technology, I want to "touch" it all.
2) Compile scripts
3) Use encryption (http://www.rebol.com/docs/encryption.html)
4) Perhaps I can solve the problem with access to sites via SSL3, for example
```  
>> read https://gitter.im/red/red/welcome
** Command Error: SSL Error: error: 14077410: SSL routines: SSL23_GET_SERVER_HELLO: sslv3 alert handshake failure
** Where: build-port
** Near: system / words / set-modes port / sub-port [secure: true]
>>
```

P.S. If could get some more code AltME, Rebol/IOS  etc. the sale of these products is no longer carried out, but they are of great academic interest, and can become a great textbook.



[13:04:03](#NEXr52Q6tvg_uwQfSRdJK_hq83tnfypcgikNufOs1Co) <rebolek (Boleslav B≈ôezovsk√Ω)>:
@Sergey_Vladivostok_gitlab 
1) I understand that :-)
2) If you mean Red scripts, you don't need SDK for compilation. Free Rebol is enough. I can give you the details, it's really easy. If you mean Rebol scripts, SDK doesn't really compile them, just bundles then together with an interpreter.
3) That's Rebol's encryption which was last updated about ~10 years ago, Red doesn't have all the stuff yet, but it's getting there.
4) Again, are you talking about Red or Rebol? Rebol hasn't been updated in ~10 years and SDK license won't help you with stuff that's newer than 2010 or so (TLS 1.x for example) . Rebol can't and won't deal with it, sorry. OTOH Red can, be it in the current version or with the comming full IO.

## 15-Jan-2021

[5:37:27](#ZhUamzb68-cyTJ0kv-bNV_Igwgl_BFv-K-bd8ybFee0) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
@rebolek Unfortunately, Red has not yet reached some of the Rebol2 capabilities that I need at the moment. It seems to me incorrect to talk about the obsolescence of technologies and the Rebol2 platform. About SSL - if Red is written in Rebol (I could be wrong), then theoretically i can take the required part and use it...

[7:07:51](#FnlHHbgPILfxm40taErfyyU4tQqHn8ZNJcv3Kq5G0K8) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Red is absolutly not written in Rebol. It works like that - Red gets compiled down to intermediate Red/System code. Then Rebol is used to compile it down to the native code for particular target platforms. The code is agnostic, which means you can use Win OS to compile down to Linux or OS-X.

[7:09:23](#r6OnW2AA0oQArUzlLUpsyxeU77Xgk83xR-hMqPZ0VJE) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Sure, it is kind of written in Rebol, but that absolutly does not mean, it shares any of the Rebol shortcomings. Simply put - Red has https, security is going to be done to modern / recent terms. You can't fix Rebol 2, as it is long time abandoned, not anymore updated, and closed source. So Rebolek is absolutly right with his remarks.

[7:10:40](#pvGsndCOrNNLbWCvBxxcC1WnMB2g5dyecFe9IOEYxaE) <rebolek (Boleslav B≈ôezovsk√Ω)>:
As @pekr  wrote, only Red's compiler is written in Rebol. Red's SSL is not dependent on Rebol in any way.



[7:10:55](#6xR32CdrGR6QcFuv9Ny85YYEjY5FaxK4FGTO15ktlk8) <rebolek (Boleslav B≈ôezovsk√Ω)>:
@Sergey_Vladivostok_gitlab what Rebol capabilities do you miss in Red?

[7:11:28](#D5Rgx-NO5q5e2lJODLPFLPcrQ_QAxf5TXx5KFRzSl_Y) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Is Red on par with R2? Well, not yet. The UI might have better foundation, security is better, for me, GUI console is better, what we miss is IO and related stuff - useful protocols as email, ftp, odbc, mysql, etc.. Looking at the state of IO, I would say that we might be close to being merged into mainline. Sure - can't say when it happens.

[7:44:28](#smY0DeAUF3-ju_QXzhJPQNvQ2y7hYREw_mBB86OnXRE) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
@rebolek IO ( https://gitter.im/red/red/welcome?at=5fe72fcbe7f693041f32079a )

@pekr Rebol2 is long time open source (https://github.com/rebol/rebol) on Apache License 2.0... Or im wrong?

[8:02:58](#_PFdzt-7crflW6YdGerWrx1zjMHTZ75_nwChseXTpmg) <rebolek (Boleslav B≈ôezovsk√Ω)>:
@Sergey_Vladivostok_gitlab I see. The IO branch is fortunately getting very usable so let's hope it will get merged soon.

[8:03:05](#D1qFzpWrLwhsc2IVcYqTyvx2JYiof94F3CKnO4ctuy0) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Rebol 3 is open source, not Rebol 2.

[8:07:44](#p65EHa9PV_0WKmhic-I-k7fITt6O_kobYv0-HyLZNo4) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
@rebolek Got it. Sorry, I misled the "Version: 2.101.0" in README

[8:08:19](#hdKD9B9_S5c_OakpObXpLQG_ziBLX9jQ56mH0iRWgnE) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Yeah, that was versioning for alpha releases, it started at 2.99 IIRC.

## 17-Jan-2021

[1:30:44](#j9hTJ8srICCKv5rZ_QNE7Y9Ld6uR2ICldiTVnDtPtGQ) <Slownite (Samuel .D)>:
Hi everybody, it‚Äôs a beginner question but how can you load a csv file in red? Thank you for your help

[1:41:31](#kGIM1Iv0tnY67X01CYk_uE8SdIzS9pPrifhBM5N1gFI) <dsunanda (dsunanda)>:
@Slownite Welcome! - Yes, you can use LOAD-CSV, eg
```
 data: load-csv %my-file.csv
```
Try help load-csv in the console to find the options  - eg if you need a non-standard field separators.
Here's loading a CSV file held in a string to a block, with ";" as field separator:
```
load-csv/with {a;b^/c;d} ";"
== [["a" "b"] ["c" "d"]]
```


[1:50:09](#g2Gqbf6h1lsE9A6XyxxOfv9UdYZweABGu5E9AKFWsOQ) <Slownite (Samuel .D)>:
Thank you! 

[1:52:03](#COdaLFAz_AvOQjDDVcpxFUPuDCE9cL4Q_d9dzSDSMHI) <dsunanda (dsunanda)>:
And there is some documentation on it - https://github.com/red/red/wiki/CSV-codec

[2:05:55](#0DfXj6RFyH9Mw6y1RXDgf4I4kyvcnyYVju0ZlnUEELk) <Slownite (Samuel .D)>:
thank you very much @dsunanda 

[2:50:35](#npKFeKyA71vbZS3lRVsMZwc9KhmBBTDAaKJtbMcWNO8) <greggirwin (Gregg Irwin)>:
You can also use `load`, and the codec will be applied automatically based on file extension. If you use a different extension, you can use `load/as`. The codec uses `load-csv` internally but doesn't support `file!` arguments directly. Just a small typo in @dsunanda's example.

[2:50:50](#bndN78jEWLiFsY3GOcVzgjJdxVRLHY7Am2JBbVFrBI4) <greggirwin (Gregg Irwin)>:
* You can use `load`, and the codec will be applied automatically based on file extension. If you use a different extension, you can use `load/as`. The codec uses `load-csv` internally but doesn't support `file!` arguments directly. Just a small typo in @dsunanda's example.

[2:51:43](#6CXEbpXYPdtoOfdlVkweKGjL1crk1h8N_c778dxuspc) <greggirwin (Gregg Irwin)>:
So `load %file.csv` is like doing `load-csv read %file.csv`

[15:58:33](#PfQGhPPELiMkoaVXti53gUafHzBrx3ATwHHCfEBPv64) <Slownite (Samuel .D)>:
Oh I see thank you!

## 19-Jan-2021

[20:39:07](#XBw13LDrwyprPDJEqDMpoIFd-iHt02PPnyOfmAA2T-Q) <GiuseppeChillemi (GiuseppeChillemi)>:
@Sergey_Vladivostok_gitlab I would also access Rebol SDK and IOS from very long time. I would like to learn from it and maybe, one day, do something similar in Red but I can't. 

[20:39:40](#9_qc6-VJWa8oyUHQszFBtGd3iKeMhOgW0dk8WPk7TUA) <GiuseppeChillemi (GiuseppeChillemi)>:
@toomasv 
> [![HNRY](https://toomasv.red/images/Misc/HNRY.gif)](https://toomasv.red/images/Misc/HNRY.gif)

I have not see it, nice, great!

## 20-Jan-2021

[4:19:41](#7bYf_biMRGhFLrPyiWy9GrlkwLI70vyEoBLLheSMP8M) <toomasv>:
:)

[15:00:18](#biuzt-cK6zRQkBi1Xyy_aM6XXMNL6T_bkXHBHXvduUw) <Slownite (Samuel .D)>:
Hi everybody, does Red have a function to write from blocks to csv (the opposite of load)? 

[15:06:23](#5mmmDoP3vTpz23JW2Dlo_7i55xMFTq367WVUqbhmqXw) <dsunanda (dsunanda)>:
@Slownite Yes - to get it as  a string, witg various formating options:
```
 to-csv/with [[1 2 3] [4 5 6]] tab
```
To save direct to a file with default options:
```
save/as %my-file.csv [[1 2 3] [4 5 6]] 'csv
```
use HELP TO-CVS to find all the options


[15:06:40](#VVzT8YD_xea_OvBOJMscDg8nrX_4-rf0MI8aPqJ7VYE) <dsunanda (dsunanda)>:
* @Slownite Yes - to get it as  a string, with various formating options:
```
 to-csv/with [[1 2 3] [4 5 6]] tab
```
To save direct to a file with default options:
```
save/as %my-file.csv [[1 2 3] [4 5 6]] 'csv
```
use HELP TO-CVS to find all the options


[15:07:06](#en072akYx0sAUvp9L2GYOWz0duGK6G6O77u01wxAh00) <Slownite (Samuel .D)>:
@dsunanda thank you very much !

[19:10:54](#fNA-BrjDa5Hnzgq59JWsXrOaxoYYfFn2LKsWwoVDscw) <greggirwin (Gregg Irwin)>:
If you use %.csv as the file extension, you don't even need `/as`.
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

## 21-Jan-2021

[2:38:17](#-YECPRG6GmEhgcLa0BV_aig6mjfh4jRTm36t3NKRBPk) <innitheblindsw (Christian Rod. Gut.)>:
Gr

[2:38:33](#ktU8508X-neEeafKcqN0_29gpaIYh3z9g2Lghzsx0ik) <innitheblindsw (Christian Rod. Gut.)>:
Greetings from Cuba

[2:53:48](#sdJautUSgpS4sO7VxruasFKAYwBB38fB7TPjKl0YWi4) <greggirwin (Gregg Irwin)>:
Welcome @innitheblindsw !

## 22-Jan-2021

[23:17:59](#JrgbXlgTvAcVV5berZZxi0D_yy9dGF2gtnsorgaBsUY) <Slownite (Samuel .D)>:
Hello everyone, I try to do an interface for drawing plot and other stuff, for this I would like to create a window with a base of the size of the window and I want it to be able to resize the base when the window resize but I didn't find any way to programmatically have the size of the window, is it possible to have it programmatically?

[23:29:59](#Ozwng-I3JGxIwi0_EfS5_u0GxK1AKoDGYXJcM0yHrTA) <greggirwin (Gregg Irwin)>:
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

[23:32:52](#gcOl9gJt_-uF2SK8rzOOHhaMqbyGF7s7NlDBku6QFgg) <Slownite (Samuel .D)>:
oh ok thank you very much !

[23:39:21](#CorYmZ8RtA7JMXrwkloGR_ObuL4FtN136WehgFESzHc) <greggirwin (Gregg Irwin)>:
You bet. https://github.com/red/docs/blob/master/en/view.adoc#event-names lists all the events. For windows rather than faces, it's just a bit more involved to set up the actors.

## 23-Jan-2021

[10:16:47](#i1sdwtWqPghQaGY1Vv8kaVKFLqNwrqs2R0shebU_xKY) <tinulac-leinad (Tinulac)>:
Hi All, 
3 question on this code that I cant figure the way to resolve...
questions in the code after  ;<<<<<<<<<<<<<<<<<<<<<<
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
Thanks again if you have some light for me  Ì†ΩÌ∏â

[20:52:04](#xU6c-xk2Sv4x0uzIU_-MZ7n666Upi0hnsdJMXbiCqVs) <tinulac-leinad (Tinulac)>:
Hi All, 
3 question on this code that I cant figure the way to resolve...
questions in the code after  ;<<<<<<<<<<<<<<<<<<<<<<
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
Thanks again if you have some light for me  Ì†ΩÌ∏â

[21:25:04](#qifqdJNctejh_r-v9xVzUgGt0FGE-GhNTNjhtDd1haE) <tinulac-leinad (Tinulac)>:
about my previous post 
For my first question: for each clic on an Item in the list  the action is executed 2 times ? Curious ?
For the question 2 I get some result if I use draw replacing 
the-score: image ns to-file path 
By
do [the-score: base 585x400 draw [image img]] 
and in the tp panel the-score: image 200x200 %music.png  changed with the-score: base 585x400 draw [image img]
That work but ...  
I hope I have to deal with draw and rate function ... 


The question 3 is more enigmatic for me...  why my key events are not picked ?

Apologies for my ... bad english.


[21:31:26](#PUav6cY7S9iwCKOBBCtHj5DoCvSqpXqWRfSyVJ_Lb4E) <tinulac-leinad (Tinulac)>:
* about my previous post 
For my first question: for each clic on an Item in the list  the action is executed 2 times ? Curious ?
For the question 2 I get some result if I use draw replacing 
the-score: image ns to-file path 
By
do [the-score: base 585x400 draw [image img]] 
and in the tp panel the-score: image 200x200 %music.png  changed with the-score: base 585x400 draw [image img]
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

The question 3 is more enigmatic for me...  why my key events are not picked ?

Apologies for my ... bad English.


[23:16:59](#juS8VJsNWD0r-C-AaHQDJkcU_Nubxiq2oZOWLOex-NI) <greggirwin (Gregg Irwin)>:
@tinulac-leinad no need to apologize for your English. But with references to files we don't have, we can't run your code to help debug. If you put it all in a gist, or better yet reduce the code to a minimum example, you may get more help.

[23:20:40](#sxKEqzTxho6Okjlh1tYRAHs6QTMPFFjpik8zh45CEBM) <greggirwin (Gregg Irwin)>:
I can remove the missing image facet, making it just a color, but then I still can't quit the app.

[23:25:18](#7IgxwC-dJvT_xst-ADqphgxNy7LsUyF6sTIzEziTe7k) <greggirwin (Gregg Irwin)>:
I also don't see *any* output in the console when interacting with it.

[23:27:17](#AnopQJgo99ick-nH2YW3iLJwoVC0Z3a1g9U0pVltgzU) <greggirwin (Gregg Irwin)>:
Ah, because you're loading those files in the list and they don't exist for me. This is another case of errors being silently eaten in View. https://github.com/red/red/issues/4784

## 24-Jan-2021

[0:46:03](#fa_OIiFAZuFfebn1fT9eee9UUWhtMMXRbdmwFqx81jI) <tinulac-leinad (Tinulac)>:
@greggirwin Oh, yes, sorry, it is just a a part of my code and it can(t run ....
I resolved  a part of my problems with :
  tp: tab-panel bold 585x400 [
    "partition " [
      the-score: box 585x400 draw [] rate 25
      on-time [update-the-score]
		]
	]
.......
update-the-score: func [] [     
  the-score/draw: [image  img]
]
selection in the list give an image in the-score : perfect.
Slowly, thing take a place in my old poor head :)
the more curious thing for me now i the raison the on -key event don't picked, I try to reproduce it in a small sample but unfortunately all my small samples works fine....
Your help and kindness is really  appreciate, it is an encouragement to continue learning Red and at each step I am cmnforted that the solution is always concise and clear...With some efforts and doubts at learning time... 


[2:51:28](#Taq6nIEinRlPTjCzuen7C0ANpJtotYy5gnUn3JcS8uE) <greggirwin (Gregg Irwin)>:
Glad you got it working. :+1:

[19:48:16](#l8wbleWuACyR3wPfF3CHAFsp-Jnvou7tjbmLgoKU4pw) <tinulac-leinad (Tinulac)>:
On-key... curious thing (for me Ì†ΩÌ∏â )
a simplified code (can run with no extra dependencies)
The first code works fine, the second none 
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

                ];-[
                 ;- path: to-file rejoin [D_TMP pick face/data face/selected]
                 ;- img: to-image load path
                 ;- ns: reduce [new-size 585x400 img/size]
                 ;- prin ns prin " <<< " print img/size  
                 ;- img: image ns to-file rejoin [D_TMP pick face/data face/selected]
                ;-]

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
      ;abc-to-pdf request-file/title/file/filter
      ;"Select ABC Files "
      Ì†ΩÌ∏É_SOURCE_ABC_FILES
      ;["ABC Files " "*.abc"]
    ]
    if event/picked = 'incipit-pdf [
      print "incipit selected"
      ; incipit-abc-file request-file/title/file/filter
      ;  "Select Abc File"
      ;  rejoin [D_SOURCE_ABC_FILES %*.*]
      ;  ["ABC Files " "*.abc"]
    ]
    if event/picked = 'about-help [
        print "About seleted"
    ]
    if event/picked = 'kwit [
      ;save-data
      quit
    ]
  ]
]
view w
```
And the same code hit just some adds in the w: layout part run fin but "on-key" does nothing and no error
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
      ;abc-to-pdf request-file/title/file/filter
      ;"Select ABC Files "
      Ì†ΩÌ∏É_SOURCE_ABC_FILES
      ;["ABC Files " "*.abc"]
    ]
    if event/picked = 'incipit-pdf [
      print "incipit selected"
      ; incipit-abc-file request-file/title/file/filter
      ;  "Select Abc File"
      ;  rejoin [D_SOURCE_ABC_FILES %*.*]
      ;  ["ABC Files " "*.abc"]
    ]
    if event/picked = 'about-help [
        print "About seleted"
    ]
    if event/picked = 'kwit [
      ;save-data
      quit
    ]
  ]
]
view w
```


[19:52:41](#3DIcN06PIfO-lOzDfokjz2Kn-6Chsxd10aJdg9CwylY) <tinulac-leinad (Tinulac)>:
* On-key... curious thing (for me ;) )
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


[20:08:26](#WFZwWHUR8os1io3PTZIKae6wpriC5r3IaMyD3UOAdxo) <tinulac-leinad (Tinulac)>:
@tinulac-leinad  @greggirwin 
oh ! is it impossible to have an actor for keyboard events without an editable element in the layout ?

## 25-Jan-2021

[16:40:59](#d_IbBAwc4F0vSp-lR7jIEsJeIxw9NpFTS9Mgg9F7UZk) <Slownite (Samuel .D)>:
Hi everybody, I would like to display the content of a csv file in a table in red GUI system how can I do that? thank you for your help

[16:43:52](#6Er3eqhz6WCLpqS2V0caZY3HT5L6365vGqLulbp5Mz8) <greggirwin (Gregg Irwin)>:
We don't have a table/grid style yet. It's a big cross-platform design space. :^\ But others can probably jump in and point you to experiments done with read-only displays, using `draw`.

[16:45:08](#yEO4kpkM7lPzu8TieI5DmYg6uTXA3VXG3xaAehb2LXM) <Slownite (Samuel .D)>:
ok thank you @greggirwin ! 

[18:05:55](#NIg54457VOxRuKuMO7MMU6gV_lDawvb-F2ZQ-ycphQY) <tinulac-leinad (Tinulac)>:
Hello, 
I have create a script close to  two thong, key events and change one image from buttons.
The script use draw ... rate to refresh the image.
All works but: 
- the  key event need a mall area that keep focused : ok but is there a better solution ?
- My resizing function works but I cant use the pair size tu resize the image if I use draw ... rate
The short and commented script that need only 3 of your images in the same directory to run i here.
https://gist.github.com/tinulac-leinad/0084a4ef6eb20e605b2b5e30fe218d96
Thanks for your help,
Cordialy,
Daniel



[18:18:57](#09b5O6Jnc9IDvwNkbAGusRSwGlLtjwQR45v_lBwpDvk) <greggirwin (Gregg Irwin)>:
@tinulac-leinad I had to fix some typos to get your code from yesterday to run, but then it handles `on-key` just fine.
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

[18:21:52](#zZYIMsgnP-VfsUdNE3E_hLubG1NPU_uyDTFbKRm_Ygc) <greggirwin (Gregg Irwin)>:
Your latest question I'll have to make time for, if nobody else answers.

[19:31:31](#U7kPwEV5bIYeVv_Xj1Y-E3Lgl_voE1rlZTFzTFpwL_8) <toomasv>:
Your latest question I'll have to make time for, if nobody else answers.

[19:36:12](#OhmYoBnmHg3jX6VVmjUqPxeyzhaBeMEoYS7B7ZWHr1o) <tinulac-leinad (Tinulac)>:
@greggirwin Thanks for your time Gegg,
My last post is there because I have solved some problems, and... more precise question. I have rewrite my sample code in a gist  with a lot of comments, to explain around the code.
So, it's realy a good Idea to isolate the code. Sometime, the errors message produced by the interpreter are actualy not alway very helpful and sometime  there is no message at all Ì†ΩÌ∏â


[19:39:24](#Nt8o5lHO6M3_lsMEkEsL5sdGsnmgkk-Sk2FmMaaU6e8) <tinulac-leinad (Tinulac)>:
* @greggirwin Thanks for your time Gegg,
My last post is there because I have solved some problems, and... more precise question. I have rewrite my sample code in a gist  with a lot of comments, to explain around the code.
So, it's realy a good Idea to isolate the code. Sometime, the errors message produced by the interpreter are actualy not alway very helpful and sometime  there is no message at all ;)
I don't need a quick answer for this last post, I can work in may others parts of the small app  I am writing to lean Red. 
Thanks for help.
Daniel 

[19:50:56](#aGaz6a3Gk1PNfPr8NxWQSJbGGXpQe6lGp5Q0M_a8IwM) <tinulac-leinad (Tinulac)>:
@greggirwin Ho, yes, I want now to explore if i can solve better my two panes , list and liked image with react.. I work from the code in my Gist https://gist.github.com/tinulac-leinad/0084a4ef6eb20e605b2b5e30fe218d96 and post an update if i find a better solution.... 

[21:24:15](#dhGtcwsH6KgDub-3r2uBjZnfFLcL34kXQttq_3HlyfA) <tinulac-leinad (Tinulac)>:
> @greggirwin Ho, yes, I want now to explore if i can solve better my two panes , list and liked image with react.. I work from the code in my Gist https://gist.github.com/tinulac-leinad/0084a4ef6eb20e605b2b5e30fe218d96 and post an update if i find a better solution.... 

Finaly, not a good idea...

## 3-Feb-2021

[12:29:51](#ErDZggHBBSyYkwjSRptwhXYv6PVY7OS32EPisd3cmz8) <planetsizecpu (Jose Luis)>:
These days @ykprog  as done some improvements in my [forms](https://github.com/planetsizecpu/forms)  app just while he learn Red lang, now it is credited as contributor, so THX and welcome!

[12:30:20](#iRRbwRGXF9EpEZDoB1nf0d3Z81Z7fyXeApZGbjr5Ubc) <planetsizecpu (Jose Luis)>:
[![formstest01.gif](https://files.gitter.im/570387cd187bb6f0eaddec47/P7YS/thumb/formstest01.gif)](https://files.gitter.im/570387cd187bb6f0eaddec47/P7YS/formstest01.gif)

[19:24:37](#NKenKiIRhst34t4IrdEkp4HucUP1YfAeD7au-c2JAaY) <greggirwin (Gregg Irwin)>:
Nice! Thanks to both of you.

[21:47:27](#mKj82wxPazSsWqOoDuxmS2XedC3GJFSLKdjtbP1wdP8) <ldci (Fran√ßois Jouen)>:
@planetsizecpu interesting code but a lot of problems with macOS

[22:14:39](#xnLxnBsOuwV47ggLJeDNZ88YYRbQynhUJ8qDHvDNB2s) <planetsizecpu (Jose Luis)>:
@ldci Unfortunately I don't have a Mac machine for testing Ì†ΩÌ∏î

[22:59:56](#sB_Hc6UjsLjpHKcwNogCDvW9F84_P98gLEIwOyII8hg) <ldci (Fran√ßois Jouen)>:
@planetsizecpu Don‚Äôt worry.If I had time I‚Äôll check for OSX

## 5-Feb-2021

[14:47:53](#uvCUQoNpjlcGOX0BUNyXv-pXGXWZB-kasbv__aDE6wM) <Slownite (Samuel .D)>:
Hi everybody, I want to use Red for data science task (visualization, preprocessing and model), I would like to know, if there is some existing libraries to do these task in Red? If there isn‚Äôt I will be glad to try to build some of them !

[16:42:44](#nX63e71ktSvh7N2ZxdwRNDch8QHdNxOhndYmF00LaMw) <ldci (Fran√ßois Jouen)>:
@Slownite You‚Äôre welcome for developing such tools :)

[19:18:06](#BuqJWxKK0gtm1u23UT7hVuktOqTPwG_K9PKaGUV793E) <greggirwin (Gregg Irwin)>:
@Slownite it would be great to have someone in that area start on ideas. Thanks! Of course, you can come here and we can help with the general Red side, help with design ideas from a Red perspective, etc.

[19:18:47](#ppsZgUqQ0L2nrDMctofT8A8CrEN21d9smcdb4RwJGFU) <Slownite (Samuel .D)>:
Thank you very much!

[19:26:31](#Z8qdEtGAdxugC3YL53yoLl7YlRO5-h2u1tElk5qGXrk) <greggirwin (Gregg Irwin)>:
This could help ignite some projects we have back burnered as well. Like `[split HOF aggregators]`.

## 8-Feb-2021

[1:57:49](#mj7farwewFm-XF93WDON1jjez32FuDOydu-J7n90n-4) <15926222352 (redsea)>:
This could help ignite some projects we have back burnered as well. Like `[split HOF aggregators]`.

[9:54:48](#eR-bwGmgp0dwOODuJPiHN6sIdIULi-83ykL1rAL6du8) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
Guys, is Windows XP no longer supported? Red-19apr19....exe works great, but red-05-Feb-21....exe first required d3d11.dll, and then gives an error in gui-console-2021-2-5-378.exe - "procedure entry point _except_handler4_common not found in library msvcrt.dll (version 7.0.2600.5512)  What are the minimum system requirements for the future Red v 1.0? 

[10:03:07](#y-xlB4B_GsGrUd-su4yUqM6zfgiuqJHqq-ifXiKPJk8) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Direct2D branch was merged into master so for Red/View, WinXP is not supported anymore as D2D needs W7 at least (or maybe Vista). Non-View version should work I guess.

[10:07:48](#V1lyKKkhdHk8H4zx9vSzMHDG_XPVccZ1zuGAXeZriT8) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
@rebolek But there is a GDI+ fallback IIRC. But even then, I think that WindowsXP support was oficially abandoned.

[10:09:09](#jjuj1kVw43PVlWqr1vJrpl_wdnaUgTRMUAXoawTjo0g) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Guys, if we concentrate upon supporting 20 years old system, it is going to slow us down .... not sure how much work would it be to make GDI+ version to work with XP. @qtxie will know for sure, but most probably - "the case is closed" ....

[10:10:14](#wGT-JJxd2YAGOqX6mR8KkoBBktssAldYFySwDtBQAPQ) <rebolek (Boleslav B≈ôezovsk√Ω)>:
I believe if someone really needs it they can maintain their own fork.

[10:31:52](#PWlvUVGXNdO_3W1xG4HuerSAZDqfE7u29DZaIJyyQsA) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
@rebolek Are there separate "core" and "view" versions of Red? The one that downloading from red-lang.org gives an error. D3d11.dll I shoved (ver 7.0.6002.18107 work in XP), but what to do with msvcrt.dll I don‚Äôt know Ì†ΩÌ∏ü  About fork - not everyone can make their own clothes from wool, their medicines from herbs, their own fork of the programming language from source :) Although the presence of such a possibility is a huge plus. 

 @pekr if "closed", then "closed". For now, I'm using the old version. 

[10:40:37](#jlq6GhlUxQ75zP5LEiTuRFBE-DE3iIP0x9vhHogR-UA) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
I don't have official answer to that, just from what I remember. Don't even remember, when that cut happened exactly and how much is missing in that regards ....

[10:42:08](#cMINXPsmje48nJgIV0RwCmqtO9dY8nGjPIK_1worSlI) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
Progress - I understand ... 

[10:49:20](#iUfQ-Il2iW1SRyeJEmpM4nc7D7XvrBmqqOAyL26D7Uk) <rebolek (Boleslav B≈ôezovsk√Ω)>:
@Sergey_Vladivostok_gitlab You need to compile it yourself, which is really easy.

[10:49:48](#ajXNwy58nPxXqGsyCdjndBcmukgM30D9AckXuVgqNrM) <rebolek (Boleslav B≈ôezovsk√Ω)>:
If you need help with compiling, just let me know.

[10:54:52](#a_zagvTpylFX2XDC6SmUoI5QgBRJ3JWF2e2tONyr0Bw) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
@rebolek Thank you very much for your desire to help. I think a simple compile will not be enough to disable/replace functions that are missing in the operating system, otherwise the support of old systems would not be so expensive. 

[10:56:34](#DKCe8O4LOiQaVzEA4w12cJ1S1hw41COnHH5zAYgLy0A) <rebolek (Boleslav B≈ôezovsk√Ω)>:
D2D is required only for View functionaity. So if you don't need GUI, you can compile a version that I believe would work on XP. If you need GUI than of course it won't help.

[11:00:33](#httAddXQ9laC9CtPgefqcK714WyTL3mbpmD68rigdJQ) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
Got it. Thanks. When I get together, I will definitely stick with questions. You allowed! :) 

[11:01:10](#tyjSJhb8KxNq6j246slKZYZ6MnVDJWokCk9zJtpg28c) <rebolek (Boleslav B≈ôezovsk√Ω)>:
No problem :-)

[19:45:07](#hZIARdM71kiIy_IunGpz7P-xhGIUzJly1kS-l2zN180) <greggirwin (Gregg Irwin)>:
These are always hard calls. MS officially stopped supporting it 7 years ago, including things like security updates. It's less of a target now, but it also means more and more effort goes into working around issues, or holding back new features modern OSs offer.  But this is also the benefit of FOSS, as we look forward. If you come to depend on Red, especially as a business, and we stop supporting Win10 in 15 years, you aren't stuck. You take that code base and can still fix any bugs that might affect you. True, you may not get new features, but that's where things like paid support come into play.

## 9-Feb-2021

[9:26:23](#5SdEnpvFz5N3AWgTrNpQFyd1IZCa9W-oscK8hq1XXzU) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
I think this is a topic for a philosophical discussion. You can write a program in tens of kilobytes, compile an executable file for hundreds of kilobytes and ... require libraries in gigobytes to execute it. Gradually DirectX, dotNET, Unity3D, etc. and then the minimum PC requirements will increase, following the minimum OS requirements ...
Sorry for off-topic.
Now on the subject - ANSI Escape Codes unsupported? I would like to set the cursor position, like print "^ [[20; 40HCenter!" 

[9:30:40](#Dj6KpUvnpCeStL99WfwYcV1H6z7xTD9y9Ill3Q-MH5o) <rebolek (Boleslav B≈ôezovsk√Ω)>:
In GUI console? Unfortunately no. IIRC they were expected to come with console plugins but console plugins aren't here yet. The of course work fine on Linux and Mac terminal versions.

[14:23:50](#789Ryh3pddbrKhe4tJYquJ-ksuANyCogLoVBGuwxwL0) <Slownite (Samuel .D)>:
Hi everybody,  I try to write an installer/launcher
does somebody have an example of one wrote in red?

[19:22:03](#6NRfRBClVZ5tnfY0arKvhwLdkvGq1UZWVGdJYIl9QTA) <mxdpeep-5d0c90fcd73408ce4fc422db>:
@rebolek @greggirwin howdy :)

[20:12:00](#DoSUXoOI58y6L70z-u-e2k7Nbyv27ksLm63XwxJL0HE) <greggirwin (Gregg Irwin)>:
@Sergey_Vladivostok_gitlab time marches on, requirements increase, but let's still use ANSI escapes. ;^)

@Slownite I did, in Rebol, many years ago. It's a big task.

Welcome @mxdpeep !

[21:39:58](#Ce_mF-hDwhbCif1VstLRTNGdPFC4UvG_bAWTCl3R8S4) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
@greggirwin Exactly! Time passes, and we still use the round wheel, alphabet letters and the "MOV" command in the assembler ... Urgently throw away everything old and make new, youthful? :) Looking at the world around me, I sometimes notice regression and degradation where someone sees progress. I may be mistaken, but others do not lag behind me :) 
P.S. C:\WINDOWS\System32\ansi.sys - Microsoft Windows [Version 10.0.10240]

## 10-Feb-2021

[12:08:55](#a9OmdNHL3jIMkdpeBA-nVcuMjKbphQ3Yp5XazeYY4LM) <rebolek (Boleslav B≈ôezovsk√Ω)>:
@mxdpeep welcome :)

[13:05:37](#lu7s-5OCmyjFGMLr21av294Ch6GT2GmFvt3KFPzJbSo) <planetsizecpu (Jose Luis)>:
Welcome @mxdpeep 

## 12-Feb-2021

[23:42:00](#m4WGLqIaPYHtHbG3PppwF3iYWMvRB9N0ZlzinBNiVlI) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
how can the number of letters be counted as a result of the work of the function "source"?
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

[23:43:36](#Wbm_oBHWIFNRQnLGHXdWhjQq7eIiqWkguavcCi6nFNU) <greggirwin (Gregg Irwin)>:
10?

`print length? trim/all mold/only [source print]`

[23:43:37](#mEFqR-7mQR9fjmX-1BETPKH9waFnE-B21wpu4aW9v8c) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
* how can the number of words/letters be counted as a result of the work of the function "source"?
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

[23:44:38](#rj4tLce34yRfZlPVcEVIR11bj4ZpFn9NTKwK5UsySMA) <greggirwin (Gregg Irwin)>:
Ah, I see what you mean now.

[23:46:13](#scTeL4VQT2IZvPFQ7dIDHia1LIm-5GIIJTgbhoeftx8) <greggirwin (Gregg Irwin)>:
The key here is to do `source source` so you can see how it works. It's an interactive function, so always prints and doesn't return a value, so the console output is cleaner.

[23:47:12](#WKLvGVw1v_x0u8te06CHN6e40C8RkCq-yDQZTx5x79M) <greggirwin (Gregg Irwin)>:
But you can take the inner core of it and reuse it for your own function that returns the result as a string, then parse that.

[23:56:58](#wGOWaRxXoh-QvW54EZAgag128dFkfk3O227vanywV_U) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
Got it. Thank. Is it impossible to redirect the result of the print command to a variable for subsequent parsing? If I reassign the "print" with my function (print: func [...]), will it be called, including from the "source"?  And can i send word from program to function "ask"? (Emulited enter from user)

[23:59:33](#m_q41L8dFr0gEwx1gSxHr6WaXIlevOlSRM0tOhRIkvY) <dsunanda (dsunanda)>:
You can adapt SOURCE like this (creating a function X):
```
x: mold get 'source replace/all x "print" "reduce" x: first reduce load x
x print
== ["PRINT" "is" "a native!" "value, so source is not available."]
```
End result: response from SOURCE in a block

## 13-Feb-2021

[0:01:08](#0U3acZV8_AZM8zALij4a_LdnocXcW_-BbMCRxyx0VzI) <greggirwin (Gregg Irwin)>:
@Sergey_Vladivostok_gitlab the best way to learn is to try it. The worst thing that happens is that you mess up a console session and start a new one. :^)

[0:16:12](#MFQhg_P9udcIxaaQmZ98PQpmNGo1nnLEvr9PYW7T19o) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
 @dsunanda Am...
```
>> length? x print
== 4
>> length? x source
== 2
```
Probably more correct to say what exactly I plan to implement. I am trying to write a keyboard treining, but so that a person does not type incomprehensible text, I want to display it as the source code required for typing. So that he, along with the skill of speed dialing, immediately gets used to the syntax of a wonderful programming language :) Accordingly, I try to get the source code in the form of a string/letters.

 @greggirwin I'm trying. Slowly reading the documentation with the translator and trying to figure out the syntax :) 

[0:18:43](#W9_rx5UxRRgkZt2T9I0UXHjib5VE70x6BLsIolT96aU) <dsunanda (dsunanda)>:
What X / SOURCE has returned is a block of 4 strings. To get the words you wanted originally:
```
split form x print " "
eg:
length? split form x print " "
== 10
```

[0:20:21](#mLeEFhBW0-4ZfRL32smHjZrhWp_B-LDYaJpcW3i8Rrk) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
@dsunanda got it. Thank!

[17:11:18](#uo_RkXrsFf6vsdlBtvlitWFtmiVw-AgyjQtUVN4N_G8) <Slownite (Samuel .D)>:
Hi everybody, is it possible to use pair! on float coordonate for example 2.8 and 4.5 and have this result 2.8x4.5 and not 2x4?

[17:15:46](#Z2UOs8W9iX6i5rlI8BGFTa8-qvaXGxABvi2IbsEmzsM) <ldci (Fran√ßois Jouen)>:
@Slownite : as-pair  makes an integer transform when creating a pair datatype. 

[17:19:38](#wGTvWr4fwrsiFRfzw5byd8QWEQLztXEFoDpRZSL45nY) <Slownite (Samuel .D)>:
@ldci : So there is no way to have float coordonate using pair! datatype?

[17:21:35](#b8oZlH_mXHQRVB358wSvkYGUDGhh1Bn7C2DCObfxr_U) <ldci (Fran√ßois Jouen)>:
@Slownite you can create an object for this purpose
```
myPair: object [x:0.0 y:0.0]

[17:31:17](#f_5QUgj5jErDjUYkUMt51Z1mZ9M-lRMBaln-udc4IBc) <Slownite (Samuel .D)>:
@ldci : I see, I thought about it but can I use this new object with a draw command?

[17:36:50](#j9h07YxTTdR1lV5D4ZwLxMtztDxjNPOedwGiY_vnbA4) <ldci (Fran√ßois Jouen)>:
I suppose you want draw lines or similar splines: they require pair as coordinates since screen cordinates are integer:) 

[17:37:56](#7RmD2dQIHGdWPSjBslekQTxaMBhH9LVIEQhQLmLRrJ0) <Slownite (Samuel .D)>:
Oh yes I didn't think about that thank you very much!

[17:40:10](#aF20ZviaDAjToaZ4QHubH5dZEnJShNX7-VOX2loWoZ8) <ldci (Fran√ßois Jouen)>:
you‚Äôre welcome. in redCV we can use float matrices for accurate computation, but in final we need integer for a correct rendering on display

[17:41:33](#vlhn_7E_UGmos2WFHPuYvMXGpYp_hyAN7-5Xyh3HyZM) <Slownite (Samuel .D)>:
I will take a look ! :)

[19:51:49](#sD20eQZPHPtIjQ07ZUBTGoMLEDu7VLte5QGu9b-GA6w) <greggirwin (Gregg Irwin)>:
Float support in pairs is a design possibility. It comes up a lot. One of the main issues is that they look really ugly. We have to weigh how important that is against the value they bring.

## 27-Feb-2021

[21:13:42](#hnJLAY-BPNHRgeHHzxLIWuADtdP6wQL-8_4aTKN6xxk) <Slownite (Samuel .D)>:
Hi everybody, can I control the mouse on windows and linux with a red script?

## 28-Feb-2021

[1:03:10](#vUYaAzUoPuR4ztGb_MQ5lGdDcOYCmyLqoaNopChJVqg) <GiuseppeChillemi (GiuseppeChillemi)>:
Do you want to move it via script?

[1:11:43](#Z7XSVbZ7k4LxgGkoXLgGlzDOsiMPhYq7M1rtIN1C6o4) <Slownite (Samuel .D)>:
Yes!

[14:09:49](#fT2okJK0OMbdDBlJn5VR9vUBs6pDlOOUC1Zr1mj1XC0) <Respectech (Respectech)>:
You can. On Windows, a DLL package like AutoIt is a good option. I believe there are similar ways to do it on Linux.

[14:44:48](#yxHB_kWYeSRIcTCBetYuyu8AUH3nAV2Bo_bDbjpCGxY) <toomasv>:
You can use draw's matrix to **place** things with sub-pixel accuracy:
```
view [
   b: box 300x300 draw [matrix [1 0 0 1 0 0] box 1x1 29x29] 
   slider 16x290 data 100% on-change [b/draw/matrix/6: b/size/y * (d: 100% - face/data) - (30 * d)] return 
   slider 290x16 data 0% on-change [b/draw/matrix/5: b/size/x * (d: face/data) - (30 * d)]
]
```
But this cannot be used in shapes' definitions.

[14:47:00](#SleXaE1WlooxJOwYVvnuwIrBj26ee0lfjxueKEVq_Lo) <toomasv>:
* @Slownite  You can use draw's matrix to **place** things with sub-pixel accuracy:
```
view [
   b: box 300x300 draw [matrix [1 0 0 1 0 0] box 1x1 29x29] 
   slider 16x290 data 100% on-change [b/draw/matrix/6: b/size/y * (d: 100% - face/data) - (30 * d)] return 
   slider 290x16 data 0% on-change [b/draw/matrix/5: b/size/x * (d: face/data) - (30 * d)]
]
```
But this cannot be used in shapes' definitions.

[14:52:28](#mgMr0wwt07pVASqK4uf9cBeOUdkDL5U09mWiovuWFE8) <toomasv>:
To move it alone among other things, use `push`:
```
view [
   b: box 300x300 draw [push [m: matrix [1 0 0 1 0 0] box 1x1 29x29] circle 100x100 20] 
   slider 16x290 data 100% on-change [m/matrix/6: b/size/y * (d: 100% - face/data) - (30 * d)] return 
   slider 290x16 data 0% on-change [m/matrix/5: b/size/x * (d: face/data) - (30 * d)]
]
```

[15:16:46](#STFlCkU8FyCRF57Lp6bvXLQjO6jQGzm5sYWr7QJyoN0) <Slownite (Samuel .D)>:
Ok thank you I will try !

[17:11:29](#Pw6zZZ7RwvQwYPAiZL28vNnqrZSsFx5_KC3GOWyr65Y) <toomasv>:
:+1: 

## 7-Apr-2021

[15:44:30](#gg6e91hlsOK3t5ef-YE9IZxOkBUoAtRb4z2WQf_bgLo) <ElCarvoOficial_twitter (El Carvo Ì†ºÌ∑®Ì†ºÌ∑∫)>:
Hi Ì†ΩÌπãÌ†ºÌøª‚Äç‚ôÇÔ∏è

[15:45:13](#2lJhBP1sveUZLd5qQWIZsZougN0NTV5JCL9epzUFAXs) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Hi!

[15:46:37](#EOXvvjOEgHOGeIUbpSM0vutuJ8tgCw6ucRlFG_sQAQQ) <rebolek (Boleslav B≈ôezovsk√Ω)>:
@ElCarvoOficial_twitter feel free to ask any question here, me and others are glad to help you. 

## 9-Apr-2021

[8:19:51](#QMuYtBqLTa8JWl3hqbeZjGsSCkM94KCxiW_ZuiT7qpE) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
Cannot download source from https://www.red-lang.org/p/download.html. On click https://static.red-lang.org/dl/auto/red-latest-source.zip i get "not here"...

[8:34:12](#L-bYkQpLd1KcmbVK2Nk48Z1i4M1fgbIekD5pp9jV62Y) <ne1uno (ne1uno)>:
@Sergey_Vladivostok_gitlab you can get latest source from https://codeload.github.com/red/red/zip/master  or use git clone.

[8:34:13](#GKtBMrmpuYZ2PmQnmF9H_l-uE_FqdvzLds7uBo7pdbA) <ne1uno (ne1uno)>:
there should be source link to same static and latest version.  usually best to use latest nightly

[8:39:51](#aGCObt9kmjgvGJEFqcBsFDuGnNgwp4bD25V-y_IXmKU) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
@ne1uno Thanks. How can create bug reports for patch site links? Is the message in this chat enough? 

[8:44:10](#_huv2mp3c349E6tEcRYid9GZt3rUVIPko2YBtNA9sEk) <rebolek (Boleslav B≈ôezovsk√Ω)>:
@Sergey_Vladivostok_gitlab I reported it so let‚Äôs hope it can get fixed soon.

[8:44:44](#h6AOYlNyEnRsKqbMgtV4y9SNKUNU3mKEB-93yMAQuto) <rebolek (Boleslav B≈ôezovsk√Ω)>:
But message in this chat should be enough.

[8:58:59](#c0EWocXVRfil25zdwkFEYLPQ60kNrOs7eDk4qpqaraw) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
Is it possible to build a static executable file for Linux, which does not need any libraries to work in the console? 

[8:59:51](#ihFB5YLU2hLKG_zy9Kned6Lz32AlTBTJKxiZzA1ubRQ) <rebolek (Boleslav B≈ôezovsk√Ω)>:
I think you would need to patch the compiler to do this.

[9:06:11](#N-KCKo7-gUcfB3Nwn1u0gCarRry-Pov25z5CrK9qrMA) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
This seems to be a non-trivial task. I think it will be difficult for me so far. 

[9:07:27](#Sg3J4c08Yc0o1w6H5vrAb7n0p60xCSrNfG2-q0RYwx8) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Yes, I‚Äôm afraid it won‚Äôt be very easy.

## 10-Apr-2021

[6:54:57](#Axd2niaSHFIaxzduzI7QBLvQpE9P1qNREOrAhmHJMtY) <lylgithub2021 (lylgithub2021)>:
I try to do something when keys combination "ctrl a" on keyboard are hit like this:  view[on-key [if all [event/ctrl? event/key = #"a"][print "ok"]]], but it does not work. How to achieve it?

[8:14:53](#Ceu6dhIuhZn3k69lo-B_5RDkKpWStoqV5rjVylAkJpI) <hiiamboris (NOT THIS ONE)>:
face must have focus in order to receive a keyboard event

[8:15:03](#q-xJcJ4zjK-DSyQsIMJGGxc9lQCTPOzeVr3ofrCCmXU) <hiiamboris (NOT THIS ONE)>:
https://w.red-lang.org/en/view 

[8:15:22](#lhstyChNc-MDfuUYBpiXTsRee3x9jtc3vio5e4on3No) <hiiamboris (NOT THIS ONE)>:
or use `on-detect`

[8:16:19](#h7Ypn6Cevu5m50JCvG3SV8XrcCweko1yYug9Kr98jRo) <lylgithub2021 (lylgithub2021)>:
 @hiiamboris  Would you please  show a code example?

[8:19:52](#0M3zwzrFs1SHkdWAG1NupdISlg-a9HoYKVAbxdKfETA) <hiiamboris (NOT THIS ONE)>:
`view [base focus on-key [...]]`

[8:20:43](#B8Mxw-zKy9LMP3fErukm58NSqodiffGkOMTDqLuKo34) <hiiamboris (NOT THIS ONE)>:
`system/view/capturing?: yes  view [on-detect [if event/type = 'key [...]]]`

[8:21:49](#LV1iE5ZNK22Nq6jWSvI1oZ5G2ddBDGtZEsgoXxbnbEg) <lylgithub2021 (lylgithub2021)>:
How to present "ctrl a" in the block  of `on-detect` for example?

[8:22:08](#JP1eIwknDCtfeyP3qbiRbdWn0o_b1_6rCDYjIPzi8Hg) <hiiamboris (NOT THIS ONE)>:
same way you did

[8:23:55](#7yLlTT2GGsJAaiNtmoUSJe2rR6chI37oZgq-JOsoLSw) <lylgithub2021 (lylgithub2021)>:
Could you help me with the code that can run?

[8:26:18](#OaQfZo8oi6m9Nwbw6xn14sD1GXm61GOerL-kqj59vt8) <lylgithub2021 (lylgithub2021)>:
I tried like this `view [on-detect [if all [event/ctrl? event/key = #"a"][print "ok"]]]`, but it doest work yet.

[8:28:30](#ue_r5ijzST30qiGXCw3zCpovfOUB5g5ihNMv1yFGxgE) <hiiamboris (NOT THIS ONE)>:
use `print`, `probe`, `??` to debug your code

[8:35:47](#ZXy5KXMDD4Bh5MYlotJaZGywTOPTVWixZC8yPzntdhw) <lylgithub2021 (lylgithub2021)>:
As there is very few example in red doc, I still can't understand how to achieve it. So would you provide with a code example for my case?

[8:38:42](#LuoUdjnERa-113FemZmr9-ioO01aCsFsICT4RQzV-Qs) <hiiamboris (NOT THIS ONE)>:
I did just above

[13:53:24](#usiCHgtFi-7dgi3tHKg7M-TdkFwmw0Yno8B4XJ6Khek) <toomasv>:
@lylgithub2021 
Global:
```
system/view/capturing?: yes view [on-detect [if all [event/type = 'key event/key = #"^A"][print "Yesss!"]]]
```
With base
```
view [base focus on-key [if event/key = #"^A" [print "Yesss!"]]]
```


[13:53:31](#gX_PzyW7Ite7Y4Fdweh2AetEYm02gYOvouBBnkzX5rw) <toomasv>:
* @lylgithub2021 
Global:
```
system/view/capturing?: yes view [on-detect [if all [event/type = 'key event/key = #"^A"][print "Yesss!"]]]
```
With base:
```
view [base focus on-key [if event/key = #"^A" [print "Yesss!"]]]
```


[13:54:43](#enjAmDUEtMSfgE5C_dJ0cZu-KXPxkQZzqS5C0ocKs7w) <toomasv>:
* @lylgithub2021 
Global:
```
system/view/capturing?: yes view [on-detect [if all [event/type = 'key event/key = #"^A"][print "Yesss!"]]]
```
With `base`:
```
view [base focus on-key [if event/key = #"^A" [print "Yesss!"]]]
```


[14:00:01](#D6wlu4EhlHdoefnBOC7JrQRbTVfOXrGjtY7sTP7hk9o) <lylgithub2021 (lylgithub2021)>:
 @toomasv Thank you for your code! I learned through your code that `event/key = #"^A"` means `ctrl a`, and how to express `alt a`?

[14:17:04](#tiLWTQTHDE1LVjmbFIg1grt1K8FUsHmfP--reuUbVrA) <toomasv>:
@lylgithub2021 You are welcome!
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

[14:47:44](#yWXWWO3atLkNs5txra9_SfP5ywDQTcwZsHBr0AGqPhM) <lylgithub2021 (lylgithub2021)>:
Perfect solutions! That's just what I want. Many thanks again! And why  is `event/key =  #"a"` not right,  but `event/key = #"A"` ?

[14:53:25](#LiUBK4T5-Uvrvh2UdU4SbKgNGgJgR5HNs78ct_826TM) <hiiamboris (NOT THIS ONE)>:
`key` event converts the key into char (most notably Shift+keys, but Ctrl too)

[14:53:44](#9cNbeu1zFxGd89JKx5CpScSRLA7XgyXjYIaHQV1wnWM) <hiiamboris (NOT THIS ONE)>:
`key-down` and `key-up` give you raw keys

## 11-Apr-2021

[11:18:04](#Kv_kENgJBgIWtykZXOcvFJLAvfaGROJQctMPkk7FdJ4) <planetsizecpu (Jose Luis)>:
Welcome @lylgithub2021 

## 13-Apr-2021

[2:56:56](#_EDbxsnh1pvFhoU9Gsjex5-NitD_TGJajlZ4j0VxFV4) <lylgithub2021 (lylgithub2021)>:
```
scrn: system/view/screens
view [size (scrn/1/size / 2)] 
 ;; it fails. I want get a window sized 1/4 of the screen. What's wrong with my code?
```

[3:06:19](#oT9FL4sCi7xJktiDxlWUeUUwLde4AP47BLFAj6QHrck) <lylgithub2021 (lylgithub2021)>:
* ```
scrn: system/view/screens
view [size (scrn/1/size / 2)] 
 ;; it fails. I want to get a window sized 1/4 of the screen. What's wrong with my code?
```

[3:55:41](#tMWoVyZXP6YGtrTrYMzj8IF3sGpmkjKxP6EoZWJNHmQ) <ne1uno (ne1uno)>:
 `view compose [size (scrn/1/size / 2)] `  is one way

[4:30:09](#FAchkqVIx17t_Cf1a0SqK-ZK7CvcWb2pDnO1ndorw9k) <lylgithub2021 (lylgithub2021)>:
Why is this a wrong way --`view [do [a: scrn/1/size / 2] size a ] `

[4:36:29](#VVHHU4BtmyYkScs0RU0k7qLkLJE940SHj1Sht-jcv18) <ne1uno (ne1uno)>:
that should work if you set 'a` outside of  `view`.   I think the do block is evaluated last in view?  view has more limited syntax than red, paths and math need something like compose

[4:37:51](#cmrreHut4vUoiT8UbmZSsNPxJCMMQW6j9A53RCZNQPw) <lylgithub2021 (lylgithub2021)>:
@ne1uno  Many thanks!

[4:39:12](#A5GuRSQ0mBH_Q39hWy7mpsnqNK02_s5LVpTOKp6nc8U) <lylgithub2021 (lylgithub2021)>:
and this works `view [do [a: (to-string 1)] text a]`

[6:19:56](#eup3SmN0cSZbgtudNdB9L2Xbk5g4aW8ncuxrzmTiIE4) <toomasv>:
@lylgithub2021 It fails in first case and suceeds in second because in VID block window properties (size, title, backdrop and window events) are handled first, then everythin else. So, when `do [...]` is handled, `size a` is not understood anymore, although `a` si set. But in second case, `text a` is handled after `do`, because it is not a window property but style. You can learn about VID handling [here](https://github.com/red/red/blob/master/modules/view/VID.red#L508).

[6:20:29](#_CNWmnhAfAlH5p0oN3KCjmC-CeDRzv-J2athp9EMYjI) <toomasv>:
* @lylgithub2021 It fails in first case and suceeds in second because in VID block window properties (`size`, `title`, `backdrop` and window events) are handled first, then everythin else. So, when `do [...]` is handled, `size a` is not understood anymore, although `a` si set. But in second case, `text a` is handled after `do`, because it is not a window property but style. You can learn about VID handling [here](https://github.com/red/red/blob/master/modules/view/VID.red#L508).

[6:20:42](#WmDIX4-rO7nnfPMk0SOLHGuKzYkJbW20OaEqSKJMcHs) <toomasv>:
* @lylgithub2021 It fails in first case and suceeds in second because in VID block window properties (`size`, `title`, `backdrop` and window events) are handled first, then everything else. So, when `do [...]` is handled, `size a` is not understood anymore, although `a` si set. But in second case, `text a` is handled after `do`, because it is not a window property but style. You can learn about VID handling [here](https://github.com/red/red/blob/master/modules/view/VID.red#L508).

[6:20:58](#haHXsY5OApa0kI26-Ne9lqOyTL8QPnjqAXrbDa_l6yQ) <toomasv>:
* @lylgithub2021 It fails in first case and suceeds in second because in VID block window properties (`size`, `title`, `backdrop` and window events) are handled first, then everything else. So, when `do [...]` is handled, `size a` is not understood anymore, although `a` is set. But in second case, `text a` is handled after `do`, because it is not a window property but style. You can learn about VID handling [here](https://github.com/red/red/blob/master/modules/view/VID.red#L508).

[12:22:38](#PKGF4_GHfxUZun3Nhv6S54lV7YSqaNTc9EsW89qD0XQ) <lylgithub2021 (lylgithub2021)>:

@toomasv  Then why  is `view [size (scrn/1/size / 2)]`  not understood by VID since `scrn` has been defined before?

[14:40:45](#_unlNa5je8WFTxGtdLh2u7-LgLE_g5XupOEzY-qWZLc) <hiiamboris (NOT THIS ONE)>:
VID allows arbitrary expressions only after a few facets (like data or extra), but not after size.

[16:48:21](#2YCYI5TuQ3s2weHOSstaTQq86SAIy5P-Fp0QCbi1tJc) <greggirwin (Gregg Irwin)>:
@lylgithub2021 look again at @ne1uno's first response to your question. You may have missed `compose` there.

[16:56:27](#ueWXekfRyu8-TojDYtPx9aH6c49AsstzgQnLpZ0PQW8) <toomasv>:
@lylgithub2021 Is said above, either
```
view compose [size (scrn/1/size / 2)]
```
or 
```
a: scrn/1/size / 2 view [size a]
```

[16:58:30](#41t0IFDzTEIi-n1spvKTSowRo-lcdTwNl2Q_RQWKIZo) <toomasv>:
* @lylgithub2021 Is said above, either
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

[16:58:43](#6xLniQfRA_05jsGCnBCx5Dga__L956Xzg3B6H1otwxA) <toomasv>:
* @lylgithub2021 As said above, either
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

[17:01:17](#En6Gt_fTlizRn1ESbCKuYm3LonqS3Dik57IOO8od5o8) <toomasv>:
* @lylgithub2021 As said above, either
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

[17:39:57](#nrj6My-PyBA2geIKAIizzTFlGfimOgJ87m0kzbDlKXo) <greggirwin (Gregg Irwin)>:
It's a source code salad bar!

[19:47:27](#-Ao-BpARwd6HPQuX3f7EmrGzkh6Eg2neQJLRxi2DVIg) <toomasv>:
:) Dessert too:
```
view make face! [type: 'window size: scrn/1/size / 2]
```

[20:00:46](#FsuWd5q8kSvyUzujhTImc5Av0lgJLmpKXK37jfZq42U) <hiiamboris (NOT THIS ONE)>:
where's `do` variant? Ì†ΩÌ∏â

[20:19:30](#1UYtYhrUL9X-E9txaN5pZzHDktt5_mNK4zNrE8sqmhg) <hiiamboris (NOT THIS ONE)>:
Ì†ΩÌªé

[20:41:16](#kuEe8FEFGfgfUZK-rMcPkDd5pDUgeNwBkvePJYzQw7k) <greggirwin (Gregg Irwin)>:
We really need super-sized emojis.

[20:45:35](#LKdiuMPkkViEZh-yNMyqauR-GU1TdlD95D7f2MAYipw) <hiiamboris (NOT THIS ONE)>:
true

## 14-Apr-2021

[1:09:21](#-Kh5IrLDms7chRtqFdBaaGsiKCoKtLUvwHbeM_CnKTw) <lylgithub2021 (lylgithub2021)>:
@toomasv  @ne1uno  Many thanks! I learnd a lot from all of you! 

[3:56:32](#xPkEjA8KKiJX0wL1qgvjFqbPJ0Ebs3TK0_kBE_J2Yqg) <toomasv>:
@lylgithub2021 You are welcome! Keep digging in and ask whenever stuck.

[6:31:50](#mc4IY89r7ZtLGnkt6beh3kyaiENgjkWahbL9-E-HbQI) <lylgithub2021 (lylgithub2021)>:
Is there a method in Red to construct a function with indefinite number of arguments, when calling it like this:
```
(f 1)  ;; return 1
(f 1 2) ;;return 3
(f 1 3 5) ;; return 9
(f 1 2 5 8) ;; return  16
......
```


[6:50:59](#Tn6j_68oMea5I4h6xyPM-Gms_VH-kRqrw_Fh8XxsSQI) <hiiamboris (NOT THIS ONE)>:
Use a block argument.

[6:55:49](#F5Cj0XHFtWopWQSgrd36BpllTDwFUHY_siqNUHYZbAs) <lylgithub2021 (lylgithub2021)>:
Except for block argument, no other better way  to achieve my idea?

[6:59:06](#f5HoGKweOY75gb7IJFof3qmrBErS4mdEdxHNPqD_FAg) <hiiamboris (NOT THIS ONE)>:
Write your own dialect. Or declare 'f' with thousands of literal arguments of type 'unset! integer!' Ì†ΩÌ∏â

[6:59:34](#tI-y8GKFH0AefYYJAYshx7pAn4Me03NoSg_k0v-ugRg) <hiiamboris (NOT THIS ONE)>:
But latter is a joke. Don't do that.

[12:42:34](#cESHeAD3auuaMfhRQLQkcZsubg6Y0zk_-oq1PpWE7nA) <toomasv>:
@lylgithub2021 Just playing here. I have note used macros, but the thing you ask could be done with [these](https://github.com/red/docs/blob/master/en/preprocessor.adoc#pattern-matching-macros):
```
save/header %tmp.red [
    #macro [ahead paren! into ['f a: some integer! b:]] 
    func [[manual] s e][
        change/only/part a to-block a b s
    ] 
    f: func [blk [block!]][sum blk] 
    probe f1: (f 1 2) 
    probe f2: (f 10 20 30)
][]
do %tmp.red
;3
;60
;== 60
```
I'm sure @hiiamboris can give more details.

[12:42:48](#fiRpIXc6SLDCMaHA3kYV2WznzkwlBsAN2B77djEpJn4) <toomasv>:
* @lylgithub2021 Just playing here. I have not used macros, but the thing you ask could be done with [these](https://github.com/red/docs/blob/master/en/preprocessor.adoc#pattern-matching-macros):
```
save/header %tmp.red [
    #macro [ahead paren! into ['f a: some integer! b:]] 
    func [[manual] s e][
        change/only/part a to-block a b s
    ] 
    f: func [blk [block!]][sum blk] 
    probe f1: (f 1 2) 
    probe f2: (f 10 20 30)
][]
do %tmp.red
;3
;60
;== 60
```
I'm sure @hiiamboris can give more details.

[12:43:13](#3BJhVlNjz4u9ptLcz1n0IdARt-CBNQVqVhTUaI1n23U) <toomasv>:
* @lylgithub2021 Just playing here. I have not used macros, but the thing you ask could be done with [pattern matching macros](https://github.com/red/docs/blob/master/en/preprocessor.adoc#pattern-matching-macros):
```
save/header %tmp.red [
    #macro [ahead paren! into ['f a: some integer! b:]] 
    func [[manual] s e][
        change/only/part a to-block a b s
    ] 
    f: func [blk [block!]][sum blk] 
    probe f1: (f 1 2) 
    probe f2: (f 10 20 30)
][]
do %tmp.red
;3
;60
;== 60
```
I'm sure @hiiamboris can give more details.

[12:44:14](#4qQQ_IRdOWkRMEurcFLoEuFmOqCUv2_mNLSBt2ETNaY) <toomasv>:
* @lylgithub2021 Just playing here. I have not used macros, but the thing you ask could be done with [pattern matching macros](https://github.com/red/docs/blob/master/en/preprocessor.adoc#pattern-matching-macros):
```
save/header %tmp.red [
    #macro [ahead paren! into ['f a: some integer! b:]] 
    func [[manual] s e][
        change/only/part a to-block a b s
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

[12:44:56](#CN1k1yZsWbQHH5RD7MsuixgcCgbresLk0H2d_Vez2Oc) <toomasv>:
* @lylgithub2021 Just playing here. I have not used macros before, but the thing you ask could be done with [pattern matching macros](https://github.com/red/docs/blob/master/en/preprocessor.adoc#pattern-matching-macros):
```
save/header %tmp.red [
    #macro [ahead paren! into ['f a: some integer! b:]] 
    func [[manual] s e][
        change/only/part a to-block a b s
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

[12:47:23](#flssZXGHNI-yknSGP5oQq5jzOysvNlhXG9Ey2oWw6-Q) <toomasv>:
* @lylgithub2021 Just playing here. I have not used macros before, but the thing you ask can be done with [pattern matching macros](https://github.com/red/docs/blob/master/en/preprocessor.adoc#pattern-matching-macros):
```
save/header %tmp.red [
    #macro [ahead paren! into ['f a: some integer! b:]] 
    func [[manual] s e][
        change/only/part a to-block a b s
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

[12:50:22](#OZvOmB1P3LJu2zFrDNU4usFo_5whQVNbq70xF3lACEg) <toomasv>:
* @lylgithub2021 Just playing here. I have not used macros before, but the thing you ask can be done with [pattern matching macros](https://github.com/red/docs/blob/master/en/preprocessor.adoc#pattern-matching-macros):
```
save/header %tmp.red [
    #macro [ahead paren! into ['f a: some integer! b:]] 
    func [[manual] s e][
        change/only/part a to-block a b 
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

[12:51:47](#dyXBIsWa0dBKkJ41TNirLPYhI1pbRcjbOxZEF_XOrHg) <toomasv>:
* @lylgithub2021 Just playing here. I have not used macros before, but the thing you ask can be done with [pattern matching macros](https://github.com/red/docs/blob/master/en/preprocessor.adoc#pattern-matching-macros):
```
save/header %tmp.red [
    #macro [ahead paren! into ['f a: some integer!]] 
    func [[manual] s e][
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

[12:52:15](#88t9AftVlzJOJLHnBqhqjA2BYZF4v9atEpa4YRqAnGY) <toomasv>:
* @lylgithub2021 Just playing here. I have not used macros before, but the thing you ask can be done with [pattern matching macros](https://github.com/red/docs/blob/master/en/preprocessor.adoc#pattern-matching-macros):
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

[12:53:33](#Y8CykEdBeGFNEsyylCnOFm6QX8JJp_KEJlvGe_uLRpA) <toomasv>:
Oops! `/local a` is wrong, delete this.

[12:53:46](#GYsrcSiRGgsVYXzbyy7ZvCfZ6oMmkXyXYUw3QFglkBA) <hiiamboris (NOT THIS ONE)>:
`tail a` is `e`

[12:54:34](#8EcouutPCMiF31MnLgqsgFbrLu7dpB1M13v_FtJI2Lk) <hiiamboris (NOT THIS ONE)>:
and yes, it's better not to use any set-words in those rules, as.. global namespace pollution when interpreted

[13:26:54](#7MfTVc04LP0SVwhW7FZ-47tzN7UkMrRnUCeWJm-6Yng) <toomasv>:
Thanks @hiiamboris Here is version without global words:
```
save/header %tmp.red [
    #macro [ahead paren! into ['f a: some integer!]] 
    func [[manual] s e][change/only/part at first s 2 to-block at first s 2 tail first s s] 
    probe (f 1 2) 
    probe (f 10 20 30)
][]
```

[13:27:09](#E2m8mIpLgnwDCmSQ_7eRk9Bk1K8pB_WcS5_T5LZUMTk) <toomasv>:
* Thanks @hiiamboris Here is version without global words:
```
save/header %tmp.red [
    #macro [ahead paren! into ['f some integer!]] 
    func [[manual] s e][change/only/part at first s 2 to-block at first s 2 tail first s s] 
    probe (f 1 2) 
    probe (f 10 20 30)
][]
```

[13:28:31](#BpT7uZsGsvGwJMkzEmFVFg-ZMklCiJbI3cQD8FLZp5o) <toomasv>:
* Thanks @hiiamboris Here is version without global words:
```
save/header %tmp.red [
    #macro [ahead paren! into ['f some integer!]] 
    func [[manual] s e][change/only/part at first s 2 to-block at first s 2 tail first s s] 
    probe (f 1 2) 
    probe (f 10 20 30)
][]
do %tmp.red
;3
;60
;== 60
```

[13:28:59](#zQwSubOPLbPvuUTY8AZZjB7sqyxw6iF-CVlpLUZOlVA) <hiiamboris (NOT THIS ONE)>:
`s/1` wouldn't be more readable? Ì†ΩÌ∏â

[13:29:22](#2MyW_-A-72mrfJ3EHWdL9ndR7moNGWibk1nwp0-08c4) <toomasv>:
* Thanks @hiiamboris Here is version without global words:
```
save/header %tmp.red [
    #macro [ahead paren! into ['f some integer!]] 
    func [[manual] s e][change/only/part at first s 2 to-block at first s 2 tail first s s] 
    probe (f 1 2) 
    probe (f 10 20 30)
][]
do %tmp.red
;3
;60
;== 60
```
NB! `tail a` *is not* `e`

[13:29:33](#QoK42XqMU-f8RRCHZ7chyn1XUxIOqWh4YBe8HLXByc4) <toomasv>:
* Thanks @hiiamboris Here is version without global words:
```
save/header %tmp.red [
    #macro [ahead paren! into ['f some integer!]] 
    func [[manual] s e][change/only/part at first s 2 to-block at first s 2 tail first s s] 
    probe (f 1 2) 
    probe (f 10 20 30)
][]
do %tmp.red
;3
;60
;== 60
```
NB! `tail a` **is not** `e`

[13:30:33](#7TqpIHErUFbbqiu0S5HVCJaPP71UoNLVhwDqN1BMHvE) <hiiamboris (NOT THIS ONE)>:
> NB! tail a is not e

Riiight. Good catch.

[13:30:34](#u-xTUt-yFVUEbtfng4UauvhMQBlOUPl8fl2oSIX1qR8) <toomasv>:
Yes, thanks!

[13:31:13](#W8E-qwAgWh1KyZI0n2_EAbUMITYK_xoD-NxGJQeCqaQ) <toomasv>:
* Thanks @hiiamboris Here is version without global words:
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
NB! `tail a` **is not** `e`

[13:31:20](#bPqwCDvIyx0Y3HqIOZEdKEiGUTAekEIbcH4jsPOUUJ4) <toomasv>:
* Yes, thanks, corrected!

[13:41:10](#2FCFHLSJg8LvpxeeiwBBLZ_E5Ig7uzF0W7FGP1vE-Vs) <toomasv>:
From last version function `f` itsel was left out. Insert this before first `probe:`:
```
f: func [blk [block!]][sum blk]
```

[13:41:36](#YWe7mELsnen_wHH4Ge2OeAfbsU1J4GeVPEhfJbyUibA) <toomasv>:
* From last version function `f` itself was left out. Insert this before first `probe:`:
```
f: func [blk [block!]][sum blk]
```

[16:18:31](#1pd6jDarFJqR7HLX2LiqrtUB4pjuBfjaXFY1TO8FguY) <greggirwin (Gregg Irwin)>:
@lylgithub2021 Let me know how we can improve [this answer](https://github.com/red/red/wiki/%5BDOC%5D-Red-Should...-(Feature-Wars)#support-variable-arity-functions).

[16:18:54](#Ai8AUNccEVx_vDS9JPRBb9Z7Uxgsg7z3_38AEc3g7-s) <greggirwin (Gregg Irwin)>:
* @lylgithub2021 Let me know how we can improve this answer:https://github.com/red/red/wiki/%5BDOC%5D-Red-Should...-(Feature-Wars)#support-variable-arity-functions.

[16:19:02](#X8BT3QZ110llySC0pokNN5xF3zJJ9BBzXN8zvmhevpU) <greggirwin (Gregg Irwin)>:
* @lylgithub2021 Let me know how we can improve this answer: https://github.com/red/red/wiki/%5BDOC%5D-Red-Should...-(Feature-Wars)#support-variable-arity-functions.

[17:07:40](#9PAzSu73-ckeFHZWbYpP1KJYRxXOz6S2RbANwAAtmM4) <Respectech (Respectech)>:
Sounds good to me.

[18:11:03](#uncAvCLP-pRitVO7utmfiW0u3jBZI4ge4JkEPvkaHKk) <greggirwin (Gregg Irwin)>:
Thanks @Respectech. 

@toomasv, the macro approach is cool, but `some integer!` probably isn't that useful as a rule. :^) I think this is where evaluation complicates var-args in Red. Not that we can't solve it technically, but they may end up being harder to read, especially if any lit args are involved.

[18:15:18](#XLfc7sW37_PKlDVJ6beMPq-cSt68XMuySThY44ckfUM) <toomasv>:
I agree that this in itself in not much worth, it was just interesting exploration into macros.

[18:15:44](#0hpq0f4Fq87y9qHpwxh05rt_TDmIYg1gyXZbOdDdHaI) <toomasv>:
* I agree that this in itself in not much worth, it was just interesting adventure into macros.

[18:16:12](#NlBq2nUpKSaPCx96g75ZAq-7MobZwq1tzpiLJH8bXj4) <greggirwin (Gregg Irwin)>:
Yes. Could add to https://github.com/red/red/wiki/%5BNOTES%5D-Macro-Notes.

[18:25:18](#GyOs3imu9EMSiWhV-QboK7yCA42OugocuDNANO-P3DI) <toomasv>:
Hmm, the kind of thing I did is discouraged in starting note there, so maybe not to push in this direction?

[18:36:18](#KHgo6svTLeUj153SHfUp2UzR6OjuTvPzv42ydGiaWIg) <greggirwin (Gregg Irwin)>:
We can probably add examples, with caveat emptor clauses. :^)

[18:36:45](#W7R8debdYH-kkbrurR2XcOTdEil4bFx8Zxh8qCkNxL8) <greggirwin (Gregg Irwin)>:
As you noted, this is about exploration and learning.

[18:54:35](#OItta899h1P6kdCAQZfA4NG9fFHhOZdmcA3ZqhOonaI) <hiiamboris (NOT THIS ONE)>:
Well, 
> There is nothing macros can do that you can't do with regular code, with the same expressive power. Macro support in interpreted code is just for compatibility with the compiler.

I have already collected a bunch of macro solutions that disprove the above statement Ì†ΩÌ∏â

[19:50:57](#OHaTrp7BcFcfnO0ZydkrR7MSZ3jUvTF7Z6vkl4Y_eRw) <greggirwin (Gregg Irwin)>:
Good thing it's a wiki then. 

## 16-Apr-2021

[7:38:09](#CHyE8eNB6wj2YJADdsSMBb0RDEn-nVgJp8EhDuvWF3s) <lylgithub2021 (lylgithub2021)>:
Thank you.@greggirwin  Refinement is too heavy for some matter.  To pass blocks of values is the easist way, but seems not quite elegant.  I don't quite unserstand "free ranging evaluation". Further info or examples would be highly appreciated!

[19:37:36](#UixbRMngZ74WJ-fEvTsx7ekquG4WgVxIPq3Re0pL7sI) <greggirwin (Gregg Irwin)>:
Free ranging evaluation just means there are no parens around args for function calls. So you can't tell when an expression ends without knowing how many args each piece consumes, and whether they themselves are evaluated. As far as being elegant, is Lisp an less so just because the bracket is one token to the left? `(my-fn 1 2 3)` vs `my-fn [1 2 3]`.

## 17-Apr-2021

[1:03:45](#jO_vqCQcF-aLAoFw_63rgbgkDfmmeRmJUXJRMn2rZ6g) <lylgithub2021 (lylgithub2021)>:
@toomasv  I tried your code `save/header...do %tmp.red`, but get message `*** Script Error: f has no value`, why?

[3:58:27](#7RaOvw-bht2dpFyAWEUD3gx6T7zUhRDmzCjQHOBXA5I) <toomasv>:
@lylgithub2021  ‚òù [April 14, 2021 4:41 PM](https://gitter.im/red/red/welcome?at=6076f0f6b6a4714a29c3f1ed) 

[5:07:27](#SYNIQI0ORgjqBKz7f0oy7RSAB9nd31nYGsr92OtK_cI) <lylgithub2021 (lylgithub2021)>:
[![image.png](https://files.gitter.im/570387cd187bb6f0eaddec47/KnYA/thumb/image.png)](https://files.gitter.im/570387cd187bb6f0eaddec47/KnYA/image.png)

[5:07:41](#4QV4lH86I0Fnj_WVQqarjFlwYkbi6tNqjdElBhkm4D4) <lylgithub2021 (lylgithub2021)>:
@toomasv 

[6:02:12](#VbpcU1tsbEuCW83MSg2K24IcXjT3dJAHwmkCOWRXEr8) <toomasv>:
@lylgithub2021 Do you use latest nightly build?

[6:02:20](#rxiGjuMv1G6M763jnmfj34s3tPLLLSOP3J2cCn9wyoY) <toomasv>:
[![image.png](https://files.gitter.im/570387cd187bb6f0eaddec47/9rVV/thumb/image.png)](https://files.gitter.im/570387cd187bb6f0eaddec47/9rVV/image.png)

[6:18:16](#xHDRTHc30upTevPRkmpd-wZFMubkXrHI7671zvSlgR0) <lylgithub2021 (lylgithub2021)>:
[![image.png](https://files.gitter.im/570387cd187bb6f0eaddec47/tBSQ/thumb/image.png)](https://files.gitter.im/570387cd187bb6f0eaddec47/tBSQ/image.png)

[6:54:41](#Qbol-dXoYykmZkE91o8NkVPesypl6RCVoNTa-CMMKcg) <hiiamboris (NOT THIS ONE)>:
That's what happens when you type the code instead of copy-pasting (:

[8:08:55](#QgLI_2WePZo31NL5FVADi00a9sURCNpixlrQRmDR_FQ) <toomasv>:
@lylgithub2021 Ah, yes, `into ['f ...`. Thanks, @hiiamboris! 

[8:57:45](#EmnQidZL-Li0QKa6SvtUcFtBW1ZTpuPijKMDwGVZIjY) <lylgithub2021 (lylgithub2021)>:
Thanks! @toomasv  @hiiamboris 

[11:08:12](#tuLhu8h75NWmiK_TwlqnQeVrX1w4GJEAxgj10Ss_C1k) <toomasv>:
:+1: 

## 21-Apr-2021

[12:43:59](#dZbE0cfsZALk98IrDWKjBVjJW2Ok9ANUVzXl370FBHU) <lylgithub2021 (lylgithub2021)>:
Both file name and file path are dataype of `file!` in Red language. Is there any function or other way to tell whether a `file!` is a file or a path?

[15:51:19](#GzgDUcX9TP0Cf9Um-VFVyyLSOkXyuCKsy2KcsQhokhw) <hiiamboris (NOT THIS ONE)>:
not in runtime

[15:51:27](#ONzKFjH9E6GTAbD-PCZWfEVUhkVOG8klPYIiKFP3EJc) <hiiamboris (NOT THIS ONE)>:
you just need to check the first char

[16:02:14](#lTIMRylAceC48LTC4mhEymyZDmOifuMkICqj2JcdUo0) <lylgithub2021 (lylgithub2021)>:
`chck the first char` seems to fail in checking all returns in  `read %.` whose path contain  sub-directory .

[16:02:55](#bJiJ-1UPWKaLwD4nuXJVrYUo-GSxdhwHFrxHybenNr0) <hiiamboris (NOT THIS ONE)>:
ah

[16:03:07](#5xJfSGUkjFP5nl7knlbIAID9jbDapjbovujrLWHHbAM) <hiiamboris (NOT THIS ONE)>:
so maybe you're just looking for `dir?`?

[16:04:40](#RJTBAJ6ZgNeRQ8yvS5TBX_mQll49TKfZCosK4WJJ7dM) <lylgithub2021 (lylgithub2021)>:
so maybe you're just looking for `dir?`?

[16:08:59](#Jn_i5FYJ5KptlTk1MiJN425U4LstWOlWmzbewHJSznY) <lylgithub2021 (lylgithub2021)>:
Yes, It is. Many thanks! And, is there a way to convert a  reletive path to absolute path?

[16:11:23](#t_B2Kamk_8eVVlNm6rN5t-PMfLsyMRd39hQw6rhqFSE) <dsunanda (dsunanda)>:
> a way to convert a reletive path to absolute path
```
 clean-path %rel/path
```

[16:41:21](#XlhfMTj77o583Y_Vkdhzkl_xv98GQLsIa2xFQuqWcI0) <lylgithub2021 (lylgithub2021)>:
It seems that the returned absolut path refers to  the current woring path, not always the real file path.

[16:41:41](#rcYjaL9Bw2dmwo94Eh7XSh4fkpo_Qp7EdiBv7EvdXpM) <lylgithub2021 (lylgithub2021)>:
* It seems that the returned absolute path refers to  the current working path, not always the real file path.

[16:43:34](#-JlU7nrS-o29psPUW0vE4MvFjj49G3j-i8VMNyayDo0) <lylgithub2021 (lylgithub2021)>:
No function such like "red-complete-path" in Red to acquire the real absolute path?

[17:16:11](#YQybditgGkOLM-cjSKnWE939J7_cIH94sxG6p4w_wLE) <greggirwin (Gregg Irwin)>:
If you have a relative path, it has to use *something* as a base to make an absolute path out of it, so I'm not sure what you mean by "the *real* absolute path".

## 22-Apr-2021

[0:45:09](#QgmDmL4lH8mH4wtLpVwrac325Nu_VWhHfGY1y2m5xLY) <lylgithub2021 (lylgithub2021)>:
If you have a relative path, it has to use *something* as a base to make an absolute path out of it, so I'm not sure what you mean by "the *real* absolute path".

[0:49:40](#jchGWqjlFZ4KeqirU82WtOuunRWD9kiWLqwY29hvA6c) <lylgithub2021 (lylgithub2021)>:
@greggirwin  I'd like to list all files in a given directory(which contains sub-directories) to a block with this:
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
The return of `all-files` just give file names, but absolute file path  is also needed for the reason of later file loading. This is why I want to convert a relative file path to a absolute path.


[1:38:27](#nSWzHTgIqVBheBOqOv5AGX42jNdG090EvDRqwnfmAjQ) <greggirwin (Gregg Irwin)>:
There are a number of tree loaders people have done. If you need absolute paths in a flat list, you need to prepend the current dir as you walk. 

[1:46:38](#d-QvUd73Jrbv4Fo3jD2IYAvFR5OgP-yI6DV6fpuHv8o) <greggirwin (Gregg Irwin)>:
Something like this:
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

[1:48:49](#G5r8-XWe8YjWiQUEdJMs4IaseGc0kc4iChq_VFHN2Jo) <greggirwin (Gregg Irwin)>:
In this version, if you pass a relative path as the spec, that's used. If you pass an absolute path, that's used, so you are in control. If you want to use `clean-path` your walker needs to change to the current dir you're reading as it goes.

[6:09:48](#mvFaCJE1v0xs2d2-88tVER-kTF-1kuXT8XpTecA8Yqc) <lylgithub2021 (lylgithub2021)>:
@greggirwin Many thanks for your code!!

[6:57:02](#LLynI_s3svFEWB0CHmcx4udEYQ9FB83aq0RgwwbOnjk) <lylgithub2021 (lylgithub2021)>:
And, given a relevant directory(maybe not current working dir), how to get its real absolute path in Red?

[7:45:44](#-91LL-2clmi260nyWJ4pfXXZCftxQmVNfVQaqanGdfk) <hiiamboris (NOT THIS ONE)>:
Two people already gave you the function to do that :)

[7:46:03](#V8PvDWwBrRgbd-J_Q0fp9BPWNEXydsSj3qpSQ1KsB_E) <hiiamboris (NOT THIS ONE)>:
‚òù [April 21, 2021 7:11 PM](https://gitter.im/red/red/welcome?at=60804eaa06e2e024e86961fb) ‚òù [April 22, 2021 4:46 AM](https://gitter.im/red/red/welcome?at=6080d57e55d78266a65d0eeb)

[8:05:29](#U0IFYJdcOBF9SkPeJyYSYuB5OaxPSaOBH3c9cn2UC8M) <hiiamboris (NOT THIS ONE)>:
I guess the docstring could be more specific about it though.

## 26-Apr-2021

[4:51:35](#BzG_cT_-zSsVJVeTRlTQlRp-aAzrfdKNMm5ilRmsn-w) <ams02468 (ams02468)>:
I guess the docstring could be more specific about it though.

[5:00:58](#51K-IBtpa9Ie9Zff1YRjhm6OKXh3GrG40ALXomZ_HKQ) <ldci (Fran√ßois Jouen)>:
Do you include needs: view in Red header?

[5:10:07](#LYzxbk-OlwUt1a23Y7ePSaVl42wVmqoCkbBBT0b460M) <ams02468 (ams02468)>:
Do you include needs: view in Red header?

[5:13:48](#FfsFir-Peoec5UGgDwotsoXra_LmyxInMqupJu77mxw) <ams02468 (ams02468)>:
Do you include needs: view in Red header?

[5:14:19](#QeKSs-CyulC1k8MM8IfRCOX9B12V1Y8gVU8-o0Oz4MY) <ams02468 (ams02468)>:
* i need autocompletion for gui code

[5:14:40](#Cd_uqcAfiKZOB9VibMLM53Nu9kSt1D2YFFU8jdhO-PI) <ams02468 (ams02468)>:
* but i need autocompletion for gui code

## 27-Apr-2021

[4:44:06](#W6Z4i_HOEUTsNoq9SJCoRX996YMWTFuWd-pJK9HQpNw) <lylgithub2021 (lylgithub2021)>:
Where to find out the concrete meaning of these `Escaped Control Characters`:  `#"^A" - #"^Z"`, `#"^["`, `#"^\"`, `#"^]"`, `#"^_"` 

[5:21:02](#IwsHeaMRsaYb3NKYiQ7sFwr3OHp-SZrz9I9a8Gsw2Zc) <dsunanda (dsunanda)>:
@lylgithub2021 
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

[6:11:27](#TsZjf-tBbRQq_SMOSo7dvf1Cx9iUxdZYne6evIVIhXU) <lylgithub2021 (lylgithub2021)>:
@dsunanda Thank you so much! And which is 30?

[6:16:01](#i0OS_MtGKW6rWmaOMRwsQ1MtezlZSMs2VkQAl_2cZDU) <dsunanda (dsunanda)>:
@lylgithub2021 Best I got is:
```
print mold to-char 30
#"^(1E)"
```
Don't know if there is a more compact way to represent it.

[6:25:58](#syyd3RpZOOXJWPF-cZzhtQWNdo16A1_OBX5hWE60PP8) <lylgithub2021 (lylgithub2021)>:
@dsunanda I get it. Thank you!

## 4-May-2021

[2:33:58](#vJ0riJ78SVz3208dwcfzAOMBgOlol9Bz14ojiIhYNqw) <lylgithub2021 (lylgithub2021)>:
I experiment `do` a string like this, and get an error message:
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
Why is `result` not seen by this code?


[2:35:53](#Z5ikWU0L9yonfdPQKCQcnWIkuEXrghgbguRa7iKId0c) <lylgithub2021 (lylgithub2021)>:
* I experiment `do` a string like this, and get an error message:
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


[3:46:52](#f8KlaRz9YJI-Nep5fCBbVYBS_18ifWQSbhfO6qg-wLY) <toomasv>:
@lylgithub2021 Although `result` is local to your function, when you `do ex` then `ex` string is loaded and `result` in this loaded block is not bound to context of `f`. Therefore it is expected to be found in globa context. But as it is not declared there error is raised. You can bind it to you function this way:
```
do bind load ex :f
```

[3:47:47](#AgDvlYKuo185XRhITnn6XU--Qio7rFbr9bZctMfixIE) <toomasv>:
* @lylgithub2021 Although `result` is local to your function, when you `do ex` then `ex` string is loaded and `result` in this loaded block is not bound to context of `f`. Therefore it is expected to be found in global context. But as it is not declared there error is raised. You can bind it to you function this way:
```
do bind load ex :f
```

[3:50:22](#K8m1XEhooeVbODHQ8LndW4-mggkPrGJvuJdn0a4KXXk) <toomasv>:
* @lylgithub2021 Although `result` is local to your function, when you `do ex` then `ex` string is loaded and `result` in this loaded block is not bound to context of `f`. Therefore it is expected to be found in global context. But as it is not declared there error is raised. You can bind it to you function this way:
```
do bind load ex :f
```
But if you use block for `ex` instead of string, then you don't need to explicitly bind it.

[10:34:32](#tINPtJ9fIf1veJhfXIxhY17kyP7sEYykmVQlYEGbFlU) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
@lylgithub2021 
```
with: func [obj body][do bind body obj]
obj: object [a: 1]
with obj [a: a + 2]
```

[10:35:37](#kX3zf-xpDUhnR8cYeSDKnTno-qOEg0xDnrNyKyO67Rs) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* @lylgithub2021 
```
with: func [obj code][do bind code obj]
obj: object [a: 1]
with obj [a: a + 2]
```

## 5-May-2021

[1:17:36](#UGrIWiY3hrB5dDVD7u4OD32eC5zG2pEnX8Cv8n5yaSY) <lylgithub2021 (lylgithub2021)>:
@toomasv  Thank you. And, as you say, "result in this loaded block is not bound to context of f. Therefore it is expected to be found in global context". I tried to redesign the function `f` with  `func` rather than `function` to make the variable `result` global, but it does not work either. I still don't quite understand the principal of variable context in Red. 

[2:57:37](#HSmE-pXZQ2aaPF4g8FROLDIrNMqm4z9oRoQUAHYQDaA) <toomasv>:
@lylgithub2021 When you use `func` then the same binding problem applies to `x`.  It is local to `f` but loading it from string without explicitly binding to the context of function leaves it global. Value is searched in global context and not found results in error. You need either to bind `x` to `f` or better use block instead of string for `ex`.

[2:58:04](#G6ET9gNzE0gDAk2EkEJ7moyEGBPQgZjzHZ0Q4ZDwKmw) <toomasv>:
* @lylgithub2021 When you use `func` then the same binding problem applies to `x`.  It is local to `f` but loading it from string without explicitly binding to the context of function leaves it global. Value searched in global context and not found results in error. You need either to bind `x` to `f` or better use block instead of string for `ex`.

[2:59:00](#uoegRyEGr5_amR2ANP76n_yEV7h0P355XHOKpUXE-9k) <toomasv>:
* @lylgithub2021 When you use `func` then the same binding problem applies to `x`.  It is local to `f` but loading it from string without explicitly binding to the context of function leaves it global. Value searched in global context and not found results in error. You need either to bind `x` to `f` or better use block instead of string for `ex` - then it is automatically bound.

[4:50:12](#KHIph-9pA2UmBBPRcghUAz2JwLKq-oYRFKVTbo8uniY) <lylgithub2021 (lylgithub2021)>:
Thank you ! @Oldes 

[4:50:52](#YnMlYUALVpYE6uouflnmDvCW7FoeqMrgPxvFY2h_s2M) <lylgithub2021 (lylgithub2021)>:
* Thank you ! @Oldes @toomasv 

[5:45:42](#ZTgNcKzwJa7GAUoKAgz48QPAkNsMUifuIpCMzMUyvEE) <toomasv>:
@lylgithub2021 You are welcome!

[10:53:38](#iuWtdf_X-uLKGrUOOwBBzELWPobOfNcv9g8lfD7V6bg) <lylgithub2021 (lylgithub2021)>:
@toomasv  Then I tried `do [append result x]` in my code, it's all right. But when I tried `do to-block ex`, same error appeared.  Why is it not automatically bound after turning string `ex` to `block!`?

[10:55:08](#bViGw_WQr_5CIIOmSyhQMFkqh9mnBI3kRlXUjFPBE_Y) <toomasv>:
@lylgithub2021 Because blocks are automatically bound on creation of function, not on its calling.

[10:56:59](#wtRrRkpy_NI7wuBIdgxodcyJWMx-ca-sDiMMRHLA7Iw) <toomasv>:
* @lylgithub2021 Because blocks are automatically bound on creation of function, not on its calling. `to-block` is similar to `load`, you can do `do bind to-block ex :f` as well as `do bind load ex :f`.

[11:04:57](#5uOEvn0sFnuXO1HwhJUlZJ5VHOLC-qwupda6_aT8g4M) <lylgithub2021 (lylgithub2021)>:
Post defination of the function `'f`, I write  `do bind load ex :f`. Then I run the code , I get `*** Script Error: ex has no value`.

[11:06:25](#mSbGOzQbx6krzgMS3nmFOMymssZ4HTDCDnAUzi5yaJA) <lylgithub2021 (lylgithub2021)>:
* @toomasv Post defination of the function `'f`, I write  `do bind load ex :f`. Then I run the code , I get `*** Script Error: ex has no value`.

[11:10:07](#RVobKT5yOkrFFgZ10zMfSbcXxX-tEc0utbh6q1rQTSI) <toomasv>:
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

[13:12:15](#5nRFwXfuoU8Yyez_yG7_dVzakVi3hpbWiBn7LjkHefg) <lylgithub2021 (lylgithub2021)>:
many thanks! @toomasv 

[13:28:54](#DkXiNu9Brq3AL8jCITDzK4aB8QQHI3EmSZHCvRdV__c) <toomasv>:
:+1:

[18:46:42](#jhOgZj6ZApUnExKiz2rhoBx6bJyooYdCEQOAwHtLu0k) <greggirwin (Gregg Irwin)>:
@lylgithub2021 why do you want to use a string rather than a block?

## 6-May-2021

[7:48:34](#E2pz328GzgtlNbBqsctsrIRwflZpp0-A8TV8vlUh4yY) <lylgithub2021 (lylgithub2021)>:
@greggirwin Because sometimes needs input from console from which the input has to be string format.

[7:49:07](#ue-SjXxnN0ydbDoCoK01vkmEXsSX6gkItosWnN8N8dk) <lylgithub2021 (lylgithub2021)>:
* @greggirwin Because sometimes needs input from console by which the input has to be string format.

[14:05:59](#nn3hw5UZQ7FwSLFy0lwR9fKedt6FdZI2F8NIsY4uIqg) <lylgithub2021 (lylgithub2021)>:
I make a function named `filter` to acquire elements from a block:
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

probe filter Ì†ΩÌ∏ñtring? [1 2 "a" 3]
;;["a"] wanted, but get:
;;*** Script Error: keep has no value
```
Why `keep` has no value in  the above example?

[14:08:28](#cwIUWq3R8J5gaOUCGclmGxETiHWPxqUe7lln84qwuSc) <hiiamboris (NOT THIS ONE)>:
Does output of `?? collect` tell you anything?

[14:13:23](#cnzVbr5bB1QIOTTKki0f3XlNk9s92uaegebSJw9RZBo) <lylgithub2021 (lylgithub2021)>:
I use `collect...keep` to collect  those elements in block that conform with `a-func`.  Am I wrong in using it in this case?

[14:13:39](#G9UWWn9L7XKyQLuBBSpeP_GGQswbLrhu8DD6-ZFPk8s) <hiiamboris (NOT THIS ONE)>:
keep is currently undefined outside of the collecting block. 

[14:15:07](#WfXGNtxwFvJmNiiUv1emh84zGXDdbvcMu7IoPrBJObU) <hiiamboris (NOT THIS ONE)>:
Make sure keep stays inside and you're out of trouble.

[14:16:41](#rpeO0Xtf0cHVl0ZJzTtPNbclO6n_vORsrflo1eGCZXE) <lylgithub2021 (lylgithub2021)>:
I don't understand why `keep` is outside of collecting block in my case since `do ex` which contains `keep` is  in  the `collect` block.

[14:20:10](#o5Ca1jwhMUYXJfNm4FMYLHZFKEk7Rn8d6Q3c9WkdqXA) <hiiamboris (NOT THIS ONE)>:
No, your keep is in another block that was created before collect could give meaning to it. 

[14:21:58](#7KFY-R5bj3Q-RYGAa8XUrs9RWE-_CLNZsNfO12kf_pQ) <hiiamboris (NOT THIS ONE)>:
What you have to understand is that 'keep' is not a function. It's a word that may or may not refer to a function.

[14:22:42](#y-rOOi9X_KPFdDaRuYIwqLpYIBQ1oug2IagoFOyb5Fc) <hiiamboris (NOT THIS ONE)>:
In your block that word has no reference to any function. It's unset.

[14:23:35](#VVKHgEFpojiJeNDJDcf5BDr2xx7scN3RxL_tegZEYds) <hiiamboris (NOT THIS ONE)>:
Try '? keep' in console.

[14:50:14](#7vN1bgmytcQ0g2_JaiifKKs5xnKilJkzm0aDviofzCk) <lylgithub2021 (lylgithub2021)>:
Though my `keep` in `ex` is  before the `collect`,  it's just in block, so it's just a word! not evaluated in `ex`. When `keep` is  called by `do ex`, it  is in the `collect` scope.  So why does the `collect` not  identify the `keep` in `ex`?

[14:51:42](#blHKhPJtkODTP64_DbvrN6uYqjJB6s1QSrAzF9OvSbA) <hiiamboris (NOT THIS ONE)>:
There are no scopes in Red. Wordss are bound at load time and after that only when `bind` is called (`collect` calls it).

[14:55:59](#6uPnMHwl0PxsCjvg-lJqEzw2yCLYvTmRE4g2vwGCxow) <hiiamboris (NOT THIS ONE)>:
In another language you would do something like:
```
c = collection()
foreach element series [c.keep(element)]
```
You would reference `keep` defined by `c` object. If you tried `c.keep` before creating object `c` with `keep` in it, it would error out.
In Red words carry their context of definition `c` with them, so prefix is not needed most of the time. But the error condition is still applicable.

[14:56:29](#RrGuQ8V_1edQpJZAdSgtM3MNg7-QYqn5Tio7tH3a5N0) <hiiamboris (NOT THIS ONE)>:
* In another language you would do something like:
```
c = collection()
foreach element series [c.keep(element)]
```
You would reference `keep` defined by `c` object. If you tried `c.keep` before creating object `c` with `keep` in it, it would error out.
In Red words carry their context of definition `c` with them, so prefix `c.` is not needed most of the time. But the error condition is still applicable.

[14:58:25](#qdqSB1c2LcR8P6ip1MyaraMBFqk7UF-hR3TAI_VY1ts) <hiiamboris (NOT THIS ONE)>:
`keep` in your block is the same as `system/words/keep` (which is unset).

[18:50:22](#5JCNtyrhxiohbZabNMwk2vzqOs15akSGh8k1zOAmEwI) <greggirwin (Gregg Irwin)>:
@lylgithub2021 thanks for the console use case. As @hiiamboris notes, when you start creating dynamic code, you may wander (unknowingly) into the parallel universe of binding. It's stepping off the lake's ledge and plunging into the depths. :^) 

Red uses "definitional binding", meaning that *where* something appears in code (where it is defined) matter. Here's your code, with the block moved inline with `collect`. By doing that, Red knows to bind `keep` so `collect` can use it. Look at the source of `collect` as @hiiamboris suggested.
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

probe filter Ì†ΩÌ∏ñtring? [1 2 "a" 3]
```

[18:59:44](#ELNWNzJV4BaLQwRPClsSVoLifIflehQeAwCSzojvbdo) <hiiamboris (NOT THIS ONE)>:
@greggirwin you just made his code very inefficient Ì†ΩÌ∏â

[19:03:49](#JbBAWTGqicfGTkx0mUpDyyZTm0_FFVNls-_NJtN-rXI) <greggirwin (Gregg Irwin)>:
As I am wont to do. :^) I just wanted to show that dropping it inside, the "where" part, is important to Red. Besides, if I don't write slow, inefficient code, what are you going to do with all your free time?

[19:04:39](#nECEo6jrmHMSjwyC9B5CKCPdEc-9JL1p7EtHBRFvly8) <hiiamboris (NOT THIS ONE)>:
Ì†ΩÌ∏É

## 7-May-2021

[3:04:27](#FxoZHZPFdmEOrqmI99ftpelJVnKLbhMUkfyI3VCCzGo) <lylgithub2021 (lylgithub2021)>:
Thank you   @hiiamboris  @greggirwin  so much for these info!! Would you please provide with more efficient method to my code?

[6:30:04](#SN5G0Clf58bMa6kEKwa1Xp2OdflwZCTFSe2QpBO5BLQ) <hiiamboris (NOT THIS ONE)>:
Move 'collect [' the lines above.

[6:30:20](#IbAfBs2GtVIFXPwfX1GC5BBUk9p6EEUCaTzsm9QgpOE) <hiiamboris (NOT THIS ONE)>:
Three lines* 

[6:31:06](#4h3yMGUf_1wGiaEQp1B-sF2_t6MSwvWR_3_r6B63YV4) <lylgithub2021 (lylgithub2021)>:
Ok, I get it. Thanks again!

## 9-May-2021

[11:22:54](#mvzv6r-YPjgamA6kiRNy5MXsP4HWVkP03p8bFOBQkvY) <ams02468 (ams02468)>:
hi guys how i can outeput value something  like this 
```
echo hi >test.txt
```


[11:28:08](#1R4Xc8TEePptSXuqqgyLrBlLqnKJ04YwS4KlIFRLQe4) <hiiamboris (NOT THIS ONE)>:
`call/shell`

[11:42:51](#Xmks64cWilPsE8fQ_gZvr92GRAEM8bnS6qol0qvOVUE) <ams02468 (ams02468)>:
``` 
st: ask "enter code :"
``` 
i need output st value in text file 

[11:43:34](#nd0IORem-6doHh8f_vWNshfbeFOpqS7aAljXNiT2jHs) <hiiamboris (NOT THIS ONE)>:
so write it to the text file

[11:45:14](#J1XBqK75Abx6e5bZPuPXeatYpTiLDH7gOinj0aDcFgo) <hiiamboris (NOT THIS ONE)>:
https://www.red-by-example.org/#cat-o02

[11:47:50](#p57UQT9v7Dr-HLHqGpdRnE-p2ldi_sG8kLMXvkx5Fxs) <ams02468 (ams02468)>:
thx

[12:38:44](#Z2tZ26WcDWuyjgflgYo92j-sSQ9Twae-XrvHifSbxHk) <ams02468 (ams02468)>:
Hi, I want to enter this path
```
C:\Users\userprofile\
```
but as you know, the userprofile folder is a folder with a variable name. How can I enter this folder? 

[12:44:47](#dhNO-57Z8RGlNXh6I4CJo7YoiT-MYouRK515mpbgmRI) <hiiamboris (NOT THIS ONE)>:
https://www.red-by-example.org/#cat-s05

[13:03:43](#WISTeE67wy1xRtzUlBLY7XEoeh6z5jul1AMvolopVkk) <ams02468 (ams02468)>:
I want to use Windows special directories / shortcuts (like% TEMP%)? Does red have such a thing? 

[13:03:55](#Gk9KY6jFVww1w8nMuhz2KS0BTsYG7Gsxy8fi6_Hq-Ao) <ams02468 (ams02468)>:
* I want to use Windows special directories / shortcuts (like% TEMP%) Does red have such a thing? 

[13:12:35](#RM58Lwwgx0XND9d-j1ad5zaTj07t7eqt4P53ph7Po54) <hiiamboris (NOT THIS ONE)>:
yes, I just gave you the link

[13:17:07](#q3TbvkeHVbQw1ATfHt8QJQCP_gbaVbT_NbREWvZyNBk) <ams02468 (ams02468)>:
i find nothing to help me

[13:20:08](#4j-eJAStO52ld3LYzF1qvUifJDOsurz0vy39YxBtcGM) <hiiamboris (NOT THIS ONE)>:
those special directories are called "process environment"

[13:39:35](#fJwDz9Ju8WCTHHvGUw1zwpKU0Dc15RXM22YU9bSLOhE) <ams02468 (ams02468)>:
those special directories are called "process environment"

[14:35:17](#Vs4_iQi0KxY8TC7xXRee6TnHjmnrj2rWXixZcoJrG08) <hiiamboris (NOT THIS ONE)>:
I don't think a function to replace environment vars in any path exists in Red runtime, but you can write your own with little effort

[14:38:27](#4VRTxLsxZn8EoDiZP9aw6XEIDz41qT-RapGvOvwoHmI) <hiiamboris (NOT THIS ONE)>:
Question is, do you need it? Shell should do that on it's own.

## 10-May-2021

[5:18:04](#SQxSqungvJcYq21zGPQv5f3IN8QVkZ_qp9UCzCxNdF0) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
@ams02468 
```
>> get-env "userprofile"
== "C:\Users\Oldes"
```

[5:18:59](#GW5dAa_m2Xb6sFISs7ONnw7dTwhgLKt7c12iOea8F34) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* @ams02468 
```
>> get-env "userprofile"
== "C:\Users\Oldes"
>> get-env "TEMP"
== "r:\Temp"
```

[10:17:43](#uR431HQcLAMXi6fARU7sGNObVKMwc3jEyRt-e4sgvSw) <ams02468 (ams02468)>:
guys  sources file link is removed? 
 	[title](https://static.red-lang.org/dl/auto/red-latest-source.zip)


[10:18:10](#kLWWB_xXZ3SqgpbSZrrFqEIl-6qz89bFjeYrPiJJw6w) <ams02468 (ams02468)>:
* guys  sources file link is removed? 
 	[Sources](https://static.red-lang.org/dl/auto/red-latest-source.zip)


[10:20:45](#mvGcShxMujKFGJ8XkQ5RAALWLPhIP_NBVu_cjMCD7iY) <hiiamboris (NOT THIS ONE)>:
Yeah, I think they decided to discontinue it. Just download it from Github directly.

## 11-May-2021

[7:21:29](#F-ICDgV6FAA7rs450aefNaTIB4xCz3-ogtz1-ALW-W4) <lylgithub2021 (lylgithub2021)>:
On console of an operating system (windows for example), is there a way to run a Red expression, such like 
```
E:\Red> red.exe "add 1 2"
```

[7:50:27](#Z98EzXBrp6iFWaictSXUFQVV0bjlKpjR_dMBgwqEc2U) <hiiamboris (NOT THIS ONE)>:
yes: https://gitlab.com/hiiamboris/red-cli/-/tree/master/mockups/reddo

[7:55:53](#jyAPESuGHa4W7lA9W4WmIsx5YWA6hzoa-Pt88100S7A) <hiiamboris (NOT THIS ONE)>:
```
>reddo "probe 1 + 2"
3
```

[7:58:19](#LEBKMUe9vlpnXzAUUMU2ZOGio0IsCqt8Za2pvmBJJF4) <hiiamboris (NOT THIS ONE)>:
I should probably make it accept multiple arguments though

[9:52:07](#mGWJMwFKzMXzhsXtCo6amL10yFG7GWPoI2MFSlwi2x4) <lylgithub2021 (lylgithub2021)>:
Good job! Thank you. @hiiamboris 

[10:15:07](#Ty0ygFLoo1rAzlm7_xnGp6P2mQIF8uu6vurjrW41Pd0) <lylgithub2021 (lylgithub2021)>:
@hiiamboris  And if this can be used by `Emacs`? Or is ther a `red mode` for Emacs?

[10:52:20](#Mxk4VqSLZY4RWXnrQoVJhghGZLZTVXz0Roki0ToV5hw) <hiiamboris (NOT THIS ONE)>:
I never liked emacs, so no idea.

## 12-May-2021

[12:31:55](#ItNNv-8MWJv0wmqgfm9JauSd_YPycjrZ6knGeF7ihoI) <meijeru (Rudolf Meijer)>:
> Yeah, I think they decided to discontinue it. Just download it from Github directly.

Direct link to sources.zip: https://github.com/red/red/archive/refs/heads/master.zip

[15:34:05](#LBleO9ZzNWxjBpeB31oVTzZ5ZQL_gK3kLl9g5PQCJTI) <ams02468 (ams02468)>:
> Yeah, I think they decided to discontinue it. Just download it from Github directly.

Direct link to sources.zip: https://github.com/red/red/archive/refs/heads/master.zip

[15:36:26](#I-TUG07vlJhAYXE04hUZV1RVBXXzrvZqC738NvGv8WE) <ams02468 (ams02468)>:
hi guys i have simple code example
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

[15:43:06](#rVUlsIkl8_Ad6x__-P_QdB9y5Ohs8BvujNCVRhEKoAo) <hiiamboris (NOT THIS ONE)>:
use `split`

[17:27:53](#e3BMoj2TaH1A7-sVPHwTK1GT8d3BWcrKPYA4c3-8ceg) <greggirwin (Gregg Irwin)>:
And maybe `copy/part` after splitting.

[20:16:54](#Usido9Q_6ZJi1k8_LfoX29mXX2xS6DvkLGn_6OAVHOs) <ams02468 (ams02468)>:
And maybe `copy/part` after splitting.

[20:21:40](#-M8pwdDY1i0RHE1IWktiX05W1zTvotdhdqNmQtUmbGo) <ams02468 (ams02468)>:
how use 'split' for two type string for example 
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

[20:22:13](#cM7yXBzf45H0_RNY-DAf7QiMLmAqVtIYUchPm8nGIIM) <ams02468 (ams02468)>:
* how use `split` for two type string for example 
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

[20:35:21](#Ry4C5Dk6F_MujK675nL11lvH5YcuMxSwOv4YEqFzvVA) <hiiamboris (NOT THIS ONE)>:
`remove` them

[21:32:14](#-PFo-wnFCeWq6juTHlDLWKiaXJoyc813VADB4FP46eY) <dsunanda (dsunanda)>:
@ams02468 It's hard to advise, as it is not clear which parts of your data matter - is line 1 the blank line? Do the leading spaces matter, or can they be lost? Do you really want lines 3 - 5, or do you want all but the first and last?  etc.
Under one set of assumptions, this works:
```
b: next next split trim/tail load a newline
repeat n 3 [print b/:n]
    2.test
    3.test
    4.test
```

[21:32:55](#Sq12LTBasqcmUu1dJq6AShz_pmjmJudantH9Qa7Knj4) <dsunanda (dsunanda)>:
* @ams02468 It's hard to advise, as it is not clear which parts of your data matter - is line 1 the blank line? Do the leading spaces matter, or can they be lost? Do you really want lines 2 through 4, or do you want all but the first and last?  etc.
Under one set of assumptions, this works:
```
b: next next split trim/tail load a newline
repeat n 3 [print b/:n]
    2.test
    3.test
    4.test
```

[21:51:12](#CJn7tDz-sBfy7m4POu2df6sNoi2LsjOQOyVk4khpty4) <zentrog>:
ams02468 (ams02468): if you `load a`, you will get a string like your previous example with just a single pair of wrapping curly-braces

## 14-May-2021

[6:37:22](#uqO0qdrQw4viZ5BdcHUglEhz4FFWr_sWk4t63RQGnfE) <ams02468 (ams02468)>:
thanks guys for help

## 15-May-2021

[8:33:30](#4FfiCpHnyEmcq0lj963f4XIofwuGOSdrgYIK70Mg2vQ) <m_a_j_ch_rz_a_k_twitter-58c68ab8d73408ce4f5041e2>:
Hello, is there anything like "async" in Red? 

[9:19:48](#_iV48SuYE1uuje4d5H3LDPaIlIr16P60ViAT-03dX2c) <hiiamboris (NOT THIS ONE)>:
No concurrency yet.

[10:17:04](#knOB5PUS3bOk8Y0F9sFaVGIouvSU4nc9JVIPSFHeNgM) <lylgithub2021 (lylgithub2021)>:
I have a Red script in which there is only one command: `print 0`. Then, I run this script on win7 console by `red --cli test.red`.  `0` is not printed on console. Why? And how to get  a Red print on console?

[10:20:26](#F5hdepI9bNBV7sJaDMq30K_53W-gwLdNhGnINdVnTlU) <lylgithub2021 (lylgithub2021)>:
* I have a Red script in which there is only one command: `print 0`. Then, I run this script on win7 console by `red --cli test.red`.  `0` is not printed on console. Why? And how to get  a Red print on console of an oprating system?

[10:31:07](#2PoB25WCfqm85zab9APmq8e4x9L9syZdxJ6SSrzZGgQ) <hiiamboris (NOT THIS ONE)>:
never heard of this problem
```
>red --cli 1.red
0
```

[10:32:30](#S7Fr6Sixu4UpHD21aez-AuXocH3dtPrYM37V7cm-maE) <lylgithub2021 (lylgithub2021)>:
[![image.png](https://files.gitter.im/570387cd187bb6f0eaddec47/LI8o/thumb/image.png)](https://files.gitter.im/570387cd187bb6f0eaddec47/LI8o/image.png)

[10:33:03](#tCD-K-Fg58_QpsAKIYYY8bKWhtsjULlDf4UFAQi2T7Y) <hiiamboris (NOT THIS ONE)>:
and `type test.red` output

[10:34:25](#9XydDKBUkzyhVK9_l2puBRGidpUQBsjR0cHHXhdZ7Jo) <hiiamboris (NOT THIS ONE)>:
also Red version from `about`, and W7 `ver`

[10:38:06](#2Vg_CpuGKuEO2oOOj00u4o1wfuCI3XML3KvqGyXJ4gY) <lylgithub2021 (lylgithub2021)>:
So So So Sorry. I got wrong script! Yes, it works all right. Really sorry wasting your time!! 

[10:39:21](#vaS4hcf1uLnznNgLegLCvjyh-xjPdXPQQCzgkbSuXaQ) <hiiamboris (NOT THIS ONE)>:
no problem :)

[10:48:58](#0ZUyNm4ykEaIz33oMFpWpeNbm4hrSQdQz6SNnWAIjRE) <lylgithub2021 (lylgithub2021)>:
I want to limit input of a GUI `field` that only digits(`0,1,2,3,4,5,6,7,8,9`) and `ctrl+c`,`ctrl +v `(copy/paste in windows) are permitted by using `parse` which needs something like `digit: charset ["0123456789.]`. I wonder how to put `ctrl c` and `ctrl v` into the variable `digit`.

[10:49:48](#_byYQSxxQWDYtNKEggbAQNjx6aXvPBO94jmq0gSbsGA) <lylgithub2021 (lylgithub2021)>:
* I want to limit input of a GUI `field` that only digits(`0,1,2,3,4,5,6,7,8,9`) and `ctrl+c`,`ctrl +v `(copy/paste in windows) are permitted by using `parse` which needs something like `digit: charset ["0123456789]`. I wonder how to put `ctrl c` and `ctrl v` into the variable `digit`.

[10:51:22](#Qvlrt7D2V2wPnL3n9OHRYkQ75RKv80mCBTRdarfFFbc) <lylgithub2021 (lylgithub2021)>:
* I want to limit input of a GUI `field` that only digits(`0,1,2,3,4,5,6,7,8,9`) and `ctrl+c`,`ctrl +v `(copy/paste in windows) are permitted by using `parse` which needs something like `digit: charset ["0123456789"]`. I wonder how to put `ctrl c` and `ctrl v` into the variable `digit`.

[10:58:30](#LJ3Dl1Qp7m1DtuRj9bpaTltANbSEQNTF28xdHKXo024) <hiiamboris (NOT THIS ONE)>:
```
>> view [field focus on-key [probe event/key]]
#"^A"
#"^C"
#"^V"
```

[11:00:18](#QF5XmzAFvR4tOU1xK5RuWBHC9ucPoLcLdrkzMAXncGc) <hiiamboris (NOT THIS ONE)>:
Ctrl+letter produces chars #"^A" to #"^Z" that have ascii codes 1-26

[11:05:16](#e_V8Qs40Pmv1Zd2B19GgnAAcPD_z1JqM68RyJXG7XQY) <hiiamboris (NOT THIS ONE)>:
Something to start with: `system/view/capturing?: yes view [field focus on-detect [all [event/type = 'key not find "1234567890^A^C^V^X" event/key 'stop]]]`

[11:24:39](#p4NyTZeyUZXDc1JN7c4ih-ppR9dQQeHVOyeBLyI-PVY) <lylgithub2021 (lylgithub2021)>:
That's just I need. Thank you so much for these very useful  info!  And I tried `view [field focus on-key [probe event/key]]`, fund that `ctrl a` and `ctrl shift a` are the same:  #"^A".  Is there any way to distinguish them?

[11:24:55](#UY1YqmPcpU7OT_mmmPohZtOBM7udE9RuuNXDZnuC-lo) <lylgithub2021 (lylgithub2021)>:
* That's just I need. Thank you so much for these very useful  info!  And I tried `view [field focus on-key [probe event/key]]`, fund that `ctrl a` and `ctrl shift a` are the same:  `#"^A"`.  Is there any way to distinguish them?

[11:29:42](#o0jyx0KK7rKHYlhCHoTKgUUv-q5_9fNEhMvPuICUGMg) <hiiamboris (NOT THIS ONE)>:
`event/shift?`

[13:08:17](#yJK4nSmS1FKQe2l5y_DBzIGR7OuvzGT46Hh0UCKQdhM) <lylgithub2021 (lylgithub2021)>:
`view [base focus on-key-down [if all [event/key = #"1" event/shift?] [print "Yesss!"]]]` is a correct way. Why is `if event/key = #"!" [print...]` wrong way?

[13:22:41](#DVEExAMGSvpoSS-l9TguOla4t9KnTGYLgVXk9R0tOKE) <hiiamboris (NOT THIS ONE)>:
because `key-down` and `key-up` events do not translate keys into characters

[13:37:41](#NM4k3dJ5AxbG9nWBaVZTLWp6i_BTFR_xevJLoVJwih0) <lylgithub2021 (lylgithub2021)>:
because `key-down` and `key-up` events do not translate keys into characters

[15:29:07](#op_5d1siyOXCuqduUKv2g8URANqVnOAsEmDjzYLnLyk) <greggirwin (Gregg Irwin)>:
Looks like a good time to start a keyboard-handling wiki page. Anyone game?

[16:14:46](#D-N_NrcbARgGjYlXu57BtCO9d0FIhaUHqDNqSMrep20) <lylgithub2021 (lylgithub2021)>:
Thanks to  @hiiamboris  and other guy's help,  I'd like to sumarize as this: All keys(or key-combination) belongs to two catagories: 1)those who have `ASCII value` or `Red special designation`(ie.  #"^C", #"^(back)" that can be directly handled by `event/key = ...`; 2) those without ASCII valve or  Red special designation can be handled respectively in `key-down` or `key-up`  event. Thank you all!

[16:21:47](#SDVkH7P9HJnUXnS-WYT6v_OlZiOiBjaXJ2TJw6wcKcM) <hiiamboris (NOT THIS ONE)>:
https://docs.microsoft.com/en-us/windows/win32/inputdev/using-keyboard-input here's some background if you're wondering

[16:22:32](#R6YbrrOTkJw654noAJ9oOBMHRqedOKnaiyYzSpAayvo) <lylgithub2021 (lylgithub2021)>:
Many thanks again!

[16:54:32](#9k3qhq2J-JTTKxbZOxNFfQ8nToGO3U8EZnqcrAeiByA) <greggirwin (Gregg Irwin)>:
https://github.com/red/red/wiki/%5BNotes%5D-Keyboard-Handling

## 16-May-2021

[14:09:47](#zHqi7dKWTAP1L0vXc40bAZp_HRY47jun-NtCsuyCq40) <ams02468 (ams02468)>:
Hello everyone, I am working on an identification program. I encountered a problem with part of the code. This is part of the program 
```
 a: read https://ipwhois.app/json/8.8.8.8
print a
call/console "pause >nul"
```
The output you need to display should look like [this](https://ipwhois.app/json/8.8.8.8)
But the output is as follows
```
{"ip":"8.8.8.8","success":true,"type":"IPv4","continent":"North America","continent_code":"NA","country":"United States","country_code":"US","country_flag":"https:\/\/cdn.ipwhois.io\/flags\/us.svg","country_capital":"Washington","country_phone":"+1","country_neighbours":"CA,MX,CU","region":"California","city":"Mountain View","latitude":"37.3860517","longitude":"-122.0838511","asn":"AS15169","org":"Google LLC","isp":"Google LLC","timezone":"America\/Los_Angeles","timezone_name":"Pacific Standard Time","timezone_dstOffset":"0","timezone_gmtOffset":"-28800","timezone_gmt":"GMT -8:00","currency":"US Dollar","currency_code":"USD","currency_symbol":"$","currency_rates":"1","currency_plural":"US dollars","completed_requests":40}
```

[14:12:22](#cyWv1Cs5qlHEdr4Gm9bu8k-fz9TRtYuo3t7JGN1vUV8) <ams02468 (ams02468)>:
* Hello everyone, I am working on an identification program. I encountered a problem with part of the code. This is part of the program 
```
 a: read https://ipwhois.app/json/8.8.8.8
print a
call/console "pause >nul"
```
The output i need to display should look like [this](https://ipwhois.app/json/8.8.8.8)
But the output is as follows
```
{"ip":"8.8.8.8","success":true,"type":"IPv4","continent":"North America","continent_code":"NA","country":"United States","country_code":"US","country_flag":"https:\/\/cdn.ipwhois.io\/flags\/us.svg","country_capital":"Washington","country_phone":"+1","country_neighbours":"CA,MX,CU","region":"California","city":"Mountain View","latitude":"37.3860517","longitude":"-122.0838511","asn":"AS15169","org":"Google LLC","isp":"Google LLC","timezone":"America\/Los_Angeles","timezone_name":"Pacific Standard Time","timezone_dstOffset":"0","timezone_gmtOffset":"-28800","timezone_gmt":"GMT -8:00","currency":"US Dollar","currency_code":"USD","currency_symbol":"$","currency_rates":"1","currency_plural":"US dollars","completed_requests":40}
```

[14:16:57](#nArM7udnXe1tj1XOJYcpe-XCDlcnvjiu980l_CULPPc) <hiiamboris (NOT THIS ONE)>:
what you see on the site is not json per se, but converted into something readable

[14:17:52](#0sqjpczFDijTiRwlifO8aHaK60mMOAUT1zN5Kwb1agM) <hiiamboris (NOT THIS ONE)>:
replace `,` with`^/` and `:` with `:^-` for a start

[18:00:25](#x-yjC4bJiDWVERX0vgRPXJKFQh8c1aLDUT-ql_Y05B8) <greggirwin (Gregg Irwin)>:
Looks like JSON to me: `print load/as read https://ipwhois.app/json/8.8.8.8 'json`

And the output @ams02468  posted seems to match the output in the link. What am I missing?

[19:14:24](#_SbuBqnxRKSemnEDG_I88g6hCF0RtrSf83TiCzijn5s) <gltewalt (Greg T)>:
Nothing, it just isn't formatted "correctly" if not loaded as json.


[19:15:55](#Klnuug1UjYuXf-Nz712jWWiNVckrfi0aFSsBS9onjyM) <gltewalt (Greg T)>:
`a: load/as read https://ipwhois.app/json/8.8.8.8 'json`
`print a`, `print a/city`, etc


## 17-May-2021

[8:50:25](#kGJoUY5wgW0mEgwZRizccr1jU64Ell9CL9uKKlJZBsY) <m_a_j_ch_rz_a_k_twitter-58c68ab8d73408ce4f5041e2>:
Hello. Is is possible to run shell command from Red and don't wait the the response but attach a function which should be used when the result would be ready?  Like "then" in javascript. I know that we could use the IO branch but is there other option? :) 

[9:01:06](#cnrFvE50bUMwUVDqoRNImsBOgq2RU6H30OAvdI-WLjc) <hiiamboris (NOT THIS ONE)>:
You could divert the output into a file and read it later

[9:13:41](#ajXHzOHLs0b-DxpF9qLQeBZpcs1xhZhUzEVmavqGMvE) <m_a_j_ch_rz_a_k_twitter-58c68ab8d73408ce4f5041e2>:
Hehe true. A little bit hack'y. Is it so complicated to add "then" in Red? I am just wondering. Maybe by adding libuv ?  That one lib could solve problems with web server, client and IO stuff. 

[15:18:51](#tafITJhEwfXiLPp_YZF3nN3yOULSjArZ3r_es5IF_gU) <hiiamboris (NOT THIS ONE)>:
We don't want a lot of dependencies.

[15:24:12](#Zo5XxKakUP-UoyRZnoHTDhgOwBh9bVjj_lPMVw6YOaA) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
IIRC libuv and other event libraries were source of inspiration to implement an event loop? But that was a long time ago and even related to Rebol 3.

[17:40:09](#RflNivqNj0q-yReJlnp47VZx4et1oukUfRko3qMqq-g) <greggirwin (Gregg Irwin)>:
> A little bit hack'y.

Less performant, perhaps, but why do you think it's a hack?

> Is it so complicated to add "then" in Red?

Yes. But let's start with your use case. What is your goal?

> I am just wondering. Maybe by adding libuv ? That one lib could solve problems with web server, client and IO stuff.

Technically one lib, but...

1) Add CMake to our toolchain to build it. And learn it.
2) Add static linking of object files from other compilers.
3) Build libuv.
4) Design Red's I/O, and map that to libuv. If we have mismatches in what we want, adapt that to libuv's model.
5) Stay in sync with both CMake and libuv.

The upside is that it's well known and battle tested. If there's a shared library version writing a binding for it should be doable for those who want to use it. But it looks like the project doesn't do binary releases. The downside is that our own I/O work is in really good shape and quite far along. At this point, moving to libuv would take more time than finishing it.

[19:13:31](#VINaQeYTNvtpyGItoxZm34ryvrVh0yhhV34g1GTSM_k) <rebolek (Boleslav B≈ôezovsk√Ω)>:
#2 would be amazing.

## 19-May-2021

[1:05:30](#cXqlIEKFYOCm3P13Bm0LeHeah6-JQgxqvl_WXv0n5lM) <ams02468 (ams02468)>:
Hello everyone, thank you for answering our previous question. Now I have another question. This is part of example script. 
```
;a = Binary codes of executable file 
a: {
;binary 
}
write %test.exe a

```
As you know, binary code takes up a lot of space. Does anyone have any idea how to prevent this code from cluttering the script? 

[1:06:36](#-k-dGFwlcbW3alnUgqwxpVc5_zdAtQVepcH1IEJn7Bs) <greggirwin (Gregg Irwin)>:
You can put it in a separate file and `#include` it.

[1:07:06](#mO1pHlHR477CldOSdgepjk6pu5Uz1viK-pKaRq298aA) <greggirwin (Gregg Irwin)>:
But if it's binary, be sure to use the `binary!` type, not `string!`.

[1:41:11](#Kw3ZKV0IeQL8KupHnbHx-6_Y48vBf9Fg2f9PPqXaUz8) <ams02468 (ams02468)>:
I'm looking for a way to insert the required exe file into my program, something like sfx, which can be extracted from the program after executing exe files. Now the only solution I know of is to read binary files with the `read/binary` command. Then save them in a variable. Then write them as an executable file

[2:16:40](#_jsrWNp2ziYJKS93qOkO9EbFjHGK2IZ9xYwMnUvlKgA) <greggirwin (Gregg Irwin)>:
Yes, there's no `#include-binary` at this time. Ladislav had that for his R2 version, which was useful at times. In Red you need to `read/binary` the file, then `save ` the resulting binary value in a new file so you can include it. 

[2:49:44](#VgklIqktXK-jTgn9HUbJbDqS32jAJjDHaNUtUJoN8E0) <ams02468 (ams02468)>:
Thank you very much 

[5:56:51](#QH2xOQeulcDjq1q2kY4-5asTyaixT1RdPi84cuM6rnw) <hiiamboris (NOT THIS ONE)>:
`#do keep read/binary %file`

[16:58:49](#TONwgNwZIP0bVqw90bVgNt1Kag33bv4hhWDIIOSIujA) <ams02468 (ams02468)>:
Hi, I tried to convert this code to with the -r flag as test
```
#include %./red/environment/console/CLI/input.red
ams: #include-binary %rz.exe

zz: request-file
write %ttt.exe ams

```
but I got this error 
**
Compiling c:\Users\username\Documents\red\compress.red ...
*** Compilation Error: undefined word request-file
*** in file: c:\Users\username\Documents\red\compress.red
*** near: [request-file
    write %ttt.exe ams
**


[16:59:49](#p2txTcEtwm6DiPbpAPIBCsbl0p4iod5pkxwAeepTTJM) <ams02468 (ams02468)>:
* Hi, I tried to convert this code to with the -r flag as test
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


[17:01:47](#FJJNCi7MKONuFt5l7U6XFzA95hXNqt7PLsBDE8j65gc) <hiiamboris (NOT THIS ONE)>:
you need the View module for requesters

[17:01:53](#ZdArlnO0odSKI315qg-vpfmnG9mg36OjRg6opzt_ECg) <hiiamboris (NOT THIS ONE)>:
`Red [needs: view]`

## 20-May-2021

[1:03:08](#ZBin2zOBO9EFBQeYJVmSSh9M3IQHxKgPwso08Jf8JV8) <ams02468 (ams02468)>:
Does red have anything like the `request-file` command to save the file?

[1:25:58](#Zz0dY9xU0JNSNDcqBK8eIa_jJHjwEa-QFRaZmFitapU) <ams02468 (ams02468)>:
path

[2:14:00](#ZbVcC1u22cx8nZ7Wf49ETLGYT6ATnsS78I9CRRbOZuM) <greggirwin (Gregg Irwin)>:
`? req` will show you what requestors are currently built in. There are other experiments out there as well.

[2:22:20](#CpK08waD6m3Kx8pzatV11CQw_-A05Gs38b-oKDuWKB0) <lylgithub2021 (lylgithub2021)>:
My question is: where to find the file "input.red". I just have red.exe from the red website.

[2:23:47](#cMTQYjwNLkCVtv-CCw5SrtvNjPV6SFEwVeuLOjugZFI) <greggirwin (Gregg Irwin)>:
In %environment/console/CLI/ of the Red source.

[2:27:20](#8V7tTcSnIf70j_L72m7JJiYO942bx03KT9eaeFkgfOc) <lylgithub2021 (lylgithub2021)>:
I searched my C disk and the folder which contains red.exe, not finding  `input.red`.

[2:30:55](#qsglRt0UdxdC083vWdufczGg3Hd_wgLW1q5i7PGrl5A) <greggirwin (Gregg Irwin)>:
You need to clone the repo or look at the source on github. You can also download the zip of the source so you have it all. https://github.com/red/red

[2:35:33](#iEp_RDd8QwKwGXr24Pl5f0xZGKDZiRkX1cL6M1Bs8-U) <lylgithub2021 (lylgithub2021)>:
Thank you very much!! @greggirwin 

[2:44:19](#r9fCgTlryCi271c4u76dW31e_idOR9ztPnEf33MSppg) <ams02468 (ams02468)>:
Does red support SaveFileDialog? 

[2:44:30](#JYjACruxfuT3V_NoHFs_pYmRxsYyufWs1-NwRJJzITI) <ams02468 (ams02468)>:
* Does red support SaveFileDialog?  

[3:11:16](#pfvoIe2jov4a9Gn2DuFOVY_Z-vO6ckMWM6gk97ONhyg) <greggirwin (Gregg Irwin)>:
@ams02468 yes, see my message above.

[3:36:42](#06utp9mkwstUp-L78CL8FyWUhdnrlIbXCOciNphJzm0) <ams02468 (ams02468)>:
@ams02468 yes, see my message above.

[3:37:09](#FhLtpjsH9MzWI_trih3IVfwLVIvv8ZTZsPYakeo1CKM) <ams02468 (ams02468)>:
* Yes I saw the above message and checked but what I wanted was not in red I found these 3 commands `request-font` `request-dir` ` request-dir` but what I need is something like [this](https://www.google.com/search?q=SaveFileDialog&safe=active&client=firefox-b-d&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjjq7mSqdfwAhXaUhUIHasPDlgQ_AUoAXoECAEQAw&biw=1536&bih=768#imgrc=fox8mlb32raPVM)

[12:45:46](#6Kcy_Qod1hNTRpjOfw05A5ERYmFKhtqfKvIvXyDf06Q) <m_a_j_ch_rz_a_k_twitter-58c68ab8d73408ce4f5041e2>:
Hello, how I can use gui on Linux? I have "view has no value".

[12:47:26](#hT28a0QmSOsJ6l63r2eETvRXKndd09-Tq-JnMSxITlA) <hiiamboris (NOT THIS ONE)>:
use a nightly build

## 21-May-2021

[17:04:16](#sHY2hAhz13_0VdGNOITCbsIVZfGxp45b3UM9w3MVsrE) <ams02468 (ams02468)>:
How much volume can be placed in the `#include-binary` command?
I tried to put a 1GB file in it, but I get this error for compile 
```
Red Compiler Internal Error: Script Error : Not enough memory
Where: emit-string
Near:  [str: to string! str
either
]

```

[17:19:06](#KlNGnJA3gMqZlS3gHOiia5SQVJdgnwiuEUH7hDZVC1Q) <hiiamboris (NOT THIS ONE)>:
depends on data itself, as strings use different encodings internally

[17:19:33](#F07CLuNBhn6o2KR9KI4A5Wn2xSMh_moTT1Kzkj-_Hrw) <hiiamboris (NOT THIS ONE)>:
* 

[17:20:28](#yBtklZ9GT0hgsetmCSMJ85gqr1heZtaDzji8vF7altg) <hiiamboris (NOT THIS ONE)>:
To think of it, no idea.. Depends on how compiler uses it (:

[17:21:25](#V_iFXdP8GspK0ewRmlItpZn1WPBi4hL_pJWWVQXSOPA) <hiiamboris (NOT THIS ONE)>:
Let me guess. You wanted to bloat your exe with random junk to make it big and solid looking? Ì†ΩÌ∏É

[18:04:24](#qmUD2aXV093QQTeyiXjXj5TTv0ZQDctTX633TpyMHEw) <ams02468 (ams02468)>:
No I'm trying to make something like sfx

[18:05:57](#zY5oO4-Uv0SwIZFuHOt4cG0hh8pnA95ll0pYMIDbEhQ) <ams02468 (ams02468)>:
Put the compressed file with the executable file inside an executable file 

[18:06:37](#EuDEqCWdbDXp3RwPpRfWHa1d2J5Ez_dW4ExQxv8eikA) <hiiamboris (NOT THIS ONE)>:
Ideally then you should just append the binary payload to the already compiled exe.

[18:07:17](#7m0iLTlvFiIrbHxQaZzaHqoTO1xyAY956pViWrSTOqI) <hiiamboris (NOT THIS ONE)>:
Still, Red being 32-bit won't be able to decompress 1-2GB binaries

[18:08:41](#vkw0OSuNm4aDfGfNh0PZbmDlUKqMoGRJ-qL847fqlKo) <hiiamboris (NOT THIS ONE)>:
* Still, Red being 32-bit won't be able to decompress 1-2GB binaries (until full I/O with stream compression/decompression)

[18:17:54](#60koI3PIPse6AqaImpYK82h1xKvv6WclqqF6AVLsYoo) <hiiamboris (NOT THIS ONE)>:
One thing you can do is decode that payload in chunks, e.g. 100M each.

[18:18:41](#Ud-7iu9csypOSGQ-a3NJVkrxZbxbRN8PQNyjDVanGzM) <hiiamboris (NOT THIS ONE)>:
Next limit will be max file size Red can read or write, which I haven't tested.

## 22-May-2021

[8:27:17](#EQuSh75aHnCfI_nS2hZW6DEoXGg8XeJXgFPHBb4M268) <lylgithub2021 (lylgithub2021)>:
Next limit will be max file size Red can read or write, which I haven't tested.

[8:33:18](#aXplOEVdE6RAJkX5KNY_lMTc4a7GM5SnpZPK2PGPaec) <lylgithub2021 (lylgithub2021)>:
I have two files named "`1.red`", "`2.red`" in the folder `%./0/`.I tried to get them with relevant path like this:
```
collect [
foreach i ["1.red" "2.red"] [keep %./0/(to-file i)]
]
```
`[%./0/1.red %./0/2.red]` is expect, but what I got is:
`[%./0/ %./0/]`
Why, and how to deal with this?

[8:34:24](#Xzqz4uZ7gxenJeOGKGM5f2zgJvSBisZALQr-tYLdNHo) <lylgithub2021 (lylgithub2021)>:
* I have two files named "`1.red`", "`2.red`" in the folder `%./0/`.I tried to get them with relevant path like this:
```
collect [
foreach i ["1.red" "2.red"] [keep %./0/(to-file i)]
]
```
`[%./0/1.red %./0/2.red]` is expect, but what I got is: `[%./0/ %./0/]`
Why? And how to deal with this?

[8:34:41](#DLD-wHxwW5jekY23pFdYkz-pPcMioP4ltybRpDBJINQ) <lylgithub2021 (lylgithub2021)>:
* I have two files named "`1.red`", "`2.red`" in the folder `%./0/`.I tried to get them with relevant path like this:
```
collect [
foreach i ["1.red" "2.red"] [keep %./0/(to-file i)]
]
```
`[%./0/1.red %./0/2.red]` is expected, but what I got is: `[%./0/ %./0/]`
Why? And how to deal with this?

[8:35:19](#uSwKYwfIeHnq5BINgPcXVB4SlwvFEtFkeyAva9hDAyw) <hiiamboris (NOT THIS ONE)>:
```
>> [keep %./0/(to-file i)]
== [keep %./0/ (to-file i)]
```
file! is not a path!, you can't use parens in it, so the expression above is lexed separately

[8:39:52](#w_oJNL7Q1RjiKiNbVDdzbrNvAnDsUDSLWj6dh9dxAVg) <hiiamboris (NOT THIS ONE)>:
options:
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

[8:41:45](#L52AAXWbJMY6mqFN8TVIkzalU39lboe2lw8HzRzauzg) <hiiamboris (NOT THIS ONE)>:
* ```
>> [keep %./0/(to-file i)]
== [keep %./0/ (to-file i)]
```
file! is not a path!, it's a string! variant, you can't use parens in it, so the expression above is lexed separately

[8:58:25](#TFl06iF6iI9SmO45NpxNLl65bQnncKeFaIqEd3S4zho) <lylgithub2021 (lylgithub2021)>:
Good solutions and perfect jobs on `composite`! Thank you! @hiiamboris 

[9:14:57](#0b6PPcuYFrC2AaTU50Aj3on9O78p5hK3JRpKm7lFnTU) <lylgithub2021 (lylgithub2021)>:
@hiiamboris  Where can I find detail descriptions about Red macro?

[9:16:52](#7eQ307h3IOGqprBKsHU58XFJbxe3RAHbFcHU80LfYu0) <hiiamboris (NOT THIS ONE)>:
https://w.red-lang.org/en/preprocessor/

[9:19:08](#k21LN2Hnpzdi-ITWQm2EB8i0FfksoUgduiPtOCxyaNM) <lylgithub2021 (lylgithub2021)>:
Thank you.

## 9-Jun-2021

[13:05:50](#ZTByhslnfueZZjaYX3D_6GOaH2C21FfvWKBk4J21OZM) <abdllhygt (Abdullah Yiƒüiterol)>:
is the next version 0.7? not 0.6.5?

## 15-Jun-2021

[21:40:29](#Tl3LDkusrUWsCtAVFMZZQRf7-5q6q4hWzqnLds31WO0) <brk-klymn (brk-klymn)>:
hey, I

[21:41:01](#30LI96WJtQeRmS8v-IuplAjbMBsQSdDXlLVrIAwu7qE) <brk-klymn (brk-klymn)>:
when I try the view example in get started section it says script error view has no value

[21:42:41](#JocQHkCp86Uesi4qyzwieu-8TKg___wgkxTYzmlmHCo) <brk-klymn (brk-klymn)>:
any suggestions on fixing it?

[21:52:14](#LrumuP97QzL4z9Kud8qY0d7VXD_faax6PMQC-3EmN00) <greggirwin (Gregg Irwin)>:
@brk-klymn do you have `needs: view` in the header?

[21:52:41](#2-5JWnP3icJO4_DqXhcARGPrAYNVZORqftZOWXufAfM) <greggirwin (Gregg Irwin)>:
@abdllhygt we're still hoping to change the release model...soon.

[22:03:25](#tdOlw0kzxmUwA2DnMeWclBFBmrYCz8OTZBBza6XqJRs) <brk-klymn (brk-klymn)>:
I'm using the red console, how can I check the header?

[22:15:27](#unrXEoy1mUaQohFizHtbSR3DSNsglFARTytO2AF6-fE) <brk-klymn (brk-klymn)>:
even when I compile and add Red [Needs: 'View] it says view has no value. I'm using fedora linux if it helps

[22:56:36](#Prx9X2lhzDMK3ADDWCNziDp27L2xGyk9k8XBQy33Nl0) <greggirwin (Gregg Irwin)>:
Use the GUI console.

[22:57:09](#TRbZlDr07CraEDPgZfH1Sm-wti9HwEUf1CgoR9hGoBA) <brk-klymn (brk-klymn)>:
sorry for the ignorance, how do I use it?

[22:57:54](#zaNoDAmIumHeAb1z_tLfzx8PSyi4cT7AVAAk_hWKJZ0) <greggirwin (Gregg Irwin)>:
If you're compiling, it should work. What does `about` say, just to make sure you're running a GTK enabled version.

Just run `red` and it should build and run the GUI console.

[23:01:19](#5N1oV2qqp_FBNyJR5HGrKvjqJBRcFkkUZ44ZZ44Rb4E) <brk-klymn (brk-klymn)>:
Red 0.6.4 for Linux built 22-Nov-2018/3:40:38+03:00 commit #755eb94

[23:05:03](#iLlkxQgixSkiI9YwW7wso-g156KjYuuKkyBnsfs1UQw) <greggirwin (Gregg Irwin)>:
Use the automated build. No GTK in that version.

[23:14:52](#PzWi2dLqluMhheBZAlpVSOnNuGjK_lzbW0gyC3moUiY) <brk-klymn (brk-klymn)>:
works perfectly! thank you very much!

## 25-Jun-2021

[0:47:46](#YV5Kxvplrnr65VV94R87saJ006NlEJHiQPe1GwTpC54) <hardkorebob (hardkorebob)>:
Just getting Red compiled! :)

[0:50:20](#mpIUfrkl13pVXWaZr_NCUVkr-IeTv_sX4k1qy_wbpTk) <hardkorebob (hardkorebob)>:
Unfortunate the Last update on 20-Dec-2019 for red by example website

[0:50:48](#hOdb17pRENzMKy9WDLoukNkSHR6bfF7Aa7-wNRYE-Z8) <hardkorebob (hardkorebob)>:
Yet soo much to learn

[1:05:59](#eE9khAVQCjtmUJ3fDPh4CQmdlzPgPCBxTow7LfKat7Q) <gltewalt (Greg T)>:
What do you need? I recommend downloading from Automated builds, master branch.
https://www.red-lang.org/p/download.html

[1:06:10](#LTmOze33ESEzdybGdUN7KbkOI6u4EidvqrKFwO0JEH0) <gltewalt (Greg T)>:
Examples? Learning material?

[1:12:34](#iFqEWwqnNydJgowt5DTT_qdOpSYrbU5BPuxZUuLNd4U) <gltewalt (Greg T)>:
https://www.red-lang.org/p/getting-started.html

[1:12:40](#7wKLF-g58DR9xAnN9KZTYJARtgS-TLe8EosCcs-wqTU) <gltewalt (Greg T)>:
http://helpin.red/

[1:12:51](#EYs4b0jSXR6DRk-7qzAInhqs4imfu1P-lrjWXmtLqM0) <gltewalt (Greg T)>:
https://github.com/red/red/wiki/%5BHOWTO%5D-How-Do-I-Do-X-with-Red%3F

[1:12:58](#3VSILVNePRILXURifGN7SyySSHO8_YgQkCGF9r0EFrQ) <gltewalt (Greg T)>:
https://github.com/red/red/wiki/Examples

[1:16:53](#MIsVqEkmdAaT-pPvPgreh7_hEn4aOFgNljo8FjLXUU4) <gltewalt (Greg T)>:
And for good measure... bookmark it and worry about it after you get your feet under you:
https://github.com/red/docs/blob/master/en/style-guide.adoc

[1:24:35](#ewxJjJwuRI_-xxCqfnqNIVHk_kXMP5xv1kuvhxXAlVI) <hardkorebob (hardkorebob)>:
/hello: error while loading shared libraries: libgdk_pixbuf-2.0.so.0: cannot open shared object file: No such file or directory

[1:24:43](#bLmUtYOsMF0Jvi48mQkZCCqOGslLf9CNsRf-Tj2-BwE) <hardkorebob (hardkorebob)>:
I have that library

[1:24:44](#RU6nOLAh2MoPyHhjRiHAmKKUggcXR8LuXVQD8ndDdW8) <hardkorebob (hardkorebob)>:
Ugh

[1:26:03](#RvRpyAMk3Rr3IylQlkPo2N43ZA-p4M0ITz63aDZhS8k) <hardkorebob (hardkorebob)>:
Cant run ./console either

[1:29:29](#_XcP4UGjKzvCNm5udIIL32QW_XDLQo6Q_wLbKrrcRxU) <gltewalt (Greg T)>:
linux?

[1:31:16](#5NOo4_Wy29EQwnbMXrJ22Cioyf68OmeXZVHr37LUbfw) <gltewalt (Greg T)>:
If so, remember to chmod the binary

[1:32:15](#1h-g1lWdDd5xV6p3dtypa4ijYX8q7W3A1IKxgdnR3mY) <gltewalt (Greg T)>:
Follow the getting started page, if you haven't, and let me know 
https://www.red-lang.org/p/getting-started.html

[1:34:04](#UvI5WzFGITbcc75wDkoDhZTD642WYqi6FXoMPj_GrGQ) <gltewalt (Greg T)>:
I usually change the name of the download to `red`, move it into my home directory and `chmod` it. Then `./red` should start the console building process.

[1:57:17](#dCIGNrkV7PDqGCS9ETPS23auVendN6ud0Tu1spJTP5o) <hardkorebob (hardkorebob)>:
I followed building from source using Rebol

[1:57:38](#C9ZT3rr_pHGVpUrAJAViICeOSt6986-1It9Jj0FIkmg) <hardkorebob (hardkorebob)>:
Running Red from the sources (for contributors) <<<

[1:58:46](#uE_9T0qSlGLs4bMIPuccNx2skjIAZvxGcNjy9LQLCcw) <hardkorebob (hardkorebob)>:
chmod it? its already an executable

[1:59:02](#KnPq-q3WbSSuEdGyx0MwhB52PdDTki_pMzTyTbcHYZA) <hardkorebob (hardkorebob)>:
rwxr--r-- 1.2M hardkorebob 24 Jun 21:19  console

[2:01:03](#3Cw1rseoex4j7d6fK-thabgz_ofOZkAVKBVT3Kgp6dE) <hardkorebob (hardkorebob)>:
doing $ chmod +x == rwxr-xr-x 1.2M hardkorebob 24 Jun 21:59  console... and even then I get the same error

[2:04:05](#GQry0KZi0-EX5YFF6KeHuE3S-jCNfiBiEALfYSus3VI) <gtzip (gtzip)>:
Try downloading the automated build. There may be something thats out of date in the build from source directions.

[2:14:52](#Ff3lh5AgO90LJxxaKyUFG2UC5jPYhzVegV5qQRgA9bQ) <ne1uno (ne1uno)>:
needs 32 bit version of any libs

[2:15:11](#g77n09kdKO6KRvKsMRVYUW6xBO2yFCCKoSZEJFbXvT0) <gltewalt (Greg T)>:
Yeah.  Like `yum install gtk2.i686`

[7:26:15](#UvC9DR6BLA3T1TGvxmU4bHMe6VgNc0TU13IyLcWznGA) <hiiamboris (NOT THIS ONE)>:
Instructions are on the downloads page.

[19:13:27](#hEjEzBv1qHjV54PIX2xGkjv3xIhIUnivWbWR3-on93A) <hardkorebob (hardkorebob)>:
Running the autobuild

[19:16:01](#tHwuPG1UKiZagNgQCtM2-2SLZE-N198_U_uB20VpJv0) <hardkorebob (hardkorebob)>:
 ‚ï∞‚îÄŒª ./red-25jun21-fe27c1d30
Compiling compression library...
Compiling Red console...
/home/hardkorebob/.red/console-2021-6-25-57821: error while loading shared libraries: libgdk_pixbuf-2.0.so.0: cannot open shared object file: No such file or directory


 ‚ï≠‚îÄhardkorebob@krsnaloka in /mnt/red took 2m7s
 ‚ï∞‚îÄŒª find /usr -name libgdk_pixbuf-2.0.so.0
/usr/lib/x86_64-linux-gnu/libgdk_pixbuf-2.0.so.0

[19:16:28](#JK4xicck4ES22aEdcgYUZcAdP07Majgybt9ulU2Pcts) <hardkorebob (hardkorebob)>:
Where is it looking for the library

[19:28:04](#kNfsLS3bfTcgl6D6F9HSfpN4dndkYYYASd_19UrC96s) <Respectech (Respectech)>:
OT: @hardkorebob It looks like you're running Konsole - what distro are you running on?

[19:28:58](#0LuxHNQcyUC1qA3vsbL54XBVyzXH9HrXWyK2scVxAu8) <Respectech (Respectech)>:
On topic: Red is looking for the 32-bit lib, and yours is a 64-bit lib. You're going to have to install the 32-bit libs as well.

[19:29:55](#qxDAJuDlh_eBmktxflq2bgrJe54PaLv9h8zky0bJG0Y) <hiiamboris (NOT THIS ONE)>:
downloads page is this one: https://www.red-lang.org/p/download.html

[20:00:02](#MaDHv20G29lj1dUV6GlcZzSP98TtofmgyiuofRK1shk) <Respectech (Respectech)>:
@hardkorebob On Arch (Garuda), I had to perform the following command to get red-latest to run: `sudo pacman -Syu lib32-curl lib32-gtk2 lib32-gtk3` 

[22:22:21](#gBbVGx3wkP1lZ3gw8237jEi9T9s8f9bCHPR-NNCBVDs) <hardkorebob (hardkorebob)>:
Oh lord! Im such a dummy

[22:22:33](#nVXWnuzj3rdyhiNhvIklcNUOmkk2PrJ4me-5xuITp8M) <hardkorebob (hardkorebob)>:
I never saw the instructions on the download page

[22:22:33](#5BXUkujkYYXiOW779Pi7iJHVL2HEbObELq53ZCQjohU) <hardkorebob (hardkorebob)>:
Ì†ΩÌ∏ü

[22:22:44](#Lp4_QkTnz9-K3yw9uLvBzasytqEC_DxqMc5dwM--pFs) <hardkorebob (hardkorebob)>:
Thank you @Respectech 

[22:30:58](#7hqeMCsYAWyccqKXDBQfXikPU8nui7a2dXCcsjUIFcs) <hardkorebob (hardkorebob)>:
Reporting after installation of 32bit deps. I have the Red prompt from the AutoBuild! :) 

[22:33:36](#jV06q_uCqMVmImS0twKMwQeN0hkOOJjQnrq6s5SAHXQ) <hardkorebob (hardkorebob)>:
Compiled from latest git clone. Success as well.

[22:37:34](#my_fHZ-p3k-TY1_sqJCFffyDM4ry8Sh92hy6XLkYRIs) <hardkorebob (hardkorebob)>:
This normal?

[22:37:37](#yqLA0OaBqZnXNEz8wa3kikK2zKVGb_HLDmwBN5fqprQ) <hardkorebob (hardkorebob)>:
https://nopaste.net/gtkWarningsForLatestRedHelloProgram

[22:37:56](#ce75wRBH0TIvivHkEWtI_3iOcacJA8NaIgdQflHqcoA) <hardkorebob (hardkorebob)>:
I get the Hellos in the terminal not a seperate window

[22:47:43](#uYSIptgFNGw1JSCfDdGYZbLC-eku4HI_15j8Ae1PIiA) <gtzip (gtzip)>:
I occasionally get gtk warnings but nothing like that.

[22:47:51](#eaysIkCvG3P9hwCt_19GcwyPh7GsBVZNbbgdCTI7QMo) <gtzip (gtzip)>:
@qtxie 

[23:12:08](#cAbV7MnqZJ0mcykl8x4lymObHixanwZkNHaAkVNLdeA) <Respectech (Respectech)>:
I also get gtk warnings. See red/chit-chat for an example. :-)

[23:12:42](#bDLBMUd5twfJqr9Qy8tI8P7MLGSmKwD3VkB9tW7NA-s) <Respectech (Respectech)>:
* I also get gtk warnings. See red/gui-branch for an example. :-)

## 26-Jun-2021

[2:15:49](#JEHyjJSOuy9hyS4GUOoct2UnhJYII82-LlWzzYqxXNY) <qtxie>:
> This normal?

It's normal. The warning messages are different on different GTK versions.

[7:11:29](#TtZAiczcLai3kp1rauuHR8ClSQN3pgxLASD_y3KX5xA) <hiiamboris (NOT THIS ONE)>:
wow :) I usually get just one warning

[18:45:35](#kbQJ5_lZ8bLZOTweADleuRYcs374PBFK7uRJsZJWaYA) <greggirwin (Gregg Irwin)>:
@hiiamboris cultural differences. Russians always get only one warning. Here we give endless warnings with no consequences.

[18:55:09](#ChoX4OGn82UHCRH3m0pf4DzWidCWbdwCGpPnwVBFu4Y) <hiiamboris (NOT THIS ONE)>:
ROFL

[21:33:19](#q8UL4_08K2NGEUZAnNlqeVj6h81j73w3wu4nUTRQ_RA) <greggirwin (Gregg Irwin)>:
We need to consider that in our L10N system. :^)

[21:33:35](#UtNRdbvQQghhgtpmzqc9yYLkzb7po3rN0TpqVL2tdX0) <greggirwin (Gregg Irwin)>:
* We need to consider that in our L10N/I18N system. :^)

## 28-Jun-2021

[0:04:34](#QFH5f3T23xI_G-0oZ6WUiYErz4dsEo8sIAsm6h1stM8) <hardkorebob (hardkorebob)>:
@greggirwin lol

[1:47:51](#E8vb_iy6VGXVjeiXdUNnsfD6_ONWbQwjqZPTDusWb60) <hardkorebob (hardkorebob)>:
Live coding yet for Linux?

[1:47:59](#7-MNlBvJz6GAoqZqaHj2Oh6RDSQtpZ9ARAhVkt0npz0) <hardkorebob (hardkorebob)>:
GUI i meant

[1:49:00](#eq9XOMfoZKwthBYDNncv3BLiPnq8s67RnXo_PLtzTMI) <hardkorebob (hardkorebob)>:
Sorry I may be confusing what Im reading

[1:49:08](#3Q3NUCr-uee82sGeDBQ-T1s4jc0uEx6IgH--C3YGWoc) <greggirwin (Gregg Irwin)>:
I haven't tried the live code demos there, but that's an easy thing to do if you're on Linux already.

[1:50:15](#8q2ELplSbdHuWY_gls5-L0TWQyNiIPBR7f_idUNDFV0) <greggirwin (Gregg Irwin)>:
[Basic](https://github.com/red/code/blob/master/Showcase/livecode.red)

[1:51:28](#L5YJdGi_zt7lqfjla5185sQ6Fm-HP5vuu9Ss1fxCnJk) <greggirwin (Gregg Irwin)>:
Have to find Didier's enhanced version. @DideC might step in, or others who are working on GUI designers.

[1:52:29](#jvwUE5Ysge2fTxNwzomJlTGAP49Fa_2cNlkj6QcY5-w) <greggirwin (Gregg Irwin)>:
A couple are [here](https://github.com/red/community/tree/master/apps)

[1:53:25](#Rxf3rfowvVYsqxdI3F-C9TA1EyBuvgLeX1qXf8zy-xU) <greggirwin (Gregg Irwin)>:
[Didier's](https://gist.github.com/DideC/85d60c99f97f2e4972a6f7b09a1fe630)

[2:05:06](#3MsrxYft5C1ICeEKK97mbtrOGRqR9Bl5-_FMwsH7h2k) <gltewalt (Greg T)>:
Other GUI samples
https://github.com/red/code/tree/master/Showcase

[13:01:47](#MNcS4vdq00OQWtcC8PufsHjhOxSue71K0V2QsY7nmsg) <hardkorebob (hardkorebob)>:
This is an amazing thing, its soo Red and gorgeous as a rose. I must give you guys mad props for doing all this. I will start evangelizing soon on YouTube and other mediums like a web page written with Red to help other newbies like me get into this really cool tech.

[13:34:02](#v37SzNdrbZhrS5NjOSLIgq0GcBOYU9kSFu83V722JKg) <hardkorebob (hardkorebob)>:
https://youtu.be/GCxoNCn5PzA

[13:34:12](#Os0NqpA0d-xerKr0DSowgn3jvjD91H5bakuuKBQTav4) <hardkorebob (hardkorebob)>:
I will get better at presenting things.

[13:35:11](#68qjGX0Auik5f4zNTYpFN5BoQXBY6MawD6RDhV8pnJs) <hardkorebob (hardkorebob)>:
But I have never preached for any tech before. I have used a lot of it. Been running online since I was 12 yo and Im 37 now. So I have a good bit of knowledge. Thirsty for more daily. Thanks for the time. 

[14:51:24](#T_IeSi4IqaX3vXAIfsd-vrPhfwurkPgnUu_99oswSlA) <hiiamboris (NOT THIS ONE)>:
Haha man you're so random in your video :) But I'm sure you will get better at it. Good audio quality btw.

On a side note: there are no keywords in Red.

[15:03:20](#tTpCBNkjBf-CTuy1nYlV9MlG28_8yPKDmQfuPKihuyY) <hardkorebob (hardkorebob)>:
https://www.youtube.com/channel/UC0Z2PaRSV06dRJ62h_S7bPw

[15:03:38](#EZaOOb_x0Kfq9dcSxmx49-IP_G3QVWKZAFUkYf5nQWU) <hardkorebob (hardkorebob)>:
@hiiamboris  :) Im liking the feel of this.

[15:28:06](#7Eaxaj-O_ZPFcXTCOwyCXZ86MgEB3jbuhRJf0Ng56_g) <hardkorebob (hardkorebob)>:
https://youtu.be/buTEKR2sKLo

[15:56:22](#WsUGrle2mEMTj2jNy9w6ZXIhTSI_qB_a_3LXPxDPYeA) <cloutiy (yc)>:
@hardkorebob nice videos. Here are a couple videos on my channel where i go step by step on how to use 'parse' to parse a markup language to generate a document. Not finished yet...having a hard time finding a quiet place to record. https://youtu.be/1riJ1PYYOfQ

[16:16:07](#6v4GXEXLpFwqDeVi995nnf-EVNPT8HnC3kPOiZ2TVMA) <hardkorebob (hardkorebob)>:
@cloutiy Yes I love your videos dude! You are responsible for mine. lol You inspired me to get into this. I need to finish your tutorials. 

[16:44:41](#diBAhtvx0ETMy8riqLXkIP0eWMmzHD5Or7a-r4gsFxc) <Respectech (Respectech)>:
@cloutiy I found the best place to record quiet videos was in a car in my garage with the windows rolled up. May or may not work for you.

[16:45:16](#AhVwKUfXhXc5bCLicS63ynockaV1SWN4oA9XP6BXq9g) <Respectech (Respectech)>:
@hardkorebob I also run Garuda Linux and I'm into Red. What are the chances?

## 29-Jun-2021

[0:10:01](#8wkgXtAbXCBC80Kt51awiYh3iMdhCIXhAwUXF_w2Aqs) <hardkorebob (hardkorebob)>:
@Respectech I tried it but the rolling idea doesnt appeal. Too many breaks and unexplained issues with OBS for recording so I stick to Devuan. I do like the name and eye-candy of Garuda Linux. Garuda is sanskrit and I love Vedic truth.

[13:57:43](#tX8VBsxZIhrbk2RB0TCioiGYVH541If4yVRaGX-orNs) <hardkorebob (hardkorebob)>:
So is Red a dialect of Red/System or is R/S a dialect of Red?

[14:00:37](#QmXGz04kecGqFNxncE7IhgmHZ8fMpiY2B5Q5IWy6hFA) <rebolek (Boleslav B≈ôezovsk√Ω)>:
R/S is a dialect of Red.

[14:01:30](#qBPiPH4EUDOpZOcnJeP_fUx0x8ZMrqotLEHBXIeYy3g) <rebolek (Boleslav B≈ôezovsk√Ω)>:
It may seem strange because Red is build in R/S, but you should think of Red as a data format, not a language (it‚Äôs also a language but the data format part is really important).

[15:17:50](#6CJ1r1RUuoUUHsqYoZOfPMC-fw5n_TqxEl8f-gNavcE) <hardkorebob (hardkorebob)>:
Yes Im letting that sink in

[15:18:00](#Ep1FgiNJCcmz1l4ds2SFM9xsk39RgQGpYCq44Ty_CEw) <hardkorebob (hardkorebob)>:
Thank you @rebolek 

[15:27:18](#T7ARqQIzaLLn1nB239fo9kojW5lld0YZ7y4cQ-jmK6g) <hardkorebob (hardkorebob)>:
*** Script Error: append does not allow none! for its series argument
*** Where: append
*** Stack: view do-events do-actor do-safe open

[15:27:37](#rlfMkdIRTCUdCRGXkxkLL_-ElBJ38UA6p07TRykS7II) <hardkorebob (hardkorebob)>:
open: function ["Open selected file, read contents"][
    if picked: request-file [
		ide-file-name/data: picked 
		append clear ide-the-text/text read picked
	]
]

[15:27:46](#vBGFofH9D8jsXJ1T35Iv1sHu6FR2G2krnixNq6JkQZY) <hardkorebob (hardkorebob)>:
what am i doing wrong?

[15:27:59](#qqwxjIOT8WJdeH4Gk0IGoA8j_ARUCepYa5DHoH4J7A8) <hardkorebob (hardkorebob)>:
I cant see the contents of the file

[15:30:02](#_UpwRzArxw-MYc8C9Wt6jVE8IFD6Vu2Ca_bvtNitnRY) <hiiamboris (NOT THIS ONE)>:
first, there's a markdown cheatsheet below and to the right of input line here ‚ò∫ --->

[15:30:32](#G37BNy7zsaXIFcWkXA3moN0gmYoFq2FY4ybBMQwSYoM) <hardkorebob (hardkorebob)>:
Sorry I pasted directly from terminal without realizing the *

[15:30:36](#N5cRxPk6cAkh89qyZq4bNS8bOTuErsqNmVjiPGSyrX0) <hardkorebob (hardkorebob)>:
:)

[15:31:02](#L2wdFThwDTnN_aVnuKmqwjq8lqW2AE-Fd3G7tL1ani8) <hardkorebob (hardkorebob)>:
Oh I see also I can do code blocks. my bad, im not used to such cool features

[15:31:46](#yBvIubckZoE_kiuSC6PJ1qr4VHBckWstooqkBcgG8tA) <hiiamboris (NOT THIS ONE)>:
second, you can use `probe` to inspect intermediate values
obviously your `ide-teh-text/text` is none as `append` says

[15:33:17](#DgaAeq8l1CdLexdnoHvJotOxmj7YenuR_Kj1XJ4v0-k) <hardkorebob (hardkorebob)>:
fixed it

[15:33:20](#D6sfmCqV3GiSEUs3Nb8zHGLhJgsLx1ku-hqxiyyPvvU) <hardkorebob (hardkorebob)>:
by adding

[15:34:00](#nhYu1BuONy4hF_8hoO9iCX-fu344uDJ3WYbMpYHVm1E) <hardkorebob (hardkorebob)>:
an empty string ""

## 11-Jul-2021

[7:40:28](#dsQX27V2eVpnVPg_TYWWh3YXa0r_tWj53s4HxKC1Lm0) <ams02468 (ams02468)>:
Hi, I hope you have a good day. I have a problem now
I want the output answer of this code to be variable, but it gives me a string answer, please help me 
```
set [a A b B c C d D]func [] [print "ams"]
set [e E f F g G h H i I j J k K]func [] [print "nod"]
set [l L m M o O p P q Q r R s S t T u U]func [] [print "gdi"]
set [v V w W x X y Y z Z]func [] [print "zoc"]
aa: random/only/secure [a A b B c C d D e E f F g G h H i I j J k K l L m M o O p P q Q r R s S t T u U v V w W x X y Y z Z]
print aa
```

[9:32:13](#dXBdgd6x37vYhk-QD6p0KZb1GrX0L70OvsrBTOV8kF8) <hiiamboris (NOT THIS ONE)>:
I've not the slightest idea what this code is supposed to do :)

[9:32:55](#KD5TqmYezZb7wF1e3vUe2Qw58rLTU-uOF5-BxrkBs5c) <hiiamboris (NOT THIS ONE)>:
What output do you expect?

[9:34:20](#x_L2qxP02GSC9Qhjz9xhBiQSQc1sTZI8LrGkiq69PBk) <hiiamboris (NOT THIS ONE)>:
Also, words in Red are not case-sensitive.

[15:01:50](#_bTAt6_kdq8hHbWXq5ncKRcGwmkXC4kxvVdm31nJnHw) <ams02468 (ams02468)>:
I want to run some code randomly as a function

[15:08:46](#-bG8MwwzMYMbf_8TqhkxU0ZuAGQolxx6vezdXNTjNDE) <dsunanda (dsunanda)>:
@ams02468 Something like this?
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


[15:52:25](#uZJv1Lfh6T2p5VuicPO_Ud0NejbxdfNkDe6wQ2JX-ak) <ams02468 (ams02468)>:
ye tnx @dsunanda 

[16:25:56](#zDJZJTdPMWFr2R0gd6PXHzZ-P_kdR5UwOQht24aOS94) <greggirwin (Gregg Irwin)>:
@ams02468 you can see now that something like `reduce` is needed so your block refers to functions. But if you use `reduce` on your block, you'll see that you run into issues. A good experiment for you. So another way to do what you want is to evaluate the single word you get. e.g.
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

[16:26:11](#0uaxKO1sDFu2iWE0uU150AQynT0pbFgNe2jwu-33h7g) <greggirwin (Gregg Irwin)>:
* @ams02468 you can see now that something like `reduce` is needed so your block refers to functions. But if you use `reduce` on your block, you'll see that you run into issues. A good experiment for you. So another way to do what you want is to evaluate the single word you get. e.g.
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

[16:39:45](#qyoqNG8O5Jn2Od5mR2wj8ptM_q_K4rF-b59P7u6_KYI) <gltewalt (Greg T)>:
What about?
```
obj: object [
  a: does [print "foo"]
  b: does [print "bar"]
  c: does [print "baz"]
]
do random/only words-of obj
```

[16:41:38](#8YdKHgjYlm2f_8r91c0TgXgnF1f147fQA0O8-KV1iTc) <greggirwin (Gregg Irwin)>:
That works too. Also `/secure` doesn't make sense here, but I can't edit my post now.

[16:52:21](#dKAb2ZfRo8miiuk_jeu58FI19jmsKjjxFwGID8BDdYQ) <ams02468 (ams02468)>:
That works too. Also `/secure` doesn't make sense here, but I can't edit my post now.

[16:52:34](#daJU8ZpDo2bWkLwA05gl-baKbVT4QxfZlT-0iLNeidw) <ams02468 (ams02468)>:
Thanks for your answer. Now I want to delete any function that was randomly selected in the next selection (I want to use the loop).

[17:21:26](#vNQOPt0yEWegHe8QvM80ZgLD3pn2c59q2SbItcalowM) <dsunanda (dsunanda)>:
@ams02468 Do you mean something like this?
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

[17:21:33](#ESmD36Q0RRBgpBlS4SlIZR4l435kxn9d8yNPceIrRrg) <greggirwin (Gregg Irwin)>:
There's more than one way. `remove find ...` or use `random` to get an index and use `remove at ...`

[17:23:01](#oAYhFsEtTC857CE-t_MdBR6LS2o5ESy45mejl0Y26FI) <greggirwin (Gregg Irwin)>:
You could also use `random` without `/only` and `take` from that to get your func.

[17:23:50](#-RpEWKgVKTMTwMGfbZrs52FHq46Ks9mNGG3VMEzM_qU) <greggirwin (Gregg Irwin)>:
In Red there are almost always multiple ways to do something. What's important is using the one that makes your intent the clearest.

[17:29:23](#wvipdrrXeiqPhGayDrONP4OOBxZnbBSB_bopF4uOocI) <gltewalt (Greg T)>:
```
loop 3 [
 do set 'temp random/only words-of obj
]
obj/(temp): none
```

[17:30:48](#yt9x0KATM2i__iPEygcDb6qyuNQJ030BrDPewMQSjDI) <gltewalt (Greg T)>:
I don't know if you want a random function to fire and then be deleted, or if you want to fire the next random function and then delete the previous function

[20:08:01](#RLLofYurV4sFDbybFICtxjpqiFdb1XE5sKTkuY4OXyE) <ams02468 (ams02468)>:
For example, if ams is selected in the above code, this ams function will be removed from the random-functions variable. This process will continue until all functions are removed from the variable.

[21:28:17](#2fjXnwVTI3yGecVDefs7Bzbj0vZj6WojyryPAlh1UDk) <gltewalt (Greg T)>:
Might be better to use block! rather than object if you want a bunch of "variables" or functions, but...
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

## 13-Jul-2021

[13:28:22](#X_BUIvXFZOzcbuyoWDfqZuLddDprwFtdOrRuMNeeBfo) <ams02468 (ams02468)>:
Hello everyone for your answers to the previous question. Thank you. I wanted to know if there is a code or command for moving and renaming files and directories? Or should I write its function?

[13:33:27](#LvhajcX3X95BUY0Ks4VAYUJr5iB5NjQ9gOhd7iVjC4M) <hiiamboris (NOT THIS ONE)>:
`? rename`

[13:35:42](#U7naqZEKw8m7kaKYllM4eIIORqhwuaQpdYazgV1jOtM) <ams02468 (ams02468)>:
for move file ? (cut)

[13:56:10](#AhiD0HfEpH1iihDvYuEFTI1S86WrN_VkajcwBg6_PC8) <hiiamboris (NOT THIS ONE)>:
same.

[15:07:21](#RUEQhasI47n0qZUeIjnbkImBjgvc1fu6zpsSrj1xorE) <ams02468 (ams02468)>:
same.

[15:35:24](#BdlMaTbl0pD0aWeECGq8jJqC7wGETGmXIcm8sHi9ep4) <ams02468 (ams02468)>:
can you give an example for move and rename for file?

[17:04:14](#6H9Qo2r5bCAGc51TsapR2PlPm8Nk2GHZucW8W8rT54A) <greggirwin (Gregg Irwin)>:
@ams02468 the best thing is to try it and learn how it works. Start with `help rename` in the console.

[17:05:58](#kIyotgexNM5Z78WEB8qh15hMFDSkse09M1xJj9C5gPg) <greggirwin (Gregg Irwin)>:
https://www.red-by-example.org/ also has a lot of info, but it doesn't look like there's an entry for `rename` yet.

## 14-Jul-2021

[10:58:13](#sLikk5iCWplBWtiameDHAvDzaK6828yF4e1-w6CGZC4) <antikythera>:
What's the embedded story? Arm, ESP, AVR ?

[14:04:07](#-odqX7o0D5-nbfsdUmOGYq_58pZoKZEmrH3Hw7n3aGI) <antikythera>:
What is Red/System really? Is it another language or is it a language written in Red?
Suppose one wants full control over memory (happens on embedded dev). Does one need to write in both Red and Red/System?

[16:24:15](#4nTbZt9vy5QP04t9OZzUX5Y1ZIZcKnST2x6xIv7CM3Y) <greggirwin (Gregg Irwin)>:
ARM is a working target. We don't have anything on ESP or AVR.

Red/System is a C level language. If your hardware is tightly constrained you can write purely in that and have total control. If your hardware has more memory, you can leverage Red and it's high level runtime, mixing in Red/System as needed for performance or hardware access.

## 15-Jul-2021

[13:30:34](#x8W2riCU-p_r3JcXmekBh9kZFV-UE-PRg2RXpXFSatU) <antikythera>:
greggirwin (Gregg Irwin): Thanks! If So this "Red/System" is another language which could also have been named anything else? I mean, why is there a Red and a / in there that seem to suggest it is a DSL written in RED? (sorry my question may seem obvious)

[13:30:53](#lRPytGaSc6rrjZQK3dQSv8FrHSveMy_Kf8ZYS77Vm_o) <antikythera>:
 * greggirwin (Gregg Irwin): Thanks! If this "Red/System" is another language which could also have been named anything else? I mean, why is there a Red and a / in there that seem to suggest it is a DSL written in RED? (sorry my question may seem obvious)

[13:31:14](#LOTjkK7HNkeayVYSSjzUb_VbxQSqFhPcQTa5aBjHE6s) <antikythera>:
 * greggirwin (Gregg Irwin): Thanks! If this "Red/System" is another language, could it also have been named anything else? I mean, why is there a Red and a / in there that seem to suggest it is a DSL written in RED? (sorry my question may seem obvious)

[13:31:23](#ejIJE-4-fYqh6MzocIXSJuiXPhM7yOua7m6gvHy4OK8) <antikythera>:
 * greggirwin (Gregg Irwin): Thanks! If this "Red/System" is another language, could it also have been named something else? I mean, why is there a Red and a / in there that seem to suggest it is a DSL written in RED? (sorry my question may seem obvious)

[13:31:36](#HczpJOviGqKd_4RXAqd0zAZQ7y3X0f_M3Tn5dJaZ7i0) <antikythera>:
 * greggirwin (Gregg Irwin): Thanks! If this "Red/System" is another language, could it also have been named something else? I mean, why is there a "Red" and a "/" in there that seem to suggest it is a DSL written in RED? (sorry my question may seem obvious)

[13:32:16](#xQw7HfCe_FywPFiSB1FJJ5-u9XBY8-klQ6LJVfNzdiA) <antikythera>:
By C-level, do you mean low-level as C? Or C-level has a meaning in programming language design?

[13:36:31](#n7lw2PbHQXaORTUI4lGeu32fLNsNu4A2Ib-EgK0NcfI) <antikythera>:
 * By C-level, do you mean low-level as C programming language? Or is it so that "C-level" has a meaning in programming language design?

[13:55:42](#c8Ap9pEQ5b7L69wY56rfSH_tbu2qai10vGLCoeD_4so) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Whatever you do / program in Red and try to compile, compiles down to Red/System intermediate language first. Then there is a second stage compiler, which compiles R/S down to a native code. You can eventually use R/S directly for some low level stuff too. The reason why Red does not support 64 bit yet, stems down to the secondary compiler - it does not output 64 machine code yet and needs to be rewritten / adapted. Sorry if innacurate by the guru measures :-) 

[13:58:02](#JvgeHKLF25W2NII89KOeMiwmvNf2Ir_6HJUpPEkW3yI) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
What is probably meant by the "C-level" is the fact, that in the end, it produces the native target platform code. In comparison to some GCC and such, there is a little to none optimisations yet. So far, R/S apps are claimed being cca 4 times slower, than the C app counterpart. After the compiler gets some optimisations, it might get into 1.x-2 times slower ballpark ....

[14:00:14](#0fGjoTgq-6TGCFHX53GoyvbUWC2BsU0__rWdH4L0EBg) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
You can look into red\runtime\platform folder to see the targets and study how it is done recently ....

[14:23:18](#CbC46_2jJJvS3zWzFuLQlmXCYarVJ9TSbHNfPO-2Ib4) <hiiamboris (NOT THIS ONE)>:
@leibniz:matrix.org Don't confuse implementations with languages.
- Red/System is a DSL of Red. Red being dynamic and versatile, while R/S uses a subset of it, giving it a strict meaning
- Red is implemented so that it compiles down to R/S. R/S being a bit lower level language than C, allowing you to work with hardware directly.

[14:23:33](#UXDBIDIFoccy51BItHhAjHhinxskaAcAs-YsqAf7ixA) <hiiamboris (NOT THIS ONE)>:
* @leibniz:matrix.org Don't confuse implementations with languages.
- Red/System is a DSL of Red. Red being dynamic and versatile, while R/S uses a subset of it, giving it a strict meaning.
- Red is implemented so that it compiles down to R/S. R/S being a bit lower level language than C, allowing you to work with hardware directly.

[14:50:57](#gGMLKDjUVGozNd5T0djmCOkbh7ppQqUBATnPb1znG7A) <antikythera>:
Thanks. I know only C, Java and Python. No experience in LISP, PROLOG, REBOL or Haskell... Should I first learn one of them to somehow appreciate a different programming language like Red?

[14:52:43](#bihU-AtTFXJHoIeG4N84lY0sU_76MRBKPKzIO-MoPNg) <antikythera>:
Many of folks who seem to like Red, are coming from lisp, rebol...It seems I don't have the background for it

[14:54:40](#lfMW7RbdKmSeSxF-Qwj7MivGLPrvbC6DP-_ySvuwFTo) <tmphei>:
> <@leibniz:matrix.org> Many of folks who seem to like Red, are coming from lisp, rebol...It seems I don't have the background for it

I think it‚Äôs perfectly fine to start with Red :) You may find a lot similarities with lisp but I don‚Äôt think you need to learn it first to understand Red. It actually may happen that you will learn both at the same time 

[16:18:12](#vFpq4xVUN6WIYpjeqT0OlbrjlqLpHmeOGPfjcrEeZh4) <greggirwin (Gregg Irwin)>:
You should be fine starting with Red. It is also enough different from Lisp that you'll have new things to get used to. It's fun to play, and when you come across something that seems strange, ask in red/help. There are a few main design points that are fundamental, and it's a rite of passage to find them. :^)

[16:19:09](#SVEgcvRD9l5VbG08AqjT0KUvPegthQ4v3fiJNaOTyvI) <greggirwin (Gregg Irwin)>:
Playing with Red will remind you of the most exciting phrase in science at times: "That's funny."

[23:35:15](#K18wqM485pD_Iyb2ok_-bNwVvfsphFFFJA1ifOrKK5g) <antikythera>:
I gather Android GUI support is not finished yet...but if it is done, would it be dependent of Android SDK/NDK?

## 16-Jul-2021

[13:37:55](#bS9YJEMwUvH342nr1_oWSa5kR1hedRu2_xwr0T8Khwk) <Respectech (Respectech)>:
No, it won't require the Android SDK.

[14:56:08](#8reqq13dTkZtSi7fipfNdPuLqaH_Ys1oAtS0-I2AHks) <antikythera>:
Respectech (Respectech): wow! So it would be the *only* solution to develop GUI spps for android without needing to download those ~5GiB of Android SDKs

[14:56:28](#OsGCr45-BSPOGekB9AjzkbPA8wGaMm86XnWJHUpuJRY) <antikythera>:
 * Respectech (Respectech): wow! So it would be the _only_ solution to develop GUI apps for android without needing to download those ~5GiB of Android SDKs

[16:11:01](#8OewBZmLlAWv7oKk8Bcy-Oo9SAkEGv_WG4spgL0Q21o) <Respectech (Respectech)>:
As far as I know, yes.

[17:03:09](#obK8CKDvxcXlZdZyKjnSfAcGWmjBesdF9TKb3eGlXw8) <xmonader (xmonader)>:
Hi, the latest post on the website is a year ago? does it mean it's not active anymore?

[17:44:12](#XCTTQJfFlXSznfwiGshd8QZfmyEfM6jMeCeiF19DPF0) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Hi, the latest post on the website is a year ago? does it mean it's not active anymore?

[18:45:31](#XZiLljTicrirUvCVz6I1_wBe6Exs5mnWnZa4AaOMIp8) <greggirwin (Gregg Irwin)>:
@xmonader we are active every day. Follow the chat here and watch https://progress.red-lang.org/. We hope to get a new blog post out soon. 

[18:55:32](#6Dyl2pBNp6YN0NOF_dXcaUskwji0SK9RbWN2PGOAg-A) <antikythera>:
greggirwin (Gregg Irwin): By the way, you guys are on HN :D 
https://news.ycombinator.com/item?id=27835400

[19:02:10](#lXwBcfqK0O1UMDf1QrK52lTbzyUl5OfK4ldx2LYBfeA) <greggirwin (Gregg Irwin)>:
Thanks for the heads-up!

## 17-Jul-2021

[13:15:01](#pTCeQI27IHUZsUxfhEbXi9aphupk2crFY2MKvQLzPRk) <planetsizecpu (Jose Luis)>:
@greggirwin it would be great to read some word from @dockimbel as we miss his input since long time, I'm sure he is a lot to tell us. Ì†ΩÌ∏â

[17:35:18](#i64Fk_NClFnHvMZcIJ5fkj4Wb0aj85tJGJ_zdQKaCqc) <greggirwin (Gregg Irwin)>:
I'll work on that. :^)

[22:13:04](#WmLpFtvBYuHK-cAbMQ5j6gYbyo4ladDuaMT_dmexLI4) <ams02468 (ams02468)>:
Hello, how can I just get the file name from the request-file command? 

[22:25:58](#7kN_H1RKPtsLa9UKG7BHNZIvFPIwTN8z3sP10TH5znM) <ams02468 (ams02468)>:
for example
 	```
a: request-file
== %"/C/22.exe"
 	```

[22:26:08](#3b1roE4mHsa6w50mBeTbpLGF5ZGLU1XBBHqXyxWTOFQ) <ams02468 (ams02468)>:
* for example
 	```
a: request-file
== %"/C/22.exe"
 	
```

[22:26:21](#nmTKyyyu3scbe2LmZ7qNjkFo_1-2Ufjifbumf-M6Oao) <ams02468 (ams02468)>:
* for example
 ```a: request-file
== %"/C/22.exe"
 	
```

[22:26:33](#5vCbNp-NK6rPlmESf311XMQotx0pPz5iBGCv_NLTi5w) <ams02468 (ams02468)>:
* for example
 ```
a: request-file
== %"/C/22.exe"
 	```

[22:27:03](#hHf_Wg0q85jmoI_GV9mtM7OXJFZpiHDOskAyAI4-adA) <ams02468 (ams02468)>:
* for example
 ```
a: request-file
== %"/C/22.exe"
 	```
but i just need 22.exe

[22:30:11](#eXUfx0WrpEkOQBYmCPRZtiAnRv437UJFY50pt1juk20) <greggirwin (Gregg Irwin)>:
`split-path`

[22:52:27](#v7KRyRIK1-qqH4uit7osf4FPwpAzZIYheeUnRVHduHY) <ams02468 (ams02468)>:
tnks

## 18-Jul-2021

[1:38:21](#K2wagHfyJwc6Gh46Kbuu8vE6-0sYAAkX6X01WZDE2rE) <gltewalt (Greg T)>:
`last split-path request-file`

## 20-Jul-2021

[2:58:06](#ZwBUefp0x2hcS5qvT2FRRccjOhkqO3T7jW36FZSAfRs) <ams02468 (ams02468)>:
Hi, I have a block type variable  when I convert it to a string
  `` `
>> zx
== [z1 z2 z3 z4 z5 z6 z7 z8 z9 z10]
>> to-string zx
== "z1z2z3z4z5z6z7z8z9z10"
  `` `
What I want is an output like this
"z1 z2 z3 z4 z5 z6 z7 z8 z9 z10"
Thank you for your help

[2:58:30](#nzd4nrQq6TBxgaKZ8JjqCEhsyddrlZizD4ObQKNjj4g) <ams02468 (ams02468)>:
* Hi, I have a block type variable  when I convert it to a string
 `` `
>> zx
== [z1 z2 z3 z4 z5 z6 z7 z8 z9 z10]
>> to-string zx
== "z1z2z3z4z5z6z7z8z9z10"
 `` `
What I want is an output like this
"z1 z2 z3 z4 z5 z6 z7 z8 z9 z10"
Thank you for your help

[2:58:58](#zWSNBQo5JMQkcJ7OhIJKMmb4D0tBhDLrltSvz6t6Nng) <ams02468 (ams02468)>:
* Hi, I have a block type variable  when I convert it to a string
```
>> zx
== [z1 z2 z3 z4 z5 z6 z7 z8 z9 z10]
>> to-string zx
== "z1z2z3z4z5z6z7z8z9z10"
```
What I want is an output like this
"z1 z2 z3 z4 z5 z6 z7 z8 z9 z10"
Thank you for your help

[3:39:27](#AEhx1HbB8MTeV7zfco4DDMjUGwts9qVajdxNc49-Nfk) <greggirwin (Gregg Irwin)>:
`form` or `mold` is what you're after.

[3:39:59](#eOHe9FD_EDSKjocvFNuEA_v4Bi6WO60DRi0i6msOnA4) <greggirwin (Gregg Irwin)>:
Look at the help for both to note the important difference between them.

[21:30:31](#4etzT7mR5UC-_hPMw4UxGv-gGOWZdoAKtj8Lk1QIW6s) <mikeyaunish>:
@hardkorebob  you can find livecode and GUI manipulation here:[https://github.com/mikeyaunish/direct-code](http://https://github.com/mikeyaunish/direct-code)

## 29-Jul-2021

[6:53:17](#5dXlBDvHHWG-aoZ6zA3HSmyhhCrZMdF13ZVSjiwjnPg) <ams02468 (ams02468)>:
Hello, is there a way to extract the names of variables from this code, not their data? 
```
ra: reduce
[
    a1: "x"
    a2: "x1"
    a3: "x3"
    a4: "x3"]

print pick ra 1

```

[9:21:31](#BgGFhCjV4HsLDCxrI0nAb1oE5E8EEnCDJvugvdQGFBk) <toomasv>:
@ams02468 It is possible until you haven't reduced the block, e.g.
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

## 2-Aug-2021

[5:12:48](#PrcTolDy7ESVNNYS90TDbF4lnDy6jmmK1H7t6WoF9Ks) <ams02468 (ams02468)>:
@toomasv (tnks)

[5:12:58](#lMwFw18Cvj3RieFkkWV_5Maj7KkRRDo89ruBPBgB2Ro) <ams02468 (ams02468)>:
* @toomasv tnks

## 6-Aug-2021

[1:06:55](#aFOdq3NoFRdqkCmNkjpCjXLkCX6RE5HHACdOonpx1UU) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
Hi!
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

[1:08:54](#Jeao_oxeEnG6ASsWJRzwnwHK6fRwlmRcvtU6ZGWcysE) <greggirwin (Gregg Irwin)>:
If you're using `view`, be sure to put `needs: view` in the header.

[1:11:16](#6TA0RVMXV1Gjl04aaMCv0JLxq6TjLWA5HyFzXQBBhpA) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
I will take into account.

[1:12:14](#p3CVJmVsRH6VYWo1zJwCEUucMHrtDlPpnx87jU_X_wA) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
`red ./clock1.r` work fine

[3:26:40](#vO3Cwu1FReCNDOEvsGbIpaYaDIMZ_d0fkLGg-O8AfkI) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
@greggirwin, Does not help. the error remained

[4:07:09](#G9QDRuxopvcd3I2tOoIDic_DczRi6SUV4CYZ0yrl4JI) <gltewalt (Greg T)>:
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

[4:07:43](#gEYLAhgnMnL4pUk77-EQey11bvzPYjwr3ZJRBC96Gl8) <gltewalt (Greg T)>:
Compiles and runs fine.

[4:08:19](#hsykow2yQXlW-cnR1tBWJBxKBuwUKns3J9pp8Q5sALY) <gltewalt (Greg T)>:
`Red 0.6.4 for Linux built 28-Jul-2021/20:30:34-06:00  commit #6e09c00`


[4:08:43](#d-khRlHKSI04F72agIihg0S2MKXvRIOxQCS9d0_vMMY) <gltewalt (Greg T)>:
```
>> print os-info
name: "Linux Mint 20"
arch: 'x86_64
version: 5.4.0
build: "#90-Ubuntu SMP Fri Jul 9 22:49:44 UTC 2021"
```


[4:25:17](#UM20fmEPUI0lNfov4PgxbkC6pBtCg6Frt6tXrpxtcf0) <gltewalt (Greg T)>:
@Sergey_Vladivostok_gitlab  Are you using a nightly build binary, or your own build?

[4:26:13](#YgZQCsQDvkygzqoKdkqLwlnaBDnxYpvp1M4QNHPpuJA) <gltewalt (Greg T)>:
* @Sergey_Vladivostok_gitlab  Are you using automated build binary, or your own build?

[4:26:16](#SubN8w96NT9tg3mnaQN7xU2BbD4sRqpv_yin_uULBbY) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
@gltewalt nightly build binary

[4:29:06](#CrPgVVYzcwz1lPqaYzTAV_TcGzz8eJK8EzcbhGdtEpo) <gltewalt (Greg T)>:
I'm grabbing the august 5th build to test

[4:31:46](#Pb-A7lkcic3W_Foc_L6hfxjQxsdvV3FWy_K1VsWAVuI) <gltewalt (Greg T)>:
The latest works for me. No errors.

[4:32:08](#IlsOnfdZE1kR-0NU28fpQzyLHV2Vg9qntZiWKWEIJ_c) <gltewalt (Greg T)>:
https://static.red-lang.org/dl/auto/linux/red-latest

[4:38:27](#Nvn_bAkIIBiylYpzD1_nTo0TCAXnGUM2ngPj27hef9k) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
@gltewalt could the old cpu be causing it? 
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

[4:46:27](#wUg7eV-SHEvo63j8xemoUAQGZINKwsw6ivBEPx_qQZM) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
confuses  `datatypes/money.reds` in error
```
user@dell:~$ ./clock1

*** Runtime Error 1: access violation
*** in file: /home/user/datatypes/money.reds
*** at line: 40
***
***   stack: ***-boot-rs
***   stack: ***-main
```

[5:21:33](#tXbo7rLVL5kmbWIpHCmQ3z5SUT35BHss0wfUd_oyiUQ) <gltewalt (Greg T)>:
I don't know - that error doesn't make sense in this

[5:23:34](#dLaxlG4uVXPKGFiP0NNomHeB9WS4Ae53NFMFFK5YuEc) <gltewalt (Greg T)>:
Here's that line in `money.reds`

[5:23:36](#Saq7J7IdJdz0n2LwRGyHErukUIBHOrvkx7PudWWpyt0) <gltewalt (Greg T)>:
https://github.com/red/red/blob/ef6ca5e864b2117853f794a34f9af920cbe4328e/runtime/datatypes/money.reds#L40

[5:29:44](#yDoeTedNBiSWgLwVSbS3uYx63Cnmd4YjLiOr6m4Utg8) <gltewalt (Greg T)>:
https://github.com/red/red/blob/ef6ca5e864b2117853f794a34f9af920cbe4328e/runtime/datatypes/money.reds#L40

[5:29:56](#aM-eELt-20w5x4tz-m0-y4EKeArGYuc2e0043a_PuR0) <gltewalt (Greg T)>:
* On the off chance...  any change if you use?:
`sec/2: to-integer 6  * time/second`

[5:35:37](#5TxLwA-_meKLzhXCb8UEXbS5vBB-FAOnJ6R_RBYNWt0) <gltewalt (Greg T)>:
If you cast your `sec/2` to an integer, still error?

[5:39:01](#on-1A22ax5egUyagsynLh-6cwvS0jQyJ048CTWVFSL4) <gltewalt (Greg T)>:
If it really is something in money.reds, it would more likely be `KEEP_FRACTIONAL` or `HALF_FRACTIONAL`

[5:39:25](#b-ImZRjwe4imPzVX3fiF7LeQ4WMUreqrejCzMfx25f0) <gltewalt (Greg T)>:
* If it really is something in money.reds, it would more likely be `KEEP_FRACTIONAL` or `HALF_FRACTIONAL`. Before line 40

[5:45:21](#dFCixQExhauICcjm0Klvz9D--7VWX0yuVP6hXS8Fjfw) <gltewalt (Greg T)>:
`sec/2: to-integer 6  * time/second`

[6:17:12](#3uiBxDwm6-Qx18Vor6N_julAOndOnRzNvFStuFNaSBg) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
@gltewalt The error remains. If you just run it, then everything works, but the compiled program does not. Can the output of diagnostic information be increased? 

[6:35:46](#PE5A-ttaNF3bvkfXod9Lpt68Wl9OHkZsnI_B2DNPscg) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
compiled
```
a: now/time
print to-integer a/second  
```
error on cpu P3
works on cpu I3 

[6:38:40](#TJnIpltxyy6QS-yWD_uPrtDvZgShpAz2zD9fR0E5Glc) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
run `red ./tmp16546.red' work on P3, but if compilet, then error

[6:42:51](#zQ-a1EFC90PkkSFFQfC04rtAK6KhnrbtXobmctW26bU) <gltewalt (Greg T)>:
```
    -v <level>, --verbose <level>  : Set compilation verbosity level, 1-3 for Red, 4-11 for Red/System.
```



[6:47:19](#HK9hdVS1lLsXxhHdLNSpoLFpX7bPq-LBZwAnQ4WaPIE) <gltewalt (Greg T)>:
`./red -c -d -v 3 clock.red`

[6:47:49](#EXm9-pBIuY2wl2NU8srpnpKH1IxUkF32KWoQ9A_WKXE) <gltewalt (Greg T)>:
Then probably take the information to `red/bugs`

[7:21:18](#DtRvCJdzrsPJw2LWxAr34DY7IwAe77XB4bWMnU8fiPY) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
@gltewalt -v adds information when compiling, but not when running the compiled program. The error text  is the same.

[7:36:19](#DjU1_AHiBnAV5ilPCETtV7oanvyvZ-k_I0DZVVm1SE0) <hiiamboris (NOT THIS ONE)>:
Tried `-r`?

[9:17:56](#qr7-sgmpYJM7P8pu4Qqn0tDBVJssAaaug43E1x-nZBs) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
@hiiamboris has started, but the second hand does not move. Once per second, the error appears in the console:
```
*** Script Error: to-integer has no value
*** Where: set-path
*** Stack: view do-events do-actor do-safe
```

[9:19:12](#eCjoHJ6YxBxgeh4mnIm_F5jknDo-9G_BNvPp9Ka33fw) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
Minute hand moves

[9:24:15](#3R9P-BOTnOJVkLFfu6Te8to9fF1DfTQAkB20M80PiIw) <hiiamboris (NOT THIS ONE)>:
weird

[9:26:32](#UXHf1aYVHJxWinqeaYZCx_94Zd8uOb_H2oa2HLktVqM) <hiiamboris (NOT THIS ONE)>:
well, the previous crash may be due to libRedRT.dll

[9:26:39](#pZks3worGtIp_88bRtiSfJoc8sqC96ExlCluvcKjMXs) <hiiamboris (NOT THIS ONE)>:
you have to delete it to recompile

[9:27:43](#seTzN3jvKZP7WM_89wxg3-OpPNTd_zLGi7l-wuRYaEs) <hiiamboris (NOT THIS ONE)>:
but `to-integer` should be there

[9:30:29](#wNj7QzlkcN1gRpTEfrPccagbLympC5BTffFlqsil0_0) <hiiamboris (NOT THIS ONE)>:
'? to-integer' says what?

[9:31:58](#nC0sNA81SUgjWjx8vC4uyMPLAQLymYvDUojlTPdtzm8) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
removed `to-integer` from `sec/2: to-integer 6 * time/second` and all working

[9:34:05](#hNoMJRNbFzLoSyrg4bL0vDG5jXmTiMtHolLB0O--wCg) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
@hiiamboris displaying help about `to-integer`

[9:36:18](#Ntha7yRYHSKvpjFzqKQ0_zpIHHesfLqtXzNp-OaWxqo) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
```
a: now/time
print to-integer a/second
```
when I compile with `-r` it works without errors

[9:48:38](#Yvp5NqKyoskkwQ9SoOg9TgIkoV4pynzLi7JQkPPd8i0) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
hm... compiling 
```
Red []
? to-integer
```
getting error
```
*** Compilation Error: undefined world ?
...
```


[9:50:03](#MbrpNZDz8jocuhxbq63dkiSXjOyX7EUa3utVCiH4Rj4) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
and `help` undefined world...

[10:10:58](#Y2HTXOoBQY0OPvk2tW2CpBaOXxTLb3STDSMJ1EDKvh4) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
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

[11:28:29](#jEPZKRfG_ai_tL7vlfW7h1O0wLHM1rglKvvJFP600G8) <hiiamboris (NOT THIS ONE)>:
`help` and `?` are undefined because they're part of the console. But `??` is part of the runtime and should work.

[11:29:32](#dEdgbVXA9blhxGjNRPjM2y6qZZrAfmNVNDBoxHlI4s0) <hiiamboris (NOT THIS ONE)>:
`source to-integer` must be compiler issue

[11:30:24](#2rmkGNjm1Gqwr77Ei0s_4fNVUMQOKfNYL6z_INa-ZpQ) <hiiamboris (NOT THIS ONE)>:
* `source to-integer` must be compiler issue, but `source` is also part of the console

[12:29:24](#dzST_I67nXrKnrqLjEfjh7WXPJpGIGfn-jlKkNzDGoo) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
It's sad that not what is interpreted is compiled

[12:41:28](#jOvv79kCgaiZ1qzy7kuBtE8NTvV9aMoc0brklSQy_q8) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
can be make round window or transparent angles?

[14:00:40](#YS67tKGFOe8mmsgLPA9P62NmbPWM3KvSNqOpgM4dcUw) <hiiamboris (NOT THIS ONE)>:
using OS API: https://gitlab.com/hiiamboris/red-alpha/

[16:10:46](#K2kl7uptdkZFA5MXPcYrMdiQf6I53tqzyizPD-2Bgis) <gltewalt (Greg T)>:
Use this please: https://static.red-lang.org/dl/auto/linux/red-latest

[16:11:21](#V1H6EF4OUvm0zKXtGu7GXQ-hFVF5PqrVKJeVDaRStNA) <gltewalt (Greg T)>:
Then rename the download to `red`. Then move into your home directory. Then `chmod u+x red`

[16:11:34](#1Uvmb-dHR9Lu91uXLarsyRyPt1bJrzUywzo7E3lzIGc) <gltewalt (Greg T)>:
Then build console with `./red`

## 7-Aug-2021

[1:50:03](#SCsrIfACuJR0-jDE4CzCz9TSYx_dlK23TUgX7fMiN7U) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
@hiiamboris  Thanks. Is there no cross-platform solution?

[1:53:46](#BPIfEt19tfKqg964xZiLuwwMWNfjHab8KEYIH53ZRf8) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
@gltewalt I use it. `system/build/date` is `5-Aug-2021/3:55:53`

[1:58:22](#ePmTdfm58VRf11KWWVrC9K9XAekAJC4o2ht52u7-1NI) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
in [i3wm](https://i3wm.org/), the program window is not displayed in a standard way, but in the middle of the screen, on top of other windows. Is it fixable?

[2:39:41](#ojSnJDDXkAQ2r9LzhGWkM597K01zJ1gKeI-MYXzkbkM) <greggirwin (Gregg Irwin)>:
@Sergey_Vladivostok_gitlab there is no built-in solution for window transparency.

[2:50:47](#h0fFTKd6-LKXJie7-H5ta2LkbnR33yLgvKPgkf1O8L8) <greggirwin (Gregg Irwin)>:
On i3wm it would take someone who knows that window manager, but since it's a tiling model, it may require its own branch, which is not something the core team can work on at this time.

[3:49:38](#RX3skDTpGbSID-_s8emBfoESFTHU0ZkNkKjmFe95gtQ) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
@greggirwin,  understood. Thank you!
Is it possible to adjust the speed of repetition of keystrokes and the delay time by means of the language? (like `xset r rate 200 50`)

[7:36:01](#jU9mO1IzDDqXPDW6AAV3E-BJLKv8beYDFCCpeRNrNjM) <hiiamboris (NOT THIS ONE)>:
Yes, you can generate repetition events yourself. Otherwise the OS sends them, so it's not language's role to mess up with user settings.

[7:36:15](#EmlQmATKndPv5o4BQ_MkPe9BiLbJvNM2qvBm4hyna2c) <hiiamboris (NOT THIS ONE)>:
* Yes, you can generate repetition events yourself. Otherwise the OS sends them, so it's not language's role to mess with user settings.

[7:38:31](#koRuPkKQ0YZaqAIMogBw3aM7yAhbCZdEWS92RVjmer4) <hiiamboris (NOT THIS ONE)>:
I'm using 200/50 too btw. But is there a reason doing it not system-wide?

[7:40:03](#94O-ImHGQ8ByX7xe27g2EakpQBZe6eTJ6W7gpUORpzI) <hiiamboris (NOT THIS ONE)>:
* Yes, you can generate repetition events yourself (though only on unix you will get precise enough timers). Otherwise the OS sends them, so it's not language's role to mess with user settings.

[7:40:27](#TyX6qzdJbJVB9SHRaLYxjVeDAl49IOd-361TqwFXezY) <hiiamboris (NOT THIS ONE)>:
* Yes, you can generate repetition events yourself (though only on nix you will get precise enough timers). Otherwise the OS sends them, so it's not language's role to mess with user settings.

[7:49:02](#KOIQnUMFTdbcgCdHMchMAAF-toAbgn7B38JsxpRivoQ) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
for example, for programs with keyboard control (games), so that a long press is worked out immediately and more evenly in time
```
view [ on-key [ if [event/key][print now/time/precise]]]
```

[7:50:43](#iBMoxjgt20t6GnG24iS_oYepYnRBSJi0-yKQRpOah5A) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
* for example, for programs with keyboard control (games), so that a press/hold is worked out immediately and more evenly in time
```
view [ on-key [ if [event/key][print now/time/precise]]]
```

[7:56:23](#pCCwwKB72fDctxZ4hUO42nWsuY7RVU-EKxc2cxbECzc) <hiiamboris (NOT THIS ONE)>:
it cannot work more evenly unless OS schedules your thread more often, or you're ready for 100% CPU load

[7:57:50](#OA5vECf093B27MmnHizMjsKWzPUYiPX8-aqTOh67j5k) <hiiamboris (NOT THIS ONE)>:
in https://gitlab.com/hiiamboris/red-spaces/ I'm providing delay argument to the timer so it can adjust the animation, if that's some help

[8:00:40](#mZ9cqL399H-ZfmbZhrW8n71EnBx9SGivW6ugDIh0yCM) <hiiamboris (NOT THIS ONE)>:
* it cannot work more evenly unless OS schedules your thread more often, or you're ready for 100% CPU load
e.g. Windows schedules your thread once per 16ms usually

[8:01:32](#Not-nZYBatSCQZGJ2rWDO0uYOt-K5-D_3Iz_oeHRMyA) <hiiamboris (NOT THIS ONE)>:
* in https://gitlab.com/hiiamboris/red-spaces/ I'm providing delay argument to the timer so it can adjust the animation (or number of key events your case), if that's some help

[8:47:36](#oHpwyGl4kyCkEURqSEi510CAnWyTvkVNSE2txSZz2yE) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
Thanks. Your work is impressive! As well as the work of the whole team!

[9:00:43](#ewAkWi8UhLMdi8a7-ejW8RgOF5w1MPfRrOaWWf6EeVU) <hiiamboris (NOT THIS ONE)>:
thanks Ì†ΩÌ∏â

[17:11:31](#qcRfbO2lQIYNTrF2NXis449jd1TLYZpUanWxEVA82Ck) <gtzip (gtzip)>:
Sergey, that doesn't seem to be the build that ypu compiled clock with. Latest build from website wouldn't report usr/datatypes/ on error

## 8-Aug-2021

[0:31:20](#OBSlttUx9i0RgrU7KTmP9oFva8Ja0YFS1n2bQh05FHY) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
@gtzip One assembly compiles one file. This file works flawlessly on a PC with an I3 processor and throws an error on a P3 processor. Works the same with the `-r` option on both processors. libRedRT.so removed / re-created - nothing changed.

[7:00:23](#OKg8s6fRAMkhTTRjVt3jL93S72WetA3jEMIclaJ7Ty8) <hiiamboris (NOT THIS ONE)>:
have you tried older builds, from a year ago, 2 years, etc?

[7:05:27](#W6RsyOd8E67SpJ8ZWbboe4Au_3cIy_ZfuJ9tbZN18To) <hiiamboris (NOT THIS ONE)>:
I don't believe we're using any instructions not supported on P3 though

[7:08:47](#iQXsyvwe-pyQcmmbKttzuawjuirsHDjQstaiFkiX0TU) <hiiamboris (NOT THIS ONE)>:
Since it's a View app, could be D2D incompatibility? We merged D2D during this winter, so try older GDI+ builds.

[16:48:37](#VsOYgVfE3U5344Egz0fQS1VcEBGZyBIKA_wjv-j-x0E) <gltewalt (Greg T)>:
Weird thing is the error reports a local directory `in file: /home/user/datatypes/money.reds`. Shouldn't that only be so for building from source?

[16:55:59](#ONZXwkC6hfpwyw0o2hHqGY16zEoAXkCbSbcja9tJ_vw) <greggirwin (Gregg Irwin)>:
Yes.

[23:46:31](#imJCY9eIGXAQWBuSAY-SuGp-JzTZu4Xn5mqL0Iy359I) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
Once upon a time, I building it on this PC from source, but for compilation I used the just downloaded version. I will try to clean the system of all old files.

## 9-Aug-2021

[5:37:46](#f0tFcZzbemJeBmQghbJdKlrwpr6Dx3ipTRWREkIyvb8) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
Deleted all files named libRed*. 
Compiled with -c option - error. 
Compiled with -r option  - works.

[16:27:10](#aj4T_PmcUc8Xsk-TEjgvKmp-QJvalrRyRYy17mgcSIM) <greggirwin (Gregg Irwin)>:
@Sergey_Vladivostok_gitlab what does `about/debug` say on your end?

[22:39:33](#AesAUwvg8hiHWgXUztB-Lc-liGtPnXOc4wMZpFjLAVc) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
```
>> about/debug
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 3821 date: 5-Aug-2021/3:17:56 commit: #e01002f7cbbf7d3a039785f0ce4a8f668ba7f87c ]
PLATFORM: [ name: "Ubuntu 18.04.5 LTS" OS: 'Linux arch: 'i686 version: 4.15.0 build: "#140-Ubuntu SMP Thu Jan 28 05:19:23 UTC 2021" ]
--------------------------------------------
```

[23:55:23](#sJXfLq1UiJ2IarIq8q1O1n9l_oxfL__vW26h8Qk5ZA8) <gltewalt (Greg T)>:
Maybe `./red clear` just in case it's is strangely hanging on to some info. (I don't know, just a guess)

[23:56:16](#4TUrG_xdOvnVs5R6G2SukzJLw-uxxfneL9cZy9pU8Bo) <gltewalt (Greg T)>:
* Maybe `./red clear` just in case it's is strangely hanging on to some previous info. (I don't know, just a guess)

## 10-Aug-2021

[1:18:02](#3SLH67R30sg99YhdxBnCt87iQGFpIiGVjiH6EnjfomY) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
without changes

[5:45:07](#IOBABpU96GsYjn0FHuRADGLmm6WoREVyDAuOAVIQ2js) <toomasv>:
@Sergey_Vladivostok_gitlab I haven't followed closely the discussion above, but if you haven't tried it yet, try `-u` (update libRedRT) option too with `-c`.

[23:30:27](#TEUJYNklrIh8RYOzSttfl-sUsf700it_VXifUD0cnJE) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
@toomasv I've already tried it. Now I tried again - an error. With only `-r`, the working program is compiled. Or run without compilation.

## 14-Aug-2021

[8:17:01](#if5HgdrP6kdvf_4d9mAoNC4EAVzDOxZGl8h7X3I4AhQ) <ams02468 (ams02468)>:
Hi everyone I have a question what should I use to make a flag for cli? Like **help  -h**

[8:51:06](#q5-9gBtSRQf7ApsQSP9OozVfiQST9PYtT-T6BL9xhRQ) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
@ams02468 try `? system/script/args`	

[8:56:27](#B-AaYP-0Cnwu60SrmicQBueGPL3xbgy7e64f__RHB1g) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
* @ams02468 see `? system/script/args`	

[9:31:12](#0kMZ7IwGXKLw4wfjyWEYjRWqIN7Tiqf3poxc10YYMQo) <ams02468 (ams02468)>:
thx 

[10:19:02](#887t5i2aDUHdcv5QRz-wV4wx-xcm1jKMSrhSazBQo4g) <hiiamboris (NOT THIS ONE)>:
https://gitlab.com/hiiamboris/red-cli

## 17-Aug-2021

[9:31:42](#A652NoDBZpYVNCmsjPr83ZLw_uCchAnHOGDnV4Xyl8Y) <3dc1d3 (pechkin)>:
Hello all, I'm new to Red and curious about the relationship between Red and Ren (the data format) - is there something Ren can do that Red cannot?  Or does better?

[9:37:56](#zN6rnTpPqcoXdtFi5kPG5jyVc0lX6UE-2Ija95W8CvU) <hiiamboris (NOT THIS ONE)>:
@rebolek might tell

[10:14:00](#hIeJea0ZeMr3ZJ0qX0F1U0btiYfAzr3WznVFFB7CSIk) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Ren is not a language, it is just a data format. The idea was to create kind of next gen JSON format, or at least the one, which could be shared between the Redbol lang implementations. Author of Rebol, Carl Sassenrath, defined a new initiative in that regard, called ASON - https://altscript.com/

[10:15:28](#4sXwUgKqTrk4AJUYKOTUVbTR3Fa1jmh89el81XmM-QU) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
For us, Redbollers, it would most probably mean a conversion via a codec system anyway ...

[10:48:05](#xuF7pUCSamJh0-TRur0_LqH01cYqv-_Sp4cttXJ7i1E) <3dc1d3 (pechkin)>:
interesting, thanks, but I still don't see why bother with Ren or ASON when Red/Rebol "is it's own data format" with 50 supported types (most of which can be ignored if not used)?

[15:26:32](#KIqGfeClu2xVNCdoml1BeYGwuddA1TR2DpMDrt6nLH0) <rebolek (Boleslav B≈ôezovsk√Ω)>:
@3dc1d3 the idea was to make implementations of the data format in different languages, it was done in time when Rebol development was dead and there was no Red yet. And I still think that having loader/save for rebol-like format for i.e. Python, Javascript etc makes sense.

[15:50:16](#MSl93Y9ubVBBFr5TEmYcOxRHzBY828DRcEv2rdFW_n0) <greggirwin (Gregg Irwin)>:
Also, because people feel strongly about their languages, but not so much their data formats (except us of course :^), they may be willing to use a data format outside the context of Red, where if we push them to use a Redbol lang, they may write off the value of the data format as well.

## 18-Aug-2021

[7:19:50](#CrtNuEqMbpNo0ptMKSQSgGgd0XUorUouajSPcyoHL54) <3dc1d3 (pechkin)>:
Ah I see, thank you both.

## 19-Aug-2021

[2:48:58](#A_zH8c-rtF_4mO1PS_hHhMD2tHTorlvyL2Xk0jtS1AU) <RayMPerry (RaycatWhoDat)>:
Been working with Red again. I'm trying to make a simple calculator application but I keep running into problems. So, `calculator-working.red` works as expected but the other file doesn't? I'm not sure why. Additionally, I'm finding it hard to build faces programmatically. I keep running into the same error I have here ("invalid syntax at"). tl;dr: "How do I generate faces with a foreach? What is the correct way to approach the View dialect?" https://gist.github.com/RayMPerry/c58b966cf064bd100f6cdabf614598aa

[3:09:36](#RKDXb3o5w4qkIDqeBhiKkB_XgbhmF0xIGXhdMoAVgHM) <gltewalt (Greg T)>:
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


[3:40:25](#N-2H3anNsqWd3jRq2Kb0zWx_Dx6jRVQCui-74z4F-lU) <gltewalt (Greg T)>:
to use a block of regular Red code use `do <block-of-red-code>`

[5:34:41](#Yy_yTpq0sKDh9jTv3hH0_hjKdFWDAlyVM5MjEc-3g_k) <3dc1d3 (pechkin)>:
sorry for the dumb question but what am I missing here? (tried searching the docs but can't understand what to search for) - where should i look to better understand red's parsing logic?

```
ls [get-env "HOME"]
ls do [get-env "HOME"]
```

[5:38:55](#L9AfnspmHCzCYVry2BI3pJoP86mygyEZz0UerjuO_Jw) <rebolek (Boleslav B≈ôezovsk√Ω)>:
`ls` takes next value, does not evaluate it, and turns it into `file!`. It's meant for usage in the console, so you can write `ls my-dir` instead of `ls %my-dir`. Normally, it would evaluate the word `my-dir` to get its value.

[5:40:17](#M_ZwI_G3rAEJgaGEaDR77qRMxDOOiCtv6ciS0oyyZvM) <rebolek (Boleslav B≈ôezovsk√Ω)>:
If you want to evaluate, use `list-dir` instead. However, `list-dir` expects file and `get-env` returns `string!`. So you need to manually convert:
```
>> list-dir to file! get-env "HOME"
        .bashrc         .bash_logout    .bash_pro...    .config/        .dir_colors     .Xclients       .dmenurc        .gimp-2.8/    
        .gtkrc-2.0      .i3/            .icons/         .local/         .makepkg....    .moc/           .profile        .xinitrc      
(...)
```

[5:41:04](#zHfa4Df1kxwWA2-9XMat-zdj3VkDQ6nYpmKM4PxUSLo) <rebolek (Boleslav B≈ôezovsk√Ω)>:
* `ls` takes next value, does not evaluate it, and turns it into `file!`. It's meant for usage in the console, so you can write `ls my-dir` instead of `ls %my-dir`. Normally, a function would evaluate the word `my-dir` to get its value.

[6:07:31](#rgdFV7QP3wehQY5y8SFgT3Fv62xDmHfWxPSfeoT5KO0) <3dc1d3 (pechkin)>:
ahhh ok, so `ls` is like a macro then and feeds the raw first arg.  what happens to the rest of the args to `ls`?  are they simply ignored by the parser?

[6:10:04](#FtTIORXnGrqjYFpZ3BUNXDxRPhp5lXLlWIM0OP4Z7XQ) <rebolek (Boleslav B≈ôezovsk√Ω)>:
If there is an error, the evaluation stops, if there is no error, it continues:
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

[6:19:26](#XoJ2lT4mry4NHOAzM9z8MRJSNXgLvSQcO5_hMJ1V2m8) <3dc1d3 (pechkin)>:
ah ok so it's like a newline.  is that special to `ls` or is all of rebol/red a continuous sequence of commands (ie. new lines are not special)?

[6:55:26](#LjixIq5KrjWppCCZRV8UL7---oc-PjZH85_sYZSRHh0) <rebolek (Boleslav B≈ôezovsk√Ω)>:
newlines are not special at all, red/rebol is a continuos sequence.

[6:57:35](#8T1wRVawSVgUZvr7qGpnmhQ31mXaq9xZFvMtL-A19yA) <rebolek (Boleslav B≈ôezovsk√Ω)>:
the evaluator takes first value  and evaluates it. if it's a function, it evaluates its arguments based on its arity. then it continues

[7:34:12](#k7Rv-ZzMAgdEow6OvY7IUmS6NVmrLmsdR6VKpvtzSwo) <DideC (DideC)>:
@RayMPerry According to the VID documentation:
- First, let `title "Calculator"`be the first line of your view block as its a container statement [see](https://github.com/red/docs/blob/master/en/vid.adoc#code-structure).


[7:56:22](#hSi-rkzFWGYwZmDVhO78wYvhC0zRZOkPRsHPjxB916s) <3dc1d3 (pechkin)>:
thank you for holding my hand @rebolek, I promise to come back with harder questions :)

[7:58:06](#OWR48PNXXzdFIF4QpjHhL0BWmXmJ2FvwXO0Lx-nUHRw) <rebolek (Boleslav B≈ôezovsk√Ω)>:
@3dc1d3 I hope you will Ì†ΩÌ∏â

[8:03:58](#KAWHNwGPtMKcaALa70tCCX53uPpHip7MAERHMlnLRr0) <3dc1d3 (pechkin)>:
:+1:

[11:27:16](#voy8-XIBN7rWL4I_ZtQRlb1i3dyOQLpyQf0IrVEkf1A) <3dc1d3 (pechkin)>:
ok I'm back with something more complicated...  trying to compile the view eg [here](https://www.red-by-example.org/vid-misc-faces-red.html).

it works fine interpreted.  it works fine compiled in dev mode.  but in release mode i get:

```
*** Script Error: view has no value
*** Where: ???
```

I'm running `red-12aug21-5398bf076` on linux.

I noticed there are fewer libraries linked into the release build:

rel: 23
dev: 73

[12:09:07](#ez2W77pXY-21_-cNo0KUGaPzOtZ3pULvf96iSGEPXCM) <RayMPerry (RaycatWhoDat)>:
Thanks, @DideC @gltewalt 

[13:28:17](#d563OlJJmewVmLbNP20uDQjmhANU_KOjLMFRHODdv9k) <hiiamboris (NOT THIS ONE)>:
@gvolk0 `needs: view` in the header

[13:55:02](#18T6SQwryVWY1NsKIkdToYc8Y052n-2P8VZD-IIeDTI) <RayMPerry (RaycatWhoDat)>:
I think I'm coding myself into a corner here. https://gist.github.com/RayMPerry/c58b966cf064bd100f6cdabf614598aa Running into weird issues switching between contexts. Is there a better way to structure something like this? How should I structure this in a more idiomatic fashion?

[14:07:02](#W0qRa0RgiGIbHmFTj0nEOxBNDeB6_zpyO6CJWs6Uhk0) <hiiamboris (NOT THIS ONE)>:
I don't see any context problems in your code. You're trying to convert arbitrary text into integer though, that is an issue Ì†ΩÌ∏â

[14:07:39](#TCT1px5qj_JgacG25ULm5tXew6fWBTJ46psAoSXLLhQ) <RayMPerry (RaycatWhoDat)>:
Oh? What would be a better way to do that?

[14:09:14](#0giHYgfkfqTh9cLwjy_uO3fIo96H7JodXbdof5zg8x0) <hiiamboris (NOT THIS ONE)>:
Well, you should consider evaluating your expression (with `do`), and also insert spaces because these are important in Red.

[14:11:57](#e2C0WI14G2AMBkd-N0cwDDCe8TAU5s0xxcistOvkaTo) <hiiamboris (NOT THIS ONE)>:
Here's two calculators to draw inspiration from (on extreme ends of Red-ness Ì†ΩÌ∏â
https://github.com/red/code/blob/master/Showcase/calculator.red
https://github.com/zwortex/recalculator/blob/main/recalculator.red

[14:12:05](#mIzvf_O3-amcs_4n0bxwwd5EBCkUmWtjTnwQTw6ZCBk) <hiiamboris (NOT THIS ONE)>:
* Here's two calculators to draw inspiration from (on extreme ends of Red-ness scale ;)
https://github.com/red/code/blob/master/Showcase/calculator.red
https://github.com/zwortex/recalculator/blob/main/recalculator.red

[14:22:56](#EdZPDRdUgcexvpmLDal_chWf3ZDpCyEtiLnGR_voDB8) <RayMPerry (RaycatWhoDat)>:
@hiiamboris Thank you for the links. I'll take a look.

[19:51:45](#SUrcC5QSUo09rgq8X6ymPchtoG0j_-6QHlOKN0ml2fg) <gltewalt (The other Greg)>:
6600 line file? ...could probably make an OS in that many lines

[19:54:59](#wIsf1ey8n2CpynqQjGr8Jr-NSqJv4LRjQZIbVOA0gvw) <hiiamboris (NOT THIS ONE)>:
CalcOS ‚òª

[22:05:40](#IY-XxMBUR1brFzFb4XiXqwhoNYpc7q-76IO5FC49mus) <greggirwin (Gregg Irwin)>:
@gltewalt:matrix.org it's a pretty polished app. Not your basic math calculator. It really is on the spectrum of a CalcOS. 

[22:07:22](#2vt4IRuTEA5iJjgsk7x-PQ5i2T9tJtjBFf9vokVeNZY) <greggirwin (Gregg Irwin)>:
Play with it and look how beautifully the equations are rendered.

## 20-Aug-2021

[0:38:25](#uz8ttBZueBxU8l3rYk3UVoIdA9nC9wgFLxlb2OO3iEE) <3dc1d3 (pechkin)>:
@hiiamboris i do have that:

```
Red [
    needs 'view
    file: %view.red
]
```

I tried without the tick as well.

[1:34:44](#PP0QnL1bTVPb6FG1vEFOMZo5YWR0xrdHIJm0FsmniP0) <greggirwin (Gregg Irwin)>:
You need a colon. `needs:`

[2:54:04](#DKwVR3-hyWG94m8pgc5O_Mq28c9pNvhSLW-RPicKcj4) <gltewalt (Greg T)>:
@gvolk0 @RayMPerry  These are good "getting going" examples:
http://redprogramming.com/Short%20Red%20Code%20Examples.html

[2:55:09](#0hL6qeMdKhtOBEJ0-tZ0_aqPQZhSsQxzxjHwDlRX9Wo) <gltewalt (Greg T)>:
Then try out the VID docs: https://github.com/red/docs/blob/master/en/vid.adoc

[3:42:50](#srxWQ-LxtfqYIkqIqPBPIlZC1fry56tqgza7lMnc9Ro) <3dc1d3 (pechkin)>:
ahh geez I feel silly but then again this was an example from the red docs...

why does it work in dev mode then? and why is there no error?  `needs` is not a function

[3:43:26](#04nUPfq-Ge8rbBx4zMDKsMI_SZajyWu45RS_3XAYD9Q) <3dc1d3 (pechkin)>:
thanks for the links

[3:45:29](#CkIIq4L-hlQXWV5MNs1Os7QbIc9Tdj0cUivVsBxJQ9s) <3dc1d3 (pechkin)>:
to add to the above questions: it seems to work with `needs: view` as well as `needs: 'view` - what's the significance of the quote?

[4:12:36](#YuqwIlZKE3IqKogV-Q4DX-J-74uWeBrogxy0vTWIzHE) <gltewalt (Greg T)>:
Are you using a Red console build and not building from source?

[4:14:10](#6uuuv9qOYMAbhOodGUqCoCMKaJKKQWxTrmOn4ldUSkc) <gltewalt (Greg T)>:
See the note:
https://github.com/red/docs/blob/master/en/view.adoc#13-including-view-component

[4:15:25](#jGmnDajMZe_36UQZuxNx-oKoH2NU13KxM1v5GC0WyoQ) <gltewalt (Greg T)>:
If I recall correctly (and I may not), view is available in dev mode, but you have to specifically  include it in release mode `-r`

[4:16:23](#3klJMeamrxPoEu6-GJiyXXkHT3-IKNnU0f7is__J7RI) <gltewalt (Greg T)>:
And honestly I don't remember about the quote

[4:16:55](#PH5Qv51omjuHtgSss7xt5y-bPuqE4TK_ijWcJLKwxpo) <gltewalt (Greg T)>:
* If I recall correctly (and I may not), you have to specifically  include it in release mode `-r`

[5:05:06](#anbxtGaU6xggARhkSVEStmDdZXXevona8m-iovhw-fQ) <3dc1d3 (pechkin)>:
i downloaded the latest current build, did not compile from source.

[5:08:38](#uujH0dVGFLGkgt0rkpT2r5vzX5GAa9YcqUGMp5ktON4) <3dc1d3 (pechkin)>:
> Using consoles auto-generated by red binary will include the View component on platforms where it is available, 

i think dev mode builds link to the same console?  that would explain why dev builds work without the header.

doesn't explain why there's no error thrown on the bogus `needs view` line I had (no colon)

[5:59:47](#W6ftwDUPdvyjGWsktNrMJIMBDBwbJnzK5G8ZrYu_Xts) <greggirwin (Gregg Irwin)>:
If you run interpreted, from the GUI console, the view module is already loaded.

[6:01:35](#V3hc2ifqX_JDPUuJ1QIO15VnQ5EoprBFfoLHopmR36I) <greggirwin (Gregg Irwin)>:
The difference the quote makes is that it's a `lit-word!` value, which is normally treated as a symbol and not evaluated. In the header, you *can* use it but don't have to. The difference will be important as you get more into words in blocks and the fact that blocks are not evaluated by default. You're off to a good start.

[6:04:46](#S21urjOU1tRh0Ehz42VZvsMfeYUKCnabHGzj967cK3M) <greggirwin (Gregg Irwin)>:
No error was thrown because...well, Red *could* do that but how strict we are is sometimes based on the current implementation rather than a hard design choice. So how Red treats the header internally is up to it. The header is just a block and can contain any value(s) you want. It's just that Red looks for specific keys for certain things. I could ramble more, but that may be enough for now.

[6:20:14](#R80Ra7dltrtlDcXbSIz6dXCQp-oZ82wMJYbAIAlCULs) <3dc1d3 (pechkin)>:
Understood, thanks for the low down.

One thing though: i'm not running it from the gui console, nor interpreted (but as I mentioned that does work fine).  What confused me is that /compiling/ worked only in the default development mode - my understanding is that this is because it links to the same library that's used by the interpreter console, but in release mode it strips out everything that wasn't explicitly (and correctly) listed.

[16:28:04](#NjdS4jzDYnYDQa0E9DbZJT0N3WsVNlsr9zTsH92sduU) <greggirwin (Gregg Irwin)>:
Correct. A shared runtime has to include everything, as any app may use different pieces.

## 22-Aug-2021

[12:20:19](#HeHF24LIoO7VOYK5fkzEkbs5f2yAgvb1n_JCm8xm2KU) <RayMPerry (RaycatWhoDat)>:
I find myself doing consecutive `if` statements when I want to do an `or` statement for the condition. So, instead of `if (none? largest-item) or (item > largest-item) [largest-item: item]`, I end up doing:
 ```
        if none? largest-item [largest-item: item]
        if item > largest-item [largest-item: item]
```

[12:20:28](#dHTzYqTDiCzarqKYijQ1vyenTS-8sP63mYqwZO9mwyc) <RayMPerry (RaycatWhoDat)>:
Which kinda sucks.

[12:21:06](#Ry0Sec8bBwkFbgmF429t2dxTCW-0YMHCu5fHOdy-q1E) <RayMPerry (RaycatWhoDat)>:
What's the idiomatic way to do this?

[13:24:22](#4EiWiY7vticw0yigrI4QYDpi7dVc2ywQh5BWlW1ICIo) <hiiamboris (NOT THIS ONE)>:
Why `or` doesn't work for you?

[13:24:57](#WLV9ki67ooGmWeaIK38T2RM0ntay1Q6K2OUCg4sY1EE) <hiiamboris (NOT THIS ONE)>:
Idiomatic way would be `if any [] [...]`

[13:27:38](#NPoAv0B-oEp3BQDHr0Wam2BkPG88mgEzviKkgeNbhII) <RayMPerry (RaycatWhoDat)>:
I think it's because I'm trying to `>` with `none`?

[13:28:03](#4zg-RdpIbIDz5_RrMxv9vjFLRozjYrOz3KhjkfT_Q70) <RayMPerry (RaycatWhoDat)>:
But I was hoping it was just short-circuit after meeting the first part.

[13:30:27](#jp1S8L8W6-Wjt5KA5Qdd1F_ISUMf2nfGTPfb_Eotnv0) <RayMPerry (RaycatWhoDat)>:
* But I was hoping it was just short-circuit after seeing the first part was truthy

[13:49:43](#MnriBr4F4P-nqMGA4EOGkcPz7yM_xgCaGmA8-68lAPk) <hiiamboris (NOT THIS ONE)>:
Right.

[15:18:00](#4ZItr7KqpaibVWe2PSUh12pnQETAxdj_03d6jgCLGZM) <gltewalt (Greg T)>:
```
>> largest-item: 9
== 9
>> item: 99
== 99
>> largest-item: if any [none? largest-item item > largest-item][item]
== 99
```

[15:25:04](#IC7EkxXkNxKN5UxhI2hHuDI-_TuAlE_9HdYLdBFVko8) <RayMPerry (RaycatWhoDat)>:
Right. But if `largest-item` starts as `none` and try using an `or` statement instead, what happens?

[15:30:07](#ZwRhYE25gMGih-YoIlXkXCIf_Q9Lmla_m0KfA_y-Qtc) <hiiamboris (NOT THIS ONE)>:
or is not short circuiting in Red.

[15:32:29](#4fe9GgraIU9fu6v_vy86t2VvBgFODK74RSkvwc_jDI8) <RayMPerry (RaycatWhoDat)>:
Ah, okay. I can see why it isn't.

[15:34:25](#QYJlbYk0juu4EhMLCHdkK1ynb6piHf4dX48VG6E0bl4) <RayMPerry (RaycatWhoDat)>:
Another question for you all: is there a word bound to the global context? I'm making a library and I wanted to keep track of all the words I create so I can output their specs. I figured the global context is too jam-packed already so, I threw all of my functions into a new context but now I can't figure out how to bind the words to the global context again

[15:34:53](#w9y-0kqizRDNeqXpByA7NdRUyeVP4w7kMwAeFLA_v-Q) <RayMPerry (RaycatWhoDat)>:
The main reason for putting them into their own context was to use `keys-of`

[15:34:59](#yHMKfEF1KAKiJVOhj_KMBwIxsDJv0TDjS8sE272OB24) <RayMPerry (RaycatWhoDat)>:
* The main reason for putting them into their own context was to use `words-of`

[15:42:07](#PI9Gz6Dg92Hm3VWSCz7vmHSFQzuCLDkAGsYhmRa5NtQ) <RayMPerry (RaycatWhoDat)>:
UPDATE: Think I found it. `system/words`?

[15:45:12](#MwKALObo3xHPum24YCzb8IiNd6IYaDW-jUv4wovehiE) <gltewalt (Greg T)>:
yeah

[20:01:15](#GkHZuv1JWWpLc4moAAeo--0fcA4A8wLKrKgEqlYEiPg) <greggirwin (Gregg Irwin)>:
@RayMPerry `any` and `all`, like `either` quickly become very natural to use and read.

[20:06:44](#5FHDIuxA1rBePph1ffYNiiPJHDo0w5lB8A4fuvdpR-g) <greggirwin (Gregg Irwin)>:
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
Words can be bound to only one context at a time, so if you want a global reference to it, use `set`. You don't have to have an internal version as well, but it may make things clearer. Eventually we'll have modules (big design space, so lots of R&D), where you'll be able to declaratively express this. In the meantime, many of us have old `export` funcs. Good subject for tinkering and chat.

[20:07:12](#w2JMraJnQrcvSsxjKR_UP_rGv6Fcgyv-TL-so9LHMGM) <greggirwin (Gregg Irwin)>:
And yes, `system/words` is what you're after as far as the context.

[20:09:12](#lF7H9ONkfiWKC2k0UJ1yQfl6dEh0LGnCrABNosVhuz0) <greggirwin (Gregg Irwin)>:
* And yes, `system/words` is what you're after as far as the context if you're using `bind` yourself.

## 23-Aug-2021

[0:11:33](#q0tZV1UK7qzQrspKsD-pWSGrdiBbgOW5OVPxL2pHb0k) <3dc1d3 (pechkin)>:
What happened to Rebol's ~map-each~ and ~apply~ in Red?  Red seems to be perfect for functional style but it seems to be devoid of it - what's the rationale? (I saw the SO post to "implement your own apply" but I don't understand why something so useful isn't part of the language)

[0:52:52](#KXMKbcyRTSZrNNATnKy4BsMZosA9kJ050vCccfC0irU) <RayMPerry (RaycatWhoDat)>:
`map-each`, I don't miss too much. I agree with you for `apply`, though.

[1:43:54](#XTs_2txeubwCJcgbYl070W02N5badfOPHK-MzZCA6vk) <greggirwin (Gregg Irwin)>:
`Apply` has a [new candidate](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/apply.red) implementation by @hiiamboris. But we need more input and @Dockimbel has to sign off on it. 

`map-each` falls under the HOF umbrella, which has a lot of experimental R&D in place already. 
- https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/new-each.red (any much more in that repo)
- https://github.com/greggirwin/red-hof Pay particular note to the code analysis section by @hiiamboris. 
- We have a private room here for HOF work as well.

[4:53:24](#yiXgPnFKXlX0TjVtdDT135h6coAoia7IOZavmvu8d_M) <3dc1d3 (pechkin)>:
so in a nutshell it comes down to being difficult to implement well due to the nature of Red's syntax?

[7:04:41](#Ucmp081f5Drk81qwMGpGoKn56KjQje_Dp5hM_uxOa2E) <hiiamboris (NOT THIS ONE)>:
No Ì†ΩÌ∏â Implementation is the easiest part Ì†ΩÌ∏â

[7:05:51](#emwZmvKac-sqRJBJaGCcJPwgPXL8SxqJDKRjThsMITQ) <hiiamboris (NOT THIS ONE)>:
Difficult to evaluate how it will work within the big picture in the years ahead, with all the other planned features. 

[7:08:47](#D_VkDLU0OpC1g4iF_jHavbYEiIx6ENdS4OgKBxQ1OuU) <hiiamboris (NOT THIS ONE)>:
I'm myself pretty confident in `map-each` design. Not so in the `map` (FP-style) design.

[8:08:02](#nw_F-zuqF2vOswnixeDjWRxNpOYRNxVKQTFvX_PBSP8) <3dc1d3 (pechkin)>:
hmm alright, thanks

[12:13:43](#2uqTeNIwAH82MGuAPSJceoVY5e7SMbOzoab5M3wbE4E) <RayMPerry (RaycatWhoDat)>:
> https://gitlab.com/hiiamboris/red-mezz-warehouse

[12:13:55](#EKi9wtCZ1tNNUDSUHJBkc9-L3Et-umXyK-h-8cU9sy4) <RayMPerry (RaycatWhoDat)>:
Oh. Well, guess I don't need my library

[12:32:30](#orIxlYA1qYe9JqP4RG1K67sBbXOu__Hf1lwostr7BK4) <hiiamboris (NOT THIS ONE)>:
‚òª You're welcome.

[12:34:01](#Lz2ifR1w2aG_iId5mPKzW-ilN6IY93Eqx0v-HuhbWNU) <hiiamboris (NOT THIS ONE)>:
When you get to apply it please share your experience, as I'm probably the only user of it so far.

[12:34:57](#Zjn6Dgn2DXGiPVRwBprN4xmiMxGx8U2vHDDpgZVZrw0) <hiiamboris (NOT THIS ONE)>:
* When you get to apply it please share your experience, as I'm probably the only user of it so far (and getting feedback is important part of design ;)

[16:17:29](#gSwWyccTzHZFSgq8M6f8tFuRgoCpNGsRxaelAi1U9iY) <greggirwin (Gregg Irwin)>:
> Difficult to evaluate how it will work within the big picture in the years ahead, with all the other planned features.

:+1:

[16:33:18](#M3_7ABfppubkEW7OrPZFesVIJq1cc3lZVAF1IxhNBg0) <greggirwin (Gregg Irwin)>:
> so in a nutshell it comes down to being difficult to implement well due to the nature of Red's syntax?

If we change "implement" to "design" this is more correct. It's not hard to do because of Red's limitations, but because of it's flexibility and rich set of datatypes. Every day we run up against questions about what is most intuitive for a human user, but which may conflict with consistency in the language. And we are *incredibly* fortunate to have a team and community where different people focus on each of these aspects, argue their merits in a civil and patient manner (most of the time anyway; we are human after all. ;^), and understand that compromise is often the best path forward. 

## 24-Aug-2021

[23:57:56](#XzoR7RcLsBlK3PFxWjVDYRF4Tj6s0cOrd3zj9xydA18) <3dc1d3 (pechkin)>:
> but because of it's flexibility and rich set of datatypes.

that's what i meant.

## 25-Aug-2021

[19:22:29](#92Og4gCiWmskCKny2-GRA9gTq2VJcWrdtwqszhXfyNc) <RayMPerry (RaycatWhoDat)>:
Does anyone exclusively use Red here? If not, what else are you using?

[19:35:13](#L7RaL0QKbLU8ZM1QKmyfKJNwV9zCgBCQkcqKNXig2zc) <planetsizecpu (Jose Luis)>:
Yes @RayMPerry I use Red exclusively, just to learn & have fun by now. Welcome btw!

[19:59:33](#c6jRWZTIourt7GfxjVQ9ia7GDu4rcxcU8hErTliRvbI) <Respectech (Respectech)>:
I use Red and Rebol exclusively. Well, also MySQL, HTML, etc.

## 26-Aug-2021

[10:04:16](#uxxIem3ULvYhg8SSy0olncnKXAf9cDUfBb_doQbC6wU) <ldci (Fran√ßois Jouen)>:
@RayMPerry Only Red with sometines links to Python :)

## 27-Aug-2021

[2:04:03](#0uKnvdnU3ud1QAlFQQIvkPfkmr1KaM_DInE2r6BzOHA) <3dc1d3 (pechkin)>:
is this the canonical/correct way of working with computed list expressions?

`reduce [1 2 do [1 + 2]]`

[2:54:14](#0yVwAGKKgzoIondPH7dKTLFslU0HYxm3RFGz_qD13DE) <greggirwin (Gregg Irwin)>:
There is no single correct way, but since there is no `reduce/deep` (it comes up as an idea from time to time), the most common approach is to use `compose`.

[5:45:18](#28nWYBdAv8ivADLAf9h98TY3Wrt3DpYrVCUnm5hIM1I) <3dc1d3 (pechkin)>:
ah that's a bit better, thanks

## 29-Aug-2021

[4:02:22](#fLaE_nBEzFFTgVHA46ZgUURu3iRGtFRF6y6w0qf4tmY) <ams02468 (ams02468)>:
Hi, how can delete a variable completely? 

[6:18:00](#idXghgCD_5y7iodwAr4v_PNhf1mq_r5laytYZgeNjqE) <planetsizecpu (Jose Luis)>:
@ams02468 just `unset` the word, GC will take care.

[7:08:26](#h46plk0ZyTAzzW0sgVAKZA2deY4AcUiN1u_03Ut_YaE) <ams02468 (ams02468)>:
thx

[9:50:10](#5HcUyCz5XiE5nGbIbybzVuO_rnI3fLuKpwqOMd5FY00) <ldci (Fran√ßois Jouen)>:
thx

[9:50:14](#tlo85sj0sRYXCzd2FZMGJPa_5TUEXOwiLNMFHZe6rNQ) <ldci (Fran√ßois Jouen)>:
thx

## 30-Aug-2021

[16:11:34](#lp7XU0wHbof3iwPQnBYv_PKiB8LStkO7km4lvI-VRf0) <RayMPerry (RaycatWhoDat)>:
thx

[19:08:00](#VsQlJr6EZtK-buovrCbk6E5Mg3OjrlXVI5lNHMfyIzw) <RayMPerry (RaycatWhoDat)>:
Are you able to make custom datatypes?

[19:14:13](#hbqsmAMCfVXzKh40cTz_pvWQtD1n6NqOnt4nWqTmGro) <greggirwin (Gregg Irwin)>:
Yes. You need to write them in Red/System (R/S). All the source is available to see how the [existing datatypes](https://github.com/red/red/tree/master/runtime/datatypes) are implemented.

[19:25:17](#pLA5yNlmaU0YLQx6laQ3vEeOZZsQKXIZK-8YIQCwyJE) <RayMPerry (RaycatWhoDat)>:
Ah. That seems pretty involved for what I'm trying to do (a bit of OOP)

[19:51:02](#2gA8Df30LH__Jfkg0sPthDOjMPfzkyxoOlWNB0wCyuQ) <greggirwin (Gregg Irwin)>:
Using objects as prototypes may be a better fit then. 

[19:58:25](#7oOpo3HaB3VJF3976qnQOLdkkl8XHC_LSL7oXjJQ1vo) <RayMPerry (RaycatWhoDat)>:
Ah, there it is. Thank you.

[20:10:32](#ZeVbjEaNBuw4OPsB686P7tiTPK-1nLUpvXu1xy5P4UM) <greggirwin (Gregg Irwin)>:
If you happen to tinker with [reactors](https://github.com/red/docs/blob/master/en/reactivity.adoc) in the process,  [this](https://github.com/red/red/wiki/%5BDOC%5D-Reactivity) may save you some hair pulling.

[23:48:19](#9ZWpd7-wVEGD2pdpsZhmiKFaDHTl3WUf75vTTT11HTw) <RayMPerry (RaycatWhoDat)>:
Well, I am having trouble with reactors but for a completely separate thing. https://gist.github.com/RayMPerry/fe352905966b4189c42f2d723e124033

[23:48:43](#Idk8B8UcRpq37DZKszkGeANNXJZT5bQOB8oqvy759y0) <RayMPerry (RaycatWhoDat)>:
For some reason, that `react` block doesn't work.

## 31-Aug-2021

[5:02:20](#gJo-_UGUdvjmAwIn7zNJ9KfNAC7EKCVxymlwwV0HA0k) <toomasv>:
@RayMPerry You need "[at least one reactive source](https://github.com/red/docs/blob/master/en/reactivity.adoc#react)" in your `react` block. I.e. instead of `context` use `reactor` for `files`:  `files: reactor [...]`.
To save one click you may also add `focus` keyword to `search-bar` field.

[5:03:03](#fMqbsxMcUZq_03MYkVw8XJYek8QF_aWmI6Esnr1HIwk) <toomasv>:
* @RayMPerry You need "[at least one reactive source](https://github.com/red/docs/blob/master/en/reactivity.adoc#react)" in your `react` block. I.e. instead of `context` use `reactor` --  `files: reactor [...]`.
To save one click you may also add `focus` keyword to `search-bar` field.

[5:07:35](#81zC02lOvzpAXUcUhgcknDTp5byDkb9A5xaNIwCZTlE) <toomasv>:
* @RayMPerry You need "[at least one reactive source](https://github.com/red/docs/blob/master/en/reactivity.adoc#react)" in your `react` block. I.e. instead of `context` use `reactor` --  `files: reactor [...]`.

Some remarks more:
To save one click you may add `focus` keyword to `search-bar` field.
As `read <dir>` returns block of filenames, there is no need to use `/lines` refinement -- that is useful if you read a string with line-breaks only.

[5:35:49](#ZuPAf1sSTWZlfs_dBhUVqYlqKiwMIbEpybylS_PupgE) <toomasv>:
Also, at least on Windows, changing series in reactive source does not trigger the reaction unless explicitly referred to by set-word (tried also `deep-reactor`). I.e. in `delete-item`, although `files/filtered-files` is changed when item is deleted, this is not enough to trigger reaction so that `file-listing/data` is updated. You need to use explicit set-word to trigger the reaction by adding e.g. `files/filtered-files: files/filtered-files` into `delete-tem`.

And you can use `react [face/data: files/filtered-files]` instead of `do` block.

[5:39:17](#YDlcyxx0NQIXJMK-jiJYttkEzxfXD8NkP8tPPY4n7ZY) <toomasv>:
* Also, at least on Windows, changing series in reactive source does not trigger the reaction unless explicitly referred to by set-word (tried also `deep-reactor`). I.e. in `delete-item`, although `files/filtered-files` is changed when item is deleted, this is not enough to trigger reaction so that `file-listing/data` is updated. You need to use explicit set-word to trigger the reaction by adding e.g. `files/filtered-files: files/filtered-files` into `delete-tem`. Or use `show file-listing`to force updating.

And you can use `react [face/data: files/filtered-files]` instead of `do` block.

[5:39:37](#1l-5s9HjD02xBzoG2bJOqqOLDrnzWxkrhRC2EP7sa5I) <toomasv>:
* Also, at least on Windows, changing series in reactive source does not trigger the reaction unless explicitly referred to by set-word (tried also `deep-reactor`). I.e. in `delete-item`, although `files/filtered-files` is changed when item is deleted, this is not enough to trigger reaction so that `file-listing/data` is updated. You need to use explicit set-word to trigger the reaction by adding e.g. `files/filtered-files: files/filtered-files` into `delete-tem`. Or use `show file-listing`to force updating after deleting an item.

And you can use `react [face/data: files/filtered-files]` instead of `do` block.

[6:46:50](#_xwKhjKsZBbdeIgS4YdewVGsueUOX-_KWhJgjWoebys) <toomasv>:
^ this can be used for `file-listing` instead of `data files/filtered-files`.

[10:01:16](#uaEdmHgccT_kPME67BjHliWsTmPVkHVTZfDNZ9b_6TQ) <RayMPerry (RaycatWhoDat)>:
Thank you for the insight. Will fix.

[10:15:47](#hcw-rPi6PHsj0c_G7J9GX_5CsMboGhA7JjMn0nUzF0o) <toomasv>:
You are welcome!

## 1-Sep-2021

[3:51:14](#q7r_hk4C0wMlimaznqYCum75LudEVngH6YHtzrca10Y) <cjglo (Chris J Gallo)>:
Hello all!  I am junior developer who is diving into Red and I am spinning up a small project to learn.  Out of curiosity, is there a way to read from a file in Red/System?  Or is it better to read a file in Red (using the built in command), then pass the data to Red/System?  I didn't see any "file stream" info in the Red/System Documentation.  Thanks!

[5:31:41](#SXzP202koCnLPESCyb6zZ35zH3Isk6Zl2qE5kMtvXHA) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Hi @cjglo ! File IO in R/S is implemented using OS calls. Have a look at https://github.com/red/red/blob/master/runtime/simple-io.reds . These functions are used for the IO in Red.

[6:32:29](#AUIuHITfsImah4K3JThfDZfOrMvXxZ_M09PSDRMLHSY) <planetsizecpu (Jose Luis)>:
Welcome btw @cjglo 

[13:01:34](#-lT-C5mMUZ5uRic8qYyQnRp0WoeMIXrMSI0xflQG2n8) <RayMPerry (RaycatWhoDat)>:
Do you feel what's currently in Red is pretty stable? I know there's a ton of things on the roadmap but nothing's gonna be deprecated or removed from the core vocabulary, right?

[14:55:21](#wNgWEKK_N22e0m1zI_eeHYHpjd78J_MA8Uvw9N73f1A) <hiiamboris (NOT THIS ONE)>:
No guarantees on alpha stage. If you want stability, compile your exe or stash the Red build that works for you with the script. Or just write down what commit the script works in, then you'll be able to build Red at that particular commit from Github at any later time.

[14:59:17](#faQi3TNrL3F4Z3_4w5TKy45zG_q5_aG3PuRZgM0qJn8) <RayMPerry (RaycatWhoDat)>:
Got it. Thank you.

[15:19:22](#kFlsLQp9kWshu1FaGZnrxAk35UyyQmCMYfVZQo5IvDM) <ldci (Fran√ßois Jouen)>:
@RayMPerry, I began developing redCV with the red 0.24 version and redCV remains compatible with all other versions with a very little effort. Red is now sufficiently stable for a quotidien use in bio-medical applications in hospital.

[16:38:37](#OSRBpTWV37ZllPpfBu__7deRBU7BghesePdfevu55Is) <cjglo (Chris J Gallo)>:
A little to replying but thanks for the info and the welcome!

## 2-Sep-2021

[21:30:40](#MB5UR5xr3m62ZBEzmbkFpTlrtmcnMV88YdPD1GQpxNM) <RayMPerry (RaycatWhoDat)>:
Trying to wrap my head around Red/System ATM. In the context of Red/System, what is the difference between `print message`, `print as [c-string!] message`, and `print as [c-string!] string/rs-head message`? Why is the last version the only one that prints the string correctly and what is `string/rs-head`? Is `string` a namespace?

[21:36:57](#fy5y1oDdu4tDZ-YhxNqCVIGGRt1WhNo2LOkDLH8l5Gc) <hiiamboris (NOT THIS ONE)>:
`as [c-string!]` is not a valid syntax at all

[21:37:12](#0WurUmpyoBXEepBY7AgcMKxifpmee9eacc8S7mXQziQ) <hiiamboris (NOT THIS ONE)>:
of what type `message` is?

[21:37:29](#ckd4bwFoAnSYY8Jozo6WtFli68UD25cFNHD-w6KmACs) <hiiamboris (NOT THIS ONE)>:
what type `string/rs-head` is supposed to work with?

[21:37:32](#_RU5-xPIUx9N0Lmyflewq1iPzLxyNXaHVsSjC3i4Xa8) <RayMPerry (RaycatWhoDat)>:
`string!`

[21:37:56](#5yS8-EVINgJcXLSCusJ6q8QqVdZOWxsvleuqTTD-dXQ) <hiiamboris (NOT THIS ONE)>:
nope, in R/S there's no `string!` type

[21:38:06](#ogsr80bZ42kBl0hCdc70ZCrMY9l_ToL8F0KYhRLxCEk) <hiiamboris (NOT THIS ONE)>:
you're confusing Red types and R/S types Ì†ΩÌ∏â

[21:38:37](#gBJb_BSXpsgj2L6Xay3kclR9q88DKRsGCQ4Syp2CU34) <RayMPerry (RaycatWhoDat)>:
Hmm. Then, why does this compile?

[21:38:38](#kR2T1M4yeUGPrjjxmhmxtyBfvL9Q5jTcFXDcMZa_An4) <hiiamboris (NOT THIS ONE)>:
R/S is described here btw: https://static.red-lang.org/red-system-specs.html#section-9.4

[21:39:17](#8RYGsr2bzwTg0THPhhvbMkGB3GX8RHQH4-8ERQSOmqA) <hiiamboris (NOT THIS ONE)>:
I suppose you're compiling a routine?

[21:39:31](#lfXAS6SoI0Jlj6YtKU0DcCbwauuMyX-hudizKmUGzLc) <RayMPerry (RaycatWhoDat)>:
```
Red []

print-message: routine [message [string!]] [
  print as [c-string!] string/rs-head message
]

print-message "This is a test"
```



[21:39:37](#s-oXuYNXfIJ7gVEgpWaTKG9AJp361h14sKNUdTTJRT8) <RayMPerry (RaycatWhoDat)>:
ye

[21:39:39](#xidZ1f_E2W8vpBoWCvZehIXV4DxY1J7CuBCyhD1Yl0w) <RayMPerry (RaycatWhoDat)>:
* yes

[21:40:10](#zwg-NNirtSzKBHStaS7Fb1wnJe6dDh4sK2Lpo3uqUvI) <hiiamboris (NOT THIS ONE)>:
for routines, compiler automatically translate their Red types into R/S types, so `string!` Red *datatype* becomes `red-string!` R/S *structure*

[21:40:51](#N0K25LY3ndWUL7kKy6Svvv-GE_8hGnwFbFbGSnuE_1w) <hiiamboris (NOT THIS ONE)>:
red-string!: alias struct! [

[21:40:57](#kpkA27fBE3XX-pDq_LnnbD7eguHegfFVozYougRuH7A) <hiiamboris (NOT THIS ONE)>:
* 

[21:41:06](#Cf72n0WWk8HE18yo-ZijnDu9YzJA92z0c0X_CVXQack) <hiiamboris (NOT THIS ONE)>:
https://github.com/red/red/blob/master/runtime/datatypes/structures.reds#L106

[21:43:03](#nXuA2SVluMkXKw4x7H1Lep58f51TWDc_bTMvcyLc4Wo) <RayMPerry (RaycatWhoDat)>:
Interesting.

[21:43:11](#dnAVpMlZfe7mAvryy-wTq7UDTCdbP79w7jp2M1e5C-A) <hiiamboris (NOT THIS ONE)>:
why this above compiles - can't say, probably some side effect of current implementation

[21:44:35](#VH4XrP9YPGo6UGBhEfDmHojq-HFkky2avyrUtTea-bI) <RayMPerry (RaycatWhoDat)>:
The syntax looks pretty valid to me. https://static.red-lang.org/red-system-specs-light.html#section-4.9

[21:46:10](#daI9zkjL_q1fWHTqs1k29rYQaW4I6Vrqmim-t759XXc) <hiiamboris (NOT THIS ONE)>:
also, generally you can't print Red strings from R/S, because Red may convert the string between 8-bit, 16-bit and 32-bit UTF encodings, while R/S `print` prints plain ASCII, and I'm not sure it's defined what happens if it meets char 128 or higher

[21:46:45](#ZR60xgpkI3Mkkybez4qq7FMDUax-f-Ra-Xbe9KBYJrM) <RayMPerry (RaycatWhoDat)>:
That makes sense.

[21:47:00](#aQWx-0DamiolaJyXnbONk0zTd2-lIIY4T2kdvvZy-ZM) <hiiamboris (NOT THIS ONE)>:
> The syntax looks pretty valid to me. https://static.red-lang.org/red-system-specs-light.html#section-4.9

I stand corrected. It's a valid syntax then.

[21:50:12](#VyL2DP1ULFANmecPxXCm_gH-OfOYPKeS2dFW-GSB-VQ) <hiiamboris (NOT THIS ONE)>:
why `string/rs-head` worked for you, is because:
1) string was as UTF-8 in internal buffer (because it has no unicode chars and did not contain them ever, so was not expanded)
2) all codepoints were below 128th
3) rs-head returned the pointer to the buffer itself, rather than the `red-string!` structure 

[21:51:14](#Uskddqi76qBS0jFOprbTIVT5dQJYZN5BtttMdl6Ae_I) <RayMPerry (RaycatWhoDat)>:
Number 3 seems like it shouldn't be able to do that?

[21:51:20](#HQCre42Tc62fwTrQnrLkZOpeg6b2JnwzVvGFzmGM4Jc) <hiiamboris (NOT THIS ONE)>:
* why `string/rs-head` worked for you, is because:
1) string was as UTF-8 in internal buffer (because it has no unicode chars and did not contain them ever, so was not expanded)
2) all codepoints were below 128th, so R/S print had no issues with it
3) rs-head returned the pointer to the buffer itself, rather than the `red-string!` structure 

[21:52:04](#wd_ybPOgtjYwa2dQzadRr3toUls3Z6PR---YdYyOsJs) <hiiamboris (NOT THIS ONE)>:
no, it's by design, `rs-head` and `rs-tail` are used to loop over the buffer char by char

[21:52:26](#pWl40Ze1NsdFjZ6VE3yBnxTZVIYV5pN1ChqPrTWzRMk) <RayMPerry (RaycatWhoDat)>:
Ah. Okay.

[21:52:45](#GBCFNqwo-cQIcGyWy9CTK-o-ZU7-C-FZesfbCyg08Cg) <hiiamboris (NOT THIS ONE)>:
e.g. 
```
p: string/rs-head thing  
tail: string/rs-tail thing
while [p < tail] [... p: p + 1]`

[21:52:50](#s3yDvI6Jz-B7C3UkXbiui640ihe2ZcRb9JQv8xpkg2A) <hiiamboris (NOT THIS ONE)>:
* e.g. 
```
p: string/rs-head thing  
tail: string/rs-tail thing
while [p < tail] [... p: p + 1]
```

[21:53:32](#ZCy66si7j2sWsvVLypDXm2oWI-PYtvpeCQBvpKuS8zA) <hiiamboris (NOT THIS ONE)>:
(simplified)

[21:57:46](#2AH4W47uolC3_JJXcubk2qeB_TMCy0iZDg08Mbih_kA) <hiiamboris (NOT THIS ONE)>:
try using `unicode/to-utf8` function

[21:58:21](#wKTp40-9kG8mZPoln3qeWmJavB_U5YFuI4kyVAiboyc) <hiiamboris (NOT THIS ONE)>:
(more reliable/official)

## 3-Sep-2021

[4:26:55](#xm4ZW8758APPX7xNbNQnoxvP7mHxenRlWwM4dD8O64M) <ldci (Fran√ßois Jouen)>:
@RayMPerry .Some notes and samples about Red/S here: https://github.com/ldci/Red-System/tree/main/code

[4:28:00](#OhRJ2u1S4SBFhOt-9j1FuFW0KNm8RMf_xMluITiae78) <ldci (Fran√ßois Jouen)>:
* @RayMPerry .Some notes and samples about Red/S here: https:https://github.com/ldci/Red-System

[9:16:23](#e_Vh05IanCmbT8B82KmgqB_F1ReI9mPmUJIfofOwkJs) <RayMPerry (RaycatWhoDat)>:
Thank you both for that information.

## 8-Sep-2021

[15:12:35](#zQ9AQYSUcd_5KDCokd637-dbcImsjYV6YVrfNAZnIRU) <ams02468 (ams02468)>:
Hello everyone, I do not know for sure if this is a bug or my mistake
I entered these commands in the terminal but the output was problematic
`` `

>> a: to-red-file get-env "homepath"
== %/Users/Administrator
>> change-dir a
*** Access Error: cannot open: %/Users/Administrator/
*** Where: do
*** Stack: change-dir cause-error

`` `

[15:37:40](#n5l8pcqCcYMzXjqUB1Eq8mOpFNLjoNvCSco0uX_iKQc) <dsunanda (dsunanda)>:
@ams02468 Assuming this is Windows, homepath does not include the home drive, try something like this:
```
a: to-red-file rejoin [get-env "homedrive" get-env "homepath"]
```

[15:38:02](#FXE0WyQp1nsn4xTtrdU-jTthTzUyB95CPaBQo5och38) <RayMPerry (RaycatWhoDat)>:
Yeah, you're missing the `/C/` bit

[15:38:20](#s1B9HtVsc0ohNydQS7t2IHUy4bcY10CkvadY3I0T978) <RayMPerry (RaycatWhoDat)>:
* Yeah, you're missing the `/C/` bit (or whatever the home drive is)

[15:39:56](#E9ZmTIW3OADUVS3v9Nkxmka5Tl4tAWfp_5G27fxsZzQ) <ams02468 (ams02468)>:
tnx guys ‚ù§Ô∏è

## 17-Sep-2021

[11:30:08](#9pAdLTkJ2Xt9EDm1PV2d7qksPQL5ykZmeFYtyAVVnLo) <quid-agis (Quid Agis)>:
Hi all, I am having trouble getting Red-Language to run with the GUI on Debian 10/AMD64. Does someone have a definitive & tested install tutorial that works?

[11:32:10](#PS6LXUhww2PapK_pfE7I3nZ5vEn1pJ-ItI9p1iAQDxA) <quid-agis (Quid Agis)>:
The specific error that I am getting is >> view: unset!
Although I downloaded Rebol-view, made it executable and placed it into the same directory as the red-064 binary but no joy.

[11:32:58](#x9nHZuCg68CKTnCTX4cv5JVtbGIqiXqy15LU8ROE9YU) <hiiamboris (NOT THIS ONE)>:
Hi! You should download automatic build instead.

[11:38:53](#x_XbP-z48-DUWAsG4MrjIX42Rtmp-kC5cftXxMvN3QI) <quid-agis (Quid Agis)>:
Oh I saw that, but was not aware of it's functionalities. Why would the automatic work, and the GNU/Linux version .064 will not?

[11:39:59](#3CmpyFenHLGUjruvNa1rziAWwzP6UbrNcSDAsk2dk9o) <hiiamboris (NOT THIS ONE)>:
Because GTK GUI was added after 0.6.4 release about 3 years ago.

[11:54:54](#YdXpBfPc8mm6vQNSybnq4iJQiuKrbAKql56NUEybTEs) <quid-agis (Quid Agis)>:
 OK, GTK GUI, well that explains a lot then 8-)
I'll try that in the morning, thank you :+2:

## 21-Sep-2021

[10:27:40](#pCht8YxNDmcf39EsqEbX1OS5Oxvjn8zc_Q6QUvKLNsQ) <quid-agis (Quid Agis)>:
That caught me also, thanks to you I was able to fix it.

[11:09:37](#yp-VJt-hdHefldc1SMK6323Hy8sdGhwhsMTIEPIEbLc) <quid-agis (Quid Agis)>:
Back, finally got it to work, there were two issues:
A). Trying to build and compile Red Language via a VNC Client/Server setup was never going to work, and
B). The instructions for GNU/Linux to install the ia32 libs are slightly out of date (Required `libcurl4` & `libcurl3:i3864) Note v3 > v4

[11:09:59](#ZUukSThrmIMM14CcbMHUQ75D-yRvrdMU_BXd-85F-TU) <quid-agis (Quid Agis)>:
* Back, finally got it to work, there were two issues:
A). Trying to build and compile Red Language via a VNC Client/Server setup was never going to work, and
B). The instructions for GNU/Linux to install the ia32 libs are slightly out of date (Required `libcurl4` & `libcurl3:i3864`) Note v3 > v4

[11:10:35](#ffhKlNgr2CIjc0LmQQFLgaeKnucePQMjWQIupsW4MBE) <quid-agis (Quid Agis)>:
All in all, it was far harder than I thought that it might be. But shift happens 8-)

[11:24:13](#HSxMw62OQ8T_mwSSXRJ8BWU_ASuluynbqqR8kBOwJRs) <hiiamboris (NOT THIS ONE)>:
Why would it need two different `libcurl`s?

[11:24:32](#QJnaQNSMBSSKd31ASFBZqjQ6vh0D77wsr8IEaEJHBpA) <hiiamboris (NOT THIS ONE)>:
Besides, 64-bit one has nothing to do with 32-bit Red.

[11:26:10](#wAx7VBAA1XSdK-bB6mNpsahWkTuV7XBabVw_tgb9NRM) <hiiamboris (NOT THIS ONE)>:
and `libcurl3:i386` is mentioned on the [download page](https://www.red-lang.org/p/download.html)

[11:28:50](#Q0LVPfM0O1LnNjXDNbiUByw7O1ExTGUpVqIoQiYQAnc) <quid-agis (Quid Agis)>:
My Debian 11 stated that `libcurl3` is not longer valid, and it only offered `libcurl4`.

[11:29:13](#XfiLoLDRZ7Ghk0PUE3APmnxRuLI-J1XTP_QiW33LqjM) <quid-agis (Quid Agis)>:
* My Debian 11 stated that `libcurl3` is not longer valid, and it only offered `libcurl4`. All I did was s/3/4 and it all worked.

[11:29:23](#BzFCcA6D6MVCaMOfxzq9sy-0oigcTPqAz3Icen9YaHo) <quid-agis (Quid Agis)>:
* My Debian 11 stated that `libcurl3` is not longer valid, and it only offered `libcurl4`.
All I did was s/3/4 and it all worked.

[11:30:31](#3ztoCGfYwQSPrs7QAxGBgcaqzpx4jgrlJ604IQBnLNs) <hiiamboris (NOT THIS ONE)>:
so same instructions as for `Ubuntu 18.04+`

[11:31:22](#jWmEMXhchysAZaNte-a16m2cngs5iauSMIdxWaQZXkA) <quid-agis (Quid Agis)>:
I asked on Twitter that other day about potential support for `ARMv7L`, is this going to happen?

[11:32:46](#X-ImU_xfzuYwcWvloKphv_dLeRk9SGKKnKlYxqZvouw) <hiiamboris (NOT THIS ONE)>:
Is `RPi` target not working for it?

[11:33:01](#mZxZKnbrzz7zS5nOQv1dvjAs7bFyQBqdo8VHtHD8Nuo) <quid-agis (Quid Agis)>:
Technically yes *but* the instructions on the 'Getting Started' page say: "If you are using a Debian 7+ or Ubuntu 13.10+ version, you should use libcurl3 with multiarch:" ... this is a Debian 11 system so I used those instructions. Perhaps somewhere about Debian 9/10, it actually changed across to libcurl4?

[11:33:51](#jwCeFreO7VVcy6meNW2KuAas583LwWrjXYcnPeLZI9c) <hiiamboris (NOT THIS ONE)>:
Yeah, but to update the instructions we need to know which Debian version to list Ì†ΩÌ∏â

[11:34:40](#r9mVurPzg9s6ibyhi3rkggdwHgzJY_so5G37SsQ7ino) <quid-agis (Quid Agis)>:
OK good point.

[11:35:37](#_LOhXyFx2662z0pzbKpXYlfRkpWTjnQ2AXTuB5YwQCI) <quid-agis (Quid Agis)>:
Excuse my daftness, but I was unable to find an `RPI` version, and in the Roadmap, only `ARMv5` was mentioned.

[11:38:33](#ZYtLa5I6v2o0MHH_Eg2wq9xPFBwzai63VH81CR0yRow) <hiiamboris (NOT THIS ONE)>:
`red --help`

[11:38:57](#g3TeERCZGz-U1E6n_-aR8V9n6U0J4MYTtvZi_w3nLW8) <hiiamboris (NOT THIS ONE)>:
roadmap is probably WAY out of date Ì†ΩÌ∏É

[11:46:37](#rI4AYVqT4B5gLxkYYSYhYaWMD-VJ34tyQZAdwPnxQ38) <quid-agis (Quid Agis)>:
Ah `red --help`, and OK 8-)

[11:53:56](#q4IJmYLxhTT-eYCF2V4wxCU7LJk0y2f5GV5q6Cav1es) <quid-agis (Quid Agis)>:
I see in the https://github.com/red/red, that there *is* a reference to `ARMv7` <- NFI how I missed that. But I cannot see the actual build instructions to run this on an `ARMv7L`. Where are they?

[11:56:01](#FlbZpIHCqFhs6Of0MTi4oFqDMfqbESTX6f8SplEbo4Y) <hiiamboris (NOT THIS ONE)>:
Just modify whatever build instructions you see and specify `-t rpi`

[11:58:10](#EZS5w6xsBKBfcLEyqHvPVNu8gHsLiuVPZpHgWqFVIsw) <quid-agis (Quid Agis)>:
OK, will do, thank you.

[12:00:32](#Cn6l2y6tAzDE0VP-sG8tOc7PZrZdHhgH5kB5JOoEzYU) <quid-agis (Quid Agis)>:
I am studying & using the Daml smart contract language, which has React/UI included by default. A Daml application is actually a Daml Archive (DAR) so is essentially Java-based. I read that Red-Lang can integrate with the JVM, is that correct?

[12:23:26](#tAeKwLAKTSwX1KbFQtWKfQuY6Gxf6OVfKQKHwlYwVRQ) <hiiamboris (NOT THIS ONE)>:
https://github.com/red/red/tree/master/bridges/java

## 28-Sep-2021

[4:59:13](#pPAt8rpk3jVgejJaI6A_3c_73T-ZEJgBRfVcShMV3uA) <quid-agis (Quid Agis)>:
https://doc.red-lang.org/en/view.html => Error 404.

[5:31:07](#yXRfHfTvWeJCHG2ucG2aPb7lJHje2LB7oJLsAS_xUsM) <quid-agis (Quid Agis)>:
Thank you.

[5:32:02](#DDsCDRxma4hFoqzOWHUVIRE29OiKgC6Zm3F_oNEwN_E) <quid-agis (Quid Agis)>:
Can Red be used to make a GUI for any Linux-based application or process? Something like `nano new_file.txt` or `cat /etc/ssh/sshd_config` ?

[10:32:28](#i1tz385-KG9-HgHO4p_iDWLWGFUM5qvHQVW9av-hOlo) <ne1uno (ne1uno)>:
@quid-agis, `help system/options`

[16:47:47](#HzpUTEc-Jt1vEXapE2KgAHTncfaw6i0deRPfot5x8Rc) <greggirwin (Gregg Irwin)>:
@quid-agis you can use https://w.red-lang.org/en/gui/#view or https://github.com/red/docs/blob/master/en/view.adoc.

## 5-Oct-2021

[9:00:15](#GwILuKxXj2OgzrEaxAtnBAliPLDe_jsXj964t0_volQ) <ams02468 (ams02468)>:
Hello everyone, I am trying to create a loading animation in cli. There is a problem. I do not want to clean the page every time.
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


[9:15:10](#YtXY_XrENQz4vaat2CdcGBs2cyILgDgBRiuz8s4r-2w) <hiiamboris (NOT THIS ONE)>:
just return [your carriage](https://en.wikipedia.org/wiki/Carriage_return)

## 6-Oct-2021

[2:45:24](#vEJIOzkOrL_76uk6q1RBJQS7ZgiPaqt6HoYQktzjpnU) <ams02468 (ams02468)>:
My main problem is that if I compile this code and run it on the terminal page
  Every time it cleans the whole page (cls) I'm looking for a way to replace (cls)
Something like this
  [loading] (https://lzinga.github.io/ASCII-Loader/)

[7:10:16](#AW-ehZnMLjcNQzdQ_9i5v7m3K5LBKtYDADLKL9LoqL4) <hiiamboris (NOT THIS ONE)>:
have you read the wiki page? Ì†ΩÌ∏â

[8:56:44](#j1H3KEq-RB_ysW6lxxAQwIxjdZuiflFLKBQnlkev1yA) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
@ams02468 I think that you can print back-space character to remove and than replace content on the line.

[9:04:07](#POgmd5TYJ1vKdtV-GsQl2hUmMbqdZ4CABNWH_vlf8oc) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Hmm... it does not work in the GUI console... `print "ab^(8)Xd"` should print just `aXd`

[9:04:53](#w__ZQvqua3cygmtdOLdGOHEnBfSXqN0gOTVaM_Dn82E) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* Hmm... it does not work in the GUI console... `print "ab^(8)Xc"` should print just `aXc`

[9:05:39](#RbuBile9XIwsrqJz5i5YkC4oES2dbB-UE3IQekdr-bc) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
@qtxie is it possible to make above working?

[9:08:04](#uG5DgpGoaP_Auq15RJiJ2-OLNv4893T6SzDMhbNkhTI) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
If so, one could use something like:
```
show-progress: does [
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

[9:08:21](#KfKArAUteNOH3mCTUsCAFEswE3h2cM1lMqN-KiRVwcQ) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* If so, one could use something like:
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

[12:35:50](#YPiXYxXIns6013O0nElUBaOd44Vm6G6TZRONXmvT4ZM) <qtxie>:
@Oldes Not easy. We could add an API to let the user to preprocess the string. The GUI console is basically a RELP. No support for terminal features.

[19:41:43](#NUUGw2jsux_8KUiNlrUxm7oWz_K11YOVa_85JhmhXzE) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Preprocessing string would not help in this case as the back-space is there used to delete previously printed chars.

## 7-Oct-2021

[6:07:07](#JUFvydIk5vS2i-VzBIR7K3Km1mtWMm6FbrCy_ZpdIUw) <ams02468 (ams02468)>:
thanks guys so helpful

[13:09:38](#omMGgmyLI71jz-5uxVhSKChH2-u-MyAeIOUNs0dN8aQ) <ams02468 (ams02468)>:
thanks guys so helpful

## 8-Oct-2021

[0:29:08](#GGCduucp3VUgjDBu-HSMQftgMdRTsYAXXvHxwNqQZww) <supergrass71 (supergrass71)>:
Hello all, just wondering if anyone has an opinion of the Red book on Pakt by Ivo Balbaert (https://www.packtpub.com/product/learn-red-fundamentals-of-red/9781789130706). My background is procedural/object oriented programming in VBA and I have dabbled a little with Red but  have not got far. Is this a good resource?

[1:26:00](#gXacjvfoQeMcrnI1pVePmyIQgBzGZS10fBOm1Rn4WHA) <gltewalt (The other Greg)>:
I dunno, but I don't recall ever seeing him around the community 

[3:56:19](#SeokpM6E1Q__xUTO5UQQPg4h7MRNzlZCxSO4Lg52vWQ) <GaryMiller (GaryMiller)>:
It is a good way to get started.   It needs a second edition though very bad!   I still refer to it when I remember stuff.   I'll probably never be an expert like the most of they guys that hang out on here.   But the book got me over those first hurdles.

[4:37:59](#1e4CCIZ800xpCMHk_qfn9NZ63gJptPv_Uu7istPEuxQ) <greggirwin (Gregg Irwin)>:
@supergrass71 welcome! Ivo is a nice guy. He's a serial writer, so finds a tech, tries to ramp up quickly, and writes a book. Opinions are mixed on his book, but if you can get it for a good price, saving you even an hour is probably worth it.

[14:41:56](#SQP__4a_aDtc3kgSiQOL1NKVmn5LGZ4ZC5OOkgk4sM0) <cloutiy (yc)>:
I would love to write a red book. Or some red learning videos. The book by ivo is a good start but as others pointed out it needs an update. I contacted him but he said most of his writing projects are on hold for other priorities. So it will be up to us to take the bull by the horns.

[15:33:14](#YCjS2mnZAu9N0of14L1ZtEUDag7bII1o4mjTmn26UDY) <hiiamboris (NOT THIS ONE)>:
To have a deep Red book we should first finish it's design Ì†ΩÌ∏â

[15:33:53](#1Mj-2Itu71uvMGkPrrnWFXxr23bfh4KslA5UdVrby2o) <hiiamboris (NOT THIS ONE)>:
So that book and helpin.red is probably all we'll have for a while

[16:07:31](#U16KAPlJTrBP8Gptuf0AMzwJKlZ0KHf8N0q3e_wCfHY) <greggirwin (Gregg Irwin)>:
The Rebol Core Guide is still the best definitive user guide IMO.

## 12-Oct-2021

[2:41:25](#JjknMe-HwW2w0xxrAn9aguTdcgTqdJ8aZrkpe52KS78) <lylgithub2021 (lylgithub2021)>:
The Rebol Core Guide is still the best definitive user guide IMO.

[3:00:25](#Y0Qmq8EBfMMeo0ykfUY3NNBypoB_eDTUGVULe7lg-24) <lylgithub2021 (lylgithub2021)>:
The Rebol Core Guide is still the best definitive user guide IMO.

[11:23:03](#qFiMQ71Ikk70CIISVTmrlfQ3xBVY21N0G3Vbl-U1-WY) <ams02468 (ams02468)>:
How can I find older red versions, such as 1 month ago?

[11:26:29](#l7_E6Rnb0-36KEdNA6dSjsEfAmkZqKwFBc2zcYA7aZQ) <hiiamboris (NOT THIS ONE)>:
you can download older sources and compile it

[13:26:53](#ffr7WIS8XS9PKOIsejW-W5bDaA8b54s7vaWyaMry8HI) <ams02468 (ams02468)>:
I don't know, the problem is with my computer or not, but after testing it a few times, I realized that red extension is not able to recognize the code properly for the new versions coming this month, and autocomplete does not work properly in the visual studio code.

[13:38:17](#OMTgE46BGSk9-qzdPUsU5Ydl3YJxBEnMI4ibgHyacwM) <hiiamboris (NOT THIS ONE)>:
no one's maintaining it

[13:38:58](#cRMKYJxpKJ_09kBZkiEQJ8Lx1lYXMzoR4E3dzfYnkrQ) <hiiamboris (NOT THIS ONE)>:
* no one's maintaining it (the extension)

[14:03:32](#y4n_SLNV1lBRtAUuK1QkqLEavTj787TxtzL7YE0Ex2g) <ams02468 (ams02468)>:
So what do you use (editor)?

[14:06:01](#zc8TAPJNBS29IDH_oh1Zbm0qy5xVbdZI0xW-v2yu71k) <hiiamboris (NOT THIS ONE)>:
CudaText

[14:08:30](#DxJAxXlw9k9hpedGZPMICfZO1lRM9T3FhOelxBEP4bM) <hiiamboris (NOT THIS ONE)>:
it took a bit of time to configure Red LSP, completion, hotkeys
but it's lightweight, relatively fast, very configurable and the dev is responsive to feature requests & bug reports

[14:18:17](#obt0JAaCuk8SUqlmshPBQNH7xf2ZVtswrEUoYteuT_Y) <hiiamboris (NOT THIS ONE)>:
although it uses the same LSP plugin from VSCode

[14:18:31](#PB3z67y_3VKELwLoSfXl0y4fWnb5Fiq4-5QKCnUGX1Y) <hiiamboris (NOT THIS ONE)>:
I haven't tested if recent builds ruin it

[14:18:57](#gy0fBUQhN53hxejuzoUCtVjcoKZFRVVg8cx24T8XQeM) <hiiamboris (NOT THIS ONE)>:
I don't really have much use for LSP at all

[14:19:09](#cz8R2Jbv2G1GCi1y-2AdvPkwZU0vUnDBmRV9sW3g10A) <hiiamboris (NOT THIS ONE)>:
code tree and completion work without it

[17:33:16](#SoZXF814n99rkivC-DKAloPUw5Ag3B4xry4_6XQMa1U) <greggirwin (Gregg Irwin)>:
@bitbegin was our main dev on the plugin. We need a new champion.

## 14-Oct-2021

[2:36:14](#T2aUoAo2DtqwVB18TN5sa8yqwQCpBICycHS-T9okRKk) <qtxie>:
@ams02468 It works properly here. You can try to regenerate the CLI console:
```
red-latest.exe --cli 
```

[2:36:31](#-dhI0lsCKNeuSRHyR1pjVqX_OkgdfrDNQh52jRMBrzo) <qtxie>:
* @ams02468 It works properly here. You can try to regenerate the CLI console:
```
> red-latest.exe --cli 
```

[7:12:19](#PbWuCfIUaG5RsVWE0GIMDNfcAVA93wBpjQk3ruQacNk) <lylgithub2021 (lylgithub2021)>:
```
f: function [str] [append "." str]
f "a" ;;  ".a" as expected
f "a" ;; ".aa" Why same input gets different output?

g: function [str] [append str "."]
g "a" ;; "a."
g "a" ;; "a." Same input gets same output.
```
Why does  `append` play such odd roles in function "f" and "g"?


[7:27:54](#6L9gR8yzlzIkuKEKUAk0mUy1gF4iDbPJoF61A7O01_o) <rebolek (Boleslav B≈ôezovsk√Ω)>:
This is a common error and understanding why it works this way is very important. If you define a function, its body is a block of values. You can still access them. Let me explain with some code:
```
>> f: function [str] [append "." str]
== func [str][append "." str]
```
Now let‚Äôs take a look at the body of the function:
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

As you can see, by appending to a string, you are modifying the original string. This is very important to understand. If you don‚Äôt want this to happen, use something like `append copy "." str`.

[7:29:32](#i7uknSmaLN0ESUWEN9DI-wN8s2PgKAEBPV4J-F6U6Vg) <rebolek (Boleslav B≈ôezovsk√Ω)>:
It works this way with every series.

[7:39:03](#J1pMjGnlEQPitam05Ux9DilQenck0LvVqLAs9WYTfss) <lylgithub2021 (lylgithub2021)>:
Application of function will change the function. It's so dangerous!! 

[7:58:29](#dlYYlTern5XCB009s9e3ezXCG8aZgArNA3uOz7upIko) <hiiamboris (NOT THIS ONE)>:
https://github.com/red/red/wiki/[DOC]-Why-you-have-to-copy-series-values

[7:59:07](#k2aQuG_4P2Ew6MCPKrdzuksykcKXfD95-nV_TjHXEYk) <lylgithub2021 (lylgithub2021)>:
@rebolek  @hiiamboris Many thanks!

[8:56:27](#YgqsDJvcKOrBUuYoqOLKn51mmL4M5bbdkRlJPSMecas) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Yes, sometimes the freedom of expression is too dangerous and we prefer to live in between the given boundaries :-)

[11:09:58](#xwQnlKfrlJreGVdI3dFa-agL3riA29pwwBNCtUsAp3M) <rebolek (Boleslav B≈ôezovsk√Ω)>:
There are people that prefer that `body-of` would return a copy of the function‚Äôs body, so you won‚Äôt be able to modify the function. I believe @Oldes is one of them? You can find arguments for both directions, it‚Äôs one of those problems where it‚Äôs hard to say who is right. I tend to support modification, but then we need a way to mark blocks as immutable which I hope would come.

[12:14:56](#VEy6tswr0xvAt1ckVbKtI597UKtmv-DwfoJrJcRMZso) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
> To _copy_, or not to _copy_,  that is the question:
> Whether 'tis nobler in the mind to suffer
> The slings and arrows of outrageous fortune,
> Or to take Arms against a Sea of troubles,
> And by opposing end them: to die, to sleep;
 
I'm just following @carls here [CC#166](https://www.curecode.org/rebol3/ticket.rsp?id=166)

[12:15:19](#ygxToWrzftDuTfD9Sz6CntT9F3SmnBskSxrLFBmNbWk) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* > To _copy_, or not to _copy_,  that is the question:
> Whether 'tis nobler in the mind to suffer
> The slings and arrows of outrageous fortune,
> Or to take Arms against a Sea of troubles,
> And by opposing end them: to die, to sleep;
 
I'm just following @carls here [CC_166](https://www.curecode.org/rebol3/ticket.rsp?id=166)

[12:45:32](#0KIWBNGnuRr5p7ThyW-n2-niReKXXfmp2suStXRbaQY) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
@rebolek protecting just the body is not enough, you would have to deeply protect all the function values as well.

[12:45:44](#0oPqBkfr418LE20yESeWO0Wo967L8uHPfJ0CpuCmFbU) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* @rebolek protecting just the body is not enough, you would have to deeply protect all the function's values as well.

[14:06:55](#-QYivQvifS9C4zb5AquhRynAhSMlaJFgKXVEyDyoJuQ) <rebolek (Boleslav B≈ôezovsk√Ω)>:
@Oldes of course

[18:28:13](#2UW9KCmgAodxiK0i1G90jlxjUFU4VutyZv4TpbQlu7A) <greggirwin (Gregg Irwin)>:
Only those practicing the dark arts should cause themselves problems with func body modification, though I've never heard of anyone doing so. Perhaps they just vanished when it happened. The basic "why you have to copy" issue is something everyone trips over at some point, but is also fundamental to Red. It's a great rule for static analysis tools to include.

The main reason to prevent these kinds of modifications is security. As soon as we start talking about untrusted code the rules change. But simple copying of func bodies isn't nearly enough. We need systemic thinking and design to hold the gates.

[18:51:10](#cVk3atsQgAv-O84eBIxSlE_qSPpvVfJQY8ZOLWOlJlk) <greggirwin (Gregg Irwin)>:
We few, we happy few, we band of brothers. 

## 15-Oct-2021

[2:37:21](#jubO37tQIz0YFYS7sZ0hLMGJB3x6-KVnGVtBMLLW80A) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
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

[2:49:12](#YDps4R6PBOojDThO8iM82EDzkCfrXZdRYh1lFLEZoCs) <gltewalt (Greg T)>:
They "point" to the value

[2:49:24](#0BWZn6AvzcoS_erZLlC_dQ-A1zyGEpalrnqQkPPFxpM) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
likewise
```
>> e: copy d
== [1 2 3 4]
>> e = d
== true
>> e =? d
== false
```

[3:18:40](#LFICHGGzx4D4UJsk6TQ3IWlKPYor3sD-a-NtsTsZHEk) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
@gltewalt "a" and "b"? Or "c" and "d"?

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

[3:26:19](#mi7LNkzEtBHV5_T6ttTuWhskMfUhpNQTJ8EX2ntd9n0) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
```
>> a: "1"
== "1"
>> b: "1"
== "1"
>> a =? b
== false
>> (to-integer a) =? (to-integer b)
== true
>> to-file to-float
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

[3:27:00](#1NHjcBpRJv6E_A0w7Un0Q0_UQ42b9KmqmE02gJjLXCg) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
* ```
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

[3:34:56](#YYRjKVX44kcbxWjbnXjDyPMnG0nB3fGwKH49XESqvtA) <gltewalt (Greg T)>:
"can't understand the logic. elementwise identical, together not. "

You copied it, so it doesn't have the same identity even though the elements are identical

[3:38:45](#F2V-gucMtW4wlC-ywWQyCbqU6AGVph4Rvtm5g-C9USk) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
why are the elements of the copy not a copy like the whole block? 
String is not element?

[3:40:41](#vGF504c3hCJO1Al0KYe5PbFnMmK0l3rSkeWNlhhVq4o) <gltewalt (Greg T)>:

It is a copy of the whole block, but it's a  different block.  `=?` is to compare identity


[3:43:29](#N8N4h-g-TZ3-s8atiLgVCLSb-AhWGlS3DrdpwGNPg_A) <gltewalt (Greg T)>:
I'm not sure, but im guessing that `to` creates a new entity for `series!`

[3:45:45](#HVJjAvwJEW0sbiCdTimHFQDrPB1W3-VjBSEYsQWqY-g) <gltewalt (Greg T)>:
With that hypothesis, all of these types should report `false` with `=?`

```
>> help series!
SERIES! is a typeset! value: [block! paren! string! file! url! path! lit-path! set-path! get-path! vector! hash! binary! tag! email! ref! image!]
```

[3:45:58](#GsnYQnbUGp-9CoGueTAeTwrxbL6f-XhSnCxMDQQntw0) <gltewalt (Greg T)>:
When using `to`

[3:53:59](#hgU3jOB0rDi3BqS-jpgAQpoisxnU_Dt7qWsmsDvqaVI) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
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


[4:01:18](#5epelcGlqN4SiG6CGZRyZOlHkkqIcWow9Fpvq7cDJZQ) <gltewalt (Greg T)>:
c is different chunk of data in memory than a/1.  

[4:03:22](#jgcx-bvNH4re3-9aoTGtr4Q8mgfHTM8q7gG49XBUbzY) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
like "a" and "b" after "a : b: 1"

[4:03:23](#pjR1bemBe_z9xPf4R1dIMZORiCgAS6xCOgcZdapEQhQ) <gltewalt (Greg T)>:
Is there a reason you need to compare identity?

[4:03:50](#Q4PZVumeZcN1ehWa5GTZ2f4ojUqkIetA6JC7tDCvmhI) <gltewalt (Greg T)>:
No a and b point to the same chunk in memory in that case

[4:04:22](#34G_bYDWpzO7CU50g34sp6PvIeXIEqApjy8pq2U28dc) <gltewalt (Greg T)>:
Or, this does `a: b: "1"`

[4:04:56](#f6ns-p79t09GF7Ct_vZOig2FL6kIyx2whH51GnhLsVY) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
just trying to figure out how it works, without a specific task 

[4:06:02](#WTznXs9_Io-fs8V77ggFJW3S5P80ogdtJFqPrtVC-_k) <gltewalt (Greg T)>:
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

[4:07:47](#3SYS01c7oksvpPliimUFyUBxqJYcrc05D-DVfVnxYjg) <gltewalt (Greg T)>:
`a` and `b` in my example point to different created strings.  `c` and `d` point to the same created string.

[4:11:24](#BMiThZ_JXGvnNnIbdtzTKACOV4AwjKAFDvsJLGBtrHE) <gltewalt (Greg T)>:
A guru will be better to give you the details. Or `why` series! seem to be newly created when using `to`

[4:12:06](#DK-RyGhG3TAh0FWjqPZQLXM4XbeJTw5-rKQ9i1ymA7Y) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
```
>> a: ["abc" "cde"]
== ["abc" "cde"]
>> b: copy a
== ["abc" "cde"]
>> a/1 =? b/1
== true
```
"a/1" and  "b/1" are different strings? 

[4:14:21](#lowDnhQl5m6YlMB_JVCkc-HMz4fAe74wrL4qhEoEaFU) <gltewalt (Greg T)>:
Now that one is strange to my understanding

[4:14:35](#_RiVVVOV5l-pCcx6lmjFQ8ocOCZfE2CS5zp96tsUhCw) <gltewalt (Greg T)>:
We need a guru

[4:15:19](#0S27OxpSkHT0i91Az0a3xocpr6H5xUrzy4sPqgFe8LI) <gltewalt (Greg T)>:
```
>> a =? b
== false
```


[4:15:47](#2YgTxigbbshvAt-vB5QkOhzmL18Qg0RVYpFvA0IuswY) <gltewalt (Greg T)>:
Different blocks

[4:16:27](#81DPxEHGghq3dE8wzt0Lm_jFUzGBDQGObIP2SoC3Sg8) <gltewalt (Greg T)>:
I assumed that a/1 =? b/1 would be false

[4:18:18](#45PreodYSDBMDkhLuKJWTzPlp6TVTnk96oV7TQm31WY) <gltewalt (Greg T)>:
```
>> a
== ["abc" "def"]
>> b: copy/deep a
== ["abc" "def"]
>> a/1 =? b/1
== false

```


[4:18:50](#sq1Jvdz0UflkZtMI8KeeIbarD0i_aosnUxkMcUJuqXM) <gltewalt (Greg T)>:
ahh, `copy/deep`

[4:19:12](#jwZB21IqkHiRx7zEhmtQ-YfSJOPsBnk0ugLQ9Qp1v-U) <gltewalt (Greg T)>:
Still, I'd like to hear from someone with deeper knowledge on your questions

[6:39:10](#VG1mDERbriZrqFF50HWqlOsFcz7eR7y_JzwindXplNE) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
Still, I'd like to hear from someone with deeper knowledge on your questions

[6:42:39](#PdJfhATtt2jxWCA9YQ_W5a_DsmnJQz23EQoKm_TcIXk) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
Still, I'd like to hear from someone with deeper knowledge on your questions

[6:44:26](#VkN3tADAiyjv9DoJ6PuKRfQZjdp56ybudZtKO-JQJ2o) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
* I was wrong here 
```
>> a/1/1/1
== #"a"
>> series? a/1/1/1
== false
```

[8:05:12](#0-FE2cqItg26gjasG-iwnYBUgKbUQ6Cw_C2GvmxAOEE) <hiiamboris (NOT THIS ONE)>:
@Sergey_Vladivostok_gitlab `same?` compares cell contents bitwise. See [here](https://github.com/red/red/blob/022211cb1199a740e2e73ebe499104bfbbc101ce/runtime/allocator.reds#L39) and [here](https://github.com/red/red/blob/022211cb1199a740e2e73ebe499104bfbbc101ce/runtime/datatypes/structures.reds#L17) for what cell is.

[8:06:57](#iCbqk3GjMhQ65IgdsE9oN1CVriEyVucawbUt0XQVfCQ) <hiiamboris (NOT THIS ONE)>:
Where it's used in practice mostly is to check if two series are actually the pointers to the same buffer at the same index, or if two words are spelled identically and are bound to the same context.

[9:11:29](#S80qpCLbdro5eGe5o1t96gxJjupZSUTuxp5jbc_HCBM) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
@hiiamboris two different variables with the same values for `integer` have the same header and data, but the `string` does not? How else to explain the difference in bitwise comparison?
```
>> 1 =? 1
== true
>> "a" =? "a"
== false
```
*I don't understand the source code well yet Ì†ΩÌ∏ü*


[9:17:33](#tsi5KFTwi-0-T7Wtit7_2iI89oju5oufdSy9GIJQL6k) <hiiamboris (NOT THIS ONE)>:
cell does not contain series data

[9:19:55](#664XdkHgxkhsHxhZmMrdEHuTuz1qHdio1m3XB-OUt8s) <hiiamboris (NOT THIS ONE)>:
`"a"` <- this creates a single series buffer
`"a" "a"` <- this creates *two* different buffers
`"a" "a" "a"` <- 3 series buffers
`a: "a" a a a` <- only one series buffer

[9:21:05](#bvhlKU3b_D1AUnKGbNefnCbVSvduC4HCsn2Gfx3efII) <hiiamboris (NOT THIS ONE)>:
* cell does not contain series data, only a pointer to where it's stored in memory

[9:21:57](#BsZCWgoRf5IGuirYsNGVKuzbDv3104KUdUp6BZArVZ8) <hiiamboris (NOT THIS ONE)>:
you have to read this too: https://github.com/red/red/wiki/[DOC]-Why-you-have-to-copy-series-values

[10:26:37](#-rCUac0jRHbFnL1fwP0ym3ycPO-tOjitaE6R9Fuplgw) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
@hiiamboris Thanks. I'll read it.

[11:50:39](#0fwyHRKqdAzaelwdbMUiJxZY72N6Kwgtu7EDubjBeDg) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
with `copy` understood, without `/deep` in different blocks pointers point to the same memory area, as well as `a: b: "abc"`. But why then does `c: d: 123` point to different areas? When you change one, the second does not change? "Shared" memory is a property of only series, or does the `+` in `d: d + 5` do something like `copy/deep`?

[13:55:53](#MJm7jds5mILZ_Tz7WzY9VBcuLdETWSgfC3qoyEtyaK8) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
`integer!` is one of `scalar!` values... which means, that the value is stored directly in the value slot, not by reference to a more complex values, like series are.

[13:58:12](#4vbOKWN3AHcYPliDNpzs2zCYXnZ5EPWFw-gesEgqzBM) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
`a` and `b` shares same reference to the string `abc`, but `c` and `d` has the value  in its slots.

[13:58:26](#ZEq3HfBOWCLow2qHk-SbAgob84NgkiRU12snevxvdO8) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* `a` and `b` shares reference to the same string `abc`, but `c` and `d` has the value  in its slots.

[13:58:36](#Ai07tPWZtwdArlZ7yJOwHVGydb-agcKJJaRRRcmoyXw) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* `a` and `b` shares reference to the same string `abc`, but `c` and `d` have the value  in its slots.

[13:59:37](#JB3Awl-9aOsMAlS5rVzVgTPnbC5dUwTMHT42mUtkxmU) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
To see other scalar types, do `help scalar!`

[14:01:49](#eztMdcLP4HDcbpP412Ap5YgJcNF_BRr_auEgHY64crM) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
You can also see how the value slots looks like [here](https://github.com/red/red/blob/master/runtime/datatypes/structures.reds)

[14:02:01](#ktXDqnJB4svN3XmY4wmDqrpg9gfRXjyH0llIcJC95KM) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* You can also see how the value slots looks like internally [here](https://github.com/red/red/blob/master/runtime/datatypes/structures.reds)

[14:03:32](#VCF9z66SlMZznkIeqgi9KWj47U06uFEjNsrWSPEgdtQ) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Its the `node` value, which is copied.

[14:04:02](#AExuqBLgWPOfGPD_H1j8WiGPNTa5qOgqrgTK5l0x2sY) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* Its the `node` struct's part, which is copied.

[14:04:11](#OpNrmUngyNHtgVQgLKwGckfoSaSincIajSrd92EmudU) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* Its the `node` struct's part, which is copied (or not).

[22:12:54](#swAYq2PUrqYz7inuWP4OG44BIo1MxlRAk4n6lMybOnU) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
@Oldes Understood thanks. `=?` returns `true` for `scalar!` only if their types and values are the same, and for `series!` if their pointers are the same.

## 18-Oct-2021

[0:53:32](#_FT6JvZ41kI66QRINUQGKcbS_cieFk5GfW_nYML0YUs) <cloutiy (yc)>:
Are there any browser automation tools written in red or rebol? An example would be selenium webdriver which allows to programatically simulate a user interacting with a page in the browser, clicking buttons, filling out fields etc...

[3:11:24](#wQit4QBn1FIZ_PhXQr-eqekomF5Vu1D6V5a4pp-doOQ) <greggirwin (Gregg Irwin)>:
Nope.

[9:05:31](#0_M_xzEobKbpO4zCAQJucYWe0GsC1HQsPfbPo40pRAA) <Slownite (Samuel .D)>:
Hi everyone, I tried to install the latest build of red on window10 64bit, and I had this error when compiling red GUI console:
 *** Driver Internal Error: Script Error : select expected series argument of type: series object port
*** Where: none
*** Near:  [select res [1 "Could not open the file."
2 "Could not map the file."
3 "Could not map a view of the file."
4 "Could not convert the file name to Unicode."
]]
Do you know how to resolve it?


[9:08:35](#iqdtpoxFmOFwrLCqVIltG-FfkPotOQuLcVp3nTM9xz4) <hiiamboris (NOT THIS ONE)>:
Hi Slownite, pls disable your AV software Ì†ΩÌ∏â

[9:27:46](#eOVv6i8FJLFBELATD3lGz_yF4pGpkSRxZHtWtFB3mMw) <Slownite (Samuel .D)>:
Thank you very much it's working :)

[9:30:34](#nTAXnUnYyLuNQZk9K-mRaG5AovB5YmLZ5pF4qlVaodY) <hiiamboris (NOT THIS ONE)>:
@greggirwin the warning should be on the download page right under the links

[9:33:53](#Orhc8L_KkHEwp7jiEZUPpjHWu0DGxCMhkEbywwwT5Es) <hiiamboris (NOT THIS ONE)>:
* @greggirwin the warning should be on the download page right under the links
"On Windows if installation fails, try disabling your antivirus!"

[9:37:47](#aKuGGDVdwODX6nzwIMUhvCHGF95sUapdfaAB9VtNPK0) <ne1uno (ne1uno)>:
excluding a few directories may be enough

[9:38:29](#3gRMLfkblYLJsu9x9hLHIQEC_OanFqgBj6Eb5pXXK-E) <ne1uno (ne1uno)>:
easier said than done

## 25-Oct-2021

[2:46:02](#_ft_tU8Z_y70aOnrm0nhemjJ8PTx2hCGqQ3gQY0pwgo) <lylgithub2021 (lylgithub2021)>:
How to use "anonymous function" in Red as the following example shows :
```
a: [-2 -1 0 1 2]
collect [foreach i a [if function[x][x > 0] i [keep i]]]
```

[2:49:52](#Mq4wWyIyaIwlEbLUzWfsDDt7ihZuZDnnSIhG8Sl4CNk) <greggirwin (Gregg Irwin)>:
`collect [foreach i a [if do [function[x][x > 0] i] [keep i]]]`

[3:42:44](#Kp94JrYfWqhIykYwQrFSJwHEbfNIK_vo9YxPRkZfOFw) <lylgithub2021 (lylgithub2021)>:
Many thanks!! @greggirwin 

[3:54:18](#lRId7JDELiRA2r3PFwY8j9jfwxMa-7Ug5_39WnIcD0g) <lylgithub2021 (lylgithub2021)>:
@greggirwin following your instruction, I tried this:
```
>> a: [-2 -1 0 1 2]
== [-2 -1 0 1 2]
>> collect [foreach i a [if do [function[x][x > 0] i] [keep i]]]
== [-2 -1 0 1 2]
```

[3:54:36](#ZQF62XD8wiFBlU1lxVhW3qc0mOdJYDxJTN2G3f7nAfQ) <lylgithub2021 (lylgithub2021)>:
But what I want is [1 2].

[4:00:33](#fo2MzcDwVv3ITqr8bdoztp4g9Tm8TBFmCjwrPmsNgZw) <greggirwin (Gregg Irwin)>:
Sorry, I was just thinking about getting the function evaluated, but missed a detail. 
```
collect [foreach i a [if do reduce [function[x][x > 0] i] [keep i]]]
```
My question now is why you want/need it to be anonymous, since it's faaaarrrr less efficient to recreate the function inside a loop.

[4:09:44](#d69fL55yzzEXOMwpsD10vKueO43ba8twI7kmy_-HD64) <lylgithub2021 (lylgithub2021)>:
Sorry, I was just thinking about getting the function evaluated, but missed a detail. 
```
collect [foreach i a [if do reduce [function[x][x > 0] i] [keep i]]]
```
My question now is why you want/need it to be anonymous, since it's faaaarrrr less efficient to recreate the function inside a loop.

[4:12:03](#MY30gRzoQ4xCLukRcc4mE-FTFqvwH7HCF5xQgwumcV0) <greggirwin (Gregg Irwin)>:
Just like you normally would.
```
>> fn: function [x][x > 0]
== func [x][x > 0]
>> collect [foreach i a [if fn i [keep i]]]
== [1 2]
```

[4:12:30](#QZt8xsfmvBJsDatV9C64nigPFkINJDITMtf4ycBZoAE) <greggirwin (Gregg Irwin)>:
Remember, functions are first class values you can pass around.

[4:15:50](#sQRcoRJ0IpIgb-2mImWrhkjD6luyeF4h6auibALq_Go) <lylgithub2021 (lylgithub2021)>:
Thank you! I get it. So explicitly calling a function is better than anonymous function inside a loop.

[4:19:30](#qTB91cDdL8UvDWwvjnFxJuE3lSWVhYAvkVXXZ-6a0fs) <greggirwin (Gregg Irwin)>:
If it's not performance critical, or your loops are small, don't worry about it. It's just a lot more overhead in evaluation and added GC pressure. It's late here, but I'll try to profile it tomorrow so you can see the difference.

[4:21:30](#bKZwZxtWLSxuUiPQmo3hOZuI1BgchmPndfMyxj9KOLI) <lylgithub2021 (lylgithub2021)>:
Thank you!!

[9:23:18](#iKUQ4FgA1KtaiXB3R_yu6mZqoVnh0C9zurm4_gy8j6U) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
Is it possible, without using php->file->red, to transfer data from an html form using the POST method? When transmitted by the GET method, it is only if there is no sign equal (=) to (http://rebol.scienceontheweb.net/red.cgi?aaa123) works, but (http://rebol.scienceontheweb.net/red.cgi?aaa=123) does not work,
system/script/args is empty.
Why is it that when you just call (http://rebol.scienceontheweb.net/red.cgi) everything starts up, but when you call the same script from a form with parameters, it gives an error? Rebol/core 2 also behaves strangely, and Rebol 3 works as it should, you can type the code in the [editor] (http://rebol.scienceontheweb.net/editor.html) and when you click the button, it will be executed, displaying the result in a new window.
And another question - is it possible to statically build Red so that all the required libraries are in it? 

[9:24:13](#79sYb_v8Y0px3pp4zaPaWd_J5o1_81CCzprvyWaKT0U) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
* Is it possible, without using php->file->red, to transfer data from an html form using the POST method? When transmitted by the GET method, it is only if there is no sign equal (=) to (http://rebol.scienceontheweb.net/red.cgi?aaa123) works, but (http://rebol.scienceontheweb.net/red.cgi?aaa=123) does not work, system/script/args is empty. Why is it that when you just call (http://rebol.scienceontheweb.net/red.cgi) everything starts up, but when you call the same script from a form with parameters, it gives an error? Rebol/core 2 also behaves strangely, and Rebol 3 works as it should, you can type the code in the [editor] (http://rebol.scienceontheweb.net/editor.html) and when you click the button, it will be executed, displaying the result in a new window.
And another question - is it possible to statically build Red so that all the required libraries are in it? 

[9:39:59](#fpOn1u_2DZoAcHymAfRg_0-0EFqDrC2HAYHOBdYg97A) <hiiamboris (NOT THIS ONE)>:
looks like the issue is in CGI script or server config

[9:47:29](#4VbhSOYur0mi4YCbEV7BtEGrIjIbKD89ECfxNae8brw) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
I do not have access to server logs Ì†ΩÌ∏ü

[9:48:41](#EKnKecpXVU9URsGlv8rKXt6E7vp0ph_0sMsVV6mX248) <Sergey_Vladivostok_gitlab (Sergey Vladivostok)>:
maybe someone experimented with the CGI mode

[18:15:16](#ytrv8_mw4p0ud0yGPW1s210OhoizlTH1NF8WeNIqdcE) <greggirwin (Gregg Irwin)>:
@lylgithub2021, using https://gist.github.com/greggirwin/908d44dc069ed84cf69f053e1308390d to profile:
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

## 26-Oct-2021

[4:30:37](#CS8ACpo2u60bcCzaq18SQRRcvtNdHxuONwOoKrRDJJs) <lylgithub2021 (lylgithub2021)>:
@greggirwin great!

## 29-Oct-2021

[17:17:15](#bVYGyLliVZEmeXRmB8PehKleU0FbnKDqFomecFesA-M) <ams02468 (ams02468)>:
Does red support multiple colors in cli?

[17:22:42](#9LOg-wA_LoOnNmbxnLmz0_CNrRLY_yzP2HP0p823Zm8) <hiiamboris (NOT THIS ONE)>:
![](https://i.gyazo.com/d193959ab5f4dd6912902867d1eb1100.png)

[17:23:28](#xsqJREkKeiWko5Oszb4NJpctXnfAQmBXlDoUjvXOYYA) <hiiamboris (NOT THIS ONE)>:
took it from [here](https://gist.githubusercontent.com/mlocati/fdabcaeb8071d5c75a2d51712db24011/raw/b710612d6320df7e146508094e84b92b34c77d48/win10colors.cmd)

[17:24:22](#B8jG-FpkT7-05cjoKsbeO38mwF34sw2y9OwAfKHuafw) <hiiamboris (NOT THIS ONE)>:
but if you're asking if CLI console has a highlighting module, then no

[18:04:54](#8PElg9Vq1MgufG-N2Tc41tfq_q9dsSEFsXP60t58uNg) <ams02468 (ams02468)>:
thanks  @hiiamboris 

[18:28:07](#ClhcsKQXKGK3LwDCPYj3zgLt61_BhtTR0W5mjVvBdm8) <ne1uno (ne1uno)>:
interp-events branch has `profile` now,  but it doesn't like `even?` in `anon`,  no /count too

[18:28:08](#cD2ms_zvwhruRxuBL97LdsFXPjvDtOtdwoNfzrf3MT4) <ne1uno (ne1uno)>:
>*** Script Error: even? does not allow date! for its number argument

[19:25:47](#4gznqIGjRY4GEu4-VcwaIjOi3npmnZkdAvY6RPhQlEA) <greggirwin (Gregg Irwin)>:
Thanks for the report @ne1uno.

[21:56:24](#9v1xvpZi_05Lee-XoY3-MlUVm21FiGHtJFGENqOf1Lk) <greggirwin (Gregg Irwin)>:
@ne1uno do you have some example code you can put in a gist?

[22:06:16](#07tlOK_CHZy3LrntY6qIZLnfUxBlm-ioI6Lna4uBeAs) <ne1uno (ne1uno)>:
`function timing of 00:00  might make it more difficult to make your point.

[22:06:16](#Andfy_u5LO3GYKcornh6qQiQltK-E13c7ru_djkMDu0) <ne1uno (ne1uno)>:
 /show is default.  I think the idea is `do/trace` to enable.   /count might be more difficult to implement since /trace gives you a breakdown of all words and gc timing.  

[22:06:16](#YCbWomEuCrFAiYMFjrsW36uMnvWQQgTsrazvItmxa3Y) <ne1uno (ne1uno)>:
`profile` appears to be a wrapper on deeper `profiler` that has no help or source.

## 3-Nov-2021

[10:13:04](#FQV2iHKibVKRnvmcLbjwBugZQ1YSURBSbCu3UNZ98e0) <ams02468 (ams02468)>:
Hello everyone, I hope you have a good day. I had a question
How to extract the contents of a string value in regedit?

[10:30:43](#BhGYcCukE9kvaIkAcju5ukMhpNO8JRWq49vimou0fsU) <hiiamboris (NOT THIS ONE)>:
have an example of input and output?

[10:35:36](#97XGfhFRc1oaYe06gyuSwXLwZKD7B8PNsbk7hGGUJRQ) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Maybe his idea was to read registry value using Red? Rebol/Command could do it in the past, here we would need some win32 API wrapper imo ...

[10:43:04](#hDTnsksrw53AoeHe-lUwmDz3FPKO6X16XH8-uhqV3Uk) <hiiamboris (NOT THIS ONE)>:
like this?
```
>> call/output {reg query HKLM\Software\Microsoft\Windows\CurrentVersion /v ProgramFilesDir} s: ""
>> find/tail trim/lines s "REG_SZ "
== "C:\Program Files (x86)"
```

[10:45:50](#8QW9TNf_DTIHdIoPvydQWpDmgeRbGecRwcZU2lZWPo0) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Perfect :-)

[11:16:46](#VV_zhx_1cXhcB5eu-S_SaDOAWoKAUllDHZz9jiuvcWw) <ams02468 (ams02468)>:
thanks @hiiamboris 

## 5-Nov-2021

[12:14:20](#CKflbvbGQ3id6_9bB2ViQy_Ai0Bo-0SaKJDWxw7XLqA) <ams02468 (ams02468)>:
Is there a way to call the variable or function on the next line of the script before we get to it? for example
```
print test
test: "hi"
```


[12:16:01](#8qs3eOFk1hqL2t8ehEvgfEu0th6OdX7G08thTCuxvmc) <hiiamboris (NOT THIS ONE)>:
what are you trying to achieve?

[12:28:21](#d9VLAI2Z5lgh6D4dL_3xiII-hGX1h_KakdEM3UlY3cc) <ams02468 (ams02468)>:
I want to see, instead of defining, can functions be defined in the first lines and then in the last lines of the script? (My goal is to keep the script clean of clutter)

[12:33:32](#5f5luRN0fPpXEOyQn0H2VKA__lSZT3JQP3NKPuer83A) <hiiamboris (NOT THIS ONE)>:
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

[12:43:53](#0J4PC7xy9zJPAhzQ8HaKaq8KJ_-yY7ltc6YshXKwcyI) <ams02468 (ams02468)>:
Thanks @hiiamboris  it was helpful

[20:43:03](#g7C_PZgpjTde7IWt5AG7kJMt9t9vMN5AAZjckxzU39E) <greggirwin (Gregg Irwin)>:
A value has to exist before it is *evaluated*, but you can have references to a value in any order. This comes back to the fundamental concept in Red that everything is data until it is evaluated. 

## 7-Nov-2021

[19:31:20](#4CuqVya7laWsBHUG6fPnSY8o1NGYvbUTQndtDzfWYTU) <ams02468 (ams02468)>:
@qtxie After testing different versions of red a few times, I realized that red extension (vs code)does not work properly from September onwards and is not able to understand the code. In simple terms, I realized that "red.intelligence": does not work for new versions

## 8-Nov-2021

[0:49:13](#rQUF4rSVE9YFRsLiFulvK-dEDPB3ytqrYTOq52wfSgk) <cprinos (Chris Prinos)>:
Been a while since I have done things with red‚Äî had to leave it behind without 64 bit mac support. I was wondering if the Mac M1 Arm chips have changed anything in terms of future releases or it‚Äôs actualy still more related to 64 builds and not the architecture.

[6:26:42](#1DEuPa-MUSlGfCF69rhjji0vYJYtfbpBuDvVZN-MXzY) <greggirwin (Gregg Irwin)>:
64-bit first, but the architecture is an issue when that time comes.

[7:01:29](#AqiUedHDuwF3NAKUExelRRQkm9OaurI1SwYDD2MI6Nw) <qtxie>:
@ams02468 I used an October version on Windows and it works fine.Which OS are you using?

[7:01:40](#kTzMfUxI0oQjT6DF5E7Keb_M3v6zWShxurmVx2hOUAo) <qtxie>:
* @ams02468 I used an October version on Windows and it works fine. Which OS are you using?

[14:41:24](#rWeuQKqYnXxgmG7DICsi6UQihdcY1Od8wChZDpV5ICw) <ams02468 (ams02468)>:
@qtxie I do not know exactly, but I always came up with red updates, I think the versions that came earlier this month, after that, the extension did not work properly anymore.Procedure for my operating system
windows 10 ltsb versions 17763, 1909, 2004 and windows 7 2009, 2011, 2020 did not work I now have the version Red 0.6.4 for Windows built 25- Sep-2020/16: 30: 23 + 03: 30 has no problem 

## 9-Nov-2021

[2:22:50](#Hq0aeGi1aRdNhmpVXbZA983swfxxjjv0OQshFQ5Dlco) <qtxie>:
@ams02468 25- Sep-2020? That's quite an old version. What error message did you get? Did you try to do a fresh installation?

1. uninstall the red vscode plugin.
2. delete all the CLI consoles (console-*.exe) in folder `C:\ProgramData\Red`
3. generate the latest CLI console: `> red-latest.exe --cli`
4. install the red vscode plugin.

That should be enough to use the plugin, **no need to config** it in vscode.

[2:24:54](#R8ASv83OP_VGjhJYTHxYCikBSIz39QD2gUD0o_wwc30) <qtxie>:
* @ams02468 25- Sep-2020? That's quite an old version. What error message did you get? Did you try to do a fresh installation?

1. uninstall the red vscode plugin and delete all the Red settings in vscode config file.
2. delete all the CLI consoles (console-*.exe) in folder `C:\ProgramData\Red`
3. generate the latest CLI console: `> red-latest.exe --cli`
4. install the red vscode plugin.

That should be enough to use the plugin, **no need to config** it in vscode.

[4:45:56](#zq0tLm0s8JJ6av5d-mQVzcaOTHzOuydNe9OiMAPIrHs) <ams02468 (ams02468)>:
@qtxie  As I said before, it works but it does not work perfectly, for example
If we put a slash after the call command, it will not show the options that this command supports, if it does in older versions, or by writing the first letter, it will not show the list of commands that are displayed with this letter, or it will not show it completely. Does not

[7:15:25](#ccPNAtEs5g3NbmzKiLmqFWWik2ilvmqmq1-GY5gT3ZM) <qtxie>:
@ams02468 Ah, you mean the plugin's version. Indeed, the new plugin lost this feature. The new plugin was rewritten completely by @bitbegin, seems he forgot to add it.

[7:44:13](#J2hPGcG5VxzXc5z08DGTkJx91tUSOH9FSCEeTFwvj8M) <qtxie>:
The new plugin should have better understand of the red code than the older one. It should be able to show refinements for user defined functions too. The older one is quite simple and only be able to complete built-in functions.

[20:57:07](#GVk6QlLX_kmG3nuFW542V0D0XfGRKg2jXRyAB_HT-Ak) <ams02468 (ams02468)>:
@qtxie  Maybe what you are saying is true and does not make a difference for professional users, but showing the details in the old extension is much more than the new type, which increases the speed of work and familiarity with red codes for novice users. my purpose It's not a comparison, I just wanted to raise this issue because it's very annoying for me personally

## 10-Nov-2021

[22:03:05](#KEjoFOtUM5r7kBn5BSQIARRRrj_rWwcJ_zwzR-hEWZk) <ams02468 (ams02468)>:
Hi all I have a problem with a CMD command that runs well in CMD or batch file well, but whenever I run it in red, the order runs, but nothing happened after i tried to Write the command inside a BAT file and run it by red, but not working
```
call { Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Embedded\EmbeddedLogon" /v "BrandingNeutral" /t REG_DWORD /d "1" /f  }
```


[22:04:55](#KmhF1j3L5V-xa1w7HX40gc8WuQRagQmpXR3aT_lXTNw) <hiiamboris (NOT THIS ONE)>:
are you *sure* it's not working?

[22:08:00](#gLNTrPoyFpPtSuv34OnK_cSGzb4XCCqWvKByTcGoU-0) <hiiamboris (NOT THIS ONE)>:
and are you sure it's working in cmd *with* that extra space before it?

[22:35:10](#e72hENuHSTyxHp9QeLfm1i6s7WA52YSFsWFRvYCK9w8) <ams02468 (ams02468)>:
ye

## 11-Nov-2021

[5:35:21](#CC3Vzdpw0y0mtaZlipKoJxa9leRvfkjkx_F0qlsEAn8) <ams02468 (ams02468)>:
I tried these too
```
call {cmd /c Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Embedded\EmbeddedLogon" /v "BrandingNeutral" /t REG_DWORD /d "1" /f  }
call/console {cmd /c Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Embedded\EmbeddedLogon" /v "BrandingNeutral" /t REG_DWORD /d "1" /f  }
write %z.bat {Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Embedded\EmbeddedLogon" /v "BrandingNeutral" /t REG_DWORD /d "1" /f  }
call/console %z.bat

```
but still not working


[6:42:46](#-7HJaZeCDlK5FByoqAbQXtLyvbyQnXzOWjRWZV2F4uc) <hiiamboris (NOT THIS ONE)>:
idk, works for me just fine:
```
>> call/console {Reg.exe /?}

REG Operation [Parameter List]

  Operation  [ QUERY   | ADD    | DELETE  | COPY    |
               SAVE    | LOAD   | UNLOAD  | RESTORE |
               COMPARE | EXPORT | IMPORT  | FLAGS ]

...
```

[7:16:59](#SNATR_6UnzhJDSJiQb3yXI5H1DQDKYUiExXz8xOEPaA) <greggirwin (Gregg Irwin)>:
@ams02468 or others who might know, since I may not have time to test anytime soon, could it be that your Red doesn't have enough permissions, and those are inherited when `call` is used?

[8:22:34](#TtfiP4paDkIzQGqACYSnDmVYAxmAJ_q26PpLvi54t34) <ams02468 (ams02468)>:
@hiiamboris Go into the registry and check from there. You probably saw the message (The operation completed successfully.) And thought it worked, but this is not the case. No changes have been made to the registry.

[8:57:47](#PYqaMmVElkK3z9zT_ILOT8s95624lsuzm3PA4bT9XtM) <hiiamboris (NOT THIS ONE)>:
I don't have "Windows Embedded" key so start with, but for an existing path it works.

[18:57:00](#Wim5EM7xT6h-BQiS51JryPsAaP8gCb2UNm8DC9WLzgY) <greggirwin (Gregg Irwin)>:
@ams02468 if the message Red gets back says "It worked!", but it didn't, I think that falls outside Red's responsibility.

[22:55:09](#fn4qmh1j1rZHDbJ8oYg5e3eBSYtrfu6zsrEkzHHGOts) <ams02468 (ams02468)>:
@greggirwin  But why does it not work only on red? If you mean that there is a problem with the operating system, then it should have the same problem when using it in cmd or bat file, but their procedure works. I even put this command in red command line. I also ran the administrator, but it didn't work. Regarding access to Windows system's, I must say that the entire Windows partition has full access.

[23:44:52](#jAO9rNZ-YYf-o36VNhlSd8TlawNAx5xmScnTdLAhgR4) <greggirwin (Gregg Irwin)>:
If running as admin didn't work, then I don't have any other ideas. When we issue a `call`, we can only know what the OS tells us about success. That said, it's quite possible that something *internal* to Red's `call` implementation has some effect. If it works for Boris then it will take some research. Feel free to search for tickets and open a new one if needed.

## 15-Nov-2021

[23:05:40](#Db3uI7UbYtII5Dw6lvcZopFHwZPF9MKXPlDI3zlDw4g) <XavierFVJDebecq (XavierFVJDebecq)>:
Hello everybody, does anyone has ever used logical programming with RED ? I would like to code a prolog 4 interpreter (or any logical programming with constraint langage) in Red in order to use it as a dialect, i am looking if its feasible.  My long term objective is to have a dialect that enable declarative programmation with the possibility of generating a part of the code with Red by parsing information on any type of support (net, documents , ...)

[23:12:21](#DfYGj-O-HLNKblexZj9QfuxrNRyiB3vQwzSExvl6irE) <zentrog>:
ams02468 (ams02468): Did you check in the 32-bit registry hive?

## 16-Nov-2021

[2:50:07](#y30hdWhNWxsWJz4CX7podGUnfUE6ZHc7KtvBFSr07MM) <ne1uno (ne1uno)>:
@XavierFVJDebecq,¬†      have you seen http://www.rebol.org/view-script.r?script=prolog.r

[13:36:44](#JSFQ5UtNLogfnNB0f7lm0j-3HiioWhYRva5pNuhWx-U) <ams02468 (ams02468)>:
@zentrog:matrix.org  well done, but now that as you said I check it, but why does it change? I give it a 32-bit address, but why does it change to 64-bit?
The order I give him
```
call/console {Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Embedded\EmbeddedLogon" /v "BrandingNeutral" /t REG_DWORD /d "13" /f }
```
The command that is executed
```
call/console {Reg.exe add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows Embedded\EmbeddedLogon" /v "BrandingNeutral" /t REG_DWORD /d "13" /f }

```

[13:41:55](#_CUMBTOoB37gY_IzO4AjnY0eCSr7sbVEn44y5bNVfR4) <hiiamboris (NOT THIS ONE)>:
Interesting. WOW6432 is for 32-bit apps. So perhaps `reg` knows it's invoked by a 32-bit process and transforms the address accordingly.

[13:43:03](#iPbIYn3NH530fVuOwRzpCoXaKQRgh7--EKmn4FqD4Ao) <hiiamboris (NOT THIS ONE)>:
What if you add `/shell` to `call`?

[13:47:03](#QHS_aJSQNOErMnPb86KEG3XFXGdCQZbiHJaRzIlbuw0) <hiiamboris (NOT THIS ONE)>:
There seems to be two `reg` commands, one in System32, another in SysWOW64. Maybe you need to run the other one?

[13:47:10](#4gS8V5vRoIbsZiWBpmJLvXbEv3wbzIaKjFtZuvjSzrM) <hiiamboris (NOT THIS ONE)>:
* There seems to be two `reg` commands, one in System32, another in SysWOW64. Maybe you simply need to run the other one?

[14:26:16](#GLM467o2cUh4yjBjbVIq8lp0fgWyYjCAZLFeWPQjqKA) <ams02468 (ams02468)>:
I also used call / shell but it did not work. Now how can I execute this command as 32 bits?

[16:49:54](#9CTyXkt11UnVLQPncFSA2N-gyiBcDdAAjCMJRY2YUNI) <cloutiy (yc)>:
Hello, maybe its just me but i seem to be seeing more and more propaganda about web3, blockchain and dapps. In the Red Fundamentals book by Ivo there is mention about Red's intended role in this space. Would be interested in getting on the Web3 train early, and was wondering how red was progressing towards this emerging trend.

[17:03:41](#L03yNjfMTjDQgDcsCQI_h7QkAenG2zWNv-Aw2grPGak) <zentrog>:
ams02468 (ams02468): It looks like you can specify `/reg:32` or `/reg:64` to target the appropriate side. https://stackoverflow.com/a/51594448/116311
My best guess is maybe 32bit vs 64bit processes have different PATH variables defined, so a different reg.exe is found. I'm not sure if that is the case though...

[17:16:02](#fHlnHnZ1mKToHs533atRqPZMqE85MK4AySgfOyVW3ec) <greggirwin (Gregg Irwin)>:
@cloutiy that's where C3 comes in. It's not "early" anymore, but the train only runs between a couple towns so far. :^)

## 17-Nov-2021

[2:23:45](#ipv0COa-MwcXEJfheCPWXCaeN4LrV_pKF2SvE7wM8OQ) <ams02468 (ams02468)>:
@zentrog:matrix.org  Thank you very much. And to thank all the friends who helped, I must say that Red had no problem and the problem was the details of my order.

[19:13:12](#_gZ2ZDshrNMhyXgqJczyEKsMkpVhbk1Uw8OBYVHC8Yw) <greggirwin (Gregg Irwin)>:
Something we may want to note in a wiki page. @zentrog:matrix.org any idea what page might be best, or do we need an "OS Tips and Tricks" page?

[20:06:08](#Y2TslKHL4rnoXjlcRBC9_ayAhBMN8ccwX6-273koWxw) <zentrog>:
Yeah, possibly. Though I'm not sure that it's necessarily easier to search the wiki than doing a generic web search, since it's a detail specific to an external tool

## 18-Nov-2021

[9:23:24](#H1Br4IBgkj5eWMqM-_y9xcmM_nl1pRLNYX2zQBpU_UE) <duskhorn>:
Hello everyone!
I am having a problem loading an image using the `load` function; the console just says
```
*** Access Error: cannot open: %file.png
*** Where: decode
*** Stack: load
```
  and I really don't know what I could be doing wrong

[9:32:06](#PsUB1o-Gdny8SJXgETBKhJugElj0c4knmp7P0MUPXXM) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Hi @duskhorn:matrix.org 

The error message is really not very helpful and should be improved. Can you check if it‚Äôs really a PNG file? Maybe it has the wrong extension.

[9:36:46](#D9APxznFgaFu-rJgcv1K_j73mVfqJP4N3Wn95gylbJk) <duskhorn>:
It is a png file, I can use GIMP or Firefox to open it and it displays fine.
I even checked I entered the path correctly

What I'm doing is just
```
>> load %file.png
```
And I have file.png in the folder I'm running the red console in

[9:37:34](#zSec0br4Sdy68bmmLVjco035E98WTJc7XPUX5L8s7Ws) <hiiamboris (NOT THIS ONE)>:
type `probe read/binary/part %file.png 4`

[9:37:38](#gbtJjOHE2DqClSECcMQ-ryGI_6YLzxRSpBzvzarP54A) <hiiamboris (NOT THIS ONE)>:
what's it saying?

[9:39:27](#IQ5EEzM0GFoUF7Bn46Jy_YJoYHHR16fNG_InE-gygM8) <duskhorn>:
It displays
`#{89504E47}

[9:39:33](#mLUYGHS3GSSf6bUYY6TJQKeyNPXWDoBvm9D-IMIRiyg) <duskhorn>:
* It displays
`#{89504E47}`

[9:40:00](#wtNJ-rVdHGaxxCDzyNjNjMJaxebWqGUnPEUcUzW2kPM) <hiiamboris (NOT THIS ONE)>:
that's not a PNG file

[9:40:20](#X0dmnqX1yKSP2aeZmK2LAurTuoLu4qAhoRJMWe_lndg) <hiiamboris (NOT THIS ONE)>:
nor jpeg or gif

[9:41:21](#R_qBu3pFExUBNWbnrPw15RWHEYo1KdKmdDmbuXNrlpg) <hiiamboris (NOT THIS ONE)>:
wait I may be wrong

[9:42:19](#sdc3xz7fZu6KSggeIw9GrrVAebfizv-0iUex1N2yA-c) <hiiamboris (NOT THIS ONE)>:
it is a PNG alright Ì†ΩÌ∏â

[9:43:49](#kKRKsjMiupANzuF5vOjCje-IiK8tBSdUxaxw5wZ63VE) <hiiamboris (NOT THIS ONE)>:
forgot it starts with a strange symbol

[9:44:03](#vDHNNEoipt_fjNmTtI7MfgN8geTBoIwifb6vyKZECoM) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
upload the png file somewhere then, so that others can test too ....

[9:44:27](#4eG31iLT2x6WdHemcqZfgqR_CXx_G76Eo-1tPz4faqk) <hiiamboris (NOT THIS ONE)>:
yes

[9:44:46](#i6Nz1KyTwCnWFElKNQIXHeOnjhq16tmNobsRtnyjug4) <duskhorn>:
Let me try this in the latest automated build first, I noticed mine is a cuple weeks old

[9:45:10](#d4iGUh_P-gdMYYMfsoR6Tt3obHhaa7bpFtX7TYxqDbw) <hiiamboris (NOT THIS ONE)>:
nothing has changed in the image codec I believe

[9:47:26](#g3MkxO-AztsZxr3s6yxV6EkCF_8adBmlj0z2_YPKQtY) <duskhorn>:
oh well, I just updated it nonetheless 

[9:47:59](#Ctgo-O421uZwH2rCxBAoMDUf036EOVSYb6mkHkD-x0Q) <hiiamboris (NOT THIS ONE)>:
I suggest opening an issue and attaching that PNG

[9:50:13](#L76G4MsPG3Gzk3f9Ew9kqhj-U0CjEf1oCgUP72N5cJo) <duskhorn>:
it still doesn't work, same error, opening an issue

[15:12:11](#WOj_mk6IADGDDuGvqmQdGYU1lij0SXrmxicea3_jHZw) <ldci (Fran√ßois Jouen)>:
@duskhorn:matrix.org Try this in red console
```
view layout [image %file.png]
```

[15:30:13](#ftm2L-RCp0TELcTgZmHcniNzVF5jc_Ze_mcr_8j3HzU) <duskhorn>:
> <@ldci-5673ead416b6c7089cbf2ba5:gitter.im> @duskhorn:matrix.org Try this in red console
> ```
> view layout [image %file.png]
> ```

```
*** Access Error: cannot open: %file.png
*** Where: decode
*** Stack: view layout load
```
slightly different error as before

[15:42:14](#DrJ87Hq5bGu6aWKygKDpviYIVkqanYG4sbPnQnxIiiw) <ldci (Fran√ßois Jouen)>:
@duskhorn:matrix.org Did you try to just open a basic terminal and launch red?

[15:49:59](#tJYPGGN8IcjYEL6qnl8DQ2Dtw8t_tBXG0vI_M_QwkLU) <duskhorn>:
> <@ldci-5673ead416b6c7089cbf2ba5:gitter.im> @duskhorn:matrix.org Did you try to just open a basic terminal and launch red?

all of this is from terminal, It opens fine without warnings

[17:03:08](#D0jtt_msfyjvvMjCj6GRs2oyLjciQF8PC_y-aSwv-PU) <ldci (Fran√ßois Jouen)>:
Probably a 32-bit library problem.

[18:44:09](#T2PjMVIALzu1js8RoAJLYoQEcdGSmbOVxQuRWEhQOCM) <greggirwin (Gregg Irwin)>:
@duskhorn:matrix.org can you load other image files successfully? If so, there's something about that specific image causing the problem.

[18:45:42](#hrwNoDSbLu4JSO5CWPp__HBTXyYyiBRkgAS-W7qgyk8) <greggirwin (Gregg Irwin)>:
Ah, I see this chat continued in red/bugs.

[18:47:07](#mJJViOjl1qK4u-XmnIkG0hhL4g02lozzhEVIfNk9wgM) <duskhorn>:
> <@greggirwin-55659ddb15522ed4b3e1006f:gitter.im> Ah, I see this chat continued in red/bugs.

Yeah! I should probably have mentioned it, sorry

[18:47:41](#RawdgfbR4tvd2Yom6s2rSbU7eXmm7x2w4eMYEQl350k) <greggirwin (Gregg Irwin)>:
NP.

[21:25:16](#qWOHnbZGkmXrUtMgYn2_s6sDRO4rNNYwsROEx6l3IMQ) <XavierFVJDebecq (XavierFVJDebecq)>:
@ne1uno That sounds interesting.  i go to check it and eventually adapt it.  Thanks for the advice.  Did you use it ?

## 3-Dec-2021

[9:35:11](#joTHZfBO27ih_Z-2DvY5UehUsuiJVyKiKgDHPhqpkq8) <chunes3 (chunes3)>:
Hey all, new to Red. Sorry if this is a silly question, but does Red come with the ability to change numbers into other bases? I saw enbase and debase, but those seem more for encoding and decoding and I couldn't figure out how to change the base of a number with them.

[9:56:23](#O31_5DfzoAeYChiukUXTNC3Air8rDO2otXO9yee5Mxs) <ne1uno (ne1uno)>:
'to-integer debase/base "00000001" 2`  string may need length 0 padded for different base?

[9:58:58](#Dr26AGwfLnORpcJ68pDdZW28znKBwCnHX_4lkYHJeYI) <ne1uno (ne1uno)>:
@chunes3>¬†`pad/with/left "1001" 8 #"0"`

[10:03:52](#Cq_qeDakP3skUxtJSGINrsWT7d_yrISnsoIPQXnEUgg) <chunes3 (chunes3)>:
I did not realize it only works with certain length strings. Thank you

[10:11:10](#F9PLnF96rP6B21zE4TydDqj5DXJStaD4ynQO5M9iO9A) <ne1uno (ne1uno)>:
seems like an unnecessary error but I'm not sure why it has that limitation

[12:44:21](#OARp0q4jqr0ZwsTJU4nCUujKO2W0aaygCwwEv1q5-xU) <dsunanda (dsunanda)>:
@chunes3 Red is the direct descendant of Rebol. There's a script in the Rebol library that converts to and from any base:
http://www.rebol.org/documentation.r?script=base-convert.r
Sadly, the Rebol version doesn't quite work in Red - minor syntax changes. But I've got a converted version that does, if you want it.

[13:13:08](#m6bs6Sxz4DtjMvivxPJFqgUUpOFpnpov3exxHPtlopo) <toomasv>:
Will this count as converter from 10-base to <=10-base :)
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

[14:16:35](#5OdWQ2gJQTKXG9Q6FDEZzYq_d5j70-MneZM1kt9v3Lw) <toomasv>:
Will this count as converter from 10-base to <=10-base :)
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

[14:41:45](#AwYYV-fevkIHfguPFfB1BAetDYZ0xxGc8nSWvytAi-0) <cloutiy (yc)>:
Hello, for those who speak french and cone from rebol, which books are available in french? I own `Programmer en Rebol` by `Magaud et Claude Petit`. Also `Rebol` by `Auverlot`. Are there others? Are there books in languanges other than french and english that you know of?

[18:03:23](#xvspZnfcfyVtN4EXGU04lYxyKc0lrZ4ydnYoHI5sdMw) <greggirwin (Gregg Irwin)>:
I don't know of any others @cloutiy.

[18:04:46](#HZnY6b24M4aB_O8MJOA3sx4AAxrvRVBKE6z4VRtmzvk) <greggirwin (Gregg Irwin)>:
In English there was Rebol for Dummies, Rebol The Official Guide, and the Pakt book from Ivo Balbert. 

[18:04:55](#d4hdofXrTmBvSFoGSXX5iN6El08rDHMuiDmkhPyn-0E) <greggirwin (Gregg Irwin)>:
* I don't know of any others in French @cloutiy.

[20:13:44](#CJeaOZ5WfW0aCOhDhtUcckXxZCiJQiplfKv50te6p0Y) <cloutiy (yc)>:
@greggirwin ok thanks gregg


[22:12:32](#hBhOZXK5hAxWj3fJ5juCCOeEBKdDwCqLzOd0m83w8pU) <ams02468 (ams02468)>:
Hi, I had a question. I have a series of files whose names I do not know and I want to transfer them from one directory to another. I wanted to know how can I do this? I can do this with cmd, but I want to do it in the red method, if you can help me

cmd method 
```
 copy * a\
 ``` 

## 4-Dec-2021

[0:24:07](#gnmd7Wr98Gqkp7YKygEy3u7h_g1RH4uTjfj9Yo68uz0) <gltewalt (The other Greg)>:
You dont want to call the shell ?

[1:10:52](#Ss10Qg2lMNW7xNa1q-pESa4RQOISG7EvZX2J6t_MZRk) <ams02468 (ams02468)>:
I can use call / console but I want to use red as much as possible

[3:29:57](#2kkG00EuBev3BZv3MS8NX6u1xnpXwXd6JMV3Ri2pVMA) <gltewalt (Greg T)>:
Can do something like this:
http://rebol.net/cookbook/recipes/0011.html

[3:35:34](#8chUUwVN2yYTDJoRHlbshg2KJMV3KFI__5iBfjQ0eKQ) <gltewalt (Greg T)>:
If you want to ignore directories as you iterate, you can use `unless dir?`, like...
`foreach item source [unless dir? item [ *do stuff* ]]` 

[3:41:24](#Pk3oIMBhD9AonJ_oHEvINjNZvWmFEiLJ6HxtHClZ8WM) <gltewalt (Greg T)>:
* If you want to ignore subdirectories as you iterate, you can use `unless dir?`, like...
`foreach item source [unless dir? item [ *do stuff* ]]` 

[4:55:05](#FSuoFpj_1SdlVYVmm2s88dMLpgumDx1VU-Puj4yipS4) <ams02468 (ams02468)>:
tanks @gltewalt  

[5:11:33](#RuRP45akr0eLESB29RWtvcLBx5qXSbH5Dmk_jwl-7b4) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
You can also use ultra fast (at least in Rebol) `remove-each`filter to remove unwanted itesm. Something like:

```
files: read %.
remove-each dir files [#"/" = last dir]
```

[23:22:33](#LPMpWQX8ORPV1TOKGG8orcovns84ntiQ3X1teOvzy5U) <ams02468 (ams02468)>:
tanks @pekr 

## 7-Dec-2021

[9:46:05](#wRvoLffuNvz2FrINXQX8Fqa9RTIdTxODjTmUt9i5Ux0) <ams02468 (ams02468)>:
Hello, can you tell me if there is a code or command to find the file in red? For example, this command ```
dir /s /b| find "test.txt"
```scans all subfolders of the folder to find the file. I wanted to see if there is a similar example in red?

[9:47:43](#PsFWDYbTz1jUuROWkipOEVTrqlc5sBzwf-ZBa4j0bOQ) <rebolek (Boleslav B≈ôezovsk√Ω)>:
@ams02468 there's no such command built-in, you would need to write it yourself

[9:57:21](#U-eeYS_7G8oTv2NfaBDFMoUaBd8s4WdxKnjsDzD_gWg) <hiiamboris (NOT THIS ONE)>:
https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/glob.red

[9:57:32](#wA1FggshyL5TOTTLCECZ_0KzedbILBB43UUox6rPJxk) <hiiamboris (NOT THIS ONE)>:
`glob/only "test.txt"`

[10:06:16](#PxgZInEQu8Jv76lU81R4JXiWllh806r32qIKaX6Zp0w) <ams02468 (ams02468)>:
@hiiamboris thx

## 13-Dec-2021

[1:38:11](#QoeKNwjl_fMZvlJLdbmr94HfVSkdd2xUrxXD3tRmsHo) <lylgithub2021 (lylgithub2021)>:
@hiiamboris thx

[1:44:57](#LSVpyDqa5ieUSeYsfeby_os5eybejjAJL7iyEbp4_rQ) <lylgithub2021 (lylgithub2021)>:
I'd like to get such a result: if the value of an expression is not none, then return the value itself, else return %"". This is not difficult as the following example shows:
```
either none? 3 + 2 [%"][3 + 2]
```
In the above code, the expression `3 + 2` has to be written twice, and I don't like introducing another variable to express `3 + 2`. So, is there a simple way by which the expression is written only once?

[4:00:18](#LJcjiexRRPRm5i4Qd8_s2uM5UfLqZCfrmsVaC2RpT7c) <zentrog>:
lylgithub2021 (lylgithub2021): `any [3 + 2 %‚Äù‚Äù]`

[4:00:50](#3J0D24LcbWiCrBu1XZrZuge_BCLoEdji0fFWz27LX6c) <zentrog>:
* lylgithub2021 (lylgithub2021): `any [3 + 2 %""]`

[4:02:47](#Aa3xLbKg_4zo6v1FOW8nEeCFxBy1-XCWFm3PNG2Uq10) <lylgithub2021 (lylgithub2021)>:
Oh! So easy! Many thanks! @zentrog

## 14-Dec-2021

[6:27:42](#Qua4ARe6fz8li9z3J-7Wt_dQZj5NqE6qmJl_4ce6W8k) <lylgithub2021 (lylgithub2021)>:
When I read a text file with `read`, I get a wrong message: invalid UTF-8 encoding. Does that mean `Red` is not able to read a non-utf8 encoding file such like `ansi`? Or is there any other way to read this kind of file?

[6:41:53](#mXBEk7-MktAajf1jINtQq_EzaCmhP-jttdJVgCuVFUA) <rebolek (Boleslav B≈ôezovsk√Ω)>:
@lylgithub2021 Look at https://gitlab.com/rebolek/castr/ there is a file `%codepages.red` that is able to read 10 most popular non-CJK codepages (others can be added of course).

[16:50:25](#aTsNCalvGPMCu9ZgoMzrAMCfq0Kb0oFNSmP88IyA3IE) <badre_enam_twitter (Muhammad Badre Enam)>:
Hello. Is there a way to set user agent while downloading a url?

## 15-Dec-2021

[1:51:52](#D3bW5aQYhtyGCb94KRfo9Np_Q9PLIm6EGF0V_hz-YLU) <lylgithub2021 (lylgithub2021)>:
```
>> dup: function [str n] [loop n [append "" str]]      
== func [str n][loop n [append "" str]]
>> dup "0" 4
== "0000"
>> dup "0" 4
== "00000000"
```
The same input gets  different output. I know the problem comes from `append`. But how to clear it before the next loop without introducing new variables?

[2:04:31](#yYpfrza7vbp5JlH0sqdNnFTi4YietyigIsApJLXUms4) <gltewalt (The other Greg)>:
copy str

[2:05:45](#NQO9Cqwm8taDXWyZYAHISQPeVaVDWhc45EcRVVHFb9E) <gltewalt (The other Greg)>:
Err, copy ""

[2:07:29](#KcgkDqeb9Y1vxSGEARwlcTqei7v9ImraAQ-cvWMcDRg) <lylgithub2021 (lylgithub2021)>:
@gltewalt You mean `loop n [append copy "" str]`?

[2:08:39](#S7WaWkZTgYFMFHO5qmfh7Jz1uUXCjft9f310BHaVoII) <lylgithub2021 (lylgithub2021)>:
* @gltewalt You mean `loop n [append copy "" str]`? This get "0" when `dup "0" 4`, not "0000"

[2:18:58](#CbeLZb5eyV1AlVUH1B03vbh0NLiLaHmHaE2H11-RZI0) <greggirwin (Gregg Irwin)>:
https://github.com/red/red/wiki/%5BDOC%5D-Why-you-have-to-copy-series-values

[2:22:02](#TnZK1-IKh4_M0nAlUvOqWjW_tHoOFBo2_U96yBfaNp8) <gltewalt (Greg T)>:
`dup: func [str n /local temp]  [temp: copy "" loop n [append temp str]]`

[2:32:14](#wx8EpTIRNvNjT8lQEa5jmyL9yuYf-bX5xBKB4-EIXqM) <lylgithub2021 (lylgithub2021)>:
@gltewalt So another variable "temp" has to be introduced. Is there a version without using a temp variable?

[2:35:59](#0x5OJyVV1odguATwIP6d4wBCKpw8XKHCy1BUZy6W_I4) <ne1uno (ne1uno)>:
`append/dup`

[2:40:33](#U587j0UpZTVmDyZrtOK6UmUEjcZxcAn79PKexo_T8Ho) <gltewalt (Greg T)>:
`append/dup "" "0" 4`

[2:46:45](#6W0dfy5IMISH8K05U-fv5OvIkijKgmLhNKkLjMgtKio) <lylgithub2021 (lylgithub2021)>:
Oh, That's it! Many thanks @gltewalt @ @ne1uno @ @greggirwin !!

[2:47:19](#zFbiFdbp_RkLg0WrFMMRWMCphfKHwWrMt5sFmxM1cRw) <ne1uno (ne1uno)>:
`? append`

[2:50:43](#Ept25BDaR2scpuRtGhtu7sxeUU74pQ3CUhLFlGepifg) <gltewalt (Greg T)>:
break stuff `write/append %E.txt append/dup "" "e" 4000'000`

## 19-Dec-2021

[3:02:36](#BIAc3d-KstGflSqiYBXDofGuKG6MZPPbLTgw3Y33CV0) <lylgithub2021 (lylgithub2021)>:
break stuff `write/append %E.txt append/dup "" "e" 4000'000`

## 20-Dec-2021

[3:49:46](#eGm3NyezSs7PDgJmqRxFtBwzoSIcjqXyq-_hjZzhAYQ) <lylgithub2021 (lylgithub2021)>:
I put some variables/functions which may change oftenÔºàaddedÔºådeletedÔºåmodifiedÔºâ in a file named "aux.red". For example, the content of aux.red is: `Red [] a: 1 b: 2`. In the main program "main.red", the content of aux.red is introduced by `do %aux.red`. The reason for the above handling is that I don't like to compile every time the main programme when the aux.red is modified(for example, `a: 2`, or delete `b`). This works well when running the main programme by interpreter. However,to compile the main programme, `do %aux.red` has to be replaced by `#include %aux.red`. This causes another problem -- when the content of aux.red is modified, the main programme has to be compiled again which is not my initial intention. So, how to handle this item? 

[4:44:35](#8G-dzug-ehIsEmF0QGV5APlfC1270YlV2mE6s6TMfOM) <toomasv>:
Leave just `#include‚Ä¶`.

[4:45:32](#MIit22BezNSX0TaxfMKOcvn6xtoH6NMrA_p0UnSVqDw) <toomasv>:
It is interpreted like `do`.

[5:37:17](#ccLEWt5Yjfbl63l9fuoQn6EotvuJhhNSUjNXfyx_d_Y) <lylgithub2021 (lylgithub2021)>:
It is interpreted like `do`.

[5:41:48](#O5QcEC0kNHgv2hHsLOjNKH7WUJCVMznQHtHXuYwJEj8) <lylgithub2021 (lylgithub2021)>:
* But when the content of "aux.red" is changed, the main programme in which `#include %aux.red` is contained has to be re-compiled. I wonder if there is a method to change the content of "aux.red" at any time without compiling the main programme again. The function of "aux.red" is jus like `.ini` file in Windows. I want my programme is openable by which new functions can be added, or orignal ones can be modified at any time without re-compiling the main programme.

[6:55:59](#8sw2WoYCQ8jrK56BgeKk1QOmACb3y958dxX8WAjGlX8) <lylgithub2021 (lylgithub2021)>:
Thank you @ @toomasv ! 

## 21-Dec-2021

[9:00:03](#N7SzmkU0UhWAhvh-uvXpBsvDVYt887jeWm6Cv5qo3-0) <duskhorn>:
Hello people it's me again, the Void Linux bug guy. I still don't know what's wrong, but I have another question since I can't find much stuff around

How does one embed Red into another language?

[9:06:33](#PeVL3w6ANLBvVM0G5BTQ2w4nr8Xgrnho-2HqF_GBw48) <rebolek (Boleslav B≈ôezovsk√Ω)>:
@duskhorn:matrix.org there‚Äôs libRed that you can use

[9:07:47](#eh2qEGxPADug_3mWswdIWxDtzj8WqHB4dN3oKINV9J4) <rebolek (Boleslav B≈ôezovsk√Ω)>:
https://github.com/red/docs/blob/master/en/libred.adoc

[9:07:58](#bsHsNwxRo00ovZgRne7gThcF2P7Fb_Z0BnTtlcxdQGA) <duskhorn>:
Ohh thanks!

## 31-Dec-2021

[18:38:16](#ZD_jmG0WNFxzbIakGmbw6EVEuhfbvXcxVHHjiIvhTkA) <ams02468 (ams02468)>:
Happy New Year everyone, I hope you have a good year in perfect health with friends and family :)

## 5-Jan-2022

[2:53:05](#brAdSfbI0UJa1lKi0Wqxwndqg03gLeSxNekgX5fhawY) <ams02468 (ams02468)>:
Hi everyone, I had a question, how can make the program delete itself after running?

[2:58:55](#Npgqa0oAgPyue7-ejRk0C8PTYirjpzsad2DjUKlQY6k) <gltewalt (The other Greg)>:
Delete the files, or delete source in the console?

[3:09:23](#QjokwcXMy87lL4cBMQl0R7oCuT0AkG_5nSpiMVpngDA) <gltewalt (The other Greg)>:
What do you mean by "delete itself"?

[3:11:48](#uUFi5XLzuN4y8F5g493f6YGiFHksQVmxqTqnry1BqEg) <ams02468 (ams02468)>:
delete the file

[6:32:57](#bd_G9yQpyge8DjLyjtkx39xGxIQO63FQju7C1t44Wso) <ams02468 (ams02468)>:
i used this method but it doesn't work ( after compile )
``` 
a: system/options/path
b: system/options/boot
del: func [a][call/console rejoin [{del "}a{" /s /q}]]
DATA: rejoin [ a b]

 delete to-red-file DATA
 del to-local-file DATA
``` 


[6:58:37](#1vuudUjbQ-MVWP3Ohpgm4fOTJrqmKkSVkYxIMguKg_g) <gltewalt (The other Greg)>:
How about `call/shell` ?

[7:32:14](#7hEilxYLi7xSb-y7inkdPqB265gTytT8RDQs8Fv7UEE) <toomasv>:
Why DATA? Doesn't your `b` contain full path already?

[7:32:42](#FcNP4qvMKq9secXifRSYRlqttZ0OeAUsxWt3gS7i80g) <toomasv>:
* @ams02468 Why DATA? Doesn't your `b` contain full path already? 

[7:41:51](#mLdfeYYwOAOJeiF6EayT43OEU0Oh0UY4ep7WkL13ez4) <duskhorn>:
Hello everyone. If I embed Red using libRed in my project, how does the runtime treat red files? Are they interpreted or do they get compiled at first use, or something else?

[7:52:10](#tojv_IBDvuP6KDC6VGhrxVlUsgQeA1c3Zjs-DRFxZC4) <ams02468 (ams02468)>:
i used it before `call/shell` but not work

[7:52:25](#mrUPfCh8JeYTU2veW_QI3KhwsgLkpQgIQmmD9vyT8uA) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Interpreted.

[7:53:09](#qvp7k0MXzR6mgKtR_eFULSfRccHFM0MwkyfXyErI684) <duskhorn>:
> <@oldes-556aec4015522ed4b3e131da:gitter.im> Interpreted.

Thank you!

[8:00:28](#PChXaNzrr5P4HezsyN2uP4JYG5P0FlHLbalPHk0ky7Y) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
@ams02468 you cannot delete a running app. So you must start a process, which will delete it after it quits.

[8:08:37](#FaKqdtGwvMZi3DRnRBuK_1M12M0z2rlbM5ngO17AU-U) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
You may try something like this https://stackoverflow.com/a/19748576

[8:10:35](#zyU38cLHtcUabubDMma8A3FnRPK7ig40Jnqi0oS9DZw) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
@ams02468 are you writing a malware or why you need it?

[8:16:39](#RUUE-60Wukz-i1Azze9Y1cKeDoicR4YkArU0prs3zoo) <ams02468 (ams02468)>:
@Oldes No, I'm not writing malware. I'm creating an installation file that does the entire installation by click

[8:17:51](#WzOhcTdZd2lMPFjNJeL_4NsA_nyy_ea-UOG2iuoXtfo) <ams02468 (ams02468)>:
And then deleted 

[8:17:54](#pD_KBb3vSD2xE9dfPzg82GIfRDXHDPy_9EcecmX6ZFc) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Installers usually don't delete itself Ì†ΩÌ∏â

[8:22:47](#S0UPRhUw87OIDDwQ_PVHAuEM5oMwEAIjpv7aH_3c9mo) <ams02468 (ams02468)>:
@Oldes If I want to write a virus or malware, there are much better languages, but in general, I am creating an installation file my own way. 

[8:27:40](#Rqn7XadFlFbOlD9h0K5KFBTvcpRhrLpNyzndmC8Z3K4) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
@ams02468 this works:
```
call/shell rejoin [{/C choice /C Y /N /D Y /T 3 & Del "} system/options/boot {"}] quit
```

[8:43:09](#4BhxCshxc7tsi6w5bLHwp1IeKznYR74s2iwLaxNssso) <ams02468 (ams02468)>:
@Oldes thanks If you are curious what this installation file is for, I have to say  makeing a installation file. for the old game Ì†ΩÌ∏â

[8:51:24](#atzttuVBizWG9Pm-NAA4Pvi26m1FkRWaD8LOy08v9ZQ) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
The first `/C ` should be removed btw.

[15:08:22](#OFiH906jYT1WoaYKf-rKsdkHedt1mjeL5mDXxTqDOlY) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Is there alternate terminal for fvwm?

## 10-Jan-2022

[3:29:52](#mRTqechi73QHY3jjkP1shhdps2h2C0fP-Z2nr-r3h18) <chunes3 (chunes3)>:
Hey all, quick question: what is the easiest way to get from `["a" "b" "c"]` to `"a,b,c"`?

[3:37:25](#jrVEQQh1fG7dN9s-Y1PnF9j06OaabsT9_F8-Z8GDK3U) <ldci (Fran√ßois Jouen)>:
a suggestion
`blk: ["a" "b" "c"]
str:  ""
foreach v blk [append str rejoin [v ","]]
== "a,b,c,¬†¬ª
`


[3:38:54](#0sjJ-xQiscvg6ldiAQ5p7vvY7iH3DxaBesCU915ZIqQ) <chunes3 (chunes3)>:
Thanks, was mainly wondering if there was some kind of `join` word I was missing or something.

[3:39:03](#udZtylySnaNRiJQmX5lvJfCpluEkwNZyoYCDNJt4BkQ) <chunes3 (chunes3)>:
Also, do you not have to `copy` `""`?

[3:43:16](#hTwDUGYOxr55vHBerdnpcfG8fwzr9UuXGT0EfVSUzeo) <ldci (Fran√ßois Jouen)>:
Better
`
n: length? blk
str: ""
repeat i n - 1 [append str rejoin [blk/:i  ","]]
append str blk/:n
`


[3:43:45](#AICVz551xK1yN91lDdmiFfQWJ-NFYCnE8hZoRHFpHoA) <ldci (Fran√ßois Jouen)>:
`== "a,b,c¬†¬ª`


[3:45:21](#yhAd3AX3PCfcEr2PwGmaO5vN6fzn1_V2uwVO1DkQXis) <ldci (Fran√ßois Jouen)>:
@chunes3 copy must be. used for creatinga new string :)

[3:47:24](#nvDF2hbpHKMq1wo8q1kZFafXpuje8_CjkKZ2YBlh5ok) <gltewalt (The other Greg)>:
Or something like:  replace/all form ["a" "b" "c"] space ","

[3:48:53](#c4dKfj4gIyPG_nnPLIEm3FtLcMi_b1Kwu2fNLWaUG9w) <ldci (Fran√ßois Jouen)>:
@gltewalt:matrix.org Better solution :)

[4:08:39](#gVYPy8UJahVBKQNKCZHRNE4gOSkoVqtBrXY_MTBRj38) <chunes3 (chunes3)>:
Thanks, that's slick

[4:25:03](#Q_9XGHDICUeRRH4QPlIqsTbv7Rn9Qynnc8wa51Im6tU) <gltewalt (The other Greg)>:
Thanks ldci (Fran√ßois Jouen)

[4:25:50](#rk0Abcv6O9xpENr3u8hVIYErt_2CnLgZtZbkKydmNsE) <gltewalt (The other Greg)>:
Or `space ", "` if need the command and a space

[4:26:42](#3BL8Ol3eJs5JT34pSgiEa2fCNLLIA5EOIrsCHPZllhg) <gltewalt (The other Greg)>:
Comma and space before element

[4:26:48](#6ienpCFVb6I-TvAg_Da09nboCOMMtJtRYyV8aWU_UVY) <ldci (Fran√ßois Jouen)>:
@gltewalt:matrix.org With Red we always find various and better solutions:)

[9:00:34](#COagZhh6_Fk3bpKKm9DYSoQiXiscwk3IEIWYNOCJUEE) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
What if you once get `blk: ["a a" "b b"]`?

[12:55:05](#_WlO9SV6Bi1agND76W5beZ4_ymXhzGaSBayoPyCaA4g) <gltewalt (The other Greg)>:
rejoin it first

[14:20:47](#Wkfe359rhQdEvNmTDBFopXgCwOMQ8uJ6BPzVvXNbmJw) <toomasv>:
.. use [concat](https://gist.github.com/toomasv/fd651f24e18d7bc85d05204cc5f828d2)?

[17:10:40](#CWP93UWztsHcKbXMNZmdZqghubVsrsq1k7d9d78C3x0) <gltewalt (Greg T)>:
```
>> blk: ["aa" "bb"]
== ["aa" "bb"]
>> replace/all unique form blk " " ", "
== "a, b"
```


[17:10:58](#Fx4Zk-zGDJLFiaJTF-49fM1A5XEAUaA3J3bb_bllBCk) <gltewalt (Greg T)>:
But... unique does weird things with more elements

[17:12:11](#vaZjDVuvL5cXsFXDrLzXVE31qDvCIqmjDgovnmqd7u8) <gltewalt (Greg T)>:
But... unique does weird things with more elements

[17:15:56](#knVijptazrwkYwBsink4nKMTjPSKI3eN8AHMZZ1FVg0) <gltewalt (Greg T)>:
But... unique does weird things with more elements

[17:16:37](#bh0NCB9nUEZe_DstNsSIHqnNYfxsSe9OYPoawA6t1iQ) <gltewalt (Greg T)>:
But... unique does weird things with more elements

[17:18:48](#akEFaauUjyE6_fTIv5cKEnESnNYEOhqjnsqRpGr70vg) <gltewalt (Greg T)>:
```
>> b2: ["aa" "bb" "cc" "dd"]
== ["aa" "bb" "cc" "dd"]
>> blk: replace/all unique form b2 space ", "
== "a, bcd"
```


[17:38:13](#8WdgO2or1T_5CPYaaN41GXcxadOVjHATMJF7WNe8zo0) <toomasv>:
Of course, it leaves only one space after `unique`.

[17:49:35](#RXibw_OMd9n52ZCbvlFwUnHMax5EfohbKOI0McWJt8U) <toomasv>:
```
join: func [block sep][forall block [if not last? block [insert block: next block sep]] block]
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

[17:52:37](#40yokvykA_8_pwm1IEuwOuMkAFPdieYJMiZZTdeV9jE) <gltewalt (The other Greg)>:
Technically doing what it's supposed to do

[17:53:31](#f7p3qWSNKFB9VMmCed-gk4OdFVgHEQJhvBIkqEl7z8E) <toomasv>:
* ```
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

[17:55:57](#XODJbStwKOV6JqpinfZodHF4KI-TWpa0pz1loUbfGi0) <toomasv>:
But Ì†ΩÌ∏ü
```
rejoin join [<a> <b>] <c>
== <a<c><b>>
```

[17:56:25](#SC3JV96ABPLo88Ies96CpS3AwejDshAYabgPv1hLbqQ) <gltewalt (The other Greg)>:
With a unique/deep it would be easy

[17:57:00](#hCoBTDiqIOx4I-NjoZh_EXengKjcHIh67PPjXzaLzqg) <gltewalt (The other Greg)>:
Each series within the series would get uniqued

[18:30:42](#J844deOIGzsUTILfnQ80rK-9RrQrTaRPxH9yk3AUFUs) <toomasv>:
Something like this?
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

[20:19:11](#SPiFZYyr02e87qnhW8FcjxdeTM9c-KKhwbpQssf39Rg) <gltewalt (Greg T)>:
```
>> unique-each: func [s][forall s [s/1: unique s/1 head s]]
== func [s][forall s [s/1: unique s/1 head s]]

>> blk: ["aa" "bb" "cc" "d"]
== ["aa" "bb" "cc" "d"]
>> unique-each blk
== ["a" "b" "c" "d"]

```


[20:46:09](#da-Ubgao28JdQgmg_9bFT2BmhJOOn_xaUmo08sidcoc) <toomasv>:
:+1: 

## 12-Jan-2022

[12:08:32](#AopGsywI2ww7Aw0wSUORxjNXik9UXUV6RM2swmgw2fM) <henrikmk (Henrik Mikael Kristensen)>:
With functions like that, I would wish for effective means of passing all refinements from UNIQUE-EACH to UNIQUE, simply by reading the list of refinements for UNIQUE and have them integrated into UNIQUE-EACH.

[12:22:59](#mUDYE4C6ua3HDZ1oyzSqYVlCIqNhrFVje0TZlpiVFMI) <hiiamboris (NOT THIS ONE)>:
like [this](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/raw/master/new-apply.red) ?

[12:40:16](#lgjQNUEEUBwmXNubsDhPmszJ56sXO4DBPzByoUBEN2o) <henrikmk (Henrik Mikael Kristensen)>:
No, lifting all refinements from one function to a wrapper function. APPLY doesn't help with that. Maybe it's just about using SPEC-OF UNIQUE, when building the outer function header.

[12:59:58](#3iC6Rf0r9hyyKtoFUybld0QebCfoQo6jFJ-2nJvQQp0) <hiiamboris (NOT THIS ONE)>:
yeah, though actually it's more like `head clear find spec-of :unique /local`

[13:00:20](#9GCHJd6IFauRw3tHMsNuCvKC-qtB7D1VXV20HpIlPYM) <hiiamboris (NOT THIS ONE)>:
because `function` is stupid enough to put two `/local`s into spec :)

[13:01:48](#S3pyt6eVZFWdLlICny98UDTqM6CyxZvSnovQ1myiTPs) <hiiamboris (NOT THIS ONE)>:
probably no need for `unique` but for interpreted functions I've used this pattern some times

## 18-Jan-2022

[12:44:10](#DmJ232LhI7E2wVTWkgcjrevr86yTyyhHQ1eOsgrX2Fc) <henrikmk (Henrik Mikael Kristensen)>:
Should it really matter if there are two ```/local```s ? Would there not be a formal way to read locals in a spec?

[19:39:50](#n3XlcqzZaYXJ99am2tmwiIUi8kTUEe_nxCnzy619Iok) <greggirwin (Gregg Irwin)>:
We need to formally define the function spec, so all tools and constructors know what rules to play by. 

## 20-Jan-2022

[23:32:23](#mmcWV2ohSZKS2PWip2xNsInlE2_PiM1keSw1z_Wmh9k) <laturk (laturk)>:
Can I get help converting a short rebol program (23 lines of code) to red? 

[23:38:34](#oRvlfmkv9bZltRZHpHuao61-E0BjkSdOY0_b1TwCpYU) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Sure.

[23:39:18](#HOGcOM0x_c15pS2vPNaArsrpor6D_5AbZRfWSyRgfcM) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* Sure. (but not from me now, as it is too late in my timezone)

[23:39:36](#mENmvLg92Uyb_yJIBJlyZn9ePK9iTqbsWyl-e1t6Xyk) <laturk (laturk)>:
Do I need to post the code here or in a paste bin?

[23:43:41](#gfrJ9KEFpeWqyd8Sr46LE4lpCTDgbwlyCPwJpA3TjJY) <gltewalt (The other Greg)>:
Paste bin would probably be better 

[23:49:43](#y6wjCbGA7pwewfpGnnmJyNtwh0x0Ni7MJEFhaMCK3dE) <laturk (laturk)>:
Thanks Oldes and gltewalt, here's my program:  https://controlc.com/96919138

[23:52:11](#xqboa_ymgYm8RQcEDUgampZm6QR_nfckfSyXW7PDrzE) <gltewalt (The other Greg)>:
Did you try it as is, in Red?

[23:53:50](#XJZ-1TjO2xMqv7d1f9MOR9UndRdoD2GB8R7q7byhApU) <laturk (laturk)>:
[master¬π¬≤//firman]% sudo red find-replace.r                                                                                                                                                                                  (l@lat:~/firman/)
[sudo] password for l: 
PROGRAM ERROR: Invalid encapsulated data.
[master¬π¬≤//firman]%                                                                                                                                                                                                          (l@lat:~/firman/)


[23:57:13](#X3F4d7Lu5sOCRi7h62Gxzfp9aR2Fee9Z5FwrhmSDyo0) <laturk (laturk)>:
Perhaps red for linux doesn't have view yet?

[23:58:52](#Qw-yvs5CWIJ20_x4p1Xeu2elzDEddKhcDmedrgysqC4) <laturk (laturk)>:
Well, view isn't needed for that script.

[23:59:31](#0ElbERw3WaiBeJ7zgdc82x8K2NxiH4xCPSxSjNXXZyM) <gltewalt (The other Greg)>:
It has it.
Have to ask,
Did you change the program header to Red [ ] instead of rebol?

## 21-Jan-2022

[0:00:00](#Kcg1p7JXFDO-h92JVlMYx8dkaiFUJnwB2fzG6tdrLjw) <laturk (laturk)>:
Yes, I did.

[0:00:58](#5s79uDRPAiAH_uW02LYf2oAj_KEblBkYvx5YabxXyB4) <laturk (laturk)>:
But that is the only change I made.

[0:01:23](#6XiN4TStutRh4SmvSN2oO41eYdrSm-bsWNwpS9Ogmww) <gltewalt (The other Greg)>:
Can you run the red console? Or does it error on that also?

[0:03:48](#6INcovWbL1qpON57FVvqrPjoYS_IocYVuOdcROh38cY) <laturk (laturk)>:
[Downloads]% ./red                                                                                                                                                                                                         (l@lat:~/Downloads)
--== Red 0.6.4 ==-- 
Type HELP for starting information. 

>> 


[0:04:02](#ObrdhIo1KEtA0z16j8t6grArh5KAQ6EzX6oQntAKwlA) <laturk (laturk)>:
Yes.

[0:07:11](#DE2aBIRbSan4e4Em3-5Wm6bJvpuzmB9w2lM3OfFlgBU) <laturk (laturk)>:
Does the script run for you? Or do you get the same error?

[0:08:51](#C3-pmVfdIb1ddm-ezbyWMiCIZJ7sWtpK_JTX_lf7KqU) <greggirwin (Gregg Irwin)>:
@laturk see if you can `do` it from a Red console. `Ask` is part of the console, not the core. 

[0:11:57](#6bI--V0Hv8LMEY1U9YoDKUWcID5-DRvUeB6KyO5Uq8Y) <gltewalt (Greg T)>:
https://gist.github.com/gltewalt/629dcaf357ec6ffae3f134f423d4e4ec

[0:11:59](#YXzI7cumTw-RQma_YYxuwa8yy0mxcoC4F3vbRMc0JVE) <laturk (laturk)>:
Gregg Irwin, that works.  

[0:12:13](#c6W1fuX0jbjWjuspOI38PhGO_6MkozBvjhzw7Rxol9g) <gltewalt (Greg T)>:
Need some 32 bit libs in linux

[0:15:37](#apJIgy9-_CDrtkS1wfpt1ua1sv25D3xlfAXGWs2WiQo) <laturk (laturk)>:
[master¬π¬≤//firman]% locate libXaw7.so.7                                                                   (l@lat:~/firman/)
/home/l/r/cp/libXaw7.so.7
/home/l/r/cp/libXaw7.so.7.0.0
/usr/lib/libXaw7.so.7
/usr/lib/libXaw7.so.7.0.0
[master¬π¬≤//firman]%                                                                                  (l@lat:~/firman/)


[0:16:04](#TsDsMVB6OtifhmlAQecaDLPKu7MKDf3vWrvUY9BgsJw) <laturk (laturk)>:
Are the libs not in the right place?

[0:18:57](#kNvQsIchJmSXMlQQ78f3EA0VDv-H9Wv1tpxRu4n-_NQ) <laturk (laturk)>:
I'm using archlinux, and that's where pacman placed them. And then you can see I copied them to /home/l/cp which is where rebview is located.

[0:26:55](#U8aZbBKaXwrUTJqKSjMxZPrwi-lNNtDet0eP_Ru5Sq8) <gltewalt (Greg T)>:
After getting Red to run:
Change the program header to `Red []`
Add `rejoin` before the `ask` blocks:
`  go: ask rejoin ["Replace " :find-str " with " :replace-str "? (y/n): "]`
`choice: ask rejoin [newline "Done: press <Enter> to continue, or <q> to quit. "]`

Should work after that.

[0:28:15](#jHc3SDzw-3STYlxsA9tzyfTojYaxla7sCPNF1RVwumc) <laturk (laturk)>:
Great. Thank you, Greg. 

[0:29:21](#E7BWsmBVMZCI6WzjJkrmrNzl9eI9fFg1Btv5Ury62M4) <gltewalt (Greg T)>:
Oh, and change `find-str` and `replace-str` to get-words, as above ^.

[0:29:35](#la_ZvtqfsNsFSRmW-mOhcMitWNpEmbX9uW3T6Xdj0aQ) <gltewalt (Greg T)>:
https://gist.github.com/gltewalt/26a6585644c98ef2d45e8cb6928be24c

[0:29:52](#BVshD24zAIwgRoaWoKbKX3hoVlcfb5-2PQ2N77ZE4Us) <gltewalt (Greg T)>:
The "whys" I leave to you to learn about.

[0:30:43](#tURZpoymxMfqOEnBPiUhwViTbHIxChLSHkEk5fxdv9g) <laturk (laturk)>:
OK. Thanks to all of you for your time. Much appreciated.

[0:44:29](#nlz_3yTsrW-GeY63xSB74K1PHPuklcx53qj2CJJJJjg) <gltewalt (Greg T)>:
Also, there were old issues concerning running red from relative paths.

[0:44:40](#yF8gR1useSn6i0RbsmkTl40TjjF9373GbdQs0vebQ2k) <gltewalt (Greg T)>:
try an absolute path

[0:45:20](#cdR8p70_6tQAWcZLZVT4CQtotarPbdK9Q5zT5fj0jf8) <gltewalt (Greg T)>:
https://github.com/red/red/search?q=Invalid+encapsulated+data&type=issues

[1:06:09](#i5ATeP-iUxQpHQo4h51lqD5lRId6UHJIwWMN356eV_w) <gltewalt (The other Greg)>:
And somehow I missed Gregg Irwins response, and just kept babbling on

[10:42:09](#I3aGlbHsyrKuHRMvrHBMBelaamWsMFl8kU7HgjF2qLo) <philipperbd (philipperbd)>:
Hi everyone, I have an issue trying to install Red on Ubuntu 20.04.3 (Ryzen 7). I downloaded the "Automated builds, master branch" for GNU/Linux and  followed the instructiions for "Ubuntu 18.04+ version".  When I try to run "./red-[my-version] it outputs: "error while loading shared libraries: libgdk_pixbuf-2.0.so.0: cannot open shared object file: No such file or directory". If you have any advice on solving this issue it would be really nice! Thanks

[11:44:40](#v-xL9QRCC9GYmLS948H-amZkgJASkFrfPHgLR6EUNIU) <hiiamboris (NOT THIS ONE)>:
hi @philipperbd 

[11:44:51](#BG6zOKMRomMb09umn-HFJEyg_uwFG3awec-TkytZUKE) <hiiamboris (NOT THIS ONE)>:
did this command fail for you?
```
apt-get install libc6:i386 libcurl4:i386 libgtk-3-0:i386 libgdk-pixbuf2.0-0:i386
```

[12:03:14](#1qVlslB1NlflLM3TvDpFWT2AfALrLtKVHAw9kusIT1g) <planetsizecpu (Jose Luis)>:
Welcome btw @philipperbd 

[13:37:11](#zxRzUYK7gf8B9qOwbuPLhuj6Nlktgs_JTpj-MF3YrH4) <philipperbd (philipperbd)>:
@hiiamboris Thank you very much it worked perfectly! 

[13:40:09](#50vf0NO6pTvGDTciZ3gPWgEEGqjS_FbDLtwjAhjSJ00) <hiiamboris (NOT THIS ONE)>:
I just copied it from the download page :)

[13:40:13](#-j8ATSBOR2w3kjU5F9yg8f_M7lodlVJ6Lp9tFG0P2kk) <hiiamboris (NOT THIS ONE)>:
You're welcome

[13:57:15](#5E3KFfcFL2vl2xRkJ37CI4DwM2YoSBN47_7UHEnTx6g) <philipperbd (philipperbd)>:
[![image.png](https://files.gitter.im/570387cd187bb6f0eaddec47/vnE5/thumb/image.png)](https://files.gitter.im/570387cd187bb6f0eaddec47/vnE5/image.png)

[13:57:58](#aCGSu8_nHvEjsPS1KQKc50Roi6Xy5lDD-JkujfBIvmw) <philipperbd (philipperbd)>:
I tried what is said in the download page but did not worked for me. But thanks! :)

[14:06:06](#diRXu4V770VA--KTYTQLc4PCpPk-5DNj3vfY98YxhvI) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
I think that having only 32bit Red version is a top issue and should be solved asap. Unfortunately that is a huge task.

[15:01:09](#M7rMqYOEqMSMP5gYbnvbEXlZRuduDZaVZfWAX6RsK4I) <hiiamboris (NOT THIS ONE)>:
@philipperbd I don't get it how come your screenshot doesn't show the full command. This is what I'm seeing:
![](https://i.gyazo.com/9a6b8415772e31f119daa61c32e198c0.png)

[23:01:47](#PBVXELHejp7nEl6NvT692PqMhsplYi9_ybJMMoTAwK0) <greggirwin (Gregg Irwin)>:
@Oldes it is important to us too, but what makes it a top issue in your mind? That is, in the grand scheme of things, are other things more important? This is our constant struggle. What mix of features and projects give us the best of survival?

[23:24:47](#SKZjzfAxQKRvY9ROli7L9ojX7FqHk3F6B7IdMVoSWzo) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
32bit system are dying fast... maybe too fast. One may ask, why use tiny Red app, which fits on one floppy disk, when it depends on installing so many libraries. `apt-get-update` downloads 16MB, and the rest needs 332MB (in clean 64bit Docker image) Ì†ΩÌ∏ï

[23:26:27](#cS7O-GP5aDKQswAmWHipEW9e0UUV7ZYtc8s2A5ZWamU) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
But I don't want to play this _devil advocate_ role.

[23:38:13](#dDf1gQ-ALqu9yTgGONYqhofKq9-qKJA3Tz9vei5vn_k) <laturk (laturk)>:
[master¬π¬≤//firman]% red -c find-replace.red                                                                           (l@lat:~/firman/)

-=== Red Compiler 0.6.4 ===- 

Compiling /home/l/firman/find-replace.red ...
...using libRedRT built on 21-Jan-2022/14:08:06
*** Compilation Error: undefined word ask 
*** in file: /home/l/firman/find-replace.red
*** near: [ask rejoin "Find string: " 
    replace-str: ask rejoin "Replace string: " 
    go:
]
Why the above error message?

[23:39:48](#CSUo-vvOnjA60IYa7xXr7HQFSGYHdDtCvsFnuqusAjE) <greggirwin (Gregg Irwin)>:
I think someone already pointed to this @laturk , but just in case: https://github.com/red/red/wiki/%5BNOTES%5D-Compiling-with-console-functions---input,-ask

## 22-Jan-2022

[1:10:01](#jRpR9Rxv1ovkI8-NdLeBcKFgkWxK31UQVdey9BJ7WkY) <gltewalt (The other Greg)>:
I dont think we did, because I didn't know he was compiling 

[1:10:17](#IHhQHC8ISAk833h3K_nOtHMzS3vnH6gRSmHexCoz0Ws) <TUA_Platy_twitter (T UA)>:
Hi - is there any support for config files (TOML/INI/XAML ..) or do I need to make my own?

[1:19:35](#THBHaNVNxUBuffk2Usnj8N1yjmg5sf91Y1aECSTcjeU) <gltewalt (Greg T)>:
json

[1:39:37](#m85-h90lawMSV5_tMu8Ad7EWAo5kh7B8iIsLjPUJOLE) <TUA_Platy_twitter (T UA)>:
thanks

[2:02:09](#BcPjyAry0ft9AqdSGgrSN0CJcKLROVkjcVh8qUu436o) <TUA_Platy_twitter (T UA)>:

site: https://www.acme.com

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

1. remove all URLs from the links block that are external to the site domain, i.e. the toplist.sk URL
2. remove all URLs from the links block that reference an exclude criterion
3. Thus, when done, the block should only contain 2 URLs

I suppose I'd be using parse here? All the examples/tutorial I have seen so far, operate on blocks of strings (or on strings with whitespace).
Can someone give this newbie some pointers?

Thanks in advance!

[2:06:53](#0dQ4vI-avC_b_syCwbh2sEa2pmPxwj71RWOzZCojfOY) <gltewalt (The other Greg)>:
url is a datatype 

[2:07:28](#DH_gK3PfP5-UiY9ty1pNBzbg7GUB2Tu4BHIrNf92i5g) <gltewalt (The other Greg)>:
Block of url!

[2:44:18](#NPaToNhLytJ8uQ93iECuPA71Nh8eVyPy-_sLWv22FFg) <gltewalt (Greg T)>:
Several ways to solve that. You can play with parse if you want, but you can solve it with no parse.

[3:06:37](#Wan8V55l-F1YlOuJ2FkWQXEEKsiJHx3bvADjVfLVBlU) <laturk (laturk)>:
Thanks Greg Irwin and gltwalt. It compiles now.

[3:22:16](#wx0rOTdmUTYQC1ddtIAJqWELEcI8SrBFWpweNgbtIQ4) <gltewalt (Greg T)>:
`remove-each l links [any [find l '.sk find l '.jpg find l '.png find l '.gif]]`


[3:23:01](#W-XSRasixAo5cKkebCL-v9Jfi-d0quVqI5jSHbYHHDc) <gltewalt (Greg T)>:
* ```
remove-each l links [any [find l '.sk find l '.jpg find l '.png find l '.gif]]
```


[3:29:35](#s5T8y7iJo_6wACtodEhaQ5HmwCo8h6y1osLaQCcFnaY) <gltewalt (Greg T)>:
Some things to looks at:
`help remove-each`, `help find`, `help url`, `help any`, `help series!`, `help "series"



[3:29:45](#piLZFh3FPxe6XzuymOcVG13182HUxS6B8AKa9XJnBu0) <gltewalt (Greg T)>:
* Some things to looks at:
`help remove-each`, `help find`, `help url`, `help any`, `help series!`, `help "series"`



[3:31:13](#-UT2pIoLtbYFDpirR9UcsKiisje-FbOy5sMD6Pi61BA) <gltewalt (Greg T)>:
And

https://www.red-lang.org/2013/11/041-introducing-parse.html

Or

https://github.com/red/docs/blob/master/en/parse.adoc

[3:31:33](#V0IQZPGYu0CtZg3BqO-JG6xyv_rw87CnZYQxFYhg3qM) <ne1uno (ne1uno)>:
`split-path`

[3:31:36](#P_I63M_l5JnhP9F4Ok6OXBnVMXFJKk8d-j6avTYftuo) <gltewalt (Greg T)>:
* Some things to looks at.
Type in the console:
`help remove-each`, `help find`, `help url`, `help any`, `help series!`, `help "series"`



[3:32:02](#ZRBq0WFl-euSTZwwT0ep6hYSoMCumqz9Rr6cltXToqk) <gltewalt (Greg T)>:
`suffix?`

[3:32:35](#Z24pDSoQryoWFHXNwnV-vBOaT7lFVOn52AMQ-q-g5cM) <gltewalt (Greg T)>:
`decode-url`

[3:32:38](#9nY9Ccy3jUcB9SvQJG1PERBReY_McD-geR3WtLtEtz4) <ne1uno (ne1uno)>:
tld acme

[3:33:33](#tjmwFkwCWGAdyU6t2Mv6y1n6O0jWhfIfUjAPDR_wJMA) <ne1uno (ne1uno)>:
+suffix?

[3:36:26](#Mmogpt5QEmZo6gpe-JfggOUQDTnSaZ-wXwyMf7n_5xk) <gltewalt (Greg T)>:
another (maybe strange) way:
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

[3:41:42](#l-Q3dMraJsd-zghwiyaO_FRV9Sf3J8A3tGYb1hup7LQ) <gltewalt (The other Greg)>:
If you want to try with parse, there's a red/parse room

[3:43:22](#NQKfX3VWIsjgEb_nieVp01TKITbKeP8E3NdWv0TZAmQ) <gltewalt (The other Greg)>:
I'm no good at parse 

[3:54:05](#aMPfEw-Ut7FR1d8E6F4EpTEnwQhlF_oDZA6wn0L92Q8) <gltewalt (Greg T)>:
Or "acme.com" <> u/host

[3:54:54](#0B_cdAn4AcqMNOh70aqMrxPxpPXlhzQlBQUxKWfrp3U) <ne1uno (ne1uno)>:
that's the one

[4:00:51](#zzZaJy_8SJ3cbJ77Wa94f2Cx7vEzOlTmd2gcEEDdXSU) <ne1uno (ne1uno)>:
not quite, don't exclude no suffix ¬†https://www.acme.com/c

[4:05:21](#ghpXhZHRg4uMPaekzqg6tvaoIhshsa5Xjn5optQhwQM) <ne1uno (ne1uno)>:
`none?   u/target `

[4:12:42](#ZoVjABaWBJkCrVf9d21AOXMZA7p3c8a_bOTJHLCfaNo) <ne1uno (ne1uno)>:
maybe add `all [u/host  <> "www.acme.com"  none?  <> u/target]`  at this point, I would setup some tests to cover the exclusions

[4:52:53](#VUbjfw5BEMcjJnUIh6RcaQCfASSZD0tXXP4f8wHPEu8) <gltewalt (The other Greg)>:
Yeah, flipping the logic

[5:06:06](#AUU5cQYUOmMNFZsriOCqVInRc3Y3eCKYhzSkgGx3mb8) <TUA_Platy_twitter (T UA)>:
thanks all - that'll get me going again - much appreciated!

[18:43:09](#4xPL6ucGLUuAAvli8AFbBwg8PCDSt19cd-IpZKfiwvI) <greggirwin (Gregg Irwin)>:
@TUA_Platy_twitter there are some R2 INI parsers [here](http://www.rebol.org/search.r?find=ini&form=yes), which could be ported. I just changed a couple lines in my old R2 version and it seems to work in Red. If you'd do some more testing (or anyone else, for that matter), we could add it to red/code or red/community. Improvements welcome, too, of course.

[18:43:20](#3dYMIQKMnF1ZseocDraE101OxSJL2TaBLONaruU30zY) <greggirwin (Gregg Irwin)>:
[ini-file.red](https://files.gitter.im/570387cd187bb6f0eaddec47/AA8Q/ini-file.red)

[18:43:27](#Ruw-v5um8FRy0mq02d2yUel6qwyqpzPVrq6Q1mtp6dQ) <greggirwin (Gregg Irwin)>:
[test-ini-file.red](https://files.gitter.im/570387cd187bb6f0eaddec47/NgVD/test-ini-file.red)

[18:44:49](#C8wfjouAxur_j3R0c8zqrFPU_D5tmqiNpm2jTwP_ToI) <greggirwin (Gregg Irwin)>:
For XAML, our XML codec is very close to ready. Might make it by the end of this month. 

[18:46:24](#OP6W8HysjUFT9LCb99vSu7_yTgnOL-TiYlwvc1cMR54) <greggirwin (Gregg Irwin)>:
I don't know if it's worth making INI a codec, but it would be easy enough. Everyone please share your thoughts on that. Then you'd have `load/as <file> 'ini` and `save/as <file> 'ini` available directly. It is a widely used format.

[18:56:51](#mw4pCuiLRjL7m-H4Xn3dowxStExR7XeCTHKa_j250Ko) <greggirwin (Gregg Irwin)>:
For TOML, we include a grammar for it with [DiaGrammar](https://www.redlake-tech.com/products/diagrammar-for-windows/) (which you can use for free). You can see by the large number of test files that it works quite well. That said, it's just the parser. There are no data collection aspects included to build an output structure. That would be a great project IMO, and whoever wants to do it will get plenty of help. We also have other codecs to model it on.

[19:01:39](#smT6P_s3F-7UQKgcIFR8SVjGdCsZG1bo0OwTwJ-rgcY) <greggirwin (Gregg Irwin)>:
You can see that %toml.rule (in DiaGrammar) was ported directly from [TOML's ABNF spec](https://github.com/toml-lang/toml/blob/master/toml.abnf). No attempt was made to make it more idiomatically Red in any way.

[19:03:14](#cOBZaV0qeSxWDVEpjLCxT8GsR-f94B62XkxrmHrU3k8) <greggirwin (Gregg Irwin)>:
Here's the rendered diagram for it, for anyone who's curious.

[19:03:23](#TG76j022v_R-9dyWGRGBQGpahbR_IV_mxah08oTbrfo) <greggirwin (Gregg Irwin)>:
[![toml.png](https://files.gitter.im/570387cd187bb6f0eaddec47/JHvB/thumb/toml.png)](https://files.gitter.im/570387cd187bb6f0eaddec47/JHvB/toml.png)

[19:16:31](#MRXabFkBj7X4WhaQ6a22WwsQTuoOq2KNdSvfvUi45WE) <greggirwin (Gregg Irwin)>:
@TUA_Platy_twitter on your coding problem:
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

[19:18:06](#UouMrTrOb20gXCWjfX8AtXUdefUqZ4pqga7R7RkTpec) <greggirwin (Gregg Irwin)>:
Note the change to use `file!` values for the exclusions, so it works directly with `suffix?`. Other ways around it, but this makes the data do the talking.

[19:31:44](#0Ehsrf-Ft8Hc9tRigAeAn8y7El7LJJiL9vbXDtgllqY) <greggirwin (Gregg Irwin)>:
So that boils down to
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


[19:35:53](#c1fMyE17EV1o9JZnxbzhwBdpkF11zpJZKksfgOGf0O0) <hiiamboris (NOT THIS ONE)>:
> INI

Is there a formal definition of it though, or like CSV?

[19:36:26](#4QnZjSSfq9jjDCLPpJvTzZy5EqzfMvLGWLstgaz6dh8) <greggirwin (Gregg Irwin)>:
Like CSV.

[19:37:05](#Vios_w_AiH1oTyZGvpU7F7dgOOmLWVGo7yYzcHb4sXk) <hiiamboris (NOT THIS ONE)>:
I think git and probably a lot of other linux-originating tools use if not the same then at least suspiciously similar format, i.e. `[section]^/name = value`

[19:37:17](#A6LQZHPoiF_hPKt-ZfFnIglnz-VB4Wti9rHlqJykRj8) <hiiamboris (NOT THIS ONE)>:
Also `.reg` files.

[19:37:56](#J2V5ToLxUiDyOUBZ1E1SlyR4BHuKlMUafh3dUkVIDl0) <hiiamboris (NOT THIS ONE)>:
It certainly will help those working with configs and registry to be able to read them as Red data.

[19:38:07](#XAXr33HY0F1ifnRwge0ls6iVUUtEfDTEWnUajQhJFbA) <hiiamboris (NOT THIS ONE)>:
* It certainly will help those working with configs and registry to be able to load them as Red data.

[19:38:44](#Aqjo-ULSY6a0UVjdAW-UBzZ8actxNNu2zkXuL5w2SpE) <greggirwin (Gregg Irwin)>:
Yes, that's noted in https://en.wikipedia.org/wiki/INI_file

[19:39:29](#mx6g_1rEK_Df7iBYbHr7Vc9MUBsFYrXbCsTVzcPm3dc) <greggirwin (Gregg Irwin)>:
Maybe worth being a codec then, if the most common variants don't bloat it too much.

[19:41:11](#36uZ6zXY8ORuEZFs8Vit3GlN7UIRcfCqWUVRZk21E3s) <greggirwin (Gregg Irwin)>:
Mine parses at least a simple git config file successfully.

[19:43:35](#MRx3rUqkicwn98tnhm5JTk5fU86Oy1KgovvGwg7IeGo) <greggirwin (Gregg Irwin)>:
%.reg files are different. Not compatible.

[19:45:13](#HxCvKZRCyowPyXJh5uKXVgywqxm-mzIgZMnz2bJFgrE) <hiiamboris (NOT THIS ONE)>:
Because of what?

[19:45:42](#sW6J2ms9M__9mUqypP7fCyKtpjLglVJtQHoHQH-62m0) <hiiamboris (NOT THIS ONE)>:
Double quotes?

[19:46:11](#V_7OyuSuDou2XWjPqQpVtZaCNUWfkP6Z95GdvyIWZN4) <hiiamboris (NOT THIS ONE)>:
Header?

[19:47:15](#D5KC5Zv_9lA73fzMrW5Sj1DMsRGOb0GSr4Kb7Rlp-Wg) <greggirwin (Gregg Irwin)>:
- Initial value outside sections (could be allowed of course)

- Quoted keys

- Line continuations

At a glance anyway. Hardly showstoppers. Just doesn't work in mine right now. :^)

[19:47:28](#4lr8kMqMjf432tZOaB5CIqf5jl58OAeMtSLrcTcSuM4) <hiiamboris (NOT THIS ONE)>:
I see Ì†ΩÌ∏â

[19:48:40](#I4d69h_jlPK4HydDL3THjHa6gpZCLbK318DESNYakPg) <greggirwin (Gregg Irwin)>:
I spent 0:0:30 porting mine, so you get what you pay for. :^)

[19:48:50](#_5hAe-MdUhP9SNS9vu-xdauXv4RvUFuE0MvLRLJBDrM) <hiiamboris (NOT THIS ONE)>:
lol

[19:49:19](#7MEgxOvpWasTou2Fyo9t2WCnCdc1vClrnwvOGTmkOww) <greggirwin (Gregg Irwin)>:
Really, changed REBOL to Red and removed `/all` from `parse`.

[19:49:36](#ygbZv5otuULaDru5THb6NIXWz6xGxjY2Uqwe-v_X4FE) <hiiamboris (NOT THIS ONE)>:
so I thought 

[19:58:43](#ehwHEFRfgBLXCUqMqbK_-09jL2HQXkDwac0v-ORc6uw) <hiiamboris (NOT THIS ONE)>:
this codec then will have to adapt it's input/output rules from the extension (or /as argument)

[20:11:14](#ddmx8hhsmsZNYXIqiSzD7txi0BR_PbZ8DE-YxUMCAgE) <greggirwin (Gregg Irwin)>:
Right. An underlying parser could share most rules, with the codec registered for each one separately by extension.

[22:21:53](#ELOMyT7LHzyV6JGS3Z2kt7dDFnsKuqNZJcbEFWqf4H8) <greggirwin (Gregg Irwin)>:
On TOML, I vote that it *not* be included as a standard codec. It's not common enough. Once we have a working version, though, what we *should* do is note it in [the wiki](https://github.com/red/red/wiki/%5BHOWTO%5D-SYSTEM-CODECS,-LOAD-AS-and-SAVE-AS).

[22:38:27](#RmUDSzztis1OCuCCQDN5nq0gZ2gDfFRU-8Gy8db5PJc) <hiiamboris (NOT THIS ONE)>:
can't it be just a variant of ini?

[22:49:22](#diquqK_LjWz3LNi_IWli8fFbPm5n1jXFZtuuGuHjaNQ) <gurzgri>:
can't it be just a variant of ini?

## 23-Jan-2022

[19:30:36](#KAwgKt1YeXofY-22EhHeEzaCYZ5nROP8C1Yk41fph-Y) <greggirwin (Gregg Irwin)>:
TOML is much more complex, and has a hard spec.

[19:49:59](#-lNaCbvVutgocMVHDtxMH9G8Dwb3XM65Gph9sLWipTo) <greggirwin (Gregg Irwin)>:
The main thing, though, is that I just don't think the value is there. Not enough to be standard.

[19:56:05](#6FW9HJOXIQvSAhX9EHdVtr705JjSGBKrOenoDL8bpbY) <hiiamboris (NOT THIS ONE)>:
maybe... idk how widespread .toml files are, never seen one myself

[20:03:19](#WmeM7dTIKq0KTqhDeFIF7I_b4ecXKDU4MHPHYaA4eGA) <gltewalt (The other Greg)>:
Hugo has it as an option,, along with yaml and json. 

[20:03:57](#Gkcown1YQCfCFr59s74O5Lr40pjwURBiKIIjaOv2YaU) <gltewalt (The other Greg)>:
https://gohugo.io/hugo-modules/configuration/

[20:58:24](#RkAdPnvoqCt6Ptjcq30tHoDc7aEMJE3tOnUdBSAcAq8) <greggirwin (Gregg Irwin)>:
Compare its use to JSON, CSV, XML, and INI. It's not even on the radar. I'm all for having one people can plug in, because some dev tools use it. But even YAML is far ahead of it, and I don't think YAML should be standard in Red either. Easy to plug in, yes; standard, no. 

## 24-Jan-2022

[9:03:31](#ya2MggJyQLORuVjJMey-Of7vj_4b30bHHxiWThozQfE) <rebolek (Boleslav B≈ôezovsk√Ω)>:
YAM specs are really complicated. (amlost-)JSON is part of the specs too.

[19:46:22](#t__FxnQSSwdvAy6Gmo84uGGQyQZlJzQqyeant-N2Ob4) <greggirwin (Gregg Irwin)>:
YAML is a beast. When I've had to deal with it as a user, I quite often mess things up due to case or tabs. Did we learn nothing from `make`?

## 25-Jan-2022

[0:46:41](#hS50Y5brh2skFVWoE17ToFSUrswFreoqMWVJQSyMPEw) <greggirwin (Gregg Irwin)>:
[parse-YAML.r](https://files.gitter.im/570387cd187bb6f0eaddec47/lbP3/parse-YAML.r)

[0:46:53](#81Zs9DZlNR2j80KQIW_CVev4Mo7BOSTEkyeSfClZqJg) <greggirwin (Gregg Irwin)>:
Should anyone feel masochistic.

## 26-Jan-2022

[7:27:41](#7LdeAaSqJixQ_g2h1e-cLXB_TiCNTnQQGLefIm4II3g) <ams02468 (ams02468)>:
Hello, does anyone have a link to simple red/system examples? 

[7:28:58](#58khGUm5QizM7iQWUoTNgpkKPTHiBPc_ElcS15RcNWw) <greggirwin (Gregg Irwin)>:
Have you checked out the red/code and red/community repos?

[8:02:35](#kGPFJy1Gkhr0gMMZBWHxhH9M1o2Zl6TGXEasvUL7A7c) <ams02468 (ams02468)>:
Have you checked out the red/code and red/community repos?

## 28-Jan-2022

[21:40:52](#sPYxNODiWmm1UiWfX9HE-_-PYCbcXLSuSFZQEUiMMLs) <gltewalt (Greg T)>:
Francois made a pdf.
https://github.com/ldci/Red-System/tree/main/doc

[21:43:38](#4kNCSt1ZhvR_ESARcm_EH7WgfKcGf-CfIwligNxMEsw) <Respectech (Respectech)>:
Nice!

## 29-Jan-2022

[1:22:27](#EHJwIOwalke_U6yaezf3nfpWNGLdMnSMuQBiWCTJvyI) <ams02468 (ams02468)>:
First of all, thanks for the pdf file, it was very good

Now I have a question, how can I display this binary in the same way in a string? 
for examp convert this #{616D73} to this "616D73"


[1:25:06](#3HIn3HyKXVoRzS6XHu3jsE8Ted4KjcuvBIbBPfEbpss) <gltewalt (The other Greg)>:
form

[1:27:55](#6p3x7TP3M7ISK58R4L8IxO2wBGJULWkmGmdIeQiZh30) <gltewalt (The other Greg)>:
Or to-string

[1:37:51](#jXskp8Kmf0NmlJBhjG2pLm2-NTvakWo_pAmd-nieG0k) <gltewalt (Greg T)>:
Well, that wont quite do it

[1:38:51](#fPTVyC_FMreyHZb40-Y72I14JzIz3kEdlv-eSjuBcVE) <ne1uno (ne1uno)>:
`enbase/base  #{616D73} 16`

[1:41:28](#UCWey7LXb8x9ic9_rZ4uk6y9Ap9UMkB9rwVku818Zi0) <ne1uno (ne1uno)>:
same way, form works

[1:42:25](#tIDqccqqcm5e96WAmJjQhcNsA5JeBFxMnh_iZTlQEmo) <gltewalt (Greg T)>:
No he wants "616D73"

[1:51:30](#jzPXp355V70xWAZv5oMQ9NLemdLs2LVtz4wUmB5Yecc) <gltewalt (Greg T)>:
```
stringify-binary: function [b [binary!]][
    trim/with form b "#{}"
]
```


[1:52:17](#L6iFK27Fj3hruyKh0dAptxHStJ46gPdhiVKwx7hCSV0) <gltewalt (Greg T)>:
`trim/with form  #{616D73} "#{}"`

[2:03:14](#U1iuLTxhKIz2_aGPVUmIDHKimZ6BglotGVelCH0nnaE) <ams02468 (ams02468)>:
thanks @gltewalt  & @ne1uno 

[2:08:06](#BXuqnHkcuh3T9mlZTCCMRUj43zeN69qtT0IQFXElfRM) <ams02468 (ams02468)>:
* thanks @gltewalt  & @ne1uno   @gltewalt

[3:01:57](#xK-F31rcQCsOsArrsdk_xmL2lzsm7_7-567ra-F4_S0) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
`third split form #{616D73} charset "#{}"`

[3:37:43](#nDHpB5EWJGh_3EDJj_sKJ1kOZHvleaE4CRNgwm-_BVw) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
```
parse form bin [2 skip copy result to #"}" to end]
parse form bin [collect [2 skip keep to #"}" to end]]
remove-each char result: form bin [find [#"#" #"{" #"}"] char]
```


[3:44:28](#HWJUW4IqT2miSlk3X4cU-sPMVOEFK-uo6WPj8Cjn1L0) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
`copy/part at s: form bin 3 (length? s) - 3`

[3:54:43](#dnGl4GnkbkFoR7VjQFpTLdBd0noPhG-FilHrca3o4PA) <ne1uno (ne1uno)>:
`to-string to-hex to-integer #{616D73}`

[3:56:47](#4EWBFzDD_8qAamy0oMNBx4DwD3Bh2SKxM3xWN-8xZbs) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
it is padded with leading zeroes though, but nice aproach :-)

[4:15:18](#cM_wgQ66K4uXMmzGFcMys7TbJq5F8UfnzFzKvIxnubY) <ne1uno (ne1uno)>:
`to string! {616D73} `  woops

[4:17:12](#NYuz6_7g_YZCSiUV-yzViVauT40ydBLf7sb9VQ7Me_A) <ne1uno (ne1uno)>:
forgot #, false alarm.  not sure what to-string is doing either

[4:27:00](#rKWkTj8KrVNZZLZyY3GbaGmWvfHryT7H0j0NAw8BR9c) <gltewalt (Greg T)>:
`enbase/base to-string #{616D73} 16`

[4:28:54](#fofPQcnl42sZVjfCr5hjKNivxk0Cex1dwproF2VR29s) <gltewalt (Greg T)>:
trim/with is probably the best to be had

[4:35:44](#XW0l0kFGGVuPcWHY3p3JuCgZGfmqbVyYRUd_qYIU7zU) <ne1uno (ne1uno)>:
enbase is very picky about what it thinks is valid input

[8:21:54](#JLER1PQrSfogLs4pJdcKoIVJBsAyhRb0U5gdsh4FcqA) <ne1uno (ne1uno)>:
`to-string take/part at form #{616D73} 3 6`

[8:22:44](#aSDjblGpLDWSLCcz2qD7DxzD9HUS6s3_Icu9KcCqukw) <ne1uno (ne1uno)>:
`take/part at form #{616D73} 3 6`

[8:30:44](#OYx4VHBRpbzwQecCs51icWqe_mN7TkDFJf6rsBl6w_c) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Yes, but 6 is hardcoded there, no? You can have variable length binary. To which I provided solution above, using a `lenght?`function.

[8:46:16](#wSUVABM5LwSKxHkhw02hg9X8oqX7Jeyj6URyP8Py0FE) <ne1uno (ne1uno)>:
I conveniently forgot your copy/part above... profiling now, pretty close

[8:59:46](#EjHStTuIZ_SMszYZ3IpKWO3nU2yU8hAH-2pkYjQYoDo) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
This issue is so often coming back, that Red should do something with it... https://github.com/red/red/issues/3133

[9:00:27](#RiIU-r2Ct9QK5O9JWLDKF4lPTI0rCHT51LFxxCmBfWc) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
In Rebol I already have:
```rebol
>> mold #{3132}
== "#{3132}"

>> form #{3132}
== "3132"

>> to string! #{3132}
== "12"
```

[9:05:34](#pbxzgZYL77FdWPblb1iU1FA0EVepS1w1ry-ISXlA5A8) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
It is said, that there was even implementation done, but banned by Nenad Ì†ΩÌ∏ï https://github.com/red/red/pull/4148 

[9:08:42](#yqjBQ1gqdslub_OSvwzkiwRy2vYMKLrNP5HkgS0C1wU) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* This issue is so often coming back, that Red should do something with it... https://github.com/red/red/issues/3133 https://github.com/red/REP/issues/62

[9:10:12](#0JEPbj2I3uplixwNxcJXKBoS3ZD6Ns-_8JGm2MrUBzA) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* It is sad, that there was even implementation done, but banned by Nenad :/ https://github.com/red/red/pull/4148 

[9:21:27](#xN0rMT2Z6nwNYhTXT88N6Vxts2GZle0crj52mui1ajo) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Yes, I miss an easy way too. Dunno, why I needed that string from in the past, but it kind of made me crazy, had to create a wrapper function for that. That deserves an easy solution. I even imagined the name `as-string`, which would just do that.

[10:02:05](#41T6uMQox8_X3Il-IR_GdELOxDhtjtb5Y4epAJcU5ug) <ne1uno (ne1uno)>:
rough profile, just for reference.  won't matter unless in a tight loop, or something. 

[10:02:05](#JThwQQUMJpeFneHL-kn_xFnalFna_ohZ0Uv6kDWqwvc) <ne1uno (ne1uno)>:
https://gist.github.com/ne1uno/b73a2d7a180ba2fdf081abe8567f0e03   

[12:19:09](#MOb302LhmynhXXeTq3rjdXF8POtNYP4n_7mA17Ls5b4) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Btw... I did profiling in my Rebol3 and `enbase` is still the winner.
```rebol
>> profile/show [[form bin][enbase bin 16]]
Time                 | Code
1.0x (126ns)         | [enbase bin 16]
1.35x (170ns)        | [form bin]
```

[12:24:33](#Kcx8p7HdAHkmXW3KLgVrQ3aL2iO5xhme4bT7XZA9_p0) <hiiamboris (NOT THIS ONE)>:
```
>> recycle/off prof/each/times [enbase/base #{616D73} 16 form #{616D73}] 99999
<99999> 53%      .00094ms          76 B [enbase/base #{616D73} 16]
<99999> 47%      .00083ms          44 B [form #{616D73}]
```

[12:55:20](#S2bztlBF6MiZ5Ce7mpcAT2wRDum_sU-PGfOjxjojgu4) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Nice

[12:56:48](#UPrOxpKK9qqXwEOIsd3dZCtibGUcB4k2IDWgxOzCw8w) <ne1uno (ne1uno)>:
thanks @Oldes, updated gist w/gc off. I noticed running multiple times aren't exactly the same.  probably need to reboot and turn everything off then run high priority as well as gc off.

[18:28:52](#OtWOkcaxIZst8dvRdMRfE0mEtYcJqbDZY5nH7wW87S4) <gltewalt (The other Greg)>:
Oldes (Oldes Huhuman): the REBOL results on binary are what I expected 

[18:53:51](#jaweIF1p49CipGcsbuwGJlEv756tPwh4sSvnMq-V5Eg) <greggirwin (Gregg Irwin)>:
To be clear, @dockimbel said that PR was *premature*. Lots of good comments in the tickets. It seems reasonable, but does have some open questions.

Since there are a number of easy ways to do it at the mezz level, and performance is not likely an issue if we're talking about display, this doesn't seem like a pressing issue. Remember, this is a lossy operation we're talking about, so it's not useful for data interchange, where performance might matter.

[19:01:14](#asV5I_zwXP85vQ-XNtmLzm5G6U4b2N3PlDSJabi7sJE) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
I think that there is equality that with more closed pull request with reason like _prematurity_, the higher chance there is, that the person will not try any pull request anymore.

[19:02:09](#lNvRRWHCHRHJ6tyKgjjTc_8eckypXhRVj9RyCi8kt2U) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
And if there is question, which repeat so often like this one, it deserves some response.

[19:02:17](#9monBVszMy0w88PSklVMgPtbbGFrR5H-ym6RQwpOTss) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* And if there is a question, which repeat so often like this one, it deserves some response.

[19:02:23](#K2zyDsfYiFMmy0Y7krv1BIgQXEKcB3liACXVSnRmEkU) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* And if there is a question, which repeats so often like this one, it deserves some response.

[19:07:57](#ruH_4hY_NseWFBHXgZJ1D0THgHD4UzDNmlA9jOzCbUU) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
And I must repeat, that I consider just one proper way to do it now in Red.. the solutions which does not use `enbase` should not be counted.

[19:29:53](#Ub9tNt_Lma2MADqQO_4cMgNgoNIANgcvKHwZX6BC7KI) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
@greggirwin what are the open questions? I think that if there is `mold` and `form` producing same result and people are repeatedly get own solution to have `form` output, than there is no question to me. 

[19:30:09](#TuCTPbPWnfGjOnqoUDopVeXMB_D7zH1zR4y9fMe7MJU) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* @greggirwin what are the open questions? I think that if there is `mold` and `form` producing same result and people are repeatedly trying to get own solution to have `form` output, than there is no question to me. 

[20:09:27](#JJE5_JLbKQJaeBDbX33aEAG6QtqB3EMCBefzrZDFJXY) <greggirwin (Gregg Irwin)>:
> I think that there is equality that with more closed pull request with reason like _prematurity_, the higher chance there is, that the person will not try any pull request anymore.

Agreed, 100%. This is something that makes open source work, or teamwork of any kind, challenging. It's like the old humorous saying "Be open minded, but not so open minded that your brains fall out." Deciding what to accept and what to reject is not a simple binary question.

Let's find the best place, wiki page or red-by-example, for FAQs like this, and make sure `enbase` is the answer there.

Open questions are things like what @meijeru notes in #3133 and newline issues. Next up would be this one:
```
>> system/options/binary-base: 64
== 64
>> form #{616D73}
== "64#{YW1z}"
```
Red doesn't work like R2 (above) *yet*, but should it? If so, does `64#{YW1z}` become `YW1z` when formed? Now we have global state involved, as we discussed with codec options, where PitL becomes *much* more treacherous. Some lib changes `system/options/binary-base` and suddenly `form` produces different results behind your back.

> I think that if there is mold and form producing same result and people are repeatedly trying to get own solution to have form output, than there is no question to me.

I'd like to see *why* people want this form. What are the use cases? Do we know that?

[20:20:43](#lvAIS2ySiFEBNkQevcQVc9UQRqvpcqE_wXZPkyLLiMg) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
```rebol
>> system/options/binary-base: 64 print ["MD5 is" res: checksum data 'md5 "(" mold res ")"]
MD5 is D41D8CD98F00B204E9800998ECF8427E ( 64#{1B2M2Y8AsgTpgAmY7PhCfg==} )
```

[20:21:45](#JQl23FCNtVqvD1hxvBe6_IZ7t-OTP1-7F5V-cZpSHj8) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
I thought that this question was resolved... base64 is not for humans.

[20:23:19](#hPWBIH6xigBSBMawRLTfSe3gQBrE3SpBfefPbdoqRBA) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
And I made result on one line only. As it is not practical to have it multiline.

[20:26:43](#Lop4DvVfqQZ8QgXqQaA-e3WhU-C9nRyM6w3K0L0Airo) <greggirwin (Gregg Irwin)>:
> base64 is not for humans.

Neither is base-16. :^)

Agreed on base-64. It's a workaround for binary transmission. 

[20:43:02](#QJb3HMZmeN_8jQAxFGxi0ir9ySerkmuY3RYhX5AlllU) <gltewalt (Greg T)>:
What I expected, as a reader, was for `form` to present  #{616D73} as 616D73, like rebol.
However...  "#{}" are valid characters in a string. Without `form` doing any extra work, the Red result is technically correct, right?
Maybe it should be the concern of the conceptual "presentation layer". `format`, `print`, etc

[20:44:24](#LpPlzux_tJBeQ7uIOEWshATHkpHE_pkyZj2fsXobVd4) <gltewalt (Greg T)>:
Since what he wanted was a typical string representation, and wasn't concerned with tranforming the type

[20:44:35](#kFw5lxA_u_Ks2EKVypAHp9aV4pNtlUz99BUHgLjVJ8M) <gltewalt (Greg T)>:
* Since what he wanted was a typical string representation, and wasn't concerned with transforming the type

[23:18:37](#uFMTh2ZNz3BowJF11yqwIuKYddHQPJPolZ7HEm_9Ku4) <greggirwin (Gregg Irwin)>:
R2:
```
>> form #{616D73}
== "#{616D73}"
```
R3:
```
>> form #{616D73}
== "#{616D73}"
```

Formed values are determined on a type by type basis, as to what is best. We *could* make hard and fast rules, but that would produce more technically consistent, but perhaps less useful results. When `form` says "user-friendly string representation" it's a softer, more flexible rule than `mold`.


[23:19:22](#BZ3LHk5jvlNhRQ7HfcH09V8qDcA40sjO0cFj_0c4h0k) <greggirwin (Gregg Irwin)>:
Here's the question I asked:

> I'd like to see why people want this form. What are the use cases? 

Start there. 

[23:24:43](#4eVlUe4Y-FwCXpJnSkYIkYMNMmuPic4wMczNsn_Tpo4) <gltewalt (The other Greg)>:
Oldes output 

```rebol
>> mold #{3132}
== "#{3132}"

>> form #{3132}
== "3132"

>> to string! #{3132}
== "12"
```

[23:26:19](#vdd8Rc-k7KmIaSt4qBltOO61V1VlGayFxo37OpuZuRA) <greggirwin (Gregg Irwin)>:
We all need to be clear, unfortunately, about which "rebol" does what. :^\ 

[23:28:36](#sPYbNWKZVPQYas0ZfasrCzqy31Me2XTpnMhbk0DTc7s) <gltewalt (The other Greg)>:
Use case is that a consumer doesn't care that about our particular lexical identifiers. That is, #{ } means nothing to them. They expect to see 616D73

[23:29:18](#31Npob8rSsBwazn5KbTXZcfA_clyVuOHis-qHm4uveY) <gltewalt (The other Greg)>:
Presenting data for outsiders 

[23:31:42](#-ZyLjoqOxacinWklsb2i_a4K4AuJPCzURfS9W3hsHws) <gltewalt (The other Greg)>:
As we know, we can make it so, with mezzanic incantations 

[23:34:28](#oHFIxckHRiQSqCFZJtoET1RJDljXvC2DjMAvDPGhPNg) <greggirwin (Gregg Irwin)>:
Let me clarify: Concrete use cases. Who has used this in an actual app? 

[23:38:21](#mFqLfvrhi7cndGe4vcysbW8o8Zm6Egjo22n5SXL-t8A) <gltewalt (The other Greg)>:
I haven't ran into it.. maybe ask ams02468 (ams02468)

[23:38:52](#AbWFO7mPNzv9CFf4LwcIEYWgaDe7f-axUJq56SS7fJA) <gltewalt (The other Greg)>:
I can see why it cones up periodically, though

[23:49:11](#gnX-5Qodft2JTLy--KQOA6fLsz27annIG5Fr5nAKI2g) <greggirwin (Gregg Irwin)>:
I found one place I used it , generating v4 UUIDs. `enbase/base` occurs in a lot of old R2 code, not always base 16. Without digging in, the use case that jumps out at me is emitting data, because other formats, like XML or JSON, may want values as hex strings, and the return value of `checksum` is a key partner there. But that's not really where `form` is best applied, since it's for data interchange. 

[23:51:13](#q0GcdX-okaegk6qvx1X6474E5Y9Zxg9p5svLNoWCy8M) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
@greggirwin I can find many examples in my years old code.. like [this](https://github.com/Oldes/rs/blob/d96d7ba96e9fd2a6ac998ed3be98212feb21df6e/projects-rswf/xfl/latest/dat-functions.r#L16) or [that](https://github.com/Oldes/rs/blob/d96d7ba96e9fd2a6ac998ed3be98212feb21df6e/projects-rswf/xfl/latest/rules_resize.r#L104)... and many more.

[23:53:13](#N9jfdpPyOTcFAOvzYNsHujYdc4Vl7VjlYEmvawCnflw) <ne1uno (ne1uno)>:
html hex colors, though names are nicer you still need RGB

[23:53:56](#bhyKfB0nNW6i08cEEcPgVf9kXpzp0nTSZEvqxg2U77M) <ne1uno (ne1uno)>:
can also be tuple, not specifically binary

[23:55:00](#z0KpCorjyjr3BVqQaPkRJV4sH8eSrb_Dn_rfWXb8xjw) <ne1uno (ne1uno)>:
why to-string #{..}renders aschII? is it utf8 also?

[23:55:44](#OA9dKB6XUR4ODQQUnZHZqpHt4caALWH80l-Bjhadl0I) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
[here](https://github.com/Oldes/rs/blob/d96d7ba96e9fd2a6ac998ed3be98212feb21df6e/projects-rswf/swf-parser/latest/parsers/swf-rescaling.r#L187) I would now use:
```
md5: form checksum skip inBuffer 2 'md5
```
instead of:
```
md5: enbase/base checksum/method skip inBuffer 2 'md5 16
```

[23:56:37](#fa2xvnR-Rc5Ebro7ZI2Q7D094jrR5tpVVBRdkbVOr0w) <ne1uno (ne1uno)>:
 seems like form could go either string or hex. need at least 2 forms

## 30-Jan-2022

[0:17:58](#duBqr6gy2t5d9SrLiIyHr30jySJwOHRb-obiR-9IyGg) <greggirwin (Gregg Irwin)>:
@Oldes, I think we're seeing the same patterns. 

@ne1uno where are hex colors used as `binary!` in Red? e.g. pixels in images are tuples.

My suggestion is to look at `to-hex` and see if it can be extended (I wish it were a mezz, for easier playing). It's used in the Red codebase is in the JSON emitter, for `\u` chars, but a dozen places or so in %.r support files in the core. It returns an issue, as R2 did, but bear in mind that they were a string type in R2 and a word type in Red. @ne1uno already noted that it's an alternative approach to `enbase`. 

`Format` will likely have hex output support, as a side note.

For now, I'd wrap `enbase`, though we have a number of places "hex" is used in a name, but for different purposes. `form-as-hex` could be a name to use as a playground.

[0:20:57](#khnsnnvHFexXFiCjueFVMCjDV6wmco84JvyPpDdI5Jg) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
I wonder why there must be so much words about it.. as I said.. if there is `mold` and `form` producing same result, why not to have `form` produce something different and reduce the required code? Never mind.. time to read some book and sleep Ì†ΩÌ∏â

[0:21:18](#OtfUsAH6F2h2-HtotuaaDSHMkW1adyqV2rUbiea-F1Q) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* I wonder why there must be so many words about it.. as I said.. if there is `mold` and `form` producing same result, why not to have `form` produce something different and reduce the required code? Never mind.. time to read some book and sleep ;-)

[0:24:27](#7nOJ_xiEbPn-Ca9YYj3ufTWzgKzKnfHS9EFsycI94d8) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
I introduced this change in my Rebol fork 2 years ago, and I was not hit with any side effect. I can just enjoy the result, because when I trace some binary values, I really don't have to see them decorated with `#{` and `}`.

[0:31:19](#GtLjaX9EjhYgVr00-yL76NJA7mU_zGvBsYcG9rTee7c) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
And as I review quickly some code.. I should remove many `mold` calls... bad habit from R2 days... because:
```rebol
Time               | Evals  | S.made | S.expa | Memory      | Code
1.0x (1Œºs)         | 2      | 2      | 0      | 80          | [append "" #{CAFE}]
1.5x (2Œºs)         | 3      | 2      | 0      | 80          | [append "" mold #{CAFE}]
```

[13:03:44](#EbRZAqbBwlngesCZO14AXzsOA5arcPUBeX7Pg860s6U) <olivier_lp_twitter (LP Olivier)>:
Hi, Ive discovered Red a few years ago, as  the rebol next generation. I came a a few time ago and trying to get compilation option

[13:08:56](#3u-LPlTUK_QY-ZOJauDQ8Aw0zbBqeE_wuwT2oTmJtkM) <olivier_lp_twitter (LP Olivier)>:
* Hi, Ive discovered Red a few years ago, as  the rebol next generation. I came a a few time ago and trying to get compilation option. I try to understand why sometimes the release mode has to be done because -c option fails. And the no-runtime option I really dont get it

[13:38:20](#VIAXhl3KViw0UwxIFszm6zlns92EiyJIq-yrpAE1k3g) <hiiamboris (NOT THIS ONE)>:
I can't say what `--no-runtime` is used for, maybe testing the compiler. Never used it.

[13:39:29](#73n_EJ4HEEawTPK_CCt_-ltU9AVQv7VXGdD8PBaQma8) <hiiamboris (NOT THIS ONE)>:
`-c` may fail for numerous reasons, depends on your code

[13:40:21](#naevLR1azDpmUz1b8us0grVTkZORT-cHqgQX5xOn3OE) <hiiamboris (NOT THIS ONE)>:
most importantly, when libRedRT lacks some runtime exports your script might use

[17:59:14](#h7uVLbL_jCbmmNfgLh15eqrr4YASRHvED6bbcOFv3Kk) <zentrog>:
‚Äîno-runtime is probably useful if you have only Red/System code and want the smallest possible executable size

[18:08:03](#BhCoq_BgGXnAuh9OwK25nkbfKB1GArgG9zTpyhdhhxI) <hiiamboris (NOT THIS ONE)>:
in that case you can just declare `Red/System` header

[19:07:03](#ThWCjw5zlrH-WUsKZtea7ALi4GovGqnYsJ_8Niv7VBs) <zentrog>:
Oh, that has the same effect?

[19:23:46](#3Qy3F7mUdVhoyLHGQNS1KoDxwiQfLY2a9Fu_AvdlXBM) <hiiamboris (NOT THIS ONE)>:
runtime is only included into `Red` scripts

## 31-Jan-2022

[8:09:26](#pTyNjLvmJCbX3i_0PdnulieCxA2OIonmH4boXX36Tbk) <zentrog>:
I seem to remember reading that there is a way to call Red functions from Red/System. So does that mean there is also a way to tell the compiler to include the runtime?

[8:15:05](#oZNk6V58P7ukQJbGdlsfwL_E9AIHukxICDDQ2qFqU6M) <ldci (Fran√ßois Jouen)>:
Yes; https://github.com/ldci/Red-System/tree/main/doc

[9:05:29](#_WHbe4a0J74Klsa10HMPBaySyUOc1yOGlz81N6OdlnU) <hiiamboris (NOT THIS ONE)>:
You just start with 'Red' and then go down to '#system'.

## 5-Feb-2022

[3:40:19](#7LGS0NKIRAmL2HDAO6ZVhhDJI7zbqP3Qu02AoVcBEig) <ams02468 (ams02468)>:
hi guys how can hide text in field?

[3:48:34](#HWYJqQllMhTinLa1A-Oaw4Gd4Nt4xt8594ENIcdH2V0) <ne1uno (ne1uno)>:
 password?

[3:48:43](#9RpRSKlOLHdeWZVpq98ObI_43G9ipN1wQP7E8zgglsw) <greggirwin (Gregg Irwin)>:
`password`, e.g. `view [field password]`

[3:53:13](#m0V176jwjy4LKe67yhR3do6FNIOHPIFqN76zQb__x70) <ams02468 (ams02468)>:
This is a good method, but is not it a way that does not even show the number of characters?

[3:54:42](#2P-YImit0c7RjraGUgJACj7CCtzP0HurrteGx6d2NGs) <ams02468 (ams02468)>:
Inside the cli, I matched the background color with the color of the words

[3:57:36](#UVMHhgcHLKSwGZ6biIJZe5fJz6Ig2LMcKMC6s53a_UM) <ne1uno (ne1uno)>:
select too?

[3:59:06](#Xx3_t7Kpy8aQlpW9vX7XAnEd6g0bFNVv0A63_S3hLcQ) <ne1uno (ne1uno)>:
`on-change []` could append chars and reset face/text: "******"

[4:11:23](#q3UcC4g_SfSf3olR6jTvthajiPGGbhQ59QHpzO5maFY) <ams02468 (ams02468)>:
@greggirwin  and @ne1uno  thanks

## 10-Feb-2022

[17:04:28](#PeG-6QxF06ZImLL-3rqFPKBIDpQVuYaU4b0GFzL3Biw) <ams02468 (ams02468)>:
Hello guys , how can find the pc resolution with red ? 

[17:06:43](#HbvyNDUvfoonlTtFEM6Y46YiGojK5aGuIB7ElB6m1Nw) <dsunanda (dsunanda)>:
eg:  system/view/screens/1/size

[18:29:56](#neqSmgQbMlPVHBpxG9uLH3pmklAToitU18tixVcL3uQ) <ams02468 (ams02468)>:
I tried this command before, but it did not give the correct specifications. My PC resolution is 1080, but it gave me 1536x864

[18:33:00](#JhTrZeNkebVZylPiYfQJL06L8x0-pcwOwWfB14MJitw) <hiiamboris (NOT THIS ONE)>:
` system/view/screens/1/size * system/view/metrics/dpi / 96`

[18:34:17](#GFx20oBOLNjHMEWlX-QEgJRvc6M59OmoycpoKbmflpg) <ams02468 (ams02468)>:
thanks @hiiamboris  @dsunanda 

[18:34:36](#LcwFHI26N2Z1DHDnAI8bes-egizgJsI4RpBV5im-wrc) <hiiamboris (NOT THIS ONE)>:
maybe even 
` system/view/screens/1/size * system/view/metrics/dpi / 96 and complement 3`

[18:34:58](#Uk5XP9FE16Bx4a-3yzuKB04a-Bt8GLo2u2OyqvM8n4o) <hiiamboris (NOT THIS ONE)>:
* maybe even 
` system/view/screens/1/size * system/view/metrics/dpi / 96 + 3 xor 3`

[18:35:13](#ur_ZLhetqblxlBPJHWbg14T4aos-ZMakfjVaX-QMXoc) <hiiamboris (NOT THIS ONE)>:
* maybe even 
` system/view/screens/1/size * system/view/metrics/dpi / 96 + 3 and complement 3`

[18:35:52](#DNA78KccCiyE3bcyBMLtjA4YG3-BnqQ6PQ950dLVABw) <hiiamboris (NOT THIS ONE)>:
but this needs testing on nonstandard resolutions / dpis

[18:37:50](#rJH7b0SpQliGTrsCTKnY_y81oPehYQ94WFKKQtAu9T8) <greggirwin (Gregg Irwin)>:
We need to make sure that's doc'd somewhere.

## 14-Feb-2022

[14:12:52](#2zDxn4Ipe0l4tlDaysQDFsBj1K1l5FFQUPuEkO26qho) <ams02468 (ams02468)>:
Hello, how can I write two correlation commands in one line, for example?
`create -dir% test
change -dir% test`
If they are separated, space is occupied, for example cmd
`md test && cd test`

[14:17:25](#VgX0-G4ePflFvPmuOZi_NbfEG4FAtbgDKbbX2Wsw5fQ) <ams02468 (ams02468)>:
* Hello, how can I write two correlation commands in one line, for example?
`create -dir % test
change -dir % test`
If they are separated, space is occupied, for example cmd
`md test && cd test`

[14:28:46](#kU5hRYUT53eGUrnG33z63IbtdoCDq0mXwdZSs2t5HrY) <hiiamboris (NOT THIS ONE)>:
what have you tried&

[14:34:21](#O4yleQoQuxYMAVY1xMYW7Hiee9SA0bcgmHdmFFNAUcc) <ams02468 (ams02468)>:
I want to fit two commands in one line

[14:36:11](#hoqOWsYGDT3HXaWqEXb34JU3EEK73kAX80conFZEOKI) <hiiamboris (NOT THIS ONE)>:
Red does not distinguish new line from space or tab.

[14:38:49](#tL68CM_JxXq6P3BjHoloRtltMyKEfJlOaNDmU9l_3Rk) <ams02468 (ams02468)>:
Red does not distinguish new line from space or tab.

[14:39:35](#CrtvIyqyuLX39aj6t2dlBPH7qpyvdRCUsjprcLrmPLI) <ams02468 (ams02468)>:
* This is part of my code, but it's very crowded, I want it to be a little more secluded

`create-dir %c&ctb`
`change-dir %c&ctb`
`write %CNC3.exe ""`
`create-dir %core`
`change-dir %core`
`create-dir %1.0`
`change-dir %1.0`
`write %Shaders.big ""`
`write %StaticStream.big ""`
`write %StaticStreamL.big ""`
`write %WBData.big ""`
`change-dir %../../`
`create-dir %RetailExe`
`change-dir %RetailExe`
`create-dir %1.0`
`change-dir %1.0`
`write %cnc3game.dat ""`
`change-dir %../../`

[14:44:16](#Dt6v5IJq5PlLx1fi6o3rNciPZcevUVeFSh4iSR-T3dM) <ams02468 (ams02468)>:
ok thx @hiiamboris 

## 17-Mar-2022

[15:00:18](#mYKqNr_GhR326aAgO6NVWaj06IWz3dR1aoSAv_gjYPA) <ams02468 (ams02468)>:
Hello, is there a way to run it without write the file? 
```
test: #include-binary %z.exe

write/binary %z.exe test

call %z.exe
 ```


[15:04:44](#8wN1SPyr_3fcMdSiVM3h346ajgICTaM9BxO5lxwqUmE) <hiiamboris (NOT THIS ONE)>:
no

[15:39:46](#g5fOhc8erUVphztm0Lm_yycXaEedOrpwtVIBShHvyXg) <ams02468 (ams02468)>:
Is there any example for how use the dll library like 7z in red?

[15:49:20](#hsAQ5no5dLfSwTg1lXGsjFILPAfLWDRU2DSAv9WS2R4) <hiiamboris (NOT THIS ONE)>:
both red/red and red/community repos are full of examples

[15:49:43](#3oG6pz3aX-RaDYSpy3W4b3tYTkhh_wrYxuOQerQaBTk) <hiiamboris (NOT THIS ONE)>:
https://github.com/ldci/redCV/blob/master/docs/RedCV_Manual.pdf maybe smth here too

[21:12:30](#fhM-Vp0iDKoCfNTHutzM5D9eOjBAkJjXnnrnLhyjdTo) <ldci (Fran√ßois Jouen)>:
@hiiamboris Thanks for the link to redCV:)

[21:19:05](#bxSaash72vTOMvl_h_8JBRC3Duu1kyYhydzq4UDQuOs) <hiiamboris (NOT THIS ONE)>:
I was looking for a link to your Red/System introduction, but haven't found it, so posted random one

[21:19:07](#LR_RdfD_C6gUwEDgcB_TClcDPPneWyKbK_gv7GPycDw) <hiiamboris (NOT THIS ONE)>:
:)

[21:32:25](#zyIUGxEkUaE0LIXMITIiQXm4Q1dR7kM_w1G0K6AN66Q) <ldci (Fran√ßois Jouen)>:
@hiiamboris . Here: https://github.com/ldci/Red-System

[21:37:24](#Q30T0CiZPiYnfMbWyBi-7YjI5pUGsnryJahbYk5WB1M) <hiiamboris (NOT THIS ONE)>:
I meant the PDF 

## 18-Mar-2022

[6:49:09](#T_7-i233n1xss4oJAiIkpxocO3V8l_NtXFyA78O1CWY) <ldci (Fran√ßois Jouen)>:
in doc directory

[17:34:37](#uunoSATFxdv8yl10uoN_0PkklfFw3GApzYwML1ENdvQ) <ams02468 (ams02468)>:
thx @ldci  @hiiamboris 

## 28-Mar-2022

[19:20:56](#H8x787t0KPWwcfJVMuwKBfvyOF165DbPjn57M13WG6g) <laturk (laturk)>:
I'm trying to take a script that converts 4K MP4 video from my Sony RX10 iii camera to a format editable by Davinci Resolve. For testing, I have the script print the string before it calls it. If i manually copy that string direct to the command line it works perfectly. But when the script calls it, it makes a video from just one frame. How call I correct this?  Here's the script:

[19:21:01](#ZCiiE077Oa8atYUpNvmjJ85inJqsosF69T1pI0L7Rjw) <laturk (laturk)>:
red []
f: request-file
str: to-string mold f
in-str: trim/with str "%"
out-str: copy in-str
replace out-str "MP4" "mov"
print out-str
ffm-str: rejoin ["ffmpeg -i " in-str " -c:v dnxhd -profile:v dnxhr_hq -pix_fmt yuv422p -c:a pcm_s16le -f mov " out-str]
print ffm-str
call/wait ffm-str
quit

[19:32:04](#q6bbMbwvOzAuw9dkIbwlgZ__nAYiaejm-I9MDocdUKk) <hiiamboris (NOT THIS ONE)>:
see if `print` outputs the correct string, minding the quotes

[19:58:45](#C5dUnW1mepd_ama7X0cnBss9EUAiYWo6BOaKtzzpH7c) <laturk (laturk)>:
hiiamboris, it does.

[20:01:49](#cWFVVt-famcJnmyiQO1S5sabWSgr1rPKLJpMlS6ttdo) <hiiamboris (NOT THIS ONE)>:
no idea

[20:15:16](#gj6vf7ihpKuoYpBsBWjS2lQyKlBKRjDBMB5g8HL__Ng) <greggirwin (Gregg Irwin)>:
@qtxie, any ideas? @laturk have you tried with `/shell` or `/show`? I know R2 had some issues in later releases if `/show` wasn't used. I haven't tried FFMPEG from Red though.

[20:37:25](#oUYY_LS7evvpjUxRjyw4X2Q22a_zW4JlNnUJi8Hh_dc) <hiiamboris (NOT THIS ONE)>:
it's possible that Red calls 32-bit version of ffmpeg, with 32-bit codecs, and those have some bugs resulting in this

[20:37:50](#B1P2SAgFoJBgfUnZuyEhoDohOyA2A0tKLjDfCeT2Tts) <hiiamboris (NOT THIS ONE)>:
if it's windows we're talking about

[20:38:28](#RWy6RHhHXi5mgHJon1Bgr6qG_5Xg_f863yF45RKulK4) <hiiamboris (NOT THIS ONE)>:
also ensure you're using latest, not stable, build

[22:01:26](#3WQaRRoePu3rUY5gzlxnZHS2AmTXMyukwZ4R6uuwFzU) <laturk (laturk)>:
Greg, using /shell or /show doesn't help.

[22:02:21](#ri3wGDGqIUVNJGhLCLPgx85V6_iglVwSGS_bP9NZ_FE) <greggirwin (Gregg Irwin)>:
OK, thanks for trying and reporting back. 

[22:03:00](#fpK-aikkDNyRBLgY4FeB1Yetm5DmdfGop5SKEk4c7bY) <laturk (laturk)>:
hihambrois, I think you are probably right that it is a codec problem.

[22:04:08](#6dbZ9GYo1cd6krf3xG09BeesfGazQocLoDa3RLbg284) <laturk (laturk)>:
I'm using archlinux, not windows. The build of red I'm using is about a week old.

[22:05:30](#loGvn0nKd18va18v9D7iALjFwgckDQrp317ETXg0SF4) <laturk (laturk)>:
Is there any way to make the resulting file overwrite the existing file?

[22:06:50](#owClUpgpAlC97y2PxbIKNW19CYqi_QpKW8454zpKSN4) <hiiamboris (NOT THIS ONE)>:
that's up to ffmpeg

[22:15:44](#DdnWBsRbGkHdmgZ9l5wbg1TVXg0gRW_alJH3PckhHFw) <laturk (laturk)>:
hiiamboris, yes, I just needed to add the -y option to ffmpeg. I should have realized that.

[22:18:04](#bwuF6Us0nRi2f3PVCjAR2VG8nypzylX3lSh3mqFZzwg) <laturk (laturk)>:
I don't understand how red can call the wrong codecs though. 

[22:20:51](#OHXpLbJF3Um0pYZ4mMQYBIgl1T4aqRRVLEtzk4q91VU) <laturk (laturk)>:
I can upload a short video file if anyone would like see what is happening.  It is only a few seconds long, but still 74.3 MB. 

[22:31:35](#aMxEQHrHH4rn-yMNAB0mBpRfAR555yii2tmyO-T8zsw) <hiiamboris (NOT THIS ONE)>:
I've no idea how it works in linux under the hood, but since Red is using 32-bit libraries, it's possible that it's child processes are using those libs too, and that those are buggy.

[22:33:36](#CYJiJSIyYHe1t4tzPpD_o5_UNAbOlUjM-NdFJ8B09N4) <cloutiy (yc)>:
Red needs some tweeters. I can try to get the ball started if there is any interest. 

[22:33:47](#ekNx8Bn2uAi_FYH7SCp3m_5i2TOsPbpNXXH5H1C556A) <laturk (laturk)>:
Will red eventually be using 64-bit libraries. 32-bit is pretty well a thing of the past.

[22:34:36](#DImSEW33-KbOSqlUUC0ryg2Dx5LQhnkNuXVoHk5tzLk) <hiiamboris (NOT THIS ONE)>:
eventually yes

[22:37:06](#4klAp6a3yCuoZ_uuXEWP0IeVxnLWBZ_dPH9SyYm_rlU) <laturk (laturk)>:
Rebol view no longer works for me. I get: ** User Error: Bad face in screen pane!
** Near: size-text self

[23:02:30](#M4eU1VnLWlRGGtUR_q4J39FLXk1w8kMZ8ValoDcIaIs) <laturk (laturk)>:
Does "eventually" mean any time soon?

[23:04:45](#jAmRZsF73g05HqJMOFVKt_PKQratjTlE3IrX9J2lS-Y) <hiiamboris (NOT THIS ONE)>:
Unlikely.

[23:25:58](#PlHuKhBGnTz4oMoTD8kvn71lp1SS8GQRNJITflYbQTk) <laturk (laturk)>:
hiiambrois, I was afraid of that. Thanks for replying. 

[23:58:23](#EPDwmb3n8k_QALWMxPvJ6LKbxc4LJ9H2ICJ3Bvy1TOc) <dsunanda (dsunanda)>:
@laturk If Red is somehow calling the wrong version of ffmpeg, you may be able to bypass that by writing a short shell script to call ffmpeg, and then CALLing that from within Red.

## 29-Mar-2022

[4:13:18](#yJbZkyzZuN8DHK2kcaFHCJSTQOpsapo_2OXj2e706SI) <laturk (laturk)>:
dsunanda, thanks, but I only have one version of ffmpeg installed, and even if I call it using its full path the result is the same. 

[4:28:07](#LgniQTLPO7TwOwyEX5BCKRU7h58vEfguILYACHyHV8A) <laturk (laturk)>:
Success.  Use call/console, and it works.

[5:07:21](#lgf5JpWpAeIzcWLlLcX8nBVZIw2KpJGiUZ-ghqNeXMc) <laturk (laturk)>:
But compile for release fails.

[5:07:39](#y2zvl6e1YS3B_JxLCX15dR9aBWkbvlDJHckW2H59UrU) <laturk (laturk)>:
[red-code]% red -r -t linux mp4todr.red                               (l@lat:~/red-code)

-=== Red Compiler 0.6.4 ===- 

Compiling /home/l/red-code/mp4todr.red ...
*** Compilation Error: undefined word request-file 
*** in file: /home/l/red-code/mp4todr.red
*** near: [request-file 
    str: to-string f 
    in-str: replace str "%"
]

[8:00:15](#zAKRxMim3DOjJQ0Rd_F7fvk_HboCO6jmrMMyrpqd2Gg) <hiiamboris (NOT THIS ONE)>:
Needs: view 

[12:36:21](#BnupOMrI78CFaAvy0UnFMsL93j9Qy4eEx4DuLkXGjmo) <laturk (laturk)>:
hiiamboris, thank you. I can now convert files from my camera to a form Davinci Resolve can edit, and then convert the edited files back to mp4 for posting to Youtube, and I can do it without having to type even one letter. 

[13:14:30](#JXdGUJdQ301Qu00t0xyWuGzwp5UbFZ7gfQ_AmXaRUjY) <hiiamboris (NOT THIS ONE)>:
:+1:

[13:17:01](#75JtIqgcz_YdKMrW5D_DopfF0q44SFeaG1y_ZoA3n8M) <hiiamboris (NOT THIS ONE)>:
it's kinda weird that Resolve would only support Quicktime format

[13:17:10](#mVwRdnGkxzdBH5GR173qyhqtZESIG1BXIKi9BNqt7lM) <hiiamboris (NOT THIS ONE)>:
it's a very ancient format

[13:21:08](#vOmhKQf6g3xlAZ-Gu1aYqaur5Ri27Pvyq_WdL4vtJCo) <hiiamboris (NOT THIS ONE)>:
maybe you should try [Shotcut](https://en.wikipedia.org/wiki/Shotcut)

[15:13:48](#9d3FxLydolSYEkuQ4GnAfp8J10hLV_9AaBeIj5AzH6E) <greggirwin (Gregg Irwin)>:
Glad you got it working @laturk.

## 30-Mar-2022

[8:25:26](#E6aMy5Egf-A8K5GQ_v_M3_HXQE6Uo_W5eBQcV6skRLw) <planetsizecpu (Jose Luis)>:
Welcome btw @laturk 

## 8-Apr-2022

[2:56:06](#HMh_oNQZPDR6AJG171KD8VDddoeBaZcv8ZdCpwAXm1g) <laturk (laturk)>:
@planetsizecpu Thanks. I've been watching RED for a long time, waiting for RED View to be available on Linux. RED has the potential to be the most productive computer language ever. I'm hoping for events that will enable the speed of development to greatly increase. 

[15:11:20](#dLXshx33qhtYtNOr5M_bYk_zc7WNQdTR9VxHR4dMGc0) <cloutiy (yc)>:
@laturk Red view is available on linux. Download the gui branch. 

[15:11:34](#7xJX4Dhh0HUigIdrxo4DBe1xQpKF3cQB6EiW_EuFt1c) <cloutiy (yc)>:
I been playing with it. It uses gtk


## 11-Apr-2022

[7:46:18](#ib8c_ku6XcrPBFWkO9ky1LgBBNZWcl_DY7qQsWo3kC8) <rebolek (Boleslav B≈ôezovsk√Ω)>:
@cloutiy @laturk I believe you don‚Äôt need the gui branch anymore and Linux View is in the master for some time.

[21:24:40](#j1NaT_VrbcYXD1YKxiGMcpcO21VbYhYxmhaybAJiz_o) <cloutiy (yc)>:
Even better.

[21:24:56](#Zi90uEfhuOJYZ_zOiD4P4NQ6SQZv2WftD1fKlHmtRYk) <cloutiy (yc)>:
Great to see lots of new faces lately.

## 17-Apr-2022

[7:59:55](#vgBc1V-pnV3XLJx73UXxaaxx-KNWLvgRCaPoUyKTSis) <ams02468 (ams02468)>:
Hi, this is part of my code, but whatever I do, I can't compile it with the red flag -r. Can anyone help me please? 
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
**
Compiling c:\Users\username\Desktop\ams\tar.red ...
*** Syntax Error: Missing #"]" character
*** in file: c:\Users\username\Desktop\ams\tar.red
*** line: 261
*** at: ""
**


[9:23:02](#d3Wc4ST4rn2ygA3LQ7WHeeOJl_FG93FsZIcFh9nKoH8) <hiiamboris (NOT THIS ONE)>:
Try adding spaces between tokens.

[10:37:42](#Y61FzZjpvN8t1cYg6oa-60h8l25QuCTRo4x21A_BKVg) <ams02468 (ams02468)>:
It was my fault(I forgot to update the source code XD) but thanks for the reply anyway @hiiamboris 

## 3-Jul-2022

[21:09:02](#LTWKSL7tukvu8OsEew9eBIHQ4wX_W8pKp0svfdyG8lw) <TheLastGuard (TLG)>:
it is possible to include a file written in Red/System in normal Red

[21:09:21](#X1ME209TndEQPtT8-VPglQ6KR235a6WbKQaYTXe13-U) <TheLastGuard (TLG)>:
and Hi,  sorry 

[21:41:08](#ZsSEXh7AcczT8Rqip08UINc236p7vtu9_5WxwtD1Vic) <hiiamboris (NOT THIS ONE)>:
`#system [#include %file.reds]`

[21:41:16](#WmJnJlqHJL2Ng1fsB_PBk7XfYqDKnDolE-jIg353klQ) <TheLastGuard (TLG)>:
thanks

## 4-Jul-2022

[2:34:11](#sSJ9_cKls4A4AN8hGhDwm14Aqw5EbjRgzuiiRg3_8oM) <greggirwin (Gregg Irwin)>:
Welcome @TheLastGuard. No need to apologize.

## 9-Jul-2022

[12:48:08](#G4uvu-zmAz80kCbQ8KHMSo9aseVLMlaMmUC7TNhuGGk) <ams02468 (ams02468)>:
Hi, I had a question how can I give this example two inputs?
```
a: system/options/args

     -p: func [x y] [
    
         print rejoin [{ren "}x{" "}y{"}]]
   
            
            if find a "-p" [ 
                 
                  remove a
                     
                     -p remove a a ]

```

[13:00:59](#kkWd5KozwAAYUBIAVH0KMiMCuGNSAetTm1xCPNDr9BA) <hiiamboris (NOT THIS ONE)>:
what inputs?

[13:01:31](#fjq3Y75Npz5x-_J96YbYdVgAfCuXBMZv1K8Q_4SIMhk) <hiiamboris (NOT THIS ONE)>:
`system/options/args` contains all the arguments from command line

[14:14:13](#LcO86YbKk3j9UGmQ2Hao3GfX4nnpoKQnEKoQCO4Ljbs) <ams02468 (ams02468)>:
@hiiamboris  i solved the problem thanks anyway 

[15:32:39](#JQxbWDN1fpypT66emjAX-R3h-5SV1Q-LjsyjsbRFgRQ) <ldci (Fran√ßois Jouen)>:
What‚Äôs wrong in this function?
```
bitExtract: function [
	number 	[integer!]
	n		[integer!]
	p		[integer!]
][
	((1 << n) - 1) AND (number >> (p - 1))
]
```


[15:33:06](#II9jALWgkIrv5k2JLZOaa7F1KU9mLy1N4FnQan3TQ4E) <ldci (Fran√ßois Jouen)>:
`print  bitExtract 140 3 6
print  bitExtract 140 3 4`


[15:33:28](#QlKnrkbOpB1Uf9t-ht_T6gfxRMdG532Nepw1yk30r20) <ldci (Fran√ßois Jouen)>:
OK : we get 4 and 1

[15:34:51](#78sxxh3FdA9z8KPpjXvE4raRJzXdQPbOZNCbqnHRRpc) <ldci (Fran√ßois Jouen)>:
But `print  bitExtract 45 3 6
print  bitExtract 45 3 4`
I‚Äôm waiting for 6 and 6 and I get 1 and 5

[16:06:08](#3AEWOoHZxfzWmK70sww-p6rzilIF-OdyymaA2HEBnOs) <hiiamboris (NOT THIS ONE)>:
45 is `101101`, how do you expect 6 and 6?

[16:26:33](#CeZ-DEKJp7XKmm9qlJMxZxQIuO24VRWQUddzJycGCqQ) <ldci (Fran√ßois Jouen)>:
@hiiamboris Code given by Gif code table :)

[16:46:53](#CiLllXU0zbo6B5JUFzu8UzmMmU9qWy7wFU9rW8zTi7w) <hiiamboris (NOT THIS ONE)>:
54 maybe not 45

[16:47:13](#lZ6D_6XKhWcv4-Zsp8qbv6QJTW55Cv3-R3NtIZF6OK0) <hiiamboris (NOT THIS ONE)>:
those bloggers...

## 12-Jul-2022

[0:06:12](#YmHd-KeVqDgl4mqHGS1DDGICsu-QW9fuEzdNP_0dGkk) <gltewalt (Greg T)>:
those bloggers...

## 31-Jul-2022

[16:22:39](#aPrhqFwt6vorHAQqcMuRnQvs9TaLaH5XrYS560I4XfY) <ams02468 (ams02468)>:
hi hope you guys have a good day, I wanted to know what code editor you use for red? I want to change my editor and I need your experience



[16:26:54](#TcaRtMLU5j_XUsyP_feWxKqFZEEZZOI-l8LCnDpcrtg) <ldci (Fran√ßois Jouen)>:
@ams02468 Depends on your OS. With macOS, I use sublime Text or BBEdit.

[17:55:41](#eNrj1-yxRdR06JXvoVrPT7Vr_PkVYPyYGhfETIsKIi0) <greggirwin (Gregg Irwin)>:
UltraEdit.

## 1-Aug-2022

[6:28:03](#k1FcAMtoXhpEdPaQ14EYq8DOJMT3yNxrwCgUgT1GPS0) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Vim

[10:31:51](#CbvEZpq6G7EYXr8xnmCx9gm16ZydeE4UI2_EqwnGERQ) <hiiamboris (NOT THIS ONE)>:
@ams02468 [CudaText](https://i.gyazo.com/e960e5091ec72eda2103ce50e0a7f74f.png)

[10:32:08](#WJguq85OgNFRa_Dq-8XCy4W1so045VQaMYgFt31nU7Q) <hiiamboris (NOT THIS ONE)>:
* @ams02468 [CudaText](https://i.gyazo.com/e960e5091ec72eda2103ce50e0a7f74f.png) (cross-platform)

[10:33:16](#PXDht6pN1a4jXP__2ygRWZU9kcF2OLZhsD60Pw3VuCI) <hiiamboris (NOT THIS ONE)>:
I dropped Sublime for it's too hard to extend, and decided against UltraEdit for it's too sluggish for my taste.

[16:12:02](#AW8Vhncuvh-DRXDG3m6DClf4lpiWVdOifpbr1tKSE7g) <ams02468 (ams02468)>:
10q 4 the answers you gave, very helpful

[16:16:17](#Fta5DBygCOeBNRe1DFpBZPiVuFS7x4dCVIdgxCm5bbk) <GaryMiller (GaryMiller)>:
Notepad++

[16:37:54](#S5frbSJXc6uF8nxC0jrLAu13lMzDvxQD8iLP5kTwSc4) <dsunanda (dsunanda)>:
Also using Notepad++ .... Recently changed from Programmer's Notepad because it is getting a bit crufty with UNICODE support.
Both have syntax coloring for Rebol (and therefore Red) which is nice.

## 3-Aug-2022

[7:51:13](#FsTgK-80llQ8WAR-N3glojOi5buhEyVmxx7W832t6yQ) <planetsizecpu (Jose Luis)>:
Notepad++  +  @Ungaretti 's pluggin

## 9-Aug-2022

[17:04:19](#9knecwJmQOWJpZsUIzpw3VQ5p2fUnEbIzeqhASGny8A) <ams02468 (ams02468)>:
Hi, is there a command to show numbers smaller than one  number, something like a countdown?

[17:07:04](#clVeepw01xce_dAUc_kdG8xz_MDdjTRfeiFCBDAOheE) <dsunanda (dsunanda)>:
You could adapt something like this:
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

[17:17:03](#UcJaDtBpDMgHYVK4OBODSZPTI_fQFxfJSBds03vt9nY) <ams02468 (ams02468)>:
thx @dsunanda 

## 10-Aug-2022

[16:15:02](#U6De1KHdTiDhDUHyKSaK_YayOdcauEBXlZkuYb2I2sA) <ams02468 (ams02468)>:
hey guys why the output of this code is none ?
```
z: [ 1 2 3 4 5]

a: 1

print z/a

```




[16:25:17](#87-psTN-uXANpOdsSB_DM3msS2PKp8MMLoPZx64VMnY) <toomasv>:
@ams02468 `z/:a`

[16:25:40](#6-aivWO-VoPjHr8_jML5f46yCL6a8iY-Sa99r2ReJKs) <toomasv>:
* @ams02468 `z/:a` or `z/(a)`

[16:53:39](#ww0ePXsCqRe1OQWhY-Fr5NVJUwUPZ2gIV_Qg_1pOgk4) <ams02468 (ams02468)>:
thx @toomasv 

[17:01:06](#q799EQDsVnmLORhu72LZBBvToTjnMZPnmnmiNBSIAq4) <toomasv>:
:+1:

## 15-Aug-2022

[18:24:18](#s2oDtR5gjVlgly_4W7Jgi-iSt1bw9UgiRbPmu-DDOv0) <ams02468 (ams02468)>:
Hello . there is way to convert the output of code to the string again ?
```
print checksum "test" 'MD5
```

[18:27:24](#IAG8RWCG60Mdk2Os5X33OqiaCCSx2UE8rFqMq_Dhbik) <dsunanda (dsunanda)>:
@ams02468 There's not supposed to be :). The point of hashes is that they are a one-way secure function.
MD5 though is so badly broken, that a search on the internet is often all you need:
https://md5.gromweb.com/?md5=098f6bcd4621d373cade4e832627b4f6
`test`

[19:35:05](#vuDT8li6vQ73v3hn1wMCjP03RYHyeLfn3T14JO_VrL8) <ams02468 (ams02468)>:
I wanted to know if red has sup reverse function? anyway thanks  @dsunanda 

## 10-Nov-2022

[19:23:23](#ROi0DeQzbuTu1WEKy3Kn-xA7VxKG89nFjFBSq5qHGUg) <fabianorezende26_gitlab (Fabiano Rezende)>:
Is red a language from the lisp family?

[20:10:35](#mfBUZozWhCNYvYK0PE1DrfLDpeR6JmOdeV6JQ_Wl9HI) <dsunanda (dsunanda)>:
Joe Marshall thought so: http://ll1.ai.mit.edu/marshall.html

[22:50:44](#YYQW1aQo2c58zmP068ON_f23pfmGsYOZ3tpsh7xShO8) <Respectech (Respectech)>:
Carl told me that Lisp was one of the inspirations for Rebol. However, there were some things in Lisp that he didn't like, so he only took the parts of Lisp that he liked.

[22:51:01](#t2-y5FqAbkPMQoU0cwy-OdjQKxLIPFl2ci2qY9aB3Xg) <Respectech (Respectech)>:
Smalltalk and C are other inspirations for Rebol.

[22:51:22](#Zm2RpVARtF9H5mrtJasdZ_ssYBIjxV0cXCN7p47AVys) <Respectech (Respectech)>:
(If I remember correctly from my conversations with Carl when I worked for him over 20 years ago)

## 13-Nov-2022

[18:46:13](#Jx0axIj1CXaybO2VsSbptq8g3LAKo2bfgt0GbdVVizk) <greggirwin (Gregg Irwin)>:
Redbol langs inherit from Lisp, Forth, and Logo (Lisp without parens effectively), and prototype object design from Self.

## 14-Nov-2022

[18:39:34](#TRAN4gR99S_cROyZnN9PAsSGGjKdf5XCGHejMH7zQ6E) <Respectech (Respectech)>:
Gregg obviously has a much better handle on where Rebol got some of its inspirations from.

[18:40:11](#gADWsXOpr1deLT27ONJZPROsMeDPGgQbk9omG8hdw6Q) <Respectech (Respectech)>:
Thanks for the clarification, Gregg.

## 18-Nov-2022

[5:37:21](#A2xmt3QEFlFZ1OSlRZJw6t-6ZZBO5kiOa8JMTiwnijU) <fabianorezende26_gitlab (Fabiano Rezende)>:
yeah i can see forth in it but there seems to be a bit of awk in it : )

[6:35:08](#qyCpufEiyZPHpwZACVj4blqX8RxqlrQ9882i2v6zpiE) <greggirwin (Gregg Irwin)>:
Not really. No automatic line processing, field splitting, or pattern-action core. I do have a `rawk` dialect built for R2 however, so it's applicable to that space, and others in shell-world. I hoped we'd get to build a `reddy-box` and other things along those lines someday.

## 20-Nov-2022

[5:22:54](#EFE_IOfi6u0v8c5kI7iEFr9_x9ONJNfMkqJhAHA4OsU) <WayneCui (WayneCui)>:
Hello guys, any way to change a timestamp value to a date! value?  eg. 894621091000 =>  1998-05-08 09:51:31

[5:44:15](#Va2yzSW7EDSsNTtYf02T7Z8Qku4c0-c2EGjNeEnFAKU) <WayneCui (WayneCui)>:

```
from-timestamp: func [ ts ][
    days: to-integer round/down ts / 1000 / 3600 / 24
    seconds: round/down mod (ts / 1000) (3600 * 24)
    return (1970-01-01 + days) + (00:00:00 + seconds)
]

print  from-timestamp 894621091000
```


[5:48:49](#FnEG6wYVz2kX7nS_xlIHWEo4LtTPThYl_naGKvvMPLU) <WayneCui (WayneCui)>:
just wrote a function, is there any better ways?

[6:30:11](#BbuW2O6kzbz6Ft55_FfZThc5xiXUR235g7xQoB600A8) <ne1uno (ne1uno)>:
this used to work?  way off now. `1-Jan-1970 + to time! 894621091000`

[6:36:53](#8Cpm3u2zdeDVlVDUI7amz53M_8jJvxoEX1mSCY--VBs) <WayneCui (WayneCui)>:
this used to work?  way off now. `1-Jan-1970 + to time! 894621091000`

[6:38:53](#m4U5HEw5rqKvOxDQTFgFREpItGPQelsmgVOXalU50xE) <WayneCui (WayneCui)>:
```
1-Jan-1970 + to time! 894621091   
== 8-May-1998/9:51:31
```

[6:41:27](#npMMjAVPJTYdzd7UeY9GrOPldzJ3gK7eb_8PBtUuz8E) <WayneCui (WayneCui)>:
@ne1uno Thanks for reply, it works, just change millisecond to second Ì†ΩÌ∏â

[6:47:17](#7c3TPTIhlnQoKUUAYR4X_E8DYMpbBSZ2HT2bnhwB5kA) <ne1uno (ne1uno)>:
Ì†ΩÌ±ç

[6:57:32](#nheS97AjSXE2gqzma56KVi6fcg5l-_it47MyT_OZXUg) <ne1uno (ne1uno)>:
the other way, `to float! difference  to date! 8-5-1998/09:51:31 1-Jan-1970`  from an @x8x post

[8:36:36](#-4_aNv3-QfIeqdw3nQFg__S513U3jXrT6FwXcIM9_U4) <WayneCui (WayneCui)>:
Ì†ΩÌ±ç


[13:44:32](#wkpRR3G53SYJlCv-00OSGu16u7BHoaScyYahMUT-H1E) <dockimbel>:
See [documentation](https://github.com/red/docs/blob/master/en/datatypes/date.adoc#epoch-time):
```lisp
>> to-date 894621091
== 8-May-1998/9:51:31
```

[13:46:04](#rU9Ak1uVrmiNPo_T_MuO6WFAgRgnLnled6PX-_n3TK0) <ldci (Fran√ßois Jouen)>:
[![image.png](https://files.gitter.im/570387cd187bb6f0eaddec47/FZ61/thumb/image.png)](https://files.gitter.im/570387cd187bb6f0eaddec47/FZ61/image.png)

[13:47:14](#8gVvZHpuE0-wf2WKh-daGXcdtsElJFwa7m_CVR2RNyU) <ldci (Fran√ßois Jouen)>:
A simple way to create nice forms: use zenity inside tour Red code :)

[13:47:58](#SVOZR-TJTaMUUTJ-5s5o2kzz5o7QwLlH3Zz2QwHNnb4) <ldci (Fran√ßois Jouen)>:
* A simple way to create nice forms: use zenity inside your Red code :)

[13:48:32](#egREjUplWMb4kAE4p2P1YSZJeNqrygmzDa_71UwzlHI) <ldci (Fran√ßois Jouen)>:
zenity runs under Linux, MacOS and Windows. See https://gitlab.gnome.org/GNOME/zenity

[19:24:18](#231PA24xslQ0CdV0qU1SHjgLUaHNQWKN3rRpdzACVsc) <greggirwin (Gregg Irwin)>:
@ldci nice reminder. Zenity has come up before. 

## 21-Nov-2022

[6:20:51](#8LzecViU0yCCx2OVSXFB-BEgwKbQGbr3U_-hJxRPTyA) <WayneCui (WayneCui)>:
@dockimbel Thanks Doc, my CLI is too old.  It works with a new version 

## 25-Nov-2022

[4:30:34](#Frw-epajeeBPy-1dBmrWl7rHU3zJZfh5WR_XsHWv8gs) <WayneCui (WayneCui)>:
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

[4:31:28](#N50leEugaiQjZOYMu8hwU9Bp82BaXOJIrwXqJGkGJPs) <WayneCui (WayneCui)>:
[![image.png](https://files.gitter.im/570387cd187bb6f0eaddec47/ejNB/thumb/image.png)](https://files.gitter.im/570387cd187bb6f0eaddec47/ejNB/image.png)

[4:33:07](#4I3Vn7jZir4Ea4XVomoHK8uj4jGvVQOp6YAl9LbNcOM) <WayneCui (WayneCui)>:
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

[4:35:38](#pUxOh0JfZSsz6cUYv8z-r_GZs39aim4AJ_x0GfJyIBI) <WayneCui (WayneCui)>:
Hello, I am working on a hessian client projectÔºåsending/receiving binary data over HTTP. It seems there is something not working well about Red HTTP  

[7:19:10](#v7ts9tgMBsLoBg-vqNpFm61jQz3TCU5wmQLBUtfBXUY) <ne1uno (ne1uno)>:
>{r^A^@fS^@^DcodeS^@^UNoSuchMethodExceptionS^@^GmessageS^@+The service has no method named: plyDate_1zzz}

[7:57:28](#I8bmotegJIME_xbXH0WLc2NXsrNaJRwVmomlE6FtGqY) <ne1uno (ne1uno)>:
@WayneCui,  `at` maybe needs `series!`?    try something like `(to binary! at form  to-hex length? method 8) `  

[8:14:23](#gpkOkPTTTRilShU4uJu5VfQ7_v1oozu5HrW18R-dDxo) <WayneCui (WayneCui)>:
Thanks @ne1uno , I know what's wrong

[8:22:06](#xno547Tk2_I7c75vy5eq8atcyvzGyRNzWLQqQNmWVVw) <WayneCui (WayneCui)>:
Thanks @ne1uno , I know what's wrong

[8:22:25](#IkaNDY6sZyExDLMB0dyT4A5b4HeCyEmL9qg1jC3s04E) <WayneCui (WayneCui)>:
request is correct, another error

[8:23:01](#L0asKA3sDNr7GnvrnKuINWEAmMdcwus4SJShR0PmUw4) <WayneCui (WayneCui)>:
request is correct, another error

[8:37:47](#a-0K5YQQQyfEoAo8xDv23NSsCORvSCYKh9ldRKb6ryk) <WayneCui (WayneCui)>:
```
#{6301006D000B7265706C79446174655F317A}
*** Access Error: invalid UTF-8 encoding: #{D04B9284}
*** Where: write
*** Near : result: write http://hessian.caucho.com/ 
*** Stack: run 
```


[8:38:14](#2UUw2DrfBJFJ5aqxlIqTVdGth-K-sp9J-iRuh98xjNM) <WayneCui (WayneCui)>:
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

[8:39:36](#tbpM3pEQqtPiORLNdLbRbhc5RQffuvBeDUy_DVQWspM) <ne1uno (ne1uno)>:
` (at to-binary length? method 4)` ?    

[8:43:32](#bKM0hpibLqB2UOubTBITLgRTJ177J4NB1pbQSSEAfcE) <ne1uno (ne1uno)>:
seems like it's looking fo 2 byte length, not 1 or 4

[10:42:35](#lHl-KSzxyPowbumHCYttlRV7odTKN13YK4_KtnNbt_c) <WayneCui (WayneCui)>:
I think it's about the response. Request is the same with Rebol  

[10:56:05](#7-VPL4V53oZ3XhGcyKA0g3aHgfZpDnNySGLpV_DEhIw) <WayneCui (WayneCui)>:
Simplified  the code


[10:56:15](#oMCi994e_u2XWOQ50PUJxhEVWKUTsL15KbVqxYzLmtE) <WayneCui (WayneCui)>:
Simplified  the code


[10:56:53](#JHmg_xomQo4OPjPD4OJGMpei_WGyn-qgXSX82t7T09w) <WayneCui (WayneCui)>:
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

[10:57:27](#VF1mArxvsahBqIaUja7GXCpDTryjVsrdebLN1ycWeHY) <WayneCui (WayneCui)>:
```
>redl hessian-red.red  
*** Access Error: invalid UTF-8 encoding: #{D04B9284}
*** Where: write
*** Near : data: #{6301006D000B7265706C79446174655F 
*** Stack: probe 

>rebol3 hessian-red.red
#{72010064000000D04B9284B87A}
```


[10:59:28](#P1BTbztPXLjuQpZb3cEeegrKLNDz6dQ_nvnAloKE7IM) <WayneCui (WayneCui)>:
* Simplified  the code, but this url (http://hessian.caucho.com/test/test) has often been timeout :-/


[11:10:59](#Y5dJhyY5vlcFkQjT604lg5LRYN7CrYORf_rQYCfuOsY) <WayneCui (WayneCui)>:
It seems Red try to  explain response data as UTF-8 

[11:13:04](#8jo2PnxaKNMTVUe6fgqS7N4pl5bIc5Sfu-RJIuMuZ1U) <WayneCui (WayneCui)>:
[![image.png](https://files.gitter.im/570387cd187bb6f0eaddec47/q2hz/thumb/image.png)](https://files.gitter.im/570387cd187bb6f0eaddec47/q2hz/image.png)

[11:13:29](#hPORSXHMrUKaOpeuyfyeLoskzquSKi1mBdYXhXA2CmA) <ne1uno (ne1uno)>:
why compose?  I got a 404 using reduce instead

[11:13:29](#ZpIPCjWjqc8qvWgPMjaVhExT9ydQUS83y__H5Bt0y8o) <ne1uno (ne1uno)>:
= {<html>^/<head><title>404 Not Found</title></head>^/<body>^/<h1>404 Not Found</h1>^//test/test2%A0 was not found ...

[11:19:56](#IwZt9wquoZ4XnJ4OQu2Xmykqc31pQZ6IrDdCn0VUqXU) <WayneCui (WayneCui)>:
`compose` evaluates a block of expressions, only evaluating parens, and returns a block. (http://www.rebol.com/r3/docs/functions/compose.html)



[11:26:43](#DCLqa_6IltOZsYjxggIA_uzxmAdAsIq5m_DSfQmHc1Q) <ne1uno (ne1uno)>:
I get the 404 now with compose too. not a utf8 error

[11:45:10](#_zrVpUUKFLTOpDR2cJ1CznFSFM070gqlokcxSH0i8Pc) <ne1uno (ne1uno)>:
could it be a hessian v1 v2 v3 thing?

[11:46:44](#ALWPzJTVYk38h3Nor8HDGRAO25--Rv1Vb6DW8JWJsLM) <ne1uno (ne1uno)>:
if r3 works, must be something in the post is different

[11:48:45](#-vxY7vKlVogB2W-wETj1R86VmtjJ_cJaraf6T6xk-Tw) <WayneCui (WayneCui)>:
Never met that. Is there any typo? Can you open http://hessian.caucho.com/test/test in the browser?

[11:49:03](#pbtd0tM8-bVf__TXIoTR_miDln2ol2e2qqWut7IR5KM) <ne1uno (ne1uno)>:
Hessian Requires POST

[11:49:50](#JCEVExlTgSM5preh-jsmb-ySYPKlXj1D1TyxWv59Dyk) <ne1uno (ne1uno)>:
seems to work

[11:57:07](#G3VVOHRUUSMZCKGB5wna8kjCyT8XQtRg5t8M3bZ8Uac) <ne1uno (ne1uno)>:
I used to have a proxy to look at messages in or outgoing, haven't done that in awhile.

[12:02:10](#8rkY8YjF6noa4TAgnXOtpVOAATYMdKa8tDwQ5l3V70A) <ne1uno (ne1uno)>:
should I be using the I/O branch maybe? woops

[12:16:18](#uyfk5ZlBrQ8veE99Gf6aDUfKiDK1SWCBp4SrXO8HDYQ) <ne1uno (ne1uno)>:
same w/older red I/O

[12:22:08](#1OBwvYbZ0GQ4OYPev7vJHV7q0U3KKFh3aSxdTnIFwHs) <ne1uno (ne1uno)>:
Red 0.6.4 for Windows built 18-Jul-2022/15:26:27-05:00  commit #d09220b

[14:53:07](#KwjOJ_ZJUDpGKl1IGHz1rSJE2geGlD45TGS5WTyz548) <ne1uno (ne1uno)>:
@WayneCui, which red version are you using?    continuing in https://gitter.im/red/IO

[16:13:37](#xBcp0vHKpoQtOOc1Ztd3BE80dxdCRsXewYxpM0y2Nsw) <WayneCui (WayneCui)>:
@ne1uno Red 0.6.4 for Mac Cli, November 20 or 21

[16:18:30](#NdvZlpaCmMmFQrCp8YRdOAHjijRIq62JxqS8PuvRi1o) <WayneCui (WayneCui)>:
the same with red-24nov22-e6ae842b4 for Mac cli

[16:22:46](#lgx9aMEMnb9rdzAUlmw-1iwogaqgXXBRo0lwjAbray0) <ne1uno (ne1uno)>:
@WayneCui, try separating the `odata: compose ...` from the `write ... odata`, it might improve the error message?

[17:06:20](#zOZN0f3_86G-J2GV79HiRBPur4VNQAvsU67Ske1veg4) <greggirwin (Gregg Irwin)>:
Have you tried using `/binary`?

[17:31:44](#bspG5H3zvn7ueS0smveVBf3Py7uVgIsgyD08tTK1Wzo) <ne1uno (ne1uno)>:
`/binary` same  w/recent.   current red IO, `write` seems not to handle a block after the url at all

[17:36:53](#oLh-ZJEH8fVkBfkPl2w_6ngYwiyUx-za0yrBlrPzUMk) <greggirwin (Gregg Irwin)>:
With current main branch:
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

[18:04:24](#uSGzWmTg8Bk2NKR1y9AR9mVpaGOAMUDq0yZjjV1X-Y4) <ne1uno (ne1uno)>:
^works recent cli not view.  there was a Unicode space or control code between /test and compose I picked up from copy & paste that errored.  

## 26-Nov-2022

[1:11:40](#87mHYLaZQw1wcu42XhSlgfEJge8f-isOk7df5dOIA1g) <WayneCui (WayneCui)>:
@greggirwin It works, thanks a lot

[1:44:16](#F0n0ltBdAoGGI3sgAV7gvtvVzvobPoSGM9SPH_2RzLQ) <WayneCui (WayneCui)>:
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


[1:44:35](#AeCw--aSCRurST7y8nmgD803h9yEIvO0D9Salk4YKkw) <WayneCui (WayneCui)>:
In rebol3 , I can do this:

[1:44:47](#olKGm_ivxvAl3NyMIbulKNI9Mc9VRFeAvZQ8JC_uz14) <WayneCui (WayneCui)>:
```
>> to-integer #{000000D04B9284B8}
== 894621091000

>> to-binary 894621091000
== #{000000D04B9284B8}
```


[1:47:29](#YxmORnbkdeRiTH63VJ-Nhxx6T9WRDUduQlM0GT6Kxjg) <WayneCui (WayneCui)>:
`to-float` can not work either 
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


[6:34:49](#PaRCeH-wOwPUDvHKGmOdSgWBa0DO9GjiSzy8uu2xoo4) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
There is no `to-number`. `number!` is not datatype. It is a typeset:
```
>> ? number!
NUMBER! is a typeset! value: [integer! float! percent!]
```

[6:36:40](#Pw2tnOFwUnYglq7Qu2TRurzDSg9KavD3k2bw4U8dsL0) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
And Red has only 32bit integer:
```
>> to binary! 1
== #{00000001}
```

[6:44:01](#nwmgE-d4B8xTfnMx0cvevJzD3fgo1BzzJVyYkwqTn0k) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* And Red has only 32bit integer and float values:
```
>> to binary! 1
== #{00000001}
```

[6:46:14](#v_izxptJZgEP2dNCA01uXYCQ9tR1LxU8ip1betd7iSA) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Years ago I used my [Stream-IO](https://github.com/red/code/tree/master/Library/Stream-IO) for binary conversions in Red.

[6:46:39](#bkY8VlbYXdDJGBv71dkPRWkcRXtlRVhCQ934ZHltGZk) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* Years ago I used my [Stream-IO](https://github.com/red/code/tree/master/Library/Stream-IO) written in Red/System for binary conversions in Red.

[18:12:58](#OpDmBsvXU_nAvka67slkOEIiR4szMojUmvAaGnbOISY) <greggirwin (Gregg Irwin)>:
As @Oldes noted, there are no 64-bit ints in Red yet.

## 27-Nov-2022

[1:06:47](#2MkxKr4SCI2aku0Ot8bZLUVJbcsIyARvsVzkt9NaS1U) <WayneCui (WayneCui)>:
I see, thanks for your info @Oldes @greggirwin 

## 29-Dec-2022

[11:49:15](#INL0-LJZivNVhKnmC1lNsO9ADdETgJIaxxDVMZMKHow) <lylgithub2021 (lylgithub2021)>:
```
a: ["A" "B"]
view [
drop-down data a
react [face/data: a]
]
```
In this example, I try to refresh the face "drop-down" by "react" so as not to close/restart program when the value of "a" changes. Yet it does not work when the value of "a" changes from ["A" "B"] to ["A" "B" "C"]. Here the value of "a" comes from direct input. In the real program, it comes from reading a file. So, how to refresh a face in Red without restarting program? 

[15:41:42](#wF76vWw709nm-XEgGVBl32FCVrBdx0tVL0nggBFmyrw) <toomasv>:
```
a: ["A" "B"]
view [
drop-down data a
react [face/data: a]
]
```
In this example, I try to refresh the face "drop-down" by "react" so as not to close/restart program when the value of "a" changes. Yet it does not work when the value of "a" changes from ["A" "B"] to ["A" "B" "C"]. Here the value of "a" comes from direct input. In the real program, it comes from reading a file. So, how to refresh a face in Red without restarting program? 

[15:42:38](#EpsCJUz6VgBw6S2ZJ6AZzVz3fcJIUMz8uEaG-oiGYMU) <toomasv>:
* @lylgithub2021 It seems to work on W10 gui-console. I tried this with drop-down data changing whenever `a` changes:
```
a: ["A" "B"]
view/no-wait [drop-down data a react [face/data: a]]
append a "C"
remove a
```

[15:46:54](#fvL9-NDsIxSkvV-m3qsuCl6wAq9HpFDVUvI9eb3eQtM) <toomasv>:
* @lylgithub2021 It seems to work on W10 gui-console. I tried this with drop-down data changing whenever `a` changes:
```
a: ["A" "B"]
view/no-wait [drop-down data a react [face/data: a]]
append a "C"
remove a
```

[15:47:13](#17G2NYOF12lukvYMvUy7qYdV-5wZqHbAXA0EXf7NM_E) <toomasv>:
* I works even without `react` :)

[16:08:29](#Fva906lXx7tLzXIMzfDHjVBKuvJYOzjksLIDqOT2FGs) <Kazzum (Kazzum)>:
ok so let me be frank this is all beyond me. I haven't coded an UI so you'll need to do most of the heavy lifting but reading
https://github.com/red/docs/blob/master/en/reactivity.adoc#react

seems to imply that if you just set one block of code as a reaction the reaction is static. I am reading that to mean unchanging from program startup. So `react` written as `reaact <code>` could read a config file on startup but wouldn't react to change in that config file until restart.

To make a dynamic reaction you need to use `react/link <func> <obj>` 

I am reading a dynamic reaction to be one that updates as the program as running but please read the document to verify my surface level reading.

[16:08:50](#ymwxWf-m5L_zhGMQP8-47saXDpG3_4k4IKsJevoW5GE) <Kazzum (Kazzum)>:
* ok so let me be frank this is all beyond me. I haven't coded an UI so you'll need to do most of the heavy lifting but reading
https://github.com/red/docs/blob/master/en/reactivity.adoc#react

seems to imply that if you just set one block of code as a reaction the reaction is static. I am reading that to mean unchanging from program startup. So `react` written as `react <code>` could read a config file on startup but wouldn't react to change in that config file until restart.

To make a dynamic reaction you need to use `react/link <func> <obj>` 

I am reading a dynamic reaction to be one that updates as the program as running but please read the document to verify my surface level reading.

[16:09:28](#J0VmgYeLOrIoDTTenENG0n6OZTR-hmkc2xAoKpFAKZw) <Kazzum (Kazzum)>:
* ok so let me be frank this is all beyond me. I haven't coded a UI so you'll need to do most of the heavy lifting but reading
https://github.com/red/docs/blob/master/en/reactivity.adoc#react

seems to imply that if you just set one block of code as a reaction the reaction is static. I am reading that to mean unchanging from program startup. So `react` written as `react <code>` could read a config file on startup but wouldn't react to change in that config file until restart.

To make a dynamic reaction you need to use `react/link <func> <obj>` 

I am reading a dynamic reaction to be one that updates as the program as running but please read the document to verify my surface level reading.

[18:50:31](#tjQx1vAIO-A4C0XS4k9JpgeA6qdjpvr05Tuqyn9NVHg) <dockimbel>:
@lylgithub2021 You do not need to add a reaction for face properties as faces are already reactive. The folowing code works fine:
```lisp
a: ["A" "B"]
view [
	drop-down data a
	button "Add" [append a pick ["C" "D" "E"] random 3]
]
```

[18:50:52](#-irWOgLWpJt8EwPFU0beMy0FOYiSlrpeoqFy1RJFByA) <dockimbel>:
* @lylgithub2021 You do not need to add a reaction for tracking face property changes, as faces are already reactive. The folowing code works fine:
```lisp
a: ["A" "B"]
view [
	drop-down data a
	button "Add" [append a pick ["C" "D" "E"] random 3]
]
```

[18:50:57](#q_go7UrrNoJ4FxgUA_VyMWpP0JDPCibnzbnQe4SASuI) <dockimbel>:
* @lylgithub2021 You do not need to add a reaction for tracking face property changes, as faces are already reactive. The following code works fine:
```lisp
a: ["A" "B"]
view [
	drop-down data a
	button "Add" [append a pick ["C" "D" "E"] random 3]
]
```

## 30-Dec-2022

[0:53:11](#5i4Ser96s9EMAj_wi21eHTkPXF6VYhRuLHCgeHQUEzk) <lylgithub2021 (lylgithub2021)>:
@Nenad Rakocevic thank you so much for your idea. In my program, the value of "a" read and changes from a file. If no another button is introduced, any other better way to do it?

[1:47:12](#4ekP8EEzP8BkCw5fHv2gNBwCz9AJh4FP4SMPJSU4bXo) <greggirwin (Gregg Irwin)>:
@lylgithub2021 if you want to maintain a reference to the same series, and update it, you can do something like `append clear a load <file>`.

[1:48:23](#BrN31sQv-tTrP6yFIphd4l24eqStzTQJcJWq-etztI8) <greggirwin (Gregg Irwin)>:
What happens in your case is that the face references the actual series, not `a` (which also refers to the series). 

[1:55:37](#gLia2MrIGk0a7GinjRPAZCLeaECscnie_GNm1GY_3qc) <lylgithub2021 (lylgithub2021)>:
@Gregg Irwin many thanks. I still do not understand why "a" can not be referenced directly.

[2:22:53](#VgzL3ipLSrvbShidAH6MPl_wczEzG2S9p_YSWRFa2YQ) <greggirwin (Gregg Irwin)>:
It is, as @dockimbel 's example shows. You just need to *change* `a`. 

[2:24:05](#V9BNG14fFbZP4otl4eDWWWoHBMVyEOe_8X4O830GwGA) <greggirwin (Gregg Irwin)>:
Show your actual code that affects `a` and I will hazard a guess that you are changing what `a` *refers to*, not the original series it referred to when the face's data was set.

[6:29:16](#4RmY6nh7oCIVIfLzEgF-oTsQLnxvodU7htAK4gZMwZw) <lylgithub2021 (lylgithub2021)>:
I just wonder why "append" can reactive drop-down, and derect change value of a(a: ["A" "B" "C"] for example) can not.

[8:46:39](#5PZD6Uccb4AB-VsCoGjq9hThwbivhqdvCJlC_zN6KwA) <greggirwin (Gregg Irwin)>:
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
So if you do something like `a: load <file>`, `face/data` is like `b` in this example, and doesn't know or care that `a` now refers to something else. It only knows about what it *still* refers to.

[8:47:21](#XHxla3lxiZT9lOYLEAs-AZn1jX09Fsu11kQ_CAcuQ7o) <greggirwin (Gregg Irwin)>:
* ```
>> a: [1 2 3]    ; here is your original a
== [1 2 3]
>> b: :a      ; b now refers to the same block
== [1 2 3]
>> a: [4 5 6]   ; a now refers to this new block
== [4 5 6]
>> b         ; b still refers to the old one
== [1 2 3]
```
So if you do something like `a: load <file>`, `face/data` is like `b` in this example, and doesn't know or care that `a` now refers to something else. It only knows about what series it *still* refers to.

[9:50:16](#fD06jdxhwLXzOoT4Hv3pHS1ivjI9QBT7rSzxdpbCIEI) <dockimbel>:
Reactivity currently only works on changes in objects and in series (strings, blocks, paths,...). It does not support changes in the global context. So `a: ...` if not enclosed in a reactive object will not produce any event. We don't support it for now as it could impact performances significantly. We might figure out a good trade-off to support it in the future.

[9:50:54](#kVHxuB6Mwop1jzCqOBQuvZzTelZ_pLDxsi3pe_K2D40) <dockimbel>:
* Reactivity currently only works on changes in objects (`change` event) and in series like strings, blocks, paths (`deep-change` event). It does not support changes in the global context. So `a: ...` if not enclosed in a reactive object will not produce any event. We don't support it for now as it could impact performances significantly. We might figure out a good trade-off to support it in the future.

[13:26:25](#eVQizR6DAoDyxJu97hf7XGY80dUNNz5u_SbTQhlclRY) <lylgithub2021 (lylgithub2021)>:
Oh, Thank you so much for this !!

[18:36:41](#fQ4Zmas2kiG6Ts89M6RxO2nTi0pBldzaUiXQdNH5iXQ) <greggirwin (Gregg Irwin)>:
That's a good note for Guru Meditations.

## 11-Jan-2023

[6:46:25](#mL34rVhgpgEmn5IrOf8VWeruwMcsleZaSA9xVFJMpa0) <JoshieOnNFT_twitter (JÌ†ºÌµæÔ∏èshie)>:
GM admin. I'm Joshua, Business Development & Strategic Partnership at Coinstore (Global CEX). May I ask who should I contact for listing?


## 12-Jan-2023

[15:24:06](#sKRCM8nUpBpIfgJxMxlaWJSLJ63EEdMUpjHLGs44DFo) <brk-klymn (brk-klymn)>:
Hey, I am very intriged by this language, I've tried to learn it a while ago but could'nt find a resource for learning the language, anyone has suggestions?

[15:28:01](#LeHvX3hOhtm4rz_0Ev3zb58bGDm2R6jT4bn2GcdfY4w) <hiiamboris (NOT THIS ONE)>:
‚òù in the topic :)

[15:28:59](#YOdIUGjBishD37YRb7TluIk6THvRvpxiPcClA97lqEs) <hiiamboris (NOT THIS ONE)>:
some people also like http://helpin.red/

[15:31:43](#VEmFhY07NYQzu4XtENj4PAszt_PlmY_BRKGLDTS9EJM) <hiiamboris (NOT THIS ONE)>:
don't be afraid of reading Rebol/Core manual though, it is mostly relevant to Red as well

[15:32:44](#DhxAohjcBtC7ce6JwdIUPu8HHi_N5HfaeROm9X3cD6c) <brk-klymn (brk-klymn)>:
I've tried that a bit, how do you suggest learning red?

[15:35:26](#iMMeIQK4TKkEl7P46o_eUy_y6sFiHV98kMwfXBauD4s) <hiiamboris (NOT THIS ONE)>:
do you know any other languages?

[15:36:42](#HF8cA1ILeufsyQO48DZQOQf-z7CHVHBbiPrqV_Yyd2M) <brk-klymn (brk-klymn)>:
yes

[15:37:08](#0aa1iG0oSzrpFtB_nivyJNsj4ZWGcdy45QDlSam9VSw) <hiiamboris (NOT THIS ONE)>:
which ones? just so I know your background

[15:39:16](#ET3g0-Y0sq5wjLBr196ukrjtLbmN8ooRBafWrZB2jnM) <brk-klymn (brk-klymn)>:
oh :) well c,java and python I know the best, other than that I love functional programming, playing with haskell, elixir and ocaml

[15:39:31](#rgtQCuAWpFAD8BvBFSDxS0gs4pDtSrCEvC58QOeYKYk) <hiiamboris (NOT THIS ONE)>:
ok great :)

[15:40:14](#uYminnfM6XY_4KSuWCHxxqi7tVkNNzjOZm7fYLL5JGM) <hiiamboris (NOT THIS ONE)>:
In any case I would recommend reading the interesting bits in Rebol manual, to get the idea of how it works (it's the best resource IMO). And keep Rebol console open so you can play with the stuff you read, study it. With your knowledge you will mostly just skim a lot of it.

[15:41:15](#dgVxFLUl859n0DgfojaH02--cDqVj97ndddHVCGLmQg) <hiiamboris (NOT THIS ONE)>:
As C user, you'll find series in Red and Rebol familiar. Same pointers.

[15:41:51](#hU0ozgWlxWiamWIF2tIfgB3GwBiJxYdn0u-D2MwFFJc) <hiiamboris (NOT THIS ONE)>:
As a Python user you may also find this page handy: https://github.com/red/red/wiki/A-short-introduction-to-Red-for-Python-programmers

[15:42:02](#tARamhoMyvMEz5Ej0ujWUyGTB5barIxteJqowReEYlY) <brk-klymn (brk-klymn)>:
REBOL console, not Red yes?

[15:42:18](#eHgzMSwS9swEJnZIoszjH5C1b2Lr-qagnJv6NszfL7Y) <hiiamboris (NOT THIS ONE)>:
Yes, use Rebol console with Rebol manual :)

[15:43:40](#qsvXKxcY6XONTphB204L8iy5l06c0-MpHtCZmgA_b9s) <hiiamboris (NOT THIS ONE)>:
View subsystem is better learned via Red [official docs](https://github.com/red/docs/blob/master/en/). Different from Rebol.

[15:44:27](#b6vFRWrgxqU1sEUe32UHy4AuMSwDkJbOlyCXz4NQyyw) <hiiamboris (NOT THIS ONE)>:
After you get the basics, find yourself an easy task and try to implement it in Red :)

[15:45:25](#g8MeIPIzdGuzmtgYxMCBIo9OAOiIqRQsbmMi1DZm8FM) <hiiamboris (NOT THIS ONE)>:
* View subsystem is better learned via Red [official docs](https://github.com/red/docs/blob/master/en/) (View, VID, reactivity). Different from Rebol.

[15:46:54](#CsYqPaCWY44K_Vd7gXDqRAMg8628-7Zn1CDXMCaAcQw) <hiiamboris (NOT THIS ONE)>:
Or https://exercism.org/tracks/red/exercises :)

[16:06:09](#8O-CBr8_jZlB3qeyLDf5HCGcBpOsStmsQ69zSASytT0) <brk-klymn (brk-klymn)>:
thank you very much! I actualy just downloaded rebol, I'm using void linux and trying to use it with the terminal it says no such file or directory

[16:06:44](#108ZXI5uAc8VN_fJUg7ZoAoJxfOdRyByWYpFmJADgqQ) <brk-klymn (brk-klymn)>:
I remember having this problem with red and the I downloaded the multilib for 32bit support but with rebol it didn't help time

[16:09:34](#GIf3QSQGEW8rfL50Vw6Gw65En8b49SUnbuyMiLMobec) <hiiamboris (NOT THIS ONE)>:
not familiar with this distribution, sorry 

[16:10:04](#UV7HhEduxDxq3OUU4OziDrzzHxF3RBOjD5na6fX0ZUA) <brk-klymn (brk-klymn)>:
:\ I'll try some stuff, thanks though

[16:10:46](#UGjfcd7tduYxZypal29si4vU-FoCquDLWD_xRmAC-Ow) <hiiamboris (NOT THIS ONE)>:
well, there shouldn't be any difference, R2 or Red, both 32-bit GUI consoles

[16:17:58](#WgOFeI4u1jDCHkjfnsYaeLbvwhq9i-ZzLz23MO0WFFU) <brk-klymn (brk-klymn)>:
some 32bit libraries were missing, got it to work now, thank you for all your help!

[16:21:20](#sG1UvsccXZz3oVHgzyNSXpqCMYQZBzNzNmtqvhFewUM) <hiiamboris (NOT THIS ONE)>:
:+1:

[16:22:49](#XMnhVcXIBHj9hpFo4RBoR4NW_smK2rnzGdZ4lpH1Mv4) <hiiamboris (NOT THIS ONE)>:
R2 will also be helpful when you will want to compile your creations Ì†ΩÌ∏â

[20:21:03](#96YwkbIThXowNgMWh1cJSC3-W8885HKehqvvbmznKig) <Respectech (Respectech)>:
This article may be helpful in getting Rebol to run on Linux: https://ameridroid.com/blogs/ameriblogs/how-to-run-rebol2-scripting-language-on-debian-based-arm-systems

## 13-Jan-2023

[7:05:08](#by87G4qxi_D3Hg5X8pQS2ox8LrzuCECXpGoUEKATQjo) <planetsizecpu (Jose Luis)>:
Welcome btw @brk-klymn  and  @JoshieOnNFT_twitter   

[15:11:53](#gE739GRFY6kWAynVGp3z3J60fK-SE37zJ-yeaRfkWfM) <Lc_1231_twitter (Luca Dodici)>:
Hello. I'm new here. I've recently discovered Rebol/Red and been enchanted. I develop web apps and have been trying to convert some of my projects into the language. As hard as I have looked for, I haven't found ready solutions for Red. Is there any? But I found Cheyenne for R2 which is wonderful. Unfortunately it seems to lack SSL certificates + I can't get it working with SQLlite becuase of different architectures (Cheyenne running on R2/Core 32-bit, libsqlite3.so being 64-bit). It would be nice to have a Red porting of Cheyenne.

[15:15:05](#snhbl2UY0lxRumhHw1k2iFMZthCKY8wxaFJbP2CBQeo) <Lc_1231_twitter (Luca Dodici)>:
I tried connecting to SQLite3 by dobeash (http://www.dobeash.com/sqlite.html) but compatibility issues are the same with any other library.

[15:23:23](#pUhH9U9AfhsuP64CZ3GZyAFyXmD5obNHnaHPnjZ_pc8) <hiiamboris (NOT THIS ONE)>:
Welcome @Lc_1231_twitter :)
@rebolek has some minimalistic server, he may tell where it can be found and how it can be used
for SQLite there's [this old work](https://github.com/red/code/blob/master/Library/SQLite/SQLite3.reds) but you better ask in https://gitter.im/red/database group

[15:24:55](#wRNrsBo3e3kSTRByITGvVzyxunXUnge56CQ-L5NL-6s) <Lc_1231_twitter (Luca Dodici)>:
Great, thank you!

[15:25:00](#EBEYz_ZTJ_OvZ7VMXLtJX_Ku8Gga9Y4dtDWjjaHlY8M) <hiiamboris (NOT THIS ONE)>:
Red is still 32-bit though, so you'll need a 32-bit SQL library 

[15:25:39](#Rz2OSYdC9tkN-Rk9V6meDiMiTn30aD3eiHv06c-BoLo) <Lc_1231_twitter (Luca Dodici)>:
Ah! Ok.

[15:28:05](#qaMODT6RaCaglQFlUzf4I27ouPENnqBUX-EXkgRwhOQ) <hiiamboris (NOT THIS ONE)>:
On Ubuntu the command seems to be `apt install libsqlite3-0:i386`

[15:30:28](#Tu90EXC2dxb8CRonGgG8pXW79LB-lnJ8ftFyiGocppk) <Lc_1231_twitter (Luca Dodici)>:
Thanks! I got it through  apt-get install libsqlite3-dev.

[15:31:12](#vcl44PToVXcH2ewGLRNnTIPm-w0Ls2-QQDbpxrKuCTQ) <Lc_1231_twitter (Luca Dodici)>:
Than I found it in /usr/lib/i386-linux-gnu/.

[15:31:15](#6l4SIuWKLG_OhqvjTmk540A0yGaUHSFk8p0uDrUAxRA) <Lc_1231_twitter (Luca Dodici)>:
Then.

## 16-Jan-2023

[8:10:11](#jL0pnOOo6p5VNEC7SwTk_vRwAIHqKRAiFxLgAWj1ufo) <rebolek (Boleslav B≈ôezovsk√Ω)>:
@Lc_1231_twitter for my [HUB server](https://gitlab.com/rebolek/castr/) you need the [IO branch](https://github.com/red/red/tree/IO) of Red.

[8:10:57](#hw5PiFI-07roT81ADY5wtSTT2dH-a5UDX26cAgwflqw) <rebolek (Boleslav B≈ôezovsk√Ω)>:
But it works with SSL certificates nicely

[9:38:06](#poyc4latyhMN_xQYjrLXdj57-tHWtG9bhsvhi6rsrsw) <endo64>:
You can also use Ashley's munge.r which works with sqlite using sqlite commandline tool. It also has lots of useful features.

## 31-Jan-2023

[2:41:20](#VeQuL6O7tknMvzUFpCXVyCZDjJIrjUH7T_MBFpV9PCU) <lylgithub2021 (lylgithub2021)>:
Parenthesis in red playipc two roles.(1)control eval sequence,for example, `if (add 3 5) > 7`, 

here parenthesis must be used, or the code will fail to work.(2)codes only in parenthesis be 

evaled by `compose`.I'd like to know how to keep code in parenthsis(and its parenthsis) to stay 

its condition when using `compose` or `compose/deep` as the followingg example shoowes: 

`compose/deep [[a: (1 + 2) if (a + 1) > 3 [print "OK"]]]` by which I want to get this: `[[a: 3 

if (a + 1) > 3 [print "OK"]]]`

[2:41:50](#rg9r-n1VExcQ2HyMySU7ANlkS2k0x72YvPZzJ3EYOXQ) <lylgithub2021 (lylgithub2021)>:
* Parenthesis in red play two roles.(1)control eval sequence,for example, `if (add 3 5) > 7`, 

here parenthesis must be used, or the code will fail to work.(2)codes only in parenthesis be 

evaled by `compose`.I'd like to know how to keep code in parenthsis(and its parenthsis) to stay 

its condition when using `compose` or `compose/deep` as the followingg example shoowes: 

`compose/deep [[a: (1 + 2) if (a + 1) > 3 [print "OK"]]]` by which I want to get this: `[[a: 3 

if (a + 1) > 3 [print "OK"]]]`

[2:42:46](#bIMD2LraiYCdainybKWGw6fzWkbNGv3lnetFEKJ0gX4) <lylgithub2021 (lylgithub2021)>:
* Parenthesis in red play two roles.(1)control eval sequence,for example, `if (add 3 5) > 7`, 

here parenthesis must be used, or the code will fail to work.(2)codes only in parenthesis be 

evaled by `compose`.I'd like to know how to keep code in parenthsis(and its parenthsis) to stay 

its condition when using `compose` or `compose/deep` as the followingg example showes: 

`compose/deep [[a: (1 + 2) if (a + 1) > 3 [print "OK"]]]` by which I want to get this: `[[a: 3 

if (a + 1) > 3 [print "OK"]]]`

[2:49:07](#qhoqXRa6RocyPyN8WMHUaSuR7dy4HGskU90NLG4jCTU) <ne1uno (ne1uno)>:
`lylgithub2021, to-paren`

[2:55:32](#PZFCHNZPMHW__2_BGM-2r2SpsTQ2VJKvUXJRlUGlPLY) <greggirwin (Gregg Irwin)>:
It's a bit ugly to do, but you can also do it this way:
```
compose/deep [
	[a: (1 + 2) if ([(a + 1)]) > 3 [print "OK"]]
]
```
In fact, it's been such a problem for some people that they thought about how to solve it with a new func: https://gist.github.com/greggirwin/29836d25de0c68eaba0e6dbd268a20f5 many links to old material there, and great research by @hiiamboris .

[3:00:42](#KQlNSLsezeokya-NcEbuAFaTpGsK1ZMCduYZmi4xhlE) <lylgithub2021 (lylgithub2021)>:
Many thanks for your solution and info. And why is the inner parenthesis `(a + 1)` not evaled since the refinement /deep is used? @greggirwin 

[3:01:28](#CzeCm-i8THYoKTMv_P1Jtaxh258sJoJQgTiFt3GxWj0) <ne1uno (ne1uno)>:
sometimes reads a little award but flipping things around can work. `if 3 > add 1 a [print a]`

[3:03:03](#yTiVREe59xfsrDy3uezIWT7uNsesL1o9-Q9XNatNud4) <lylgithub2021 (lylgithub2021)>:
sometimes reads a little award but flipping things around can work. `if 3 > add 1 a [print a]`

[3:03:59](#mWQ3BHQv0EvZNsc6x9cDXslCVj0DJle7yTBNHsVxbpE) <ne1uno (ne1uno)>:
`to-paren [a + 1]`

[3:04:28](#kJ2w6xf1F_dmHChH0qeUlMwxofgUKM6xXryMe_vB5Bw) <greggirwin (Gregg Irwin)>:
`to paren!` is clearer in this case, IMO.

[3:04:43](#kb6kYK76wSkw1C28AhIXDljAqZsPt-gdXdz3CDrlf2o) <greggirwin (Gregg Irwin)>:
It's certainly more clear in the intent.

[3:10:39](#Z_0oaUq8pgKSVuhIVLsXE-pf43WqDKFO-7U3LIz0z4g) <lylgithub2021 (lylgithub2021)>:
@ne1uno Would you please say more about your note? I still don't quite understand it.

[3:13:45](#I8M9tn0DsLluHqKc57hTjyaKwC3e_AzH7lfsItFbg30) <ne1uno (ne1uno)>:
you tried `to-paren (a + 1)` try  `to-paren [a + 1]`

[3:15:02](#M2iWCx2tRD_6NQrROUGc_0ROtDdIrNx3XrbDyOiJUpo) <ne1uno (ne1uno)>:
meta programming is the worst, try multiple things

[3:17:51](#ULvq6iN8oiCMcY27A6moKRhNSyOuvvtYxjpZWuF9Mqs) <greggirwin (Gregg Irwin)>:
The reason it works in my example is because `compose` does not do depth-first evaluation. That is, it sees the paren after `if` and evaluates what is in it, which is a block. That is the result it uses in the output. Because `/only` was *not* used, the outer brackets of the block are not included, only the values *inside* the block. In this case that's a single `paren!` value.

[6:51:00](#n7tH7Rg_c2sI3ccXpWU_j5w4zLyipnLBHmzrQZZ-Cy8) <ProDimSum (ProDimSum)>:
Hello

[7:04:50](#ExPYdUH2Py5dy5k_rP32qlBIhdmm0DshjT8ZHZUzLew) <ProDimSum (ProDimSum)>:
need little bit help here with red/system I am trying to figure out how to do kernel and I am following this https://os.phil-opp.com/ to learn bare metal. Also new to programming world.

[7:06:19](#WtBefwsNik072nHyCnBnfZubET53MS06trdemTRKT2A) <ProDimSum (ProDimSum)>:
any good resource to learn red/system with examples would be nice thanks  

[7:08:18](#yBtxyhHV5YH9CGGGhLlz_ZHQLKd2fXDaiaN5tyZkImQ) <ProDimSum (ProDimSum)>:
one more question how to access files/database over network can not find any examples on google

[9:22:25](#Z0uBL1XLFrkCK0_kenBbWlNpJxKLEaeDzC_0B3JFH9M) <ldci (Fran√ßois Jouen)>:
@ProDimSum. For Red/system have a look here: https://static.red-lang.org/red-system-specs.html and here: https://github.com/ldci/Red-System. You can also look at https://github.com/ldci/redCV which uses a lot of Red/System code. 

[9:27:24](#DPFKQiWc1ie6XDIHDGYtXh7uJpe66fSd8t88rKj32Yw) <hiiamboris (NOT THIS ONE)>:
@ProDimSum ask around https://gitter.im/red/database on database modules

[9:29:26](#u1JJvC5JdcbMj1OXIiSt3teqmnAGyUoCXo5w5SBKyZY) <hiiamboris (NOT THIS ONE)>:
@lylgithub2021 with [reshape](https://codeberg.org/hiiamboris/red-common/src/branch/master/reshape.md) it's straightforward:
`reshape [[a: !(1 + 2) if (a + 1) > 3 [print "OK"]]]`

[9:31:38](#Pqae0NNMx46oL3TQdD6Oaf3t5cGOb-MSlYYHuC_d9mM) <hiiamboris (NOT THIS ONE)>:
though I lately have been looking to replace `!(...)` with `@[...]`

## 2-Feb-2023

[3:33:36](#zxQMLtjRQllqGA0zvx0Mvulbm7ntXyfuMVyTfcky0Ro) <lylgithub2021 (lylgithub2021)>:
though I lately have been looking to replace `!(...)` with `@[...]`

[3:34:26](#ZywiQnE6uH2nLnV1ybDXZ5Q73yDlzOt6O3xZENCE2DU) <lylgithub2021 (lylgithub2021)>:
```
Red [needs: view]
view [
;; 1st
d1: drop-down data [] panel[text react[face/text: d1/text]]
return
;; 2nd
panel[text react[face/text: d2/text]] d2: drop-down data []
do [self/selected: d2]
]
```
I think the first line of code and the second line of code in `view` tell the same thing -- the content of the facet `text` changes with the input in the related `drop-down`. But the second does not work as expected. How to make it work under present facets layout.

[3:35:45](#Nao84TH74qzdIenhGY89jLht34j2uV0XbbeYJJjvEbY) <lylgithub2021 (lylgithub2021)>:
@hiiamboris many thanks for this new idea(`reshape)`!!

[5:08:51](#ZQ1Xe0ZmE-jqX32ctN_sfcp-yneBx1ahjZy2axr1-7c) <mikeyaunish>:
@lylgithub2021  try this: ```panel[text react[face/text: d2/text]] d2: drop-down data []
do [self/selected: d2]
]``` Looks like it was just a typo.

[7:59:00](#oY74k0zgp44T3t1L0CO9vXeSuFX6AELqjlH_cro65xQ) <lylgithub2021 (lylgithub2021)>:
Thank you. I don't find the difference between your code and mine's. In my last message, I said `the second does not work as expected`, that means the content of `text` does not change with the input of `drop-down`(`d2`). So how to make it work under present facets layout.

[8:08:21](#2dRY1HrxLGNNq753UL_cKPCB1iRJYo-asXfa25FX8LU) <lylgithub2021 (lylgithub2021)>:
* Thank you. I don't find the difference between your code and mine's. In my last message, I said `the second does not work as expected`, that means the content of `text` fails to change with the input of `drop-down`(`d2`). So how to make it work under present facets layout.

[8:31:57](#R_rijdTbUuluIb4QEfD4oHVDe9pyr-n0s0HxC1Bgj5M) <toomasv>:
@lylgithub2021 Interesting, it seems to depend on the order of definitions. Not sure if it is intended. This seems to work:
```
view [
   d1: drop-down data [] panel [text react [face/text: d1/text]] 
   return 
   panel [t1: text] d2: drop-down focus data [] 
   do [react [t1/text: d2/text]]]
```

[8:32:02](#D8GuwD5XwDyEhDqPttOH5NFbLGMnN0s6wAj3Otu1JHY) <toomasv>:
* @lylgithub2021 Interesting, it seems to depend on the order of definitions. Not sure if it is intended. This seems to work:
```
view [
   d1: drop-down data [] panel [text react [face/text: d1/text]] 
   return 
   panel [t1: text] d2: drop-down focus data [] 
   do [react [t1/text: d2/text]]
]
```

[8:34:11](#GgXKXPJT4TlzCSPNjJJFuLtnEqSz6I3olX9Awibnu34) <hiiamboris (NOT THIS ONE)>:
Yes. There's no `d2` at the time that reaction is processed, so I suppose it refers to the face created from a previous attempt.

## 3-Feb-2023

[1:11:55](#TSU2G6kmJeYANfjlUyhGArnVADCo56LxoOYem9VOiyI) <lylgithub2021 (lylgithub2021)>:
Thank youu so much @hiiamboris  @toomasv !!

[1:16:27](#VzpGUG3lUN2krVxvC9T7dNTniocQCri13Fd1Uqnnq5c) <lylgithub2021 (lylgithub2021)>:
```
view[
r1: radio "r1"return r2: radio "r2" return
text react [face/text: either r1/data ["r1 yes"]["r1 no"]]
text react [face/text: either r2/data ["r2 yes"]["r2 no"]]
]
```
`text` changing with the condition of related `radio` is expected when running the above codes. The result(the content of `text` and the appearance of `radio`) of clicking `r1` and `r2` is however,  very strange. Any one could try this code and help me with it? 

[5:16:58](#hwdjJsLaYuXYLR8XINM1vjgn14EaZgM2ps8HbqZjUPY) <toomasv>:
@lylgithub2021 I'm not sure what happens there. Ì†ΩÌ∏ü Hopefully @hiiamboris can explain. Meanwhile there is a way to do this for ordinary people:
```
clear-reactions 
view [
   r1: radio "r1" on-change [t1/text: rejoin ["t1 " face/data]] return 
   r2: radio "r2"  on-change [t2/text: rejoin ["t2 " face/data]] return 
   t1: text t2: text
]
```

[5:17:17](#4CktIVOyLM3md-nBPO4t0EbhiY_M4bF9CJSZLsN1IQE) <toomasv>:
* @lylgithub2021 I'm not sure what happens there. :( Hopefully @hiiamboris can explain. Meanwhile there is a way to do this for ordinary people:
```
clear-reactions 
view [
   r1: radio "r1" on-change [t1/text: rejoin ["t1 " face/data]] return 
   r2: radio "r2" on-change [t2/text: rejoin ["t2 " face/data]] return 
   t1: text t2: text
]
```

[5:23:02](#J-MUyEJlyu-oNWWnsXm42skB6_U8-kkAAVAvM00lNSA) <toomasv>:
* @lylgithub2021 I'm not sure what happens there. :( Hopefully @hiiamboris can explain. Meanwhile there is a way to do this for ordinary people:
```
view [
   r1: radio "r1" on-change [t1/text: rejoin ["t1 " face/data]] return 
   r2: radio "r2" on-change [t2/text: rejoin ["t2 " face/data]] return 
   t1: text t2: text
]
```

[5:24:44](#6mpCTFPu0VM1M86nCbZwzbyGP8ZmT_pFI72-Wf2YVXs) <toomasv>:
Playing further:
```
view [
   style myradio: radio on-change [
      i: index? find face/parent/pane face 
      ts/pane/:i/text: rejoin ["t" i " " face/data]
   ] 
   panel [origin 0x0 myradio "r1" return myradio "r2"] return 
   ts: panel [origin 0x0 text text]
]
```

[5:55:24](#8NCXUA5aROafOsHAnd4OJencYHjBaGEbpzLNV5q04kA) <toomasv>:
I guess, this is caused by predefined reactive connection of radio faces, which is broken by explicit `react`.

[6:00:15](#K53LyLQSXtAs5vZCx64I3gzPavsMNWqn5RiNUG_ps8g) <lylgithub2021 (lylgithub2021)>:
Thank you

[6:21:57](#NY5t2f5MAeKgdD4MN6BFBGRZ17jzu_mCnpTB4ME8rEA) <lylgithub2021 (lylgithub2021)>:
@toomasv The reason why I use `react`, not the ordinary way , isÔºöwhen `r1: radio with [data: true] [t1/text: rejoin ...]`, the text of `t1` is not displayed initially. `r1` has to be clicked to view the text of `t1`. Then I have to `t1: text with [face/text: either r1/data [...][...]`. You see, the text of `r1` which I want to display has to be written twice. Coding once is preferred.

[7:11:15](#mnZvNvpClpcfxgvy9gyGjTlIsh9gF0wXBAQrxdXjnc0) <toomasv>:
I see.

[8:59:52](#wnHxxgl45nFBsCyjEbwamkIYFfENu8H6WWer77gAOmU) <toomasv>:
@lylgithub2021 You can reenforce correct behaviour:
```
view [
   style myradio: radio on-up [
      foreach-face face/parent [face/data: false] 
      face/data: true
   ] 
   rs: panel [
      origin 0x0 below 
      myradio "r1" data true 
      myradio "r2" data false
   ] 
   return 
   ts: panel [
      origin 0x0 
      text text
   ] on-created [
      foreach f face/pane [
         react compose [
            i: index? find ts/pane (f) 
            r: rs/pane/:i 
            set in (f) 'text rejoin [r/text " " r/data]
]]]]
```

[10:46:43](#V53fFc-D1DHV9em0_d2MiAHEEHw1N2HGpvdz623PLuI) <hiiamboris (NOT THIS ONE)>:
@lylgithub2021 great find!

[10:47:27](#mDzAUVE4lNzn6Ecjk6Nz-Jq7E5htAlw9dKu1i8I5_l0) <hiiamboris (NOT THIS ONE)>:
‚òù [February 3, 2023 4:11 AM](https://gitter.im/red/red/welcome?at=63dc5f5a747c6938e1fcc68d) this is something @dockimbel must look at, to better understand how reactivity performs in practice

[10:49:03](#IXughs9Zw4SI-kYdHvMnfbVS9cJ9GKaG18w3XbXZhSg) <hiiamboris (NOT THIS ONE)>:
* :point_up: [February 3, 2023 4:11 AM](https://gitter.im/red/red/welcome?at=63dc5f5a747c6938e1fcc68d) this is something @dockimbel must look at, to better understand how reactivity performs in practice, and how hard it can be to debug

[11:37:18](#jp4yABFo_kS8Ka-I53TuVCKThnt5gez1vF2SlszaXRY) <dockimbel>:
* :point_up: [February 3, 2023 4:11 AM](https://gitter.im/red/red/welcome?at=63dc5f5a747c6938e1fcc68d) this is something @dockimbel must look at, to better understand how reactivity performs in practice, and how hard it can be to debug

[11:38:34](#Bs8xFXWmbalMBeSON59fbkwdt15mulgLGcAop1xtUPk) <dockimbel>:
Please open a ticket with that code, so we can study it in depth.

[11:41:45](#wLYGxjoZgaVs-a23-4om45FpJPRckGGeIrHX6Wqv1f4) <dockimbel>:
It looks like an internal (stack?) corruption at first glance.

## 5-Feb-2023

[7:20:21](#iLTHoY5iHg6eAZCcPJjYCTb2kRdmsj06lEMIbbsIjhU) <ProDimSum (ProDimSum)>:
how to compile code for bare metal ?

[7:36:11](#7Cr5e5CNbCy9vw-MUG1U9SFsp3lMGwU4sgvtLmac_XA) <rebolek (Boleslav B≈ôezovsk√Ω)>:
what do you mean by bare metal?

[9:29:30](#-fBanb5RZw1D4h17SXO9vJSICK_ChCHqVsvIboYEyYI) <ProDimSum (ProDimSum)>:
i mean run executable on direct machine 

[9:30:28](#WNoPh6FOETVEtD21eWS_zqFbzAHwMNSANZvrdUwrbmM) <ProDimSum (ProDimSum)>:
i mean run it without operating system i guess

[9:30:52](#h_Km8JLYoFcFf0VXIzHMLMj4apqK_hhccBnJ0dS5LzI) <ProDimSum (ProDimSum)>:
https://os.phil-opp.com/freestanding-rust-binary/

[9:31:55](#ovi42QV9w5nN6w-v6Ht_Cf45_z_9ywcDkctLPIpZFRw) <ProDimSum (ProDimSum)>:
do we have example of making kernel hello world somewhere?

[10:55:41](#bzOne_F5dLrTTj8p9XZnfX4BBPvKGksnuLDNuNGEfPw) <hiiamboris (NOT THIS ONE)>:
you need `--no-runtime` flag when compiling

[10:58:38](#upv2rg3tweTfNvmAuHlMtBS435hFvH3d3C1WREO8bZM) <hiiamboris (NOT THIS ONE)>:
@dockimbel may advise on what compilation target should be used

[13:09:27](#EqV6HKZx6kUm2rd1b4ifWClEmgrL84HseSey0y4wNRg) <ProDimSum (ProDimSum)>:
kernel.reds file

[13:09:29](#f6b1UZqfvEDuwji8yJvOTo9p8DROwMCzkaqfjcKvELo) <ProDimSum (ProDimSum)>:
code

[13:18:52](#tINllz_x6mxaMJO6VNTVqGUUefZcscvnFC1BT8d4TEk) <ProDimSum (ProDimSum)>:
when i use redt -c --no-runtime kernel.red

[13:20:08](#7KtXqcLro_dGFhfPzpfDopFmvxDRGXUoTxKr3D6ZxNM) <ProDimSum (ProDimSum)>:
'code'                        sym: as-integer LoadCursor null sym
                                    ]
                                    SetWindowLong hWnd wc-offset - 28 sym
                                ]
                                true [0]
                            ]
                            word: word + 2
                            len: len - 2
                        ]
                    ]
                ]
                OS-redraw: func [hWnd [integer!]] [
                    InvalidateRect as handle! hWnd null 0
                    UpdateWindow as handle! hWnd
                ]
                OS-refresh-window: func [hWnd [integer!]] [UpdateWindow as handle! hWnd]
                OS-show-window: func [
                    hWnd [integer!]
                    /local
                    face [red-object!]
                ] [
                    if prev-captured <> null [ReleaseCapture]
                    check-base-capture
                    ShowWindow as handle! hWnd 10
                    UpdateWindow as handle! hWnd
                    unless win8+? [
                        update-layered-window as handle! hWnd null null null -1
                    ]
                    SetForegroundWindow as handle! hWnd
                    set-selected-focus as handle! hWnd
                ]
                OS-make-view: func [
                    face [red-object!]
                    parent [integer!]
                    return: [integer!]
                    /local
                    values [red-value!]
                    type [red-word!]
                    str [red-string!]
                    offset [red-pair!]
                    size [red-pair!]
                    data [red-block!]
                    menu [red-block!]
                    show? [red-logic!]
                    enabled? [red-logic!]
                    selected [red-integer!]
                    para [red-object!]
                    rate [red-value!]
                    options [red-block!]
                    fl [red-float!]
                    flags [integer!]
                    ws-flags [integer!]
                    bits [integer!]
                    sym [integer!]
                    state [integer!]
                    class [c-string!]
                    caption [c-string!]
                    value [integer!]
                    handle [handle!]
                    hWnd [handle!]
                    p [ext-class!]
                    id [integer!]
                    vertical? [logic!]
                    panel? [logic!]
                    alpha? [logic!]
                    para? [logic!]
                    off-x [integer!]
                    off-y [integer!]
                    rc [RECT_STRUCT value]
                    si [tagSCROLLINFO]
                    ratio [float!]
                ] [
                    stack/mark-native words/_body
                    values: object/get-values face
                    type: as red-word! values + FACE_OBJ_TYPE
                    str: as red-string! values + FACE_OBJ_TEXT
                    offset: as red-pair! values + FACE_OBJ_OFFSET
                    size: as red-pair! values + FACE_OBJ_SIZE
                    show?: as red-logic! values + FACE_OBJ_VISIBLE?
                    enabled?: as red-logic! values + FACE_OBJ_ENABLED?
                    data: as red-block! values + FACE_OBJ_DATA
                    menu: as red-block! values + FACE_OBJ_MENU
                    selected: as red-integer! values + FACE_OBJ_SELECTED
                    para: as red-object! values + FACE_OBJ_PARA
                    rate: values + FACE_OBJ_RATE
                    options: as red-block! values + FACE_OBJ_OPTIONS
                    bits: get-flags as red-block! values + FACE_OBJ_FLAGS
                    flags: 1073741824 or 67108864
                    ws-flags: 0
                    id: 0
                    sym: symbol/resolve type/symbol
                    panel?: no
                    alpha?: no
                    para?: TYPE_OF (para) = TYPE_OBJECT
                   

[13:21:17](#k64F56-HJ8d6161aHuT4ids1HZM7wBaM-SI37ug1Chs) <ProDimSum (ProDimSum)>:
I get this kind of output is this normal ??

[13:22:05](#Sd3FRbaqS9AQTnsEvgl4XjUEWB1fpaC1JSODvxasVGw) <ProDimSum (ProDimSum)>:
I don't know how to post whole output chat is chopping it all 

[13:41:24](#Hmvm2_QsLYRn5AQf_Z6bFHJ3uVvtI7X6RXmBgGazAcI) <hiiamboris (NOT THIS ONE)>:
gist.github.com

[13:41:31](#55mc6mK00PiyfqU6FxoGzgHWWXgLG0FxHml0DkoUhGc) <hiiamboris (NOT THIS ONE)>:
* https://gist.github.com

[13:43:45](#fpxS87dIzMCeSdOZl6e5xFS1V4e8OdZq4M_bM0l3pcw) <hiiamboris (NOT THIS ONE)>:
Also there's a markdown cheatsheet available at a click to the right of the input line here ->

[13:44:40](#Na791UE838IZf-OIvQOncs2frZbyIbkVxCzBBm_ya9s) <ProDimSum (ProDimSum)>:
https://gist.githubusercontent.com/ProDimSum/c135634c6267df6bd1e7785ec99d8823/raw/3a568ee6177829753be52e53e6ee753d2a8803ee/error

[13:46:13](#U1toOSzPG1Xe-BdGA15vu6fspqFiZRbMm6ulhwqHWKM) <ProDimSum (ProDimSum)>:
https://gist.githubusercontent.com/ProDimSum/c135634c6267df6bd1e7785ec99d8823/raw/3a568ee6177829753be52e53e6ee753d2a8803ee/error

[13:46:43](#DrQfjm_NY78O1gr7_whiahawjARsGIlL8VHWIp0NQFY) <ProDimSum (ProDimSum)>:
https://gist.githubusercontent.com/ProDimSum/c135634c6267df6bd1e7785ec99d8823/raw/3a568ee6177829753be52e53e6ee753d2a8803ee/error

[13:47:41](#EWoxbLOiQdWqcqpaXEPJS3pECORZ1f9uRAqVRkrv6j8) <ProDimSum (ProDimSum)>:
https://gist.githubusercontent.com/ProDimSum/c135634c6267df6bd1e7785ec99d8823/raw/3a568ee6177829753be52e53e6ee753d2a8803ee/error

[13:48:44](#m2VDyBnEPFQ0HmLWW1w-LGlvDWoVWDBHbG-nkJrHKPk) <ProDimSum (ProDimSum)>:
https://gist.githubusercontent.com/ProDimSum/c135634c6267df6bd1e7785ec99d8823/raw/3a568ee6177829753be52e53e6ee753d2a8803ee/error

[13:49:07](#L3xU4Xlh2tv6EBowNJg47I3lGa3St0G6hBIYq-jxI8A) <ProDimSum (ProDimSum)>:
https://gist.githubusercontent.com/ProDimSum/c135634c6267df6bd1e7785ec99d8823/raw/3a568ee6177829753be52e53e6ee753d2a8803ee/error

[13:49:28](#MTUuSNp6OSfrjQ3Y-89GPEY09B6t02-8pbBNyLjv0tY) <ProDimSum (ProDimSum)>:
https://gist.githubusercontent.com/ProDimSum/c135634c6267df6bd1e7785ec99d8823/raw/3a568ee6177829753be52e53e6ee753d2a8803ee/error

[13:50:22](#YjRag34j_ewdHtFkoZmZkBbRqDBfFsNAxHeWRcByuFM) <ProDimSum (ProDimSum)>:
https://gist.githubusercontent.com/ProDimSum/c135634c6267df6bd1e7785ec99d8823/raw/3a568ee6177829753be52e53e6ee753d2a8803ee/error

[13:51:01](#JLIH6ZPGgNHxPaNtO_0Hm6VL05UCqM7SNYTOwK8AYwE) <ProDimSum (ProDimSum)>:
https://gist.githubusercontent.com/ProDimSum/c135634c6267df6bd1e7785ec99d8823/raw/3a568ee6177829753be52e53e6ee753d2a8803ee/error

[13:52:47](#JFlyFnMwMhJfjCBt258dkkxU9n_Fsqb5fRcs5tTFHEE) <ProDimSum (ProDimSum)>:
`Red/System

kernel-entry: func [
    main: func [] [
        console-puts #"Hello World\n"
    ]
    call main
]`

[13:53:41](#tjcmGwm8GsFyckZUUzUDIwOFyjDEIVHdj6PpdgDXL3Q) <ProDimSum (ProDimSum)>:
I can't figure it out

[13:56:33](#wHhX7Uu1myG0cyjPUaKklZxZOgx3o8GDoY0qGTqJifE) <hiiamboris (NOT THIS ONE)>:
triple backticks

[13:58:02](#G0AvwITvMKg_6VYP9ef0gA023zUwdCw38JTROEf41oY) <ProDimSum (ProDimSum)>:
triple backticks

[13:58:27](#zanlJlO1keCoSAzsuO-Xi1qrBWBwdPocwMS7wqD6kjo) <ProDimSum (ProDimSum)>:
triple backticks

[13:59:40](#jaaxnFAWht-D_KTo3anz31c6lfnsFFa5kxQ5P2fIdac) <hiiamboris (NOT THIS ONE)>:
looks like header `Red/System []` is missing

[14:02:15](#gVWFZZMaYpbrLW8onhCmvIXxx-zNUjxp7bAsQx5rfJE) <hiiamboris (NOT THIS ONE)>:
multi-megabyte compiler output is certainly not normal :) you can open [an issue](https://github.com/red/red/issues/new?template=bug_report.md) with *minimal* reproducible example

[14:04:00](#Zh1nhpF1ziiJbDyvxQENo0yvKEQj6EYl0ldoBTXiH7s) <ttamttam (Matthieu Dubuget)>:
No dependency? red-view-28jan23-ec0c31279: error while loading shared libraries: libcurl.so.4: cannot open shared object file: No such file or directory


[14:07:42](#q1rGw8Wl9xc2A_9WvAO5AigHrvP2hlBDWs_3dF54R-4) <ProDimSum (ProDimSum)>:
```Red/System[]

kernel-entry: func [
    main: func [] [
        console-puts #"Hello World\n"
    ]
    call main
]```

[14:08:02](#snRQbRCR4Me2cVPQdF-zzX__sJbmkQm_lZyRe6CflKY) <ProDimSum (ProDimSum)>:
it cuts off Red/System[]

[14:08:09](#1OlyrqLW_ISWffhe7tsa4FADYUnDdeCG77J0YCvfBcM) <ProDimSum (ProDimSum)>:
this line

[14:08:17](#8jnBoYHTXU7qKkog_5UmpAahkIB7eMDg01U7ZxqFtp4) <ttamttam (Matthieu Dubuget)>:
OK‚Ä¶ (*) For Linux 64-bit distros, you need to install 32-bit supporting libraries.

[14:08:33](#lE3XqOlbfqkgd36HX6I-1WDBq4YGf-C0CI8yb7AubZg) <ProDimSum (ProDimSum)>:
OK‚Ä¶ (*) For Linux 64-bit distros, you need to install 32-bit supporting libraries.

[14:11:37](#1v-pTvaWFymdLUkSF7AgjQil-qsAnUdZnIroTB8gIXg) <ProDimSum (ProDimSum)>:
@hiiamboris is my code okay ?

[14:11:44](#IG_Oa_Dk6M77xBX2cFe75NVOiUp0BOucKlOwC6R2B-U) <ProDimSum (ProDimSum)>:
i mean correct 

[14:12:54](#Gme2WFFx7JBq6mwi1keVeuneUQ8pVS4EpiJE5dpdMfw) <ProDimSum (ProDimSum)>:
** Compilation Error: invalid definition for function kernel-entry: nop 

[14:23:48](#ncsMlV-yj_DNLnOlphHsdH1AFaBuI1vW9OMstzzEXFU) <hiiamboris (NOT THIS ONE)>:
idk what is `call` and `console-puts`?

[14:24:17](#EE8jbnGtAY-VooWhNzPCXfM0d5EsS9imESRgsNprlZc) <hiiamboris (NOT THIS ONE)>:
also your string is in invalid format

[14:25:04](#PSsBph949yBmw1gvSg2Ci9PcZI4Qvi1JYaRhwwnmxrU) <hiiamboris (NOT THIS ONE)>:
https://github.com/red/docs/blob/master/en/datatypes/string.adoc#3-literal-syntax

[14:25:57](#VXZFitFZK_QVM1d95wQqr-C9hg3zmcu40OLOmF81Fww) <hiiamboris (NOT THIS ONE)>:
also nowhere in Red/System docs is stated that you can nest functions

[14:26:11](#vx_XTFzsb9neKfN7_JT86u9jCDFUPjJtPkaY_1o6Mxo) <hiiamboris (NOT THIS ONE)>:
https://static.red-lang.org/red-system-specs.html

[14:26:49](#6Ibdc9Wfl4Sf28MkwCvW7NOLUiQYpD2B1wkZKy4Kk9k) <hiiamboris (NOT THIS ONE)>:
and you're missing type declarations for your locals

[14:29:58](#cn1QzkEeAOBY-hVlrmSLNQoZhai0FnnQ197VeKOpy7U) <ProDimSum (ProDimSum)>:
okay I will do it again let me try it again

[14:30:42](#fOrCxIJC9I3UvrybHEWmWqUBrvOp3JthoHTcqhBrpp4) <ProDimSum (ProDimSum)>:
https://gist.githubusercontent.com/ProDimSum/c135634c6267df6bd1e7785ec99d8823/raw/3a568ee6177829753be52e53e6ee753d2a8803ee/error so this is not bug right?

[14:31:00](#jM6kxkvOEpPHcqM1yBKfxNda5F67DW3fvdWbmQWSpfs) <ProDimSum (ProDimSum)>:
do i need to report it?

[14:32:13](#PvHOK_eozC8xYFHRqakuQSwuhQH5IDWbu5niLyA71VM) <hiiamboris (NOT THIS ONE)>:
as I said above it is: ‚òù [February 5, 2023 5:02 PM](https://gitter.im/red/red/welcome?at=63dfb6e6195b0f648282af3d)

[14:34:01](#pZzAncWLEWWiHoEIEGZMKKwM_8Zlyd9eEdG7N_8pARA) <ProDimSum (ProDimSum)>:
okay

[14:34:42](#EncByNLoqhfFO1qHKQCZMhvI8eINsaHclPaTHXOSt3A) <hiiamboris (NOT THIS ONE)>:
make sure you can reproduce it (i don't see that output with your code)

[14:34:46](#h2JyXam6xA4yhIP9KlRQX667ObzLchb_OIWsPy1gUxI) <hiiamboris (NOT THIS ONE)>:
* make sure you can reproduce it (I don't see that output with your code)

[16:24:08](#T57ueobqnLS7b7jrn6b33H_OFgS5C3nhdnv7Y7zmACc) <ProDimSum (ProDimSum)>:
how to ask for help inside gui console to get proper answer?

[16:25:17](#3H9ZGM3k_8PgdVQsJ3X9FfUcxsVGnBBBeBkcK3eSnHQ) <ProDimSum (ProDimSum)>:
lets say I want to know about odbc scheme what approach should I do? 

[16:26:15](#VBTYHrX9BJtn2k8Cuvrtw9IVz4_TnMPt9-os_yzGypo) <ProDimSum (ProDimSum)>:
? odbc No matching values were found in the global context.

[16:26:30](#gO-M-N70gbIybIwbQkJ5F-d9HGIpEfIYXlWSBQ9pxhA) <ProDimSum (ProDimSum)>:
am i doing it wrong?

[16:28:10](#QfG83ez6E0K3YWUzo2ocfjCll02b6_0WLyrTDpHZAT8) <hiiamboris (NOT THIS ONE)>:
have you read https://github.com/gurzgri/red/blob/master/environment/schemes/odbc.md ?

[16:28:42](#y1h4Qd5H890eqZWNNZQdLF5tHb7x-A23SIOAOUKezGw) <hiiamboris (NOT THIS ONE)>:
ODBC is not part of the standard Red runtime, it's a work done by @gurzgri 

[16:33:43](#OlqxZK0kAbHHg83vZhQ0Ly7SdK22OVQTdlB1ciXCw-o) <ProDimSum (ProDimSum)>:
one more question how red is designed? I mean will red not support connections to database directly and we have to depend on community developed scripts ?

[16:35:26](#3nF7fSht5vFYePfU7Dj4glJiyZZfoANNL5QuBQTA_eU) <hiiamboris (NOT THIS ONE)>:
it's hard to say at today's (alpha) stage

[16:35:59](#vtI1Ja5t80fUIaI_jMUga7i70Hpq22yZmk5eCvqTC-s) <hiiamboris (NOT THIS ONE)>:
I think it's likely that ODBC will be a module, that can be fetched and loaded at runtime, as with Rebol 3

[16:37:25](#K7Enbi64HQZb0Z8HZgB198QIdKXMrVB1uy0hX0v7Pe8) <ProDimSum (ProDimSum)>:
yes i tried rebol before red it works surprisingly. 

[16:39:34](#WogO25fH9pN8Alu8X_IxhoJZnHeEHNq1a2k1syV7Ruk) <hiiamboris (NOT THIS ONE)>:
Rebol is a much older and mature tech

[16:42:43](#cxQDinLidP_1xJ7RD7AzvuS56QcBs5nqopF9bkfvwaU) <ProDimSum (ProDimSum)>:
I watched this video https://www.youtube.com/watch?v=-KqNO_sDqm4 and it was 7 years old I thought this will be fun to try after rebol so I wanted to try some kernel programming and I started with rust and red rust have nice community and lot of active people 

[16:45:06](#OYhenDcpjw4cePAFwnCOxRqZwK6NqckMeotKrO8Kc0Y) <ProDimSum (ProDimSum)>:
in that video developer of red mentioned you can create kernel and driver etc but its been a week no single example can not find anything on git or google. looks like dead end to me.

[16:45:06](#DPGJRj9vRomBQ8MmxEI3dEQ6_5CMAqUIj-D5r8yL5EE) <hiiamboris (NOT THIS ONE)>:
sunday is today :)

[16:46:19](#Lj4od2FiQI4_s8_7jbdv4Mb0uICkTQbCY2DgHLltWhA) <ProDimSum (ProDimSum)>:
I get it bro 

[16:47:22](#YVZFDwwjZd6fSwkVOm497gK22CNlvtiy1h_-RiXF_-s) <hiiamboris (NOT THIS ONE)>:
I have heard someone tried making an OS with Red (@beardpower maybe), but I don't remember ever seeing a link to it

[16:48:19](#_87y03Q_cDe2BgxAFDiiIeECD8cTWm1M6982McRw67I) <hiiamboris (NOT THIS ONE)>:
and that's it.. it's not like we're making OSes on daily basis and have a ready hello-world OS :)

[16:48:49](#gahyjVCbB2wbM2lv376ugBko2gHrz0B1dw8Xj-9RKhg) <ProDimSum (ProDimSum)>:
full os really wow i am not that skilled but would love to get my hands dirty. I am very much new to whole programming and tech stuff.

[16:50:23](#rycth1YV8eE7lwCYcCVPaEBw6Ys4PJBSR2yE95IJESQ) <hiiamboris (NOT THIS ONE)>:
OS or driver in R/S is a possibility, like it is in C, but you'll be pioneering it (and seeing that you're a total newbie, it will be a rough ride - be warned Ì†ΩÌ∏â

[16:50:32](#EpwFxdN17TfmDJnkpUUZiBVPoJ7aoDENjST29neWrCA) <hiiamboris (NOT THIS ONE)>:
* OS or driver in R/S is a possibility, like it is in C, but you'll be pioneering this field (and seeing that you're a total newbie, it will be a rough ride - be warned ;)

[16:51:10](#N51PoviBGVx2R6ujrhTO6sDXAUKRroLAw68J47wkcZM) <ProDimSum (ProDimSum)>:
I understand bro but dev was promoting it in that video so I thought lets give it a try.

[16:53:09](#cHibHVSz52KOf1XbOsQcGBxWB9Reev5vj8boaHBERRA) <hiiamboris (NOT THIS ONE)>:
https://gitter.im/red/red?at=62616bec090925231883ed37 see this example to have a start

[16:54:31](#FqNt972lQxEd9kGlADant8F9M6t1mFX2FX9QIE4TeZ0) <hiiamboris (NOT THIS ONE)>:
and I should probably recommend reading R/S manual, but it's aimed at people familiar with the low level stuff, so I don't know how much you will get from it

[16:54:53](#ypDbVq5vKohpwnhGT4xbzHYrqteGZbSmU-Oh6x_8Z3M) <hiiamboris (NOT THIS ONE)>:
* and I should probably recommend reading [R/S manual](https://static.red-lang.org/red-system-specs.html), but it's aimed at people familiar with the low level stuff, so I don't know how much you will get from it

[16:58:02](#aXTgErtQuKxAUJckkiGfNt3ToluEC2vEfXdF4lWb0IY) <ProDimSum (ProDimSum)>:
red --no-runtime -t linux -r "hw.reds"

[16:58:09](#0jDlLnWmtMNVmrAKbivZMpHRDQecZJruZgEY6dOqCac) <ProDimSum (ProDimSum)>:
why target linux?

[16:58:18](#86qGjeUm1xzIO4o8lILs8cYVsQQuZ5yDh7VSDSHAl60) <ProDimSum (ProDimSum)>:
I will try my best to learn.

[16:58:37](#N3JgaWQzkp7gVrbjpduIcxIfNU3b8rmKohN1v_rbBuo) <ProDimSum (ProDimSum)>:
and why in release mode?

[17:01:19](#vYwUZSEu5q4SLkWuf1pN8dahsrT6JY9M-_9HnQo19jM) <hiiamboris (NOT THIS ONE)>:
> why target linux?

I think it was just easier for me to target for that particular script (less code)

[17:01:58](#Zwh4bz3u42CvoAHW37GHMxSUFe7WLrR3m8GzMVmS0Ag) <hiiamboris (NOT THIS ONE)>:
> and why in release mode?

it only matters for Red code, not for R/S

[17:05:34](#10LUPmY0lFsn-0PLc-nJGsnm_5Bc8tAS5jZlDkpQsBU) <ProDimSum (ProDimSum)>:
if  you are using #syscall it does need os right ? if so how it can be freestanding ?

[17:07:20](#FjOzwCV-X4iSWh7HqDQOolsgVnUkgdHwR1Abj3AS6wI) <hiiamboris (NOT THIS ONE)>:
true, that example was using kernel call

[17:08:20](#0wj-cbT3PDzvfhX7BdYJ_Tv0_qhpg3i7yPnWrGFZqEY) <hiiamboris (NOT THIS ONE)>:
I cannot advise you how to program a kernel, sorry

[17:09:26](#0yNUSujQQtX3R3E1tFUz-3nsSgMKsAxEnHxzgU-9dVA) <hiiamboris (NOT THIS ONE)>:
I only have experience working with video buffer that was relevant in old 16-bit DOS times :)

[17:12:11](#3cvgI6fUSd_8UbiyyyfvwyygFdMwQP2qucHwaWd0ej0) <ProDimSum (ProDimSum)>:
I understand bro don't worry. I will ask developer of red. He might able to help. 

[17:12:48](#X2JK1dund6DMpnu_XKkZxRcH3OseAwrCfQfPUDS_SKI) <hiiamboris (NOT THIS ONE)>:
you should better ask web https://searx.be/search?q=minimal%20OS%20kernel%20in%20C

[17:13:09](#-ufNDCoOk392MQBCOS6hAq7CPSTr3MtTk6Ybg12Sioc) <hiiamboris (NOT THIS ONE)>:
then understand what they're doing and translate C code into R/S

[17:21:28](#l0hu8jbSH9zCy-a-r2JkXvj6AqjimMB7agTeEJKRks8) <ProDimSum (ProDimSum)>:
Okay bro I will do my best. But I will still ask dev of red if they have some code hidden in their computer and they forgot to upload on internet.

[17:23:08](#4b2kGP0Na58RwrM3mPdx6OWF2VFeKnj9XjJDWy28Jns) <hiiamboris (NOT THIS ONE)>:
@dockimbel are you hiding the precious Red/OS from us? Ì†ΩÌ∏â

[17:32:18](#Cy0MbmgUWoRgD9zpWRfSBgfaoHT5oW9FYVjGoiZhUmA) <ProDimSum (ProDimSum)>:
@dockimbel Hello sir, I am new to programming world and specially kernel development. If you have any code of kernel that you might have played in past written in red/system kindly upload somewhere on public git to test for user like me. thanks again for your valuable time.

[17:49:24](#9gBMPEJYDCXkQX-A3SV08Gk3JSSgSREIXEY3SH4WpGs) <ProDimSum (ProDimSum)>:
@hiiamboris 16-bit real mode is still needed for intel old pcs 

[21:25:08](#FtrmU6oKuVTGmUYHvmU_B2SNxGo0rKCCLorRlLbTe24) <greggirwin (Gregg Irwin)>:
Yes, it was @BeardPower who did heavy metal work.

## 6-Feb-2023

[21:45:39](#GFVcFOwMuP4jvmLw34UrQDmME5q5vJWHEYrqIXKlnVY) <hiiamboris (NOT THIS ONE)>:
I'll open it

## 8-Feb-2023

[2:30:59](#NqgqJ-TkWApvQbyhWYHeCmQusUmDqBNovP7_ukFxlmA) <lylgithub2021 (lylgithub2021)>:
```
f: func['x][
set x [none none]
compose/deep[radio field react [(:x)/2: face/text]button [probe (:x)/2]]
]
(f test)
```
These codes intends to get a block `[rado field react [test/2: face/text] button [probe test/2]]`, but fail. What's wrong with them?

[2:37:34](#Sjzx1hqvbbVVT0Z-YUz48NFgNQNBmMcsAXbPGz5VVHM) <lylgithub2021 (lylgithub2021)>:
How to open it and where to find it?

[4:41:02](#sQH4smR61PqFCqmalJJ_DqZwEGNk9Ocl6FQp-ZSHgME) <toomasv>:
@lylgithub2021 
```
f: func ['x][
   set x [none none] 
   compose/deep [
      radio field react [(to set-path! reduce [x 2]) face/text] 
      button [probe (to path! reduce [x 2])]
   ]
]
f test
== [radio field react [test/2: face/text] button [probe test/2]]
```

## 9-Feb-2023

[6:21:35](#_x5NnIm5tb2uJaFieQzWPNqbGx25P3avFtYTrph0XPY) <lylgithub2021 (lylgithub2021)>:
@toomasv Thank you so much!!

[8:31:28](#Zf85rKj_xvu2cyFlS34vu1byZ2ufJg5pofOI1lqU4n4) <toomasv>:
You are welcome!

## 10-Feb-2023

[1:48:48](#siH65E2wTI3lz0FRu-1HgueB-ENsCxfzIBdZG7SquyY) <lylgithub2021 (lylgithub2021)>:
```
a: ["b" "" " bb"] ;; three elements in block
remove/key a "" ;; remove blank string ""
```
I think the block `a` will change to ["b" " bb"] after running the above code, but actrually I just get `["b"]`, `" bb"` is lost. Why?

[2:01:52](#5sniVnvVLu6a5mzqvdGA4x7917Y-gv0wVYA-TwqSh2Q) <lylgithub2021 (lylgithub2021)>:
I also tried `remove -each i a [i = ""]`. Still not the result expected.

[2:02:01](#fuHoyvdRoQ2iC9N5R49WHQMDhUXOjK9n_Vpbass2cXM) <greggirwin (Gregg Irwin)>:
`/key` is for map use, but also works on blocks, though it doesn't treat them strictly as a key-value structure. That is, there is no implied `/skip 2` when `/key` is used on a block arg. Think of it as `find+remove/part 2` removing the key it finds, and the value that follows.
```
>> a: ["b" "my-key" "my-val" "" " bb"]
== ["b" "my-key" "my-val" "" " bb"]
>> remove/key a "my-key"
== ["b" "" " bb"]
```

[2:03:28](#1RTPQwe1QF5PMSg6vgIHIewwcqfjg6-j6TjCZFKxOMU) <greggirwin (Gregg Irwin)>:
`remove-each` does work as you expect.
```
>> a
== ["b" "" " bb"]
>> remove-each i a [i = ""]
>> a
== ["b" " bb"]
```

[2:09:53](#Gofo23bGJ6hr30VkULQobnQURlZew1P59CLurwn8nxk) <lylgithub2021 (lylgithub2021)>:
@greggirwin OH, many thanks!! I think no examples in `? remove` leads to wrong understanding of this function(and the learning of `Red`).

## 11-Feb-2023

[16:48:45](#tXai1qYYxRionVp_T4zTuDdKsProD90izo44CJfmEEo) <ProDimSum (ProDimSum)>:
how to do this https://wiki.osdev.org/GCC_Cross-Compiler with red/system?

[16:50:40](#_MHzciNVj-FMG_Hg53GHV4pEd1HSZUkU0y9IGajXVnc) <ProDimSum (ProDimSum)>:
@hiiamboris thanks for mini kernel link in C now I know more about asm and bootloader

[16:51:54](#OZAN4tU0OVN0lGUn47XCxvwe40DO6hJIavpHBd1OLKY) <hiiamboris (NOT THIS ONE)>:
> how to do this https://wiki.osdev.org/GCC_Cross-Compiler with red/system?

`-t` command line option

[16:57:53](#Z8jYsN0RnTJb6OwIZeTdSNShkOWLnPGIrnDQVqRhXXo) <ProDimSum (ProDimSum)>:
that article is about compiling GCC without standard libs and headers. I am asking how can I do that with red/system?

[16:58:03](#0BChXNvgCzBGY_7mAdrQiB4nJM2roFCEdkeco1_RrC0) <ProDimSum (ProDimSum)>:
or -t will do it for me?

[16:59:04](#UcCJ3o4sgB1Br69xUOtnBetGRykTthnY5CsidnN00JA) <hiiamboris (NOT THIS ONE)>:
`-t` cross compiles to a different platform

[16:59:13](#2JKcFvtX1ZInNiAfJqtWu_VngGpXrNjeKtM1SyngYgk) <hiiamboris (NOT THIS ONE)>:
`--no-runtime` leaves out standard lib

[16:59:28](#8P_y__VvtOlY3mf5-djvb1iC0LBtOICOeTMa7a0gcAE) <hiiamboris (NOT THIS ONE)>:
in `--help` you can read all this :)

[17:02:03](#n6WBz7ssaPCrWOaiHeAgWVWeYHiZEDRivjbLuD--eDg) <ProDimSum (ProDimSum)>:
so you saying I do not have to go thought that GCC method cool lets try

[17:06:09](#La2zfB72tx_oD3S2sgGLqxh7sV_sXH8iyNpmFI6DcDQ) <ProDimSum (ProDimSum)>:
I am bit confuse with two red version CLI red and redtoolchain 

[17:06:29](#w4P_3QpDuM4GowLVozo_sVLw4CCyPp9RGVxEM8P-Tug) <ProDimSum (ProDimSum)>:
@hiiamboris does both include red/system ?

[17:07:24](#-AZK2co32250t0eYJ4Dn_661W8oEus6Gc4fZmfEQcv8) <ProDimSum (ProDimSum)>:
or just toolchain one ?

[17:07:43](#GXryfbj-zBd--dn5XPfMSQxswnRjMEe2Be5T-JpDywc) <hiiamboris (NOT THIS ONE)>:
toolchain is the compiler, it compiles Red and Red/System code

[17:08:07](#j0XCsYqBBWZzIZyBM4d55VfRF3JsmaMTcBLHjmbwUwA) <hiiamboris (NOT THIS ONE)>:
other binaries are compiled interpreter+consoles

[17:08:20](#vemTX8FJAwbpaW2gQfZFILTKBSWgiTgz4NaERCeQ6EQ) <hiiamboris (NOT THIS ONE)>:
is it not written on the download page?

[17:08:44](#JKumu1zQfR9deeMdseTP7v0xgoJlv_23-f1HvU_gRRQ) <hiiamboris (NOT THIS ONE)>:
see also this file on cross-compiling https://github.com/red/red/blob/master/system/config.r

[17:09:04](#ON2fYtVywgjWgnsnVNKsWC8VHeNWdeHSQ0MWRfHslG8) <hiiamboris (NOT THIS ONE)>:
basically since you're not targeting an OS, only `target:` option concerns you

[17:09:44](#XageqUQNpVPwLazuuDzZb5x9rXVGWE43ZXWG-iNTg74) <hiiamboris (NOT THIS ONE)>:
however I don't think Red has builtin emitter for raw binary (not wrapped into an OS `exe` format)

[17:10:13](#DgMTkaZtJ0revfRmHmdOXfVSicaGD5Uc4kVmmZbSe9c) <hiiamboris (NOT THIS ONE)>:
@dockimbel will have to say if it's possible to hack one quickly

[17:10:22](#4ileJ-LFJzzo7VjrrhXB3v-t_DYVoKanJeQycKbIFo8) <ProDimSum (ProDimSum)>:
so no object file? like c

[17:11:25](#3EZ0K1aoaoCcPsbRqWUtMPOp9IGyaIXMcWz9dO7xXxs) <hiiamboris (NOT THIS ONE)>:
nope

[17:13:25](#DLoP0K2fmG5rEpTiRWLsGKzx35jI0ymQ_Fytdt4LdD8) <ProDimSum (ProDimSum)>:
@hiiamboris what I am doing right now is using .asm file to create bootloader and use nasm

[17:17:05](#zElvLiBgsNJ6n57zagsLYfmSji0pIda9lyB04bFH4mo) <ProDimSum (ProDimSum)>:
.bin file too

[17:30:15](#LmIyZlwj-W3ZKsoZRXxeAV6qqeYfHVwjKVQhjhckDnc) <ProDimSum (ProDimSum)>:
lets wait for @dockimbel or @qtxie or anyone who knows how to? 



[17:31:29](#UWE7YRhrpySZlI5b8tjCsLE-27KyrKDSZY9yJQiDsdY) <ProDimSum (ProDimSum)>:
I will continue my practice with osdev @hiiamboris thanks for your support.

[17:32:11](#33UwUUht2nFD3y0k_kt6x7Gd3JTHduPOdmo6foWkNw0) <hiiamboris (NOT THIS ONE)>:
you're welcome 

## 13-Feb-2023

[0:51:14](#cydxoCOFVWUAbTeuwRwKoCdOuQYAGIatK-phs8XgY98) <lylgithub2021 (lylgithub2021)>:
HI,  I wonder if there are methods to consturct a string with given length(6 for example) whose value, "ABC" for example, is in center positon, with white blanks equally spread at left hand and right hand (`  ABC  `). Or that is to say, how to output half white space in Red?

[0:52:52](#94vsPqePS94zkDDB-PwqY9Dfvs8WbJAeI9NZqhYXzoU) <lylgithub2021 (lylgithub2021)>:
* HI,  I wonder if there are methods to consturct a string with given length(6 for example) whose value, "ABC" for example, is in center positon, with white blanks equally spread at left hand and right hand (    ABC    ). Or that is to say, how to output half white space in Red?

[0:59:46](#6a1V6z62p8ZhBXGOimHU7YTkC7dpByD8VEdYp_tKKfE) <ne1uno (ne1uno)>:
`? pad`

[1:06:42](#5viFLMuE57HQ1pHjZquaT5yvNVxKARw3VR5Kg013H7Y) <lylgithub2021 (lylgithub2021)>:
Thank you @ne1uno ! Seems that `pad` only receive integer number. It can not give 1.5 character(for my example).

[1:11:59](#JGy4iiXFYNrB0BmGBK2xwa2e1h76lgtXIuGHyFan_EQ) <ne1uno (ne1uno)>:
not sure there is a one step answer. pad/left pad s n1 n2, you decide n1 n2 .  append/dup copy " " n, then insert s is another way.  there are various format experiments that may justify center

[1:16:20](#GKSnUTs5CoubjbPWQymaYDpGgYZYEDT2UAibcS0eqYg) <ne1uno (ne1uno)>:
`head insert at append/dup copy " " " " 10  5 "ABC"`

[1:18:49](#pC6_2HT25IT0gH3OQfHx8NDkQwln1u4K-l8IJpSaXds) <ne1uno (ne1uno)>:
`head  pad/left pad  "ABC" 7 12`

[1:27:17](#UJ__3_AEeqHxEPpJH8vlWH9pmPzGShjf4niTZ8tPC6I) <lylgithub2021 (lylgithub2021)>:
Thank you for these wonderful solutions! And in my example, the final string is fixed with six. The length of "ABC" is three. If "ABC" put in center positon is expect, then the white space of left hand/right hand of "ABC" should be with a length of 1.5. So, how to get this half of whit space in Red(because the final length of the string is fixed)?

[1:28:28](#b1BTKpx2x-_Uw-P2YJKwR6ZR_poQdKltMWnIXo1USS4) <lylgithub2021 (lylgithub2021)>:
* Thank you for these wonderful solutions! And in my example, the final length of the string is fixed with six. The length of "ABC" is three. If "ABC" put in center positon is expect, then the white space of left hand/right hand of "ABC" should be with a length of 1.5. So, how to get this half of whit space in Red(because the final length of the string is fixed)?

[1:28:50](#zLfPSLR5XH-EnO8L_2whuaKkVZA-t_YCxoNWVPj7YDk) <lylgithub2021 (lylgithub2021)>:
* Thank you for these wonderful solutions! And in my example, the final length of the string is fixed with six. The length of "ABC" is three. If "ABC" put in center positon is expected, then the white space of left hand/right hand of "ABC" should be with a length of 1.5. So, how to get this half of whit space in Red(because the final length of the string is fixed)?

[1:29:09](#0KNj8YRHEkasJt-a3fBz4QLSlMmxTesmDBTBHbNzPQY) <lylgithub2021 (lylgithub2021)>:
* Thank you for these wonderful solutions! And in my example, the final length of the string is fixed with six. The length of "ABC" is three. If "ABC" put in center positon is expected, then the white space of left hand/right hand of "ABC" should be with a length of 1.5. So, how to get this half of white space in Red(because the final length of the string is fixed)?

[1:32:10](#zpSVHeevZM9PC0fMSW0m3Hz0ZTZNOHHh5pA9dB_MuJI) <ne1uno (ne1uno)>:
pad not accepting float or pair a bug & a wish

[2:25:04](#2xjKblQXmOhs_aqADjlfgT23Sq_d1iQWPMotHFuSHmA) <greggirwin (Gregg Irwin)>:
You can't pad to half a character. Th choice is where to put the extra space, left or right.

[2:25:21](#T_pHUAM9aQR31sBv6Sy0rkHnajcvv2uMZC9wO1Lq3f8) <greggirwin (Gregg Irwin)>:
```
	set 'align function [
		{Justify the given string to the specified width and direction}
		s  [any-string!]  "The string to justify"
		wd [integer!] "The target width, in characters"
		/left	"Left align the string (default)"
		/center "Center align the string" 
;			{Center justify the string. If the total length of the padding
;			is an odd number of characters, the extra character will be on
;			the right.}
		/right	"Right align the string"
		/with "Fill with something other than space" 
;			{Allows you to specify filler other than space. If you specify a
;			string more than 1 character in length, it will be repeated as
;			many times as necessary.}
			filler [any-string! char!] "The character, or string, to use as filler"
	][
		if 0 >= pad-len: (wd - length? s) [return s]	; Never truncate
		filler: form any [filler space]
		result: head insert/dup make string! wd filler (wd / length? filler)
		; If they gave us a multi-char filler, and it isn't evenly multiplied
		; into the desired width, we have to add some extra chars at the end
		; to make up for the difference.
		if wd > length? result [
			append result copy/part filler (wd - length? result)
		]
		pos: either center [
			add 1 to integer! divide pad-len 2
		][
			either right [add 1 pad-len] [1]
		]
		head change/part at result pos s length? s
	]
	e.g. [
		align "a" 10
		align/center "a" 10
		align/right "a" 10
		align/with "a" 10 #"*"
		align/center/with "a" 10 #"*"
		align/right/with "a" 10 #"*"
		align/with "a" 10 "._"
		align/center/with "a" 10 "._"
		align/right/with "a" 10 "._"
		align/with "a" 10 "+________+"
		align/center/with "a" 10 "+________+"
		align/right/with "a" 10 "+________+"
		template: "+________+"
		align/with "abcd" length? template template
		align/center/with "abcd" length? template template
		align/right/with "abcd" length? template template
	]
```

[3:48:24](#c4REUupLpnvAehct1Jgnm4hCbtVpSHkwYXzZdQMPetc) <lylgithub2021 (lylgithub2021)>:
@greggirwin `align/center "A" 2` seems not at center

[4:48:19](#V1xege5aenYydFiZ2_jyvScVRCCURrZuzWcIxFXH0YM) <toomasv>:
Use thin space (`^2009`), but mind font too :)

[5:19:54](#GLY0Ra_c4PRK-EHQiseh90MnT7z6ppyxtgKFaVTztWM) <greggirwin (Gregg Irwin)>:
@lylgithub2021 what result do you expect? There are only two character slots and you give it one character. This is not font rendering we're talking about, but string characters. For rendering, VID has a `center` facet for faces that support it.

[7:08:02](#TdMSBg9s_3dzZjU1keJsfoAQ-37o_XRn9lVan48IuCc) <qtxie>:
> @hiiamboris what I am doing right now is using .asm file to create bootloader and use nasm

You can compile R/S to Intel HEX format. I'm not sure if it's can be used for bootloader. https://github.com/red/red/blob/master/system/formats/Intel-HEX.r

[8:41:19](#zypU23QQX65-j4CTs8Xtb6VwETT49lg1gbM8Ty8Ij-g) <lylgithub2021 (lylgithub2021)>:
@greggirwin  @toomasv My intention is to construct a string containing half of the charactor `white space`. Seems that this is impossible in Red.

[9:11:18](#OdIbapsrNpUz8C0ML6poMNd1JRPWikcwWOpsiDs30rk) <hiiamboris (NOT THIS ONE)>:
Good luck with that.

[9:15:41](#IvwRICmPwjQ3ub8J65pHgCvtMwnY0RzRCO0O1Xr2bPk) <hiiamboris (NOT THIS ONE)>:
But maybe the problem is your keyboard? If there was a "left half of the space" key and "right half of the space" key, it would be much easier, right?

[9:17:09](#YB5Q_vRTIiIc3DGa7aF7YWJuTou5-G8T5ECMW7S4YE4) <ne1uno (ne1uno)>:
you can fake kerning a little finding the width of particular font and text,  absolute positioning.  good chance nobody will notice

[9:55:35](#qa6o7qYrf2AQl2auytM_GxLuNv3gyRvY_237kEG0wpY) <hiiamboris (NOT THIS ONE)>:
@lylgithub2021 try finding one of these if they work? ![](https://overclock3d.net/gfx/articles/2011/04/06171952302l.JPG)

[13:02:30](#FzBrEKvE1waDSOT9TURsP5PysxcwPM2T6e9R1vg6ukQ) <BobBagwill (Bob Bagwill)>:
Good afternoon, to those of you on International Atomic TIme (TAI).  How many people are working full time on redlang now?

[13:15:11](#8KnIQFi_uIM1WzMiTqhhMe9Q5i0DZWpMBF1TtXoy64g) <hiiamboris (NOT THIS ONE)>:
hi @BobBagwill, you know how to choose your questions :)

[19:06:19](#xAySWloGcFlHQznY972bpatWlEMlxTiGK_3qcV1n22s) <greggirwin (Gregg Irwin)>:
> My intention is to construct a string containing half of the charactor white space. Seems that this is impossible in Red.

It's impossible in any language that uses character-based strings. When you find a lang that doesn't do that, let us know. Maybe Wolfram can do it symbolically. ;^)

## 14-Feb-2023

[7:18:37](#C0OiNi9oXX9nA1_k9CoOlyNPfr9bEchrEIvqqqqUd8Q) <bubnenkoff (Dmitry Bubnenkov)>:
Sorry, but where is old logs? In red/help I do not see latest posts

[9:25:14](#ACzunERBPSVk6CGU-D4HjE9YnJiIV1nywQ381ZgzGIo) <hiiamboris (NOT THIS ONE)>:
https://matrix.to/#/!wUTlqkqOhNGtfQzIsO:matrix.org ? History is there for me

[9:27:46](#jMZRweL_tcF3QgBaerb3YR2e8jcPoyk9oJDxWMkw_x8) <ProDimSum (ProDimSum)>:
Your account has been flagged. my github wow Ì†æÌ¥™ after creating two gist 

## 15-Feb-2023

[3:11:07](#5Oohu_m953ZpaIjU5VE5OQZilDYuczGkkbOcyXsEGbw) <lylgithub2021 (lylgithub2021)>:
Your account has been flagged. my github wow Ì†æÌ¥™ after creating two gist 

[3:15:50](#dU69dURu-rYEXdHihLfMOUn6emHSF0cZhpOtLpuZzaU) <lylgithub2021 (lylgithub2021)>:
```
f: function[x][unless value? 'b [b: "bbb"] probe b]
f 1
```
Running the above code, `"bbb"` is not printed as expected, but `none`.  Why and how to get "bbb"?

[6:22:56](#nBvuBil3_DfueYTgjYSJ7odan7PvAsb3Wc3U2hkMX50) <lylgithub2021 (lylgithub2021)>:
I mean why b is not given value?

[9:04:20](#E22IxUTF3apEVP1Iye0TVN-wdssmzDaOT6s4Ltg2T7E) <toomasv>:
lylgithub2021 (lylgithub2021): `none` *is* value. `b` is set locally to `none` because you use `function`. Compare e.g.: 
```
f: function[x][unset 'b unless value? 'b [b: "bbb"] probe b]
```

[10:15:33](#ZegA8r6r5SsXlU2MVUz-Gu0jF0f6Sx0c4F-fc_ce8t4) <ProDimSum (ProDimSum)>:
how to check like list of supported datatype in red tool chain 

[10:16:42](#d9qMbt_6qzO6Xl8yIojaQzjos4D8upbbNYzdvq9_xAg) <hiiamboris>:
there are no "toolchain datatypes", only Red/System datatypes and Red datatypes

[10:17:15](#w0BXtWLz4W2jLzBhnpwxaJTSTjT1Rh2OGOnWsOLAviQ) <ProDimSum (ProDimSum)>:
okay my mistake red/system data type

[10:17:33](#vm3xD47sNWhrtD7D-fxoSccKFWHI5i4NxHFbEjmQCds) <hiiamboris>:
all documented in the places I linked you already 
https://static.red-lang.org/red-system-specs.html#section-4
https://github.com/red/docs/tree/master/en/datatypes

[10:17:44](#OfZQFf8maG-jRpWn5YbeQMoJb49D2IxcndiBnewNB9A) <hiiamboris>:
* all documented in the places I linked you already 

https://static.red-lang.org/red-system-specs.html#section-4

https://github.com/red/docs/tree/master/en/datatypes

[10:18:00](#yk2CO_RPwe_acW3VmAzMeEVdV41p9RqNcMQryUdgBtE) <ProDimSum (ProDimSum)>:
https://github.com/red/docs/tree/master/en/datatypes this have red datatype but can i ask red toolchain

[10:18:43](#qpfOOTLOt3QfEqNW08gKxaBtLo_M6pIQ5AHVZwgFXWc) <ProDimSum (ProDimSum)>:
not like that 

[10:19:55](#cF8WEhv1o85GsiGa7VvNvqpLKJx_5ZLIL6QlQDdzhQ0) <ProDimSum (ProDimSum)>:
when I open cmd and do redt -c program.reds

[10:20:21](#0cd-zHWzuPGmTaSXveXdBQ4cfOgvEl2r49iPBTnSJ_Q) <ProDimSum (ProDimSum)>:
when i say redt only it prints help doc

[10:21:36](#AkL953eAWDeWEaf-hWS944wQ7Pt08wiyPkiMGiNnwCw) <ProDimSum (ProDimSum)>:
red cli have terminal where i can ask with ?

[10:21:54](#_3GBox9pxcu3saCgElUWQK1jQqG3qU4JNqufN7eX6Xo) <ProDimSum (ProDimSum)>:
how can i do that with redt 

[10:22:03](#KCPWHatLWwdc3WeWpt25Iag-ofnVaPtK6hyB8fx3nYw) <ProDimSum (ProDimSum)>:
i mean red toolchain

[10:26:20](#iLkxzRscOmzpNF4rI0GshuLDoY9nXqAi9tKZKl2ze40) <ProDimSum (ProDimSum)>:
I don't think there is any option like that in red tool chain go through doc i guess

[10:26:41](#3d-AOSyrbhvYxLAZyzdfnxJrUVKgE-YSLEZrQumXEO0) <ProDimSum (ProDimSum)>:
good night guys

[10:36:39](#4kAaw8bnwYMcEmBSAtvdXtMJ07fUGDcsz41_XxXXPcY) <hiiamboris>:
of course, who would embed websites into a CLI tool :)

## 16-Feb-2023

[0:54:57](#tYhukyeK4leDAf6tQ-mgVMKgmTzdVHMIo1ITsRFSXPE) <lylgithub2021 (lylgithub2021)>:
toomasv (Toomas Vooglaid): Thank you! And, outside function, running `:b` will cause error because the variable `b` has not been defined. But inside function, `:b` will get `none` though it has not been defined in function. I don't understand why is such a logic?

[6:33:41](#Rbc_UsNdwM_PI9aKM5OPQ_kltLfDko1oKPZqlt3yazc) <dsunanda (dsunanda)>:
lylgithub2021 (lylgithub2021): 'b is defined in the function. FUNCTION is a wrapper for FUNC, and defines all SET WORDS it finds as local. Local words have an initial value of NONE:
```
source f
f: func [x /local b][unless value? 'b [b: "bbb"] probe b]
```
Try this to define your function in the way you (probably) originally intended:
```
f: func [b][unless value? GEY/ANY 'b [b: "bbb"] probe b]
```

[6:50:51](#C0KnQAHHqbddf3ekYRMaIMk-m-Oc81Aq_AzgKL0nY60) <toomasv>:
lylgithub2021 (lylgithub2021): Also, docs are your friends: https://github.com/red/docs/blob/master/en/datatypes/function.adoc

[6:55:39](#uyHVT8UjRjZWk_LdgYb_Y7n5d3RoCWYxXiIjegAY39c) <ProDimSum (ProDimSum)>:
do we have debugger software or what kind of too you guys use and recommend 

[6:55:58](#P46GotNU41wXypraK9Opv8fT7eIusr_pfVb0Q1yRGbA) <ProDimSum (ProDimSum)>:
 * do we have debugger software or what kind of tool you guys use and recommend 

[7:03:29](#O9zp-cZE-xmy2wUn3yJEcu_N3bV04vWFr1yNY5kZee0) <toomasv>:
ProDimSum (ProDimSum): Again, [docs](https://github.com/red/docs/blob/master/en/interp-events.adoc#debug) can help, and then I'm sure you'll find some tools in @hiiamboris [mezz-warehouse](https://codeberg.org/hiiamboris/red-common).

[7:08:37](#EDmNc_uCcp3pbGHHFoHvSmKlWBmToYZofOPTT6aIcZA) <ProDimSum (ProDimSum)>:
toomasv (Toomas Vooglaid): will that work with red/system?

[7:10:00](#3kPMNw4c12DzSuAoUBEv5r850zBeOxwMwsXhlXedh4Y) <toomasv>:
ProDimSum (ProDimSum): I've not worked with R/S much, so wait for some more knowledgeable... or just try it out.

[7:10:43](#HAvIyouIyCUz7TL_U_sO1hlKWQeDJHh6e3b-wiiEtho) <ProDimSum (ProDimSum)>:
i will try it out

[7:11:08](#qlPhgC_eCc2KMdrSkRNwNlf40jcfnS1nRWGzPB4pAQg) <toomasv>:
Ì†ΩÌ±çÔ∏è

[7:23:10](#x5Jol-rnOY9LRVeJcZxdmzErgWW3qwdFzQ_y4vIqebY) <ProDimSum (ProDimSum)>:
is Integer! signed or unsigned ?

[7:32:10](#rTrgYCpAozizkbev0mexJhfxvUcbzpf-LIVqbMG6CXc) <dsunanda (dsunanda)>:
Integer! is signed:
```
0 - (to-integer (2 ** 31) - 1) 
== -2147483647
```

[7:33:08](#ofp_N7SPuhQpkjRstx92SDklff0BcTF23uUE8YMsVuU) <ProDimSum (ProDimSum)>:
thanks dsunanda (dsunanda) 

[9:19:26](#UDyRDdqYvgUtujCJCf3YevFA6JfC1JiEIiv44bZgq6s) <hiiamboris>:
> <@prodimsum-63d8ba206da0373984bda871:gitter.im> do we have debugger software or what kind of tool you guys use and recommend 

print, probe, ??

[9:24:09](#mhGqzJnOfG681bfRGir07dkHXIyLRBOWsE18R33ejyY) <rebolek (Boleslav B≈ôezovsk√Ω)>:
:)

[10:40:41](#KVF-oTd9e7zUp-L0YVVRuvXg4znLo13RNwl4bhJXLts) <henrikmk (Henrik Mikael Kristensen)>:
```ask``` is very nice too as a step by step debugger

[11:28:01](#ABcr9QSkU5RZJQSEkJlyckMMufWubsNWWAJ-lwM5F0o) <hiiamboris>:
not in R/S

## 20-Feb-2023

[6:06:16](#uVvJg7tp_N6TwiQJ8L0OVzeHeg3367EVBl_Ic2nOWIU) <lylgithub2021 (lylgithub2021)>:
```
a: [[1 2][3 4]]
collect [repeat i 2 [keep repeat j 2 [keep add 1 a/:i/:j]]]
```
This code intends to get a block `[[2 3][4 5]]`, but actrually get [2 3 4 5]. Why?

[6:09:02](#yYWSuelNLSA_8frHwIX_3PvrLO3SSSQZ-3aCDDM1Zi0) <lylgithub2021 (lylgithub2021)>:
 * ```
a: [[1 2][3 4]]
collect [repeat i 2 [keep collect [repeat j 2 [keep add 1 a/:i/:j]]]]
```

This code intends to get a block `[[2 3][4 5]]`, but actrually get \[2 3 4 5\]. Why?

[7:49:50](#N5bLJJGOHH1j7pVi-DUEP33eyW9oq7ZF1b_IHbJEX9s) <toomasv>:
lylgithub2021 (lylgithub2021): `keep/only`

[13:18:04](#qp3DBwwm1qPFxZfi0U4dNpisBM93QBjR00U7F2GwwQ0) <lylgithub2021 (lylgithub2021)>:
I tired `? collect` and `? feed`, not find any description about this refinement `/only`. Where can I find it?

[13:21:32](#nRxP_GGWtIcGx9xQIE2ZUU7MuYGsDW53qkWaBrFsBHw) <hiiamboris>:
`?? collect`

[13:27:35](#VZamGpHoeaw-U89meqCc1PzGMJBsO41zSUMNLJLHObo) <lylgithub2021 (lylgithub2021)>:
hiiamboris: toomasv Many thanks for this!! It hides so deeply that makes the learning curve so steep!

[13:38:05](#AIwF8TTfir7jCXTu4Tdm0jNjMSYeit2bQ5U_LDKiLqY) <hiiamboris>:
I agree

[13:38:15](#X7CFqGls6DebPkBIMeyZCFG8-w2uU_hBoBC-GLVaWUE) <hiiamboris>:
`keep` should be global IMO

[14:06:44](#faeVHwHCYk3xSpDm_gkyyFHecOwW1HKb7V26cXDZW34) <dockimbel>:
> <@hiiamboris:tchncs.de> `keep` should be global IMO

How do you see that working?

[14:07:38](#ACx5hmP_AnXdrZB9BWspMWozavG4RpZWVd-kCpghoTs) <dockimbel>:
> <@hiiamboris:tchncs.de> `keep` should be global IMO

 * How do you see that working?

[14:14:06](#C2VpQzJn5CjAv6EudceidoAysjl4FCHnojDo3l30EJw) <hiiamboris>:
in interpreted code it's rather easy: `keep: function [value /only] with :collect [body...]`

[14:16:35](#DYV3ER9t-7U9wLZIH2qwulc_YPmZd9GwttfSdmha-8A) <hiiamboris>:
but there are two reasons I don't make a PR:
- there should be a R/S-level collection mechanism shared by both Parse and `collect` mezz, otherwise they can't be mixed
- https://github.com/red/red/issues/2189#issuecomment-833604464

[14:17:40](#9qN70nNeZ76N0Wze1gzRNoQ_2IjUCgUx3CCccXcCdbo) <hiiamboris>:
in other words I see any mezz-level collect as half-correct half-measure :)

[17:21:58](#NUIH7avDNxV0xHIAOcneMVWibUofAJeQ7tvAg0WiZ1o) <gurzgri>:
> <@lylgithub2021-606ac7e76da0373984794a36:gitter.im> I tired `? collect` and `? feed`, not find any description about this refinement `/only`. Where can I find it?

As hiiamboris advised to study the source code, or do `collect [help keep]` to get (spartanic) help on `keep`.

## 22-Feb-2023

[7:43:59](#5oh3msVt5jEJ3nigX8pTDag4voJPZBPZf2HAx8JWFoM) <lylgithub2021 (lylgithub2021)>:
gurzgri: Thank you for your advice!

[7:45:30](#ryvEklOmayz5WdVLyEUjj6lkwse6xjY5RMerYdTI_jI) <lylgithub2021 (lylgithub2021)>:
```
view [
button "timing" [while [true] [if now/time = 15:22:00 [print "on time" break]]]
button "others" [print "do something else"]
]
```
I wonder if there are methods by Red to do something when an appointed time reaches, meanwhile(during the wait) the procedure can go on doing other things, as I tries in the above codes. It does't work as expected. If the button "timing" is clicked, the codes can do nothing(the button "others" doesn't react to click on it) except waiting, until to the given time. Any better idea of this?


[7:57:03](#_THmf4VkfnFFrgKAcJu5--y5BDDeZYaNUaycmYvu81U) <Oldes (@oldes.h:matrix.org)>:
You are creating a busy loop in your code which is something you really don't want to do! You should probably setup a face with `rate` which would fire `time` events in some interval and work with these.

[7:57:31](#tqTzxL8DsBGvo1Q5KFBZe4cs9CHS-eeiq5okn63qJF0) <dockimbel>:
```
view [
button "timing" [while [true] [do-events/no-wait if now/time = 15:22:00 [print "on time" break]]]
button "others" [print "do something else"]
]
```

## 23-Feb-2023

[1:46:32](#E6WIfQTaW9KU10JRWkr_v8EIgEpJw3aeQP4oETXSz34) <lylgithub2021 (lylgithub2021)>:
Would you please provide with an example of your solution to my issue?

[1:48:40](#eeeLvJ-spRyjLd5kvyDtmrVpVFcAORS1bgZcU8JAkFY) <lylgithub2021 (lylgithub2021)>:
Thank you so much!! And I don't think my codes is a good idea to handle with such a case related time control. Any better way?

[4:21:31](#m5OdD9O63SFEHJm8wkwrdicvTT_KTmK4hxPXlnrFSGk) <toomasv>:
lylgithub2021 (lylgithub2021): 
```
view [
   button "timing" rate 1 on-time [if now/time = 15:22:00 [print "on time" break]] 
   button "others" [print ["do something else" now/time]]
]
```

[4:24:01](#Q_SrD2BMhvTLztEMb0WR1KMKj6MBHWEbXrBIaLrRnrM) <greggirwin (Gregg Irwin)>:
`rate`-based example:
```
view [
	button "timing" rate 0:0:1 on-time [
		print ['tick now/time]
	]
	button "others" [print "do something else"]
]
```

[4:25:38](#UctTxqWqng7J5fJjsXXnjKZzWSCGfjg9M1upLRQkzR8) <toomasv>:
 * lylgithub2021 (lylgithub2021):

```
view [
   button "timing" rate 1 on-time [if now/time = 15:22:00 [print "on time" face/rate: none]] 
   button "others" [print ["do something else" now/time]]
]
```

[7:21:34](#Q8-rXn3W3uGdHALWd2siLv2X7odnGrVKg2FBlPjPqsQ) <lylgithub2021 (lylgithub2021)>:
greggirwin (Gregg Irwin): toomasv Oldes Many thanks all!!

## 27-Mar-2023

[21:07:25](#BmyrxkcXbfzrRHhhw7Tn_wjSh8y3n0kWwuyzHffeWDg) <myrebol>:
Any plan to support audio in Red ?

[21:08:05](#hur2kKB-qxXoggBgFE_TVgikvHjrc7LaAg6nBEJdgcI) <myrebol>:
Is there a ```map``` and ```reduce``` in Red ?

[21:38:22](#3t3ltiCjPCwsMR8ZKYICCzWA-Q8bw8nowmDPCco_5GI) <hiiamboris>:
Hi :) Audio - planned but no ETA. 
To see available features you can just download the console and see ;)

## 28-Mar-2023

[11:08:15](#31oPhByBunppvKjNXqGcPaVpRhe0nG_N-gzbUWFUNzo) <Oldes (@oldes.h:matrix.org)>:
myrebol: I wonder what exactly you would expect with the audio support?

## 4-Apr-2023

[14:30:46](#JqXZb2k-DUdSPheMnYRsnEP8cRC_r8gLeA_923HiuLM) <htq2222>:
Hi. I'm trying to dynamically build an associative array in Red without much luck. I understand the **append** action is to reduce a block and append it normally to a series. 

[14:31:15](#YVnVZLtuMgNY8SrO6PyUYIhiPYYpPGI0Qn7vqjST-Qw) <rebolek (Boleslav B≈ôezovsk√Ω)>:
`repend` reduces block, `append` does not

[14:32:25](#MyyzuAWsBPVZsxCXcl4c1uySo07UjWJu7Qc2hk1qrC4) <htq2222>:
ok I've got it mixed up. 

[14:33:07](#0f2iYNih-odvHvu8mBXBZqEa_u005orwOxrzcauEWAs) <rebolek (Boleslav B≈ôezovsk√Ω)>:
no problem

[14:34:44](#R3rjxfl-PQELFlAU3Ha5inE42A3B6VSYsTKAXtGiWmU) <htq2222>:
trying to follow an article from rebol.com. statically defining the array as 
> db: [
>     "Bob" [name "Bob Soe" street "...." city "..." phone "..."]
>     "Sam" [name "Sam Doe" street "...." city "..." phone "..."]
>     "Eli" [name "Eli Noe" street "...." city "..." phone "..."]
> ] . What I want to do is the dynamically create something like this structure.


[14:35:34](#IgwaXTWGaFU7ECoENPzecYpfHqD2OTO7YKiZbHHcntE) <rebolek (Boleslav B≈ôezovsk√Ω)>:
you can of course `append` new data to `db`

[14:38:10](#2GbKYkygPGjn3JHuB_e-tV64q7wUBGwzDLXxITTDt08) <htq2222>:
I've tried that but it's not working for me. Could be the way I create the block to add to db. I'll test some more and come back here for help.

[14:39:01](#Z4UpKFDoL5IhyYiW0XIqrC5keOBfANOeYO7ijyBJuz0) <rebolek (Boleslav B≈ôezovsk√Ω)>:
if you can share your code, it would be easier to point what's wrong with it

[14:39:46](#W8FFu0pnesrFhmrOcQu3zawoVrmeIOhfsYLHwTkc3nw) <htq2222>:
absolutely - will do shortly.

[15:09:00](#VVtf-dEG4dlvolfMlgiL6e9_0-gq6vkgjX3jNJddYS4) <htq2222>:
I'm looking to replicate this data structure programatically: 
```
db:[
"one" [id "1"]
"two" [id "2"]
"three" [id "3"]
]
```
 

[15:10:21](#nQO4rC6pdNQz0dD9C81zpvSwrPDKLtw4gqnlEevfhkY) <htq2222>:
This is the code I'm trying to create: 
```
db: copy []
in-text: ["one" "two" "three"]
count: 1
foreach intxt in-text [ 
   rec: rejoin [reduce[intxt] [id reduce[count]]]
   append db rec
   count: count + 1
]
probe db
```

[15:10:55](#oJ4xN4Yin9S-5abHQpDQRIZk0DZVlO-kVbFzP5boCak) <htq2222>:
what I get is this `["one" [id reduce [count]] "two" [id reduce [count]] "three" [id reduce [count]]]`

[15:12:56](#MzAjWDiuDRVXOjxv5EBVM15VBO-cENT83qpqVTEQYs0) <htq2222>:
so two issues here. first is I don't know how to get the count included. second is the data structure is a normal series instead of 
```
[
    "one" [id "1"] 
    "two" [id "2"] 
    "three" [id "3"]
]
```

[15:13:15](#DYlOgS3uJHog-WthTA-NDiFL9aKMFpl1G_SxfDXTm3A) <rebolek (Boleslav B≈ôezovsk√Ω)>:
`rejoin` returns string, so you need to use reduce there:
```
db: copy [] 
in-text: ["one" "two" "three"] 
count: 1 
foreach intxt in-text [      
     rec: reduce [intxt reduce ['id form count]]
     append db rec
    count: count + 1 ]

[15:13:33](#JVN4tQzy_ieOPq3x_6P51I2sEc5s4HtA6Z--IAh34rI) <rebolek (Boleslav B≈ôezovsk√Ω)>:
 * `rejoin` returns string, so you need to use reduce there:

```
db: copy [] 
in-text: ["one" "two" "three"] 
count: 1 
foreach intxt in-text [      
     rec: reduce [intxt reduce ['id form count]]
     append db rec
    count: count + 1 
]
```

[15:14:51](#O08I2DBcPHsWTtT8OCSYKu6jMsc4Gym1nZcNjH5elGE) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Also, you don't need the counter:
```
db: copy [] 
in-text: ["one" "two" "three"] 
forall in-text [      
     rec: reduce [first in-text reduce ['id form index? in-text]]
     append db rec
]
```

[15:21:26](#z86UYFIwTvvyMO4rSuHoeGzG7Z2RYC6ORKEgM4DbIT4) <htq2222>:
Ì†ΩÌ∏≤ it's amazing when you know how! I was put off learning Rebol/Red a few years ago but started Red again about two weeks ago. The more I get over the learning pain the more I love it! Your help and example here just deepens my appreciation for the language! Many thanks!

[15:23:36](#lR2j8JlITh0w5M6My1rEoOnMGtYEppSgok3GvO4iaIo) <rebolek (Boleslav B≈ôezovsk√Ω)>:
you're welcome :)

[15:25:38](#-jSBvIKuzzd4zPrTRjrk3aWWcL-CfPx6fDEpJKbREzM) <htq2222>:
I was trying to refactor some bash/python code in our production environment, scanning and replacing text in SQL file with over a million lines against another file containing reference ids. I thought why not prove my refactoring concept in Red first. Ì†ΩÌ∏Å

[15:27:07](#huUxN_CvLRkLvWwinNBX50fRnqqU6Fe3ymOk8QbsXsk) <htq2222>:
having spent years getting comfortable with Regex, took me over a day to do something useful with Parse. I can see its a powerful tool.

[15:27:54](#GC-VHCRePvtTFqcr0_anKTOs78pCMbbcaphiqBkjwtY) <htq2222>:
a lot of unlearning to appreciate Rebol/Red way of doing things Ì†ΩÌ∏Ö

[15:28:05](#T1MBBDGgjmHSkUE5COd-xOFWQ5_SS0hnbO-5k2n6anc) <rebolek (Boleslav B≈ôezovsk√Ω)>:
yeah :D

[15:29:53](#xayjWz0W75yx9teTV4nBDQgHh61Wn4MgSeZ0vAK2_vg) <htq2222>:
Parse is certainly a lot more "natural" than regex. I've come up with regex sentences that scares even die hard Perl programmers Ì†æÌ¥£ 

[15:31:48](#m_8WJRF4QhyauIoyrFNUI19K29RjCz1u9J95MALG95U) <rebolek (Boleslav B≈ôezovsk√Ω)>:
hehe, yes `parse` much more readable and very powerful

[16:17:26](#deJivGBeeiHmgvivHHY9MaLFCTd-1io9OPNvMBxvFGk) <hiiamboris>:
maps are Red associative arrays, so you might wanna prefer them over blocks

## 5-Apr-2023

[15:54:13](#tjDdQ_DNsv2bAEeN4qjWV8TsCR2jOrPAAaxK0xpiq4E) <htq2222>:
Is `replace/all` performance known to be slow?

[15:57:46](#2lMjz-S4Dxt6PpST0uL0Eae2-CotJcTOQouGWyyraB4) <hiiamboris>:
slow for what purpose?

[16:02:27](#zbLXEgtoZpGBzbjRYqVrHilTU27-x03vuhdbo5aNJb8) <htq2222>:
while trying to create a program to perform search and replace on an SQL file, I noticed how slow my code was. So I created a performance test program in Red and Ruby for comparison. I'll share the code shortly but results I'm getting is Red: 5s  Ruby: 0.3s

[16:02:48](#9tlK0oJnYjMGEHEM1rZZ70pgMXgtTkHlcmT1Ppa-U0c) <htq2222>:
```
Red []

mapping: copy []
repeat n 1000 [
   append mapping reduce [ rejoin ["aa-" n] rejoin ["bb-" n]]
]

pad: copy ""
loop 100 [ append pad "0" ]

target-txt: copy []
repeat n 1000 [ append target-txt rejoin [ "line" pad n "," "aa-" n] ]

foreach [line] target-txt [
   foreach [a b] mapping [
      replace/all line a b
   ]
]
```


[16:03:07](#Hj636c0Y64Rgei-L3UXW-LRv5TenmLWltDw0zSUbfeA) <htq2222>:
```
mapping = Hash.new
1.upto(1000) { |n| mapping["aa-#{n}"] = "bb-#{n}" }

pad = ""
1.upto(100) { |n| pad = "#{pad}0" }

target_txt = []
target_txt.push "line#{pad}1,aa-#{1}"
2.upto(1000) { |n| target_txt.push "line#{pad}#{n},aa-#{n}" }

target_txt.each do |line|
   mapping.each do |a,b|
      line.gsub!(a,b)
   end
end

puts target_txt
```

[16:05:44](#uyzTMHDmxsydVe7XCWL_qSYQnhTMQcUaYGGDA7tK1cw) <htq2222>:
trying to search each line of the `target-txt` replacing keys found in `mapping` with associated value

[16:08:51](#Mn5BbgfcKe7I6KjvcqzAn5YHibtzSRNUPZe2imiARx8) <hiiamboris>:
`replace` is a mezz (Red-level function) so it can't compete with native code. You'll have to write a routine for direct comparison to be applicable.

[16:09:10](#Yoz4Q8g7OA32Q2N8-sTzyoSTdNySmLTpual6zRZ-wvM) <htq2222>:
ah okay

[16:09:23](#RfIMps5ioJF2LxxtsQ7ER50M9E3EAlpmVKRIwLzo650) <hiiamboris>:
type `source replace` to see

[16:11:49](#jP1GuTpTV4kHQxY8u-jFoDGEI_9hvr3X_KRL1OJRU34) <hiiamboris>:
for maximum efficiency on Red level, you should convert your replacement map into a Parse rule, then parse the whole source in a single go

[16:13:33](#25nrr8MQ8ALveRZVLVKWF6aRBQFKfkipqV5PYedasko) <htq2222>:
thanks that was going to be my next step

[16:17:10](#L0xHDaYgC70GFKkPZr-TVGSiA5BKpujiXvjhcFfNuuo) <htq2222>:
no short cuts for me then - need to learn Parse Ì†ΩÌ∏Ö 

[16:18:19](#-g-ZK8BJ8lucpCvGikaBRNVeo9tFKm4DYbc80Dr-5K0) <hiiamboris>:
(:

[16:18:33](#i1ZaEgpatgobjRYcA8VA2KoFBo6l9CMLcBkyFm67qWs) <hiiamboris>:
start here: https://www.red-lang.org/2013/11/041-introducing-parse.html

[16:19:33](#Bn5rTbP_yah5SV6y540z8O0ztgX-1V_1nBRZzGZBMfY) <htq2222>:
I think I've gone over this page a few times. Each time understanding a little more. A little unlearning of Regex helps 

[16:21:25](#TS6bziUEY87nQY6Dz_AMPA0D-fZFVUcIT8tEMzD0I48) <hiiamboris>:
reference doc is here, consult when it does smth you didn't expect: https://github.com/red/docs/blob/master/en/parse.adoc

[20:21:46](#_BrsaerL1T9hhQ5n2tSYVJKamKh3FMxGScsS1is5S-s) <htq2222>:
Refactoring the code to use Parse slightly improves the performance time. It's now 4s instead of 5s. 
```
foreach [line] target-txt [
   foreach [a b] mapping [
      parse line [any [to a change a b]] 
   ]
]
```


[20:22:58](#3eGbFfJuM7WzzSYZmamYydNUassZ37RkoDraBS8lc-0) <htq2222>:
I noticed on the link https://www.red-lang.org/2013/11/041-introducing-parse.html it mentions 
> The current Parse runs as an interpreter, which is fast enough for most use-cases you will have. For cases where maximum performance is required, work has started on a Parse static compiler to soon provide the fastest possible speed to Parse-intensive Red apps.


[20:23:38](#JEitG8rb35rWkzZxD-4pH8-kjuelvapRJPd81gDKPYU) <hiiamboris>:
next steps :)
- unify all mappings into a single rule
- work on the whole file, not line by line

[20:23:57](#MJ5Fy1ZifyrvMQ4hyAph3j0-ol2qqjOSTVBBihJ-2Yw) <hiiamboris>:
no longer true

[20:25:23](#jvZjoyDAcHhHAgOZsF8Daj2a5GA49Cbz75IJWVLFLaU) <htq2222>:
I did try one big string/file which reduced the time to 3s. Didn't know about unify the mappings into a single rule - shall investigate. Thanks!

[20:27:13](#9v2G2LOgZvA3mHYEUPV7QERCIpRuhjbyno0PPPyabRE) <hiiamboris>:
use `clock` for timings

[20:45:33](#Lk8RjTzNwcndum0TSWnKWjUwJ0D03RZt5B-U-JvUVpU) <htq2222>:
in production the mapping will be between two hashed values similar to  `"5e415da5d3eae40e9165bedb" "618a792fe5bb46006849967f"` and can contain up to ten thousand such pairings. Not sure if this could be unified into a single rule.

[20:58:38](#UtbSo1zl1IoKiKEOJoV0zlGAec0xtFDQDSM6qMvKTTg) <hiiamboris>:
and what is the rest of the data like?

[21:00:36](#5O9t3SjYEHuo6nWmYk_q1yLYtS-fsFkH1R27s-C6qv0) <htq2222>:
it's a postgres db dump - can contain over 1 million lines

[21:01:09](#0JT1fvQqLa1faTiaA3Qh14SJKtM7o8TP7VNox1cvw14) <hiiamboris>:
ah, sql

[21:01:57](#-_A9tKkxPZ4DrGgsIe3WcPOhFsVNuFK1STxeiWuMOaA) <htq2222>:
we want to replace certain IDs used in production and map to IDs used in Dev

[21:15:25](#wo3T3M2PQwFJ-JA45NApxUVSrybfv9UHjSrBj9mMXN0) <hiiamboris>:
this takes 3 seconds per 1M lines on my laptop:
```
input: append/dup {} {
	select from lorem ipsum id="5e415da5d3eae40e9165bedb" etc
} 1000000

mappings: #(
	"5e415da5d3eae40e9165bedb" "618a792fe5bb46006849967f"
	;; add more...
)

hex-digit: charset "0123456789abcdefABCDEF"
hash-string: []

print ["input length=" length? input]
clock [
	output: clear copy input
	parse input [collect after output any [
		keep thru #"^"" copy hash 24 hex-digit keep (any [mappings/:hash hash]) opt keep #"^""
	|	keep to end 
	]]
]
```

[21:15:38](#0Cx9ZvDmtEPr_TrseEq7Gd5SPXiZtx3Ric_PhMyVH1Y) <hiiamboris>:
* this takes 3 seconds per 1M lines on my laptop:
```
input: append/dup {} {
	select from lorem ipsum id="5e415da5d3eae40e9165bedb" etc
} 1'000'000

mappings: #(
	"5e415da5d3eae40e9165bedb" "618a792fe5bb46006849967f"
	;; add more...
)

hex-digit: charset "0123456789abcdefABCDEF"
hash-string: []

print ["input length=" length? input]
clock [
	output: clear copy input
	parse input [collect after output any [
		keep thru #"^"" copy hash 24 hex-digit keep (any [mappings/:hash hash]) opt keep #"^""
	|	keep to end 
	]]
]
```

[21:17:51](#HOJMe3IOLyzTSkZUqOzMv1nGEfnsGOsAZY6Kf-X2mqc) <hiiamboris>:
* this takes 3 seconds per 1M lines on my laptop:
```
input: append/dup {} {
	select from lorem ipsum id="5e415da5d3eae40e9165bedb" etc
} 1'000'000

mappings: #(
	"5e415da5d3eae40e9165bedb" "618a792fe5bb46006849967f"
	;; add more...
)

hex-digit: charset "0123456789abcdefABCDEF"
hash-string: []

print ["input length=" length? input]
clock [
	output: clear copy input
	parse input [collect after output any [
		keep thru #"^"" [
			copy hash 24 hex-digit keep (any [mappings/:hash hash]) opt keep #"^""
		|	keep thru #"^""
		]
	|	keep to end 
	]]
]
print ["output length=" length? output]
```

[21:19:02](#47JQXHJ79YyooKIBMYLO3gSoWfXJgd-p7BdTwRUqX1k) <htq2222>:
this is next level red-foo. Going to take me some time to digest! Ì†ΩÌ∏Ö

[21:19:26](#QZa98DDhcKTYozMPEr4nXkutHUla9P7_JXQM1HnLg6Q) <hiiamboris>:
* this takes 3 seconds per 1M lines on my laptop:
```
input: append/dup {} {
	select from lorem ipsum id="5e415da5d3eae40e9165bedb" etc
} 1'000'000

mappings: #(
	"5e415da5d3eae40e9165bedb" "618a792fe5bb46006849967f"
	;; add more...
)

hex-digit: charset "0123456789abcdefABCDEF"
hash-string: []

print ["input length=" length? input]
clock [
	output: clear copy input
	parse input [collect after output any [
		keep thru #"^""
		opt [copy hash 24 hex-digit keep (any [mappings/:hash hash])]
		keep thru #"^""
	|	keep to end 
	]]
]
print ["output length=" length? output]
```

[21:22:32](#KRwFPINdfie1xX5tK38DTPXOXY0G7NScXQOFuJ3Wu9Q) <hiiamboris>:
* this takes 3 seconds per 1M lines on my laptop:
```
input: append/dup {} {
	select from lorem ipsum id="5e415da5d3eae40e9165bedb" etc
} 1'000'000

mappings: #(
	"5e415da5d3eae40e9165bedb" "618a792fe5bb46006849967f"
	;; add more...
)

hex-digit: charset "0123456789abcdefABCDEF"

print ["input length=" length? input]
clock [
	output: clear copy input
	parse input [collect after output any [
		keep thru #"^""
		opt [copy hash 24 hex-digit keep (any [mappings/:hash hash])]
		keep thru #"^""
	|	keep to end 
	]]
]
print ["output length=" length? output]
```

## 6-Apr-2023

[20:38:52](#xlAXHvbf0unRi4PAjE-_mZFIlV7T2qREl3Q7x9gjgk4) <htq2222>:
Wow just wow! I modified hiiamboris suggestion above for my performance testing code. Running the test against 100,000  line input in Ruby and Red. Red code performance is like a rounding error compared to Ruby. Results were 
> Ruby = 17.8s  vs Red = 0.8s

 Ì†ΩÌ∏≤ 

[20:40:01](#M_9y7_Jntvm05DRwxyZr66nZmJ4xqg4kZz3ZRCciFas) <htq2222>:
I did try to perform 1 million lines but encountered `not enough memory` error.

[20:44:19](#pcUPeg4IpXvLgnM9227gUgT8Tx5YM9hhqoqKLpU7XsE) <htq2222>:
Parse's power is awesome! being able to run commands inside the parse rule allows the use of direct hash lookup based on the matched criteria. Love it!Ì†æÌ¥© 

[21:01:32](#KNmaywhsJG8ZJ0ilZUZNxVJ5NExkS67m-r0XIN-ABFs) <greggirwin (Gregg Irwin)>:
Woohoo! Red is optimized for ease of use in most cases, but can be made very fast if you need the speed.

[22:03:05](#-9c1ugLg0yn69Op18BCrBcdLy13r8VLsuVoNtmCYQEI) <hiiamboris>:
try working on `binary!` data

[22:06:46](#nQWOpKEPnwjwOVjOXsy8VhiRmdfRjVYmwrL3O9jq5zw) <hiiamboris>:
`read/binary`, `write/binary`, same parse rule

## 11-Apr-2023

[14:41:48](#1LUbOIauVQNbAaFxkQdPMJwQVU65fJCQxfW2kXBrVVs) <planetsizecpu (Jose Luis)>:
Welcome btw htq2222  Ì†ΩÌ∏É

## 17-Apr-2023

[9:57:09](#NQG7S_OsMXoyriYjzytIUCVN69qHyD7jY2nXSsJJ-sA) <lylgithub2021 (lylgithub2021)>:
How to comprehend the action "trim"? Why does "trim "^/a bc^/" lead to "a bc^/", not "a bc"? 

[10:17:01](#9DDwv3oRME5-WvHtvXyYzZAz12HolMjPBZ0YHobBpUA) <gurzgri>:
lylgithub2021 (lylgithub2021) It is a known bug, see https://github.com/red/red/issues/4423

[10:18:59](#B__CW5CXe_LJuaRZO7mMk3jfShweBLUQ0VYyHn7FDFg) <gurzgri>:
 * lylgithub2021 (lylgithub2021) It is a known bug, see https://github.com/red/red/issues/4423 . Or, to be more specific, the desired behaviour is discussed there.

## 24-Apr-2023

[1:55:41](#S-RWCTF9C4Vt-qqO2BbW4PcynhvLXHA8QbzNXSNmx2Q) <kpeters58_gitlab (Kai Peters)>:
Does Red have any database support yet?

[5:49:15](#wRQVyykwQU_sHRVi7iHZ7FTVwj8bjiswqge4BPXt2Xs) <riprwwa (riprwwa)>:
Have a look at https://app.gitter.im/#/room/#red_database:gitter.im

[7:16:35](#6yV52Xhleixmhf97-YpxGZHEwW51K3HrkGZIJa6VJ78) <rebolek (Boleslav B≈ôezovsk√Ω)>:
I have a working Redis scheme and partially working MySQL one. Unfortunately, I don't have much time for Red these days, so finishing it is not a priority for me. If there would be any interest, I may find some time.

[19:44:19](#DUbLauv7Q764sAlkOeFbKh1eLgRdGLAyFL18EQUUBYg) <gurzgri>:
There is my ODBC API implementation, see  https://github.com/gurzgri/red/blob/master/environment/schemes/odbc.md

## 30-Apr-2023

[9:44:23](#0K9_wHCmbvuMbjHn15T8gWiYIdSyPJhotpfKBAwC-jw) <lylgithub2021 (lylgithub2021)>:
>> a: "1234"
== "1234"
>> find a "2"
== "234"
>> b: "abcAdef"
== "abcAdef"
>> find b "A"
== "abcAdef"
>> find b #"A"
== `"abcAdef"`

[9:44:48](#lICi0sVGw0uGPM0Q7snCvW7Ns2rcVKuuRLbW6dIaUIA) <lylgithub2021 (lylgithub2021)>:
Why does "find b..." not get the string "Adef" as it acts on "find a ..."?

[9:49:08](#aCNs7FJny0auz2i8Ap8bel_tm0EplSWWORe7e5UpDR4) <hiiamboris>:
Case insensitivity

[9:50:08](#Eepku8T5R5LBkuq3FS3rxF2tHrfy1-8eA8Vy9hqZHKk) <lylgithub2021 (lylgithub2021)>:
Then, how to make it work as I want?

[9:57:56](#dKI9pXuFzV3Ak87NC4unGZoZwHq5DvIy-MZ2zMcwHKo) <hiiamboris>:
`? find`

## 12-May-2023

[1:19:05](#M4kW60AHtygBGA2KwD5DeWorGXtlRoEaTSgpEXJuFJg) <cloutiy (yc)>:
lol

[1:20:07](#6BOAlsZsjiKsmAVwbE8by4spXg_1PwKxuBtAEZlpAEU) <cloutiy (yc)>:
How does one implement an SQLITE? Are there any documentation?

[3:39:49](#D6GpMSVYnJrZ26abPjTggAeO-wH-dbyK1mw2WBv_duc) <gurzgri>:
How does one implement an SQLITE? Are there any documentation?

[7:35:52](#8-z6VmvwY_LeR76Iu_M3FkixC6LZdvvZsdjEjGmpq5g) <gurzgri>:
(sorry, my initial reply was written on mobile, I missed that it was asked in this thread) Implement an sqlite? I don‚Äòt think I understand the question already, can you explain what you want to do? You‚Äòll need an sqlite database, an sql odbc driver and a odbc datasource configured in 32bit odbc admin panel or a connection string to establish a connection. The odbc schemed itself requires compilation.

## 18-May-2023

[20:02:17](#0EfnuBpD6fJS-CVzbXDlgYxVN9zyBhGPbCJ0Az5DNLc) <jfgf11>:
How do I perform linting over a .red file?

[20:12:57](#HUvOdX6OO8v7NmRWixoGvUPF6L-0sxRN3CswNVvcdY4) <hiiamboris>:
I'm not aware of anyone's attempts at linter implementation for Red. Too early a stage perhaps, or too few are interested in it.

[20:15:26](#-pTX3U1lJRiHEdaNuLzYO0-5JBVN2HiRtPszTfixPDQ) <hiiamboris>:
Given the recent events I suppose ChatGPT or other assistant will occupy this niche anyway.

[20:22:40](#DKWf2Jnbz4qD7yr2qslR-rvzZI2j7pdDF45LwvKlVxM) <hiiamboris>:
* Given recent events I suppose ChatGPT or other assistant will occupy this niche anyway.

[22:15:07](#jXYSqWq9jgSQVPPd7SxPB2qmnTd2aFX3yAjW3Bl2ex4) <jfgf11>:
Okay thank you

## 19-May-2023

[7:25:33](#xq_kbYY0gKaSWvEq40y-t17yY8pmojKfjKWx8JRc2r0) <pekr (Petr Krenzelok) (@pekr:matrix.org)>:
By implementing SQLite he probably meant wrapping an SQLite library, not going thru the ODBC driver ....

## 29-May-2023

[4:36:19](#ZoopvxRo-W9QDjVeYATH5oY4eMC8WyPqV_7WhYN-XBs) <lverno>:
how to filter out any non-letter characters in string?

[4:37:26](#FvxZsvUJhn85f2sNoEE286KCFbyl-5sJQokRGvhSz9U) <lverno>:
I assume it's something like this: `collect [foreach c str] [if [letter? c] [keep c]]`

[4:39:11](#3cZa41VrXMasCq60wm8tqPTH5bW0tEzkCXeWaT9laQQ) <lverno>:
 * I assume it's something like this: `rejoin collect [foreach c "hello, world!" [if [letter? c] [keep c]]]`

[5:08:28](#GYzXlRPEmYEiqvy-XzZ_MDuCiym2SjwL1S4qVHySiRw) <greggirwin (Gregg Irwin)>:
```
>> unwanted: charset [not #"a" - #"z" #"A" - #"Z"]
== make bitset! [not #{00000000000000007FFFFFE07FFFFFE0}]
>> remove-each ch s: "hello, world!" [find unwanted ch]
>> s
== "helloworld"
```
Use `copy` if you don't want the original modified.

[8:29:46](#Z1kZYpXCuhEtp6fQ-wXu5R0_lP8EwCcOJDTs0XT63VY) <hiiamboris>:
rather:
```
wanted: charset [#"a" - #"z" #"A" - #"Z"]
trim/with s wanted
```

[8:30:40](#ECJtiGglbom8kHNHAc7HgFzL_f6cp7XOWzLjTBBhzeA) <hiiamboris>:
but it's not unicode aware solution

[8:31:04](#BttvsEK440HneQINR2hU1gduw4ppSFuoovUYytW9a8A) <hiiamboris>:
we don't have proper character classes yet, you'll have to define them yourself

[8:31:43](#WAba-ecZcYCf5pCxJUsqEolICr8v4PUfEJfJ_Au89eQ) <hiiamboris>:
* rather: `trim/with s unwanted`

[18:01:26](#xSAQ4z_lDgceBO6MjKUXzc_39twt4d9V8oQjFj2-uiw) <greggirwin (Gregg Irwin)>:
Ì†ΩÌ±çÔ∏è

## 30-May-2023

[0:17:04](#y0gQDu2RAD-vXMJqne7Pfrd5qfOFkWSLFLDaHIwBxSg) <lverno>:
easiest way to get rid of the first and last characters of a string? i.e. "hello" becomes "ell"

[1:59:55](#Fma_ha6C7mzwuvEErB31Cbx3NLQTcoawhUU8zbjD6ZM) <greggirwin (Gregg Irwin)>:
One way: `chop-first-last: func [s][copy/part at s 2 ((length? s) - 2)]`

[2:00:26](#Y26v5QxA5F50sur1dAYO7YOR11ZE2JwXUJA1TWitpc0) <greggirwin (Gregg Irwin)>:
And note that it also works on any series, like blocks.

[2:00:59](#cgGXnc0rFKjrSxVMRDQT9M94GYuRIooarzpMbblZ4x8) <greggirwin (Gregg Irwin)>:
That's extracting, not removing from the original.

[2:03:16](#szo6LJ8pnIgR0EEM5L4ei8eybfzQsaQco1c_9xRrNTM) <greggirwin (Gregg Irwin)>:
If you want a bit of a head twister, with chained calls, that *does* modify the original...
```
chop-first-last: func [s][head remove back tail remove s]
```

[2:04:55](#Vty5MM1PhL5gksc3CWEcW42hx3O9i181zaMEh8gUdnw) <greggirwin (Gregg Irwin)>:
Or an imperative version of that.
```
    chop-first-last: func [s][
    	remove back tail s
    	remove s
    ]
```

[22:05:16](#pIxUoIQOri4lszf0y9qXxwSUsBJNxZVqu2gOjOhK888) <lverno>:
how to make a variable reassign in each loop iteration? Coming from Python, this confused me: `foreach i [1 2 3] [x: [] append x i print x]`

[22:05:27](#tCwdzS-IbQkVhUJjqtK9GAHc1ECg4m5rN90YuzImPc8) <lverno>:
it prints:
```
1
1 2
1 2 3
```

## 31-May-2023

[2:51:00](#NECsCmrYuXGJEYxFClc2veM7pOWSiUKzDBXieEQwK4Q) <ALANVF (theangryepicbanana)>:
use `copy []` instead of `[]`

[18:13:05](#T3XgLmfI3GElIeaviX-hvFWdB3-cd6ohF9AGH55eTIY) <greggirwin (Gregg Irwin)>:
https://github.com/red/red/wiki/Coming-to-Red-from-Python

https://github.com/red/red/wiki/%5BDOC%5D-Why-you-have-to-copy-series-values

## 20-Jun-2023

[17:12:06](#0Q3SpThrgT53IjTceph1VTkXtanwOE2zO3LiA1iVPgM) <Benoit de Valois>:
 Hello
I want to know if it is easy to access an REST API with the current state of red

[17:24:31](#I9fA0l955eoKWg9_ISQNdK7ZX9ezlCtCbu_QujvPRe0) <greggirwin (Gregg Irwin)>:
Yes, basic I/O works fine for that. e.g. `read htpp://...`

[17:57:34](#a7EbzqS8quqi297iYwjs3Ix_qRQn4IMaUDHytt5Q9cc) <hiiamboris>:
See https://gitlab.com/rebolek/castr/-/blob/master/docs/send-request.md

[18:21:30](#5-dJ4JOteSt8eTeyp-UTW3BGC2YpT3VxTBSxXfdgPtI) <Benoit de Valois>:
Interesting
My Idea is do Boto3 for red
(Boto3 is aws sdk for python)

[18:34:07](#PHknm2whL0mQU_8JmK8eHlnQZbspZLpI2RZbhkVh3Jo) <JLCyclo (JLCyclo)>:
Hello, I have a red script which works fine when I do it with CLI command (do %myscript.r)

[18:35:12](#0sriGfxaOdZ_8f3TTWJx1hwqx5WSvNlXEF2fR1ijjuI) <JLCyclo (JLCyclo)>:
I try to compile it using the linux red exe : red -c myscript.r 

[18:35:39](#Zu3M34naYJKjFkIKHo3xW9g6jehduSPRmZdXvCBUbrc) <JLCyclo (JLCyclo)>:
but I have the error *** Compilation Error: undefined word ask

[18:37:39](#42QIMKWgB7EfjARdWe2mae_1bKavZHzwlhzxwCbudQE) <hiiamboris>:
try `#include %environment/console/CLI/input.red`

[18:37:43](#dJWSWFjx5hdX1Sn65z3Pn4tqyx0KeFsvq2PxaLKW4_w) <JLCyclo (JLCyclo)>:
ask is well-known when I am in the CLI mode. Do you have an idea for this error ?

[18:38:14](#0MBn4faBbCf97-rsNJMeNZNkKJWv6JhrF1IBxYx9K5U) <hiiamboris>:
`ask` and `input` are defined by the console itself, not part of Red runtime

[18:39:35](#p2YqIGrjHIFDP2lc-VqfsJ5qXovgZBFXfJ7AOoS8WWk) <hiiamboris>:
https://github.com/red/red/wiki/%5BNOTES%5D-Compiling-with-console-functions---input%2C-ask

[18:48:55](#yeKaErF4pomweos0gunGKGe6q_yMmxYtAFqhG2eIqgM) <JLCyclo (JLCyclo)>:
Thanks, I will try to do it. I think that I have to download red sources (directory console)

[19:18:55](#THWkYIoDevEdTqLx63vV2EjTX17nca1fn4uGJjxdCak) <hiiamboris>:
yes

## 23-Jun-2023

[0:32:57](#ahN0Sc3PTKD5cHTNZmwgoCh6Et5EeGZ1qvMLuXOnXfs) <Mark Smith>:
Hello, all. I'm very interested in learning Rebol/Red but I'm struggling to find a clear definition of what constitutes "an expression" in the context of the do dialect. When reading Rebol/Red code how does one easily parse the code to understand which terms are arguments to which function? Obviously it works but how doesn't seem to be explained anywhere.

[0:55:19](#wiMmZK6VEP-Rhw8tqlnjuV3tZH-oV46yhwtOvoet61M) <greggirwin (Gregg Irwin)>:
We call it "free ranging evaluation", and is one of the great things in Red that throws newcomers off. :^) 

I had a long explanation started, then realized the easy answer is "use `trace/all`. :^)

```
>> trace/all [find append "" remove form add 123 456 #"7"]
    add 123 456                                              => 579                                                                 
    form 579                                                 => "579"                                                               
    remove "79"                                              => "79"                                                                
    append "" "79"                                           => "79"                                                                
    find "79" #"7"                                           => "79"                                                                
== "79"
```

[0:57:13](#3d54frgh8rmCAGDfyjk0B55tngBxFeODZvb5NEp0zGY) <greggirwin (Gregg Irwin)>:
 * We call it "free ranging evaluation", and is one of the great things in Red that throws newcomers off.

I had a long explanation started, then realized the easy answer is "use `trace/all`.

```
>> trace/all [find append "" remove form add 123 456 #"7"]
    add 123 456                                              => 579                                                                 
    form 579                                                 => "579"                                                               
    remove "79"                                              => "79"                                                                
    append "" "79"                                           => "79"                                                                
    find "79" #"7"                                           => "79"                                                                
== "79"
```

[1:00:38](#Oy-A7iCMOrC38f4kLj85nKwnefsbe6LXguh0v-o3HUQ) <greggirwin (Gregg Irwin)>:
As far as easily parsing code, that takes time and it helps if the code is written with that in mind. Soon enough you'll get familiar with the more common funcs and how many args they take, including when refinements are used that may take optional args. 

We often end up writing dense code as we "improve" it, making it less clear in the process. It can be instructive to take standard functions apart, and rebuild them in a form you are comfortable with, to see what makes them tick.

[1:17:28](#ShPlhA854bGZq1B25xVloW2Mg-lxGaRG5p0Ch3B7mjQ) <greggirwin (Gregg Irwin)>:
As you read, when you see a function call, e.g. `find`, you need to know how many args it takes. That's easy to find out with `help find` in the console. If you see a literal value, or a word (which refers to a value), that's an arg, easy. If you see another function, its result will be the arg. `help append`. Keep walking and you'll get there. Another thing you can do is take an expression and add parens around calls to see them, as you're learning. The code will work the same. e.g.
```
trace/all [find (append "" (remove (form (add 123 456)))) #"7"]
```
You can also add extra spaces as you see fit, to make the code readable to you.

[7:54:54](#HLCkBCYgtV9ypZbXHVJjoR15soWVPqU2ERvgYyh2Z_c) <Oldes (@oldes.h:matrix.org)>:
It looks that there is a bug in `trace/all`.. There should be:
```
remove "579"                                              => "79"    
```

[7:59:30](#aeX_M1RX1NvHNUpgtjoAtGO0qFXmNcCnygeNMDFJvKU) <hiiamboris>:
A tradeoff. Otherwise either will have to rewrite output string step by step or deeply copy everything at every event.

[8:07:37](#lULrux-zGyGXM54TwRYuvXrUM5TR2hbwmCnsRlZ9d10) <Oldes (@oldes.h:matrix.org)>:
I know why it is how it is, but it is definitely confusing, especially when this feature is recommended to newbies.

[15:01:38](#reQmJzjNXnQ7IdQ2xv3in49HhapQiQdxr3K81hiwRmI) <greggirwin (Gregg Irwin)>:
Maybe there could be an option for that. e.g. add a `== <result>` line for each expression. 

[19:05:59](#hLGpFptcEnU7mGMRKdRLz3HAGD_8H-Jq0c6Tje6Mwq8) <greggirwin (Gregg Irwin)>:
Mark Smith: did `trace` help you at all?

[19:26:34](#jX0zPe06V3j5OPzGcAfLFTnP0j1jwvHcWZXRVCsme0I) <hiiamboris>:
there's some stuff here https://helpin.red/Evaluation.html but the author is using incorrect terminology sometimes

[19:28:15](#SZUbo7GU_ux678FUuRb8o_0HL_avfcviGGr-J4j2K4M) <hiiamboris>:
his "second favorite" looks about right, though I didn't read it fully

[19:28:44](#AOfVpGy1IiBUb76AuhSsQe90m5aqtDpnp0yGow3ATmI) <hiiamboris>:
it's got pictures so why read it anyway

[19:28:48](#-Vgur12rSGNIOHSzGx3P4yf3P4DI34jLffFeO01Nuiw) <hiiamboris>:
:)

## 24-Jun-2023

[3:52:59](#Y6P8yL-EJRWDY5mUGyKXDXFWMraiCoAhsQrCz22HUz0) <guaracy (Guaracy)>:
an weirdo example

```
>> trace/all [min 1 + 2 2]
    + 2                                        => 3                                                
    min 1 3 2                                  => 2                                                
== 2
```


[5:21:50](#BC2GUhkbJtoAltRFoqcD4vtJHlv9BWrfDRqfQKaW_Nw) <greggirwin (Gregg Irwin)>:
I found that as well, and noted it for dockimbel .

[12:07:56](#QpZXWP1_1-XscclbSWd7wPkt6S9U2ZXyzY6XQSbyJUA) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@rebolek-5565a4bf15522ed4b3e100bc:gitter.im> I have a working Redis scheme and partially working MySQL one. Unfortunately, I don't have much time for Red these days, so finishing it is not a priority for me. If there would be any interest, I may find some time.

Hope you will be back working on then. There are many interesting projects that are blocked that could help the community a lot deliver good productivity apps

[13:36:22](#H2dxvwruDLr7skFnn7-fTIbCEkxMlCRIpTpnbLadgOw) <dockimbel>:
> <@rebolek-5565a4bf15522ed4b3e100bc:gitter.im> I have a working Redis scheme and partially working MySQL one. Unfortunately, I don't have much time for Red these days, so finishing it is not a priority for me. If there would be any interest, I may find some time.

Hope you will be back working on then. There are many interesting projects that are blocked that could help the community a lot deliver good productivity apps

[13:39:11](#gqe-u5TeszZ06646P0xl9r54UGSdVgErolACuV5ds-8) <dockimbel>:
The interpreter events for infix might have been impacted by the `apply` branch merge:

```
>> trace/all [min 1 + 2 2]
    1 + 2                                           => 3                                                    
    min 3 2                                         => 2                                                    
== 2
```

[13:39:42](#B6ZqKPBHqXbPkUFl3bjd0SqmNJkhDKRBXY6YsjQOS9k) <dockimbel>:
 * The interpreter events for infix might have been impacted by the `apply` branch merge. This was the behavior from an early May build:

```
>> trace/all [min 1 + 2 2]
    1 + 2                                           => 3                                                    
    min 3 2                                         => 2                                                    
== 2
```

[13:42:40](#il1gfO2h8mMU2SzI1C_yd8j3h7PB0f9b4v5hvLJG_TI) <dockimbel>:
hiiamboris: `trace` needs to be updated as the infix events have changed. This is a raw trace of the above infix args fetching before the change:

```
FETCH 1 none 1 44x44
PUSH 1 none 1 44x45
FETCH 2 none + 44x45
OPEN 3 none + 44x45
FETCH 3 none 2 44x45
PUSH 3 none 2 44x46

[13:44:08](#Qq4PvF_qpkYE7-G8735m-Wylxv3k-03dXaHXAH9NWDc) <dockimbel>:
 * hiiamboris: `trace` needs to be updated as the infix events have changed. This is a raw trace of the above infix args fetching before the change:

```
FETCH 1 none + 44x44
OPEN 1 none + 44x44
FETCH 1 none 1 44x44
PUSH 1 none 1 44x45
FETCH 3 none 2 44x45
PUSH 3 none 2 44x46
```
and after:
```
FETCH 1 none 1 44x44
PUSH 1 none 1 44x45
FETCH 2 none + 44x45
OPEN 3 none + 44x45
FETCH 3 none 2 44x45
PUSH 3 none 2 44x46
```

[13:45:56](#24Ps-yZUF8pl3UPeaonx6hm10Yb0PxNpzA3CKFsoX68) <dockimbel>:
So now, the interpreter will report events in proper order: the first value  is been pushed on the stack, then an infix is detected and finally the right operand is fetched.

[13:46:37](#nnu6TYIo-EQHlTsFcsIs3OJjdsoZoDqjfX6UNu0fcW4) <dockimbel>:
 * The interpreter events for infix calls might have been impacted by the `apply` branch merge. This was the behavior from an early May build:

```
>> trace/all [min 1 + 2 2]
    1 + 2                                           => 3                                                    
    min 3 2                                         => 2                                                    
== 2
```

[13:47:18](#eO5ox4w7TWgtl1hV2ieFOCZtWW79UIf4vdgGEib7Do4) <dockimbel>:
 * Notice that now the interpreter will report events in proper order: the first value  is been pushed on the stack, then an infix is detected and finally the right operand is fetched.

[13:54:05](#hAOzYNm4NHLN_JvZF90gexRx8Ds_0b8gtRpASQjIIkk) <dockimbel>:
> Red considers text (strings) as a block of characters, so this main text of Red code is just a big block for Red, even without brackets or quotes.

What a great way to totally confuse the reader! Ì†ΩÌπà

[13:56:18](#NRwhtRtkvpunPak0N38XJunKOU8TzLhscC57F0BebI8) <dockimbel>:
That said, I really like the look'n feel of that online doc.

[15:42:21](#3JK2aGttiKsOxA-Bj9hd-jYZ0UAbwXtq8H2KpSVwoR8) <hiiamboris>:
That said, I really like the look'n feel of that online doc.

[15:42:57](#h7zuLUJGqvbhGPk5iGjAkIShHlvWgKvyg-CAGFCl6LM) <hiiamboris>:
I'll take a look

[17:19:46](#42b_g0-yHcxylVjgf8emKvirYXkrQdtwfXAyG_-Hddk) <greggirwin (Gregg Irwin)>:
Thanks hiiamboris .

## 25-Jun-2023

[14:44:10](#kI62oFMLc_nPX9b6jgaqq76mZl6r7Qkgj8fGD45dDes) <dockimbel>:
Faces in View are already reactive, so that if you change or deep-change any facet (like `/data`), it will update the graphic component accordingly at once. See:

```
a: ["A" "B"]
view [
	drop-down data a
	button "Add" [append a "C"]
]
```

[14:48:28](#mrm8RKWZXVRi2IjcQuKtO8rT2y2RgmR3qPQjlbyjhF0) <dockimbel>:
If you need to do anything more advanced than setting a value (or making a deep change), then you need to rely on `react` to achieve it. Otherwise, all the basic direct changes are already reactive in View.

## 28-Jun-2023

[7:41:48](#fs3kbGNzfG7VvYWDCX7nTGA61tMGVykWFBoxd5VOykc) <Benoit de Valois>:
Hello ; searching a way to conbert a binary! to a string!

[7:43:38](#r70KYzF8ly9gGWTQuEK3W8XMrR1ddlOpxfAx1mxZbcg) <Benoit de Valois>:
Is there a build in function for that ? to-string fail (invalid UTF-8 encoding)

[7:45:07](#2e_rUJezCuk2_OhvevPFwEGrb6Lzau-jv-g34ctHs8k) <hiiamboris>:
hi :) Red can only decode UTF-8 encoding, but you can decode some other encodings using https://gitlab.com/rebolek/castr/-/blob/master/codepage.red

[7:47:45](#ibpiHO0-kH-XNC6sWpB_vgIsHMo9AbWerq3yS70Ho3Y) <rebolek (Boleslav B≈ôezovsk√Ω)>:
hiiamboris thanks :)
Benoit de Valois yes, the codepage script can convert 10 most popular non-CJK encodings to UTF-8. Feel free to ask me about details or, if there's an encoding you'd like to add, I can help you with that. 

[8:00:42](#_lGtYvnIlpVS5_rqmktst1S30aIlwGyt8I9mFeITb9Q) <Benoit de Valois>:
rebolek (Boleslav B≈ôezovsk√Ω): thanks ; i already use castr for my aws sdk project
I will search inside ; very good library !

[8:01:07](#ioH2Hfymqz9Cgs8QG4z4v6QRzbt7ozK-6mUuVJxLaF4) <rebolek (Boleslav B≈ôezovsk√Ω)>:
thanks :)

[15:49:55](#qO6iYDqDu1BOFaaL3ZiRVW6rJNzY-zTJoOo2Ut2ScDc) <Benoit de Valois>:
It seems checksum with 'SHA256 does not work correctly
Am i right or missing something ?

[15:53:59](#Y_dEGDEzesGjI272yhtSDs6Cm0YBuxVTnR3GbChOd1Y) <hiiamboris>:
how did you test its correctness?

[15:56:45](#G-jYumfF86HHsCgLmsq0Ln82pHmpQiUALYDxMBPX8B8) <Benoit de Valois>:
Making checksum sha1 in rebol2 and compare with the same in red

[15:58:13](#hwJ98RSQ-g_GeQ62Y8RRM663A1HCxBa-QAh5czxlgFA) <Benoit de Valois>:
And compare with online checksum tool

[15:59:29](#4gT21z3nuGy_L1FOeUgtaPR1GubM0ym-GSzMu0X_mG8) <Benoit de Valois>:
Rebol2 IS right
The checksum generated by red contrains a lot of z√©ro, that's suspicious

[16:00:10](#oAruepcVEFrd1KNMN1QAMGolj7V5Jc0VeDNaGv39fYM) <hiiamboris>:
sha1 or sha256?

[16:01:23](#FMutQwnovqc-PeX9Py2ThuRVnyrJiFg__zKrg8WOvyQ) <hiiamboris>:
if you're running `checksum` on strings, they are internally converted to binary using UTF8 encoding in Red, so you'll need Bolek's `to-cp` again

[16:01:34](#w3_n8j73y1MPjEPvgJpU_gQYBRUzeiY9iwmZ_xwzY_0) <hiiamboris>:
* if you're running `checksum` on strings, they are internally converted to binary using UTF8 encoding in Red, so you'll need Bolek's `to-cp` again with non-ASCII chars

[16:02:49](#n8xqHxoi3Qkx5Uf3yl40M-UeBSWYLx5IAef6nbCBJ4U) <Benoit de Valois>:
I do test with sha1 because sha256 IS n'ont supported by rebol2 

[16:04:03](#aRu_RickTEaJsWLS6UzwULjoCRjvamvy2bDIWCJ42xg) <hiiamboris>:
gimme an example of the wrong input and output

[20:10:05](#Ya0wcx24_MCqKPx-SIIvDozra1kBCNGVYiVE4Z3za7I) <Benoit de Valois>:
rebol2
>> checksum/method "unexemple" 'SHA1
== #{63DE9ADD731B82ABF4E765418B354AA10F16F097}

Red (fresh build 2 days ago)
>> checksum "unexemple" 'SHA1
== #{B5A7F009000000002045F009C045F0098046F009}


[20:11:26](#RUWAcerN7m4KB91t1JVC1gE7dCY60EVyw5ha0yKivyE) <Benoit de Valois>:
and using https://emn178.github.io/online-tools/sha1.html
it gives 
63de9add731b82abf4e765418b354aa10f16f097

[20:29:18](#EAKNdFEiLTr6_tXV3UgNcfPB38tRxkSp-rg_Y3mo1K4) <greggirwin (Gregg Irwin)>:
Red here:
```
>> checksum "unexemple" 'SHA1
== #{63DE9ADD731B82ABF4E765418B354AA10F16F097}
```

[20:30:16](#HydGaOMZWthw_uN03R-i1ohy-V_QscjKHk-N1VJElF0) <greggirwin (Gregg Irwin)>:
My build is a week old.

[20:33:05](#MLmxhir3K6E4-fzxY-21zSJnJFRvCGLgXZ0LGKr9oHM) <greggirwin (Gregg Irwin)>:
Just DL'd the GUI console from red-lang.org and get the same result.

[20:34:25](#rnPYYTyxWjq555PCV6nLsK05YQfxsJAAN99Kat2ODjQ) <greggirwin (Gregg Irwin)>:
What OS are you on? 

[20:35:32](#HrszFsX18cV9MEaTvzAhfBToyDoUEzKIdbFEDZtAEZA) <greggirwin (Gregg Irwin)>:
Most checksums use the OS funcs for this, though `adler` is an exception IIRC.

[20:48:18](#SkUCqDF3qYbM56FuYNTMyCvraOMvO0_JF9KIwrxROvE) <Benoit de Valois>:
I use a mac pro with macos monterey

[20:48:32](#CtBYSV5vmS5mlTXeesYirS1iRfgtpk0nNILjOdMKfXc) <Benoit de Valois>:
interesting, it seems failed only on mac

[20:54:29](#cbUBeduNt8de29RFn69M7Gn3fc5_2_e2hWzULa-W95I) <greggirwin (Gregg Irwin)>:
Looks like that uses `libcrypto.dylib`. Can anyone else on MacOS confirm?

[20:56:14](#P2B-_bNBuBabZEU2ZVjZnbhuzkOe-JKmrYTzvZxo4QQ) <Benoit de Valois>:
another issue I think :
rebol2
>> er: #{63DE9ADD731B82ABF4E765418B354AA10F16F097}
== #{63DE9ADD731B82ABF4E765418B354AA10F16F097}
>> df: to-string er
== {cﬁö?s^[????eA?5J?^O^V?}

red
>> er:  #{63DE9ADD731B82ABF4E765418B354AA10F16F097}
== #{63DE9ADD731B82ABF4E765418B354AA10F16F097}
>> df: to-string er
*** Access Error: invalid UTF-8 encoding: #{DD731B82}
*** Where: to
*** Near : df: to-string er
*** Stack: to-string  


[20:58:15](#lx3ECi37v-1C19sySnVE1PVu5jbkFWT5D8ioIwKAa7s) <Benoit de Valois>:
OH sorry I run the stiuff in a container, so the system is ubuntu

[20:59:24](#3VQjQmwGnM0TvPckGyO_3uOc8b3csBKbw9Im4dEIhTc) <Benoit de Valois>:
impossible to use red on macos natively, mac want 64 bit

[21:00:10](#vFl0aTVNWj_HHqFLqwFNMX3kcFiPyZeUQfrVG7DRg1A) <greggirwin (Gregg Irwin)>:
Not all binary values can be converted to strings, which have to be valid UTF-8.

[21:02:03](#ZbcaS1bsLYqkXYbsgfA4vAy33qPGGuV459GL0jv0_qQ) <greggirwin (Gregg Irwin)>:
What does `about` give you, to see if I can track which logic it's using, as ARM is a possibility or what it thinks you are if it's an M1 chip.

[21:02:46](#HJ-O1rbtqAym7dmIs-3EQFDa4PvHOsgxdL624qDj0m8) <greggirwin (Gregg Irwin)>:
Or look at source `red/runtime/crypto.reds` if you want to dig in yourself.

[21:02:47](#0G5WnIF6EOrlceThlaJzXATF1bMO5ky8yz0UrwKwELE) <Benoit de Valois>:
Red 0.6.4 for Linux built 25-Jun-2023/16:24:44  commit #c69d476


[21:03:01](#q9X7TU-mArB3Z50zjLaLXqQsoQIRrx2WtCj4N61_5hQ) <Benoit de Valois>:
not it is not an ARM mac

[21:03:29](#cC1opW_9lpkP4ILgmPwEJ9hEmFwj6Hde6DkWR_T9ez8) <Benoit de Valois>:
I will take a look at the source

[21:04:49](#YKrHpEiayPL47v3hAXuWN8Be445V_rENKqaDbixYhHk) <greggirwin (Gregg Irwin)>:
Guessing the dispatch in L:551 then.

[21:12:33](#gTidl0m8vXq-j36jFdygwzIfYgF4Mwbp8MuuHLGJlcE) <hiiamboris>:
Benoit de Valois see https://github.com/red/red/issues/4793

[21:13:00](#3DIdv67DA0Iy7zIXIipYimtHYj1ZdGjb6fd4UUBPKyM) <hiiamboris>:
I think your system is just as buggy as WSL, and we can't do anything about it

[21:13:34](#qENoHbmp-vizQOlwS5eHc0sxx82dsxWbsKmQ0jXCAkQ) <hiiamboris>:
* I think your system (docker one) is just as buggy as WSL, and we can't do anything about it

[21:15:55](#OP5oaFUUAeI40tvmb7McLHWcTl14FQN3gJTl9L3Xcnk) <greggirwin (Gregg Irwin)>:
Ì†ΩÌ±çÔ∏è

[21:17:12](#hCMfs1kdJB3drcbZ62d0VMxFj1BTaT3a8YL5Cz-l-xc) <hiiamboris>:
As for the binary, like was said already, `to string!` decodes UTF-8, so you need Bolek's codepages to convert other encodings. R2 has no conversion: it's binary and string is the same thing.

[21:17:42](#SCwUS-IUDXThOGktNign6frs6n-EffPK_N9OP5aCV9Y) <hiiamboris>:
* As for the binary, like was said already, `to string!` decodes UTF-8, so you need Bolek's codepages to convert other encodings. R2 has no conversion: its binary and string are the same thing.

[21:19:47](#iGL98gpuiy-BVh2sZhsKNkSc0-SsRObWsxiJqqF1wdU) <hiiamboris>:
* As for the binary, like was said already, `to string!` decodes UTF-8, so you need Bolek's codepages to convert other encodings. R2 has no conversion: its binary and string are the same thing (Linux console does the conversion in its case).

[21:30:24](#A60jhytEUlJ_7tS7wDaSaPoS2XKm2AqDxG9FAmcES3w) <Benoit de Valois>:
I checked the issue on a VM with linuxmint, and all works well, so you are right, problem comes from ubuntu inside docker

## 29-Jun-2023

[9:09:00](#QjDw_lvzCGySZ3gba_Ecvn0vQwkZATDWoMogf7gOBgY) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Interesting.

[10:41:31](#pLbVz44j8SBo5Nnjdq8fcj6fED9u8IRmI4B57xjWAbQ) <Benoit de Valois>:
hello
So I found the solution : updated docker engine with the very last one
problem solved
It was a bug in docker !
thanks all for the support

## 30-Jun-2023

[17:59:05](#rQAa_PUOBBxcfNrQCe-0dIzaF6AIafJ61Vr4PzH7CMQ) <Benoit de Valois>:
Hello
searching documentation about unicode, utf-8 etc... in red
need to encode a string in utf-8 but I am confuse about red

[18:00:14](#TfPWuHyrqdpdHg0CW7dEUGCeVXwjWa8lAJD74ihufLw) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Benoit de Valois: what are you confused about?

[18:01:42](#CJ8PMhwKwSOJCyQfYuG5LNqwCXiAy4TJAlNtI9-aiqQ) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Red expects text files in UTF-8. Internal representation is system specific but that's not exposed to user, so it doesn't matter.

To use different encodings, text must be loaded as binary and converted by user. I have a library for this as it's often requested.

[18:01:49](#gwsjjNRy4Wg5R3tkmGWQ6f37aBQlfp4J1GDrhB7rENQ) <Benoit de Valois>:
I know string are in unicode, but how convert it in utf-8 ?

[18:03:11](#-qKMXItrWru3R8YqwJ2c76JlB8-QkbSlEXzCWFiy38k) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Unicode is standard that defines several encodings, UTF-8 being one of them, the one that's actually used almost everywhere (there are of course exceptions). Most editors save in UTF-8 by default.

[18:03:40](#ck_HxAVQ327Ge-Qr2OySqA2ncjsGKGkCPGdUNGIp32w) <rebolek (Boleslav B≈ôezovsk√Ω)>:
If you do `write %file.txt "≈°√≥m√© t√©x≈•"` in Red, it's saved in UTF-8.

[18:04:31](#bncj5oHP2emToJEBiDdtCmWBOWaTvtvdKwvd6MLyvmA) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Classic ASCII (a-z, no diacritics) is subset of UTF-8, so it's fine.

[18:05:36](#ftZLMEabfd7Kbe4zvfBn6ilJrCyu799dkMSCp4Yt5bA) <rebolek (Boleslav B≈ôezovsk√Ω)>:
However, Windows 1250, ISO 8859-1 and other 8bit encodings are not a subset of UTF-8 and they need conversion before they are understood by Red.

[18:05:56](#u7EZlBZN7AEY9cRrPMUgbAUior9oMNJatgAdJiJBroU) <rebolek (Boleslav B≈ôezovsk√Ω)>:
(same for 16bit CJK encodings)

[18:07:05](#z4QXOSmb79CgHZ3GtNBHvx0eMTbp-_O1V5CoBg4BMVg) <Benoit de Valois>:
OK thanks for the reminder, things are clearer for me now

[18:08:46](#xPW5dMtYjRFAAE6Y9xSRh8ic1sGwnPHnQHOiPTFHUrM) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Here's my script for codepage conversion https://gitlab.com/rebolek/castr/-/blob/master/codepage.red

[18:09:37](#Qagr-RC3pRWxAXC_uP5SwmUJFoWpYdKT0eTil-5nLBQ) <rebolek (Boleslav B≈ôezovsk√Ω)>:
you need `codepages` from the same repo also, that file contains conversion tables for 10 most popular non-CJK codepages

[18:12:50](#PQhef0x40p3LYjgRD_asfId6U8Kl99uh6J5m934drVk) <Benoit de Valois>:
I use daily castr for my project, very useful

[18:13:27](#z1MZBTgzXv8S8w43vB41Vl95p8ZMFagy-Uopj-1TRDQ) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Ah, cool then :) Thanks for using it! 

[18:14:48](#m_LquEs-5Q3mPDTBCiqhzzrro99ORbWqs97bBCla9q8) <Benoit de Valois>:
thanks for doing it :)

[18:18:38](#zGDgBDH8qOOpK8yEOevoQkHT1Ga2ldrOdtKpEH9CZag) <rebolek (Boleslav B≈ôezovsk√Ω)>:
You're welcome :) Just a note, `send-request` and `make-request` aren't going to be updated (only if there's some bug preventing it from working) because they are written for "old" IO (the one still present in Red).

Red will (hopefully one day in the far far future) use new IO that's in the IO branch and there's `HTTP-scheme.red` that gives you the same functionality using standard scheme which is is of course much more pleasant to use.

[18:48:46](#DKO4MhS9WlOFjGLKHZBW3Ly2zmK669_irygu6sofMfc) <Benoit de Valois>:
OK, will adapt my code when new IO available

[19:46:28](#jrhWcH2dEblsCLmFnCUe47IsfGjUTvtOUK2y9SeE5OE) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@rebolek-5565a4bf15522ed4b3e100bc:gitter.im> Here's my script for codepage conversion https://gitlab.com/rebolek/castr/-/blob/master/codepage.red

Is there a way to recognize codepages?

[20:01:47](#m3Bp5taRG93aLz07ycIe--H-DBZnZ0f20JWN-E6ulA8) <hiiamboris>:
https://en.wikipedia.org/wiki/Charset_detection

[20:02:05](#u94nFHrqNbRpb7opJzljrSLf2WfTgspmzCrolrqCmi0) <hiiamboris>:
> Charset detection is particularly unreliable in Europe, in an environment of mixed ISO-8859 encodings

[21:00:40](#Hm91WFSLWGbBMs-nGMF9mplVjkVhkWoBeDlGMnfromc) <rebolek (Boleslav B≈ôezovsk√Ω)>:
The easiest way to detect codepage is to get the info from HTTP headers :)

[21:02:42](#B34v9yhdH4Y_DskCMFDH6i8sXfu_Qj12LypxtDHgmys) <rebolek (Boleslav B≈ôezovsk√Ω)>:
> <@hiiamboris:tchncs.de> > Charset detection is particularly unreliable in Europe, in an environment of mixed ISO-8859 encodings

If you know the text's language, detecting proper encoding is much easier

[21:03:52](#V7Vo4LpE5-GYB4q_8TQkXLKEkDfYkf1NA7Vj3nuDAMc) <hiiamboris>:
if you know the language, most likely you already know the codepage ;)

## 3-Jul-2023

[12:44:00](#8Mzs8LyPWf2GjOzxkGNeP5fwIhs6Oi-jlETNJd55oLw) <Benoit de Valois>:
arf
>> checksum/with "AWS4blablablabla" 'SHA256 20230703
** /hash support not yet implemented; algorithm TBD.

[12:52:22](#F-TXHQ0kmqgdHE34bhZCwRq7L0LmVG-XlCOZ6gnViWw) <hiiamboris>:
Some features are not implemented, the message seems okay in explaining it.

[12:54:18](#KOYjFgeMZqaII6adrGcAZ1D1aWT_Iw7sC5SAtU-zV08) <Benoit de Valois>:
yes, found a rebol function doing perhaps the same thing

[13:04:17](#4vP7RHO4Uyp0qlxGzfJ3fZ5SLtv_0V2Ofwml-t8Ht2o) <hiiamboris>:
What do you need to change hash table size for?

[13:19:41](#9ZmhTVhF1MKNFCVlmVAJvbycalHWcqy7StwWG5Se2ms) <Benoit de Valois>:
my goal is to calculate a signature for AWS
https://docs.aws.amazon.com/IAM/latest/UserGuide/create-signed-request.html#calculate-signature

[13:21:41](#tu1kDY4QlZtQgE_xCMi-4UNipv6u2SL8DmKmEtJhZ-4) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Benoit de Valois: how old is your Red version?
>> checksum/with "data" 'SHA256 "key"                                              == #{
5031FE3D989C6D1537A013FA6E739DA23463FDAEC3B70137D828E36ACE221BD0 
}

[13:22:06](#U4iFJDpcjP2lMmSHKmSr2CKSNeFAwQh51GlGvqZrbHw) <rebolek (Boleslav B≈ôezovsk√Ω)>:
 * Benoit de Valois: how old is your Red version?

```
>> checksum/with "data" 'SHA256 "key"                                              == #{
>> 5031FE3D989C6D1537A013FA6E739DA23463FDAEC3B70137D828E36ACE221BD0
}
```

[13:22:15](#7W-4qTe3FX-XkJ-07mlpzRnCMWHzujgNCFmgwZZdbZI) <rebolek (Boleslav B≈ôezovsk√Ω)>:
 * Benoit de Valois: how old is your Red version?

```
>> checksum/with "data" 'SHA256 "key"                                              == #{
5031FE3D989C6D1537A013FA6E739DA23463FDAEC3B70137D828E36ACE221BD0
}
```

[13:22:38](#cU6wFB5Gh2Luklt9NBu4Lo457NZ0w27Q0SNpGuUczFA) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Ah, it doesn't work with integer only, I see.

[13:23:53](#nD46w_2ZUTuGEQRkYmUwvqn9tz9LouUjZHu0Skc3l90) <rebolek (Boleslav B≈ôezovsk√Ω)>:
But according to the docs, AWS key is string, so you should be fine.

[13:24:43](#kkJzTNTTRUGAeqdyJF8nzmFF_01O3lQZyEOkJ0X4FG4) <Benoit de Valois>:
ah thank you, my bad, I try with a number

## 7-Jul-2023

[6:16:08](#kFzgEmNDEKiTWJt5zbP76JdfF-bfpzmND6iExzkegYw) <Benoit de Valois>:
rebolek (Boleslav B≈ôezovsk√Ω):  Hello ; I use your library (castr) 
I want to make a call with send-request but I need an example on how to create an header 
I don't know how to form this header

[7:03:59](#TDs9E64i8trmTit4zSr3QZot2dnG5PSzVGW3S0eF6_I) <rebolek (Boleslav B≈ôezovsk√Ω)>:
See the doc string:
```
     /with        => Headers to send with request.
        args         [block! map! none!] 
```

[7:04:26](#zqW8fXsjqzw71DvtoY2uVeMiiJJTbyi5d06FgyyGpCM) <rebolek (Boleslav B≈ôezovsk√Ω)>:
It's either a `map!` or a `block!` of key/value pairs

[7:05:12](#OukYc_3hO1OyQSyEKF1L6Au1LyFqmoF_1D3-q8ejeYk) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Something like:
```
send-request http://www.example.org 'GET #(custom-header: "I am custom header")
```

[8:18:34](#dMe71PcJdwLNHPXJHhwH3_q8B1qNmNGzQ828adEsXVQ) <Benoit de Valois>:
got "access violation" ARF

[8:19:39](#Pt3VBnLfmknrpcKuuFZh-oH75xcnsp3fERMLDii9pl4) <rebolek (Boleslav B≈ôezovsk√Ω)>:
What version of Red are you using?

[8:23:20](#0A-Spwb4d2I580T2x2fD6o4v6uzucuR-mpaQXyGn5Wg) <Benoit de Valois>:
end of june
problem coming from header field
I do some test


[8:24:01](#CFC2LCA1ywuyI_dw0mcV7NWmSDslXF-J98rMvX5Tfn0) <Benoit de Valois>:
I confirm, if I take your exeample of header, no pronblem

[8:25:04](#kxmZXehjLE2thMmv-TKuzkUYxDHiszsgdf3bKzYm6BM) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Yes, the header files are very fragile and can lead to this error. That's a bug in Red that's not going to be fixed as IO will be hopefully replaced with IO branch one day.

[8:25:20](#DzlXtmEcuKpkUGRYTmnv0Bh3T33nhja9Ri84DGnVCwE) <rebolek (Boleslav B≈ôezovsk√Ω)>:
If you can post me your headers privately, I can look into it.

[8:25:44](#Qj1DiJ4YhmDBsfvx-j_QOBX5VIHzlRdcnbK7k_Dzwx4) <rebolek (Boleslav B≈ôezovsk√Ω)>:
And your whole request ideally.

[8:32:46](#pDHjggkZmlEyhDHXX3psc53XicwF7shLtpPE5VkB820) <Benoit de Valois>:
OK, will do that if I am blocked
currently calls to AWS works but my request are malformed

[8:34:39](#hMZ7yhCJ0drRYT__jQrxEhZ5h2Uj9nKMCqtoi0qgJlQ) <rebolek (Boleslav B≈ôezovsk√Ω)>:
I would recommend using IO branch and HTTP scheme anyway.

[8:39:03](#L9d7o2wvF-_FsNQxtH8q5KiIjKpY2xNm3WdDmMiGJtY) <Benoit de Valois>:
once my program works (with castr) will try IO branch ;  this is the future
you know, calls AWS is not easy, not because of red but because AWS want strong authetification

## 11-Jul-2023

[6:09:20](#uyHpqar54GWoTzVUi4H91TrOIF6mVtukrLE2sF1d5x4) <lylgithub2021 (lylgithub2021)>:
I tried with this: `a: "x + 1"   f: function[x] [do a]    f 3`. I think I'll get 4, but failed. How to correct it?

[6:16:17](#C0Rlk3VylAwUvK449SdOfcsva-I_a3pePxBPkXBx_yU) <GiuseppeChillemi (GiuseppeChillemi)>:
Function creates a context with `X` defined in it. When you execute a `DO "x + 1", the `X` of the string is bound to the `system/word` context, which is the main one. So when you execute "X + 1"  the first element has no value because it is not the argument you meant but the main context one.

[6:16:39](#eN7mtRsJa4J-EbdZxJFM1Q1JV0VzVsGKITLowcK-jkY) <GiuseppeChillemi (GiuseppeChillemi)>:
 * Function creates a context with `X` defined in it. When you execute a `DO "x + 1", the `X`of the string is bound to the`system/word` context, which is the main one. So when you execute "X + 1"  the first element has no value because it is not the argument you meant but the main context one.

[6:16:52](#7o3Ut4pqKv8OqmKBYm_6N3Gb8E9JQu5ZQF8Mmk6e5MM) <GiuseppeChillemi (GiuseppeChillemi)>:
 * Function creates a context with `X` defined in it. When you execute a `DO "x + 1"`, the `X`of the string is bound to the`system/word\` context, which is the main one. So when you execute "X + 1"  the first element has no value because it is not the argument you meant but the main context one.

[6:17:01](#JjobZUSZ2kmKHuKZ1sBNodX6HWkzjZkN2xfQxw9RORU) <GiuseppeChillemi (GiuseppeChillemi)>:
 * Function creates a context with `X` defined in it. When you execute a `DO "x + 1"`, the `X`of the string is bound to the`system/word` context, which is the main one. So when you execute "X + 1"  the first element has no value because it is not the argument you meant but the main context one.

[6:17:31](#UGQE5oyeke89VgEXb5EukDs_lH3Q2ic37hPWGrz_iJE) <GiuseppeChillemi (GiuseppeChillemi)>:
 * Function creates a context with `X` defined in it. When you execute a `DO "x + 1"`, the `X`of the string is bound to the`system/word` context, which is the main one. So when you execute "X + 1"  the first element has no value because it is not the argument you meant to use but the one defined in the main context.

[6:22:57](#aZX_qo0qjSPYoc97slIQeO3y0ZtYu6kmbpT-UA_Gtnw) <GiuseppeChillemi (GiuseppeChillemi)>:
Remember that each word has a context. When a script is loaded, all of its words are bound to the main one. `function` and `make object!` create context whose "declared" words belongs to the new one. Words are not those inside strings but those blocks like `[X]`; `do "X + 1"` first loads the string, converting it to `[X + 1]` than `bind`s to the main context all the words inside the block, then interprets it. 

[6:32:06](#Ti8JL73lvX8nV6KVsTJTS5G_VfrzgDTZcnCptSbUxEo) <GiuseppeChillemi (GiuseppeChillemi)>:
This is a version that does what you want:

```
a: "x + 1" 
f: func [x /local code-as-block] [
  code-as-block: load a   ; the string is loaded 
  bind code-as-block context? 'x; all the words of the block are bound to the context of the local `x` 
  do code-as-block; then you run it
]
```
Then
```
>> f 3
== 4
```

[6:34:38](#gIiHmCfmTq_seVJLPuJRvGjTa_NxEMc0z0lhY0wLz_E) <GiuseppeChillemi (GiuseppeChillemi)>:
Note that:

```
bind code-as-block context? 'x
```
Could be written as
```
bind code-as-block 'x
```
Because `bind` indentifies the context internally of the word you have passed.

[6:35:07](#Xy_t5bXhnEsRgCns-362p4wZ09bE5AfizpWDFBynysw) <GiuseppeChillemi (GiuseppeChillemi)>:
 * Note that:

```
bind code-as-block context? 'x
```

Could be written as

```
bind code-as-block 'x
```

Because `bind` internally indentifies the context of the word you have passed.

[6:38:34](#mNw1DkSx6Kx2dKty-cjfXkiUDxMwEEMuW-zQLhM8s2s) <lylgithub2021 (lylgithub2021)>:
Thank you @GiuseppeChillemi so much!!! And why is `func`, not `function` used to define the function?

[7:16:03](#_2OTIdPzGQreyW6uLld1ThlSAI_6BrPvzkInLNOUXyI) <GiuseppeChillemi (GiuseppeChillemi)>:
Only to makes things more explicit to you. `func` does not auto gather set words, so you can see the whole function context in its first block.

[7:16:13](#zg50SgdJEVenyAaViHChH36VxmUzqUWR26AcPrGYKv4) <GiuseppeChillemi (GiuseppeChillemi)>:
* Only to make things more explicit to you. `func` does not auto gather set words, so you can see the whole function context in its first block.

[7:17:03](#QoQr2glfQXLglKNlf_BHOSdCCJHxGCTHG8rA4GOQo9I) <GiuseppeChillemi (GiuseppeChillemi)>:
* Only to make things more explicit to you. `func` does not auto gather set words, so you can see the whole function context in its first block.

## 12-Jul-2023

[21:52:13](#MyLv5MmjWCGZkN_FKICnOsEbWn3snVVA1D8-nUCgXEY) <Benoit de Valois>:
rebolek (Boleslav B≈ôezovsk√Ω): first successfull call to AWS API, thanks for castr !

## 17-Jul-2023

[1:16:17](#BJTIrswBxA_40IcOArMFfQzWPdNy7HKtw78SQrLiOvE) <lylgithub2021 (lylgithub2021)>:
I want to make a block from a string like "a 321-231      vv:45" using `load`. Then I get `[a 20-Aug-321 vv:45]`. You can see that `321-231 changed. What I want is `[a 321-231 vv:45]`. So, How to prevent 321-231 from changing to date?

[1:16:54](#tZiyw81M7bcL_weJyHvAs-pTExzhnevL53bZGG4-Su8) <lylgithub2021 (lylgithub2021)>:
 * I want to make a block from a string like "a 321-231      vv:45" using `load`. Then I get `[a 20-Aug-321 vv:45]`. You can see that `321-231` changed. What I want is `[a 321-231 vv:45\]`. So, How to prevent 321-231 from changing to date?

[1:17:35](#Og9SZVKZXu8YTqMr7N_svharFUC4hPjOWF23JKJ8U-8) <lylgithub2021 (lylgithub2021)>:
 * I want to make a block from a string like "a 321-231      vv:45" using `load`. Then I get `[a 20-Aug-321 vv:45]`. You can see that `321-231` changed. What I want is `[a 321-231 vv:45]`. So, How to prevent 321-231 from changing to date?

[1:26:21](#Asw-6zmakQo_EDEoimSWkZegdnW4KdIoXr32elbKQOw) <lylgithub2021 (lylgithub2021)>:
 * I want to make a block from a string like "a 321-231             vv:45" using `load`. Then I get `[a 20-Aug-321 vv:45]`. You can see that `321-231` changed. What I want is `[a 321-231 vv:45]`. So, How to prevent 321-231 from changing to date?

[2:29:04](#LM1fj6ntxxoqeVv0156II1wf5I3dz2glo72clRo9wSM) <greggirwin (Gregg Irwin)>:
That's a funny date lexing issue, related to the change dockimbel just made I think, as an old build errors trying to load that string.

You can't just `load` any data and tell Red not to process some values. It will try very hard to interpret what you give it as valid Red data. If you know the format, that's what `parse` is for.

[5:45:18](#d6qDKKUlGjEaaVRtO1ECyUcHHcccUeFwQQOihOCtxCo) <lylgithub2021 (lylgithub2021)>:
greggirwin (Gregg Irwin): Thank you for your info! I tried another way by `split`. But I was puzzled how to handle such a string when there are uncertain number of white-spaces between items in it(for example, between `a` and `321-231` there is one white-space; between `321-231` and `vv: 45` there are two white-spaces and a `tab`). In this case, how to make up a block from a string with `split`, or other better ways?

[6:05:57](#VSOGOh83WI5FP3hChu7iEq6KhTTyctIJjqTTWurtH8c) <greggirwin (Gregg Irwin)>:
Late here. If nobody else beats me to it, I'll post in the morning (for me).

[6:16:40](#CiujeFzgj--KeuWxQ7PYWSRS0aYWaDXbJvpVBS0WHMo) <lylgithub2021 (lylgithub2021)>:
Thank you and wait for solutions. The reason why I first try `load` to handle the string is that it does not care about the number of white space between items within a string.

[9:12:16](#lbSXaft-dbRVpNe3PhTCgaSnEWfsaoRmzPmdD_Vf8BY) <hiiamboris>:
`trim` then `split`

[11:26:05](#8nSzCw-9B7vkON6aUtIG33z3tNVvxF8Zihx7wcVbKko) <rebolek (Boleslav B≈ôezovsk√Ω)>:
I've updated [CASTR/send-request](https://gitlab.com/rebolek/castr/-/blob/master/client-tools.red) with a workaround for a longtime Red problem with headers. Red requires headers to be strictly in `header: "value"` format, otherwise it would crash with `Access violation`. If you try to use a different format, like `"header" "value"`, then see above what would happen (yes, `Access violation`).

Now Castr goes thru all headers and tries to convert them to `header: "value"` format. There's no error-handling, so if your header looks like `!@#(!:!!<` then I'm sorry.

I didn't want to do this update, I want IO to be merged, but that's probably not going to happen soon and people use this so here's the update. I really hope it's the last one, IO should be merged.

[12:13:21](#5MwRDcScvlSUMK1qASnqnejB-ghE6kF035D2tqlO2tU) <lylgithub2021 (lylgithub2021)>:
hiiamboris: You mean split then trim? Then how to distinguish commen white space and pure tab by split?

[12:31:39](#Omnqt4AhDbpT6norqrBcNhLoUQool47J0dJ0aqUcihE) <Oldes (@oldes.h:matrix.org)>:
```
>> nc: complement charset " ^-^/^M" parse "a  321-231^-vv:45" [collect any [keep some nc [to nc | end]]] 
== [#"a" "321-231" "vv:45"]
```

[12:34:41](#J0YcUUd4zGIowYDfYo4CpZUMvdjXuyPKE3BsSLs5eLI) <hiiamboris>:
```
>> split trim/lines "a 321-231  vv:45" space
== ["a" "321-231" "vv:45"]
```

[12:35:30](#6ubs7f5Om1A13YKjEkLrzqAXjn20zPuY-CKolbxhntk) <hiiamboris>:
(yes, the /lines name couldn't be more irrelevant, but this is just how it works today)

[12:37:17](#DTQfo2oOrEXLN_jxKbmZ3iuSPnaBMZEBgon7oP3U3Nk) <hiiamboris>:
* ```
>> split trim/lines "a 321-231  ^-vv:45" space
== ["a" "321-231" "vv:45"]
```

[12:38:58](#Wovi0XKwRsJtLs2cdb9W-Qmj2MXq__O-6ojlVuhoON8) <Oldes (@oldes.h:matrix.org)>:
`parse` is faster:
```
>> dt [loop 100000 [parse "a  321-231^-vv:45" [collect any [keep some nc [to nc | end]]]]]
== 0:00:00.340252
>> dt [loop 100000 [split trim/lines "a 321-231  ^-vv:45" space]]
== 0:00:00.800337
```

[12:43:26](#L99-k9LCNuMVdhmeGum0YCkqM8JErKIzpTSd8PIC59I) <Oldes (@oldes.h:matrix.org)>:
Which is logical, because `split` uses almost identical `parse` call.

[20:41:36](#4gAgvL1OmhiYBbEaBaGvNTJ4-0C0xy2Q_WmwkR3VaPg) <greggirwin (Gregg Irwin)>:
Here I come to support slower code. :^) It's the welcome room, so I feel this is important.
```
nc: complement charset " ^-^/^M"
dt [loop 1'000 [parse "a  321-231^-vv:45" [collect any [keep some nc [to nc | end]]]]]
```
vs
```
dt [loop 1'000 [split trim/lines "a 321-231  ^-vv:45" space]]
```
saves `~4/1000` of a second. Yes, it adds up over more calls, and that's a bridge to cross when you come to it.

What's most important here is not that the second example is smaller, it's that is has so much more meaning. Trim+split. In the first example you have `[complement charset parse]`, but it's not just 2 funcs vs 3. It's that the `help` for them is much more...helpful. `Help` for `charset` and `parse` will just make you look for detailed docs and the latter is a deeeeeeeep hole.

For me, the most important thing from this topic is that we need a better `split`. :^)

## 18-Jul-2023

[14:21:43](#JZUOlPa0tI2RQWRzcf3kasvqG_EVDkMj0brNePWp9Tw) <lylgithub2021 (lylgithub2021)>:
greggirwin (Gregg Irwin) Oldes hiiamboris Thank you all so much for these much helpful and valueable informations!!!

[14:22:31](#0bJuZULpjBo6ezu2uxvS4DYoMsYdhoLR5iXPd1mtyek) <lylgithub2021 (lylgithub2021)>:
 * hiiamboris: You mean split then trim? Then how to distinguish common white space and pure tab by split?

## 23-Jul-2023

[15:46:42](#7W47a2tZl6C4PAry0aIj30FssyVlcTMlk7ZCYC7qJho) <toomasv>:
> For me, the most important thing from this topic is that we need a better split

Hi there! So, has `split` evolved from the last year when we worked on it?

[15:51:33](#pOF3G_gJGs5V3GphVChPYTWemewuNFogrv5R5Co7Jgg) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@toomasv-58e74c67d73408ce4f56bd1f:gitter.im> > For me, the most important thing from this topic is that we need a better split
> 
> Hi there! So, has `split` evolved from the last year when we worked on it?

Welcome back Toomas!

[15:55:08](#-I8JSZgzfvxedOK9zqBOaW7qGzWxi8Qs_Rgrr96aUmQ) <toomasv>:
GiuseppeChillemi (GiuseppeChillemi): I never was far away :)

[16:08:48](#v7MkgeeeP0-H9n5uC8642YuuX8RryOjU1Bcbv_M0oAw) <GiuseppeChillemi (GiuseppeChillemi)>:
Happy to read this. It is important that our community doesn't loose any  other wizard.

[17:02:00](#_L5SNnz8j5cYTKE_MMFU5S-Egk5Cky7KcdZDQet-Eyg) <greggirwin (Gregg Irwin)>:
toomasv: No, it hasn't. :^( That's what we need to make happen.

[20:30:25](#a5zhDJjb0FXAW8bM7Rh7cUpSguFNsGzTFfl_CBwn1R8) <hiiamboris>:
I'm playing with it from time to time

[20:30:37](#HtT2Rt8r9K_Qa5jrftlz0Asnc5kcE6MN58waK3NxaVE) <hiiamboris>:
good toy for a dead tired brain ;)

## 24-Jul-2023

[3:58:38](#1CshdaAr3f7-IM-59LrsyGK-arSOxtFMilYlmYeY4CQ) <greggirwin (Gregg Irwin)>:
Someone recently commented on GUI console getting stuck. I'm seeing that now, where they've been idle for a while. I did have a system glitch earlier, where one monitor went away for a moment, so could very well have been that. The symptom is that there are one or more insertion point bars visible, in different places, sometimes many in a row, and the control is frozen.

Will leave some running and see if it happens again.

## 26-Jul-2023

[7:21:29](#cNBN_6se8LQvi_S0nDz1jW0bAwIMAsgplL92UZllX24) <lylgithub2021 (lylgithub2021)>:
Someone recently commented on GUI console getting stuck. I'm seeing that now, where they've been idle for a while. I did have a system glitch earlier, where one monitor went away for a moment, so could very well have been that. The symptom is that there are one or more insertion point bars visible, in different places, sometimes many in a row, and the control is frozen.

Will leave some running and see if it happens again.

[7:31:01](#I3BZKry3roWoTUM2bLJq4LN_LRTAuQgXWe3yCcrbQ3w) <lylgithub2021 (lylgithub2021)>:
```Red []
a: ["a" 1 "b" 2]
b: [[w u v] [x y]]
f: function [x][c: b/2 foreach :c x [probe reduce c]]
f a``` The above codes works all right under `red-gui-view`. However, when I write them into a script(named  "test.red") and compile it with `red -r -t Windows test.red`, error message is given--`duplicate word defination: c`. Why and how to deal with it?

[7:32:15](#T2wU-MzhuLtDc729jJ4FAp7ihz_9svQOYkxqLjJJahM) <lylgithub2021 (lylgithub2021)>:
 * ```Red
a: ["a" 1 "b" 2]
b: [[w u v] [x y]]
f: function [x][c: b/2 foreach :c x [probe reduce c]]
f a```
The above codes works all right under `red-gui-view`. However, when I write them into a script(named  "test.red") and compile it with `red -r -t Windows test.red`, error message is given--`duplicate word defination: c`. Why and how to deal with it?
````

[7:32:26](#9lUE-HflawbpuWySys5sXTHrUgBrf0Px4dXXZLsG5AI) <lylgithub2021 (lylgithub2021)>:
 * ````Red
a: ["a" 1 "b" 2]
b: [[w u v] [x y]]
f: function [x][c: b/2 foreach :c x [probe reduce c]]
f a
```
The above codes works all right under `red-gui-view`. However, when I write them into a script(named  "test.red") and compile it with `red -r -t Windows test.red`, error message is given--`duplicate word defination: c`. Why and how to deal with it?
````

[7:32:47](#O2FcG4WgEn7YDdP7koRrmAh4s1-0HLejy3rW17rqs9I) <lylgithub2021 (lylgithub2021)>:
 * ````Red
a: ["a" 1 "b" 2]
b: [[w u v] [x y]]
f: function [x][c: b/2 foreach :c x [probe reduce c]]
f a
````
The above codes works all right under `red-gui-view`. However, when I write them into a script(named  "test.red") and compile it with `red -r -t Windows test.red`, error message is given--`duplicate word defination: c`. Why and how to deal with it?


[7:37:20](#WpHHD5NWuj_QG_h2W9jNUJZfdPjI4yuoDsMqEHt6en0) <hiiamboris>:
e.g. stop misspelling `foreach c` as `foreach :c`

[7:37:34](#9X59nFeqwRP-L3a4v-LctIH0dO3audF7uJptcKdsZKk) <hiiamboris>:
what are you even trying to do with that?

[7:44:10](#UmYfj9GpE_77pVPSvrbzMxwx3cfeTaD6QH8xZrWsY-s) <lylgithub2021 (lylgithub2021)>:
You mean I should use `foreach c`, not `foreach :c`? I want to get(probe) `["a" 1]` and `'["b" 2]`.

[7:44:24](#kptO6FJpxauDx_oOtQ7L7Xr_8dJgosNjNKhzlBlC3vY) <lylgithub2021 (lylgithub2021)>:
 * You mean I should use `foreach c`, not `foreach :c`? I want to get(probe) `["a" 1]` and `["b" 2]`.

[7:50:40](#E83s4DpPVjb-uv5LTG20bTpO--Y28OmxUoRtTHY9Q6U) <lylgithub2021 (lylgithub2021)>:
 * You mean I should use `foreach c`, not `foreach :c`? I want to get(probe) `["a" 1]` and `["b" 2]`. I mean `foreach [x y] a [...]`

[10:29:22](#5fckrns97UHAD_Np_XEJBfC8T3vnwJLotYCAAPhONNY) <hiiamboris>:
I see

[10:29:54](#e8gkr-oevTvh_6Yg4lBQEbcQZxzmq9HiWr1XRWevED4) <hiiamboris>:
in that case use `foreach (c)` to let compiler know it is beyond his prediction abilities

[10:30:47](#ljTyw00lpawnBc7OhyhqkFxKWuJY9PvoXPJ-aFqyWHA) <hiiamboris>:
`foreach :c` is IMO a bug exploit, that triggers another bug in the compiler

[10:31:51](#R6rEx3jYsclM8ATpKKi2cS13SGkWz-j1H4gQ6wt3tM4) <hiiamboris>:
* in that case use `foreach (c)` to let compiler know it is beyond its prediction abilities

[10:36:31](#M-K8Vjbd9gi94gciVkTDAbxgfGXylculeHF7IznjCoo) <hiiamboris>:
* `foreach :c` seems to trigger a bug in the compiler

[10:41:05](#Mby1zbc4xxQ5YIjJ6KRl_ygUAjkAiJnSSi4aLZDwwX4) <hiiamboris>:
in general it's better to compile with `-e ` flag unless you know what you're doing and ready to combat a swarm of bugs

[10:52:48](#nKCZDegjwCe9TNYsXvuWO3O9_d8PGfqtUuvObG4e2wg) <hiiamboris>:
keep also in mind that your `x y` words are global, and in more complex code may create very confusing behavior

[11:51:54](#4_N2J9g7hzU82nO5UDC-OxXLG70ZQ2gorY9WQdHspWE) <lylgithub2021 (lylgithub2021)>:
Thank you so much for your solutions and suggestions!!

## 31-Jul-2023

[6:59:29](#gUxWxXR3V8_E214YMtlqWlYhFAjTpyRoekbidewVSsc) <lylgithub2021 (lylgithub2021)>:
`write request-file/filter ["text" "*.txt" "Excel" "*.xls"] "something"` I tried this code to save something into a file whose  extention name is certain(*.txt for example. In the pop-up window, I input "test" as the file name by which I'd like to creat a file named "test.txt". But I just get a file named "test". Why not "test.txt" and how to get it?

[7:00:00](#dfU4uHOddvh_MoJz6qtJ93P-uUNVWM-8Z5AB2zWQl38) <lylgithub2021 (lylgithub2021)>:
 * `write request-file/filter ["text" "*.txt" "Excel" "*.xls"] "something"` I tried this code to save something into a file whose  extention name is certain(\*.txt for example). In the pop-up window, I input "test" as the file name by which I'd like to creat a file named "test.txt". But I just get a file named "test". Why not "test.txt" and how to get it?

[7:53:03](#8eOgFfPZSl-v5OSiaKR6QljfItIykAHlDp4edbIABWU) <greggirwin (Gregg Irwin)>:
You need to append the suffix yourself, if the user didn't include one. Two reasons: 1) the user could enter one, and if it added it automatically, you'd have no way to *not* include it. 2) the filter for an entry can contain more than one extension. e.g. leave `/fitler` off and you'll see you get both `%.red` and `%.reds` files under "Red". How should it choose?

[11:24:37](#zrtts--vWSq8FgGSDUSupLLMzZOe20ToO4u7bTsnc5s) <lylgithub2021 (lylgithub2021)>:
Thank you for your suggestion. And, how to filter files of same type but deffirent extension name, such likke "*.xls" and "*.xlsx". I tried `request-file/filter ["Excel" "*.xls *.xlsx"] `, it does not work. So, what is the right way?

[11:34:46](#cXwgrND3rKXLtDdIb_oummMA9QtF-C-urxARC9FRfJg) <hiiamboris>:
separate with semicolon

[12:50:19](#6i3pkbk2lcFW8ov1ISvgvFi0qrB3txZIRjzjf953Ru4) <lylgithub2021 (lylgithub2021)>:
Many thanks! And where can I find detail info about the above issue?

[13:33:02](#xHnzMdwhuo-1gerbHy-kdQmO5XeiCGjYiuI3eD_InLA) <hiiamboris>:
you can request docstring update here: https://github.com/red/docs/issues/new

## 5-Aug-2023

[4:39:15](#0EeT89-ef3ovDKrczp23bWFZgh-spmtOB4XI0XJ76SI) <fabianorezende26_gitlab (Fabiano Rezende)>:
red has something planned for the webassembly?

[23:18:48](#S6KUGxiRKeYeYe1HCPFsfyEl0ANiGOjwdkmJh_6TjXs) <greggirwin (Gregg Irwin)>:
Not at this time.

## 9-Aug-2023

[10:51:00](#KG6LsIlOR1W1ezKedFMZ7cocEHmiJUlX-ZBPptoIwVs) <Mark Smith>:
> <@greggirwin-55659ddb15522ed4b3e1006f:gitter.im> Mark Smith: did `trace` help you at all?

Thanks for your response and sorry for my absence, I got tied up with other things unfortunately. `trace` looks very useful and I look forward to trying it out. I guess what I'm trying to figure out now is how Rebol/Red knows where one expressions ends and another begins and particularly around values and infix operations i.e. there are three expressions in `[1+2 3-4 5*(6/7)]`, and Rebol/Red must know this somehow. Is this done in the parser, or is this also the result of "free ranging evaluation"? Is it possible to define new infix-functions, such that these infix operators are just functions of a different form, or is there a fixed set of infix-symbols in the parser?

[10:51:59](#mAkz-AJe32BapezJ_9xo4dZXrRYf6fra2CQXl8rYqQM) <Mark Smith>:
:-) The absence of a/not being able to find the grammar for Rebol/Red is throwing me a bit here.

[10:55:57](#iapYY0ytlogVL-tLo3Z1u_SRSmP4Ay4nkA5hPxhPczY) <hiiamboris>:
Each Redbol function has fixed arity, so determining expression bounds at runtime is piece of cake. You can't do that ahead of time though, because everything can be redefined.

[10:56:47](#t4y9ZVGjIw9l25Q14PXdZPiRG0KRl4QUCozEMn_KqMc) <hiiamboris>:
Infix:
```
>> my-addition: make op! func [a b] [a + b]
== make op! func [a b]
>> 2 my-addition 3
== 5
```

[10:57:37](#QJf0dW8s28-2Ffw4f6fAss-K70qrooDXWhE26gkt7QI) <Mark Smith>:
Neat! Thanks for your explanation, hiiamboris.

[10:59:39](#XYg510r19NgUlxsV5EyadJN0Yv2w-ytibcNiCDej-x0) <Mark Smith>:
This may or may not be be too low-level but does that mean that when Rebol/Red encounters a datum i.e. a number, it looks ahead in the series to see if the next word is an infix function, OR is the datum pushed onto a stack with the infix-operator taking it's argument from there?

[11:01:12](#fSBvqRxGLKTYJ8U3nafqw-aDcd7nJVlB207nFDwlZDI) <Mark Smith>:
... OR is it more uniform than that and, knowing the arity of a function, Rebol/Red pushes all arguments onto the stack and the function takes them all from there?

[11:01:36](#rY71ZNPyimiLrpv-u8xussAbvffpE9jEyiOBPhfzKc0) <Mark Smith>:
I was imagining for some reason that the function was reading ahead in the input stream. Now I'm not so sure about that.

[11:01:42](#ijIhotLzhQgy9oBgYJH9coi3pqHuJEHYRy5E4LBg0dg) <hiiamboris>:
> <@marksmith:gitter.im> This may or may not be be too low-level but does that mean that when Rebol/Red encounters a datum i.e. a number, it looks ahead in the series to see if the next word is an infix function, OR is the datum pushed onto a stack with the infix-operator taking it's argument from there?

Both really. E.g. in `print 1 + 2 + 4` you have to look one token past `2` to figure out whether you pass `3` to `print` or keep evaluating.

[11:03:17](#8rSY2b-68ov-MAhnWMf8Y-w0DtE-uU6enngRm5rvcBs) <Mark Smith>:
Rights! So is it `print` that is doing that or something happening at a higher-level?

[11:04:39](#uUW7Ka-8hkV6zmncAtN7wlyzs3KD29C8g-3JKOafQ-U) <hiiamboris>:
The interpreter itself fetches the arguments and passes them to operators and functions. `print` itself knows nothing of evaluation rules, it's just a receiver of values and spitter of text :)

[11:05:33](#keNJiC88mrqwFHex97UCNAyZ1W0LkWgxgIes9ngiRLs) <hiiamboris>:
In this case `print` has arity of 1, so one single expression is evaluated, `print` gets called with the result on the stack.

[11:06:45](#q56J1DuDDSi6rBfCv3ChT2PQICPicghDCWIMcTC9o2c) <Mark Smith>:
For clarity, does this apply to both Rebol and Red? :-)

[11:06:53](#zS6Sgr-q08uGBLeb9FoLKcXNSYah6CTSl7ikOTqD3mA) <hiiamboris>:
Yes.

[11:07:11](#xGt0wbdkVBGds7coTUIENbBhlKQfgPxB3ubd3q-KMhg) <Mark Smith>:
Okay, things are starting to fall into place :-).

[11:12:40](#4YR-byOQB4DmnfDHET2CVG6_lHUIGvkNx3MFFpP0k6E) <Mark Smith>:
So all the Rebol/Red needs to do is to distinguish nouns and verbs, so to speak. If it sees a noun then it looks ahead to see if there is a verb that applies to that noun and then keeps going. The syntax is regular (and extremely dynamic!) and determined fully by the arity of the functions (maybe plus a little tag for infix-or-not). In the usual case the arguments follow the function so all the interpreter has to do is to look the number of expressions to fulfill the functions arity.

[11:14:44](#XNM-a_Y6tDN7-h9EUwNPO5Jznttse3M3zj2uqdA7T3Y) <Mark Smith>:
Are the expressions passed unevaluated or is it that the block are self-evaluating?

[11:16:40](#O1-wObTqK5yujAXuXW11hRfyVkEWfTRA2wyKuqotbng) <hiiamboris>:
Blocks are passive by default. You `do` them to evaluate, or your function may choose to do so itself, as is the case for many language constructs - conditionals, loops, etc.

[11:18:21](#Idhcy1dHftqWB-YdipJMV5c5rfbU_PL1Ty1OITYnl1A) <hiiamboris>:
I wouldn't invent "nouns" and "verbs" here. It's just words from Redbol perspective. Words are by default fetched, and if they yield a function or operator value, then that function/operator is evaluated.

[11:19:07](#OIpAJAeyCzzXofpzQ9AS3KLIVwdV-kJEHkyqMk4duak) <hiiamboris>:
* I wouldn't invent "nouns" and "verbs" here. It's just words from Redbol perspective. Words are by default fetched (think of word as a link to a value), and if they yield a function or operator value, then that function/operator is evaluated.

[11:20:43](#G_2V_zMgOzZBAqv71Gc_1FUlOQEEU55Q4XbbuOaoBpM) <hiiamboris>:
I suggest installing the Red console and playing with it. Humans learn by playing ;)

[11:22:09](#m0i0Uxot6OTQ-NyKnLW0Q83ZvEU7SZtn8tmXD8HLOk0) <Mark Smith>:
:-) I will certainly give it a go; in fact I'll do that now.

[11:24:52](#smlF4Ov8MR1DOmocz5cc7MDBUomH-agqj2-c0p4iyBA) <Mark Smith>:
:-) That makes sense, and I'm happy to adapt to the lingo. nouns and verbs made sense to me, given my personal experience, since everything is a word, but some words are the things themselves (nouns) and some words are actions (verbs, usually applied to nouns).

[11:26:16](#5CsemyQk1uXUy2NsAL9hVEBCn8x-bD9qipL6d9pebMY) <hiiamboris>:
It's purely our convention to name functions with verbs and values with nouns, for code readability. Not enforced in any way.

[11:27:43](#HrwZrrH5uG_Lt5iZVkvxU-QK-pqaVXJrQoVgeiF3Tjg) <Mark Smith>:
Does that imply that it's possible to define a function called i.e. `123`? 

[11:28:27](#qB0xaG0GEvmEqhdUbVv_p3Fwmbac7TmPXsl13F3ZTa8) <Mark Smith>:
Sorry, I meant define a word.

[11:28:47](#x3i0nOwiplnXGcj9KgmLGKozc5Pu0zd49FEpI68lc-g) <hiiamboris>:
`123` is lexed as a value of `integer!` datatype, so formally no. One hacker managed to do so, but that's bug abuse ;)

[11:28:59](#WUUEi7Fgda0BnnSzoV477BlpPfpNY4A6uu3G3B9efI8) <Mark Smith>:
;-)

[11:29:31](#wFOto8TzY5sIJBiYj1EQUn_x9GgPfC9hGXk1B9LF5JQ) <hiiamboris>:
Words start with a letter or some of the other symbols like `_` or `-` or `.` etc.

[11:30:41](#V9Cu9tlckWDiLwMm--Oe3xWqmZtNxTY4yWQy8JP8M6I) <hiiamboris>:
You can check it:
```
>> to word! "123"
*** Script Error: contains invalid characters
*** Where: to
*** Near : to word! "123"
*** Stack:  
```

[11:32:06](#3Cy45mBkJH7AGIgeotX7DAM-HE5tB-AmD7sQCklBSJA) <Mark Smith>:
:-) that's what I mean when I contrast nouns ("objects") and verbs ("actions"). I don't mean to go off topic but there is a definite (I think?) distinction between these two categories so saying that everything a word does makes sense, but we call these categories nouns and verbs, in normal everyday speak.

[11:33:17](#UAj9hXraUVGYJTNan3REd-Fu20Ii3ZHaQM96zmOx2mQ) <Mark Smith>:
I have to say that I am enjoying the introspectability, with functions like `trace`, and `to`! :-)

[11:33:24](#-QNKhdfrB-nmXjNjMxd2QQLhAvNJ5H1BVL5WLlgb-gE) <hiiamboris>:
Example. Is `sin` a verb or a noun? ;)

[11:34:51](#eYokhULUQEL_h4Y4UDiJfNkE3ExoFB9ZLnriy9_7My4) <Mark Smith>:
;-) That would depend on the context, would it not. In maths `sin()` is definitely a function, in theology... ?

[11:35:39](#lJEgHzaTmuM4cbdgsW0p54YRbQwabwS9cxPghF5CPzA) <hiiamboris>:
Exactly. Context defines the meaning in Redbol.

[11:36:29](#gY18UsFP12KugT7KinvZ86E2ooD2PC7NFSDOeUeyE2Q) <Mark Smith>:
But stops at literals? OR are literals also contextually defined?

[11:38:30](#xRIibc1WuV0FY58BAqUSVzuzweWtaUFet5KqYowvZSw) <hiiamboris>:
There are lexical forms that form the basis to work upon, with 50+ datatypes allowing quite the expressiveness. But if it's lexed as a `word!` then only a context gives this word meaning. Bookmark this https://github.com/red/red/wiki/[DOC]-Guru-Meditations#binding-by-vladimir-vasilyev-9214 for later reading.

[11:38:54](#C-e-Vp1UUmLRIx3dsEXCW8n1AZn5AjRxnunR7hlwmhM) <hiiamboris>:
* There are lexical forms that form the basis to work upon, with 50+ datatypes allowing quite the expressiveness. But if it's lexed as a `word!` then only a context gives this word meaning. Bookmark this https://github.com/red/red/wiki/%5BDOC%5D-Guru-Meditations#binding-by-vladimir-vasilyev-9214 for later reading.

[11:40:58](#dVwboWar2Mi_Y-pySbmUBWUJSY1K3hmVF-DuXN3t2aI) <Mark Smith>:
Thanks, hiiamboris! :-) I'll start reading.

[11:41:07](#X3iOwmusz4tbc8SfXP4JhDmbOyB6XATFlOHFBCLZ0Vs) <Mark Smith>:
I'm a big fan of documentation when I can find it.

[17:29:32](#0EXdVefZMer-4vmkpe8ZxSLye3XMDgRg2JsVtZDeNjk) <greggirwin (Gregg Irwin)>:
Only `any-word!` types can refer to other values and have a binding context. Other literals can't do that, so `1` is always `1`.

## 20-Aug-2023

[4:50:05](#uLDih350NQcvhAPDwXWQgni1XK-RxmrcdEp_Nx5Bo9c) <cloutiy (yc)>:
Does red have all that is needed in order to make a web server?

[14:47:27](#0I8u-HW2xUGoyNf-i0l-yXJe4OcZOwGKKg68RL_q5cM) <dockimbel>:
In the IO branch, yes.

## 21-Aug-2023

[2:51:49](#SOulKkVEvs59RYSmhk8Gpi79lUuMczcYS1w5UqmiyzY) <cloutiy (yc)>:
Ì†ΩÌ∫Ä

## 28-Aug-2023

[6:55:13](#jMJLXpQXiTFjwDf1lcR3eOw7RLzDQS8wCSeCA1R9njI) <lylgithub2021 (lylgithub2021)>:
Hi, in my program, some strings from an external file(part, not full) is introduced. I wonder if there are methods in Red to run the compiled program whithout the surpport of external file. That is to say, how to integrate something into program during compilation.

[6:57:50](#NnRRXFcpAk8KJ_j1UwAuxvF229VaGF6YgFUljz3fNQ4) <lylgithub2021 (lylgithub2021)>:
 * Hi, in my program, some strings(part, not full) from a few external files is introduced. I wonder if there are methods in Red to run the compiled program whithout the surpport of these external files. That is to say, how to integrate something into program during compilation.

[6:58:14](#lYYU4XDQT3QoOWOPHPmW0qLkAgsGni3qo0u6ElpfNpY) <lylgithub2021 (lylgithub2021)>:
 * Hi, in my program, some strings(part, not full) from a few external files are introduced. I wonder if there are methods in Red to run the compiled program whithout the surpport of these external files. That is to say, how to integrate something into program during compilation.

[7:34:08](#jAdvHMOJ7yjYneAARSLG0bbjBSilSCp7ZsO9xGwAgtI) <hiiamboris>:
#include

[8:07:04](#vbyfMlvqrTawPDKZix0lK8lpui9l-5XpllDsbegi6Ec) <lylgithub2021 (lylgithub2021)>:
How to integrate strings into main program with #include? Would you show me an example? I don't find the description in Red Console.

[8:14:03](#1uB7uxJUU-jpKLNLw2VmwikdMqUfEBjoaQcudZOH5PI) <hiiamboris>:
`#include %my-strings-file.red` will insert the file into your program, and then compile.

[8:14:45](#FsTcoQPl2pqFNa6BcMe7xTRZMLcb-OqpA41IYkHA3IQ) <hiiamboris>:
https://github.com/red/docs/blob/master/en/preprocessor.adoc#include

[9:38:00](#aK_Ftte97-YqpVXoMnoRkIFLzjjHOjFMCK8xljuLjWI) <lylgithub2021 (lylgithub2021)>:
hiiamboris: Many thanks! What I  want is to integrate some strings from different files into my program, not the whole file. Any ideal about this?

[9:47:07](#Z4ZNbjxTniyDHfxRegL8Hf7oE7hmme5ahfKl_pamprY) <hiiamboris>:
Put strings into a separate file.

[17:57:32](#R3WYZ8kRxX48i0mxSHnD2iRIY6yUMiMIGf0d4iQ-frI) <greggirwin (Gregg Irwin)>:
Until you `load` a file it's just one chunk of text/binary data, so Red's `include` system doesn't know anything about what's inside it. If you want to do something more involved, like extract named elements out of Red files you use as external content, you will have to do that yourself. Then please tell us about your solution. You can, of course, include the entire file and just address the sub-parts. Unless your file is huge you probably don't need to worry about space wasted by unused content.

## 29-Aug-2023

[2:01:08](#HYOqK13t32c93KUFQK1A_upD34LOBUe0szdCi8DA25A) <lylgithub2021 (lylgithub2021)>:
greggirwin (Gregg Irwin): hiiamboris Thank you. I need to learn more.

[6:50:50](#qhfyN6P0QD2IVqhFn0Gn-P582L2MJsBT9csfkwuZTNo) <lylgithub2021 (lylgithub2021)>:
`find [none %.txt %.red] suffix? %a` Why does `find` in this code find nothing? I think it should give `[none %.txt %.red]`. And how to make it found?

[7:16:35](#4xLdfIhUVaXq_RpB-zqFwFXQ196VOODtG7SwSb40omM) <hiiamboris>:
try `>> type? first [none]`

[13:39:15](#zSflcn_-XjhlQ6IlnStdhIC3Aa0Arjc2mBxpTKoLfZY) <Oldes (@oldes.h:matrix.org)>:
lylgithub2021 (lylgithub2021): use `find [#[none] %.txt %.red] suffix? %a`

## 30-Aug-2023

[1:40:48](#VJa2N_AF_59iqEU5_Q6d7JwNxSAbatEZ6WiIwtoGM78) <lylgithub2021 (lylgithub2021)>:
Oldes: hiiamboris Ì†ΩÌ±çÔ∏èÌ†ΩÌ±çÔ∏è

[1:48:04](#yDqlAA9aBBtJyCmw272M07uGePwv797D4pDIyjdW9NM) <lylgithub2021 (lylgithub2021)>:
I learned that functions in red can be docummented as the following example showes: `f: function["fff" x "xxx"][x + 1]`, and can be reviewed by `? f` in Red Console. My question is how to extract the description string("fff" in this example) in Red programing.

[5:21:15](#B9qi923An5ox3cT2TgkOeBhva5X4f5n5nTs6kX-6fbY) <rebolek (Boleslav B≈ôezovsk√Ω)>:
You can get function specs with `spec-of` function:
```
>> f: func ["help string" arg] [arg + 1]
== func ["help string" arg][arg + 1]
>> spec-of :f
== ["help string" arg]
```

[5:21:34](#BqUhEwvJ7r-caYv8yBonln8dGjJzABHENg3CdJWsXWA) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Then you can either parse that block or use some other method to extract the help string.

[7:12:48](#NfWStQVnIOLVI8me74pEpNiaO6wj6xN41xligIihQNY) <lylgithub2021 (lylgithub2021)>:
Thank you so much!!

[17:33:44](#n_Jc-ItDfmkmmMURZ6rsaZENr82QfjdqZK0CkqnCcxY) <greggirwin (Gregg Irwin)>:
And `help` is written in Red, so you can see how it parses funcs specs and use that code.

[18:09:31](#B9jwonfNRirn7v1Nahn_5AaZY0-nS4sjM1cWUFhLj3g) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@greggirwin-55659ddb15522ed4b3e1006f:gitter.im> And `help` is written in Red, so you can see how it parses funcs specs and use that code.

Didn't we have an 'help-string?' function already in Red?

[18:12:05](#bHHXQ0EXXVYoN9r79fFx8870dfffoXa_9P1XD64RpTs) <greggirwin (Gregg Irwin)>:
Yes, `help` just wraps that. They're in the same file and context.

## 2-Sep-2023

[7:41:44](#Xqil8KegisWGSP8qd8N9sqrAaaKLHayNEY9Gyc6Uw5s) <lylgithub2021 (lylgithub2021)>:
```

[7:48:15](#ro9-hYQ9kB4yv7ssnOxuyfVM1j4kxgqS5qnwF20zhmE) <lylgithub2021 (lylgithub2021)>:
 * ```
Red[File: main.red]
#include %b.red
#do [write %0.txt g 7]

Red [File: b.red]
g: function [x] [x]
```
When I run the above code(in two files) with Red interpreter, the result is as expected. But when I compile `main.red`, an error messages are given like : `Script error: g has no value`. I think this is because code in `#do` can not "see" word! in "included file". How to make it visible to `#do`? 

[7:49:43](#EaWcT2YzyL6puUjnam-wUSSLzgF0sQ6ktMW7HBo0G0g) <lylgithub2021 (lylgithub2021)>:
 * ```
Red[File: main.red]
#include %b.red
#do [write %0.txt g 7]

Red [File: b.red]
g: function [x] [x]
```

When I run `main.red` with Red interpreter, the result is as expected. But when I compile `main.red`, error messages are given like : `Script error: g has no value`. I think this is because code inside `#do` can not "see" word! in "included file". How to make it visible to `#do`?

[7:51:41](#OLM2oEqFfAHLNF-KFX137hTdaZ3z_JE4ciig4m-fOR4) <hiiamboris>:
tried `#do`?

[8:10:16](#6Nm10DaK29iQ3nfSQidQKbKYWKFy-B4R6fm9n5JSTrc) <lylgithub2021 (lylgithub2021)>:
hiiamboris: I need to create a file during compile-time

[8:13:13](#YcGRY95rGNDkUFCoSyaaRo3i8AtPACMuibfCnTv1fG8) <lylgithub2021 (lylgithub2021)>:
 * hiiamboris: I need to create a file which will also be `#include` during compile-time

[8:15:18](#7Eykj3-PheYTFe3Mu50OOTqCnwe_j7gOOx4XercZCfo) <hiiamboris>:
> When I run main.red with Red interpreter, the result is as expected

What result is "as expected". I'm getting `*** Script Error: g has no value`

[8:15:41](#V4QCvWgLNuktA9WN2yDx8Q3ChHzlu7_-vkq02g7CL7M) <hiiamboris>:
* > When I run main.red with Red interpreter, the result is as expected

What result is "as expected"? I'm getting `*** Script Error: g has no value`

[8:16:36](#_koaZjaohtkoySTANRvtq29f8HN0tcLAMQu1e6NpfP8) <hiiamboris>:
if you want to declare values to be used by the preprocessor, you have to declare them *using* the preprocessor

[8:17:48](#-8ix7CExBIr10FsxdBAV6BtWiFSXe5QPEChPHUxwGoI) <hiiamboris>:
* if you want to declare values to be used by the preprocessor, you have to declare them *using* the preprocessor, hence use `#do`

[8:21:17](#LjQxOZfDC4QZnD8klYGBBakPFlKBJuIGilbLZMP_29s) <lylgithub2021 (lylgithub2021)>:
Run `main.red` by Red interpreter, it creates the file "0.txt" whose content is "7" -- this is what I want. But it fails to compile by red compiler and give the above error message you see. Would you give an example of your solution?

[8:21:48](#3R1F-GQauKvKMNDnopkJEysJJW0yZfVBWCN6WdGNXY0) <hiiamboris>:
> Run main.red by Red interpreter, it creates the file "0.txt" whose content is "7"

my build `Red 0.6.4 for Windows built 1-Sep-2023/19:17:00+03:00  commit #8fa47cf` doesn't

[8:22:35](#IK1Jtsojor4GOBcJ-0I2_32gDLrO_F5JUco5pDnGuFA) <hiiamboris>:
> Would you give an example of your solution?

I want you to understand what I'm saying, not just blindly paste solutions

[8:41:22](#W1JHr6-nVk1-KJ7CYUrN3_hV5gjuVYY5M_kXEmeFEK8) <lylgithub2021 (lylgithub2021)>:
> <@hiiamboris:tchncs.de> > Run main.red by Red interpreter, it creates the file "0.txt" whose content is "7"
> 
> my build `Red 0.6.4 for Windows built 1-Sep-2023/19:17:00+03:00  commit #8fa47cf` doesn't

This is my version of red `red-view-01sep23-8fa47cf44.exe`. Running it,on the GUI window, I input "do %a.red", then "0.txt" succeeds to create.

[8:43:14](#PQ-Mguj55yYsK993t5lcY5ZtPoO4ylpkVG9_-n3CTY4) <lylgithub2021 (lylgithub2021)>:
 * This is my version of red `red-view-01sep23-8fa47cf44.exe`. Running it,on the GUI window, I input "do %a.red" and push `enter`, then "0.txt" succeeds to create.

[8:47:30](#Lh21mqMTeJDZOFuBD7G8611zUEYTAGw0jVitMB08URY) <hiiamboris>:
I can't reproduce that:
```
>> do %a.red
g: unset!
*** Preprocessor Error in #do 
*** Script Error: g has no value
*** Where: ???
*** Near : write %0.txt g 7
*** Stack: do-file expand-directives also expand do-code do-safe 
(halted)
>> about
Red 0.6.4 for Windows built 1-Sep-2023/19:17:00+03:00  commit #8fa47cf
>> print read %a.red
Red []
#include %b.red
#do [?? g write %0.txt g 7]
>> print read %b.red
Red []
do [g: function [x] [x]]
```

[8:53:21](#C3pAQd5erQLohncN0T6RHRRfze3l-WJmHO8FeOD2O74) <lylgithub2021 (lylgithub2021)>:
close and reopen red-view, I get the same result with yours, sorry!
```
>> do %a.red
*** Preprocessor Error in #do 
*** Script Error: g has no value
*** Where: ???
*** Near : write %0.txt g 7
*** Stack: do-file expand-directives also expand do-code do-safe 
(halted)
>> print read %a.red
Red[File: main]
#include %b.red
#do [write %0.txt g 7]

>> print read %b.red
Red [File: b.red]
g: function [x] [x]
>> 
```

[8:56:18](#o3t3Q45ZenA1_OfZpgxlMkB6vN56FDBvHtGFSWEs_yM) <lylgithub2021 (lylgithub2021)>:
 * close and reopen red-view, I get the same result with yours, sorry!

```
>> do %a.red
*** Preprocessor Error in #do 
*** Script Error: g has no value
*** Where: ???
*** Near : write %0.txt g 7
*** Stack: do-file expand-directives also expand do-code do-safe 
(halted)
>> print read %a.red
Red[File: main]
#include %b.red
#do [write %0.txt g 7]

>> print read %b.red
Red [File: b.red]
g: function [x] [x]
>> about
Red 0.6.4 for Windows built 2-Sep-2023/0:17:00+08:00  commit #8fa47cf
>> 
```

[9:31:17](#z2abv7fD0yFw7Mp9q640qYBPFdOTg6f_dOP70dfP3xI) <lylgithub2021 (lylgithub2021)>:
hiiamboris: According to your proposal, I tried with `#do [do %b.red]` and failed. Why is this a wrong way?

[10:05:28](#GDpHWXHC5MV4wfW9ctlPLbiOL4B9LHTh9F0odzpDFSw) <hiiamboris>:
that was not my proposal

[10:05:44](#wkvMUHUjWzWoas0vZmlm0RkOnnbUGfXwsGTxS1_NT9o) <hiiamboris>:
> <@hiiamboris:tchncs.de> if you want to declare values to be used by the preprocessor, you have to declare them *using* the preprocessor, hence use `#do`

re-read this

[11:40:54](#k0ErMJmf7ul7ncmwR0mt5HOLh0MmvWW0f4LO9zciGXg) <hiiamboris>:
any luck lylgithub2021 (lylgithub2021) ?

[15:38:43](#i4UCURaoFDEVlTlzl95MQCNqSJ5sSV2-BM9B241liIs) <lylgithub2021 (lylgithub2021)>:
Why does the following minimal codes succeed to run under Red interpreter, but fail to pass compilation? And how to make them compiled?
```
#either true [
#do [
  f: function[blk][
  result: copy []
  foreach i blk [append result parse i [collect [thru "!" keep to "?"]]]
  result
  ];;f
  print f ["!abc?efg" "abc!efg?"] ;;["abc" "efg"] is wanted
]
][]
```

[15:39:31](#rOKuckkZkaP90g9s5FqJYm7FhAvcQDz4a0OFwNCNY8o) <lylgithub2021 (lylgithub2021)>:
 * Why does the following minimal codes succeed to run under Red interpreter, but fail to pass compilation? And how to make them compiled?

```
Red[File: main]
#either true [
#do [
  f: function[blk][
  result: copy []
  foreach i blk [append result parse i [collect [thru "!" keep to "?"]]]
  result
  ];;f
  print f ["!abc?efg" "abc!efg?"] ;;["abc" "efg"] is wanted
]
][]
```

[15:41:56](#Kj7uxFXBHKlUi5equ_j5XFbUc2su3OhhiLTX5MB4DU8) <lylgithub2021 (lylgithub2021)>:
 * Why does the following minimal codes succeed to run under Red interpreter, but fail to pass compilation? And how to make them compiled?

```
Red[File: main]
#either true [
#do [
  f: function[blk][
  result: copy []
  foreach i blk [append result parse i [collect [thru "!" keep to "?"]]]
  result
  ];;f
  probe f ["!abc?efg" "abc!efg?"] ;;["abc" "efg"] is wanted
]
][]
```

[18:34:35](#y909-BVcdvE_bs1PMfPhhgsttA1rHCzI64Yersl8hEo) <hiiamboris>:
Compiler is written in R2, so you have to use the compatible language subset.

[18:35:11](#djenjx1zQa2c15XVzFZj_6iz5zt9OP241JK8Jz6dXzs) <hiiamboris>:
Namely `func` in place of `function`.

## 3-Sep-2023

[1:54:10](#6d1w0VTq93IjIXiVCxKKfBn8dwsEE5JY2P_BvV0ETyE) <lylgithub2021 (lylgithub2021)>:
Yet still fail to compile the codes with the same error message given -- `Invalid argument : ?function?` through `f: function` is replaced with `f: func`. Does the problem come from `parse` in codes?

[2:20:02](#uTa4aLJ1LaWFLCpgdhEKeEG_Gn2Txnjr5XE6wv5Em3E) <lylgithub2021 (lylgithub2021)>:
 * Yet still fail to compile the codes with the same error message given -- `Invalid argument : ?function?` through `f: function` is replaced with `f: func`. Is it `parse` in codes which causes this problem?

[2:28:37](#aW9Y8T_bTaaLLzv4YA_5UyMhrC6tgUyd_1z3xlum9Rw) <lylgithub2021 (lylgithub2021)>:
 * Yet still fail to compile the codes with the same error message given -- `Invalid argument : ?function?` through `f: function` is replaced with `f: func`. Is it `parse` or `collect...keep in parse`  codes which causes this problem?

[2:28:58](#Hu7jQAjj1VIvY30E5GBrCcX3YNbBRUVmj76i8D1IOTY) <lylgithub2021 (lylgithub2021)>:
 * Yet still fail to compile the codes with the same error message given -- `Invalid argument : ?function?` through `f: function` is replaced with `f: func`. Is it `parse` or `collect...keep in parse`   which causes this problem?

[2:30:21](#pOWnfZDSXp5JNfykDSFlcMs4KwQNQ-u7T4b5ptZUu1w) <lylgithub2021 (lylgithub2021)>:
 * Yet still fail to compile the codes with the same error message given -- `Invalid argument : ?function?` through `f: function` has been replaced with `f: func`. Is it `parse` or `collect...keep in parse`   which causes this problem?

[7:32:11](#LcVGiGlAjdcleIu_TdNEYdcLdcxVCDzsQVm7Dt28Bc8) <hiiamboris>:
You may be passing into parse what you think is a parse rule, but what parse thinks is a global function.

[11:31:27](#bRyS7Jt_DdMtgpVu03vo2e1OzaxJZ3UWN3_5Vm8TD48) <lylgithub2021 (lylgithub2021)>:
Why is `collect [thru "!" keep to "?"` regarded as a global function by parse?

[11:32:58](#_ddrWqNMCJop4Ll8oAvflPfjHmcxn--Er6IeaU92eco) <lylgithub2021 (lylgithub2021)>:
 * Why is `collect [thru "!" keep to "?"]` in my example regarded as a global function by parse?

[11:35:52](#RMBDrnepUglhCxoQpBxiJvfbnF646X_iPUt_TN4QVhI) <hiiamboris>:
do you see `collect` among [R2 parse rules](http://www.rebol.com/docs/core23/rebolcore-15.html) ?

[11:37:00](#E9OuaMBBC8WGdhWNQgkTShe7MdGRmBLMl6zS6SzmLKU) <hiiamboris>:
* do you see `collect` among [R2 parse rules](http://www.rebol.com/docs/core23/rebolcore-15.html#section-10) ?

[13:25:40](#7QbYUb7zWYQuCcM0znTziOR5KZbPUYFlRCca4Lz4NBM) <lylgithub2021 (lylgithub2021)>:
As my codes are wrapped in `#do[]`, `collect` causes failing to compile. However, without `#do[]` they succeed to compile. I'm puzzled: is the use of `collect` in parse the root reason?

[13:26:12](#ymnsOxZT-W4ZVtFF3hhx-a3UvmQTqTojmwGpuloIrIA) <hiiamboris>:
try removing it and see

[13:27:15](#2zWT2yLHdzNGZ-8N8JXbQvkTIE7aNs4eTQMT_3HPzig) <lylgithub2021 (lylgithub2021)>:
 * As my codes are wrapped in `#do[]`, `collect` causes failing to compile. However, without `#do[] and #either` they succeed to compile. I'm puzzled: is the use of `collect` in parse the root reason?

[13:31:19](#ATtr1H6156s_PI3ZXegIDJDoJmgj6AdGXXDc_jFM-Ro) <lylgithub2021 (lylgithub2021)>:
Yes, I have tried without `#do and #either`, the code now passes compilation

[13:32:47](#roRNsU4vB1s0R93YUVdFxoqyl4lnlrnZMBSCVDefeuQ) <lylgithub2021 (lylgithub2021)>:
 * Yes, I have tried without `#do and #either`, the code now passes compilation. That is why I'm not sure if `collect` in parse is the root cause of failing compilation.

[13:36:00](#WWD-TgoxytpL3zwRpxpZdYNC7sQZYR-fGdqhkotOlWY) <hiiamboris>:
try removing `collect` to be sure

## 5-Sep-2023

[7:08:46](#ku9WvgMxcV-3H5vMoLN1NoSsF9QMtY_NFZn_dCY-8-c) <lylgithub2021 (lylgithub2021)>:
 I'm driven mad by the following simple code when compiling the file `main.red`. The compiler always give error message `undefined word f`. What's wrong with my code?
```
Red [File: main.red needs: view ]
either true[
do %b.r
f "cc"
][]
a: f "dd"
view [text a]

Red [File: b.r] 
f: func[x][x]
```                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       

[7:26:55](#Q8nAnL-oJza0ZHHEPV46wYManHWK6TmKJ1c0Cfq0L9w) <hiiamboris>:
add `-e` flag to compiler

[7:39:21](#IQCRxtQh9FzwNhRo8nQf_xsEI1Axsjpv2VrKJF_jXiM) <lylgithub2021 (lylgithub2021)>:
Does that mean sacrifice of performance of running code? And does that mean most of codes built with the achetecture like the above example have to be run at interpreter-mode  because of -e must be used?

[7:41:16](#UEX3xAR1MBWbkmb8fu5aR5XiNWCiOtDTFLuE9hOZVwI) <hiiamboris>:
on performance - measure it

[7:41:28](#mlFuHIoMjytStSMv4q9cNWlYA4U55bgC4NWd-Z_h3Qg) <hiiamboris>:
you have `dt` and `clock` built in

[7:42:00](#2YxNarORGOBeIOPf9Ix9RwPQ9EDUsdXBYEBc1Y6Jybs) <hiiamboris>:
if it's not enough, there are workarounds to make compiler happy, but usually it's not worth it

[7:42:17](#XjHcE9i8fvqfu6J7Jcm54RyM8upWm4tDjCn9yodNV24) <hiiamboris>:
human time is by far most precious resource we have

[7:47:29](#vTzNnUOfkWA_K-xLnALd82i3_xbUJ_2NamWrOga_Tq0) <lylgithub2021 (lylgithub2021)>:
Thank you so much! And why does my simple code need -e for complier? It just invokes another red file to acquire some definations of functions or other.

[7:50:16](#ennlpFv83fGETJotmAZE_iQi3xhIhEqiB9HN01BWEfg) <hiiamboris>:
but compiler cannot predict the side effects of `do`

[7:51:27](#KDMVO4o95yrSgkgrxCkUojxJSO0K7sp0HIOIhCFcyBw) <hiiamboris>:
to compile something it must know what it is, or skip it and let the interpreter handle it later

[7:55:36](#85wxe05UQ1DzuYH2lgjtM9IXYOHmLWv0rLJ4Zuo_yaQ) <dockimbel>:
`do` loads a new file at run-time by definition. How can the compiler process that? Use `#include %b.r` to include the other file at compile-time instead.

[7:56:09](#IPwdDMReWuyWVecfn9fppYz3xL8zZrnd9zrSLsf_bY0) <dockimbel>:
 * `do` loads a new file at run-time by definition. How can a compiler process that? Use `#include %b.r` to include the other file at compile-time instead.

[8:21:41](#jMdoqj8mZOb0qzbUhF3iX1lwm31B2vBTI1CXuGMIZVE) <lylgithub2021 (lylgithub2021)>:
Thank you. I have tried `#either true [#include b.r...][]`. Yet the definations from b.r in this way can not be recgonized by main program.

[8:21:57](#kkBtVbDIm0nEa4KzMxzPpefYmv3fDYT0AlsMDBEt0uM) <lylgithub2021 (lylgithub2021)>:
 * Thank you. I have tried `#either true [#include %b.r...][]`. Yet the definations from b.r in this way can not be recgonized by main program.

[8:22:10](#y0aaCbpBSmxXL8u5TlXlepJ7Bnq9RunYPdUQsZtvWZw) <lylgithub2021 (lylgithub2021)>:
 * Thank you. I have tried `#either true [#include %b.r...][...]`. Yet the definations from b.r in this way can not be recgonized by main program.

[8:24:37](#xorDOQT5jHHoNhCZFFcBYsqbdkMw4ivnwm6EurQpIdk) <lylgithub2021 (lylgithub2021)>:
That is to say, if `do %file` is used, `-e` must be introduce in the duration of compiling? And other conditions that  must use -e to finish compilation?

[8:26:30](#DRZTLTrCn97e6_IoFeEAyu41v696jt1PPCBzdbTIh8g) <lylgithub2021 (lylgithub2021)>:
 * That is to say, if `do %file` is used, `-e` must be introduced in the duration of compiling? And other conditions that  must use -e to finish compilation?

[8:37:47](#jj2qAL1p_H5L1V0ao9HbPK2AlHBX6AvigF6l7Fj4c-o) <lylgithub2021 (lylgithub2021)>:
but when I wrapped the code by `#do, #either` etc to get the related info from external file in compile-time, it still faild to compile(no use of -e), which means the compiler know exactly anyting. why?

[8:52:24](#4xP7hvrv8IQIi4_IxTWCa39p2d2U-0twpyZmZQEwK2A) <hiiamboris>:
compiler has its limits

## 6-Sep-2023

[3:24:55](#xQo-w8zN7zqkNiaWOUR-RiWDtuFFRFrn_7-RmTpfjNY) <lylgithub2021 (lylgithub2021)>:
```
Red [File: main.red needs: view ]
if no[do %b.r  f "cc"]
Red [File: b.r]
f: func[x][x]
```
Still, the above code still fails to pass complication(no use of -e) with the same error message `undefined word f`. As `if no` will causes its body not run, why does the compiler still give the error message?

[3:32:46](#_kNgRH7Wo1SExivlT-VZG1vR9dhxeQPrb43aL3hM4pI) <lylgithub2021 (lylgithub2021)>:
 * ```
Red [File: main.red needs: view ]
if no[do %b.r  f "cc"]
Red [File: b.r]
f: func[x][x]
```

Still, the above code still fails to pass compilation(no use of -e) with the same error message `undefined word f`. As `if no` will causes its body not run, why does the compiler still give the error message?

[5:57:41](#a8l1c_7wD6Ro0aLLb_HIvCnIJDUb9yRVvS88qu_zn4U) <lylgithub2021 (lylgithub2021)>:
 * ```
Red [File: main.red needs: view ]
if no[do %b.r  f "cc"]
Red [File: b.r]
f: func[x][x]
```

Still, the above code still fails to pass compilation(no use of -e) with the same error message `undefined word f`. As `if no` causes its body not run, why does the compiler still give the error message?

[6:01:57](#fvgc6iFXjxIuTY5d9OQFEe9gIZu8Cg2q41cqvA_GwEs) <lylgithub2021 (lylgithub2021)>:
 * ```
Red [File: main.red needs: view ]
if no[do %b.r  f "cc"]
Red [File: b.r]
f: func[x][x]
```

Still, the above code still fails to pass compilation(no use of -e) with the same error message `undefined word f`. As `if no` causes its body not to run, why does the compiler still give the error message?

[6:30:09](#mEKYaWeIfm83oYEZ0S4tNIC33yN55LTDnB_MZs2AdZw) <Oldes (@oldes.h:matrix.org)>:
Because the compiler does not know, that word `no` is false and that can ignore the next block.

[8:52:43](#2JOSoH4Z9Us1duT9OP6lXda9rakQ6pvpM23Dv7YvHSU) <dockimbel>:
It compiles fine here, both with `#either` or just `either`.

[8:53:36](#Oy_e5NnpY51OpO5MSuZhJNWpIy5EvEj4NuXkE20kk6o) <dockimbel>:
%main.red
```
Red [File: %main.red needs: view ]
#either true[
#include %b.red
f "cc"
][]
a: f "dd"
view [text a]
```

%b.red
```
Red [File: %b.red] 
f: func[x][x]
```

[8:53:48](#IfzecRXhy_OQTJGOHzR50Y8Mqgkj3L5Gb6bub1ysE8U) <dockimbel>:
 * %main.red

```
Red [File: %main.red needs: view ]
#either true [
    #include %b.red
    f "cc"
][]
a: f "dd"
view [text a]
```

%b.red

```
Red [File: %b.red] 
f: func[x][x]
```

[8:54:05](#uVHdsRwce8TOK58qqIU0Ea_48Z-upNGzyAIjVdQBGHs) <dockimbel>:
 * %main.red

```
Red [File: %main.red needs: view]
#either true [
    #include %b.red
    f "cc"
][]
a: f "dd"
view [text a]
```

%b.red

```
Red [File: %b.red] 
f: func[x][x]
```

[8:55:07](#YPIvD4PAA4Gl-p8C6sLb4z5NEtPyMYeCbLPFGPxhS6s) <dockimbel>:
 * %main.red

```
Red [File: %main.red needs: view]
#either true [
    #include %b.red
    f "cc"
][]
a: f "dd"
view [text a]
```

%b.red

```
Red [File: %b.red] 
f: func[x][x]
```

[9:45:12](#5Ttv6wYsv7RshL5Sx3W8g7FkFXRGKq-Gm__2artXl0E) <lylgithub2021 (lylgithub2021)>:
Oldes: I tried `if false [...]`, still get the same error message.

[9:49:11](#wQ4NgZC3ri1gNzqWFzTSLdoF-kv4S-LIM6n6_2cjozA) <Oldes (@oldes.h:matrix.org)>:
That is the same case... `false` is just a `word!` holding a `#[false]` value.

[9:50:06](#jbqppmU3ymqybd6whSifcKWkuyHTnip6ZWbx5EyyZ-w) <Oldes (@oldes.h:matrix.org)>:
Also the compiler is not analysing expressions... so it still must compile the block

[9:51:17](#1X5Mr3wkRAGc4eSBO1IXPMU5a5U7edzSqTTxwkERwdY) <lylgithub2021 (lylgithub2021)>:
So, what is the best solution to my example?

[9:51:24](#VRBmYWHn8aBMlRwcovPLVIa0AFMfbyi-exeRYH52qmo) <Oldes (@oldes.h:matrix.org)>:
Btw... just a not related detail, but you should use `File: %main.red` instead of `File: main.red` (else you are registering a word `main.red`.

[9:52:19](#8srQ_7qcRrDOWteSAuy2vupco0D3fC31RBh5pHSGLpY) <Oldes (@oldes.h:matrix.org)>:
I don't know any solution, because it is not clear, what you are trying to achieve.

[9:52:54](#m8s_ijOvd2IK3A7Si73F3srpjiGWAuOyAfxYgF3B7Y4) <lylgithub2021 (lylgithub2021)>:
Many thanks for this good proposal!!

[9:58:01](#PR15ReXumSPyEBtOyvZmNHtR_uas6H6ykC0ynJyLUx0) <lylgithub2021 (lylgithub2021)>:
My intention: when `if` receive a logic `false` , the code inside its body will be overrided(that is to say, not run), and the program goes on(continue runnig the rest of codes). But now, it fails to compile, blocked at `if false`.

[9:59:11](#Z8argfqSAHYiCD73UWKqvw7RjUXdmxWnXb2TVUBj5vY) <Oldes (@oldes.h:matrix.org)>:
The `if` at the runtime or at the compile time?

[9:59:43](#duqLf9Ektnd2H-tPptEfDWrg5ETkOpju9pV2CCWRWMk) <Oldes (@oldes.h:matrix.org)>:
Maybe you want something like [this](https://github.com/red/red/blob/004d71b71ff3e82c9ad3e199860c61adee158223/modules/view/backends/platform.red#L952-L955)?

[10:00:17](#SVcJovRsTAIDogTxZlJkyyLWcUhjhbtInicXaqHhHkA) <lylgithub2021 (lylgithub2021)>:
runtime

[10:01:50](#yEzR6g-IQCed872q0x9KAmALvBBDsua1oJN9fJ06-yo) <Oldes (@oldes.h:matrix.org)>:
I don't think that compiler is able to do that.

[10:03:33](#Kehyl8S2rRN3O8W2cpIVvnRWXQOrhPm451vTQk3e398) <Oldes (@oldes.h:matrix.org)>:
As it was noted, there may be whatever in the `b.red` file, which you evaluate on runtime.

[10:06:08](#k7nxsA7v_T-ifMma7kVtXVoC9bhuDWhN191SH2ivwS4) <lylgithub2021 (lylgithub2021)>:
but the purpose of `if false` is just not running the code `do %b.red`. 

[10:07:12](#Y3TJymwIjw1UQmr5A9LMzSwoD_5_jCZ6TzmTUmUPK4I) <Oldes (@oldes.h:matrix.org)>:
But you don't understand, that the compiler does not know that.

[10:07:49](#LlNsDRA5IzuqkIFVw-_tmn_ZyqNoPEJgaQ0rsoezT8U) <Oldes (@oldes.h:matrix.org)>:
If you don't want to compile the code, than use `#if false` instead.

[10:07:57](#jeTh_HxMDbAZ0IkxlQhHbtQfO9SfSGTby6MNWeFe6YQ) <Oldes (@oldes.h:matrix.org)>:
 * If you don't want to compile the code, then use `#if false` instead.

[10:10:48](#shKezFmTjbrm70S9WJpq-x0UL6s32Tacw-kIgEyISNA) <Oldes (@oldes.h:matrix.org)>:
`if false` for compiler is like `if 1 < 0`... the `false` is just an expression.. the compiler does not know at the compile time, that it is false and so tries to compile your block, you want to skip.

[10:11:55](#wo3Irr4Bvwevb054X8NrXQoQLur7lZrcFPFynBtW_eQ) <Oldes (@oldes.h:matrix.org)>:
and as it does not know, what will be in the `b.red` file at the runtime time, it cannot compile your `f "cc"` call.

[10:12:36](#FOedamd9lA53DJvq21ijCyVe_ZzhlJNYWmIfOEhVpRg) <Oldes (@oldes.h:matrix.org)>:
you would have to use `#include %b.red` instead of `do %b.red`

[10:16:16](#9EzN0MhZekqvxzTTm2_NS3_qLSepYaY7O7NBr043QBI) <Oldes (@oldes.h:matrix.org)>:
Simply `do` is a dynamic function, which cannot be compiled ad so you must use `-e` compile flag (when the code is not compiled, but just embedded inside the executable)

[10:16:24](#6D35axrhl_qpPABPE3GuRvPVOtVaDZ0pv45S394hDQ0) <Oldes (@oldes.h:matrix.org)>:
 * Simply `do` is a dynamic function, which cannot be compiled and so you must use `-e` compile flag (when the code is not compiled, but just embedded inside the executable)

[10:16:38](#zIvQxpBwGpcRAtyeXAyqvUN-yNXm-W9VkmsxQsHD-YU) <Oldes (@oldes.h:matrix.org)>:
 * Simply `do` is a dynamic function, which cannot be compiled and so you must use `-e` compile flag (then the code is not compiled, but just embedded inside the executable)

[10:18:06](#nTziFx0EnFvn0yi41yliCZxXFOFCvCEfPf8bf7czQHE) <Oldes (@oldes.h:matrix.org)>:
(it may be compiled - the content of the file is not)

[10:19:13](#IlmmCFLsgluWaRmW3knwHew7w7dbOLrMBPFRDp3SWlU) <Oldes (@oldes.h:matrix.org)>:
You probably may have compiled:
```
f: func[x][x]
do %b.r ; replaces the f
f "cc"
```

[10:22:48](#AjW_v1p3jvRJyW6pPUe4COoJVwd0ZGEkluqZNJbEeXE) <lylgithub2021 (lylgithub2021)>:
Thank you so much for this wonderful explanation!!! In this part of my program, I don't want to run `do %b.red` at all, that is why I use `if false` here. And in my prgram, `false` comes from another word,, just like `a: false if a [do %b.red ...]`. if `#if` is used, it does not recognize  the word `a`. `if` and `do` are all syntax of Red, but Red compiler can not work on it. Does that mean if a red program intends to be compiled to an exe file, then `do` and `if` can not appear in code?

[10:30:05](#D1Yw22YGZotyzhLIGl29V-2bj9YF_1baNg0MEHFwEfU) <lylgithub2021 (lylgithub2021)>:
I still quite understand why Red compiler does not know `if false`. I cannot imagine if compiler of other language, such like `c` does not know similar syntax.

[11:43:51](#3E7FVD78TvWPPUSCH7phsWz8z1Z8hcFfkxSszOrF0W4) <hiiamboris>:
try `false: 1000` maybe that'll give you a hint

[11:45:14](#V81FkQhxcr9dhRQT92XewLtgStKpORXkgjJfsPKrx8I) <hiiamboris>:
also 
> And in my prgram, false comes from another word

implies you don't understand that your program is not evaluated by the compiler, only compiler directives are, so whatever word it comes from, it will not be known at compile time

[11:55:41](#lqYae3mBMI2mzfy0bq37jb-OoNpmlmXJvjBmvF1EFyQ) <lylgithub2021 (lylgithub2021)>:
to compile my codes, I have to  have all word in codes evaluated with compiler directives?? Or, all of program written by Red have to be run with interpreter(or compiled with -e)?? Why does Red use such a mechanism which means no really independant executable file can be created by Red?

[12:03:30](#wns8m6XECOpaF2glvPyqYWGnY3RrlkBfayJqwl_UJac) <hiiamboris>:
> all word in codes evaluated with compiler directives

it's a solution, yes

[12:04:05](#eAnowz4zNy3CJr15Fe4PRAGdh6ZHELg6g-HobQ2nHJs) <hiiamboris>:
> Why does Red use such a mechanism

all compiled languages use it https://www.baeldung.com/cs/runtime-vs-compile-time

[12:07:31](#dnD2K8fxZ-yiEHrAUjf22nnPQZBqDfPXTJmb9eE-DOQ) <hiiamboris>:
otherwise we would have invented a time machine and destroyed our universe :)

[12:10:30](#BdFcCgFNHQH79ueXcDvzXuHgygS5GnVllQAruagTNBg) <lylgithub2021 (lylgithub2021)>:
following your proposal, I tried with `#do [a: false] #if a [...]`, fail again, why? I have been told that the compiler does not know `false`. Then what shall I do to make it know `false`?

[12:14:40](#0NVCreM1vMVAR0D4zfVVmPXUgh7HejPPHnMmpZq2fI4) <hiiamboris>:
compiles fine for me

[12:14:46](#s6IknV1707siIiao45lvnqFBqTBkyUKfLy2p-Oouqq4) <hiiamboris>:
```
Red []
#do [a: false]
#if a [mumbo jumbo]
```

[12:14:49](#yLIR1rfetYqlU7hAafZnsBsp4y_-NgtgYRFwpSZiFN4) <hiiamboris>:
no errors

[12:29:38](#jFezMz_v-wwp4iedWzv7HGyAp9yL01ATXcPXE6DmMLs) <lylgithub2021 (lylgithub2021)>:
![](https://gitter.ems.host/_matrix/media/v3/download/gitter.im/461858a77fa4af99f770fcce8d97ed6c47e9f786)

[12:30:38](#jNsr9agxkXBmP1FWt-Pd9CEKcP8Xcf0Xljf8uPC9Yhg) <lylgithub2021 (lylgithub2021)>:
I tried again and failed on the same way:
```
Red [File: main.red needs: view ]
ÔºÉdo [a: false]
#if a[do %b.r  f "cc"]
view [text "ok"]
```

[12:32:04](#ILKttwhlrOzvCjzsR34dQJnWE32-gp9E3EQ1_X1eVDo) <hiiamboris>:
you've got unicode symbols masked as ascii in your code

[12:36:25](#dzoGTKe8LlQt51xIGH14Iw3UGRCsmd92zTbjiWEy0_w) <lylgithub2021 (lylgithub2021)>:
you've got unicode symbols masked as ascii in your code

[12:48:00](#46KT3qEpvhy1sHACbdy_d9bOhbLAT7UQSpRupnfb_SQ) <Oldes (@oldes.h:matrix.org)>:
Red itself is compiled, so the answers are _no_ and _no_. I guess that problem is, that you don't understand, what code is supposed to be evaluated during compilation and which on runtime. 

[12:49:48](#FxoNCDtAcpMUivvemP0lYE1F_4HUMifMMgejptCJao0) <Oldes (@oldes.h:matrix.org)>:
Btw... isn't interpreted code (executable compiled with the `-e` flag enough for you?

[12:49:52](#KeIrvtIPfef1Wap9OaJ3Uh6TwhzhnNELESJOtD8kzhU) <Oldes (@oldes.h:matrix.org)>:
 * Btw... isn't interpreted code (executable compiled with the `-e` flag) enough for you?

[12:54:01](#37B2xPRISW-BIIl1hN-XowzTlLr78t3twbZKP5c0fAk) <lylgithub2021 (lylgithub2021)>:
IBy this way, t's just incorporates an interpreter in program. I prefer an really independent exe file(native code) like that compiled by C(not like java)

[12:54:17](#xWtf_MvNVsavNexn3rJX80D62pV4zh3O2JeSBSra4ag) <lylgithub2021 (lylgithub2021)>:
 * By this way, it's just incorporates an interpreter in program. I prefer an really independent exe file(native code) like that compiled by C(not like java)

[13:03:41](#aMUoZ2n3mWyAqGQB0LtfZCbbw2D19v9Sq20QE2_zI1Y) <lylgithub2021 (lylgithub2021)>:
come back to `if false[do %b.r  f "cc"]` such common Red code, which work in runtime, is not possibly  compiled withhout -e flag?

[13:16:12](#Wmjv2pQRCfXJ48Ui7_-ATursp-gYh7_obDvMOm8Upec) <Oldes (@oldes.h:matrix.org)>:
No. Because the compiler is not compiling the %b.r file, which may change any time.

[13:16:46](#ih0hQLVWNEsw6ENwnkJNq4atvi9-fNv8fcT-HUJOjYw) <Oldes (@oldes.h:matrix.org)>:
And as it needs the specification of the later used `f` function, it throws an error as expected.

[13:19:11](#81RtZnl4u61TgcZW4GA6LFzvUBqVEH9Yp7JRjHj8swo) <Oldes (@oldes.h:matrix.org)>:
I don't know, how else to explain it. You must decide, if you want to compile the `b.red` file (and then use `#include %b.red`, or you want a dynamic code - in a file loadable on runtime and then you need just to embed your scripts in the executable.

[13:21:49](#ynN5osn-KGnbgqDhklV-XTVqtJNSK73HUC6FhCrvYhA) <Oldes (@oldes.h:matrix.org)>:
What you try to do is like trying to compile a C code where you use some function without using an `#include` directive. 

[13:23:38](#NyF548Od7TQE1wgf-4ZHllla9m7RWUkN1KI9eaIk9Vk) <lylgithub2021 (lylgithub2021)>:
quote "or you want a dynamic code - in a file loadable on runtime and then you need just to embed your scripts in the executable." 
yes, how to embed?

[13:26:28](#WaX7FRT7bx7vUL0y1i7mqXNJ2IMVRwvTTmf6W4kT_j4) <Oldes (@oldes.h:matrix.org)>:
Using `#include`?

[13:27:04](#3-DZVbgKQcsUsZb1dvbU9_osP015zcmk5x6gICrljBY) <Oldes (@oldes.h:matrix.org)>:
Sorry.. I am on mac and don't have Red compiler there to give any examples.

[13:29:51](#cOiwqkF25IzTxfeQpvDCMm0M1Lfq_hZo_bcB8VDgEkw) <lylgithub2021 (lylgithub2021)>:
I think `#include` is static, `do %b.r` is dynamic. Is it right?

[13:31:43](#scaVnE4_Q9gj3V5Ykb4PIqYeH_mU8u_e8baGgEDIycw) <Oldes (@oldes.h:matrix.org)>:
Maybe something like `#include %data.red` where in `data.red` will be:
```
Red [] code-I-do-not-want-to-compile: [1 / 0]
```
And then have in the main file:
```
#include %data.red
if false code-I-do-not-want-to-compile
```

[13:33:30](#xqr0DAFpVHo4lUS67mZEjjLImsMAdbf5IQmsDdst9Co) <Oldes (@oldes.h:matrix.org)>:
But maybe it will not work.. And yoz would have to use:
```
if false [do code-I-do-not-want-to-compile]
```

[13:33:46](#_UlIq2F7kJSen6SLoy43nz29A4hsGpUhpc-4r_spEkI) <Oldes (@oldes.h:matrix.org)>:
As I said.. I don't have Red here.

[13:35:58](#etFQPaPk-cmTIJlwRXLfvBY0yuklWBrFbR3qJm5EUlc) <Oldes (@oldes.h:matrix.org)>:
 * But maybe it will not work.. And you would need to use:

```
if false [do code-I-do-not-want-to-compile]
```

[13:36:52](#ck9FnYLt6JpTGtwRIpPDkfj6pVei-seh6PivwsDhmio) <Oldes (@oldes.h:matrix.org)>:
What will work for sure is having the code in a string instead of block.

[13:38:55](#AweIANowP2Lv6YTpT439HZTPy1NPdGOiszHHKP3P_S8) <lylgithub2021 (lylgithub2021)>:
Many many thanks for your patience and those valuable information and suggestions!! The reason why I don't prefer #include is that, I want to dynamicly invoke external support files in my program. In this way, the main.red only needs compile once, any modification of those external support files will not cause the main program re -compiled.

[13:41:03](#QdEely8pc0lXaz_6jtSgwFTXqN-ipBUb8f2hlpg1he8) <lylgithub2021 (lylgithub2021)>:
> What will work for sure is having the code in a string instead of block.

I also tried `do read %b.r` and get the same compiler error message with `do %b.r`. Seems that `do string` is also a wrong way.

[13:41:54](#kUMNqK-tsI7loXXzR5L55bDMJaNYPfAWMjS5rRCwEAo) <lylgithub2021 (lylgithub2021)>:
 * Many many thanks for your patience and those valuable information and suggestions!! The reason why I don't prefer #include is that, I want to dynamicly invoke external support files in my main program. By this way, the main.red only needs compile once, any modification of those external support files will not cause the main program re -compiled.

[13:42:13](#WFSgzt9-Ah62IcFNIYmuXUEzvjvqJ9CNA6i4gynDXzM) <Oldes (@oldes.h:matrix.org)>:
See [this](https://app.element.io/#/room/#red_red/welcome:gitter.im/$Wmjv2pQRCfXJ48Ui7_-ATursp-gYh7_obDvMOm8Upec)

[13:43:22](#P-be_-v-Zsnw5FPqruEb7JxHYeOOzR1i4SOlOo641d8) <Oldes (@oldes.h:matrix.org)>:
If the part you compile needs functions from the dynamic code, then you must compile these functions as well.

[13:44:21](#TY2Ojn25MY7_f_Vk28GA673M9rZC-D6iv6Hd3zvvWtA) <Oldes (@oldes.h:matrix.org)>:
I must end.

[13:45:09](#MA4hN87ZnW7j54A64ZpCeHxwsqWRw-OBUxGRGPlxJRc) <lylgithub2021 (lylgithub2021)>:
Than you once more. Have a nice day~

[16:50:08](#6m0-eLZt0Im32wIoLhhTR0Orl00-OyBYTudnk4r2F1U) <endo64>:
> <@lylgithub2021-606ac7e76da0373984794a36:gitter.im> So, what is the best solution to my example?

The easiest solution is defining the word used in a block in advance.

```
Red [File: %main.red needs: view ]
f: none
if no [do %b.r  f "cc"]
```

Then you can compile without an issue.

[21:50:58](#-8pUGs1dp4x1XT0ergSJVjJ8Ph6znMQRK28U2QHPDH4) <hiiamboris>:
It will compile `f` as `none`, and it won't be replaced with a function that `do` is supposed to load.

## 7-Sep-2023

[1:50:40](#VMUAuI1enQKhQgOMUpUkbqMNA3WikSCVixNqzbN49P8) <lylgithub2021 (lylgithub2021)>:
Many thanks for your solultion and suggestions!endo64 hiiamboris 

[1:57:28](#Ocr0uRM_GPaJ04AysMsDAl5aX-Dk-xPPCr1u9lfLLDY) <lylgithub2021 (lylgithub2021)>:
 * Many thanks for your solultion and suggestions![endo64](https://matrix.to/#/@endo64-556ed0ce15522ed4b3e157ed:gitter.im) hiiamborisendo64 

[2:00:17](#KAyGtoXFvw-BewcIi8zoodXiYbuiyUR8yZk1pgjVwD8) <lylgithub2021 (lylgithub2021)>:
And, according to above discussion abouy my issue, calling the function`f` in program can not be understood by compiler through `do %b.r`. The following example, however, showes that it does work, why?
```
Red [File: %main.red needs: view]
ee: yes
if ee [do %b.r]
;;a: f "ccc" ;;This will leads to compile error("undefined word f").
view [
button [t/text: f "f works all right"]
t: text "ttt"
]
```

[2:00:33](#iJRdw5HkeNHJ6L03c9UBmUBzfKCrc10E6KTOJg1Hy24) <lylgithub2021 (lylgithub2021)>:
 * And, according to the above discussion abouy my issue, calling the function`f` in program can not be understood by compiler through `do %b.r`. The following example, however, showes that it does work, why?

```
Red [File: %main.red needs: view]
ee: yes
if ee [do %b.r]
;;a: f "ccc" ;;This will leads to compile error("undefined word f").
view [
button [t/text: f "f works all right"]
t: text "ttt"
]
```

[2:00:46](#ztu5ZP9q5usvnv2VZEM_qqToztgL4z4sG2nTfmEUpOQ) <lylgithub2021 (lylgithub2021)>:
 * And, according to the above discussion about my issue, calling the function`f` in program can not be understood by compiler through `do %b.r`. The following example, however, showes that it does work, why?

```
Red [File: %main.red needs: view]
ee: yes
if ee [do %b.r]
;;a: f "ccc" ;;This will leads to compile error("undefined word f").
view [
button [t/text: f "f works all right"]
t: text "ttt"
]
```

[2:03:10](#4hhAehrF3yMx9oGAxwpCi_d1fmbSvXdRMf7UKB6c12A) <lylgithub2021 (lylgithub2021)>:
 * And, according to the above discussion about my issue, calling the function`f` in program can not be understood by compiler through `do %b.r`. The following example, however, showes that it does work(pass compilation and get the expected result when running), why?

```
Red [File: %main.red needs: view]
ee: yes
if ee [do %b.r]
;;a: f "ccc" ;;This will leads to compile error("undefined word f").
view [
button [t/text: f "f works all right"]
t: text "ttt"
]
```

[6:41:29](#oEbbp2pzz5CbyEXaKTTQAIww8CQ2xt3gHsfaZtqdoOk) <rebolek (Boleslav B≈ôezovsk√Ω)>:
because View actions are interpreted and not compiled

[7:17:49](#NkOSBgp8DuEM_ZzWBL5I_wa4Ze5ezND98nVXyVBqgew) <lylgithub2021 (lylgithub2021)>:
Why are view actions not compiled?

[7:55:30](#NeN4MXxUOJK2V1fYbyx_0iwgfNliA6puVPPQ7ZqlG38) <hiiamboris>:
because there's no special case for them in the compiler

[7:55:39](#YLvFNrA5zegDn_wN7UBGnF5WW-3LUOUzTXfwiHQ3Cc4) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Because View is too dynamic. Compiler has no way to predict what would be going on in the View action.

[9:35:36](#18LwF_6i-wVoNBfM-KIDPc8cmDCuD-CfZ5-dAb32Zdw) <lylgithub2021 (lylgithub2021)>:
rebolek (Boleslav B≈ôezovsk√Ω): hiiamboris Thank you!

## 8-Sep-2023

[9:28:36](#ITWm8MySVYPAvGlPXb9RKig5groHvjP9Yh5PnqyzEio) <dockimbel>:
It works only because you probably keep the compiled exe in the same folder as `%b.r` file. `do` implies that the file is loaded at run-time, not at compile-time.

## 11-Sep-2023

[10:24:11](#Z9lPQi5QPUHwVjKgSwlhKYy8J7sE1yeAozuEtGbEyB4) <lylgithub2021 (lylgithub2021)>:
When I `read` many files in my program, I got the error message `invalid UTF-8 encoding: #{D3D0B7C7}`. I think this is because  there are non-ascii characters in file which are not saved with `UTF-8` format. My question is: how to know the encoding format of a file and how to us `read/as...` to open this file correctly(I don't find any details abouth the refinement `/as` or any examples to show how to use it?

[10:24:45](#Ib4nkGrZUWbGt69N-PgANmbVnATncSVPmFmuMj_CkCU) <lylgithub2021 (lylgithub2021)>:
 * When I `read` many files in my program, I got the error message `invalid UTF-8 encoding: #{D3D0B7C7}`. I think this is because  there are non-ascii characters in file which are not saved with `UTF-8` format. My question is: how to know the encoding format of a file and how to use `read/as...` to open this file correctly(I don't find any details abouth the refinement `/as` or any examples to show how to use it?

[10:31:02](#beya7LKwvTyAjm_aT5ueJo6Hic89fd3rN7devTN9VTo) <lylgithub2021 (lylgithub2021)>:
 * When I `read` many files in my program, I got the error message `invalid UTF-8 encoding: #{D3D0B7C7}`. I think this is because  there are non-ascii characters in file which are not saved with `UTF-8` format. My question is: how to know the encoding format of a file and how to use `read/as...` to open this file correctly(I don't find any details about the refinement `/as` or any examples to show how to use it?

[10:32:32](#3cgMr4CaYTZHN4MRpgCSEq_s30hCNxx1VfkvcwOmDWQ) <lylgithub2021 (lylgithub2021)>:
 * When I `read` many files by Red in my program, I got the error message `invalid UTF-8 encoding: #{D3D0B7C7}`. I think this is because  there are non-ascii characters in file which are not saved with `UTF-8` format. My question is: how to know the encoding format of a file and how to use `read/as...` to open this file correctly(I don't find any details about the refinement `/as` or any examples to show how to use it?

[10:40:23](#kGyV8zV8vKX6x1Qj11JlU7fGA-qWrSR4AGknubh0VYA) <rebolek (Boleslav B≈ôezovsk√Ω)>:
Red supports `UTF-8` only. If you want to read text in another encoding, you can use for example my script https://gitlab.com/rebolek/castr/-/blob/master/codepage.red?ref_type=heads form the CASTR repo.

However, there's no auto-detection, so you would need to know what encoding is your file using.

## 29-Sep-2023

[2:20:07](#6c4pFEJSTcRYQbZNx7TRafSAf2AOJ7aAWYJ6lrVULZc) <Tim Siegel>:
Hi! It seems that a map! knows the order of its keys. I couldn't find any documentation about it, though. I'm used to maps which are either hash tables (keys might be returned in any order) or trees (keys returned in sorted order). But `keys-of #("foo" 1 "bar" [1 2 3] "baz" "Hello, World!")` gives `["foo" "bar" "baz"]`, so it knows the order they were inserted into the map I guess?

[4:07:44](#6hRgw-Zk5FXdv8_8aJW2fKiq03bhS7eUU8ua3oMF3WM) <endo64>:
The order of keys are not guaranteed.
"Internally, keys are stored in an hashtable"

https://www.red-lang.org/2015/06/054-new-datatypes-exceptions-and-set.html  

[6:40:21](#zUfmNhQ0oIXcUKF646a-dUrzBasgCEfJdN4UCPMbGFQ) <dockimbel>:
Order of keys is known in the current implementation, but that implementation might change in the future (though, no plans for that so far).

[12:33:24](#eV0rXUm3qHNHljENwc91_PrQoHEt-G3P3UAPwlKU4tg) <Tim Siegel>:
Thank you!

[22:18:39](#MqNETp3gZEz2NCoJuQu_ohd9M5dF_jXYVzW0Pt29c4I) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@dockimbel-556597ad15522ed4b3e10020:gitter.im> Order of keys is known in the current implementation, but that implementation might change in the future (though, no plans for that so far).

Which are the reasons you will change?

[22:40:16](#TO_3lYWytzfIMh3mHQVSd615hV0Fb7kZOMdo_p11z5M) <greggirwin (Gregg Irwin)>:
Potential optimizations.

[23:25:53](#kSorizDVuHuBLT0kr5iM6I1rQ4a8CgK18S943lybpvE) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@greggirwin-55659ddb15522ed4b3e1006f:gitter.im> Potential optimizations.

It Is already a lot fast. Not as object keys but It Is fast

[23:28:36](#LU4ILImdrXp0sHg4VoIK4NiOa1mlOKXnOLQFMaFxTyM) <greggirwin (Gregg Irwin)>:
If maps are updated a lot, keeping key order is extra overhead. In many cases, you won't see a difference, and we have to decide which features provide the most value.

[23:32:03](#dnh53FcrkU8seRqKPlX-U1ikcTqfY6DcP4jgnvgfkeg) <Tim Siegel>:
As a (very new) user, it would be good to have a note regarding the guarantees of the data type as part of a specification. But I understand the language is still in alpha state, so it's okay. It'll break a lot of programs when it changes, as probably people assume it is part of the design.

[23:33:43](#rl4vCPx903tC-cIfB7bE3Zl-ZMZHMWmn0kvR9TRFrDc) <Tim Siegel>:
As I understand it, a `hash!` *is* guaranteed to keep order, and it's not clear that "keys stored as a hashmap" implies that order is not defined.

[23:34:09](#1-usbTCO5EKKJ5CTgiJU7w5FwI7Qk8lLL1RHJomR9qE) <greggirwin (Gregg Irwin)>:
That's often more helpful in lower level langs, like Red/System. 

[23:35:10](#p7oq0KBbztyafSyxkYt-zFUabZuG4MKPsvieNtoeBcE) <greggirwin (Gregg Irwin)>:
Consider that as keys are added and removed you will have a hard time predicting where they fall in any case.

[23:35:40](#lMlFkeMrjOx0PwRsYrp8JSp7wPo1qARRIuWURSSqCVs) <greggirwin (Gregg Irwin)>:
Importantly, concrete use cases help drive design.

[23:36:43](#Jo5irgQ2VKatyk-WIkhmWJH7DEpkJ00fPTCDEkK6Lys) <Tim Siegel>:
Yeah. The use case that drove my question was a toy problem where probably select on a block would be as fast or faster than a map anyways.

## 5-Oct-2023

[20:41:06](#AXBtRtfUZpnU7D2MaI9PTWMNCx-lz87TfjwVulAYJ8k) <endo64>:
In PowerShell there are both ordered and unordered hashmaps, but being ordered is a property of the same datatype.
In Red, having two datatypes looks unnecessary.

## 7-Oct-2023

[16:58:36](#1URB7Q2FkdEy1KnipqirYIV_6gFKC9k_Z-P1C-qCANg) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@endo64-556ed0ce15522ed4b3e157ed:gitter.im> In PowerShell there are both ordered and unordered hashmaps, but being ordered is a property of the same datatype.
> In Red, having two datatypes looks unnecessary.

You should add map specific info we don't have in datatype, and also a way save and view such info for each map created.

## 23-Nov-2023

[5:12:19](#RUSa9uF5_Y2FIzqIdwhJCJuD0U4Y3qFTL0Ce3iNjEQ4) <lylgithub2021 (lylgithub2021)>:
The common character of the following string is that they are all white line(a line onlyconstructed by spaces/tabs, and terminated by a "line feed"
```
a: "   ^-  "
b: "^-         ^-      "
c: "^/"
```
I tried with 
```
parse X [some [space | tab] "^/"] ;;X replaced by a, b or c
```
but does not work as I expected.
So, any good idea to judge if a string is a white-space line?


[5:12:55](#rjvWglt-bB4HdwTVmH9G__aiQrKMFbuWcp9v64XGrd8) <lylgithub2021 (lylgithub2021)>:
 * The common character of the following strings is that they are all white line(a line only constructed by spaces/tabs, and terminated by a "line feed")

```
a: "   ^-  "
b: "^-         ^-      "
c: "^/"
```

I tried with

```
parse X [some [space | tab] "^/"] ;;X replaced by a, b or c
```

but does not work as I expected.
So, any good idea to judge if a string is a white-space line?

[5:13:51](#hWROxIamz4KBl8Hs55uJ3IIo-I5BUy-6UJ7OUeQJaR0) <lylgithub2021 (lylgithub2021)>:
 * The common character of the following strings is that they are all white line(a line only constructed by spaces/tabs, and terminated by a "line feed")

```
a: "   ^-  "
b: "^-         ^-      "
c: "^/"
d: "                 "
```

I tried with

```
parse X [some [space | tab] "^/"] ;;X replaced by a, b or c
```

but does not work as I expected.
So, any good idea to judge if a string is a white-space line?

[5:14:05](#zda5dgldSFxZlKoNHAVBkcVlna4OzeJ5V1nkLzaKmKY) <lylgithub2021 (lylgithub2021)>:
 * The common character of the following strings is that they are all white line(a line only constructed by spaces/tabs, and terminated by a "line feed")

```
a: "   ^-  "
b: "^-         ^-      "
c: "^/"
d: "                 "
```

I tried with

```
parse X [some [space | tab] "^/"] ;;X replaced by a, b, c of d
```

but does not work as I expected.
So, any good idea to judge if a string is a white-space line?

[5:14:38](#2YQqBB5SpoQ0XCJINUz4yHCNFv9NVRH2WPmwXhVJL4U) <lylgithub2021 (lylgithub2021)>:
 * The common character of the following strings is that they are all white line(a line only constructed by white spaces/tabs, and terminated by a "line feed")

```
a: "   ^-  "
b: "^-         ^-      "
c: "^/"
d: "                 "
```

I tried with

```
parse X [some [space | tab] "^/"] ;;X replaced by a, b, c of d
```

but does not work as I expected.
So, any good idea to judge if a string is a white-space line?

[5:17:31](#EJxG_mQ8u0HPWwVmGqjBX4836_G2DAFkYlVp6DOrmyw) <lylgithub2021 (lylgithub2021)>:
 * The common character of the following strings is that they are all white line(a line only constructed by white spaces/tabs, and terminated by a "line feed")

```
a: "   ^-  "
b: "^-         ^-      "
c: "^/"
d: "                 "
```

I tried with

```
parse X [some [space | tab] "^/"] ;;X replaced by a, b, c of d
```

but does not work as I expected.
So, any good idea to judge if a string is a white-space line, or if a string is a white space(constructed by white space or tab) string?

[5:18:35](#OUBDVHfsFDzJ5NP_3TnD1NysG-TEc-Hh-h36v8UjM70) <lylgithub2021 (lylgithub2021)>:
 * The common character of the following strings is that they are all white line(a line only constructed by white spaces/tabs, and terminated by a "line feed")

```
a: "   ^-  ^/"
b: "^-         ^-     ^/ "
c: "^/"
d: "                 ^/"
```

I tried with

```
parse X [some [space | tab] "^/"] ;;X replaced by a, b, c of d
```

but does not work as I expected.
So, any good idea to judge if a string is a white-space line, or if a string is a white space(constructed by white space or tab or nothing) string?

[5:27:11](#qo6IkLKXGivOEdUPq5XBP9I3sxjx4SZwWJiVuks-NWY) <greggirwin (Gregg Irwin)>:
You should try https://codeberg.org/hiiamboris/red-spaces/src/branch/master/programs/#parsee-parsing-flow-visual-analysis-tool-parsee-tool-red and give hiiamboris some feedback. Also, clearly say what doesn't match your expectations.

[5:31:48](#6_EOUdGumYGZ4Nq_og855wsISrfs2-xTL_IEoZNNxzg) <gltewalt (The other Greg)>:
And...


[5:31:58](#8ZbvQmTAcFu3OFdzT7-yJtMGMAaJSR_sxJJQ1CziB34) <greggirwin (Gregg Irwin)>:
ParseCaddy!

[5:32:13](#iIyDAX3Hr7G1DKLPSJyD4UPwqnGjTSa50WP1Ujaec-4) <gltewalt (The other Greg)>:
; all characters except whitespaces

charset reduce ['not space tab cr lf]

[5:32:43](#oM5v7y1Q0_UOaQYHM3IM4vLvDR5Vlt9U5u5mzfBe3PE) <gltewalt (The other Greg)>:
ParseCaddy might be pretty out of date right now

[5:33:16](#pNPtZs0fVC5ximEtdj6sfGtIYgIvlmXx6Vwwd6NupA8) <gltewalt (The other Greg)>:
I should try to run it in the next few days here

[5:35:48](#AEhfmmKILPjB9E2jjOsPXUkYFWir5InzE8uHLfgh7co) <gltewalt (The other Greg)>:
Definitely try out Boris compiled front-end binary of ParSEE

[8:56:44](#936foER0uwYd05-Zw8nGE1JP5rFSfkg713ujNuMgMMM) <hiiamboris>:
seems obvious without tools that not all strings there end with a linefeed

[9:10:28](#ifi9MyN-51qLpCONDwydwLKtGpBiLVur-P_blpk8ks0) <Oldes (@oldes.h:matrix.org)>:
```
ws: charset " ^-^/^M"  parse X [any ws]
```

[11:54:14](#oqH5fVWm2QTyUYT-n4fL2ymv7jYkQ-O_GNVpwToTnDA) <lylgithub2021 (lylgithub2021)>:
Many thanks! @gltewalt (The other Greg) 

[11:59:40](#qQdxK_A44W3C3T5_GfeURfI6LVlYhw1Gl0LyudYCr_I) <lylgithub2021 (lylgithub2021)>:
```
>> a: [1 2 3]
== [1 2 3]
>> forall a [either a/1 < 3 [a/1: a/1 + 1][break]]
>> a
== [3]
```
Why is the value of `a` not `[2 3 3]`? And how to get it?

[12:01:54](#sRctOmGGRyFgTEg3va5aGesOtT2cOVwA0h4hEapeAyM) <hiiamboris>:
`head a`

[12:02:02](#SY5M3nIwRkzhvz4Yg-01UoHEwoW0_sEJEgZT_wPgg2k) <lylgithub2021 (lylgithub2021)>:
 * ```
>> a: [1 2 3]
== [1 2 3]
>> forall a [either a/1 < 3 [a/1: a/1 + 1][break]]
>> a
== [3]
```

Why is the value of `a` not `[2 3 3]`? And how to get it(that is to say how get the whole block value after part of its value changed)

[12:03:05](#P9gYbNzDPYynNJCoYCwPXBRqnbr6Cca6KYMcy4ByMZw) <lylgithub2021 (lylgithub2021)>:
hiiamboris: Thank you so much!!

[12:26:21](#Gal6SLGkdtWVWnj5UCvaPJszGKOtch_szeM2jREzwDo) <lylgithub2021 (lylgithub2021)>:
 * hiiamboris: Thank you so much!! I tried `head a break` under your suggestion but still get `[3]`, not `[2 3 3]`. How to get the whole block when `break` is use inside a loop?

[12:26:42](#y_R_R0CE_IKJSPhqSA0mWyaMZMsBuyqwUKfk74JBs1s) <lylgithub2021 (lylgithub2021)>:
 * hiiamboris: Thank you so much!! I tried `head a break` under your suggestion but still get `[3]`, not `[2 3 3]`. How to get the whole block when `break` is used inside a loop?

[12:33:38](#OxyD8E-jQ4gi89s48k6z1XvyN7vwndoLMISCP8qGBj8) <lylgithub2021 (lylgithub2021)>:
 * hiiamboris: Thank you so much!! I tried `head a break` under your suggestion and the value of `a` is still `[3]`, not `[2 3 3]` after the loop. How to get the whole block when `break` is used inside a loop?

[12:36:29](#5jZ7iHVAe4NhdqPLJ1kCSht2fFaOs5Is3Q_6OQmkRFE) <hiiamboris>:
you should learn what `head` is doing instead of sticking random expressions into arbitrary places

[12:38:10](#wVf-pvJNd9rZ6VnoBdjshD9z-XvHE0yJgtpoErIGUF4) <lylgithub2021 (lylgithub2021)>:
So what is your solution to my question?

[12:40:25](#FquNjtpfmzCwkWpPAOc4riRfzqocS0R5rWo49neYrKY) <hiiamboris>:
I just gave it to you, learn first, think second, write code after that

[12:40:55](#asYfC3wpMMNy0TSL7xfX4b2H5tZCXGe3wvssT6Xf01k) <hiiamboris>:
you're not an infinite monkey to solve your problem like that

[12:41:02](#a-uaYXEWFTs4sg2FpdrpIgStxv9gGBUozJZKCjQA5Kc) <hiiamboris>:
you'll die in a few dozens of years

[12:43:44](#v77jdV3KikALCao-gzy2_ol1iXrz5VNeNu2sj7WiRrc) <lylgithub2021 (lylgithub2021)>:
I'm not an expert of the language `Red`. I think and not get the solution. That's why I ask question here. I have learn Red by studying solutions from experts here.

[12:44:08](#r5Uo6qkr0FcKf4ye-wNhA9-cMS-x-SvU13tzIawtNB8) <lylgithub2021 (lylgithub2021)>:
 * I'm not an expert of the language `Red`. I think and not get the solution. That's why I ask question here. I have ro learn Red by studying solutions from experts here.

[12:48:50](#7bQPxlz8U8TZ7SWwsd6uRwx7xzqMTFk3VCHc1LKgYiI) <lylgithub2021 (lylgithub2021)>:
 * ```
>> a: [1 2 3]
== [1 2 3]
>> forall a [either a/1 < 3 [a/1: a/1 + 1][break]]
>> a
== [3]
```

Why is the value of `a` not `[2 3 3]`? And how to get it(that is to say how to get the whole block value after part of its value changed)

[13:00:04](#c_PpzZI9DVwsRhfSXfPuAM8fbPYy6mpRaznDNS_MCDQ) <Oldes (@oldes.h:matrix.org)>:
```
>> a: [1 2 3]  forall a [either a/1 < 3 [a/1: a/1 + 1][break]] a: head a 
== [2 3 3]
```

[13:01:14](#IQHht9z88OouTjY0tEBP8NHOcSMbV027YCcjQWdI0iE) <Oldes (@oldes.h:matrix.org)>:
 * ```
>> a: [1 2 3]  forall a [either a/1 < 3 [a/1: a/1 + 1][break]]  probe a  a: head a 
[3]
== [2 3 3]
```

[13:04:26](#wbTr3tu0Ctb1KRcJN4mtCGMn9hH02LtSLfOb6lBim5I) <Oldes (@oldes.h:matrix.org)>:
`forall` changes the position of the series.

[13:05:11](#ABcRwP3RT7dlnLk_SndRkQTOmjagvNTwXVV_FOYYplc) <Oldes (@oldes.h:matrix.org)>:
```
>> a: [1 2 3]  forall a [print [index? a mold a]]
1 [1 2 3]
2 [2 3]
3 [3]
```

[13:12:03](#l9lAzkC-6DiaVyS3sWhSBMHiOasC2Xqk0ffGVq1JV38) <lylgithub2021 (lylgithub2021)>:
Oldes: Really really appreciate your help!!!!! My question comes from a loop inside a function in which the function immediately break the loop and return the "new" `a` when `a/1 >=3`.  That is to say, `break` and `return` occur inside the loop. I don't find a good way to do this. `head a` inside loop seems not work in my example.

[13:13:08](#WDXdxgrPQaMFATw4-SKRLrjwDqNKtRdSoMi0y3oCpCU) <lylgithub2021 (lylgithub2021)>:
 * Oldes: Really really appreciate your help!!!!! My question comes from a loop inside a function in which the function immediately break the loop and return the "new" `a` when `a/1 >=3`.  That is to say, `break` and `return` occur inside the loop. I don't find a good way to do this. `head a` inside loop seems not a solution to my example.

[13:13:24](#qKjIiehxqYQhJnmmdYOawTXJgf9ibFH1aB5h2tm6KYQ) <Oldes (@oldes.h:matrix.org)>:
```
>> a: [1 2 3]  forall a [either a/1 < 3 [a/1: a/1 + 1][ a: head a break]]  a 
== [2 3 3]
```

[13:14:17](#dilrXRK4FMHxf_agXUHJXpgQv4qcETqrCvPnYBmk0HU) <Oldes (@oldes.h:matrix.org)>:
`head` itself does not modify the series.

[13:16:11](#-IsS_ncpZ1VBV15-Gx-0gONMHpnt1WU_pu8niIod9dM) <lylgithub2021 (lylgithub2021)>:
Ì†ΩÌ∏ÄÌ†ΩÌ±çÔ∏èÌ†ΩÌ±çÔ∏èÌ†ΩÌ±çÔ∏èÌ†ΩÌ±çÔ∏è

[13:18:19](#rL8-l_26EmCbiMA7xjscyxTIcieqDKsLnNLwAGDRwb4) <lylgithub2021 (lylgithub2021)>:
Than you so much! I lean a lot from you!

[13:19:18](#N4nhoNmGxa3K_rToikenvIR8BKPy7f_VSD29cyGJJIY) <lylgithub2021 (lylgithub2021)>:
 * Thank you so much! I lean a lot from you!

[13:22:23](#QEm7ZdMMfyZDw0dmI8dNESAJhoMHAVKPcUoPVAI8EQ0) <lylgithub2021 (lylgithub2021)>:
 * Thank you so much! I lean a lot from you! The idea of functional programming make me think that just `head a` will get the whole original block

[13:24:55](#BXbRccpdfFzio8lfXdrLsTTSVXBQVnRuRUdYTjrf8kg) <lylgithub2021 (lylgithub2021)>:
 * Thank you so much! I lean a lot from you! The idea of functional programming make me think that just `head a` will get the whole original block. In Red it has to be assigned value explicitly!

[13:25:56](#SyQvxa65SQjCT-LobuqKhF5semdevhxlsLBGog1ft3k) <lylgithub2021 (lylgithub2021)>:
 * Thank you so much! I lean a lot from you! The idea of functional programming make me think that just `head a` would get the whole original block. In Red it has to be assigned value explicitly!

[13:30:08](#XLtrhGG0C-bwsjTYzydkx2RmbjQEgDqe8HWQkHgC9a8) <hiiamboris>:
it is in fact quite uncommon in functional programming to apply side-effects like you describe

[16:25:37](#q44n295nAy_oqrxznPTqo5c37C3BwTLxLAX-JMyaXbU) <gltewalt (The other Greg)>:
a: head a

[16:25:41](#17f5JjjVbDjTFk0vk52LjUD-pTj1Btnu65RYaNZlEvg) <gltewalt (The other Greg)>:
?

[18:21:48](#mQascArhwTukqCV5ejPB1CdoNRooMW_7uC7NIVZRkJs) <rebolek (Boleslav B≈ôezovsk√Ω)>:
I think that this can be interpreted differently also. I can understand that someone coming from fully immutable functional language would expect that `head a` should return full *copy* of `a`. Describing it as side-effect is misunderstandg what side-effect means IMO.

[18:31:43](#kPbznjBXr9clwrEm6TsE97i0fX8UeTt7zF1vf972CI8) <hiiamboris>:
what he says implies that `a` itself as a variable gets modified by `head`, copy or not doesn't matter

[18:32:46](#d-pDGSjZVRTK0W2lBwtA3S-CC-rZNYpdkEBWyafQqsA) <hiiamboris>:
in fact FPs by leveraging immutability and lists actually mostly avoid copying

[18:36:13](#JFavCu_7q1w76bapwxdUBMF06i9SyaVcwL7YIn_neCw) <hiiamboris>:
anyway my pressure comes from the fact that she/he after years of writing Redbol code still doesn't use `help` command to learn but asks community to solve all problems for her/him and give out the final result to paste and go, which is quite hypocritical, but is a direct consequence of us giving those final results and not demanding any understanding

[18:40:33](#xoXHYtQuHvEKK935gd1bvsouzxPOMKux1bb5xcuTqko) <hiiamboris>:
* what he/she says implies that `a` itself as a variable gets modified by `head`, copy or not doesn't matter

[18:41:42](#D3hav83oFjYBMFEjiE0-YODxfqqtkb59_WtkdsEZCl4) <hiiamboris>:
* in fact FPs by leveraging immutability and lists actually mostly avoid copying, but state of variables modification is a side effect

[18:43:16](#I1hcsKPwAgYwmigyMHjxj1nkNMJE70MZayaUzVAiUwg) <gltewalt (The other Greg)>:
Can't really demand understanding. 

[18:44:54](#XrsKZ8v0yUxj1Awl3YTXOg4UtJrLlovq5vIoNSXbZnI) <hiiamboris>:
idk about that, these are the very very baby steps I could even explain to my granny with some (big) effort

[18:45:26](#4nMS6B-le_018-4SgOUYOzPdrSUVNxP-L1y52Hxvt1w) <hiiamboris>:
of course I'm not talking about understanding every Red quirk here

[19:07:52](#PRWVYxobLef9ZEoTULKrBJ0WWiwN3UO1DNkTgGhCBoM) <gltewalt (The other Greg)>:
Well, you can demand it, but it won't make a person understand. And there are varying levels of ability that come through to try Red.

[19:37:19](#5-MoKrqtMDvCUCiviOetT_H71DFCM7MavxuKQS4ECl0) <hiiamboris>:
what I want is to see an *attempt* at learning, because without the willingness to learn the person never will

[19:39:32](#15tYwi7OoSlMN0fG6Nfj6faTXGHGHMjSA8kSm2mLuVA) <hiiamboris>:
it's completely fine to not understand something, but what if one doesn't want to? how do you teach without pushing back?

[19:39:58](#ZrpAoiiNN__BMDicxs6xNAZ-sVwDVu4hdr8yKJLocr0) <hiiamboris>:
if you were asking your mom to carry you all the time around so you don't have to do walking, you would be a cripple

[19:40:04](#QhFMg20-UgcpqU_Q1t0eNL1dsDa4noB8XJrGv9q_MB8) <hiiamboris>:
all of us would be

[22:05:34](#9rXLiq8Dmt4hGj_lIzfxQVZ3lgQcxfD5frc22bburkI) <hiiamboris>:
gltewalt (The other Greg) https://yewtu.be/watch?v=pQHX-SjgQvQ

## 7-Dec-2023

[10:19:18](#eev6uPcFVbPbXGD6wXPcwV6o6y91uYQwnkV6gXrYths) <dsunanda>:
Is there a list somewhere of public Red rooms available on Gitter?dsunanda (dsunanda): 

[10:23:14](#QaUyUSPys59kSAipum333IG5frGu7tVXktNulzTXuB8) <hiiamboris>:
https://matrix.to/#/%23red-lang%3Agitter.im?via=tchncs.de&via=gitter.im&via=matrix.org

[11:09:19](#79FFZHs6IHFJlHaubYsUkKXfMqknF6yxoUHHHt7B4DA) <dsunanda>:
Thanks!

[11:11:28](#ud_mf07AZ3Ao-d0A_3EcMiYK1W_qHvwvAH1I_bMtjxA) <dsunanda>:
(Gitter's IM being the pile of junk it is, won't load anymore on my old machine; and won't let me logon with my ID on my new machine. I'm starting again from scratch.....:)

[11:23:18](#ouS4Wogjq6LP_4sWekCCqWrEG-QlX5bMhcUlYnf6VsM) <hiiamboris>:
they break it all the time, then fix again, then break, then fix... eternal return

[11:23:52](#-5v9ATxGpqE3lG9EhWK-3X3q1BX3cgYPszRo8oc5CGs) <hiiamboris>:
that's why desktop clients is the way

[11:24:32](#BTDQqMLRfExzLEbhsBt5YUK9h20xPWSc2H1r-Gj5oIw) <hiiamboris>:
at least they don't pull the ground from under you

[11:25:24](#klAOUMC71eXSvdrrIZfOj_iW4vtZdUHF3N2tNlfssY8) <hiiamboris>:
but for web, there's https://riots.im/ - an archive of all element versions, so it's easy to stay on the one that works

[11:27:17](#3qPi4jjOjsmAVVRvQwLrCo4Ce2ZG7Y8MP2ZG_xM_Olc) <hiiamboris>:
* that's why desktop clients are the way

## 10-Apr-2024

[7:47:48](#ZQrraasZzId4l_p0ZYTkYSQW_bIJzdNxeWt5e4DIk4Y) <lylgithub2021 (lylgithub2021)>:
How to embed data coming from a data file into an `exe` program when the `red` file is compiled? For example, I have a data file named `test.dat` whose content is `1,2,3`. In the main progam, I will convert the data `1,2,3` into `[1 2 3]`. So,how to embed the data from 'test.dat' into my  progam so that the compiled exe file will run with no need of the file  `test.dat`?

[7:52:42](#3kc4sKz4tdUf-4knRheMch36Tasi3nhPasQ6IFh4-oQ) <hiiamboris>:
I advice saving the converted output as a `.red` file and then `#include`ing it

## 1-May-2024

[14:06:36](#mlEZySgVRvhnBItocyP4wilxV7H6GWp0IqN4EQEOtrY) <dislux-hapfyl>:
Hey all. New to Red. New to programming sorta. Always a newbie. 

[14:18:57](#j8WSwMpsqIVo6w9b3_FC3kLG8wCZcG1bOZpKGznhmHo) <dislux-hapfyl>:
Im willing to help somehow. Thrown into the wolves sorta speak. How can I contribute while I learn this lang?

[14:19:51](#87ujUma50haY0CJaItMP7ircJcrgEFIjfODPib-yxHI) <dislux-hapfyl>:
I already built a small Python IDE for Red and Ive compiled a couple of things. Maybe I can turn the IDE into a teaching tool???

[18:32:52](#aozokh3rMvNn5yaSr2mYyEu5-FPIqrZTO6ISgF5xous) <hiiamboris>:
hi :) maybe by contributing to the wiki?

[18:33:32](#EGXZFX_IMb0XaV-zY-_OmgvDGLe4GtnbtaEp4LUHD6A) <hiiamboris>:
as a python coder you may enjoy [this](https://github.com/red/red/wiki/A-short-introduction-to-Red-for-Python-programmers) btw

[18:33:35](#7PDUAhS9oDZFy2Ril0YyXF_eYpcZaNgTFi9_Jib7FXk) <dislux-hapfyl>:
That could be dangerous. Im a fool atm. Ive been using your codeberg code to improve the syntax highlighting in my py

[18:33:48](#llGXKDRrpDVpiq_KCK5VVgzuyG8emS2EyIRd8RfIojw) <dislux-hapfyl>:
Oh thanks. I have studied the Rebol guide

[18:33:53](#pQNpNPmLiNo8BkiQQ6jxG3FpjWYF3EltMkzm3UXr7q4) <dislux-hapfyl>:
It was really clear

[18:34:24](#g9dWL-OOemcgegor5ytFdT_5tVGO1JnvTZi8J5PZ6vQ) <dislux-hapfyl>:
You are a very active contributor

[18:34:32](#Ypb5ZxjbhoU0VG0l8Xfum9aKQQPop4Y_KFUwrccq_p4) <dislux-hapfyl>:
Thanks for taking time to reply

[18:34:38](#g40MQvcRx1sbgxaCbrxBbY3N6taeMolo8t-ss7hqcr0) <hiiamboris>:
> <@dislux-hapfyl:gitter.im> That could be dangerous. Im a fool atm. Ive been using your codeberg code to improve the syntax highlighting in my py

make notes of what confuses you, organize them later when you're better maybe?

[18:34:50](#sGAiwditPPQRHutkAjpGgfbHsm6p2liZqYzCMY7tyzI) <dislux-hapfyl>:
This is a good idea

[18:35:02](#0TO51anI19_MCvJKBsceZdqEMmO6RAbkX9K4yRlaGlQ) <hiiamboris>:
> <@dislux-hapfyl:gitter.im> Thanks for taking time to reply

always happy to help

[18:35:04](#t08FqqCDT0pFB8QyWEpjqdLg78z0f0NjMb0PguIhWy4) <dislux-hapfyl>:
Pardon for my previous reply, Im a funny guy sometimes

[18:41:14](#7wlrZO_VBIvlhiTFPujlL1CLadrTVpYe92_VNw7_esw) <dislux-hapfyl>:
hiiamboris: Which wiki do I contirute to ?

[19:54:42](#rFS_KwCMFIB7Acmnsw_6EQiC9RNbyhjlhXTJBPboT18) <hiiamboris>:
idk, I'll leave it to your judgement :)

[19:55:19](#Q0c3L-EyQtsKc5rvyIAwe6_OkD4nNM6Kq1QJAyKXkZU) <hiiamboris>:
a lot of wiki is just disorganized messy notes, so there's a huge surface for possible improvements

[21:37:56](#qKzxiqolUyZ6V5Jy82FKuf48BAZEe1YmAPUGc2z-TVg) <dislux-hapfyl>:
![https://gitter.ems.host/_matrix/media/v3/download/gitter.im/b27b146f2bffff0871ada84178b804676a5bb8ed1785785747349962752](https://gitter.ems.host/_matrix/media/v3/download/gitter.im/01c95596a940acae70d395db10f7d973c0442e781785785749497446400)

[21:38:13](#P3XwzdRXyHrC614Hnxzykst4nVd1AoWkk-14jPZBpWc) <dislux-hapfyl>:
I find this to help me read Red better

[21:38:20](#2Go0iMN5WZrYV2VHMdtXpv_hegFblrdgce8fUuyKGcg) <dislux-hapfyl>:
I made it in Python

## 2-May-2024

[4:05:13](#Al1a3zclZzCfogOlkqe_59STSaQ7Q5qDlP6raTuN5j4) <mikeyaunish>:
> <@dislux-hapfyl:gitter.im> sent an image.

I like the idea of a help code info box, as you have shown it. I recognize your sample code :) Syntax highlighting is a great idea. Most good code editors let you specify how you want code to look, although your style does have some good features I haven't seen before.

## 3-May-2024

[3:14:58](#idcnKHdYI0mFshUTijpxxVzgoVCC14Jtqdl2rH6wyi0) <greggirwin (Gregg Irwin)>:
As a new Reducer, with fresh eyes, your input is valuable. We become blind to things that outsiders see when they come to Red.

[19:48:10](#SamNUVPKLUhi_pMLj9Jrym8qbgIXtzYFYAnoX-pD6Cw) <dislux-hapfyl>:
Hello to all. Have a nice day

[19:48:21](#V4EnakrL3kaELnKRyDB9Ev-LMcVCtqYOlJEYGXd-VwQ) <dislux-hapfyl>:
mikeyaunish: I have improved it

[19:59:45](#qAq3xg2egKlXkeMFaaWwF22bT5eYI6aY6Zs-KQ7ZHLQ) <dislux-hapfyl>:
mikeyaunish: I have improved it

[19:59:55](#YAd1yaiSs1j8pSDFHzDWfygCKygE52KwR03af9_5OyE) <dislux-hapfyl>:
Learning has been fun

[20:00:48](#mRZQLGo8eNjf7WKA2kHZqCn0Y33y8bmsPuM_xmWY4q4) <dislux-hapfyl>:
I have to add code for it to strip spaces and add indentation when you need it and stuff. Im a newbie programmer in general.

[20:03:18](#CYqN3gQjwJdYvwkcOkety3oljm18xrY9VrDVm73QOs4) <dislux-hapfyl>:
I made a DSL myself in order to make this "IDE" for Red. It is in Shell Script called pnk.lang and it compiles to Python. The program called shimky is the IDE for pnk.lang. As you see in the video my IDEs have access to the shell. I just like having fun with computers. I already have some ideas. Here is the repo for my DSL and IDE. https://github.com/dislux-hapfyl/shimky 

[20:05:29](#unXxTBpXdJBhamloyeWLVN-kIRdQjhB54AZjJ4oZMRo) <dislux-hapfyl>:
I made a DSL myself in order to make this "IDE" for Red. It is in Shell Script called pnk.lang and it compiles to Python. The program called shimky is the IDE for pnk.lang. As you see in the video my IDEs have access to the shell. I just like having fun with computers. I already have some ideas. Here is the repo for my DSL and IDE. https://github.com/dislux-hapfyl/shimky 

[20:05:30](#exP30p_jtmoydM3n0hzk2np_Xz8dn6gR5gjr70qBoqs) <dislux-hapfyl>:
I made a DSL myself in order to make this "IDE" for Red. It is in Shell Script called pnk.lang and it compiles to Python. The program called shimky is the IDE for pnk.lang. As you see in the video my IDEs have access to the shell. I just like having fun with computers. I already have some ideas. Here is the repo for my DSL and IDE. https://github.com/dislux-hapfyl/shimky 

[20:05:47](#-9QgV1ZW8oB4zh_WkXlFdt27GZ3M2nrI6WiXeaknUlo) <dislux-hapfyl>:
I made a DSL myself in order to make this "IDE" for Red. It is in Shell Script called pnk.lang and it compiles to Python. The program called shimky is the IDE for pnk.lang. As you see in the video my IDEs have access to the shell. I just like having fun with computers. I already have some ideas. Here is the repo for my DSL and IDE. https://github.com/dislux-hapfyl/shimky 

[20:05:52](#G9eD6koFbGtZOYXZf30MgxM0rXwtbHszGr19vdL76xU) <dislux-hapfyl>:
I made a DSL myself in order to make this "IDE" for Red. It is in Shell Script called pnk.lang and it compiles to Python. The program called shimky is the IDE for pnk.lang. As you see in the video my IDEs have access to the shell. I just like having fun with computers. I already have some ideas. Here is the repo for my DSL and IDE. https://github.com/dislux-hapfyl/shimky 

[20:05:58](#dn0PtN3Fnk4Px-iEW0krggttQIyEK3vfiFPWYxK7V1w) <dislux-hapfyl>:
Runs on Linux only

[20:06:56](#RBEDFJ9y4Ky0gleQmrfWeO4aas4GcRjYu3pw3YCFh_s) <dislux-hapfyl>:
 * You can copy and paste. The red interpreter and compiler should be in your path named red and redc. Mine is /usr/local/bin/

[20:08:54](#kYt9hRNZCBnZr3v_uNPmrqtAOT1v00MsQJvelr9BBY0) <dislux-hapfyl>:
 * and also bash is required if you wan access to the shell. s [linux commands] runs shell Escape removes shell window. o [file in present path] opens file, w [filename] writes a filename, d deletes all inside the text pad above command line. Enter to execute all commands. Escape to clear command line. While in text pad to access command line Escape.

[20:31:53](#5JqDGB08Xmbu2t0t6Snc_wvzwQdEC0ROne0muAL77NM) <dislux-hapfyl>:
 * and also bash is required if you wan access to the shell. s [linux commands] runs shell Escape removes shell window. o [file in present path] opens file, w [filename] writes a filename, d deletes all inside the text pad above command line. Enter to execute all commands. Escape to clear command line. While in text pad to access command line Escape.

[20:32:26](#ycfVisCVqWrx4-c-4O-ClLHtZgD9H_E3xy96_XTo2hA) <dislux-hapfyl>:
https://github.com/dislux-hapfyl/redide

[21:33:29](#q-nhpCYtF8gBaLvCaegim8JpWge2yFf9iMCbSGjSzxo) <dislux-hapfyl>:
 * I made a DSL myself in order to make this "IDE" for Red. It is in Shell Script called pnk.lang and it compiles to Python. The program called shimky is the IDE for pnk.lang. As you see in the video my IDEs have access to the shell. I just like having fun with computers. I already have some ideas for some apps in Red. Here is the repo for my DSL and IDE. https://github.com/dislux-hapfyl/shimky 

## 5-May-2024

[12:24:02](#FsdpusFikCuqYypHT44lOAz5JNrnGXPT0fRowfbTE58) <dislux-hapfyl>:
#include %myfunc.red

[12:24:13](#PwGOOd_t-nLDT0GBi4uaKOsoqRHAX5XC2MOOJcNaKp0) <dislux-hapfyl>:
does this import my functions into the console

[12:26:09](#ScLfyC1xgjriUtBBc7_4egEOmGrO8JGFj6WfLKO5dS0) <dislux-hapfyl>:
== %mf.red
>> source cat
CAT is an unset! value, so source is not available.

[13:31:41](#jIFm68GLikr5H-mYXPsjPnZQRtAFsmLVXgF3A8rofqA) <gurzgri>:
The console doesn't expand preprocessor directives. You'll have to either explicitly `do expand-directives [#include %myfunc.red]` or just `do %myfunc.red`.


[15:04:08](#1SmiRghy2zImUDWazx7Wes7BehQydv8uQiWGanLw_vE) <dislux-hapfyl>:
oh

[15:04:10](#mc0VgGWKcRVi3dKSmfMioJXRuRPVPzlxdvOovr8qcxg) <dislux-hapfyl>:
Thanks

[15:04:23](#CCX_CHOcy2A8ej_QerkyGyuulTst1Dn8l5hg8hJubpk) <dislux-hapfyl>:
Just hacking around to get a feel for this

[15:04:51](#WEJ6D2gBX7WxwP_Q3eU5Weu3BDLtD2i9lzb9ml1WyTA) <dislux-hapfyl>:
In essence this will make my functions available at the console

[15:18:50](#iFsV8u9pNi5BmooCSnEYSTZ8DOMS8je-tpqJ2S3dg8k) <dislux-hapfyl>:
Guess not

[15:20:02](#bJw4777-orZELwz_lldSQD4OUS-1zC-ZsU9g-Z12TbM) <dislux-hapfyl>:
Maybe I need to be more clear. I was trying to "import" function definitions so I could use them in the console. 

[15:20:13](#iWiHFmuMOSKwpa7d890lhD5EVrBAKiII0f2KD55SEKI) <dislux-hapfyl>:
Just trying to learn 

[15:20:19](#YxkpJT15mA6vlec1B71km8PLslvuBDvjxUoJ3UH1_DU) <dislux-hapfyl>:
By doing

[15:40:37](#f4P7sIoEjxG9ay4yFuGhAro-mjlEnTh5K7SjqTl63H8) <dislux-hapfyl>:
https://wiki.tcl-lang.org/page/Meta+Programming

[15:40:42](#e9C0HGcJ6w1-nIub62KgUd6616BIP90JEOxwNuokRVg) <dislux-hapfyl>:
I find this helpful

[15:42:09](#L5saFqToe4Cs_QpvRIEITW9Xj35nv_nfwYmO8iYFg10) <dislux-hapfyl>:
Just reading everything I can do understand this Red

[15:44:54](#0yMSwoEnsqfNPPRxT4oPxkWe347RVshQJ6YNfHS1GXk) <dislux-hapfyl>:
http://wiki.c2.com/?MetaProgramming

[15:53:13](#h0mjAamDor6_GVr2TzlMRi7udlFmn68qpuOXk6cuu-0) <dislux-hapfyl>:
https://www.rebol.com/rebol3/motivation.html

[15:53:30](#e6FJphqBX9xrYADE1BsEZoL4tJGrPgnHx7gdjwdftqc) <dislux-hapfyl>:
This can be a trail mix for those new ones that arrive seeking for answers like me

[15:53:49](#TCjn4yLarImSFN4dGw1ysY51h5qMTTfTA45XvFtNlsQ) <dislux-hapfyl>:
LOl trail mix... trail of breadcrumbs I mean

[15:54:08](#V--DMnsZGLCDmTn0mVLv-177LQKLF6CYpI2znOH1QR8) <dislux-hapfyl>:
 * LOL trail mix... trail of breadcrumbs I mean. Breaking a branch ;)

[16:06:16](#Fj55MWTbqKHQoQR5z4EWYEgoX0CY5KqL9aBcspQrFBc) <dislux-hapfyl>:
https://en.wikipedia.org/wiki/Homoiconicity#In_Rebol

## 6-May-2024

[17:14:47](#KR9XpTuG2XcSLagRhzugpIVC6NS6DpQ98j3tsR9T0iM) <dislux-hapfyl>:
https://ryelang.org/meet_rye/data/values/

[17:14:50](#kcrbnljrZtWW2_jESOPUV8g3buvEjiQIO5GwMAYq7lc) <dislux-hapfyl>:
Rye

[17:14:53](#IWI4sH9gp8ZI4r2v3DiCt--NsrBoi40-16HHlyjd1B4) <dislux-hapfyl>:
Huh

[18:44:26](#zPi0VwRwZActZPg1Sr_1qNM4y6Psjbq7D5Q5l0B9kF0) <dislux-hapfyl>:
https://www.youtube.com/watch?v=4ZbGJemrLFw

[19:45:45](#RePDekmI5a6iKKHLYwjWUU7IeLwwprOjc0ZafITQFaM) <greggirwin (Gregg Irwin)>:
Topics on other langs and non-Red subjects fit better in the chit-chat room, just for future reference.

[21:03:52](#5myfoXnI18Xd2jMDbd1Gb2RmxQDrIxuzsyxaFfXXJn4) <dislux-hapfyl>:
Alright, I only posted it because it helped me get more clarity on Red. I guess I use different ways of understanding a subject by relationships and stuff. Noted to post in other room

[21:05:40](#e2HqG8QfkTLCa8jbpShK9Ccrtm8fs6_Ev_m3fHu4sT4) <greggirwin (Gregg Irwin)>:
My fault. When I clicked the link, so I thought, it took me to an FPGA video.

[21:05:58](#x1afDfeZz2R22mHXGFQg_T9hvUquuGVf9F7aGo8Nhjo) <greggirwin (Gregg Irwin)>:
This time it took me to Maxim's which is great.

[21:06:03](#ty0Xz8WbFZ8U2qKh2R6Z-BTa8eJ3EJpS4ZHAZJxFTDg) <dislux-hapfyl>:
Oh yea

[21:06:07](#_Qmlpr708_OdDHXSm_f4lHS0ot7dS9Y3URyRthPSjlU) <dislux-hapfyl>:
Your fault buddy

[21:06:11](#QJf-gffHbHE0qdjlFkgtK2iP8s-yvk1BZvw4MoEk868) <dislux-hapfyl>:
LOL ;)

[21:06:16](#yzIE-VkichdNd-L7sIKLgpKGJUid-bLS70oMoqsTwoA) <dislux-hapfyl>:
All good friend

[21:17:19](#trPKmzY7ZzlFk4wmulbEsPGHH3cktn3fT4tLtQdI4Fg) <dislux-hapfyl>:
https://www.youtube.com/watch?v=1riJ1PYYOfQ

[21:17:26](#j7v1SQLylDwSmAeUORWnHBP9vQ3Wl_VCPyiSX6HVS2c) <dislux-hapfyl>:
This is great too

[21:17:29](#7qFOFN7F_-JIErSJq5AJvW-8MbFGANKzSFR8vPoKYhY) <dislux-hapfyl>:
Going thru it

## 7-May-2024

[6:11:32](#BGwQm2nfuNmt3aZanH9YdUkl_aQKu2oMjZIMzecfV8U) <planetsizecpu (Jose Luis)>:
Welcome  btw dislux-hapfyl  Ì†ΩÌ∏É

[11:36:18](#j3vAB2GPIYsYuatOeYp5y0DDKf2e3yX_JsAMXcpru0s) <dislux-hapfyl>:
Gracias!

[11:36:31](#drqz0l71Z8eoY3fWIZYzJwm5PpnPJ3lwEULFwzNM1VE) <dislux-hapfyl>:
I believe we follow each other on github

[11:50:09](#U74ODici4hW4dq_1Sj3ji1kCdXNJMLsSPZU3VbQdIFY) <dislux-hapfyl>:
Just used your more function

[11:50:13](#GtxUZqT0AU_3yFK3YFEzM-kZu4hp1InK0c9aXbGgE1M) <dislux-hapfyl>:
thanks 

[20:50:15](#dviK8EEPvJF-7VKkq5CPwmemISK0PFTHFdQlaY4cJno) <dislux-hapfyl>:
https://github.com/red/red/wiki/%5BDOC%5D-Why-you-have-to-copy-series-values

[21:15:32](#in6UNRRhVIWxPxel2VDs8fMhO-cSTDgWVctAo1nXAIw) <dislux-hapfyl>:
SO Im just editing data that so happens to do stuff to my computer when I evaluate it

[21:15:35](#0y4R0AsmblwhwPholnWa5jhhKF0CNzLa2237Ax8KRoo) <dislux-hapfyl>:
This is cool stuff

[21:15:48](#_r6a_gLNMOeMpCWWdGt4BuoiKpfqSqaNfBsY4PIhJes) <dislux-hapfyl>:
I cant wait to get it deeply and see where it takes me

[21:16:56](#mG1irp0Y6ZrZZ9EiTzvyqQtz2RiExB2YtSY_J66st2g) <dislux-hapfyl>:
In other words we can make the next emacs called ipcs using a dialect of Red

[21:17:12](#3Zi52wRngu77d9gB2_Jago_rQykhMRZ9xHv4u6SvXSc) <greggirwin (Gregg Irwin)>:
Yes. Sometimes we say that "everything is data until it's evaluated" and in Red you have a *lot* of control over when and *how* things are evaluated.

[21:17:13](#IkLmXA-TsYTx2_Ixa3KyHSTQMp-NEBaVdu9DW5XtjpM) <dislux-hapfyl>:
Its the same type of thing, Lisp just uses S-expr we use Blocks

[21:17:21](#t_k4fkDAAtuzbSkLCEmlkBL7T3KJCkMaKBQjF87LKhs) <dislux-hapfyl>:
I see

[21:17:24](#N5BFSbLHz4svMLDOD95FBU8JBtWuxL9vLLAwmwUD2cg) <dislux-hapfyl>:
Hey Gregg

[21:17:42](#Ir9w-yNhZlqSXdxEOo14PWTdsX6xJsLM6H-V_F4WMt8) <dislux-hapfyl>:
Well I pray all things work to move closer to 1.0

[21:17:58](#uruVRqDwjox96enhSDVjkW17K5-W0k5a-joO73_28eo) <dislux-hapfyl>:
This thing is gonna be amazing, well it is already

[21:20:26](#YPtW8kxtlCcACPUOHL58rBElPhc_XvJmE0UqRRUuZPM) <greggirwin (Gregg Irwin)>:
Correct. I believe it was @9214 who pointed out that blocks for us are somewhat like F-exprs (https://en.wikipedia.org/wiki/Fexpr).

[21:20:51](#-Q6YHLejI05AWY5lok4hHGQQyVA6wpNI9e7E2H0uR3w) <greggirwin (Gregg Irwin)>:
Then you get into binding and your brain explodes. :^)

[21:21:17](#T1h7X5zse2bra62lcEEdGGvcAM1IE092lN17plPw8g8) <dislux-hapfyl>:
binding to context

[21:21:33](#E6MFe0tAfsXYte9_dSwj2O_DUQtNgfdHseBDr1qDpJg) <dislux-hapfyl>:
I read the Guru meditations and many other documents here so far

[21:21:44](#FDi7ZmpJGfxwYNkfMVOVjeT6wCLFXiov4dqXLQf97fw) <dislux-hapfyl>:
Also 9214 explanation from HN

[21:22:05](#lxvCqDllMZ_VhqlnjL0WYI8i1LMBuUNm8g75XJajvIc) <greggirwin (Gregg Irwin)>:
https://gist.github.com/9214/cf24ff767f6167ab16203b77b06e2a82

[21:22:12](#s0YU2I5OzsOJY7OGmKuyclKgjhrApfWOsBs9di5w7Hg) <dislux-hapfyl>:
The thing about me is Im not a "programmer" so Im learning computer science by learning this

[21:22:29](#dw5WDM2Anmvt36mVV-d4pNm9FpDdXiDCwD5wxD3DeIc) <dislux-hapfyl>:
Never knew what CST was nor an AST

[21:22:38](#fM6sTmSm-c-fthDgXgp1-SupuaKYCR9kaG3_SFNO-xc) <dislux-hapfyl>:
didnt understand Turing and VonNeuman

[21:22:51](#rBXAV5IRHbawyaSWD_IPGsBJ4SEj1FlNrLOrKL9OuGA) <dislux-hapfyl>:
Didnt even know lexicon nor scope nor grammar

[21:23:03](#dos39EKKnx0JRt6KcHznU72XQZNxPMYRikUqrMM0wdk) <dislux-hapfyl>:
Now I dream in this new techinal nomenclature

[21:23:19](#UhC_HG7m8jN142TkGT0TI8geKrO041xTEn-j3dBLcNw) <dislux-hapfyl>:
Every morning Im looking at like homoiconicly

[21:23:31](#_dnzIPZl69l7-_bjH2G6eOA0ZLxEU1NndIM3oIEDc50) <dislux-hapfyl>:
 * Every morning Im looking at 'life homoiconicly

[21:23:35](#q4SYwxa0XL6i3Gnywd-Drdje2PVbOPufEIAyBftAiBg) <greggirwin (Gregg Irwin)>:
I was a theatre major. :^)

[21:24:09](#oLMTa0uX0dtlLFLtUZbVGrmL5KT1UOysS1ILUjqqElY) <dislux-hapfyl>:
No degrees here, just a jack of all trades, master of none but oftentimes more useful than a master of one

[21:24:26](#bQqSdvG9B_AdDymFADUHUHWzp1NU2YXbFHsjAmq-zwI) <dislux-hapfyl>:
I been wondering of Red machines

[21:24:29](#unp16A2ywQUn9FonCfE-1-TmWkm1hNb2eGnrXXzgTJE) <greggirwin (Gregg Irwin)>:
The worst thing about Redbol langs is that they make it really hard to go back to anything else. You get spoiled very quickly.

[21:24:47](#wnUtwRrMD41FYip6K-roQhytBndDfy6mvNtaroQ696s) <dislux-hapfyl>:
I made a DSL without knowing what I was doing

[21:24:56](#QvLN_GuTnDZNR7jemZrRlharMCz41Gggflzq59N_kHA) <dislux-hapfyl>:
Because I hated writting the boilerplate of Pyhton

[21:25:09](#NVA7WGqzLcEyU7LNqiMPJkHYtMuhqI_0d5lqzAiPILE) <dislux-hapfyl>:
I learned how it operates not ever understanding it as a language

[21:25:32](#HKrF2-WfMDyjJHPH7hqGSRovYO_0KV86E2xOvMicEZo) <dislux-hapfyl>:
Now I have jumped into the flat ground and landed simply in clarity

[21:26:00](#MUwh21TcvwNbpXrHBzQA7k1B4NEjTffyGWRzAmWfHwA) <dislux-hapfyl>:
Seems like this would be the most beuatiful way to develop a machine from scratch

[21:26:12](#_ZPHHDJD3m4j_bTUrn7aFcFsp4VAfiP-mgNk24OX5go) <dislux-hapfyl>:
and entire OS for a personal computing base

[21:26:24](#CEK603GHDbyheyuZM230fynJ2xgMOb5afdID9Eeh6Zo) <dislux-hapfyl>:
and entire structure for our entire life knowledge

[21:26:39](#Hv829FtP8b14A56GFbMi2K3UNevwf2lD3yEKfF54p4o) <dislux-hapfyl>:
Maybe ... Im just trying to understand it all ;)

[21:26:47](#DyGEwyJiTlK6Yj6bop417VySoO0WhfkheGUTcDrLMQM) <dislux-hapfyl>:
Thanks for all you folks hard work

[21:29:39](#F4Js-X46tGcdvDSVOrquFT4OD32ZNQR0hXwOp1SkRhk) <greggirwin (Gregg Irwin)>:
From Forth we get the idea that the first thing you do is define the vocabulary you want to write your program in. That is, create the language that makes it easy to write the real program.

[21:34:15](#tU6BEjUl_IWdJX8i3LEZBvK9iNj1gUm77i0AMSAId0o) <dislux-hapfyl>:
I briefly seen it yes

[21:34:40](#mwx6r7iTlZfG7GIU7NdK_LHQ0oLOc6STA-s6HnCPyso) <dislux-hapfyl>:
I did the same thing. I defined a bunch of shel functions that write the python for me with indentation and everything

[21:35:01](#TG_tRTAx7414wAn2zzerJ_-mcA1Rapk7VbC4B7069uY) <dislux-hapfyl>:
So I developed an IDE to use the shell script using colors

[21:35:11](#CrVJKSBNm0CWXZStQdLimtZB5bYPUgRPK1gvNruwtAY) <dislux-hapfyl>:
I have a video on my youtube

## 8-May-2024

[0:05:53](#gGoBOzfNO8PAhb4o0R4uYC8uFqLzK6aJPt8uQiSwRsU) <dislux-hapfyl>:
 * I did the same thing. I defined a bunch of shell functions that write the python for me with indentation and everything

[14:05:07](#mScdgjJuim5pV1T18Kb7nj7mpzXzUFT4ek_wWssv18k) <dislux-hapfyl>:
Thanks. Took me a minute to respond but here I am. As I learn more I will change things. I am deep into this learning process. Not really a programmer so I have a different look and background on things. I am glad to be here with yall. 

[14:11:01](#SAHUj1EFWE0Ac5gbiBL8-0ZW2zFXgKDRMikdkmj2gxs) <dislux-hapfyl>:
Welcome Daniel to the Red chat 

[14:11:04](#xXRLOF0avR7u7QucWX4w9cg9tdqH4KTHBz6qMR1r3JY) <dislux-hapfyl>:
;)

[14:13:20](#SogpJD_r4e-DDGtgDuaEnb-RTIpoGiybQqruByyMeo4) <djongepier>:
Thanks Ì†ΩÌ∏ä

## 21-May-2024

[6:46:15](#FpjPvcJhkjC35S2ExXz8dN-J2yZNLbsv-cPp3u5lP2w) <planetsizecpu (Jose Luis)>:
Welcome btw  Daniel Jongepier Ì†ΩÌ∏É

[6:46:56](#oj7GI3z5O-bPWW66n4cuMN2nGbW2ytCYlpl-gpD0d7s) <djongepier>:
Thank you Jose

## 23-May-2024

[9:26:13](#L5ZlAuZIp08gDylKHW152IKqgY7sNky7Wm75hdUEd2o) <endo64>:
@ams0_0:matrix.org: "How to write to system32 on 64bit Windows"
Normally you should not do that. But if have to;

You may disable File System Redirector by using Win API, see https://learn.microsoft.com/en-us/windows/win32/api/wow64apiset/nf-wow64apiset-wow64disablewow64fsredirection
You would need to use Red/System to do that.

Or try `%windir%\Sysnative` which is not redirected. See https://learn.microsoft.com/en-us/windows/win32/winprog64/file-system-redirector

## 25-May-2024

[11:28:36](#0vPko711BCa3-etsCsfk8l29IY0Lp8uqjtT_bzyYkK8) <‚Äé ‚Äé ‚Äé ‚Äé>:
hey guys where can report a bug ?

[12:08:21](#TVIZSPkE6zNl4_WCvteT-tSNlHjvBuSVUNjc-WqInXU) <gurzgri>:
Before opening an new issue, it‚Äôs best to post your findings ro red/bugs for others to confirm

[12:08:51](#tFAYMuFvomhRTmKZoeLJDkIHzoe6d4ZaY-IDpLXAJVk) <gurzgri>:
* Before opening an new issue, it‚Äôs best to post your findings in red/bugs for others to confirm

[12:09:37](#Npg6jOpjuD45RgyNOFtcvoIA1c9yre4H4jMg5ruLVlk) <gurzgri>:
* Before opening a new issue, it‚Äôs best to post your findings in red/bugs for others to confirm

[13:04:13](#LFaXnC3VNlqoaWxRa86_BCae1HeVEKxTf2gqlS3UPhg) <‚Äé ‚Äé ‚Äé ‚Äé>:
can you give me a link please?

[13:33:53](#80fXt2ySJrkMvf3vVHAnZ6O6THqXErkf-kJe9vMrImg) <gurzgri>:
#red_bugs:gitter.im

[13:42:36](#HkcKC5PZEjZoKgBta7bvC0FDX3lf5PnahA10vGSS8do) <gurzgri>:
https://matrix.to/#/%23red_bugs%3Agitter.im

[14:02:59](#FSoijRjUKWGZzchUgi6rbVHe4p9ApQQi1tA8OveKMNk) <‚Äé ‚Äé ‚Äé ‚Äé>:
thx gurzgri 

## 5-Jun-2024

[18:43:52](#iUqSx2w7Xw7mOv9rSKbFHyJ0haJkjPI5jlQypVqXzg4) <lazaruslong2048>:
Hi. I am new to Red Programming. Programming in general really. Using light weight windows 11 laptop. I downloaded Red view and was learning stuff. I had to delete Red and then went to reinstall. After downing, Windows defender notified me of malware. Didn't happen the first time. Defender wouldn't allow me to download. Any ideas?

[18:44:57](#yISsyH2PNUnJsJd7tV1sfN05EAApP5JA7nBzmbLeu1I) <lazaruslong2048>:
First time I've used this app too.

[20:53:30](#R-Crd-eGT-PmaYB1yyxsLE1Sg9IQS0X8MVYjgRCNZ0k) <hiiamboris>:
Add Red to exceptions

[20:53:49](#G2PSSzj9QlwVN4ty_t1D2nYKqMjHWHtwA5goPIFOY9A) <hiiamboris>:
* Hi :) Add Red to exceptions

[23:01:37](#EBprk_0GrQ30wiPvfZ8W2ZakZqSLEP3dhmnHKZokXag) <dsunanda>:
lazaruslong2048: False positives are way too common with most antivirus software. It's a pain. See this for example:
http://blog.nirsoft.net/2009/05/17/antivirus-companies-cause-a-big-headache-to-small-developers/

## 9-Jun-2024

[4:51:59](#SdC2x1py4G-JhdN6RIvRhupinOQ7sTt4OTOtae5um1U) <ldci (Fran√ßois Jouen)>:
How to use Red-TUI ? When trying to compile make-ui.red i get an error.
```
*** Compilation Error: invalid datatype name: face!
*** in file: C:\Users\fjouen\Programmation\Red\red-TUI\modules\view\backends\terminal\make-ui.red
*** near: [
    face [face!]
    /local proportion ui bar val
]
```
What is wrong?

[7:03:27](#x7LLeFczA-55jlY5Fc8RptQz1_01ckm1aMpjvA6MSZc) <gurzgri>:
I don‚Äòt think you can already use the toolchain for this, so instead I `git clone` the `red/red` repository, `git switch` to branch `TUI`, add `View` to `environment/console/CLI/console.red`s `Needs` header and `config: [gui-engine: 'terminal]` and compile that `console.red` using REBOL2. Than you can interactively play with TUI in the console and `do` scripts using TUI.

[8:11:35](#hUt1v7VCoUZOKufLg0eqa6u_CWRWSbZcnYlm3Y_IetI) <pekr (Petr Krenzelok) (@pekr:matrix.org)>:
I have suggested to setup new environment, so that apart from basic console, or gui-console, there would be tui-console. Or - make TUI natural part of the basic console. No header modification in source should be required imo, that's inconvenient imo ...

[9:07:33](#-up33Xtmj-k4iBEYZNrxcnX2UZa3xbaxJu_kIUrC8ko) <ldci (Fran√ßois Jouen)>:
Thanks :)

## 10-Jun-2024

[1:30:31](#IZN-zHOI4PQFjvJrDwy2-Ez9EhgCujkvJK0YtDeOjRQ) <qtxie>:
> <@ldci-5673ead416b6c7089cbf2ba5:gitter.im> How to use Red-TUI ? When trying to compile make-ui.red i get an error.
> ```
> *** Compilation Error: invalid datatype name: face!
> *** in file: C:\Users\fjouen\Programmation\Red\red-TUI\modules\view\backends\terminal\make-ui.red
> *** near: [
>     face [face!]
>     /local proportion ui bar val
> ]
> ```
> What is wrong?

There will be a blog article about it soon.

[1:31:41](#wtWdFW_cs9k-orKF8H_dOFAYOQlUZjAwoYrkmgfRw8I) <qtxie>:
 * There will be a blog article about it soon.  `make-ui.red` is used by the backend, cannot be used standalone.

[15:01:14](#RYTBd0HNlGLkesQBPLqK4U5vaLjIMVAduSfpNZo7w_M) <‚Äé ‚Äé ‚Äé ‚Äé>:
hi how can save output of `ls` or `dir` command  in Variable?

[15:08:43](#H5LRKWoC-dCBu2BqyPAuypfHekblbqoUHDwdfoln_hA) <pekr (Petr Krenzelok) (@pekr:matrix.org)>:
I faced the same question two days ago. Found no way. But - try to read a dir, e.g. folder: read %mydir/

[15:12:11](#OXGMd2p-e86wTUoj--I0y9uJUiv46v-KSKHutpVeOGg) <pekr (Petr Krenzelok) (@pekr:matrix.org)>:
Iirc, the dot syntax shoul work too. You can work with the result as with aby other block, sort, skip, iterate over, filter using remove-each, etc

[18:11:50](#SG6zVEPK3cO6UqPIWUyBNQIAdY4GgOtgOlJ0VmpMPdc) <greggirwin (Gregg Irwin)>:
ams02468 (ams02468): look at the `source` for those funcs. You'll see they both use `list-dir`. You could copy that func and make your own version that returns the string. Here's the issue. Those functions are designed for use in the console, and format the output based on its size. Think about how you'll adjust the func to handle that.

[19:50:46](#0EnKMFg0wCXKqEEylGCfuYiGtDjA17-IYnjpIW5C4xw) <endo64>:
@ams0_0:matrix.org: If you mean output of the DOS commands then you can use `call/output`:

```
>> call/output/error "dir" s: copy "" e: copy ""
== 0
>> s
== { Volume in drive C is Windows^/ Volume Serial Number is 760...
```

You can also output stderr as above. Just remember if an error occurs, `s` won't change, so better to `clear` before use it.


[20:20:33](#LLtAbwjF2VFAvuQSPJ-ruZFrt_kZCsh7Q8I7ub-UB7I) <‚Äé ‚Äé ‚Äé ‚Äé>:
@ams0_0:matrix.org: If you mean output of the DOS commands then you can use `call/output`:

```
>> call/output/error "dir" s: copy "" e: copy ""
== 0
>> s
== { Volume in drive C is Windows^/ Volume Serial Number is 760...
```

You can also output stderr as above. Just remember if an error occurs, `s` won't change, so better to `clear` before use it.


[20:21:18](#G6cBRuKkTJecboSAmkq5zn4oouPVQ-X0UFe81vEIOJM) <‚Äé ‚Äé ‚Äé ‚Äé>:
thx greggirwin (Gregg Irwin) endo64  pekr (Petr Krenzelok) 

## 14-Jun-2024

[12:28:30](#1WmTv6V-3Xf4x9GBlceJRYMmDbgsuCxDgduUMf23PZg) <‚Äé ‚Äé ‚Äé ‚Äé>:
hi, can use red to auto pressing the buttons, Like AutoHotkey language?

[13:07:55](#Jek_GpwO84BRXsb5OLyq2yhkSkQ0vA3dqWe1SEKF63g) <hiiamboris>:
I did that with [this project](https://codeberg.org/hiiamboris/red-view-test-system/) but it's out of sync

[18:54:14](#4GJLZeYJjviEv-RxIOG4thfNxTLVdeOu_-kR6Akpsmg) <greggirwin (Gregg Irwin)>:
I have an old `send-keys` dialect I did for R2 but haven't looked at updating it in Red for some years. 

## 15-Jun-2024

[6:52:17](#IuoOLvzpjnNwDY2Pyp6tIy_0DwSl6eTC6htgIX3qMWM) <lylgithub2021 (lylgithub2021)>:
I want to run a shell command and see the result on the console(Win sys) by `call/shell/show "dir"`. 

[7:03:26](#nbakZwcBK6k9_UMuZdk7WqkT-pWFcmfNJy80bfPXN9E) <lylgithub2021 (lylgithub2021)>:
I want to run a shell command and see the result on the console(Win sys) by `call/shell/show "dir"`. 

[7:08:04](#8sA0x1wtoXdRgydLvDlSVveL7_TWDKEYmq4nUVvnfBY) <lylgithub2021 (lylgithub2021)>:
I try to run a shell command and see the result on the console(Win sys) by things like this `call/shell/show "dir"`. But the console flashes to disappear which causes nothing can be seen from the cmd running. How can I see result from the shell?

[9:17:38](#AyM81wvJJrgpRtGkcHGMJ0QICpi-8lEIlgEHcBxsZms) <gurzgri>:
```
>> help call
...
REFINEMENTS:
    ...
     /console     => Runs command with I/O redirected to console (CLI console only at present).
```

So, `call/console "dir"` in CLI console. In the GUI console you can do `out: copy "" call/output "dir" out print out`.


[11:14:46](#uIAUQ_MHHtBX5f7y788qC80MgEwhukFhKLlTj5mwUKo) <lylgithub2021 (lylgithub2021)>:
@gurzgri  Many thanks!! And is there a way for a compiled self-made Red program(.exe) to call out the system shell console after running of the shell command so that the result can be seen from the console?

[11:24:26](#jlT6IdzKCL56eTcyGh1jVJBlTT1BAJi9KWp0HH8ky-o) <pekr (Petr Krenzelok) (@pekr:matrix.org)>:
Try help call, in console. It has some refinemenents. /Input or /Output could make it?

[11:32:18](#HSzq-hGLYVq5ewdQ1Wl0_OD2LF2ODNDHsLE1WqOKONs) <lylgithub2021 (lylgithub2021)>:
Thank you @pekr. gurzgri's suggestion solves the problem how to see the result of a shell command by /out. I'd like a method  in my program to call out the shell console and it stays there, not just flash disappear. 

[11:52:23](#7uBvR6AfLK5ZocFSVldmEcSMCKbXja9FR_YofZd7mEE) <hiiamboris>:
this has nothing to do with Red, you should call `cmd /k` for it to stay

[11:58:46](#TJQWIbXYlZ7sF-D-MrXmmOeAwbhtT9so42lnVwYLKsA) <lylgithub2021 (lylgithub2021)>:
I tried `call "cmd/k"` on Red GUI and Red CLI, seems not work.

[12:03:15](#-xaKlAZn8jg-_gGNSpOeMKrcmpIVzyLZu5R9HT3sbIk) <hiiamboris>:
yet another `call` bug must be

[12:03:48](#Zca1k_SU2rkOlWXWcYa2ix5wXugsyII-6OA5VIgYFVk) <hiiamboris>:
`call "start"` ?

[12:27:38](#Ekiofk_RNLtlihDcLj4r9uEsZxdjyuug_GzphBdTK3U) <lylgithub2021 (lylgithub2021)>:
`call "start cmd"` does call out the cosole. "this has nothing to do with Red". Does that mean Red is unable to run a shell command and see the result on a called-out console?

[12:34:31](#vQZONOVVKfBWGTECwptg-VYadZLSve7hp9mxgmDrmtU) <hiiamboris>:
means that whatever your program (`cmd`) is doing is unrelated to Red calling it

[12:34:50](#kvbhvc3IsNVAYUyfDmWaMq-eJLvVHEDU04vmXJm7orE) <hiiamboris>:
you should study the program itself and it's command line arguments

[12:34:58](#bB6N852R6rpStOAFmXEg_Do3JaS2In5k0w-Q_bh-gho) <hiiamboris>:
* you should study the program itself and its command line arguments

[13:38:45](#hKBqroLoxCg1dsIOO83GymvF7JBlci4uX_W_yEJzVVI) <gurzgri>:
I guess `call/shell/show/wait {cmd /K "dir"}` with GUI console really should do the trick as well as `call/console/show/wait {cmd /K "dir"}` does for CLI console. However, my default terminal application on Windows is Windows Terminal, not the old conhost.exe. At least with Windows Terminal I don't get it to work, the cmd shell opens (and can be closed by typing "exit"), yet whatever I'm trying I do not get to see the output of the `dir` command.

[13:39:26](#50_i5YLbw3526Fc2ZWcPboMOgJ1ujnLpB9LyVzm5HP0) <gurzgri>:
 * I guess `call/shell/show/wait {cmd /K "dir"}` with GUI console really should do the trick as well as `call/console/show/wait {cmd /K "dir"}` does for CLI console. However, my default terminal application on Windows is Windows Terminal, not the old conhost.exe. At least with Windows Terminal I don't get it to work (the other I didn't bother to try), the cmd shell opens (and can be closed by typing "exit"), yet whatever I'm trying I do not get to see the output of the `dir` command.

[13:49:46](#Ha6mXVbpEgx6vuBk_ycymDOhtryBgyDHuMc0l1W2zXw) <ldci (Fran√ßois Jouen)>:
Under GUI
```
;--from GregT
commands: [who ps df]

view [
    button "Run three commands" [
        foreach c commands [
            call/console form c
        ]
    ]
]
```


[13:52:54](#0yLqpuHMdf9IL9hPm_kFP6HpJ1qozusQzUIGuQbMs-Y) <lylgithub2021 (lylgithub2021)>:
![](https://gitter.ems.host/_matrix/media/v3/download/gitter.im/27547cdc8b5eb5c3543b7f3f633fb1ffb4e7da2c1801976171202609152)

[17:06:20](#q1R54gbCn4SVkGllpHcDYzliiyGhNB7OUCsevMFUhX8) <ldci (Fran√ßois Jouen)>:
May be a difference beween masOS and Windows: who and df commands not supported by Windows

## 16-Jun-2024

[22:00:22](#k2tLZAQEH5IdzR6yEyo4sQci6lm-LoIh2F0oDvuvwDI) <lazaruslong2048>:
thank you

## 17-Jun-2024

[18:46:21](#fZUnF06OacgEEpFvrRHT8A2Pt4VA5DBrlLmBWkpiXqk) <endo64>:
`call/console` is not yet implemented in GUI console (at least on Windows)

```
>> call/console "dir"
*** Internal Error: reserved for future use (or not yet implemented)
```

## 18-Jun-2024

[21:47:22](#yjNrBLmrUKPZzzBm0iN43ZECQ55nVLv26iHdOrFTqMQ) <greggirwin (Gregg Irwin)>:
If we don't have a ticket for that, we should. It's important.

## 28-Jun-2024

[14:56:07](#r6TEjxKVZZUQJjgaptdJVWmUfGqICkHNfYMsD5ezlj4) <‚Äé ‚Äé ‚Äé ‚Äé>:
hey guys any idea how can disable Escape key in red TUI?

[18:08:39](#7MWqLmORsLQ8Vf-hB9kSujyneAQ6EqRUBvdGsKWEiG4) <gurzgri>:
That‚Äòs 

```
#if config/GUI-engine = 'terminal [
	;-- ESC key handler
	insert-event-func 'esc function
```

in modules/view/view.red, you‚Äòll likely have to remove that event handler.

## 29-Jun-2024

[6:57:00](#3CNJ-GAddINKfc4yXH2HnvW1FBiBnJ_nWAlR28PQfFo) <qtxie>:
> <@ams0_0:matrix.org> hey guys any idea how can disable Escape key in red TUI?

Try `remove-event-func 'esc`.

## 2-Jul-2024

[13:41:34](#MriG5WzbzRobVPn9_uNG-Mm3tr2qEGbNUO5WF0SBfKk) <‚Äé ‚Äé ‚Äé ‚Äé>:
thanks qtxie   gurzgri 

## 31-Jul-2024

[16:05:11](#VwECZYdrOmELEf9mSc9gevsnj1G5-f4xPwo158tgoJA) <TimeSeriesLord (TimeSeriesLord)>:
when at the repl  

`>>? datatype!`

in the print list, this comes up

triple!

No info exists about it at the [github docs](https://github.com/red/docs/tree/master/en/datatypes)

Please do not mention tuple! as that is not what this is about.




[16:19:54](#4ZSEEvu1MT31WpT4QXpoas3l9OQ8_iYVfA_58rMXrm4) <hiiamboris>:
it's an internal kludge used by parse

[17:14:51](#NllstbQ2WwUUbqHTk12BOcTjz3OfKXw4RsH9FQGmuIw) <TimeSeriesLord (TimeSeriesLord)>:
> <@hiiamboris:tchncs.de> it's an internal kludge used by parse

thanks

## 1-Aug-2024

[16:47:49](#GHwjmom0NCTbb0PWrjsa5499BmbV-t2eQZqLrRwgr0w) <‚Äé ‚Äé ‚Äé ‚Äé>:
 Is Red support Telnet? Or there is a way to use it in red ?

[19:44:58](#xDnljBTF3tOo_uQ25FGSKgKoHo9r8Q0qL5SEuOOCzPE) <greggirwin (Gregg Irwin)>:
Not at this time.

## 2-Aug-2024

[9:12:05](#IqoEHeHoIIqJyLxzdrVYpICIb5WRSvcU8tdbohy9Vz0) <‚Äé ‚Äé ‚Äé ‚Äé>:
thx greggirwin (Gregg Irwin)

## 16-Aug-2024

[13:34:54](#UyfFfAGBNCH0ccxjluSe-VNedb_HWvVLSW_jxKh7A_Y) <Nuc1eoN (@nuc1eon_gitlab-5ecc6367d73408ce4fe4dfce:gitter.im)>:
Hi, it seems the roadmap is not quite up to date?

According to the roadmap 1.0beta was planned for 1023.

Is there expected a 1.0 release for 2024?

[13:35:18](#ZGMCL-iL4A4hVQVRJkHqprxCmp8MFlxBwdISQZH14Us) <Nuc1eoN (@nuc1eon_gitlab-5ecc6367d73408ce4fe4dfce:gitter.im)>:
 * Hi, it seems the roadmap is not quite up to date?

According to the roadmap 1.0beta was planned for 2023.

Is there expected a 1.0 release for 2024?

[13:35:51](#oGdHr9WHLomO3nnc8qjeOjbHMu-w1MDYeX-4zgLS2e0) <Nuc1eoN (@nuc1eon_gitlab-5ecc6367d73408ce4fe4dfce:gitter.im)>:
https://www.red-lang.org/p/roadmap_2.html?m=1

[13:39:14](#X40e9DRpM72y3NfrU51gqw9CLINmpVJTrGslbQrDV0Q) <hiiamboris>:
teaches you not to trust roadmaps :)

[19:42:59](#mc5AKtmY7zo2Q6igDZcSm5p6kpqqaI8bKKDpy3c17GE) <Nuc1eoN (@nuc1eon_gitlab-5ecc6367d73408ce4fe4dfce:gitter.im)>:
I guess I am asking for an update :)

## 17-Aug-2024

[18:18:11](#ixqpPAoZetBR1z8JFHvxHVA47BNwnhUXErxdLlkxylk) <greggirwin (Gregg Irwin)>:
There is a 0.6.6 release coming, but no changes to the roadmap at this point. The roadmap you linked to doesn't have dates anymore, as they are too hard to predict as things change.

[18:25:09](#vTEbqN799q_dPh92eRG0cyQsFjHZADJOiuonuhtsDN8) <pekr (Petr Krenzelok) (@pekr:matrix.org)>:
Thanks Gregg.Are we going to see the nodes/gc, or is that somethong else?

[18:40:05](#V42n9_yPoePr5XDEf5VbH2bnXsbEHJs6IOsOW8ZYVnc) <greggirwin (Gregg Irwin)>:
That is the planned GC release.

[20:34:02](#gIiPUpcg2EmVOG9VS_igYPpPI0dEYi-T8Qjfyb62QC0) <pekr (Petr Krenzelok) (@pekr:matrix.org)>:
 * Thanks Gregg.Are we going to see the nodes/gc, or is that something else?

## 18-Aug-2024

[16:19:15](#FTYACH1wV6pe1N3rXBQ6sQJixpgRVkHWjKl4Q77agmA) <‚Äé ‚Äé ‚Äé ‚Äé>:
hey guys how can unhide or enable a hidden or disabled
 button 

[16:19:25](#SRxxTEuOaRJMFnkBMeFZadseE6mLPFG6VG6uUr3a4yw) <‚Äé ‚Äé ‚Äé ‚Äé>:
 * hey guys how can unhide or enable a hidden or disabled button 

[17:03:14](#hBxP9n_AkR3zngz6kK12CD-oP9rdH1m4pOIn3-80xNQ) <hiiamboris>:
`face/enabled?: face/visible?: true`

[17:59:15](#j6bPssRi_G1GSnZ-b9rm6g6etLbnZ5AQk50CPVcgJJ0) <‚Äé ‚Äé ‚Äé ‚Äé>:
oh thx hiiamboris 

## 29-Aug-2024

[13:02:03](#lDFi9IvE98MA1YoHXebDqfAhqDhpGfMM2W909aHfbgo) <Nuc1eoN (@nuc1eon:matrix.org)>:
> <@greggirwin-55659ddb15522ed4b3e1006f:gitter.im> There is a 0.6.6 release coming, but no changes to the roadmap at this point. The roadmap you linked to doesn't have dates anymore, as they are too hard to predict as things change.

Actually it does have dates that's why I asked :) thanks for your reply

[13:02:19](#qMURAIJQFJK8lNG0aLn3j0kPYkI0aRdbE8JK8qWUveo) <Nuc1eoN (@nuc1eon:matrix.org)>:
"For reaching the 1.0-beta milestone, we target 12 months of intensive work, so that will bring us to Q3 2023..."

[13:06:12](#JFAEYKpVy5gPTv0VJ32pTBaqa7tjv-8sc0EGgb8rFrA) <Nuc1eoN (@nuc1eon:matrix.org)>:
So that makes it appear the roadmap was written in Q3 2022. Which makes it appear quite out of touch... (given that there is no 1.0 release)

[13:06:25](#MPlMHIx4Ma71v-RAwKdfnxh5jkRgkMwNtV2wJAjS6eg) <Nuc1eoN (@nuc1eon:matrix.org)>:
 * So that makes it appear the roadmap was written in Q3 2022. Which makes it appear quite out of touch... (given that there is no 1.0 release, as of now)

[13:06:57](#yE2JGKQLk_uZTJ_DreJDWXsE741vOj3rfS0zqn0_nA0) <Nuc1eoN (@nuc1eon:matrix.org)>:
The next sentence "The currently planned beta period for 1.0 is 2-3 months." is not a date but also pretty specific.

[13:07:53](#bYOrYOXEoeYGbNmmnOJKmXHSTglDhqUwfMBhuom_2cY) <Nuc1eoN (@nuc1eon:matrix.org)>:
 * So that makes it appear the roadmap was written in Q3 2022. Which makes it... appear quite out of touch... (given that there is no 1.0 release, as of now)

[13:12:06](#vaJUmVYGPh8AekXULTgE-DfkefAeL0Nmn2ACgV32ZDk) <Nuc1eoN (@nuc1eon:matrix.org)>:
So after 0.66, the work on 0.7 (from the roadmap) will commence or will there be a 0.67 afterwards?

[13:12:22](#aRPL4YxUekUxqRQAzg2kGC_uPJQ3wacBngrXHsVVjrA) <Nuc1eoN (@nuc1eon:matrix.org)>:
 * So after 0.6.6, the work on 0.7 (from the roadmap) will commence or will there be a 0.67 afterwards?

[13:12:53](#DroJ0tEhkdlF7x5pEXunuJaCbR9CxuPn9pzWll4bqtU) <Nuc1eoN (@nuc1eon:matrix.org)>:
 * So after 0.6.6, the work on 0.7 (from the roadmap) will commence or will there be a 0.6.7 afterwards?

[13:13:42](#PPKjxTPxFL8OKhfX4Q-XbZBW-ueLEGk8FAhL85x2YPw) <Nuc1eoN (@nuc1eon:matrix.org)>:
 * So that makes it appear the roadmap was written in Q3 2022. Which makes it... appear quite out of touch... (given that there is no 0.7.0 release, as of now)

[13:13:57](#Hk0XLDjDEHzaLNrfLKadstD3iThKr_MrsgMcKw6Cqdg) <Nuc1eoN (@nuc1eon:matrix.org)>:
 * So that makes it appear the roadmap was written in Q3 2022. Which makes it... appear quite out of touch... (given that there is no 0.7 release, as of now)

[13:15:06](#9bVrGhxsjXl8qHBfOyBf04JtlJxs2PEogtgdqGcAlws) <Nuc1eoN (@nuc1eon:matrix.org)>:
> <@greggirwin-55659ddb15522ed4b3e1006f:gitter.im> There is a 0.6.6 release coming, but no changes to the roadmap at this point. The roadmap you linked to doesn't have dates anymore, as they are too hard to predict as things change.

 * Actually it does have dates that's why I asked!:) thanks for your reply

[13:15:11](#3yAYlyMZP_fLD-5xg5V3ZlJRKFZJFi2qZR8Zk7lBvg4) <Nuc1eoN (@nuc1eon:matrix.org)>:
 * Actually it does have dates that's why I asked! :) thanks for your reply

## 31-Aug-2024

[15:30:09](#zzMBetuihs_Bp6obkU5LzTrw0CQT5YkQHaheB2riX90) <‚Äé ‚Äé ‚Äé ‚Äé>:
hey guys I need help I used this command `system/view/screens/1/size * system/view/metrics/dpi / 96 + 3 and complement 3` in **red console** and its worked but after use it in **editor(vs code)** and try to run it gives me this error  (try to find monitor resolution size)

> \*\*\* Script Error: \* does not allow none! for its value2 argument
> \*\*\* Where: \*
> \*\*\* Near : print system/view/screens/1/size \* system
> \*\*\* Stack:

[15:36:20](#S2XG--I7_FW_2SRdzhoHQjKUNwfy8phZi7bm9_7xTpE) <hiiamboris>:
you included the `View` module?

[15:37:35](#v_n4Ci_LopLyNu2dj240fUBuTA4URfnZDRXP2KQunMw) <hiiamboris>:
also `dpi` is `none` on Linux: https://github.com/red/red/issues/4740

[15:55:29](#uHz1ScXvIoXlrmbrX5xSjEpwcdUvauiBAQVy9qpL4pI) <‚Äé ‚Äé ‚Äé ‚Äé>:
hiiamboris:  I don't think so, how can include it? 

[15:58:34](#yNRUtPYoqZesLqEBSQBu-lxfpFMy5sKNeNUylqXPf4c) <hiiamboris>:
put `modules: view` line into the file header

[16:01:24](#cFtpVlG_OaLNbTtGr42f5eM7OBSClGePIAdqLyMo3O4) <hiiamboris>:
* put `needs: view` line into the file header

[16:02:32](#zAWf6ho5JeEiEvFc_JRkvtSInqBn7CfB5wElrQTBWi8) <hiiamboris>:
http://redprogramming.com/Getting%20Started.html#section-3.8

[16:02:44](#rCXw4Uh2ZWSc6h6OHnFwZBCNIMmlszWGs9Wh4EyOgkA) <hiiamboris>:
http://redprogramming.com/Short%20Red%20Code%20Examples.html

[16:03:39](#Xnek2yiqLMxwc2Pz2dLw6hWV1VXOZxAra0W6iXjINw0) <hiiamboris>:
https://github.com/red/docs/blob/master/en/view.adoc#including-view-component

[16:04:34](#b-VQS549_YNptRLdpDOO-euZEN6W7V7HOscllbv9Gl4) <hiiamboris>:
https://www.red-by-example.org/vid.html#4

[16:04:44](#mYu7KFPVRPQaxvp_OhUHZdzGc6e-2Qc87ye_ehRopLw) <hiiamboris>:
seems all notable sources have that :)

[16:32:27](#3xBnToizQqhWtiLEF7wXwn2WqQ-VPwL_2zj2jLMKqG4) <‚Äé ‚Äé ‚Äé ‚Äé>:
hiiamboris: But it's a cli app. I don't think it is to make a change
And do you have a solution to find the size of the screen resolution in red (Windows) (cli)?

[16:34:26](#S_PmpEFBlJINQFA2OaZLAwFwXGwJ9e071-10RTvCg8s) <hiiamboris>:
CLI (MSDOS target) or not (Windows target) affects only the presence of the terminal window when your app is started, and has nothing to do with View module being included or not

[17:17:36](#fM4JZLy9a5q_-BmZc48zcWH3eepfW_r3D3mdYtShwPA) <‚Äé ‚Äé ‚Äé ‚Äé>:
thx hiiamboris 

[18:50:04](#klgQFVEQx2oMWzce_Z30OJ5Trhp-32hBlPCjTtQ_Xjw) <‚Äé ‚Äé ‚Äé ‚Äé>:
hiiamboris:  new error  
> *** Compilation Error: undefined symbol: ~b||616
> *** in function: exec/f_game-server
> *** at line: 1
> *** near: [~b||616
>     stack/mark-native ~copy
>     word/get ~server-games
>     actions/copy* -1 -1
> ]



[19:01:51](#2JO5RMGJFP4I6IAAjjD718cjZW-gA0USHbstM_nEoOQ) <hiiamboris>:
well, try encapping (`-e`)

[21:12:56](#2f9pXFKTzZxigGjE89GN0ACxaw33KHPj7jxdHaMdkQY) <‚Äé ‚Äé ‚Äé ‚Äé>:
hiiamboris:  thx 

## 2-Sep-2024

[9:48:55](#7_rWx4hI66U46k28ZA6F4_HK6ib-dUTPCy55MfD3ztM) <‚Äé ‚Äé ‚Äé ‚Äé>:
hey guys how can make lib in red ( not red system )?

[12:25:03](#hUI6FPZq3_bUkz4K6AqoeQN8KH_Yhdl39KcZyM7wKak) <hiiamboris>:
using `#system []` directive you can write R/S code in a Red script

## 3-Sep-2024

[13:33:30](#upzASNrFsVSuAv_pzhjj2Q_Ds0kd1eMvhEo9Qj2hj3I) <‚Äé ‚Äé ‚Äé ‚Äé>:
hiiamboris:  oh thx

[15:04:09](#wg1vSiD5Te939z3a3WWJbZNwB8muDUXXGVCYwoBdqCA) <‚Äé ‚Äé ‚Äé ‚Äé>:
hiiamboris: is possible to write Red code in R/S?

[15:10:57](#7TU5xD5foAMxAUk5OXlDByz57pCxx6aqthLt2VyL8EE) <‚Äé ‚Äé ‚Äé ‚Äé>:
 * hiiamboris: is possible to write Red code in R/S?
can I use global variable between red and red system ?
for exp: 
```
Red []
#system [a: "xxx"] 
print a
```

[15:41:41](#9kYfLMRF2ZAImtKgA2Xlz6cdCdwVpM7BilD5weiTztc) <hiiamboris>:
> is possible to write Red code in R/S?

https://static.red-lang.org/red-system-specs.html#section-16.8

[15:42:26](#hVDp-EUPCINSbhAlRia0PrfvV1tMwsoip5FZ9i9OWfk) <hiiamboris>:
> can I use global variable between red and red system ?

Red and R/S have completely different datatypes, so no. You usually need a `routine` to interface between Red and R/S

[15:43:30](#o79I8do_cgjlbYlcqC4nwo8nMU8VcPzg0zmkAfiMe0M) <hiiamboris>:
* > can I use global variable between red and red system ?

Red and R/S have completely different datatypes, so no. You usually need a `routine` to interface between Red and R/S. Also `#system-global` directive, which is only different from `#system` in that latter puts all declarations into `red/` context, while former - into global namespace

[15:44:01](#U4hcb6DcW59Yue5N25Bs3bOwHxg2Sm19OtRRE-65pnQ) <hiiamboris>:
* > can I use global variable between red and red system ?

Red and R/S have completely different datatypes, so no. You usually need a `routine` to interface between Red and R/S. 
Also you may need `#system-global` directive, which is only different from `#system` in that latter puts all declarations into `red/` context, while former - into global namespace

[19:36:23](#OeCF5k5rclyUyRdH5l4rAVG-z9UuLCHyS3PHMmGVQFY) <ldci (Fran√ßois Jouen)>:
Have a look here: https://github.com/ldci/Red-System

## 4-Sep-2024

[17:48:07](#pMZlo4ZkikMwdnEHgGkpMmrSuFQ9n6H83i6d2QiPoac) <‚Äé ‚Äé ‚Äé ‚Äé>:
 I compile this exp code to the lib (.dll)

    
```
Red/System [
        File: %testlib.reds
    ]

    inc: func [n [integer!] return: [integer!]][n + 1] 

    #export [inc]
```
so how can load this library from Red ?


[17:51:17](#OpI6s0pb6E8ewlNWpXG0rzbCzjadexVqdCQq2jKZ238) <hiiamboris>:
you should consult the manual https://static.red-lang.org/red-system-specs.html

[17:51:26](#Ww_KwjSaZZ849UEnmiqumlPIBRlOvitHP-tyYNLpXeU) <hiiamboris>:
* you should consult the reference https://static.red-lang.org/red-system-specs.html

[19:23:57](#t0x4zBs1HxUiq4AYCmNtPb2d1SyVEvIb5oEb7fKIG9o) <ldci (Fran√ßois Jouen)>:
See also https://github.com/ldci/Red-System/blob/main/doc/Programming_with_Red%3ASystem.pdf

[21:05:55](#aslBHocxTEikmh3oBdLTPQxL2wv8R6KIuv9u_l3tq5Q) <‚Äé ‚Äé ‚Äé ‚Äé>:
ok thx hiiamboris  & ldci (Fran√ßois Jouen) 

## 11-Sep-2024

[12:20:12](#DsRPGrXmQAm7RYu-P50vfgzEJK9PaXFHUsxUzRAZSTY) <lylgithub2021 (lylgithub2021)>:
Why does the face `area` not display anything after clicking the button when running the following codes:
```
view [a: area "" button[call/output "dir" a/text]]
```

[12:56:25](#chH7XbonnZ2i_XSqO_UtkGkJNvriHWMUrBnSKcHR0tw) <hiiamboris>:
because `call` doesn't signal to the ownership system that it changed the contents

[12:56:40](#Jsj3mRNp5t-Z-ipzO03yVEWtBfjUDnvBOj6FXFa7704) <hiiamboris>:
¬Ø\\\_(„ÉÑ)\_/¬Ø you can work around that by adding `a/text: a/text`

[12:57:24](#0Ri7bqVp4QkUt7Cw3tiknfIqnG0Fn1R6IvuRVVRJpdQ) <hiiamboris>:
dockimbel do we want all natives to be supported by the reactivity?

## 13-Sep-2024

[6:51:05](#mi-b9JtxBLl9iDR-b2ngJw9XamkAZYCbGZK-hTQ7Dac) <lylgithub2021 (lylgithub2021)>:
hiiamboris: Many thanks

[6:52:45](#93bGcVyRg3L4pTNpO18zaQbvrBzI5FoAB0tHxQHlhBk) <lylgithub2021 (lylgithub2021)>:
hiiamboris: Many thanks

[7:00:47](#5nlhVEBFscOkJ08r1L3BdAidnCynl2rEEKCFwrmHTEU) <lylgithub2021 (lylgithub2021)>:
I'm puzzled by the following codes which make my "Red GUI Console" crashed:
```
>> a: ""
== ""
>> call/output "f:\b.bat" a
```
The content of the file "f:\b.bat" is just `dir`.
What causes this?

[7:35:30](#GGxErgTgs8OIlcBr-qUJZQCEbbexm_AfXfWGBeA2B2Q) <hiiamboris>:
we'll need a way to reproduce that locally to confirm

[7:35:46](#z8hOPGPjpJHM8Fr45oeyqd7j9wnTymMrFHrCwqN3EZE) <hiiamboris>:
for me I do not get a crash

[7:40:22](#W3dWLZx0JqQBCyCyjZpb92fMboTT_-Cd_Azzkvo-IDE) <lylgithub2021 (lylgithub2021)>:
I do it with Win10 and Red Build 0.6.5 - 14-Jun-2024/11:42:26+08.00. 

[7:43:34](#QChAuS07YREZeYKYCx4hPjjI8QOgcHvwThwuDvY6Tzk) <hiiamboris>:
try updating Red

[7:43:48](#Wa32enbIrVN2iBYaiMTTEHQkqG2UmSOVImg3tkghJK0) <hiiamboris>:
also what's the `dir` output?

[7:45:39](#Qj1nhLhPEOHP06caiS44fDQJtSbJqT7HbEkn1fOTUeE) <lylgithub2021 (lylgithub2021)>:
Yes, I want the output of `dir`stored by the the variable `a`

[7:46:33](#ZqqmMtYaPyGLbUo1MKxua6PAZZAS40aWxKLhKHx_GE0) <lylgithub2021 (lylgithub2021)>:
 * Yes, I want the output of `dir`(current path) stored by the the variable `a`

[8:04:57](#yl4oVncaasoyJ2HCaIskoZedFdma0cdMQ4r5UWFaA8E) <hiiamboris>:
yes, but I'm asking what it writes in return

[8:05:19](#2fZBsEjoTkLelC6tqIWcDSISMy0lLdtPww1Hksfnb3M) <hiiamboris>:
maybe it's chinese glyphs that crash it

## 15-Sep-2024

[1:44:35](#p8JpJS4XhRJZXCnx8yMjG9T8UT-Rbo0uPgeSgYknuAQ) <lylgithub2021 (lylgithub2021)>:
maybe it's chinese glyphs that crash it

[1:45:14](#qWQualgG0_g5icrAmJOLmmknF3Op3-wwNHkQ_OkM3f4) <lylgithub2021 (lylgithub2021)>:
 * Thank you hiiamboris: yes, the output of dir contains some chinese glyphs, but delete of these files/folders does not help. Following your instruction of updating `Red`, the problem of "Red GUI Console crash" is solved. But still:

```
>> aa: "" call/output "f:\b.bat" aa
== -1
>> aa
== ""
```

Seems that `call` does not work. What's wrong with my use of `call`?

[2:00:18](#Lu0BWsvSsc86nAvVWdJgUur3Iz2_2T_502l7USYdRsw) <lylgithub2021 (lylgithub2021)>:
Thank you hiiamboris:  yes, the output of dir contains some chinese glyphs, but delete of these files/folders whos name contains chinese glyphs does not help. Following your instruction of updating Red, the problem of "Red GUI Console crash" is solved. But still:
```
>> aa: "" call/output "d:\a.bat" aa
*** Access Error: invalid UTF-8 encoding: #{C7FDB6AF}
*** Where: call
*** Near : call/output %"d:\a.bat" aa
*** Stack:  
```
I'm sure the file "f:\a.bat" is saved as `UTF-8` fomart. 
What shall I do to make the codes work?

[2:00:40](#PntrKePnrfKfKDFPYcroMA7uXMcrBIeB278FRufvokk) <lylgithub2021 (lylgithub2021)>:
 * Thank you hiiamboris:  yes, the output of dir contains some chinese glyphs, andt delete of these files/folders whos name contains chinese glyphs does not help. Following your instruction of updating Red, the problem of "Red GUI Console crash" is solved. But still:

```
>> aa: "" call/output "d:\a.bat" aa
*** Access Error: invalid UTF-8 encoding: #{C7FDB6AF}
*** Where: call
*** Near : call/output %"d:\a.bat" aa
*** Stack:  
```

I'm sure the file "f:\\a.bat" is saved as `UTF-8` fomart.
What shall I do to make the codes work?

[2:00:55](#tU5PvjjVEHbJwrNEtJj1UY47bRmE00hUACGJqSECZ3k) <lylgithub2021 (lylgithub2021)>:
 * Thank you hiiamboris:  yes, the output of dir contains some chinese glyphs, andt delete of these files/folders whose name contains chinese glyphs does not help. Following your instruction of updating Red, the problem of "Red GUI Console crash" is solved. But still:

```
>> aa: "" call/output "d:\a.bat" aa
*** Access Error: invalid UTF-8 encoding: #{C7FDB6AF}
*** Where: call
*** Near : call/output %"d:\a.bat" aa
*** Stack:  
```

I'm sure the file "f:\\a.bat" is saved as `UTF-8` fomart.
What shall I do to make the codes work?

[2:01:48](#dwbzaEY3Ru9zkw3nG5CS3-lPe2XcUCqAnDfOh0lzKno) <lylgithub2021 (lylgithub2021)>:
 * Thank you hiiamboris:  yes, the output of dir contains some chinese glyphs, andt delete of these files/folders whose name contains chinese glyphs does not help. Following your instruction of updating Red, the problem of "Red GUI Console crash" is solved. But still:

```
>> aa: "" call/output "f:\a.bat" aa
*** Access Error: invalid UTF-8 encoding: #{C7FDB6AF}
*** Where: call
*** Near : call/output %"f:\a.bat" aa
*** Stack:  
```

I'm sure the file "f:\\a.bat" is saved as `UTF-8` fomart.
What shall I do to make the codes work?

[2:39:58](#rrEg2nxwL8uNwDmK3MnZQKYFOdnXPYUtB29Baiw1uFI) <lylgithub2021 (lylgithub2021)>:
 * Thank you hiiamboris:  yes, the output of dir contains some chinese glyphs, andt delete of these files/folders whose name contains chinese glyphs does not help. Following your instruction of updating Red, the problem of "Red GUI Console crash" is solved. But still:

```
>> aa: "" call/output "f:\a.bat" aa
*** Access Error: invalid UTF-8 encoding: #{C7FDB6AF}
*** Where: call
*** Near : call/output "f:\a.bat" aa
*** Stack:  
```

I'm sure the file "f:\\a.bat" is saved as `UTF-8` fomart.
What shall I do to make the codes work?

[3:03:15](#9H-r9feIrKyFUwkgbHr9laucYGujOR32nwVuj-SRIVw) <hiiamboris>:
it's the output of `dir` that's not in the UTF-8 format

[3:06:30](#Q9M---5U3FKzpPW-HTYbq3k9O9hIFOngBuJWz5NXoCk) <hiiamboris>:
you'll have to convert your local codepage manually or using R/S calls or using an external program like `iconv`, as Red doesn't provide that facility

## 5-Oct-2024

[1:26:30](#cDSI6qeear7NASbdmp7ddtfLck8Dem4X4yEyOBQBHIQ) <lylgithub2021 (lylgithub2021)>:
I have many dependent files in the folder `./support` of my project. I want them to be included in my main program, I mean, include them during compile-time. Does that mean the only way to do this is to repeat `#include...`  time and time again on the top of main program? Or are there better ways to include all of them by simple code?

[2:12:46](#heQxT6m9xbs2NkqHyw3lcYCp9mMVR3_D1AGJW5Vs_0M) <ldci (Fran√ßois Jouen)>:
lylgithub2021 (lylgithub2021): From Red documentation (https://static.red-lang.org/red-system-specs.html#section-16.3)

The #include compiler directive will insert the target source file at the current position in the calling source code.
This directive helps split the source code in several files, allowing for example, to put common functions or definitions in a single place and including them where required, across several source files or across different projects.
This is the way adopted for redCV for modular and simple compilation (https://github.com/ldci/redCV)

example: 
```
;required libs
#include %../../libs/core/rcvCore.red
#include %../../libs/matrix/rcvMatrix.red
#include %../../libs/imgproc/rcvFreeman.red
#include %../../libs/timeseries/rcvDTW.red
```

[8:41:21](#s3v6ATMQQZotpoy7UG4U3whwnfz6G_yhjRjVW8Sq3aI) <hiiamboris>:
you can simply create a separate file with `#include`s and include it from the main program

[8:42:01](#JZaFCu2CS3RQjzTsHrCkOq7L6VZZwNQU4ae9Dx8Vsls) <hiiamboris>:
if you don't hit one of the `#include` bugs :)

## 6-Oct-2024

[5:53:42](#SmvvGPUNQfPwe4lrEjo558Nm1icDwOzdWJul_BHXxWA) <lylgithub2021 (lylgithub2021)>:
ldci (Fran√ßois Jouen): hiiamboris Thank you so much!

## 9-Oct-2024

[10:27:42](#eyvyFQPoRO4FBUyONaAzTIzd7qIiltqRaO-HdrOMzuY) <ldci (Fran√ßois Jouen)>:
Using Z-score with Red and Rebol: http://redlcv.blogspot.com/2024/10/using-z-score-with-red-or-rebol-3.html

[10:50:52](#XmhFhK8utczKLCxPC1MvWXdaecw5ytNEYDkcI9buX_4) <gurzgri>:
> <@ldci-5673ead416b6c7089cbf2ba5:gitter.im> Using Z-score with Red and Rebol: http://redlcv.blogspot.com/2024/10/using-z-score-with-red-or-rebol-3.html

Very nice writeup! Minor sidenote: with `sLenght` you have a - very consistent - typo in your `zThreshold` function.

[10:51:10](#VfzMzQPEz-SyrbTJQ6O1U0DD2AW_w8fX7XGMTCmUjJ0) <gurzgri>:
> <@ldci-5673ead416b6c7089cbf2ba5:gitter.im> Using Z-score with Red and Rebol: http://redlcv.blogspot.com/2024/10/using-z-score-with-red-or-rebol-3.html

 * Very nice writeup! Minor sidenote: with sLenght you have a - very consistent - typo there in your zThreshold function.

[12:26:20](#Jc3eYyj47eknxL6BB8IlVfbCspL-7KNts-23IkOfJn4) <ldci (Fran√ßois Jouen)>:
gurzgri: Oups. I must be dyslexic :)

[12:34:41](#ipOHAENKJI02Bl9ttjilGzaY-gNwJ-ObKS7Z25HmnzA) <ldci (Fran√ßois Jouen)>:
gurzgri: Oups. I must be dyslexic :)

[12:35:46](#VIeqG7RZWrUR6JQoPIk0FgvzqiKmPqCjcAV7Lybt61o) <ldci (Fran√ßois Jouen)>:
gurzgri: Code corrected. Thanks a lot :)

[12:44:52](#GPdikdUyVlaaWnmWiufnXfwp6BVUwOJte-G2IzpgvlE) <ldci (Fran√ßois Jouen)>:
![](https://gitter.ems.host/_matrix/media/v3/download/gitter.im/e900a86e702901587c037dcf1c968c76c434d46b1843996049216110592)

[17:05:12](#E83g_PAw1fvqymBFM3vOPzohOj_xWu8uEq8pbxckgXc) <ldci (Fran√ßois Jouen)>:
A better image: 

[17:09:37](#9CHggSJc0tTV16hXAOZFngRLG9AfTh-l_FQdu4Q4hlU) <greggirwin (Gregg Irwin)>:
Thanks ldci (Fran√ßois Jouen) . Good stuff.

[17:56:09](#vWey0UHIVSIVOfIPeyndOAVluVFkAsi65kFSYgaq0Sc) <ldci (Fran√ßois Jouen)>:
greggirwin (Gregg Irwin): Red and Rebol are fantastic languages with which you can do a lot of things.  It's essential that the Red site reflects this variety of approaches to solving everyday problems.

[19:45:10](#qxCgxB5z51UK8WV4mHV16wfhBwGW6ddwd6s9_E7NMek) <greggirwin (Gregg Irwin)>:
Agreed.

## 24-Nov-2024

[21:21:52](#OAqe-z1i7h-5UDi8g22LWlmK_5scL6AgDynHbXHYv5o) <ldci (Fran√ßois Jouen)>:
Agreed.

## 9-Jan-2025

[6:41:09](#nAUBsTJOaG4SCsalQ_SW4nw2HISxo9ZOH33EIA6X1r0) <lylgithub2021 (lylgithub2021)>:
Sometimes I want to see the content of a function. But I just get `?function?`. What exactly does it mean?

[6:43:08](#v7Pn_NKMYxFGbE02pWG-JrVtKuY3TkuisE5VJEIFkDo) <hiiamboris>:
You can use `??` or `source` to inspect functions by name, or `probe` to inspect function values. `?function?` is a result of `form`-ing a function.

[6:44:35](#EwYi0qchXrVxnNU25mNsbJ1e7lo0WL0m95O_P7H6YxI) <hiiamboris>:
`form` was meant to produce short messages for the end-user, so it doesn't handle values that are of interest only to developers

[6:55:25](#cvPYlC8k2txkKY1KG5iBwu_nQob1AQJVl792nbJc9qk) <lylgithub2021 (lylgithub2021)>:
I make up some functions in a string, like `funcstr: "f1: function[a b][a + b] f2: ..."`. Then by `do funcstr` to make this functions available. Then I want to know the number of auguments of `f1` by `spec-of get first [f1 f2]`. I receive a wrong result and `get first [f1 f2]` outputs `?function?` I don't know why.

[6:59:12](#fO2uTHk9c6vBDQohp8h8CsH_4gWEMDgTObiygMB7TgM) <hiiamboris>:
`get` doesn't "output" anything, it just returns a value of type `function!` in this case

[7:00:08](#oOXqnGh8NoEsmah1WSwr8EVMUYX_yRwvdjx9ZdRZiv4) <hiiamboris>:
You can use `preprocessor/func-arity?` for that purpose.

[7:06:34](#2f-kp4g8gf7CUTmINmmpEQPsJsaV4OQu3BSOeUPLRT8) <lylgithub2021 (lylgithub2021)>:
You can use `preprocessor/func-arity?` for that purpose.

[7:07:44](#OA5HwJWigQ5r_lySRh4P40ZaLhKwf2YKwaig9OifZ0k) <lylgithub2021 (lylgithub2021)>:
` ?preprocessor/func-arity?` does not give much useful info. Where can I find more details and how to use it?

[7:08:35](#_03x_91Nk9myAdE46C16wnkfZDtLKJpSiONK-rw__og) <hiiamboris>:
Play with it

[7:08:38](#x2upEyRF0dpqUmqauJSiwfV4kCMA5psm91-SnoyTqLc) <hiiamboris>:
```
>> preprocessor/func-arity? spec-of function [a b /c] [x: a + b]
== 2
```

[7:18:24](#qngWfPrBNjBZKbNA4jWbuwc_kYVgU-SVFdAp8OLhLAI) <lylgithub2021 (lylgithub2021)>:
To get `function [a b ] [a + b]`, I have to use `get` to get the function form of `f1` from `[f1 f2]`, but I was stuck lylgithub2021 (lylgithub2021) in this 'get`. In my program, It just feedback `?function?`. My problem does not come from `spec-of`, but from `get`. Why does `get` sometimes fails to give the function form from a function name (here is the  word! f1)?

[7:20:09](#xAAAijwpdcOrz2pZpoGsqNXyC8R6aUzwmYKnajO7AqY) <hiiamboris>:
Give me an example of this failure, and we'll look into it ;)

[7:28:40](#gGEbsC0x4UjlrBz75sEnRFdcgaIacIkOT_nXI40EgBs) <lylgithub2021 (lylgithub2021)>:
And why `length? spec-of ...` is not recommended? to get the number of function arity?

[7:32:25](#Yl9hkio06WU0Bu5gPKUBXKSwQwW34EZkfK8nfK8x3Y0) <lylgithub2021 (lylgithub2021)>:
* And why `length? spec-of ...` is not recommended to get the number of function arity?

[7:37:48](#kSmSvVXuDUBt_ZznhCbSKf5JHl_hRkFURAB3bUCwWyY) <hiiamboris>:
```
>> length? spec-of f: function [/a b /c d] [all [a c x: y: b + d]]
== 7
>> f    ;) zero arity call
== none
```

[7:38:47](#goT5jyJxZv3qWrMxX7kJR3ASJXEoLbgMkXAaK02U6Yg) <hiiamboris>:
* ```
>> length? spec-of f: function ["my func" /a b /c d] [all [a c x: y: b + d]]
== 8
>> f    ;) zero arity call
== none
```

[7:42:18](#e9-wsZAhBBDDpIt8wTGPHgYqY1LY9RziHa54ru6E-9k) <lylgithub2021 (lylgithub2021)>:
Thank ypu so much for these wonderful info about how to get the arity number of a function!!!

[7:43:38](#O3ewEIJDYaknIRKA_lUwqMDAD_X_Ndx81af4B4B78yE) <hiiamboris>:
You're welcome

[7:43:50](#UK-WwOrwrzYKYOP9aiQShp_sNQQ8eOF63JvoxRUfAcw) <lylgithub2021 (lylgithub2021)>:
* Thank you so much for these wonderful info about how to get the arity number of a function!!!

[7:45:07](#BLsWGqID9a_c9A1aJcU4rua4fu_7_743-DEqF_CXTIM) <lylgithub2021 (lylgithub2021)>:
Why is the numer 8 not 5("my func" /a b /c d)

[7:45:40](#JGc7CFKDDs38Z01J2hxtvi8nhOHr0I4y-nwWc1tVolE) <lylgithub2021 (lylgithub2021)>:
* Why is the numer 8 not 5("my func" /a b /c d) by `length`?

[7:47:01](#XsPsJDJAsiE26I3EDK8cW8GCnknQlZDYQRRa2MUIK8A) <lylgithub2021 (lylgithub2021)>:
* Why is the numer 8 not 5("my func" /a b /c d) by `length?`?

[7:53:49](#zEgmC7s1n33A49P8UTGFGUFaem0GAxmJG5iGjTxASOI) <hiiamboris>:
Add a `probe` before `spec-of` to see for yourself

## 14-Jan-2025

[5:58:54](#MCtRytWkfQT7EDqcciXGe8FwZw6nBt8PV_F98V78e9M) <lylgithub2021 (lylgithub2021)>:
I make up a function to print something diffrent when mouse move on/off a certain facet. Something is wrong with my code that puzzles me. Where is it?
`Red[needs: view]
f: function[text-on text-off][
  either event/away? [print text-off][print text-on]
]
view[
  t1: text "T1" on-over[f "mouse on t1" "mouse off t1"]
  t2: text "T2" on-over[f "mouse on t2" "mouse off t2"]
]`

[5:59:36](#9VskJHseG0-IhyOh43XNxjH4L6dZwVCFP0QV-k40HTU) <lylgithub2021 (lylgithub2021)>:
* I make up a function to print something diffrent when mouse move on/off a certain facet. Something is wrong with my code that puzzles me. Where is it?
`
Red[needs: view] 
f: function[text-on text-off][ either event/away? [print text-off][print text-on] ] 
view[ t1: text "T1" on-over[f "mouse on t1" "mouse off t1"] t2: text "T2" on-over[f "mouse on t2" "mouse off t2"] ]`

[6:00:06](#9gBFJ4vX4pj2Kn0YTaygskYwjM9Alft002uxBq5wnxk) <lylgithub2021 (lylgithub2021)>:
* I make up a function to print something diffrent when mouse move on/off a certain facet. Something is wrong with my code that puzzles me. Where is it?
` 
Red[needs: view]  f: function[text-on text-off][ either event/away? [print text-off][print text-on] ]  view[ t1: text "T1" on-over[f "mouse on t1" "mouse off t1"] t2: text "T2" on-over[f "mouse on t2" "mouse off t2"] ]
`

[6:00:19](#hMC2P5Gk1dDg6AHWBEdbIFO8ufuKPsj1Zt2fjrGqVXo) <lylgithub2021 (lylgithub2021)>:
* I make up a function to print something diffrent when mouse moves on/off a certain facet. Something is wrong with my code that puzzles me. Where is it?
` Red[needs: view]  f: function[text-on text-off][ either event/away? [print text-off][print text-on] ]  view[ t1: text "T1" on-over[f "mouse on t1" "mouse off t1"] t2: text "T2" on-over[f "mouse on t2" "mouse off t2"] ]`

[6:41:46](#B8oSAUm3cp7NfHWkGG7Z1qi5dlk-igjNuSJETaDL5D0) <gurzgri>:
The error message `*** Script Error: event is unset in path event/away?` tells exactly what's the problem. You're function `f` is declared in the global context, in the global context `event` has no value. You'll need to supply `event` as an argument to your `f` function because √®vent` is only bound to the `on-over` actors.

[6:42:24](#SY-ci6rT34bA3hjZW6wdwdB7jwB3uVQ5ATNQ7a1NBRk) <gurzgri>:
* The error message `*** Script Error: event is unset in path event/away?` tells exactly what's the problem. You're function `f` is declared in the global context, in the global context `event` has no value. You'll need to supply `event` as an argument to your `f` function because `event` is only bound to the `on-over` actors.

[7:49:51](#sZJRfd9bWtMzDyjx91o7igg9ztsPGUdzLCzD23RzEEs) <lylgithub2021 (lylgithub2021)>:
Thank you @gurzgri so much!

## 17-Jan-2025

[1:34:13](#PXF5jBmcGryL9-YwjQNaw3DMcC5RQPLqX3Cq0I-BqFM) <lylgithub2021 (lylgithub2021)>:
There are two files in the sub-folder `depends` of my program - 0.red and 1.red. In the main program file, `#include %./depends/0.red  #include %./depends/1.red. When I compile the main program file by `red -r -e -t 

[1:37:53](#9xsTBECXfqFpE0uBLtuuYJPyTx7VwrT_tLJAikB_Oe8) <lylgithub2021 (lylgithub2021)>:
* There are two files in the sub-folder `depends` of my program - 0.red and 1.red. In the main program file(main.red), `#include %./depends/0.red  #include %./depends/1.red`. When I compile the main program file by `red -r -e -t Window main.red`, the following error message is given `*** Compilation Error: include file not found: ./depends/1.red`. Why?

[1:43:43](#nzHYgAei9q3ewsbzfSuIiCs-He9aV1d2PLGTXSMXDPo) <lylgithub2021 (lylgithub2021)>:
* There are two files in the sub-folder `depends` of my program - 0.red and 1.red which are introduced by the main program file(main.red), `#include %./depends/0.red  #include %./depends/1.red`. When I compile the main program file by `red -r -e -t Window main.red`, the following error message is given `*** Compilation Error: include file not found: ./depends/1.red`. Why?

[1:45:05](#WNTw2VxHReSd4rjJuAPxH9l6S9hGRxI_8rOlPsOwdtg) <lylgithub2021 (lylgithub2021)>:
* There are two files in the sub-folder `depends` of my program - 0.red and 1.red which are introduced by the main program file(main.red), `#include %./depends/0.red  #include %./depends/1.red`. When I compile the main program file by `red -r -e -t Windows main.red`, the following error message is given `*** Compilation Error: include file not found: ./depends/1.red`. Why?

[15:27:40](#k_XWlzQtC51fprpHu3ZWzmWRV7Uax7lsoAidyXOVzFk) <hiiamboris>:
because of the numerous [bugs in `#include`](https://github.com/red/red/issues?q=is%3Aissue%20is%3Aopen%20include%20file%20found%20)

[15:28:18](#d46pcJqzcCPaWHvA4344QdcuvpG348FGd5FHJTkUPCY) <hiiamboris>:
I'm using [this tool](https://codeberg.org/hiiamboris/red-cli/src/master/mockups/inline) to avoid them all

[15:46:39](#fbj6x7xgg9PoAcUzLpxgNv1Cc0BkQUhw660VEYubXqE) <hiiamboris>:
* because of the numerous [bugs in `#include`](https://github.com/red/red/issues/5122)

## 18-Jan-2025

[9:59:49](#KJjvxEyt8jR_yyumfbyvE4ep5z5_Itu8z6oyXbgTrlw) <dsunanda>:
False virus warnings....
I compiled this program on Windows  with the latest Red (2025-01-15):
```
Red [Needs: View]

view [box "hello world"]
```
And uploaded it to https://www.virustotal.com for testing.

8 out of its 72 security vendors said it was unsafe. (My highest score to date is 15/72 on a more complicated set of scripts).

Sure, these are false positives from easily startled, improperly tested, apps.

Even so, it's a reputational issue for Red. Could anything be done to fix whatever is scaring the av apps!?

[12:36:27](#jTXSCFqHRsGgW0Kye6EXxgwiOsEtIUQ_fKdSKc6sDyY) <hiiamboris>:
This is a global racket, pay or get blocked. What can be done with it? 
The best thing to do IMO is to educate those you know about it and about properties of capitalism in general.

[17:47:49](#Aq8a076cL9SwZxlseVYe6zC72nzqoBt94UuI51czRgw) <GiuseppeChillemi (GiuseppeChillemi)>:
This afternoon I have spent 1 hour trying to run Red because from time to time the antivirus (Defender) reactivates the protection against Red. While on exclusion list, it catches it on the Google Drive Cache. Also, I don't know why, on the "threat" list, has disappeared the option to add the theat to the exclusions. I have yelled a lot. I  have rebooted the machine, redownloaded Red to invalidate the google Drive cache and being a lot nervous, I have can now continue coding.

[17:48:14](#7xd8vtJfxFehk6jgG5XuP_GEUnHCilxSq5bFx7dDxm0) <GiuseppeChillemi (GiuseppeChillemi)>:
They are slowly taking control of our machines and we must pay to have (partial) freedom

[19:07:58](#2UEabHwLTFChFRG29diPR6WY2CLcvlAOty_kb1BnCH4) <dsunanda>:
It's not just Red, of course. One day, last week on my dev pc, Windows Defender randomly and unhelpfully quarantined TexStudio - a version I'd been using for months without issue. Still, if there is anyway Red can look cleaner, it'll help with any of us deploying Red-built apps.

[19:52:19](#7oPmzBC0YVGX_aXW6WMCYjyZwl4GjcPfD8pcph-ajPc) <GiuseppeChillemi (GiuseppeChillemi)>:
* This afternoon I have spent 1 hour trying to run Red because from time to time the antivirus (Defender) reactivates the protection against Red. While on exclusion list, it catches it on the Google Drive Cache. Also, I don't know why, on the "threat" list, has disappeared the option to add the theat to the exclusions. I have yelled a lot. I  have rebooted the machine, redownloaded Red to invalidate the google Drive cache and being a lot nervous, I can now continue coding.

[19:53:13](#0ey7XheoiBFU9onqF3DlIwz-gRIm9FPp1V1A2ihRzFc) <GiuseppeChillemi (GiuseppeChillemi)>:
It this it is the intrinsic nature of its code is data  /  data is code paradigm

[19:53:33](#oiT5iGlJQCbG6H4LOpglaY2EoTzHqcCll8KffCbsrrY) <GiuseppeChillemi (GiuseppeChillemi)>:
* It think it is the intrinsic nature of its code is data  /  data is code paradigm

[19:54:15](#7oWAThFJwWJf2v8cG1lNo5fCwdllyFXOCSo5A2fLaDM) <GiuseppeChillemi (GiuseppeChillemi)>:
* It think it is cause from the intrinsic nature of its code is data  /  data is code paradigm. I may be wrong?

[19:54:23](#NY_QH1ZhZW3ak46-vTD7r3hd21zneyuXSfLiRTiLJkU) <GiuseppeChillemi (GiuseppeChillemi)>:
* It think it is cause from the intrinsic nature of its code is data  /  data is code paradigm. I may be wrong!

[20:11:19](#Ay6cQzt2NBe5KDxSORQ11oUvYcsARKH2wL5KdodycHs) <GiuseppeChillemi (GiuseppeChillemi)>:
* It think it is caused from the intrinsic nature of its code is data  /  data is code paradigm. I may be wrong!

[20:11:44](#eyMvotrc-ahxacWYglIDpB7246cknehh-6gEuOdvsu4) <GiuseppeChillemi (GiuseppeChillemi)>:
* It think it is caused from the intrinsic nature of Red "code is data"  /  "data is code paradigm". But I may be wrong!

## 19-Jan-2025

[17:40:00](#WqZM5ktL1Hg2dDG6WXGovPBmM2_LxUsP92w6S48elCc) <greggirwin (Gregg Irwin)>:
There are a number of reasons. One is that we don't use standard toolchains, so our layout and internal info is different. Another is our small size, relatively speaking. Primarily, aside from paying to play via digital signing and using app stores, is that we aren't widely used.

## 5-Mar-2025

[13:02:46](#b_BiijKS_PRnGQ8RABE1Mcg5PMGkxLloeISlqz18DSg) <lylgithub2021 (lylgithub2021)>:
¬∑¬∑¬∑
Red [File: %main.red]
#do [s: yes]
#include %incl.red
#either s [#do[print f 3]][f 5]

Red [File: %incl.red]
f: function [x] [x + 1]
¬∑¬∑¬∑
Why does the above codes fail to compile which gives the follow erro message:
```
*** Preprocessor Error in #do
*** Script Error : f has no value
*** Where: [#do]
*** Near:  [print f 3]
```
And how to make it work?

[13:03:07](#pI8vGgypxMQlvA_BpWHKvv1ZFvKAkuVcDRy5ot2ht_0) <lylgithub2021 (lylgithub2021)>:
* ```
Red \[File: %main.red\]
#do \[s: yes\]
#include %incl.red
#either s \[#do\[print f 3\]\]\[f 5\]

Red \[File: %incl.red\]
f: function \[x\] \[x + 1\]
```
Why does the above codes fail to compile which gives the follow erro message:

```
*** Preprocessor Error in #do
*** Script Error : f has no value
*** Where: [#do]
*** Near:  [print f 3]
```

And how to make it work?

[13:03:59](#aw35JBWmd-r7cUZEAeQi_qq79YevWRcExoojvrBp-jk) <lylgithub2021 (lylgithub2021)>:
* ```
Red [File: %main.red]
#do [s: yes]
#include %incl.red
#either s [#do[print f 3]][f 5]

Red [File: %incl.red]
f: function [x] [x + 1]
```

Why does the above codes fail to compile which gives the follow erro message:

```
*** Preprocessor Error in #do
*** Script Error : f has no value
*** Where: [#do]
*** Near:  [print f 3]
```

And how to make it work?

[13:04:34](#gYiK7bvIg1y7pkxG-FVdHuzSm92-nXXB0jfH7A-1neE) <lylgithub2021 (lylgithub2021)>:
* ```
Red [File: %main.red]
#do [s: yes]
#include %incl.red
#either s [#do[print f 3]][f 5]

Red [File: %incl.red]
f: function [x] [x + 1]
```

Why does the above codes fail to compile which gives the following error message:

```
*** Preprocessor Error in #do
*** Script Error : f has no value
*** Where: [#do]
*** Near:  [print f 3]
```

And how to make it work?

[13:10:25](#rSyjACx8zw16Wdtcbyr1axja9Yr24R-d5B9Togvpr-0) <lylgithub2021 (lylgithub2021)>:
* ```
Red [File: %main.red]
#do [s: yes]
#include %incl.red
#either s [#do[print f 3]][f 5]

Red [File: %incl.red]
f: function [x] [x + 1]
```

Why does the above codes fail to compile which gives the following error message:

```
*** Preprocessor Error in #do
*** Script Error : f has no value
*** Where: [#do]
*** Near:  [print f 3]
```

Why does the function `f` not be recognized?

[13:30:30](#lttgaYEPflCef0_vF7Zpvt9OxPcAs1O3Atd08QS0OVk) <lylgithub2021 (lylgithub2021)>:
* ```
Red [File: %main.red]
#do [s: yes]
#include %incl.red
#either s [#do[print f 3]][f 5]

Red [File: %incl.red]
f: function [x] [x + 1]
```

Why does the above codes fail to compile which gives the following error message:

```
*** Preprocessor Error in #do
*** Script Error : f has no value
*** Where: [#do]
*** Near:  [print f 3]
```

Why does the function `f` not be recognized?
Ps: I'm using the latest version of Red

[16:40:32](#XDbDqApyXx__19eTAphkFWTbr1JdGjFH3aL7tgU5mD4) <ldci (Fran√ßois Jouen)>:
You use not recognized compiler option such as #do. See https://static.red-lang.org/red-system-specs.html 

[20:16:04](#ELGL5h0mDfMl0OKdmd3BK7r-oIlww4t6qMjOKIXHdY0) <ldci (Fran√ßois Jouen)>:
lylgithub2021 (lylgithub2021): A very simple way.
`#!/usr/local/bin/red-cli
Red [
]
do %incl.red
s: true
either s [print f 3][ print f 5]`


## 6-Mar-2025

[1:54:59](#1xSDSqMLul5bmmi8c-XiU1xz1J4IowCFK1w6BynU7bA) <lylgithub2021 (lylgithub2021)>:
Thank you @ldci Something has to be prepared during compile-time. That's the reason why `#do` is used. So, I'd like a solution of compile-time version.

[7:00:37](#X_FrAkEqFxAUNcEsvDVFj0vZaxO5JEhE_k8O1Qm438E) <ldci (Fran√ßois Jouen)>:
lylgithub2021 (lylgithub2021): replace `do %incl.red` by `#include %incl.red`


[8:59:09](#2wx5KCRetUBQqh72vIGsj5C7lmoJJoF9WOmWQ4hX0P8) <lylgithub2021 (lylgithub2021)>:
But how to make `print f 3` run in compile-time after `#inclulde %incl.red`?

[9:40:05](#sovLF6o9r7iggnIAF5yxEIo1JzVYttkDTbAfME9pO_4) <ldci (Fran√ßois Jouen)>:
Sample. Incl.red :
`Red [
]
f: function [x] [x + 1]
s: true
either s [print f 3][ print f 5]
`
When your main program use `#include` or `do %incl.red`, the code is executed.

[10:30:05](#K2r30zUhNjJir0nuyOp7UZwAKkU2bHzrsEjAb2wj5_c) <hiiamboris>:
`#do` evaluates the code in Rebol at compile time, while `f:` you define at run time. If you want `f` to be available both at compile time and at run time you have to duplicate its definition in `#do` and outside of it.

[11:54:27](#t1vphW-mrzrw-NU1qb8w8F5NeBNIcK-f0lKtYa2O6Lo) <lylgithub2021 (lylgithub2021)>:
Instead of `#do`, Is there any other better way to run codes in compile time? Dupliaction of function definitiion seems a little  awkard.

[11:57:07](#rpfT1nbOFFeUn0W_22uPWxDITXnoVAIqgenr9950w9k) <lylgithub2021 (lylgithub2021)>:
And I also tried to put `#include %incl.red` inside `#do` which I think is a dupliction of function definition of `f`. But, still, the function `f` is not recognized. Why?

[12:07:01](#HGiGBCK29S4cAAE1eqZNIiszGQkzdvxLPvO519p4RYo) <lylgithub2021 (lylgithub2021)>:
The part of `s: true either s [print f 3][ print f 5] ` should be in my main program, not in `incl.red`. 

[13:56:09](#CMBaY7tYyJDTdf6_gvEHpbpb3N-a97qEnjHDzpVEV-o) <hiiamboris>:
well, simplest thing that comes to my mind right now is defining a macro:
```
Red []
#macro [#keep block!] func [s e] [do s/2 s/2]
#keep [f: func [a b] [probe a * b]  f 2 3]
```

[13:56:37](#0Ti9hXBOlTCYABrYaQekXq5E_qq9WlGBJtGAJCSvDJs) <hiiamboris>:
* well, simplest thing that comes to my mind right now is defining a macro:
```
Red []
#macro [#keep block!] func [s e] [do s/2 s/2]
#keep [f: func [a b] [probe a * b]  f 2 3]
```
This code will be evaluated both at compile and at run time

[14:00:16](#AFVE-Z8g3hftLluyheTYp5BiTgBaf6sI138u3izOpgw) <hiiamboris>:
Because #include doesn't evaluated anything at compile time, just gets replaced with the code of that file. `#do [do %incl.red]` would work.

[17:29:01](#eznig2ulX8CscBqGDJnRq5ApwiETb-BS2wkrn4li6YA) <ldci (Fran√ßois Jouen)>:
It‚Äôs possible move `s: true either s [print f 3][ print f 5]` in your main program

## 7-Mar-2025

[1:02:12](#T8YMUUYwlWKlCP2Vh4pgex621J4xm1Stx0adhrh-TmI) <lylgithub2021 (lylgithub2021)>:
So we come back to the original poit. The function `f`, which is definited in `incl.red` and introduced into `main.red` by `#include %incl.red`. is not recognized by `#do [print f 3]`. That means I can't run the code ` print f 3` at compile time. But I really want to run it at compile time.

[1:11:58](#1fZ0GIvxBVEkeJNUzWQYmMrDz24pRmsfPOVO94sD0dU) <lylgithub2021 (lylgithub2021)>:
Following your instruction `#do [do %incl.red]`, I receive error message 
```
*** Syntax Error : Script is missing a REBOL header
*** Where: [#do]
```

[1:15:44](#x95wCcQXWNVELivfaArdtBh73XFE8e_XStJRTuKPOEQ) <lylgithub2021 (lylgithub2021)>:
* So we come back to the original poit. The function `f`, which is definited in `incl.red` and introduced into `main.red` by `#include %incl.red`, is not recognized by `#do [print f 3]`. That means I can't run the code ` print f 3` at compile time. But I really want to run it at compile time.

[1:51:27](#K6PjHZUfPmASFSePhHcBksICY1eLtKGkKX9yRlhbCJU) <lylgithub2021 (lylgithub2021)>:
* So we come back to the original poit. The function `f`, which has to be definited in `incl.red` and is introduced into `main.red` by `#include %incl.red`, is not recognized by `#do [print f 3]`. That means I can't run the code ` print f 3` at compile time. But I really want to run it at compile time.

[4:32:27](#CdWNNAxMR9KE6JyGMXEZiLNFrBuYWeHJviyydr8KqJc) <hiiamboris>:
The trick is to have a double header. `REBOL [] Red [] ...`

[7:27:07](#PUUCNGBS5Ua6oXcGdnE9HqECS4AvLrSv2TXLeT4vUGQ) <lylgithub2021 (lylgithub2021)>:
Seems that some `Red` cods can not run under `REBOL [] `, `parse` for example

[7:32:13](#sdhpI1e2WHk9knwhmXdr9p4GyayUB99IBAVDL2g657s) <lylgithub2021 (lylgithub2021)>:
* So we come back to the original poit. The function `f`, which has to be definited in `incl.red` and is introduced into `main.red` by `#include %incl.red`, is not recognized by `#do [print f 3]`. That means I can't run the code ` print f 3` at compile time. But I really want to run it at compile time.
To make it simple, `How to run a external file from the main progam at the compile-time?`

[7:45:45](#RaCtPxU201F-zD_t0nTiE_9HFvoc4f31rVFGDFRYGuo) <lylgithub2021 (lylgithub2021)>:
* Seems that some `Red` codes can not run under `REBOL [] `, `parse` for example

[8:40:06](#zpFGwmMFavHGR2Ghk3mElmlnUdiVIZi4j2S9n3ZS68g) <ldci (Fran√ßois Jouen)>:
As underlined #do is not a Red compiler option but a REBOL pre-processing option. Try this in your main program.
`Red [
]

#include %incl.red

s: true

either s [print f 3][ print f 5]`



[8:41:06](#P08bc14ZgyqAB4aLEvR-IFAiG0Hd5Jf3qOQm5EPyBP8) <ldci (Fran√ßois Jouen)>:
* As underlined #do is not a Red compiler option but a REBOL pre-processing option. Try this in your main program.
\`
Red \[
\]
#include %incl.red
s: true
either s \[print f 3\]\[ print f 5\]\
`



[8:56:38](#nhfTsD9cG1HhMRGpD699Piz4yDfWRjHL0-Jfb3ukXx4) <lylgithub2021 (lylgithub2021)>:
In this version, `print f 3` will run at run-time. But how to run `print f 3` at compile-time?

[9:35:34](#Igygs-8eD_NgPH2L0xouU2Suhac1rlq9LbzEPwV7Xc8) <hiiamboris>:
Yes, compiler runs in the REBOL 2 interpreter, so you have to use only a common subset of Red and REBOL there

[10:06:56](#lXDB_77DNtFM3q5mMrm2IPjrduWiiOUC632ZLm2gvL8) <hiiamboris>:
* Yes, compiler runs in the REBOL 2 interpreter, so you have to use only a common subset of Red and REBOL there if you want it to be evaluated in both

[13:18:26](#BX5ZXm9mxxkgtfKkqjEeWJsj_apH1RExM9b8JsM2Omg) <lylgithub2021 (lylgithub2021)>:
* So we come back to the original poit. The function `f`, which has to be definited in `incl.red` and is introduced into `main.red` by `#include %incl.red`, is not recognized by `#do [print f 3]`. That means I can't run the code ` print f 3` at compile time. But I really want to run it at compile time.
To make it simple, `How to run a external file(which contains the definition of functions that will be used in the main program) from the main progam at the compile-time?`

[13:22:53](#5dizOILNQ8CbhDfyU0GaAGWyJYLPWYjmC9VBtc0Ra08) <lylgithub2021 (lylgithub2021)>:
* So we come back to the original poit. The function `f`, which has to be definited in `incl.red` and is introduced into `main.red` by `#include %incl.red`, is not recognized by `#do [print f 3]`. That means I can't run the code ` print f 3` at compile time. But I really want to run it at compile time.
To make it simple, `How to run a external file(which contains the definition of functions that will be used in the main program) from the main progam at the compile-time? Meanwhile, the call of these functions also run at compile-time?`

[13:25:02](#8NvFoYkjVhJz3qBgIVBM9UziI0DM1b-OrDaIt14BjKc) <lylgithub2021 (lylgithub2021)>:
If some codes only run at compile-time, any better methods?

[13:52:48](#Mxc_-d2e8YDi5_pP0Kp4GvE2A_rvmwpspgbZDXWffzQ) <hiiamboris>:
Well, you could use my [inline tool](https://codeberg.org/hiiamboris/red-cli/src/master/mockups/inline) to preprocess the source file using Red before compiling it. Or just use a simple `save %file.red expand-directives load %file.red` expression to preprocess it which will should as long as your codebase is small.

[13:59:23](#Kg67N6MFHK5mjzEkPtgO1KJp-GanyYucWgxYoW_hVvI) <ldci (Fran√ßois Jouen)>:
No idea :(

[14:01:09](#efnqwYZ6gkhPFFFwHZCESqI1_zUnU2reXxn96P41SFQ) <hiiamboris>:
* Well, you could use my [inline tool](https://codeberg.org/hiiamboris/red-cli/src/master/mockups/inline) to preprocess the source file using Red before compiling it. Or just use a simple `save %file.red expand-directives load %file.red` expression to preprocess it which should work as long as your codebase is small.

[14:02:10](#toKNUBB6pRlev51OFDbgxun3588l1sggo0vE-sTydUU) <lylgithub2021 (lylgithub2021)>:
* In this version, `print f 3` will run at run-time. But how to run `print f 3` in main program at compile-time?

[14:03:56](#Y6SNMxwmLOueydmK_p6Dqk5Qw4ZMUwPZnyKydxIUaC0) <hiiamboris>:
But let's take a step back. What is the goal? What you're trying to achieve?

## 8-Mar-2025

[5:14:55](#WxAZYNInIt_1A_XeoBJ2QrCX_xfGdHzUPslB2i0MA_g) <lylgithub2021 (lylgithub2021)>:
In my program, auxiliary functions are gathered in a file(the function `f` in the file of `incl.red` as example). As the program will be distributed by only a `.exe` file, all data and functions the main program(`main.red`) needs has to be included. Some data from external file must be handled by functions in `incl.red` at compile-time, and the result is wroten into a file which is then `#include` into the main progam for the reason of program distribution by only a `.exe` file. Then, compile the main program only would get the `.exe` file, and running this `.exe` file needs not any other support files.

[5:16:43](#XXCabkUo0IOTXXTvLV8sZWzUu5Hf7I-WQNG59NtouEw) <lylgithub2021 (lylgithub2021)>:
* In my program, auxiliary functions are gathered in a file(the function `f` in the file of `incl.red` as example). As the program will be distributed by only a `.exe` file, all data and functions the main program(`main.red`) needs has to be included. Some data from external file must be handled by functions in `incl.red` at compile-timeÔºà`#do[print f 3`] as exampleÔºâ, and the result is wroten into a file which is then `#include` into the main progam for the reason of program distribution by only a `.exe` file. Then, compile the main program only would get the `.exe` file, and running this `.exe` file needs not any other support files.

[5:23:42](#rupU0Po0dg-Ii3ddZZL_nVQsmvXR1xv0dYq1jYdhJj8) <lylgithub2021 (lylgithub2021)>:
* In my program, auxiliary functions are gathered in a file(the function `f` in the file of `incl.red` as example). As the program will be distributed by only a `.exe` file, all data and functions the main program(`main.red`) needs has to be included. Some data from external file must be handled by functions in `incl.red` at compile-timeÔºà`#do[print f 3`\] as exampleÔºâ, and the result is wroten into a file which is then `#include` into the main progam at compile -time for the reason of program distribution by only a `.exe` file. Then, compile the main program only would get the `.exe` file, and running this `.exe` file needs not any other support files.

[5:27:36](#OOs_e0yk9E9RRNd86_7fF1srdMPPR5UCsu0_GvcxVzM) <lylgithub2021 (lylgithub2021)>:
* In my program, auxiliary functions are gathered in a file(the function `f` in the file of `incl.red` as example). As the program will be distributed by only a `.exe` file, all data and functions the main program(`main.red`) needs has to be included. Some data from external file must be handled by functions in `incl.red` at compile-timeÔºà`#do[print f 3`\] as exampleÔºâ, and the result is wroten into a file which is then `#include` into the main progam at compile -time for the reason of program distribution by only a `.exe` file. Then, compile the`main.red` only would get the `.exe` file, and running this `.exe` file needs not any other support files.

[5:29:01](#apmWhKEVVZTYGSU3z5qAeVT0QN5RJagLLjpGbJgDSA8) <lylgithub2021 (lylgithub2021)>:
* In my program, auxiliary functions are gathered in a file(the function `f` in the file of `incl.red` as example). As the program will be distributed by only a `.exe` file, all data and functions the main program(`main.red`) needs has to be included. Some data from external file must be handled by functions in `incl.red` at compile-timeÔºà`#do[print f 3`\] as exampleÔºâ, and the result is wroten into a file which is then `#include` into the main progam at compile -time too for the reason of program distribution by only a `.exe` file. Then, compile the`main.red` only would get the `.exe` file, and running this `.exe` file will need not any other support files.

[5:37:27](#9GF6pXyRElAUXVhLjIFYoi9wqemo9I_U8VLdk6MPVEM) <lylgithub2021 (lylgithub2021)>:
at present, the first problem is that `#do` does not recognize functions outside it. I can't understand this logic

[5:54:31](#XrjG-FaycJo4IMGuNTZXTgYKM5wd_AKE4JmbGcRUG1I) <hiiamboris>:
The logic is simple. When you compile, first your file is preprocessed (#do preprocessor directive is evaluated) using R2. `#include` is a passive value of datatype `issue!`, so it does nothing. After preprocessing, it is compiled. Compiler replaces its `#include` directive with the file's contents and then performs the compilation and creates an exe binary.

[5:55:17](#ygu92zQg6I7TPSsOhVY8buB8o-awmdvGtqsNxHlIDU0) <hiiamboris>:
Thus, I proposed `#do [do %file.red]` solution, so that that file is evaluated at the preprocessing stage.

[5:57:47](#gz_VhUxTnw3KFb31bwygDALu-0DvKkNT8dyml6SUWpA) <hiiamboris>:
Since R2 is not 100% compatible with Red, it makes sense to extract only the functions that you need to run at compile time into another source file. And rewrite them in a way that they would work in both environments.

[5:58:42](#DiRwFH-2Qao5l62gPfUHwCmKv5sP6uiA1iT0mHvhzAw) <hiiamboris>:
Or otherwise, like I proposed above, do the preprocessing and new file creation using Red, and then invoke the compiler on the output of it.

[21:35:29](#fVsp7ka98aq5N9Zk99tqX50cJQwH3Sp9kTpr03aIq60) <greggirwin (Gregg Irwin)>:
Have you tried a macro?

## 10-Mar-2025

[2:28:42](#9Ag7u7r3DzhBHYJHaeigyu40ogmL0l6FPfgFLf3wnlc) <lylgithub2021 (lylgithub2021)>:
By now, I have not found out more info about the concept of micro in Red and how to use it

[2:34:01](#tEkPohyOgQSzbJ2CQ5abSb-3kRTBGQwe6jsGvBKPs-Y) <lylgithub2021 (lylgithub2021)>:
* By now, I have not found out more info about the concept of macro in Red and how to use it. I have no idea how to achieve the purpose of my example with macro 

[3:08:22](#0POhPgWZG2uR91uXzx8cqDWLqoU8c8MpnB1HvEK24Pk) <hiiamboris>:
I've already given you above a macro that I've tested to be working fine

[6:26:04](#CepklcK-qZulmMjXZEKCtaL-_z2AMzELzMaakabRQtc) <lylgithub2021 (lylgithub2021)>:
All right. Than you allÌ†æÌ¥ù

[6:31:54](#pfH1jUPvGp2LUt2jyvr3hNNW6x_LeQsnkvEchy3AM7E) <lylgithub2021 (lylgithub2021)>:
And another question. How to stringlize definition of a function? For  example, `f: function[x][x]`, `:f` will give its definition as `func [x][x]`. I'd like print or stringlize this definition. I tried `to-string/form/rejoin/print :f`. All these try just give `"?function?"`, not `"func [x][x]"` which I expect. What's wrong with my tries on it?

[6:32:42](#sqrRmlI6SIXB1XmMEr8nzMnhiHBkPR1qurp5YHHR0o8) <lylgithub2021 (lylgithub2021)>:
* And another question. How to stringlize definition of a function? For  example, `f: function[x][x]`, `:f` will give its definition as `func [x][x]`. I'd like print or stringlize this definition. I tried `to-string/form/rejoin/print :f`. All these triesjust give `"?function?"`, not `"func [x][x]"` which I expect. What's wrong with my tries on it?

[6:32:59](#zrZWCiT6c2kEFW7impvI98mzdVxUC595wC-0jkBYTso) <lylgithub2021 (lylgithub2021)>:
* And another question. How to stringlize definition of a function? For  example, `f: function[x][x]`, `:f` will give its definition as `func [x][x]`. I'd like print or stringlize this definition. I tried `to-string/form/rejoin/print :f`. All these tries just give `"?function?"`, not `"func [x][x]"` which I expect. What's wrong with my tries on it?

[10:55:55](#bKFvrgZMf-sCtWzkt91HQd-pf-pzJJB44U4a4rAmr58) <dsunanda>:
```
f: function[x][x]
str: mold :f
str
== "func [x][x]"
```

## 12-Apr-2025

[13:48:02](#S4-9ASW3xo_k-mSMYaWVV1lZaa6ldC5fCGDqXM1FDYk) <lylgithub2021 (lylgithub2021)>:
¬∑¬∑¬∑
Red[]
blk: ["aa" "bb" "" "cc"]
probe first blk/3 ;;output none

foreach i blk [
switch/default first i [
#"a" [print "aa"]
#"b" [print "bb"]
none [probe i]
#"c" {print "cc"}
][print "default"]
]
¬∑¬∑¬∑
Running the above code, I get:
```
none
aa
bb
default
```
Why is the item `""` of `blk` not recognized in `switch`, neither the item "cc"?

[13:48:30](#5xEBrbbl-GFSeNBKnIVSJiaBEhPX2LXMuJnWI4AnFx4) <lylgithub2021 (lylgithub2021)>:
* ```
Red\[\]
blk: \["aa" "bb" "" "cc"\]
probe first blk/3 ;;output none

foreach i blk \[
switch/default first i \[
#"a" \[print "aa"\]
#"b" \[print "bb"\]
none \[probe i\]
#"c" {print "cc"}
\]\[print "default"\]
\]
```
Running the above code, I get:

```
none
aa
bb
default
```

Why is the item `""` of `blk` not recognized in `switch`, neither the item "cc"?

[13:49:38](#o3c5APfHJZDg-GxdKFxYBi4kJRk_YHStxo8eeGwyxks) <lylgithub2021 (lylgithub2021)>:
* ```
Red[]
blk: ["aa" "bb" "" "cc"]
probe first blk/3 ;;output none

foreach i blk [
switch/default first i [
#"a" [print "aa"]
#"b" [print "bb"]
none [probe i]
#"c" {print "cc"}
][print "default"]
]
```

Running the above code, I get:

```
none
aa
bb
default
```

Why is the item `""` of `blk` not recognized in `switch`, neither the item "cc"?

[13:50:31](#Wqo_QPq7YpI8nK1UWg7PgjTEBNTvswVh-oAM0EXrSOA) <lylgithub2021 (lylgithub2021)>:
* ```
Red[]
blk: ["aa" "bb" "" "cc"]
probe first blk/3 ;;output none

foreach i blk [
switch/default first i [
#"a" [print "aa"]
#"b" [print "bb"]
none [probe i]
#"c" [print "cc"]
][print "default"]
]
```

Running the above code, I get:

```
none
aa
bb
default
```

Why is the item `""` of `blk` not recognized in `switch`?

[13:52:22](#Nnap3gAs_SlWFU0D4007J9l75hrD0vd-DdyGlEjcWZY) <lylgithub2021 (lylgithub2021)>:
* ```
Red[]
blk: ["aa" "bb" "" "cc"]
probe first blk/3 ;;output none

foreach i blk [
switch/default first i [
#"a" [print "aa"]
#"b" [print "bb"]
none [probe i]
#"c" [print "cc"]
][print "default"]
]
```

Running the above code, I get:

```
none
aa
bb
default
```

Why is the item `""` of `blk` not recognized as `"none"` in `switch`?

[13:52:54](#tnefSV0rcCgQur1Ide_oItzL-kgjG_yCJso4afl07G4) <lylgithub2021 (lylgithub2021)>:
* ```
Red[]
blk: ["aa" "bb" "" "cc"]
probe first blk/3 ;;output none

foreach i blk [
switch/default first i [
#"a" [print "aa"]
#"b" [print "bb"]
none [probe i]
#"c" [print "cc"]
][print "default"]
]
```

Running the above code, I get:

```
none
aa
bb
default
cc
```

Why is the item `""` of `blk` not recognized as `"none"` in `switch`?

[13:54:13](#uYBcKzQvaGrsBMA9uI3aZ6GGhqkHczS3dKa6pU3r_EU) <lylgithub2021 (lylgithub2021)>:
* ```
Red[]
blk: ["aa" "bb" "" "cc"]
probe first blk/3 ;;output none

foreach i blk [
switch/default first i [
#"a" [print "aa"]
#"b" [print "bb"]
none [probe i]
#"c" [print "cc"]
][print "default"]
]
```

Running the above code, I get:

```
none
aa
bb
default
cc
```

Why is the item `""` of `blk` not recognized as `"none"` in `switch`, since `first ""` should be `none`?

[14:34:49](#RDZTLAMEHA_uglIvaNzptSEwOOKFILQPM901y_ACMGI) <hiiamboris>:
`switch` does not `reduce` its contents, so you should use `#(none)` instead

[14:37:27](#BZQhzHCkEmCrXatKOa4ItLMc0chlQU4UiiO7cNPCspY) <lylgithub2021 (lylgithub2021)>:
Since `switch does not reduce its contents`, why is `#(none) reduced to `none`?

[14:45:37](#vgP1CnnA-KqULgmCB_YiejEWwlN4hn999BrRCgaXmzA) <lylgithub2021 (lylgithub2021)>:
* Since `switch does not reduce its contents`, why is `#(none) reduced to `none\`?  Or wha's the difference between `none` and `#(none)`?

[14:46:14](#077LA_1s9MRTUUsdceyo41VzNPun2atzqYtpoTHoQ1A) <lylgithub2021 (lylgithub2021)>:
* Since `switch does not reduce its contents`, why is `#(none) ` reduced to `none?  Or wha's the difference between `none` and `#(none)`?

[14:46:36](#HDc5Zbjhqj98FUz9jmxPZxb26h8x6Nm4MXzpxNpCtNQ) <lylgithub2021 (lylgithub2021)>:
* Since `switch does not reduce its contents`, why is `#(none) ` reduced to `none`?  Or wha's the difference between `none`and`#(none)\`?

[14:46:57](#kR6Ul25AETDKJyxcxGXawwCgEHWWFd-Ue-xz84f5Rk4) <hiiamboris>:
`#(none)` is a value of type `none!`, `none` is a value of type `word!`

[14:47:01](#wzZ5WUDdvjB54WE7sX5H_TOMKQV3Kf8xyJyvFy-ko_s) <lylgithub2021 (lylgithub2021)>:
* Since `switch does not reduce its contents`, why is `#(none) ` reduced to `none`?  Or wha's the difference between `none`and `#(none)`?

[14:48:13](#oJcK9wB_p8ViN49OWSDf4E9zCTCLXp6BttDi519Grwk) <lylgithub2021 (lylgithub2021)>:
Thank you so much!!

## 13-Apr-2025

[5:27:24](#MMaHSmfYmjNEe4BqqqJCQhZ3Yftmap7APzl6EYoJer0) <lylgithub2021 (lylgithub2021)>:
Why does running `to-local-file/full %test.red` cause `red-view.exe` force closed. Anything wrong with my use of `to-local-file`? How can I get a absolutely full path of a file?

[5:33:45](#VODPxxSgVOSGp4GXr3NhbD20otc0K5IEyR1nSTDHnos) <hiiamboris>:
what's the output of `what-dir` for you?

[5:49:02](#j6XVnERlZUZw3NxsqZzWoaT3zB32KKLVHxaDZqwM7z0) <lylgithub2021 (lylgithub2021)>:
Given a file name(the file is really exist), how to get its absolutely full path? With `what-dir`, does that mean I need to change to the file path in advance every time?

[5:50:12](#fdrgu9HDHLiTsMjGTMKXGDdaJgvuTIOWXEQDtYuSpsQ) <lylgithub2021 (lylgithub2021)>:
* Given a file name(the file is really exist), how to get its absolutely full path(I remember `to-local-file/full` shoud do this)? With `what-dir`, does that mean I need to change to the file path in advance every time?

[5:51:54](#FXL_moAWtjnMhhkjjYCJp34xGhAJnsLkxABikJcjnts) <lylgithub2021 (lylgithub2021)>:
* Given a file name(the file is really exist), how to get its absolutely full path like "c:\mytest\test.red"(I remember `to-local-file/full` shoud do this)? With `what-dir`, does that mean I need to change to the file path in advance every time?

[6:01:35](#o_JIGYd9JzXOCh6_NhbfdDIbqouYcwANTA5nck2PL9I) <lylgithub2021 (lylgithub2021)>:
* Given a file name(the file really exists), how to get its absolutely full path like "c:\\mytest\\test.red"(I remember `to-local-file/full` shoud do this)? With `what-dir`, does that mean I need to change to the file path in advance every time?

[6:10:53](#BsoClo-V-k2DrS18pivB2hh5-Us0z-S_hdgz1NKDJ-Y) <lylgithub2021 (lylgithub2021)>:
* `what-dir` seems only give the path to directory. Given a file name(the file really exists), how to get its absolutely full path like "c:\\mytest\\test.red"(I remember `to-local-file/full` shoud do this. But why does it cause a serious failure)? 

[6:17:41](#oczJBaoYm0J6QXlByz0ziRpS1998IKRQpwHH8-MCcHI) <lylgithub2021 (lylgithub2021)>:
* Why does running `to-local-file/full %test.red` cause `red-view.exe` force closed? Anything wrong with my use of `to-local-file`? How can I get a absolutely full path of a file?

[6:41:05](#-7oj8xqW9r5E1OMGPdOB7U9WHLZKvJ0NQ0C_HAdg-Ps) <hiiamboris>:
it's a bug obviously, hence I ask for your `what-dir` output to see if I can reproduce it

[6:49:25](#DF9zx2Jm_s_SW1ir7iSvBhjNn-9ScOxZnLcr3B4Z0S4) <lylgithub2021 (lylgithub2021)>:
In my case:
```
>> what-dir
== %/C/Users/DLC/Desktop/merge-files/
```


[6:51:39](#YCYuL5WLkhpGeNdN8vQ2AprTraiBgn0v6wsGgPqPlTE) <hiiamboris>:
hmm, nothing out of the ordinary

[6:52:13](#QGkx5D8Ue6O-rGh5kOf3pu9Ay9tIfurIdePnwgWnBmo) <hiiamboris>:
does it crash every time you do that?

[6:54:17](#VD9VGZRb4BVMuTwF5ibxW9-m7RuIsy-fvCICsiKmTH8) <lylgithub2021 (lylgithub2021)>:
![](https://gitter.ems.host/_matrix/media/v3/download/gitter.im/ee83a4a7cbe43ef6feb98e223f6a45bde76a3af01911311962499710976)

[6:54:20](#eCNG2PQpnTRicAgxhYAnjOx4qZMHP8eV5tobo-ZJ4NY) <lylgithub2021 (lylgithub2021)>:
Yes. every time, even for the latest version of `red-view`

[6:54:56](#bwUuo1uCFyJquPyTBWD4m4mMxmt53OFnDkJdXTS0pXc) <hiiamboris>:
can you try `recycle/off` before running `to-local-file`?

[6:54:59](#yZ7rU7M3AllI5hrl67z8Ga-NBbAJWnCOBJW4F_cbsK8) <lylgithub2021 (lylgithub2021)>:
* Yes. every time if `/full` is used, even for the latest version of `red-view`

[6:55:45](#zvz8jup8khLE57lZTwOFRspO1au1X_Mx1Fp7FiqBxK8) <hiiamboris>:
I reproduced

[6:56:56](#AvF5ssF8XUnjgWG_EedvI1zPdknpm_Sw8e6ZVg9Oh2M) <hiiamboris>:
I'll make an issue, and once it's fixed it should stop crashing

[6:58:02](#lpUw5idAOx5UlUaw2-djcIC1Hk-JDxIEcnqFGQYzruU) <lylgithub2021 (lylgithub2021)>:
try recycle/off before running to-local-file, the same crash

[7:00:18](#BkOoXxftNyDkK1ITx_FVdwQHg7Q7Lu37FBlPzN7E5eQ) <lylgithub2021 (lylgithub2021)>:
* Yes. every time if `/full` is used, even with the latest version of `red-view`

[7:14:31](#FQZu_JffjYNykUVyhH2G1HnkjajAs6Bi2VYllVTiBts) <hiiamboris>:
https://github.com/red/red/issues/5609

[7:15:28](#E3ML7ArBnU2VnBRNHmxQ19FEj8gB-F3xuCkTuVeRo6c) <hiiamboris>:
here's a workaround for you:
```
>> clean-path %test.red
== %/D/123456789_123/test.red
```

[7:17:16](#jsMyyUwcOp8wN3oPaLZgYvOUJdVMgdb07exHdml1zgg) <hiiamboris>:
* here's a workaround for you:
```
>> clean-path %test.red
== %/D/123456789_123/test.red
>> to-local-file clean-path %test.red
== "D:\123456789_123\test.red"
```

[9:47:02](#LQ6BzTLcUTnIPLpDE-uEodE1myOpevpCYDs7FUJ0QFQ) <lylgithub2021 (lylgithub2021)>:
Many thanks!!

## 14-Apr-2025

[6:36:40](#uSawP9w-WRuCimk6SSBtcIGrSeTmNAw0GGa1h7NjGJo) <lylgithub2021 (lylgithub2021)>:
I can open a file by its relative path in `red-view` , but fail to open it by its absolute path. Pls see the following example:
```
>> read to-file "for test\a.txt"
== {This comes from "a.txt"^/;;*#<start>^/aaaaa^/;;*#<end>^/}
>> read to-file "c:\for test\a.txt"
*** Access Error: cannot open: %"c:\for test\a.txt"
*** Where: read
*** Near : read to-file "c:\for test\a.txt"
*** Stack:  
```
Why?

[6:37:09](#StczPCtSTA2wjDMRG-x7BFH3qY4X5Yhic9UYyct6LHE) <lylgithub2021 (lylgithub2021)>:
* I can open a file by its relative path in `red-view` , but fail with its absolute path. Pls see the following example:

```
>> read to-file "for test\a.txt"
== {This comes from "a.txt"^/;;*#<start>^/aaaaa^/;;*#<end>^/}
>> read to-file "c:\for test\a.txt"
*** Access Error: cannot open: %"c:\for test\a.txt"
*** Where: read
*** Near : read to-file "c:\for test\a.txt"
*** Stack:  
```

Why?

[10:28:01](#ZolE8wpj98DGJnMQgt7BgNeEjDIMepMBV9r6XTA99uI) <dockimbel>:
You got lucky that it worked for that relative path (a side-effect of our current limited IO support). Red relies on platform-independent file path format. Use `to-red-file` to convert platform-specific formats to Red format:

```
>> to-red-file "for test\a.txt"
== %"for test/a.txt"
>> to-red-file "c:\for test\a.txt"
== %"/c/for test/a.txt"
```

[10:55:01](#XLwqObNM6y4PUH8mZUbVJGJNLowpUKsm6mfSAoLszPU) <lylgithub2021 (lylgithub2021)>:
![](https://gitter.ems.host/_matrix/media/v3/download/gitter.im/abd20f41f73bf6358f84127122f3a1e36cf5dc2a1911734931357171712)

[10:55:08](#NC1aw4LJTWXqAhpA9pLuomKBvPE9QrL3gkC_o8v8c2E) <lylgithub2021 (lylgithub2021)>:
![](https://gitter.ems.host/_matrix/media/v3/download/gitter.im/abd20f41f73bf6358f84127122f3a1e36cf5dc2a1911734931357171712)

[10:55:58](#eQgS0AJZCm3jDku-TH4LrTGuYDZr3iODQnhDqkzv5z0) <lylgithub2021 (lylgithub2021)>:
* I tried `to-red-file`. The result is the same as `to-file` -- if absolute path is given, the file can not open.

[11:01:59](#qndokNIdQroe_vdVGpQlDmbDqqqweFttmdiyrfFph7E) <Oldes (@oldes.h:matrix.org)>:
In one file you have a space and in the second `-`

[11:02:19](#MHJYwfFfDzCMuJBN2YMqPUXj3fikpKjkgHsipvm9Rk0) <Oldes (@oldes.h:matrix.org)>:
So make sure where your file really is and how is really named.

[11:39:35](#GnbNZqy_217nGUMciXI942C921wlECOZ3F05rRwugJE) <lylgithub2021 (lylgithub2021)>:
Yes, you are right. I got wrong the file. Many thanks for your help!!!

## 16-Apr-2025

[13:15:58](#z1pU0o3KMXgQenOVYc3CfX_2lLU9p98StQj0GAt-IqU) <lylgithub2021 (lylgithub2021)>:
```
foreach i [1 "first" 2 "second"][
if string? i [
  view [field i button "break" [break] button "continue" [continue]]
  ]
]
```
The following rror message is given when click the button "break'' with run of the above codes:
```
*** Throw Error: no loop to break
*** Where: either
*** Near : break
*** Stack: view do-events do-actor do-safe 
```
`break` does not work here. So, inside `view`, what is the right way to exit from a loop ?

[13:22:57](#r49EbyHz4SfJnI3n5l7IO0UZa_nRB1Eu0ovd0dPwaak) <lylgithub2021 (lylgithub2021)>:
* ```
foreach i [1 "first" 2 "second"][
if string? i [
  view [field i button "break" [break] button "continue" [continue]]
  ]
]
```
I want to use a gui interface to determine whther or not exit a loop with the above codes.
The following rror message is given when click the button "break'' with run of the above codes:

```
*** Throw Error: no loop to break
*** Where: either
*** Near : break
*** Stack: view do-events do-actor do-safe 
```

`break` does not work here. So, inside `view`, what is the right way to exit from a loop ?

[13:23:14](#qfGzO3Eh_Keu-Ff4w396UaqW2nS0bReM-APPonMHpLE) <lylgithub2021 (lylgithub2021)>:
* ```
foreach i [1 "first" 2 "second"][
if string? i [
  view [field i button "break" [break] button "continue" [continue]]
  ]
]
```

I want to use a gui interface to determine whether or not exit a loop with the above codes.
The following rror message is given when click the button "break'' with run of the above codes:

```
*** Throw Error: no loop to break
*** Where: either
*** Near : break
*** Stack: view do-events do-actor do-safe 
```

`break` does not work here. So, inside `view`, what is the right way to exit from a loop ?

[13:24:29](#XnoDTiclq6mQUHl4OLsdWVTZHF4vaYIn26oqkEYK5BE) <lylgithub2021 (lylgithub2021)>:
* ```
foreach i [1 "first" 2 "second"][
if string? i [
  view [field i button "break" [break] button "continue" [continue]]
  ]
]
```

With the above codes I'd like to use a gui interface to determine whether or not to exit a loop .
The following error message is given when click the button "break'' with run of the above codes:

```
*** Throw Error: no loop to break
*** Where: either
*** Near : break
*** Stack: view do-events do-actor do-safe 
```

`break` does not work here. So, inside `view`, what is the right way to exit from a loop ?

[13:27:30](#PsFYURDKV_O5FKincRZ4xsbt1eE5yYxImacGzZZHtqE) <lylgithub2021 (lylgithub2021)>:
* ```
foreach i [1 "first" 2 "second"][
if string? i [
  view [field i button "break" [break] button "continue" [continue]]
  ]
]
```

With the above example, I'd like to use a gui interface to determine whether or not to exit a loop . The window will stay there for later jobs after jumping out of the loop.
The following error message is given when click the button "break'' with run of the above codes:

```
*** Throw Error: no loop to break
*** Where: either
*** Near : break
*** Stack: view do-events do-actor do-safe 
```

`break` does not work here. So, inside `view`, what is the right way to exit from a loop ?

[15:08:42](#aqdgM03x1053Z1U9kiLSprbOA_N2Ze7by-RduaZbIVY) <hiiamboris>:
`view/no-wait` if you want to manually control when to close the window

[21:49:33](#gMKIh3dE4F94i5XOFcgdw1_p0WE43zhyKmZskIc7rMg) <gurzgri>:
lylgithub2021 (lylgithub2021)  The way the question is worded makes me wonder whether the model you're trying to use a good fit: Saying "I'd like to use *a* gui" and "*the* window will stay there" seems to imply that really there is just a single UI / window. Yet with `view` in a loop you're actually setting up *a new* window with each iteration.

If the latter is okay for you, then something simple like  
```
foreach i [1 "first" 2 "second"] [
	break?: no
	if string? i [
		view [
			field i
			button "break"    [unview break?: yes]
			button "continue" [unview]
		]
	]
	if break? [break]
]
```
might do the trick for you.

But if you really want to solve your problem *in only one* gui, that iterative approach won't do and you'll likely need something more sophisticated, because with an interactive ui you're somewhat leaving the iterative paradigm and enter event based interaction processing and find other ways to "loop" thru the stuff you want to process.

The following approach might give you an idea on one possibility to address this:

```
queue:  [1 2 3 4 5 6 7 8 9 "ten" 11 12 13 14 15 16 17 18 19 "twenty" 21 22 23 24 25]
speed:  5
pause:  does [info/rate: none]
resume: does [info/rate: speed]

process: does [either empty? queue [unview] [refresh string? info/data: take queue]]
refresh: func [state [logic!]] [do pick [pause resume] info/enabled?: okay/enabled?: nope/enabled?: state]

view/no-wait [
	info: field on-time [process] with [rate: speed] return

	okay: button "ok"     [resume]
	nope: button "cancel" [unview]
]
```

[21:49:52](#mnXFUgOLGXiJlKwMQVYXpuLVlD862qkjlAny_C2aM_U) <gurzgri>:
* lylgithub2021 (lylgithub2021)  The way the question is worded makes me wonder whether the model you're trying to use is a good fit: Saying "I'd like to use _a_ gui" and "_the_ window will stay there" seems to imply that really there is just a single UI / window. Yet with `view` in a loop you're actually setting up _a new_ window with each iteration.

If the latter is okay for you, then something simple like

```
foreach i [1 "first" 2 "second"] [
	break?: no
	if string? i [
		view [
			field i
			button "break"    [unview break?: yes]
			button "continue" [unview]
		]
	]
	if break? [break]
]
```

might do the trick for you.

But if you really want to solve your problem _in only one_ gui, that iterative approach won't do and you'll likely need something more sophisticated, because with an interactive ui you're somewhat leaving the iterative paradigm and enter event based interaction processing and find other ways to "loop" thru the stuff you want to process.

The following approach might give you an idea on one possibility to address this:

```
queue:  [1 2 3 4 5 6 7 8 9 "ten" 11 12 13 14 15 16 17 18 19 "twenty" 21 22 23 24 25]
speed:  5
pause:  does [info/rate: none]
resume: does [info/rate: speed]

process: does [either empty? queue [unview] [refresh string? info/data: take queue]]
refresh: func [state [logic!]] [do pick [pause resume] info/enabled?: okay/enabled?: nope/enabled?: state]

view/no-wait [
	info: field on-time [process] with [rate: speed] return

	okay: button "ok"     [resume]
	nope: button "cancel" [unview]
]
```

[21:53:52](#LbAgkgTauh3G1EfSPjNlFEbb8qry7MACmHvQ9yWDDl4) <gurzgri>:
* lylgithub2021 (lylgithub2021)  The way the question is worded makes me wonder whether the model you're trying to use is a good fit: Saying "I'd like to use _a_ gui" and "_the_ window will stay there" seems to imply that really there is just a single UI / window. Yet with `view` in a loop you're actually setting up _a new_ window with each iteration.

If the latter is okay for you, then something simple like

```
foreach i [1 "first" 2 "second"] [
	break?: no
	if string? i [
		view [
			field i
			button "break"    [unview break?: yes]
			button "continue" [unview]
		]
	]
	if break? [break]
]
```

might do the trick for you.

But if you really want to solve your problem _in only one_ gui, that iterative approach won't do and you'll likely need something more sophisticated, because with an interactive ui you're somewhat leaving the iterative paradigm and enter event based interaction processing and find other ways to "loop" thru the stuff you want to process.

The following approach might give you an idea on one possibility to address this:

```
queue:  [1 2 3 4 5 6 7 8 9 "ten" 11 12 13 14 15 16 17 18 19 "twenty" 21 22 23 24 25]
speed:  5
pause:  does [info/rate: none]
resume: does [info/rate: speed]

process: does [either empty? queue [unview] [refresh string? info/data: take queue]]
refresh: func [state [logic!]] [do pick [pause resume] info/enabled?: okay/enabled?: nope/enabled?: state]

view [
	info: field on-time [process] with [rate: speed] return

	okay: button "ok"     [resume]
	nope: button "cancel" [unview]
]
``` 

## 18-Apr-2025

[10:03:41](#X1DTQwVeVvuEfuYNuYSQYamReQpCd8xPbI0DgPOdJ-g) <lylgithub2021 (lylgithub2021)>:
gurzgri: Thank you so much for these wonderful examples!

