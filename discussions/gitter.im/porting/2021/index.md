# Archived messages from: [gitter.im/red/porting](/gitter.im/red/porting/) from year: 2021

## Thursday 11st February, 2021

GiuseppeChillemi

[01:06](#msg602483030eed905f18a62c36)Thank you @greggirwin for opening this Gitter Room.

## Sunday 6th June, 2021

GiuseppeChillemi

[22:15](#msg60bd48f820e86942d2492e93)@hiiamboris @toomasv @qtxie @greggirwin @rebolek @henrikmk  
I have asked Gregg to open this area because I think we can port old Rebol code and also whole projects, elements, and functionalities from the outer world, like UX elements.  
About these last components, once @hiiamboris project will be complete, I think we could port UX parts from the best visually appealing open source UX toolkits, extrapolating just the drawing commands which should be universal as Geometry is. Later we could port complex one with their functionality.  
This could give our language modern UX elements.  
I have not deep knowledge of the GUI universe but I see it as an easy and viable solution. Which is your PRO view of this idea? Do you think a project like this would be possible?

## Monday 7th June, 2021

hiiamboris

[08:27](#msg60bdd86284c2f15b7966f727)Porting only applies to Rebol code. From other languages code that should be called "drawing inspiration".

[08:40](#msg60bddb651477ff6954a5dc51)Anyway, for this room to be of value, I suggest users of Rebol post links to code that in their opinion can be a good addition to Red ecosystem. Requirements for that is to answer: is this code still useful in modern times? is it hard to do the same in Red without porting anything? did no one port it yet? why didn't you port it? is this project not on Red roadmap? should it be part of the language's runtime or a separate module?

GiuseppeChillemi

[13:02](#msg60be18fe3908f1017439e790)@hiiamboris there a lot of beautifully styled elements on many user interface toolkits. My idea is to take the geometry drawing instruction inside their source and replicate it to Red DRAW instructions, nothing more, nothing less.

[14:29](#msg60be2d555bf7ed10d3e8ae3e)Has your engine a skinnable structure, so one could change Widget styles on the fly?

hiiamboris

[16:01](#msg60be42c51e6aa460c016cae0)Absolutely.

GiuseppeChillemi

[17:13](#msg60be53c91e6aa460c016f6e4)Perfect!

[19:53](#msg60be794c1477ff6954a76184)As for Rebol, there are many interesting scripts to port. PDF dialect is one of them.

## Thursday 17th June, 2021

endo64

[09:53](#msg60cb1b8f5e8dfc4f11875c03)We should not forget to check their licences and ask for permission if necessary before porting a script or a part of it (extract a function etc.)

GiuseppeChillemi

[13:48](#msg60cb52c2b317311354358af8)Yes, and contact the author when license is missing or we need to change it.

[13:50](#msg60cb531fa5d5740d612db1be)While the whole rewriting of the script functionality maintaining the same data interface, needs no licence (Please, correct me if this is not correct)
