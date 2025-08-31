# Archived messages from: [gitter.im/red/training](/gitter.im/red/training/) from year: 2022

## Friday 12nd August, 2022

loziniak

[10:10](#msg62f626f805ad4a37012b0611)We have 20 exercises already on Exercism ready. I'll get our language track through release proess, and we're ready to go! So, now we need some mentors to check people's solutions and perhaps coach them a little :-)

https://exercism.org/mentoring

Anyone interested? I'll also do this for sure, but I'm not feeling super-knowledgeable about Red, so probably someone would be better for this task. I'll let you know here, when our track will be released.

I wonder how many people will start submitting exercises. Will we have a flood of curious developers, or just nobody will notice :-D

[10:20](#msg62f62954b16e8236e3b4f052)https://github.com/exercism/red/issues/31

## Monday 15th August, 2022

endo64

[16:20](#msg62fa72356837563d1c2e1679)👍

## Thursday 18th August, 2022

loziniak

[09:43](#msg62fe09b211a6a83d0428ad03)Please, give it a warm welcome!  
https://exercism.org/tracks/red

[10:12](#msg62fe107ccf6cfd27afff5d73)thanks @dander and @wallysilva for your involvement! anyway, it's just a beginning :-)

dockimbel

[12:03](#msg62fe2aaa9d3c186299745fe0)Congrats! :+1:

[12:04](#msg62fe2acb443b7927a7897a1d)This page is outdated: https://exercism.org/docs/tracks/red/installation

[12:36](#msg62fe32646837563d1c48e586)About the "Resistance Color" exercise, it's not clear from the instructions and template code (unless I missed it) if the color is passed as a string or a word. Is it part of the exercise to figure it out?

greggirwin

[16:13](#msg62fe650c443b7927a78b17dc)Thanks for continuing on this @loziniak.

zentrog:matrix.org

[23:08](#msg62fec65e05ad4a3701686b6f)Yeah, great job getting this off the ground! It will be interesting to see what sort of engagement it will get

## Monday 22nd August, 2022

zentrog:matrix.org

[19:26](#msg6303d85e647d633cf6bbce8d)I didn't realize this before, but the Red Exercism exercises can be worked on tested, and submitted all right from the browser! I guess it just runs them through the cli console inside a docker container?

dockimbel

[20:33](#msg6303e829647d633cf6bc4075)So far, I did all my exercices there online, I was surprised to see that it was supported. :+1:

## Friday 2nd September, 2022

riprwwa

[05:25](#msg631193c33a42316d33cef533)@loziniak thank you for the exercises! A couple points:  
1\. It's not always obvious what format the results should be in. Example: I'm doing resistor-color-trio now, and it \_seems_ to require a map, but I'm not entirely sure... initially I thought it was just a string  
2\. "How to debug" - it would be great if one could see the exact errors they were getting on that website, instead of copying code to and from their local console. Not sure how feasible this is, though.  
Again, thank you for making these available!

[09:08](#msg6311c80daa09177429ed978b)I'm at "SGF Parsing". I must say, I got quite frustrated trying to write the largest product solution, as, again, it's not clear how errors are supposed to be presented. I tried initially to return an object with an "error" word inside, no luck. Using "cause-error" worked, but it's not obvious, nor user/beginner-friendly.  
I guess if I want to be helpful I can submit some PR to this repo? https://github.com/exercism/red-test-runner

dockimbel

[09:51](#msg6311d239f4d7a323deb2c6bc)@riprwwa Thanks for the feedback. Please do submit some PR for improving the exercices.

zentrog:matrix.org

[23:52](#msg6312974005ad4a3701d1c119)I’ve been a bit unclear in general on best practices for error handling. I tend to prefer `do make error! “Error message”` right now over `cause-error`, but I would like an easier way of doing it.

[23:53](#msg6312977c443b7927a7f5e93f)We could add some more explanation about what is expected in some exercises too

## Sunday 4th September, 2022

loziniak

[14:00](#msg6314af8472ad51741fc46806)@riprwwa main repo for Red track is this: https://github.com/exercism/red , and \*red-test-runner* is just a piece of track tooling. Thanks for great feedback! I'll try to address all the issues soon, and you can also try if you want :-)

## Sunday 18th December, 2022

loziniak

[20:56](#msg639f7e8fa151003b5a754752)80 students, 743 solutions until now on Red Exercism track!  
https://exercism.org/tracks/red/build

greggirwin

[23:00](#msg639f9b7b07ac190597fc0db1):+1:

## Monday 19th December, 2022

zentrog:matrix.org

[21:28](#msg63a0d79ba1ba3e75d80506d0)Have people been submitting requests for mentorship? I haven’t delved into that area in so far

## Wednesday 21st December, 2022

loziniak

[17:09](#msg63a33db3378d512c1825f9bb)On the Build page there are only 2 sessions listed. I did not see any mentoring requests beyond these.

hiiamboris

[17:16](#msg63a33f54c9591d20d367c092)I think I applied to mentor there before, but didn't get any emails so far. I have to admit though, whole exercism website looks completely opaque to me. I just don't get it.

[17:18](#msg63a33fdd410c633d48eb83bc)If I was their boss I would fire whole UX team right away.

## Thursday 22nd December, 2022

riprwwa

[02:32](#msg63a3c1a2be2c3c20c711ad2e)Maciej and I had 2 mentoring discussions, they might be those 2 listed on the build page? :) (thanks, Maciej!)

## Saturday 24th December, 2022

loziniak

[00:05](#msg63a6425dd8678973f97c59eb)It was empowering, thanks too! :-)

[11:36](#msg63a6e42963c9fc72d3f5e1e2)@hiiamboris  
&gt; If I was their boss I would fire whole UX team right away.

file a bug! :-)

hiiamboris

[12:06](#msg63a6eb55c9591d20d36e5b56)(: I feel like these worst UX of the year competitors spawn every day, but I'm just one person.

[12:07](#msg63a6eb698f8df4262abe17ba)Latest competitor: Mysterium VPN.

loziniak

[12:11](#msg63a6ec64d8678973f97d6d8a)I feel UX is often a matter of fashion, not science.

hiiamboris

[13:15](#msg63a6fb7cc9591d20d36e7588)Unfortunately...
