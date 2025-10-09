# Archived messages from: https://app.gitter.im/#/room/#red_red/system:gitter.im (https://app.gitter.im/#/room/!BhWlXLpqdMBywuNhZV:gitter.im)

## 2-Dec-2020

[20:50:07](#0ACiozNA5uJUbIFKphEYMcuPN74cV3SPzIppYoMoPl8) <hiiamboris (NOT THIS ONE)>:
that's exactly how it works

## 3-Dec-2020

[17:08:35](#9KT9YI2k0IkLuyWFWVvfG7lqbQc1YitkYE3JYztCRrQ) <vazub (VaZub)>:
@greggirwin are there any preliminary discussions to have freestanding compile target at some point? 

[18:55:57](#8-xsYj0ySYk46tp5zLvQ0axPO4YWM46SSdN5gSCIU84) <greggirwin (Gregg Irwin)>:
What does "freestanding compile target" mean? You can compile EXEs with no dependencies today.

[19:10:43](#xkEwQRiIFAaYaxKE9sDiSPYnvHVoTLdiaOuK1iRqwuU) <vazub_gitlab (VaZub)>:
I mean flat binaries and bare-metal target

[19:12:20](#SfnkBuHgGXcCujvp2oXqkjCwuaXCnDksyw9eDD1SFp8) <vazub_gitlab (VaZub)>:
Assuming I want to go really low-level and do some arcane OS or even BIOS-level development (don't ask why 😃)

[19:27:49](#HW3PgJLQc8zPV6xvIQ9tV9GrvvbsVmAgJxbemm2HBHA) <greggirwin (Gregg Irwin)>:
@BeardPower has already done some of that. Until someone goes down that road a bit, we won't know what features are missing, or most helpful.

[21:38:48](#-TONu1rO8KD1Ky62_8NwAW2myyCTd19DZL37qMCh_GQ) <GiuseppeChillemi (GiuseppeChillemi)>:
@hiiamboris thank you, the dialect is nice. Finally I am there.

## 6-Dec-2020

[11:10:51](#lwJ_aE4pPU-o0EoIfxQp1gvSsJSCTfqLbjX8ugftJPY) <vazub_gitlab (VaZub)>:
> What does "freestanding compile target" mean? You can compile EXEs with no dependencies today.

I might be mistaken, but I believe there seems to be an inherent dependency on C library by default, at least for POSIX targets that I looked into. Would be interested to learn more whether Red/System actually allows to omit this dependency.

[11:11:07](#_7Lzacwr_wfKnuS5T9u1j-BrdMMLdaFZPZ0mg8BNTkQ) <vazub_gitlab (VaZub)>:
* > What does "freestanding compile target" mean? You can compile EXEs with no dependencies today.

I might be mistaken, but I believe there is an inherent dependency on C library by default, at least for POSIX targets that I looked into. Would be interested to learn more whether Red/System actually allows to omit this dependency.

## 7-Dec-2020

[21:08:43](#JdsfUiusR806wu_YFLnbY26SqrSUBQEeq-08wP1BkNQ) <vazub_gitlab (VaZub)>:
Answering my own question above - apparently specifying the `--no-runtime` compiler option does the trick - the executable gets produced with no lib or system dependencies whatsoever. Will dig deeper then)

[21:14:00](#t6n2-Wf8xKLLvZZ6fKcXC9hVcId-NtndiXW2NZX3vxo) <greggirwin (Gregg Irwin)>:
:+1: Sorry nobody else was able to jump in, but glad you figured it out.

## 10-Dec-2020

[8:56:15](#tQywq7wH7BcyBe594CQPTrqZqpTBG0mLlkR7kWR3Zm0) <DanKokenge_twitter (Dan Kokenge)>:
Ok! Being new to RED, does this mean I could put a exe on a cloud disk. Users could then run the exe. It would basically do what what you normally do with html and client/server. That would be amazing.

[14:03:52](#KvskzkOnQWSbVdmtukpgXcLY8IfaT0NnTE_OtwNhmhU) <vazub_gitlab (VaZub)>:
`put a exe on a cloud disk. Users could then run the exe`
Not sure what exactly you mean here. Cloud storage is not an executable environment - it doesn't have the facilities to run files.

[14:15:19](#OSaHWFXyUDhKsO1ZfjT8dWYYPyLtj_Q7kOtNTr5jomo) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
Exactly - such user will be most probably able to download such file, but some protective measures (antivirus protection) might step-in and prevent this. The cloud storage would have to be remotely mounted as a local/network drive, which might be possible e.g. using WebDav, but not sure ...

[15:07:35](#3RoMebXIoebHtjDKqWF7DV1jUzNMQDeJHQVkTnbygfA) <DanKokenge_twitter (Dan Kokenge)>:
You'll have to forgive me, I just started reading about RED/REBOL. What I'm trying to do is bypass the client/server type web app. Instead of the client clicking on some link on a home page and getting served up html/js, I keep trying to to come up with some way they can run programs direct on their computer from exe's or interpreted source code served to them from the server.  This may be a stupid idea, but if Rebol could somehow get loaded to the user, it could do what JS does on the client side. They then load only source code from the server to be executed. If it could be done, it would make writing client/ server apps as if they were local and reduce development time. Maybe RED has a small engine that interprets code? -- Just exploring ideas?? Thanks for the help..

[15:21:30](#cYb_1QCij-v32hfSicfVhD476I9NQMKYiBDryARiKYQ) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
With Red/Rebol, of course you can run remote scripts using `do http://my-domain.com/my-script.red`, but not executables directly. You can eventually download the executable using Red, stored it locally and launch it using `call`. But really beware the security ...

[18:50:09](#YItIudEy9r0cYy3osc8tVo1d_CBoXiWUoiRsEnaGvZc) <greggirwin (Gregg Irwin)>:
@DanKokenge_twitter I think I mentioned this somewhere recently. You need an environment of some kind, just as with any EXE you can get from the net. In Red's case, you can build standalone EXEs, but you're going to run into the same limitations you would with apps built in any other tool. The other thing you can do is write a launcher that let's people select the remote Red content and executes it locally. 

[18:52:28](#wc73Rbo8SjYL5zGlFSuO9MX71rGxSkoOqRgLC9NrnZg) <greggirwin (Gregg Irwin)>:
e.g. look at [this](https://github.com/greggirwin/7guis/tree/master/Red/launcher.red)

[18:54:02](#DVDXKGQdU6fiTyJtDu6WJctrhwjCgH-ElYY0jNfinVo) <greggirwin (Gregg Irwin)>:
You can also do it so the remote content runs outside the context of your launcher. 

## 4-Jan-2021

[21:51:26](#z8s53Y7-5OI1eV1FqadwREOASuXsgJc0VPtZBZY4rCY) <DVL333 (DVL333)>:
Is there a way to convert Red code to R/S code? I mean, you have a file with Red code and you want a file with R/S code.

[22:10:11](#HM76-X8Xa6vvSulLueLyN75ePwUY7MXy8JwkwoY-6Z8) <greggirwin (Gregg Irwin)>:
Red compiles to R/S, but they are different languages with different type systems (for example). If you want to convert code, to optimize it, there's no translator for that today.

[22:15:23](#yrXGu1k5gAw0KbEs3XXXJuXMp_Q_3YK7bzBsHiN6TcA) <DVL333 (DVL333)>:
ok, see you. Thanks Gregg.

[22:15:58](#NV7c0dakBU1KDV2vhV65KXJ9p5cFLN8JpbVpMXrvtsY) <hiiamboris (NOT THIS ONE)>:
Try `red -c -v 3`

[22:17:18](#ptMy0wjPCLWkNZsA5kFrEmghBnih4f3NXsM6VyJRWY0) <hiiamboris (NOT THIS ONE)>:
* Try `red -c -v 3 script.red`

[22:17:37](#79zhzN6WVvrMGrniSVZVePxdp1WMKLDU6jJYs2fZB9I) <hiiamboris (NOT THIS ONE)>:
* Try `red -c -v 3 script.red >output.reds`

[22:21:06](#MG6kpQnBfnqLpyw_FvilQHhw_NanQFRfQ9VaObLPbJc) <hiiamboris (NOT THIS ONE)>:
that's just looking under the sheets though, won't help optimize anything 😉

[22:46:15](#1bwSveZZra-ewem8OGcLsOIpFeH0LLLoIL2djYrTuRY) <DVL333 (DVL333)>:
@hiiamboris Thanks!

## 14-Jan-2021

[19:04:20](#Z-aZ2MkEfAYwxMaya603G74a18-N2w5ZWVPJNgQaE8I) <bubnenkoff (Dmitry Bubnenkov)>:
```
Red []
#system [
	#import [
		   "kernel32.dll" stdcall [
			   process-id?: "GetCurrentProcessId" [
				   return: [integer!]
			   ]
		] 
	]
	_pid: func[return: [integer!]] [return process-id?]
]

get-pid: routine [ /local pid [integer!] return: [integer!] ] [
        pid: _pid
        return pid
    ]
	
view [button [probe get-pid]]
```
I am getting error:
```
 invalid definition for function exec/get-pid: [return: [integer!]]
```


[19:13:39](#hqp0XsP9iBCvdgou8qfdpOeS9WbpTit_4KXRCRbYUn4) <hiiamboris (NOT THIS ONE)>:
try moving return to before /local

[19:13:45](#CWPf0JqrpYTwtyo6Eo50j6raeANC1MbbRmqhGat4Eto) <hiiamboris (NOT THIS ONE)>:
* try moving `return:` to before /local

[19:19:23](#V-chsvZiP7vabshq8WWsqA7vXOS1DuteigrWKx7zbGI) <bubnenkoff (Dmitry Bubnenkov)>:
```
Red []
#system [
	#import [
		   "kernel32.dll" stdcall [
			   process-id?: "GetCurrentProcessId" [
				   return: [integer!]
			   ]
		] 
	]
	_pid: func[return: [integer!]] [return process-id?]
]

get-pid: routine [ return: [integer!] /local pid [integer!] ] [
        pid: _pid
        return pid
    ]

view [button [probe get-pid]]

```

Work! Thanks!


[19:48:06](#yzfV9wD8bUWdU61L1APl7vJg3KEdbNfIR-GXLBsxR4k) <bubnenkoff (Dmitry Bubnenkov)>:
Can r/s can be placed inside `.red` file? 

[19:49:33](#kWnOoqq3OPZ0VQXxaSeW2FprmaH7Y35tflt-iW5fqVo) <hiiamboris (NOT THIS ONE)>:
Extension is ignored

[20:13:18](#gOs1j2NHZCBFWEqGTmrlk-P_gczaPZvp6XRNc_wcPEo) <greggirwin (Gregg Irwin)>:
But if you have only R/S in a file, using %.reds makes that clear and helps people.

## 15-Jan-2021

[6:32:33](#SbAHOAuM3R0FnxSth2u6bu6YSuYZ47HqU-W3CeQarvE) <bubnenkoff (Dmitry Bubnenkov)>:
I can compile code above only if it's placed in main (app.red(s)) file. If I am placing it in another file and than do:
`#include %foo.reds` I am getting compilation error: 
```
Compilation Error: undefined symbol: _pid
```

## 2-Feb-2021

[12:30:12](#W-h84UeS4pBPWgQiA6mlAS26Tk2r16dUG9F_mg8bMA0) <bubnenkoff (Dmitry Bubnenkov)>:
I need to send message to Red process (actually simple ping it to trigger function). I have read docs about WinAPI and found function `PostThreadMessage`. How to handle it's from Red? Or maybe there is any better ways?

[14:43:09](#7QsNPlioXqQgMPSMZAIpnYQ9KmeyPUPWtuTwZSRmlAA) <hiiamboris (NOT THIS ONE)>:
same as you handle GetCurrentProcessId

[14:44:12](#GHftRtJb7oqG2HKqce7gqt7n_0cqLNsemSWV8MUEmWU) <hiiamboris (NOT THIS ONE)>:
if Red supports this event, it will handle it

[14:45:25](#9twC3BTAUL0WrI2oTw0-tuil6WrmId5VBMj2-tlpOTc) <hiiamboris (NOT THIS ONE)>:
simplest way of communication though would be reading and writing a file

[14:52:00](#bFe_xFUWHhxZxt7zAEejFprgxcNO6c-XG7iuCSUmhTM) <hiiamboris (NOT THIS ONE)>:
> Compilation Error: undefined symbol: _pid

Can't reproduce


[17:38:08](#GdT5Z0stTeO8gakPRIjr9ibK_ALXovcg2izqVEs7p68) <bubnenkoff (Dmitry Bubnenkov)>:
> > Compilation Error: undefined symbol: _pid
> 
> Can't reproduce
> 

Sorry I forgot to mention that  `-e` flag is needed .Try to compile with `-c -e` to get the errror

[18:29:16](#DruY79ZBq_kkQfzboF9Dt9gI6pwVu-n_jmqukQXmgZM) <hiiamboris (NOT THIS ONE)>:
Ah. Makes sense. `-e` replaces `#include` with `do` so we should expect that

[18:30:09](#ANLUrylpoaZuOVhRsP740Zuws65lhcoMYHzgKyddAUc) <hiiamboris (NOT THIS ONE)>:
Please file an issue. Though this is how it currently works, it also raises important design questions.

## 3-Feb-2021

[7:12:11](#88gsvLXwQv8SGl4mA_Dtl1uMcqD4Xcp4vJzXOTCzNhU) <bubnenkoff (Dmitry Bubnenkov)>:
@hiiamboris done. but with do impossible to use R/S code  `Internal Error: contains Red/System code which requires compilation`

[7:12:21](#V0yQchrfeJw1LC7V6ktSJ-8oK_NdrVHM2zQcGuMv0ic) <bubnenkoff (Dmitry Bubnenkov)>:
* @hiiamboris done. but with `do` impossible to use R/S code  `Internal Error: contains Red/System code which requires compilation`

[8:57:01](#nqSoVMsWx1_BzyxEOX-H6PafJ8s-hGreI6GMtdUv_YQ) <bubnenkoff (Dmitry Bubnenkov)>:
@hiiamboris could you help me with wrapping WinAPI? According docs https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-getmessage I did this:
```
Red []

view [button [probe get-pid]]

#system [
    #import [
           "kernel32.dll" stdcall [
               process-id?: "GetCurrentProcessId" [
                   return: [integer!]
               ]
               get-msg: "GetMessage" [
                   msg    [pointer!] ; A pointer to an MSG structure that receives message information from the thread's message queue.
				   hWnd   [integer!] ; If hWnd is NULL, retrieves messages for any window that belongs to the current thread
				   wMsgFilterMin    [integer!]
				   wMsgFilterMax    [integer!]
				   return: [logic!]
               ]			   
        ] 
    ]
	
	max-size: 128
	msg: malloc max-size 

	get-msg msg null 0 0	
	
    _pid: func[return: [integer!]] [return process-id?]
	
	print msg
	print _pid

]

get-pid: routine [ return: [integer!] /local pid [integer!] ] [
        pid: _pid
        return pid
    ]
	
;get-msg: routine [ return: [c-string!] /local msg [c-string!] ] [
;        msg: _msg
;        return msg
;    ]	
```
But I am getting compilation error:
```
*** Compilation Error: invalid definition for function exec/get-msg: [
    msg [pointer!]
    hWnd [integer!]
    wMsgFilterMin [integer!]
    wMsgFilterMax [integer!]
    return: [logic!]
]
```


[9:36:48](#WXqnZ1QGS4hDLhoWowM8zROdZx7Y51Z3aFHoz-QisMk) <hiiamboris (NOT THIS ONE)>:
there is no `pointer!` type in R/S

[9:37:13](#boGcKpdKlhC0wOsxHOKm5tdF3y3Ox7Y7iXOrdqTLHwM) <hiiamboris (NOT THIS ONE)>:
there is `pointer! [integer!]` (or `int-ptr!`) and alikes

[11:15:58](#INzalHCu2xFIYWSjNjapJ0rlIIVOlYxsJXzVJ--cYhs) <bubnenkoff (Dmitry Bubnenkov)>:
@hiiamboris  Could you look at my code please. Now it's compile but or I am sending message wrong or there is should be some additional logic to handle it:
```
Red []

view [button [probe get-pid]]

#system [
    #import [
           "kernel32.dll" stdcall [
               process-id?: "GetCurrentProcessId" [
                   return: [integer!]
               ]
               get-msg: "GetMessage" [
                   msg    [integer!] ; A pointer to an MSG structure that receives message information from the thread's message queue.
				   hWnd   [integer!] ; If hWnd is NULL, retrieves messages for any window that belongs to the current thread
				   wMsgFilterMin    [integer!]
				   wMsgFilterMax    [integer!]
				   return: [logic!]
               ]   
        ] 
		   "msvcrt.dll" cdecl [
			   malloc: "malloc" [
				   size    [integer!]
				   return: [c-string!]
			   ]
			   release: "free" [
				   block   [c-string!]
			   ]
		   ]
    ]
	
    _pid: func[return: [integer!]] [return process-id?]
	
	print _pid

]

	max-size: 128
	msg: malloc max-size 

	get-msg msg null 0 0	
	print msg

get-pid: routine [ return: [integer!] /local pid [integer!] ] [
        pid: _pid
        return pid
    ]
	
;get-msg: routine [ return: [c-string!] /local msg [c-string!] ] [
;        msg: _msg
;        return msg
;    ]	
```

[11:31:14](#ABztuDGUzWyTh_SYqXW-1vfu2Rn80ZlR9VNAX_rgToc) <hiiamboris (NOT THIS ONE)>:
I don't even know what you're *trying* to do.

[11:32:36](#2hx17SxVxXFdUZluM3pGmP3Y5Osix7A51IypmO3_kPU) <hiiamboris (NOT THIS ONE)>:
The problem I see is that Red has it's own event function (aka WndProc), and it's calling GetMessage on it's own. It'll be a race: your GetMessage against Red's one.

[11:32:42](#6gw_Jw16MGkACuW8VZjVFVLmjCXY9YnVz5iGM4JAozM) <bubnenkoff (Dmitry Bubnenkov)>:
I am tying to send message from other process to Red with calling `SendMessage` and accept it in Red with `GetMessage`

[11:33:48](#9Wb8Omp3otuebWf_1TviD1Mih7PkLeu1nc3N2la9uMg) <hiiamboris (NOT THIS ONE)>:
Gimme the bigger picture. You're doing this for what?

[11:36:03](#X32IoPTA5xMTOmZx5bbLZJ6YvQcFj1Ttu9UfaqGw3Lc) <bubnenkoff (Dmitry Bubnenkov)>:
I am running processing of data with Red app. Every app on start sending own PID to monitoring service. I want to be able "ping" red app every n minutes to call function that will send some app metrics like: "I am not hanging I am working"

[11:37:08](#734UIVX-80sO_wZ1D5vP0gs0_c0ULYpnCKnISbSfw8o) <hiiamboris (NOT THIS ONE)>:
I see.

[11:37:48](#fu2ukHp-mXxSOW9nOKXCCUWq3zleJ94KBsimn1XLWM8) <hiiamboris (NOT THIS ONE)>:
Let me think..

[11:40:26](#hbY8LgsL17Hvnd07qG6I0-cCjg8ps6purADDSEP63ug) <hiiamboris (NOT THIS ONE)>:
Try sending [this message](https://docs.microsoft.com/en-us/windows/win32/winmsg/wm-gettext) from your service. If I understand correctly, Red will handle it for you, you should not need any code in your Red apps.

[11:40:52](#Gj9UlzfiTK0a7k7d0i2AoEfx6jtZ7jsKG8JvBU2z-_o) <hiiamboris (NOT THIS ONE)>:
If Red app doesn't answer, it probably hang.

[19:32:33](#wYjO0F2y9g2O3KLu7jA74xJMHDo2ySEYtGFSYgcBIcc) <greggirwin (Gregg Irwin)>:
@bubnenkoff It sounds like very coarse timed IPC. For this I've often used files as the mechanism in the past. You can write status files from each process and the monitor just reads them. You can do more than just I'm Alive then as well. What is it processing, how far along, etc. I've also done it with direct TCP, IOS link messages in that env, and 0MQ. Oh, and DDE in the oooooold days. Once we have FFI at the Red level, I will *probably* port my 0MQ lib. In any case, files are an easy and flexible solution.

## 8-Apr-2021

[12:06:24](#52f4gpQn-AKUdVwWWgnn7LWGCZAO2kt0QtBJEeiMjBU) <loziniak (Maciej Łoziński)>:
Hello. If I return pointer to data from imported C function, is there a possibility to deallocate the memory on Red side, for example by Garbage Collector? Perhaps it can be done in Red/System? I know I can implement cleaning the memory on the C side, by providing a accompanying function, but I'd like to avoid it.

[12:07:08](#DEKcICbNSgtwzR0sLZQqNgH38jbJHA1Ud4tNXKlgalM) <loziniak (Maciej Łoziński)>:
* Hello. If I return pointer to data from **imported** C function, is there a possibility to **deallocate the memory** on Red side, for example by Garbage Collector? Perhaps it can be done on Red/System level? I know I can implement cleaning the memory on the C side, by providing a accompanying function, but I'd like to avoid it.

## 9-Apr-2021

[11:52:27](#zvKilKW8VxoSjy3XV3iLWMEfbraXcVRDfgAHmmJtY3s) <hiiamboris (NOT THIS ONE)>:
`free` function in R/S is imported from libc

## 25-Apr-2021

[0:18:21](#H5wGHP6d8IGd4Oi9Qt5osFQZczvxY3dOo5nAp-yo3Es) <loziniak (Maciej Łoziński)>:
Hi! I don't understand one thing.
```
safe_default: routine [
	return: [handle!]
	/local ref
] [
	handle/box as integer! c_safe_default
]

safe_xorurl_base: routine [
	ref [handle!]
	return: [string!]
	/local str buffer size
] [
	str: c_safe_xorurl_base as handle! ref/value
	print [str lf]
	size: length? str
	buffer: string/load str size UTF-8
	cstring_free str
	buffer
]
```
gives output:
```

[0:18:31](#RAyqnVBt64uzprpXAeIrFwPk9QpuxukORYuu0oRKvug) <loziniak (Maciej Łoziński)>:
* Hi! I don't understand one thing.
```
safe_default: routine [
	return: [handle!]
	/local ref
] [
	handle/box as integer! c_safe_default
]

safe_xorurl_base: routine [
	ref [handle!]
	return: [string!]
	/local str buffer size
] [
	str: c_safe_xorurl_base as handle! ref/value
	print [str lf]
	size: length? str
	buffer: string/load str size UTF-8
	cstring_free str
	buffer
]
```
gives output:
```
print ref: safe_default

print safe_xorurl_base ref
safe_free ref


[0:22:09](#Oww7uJtizfTM7pCdozg1FGdJplVgLf_2juKWr7grf0g) <loziniak (Maciej Łoziński)>:
* Hi! I don't understand one thing.
```
safe_default: routine [
	return: [handle!]
	/local ref
] [
	handle/box as integer! c_safe_default
]

safe_xorurl_base: routine [
	ref [handle!]
	return: [string!]
	/local str buffer size
] [
	str: c_safe_xorurl_base as handle! ref/value
	print [str lf]
	size: length? str
	buffer: string/load str size UTF-8
	cstring_free str
	buffer
]

print ref: safe_default
print safe_xorurl_base ref
safe_free ref
```
gives output:
```
08B78C40h
Base32z
08B78C40h
```

and I'd expect:
```
08B78C40h
Base32z
Base32z
```
(`safe_xorurl_base` routine returns string!)

[0:22:37](#ulxLEWe6Qqie6xzZCoYFt6WwOqucTeei6zNtN96Hm4Y) <loziniak (Maciej Łoziński)>:
* Hi! I don't understand one thing.
```
safe_default: routine [
	return: [handle!]
	/local ref
] [
	handle/box as integer! c_safe_default
]

safe_xorurl_base: routine [
	ref [handle!]
	return: [string!]
	/local str buffer size
] [
	str: c_safe_xorurl_base as handle! ref/value
	print [str lf]
	size: length? str
	buffer: string/load str size UTF-8
	cstring_free str
	buffer
]

print ref: safe_default
print safe_xorurl_base ref
```
gives output:
```
08B78C40h
Base32z
08B78C40h
```

and I'd expect:
```
08B78C40h
Base32z
Base32z
```
(`safe_xorurl_base` routine returns string!)

[0:23:00](#kdsGHvYJq6naoOe2KAhAMk669R9j2O7TR0pJQd4Ohlk) <loziniak (Maciej Łoziński)>:
does something in this code look suspicious to anybody?

[7:23:32](#bFHj4T11jsIV2d-pgokNw-ii3svTT8Alf5dl5HHWryE) <hiiamboris (NOT THIS ONE)>:
try `return: [any-type!]` and `SET_RETURN(buffer)` in the end


[7:28:25](#Mbzs6k3Si_HZjuLzSXLBQBZo0Nz-Oiu9EShBVRi4X9U) <hiiamboris (NOT THIS ONE)>:
or `as red-string! SET_RETURN(buffer)`

[7:43:30](#BXweH9moJoTymHBo8Au2yBHiE2HwHzqo6yMUb82Uji4) <hiiamboris (NOT THIS ONE)>:
it inserts type/box to turn R/S type into Red type

[7:43:50](#eQ50d0YleC3cZYkBxoDbYYHmvY-VT7iu6hSiLn6As3I) <hiiamboris (NOT THIS ONE)>:
but there's no way to box something into a red-string

[7:44:00](#N1iCD0O9cU8ZB6zLt21XJcWemt0gsgGV7vYQMjR5k9g) <hiiamboris (NOT THIS ONE)>:
so you're on your own 

## 26-Apr-2021

[9:22:55](#UkUUb6ieXi6eWGfwUurtoYhEOvMBomBW_BrzxdHFcvE) <loziniak (Maciej Łoziński)>:
`string/load` calls `stack/push` so I thought `buffer` already is on top of stack. Anyway, *SET_RETURN* fixed my problem. Thanks!

[9:29:57](#Ib8MkNu7ol3j0Fv8foW5Cf6ciSmu83-NVN2KeVsB9gU) <loziniak (Maciej Łoziński)>:
It's interesting, that [it worked earlier](https://github.com/loziniak/sn_ffi/blob/ce7ddc7995da563a44a8f1b71bc6cfd0961b958f/sn-ffi.red). Perhaps it was only thanks to it being the only routine called? (no `safe_default` then)

[9:30:38](#at5J3q2oL_vW02-T6r1X0qAH3yWDAIa5Vj5wLogkAag) <loziniak (Maciej Łoziński)>:
Do you think I also need `SET_RETURN` in `safe_default` routine?

[9:31:42](#KXfWJOlRozdNDhcQOS6htVVTVLhpiw1F0ZW60f59PUk) <loziniak (Maciej Łoziński)>:
* Do you think I also need `SET_RETURN` in `safe_default` routine, and it's only a matter of time when it turns out to be broken without it?

[9:47:12](#HugCQ1-IXoXQlzn79H7NH0k0F4LwsNodo765LuFx8AE) <9214 (Vladimir Vasilyev)>:
@loziniak the result of the evaluation is passed at the bottom of the stack frame, not at the top: this is what `SET_RETURN` macro essentially does for you. Your earlier code worked simply because `string!` slot, pushed by `string/load`, was already in the right place (since `xorurl-base` routine has 0 arguments and the evaluation stack is empty).

[9:50:42](#ai5iQnnE7s6VlboCak-6VjQ3UKj4BYP0c2W4bKNm3XM) <9214 (Vladimir Vasilyev)>:
* @loziniak the result of the evaluation is passed at the bottom of the stack frame, not at the top: this is what `SET_RETURN` macro essentially does for you. Note that `08B78C40` is the same address that `ref`, the first argument passed at the bottom, has.

Your earlier code worked simply because `string!` slot, pushed by `string/load`, was already in the right place (since `xorurl-base` routine has 0 arguments and the evaluation stack is empty).

[9:51:29](#bl1PR5p6TBBDFkXQkTiGcNAuujDatZvYerJPW4JYcGc) <9214 (Vladimir Vasilyev)>:
* @loziniak the result of the evaluation is passed at the bottom of the stack frame, not at the top: this is what `SET_RETURN` macro essentially does for you. Note that `08B78C40` is the same address that `ref`, the first argument being passed to routine (at the bottom of the stack frame), has.

Your earlier code worked simply because `string!` slot, pushed by `string/load`, was already in the right place (since `xorurl-base` routine has 0 arguments and the evaluation stack is empty).

[9:52:04](#6owk6gOmlPIPTq4TczFE_m0iB8uHHn5WCWzOPHXD7nA) <9214 (Vladimir Vasilyev)>:
* @loziniak the result of the evaluation is passed at the bottom of the stack frame, not at the top: this is what `SET_RETURN` macro essentially does for you. Note that `08B78C40` is the same address that `ref`, the first argument being passed to routine (at the bottom of the stack frame), has.

Your earlier code worked simply because `string!` slot, pushed by `string/load`, was already in the right place (since `xorurl-base` routine has 0 arguments and the evaluation stack was empty).

[10:19:21](#KV3s1fsb9_c5aYb8Br6k0w7dryUEiOFRTUWpN7_ILOU) <loziniak (Maciej Łoziński)>:
Is there any info online on Red stack mechanics?

[10:30:07](#GhhgvP7IUz-WKWg9qMXes6BwAw0HkxdnxKHZwmGA4dc) <loziniak (Maciej Łoziński)>:
Thanks a lot anyway! :-)

[14:21:44](#GRmod8RMUEeEXi3eGucX3Lbo5c6hws_LmOTi51LbFwc) <hiiamboris (NOT THIS ONE)>:
Only the source code (:

## 29-Jun-2021

[1:08:39](#RCU2Msuy8ba0xasnII8jb1VenzmFhP_o53mfH9HkxeU) <gltewalt (Greg T)>:
`radio` button doesn't toggle in GTK.
Because this fails on my system:

https://github.com/red/red/blob/2ecb7d67f301f328093626f752325696abab3e54/modules/view/backends/gtk3/events.reds#L1029


[1:09:53](#uAsjYhC1YxpzabQ4itpLiuvKk9uI1bXlAEACT6TQWXw) <gltewalt (Greg T)>:
Related enough to #4247 that I started commenting.  

[1:12:15](#AAPLHMEOxRpDqCYqQ-_kMtmlXE2zaaLcjn9prycjlps) <gltewalt (Greg T)>:
I don't see why it fails. Yet.

[2:40:19](#HtBrzSFmOfcccijeolq7qxSXWyw5-h2fUjJ31znr6oc) <greggirwin (Gregg Irwin)>:
Thanks for digging in @gltewalt. :+1:

## 17-Jul-2021

[12:34:46](#tLBodXrRBURAMP2NPAqXlNTLxfyLILB6b3zXqSoAy2Q) <guaracy (Guaracy)>:
ROT-13 in Red and 880 bytes after compiled? Why not? Suggestions are welcome.

```
Red/System []

#define STDIN      0
#define STDOUT     1

; http://asm.sourceforge.net/syscall.html
#define SYS-write  4 ; ssize_t sys_write(unsigned int fd, const char * buf, size_t count)
#define SYS-read   3 ; ssize_t sys_read (unsigned int fd,       char * buf, size_t count)
#define SYS-exit   1 ; int sys_exit(int status)

#define null-byte  #"^@"
#define rot 13

#syscall [
   write: SYS-write [
       fd      [integer!]
       buffer  [c-string!]
       count   [integer!]
       return: [integer!]
   ]
   read: SYS-read [
       fd      [integer!]
       buffer  [c-string!]
       count   [integer!]
       return: [integer!]
   ]
   quit: SYS-exit [
       status  [integer!]
   ]
]

c: #" "
ix: 0  ; upper = 65, lower = 97, 0 otherwise
s: " " ; for sys_read

case?: func [c [byte!] return: [integer!]][
    if all[c >= #"A" c <= #"Z"][return 65]
    if all[c >= #"a" c <= #"z"][return 97]
    return 0
]

length?: func [str [c-string!] return: [integer!] /local i [integer!]][
    i: 0
    while [str/1 <> null-byte][
        str: str + 1
        i: i + 1
    ]
    return i
]

print: func [msg [c-string!] return: [integer!]][
    write STDOUT msg length? msg
]

getch: func[return: [byte!] /local l][
    l: read STDIN s 1
    if l < 1 [return null-byte]
    return s/1
]

while [true] [
    c: getch
    if c = null-byte [break]
    ix: case? c
    if ix > 0 [
        c: c - ix + rot
        if c >= as byte! 26 [
            c: c - 26
        ]
        c: c + ix
    ]
    s/1: c
    print s
]
quit 0
```


[13:23:10](#TS9RLqA0IxXQz6OtDLaADlEnHnh-lTAiQhSjmmu8XQA) <guaracy (Guaracy)>:
to compile: ```red -c --no-runtime rot13.reds```


[14:13:02](#RUDIfunHoiXAHDi7038F3GbHL16emFLarcBAhb3fEfs) <hiiamboris (NOT THIS ONE)>:
👏

[17:31:00](#Dk8IqZiWEYrZ7jZ7EXFdGmitTMi3REcXPj36_OoVYBU) <greggirwin (Gregg Irwin)>:
Nice!

[17:33:37](#7Clr7S5uXwtM05dSVCF9qXzyr7GjHGQnwe6fH5K2LGw) <greggirwin (Gregg Irwin)>:
@guaracy feel free to add to https://github.com/red/community/tree/master/red-system

## 22-Jul-2021

[21:03:25](#d2Jp1m9Yzh_CTxL6I0AJKd7nwKIoQpa_6h2Z1em9wWA) <munael>:
Hi o/
Where can I find info on FFI from Red programs into C libraries? Closest thing are the full library interface impls like (https://github.com/red/code/tree/master/Library/OpenGL) but those are too much for an intro. Couldn't find anything in the docs (except about LibRed).

## 23-Jul-2021

[1:04:33](#KiLYB0VDNygQUp5mUPiVTVUoY3eqQN_682nYv5DhBJ0) <greggirwin (Gregg Irwin)>:
https://static.red-lang.org/red-system-specs.html#section-15

## 9-Sep-2021

[1:34:24](#pXzJdD455NCgasHvpoUsOORrmISozmfXNzGMziTAHB4) <cjglo (Chris J Gallo)>:
anyone have any issue getting that simple-io-minimal.reds file (inside code/Library) to run on linux?  Apparently O_CREAT is undefined, yet on windows it works fine

[8:10:31](#4FwmdcY7U9z6n-3zvluqDRFROfW5at9wWQigYB2BXOg) <hiiamboris (NOT THIS ONE)>:
perhaps some refactoring took that constant away? I think you should report it here: https://github.com/red/code/issues

## 9-Oct-2021

[14:17:17](#0Q_GYYEHu2VI2So0-ddTG-t2H-Zb6BhDi-bPzRf9Kt0) <digitalbeat (digitalbeat)>:
Apologies if this is a dumb question but I have been trying to read and understand or find an example of how to read command line arguments (if any) from a Red program? It appears that this would be a Red/System (function?) but then I haven't been able to find out HOW to use a Red/System function from within a Red program. Any have an example?

[14:18:26](#0YqSPDDIziqTNR_UiH3uuYrDITVP5by17Rox9FoLSjg) <digitalbeat (digitalbeat)>:
 To elaborate this works and compiles but how do I do the equivalent in Red? : Red/System []
print ["count: " system/args-count lf]
args: system/args-list 
c: 1 
until [ 
   print [c ": " args/item lf] 
   c: c + 1 
   args: args + 1 
   args/item = null 
]


[14:25:14](#R-aAs47k3LHAlama0XZMTQV7Zdj0yhMu4VNMf5tDV8w) <digitalbeat (digitalbeat)>:
This (for example) Fails:
Red []
text: "Abc is not cbA"
print text
args: system/args-list 

[17:24:52](#kUsnPAfDjLP2HVRCrSoKjEseL-NoffP-s9UmZX-r16w) <greggirwin (Gregg Irwin)>:
Not a dumb question at all.
```
print ["system/options/args:" mold system/options/args]
print ["system/script/args:" mold system/script/args]
```

[18:56:21](#-R3dvSpiyGjkKXhQBcFKlY_TtZqd9SkGX25f1I4bc-g) <digitalbeat (digitalbeat)>:
@greggirwin THANK YOU! Maybe my Google search foo is way-off but I could not find anything like your answer (which works)! I was trying to create a tiny ham radio callsign lookup utility as a test in (relearning) REBOL/RED and was completely stumped by how to read the command line parameter(s). 


[20:33:32](#RGkF352BRhaOk-KdZl-QHzbUkTSCNKdPhyjq4PAxXhM) <greggirwin (Gregg Irwin)>:
The Rebol Core Guide is a great resource, though not 100% accurate for Red, in cases where our ref docs don't cover something.

[20:34:12](#-xlTRQJp7SDyr-kNdgXY0Zp0wuGyWwho25zgHy9fU-E) <greggirwin (Gregg Irwin)>:
That's an important one to note though. Anyone know if we have that in a readme or wiki page?

## 10-Oct-2021

[8:38:46](#YYBE-EaWXLOnWJpzd6bVdS23Zdd2t1_tpx1V_1cBT58) <hiiamboris (NOT THIS ONE)>:
@digitalbeat if you need smth more advanced: https://gitlab.com/hiiamboris/red-cli/

[8:41:38](#L8LxORCuOPowlYToXBsb5TTom5Hu9BnJD1AXgERcYKY) <hiiamboris (NOT THIS ONE)>:
@greggirwin http://www.rebol.com/docs/core23/rebolcore-5.html#section-3

[8:42:30](#06EdsHdxzQaEY-keY9iI3B0uWJtNXx004iPac4HcrtE) <hiiamboris (NOT THIS ONE)>:
`/args` are mentioned there

[9:30:08](#rCogtCusuffrmH9uQMtojABeLEHZNE-pKma5YQ9XwWQ) <greggirwin (Gregg Irwin)>:
I should have thought to mention your CLI @hiiamboris. :^\

## 6-Dec-2021

[1:46:51](#3RbyIAxutkuShJMvm9jndsY-QzDa38ikeowtgRpqH5Y) <Rebolforces (Allen Kamp)>:
Lol, why not, it's fun. That's what I thought 22 years ago. http://www.rebol.org/view-script.r?script=rot-13.r

[1:48:33](#OpOp8doA1_r1CFFl3Nx6zEzVpsmynnhiHNm-oXTullM) <Rebolforces (Allen Kamp)>:
* Lol, why not, it's fun. That's what I thought 22 years ago. (I can't believe it was that long ago.) http://www.rebol.org/view-script.r?script=rot-13.r

[8:35:32](#pM-cUBcEtVfzyWkokXEhQoF_n4jBeZukiDhCu3YjES8) <ldci (François Jouen)>:
Hi, I'm playing with syscall under macOS, but I get error.

[8:35:42](#f6OgX5WDWz7uTDv0b-9ph3cjJRxaPxDhejFhS-RiL6M) <ldci (François Jouen)>:
`Compiling to native code...
*** Red/System Compiler Internal Error: Script Error : Invalid path value: symbols 
*** Where: build 
*** Near:  [emit-page-aligned out rejoin job/sections/symbols/2] `


[9:07:52](#68Xmf1ZP2oMSQzoR3-71aOtSuCZ9Dwd3F0XIHLQdmF0) <ldci (François Jouen)>:
Code tested with Linux Mint 32-bit: perfectly works. So the problem is specific to macOS, probably to 64-bit calls.

[19:37:20](#m3GnT6oEWvArE98w5PZxK6_nIkOqtPET8y4jPZpMMKg) <hiiamboris (NOT THIS ONE)>:
create an issue

## 30-Jan-2022

[13:11:48](#bIV5JB-YkV1li8zFnLytisG45pVPlLSkXz2uFUIKV-w) <olivier_lp_twitter (LP Olivier)>:
I, is there a documentation  for SET_RETURN, I saw it in some script examples, are there others c like operands?

[13:57:41](#V5oNL0vGgKeksmP2NhPSGRn9zAalA8R_-IrP47WW_KA) <olivier_lp_twitter (LP Olivier)>:
Is there in red/system function to read/write files?

## 31-Jan-2022

[8:31:11](#wb3sTewYOdMqn2iB2O5CuLjPQCe8PvDWVNDN12DmnhE) <rebolek (Boleslav Březovský)>:
@olivier_lp_twitter you can `#include` this file https://github.com/red/red/blob/master/runtime/simple-io.reds to get file IO. Or call OS functions directly.

[9:07:44](#tPSaKD1hLKyKGOZe2Q37pJ_KR42oL3G7fPsUGw4upbg) <hiiamboris (NOT THIS ONE)>:
SET_RETURN can be found in the source code (macros.reds).

[11:59:50](#7h0Ig7dwdVl4tP1HHwnhM2LCqplgCs9AIIXJHb5GP_U) <olivier_lp_twitter (LP Olivier)>:
thanx

[12:01:28](#_En4A49Hhvl8kWSmhY95u0eoLlIpyBdg4b3lNX9hGTg) <olivier_lp_twitter (LP Olivier)>:
thank you, I haven't thought it was a macro

[14:09:19](#n6T75DWd8W8L5jEGgx6uDR-unqjYTe_fX5EQ0xI3H0o) <rebolek (Boleslav Březovský)>:
what’s in caps is usually a macro

## 2-Feb-2022

[6:21:05](#u0kqGEjKnuoxFhCRxL3ZYH4M8H2QnaeBuuiTqyAthxI) <endo64>:
For using simple-io.reds you may need to include other files, defitnitions.reds, unicode.reds, string.reds, macros.reds and probably a few others.

## 3-Feb-2022

[18:45:19](#cP9ccSRMGazwr8JeO1InntltXPNOIvyMJlFNLfGuoiI) <olivier_lp_twitter (LP Olivier)>:
thanx, in fact i'm looking for how red/system works. I guess maybe I should simply be focused on Red (waiting for open on files and file types functionalities...). I have not really understood which reds files are included in red binary, and which are not. SET_RETURN macro seems to be included even not so sure how to use it...

[18:59:57](#zDx86DBKybquV-1vdMyXzOZ27mSaBkgvKDT1BM1G-Us) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
IO branch is out there to experiment with. Not sure, if open on files is supported right now, but you can give it a try ....

## 4-Feb-2022

[15:00:13](#3G7elMVBRouLOn5LXtnPyPWYBti9EOSXr4ULqCTIKZI) <olivier_lp_twitter (LP Olivier)>:
not yet, even if in open definition file! is indicated

[15:59:12](#XcMh65IxJeC54Q3uXJqVsIb4XlJkfowU0NxGF3Bweag) <pekr (Petr Krenzelok) (@pekr-556ae86715522ed4b3e131b2:gitter.im)>:
I thought. IO is close to being merged, so I expected file support in there too ...

[16:01:35](#lHcT-Rq5daQsGSULZgGtkjqaj2CCzXrFKl7GnYA8Cck) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
When I tried IO branch last time, almost all tests were crashing (on Windows)

[16:02:40](#f0h0SqL1GWLCd2KNrOEPjfl2SUzKngOh4A_zeOCHS3c) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* When I tried IO branch last time, almost all [IO tests](https://github.com/red/red/tree/IO/tests/IO) were crashing (on Windows)

[19:35:32](#MaxuhQeKmxv8PF2y_IGn8QZiuJl2GNgA85g84-xv54Q) <greggirwin (Gregg Irwin)>:
It's high on our list, and known crashes will be addressed before merging to main.

## 6-Feb-2022

[23:12:37](#DQQu-g61L0vdH3WpcR6nLnwlQm5lOknGeeFSgnV-3Z0) <gurzgri>:
When manipulating blocks in routine's Red/System code, creating blocks in blocks there and creating many boxed an unboxed red-values in these, it is — so I guess —, always a certain sign of *me* doing sth. wrong when I get visual signs of GC kicking in with messages like
```
root: 6474/107152, runs: 2, mem: 3252744 => 2651976, mark: 7.9ms, sweep: 1.0ms
```
right? If so, it must happen somewhere in a > 4000 LOC script  (2/3 Red/System, 1/3 Red code). So far I had no luck in breaking it down in a digestable minimal example to reproduce the issue. Hence just this top-levekl question. What are the most common traps I should avoid wrt to these messages? Any advice or pointers would be much appreciated.

## 7-Feb-2022

[9:24:06](#b2L-9KnsaOoquLF2FPx1biQ79hJsbzzC9QCvAwjRRAo) <hiiamboris (NOT THIS ONE)>:
What's wrong with GC kicking in?

[9:43:26](#4LG5UQ6_4g7SJAe0ERT8xu4xevSFNHvNotKXxr-CgBI) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
You want to lower such a need as much as possible.

[9:44:32](#qCgXjvwnlUojQudUNXd_bnx6BF_zz0R29OqR1-aMBxA) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
So problem is not GC, but that there is _creating many boxed an unboxed red-values_, which needs to be released.

[18:31:17](#6Q40hPXQMQwzNPKiacEH3KWCI87CTVALvVMGzsJywLA) <greggirwin (Gregg Irwin)>:
I asked Nenad, and he said the same thing.

[19:52:00](#-5e8IhWab7sr5IUpiycpKvVUtSk4hesdXdh0SDhA6ZA) <gurzgri>:
GC kicking in of *course* isn't a problem - the strange GC output cited above is. Or *was*, as I should rather say: It never occurred to me that they go away when compiling in `--release` mode i/o `--compile` development mode. Sometimes you just have to ask to give yourself the answer ...

[19:55:30](#mOifspL4Di-4rwzDdiubMASGcyVSCKZoLfa01eaKfXk) <hiiamboris (NOT THIS ONE)>:
:+1:

## 5-Apr-2022

[21:55:54](#ARfb-8T-_Q7O0dYKFMIfIp0vo2KK6K5oCrxJaysSRnk) <gurzgri>:
Given I have a value `bin` of type `red-binary!` cointaing UTF-16LE string bytes, how can I treat that as a red-string! in R/S? 
```
str: as red-string! as red-value! bin
set-type as red-value! str TYPE_STRING
series: GET_BUFFER(str)
series/flags: series/flags or flag-UTF16-cache
SET_RETURN(str)
```
isn't sufficient, it returns `{A^@B^@C^@ä^@ö^@ü^@ß^@A^@B...}`, not `{ABCäöüßAB...}`.

[21:57:31](#W18B4f8QlxiJDs8heOF0F32dbgajIasKZC0MvqxblyI) <gurzgri>:
Ideally without loading it in a new string as `string/load` would do even I could load from the binary node's series.

## 6-Apr-2022

[19:49:07](#ShyWusnYe_lYXwmCUm99BW80wA5XqGAoxKrEvM3C-a0) <gurzgri>:
Giving me the answer myself:
```
---     series/flags: series/flags or flag-UTF16-cache
+++     series/flags: series/flags and flag-unit-mask or UCS-2
```

## 18-May-2022

[21:18:17](#ULig0OO7tNkZyHLrGh_Xz7uk1qdqWeNmCJJqMsMy_Gc) <ALANVF (theangryepicbanana)>:
so I'm looking at fixing #5108, and I see this at https://github.com/red/red/blob/master/runtime/datatypes/map.reds#L237
```red
blk: block/make-at as red-block! stack/push* size
if blk? [block/copy as red-block! spec blk null no null]
```
if I'm understanding this correctly, would a better solution be this?
```red
either blk? [
	blk: block/clone as red-block! spec no no
][
	blk: block/make-at as red-block! stack/push* size
]
```

[21:21:18](#ibFZTk89ofw_mzwTqbBedS8tbP18Bywxz_W6rJEL0pk) <ALANVF (theangryepicbanana)>:
* (though the `as red-block! stack/push* size` seems like it should be `as red-block! spec stack/push* size`, but that's just me since I don't fully understand how the stack works in R/S)

[21:22:00](#b5X4U25FYF-fgtSA6m1ROq8IFwWpqLCGreKFmm8TMUs) <ALANVF (theangryepicbanana)>:
* 

[21:48:53](#_0gEhrYsCCccdkhBfC2e0zMY8XfSTwEQ3wVeOdyFE6k) <ALANVF (theangryepicbanana)>:
it looks to be fine, but I'm not sure (since idk how to prof memory like they do in the example code)

[21:52:22](#dPGiNXv3JF2hpdR47YWSgnuBBobSbT_ZNFBoUXKxnCA) <ALANVF (theangryepicbanana)>:
ok looks to work

[21:52:25](#tETa9LuV7vQTKJh8w9Zor01TljJvX13ehEY6f3bAUmA) <ALANVF (theangryepicbanana)>:
[![image.png](https://files.gitter.im/55f4ffc80fc9f982beb085e7/Sh1o/thumb/image.png)](https://files.gitter.im/55f4ffc80fc9f982beb085e7/Sh1o/image.png)

[22:00:58](#lRg1caiwt1kNECYGIxLJs-xdYLosXMdsvKblLpjpUR0) <ALANVF (theangryepicbanana)>:
nvm that's broken

[22:01:54](#vCAMEW1yV6hPTUGalqW0ULmPMLPHiqHLo3IXdGUYmOM) <ALANVF (theangryepicbanana)>:
* ~~nvm that's broken~~

## 31-May-2022

[22:49:10](#Pm66IJyHom8xYMvNLrK2XTXrhoCeGjrZ1c2mQyiYZVU) <gltewalt (Greg T)>:
blk is always going to be truthy if it's `any-list` because it is set in the switch. Looks like.

[22:49:32](#x7mtdrwXpwoIpVs0QgqJkO2Taa4rPA9RWP9411MT3YY) <gltewalt (Greg T)>:
set to `yes`, which is trithy

[22:49:33](#HniibimqqVYMf3jQI89ZrkMUgt7hSsE_Si6Adcl_-wo) <gltewalt (Greg T)>:
truthy

## 1-Jun-2022

[0:39:19](#3bJVi3a60EzI4xiewGdBhEepqoKsTG-AdFTME0uzXJw) <gltewalt (Greg T)>:
blk? that is

## 12-Jun-2022

[15:26:18](#8cR3jcnBfwrs6Ot3NxTyEQV0fZsa6tn6km_my2W-X7s) <gurzgri>:
* As some of you might have seen, I'm working on an implementation of an ODBC port scheme. Which for datasources like PostgreSQL, Intersystems Caché, SQL Server, MS Text Driver and MariaDB already works quite nicely.

However, trying to get it working with SQLite I'm so hard running against a wall:

What I'm experiencing with SQLLite and the driver [SQLite ODBC Driver](http://www.ch-werner.de/sqliteodbc/) is, that after the first API call to `SQLDescribeColW` (despite successfull) all attempts on allocating memory with R/S `allocate` (i.e.  msvcrt.dll's `malloc`) fails. 

Sadly, I don't know a thing about stuff such low level, but from what I've read I guess that there's some kind of (CRT?) heap corruption going on?!

The [minimal example reproducing the issue](https://gist.github.com/gurzgri/c63a03efc94dd7c6f20553d5a84dda38) isn't quite "minimal" (and relies on declarations in `%environment/schemes/odbc.reds`). That's because there's quite some things involved to get up to point where it fails. But the script is very straight forward and proves that it's not just caused by some random bug in the much larger scheme implemention.

Funny thing is, that other stuff like INSERT, UPDATE and DELETE statements work fine even with SQLite, it's just the result set returning SELECT statement which involves `SQLDescribeColW` which causes problems. And SELECT works find with other databases/database drivers. But I can't just assume that it's the driver causing the problem, as it works just fine in WinSQL and DBeaver. I must do something wrong in the most esoteric ways here.

Any ideas, anyone? I've already been spending days researching this ... to no avail :(

[15:27:34](#x0d_LrC-kL2KuB7zjPWC42V5yQAl-heXCiqDdufI54w) <gurzgri>:
* As some of you might have seen, I'm working on an implementation of an ODBC port scheme. Which for datasources like PostgreSQL, Intersystems Caché, SQL Server, MS Text Driver and MariaDB already works quite nicely.

However, trying to get it working with SQLite I'm so hard running against a wall:

What I'm experiencing with SQLLite and the driver [SQLite ODBC Driver](http://www.ch-werner.de/sqliteodbc/) is, that after the first API call to `SQLDescribeColW` (despite successfull) all attempts on allocating memory with R/S `allocate` (i.e.  msvcrt.dll's `malloc`) fails. 

Sadly, I don't know a thing about stuff such low level, but from what I've read I guess that there's some kind of (CRT?) heap corruption going on?!

The [minimal example reproducing the issue](https://gist.github.com/gurzgri/c63a03efc94dd7c6f20553d5a84dda38) isn't quite "minimal" (and relies on declarations in `%environment/schemes/odbc.reds`). That's because there's quite some things involved to get up to point where it fails. But the script is very straight forward and proves that it's not just caused by some random bug in the much larger scheme implemention.

Funny thing is, that other stuff like INSERT, UPDATE and DELETE statements work fine even with SQLite, it's just the result set returning SELECT statement which involves `SQLDescribeColW` which causes problems. And SELECT works fine with other databases/database drivers. So I can't just assume that it's the driver causing the problem, as it works just fine in WinSQL and DBeaver. I must do something wrong in the most esoteric ways here.

Any ideas, anyone? I've already been spending days researching this ... to no avail :(

[16:10:01](#bJen4n_fIXA5qS4w9ZTxK9vdA3BXE_UbLwamz09Zvjk) <gurzgri>:
As some of you might have seen, I'm working on an implemation of an ODBC port scheme. Which for datasources like PostgreSQL, Intersystems Caché, SQL Server, MS Text Driver and MariaDB already works quite nicely.

However, trying to get it working with SQLite I'm so hard running against a wall:

What I'm experiencing with SQLLite and the driver [SQLite ODBC Driver](http://www.ch-werner.de/sqliteodbc/) is that after envocations of  `SQLDescribeColW` and or `SQLBindCol` (even if successfull) allocating memory in R/S with `allocate` fails with null pointers being returned or `*** access violation`s before `allocate` returns.

I don't know much about stuff such low level, I can only guess that there's some heap corruption going on?!

Sadly, the [minimal example reproducing the issue](https://gist.github.com/gurzgri/c63a03efc94dd7c6f20553d5a84dda38) and it's [output](https://gist.github.com/gurzgri/aad26e0aa4abd7ba700f9fabc5732021) isn't really "minimal" (depends on declarations from `%environment/schemes/odbc.reds`). That's because there's quite some things involved to get to point where it fails. But the script is very straight forward and proves that it's not just caused by some random bug in the much larger scheme implemention. The 

Funny thing is, that stuff like INSERT, UPDATE and DELETE statements *do work fine* even with SQLite, so it's just the result set returning SELECT statement (and catalog functions) which involves `SQLDescribeColW`/`SQLBindCol` to retrieve results which causes problems. SELECT works fine with other databases/database drivers. But I can't just assume that it's the driver causing the problem - as it works just fine in e.g. WinSQL and DBeaver. I must do something wrong in the most esoteric ways here.

Any ideas, anyone? I've already been spending days researching this ... to no avail 😟

[16:10:19](#VocuVoRzyaK8w-JW3qjzrYvIkVXP2_kQOnWUPelVkhU) <gurzgri>:
* As some of you might have seen, I'm working on an implemation of an ODBC port scheme. Which for datasources like PostgreSQL, Intersystems Caché, SQL Server, MS Text Driver and MariaDB already works quite nicely.

However, trying to get it working with SQLite I'm so hard running against a wall:

What I'm experiencing with SQLite and the driver [SQLite ODBC Driver](http://www.ch-werner.de/sqliteodbc/) is that after envocations of  `SQLDescribeColW` and or `SQLBindCol` (even if successfull) allocating memory in R/S with `allocate` fails with null pointers being returned or `*** access violation`s before `allocate` returns.

I don't know much about stuff such low level, I can only guess that there's some heap corruption going on?!

Sadly, the [minimal example reproducing the issue](https://gist.github.com/gurzgri/c63a03efc94dd7c6f20553d5a84dda38) and it's [output](https://gist.github.com/gurzgri/aad26e0aa4abd7ba700f9fabc5732021) isn't really "minimal" (depends on declarations from `%environment/schemes/odbc.reds`). That's because there's quite some things involved to get to point where it fails. But the script is very straight forward and proves that it's not just caused by some random bug in the much larger scheme implemention. The 

Funny thing is, that stuff like INSERT, UPDATE and DELETE statements *do work fine* even with SQLite, so it's just the result set returning SELECT statement (and catalog functions) which involves `SQLDescribeColW`/`SQLBindCol` to retrieve results which causes problems. SELECT works fine with other databases/database drivers. But I can't just assume that it's the driver causing the problem - as it works just fine in e.g. WinSQL and DBeaver. I must do something wrong in the most esoteric ways here.

Any ideas, anyone? I've already been spending days researching this ... to no avail :(

[16:11:13](#m7tFitH1M6f-1QEbHK8GAkDFgx0IJl-TMXp38OzqjfU) <gurzgri>:
* As some of you might have seen, I'm working on an implemation of an ODBC port scheme. Which for datasources like PostgreSQL, Intersystems Caché, SQL Server, MS Text Driver and MariaDB already works quite nicely.

However, trying to get it working with SQLite I'm so hard running against a wall:

What I'm experiencing with SQLite and the driver [SQLite ODBC Driver](http://www.ch-werner.de/sqliteodbc/) is that after envocations of  `SQLDescribeColW` and or `SQLBindCol` (even if successfull) allocating memory in R/S with `allocate` fails with null pointers being returned or `*** access violation`s before `allocate` returns.

I don't know much about stuff such low level, I can only guess that there's some heap corruption going on?!

Sadly, the [minimal example reproducing the issue](https://gist.github.com/gurzgri/c63a03efc94dd7c6f20553d5a84dda38) and it's [output](https://gist.github.com/gurzgri/aad26e0aa4abd7ba700f9fabc5732021) isn't really "minimal" (and depends on declarations from `%environment/schemes/odbc.reds`). That's because there's quite some things involved to get to point where it fails. But the script is very straight forward and proves that it's not just caused by some random bug in the much larger scheme implemention. The 

Funny thing is, that stuff like INSERT, UPDATE and DELETE statements *do work fine* even with SQLite, so it's just the result set returning SELECT statement (and catalog functions) which involves `SQLDescribeColW`/`SQLBindCol` to retrieve results which causes problems. SELECT works fine with other databases/database drivers. But I can't just assume that it's the driver causing the problem - as it works just fine in e.g. WinSQL and DBeaver. I must do something wrong in the most esoteric ways here.

Any ideas, anyone? I've already been spending days researching this ... to no avail :(

[16:11:38](#F5wqzWCqbEhH0HqgTI0G-9KTQ4FAG1Lvo9pSO-O2i6c) <gurzgri>:
* As some of you might have seen, I'm working on an implemation of an ODBC port scheme. Which for datasources like PostgreSQL, Intersystems Caché, SQL Server, MS Text Driver and MariaDB already works quite nicely.

However, trying to get it working with SQLite I'm so hard running against a wall:

What I'm experiencing with SQLite and the driver [SQLite ODBC Driver](http://www.ch-werner.de/sqliteodbc/) is that after envocations of  `SQLDescribeColW` and or `SQLBindCol` (even if successfull) allocating memory in R/S with `allocate` fails with null pointers being returned or `*** access violation`s before `allocate` returns.

I don't know much about stuff such low level, I can only guess that there's some heap corruption going on?!

Sadly, the [minimal example reproducing the issue](https://gist.github.com/gurzgri/c63a03efc94dd7c6f20553d5a84dda38) and it's [output](https://gist.github.com/gurzgri/aad26e0aa4abd7ba700f9fabc5732021) isn't really "minimal" (and depends on declarations from `%environment/schemes/odbc.reds`). That's because there're quite some things involved to get to point where it fails. But the script is very straight forward and proves that it's not just caused by some random bug in the much larger scheme implemention. The 

Funny thing is, that stuff like INSERT, UPDATE and DELETE statements *do work fine* even with SQLite, so it's just the result set returning SELECT statement (and catalog functions) which involves `SQLDescribeColW`/`SQLBindCol` to retrieve results which causes problems. SELECT works fine with other databases/database drivers. But I can't just assume that it's the driver causing the problem - as it works just fine in e.g. WinSQL and DBeaver. I must do something wrong in the most esoteric ways here.

Any ideas, anyone? I've already been spending days researching this ... to no avail :(

[16:11:54](#RuNviWb9433m52ZAF0YhgbtQDmSK8u8o2CuzZKqXv14) <gurzgri>:
* As some of you might have seen, I'm working on an implemation of an ODBC port scheme. Which for datasources like PostgreSQL, Intersystems Caché, SQL Server, MS Text Driver and MariaDB already works quite nicely.

However, trying to get it working with SQLite I'm so hard running against a wall:

What I'm experiencing with SQLite and the driver [SQLite ODBC Driver](http://www.ch-werner.de/sqliteodbc/) is that after envocations of  `SQLDescribeColW` and or `SQLBindCol` (even if successfull) allocating memory in R/S with `allocate` fails with null pointers being returned or `*** access violation`s before `allocate` returns.

I don't know much about stuff such low level, I can only guess that there's some heap corruption going on?!

Sadly, the [minimal example reproducing the issue](https://gist.github.com/gurzgri/c63a03efc94dd7c6f20553d5a84dda38) and it's [output](https://gist.github.com/gurzgri/aad26e0aa4abd7ba700f9fabc5732021) isn't really "minimal" (and depends on declarations from `%environment/schemes/odbc.reds`). That's because there're quite some things involved to get to the point where it fails. But the script is very straight forward and proves that it's not just caused by some random bug in the much larger scheme implemention. The 

Funny thing is, that stuff like INSERT, UPDATE and DELETE statements *do work fine* even with SQLite, so it's just the result set returning SELECT statement (and catalog functions) which involves `SQLDescribeColW`/`SQLBindCol` to retrieve results which causes problems. SELECT works fine with other databases/database drivers. But I can't just assume that it's the driver causing the problem - as it works just fine in e.g. WinSQL and DBeaver. I must do something wrong in the most esoteric ways here.

Any ideas, anyone? I've already been spending days researching this ... to no avail :(

[16:12:08](#H6OerA3xuqQztrNhM9qcDeOlEGzr4Fp9NrTbApLAsCo) <gurzgri>:
* As some of you might have seen, I'm working on an implemation of an ODBC port scheme. Which for datasources like PostgreSQL, Intersystems Caché, SQL Server, MS Text Driver and MariaDB already works quite nicely.

However, trying to get it working with SQLite I'm so hard running against a wall:

What I'm experiencing with SQLite and the driver [SQLite ODBC Driver](http://www.ch-werner.de/sqliteodbc/) is that after envocations of  `SQLDescribeColW` and or `SQLBindCol` (even if successfull) allocating memory in R/S with `allocate` fails with null pointers being returned or `*** access violation`s before `allocate` returns.

I don't know much about stuff such low level, I can only guess that there's some heap corruption going on?!

Sadly, the [minimal example reproducing the issue](https://gist.github.com/gurzgri/c63a03efc94dd7c6f20553d5a84dda38) and it's [output](https://gist.github.com/gurzgri/aad26e0aa4abd7ba700f9fabc5732021) isn't really "minimal" (and depends on declarations from `%environment/schemes/odbc.reds`). That's because there're quite some things involved to get to the point where it fails. But the script is very straight forward and proves that it's not just caused by some random bug in the much larger scheme implemention. 

Funny thing is, that stuff like INSERT, UPDATE and DELETE statements *do work fine* even with SQLite, so it's just the result set returning SELECT statement (and catalog functions) which involves `SQLDescribeColW`/`SQLBindCol` to retrieve results which causes problems. SELECT works fine with other databases/database drivers. But I can't just assume that it's the driver causing the problem - as it works just fine in e.g. WinSQL and DBeaver. I must do something wrong in the most esoteric ways here.

Any ideas, anyone? I've already been spending days researching this ... to no avail :(

[17:32:07](#Trt-5WW8I4loeMRWPafr7PE5l6_x2Y6lJkhMjSSrqG0) <greggirwin (Gregg Irwin)>:
I've sent up the bat signal.

[19:24:09](#hie20f6n2-tyeV1ZchWi3TJgWdl97QWYA3AaG2jdiUs) <gurzgri>:
```
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::-'    `-::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::-'          `::::::::::::::::
:::::::::::::::::::::::::::::::::::::::-  '   /(_M_)\  `:::::::::::::::
:::::::::::::::::::::::::::::::::::-'        |       |  :::::::::::::::
::::::::::::::::::::::::::::::::-         .   \/~V~\/  ,:::::::::::::::
::::::::::::::::::::::::::::-'             .          ,::::::::::::::::
:::::::::::::::::::::::::-'                 `-.    .-::::::::::::::::::
:::::::::::::::::::::-'                  _,,-::::::::::::::::::::::::::
```

Much appreciated!

[19:24:31](#K_tkm4Y_M2FZB5gTR9et3e4sTLYvB4oDKCM-6s7LNZI) <gurzgri>:
* ```
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::-'    `-::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::-'          `::::::::::::::::
:::::::::::::::::::::::::::::::::::::::-  '   /(_M_)\  `:::::::::::::::
:::::::::::::::::::::::::::::::::::-'        |       |  :::::::::::::::
::::::::::::::::::::::::::::::::-         .   \/~V~\/  ,:::::::::::::::
::::::::::::::::::::::::::::-'             .          ,::::::::::::::::
:::::::::::::::::::::::::-'                 `-.    .-::::::::::::::::::
:::::::::::::::::::::-'                  _,,-::::::::::::::::::::::::::
```

Much appreciated! :-) Thanks!

[22:11:47](#Etv-is3-MunqScr0qLvd8ohtoyiLyHaGMaRS4G1Ofio) <dockimbel>:
@gurzgri `allocate` in R/S is just a [renamed](https://github.com/red/red/blob/master/system/runtime/libc.reds#L15) libC's `malloc()`. If it returns `null`, it means you either used up all available memory or you've fragmented the heap memory so much that a contiguous region of the required size cannot be allocated anymore.

[22:14:00](#Qf2kOv4Q3Z-6-5uaicCUfQ3golZAN8RaRdAK5-wFuXY) <dockimbel>:
* @gurzgri `allocate` in R/S is just a [renamed](https://github.com/red/red/blob/master/system/runtime/libc.reds#L15) libC's `malloc()`. If it returns `null`, it means you either used up all available memory or you've fragmented the heap memory so much that a contiguous region of the required size cannot be allocated anymore. In both cases, it means you messed up memory management really bad.

[22:14:34](#wJKvoo30tpzakY0sP5xo6KyE1Q5sS0UFoSZYFM5Fp6Q) <dockimbel>:
* @gurzgri `allocate` in R/S is just an [imported](https://github.com/red/red/blob/master/system/runtime/libc.reds#L15) libC's `malloc()`. If it returns `null`, it means you either used up all available memory or you've fragmented the heap memory so much that a contiguous region of the required size cannot be allocated anymore. In both cases, it means you messed up memory management really bad.

[22:14:56](#5FZW-5O7v2eEZs_m0X7J-pZxcYeew6FHp-KPK-NaGxY) <dockimbel>:
* @gurzgri `allocate` in R/S is just an [imported](https://github.com/red/red/blob/master/system/runtime/libc.reds#L15) libC's `malloc()`. If it returns `null`, it means you either used up all available memory or you've fragmented the heap memory so much that a contiguous region of the required size cannot be allocated anymore. In both cases, it means you've messed up memory management really bad.

[22:33:44](#kiNOs3aqp99yy7PZG3sGhOqsqvRC0NYB98jklvTAMMs) <dockimbel>:
When I look at your `sqlite-debug.red` code, I see many memory management errors, like `free message` been called twice on some code paths, or many allocations without corresponding releasing.

[22:33:55](#9VJMaOBrZrnVXgltKo7K2T4p_g9p_cLnXUntP8KChxs) <dockimbel>:
* When I look at your `sqlite-debug.red` code, I see many memory management errors, like `free message` been called twice on some code paths, or many allocations without the corresponding release.

## 20-Jun-2022

[21:47:27](#xHBO-SVsxwCWGBrWtF94x3RoXZCkvAR7o9rw76CPJ3A) <gurzgri>:
@dockimbel Thank you very much for having a look into this - much appreciated! 

But I'm still completely lost. Therefore I simplified the script even further. The result is the same. 

I really do not see where I'm would be messing up memory: [sqlite-debug.red](https://gist.github.com/gurzgri/c63a03efc94dd7c6f20553d5a84dda38) has no other script dependencies and has practically zero "code paths" or script logic with runaway allocating/freeing. 

The script just runs from top to bottom, all ODBC API calls succeed (retcode = 0): [sqlite-debug.log](ragmented the heap).
Yet again it's failing on `allocate` after the second successfull API call to `SQLDescribeCol`.

Up to this point I'm only allocating 4 bytes, 4 bytes, 256 bytes, 4 bytes, 4 bytes. No way these tiny amounts can fragment the heap?!? But then trying to allocate 242 bytes fails. And at this point, not a single `free`ing has taken place.

And that is only where used with SQLite driver, other databases work fine.

[21:49:14](#0uce9quBH1dzr4qKBEP5NZDhNJvxB2IdVzlz4MRBDZE) <gurzgri>:
* @dockimbel Thank you very much for having a look into this - much appreciated! 

But I'm still completely lost. Therefore I simplified the script even further. The result is the same. 

I really do not see where I'm would be messing up memory: [sqlite-debug.red](https://gist.github.com/gurzgri/c63a03efc94dd7c6f20553d5a84dda38) has no other script dependencies and has practically zero "code paths" or script logic with runaway allocating/freeing. 

The script just runs from top to bottom, all ODBC API calls succeed (retcode = 0): [sqlite-debug.log](https://gist.github.com/gurzgri/aad26e0aa4abd7ba700f9fabc5732021).
Yet again it's failing on `allocate` after the second successfull API call to `SQLDescribeCol`.

Up to this point I'm only allocating 4 bytes, 4 bytes, 256 bytes, 4 bytes, 4 bytes. No way these tiny amounts can fragment the heap?!? But then trying to allocate 242 bytes fails. And at this point, not a single `free`ing has taken place.

And that is only where used with SQLite driver, other databases work fine.

[21:58:24](#qyFfgjzHmyuaeSb9h9zWSOxqNXc0GePFornNSsSwgJ0) <hiiamboris (NOT THIS ONE)>:
wow, malloc returns 0 on 242 bytes

[21:59:23](#Apzz0yQCJoKqens4wzgxqx8UQ4OzbLzaXqz3PTWj57k) <hiiamboris (NOT THIS ONE)>:
is that on linux?

[21:59:45](#hfH09B0g8URwWjCYRQOkdG11njUgs0paJFuVojzh9w4) <hiiamboris (NOT THIS ONE)>:
could be 32 bit lib bugs on 64 bit system?

[22:00:13](#EJX5J_8bqwv6vEZgPZordHQ5K0nGgmQQ1_XjgpGKBhU) <hiiamboris (NOT THIS ONE)>:
no, looks like windows

[22:00:57](#4cNoAhGRYV9pYjJSjAqlWBWycd5Bm5dbIIfQTCJFeN0) <hiiamboris (NOT THIS ONE)>:
try allocating using WINAPI?

[22:01:07](#4qTh_nO7U9oc67Dozqz15ZOwCbUYjetXYm7zAC1qPlI) <hiiamboris (NOT THIS ONE)>:
you'll get the error code/message in case of failure

[22:01:22](#MiyuAz0lHn_9Ih7BUe2Sh2Jv843nSRnM0ApGpSjmmOE) <hiiamboris (NOT THIS ONE)>:
with GetLastError

## 21-Jun-2022

[14:25:40](#97wZwY4I-KvNRa9PgYQl9IBcLkPzbvXOUBRACtUoKMw) <gurzgri>:
Good idea! And what should I say? Using `kernel32.dll`'s `GetProcessHeap` and `HeapAlloc` instead of `malloc` (thru `allocate`) it ... just works.  Crazy.

[14:49:05](#KW38NT338AEE_4KodJTv4a1QaJqR7AqLQTrL7VDs5Fc) <hiiamboris (NOT THIS ONE)>:
Totally 😉

## 30-Jun-2022

[13:48:25](#HhfwVGYXtqTPF9OIu2YO-UbqmJQjJFCKFIsH8Pw7Gr0) <dockimbel>:
@gurzgri I see you've removed a lot of R/S code. Are you sure that you get the right type value in `sqltype` [there](https://gist.github.com/gurzgri/c63a03efc94dd7c6f20553d5a84dda38#file-sqlite-debug-red-L200)? You should check after the `case` if the right entry was matched, because otherwise that would most likely cause memory corruptions in memory allocated with `malloc()`.

[13:50:44](#DL745uds6aLh7WzjD88KNfQbjC_5Uewc15tFaA1lBRs) <dockimbel>:
* @gurzgri I see you've removed a lot of R/S code. Are you sure that you get the right type value in `sqltype` [there](https://gist.github.com/gurzgri/c63a03efc94dd7c6f20553d5a84dda38#file-sqlite-debug-red-L200)? You should check after the `case` if the right entry was matched, because otherwise that would most likely cause memory corruptions in memory allocated with `malloc()`. Your comments [here](https://gist.github.com/gurzgri/c63a03efc94dd7c6f20553d5a84dda38#file-sqlite-debug-red-L36) says you expect those values to be negative, but they are stored in 32-bit slots, so they are positive.

[13:51:54](#KA5MWYzjEWcMTFX11w-rhTZtQeCVPvjtAiLNh8b_5nw) <dockimbel>:
* @gurzgri I see you've removed a lot of R/S code. Are you sure that you get the right type value in `sqltype` [there](https://gist.github.com/gurzgri/c63a03efc94dd7c6f20553d5a84dda38#file-sqlite-debug-red-L200)? You should check after the `case` if the right entry was matched, because otherwise that would most likely cause memory corruptions. Your comments [here](https://gist.github.com/gurzgri/c63a03efc94dd7c6f20553d5a84dda38#file-sqlite-debug-red-L36) says you expect those values to be negative, but they are stored in 32-bit slots, so they are positive.

[19:01:25](#wdrslbOWiQ_XSh-o1qnSuk3ks1xcOtImutBS4hiI9TA) <gurzgri>:
@dockimbel Type constants weren't the problem. I have identified the issue, see my comment ☝ [28. Juni 2022 17:24](https://gitter.im/red/database?at=62bb1d49b408e830dc540b05) over in red/database. Thanks anyway!

## 17-Jul-2022

[15:50:22](#FjJRkQaDZSEL5y-gPp87V9w4IopAu1apvINOtuP7GVQ) <ldci (François Jouen)>:
[![image.png](https://files.gitter.im/55f4ffc80fc9f982beb085e7/Iqsl/thumb/image.png)](https://files.gitter.im/55f4ffc80fc9f982beb085e7/Iqsl/image.png)

[15:53:09](#oK4n_Z-PwexfyGXz5FhneBzVq2N6xyf6MVw3-3doAG8) <ldci (François Jouen)>:
An update at  https://github.com/ldci/Red-System/tree/main/BitTools with some tools for bytes and bits manipulations


[18:37:31](#eEHOdky5OcaCbrDzhtKZRGImo8ggEBsjp_AEBmxeNqQ) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Reminds me my old https://github.com/red/code/tree/master/Library/Stream-IO

## 18-Jul-2022

[17:11:28](#cLh13IiXGyvtbLZTZeK9F1rFSXo7EZiCfXSk7NFWY4A) <ldci (François Jouen)>:
@Oldes We have to coordinate :)

[17:18:15](#Cz99uRnQPt4nvnd0cWxn7KO_1-no8WxK8Cqm5pdEgQs) <ldci (François Jouen)>:
I hate it when the universe resists me. As I didn't understand the LZW decompression of gif files, I went back to the sources. Rebol 3 and Red are really fantastic. Here is an algorithm for LZV compression in less than 30 LOC.

[17:18:41](#QfJlUex8O2NzGvcx_VQ2avBcycW7pWhzbaXsW-MouNQ) <ldci (François Jouen)>:
```
#!/usr/local/bin/red
Red [
]
LZWCompress: function [
	"Compress a string to a list of output symbols"
	string [string!]
][
	codeTableSize: 256
	codeTable: make map! []
	i: 0
	while [i < codeTableSize] [put codeTable to-string to-char i i i: i + 1]
	outPut: copy []
	w: ""
	foreach c string [
		wc: rejoin [w c]
		either find codeTable to-string wc [w: wc][
			;--Add code to outPut
			append outPut select codeTable to-string w
			;--Add wc to the codeTable.
			put codeTable to-string wc codeTableSize
			codeTableSize: codeTableSize + 1
			w: c
		]
	]
	;--Output the code for the last w
	if not none? w [append outPut select codeTable to-string w]
]

string: "abracadabraaaa"
codes: LZWCompress string
?? codes
```


[17:20:44](#dltqh-Tow6r_x8YEHwGEg608FZ3wdrjzABh5PxewiE0) <greggirwin (Gregg Irwin)>:
:+1:

[17:27:02](#ehjeC_NdoTPI0FiCmSZnAFF-jbwGYPWs4dMQgf96YkM) <ldci (François Jouen)>:
@greggirwin. Thanks. Next step: decompress :) 

[18:07:43](#mN6PNOZQnEK9UMew9yk75u6XChr-x69UjNt74Njzkl8) <rebolek (Boleslav Březovský)>:
black magic 👀 

## 19-Jul-2022

[7:36:22](#DBKHCd4amtp862WENkSvUCOiFjQpBdt2OBVVV6Yqn_E) <toomasv>:
@ldci Nice! But it is case-insensitive:
```
>> LZWCompress "ABRacADabRaAAa"
== [97 98 114 97 99 97 100 256 258 97 265]
>> LZWCompress-case-sensitive "ABRacADabRaAAa"
== [65 66 82 97 99 65 68 256 258 65 265]
```

[7:45:35](#sLW4dDTQfNDURVlmMjnEwsp6pqEJ40yNfwQ4HDrd5NQ) <toomasv>:
* @ldci Nice! But it is case-insensitive:
```
>> LZWCompress "ABRacADabRaAAa"
== [97 98 114 97 99 97 100 256 258 97 265]
>> LZWCompress-case-sensitive "ABRacADabRaAAa"
== [65 66 82 97 99 65 68 97 98 258 65 65 97]
```

[8:01:47](#MIBNCwhGk5O7PxMpIm-82Hpw6vPE7tlpmwEVvFJi1H4) <ldci (François Jouen)>:
@toomasv Yes, I know but with find/case I get an error: `Script error: cannot MAKE char! from: none`


[8:02:57](#kQZy7fY80OC20EoFWftN4mRPSyC4LZeggH8a7n28KP0) <ldci (François Jouen)>:
@toomasv . Another problem for decompress. This function doesn’ work correctly
```
LZWDecompress: function [
	"Decompress a list of codes to a string"
	codes	[block!]
][	
	codeTableSize: 256
	codeTable: make map! []
	i: 0
	while [i < codeTableSize] [put codeTable to-string to-char i i i: i + 1]
	outPut: copy ""
	w: to-string to-char first codes
	foreach c codes [
		if find values-of codeTable c [entry: to-string to-char c]
		if c = codeTableSize [entry: rejoin [w w/1]] 
		append outPut entry
		;--Add w+entry[0] to the dictionary
		put codeTable rejoin [w entry/1] codeTableSize
		codeTableSize: codeTableSize + 1
		w: entry
	]
	outPut
]
```


[8:03:09](#FqTxKSBrqgh_gGRDx6Uc1FftutgcYF9yvBBRJEWje3U) <toomasv>:
I worked from yours:
```
LZWCompress2: func [
    "Compress a string to a list of output symbols"
    string [string!]
][
	;--Initialize codeTable
    codeTableSize: 256
    codeTable: make map! []
    i: 0
    while [i < codeTableSize] [
		put codeTable to-char i i 
		i: i + 1
	]
    outPut: clear []
	w: string/1
    foreach c next string [
        wc: rejoin [w c]
        either find/case codeTable wc [w: wc][
            ;--Add code to outPut
            append outPut codeTable/:w
            ;--Add wc to the codeTable.
			put codeTable wc codeTableSize
			codeTableSize: codeTableSize + 1
			w: c
		]
    ]
    ;--Output the code for the last w
    if w [append outPut codeTable/:w]
]
```

[8:03:36](#aTz1Dqm5u3wuY0z9qHpnNmLUH1VSnvWxZFcykwqiKM0) <toomasv>:
* I worked from yours:
```
LZWCompress2: function [
    "Compress a string to a list of output symbols"
    string [string!]
][
	;--Initialize codeTable
    codeTableSize: 256
    codeTable: make map! []
    i: 0
    while [i < codeTableSize] [
		put codeTable to-char i i 
		i: i + 1
	]
    outPut: clear []
	w: string/1
    foreach c next string [
        wc: rejoin [w c]
        either find/case codeTable wc [w: wc][
            ;--Add code to outPut
            append outPut codeTable/:w
            ;--Add wc to the codeTable.
			put codeTable wc codeTableSize
			codeTableSize: codeTableSize + 1
			w: c
		]
    ]
    ;--Output the code for the last w
    if w [append outPut codeTable/:w]
]
```

[8:04:33](#KsaQRjyDMPbNW9_yv84NoloHht3ww2BWfDUsi3_ELe8) <ldci (François Jouen)>:
le line `if c = codeTableSize [entry: rejoin [w w/1]]`is not evaluated

[8:21:32](#cZYqNDmEH5xpjJJ-K-qfgj1jAv8SHEFZrxC2WBz_YRo) <ldci (François Jouen)>:
@toomasv Thanks. Your code works fine with Red, but not with Oldes’s R3 version.

[8:39:33](#lsznb20barA7iD-w2m12eR5EVYos8D3eKR0km2VYnKA) <toomasv>:
Ok, thanks!
Here is decompress, first tests work:
```
LZWDecompress2: function [
    "Decompress a list of codes to a string"
    codes    [block!]
][    
    codeTableSize: 256
    codeTable: make map! []
    i: 0
    while [i < codeTableSize] [
        put codeTable i to-char i
        i: i + 1
    ]
    old: first codes
    outPut: to-string codeTable/:old
    foreach new next codes [
        if not s: codeTable/:new [
            s: codeTable/:old
            s: rejoin [s to-char c]
        ]
        append outPut s
        c: first to-string s
        codeTable/:codeTableSize: rejoin [to-char old c]
        codeTableSize: codeTableSize + 1
        old: new
    ]
    outPut
]
```

[8:41:26](#_m26QeGnLGDK-EIRU-2Semf56RZlNWHnMy5s-kbfV9Y) <toomasv>:
* Ok, thanks!
Here is decompress, first tests work:
```
LZWDecompress2: function [
    "Decompress a list of codes to a string"
    codes    [block!]
][    
    codeTableSize: 256
    codeTable: make map! []
    i: 0
    while [i < codeTableSize] [
        put codeTable i to-char i
        i: i + 1
    ]
    old: first codes
    outPut: to-string codeTable/:old
    foreach new next codes [
        if not s: codeTable/:new [
            s: codeTable/:old
            s: rejoin [s to-char c]
        ]
        append outPut s
        c: first to-string s
        codeTable/:codeTableSize: rejoin [to-char old c]
        codeTableSize: codeTableSize + 1
        old: new
    ]
    outPut
]
```
```
>> codes: LZWCompress2 "ABRacADabRaAAa"
== [65 66 82 97 99 65 68 97 98 258 65 65 97]
>> LZWDecompress2 codes
== "ABRacADabRaAAa"
```

[8:48:19](#wWNkQqlslrVbGFdAQYRS54BR76Rv3i7MCfUF6XuYKSU) <ldci (François Jouen)>:
@toomasv Thanks I’ll test :)

[8:49:25](#Le43ZHasKC2_bHimXZf3qlzRN_zYwdXvgV7tgI3521c) <toomasv>:
* Ok, thanks!
Here is decompress, first tests work:
```
LZWDecompress2: function [
    "Decompress a list of codes to a string"
    codes    [block!]
][    
    codeTableSize: 256
    codeTable: make map! []
    i: 0
    while [i < codeTableSize] [
        put codeTable i to-char i
        i: i + 1
    ]
    old: first codes
    outPut: to-string codeTable/:old
    foreach new next codes [
        if not s: codeTable/:new [
            s: rejoin [codeTable/:old to-char c]
        ]
        append outPut s
        c: first to-string s
        codeTable/:codeTableSize: rejoin [to-char old c]
        codeTableSize: codeTableSize + 1
        old: new
    ]
    outPut
]
```
```
>> codes: LZWCompress2 "ABRacADabRaAAa"
== [65 66 82 97 99 65 68 97 98 258 65 65 97]
>> LZWDecompress2 codes
== "ABRacADabRaAAa"
```

[8:59:41](#uBJ0qDQt1ECtKwakpubutjZgg3NydO_mqBvFe2oxzKk) <ldci (François Jouen)>:
@toomasv Perfect! Just a question why are you using next in foreach loop?  

[9:00:43](#Xhv-Rd4gk2LrjOwSeB0J1ioFoFd3LdrIBbS4o0Bz0aM) <toomasv>:
Because I initialize `outPut` to first letter.

[9:03:02](#nS8BtVP2FlwMetcDzyNoZNsYtIqqSKkNZIVhBw37Ueo) <toomasv>:
* Because I initialize `outPut` to first letter (and use up the first code).

[9:04:26](#pwzNklzw5eI7OojSLa5Zu2y70WbWxXVZGSLKf8VBZug) <ldci (François Jouen)>:
@toomasv . It was a stupid question:)

[9:04:59](#je2bSJ05ngFyXjhsPBihqH_b2CxR6vigkCn4ebZp-dQ) <toomasv>:
There is no such thing!

[9:37:40](#IRVRwIIhLAMlFuPjFFteWNpaIbPivmZpLfpThnY9N_8) <toomasv>:
@ldci There was a mistake, here is corrected:
```
LZWDecompress: func [
    "Decompress a list of codes to a string"
    codes    [block!]
][    
    codeTableSize: 256
    codeTable: make map! []
    i: 0
    while [i < codeTableSize] [
        put codeTable i to-char i
        i: i + 1
    ]
    old: first codes
    outPut: to-string codeTable/:old
    foreach new next codes [
        if not s: codeTable/:new [
            s: rejoin [codeTable/:old c]
        ]
        append outPut s
        c: first to-string s
        codeTable/:codeTableSize: rejoin [codeTable/:old c]
        codeTableSize: codeTableSize + 1
        old: new
    ]
    outPut
]
```

[9:38:21](#ti0IS4AQj-N3IdwL3Q2VqYoBQjgiIr9z59Q-rmkguCk) <toomasv>:
* @ldci There was a mistake, here is corrected:
```
LZWDecompress: func [
    "Decompress a list of codes to a string"
    codes    [block!]
][    
    codeTableSize: 256
    codeTable: make map! []
    i: 0
    while [i < codeTableSize] [
        put codeTable i to-char i
        i: i + 1
    ]
    old: first codes
    outPut: to-string codeTable/:old
    foreach new next codes [
        if not s: codeTable/:new [
            s: rejoin [codeTable/:old c]
        ]
        append outPut s
        c: first to-string s
        codeTable/:codeTableSize: rejoin [codeTable/:old c] ;<--------- wrong!
        codeTableSize: codeTableSize + 1
        old: new
    ]
    outPut
]
```

[9:38:29](#lVNQWzwGxePzVW15LzFsLWBoRhWPtiF4REgE1LzgxXA) <toomasv>:
* @ldci There was a mistake, here is corrected:
```
LZWDecompress: func [
    "Decompress a list of codes to a string"
    codes    [block!]
][    
    codeTableSize: 256
    codeTable: make map! []
    i: 0
    while [i < codeTableSize] [
        put codeTable i to-char i
        i: i + 1
    ]
    old: first codes
    outPut: to-string codeTable/:old
    foreach new next codes [
        if not s: codeTable/:new [
            s: rejoin [codeTable/:old c]
        ]
        append outPut s
        c: first to-string s
        codeTable/:codeTableSize: rejoin [codeTable/:old c] ;<--------- was wrong!
        codeTableSize: codeTableSize + 1
        old: new
    ]
    outPut
]
```

[10:27:12](#PQJmvumx9pj8umETgBa9OX9keDmBLephje2NLNpYK_4) <ldci (François Jouen)>:
@toomasv Thanks

[10:29:57](#1Asch_36XPT5cNNfc4u2mZR8wG_z8rhdizCGif-JuDw) <toomasv>:
There is something wrong with compression too:
>> codes: LZWCompress2 "WyS*WyGWYS*WySWYSG"
== [87 121 83 42 256 71 87 89 258 256 83 256 83 71]
;                                                                                    ^     <----- wrong, should be 262
>> probe at to-block codeTable 513 ()
[
    "Wy" 256 
    "yS" 257 
    "S*" 258 
    "*W" 259 
    "WyG" 260 
    "GW" 261 
    "WY" 262 
    "YS" 263 
    "S*W" 264 
    "WyS" 265 
    "SW" 266 
    "WYS" 267 
    "SG" 268
]
```

[10:30:05](#ASWaR2rWT4P44UGqfsxGT9ckqYO5cJmIH8nwyiWgP2c) <toomasv>:
* There is something wrong with compression too:
```
>> codes: LZWCompress2 "WyS*WyGWYS*WySWYSG"
== [87 121 83 42 256 71 87 89 258 256 83 256 83 71]
;                                                                                    ^     <----- wrong, should be 262
>> probe at to-block codeTable 513 ()
[
    "Wy" 256 
    "yS" 257 
    "S*" 258 
    "*W" 259 
    "WyG" 260 
    "GW" 261 
    "WY" 262 
    "YS" 263 
    "S*W" 264 
    "WyS" 265 
    "SW" 266 
    "WYS" 267 
    "SG" 268
]
```

[10:30:16](#QrQeqgSNZPEe6ar3kIX6J7gYgrt4jHqlpqgelMY8AmA) <toomasv>:
* There is something wrong with compression too:
```
>> codes: LZWCompress2 "WyS*WyGWYS*WySWYSG"
== [87 121 83 42 256 71 87 89 258 256 83 256 83 71]
;                                     ^     <----- wrong, should be 262
>> probe at to-block codeTable 513 ()
[
    "Wy" 256 
    "yS" 257 
    "S*" 258 
    "*W" 259 
    "WyG" 260 
    "GW" 261 
    "WY" 262 
    "YS" 263 
    "S*W" 264 
    "WyS" 265 
    "SW" 266 
    "WYS" 267 
    "SG" 268
]
```

[10:30:24](#vIQ1iaYWbNf3IBtc28C_PDQ2SQR2WfMGvkkTDp5psXo) <toomasv>:
* There is something wrong with compression too:
```
>> codes: LZWCompress2 "WyS*WyGWYS*WySWYSG"
== [87 121 83 42 256 71 87 89 258 256 83 256 83 71]
;                                         ^     <----- wrong, should be 262
>> probe at to-block codeTable 513 ()
[
    "Wy" 256 
    "yS" 257 
    "S*" 258 
    "*W" 259 
    "WyG" 260 
    "GW" 261 
    "WY" 262 
    "YS" 263 
    "S*W" 264 
    "WyS" 265 
    "SW" 266 
    "WYS" 267 
    "SG" 268
]
```

[10:32:14](#Pl281KTG6YKlvryocT_dXpOnT_SpsniDKRYoIgt_pDA) <toomasv>:
* There is something wrong with compression too (provided `put codeTable wc codeTableSize` is corrected):
```
>> codes: LZWCompress2 "WyS*WyGWYS*WySWYSG"
== [87 121 83 42 256 71 87 89 258 256 83 256 83 71]
;                                         ^     <----- wrong, should be 262
>> probe at to-block codeTable 513 ()
[
    "Wy" 256 
    "yS" 257 
    "S*" 258 
    "*W" 259 
    "WyG" 260 
    "GW" 261 
    "WY" 262 
    "YS" 263 
    "S*W" 264 
    "WyS" 265 
    "SW" 266 
    "WYS" 267 
    "SG" 268
]
```

[10:32:26](#adbYpMvwPS_kg8ICBB8VJeq--GIGWNI2bvirLpYvCpA) <toomasv>:
* There is something wrong with compression too (provided `put/case codeTable wc codeTableSize` is corrected):
```
>> codes: LZWCompress2 "WyS*WyGWYS*WySWYSG"
== [87 121 83 42 256 71 87 89 258 256 83 256 83 71]
;                                         ^     <----- wrong, should be 262
>> probe at to-block codeTable 513 ()
[
    "Wy" 256 
    "yS" 257 
    "S*" 258 
    "*W" 259 
    "WyG" 260 
    "GW" 261 
    "WY" 262 
    "YS" 263 
    "S*W" 264 
    "WyS" 265 
    "SW" 266 
    "WYS" 267 
    "SG" 268
]
```

[12:03:43](#hqtFiNhewwgPdG5kx4Mx9qoHGGK5ojcKX-YIJfXIv8o) <ldci (François Jouen)>:
@toomasv : Strings seem insensitive. « ab » = « AB » . So Wy (256) = WY(262) 

[12:05:08](#S_0xARu-sUp04lHhlw71NLcUC20FpNDGgQ-iNTex3zc) <toomasv>:
Yes, but I use `find/case` ja `put/case`!

[12:05:21](#DJa3tfebLABCw2gO9CKFOlfetIMJEcFQbbZ-7W8jDIY) <toomasv>:
* Yes, but I use `find/case` and `put/case`!

[12:05:35](#cxTobigSeWC3TzHYsbN7ELxSSR0d5M-j4gYE3jQ-75U) <toomasv>:
* @ldci Yes, but I use `find/case` and `put/case`!

[12:08:44](#Uqjb_RE-Dl2rXAJRZyByMNcAggg2c8uVjRSpU-LC5LQ) <ldci (François Jouen)>:
@toomasv Me too with R3 : same problem 

[12:10:41](#OdUKyamDWfF3viSKy4wLd80SFidUWSpM45Ex_Gcm0y0) <ldci (François Jouen)>:
With put/case all strings are in uppercase
```
WyS*WyGWYS*WySWYSG
[
    256 "WY"
    257 "YS"
    258 "S*"
    259 "*W"
    260 "WYG"
    261 "GW"
    262 "WY"
    263 "YS"
    264 "S*W"
    265 "WYS"
    266 "SW"
    267 "WYS"
    268 "SG"
]
```


[12:17:43](#DAAQ34wnk221b8lfpDvTKodNdUj6yJOw3rAIJXKvQXs) <toomasv>:
Weird!

[12:18:51](#0Abbf7E6GPwMLJO89DuEGP5OsHMNPerAzgWIXxxevR0) <toomasv>:
@Oldes Is that intended?

[12:34:58](#oPtZMAT4QR_JOHSmonYyrLtA5TVZ4gNs-vbsm3xKX0s) <ldci (François Jouen)>:
@toomasv . Making comparison on binary values correct the problem: `87 121 83 42 256 71 87 89 258 256 83 262 83 71`


[12:43:20](#DQvjYCx60XoZu9h86mThCy4wCNauoQDLAOqE4O7MOE8) <ldci (François Jouen)>:
@toomasv It works!
```
String  WyS*WyGWYS*WySWYSG
87 121 83 42 256 71 87 89 258 256 83 262 83 71
Result  WyS*WyGWYS*WySWYSG
```


[13:20:48](#e2PsZyidRtPoBLPTyHd2ArN1ewqoBL6H_nPnyuDaXaM) <ldci (François Jouen)>:
```
#!/usr/local/bin/rred
Red [
]
;--Thanks to Toomas Vooglaid for his help
LZWCompress: function [
    "Compress a string to a list of output symbols"
    string [string!]
][
    ;--Initialize codeTable
    codeTableSize: 256
    codeTable: make map! []
    i: 0
    while [i < codeTableSize] [
        put codeTable to-binary to-char i i ;--char-->integer
        i: i + 1
    ]
    outPut: clear []
    w: to-binary string/1
    foreach c next string [
        wc: to-binary rejoin [w c]
        either find codeTable wc [w: wc][
            ;--Add code to outPut
            append outPut codeTable/:w
            ;--Add wc to the codeTable.
            put codeTable wc codeTableSize
            codeTableSize: codeTableSize + 1
            w: to-binary c
        ]
    ]
    ;--Output the code for the last w
    if w [append outPut codeTable/:w]
]
```


[13:21:16](#sChtOw37Z_vWt4RS86sXGObJZsJwIlXxoX9-b8P39mM) <ldci (François Jouen)>:
* ```
#!/usr/local/bin/red
Red [
]
;--Thanks to Toomas Vooglaid for his help
LZWCompress: function [
    "Compress a string to a list of output symbols"
    string [string!]
][
    ;--Initialize codeTable
    codeTableSize: 256
    codeTable: make map! []
    i: 0
    while [i < codeTableSize] [
        put codeTable to-binary to-char i i ;--char-->integer
        i: i + 1
    ]
    outPut: clear []
    w: to-binary string/1
    foreach c next string [
        wc: to-binary rejoin [w c]
        either find codeTable wc [w: wc][
            ;--Add code to outPut
            append outPut codeTable/:w
            ;--Add wc to the codeTable.
            put codeTable wc codeTableSize
            codeTableSize: codeTableSize + 1
            w: to-binary c
        ]
    ]
    ;--Output the code for the last w
    if w [append outPut codeTable/:w]
]
```


[13:22:28](#owTcBg-dbXEaLKp3vSP_mbDnl9-GgED_ei9QO514YpU) <ldci (François Jouen)>:
We don’t need /case refinement

[13:25:36](#M9F7IM-TImjb8dkq69pEkwkJIuG-aeZVcE5IPVnUAtY) <ldci (François Jouen)>:
The decompress function remains unchanged

[13:27:26](#PHwpaBVGC7R91Nhz1gzrnli4JijNCes_LGqSuspxOVg) <toomasv>:
I got it ok too with `/case`:
```
LZWCompress: func [
    "Compress a string to a list of output symbols"
    string [string!]
][
    ;--Initialize codeTable
    codeTableSize: 256
    codeTable: make map! []
    i: 0
    while [i < codeTableSize] [
        put codeTable to-char i i 
        i: i + 1
    ]
    outPut: clear []
    w: string/1
    foreach c next string [
        wc: rejoin [w c]
        either find/case codeTable wc [w: wc][
            ;--Add code to outPut
	    append outPut select/case codeTable w  ; <----- !
            ;--Add wc to the codeTable.
            put/case codeTable wc codeTableSize
            codeTableSize: codeTableSize + 1
            w: c
        ]
    ]
    ;--Output the code for the last w
    if w [append outPut codeTable/:w]
]
```

[13:27:43](#gGKXIFaALFQIPHeFzWMooWQ4iswUSP1w9hCNz3RxQ7k) <toomasv>:
* I got it ok too with `/case`:
```
LZWCompress: func [
    "Compress a string to a list of output symbols"
    string [string!]
][
    ;--Initialize codeTable
    codeTableSize: 256
    codeTable: make map! []
    i: 0
    while [i < codeTableSize] [
        put codeTable to-char i i 
        i: i + 1
    ]
    outPut: clear []
    w: string/1
    foreach c next string [
        wc: rejoin [w c]
        either find/case codeTable wc [w: wc][
            ;--Add code to outPut
	    append outPut select/case codeTable w  ; <----- !!!
            ;--Add wc to the codeTable.
            put/case codeTable wc codeTableSize
            codeTableSize: codeTableSize + 1
            w: c
        ]
    ]
    ;--Output the code for the last w
    if w [append outPut codeTable/:w]
]
```

[13:28:38](#wJZYgC-iSHAG-nb3oik1Qg_nkrf8qfi5m5xb_c7w1-c) <toomasv>:
* I got it ok too with `/case`:
```
LZWCompress: func [
    "Compress a string to a list of output symbols"
    string [string!]
][
    ;--Initialize codeTable
    codeTableSize: 256
    codeTable: make map! []
    i: 0
    while [i < codeTableSize] [
        put codeTable to-char i i 
        i: i + 1
    ]
    outPut: clear []
    w: string/1
    foreach c next string [
        wc: rejoin [w c]
        either find/case codeTable wc [w: wc][
            ;--Add code to outPut
	    append outPut select/case codeTable w  ; <----- !!!
            ;--Add wc to the codeTable.
            put/case codeTable wc codeTableSize
            codeTableSize: codeTableSize + 1
            w: c
        ]
    ]
    ;--Output the code for the last w
    if w [append outPut select/case codeTable w]   ; <----- !!!
]
```

[13:28:49](#CuTeLFmci7mjERbKr2taebL9DGS-0lXpJ360qTUgpk8) <toomasv>:
* I got it ok too with `/case`:
```
LZWCompress: func [
    "Compress a string to a list of output symbols"
    string [string!]
][
    ;--Initialize codeTable
    codeTableSize: 256
    codeTable: make map! []
    i: 0
    while [i < codeTableSize] [
        put codeTable to-char i i 
        i: i + 1
    ]
    outPut: clear []
    w: string/1
    foreach c next string [
        wc: rejoin [w c]
        either find/case codeTable wc [w: wc][
            ;--Add code to outPut
	    append outPut select/case codeTable w  ; <----- !!!
            ;--Add wc to the codeTable.
            put/case codeTable wc codeTableSize
            codeTableSize: codeTableSize + 1
            w: c
        ]
    ]
    ;--Output the code for the last w
    if w [append outPut select/case codeTable w]  ; <----- !!!
]
```

[13:29:39](#F-NM4WV2ni00hJd5vUpXYGEyTzjGump-Z6t_beihL_A) <toomasv>:
* I got it ok too with `/case`:
```
LZWCompress: func [
    "Compress a string to a list of output symbols"
    string [string!]
][
    ;--Initialize codeTable
    codeTableSize: 256
    codeTable: make map! []
    i: 0
    while [i < codeTableSize] [
        put codeTable to-char i i 
        i: i + 1
    ]
    outPut: clear []
    w: string/1
    foreach c next string [
        wc: rejoin [w c]
        either find/case codeTable wc [w: wc][
            ;--Add code to outPut
            append outPut select/case codeTable w  ; <----- !!!
            ;--Add wc to the codeTable.
            put/case codeTable wc codeTableSize
            codeTableSize: codeTableSize + 1
            w: c
        ]
    ]
    ;--Output the code for the last w
    if w [append outPut select/case codeTable w]  ; <----- !!!
]
```

[13:40:30](#fdmAF1kh-nemWRoxU_U3IFbUkbgX5tljD-DRuVwZBXY) <ldci (François Jouen)>:
@toomasv Nice, just change put to put/case when creating the codeTable. This avoids an error with R3 when decoding.

[13:41:50](#hqN0lvpjpzSxt4qmL-Pk4OQM3F-gUd_JJ8iuWPhgv84) <toomasv>:
@ldci Thanks!

[13:50:36](#BP0KYn4dbQVrnfTnK-2me5w9CLMK2U86MbsXHCgEctc) <ldci (François Jouen)>:
I’ll send you by mail the last version 

[13:52:40](#mxpv2OZjq_EKEg6wUPSPS9gI6qgGKjZRH1cukqKoDJ4) <toomasv>:
:+1: 

[15:04:26](#uRkW04mHGYG9L1BhcOyWuh6oJMFzIvVz7jDCWah6AUE) <ldci (François Jouen)>:
A few hours of collaboration with Toomas and here is the work:
```
#!/usr/local/bin/red
Red [
	Title:    "Red Language: LZW string compression and decompression "
	Authors:  "François Jouen and Toomas Vooglaid"
	File: 	  %LZW.red
	Tabs:	  4
	Rights:  "Copyright (C) 2022 Red Foundation. All rights reserved."
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

;--The Lempel-Ziv-Welch (LZW) algorithm provides loss-less data compression.
;--This code for strings is case-sensitive.

LZWCompress: func [
    "Compress a string to a list of output symbols"
    string [string!]
][
    ;--Initialize codeTable
    codeTableSize: 256
    codeTable: make map! []
    i: 0
    while [i < codeTableSize] [
        put/case codeTable to-char i i 		;--char-->integer
        i: i + 1
    ]
    outPut: clear []
    w: string/1
    foreach c next string [
        wc: rejoin [w c]
        either find/case codeTable wc [w: wc][
            ;--Add code to outPut
        	append outPut select/case codeTable w  
            ;--Add wc to the codeTable.
            put/case codeTable wc codeTableSize
            codeTableSize: codeTableSize + 1
            w: c
        ]
    ]
    ;--Output the code for the last w
    if w [append outPut select/case codeTable w]  
]

LZWDecompress: function [
    "Decompress a list of codes to a string"
    codes    [block!]
][    
    codeTableSize: 256
    codeTable: make map! []
    i: 0
    while [i < codeTableSize] [
        put codeTable i to-char i ;--integer-->char
        i: i + 1
    ]
    old: first codes
    outPut: to-string codeTable/:old
    foreach new next codes [
        if not s: codeTable/:new [
            s: codeTable/:old
            s: rejoin [s to-char c]
        ]
        append outPut s
        c: first to-string s
        codeTable/:codeTableSize: rejoin [codeTable/:old c]
        codeTableSize: codeTableSize + 1
        old: new
    ]
    outPut
]

;-*************************Test*********************************

string: "WyS*WyGWYS*WySWYSG"
print ["String " string]
codes: LZWCompress string
prin "Codes   " probe codes
result: LZWDecompress codes
print ["Result " result]
```


[15:34:36](#1Q4AbNreRxWCPR1NQMgcoOwi4XVOvy7eELOQ8RgTl-o) <toomasv>:
I played a bit further with it and tried `parse`:
```
context [
    stringTable: make map! []
    getCode: func [w [string! char!]][
        either string? w [select/case stringTable w][to-integer w]
    ]
    
    LZWCompress2: function [string [string!]][
        clear StringTable
        code: 256
        w: string/1
        parse next string [
            collect some [
                set c skip (wc: rejoin [w c])
                [ if (find/case stringTable wc) (w: wc)
                | keep (getCode w)
                  (
                    put/case stringTable wc code 
                    code: code + 1 
                    w: c
                  )
                ]
                opt [end keep (getCode w)]
            ]
        ]
    ]
```
It seems to be more efficient:
```
string: "abracadabraaaa"
>> profile/count/show [[LZWCompress string][LZWCompress2 string]] 1000 recycle
Count: 1000
Time         | Time (Per)   |      Memory | Code
0:00:00.069  | 0:00:00      |     3684284 | [LZWCompress2 string]
0:00:00.398  | 0:00:00      |    39596440 | [LZWCompress string]
```

[15:39:49](#N6Ma6cvvnqKv9hvAzRt_MnFMsaePTsjQFjc2yqHZODo) <toomasv>:
* I played a bit further with it and tried `parse`:
```
context [
    stringTable: make map! []
    getCode: func [w [string! char!]][
        either string? w [select/case stringTable w][to-integer w]
    ]
    
    LZWCompress2: function [string [string!]][
        clear StringTable
        code: 256
        w: string/1
        parse next string [
            collect some [
                set c skip (wc: rejoin [w c])
                [ if (find/case stringTable wc) (w: wc)
                | keep (getCode w)
                  (
                    put/case stringTable wc code 
                    code: code + 1 
                    w: c
                  )
                ]
                opt [end keep (getCode w)]
            ]
        ]
    ]
```
It seems to be more efficient:
```
>> string: "abracadabraaaa"
>> recycle/off
>> profile/count/show [[LZWCompress string][LZWCompress2 string]] 1000 recycle
Count: 1000
Time         | Time (Per)   |      Memory | Code
0:00:00.069  | 0:00:00      |     3684284 | [LZWCompress2 string]
0:00:00.398  | 0:00:00      |    39596440 | [LZWCompress string]
```

[15:43:35](#gSzL89JN8sXR5D_mG7LAoqm-L_K-7Yv2aFAH5QAAzCo) <toomasv>:
* I played a bit further with it and tried `parse`:
```
context [
    stringTable: make map! []
    getCode: func [w [string! char!]][
        either string? w [select/case stringTable w][to-integer w]
    ]
    
    set LZWCompress2 function [string [string!]][
        clear StringTable
        code: 256
        w: string/1
        parse next string [
            collect some [
                set c skip (wc: rejoin [w c])
                [ if (find/case stringTable wc) (w: wc)
                | keep (getCode w)
                  (
                    put/case stringTable wc code 
                    code: code + 1 
                    w: c
                  )
                ]
                opt [end keep (getCode w)]
            ]
        ]
    ]
```
It seems to be more efficient:
```
>> string: "abracadabraaaa"
>> recycle/off
>> profile/count/show [[LZWCompress string][LZWCompress2 string]] 1000 recycle
Count: 1000
Time         | Time (Per)   |      Memory | Code
0:00:00.069  | 0:00:00      |     3684284 | [LZWCompress2 string]
0:00:00.398  | 0:00:00      |    39596440 | [LZWCompress string]
```

[15:58:40](#P9MNdQl9vfXzty9LjwTOORKndkvga4wjCAZJEa3lGK4) <ldci (François Jouen)>:
@toomasv Possible : string concatenation in a loop seems to be O(N^2)

[16:39:26](#-FCY1qPJT3ESnAYhZP5zuZ4SojCF0tRUD_hXlnzX0lE) <toomasv>:
^ Note that it should be `set 'LZWCompress2...`; I edited and messed it up.

[16:40:10](#AlEGkrUX3vMjRRRy3x0wf1-0LB92NIGi76U9WJVG390) <toomasv>:
* ^ Note that it should be `set 'LZWCompress2...`, and closing bracket is missing; I edited and messed it up.

[16:41:45](#fGWP6DWA53qPvVm7Ct4r-lZUqj67tdU9JNC6EGHsmFY) <toomasv>:
* ^ Note that it should be `set 'LZWCompress2...`, and closing bracket is missing; I edited and messed it up. Sorry for sloppiness!

[16:51:20](#VN7WFz45EyJF_8-VxrPUHr0LorY3BIdnUDbyME5IKU8) <dockimbel>:
Looks great! Please post the final version to red/code repo.

[16:56:14](#ZTzwXApLOQigZL-To8jFP7ammSJJ-lu-Evr3n5zKkTY) <toomasv>:
Together with decompression:
```
context [
    stringTable: make map! []
    getCode: func [w [string! char!]][
        either string? w [select/case stringTable w][to-integer w]
    ]
    getString: func [code [integer!]][
        either code > 255 [stringTable/:code][to-char code]
    ]
    
    set 'LZWCompress2 function [string [string!]][
        clear StringTable
        code: 256
        w: string/1
        parse next string [
            collect some [
                set c skip (wc: rejoin [w c])
                [ if (find/case stringTable wc) (w: wc)
                | keep (getCode w)
                  (
                    put/case stringTable wc code 
                    code: code + 1 
                    w: c
                  )
                ]
                opt [end keep (getCode w)]
            ]
        ]
    ]
    
    set 'LZWDecompress2 function [codes [block!]][
        clear stringTable
        code: 256
        old: first codes
        rejoin parse next codes [
            collect [
                keep (getString old)
                some [
                    set new skip
                    opt [if (not s: getString new)(s: rejoin [getString old c])]
                    keep (s);(print [old new s])
                    (
                        c: first to-string s
                        stringTable/:code: rejoin [getString old c]
                        code: code + 1
                        old: new
                    )
                ]
            ]
        ]
    ]
]
```

[17:00:59](#dqw3ppZEigbYiwIKzcbT61L5YehvvIrecuWVrYWmj4I) <toomasv>:
```
>> string: "WyS*WyGWYS*WySWYSG"
== "WyS*WyGWYS*WySWYSG"
>> codes: LZWCompress2 string
== [87 121 83 42 256 71 87 89 258 256 83 262 83 71]
>> recycle/off
>> profile/count/show [[LZWDecompress codes][LZWDecompress2 codes]] 1000 recycle
Count: 1000
Time         | Time (Per)   |      Memory | Code
0:00:00.085  | 0:00:00      |     2920284 | [LZWDecompress2 codes]
0:00:00.397  | 0:00:00      |    39828440 | [LZWDecompress codes]
```

[17:30:44](#gw2VJat9nzemYhFjQz64V0_ElZ_FUVN1ZNjUOiZ0EMU) <toomasv>:
@dsunanda pointed out decompression was faulty for cases like `LZWDecompress2 LZWCompress2 "AAA"`. Thanks!
Here is correction:
```
    set 'LZWDecompress2 function [codes [block!]][
        clear stringTable
        code: 256
        old: first codes
        rejoin parse next codes [
            collect [
                keep (x: getString old) 
                some [
                    set new skip 
                    opt [if (not s: getString new)(s: rejoin [getString old any [c x]])]
                    keep (s)
                    (
                        c: first to-string s
                        stringTable/:code: rejoin [getString old c]
                        code: code + 1
                        old: new
                    )
                ]
            ]
        ]
    ]
```
```
>> LZWDecompress2 LZWCompress2 "AAA"
== "AAA"
```
More testing and bughunting very welcome!

[17:52:44](#3YLepASeYy10oe9S5jVvxHkd4HMX0RbDxZfaOLHHf64) <toomasv>:
Next improvement prompted by @dsunanda (case `LZWDecompress2 LZWCompress2 s: "^/"`):
```
    set 'LZWCompress2 function [string [string!]][
        clear StringTable
        code: 256
        probe old: first string
        parse next string [
            collect some [
                set new skip (probe composed: rejoin [old new])
                [ if (find/case stringTable composed) (old: composed)
                | keep (getCode old)
                  (
                    put/case stringTable composed code 
                    code: code + 1 
                    old: new
                  )
                ]
                opt [end keep (getCode old)]
            |   end keep (getCode old)
            ]
        ]
    ]
```

[17:52:51](#mXqzWNfSoxoGb11nwyJBeiMAUI86Ea40k3lO4mGdmyE) <ldci (François Jouen)>:
@toomasv Just read on the internet. Not specialist :)

[17:54:06](#_XL_UndYbyeqiY_7COsmEzt45AcrfQtg5CJoTwbzsVs) <toomasv>:
* Next improvement prompted by @dsunanda (case `LZWDecompress2 LZWCompress2 s: "^/"`):
```
    set 'LZWCompress2 function [string [string!]][
        clear StringTable
        code: 256
        old: first string
        parse next string [
            collect some [
                set new skip (composed: rejoin [old new])
                [ if (find/case stringTable composed) (old: composed)
                | keep (getCode old)
                  (
                    put/case stringTable composed code 
                    code: code + 1 
                    old: new
                  )
                ]
                opt [end keep (getCode old)]
            |   end keep (getCode old)
            ]
        ]
    ]
```

[17:54:32](#QM0SnIrJK5ytwxQnbPak3bb4Gvh3u4QcHPLCCTEQl7Q) <toomasv>:
* Next improvement prompted by @dsunanda (case `LZWDecompress2 LZWCompress2 s: "^/"`):
```
    set 'LZWCompress2 function [string [string!]][
        clear StringTable
        code: 256
        old: first string
        parse next string [
            collect some [
                set new skip (composed: rejoin [old new])
                [ if (find/case stringTable composed) (old: composed)
                | keep (getCode old)
                  (
                    put/case stringTable composed code 
                    code: code + 1 
                    old: new
                  )
                ]
                opt [end keep (getCode old)]
            |   end keep (getCode old)
            ]
        ]
    ]
```
```
>> LZWDecompress2 LZWCompress2 s: "^/"
== "^/"
```

[17:54:42](#zESn8SrSCx2ybgiGmtDRtFIOGQYXBF7iMx9IrvkXir4) <toomasv>:
* Next improvement prompted by @dsunanda (case `LZWDecompress2 LZWCompress2 s: "^/"`):
```
    set 'LZWCompress2 function [string [string!]][
        clear StringTable
        code: 256
        old: first string
        parse next string [
            collect some [
                set new skip (composed: rejoin [old new])
                [ if (find/case stringTable composed) (old: composed)
                | keep (getCode old)
                  (
                    put/case stringTable composed code 
                    code: code + 1 
                    old: new
                  )
                ]
                opt [end keep (getCode old)]
            |   end keep (getCode old)
            ]
        ]
    ]
```
```
>> LZWDecompress2 LZWCompress2 "^/"
== "^/"
```

[18:11:03](#C3JxTgJZOqs2hjWr9QusnuFGLYMqhKZs-HQyuJEpOi8) <toomasv>:
And `LZWCompress` should start with `if empty? string [return copy []]` and LZWDecompress2 should start with `if empty? codes [return copy ""]`. 
Thanks to @dsunanda again!

[18:20:58](#T_y59q4OFfmGUNY4RP4kK6lcjxj2TIQMAtt9KEfbzvQ) <toomasv>:
* And `LZWCompress2` should start with `if empty? string [return copy []]` and `LZWDecompress2` should start with `if empty? codes [return copy ""]`. 
Thanks to @dsunanda again!

[19:47:54](#-aHvNIRK5HDS1ZtOBiY6SOa6Sw9uyXVF6rDL2C1L-cM) <toomasv>:
Ok, with all corrections:
```
context [
    stringTable: make map! []
    getCode: func [w [string! char!]][
        either string? w [select/case stringTable w][to-integer w]
    ]
    getString: func [code [integer!]][
        either code > 255 [stringTable/:code][to-char code]
    ]
    
    set 'LZWCompress2 function [string [string!]][
        if empty? string [return copy []]
        clear StringTable
        code: 256
        old: first string
        ending: [end keep (getCode old)]
        parse next string [
            collect some [
                set new skip (composed: rejoin [old new])
                [ if (find/case stringTable composed) (old: composed)
                | keep (getCode old)
                  (
                    put/case stringTable composed code 
                    code: code + 1 
                    old: new
                  )
                ]
                opt ending
            |   ending
            ]
        ]
    ]
    
    set 'LZWDecompress2 function [codes [block!]][
        if empty? codes [return copy ""]
        clear stringTable
        code: 256
        old: first codes
        rejoin parse next codes [
            collect [
                keep (x: getString old) 
                some [
                    set new skip 
                    opt [if (not s: getString new)(s: rejoin [getString old any [c x]])]
                    keep (s)
                    (
                        c: first to-string s
                        stringTable/:code: rejoin [getString old c]
                        code: code + 1
                        old: new
                    )
                ]
            ]
        ]
    ]
]
```

## 20-Jul-2022

[7:39:38](#WlpSpJItlCI3QA0VPhyngk_xJTVjXsiOkodUuXHeULM) <toomasv>:
[Codes](https://github.com/toomasv/LZW/blob/main/LZW.red) are now  extendable:
```
>> lzw-ctx/limit: 1000000
== 1000000
>> str: {plate: "tropical stuff: 🍌🍍 and other healthy food: 🥒🍅🥕"}
== {plate: "tropical stuff: 🍌🍍 and other healthy food: 🥒🍅🥕"}
>> cod: lzw-compress str
== [112 108 97 116 101 58 32 34 116 114 111 112 105 99 97 108 32 115 116 117 102 102 1000005 127820 127821 32 97 110 100 32 111 116 104 101 114 32 1000032 100001...
>> lzw-decompress cod
== {plate: "tropical stuff: 🍌🍍 and other healthy food: 🥒🍅🥕"}
```

[7:41:51](#MCO5lTAYiU-9zjlrloFocwgIHJXnjEqK6jIPqwDZBZg) <toomasv>:
* [Codes](https://github.com/toomasv/LZW/blob/main/LZW.red) are now  extendable, not limited to default 255:
```
>> lzw-ctx/limit: 1000000
== 1000000
>> str: {plate: "tropical stuff: 🍌🍍 and other healthy food: 🥒🍅🥕"}
== {plate: "tropical stuff: 🍌🍍 and other healthy food: 🥒🍅🥕"}
>> cod: lzw-compress str
== [112 108 97 116 101 58 32 34 116 114 111 112 105 99 97 108 32 115 116 117 102 102 1000005 127820 127821 32 97 110 100 32 111 116 104 101 114 32 1000032 100001...
>> lzw-decompress cod
== {plate: "tropical stuff: 🍌🍍 and other healthy food: 🥒🍅🥕"}
```

[7:47:53](#dVEwoUOwYwxGmozvd4WNLo3O9gp1jRuT5Oxm9_pLVhQ) <ldci (François Jouen)>:
@toomasv You’re the best :)

[8:00:22](#vg1af9XZw3kIajyRffXvvrQJTBbM36Au2Vl_M7mjvqw) <toomasv>:
😄 

[8:01:23](#sXlbOFuTMGaLSXpoEftex_Wogrlmq0jNkO2Nf-2yAw8) <greggirwin (Gregg Irwin)>:
:+1:

[8:32:59](#0tTmmW_mYTFU38hbqg9oNIStJ42cI_UerVIj6m7EBcw) <toomasv>:
This results from another input from @dsunanda, *muchas gracias*!

[8:58:21](#E8LdZDgMwApQqMTP2YvdkBRdP2PCUCCAtujgNMa1NYo) <toomasv>:
Another example of usage:
```
>> str: read https://github.com/red/docs/blob/master/en/parse.adoc
== {^/^/^/^/^/^/^/<!DOCTYPE html>^/<html lang="en" data-color-mode="auto" data-light-theme="light" data-dark-theme="dark" data-a11y-animated-images="system">^/  ...
>> i: lzw-ctx/top str
== 129520
>> cod: lzw-compress/size str i + 1
== [10 129521 129522 10 60 33 68 79 67 84 89 80 69 32 104 116 109 108 62 129524 129535 129537 32 108 97 110 103 61 34 101 110 34 32 100 97 116 97 45 99 111 108 1...
>> str2: lzw-decompress cod
== {^/^/^/^/^/^/^/<!DOCTYPE html>^/<html lang="en" data-color-mode="auto" data-light-theme="light" data-dark-theme="dark" data-a11y-animated-images="system">^/  ...
>> str = str2
== true
```

[9:10:49](#Fyg5THGV55sGIYRs-SKHtt7I7Gt3I4AVxCNyJ8SN9Q0) <ldci (François Jouen)>:
@toomasv As usual your code is elegant . The solution with parse is very efficient because it avoids creating a big string table. It also avoids searching the codes in a large map. The only problem is that it is specific to Red parsing.
I rewrote the initial code with your ideas to be able to use it with Red or Rebol
```
#!/usr/local/bin/r3
REBOL [
	Title:    "Red Language: LZW string compression and decompression "
	Authors:  "François Jouen and Toomas Vooglaid"
	File: 	  %LZW2.r3
	Tabs:	  4
	Rights:  "Copyright (C) 2022 Red Foundation. All rights reserved."
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

;--The Lempel-Ziv-Welch (LZW) algorithm provides loss-less data compression.
;--This code for strings is case-sensitive

LZW: context [
	limit: 256 ;Below this are chars, from this up - strings; may be increased if needed
	stringTable: make map! []
	
    getCode: func [w [string! char!]][
        either string? w [select/case stringTable w][to-integer w]
    ]
    
    getString: func [code [integer!]][
        either code > limit [stringTable/:code][to-char code]
    ]
    
    Compress: function [
    	string [string!]
    	/size limit 
    ][
    	if empty? string [return copy []]
        clear StringTable 
        codeTable: copy []
        if limit [self/limit: limit]
        code: self/limit 
        old: string/1
        foreach new next string [
        	composed: rejoin [old new]
			either find/case stringTable composed [old: composed][
				append codeTable getCode old
        		put/case stringTable composed code
            	code: code + 1
            	old: new
        	]
        ]
        codeTable
    ];--end of compress
    
    Decompress: function [
    "Decompress a list of codes to a string"
    	codes    [block!]
    	/size limit
    
	][  
		if empty? codes [return copy ""]
        clear stringTable
        if limit [self/limit: limit]
        code: self/limit 
        old: first codes
        outPut: to-string getString old
        foreach new next codes [
        	if not s: getString new [s: rejoin [getString old c]]
        	append outPut s
        	c: first to-string s
            stringTable/:code: rejoin [getString old c]
            code: code + 1
            old: new
        ]
        outPut
	];--end of Decompress
];--end of context
```


[9:23:44](#9MTwLedeClR3w5I-hdbhdcr_iL2Ww4lKjL-DZzY5EJQ) <toomasv>:
@ldci :+1: 
Only, I had a mistake in `getString`. It should be `code >= limit`.

[9:27:55](#4cOzaMRx3N4nblSXJBkGw6WJurD925nqJcE6wgIFPvA) <ldci (François Jouen)>:
OK I’ll correct :)

[9:29:24](#3zInHvqEaL_Hwj1797dMX06CqExfA3EB5qQ-nlEGMuA) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
You should avoid using functions like `to-string` in tight loops. Use `to string!` instead to avoid unnecessary function calls. Also is good to use `unless` instead of `if not` to avoid one evaluation.

[9:36:22](#dXuYP3QB1A6rp6CSyWd5rHrGrxhkj2KchFjbyOhJwB8) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
For R3, good optimization is use of `ajoin` instead of `rejoin`, when the result is a string.
```
>> profile [[ajoin ["a" "b"]] [rejoin ["a" "b"]]]

Running 2 code blocks 10 times.
----------------------------------------------------------------------------------
Time               | Evals  | S.made | S.expa | Memory      | Code
1.0x (1μs)         | 3      | 1      | 0      | 8           | [ajoin ["a" "b"]]
3.31x (4μs)        | 25     | 3      | 0      | 112         | [rejoin ["a" "b"]]
----------------------------------------------------------------------------------
```

[9:38:40](#BSMYf7s5QHmvR_b2_E6eGyfuWzXq5iYkOWlXXugiu9w) <toomasv>:
Thanks, @Oldes!

[11:16:27](#awxLJ77hl2jWse3l-k3vCz8OqO1Y28aN5znk4G7gVns) <ldci (François Jouen)>:
@Oldes Thanks for optimization for R3. I used rejoin since join and a join do not exist in Red:)

[11:55:39](#SmKuIb0hgGtTgLaMnznastMzgrsY3emC0-SdRZsnz7o) <ldci (François Jouen)>:
R3: test with a complet 255 table:
```
Running 2 code blocks 10 times.
-------------------------------------------------------------------------------
Time               | Evals  | S.made | S.expa | Memory      | Code
error              | 0      | 0      | 0      | 0           | lzw-test
100.0x (100ns)     | 0      | 0      | 0      | 0           | "WyS*WyGWYS*WySWYSG"
-------------------------------------------------------------------------------
--------------
String "WyS*WyGWYS*WySWYSG"
Codes  [87 121 83 42 256 71 87 89 258 256 83 262 83 71]
Result "WyS*WyGWYS*WySWYSG"
0.459
```


[11:56:42](#NRXzWLShR-ADNKqXB87mcSR3AEgS4F0EYV2i92erDgA) <ldci (François Jouen)>:
R3 test with the reduced table 
```
Running 2 code blocks 10 times.
-------------------------------------------------------------------------------
Time               | Evals  | S.made | S.expa | Memory      | Code
error              | 0      | 0      | 0      | 0           | lzw-test
600.0x (600ns)     | 0      | 0      | 0      | 0           | "WyS*WyGWYS*WySWYSG"
-------------------------------------------------------------------------------
--------------
String "WyS*WyGWYS*WySWYSG"
Codes  [87 121 83 42 256 71 87 89 258 256 83 262 83 71]
Result "WyS*WyGWYS*WySWYSG"
0.07
```


[12:02:49](#379KNIBHLyV_BzgvKcLLQ--17H0_IdlvId2Kbd3DYm0) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
You are not using the `profile` correctly!

[12:03:22](#Njd5quOTJED3DlDTxMOBWsdRPUF5exUyncyX9sKmc40) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* You are not using the `profile` correctly! It must be: `profile [[lzw-test "WyS*WyGWYS*WySWYSG"]]`

[12:03:40](#1fvsstn2_XJfeIEOQ6yUJWLAFh5KC23RjqrGq3x0P9U) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
Notice the block inside a block!

[12:03:42](#HLoNWKSIZeUks40hoF4QUul_hJpLk7c5FRkFKw_KpJM) <ldci (François Jouen)>:
@Oldes Oups. 

[12:04:27](#p4AC8xKOr3Xtp5H5g8ClS9oeadvfaR_CQFpkpjQPs7M) <ldci (François Jouen)>:
I was just interested by dt :)

[12:04:40](#DeuOIr1AVD1wUKxcM56N7Mn6hbvMW7k7mGFcUnNIh-g) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
than use `dt`

[12:04:42](#jkd8WyjVsdyu2JrX0wcfdEpj_aHJebqC1kRmQWPT0g4) <GiuseppeChillemi (GiuseppeChillemi)>:
> @Oldes Thanks for optimization for R3. I used rejoin since join and a join do not exist in Red:)

I have never understood the reason.

[12:04:53](#vgzzSrVJXFQO8DD0WHvcG3MYHHwiGoTfG_TluKcm2V0) <Oldes (@oldes-556aec4015522ed4b3e131da:gitter.im)>:
* than use `dt`, but `profile` is much more precise.

## 22-Jul-2022

[13:49:54](#wY-6ni2Pd31Wy81AGLMob7TE4mBLPrX4RHdtWwquRUg) <toomasv>:
Added [LZW21](https://github.com/toomasv/LZW/blob/main/LZW21.red) and [LZW22](https://github.com/toomasv/LZW/blob/main/LZW22.red) to the repo. LZW21 should work on both R3 and Red. LZW22 is attempt to further optimize the algorithm mainly regarding the usage of memory. I haven't tried to run it on R3. Tests and comments welcome!

[14:41:54](#ed9gr-ofjMfJg0vkv4NWTOrWWLTpMvGR6VIVyI2jF_Q) <ldci (François Jouen)>:
@toomasv Thanks :)

[18:01:55](#wKJ8AVYxVeHb7fih-y3LETSE2N85oq3vbN63GGFLx50) <greggirwin (Gregg Irwin)>:
:+1:

## 1-Aug-2022

[13:36:28](#kK15jX5ECZfDQHL-Q11ecLb2-Z1B5BesJGJUT9-YXqI) <ldci (François Jouen)>:
While Toomas continues decoding gif files, I have updated the Tiff library for reading and writing Tiff files : https://github.com/ldci/TiffLib

[13:36:47](#6XlYvEr10rLtFGZdqyDzAoc4i_0bMEIYZT5VVMBZjgE) <ldci (François Jouen)>:
[![image.png](https://files.gitter.im/55f4ffc80fc9f982beb085e7/uYAo/thumb/image.png)](https://files.gitter.im/55f4ffc80fc9f982beb085e7/uYAo/image.png)

[17:04:31](#J7Y0ICGVERNH_0bF1b6MD5SP8kSV9yBZkvb5x-H4x9g) <dockimbel>:
:+1:

[23:45:01](#rO02zIuZQzsZ-16iprsazPbXHFPLCJio-4E_chVHTQI) <cloutiy (yc)>:
Aka Tiffany library?

## 2-Aug-2022

[5:06:38](#ibJKwFsfKPmEzLOia-TMJmk34fHsvVC-z4NPWKvkVIk) <ldci (François Jouen)>:
@cloutiy :)

## 3-Aug-2022

[17:23:48](#gXCsu4lVliaAxJihWAuEue3NLKUeUjLjDSLjKbD6EtI) <gurzgri>:
@fix I can compile 

```Red
Red/System []                                                   ;-- correct header Red/System, not Red ?

#import [
  "libsecp256k1.so" cdecl [
    context_create: "secp256k1_context_create" [
      flags [integer!]
      return: [pointer! [byte!]]
    ]
    pubkey_create: "secp256k1_ec_pubkey_create" [
      ctx [pointer! [byte!]]
      pubkey [pointer! [byte!]]
      seckey [pointer! [byte!]]
      return: [integer!]
    ]
  ]
]

create: func [
  return: [c-string!]                                              ;-- return: before /local
  /local ctx pubkey seckey
][
  ctx: context_create 1
  pubkey: declare pointer! [byte!]
  seckey: declare pointer! [byte!]
  pubkey_create ctx pubkey seckey
  as c-string! ctx                                                     ;-- return type
]
```

on Windows with

```Red
PS> red-toolchain -t Linux -c thoorens.reds
-=== Red Compiler 0.6.4 ===-
Compiling C:\Users\Christian Ensel\Development\thoorens.reds ...
Target: Linux
Compiling to native code...
...compilation time : 235 ms
...global words     : 4992 (15.17%)
...linking time     : 16 ms
...output file size : 7752 bytes
...output file      : C:\Users\Christian Ensel\Development\thoorens
```

but can't execute, no Linux here.



## 4-Aug-2022

[6:19:39](#Omxdax3jZocesk0Bkcy2arFg6G3LLDKcvc72na1mXiM) <fix (François-Xavier Thoorens)>:
@gurzgri nice, sounds ok here too! now i have a "wrong ELF class: ELFCLASS64" error with execution, but i know how to solve it.
Side note, compiler is not really meaning full. I think some kind of preprocessor could be really helpful for these kind of (beginners) errors

[6:45:34](#KDShnfotnlu4M-HC2zAGaroIN6sR_bmxmg72BxcCM_g) <hiiamboris (NOT THIS ONE)>:
compiler is throwaway

[6:46:40](#He2GX1isX1ZumDs7ryRRTQ5qHZ2dlPHfeax7J15dWNs) <hiiamboris (NOT THIS ONE)>:
* compiler is throwaway, will be replaced by 64 bit one

[6:49:18](#H13lh7XsB_DE9LhKHifjA7LV9IXKkK7lRor0wqU2OhI) <fix (François-Xavier Thoorens)>:
yes, but in the between i need to deal with 32 😉

[6:49:37](#ZMbnw7p2VvLwBKm18DCzAAipYAN2FA5nOSvUvvZC0hc) <fix (François-Xavier Thoorens)>:
bbtw is there some cheat sheet to match C types with red types ?

[6:50:20](#ZYzSMQca_B1fvtKdxtPACtdCwmzsiYJgFsPfzwsZM84) <hiiamboris (NOT THIS ONE)>:
only R/S specs afaik

## 3-Sep-2022

[9:39:54](#fSIG3FgjDOrc_3_Xk8bHiXIP7tu1_0wPT_m6inbImmk) <ldci (François Jouen)>:
@fix Have a look here: https://github.com/ldci/OpenCV3-red for matching C and Red/S types

## 9-Sep-2022

[7:57:04](#MdzgRfhTkC1VZTkMtZGT3HM61knLJJQrJQQsUUds5JE) <Rebol2Red (Rebol2Red)>:
@toomasv ```
lz: context [
    stringTable: make map! []
    getCode: func [w [string! char!]][
        either string? w [select/case stringTable w][to-integer w]
    ]
    getString: func [code [integer!]][
        either code > 255 [stringTable/:code][to-char code]
    ]

    set 'LZWCompress2 function [string [string!]][
        if empty? string [return copy []]
        clear StringTable
        code: 256
        old: first string
        ending: [end keep (getCode old)]
        parse next string [
            collect some [
                set new skip (composed: rejoin [old new])
                [ if (find/case stringTable composed) (old: composed)
                | keep (getCode old)
                  (
                    put/case stringTable composed code 
                    code: code + 1 
                    old: new
                  )
                ]
                opt ending
            |   ending
            ]
        ]
    ]

    set 'LZWDecompress2 function [codes [block!]][
        if empty? codes [return copy ""]
        clear stringTable
        code: 256
        old: first codes
        rejoin parse next codes [
            collect [
                keep (x: getString old) 
                some [
                    set new skip 
                    opt [if (not s: getString new)(s: rejoin [getString old any [c x]])]
                    keep (s)
                    (
                        c: first to-string s
                        stringTable/:code: rejoin [getString old c]
                        code: code + 1
                        old: new
                    )
                ]
            ]
        ]
    ]
]
```
```
str: {plate: "tropical stuff: 🍌🍍 and other healthy food: 🥒🍅🥕"}
cod: lzwcompress2 str
probe cod
print lzwdecompress2 cod
```
I get this output:
```
plate: "tropical stuff: : :none: and other healthy food: : :none:nonen"
```

[7:57:24](#Yd9rOd_wNfExd7pzlaJrqiwjSPhEEaXevKztsjUdoTA) <Rebol2Red (Rebol2Red)>:
* @toomasv 
```
lz: context [
    stringTable: make map! []
    getCode: func [w [string! char!]][
        either string? w [select/case stringTable w][to-integer w]
    ]
    getString: func [code [integer!]][
        either code > 255 [stringTable/:code][to-char code]
    ]

    set 'LZWCompress2 function [string [string!]][
        if empty? string [return copy []]
        clear StringTable
        code: 256
        old: first string
        ending: [end keep (getCode old)]
        parse next string [
            collect some [
                set new skip (composed: rejoin [old new])
                [ if (find/case stringTable composed) (old: composed)
                | keep (getCode old)
                  (
                    put/case stringTable composed code 
                    code: code + 1 
                    old: new
                  )
                ]
                opt ending
            |   ending
            ]
        ]
    ]

    set 'LZWDecompress2 function [codes [block!]][
        if empty? codes [return copy ""]
        clear stringTable
        code: 256
        old: first codes
        rejoin parse next codes [
            collect [
                keep (x: getString old) 
                some [
                    set new skip 
                    opt [if (not s: getString new)(s: rejoin [getString old any [c x]])]
                    keep (s)
                    (
                        c: first to-string s
                        stringTable/:code: rejoin [getString old c]
                        code: code + 1
                        old: new
                    )
                ]
            ]
        ]
    ]
]
```
```
str: {plate: "tropical stuff: 🍌🍍 and other healthy food: 🥒🍅🥕"}
cod: lzwcompress2 str
probe cod
print lzwdecompress2 cod
```
I get this output:
```
plate: "tropical stuff: : :none: and other healthy food: : :none:nonen"
```

[7:58:02](#4r-zvHEDf3Qr5xPC18oehAtthtcn-a8yxFh4wUnCKZE) <Rebol2Red (Rebol2Red)>:
* @toomasv 
```
lz: context [
    stringTable: make map! []
    getCode: func [w [string! char!]][
        either string? w [select/case stringTable w][to-integer w]
    ]
    getString: func [code [integer!]][
        either code > 255 [stringTable/:code][to-char code]
    ]

    set 'LZWCompress2 function [string [string!]][
        if empty? string [return copy []]
        clear StringTable
        code: 256
        old: first string
        ending: [end keep (getCode old)]
        parse next string [
            collect some [
                set new skip (composed: rejoin [old new])
                [ if (find/case stringTable composed) (old: composed)
                | keep (getCode old)
                  (
                    put/case stringTable composed code 
                    code: code + 1 
                    old: new
                  )
                ]
                opt ending
            |   ending
            ]
        ]
    ]

    set 'LZWDecompress2 function [codes [block!]][
        if empty? codes [return copy ""]
        clear stringTable
        code: 256
        old: first codes
        rejoin parse next codes [
            collect [
                keep (x: getString old) 
                some [
                    set new skip 
                    opt [if (not s: getString new)(s: rejoin [getString old any [c x]])]
                    keep (s)
                    (
                        c: first to-string s
                        stringTable/:code: rejoin [getString old c]
                        code: code + 1
                        old: new
                    )
                ]
            ]
        ]
    ]
]
```
```
str: {plate: "tropical stuff: 🍌🍍 and other healthy food: 🥒🍅🥕"}
cod: lzwcompress2 str
print lzwdecompress2 cod
```
I get this output:
```
plate: "tropical stuff: : :none: and other healthy food: : :none:nonen"
```

[7:58:32](#-ru9PdqqdghwcjSdNVk5GGegZSdhqQ1t6AZZ10mXAMc) <Rebol2Red (Rebol2Red)>:
* @toomasv 
```
LZW: context [
    stringTable: make map! []
    getCode: func [w [string! char!]][
        either string? w [select/case stringTable w][to-integer w]
    ]
    getString: func [code [integer!]][
        either code > 255 [stringTable/:code][to-char code]
    ]

    set 'LZWCompress2 function [string [string!]][
        if empty? string [return copy []]
        clear StringTable
        code: 256
        old: first string
        ending: [end keep (getCode old)]
        parse next string [
            collect some [
                set new skip (composed: rejoin [old new])
                [ if (find/case stringTable composed) (old: composed)
                | keep (getCode old)
                  (
                    put/case stringTable composed code 
                    code: code + 1 
                    old: new
                  )
                ]
                opt ending
            |   ending
            ]
        ]
    ]

    set 'LZWDecompress2 function [codes [block!]][
        if empty? codes [return copy ""]
        clear stringTable
        code: 256
        old: first codes
        rejoin parse next codes [
            collect [
                keep (x: getString old) 
                some [
                    set new skip 
                    opt [if (not s: getString new)(s: rejoin [getString old any [c x]])]
                    keep (s)
                    (
                        c: first to-string s
                        stringTable/:code: rejoin [getString old c]
                        code: code + 1
                        old: new
                    )
                ]
            ]
        ]
    ]
]
```
```
str: {plate: "tropical stuff: 🍌🍍 and other healthy food: 🥒🍅🥕"}
cod: lzwcompress2 str
print lzwdecompress2 cod
```
I get this output:
```
plate: "tropical stuff: : :none: and other healthy food: : :none:nonen"
```

[7:59:37](#TfLjVjt8LmCR8dfbLq_QxxTQvF9RwJitp7NBNog81_U) <Rebol2Red (Rebol2Red)>:
* @toomasv 
```
LZW: context [
    stringTable: make map! []
    getCode: func [w [string! char!]][
        either string? w [select/case stringTable w][to-integer w]
    ]
    getString: func [code [integer!]][
        either code > 255 [stringTable/:code][to-char code]
    ]

    set 'LZWCompress2 function [string [string!]][
        if empty? string [return copy []]
        clear StringTable
        code: 256
        old: first string
        ending: [end keep (getCode old)]
        parse next string [
            collect some [
                set new skip (composed: rejoin [old new])
                [ if (find/case stringTable composed) (old: composed)
                | keep (getCode old)
                  (
                    put/case stringTable composed code 
                    code: code + 1 
                    old: new
                  )
                ]
                opt ending
            |   ending
            ]
        ]
    ]

    set 'LZWDecompress2 function [codes [block!]][
        if empty? codes [return copy ""]
        clear stringTable
        code: 256
        old: first codes
        rejoin parse next codes [
            collect [
                keep (x: getString old) 
                some [
                    set new skip 
                    opt [if (not s: getString new)(s: rejoin [getString old any [c x]])]
                    keep (s)
                    (
                        c: first to-string s
                        stringTable/:code: rejoin [getString old c]
                        code: code + 1
                        old: new
                    )
                ]
            ]
        ]
    ]
]
```
```
str: {plate: "tropical stuff: 🍌🍍 and other healthy food: 🥒🍅🥕"}
cod: lzwcompress2 str
print lzwdecompress2 cod
```
I get this output on W10:
```
plate: "tropical stuff: : :none: and other healthy food: : :none:nonen"
```

[9:28:13](#IMUXC4zqdCKu129i9nfXJHD19HKVhOoyQP0QXn8WZoQ) <toomasv>:
@Rebol2Red  You should increase `limit`:
```
do https://raw.githubusercontent.com/toomasv/LZW/main/LZW.red
lzw-ctx/limit: 1000000
str: {plate: "tropical stuff: 🍌🍍 and other healthy food: 🥒🍅🥕"}
cod: lzw-compress str
lzw-decompress cod
== {plate: "tropical stuff: 🍌🍍 and other healthy food: 🥒🍅🥕"}
```

[13:41:22](#Hg3qmhyuFGdQB9RwhEfgfQwuV5dhpxZAgz82v4Ulrnw) <Rebol2Red (Rebol2Red)>:
@toomasv Thank you

[13:41:45](#2n38naaRsiCuYrd__GFoX93ImmDBJTmtxCFsUf25eVk) <Rebol2Red (Rebol2Red)>:
* @toomasv Thanks

[13:42:30](#IJF4NT5LqK1hTN9v_mrBarYpbZMoHpUlbrsZ3agdgOI) <Rebol2Red (Rebol2Red)>:
* @toomasv Ofcourse. Thanks.

[13:44:37](#v2Xa9KH1II-wKJ88hyeyz8E6nGZadMY2CsfTxeAuF_8) <Rebol2Red (Rebol2Red)>:
* @toomasv But ofcourse. Thank you.

[13:54:00](#sICD_Ohbr9sjWxt88Qy75lHQjzVmOIp6cIhGArgW47U) <toomasv>:
You are welcome!

## 10-Sep-2022

[14:53:56](#5xWDz2xx1Ie_749xR6UfpJK5yXM9neJ16iEsIZRJRQ0) <ldci (François Jouen)>:
[![image.png](https://files.gitter.im/55f4ffc80fc9f982beb085e7/sp4E/thumb/image.png)](https://files.gitter.im/55f4ffc80fc9f982beb085e7/sp4E/image.png)

[14:54:02](#VVEdqQgvchu3lafgSZT_EMsmQbpMQoxgMe-IHG4Y5Fg) <ldci (François Jouen)>:
Gif Reader: https://github.com/ldci/GIF

[15:05:30](#ampYGDWh6DuXRKeJJE_uhSSsfrr8gKXsRDYp-AmI_64) <hiiamboris (NOT THIS ONE)>:
Cool! :+1:

[15:06:47](#vAqWwHb4CPuGFkp_HcKQwXKpkMjeBTBPJQZo4QkLPZk) <hiiamboris (NOT THIS ONE)>:
Can you figure out why it won't play gifs produced by [Gifcam](https://downloads.digitaltrends.com/gifcam/windows) ? (I suppose it expects each frame to be own image, while Gifcam produces a progressive gif that only lists changed pixels, or smth like that)

[15:24:14](#IpJvxpCsWPOT8rlFJglKoLKWdOOxbeMnpE8ukqkb0TA) <ldci (François Jouen)>:
@hiiamboris Thanks. Gifcam files seem slightly different from classical gif files. I need to test :)

[16:53:53](#yz7fGPVORYFNOs15eNFvoKmdzVu-YgYF5xhM15fbzU4) <ldci (François Jouen)>:
@hiiamboris. Toomas’s code reads correctly Gifcam files :) 

## 13-Sep-2022

[4:44:22](#3a5QdKJw5L0mGOEj7N9YOg16MjRijqvy7kb4poov83c) <isqwy (尘墨)>:
in the `Red/System` spec   -> 4.8.6 Literal arrays , the example code :
```Reds
e: [1.23e10 "Hello" 789 "World!" 3.14]
pf: as float-ptr! e
probe pf/1                             ;-- outputs 1.23e+010
probe as-c-string e/3                  ;-- outputs Hello
probe e/5                              ;-- outputs 789
probe as-c-string e/7                  ;-- outputs World!
probe pf/5                             ;-- outputs 3.14
```
need help to understand:
is `as-c-string` right?
why `as-c-string e/3` is "hello" and `as-c-string e/7` is "world!"
Thanks!

[6:37:24](#7bZpx3onj_ojs7OT8EjznG667fcyKA8tIh54RFWyi_c) <ldci (François Jouen)>:
@isqwy Have a look here: https://github.com/ldci/Red-System/tree/main/doc

[6:41:40](#bukUVRx5ZspwveuU6CcPgbrsilc2Yxu6S9bOYyRmWCM) <isqwy (尘墨)>:
@ldci Thank you! I'll read it

[6:42:05](#apeP7q7xy5UovifrBTaSP8Kq2pZxKd9z5GpNXQMoqGQ) <ldci (François Jouen)>:
@isqwy You’re welcome

[8:22:53](#AGd3SSLMpbLXT0rObNRPMivFcH9ETw-tg-Ldqv_MCek) <dockimbel>:
@isqwy Quoting the documentation:
> Mixing the different allowed types in the same array is permitted (enumerations can also be used). In such case, the size of each array's slot is either 32-bit, or 64-bit if a float64! value is present.
And for that specific example:
> In the last example, pay attention to the different pointer indexes used, depending on the size (32-bit or 64-bit) of referenced value.

Literal arrays uses `pointer! [integer!]` in a mixed content scenario. As the first value above is 64-bit, accessing the 2nd slot needs `/3`.  `as-c-string` is needed as `e` type is `pointer! [integer!]`.

[8:22:58](#OSP11mEqLacdAXNpd_7_SAFatqW1_LElBnVfKEzYHNo) <dockimbel>:
* @isqwy Quoting the documentation:
> Mixing the different allowed types in the same array is permitted (enumerations can also be used). In such case, the size of each array's slot is either 32-bit, or 64-bit if a float64! value is present.

And for that specific example:
> In the last example, pay attention to the different pointer indexes used, depending on the size (32-bit or 64-bit) of referenced value.

Literal arrays uses `pointer! [integer!]` in a mixed content scenario. As the first value above is 64-bit, accessing the 2nd slot needs `/3`.  `as-c-string` is needed as `e` type is `pointer! [integer!]`.

## 7-Oct-2022

## 2-Nov-2022

[16:46:36](#qx4QRIkwV5p6XXWZi81tTnlqUPoImyzKM3J6Hppgptc) <ldci (François Jouen)>:
[![image.png](https://files.gitter.im/55f4ffc80fc9f982beb085e7/SngA/thumb/image.png)](https://files.gitter.im/55f4ffc80fc9f982beb085e7/SngA/image.png)

[16:46:53](#I16C_FUMalGchmfNYUgirBO2GG3hRyfN2r0-c8AOr-g) <ldci (François Jouen)>:
Thanks to Oldes's efforts, we now have easy access to the latest versions of OpenCV with Rebol 3:)

[17:01:24](#SjhH3Flzqw-Pjl0aSbXt5v6nsIo-PBdT7Nn8vIRmnes) <Respectech (Respectech)>:
That's impressive!

[17:52:11](#yX358H-AY71NHUZfPEh_n6mNJAJXViS_kP1_-N3Ev7U) <ldci (François Jouen)>:
Oldes did a fantastic job: we can run the code on the latest Apple 64-bit processors.

[18:49:19](#Ti3lAKdyZFi5Ps-3ZMjwqI2PK6yZ78_YEKT7Q3sCOpg) <greggirwin (Gregg Irwin)>:
:+1:

## 3-Nov-2022

[11:12:46](#yacyHYeYsbEAnj9w71aC7eeyMKtd_608FWeGoN0gSsQ) <ldci (François Jouen)>:
We can use 1-4 channels images with char to float 64 matrices. I’m really waiting for a Red 64-bit :)

## 15-Nov-2022

[17:37:03](#NCewrp7orlKgS4v5vsB6kmMvOG8JKSPc7JPgIPay84o) <ldci (François Jouen)>:
[![image.png](https://files.gitter.im/55f4ffc80fc9f982beb085e7/X1wN/thumb/image.png)](https://files.gitter.im/55f4ffc80fc9f982beb085e7/X1wN/image.png)

[17:37:05](#R8QL9PLN_lDyIIF7edNWniiLRd38yLpPcWJ45V2ED3s) <ldci (François Jouen)>:
for the fun

[18:11:59](#Uy0imlVfjfOTTh3ejZceSQqS1D9Rp_qwZFj7FRxIfQs) <Respectech (Respectech)>:
Making your own desktop environment?

[18:13:10](#qS2gnTHHJnyS6uBo0GphgQf6cwSntQUs12OdR0SxVUY) <ldci (François Jouen)>:
Nope. Just an homage to NexT OS :)

[18:16:59](#GnYB4UnuIhFjxT-eb7sx-buX7M0W2YbNWmwa1SiWXA4) <greggirwin (Gregg Irwin)>:
Beautiful @ldci. 

[18:22:32](#xEivGyvegnDO32mXXg3LVAMyhKGlLGEfFiPsh9E0Csk) <ldci (François Jouen)>:
One of the best OS around the history of computers :)

[18:35:11](#XCkA50mjtOe93vm1bxOjxMtZqWXgm4pRPlo0eJmljb4) <GalenIvanov (Galen Ivanov)>:
Looks great, @ldci !

[18:44:40](#FYHMSeywSeVxj0xAjn2K4uHk62qn-zwY6CC4zatWB6g) <ldci (François Jouen)>:
I had the chance to work for a group that sold NeXT stations. The OS is the ancestor of MacOS. In 1993 it was fabulous, and I think DocKimbel or Gregg remember it. 

[18:57:20](#Xg_MqPmZlYv5NJCdR4p7sbT0hqtjFxznw-t5MQiGl6E) <greggirwin (Gregg Irwin)>:
It's the ancestor of OSX, not MacOS, isn't it? It's Unix based and used Display Postscript, which made for amazing possibilities, way back then. Beautiful machines, but ahead of their time. Jobs didn't always make the best business decisions for marketability. :^)

[18:57:56](#PyNlLThcSasg2jK2307FXDvKn_FvFnIjlmcaTPXasZ0) <greggirwin (Gregg Irwin)>:
The UI design was truly a work of art.

## 16-Nov-2022

[4:28:16](#o-MsyEBxO2QVx295KpqrUYuuN-6cqnwtfY-0YAUaGBg) <ldci (François Jouen)>:
This ancestor is still used today even with Red: 
NSRect!: aka struct! [
		x [float32!]
		y [float32!]
		w [float32!]
		h [float32!]
]
NS means NextStep

## 25-Nov-2022

[11:43:21](#OVvzopWkojMUbz67gZEe5bkW5sEcxO8qx4jXLS2tN0E) <henrikmk (Henrik Mikael Kristensen)>:
The NextStep file system was not a work of art. I remember it being trashed shortly after installation, when I was trying to use it in emulation. Never got very far. But the rest of the OS is super interesting and fun to use.

[17:07:28](#26bC1IAuH6v-JpFMZMDlQ6ypD7vegro2-HD0h9BXySM) <greggirwin (Gregg Irwin)>:
A number of old Unix systems wer fragile in the face of crashes and such.

## 12-Feb-2023

[5:48:38](#uObB_iqsEf2fcDtoDDYYOCSXP9YAc2vZNatJu1WiIYI) <ProDimSum (ProDimSum)>:
is there a way to produce object file like c without target 

[6:32:33](#m86Nqi2Kdw0KMqWhzOrF2dGk8G2M5az9PPgCT4cd9Y4) <greggirwin (Gregg Irwin)>:
Not at this time.

[8:11:49](#6gLTdjIrmAId3i727XV93qrLg5huMvCGHJvGTl19ivw) <ProDimSum (ProDimSum)>:
thanks @greggirwin 

[8:20:41](#UToHRjt3J_Rli9m-TsR1kXrduQHA7kX1e38loPrv4kY) <ProDimSum (ProDimSum)>:
@greggirwin is there any plan to support it? Few more question can you provide link to red/system where is compiler and linker ? In this link doc https://static.red-lang.org/red-system-specs.html it mentioned "Red/System is a dialect (DSL) of the Red programming language" does it mean red/system, compiler, linker are written in red?

[9:01:06](#0-vY6cE1WtSOboSPDaOOe11wlUskzd2QesBd3KlsObs) <rebolek (Boleslav Březovský)>:
compiler is written in Rebol2

[9:21:34](#csxU1IqJSWqcncIlr3cluWLiHL-kPxGIvVotMP4sQe4) <ProDimSum (ProDimSum)>:
https://github.com/red/red/blob/master/system/compiler.r this one right? @rebolek 

[9:24:32](#4mXfOwERq9aM--9lY3J7XdQmODBAPyUtDhalskIOn5w) <ProDimSum (ProDimSum)>:
what emitter.r do?

[10:11:25](#_z3qJMxanHTYkVUYgX7TugTTDH2rWBPwW05-gkSjAfg) <rebolek (Boleslav Březovský)>:
@ProDimSum yes, there, but it's not only `compiler.r` file, `emitter.r` is also part of compiler. This is the main file that does compilation https://github.com/red/red/blob/master/red.r

[10:13:24](#SVpfIeHwU2dVs7ptUVdPhlQeQfq1oyBfWE_fU6NNZI8) <ProDimSum (ProDimSum)>:
job of emitter.r? @rebolek 

[10:13:41](#KPoIknaWjBbX0YVGVdAFJ5Z1kJ6mSDtwlymxVSHT8Fg) <rebolek (Boleslav Březovský)>:
it emits machine code

[10:17:06](#Lx8xfMI2gguypIEFjwegs9nytaIPbiopRzEWx1EQM3Q) <ProDimSum (ProDimSum)>:
whatever I am reading on internet (object code=machine code) if emitter does produce machine code = object code that means r/s can do produce o file somehow right @rebolek 

[10:32:08](#I9dH0ye2d-7yY_4ZOpFvaMNre8WaMMaCvTUWdFyc5Eo) <ProDimSum (ProDimSum)>:
or we need i386-X86 code generator

[10:51:13](#pD7Am3krE8KCDTOtNV9sDSmCRmdldlJ7aUaqNouXuiE) <ProDimSum (ProDimSum)>:
https://www.youtube.com/watch?v=fMeTqPyrNF4 do we have ffi for red?

[10:52:13](#87w_TDo3rFGcV0P8IL_AH6dhrKV5AsT7xuOwYo5LzQ0) <ProDimSum (ProDimSum)>:
FFI (Foreign Function Interface) 

[11:55:58](#NLPWkJgv9Yk9B89S61IWLp-C52TGNkbToZZWyhqQsv4) <hiiamboris>:
https://static.red-lang.org/red-system-specs.html#section-15

[15:23:40](#LUUyM-MHnJmkXYhjL08Px2A6xAN2Wjk_-OCNoxw82rA) <luce80>:
That is shared library loading for R/S. I wish there will be FFI for Red in the near future.

[16:05:27](#R8EOBB-tcRTk_vUiXd_KurYHwi7fB9K7FyTMhSJC4xY) <hiiamboris>:
what do you call FFI? luce80 (luce80)

[16:06:24](#9Cmy4mas6allHULBF3oNK2ebWwpnjiOL9AfEbssMtfc) <hiiamboris>:
* what do you call FFI? @luce80

## 13-Feb-2023

[5:49:39](#iSA6DEaM2KFRH7wydAxdFEaWKq-Yd7f5uorhg72No0M) <ProDimSum (ProDimSum)>:
https://gist.github.com/ProDimSum/28f5bc0f37fd8c90dd5256a12321f336

[5:49:54](#WfCH-LM0kTh2Dew1EZiTYIUBDNaKArpnt1WZhZP7krs) <ProDimSum (ProDimSum)>:
judge me

[5:51:03](#sMlbTx7Nkmget261JGX8NV0ZrJHA8HTLdhgU4fsE_fU) <ProDimSum (ProDimSum)>:
ways to improve and correct my misunderstanding ?

[5:53:33](#kYiB2adnJfWdSE_EyZg3B9m6Y5qR7okM1Y1IDNTbFtg) <ProDimSum (ProDimSum)>:
  and good evening to everyone

[7:29:07](#GPDcVjFCrZGxVUYbP5blDh9r3zbhXc2sx4i1gpSOVWU) <rebolek (Boleslav Březovský)>:
good morning! 😃 Just one thing, parens do not define a function call. In Red (and R/S), you don't use `f(a,b)` but `f a b`.

[18:53:34](#CA3AGbsOkFoq6Q4GEkknBQd0Q1coJWaUD_qBU4fc8DU) <luce80>:
@hiiamboris:tchncs.de I call FFI what you see in the video: a way to open and call library functions at _runtime_ from _Red_ instead of linking at _compile time_ form _R/S_

[18:57:09](#bO7eqTh101V8AWs2G6G9eWMY2mv_3WxHRWGpy9dh1Ug) <rebolek (Boleslav Březovský)>:
luce80 (luce80): I belive there's no doubt about it, that's the definition.

[19:09:05](#tLDTOSavC_T8FFUVeBpkiVS7-n3ElV47bEa_Om135-c) <hiiamboris (NOT THIS ONE)>:
I see

[19:09:56](#bMxYd2JMEg8utq7M7_9nIWJQLKQK762CnervDwbbX9s) <hiiamboris (NOT THIS ONE)>:
well it's easy to add, hard to make datatypes mapping

[19:28:12](#f4_TadqW3RKlFeo_AlUcQyBliA7F61CY7g0h5Oc0FC0) <luce80>:
If it is easy please make a PR; even a simple implementation with only a few datatypes is better then nothing.

[19:40:58](#tFQGcNciAFeZmS-1rKrQidaO2Kj19dl__avcDI94rq4) <hiiamboris (NOT THIS ONE)>:
I don't see the point. If you're interesting, you can start [here](https://learn.microsoft.com/en-us/windows/win32/api/libloaderapi/nf-libloaderapi-loadlibraryexw) and [here](https://learn.microsoft.com/en-us/windows/win32/api/libloaderapi/nf-libloaderapi-getprocaddress)

[19:48:31](#4SeRacLd72LDwkMsLUbunRQEFpc3qR0r7jlxZ_h11d4) <luce80>:
The point is that it is not easy for me 😉 .

[20:10:02](#mtX2s2928MW5_9ePYAQ6aVfoYoNUjtogbj1kAy9Tn-0) <hiiamboris (NOT THIS ONE)>:
(:

[20:10:15](#bIJWntmveRAZV1V18JyA4vc8ZTR-ikBl4qoJVDxuWpg) <hiiamboris (NOT THIS ONE)>:
why do you want it then?

## 14-Feb-2023

[5:42:12](#NaPJFQbbxClU42E0aVhHPkZ6he6n9NFPTitZyOlF2uQ) <ProDimSum (ProDimSum)>:
okay rebolek (Boleslav Březovský) grouping expressions or defining arrays parens can be used right?

[9:28:11](#TMAO9ssu_wd5dm4gZKoMdLVZEpkF-_O_5TfyWoEpj8s) <ProDimSum (ProDimSum)>:
https://gist.github.com/ProDimSum/f8cd0e84a63e336a3164cf52a7fefe53

[9:28:35](#PWkp_FQAjXSKCxKwq0caFGFdR3oxdGrtL3q3LFfCP2A) <ProDimSum (ProDimSum)>:
same judge me

[10:02:26](#-m0tkxHRBkBapiDzyL0v6jvIeldNPftKTXmVadoXS6k) <ProDimSum (ProDimSum)>:
https://gist.github.com/ProDimSum/1b2f56884ae47ed00ef71e96d27f1624

[10:17:17](#yD37Sx6_YrZLiPrMav1hJdDxXVNDHUShhl8cLaKL0iQ) <hiiamboris (NOT THIS ONE)>:
ProDimSum (ProDimSum) https://github.com/red/docs/blob/master/en/datatypes/paren.adoc

[11:24:24](#aGvE8G64ZqxaV6GzZ9EI0GlKlX6sLsq1ovLdOAgLQD0) <ProDimSum (ProDimSum)>:
hiiamboris (hiiamboris): thanks now I got it thanks but I will update delimiters.reds tomorrow need to catch some sleep.

[11:36:00](#b9yY6moSh4WWwJjjqmvwdZS_w9PSg2CvxUzjnkIRexo) <hiiamboris (NOT THIS ONE)>:
good night ProDimSum (ProDimSum)

## 15-Feb-2023

[9:31:05](#_iTet5ZFraPWAERkZfvblRpmKrjpQrom1hloAza5KrI) <ProDimSum (ProDimSum)>:
https://gist.github.com/ProDimSum/b0d0f4c878f95325c6b017d96faf4b7e

[9:31:21](#2XKpdzGuEbOIw5zhg9n91OJLCq6zTUcpJykvsRVcf-4) <ProDimSum (ProDimSum)>:
again judge me 

[10:21:45](#20_jfH7EL5xojd2P2eBE7vEuU3PxBfN0NrBgiYvcKws) <hiiamboris>:
see https://github.com/red/docs/blob/master/en/datatypes/word.adoc for word syntax (a lot of Red syntax applies to R/S)

## 16-Feb-2023

[7:38:59](#Gzxg93o7JQv-WWSuj48aw5g0W-JWAjosbnnW6U-EZOo) <ProDimSum (ProDimSum)>:
decimal form          :  1234

decimal negative form : -1234

hexadecimal form      :  04D2h

[7:40:00](#sLS05p4luzK36da7NfjXyU7p8-Gaz8fIvJkwVQQ2UVE) <ProDimSum (ProDimSum)>:
this code needs to be changed in https://static.red-lang.org/red-system-specs.html#section-4.1.1 

[9:06:08](#JyYQXGILEWRwa8VZfHAtXcW6TArwUSGoNLu_XNYpZwU) <hiiamboris>:
Why?

## 17-Feb-2023

[5:42:14](#MDfd5qskFoZ-eAVLoMS3IlJu8tMxkrPWUMseX8f6cl4) <ProDimSum (ProDimSum)>:
decimal_form: 1234

decimal_negative_form: -1234

hexadecimal_form: 04D2h

[5:42:25](#X5IC6yo_Hf_b56BPtEapDmWom0fM4P2OgoDu_StNYaA) <ProDimSum (ProDimSum)>:
this code run without error

[5:42:46](#vNM1zTL8xkbOzrmGdRNpAcrRKOECWh8x4pL5Qnx2_WU) <ProDimSum (ProDimSum)>:
> decimal form          :  1234
> 
> decimal negative form : -1234
> 
> hexadecimal form      :  04D2h

this code produces error

[6:51:35](#B7ZU5rtUDaG28fxyytrfsm3sPBNYd7XOlpg8cg_n2aY) <gurzgri>:
This section isn‘t intended to be a code sample, it is more like a poor man‘s table in a fixed width font. There are more instances of markdown-codeblocks used like this in that document.

## 18-Feb-2023

[6:21:44](#597a-S7zR0UWpI9xqs6yAfLTQjME5I5BqW3ef13qqlc) <ProDimSum (ProDimSum)>:
gurzgri: okay

## 22-Feb-2023

[6:19:26](#_EZdHQI0X0u2z3gpJTL4nTbgQYagxWAUTwZBqE59Hec) <ProDimSum (ProDimSum)>:
https://static.red-lang.org/red-system-specs.html#section-4.3.2 - type casting

[6:20:56](#i6XHb0HqxfhNJA6aDXOVFlcaj5ATgCs8DQdQKr_JrEs) <ProDimSum (ProDimSum)>:
behavior - 3.1415927 shown vs real output 3.141593 looks like rounding number

[6:21:07](#nbdErIsQhkGKkGr65TL3z6SoiVslUATcxZTQ5315G-A) <ProDimSum (ProDimSum)>:
bug may be


[9:23:50](#5WiAnejvTwBiNrHH_jQNcLhALVgcXt9J0p-CFGNyP9U) <ProDimSum (ProDimSum)>:
https://static.red-lang.org/red-system-specs.html#section-4.3.2 - type casting

[9:24:45](#DRx1kYu4kBVrTGmTOXCAId53p62dVeApYbPA3YbNTfY) <ProDimSum (ProDimSum)>:
expected output 3.14159270000000
1518260631 vs real output 3.141592741012573
3

[9:25:07](#U-QEw9wC9KpPxa5YyScBq0rXzwSDG4soNmJIiV0QbdU) <ProDimSum (ProDimSum)>:
am i doing something wrong?

[9:25:28](#Uxoh79Anby6ug2ndisYizrXSt1fx9UbCFiOf_iwmtmo) <ProDimSum (ProDimSum)>:
s: as float32! 3.1415927
print [
   as float! s lf
   as integer! s
]

[9:25:36](#OjsYpwunlHGN1AmGNUzfa_E_ebRPblmyWKNjV-fDHeM) <ProDimSum (ProDimSum)>:
example

[9:44:02](#P7wvtOOqQd7UyVwZ0cM3mF_d42M-1TCfNKNPr3ezXng) <hiiamboris>:
You should go to Wikipedia and study how binary floating point works.

[9:46:57](#4Tf21dHVtZb6K9FgULBcSvWuovSgHWFoLokfq3oYKs4) <hiiamboris>:
Key point is to figure out how binary floating point is different from decimal.

## 4-Mar-2023

[5:43:27](#xOMRB3bucVa4qcXbRicV37Y6IioaQLbnC70G8SDQ2QY) <ProDimSum (ProDimSum)>:
thanks hiiamboris 

## 30-Jul-2023

[9:29:26](#rS7wg-ng3ykGdiU_-GAjUm1nPPQq16BKRP4qHe3yDyI) <Harrd>:
Can one do osdev with Red/System?

[9:41:33](#iWLyJZs32apPRM4T2ipaWan3e1_Ac4B_-VhbhxTbvu4) <hiiamboris>:
greetings Harrd
technically yes, but only emitters for major OSes are currently implemented in the compiler

[10:00:53](#KaM-EbysHLrCDqhdSQUTmDdgWiVrpTCNHfFCstqLuO0) <Harrd>:
Hmm im gonna try

## 20-Aug-2023

[14:56:49](#cn-GxA8LycHBCghjHgV2VHZDhS0RkQFCvl2sFD1osjE) <Harrd>:
Hi, where is the target for windows in Red/System; like the source for it?

[15:21:15](#HIX5PUsD1ZkZrqAmgPYsXfB9b6iVVUPvwxy1FlOnoEQ) <hiiamboris>:
`%system/config.r`

## 23-Aug-2023

[16:02:42](#JNF1L60CLCMk3rThxXlgDQHT8hCtvHsdPd_NJxILdSU) <ALANVF (theangryepicbanana)>:
ok I give up, does anyone know where the source is for the `append` actions for series types?

[16:02:48](#NNy1pCz6l2hKl07uQJojT519hYKDb1e8M7QwISCzQLo) <ALANVF (theangryepicbanana)>:
I can't find it anywhere

[16:04:23](#ZsEeBCMtrSklhDfsCW5uwnZ1lUFbA_zarpE0jxPJPWc) <ALANVF (theangryepicbanana)>:
 * ok I give up, does anyone know where the source is for the `append` action for series types?

[16:17:06](#MJCxVUu94Zwp8iBHJUWMHZ87TSewY_sgL3h0ru3A-88) <dockimbel>:
`append` action relies on `insert` implementation: https://github.com/red/red/blob/master/runtime/actions.reds#L822

[16:23:32](#ua6dwQ6YtDKu3EWmvrPzVIsu96kwkG_QI6SK1G9OcYw) <ALANVF (theangryepicbanana)>:
ahhhh that makes sense, thanks

[16:23:53](#2V4zMY8hrqN4FTBICFCjlQP020do2YbSDmMStO-5OJg) <ALANVF (theangryepicbanana)>:
I completely glanced over the actual action impl there

[16:26:18](#Y3EIx5HHE0nqYKTS53DNgRaG5xkVCZI4b-_V0srqE0U) <dockimbel>:
`%runtime/action.reds` contains all trampoline functions doing the actions dispatching to the right datatype.

[16:26:31](#gSGUhxrWNBcZaFxtUoRezzJsHLKKjcxIwQP7LUd8tqQ) <dockimbel>:
 * `%runtime/action.reds` contains all the trampoline functions doing the actions dispatching to the right datatype.

[16:28:01](#5tUqAOSFK042l0_Y1VUZbWcchMHZ7Z43Xaz-b3dypno) <dockimbel>:
 * `%runtime/action.reds` contains all the trampoline functions doing the actions dispatching to the right datatype. The function names with a `*` suffix are called by compiled code, while the ones without it are called by the interpreter.

[16:29:03](#Cbopj4d7Ga4zCxKFaVoR3jsB6XH34HeQdN1B00KrLok) <dockimbel>:
 * `%runtime/action.reds` contains all the trampoline functions doing the actions dispatching to the right datatype. The function names with a `*` suffix are called by compiled code, while the ones without it are called by the interpreter. That's a convention used in many places the runtime code.

[16:29:12](#cWZuSdp86Pi75XVxtN0dbh_bfV_BkYzUf8fLOYB0zlM) <dockimbel>:
 * `%runtime/action.reds` contains all the trampoline functions doing the actions dispatching to the right datatype. The function names with a `*` suffix are called by compiled code, while the ones without it are called by the interpreter. That's a convention used in many places the runtime library code.

## 24-Aug-2023

[13:42:07](#I5FiQYp-G7Y7DXlXbs517Q0shykTNXIVNbQc9-4KLAw) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@dockimbel-556597ad15522ed4b3e10020:gitter.im> `%runtime/action.reds` contains all the trampoline functions doing the actions dispatching to the right datatype. The function names with a `*` suffix are called by compiled code, while the ones without it are called by the interpreter. That's a convention used in many places the runtime library code.

Now I can understand why without the compiler the workload of the coder would decrease a lot. 

## 30-Sep-2023

[17:09:18](#2-XSzS-Brh6xAlU3UrOr1WW0tkpYfZCs0SLsepwtu3o) <Isoux>:
Warmest thanks for supporting my first venture in R/S! When I tried from this [[typed] function](https://github.com/isoux/Red-assembler/blob/cb6dad760c7db781493aac483161d579c1752925/asm.reds#L24) to call another also [typed] function ( like for example [_mov](https://github.com/isoux/Red-assembler/blob/cb6dad760c7db781493aac483161d579c1752925/instructions/mov.reds#L81) or [_bswap](https://github.com/isoux/Red-assembler/blob/cb6dad760c7db781493aac483161d579c1752925/instructions/bswap.reds#L18) ) I couldn't dereference the arguments correctly, it showed something strange... That's why I gave up on the second-initiating functions of [typed], but to all functions I have to pass a few arguments and some of them need only one. If necessary, I can show it with an example, I just need some time to write. Maybe it's an issue or is it a limit?

[17:14:12](#e-PwinvO2z9MIw_pr7J_UmOu7Mi9zHhehh3rbETjUnI) <Isoux>:
 * Warmest thanks for supporting my first venture in R/S! When I tried from this [\[typed\] function](https://github.com/isoux/Red-assembler/blob/cb6dad760c7db781493aac483161d579c1752925/asm.reds#L24) to call another also \[typed\] function ( like for example [\_mov](https://github.com/isoux/Red-assembler/blob/cb6dad760c7db781493aac483161d579c1752925/instructions/mov.reds#L81) or [\_bswap](https://github.com/isoux/Red-assembler/blob/cb6dad760c7db781493aac483161d579c1752925/instructions/bswap.reds#L18) ) I couldn't dereference the input arguments correctly, it showed something strange... That's why I gave up on the second-initiating functions of \[typed\], but to all functions I have to pass a few arguments and some of them need only one. If necessary, I can show it with an example, I just need some time to write. Maybe it's an issue or is it a limit?

[17:27:27](#qXMNG9-IinhxTCq7AyJaeN1WopIibGtNEn1KBTFyx4k) <Isoux>:
It seems to me that when a typed function is called from an existing typed function, something strange happens on the stack ... Even the number of input arguments detected by the called function is wrong.

[17:48:43](#6Kp6WFaszhgdjYSIcVOXGMS5RkkdIOgnfMcxTSaPG8w) <hiiamboris>:
semantics of such call seems undocumented...

[17:52:49](#s2KZsHmgJGoZZmp41VsA76GAHyUuCeRWIREIWStCzPs) <Isoux>:
> <@hiiamboris:tchncs.de> semantics of such call seems undocumented...

Ok, asap I'll try to show in an example ...

[17:54:48](#jceDrT2kEOnzGOZzD4Q72yfT2BOVCtX2NF9mR3qKwO0) <hiiamboris>:
I understand what you mean, but only dockimbel can tell if it's supported

## 2-Oct-2023

[17:57:59](#c1acLdsq0Hr28cEfd6aC4KwnFTHO7LiNHrqlQDpg-ds) <Isoux>:
During work, due to an inadvertent error, I noticed that the called function doesn't need to receive all the arguments sent to it by the calling function, and that is a great relief. So I solved the above problem for now.

## 3-Oct-2023

[11:59:35](#NoTUeYxA-5UV72K5wz-enSVpm6XJtUIuDd0IQFEkZ8E) <dockimbel>:
Isoux: Sorry, I didn't find time yet to dive into what you are doing. Just some quick comments:

* The current toolchain written in Rebol is going to be dropped when we get the new one written in Red.
* The toolchain code is highly monolithic, experimental, hackish and in some parts quite ugly. So, dragons everywhere. ;-)
* Why make an assembler in R/S while it is so much more easier and quicker to write it in Red (or rather Rebol in this context)?

[12:09:56](#KwynsRxyF1svXx3HFqv0mGjysAcfe0Lsy1aLmmccGOo) <dockimbel>:
 * Isoux: Sorry, I didn't find time yet to dive into what you are doing. Just some quick comments:

- The current toolchain written in Rebol is going to be dropped when we get the new one written in Red.
- The toolchain code is highly monolithic, experimental, hackish and in some parts quite ugly. So, dragons everywhere. ;-)
- Why make an assembler in R/S when it is so much more easier and quicker to write it in Red (or rather Rebol in this context)?

[12:10:33](#9rv4wbMGucXDVpCOAEf9QQd9-vI_RvOTkhok3UhcZWs) <dockimbel>:
 * Isoux: Sorry, I didn't find time yet to dive into what you are doing. Just some quick comments:

- The current toolchain written in Rebol is going to be dropped when we get the new one written in Red.
- The toolchain code is highly monolithic, experimental, hackish and in some parts quite ugly. So, dragons everywhere. ;-)
- Why make an assembler in R/S when it is so much more easier and quicker to write it in Red (or rather Rebol in this context)? Also, how is an assembler in R/S supposed to interface with the compiler in Rebol?

[14:29:30](#G-2bxEHD7DR2HZCWTSGVBFsg-G55Zl5zAfVDZKUrvZs) <Isoux>:
dockimbel: Very valuable notices, guidelines, tips and questions. I've been waiting for this since the moment I posted the first message. Thank you for your valuable time.

[14:46:39](#HrO9WTK2_d329OhbLKNrWFaC0JLx8VzSpDCReNnH01E) <Isoux>:
> - Why make an assembler in R/S when it is so much more easier and quicker to write it in Red (or rather Rebol in this context)? Also, how is an assembler in R/S supposed to interface with the compiler in Rebol?

First of all, I am at the very beginning of learning R & R/S. It's easier for me to find my way in programming at a low level, so I wanted to show the idea practically and tangibly, which was the fastest way for me. Also very fast compilation and small out binary in R/S because I often have to test the code to get the desired output ... I tried first in Red, but I didn't manage, but I would definitely prefer to write in Red.

[14:52:58](#3I8Pc6wDZw2jrL6Pfh-T9wIstafiT9fx8Y0_UOWtNDM) <Isoux>:
> -  Also, how is an assembler in R/S supposed to interface with the compiler in Rebol?

Of course it can't be! But it took me a while to figure it out because I was confused but hiiamboris rescued me from my delusion and lack of knowledge. 

[15:16:33](#eTSeZedYmqQ6QP_4FAdZFwy0rxol98eDctBS1OZeNqk) <Isoux>:
> - Why make an assembler in R/S ...

I forgot to mention the main inspiration from which it all started: I wanted to rely entirely on R/S when I writing the hobby OS so it was logical for me to have assembler as part of R/S and written in R/S ...?

## 4-Oct-2023

[16:51:48](#4A6tykWR6L0yNcYhnDPERU7mDe5zd4Rpl2dmV687pc8) <dockimbel>:
I'm not sure to follow you. Assembling is part of the compilation process, so it belongs to the toolchain code. How do picture an assembler working at run-time in R/S programs (or even for writting an OS)? Or are you writing a new compiler for R/S in R/S?

Your assembly code needs to be converted to binary opcodes during compilation time, then linked to produce an executable (or an OS image).

[17:02:47](#-1DF7vN5j7bbMcDxreFnbA9ZOlHJgDJxjCbXVGAW54A) <dockimbel>:
 * I'm not sure to follow you. Assembling is part of the compilation process, so it belongs to the toolchain code. How do you picture an assembler working at run-time in R/S programs (or even for writting an OS)? Or are you writing a new compiler for R/S in R/S?

Your assembly code needs to be converted to binary opcodes during compilation time, then linked to produce an executable (or an OS image).

[17:03:12](#-xoJdZmbRhLEM8rMX7iFIpYbZHXkmT4qKOS8WNC-MK4) <dockimbel>:
 * I'm not sure to follow you. Assembling is part of the compilation process, so it belongs to the toolchain code. How do you picture an assembler working at run-time in R/S programs (or in an OS)? Or are you writing a new compiler for R/S in R/S?

Your assembly code needs to be converted to binary opcodes during compilation time, then linked to produce an executable (or an OS image).

[17:15:47](#QK-L7l1j_3r75ewBQl557NdlXVbuvXYdzRXj0WoGGAU) <Isoux>:
It's hard for me to express myself precisely because of the language barrier, but your question clarified my position so that I seem to be the closest to the idea: 
> Or are you writing a new compiler for R/S in R/S?



[17:18:53](#4dGjwZOzIYJhrJA8gkTpE6NW0fnUqJzABPoV9Z2M8ss) <Isoux>:
But to make a long story short. Is this idea attractive to you in general, and in what way would you support its implementation and integration within the Red?

[17:25:51](#fy37nzvsAhftAQvr6mfPz5YIKnEKvFzxYqurDXDYopU) <Isoux>:
 * But to make a long story short. Is this idea attractive to you in general, and in what way would you support its implementation and integration within the Red?  For now I'm just converting the asm expressions to binary opcodes in the form of #inline #{...} so I can use them in R/S code as I've shown in the git repository.

[17:30:45](#BndEhi4Q5PZyTQ_Kw63VoZyMGghaGZFxlR9u_j9nyQk) <Isoux>:
Is it even fair to ask you for some of your precious time for a short conversation on this subject?

[17:35:48](#GF5-VEXKmeMZEzQgLWAAP0FFNR0ViqK20iZs2VEZFZQ) <Isoux>:
 * It's hard for me to express myself precisely because of the language barrier, but your question clarified my position so that I seem to be the closest to the idea:
_writing a new compiler for R/S in R/S._

[17:45:32](#VdADUuH1EWq35exAXSzcoZimGIJERqhyFQYhsIZfMR8) <Isoux>:
 * But to make a long story short. Is this idea attractive to you in general, and in what way would you support its implementation and integration within the Red?  For now I'm just converting the asm expressions to binary opcodes in the form of #inline #{...} so I can use them in R/S code as I've shown in the git repository. 
> Assembling is part of the compilation process, so it belongs to the toolchain code.


[17:48:58](#I1rZ8mHCKhGhbVLvXj8vTE8lE_fY5VaPm3euHME2akg) <Isoux>:
 * But to make a long story short. Is this idea attractive to you in general, and in what way would you support its implementation and integration within the Red?  For now I'm just converting the asm expressions to binary opcodes in the form of #inline #{...} so I can use them in R/S code as I've shown in the git repository.
> Assembling is part of the compilation process, so it belongs to the toolchain code. I would not venture into the toоlchain code for now, at least until it is all written in Red.

[17:49:45](#JLoprtndEZA7N4cR3SbVXwzl8cts8QRG7hhmXEbhaJ4) <Isoux>:
 * But to make a long story short. Is this idea attractive to you in general, and in what way would you support its implementation and integration within the Red?  For now I'm just converting the asm expressions to binary opcodes in the form of #inline #{...} so I can use them in R/S code as I've shown in the git repository.
> Assembling is part of the compilation process, so it belongs to the toolchain code. 
I would not venture into the toоlchain code for now, at least until it is all written in Red.

.

[17:49:57](#BEjkd_6VYmeUqsCEyBJcBkG_ODrSpeWTMmylMwD7n24) <Isoux>:
 * But to make a long story short. Is this idea attractive to you in general, and in what way would you support its implementation and integration within the Red?  For now I'm just converting the asm expressions to binary opcodes in the form of #inline #{...} so I can use them in R/S code as I've shown in the git repository.

> Assembling is part of the compilation process, so it belongs to the toolchain code.
I would not venture into the toоlchain code for now, at least until it is all written in Red.

[17:50:16](#bciNCAmr4dPzMAJ7Hs42TGys1rZhPhvER8VyLTXAaBo) <Isoux>:
 * But to make a long story short. Is this idea attractive to you in general, and in what way would you support its implementation and integration within the Red?  For now I'm just converting the asm expressions to binary opcodes in the form of #inline #{...} so I can use them in R/S code as I've shown in the git repository.
> Assembling is part of the compilation process, so it belongs to the toolchain code.
I would not venture into the toоlchain code for now, at least until it is all written in Red.

[17:50:50](#TAvwHcTj40qylbFk0wr7mMUHujsFeq47mC1qMjDOtnI) <Isoux>:
 * But to make a long story short. Is this idea attractive to you in general, and in what way would you support its implementation and integration within the Red?  For now I'm just converting the asm expressions to binary opcodes in the form of #inline #{...} so I can use them in R/S code as I've shown in the git repository.

_Assembling is part of the compilation process, so it belongs to the toolchain code._
I would not venture into the toоlchain code for now, at least until it is all written in Red.

## 5-Oct-2023

[9:45:46](#aH8AgDlJ3A2eiuIFFZEMA0CLcHhO2M-SvpcoQtzg24w) <dockimbel>:
> <@isoux:gitter.im> Is it even fair to ask you for some of your precious time for a short conversation on this subject?

Well, of course, exchanging and discussing ideas is part of an open source project.

[9:51:16](#8JzhGfBAwN7i5QV7c1aUwYlXywy1LBDBbl_uJ3nD3eE) <dockimbel>:
> writing a new compiler for R/S in R/S.
> But to make a long story short. Is this idea attractive to you in general, and in what way would you support its implementation and integration within the Red? 

Our plan is to rewrite the whole toolchain in Red code (and drop the Rebol dependency entirely). We want the new compiler to be much faster than the current one. Just using faster algorithm will not be enough, so we considered writing some portions using R/S. Though, that's not great for speed of development, nor robustness, nor maintainability. Fortunately, I think I have figured out an alternative way to solve that and developing it on a private branch for now until alpha level is reached.


[9:54:05](#Z8FmzGCl428erCFhTBDI8u4pQeGkbXod89onaWuh_N4) <dockimbel>:
 * > writing a new compiler for R/S in R/S.
> But to make a long story short. Is this idea attractive to you in general, and in what way would you support its implementation and integration within the Red?

Our plan is to rewrite the whole toolchain in Red code (and drop the Rebol dependency entirely). We want the new compiler to be much faster than the current one. Just using faster algorithm will not be enough, so we considered writing some portions using R/S. Though, that's not great for speed of development, nor robustness, nor maintainability. Fortunately, I think I have figured out an alternative way to solve that and developing it on a private branch for now until alpha level is reached.

For now, I don't plan to use an assembler in the new toolchain, as generating asm as output of the compiler, then assembling it is quite an overhead, especially in the JIT compilation use-cases.

[9:54:40](#C-rRIyTFZtjJqcRqSvIv56oOBkUcZUtzsbB5WE-nd9M) <dockimbel>:
 * > writing a new compiler for R/S in R/S.
> But to make a long story short. Is this idea attractive to you in general, and in what way would you support its implementation and integration within the Red?

Our plan is to rewrite the whole toolchain in Red code (and drop the Rebol dependency entirely). We want the new compiler to be much faster than the current one. Just using faster algorithm will not be enough, so we considered writing some portions in R/S. Though, that's not great for speed of development, nor robustness, nor maintainability. Fortunately, I think I have figured out an alternative way to solve that and developing it on a private branch for now until alpha level is reached.

For now, I don't plan to use an assembler in the new toolchain, as generating asm as output of the compiler, then assembling it is quite an overhead, especially in the JIT compilation use-cases.

[9:57:36](#L1WGlEJhagDB6xxVcszBJsxPuLVORhxgVuh2RFmFUok) <dockimbel>:
 * > writing a new compiler for R/S in R/S.
> But to make a long story short. Is this idea attractive to you in general, and in what way would you support its implementation and integration within the Red?

Our plan is to rewrite the whole toolchain in Red code (and drop the Rebol dependency entirely). We want the new compiler to be much faster than the current one. Just using faster algorithm will not be enough, so we considered writing some portions in R/S. Though, that's not great for speed of development, nor robustness, nor maintainability. Fortunately, I think I have figured out an alternative way to solve that and developing it on a private branch for now until alpha level is reached.

For now, I don't plan to use an assembler in the new toolchain, as generating asm as output of the compiler, then assembling it is quite an overhead, especially in the JIT compilation use-cases. Supporting asm in R/S (through `#inline` or another method) is not a priority for me, as most special CPU features that are needed are supported through intrinsic functions (`system/*/...`).

[10:17:45](#Svwa_LRhYHeo5tkG8UgZPRUZeTKWJp7oXFnXk5lr9nQ) <pekr (Petr Krenzelok) (@pekr:matrix.org)>:
dockimbel: just theoretically, would it be possible to generate e.g. C code, or an Webassembly? As for embedded, is that only about new target, or much more work, as some plaforms do provide special cpu instruction sets, limited memory, etc? Could that even be properly abstracted, or would it mostly mean a whole separate fork?

[10:25:35](#JyHMcpDSiL2cyoBTBvs3K0MdWbuKQfcogyY6c5WMvgk) <dockimbel>:
> just theoretically, would it be possible to generate e.g. C code, or an Webassembly?

We already planned for wasm support. For outputting C, we could but we would loose the "human-friendly" approach of our toolchain then.

[10:26:50](#arrcUUNeS8PbWhE7by7VE96PN-GnflD2LBYCdS6nPkU) <dockimbel>:
 * > just theoretically, would it be possible to generate e.g. C code, or an Webassembly?

We already planned for wasm support. For outputting C, we could but we would loose the "human-friendly" approach of our toolchain then. Moreover, R/S has some specific features not supported by C, nor C compilers. Even if we would use LLVM, we would have to modify it to support 100% of R/S features.

[10:27:40](#VU-YbdLbgRAMYXwnXrfftoAjbq3KyK_KLsqUDHweiow) <dockimbel>:
 * > just theoretically, would it be possible to generate e.g. C code, or an Webassembly?

We already planned for wasm support. For outputting C, we could but we would loose the "human-friendly" approach of our toolchain then. Moreover, R/S has some specific features not supported by C, nor C compilers. Even if we would use LLVM, we might have to modify it to support 100% of R/S features.

[10:34:47](#zaW6mi2Q6vS-Jr79hqERFMeBCYK58wP8eyoQ7mFZeAY) <dockimbel>:
 * > just theoretically, would it be possible to generate e.g. C code, or an Webassembly?

We already planned for wasm support. For outputting C, we could but we would loose the "human-friendly" approach of our toolchain then. Moreover, R/S has some specific features not supported by C, nor C compilers. Even if we would use LLVM, we might have to modify it to support 100% of R/S features. The main point of not using LLVM from the beginning was to have the freedom to design features beyond what C toolchains support.

[10:57:28](#lhOsMtLgK4jgwYgSsfGh5fMz9frSdt33m3dBUcEu_6w) <pekr (Petr Krenzelok) (@pekr:matrix.org)>:
Thanks!

[12:16:05](#Cb1GcptlZeM7Sv84fJ9HBh_DcA-qLe38e-v5_NlOHEs) <rebolek (Boleslav Březovský)>:
R/S->C compatibility layer *would* be possible to write.

[13:40:45](#JQ45VP6JtwSWPHjI5HC0cKzw99xdqHbT9mi3KLrIwCQ) <dockimbel>:
There's at least one feature that can't be supported in C, or emulated, it's the way I plan to support thread-safety, as it relies on specific registers usage.

[13:41:04](#DdLXwjmpyQ0YYRtpzlLbvT838uA30-ei3RZHD4RbGzQ) <dockimbel>:
 * There's at least one feature that can't be supported in C, nor emulated, it's the way I plan to support thread-safety, as it relies on specific registers usage.

[15:33:20](#jVHTew7k4zqpNnykOZcQqvQmsPiHEi_wZ1lMM_ghY-M) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@dockimbel-556597ad15522ed4b3e10020:gitter.im> There's at least one feature that can't be supported in C, nor emulated, it's the way I plan to support thread-safety, as it relies on specific registers usage.

I have talked with a Linux network Kernel developer. He has explained It Is really important to be able to allocate registrers on different core/threads because 10+ gigabit networking give you very little time frame to forward packets and also It should be done manually. Will you support manual allocation of registrers and of memory? 

## 6-Oct-2023

[9:37:30](#2oKSOvNf_IfvSPKOmYYfjGr-6_5WhJNhZyd429Y4YcA) <dockimbel>:
Can you explain the relation between register allocation and network packet forwarding? Then explain why should registers by allocated "manually"? Then explain the relation between network packet forwarding and transpiling R/S to C.

[9:37:43](#u9Ez8-gb9SDs2hdCFH9D8igYWvbOKebOmf7X7VA6Qe8) <dockimbel>:
 * Can you explain the relation between register allocation and network packet forwarding? Then explain why should registers be allocated "manually"? Then explain the relation between network packet forwarding and transpiling R/S to C.

[12:29:27](#Yx5jDpeZ8taUE1JuHiS7bruyFGFtzkF-2jjcKGsoveE) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@dockimbel-556597ad15522ed4b3e10020:gitter.im> Can you explain the relation between register allocation and network packet forwarding? Then explain why should registers be allocated "manually"? Then explain the relation between network packet forwarding and transpiling R/S to C.

There are many problems when you want to reach hi speed networking. One of this is memory allocation and registers usage, explecially when multiple operations are in place. Leaving all the work to the memory allocator of the language and to the garbage collector, you could end up having your data on multiple core's registers, cache, memory.  This could potentially generate cache flushing, access on the main mamory or to the registers of the other cores, which all have an high cost in terms of CPU cycles a 100/200Gb driver can't affort. So you language must either be aware of such problems or let you choose where and how allocate things. Another problem is interlock blocking when the current core must wait for operation on other core to access data when the recycler triggers.  You language should have such optimization strategies when allocating resources, it must let you choose manually where and what allocate. Such mechanism should be taken into account when builing a transpiler, so the target language should replicate the same optimization behaviour you have in the source one (if you have it...)

[12:29:58](#oTZd4tPfHuBMvG8Mmc3_TJlZOKB_ZiVZx0XVjrd8AfA) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@dockimbel-556597ad15522ed4b3e10020:gitter.im> Can you explain the relation between register allocation and network packet forwarding? Then explain why should registers be allocated "manually"? Then explain the relation between network packet forwarding and transpiling R/S to C.

 * There are many problems when you want to reach hi speed networking. One of this is memory allocation and registers usage, explecially when multiple operations are in place. Leaving all the work to the memory allocator of the language and to the garbage collector, you could end up having your data on multiple core's registers, cache, memory.  This could potentially generate cache flushing, access on the main mamory or to the registers of the other cores, which all have an high cost in terms of CPU cycles a 100/200Gb driver can't afford. So you language must either be aware of such problems or let you choose where and how allocate things. Another problem is interlock blocking when the current core must wait for operation on other core to access data when the recycler triggers.  You language should have such optimization strategies when allocating resources, it must let you choose manually where and what allocate. Such mechanism should be taken into account when builing a transpiler, so the target language should replicate the same optimization behaviour you have in the source one (if you have it...)

[12:30:23](#OA6UlL-xCpe9xIHUEFschUYuGsStUeiRq0nAi41ioPI) <GiuseppeChillemi (GiuseppeChillemi)>:
 * There are many problems when you want to reach hi speed networking. One of this is memory allocation and registers usage, explecially when multiple operations are in place. Leaving all the work to the memory allocator of the language and to the garbage collector, you could end up having your data on multiple core's registers, cache, memory.  This could potentially generate cache flushing, access on the main mamory or to the registers of the other cores, which all have an high cost in terms of CPU cycles a 100/200Gb driver can't afford. So you language must either be aware of such problems or let you choose where and how allocate things. Another problem is interlock blocking when the current core must wait for operation on other core to access data as when the recycler triggers.  You language should have such optimization strategies when allocating resources, it must let you choose manually where and what allocate. Such mechanism should be taken into account when builing a transpiler, so the target language should replicate the same optimization behaviour you have in the source one (if you have it...)

[12:31:01](#d9j_mRZIe8hT_6sBmdsg3D_OHOcsiCbmNsrp4LPRsg0) <GiuseppeChillemi (GiuseppeChillemi)>:
 * There are many problems when you want to reach hi speed networking. One of this is memory allocation and registers usage, explecially when multiple operations are in place. Leaving all the work to the memory allocator of the language and to the garbage collector, you could end up having your data on multiple core's registers, cache, memory.  This could potentially generate cache flushing, access on the main mamory or to the registers of the other cores, which all have an high cost in terms of CPU cycles a 100/200Gb driver can't afford. So you language must either be aware of such problems or let you choose where and how allocate things. Another problem is interlock blocking when the current core must wait for operation on other core to access data as when the recycler triggers.  
To avoid this, you language should have such optimization strategies when allocating resources, it must let you choose manually where and what allocate. Such mechanism should be taken into account when builing a transpiler, so the target language should replicate the same optimization behaviour you have in the source one (if you have it...)

[12:35:31](#TUZ0PV1ZbzVXKGfJpGfqiw9xevJFY4dz2bqwD3tZ16k) <GiuseppeChillemi (GiuseppeChillemi)>:
Problems and tecniques to face when building high speed drivers are [here](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC10280580/) and [here](https://www.linkedin.com/pulse/modern-high-speed-networking-techniques-hardware-john-velegrakis/?utm_source=share&utm_medium=member_android&utm_campaign=share_via)

[12:39:33](#chkez6C0YbDo1HujBzufOlD-489J2_xG4kKP2ykm1sw) <GiuseppeChillemi (GiuseppeChillemi)>:
 * Other problems you can face when building high speed drivers and their solutions are [here](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC10280580/) and [here](https://www.linkedin.com/pulse/modern-high-speed-networking-techniques-hardware-john-velegrakis/?utm_source=share&utm_medium=member_android&utm_campaign=share_via)

[13:15:20](#WW3gSRJ5tX1_fXKTnca-1Q48EeWOeRwwN40bA_mTWfE) <dockimbel>:
GiuseppeChillemi (GiuseppeChillemi) When you quote someone's sentences, you should mark them as citation and mention the author/source. 

> There are many problems when you want to reach hi speed networking.
> Other problems you can face when building high speed drivers [...]

How has that anything to do with our discussion here, or Red in general?

[13:16:47](#i1cU1IzEYHGscqql-hzV242p74jbdM_uX46JlAV9Mdw) <dockimbel>:
 * GiuseppeChillemi (GiuseppeChillemi) That whole post is not your words, because it goes well beyond your current knowledge and understanding. When you quote someone's sentences, you should mark them as citation and mention the author/source. 

> There are many problems when you want to reach hi speed networking.
> Other problems you can face when building high speed drivers \[...\]

How has that anything to do with our discussion here, or Red in general?

[13:26:42](#kJE5MAKYm6iWF7d1UvltLYOCedhBpktUg8akMiJKYSM) <dockimbel>:
 * GiuseppeChillemi (GiuseppeChillemi) That whole post is not your words, because it goes well beyond your current knowledge and understanding. When you quote someone's sentences, you should mark them as citation and mention the author/source instead of making look like your owns.

> There are many problems when you want to reach hi speed networking.
> Other problems you can face when building high speed drivers \[...\]

How has that anything to do with our discussion here, or Red in general?

[14:13:32](#WsVo0JHsZBLRF9l5NP7gGQeDkAjpvmH8lTa-WxDXJsc) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@dockimbel-556597ad15522ed4b3e10020:gitter.im> GiuseppeChillemi (GiuseppeChillemi) That whole post is not your words, because it goes well beyond your current knowledge and understanding. When you quote someone's sentences, you should mark them as citation and mention the author/source instead of making look like your owns.
> 
> > There are many problems when you want to reach hi speed networking.
> > Other problems you can face when building high speed drivers \[...\]
> 
> How has that anything to do with our discussion here, or Red in general?

My life has started with RKM (Rom Kernel Manual) on the Amiga and 680xx processor, our team has developed some products for CDTV where CPU register access and DMA problems were on daily base. One of our team has also discovered a data invalidation problem you have on 680x0 CPU and AmigaOS where DMA write on a memory area would not corresponds of a CPU cache flush, so triggering an OS FIX on the from the Commodore Development Team.
And yes, it is my own knowledge. I have stopped my life for personal problems but I was there!
Our product: http://www.digitanto.it/mc-online/PDF/Articoli/130_326_329_0.pdf

[14:16:16](#zRygpWbuKv8KsnjOPJO_D70UZpgTWI02ifsEx_vbuBw) <GiuseppeChillemi (GiuseppeChillemi)>:
 * My life has started with RKM (Rom Kernel Manual) on the Amiga and 680xx processor, our team has developed some products for CDTV where CPU register access and DMA problems were on daily base. One of our team has also discovered a data invalidation problem you have on 680x0 CPU and AmigaOS where DMA write on a memory area would not corresponds of a CPU cache flush, so triggering an OS FIX from the Commodore Development Team.
And yes, it is my own knowledge. I have stopped my life for personal problems but I was there!
Our product: http://www.digitanto.it/mc-online/PDF/Articoli/130\_326\_329\_0.pdf

[14:17:14](#dUInvAcLQWcD4m8QOppRs99hajcgfQIAMMekeevXjmk) <GiuseppeChillemi (GiuseppeChillemi)>:
 * My life has started with RKM (Rom Kernel Manual) on the Amiga and 680xx processor, our team has developed some products for CDTV where CPU register access and DMA problems were on daily base. One of our team has also discovered a data invalidation problem you have on 680x0 CPU and AmigaOS where DMA write on a memory area would not corresponds of a CPU cache flush, so triggering an OS FIX from the Commodore Development Team.
And yes, it is my own knowledge. I have stopped my life for personal problems but I was there!
Our product on 1992: http://www.digitanto.it/mc-online/PDF/Articoli/130\_326\_329\_0.pd

[14:22:19](#UH044M_REzoRG_V5nRl3MueILw5mUQ1ec9_Tf_KtqU4) <GiuseppeChillemi (GiuseppeChillemi)>:
 * My life has started with RKM (Rom Kernel Manual) on the Amiga and 680xx processor, our team has developed some products for CDTV where CPU register access and DMA problems were on daily base. One of our team has also discovered a data invalidation problem you have on 680x0 CPU and AmigaOS where DMA write on a memory area would not corresponds of a CPU cache flush, so triggering an OS FIX from the Commodore Development Team.
And yes, it is my own knowledge. I have stopped my life for personal problems but I was there!
Our product on 1992: http://www.digitanto.it/mc-online/PDF/Articoli/130\_326\_329\_0.pdf

[14:22:30](#0-Vt16Kek-EDnVqT0AbzM6t64vu1vJLDAGDwVKoKtx0) <GiuseppeChillemi (GiuseppeChillemi)>:
(Link fixed)

[14:26:33](#aM6o2ezLFkdCZKwaRM9Yw0IUuvNWKb8aAf4oyeHUTkI) <GiuseppeChillemi (GiuseppeChillemi)>:
 * My life has started with RKM (Rom Kernel Manual) on the Amiga and 680xx processors, our team has developed some products for CDTV where CPU register access and DMA problems were on daily base. One of our team has also discovered a data invalidation problem you have on 680x0 CPU and AmigaOS where DMA write on a memory area would not corresponds of a CPU cache flush, so triggering an OS FIX from the Commodore Development Team.
And yes, it is my own knowledge. I have stopped my life for personal problems but I was there!
Our product on 1992: http://www.digitanto.it/mc-online/PDF/Articoli/130\_326\_329\_0.pdf

[14:37:58](#cDnzX7ox9vadI8DmmjCzL7L3xmJnWiFEKp8tJJ0OsF0) <GiuseppeChillemi (GiuseppeChillemi)>:
 * My life has started with RKM (Rom Kernel Manual) on the Amiga and 680xx processors, our team has developed some products for CDTV where CPU register access and DMA problems were on daily base. One of our team has also discovered a data invalidation problem you have on 680x0 CPU and AmigaOS where DMA write on a memory area would not corresponds to a CPU cache flush, so triggering an OS FIX from the Commodore Development Team.
And yes, it is my own knowledge. I have stopped my life for personal problems but I was there!
Our product on 1992: http://www.digitanto.it/mc-online/PDF/Articoli/130\_326\_329\_0.pdf

[14:38:07](#BXs9dz79igC8580Wf08dOJn1FvVMDCqzNnBzCTsejj8) <GiuseppeChillemi (GiuseppeChillemi)>:
 * My life has started with RKM (Rom Kernel Manual) on the Amiga and 680xx processors, our team has developed some products for CDTV where CPU register access and DMA problems were on daily base. One of our team has also discovered a data invalidation problem you have on 680x0 CPU and AmigaOS where DMA write on a memory area would not correspond to a CPU cache flush, so triggering an OS FIX from the Commodore Development Team.
And yes, it is my own knowledge. I have stopped my life for personal problems but I was there!
Our product on 1992: http://www.digitanto.it/mc-online/PDF/Articoli/130\_326\_329\_0.pdf

[14:57:33](#F91oZisUtyEr-k0e_wPHYmtEjLHm8raHPuF-BVZ8iUE) <dockimbel>:
WRT your knowledge, after years here, everyone can see where it stands. Anyway, I salute your constant enthusiasm and support for Red! Now let's keep the discussions here on topic.

[15:15:07](#yLtFn6kw-K4W190icVMh_UoOnfW2rmWYV-mw-rTdm8g) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@dockimbel-556597ad15522ed4b3e10020:gitter.im> WRT your knowledge, after years here, everyone can see where it stands. Anyway, I salute your constant enthusiasm and support for Red! Now let's keep the discussions here on topic.

My knowledge has raised thanks to all of your support which moved me from the darkness I were caused to some fluency on Red. Also consider that not all brains have born equal and mine is highly intuitive, creative but easy to forget some topics and it require times to fix new knowledge because it runs to fast :-D.  You all can see that I anticipate elements on writing and mix elements, causing me to modify a lot of times chat messages after I write them. This is caused from speed and creativity. I will always be different, so please consider this way of doing the personality trait and mental strucuture this world has "gifted" (in good and bad way) to me.  
 I hope to continue to be helpful to this community and you as you have been for me. 
 Not let's really keep the discussion on topic!

[15:15:24](#HrUkbJ67ebEywQTs8QBc4SMlP-RR4Zb5ZFFGtassvJQ) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@dockimbel-556597ad15522ed4b3e10020:gitter.im> WRT your knowledge, after years here, everyone can see where it stands. Anyway, I salute your constant enthusiasm and support for Red! Now let's keep the discussions here on topic.

 * My knowledge has raised thanks to all of your support which moved me from the darkness I were caused from old languages to some fluency on Red. Also consider that not all brains have born equal and mine is highly intuitive, creative but easy to forget some topics and it require times to fix new knowledge because it runs to fast :-D.  You all can see that I anticipate elements on writing and mix elements, causing me to modify a lot of times chat messages after I write them. This is caused from speed and creativity. I will always be different, so please consider this way of doing the personality trait and mental strucuture this world has "gifted" (in good and bad way) to me.

I hope to continue to be helpful to this community and you as you have been for me.
Not let's really keep the discussion on topic!

[15:15:45](#cICAVhvUt9AeWi58hHLTicdFYMHEUIQ89WlKZsg_Pb0) <GiuseppeChillemi (GiuseppeChillemi)>:
 * My knowledge has raised thanks to all of your support which moved me from the darkness I were caused from having learnt on old languages to some fluency on Red. Also consider that not all brains have born equal and mine is highly intuitive, creative but easy to forget some topics and it require times to fix new knowledge because it runs to fast :-D.  You all can see that I anticipate elements on writing and mix elements, causing me to modify a lot of times chat messages after I write them. This is caused from speed and creativity. I will always be different, so please consider this way of doing the personality trait and mental strucuture this world has "gifted" (in good and bad way) to me.

I hope to continue to be helpful to this community and you as you have been for me.
Not let's really keep the discussion on topic!

[15:16:02](#hiMl55ezXxECwe5CkFBiorTCkkfnBqTMpo57EAt7Zvc) <GiuseppeChillemi (GiuseppeChillemi)>:
 * My knowledge has raised thanks to all of your support which moved me from the darkness I were caused from having learnt on old languages to some fluency on Red. Also consider that not all brains have born equal and mine is highly intuitive, creative but easy to forget some topics and it require times to fix new knowledge because it runs too fast :-D.  You all can see that I anticipate elements on writing and mix elements, causing me to modify a lot of times chat messages after I write them. This is caused from speed and creativity. I will always be different, so please consider this way of doing the personality trait and mental strucuture this world has "gifted" (in good and bad way) to me.

I hope to continue to be helpful to this community and you as you have been for me.
Not let's really keep the discussion on topic!

[15:16:51](#McdKo-qLLpYbuA1o5nOI32wKFZLMqMqETyBVQffaPEs) <GiuseppeChillemi (GiuseppeChillemi)>:
 * My knowledge has raised thanks to all of your support which moved me from the darkness I were caused from having learnt on old languages to some fluency on Red. Also consider that not all brains have born equal and mine is highly intuitive, creative but easy to forget some topics and it require times to fix new knowledge because it runs too fast :-D.  You all can see that I anticipate elements on writing and mix elements, causing me to modify a lot of times chat messages after I write them. This is caused from brain overspeed and creativity. I will always be different, so please consider this way of doing the personality trait and mental strucuture this world has "gifted" (in good and bad way) to me.

I hope to continue to be helpful to this community and you as you have been for me.
Not let's really keep the discussion on topic!

[15:17:12](#dJpsBbRRM8DpcikChFL0YQtnUY4Se5H7xVaCB2VA9h8) <GiuseppeChillemi (GiuseppeChillemi)>:
 * My knowledge has raised thanks to all of your support which moved me from the darkness I were caused from having learnt on old languages to some fluency on Red. Also consider that not all brains have born equal and mine is highly intuitive, creative but easy to forget some topics and it require times to fix new knowledge because it runs too fast :-D.  You all can see that I anticipate elements on writing and mix elements, causing me to modify a lot of times chat messages after I write them. This is caused from brain overspeed and creativity. I will always be different, so please consider this way of doing the personality trait and mental strucuture this world has "gifted" (in good and bad sense) to me.

I hope to continue to be helpful to this community and you as you have been for me.
Not let's really keep the discussion on topic!

[17:23:48](#GTno9AAl37BFQZAMQjJKVs7Wg-9ppRxGsA5Fq-zSmMQ) <GiuseppeChillemi (GiuseppeChillemi)>:
 * My knowledge has raised thanks to all of your support which moved me from the darkness that were caused from having learnt on old languages, to some fluency on Red. Also consider that not all brains have born equal and mine is highly intuitive, creative but easy to forget some topics and it require times to fix new knowledge because it runs too fast :-D.  You all can see that I anticipate elements on writing and mix elements, causing me to modify a lot of times chat messages after I write them. This is caused from brain overspeed and creativity. I will always be different, so please consider this way of doing the personality trait and mental strucuture this world has "gifted" (in good and bad sense) to me.

I hope to continue to be helpful to this community and you as you have been for me.
Not let's really keep the discussion on topic!

[18:49:25](#-lb61stTdD08WJD2SFj8bxgHLLPJSePNdg3W-mgBwGE) <Isoux>:
> > just theoretically, would it be possible to generate e.g. C code, or an Webassembly?
> 
> We already planned for wasm support. For outputting C, we could but we would loose the "human-friendly" approach of our toolchain then. Moreover, R/S has some specific features not supported by C, nor C compilers. Even if we would use LLVM, we might have to modify it to support 100% of R/S features. The main point of not using LLVM from the beginning was to have the freedom to design features beyond what C toolchains support.

I like this statement so much ... I really would not like Red to rely on LLVM and certainly not on C, when it has such good potential that is already bearing good fruit. This is one of the biggest reasons I fell in love with Red.

[18:54:46](#x0KSfFLOGFI4etYzvHejqPrtpLWzBVObyHWpckdfWik) <greggirwin (Gregg Irwin)>:
We agree. It's just hard to keep up with a small team, and only a few who can do this deep work. 

[19:09:30](#BDdzhA-zf5xRm3sVMF0n236V7jbVbqhvTi-Zp1DOoQY) <Isoux>:

> Our plan is to rewrite the whole toolchain in Red code (and drop the Rebol dependency entirely). We want the new compiler to be much faster than the current one. Just using faster algorithm will not be enough, so we considered writing some portions in R/S. Though, that's not great for speed of development, nor robustness, nor maintainability. Fortunately, I think I have figured out an alternative way to solve that and developing it on a private branch for now until alpha level is reached.

I personally can't wait for that day. I would like to help with that, but I am neither a professional nor do I have enough knowledge and skills for that. Maybe some small idea like this and I'm waiting  to admire your work while slowly learning R and R/S!



[21:08:04](#G2Vy-RkcAgGlOUgwKhBo8ChhsIGRHaGlSC-rmKVlLBw) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@greggirwin-55659ddb15522ed4b3e1006f:gitter.im> We agree. It's just hard to keep up with a small team, and only a few who can do this deep work. 

My opinioni Is that you simply must concentrate and deliver few things that could be used.  Then solutions will be delivered and the developers will come once they will see the greatness of Red all around. 

## 12-Oct-2023

[22:43:47](#Qp08TCPmMjyusNFsZENa9f0rmddUU31pwdlyvp7OjEQ) <ALANVF (theangryepicbanana)>:
Hey I'm implementing the `move` action for Red.js, and I've come across this line https://github.com/red/red/blob/master/runtime/datatypes/series.reds#L440

[22:44:50](#2_EaeAAyt4LZfalrntNPcpnso4EcfYV4GJ-9Ecgagr0) <ALANVF (theangryepicbanana)>:
it seems... weird.. that it uses uses `tail` with `dst` because `tail` is coming from `src`

[22:45:24](#mkFmSID-U8R-R2xeams3OAlDHfpN79IGkYfnzc_eQAM) <ALANVF (theangryepicbanana)>:
when I'm implementing this logic on my end, it raises a false positive with the expression `move/part [1 2 3] next [4 5 6] 3`

[22:46:29](#mvaWmd8x5RMbAoaWO5HOpYxyyK7cvIqREaRz4aVv6c0) <ALANVF (theangryepicbanana)>:
I ended up changing it to be `dst > src src <> tail part > (as-integer tail - dst)` which makes a bit more sense and doesn't trigger that false positive

[22:46:59](#XoK9E_dZeI7qd-bh5QNB0sGyUe-2l8IWn5CV_XfX_dk) <ALANVF (theangryepicbanana)>:
but at that point it all seems redundant

[22:47:05](#NP7VLtONTeJX74KrP9k7j0cYzYXTc_6wkARfkV3Z_l4) <ALANVF (theangryepicbanana)>:
am I missing something?

[22:47:28](#ArQyTeJ86FVsFsoMIC8H0gZKKeQWMHrAAO1PSbhyZsE) <ALANVF (theangryepicbanana)>:
 * it seems. weird that it uses uses `tail` with `dst`, because `tail` is coming from `src`, not `dst`

## 13-Oct-2023

[8:16:15](#s2j59TD1nKu9Gc4gQVlIiUXuct0OB23t12IKuDvagME) <hiiamboris>:
you're missing that it's riddled with bugs :)

[8:17:35](#tHUVramUxfD-c3kIwPrWV1Cf6DqhaEN29ps6dNGNnFo) <hiiamboris>:
* you're missing that it's packed with bugs :)

[8:20:16](#UwAW8qvCRBficWLvskOUUDsEUV_jPz_51sCUrGHOfLI) <hiiamboris>:
even how it treats the offsets is a total mess

[8:20:41](#EcojrEzswUnhTNnu1Um-nydyZsb7xiNVqKZXOeNl7Iw) <hiiamboris>:
* even the most basic thing - how it treats the offsets - is a total mess

[10:09:40](#4R0zi1JNkbWn4u76Uf1zD3YutMmZprJASFqjxDWmWKc) <pekr (Petr Krenzelok) (@pekr:matrix.org)>:
Haven't you proposed to unify inner workings with series parts, so that it is more consistent? 🙂

## 17-Oct-2023

[2:27:11](#L38Ajy-NztnT5kjvZhkEJDihuKCC5hKCVLgZn9pO3N0) <ALANVF (theangryepicbanana)>:
I feel like the sort impls here are really poorly written https://github.com/red/red/blob/master/runtime/sort.reds

[2:27:43](#euPlhpDuvwLHqN9PbGWWubGwEmcTdDUSNkLuFq6UzlU) <ALANVF (theangryepicbanana)>:
not in terms of speed, but in terms of self-documentation (or any documentation in general) and it has tons of indirection

## 18-Oct-2023

[14:09:03](#pujcBSmjgCBgimRXR6USqIlLcVgsmVDGY0QnAWpVQ90) <dockimbel>:
ALANVF (theangryepicbanana): Sorting algorithms are not for the faint-hearted. If you think you can provide an easier to read implementation of the same algorithms while keeping its performance around the same, please feel free to post a PR.

[15:27:44](#vj3JCNoC35EcrJNysrZ_qHo490a35_tAsUS4ZX2wEr4) <ALANVF (theangryepicbanana)>:
I'd like to invest some time into it eventually, however making sure it keeps the same exact behavior (and as you mentioned, perf) as before is very difficult, so I'd need to think about it

[15:29:02](#NmmDRBEEb4697ROf7KK7oWzL6RaLTGq06MEk_c88v0g) <ALANVF (theangryepicbanana)>:
I may yet to experiment with my Red.js version first (as it's essentially a 1:1 translation without the low level memory stuff) since it's easier to navigate

[15:29:34](#5sB4WyKUNrzosYE6bqKwWTkKEluVfZziFrpn8Cx1YjM) <ALANVF (theangryepicbanana)>:
* I may try to experiment with my Red.js version first (as it's essentially a 1:1 translation without the low level memory stuff) since it's easier to navigate

[15:30:22](#OeEa97rj0e-B-UvXrq1SmhiW5-0H0sFBNugvqwty_ns) <ALANVF (theangryepicbanana)>:
I do think that at least a bit of code documentation would go a long way though

[17:38:04](#cy04lfzxurpoZbgmXVpJ3jw0IqI7or7NZ9jgSdvZmFE) <dockimbel>:
You can ask qtxie about it, as he's the author.

## 19-Oct-2023

[3:16:40](#7RaDMgqjYNi8vdd0Cmfr_3LCZLR9GWk6PgT7CJT0JEc) <qtxie>:
The `qsort` is the classic quicksort which ported from C code in [libc](https://android.googlesource.com/platform/bionic.git/+/eclair-release/libc/stdlib/qsort.c). The mergesort is a simplified version of the `GrailSort`. You can check the detail of it in here: [GrailSort](https://github.com/Mrrl/GrailSort)

## 27-Oct-2023

[11:48:49](#Rfl2DW5M86UNfjcftkmD1q6Ti5RN0pqpDtHD7Q1wXxM) <GiuseppeChillemi (GiuseppeChillemi)>:
I have read the whole R/S manual. It is another fantastic language. 


[11:51:04](#bCoutvbBFj9hsLN8G4D67Cyw7sF1H1oGXfm_beHxaSU) <GiuseppeChillemi (GiuseppeChillemi)>:
The only part to read again is the VALUE part at the end of struct! definition. Everything else was very clear! 

[11:56:24](#JgYQnyXwGVfTlpUm85tCHwbpWkBOyRvvPUe3fb9o_e4) <GiuseppeChillemi (GiuseppeChillemi)>:
I don't see documentation about:
   How do I compile It? 
   How do I include and use R/S in Red Code?
   How do I compile R/S with calls to Red code and include the interpreter?


[17:22:31](#aF491WURh4PRuc1sLdt2q8IreumF8RuVquFnwIqSl2Q) <GiuseppeChillemi (GiuseppeChillemi)>:
I have tried `redt.exe` without success. header starts with `red/system`

[17:22:43](#tgNbFojvXd_WjiBX4odJDbGlVDanbMsgcGWJ46TJJvw) <GiuseppeChillemi (GiuseppeChillemi)>:
```

count: func [
	/local 
	idx [integer!]
	idx2 [integer!]
] [
	idx: 0
	idx2: 0
	until [
		idx2: idx2 + 1		
		
		until [
			idx: idx + 1
			idx = 1000000000
		]
		idx2 = 1000
	]
]
```
count







[17:23:11](#m7wZ1iq5c6rm6FBWGXwRJ5oaSaeTzzjNpzYdMWtj4iM) <GiuseppeChillemi (GiuseppeChillemi)>:
 * ```

count: func [
	/local 
	idx [integer!]
	idx2 [integer!]
] [
	idx: 0
	idx2: 0
	until [
		idx2: idx2 + 1		
		
		until [
			idx: idx + 1
			idx = 1000000000
		]
		idx2 = 1000
	]
]

count

[17:23:17](#YOdTMEUdFLnsrgkyYUQLFPsp_jPOqemikY-NPV9vfV8) <GiuseppeChillemi (GiuseppeChillemi)>:
 * ```

count: func [
	/local 
	idx [integer!]
	idx2 [integer!]
] [
	idx: 0
	idx2: 0
	until [
		idx2: idx2 + 1		
		
		until [
			idx: idx + 1
			idx = 1000000000
		]
		idx2 = 1000
	]
]

count
```


[17:23:24](#YX3i38sUzOXqRIvoU2Z1Rr5e_Nv-Y_yGY8S-Bi6Tv9Q) <GiuseppeChillemi (GiuseppeChillemi)>:
It does not compile

[17:24:14](#f5eRcG5AjVorlqMl4Ya5kV8O3Nz0eDRR4PH_M8Km13E) <GiuseppeChillemi (GiuseppeChillemi)>:
2) Where are defined all Red specific structs?

[17:24:22](#H3FtGkVOSY7HDsBk-gB5dZe5LzpcLFdeNNXu70jBiIc) <GiuseppeChillemi (GiuseppeChillemi)>:
 * 
2) Where are defined all Red specific structs?

[17:24:38](#6mBgN3tsE62Fnnn9ss_3rtaSD8fmclmdPTDJ2AGZeuY) <GiuseppeChillemi (GiuseppeChillemi)>:
 * It does not compile

Second question:

[17:24:47](#E3b41ZxFLfleuFUGAKm7z55rIPr-84ZIeJhwZxY9vg4) <GiuseppeChillemi (GiuseppeChillemi)>:
 * Where are defined all Red specific structs?

[17:26:40](#JF3NtoUX1jHHuw29VXGR3m5UA5_4ch-abQSLWq2Apvs) <hiiamboris>:
`%structures.reds`

[23:43:46](#7w4lhlPd7J_-iSx18UltpW627HvnxYY-D2fcHSZDB_g) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> `%structures.reds`

Thank you

[23:44:26](#8QiBa6F6w7eJzfsbc8krmPE6GYeVaHsuc-RS86cf2nY) <GiuseppeChillemi (GiuseppeChillemi)>:
 * I don't see documentation about:
1)   How do I compile It? 
2)  How do I include and use R/S in Red Code?
3)  How do I compile R/S with calls to Red code and include the interpreter?


[23:45:41](#4oVrwfMeXLz_RIjpcKlPHf327rdiq1TqBz9MXcdM3YU) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@giuseppechillemi-59045d00d73408ce4f5bcd9d:gitter.im> I don't see documentation about:
> 1)   How do I compile It? 
> 2)  How do I include and use R/S in Red Code?
> 3)  How do I compile R/S with calls to Red code and include the interpreter?

I was able to solve #2. Could you provide some links to examples or docs for the others?

[23:47:51](#O94gKPv9whUH_43Q3N2yCXs00kXtDcBZwVFIZLAUABc) <GiuseppeChillemi (GiuseppeChillemi)>:
 * I was able to solve #2. Could you point me to some examples or docs for the others?

## 28-Oct-2023

[0:02:14](#DDNfMdQtbBBRpThdik7qWHtZRl2Lpez65gJJLAsS6YY) <GiuseppeChillemi (GiuseppeChillemi)>:
Also I dont find documentation on `#system` and `#system-global`

[0:02:21](#PDUUW1yae6rZYlG8iu11KB6CJu3m7d4n-h87-tAPvwU) <GiuseppeChillemi (GiuseppeChillemi)>:
 * Also I don't find documentation on `#system` and `#system-global`

[7:37:51](#H9vZDG2Uqusol-BK55HJ5oE8uuZcjUCneV7IoQwU9Vw) <hiiamboris>:
to compile surprisingly you just give the filename to the toolchain

[8:46:32](#bk0wjI_5sPq2sAdTkQkYNFyuhcKRO5-EQbzVa6MV858) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> to compile surprisingly you just give the filename to the toolchain

Somewhere this had failed in the attempts. I will retry it today.

[8:46:56](#DrNwWGguSE5xezA-8Phq1jrJ1lpoYz2zFgZL6BfPdSc) <GiuseppeChillemi (GiuseppeChillemi)>:
* In reply to @hiiamboris:tchncs.de
to compile surprisingly you just give the filename to the toolchain

Somewhere this has failed in the attempts. I will retry it today.

[10:26:20](#SDZ0CAnOTdz4ddnyOOG4YzyoPQW59FdaDgRD4fjCQxc) <GiuseppeChillemi (GiuseppeChillemi)>:
I have searched all around. Some questions and answers are in stack overflow. 
Have you suggestion for other sources apart this group? 

[10:26:54](#EuR7PcmXSrKeh3felQ2R9AL4QLHyLt0ENI-oulIvsmk) <GiuseppeChillemi (GiuseppeChillemi)>:
I either need q/a , documentation and scripts.

[10:30:32](#s4YopyoZnBiBJJ-2hVkYT5StQTkIYM56oUmGqjdGzSI) <hiiamboris>:
wiki

[13:04:28](#geD4YA9U1JOBhDg7pHWj8R4NaXVFROrdRvAMin1NkKw) <GiuseppeChillemi (GiuseppeChillemi)>:
I have found some scripts in the code repository but not so much and had to filter for `.reds`

[13:05:40](#dBSdugNF-PY_2LDZdedkpbp8FdfOwCT6lkHz0hxcRp8) <GiuseppeChillemi (GiuseppeChillemi)>:
It is helping the great work done on previous gitter archive by Oldes and rebolek (Boleslav Březovský)  https://rebol.tech/gitter.im/red/red/system/2016/#msg57953db21b9de56c0ee1051e

[13:06:29](#BMglk5I2ItM5075BuhSU6p1d8qr_gn8Iq_Hmu-5RhGc) <GiuseppeChillemi (GiuseppeChillemi)>:
https://rebol.tech/gitter.im/red/red/system/2016/#msg57fba53970fcb5db0c44d800

[13:06:40](#kDwYmsdIpdlP5Ou1RKQC9k1SR5kxfSNjsjPTsoaS4WE) <GiuseppeChillemi (GiuseppeChillemi)>:
The good old simple days!

[13:10:54](#SbtPF3qOaDslxKexkrcPEb4UUIrlJXoqkwHpwq_AWYk) <GiuseppeChillemi (GiuseppeChillemi)>:
greggirwin (Gregg Irwin): Do you know where I can find this? https://github.com/red/red/wiki/Red-System-tutorial-for-newcomers-English-version

(From here: https://rebol.tech/gitter.im/red/red/system/2017/#msg59fc632ae44c43700ab1a87d)

[13:22:59](#2kIF8EB108TEb0dMO34Wn7XysRaq5m7WaSzIlbsQVVM) <GiuseppeChillemi (GiuseppeChillemi)>:
hiiamboris: Catched! Our 9214 (Vladimir Vasilyev)  is still [helping a lot](https://rebol.tech/gitter.im/red/red/system/2019/#msg5c9e1e896a9761361b20db2a): 

[13:42:07](#-BdfvraYyTm-XxeRyMvhrrd3r0R3PyPqa5xXa3MNhfQ) <GiuseppeChillemi (GiuseppeChillemi)>:
Also, do you know where is the link for [this](https://github.com/red/red/wiki/%5BNOTES%5D-Red-System-Notes)? 

[14:34:30](#rOQEhJN2Qv0QMy8ueAz4QWs15aTa2uL4HBt1YkKvYb0) <hiiamboris>:
https://github.com/ldci/Red-System/blob/main/doc/Programming_with_Red%3ASystem.pdf btw

[14:39:59](#ldOlgRybaUCsvrs9hJdMBln6UEMgJwyr2JooQ_ZPTeg) <hiiamboris>:
> <@giuseppechillemi-59045d00d73408ce4f5bcd9d:gitter.im> Also, do you know where is the link for [this](https://github.com/red/red/wiki/%5BNOTES%5D-Red-System-Notes)? 

what link?

[15:57:24](#LTnMYLE6RdWnbvB9GhcB9QWjPVuck3lHNUY9ZhL9vmc) <GiuseppeChillemi (GiuseppeChillemi)>:
The link pointed by THIS, I don't find the entry point in the Wiki 

[15:57:54](#RBtUrui44u2pSX2ZT7DqfKhmQAxHVUQ1IB3tDofV_U8) <hiiamboris>:
opens fine for me

[15:58:18](#cY2813xZJY7xfvquLZqwjQQQEeYPGzgpLMVLyRu3JOg) <hiiamboris>:
* opens fine for me as is

[16:03:16](#pTP8AjjPFMbeS04PQ1hn0gyIxbjtrtZOeRs885wfCpI) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> opens fine for me as is

I mean a page that links that page.

[16:04:05](#Q0rqG_IGzyxhaG4lYHqHw1JjLrIPuhHBKJsacL3qiZs) <GiuseppeChillemi (GiuseppeChillemi)>:
Is there a link to this page in the wiki? 


[16:04:08](#st4_e10pj9Vt52yhlb90zpPnrWGLYdr7TKoILB4mVcc) <GiuseppeChillemi (GiuseppeChillemi)>:
https://github.com/red/red/wiki/%5BNOTES%5D-Red-System-Notes

[16:04:29](#TdErU8I_5BMc_cmbd_XlC_lOIHIK53XJdVhkhMRrMIA) <hiiamboris>:
idk, why should there be?

[16:04:59](#GvwRbs4ySM3ZBTwlMFMQb4NvTIXSc-s-jnNCprTRz0w) <GiuseppeChillemi (GiuseppeChillemi)>:
Because if It Is not referenced  It Is orphaned

[16:05:50](#h1EQOhQ-H-vR5AXxf9U2el1J9y1sPtgftksQL746GR4) <GiuseppeChillemi (GiuseppeChillemi)>:
I have found It in the Red/system archive but not in a wiki Page (It seems)

[16:05:58](#c1dWOBGB1zTBxkZ_8rgMe8uFhgaPPjPrldwPiP4K6l8) <hiiamboris>:
there's a list of all existing pages on the right

[16:06:25](#QsKqlGVCpsFUU5CU20eiUztDRGCWlEwWUO8TJ18sb_E) <hiiamboris>:
it's automatic

[16:08:01](#-juyknJftOBjsMfuM7Qajoar3y8Y_fbpE-prPveNahM) <GiuseppeChillemi (GiuseppeChillemi)>:
Do you see It there?

[16:10:10](#JsOru8Zsy3RCOoGGVbH1v7-D99cyLHUHnsQQRVPiL_E) <hiiamboris>:
![](https://tchncs.de/_matrix/media/v3/download/tchncs.de/b7720bdc49aadf50e3208d67098014dddd2911dc)

[16:16:22](#Iji1Xo7_2qcbWtt58on_5_mQGaZU4CAtkjWpw2prUWE) <GiuseppeChillemi (GiuseppeChillemi)>:
![](https://gitter.ems.host/_matrix/media/v3/download/gitter.im/ac62a5a804492c6212ace3d39b527f30ab277b0f1718300681837740032)

[16:16:47](#VSCnEVBGQ90tVt6yNIIgCt5RmVYVFXoi-lBtvTrNCCk) <GiuseppeChillemi (GiuseppeChillemi)>:
The list for me was the one at the bottom.

[16:17:19](#EnFC5kkmXTrlNJEuFv8xPy5kVXmEQiFPXzBBobOGBLc) <GiuseppeChillemi (GiuseppeChillemi)>:
But now we have discovered a secondary index

[16:17:34](#cxTs-tefdfgnPRdfsrFbPFkSsGa0st98HnwrqqE7VM8) <GiuseppeChillemi (GiuseppeChillemi)>:
Clicking on Pages.

[16:21:25](#PedyFsdNXc3ReNmAuWCPIyIeOx9jVsJsos30thCMlxc) <hiiamboris>:
ah, you're on mobile

[18:28:09](#3tifiqXJ3LE68siFhkResL-gmqA6gf92pGp9MGimV0s) <greggirwin (Gregg Irwin)>:
https://github.com/red/red/wiki/%5BDOC%5D-Red-System-tutorial-for-newcomers-English-version

[21:14:39](#HaQB1lcALH3nETamc_kv72ran1hQzactS9j07LDr-jA) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@greggirwin-55659ddb15522ed4b3e1006f:gitter.im> https://github.com/red/red/wiki/%5BDOC%5D-Red-System-tutorial-for-newcomers-English-version

Thank you

## 31-Oct-2023

[0:40:14](#ROmu85jXAQgZrhcZcv3A_MSm-8Fo23k0_mxuj8QKJKA) <GiuseppeChillemi (GiuseppeChillemi)>:
I have not understood is the `system-global` is `system/words` namespace. 

[1:13:01](#qoJfzpSAkki_mgE2gWC-OrjqzxMBJN67pKAxDk3w7Ec) <GiuseppeChillemi (GiuseppeChillemi)>:
* I have not understood if the 
system-global is system/words namespace.

[1:13:24](#xUPnaSSRdfLMkGyfgkBlDgJVnD5GttGMaI1xBRcy-kY) <GiuseppeChillemi (GiuseppeChillemi)>:
 * I have not understood if the 
`system-global` is `system/words` namespace.

[1:13:33](#-eI8EeACXQaIduNSTOJYg8ok1XRUvRAiP8B_jXmZifI) <GiuseppeChillemi (GiuseppeChillemi)>:
 * I have not understood if the`system-global` is `system/words` namespace.

[7:13:41](#OjQSE58o87BKaS92m0hUWxIugshPvs4hOwo7PJ8e5iI) <hiiamboris>:
Red contexts have nothing to do with RS namespaces.

[8:01:15](#ewEvB1iJd5N_8fuAYtR8Kjlfd3zowmo0lF8hQRiaiYI) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> Red contexts have nothing to do with RS namespaces.

So I have not understood the difference between #system and #system-global

[8:08:10](#33KcJVm2TmSgAFmbehDxmHxLvtSZv_Z58yUEOeqiu_Y) <hiiamboris>:
sorry, I mistook `system/words` for Red context, but R/S has its own pseudo-namespace with the same name

[8:08:43](#1_gKktrElJ8DhHEA14WrYGHZL9XMiaF8jNoQUWavpVA) <hiiamboris>:
it would be correct to say that `#system-global` defines will be accessible under this pseudo-namespace in R/S

[9:22:51](#8vM1v9_RFH3YDEvcAMDk2cjrl4avHoYFVoKxss7LGeE) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@hiiamboris:tchncs.de> it would be correct to say that `#system-global` defines will be accessible under this pseudo-namespace in R/S

I have still not clear the overall working. Which are their differences regarding in R/S? And in Red?

[9:23:19](#ozU4PJdphZMbW3kAs1ycP-8qNo8DuZmVEVkyBq9PXYc) <GiuseppeChillemi (GiuseppeChillemi)>:
* In reply to @hiiamboris:tchncs.de
it would be correct to say that #system-global defines will be accessible under this pseudo-namespace in R/S

I have still not clear the overall working. Which are their differences regarding R/S? And in Red?

[9:29:31](#2hVjnJIvlSMYIua-f_ol9fToTRXfLH7rJ2G8b5HChys) <hiiamboris>:
their - whom?

[9:58:30](#DnKewxisXcLIqaesk7kfgMmbf6-s0E9vQJs7BI_rkds) <GiuseppeChillemi (GiuseppeChillemi)>:
#system and #system-global, how they differ? 

[10:43:54](#0kcSfInNkQLUvJmXDxkOJRfVGTjN5t9Pp2H-fwV7gjk) <hiiamboris>:
https://github.com/red/red/wiki/[DOC]-Guru-Meditations#global-vars-in-red-system-routines

[10:44:02](#-qTL_qDxp-oefjjac9OaI8DL1oYW_gaKl2mqvuSMdtM) <hiiamboris>:
> Use #system if you want your code to be under the internal Red namespace, or #system-global otherwise.

[10:45:18](#4fGk2OdgunG-3XODYIuKMbJZ5kvoNvyBkUBOW2tjlsY) <hiiamboris>:
the shortest and most to the point answer I've seen

[12:37:28](#3wSIyaJtLppts0s3dG9CmYTVc1idwZHsyYK0z2-RHNs) <GiuseppeChillemi (GiuseppeChillemi)>:
It leaves me more questions than the one that It answers. I have understood that you can see names defined in #system-global between routines but.... (Questions haead later)

## 11-Feb-2024

[16:48:21](#GgNQutTTiBskFswRVEE-Vl2UpOh-Ud-EAX5Q9ThUa04) <loziniak (Maciej Łoziński)>:
Hello. I'm trying to access binary data in a routine, but I get an error `undefined symbol: red/binary/load`:
```red
r_safe_connect: routine [
	 ref [handle!] 
	params [binary!]
	return: [binary!]
	/local buffer ret
] [
	buffer: c_safe_connect
		tokio_runtime
		 as handle! ref/value 
		binary/rs-head params
		binary/rs-length? params
	
	ret: binary/load buffer/data buffer/len
	buffer_free buffer
	as red-binary! SET_RETURN(ret)
]
```
```
$ ./red-toolchain-10feb24-1c3cd7363 -c -o bin/sn-ffi-test sn-ffi-test.red

-=== Red Compiler 0.6.4 ===- 

Compiling /mnt/share/prj/maidsafe/sn_ffi/sn-ffi-test.red ...
...using libRedRT built on 11-Feb-2024/11:47:09
...compilation time : 48 ms

Target: Linux 

Compiling to native code...
*** Compilation Error: undefined symbol: red/binary/load 
*** in file: %/mnt/share/prj/maidsafe/sn_ffi/sn-ffi-test.red 
*** in function: exec/r_safe_connect
*** at line: 386 
*** near: [binary/load buffer/data buffer/len 
    buffer_free buffer 
    as red-binary! stack/set-last
]
```
What's the problem?

[17:10:39](#3jQDi0Pn2wGjUgkW_wQh3TpYKqmj7TL4NdiSZLEnNrM) <hiiamboris>:
try `-r`

[17:11:32](#q3oa4llX_4hOam41xZow2AFKkaMVgCPt1bX2CUjVmFM) <hiiamboris>:
how's it at maidsafe? I thought they're dead or smth

[17:12:15](#8KLOJybHPqzqaFkm8rabj88OnSmRcKHiDncGeD0jA7Y) <hiiamboris>:
* try `-r` or `-c -u`

[18:29:02](#egby6Rcq5W_JjgARAFpvtOm4Kn3MYHjhNtZEuyMzYKQ) <loziniak (Maciej Łoziński)>:
no, still alive. continuously approaching beta :-) but there are regular testnets now, so at least there is much fun :-)

[18:31:47](#dSXx3IzuewTZqEkNYDFffizWyo_IZw-ww70rpHKgoKM) <hiiamboris>:
think they can deliver on their promises?

[18:33:13](#g32rQe7gtV5RZZ56_HeNfyc7IH9Wm3dNnjHIhpwCmQ4) <loziniak (Maciej Łoziński)>:
yes, that's why I'm still working on that.

[18:33:40](#ALJn3RiDk0boFlFDdGtoKb6hXiw76t0BI4A1lkYfRAQ) <loziniak (Maciej Łoziński)>:
Red and Safenet are very similar :-)

[18:34:38](#zXFIpwMMwhFaHsi_5lNy4seT0ohkm0v2IMgjTyzOc3M) <loziniak (Maciej Łoziński)>:
hard to believe they will succeed without making it almost your own religion :-)

[18:35:33](#m6tGXak_IUg08Uk-KOBdAKguLRHUtsvmKnG-wYj_d5o) <loziniak (Maciej Łoziński)>:
> <@hiiamboris:tchncs.de> try `-r` or `-c -u`

Seems like `-c` and `-u` are mutually exclusive, right?

[18:50:33](#KbV1TJ83UjpQcdUMLccmxMPeZZKEks34M8xhV0WScNE) <hiiamboris>:
maybe just -u then :)

[18:51:22](#WtTFcJBD5GcAk_jIOMnuQL77IMrlUIH_Ps8X-Q5ekoU) <hiiamboris>:
supposed to build libredrt while exporting the symbols your program is using

[19:15:31](#B82Bw3tGF7OCbf8ncd-pqOYHfh4suAXdkVP4y5jzK80) <loziniak (Maciej Łoziński)>:
thanks, it worked. I always forget that.

## 12-Feb-2024

[18:34:51](#VeNFXLsnsHlq3HoZER7XRm9Q9e6nt2fSftkHtybmt-s) <greggirwin (Gregg Irwin)>:
There were some CLI changes, with `-c -e` also being disallowed now.

[20:21:45](#W8X_RYMTzdvdiyd5XnXO-lb2MM-Nb8q10nX2d452Lhs) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@greggirwin-55659ddb15522ed4b3e1006f:gitter.im> There were some CLI changes, with `-c -e` also being disallowed now.

Euthanasy is near.

## 19-Feb-2024

[22:13:30](#GaRY_-rM5a1fMtY3yySv_nlVD6zDMS01Eg3-uGdpDnI) <abdllhygt (Abdullah Yiğiterol)>:
hi

[22:13:38](#RKCypbKKOBd40FAct7Y91Qp-TfPRDF_VJpGlokhKUUM) <abdllhygt (Abdullah Yiğiterol)>:
I was reading red/system doc

[22:13:54](#vDTEqKD2ej-J2zOW0EGuMoX5aktatuKCQUY-qlHYX8A) <abdllhygt (Abdullah Yiğiterol)>:
does red/system support 64bit?

[22:14:41](#N_DTpaAJlOtJHjIoWiV9Ex4tltdT15KyLqYVxZlwyMM) <greggirwin (Gregg Irwin)>:
No, not yet.

## 6-Jun-2024

[11:46:46](#18x9_LWrkKc0WXeDyej3cYZVouMRNna5-bbMrtpzxB0) <isqwy (尘墨)>:
On Windows10:
env-args.red
```red
Red/System [purpose: "demo system/env-vars usage"]

env: system/env-vars 
until [ 
  print [env/item lf] 
  env: env + 1 
  env/item = null 
] 
```
then,compile it and call as:
```shell
red-toolchian-20240605.exe -c env-args.red
-=== Red Compiler 0.6.5 ===-

Compiling D:\Redlang\bin\env-args.md ...

Target: MSDOS

Compiling to native code...
...compilation time : 449 ms
...global words     : 4962 (15.08%)
...linking time     : 18 ms
...output file size : 25600 bytes
...output file      : D:\Redlang\bin\env-args.exe


D:\Redlang\bin>env-args.exe

*** Runtime Error 1: access violation
*** at: 00401063h
```
Why?


## 9-Jun-2024

[6:30:34](#x3jwy6XARvG3F0NRw6NXRnN56G6PgcuPYIAPCjX4SjU) <qtxie>:
isqwy (尘墨): dockimbel: 👆️ It's a regression.

[6:32:46](#ZhoeBuF7AmKuYs5gotHSfdGFwPncRdYh3oFuaBJFn70) <qtxie>:
 * isqwy (尘墨): dockimbel: system/env-vars is set to null on Windows.

[6:33:58](#hQBQyAiVPnqZLaSeEvj0HpGq2Z6yujERTCZYzYJJAkI) <qtxie>:
![](https://gitter.ems.host/_matrix/media/v3/download/gitter.im/1a06c9fcb6ff26a298d0bb86d476530bbc90e46e1799691386031702016)

[9:48:33](#OqLuDQIVOsTRpyHvFGiMBqNdFqTq5QDu_kixp1s3Jzw) <isqwy (尘墨)>:
I have seen this note, but I thought that running it after compilation should do nothing.why get access violation?

## 10-Jun-2024

[1:36:43](#d2Z5uw8hfTRarMBxJzF2tkChIM2niWgDgIr1Meo9yJk) <qtxie>:
isqwy (尘墨): `system/env-vars` is null, so you're access address 0x00000000, that's why you got access violation.

[5:22:19](#vKAk-hHl9ZzXBAN-iHhUVIxjXIDnziMp4EQor2NukGs) <qtxie>:
* isqwy (尘墨): system/env-vars is null, so you're accessing address 0x00000000, that's why you got access violation.

[11:53:02](#HZx2tAW2gtBjbKB0vFaoYC_dQpG0IaQTp7dZxX6cKTk) <isqwy (尘墨)>:
I see, thank you!

## 26-Jun-2024

[6:57:09](#iKy7KSGfY0RF8F78bQnn1sdVY8Vj39DnGNMC7RBKC5c) <bubnenkoff (Dmitry Bubnenkov)>:
Hi! What is the main difference between red\system and C?

Am I right that red\system use same pointer arithmetic as pure C? 

[8:54:48](#ZqGYLzek_t94jwpr3fsN7egLa_7zkDf4DAzeqxl31YE) <hiiamboris>:
it's just addition/subtraction, so same yes

[12:54:56](#TJDWTErbO2QvdIdP5R3FtGuJLejMF6dQoSuFFjN8vZ0) <bubnenkoff (Dmitry Bubnenkov)>:
And null semantic exactly same with none?

[12:55:04](#rh6BPZO3ztwe-JimK5I_eTrU2ciuLPaNPyljSG6w0kk) <bubnenkoff (Dmitry Bubnenkov)>:
 * And `null` semantic exactly same with `none`?

[20:07:23](#0BFze_GqcFa5oXJ-r2jND3e18mhdAOzwH1UCxK8CTPI) <hiiamboris>:
`none` in Red is a value that signals failure or absence of result, but `null` in R/S is zero that automatically coerces to all pointer types

## 7-Jul-2024

[10:59:32](#a19G0pSwBfSETHfEN5lyzZNNP6mTRvgH_wVK4pj29rg) <isqwy (尘墨)>:
```Red
a: "hello"                           ;c-string!
b: #{68656C6C6F}          ;binary array
```
Aren't they all the same in essence? If UTF-8 is supported in the future, then c-string! should be string!, should it be renamed?

[11:03:02](#zfYK2WWSxa2lBmciaFdZq-EWasZhtdpL4qlIOqvGviU) <hiiamboris>:
c-string is null-terminated, unlike the array

[11:07:33](#VjUvFUzHV5Sf18rBnEsfaTtHRhSjSTJr5hfbQ1UUW0g) <isqwy (尘墨)>:
> <@hiiamboris:tchncs.de> c-string is null-terminated, unlike the array

so, the only difference is that binary arrays do not have bounds checked?

[11:08:46](#f30mu4dJOeErz-mQMV001bi8Xl7ckO2EPe7Nv2mCq8Y) <hiiamboris>:
both don't have bounds checked, you can write outside them and get a segfault :) or corrupt your memory (like what Red often does to itself)

[11:09:06](#J2GVXtvO-seGyExdOiAPUNSWsyGiJIAOUNTiWhZ-Ln0) <hiiamboris>:
but `strlen()` won't work against the array

[11:09:34](#aMCIO1VaaCG9H3VbAC1i73EXZw-1nZ6X4eHQZh2DPqk) <hiiamboris>:
unless you manually set last byte to zero

[11:09:43](#2A8_OF9TnI25M_gkxSIYpPJ0Mqec3bjXIQqGhBdQFWQ) <hiiamboris>:
and array can contain zero bytes, while string can't

[11:16:02](#57NnOVW-Cqne_AuWMyYCJ4GIFlncaVrYj7m-Ue21SY8) <isqwy (尘墨)>:
thanks!

## 13-Jul-2024

[14:16:11](#2ADPuEyS8gHBG-skVI29XEVJA3BjWaEjyUzOTd6YrIQ) <isqwy (尘墨)>:
in 7.2.1 USE keyword,the example:
```Red/System
f: func [
   cond    [logic!]
   return: [integer!]
   /local 
       bar [integer!]
][
   bar: 3
   if cond [
       use [var][
           var: 10                     ;-- 'var is a local variable here
           bar: var + bar              ;-- will return 14
       ]
   ]
   bar
]
```
bar: var + bar
bar: 10 + 3
bar: 13
`;-- will return 14`
So, is this an editorial error?

[14:21:57](#Pc3qmW602wdn2DZ4UYHIUU6lIHjVbwC_PX6XVEu-2I4) <Oldes (@oldes.h:matrix.org)>:
Yes.

[14:25:01](#3lX6pCusORf9scMAj8Popu6RtvakOt1DXMBy0R61eSQ) <isqwy (尘墨)>:
Thank you

## 6-Feb-2025

[16:18:36](#kLUWVJc5Kq-03YkjbAKiUGyBGLitdjl79lPuTD0xaRc) <loziniak (Maciej Łoziński)>:
Hello!

[16:19:01](#nWi58_JyQVqiSpVq2qqwojmRCqZY1R-Glgib0ErrCDQ) <loziniak (Maciej Łoziński)>:
Am I doing something wrong?
```
safe_default: routine [
	return: [handle!]
	/local ref
] [
	ref: handle/box as integer! c_safe_default
	as red-handle! SET_RETURN(ref)
]
```

[16:21:41](#1rWfg2dDCtO_EM8uHyCuGopAAkMcgKF50FrRf6Qxeqs) <loziniak (Maciej Łoziński)>:
This is used here:
```
safe: object [
	ref: none
	test: none

	
	init: does [
		probe "init"
		self/ref: safe_default
		probe self/ref
		self/test: null-handle
		probe self/test
	]
	
	connect: function [
	     peers			;; in rust: Vec<Multiaddr>
	     add_network_peers			;; in rust: bool
	     secret			;; in rust: Option<SecretKey>
	    
	    ;; returns: Result<(), Error>
	] [
		probe "connect"
		probe self/ref
		probe ref
		probe self/test
		safe_connect
			 self/ref 
			 peers
			 add_network_peers
			 secret
			
	]
]

safe/init
safe/connect
```
and the result is:
```
"init"
handle!
handle!
handle!
"connect"
none
none
handle!
```

[16:23:56](#Gleskk4u78gjdBWg2tFJldLQ_W4uOmu-E2sBrXxtfkk) <loziniak (Maciej Łoziński)>:
* This is used here:

```
safe: object [
	ref: none
	test: none

	
	init: does [
		probe "init"
		self/ref: safe_default
		probe self/ref
		self/test: null-handle
		probe self/test
	]
	
	connect: function [
	     peers			;; in rust: Vec<Multiaddr>
	     add_network_peers			;; in rust: bool
	     secret			;; in rust: Option<SecretKey>
	    
	    ;; returns: Result<(), Error>
	] [
		probe "connect"
		probe self/ref
		probe ref
		probe self/test
		safe_connect
			 self/ref 
			 peers
			 add_network_peers
			 secret
			
	]
]

safe/init
safe/connect
```

and the result is:

```
"init"
handle!
handle!
"connect"
none
none
handle!
```

[18:41:01](#-ZA21wLn3CSKnQaggYCVNlU02riXo6mwW9G7IKBaBMk) <loziniak (Maciej Łoziński)>:
* This is used here:

```
safe: object [
	ref: none
	test: none

	init: does [
		probe "init"
		self/ref: safe_default
		probe self/ref
		self/test: null-handle
		probe self/test
	]
	
	connect: function [] [
		probe "connect"
		probe self/ref
		probe ref
		probe self/test
	]
]

safe/init
safe/connect
```

and the result is:

```
"init"
handle!
handle!
"connect"
none
none
handle!
```

[19:10:29](#8pIoUr5aGwBP-_meqXjrCvnYEanDM4NAcaF02d04kvQ) <gurzgri>:
```
safe-default: routine [return: [handle!]] [handle/box 4711]
safe: object [
	ref: test: none
	init: does [probe "init" probe ref: safe-default probe test: null-handle exit]
	connect: function [] [probe "connect" probe ref]
]

safe/init safe/connect safe/connect safe/connect
```
seems to work for me. I think the problem is with your `as red-handle! SET_RETURN(ref)` . For routines, when return spec and value returned match in their type `SET_RETURN` is not required I think, neither is the implicit `copy-cell` for boxed values I think. But I have forgotten a lot in the last years without actual development in Red/S code.  

`SET_RETURN(value)` macro is defined as `[stack/set-last as red-value! value]` 

[19:11:27](#kfZEltKFnaoa2vD6fuDK1fpigkF8D3efaa5_O67D-Es) <gurzgri>:
* ```
safe-default: routine [return: [handle!]] [handle/box 4711]
safe: object [
	ref: test: none
	init: does [probe "init" probe ref: safe-default probe test: null-handle exit]
	connect: function [] [probe "connect" probe ref]
]

safe/init safe/connect safe/connect safe/connect
```

seems to work for me. I think the problem is with your `as red-handle! SET_RETURN(ref)` . For routines, when return spec and value returned match in their type `SET_RETURN` is not required I think, neither is the implicit `copy-cell` for boxed values I think. But I have forgotten a lot in the last years without actual development in Red/S code.

[19:17:57](#sQEV5SDdpuHJHrcLSvFJOzPwYXGRtEyLlWrKQu9lRVA) <gurzgri>:
And no differences between `ref` and `self/ref` uses in `init` and `connect` unless you declare it as local or use it as a set-word! in a `function` body, given that this is part of your question (just guessing because you change between them).

[20:11:37](#KFjAKtn00InxkEk98iws37eKfu8o4wb8ZY_8MS6avrk) <loziniak (Maciej Łoziński)>:
I felt the error is in R/S code, so I'll try it right away. Thanks for clarifying about `self`, because it's also been a while since I coded more in Red. Hopefully, it will be more frequent now! :-)

[20:12:49](#o8EIXR3MiQjKGdAzI8K_xHOw5l9h8iPx6EHiU6LaXq8) <loziniak (Maciej Łoziński)>:
I was changing the code mainly to remove unrelevant parts, that I copied from original code.

## 7-Feb-2025

[0:31:51](#gyph3mqc9HIsVWfa3hqfpBihvLNpf8XIaouQ21ZyaC4) <loziniak (Maciej Łoziński)>:
Hello again! Is this a bug?
```
a: routine [
	return: [integer!]
] [
	integer/box 5
]

print a
```
gives:
```
```

[0:32:48](#vD4vvCRFKtvkWa3OoJ_PlQCTMT0x0jrM9-qkPUhra8k) <loziniak (Maciej Łoziński)>:
* Hello again! Is this a bug?

```
a: routine [
	return: [integer!]
] [
	integer/box 5
]

print a
```
gives:
```
$ ./red-toolchain-15jan25-498cc9db8 -c integer_play.red 

-=== Red Compiler 0.6.5 ===- 

Compiling /mnt/share/prj/maidsafe/sn_ffi/integer_play.red ...
...using libRedRT built on 6-Feb-2025/15:36:25
...compilation time : 26 ms

Target: Linux 

Compiling to native code...
*** Compilation Error: wrong return type in function: exec/a 
*** expected: [integer!], found: [struct! [
        header [integer!] 
        padding [integer!] 
        value [integer!] 
        _pad [integer!]
    ]] 
*** in file: %/mnt/share/prj/maidsafe/sn_ffi/integer_play.red 
*** in function: exec/a
*** at line: 386 
*** near: []
```

[0:43:03](#f1kfz51_8hOWIfTbR6xi3tvdy_SFZ-B_qa__mz9d3xs) <loziniak (Maciej Łoziński)>:
Also:
```
b: routine [
	x [integer!]
] [
	print x/value
]

b 7
```
gives:
```
$ ./red-toolchain-15jan25-498cc9db8 -c integer_play.red 

-=== Red Compiler 0.6.5 ===- 

Compiling /mnt/share/prj/maidsafe/sn_ffi/integer_play.red ...
...using libRedRT built on 6-Feb-2025/15:36:25
...compilation time : 28 ms

Target: Linux 

Compiling to native code...
*** Compilation Error: invalid path value: x/value 
*** in file: %/mnt/share/prj/maidsafe/sn_ffi/integer_play.red 
*** in function: exec/b
*** at line: 1 
*** near: [386x1 
    print x/value
]
```

[7:02:47](#tF7PBZPppt0naY6Cm86zHEnLxpV0nRrd1rCG9qMWc8w) <hiiamboris>:
Try `-r` or `-u`. Also note that `handle/box` is binary in recent builds.

[16:36:35](#Cey5CY7yz7FcagtGdf2lu6VSkhlitfxXNNbJjpdN7bs) <ldci (François Jouen)>:
Why this routine does not work under Windows?

[16:41:11](#RQHXF1fjWgt4KZ2Jk3l8vxUU-icXfSiSgiuLLVYbOJE) <ldci (François Jouen)>:
* `
rcvDTWDistance: routine [ x		[block!] 
y		[block!] dmat	[object!] op		[integer!] /local vec						[red-vector!] xHead yHead	idxx idxy 	[red-value!] headD idxD				[byte-ptr!] p						[float-ptr!] vxi vyi 				[red-integer!] vxf vyf 				[red-float!] dist fvx fvy			[float!] xLength yLength 		[integer!] i j 					[integer!] ][ fvx: 0.0 fvy: 0.0 dist: 0.0 xHead: block/rs-head x yHead: block/rs-head y xLength:  block/rs-length? x yLength:  block/rs-length? y vec: mat/get-data dmat headD: vector/rs-head vec i: 0 while [i < yLength] [ j: 0 while [j < xLength][ idxx: xHead + j idxy: yHead + i idxD: headD + ((i * xLength + j) * 8) switch op [ 0 [ vxi: as red-integer! idxx vyi: as red-integer! idxy fvx: as float! vxi/value fvy: as float! vyi/value	 ] 1 [ vxf: as red-float! idxx vyf: as red-float! idxy fvx: as float! vxf/value fvy: as float! vyf/value] ] dist: (sqrt ((fvx - fvy) * (fvx - fvy))) p: as float-ptr! idxD p/value: dist j: j + 1 ] i: i + 1 ] ]`

[16:45:47](#1aQzYRxNTs7SUD5ppaRH2lgRkLEqJKfSk4aGGTIG4VY) <ldci (François Jouen)>:
* ` rcvDTWDistance: routine [ 
x		[block!]  
y		[block!] 
dmat	[object!] 
op		[integer!] 
/local vec [red-vector!] 
xHead yHead	idxx idxy 	[red-value!] headD idxD				[byte-ptr!] p						[float-ptr!] vxi vyi 				[red-integer!] vxf vyf 				[red-float!] dist fvx fvy			[float!] xLength yLength 		[integer!] i j 					[integer!] 
][ fvx: 0.0 fvy: 0.0 dist: 0.0 
xHead: block/rs-head x yHead: block/rs-head y 
xLength:  block/rs-length? x yLength:  block/rs-length? y 
vec: mat/get-data dmat 
headD: vector/rs-head vec 
i: 0 
while [i < yLength] 
[ j: 0 while [j < xLength]
[ idxx: xHead + j idxy: yHead + i idxD: headD + ((i * xLength + j) * 8) 
switch op [ 
0 [ vxi: as red-integer! idxx vyi: as red-integer! idxy fvx: as float! vxi/value fvy: as float! vyi/value	 ] 
1 [ vxf: as red-float! idxx vyf: as red-float! idxy fvx: as float! vxf/value fvy: as float! vyf/value] ] 
dist: (sqrt ((fvx - fvy) * (fvx - fvy))) p: as float-ptr! idxD p/value: dist j: j + 1 ] i: i + 1 ] ]`

[16:50:38](#W1FVvIUwLayvfTVS5u8nX70aAouGDIu7wT65EgHwPYo) <ldci (François Jouen)>:
In both cases (macOS and Windows) the distance is calculated. With macOS the vector is updated. 



[16:58:12](#DWghET9SiiY1bcemc8081e_W3A0V44p_s-ymzqmHS58) <hiiamboris>:
use `probe` until you find the point of divergence :)

[18:31:50](#rn4V62EkmwLt4Rptadh747WlyDvw9kH0mSpCTSFqJds) <ldci (François Jouen)>:
hiiamboris: Found . Problem was here `idxD: headD + ((i * xLength + j) * 8)`. In fact we must use a series and `GET_UNIT` to get the correct value and then replace 8 with unit value :)

## 22-Sep-2025

[12:22:15](#jC4p9I4wEdOyH5cQ9Z3kOwFIl0fLzKSxSDJoFJ1jaLg) <JiaChen-Zeng (JiaChen ZENG)>:
Is there a way to write Red code inside Red/System? I tried this with no luck

```red
Red/System []

; #include %libRedRT-include.red

print-line "Now in r/s"

#call [
    print ["im" "red"]
]

```

[15:25:19](#GS9GAL8YKZXdZWSspzeJ1-5Dw3Pcw__0SQXcSoze7X4) <hiiamboris>:
Red system executables don't compile in the Red runtime by default.

[15:25:49](#JD2n33Caiu0ErG28iVg5UqtW90_4BvVge-AvS3ix1fQ) <hiiamboris>:
Better you go down to R/S from a Red script.

[15:28:01](#Hc0NMYgQpMKPUnp9yzsAdojvDm14SLjSUSMuYYHNZrg) <hiiamboris>:
If that doesn't work for you, try the search: https://search.lang.red/yacysearch.html?query=Call+red+code+from+Red+system&Enter=&verify=ifexist&contentdom=text&nav=filetype%2Ccollections%2Ctopics%2Chosts%2Clanguage%2Cauthors&startRecord=0&indexof=off&meanCount=5&resource=global&prefermaskfilter=&maximumRecords=30&timezoneOffset=-480

[15:28:50](#P2QMPHxPurx22Hy4Rdru902e6f_8SlVbbPxM_8-pwk8) <hiiamboris>:
* Better you go down to R/S from a Red script. #system [...]

[16:12:26](#cFhDhL6f51qTqW3tsPoMSHH633pZfi3xlBmmDrBmRT8) <ldci (François Jouen)>:
Have a look here: https://github.com/ldci/Red-System/blob/main/doc/Programming_with_Red_System.pdf

## 23-Sep-2025

[3:32:35](#SYwTvoSDW0YHSWGd3QbCjkkmx_LXwsILKqB2irR59PE) <JiaChen-Zeng (JiaChen ZENG)>:
Thanks I think I'll stick to calling r/s from red

[3:45:53](#7NK0Ip_m8zOvV_L5hdOgpyZ6en_Ie2hMEH2IM9WIYQE) <JiaChen-Zeng (JiaChen ZENG)>:
How to declare a struct pointer without value? For example if I want `def` to be only a pointer

```red
abc: declare struct! [
    not-value [integer!]
    value [integer!]
]

abc/not-value: 345
abc/value: 456

print-line abc
print-line abc/not-value
print-line abc/value

def: declare struct! [
    not-value [integer!]
    value [integer!]
]

print-line def
def: abc
print-line def
```

```
0040309C
345
456
004030A8
0040309C
```

[3:52:10](#dQbA9hK3t_jlE7nyXri2PwGj1dDx9Nk5VZzR1gBBHcs) <hiiamboris>:
It's `alias struct! ...`

[3:53:27](#wclUZiPrnMxOHtXUtzirhR8sNCV0VGkdnEuxp_VTH80) <hiiamboris>:
Then every variable you declare as type [def] will be a pointer to a struct.

[3:54:48](#841UgyHtcZzx38fa-q57grsQKL5BjYYK51M3RbpgSCc) <JiaChen-Zeng (JiaChen ZENG)>:
Do you mean like this? This seems to behave the same as my previous code

```red
def!: alias struct! [
    not-value [integer!]
    value [integer!]
]

def: declare def!

print-line def
def: abc
print-line def
```

[4:00:56](#C_4mU-qN__eoQ5jgp-wgEknpN_4Ra1AVQspOgIeJMds) <JiaChen-Zeng (JiaChen ZENG)>:
I'm confused because I couldn't find how to allocate memory in the doc

[4:18:31](#vZrC35d01NcV8Zt_1X1w47oH_tLHEfMGR5p0-OYE0jA) <JiaChen-Zeng (JiaChen ZENG)>:
it seems you can only declare only pointer to struct as function parameters or local variables. In the global context you can't

[4:26:49](#M__DDJTKyri2GfVuYCxCZ2XweZR21n56r8taIMpPk74) <JiaChen-Zeng (JiaChen ZENG)>:
Is my understanding correct

[5:42:28](#SR97-2hskHyDn1j2eImJx-9UCB6PaLoSWZS_mTMRUwA) <hiiamboris>:
```
Red/System []

def!: alias struct! [a [integer!] b [integer!]]
buf:  [42 24]
ptr:  as def! buf
ptr2: ptr
print-wide [ptr2/a ptr2/b lf]        ;) prints 42 24
```

[5:42:58](#7pFhi_h4qY-rnAuwfE0iPofUyDCjsx9bW6dw0bNWlZo) <hiiamboris>:
`ptr` and `ptr2` are pointers to the same `buf` data here

[5:45:23](#U9eQV0hADRuCAA_N26FMuD29Le1m99JcB9nTa3KDbTA) <hiiamboris>:
your `def` is also the same pointer, just as you noticed it already has data it points to

[5:48:33](#cfo8cTl1l6fq_rgRMJVbYao1lhl8TfA_cKXw5I9jL1Q) <hiiamboris>:
to copy the full struct you may use `copy-memory` (memcpy):
```
Red/System []

def!: alias struct! [a [integer!] b [integer!]]
buf:  [42 24]
buf2: [0 0]
ptr:  as def! buf
ptr2: as def! buf2
print-wide [ptr2/a ptr2/b lf]
copy-memory as byte-ptr! ptr2 as byte-ptr! ptr size? def!
print-wide [ptr2/a ptr2/b lf]
```

[6:15:31](#4zTrXKgfHOmngeq7c_19QkPLKoUMvjOHXxQOyYONy74) <JiaChen-Zeng (JiaChen ZENG)>:
Thank you now I understand

[8:02:12](#_op21rJLp3L_LNflk44G6K3RzWbxuPGk460ae93nrTo) <ldci (François Jouen)>:
JiaChen-Zeng (JiaChen ZENG): hiiamboris's code is perfect. You can also find some examples in my GitHub (see testPtr.reds)

[8:08:17](#j9bCK0mImUxiiY3RNkEphlW7iCieOK6-3yvaFvZNL3c) <JiaChen-Zeng (JiaChen ZENG)>:
Hi yes I've read your pdf. It's helpful and contains something the doc doesn't mention

[8:11:27](#u7aQ-efhzkoudqxJgFwwLUFLPymrnwWGY3wBB02OWRo) <JiaChen-Zeng (JiaChen ZENG)>:
I haven't seen other languages that provide API with language stack operation like r/s' `push` `stack/top`. Are these stuff in r/s temporary because the language isn't complete yet? Or are they meant to be included in the feature set?

[8:15:16](#Ro97ng-ZOfz0BQX8V0oavMnJsYIO0sEykRVJEYPGfvQ) <JiaChen-Zeng (JiaChen ZENG)>:
BTW testPtr.reds was pretty confusing to me. For example `p-struct!`'s name is like a type. And I don't understand what the memory is allocated for
```
p-struct!: declare struct! [ptr [union]] ;--memory allocation 
```

[8:22:00](#GuEmtwhZ_VBYM1wy1OzZ4LP0nhEJKlR00ZPTv_VL1qc) <JiaChen-Zeng (JiaChen ZENG)>:
This seems to declare a null pointer, while `null` doesn't work
```
ptr:  as def! 0
; ptr:  as def! null
```

[8:23:31](#T4EHc7HLwSK2EWIIB2_zDmNohCq00oKVeJmzUeRpb_c) <JiaChen-Zeng (JiaChen ZENG)>:
* This seems to declare a null pointer, while `null` doesn't work

```
ptr:  as def! 0
; ptr:  as def! null
```

[8:23:44](#pwjEnY0tSnrIaPVpcrZcjUBOizhh54ffxWP8e8e0Lrk) <JiaChen-Zeng (JiaChen ZENG)>:
* This seems to declare a null pointer, while `null` doesn't work

```
ptr: as def! 0
; ptr: as def! null
; ptr: null
```

[9:20:03](#uNbDaOw6aDiQ9PZ8GUtFOg-hh1wwfnA56NHxyEhVKoQ) <hiiamboris>:
[@dockimbel-556597ad15522ed4b3e10020:gitter.im](https://matrix.to/#/@dockimbel-556597ad15522ed4b3e10020:gitter.im) will have to say, but I believe it's part of the feature set. R/S is a bit lower level than C.

[9:23:07](#qCZNhcxdooUWrvM6L7PP-aUoUs5lKgfpbcy4GSKWU8s) <JiaChen-Zeng (JiaChen ZENG)>:
Can you return a `red-string!` from a `routine`? I know I can pass into it by parameter and modify

```red
Red []

#system [
    c-str: "asd"
    str: string/load c-str length? c-str UTF-8
    string/concatenate-literal str " qwe"
]

get-str: routine [return: [string!]] [str] ; doesn't work
print get-str
```

[10:08:31](#BLscVmauqfq5mAt2nCjFx8eBYlGwBE4wb9uyto4Sndg) <ldci (François Jouen)>:
getString: routine [return: [string!]][
	as red-string! #get 's
]

[10:11:43](#7SfCw6KgsUn4RQMMS_jmZSRyHMO3jeQXdHLWK7p-WQk) <JiaChen-Zeng (JiaChen ZENG)>:
Let me rephrase a bit. Can you return a `red-string!` that's resides in r/s? `#get` is in red

[12:02:29](#YufhdHu7VCGnh6UyR1gmaFrtycF7Uz0An21Hz__7R0c) <JiaChen-Zeng (JiaChen ZENG)>:
I tried this with no luck. Copied from [here](https://github.com/red/red/wiki/%5BDOC%5D-Red-System;-Fran%C3%A7ois-Jouens-'How-to-use-pointers,-strings,-vectors,-call'#red-variables)

```red
get-str: routine [] [as c-string! string/rs-head str] ; doesn't work
print get-str
```

[12:08:49](#i9J7Iv7NfYtqf68LsczQKlBNMywyIjZvN6tKf5RVh00) <JiaChen-Zeng (JiaChen ZENG)>:
Seems it's better to define variables in red not r/s

[12:12:36](#2xET7XWwKCGdCHh7rIj2nMGDTM5kXon-z32LHqdTq7w) <JiaChen-Zeng (JiaChen ZENG)>:
another try
```red
get-str: routine [return: [string!]] [as red-string! stack/set-last as cell! str] ; doesn't work
```

[12:26:28](#VJK58htLky2BqBRDTIcgPb7FgJi03UXlLvPHULliME8) <hiiamboris>:
```
Red []

r: routine [return: [string!] /local s] [
	s: "Hello from R/S"
	string/load s length? s UTF-8
]

probe r 
```

[12:30:43](#pnhTwAv7eR8nzK7SDy1ahWDxHExZ4XiPG1t0kyEkeyQ) <JiaChen-Zeng (JiaChen ZENG)>:
That does work

[12:30:56](#JzCkGRKdACzlxAemeNZ2dF7tgpUCtxCQBPm18EAkkUU) <JiaChen-Zeng (JiaChen ZENG)>:
Don't know what's the difference

[12:33:30](#x7UPr0fDLT6efPw4b5Am-tm56-dS3PWrsN3TCwepVw8) <hiiamboris>:
The key thing to understand is that `c-string!` is an array of bytes. While `red-string!` is a derivation of `cell!` structure (shared by all the other Red values). It needs it's own set of functions to work with (encode/decode, resize, etc) - those in `%runtime/datatypes/string.reds`.

[12:34:20](#D4_59cPtIYz3L8rcRAu8CugF-LUbW7rjsDZxnb6_wF8) <JiaChen-Zeng (JiaChen ZENG)>:
Our difference is that mine is in `#system`

[12:35:51](#1Ytz_cUVM4zC5e2i5AZ2tYl9OvN8ZNX7qT3H6DS0xMk) <hiiamboris>:
`rs-head` returns the pointer to the internal buffer of the `string!` to work with it inside R/S. Not what the `head` native is doing.

[12:37:42](#Ie93QRQYWb6YL1Z6cdkfjz2pL139vXScg9tZl6tVBvo) <JiaChen-Zeng (JiaChen ZENG)>:
I know the difference between `c-string!` and `red-string!`, but it seems not able to detect the identifier is a true variable in `#system`

[12:38:04](#0xOj0rVr519gW-CVq84E5gF0mpXXQ9g8G9gM0eEhSeA) <hiiamboris>:
Tried `#system-global` ?

[12:39:15](#n9lWSeOQFG2iVKjNXfcqsR4xFzRUmBCWvGVq_tkPtXs) <JiaChen-Zeng (JiaChen ZENG)>:
Can I use `string/load` in `#system-global`

[12:39:32](#-kSW0r-L1T4coix0tUTZ8vG2iFPExFJsj8h1LTEZKiQ) <JiaChen-Zeng (JiaChen ZENG)>:
It shows error

[12:39:37](#hGQjNHYXn6ZS-R7-Z8q81kMO2Sjnlu7rPEydhRiCdlw) <hiiamboris>:
If not, try `red/string/load`

[12:40:40](#SKXVDUhLrC__Q80Q6hiY3zrUJLiCAxdYd4xQGfc5bB4) <JiaChen-Zeng (JiaChen ZENG)>:
Still error
```
*** Compilation Error: invalid path value: red/string/load 
*** in file: %***sys-global.reds
*** at line: 1
*** near: ["asd"
    str: red/string/load c-str length? c-str UTF-8
    red/string/concatenate-literal
]
```

[12:41:23](#Mv5Sn6JbOKuQ_zDrKPCXf1-qnwlaVKdnM1rka62sayw) <hiiamboris>:
Let me try it...

[12:41:27](#VX03HwGLyb4PGmsTtYXvvs8DDWt4ZO7Fs6KkEPzqSlo) <JiaChen-Zeng (JiaChen ZENG)>:
I haven't looked into how to use system-global

[12:42:10](#kJl_2bispbf9lQJPO8NoVu-mPs_HjmnOUyI29Q1MwA0) <hiiamboris>:
I don't know, for me this just works:
```
Red []

#system [
	s: "Hello from R/S"
]
r: routine [return: [string!]] [
	string/load s length? s UTF-8
]

probe r
```

[12:43:02](#orLO1tDZ-exxyxZ1TncwMRi1Yc10WXjJqxqkRlg3DcE) <JiaChen-Zeng (JiaChen ZENG)>:
is it a bug? It feels like a bug

[12:43:25](#krydRxR-H0T0s3xJiqjLi8VCzfGkxkvgS6CRFuPomFM) <hiiamboris>:
Show me the code

[12:44:49](#4JRmjS727sucikuHlLX0FqJWLk2EJRHJ57LmctONvXs) <JiaChen-Zeng (JiaChen ZENG)>:
This one

[12:51:37](#SHqf7KZSEKNzTYYUchkGv7idcm6ETC4oL0boaH3N7So) <JiaChen-Zeng (JiaChen ZENG)>:
The function behaves like a function that has no return value

[12:53:07](#QBBmHluG4eIX3zoLueeOkehSu2P-G63elD323d5T3Pc) <hiiamboris>:
It is weird indeed

[12:54:59](#1xrucZURTD73FmkIcfMobOieVpQD2i48wYAbb-Gl_Ds) <JiaChen-Zeng (JiaChen ZENG)>:
The same thing but with `logic!` type this works
```
#system [
    debug?: false
]

get-debug?: routine [return: [logic!]] [debug?]
debug?: get-debug?
```

[12:58:38](#eN3vdue-dJOWZLD0tg_uldOqUNC8vfvxbjv7TMI4jxE) <hiiamboris>:
It is being collected by the GC

[13:07:08](#RxEiNxkoW9QDLhrhODKltaK3PbzakRRgLSwcUPUDOcg) <JiaChen-Zeng (JiaChen ZENG)>:
I see. Maybe putting in red is better

[13:07:24](#WkqkHeVJjT17AagVbrQAZe1ijWjIKnzvAz76ghY0qyQ) <hiiamboris>:
Surely

[13:09:25](#e8o7RumnNjuehGdqR50I9eLnYQXDqUiUbQHWCZ5Qx8I) <JiaChen-Zeng (JiaChen ZENG)>:
`#get` isn't documented so I think it's not recommended? Any better method than `#call` red functions?

[13:11:07](#-yUnVLfz7ewlmh8Edtzd46mhvGV7hVLDzpvcbnzRtOc) <hiiamboris>:
`#get` should be fine

[13:11:58](#KQruRxke2f7JtK1f94dZHx9FOyuD8cTXLoTCx4Tplrc) <hiiamboris>:
Also there's a method to let GC know to avoid collecting your global pointer, but I don't know it.

[13:16:09](#Oq-6rJ19J7UfwCdIvs14gpgM2Q9IRNaLvR2FXV1ENmc) <JiaChen-Zeng (JiaChen ZENG)>:
`#call` seems to have the same problem. prints `?routine?`

```
Red []

str: "from red"

get-str: has [] [str]

#system [
    #call [get-str]
    red-str: as red-string! stack/arguments
]

get-rs-str: routine [] [red-str]

print get-rs-str
```

[13:20:08](#hqrRSGl_LuKW_Dbe6RpY83Z4T5HZuhnFOLMVEmcywrw) <hiiamboris>:
```
Red []

str: "from red"
get-str: has [] [str]
get-rs-str: routine [] [#get str]

print get-rs-str
```

[13:20:15](#NLoO-dZXLFttIolW-sSulG0Ym2SlVCYspeZ-ZgSZ_Eo) <hiiamboris>:
* ```
Red []

str: "from red"
get-str: does [str]
get-rs-str: routine [] [#get str]

print get-rs-str
```

[13:20:33](#FeZ_WIErHrO_mSp4S_WbHg-QnWo0ZbTbgSvt8qTAL3E) <hiiamboris>:
* ```
Red []

str: "from red"
get-rs-str: routine [] [#get str]

print get-rs-str
```

[13:21:18](#Amo21nbhGDDvlujkd-ZS0XkDfsc4WyfrZ9TJdSV5CVU) <hiiamboris>:
Or
```
Red []

str: "from red"
get-str: has [] [str]
get-rs-str: routine [] [#call [get-str]]

print get-rs-str
```

[13:21:25](#L1W6Ivu2hZfmgSLNMmvgcEIXlwXgfx9C1-Ls7dgNb1M) <hiiamboris>:
* Or
```
Red []

str: "from red"
get-str: does [str]
get-rs-str: routine [] [#call [get-str]]

print get-rs-str
```

[13:21:28](#JTQhlXUEeMMxMOyMhevWGKcyCjMVhOU87OJFaZAT7VE) <JiaChen-Zeng (JiaChen ZENG)>:
It's weird to me that the low-level language depends on the higher one

[13:22:01](#r9hgfdJqfc7gHMPuKzLUanKKsXfSxBI4AUz7-jaC8nE) <hiiamboris>:
Not really. But you want to use the runtime of a higher level language.

[13:25:03](#jUTuAZKhlT8j5CwG5AwgXpz935TfBixzgfwdTqcWAS8) <JiaChen-Zeng (JiaChen ZENG)>:
`#call`ing in `routine` also looks good.

## 26-Sep-2025

[14:54:16](#u8ObxLDt7kfdyPqG66iSlZTEPe5WEQQy3PfA6x8FbnE) <JiaChen-Zeng (JiaChen ZENG)>:
Hi, how to make variable size array in r/s?

[14:55:05](#Dj2t-u3tX4N2X929xidsN-mdrHIBuLHZB9Sr7d_gkqU) <JiaChen-Zeng (JiaChen ZENG)>:
I don't know how to use `vector/make-at`

[14:56:13](#q0UE1kgNbrwbLi4x_id8t-r8V2l0O4088rqEVrVDsTI) <hiiamboris>:
As in C, there's no such thing :) `reallocate` it manually if you need a low level array. If you can use one of the Red datatypes, that's an option too.

[14:56:25](#SUmyZ4NvS4i7fOSzw11LjeCw9T4Pkem2Szqwxc5y01g) <JiaChen-Zeng (JiaChen ZENG)>:
Specifically don't know how to pass a `proto!`

[14:57:03](#LBcSBeNca50Ke-Ip5jiA2rv47fIeJho04sKmMFrvndk) <hiiamboris>:
what's a `proto!`?

[14:57:16](#C6Z2Y3oHtWrV1kNrnmDgc3TCPQJUOnRQr5M9KRDay3Y) <hiiamboris>:
ah, it's from `vector/make`

[14:57:53](#oGehDBFTX-nIY9gJwfnV0Q3wOqeDZAZt-JCwDj4U20U) <JiaChen-Zeng (JiaChen ZENG)>:
it's for every red datatype red level API's parameter

[14:58:23](#-zRiFUwNfUOoTGeUtCi4IH9eHWLunw0qq31uFRaQLs0) <JiaChen-Zeng (JiaChen ZENG)>:
Is `reallocate` the equivalent of `malloc`?

[14:59:40](#hT96i-mPzlr_xNDQiI24HR4UUgyIq8jRXSwqGdJru00) <JiaChen-Zeng (JiaChen ZENG)>:
I see every Action! needs a `proto!`

[14:59:55](#l8Jv2e258jv74kSOSjNKVMDfqwaZhugPhlQtwk7mFgI) <hiiamboris>:
> <@jiachen-zeng-5689faec16b6c7089cc1076e:gitter.im> it's for every red datatype red level API's parameter

Yeah I don't know that too :) Better to use `make-at`: `vector/make-at push* 100 TYPE_INTEGER 4` may work

[15:01:05](#eI0uQvaVclfGJOFjscuadlUJHyDe75oqDYovs5YsGKM) <hiiamboris>:
R/S `make` funcs are the equivalent of `make` action in Red, which requires a prototype as first argument. `make proto spec`

[15:01:33](#v7IU2luWfihIzd4dNFlQVEn3TPb5-l4byUqjKNxskQY) <hiiamboris>:
So for R/S calls that's a bit too much trouble to use it.

[15:01:53](#MTPpJB5MetRpzutCUPYGmrhBxH1YEVbKOiefCNYrduQ) <JiaChen-Zeng (JiaChen ZENG)>:
I see I would try

[15:02:08](#E2OrcC9p4Fo2_cBR2vWxPzvgVGMJhHbNvA3chq23LSE) <hiiamboris>:
> <@jiachen-zeng-5689faec16b6c7089cc1076e:gitter.im> Is `reallocate` the equivalent of `malloc`?

of `realloc`

[15:02:34](#pGW3_fMawx6up2U53hA2GqUC0ODZjQlYanqbvMjaW3o) <hiiamboris>:
* of `realloc` https://cplusplus.com/reference/cstdlib/realloc/?kw=realloc

[15:02:57](#Y1J1zYrPu2zvtn02_5bjQZDR_4tXF8s6A03d-VHHWPI) <JiaChen-Zeng (JiaChen ZENG)>:
Ok, not familiar with `realloc` too

[15:03:37](#d8lh808IHcGMmvF1hgFlcnS0S1YeI9immevvnGhBAKk) <hiiamboris>:
What are you trying to do with this array?

[15:04:50](#TO4CWt1ruoVja2uDjYNW4JskJVju0Yxf28Oyv3XTx34) <JiaChen-Zeng (JiaChen ZENG)>:
To create a dictionary whose index could be a 1 byte range integer. Writing literal array would be too long

[15:06:13](#8ankLDr0y31FuyLwkeHDylc9DwYDMe2BoE6LgHghCqc) <JiaChen-Zeng (JiaChen ZENG)>:
in r/s currently there isn't a syntax to create an empty array of specified length

[15:06:29](#g74eMyYpj5UeocsoKldd6EMkpc13VqdbviUPBDBoeEU) <hiiamboris>:
For such short index range, isn't it easier to just have a preallocated 256 pointers?

[15:06:38](#eT0MYp8CIOuH_Y5vgoCdJJHKeZuoHGnbwE-A49uZAG0) <hiiamboris>:
* For such short index range, isn't it easier to just have a preallocated array of 256 pointers?

[15:06:56](#q8Gksbv3WW5Rss_vSb_4Jz9rQD_BVdcqpfy_FsU3Tas) <JiaChen-Zeng (JiaChen ZENG)>:
Yes but the syntax doesn't support

[15:07:14](#6X85qzBUMo804Iy-mPgn4kMXnba-BRzhBMTu4zKwbB4) <JiaChen-Zeng (JiaChen ZENG)>:
I only know I could write `[ null null ... ]`

[15:08:09](#efa06Lf1LSPN8STk6A5edSfLLOKnfHhwfuUaixlE8-k) <hiiamboris>:
> <@jiachen-zeng-5689faec16b6c7089cc1076e:gitter.im> in r/s currently there isn't a syntax to create an empty array of specified length

`array: allocate 256 * size? integer!`

[15:08:30](#GSwKPsdmXnHfmZEPraluWCOVWWpriSbbVAoPa_aY1Lw) <hiiamboris>:
* `array: as int-ptr! allocate 256 * size? integer!`

[15:09:04](#yWF1pc68bkezFG8jFk5RuvNEsXM3XD_UUs5E-n9C2wc) <hiiamboris>:
or `ptr-ptr!` (array of pointers)

[15:10:22](#-wsBW8ZkyUd_DBaizZrKhyXTYW3BX0PSKVRLNg5bWzM) <JiaChen-Zeng (JiaChen ZENG)>:
OK then I don't need to write that long

[15:11:33](#Fipa0GCozZ0DwMs10P8kO7YLqAnUduUgwNlKNYpC96k) <hiiamboris>:
Just note that it's not "empty", it is just memory of given length 256x4. If you need to track it's length, track it separately. `malloc` doesn't initialize the memory, so it'll contain random data.

[15:11:45](#EC6xOf9ftOiyn-bl0yNrhOkZdPUddIwXdwfUSKjtS3U) <JiaChen-Zeng (JiaChen ZENG)>:
I think with rsc2 coming r/s would become more complete? Still seems to have a long way to go though

[15:11:49](#qd4z9u6fqPerj6c1fZFfz-fMpV2MzLFvHwMn54qKegk) <hiiamboris>:
* Just note that it's not "empty", it is just memory of given length 256x4. If you need to track it's length, track it separately. `malloc` doesn't initialize the memory, so it'll contain random data (or I'm not sure, maybe newer libc zeroes it).

[15:12:06](#mv9icSVFmN428_lsWP0vGzizGAauBT4geWjKYr5HFWk) <hiiamboris>:
Don't wait, it's too far away ;)

[15:12:20](#L8mVPuApn5WMuV-iZqNb9JijWGZmZIxOd_6XumVbhYo) <JiaChen-Zeng (JiaChen ZENG)>:
I see. Is there a neat way to init to 0?

[15:12:38](#T_t4zJp8CE2a584CMIOjLkCvdZe8jSd7ooesw4-OkT8) <hiiamboris>:
We had something in the runtime, let me see.

[15:14:45](#SD1zANATZiJRqAnAoQSzJtLm8HZ-_4f0uh1aCWSpor0) <hiiamboris>:
Ah, right. `memset` equivalent: `set-memory as byte-ptr! array  as byte! 0  256 * size? integer!`

[15:15:51](#-EVYNVyIOuWyO7Ywy5hH2bpxTyOlq9J1yUbDPxPSYKE) <JiaChen-Zeng (JiaChen ZENG)>:
It's just the name suggests

[15:16:16](#fQzLJf5Aty9iweFkuWhcxQiSuuHrVTLNk_dVuCQQ3mY) <JiaChen-Zeng (JiaChen ZENG)>:
* It's just what the name suggests

[15:26:17](#r0HrtRRHJDfmEB2NXK3Cki0YbTsCKrFaeIXWf40zX4c) <JiaChen-Zeng (JiaChen ZENG)>:
I feel now r/s is pretty only for "internal development" while red seems to be pretty usable. It's lacking more important features documented or say stablized than I thought. No wonder in the blog they said the current toolchain stayed for too long

[15:27:16](#8wMcyjfaps2UA4MefMCEN9ZO8ZIcYtX8H5IVbaGwAsg) <JiaChen-Zeng (JiaChen ZENG)>:
* I feel now r/s is pretty only for "internal development" while red seems to be pretty usable. It's lacking more important features documented or say stablized than I thought. Now I can understand in the blog why they said the current toolchain stayed for too long

[15:29:32](#-TkC1JQZ3kXEZQKJOQ9teHgJbGGkDedZ7zuq8rb0FqQ) <hiiamboris>:
You only feel so because you're not a C developer :) Current docs are aimed at C devs because it's just not feasible to re-explain all the low level stuff to a newcomer.

[15:30:42](#U-GZ-2z1br78GbNqqAzcEo7uyhj1QSJ7Y2VO8NLOKjg) <hiiamboris>:
I agree, for an introductory reading we only have Francois' pdf, which is way too brief to cover much.

[15:31:57](#dU_eCTzces48sk4qx_x0xSNLg_FE1chy1qqxK7aaGGA) <JiaChen-Zeng (JiaChen ZENG)>:
I do C++ at application level but don't know C

[15:33:52](#Gpz1Op1q-NrfqxEEdsS9hPONnVsnI_q8GFSbFlknT5M) <hiiamboris>:
We'll improve as time permits ;)

[15:34:29](#767sr_umv9PAiE1ksJtUL-0rrQ5hn2poIJpmHDu6heQ) <hiiamboris>:
In the meantime, me and others are here to help

[15:36:31](#VWmtEiyvWuo-8p2G7O9E4zzIOkPZJTx3ZZWg1Tc2fgY) <JiaChen-Zeng (JiaChen ZENG)>:
You are very helpful and I'm able to move forward with enough confidence

[17:06:52](#abq4hi59FNQIO15BoIgYzsRKb5JeyfakgouneQaaatM) <ldci (François Jouen)>:
JiaChen-Zeng (JiaChen ZENG): I'm sorry, but the PDF I wrote five years ago is probably not up to date with the new versions of Red. Please specify what you want to do with Red/S so that I can help you.

## 27-Sep-2025

[0:47:46](#objOAEKPZgmVY1jbRMhj5lieSGFdwDr8pwCdwhyWvCw) <JiaChen-Zeng (JiaChen ZENG)>:
Hi don't worry. I'm doing a programming course with r/s, also with the goal to play a bit with red. Currently doing machine code decode. I would ask when I encounter issues with the language

[2:49:58](#8c-Ofg_6UR2iclMGVn_BiHpCPFnX8r9qpFkv2VqpT_k) <ldci (François Jouen)>:
JiaChen-Zeng (JiaChen ZENG): You should have a look ro Rebol-r3: https://github.com/Oldes/Rebol3

[2:51:04](#d1rP4B_4qoZJyF62HmVmP8tOxO1L7bxgmYormYDJVmY) <JiaChen-Zeng (JiaChen ZENG)>:
Thanks I have downloaded it

[9:15:58](#Zk7yczVGaOaD_j93zEi32_ckuVHyQVbveFb3FU1cR9M) <ldci (François Jouen)>:
JiaChen-Zeng (JiaChen ZENG): You need also Siskin (https://github.com/Siskin-framework/Builder)

[10:11:01](#Z22ARk2bDlyoCnc8v6Up7OrA2-MlazOcYovAPzguKFA) <JiaChen-Zeng (JiaChen ZENG)>:
What is this?

[10:22:15](#Vxb5jlt6nU3XbfS1tPj6foKu-1CiM_urQb6IpMJAs9I) <ldci (François Jouen)>:
JiaChen-Zeng (JiaChen ZENG): with siskin you can compile R3 on different OS (macOs, Windows, Linux, Haiku ...)

## 28-Sep-2025

[17:49:56](#34ftKsaM-QEadL_6jT4FGvtaj-LXDhDTecaqSLnTd5A) <ldci (François Jouen)>:
I'm going to stop developing for Red and Rebol 3. I spent quite a few years writing code for these languages with great pleasure. But they are not evolving: Red is still 32-bit and Rebol 3 does not have a GUI worthy of the name. My blog (https://redlcv.blogspot.com/2017/04/blog-post.html) is hardly ever visited.  My RedCV library (https://github.com/ldci/redCV) doesn't even appear on the Red website. 
It's time for me to stop. I will continue to follow the development of Red and Rebol 3, but I will no longer maintain my code.


[18:56:55](#pklXblDXYkkguBESloU421qSJiy3OWMiIkYvKbsgruY) <GiuseppeChillemi (GiuseppeChillemi)>:
I have written in Rebol3 chat. Here we must have input from Redd developers. I don't know at which point they are with 64Bit and networking

[18:57:06](#asvERSaEvW-VyforajKZ0yN8fSKYsesZ7SD-MOb5zNc) <GiuseppeChillemi (GiuseppeChillemi)>:
* I have written in Rebol3 chat. Here we must have input from Red developers. I don't know at which point they are with 64Bit and networking

[18:57:50](#ponl-Pty1T_dMpFAL8edyooYzgN64mBFkhTvQt2LhuA) <GiuseppeChillemi (GiuseppeChillemi)>:
And yes, this prolonged stop does a bad effect on the willingness to continue

## 29-Sep-2025

[13:21:24](#42Su7ToIe9H0xshmTTz3BXXXR7E_gWS86_fen9ggwqg) <JiaChen-Zeng (JiaChen ZENG)>:
Hi. How to modify a c-string (not returning) passing to my function correctly? 

```red
Red/System []

change-str: func [/local str [c-string!]] [str: "123"]
my-str: "asd"
change-str my-str
print-line my-str

```

[13:27:43](#0GJIrf_9wT3A3hpUbMcCiuGrS6JmRGgIJBGXDE1v5II) <JiaChen-Zeng (JiaChen ZENG)>:
And if I just return a c-string, does it behave like Red in the same way fundamentally? So the string's address doesn't change and it only has one instance, unless in red call `copy`

[13:29:28](#tu5oNQUKUFFz73XmtYb7rItqWexd1k2Cw3lNR_Cc5pg) <hiiamboris>:
you didn't mean to make it `/local` did you? :)

[13:30:45](#mrkrSW1vcufRVo1taPkLiLuVPuHa6ebI8Uw6evvAtxo) <hiiamboris>:
and to change it, you can't just reassign it, you have to copy the memory (`copy-memory dst src len`)

[13:31:13](#BsHfDNiWUONWpsjZ5-5UH0UKjvUc7oJe28qRXVS3INQ) <JiaChen-Zeng (JiaChen ZENG)>:
ah it's not supposed to be local

[13:32:54](#dGR85o_bVv_D26fIyngDKUfRhOP79NDj_9NDgHQ3HZc) <JiaChen-Zeng (JiaChen ZENG)>:
Then the variable as the argument needs to have `len` right?

[13:33:05](#xoaYia2ZoC9RmVCaxO2thEfIat26h6QUm23PsuYL8xk) <JiaChen-Zeng (JiaChen ZENG)>:
* Then the variable as the argument needs to have enough `len` right?

[13:33:25](#wKIsGejnK_w3hNfz8G5EnFW8WSXjO6fdjLWn-25gPaA) <hiiamboris>:
certainly

[13:34:47](#lXilUivvIvk5A8Fr6iq9WkUz_4UZVgD4LvQLZ3lKdxA) <JiaChen-Zeng (JiaChen ZENG)>:
Then I would need to allocate memory manually since string literal can't specify `len`?

[13:35:06](#Tzqk3zHZHGBMFYTWhgtODGZLqOfwQtIuZ4iF3OndWEE) <hiiamboris>:
c-strings are null terminated, so you can check their length using `length? str` (but it has to iterate over all the chars)

[13:35:27](#AYVUbrPxj3GfK_WakcSwHYE5jWjQSobkXKOsGkO4qds) <hiiamboris>:
* c-strings are null-byte-terminated, so you can check their length using `length? str` (but it has to iterate over all the chars)

[13:36:39](#UIZQEkacbOayKWgwg39EjB2zUfUVU53eah9lg117UEo) <hiiamboris>:
when you write `"abc"` in R/S, what's actually stored is `"abc^@"` (last is the null byte)

[13:37:25](#zSoOOLnZkBhQZHkg1ANJrWQurKqni9JKUISPZ9XIggA) <JiaChen-Zeng (JiaChen ZENG)>:
i see. same as c

[13:38:09](#5Zg8kLhBDxestheG7gnoFYUiuOuJKP61zH-RvLB2_R8) <hiiamboris>:
> <@jiachen-zeng-5689faec16b6c7089cc1076e:gitter.im> And if I just return a c-string, does it behave like Red in the same way fundamentally? So the string's address doesn't change and it only has one instance, unless in red call `copy`

yes the address doesn't change and you need to copy it manually, same as like any array

[14:07:54](#lGee8yqMPJMemO9QsGhDW8t3coNcRcL62UzQznKiMW0) <JiaChen-Zeng (JiaChen ZENG)>:
Hi, I'm not sure what syntax is wrong here. It seems r/s compiler converts `byte!` to `red-byte!` automatically but I can't find `red-byte!` anywhere.
```red
extract-bits: routine [
    byte [byte!]
    pos-start [integer!] ; Count from the lower bits. 0 based index.
    len [integer!]
    return: [byte!]
] [
    return byte and (#"^(FF)" >>> (8 - len) << pos-start)
]
```

```
*** Compilation Error: invalid definition for function exec/extract-bits: [
    byte [red-byte!]
    pos-start [integer!]
    len [integer!]
    return: [red-byte!]
]
*** in file: %/D/Projects/Computer%20Enhance/Homeworks/listing_0041_add_sub_cmp_jnz.red
*** at line: 386
*** near: [func [
        byte [red-byte!]
        pos-start [integer!]
        len [integer!]
        return: [red-byte!]
    ] [
        return byte and (#"" >>> (8 - len) << pos-start)
    ]
    stack/mark-native ~set
    word/push ~extract-bits
    routine/push
]
```

[14:09:04](#aFWQYa-Jp4yF6UxYt-LkpcUDhDtqUVp0Ln4iti2URhs) <hiiamboris>:
it just prepends `red-` to everything except a few special cases

[14:09:18](#sEHCBNNSFxTuTQD-hsJxAMJCQXZP1Tg6yHwoMjbJAHo) <hiiamboris>:
there's no `red-byte!` or `byte!` datatype

[14:09:26](#XFPosZBP-wtTBehySXjhnSQWg_TtWuEgsxE4tdMmKO8) <JiaChen-Zeng (JiaChen ZENG)>:
How to accept a byte!?

[14:09:35](#ETB9xBWtTNX6s1OyfLVRxbNKT4pvTaEHmiE9ilppqno) <hiiamboris>:
`integer!`?

[14:09:47](#APz8yJYp15JCU_i4xrz1mAAPk_QViBediwhQ67RXVO8) <JiaChen-Zeng (JiaChen ZENG)>:
I would need a byte

[14:09:59](#bJRBWOPNwEnE0AJ4fUWj1dbtW7h0uHNJBaUPQtpB3qs) <hiiamboris>:
a byte is an integer within 0-255 range

[14:10:28](#ibWOaNDQiPLi9kivAzJauCkXZU3-_g6lWOSWLOCmwvA) <hiiamboris>:
if you need a Unicode codepoint, then thats a bigger range and it has a `char!` datatype

[14:10:45](#U54Hg-5BdKszrBimGce0GdlRWbkwaKP_KtKF7LjOOag) <JiaChen-Zeng (JiaChen ZENG)>:
I know. So currently it doesn't allow to pass a byte!

[14:11:11](#OC-WqrcZ4GmcNkIkZTq7fALGm86mizkukjwri3gDR6I) <hiiamboris>:
a routine interfaces with Red, so no, because there's no such datatype in Red

[14:11:59](#q1s07sbnITV4dCnTmAQKX-mVLUdV29XF8YzqFt-83EM) <JiaChen-Zeng (JiaChen ZENG)>:
I'm writing routine for my routine to call

[14:12:44](#6zSAzJ4A-ckbBZ1nh6ZxeVv7piJjQwAKNM61Eb5uWw0) <JiaChen-Zeng (JiaChen ZENG)>:
Then it has to be put into `#system`

[14:12:50](#Tc1D728nkpM6n-kC3k-8f9xutiX5Wdzed85YOP6ZDcc) <hiiamboris>:
that sounds like a R/S function ;)

## 30-Sep-2025

[14:24:06](#-x--F0WqUykXWTpGz27iOv77LauBWjmQTL3cajKltdk) <JiaChen-Zeng (JiaChen ZENG)>:
```
#if debug? = yes [
	copy-memory: func [ 
```

this was a debug function?

[14:42:10](#OQaaLkW32UQ1voKCZcVWLdUktTN5-5wyoGoa0-yVJtQ) <hiiamboris>:
Maybe an alternative definition?

[14:45:44](#FaldckWlYmuw14ioVuop-3OnUGgT0sr2uXczUrpo_Hk) <JiaChen-Zeng (JiaChen ZENG)>:
Should be 

[14:46:31](#9e8K0IJ5Jr5g9qM2QwVPhXVD4XRDOeyQEj55kjkmny8) <JiaChen-Zeng (JiaChen ZENG)>:
`[pointer! [byte-ptr!]]` this seems to be invalid?

```
    decode-r_m: func [
        byte [byte!]
        pos-start [integer!] ; Count from the lower bits. 0 based index.
        disp [byte-ptr!] ; Pointer at the 1st byte address of displacement
        in-out-cur [pointer! [byte-ptr!]]
        out-r_m [c-string!] ; Need enough size pre-allocated
        /local r_m-len [integer!]
    ] [
        r_m-len: 0
        ; TODO

        r_m-len: r_m-len + 1
        out-r_m/r_m-len: #"^(00)"
    ]
```

```
*** Compilation Error: invalid definition for function exec/decode-r_m: [
    in-out-cur [pointer! [pointer! [byte!]]]
    out-r_m [c-string!]
    /local r_m-len [integer!]
]
```

[15:50:45](#7CTt8MXEPNZ3WDMlrep3VowPa0i2qtHnd4GIIfdwtsU) <hiiamboris>:
it only can be `ptr-ptr!` = `pointer! [pointer!]`

[15:51:10](#bcsuFhL1GWzsWphyUhgoBeZqFhB7Wce8ib4RLh3WKn0) <hiiamboris>:
R/S doesn't nest types as far as C does

## 1-Oct-2025

[12:54:42](#9ZogKvXE_Vsi9iFiDgcS1P9IGx82xGVCCAzaVAATGTg) <JiaChen-Zeng (JiaChen ZENG)>:
Can r/s do this? So modify where a pointer is pointing to

```red
Red/System []

str: "abcdefg"
p: as byte-ptr! str
print-line p/3

pp: ; address of p
; move pointer p forward 1 unit
```

[12:56:43](#oVZwJSxj0Tl0-qBM_iqZuaW0KlcrMXVbcQ1rOFucN8s) <hiiamboris>:
```
pp: :p
p: p + 1
```

[12:57:17](#mHnjfzxorigh6V2p57Lcy3b6lKjtn9h2rb4pwl8g9A8) <hiiamboris>:
or whatever you want `pp` to be, I'm not sure

[12:58:30](#mX31y9QIXtIT37z2zzxNBIdpGORTqKc4PQXKxk9NTy0) <hiiamboris>:
if it's the address of `p` pointer itself then it's `:p`

[12:58:45](#21zBagyPUegq3Yr4Mvm2PPcgHf0IA_EzQk5CX64rc64) <JiaChen-Zeng (JiaChen ZENG)>:
Shouldn't it be like this
```
pp: :p ; address of p
pp: pp/1 + 1 ; move pointer p forward 1 unit
```

[12:59:16](#U1JFhcKWqWK4fWG7F8sC7mzbCQf9E8Xp4hWy4R0mNJM) <JiaChen-Zeng (JiaChen ZENG)>:
* Shouldn't it be like this

```
pp: :p ; address of p
pp/1: pp/1 + 1 ; move pointer p forward 1 unit
```

[12:59:39](#o6F3zYNu8afaDCFGNsYSVc8qa7brQK6BJiUXM5zFCzU) <hiiamboris>:
same, right

[12:59:56](#TT0g-7MnGxp8BuuF13Zd70cugejsAjanVmShB2UoQeE) <JiaChen-Zeng (JiaChen ZENG)>:
Doesn't compile

[13:00:08](#D4RBIuTEQ2-SVav-PTCoJJ30YLQN9_8icri1vMg_D5A) <JiaChen-Zeng (JiaChen ZENG)>:
![](https://gitter.ems.host/_matrix/media/v3/download/gitter.im/642511d72b48d2bf56b43c6974079cb7c3397d321973372354679537664)

[13:00:20](#2o5SWXnkeFI2u84Xnb0cxXeYe5RghX64pIJze8S4US4) <hiiamboris>:
hmm

[13:01:36](#LbWgKnbR4d-viELJ1K5hxXmHVAEpv5VpFHUGwE5_Cls) <JiaChen-Zeng (JiaChen ZENG)>:
the `none!` may come from void* because it's a pointer to pointer

[13:04:38](#6EpEDriVvpmk7AlxRZuKLYgRbJbjtItk2XTujom2b2I) <hiiamboris>:
only this seems to work:
```
pp: as ptr-ptr! :p 
pp/value: as int-ptr! (as byte-ptr! pp/value) + 1
```

[13:04:54](#uphpEWNAYWoftmjg0JO6jzP7qvAHr3SHptitOkkfTZ8) <hiiamboris>:
those look like both design and implementation bugs to me

[13:06:34](#-Ng-q2-og2bF2b3Dw1HZaruYcJxyB1k2QOmC69GP_YY) <JiaChen-Zeng (JiaChen ZENG)>:
That is a lot

[13:06:45](#1-kzgryLOWrT39y-fR-VBZxd5UDcE0ghJkHOulPiN7Y) <JiaChen-Zeng (JiaChen ZENG)>:
Not sure what is the type for each value

[13:06:56](#k5XhmEaE7IeS4N7BM9aLW2SF2RJqSGBobsTomzXYxx4) <hiiamboris>:
* those look like both design and implementation bugs to me (`pp/1` not working, `pp/value` being `int-ptr!`, internal error when `pp` type is not enforced)

[13:11:36](#VOiy-bAdH7ZSc3kBX1ryAxD2O0cOFUlD_yg1Iq9qIN8) <hiiamboris>:
a struct workaround:
```
sptr!: alias struct! [value [c-string!]]
pp: as sptr! :p
pp/value: pp/value + 1
```

[13:11:51](#voSiYy_UI39nYZeF2P2D37INwwbnUzqQuOP_hAK-qjk) <hiiamboris>:
* a struct-based workaround:
```
sptr!: alias struct! [value [c-string!]]
pp: as sptr! :p
pp/value: pp/value + 1
```

[13:15:07](#iZYklvEXGluyI7eyS0tZl6TdKsN68__KanE-HsjbHgQ) <JiaChen-Zeng (JiaChen ZENG)>:
That's much simpler

## 2-Oct-2025

[14:46:45](#jldtssM39NavfH2N0PESBUHApxCBBBeeOqEnctkghyQ) <JiaChen-Zeng (JiaChen ZENG)>:
any sus in syntax?
```
    decode-r_m-t_f-register: func [
        out-asm [string!] op [byte!] p [byte-ptr!]
        return: [logic!]
        /local direction [logic!] width [logic!] mode [byte!]
        byte [byte!] str [c-string!] inc [integer!]
    ] [
```

```
*** Compilation Error: invalid definition for function exec/decode-r_m-t_f-register: [
    out-asm [string!] op [byte!] p [pointer! [byte!]]
    return: [logic!]
    /local direction [logic!] width [logic!] mode [byte!]
    byte [byte!] str [c-string!] inc [integer!]
]
```

[15:03:51](#Xdx6rhYK9-H8PqrVSerNYcz_Gb5CtWY5a7q2-ZgeLag) <JiaChen-Zeng (JiaChen ZENG)>:
ok i found it. `out-asm [string!]` should be `out-asm [red-string!]`

## 4-Oct-2025

[7:13:41](#aZ3S61xirUGZ-yWFKP0-gtGMZCUsAd-e2Hefgo5FADE) <JiaChen-Zeng (JiaChen ZENG)>:
Is this a known bug?

```
Red/System []

castb: func [pos [integer!] return: [logic!]] [return as-logic (#"^(01)" << pos)]
; b: as-integer (as-logic (#"^(01)" << 3)) ; Compiler internal error

b2: castb 3
print-line as-integer b2 ; 4206600 - Wrong

b3: as-logic (#"^(01)" << 3)
print-line as-integer b3 ; 1 - Correct

```

[7:36:50](#QtOABSxbxuLfitZDOfG5FBOcsWm_JFJ-l3wN2Tglxkk) <JiaChen-Zeng (JiaChen ZENG)>:
Removing the `return` fixes the issue. What is `return` for?

[7:45:59](#GzSi2DcgCsXJoqd_0VgsNfEY-UjeQxozTT8nGlbIu6o) <hiiamboris>:
I don't believe I've seen this reported

[7:46:38](#iJqOiBdDrwFFfXC7cuGf8vGiTBQp-Wmx613vI1k6Duo) <hiiamboris>:
Anyway, report any internal compiler errors. It will form a set suite for whenever a new compiler gets rolled out

[7:48:00](#KR6p4TFzuWlMOegy1eG-hwig6BZWYxKWEDfqcSzQ7CQ) <JiaChen-Zeng (JiaChen ZENG)>:
Do think better to also report that pointer of pointer issue?

[7:48:56](#Exvl1gajZFmSPBg4MZOswTDlem1fmuW-rnvu2F4oFOw) <hiiamboris>:
Definitely

[15:00:11](#MuF0ZihsFH9nF6ACi8-IV9RxirzoruyL46ffwOz8ibY) <JiaChen-Zeng (JiaChen ZENG)>:
Is it not possible to change function pointer?

```
Red/System []

funcn!: alias function! []

func1: func [] [print-line "1"]
func2: func [] [print-line "2"]
func3: func [] [print-line "3"]

pfunc: as funcn! :func1
pfunc

funcs: [:func1 :func2 :func2]

; pfunc: as funcn! funcs/2 ; Compilation Error: attempt to redefine existing function name: pfunc 
; pfunc

pfunc2: as funcn! funcs/2
pfunc2

```

[15:14:25](#8qGnkuyw4gL1rk9_qUoT8KZrYHLm6MdWAveddJRv8fU) <JiaChen-Zeng (JiaChen ZENG)>:
* Is it not possible to change function pointer? Also how to set a function array?

```
Red/System []

funcn!: alias function! []

func1: func [] [print-line "1"]
func2: func [] [print-line "2"]
func3: func [] [print-line "3"]

pfunc: as funcn! :func1
pfunc

funcs: [:func1 :func2 :func3]

; Compilation Error: attempt to redefine existing function name: pfunc 
; pfunc: as funcn! funcs/2 
; pfunc

pfunc2: as funcn! funcs/2
pfunc2

; Compilation Error: type mismatch on setting path: funcs2/1 
; *** expected: [integer!]
; ***    found: [function! []]
funcs2: [null null null]
funcs2/1: as funcn! :func1

```

[15:14:57](#HprDkLWC-kghq-xP7r6RvW5JmUVooaLEnDuOowJ7TUI) <JiaChen-Zeng (JiaChen ZENG)>:
* Is it not possible to change function pointer? Also more importantly how to set a function array?

```
Red/System []

funcn!: alias function! []

func1: func [] [print-line "1"]
func2: func [] [print-line "2"]
func3: func [] [print-line "3"]

pfunc: as funcn! :func1
pfunc

funcs: [:func1 :func2 :func3]

; Compilation Error: attempt to redefine existing function name: pfunc 
; pfunc: as funcn! funcs/2 
; pfunc

pfunc2: as funcn! funcs/2
pfunc2

; Compilation Error: type mismatch on setting path: funcs2/1 
; *** expected: [integer!]
; ***    found: [function! []]
funcs2: [null null null]
funcs2/1: as funcn! :func1

```

[15:54:30](#J2CUKlPtdDbeaIlZBgGuUQC8OX8JSOhRuF93BPO6uEc) <hiiamboris>:
tried different name than `pfunc`?

[16:13:28](#g7Fq0gOW114hy8Qk90aTgYvNSDF7xk3HXX7EJuZBo3g) <hiiamboris>:
```
funcs: [:func1 :func2 :func3]
f: as funcn! funcs/2
f
```

[16:13:49](#NEFEjs7zWToxcItsUB3U32JiUWUSrSskyGxC3mB7QrE) <hiiamboris>:
this works for me

## 5-Oct-2025

[0:05:08](#fBsGX28dwzvnrP-3vN0rJx1A7uWYusM-PJ7XVVp0-Vg) <JiaChen-Zeng (JiaChen ZENG)>:
The problem is I want to change the pointer, not setting the pointer
```
*** Compilation Error: attempt to redefine existing function name: f 
*** in file: %/D/Projects/Computer%20Enhance/Experiments/020_function-ptr.reds
*** at line: 18
*** near: [
    f: as funcn! funcs/2
    f
]
```

[0:11:22](#q0bh920YastCCoo9PO3QAScgGvtb_MR4TheTVGfuB1o) <JiaChen-Zeng (JiaChen ZENG)>:
Any possibility to set a function array? Need to do something like huffman coding

[2:00:41](#KGetJda2Zkab-uIVDijMCmbfD904x0uHxdf83T6K2sM) <qtxie>:
JiaChen-Zeng (JiaChen ZENG): You can do it inside a function.
```
Red/System []

funcn!: alias function! []

func1: func [] [print-line "1"]
func2: func [] [print-line "2"]
func3: func [] [print-line "3"]
func4: func [] [print-line "4"]

funcs: [:func1 :func2 :func3]

test: func [
	/local
		f
][
	f: as funcn! funcs/2
	f
	f: as funcn! funcs/1
	f

	funcs/1: as integer! :func4
	f: as funcn! funcs/1
	f
]

test
```

[2:00:42](#_Oho4gAEZWTXGeFog69UtNcM4XsJoBBNneHsMY-7JPE) <qtxie>:
* JiaChen-Zeng (JiaChen ZENG): You can do it inside a function.

```
Red/System []

funcn!: alias function! []

func1: func [] [print-line "1"]
func2: func [] [print-line "2"]
func3: func [] [print-line "3"]
func4: func [] [print-line "4"]

funcs: [:func1 :func2 :func3]

test: func [/local f][
	f: as funcn! funcs/2
	f
	f: as funcn! funcs/1
	f

	funcs/1: as integer! :func4
	f: as funcn! funcs/1
	f
]

test
```

[2:22:54](#1bEqA6u6Fl7WCJi5heG1Npxr_HrSIcwFFDn__e9yyG0) <qtxie>:
`pp/1` get the first element of the pointer, in this case it's a byte. For moving pointer forward 1, you need to write `pp: pp + 1`.

[2:31:29](#cxUM_mY4X5HEwjQuuzmSM-7DJo1Ef8GZ2p1ntdVrydY) <qtxie>:
Yes. It's a bug. I created a ticket for it: https://github.com/red/red/issues/5650

[2:32:34](#9SPpIeOdujfPs-CXnrW182YqUI2xyn2ZIAE2EXXaN1s) <JiaChen-Zeng (JiaChen ZENG)>:
Thank you I got it

[2:35:55](#6xDwWQu8BObtg3-SnD2LgUMlG36eNhElpDCQr81Bmgo) <JiaChen-Zeng (JiaChen ZENG)>:
I wanted to modify the pointer of the pointer, not move the pointer forward

[2:37:02](#nmM7p0Q50kawmmcVtW7o6R_rx7JsvAQFAnhJhqM4Dks) <JiaChen-Zeng (JiaChen ZENG)>:
* I wanted to modify the pointer address of another pointer, not modify this pointer

[2:57:49](#Kp-7A3ZHE6P85sUiYMbWFRLV8Fc0C9oS83H59rZGev0) <JiaChen-Zeng (JiaChen ZENG)>:
So in main function I have a byte-ptr! and I passed it into another function. Inside that function I want to change the pointer and reflect back to the main function

[3:02:33](#Xhvr4c8Txg5tKNdl1hwzHskcMtR3KUcQycUjXdNUL3E) <qtxie>:
Ok. Then use a struct! as hiiamboris mentioned above.

[3:07:08](#BnoZRv21RsHKJdf1Lsv2JbNnn3AyqXJRXbyoLH-fhqs) <JiaChen-Zeng (JiaChen ZENG)>:
Is it because r/s currently still doesn't have like pointer operations fully implemented? Or the syntax is designed like this?

[3:12:46](#xaHqs1DeuCqcghR6nxOmHYtO_fXUAIZ3Jo28jY6d3vI) <qtxie>:
I think it's not fully implemented as it does support pointer operations for some datatypes, e.g. get pointer of an integer!.

[3:14:07](#ao0VkxePrqOmzClebSrvGs5JqbByMEEf_fkX5bFuq2g) <JiaChen-Zeng (JiaChen ZENG)>:
I see

[3:15:47](#qjZBqga73Tv7dHJ2EabHbUFjQEm3G33fzOGTagHqetM) <qtxie>:
There is a `ptr-ptr!` defined in the runtime, it's a pointer to an int-ptr!. You can define a pointer to a byte-ptr! as well.
https://github.com/red/red/blob/master/system/runtime/common.reds#L53

[3:16:29](#6rAqYCfaQQSqkP4AeSEGRldUdXYTYMsdZKvjNDlogu8) <qtxie>:
* There is a `ptr-ptr!` defined in the runtime, it's a pointer to an int-ptr!. You can define a pointer to a byte-ptr! as well in your own code.
https://github.com/red/red/blob/master/system/runtime/common.reds#L53

[3:28:57](#wfvM6JJn7Dlv24u7anbcXpQ9xN_TVUXBpwOTVpUSTK8) <JiaChen-Zeng (JiaChen ZENG)>:
How to declare a block with length specified? For function pointers
```
funcs2: [null null null ...]
```

[3:30:01](#eS-Va1-EPajugIHufaXKf15HNi_CclUR7VEvWFsIruc) <JiaChen-Zeng (JiaChen ZENG)>:
* How to declare a block with length specified like 256 long? For function pointers

```
funcs2: [null null null ...]
```

[4:02:33](#RhIUznG5HZduEE9hkL9iR2acTGR31CGcTGvYNy0rwrE) <qtxie>:
No simple way. You can use allocate. 
func-table: as ptr-ptr! allocate 256 * size? int-ptr!

[4:04:43](#KqDs4K1NH4nIgqLX5j-V8kU_s32uJyyrNhHUj-CBAg0) <JiaChen-Zeng (JiaChen ZENG)>:
With this, is func-table/1 an `integer!` type or `byte!` type?

[5:11:52](#dumi5cic8Ys1bVrq7Qh_AKKoqwmA5x2JULUYziljPGQ) <qtxie>:
`func-table/1` is invalid as it's not a real pointer! datatype, it's a struct!. You need to use `func-table/value`.

[5:11:56](#KXRR0Y6Riw_LEpw1V04bWaIAcZDHyIJmm-mEDuJ4wTg) <qtxie>:
```
Red/System []

funcn!: alias function! []
func1: func [] [print-line "1"]
func2: func [] [print-line "2"]
func3: func [] [print-line "3"]
func4: func [] [print-line "4"]

func-table: as ptr-ptr! allocate 256 * size? int-ptr!

set-func-ptr: func [idx [integer!] ptr [int-ptr!] /local p [ptr-ptr!]][
	p: func-table + idx
	p/value: ptr
]

set-func-ptr 0 as int-ptr! :func1

get-func-ptr: func [idx [integer!] return: [int-ptr!] /local p [ptr-ptr!]][
	p: func-table + idx
	p/value
]

f: as funcn! get-func-ptr 0
f
```

[5:12:30](#3ryqmbRIeU2QihErmAc_MMsC85_GOgvQoUem3D4QaCQ) <qtxie>:
* ```
Red/System []

funcn!: alias function! []
func1: func [] [print-line "1"]

func-table: as ptr-ptr! allocate 256 * size? int-ptr!

set-func-ptr: func [idx [integer!] ptr [int-ptr!] /local p [ptr-ptr!]][
	p: func-table + idx
	p/value: ptr
]

set-func-ptr 0 as int-ptr! :func1

get-func-ptr: func [idx [integer!] return: [int-ptr!] /local p [ptr-ptr!]][
	p: func-table + idx
	p/value
]

f: as funcn! get-func-ptr 0
f
```

[5:14:16](#Tr_xXFVfykSrPALv4wvylp2R1iy9v9BRMlAEIMEOnR8) <qtxie>:
Note that those get/set functions are 0-based instead of 1-based.

[5:27:00](#7jFMy7n2VdYt4V_C9gp_b1A-m84QJhhzbWIPuy8R3BU) <JiaChen-Zeng (JiaChen ZENG)>:
I see it was ptr-ptr! so move in int size

[5:29:40](#HexeitQAWq1O_Mc0n3nVXx-HiCg1s8tLQHzQUJngfvU) <JiaChen-Zeng (JiaChen ZENG)>:
But I thought pointer arithmetic was in byte size? Shouldn't it be like this?

```
;p: func-table + idx
p: func-table + (idx * 4)
```

[5:29:57](#G7rPqeNvyQSbbO3Is97S-xUIp9QxUWCWrKypxUPsHYc) <qtxie>:
Move in `int-ptr!` size, not int size. In 32 bits backend, they are the same, both 4-bytes. Once we have 64 bits backend, `int-ptr!` will be 8-bytes.

[5:30:22](#e7lMPZJ_LcH5L7Sy1ynpvLrHz3Rg7b41ETFcanwwM5w) <qtxie>:
* Move in `int-ptr!` size, not int size. In 32 bits backend, they are the same, both 4-bytes. Once we have 64 bits backend,  size of `int-ptr!` will be 8-bytes.

[5:30:28](#D74dgUpG_nWsgjiA5eidwxdcH2xBjiaf5oJ9MgwR2RU) <JiaChen-Zeng (JiaChen ZENG)>:
Maybe I'm mixing up things

[5:32:07](#3iD6FfYo_09Z7-mhpvVdJtrAsbLljnKEucCmNqTcJcg) <JiaChen-Zeng (JiaChen ZENG)>:
Ok distance between 2 pointers it's in byte. Otherwise it's in the pointer's value size

[5:35:38](#qxHTgujZfpnum-b5eYK6ejOxu_YgJH3nORnaIB84qIA) <qtxie>:
Yep. Not the same as C which always in pointer's value size.

[12:44:09](#H0vTVHKziQ571awzIaFOnOzWdPCeDK26tgWWAsnfAJM) <JiaChen-Zeng (JiaChen ZENG)>:
This [causes compiler internal error ](https://github.com/red/red/issues/5651) currently. Any workaround?

```
receive-n: func [[typed] count [integer!] list [typed-value!]] []
receive-n [[1]]
```

[12:47:15](#1vwoLOwKoUHbYkWu0JDYbumta-KJKTwtns3t4ttv88o) <hiiamboris>:
there's no array of arrays

[12:47:20](#FDvm-K2PhA74HBJFumkA0c81M3BDVp99qdFsQE_s8xI) <JiaChen-Zeng (JiaChen ZENG)>:
Was going to do something like this
```
register-decode-func [
        :decode-mem-to-acc #"^(FF)"
        :decode-r_m-t_f-register [#"^(01)" #"^(02)" #"^(03)"]
    ]
```

[12:47:37](#hTOv5hplcWA9iGz4oP6fFJpZjn7qf9tbPuDQUVzZ07U) <JiaChen-Zeng (JiaChen ZENG)>:
* Was going to do something like this

```
register-decode-func [
    :decode-mem-to-acc #"^(FF)"
    :decode-r_m-t_f-register [#"^(01)" #"^(02)" #"^(03)"]
]
```

[12:47:39](#LJmQBwPky_MS8DXRW4ZpqC8O81PWDbV0-fptg6xuvSA) <hiiamboris>:
ah, it's variadic

[12:48:03](#CNsAZU0zuCl8Um1d_P_8ngZrP52W9GfrLv7s30K2fzs) <hiiamboris>:
```
a: [1]
receive-n [a]
```
this works

[12:50:12](#xb3JAehC0neX8nI4tItnMEzdPyKxVPHCdq-RadHLG9M) <JiaChen-Zeng (JiaChen ZENG)>:
```
    conf: [
        :decode-mem-to-acc #"^(FF)"
        :decode-r_m-t_f-register [#"^(01)" #"^(02)" #"^(03)"]
    ]
    register-decode-func conf
```

another kind of internal error

```
Compiling to native code...
*** Red/System Compiler Internal Error: Script Error : get-function-spec expected name argument of type: word 
*** Where: get-type
*** Near:  [case [
find [set-word! set-path!] type?/word value/1 [none-type]
value/1 = 'not [get-type value/2]
all [subroutines type: select subroutines value/1] [type/2]
'op = second get-function-spec value/1 [
either base-type? type: get-return-type/check value/1 [
type
] [
get-type value/2
]
]
'else [get-return-type/check value/1]
]]
```

[12:52:20](#GdaDtvyaYnKqjhJ3fVOQhmPwS8QzKvCVU9gPv-Y91A0) <hiiamboris>:
this is enough to trigger it: `a: [1 [1]]`

[12:52:38](#uNXi-oaHDEv-KYRrnj7rpTxl3H8X9fe5ZkSFizeWno4) <hiiamboris>:
report it please

[12:53:17](#d9sKSh4pAdv5r1yJcKFgR2WyktVeDtdvwHBhirqVId0) <JiaChen-Zeng (JiaChen ZENG)>:
```
aaa: [#"^(01)" #"^(02)" #"^(03)"]
    conf: [
        :decode-mem-to-acc #"^(FF)"
        :decode-r_m-t_f-register :aaa
    ]
    register-decode-func conf
```

another kind

```
*** Red/System Compiler Internal Error: Script Error : append expected series argument of type: series port 
*** Where: store-global
*** Near:  [append spec/4 index? tail data-buf]
```

[12:54:00](#XRqp5-hTLSwhUfzAbO0Jv5S_id5ZugAzb7E3SLgfvPM) <JiaChen-Zeng (JiaChen ZENG)>:
maybe we only have a pretty basic implementation for passing block currently

[12:54:42](#b5qBjaX48EMHcqNHchGpu6laI9ZSn6gG7mwL_NiWvXs) <hiiamboris>:
better to group them then, since it's all related to unsupported array types

## 6-Oct-2025

[11:50:07](#2JKczzAehAu4ZBE36q7_Ku4qj0eDOSHzg9gUmmrqhjE) <JiaChen-Zeng (JiaChen ZENG)>:
Hi. Is this expected?

```
Red/System []

decode-funcs: as ptr-ptr! allocate 100

b: #"^(00)"
t: decode-funcs + 1
t/value: null ; ok

t: decode-funcs + as-integer b
t/value: null ; Runtime Error 1: access violation
```

[11:53:59](#YQcecDZpozcmcjLpyOaM7Ph6tP0fVvVHBLq3mMymiiI) <JiaChen-Zeng (JiaChen ZENG)>:
* Hi. Is this expected? Any way to fix it?

```
Red/System []

decode-funcs: as ptr-ptr! allocate 100

t: decode-funcs + 0
t/value: null ; ok

b: #"^(00)"
t: decode-funcs + as-integer b
t/value: null ; Runtime Error 1: access violation
```

[11:55:45](#0YhP_HOmRaI8vYInxrv44yt8kBRDJdpQDBjLm3Xqvvc) <JiaChen-Zeng (JiaChen ZENG)>:
* Hi. Is this expected? Any way to fix it?

```
Red/System []

decode-funcs: as ptr-ptr! allocate 100

t: decode-funcs + 0
t/value: null ; ok

b: #"^(00)"
t: decode-funcs + (as-integer b)
t/value: null ; Runtime Error 1: access violation
```

[11:58:09](#aXhi2OR8kEwtoy0iHVVX5iwrTuFXD2bAN7uKxZDthOg) <JiaChen-Zeng (JiaChen ZENG)>:
* Hi. Does this look like a bug

```
Red/System []

decode-funcs: as ptr-ptr! allocate 100

t: decode-funcs + 0
t/value: null ; ok

b: #"^(00)"
i: as-integer b
t: decode-funcs + i
t/value: null ; ok

t: decode-funcs + (as-integer b)
t/value: null ; Runtime Error 1: access violation
```

[12:01:51](#GJnwtZXN9_XwfWucLBV_sa4UQ7K_TOJQGBnQ13lWRJc) <JiaChen-Zeng (JiaChen ZENG)>:
* Hi. Does this look like a bug

```
Red/System []

decode-funcs: as ptr-ptr! allocate 100

t: decode-funcs + 0
t/value: null ; ok

b: #"^(00)"
i: as-integer b
t: decode-funcs + i
t/value: null ; ok

t: decode-funcs + (as-integer #"^(00)") ; ok
t/value: null

t: decode-funcs + (as-integer b)
t/value: null ; Runtime Error 1: access violation
```

[12:51:23](#AwCxtgcaBJu2bCjQ2nwvZxeMij4IXxibDXD1tn6d4XE) <hiiamboris>:
definitely

[12:51:59](#n0vM2ixPiOSwDkXfmy7QOKNXscmuCKZA0JdWRiIInVw) <hiiamboris>:
```
Red/System []

decode-funcs: as ptr-ptr! allocate 100
?? decode-funcs

t: decode-funcs + (as-integer #"^(00)") ; ok
?? t
t/value: null

b: #"^(00)"
t: decode-funcs + (as-integer b)
?? t
t/value: null 
```
```
decode-funcs: 03011588
t: 03011588
t: 0F056988    ;) ?????

*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/red/1.reds
*** at line: 13
***
***   --Frame-- --Code--  --Call--
***   00C1FF74h 0040114Ah <external>
***   00C1FF84h 75EC7BA9h <external>
***   00C1FFDCh 7766C3ABh <external>
***   00C1FFECh 7766C32Fh <external>
```

[12:54:22](#2xPhx5tztaO3leooiUTLqys728rNkUU6xoEPuG6g_d4) <JiaChen-Zeng (JiaChen ZENG)>:
How to see the frame and so on?

[12:54:51](#p3rNBbZQzSypXT33iP3_Uk7IUyKoWhgiSqKZc-ysujM) <hiiamboris>:
`-d` flag

[12:55:03](#nYz-1ll29lxxly76UgS6-Sf559DNBQMqEI-IK6saQsg) <JiaChen-Zeng (JiaChen ZENG)>:
ok

