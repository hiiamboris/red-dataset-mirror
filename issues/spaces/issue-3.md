# Comcerning-Resize model Need a powerful simple design idea #3

**State:** closed | **Created:** 2021-08-22T10:07:28+02:00 | **Updated:** 2022-05-02T20:58:41+02:00
**URL:** <https://codeberg.org/hiiamboris/red-spaces/issues/3>
---

You wrote,"Resize model Need a powerful simple design idea, ideally that would apply to faces too"

There was a great deal of work done on this in a program called "Glass" for Rebol an add-on or substitute for VID. He worked on this for 8 years "before" Rebol and then for ten years after he realized that his model was the same as the general programming model of Rebol itself. Supposedly it should fit in as an overarching theme or programming model.

The bad part he quit working on it and I don't know why or maybe not. Could be a total blind ally but what he says about it makes sense. I am not able to judge if he has been completely successful in this.

I believe he has a semi working product or at least a good guide. Now it was first called "glass" I found a recent page where it seems to be called "GLayout". It may be that "GLayout" is a continuation of "Glass". I have no idea. I think it same person though. Here's a quote from the page and if he is correct it sounds exactly what you are looking for.

"...** GLayout is a library which will tremendously increase your current VID capabilities. It basically replaces the complete VID layout algorithm by using nested groups of aligned faces all of which can resize. GLayout also adds many hooks and callbacks to the GUI so that you can better control what happens in your styles. **..."

He says the whole programing idea is based on " dataflow paradigm" which is or appears to be "reactive programming" which is exactly what RED is shooting for it appears he is in this case leading the path the same way that RED is going.

Here's the address of "GLayout". There's several other pages of downloads that go with it linked there.

http://www.pointillistic.com/open-REBOL/moa/steel/glayout/index.html

here's a link to a download of Glass R1 16/01/2011.

http://www.pointillistic.com/open-REBOL/moa/files/glass-distro-R1.zip

If it interest you I have a copy of what I believe to be a slightly newer version of "glass" R003 : 2011-02-01

You may not want to use any of glass but the explanation in his documents of what and how he tried to accomplish what he doing is interesting for a mental framework. Could be helpful. Glass has some demos in the program so you could see what he was trying to accomplish.

I'm not saying this is easy. It's always, ALWAYS, harder to look at someone else's work and then try to make it fit what you are doing but on the other hand it's usually a mistake to start over from scratch and rewrite major pieces of work. Most of the time this is a disaster.(People have noted this over and over)and not to mention this guy worked on this stuff for 18 years, or so he says. So it's likely he may have some experience with the pitfalls and how to avoid them.

I want to really thank you for working on red-spaces. I believe it will be a huge advance. I have thought all along that RED needed a GUI even if it was just lifted from Rebol as a start. I understand the reasons behind not doing so but I believe a cross platform GUI built in is a major advance over other computer languages.

"If" draw can be made to use OpenGL calls for it's draw actions and you build a GUI on top of that then RED would have accelerated graphics for any video card with OpenGL which is most all of them.

Thanks again and my apologies if it turns out this is not of much use to you.

---
## Comments

### Comment by **hiiamboris** (**Posted:** 11-Mar-2022/20:49:10+01:00 | **Updated:** 11-Mar-2022/20:49:10+01:00):

Thanks for kind words and for participation.
It's great to see that this project is of interest to some people!

I did actually review this GLayout project and a bunch of others. Unfortunately GLayout absolutely not impressed me. It has some catchy ideas, but those have more marketing value than anything of subtance. What takes years for some people can be done in hours by others. Besides that number is clearly exaggerated.

As it appears to me, GLayout is so complex and twisted that there's zero value in it. It will just be a waste of time to find anything salvageable. It is also no surprise that it was never really finished.

Spaces are only 4K lines right now, and I will aim to keep it under 10K with all the future bells and whistles. Beauty is in simplicity.

[RebGUI](http://www.dobeash.com/RebGUI/user-guide.html) can to an extent be used later, but more as a checklist of features, to ensure I'm not forgetting anything. I initially decided to take different path with Spaces, so it's not directly comparable, but Ashley is a very talented developer which makes his project worth consideration.

---
### Comment by **hiiamboris** (**Posted:** 12-Mar-2022/19:34:46+01:00 | **Updated:** 12-Mar-2022/19:34:46+01:00):

What's mostly holding this off right now is PR https://github.com/red/red/pull/4529 
Red reactivity system is a proper basis for a sizing system, but it's currently not scalable enough to be used. So I cannot start work on this until that PR is merged.

---
### Comment by **hiiamboris** (**Posted:** 2-May-2022/20:58:34+02:00 | **Updated:** 2-May-2022/20:58:34+02:00):

Automatic sizing system is implemented now without reactivity (though it can be a good addition to it).

---
