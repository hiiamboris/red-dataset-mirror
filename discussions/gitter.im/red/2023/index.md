# Archived messages from: [gitter.im/red/red](/gitter.im/red/red/) from year: 2023

## Sunday 1st January, 2023

greggirwin

[01:36](#msg63b0e39b378d512c183de479)Happy New Year to everyone!

meijeru

[09:55](#msg63b15877c4fec572d663aff8)I have no specific use case, but I was exploring how far one can go in making Red emulate a functional language --in other words use it for functional programming. Red already has functions as first-class values, after all.

Boum69

[09:57](#msg63b15919ff1fd121b3237e15)Best wishes for the future of the amazing Red langage and for all of you. 🙂

GalenIvanov

[10:14](#msg63b15ceabe2c3c20c7298f85)Happy New Year!

greggirwin

[19:02](#msg63b1d8ac63c9fc72d3090182)@meijeru some people have done experiments in that area. Some things are easy, e.g. always copy series. Here's one of the deeper experiments: https://gist.github.com/numberjay/3df8f13044145c6dde1918ea2cdfe3b8

## Monday 2nd January, 2023

WayneCui

[01:23](#msg63b2321bfb195421bd64ea4f)

```
--== Red 0.6.4 ==-- 
Type HELP for starting information. 

>> collect [keep 1]
== [1]
>> collect [keep [1]]
== [1]
>> collect [keep [[1]]]
== [[1]]
>> collect [keep [[[1]]]]
== [[[1]]]
```

Is the second one a feature or a bug? 😂

[01:39](#msg63b235cb0dba3574235678b4)

```
>> collect [keep/only  [1 2 4]]
== [[1 2 4]]
```

`keep/only` come to the rescue

greggirwin

[01:44](#msg63b236e1be2c3c20c72b0d1a):+1:

WayneCui

[01:44](#msg63b236f8378d512c18402b7c)So it a feature ;-)

greggirwin

[01:44](#msg63b23718c4fec572d66539c9)Correct, it is by design, like `append` works.

WayneCui

[01:47](#msg63b237c863c9fc72d309a6f3)I see, thank you for your info

meijeru

[13:35](#msg63b2dd9a8f8df4262ad2d55c)Observation: `rejoin` cannot only be used on `string!` values (which I suppose is anyhow the most frequent use) but on values of many types, in particular `block!` values, e.g:

```
>> rejoin [[][1 2 3]]
== [[1 2 3]]
>> rejoin [[1 2 3][]]
== [1 2 3 []]
```

[13:37](#msg63b2ddfe63c9fc72d30ad490)

```
>> rejoin ["" "abc"]
== "abc"
>> rejoin ["abc" ""]
== "abc"
```

&gt;

[13:37](#msg63b2de070dba35742357aaf0)Is anyone bothered by this?

hiiamboris

[13:39](#msg63b2deae8f8df4262ad2d880)Yeah, sometimes. But I rarely use it on blocks.

meijeru

[13:58](#msg63b2e3168f8df4262ad2dede)I tried the same with `vector!` values and this is even worse! `rejoin` uses `append` which uses `insert`, and the latter action does NOT accept a `vector!` value as its second argument (it will accept a `block!` though).

```
>> v1: make vector! [1 2 3]
== make vector! [1 2 3]
>> v2: make vector! [4 5]
== make vector! [4 5]
>> append v1 v2
*** Script Error: invalid argument: make vector! [4 5]
*** Where: append
>> append v1 [4 5]
== make vector! [1 2 3 4 5]
```

[13:59](#msg63b2e334c4fec572d6666999)Worth filing an issue??

hiiamboris

[14:03](#msg63b2e44763c9fc72d30ae17d)https://github.com/red/red/issues/4080 https://github.com/red/red/issues/4408 take your pick

meijeru

[14:18](#msg63b2e7b2378d512c18416c19)I am glad I did not rush into filing a new issue, but I am sad that this is still not resolved! @dockimbel assigned himself last september so we may have hope...

hiiamboris

[14:32](#msg63b2eb18fb195421bd663243)Vectors need total redesign, so that's why probably fixing it is not a priority

## Thursday 5th January, 2023

meijeru

[16:18](#msg63b6f86540557a3d5c5f8e4e)I observed that the `only` refinement on `find` disallows the use of datatypes as search argument

```
>> find [a 1 b 2] integer!
== [1 b 2]
>> find/only [a 1 b 2] integer!
== none
```

Is this a bug, or a conscious restriction, and if so, why?

hiiamboris

[16:27](#msg63b6fa78c4fec572d66e5608)Because sometimes you don't want the smarts:

```
>> find/only reduce [integer! block! string!] block!
== [block! string!]
```

## Saturday 14th January, 2023

WayneCui

[08:30](#msg63c26808d8678973f9b01e2e)

```
--== Red 0.6.4 ==-- 
Type HELP for starting information. 

>> #{00000000} = #{00000000}
== true
>> #{00000000} = 2#{00000000}
== false
```

Hello, can `binary!` data compare with different base? Or is there any way convert one to different base?

toomasv

[09:00](#msg63c26f2ffb195421bd83b7f1)@WayneCui

```
>> 2#{00000000}
== #{00}
>> #{00000000} = 2#{00000000000000000000000000000000}
== true
```

Also, see help on `enbase` and `debase`. Better yet https://github.com/red/docs/blob/master/en/datatypes/binary.adoc

WayneCui

[09:12](#msg63c2720c63c9fc72d328858d)@toomasv Thanks a lot , I will try it

toomasv

[09:18](#msg63c2737e3b37dd2c117ae90d):+1:

WayneCui

[09:58](#msg63c27ce04bbc000f0940263c)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/Sg1v/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/Sg1v/image.png)

[09:59](#msg63c27cf0ff1fd121b343ba5f)Great!

[10:03](#msg63c27e04ff1fd121b343bc2b)Just working on a Hessian data (java) deserialization client. I love `PARSE` ;-) https://github.com/WayneCui/red-hessian/blob/main/hessian-v1-parser.red

hiiamboris

[10:13](#msg63c28041fb195421bd83d454)you might wanna `parse` the result of `enbase` on this screenshot as well

[10:14](#msg63c2808d4bbc000f09402c32)though for performance I would recommend using charsets instead

luce80

[10:17](#msg63c281200cd40c2e89d5e419)Is there a way to know if my script was run from console prompt or not ?

hiiamboris

[10:18](#msg63c2815dc9591d20d3a0f1e7)by console prompt you mean...?

luce80

[10:23](#msg63c282a4378d512c185f5cf2)Yes, so I can quit without closing the console window.

hiiamboris

[10:28](#msg63c283dc3b37dd2c117b0510)so you mean Red GUI console then

[10:29](#msg63c28401c9591d20d3a0f673)easy.. just check `index?` of `system/view/screens/1/pane`, or `system/console/gui?`

[10:30](#msg63c28443ff1fd121b343c92a)but generally if you don't want to quit, just don't use `quit`, use `unview`

WayneCui

[10:41](#msg63c286d34bbc000f09403765)

```
two-byte:   [copy first-byte skip if (parse (enbase/base first-byte 2) ["110" to end]) (append buf first-byte)]
```

You mean this way? @hiiamboris

[10:41](#msg63c286d9c9591d20d3a0faac)Yeah, it works as well

hiiamboris

[11:01](#msg63c28b8c0dba35742375a013)yes, but you can write a single rule to cover all 4 cases

WayneCui

[11:31](#msg63c292a9d8678973f9b06a0c)Thanks for your advice, I will try it @hiiamboris

## Wednesday 18th January, 2023

WayneCui

[14:03](#msg63c7fc3ac47d581062977a4f)Can Red script read the content of the stdout or stderr, eg. if `print {Hello world}` , then got "Hello world"?

[14:09](#msg63c7fdaf06f8e06b0c787daf)My testcase would start a java server, and it would print the listening port to rhe stdout, but the port is different every time. I want to get the port automatically by read from the stdout

hiiamboris

[14:28](#msg63c801fab1f383475e0a7735)No, you need ports for that and they are not implemented. You can read a file though.

WayneCui

[14:36](#msg63c803f0d86fd34ee55f58cf)Thanks for your info.

hiiamboris

[15:02](#msg63c80a0d3031eb3361847f4f)@WayneCui it probably won't help you, but you can also capture the stdout output of the processes started from Red with `call`, when they finish.

## Thursday 19th January, 2023

WayneCui

[02:39](#msg63c8ad6a6f6a0b74193fb54a)@hiiamboris It would be fine if it works. The java process has started, but `call` can't return back, Maybe it's because red is single-threaded?

[02:40](#msg63c8ada3c47d58106298c7ba)\[!\[image.png](https://files.gitter.im/5565a1d415522ed4b3e10094/o0wg/thumb/image.png)](https://files.gitter.im/5565a1d415522ed4b3e10094/o0wg/image.png)

[02:47](#msg63c8af34726b415e594bb41d)

```
> redl calltest.red
Listening on http port: 54942, ssl port: 54943
```

I know what you mean by \*\*when they finish\** , when I killed the java process, I got what I needed

[02:49](#msg63c8afd20110ad104dd9a912)😂

[02:52](#msg63c8b07cf2b13e5e50f8716d)Anyway, this is not a MUST feature

ldci

[08:16](#msg63c8fc70c98ea74762a923ff)@WayneCui. May be you can try `call/wait`-&gt;Runs command and waits for exit.

WayneCui

[15:03](#msg63c95bb07bcbfb74311e0b06)Make it with a temp file as @hiiamboris suggested ;-)

```
tmp-file: %port.tmp
call/output "java -jar ../support/hessian-test-servlet.jar" tmp-file
data: read/lines tmp-file 
parse data/1 [
    thru "Listening on http port: " copy http-port to "," to end
]
?? http-port
delete tmp-file

hessian-proxy: make hessian-proxy-base [
    point: to-url rejoin ["http://127.0.0.1:" http-port "/api"]
]
```

[15:06](#msg63c95c5a06f8e06b0c7b131e)@ldci It is a long-runing web server, I need get the listening port after it has stated, but not when exit.

[15:09](#msg63c95d3215734c6b1235ccd6)Then there is another question: how to kill the server process when test cases all finished?

[15:19](#msg63c95f8621f77a334d9a2564)Have cover 70 test cases. If you have Java installed on your computer, can play with it. ;-) https://github.com/WayneCui/red-hessian

## Tuesday 24th January, 2023

greggirwin

[23:48](#msg63d06e33d00f0d49472597fc)Thanks for the update @WayneCui !

## Sunday 29th January, 2023

pekr

[12:04](#msg63d660c8624f3f4330362c88)There is a question towards the Red progress on the FB group, by an old time Red follower. Not sure what to reply. The last blog update is cca 6 months old. Any news towards the outlined action plan, namely the 0.7 IO release?

meijeru

[16:27](#msg63d69e8efc90af0348aa0ba8)Which FB group do you refer to? The one called `Redprogramminglanguage` has no news after 2020...

pekr

[17:14](#msg63d6a9817740c84e493abc0a)https://www.facebook.com/groups/395927227139509

meijeru

[21:21](#msg63d6e355ec2bfc62867b14e3)I see. This is a \_group\_, not a \_page\_. So the who is behind that page I mentioned, @Redprogramminglanguage?

## Tuesday 31st January, 2023

hammer-x86-64

[15:15](#msg63d9309dfc90af0348aefece)Is this the place to ask for help?

hiiamboris

[15:20](#msg63d931a88e760b51fd172f1b)Hi @hammer-x86-64 , use the \[help room](https://gitter.im/red/help) :)

## Sunday 5th February, 2023

koplenov

[18:58](#msg63dffc46eddd71596c17b2e4)Hi, do you have web server examples? Maybe something simple level express js

hiiamboris

[19:11](#msg63dfff44c841ba597f2d69ec)Hi @koplenov :) see https://gitlab.com/rebolek/castr/-/blob/master/hub.red

[19:12](#msg63dfffb84ecd45446ec6c744)HTTP is not yet part of the Red runtime, so no "simple level". Also you'll need the \[IO branch](https://github.com/red/red/tree/IO) to run it.

## Saturday 11st February, 2023

GiuseppeChillemi

[20:16](#msg63e7f7b58e6e0d2338f8810b)Would It be possibile run assembly instructions from Red? Maybe from R/S?

## Sunday 12nd February, 2023

greggirwin

[20:15](#msg63e948fcd97eaa59cd05e331)With the coming Gitter change, here's a backup channel we can use for issues https://github.com/red/red/discussions/5282

## Monday 13th February, 2023

davidjayjackson

[02:39](#msg63e9a2d48e6e0d2338fb6994)(Window 10) What is the correct syntax for the header? When I run the code below I get the following error?  
Syntax Error: script is missing a Red header: /C/Users/david/Documents/ChatGPT/Fibonacci.Red  
\*\** Where: do  
\*\** Near : do %/C/Users/david/Documents/ChatGPT/Fibo  
\*\** Stack: do-file cause-error

===== Red Code ====  
red \[0.6.4]  
fib: func \[n][  
if n &lt; 2 \[return n]  
return fib(n - 1) + fib(n - 2)  
]

count: 100  
sequence: make block! count

sequence/1: 0  
sequence/2: 1

loop i 3 count [  
sequence/:i: sequence/(i - 1) + sequence/(i - 2)  
]

print sequence

ne1uno

[02:49](#msg63e9a552f209f7211192fe4f)header `Red`

[02:51](#msg63e9a5c6f209f7211192fed0)tell chatGPT to imagine you are an experienced reducer next time
