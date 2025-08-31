# Archived messages from: https://app.gitter.im/#/room/#red_porting:gitter.im (https://app.gitter.im/#/room/!ydUdwdCOpuYwfpXbGq:gitter.im)

## 11-Feb-2021

[1:06:12](#KIxxkCm0HWCepISBz-Ssvr0cMirFGSu-Ao1_Bh9ahl4) <GiuseppeChillemi (GiuseppeChillemi)>:
Thank you @greggirwin for opening this Gitter Room.

## 6-Jun-2021

[22:15:21](#-s0DIzBnSAu0lSRx4cZTd8gRne-lkeXbcUNPKN2VhIs) <GiuseppeChillemi (GiuseppeChillemi)>:
@hiiamboris @toomasv @qtxie @greggirwin @rebolek @henrikmk  
I have asked Gregg to open this area because I think we can port old Rebol code and also whole projects, elements, and functionalities from the outer world, like UX elements.
About these last components, once @hiiamboris project will be complete, I think we could port UX parts from the best visually appealing open source UX toolkits, extrapolating just the drawing commands which should be universal as Geometry is. Later we could port complex one with their functionality.
This could give our language modern UX elements. 
I have not deep knowledge of the GUI universe but I see it as an easy and viable solution. Which is your PRO view of this idea? Do you think a project like this would be possible?

## 7-Jun-2021

[8:27:15](#8NGlmjQh2v8lBG132futOJClZrYG6mBtZJ5Sav_HIv8) <hiiamboris (NOT THIS ONE)>:
Porting only applies to Rebol code. From other languages code that should be called "drawing inspiration".

[8:40:06](#HKVnU1mnREuKVO2NgDPOfj1agMlVW4-H9OaJ81qC64k) <hiiamboris (NOT THIS ONE)>:
Anyway, for this room to be of value, I suggest users of Rebol post links to code that in their opinion can be a good addition to Red ecosystem. Requirements for that is to answer: is this code still useful in modern times? is it hard to do the same in Red without porting anything? did no one port it yet? why didn't you port it? is this project not on Red roadmap? should it be part of the language's runtime or a separate module?

[13:02:55](#Wgv4UTPU2wdqK5KpufqBBrMyD8YQ75Imjo4iRmBd-go) <GiuseppeChillemi (GiuseppeChillemi)>:
@hiiamboris there a lot of beautifully styled elements on many user interface toolkits.  My idea is to take the geometry drawing instruction inside their source and replicate it to Red DRAW instructions, nothing more, nothing less. 

[14:29:42](#K6eCmOlGEhhhWvSoOoHd2eKgKcyVGjy6ZQIbGAoeVlE) <GiuseppeChillemi (GiuseppeChillemi)>:
Has your engine a skinnable structure, so one could change Widget styles on the fly?

[16:01:10](#2-pQL2D4JKBXa2ql2E-q7j-juJpH206CYoOvmwyi1iA) <hiiamboris (NOT THIS ONE)>:
Absolutely.

[17:13:46](#kSooVoMOv5bubXqZKVkayt0K9blnnfA5KxMzaBrxWok) <GiuseppeChillemi (GiuseppeChillemi)>:
Perfect! 

[19:53:49](#dn6ZnxGPppciBOxXIkrWWaDoUTcXDC660E2yxubJrpg) <GiuseppeChillemi (GiuseppeChillemi)>:
As for Rebol, there are many interesting scripts to port. PDF dialect is one of them.

## 17-Jun-2021

[9:53:20](#wakBdRTxEBmrGXHf8_pRhB4yFK2i6Ngc86BlLZlz__s) <endo64>:
We should not forget to check their licences and ask for permission if necessary before porting a script or a part of it (extract a function etc.)

[13:48:51](#OJ9gCDo03c8dZC9E7aUYvQnFF5FEClQkUdHy9JXsPsY) <GiuseppeChillemi (GiuseppeChillemi)>:
Yes, and contact the author when license is missing or we need to change it. 

[13:50:24](#XxyX7nBmkfPwG3TaepVZ_YRR6LJeVd0iDaX72qc_kVs) <GiuseppeChillemi (GiuseppeChillemi)>:
While the whole rewriting of the script functionality, maintaining the same data interface, needs no licence.

[13:51:08](#cBn9kUFsge7cqj6C2zOkT2B8_pbqtjylRUuMp5J9TEY) <GiuseppeChillemi (GiuseppeChillemi)>:
* While the whole rewriting of the script functionality maintaining the same data interface, needs no licence (Please, correct me this is not correct)

[13:51:35](#FUI2Bo4Ud8PPaMI0JNw-ADCclb5MTHDfYdu1fl3gBkQ) <GiuseppeChillemi (GiuseppeChillemi)>:
* While the whole rewriting of the script functionality maintaining the same data interface, needs no licence (Please, correct me if this is not correct)

