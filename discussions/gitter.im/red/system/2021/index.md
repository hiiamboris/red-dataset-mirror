# Archived messages from: [gitter.im/red/red/system](/gitter.im/red/red/system/) from year: 2021

## Monday 4th January, 2021

DVL333

[21:51](#msg5ff38ddcaa6bb528c38f03a6)Is there a way to convert Red code to R/S code? I mean, you have a file with Red code and you want a file with R/S code.

greggirwin

[22:10](#msg5ff39242acd1e516f8d2fab4)Red compiles to R/S, but they are different languages with different type systems (for example). If you want to convert code, to optimize it, there's no translator for that today.

DVL333

[22:15](#msg5ff3937aacd1e516f8d2fe7b)ok, see you. Thanks Gregg.

hiiamboris

[22:15](#msg5ff3939d63fe03449639fec0)Try `red -c -v 3 script.red >output.reds`

[22:21](#msg5ff394d193af5216fc80d519)that's just looking under the sheets though, won't help optimize anything ;)

DVL333

[22:46](#msg5ff39ab64eba353cdf1a7f46)@hiiamboris Thanks!

## Thursday 14th January, 2021

bubnenkoff

[19:04](#msg600095b3d5f4bf2965e7dc0e)

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

hiiamboris

[19:13](#msg600097e3dc2e4809aa217af1)try moving `return:` to before /local

bubnenkoff

[19:19](#msg6000993a14cec811ec9b261a)

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

[19:48](#msg60009ff581c55b09c70a724d)Can r/s can be placed inside `.red` file?

hiiamboris

[19:49](#msg6000a04cd5f4bf2965e7fcbf)Extension is ignored

greggirwin

[20:13](#msg6000a5dd252c0a6ded0e4f6b)But if you have only R/S in a file, using %.reds makes that clear and helps people.

## Friday 15th January, 2021

bubnenkoff

[06:32](#msg6001370003529b296bef73f6)I can compile code above only if it's placed in main (app.red(s)) file. If I am placing it in another file and than do:  
`#include %foo.reds` I am getting compilation error:

```
Compilation Error: undefined symbol: _pid
```

## Tuesday 2nd February, 2021

bubnenkoff

[12:30](#msg601945d3a0246860dc27b94c)I need to send message to Red process (actually simple ping it to trigger function). I have read docs about WinAPI and found function `PostThreadMessage`. How to handle it's from Red? Or maybe there is any better ways?

hiiamboris

[14:43](#msg601964fda0246860dc2812c5)same as you handle GetCurrentProcessId

[14:44](#msg6019653ba0246860dc281357)if Red supports this event, it will handle it

[14:45](#msg6019658455359c58bf188965)simplest way of communication though would be reading and writing a file

[14:51](#msg6019670f428d9727dd4dea50)&gt; Compilation Error: undefined symbol: \_pid

Can't reproduce

bubnenkoff

[17:38](#msg60198dfe9fa6765ef8f318b0)&gt; &gt; Compilation Error: undefined symbol: \_pid  
&gt;  
&gt; Can't reproduce  
&gt;

Sorry I forgot to mention that `-e` flag is needed .Try to compile with `-c -e` to get the errror

hiiamboris

[18:29](#msg601999fbae4b9b27c19543aa)Ah. Makes sense. `-e` replaces `#include` with `do` so we should expect that

[18:30](#msg60199a3124cd6b60d813bd48)Please file an issue. Though this is how it currently works, it also raises important design questions.

## Wednesday 3th February, 2021

bubnenkoff

[07:12](#msg601a4cca063b6c68d53666d6)@hiiamboris done. but with `do` impossible to use R/S code `Internal Error: contains Red/System code which requires compilation`

[08:57](#msg601a655d063b6c68d536a73c)@hiiamboris could you help me with wrapping WinAPI? According docs https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-getmessage I did this:

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

hiiamboris

[09:36](#msg601a6eb04f7d1b68e52a165b)there is no `pointer!` type in R/S

[09:37](#msg601a6ec9428d9727dd50aeeb)there is `pointer! [integer!]` (or `int-ptr!`) and alikes

bubnenkoff

[11:15](#msg601a85ed32e01b4f717053fc)@hiiamboris Could you look at my code please. Now it's compile but or I am sending message wrong or there is should be some additional logic to handle it:

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

hiiamboris

[11:31](#msg601a89815500a97f82e2a8ae)I don't even know what you're \*trying* to do.

[11:32](#msg601a89d34f7d1b68e52a5cc5)The problem I see is that Red has it's own event function (aka WndProc), and it's calling GetMessage on it's own. It'll be a race: your GetMessage against Red's one.

bubnenkoff

[11:32](#msg601a89d955359c58bf1b9fcd)I am tying to send message from other process to Red with calling `SendMessage` and accept it in Red with `GetMessage`

hiiamboris

[11:33](#msg601a8a1ba0246860dc2b17b7)Gimme the bigger picture. You're doing this for what?

bubnenkoff

[11:36](#msg601a8aa39238c531ad1fadec)I am running processing of data with Red app. Every app on start sending own PID to monitoring service. I want to be able "ping" red app every n minutes to call function that will send some app metrics like: "I am not hanging I am working"

hiiamboris

[11:37](#msg601a8ae49238c531ad1fae4e)I see.

[11:37](#msg601a8b0c9238c531ad1fae7e)Let me think..

[11:40](#msg601a8baa9fa6765ef8f5af22)Try sending \[this message](https://docs.microsoft.com/en-us/windows/win32/winmsg/wm-gettext) from your service. If I understand correctly, Red will handle it for you, you should not need any code in your Red apps.

[11:40](#msg601a8bc4063b6c68d5370927)If Red app doesn't answer, it probably hang.

greggirwin

[19:32](#msg601afa519238c531ad20f0a8)@bubnenkoff It sounds like very coarse timed IPC. For this I've often used files as the mechanism in the past. You can write status files from each process and the monitor just reads them. You can do more than just I'm Alive then as well. What is it processing, how far along, etc. I've also done it with direct TCP, IOS link messages in that env, and 0MQ. Oh, and DDE in the oooooold days. Once we have FFI at the Red level, I will \*probably* port my 0MQ lib. In any case, files are an easy and flexible solution.

## Thursday 8th April, 2021

loziniak

[12:06](#msg606ef1bea2ac0d38e7a2d1c2)Hello. If I return pointer to data from \*\*imported\** C function, is there a possibility to \*\*deallocate the memory\** on Red side, for example by Garbage Collector? Perhaps it can be done on Red/System level? I know I can implement cleaning the memory on the C side, by providing a accompanying function, but I'd like to avoid it.

## Friday 9th April, 2021

hiiamboris

[11:52](#msg60703ffad7953918614951ef)`free` function in R/S is imported from libc

## Sunday 25th April, 2021

loziniak

[00:18](#msg6084b54cb9e6de24d656d40e)Hi! I don't understand one thing.

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

[00:22](#msg6084b663a2ac0d38e7d82a10)does something in this code look suspicious to anybody?

hiiamboris

[07:23](#msg608518f3ae90f36840a0eb79)try `return: [any-type!]` and `SET_RETURN(buffer)` in the end

[07:28](#msg60851a19969f8b38ee9cd7e4)or `as red-string! SET_RETURN(buffer)`

[07:43](#msg60851da181866c680c44e316)it inserts type/box to turn R/S type into Red type

[07:43](#msg60851db555d78266a666f26d)but there's no way to box something into a red-string

[07:44](#msg60851dc0ae90f36840a0f60c)so you're on your own

## Monday 26th April, 2021

loziniak

[09:22](#msg6086866f55d78266a66a1462)`string/load` calls `stack/push` so I thought `buffer` already is on top of stack. Anyway, \*SET\_RETURN* fixed my problem. Thanks!

[09:29](#msg6086881455d78266a66a1820)It's interesting, that \[it worked earlier](https://github.com/loziniak/sn\_ffi/blob/ce7ddc7995da563a44a8f1b71bc6cfd0961b958f/sn-ffi.red). Perhaps it was only thanks to it being the only routine called? (no `safe_default` then)

[09:30](#msg6086883d969f8b38eea00686)Do you think I also need `SET_RETURN` in `safe_default` routine, and it's only a matter of time when it turns out to be broken without it?

9214

[09:47](#msg60868c1fdc24646812e479b8)@loziniak the result of the evaluation is passed at the bottom of the stack frame, not at the top: this is what `SET_RETURN` macro essentially does for you. Note that `08B78C40` is the same address that `ref`, the first argument being passed to routine (at the bottom of the stack frame), has.

Your earlier code worked simply because `string!` slot, pushed by `string/load`, was already in the right place (since `xorurl-base` routine has 0 arguments and the evaluation stack was empty).

loziniak

[10:19](#msg608693a8b6a4714a29e9a8d4)Is there any info online on Red stack mechanics?

[10:30](#msg6086962e46a93d4a19ecb2f5)Thanks a lot anyway! :-)

hiiamboris

[14:21](#msg6086cc78ae90f36840a4c3e4)Only the source code (:

## Tuesday 29th June, 2021

gltewalt

[01:08](#msg60da72958a40b1172833a30e)`radio` button doesn't toggle in GTK.  
Because this fails on my system:

https://github.com/red/red/blob/2ecb7d67f301f328093626f752325696abab3e54/modules/view/backends/gtk3/events.reds#L1029

[01:09](#msg60da72e0457e19611a247918)Related enough to #4247 that I started commenting.

[01:12](#msg60da736ebef0c66d9d2cf124)I don't see why it fails. Yet.

greggirwin

[02:40](#msg60da8812bcb3e8060eed4f80)Thanks for digging in @gltewalt. :+1:

## Saturday 17th July, 2021

guaracy

[12:34](#msg60f2ce64f1274d5e5053566e)ROT-13 in Red and 880 bytes after compiled? Why not? Suggestions are welcome.

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

[13:23](#msg60f2d9be0853e41c0d61c22c)to compile:

```
red -c --no-runtime rot13.reds
```

hiiamboris

[14:13](#msg60f2e56d049a0c3e537b250b):clap:

greggirwin

[17:30](#msg60f313d3ec10653d5a46ddf9)Nice!

[17:33](#msg60f31470d2556414f56d04f2)@guaracy feel free to add to https://github.com/red/community/tree/master/red-system

## Thursday 22nd July, 2021

munael

[21:03](#msg60f9dd1a7331d202b5c5bb3a)Hi o/  
Where can I find info on FFI from Red programs into C libraries? Closest thing are the full library interface impls like (https://github.com/red/code/tree/master/Library/OpenGL) but those are too much for an intro. Couldn't find anything in the docs (except about LibRed).

## Friday 23th July, 2021

greggirwin

[01:04](#msg60fa15a058232d5ab4dd32c8)https://static.red-lang.org/red-system-specs.html#section-15

## Thursday 9th September, 2021

cjglo

[01:34](#msg6139649f7cd57813a8b5413c)anyone have any issue getting that simple-io-minimal.reds file (inside code/Library) to run on linux? Apparently O\_CREAT is undefined, yet on windows it works fine

hiiamboris

[08:10](#msg6139c176fd7409696e002233)perhaps some refactoring took that constant away? I think you should report it here: https://github.com/red/code/issues

## Saturday 9th October, 2021

digitalbeat

[14:17](#msg6161a46a38377967f4418d50)Apologies if this is a dumb question but I have been trying to read and understand or find an example of how to read command line arguments (if any) from a Red program? It appears that this would be a Red/System (function?) but then I haven't been able to find out HOW to use a Red/System function from within a Red program. Any have an example?

[14:18](#msg6161a4b13f09d8573603aff4) To elaborate this works and compiles but how do I do the equivalent in Red? : Red/System \[]  
print \["count: " system/args-count lf]  
args: system/args-list  
c: 1  
until [  
print \[c ": " args/item lf]  
c: c + 1  
args: args + 1  
args/item = null  
]

[14:25](#msg6161a6498c019f0d0b260e76)This (for example) Fails:  
Red \[]  
text: "Abc is not cbA"  
print text  
args: system/args-list

greggirwin

[17:24](#msg6161d06429ddcd029312ba54)Not a dumb question at all.

```
print ["system/options/args:" mold system/options/args]
print ["system/script/args:" mold system/script/args]
```

digitalbeat

[18:56](#msg6161e5d4d78911028acc9a7c)@greggirwin THANK YOU! Maybe my Google search foo is way-off but I could not find anything like your answer (which works)! I was trying to create a tiny ham radio callsign lookup utility as a test in (relearning) REBOL/RED and was completely stumped by how to read the command line parameter(s).

greggirwin

[20:33](#msg6161fc9bd3ae402e473c38a5)The Rebol Core Guide is a great resource, though not 100% accurate for Red, in cases where our ref docs don't cover something.

[20:34](#msg6161fcc429ddcd0293131d2a)That's an important one to note though. Anyone know if we have that in a readme or wiki page?

## Sunday 10th October, 2021

hiiamboris

[08:38](#msg6162a69529ddcd02931467b9)@digitalbeat if you need smth more advanced: https://gitlab.com/hiiamboris/red-cli/

[08:41](#msg6162a741a41fd20699d5b0d3)@greggirwin http://www.rebol.com/docs/core23/rebolcore-5.html#section-3

[08:42](#msg6162a7757db1e3753e316a90)`/args` are mentioned there

greggirwin

[09:30](#msg6162b29ffb3dcd4e881b1a58)I should have thought to mention your CLI @hiiamboris. :^\\

## Monday 6th December, 2021

ldci

[08:35](#msg61adcb54197fa95a1cab2e8b)Hi, I'm playing with syscall under macOS, but I get error.

[08:35](#msg61adcb5dabdd6644e3c197cb)`Compiling to native code... *** Red/System Compiler Internal Error: Script Error : Invalid path value: symbols *** Where: build *** Near: [emit-page-aligned out rejoin job/sections/symbols/2]`

[09:07](#msg61add2e78853d3164031f3a3)Code tested with Linux Mint 32-bit: perfectly works. So the problem is specific to macOS, probably to 64-bit calls.

hiiamboris

[19:37](#msg61ae666f76e3791755238e74)create an issue
