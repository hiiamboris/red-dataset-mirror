
#4755: Operators "and" and "or" evaluate value2 operands even when not needed for logical operations
================================================================================
Issue is closed, was reported by zwortex and has 10 comment(s).
<https://github.com/red/red/issues/4755>

In most language the conditional operators do not evaluate the second operand if it is not needed : c, java, javascript, lisp to name a few. 

Yet Red does not distinguish conditional operators and bitwise operators. Of course, **all** and **any** can be used instead, as in (1) and (2), but they are likely to be overlooked whenever there are only two operands, as in (3) and (4) :
```
a: "1"
all [ (string? a) (print "Expected") ] ; (1)
any [ (integer? a) (print "Expected") ] ; (2)
(integer? a) and (print "Not expected") ; (3)
(integer? a) or (print "Not expected") ; (4)
```

Is it possible to distinguish between the two operations and have the conditional operators evaluate conditions one at a time ? Alternatively, why not rename the current operators so as to make sure they are reserved for bitwise operations and use any or all exclusively for conditional operations ?

That would prevent probable misteps.


Comments:
--------------------------------------------------------------------------------

On 2020-12-09T22:20:50Z, hiiamboris, commented:
<https://github.com/red/red/issues/4755#issuecomment-742100086>

    You seem to be ignoring [my previous post](https://github.com/red/red/issues/4746#issuecomment-740784063)?

--------------------------------------------------------------------------------

On 2020-12-09T22:56:38Z, zwortex, commented:
<https://github.com/red/red/issues/4755#issuecomment-742115684>

    Hi Hiiamboris, I don't think I am. I have a couple of issues that I am happy to discuss in a chat. This one is not among them. Most languages do not handle and/or conditions like Red does. This certainly creates confusion and could be avoided. I have an extensive undestanding of what an issue is : anything that can be a source of defect, especially with developers that are not savy ones should be avoided, whenever possible. I understand perfectly however that you might consider this over the edge and that Red/issues is not the proper place to address such requests. As I said, I don't feel that the chat is a proper place either but you may have a dedicated place for filling such requests ? I would be happy to transfer my wishes there. Regards.

--------------------------------------------------------------------------------

On 2020-12-09T23:32:00Z, hiiamboris, commented:
<https://github.com/red/red/issues/4755#issuecomment-742130024>

    First of all you should understand that this road leads nowhere. Nobody's gonna change the design of a language at a whim of a first newcomer. From our perspective everything that looks logical to you may look totally different to us, as you may have guessed. I realize that a lot in Red may not look familiar if you come from a rigid compiled language like C, but behind such basic aspects are usually years and years of design and battle trial. Red and Rebol draw their power in part from not following the fashion. Instead they invite you to open your mind to completely new ways of thinking.
    
    So, here's the thing. If you want to change something, it is your burden to convince us that your design is better. And to do that you have to show us that you understand Red on a deep level. And for that, you have to learn Red first. There is no other way ;) Just entering here and spamming us with "other language does it this way" tickets will only earn you a bad rep. That's why I direct you, again, into the chat. If you do aim to learn and understand Red, in the [help room](https://gitter.im/red/help) you will most likely get a meaningful explanation and feedback from both Rebol veterans and beginners like you. Please, respect our rules, and one of them is that issue tracker should be used for reporting bugs ;)

--------------------------------------------------------------------------------

On 2020-12-10T02:25:42Z, greggirwin, commented:
<https://github.com/red/red/issues/4755#issuecomment-742193137>

    >  I have an extensive undestanding of what an issue is : anything that can be a source of defect, especially with developers that are not savy ones should be avoided, whenever possible.
    
    1) That's not the Red way. Not that we want defects, but it's a very, very, almost infinitely flexible language. You can make stricter versions of it, or dialects, if you so choose.
    
    2) As Boris noted, our goal is not to be like other languages in every way. Some yes, some no. Familiarity can make things more accessible, but people are only beginners for a short time, and we need to look at the big picture.
    
    3) What you point out is simply an optimization, not a defect. It's an implementation detail. If you write code expecting the second argument to be short circuited, you're asking for trouble, and not just in Red. But this also points out that `and/or` are not as idiomatically Red as `any/all`, so we guide people to them.

--------------------------------------------------------------------------------

On 2020-12-10T02:29:31Z, greggirwin, commented:
<https://github.com/red/red/issues/4755#issuecomment-742194253>

    The advantage of chat is that more people participate, and the core team doesn't see issue counts rising and taking time to review them out of band.

