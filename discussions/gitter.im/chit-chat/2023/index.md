# Archived messages from: [gitter.im/red/chit-chat](/gitter.im/red/chit-chat/) from year: 2023

## Sunday 8th January, 2023

BaronRK

[19:58](#msg63bb207763c9fc72d31b0c8a)You all my be an interesting group to ask this question.

Is there a thumb drive, that is USB-C, that you can plug into a Windows machine or an Android, and on both, it will ensure your data is secured, and also only requires you to use your thumbprint to unlock on both?

GiuseppeChillemi

[20:59](#msg63bb2ecc7de82d26161c7d13)Nice question, I was searching for something like It too.

[21:00](#msg63bb2ee68f8df4262ae3093e)* I have been...

## Monday 9th January, 2023

GaryMiller

[14:23](#msg63bc23510cd40c2e89ca081c)https://www.kensington.com/p/products/data-protection/biometric/verimark-guard-usb-c-fingerprint-key-fido2-webauthnctap2-fido-u2f-cross-platform/

BaronRK

[16:06](#msg63bc3b94be2c3c20c73e90ef)Gary, cool.

But, that is an authenticator (which is indeed nice), however, I'm speaking of a single memory storage device where the security is already inherent to the device.

If I plug it into a Windows machine, it will need a password to access the data. If I plug it into an Android, same, it would prompt me once for a password.

Simple, clean, but, yet, nope (from what I can tell).

hiiamboris

[16:25](#msg63bc3fe57de82d26161e7b3f)I believe what you're looking for is called VeraCrypt. All that you wished for and without the design &amp; manufacturing costs or vendor lockup.

[16:27](#msg63bc408e51d2482e91fd1bfd)No thumbprint though.

Respectech

[18:42](#msg63bc60320cd40c2e89ca8265)I don't know of any flash drive sized devices, but you might want to check https://www.kingston.com/en/ssd/ironkey-vp80es-encrypted-external-ssd

[18:43](#msg63bc6052c4fec572d678ecb0)But no thumbprint.

BaronRK

[22:39](#msg63bc97af0cd40c2e89caee98)Thumbprint would be nice, but I'm also cool with the one built int the phone or computer for this purpose.

I use VeraCrupt, but it requests quite the overhead to get into things.

## Tuesday 10th January, 2023

BaronRK

[08:56](#msg63bd2830be2c3c20c7405b77)Remember my idea for single input multiple field output?

Others are finally getting this through their heads...

https://twitter.com/vponamariov/status/1612732677966204928?s=20&amp;t=g054yP4z2Xx3t3uRaweEkA

GiuseppeChillemi

[20:45](#msg63bdce793b37dd2c11729231)If you backup to an extermal drive from a NAS, which can't use veracrypt, then you are forced to make clear backups. A finger print based one solves this

[20:47](#msg63bdcef10cd40c2e89cd5728)I have an extermal HD enclosure which uses a PIN of any lenght. It encrypts the drive but It also mounts ISO and VMDK in It as CD and bootable USB HD.

[20:47](#msg63bdcefd8f8df4262ae80fd0)Old but Gold

## Thursday 12nd January, 2023

planetsizecpu

[07:17](#msg63bfb3feff1fd121b33f104e)&gt; I'm speaking of a single memory storage device where the security is already inherent to the device.

Haha, there is no such device. But you can believe it is 😄

## Friday 13th January, 2023

GaryMiller

[07:07](#msg63c1033651d2482e910696e0)Bitlocker built into Windows Pro also allows you to password protect a thumb drive.  
https://www.techjunkie.com/password-protect-usb-drive-windows/

## Saturday 14th January, 2023

BaronRK

[02:26](#msg63c212f051d2482e91082abc)We need a term for something, and since I don't have the term, I will need to describe it (categorise this in terms of George Orwells thought crime, if you don't have a word for it, you can't think of 'it;)

In all the responses about Secure Media (thumb drives, etc.) we can see there is now a product, or service, thus no solution!

Why?

Because most people focus on tasks, solving a thing by thinking the result concluded if a feature or task is accomplished.

Whereas, I'm interested in Goals, or working backwards from a solution.

In my mind, most people are forwards thinking (MBTI Sensing, Packing, Task). I'm interested in backwards thinking (MBTI Intuitive, Mapping, Goal).

MBTI is probably the closest thing we have to describe this.

So back to Media - all of it does not matter if one can't instantly and easily move between all devices (#MaxHeadroom).

GaryMiller

[05:07](#msg63c238af3b37dd2c117aa624)Have you encrypted your USB drive with Windows Bitlocker and now want to use it on another computer? The good news is that you can open a Bitlocker-encrypted USB drive on any other Windows or macOS computer, so long as you have the password or recovery key.

Won't work on a linux box though.

https://www.wikihow.com/Open-Bitlocker-Encrypted-USB-Drive-on-Another-Computer#:~:text=Method

ne1uno

[05:13](#msg63c23a08410c633d4824affb)https://nepva.org/best-fingerprint-usb-flash-drive/

BaronRK

[07:40](#msg63c25c68be2c3c20c749d8c2)Gary - 'Have you encrypted your USB drive with Windows Bitlocker and now want to use it on another computer?'

We're terribly complicating this. This is not about 'Windows' or 'Mac' this is about a simple USB thumbrive being encrypted, and able to be unlocked and read easily between an Android and a Windows machine.

Ne1uno (hmmm, raises eyebrow at 1990s style handle)... yes, you are on the right track.

The page you linked to failed in that nothing there was Type-C.

Although with that info, I found the first line to this:

https://www.amazon.com/Fingerprint-Encrypted-Biometric-Protection-Smartphone/dp/B09ZTYPMQG/ref=psdc\_3151491\_t2\_B09BF6S8RG

Note the ONE (sorry 1uno) rating though :(

Searching around the web, I end up at sketchy products!

This is fascinating to me, and that more of you don't want this same thing I do:

\- A self-contained encryption  
\- USB C  
\- Small  
\- Works in everything that has a C-hole (yes, this is what I'm calling it going forward)

[07:48](#msg63c25e55d8678973f9b00c0f)It would be cool (when you think about it) if it as NFC compatible, and you could use a cell phone to unlock it (does not need to be the cell phone you stuck it into).

hiiamboris

[08:13](#msg63c264264bbc000f093ffe23)Reason good implementation doesn't exist is because market is small. I can only guess why, possibly because people buy these for security. And it shouldn't be too hard to get your thumbprints. Who doesn't care that much is fine with a password.

[11:57](#msg63c298be63c9fc72d328ca5c)Reason Type-C isn't there obviously because it's a new and not yet common port outside phone market, while USB is (I would guess usage of a drive with a phone is much less common than with a computer). Everyone can buy a USB-C-to-USB cable though, so what's unexpected?

GiuseppeChillemi

[21:15](#msg63c31b6963c9fc72d329b450)USB thumb drive has also an heavy security advantage: you don't have to input your PassKey on a device that may be compromised.

BaronRK

[22:09](#msg63c328020cd40c2e89d70c04)1. USB C is now the clear winner (the USB team is a disgrace to EEs and hardware engineers)

2\. The fastest to adopt is Chinese random devices (this is actually one of the things I love about China over everyone else)

3\. I will counter to you're entire point Boris... this is 100% about the intelligence of the market (demand). People should be demanding this, that simple. we need a clean simple encoded way to move data around manually, this is wasting our time.

[22:14](#msg63c32961378d512c186087a3)New topic

= Gaming ChatGPT =

It seems to me, a better thing to be doing (as a programmer) right now is writing WORSE code, and letting ChatGPT fix it for you.

Let me explain...

\- Write code in the most direct boring banal way possible, because...  
\- ChatGPT can have an easier time understanding your code (nothing tricky in it) and can do a better job rewriting it.

It frees the programmer from trying to solve complex things, or worse, TRYING to write elegant code.

hiiamboris

[22:48](#msg63c33125d8678973f9b188bc)I also tend to like USB-C, for two things mainly: it replaces every other mini-USB port, and those were all just unbelievably stupid pieces of engineering, and that it's symmetric.

However is it a 100% winner? It's size is both a benefit (fits small devices) and a drawback (durability). And while port is standard, I hear controllers that are using it are so varied that replacing one is a problem. You're saying people should be demanding it, but first they should be demanding USB-C ports on PCs and laptops (else where to stick it?), and these products have a lifecycle that is at least a few years, so I'm sure we'll be there eventually but you can't rush it. Personally though I have no idea why I would ever want to encrypt a flash drive :) So I also don't know what issues you're having with the VeraCrypt, but given the general state of software of today I can probably imagine...

Chinese companies have not accumulated the inefficiencies of big corps, so they \*can* target niche markets and be profitable. Alas, they also often have no incentive in lasting long, so most of the time they just scam their buyers :) Still, it's like a more decentralized way of conquering the market, which I approve.

[22:56](#msg63c33322ff1fd121b3450032)&gt; ChatGPT

I will disagree here with you. First, because the toaster does not \*understand* the code. It only copies and permutes what it had seen others write, so beyond trivial stuff it's useless. Second, and more importantly, because by building \*anything* we actually \*build ourselves\*. This is our main quest, not the code itself, which is a mere byproduct. By building things lousily we do not advance on our path, we only throw ourselves back. We become the lousiness.

## Sunday 15th January, 2023

BaronRK

[02:40](#msg63c367af63c9fc72d32a36cb)ChatGPT

\- 'the toaster does not understand the code.'

Psst... lol, you know what I have to say about my view of programmers understanding their own code.

\- 'It only copies and permutes what it had seen others write'

That is not exactly correct. It also has a deep understanding of acceptable grammar, which it feeds back into itself.

You're welcome not to agree, but ultimately I'll start at 99.9999% (4 nines) of code is....................... the same.

In other words, as much as you want to be, you're just not that speciail.

hiiamboris

[08:17](#msg63c3b68863c9fc72d32ab704)You've missed my point :)

Oldes

[12:14](#msg63c3ee190cd40c2e89d85180)I must agree with Boris at this topic.

BaronRK

[12:19](#msg63c3ef67d8678973f9b2c2f6)As I would expect from 'programmers' :)

pekr

[12:49](#msg63c3f655fb195421bd865a8e)@hiiamboris - as for USB-C, the standard exists since the 2014, so it's actually not new. For me, the most hated standards are mini and especially micro-USB - those are not symmetrical and sometimes micro-usb from one cable can't work with other device.

I have sent my WTFs to companies like Canon, Mikrotik, Denon, for releasing a micro-USB devices after 2020 .... like - really? What knind of an ancient warehouse you have to visit, in order to get those arcane connectors?

My Lenovo Z13 notebook has just two USB-C connectors. You can use those for data, external gfx and charging. Ppl don't need to ask for USB-C becoming standard on notebooks. E.g. our 4 years old Lenovos all have USB-C for charging.

[12:52](#msg63c3f704fb195421bd865bcc)I hope noone tries to sell me a micro-usb device anymore, or I really risk a mental breakdown :-)

hiiamboris

[12:55](#msg63c3f7a74bbc000f0942bfdd)@pekr :D indeed...

BaronRK

[13:30](#msg63c3ffd93b37dd2c117da383)All strange devices I buy from China at this point are USB-C, even little recharging nightlights, and desk fans.

## Monday 16th January, 2023

rebolek

[08:48](#msg63c50f624bbc000f0944ab4b)I wanted some Rebol code from ChatGPT, it produced some Rebol code, but I was the one who had to fix it and optimize it, not vice-versa. ChatGPT is a nice toy, but only a toy.

henrikmk

[13:34](#msg63c5525f378d512c1864483e)The question is, did you save time by letting ChatGPT write the first outline? In that case, I would not consider it a toy, even if the output is mediocre.

rebolek

[13:38](#msg63c5533f0cd40c2e89dad3c8)Hard to say, I haven't use it for work, I was just testing if it can come up with the right answer for a question I already know the answer for. Because if I didn't know the answer, how could I believe it's not just making things up?

henrikmk

[13:46](#msg63c5552063c9fc72d32d9558)I guess it depends how you use it. If I would ask it to type out a function to traverse an object recursively, I would do it, because it would take shorter time to get that template than if I had to type it out myself.

If you are looking for the final answer, a brilliant, optimized function, I think you're not using it right. That's how I see many people mistakenly believe how it should be used.

rebolek

[13:50](#msg63c5561eff1fd121b348bc26)Nah, I was just curious if it can produce usable BLIT oscillator, state variable filter and some similar functions. It can, with some mistakes, the most common being it uses `if [code1] else [code2]` that wouldn't work.

[13:50](#msg63c556370dba3574237a9850)But you're right about producing templates.

[13:51](#msg63c55663378d512c18645096)The good thing is that if you point that error out, it fixes it.

henrikmk

[13:55](#msg63c5573963c9fc72d32d99a9)I read someone on twitter, who asked it to port a piece of JS code to Python. It did it and it worked correctly. Saved him a day of work. It can probably do the same for REBOL or Red too, even if it means you get a more literal translation than an elegant one.

BaronRK

[22:07](#msg63c5cabdcdadaf23c444e9ea)Other's are seeing the value in this same thing.

https://www.linkedin.com/posts/stevenouri\_chatgpt-artificialintelligence-technology-activity-7020712619036540928-ursO?utm\_source=share&amp;utm\_medium=member\_desktop

I will state right now, this is the win. Meaning, the more we use it, the better it will get.

And I will say again, MOST code should be boiler plate code. The only reason it is not, programmer HAVING to write from scratch.

hiiamboris

[23:05](#msg63c5d82e1bc10223d55b1659)I wonder, \*how* does it get better? Is there supposed to be a feedback loop? "Nah, that was to tal ly wrong! Give it another try!" - does anybody really discuss the result with the bot?

## Tuesday 17th January, 2023

BaronRK

[00:54](#msg63c5f1b34f767f6559698ea1)We clearly need to get someone on that, ensuring a Machine Learning system has a feedback loop. We could get really wild and even allow humans to tip the scales here and there. But let's not get ahead of ourselves.

Oldes

[05:55](#msg63c6383627a20726ca41a1e9)In near feature instead of clicking on images with crossroads we will be fixing bugs in cgbt results to prove that we are humans.

[05:56](#msg63c6388cadcb246d059628ea)Feature = future :)

rebolek

[07:03](#msg63c648288fd386053688a8b8)@hiiamboris  
&gt; does anybody really discuss the result with the bot?

I did. When I pointed out that `if [block1] else [block2]` is wrong, it corrected itself to proper version `either [block1] [block2]`. However, in the next session it made the same mistake. But there is some feedback loop, even if it may be local only.

BaronRK

[08:11](#msg63c6583f2eb56c7441e694fc)Near feature is pretty accurate lol

[08:12](#msg63c6587b8fd386053688c848)Same mistake... wow it reallyis just like a human programmer.

rebolek

[08:13](#msg63c658a9c97ed202519313c5):D

hiiamboris

[09:32](#msg63c66b19adcb246d05968cf0)Amnesiac toaster, great 👍

## Saturday 21st January, 2023

greggirwin

[02:26](#msg63cb4d5e434214494d18e16e)On USB C durability, I'm feeling it now. Have to retire my phone after 5 years because the connector is now loose with any cable I use.

hiiamboris

[08:45](#msg63cba6288e760b51fdfea95f)You might wanna try magnetic cables next time.

BaronRK

[11:04](#msg63cbc6c6603e2b63872095a3)Indeed, I have those butt plugs and magnetic cables on EVERYTHING.

Especially awesome for things like small headsets. but simply the best all said for everything.

They have a version that also allows for data. But both plug and cable have to match (again, #StandardsFAIL).

greggirwin

[17:03](#msg63cc1aebfc90af03489724ed)Indeed.

## Saturday 28th January, 2023

GiuseppeChillemi

[06:20](#msg63d4beb321cada4343b05cf8)More than a year ago, I have written that I was using WIX for my company website. It is a wonderful PAIN. While you can do a lot of things with its engine, the backend is really slow when switching between various functionalities. Moving from one section to another takes up to 1 minute. It is like going back to C64 tapes. I don't understand the reason, is it caused by my "old" I5? (I5 !!!!) Is it caused by my 100Mb connection (100 Mb!). This is not what I can call usability and I feel really frustrated. Until web interfaces will be so slow, I don't think that they could win over local interfaces.

hiiamboris

[09:30](#msg63d4eb1b80dc214e3294d58c)I get many websites load in 5-10 minutes lol. During evening and holidays. At night connection speeds up 100 times and it becomes ok. During summer though, many websites won't load in hours :) So don't worry that much about one minute ;)

BaronRK

[10:49](#msg63d4fdc021cada4343b0c5ea)Boris, you're country might suck :)

[10:50](#msg63d4fde480dc214e3294f641)Side note - I'm about to delve into ~Tilda

GiuseppeChillemi

[19:17](#msg63d574c3624f3f433034a2d2)Advantages ?

## Sunday 29th January, 2023

BaronRK

[03:02](#msg63d5e1ca21cada4343b2513d)Well, thank you for asking...

This is one of those strange things where Website making tools should be super easy. It's $%!@%# layout at the end of the day.

Yes, every tool out there sucks so BAD I truly can't understand it, each one worse than the other. WordPress is unusable, and when you add plug-ins to it they become a different nightmare.

Things like WebFlow and Wix etc. hold your hand so much you can do what you actually want to do.

I've studied about a dozen deeply (and forced myself to really use them).

I can tell you it ultimately comes down to this, you want a tool that:

\- Compatibility - Works perfectly on Mobile and Desktop (I'm talking about the output, not the editor).  
\- Templates - Has really simple templates for common things (top menu, footer, colours, skins, etc.)  
\- Templates/Carousel - Specifically has a carousel feature! And many templates for that. This is the one I find almost all sights use to hook you in and charge you.  
\- Animated (everything can move, text, buttons, fade-ins, etc.)  
\- CMS - Hooks up to 3rd party CMS.  
\- CMS/Video - Specifically handles Video well (and can pull from  
\- Deployment - Can run on your own server (thus subscription free)

I challenge you to show me one that does even half of these in a single system.

Now, that all being said, I keep asking people which system is best given they all suck, what I get back from the hoard is Tilda. That doesn't mean I will like it, but this is the one I plan to torture myself with next.

pekr

[06:02](#msg63d60bed7740c84e4939ad21)I use a photography oriented based web compositor, called Smugmug. It has easy building blocks and works exactly as expected .... for photographers. Watching youtube videos, I can see many influencers being sponsored by Squarespace. Haven't looked into their system yet.

BaronRK

[08:05](#msg63d628e1603e2b63873346c4)Indeed. You can use my CHECK LIST though as a litmus test.

GiuseppeChillemi

[21:22](#msg63d6e394624f3f43303715bf)@BaronRK Wix Is not only a web site builder but also many modules: store, events, reservations, data engine, social integration, blogging, marketing, Operations automation, and many more.

[21:22](#msg63d6e3b221cada4343b40692)I was able to set up and event in 2 days

BaronRK

[23:33](#msg63d70245ec2bfc62867b60d4)Yup, but if it can't do the simple things simply, it's a failure.  
Also, if it can't do ALL the tinhgs on my list, it is a failure.

## Monday 30th January, 2023

GiuseppeChillemi

[00:18](#msg63d70ce6d00f0d4947316b97)I am waiting for the day I could:

```
view-web [
    block [
         Text "Hello user" 
         login: field "enter name here" 
         password: field  "your password" 
         button "Login" [<login-code>]
     ]
    footer template-name [
        text "Everyone is an hero"
    ] with  [
       Copyright: "Prolific"
       Year: 2023
       background:  %sky.jpg
    ]
]
```

[00:20](#msg63d70d45c2911455433f9676)This would be Carl's vision of a simple web.

GaryMiller

[01:16](#msg63d71a54ec2bfc62867b8b3d)It would be nice to have a "Theme" setting defined so all the web pages have the same font, size, color, etc...

Standard theme's could be objects that you could override one or more settings for.

BaronRK

[05:08](#msg63d750dc603e2b6387356de7)YES!

## Wednesday 1st February, 2023

hiiamboris

[21:13](#msg63dad5dc0c93272347077182)me&gt; Does chatGPT train itself when it interacts with the human?  
chatGPT&gt; No, chatGPT does not train itself when it interacts with the human. It uses a pre-trained language model to generate responses that are based on the user's input.

BaronRK

[23:24](#msg63daf4a4ab2bdb2b698ebe6f)The Monkee's predict ChatGPT.

https://www.youtube.com/watch?v=Te\_kc3iHock

ne1uno

[23:35](#msg63daf73458c7fc1a839a09e3)https://analyticsindiamag.com/battle-of-ai-coding-assistants-github-copilot-vs-amazon-codewhisperer/

## Thursday 2nd February, 2023

BaronRK

[02:02](#msg63db1998bf77a5243282f5d7)StandardYogurt

https://www.prolific.com/qwiki.cgi?mode=previewSynd&amp;uuid=76X7MU8CKA3S894S69N61CVDE6QT

## Sunday 5th February, 2023

GaryMiller

[09:28](#msg63df76caeddd71596c16bea3)@hiiamboris It does not train itself but rather human QA has to provide correct training examples so that the next time they retrain is will learn a more proper response or add additional learning material for it to base a correct response on.

hiiamboris

[10:31](#msg63df858b4a6a70544c897b35)"correct response" indeed. Total mass indoctrination 20 years from now.

[13:15](#msg63dfabda6fc5ff38e44bc825)Have you tried to introspect the toaster? https://pastebin.com/gRmtxS2e

[13:15](#msg63dfabf0c841ba597f2ccb19)I wonder if it's making it all up completely or has a very vague idea of what "last" means.

ne1uno

[23:15](#msg63e0388a195b0f6482839c31)https://www.searchenginejournal.com/openai-chatgpt-update/476116/ 

[23:15](#msg63e0388a480b726318af1db3)-- OpenAI's ChatGPT Update Brings Improved Accuracy: "Jan 10, 2023 ... While ChatGPT may be more accurate now, its knowledge is still limited to 2021 data.

## Monday 6th February, 2023

hiiamboris

[10:18](#msg63e0d412480b726318b032ed)Problem is not the date, but that a slight change in request totally changes the contents of the answer.

[10:20](#msg63e0d450511fff631f69dd85)Generally try making it produce some list, and then the same list with an added feature (e.g

[10:20](#msg63e0d45d195b0f648284b753)e.g. sources of info).

[10:20](#msg63e0d47ef4ead81aa3625d18)Added feature makes it forget what the list was supposed to be about :)

ne1uno

[11:11](#msg63e0e055195b0f648284d14d)I looked into some youtubers on copilot &amp; chatGPT yesterday. `webchatgpt` browser extension can also do searches to supplement the prompt. there's a randomize to its responses.

[11:11](#msg63e0e055c841ba597f2f047a)I was taking apart a logo version of Eliza from radioshack around 83, I think we have way more data and obviously better NLP by now. incremental change can be transformative too.

[11:11](#msg63e0e055f4ead81aa36274b5)the competition is really on now

[11:13](#msg63e0e0ee747c6938e1052236)google event wednesday expected to make some announcements AI related

hiiamboris

[11:15](#msg63e0e16c6b829e1a9a7ce90c)Yeah, google must come up with their own and better AI ASAP or they lose the war

[11:21](#msg63e0e2d2c841ba597f2f08f6)I guess what they might be able to answer with is integrate it for free into the search string.. as long as you're logged in :)

[11:23](#msg63e0e318511fff631f69f9b6)(and thus pay with your data :)

[19:24](#msg63e153f06b829e1a9a7dd250)Now this really made me laugh. \[TweetGPT](https://chrome.google.com/webstore/detail/tweetgpt/lkjblpoingopdeaofcaapmeoojjjnhnc)  
&gt; Writes tweets with chatGPT

Indeed, why would humans bother thinking on what to respond? :)  
Let the bot write tweets, and the same bot answer tweets. Now Musk doesn't even need to flood the twitter with bots mimicking humans to affect the mood of the masses: humans will disguise as bots themselves! So twittersome...

ne1uno

[19:29](#msg63e155286fc5ff38e44eeed3)https://blog.google/technology/ai/bard-google-ai-search-updates we're all going to need bot detection technology

greggirwin

[19:56](#msg63e15b8a62844178f6e99243)Just as trust often stems from knowing who a person really is, when interacting virtually, acknowledging that anonymity can be important in many cases, should there be rules about generated content being digitally signed as such?

ne1uno

[20:02](#msg63e15ce54a6a70544c8cfb53)opinion too, most reliable news sources label if not also in the headline. buzzfeed, after catching cnet using AI with gross errors ,now say they will use AI generated stories too. it's snowballing

pekr

[20:03](#msg63e15d04eddd71596c1a6804)Could you please ask the AI engine, when Red is going to reach 1.0? :-)

ne1uno

[20:08](#msg63e15e594a6a70544c8cfe5a)&gt;Red Programming Language is expected to reach version 1.0 in Q3 2023 according to \[2]. This goal was set after 12 months of intensive work targeting the 1.0-beta milestone \[2]. The planned beta period for 1.0 is 2-3 months with a goal of a polished, rock-solid, production-ready release \[2]. source is blog

hiiamboris

[20:12](#msg63e15f396b829e1a9a7dead7)funny, my schizophrenia-with-nuts is older than yours?

me:  
&gt; When Red programming language is likely going to reach 1.0 version?

ChatGPT:  
&gt; At this time, there is no official release date for the 1.0 version of Red. However, the official website states that the goal is to release the 1.0 version of Red in 2021.

ne1uno

[20:14](#msg63e15f8a6fc5ff38e44f0200)I'm using the extension, it pushes search results into the prompt.

hiiamboris

[20:14](#msg63e15f99f0c41678f3b21edd)I see

ne1uno

[20:16](#msg63e16000747c6938e1063055)https://github.com/qunash/chatgpt-advanced/ webcharGPT

[20:16](#msg63e16012c841ba597f3006c3)webchatGPT

hiiamboris

[20:19](#msg63e160efc841ba597f3008aa)I'm using a telegram bridge for more privacy

ne1uno

[20:26](#msg63e16269747c6938e1063538)needs telephone verify too.

[20:26](#msg63e16269480b726318b15ab9)copilot out of beta is pay after 60 day trial except students &amp; popular opensource, whatever that means

[20:26](#msg63e16291f4ead81aa363889b)^popular opensource developers

## Tuesday 7th February, 2023

GiuseppeChillemi

[14:00](#msg63e25993f4ead81aa36556dc)The new PC is here. The speed difference editing a WIX site is HUGE. This damn web APP was sucking all my processor cycles, so it was not a problem of the connection but computing power.

[14:01](#msg63e259a59c90f8647b3192d9)Were is my amiga when I need speed?

## Wednesday 8th February, 2023

rebolek

[09:41](#msg63e36e5bc841ba597f33d8c4)You can of course buy Amiga and use it :)

GiuseppeChillemi

[09:58](#msg63e37235f0c41678f3b60494)We need its spirit, not really its speed :-D

rebolek

[10:09](#msg63e374f7f4ead81aa3676e63)But the spirit lives on. I am happy user of originally Amiga text editor, Vim. I can run it on DragonflyBSD, developed by Amigian Matt Dillon. And so on.

hiiamboris

[21:34](#msg63e41573f0c41678f3b743fd)So M$ that \[invested $10B](https://www.crunchbase.com/funding\_round/openai-corporate-round--68edca00) into OpenAI 2 weeks ago and now owns 49% of it's shares, was quick enough to plug it \[into their Bing](https://www.cnbc.com/2023/02/08/microsoft-bing-vs-openai-chatgpt.html).

[21:36](#msg63e415c19c90f8647b34e4ae)The fight is on. Get your popcorn ready.

ne1uno

[21:37](#msg63e4160362844178f6eeb490)https://www.engadget.com/amp/google-bard-chatbot-false-information-twitter-ad-165533095.html

[21:37](#msg63e4161feddd71596c1f8a9b)&gt;Google’s Bard chatbot confidently spouts misinformation in Twitter debut

[21:39](#msg63e41699da007e5447793f53)I got chat in bing, now I can have non factual results to sift through

hiiamboris

[21:44](#msg63e417a39c90f8647b34e866)I don't remember seeing a single public \*human* speaker/writer who provided only \*factual* statements ;)

ne1uno

[21:45](#msg63e41803da007e544779420c)search was always hit or miss. bing will cite, so it may be an improvement. more complex search terms

## Thursday 9th February, 2023

BaronRK

[00:14](#msg63e43b03bc9d0759c16029ce)'We need its spirit,' #Amiga

I often describe devices as 'it feels like an Amiga person made this' :)

Highest compliment I can give.

Bing AI - their Image search is better by far (although sometimes I use Yandex which also has a useful search.

\[in the before time, I used to STEAL images from Russian Magazines to use in America. Aside from the irony, as proven, no one ever cam seeing me for Copyright :)]

[00:17](#msg63e43b96bc9d0759c1602b2d)typo -&gt; came suing me'

\[Grammarly is SO slow it fails to catch my errors before I hit POST. I wish it had a 'hold on, we are still running billions of operations to fix 'teh' to 'the']

GiuseppeChillemi

[07:43](#msg63e4a41ecd508f5c5ff58f5f)&gt; But the spirit lives on. I am happy user of originally Amiga text editor, Vim. I can run it on DragonflyBSD, developed by Amigian Matt Dillon. And so on.

The spirit accompanies people which have been around the Amiga, even without the Amiga. It will be forever with them, in their lives. Amiga developers have learned how important memory usage and correct handling of pointers is. On my PC, 30 years after, some programs lose control of themself if I run out of disk space and memory. Multiple times files have been corrupted or deleted because of this.

[07:47](#msg63e4a50d5357366b72770e3e)Also speed, when you rely on the user's pocket money and new processors for the speed you develop, when there is not enough money in the pocket nor processors like it was 40 years ago, you optimize.

[07:49](#msg63e4a59de903521e26641b51)Living in difficult and harsh environments lets you build skills you will never have if you live in comfortable worlds without difficulties.

hiiamboris

[09:11](#msg63e4b8d09798d11e2c5d7e3d)@BaronRK you mean direct image search (by text) or inverse (search by image)?

ne1uno

[09:27](#msg63e4bc967648e47d55d286e8)both are decent but not always on the first search. crop, more specific terms etc

BaronRK

[09:28](#msg63e4bccb5357366b72773bca)I like it all. Google's is not great except in their apps.

ne1uno

[09:30](#msg63e4bd2d9798d11e2c5d8653)new google lens image search does the destroy all apps calling it thing they do but is usable

hiiamboris

[09:44](#msg63e4c0935357366b7277427a)I need to try it with some hard to find images.

[09:54](#msg63e4c2dfbc9d0759c1611947)Nah, even bigger failure than google

[09:57](#msg63e4c3779798d11e2c5d935a)Also they haven't even managed to get content scrolling working in Vivaldi

[09:57](#msg63e4c37d84f6b75c6f1c2bad)Pathetic

ne1uno

[10:01](#msg63e4c477bc9d0759c1611b90)browser wars

hiiamboris

[10:02](#msg63e4c4adb1f15b2e62331690)Indeed

ne1uno

[10:04](#msg63e4c53ed97eaa59cdfdc814)bing reverse image still worked a few days ago advanced chrome fork 74. couldn't find \[this] (https://i.etsystatic.com/6345631/r/il/37add8/4304185848/il\_680x540.4304185848\_kyww.jpg) but google did.

## Saturday 11st February, 2023

dsunanda

[15:24](#msg63e7b31db1f15b2e62387f12)There's a new world, or possibily an apocalyse, coming to Gitter in a couple of days:  
https://blog.gitter.im/2023/01/16/gitter-is-going-fully-native-matrix-in-feb-2023/  
Hope we all survive the upgrade......

hiiamboris

[15:32](#msg63e7b527ee00e6232c11b14c)oh crap

[15:35](#msg63e7b5aee903521e2669a60b)&gt; If you want to export your data from Gitter and migrate somewhere else, the tools built-in to Gitter will only be available until the cutover. Then you will need to use the Matrix API and tools available for migration.

[15:35](#msg63e7b5c0d97eaa59cd03348c)@rebolek last chance to make backups :/

[16:38](#msg63e7c474450b707d6f511435)the look of a typical desktop matrix client after 3 years of active development says it all:  
!\[](https://i.gyazo.com/f43f32ee42832adc51790ffa2468158d.png)

GaryMiller

[17:18](#msg63e7cdd1a6a7c26b6b3ab799)Might be a good time to run for Discord! All the new languages seem to be represented there! I never liked Gitter that much Only Red, Nuitka, Crystal and Nim I follow on Gitter. But mostly just Red.

hiiamboris

[17:19](#msg63e7ce25e903521e2669d4d5)discord is \*\*much\** more bloated than even element

[17:20](#msg63e7ce4c7648e47d55d8247f)basically 1 chat tab will load whole CPU core

greggirwin

[19:59](#msg63e7f38aee00e6232c121df2)Thanks for the heads-up on this @dsunanda!

## Sunday 12nd February, 2023

BaronRK

[03:59](#msg63e86411b1f15b2e6239bb6c)Hmmm, seems like a good time for me to post this other rant here :)

I finally wrote up my issues with basic Website Building tools.

https://www.prolific.com/qwiki.cgi?mode=previewSynd&amp;uuid=FN5FFABUN632Y4VBYUD8EY4713QT

greggirwin

[20:15](#msg63e948ef5c4911212839026d)With the coming Gitter change, here's a backup channel we can use for issues https://github.com/red/red/discussions/5282
