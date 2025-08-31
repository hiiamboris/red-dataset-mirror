# Archived messages from: [gitter.im/red/bugs](/gitter.im/red/bugs/) from year: 2021

## Friday 1st January, 2021

dsunanda

[22:14](#msg5fef9ec12084ee4b788690ca)Weird stuff with system/words (issue found when trying to LOAD a script which may or may not have been COMPRESSED)

```
attempt [load compress "hello"]
*** Access Error: invalid UTF-8 encoding: #{8B000000}

; the ATTEMPT was not trapped, and now system/words is partially inaccessible:

system/words
*** Access Error: invalid UTF-8 encoding: #{8B000000}

recycle
system/words
== make object! [...]
```

Tested on Windows 24-Dec.

hiiamboris

[22:16](#msg5fef9f41e7f693041f458452)worth a ticket

## Saturday 2nd January, 2021

dsunanda

[00:01](#msg5fefb7d82084ee4b7886c8c6)@hiiamboris Thanks - I did not know if it was known or not. New issue #4790

GiuseppeChillemi

[23:56](#msg5ff1082de7f693041f48aa2d)Still can't `read http://www.repubblica.it` and similar with latest Red, I get a `read timeout`. It should be connected to the Italian language of the page, any hint to debug it?

## Sunday 3th January, 2021

gltewalt

[01:04](#msg5ff11829ac9d8e7463e85a92)I get `invalid UTF-8 encoding`

[01:17](#msg5ff11b0e4eba353cdf145fbc)It should be utf8 though

Maybe an issue I've forgotten about. I'm on linux now.

[01:18](#msg5ff11b6e93af5216fc7ac557)Works with `read/lines` though

[01:20](#msg5ff11bf197312f4b6b05e0bb)I take it back. It worked one time with `read/lines`, it times out now.

```
>> read/lines https://www.repubblica.it
== ["<!DOCTYPE html>" {<html class="no-js" lang="it">} " <head>" "  <meta chars...
```

[01:25](#msg5ff11d02c746c6431cf0308e)SSL issue

greggirwin

[02:08](#msg5ff1270563fe03449634177d)It works for me here.

gltewalt

[02:31](#msg5ff12c9597312f4b6b0601b5)Every time?

greggirwin

[03:15](#msg5ff136ccc746c6431cf06818)Yup. About 10 times so far. Just tried again.

[03:18](#msg5ff13795e7f693041f490ee1)Both with and without `/lines`.

GiuseppeChillemi

[03:21](#msg5ff1381f93af5216fc7b01a6)You have to try with other domains like www.virgilio.it or www.ilmessaggero.it .

[03:22](#msg5ff1385bdbb17f28c5b636ac)Or other DOMAINS, until we found the exact rule

gltewalt

[03:34](#msg5ff13b524eba353cdf14a059)Those work with `read/lines`, but error with `read`. `Access Error: invalid UTF-8 encoding`

GiuseppeChillemi

[10:45](#msg5ff1a051aa6bb528c38a09ee)No luck for me, even with `read/lines`:

```
>> x: read/lines http://www.ilmessaggero.it
*** Access Error: cannot connect: http://www.ilmessaggero.it reason: timeout
*** Where: read
*** Stack:
```

[11:06](#msg5ff1a52e63fe034496351a09)I have opened a ticket: https://github.com/red/red/issues/4791

litew

[11:22](#msg5ff1a8e5ac9d8e7463e9881e)hmm, works for me:

```
>> x: read/lines http://www.ilmessaggero.it
== [" <!doctype html>" {<html lang="it">} "<head>" {<meta http-equiv="content-language"...

>> about
Red 0.6.4 for Linux built 25-Dec-2020/10:51:48
```

toomasv

[12:58](#msg5ff1bf71de608143155cd745)Works here too.

GiuseppeChillemi

[14:17](#msg5ff1d1e94eba353cdf15e418)We have different results connecting from different countries and system languages.

[14:28](#msg5ff1d48a63fe034496358a5f)I have just tried the lastest release of 24th of December, same result.

## Saturday 9th January, 2021

toomasv

[11:34](#msg5ff994c6252c0a6dedfc9951)I didn't find if it is known, that misformed literal string cannot be ended in console:

```
>> %{}%%
{    }%
{    }%
{
```

hiiamboris

[12:37](#msg5ff9a3a303529b296bdc6e9f)I don't remember such issue

[12:38](#msg5ff9a3b814cec811ec89bbe3)but reminds me of https://github.com/red/red/issues/4744

toomasv

[14:01](#msg5ff9b7305562a61e9a958a00)Thanks, https://github.com/red/red/issues/4796

## Monday 11st January, 2021

gltewalt

[19:42](#msg5ffcaa14787d8f79c8f692ab)Am I wrong that `cd` is wrong in using get-word?

[19:42](#msg5ffcaa26fb85d46e04d6a39f)

```
change-dir: func [
    "Changes the active directory path" 
    dir [file! word! path!] {New active directory of relative path to the new one}
][
    unless exists? dir: normalize-dir dir [cause-error 'access 'cannot-open [dir]] 
    system/options/path: dir
]
>> source cd
cd: func [
    "Changes the active directory path" 
    :dir [file! word! path!] {New active directory of relative path to the new one}
][
    change-dir :dir
]
```

[19:43](#msg5ffcaa51cd31da3d9aa72cce)`cd request-dir` will not work, but `change-dir request-dir` of cource will

rebolek

[19:44](#msg5ffcaab281c55b09c70029bb)`cd` is a shortcut for use in terminal

gltewalt

[20:09](#msg5ffcb06581c55b09c7003973)What's the reason for using `:dir`?

[20:12](#msg5ffcb11f252c0a6ded0403ba)Or the benefit

rebolek

[20:16](#msg5ffcb2085562a61e9a9c8552)So you can write for example `cd ..` and not get `.. has no value` error

gltewalt

[20:20](#msg5ffcb32281c55b09c7003fea)ah, of course... (braindead)

greggirwin

[20:25](#msg5ffcb4374498e01bbf9fc584)Which is nice for being a portable shell, but we should encourage people to use `file!` syntax. e.g. `cd %..`. The more we think in terms of Red values, the more power we can leverage.

gltewalt

[20:27](#msg5ffcb4badc2e4809aa17525e)`my-cd: func ['dir][change-dir dir]` also works for `cd ..` or `cd %..`

rebolek

[20:41](#msg5ffcb802fb85d46e04d6caca)I believe that in Red `:word` and `'word` in func specs are interchangeable.

greggirwin

[20:59](#msg5ffcbc2003529b296be3ccc9)https://github.com/red/red/wiki/%5BDOC%5D-Guru-Meditations#literal-arguments-and-get-arguments

[21:00](#msg5ffcbc5414cec811ec91282c)https://github.com/red/red/issues/1850

gltewalt:matrix.org

[21:44](#msg5ffcc6c291e9b71badcdd936)I made a quick assumption that cd was an alias, it blew a finger off

## Wednesday 13th January, 2021

raxod502

[06:17](#msg5ffe905d99549911fc1b934f)Hey all. I'm getting an SSL configuration error on the Red website:

```
% curl -fsSL https://static.red-lang.org                                        
curl: (35) error:1408F10B:SSL routines:ssl3_get_record:wrong version number
```

Chrome reports "static.redlang.org sent an invalid response" on the iframe at https://www.red-lang.org/p/download.html. Is this a known issue?

[06:20](#msg5ffe91309632f63d8713b072)HTTP traffic continues to work but I'd prefer to use HTTPS, if possible. I recall that it previously was working some months ago.

litew

[08:41](#msg5ffeb228cd31da3d9aac5eef)@raxod502 Hello! Seems like SSLv3 negotiation is not offered by google server on which static.red-lang.org is placed:

```
SSLv2      not offered (OK)
 SSLv3      not offered (OK)
 TLS 1      offered
 TLS 1.1    offered                              
 TLS 1.2    offered (OK)
```

Which OS do you use?

Oldes

[09:35](#msg5ffebefd14cec811ec963ade)\[SSLv3 is derecated since 2015](https://ma.ttias.be/rfc-7568-ssl-3-0-is-now-officially-deprecated/#:~:text=The%20IETF%20has%20taken%20an,SSL%203.0%20is%20now%20deprecated.&amp;text=The%20Secure%20Sockets%20Layer%20version,that%20SSLv3%20not%20be%20used.)

[10:28](#msg5ffecb5c99549911fc1c2e35)@raxod502 try to use `openssl s_client -connect static.red-lang.org:443 -status` to see what protocol is used on your system.  
And `curl --version` to validate, that your libcurl is not too old.

raxod502

[15:37](#msg5fff13c6d5f4bf2965e3ec4e)@litew @Oldes This is Ubuntu 20.10 in Docker

```
curl 7.68.0 (x86_64-pc-linux-gnu) libcurl/7.68.0 OpenSSL/1.1.1f zlib/1.2.11 brotli/1.0.9 libidn2/2.3.0 libpsl/0.21.0 (+libidn2/2.3.0) libssh/0.9.3/openssl/zlib nghttp2/1.41.0 librtmp/2.3
Release-Date: 2020-01-08
Protocols: dict file ftp ftps gopher http https imap imaps ldap ldaps pop3 pop3s rtmp rtsp scp sftp smb smbs smtp smtps telnet tftp 
Features: AsynchDNS brotli GSS-API HTTP2 HTTPS-proxy IDN IPv6 Kerberos Largefile libz NTLM NTLM_WB PSL SPNEGO SSL TLS-SRP UnixSockets
```

```
% openssl s_client -connect static.red-lang.org:443 -status
CONNECTED(00000003)
140166965028160:error:1408F10B:SSL routines:ssl3_get_record:wrong version number:../ssl/record/ssl3_record.c:331:
---
no peer certificate available
---
No client certificate CA names sent
---
SSL handshake has read 5 bytes and written 320 bytes
Verification: OK
---
New, (NONE), Cipher is (NONE)
Secure Renegotiation IS NOT supported
Compression: NONE
Expansion: NONE
No ALPN negotiated
Early data was not sent
Verify return code: 0 (ok)
---
```

Oldes

[15:42](#msg5fff14d04498e01bbfa5e982)hm... I don't know... you have both tools newer than I have... but it definitely is problem on your side.

raxod502

[15:42](#msg5fff14d914cec811ec972061)You can reproduce the issue by trying to curl from `docker run -it --rm ubuntu:groovy`

[15:42](#msg5fff14f79632f63d871509ce)This seems to imply that the problem is not with my system configuration

Oldes

[15:43](#msg5fff1523fe007479e40c8a6a)I guess it's problem with the docker configuration... but I'm not docker user... maybe someone else can tell you.

[15:44](#msg5fff1564fb85d46e04dcd5a2)Maybe using \[some google-fu](https://community.letsencrypt.org/t/solved-30810293761408f10b-ssl-routineswrong-version-number-ssl-record-ssl3-record-c-332/98244)

litew

[15:53](#msg5fff176efe007479e40c8f31)@raxod502 i've installed this ubuntu:groovy image with podman and run curl inside of it: https://ghostbin.co/paste/mugxp

raxod502

[16:05](#msg5fff1a3fdc2e4809aa1d7c84)That confuses me greatly. Apparently, a fundamental assumption that I made about Docker was not correct, sorry about that. I will investigate to see what could be wrong.

greggirwin

[17:58](#msg5fff34cbd5f4bf2965e44586)@raxod502 let us know what you find out. We can add a note to help others.

Thanks for assisting @Oldes and @litew!

endo64

[18:46](#msg5fff40105562a61e9aa30949)I got 404 `not here` on https://static.red-lang.org/ page.

Oldes

[20:26](#msg5fff57939632f63d8715c15d)That is ok... as it's used just for tests. (it's shorter to write than `https://static.red-lang.org/dl/win/red-064.exe` and result is same)

## Thursday 14th January, 2021

zwortex

[12:44](#msg60003cc0d5f4bf2965e6e144)Hi everybody, happy new year to all and thanks for your support that is much appreciated to rookie red programmer like me.

I dug a bit further in View and when comparing rebol vs red, I tried the following code from Rebol

```
squares: make image! 2x2
squares/1: red
squares/2: green
poke squares 3 blue
poke squares 4 yellow
view layout [ image squares 100x100 ]
```

It shows a rather nice, though no perfect, checkered canvas, in Rebol2. The same in Red is not that nice (using Windows 10 x64).

[13:09](#msg60004274fe007479e40f8cb6)Another one :

The following recursive call provokes a crash of the console on windows 64:

```
a: make object! [
    s: copy []
    empty?: function [return: [logic!]] [
       return empty? s
    ]
]
a/empty?
```

There are a couple of issues related :  
#4323 : crash on stack overflow  
#4559 : crash on recursive print  
#1858 : crash occurred on recursive call without an exit condition

The #1858 looks fairly close. Shall I had a comment to that one to provide another use case ?

rebolek

[13:48](#msg60004bc781c55b09c7097594)@zwortex hi, what version of Red are you using? So called "stable" or latest build?

zwortex

[13:53](#msg60004ccb99549911fc202429)@rebolek, latest build (i.e. yesterday)

rebolek

[13:55](#msg60004d51fe007479e40fac3b)OK. I tried on Linux and can't reproduce it, so it must be Windows related. Are you using GUI console?

zwortex

[13:58](#msg60004e10e578cf1e95e9bfaf)Gui console, regular console, regular console with view alike.

rebolek

[14:00](#msg60004e794498e01bbfa9159b)Interesting. I got stack overflow error as expected but no crash.

zwortex

[14:02](#msg60004ee481c55b09c7098300)something wrong with my console compilation or environment ?

hiiamboris

[14:23](#msg600053d1dc2e4809aa20af5f)crashes for me on W10

[14:24](#msg60005405cd31da3d9ab0a056)but since #4323 was never fixed, it's expected

[14:24](#msg600054294498e01bbfa9258c)2x2 image upscaling works as expected too

zwortex

[15:31](#msg600063c581c55b09c709bf33)hi @hiiamboris, thanks for your replies. Ok for 2x2 image. What about the crash case : shall I add it as a comment to #4323 or #1858 ?

hiiamboris

[15:36](#msg60006506fb85d46e04e04424)What would your contribution be? There is an infinity of snippets that will trigger this bug.

[15:37](#msg60006521fb85d46e04e044b5)Don't bother ;)

zwortex

[15:43](#msg6000668ffb85d46e04e049ed)no problem

[15:46](#msg6000677303529b296bed5469)I have encountered also an issue with on-deep-change\*. I have seen there is ongoing issue. Don't know if this one is known.

When on-deep-change* is defined even with a wrong signature, there is no warning triggered.

```
;; No warning when too little arguments (i.e. misuse on-change* signature)
obj: make object! [
    a: "Obj"
    s: copy []
   on-deep-change*: function [word old new][
        print ["Hello:"]
        print "Word" probe word ; word is owner
   ]
]
append obj/s 1

;; No warning either when too many arguments ...
obj: make object! [
    a: "Obj"
    s: copy []
    on-deep-change*: function [owner word target action new index part one-too-many][
        print ["Hello:"]
        print "Owner" probe owner
        print "Word" probe word
        print "One too many" probe one-too-many
   ]
]
append obj/s 1
```

hiiamboris

[15:50](#msg6000682891e9b71badd7414b)now that is a good catch

[15:50](#msg600068319632f63d8718779a)please report it

zwortex

[16:16](#msg60006e7a99549911fc208b91)I have added #4798

[16:19](#msg60006f2f787d8f79c8004c1c)I have this one as well in my basket.

An error thrown from an event handler is trapped silently and the event is sent a second time.

In my opinion, the error should appear and the event should not be resent (at least not to the same interested party).

view/no-wait [  
f: field "a" 100x20 react [  
print \["Push" n/data]  
face/text: rejoin \[ pad " " to-integer n/data "a" ]  
]  
n: text hidden data 0  
c: check "Check it for error and double push"  
button "Push-me" [  
n/data: n/data + 1  
if c/data \[ 1 / 0 ]  
]  
b: button "Bye" \[ unview ]  
do \[ the-f: f the-n: n the-b: b ]  
]

hiiamboris

[16:37](#msg600073549632f63d87189cd3)this is known

zwortex

[16:49](#msg6000760c5562a61e9aa62aa1)ok

[17:18](#msg60007ced91e9b71badd77e19)While using compress, I found it strange that compress would accept string!, and decompress only return binary!. Strange also to find out that binary and string equal, though even more strange that they strictly equal. Is it intended or known ? Cheers.

```
a: "foo"
ca: compress a
dca: decompress ca
probe dca ; #{666F6F} and not "foo"
print to-string dca ; there it is
equal? dca a ; strange !
strict-equal? dca a ; stranger !
```

hiiamboris

[17:41](#msg600082535562a61e9aa64cea)Haha that's a funny bug

[17:41](#msg6000825791e9b71badd78bae)

```
>> a == dca
== false
>> dca == a
== true
```

[17:41](#msg6000825e252c0a6ded0de921)Please report it as well

[17:43](#msg600082bbe578cf1e95ea5f25)essentially,

```
>> (to #{} "foo") == "foo"
== true
>> "foo" == to #{} "foo"
== false
```

zwortex

[17:54](#msg60008557252c0a6ded0df2ab)Ok

greggirwin

[18:07](#msg60008859787d8f79c8009be4)For `on-deep-change` I commented and closed the ticket before seeing the chat here. @hiiamboris are there other cases where this kind of thing is caught, or how would Red do that without significant changes (or checking the arity of the callback func before calling it every time)?

[18:09](#msg600088d9dc2e4809aa214fcb)For the `one-too-many` case, I'd have to look at the calls to `on-deep-change` to see why it gets `none` rather than `unset`, which would trigger an error.

hiiamboris

[18:15](#msg60008a35e578cf1e95ea794a)Can't say without digging this. But I think that function's arity is known (and fixed) at the time of function creation, and even cached by the interpreter. So I think there should be a way.

greggirwin

[18:29](#msg60008d80dc2e4809aa215b4b)Interesting. It looks like `function/calc-arity` is used when objects are made. But you could replace the callback func, so it would still have to check every time.

```
obj: make object! [
    a: "Obj"
    s: copy []
    on-deep-change*: function [owner word target action new index part][
        print "Old"
    ]
    new-on-deep-change*: function [owner word target action new index part one-too-many][
        print "New"
    ]
]
append obj/s 1
obj/on-deep-change*: :obj/new-on-deep-change*
append obj/s 2
```

[18:34](#msg60008ecd81c55b09c70a421b)And while we can change how this works for standard objects and the ownership/change model baked into Red, any other user-defined system would have to define its own check system.

It's another design choice on protection versus consistency and flexibility.

hiiamboris

[18:47](#msg600091be9632f63d87190031)OTOH if we do enforce it, someone would ask to enforce also View events arity, parse and lexer callbacks arity.

zwortex

[18:53](#msg6000931899549911fc20febc)For the binary string comparaison, created #4799

[19:01](#msg600095235562a61e9aa6838f)@greggirwin, for the #4798, I don't see why it should not be enforced (at least at creation time) : it is a callback red system relies upon. Even the meaning of the argument are those intended by the caller, not the callee, that can just rename the arguments if he wish so. Anyway it is nice to notify the developper that he made a mistake, just swaping two arguments. But even so, let's say a new version of Red comes up that change the signature of the callback for whatever reason - would be even nicer to notify people relying on it that they need to check their code. The worst being the extra argument that is accepted. It looked as if the stack frame boundaries be not checked. If it is not the case, I am happy.

[19:08](#msg600096aefb85d46e04e0d979)I have got a situation that looks similar to the issue #4549. A use case where `return or exit not in function` is thrown in the event handler of a view.

Here is the error :

```
*** Throw Error: return or exit not in function
*** Where: return
*** Stack: do-file run view do-events do-actor do-safe error? on-expression-update as-string rejoin empty? compute _compute-rec _compute-rec _compute-rec _compute-rec
```

The error is thrown from a recursive call (\_compute-rec) and it appears or disappears if you change one line of code in that function. With the line written like this \*\*return \_compute-rec node/child\** the problem appears, if rewritten like this : \*\*return (\_compute-rec node/child)\*\*, it disappears.

I can provide for the full script and the sequence to reproduce the error. I cannot provide better however as any attempt I've made to extract the issue made it disappear. Tell me if it worth investigating further ? As for myself, I rewrote the code so I don't get the problem anymore anyway.

hiiamboris

[19:12](#msg6000978efb85d46e04e0dbe0)If you can, upload your code to gist.github.com and link to from the #4549 ticket, so we will at least test it after we develop a fix.

zwortex

[19:35](#msg60009d0d14cec811ec9b30e4)ok I'll try and see how to do that and let you know.

greggirwin

[20:06](#msg6000a43ee578cf1e95eac3e9)@zwortex @hiiamboris for `on-deep-change` here are some thoughts:  
\- 7 parameters is a lot to begin with, so writing the func spec manually is not a great idea.  
\- The ownership system \*is* expected to change, so now it a good time to think about how to improve it. With luck we'll avoid breaking changes or a secondary system later.  
\- If callbacks are treated strictly, that's less idiomatically Red, but this crosses the R/S boundary so it's a gray area.  
\- @hiiamboris I remember some of the many experiments you've done (e.g. `try` reboot and recent VID layout work and some reactivity stuff as well), but I don't remember if you tackled ownership yet. If so, point us to it.  
\- Nenad needs to weigh in on this, so we can't go too far down this road without knowing we're headed in at least a reasonable direction for his goals and other private work he may have done.  
\- Design questions like this are interesting, because we want the language to help us as much as possible, but sometimes knowing there's danger in an area makes you more aware and careful. That puts more burden on the user, but there are also cases where you can get a false sense of security (in the real world too, not just languages), which can be just as dangerous.

That said, arity aside, type checking is something a user can do today, which will catch some issues. e.g.

```
on-deep-change*: func [
	owner  [object!]
	word   [word!]
	target [series!]
	action [word!]
	new    [any-type!]
	index  [integer!]
	part   [integer!]
][...]
```

It won't catch swapping like types (`word/action` or `index/part`), and `new` is a wildcard as well, but this comes for free right now.

I think this is also a great impetus for someone to start a Red linter experiment. Any volunteers?

hiiamboris

[20:09](#msg6000a502d5f4bf2965e809dc)Type checking won't work because R/S does not check value type before inserting it into the stack.

greggirwin

[20:12](#msg6000a5b3dc2e4809aa21a6aa)Ah, curses. :^\\

hiiamboris

[20:13](#msg6000a5d803529b296bee0baa)On ownership, apart from https://github.com/red/REP/issues/92, I didn't do anything, as I'm also clueless to what Nenad's plans are. I do have some notes in https://github.com/red/red/issues/4524 though.

greggirwin

[20:14](#msg6000a62c5562a61e9aa6b42b)I will ping him. I remember the recent REP now, thanks.

zwortex

[22:37](#msg6000c7badc2e4809aa220a0b)@hiiamboris for the error "return or exit not in function", I uploaded a simplified version of my script at the following url : https://gist.github.com/zwortex/56b0d90befb1b01e189c1aa044b4a2ce  
Instructions for reproducing the problem are detailed in the script header. Let me know if it falls into a possible #4549 use case, in which case I will link it there. Cheers.

hiiamboris

[22:59](#msg6000cceb03529b296bee7423)doesnt run

## Friday 15th January, 2021

pekr

[07:05](#msg60013ed2d5f4bf2965e98326)@greggirwin reading many of @hiiamboris tickets, it seems to me, that there is many areas of improvement proposed. Really a good work. I was especially surprised, that his fixes / proposals showed, that Red's reactivity, is not all that ideal and could be streamlined / sped-up.

hiiamboris

[09:24](#msg60015f4881c55b09c70c61ca)thanks @pekr (:

zwortex

[10:18](#msg60016c0381c55b09c70c8061)@hiiamboris, sorry I forgot a dependency. I've modified the script but you may as well just set cls and run again :  
cls: 0

hiiamboris

[11:15](#msg6001796099549911fc233e06)I can reproduce the error, and `(expr)` vs `expr` tells me that it's a bug indeed, so worth a mention there

zwortex

[12:50](#msg60018f9414cec811ec9d9a8b)

hiiamboris

[12:53](#msg6001902e91e9b71badda4a8d)thanks

zwortex

[16:06](#msg6001bd9814cec811ec9e1cfc)true: false or string!: integer! provoke immediate crash. For such crash, how do you get information.

[16:45](#msg6001c6b25562a61e9aa99736)Hi, another question save/all %tst reduce\[binary! 'binary false 'false] gives a file with binary! binary! #\[false] false. Guess first binary! should also be serialized ?

hiiamboris

[16:56](#msg6001c93e787d8f79c803e953)mold/all is TBD

zwortex

[17:03](#msg6001caf6787d8f79c803ee96)I am too hasty then.

[17:33](#msg6001d1f5d5f4bf2965eb09ff)Path in parse rule do not work (see 2). I guess they should. Note that a workaround exists. It consists in referring the rule with a word locally to avoid using the path syntax (see 3). Don't know if it worth mentioning.

```
a: context [
    r: [ "1" | "2" ]
]
parse "1" a/r ; (1)

b: context [
    r: [ a/r ]
]
parse "1" b/r ; (2)

c: context [
    ra: a/r
    r: [ ra ]
]
parse "1" c/r ; (3)
```

hiiamboris

[17:47](#msg6001d51dd5f4bf2965eb1235)by design

[17:47](#msg6001d543cd31da3d9ab4a789)IIRC path lookup is slow was the main argument

zwortex

[17:57](#msg6001d79503529b296bf11971)I thought that parse was implemented with a state machine ? i.e. there was some sort of pre-computation of the rules before they are run.

hiiamboris

[18:08](#msg6001da0d14cec811ec9e6e96)doesn't look that way

[18:08](#msg6001da23cd31da3d9ab4b6a6)besides, you can't cache word's value as you are free to change it during the parsing

zwortex

[18:18](#msg6001dc5899549911fc244f0b)do you mean parse rule can be changed dynamically ?

rebolek

[18:18](#msg6001dc605562a61e9aa9d905)of course

[18:18](#msg6001dc679632f63d871c6206)not only parse rules but input also

hiiamboris

[18:20](#msg6001dcd081c55b09c70db5a2)e.g. `[... (word: rule1) if match (word: rule2) word ...]`

[18:20](#msg6001dcfb252c0a6ded11802f)you can't cache `word` for it is yours to change

zwortex

[18:26](#msg6001de599632f63d871c6ab1)ok I need to review that. changing the input dynamically is one thing ; changing the rules is another.

hiiamboris

[18:26](#msg6001de6f787d8f79c80428b9);)

[18:27](#msg6001de964498e01bbfad5d95)you've just stumbled upon one of the really \*dynamic* concepts of Redbol

[18:28](#msg6001ded3dc2e4809aa24ce0d)just like all code is data and you can change it before it's evaluated, so you can do with parse

rebolek

[18:29](#msg6001df2199549911fc24582f)you can for example add new rules from the input you are parsing

zwortex

[18:31](#msg6001df895562a61e9aa9e1e9)OK. I understand that it is possible. Be it advisable is another story.

rebolek

[18:32](#msg6001dfa1dc2e4809aa24d045)it's certainly fun ;)

hiiamboris

[18:32](#msg6001dfa1fb85d46e04e44be5)why not?

zwortex

[18:32](#msg6001dfcdfb85d46e04e44c29)I need to go... I'll post an answer later.

hiiamboris

[18:35](#msg6001e067787d8f79c8042f9a)you can use paths with `parse data compose/deep/only [... (my/path/rule)...]` btw

giesse

[19:10](#msg6001e88f03529b296bf14a0d)&gt; IIRC path lookup is slow was the main argument

pretty dumb argument if you ask me

hiiamboris

[19:13](#msg6001e957d5f4bf2965eb4b20)why?

greggirwin

[19:15](#msg6001e9c04498e01bbfad7e3f)The question is how slow, and does it affect only paths used or `parse` in general, even if you never use them. If it's half the speed and everybody takes a hit but it's only used in 1% of cases, then it's a valid concern.

[19:16](#msg6001ea12fe007479e414028b)@zwortex one of my early `parse` language playtime experiments was a Logo interpreter. I stumbled on things the same way, falling out of my chair when I realized I could parse a func spec and immediately add it to the block of rules.

zwortex

[20:42](#msg6001fe1afe007479e4143633)@hiiamboris, @greggirwin, @rebolek I had another question related to how to generate dynamic parse rules and localise them. I guess you answers address that most probably. However, I will post that particular question in the help forum as it looks more appropriate there.

For the bigger question as to whether changing dynamically the code (or the rules in that particular case) is advisable, this is a tough question. And there is no easy answer, certainly not a definitive one. My first impulsion was to draw some parallel.

In biology, the code is the DNA and change in the code is most often a decay, possibly leading to a cancer, and death at the end, anyway. Not very entertaining.

There is a gray area, though, that is the gene expression : the way certain genes are turned on and off by the environment. This regulates the differentiation between cells (a skin cell is not a liver cell) and their functioning vary, despite the fact that they share the same code. You may have a code immutable and still have profound differences in behaviour. The environment serves as a feedback on the rule and how they apply.

Other parallel, you plan a trek in the mountains. You may go with few items, not even a map, wander without purpose, get lost, fall off the cliff in the middle of the night, too bad... Or you may plan for your trip, get a detailed map, gear up for the winter, reach the summit on time, and be back safely to the refuge before night. The first strategy is probably a good one for an explorer that venture in unknown territories - hopefully he has some good heuristics ; the latter is more appropriate for big challenges and/or reproducible performances - then you train or rely on external knowledge - those are code.

More generally, I think the main activity when coding is where you set the boundary between what is general and what is specific, what can be factored, reused and what should be left unknown, what is worked on and what tool you use to work on it. This is often the pitfall too : either over designing, or not providing enough flexibility. This, along with the design and conquer strategy, are probably the two major paradigms in software design, though I've not thought that through. This is basically what you do when you write a function (stateless) : the arguments are the interface to the world, what is worked on, and the code is how you manipulate the world.

As in the biology case however, you also need a gray area : that is the ability to have certain flexibility between what is code, how it is being expressed, and what is data, however I see it more like a two stage process rather than an ongoing process : i.e. a meta process that turns code into data, to produce another code rather than an ongoing modification of the code. A meta process is when you create your tool or modify it : the code becomes the data of a meta process.

A final image : you're cutting grass with a big scythe and from time to time you need to stop, get some rest and sharpen the tool : cutting the grass is the process (data: grass, code : tool the scythe) ; resting and sharpening the tool the meta process (data : scythe , tool : the sharpener). You can perform one and the other but I would discourage doing one while doing the other.

hiiamboris

[21:13](#msg6002057d14cec811ec9eefea)Indeed. Chosen strategy depends on the application. And Red gives you enough power to not be limited by the tool once and for all.

[21:14](#msg600205b514cec811ec9ef087)That power comes at a price. Like, principal incompileability ;)

zwortex

[21:22](#msg6002078c99549911fc24bfee)With great power comes... great responsibility ?? I heard that one. No =&gt; great incompileability ! That's a nice one.

greggirwin

[21:42](#msg60020c3ddc2e4809aa2552a2)\*Great* thoughts @zwortex. And a nice joke at the end. :^)

I think of things in a couple major ways:

\- It's much easier to start flexible and get more strict on top of that, rather than the other way around. It does mean you have to be more careful where you have maximum flexibility, but that's also what makes it fun and powerful, because you can think of new ways to do things. Do strict languages allow that? Not so much.

\- Some people trek in the mountains, but a lot more people go to the park. Sure you can still get hurt in a park, but the risk is much lower, so you just need to wear comfortable Red shoes. For a hike, you need boots, a jacket, water and snacks, and a simple plan (this trail, back by dark); maybe a stick, a friend. The bigger the challenge, the more you need. Finally you have huge projects which, even with planning and experience, can fail like a Shackleton expedition. The world runs on people going to the park, but everybody thinks they need to do things like Facebook.

## Saturday 16th January, 2021

gltewalt

[03:46](#msg6002618bd5f4bf2965ec6d9c)Can you return the whole rule with changed data?

[03:50](#msg6002629e252c0a6ded12ca86)Copy of the whole rule

giesse

[15:21](#msg60030493fb85d46e04e6f55d)&gt; why?

@hiiamboris because if you care, then nobody forces you to use paths, and if you don't, why should you be forced to use workarounds?

hiiamboris

[15:42](#msg6003095303529b296bf3e707)I guess it was just so less people would blame parse for their slow code they've written with paths. But I actually think like you too. Why not support it.

dsunanda

[16:55](#msg60031a6d787d8f79c8070a2f)The code below implements a UI where you can move boxes around, and the current box is always on top (ie it rerranges the Z-index on an OVER event).  
On Windows at least, it fails badly - just jiggling the for a couple of seconds will generate error messages, and - very likely a console crash).  
The problem is a race condition between the REMOVE and the APPEND in multiple invocations of MAKE-TOP:

[16:55](#msg60031a7be578cf1e95f0c2ea)

```
lo: copy [] loop 10 [append lo compose [at (random 200x200) box loose 100x100 (random 200.200.100) on-over [do make-top face]]]
make-top: func [
  face [object!]
   /local
   parent z-index
][
    parent: face/parent
	z-index: find parent/pane face
    if last? z-index [exit]
  	remove z-index
    append parent/pane face
]
view/no-wait lo
```

[16:56](#msg60031ada14cec811eca182f1)I have an almost-fix (it seemingly works with two provisos - see below). The fix is to effectively hand-carve a MUTEX using a shared word:

[16:57](#msg60031ae4787d8f79c8070b2b)

```
make-top: func [
  face [object!]
   /local
   parent z-index
][
    parent: face/parent
	if parent/extra [ wait 0.01 if parent/extra [exit]]  ;; wait or yield
	parent/extra: true
	z-index: find parent/pane face
    if last? z-index [parent/extra: false exit]
  	remove z-index
    append parent/pane face
	parent/extra: false
]
view/no-wait lo
```

[17:00](#msg60031bb99632f63d871f4b17)The two provisos are:  
1\. Testing and setting parent/extra is not guaranteed to be atomic.On a sufficiently slow or busy machine, the race is still on - I really need a proper Compare and Swap function to get this perfect  
2\. There's still "shimmering" at times when it seems VID gets confused about which face is on top - that's obviously a separate issue to the need for user-level Mutex abilities.

Thoughts on better fixes welcome!

hiiamboris

[17:29](#msg6003228b4498e01bbfb05a19)

```
lo: copy [] loop 10 [append lo compose [at (random 200x200) box loose 100x100 (random 200.200.100) on-over [do make-top face]]]
make-top: func [
  face [object!]
   /local
   parent z-index
][
    parent: face/parent
    z-index: find parent/pane face
    if last? z-index [exit]
    move z-index tail parent/pane
]
view/no-wait lo
```

greggirwin

[17:32](#msg60032346252c0a6ded148a51)I never got a crash with @dsunanda's code, but did get a couple flickers. With @hiiamboris' code it's rock solid here.

hiiamboris

[18:04](#msg60032aaffb85d46e04e758df)Crashes for me. I'll try to isolate the crash later.

dsunanda

[18:06](#msg60032b1999549911fc275088)@hiiamboris @greggirwin Thanks! That version looks as solid as my second one - but the shimmer is still there.  
It seems to only happen when the 9th Z-index box is moved -- see this instrumened version:

```
lo: copy [title "hiiamboris + n count"] loop 10 [append lo compose [at (random 200x200) box loose 100x100 (random 200.200.100) on-over [do make-top face]]]
make-top: func [
  face [object!]
   /local
   parent z-index n
][
    n: []
	append n 1
    parent: face/parent
    z-index: find parent/pane face
	print [length? n index? z-index]  ;; print Nth invocation + z-index of box being topped
    if last? z-index [exit]
    move z-index tail parent/pane
]
unview/all view/no-wait lo
```

hiiamboris

[18:15](#msg60032d2b14cec811eca1b562)funny that it crashes in different places completely

dsunanda

[18:19](#msg60032e4f252c0a6ded14a592)Fun problem, no? I've been head scratching for the past 24 hours :)

[19:00](#msg600337dccd31da3d9ab7fac7)Better version of the instrumented code - it adds text to show what the z-index of the boxes are. Overlap box 9 and 10 a few times to get the shimmer:

```
lo: copy [title "hiiamboris + n count"] loop 10 [append lo compose [at (random 200x200) box loose 100x100 (random 200.200.100) on-over [do make-top face]]]
make-top: func [
  face [object!]
   /local
   parent z-index n rec
][
    n: []
	append n 1
    parent: face/parent
    z-index: find parent/pane face
	print [length? n index? z-index]  ;; print Nth invocation + z-index of box being topped
    if last? z-index [exit]
    move z-index tail parent/pane
	rec: parent/pane
	forall rec [rec/1/text: form index? rec]   ;; label boxes with their z-index value
]
unview/all view/no-wait lo
```

[19:01](#msg6003382481c55b09c710f803)It does not help putting a dummy box (with no ON-OVER) in the 11th place, and having

```
move z-index back back tail parent/pane
```

hiiamboris

[19:50](#msg60034374d5f4bf2965ee810f)this code shows nothing

[19:50](#msg6003439214cec811eca1ebbf)I see, you've nicked the '2' in '200'

dsunanda

[20:01](#msg6003460781c55b09c7111b12) @hiiamboris -- odd somehow I clipped the 2 in pasting to Gitter. The source is find. No idea how that happened.  
Screen shot of above code shimmering - Boxes with z-indexes 9 and 10 are repeatedly triggering the ON-OVER:  
https://i.imgur.com/Zl7za5T.png

hiiamboris

[20:03](#msg6003469cd5f4bf2965ee88c2)yeah I know

[20:03](#msg600346a34498e01bbfb0b890)it's a problem with your design

[20:04](#msg600346c4fb85d46e04e7a03a)and a simple solution would be to check (in screen coordinates) that mouse was moved by at least 2 px after the last event fired

greggirwin

[20:05](#msg6003470f252c0a6ded14e35c)Thanks for the details @dsunanda.

dsunanda

[20:08](#msg600347bb5562a61e9aad4455)@hiiamboris I am happy to try any sort of work around - but right now, it seems that Vid is triggering an OVER event for a box which is not on top, and so is a spurious event. Looks to me like an edge case issue in Vid somewhere.

hiiamboris

[20:09](#msg600348085562a61e9aad4517)over should be triggered when mouse \*leaves* the face, so it's ok

[20:10](#msg6003481ce578cf1e95f1375f)you can use `face-to-screen` from here https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/relativity.red

dsunanda

[20:12](#msg600348c714cec811eca1f8c0)&gt; over should be triggered when mouse \*leaves* the face, so it's ok  
That makes sense now - thanks! I originally had the code ON-DRAG - because I really only need to pop the box to the top when it moves. But that had another problem...I'll save that for another time.

[20:15](#msg6003494b9632f63d871fbd81)Thanks both for the help!

## Sunday 17th January, 2021

GiuseppeChillemi

[01:41](#msg600395b54498e01bbfb1666d)I don't expect double quotes to be here.

```
probe to-file location: "C:\Users\xxx\AppData\Local\Google\Chrome\User Data\Profile 1\bookmarks"
```

Output

```
%"C:\Users\xxx\AppData\Local\Google\Chrome\User Data\Profile 1\bookmarks"
```

dsunanda

[01:46](#msg600396d9252c0a6ded159509)@GiuseppeChillemi Strange....I see the spaces escaped as %20 (using Red under windows) using your code.  
Do you get what is expected with TO-RED-FILE rather than TO-FILE ?

GiuseppeChillemi

[01:49](#msg600397c79632f63d87206fe1)We are near:, with `to-red-file`C:\\`has been properly converted`  
%"/C/Users/xxx/AppData/Local/Google/Chrome/User Data/Profile 1/bookmarks"  
\`

[01:52](#msg600398695562a61e9aadfdaa)The file has been loaded but I don't expect the double quotes.

[01:54](#msg600398e9dc2e4809aa28eaaf)The visual aspect is different from the content, the result of `first` is

```
#"/"
```

greggirwin

[02:45](#msg6003a4e6787d8f79c8084a83)@GiuseppeChillemi why don't you expect the quotes?

@dsunanda we changed it not long ago, so files with spaces no longer use percent escaping. That format is OK for URLs, where it originated, but is not good for local file system use and readability.

gltewalt

[02:53](#msg6003a6a69632f63d87208fb5)It's a broken path without the quotes

GiuseppeChillemi

[03:05](#msg6003a972dc2e4809aa290b2d)@greggirwin because we had percent escaping up to some time ago. But I think it's more correct in this way on a file system POV. But if you look from the FS side, the first character is a double quote, from red side it is the slash. How should I think? FS or Red? Well, I understand it is the best compromise out there and nothing more can be done.

[03:08](#msg6003aa4a03529b296bf558f4)Now remains to understand why the difference between `to-file` and \`to-red-file.

greggirwin

[03:18](#msg6003ac72cd31da3d9ab8fe54)You can just think of them as a string with a sigil to denote its specific string type.

hiiamboris

[13:01](#msg60043518d5f4bf2965f08814)`to-file` is a shortcut to `to file!`

dsunanda

[13:41](#msg60043e9f81c55b09c7133fed)@greggirwin Thanks - I'm working on a month-old nightly. Should try to keep up more :)

greggirwin

[17:39](#msg600476455562a61e9aaff92a)`to-local-file` is the opposite of `to-red-file`.

[17:39](#msg6004765f252c0a6ded179601)`to file!` has only to do with the datatype, not the local file/path format.

## Monday 18th January, 2021

zwortex

[21:48](#msg600602176244ee1450990b75)Similar to #4744 and related #4796, entering by mistake \*\*a: #{ name: "john" family: "doe" }\** instead of a: #( ... ) in the console enters in an infinite loop as if waiting for a closing }. Even when provided, it is ignored. Need (escape). Shall it be mentioned in related issues or is it taken care of ?

hiiamboris

[21:52](#msg6006032e753011449b002e26)it's the primary point of #4744

zwortex

[21:55](#msg600603c66b20cf7730c22846)There is no escape char in this particular sequence, is there ?

hiiamboris

[21:55](#msg600603d58816425540d5df4a)okay true, mention it there

[21:56](#msg60060422ac653a0802c8cfcd)could be other chars that binary does not support that cause the same issue

[21:59](#msg600604b73855dd07fd62b7de)yep, lots of actually

[21:59](#msg600604ded8bdab473944a479)`%`, `^`, `"`, `:`, `$` and I'm lazy to continue

## Wednesday 20th January, 2021

rebolek

[13:23](#msg60082ebc97132e2480f14bf5)Sometimes when I crash Red (which happens few times a day), it takes done other Red processes too. Not all, but some crash. Has anyone experienced it?

toomasv

[13:38](#msg6008325c004fab4741532d82)Not me.

ne1uno

[13:54](#msg600835ff6b20cf7730c7af2e)is static compile of red crush etc dll/so possible? I remember python programs would often crash other python processes.

greggirwin

[18:53](#msg60087c42a2354e44ac9844f3)@rebolek are you using release builds of your scripts, running interpreted, or using a shared runtime? If the processes are separate (release builds), there must be some other shared resource affecting all instances. e.g. if you're using newer I/O, maybe there's something deep in there related to the networking stack?

[18:55](#msg60087ca9ac653a0802cf2885)I guess "crash Red" is unclear to me, unless you're running parallel build processes which could conflict over a single shared resource (e.g. disk file), if that wasn't planned for in the compiler.

pekr

[18:59](#msg60087d956b20cf7730c886fc)Or those otherwise separated Red apps might react to some other aspect of OS level changes. E.g. with R2, all apps would crash with the screen resolution change, when those apps were running.

## Thursday 21st January, 2021

rebolek

[07:39](#msg60092f9d3855dd07fd6ae8ef)@greggirwin I am running multiple instances of Red console, recent build from main branch. It's downloading stuff and converting JSONs to maps. Lots of it. And sometimes it crashes, usually with `access violation` but I've seen other messages too. Unfortumately the crash is hard to reproduce as it takes a lot of time before it happens.

And when one console crashes, it sometimes takes done other consoles (same `access violation` error) that are also downloading. I believe that consoles not downloading are running fine.

hiiamboris

[08:32](#msg60093c2397132e2480f4307d)@giesse just yesterday encountered a random crash, likely in send-request (even more likely in linux's version of write/info), so I would paint it as a main candidate

rebolek

[08:56](#msg600941ab2cb18a437c30bb29)Let's hope it's not present in the new IO :)

[08:56](#msg600941bf004fab4741560d32)Once I have `send-request` rewritten for new IO I can test it.

meijeru

[12:06](#msg60096e50d8bdab47394d8f22)I am curious: what is this about "new IO"? I don't see an active branch dealing with this. Perhaps @qtxie is working on it? What is the status?

pekr

[12:48](#msg60097835cf8b827734453563)New IO = qtxie's IO2 brach here? https://github.com/qtxie/red/commits/IO2

[13:01](#msg60097b108816425540ded84e)My understanding is, that the basics might work, there even seems to be a TCP client / server example. @hiiamboris did some certificates related stuff in that regards ...

hiiamboris

[13:14](#msg60097e428816425540dee1fe)confusing me with someone (;

pekr

[13:18](#msg60097f3dcf8b82773445482c)well, maybe bitbegin?

[13:20](#msg60097f8e2cb18a437c3163ac)https://github.com/bitbegin/red/commits/IO2-y

greggirwin

[18:45](#msg6009cbbdac653a0802d2cef0)@rebolek thanks for the info.

@bitbegin was working on certs, yes.

## Friday 22nd January, 2021

dsunanda

[15:46](#msg600af36b36db01248a9571eb)Why am I no longer seeing a console error when bugs occur in VID action facets? Looks like a recent change. This code does not trigger an error:

```
unset 'do-it unview/all view [box "click" on-up [do-it]]
```

[15:47](#msg600af38f36db01248a957241)That's Windows, 22-Jan build

hiiamboris

[15:47](#msg600af39d3855dd07fd6fc1db)https://github.com/red/red/issues/4784

dsunanda

[15:58](#msg600af626a2354e44ac9ef598)@hiiamboris Thanks - that was quick! It kinda makes any attempt to code pointless as bugs are invisible :)

hiiamboris

[15:59](#msg600af65897132e2480f8f616)use D2D branch ;)

dsunanda

[16:02](#msg600af6ff97132e2480f8f762)I've just gone back a month or so :)

pekr

[16:37](#msg600aff31cf8b827734495fd3)D2D is already a PR, but so far not accepted ....

hiiamboris

[16:48](#msg600b01e2ac653a0802d61d85)need more onion rings...

rebolek

[18:41](#msg600b1c61d8bdab4739523763)@pekr not only basics, but there is also pretty good TCP/TLS implementation on top of which other protocols can be built.

pekr

[19:05](#msg600b21dd004fab47415b2c6a)So why don't we merge into Master then? We are alpha anyway, so if almost complete, let's live the latest :-)

greggirwin

[19:14](#msg600b2406cf8b82773449c721)For I/O there are still open design questions. Yes, we're alpha, but our Alpha is not like most others. :^)

## Saturday 23th January, 2021

GiuseppeChillemi

[09:53](#msg600bf201d8bdab4739542c58)"King, the crowd is hungry and asking for a release!"

greggirwin

[17:45](#msg600c60b86b20cf7730d2b30b)Let them eat cake.

hiiamboris

[21:09](#msg600c9096d8bdab473955a81f)Is this by design? Inconsistent with R2/R3:

```
>> a: object [s: next "abc"]
>> b: copy a
>> c: make a []
>> head a/s
== "abc"
>> head b/s
== "abc"
>> head c/s
== "bc"
>> c: make a [probe head s]
"bc"         ;-- truncated before user code evaluates
== make object! [
    s: "bc"
]
```

[23:09](#msg600cacbe8816425540e7077b)reported

greggirwin

[23:10](#msg600cacf66b20cf7730d362bb)Thanks. I was thinking about it after seeing your first message, and trying to come up with a reason it would be by design.

## Sunday 24th January, 2021

raxod502

[04:20](#msg600cf5a13855dd07fd747bd7)@greggirwin Hey, I figured out why I was getting a weird TLS error from https://static.red-lang.org/. Turns out my ISP was to blame. They considered the website to be "untrustworthy" for some reason, and were inserting an interstitial page which was breaking the TLS. I didn't realize, because the TLS error was so bad that no browser would let me see the page. I had to explicitly visit the HTTP version (so it would load at all) and click the button telling them I knew what I was doing, and after that (at least for a few days before the page is re-inserted by my ISP) both HTTP and HTTPS work fine. I guess there's nothing you all can do about that, since I doubt Comcast will be of any help in explaining things.

hiiamboris

[09:17](#msg600d3b123855dd07fd75104d)Where I live, rebol.com and rebol.org were completely banned for like two years ;) These Evil Redbol sites!

greggirwin

[18:58](#msg600dc37136db01248a9c11f5)@x8x is the one who has all the power and knowledge in that area. Thanks for the report @raxod502.

x8x

[22:12](#msg600df0bb8816425540e9f4d3)@raxod502 All good with our setup, try using a VPN to bypass your ugly ISP. I can only guess they may have blacklisted that subdomain of ours as it serves our binaries that get wrongly flagged by AntiVirus tools.

GiuseppeChillemi

[23:33](#msg600e03d0ac653a0802dd4918)What is wrong here?

```
>> help any-type!
ANY-TYPE! is a typeset! value: [datatype! unset! none! logic! block! paren! string! file! url! char! integer! float! word! s
```

[23:34](#msg600e03ed2cb18a437c3c7e8c)What is the last `s`? And why the block is not closed?

## Monday 25th January, 2021

greggirwin

[00:05](#msg600e0b60cf8b8277345079a6)Looks like https://github.com/red/red/pull/4683 is the cause. So now we get less than we might want, rather than running amok.

rebolek

[08:28](#msg600e812fdfdbc1437faea8be)@hiiamboris OTOH it's probably not directly related to the networking stack, because I can get the access violation even with `read-thru`

Oldes

[15:57](#msg600eea59cae490555f689f96)Some time ago there were changes related to `file!` datatype... like this one:

```
>> %aaa\
== %"aaa\"
>> dir? %aaa\
== false
```

I wonder if there is any document or available discussion log explaining why it was changed (in backward incompatible way).

greggirwin

[16:09](#msg600eed2dd8bdab47395b4b21)There was a lot of chat about it, but I'd have to dig it up. The issue is that URLs have a spec for including spaces and other special chars, percent encoding, but file systems do not. A \*lot* of filenames have spaces in them. Having `%20` in them is very, very human unfriendly.

```
>> dir? %aaa\
== true
```

hiiamboris

[16:14](#msg600eee4ecae490555f68ac69)Did you redefine `dir?`?

greggirwin

[16:14](#msg600eee69753011449b168ebe)Hmmm, maybe. I load a %user.red here.

[16:14](#msg600eee7d6244ee1450afca5c)Indeed. Sorry about that.

[16:17](#msg600eef26cf8b82773452bfdf)For the backslash change, I wonder if it's a fast lexer regression.

[16:24](#msg600ef0ca753011449b169583)Looks like it changed (for me) 12-Apr-2020, based on old console tests.

Oldes

[16:28](#msg600ef1ba3855dd07fd7952a6)Also:

```
>> make-dir %new-dir ;<---- path accepted without a slash (OK)
== %new-dir/
>> exists? %new-dir  ;<---- path accepted without a slash (OK)
== true
>> delete %new-dir
== false ;<----------- not deleted! (BUG)
>> delete %new-dir/
== true
```

hiiamboris

[16:29](#msg600ef1eddfdbc1437fafdc07)&gt; Looks like it changed (for me) 12-Apr-2020, based on old console tests.

I prefer the new version

greggirwin

[16:29](#msg600ef1f2ac653a0802dfa4b2)But the real question is which is better? If you expect to have backslashes in a filename, you should use `to-red-file`.

Oldes

[16:31](#msg600ef24c8816425540ec6547)That is also my opinion... but maybe there are some reasons which I don't see.. that is why I'm asking.. I don't think the slashes are related to URLs.

[16:33](#msg600ef2e5410c22144020bd04)It must be related to this feature (to me not introduced feature):

```
>> read %"r:\" ;<---- using file path in system format!
== [%"System Volume Information/" %Temp/ %VS_Fallback/ %x.png %xx/]
```

greggirwin

[16:34](#msg600ef3313855dd07fd795760)The delete issue may be OS specific. On Windows you can't have a dir and a file with the same name. But on other systems, case sensitive differences may allow it.

Oldes

[16:37](#msg600ef3cf410c22144020bfe6)

```
red
>> dir? %"r:\Temp\"
== false ;<---- not recognized as a DIR...
;... but accepted by READ
>> read %"r:\Temp\"
== [%0600fd54-a93d-491e-8817-cbb2795e263e.tmp %0ada0c50
```

greggirwin

[16:39](#msg600ef43b6b20cf7730d8cf62)Simple I/O converts to local file format when reading.

Oldes

[16:39](#msg600ef458dfdbc1437fafe390)So is it a bug or a feature?

greggirwin

[16:40](#msg600ef469dfdbc1437fafe3c1)`dir?` checks for slash at tail (which my local version obviously extends to backslash as well ;^).

[16:40](#msg600ef487004fab474164471c)It's a good question. :^)

hiiamboris

[16:40](#msg600ef497a2354e44aca877f2)`/` is not a \*back\*slash ;)

greggirwin

[16:42](#msg600ef4eba2354e44aca8798c)...whatever do you mean? (thankful for editability to look less stupid)

hiiamboris

[16:42](#msg600ef4f1d8bdab47395b62b6):D

[16:43](#msg600ef5173855dd07fd795bc0)I don't know why `dir?` should not support `\` as well.

[16:44](#msg600ef55eac653a0802dfadf6)Since it accepts a `file!` it should work with files of any format.

Oldes

[16:44](#msg600ef5693855dd07fd795c7c)I think that the reason is, that it's expecting that `file!` is normalized like in Rebol:

```
>> %path\
== %path/
```

[16:45](#msg600ef597a2354e44aca87b0f)And that in `url!` the \_backslash_ is not for dirs.

hiiamboris

[16:45](#msg600ef5c12cb18a437c3ee43b)Never seen a backslash in an url..

greggirwin

[16:46](#msg600ef5e02cb18a437c3ee4a1)This is the bug/feature question, and how mezzanines like `dir?` track with underlying I/O API use. e.g. in R2 it asked the OS if the thing was actually a dir, not just a string that looked like one.

[16:47](#msg600ef62a753011449b16a79e)If you don't tell Red it's a local file, should it \*assume* so?

Oldes

[16:48](#msg600ef672410c22144020c8c1)The source of the issue is, if Red should normalize slashes or not. Now it does not:

```
>> %aa/bb\cc
== %"aa/bb\cc"
```

hiiamboris

[16:51](#msg600ef725753011449b16aa00)No it should not. Normalization only when loading a file value seems to me like strange special case.

[16:53](#msg600ef7a1ac653a0802dfb564)R2:

```
>> append f: %a "\"
== %a\
>> load mold/all f
== %a/
```

initial value lost in translation...

[16:58](#msg600ef8a28816425540ec7a35)On `dir?` - if we make it accept `\`, we will want the same for `split-path`, `clean-path` and others, increasing overall complexity and pushing the problem around

gltewalt:matrix.org

[17:06](#msg600efaa2cae490555f68d2f0)A type is not necessarily dependent on its lexical representation, at least right now.

greggirwin

[17:08](#msg600efb2aac653a0802dfbf8e)I agree with @hiiamboris. It helps for Red to be more strict about file forms, so translations to OS forms are more explicit and files are truly passive, not lossily adapted. But we know that \*at some point* a file has to be read from the OS, and necessarily use its conventions. So then the question is pass-thru behavior and overall consistency.

[17:10](#msg600efb8b410c22144020db3d)@gltewalt:matrix.org forms define types when loaded, but rules can be broken.

gltewalt:matrix.org

[17:12](#msg600efc06cf8b82773452e74f)Yes, with `to`

greggirwin

[17:45](#msg600f03cfa2354e44aca8a6a6)\[per](https://gitter.im/red/bugs?at=600e0b60cf8b8277345079a6) :point\_up:

```
>> ? any-type!
ANY-TYPE! is a typeset! value: [datatype! unset! none! logic! block! paren! string! file! url! char! integer! float! word! set-word! lit-word! get-wor

>> help-string any-type!
== {ANY-TYPE! is a typeset! value: [datatype! unset! none! logic! block! paren! string! file! url! char! integer! float! wo...
>> print help-string any-type!
ANY-TYPE! is a typeset! value: [datatype! unset! none! logic! block! paren! string! file! url! char! integer! float! word! set-word! lit-word! get-wor
```

So this may not be `help`'s fault. @hiiamboris @qtxie worked on a console issue recently, which I thought was resolved, but the above is from a fresh build here.

[17:48](#msg600f045edfdbc1437fb013e0)https://github.com/red/red/issues/4809 is what I'm thinking of.

hiiamboris

[17:52](#msg600f056bd8bdab47395b97a5)I also noticed the output is too small often, but didn't report it.

[17:55](#msg600f05f7a2354e44aca8ace9)`>> probe help-string any-type!`  
`{ANY-TYPE! is a typeset! value: [datatype! unset! none! logic! block! paren! string! file! url!^/}`

this looks like help issue to me

greggirwin

[17:57](#msg600f069097132e248002c927)OK, I'll take a look.

gltewalt:matrix.org

[17:59](#msg600f06ef753011449b16d9bd)While you're taking a look, add in a help/buffer

greggirwin

[18:06](#msg600f088c8816425540ecacd6)What do you mean @gltewalt:matrix.org ?

The issue is letting the truncator act on typeset values, which will never be outrageously large.

[18:10](#msg600f099c3855dd07fd799eb5)PR submitted to fix `help`.

gltewalt:matrix.org

[18:18](#msg600f0b8d6244ee1450b0254d)I mean give folks the equivalent of what/buffer for help

greggirwin

[18:20](#msg600f0bebac653a0802dff478)You mean like `help-string`?

gltewalt:matrix.org

[18:22](#msg600f0c6a410c221440210f8d)It isn't obvious that help-string is a thing folks can use. (At least last time I looked)

greggirwin

[18:26](#msg600f0d5a2cb18a437c3f32a7)Both `what/buffer` and `help-string` are not really meant for normal use. `Help` in general is console oriented, so the goal is to present information in the console. We did add the ability to get those formatted results for tools to leverage.

gltewalt:matrix.org

[18:32](#msg600f0ebecae490555f69115c)Ok

## Tuesday 26th January, 2021

loziniak

[09:25](#msg600fdff98816425540eef061)Hi! I've got a garbage collector crash:

```
root: 7669/106222, runs: 4, mem: 7618812
*** Runtime Error 1: access violation
*** in file: /mnt/share/prj/x3m/wallet2/allocator.reds
*** at line: 461
***
***   stack: red/update-series F45D5B1Ch 2867320 1103392
***   stack: red/cross-compact-frame F4760004h 084C4648h
***   stack: red/collect-frames 1
***   stack: red/collector/do-mark-sweep
***   stack: red/collector/do-cycle
***   stack: red/alloc-series-buffer 48 1 0
***   stack: red/alloc-series 48 1 0
***   stack: red/alloc-bytes 48
***   stack: red/binary/do-math 7
***   stack: red/binary/xor~
***   stack: red/actions/xor~*
```

[09:26](#msg600fe0403855dd07fd7bdffc)(Another thing being that there is no `allocator.reds` in this folder anway)

[09:27](#msg600fe075004fab474166ce67)

```
>> about
Red 0.6.4 for Linux built 18-Jan-2021/10:06:33+01:00 commit #de5c05e
```

hiiamboris

[09:32](#msg600fe1bd36db01248aa182e7)need a way to reproduce it ;)

loziniak

[09:54](#msg600fe6e5a2354e44acaaf4f4)It can be hard, probably no way to separate it into minimal case, as this is GC. And my code is not public :-(

rebolek

[12:33](#msg60100c06cf8b82773455c210)I recently had GC doing `recycle` very hard for almost three minutes and no crash! :-)

hiiamboris

[14:24](#msg6010260b36db01248aa240cf)When GC crashes it is no guarantee that GC is to blame. Something else may have corrupted the memory.

greggirwin

[17:25](#msg60105077cae490555f6c74ae)@hiiamboris is your memory marker experiment something @loziniak could use locally?

hiiamboris

[17:26](#msg601050c397132e2480064f4e)Not if he cannot reproduce it himself ;)

[17:26](#msg601050cb410c221440247d48)And it's 1.5 years old already...

greggirwin

[17:27](#msg601051146b20cf7730dc8be1)I thought he meant he couldn't minimize it for us to test.

Time flies.

loziniak

[17:28](#msg6010512adfdbc1437fb39a46)For now I'll probably leave it, because after some updates to the code the error disappeared. However, it may come up later. Thank you, guys!

[17:30](#msg6010519f6b20cf7730dc8d77)&gt; I thought he meant he couldn't minimize it for us to test.

That's because I assumed it's GC bug. As \[hiiamboris mentioned ↑](https://gitter.im/red/bugs?at=6010260b36db01248aa240cf), it's not necessarily the case.

## Saturday 30th January, 2021

ne1uno

[03:13](#msg6014cec0428d9727dd42233e)d2d merged current tip, shape no longer closes? `view [base 80x210 snow draw [fill-pen off translate 40x15 shape [move 0x-10 line 30x0 0x10 -30x0] ]]`

[03:13](#msg6014cec05500a97f82d3e08c)debug versions of console don't work well

hiiamboris

[09:45](#msg60152acb55359c58bf0d8d64)@qtxie I thought you fixed that, no?

[09:47](#msg60152b27ae4b9b27c189b7ab)Ah.. we probably decided that we should fix other platforms instead

[09:47](#msg60152b38063b6c68d52908dd)@ne1uno use `close` keyword

ne1uno

[09:47](#msg60152b4d0eed905f187e38a3)ty

gltewalt

[17:39](#msg601599ca063b6c68d52a249c)This should probably throw "x has no value". Looks like `is` is escaping `help`?

```
>> help is x
*** Script Error: is does not allow word! for its 'field argument
*** Where: is
*** Stack:
```

hiiamboris

[17:52](#msg60159cea9238c531ad12ddda)operators have bigger priority than functions

gltewalt:matrix.org

[17:57](#msg60159e23a0246860dc1e5b6a)Its the only op that I get an error on with my script, so... still scratching my head

gltewalt

[18:11](#msg6015a14eaa6a6f319df363f7)`is` is unique here.

hiiamboris

[18:12](#msg6015a1844f7d1b68e51d8efc)of course

[18:12](#msg6015a194aa6a6f319df364a6)`is` has a lit-word argument semantics, just as `help`

## Monday 1st February, 2021

dsunanda

[20:41](#msg6018678d9238c531ad19f7ac)#4790 is marked as fixed and built (by the good doc himself!) - and the Windows 01-feb build does fix the specific examples given in the bug report and comments.  
But it seems there is still a wider issue at large:

```
loop 1000 [
    print xx: to-binary random/secure 31415926535
   attempt [load xx]
   mold system/words   ;; trigger error if system/words is now messed up
]
```

I can usually see the error occurring in under 10 iterations.

Oldes

[21:40](#msg601875501ed88c58d8145afc)Can be simplified to something like:

```
>> transcode #{8B}
*** Access Error: invalid UTF-8 encoding: #{8B000000}
*** Where: mold
*** Stack: 
>> system/words
*** Access Error: invalid UTF-8 encoding: #{8B000000}
```

dsunanda

[21:54](#msg60187878aa6a6f319dfaae7c)@Oldes I'm seeing that specific value - #{8b} - as not corrupting system/words any more.....It did prior to 01-feb.....It still errors, but without damaging system/words

Oldes

[21:55](#msg601878bc9d5c644f664405a8)I just made a current build and both corrupts `system/words`.

[22:00](#msg60187a119d5c644f66440983)Also notice, that the error is not from `transcode` in this case, but from `mold`:

```
>> transcode #{8B}
*** Access Error: invalid UTF-8 encoding: #{8B000000}
*** Where: mold
*** Stack: 
>> error? try [transcode #{8B}]
== false
```

compare with:

```
>> transcode #{42137E26C646365C}
*** Syntax Error: (line 1) invalid character at \
*** Where: transcode
```

dsunanda

[22:02](#msg60187a8c9238c531ad1a308c)Thanks.....Looks like the fix was only partial and/or hasn't made it to all builds. The error can go weird. eg (after you've got an unmoldable system/words):

```
recycle mold system/words
== "make object! [...]"
```

It's now moldable, but useless :)

greggirwin

[22:12](#msg60187cea55359c58bf162241)Reopened. Thanks for the tests and reports.

dsunanda

[22:55](#msg601886f4aa6a6f319dfad5ce)@greggirwin Thanks too - wasn't sure what the modern etiquette is for reopening bugs :)

greggirwin

[22:56](#msg601887129d5c644f66442e70)I lack social graces, so... ;^)

## Friday 5th February, 2021

guaracy

[14:39](#msg601d58b0a0246860dc337319)I'm having some trouble sorting blocks of strings (Linux)

```
>> sort ["água" "azedo" "Casa" "carro"]
== ["azedo" "carro" "Casa" "água"]
```

must be

`["água" "azedo" "carro" "Casa"]`

Maybe sort should use `strcoll` instead of `cmpfunc`(?)

```
>> about/debug
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 3581 date: 5-Feb-2021/0:06:04 commit: #6440af53301c09ea21166d320b1045d9548e0469 ]
PLATFORM: [ name: "Linux Mint 19.3" OS: 'Linux arch: 'x86_64 version: 5.4.0 build: {#73~18.04.1-Ubuntu SMP Tue Jan 19 09:02:24 UTC 2021} ]
--------------------------------------------
```

hiiamboris

[17:45](#msg601d84459238c531ad285c15)you can provide your own comparison func to `sort`

[17:49](#msg601d85125500a97f82eb82fa)or open a wish ticket at https://github.com/red/REP/issues

gltewalt

[17:56](#msg601d86bda0246860dc340071)`sort/compare ["água" "azedo" "Casa" "carro"] func [a b][a/1 > b/2]`

[17:59](#msg601d87814f7d1b68e5333613)`sort/compare [stuff...] func [a b][a < b]` etc

greggirwin

[19:34](#msg601d9dd81ed88c58d822bdda)@guaracy I don't know what the equivalent to `strcoll` is on Windows, but we need to be portable. Unfortunately, there are two right answers for sorting: ordinal and linguistic (locale based). From a quick search, there are also locale-invariant considerations. As @hiiamboris notes, the best way to start on this is a custom comparison.

## Sunday 7th February, 2021

toomasv

[13:42](#msg601fee611ed88c58d8281ecc)After switch to new `transcode`, `load/trap` doesn't work anymore.  
It used to be so:

```
>> load/trap {a: [}
== [[a:] "" make error! [
    code: 201
    type: 'syntax
    id: 'missing
    arg1: #"]"
    arg2...
```

But now only error is returned.  
Is it bug, or, more probably, intentional change? If intentional, is there some other way to get previous behavior? And then help should also reflect the change.

hiiamboris

[13:54](#msg601ff12a428d9727dd5f83d1)Better ask on TG ;)

[13:54](#msg601ff132ae4b9b27c1a6521a)Tests were commented out https://github.com/red/red/commit/3bf08791f0208761c0a93acca21b8f96c558890c

[13:55](#msg601ff14655359c58bf2a3463)I figure `transcode/trace` can be used, but that's a bit more work

toomasv

[15:10](#msg602002f81ed88c58d8284afb)OK, thanks!

## Monday 8th February, 2021

ldci

[12:16](#msg60212b9eae4b9b27c1a94361)Hello there is a problem for downloading red sources from Red Language: not here

hiiamboris

[12:38](#msg602130b324cd6b60d827a24f)dl from github

ldci

[17:55](#msg60217b274f7d1b68e53caaa3)@hiiamboris Of course It’s possible by Github. I was juste pointing to a problem with Red web server :)

hiiamboris

[17:57](#msg60217b95063b6c68d5493d48)Sure, thanks ;) IIRC it's known, just idk why it takes so long to fix a broken link on the site..

ldci

[18:03](#msg60217ce955359c58bf2e0c47)BTW: https://twitter.com/fjephe/status/1358838235775049733/photo/1

hiiamboris

[18:06](#msg60217d904f7d1b68e53cb2aa)What's the animation for buttons? It shows me only a static jpeg

ldci

[18:21](#msg602181265500a97f82f5153a)No: I use a base face with a png image and then this code  
‘’'  
selectButton: func [  
flag \[integer!]  
][  
switch flag [  
1 \[bt1/size: zoomsize]  
2 \[bt2/size: zoomsize]  
3 \[bt3/size: zoomsize]  
]  
do-events/no-wait  
show \[bt1 bt2 bt3]  
wait 0.25  
bt1/size: bt2/size: bt3/size: dftsize  
show \[bt1 bt2 bt3]  
]  
\`

[18:22](#msg6021815924cd6b60d8288f96)With `dftsize: 64x64 zoomsize: 128x128;32x32`

hiiamboris

[18:25](#msg60218235a0246860dc3da9fa)So it zooms in for 1/4 sec when you hover over it?

ldci

[18:26](#msg602182641ed88c58d82be7d7)Yep when I click on base facet :)

hiiamboris

[18:27](#msg602182749d5c644f665bc731)I see ;)

ldci

[18:27](#msg6021828184e66b7f7ede1cbe)Rather funny

greggirwin

[19:17](#msg60218e59aa6a6f319d12e727)@x8x can you confirm the download link problem?

## Tuesday 9th February, 2021

mikeyaunish

[15:29](#msg6022aa48063b6c68d54c3afd)Now that Direct Code is working I have a very bizarre error that I'd like to report.  
Load up: \[Direct Code](https://github.com/mikeyaunish/direct-code)  
Then within Direct Code, Open the GIST: \[find-in-array-BUG.red](https://gist.github.com/mikeyaunish/893e71ee6964eab977530a7269172341)  
Confirm proper operation by editing the green 'Hello' base with the Object Editor - and modifying the offset with the green arrows.  
Create the error by commenting out the 'print ""' statement at line 17 then try modifying the object again with the green arrows.

hiiamboris

[15:45](#msg6022adfe063b6c68d54c44a3)!\[](https://i.gyazo.com/a2dc3bcb20c75c5c00d0fe3084be8826.png)  
where do I find object editor and green arrows?

mikeyaunish

[15:50](#msg6022af3f4f7d1b68e53fb519)@hiiamboris middle click on the green box or mouse over green box and press 'control tilde' then the Object Editor will open up - you will see 'green arrows' there.

hiiamboris

[15:53](#msg6022afe6a0246860dc4092ab)Found it after ctrl~, thanks. Though it was only 10px sticking out of the taskbar

[15:54](#msg6022b02a4f7d1b68e53fb7e5)I don't think I have middle click configured on my touchpad lol

[15:56](#msg6022b0ab0eed905f18a158dd)Works for me either way, with or without `prin ""`

mikeyaunish

[15:56](#msg6022b0b355359c58bf310d24)That's an interesting design consideration - not sure what would make sense on a touchpad. What do you think should be used on a touchpad?

hiiamboris

[15:56](#msg6022b0c3ae4b9b27c1ad3764)right click?

mikeyaunish

[15:57](#msg6022b0fca0246860dc4095e2)After you comment out the prin "" restart Direct Code - by pressing F12 or just close and open it again to see the error.

[15:58](#msg6022b10f9238c531ad34da99)I am running on Windows - so maybe there is some issue there?

hiiamboris

[15:59](#msg6022b14a1ed88c58d82ed6e7)Tried all that, still working.

[15:59](#msg6022b14d9fa6765ef80ac0e2)I'm on W10.

[15:59](#msg6022b15e063b6c68d54c4dea)It's heisenbug, so it's expected that it hides.

mikeyaunish

[16:00](#msg6022b1b484e66b7f7ee115fe)OK - I'll try to narrow it down.

hiiamboris

[16:01](#msg6022b1dc32e01b4f7185ad6e)Thanks

[16:01](#msg6022b1e59d5c644f665ec137)FYI the issue is here https://github.com/red/red/issues/4549

[16:02](#msg6022b1fe0eed905f18a15d3a)But maybe you have found yet another approach to it

mikeyaunish

[16:08](#msg6022b3694f7d1b68e53fc124)It may be. My operation is using reactions heavily. I'll do some more research.

[16:09](#msg6022b3b8a0246860dc409d20)@hiiamboris are you using: Red Build 0.6.4 - 8-Jan-2021/16:47:49-07:00 ?

hiiamboris

[16:09](#msg6022b3ce428d9727dd66615e)Try also using https://github.com/red/red/pull/4529 build to see if it fixes it

[16:11](#msg6022b42c9d5c644f665ec780)Though it's a bit of work to build it properly, considering the bugs surrounding it

[16:11](#msg6022b44a9fa6765ef80aca04)&gt; @hiiamboris are you using: Red Build 0.6.4 - 8-Jan-2021/16:47:49-07:00 ?

No, `Red 0.6.4 for Windows built 28-Jan-2021/14:26:17+03:00 commit #bae0c34` though it shouldn't matter

mikeyaunish

[16:16](#msg6022b555ae4b9b27c1ad43ce)The bug disappears when I run it using: Red Build 0.6.4 - 31-Jul-2020/9:55:01-07:00. I'll try the newest version.

[16:20](#msg6022b657063b6c68d54c5b2a)It runs perfectly now with: Red Build 0.6.4 - 4-Feb-2021/17:06:04-07:00. Thanks for the second set of eyes @hiiamboris

hiiamboris

[16:21](#msg6022b67c32e01b4f7185b987)Well, I expect it will return to haunt you yet ;)

mikeyaunish

[16:40](#msg6022bb0a84e66b7f7ee131bc)I guess as Direct Code continues it will be a bit of a torture test for Red ;) I am good as long as I have a stable version I can play with.

## Thursday 11st February, 2021

hiiamboris

[20:12](#msg60258fc59238c531ad3c4c26)Anyone else getting silly gray background in the new GUI console builds?

toomasv

[20:24](#msg602592669fa6765ef81244cd)I haven't seen. Any specific scenario?

hiiamboris

[20:26](#msg60259312428d9727dd6dc2d1)On every restart

[20:27](#msg602593279238c531ad3c55ed)I'll report it

[20:34](#msg602594ed1ed88c58d83657e3)https://github.com/red/red/issues/4825

Oldes

[21:56](#msg6025a8030eed905f18a90f35)Is this expected?

```
>> parse to binary! "a" ["a"]
== true
>> parse "a" reduce [to binary! "a"]
== false
```

## Monday 15th February, 2021

gltewalt

[04:55](#msg6029fea69337c51bc68930ba)If you add `print` to the `does` block, it blows up. Known?

```
book: object [
        title: author: none
        list-fields: does [print words-of self]
    ]
    book/list-fields
```

[04:55](#msg6029fec19337c51bc68930ec)Vs. `does [words-of self]`

greggirwin

[05:01](#msg602a003d8621811d5879a4bc)Probably \[this](https://github.com/red/red/issues/4552)

gltewalt

[05:13](#msg602a03179337c51bc6893968)Doesn't overflow the stack with `print form words-of self` or `print mold words-of self`

hiiamboris

[09:40](#msg602a41a5a37fc1784c21dd7b)obviously `print words-of self` -&gt; `print [..list-fields]` -&gt; `print [...`

giesse

[10:55](#msg602a530f47585464db7cbe6b)`print` implies `reduce`

## Wednesday 17th February, 2021

9214

[11:58](#msg602d04e493539e23437f0ffe)@gltewalt https://github.com/red/red/issues/4559.

gltewalt

[19:31](#msg602d6f2b9337c51bc6923de7)@9214 lives?

## Saturday 20th February, 2021

gltewalt

[22:16](#msg60318a2fa7fc4b573be97107)This is a little off, it seems

```
>> cd ..
== %/
>> ls
	bin/               	dev/               	srv/               
	boot/              	lib64/             	mnt/               
	lib/               	swapfile           	media/             
	cdrom/             	home/              	proc/              
	run/               	sbin/              	sys/               
	var/               	tmp/               	root/              
	usr/               	lost+found/        	opt/               
	etc/               
>> pwd
%/
>> cd root
*** Access Error: cannot open: %/root/
*** Where: set-current-dir
*** Stack: cd change-dir  

>> pwd
%/root/
```

[22:27](#msg60318cee6825b964d621461b)It's the fact that it reports a working directory as `%/root/`

## Sunday 21st February, 2021

Oldes

[15:13](#msg603278b347585464db91e088)Although I consider as a nice change, that `delete %not-existing-file` now returns `false` instead throwing an error, I still believe, that it \_should_ throw an error, if the file exists and cannot be deleted (rights, locked..).

hiiamboris

[16:06](#msg603284e9dc108172e78fbd75)make a wish ticket (;

Oldes

[17:06](#msg603293189337c51bc69f6a39)\[done](https://github.com/red/REP/issues/99)

greggirwin

[21:05](#msg6032cb008621811d58905600)@gltewalt maybe OS specific. I don't get that problem on Windows.

[21:06](#msg6032cb444c79215749ff7939)There was an old ticket related to this: https://github.com/red/red/issues/1725

## Thursday 25th February, 2021

greggirwin

[03:15](#msg6037165a2a9d4f27f130b2e3)Can someone confirm, and ticket, that `load {%"}` crashes Red. Affects trying to type `file!` values into fields.

toomasv

[04:32](#msg603728686c077b2035751943)Confirmed https://github.com/red/red/issues/4834

greggirwin

[04:33](#msg60372881e0d7284c7358bae7)Thanks.

GiuseppeChillemi

[15:19](#msg6037bfe82a9d4f27f1329736)A draw backed bug arose while testing the redbin save fix:

:point\_up: \[draw-end error: 142213121](https://gitter.im/red/red?at=6037b5136eb766540c22d54f)

hiiamboris

[15:21](#msg6037c065b13524529aadd990)Can you find a way for us to reproduce it?

GiuseppeChillemi

[15:24](#msg6037c1432a9d4f27f1329dad)I suppose you should create an huge random json file and run this script:

:point\_up: \[February 25, 2021 3:57 PM](https://gitter.im/red/red?at=6037baf7cfd9b375cd55af75)

I think the bug is related to the console being frozen for a long time while doing heavy computing and the backend is not receiving some kind of ACK on time.

9214

[15:28](#msg6037c2174821572018fdbae2)@hiiamboris Redbin codec \[goes brrr](https://knowyourmeme.com/memes/money-printer-go-brrr) way too fast and generates torsion fields that interfere with GUI console, as in https://github.com/red/red/issues/4825.

hiiamboris

[15:31](#msg6037c2b727f8804c6bb4be80)haha thanks @9214 that makes sense then :D

[15:48](#msg6037c6ba42f30f75c7c8bd41)Tried 2M strings, can't reproduce.

GiuseppeChillemi

[16:04](#msg6037ca900045466209530a56)Could you give me your 2M strings build script?

[16:05](#msg6037cad942f30f75c7c8cd3e)Maybe the problem depends too from the high variety of data types/length/content in my json bookmarks file.

hiiamboris

[16:12](#msg6037cc6c6c077b203577051c)`b: [] repeat i 2'000'000 [append b rejoin ["aoofhoahohd" i]]`

[16:12](#msg6037cc72e820835296b1b82a)nothing fancy

[16:13](#msg6037ccba4821572018fddf7f)given the size of your bookmarks, you could be operating near the 4Gb RAM limit

[16:14](#msg6037cce748e4d527e809bc19)I just finished testing 5M strings, no problems

[16:14](#msg6037cce90045466209531346)

```
>> loop 5 [probe dt [save/as %111 b 'redbin]]
0:00:18.2836
0:00:09.13954
0:00:08.97996
0:00:08.97397
0:00:09.48476
== 0:00:09.48476
>> loop 5 [probe dt [load/as %111 'redbin]]
0:00:15.0108
0:01:24.0658
0:01:35.6338
0:01:32.5812
0:01:35.375
== 0:01:35.375
```

[16:16](#msg6037cd41b18370540517ff8d)Although manual `recycle` call never returns, so I'm not using it. That smells like a bug btw.

GiuseppeChillemi

[16:20](#msg6037ce44004546620953183b)You do not have a json save / json load phase.

hiiamboris

[16:20](#msg6037ce656eb766540c23383e)I don't

[16:21](#msg6037ce6c6eb766540c233848)You think it's json codec?

GiuseppeChillemi

[16:24](#msg6037cf3db183705405180671)I suppose it is the high number of different data, it could be even parse..... But no, it isn't!

[16:25](#msg6037cf77e0d7284c735a9779)I have tested your code here and the error has been triggered by it

9214

[16:29](#msg6037d060cfd9b375cd55f735)@GiuseppeChillemi what is the output of `about` typed in the console?

GiuseppeChillemi

[16:30](#msg6037d08d2a9d4f27f132cfa0)`Red 0.6.4 for Windows built 25-Feb-2021/1:27:54+01:00 commit #0645c80`

greggirwin

[16:30](#msg6037d09bb13524529aae116d)@GiuseppeChillemi if I give you a data anonymizer, would you run it against your bookmarks and let us use the result to test?

9214

[16:30](#msg6037d0a742f30f75c7c8dfa4)@GiuseppeChillemi alright, what version of Windows are you on?

GiuseppeChillemi

[16:32](#msg6037d10c4821572018fdecce)@greggirwin Hiiamboris script triggers the error too.

[16:32](#msg6037d11242f30f75c7c8e15a)@9214 Windows Server 2012

[16:34](#msg6037d17ee820835296b1cbfb)I am currently testing it on Win10 and I will report.

9214

[16:34](#msg6037d1a127f8804c6bb4ece5)D2D backend on Windows Server 2012. 'nuff said.

hiiamboris

[16:34](#msg6037d1a76eb766540c2343d3)

```
>> loop 5 [probe dt [save/as %111 b 'json]]
0:01:11.1895
0:00:11.2962
0:00:11.6351
0:00:11.9162
0:00:11.6467
== 0:00:11.6467
>> loop 5 [probe dt [load/as %111 'json]]
0:00:29.9287
0:00:28.6335
0:01:29.7587
0:02:36.5228
0:01:28.7192
== 0:01:28.7192
```

(json results on 5M strings in \*same* GUI console)

[16:36](#msg6037d2046c077b203577171a)D2D should work down to Vista I think. Although I suppose server editions may not receive enough bug fixes in graphics area..

GiuseppeChillemi

[16:39](#msg6037d2b8e820835296b1cf18)Also, it is being used in terminal server mode.

[16:46](#msg6037d44fe820835296b1d44a)While I run the test script on Windows 10, I see a second Red icon appearing on the windows bar other than the console one, then it disappears:

[16:46](#msg6037d451b18370540518170d)\[!\[image.png](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/A3oU/thumb/image.png)](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/A3oU/image.png)

hiiamboris

[16:51](#msg6037d578b183705405181ad7)W10 is packed full with heisenbugs, so no surprise

greggirwin

[16:53](#msg6037d5fde820835296b1db35)This won't be fast, but should anonymize Chrome bookmarks.

```
anon: func [val][
	alpha: "aieouAEIOU bcdfghlmprst BCDFGHLMPRST"
	copy/part random rejoin [val alpha] length? val
]
rule: [
	some [
		[{"guid": "} | {"name": "} | {"url": "}]
		st: copy tmp to {"} change st (anon tmp)
		| skip
	]
]
;s: read %bookmarks
;print parse ss: copy s rule
```

[16:56](#msg6037d6bbe820835296b1dd77)Does the problem happen only when running in the GUI console?

GiuseppeChillemi

[17:01](#msg6037d7f442f30f75c7c8fdc3)I run the test script with `do %mytest.r`, so I suppose the second icon is the effect of a second process being run. Then the huge workload blocks the draw engine from removing it. When the append loop ends, the second icon is removed.

[17:08](#msg6037d998e820835296b1e77e)@hiiamboris I have run your cycle 6 times. but I have not initialized the block at each round with `copy`. So the array is increasing its size of 2.000.000 string for each round. While you would expect similar results, the last round takes \*\*19 times\** than the first one.

```
How many times should I loop generate array? > 6
How many times should I loop redbin-save? > 1
generate array: cycle # 1  Time: 0:00:19.7088
generate array: cycle # 2  Time: 0:00:50.4766
generate array: cycle # 3  Time: 0:01:45.3246
generate array: cycle # 4  Time: 0:03:03.3033
generate array: cycle # 5  Time: 0:04:47.9442
generate array: cycle # 6  Time: 0:06:33.0716
save-redbin: cycle # 1  Time: 0:01:28.4641
```

(Note: redbin saved file size is 350MB

[17:10](#msg6037d9f842f30f75c7c904b3)Memory usage is 1,5GB)

hiiamboris

[17:14](#msg6037dafecfd9b375cd561ade)I think it is expected that GC time grows exponentially.

GiuseppeChillemi

[17:16](#msg6037db57e0d7284c735abb63)I have issued a `CLEAR` on the array, it has ended immediately, then a manual `recycle`.. the result is interesting: the console is frozen and I am actually seeing the used memory by the red task going down on a 2MB rate per second. It will take at least 10 minutes to garbage collect everything.

hiiamboris

[17:18](#msg6037dbdb2a9d4f27f132f613)Exactly

GiuseppeChillemi

[17:18](#msg6037dbee6c077b20357738de)(And yes, the second icon is here even without running an external script, just `recycle`)

hiiamboris

[17:18](#msg6037dbfd42f30f75c7c90cdb)I ran out of patience and just killed the console

GiuseppeChillemi

[17:21](#msg6037dca348e4d527e809f3e3)My patience is still here but it is being consumed too by the `recycle` process, I can see it in my inner task manager ;-)

greggirwin

[17:25](#msg6037dda0e0d7284c735ac447):^) It's a good stress test...for us. Decluttering is a big thing here in the U.S., it's the human version of GC.

GiuseppeChillemi

[17:26](#msg6037ddc027f8804c6bb516c9)Well, the recycling has ended and there are still 750MB used. There is no reason for such memory to be allocated as there is just one word set whose block I have cleared.

[17:41](#msg6037e133cdbfc0620c2a96a9)A last run of the script in this live lab test:

`b: copy []` at the start of each loop:

```
How many times should I loop generate array? > 6
How many times should I loop redbin-save? > 1
generate array: cycle # 1  Time: 0:00:18.2067
generate array: cycle # 2  Time: 0:00:35.351
generate array: cycle # 3  Time: 0:00:21.2558
generate array: cycle # 4  Time: 0:00:21.3288
generate array: cycle # 5  Time: 0:00:20.8471
generate array: cycle # 6  Time: 0:00:42.6395
save-redbin: cycle # 1  Time: 0:00:12.7431
```

After this I have run:

```
b: clear head b
recycle
```

Memory is still 132MB while the fresh consolle is 8MB

[17:41](#msg6037e165cfd9b375cd5635c2)Al last one before closing:

```
>> help stats/info
*** Script Error: unsupported type in stats/info get-path
*** Where: get
*** Stack: help help-string  

>>
```

[17:46](#msg6037e25e4821572018fe2a6b)I would write the following bug reports:

1\) The D2D draw backend problem  
2\) The garbage collector keeping structures allocated, (and its low mem freeing rate)  
3\) The double icon being visible under high load  
4\) The stats error.

What about this?

[17:48](#msg6037e2d24821572018fe2c4f)@greggirwin Thank you, I will anonymize my data and send you the file

greggirwin

[17:57](#msg6037e5246c077b2035775da3)Thanks @GiuseppeChillemi.

File a `help` ticket. For the others, we need a simple test case to reproduce. GC issue is probably not a bug. It's designed to run periodically, so as not to stop the world. Allocations are made for Red which can release the memory, but that doesn't mean the OS will reclaim it if it's not needed.

GiuseppeChillemi

[17:59](#msg6037e5990045466209536852)Is there any way to see the inner memory usage which counts the memory areas as seen by Red?

hiiamboris

[18:00](#msg6037e5b0e0d7284c735ae269)1) irreproducible  
2\) 750M after recycle - looks like a bug  
3\) irreproducible, and it's not Red bug

GiuseppeChillemi

[18:23](#msg6037eb0c42f30f75c7c94629)1) I can reproduce it locally and could try help debugging with your assistance  
2\) Agree  
3\) Will do further test on other machines  
4\) ?

greggirwin

[18:30](#msg6037ecb1e0d7284c735afb1b)File a ticket for 4, to help me remember to look into it.

9214

[18:32](#msg6037ed4dcfd9b375cd566244)@GiuseppeChillemi `help stats`. `help` does not support paths that form functions with refinements. The actual issue boils down to:

```
>> :append/only
*** Script Error: unsupported type in :append/only get-path
*** Where: catch
*** Stack:
```

greggirwin

[18:37](#msg6037ee57cfd9b375cd5665af)I just figured that out too @9214.

GiuseppeChillemi

[18:39](#msg6037eef900454662095389fd)So, should still open an issue as a reminder, or it will be solved automatically as it is on theRed development roadmap?

greggirwin

[18:41](#msg6037ef73cdbfc0620c2aca02)Ticket it, noting what the underlying issue is. Then we need to decide if `help` should ignore the refinement part or provide more helpful error information.

[18:42](#msg6037efb2e820835296b23ade)i.e. `help` can check if the path refers to a func.

```
>> type? get first 'help/stats
== function!
```

hiiamboris

[19:16](#msg6037f780e820835296b25b6f)or a func with refinements within an object within a block within a map...

greggirwin

[19:29](#msg6037fa8827f8804c6bb589d5)

```
>>help my-horrible-mess/messier-inside/a-messy-object/process/with

You got yourself into this mess.
```

hiiamboris

[19:44](#msg6037fe1c2a9d4f27f13376e9):D

gltewalt

[20:40](#msg60380b5327f8804c6bb5c549)That's the help message I get all the time

[20:44](#msg60380c384821572018fed216)You can just decide, Gregg. It's your help system.

greggirwin

[20:48](#msg60380d11cfd9b375cd56d604):^)

GiuseppeChillemi

[23:00](#msg60382c2193cc841b20050a21)@greggirwin Your anonymize code running on my bookmarks is frying my CPU, it's an oven and the fan is at full speed. I have had to open the window to let the smoke go out of my room and lower the ambient temperature.

[23:01](#msg60382c5a42f30f75c7ca3d0b)I can't even understand if it is running because the console is frozen!

greggirwin

[23:14](#msg60382f4fcdbfc0620c2bacb8)I was afraid that might happen. Go ahead and kill it if needed. When I need big test data I can just dupe my 5M file a bunch of times.

[23:14](#msg60382f6993cc841b200513cc)If it's still smoking, it's still running. ;^)

GiuseppeChillemi

[23:16](#msg60382fb26c077b2035786b76)I was joking to let you know I am already at work using it. It could even run the whole night. Tomorrow morning I have just to remember to make a manual `SAVE` on `ss:` otherwise I will loose the work.

greggirwin

[23:17](#msg60382fee0e6b5b2b731d93a8)It's a good stress test. And people will just think Etna leaked into your computer.

GiuseppeChillemi

[23:20](#msg603830cb2a9d4f27f1342258)There is a race for the TOP here: go Red, go go go! You are reaching Google Chrome memory usage level! Another million of CPU cycles and memory allocations and you will have surpassed it!

[23:20](#msg603830ce42f30f75c7ca484f)\[!\[image.png](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/LLLQ/thumb/image.png)](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/LLLQ/image.png)

greggirwin

[23:25](#msg603832016c077b2035787103)I hoped by changing the part to the same size content (did just `random` on the first pass but wanted to provide more anonymity) it would lighten the load by not having to shift the big string.

GiuseppeChillemi

[23:29](#msg603832c7cfd9b375cd574fb2)I have 2 CPU cores, I am running another instance of the script with `RECYCLE/OFF` and let see if it will be placed on the second core and if it will surpass the first one.

## Friday 26th February, 2021

GiuseppeChillemi

[08:46](#msg6038b57db5131f4f28da0efa)@greggirvin  
Tomorrow the code was still running. I have checked on a small part of the original file on another instance and I have discovered the little modification I have made to you script was causing a problem. I have restarted it, In few our we will receive the result (I hope).

[08:49](#msg6038b628823b6654d26c0462)In the meantime, I ask: why the Red console is not immediate as Rebol one? If I run a heavy inner computation and I print something in the loop, the console is not updated.

hiiamboris

[08:55](#msg6038b783d74bbe49e0bc9989)Perhaps because GUI console too slow to let every every `print` refresh it.

[09:07](#msg6038ba4422a5ce4a911c2019)Or because calling `do-events` from every `print` is likely to hang in a lot of cases. And since GUI console is a regular View window it has no other way to update itself in current design.

GiuseppeChillemi

[10:26](#msg6038ccde457d6b4a948bc1b1)This complicates debugging a lot. I have added some print code in the middle of the test loop but nothing has been printed on screen until the end of the loop which took place after many hours.

hiiamboris

[10:32](#msg6038ce4c95e23446e4faaf4a)Perhaps you should learn `do-events/no-wait` command then ;)

GiuseppeChillemi

[11:28](#msg6038db5d5d0bfb4e5871eea5)Ohhh, food for my mind!

greggirwin

[18:15](#msg60393ad1e5f1d949d466f885)Thanks for the update @GiuseppeChillemi. What was the change you made that caused the problem (so I don't make the same mistake)?

GiuseppeChillemi

[18:38](#msg6039402eb5131f4f28dbb138)You would never make such an error: I have put a counter increment as the last value of the `anon` function, forgetting it was used by the parse routine. In this situation, each match in parse would be set to "none".

[18:42](#msg603940f9d74bbe49e0be3896)The anonymization has ended after 9 hour, but I have got a surprise:

```
>> do %prj-bookmarks/anonymize.r
DT Result: 9:17:36.5448
>> write %definitive.txt ss
*** Internal Error: not enough memory
*** Where: write
*** Stack:
```

[18:42](#msg60394104823b6654d26da9c2):-(

[19:07](#msg603946e6120cd84f78de60a8)I am redoing everything from scratch. tomorrow morning the anonymization process will end. It will try to append one char at time in the output file, traversing the whole string. Very slow but it is the only non memory consuming thing to do. \[EDITED]

hiiamboris

[19:08](#msg60394716d74bbe49e0be4984)Some persistence ;)

greggirwin

[19:21](#msg60394a54d74bbe49e0be52a0)I make mistakes like that all the time. :^) Sorry it failed at the critical moment.

It could write in chunks, when it finds things to anonymize, and buffer skipped chars to write out.

GiuseppeChillemi

[19:28](#msg60394bd8e562cf54ac862e6e)Well, what could have caused the out-of-memory error? No contiguous chunk of memory to allocate in the OS or something else? I hope the answer is not the former...

greggirwin

[19:34](#msg60394d30823b6654d26dcb2e)I wonder if you could have written it a bit at a time.

gltewalt

[19:36](#msg60394dbe5d0bfb4e587342eb)Advantage to doing a git repo, even if it's an experiment or a toy - If you commit and push each step, you can roll back

[19:37](#msg60394de7d74bbe49e0be5d9c)And even if you don't roll back, you know things were working before the last time you commited something, so you know what section the problem is

[19:40](#msg60394eaad1aee44e2daf0225)Or TDD. But no thanks on that

GiuseppeChillemi

[19:52](#msg6039517ad74bbe49e0be671f)I would call the repository "perseverance".

[23:33](#msg6039854ae562cf54ac86d7df)@greggirwin Some discoveries while waiting for completition:

I have made some optimization and tried on smaller chunks of the bookmarks file: 10.000 and 500.000

(`recycle/off`)

Base Rule

```
rule: [
    some [
        [{"guid": "} | {"name": "} | {"url": "}]
        st: copy tmp to {"} change st (anon tmp) ;skip
        | skip
    ]
]
```

Time = 1

Optinimization on first char with repetition numbers:

```
rule2: [
	some 
     [
       1 {"} 1 [{guid} | {name} | {url}] 1 {": "}
        st: copy tmp to {"} change st (anon tmp) ;skip
        | skip
    ]
]
```

-15% on 10.000 characters  
\-18% on 500.000 characters

No repetition numbers

```
rule3: [
	some 
     [
       {"} [{guid} | {name} | {url}] {": "}
        st: copy tmp to {"} change st (anon tmp) ;skip
        | skip
    ]
]
```

-45% on 10.000 characters  
\-18% on 500.000 characters

It seems that on short runs, setup time is relevant for parse

Also an interesting discovery:

Average time A on 100.000 characters: 1 - 00.00.00.20  
Average time B on 1.000.000 (10x) characters: 30x - 00.00.06.00

The full file is about 90.000.000 characters so you expect parse would take the time for 1.000.000 characters multiplied by 90, so 00.00.06.00 x 90 = 540 seconds. Instead it takes 9 hours - 32.400 seconds, which is 60 times than the expected.

Something is increasing parsing time exponentially.

[23:40](#msg6039870b44f5a454a440191d)Waiting for the anonymization to complete to send the file to you. We have a lot of interesting discoveries here.

## Saturday 27th February, 2021

gltewalt:matrix.org

[00:46](#msg60399662a3a2f04f1fbe8712)What kind out output are you looking for?

GiuseppeChillemi

[07:15](#msg6039f1aed74bbe49e0bff49a)@gltewalt:matrix.org I have not understood your question

[07:16](#msg6039f1ded74bbe49e0bff4f7)OGM Red is not here and the file is 5% of what it should be.

Oldes

[08:01](#msg6039fc50120cd84f78e02b6a)I think that if you want to process big file like that.. you should not try to modify the data using `change` in the parse rule but instead build a new data using `append`... ideally writing the new data into file directly and so save some memory.

GiuseppeChillemi

[08:05](#msg6039fd4c457d6b4a948f00c5)I have \*moved to Rebol\*, the file is here:

Start: 8:54:21  
End: 8:54:30

9 Seconds VS 9 hours: 3600 times faster! :-(

https://drive.google.com/file/d/1WIv2BeqYEdRJIsNmJxl\_CD-qr9yNpZGp/view?usp=sharing

I hope all of my work of the past 2 days will help Red reach these speed levels and debug the other issues.

Oldes

[08:06](#msg6039fd8422a5ce4a911f8da1)Also I wonder if there was already fixed the `to end` performance issue.. it wad reproducible in simple one liner.. so no need of huge data.

[08:07](#msg6039fdbe120cd84f78e02ec9)I'm just on mobile.. so hard to search for it.

GiuseppeChillemi

[08:47](#msg603a071ae5f1d949d468fbd4)The file I have sent was saved from Rebol, so it is ANSI and not UTF8. I have converted it using ultra edit (finding also a bug in this editor) but Red `Load/as xx 'json` returns an `error?` value as result.  
Does the json codec suffer if it finds spurious chars in strings?

hiiamboris

[09:23](#msg603a0f76d2619a4f2e0e650d)`read` working?

GiuseppeChillemi

[09:53](#msg603a16af823b6654d26fcf18)@hiiamboris Yes, it loads the file as a string.

pekr

[09:55](#msg603a16fde5f1d949d469213e)@GiuseppeChillemi Parsing that file takes Red 9 hours vs 9 sec using Rebol?

GiuseppeChillemi

[09:55](#msg603a1707d71b6554cd0cddf0)I feel like I have opened a can of worms.

[09:55](#msg603a170ce8267a46f2dd787a)@pekr yes

hiiamboris

[09:56](#msg603a1735d71b6554cd0cdeac)I also noticed that Parse's `change` is inexplicably slow.

pekr

[09:58](#msg603a17b0d2619a4f2e0e7dc5)There has to be bug somewhere, or we've got a problem then. I have always sold Rebol's parse as really fast parsing tool. Maybe we need fast-parse then, the same way we've got fast-lexer :-) But parse is already R/S code, isn't it? Is there really technically a reason, why it should be that slow, when we claim, that R/S code is around of 4-6 times slower than C and hence Rebol itself?

GiuseppeChillemi

[09:58](#msg603a17bbe5f1d949d46923c5)In Rebol I have used this code:

```
anon: func [val][

;RED    
;alpha: "aieouAEIOU bcdfghlmprst BCDFGHLMPRST"
;xx: copy/part random rejoin [val alpha] length? val

    xx: random val
    change/part st xx en
]

rule3: [
	some 
     [
       {"} [{guid} | {name} | {url}] {": "}
        st: copy tmp to {"} en: (

        ;Uncomment for debugging. It shows the string before and after the first 
catch position
        ;probe copy/part skip st -20 skip st 20

        ;Checks for empty string "", otherwise anonymize 
        if (index? st) < (index? en) [anon tmp]

        ) skip
        | skip
    ]
]

source-file: %bookmarks
s: read source-file

ss: copy s 

parse/all ss rule3
```

pekr

[09:58](#msg603a17d4b5131f4f28dddeb4)Beware - my understanding of the low level stuff is limited. That's also I can find it likely, that there is some real room for improvements or solving the edge cases.

[09:59](#msg603a17fcd2619a4f2e0e7e45)Could you use something else than change?

GiuseppeChillemi

[10:00](#msg603a1843e8267a46f2dd7c0b)I could try to use CHANGE as separate function than PARSE one, like I have done in Rebol.

hiiamboris

[10:01](#msg603a189644f5a454a441703f)doesn't look like you have `en` defined by rule3

GiuseppeChillemi

[10:03](#msg603a190f22a5ce4a911fd790)@hiiamboris please, take a look now ;-)

hiiamboris

[10:12](#msg603a1b19120cd84f78e07de5)I'll report this issue. We've discovered it with @toomasv quite a while ago anyway.

GiuseppeChillemi

[10:25](#msg603a1e12e5f1d949d469348b)I am currently using my Rebol version on Red, it was very quick on 1MB part but it is still running on a 90MB one.  
There are multiple issues causing an amplification effect.  
I will try to build some polished test scripts.

hiiamboris

[10:26](#msg603a1e5522a5ce4a911fe53e)https://github.com/red/red/issues/4836

GiuseppeChillemi

[14:00](#msg603a5081d1aee44e2db197d7)@hiiamboris Three hour ago I have run a Red version of the Rebol Script and it is still running. There is more than just a `change` in `parse`. I will investigate and report.

[16:17](#msg603a70a544f5a454a4425dd0)On garbage collector: https://github.com/red/red/issues/4837

greggirwin

[19:23](#msg603a9c29d1aee44e2db272bc)Thanks so much @GiuseppeChillemi. These are really important bugs. Changing data in place should be fine. Of course it will have a big impact if you have allocations due to expansion; but if the size stays the same it should be fast and efficient.

GiuseppeChillemi

[19:34](#msg603a9ebd44f5a454a442e28b)I have some more juice... (give me few minutes!)

greggirwin

[19:45](#msg603aa175e562cf54ac89ad0a)I'll need to fix the ANSI issue here to load your test file in Red.

GiuseppeChillemi

[19:46](#msg603aa1aca3a2f04f1fc1534f)I have a new dataset

greggirwin

[19:47](#msg603aa1e8823b6654d27145b2)I see the bug you mean in UE. No Unicode save option with this file.

[19:48](#msg603aa213e5f1d949d46a9a97)Will await your new dataset if it's UTF-8. :^)

GiuseppeChillemi

[19:50](#msg603aa27244f5a454a442ee9e)https://github.com/red/red/issues/4840

[19:50](#msg603aa2885d0bfb4e5876beb5)Direct link to the dataset: https://drive.google.com/file/d/11eqFwcWZE\_iQxE4WtGmLSZjIbw0s1P65/view?usp=sharing

[19:50](#msg603aa29eb5131f4f28df659b)\*\*(Note: load/as 'json returns error! in Red, use READ)\**

[19:52](#msg603aa2efd74bbe49e0c1dbeb)&gt; I see the bug you mean in UE. No Unicode save option with this file.

Yeah, this file has really been a can of worms!!!

greggirwin

[20:02](#msg603aa54ce562cf54ac89b56c)The funny thing is that sync metadata field is half the file, so it's ~45M, as a single string, on a single line. Really Google?

GiuseppeChillemi

[20:06](#msg603aa637d71b6554cd0e702e)Yes, it is :-D

greggirwin

[20:09](#msg603aa6fcd2619a4f2e100ee3)Step one might be to make the JSON error location more informative. It's not helpful at all right now.

GiuseppeChillemi

[20:17](#msg603aa8e25d0bfb4e5876d005)@greggirwin It is really important to have the read offset of the error

greggirwin

[20:24](#msg603aaa79e562cf54ac89c17e)Agreed.

[21:33](#msg603abac6d1aee44e2db2bb04)@GiuseppeChillemi the randomization causes problems because of backslash escaped chars in the source JSON. e.g. line 490.

[21:36](#msg603abb46457d6b4a94910c4c)What we should probably do to anonymize it is use only a safe subset of chars, which don't require escaping, rather than randomizing the original content.

gltewalt

[21:43](#msg603abd0895e23446e4ffd99e)like nothing but "\*"

[21:57](#msg603ac044e562cf54ac89f946)error messages get printed to terminal if I start my compiled program from the command line. Should they be?  
It can be alleviated by wrapping the error producer in attempt, but.. just wondering

GiuseppeChillemi

[23:24](#msg603ad497120cd84f78e26dc8)@greggirwin et all  
Would you please test this: https://gist.github.com/GiuseppeChillemi/0f67922e5b5c76cff445c3c38b103987  
Maybe I have found a bug on DT

Here is the output I get:

```
Start Time: 27-Feb-2021/23:54:51+01:00
"-- start read file--"
Source-size:  91265933 Characters to-scan:  1000 time: 0:00:00
"-- start read file--"
Source-size:  91265933 Characters to-scan:  10000 time: 0:00:00.0040034
"-- start read file--"
Source-size:  91265933 Characters to-scan:  100000 time: 0:00:00.064964
"-- start read file--"
Source-size:  91265933 Characters to-scan:  500000 time: 0:00:01.17734
"-- start read file--"
Source-size:  91265933 Characters to-scan:  1000000 time: 0:00:04.99314
"-- start read file--"
Source-size:  91265933 Characters to-scan:  2000000 time: 0:00:23.0888
"-- start read file--"
Source-size:  91265933 Characters to-scan:  3000000 time: 0:00:53.2765
"-- start read file--"
Source-size:  91265933 Characters to-scan:  4000000 time: 0:01:49.5493
"-- start read file--"
Source-size:  91265933 Characters to-scan:  5000000 time: -23:57:10.2192
(halted)
```

The last negative value would to be there.

\*EDIT: I have just noticed I have passed midnight, maybe it is caused by `DT` not recognizing this? If someone confirm we have "the cinderella bug"* :-)

[23:26](#msg603ad50be8267a46f2df73c6)Note: dataset address is located inside the script header

[23:31](#msg603ad63c457d6b4a94914b55)https://github.com/red/red/issues/4842

[23:56](#msg603adc3422a5ce4a9121db22)I have made a little update to the gist: modify `use-change: true` to `false` to obtain the `find` speed without `change`.  
Code is compatible for both Red and Rebol

## Sunday 28th February, 2021

GiuseppeChillemi

[00:09](#msg603adf52d74bbe49e0c26900)I have tested \[the script](https://gist.github.com/GiuseppeChillemi/0f67922e5b5c76cff445c3c38b103987) on Red and Rebol. With`use-change: false`, on pure `find`, speed result is Rebol being 5x faster on the average, peaking at 6x

Red:

```
Source-size:  91286172 Characters to-scan:  5000000 
time: 0:00:01.06039
```

Rebol:

```
Source-size:  91331302 Characters to-scan:  5000000 
time: 0:00:00.156
```

[00:13](#msg603ae00c823b6654d271d93a)Enough for today, good night to everyone. See you tomorrow.

[00:27](#msg603ae38cd74bbe49e0c27385)@greggirwin  
&gt; @GiuseppeChillemi the randomization causes problems because of backslash escaped chars in the source JSON. e.g. line 490.

If you explain me which are the combination to avoid I will change the randomizer to be json compatible, redoing the randomization a forbidden combination is found in the generated string.

Also, I want to randomize URLs maintaining the length of each segment, the characters `:`, `\` and what is before the first `:`. I will change only numbers with numbers and alphabetic characters with other of the same type (Am I missing something?)

greggirwin

[00:52](#msg603ae93dd1aee44e2db3299a)One of them had an extra double quote in the middle, and `/` is a problem. If you just use alpha chars, it should be fine.

[00:53](#msg603ae975d74bbe49e0c28185)I submitted a PR to improve the JSON error information.

GiuseppeChillemi

[00:59](#msg603aeaf195e23446e400460a)Can't sleep...

[01:00](#msg603aeb1fa3a2f04f1fc20a76)Do we have a function or a parse rule to test if an url is a valid one?

[01:00](#msg603aeb40823b6654d271f498)Also, which is the solcatiin of such tests in Red source?

greggirwin

[01:06](#msg603aec9e120cd84f78e2a3d8)I don't know what "solcatiin" is, but `url-parser` used by `decode-url` is probably what you're after.

GiuseppeChillemi

[01:10](#msg603aed965d0bfb4e587772ae)LOL, thank you auto corrector!

[01:10](#msg603aeda35d0bfb4e587772b5)Also, which is the LOCATION of such tests in Red source?

greggirwin

[01:22](#msg603af04fd1aee44e2db33679)%environment/networking.red

GiuseppeChillemi

[09:19](#msg603b600622a5ce4a91231a7f)@greggirwin However, I think that the giga sync string is there on purpose, to hide any information that could be extracted about their internal data structure.

gltewalt

[18:05](#msg603bdb4f95e23446e402bd2b)Can't `form` a block with `,` or `\` words in it. How do I handle this?

[18:05](#msg603bdb6ce8267a46f2e23441)invalid character in transcode

hiiamboris

[18:06](#msg603bdb8f120cd84f78e516e3)`,` and `\` are no words

gltewalt

[18:07](#msg603bdbe8d2619a4f2e1322a8)values

hiiamboris

[18:16](#msg603bde07a3a2f04f1fc489f9)what kind of values?

gltewalt

[18:17](#msg603bde35e5f1d949d46dbaf2)`[one, two three\]`

hiiamboris

[18:17](#msg603bde43b5131f4f28e29417)it's a string not a block, right?

gltewalt

[18:17](#msg603bde4844f5a454a4461a0c)Block

hiiamboris

[18:17](#msg603bde53120cd84f78e52200)no it's not

gltewalt

[18:18](#msg603bde66a3a2f04f1fc48af3)That's not a block up there?

hiiamboris

[18:18](#msg603bde8ae562cf54ac8ccfa3)I see a string, unloadable

gltewalt

[18:21](#msg603bdf3ea3a2f04f1fc48cb5)I see a block with 2 weird words and one normal word. Only they aren't legal

[18:23](#msg603bdfbe22a5ce4a91247dd4)I guess we just can't deal with that, since illegal

[18:35](#msg603be25bb5131f4f28e2a201)err, two illegal words and one normal word

## Monday 1st March, 2021

greggirwin

[02:31](#msg603c51e9b5131f4f28e3ba1c)@gltewalt there's valid Red, and there's everything else.

With the fast lexer, we lost `load/trap`, at least for now, but you can \[roll your own](https://gist.github.com/greggirwin/91dc025b1c25b9efc24996af0207bde2). @toomasv has a tweaked version as well, depending on your needs.

```
>> show-nice-trap-info load-trap "[one, two three\]"
So far I loaded 0 values 
The last of which are  [] 
But I stopped parsing after "one" 
On line 1 
Where I thought I found a word! 
But then saw ", two three\]"
```

[02:34](#msg603c52aa5d0bfb4e587b16a8)A fun experiment will be to try loading \*anything\*, sifting the good from the bad, and seeing how it might be useful. From there we can look at the most common unloadable patterns, especially in automated texts, and suggest `pre-load` patterns people could use on their non-Red data that would make it Red friendly.

gltewalt:matrix.org

[02:42](#msg603c549ed2619a4f2e145a4d)Yep I tried load/trap first off, but it no worky

[02:43](#msg603c54b8d2619a4f2e145a8c)I'm guess most common non loadable would be comma

[02:44](#msg603c55145d0bfb4e587b1d47)That does sound like a fun thing to explore.

## Friday 5th March, 2021

zwortex

[10:56](#msg60420e64e5f1d949d47db2ad)Hello. The following opens up the window on the top-left corner of the screen, however the window's position includes the title bar (on Windows 64). Is it normal ?

Furthermore, the button position is -1x-1. Same question.

```
view/flags/options [
    origin 0x0
    at 0x0
    button "click to close" [
        print reduce [
            "button/offset:" face/offset ; -1x-1
            "window/offset:" event/window/offset ; 0x0
        ]
        unview
    ]
][] [offset: 0x0]
```

hiiamboris

[11:12](#msg60421205e562cf54ac9df1cd)yes, it's by design

zwortex

[11:16](#msg60421316e5f1d949d47dbd1c)Hi hiiamboris, how do I compute the screen position of a widget then ?

[11:29](#msg6042162ad71b6554cd22a5ec)Maybe I should rephrase. My question was : the window's position does not include the title bar.

[11:56](#msg60421c70d1aee44e2dc6eab7)I have further issues with window's offset

[11:57](#msg60421c92e8267a46f2f361f2); Here, the offset of the window opened when clicking on "Window", is shifted by -1x-1 once opened (at least when calling window/offset)

```
view [
    button "Window"
        [
            pos:  ( event/offset + face/offset + event/window/offset )
            print reduce [
                "w2/offset:" pos
            ]
            view/flags/options [
                button "Close" [
                    print reduce [
                        "w2/offset:" event/window/offset
                    ]
                    unview
                ]
            ][
                ;no-title no-border no-buttons
            ][
                offset: pos
            ]
        ]
    button "Close" [ unview ]
]
```

[11:57](#msg60421cbad1aee44e2dc6eb8c); Here, the position of the window opened when clicking on "Window" button is not the mouse position. Should it not be so ?

```
view [
    button "Window"
        [
            pos:  ( event/offset + face/offset + event/window/offset )
            print reduce [
                "w2/offset:" pos
            ]
            view/flags/options [
                button "Close" [
                    print reduce [
                        "w2/offset:" event/window/offset
                    ]
                    unview
                ]
            ][
                no-title no-border no-buttons
            ][
                offset: pos
            ]
        ]
    button "Close" [ unview ]
]
```

hiiamboris

[12:00](#msg60421d64a3a2f04f1fd5dbc8)&gt; Maybe I should rephrase. My question was : the window's position does not include the title bar.

It's a known design issue. Both offsets (of client and non-client area) are useful, but there's only one `offset:` facet. I raised the question in https://github.com/red/red/issues/4270 but didn't receive an answer.

[12:03](#msg60421df695e23446e413f637)I was using routines on Windows: https://gitlab.com/hiiamboris/red-view-test-system/-/blob/master/sys-ui.red#L8

[12:07](#msg60421f1f22a5ce4a9135b0af)&gt; Here, the offset of the window opened when clicking on "Window", is shifted by -1x-1 once opened (at least when calling window/offset)

How do you know that about -1x-1? This code does not seem to illustrate it.

[12:08](#msg60421f2fd1aee44e2dc6f1a9)&gt; ; Here, the position of the window opened when clicking on "Window" button is not the mouse position. Should it not be so ?

Looks like a bug to me

[12:10](#msg60421fb65d0bfb4e588b33ae)I see what you mean by -1x-1. It is random between 0x0 and -1x-1. And it's a rounding error. Not a bug.

[12:20](#msg604221fee5f1d949d47ddef9)Perhaps all faces should include sizes of all borders, but it's not gonna be very useful until floating point pairs are implemented.

zwortex

[12:33](#msg60422536b5131f4f28f3e70a)Leaving the -1x-1 apart, if windows offset is the client area top-left corner in the screen, examples 1 and 3 are bugs :  
1- should display the client area at 0x0 and not have the client area shifted to account for the title bar  
3- should display the client area exactly at the same position whether there is a title bar or not

If window offset is not the client area top-left corner but the window top-left corner, it should be possible to know the client area offset, maybe adding an intermediate pane for the client-area.

As in any case, it should be possible to get any face absolute position within the screen.

hiiamboris

[12:42](#msg6042273ce8267a46f2f37e43)I agree. Should you have any ideas on how to solve it and make everyone happy, share them, we'll be listening ;)

zwortex

[13:02](#msg60422bc9457d6b4a94a527d6)I laid before you examples of behaviours that look strange to me. Either you tell me, raise a case, maybe several, or that's the way it is, so be it. Your latest answer is in between and leaves me confused. What shall I do : raise a case, several or not ?

hiiamboris

[13:05](#msg60422c83e5f1d949d47dfaec)Like I said, client/non-client problem is known, rounding error too, and they're waiting design decisions. But example with borderless window shows a bug.

zwortex

[13:09](#msg60422d8222a5ce4a9135dc16)Bordless window ok, but what about the initial offset of a window that is interpreted differently at the screen border : in case 1, without the title bar, and in case 2 with the title bar.

hiiamboris

[13:23](#msg604230d8e5f1d949d47e02ec)I think you misinterpreted your own code. `( event/offset + face/offset + event/window/offset )` returns position on the screen that's one titlebar higher than you think it is. That's why your borderless example shows window higher too. And I take my words back - it's a not a Red bug, it's your bug.

zwortex

[13:27](#msg604231d422a5ce4a9135e6b5)Then initial windows offset refer to the total window with the title bar (without the border), not to the client area. In which case, why in 2, it looks refering to the client area. It is either one case or the other. This is what gets me confused.

hiiamboris

[13:28](#msg604231feb5131f4f28f40c54)Yep. "Total" window. Or \*offset of non-client area of the window\*.

[13:31](#msg60423296a3a2f04f1fd615e8)Like I said, think again on the result of `( event/offset + face/offset + event/window/offset )`. You miss by a titlebar, then Red missed by a titlebar and it \*looks like* none of you missed. But it's not the case ;)

zwortex

[14:09](#msg60423b895d0bfb4e588b7f67)ok - everything trickles down to window/offset that is not reporting the client-area offset but the window's offset (your non-client area) and therefore, there is this gap of the client-area offset within the window that prevents computing the screen absolute position of a widget, or of a mouse event. Surely, this should be a bug ? Maybe re-open/extend #4270.

hiiamboris

[14:14](#msg60423cbcd2619a4f2e24efa2)Would you rather have `view/options [] [offset: 0x0]` open your window with titlebar \*outside* the visible screen?

zwortex

[14:20](#msg60423e13d1aee44e2dc749b8)I am fine with the window's offset being what it is. But I am not fine with the fact that I cannot compute the absolute position of a widget or a mouse event within the screen, unless I correct the window's offset by adding up the title bar height, which I have no means to know for sure.

hiiamboris

[14:30](#msg6042406eb5131f4f28f437b4)Right.

[14:32](#msg60424103e5f1d949d47e2947)That's why I said you're welcome to propose a solution.

zwortex

[15:53](#msg604253ffb5131f4f28f4712a)This is a tough question. I remember you told me once I should be well versed in Red language, and the underlying implementation, before to even start suggesting any sort of improvements. Anywhay, as I said, I need to know the client area offset relative to the window's outer-box. The way you provide me with that information is your business. If I have a hierarchy of faces, then when I sum up their relative offsets up to the screen, I should get the absolute position of this widget within the screen (the same goes for an event). That's the required invariant. So either you add the missing windows's container, that is the client area, as a sub-face within the window face - but you may find it it is too much just for that requirement. Or you should ensure that window's offset behave like any other offsets, that is that it refers to the client area and not to outer box. Remains the problem you were mentionning of positioning the entire window within the screen, to which I may suggest to add a view option, for instance screen-offset, that would allow positioning the entire window into the screen and not just the client area. What you do about adornation, border and whatever else, should be consistent across all faces. And the same goes with sizing. A more complex, and definitive answer should probably distinguish between inner and outer box, like HTML/CSS does distinguishing between border box and content box.

pekr

[16:00](#msg60425587e8267a46f2f40860)`view [button "ok" [probe system/view/screens/1/pane unview]]`- I don't probably get it - you are able to get the screen resolution, your View window size and offset, so you should be able to calculate those things? Of course if not displaying the top bar does not mess with offsets, etc.

hiiamboris

[16:06](#msg6042572044f5a454a457fbf3)@zwortex we understand all that

zwortex

[16:23](#msg60425af795e23446e414a54e)Then problem settled. Up you go.

hiiamboris

[16:27](#msg60425bd944f5a454a4580bf5)For the record, what's your use case? Why you require screen offsets?

[16:27](#msg60425bfd5d0bfb4e588bdb25)If it's just reinventing context menus, that doesn't count ;)

zwortex

[16:39](#msg60425ec2d1aee44e2dc7aca2)It is a sort of contextual menu, but an extension of it. Anyway, any situation where you need to display a sub-window (popup, information box) at a precise location related to the main window might need the screen location. I guess any communication back and forth with another process might require that as well.

hiiamboris

[16:44](#msg60425fd2d71b6554cd2373f2):+1:

pekr

[17:19](#msg6042682295e23446e414cc9d)But you know the screen location, don't you?

```
>> view/options [button "ok" [probe system/view/screens/1/pane/1/offset unview]][offset: 200x200]
200x200
```

hiiamboris

[17:25](#msg604269a2d1aee44e2dc7ca8b)@pekr window has a title bar

pekr

[17:31](#msg60426af0d71b6554cd239206)So the 0x0 of a window is just a window user area? Not a top left corner including title bar?

Oldes

[17:32](#msg60426b12e5f1d949d47e930c)@hiiamboris isn't `system/view/metrics` the place where info about window title and edges should be available?

[17:32](#msg60426b195d0bfb4e588c0408)@pekr no... it's top left corner of the window

hiiamboris

[18:15](#msg6042754522a5ce4a9136b8ee)&gt; @hiiamboris isn't `system/view/metrics` the place where info about window title and edges should be available?

Possibly. Like borders of each face type. Thought about that. However, this will make it harder to know which window has what borders. E.g. for one window you have full frame, for other it's no-buttons no-title, other window has some alternate frame, etc. So might be more reliable to just put it into the face.

[18:16](#msg6042758344f5a454a45856d7)Still, there's a question: can we know the size of the titlebar and borders \*before* we create the window, or only after that?

pekr

[18:16](#msg60427598d1aee44e2dc7f186)Having edges for the face is a road to hell imo. It needs to be all inclusive, outer border and then margin/paddings defined ....

[18:17](#msg604275ca44f5a454a458572c)Or simply let's copy the CSS model, but face should be a bounding box, no?

hiiamboris

[18:18](#msg604275edb5131f4f28f4d4ed)Well thing is, we do have edges for buttons, panels, windows. But for windows we use the outer edge, for buttons - inner edge, for panel idk need to check. Etc etc.

[18:20](#msg60427668d74bbe49e0d602b6)It's okay I guess, edges can be positive or negative depending on face type.

[18:22](#msg604276f7d74bbe49e0d603c4)Margins imply control over positioning. But we can't position a new button on window's title bar for example. It's out of Red control.

[18:26](#msg604277b9d1aee44e2dc7f73d)Other consideration is do we even need to complicate the current model with borders? Can't we just provide a function that returns any face's position/size \*directly on screen\*? Then we wouldn't have to even traverse the face tree to get one face's position relative to another.

greggirwin

[19:01](#msg60428020d71b6554cd23d053)@hiiamboris @zwortex does the `GetWindowRect` API (at least on Windows) work for this? If so, do other OSs have a similar API?

hiiamboris

[19:19](#msg6042845944f5a454a4587f4f)@qtxie might know

[19:21](#msg604284cb95e23446e4151eda)But whatever. We should focus on how this works on high level

greggirwin

[19:28](#msg6042867922a5ce4a9136ed65)Agreed. A lot of things can be done locally, e.g. highlighting or pointing to faces, but sometimes the global view is useful. e.g. old "spy" tools that let you mouse around and inspect values for any window. That of course opens security questions as well, but other ideas too. e.g. once we have programmatic IPC, a tool might let you hover over a face and see details about it, or imagine a telemetry based tool that's a heat map for user interactions. The UI gathers data, and in our secret lab we can see the UI with hotspots and patterns of use.

## Monday 8th March, 2021

greggirwin

[18:34](#msg60466e3a5d0bfb4e58961bbe)Can someone confirm this problem&gt;

```
>> $
*** Syntax Error: (line 1) invalid money at $
*** Where: case
*** Stack: load 
>> -$
== -$4.00
>> +$
== $4.00
```

hiiamboris

[19:01](#msg60467496d2619a4f2e2fbd90)yep

greggirwin

[19:02](#msg604674a8823b6654d290ce72)Thanks.

hiiamboris

[19:03](#msg604674e5823b6654d290cee4)I wonder where 4 comes from

greggirwin

[19:08](#msg60467616e562cf54aca918a7)Maybe a consistent state from the lexer tied to the nibble based BCD implementation.

[19:15](#msg604677de95e23446e41f1aa0)I'm not going to try to figure out where the problem might be in `load-money` in %lexer.reds right now. :^) OK, I can guess that the lack of a denomination and the sign skipping combine to not see it's at the end of the value and throw an error.

## Tuesday 9th March, 2021

dsunanda

[16:39](#msg6047a4cfe8267a46f201b8f0)Progress bars do not seem to dynamically adapt to being resized, eg

```
view/no-wait [p: progress 200x20 data 0.5]
p/size: 400x20
```

P is now showing 25% complete. Seems to be no way to force View to recognize the change.

hiiamboris

[16:55](#msg6047a89595e23446e4224ad8)I see 2 bugs:  
1\. after doubling the size (200 -&gt; 400), the range multiplied by 6 (1.0 -&gt; 6.0)  
2\. `p/data: integer` does nothing

greggirwin

[19:40](#msg6047cf2e823b6654d2948c3d)Same here, please file a ticket @dsunanda. Good find.

dsunanda

[19:54](#msg6047d284120cd84f78055a1a)@hiiamboris @greggirwin Thanks! Ticket #4850 .... It's a sign that I am actually getting around to testing the resizer utility I trailed a few weeks ago :)

hiiamboris

[20:00](#msg6047d3cc120cd84f78055e8f)in the future please use the provided report template

dsunanda

[20:30](#msg6047dad922a5ce4a9144a068)@hiiamboris Githib did not present me with the template - I was expecting it, looked around for it. But it was not there. Odd.

hiiamboris

[20:35](#msg6047dc0422a5ce4a9144a426)I see. For some time already I feel like Github devs are on their way to success.

[20:37](#msg6047dc95457d6b4a94b41e2b)Along with the rest of MS that is..

dsunanda

[23:16](#msg604801cad71b6554cd322ade):)

## Thursday 11st March, 2021

GiuseppeChillemi

[09:06](#msg6049dd7b95e23446e428ca04)@dsunanda maybe the template is on \[OVH datacenters](https://www.datacenterdynamics.com/en/news/fire-destroys-ovhclouds-sbg2-data-center-strasbourg/)

dsunanda

[09:19](#msg6049e08695e23446e428d125)@GiuseppeChillemi Sentences that made no sense 20 years ago: "My cloud burned down".

You've just prompted me to go look see what I did wrong - turns out I should have clicked the green "Get started" link. That does have the template.

Just gone back and correctly formated the issue.

GiuseppeChillemi

[09:45](#msg6049e6b095e23446e428e29f)At least Four datacenters buildings with no distance from each other. I did better on SimCity 1989 with proper distancing between strategic infrastructure. With just 80Mt distance and interconnection cabling between buildings, it would have not happened. When the BUG is the engineering or the decision-making team.

[09:49](#msg6049e79844f5a454a46bf81b)About the template, I did exactly the same on my first bug report! But, hey, old coders never click on "get started" links, Red team should know this, it's their fault!

greggirwin

[18:32](#msg604a625a22a5ce4a914bdeeb)Blame the UI. It puts that button way off to the right, while the other link is right under what you're reading.

## Friday 12nd March, 2021

dsunanda

[09:10](#msg604b3013e5f1d949d493e2da)What's going on with what looks like some low-grade anti-aliasing in View?

```
view [h1 "red 2020-06-16" box  draw [line 0x0 100x100]]
view [h1 "red 2021-03-09" box  draw [line 0x0 100x100]]
```

!\[](https://i.imgur.com/duDJAP7.png)

hiiamboris

[09:22](#msg604b32c1d1aee44e2ddf9975)I aint got no transparency at all  
!\[](https://i.gyazo.com/e860c6a829210aeec965dcc2f19918a2.png)

[09:22](#msg604b32cf457d6b4a94bdc4b8)must be D2D regression

ldci

[09:26](#msg604b33c9d2619a4f2e3d53c1)\[!\[image.png](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/lsBG/thumb/image.png)](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/lsBG/image.png)

[09:26](#msg604b33d7457d6b4a94bdc840)on macOS it’s OK

dsunanda

[09:28](#msg604b3454d2619a4f2e3d55ce)@ldci Sorry - should have said seeing under Windows

[09:56](#msg604b3ac9a3a2f04f1feece0c)@hiiamboris There are some much more messed up examples too - what I posted was just the simplest. Reported: #4852

hiiamboris

[09:58](#msg604b3b58823b6654d29e9342)@ldci your 1-line email looks very messy on Github :)

[09:59](#msg604b3b6844f5a454a46fe0ce)@dsunanda thanks!

## Thursday 18th March, 2021

hiiamboris

[19:14](#msg6053a6853a9448256c14d6b1)ANNOUNCEMENT: `about/cc` now will automatically copy the version into the clipboard, saving you from mouse/touchpad aiming exercise ;)

GiuseppeChillemi

[19:16](#msg6053a70d3a9448256c14d856)I am about to like it! (Just the time to download the new version)

greggirwin

[19:28](#msg6053a9ddef43061daa8072e3)Issue template updated to note its use. Thanks @hiiamboris!

dsunanda

[19:38](#msg6053ac253a9448256c14ec19)Is there a way of telling if a fix has reached a build?  
#4852 (jagged anti-aliasing - above) was closed a couple of days ago with status.built.  
But I can see instances of the same problem in the mar18 windows download.

hiiamboris

[20:39](#msg6053ba7f33346c16275f4771)If there's a commit then the recent build has it. Let me update and see...

## Friday 19th March, 2021

dsunanda

[09:25](#msg60546e1d3b9278255bbc9b98)@hiiamboris Thanks - this may be a different bug along the same lines. I'd expect both of these two images to be smooth (though not identical - random is used):

```
view/no-wait compose [h3 (system/build/date/date)
     b: box 100x100 draw [
      pen off fill-pen black spline 100x100 100x50 50x50 50x100
	 ]]
	 repeat w 30 [
	    xx: random length? b/draw
		if pair? b/draw/:xx [b/draw/:xx: random 100x100]
		]
```

!\[](https://i.imgur.com/vSEmtJw.png)

hiiamboris

[09:42](#msg605471f79ebdfd1640845aa9)`Red 0.6.4 for Windows built 18-Mar-2021/22:28:01+03:00 commit #73d9bd2` here and it's smooth and looks identical to the 1st one

[09:43](#msg6054722cc1e10242c5ac72ab)I assume @qtxie also doesn't get this artifact

[09:44](#msg60547269563232374c2d5709)subsequent iterations morph the curve but it's still smooth

bubnenkoff

[11:01](#msg60548478f07ffa1eb550264f)Not sure that it's a bug (the code is not valid)  
But Red hang:

```
a: [b: none]
set a/b "dddd"
```

hiiamboris

[11:08](#msg6054861aac0fd631ca7a2ca3)you're changing the value of `none`

[11:08](#msg60548630c1e10242c5acae83)it's a known thing

gltewalt

[11:08](#msg60548648ef43061daa82d35c)He means this, I think

```
>> set a/b "dddd"
== "dddd"
>> a
== [b: none]
dddd
dddd
dddd
```

[11:12](#msg60548714bc554b42d60e1871)use `set 'a/b "dddd"`

dsunanda

[12:12](#msg6054953ead83ec3d7d3da329)@hiiamboris Thanks - I was using a 3-hour earlier commit (didn't realize we can get more than one build a day).  
But I've just tried....

```
date: 19-Mar-2021/7:34:02
 commit: #7316b75f3454a13bbe9ec5f112b6bc53bdb96cbd
```

....And I am still seeing the jaggies.

hiiamboris

[12:37](#msg60549af8ef43061daa831466)Comment on the issue? Anyway, we can't fix it if we can't reproduce it..

greggirwin

[19:47](#msg6054ffea2beb1e1da3b9ec87)I also don't see jaggies from a 16-mar local bulid.

## Saturday 20th March, 2021

dsunanda

[15:38](#msg605616dcbc554b42d61238de)@greggirwin @hiiamboris Thanks for testing.  
I see the problem on Win10 but not on Win7 - may be (as hiiamboris has suggested) a graphics driver issue. Have added a comment to the issue.

## Monday 22nd March, 2021

ldci

[02:34](#msg6058023533346c162769ea38)Under macOS it’s impossible to update font/color for text-based facets except for area facet.  
2 facets: ar: area and hs2: h2. ar/font/color: red is OK. hs2/font/color: blue raises an error

```
*** Stack: view do-events do-actor do-safe update-font-faces 
*** Script Error: cannot access state in path none
```

dsunanda

[04:03](#msg605817103b9278255bc575f8)@ldci Many facets start with NONE for their font object - so you need to add a font object by hand. This works in Windows - which seems to have the opposite problem to macOS:

```
unview/all view/no-wait [ar: area "AAAA" hs2: h2 "HHH"]
ar/font: make font! []  ;; AREA has no font object in Windows
ar/font/color: red
hs2/font/color: blue
```

hiiamboris

[08:31](#msg605855ce3a9448256c207ace)Just specifying `font-color` inside VID should be enough.

ldci

[08:35](#msg605856b58478e061b950c50d)@dsunanda OK, we can use font-color to initialize font Color. It’s running both for macOS and Windows and a simple print f/font:color confirms that the color is initialized. We really have a bug under macOS. When I want to modify the f/font/color, the facet font is updated but not displayed . This code sample runs under windows but not with macOS.

```
Red [
	needs: view
]
random/seed now/time
view layout [
title "Tests"
	button "Color" [	c: random white 
						ar/font/color: c				;--correct
						ret/text: form t1/font/color	;--OK color updated
						t1/font/color: c 				;--bug macOS
					]
	button "Quit" [quit] 
	return
	t1: h3 "Test" font-color blue ret: field 
	return
	ar: area 100x100 "Test" font-color red font-size 25
]
```

hiiamboris

[08:39](#msg605857d833346c16276ac027)windows has similar issues https://github.com/red/red/issues/3730

ldci

[08:51](#msg60585a97ad83ec3d7d46bbf6)@hiiamboris Thanks. It’s a general problem in this case.

[10:17](#msg60586ed2ad83ec3d7d46f124)@hiiamboris . Perfectly running: Red 0.6.4 for Windows built 16-Feb-2021/9:41:34+01:00 commit #0187423

dsunanda

[15:55](#msg6058bde9f07ffa1eb55a942f)Is this a deliberate design choice? It's off by one compared to Rebol:

```
find "aaa <bbb> ccc" <bbb>
== "bbb> ccc"
```

hiiamboris

[15:57](#msg6058be869ebdfd16408f21e2)looks like an oversight

[15:58](#msg6058bea368921b62f47bdf3b)if `insert ""` forms the tag, so should `find`

[15:59](#msg6058bed8c1e10242c5b732b8)

```
>> find "abc" <b>
== "bc"
```

dsunanda

[16:46](#msg6058c9ecac0fd631ca84c55a)Thanks -- reported. Issue #4860

## Wednesday 24th March, 2021

Oldes

[19:31](#msg605b939e563232374c3fe51d)It looks that `%` cannot be used as a word inside a path:

```
>> o: make object! [%: 1]
== make object! [
    %: 1
]
>> o/%
*** Syntax Error: (line 1) invalid path at o/%
>> get in o '%
== 1
```

hiiamboris

[20:02](#msg605b9ab9ad83ec3d7d4fcb7c)and another bug (note 'word' not 'path'):

```
>> '%/%
*** Syntax Error: (line 1) invalid word at '%/%
*** Where: case
*** Stack: load
```

Oldes

[20:05](#msg605b9b7dbc554b42d6206610)that is not a bug.. (if you don't count that it should be `invalid lit-word`)

hiiamboris

[20:07](#msg605b9c123b9278255bcf3109)it should be valid lit-path

Oldes

[20:08](#msg605b9c2d8478e061b959f599)No.. it cannot be valid lit-path, because than you could not use `%` for files... like in `%/root/`

hiiamboris

[20:08](#msg605b9c38ad83ec3d7d4fcf8f)although.. we're approaching gray area indeed

[20:09](#msg605b9c7aac0fd631ca8c8d18)then we have to agree that `%` cannot be used in paths and that's it

Oldes

[20:10](#msg605b9ca29ebdfd164097227a)It cannot be first part of the path, to be precise.

hiiamboris

[20:10](#msg605b9cb333346c162773c75c)Like paren then

Oldes

[20:11](#msg605b9ceaf07ffa1eb5628192)Not a problem if it's error or not... I was just looking for extreme cases.

rebolek

[22:01](#msg605bb6bf33346c1627741046)it can, just not directly:

```
>> p: make path! [a v c]
== a/v/c
>> insert p '%
== a/v/c
>> p
== %/a/v/c
```

## Thursday 25th March, 2021

gltewalt

[03:16](#msg605c009328e6153d72403f8f)

```
Red 0.6.4 for Linux built 23-Mar-2021/2:29:50-06:00  commit #6378183

>> system/console/do-command

*** Runtime Error 1: access violation
*** at: 08090D7Eh
```

Oldes

[15:06](#msg605ca6edc1e10242c5c20696)Is there any specification of \_suppose to be valid arrow like words\_?

[15:09](#msg605ca7a9c1e10242c5c20886)Because I can create a lot of not handled variants.. just use one of these in console: `<_` ,`<@`, `<#` and many more probably.

[15:11](#msg605ca8103a9448256c2c5780)I would like to also know, if this `<-<-<` should be single word or 3 words as it is now.. simply having some spec what is expected and what not could be useful.

[15:16](#msg605ca9483a9448256c2c5af4)I think, that maybe only words like `<---`, `<===`, `<<=-=-`, `<<<->` or `<->>>` should be valid... but now there is also:

```
>> type? first probe [<=_.]
[<=_.]
== word!
```

gltewalt

[15:31](#msg605cace1a7dfe1372ef8b1e1)This isn't accurate?

[15:31](#msg605cace888edaa1eb8ddbbed)https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#525-word

hiiamboris

[15:42](#msg605caf538478e061b95cd93e)`<_` should be a word, not tag according to that spec

[15:46](#msg605cb04728e6153d7242269a)I'm also using `.<.` as an operator (which is not valid according to the spec)

[15:46](#msg605cb0619ebdfd16409a1a10)And:

```
>> .<.: 1
== 1
>> .<.
== 1
>> load "'.<."
*** Syntax Error: (line 1) invalid tag at <.
*** Where: =
*** Stack: load
```

Oldes

[15:48](#msg605cb0cb28e6153d724228fd)It looks that lexer is somehow undefined in this field :/

```
>> type? load {<-~~}
== word!
>> type? load {<~~}
*** Syntax Error: (line 1) invalid tag at <~~
```

hiiamboris

[15:48](#msg605cb0e5ad83ec3d7d52bd96)what a mess :)

gltewalt

[15:53](#msg605cb20e28e6153d72422d17)Is it a `some` vs `any` issue?

hiiamboris

[15:54](#msg605cb24fac0fd631ca8f7cb2)lexer isn't parse based

gltewalt

[16:12](#msg605cb65cbc554b42d6235c34)https://github.com/red/red/blob/6378183233387d79c0b514511923c6cf51e42691/lexer.r#L544

Oldes

[16:15](#msg605cb7158478e061b95cf24e)@gltewalt that is Rebol version of the lexer (used in compilation).. there is also the new lexer used at runtime, which is not parse based.

[16:16](#msg605cb7579ebdfd16409a2e87)As there are two of them.. I believe that they are most probably out of sync in this mine field (if it's not covered in compilation tests)

gltewalt

[16:18](#msg605cb7e633346c162776cf82)Ah, ok

Oldes

[16:28](#msg605cba1433346c162776d648)I think that fundamental question is, if something like `<=foo` or `<=f&@o` should be valid words (as it is now) or rather not.

[16:37](#msg605cbc3468921b62f486cefa)This is definitely an issue... as one can have `<<<` word, but it's not possible to use it:

```
>> <<<: 1
*** Syntax Error: (line 1) invalid word at <<<: 1
```

[16:57](#msg605cc0dca7dfe1372ef8f46f)

```
red
>> load {:<<<}
== [:< <<]
```

9214

[17:26](#msg605cc7a9563232374c434526)&gt; Is there any specification of \_suppose to be valid arrow like words\_?

\[`docs/lexer`](https://github.com/red/red/tree/master/docs/lexer). https://github.com/red/red/commit/d2230781a9bc58752d63474b13d9480d62d584e8 specifically introduced some support for them.

&gt;

```
red
> >> load {:<<<}
> == [:< <<]
>
```

https://github.com/red/red/issues/4731.

Oldes

[17:46](#msg605ccc7528e6153d72428549)Yes... I had a feeling of a \_Déjà vu_ :o)

hiiamboris

[17:50](#msg605ccd803b9278255bd2849b)it's clear that .txt is outdated and not valid anymore, while lexer state table is probably the very reason lexer is in such a messy state ;)

[17:51](#msg605ccdb69ebdfd16409a7dc8)(because go try to figure out all the sequences of jumps for any given type)

greggirwin

[18:23](#msg605cd51dad83ec3d7d533303)These are important issues to note, ultimately leading to a cleaner spec. From a usability standpoint I'm OK slapping people's hands when they try to use them, as long as we tell them `Here there be Tygers`.

[18:30](#msg605cd6e0ad83ec3d7d5338d3)Angle brackets are already so heavily used that we have to question how clear things will be in dialects that overload them further.

hiiamboris

[18:32](#msg605cd7379ebdfd16409a9b77)arrows are good to have, and possibility to write alternative spellings for &lt; &gt; &lt;= &gt;= is a must

greggirwin

[18:45](#msg605cda5dac0fd631ca8ffa47)I agree that arrows are nice, so it's a matter of clearly defining the rules and weighing the costs.

These are all OK today, correct?

```
>> [<==> <== ==> <= >= <- -> <-- -->]
== [<==> <== ==> <= >= <- -> <-- -->]
```

hiiamboris

[18:47](#msg605cdabdbc554b42d623d1a5)`<-- -->` is a tag I guess, and `<- ->`

[18:48](#msg605cdaed68921b62f48735ed)am no expert on tags though

greggirwin

[18:48](#msg605cdb0f8478e061b95d6a3c)Not according to the current loader, but that's the question. e.g.

```
>> last [<==> <== ==> <= >= <- -> <-- -->]
== -->
>> last [<==> <== ==> <= >= <- -> <!-- -->]
== <!-- -->
```

hiiamboris

[18:49](#msg605cdb243b9278255bd2b3e5)I see..

greggirwin

[18:50](#msg605cdb59a7dfe1372ef94791)Arrow ops can create confusion and limitations with tags, which comes back to the spec and what compromises we make on each side. Ultimately, our goal is to make both sides equally unhappy.

hiiamboris

[18:50](#msg605cdb8d3b9278255bd2b55e)Sure. Just need to draw a clear line between these. And between all datatypes for that matter.

[18:51](#msg605cdbba2beb1e1da3ce3658)Something we could give other people to read.

greggirwin

[18:53](#msg605cdc36563232374c438277)Right. All we can do is mark the traps an pits. When it comes to content in the wild that's where application, context, and dialects apply. If you have content that may be ambiguous, you need to be aware. And while tags are passive content, we don't want to make it easier to create exploits with arrow ops, for example.

Oldes

[19:08](#msg605cdf9828e6153d7242c169)That's why I ask, if it's not better to limit \_arrow words_ to use specific chars only. Namely from `=` `-` and `~` with `<` and `>` of course.

[19:09](#msg605cdfff2beb1e1da3ce4422)It's good that is a tag.. I don't see a reason why `<-- -->` should be tag as well. It's not used anywhere what I know.

[19:14](#msg605ce1102beb1e1da3ce477f)RSP was using `<% %>` and `<%= %>`... PHP has ,  and . All is fine as it does not starts with `-` or `=`.

[19:16](#msg605ce18688edaa1eb8de6201)Btw... when mentioning tags, I still have a feeling that the datatype should be more clever.. not just a string with different decoration as it is now.

hiiamboris

[19:18](#msg605ce21f28e6153d7242cb80)Design actions for it ;)

9214

[19:25](#msg605ce3902beb1e1da3ce4e69)&gt; I still have a feeling that the datatype should be more clever.. not just a string with different decoration as it is now.

https://github.com/red/red/issues/4326#issuecomment-602311890

hiiamboris

[19:28](#msg605ce45868921b62f4875292)I knew he said that somewhere! thanks for digging it ;)

greggirwin

[19:43](#msg605ce7e93b9278255bd2dc17)The problem with supporting tags as they are used in the wild today, but seeing into their structure, is that you are escaping into a different lexical form. If Red treats them as opaque values, you can still process them at the mezz level. They are foreign invaders, just as they are used to infiltrate HTML and escape to script code.

It could be a fun can of worms, and worth mezzing with libs and ideas for anyone who wants to. We can also add a section for it to the Red Should... wiki page.

[19:45](#msg605ce8568478e061b95d9276)But we probably all agree that tags have some issues, e.g. when you're building them, so I'm all for improving their behavior if we can.

gltewalt

[19:54](#msg605cea69a7dfe1372ef97699)What do the bring to the table as a separate type that makes things easier than string! or word! ?

greggirwin

[20:16](#msg605cefa2c1e10242c5c2ef2c)Easier handling of HTML/XML/SGML content, and I often use them to denote placeholders, or like footnotes. They can span lines and contain spaces, so much more than words in that sense.

Oldes

[21:00](#msg605cf9dabc554b42d6242f6c)The biggest issue is, that one cannot play with them in console. Even @hiiamboris `[21:03Although in this case one can at least close the " string and ] block and is back. But try to type in console <@ and hit enter.`

`hiiamboris 21:14maybe mention it in https://github.com/red/red/issues/4744 as a reminder greggirwin 22:15@Oldes that seems more of a console issue. Oldes 22:16Probably.`

``Saturday 27th March, 2021 meijeru 11:09> This isn't accurate? https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#525-word Indeed not, most probably . It is hard to rephrase the actual lexer behaviour in a few readable sentences. Should the behaviour be changed to make the sentences more easy to formulate, or the other way around? I would go for the former, myself. Wednesday 31st March, 2021 dsunanda 19:31Is this a known problem? 2147483637 // 11 *** Math Error: math or number overflow *** Where: + *** Stack: mod hiiamboris 19:37looks like it was dismissed previously https://github.com/red/red/issues/2158 19:38I recommend using https://gitlab.com/hiiamboris/red-mezz-warehouse/-/raw/master/modulo.red instead for Red's modulo is a sack full of bugs 19:40I should add edge cases to the unittest. Thanks for the heads up. dsunanda 19:42@hiiamboris Thanks - old habits die hard - I was converting some Rebol code and kept // rather than % .... % seems to work. Will play with your modulo.red - thanks,again. And I am testing a lot of edge cases right now (that's how I rediscovered the issue).....I'll let you know if I find more :) hiiamboris 19:44Great. Let me know if you find any bugs in modulo.red Friday 2nd April, 2021 Oldes 18:57Is this ok? >> type? '-1 == word! toomasv 19:24Fun: >> set '-1 2 == 2 >> get '-1 == 2 >> minus-one: reduce [to-get-word '-1] == [:-1] >> reduce minus-one == [2] greggirwin 19:57I was going to say we should disallow it. It's not a fast lexer regression though. It doesn't trip up literal values, which is the big concern, but I can certainly see it creating confusion when reading if abused. Disallowing it means scanning the entire number, if we want to allow things like '-1x. Extend that to pairs and you have another area. You can't do it with % in the word though. e.g. '+1% fails. >> +1 == 1 >> set '+1 2 == 2 >> +1 == 1 >> ++1 *** Script Error: ++1 has no value *** Where: catch *** Stack: >> set '++1 3 == 3 >> ++1 == 3 If it's not exploitable when loading data, though it could be used to obfuscate things, what are the biggest problems or downsides? All that said, if it's not used in Red today, we can disallow it for now and not break anything. If someone has a great use for it, that adds value, we can consider that. Oldes 20:47I think it should not be allowed. hiiamboris 20:50'-1 should be an error, '--1 should be a lit-word greggirwin 21:20The general rule being that it can be a word if it can't scan as a number? What about the pair! case? hiiamboris 21:29what about it? There's no lit-pair or get-pair greggirwin 21:31 >> '-1x1 == -1x1 hiiamboris 22:00Should be an error, like before. ' starts a lit-word or lit-path, so '[sign][digit][letter] shouldn't be allowed Tuesday 6th April, 2021 loziniak 09:41Hi. I'm gonna resurrect an [old thread ↑↑↑](https://gitter.im/red/bugs?at=5dab13094bc69e6b6601b19e). @hiiamboris pointed at line 510, where 0 is returned. But Red/System [implementation of quit-return routine](https://github.com/red/red/blob/c5722b6efcd299c46df6469d14d23020bca40d95/environment/routines.red#L17) is: quit status, so returning 0 does not seem intentional to me. Also, I have no idea how could this quit status be "bypassed" or what? 10:09Relevant issue: https://github.com/red/red/issues/4095 hiiamboris 10:10I answered to the ticket. It should be a no-brainer fix. 10:10Just nobody but you cared so far. loziniak 10:11Just noticed it, thanks. I'll try to push a PR. rebolek 10:24What a strange bug: *** Syntax Error: (line 1) invalid float at 10842288.0 11:09Ah, old Red version, seems to be fixed now. loziniak 11:47@hiiamboris it's working, thanks. Thursday 8th April, 2021 loziniak 11:52Hi! Found this: >> to word! "<<<>>>" == <<<>>> >> '<<<>>> *** Script Error: <<>>> has no value *** Where: catch *** Stack: hiiamboris 13:24Fun 13:54opened https://github.com/red/red/issues/4872 Sunday 11st April, 2021 loziniak 10:08thanks! Friday 23th April, 2021 zwortex 22:28The following code makes use of the reactive framework to link a view to an underlying model. It works fine though only if the model field that is modified is assigned using self. If modified with the field, no update is triggered. Cannot understand why. Is it by design ? Cheers. a: reactor [ x: 1 y: "positive" update: function [ val [integer! ]][ x: val y: either val >= 0 ["positive"]["negative"] ; un-comment for triggering the update ; self/y: either val >= 0 ["positive"]["negative"] ] ] view/no-wait [ text react [ face/text: a/y ] button "positive" [ a/update 1 ] button "negative" [ a/update -1 ] button "close" [ unview ] ] Saturday 24th April, 2021 hiiamboris 08:00 >> spec-of :update == [val [integer!] /local x y] zwortex 09:54Thanks. Yeah. I realised that while sleeping. Should have known better. Sorry for the trouble. Still this function function gets me confused. Is there any method function that has better consideration for object fields : not localizing them, while retaining the localization mechanism for other set-words ? hiiamboris 10:43well, function doesn't "know" that it's used inside an object, but let me think... 11:08how about this: Red [] smartobj!: object [ method: func [spec [block!] body [block!]] [ parse body [any [ to [set w any-word!] if (in self w) change only skip ( as switch type?/word w [get-word! [get-path!] set-word! [set-path!] lit-word! [lit-path!] word! [path!]] reduce ['self to word! w] ) ]] function spec bind body self ] ] dumpxy: func ['o] [print [o "x=" select get o 'x "y=" select get o 'y]] context [ x: y: 0 test: make smartobj! [ x: 1 f: method [] [x: 2 y: 2 print ["test/f:" x y]] ] ?? test/f dumpxy test test/f dumpxy test dumpxy self test2: make test [ x: y: 1 g: method [] [x: 3 y: 3 print ["test2/f:" x y]] ] ?? test2/f ?? test2/g dumpxy test2 test2/f dumpxy test2 test2/g dumpxy test2 ] zwortex 11:48Works like a charm. A smart object that is auto-correcting missing self paths. Thank you for this nice illustration of how to make use of parse. 15:14Crash with modify 'owned and object that has circularities While testing reactivity with objects that are node trees, I encountered a crash. *** Runtime Error 19: stack error or overflow *** at: 0042A933h Digging into the code from reactor/on-change, I pinpointed the following file, line and code : reactivity.red, line #31 : if any [series? :old object? :old][modify old 'owned none] In my case, the old word refers to an object that is a node tree, however with circularities : i.e. children of the tree refer back to their respective parents. The following code reproduces the issue : create-node: function [][ node0: make object! [ node-type: 'node0 label: none value: none parent: none ] node1: make node0 [ node-type: 'node1 child: none ] n0: make node0 [] n0/label: 'n1 n0/value: 1 n1: make node1 [] n1/child: n0 n0/parent: n1 ; if commented no crash n1/label: 'sine return n1 ] a: reactor [ node: none push: function [][ self/node: create-node ] pop: function [][ self/node: none ] ] a/push a/pop Should probably work. In any case should not crash. Note that following code is enough to provoke the crash. Therefore I circumvented the crash by overloading reactor/on-change and avoiding this very call. n: create-node modify n 'owned none hiiamboris 16:09thanks! added this to https://github.com/red/red/issues/4546#issuecomment-826114798 zwortex 16:33You're very welcome. A one liner bug ! I cannot be that terse. hiiamboris 16:41you've done the hardest part of locating the buggy modify line ;) zwortex 17:11You can't imagine : I had to crawl to find out where it was. By the way, how do you print out the stack trace that is shown in the bug. It might have given me an entry point to search the issues or the code, at least. Regards. hiiamboris 17:18you need to compile your console with -d flag 17:19as in here: https://github.com/red/red/#running-red-from-the-sources-for-contributors but adding -d zwortex 17:21Thank you ! I'll do that. hiiamboris 17:22:+1: 17:23as a bonus, GUI console compiled this way will mirror it's output to the terminal, which is both realtime and leaves a trail when it crashes zwortex 17:54Worthy bonus indeed ! Tuesday 4th May, 2021 Oldes 18:39Currently in Red there is: >> 0 = 0:00 == true >> 0:0 = 0 == true These are both false in Rebol as [Carl wanted](https://www.curecode.org/rebol3/ticket.rsp?id=1103). hiiamboris 18:43What's the rationale? 18:44And what about this? >> 0:0:1 = 1 == true >> to 1 0:0:1 == 1 Oldes 18:44Hm.. maybe Carl was wrong hiiamboris 18:45I think it's okay to have loose comparison. Oldes 18:45Ok. 18:50It's just a little bit strange to see something like: 100% = 0:0:1 ;== true but I know I can use 100% == 0:0:1 ;== false Wednesday 5th May, 2021 greggirwin 18:42It's another one of those things where you have options. If you don't have a non-strict comparison you have to coerce values. There's no right or wrong, but a subjective design decision. rsheehan 22:13Is anyone else getting the following error running red programs on the most recent builds for the Mac? *** Driver Internal Error: Script Error : status needs a value *** Where: run-console *** Near: [status: either all [Windows? gui?] [ gui-sys-call exe any [all [file form-args file] ""] ]] Thursday 6th May, 2021 hiiamboris 06:59regression from https://github.com/red/red/pull/4869 06:59please [report it](https://github.com/red/red/issues/new?template=bug_report.md) 07:00looks like sys-call routine is defined without an integer return value 07:00in a few places even rsheehan 08:20@hiiamboris Done. zwortex 12:41Key is wrong with key-down or key-up events. Is it intended ? check-event: function [from event][ print [ from "type:" event/type "key:" event/key "flags:" event/flags "ctrl?:" event/ctrl? "shift?:" event/shift? ] ] win: layout [ h: field 0x0 hidden text "click a key and check the console" ] win/actors: object [ on-key: function [face event] [ check-event "window" event ] on-key-down: :on-key on-key-up: :on-key ] view/no-wait win hiiamboris 12:48wrong how? works for me 12:49if you mean, not translated into a character then it's by design zwortex 12:50that's what I meant 12:51how do I get the translation ? hiiamboris 12:52think on it.. e.g. #"K" is a combo: +Shift +K -K -Shift it's 2 key-downs and 2 key-ups, there is simply no such thing as 'releasing a #"K" key' (which you expect in on-key-up) 12:53translation is only available in on-key, cache it if you need it 12:53why do you need it? zwortex 13:07I don't need it. I was using on-key-down then I figured out it was not using the proper event. As for your explanations, which I understand, event/key refers to a key in the events key-down and key-up, but to a character in the event key. This is confusing though understandable. 14:35The following code changes the font size of a button when clicked : view [ style op: button bold font-size 18 on-down [ face/font/size: 20 ] on-up [ face/font/size: 18 ] op "Click-me" [ print "Morning Joe!" ] op "Click-me-also" [ print "Morning Jack!" ] ] However, as the font is common to all widgets that use the same style, the change is made to all buttons. I tried to create a separate style using a different font : view [ style op: button bold font-size 18 on-down [ face/font: op-clicked/font ] on-up [ face/font: op/font ] style op-clicked: op font-size 20 op "Click-me" [ print "Morning Joe!" ] op "Click-me-also" [ print "Morning Jack!" ] ] This also fails as the style is not known in the event handler. As a work around, I created an explicit face, though hidden, to hold separate fonts. view [ style op: button bold font-size 18 on-down [ face/font: a-op-clicked/font ] on-up [ face/font: a-op/font ] a-op: op 0x0 hidden "" a-op-clicked: op 0x0 hidden "" font-size 20 op "Click-me" [ print "Morning Joe!" ] op "Click-me-also" [ print "Morning Jack!" ] ] This works but I'd rather be able to refer styles directly. Is it a wish wishable ? hiiamboris 14:44https://github.com/red/red/blob/3723789c63bb057966b1eace6f0292af3cac958e/modules/view/VID.red#L527 Styles are currently local to the layout function. 14:46I suggest defining fonts separately and reusing from styles. 14:47Your last example doesn't change the font size for me 14:49No, wait, it does :) Just hard to notice zwortex 15:22ok 15:23When creating the layout of a view, I can use set-words to designate some particular widgets. Then I may use those words in event handlers to interact with these particular widgets. However those words are local to vid. They are not exported (you have to export them explicitly using a do block or an on-create event). Also they don't show when probing or dumping a face tree. win: view/no-wait [ a-button: button "Click" [ print "Hello" ] on-create [ a-button-for-all-1: a-button ] do [ a-button-for-all-2: a-button ] ] do-actor a-button-for-all-1 none 'click do-actor a-button-for-all-2 none 'click dump-face win true I wish set-word in vid be accessible from outside. For instance : win/a-button or a reflective function like get-face-by-word win 'a-button. And have this information visible when dumping the face. Does it make sense ? hiiamboris 15:25a-button is global. zwortex 15:40How come I thought it was not ? Anyway, the remark regarding the dump of faces still holds. hiiamboris 15:53How do you envision it? zwortex 16:04With the late enlightment, I guess set-words should be local to the view that is created or local to an enclosing context (that would not be a face object), instead of being made global. Alternatively, a face facet holding the set-word used to designate the face object. hiiamboris 16:08You can wrap 'view' call into a 'function'. zwortex 16:45I guess with the intention of containing the set-words to the local function. But I still don't see how it would made them available, or just visible, when dumping the face tree. 16:46I'll think about it later. 16:49Different subject. Reduce flattens a block. Compose does not. Why is it so ? It is not with Rebol 2. a: [ (1) 2 ] a reduce a compose a hiiamboris 17:28reduce changes every value, compose only touches those it evaluates 17:40In R2 it's a total mess: >> a: [ [ 1 [ (2) [ 3 [ ] == [1 (2) 3 ] >> reduce a == [1 2 3 ] >> compose a == [1 2 3 ] zwortex 17:43I guess line feeds should be preserved unless the evaluation spans across it, be it with reduce or compose. In the case of compose, that means the line feed is within the parenthesis. For reduce, it depends on the evaluation itself. hiiamboris 17:43Yeah, good idea. I'll make a ticket. 17:54https://github.com/red/red/issues/4890 zwortex 18:26genial 23:51If I load a tiny float, it is rounded to 0.0, or so it appears a: load "1.2354e-16" ;=> 0.0 print a ; 0.0 probe a ; 1.2354 a * 1.E16 ; 1.2354 ; no it's still there mold a ; 1.2354e-16 I digged into the code and system and found the option float/pretty? in system. When starting the console, it is set to false. Still, the display of float is rounded : probe system/options/float/pretty? load "1.2354e-16" ;=> 0.0 However, if I set it explicitly to false, the rounding gets removed as expected. system/options/float/pretty?: false load "1.2354e-16" ;=> 1.2354e-16 I guess there is some initialisation confusion somewhere. Friday 7th May, 2021 hiiamboris 06:27Float is not rounded by load, but by mold. Use mold/all if you don't want it. 06:29Sorry, by 'form'. Mold probably doesn't round anything but -0 to 0 maybe. zwortex 08:27I was not commenting on mold vs form. But on the fact that system/options/float/pretty?, that is used by form, is not taken into account after initialisation, but only after its value has been set again. Whether it is relevant of something else, is beyond my concern. hiiamboris 08:36right, it's out of sync 08:37file a ticket if you like zwortex 09:52Here it goes : https://github.com/red/red/issues/4893 hiiamboris 09:53:+1: Saturday 8th May, 2021 zwortex 09:38Is it known ? Documenting return: for a function provokes an error f: function [ "My function" value [integer!] "Value" return: [string!] "Returned value" ][ s: copy "res" append s to-string value return s ] *** Script Error: invalid function definition: return: *** Where: = *** Stack: The same with func works fine though f: func [ "My function" value [integer!] "Value" return: [string!] "Returned value" ][ s: copy "res" append s to-string value return s ] help f ldci 10:09@zwortex ][ either x <> 0 [false] [true] ] zwortex 10:43@ldci Thanks for the tip. My point though was on the argument return:, that might be mispelled as return, and provokes errors subsequently. Furthermore, I should not have used zero? as example it is part of the core functions. Sorry about that. I will delete the post and put it back. ldci 10:47@zwortex BTW: words declared in func are global and words declared in function are local. When you’re using functions, in most cases you don’t need return. By default the last evaluation is returned by the function. zwortex 10:49(Rephrased) Maybe I pointed that out already. It should be prevented to misspell return: as return in a function spec, as it will trigger no warning and might lead to bugs that are hard to find. In my opinion, this is something that is needlessly error prone. Some exceptions are useful. This one I doubt. is-zero: function [ value [integer!] return [logic!] ][ if value = 0 [ return true ] return false ] a: 0 either any [ is-zero a a = 1 ] [ print "Yes" ] [ print "No" ] 10:51@ldci - ok Oldes 11:30@zwortex your function is too verbose... you can use just: is-zero: func[value][value = 0] 11:47The return: inside function specification is interesting bug: f: function [return: [string!] ][s: copy "res" return s] ;= OK f: function [return: [string!] "a"][return "s"] ;= OK f: function [return: [string!] "a"][s: copy "res" return s] ;= ERROR f: function [return: [string!] "a"]["a"] ;= OK f: function [return: [string!] "a"][a: "a"] ;= ERROR zwortex 12:10@oldes, are you a bug keeper as well ? shall I create it with your additional examples ? hiiamboris 12:44Yes please report it 12:54As for your original return vs return: exception, restrictions may help you learn but you only learn for a short time. After that restrictions only limit your expressive power. Red is a language that aims not to do that. 12:57But this is where additional code analysis tools may at least in theory prove useful. zwortex 13:56For the bug, here it is : https://github.com/red/red/issues/4894 14:10For the return vs return:, I disagree. A basic of good ergonomics is to give a proper feedback. If you need to have return as an argument or as a local variable, you can just add a refinement for that very purpose : lets say a refinement /return. The exception here is the want of an argument that is called return, whereas you will use endlessly return:. At the same time, using return in lieu of return: might trigger a bug, possibly very hard to find and that could be easily prevented at the core of the language. Like other languages, you will end up with strict settings, that will enforce those and save the life of millions. When you educate a child, you teach him how to say please and thank you. No please. No cookie. Similarly, a programmer that uses an argument named return, should not be rewarded. No function at all. Clear. Simple. Error free. hiiamboris 14:16Let's not exaggerate. I never recall making this mistake and it looks as contrived as writing 'none instead of none. But I did use return as a /local. 14:21I also doubted a lot of core design decisions when I was only learning Red :) 14:21So mark my word, you'll reconsider your views. zwortex 14:24Different subject. 14:24 ; Try with a block ending with an exit is not usable f: function [v] [ divide 10 v exit ] err: try [ f 10 ] ; Ok I need to add a final value to be returned in all cases err: try [ f 10 true ] error? :err err: try [ f 0 true ] error? :err ; But I may not know what the block is doing. ; Try should do that job of making sure to return something in any case (maybe return unset! as a convention) hiiamboris 14:52Sorry, no idea what is your point here.. 14:52Every Red expression always returns something zwortex 15:00I run some command block. Some potentially with errors, some potentially returning nothing because of an exit. If I write : err: try command if error? err [ ; error encountered ] that may fail whenever the command returns nothing. I need to write err: try [ do command true ] to protect against a possible exit What's the point of having try, if you have to add on top another layer of protection ? hiiamboris 15:04Relevant issue https://github.com/red/red/issues/3755 15:06Also a relevant solution: https://gitlab.com/hiiamboris/red-mezz-warehouse/-/raw/master/catchers.red zwortex 15:11This is a catch all of try/catch issues... Does it cover my particular remark ? hiiamboris 15:15Solution does, the issue description doesn't zwortex 15:20What would you suggest ? Worth mentioning as a comment. Or just leave that be... as more thoughts are being brewed on the subject anyway. hiiamboris 15:29I was thinking that a comment with a use case description should be good enough. zwortex 16:57I will add the following. Try is also limited for handling blocks that don't return any value, for instance a function that ends with exit or print. As there is no returned value, relying on it to return a possible error is meaningless. It will trigger an error which is exactly what you were trying to prevent. f: function [v][ print [ 10 / v ] ] cmd: [ f 5 ] either error? err: try cmd [ print [ "NOK:" mold err ] ][ print "OK" ] The workaround is to combine try and do so as to make sure a returned value is returned in all cases. f: function [v][ print [ 10 / v ] ] cmd: [ f 5 ] if error? err: try [ do cmd true ] [ print [ "NOK:" mold err ] ][ print "OK" ] However, you would expect try to handle that situation already. You never know what could be returned by the code that is being evaluated. If nothing is returned, it should return an agreed upon value : unset!, none or whatever might be set by the caller with the adequate refinement. 17:00or something alike. hiiamboris 17:08This argumentation is erroneous. If you don't know what value your code is going to return, then you should not write err: in the first place (but set/any 'err). 17:11It is no fault of try that it returns unset!. try just passes it through as any other value. zwortex 17:13There is something I don't know or I don't get here 17:14exit does not return anything, not returns something, even unset! hiiamboris 17:14It returns unset!. As I told before, every Red expression returns something. 17:15Sometimes we can say "doesn't return anything" but what we mean is "returns unset". zwortex 17:16Fair enough. I am happy with that. 17:21I still don't get it. In the following code, if try was returning unset! there would not be an error : f: function [v][ print [ 10 / v ] ] cmd: [ f 5 ] set/any 'err try cmd either error? err [ print [ "NOK:" mold err ] ][ print "OK" ] 17:26OK. I found it f: function [v][ print [ 10 / v ] ] cmd: [ f 5 ] set/any 'err try cmd either all [ not unset? :err error? err ] [ print [ "NOK:" mold err ] ][ print "OK" ] hiiamboris 17:27just :err 17:27or get/any 'err if you're feeling verbose zwortex 17:28unset is like fire. Don't touch it or burn. hiiamboris 17:29err is synonymous with get 'err, and triggers an error 17:30https://github.com/red/red/wiki/[LINKS]-Design-questions#why-x-throws-an-error-if-x-is-unset-and-more-on-rationale-behind-unset-invention zwortex 17:30I thought there was get-args that would prevent that. But unset is handled even before. hiiamboris 17:31get-args have nothing to do with this zwortex 17:32Why not ? for instance an error can be passed around without triggering 17:34Anyway. I think try should take care of all this nonsense as you never know what might come back. hiiamboris 17:36Think of it like Lego. If your blocks are of very specific unique shape and only fit for a single task, you're not gonna build a lot. Instead you want them to be as generic as possible and in any-fits-any relation. 17:37Forcing try to replace some classes of return values would be a silly limitation. 17:37Although no one stops you from trying it out in your code and see how that scales. zwortex 17:52There is this principle of robustness in software design (leave aside other applications) : "be conservative in what you do, be liberal in what you accept from others". Try is meant to catch possible errors, triggered by a code you may not master, that may return exit or not or whatever. If it uses the returned argument to inform on any potential error, this returned argument should be accessed, in the normal way, even if the underlying code did returned an unset value. I don't see your point of lego and stuff like. If try returns a value, it should be in all cases, even if the underlying code has not returned any value. hiiamboris 17:55Like I said try returns transparently any value from the code it evaluates. 17:57As such it is "liberal" in this sense. zwortex 18:00Obviously I disagree with you. It's like quantum mechanics. The only fact of having throw and relying with its returned value to detect a possible error is an interaction with the process. Your action is to check for an error (whatever it is) and you should not have to care about what is being returned or not. hiiamboris 18:03That's why you should never use err: try code pattern on a code you didn't write. Just as you shouldn't use x: do code pattern. 18:04Again, what does this have to do with try? It's your mistake of not knowing how to handle unset values. 18:05try is no magic bullet to fix syntax errors a programmer makes. It's mechanism to handle runtime errors. 18:06Anyway, at this point I'm not even sure what do you propose. zwortex 18:25Let's leave that aside for the time being. I get your point. Though I am not entirely satisfied with it. In particular, the possibility of a code that may return unset. The fact that I am trying to catch an error, and that doing so I get another error is too much for me. Try is not used as part of an evaluation process but as a gatekeeper : do that and if there is an error let me know. That I have to take precautions to make sure nothing got wrong is wrong in itself. Period. But like I said, I need to think it further. 18:35All the more, thanks for your thoughtfull answers. giesse 18:53This issue with try has been debated at length for REBOL 2. The design is simple but I find it bad overall. Especially in R2 where errors blow up, and you have to be wary of unset! values and a number of other issues. This means that if you are writing a *generic* function that uses try you have to bend over backwards to handle all edge cases. Red is a little better but not much IMHO. In Topaz I use a completely different approach: https://github.com/giesse/Project-SnowBall/blob/master/topaz/natives.topaz#L350 You don't write if error? err: try [...] [...] - you write try [...] 'err [...] which does not require anything else to handle *all* cases. (Including the code legitimately returning an error! value, which you *cannot* handle in R2 and Red.) hiiamboris 19:51I kinda proven that you *can* handle it in Red. But I agree with your design mostly. My only remark is it makes code harder to follow in simple try [open ..]-like scenarios. 19:56E.g. #assert [error? e: try [code that should produce an error] 'e] Sunday 9th May, 2021 Oldes 11:13In Rebol 3 there is try/except: try/except [1 / 0][ print "No divide by zero, please!" ] hiiamboris 11:15except is an OK name too. Thanks. I'll consider it in my mezz. Oldes 11:18I consider it very useful as one can use also function as an exception, like: try/except [...] :on-error-quit-gracefully hiiamboris 11:19would this be any better than just try/except [...] [on-error-quit-gracefully]? Oldes 11:20 rebol >> on-error: func[e][print ["oh no," e/type "error again!"]] try/except [1 / 0] :on-error oh no, Math error again! hiiamboris 11:21Ah, it has an argument. 11:23You know what's funny is that after some amount of thinking I've come exactly to the same design (not knowing that R3 had it): https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/catchers.red#L140 Oldes 11:25In my R3 branch I also store last error in system/state/last-error, so I can do also: >> try [1 / 0] probe system/state/last-error () make error! [ code: 400 type: 'Math id: 'zero-divide arg1: none arg2: none arg3: none near: [/ 0] where: [/ try] ] hiiamboris 11:25The only difference is that R3 doesn't seem to support access to the error in block mode, but my version does. 11:25Ah, I see. 11:26This is OK too, but more limited: if your error handler triggers another error handler, it loses the original error after the second handler finishes. 11:27Glad to hear it's battle proven though ☻ loziniak 11:47Hi! Is piping code to Red supported? % echo "abc: 15 probe abc" | ./red-23mar21-637818323 --== Red 0.6.4 ==-- Type HELP for starting information. 15 *** Internal Error: not enough memory *** Where: append *** Stack: ^C% hiiamboris 11:48no IO no ports no stdin, coming soon ™ giesse 17:55> I kinda proven that you *can* handle it in Red. But I agree with your design mostly. My only remark is it makes code harder to follow in simple try [open ..]-like scenarios. @hiiamboris you can handle it in R2 too. Ladislav wrote a number of examples. The fact that we had to work hard to handle the general case was what made me and him talk to Carl about it and propose different solutions (in person in the 2004 DevCon). hiiamboris 17:59:+1: 17:59Did he listen? ;) 18:01Well, maybe R3 design is the result of that talk.. Monday 10th May, 2021 giesse 18:52It is. But there are compatibility concerns as well. Me and Ladislav wanted to get rid of unset! too for eg. but that didn't pass. :) One of the reasons I made Topaz was to actually test those ideas (among many others). hiiamboris 19:02@giesse did you get rid of unset in Topaz? Tuesday 11st May, 2021 giesse 18:52yes hiiamboris 19:08Or you just hid it? E.g. you have lit-word 'no-value - what value does it have internally? 19:37Or you have words without context? Wednesday 12nd May, 2021 zwortex 16:24Is it normal ? 1.#NaN == 1.#NaN ;= false 1.#NaN = 1.#NaN ;= false NaN? 1.#NaN ;= true hiiamboris 16:29It is, but it's not all working if you test more. You can use https://github.com/red/red/pull/4717 or wait a few years before it gets merged ☺ (edited) zwortex 16:29Apparently it is. https://en.wikipedia.org/wiki/NaN#Comparison_with_NaN hiiamboris 16:31You can compare nans with same? but be aware that there are different nans, e.g. 0 / 0 isn't the same as 0 * 1.#inf zwortex 16:31ok I'll check. Thanks. 16:33quiet or not quiet hiiamboris 16:34Red only uses quiet NaNs zwortex 16:44Incidentally. If all is ready to be fixed. Why is it not done yet ? hiiamboris 16:44Who knows... zwortex 16:45Not me. giesse 17:46> Or you just hid it? E.g. you have lit-word 'no-value - what value does it have internally? @hiiamboris well, in the current implementation internally it would be Javascript's null. You can think of it as a hidden unset! if you wish, though it is never really the result of anything and it's not an actual Topaz value. >> i-have-no-value *** Script error: Word has no value: i-have-no-value *** Stack: i-have-no-value >> context-of 'i-have-no-value == context [ == conjure: native [ == "Conjure a value" == name [word!] == ... >> get/any 'i-have-no-value == none hiiamboris 17:53OK. And if I want to suppress console output, how do I go without unset? Thursday 13th May, 2021 zwortex 10:39Different subject: Parse with into rules get lost on a buffer with removed elements. You need to copy the buffer to avoid the issue (see the following cases). Is it known ? adds: [ mults any [ adds-rec ] ] mults: [ into [ 'value integer! ] (print "MULT") ] adds-rec: [ into [ 'binary op-binary-add ] (print "ADD") mults ] op-binary-add: [ '+ | '- ] buffer: [ ['value 1] ['binary +] ] clear at buffer 2 probe buffer parse buffer adds ;= MULT / ADD - NOK buffer: [ ['value 1] ['binary +] ] take/last buffer probe buffer parse buffer adds ;= MULT / ADD - NOK buffer: [ ['value 1] ['binary +] ] remove at buffer 2 length? buffer probe buffer parse buffer adds ;= MULT / ADD - NOK buffer: [ ['value 1] ['binary +] ] buffer: copy/part buffer 1 probe buffer parse buffer adds ;= MULT - OK hiiamboris 10:45any shorter snippet? 10:45what a mess zwortex 10:45then takes the first 8 lines - 10:46this just various cases on the buffer serie with clear, take/last, remove to get rid of the last entry 10:48unless copy, ['binary +] is matched when it should not hiiamboris 10:49I get MULT in all cases 10:50Red 0.6.4 for Windows built 12-May-2021/6:12:03+03:00 commit #cebd5b9 zwortex 10:52mine is not that recent Red 0.6.4 for Windows built 24-Apr-2021/19:27:28 10:53I will try with a more recent 10:53I get the problem in all cases and with console, or console gui 10:54are there global settings that might influence ? hiiamboris 10:56nope zwortex 10:59I got the automatic build and the problem disappeared. Good. I will recompile my environment and see how it goes. Cheers. 11:16With my own compilation, the problem arises. Can it be rebol that has changed ? 11:19how do you get the commit tag in your about ? hiiamboris 11:23those you download from the site 11:24great, gittard reorders my messages.. way to go 11:30> With my own compilation, the problem arises. Can it be rebol that has changed ? Automatic builds are using Rebol 2.7.6, it's possible that it affects but very unlikely 11:34http://static.red-lang.org/build/rebview.exe zwortex 12:12Must have had a corruption in my environment somewhere. It looks to have disappeared now. I pulled the red repos again. Droped into it rebol, just the console, not the view, and the latest (2.7.8.3.1). Started it and ran the script do/args %red.r "-r %environment/console/CLI/console.red". The resulting console does not show the issue any longer. 12:15Are there other dependencies I should check ? User>AppData>Roaming rebol or red I see hiiamboris 12:42git status to see if you modified something and forgot about it 12:43if you're compiling with -c flag, delete your libRedRT.dll to force it's rebuild on the next compilation giesse 12:49> OK. And if I want to suppress console output, how do I go without unset? @hiiamboris I don't see why, but, if you're hard pressed for a special case, you could use none for that. hiiamboris 13:01Just curious. I don't like unset either. 13:04What is the result of () or do []? none? And I guess Topaz must have an ability to unbind a word totally then. 13:07OK just checked: Topaz Interpreter - (C) 2011 Gabriele Santilli - MIT License >> do [] == none >> () == none giesse 18:43 >> get make word! "no-context" *** Script error: Word has no context: no-context *** Stack: get make word! "no-context" hiiamboris 18:52:+1: Friday 14th May, 2021 loziniak 14:22Hello. Is anybody getting the same result as me? It's probably connected to https://github.com/red/red/pull/4869 and I'm trying to debug/fix this. % ./red-14may21-a15845a9c --== Red 0.6.4 ==-- Type HELP for starting information. >> q *** Driver Internal Error: Script Error : status needs a value *** Where: run-console *** Near: [status: either all [Windows? gui?] [ gui-sys-call exe any [all [file form-args file] ""] ]] 14:30my system is *Arch Linux* hiiamboris 14:30Yep. Everyone. loziniak 14:30:-D hiiamboris 14:30https://github.com/red/red/issues/4889 loziniak 14:30thanks hiiamboris 14:31see my comment above 14:32:point_up: [May 6, 2021 9:59 AM](https://gitter.im/red/bugs?at=609393d375aeb43be72d64f0) loziniak 14:37found it. hard to debug until you have licensed rebol. I'll submit a PR and keep fingers crossed for success :-) 14:54Are there any tests that I could run to check this before submitting PR? Somehow to debug? 14:56I can compile console, and dry-run compiler like this: echo 'Rebol[] do %red.r' | rebol +q -s without errors. Is there something more I can do? hiiamboris 15:10tests suite can be run with rebol -qs run-all.r 15:11but for your issue, just running a console and typing q should be enough :) loziniak 15:15Isn't this code used only when running console through red executable? hiiamboris 15:15ah.. right, I forgot you're modifying the launcher itself :D loziniak 15:15btw console and q is clear :-) hiiamboris 15:16well, Travis output will be ready in an hour or so :) 15:17But I think R2 doesn't allow return: in function spec.. loziniak 15:21oh great... 15:25 % echo "Rebol [] a: func [return: [integer\!]] []" | ./rebol ... ** Script Error: Invalid argument: return ** Where: throw-on-error ** Near: func [return: [integer!]] [] 15:27seems like I have to leave this to someone with greater experience. hiiamboris 15:28Just remove return: from funcs loziniak 15:28and in routines it's ok? hiiamboris 15:30yep loziniak 15:34Won't it leave Script Error : status needs a value error unfixed? hiiamboris 15:37no of course not 15:37every func returns a value, always, that's why return: was not needed 15:37In Red it's only used for documentation (and maybe someday will be used for type checking) loziniak 15:38In Red I know that, but I lost my ground on Rebol :-) Monday 17th May, 2021 zwortex 17:54I have this inconsistent behaviour between interpretation and compilation. Don't know if it is worth notifying. The following script evals properly. Red [] a-func: function [ /ref [logic!] return: [unset!] ] [ either ref [ print "with ref" ] [ print "without ref" ] ] a-func ;= without ref a-func/ref ;= with ref Rightly though it triggers an error when being compiled : *** Compilation Error: invalid function spec block: [[logic!] return: [unset!]] *** in file: D:\Developpements\RedTest\thetest.red *** near: [[/ref [logic!] return: [unset!]] [either ref [print "with ref"] [print "without ref"]] a-func a-func/ref ] hiiamboris 18:12it's not valid to specify typeset for refinements 18:13perhaps it's worth reporting that interpreter allows it greggirwin 18:35Agreed. You can spec types for refinement args, but not refinements themselves. zwortex 19:10I'll open a ticket. 19:22Another discrepancy, in the following script. This time the other way round : Red [] f: function [ v [integer!] return: [boolean!] ][ print "Here" all [ v == 1 v == 2 ] ] f 3 print "There" Interpreted => nothing triggers, error on boolean! Compilation => accepted, the output is : Here There greggirwin 19:24There is no boolean! in Red: logic!. 19:25That sounds like an oversight in the compiler. zwortex 19:32Shall I create a ticket ? 19:34Meanwhile. My original problem when compiling looks have been this one : Literal syntax for a datatype triggers an error in the compiler The following script runs fine if interpreted. Red [] f: function [ v [any-type!] return: [logic!] ][ return (type? v) == #[object!] ] print [ f 3 ] When compiled the following error is shown : *** Red Compiler Internal Error: Script Error : Out of range or past end *** Where: percent-value? *** Near: [forall blk [ if multi-line? [nl?: new-line? blk] item: blk/1 either any-block? :item [ either with [ emit-block/sub/with :item main-ctx hiiamboris 19:35#[object!] 19:36not even worth reporting zwortex 19:39why is it so ? on one hand boolean! no warning and if using the literal syntax a cryptic error. 19:40I had to restructure all the code to feed the compiler step by step until I found the original error 19:40if you consider that as not worth reporting, I don't know what is worth reporting 19:50Also, I tested again the case case, the situation already discussed that returns none instead of unset... Red [] a: 2 b: case [ a == 1 [ "1" ] [] ] probe b ;= none => if compiled, it triggers the error *** Compilation Error: CASE is missing a value *** in file: D:\Developpements\RedTest\test.red *** near: [] hiiamboris 20:12#[object!] is an invalid construction syntax, not worth reporting until somebody *designs* what construction syntax should be in the first place 20:15that it returns a datatype currently should not be relied upon as I assume this will be broken later 20:18funny though, let's comment on https://github.com/red/red/issues/4126 greggirwin 20:20Certainly seems like a glitch, since interpreted and compiled differ. zwortex 20:31Why an invalid construction syntax ? How do you switch against a datatype ? using to-string ? 20:31or to-word hiiamboris 20:32type?/word 20:33but your example should be just object? v zwortex 20:43I will change my code. However currently in my code #[string!] or #[block!] in switch or in equal? work and no issue raised at compilation time. If it should not be used, it should trigger an error in all cases. If it can be used, it should be accepted in all cases. Here we are in the middle and the compilation error is cryptic. hiiamboris 20:57of course Tuesday 18th May, 2021 zwortex 14:35The following script runs fine when evaluated : Red [] f: function [ a [integer!] return: [logic!]] [ res: false either a > 10 [ print ["Sorry not covered"] break ][ return true ] ] f 1 print "Hello" But triggers an error when compiled : *** Compilation Error: BREAK used with no loop *** in file: D:\Developpements\RedTest\test.red *** near: [ break ] However if calling f 11 rather than f 11, i.e. forcing the execution path through the break statement, an error is triggered also when interpreting. Question should not the interpreter have detected the possible issue without being forced into it ? hiiamboris 14:50no zwortex 14:53ok I see the interpreter is a blinkered fellow greggirwin 16:13@zwortex when should the interpreter detect the issue? f: function [ a [integer!] return: [logic!]] [ res: false either a > 10 [ print ["Sorry not covered"] break ][ return true ] ] attempt [f 11] print "Hello" change at body-of :f 6 11 f 11 This may seem an artificial example, and we don't *recommend* people modify functions at runtime this way, but it shows the true nature of Red. Everything is data until it is evaluated. The tradeoff with the compiler is you can't write as much dynamic code. This is where Red can give us new approaches, by having some parts strict and some parts more relaxed, along with tools that can analyze things from both perspectives. Wednesday 19th May, 2021 rebolek 09:23If you have file! with semicolon, for example %/mifs/.;/ (this is real example from my http server log), if you mold it (no matter if you use /all refinement), you get %/mifs/.;/. So if you save some block with a filename like this, you can’t load it back as everyhting after semicolon is ignored. I would suggest to check filename for a semicolon and when present, add quotes to get %"/mifs/.;/" hiiamboris 09:39worth a ticket ☻ rebolek 09:52OK, will do Oldes 10:06In Rebol: >> to-file "/mifs/.;/" == %/mifs/.%3B/ 10:07In Red there is also: >> to-file {a"b} == %"a"b" >> %"a"b" *** Syntax Error: (line 1) invalid string at " rebolek 10:09https://github.com/red/red/issues/4906 10:10That the second example is syntax error is understandable. Probably percent encoding should be the default. hiiamboris 10:13%"" form was introduced because percent-encoded files are unreadable and impossible to type by hand (unless you recall all the unicode table) rebolek 10:13both forms can coexist I believe hiiamboris 10:14I think ^ should be used as in strings inside %"" form rebolek 10:14that makes sense zwortex 11:15@greggirwin - get your point on interpretation. I leave aside the data vs code. We had this conversation already. I am more practical in my remark. Currently I am attempting to compile my code and find out that having a code that works when interpreted is far from enough to have it compile. There are little issues as the one about break, and harder ones as dependencies, and the way the compiler decide whether things should be compiled or not. My impression is there is a missing step of pure syntactic analysis that are likely to prevent the compilation, otherwise it seems you get stuff that are left to interpretation or wrongly compiled with wrong assumptions. greggirwin 18:34@zwortex understood, and agreed. We currently have compiler limitations, and address them as we find them. But, to your point, there will always be things that can't be compiled, and that's a *BIG* research project. We can cover a lot of bases with simple analysis, which is where we'll start. Sunday 23th May, 2021 GiuseppeChillemi 16:54There is something strange here, the last one should return none >> a: [b c d e [f g] h] == [b c d e [f g] h] >> :a/e == [f g] >> :a/e/j == none >> :a/e/f/z *** Script Error: path :a/e/f/z is not valid for word! type *** Where: catch *** Stack: hiiamboris 16:56no, it shouldn't GiuseppeChillemi 17:01@hiiamboris Why? Paths returns none if an element is non existant. Here I expect none too >> a: [b c d e [f g] h] == [b c d e [f g] h] >> a/e/f/z *** Script Error: path a/e/f/z is not valid for word! type *** Where: catch *** Stack: hiiamboris 17:19and here? >> x: 'x == x >> x/a *** Script Error: path x/a is not valid for word! type *** Where: catch *** Stack: GiuseppeChillemi 17:24An invalid path value x would be better, ` hiiamboris 17:25I would prefer different docstring too (but not the one you propose) 17:25at the very least it should tell which item lookup failed GiuseppeChillemi 17:26Anyone is better than the actual string that you can interpret in 3 ways and without any reference 17:27> at the very least it should tell which item lookup failed I Agree 100% 17:41I was working on a way to know if a path on a block is returning a none because the element does not exist or because it is a return value of a function. >> ff: reduce ['lib reduce ['f func [/aref] [print "hello" none]] 'z] == [lib [f func [/aref][print "hello" none]] z] >> ff/lib/f hello == none >> ff/lib/g == none both ff/lib/g and ff/lib/f returns none but for very different reasons. 17:43I have even tried exists? 'ff/lib/g which has some sense but with no luck. hiiamboris 17:44well, possible but not without your own path evaluator 17:45although what about testing for function? :ff/lib/g first? 17:46not gonna work for :ff/lib/f/aref but idk your needs GiuseppeChillemi 17:49Yes, it is a solution but does not work for this too: >> function? :ff/z/a *** Script Error: path :ff/z/a is not valid for none! type *** Where: function? *** Stack: function? 17:52There are multiple scenarios to consider while handling function at the end of paths. The last one is attempt [function? :ff/z/a] where none is also the return value of attempt 17:56I was trying to EXECUTE a block of code parsing it with my own handler and I had to check if a path ends with a function. There are some ambiguous situations to handle. hiiamboris 18:10Yeah, paths are hard. 18:10A lot of special cases GiuseppeChillemi 18:52Do you have links in the source where the decoding happens? hiiamboris 18:54sure https://github.com/red/red/blob/500fba7b93ea9ef36f3affb33d43a0b703d80f5b/runtime/interpreter.reds#L647 18:57then it dispatches by datatype, e.g. https://github.com/red/red/blob/500fba7b93ea9ef36f3affb33d43a0b703d80f5b/runtime/datatypes/block.reds#L774 GiuseppeChillemi 19:08Thank you. Monday 24th May, 2021 greggirwin 20:12I agree that more info in error messages is better. If we don't have a ticket for that, let's open one. hiiamboris 20:18https://github.com/red/red/issues/4532 ? 20:18GH doesn't load for me at all, strange.. greggirwin 20:19:+1: Wednesday 9th June, 2021 hiiamboris 15:04This doesn't make much sense to me: >> find/only reduce [1 integer! 2] number! == [1 integer! 2] >> find/only reduce [1 integer! 2] integer! == [integer! 2] Anyone can defend this behavior? 15:06R2 returns first result in both cases, but I would prefer 2nd in both cases (i.e. /only would disable the smarts because there's no other way to disable them) greggirwin 20:44@hiiamboris I agree. Then we need to update the doc string for /only. Current: Treat a series search value as a single value. Possibly: Treat series, datatype, and typeset search values as singular. Thursday 10th June, 2021 zentrog:matrix.org 00:28Or "treat the search value as literal". The value parameter could probably also use some docstring explanation. I don't know how else someone would discover that behavior changes depending on datatype greggirwin 00:40I considered literal as well, but that's confusing in other ways. e.g. there's no such thing as a literal block, because they always are. Adding docs for value is a great idea though. Sunday 13th June, 2021 toomasv 04:42What is 1.5 for? extract/index make hash! [a b c d] 2 2 == make hash! [1.5 b d] It seems to have appeared a year ago. greggirwin 04:44Well, it's a fun bug. >> extract/index make hash! [a b c d e f] 3 2 == make hash! [1.6666666666666667 b e] >> extract/index make hash! [a b c d e f g h] 4 2 == make hash! [1.75 b f] @qtxie ? toomasv 04:46:) greggirwin 04:53 >> extract/index/into make hash! [a b c d] 2 2 h: make hash! 2 == make hash! [b d] >> extract/index/into make hash! [a b c d] 2 2 h: make hash! 1.5 == make hash! [1.5 b d] >> make hash! 1.5 == make hash! [1.5] 04:57Not enough type checking in make. Only checks for integers and blocks currently. Anything else falls to to, which should probably be an error. I can't imagine we want to rely on the current behavior, and hope it's not used anywhere. qtxie 06:59:sweat_smile: Monday 14th June, 2021 luis-rj 23:56In order to confirm "Panel Draw shows black on Ryzen7" bug view [panel draw [line 10x0 160x50]] Someone has W10 with AMD Ryzen7 chips ? Tuesday 15th June, 2021 luis-rj 00:04Tests with another OS and Ryzen versions are welcome. zentrog:matrix.org 03:32[image.png](https://gitter.ems.host/_matrix/media/v1/download/matrix.org/limcXEYpAdZxPQQxSDMTPVIr) [![image.png](https://gitter.ems.host/_matrix/media/v1/download/matrix.org/LeuELgQjYnzZPLIndvOtfRUz)](https://gitter.ems.host/_matrix/media/v1/download/matrix.org/limcXEYpAdZxPQQxSDMTPVIr) 03:32I think this is what it should look like, right? Win 10 Ryzen 5 GiuseppeChillemi 22:27Red crashes and console closes with this code: a: #(a: 22 b: 33 c: probe a) Do you confirm? 22:28Its the same with: a: #(a: 22 b: 33 c: x: a) 22:29It is related to having 2 elements after C: greggirwin 22:58Confirmed. Wednesday 16th June, 2021 luis-rj 01:12@zentrog:matrix.org Yes, bug seems limited to W10 Ryzen7. toomasv 03:17@GiuseppeChillemi Confirmed, but the problem is not having 2 elements assigned, but having in the end a key which is already assigned, but now without value. Consider these: >> a: #(a: 22 b: 33 c: x: 1) == #( a: 22 b: 33 c: x: ) >> a: #(a: 22 b: 33 c: x: x) == #( a: 22 b: 33 c: x: ) >> a: #(a: 22 b: 33 c: probe probe a) == #( a: 22 b: 33 c: probe probe: a ) >> a: #(a: 22 b: 33 c: x: a b) == #( a: b b: 33 c: x: ) 03:27Remember, that maps are not evaluated: >> #(a: 1 + 2) == #( a: 1 +: 2 ) GiuseppeChillemi 08:08https://github.com/red/red/issues/4914 08:11> Remember, that maps are not evaluated: > > >> #(a: 1 + 2) > == #( > a: 1 > +: 2 > ) > I would like they could be reduced as Object's creation blocks but without context being set to words, I have some nice use cases. 08:14Compose does not work here: >> probe compose #(a: 22 b: (3 + 4)) *** Script Error: compose does not allow map! for its value argument *** Where: compose *** Stack: probe rebolek 08:26What's so hard about >> make map! compose [a: 22 b: (3 + 4)] == #( a: 22 b: 7 ) GiuseppeChillemi 09:19Because once used in blocks they have to obey set-words syntax limit, and you can't use key names like "2do" : >> 2do: 22 *** Syntax Error: (line 1) invalid integer at 2do: 22 *** Where: case *** Stack: load >> It is needed when you map external world data. rebolek 09:29What? You can't have key named 2do in a map! also. 09:30But if you mean "2do" instead I see no problem there: >> make map! compose ["2do" 22 b: (3 + 4)] == #( "2do" 22 b: 7 ) GiuseppeChillemi 11:11I remember a thread where I have read Maps permits overcoming limitation of object-based approach for Json keys. I admit that I have always seen map examples with GET-WORD VALUE couples, so I thought the "KEY" part could only be a get word. Ok, so the key part could be anything but Functions with Doc deprecates and a final decision has not been made. 11:12That's good, in some sense it could give me even more flexibility in my project. rebolek 11:44not just function!, but also block!, object!, map!, etc. are not allowed as keys 11:45but number!, any-word!, any-string! are fine Thursday 17th June, 2021 zentrog:matrix.org 23:28@greggirwin: 23:30I was following the discussion on #4910, and thought that if you agree, it could be useful to split [your comment](https://github.com/red/red/issues/4910#issuecomment-863535181) into separate comments for each option, so that people could 'vote' for the ones they like (using the reaction emoji) without adding too much extra noise Friday 18th June, 2021 Oldes 13:56First of all the question should be, **why is not allowed to have** to map! object [a: 'a]? 13:58@greggirwin my main concern with current Red's state is this inconsistency: >> o: object [a: 'a] type? o/a == word! >> b: to block! o type? b/a == lit-word! 14:01The lit-word! makes sense if used with the make object! (because object construction is reducing the block), but it should not be present when block is created from object's value/key pairs. 14:02Maybe there could be different result of body-of and to block! on an object. (but I'm not sure if it's worth complications) 14:08Also I should remind, that in Rebol there is _construction syntax_ and there is: >> #[object! [a: a]] == make object! [ a: 'a ] So the result [a: a] of to block! #[object! [a: a]] makes more sense! 14:13Also in Rebol3 it's possible to make the object without block evaluation using construct, so one can convert object to block and back to object using: >> construct to block! object [a: 'a] == make object! [ a: 'a ] 14:18:point_up: [June 17, 2021 1:11 AM](https://gitter.im/red/bugs?at=60ca8534bed13a2dba89fed2) @greggirwin the difference between 1 and 2 can be demonstrated with this code: >> reduce [to lit-word! 'a 'a to word! 'a] == ['a a a] and >> o: object [a: to lit-word! 'a] type? o/a == lit-word! >> o: object [a: 'a] type? o/a == word! 14:31:point_up: [June 17, 2021 11:04 AM](https://gitter.im/red/bugs?at=60cb10263169e234986e8b72) @GiuseppeChillemi actually the best solution is to have always result in the construction syntax (not yet implemented in Red) like: >> make object! [b: 22 c: 'z] == #[object! [ b: 22 c: z ]] 14:34Which reminds me, that: first reduce [true] should print in console #[true] instead of just true. 14:38It's a deep rabbit hole :) rebolek 15:07I agree with @Oldes . Oldes 15:13Hm... it looks that gitter has some issues, because I believe that I was answering in the help room, but it's all in bugs. hiiamboris 15:18Familiar issue to me ;) Been there many times. 15:19Seemingly happens when you change rooms before it fully loads the previous one (but sometimes right away when you open gitter). rebolek 15:52Use gritter ;) hiiamboris 15:57I once tried ;) rebolek 16:08:-) Without proper IO it's barely usable. It can't properly refresh and not block UI. I'm going to try with the new IO. hiiamboris 16:09Riight.. single-threadedness... 16:10And I have such internet that gitter sometimes takes 10 min to load ;) rebolek 16:12wow. I believe gritter should really help in such case as it doesn't need so many requests to just show a room. hiiamboris 16:13Will it handle huge packet drop? ;) rebolek 16:18I guess that depends on their API. :( GiuseppeChillemi 17:31@Oldes Could you make a wiki table with your proposal? 3 Columns: on the leftmost one: the command used together with the block, then comes the proposed result, and on the rightmost one, some additional observation from you/us. greggirwin 17:46@zentrog, I'll try breaking things out in the future. Thanks. Tuesday 29th June, 2021 greggirwin 02:53Yes. gltewalt 04:17Can a linux person confirm that radio does not toggle with the latest automated build? hiiamboris 06:34view [radio false radio] works for me on WSL2/Ubuntu 06:35~~maybe not entirely latest though~~ latest as well gltewalt 07:44hmm... Tuesday 13th July, 2021 meijeru 07:29Found an interesting bug related to the interaction of looping (repeat or loop) and printing by prin. See #4929 Wednesday 14th July, 2021 gltewalt 03:19rename doesn't work for me with linux nightly build Saturday 17th July, 2021 giesse 13:16load/next fails with non-ascii chars? >> load/next {"Gab’s Books"^/Work In P} 'pos == "Gab’s Books" >> pos == "ork In P" >> load/next {"Gab's Books"^/Work In P} 'pos == "Gab's Books" >> pos == "^/Work In P" 13:16for reference: >> to binary! {"Gab’s Books"^/Work In P} == #{22476162E280997320426F6F6B73220A576F726B20496E2050} hiiamboris 14:17certainly seems so... >> transcode/next "фывапр abcdef" == [фывапр "f"] 14:18but works if I convert it to binary and back 14:18so it's some naive conversion there greggirwin 17:34Good find. :+1: giesse 18:42> but works if I convert it to binary and back Hmm, interesting, my case was originally coming from a file via read. greggirwin 18:42Does it work with builds prior to the fast lexer change? giesse 18:44to string! read/binary does not seem to make a difference though. 18:44@greggirwin i'll try to do a quick test. hiiamboris 18:45 >> to "" second transcode/next to #{} "фывапр abcdef" == " abcdef" giesse 18:47@greggirwin do you know which commit i should check out? i don't see any tags or branches on a quick look. 18:49@hiiamboris ah, I see what you mean 18:50I've worked around it by adding an extra space to my file for now. hopefully it's easy to fix given it works with binary. 18:51should i create an issue or is there one already? hiiamboris 18:52not that I know of greggirwin 18:55Sounds like it's worth a ticket. giesse 18:56https://github.com/red/red/issues/4933 Sunday 18th July, 2021 gltewalt 01:44helpful >> rename %cow.mp3 %chicken.mp3 *** Script Error: rename does not allow file! for its from argument *** Where: rename *** Stack: >> help rename USAGE: RENAME from to DESCRIPTION: Rename a file. RENAME is an action! value. ARGUMENTS: from [port! file! url!] to [port! file! url!] hiiamboris 06:20lol greggirwin 17:27Do we have a ticket for that? And since it's a common need, not tied to full I/O, it would be great to implement that. @qtxie, I know you're busy, but maybe it won't take too much time. gltewalt 17:49It should be one of the common things that newcomers would care about ...and not a good look if what we point them to doesn't work 17:49I doubt there's a ticket unless boris made one just recently, but I'll look 17:50Oh, there is: https://github.com/red/red/issues/4307 Wednesday 21st July, 2021 hiiamboris 21:14 >> v: make vector! [1.0] == make vector! [1.0] >> w: make v [] == make vector! [] >> append w 1.0 *** Script Error: invalid argument: 1.0 *** Where: append *** Stack: >> append w 1 == make vector! [1] I know make just blindly takes the type of the value. And vectors are a single type. But how can we make a vector of the same type as the one we have? greggirwin 21:35Seems we have to work around it for now. e.g. this doesn't work either: >> v: make vector! [1.0] == make vector! [1.0] >> w: make vector! v *** Internal Error: reserved for future use (or not yet implemented) *** Where: make *** Stack: So copy it is. >> v: make vector! [1.0] == make vector! [1.0] >> w: clear copy v == make vector! [] >> append w 1.0 == make vector! [1.0] 21:37Though it should be within your realm to add a branch in switch type for making vectors for vector!. Seems like a little hole to fill. ldci 23:14Another way ` v: make vector! [float! 64 0] 23:15 w: copy v append v 1.0 Thursday 22nd July, 2021 Oldes 00:38Is it correct when: >> f: func [arg][p: 'arg] f 1 context? p == func [arg][p: 'arg] but: >> get p *** Script Error: context for arg is not available ? 00:41I have a feeling, that context? should return something only in cases, when it is accessible, like in this case: >> f: func [arg][probe context? 'arg probe get 'arg] f 1 func [arg][probe context? 'arg probe get 'arg] 1 01:00Another reason why it should not return function specification outside of the function call is, that when the context? is evaluated, the function may not exist anymore, like in this case: f: func [arg][p: 'arg] f 1 f: none recycle context? p ;<--- will CRASH!! greggirwin 04:06I don't have a use case handy, but it would be possible to hold the value, evaluating it later when it's valid, or for debugging. Referring to things that may not exist applies to all words, doesn't it? I agree it shouldn't crash, and that's a good ticket. toomasv 05:01Funny workaround: >> v: make vector! b: [1.0] == make vector! [1.0] >> w: clear make v b == make vector! [] >> append w 1.0 == make vector! [1.0] hiiamboris 05:46I'm for returning context. But GC has a bug if it does not mark the word's context. Friday 23th July, 2021 Oldes 14:49And what about this recursion related crash? f: does [f] f 14:50I guess it should be handled with: ** Internal Error: Stack overflow greggirwin 15:29Another good ticket. Something a static analyzer could also catch. hiiamboris 18:12known 18:12https://github.com/red/red/issues/4323 greggirwin 19:13Thanks. :+1: Friday 30th July, 2021 toomasv 12:52clip seems not to work, or is it just me? Should it show clipped region with e.g. view [box 200x200 beige draw [ clip [move 10x10 line 100x10 100x50 10x50 close] [fill-pen gold box 10x10 198x198]]] ? Oldes 13:10Isn't clipping supposed to work only with rectangular areas? toomasv 13:11[Docs](https://github.com/red/docs/blob/master/en/draw.adoc#228-clip) allow two forms: by rectangular area and by shape commands. Rectangular works. hiiamboris 13:12D2D regression (Windows only). Worth reporting toomasv 13:23Ok, thanks https://github.com/red/red/issues/4939 greggirwin 17:35Good catch @toomasv. Thanks for confirming it's a regression @hiiamboris. Tuesday 17th August, 2021 zwortex 13:06Mold on a multi-line block add a new line character at the end. Don't see why it should. a: [ 1 2] new-line? tail a ;= false as you would expect mold a ;= "[1 ^/ 2^/]" hiiamboris 13:12 >> new-line? load "[^/]" == false New-line markers use value cells. If block has N=1 value in it, it can only have 1 marker (though output contains N+1 new-line chars). 13:12By convention, each value slot defines a marker *before* it. So tail marker is undefined and has to be deduced. 13:13Current behavior I think is optimized for columnar output: >> load "[^/1 2^/3 4]" == [ 1 2 3 4 ] zwortex 13:43ok for the missing slot where to put the last newline marker. My sense of symmetry however would have dictated a different inference rule : match it with the first newline marker. I guess the reason it does not is that it is applying code style rule, and puts the closing bracket after a newline. That's fine. a: [ 1 2] trim mold a ;= "[^/1^/2^/]" ; but a: [1 2] trim mold a ;= "[1^/2]" rather than "[1^/2^/]" hiiamboris 13:50Let's take a step back. Why would you even want such badly formatted output? zwortex 13:57Good question. No answer. greggirwin 15:55It's one of those interesting and subtle design points that works really well most of the time. :^) Tuesday 24th August, 2021 cjohnson318 03:35Hi, I'm having trouble running the mac OS binary. I get the following error: unable to execute ./red-064: Bad CPU type in executable I'm running Big Sur 11.5.2. Thanks! greggirwin 03:51Red is 32-bit only at this time. Use a VM or Docker in the meantime. We have notes on that if you them. cjohnson318 03:55Okay, I'll try using Docker. Thanks @greggirwin ! Tuesday 31st August, 2021 Oldes 11:19Is it ok, that find accepts _binary_ target, but parse not? >> find "a" #{61} == "a" >> parse "a" [#{61}] == false 15:06Also... if there is: >> find/reverse tail %foo.x %.x == %.x wouldn't it be logical to have: >> find/reverse/match tail %foo.x %.x == %.x ;<--- and not none as it is now? hiiamboris 15:37https://github.com/red/red/issues/3609 https://github.com/red/red/issues/3339 15:41I also think it's logical and straightforward. 15:41And consistent. Oldes 17:41There is also this incompatibility with Rebol2: >> index? find/reverse/last skip "2222" 2 #"2" == 4 ;<--- is 2 in Rebol2 greggirwin 18:38On parse with binary target against a string, if there's not a ticket, please open one. We should either allow it or doc why we don't. hiiamboris 18:422 doesn't make any sense greggirwin 18:43On find/reverse the question for me is not compatibility but expected behavior. Should we go past the head of an offset series reference? I think Red does the right thing here. For example, this seem surprising, doesn't it? >> str: skip "1234.2.." 2 == "34.2.." >> find/reverse/last str #"2" == "234.2.." hiiamboris 18:50I think it should error out on /last/reverse 18:50 /last => Find the last occurrence of value, from the tail. /reverse => Find the last occurrence of value, from the current index. 18:50Mutually exclusive options 18:51![](https://camo.githubusercontent.com/33f774ecd293642c68c196a23b9e1e98f592bb238c8f0d67a988773f0fd845d5/68747470733a2f2f692e6779617a6f2e636f6d2f33663062323863366662303036323338633239663131366161353931303164362e706e67) greggirwin 18:52Thanks for the reminder on that. :+1: Oldes 19:30@greggirwin actually [Red is ignoring /reverse when /last is used](https://github.com/red/red/blob/19a74defb8260f2807305261af31ecbf3a674a18/runtime/datatypes/string.reds#L2071-L2090) greggirwin 19:33Ah, yes. So @hiiamboris' point is the one to take. Monday 6th September, 2021 cjglo 23:08I believe I found a bug for Red/System. Made a simple file to read from using the simple-io-minimal.reds, however it will read out part or the whole file totally depending on if I declare a variable right before print. file reading from: (named 'test') This is a test file that can be used to test grep .reds file version 1 (that prints part of file) Red/System [ Title: "Testing stuff out" ] #include %./lib/simple-io.reds ; simple-io-minimal (from red/code) if system/args-count < 2 [ print "Error: No file listed to check" quit 1 ] fileName: system/args-list + 1 ; So I am incrementing pointer to get second cli arg (file name) filePtr: simple-io/open-file fileName/item simple-io/RIO_READ no ; openning file by dereferencing the ptr to the command line arg (Along setting it to read mode) buffer: declare pointer! [byte!] ; this declares a pointer file: simple-io/read-data filePtr buffer simple-io/file-size? filePtr i: 0 ; <-- This is the line that affects it print file => outputs "st file that can be used to test grep" .reds file version 2 (that prints whole file) Red/System [ Title: "Testing stuff out" ] #include %./lib/simple-io.reds ; simple-io-minimal (from red/code) if system/args-count < 2 [ print "Error: No file listed to check" quit 1 ] fileName: system/args-list + 1 ; So I am incrementing pointer to get second cli arg (file name) filePtr: simple-io/open-file fileName/item simple-io/RIO_READ no ; openning file by dereferencing the ptr to the command line arg (Along setting it to read mode) buffer: declare pointer! [byte!] ; this declares a pointer file: simple-io/read-data filePtr buffer simple-io/file-size? filePtr ; i: 0 <--- this line is now commented out print file => outputs "a test file that can be used to test grep" Tuesday 7th September, 2021 hiiamboris 08:07you should be printing buffer, not the random non-zero value which it returns cjglo 22:12Ahh my mistake, that seems obvious. Thank you Thursday 16th September, 2021 loziniak 15:05Hello. Seems #4095 is back, can anyone confirm? 15:57It seems to be working only on console compiled from sources: $ echo "Red [] quit/return 1" > ~/issue-4095.red $ git pull origin master $ echo 'Rebol [] do/args %red.r "-r -o console-new environment/console/CLI/console.red"' | ./rebol +q -s $ ./console-new ~/issue-4095.red; echo $? 1 $ ./red-16sep21-391fe774f ~/issue-4095.red; echo $? Compiling compression library... Compiling Red console... Gtk-Message: 17:37:23.229: Failed to load module "xapp-gtk3-module" Gtk-Message: 17:37:23.229: Failed to load module "xapp-gtk3-module" 0 hiiamboris 16:04Why would automatic builds be different? 16:05I don't think anyone modified the R2 wrapper 16:08No one did: https://github.com/red/red/commits/master/red.r loziniak 16:12Perhaps it was always like this? 16:12I tested my PR only on compiled console. hiiamboris 16:17Can't reproduce 16:19Ah 16:19Sorry, I can. Returns 0 for me too. 16:21Looks like you fixed it for Mac only ;) 16:22Nope, that's not it 16:36No idea. Everything looks good. loziniak 16:49I have some idea. Perhaps you [were right](https://gitter.im/red/bugs?at=5dab13094bc69e6b6601b19e) and [I was not](https://github.com/red/red/issues/4095#issuecomment-813979298). 16:52libc's system returns a value of *console* exit code, but [it's not returned](https://github.com/red/red/blob/15b13004d3263ad0a9182be6bcb851b77346f653/red.r#L510) from red. hiiamboris 16:53but why? ;) 16:54I mean you're referring to a very old build 16:54in current build it [*should*](https://github.com/red/red/blob/master/red.r#L520) return it AFAIK but *doesn't* loziniak 16:55ah, indeed. but as you noticed, nobody touched it since :-) hiiamboris 16:55yeah 16:56well, it looks like some R2 issue to me loziniak 16:56It seems in Windows sys-call and gui-sys-call return values are not consistent. 16:57perhaps it's the reason they are not handed over. hiiamboris 16:57but you're on linux loziniak 17:00I'm just guesssing why the code is written like that. hiiamboris 17:01ShellExecute is a mess, I wouldn't bother trying to fix it: https://stackoverflow.com/questions/10896778/how-to-get-return-value-of-an-exe-called-by-shellexecute 17:03CLI red command returns proper on W10 loziniak 17:12Damn, I indeed was looking at old version. I'm somewhat tired today :-) 17:42Maybe `/return' refinement is present only in R3? 17:43http://www.rebol.com/docs/words/wquit.html http://www.rebol.com/r3/docs/functions/quit.html hiiamboris 17:58Nope. 17:58 >> ? quit USAGE: QUIT /return value DESCRIPTION: Stops evaluation and exits the interpreter. QUIT is a native value. REFINEMENTS: /return -- Returns a value (to OS command shell) value -- (Type: integer) 17:59And I checked and it works (in Ubuntu). loziniak 18:12Uhm, works in Arch also. It's getting strange indeed. 18:14Perhaps paid/licensed version of Rebol is buggy? 18:15Or something changes when Rebol is embedded inside executable? hiiamboris 18:22Or runtime is built with another (buggy) version (I tested on 2.7.8) loziniak 18:22Maybe something with automatic builds environment? Someone could try to compile Red toolset binary locally and try to reproduce the bug. 18:23I tested on REBOL/Core 2.7.8.4.3 (6-Jan-2011), probably the same one. hiiamboris 18:24lemme try 2.7.6 18:26actually no, it looks like 2.7.8 is used to build Linux toolchain 18:29must be an encapper bug, idk what else Saturday 18th September, 2021 loziniak 21:58 >> if 0 = 0 % 10 ["rr"] *** Script Error: = does not allow logic! for its value1 argument *** Where: = *** Stack: Shouldn't it be Script Error: % does not allow logic! for its value1 argument? hiiamboris 22:12https://github.com/red/red/issues/4311 loziniak 22:13that's it, thanks. Sunday 19th September, 2021 Oldes 13:55Is it by design that copy of error is an object? >> type? copy try [1 / 0] == object! greggirwin 17:08I will say No. Error inherits copy from object!, which always sets the type header to object. It's the only type that inherits from object! currently, but if others are added, we certainly want their type preserved. Please open a ticket. Good catch. :+1: Tuesday 21st September, 2021 toomasv 12:38Sometime between Sep and Dec 2020 behaviour of replace regressed: >> replace "hi" [any newline end] lf == "hi^/" >> about Red 0.6.4 for Windows built 23-Sep-2020/18:24:34+03:00 commit #add4b06 >> replace "hi" [any newline end] lf == "hi" >> about Red 0.6.4 for Windows built 9-Dec-2020/0:03:34+03:00 commit #98457f4 hiiamboris 12:48Personally I don't think this case should be supported at all. toomasv 12:48Why not? hiiamboris 12:50Well, end is a gray area of Parse right now. E.g. if a rule eats full input, it will stop parsing without waiting for your rule to contain end: >> parse "ab" [2 skip end (probe "at the end")] "at the end" == true >> parse "ab" [any [2 skip | end (probe "at the end")]] == true 12:51It (end) will match the end position but is not required for Parse to terminate at that position. So little twists in the rule affect it. 12:51Also I think it's an esoteric use case :) 12:51replace should expect non-empty rule matches ;) 12:53I also think replace should not be using Parse at all, because it makes switches between Parse and non-Parse modes totally unpredictable. toomasv 13:02OK, how would you guarantee, that a string ends with single newline (allowing other whitespaces before it)? hiiamboris 13:12hmm smth like append trim/tail/lines "hi^/^/" lf? toomasv 13:15Nope: >> append trim/tail/lines "hi^/ho" lf == "hi ho^/" hiiamboris 13:17looks like a bug in trim (probably known?) toomasv 13:18This works: n: charset [not #"^/"] append clear find/last/tail "hi^/ho" n lf == "hi^/ho^/" but parse rule is simpler hiiamboris 13:18this one will fail if no newlines in the string, no? 13:19no, works 13:22parse s: "hi^/ho" [to [change [any lf end] lf]] s if you could care less about performance 13:23but it's better to fix trim :) toomasv 13:23I don't think it is bug: ? trim ... /lines => Removes all line breaks and extra spaces. hiiamboris 13:24Then a design flaw ;) Or documentation flaw.. toomasv 13:25Could have used /with, but: /with => Same as /all, but removes characters in 'str'. hiiamboris 13:25 >> append trim/tail "hi^/ho" lf == "hi^/ho^/" 13:26no need for /lines in current version, which goes against the docstring "Removes space from a string or NONE from a block." toomasv 13:26Nice try :) >> append trim/tail "hi^/ho " lf == "hi^/ho^/" >> append clear find/last/tail "hi^/ho " n lf == "hi^/ho ^/" hiiamboris 13:27You get trimming of dangling spaces for free ;) toomasv 13:28Well, as said above "allowing other whitespaces" before final newline. hiiamboris 13:29OK then find is the correct and fast solution toomasv 13:30Still, I think as long as parse rules are supported in replace this looks like a regression. hiiamboris 13:31Question is should we pursue such esoteric cases in design? 13:32What's the win? toomasv 13:32But this is normal, valid parse rule. Why esoteric? 13:33Why some rules should not work? hiiamboris 13:36Because you're replacing an empty match and behavior starts depending on layout of rules. It's more important for replace not to contain any hidden gotchas and be predictable as a hammer than to support edge cases like end or "" 13:37My mapparse implementation suffers from this order dependence as well btw: >> mapparse [any lf end] "hi^/" [lf] == "hi^/" >> mapparse [any lf end] "hi" [lf] == "hi" >> mapparse [any lf end] "hi^/^/" [lf] == "hi^/" 13:41 >> parse "" [any [end (probe "ended") | skip]] "ended" == true >> parse "x" [any [end (probe "ended") | skip]] == true 13:42To "fix" this we would need to slow down Parse by asking it to do another iteration of any/some loops when it sees the end of input. We need solid arguments to justify that. toomasv 13:50Could have been written >> parse "x" [any [not end skip] end (probe "ended")] "ended" == true hiiamboris 14:02My point is, relying on the order of rules inside replace (which is not defined) will not make your code robust and long-living ;) toomasv 14:08PEG parser rules are inherently order-dependent. Excluding some specific cases of order does not make it order-independent. But ok ... greggirwin 17:43As I read this, I had the same thought as @toomasv about PEG parsers. Order matters. No way around that. End in parse is a separate issue from using parse rules in replace. If end needs clarification, or design changes, we should absolutely address that. When it comes to predictability, that applies to everything in Red. It doesn't mean we'll succeed 100% in all cases, so if things don't just work as you expected them to, or guessed at while quickly writing a piece of code, the next line of design defense is that we explain it, and our explanation makes sense. That also doesn't mean things are perfect. There will be edge cases that people choose to avoid, which is perfectly OK. I tend to prefer plain, obvious code myself...when reading others'. :^) Replace is an ignorant accomplice when it comes to the use of parse within it. That is, it is not going to analyze the rule it was given to see if it makes sense. We can and should write tools to help people play, test, and understand it though. If someone then chooses to use end in their rule, that's up to them. A general bad-parse-rule analyzer would be great (as part of a general static analyzer). That said, if there *isn't* a good reason to support parse rules in replace, we shouldn't. 17:49Replace's code is not easy to understand at a glance. (Let's at least refactor it to remove also series either parse? ..., which a great way to hide an exit point and obfuscate the result in a function. Maybe I should start a "worst practices" wiki page to vent my opinions. ;^) It's also a bit tricky, because we don't have larger docs for funcs like this, to clarify how refinements interact with parse rules. That is, you're not *really* writing a generic parse rule, but one that works in the context of those refinements. That should be made clear. Friday 24th September, 2021 Oldes 14:30This seems to be quite inconsistent: >> foreach a [w 'w :w w: /w] [print to tag! :a] <w> <w> <w> <w> </w> hiiamboris 15:40but it makes sense 15:44though the less special cases of dubious usefulness we have, the better rebolek 16:28I think that turning refinement! into closing tag is not a bad thing. hiiamboris 16:29but can you imagine anyone doing to tag! /em to get a closing tag? 16:30well maybe in some dialect.. rebolek 16:31Yup, exactly. greggirwin 17:54It's by design. to ref! also keeps the sigil. Agreed on dialect use. Thursday 30th September, 2021 loziniak 12:49Invalid map! make console quit: >> #(x: 44) == #( x: 44 ) >> #(x: 44 'test) *** Script Error: invalid argument: (x: 44 'test) *** Where: transcode *** Stack: [maciek@laptop ~]$ hiiamboris 13:57Make a ticket ;) 13:58Some recent regression. Sunday 10th October, 2021 gltewalt 23:31read-clipboard has Runtime Error Access Violation if no data has previously been written to clipboard greggirwin 23:35Worth a ticket if we don't have one already. gltewalt 23:35With a new console session, if there's data in clipboard from a user copying something with the keyboard, then it's fine. Otherwise - Data has to be first written to the clipboard with write-clipboard, or a user has to have copied something previous to the new session 23:38clipboard-test.red should have caught this? 23:45Suspect it is only Linux. gdk Wednesday 13th October, 2021 Oldes 10:26This is strange (on Windows): >> to-red-file "//" == %/none >> to-red-file "\\" == %/none %// should be root of the current logical drive hiiamboris 10:41looks like a bug (none thing) 10:42but \\ is UNC path start actually greggirwin 18:43Definitely a bug, but also an indication that we should clearly spec the expected behavior. Thursday 14th October, 2021 Oldes 19:47@hiiamboris you are right and it looks, that it works in full path case: >> to-red-file "\\machine\shareName\msvcSrc\crt\headerFiles\stdlib.h" == %/machine/shareName/msvcSrc/crt/headerFiles/stdlib.h hiiamboris 20:01I would represent them as %//machine/shareName.. instead in Red. What if machine=c or d or any letter? Oldes 20:12Is it allowed? hiiamboris 20:17I don't see why it shouldn't be greggirwin 20:20I agree with @hiiamboris that a UNC path should map to a UNC equivalent. I've never tried it with a machine name matching a drive letter, but the OS file system should handle the rest for us. In a UNC scenario, the driver letter is not the real drive letter, but a share name which maps to a dir (which may be a drive's root). So if you have %//c/c/c/c/c.txt it should work. to read %c/c/c.txt on a given machine and share. 20:21However, R2 didn't distinguish UNC paths, and I know (because I used it a lot), that it all worked. 20:22So while it might be *nice* to know if it's a mapped share visually, if it means more work internally we have to ask how much value it adds in a world of heterogeneous systems. hiiamboris 20:23https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-dfsc/149a3039-98ce-491a-9268-2f5ddef08192 1 char is okay greggirwin 20:28So nothing needs to change, and maybe it shouldn't. hiiamboris 20:28well, we don't get // right now >> to-red-file "\\a\b" == %/a/b so something need to greggirwin 20:29But we don't *need* that. It works as is. The resulting file! works correctly to access the share, that's what I'm saying. hiiamboris 20:31no it doesn't, it will try to access floppy drive a: greggirwin 20:42OK, file a ticket for it then. But it's a very low priority IMO, not a showstopper. Important to note though, so it's doc'd for users. 20:44I don't have a machine on my network called a to see if that overrides the floppy. Oh, I don't have a floppy in this machine either. Friday 15th October, 2021 ne1uno 05:43https://github.com/red/red/issues/2254 says not implemented? 05:43what is an only non-scalar type? gltewalt:matrix.org 06:07Atomic values I think 06:08Errrrr non atomic. Like series 06:09Yeah, it's still reserved for future use. I was typing it wrong Sunday 17th October, 2021 endo64 12:39About crash withread-clipboard @gltewalt:matrix.org reported, it also crashes if the argument is a block (probably other types would crash, didn't test yet) hiiamboris 12:41tried with the latest build? endo64 12:46not the latest build, but ~3 weeks old. hiiamboris 12:47try with the latest endo64 23:28Crash was about write-clipboard not read-clipboard It still there: ; Red 0.6.4 for Windows built 17-Oct-2021/7:07:46+03:00 commit #80300ee >> write-clipboard [1 2 3] *** Runtime Error 1: access violation *** at: 0044C11Eh 23:29It's an old issue: https://github.com/red/red/issues/4331 Friday 22nd October, 2021 bubnenkoff 14:46Could anybody check follow code: data: [ foo: none ] set data/foo "123" probe data it's hang for me toomasv 14:49set 'data/foo "123" bubnenkoff 15:25is there any another way? to-lit-word to-path [a b c] do not work. I need to generate path for setting in dynamic hiiamboris 15:28to-lit-path? greggirwin 17:26Do we have a ticket for why that example hangs? hiiamboris 17:38he overrode none greggirwin 18:56Ah. Monday 25th October, 2021 cblp 13:46hi! is there a plan to support MacOS Big Sur? I'd like to help 13:47now it is $ ./red-064 -bash: ./red-064: Bad CPU type in executable should I report it as a bug? hiiamboris 13:51https://github.com/red/red/issues/4652#issuecomment-695329813 cblp 14:01@hiiamboris https://gitlab.com/vazub/red-docker -> 404 14:03ok, so the problem is in 64 bits support hiiamboris 14:11https://github.com/red/red/wiki/[LINKS]-Unofficial-Red-images Thursday 4th November, 2021 Oldes 12:05 red >> to-tuple #{0102030405060708090A0B0C} == 1.2.3.4.5.6.7.8.9.10.11.12 >> to-tuple #{0102030405060708090A0B0C0D} == 1.2.3.4.5.6.7.8.9.10.11.12 ;<--- is it ok that there was not an error? hiiamboris 12:07 >> to 1 #{1020304050607080} == 270544960 no error either ldci 12:19@Oldes tuple datatype is limited to 12 positive integer values. Oldes 12:20@hiiamboris I'm aware of this.. but is it good or no? hiiamboris 12:20I think it can be useful 12:26btw I have no idea what anyone is going to do with all the 12 parts of a tuple Oldes 12:29In Rebol there was just 10 parts. ldci 12:36Yes, mainly used for versions, colors, network addresses greggirwin 18:07@hiiamboris I used them as date-time indexes in an R2 system CC.YY.MM.DD.HH.MM.SS.nn... It allowed quite a bit of flexibility in searching. hiiamboris 18:14interesting greggirwin 21:24On to errors, we carried over Rebol behavior for most everything I believe, but we don't have a table of which conversions cause errors (e.g. integer overflow from a large float) and those that don't (conversions from binary just taking as much data as needed). It's an important area, and we should nail it down when we work on full specs in the coming months. Friday 5th November, 2021 Oldes 11:54Regarding the tuple!... Red allows shortening: >> t: 1.2.3.4.5.6.7.8.9.10 == 1.2.3.4.5.6.7.8.9.10 >> t/4: none == none >> t == 1.2.3 but does not allow extension (like was introduced in Rebol3) >> t/8: 8 == 8 ;<---- will be an error in Red so far >> t == 1.2.3.0.0.0.0.8 12:00although one can do in Red: >> 1.2.3 + 0.0.0.0.0.0.0.8 == 1.2.3.0.0.0.0.8 greggirwin 20:39Another good topic for when we work on detailed specs. We can make notes [here](https://github.com/red/red/wiki/[LINKS]-Design-questions) or in a dedicated page linked there. Sunday 7th November, 2021 GiuseppeChillemi 22:58Does ISSUES have limitation when used as keys? >> a: [#mo [words-of 1]] >> a/#mo/words-of *** Syntax Error: (line 1) invalid issue at #mo/words-of *** Where: set *** Stack: load greggirwin 23:17Looks like a regression. But I don't know that it ever worked. In old builds it returns none for the full path. Check for tickets and file a new one if none match. Thanks. Monday 8th November, 2021 rebolek 06:02I don’t think issues could be used in paths. greggirwin 06:26My question is whether it should throw an invalid issue error. You can escape it of course. >> a/(#mo)/words-of == 1 rebolek 06:34It’s interesting that it loads a/#mo as a path! GiuseppeChillemi 07:31@rebolek Rebol uses them as a word. I have been searching for an alternate word type to avoid possible collision between keys and their content, so a time ago I have adopted issues. 07:32@greggirwin I don't think, I see no reasons. Oldes 07:44@greggirwin I believe it should be like in Rebol: >> load {#mo/words-of} == [#mo /words-of] GiuseppeChillemi 10:30Note: I have used it on an object: o: make object!: [words-of: func [][]] a: reduce [#mo o] a/#mo ... *** Syntax Error: (line 1) invalid issue at #mo/words-of ... toomasv 10:54It is not a bug, but intentional. Here is issue rule according to [lexer](https://github.com/red/docs/blob/master/en/datatypes/error.adoc): ws: [space | tab | cr | lf] delimit7: compose [ws | (charset "])}:<>,")] delimit1: compose [ws | (charset "[](){}^";@") | end] issue-rule: [ #"#" [delimit7 (cause-error 'user 'message "Invalid issue") | some [ [#"/" | #":"] (cause-error 'user 'message "Invalid issue") | not delimit1 skip ] ] GiuseppeChillemi 13:10So, which datatype do you suggest to be used as an alternative for keys in place of words? It should have the same select speed. hiiamboris 13:11just use select or wrap in parens GiuseppeChillemi 13:28select ['data [values] somename] Using parens, How would I avoid the situation where somename = 'data and it won't be selected because the first data keyword would not permit this? 13:29(Note that this block could also need to be composed) hiiamboris 14:12I didn't get that. What parens have to do with your data layout? 14:13Parens is just one way to put issue into path. Another is get-words. 14:13Third one is to use select instead of paths. GiuseppeChillemi 14:55Did not know about parens used around issue, it is a new notation to me. hiiamboris 15:24:point_up: [November 8, 2021 9:26 AM](https://gitter.im/red/bugs?at=6188c2fe98c13e75502170f0) GiuseppeChillemi 16:40I have seen it but I have not understood it fully. Does it work the same of get-word or is there any difference? hiiamboris 16:42no difference 16:58@GiuseppeChillemi https://github.com/red/docs/blob/master/en/datatypes/path.adoc 16:59I admit it is silent about accessors and files though. GiuseppeChillemi 17:02It's better than not having it at all. hiiamboris 17:09it also speaks only of word! type that is transformed into select, not a word about the fate of parens and get-words after their evaluation 17:14and other peculiarities like: >> select b: [1 2 3] k: [2] == 3 >> b/:k == none gltewalt:matrix.org 17:20There's no k in b hiiamboris 17:21which means it's not select but select/only that is used 17:22there's more: >> unset 'k >> select b :k == none >> b/:k *** Script Error: cannot access :k in path b/:k *** Where: catch *** Stack: 17:23then there's errors when accessing object's missing fields.. 17:23I can't even think of all the differences between paths access and select ;) gltewalt:matrix.org 17:27 >> selector: 'bar == bar >> my-block: [foo bar baz] == [foo bar baz] >> my-block/:selector == baz 17:27 >> my-block/('bar) == baz 17:28That doesn't render as code on this element app... 17:29I'm not sure why path and select interplay is so complicated, but it is 17:33Missing object fields (or values) should return none, or it isn't consistent. No? hiiamboris 17:39 >> o: object [] == make object! [] >> select o 'x == none >> o/x *** Script Error: cannot access x in path o/x *** Where: catch *** Stack: toomasv 17:41 select b: [1 2 3] k: [2] ;== 3 b/:k ;== none select b: [1 2 3] k: 2 ;== 3 b/:k ;== 2 select b: [1 2 3] k: [1 2] ;== 3 b/:k ;== none select b: [[1 2] 3] k: [1 2] == none b/:k ;== 3 select b: [[1 2] 3] k: [[1 2]] ;== 3 17:51It is all ok, but needs some reflection. hiiamboris 17:58There's also set-path/poke/put abyss ;) >> t: 1:2:3 == 1:02:03 >> poke t 1 2 *** Script Error: poke does not allow time! for its series argument *** Where: poke *** Stack: >> t/1: 2 == 2 >> t == 2:02:03 18:00poke/put are never mentioned in set-path doc though, so there was probably never any equivalency by design greggirwin 18:33Time! isn't a series. 18:34But that doesn't mean time values *couldn't* support it. hiiamboris 18:36I mean we don't have a non-path way of doing this, or do we? greggirwin 18:37R2 supported more types with pick/poke, R3 removed a few but added bitset support. 20:15I don't recall ever trying it, or wanting it. It's a grey area in my mind right now. We make values from ordered blocks, which have assigned positions. We also have named accessors. There is a tension between unnamed slots and named/keyed attributes. Using paths makes it a bit more work, though not much, to use indirection. But this will come down to how they're used, as a non-path may be clearer, which is the real goal. For series, the index/position *is* the key, but for other types, you use words as accessors and that leads you to put rather than poke, as the inverse of pick. If you can pick something, it makes sense that you can do the opposite. But here we get into deeper changes. Should pick support both keys and indexes for types that have special accessors, or objects and maps? It feels like we can make this work consistently, at the cost of more code in the runtime for what may be rarely used patterns. The rule being that integer args are always treated as indexes, except for maps. Why this all feels uneasy to me is that we're making different tradeoffs. Yes, we have more ways to express things, but at the cost of having more cases that may lead to subtle bugs. e.g. where you have funcs that take types and use pick on them, where you may now need to dispatch to different logic in otherwise generic funcs, lessening their leverage. Once again, @GiuseppeChillemi's superpower seems to be inadvertently opening cans of worms. :^) This is similar to the copy issue, where we want consistency, but also need to look at whether it leads to *clearer* code or if a little less flexibility enforces patterns that make intent clearer. One thing I *am* sure of is that we should write a design spec for this, as part of our official spec project if not sooner. hiiamboris 20:29This topic was raised here https://github.com/red/REP/issues/68 GiuseppeChillemi 20:34@greggirwin I think this happens because I take uncommon coding roads. hiiamboris 20:35The longest ones ;) greggirwin 20:44Thanks @hiiamboris. Touched briefly on there, yes. At least I seem consistent with my own comments. :^) GiuseppeChillemi 20:49@hiiamboris In life, I also like to drive via small counties rather than highways. You take longer but you see a lot more and also your driving skill betters a lot! hiiamboris 20:50:+1: GiuseppeChillemi 20:56Just FOY, I am experimenting on a datatype system. [#custom datatype-name! #management-object data [.....]] was one of the possible structures (also object is another one). 20:58It would be fantastic to give a custom type to blocks and also extend the Red datatype system with your new datatypes, using a set of functions inside a context (this so any function accessing your custom DT would use your code). Ideas are welcome if you think there is a way. greggirwin 21:18That's highly unlikely. It's functionality that becomes much more specific, and is better handled at higher levels, where datatypes have a fixed set of generic actions for broad use. But if someone comes up with a brilliant design for UDTs, we'll certainly review it in detail. GiuseppeChillemi 21:25I think I am on the right road to make something simple and compatible with current Red way of thinking. Let's see. Saturday 13th November, 2021 loziniak 05:23I think I found something in Redbin implementation: echo -n "💖" | iconv -f UTF-8 -t UCS-4 -o ucs red >> read/binary %ucs == #{0001F496} >> save/as a: copy #{} "💖" 'redbin == #{ 52454442494E0200010000001000000007040000000000000100000096F40100 } echo -n "ą" | iconv -f UTF-8 -t UCS-2 -o ucs red >> read/binary %ucs == #{0501} >> save/as a: copy #{} "ą" 'redbin == #{ 52454442494E0200010000001000000007020000000000000100000005010000 } 05:24when encoding 4-byte strings, byte order is reversed in relation to iconv's byte order. hiiamboris 05:53Uhm.. and? loziniak 13:43> Uhm.. and? ...and I solved it :-) echo -n "💖" | iconv -f UTF-8 -t UCS-4LE -o ucs red >> read/binary %ucs == #{96F40100} Thursday 18th November, 2021 duskhorn:matrix.org 09:52 $ red >> load %file.png *** Access Error: cannot open: %file.png *** Where: decode *** Stack: load the file in question is the following 09:53[file.png](https://gitter.ems.host/_matrix/media/v1/download/matrix.org/BbYbaEvDTngiJRautFSewOhP) [![file.png](https://gitter.ems.host/_matrix/media/v1/download/matrix.org/xNmgoCmRLItPyxjDncdorFos)](https://gitter.ems.host/_matrix/media/v1/download/matrix.org/BbYbaEvDTngiJRautFSewOhP) toomasv 09:58[![image.png](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/xSJw/thumb/image.png)](https://files.gitter.im/5902e8c1d73408ce4f5b94ba/xSJw/image.png) rebolek 09:58I’m not sure if Gitter doesn’t do any conversion, but I can load the file just fine >> load %file.png == make image! [1280x1143 #{ 000000000000000000000000000000000000000000000000000000000000 000000000000000000000000000000000000000000000000000000000000 000000000000000000000000000000000000000000000000000000000000 0000000000000000000000000000000000000000000000... duskhorn:matrix.org 10:00I should mention that my OS is Void Linux 10:02to be precise Red 0.6.4 for Linux built 13-Nov-2021/11:17:19+01:00 commit #5f09829 hiiamboris 10:02works on ubuntu duskhorn:matrix.org 10:03Then I suspect I'm missing some required libraries for the conversion? rebolek 10:03Hm I guess if you would miss some libs, it would warn you on start and won’t run. hiiamboris 10:04what's the checksum of your file.png? probe checksum read/binary %file.png 'sha1 duskhorn:matrix.org 10:04#{56C5F2B97C679477856EFDF3CEFE6B30E3C214D0} hiiamboris 10:04okay conversion ruled out rebolek 10:04I’ll try to setup Void Linux VM and test it hiiamboris 10:05then it must be libs yes duskhorn:matrix.org 10:05Is there a list for full Red libs dependencies? I'm gonna check if I'm missing something rebolek 10:05If it’s libs I wonder why it didn’t complain on start. duskhorn:matrix.org 10:06Do I open an issue on the repo or I wait? rebolek 10:06@duskhorn:matrix.org what version of Void are you using? glibc/musl? duskhorn:matrix.org 10:07glibc rebolek 10:07Ok, I’m going to try it duskhorn:matrix.org 10:08Thanks! rebolek 10:53@duskhorn:matrix.org So I downloaded Void Linux live image (32bit version), run it in Virtual Box, in Void I downloaded Rebol and the latest Red sources, compiled Red and in Red tried to open your file. It worked. duskhorn:matrix.org 11:05Hm ok then I have no clue anymore rebolek 11:09I can share the executable with you so you can try it. Is your Void Linux 32bit or 64bit? duskhorn:matrix.org 11:1064bit. And I'm ok with that :) rebolek 11:12Maybe some 32bit libs are missing on your system 11:12I used 32bit system so I don’t have to deal with that :) duskhorn:matrix.org 11:13Ok so uh what libs do you think I may need? rebolek 11:15You can try ldd /path/to/red to list used libraries 11:18Take a look at the [download page](https://www.red-lang.org/p/download.html) what libs are needed. ne1uno 11:50gtk up to date? 11:50no idea if that matters for png rebolek 11:53@duskhorn:matrix.org here’s my Red compiled in Void: https://file.io/5whCH0eWifKo duskhorn:matrix.org 12:23Currently away from my machine, I'll try it in a bit when I return home, thanks! rebolek 12:26If the file disappears just let me know and I reupload it. duskhorn:matrix.org 12:35why would someone do that XDDD rebolek 12:35people love clicking on links :) duskhorn:matrix.org 13:00Ok so it's true that I may be missing a library Is the ldd output the same as mine above? rebolek 13:01No, I have more libraries there. But if I have a missing library I get a warning what is missing when I try to run Red. duskhorn:matrix.org 13:02I get no warnings running the console, why would that be? rebolek 13:03btw, can you load other PNG files? duskhorn:matrix.org 13:07Tried with other PNGs 13:07No chance hiiamboris 13:11maybe you need debug console to get warnings rebolek 13:12Hm, my Void Linux VM crashed and the file is gone. I would need to start from scratch :/ duskhorn:matrix.org 13:13Uh, how do I get the debug console? hiiamboris 13:14follow https://github.com/red/red/#running-red-from-the-sources-for-contributors but add -d switch during compilation 13:15> compile the Red console from source this part of it duskhorn:matrix.org 13:16Ok, thanks! 13:30ok update, after installing some required libraries the rebol executable tells me this ** User Error: Bad face in screen pane! ** Near: size-text self rebolek 13:41Try rebol/core instead of rebol/view 13:42http://www.rebol.com/downloads/v278/rebol-core-278-4-3.tar.gz duskhorn:matrix.org 13:54ah! I was using the view version, my bad hiiamboris 13:58idk, Red releases are built using rebol/view, so why shouldn't it work 13:59smth fishy is going on there in void linux duskhorn:matrix.org 14:04so let me see if I' doig this correctly, inside the Rebol console I have to compile the console like this do/args %red.r "-d -r %environment/console/CLI/console.red" correct? hiiamboris 14:06yep 14:07but wait 14:07you need to add needs: view to console.red header to get View module in it duskhorn:matrix.org 14:11Oh Well the load doesn't work still even in debug console. No errors and no warnings prior to that hiiamboris 14:27@qtxie any ideas? Friday 19th November, 2021 qtxie 07:26The image datatype rely on libgdk_pixbuf-2.0.so.0 on Linux. Maybe this lib cannot load png on void Linux. gltewalt:matrix.org 07:28I thought it was supposed to be load/as qtxie 07:28> you need to add needs: view to console.red header to get View module in it No need view to use image anymore. duskhorn:matrix.org 07:33No chance, error persists Does red save some config files? Like in ~/.red for example? If so, what's there? 07:39Is it meaningful that the ldd output doesn't show the gdk-pixbuf library? 07:54I tried removing the .red folder and having the console be recompiled, after reinstalling the pixbuf devel packages but it's the same as before qtxie 08:09OK. I got the same error. duskhorn:matrix.org 08:10Oh, did you manage to reproduce it? qtxie 08:15Yes. I use this Void Linux on WSL. https://github.com/am11/VoidWSL? 08:15Dependencies: https://github.com/red/red/wiki/%5BNOTE%5D-Linux-GTK-dependencies/_compare/06cd42c%5E...06cd42c rebolek 08:20@duskhorn:matrix.org I’ve rebuild the Red console on Void, it’s [here](https://rblk.eu/red-void). Warning, my server currently doesn’t autodetect binaries, so it has wrong MIME type and shows as text. I’ll fix it ASAP 08:25Server fixed and restarted, it now serves binary files properly. duskhorn:matrix.org 08:58downloading it atm, thanks in advance! hiiamboris 08:59@qtxie why would there be no warnings? duskhorn:matrix.org 09:01same error *** Access Error: cannot open: %file.png *** Where: decode *** Stack: load hiiamboris 09:04you installed the dependencies @qtxie just listed? qtxie 09:06> @qtxie why would there be no warnings? Warning? Actually the gdk_pixbuf_new_from_file failed. Seems gdk_pixbuf cannot find the loader to decode the image. 09:07@rebolek Does it work on 32bit VoidLinux? 09:09I suspect the loaders.cache doesn't update for 32bit gdk on Void. https://github.com/void-linux/void-packages/blob/master/Manual.md#gdk-pixbuf-loaders 09:12It cannot load other image formats either. I have all the loaders on the system, just that gdk_pixbuf cannot find it for some reasons. # ls /usr/lib32/gdk-pixbuf-2.0/2.10.0/loaders libpixbufloader-ani.so libpixbufloader-ico.so libpixbufloader-qtif.so libpixbufloader-xpm.so libpixbufloader-bmp.so libpixbufloader-jpeg.so libpixbufloader-tga.so libpixbufloader-gif.so libpixbufloader-png.so libpixbufloader-tiff.so libpixbufloader-icns.so libpixbufloader-pnm.so libpixbufloader-xbm.so 09:21@duskhorn:matrix.org Did you install the gtk+3 package? duskhorn:matrix.org 09:24Yes 09:25Both 64bit and 32bit qtxie 09:53@duskhorn:matrix.org Do you know how to run gdk-pixbuf-query-loaders --update-cache for 32bit gdk-pixbuf ? duskhorn:matrix.org 09:54I honestly have no clue 09:54I've never done something like that before 12:29Haha that's ok. How would you do in any other distro? greggirwin 20:08Let's make sure to note this issue in the wiki, for future reference. Sunday 21st November, 2021 hiiamboris 18:51I *love* floating point... >> mold/all 0.00263 == "0.00263" >> mold/all round/to 0.00263 0.00001 == "0.0026300000000000004" >> mold/all round/to 0.00263 10.0 * 1e-6 == "0.0026299999999999995" greggirwin 19:01Welcome to Hell. hiiamboris 19:08what's also fun is that both round/ceiling and round/floor produce the same value, but not the original one ;) greggirwin 19:10ceil and floor are coming from the std C lib? hiiamboris 19:36yeah, but I guess /to requires two multiplications: before and after rounding greggirwin 19:39I see that now. 19:39But is that only for scales >= 1? hiiamboris 19:41I guess it should be the same issue. Just need to figure out magic numbers ;) 19:43It's solved at formatting level though, if I limit precision at 16 digits. greggirwin 21:57@GiuseppeChillemi I replied in the thread about deleted messages, but Gitter said the thread was deleted. No idea what's going on there. 21:58@hiiamboris I'm OK with 16 digits in format. hiiamboris 22:06Yeah I'm too ;) Monday 22nd November, 2021 gltewalt 23:31> > $ red > >> load %file.png > *** Access Error: cannot open: %file.png > *** Where: decode > *** Stack: load > > the file in question is the following Worked fine for me 23:32 >> i: load/as %file.png 'png == make image! [1280x1143 #{ 000000000000000000000000000000000000000000000000... 23:32Red 0.6.4 for Linux built 6-Nov-2021/23:54:30-07:00 commit #fd1f289 Wednesday 24th November, 2021 gltewalt 05:11Window is not dismissed with request-dir on newest Linux. Cancel and Ok buttons no respond. 05:11Red 0.6.4 for Linux built 13-Nov-2021/3:17:19-07:00 commit #5f09829 05:15Same with request-file 20:36yay? nay? hiiamboris 20:58just crashes on Ubuntu Saturday 27th November, 2021 hiiamboris 18:00is this by design I wonder? >> m: #(ab 1 Ab 2 aB 3 AB 4) == #( ab: 1 Ab: 2 aB: 3 AB: 4 ) >> loop 4 [remove/key m 'ab] == #( Ab: 2 aB: 3 AB: 4 ) 18:00access is case-insensitive, while removal is sensitive gltewalt:matrix.org 19:32Probably - because accidentally losing something makes people uncomfortable. They should both be sensitive greggirwin 19:59https://github.com/red/docs/blob/master/en/datatypes/map.adoc#removing-keys It is documented, but not explained. We can add to docs that if you *need* case sensitive access you can use other funcs to access values (that is in the access section). Because there is no other way to remove entries, it is always case sensitive. There seems to be an error in the retrieval docs though: > Trying to access a key not defined in a map will: > produce an error if the path syntax is used. It should, and does produce none. Tuesday 7th December, 2021 Oldes 10:30Comments on [these two lines](https://github.com/red/red/blob/265878868474077d30b29478d1a7f836df0051d6/runtime/redbin.reds#L61-L62) seems to be reversed! 22:20Also there are differences between the Rebol encoder and Red/System one. Like [padding strings to 32bytes in R/S](https://github.com/red/red/blob/265878868474077d30b29478d1a7f836df0051d6/runtime/redbin.reds#L1907), but [padding to 4 bytes in Rebol](https://github.com/red/red/blob/265878868474077d30b29478d1a7f836df0051d6/utils/redbin.r#L240). greggirwin 22:55Redbin may not be Rebol compatible, but the comments are something @qtxie should be able to confirm quickly. Unless @9214 happens to be lurking. Oldes 23:11Hm... now I see that the padding is in R/S specified by bits and in Rebol by bytes. That is source of the difference. Wednesday 8th December, 2021 qtxie 01:41> Comments on [these two lines](https://github.com/red/red/blob/265878868474077d30b29478d1a7f836df0051d6/runtime/redbin.reds#L61-L62) seems to be reversed! Yes. I think so. greggirwin 03:19Thanks @qtxie, and thanks for catching that @Oldes. Thursday 9th December, 2021 Oldes 14:46@qtxie looking at [this part of code](https://github.com/red/red/blob/c691a4193dc9a350d254f83aa69913f6d3b5b1e7/runtime/crush.reds#L46-L48), there is also something wrong, because 524288 is not 1 << 18, but 1 << 19! 14:48As [there is](https://github.com/red/red/blob/c691a4193dc9a350d254f83aa69913f6d3b5b1e7/runtime/crush.reds#L52) value 7, I suppose, that CRUSH_HASH1_BITS should be 19. Friday 10th December, 2021 Oldes 10:51(But it is not an issue, because the CRUSH_HASH1_BITS is not used anywhere (just in comments for the other defines) Sunday 12nd December, 2021 qtxie 04:29Some comments may be incorrect. IIRC, I adjusted some parameters to get better compression ratio for Redbin. Friday 24th December, 2021 kermitaner 11:28is there a problem with the forall / continue commands ? this script is crashing for me ( latest build / windows ) Red [] arr: ["1" ""] forall arr [ if empty? arr/1 [continue] ] ?? arr print "end" hiiamboris 11:38yes https://github.com/red/red/issues/4990 kermitaner 12:11thx, good to know``
