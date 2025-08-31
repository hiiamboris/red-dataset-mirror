# Archived messages from: [gitter.im/red/CLI](/gitter.im/red/CLI/) from year: 2022

## Monday 28th February, 2022

cosacam1

[05:14](#msg621c5a3799d94f5f0c295160)Hi, I'm new here in gitter. RED is a great lang. I'm a REBOL/RED fan though I've used them not much (lack of time). However, I've been working recently. I'm creating a face (so to call it) which is actually a scrollable list of checks and multiline texts. However, my red.exe has stopped working. I use REEDITOR-11 and it still compiles ok (so slowly!) but it can't interpret because red.exe is broken. I can't use the console any more for the same reason (actually the GUI console is red.exe). It opens and close inmediatly. I've been googling but all I find is same problem with cmd for many users. But cmd works fine in my laptop. Only red.exe doesn't. Any suggestions? Thanks.

hiiamboris

[10:27](#msg621ca3a26b912423200f0cd5)wrong room, you should ask in https://gitter.im/red/help

[10:28](#msg621ca3cc3ae95a1ec1775c52)also mention versions of working and broken consoles

[11:27](#msg621cb19ae9cb3c52aef2119c)and see if https://github.com/red/red/issues/5073 is relevant to you

## Tuesday 1st March, 2022

cosacam1

[02:01](#msg621d7e8799d94f5f0c2bba73)thanks hiiamboris, I'll take a look to that link

[02:06](#msg621d7f9cd1b64840db44e411)actually I have several of red.exe s (one downloaded with red from github, other came with REDEDITOR-11 and other with RIDE) None of them work now. It happened some time ago with my computer at job which I finally changed for anotherone for different reasons. Now it happens in my HP laptop at home, running W10. Ok, let's see first your link. Thanks again

[02:30](#msg621d854c3ae95a1ec1794629)sorry I'm still here. I've just used rebol to compile gui-console. This is the ouput -=== Red Compiler 0.6.4 ===-

Compiling F:\\red\\red\\environment\\console\\GUI\\gui-console.red ...  
...compilation time : 6252 ms

Target: Windows

Compiling to native code...  
...compilation time : 127928 ms  
...linking time : 3389 ms  
...output file size : 1226752 bytes  
...output file : F:\\red\\red\\gui-console.exe

== none

[02:31](#msg621d8597257a357825097814)gui-console.exe is certainly in the folder but IT DOES ANSOLUTELY NOTHING not even a blink
