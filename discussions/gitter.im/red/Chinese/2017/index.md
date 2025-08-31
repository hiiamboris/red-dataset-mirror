# Archived messages from: [gitter.im/red/red/Chinese](/gitter.im/red/red/Chinese/) from year: 2017

## Tuesday 24th January, 2017

biuuw

[14:38](#msg588766cc074f7be7630fb331)想问一下，学习red 有没有中文的学习手册?

## Thursday 26th January, 2017

qtxie

[01:34](#msg5889523a074f7be7631b561d)@biuuw 目前没有官方文档，不过有些小伙伴翻译了一些

## Sunday 2nd April, 2017

bingdufenqi

[04:03](#msg58e07816bc370d964edcc83e)请问有链接之类的吗，教程的链接

[04:03](#msg58e0782b0e4137042ad4c56d)好喜欢这个语言，好想学喔

qtxie

[06:42](#msg58e09d50f22385553dfe19f3)doc.red-lang.org

[06:44](#msg58e09dc18fcce56b20c0090c)Red语言的基础教程还没有写，可以参考Rebol的\[教程](http://www.rebol.com/docs/core23/rebolcore.html).

## Thursday 27th April, 2017

JerryTsai

[16:01](#msg590215bfc1d3b5015427b9a8)也可以参考蔡学镛的书「编程ING: 人人都能学会程序设计」

## Friday 28th April, 2017

wzy2687

[00:46](#msg590290ce8bb56c2d11ed9cda)目前red 在64bit的linux上不能直接运行. 这个有改善计划吗? @qtxie

[00:52](#msg590292366aea30763d4c9600)想在linux下把 red嵌入c语言程序中, 但是red依赖于 32bit的一些库. 感觉不方便. @JerryTsai @qtxie

qtxie

[02:02](#msg5902a2bd08c00c092ac2541f)@wzy 在Red 0.7发布以后，会考虑64bit的支持。

wzy2687

[02:03](#msg5902a2f908c00c092ac2553c)@qtxie 谢谢. 能看到各个版本的大概时间表吗?

qtxie

[02:03](#msg5902a30f08c00c092ac25561)https://trello.com/b/FlQ6pzdB/red-tasks-overview

[02:05](#msg5902a376f22385553d83913e)应该今年是没有时间了，能做完0.7就很不错了

wzy2687

[02:08](#msg5902a41ccfec919272810da1)@qtxie 理解. 毕竟开发人员不多.

## Monday 5th June, 2017

Oldes

[08:48](#msg59351aeeca6d4ae80ce16126)Hi there... we are releasing our game Samorost 3 and our contact in China, who is applying for government game id told us, that even names must be translated. To me it looks like a nonsense, but we received this translation. Could you please tell me if it is ok? As all this text are just names, I believe it must look strange for you to read it in Chinese, isn't it?

[08:48](#msg59351afaf31c8ced0c048f01)\[!\[s3-credits.png](https://files.gitter.im/red/red/Chinese/1Qis/thumb/s3-credits.png)](https://files.gitter.im/red/red/Chinese/1Qis/s3-credits.png)

qtxie

[09:38](#msg59352688f2dd2dba066e0f74)@Oldes It's ok. :smile:

## Thursday 20th July, 2017

WayneCui

[12:24](#msg5970a101f5b3458e306608db)http://mp.weixin.qq.com/s/r3reWJqaq0yvh1CmuROduQ

qtxie

[13:45](#msg5970b41689aea4761db932b2):+1:

## Friday 21st July, 2017

youyangzazu

[14:43](#msg59721311c101bc4e3aa96172)刚下了Jerry的中学生编程

[14:50](#msg597214b03230e14f3a7f6720)说 设字 是一种字面值，这句没懂

defp

[15:08](#msg597218f376a757f8083291c2)好冷清

youyangzazu

[15:10](#msg59721964c101bc4e3aa980b7)那就让它热闹起来呗

Blocode

[16:00](#msg5972251e76a757f80832c9f4)@youyangzazu "设字" 就是 set-word! 数据类型的中文翻译，就是设定单字的意思。所谓的字面值，就是英文 literal，意思是"字面上的意思"。

[16:03](#msg597225c4c101bc4e3aa9bca6)看书看得好快，居然看到"设字"的部分。

youyangzazu

[16:18](#msg59722967614889d475d8e978)@Blocode 我是不明白为什么设字是字面值，看到后面说paren和block也是字面值，就更迷糊了。

[16:19](#msg5972299dc101bc4e3aa9cd2e)书粗略看完了，最后几个例子没实际输入，明天尝试

[16:27](#msg59722b6fbc46472974113618)相对于GUI，我更想了解Parser

Cifer-Y

[16:46](#msg59722ffa76a757f80832fcc0)从中学生编程过来的～～～ 😆

[16:50](#msg597230c31c8697534a48c07a)red 是没有全局 command 吗？换个目录就要下一个新的 red ？

Blocode

[19:40](#msg597258b689aea4761dc01566)如果要执行的脚本文件 (例如clock.red) 和red.exe在不同的目录（例如是放在c:\\users\\lee\\my-code），就要用这样的方式执行: &gt;&gt; do %/c/users/lee/my-code/clock.red

[19:44](#msg5972599d45fc670746b46698)或者也可以设置操作系统的PATH环境变量，让系统自动搜索到 red.exe 。

## Saturday 22nd July, 2017

qtxie

[00:17](#msg597299a3f5b3458e306e17ca)@youyangzazu 字面值通俗来讲就是：能直接写出来的值。比如：

```
整数：     123
字符串：   "Hello"
字：       abc
设字：     abc:
```

[00:20](#msg59729a4389aea4761dc0fd14)有些值是没法直接写出来的，比如：图像（image!），需要用make函数来构建：

```
make image! 100x100
```

[00:22](#msg59729ab345fc670746b54581)@Blocode 目前放PATH里运行会出错，下个版本会修正。

[00:25](#msg59729b60614889d475dabd61)@Cifer-Y 目前有两个方式：  
1\. 像 @Blocode 说的，用 `>>do %你的文件路径`.  
2\. 每一个目录里复制一份red. :sweat\_smile:

charkz

[01:02](#msg5972a43b89aea4761dc116ea)大家好，看中学生编程来的~

83490091

[01:52](#msg5972afdbc101bc4e3aabc28b)哈哈,我也是来看中学生编程来的...red终于发布新版本了....好期待1.0的出世!!!!!!!

Zjhyang12335

[03:32](#msg5972c742c101bc4e3aac0460)刚看到中学生编程

[03:32](#msg5972c75a329651f46eaf649c)有人知道是谁写的吗

[03:34](#msg5972c7d976a757f8083525e1)怎么下载最新版本？？

[03:34](#msg5972c7e1f5b3458e306e9694)是0.6.3吗

g1eny0ung

[03:53](#msg5972cc4ff5b3458e306ea1be)最新版是0.6.3的

[03:53](#msg5972cc57614889d475db4f2f)http://www.red-lang.org/p/download.html

[03:54](#msg5972cc5d89aea4761dc18b28)这里下载

Zjhyang12335

[03:54](#msg5972cc7fbc46472974135e07)red-lang.org被墙了

[03:55](#msg5972cca33230e14f3a820de8)不过已经在http://red-lang.qiniudn.com下了

g1eny0ung

[03:56](#msg5972cce6bc46472974135eed):smile: 嗯嗯

Blocode

[05:21](#msg5972e0f3f5b3458e306ee080)@Zjhyang12335 我想你问的 "最新版" 是指中学生编程这书是否0.6.3是最新版。是的。这书昨天晚上刚刚发布。下一个版本的书应该会是 0.6.4，书的版本號和 Red 语言同步。

Zjhyang12335

[06:00](#msg5972ea121c8697534a4b3be8)为什么要放用户文件夹里还要改名？？

superkunn

[06:48](#msg5972f541f5b3458e306f1fc9)虽然过了中学生的年龄了，但是我这把老骨头也要学一下

charkz

[06:49](#msg5972f56d45fc670746b64948)同老同老，，老年编程初学者。

Zjhyang12335

[06:49](#msg5972f588614889d475dbbfd5)-.-

[07:22](#msg5972fd3c1c8697534a4b779b)Red也是面向对象？

sphawkcn

[07:47](#msg5973031276a757f80835dd3b)red确实是人丁稀少啊。

lgdxx

[10:17](#msg5973264a4bcd78af56d5406b)@superkunn @charkz 一起学习

chenge

[10:31](#msg5973297dbc46472974148620)Red不错，有特点

wjlmnop\_twitter

[11:48](#msg59733b863230e14f3a83634d)老年编程初学者。

qtxie

[11:51](#msg59733c3345fc670746b72c76)http://red.github.io/  
有需要的童鞋可以在这里下载每日构建版本red-latest

Gongjiangege

[12:00](#msg59733e7389aea4761dc2fe5c)\[提问]依照《中学生》，mac环境，red同目录下建立ex01.red脚本，然后&gt;&gt; do %ex01.red  
\*\** Access Error: cannot open: %ex01.red  
\*\** Where: read  
\*\** Stack: do-file

wjlmnop\_twitter

[12:01](#msg59733ea7329651f46eb0cbed)初学者。

lgdxx

[12:01](#msg59733eb0614889d475dca5f9)@Gongjiangege mac下怎么样我不知道，但是我在windows下一切OK

Gongjiangege

[12:09](#msg597340773230e14f3a8375ae)对这个文件chmod也没解决。

Blocode

[12:23](#msg597343d145fc670746b744d0)@Gongjiangege mac 版本在的路径处理上有问题，你可以用 &gt;&gt; PWD 看看当前的目录为何（这个目录可能和你的 red 执行文件所在目录不同），然后把你的脚本放在这个目录下，就可以用 &gt;&gt; do %ex01.red 的方式执行脚本了。例如， &gt;&gt; pwd 告诉你目录是 == /Users/justin ，你就把 ex01.red 放到这里。

[12:24](#msg597343f32723db8d5e372e39)变成 /Users/justin/ex01.red

[12:28](#msg597344d71c8697534a4c63e8)\*\*Access Error: cannot open: %ex01.red Where: read  
\* Stack: do-file\** 通常是找不到文件的错误信息。 这时候你可以 &gt;&gt; LS 看看是否在当前工作目录下可以找到 ex01.red ，应该是找不到。

Gongjiangege

[12:41](#msg5973480c89aea4761dc31fe0)@Blocode 谢谢，确实是路径问题，Mac下\*.red应放在pwd指向的目录而非简单的和red执行文件同目录下，关于这点可更新《中学生》p12。再次感谢你的帮助。

[12:54](#msg59734b151c8697534a4c7931)\[请教]延伸问题：如/Users/justin/这样的目录是一个层级很高的目录（类似于C:\\users\\）里面有许多重要目录，非常不适合管理大量的代码文件，而通常管理代码是保存在自定义子目录。mac 下什么方法可以使得red直接do 这些在其他目录中的代码文件？

g1eny0ung

[13:43](#msg5973569b329651f46eb11fce)假设你的代码文件夹是demo，里面有一个main.red文件，然后在demo的同级目录下输入red，然后`do %demo/main.red`就可以了。

[13:48](#msg597357c2329651f46eb123d9)@Gongjiangege 也可以直接用red命令来运行，打开Terminal，输入`mkdir demo && echo "Red[] print 1" > demo/test.red && red demo/test.red`

[13:51](#msg5973585289aea4761dc35710)第一个命令是mkdir是创建文件夹demo，&amp;&amp;之后的echo是把`Red[] print 1`输入到demo文件夹下的test.red文件中，\*\*&gt;\*\*可以理解为\*\*输入到\*\*，最后&amp;&amp;之后的就是运行命令了。

Gongjiangege

[14:28](#msg597360f976a757f808371461)哦，验证可行，谢谢@g1eny0ung 的帮助。

g1eny0ung

[14:29](#msg5973615c0cef4fed2eb7fd46)不客气 :smiley:

## Sunday 23th July, 2017

xjq000814

[04:24](#msg5974251376a757f8083975b6)问一下大家 为什么我打开软件没有出现《《字符啊

[04:26](#msg59742586bc46472974179c55)没有出现》》

robin4han

[04:27](#msg597425c745fc670746ba1004)要等个一两分钟

[04:28](#msg597425dfc101bc4e3ab028dc)是这个字符 &gt;&gt;

[04:29](#msg5974261bbc46472974179e5d)# xxxx @ 192 in ~ \[12:27:12]  
$ /Users/xxx/red ; exit;  
\--== Red 0.6.3 ==--  
Type HELP for starting information.

&gt;&gt;

[04:29](#msg5974262876a757f80839793b)Like this

xjq000814

[04:29](#msg5974263ff5b3458e3072f578)它现在显示的是compiling Red GUI console。。。。。

robin4han

[04:30](#msg5974264a76a757f808397962)Just wait

xjq000814

[04:30](#msg5974265cbc46472974179eb1)OK thanks

[04:30](#msg5974267a89aea4761dc5d638)you are so willing

[05:29](#msg597434433230e14f3a865fd0)&gt;&gt; do %clock.red  
\*\** Access Error: cannot open: %clock.red  
\*\** Where: read  
\*\** Stack: do-file

[05:29](#msg597434551c8697534a4f5361)what happen？what it mean？

[05:30](#msg5974346445fc670746ba3a08)who know？

g1eny0ung

[05:32](#msg597434e681cd9a5d7e9b5e76)检查一下clock.red是否存在呢

xjq000814

[05:32](#msg597434f4f5b3458e30731886)存在的呀

[05:32](#msg597435052723db8d5e3a278f)和red exe保存在一起的记事本

g1eny0ung

[05:32](#msg5974350651915d962af6b80d)错误信息很明了了，访问错误，打不开clock.red

[05:34](#msg5974354a19147ac323145bf4)在red里输入一下ls，看看有没有这个文件

xjq000814

[05:34](#msg5974356b89aea4761dc5fd21)&gt;&gt; ls  
clock.red.txt red.exe.exe

[05:34](#msg5974357245fc670746ba3cc9)有的涯

[05:34](#msg5974357676a757f80839a839)有的呀

g1eny0ung

[05:35](#msg5974358a42d2f6102587ebb0)把clock.red.txt改成clock.red

[05:35](#msg597435a219147ac323145bf6)文件扩展名不对的

[05:35](#msg597435bb19147ac323145bf8)应该是这个问题

xjq000814

[05:36](#msg597435db1c8697534a4f581b)怎么改啊 我文件夹里保存的好像就是clock.red么。。

g1eny0ung

[05:37](#msg5974361051915d962af6b811)额。。我windows用的不熟，应该是有个选项显示文件扩展名，然后重命名就行了

xjq000814

[05:38](#msg5974366445fc670746ba3fce)好的 谢谢啊

g1eny0ung

[05:38](#msg5974366d51915d962af6b813)或者你直接输入`do %clock.red.txt`

xjq000814

[05:39](#msg597436a6c101bc4e3ab056da)OK

[05:39](#msg597436ad2723db8d5e3a2c34)谢谢

g1eny0ung

[05:40](#msg597436c242d2f6102587ebbb)不客气 :smile:

Cifer-Y

[09:12](#msg597468694bcd78af56d92a84)windows 的 ext 和 filename 好像不是在一起的，改 ext 的时候不能光改 filename 了事

lgdxx

[12:07](#msg5974918a76a757f8083ac86a)今天把两个练习做完了，慢慢思考一下

[12:09](#msg59749217f5b3458e307435ed)如何把写的小程序打包成exe，发给朋友们玩？

Cifer-Y

[13:34](#msg5974a5d1bc4647297419278a)@lgdxx red -c -t Windows

[13:34](#msg5974a5f21c8697534a50bd00)@lgdxx red --help 就能看到

lgdxx

[15:49](#msg5974c59b329651f46eb5a27e)@Cifer-Y 谢谢

## Monday 24th July, 2017

lijianweicode

[03:14](#msg5975661ff5b3458e30771181)请问这是这么回事呢？red --help  
\*\** Script Error: --help has no value  
\*\** Where: catch  
\*\** Stack:

JenniferLee520

[05:21](#msg597583d82723db8d5e3e821c)@lijianweicode 那个不是在 Red 交互环境下输入的，是要在macOS终端，或者Windows命令提示字符中输入的。

lijianweicode

[05:33](#msg5975869a89aea4761dca52b0)哦哦 原来是这样啊 谢谢😃

## Wednesday 26th July, 2017

lgdxx

[01:19](#msg5977ee1c714ea96f7821b4a7)25号没有交流，这不科学，RED是一门好的语言，我已经爱上它了

GHwlaw

[02:22](#msg5977fcee45fc670746c8cb24)确实有意思，

[02:23](#msg5977fd08614889d475ee6cc0)及时输出

lgdxx

[02:23](#msg5977fd14f5b3458e3081bf2e)@GHwlaw 握爪

Cifer-Y

[09:45](#msg597864d0614889d475effc37)red 在服务端编程表现怎么样啊？

southwolf

[09:46](#msg597864e32723db8d5e4a55cd)连个靠谱的 Socket/HTTP 库都没有。。。别想了

Cifer-Y

[09:46](#msg597864f2bc4647297427f4f0)哇。 。。这都有你

ixaelo

[14:08](#msg5978a2444bcd78af56e9b0a0)请问

[14:09](#msg5978a283f5b3458e30845177)请问red用什么IDE比较好？

lgdxx

[14:09](#msg5978a2b61c8697534a607fde)@ixaelo 没听说过专门的，我用的是sublime3

lizheng-s2

[14:10](#msg5978a2b9c101bc4e3ac16a48)不太清楚，我也是刚开始学习red，也想问这个问题呢

southwolf

[14:11](#msg5978a2f5a7b406262d31a463)sublime/Atom/VS Code 都有 Red 语法高亮的插件。曾经有几个 Red 专用的 IDE 不过都不维护了

ixaelo

[14:11](#msg5978a2fe45fc670746cb656b)谢谢 我去试试

## Thursday 27th July, 2017

mahengyang

[06:34](#msg5979895f329651f46ec80d9b)中学生编程来的

[06:38](#msg59798a4cc101bc4e3ac4a077)red的中文教程好少啊

## Friday 28th July, 2017

mahengyang

[06:36](#msg597adb5d2723db8d5e536ccc)怎么在`draw`函数里写循环啊

[06:36](#msg597adb721c8697534a68a499)比如画20条竖线

qtxie

[06:50](#msg597ade99329651f46eccc8d1)@mahengyang 把你的绘图指令放到draw block里面：

```
x: 10 y: 10
draw-cmds: make block! 100
loop 20 [
	append draw-cmds reduce ['line as-pair x y as-pair x y + 80]
	x: x + 10
]
view [base 210x100 draw draw-cmds]
```

mahengyang

[06:53](#msg597adf7a76a757f808532718)@qtxie 谢谢，原来是这么玩的呀

xiaohong

[07:07](#msg597ae29545fc670746d38b30)probe 函数什么意思呢？ 有没有所有函数的文档 @qtxie

[07:07](#msg597ae2b3614889d475f95693)print?

qtxie

[07:11](#msg597ae3b0bc46472974312546)目前没有，只能参考Rebol的

[07:12](#msg597ae3db614889d475f95a7e)你可以在google或者bing里搜索 “probe rebol”

mahengyang

[07:12](#msg597ae3e6f5b3458e308c7919)`’line` 像这种语法，line前面加单引号是什么意思呢

qtxie

[07:12](#msg597ae3f0f5b3458e308c7954)试了下百度，辣鸡，搜不到

xiaohong

[07:12](#msg597ae3f7f5b3458e308c7962)符号

mahengyang

[07:13](#msg597ae40ca7b406262d39e0ff)`append my-draw reduce ['line-cap 'round 'line as-pair x y as-pair x y + 10]`我稍微改了一下，line-cap 和round都需要加单引号才行

xiaohong

[07:13](#msg597ae40c89aea4761ddf475b)@mahengyang 好像和clojure里的'line是一样的

mahengyang

[07:14](#msg597ae43ebc46472974312663)不求值？

xiaohong

[07:14](#msg597ae442614889d475f95bb9)应该是避免word被执行，

[07:14](#msg597ae448614889d475f95bc4)我猜测是的

mahengyang

[07:14](#msg597ae449329651f46eccdf6f)reduce的时候才求值

[07:14](#msg597ae45a329651f46eccdf85)@xiaohong 好厉害呀，clojure也会

qtxie

[07:14](#msg597ae462f5b3458e308c7a0d)@mahengyang 对，因为reduce会对block里面的内容求值

mahengyang

[07:15](#msg597ae48fa7b406262d39e2c3)我一直在找一门语言，可以教初学者

[07:15](#msg597ae499614889d475f95cf0)自己写着也要顺手

[07:16](#msg597ae4b04bcd78af56f1dd0e)red有图形化的操作，看着不错

qtxie

[07:17](#msg597ae4ef89aea4761ddf4b77)也可以用`compose`来改写：

```
append my-draw compose [line-cap round line (as-pair x y) (as-pair x y + 10)]
```

mahengyang

[07:18](#msg597ae539f5b3458e308c7c3d)`Returns a copy of a block, evaluating only parens.`

[07:18](#msg597ae554bc46472974312a66)这个好，只对括号内的求值

[07:19](#msg597ae58876a757f808533c93)clojure就没有这个功能，还要自己写宏

[07:20](#msg597ae5cd76a757f808533dc9)像compose这种函数，单看文档不知道有什么用，结合具体的案例，一下就明白了

[08:13](#msg597af21d1c8697534a68f9d7)

```
node: declare struct! [
	father	[c-string!]
	suns	[block!]
]
```

declare 不能用吗？

[08:13](#msg597af22f614889d475f9955f)`*** Script Error: declare has no value`

qtxie

[08:18](#msg597af363614889d475f99ac7)declare是Red/System里的关键字，你把它跟Red混在一起了

mahengyang

[08:19](#msg597af384f5b3458e308cb996)我看的帮助文档里有结构体

qtxie

[08:19](#msg597af38ea7b406262d3a1a9f)哪个文档？

mahengyang

[08:19](#msg597af398bc46472974316153)http://static.red-lang.org/red-system-specs.html#section-4.7

[08:19](#msg597af3a7a7b406262d3a1ad3)Struct! datatype is roughly equivalent to C struct type. It is a record of one or several values, each value having its own datatype. A struct variable holds the memory address of a struct value.

qtxie

[08:21](#msg597af3ec89aea4761ddf8265)这个是Red/System的文档

[08:21](#msg597af3fe4bcd78af56f211e6)Red和Red/System是两种语言

mahengyang

[08:21](#msg597af41c2723db8d5e53c1f8)还能这样，看名字我以为是System模块呢

qtxie

[08:21](#msg597af42345fc670746d3ce99)虽然语法相似，编程模型大不相同。

mahengyang

[08:22](#msg597af434329651f46ecd1525)那red里有类似的数据结构吗？

[08:22](#msg597af43b76a757f8085378d0)类似java对象的

qtxie

[08:22](#msg597af455a7b406262d3a1d57)对，所以如果你要学Red，最好不要看这个文档，不然容易把自己弄晕

[08:24](#msg597af4a089aea4761ddf860d)Red/Rebol里有struct!，但是Red还没有实现

[08:24](#msg597af4aec101bc4e3ac9ca77)如果你要对象，object!应该是你需要的

[08:24](#msg597af4d24bcd78af56f214f0)struct!是用来映射C结构体的

mahengyang

[08:26](#msg597af53945fc670746d3d1db)

```
book: object [
    title: author: none
    show: does [print [mold title "was written by" author]]
]
```

看起来可以这样子，但是里面的字段没有类型

qtxie

[08:27](#msg597af57e76a757f808537d42)@mahengyang 学习Red，目前没有官方文档，推荐暂时用\[Rebol的文档](http://www.rebol.com/docs/core23/rebolcore.html), 95%兼容。:-)

[08:28](#msg597af593bc4647297431680b)Red是动态类型的，函数的参数有时会声明类型，是为了做类型检查。

mahengyang

[08:28](#msg597af5c84bcd78af56f217a9)好的，谢谢

qtxie

[08:30](#msg597af62e329651f46ecd1bc6)@mahengyang 不用谢，你用过其他动态类型的语言吗？比如python, ruby之类的

mahengyang

[08:31](#msg597af6594bcd78af56f219b7)用过

[08:32](#msg597af68a4bcd78af56f21ab2)用过的，

qtxie

[08:39](#msg597af846a7b406262d3a2ce5)那应该容易理解的，Red也是动态类型的，Red里在运行时改变代码是很容易的：

```
code: [print "abc123"]
loop 3 [
	do code
	random code/2
]
```

xiaohong

[10:01](#msg597b0b7a4bcd78af56f26b84)red1.0 到啥时候才能开发完呢？

OhCoder

[13:21](#msg597b3a57329651f46ece2545)问下，现在 0.6.2 支持 Mac下的GUI了吗？

qtxie

[14:19](#msg597b47e2bc4647297432b187)最新版，也就是0.6.3支持的

OhCoder

[14:37](#msg597b4c3c614889d475fb0202)好的。三克油

## Saturday 29th July, 2017

JackyXk

[07:41](#msg597c3c11329651f46ed176ba)666

## Monday 31st July, 2017

mahengyang

[07:38](#msg597ede7dc101bc4e3ad58463)

```
g: “a”
num: 2
numbers: make hash! [g num]
print numbers
```

[07:38](#msg597ede8a329651f46ed8d67d)这段代码打印出来的hash格式不对啊

JenniferLee520

[09:10](#msg597ef3fd210ac269203e77da)1. “a” 要改成 "a" ，因为你用了错误的双引号。2. hash! 后面，\[g num] 前面要加上 reduce

mahengyang

[09:11](#msg597ef426329651f46ed922b4)我知道怎么用了，hash!不是java里的hashmap

[09:11](#msg597ef42dbc464729743d8064)要用map!

JenniferLee520

[09:11](#msg597ef431329651f46ed922da)是的

[09:11](#msg597ef45e76a757f8085fb2d5)map 的文档在这里 https://doc.red-lang.org/en/map.html

mahengyang

[09:12](#msg597ef474329651f46ed9251b)谢谢啦

JenniferLee520

[09:12](#msg597ef496f5b3458e3098dd81)不用谢

roaming-zen

[12:54](#msg597f2899614889d4750698a7)大家好 ^\_^

qtxie

[13:57](#msg597f375a210ac269203f8074)你好 :smile:

## Tuesday 1st August, 2017

valiantplayer

[08:14](#msg5980386d210ac26920432463)为

Hantianshui

[12:59](#msg59807b4e1c8697534a7b0f51)view \[ size 200×200 button "NO" \[ unview ] ] 这个表达方法对不对 求大神解答

qtxie

[13:44](#msg598085cbf5b3458e309efb41)对的，不过你的`x`不是正常的，所以报错了

[13:44](#msg598085d74bcd78af56043212)

```
view [ size 200x200 button "NO" [ unview ] ]
```

Blocode

[13:44](#msg598085d7c101bc4e3adbc73d)@Hantianshui 你的 200x200 写错了，中间是X

[13:45](#msg598086011c8697534a7b3faa)Pair! 中间必须是英文的X，大写小写都行。

[13:46](#msg59808619329651f46edef185)你写成一个长得很像 X，但不是 X 的符号

qtxie

[13:46](#msg5980863b210ac26920446db0)@Hantianshui 奇怪，你在哪里复制的代码？

Blocode

[13:47](#msg5980865ea7b406262d4c1f19)对呀！奇怪，要输入一个这样的符号，反而不容易。

[13:49](#msg598086e7f5b3458e309f0149)这个奇怪的符号 Unicode 是 0x00D7

## Wednesday 2nd August, 2017

oppih

[07:34](#msg59818073f5b3458e30a2a846)在很多地方想输入这个x，不知道怎么写的，好奇一下

Hantianshui

[13:41](#msg5981d675614889d47510f0e6)@qtxie 在那本书上

[13:42](#msg5981d6b2210ac2692049631d)哪位大神有最新版的RED 程序 跪求

## Thursday 3th August, 2017

mahengyang

[01:55](#msg59828291a7b406262d53c4fa)red和rebol的文档真是差劲

[01:56](#msg598282b2210ac269204bf345)连字符串的连接和截取都没有啊

qtxie

[02:32](#msg59828b4a45fc670746edbf0a)red根本就还没有文档，rebol文档里我记得有讲解的

mahengyang

[02:33](#msg59828b63f5b3458e30a6bb7d)rebol也没有

[02:33](#msg59828b644bcd78af560bf1b3)http://www.rebol.com/docs/core23/rebolcore-16.html#section-2.11

[02:33](#msg59828b70614889d475139c1e)这是rebol里的字符串

[02:33](#msg59828b93a7b406262d53dee3)扯一大堆废话，没有一句说到点上的，老外的思维真是奇葩

qtxie

[02:35](#msg59828bffbc464729744b6230)你跳过了太多章节，http://www.rebol.com/docs/core23/rebolcore-8.html

[02:37](#msg59828c6f45fc670746edc204)还有 http://www.red-by-example.org 这个网站只是个red爱好者个人做的，老实说做的不好，初学者慎用。

mahengyang

[02:37](#msg59828c7fc101bc4e3ae379ca)好吧

[02:38](#msg59828c8f2723db8d5e6d6bf6)原来string类型的文档和string function是分开的

[02:38](#msg59828ca7210ac269204c0f32)Orz

qtxie

[02:42](#msg59828d7d614889d47513a1c9)俗话说心急吃不了热豆腐，看文档怎么说也要先粗略的通读一遍吧，直接看了一章就下结论，不明智。

## Friday 4th August, 2017

mahengyang

[01:51](#msg5983d331f5b3458e30aba5f8)发现一个red创始人写的ppt，原来在创新工场啊  
http://doc.mbalib.com/view/52394c0f105c3a5f78c2fd0c638360ff.html

## Monday 7th August, 2017

wzy2687

[07:18](#msg5988143b210ac269205e081b)@qtxie red 如果读大文件(&gt;5G). 如何处理. 有例子吗?

qtxie

[07:38](#msg598818fc210ac269205e1a8d)@wzy2687 目前的只支持简单的IO操作，要读这么大的文件要等0.7才行。

wzy2687

[07:39](#msg5988194ec101bc4e3af5868a)@qtxie 谢谢, 那就先等吧. 另外问下, 现在全职开发red的有多少人?

qtxie

[07:40](#msg59881981c101bc4e3af5871a)如果你熟悉系统API，也可以自己封装内存映射文件的系统API，就可以读取大文件了

[07:42](#msg598819ddee5c9a4c5f9953a7)@wzy2687 开发目前2个人，还有个实习生

wzy2687

[07:43](#msg59881a12329651f46ef8a248)神人

mahengyang

[07:44](#msg59881a43c101bc4e3af58a78)厉害呀，看了github的提交，有四个人活跃一点，不过最近只有创始人和谢晴天

wzy2687

[07:46](#msg59881ac9ee5c9a4c5f995709)red战线拉得好长, 但是又没有否方面突出能上产线的.

mahengyang

[07:48](#msg59881b3e2723db8d5e7fb265)用red写了个小程序，感觉还不错  
`https://github.com/mahengyang/famtree`

wzy2687

[07:49](#msg59881b754bcd78af561e213d)@mahengyang 感觉不错啊

[07:49](#msg59881b7b614889d47525c547)图片部署,是自动的吗?

[07:49](#msg59881b8f76a757f8087faab6)图片布局, 是自动的, 还是自己的算法

mahengyang

[07:49](#msg59881b99ee5c9a4c5f9959e4)自己写的算法

[07:50](#msg59881bb6210ac269205e2587)red最让我惊讶的是生成一张图片居然只要一句话  
`save %family-tree.png draw`

qtxie

[07:50](#msg59881bba614889d47525c675)毕竟才0.6，到1.0了应该会好很多。不过现在处于低版本的状态对想学Red的人有好处，可以一直跟进了解，到1.0的时候，就是高手了。:-)

mahengyang

[07:51](#msg59881be42723db8d5e7fb46e)不像java，先整一堆inputStream，再来一堆buffer，

[07:51](#msg59881c1845fc670746ffd696)@qtxie 这确实是理想中的语言

qtxie

[07:52](#msg59881c3abc464729745da727)我如果不是在大概0.2的时候就接触到Red，现在也不会做这个工作了，那时Red的代码很少，还比较容易看懂。

mahengyang

[07:52](#msg59881c4276a757f8087fae20)感觉你们做的事情才是人生应该为之奋斗的

wzy2687

[07:53](#msg59881c8c329651f46ef8ac40)1.0 估计要2-3年后了. 不过还是支持 red.

qtxie

[07:58](#msg59881dbfbc464729745dad02)@mahengyang 程序不错！:+1:

[07:59](#msg59881dfeee5c9a4c5f99659c)@mahengyang 更Red的做法，是把node用block表示。

mahengyang

[08:00](#msg59881e18ee5c9a4c5f996670)去年就想写一个家谱树的程序，一直没有找到合适的语言，看到了red刚好试试，蛮好

[08:00](#msg59881e31614889d47525cf85)node也用block的话，取的时候是不是不方便呀

qtxie

[08:01](#msg59881e73ee5c9a4c5f996789)不会啊，block很多用法的：

```
>> blk: [a: 1 b: 2]
== [a: 1 b: 2]
>> blk/a
== 1
>> blk/b
== 2
```

mahengyang

[08:02](#msg59881e98614889d47525d127)不错，好的，我改一下

[08:04](#msg59881f0f614889d47525d344)

```
node5: [
	father: "马泰亮"
	suns: ["马守清"]
	generation: "泰"
]
```

```
node5:  object [
	father: "马泰亮"
	suns: ["马守清"]
	generation: “泰”
]
```

这两种写法好像没有区别，我直接把object删掉，程序照样运行

qtxie

[08:08](#msg59881ffcc101bc4e3af59ece)haha~

[08:09](#msg59882021bc464729745db5fe)证明这个地方用block没错

mahengyang

[08:12](#msg598820de2723db8d5e7fc51e)

```
node2: [
	父: "马端如"
	子: ["马泰心" "马泰德" "马泰功" "马泰名"]
	字: "端"
]
```

用中文也可以作为key，厉害呀

## Tuesday 8th August, 2017

wzy2687

[07:12](#msg5989645b45fc67074604ab7f)red 现在能写tcp 客户端或者服务器吗?

[07:12](#msg59896468ee5c9a4c5f9e4b20)red 现在能写tcp 客户端或者服务器吗? @qtxie

qtxie

[08:22](#msg598974dbbc4647297462da47)@wzy2687 不能

## Wednesday 9th August, 2017

WayneCui

[10:28](#msg598ae3c8329651f46e0359d4)Win 10支持吗？Compiling compression library...  
\*\** Linker Error: locked or unreachable file: C:\\ProgramData\\Red\\crush-2017-8-3-49893.dll

DavidFeng

[14:12](#msg598b184cbc464729746962bf)我准备业余好好学习学习red了, 最近了解了很多red的背景知识. 很早以前就听说rebol了,可惜一直没认真学过. 前段时间看到 微信公众号 程序人生 的文章&lt;red，不红不专，但性感&gt;, 决定好好学学red

qtxie

[21:24](#msg598b7da5c101bc4e3a02c7d3)@WayneCui 可能是杀毒软件在作怪

[21:26](#msg598b7deb614889d475331c8d)@DavidFeng 欢迎欢迎~

## Thursday 10th August, 2017

WayneCui

[01:27](#msg598bb691bc464729746beb99)@qtxie 搞定👻

DavidFeng

[10:12](#msg598c3170210ac269206dd303)red语言的vim语法高亮插件现在还没有吗? 我找了一下没有找到, 如果没有的话, 我可以写写

OhCoder

[10:24](#msg598c3469210ac269206dde84)@DavidFeng 还没有，只找到了一个rebol的，我也是 vim 党……

DavidFeng

[12:23](#msg598c505380d90ca024e714e8)@qtxie 和创始人,你们都用什么ide?

[12:24](#msg598c5076bc464729746e175e)@qtxie 你们现在主要只有两个人开发吗?为什么公司不再招些人呢

[12:28](#msg598c516eee5c9a4c5fa9d6f3)@OhCoder 我准备抽时间写一个vim的语法高亮

qtxie

[12:33](#msg598c528f210ac269206e5b45)现在还没有IDE, 我们用简单的editor

DavidFeng

[12:33](#msg598c52b54bcd78af562e89e1)那你们都用什么 editor/ide?

qtxie

[12:35](#msg598c531d80d90ca024e72338)Nenad用TextPad，我用的EverEdit

[12:36](#msg598c53622723db8d5e8fd897)@DavidFeng 你能写一个vim的语法高亮，那是极好的. :smile:

[12:39](#msg598c54054bcd78af562e912b)现在开发主要需要用Red/System, 还要熟悉Red的整个架构，熟悉Red Runtime的代码，这样的人不好找

[12:40](#msg598c542ea7b406262d7669cb)而且我们也没有太多 :dollar:

DavidFeng

[12:42](#msg598c54a980d90ca024e72aaf)嗯~ 我准备业余时间全部用来学习red了,等对red有了解之后,就先从red的语法高亮插件开始. 学会red之后,希望以后也能参与进red的开发.

qtxie

[12:44](#msg598c551d4bcd78af562e967f)@DavidFeng 灰常欢迎 :heart\_eyes:

DavidFeng

[12:45](#msg598c5573c101bc4e3a05d0ed)我以前学过Haskell, 也用其做过一个游戏服务器项目,写过一点小工具. 现在red带给我的感觉比当初的Haskell更好,很有学习激情

qtxie

[12:47](#msg598c55d4bc464729746e2f1f)高手啊，Haskell这么烧脑的语言都玩过，Red还是比较简单的

DavidFeng

[12:48](#msg598c5621bc464729746e301b)你学过Haskell吗?其实简单写点东西也没那么夸张的.我很菜的~

qtxie

[12:49](#msg598c565f614889d475362ea6)学过一阵，学函数式编程的时候看过他的文档，不过没实际用过

[12:51](#msg598c56c32723db8d5e8fe6de)以前用的比较多的就C/C++和Python

DavidFeng

[12:55](#msg598c57a9ee5c9a4c5fa9f170)学习Red之前,我感觉最不可思议的就是Red强大的DSL能力,貌似我还没有在别的语言中见到过这么强大的DSL, 因为还不理解,所以感觉特别不可思议,偏偏你们都还说red很简单.

qtxie

[12:56](#msg598c57fb1c8697534aa5ccb6)核心功能简单，类似Lisp，但可以创造很强大的功能

DavidFeng

[12:57](#msg598c5848c101bc4e3a05dcaf)Red和Lisp有什么关系和区别? 是不是就是不使用S表达式的Lisp?我看到介绍上说Red

qtxie

[12:58](#msg598c5873ee5c9a4c5fa9f4dd)语言的基本概念和语法，如果好的老师教，一天应该就能学完了

DavidFeng

[12:58](#msg598c5880c101bc4e3a05dd93)也像Lisp一样有同像性, Lisp的我知道,但Red的我还不清楚

qtxie

[13:00](#msg598c58d61c8697534aa5d634)对，像lisp一样的同像性。不同主要是语法上吧

[13:01](#msg598c593c2723db8d5e8ff40d)Red里的block! \[ ] 跟 Lisp的 parentheses ( ) 有异曲同工之妙

DavidFeng

[13:31](#msg598c601d2723db8d5e9015b0)看了一下这里的教程, 会赋值,定义函数, 调用函数了, 对block有了一个概念了 http://www.bitbegin.com/

cwt8805

[14:43](#msg598c710276a757f80890b4a7)总算找到组织了，遇到一个问题想请大伙帮忙解答一下。我要进行一个post请求，代码如下：

```
qrcode: write/binary append getQrcodeURL accessKey [
				POST [] append append append append "{^"path^":^"pages/index/index?deviceSN=" sn/text "&devicePassword=" password/text "^"}"
			]
write/binary %qrcode.jpg qrcode
```

运行出错：

```
*** Script Error: invalid argument: append
*** Where: write
*** Stack: view do-events do-actor do-safe
```

已经知道是POST \[]后面的四个append造成的，后面加一个字符串字面量没有问题，但是我要post的数据是需要改变的，有好的建议吗，谢谢。

OhCoder

[15:17](#msg598c78ef76a757f80890da9b)@DavidFeng 如果能写一个高亮插件当然是太好了。欢迎欢迎！👏

cwt8805

[15:31](#msg598c7c444bcd78af562f5af2)@qtxie 新手初来咋到，麻烦帮忙解答一下，谢谢

JiaChen-Zeng

[15:43](#msg598c7f2580d90ca024e7f6af)我觉得因为是 `[]` 里是数据，不是代码，所以里面不会执行的

## Friday 11st August, 2017

qtxie

[00:13](#msg598cf6c5a7b406262d79183e)@cwt8805 可以用compose：

```
data: append append append append "{^"path^":^"pages/index/index?deviceSN=" sn/text "&devicePassword=" password/text "^"}"
qrcode: write/binary append getQrcodeURL accessKey compose [POST [] (data)]
```

cwt8805

[01:29](#msg598d08681c8697534aa8bb64)@qtxie 可以了，谢谢。看来还是得仔细看一下文档，对Red的一些核心概念还是有所欠缺，看几个示例就开始写代码还是行不通的。不知道从rebol的文档开始是否是好的选择呢？http://www.rebol.com/docs/core23/rebolcore.html

qtxie

[01:30](#msg598d08ba329651f46e0bc3d0)@cwt8805 可以的，目前这个是最好的选择。

cwt8805

[01:52](#msg598d0dc8614889d475392bb8)@qtxie 好的，还有个问题。

```
view [
    sn: field "ET00001" return
    button "click me" [
        data: append append %qrcode- sn/text ".jpg"
        print data
    ]
]
```

点击按钮三次输出为什么是这样的?

```
qrcode-ET00001.jpg
qrcode-ET00001.jpgET00001.jpg
qrcode-ET00001.jpgET00001.jpgET00001.jpg
```

qtxie

[02:04](#msg598d1099329651f46e0be4e6)@cwt8805 https://github.com/red/red/wiki/Why-do-I-have-to-copy-series-values%3F

[02:05](#msg598d10e31c8697534aa8d45b)red wiki 里有些文章是很值得一读的 https://github.com/red/red/wiki

cwt8805

[02:08](#msg598d11a2c101bc4e3a08d02f)好的

[02:56](#msg598d1cdcbc46472974715afa)解决了，所以应该这样做`append append copy %qrcode- sn/text ".jpg"`

[03:25](#msg598d23b3a7b406262d799de0)@qtxie 有点强迫症的问题，你发给我的第一个链接在wiki首页找不到入口

qtxie

[03:36](#msg598d264b210ac2692071a8e6)@cwt8805 在页面右边的pages里面，目前一共有86个pages

[03:38](#msg598d26bb4bcd78af5631eb1d)一般人确实不容易发现这些文章 :sweat\_smile:

DavidFeng

[03:57](#msg598d2b2776a757f808937824)看了rebol的文档,http://www.rebol.com/docs/core23/rebolcore-4.html 感觉rebol Red真是一种设计的非常好的语言, 没理由这么多年都没有火, 也没有其他语言从中借鉴各种特性啊, 像内置 date time email filepath类型及其字面量这些特性,其他常规语言也完全可以借鉴啊.

[03:59](#msg598d2bbe329651f46e0c384d)很看好Red的前景,希望Red早日达到1.0,然后合理推广,在市场上大获成功. 之前就感觉lisp和Haskell这些函数式编程语言和主流的命令式泛型的编程语言很不一样,现在感觉Rebol和主流语言也是大不同的; 不过, 现在函数式编程中的很多特点都被主流语言逐步采纳了, 但rebol感觉影响还太小, 这不应该

cwt8805

[06:09](#msg598d4a14a7b406262d7a1798)@qtxie 点击侧栏中的`Show 71 more pages...`没有反应

DavidFeng

[06:18](#msg598d4c332723db8d5e9392a5)重新点, 你网络问题...

cwt8805

[10:03](#msg598d80d7c101bc4e3a0a3e6b)应该不是网络问题，每次点击都是调到当前页，算了不纠结了。Red如何调用dll动态链接库文件？

## Monday 14th August, 2017

DavidFeng

[01:56](#msg599103492723db8d5e9f3975)Red/System中没有C语言中的 union, 会考虑加上吗? 我在文档中没有看到

[01:57](#msg59910392bc464729747e0af1)如果C的所有特性都有对应的话, 理论上是不是可以写一个编译器扩展,把C语言项目直接1对1翻译成Red/System? 这样的话引入一些三方库比如sqlite lua red什么的,是不是就可以直接暴力翻译C源码来实现了?

qtxie

[02:08](#msg5991061fa7b406262d8634ca)也许会：https://github.com/red/red/wiki/Red-System-v2-Wish-List

DavidFeng

[02:09](#msg599106594bcd78af563e66e1)哦,原来在这里,之前没发现这个页面. 只看到了reference文档中的一些todo

[02:13](#msg5991073fa7b406262d863792)如果只是和C api交互的话,用union的情况应该非常少. 偶尔有也可以用类型转换来模拟.

## Tuesday 15th August, 2017

mahengyang

[10:07](#msg5992c7dba7b406262d8d5ad4)@qtxie 你们俩是全职开发red呀

[10:07](#msg5992c7e2bc4647297485329c)谁给你们付工资呢

DavidFeng

[12:43](#msg5992ec81210ac2692085cb32)@mahengyang 公开的资料是, 2015年, 全栈科技拿到了创新工场和CSDN投的50万美元投资, 这300万人民币,应该够公司运作一段时间了

[12:44](#msg5992ec904bcd78af56464681)详情看red lang官网博客

[12:44](#msg5992ecb5a7b406262d8e04dd)http://www.red-lang.org/2015/01/dream-big-work-hard-and-make-it-happen.html#comment-form

[12:46](#msg5992ed222723db8d5ea6d6fb)我今天看 官网博客about页面 13年 RECODE Nenad的视频分享, 讲到 那时run out of money,靠捐款生活, 真是心疼++啊, 这么好的语言和蓝图, 缺没有太多人和资金支持, 那么多大牛参与到red中的确那么少,

[12:46](#msg5992ed2cee5c9a4c5fc1991c)还好后来有 这个投资了

[12:46](#msg5992ed3fc101bc4e3a1d1dd8)@qtxie 你是什么时候开始全职开发的啊?

[12:48](#msg5992ed8c1c8697534abd7980)说错了,我是想说什么时候开始开发的

[12:50](#msg5992ee1b162adb6d2ef978e5)查了一下,git历史中很早就参与了

qtxie

[13:47](#msg5992fb73162adb6d2ef9b96f)14年吧

## Wednesday 16th August, 2017

DavidFeng

[00:47](#msg599396132723db8d5ea9e6b4)那你是怎么认识 Nenad 的, 怎么加入的? 能八一下吗? 😆

[00:48](#msg59939640c101bc4e3a20372a)是网上协作,然后主动联系他的吗?

qtxie

[00:52](#msg5993973e614889d47550cd5e)开始是在网上协作，后来他来中国了，蔡学镛引荐我给Nenad。当时我正好从上一家公司离职，就加入Red Team了。:-)

mahengyang

[00:53](#msg599397a01c8697534ac08350)蔡老师厉害

[01:04](#msg59939a21614889d47550d7d0)red的代码有很多是rebol写的，特别是测试代码，

DavidFeng

[02:07](#msg5993a8cbbc46472974894ce5)原来是这样~

[02:07](#msg5993a8e9162adb6d2efcc1f7)现在red代码为什么还不能自举呢, rebol写的那部分技术上已经可以用red来完成了吗? 如果不能,还差什么?

[02:11](#msg5993a9ea1c8697534ac0c96c)是不是自举的优先级不高啊,算了,这个问题其实也不重要. red 2.0, 核心使用red重新开发, 架构设计更先进, 方便添加插件, 这些蓝图实在太吸引人了

[13:01](#msg59944244210ac269208bfe9a)@qtxie 0.7的io支持打算怎么做啊,是像gui部分一样,直接调用os的api吗? 打算支持libuv nodejs那样的 异步io吗? 可以用来写服务器应用吗?

[13:05](#msg5994430d80d90ca02404c340)red肯定不会依赖libuv这样的第三方库的吧? 现在用户可以直接封装libuv api做服务器应用吗? 现在是不是还没有gc啊? 是不是说red还不能写长期运行 的服务器程序

qtxie

[13:05](#msg59944336162adb6d2eff8ed5)像libuv一样的异步io

DavidFeng

[13:06](#msg59944344c101bc4e3a2350f4)服务器开发这边有个好处就是, 很容易方便小公司小团队直接使用,

qtxie

[13:06](#msg59944348bc464729748c281e)直接用系统api来做

[13:06](#msg59944373162adb6d2eff8ff1)现在也可以自己封装libuv啊

[13:07](#msg599443ac578b44a046b55699)Red在一定程度上可以手动控制内存的

[13:09](#msg599443ec2723db8d5ead05eb)如果控制的好，很多情况下就算没GC，内存使用也是稳定的

DavidFeng

[13:09](#msg599443f0578b44a046b557a0)哦~ 我感觉我问的问题应该可以通过自己的学习来自我回答, 问的多学的少了, 我没有足够知识的话, 你可能不能简单给我讲清楚

[13:09](#msg5994441476a757f808addbd6)谢谢, ok~ 我打算试试封装 libuv, 可能社区还没有人做这个工作,

[13:10](#msg599444619acddb24079748f7)然后试试用red做nodejs做的事情, 如果可以的话,将来还能应用到工作中,我现在在做棋牌游戏开发, 服务端nodejs typescript客户端cocos creator, typescript js

[13:12](#msg599444b19acddb2407974afd)red有view,可以很方便地写测试客户端,包括管理后台都很合适, 可以不用web技术做了

qtxie

[13:13](#msg599444f2ee5c9a4c5fc7bcef)应该没人做过

[13:13](#msg5994451476a757f808ade101)libuv是C API吗？

DavidFeng

[13:13](#msg59944517c101bc4e3a2359af)是的

qtxie

[13:14](#msg5994453e578b44a046b5605c)那就比较方便，C++的麻烦些

DavidFeng

[13:14](#msg59944548ee5c9a4c5fc7be8a)libuv是nodejs julia pyuv 等语言/平台的操作系统封装层

[13:15](#msg5994457080d90ca02404d104)系统底层库,绝大部分都是c api的

qtxie

[13:16](#msg599445999acddb2407975108)嗯，这个封装好了，肯定很受欢迎的

[13:17](#msg599445cd76a757f808ade48e)社区的人就不用等0.7了

DavidFeng

[13:18](#msg5994463f2723db8d5ead12a5)我现在时间比较少,不知道什么时候能完成呢, 我现在还在学习red rebol, 我想先把red/system 0.1.0的代码简单看下, 刚好同时也是熟悉常用word以及red程序惯用法的过程

[13:19](#msg59944670578b44a046b5661c)然后再弄vim的red支持: 语法高亮, 补全(关键字补全,搜集常用word), 然后选一个方向,比如libuv绑定,

[13:20](#msg599446ad578b44a046b5677f)https://trello.com/b/FlQ6pzdB/red-tasks-overview 你们在用这个吧?看到你还在更新, 我以后熟悉red了, 也可以来这里关注下你们的进度和工作, 说不定我也能参与进来

qtxie

[13:50](#msg59944d9c614889d475542286)恩，慢慢来。我们是用trello管理项目的。

## Thursday 17th August, 2017

Dieken

[01:01](#msg5994eaeac101bc4e3a26972e)初到，问个 Red 的函数语法问题。我看了些 Red/Rebol 文档，似乎 Red/Rebol 只支持固定个数的参数，虽然可以用 series 模拟可变个数的参数，但是命名参数和可选参数推荐的做法是怎样的？

[01:02](#msg5994eb27a7b406262d978ed7)另外，Red/Rebol 的代码里，函数调用都不带括号，解析时从右向左么？虽然语法没问题，但是看着一长溜，要人肉识别函数调用边界，感觉可读性很差啊？？

qtxie

[01:08](#msg5994ec98162adb6d2e02d17b)可选参数函数，一般用把所有参数放在一个block里。`print` 函数就是这么做的。

[01:11](#msg5994ed39210ac269208f4c01)把代码结构组织好，就不会出现一长溜的情况了。几乎所有语言都能写出可读性很差的代码吧。 ;-)

DavidFeng

[01:42](#msg5994f483162adb6d2e02ed8a)可选参数可以使用 refinement来实现

[01:42](#msg5994f49b614889d4755743ac)&gt;&gt; help copy  
USAGE:  
COPY value

DESCRIPTION:  
Returns a copy of a non-scalar value.  
COPY is an action! value.

ARGUMENTS:  
value \[series! any-object! bitset! map!]

REFINEMENTS:  
/part =&gt; Limit the length of the result.  
length \[number! series! pair!]  
/deep =&gt; Copy nested values.  
/types =&gt; Copy only specific types of non-scalar values.  
kind \[datatype!]

RETURNS:  
\[series! any-object! bitset! map!]

[01:43](#msg5994f4ad210ac269208f644c)这样的, 使用的使用就是 copy, copy/part, copy/deep

[01:43](#msg5994f4bf578b44a046b8d3de)命名参数要做的话, 怕是只能使用block了

Dieken

[01:59](#msg5994f88a9acddb24079ab87c)多谢两位解答！ 可选参数用 block 还能表达的勉强，函数内部自行根据 series 长度给可选参数赋值， 用 refinement 感觉不合适吧，多来几个可选参数的组合，refinement 的个数就爆炸了。

[02:01](#msg5994f8ebbc464729748fa838)命名参数是可以用 block 来做，\[k v k v] 然后函数内部自行构建哈希表。 可以解决，就是语法糖不够漂亮，好像 rebol 社区也没觉得这是个问题，没人做个宏包装下，奇怪。。。

DavidFeng

[02:12](#msg5994fb9e80d90ca024085d93)我也是刚学red没几天, 我觉得可以先看red代码, 看red这边的惯用法是什么, 说不定习惯了也觉得挺好, red和lisp好像,我觉得red就是一个更好的lisp

[02:13](#msg5994fbb380d90ca024085de7)而且有了red,lisp我感觉就没什么独特的价值了

mahengyang

[02:16](#msg5994fc98210ac269208f81b1)@Dieken map不是可以用 `#( …)` 语法糖吗

Dieken

[02:37](#msg59950172c101bc4e3a26eafb)@DavidFeng 不要蔑 lisp 嘛，70 年代的语言都有可选参数、命名参数了。。。

[02:38](#msg59950190a7b406262d97dae1)@mahengyang 还没看到 map 语法，嘿嘿，我再多看看教程

[02:39](#msg599501fc2723db8d5eb0999b)发现一个问题，在 red 里输入 print ["aa} 回车，然后不管输入什么都退不出来了，ctrl-c, ctrl-d, ctrl-z 都不响应。 mac os x 系统。

[02:40](#msg59950217162adb6d2e0320e4)说错了，是 print ["aa"}

DavidFeng

[02:43](#msg599502b52723db8d5eb09dcb)不是蔑视, 是我觉得lisp不再是我心中最有独特价值的语言了, s表达式, rebol也有,而且更好更方便, 宏, red也有

[02:43](#msg599502d5614889d4755780f8)确实, 估计内部实现哪里有问题,我也退不出去,直接直接kill进程

Dieken

[02:44](#msg599502fa210ac269208f9a4d)我去 red/red room 喊一句。。。

[02:47](#msg599503a9bc464729748fd2b8)直接执行 red 报告 "PROGRAM ERROR: Invalid encapsulated data."，按全路径执行 red 没事，这是个已知问题么？我记得去年试时有这个问题，一年后还有这个问题。。。。

qtxie

[03:22](#msg59950c0bbc464729748ff660)说错了，是可变参数，用block

[03:22](#msg59950c132723db8d5eb0c06b)可选参数，用refinement

Dieken

[03:25](#msg59950cb876a757f808b19904)refinement 等价于函数重载吧，一个函数有多个签名，跟可选参数不是一回事。比如我有个函数 foo(:a a :b b :c c :d d :e e)，要表达这 5 个可选参数的组合，那得多少个 refinement 才够用。。。。

[03:26](#msg59950cd92723db8d5eb0c3f7)mahengyang 推荐的那个 #(key, value) 语法糖不错

qtxie

[03:27](#msg59950d1e9acddb24079b0914)几个可选就用几个refinement

[03:27](#msg59950d3aee5c9a4c5fcb74ce)refinement也可以组合使用的

[03:28](#msg59950d75578b44a046b935de)

```
foo/a
foo/a/b/c
foo/c/a/e
```

[03:29](#msg59950d939acddb24079b0aa4)调用函数的时候，可以自由组合refinement

[03:30](#msg59950ddca7b406262d981172)还有，用其他语言的特性来套另一种语言，必然是别扭的

Dieken

[03:30](#msg59950de180d90ca02408a34c)orz，我再看看文档。 refinement 的顺序决定了参数被消费的顺序和个数？

qtxie

[03:31](#msg59950e00bc464729748fff2e)对

Dieken

[03:31](#msg59950e0d162adb6d2e035735)是有点别扭， /xx 以前只在 dos 命令选项见过，写法是 cmd /a xx /b xx /c xx 这样的

[03:31](#msg59950e24a7b406262d98128f)red 代码是有点命令行的意思，都很短 ，哈哈

[03:32](#msg59950e38c101bc4e3a271e14)多谢！ @qtxie

qtxie

[03:33](#msg59950e7aee5c9a4c5fcb7b11)&gt; "PROGRAM ERROR: Invalid encapsulated data."

这个问题是Rebol SDK的问题，目前还没有找到时间处理，优先级不高，不过1.0前肯定要解决的。

[03:33](#msg59950e8c614889d47557b05f)@Dieken 不用谢。:-)

Dieken

[03:40](#msg59951034162adb6d2e03609a)1.0 大概啥时候出？

[03:40](#msg59951041ee5c9a4c5fcb8202)现在还是 0.6 呢

qtxie

[04:01](#msg5995151f578b44a046b954c0)我也不知道 :sweat\_smile:

Dieken

[04:01](#msg5995153680d90ca02408c385):smile:

greyhawk

[15:23](#msg5995b4e7578b44a046bc7286)我理解refinement，其实是不是就是函数编程里面的柯里化在red里的实现，保证参数是一个，这样就很容易组合函数？

## Friday 18th August, 2017

DavidFeng

[01:20](#msg599640db210ac269209542a8)你看一下red的语法, 是没法直接做变参的.

[01:20](#msg599640e92723db8d5eb67c3f)f1 a1 a2 f2 a1 a2

[01:21](#msg59964133bc4647297495c898)可以说是red的语法要求参数数量必须固定,你自己理解一下

## Saturday 19th August, 2017

mengxin2049

[16:44](#msg59986ad776a757f808c078c2)先学c还是red

## Sunday 20th August, 2017

xingtone

[10:34](#msg599965c0bc46472974a24fa3)red first

## Tuesday 22nd August, 2017

mahengyang

[08:32](#msg599bec1ba7b406262db47ff5)block怎么删掉最后一个元素呢

[08:32](#msg599bec36ee5c9a4c5fe83e46)`remove next my-block`是删除的第二个元素

bear256

[08:37](#msg599bed46614889d47574567c)@mahengyang 我的办法是这样子的

```
>> my-block: [1 2 3] 
== [1 2 3]
>> my-block: take/part my-block (length? my-block) - 1
== [1 2]
>> my-block
== [1 2]
```

mahengyang

[08:40](#msg599bedfc162adb6d2e1fe97d)@bear256 有没有优雅一点的方式

qtxie

[08:42](#msg599bee85614889d475745be9)

```
remove back tail my-block
```

bear256

[08:44](#msg599bef04bc46472974acd836)那如果要删除block中某个index下的元素呢

mahengyang

[08:44](#msg599bef082723db8d5ecd9508)@qtxie 厉害，我试了`remove tail my-block`，差一个`back`

[08:46](#msg599bef81c101bc4e3a439c16)看起来要把指针移到指定的index下，再remove

qtxie

[08:46](#msg599bef81ba0f0f6e38ce248c)

```
take/last my-block
```

[08:47](#msg599bef8f9acddb2407b7cba6)更短些

mahengyang

[08:48](#msg599befcf9acddb2407b7cc7d)`take/last`直接就把最后一个删掉了呀，厉害

[08:53](#msg599bf0f1614889d47574677b)`TAKE is an action! value` 所谓的action! value是不是会有副作用的

qtxie

[08:54](#msg599bf156162adb6d2e1ff9ac)remove 也是 action!

bear256

[09:07](#msg599bf46c578b44a046d65a76)@qtxie 我删除某个下标元素的做法是这样的

```
>> a: [1 2 3 4 5 6]
== [1 2 3 4 5 6]
>> idx: 3
== 3
>> a: append append [] take/part a (idx - 1) remove a 
== [1 2 4 5 6]
```

有没有更简便的办法？

qtxie

[09:32](#msg599bfa47162adb6d2e20212e)

```
take at a idx
```

bear256

[09:34](#msg599bfab676a757f808cea72c)@qtxie 谢谢 那`remove at a idx`也是一样的咯

qtxie

[09:35](#msg599bfacf2723db8d5ecdcc07)不一样哦

[09:35](#msg599bfad3210ac26920ac4d0b)你可以试一下

bear256

[09:35](#msg599bfafe210ac26920ac4d9b)我试了一下 对于删除a的idx下标的元素的效果是一样的

[09:36](#msg599bfb3476a757f808cea8d1)只不过这两个式子的返回结果不一样

```
>> a: [1 2 3 4 5]
== [1 2 3 4 5]
>> at a 3
== [3 4 5]
>> take at a 3
== 3
>> a: [1 2 3 4 5]
== [1 2 3 4 5]
>> remove at a 3
== [4 5]
```

qtxie

[09:37](#msg599bfb6c162adb6d2e20289e)啊，对，我弄错了

[09:38](#msg599bfb79578b44a046d679b7)结果一样的 :sweat\_smile:

[09:38](#msg599bfb8b578b44a046d679e5)看来是饿了 ;-)

bear256

[09:38](#msg599bfb982723db8d5ecdd129)恩恩 准备下班 回家吃饭

mahengyang

[09:41](#msg599bfc35210ac26920ac5338)@qtxie 你们加班多吗？

qtxie

[09:42](#msg599bfc6d162adb6d2e202cc7)其实没有固定的时间 :sweat\_smile:

mahengyang

[09:42](#msg599bfc9ca7b406262db4c893)真好，你们公司几个人呀

bear256

[09:47](#msg599bfdbfee5c9a4c5fe88b7c)@qtxie Red有没有考虑先出个Specification文档和测试集 就像Perl或Java 这样便于有兴趣的同学可以基于其他语言C、Java、.NET等去实现在不同平台上的解释器或字节码生成器 这样可以加速Red语言的开发进程 同时也可以借助其他平台成熟的VM和GC优势 快速发展

[09:49](#msg599bfe119acddb2407b80e0a)@qtxie 其实我觉得Red/REBOL语言本身的优势在于语言本身所倡导的思想和理念 至于是不是一定要把编译器和解释器弄得那么Tiny倒是其次的

[09:55](#msg599bff9ba7b406262db4d5f1)@qtxie 当然 这样可能就和Red定位Full Stack的目标有所不符 但对于语言的推广大有益处 并且可以吸引其他编程语言使用者

qtxie

[10:30](#msg599c07a8578b44a046d6ac0d)有测试集的。Red从一开始就开源的，这么多年了，也没几个人贡献代码，怎么会奢望有人基于其他语言去实现？

[10:32](#msg599c0841578b44a046d6ae8d)也没有刻意让编译器和解释器这么小，实现了该实现的功能，它就这么小，我们也没办法

DavidFeng

[12:24](#msg599c2298bc46472974adc778)我们也没有办法,好萌啊,哈哈,😆

[12:25](#msg599c22c19acddb2407b8b465)这句好熟悉,好像是台词: 我们也没有办法,只好拿钱包抵工资,原价50 100的,统统只要10块钱

[12:26](#msg599c22dfc101bc4e3a448749)规范也有, r/s的. 官网 doc链接的有

[12:26](#msg599c230aee5c9a4c5fe93e44)http://static.red-lang.org/red-system-specs.html

[12:27](#msg599c23429acddb2407b8b68f)red本身目前应该没有规范,不过,用其他语言实现,或者增加新后端的话, 如果你开始做这项工作了, 应该不太会问这个问题了.

[12:28](#msg599c236fbc46472974adcaa3)可以从子集一点点加. 跟进最新的red进度. 话说red自己都还没有1.0,还在不断添加新特性, 怎么会有完整规范呢,

[12:28](#msg599c2386614889d475754964)测试很早就有了, 参见源码中的quick test, peter a wood添加的.

[12:29](#msg599c23b9ee5c9a4c5fe9409a)我觉得自己玩的 话, 可以用其他语言实现一个极简red解释器,玩一下,体验一下, 然后最好参与到官方的red开发中, 完善现在后端,或者添加新后端.

[12:31](#msg599c240976a757f808cf6758)red这么多年没有吸引很多人贡献代码,我也觉得很不应该, 不知道为啥~ 反正我以后有能力之后打算加入了.

qtxie

[13:10](#msg599c2d2b9acddb2407b8e877)希望那时候有足够的 :moneybag: ,可以雇的起 ;-)

## Wednesday 23th August, 2017

mahengyang

[01:53](#msg599ce02e76a757f808d2c0a0)怎么使用高阶函数呀？比如从一个列表里筛选元素

[01:54](#msg599ce069210ac26920b045ca)`a: [[1 2] [3 4]]` 从a里面取出每个子元素的第一个`1 3`

bear256

[02:01](#msg599ce1f576a757f808d2c7c4)

```
b: [] foreach item a [append b item/1]
```

mahengyang

[02:02](#msg599ce222ba0f0f6e38d27252)我现在也是这样写的，想问下有没有函数式的写法

bear256

[02:22](#msg599ce6d39acddb2407bc14de)不太明白你的意思

```
function [a /local b] [
    b: [] foreach item a [append b item/1]
    b
]
```

这样可以么

mahengyang

[02:25](#msg599ce78bba0f0f6e38d28645)类似这样的`map function[item] [item/1] a`

[02:25](#msg599ce7af9acddb2407bc17cc)red里面好像不叫map，也不叫apply

bear256

[02:30](#msg599ce8d2c101bc4e3a480f3a)这样子算不算是你要的函数式了

```
foreach item a [extract/index/into item 2 1 []]
```

[02:32](#msg599ce9532723db8d5ed1e5e0)在改变a也不新增变量的情况下 返回一个结果series!

mahengyang

[02:34](#msg599ce99c9acddb2407bc1e76)`extract/index/into item 2 1 []` 这个extract看起来不怎么直观，`extract/index/into [1 2 3 4 5 6] 2 1 []` 返回的结果是`[1 3 5]`

[02:34](#msg599ce9c0ba0f0f6e38d28ef9)每隔两个取一个的意思？好奇怪

## Thursday 24th August, 2017

mahengyang

[02:11](#msg599e35cac101bc4e3a4dcf13)red脚本怎么读取命令行传的参数呢

[02:11](#msg599e35df2723db8d5ed7a768)`red my-script.red 我的参数`

[02:12](#msg599e35fbee5c9a4c5ff26147)`my-script.red`里怎么拿到我的参数

DavidFeng

[02:14](#msg599e368b614889d4757e5fb5)print system/options/args

[02:15](#msg599e36a7a7b406262dbeae7b)\[!\[image.png](https://files.gitter.im/red/red/Chinese/W4ii/thumb/image.png)](https://files.gitter.im/red/red/Chinese/W4ii/image.png)

[02:15](#msg599e36ac210ac26920b60bc3)\[!\[image.png](https://files.gitter.im/red/red/Chinese/nZgG/thumb/image.png)](https://files.gitter.im/red/red/Chinese/nZgG/image.png)

mahengyang

[02:15](#msg599e36b1614889d4757e6021)ok，多谢

## Friday 25th August, 2017

imbyron

[09:20](#msg599febd2c101bc4e3a553b77)Hi，冒个泡。看到蔡学镛老师的推荐，准备学习一下 Red 语言。

## Saturday 26th August, 2017

laomafeima

[13:36](#msg59a1796876a757f808e64eae)大家好，red 学习者～

qtxie

[14:08](#msg59a180d89acddb2407cf5e7e)你好！

walksnail

[15:19](#msg59a1919d9acddb2407cf9e05)新人报个到

## Sunday 27th August, 2017

laomafeima

[08:36](#msg59a284a0210ac26920c728b4)看了之前的聊天记录，想说：red 开源几年了，贡献的人也不多，是不是因为实现的预言太小众了，熟悉rebol的人少之又少，增加了学习的曲线。即便自己想要用其他语言去实现，也要先了解现在是如何实现的。

[08:37](#msg59a284b0578b44a046f1d1de)拙见～

qtxie

[08:40](#msg59a2858a578b44a046f1d523)没错~ 所以不能指望靠别人贡献来推进开源项目的

DavidFeng

[08:46](#msg59a286fbc101bc4e3a5f0a94)欢迎~

laomafeima

[08:57](#msg59a28969bc46472974c861f0)我想了解red的第一件事就是去学rebol了。等于需要学好两个语言才行（我目前看来是两个，可能学会了rebol同时也会了red，但是门槛看起来高了）。

[08:57](#msg59a2897c66c1c7c477e6cae2)red 的自举计划有安排么？

DavidFeng

[08:58](#msg59a289afba0f0f6e38e98b43)应该说短期内不会把重点放到自举上， 毕竟人手有限，优先级更高的事情还有很多

[08:58](#msg59a289c4ba0f0f6e38e98be3)我以自身体会告诉你，学习rebol完全不会浪费，

[08:58](#msg59a289cfc101bc4e3a5f14fc)可以说学习rebol就约等于学习red

laomafeima

[09:04](#msg59a28b088f4427b462a2dd9b)谢谢～～看了介绍也是说是学习了rebol约等于学习了red。可以问一下有给1.0版本计划时间吗？

OhCoder

[09:18](#msg59a28e4e66c1c7c477e6db4f)目前了解到的貌似没有1.0版本计划时间。

kuyewen\_twitter

[12:59](#msg59a2c245c101bc4e3a5fdf84)linux上red怎么实现gui，好像目前只有win和osx的。

## Monday 28th August, 2017

DavidFeng

[02:19](#msg59a37da38f4427b462a661b4)gtk的view后端正在开发中,github上能看到.

## Tuesday 29th August, 2017

xingtone

[11:55](#msg59a55640578b44a046fd9842)@laomafeima 不是这样的，red很牛的，小而快

## Wednesday 30th August, 2017

laomafeima

[09:00](#msg59a67eb5bc46472974d91d47)@xingtone 我并没有否认这些东西啊～，或者是哪里引起你的误会了？

## Tuesday 12nd September, 2017

mahengyang

[07:11](#msg59b7888abac826f054a8849d)http://www.red-lang.org/p/documentation.html

[07:11](#msg59b78893bac826f054a884ad)打不开了，是不是被墙了

lsanotes

[07:43](#msg59b79017cfeed2eb65fb61db)官网早就被墙了吧，我一直都是翻墙看的

mahengyang

[07:43](#msg59b7903bc101bc4e3ab7946d)哦，好吧，看了下red的test都是rebol写的，

lsanotes

[07:45](#msg59b79086614889d475e93d71)作者就是不满意 rebol 发展缓慢，才开始自己搞 red 的

mahengyang

[07:46](#msg59b790c6bc46472974227b50)怎么参与开发呢？我先写点test

lsanotes

[07:49](#msg59b79176319100804e24ca8a)qtxie 参与开发有4年了吧，TA 应该比较熟手... 我还是小白，刚进群玩

mahengyang

[07:49](#msg59b79197210ac269201f1a35)@qtxie 老司机带路吧

lsanotes

[07:51](#msg59b791eb210ac269201f1b55)https://trello.com/b/FlQ6pzdB/red-tasks-overview 这个是项目的任务单，没人干的应该都可以认领....

mahengyang

[07:52](#msg59b7922fbac826f054a8be5d)ok，怎么感觉测试都是这哥们写的

[07:52](#msg59b79230bc464729742283a5)Peter W A Wood

lsanotes

[07:53](#msg59b79271bac826f054a8c008)中文区感觉没啥人，去英文区玩吧。 里面每天还都挺活跃的。

mahengyang

[07:53](#msg59b79289177fb9fe7eadd59e)恩，英文区看不懂他们天天在讨论什么问题，

lsanotes

[07:54](#msg59b7929fc101bc4e3ab7a366)你是做啥开发的？

mahengyang

[07:54](#msg59b792a5319100804e24cfbe)java

[07:54](#msg59b792bb177fb9fe7eadd679)共享单车的后台

lsanotes

[07:56](#msg59b7932ebc464729742289c8)那 RED 估计应用场景比较少啊.... 我做移动开发的，感觉也基本用不上。

mahengyang

[07:56](#msg59b7934ab59d55b823e68b8c)是的，但看着比较好玩，我之前用它写了个家谱的小程序，感觉很趁手

[07:57](#msg59b7935d614889d475e95174)https://github.com/mahengyang/famtree

qtxie

[07:58](#msg59b793a3b59d55b823e68d81)对，https://trello.com/b/FlQ6pzdB/red-tasks-overview 的可以认领，还有就是test。其实很多函数是缺了test的。

lsanotes

[07:58](#msg59b793a7210ac269201f24c6)很棒啊 red 做 cli 的小程序好像是很好

mahengyang

[07:59](#msg59b793d8614889d475e9539f)我喜欢写test

qtxie

[07:59](#msg59b793d8319100804e24d581)还有就是帮fix issues，不过这个没有写tests容易

mahengyang

[07:59](#msg59b793eccfeed2eb65fb7499)fix issues是不是还要跟踪代码啊

[08:00](#msg59b7941a210ac269201f26b2)test有针对Red函数的，还有针对Red/System的函数的

qtxie

[08:07](#msg59b795af210ac269201f2f07)@lsanotes Android也可以开发的

mahengyang

[08:08](#msg59b79618614889d475e95cc1)安卓界面很美观啊

qtxie

[08:10](#msg59b79673177fb9fe7eadeb2d)这个是test用的，没有美化，用的原生控件

[08:10](#msg59b79686c101bc4e3ab7b6a6)控件的摆放也比较随意

mahengyang

[08:11](#msg59b7969abac826f054a8d885)很好奇red的底层怎么适配这么多的平台

lsanotes

[10:15](#msg59b7b3d5177fb9fe7eae8a12)@qtxie 前几周跑了下Andorid Sample， 发现运行不起来...

[10:18](#msg59b7b45c210ac269201fd334)http://static.red-lang.org/eval.apk

[10:18](#msg59b7b477cfeed2eb65fc2e57)估计是太老了，还是 13 年的

[10:20](#msg59b7b4e31081499f1f203593)你视频里面的例子在哪里？

qtxie

[11:18](#msg59b7c29cbc46472974238f44)目前在私有仓库里开发，源码会在0.6.5的时候合并到master分支

## Thursday 14th September, 2017

mahengyang

[07:38](#msg59ba3201cfeed2eb65093d8f)@qtxie 写了几个测试之后怎么提交代码呢？拉一个新的分支，然后提交一个PR吗？trello上的卡片怎么标记为已完成呢

qtxie

[07:39](#msg59ba3221614889d475f75304)对，提交PR

[07:40](#msg59ba3258cfeed2eb65093f3b)trello上的卡片只有Red Team成员才有权限修改的，你完成了哪一项？

mahengyang

[07:40](#msg59ba3270cfeed2eb65093f9d)还没有弄好呢，我先问下流程

## Friday 15th September, 2017

NjinN

[14:01](#msg59bbdd46177fb9fe7ec4aec3)@qtxie red现在读取GB2312的文件会报错，read/as还不能有，有什么办法解决吗？

[14:02](#msg59bbdd921081499f1f35c227)Access Error: invalid UTF-8 encoding: #{B3C9BDBB}

qtxie

[14:15](#msg59bbe07cbac826f054bfb615)read/binary 或者实现 read/as 或者把文件先转成 utf8

## Sunday 17th September, 2017

fatetwist

[05:58](#msg59be0f12614889d47509aec4)有人在吗

qtxie

[08:13](#msg59be2eb41081499f1f3ff06f)?\_?

NjinN

[08:48](#msg59be36e4cfeed2eb651c2666)@qtxie 这两天想玩股票量化分析，需要大量抓取网站数据，rebol/red有现成的ip代理的解决方案吗？

qtxie

[09:57](#msg59be4706210ac269203fe38d)没有…

NjinN

[10:18](#msg59be4c0ccfeed2eb651c7f05)@qtxie red里好像没有for循环，这个是出于什么考虑，很多时候还是感觉for好用一点，后期会考虑加上吗

qtxie

[10:54](#msg59be5476210ac26920401cbb)有 foreach, forall, forskip. 你需要哪种for循环？

NjinN

[15:29](#msg59be94f7cfeed2eb651dc2c9)我就喜欢 for i 1 100 1 \[ ] 这种。。。

## Monday 18th September, 2017

qtxie

[03:46](#msg59bf419a614889d4750ee2a0)可以自己写一个这样的 for 函数，记得有人写过的。。。

NjinN

[06:18](#msg59bf654dbac826f054cf2a80)@qtxie 我知道自己用while就可以实现for函数，但是我不确定内部实现如何，不确定有没有性能差异。

[06:20](#msg59bf65abb59d55b8230ca717)@qtxie 个人认为即使为了方便用户迁移和代码迁移，也要加上for循环，毕竟用户本来就不多，循环控制又经常用到

qtxie

[06:57](#msg59bf6e61210ac2692044e9f8)也许后面会增加编译器的支持，目前如果需要，可以先自己定义函数。

[06:58](#msg59bf6e8e7b7d98d30d0b1a03)看了下Rebol，原来Rebol里有这个。

```
>> ? for
USAGE:
    FOR 'word start end bump body

DESCRIPTION:
     Repeats a block over a range of values.
     FOR is a function value.

ARGUMENTS:
     word -- Variable to hold current value (Type: word)
     start -- Starting value (Type: number series money time date char)
     end -- Ending value (Type: number series money time date char)
     bump -- Amount to skip each time (Type: number money time char)
     body -- Block to evaluate (Type: block)
```

mahengyang

[06:58](#msg59bf6eb2bc4647297449332a)@qtxie 看到源码里有三个文件：`actions.red` `natives.red` `functions.red` 这三个有什么区别呀

qtxie

[07:00](#msg59bf6efd1081499f1f4568f4)你应该知道Rebol/Red里是有 action!, native!, function! 这三种datatype的吧

[07:00](#msg59bf6f1fbc4647297449353d)这三个文件，对应的就是这三种类型

mahengyang

[07:01](#msg59bf6f2d177fb9fe7ed49c1a)

```
native!:		make datatype! #get-definition TYPE_NATIVE
action!:		make datatype! #get-definition TYPE_ACTION
```

[07:01](#msg59bf6f537b7d98d30d0b1eac)好像有些actions里面的函数像function

[07:02](#msg59bf6f87bc46472974493730)natives里面的，比如`lowercase`，也像是函数

[07:02](#msg59bf6f97614889d4750fb022)出于什么原因，它们要使用更底层的写法呢

NjinN

[07:02](#msg59bf6f997b7d98d30d0b206e)@qtxie 我不明白这三种datatype有什么区别诶，另外你们都不用for循环的咯，今天才发现、、、

mahengyang

[07:03](#msg59bf6fcfb59d55b8230cd808)@NjinN 我也才发现，我都是用foreach，如果需要索引下标，就在外层弄个i: 1，里面弄个`i: i + 1`

NjinN

[07:08](#msg59bf70fabc46472974493ebe)你们大概都不是VB入门的。。。

qtxie

[07:12](#msg59bf71c5b59d55b8230ce2fa)其实这三个类型，在其他语言里都叫 “函数”，Red里根据实现方式的不同，做了细分，粗略来讲：  
action!: 每一个类型都有一张action的表，action的数量是固定的，比如block的表在\[这里](https://github.com/red/red/blob/master/runtime/datatypes/block.reds#L1682-L1747)  
native!: 用Red/System实现的函数，数量不限  
function!: 用Red实现的函数

NjinN

[07:15](#msg59bf729abc46472974494811)说的很好，看不懂。。。这个action的表是什么意思

qtxie

[07:18](#msg59bf735a614889d4750fc4d5)知道C的话会比较好理解，一个struct里装满了函数指针

mahengyang

[07:19](#msg59bf736ccfeed2eb65218d8c)block是一种数据类型，它可以使用这些action来操作

[07:20](#msg59bf73c7177fb9fe7ed4b75f)block形如`[ xxx yyy]`，它可以`insert`，但不能使用`add`、`absolute`，这些actions只能应用于数字

NjinN

[07:33](#msg59bf76d5cfeed2eb6521a1a2)我个人还是比较关心这三者的性能有什么差异吗

[08:17](#msg59bf8130c101bc4e3ade35a7)@qtxie 看介绍red支持多线程，能简单介绍下怎么运用吗

qtxie

[09:01](#msg59bf8b68614889d475104b2b)还没实现

NjinN

[09:12](#msg59bf8e17cfeed2eb65221dc9)加油啊，少年。老实说red官网更新很慢，而且好像整个路线图一直在延期，好担心项目就不活动了。希望你们坚持下去，我不懂开发，只能给你们加油，么么哒。。。

## Friday 22nd September, 2017

hilaily

[04:07](#msg59c48c86177fb9fe7eed3a0b)新人准备学学 red

[04:08](#msg59c48ca3b59d55b823251450)red 会把 gui 作为一个重心吧。很喜欢它的跨平台 gui 编程

charlesbao

[05:29](#msg59c49fcb7b7d98d30d23d08b)请问有什么方法能让gui在read/wait时不让程序等待，而致使未响应？或者red有什么办法多线程/进程/pool？

NjinN

[08:23](#msg59c4c87dc101bc4e3af6e025)@qtxie 同楼上，view在执行多条语句的时候，如何逐条显示，而不是处理完后最后显示

bitbegin

[10:55](#msg59c4ec3ebac826f054e91ead)没有办法，除非系统调用

qtxie

[11:52](#msg59c4f978bac826f054e95c26)@charlesbao 目前没有什么好的办法，只能自己调用系统API或者在on-time里面read数据

[11:54](#msg59c4f9f51081499f1f5eaac6)@NjinN 在你需要刷新界面的地方用 `loop 10 [view/no-wait]`，给GUI event loop一些时间处理消息

NjinN

[12:24](#msg59c500fd177fb9fe7eef297d)@qtxie 好的，我试试

[13:03](#msg59c50a351081499f1f5ef688)@qtxie 好像不起作用。。。

[13:06](#msg59c50ab8bac826f054e9b01c)view [ base white 1001x601 draw [ pen 255.0.0 line 0x300 1000x300...后面无数条pen语句

[13:06](#msg59c50ac17b7d98d30d25a7d3)如何实现逐条显示？

qtxie

[13:52](#msg59c515a4614889d4752a464a)可以用on-time event

## Wednesday 27th September, 2017

mahengyang

[04:02](#msg59cb22bb614889d475436cf8)

```
quit: func [
	"Stops evaluation and exits the program"
	/return status	[integer!] "Return an exit status"
][
	#if config/OS <> 'Windows [
		if system/console [system/console/terminate]
	]
	quit-return any [status 0]
]
```

这个里面的`#if config/OS`什么意思呀？在red终端里`config/OS` 没有定义，`#if`是预编译指令？

qtxie

[04:27](#msg59cb28a4b20c6424298fbf0b)是的，条件编译

flw-cn

[08:53](#msg59cb6707cfeed2eb655680b1)QQ 群号是多少？

qtxie

[09:06](#msg59cb6a2f210ac2692079131f)这里有：http://red.github.io/

flw-cn

[09:29](#msg59cb6f63b59d55b82341cd10)我就是因为这里点不开才找到了 gitter

mahengyang

[09:29](#msg59cb6f7832fc8b7e40464c48)间歇性被墙，多试试总能点开

flw-cn

[09:29](#msg59cb6f79210ac2692079348b)不过 gitter 也是头一次用，感觉这里也挺好的，功能比 QQ 强大，类似于 Slack

[09:30](#msg59cb6f9932fc8b7e40464d64)我倒是没被墙，就是点开之后自动弹出 QQ，但 QQ 又识别不出 QQ 号

[09:30](#msg59cb6f9e32fc8b7e40464d9d)腾讯的 BUG

mahengyang

[09:30](#msg59cb6fba7b7d98d30d40705f)mac

flw-cn

[09:30](#msg59cb6fbef7299e8f5379d796)嗯

mahengyang

[09:30](#msg59cb6fc5177fb9fe7e0a6823)是有这个问题

flw-cn

[09:31](#msg59cb6febb20c642429911dbb)我看 @qtxie 最近贡献了不少了

[09:31](#msg59cb6ff6f7299e8f5379d84e)辛苦了

mahengyang

[09:31](#msg59cb6ff9bac826f05404887e)他是主力开发

flw-cn

[09:43](#msg59cb72cc614889d475450494)那么，谁可以帮我看一下 QQ 群号是什么？

[10:05](#msg59cb77df51915d962af9cf73)请教大家一个问题

[10:06](#msg59cb781397cedeb04829d5f0)

```
flw at waker in ~/study/red
$ red foo.reb
Hello, world!

flw at waker in ~/study/red
$ ./foo.reb
** Script Error: Invalid compressed data - problem: -3
** Near: script: decapsulate
if none? script

flw at waker in ~/study/red
$ cat foo.reb
#! /usr/bin/env red

Red []

print "Hello, world!"

flw at waker in ~/study/red
$
```

[10:06](#msg59cb782751915d962af9cf83)这是为啥呢？

[10:06](#msg59cb783d97cedeb04829d5f9)我用 `red foo.reb` 可以执行，但是用 shebang 就不行。

qtxie

[10:10](#msg59cb790c7b7d98d30d40a168)群号码：427900172

flw-cn

[10:12](#msg59cb79850cef4fed2ebb19d2)谢谢

qtxie

[10:26](#msg59cb7cd0210ac26920797b45)不用谢:)

NjinN

[15:09](#msg59cbbf2f210ac269207b1f8e)加群被拒了。。。

qtxie

[23:17](#msg59cc317d32fc8b7e404acfe7)要回答问题的

## Thursday 28th September, 2017

NjinN

[02:08](#msg59cc59a2614889d4754a2e86)什么问题，没看到啊

[02:09](#msg59cc59cab20c642429966cd9)不会是print "Hello World" 吧

[02:13](#msg59cc5ab2b59d55b823471820)用QQ国际版，没看得到问题。。。换正常版的看到了

## Saturday 30th September, 2017

lzskyline

[10:27](#msg59cf71a2210ac269208dc714)哇

[10:28](#msg59cf71b87b7d98d30d5572f6)居然还有中文讨论组

[10:28](#msg59cf71e332fc8b7e405ad2c5)有没有大牛知道winapi怎么调? 有没有简单一点儿的demo

## Monday 2nd October, 2017

NjinN

[15:39](#msg59d25da7210ac269209a783f)rebol里是用load-extension调用dll吧

## Monday 16th October, 2017

mahengyang

[06:37](#msg59e453c7210ac26920ef4251)red里的`routine`函数是干什么用的呀？看源码只有一句话

```
routine: func [spec [block!] body [block!]][
	cause-error 'internal 'routines []
]
```

[06:38](#msg59e453ccbbbf9f1a38675b39)@qtxie

qtxie

[07:49](#msg59e46498bbbf9f1a3867b437)用routine可以在Red里嵌入Red/System代码

mahengyang

[07:50](#msg59e464b7614889d475bd83c0)哦，能给个小示例吗

NjinN

[07:50](#msg59e464b8177fb9fe7e83b98d)能提升效率吗

mahengyang

[07:50](#msg59e464ceb20c64242909b698)应该就是为效率而生

NjinN

[07:51](#msg59e464f0614889d475bd8529)那也只能编译执行吗

qtxie

[07:52](#msg59e4654ab20c64242909b989)https://github.com/red/red/blob/304d8a2f1e879aba50811354ba334454b77de4dd/tests/source/units/routine-test.red

[07:53](#msg59e4656ef7299e8f53f1b0b2)可以，如果代码里有routine，必须要编译才能运行的

## Friday 20th October, 2017

Linoonphan

[09:27](#msg59e9c1835c40c1ba79c4253f)有没有教程推荐一下

## Monday 23th October, 2017

zkboss

[02:46](#msg59ed57fa8808bed73d16dd90)由蔡老师写的中学生编程

## Saturday 28th October, 2017

dnpcwudi

[11:35](#msg59f46b9932e080696e36e557)冒个泡

## Monday 30th October, 2017

jackalcooper

[10:57](#msg59f70593614889d4751a09c0)怎么让窗口的大小根据某个值变化

[10:57](#msg59f7059d4ff065ac1892ada3)只能做到按钮大小变化

qtxie

[11:25](#msg59f70c33614889d4751a2e4d)当那个值变化的时候，去设置窗口大小

## Tuesday 31st October, 2017

jackalcooper

[02:27](#msg59f7df75976e63937e098894)@qtxie 可是怎么获取窗口啊，不能绑定一个view

[02:27](#msg59f7dfa4e44c43700a9a348c)

```
Red [
     Title: "Jackal playing around with Red lang"
]

view [
    style done: button "Done"
    field1: field hint "input here" return done [unview]
    button 300 "open second window!" [
        size_of_2nd_window: as-pair 200 200
        view [ size size_of_2nd_window title "Second Window" text1: button "field1/text"
            react [
                text1/text: field1/text
                l: attempt [(length? field1/text) * 10]
                text1/size: attempt [as-pair l 20]
            ]
        ]
    ]
]
```

[02:27](#msg59f7dfaeb20c6424296a74ed)这是我的代码

[02:28](#msg59f7dfbf210ac269204f953a)我想改button 的 block 里面的那个view的大小

qtxie

[02:30](#msg59f7e051976e63937e098b90)`layout` 可以返回窗口的对象。

```
view win: layout [button "变大" [win/size: win/size + 10x10]]
```

jackalcooper

[06:08](#msg59f813584ff065ac18983afb)@qtxie 明白了，谢谢你

[06:14](#msg59f814c6f7299e8f535282fd)感觉很爽，两个窗口的操作和一个窗口的操作没什么区别

## Wednesday 1st November, 2017

jackalcooper

[10:55](#msg59f9a827614889d47527d36c)怎么调用另外一个文件定义的方法或者parse规则呢

[10:57](#msg59f9a896976e63937e12a0a1)看代码找到了

[10:57](#msg59f9a89db20c6424297377c1)#include

[13:07](#msg59f9c70be44c43700aa3fd0f)这样的怎么匹配，匹配 n 位任意字符

[14:07](#msg59f9d504d6c36fca31c28de3)啊啊啊啊，parse实在太厉害了太好用了。。。为什么人类用了这么久的正则表达式

## Thursday 2nd November, 2017

qtxie

[04:47](#msg59faa3605a1758ed0f7ae45c)😉

## Friday 3th November, 2017

NjinN

[09:11](#msg59fc32bd5a1758ed0f82b832)@jackalcooper view可以绑定，用v: view/no-wait \[...]

[09:13](#msg59fc33282a69af844b4223ca)可以绑定一个object！，然后就可以用'/'随心所欲地修改窗口属性和内容

KevinOfNeu

[10:07](#msg59fc3fd0614889d475350385)Hi，刚开始玩 red, 请问如何进行 断点 debug ？

qtxie

[10:31](#msg59fc456f614889d475351e08)现在还不能设断点，计划0.7之前会支持

## Wednesday 8th November, 2017

jackalcooper

[02:29](#msg5a026bfde44c43700ace2690)@NjinN 感谢

## Thursday 16th November, 2017

imsaux

[07:29](#msg5a0d3e4ef257ad91099f89c5)想问下red现在能操作socket吗？看了rebol的例子，在red里好像不行啊

qtxie

[08:27](#msg5a0d4be1540c78242d0d7813)0

[08:27](#msg5a0d4be2540c78242d0d7817)7

[08:28](#msg5a0d4c2271ad3f8736eef332)要0.7才支持

imsaux

[08:29](#msg5a0d4c81f257ad91099fcf8b)到了0.7应该能开始做点项目啦

cwt8805

[08:36](#msg5a0d4e1cba39a53f1aa777c4)有个疑问，http不是工作在socket之上的吗，为啥能用http呢

qtxie

[09:24](#msg5a0d5965ba39a53f1aa7b418)现在http直接用系统提供的上层API做的，不是自己实现的

## Saturday 18th November, 2017

WayneCui

[07:01](#msg5a0fdadce606d60e34db57c9)期待

## Sunday 19th November, 2017

viest

[14:31](#msg5a1195d3cc1d527f6b8c9784)还有人马？

[14:31](#msg5a1195d871ad3f87360367cb)还有人吗？

## Monday 20th November, 2017

sunhonghe

[08:29](#msg5a12925bf257ad9109b812f9)你好

## Tuesday 21st November, 2017

qtxie

[08:05](#msg5a13de35540c78242d2cfa0e)你好 :smile:

## Thursday 23th November, 2017

yangchangming

[09:27](#msg5a16948acc1d527f6ba637dd)hello

flw-cn

[09:27](#msg5a169494614889d475b69d1d)hello

yangchangming

[09:28](#msg5a1694c3614889d475b69ee9)red是个好东西

flw-cn

[09:32](#msg5a1695b0982ea2653fb570f3)yes

[09:32](#msg5a1695b2df09362e67435d5e)赶紧发布 1.0 吧

[09:38](#msg5a16971b614889d475b6abe1)red 怎么处理命令行参数？

yangchangming

[10:25](#msg5a16a1fe982ea2653fb5b579)估计等1.0发布后，在出个web框架啥的，像rails这种，就流行了 哈哈

## Friday 24th November, 2017

yangchangming

[01:54](#msg5a177bbc71ad3f8736227804)https://www.youtube.com/watch?v=-KqNO\_sDqm4 作者的一个red介绍，可以实时翻译成中文的

## Friday 1st December, 2017

oppih

[18:25](#msg5a219e9b232e79134df829de)有没有用red玩 adventofcode.com 的？
