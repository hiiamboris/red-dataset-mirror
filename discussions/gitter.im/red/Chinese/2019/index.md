# Archived messages from: [gitter.im/red/red/Chinese](/gitter.im/red/red/Chinese/) from year: 2019

## Sunday 20th January, 2019

c61292558

[17:46](#msg5c44b3e0f780a1521f3f5fd6)请问red有什么办法可以加载读取CAD图？Linux上面

## Monday 21st January, 2019

NjinN

[01:30](#msg5c4520c5cb47ec30007706f1)@c61292558 linux目前应该还没有办法支持view组件, 另外dwg文件不会被识别为图片加载, 需要转到jpg或png之类的图片格式

c61292558

[05:12](#msg5c4554c69bfa375aab34b60b)view不是跨平台的吗？我不是要他识别为图片，我是要直接打开的那种可以画图的那种 @NjinN

qtxie

[06:08](#msg5c4561d8cb47ec30007890e2)@c61292558 目前没有CAD相关的库

c61292558

[11:50](#msg5c45b205cb47ec30007a8ce0)o(╥﹏╥)o。。。

[11:50](#msg5c45b20995e17b452586ddc0)谢谢了

## Thursday 24th January, 2019

1669561324

[13:26](#msg5c49bd1095e17b4525a1b215)@1669561324  
有刷过中文版和英文版的吗  
我前几天刷了一百多英文版的还在css里，这两天刷70多中文版的，就已经bootstrap了？  
两个版本难道不同吗  
谁两个都刷过的能否告知

[13:26](#msg5c49bd1fcb47ec3000952834)everyone

[13:27](#msg5c49bd2483189945243ef9d6)hello world

## Saturday 26th January, 2019

Kiti-Nomad

[12:49](#msg5c4c575513a2814df6cdc9e6)hey guys

## Monday 28th January, 2019

NjinN

[01:15](#msg5c4e57aac2dba5382e9b7608)这是中文聊天室

## Wednesday 30th January, 2019

NjinN

[09:31](#msg5c516f08f46373406a236bf2)@qtxie 晴天大佬, parse规则里的代码块中使用`do-events`报错

[09:35](#msg5c516ff054f21a71a1cc5ca4)另外, 我`mold`了一个map!以文本的形式保存, 大概4M多, 用Red加载的需要大概15秒, 有办法提高速度吗

[09:39](#msg5c5170d454f21a71a1cc6195) \*\** Script Error: head does not allow none! for its series argument  
\*\** Where: head  
\*\** Stack: do-events do-actor do-safe eval-set-path

qtxie

[10:34](#msg5c517da7ceb5a2264f6535b3)do-events报错，是因为没有窗口吧

[10:35](#msg5c517e0c41775971a0a9673a)map!的问题要具体分析，不应该这么慢。我要怎么重现这个问题？

NjinN

[12:42](#msg5c519bbc78e1ed4103b35e31)@qtxie 帮忙看一下这个

[12:42](#msg5c519bca54f21a71a1cd94ba)https://github.com/NjinN/Recode/tree/master/Red/ChineseSlice

[12:43](#msg5c519bf313a2814df6ef72e9)这里加载rules-map.txt里的map!特别慢

[12:44](#msg5c519c12f46373406a24ac7d)对应的rebol版本https://github.com/NjinN/Recode/tree/master/Rebol/ChineseSlice

[12:44](#msg5c519c329221b9382de74ddf)rebol3基本上加载时间可以忽略不计，和red差距很大

[12:46](#msg5c519ca0f04ef00644aebcba)另外rebol里的`make-rules.r`这个文件是用来从`dict.txt`文件生产parse的rules的，但这个脚本用red跑不了，单核占满，跑了很久都没有结果

qtxie

[13:33](#msg5c51a7bf13a2814df6efc95a)Rebol的一些parse rule跟Red是不一样的。

NjinN

[13:44](#msg5c51aa3393fe7d5ac0157c83)现在parse没有问题，能用

qtxie

[13:47](#msg5c51aaf87b68f94102425836)单核占满的问题，估计是因为这些差别

[13:48](#msg5c51ab149221b9382de7b3a9)生成的rules不能直接用在Red里

NjinN

[13:57](#msg5c51ad397b68f94102426bad)现在时在生产rules的时候占满了，是用foreach遍历一个block的时候， 没有用到parse

[13:57](#msg5c51ad4fc2dba5382eb15d72)现在用rebol3生成的rules是能用的，就是加载太慢了

qtxie

[14:00](#msg5c51ae15ceb5a2264f669fe8)好的。我明天看看。

NjinN

[14:04](#msg5c51aef2975714406b679a7c) foreach word word-block [  
block: select temp-block to-string word/1  
either block [  
append temp-block/(to-string word/1) to-string word  
] [  
append temp-block reduce \[to-string word/1 reduce \[to-string word]]  
]  
]

[14:04](#msg5c51aef9f04ef00644af4d27)这一段走不下去

## Thursday 31st January, 2019

qtxie

[11:34](#msg5c52dd3754f21a71a1d5f0fa)@NjinN 速度慢不是map的问题，改成make block! 一样慢。应该是lexer的问题，现在的lexer是直接用Red的parse实现的，所以很慢。Rebol的Lexer是高度优化的C代码，所以很快。

[11:35](#msg5c52dd7393fe7d5ac01da33d)有计划用R/S来重写lexer的，应该会加速很多。

[11:37](#msg5c52dde91b62f126507bf483)有个办法是直接把这map嵌入到文件里，然后编译。这样这个map会存在redbin里，就不要经过lexer解析，会很快。

[11:53](#msg5c52e1d1975714406b6fb4e2)@NjinN `make-rules.r`可以跑，就是很慢。把temp-block改成hash就快了 `temp-block: make hash! 50000`。

[11:54](#msg5c52e21113a2814df6f80fa9)block: select temp-block to-string word/1  
在block里查找是线性时间复杂度，是很慢的。

NjinN

[12:24](#msg5c52e8f2454aad4df7d0822a) @qtxie 好的，谢谢。另外仓库里有个Red写的flappybird，运行的时候画面有闪烁的情况，有办法解决吗

[12:26](#msg5c52e97f8aa5ca5abf5fcebe)特别是窗口右边缘，一直在闪

qtxie

[13:26](#msg5c52f779f46373406a2db023)要先找到原因。你可以看看red/code里的代码，里面有些有动画的程序，是不闪烁的。

NjinN

[13:29](#msg5c52f836f04ef00644b82339)red/code?源码里？

[13:30](#msg5c52f85c975714406b705599)好像找到了

[13:41](#msg5c52fafe8aa5ca5abf6046d6)@qtxie `system/view/auto-sync?: no`和`system/view/auto-sync?: yes`有区别吗

## Monday 4th February, 2019

Kiti-Nomad

[10:39](#msg5c58167a7b68f941026c0a4d)happy New Year， guys

bitbegin

[10:58](#msg5c581ae29221b9382d117d91)新年快乐。。

x8x

[22:21](#msg5c58badfdf8a67280361b493)Happy New Year Chinese friends! :smiley:

## Tuesday 5th February, 2019

qtxie

[00:32](#msg5c58d99c93fe7d5ac0442456)新年快乐！恭喜发财！

pimgeek

[05:24](#msg5c591e1cceb5a2264f971651)新年快乐！

## Sunday 10th February, 2019

c61292558

[09:10](#msg5c5fea85d1e3093ab5f6629e)http://www.red-lang.org/ 为什么进不去了。。。

bitbegin

[10:54](#msg5c6002f1ef98455ea40f1a86)要翻墙

c61292558

[10:55](#msg5c60031180df6804a17dd87f)我就不明白了，一个技术网站为什么要屏蔽？？？

[11:07](#msg5c60060b7502282258d53f7f)linux下面没有像win那样的图形界面 的吗？

bitbegin

[11:27](#msg5c600ab5ecef85660b7f863a) gtk分支试试

c61292558

[14:17](#msg5c60328780df6804a17f1555)是要下载下来自己编译吗？

## Thursday 21st February, 2019

pimgeek

[09:19](#msg5c6e6d2d9155d45d904d375c)\[!\[image.png](https://files.gitter.im/red/red/Chinese/eqDz/thumb/image.png)](https://files.gitter.im/red/red/Chinese/eqDz/image.png)

[09:19](#msg5c6e6d37a378ef11f615b796)如何在 Red 中生成一个系列的数值 \[0 1 2 3 4], 就像在 python3 中那样 list(range(5))？我在网上没查到相关介绍，而我自己写的 function 会有副作用，第二次生成的时候，就乱了。😥

[09:28](#msg5c6e6f30a7d733509d9ff7af)\[!\[image.png](https://files.gitter.im/red/red/Chinese/hyz4/thumb/image.png)](https://files.gitter.im/red/red/Chinese/hyz4/image.png)

[09:28](#msg5c6e6f347667931e2fd7c3ed)我在 red / help 频道得到了解答！应该用 copy

bitbegin

[09:31](#msg5c6e70095df86a45686d5ca4)

```
>> range: function [num [integer!]][list: clear [] repeat i num [append list i] list]
== func [num [integer!] /local list i][list: clear [] repeat i num [append list i] list]
>> range 10
== [1 2 3 4 5 6 7 8 9 10]
>>
```

pimgeek

[14:20](#msg5c6eb3a485b7eb45690a426e)@bitbegin 你也是来自中国的啊 😊

## Sunday 3th March, 2019

NjinN

[03:51](#msg5c7b4f4c212d0c1e1ac35820)@qtxie `view`和`wait`似乎有点冲突，我在循环里使用wait，每隔一段时间切换gui界面里的图片，切换几次后就会无响应，不使用wait的时候就没事，能看一下是什么原因，或怎么解决吗

## Tuesday 5th March, 2019

qtxie

[14:55](#msg5c7e8ddfe8ea143737b79340)这个问题要0.7的时候解决

## Wednesday 6th March, 2019

NjinN

[09:24](#msg5c7f91ca86e34a126f960b74)@qtxie 哦，好的

## Monday 11st March, 2019

NjinN

[03:57](#msg5c85dc910a6b9151630c8aae) &gt;&gt; b: \[]  
\== \[]  
&gt;&gt; append/only b make object! \[a: 1 b: 2]  
\== [make object! [  
a: 1  
b: 2  
]]  
&gt;&gt; length? b  
\== 1  
&gt;&gt; blk: do mold b  
\== [make object! [  
a: 1  
b: 2  
]]  
&gt;&gt; length? blk  
\== 3

[04:02](#msg5c85ddbaf895944c0874b8c4)@qtxie 我想利用`mold`来实现代码/数据的持久化，但是重新加载的时候间接值的字面表达形式`make type! spec`会被解析为3个token，有没有办法让它直接生成间接值。`mold`在生成字符串的时候，在间接值的两端加上括号，变成一个圆块，能不能解决这个问题

bitbegin

[09:17](#msg5c8627aeac408e11923eb002)`blk: do do mold b` 或者 `blk: do load mold b` 都行吧

NjinN

[09:18](#msg5c8627df2f2fb54c37d022ca)@bitbegin 如果里面嵌套了很多层，就不行

bitbegin

[09:19](#msg5c86283ec8e5bc51622106bf)举个例子

NjinN

[09:31](#msg5c862ae13162ec7bc7532f76)@bitbegin 重试了一下，主要是碰到block！的时候就出问题了

[09:31](#msg5c862afc25e4e24c074e6fcb)例如`b: [ ] append/only b make object! [a: 1 b: 2 c: reduce [make object! [x: 3]] ]`

[09:32](#msg5c862b14f895944c0876bc71)这个就没办法把里面的object还原回去

bitbegin

[09:37](#msg5c862c57ac408e11923ed341)blk: reduce load mold b

[09:37](#msg5c862c60ac408e11923ed399)你要的这样的？

NjinN

[09:39](#msg5c862cbec8e5bc5162212a52)@bitbegin `length? blk/1/c`你试一下这个

bitbegin

[09:40](#msg5c862d101fae6423ca67f351)那要用循环处理一下

NjinN

[09:40](#msg5c862d191c597e5db6bb5e83)并不好处理

bitbegin

[09:41](#msg5c862d4fc8e5bc5162212e63)容易

NjinN

[09:41](#msg5c862d53f895944c0876cfb7)我能想到的是在`mold`的时候转成圆块，然后用`compose/deep`比较好

[09:43](#msg5c862db12f2fb54c37d04820)能给个方案吗，现在的需求是mold之后按文本储存，加载的时候是获取文本，还原为实例

bitbegin

[10:01](#msg5c86320be527821f0a3c9aa7)你这个append/only错误的把

NjinN

[10:02](#msg5c86321b2f2fb54c37d066c8)没错吧

bitbegin

[10:02](#msg5c8632291c597e5db6bb85ff)b: context \[a: 1 b: 2 c: context \[c: 3]]

[10:02](#msg5c86323eb4b6ef7bc88eef20)blk: do load mold b

NjinN

[10:02](#msg5c8632491fae6423ca68143a)你这个和上面的不一样

[10:03](#msg5c863267d3b35423cb9ddb6c)`b/c`是一个block！的时候问题就出现了

bitbegin

[10:03](#msg5c863268c8e5bc51622150b3)append/only 不要那样用

NjinN

[10:03](#msg5c8632751c597e5db6bb8772)这样用没问题啊

bitbegin

[10:03](#msg5c86327825e4e24c074ea34c)那个block！和求值混淆了

[10:05](#msg5c8632e00a6b9151630ec16d)b: context \[a: 1 b: 2 c: context \[c: 3]]

[10:05](#msg5c8632e92f2fb54c37d06c2f)这个b是值

NjinN

[10:06](#msg5c86331b8f294b134a232b74)你这个结构和我上面的不一样

[10:06](#msg5c86332dac408e11923f070e)我说的问题是如果b/c是block类型，就不行

[10:07](#msg5c86336a2f2fb54c37d0704a)所以你的例子要想重现我的问题就应该是`b: context compose [a: 1 b: 2 c: [ (context [c: 3])]]`

bitbegin

[10:07](#msg5c86336f8f294b134a232e12)就是这里code和值不容易处理，得考虑下

[10:09](#msg5c8633c30a6b9151630ec7af)b: load mold context \[a: 1 b: 2 c: context \[x: 3]]

[10:09](#msg5c8633c8ac408e11923f0af8)blk: do b

[10:09](#msg5c8633d9e527821f0a3ca5df)这样就好了

NjinN

[10:09](#msg5c8633f4c8e5bc5162215c52)你这还是没用block！啊。。。。

[10:10](#msg5c863408d3b35423cb9de57d)你的例子我改过了，在上面，你尝试一下

bitbegin

[10:11](#msg5c86343f293ac75db58acb4a)c那里用block！？

NjinN

[10:11](#msg5c86344be527821f0a3ca7df)诶没改好，应该是`b: context compose/deep [a: 1 b: 2 c: [ (context [c: 3])]]`

[10:11](#msg5c8634531fae6423ca681fe4)对啊，审题啊少年

bitbegin

[10:13](#msg5c8634d32f2fb54c37d07a73)

[10:13](#msg5c8634e41c597e5db6bb9a5a)

```
>> b: load mold context [a: 1 b: 2 c: do [context [x: 3]]]
== [make object! [
    a: 1 
    b: 2 
    c: make object! [
        x: 3
    ]
]]
>> blk: do b
== make object! [
    a: 1
    b: 2
    c: make object! [
        x: 3
    ]
]
>> blk/c
== make object! [
    x: 3
]
>>
```

[10:14](#msg5c86351c1fae6423ca6827b6)reduce 完那里还是block，你还要do一下，得到值

NjinN

[10:15](#msg5c863528d1e7281f090dd400)这个显然不合适

bitbegin

[10:15](#msg5c86355cf895944c087705e2)怎么不合适？

NjinN

[10:16](#msg5c863568ac408e11923f164d)现在这个block里只有一个object当然没问题，但是如果有其它的代码，例如设字，那么reduce就会破坏数据

bitbegin

[10:18](#msg5c8635d81c597e5db6bba19e)得拿一个具体需求去看了

NjinN

[10:20](#msg5c86366e1c597e5db6bba8fc)例如我现在c里想放`context [x: 3]`，然后再放一个绑定了自定义函数的`f`，并且这个函数还需要参数，这个时候用reduce就会报错

bitbegin

[10:21](#msg5c863692d3b35423cb9df3a8)b: \[a: 1 b: 2 c: none]

[10:21](#msg5c86369c0a6b9151630eda86)这个开始的数据

[10:22](#msg5c8636c90a6b9151630edbac)b: \[context \[a: 1 b: 2 c: none]]

[10:26](#msg5c8637c3293ac75db58ae539)

```
>>  b: [context [a: (1) b: (2) c: (none)]]
== [context [a: (1) b: (2) c: (none)]]
>> b/2/c: make paren! [context [x: 3]]
== (context [x: 3])
>> b
== [context [a: (1) b: (2) c: (context [x: 3])]]
>> c: do b
== make object! [
    a: 1
    b: 2
    c: make object! [
        x: 3
    ]
]
>> c
```

[10:26](#msg5c8637cfe527821f0a3cc283)这种效果？

NjinN

[10:29](#msg5c863889b4b6ef7bc88f18b4)只是间接值需要加

[10:29](#msg5c8638a2d1e7281f090debe1)不过我想了一下，如果碰到原数据里就是有圆块的话，还是会冲突

[10:30](#msg5c8638b51c597e5db6bbbaab)可能需要另外标记才好处理

[10:31](#msg5c8639001c597e5db6bbbdea)间接值都是`make type! spec`这样的字面形式，如果放在block里，load的时候有歧义

bitbegin

[10:32](#msg5c863942d1e7281f090df0cd)加那个圆括号只是方便找数据

[10:52](#msg5c863e0bac408e11923f5479)

```
>>  b: [context [a: 1 b: 2 c: none]]
== [context [a: 1 b: 2 c: none]]
>> b2: do b
== make object! [
    a: 1
    b: 2
    c: none
]
>> b2/c: context [x: 2]
== make object! [
    x: 2
]
>> b: load mold b2
== [make object! [
    a: 1 
    b: 2 
    c: make object! [
        x: 2
    ]
]]
```

[10:53](#msg5c863e103162ec7bc753b7a3)或者这样

NjinN

[10:54](#msg5c863e660a6b9151630f1166)额，这个对我说的需求没什么意义啊

bitbegin

[10:55](#msg5c863ea6d1e7281f090e13fc)那只能上面那种直接操作 代码了

NjinN

[10:55](#msg5c863eb3293ac75db58b18f4)而且你这个不对题啊，b/c都不是block！了

[10:57](#msg5c863f0e0a6b9151630f1687)我想另外写一个`mold`，在格式化成字符串的时候用特殊符号把间接值都标记出来，然后加载的时候用parse先处理一遍间接值

## Thursday 21st March, 2019

btsts

[04:41](#msg5c93160f9d9cc8114af60604)在吗

[04:43](#msg5c9316718126720abc193297)我是新手，请问如果想学习red.语言，我从哪里开始？

NjinN

[04:46](#msg5c931718dfc69a1454cbbb65)https://doc.red-lang.org/zh-hans/

[04:47](#msg5c93177a6a3d2e230dfbde2b)Red目前还没有完整的教程, 入门可以对照着看Rebol教程, 可以看Rebol用户手册http://www.rebol.com/docs/core23/rebolcore.html

[04:48](#msg5c9317ae52c7a91455ccbaa9)中文的话可以看 www.raccoode.fun , 有介绍语法和比较简陋的视频教程

btsts

[08:15](#msg5c93481f6a3d2e230dfd0e19)太棒了，我是初中毕业，第一次接触计算机语言，没有其它语言基础，这个不影响我的初始学习吗？

[08:16](#msg5c9348636a3d2e230dfd0f8c)如果学习的好，可以得到red币奖励吗？

[09:19](#msg5c9357098aa66959b647433e)这个red和rebol有95%的相似

[09:19](#msg5c93572ad0133e21e5edb975)就像c++和c语言？

bitbegin

[09:24](#msg5c93585ddfc69a1454cd5dfd)c++和C可以当成两种语言

btsts

[09:31](#msg5c9359f0fcaf7b5f73ed27d3)rebol有编译程序软件，red有编译软件吗？

[09:32](#msg5c935a31dfc69a1454cd6ce7)刚才我看了视频，但是视频不是太清晰，确实是最简单的编程语言，像我这样零基础的都可以学习

bitbegin

[09:32](#msg5c935a419d9cc8114af7c31f)red.exe 可以编译 也可以执行

btsts

[09:33](#msg5c935a6d9d9cc8114af7c42e)在哪里下载呢？有网址吗？

bitbegin

[09:34](#msg5c935aa02fb6800d8056d2ed) 国内可以用这个

[09:34](#msg5c935aa2a21ce51a20977f6e)https://red.github.io/

btsts

[09:34](#msg5c935aa78126720abc1af30c)代码上传怎么上传到guihub？需要打包吗？

[09:34](#msg5c935ac22fb6800d8056d47c)谢谢你，你也是编程人员吗？

bitbegin

[09:35](#msg5c935ac9fa5b721a1fc57705)你需要了解一下git和github

[09:36](#msg5c935b3aa21ce51a20978272)@NjinN 网站挺好的

btsts

[09:37](#msg5c935b63fa5b721a1fc57d1f)好的，可以直接下载吗？

[09:38](#msg5c935b816a3d2e230dfd9b12)用red编程，然后可以上传到github

bitbegin

[09:38](#msg5c935b849d9cc8114af7cbc8)https://static.red-lang.org/dl/auto/win/red-latest.exe

btsts

[09:41](#msg5c935c438126720abc1afce1)谢谢，你是red编程的成员吗？

[09:42](#msg5c935c74f3dbbd230c90a995)我电脑正好是windows10

[09:42](#msg5c935c816a3d2e230dfda0c5)64位的

[09:43](#msg5c935cb1a21ce51a20978d37)别人说rebol代码更新慢，

[09:45](#msg5c935d488aa66959b6477318)1、gui组件相当不全 　　2、不支持中文 　　3、缺少文件 　　4、无web server模块，不支持跨平台

[09:47](#msg5c935d95d0133e21e5ede57b)太专业化的，如网络服务模块，跨平台，我也不太懂

bitbegin

[09:47](#msg5c935dbedfc69a1454cd8476)rebol 算是老一代的把，不更新了

btsts

[09:48](#msg5c935dd42fb6800d8056e6da)加油啊，以后我要努力学习

[09:48](#msg5c935dfffcaf7b5f73ed4552)我感觉很神奇，而且我投了red币😄

[09:50](#msg5c935e64f3dbbd230c90b62e)你们确实很给力，无偿的教学习，真的很感动，我曾经想学习，在网上都需要交钱，而且你们是red创始人，跟着创始人团队学习，真的很荣幸😄

[09:51](#msg5c935e9bfcaf7b5f73ed48ad)开始主要以炒币为主，自从买了reb币，现在开始静下心来学习编程了，还可以提高英语水平

[09:51](#msg5c935ea98aa66959b6477a15)red币

bitbegin

[09:53](#msg5c935f16a21ce51a2097a074)今天应该会有很大更新的

btsts

[09:53](#msg5c935f333dd81711492850f3)太棒了，能多给我们讲讲吗？有什么重大更新

bitbegin

[10:01](#msg5c9360f3a21ce51a2097ad01)我了解的也不多，语言这一块主要是IO和Android，算是大家比较希望的功能

NjinN

[10:02](#msg5c9361216a3d2e230dfdc187)@btsts 外链限制的分辨率, 想看清晰的, 只能跳转到B站

btsts

[10:33](#msg5c93688b52c7a91455ced3cc)怎么跳转到b站

[10:34](#msg5c9368ab0d719050573ea27f)@NjinN 我不太会跳转，感觉不太清晰

[10:34](#msg5c9368d38126720abc1b58aa)@bitbegin 你已经很厉害了，我什么都不懂，我是通过买币才认识的red

NjinN

[10:36](#msg5c93694649fdaa0d81eee47f)视频右下角选清晰度为720P就自动跳转到B站了

btsts

[10:43](#msg5c936ab98aa66959b647d3de)好的，谢谢

[10:43](#msg5c936acb3dd8171149289d46)我下载了gitter软件

[10:43](#msg5c936ad0f3dbbd230c910a2a)用着很方便

[10:49](#msg5c936c2a52c7a91455ceed49)可以了，我用的电脑版，可以看的非常清晰

[10:49](#msg5c936c3049fdaa0d81eef94c)真给力

[10:49](#msg5c936c47fcaf7b5f73eda4ca)我有闲钱再买点red币，哈哈😄

NjinN

[10:51](#msg5c936cb0f3dbbd230c91167c)...币市有风险, 投资需谨慎

btsts

[10:52](#msg5c936ce449fdaa0d81ef00a7)没事，我看好red语言这个项目

[10:52](#msg5c936ceadfc69a1454cdfba8)我会投的

[10:52](#msg5c936cfc3dd817114928ad58)只要red语言在，red币就不会归零

[10:53](#msg5c936d16fcaf7b5f73eda885)我买了620000个red币

[11:09](#msg5c9370ea0d719050573ed8c9)这个gitter不能发表图片太可惜啦

bitbegin

[11:18](#msg5c9372eb0d719050573ee1f4)ctrl + v 就可以发到这里

btsts

[11:30](#msg5c9375dddfc69a1454ce3ea1)我用的是手机gitter app

[11:31](#msg5c937612fa5b721a1fc64224)还有一个问题，用red语言可以编写大型项目吗？

[11:32](#msg5c937630a21ce51a20984560)一般大型项目都是go语言编写的

bitbegin

[11:33](#msg5c937688fcaf7b5f73ede8a7)大项目要靠人管理，以后实现module后，更加容易

[11:36](#msg5c937746dfc69a1454ce499f)\[!\[image.png](https://files.gitter.im/red/red/Chinese/YLQD/thumb/image.png)](https://files.gitter.im/red/red/Chinese/YLQD/image.png)

[11:36](#msg5c93774bd0133e21e5ee94ea)--&gt; 发错了

[11:37](#msg5c937760d0133e21e5ee9570)今天应该会有很大更新的 --&gt; 今年应该会有很大更新的

btsts

[13:20](#msg5c938fb2d0133e21e5ef50bd)好的，收到

[22:17](#msg5c940d898126720abc2000a4)今年c3会出来吗？

## Friday 22nd March, 2019

btsts

[07:08](#msg5c948a060d7190505746585f)我下载了软件，现在有个问题啊

[07:09](#msg5c948a1381b15c5e4b6838c1)编好的代码怎么保存啊

[07:10](#msg5c948a696a3d2e230d05e15a)软件只有3个按钮file. options. help

[07:10](#msg5c948a7e52c7a91455d6bdaa)就这三个啊，没有保存按钮？

[07:30](#msg5c948f2b5547f774484658a7)&gt;&gt; write %1. txt "hello world"  
\*\** Script Error: txt has no value  
\*\** Where: write  
\*\** Stack:

NjinN

[07:58](#msg5c9495b7a21ce51a209fed9a)txt前面不要空格

btsts

[08:00](#msg5c94962752c7a91455d715c3)弄好大哥

[08:00](#msg5c9496312fb6800d805f8720)真的很神奇

[08:00](#msg5c949636d0133e21e5f62d58)很让人激动

[08:01](#msg5c94965b8126720abc23668c)继承了rebol语言的快捷，小学毕业都可以玩

[08:02](#msg5c949680d0133e21e5f63050)而且ted预言软件不需要解压，直接点开就可以玩

[08:02](#msg5c949687d0133e21e5f630b2)真爽

[08:37](#msg5c949ebf8aa66959b64fe8d0)怎么保存呢？

[08:37](#msg5c949ed5f3dbbd230c996aba)没有保存键

[12:03](#msg5c94cf0c8126720abc24e971)在吗？

[12:03](#msg5c94cf262fb6800d80611976)怎么吧red代码上传到github

NjinN

[12:13](#msg5c94d17dd0133e21e5f7d504)先学会写好Red代码再想着发布吧, 不是能运行就是好的代码

## Saturday 23th March, 2019

btsts

[10:44](#msg5c960df43dd81711493a4359)哈哈，好的

[10:44](#msg5c960e009d9cc8114a09ebe3)我现在先研究rebol

[10:44](#msg5c960e033dd81711493a44a9)哈哈

## Thursday 18th April, 2019

31880994zz

[12:36](#msg5cb86f5a1cd0b8307d318e13)这里好像很久没人谈论话题了

## Friday 19th April, 2019

qtxie

[12:47](#msg5cb9c365b4700e023d9a275b)中文用户很少的

## Saturday 20th April, 2019

31880994zz

[03:37](#msg5cba94023b6cb0686a2049eb)@qtxie CCC还要多久才出来呀 看路线图好像去年就应该出来啦 不知道公司是不是遇到了什么问题

qtxie

[08:42](#msg5cbadb59990feb4518d133d7)@31880994zz 单纯的做的慢 :sweat\_smile:

31880994zz

[10:55](#msg5cbafa8f97dcb371d8e2f6ba)@qtxie 呵呵 这用词太有才了 单纯而且慢 对吗 ？

[11:46](#msg5cbb068db4700e023da24dfb)@qtxie 现在底层公链闹得热火朝天 我不太理解为什么红色语言不自己开发一条底层公链 然后在公链上使用自己的红色语言 这样推广起来不是更方便吗

qtxie

[11:51](#msg5cbb07b43d78aa6c0364cf26)让做开发工具的去做操作系统，不现实吧

31880994zz

[12:13](#msg5cbb0cd197dcb371d8e36828)@qtxie 我觉得这对于红色团队来说没有什么问题呀 自己的底层公链再加上自己的开发工具上链 然后再用开发工具在自己的公链上开发智能合约  
DAPP等等 完整的一B 哈哈

[12:15](#msg5cbb0d531cd0b8307d42a304)@qtxie 其实作为一个有实力的技术团队 热点该蹭还是要蹭的 毕竟高处不胜寒

qtxie

[13:01](#msg5cbb182d6a84d76ed8c56e34)@31880994zz 团队一直是做开发工具类的，没有做公链的知识和经验。而且做公链需要影响力，全球各地的人愿意运行你的节点，这个链才能称作公链。

31880994zz

[13:26](#msg5cbb1df3a4ef097471cd9a33)@qtxie 嗯 嗯 不过有时候机会还是应该把握的 国内不是说 风来的时候 猪都可以飞起来吗 哈哈 像国内公信宝 比原链 也都还好吧 不一定非要有多么广泛的影响力 现在都是无脑链 ：）

[13:47](#msg5cbb22ed990feb4518d2fbdd)@qtxie 特别特别期待RED/CCC的全部完成

## Tuesday 23th April, 2019

jefurry

[13:25](#msg5cbf122db489bb6ed7afaa0f)@qtxie 刚学`Rebol/Red`几天，有个关于 `read/write`的疑问。【@greggirwinyu 回复我说：@jefurry you can't set the timeout currently. Red has only basic I/O in place, with full I/O to come in 0.7.0. 】我看`Rebol`的文档也说要全局设置。但是就算只是简单的`I/O`，超时时间还是要能设置吧？不能怎么能在生产上用`read/write`这类方法？而且`Red`的`read/write`是基于`libcurl`来实现的，为什么不考虑加一个类似于`/timeout`这样的`refinement`呢？

## Wednesday 24th April, 2019

qtxie

[05:37](#msg5cbff62a3b6cb0686a434933)现在这个实现不适合用在生产环境的，Red本身也不适合用于生产。

[05:39](#msg5cbff6ac3d78aa6c0385b16e)正如你所说的，实现起来不难。如果你需要，可以自己加的。这个就是开源软件的好处，可以按照自己的需要修改。

## Thursday 25th April, 2019

jefurry

[07:21](#msg5cc15ff98446a6023e720d15)@qtxie 嗯。`Red`真是一个值得学习的好项目，可惜我`Rebol`才学几天。看了会`Red 0.1.0`的源码，难怪`Red`可以保持这么小的体积，竟然没有用任何编译后端，直接翻译成机器码，生成`PE`, `ELF`, `Mach-O`格式的可执行文件。

## Saturday 27th April, 2019

31880994zz

[09:35](#msg5cc42262e416b84519eb5afa)红色令牌为什么不能多上几个交易所 提升下知名度

## Saturday 27th July, 2019

NjinN

[13:19](#msg5d3c4f6cf0ff3e2bba78e5d8)@qtxie base的wheel事件里，event/offset返回的是相对屏幕的偏移，看文档应该是返回相对base的偏移，这里是不是有点问题

## Sunday 28th July, 2019

qtxie

[05:25](#msg5d3d31cf7e00fc4ace611c6d)offset目前没有明确定义，文档里不应该出现。

[05:28](#msg5d3d32642136933a8703dfe2)@NjinN 你的用例是什么？

NjinN

[06:20](#msg5d3d3e903e51d77b1b803e79)@qtxie 通过wheel事件对base里draw的图片进行缩放，以当前鼠标位置为缩放中心，但是目前event/offset返回相对屏幕的偏移，这样计算相对偏移的时候要算上标题栏和菜单栏，比较麻烦

## Tuesday 30th July, 2019

bitbegin

[07:35](#msg5d3ff35f8aab922429e714f7)给个简单测试例子？

NjinN

[09:52](#msg5d401370ecf3bf7b1a6243b7) view \[base on-wheel \[print event/offset]]

[09:53](#msg5d40138ac356af25e05468b8)例子超简单的，关键看怎么定义这个

```
event/offset
```

[09:55](#msg5d4013fbc356af25e0546c5a)像

```
on-down
```

、

```
on-up
```

这些事件，

```
event/offset
```

返回的都是相对于元件的偏移

## Wednesday 31st July, 2019

bitbegin

[09:29](#msg5d415f635a72fc7ba4cc3588)提交了一个pr，`view [base on-wheel [print event/offset print event/picked]]` `event/picked`可以反映速度的快慢

[09:29](#msg5d415f74e2802b6790a0b3b6)不过macos平台有bug，滚轮太快，数据就错了，而且event/picked 也是错的，后面再解决

NjinN

[12:03](#msg5d4183a8771bca3ea4df2db1)改了

```
event/offset
```

吗

[12:05](#msg5d418422e2802b6790a1c3f0)另外开启

```
all-over
```

时，

```
on-over
```

事件响应比较慢，移动的比较快的时候获取的

```
event/offset
```

不连续

bitbegin

[23:12](#msg5d42207820f75e7ba5600a39)好的

## Thursday 1st August, 2019

bitbegin

[00:03](#msg5d422c404ba6af0b0267c47e)`view/flags [base 100x100 on-over [print event/offset]] [all-over]`

[00:03](#msg5d422c4d395d5d467100d81a)看着没啥问题

[00:03](#msg5d422c4e395d5d467100d81c)\[!\[over.gif](https://files.gitter.im/red/red/Chinese/3PgR/thumb/over.gif)](https://files.gitter.im/red/red/Chinese/3PgR/over.gif)

NjinN

[02:26](#msg5d424de545775115b378179a)我是在

```
on-over
```

事件上加了一个draw命令，绘制一个跟随指针的圆圈，然后还有其他操作，估计是这些操作导致事件响应跟不上吧

bitbegin

[02:49](#msg5d425331b0bf183ea37a7a8a)把base放大了一下，all-over没有起作用

[02:50](#msg5d425381b0bf183ea37a7d76)你遇到了么

NjinN

[03:08](#msg5d4257c7e2802b6790a7cbb0)没有诶

bitbegin

[03:55](#msg5d4262b31241645b16f581ae)`view [b: base 200x200 on-over [print event/offset] do [b/flags: [all-over]]]` 是这样用的。。。

NjinN

[04:37](#msg5d426ca545775115b378e802)

```
view [b: base 200x200 on-over [print event/offset] with [flags: [all-over]]]
```

用

```
with
```

感觉比较好吧

bitbegin

[05:38](#msg5d427af145775115b379439d)是的，这个好点

NjinN

[06:17](#msg5d4283fd9a02440b033775c3)发现移动的比较块的时候能获取的事件响应就是不连续，像这种200x200的大小，移动的比较快的时候，

```
on-over
```

可能只获取到2次。。。

bitbegin

[06:23](#msg5d42854a395d5d46710323b5)肉眼还观察不到

## Monday 9th September, 2019

Kiti-Nomad

[07:04](#msg5d75f98dc38d634123c10185)问个问题啊，gitter怎么发送图片

[07:04](#msg5d75f995d5c7bd57945e193e)或者gif

bitbegin

[07:59](#msg5d76064b3b1e5e5df17b8e71)ctrl + v ?

[08:00](#msg5d76068fae44a84124a77911)拖拽就行了

Kiti-Nomad

[08:59](#msg5d76146954e7c649d4b33a3e)安卓啊

[12:48](#msg5d764a2dc38d634123c332e6)不过电脑里是对的，只用拖拽就可以了

## Thursday 19th September, 2019

NjinN

[03:08](#msg5d82f148901bb84d90327483) &gt;&gt; obj: object \[f: does \[print n]]  
\== make object! [  
f: func \[]\[print n]  
]  
&gt;&gt; obj: make obj \[n: 123]  
\== make object! [  
f: func \[]\[print n]  
n: 123  
]  
&gt;&gt; obj/f  
\*\** Script Error: n has no value  
\*\** Where: print  
\*\** Stack:

[03:10](#msg5d82f19bbe709e39d1522d33)@qtxie 晴天大佬，object里函数没有办法处理新增进来的属性，但是根语境下这样的操作确是可以的。

[03:11](#msg5d82f1e656677e767a1b39c0)看过解释说Red里`word!`一直是有绑定的值的，想问一下这个绑定的操作是在哪个阶段进行的

[03:14](#msg5d82f2a4a38dae3a6379f387)http://www.raccoode.fun/writ.reb?id=109

[03:15](#msg5d82f2ca04053c5b3d8151ad)我自己写了个简易的Rebol解释器，应该算是动态作用域的，性能不济，想了解下Red中`word!`的实现

qtxie

[09:46](#msg5d834e6ce45b6d47321b8d08)@NjinN  
&gt; &gt;&gt; obj: object \[f: does \[print n]]  
&gt; == make object! [  
&gt; f: func \[]\[print n]  
&gt; ]  
&gt; &gt;&gt; obj: make obj \[n: 123]  
&gt; == make object! [  
&gt; f: func \[]\[print n]  
&gt; n: 123  
&gt; ]  
&gt; &gt;&gt; obj/f  
&gt; \*\** Script Error: n has no value  
&gt; \*\** Where: print  
&gt; \*\** Stack:

Rebol2和Rebol3都不支持自动绑定到新的object。需要手动把函数rebind到新的object。

[09:47](#msg5d834e955ab93616941bca0e)不过Red里可以支持这个自动绑定。

NjinN

[10:16](#msg5d835593be709e39d1550dc7)这个就是Red里的运行结果啊

qtxie

[10:18](#msg5d8355f5e45b6d47321bc4ec) &gt; 这个就是Red里的运行结果啊

@NjinN 我的意思是Red以后可以支持这个。

[10:18](#msg5d835606ab4244767bc84f0f)目前是跟Rebol一样的。

NjinN

[10:19](#msg5d83562204053c5b3d84304d)那么这个word的绑定是什么时候确定的

[10:19](#msg5d83562e5d24375b3ee10d8b)生成object的时候就进行绑定了吗

[10:19](#msg5d8356485d24375b3ee10f4b)为什么主语境里就没有这个问题

qtxie

[10:27](#msg5d8358055ab93616941c1587)&gt; 生成object的时候就进行绑定了吗

是的。

[10:28](#msg5d8358311998d51695641c83)主语境只有一个，没法新建一个。

## Friday 20th September, 2019

Kiti-Nomad

[09:35](#msg5d849d59901bb84d903ee08a)你们有谁是红帽系的操作系统吗？gitter好像没有rpm包

## Tuesday 24th September, 2019

cwt8805

[09:22](#msg5d89e060ab4244767bf6d1d9)用view函数生成的窗口关闭后程序如何不退出并且生成一个系统托盘图标，点击托盘图标则恢复窗口。用R/S调win32可以实现系统托盘部分，然而窗口如何隐藏呢？

bitbegin

[09:29](#msg5d89e208a7a5cc473348911d)找找相关的api

cwt8805

[09:33](#msg5d89e2e55ab93616944a22f1)没找到，所以跑这儿来问问

bitbegin

[09:47](#msg5d89e61abe709e39d1837850)WS\_MINIMIZEBOX

or

WS\_OVERLAPPEDWINDOW as one style

[09:47](#msg5d89e620c7ec2e2208e1b179)https://social.msdn.microsoft.com/Forums/en-US/9de00eb9-50bc-435a-8f4b-0361cc75d4fb/minimize-to-system-tray-win32?forum=vcgeneral

cwt8805

[09:59](#msg5d89e8f742a6b9452045e434)你误会了，我还是想用VID生成窗口，纯R/S确实可以实现上面的需求，但是没多大意思，还不如直接用C呢

bitbegin

[11:08](#msg5d89f9128521b34d9181608b)现在不支持啊

qtxie

[15:53](#msg5d8a3c018521b34d9183476a)@cwt8805 可以用设置face/visible?

```
win: layout [button "hide window" [win/visible?: no]]
view/no-wait win
```

[15:54](#msg5d8a3c2aa38dae3a63adc4a8)把隐藏的窗口显示出来：

```
win/visible?: yes
```

[16:37](#msg5d8a466242a6b9452048bf3d)对于系统托盘的支持，我们可以在Red里实现一个函数，比如 `tray-it`.

```
view [button "最小化到系统托盘" [tray-it]]      ;-- 最小化当前窗口到托盘
```

还可以设置右键菜单

```
view [
    button "最小化到系统托盘" [
        tray-it/menu [      ;-- 设置右键菜单，可以在window face的on-menu里处理相应的事件
            "显示主窗口"     show-main-win
            "设置"          show-cfg-dlg
            "退出"          exit-win
        ]
    ]
]
```

[16:43](#msg5d8a479cb9f8210ed5e2f021)`Tray-it` 函数原型：

```
tray-it: function [
	/face window [face!]        ;-- minimize window to system tray
	/menu menus  [block!]       ;-- context menu when right click the tray icon
][
	...
]
```

[16:45](#msg5d8a48272438b53a640d3cf2)* 什么refinement都不用，默认最小化当前窗口到托盘。也可以用 /face refinement 指定 window face。

[16:46](#msg5d8a486abe709e39d1863a39)* 默认鼠标左键单击托盘图标，还原窗口。右键单击如果指定了menu，就显示menu。没有menu就什么也不显示。

[16:50](#msg5d8a4973c77f285fb1d6cb3c)上面的方法没法设置的地方包括：  
1\. 定制化左键单击  
2\. 定制托盘图标 （默认用程序的图标）

不过这两个需求不是那么的常用。@cwt8805 如果你有好的想法，欢迎分享！

## Wednesday 25th September, 2019

cwt8805

[05:05](#msg5d8af59ac77f285fb1db82e8)@qtxie 这个函数的设计不错。托盘部分我就是用R/S调用win32写的 https://github.com/cwt8805/RedScripts/blob/master/win32demo/tray.reds

[05:08](#msg5d8af6578521b34d918852c5)唯一的窗口如何在点击关闭按钮时隐藏而不退出程序呢，我现在是弄了两个窗口，其中一个窗口一直隐藏保持消息循坏，另一个窗口就可以监听on-close事件显示Tray

[05:13](#msg5d8af7712438b53a6411e9b2)像你上面这样单独设置一个按钮用于隐藏窗口，也可以解决问题。我就是想知道窗口的关闭按钮可以做到吗？

qtxie

[06:36](#msg5d8b0af728c1df0ed6909b1c)原来可以的，刚试了不行了。应该是有bug。

```
view [on-close ['done]]
```

[06:37](#msg5d8b0b1128c1df0ed6909c6a)返回 done, 就是取消关闭。

[14:42](#msg5d8b7ced5c966b58fb737e9e)@cwt8805 这样可以：

```
view [on-close ['continue]]
```

NjinN

[15:52](#msg5d8b8d29692d464f796af7f8)@qtxie 可不可以考虑把类型定义的方括号去掉，在语法层面上强制要求所有类型，包括自定义类型必须以`!`号结尾，这样parse阶段应该也不会有歧义

qtxie

[19:14](#msg5d8bbc955c966b58fb75896c)Red/Strict可以考虑这么搞，强制类型，必须编译。性能介于Red和R/S之间。这样Red Logo里的三层就齐了。

## Friday 27th September, 2019

cwt8805

[04:32](#msg5d8d90e4462ada512304f692)嗯，下载了最新的构建版，可以用了

NjinN

[11:00](#msg5d8debd5deb6da63d7b8a16b)@cwt8805 这是紧急修复的吧。。。

qtxie

[11:41](#msg5d8df55b290b8c354ae4da9a)也没人提bug，一直不知道有问题

## Thursday 24th October, 2019

la-len

[02:52](#msg5db111d19c398215097390a7)&lt;link href="https://fonts.gdgdocs.org/css?family=Lobster" rel="stylesheet" type="text/css"&gt;  
&lt;img class="class1 class2"&gt;  
&lt;style&gt;  
.red-text {  
color: red;  
}

h2 {  
font-family: Lobster, Monospace;  
}

p {  
font-size: 16px;  
font-family: Monospace;  
}

.smaller-image {  
width: 100px;  
}  
.image{}  
.thick-red-border {  
border-color: green;  
border-width: 10px;  
border-style: solid;  
}  
&lt;/style&gt;  
&lt;img class="smaller-image thick-red-border" src="/images/relaxing-cat.jpg"&gt;

[02:52](#msg5db111fa10bd4128a14ec1f5)我不知道错哪了，，，，求助

## Friday 25th October, 2019

NjinN

[01:33](#msg5db250ec9825bd6bacc326f2)@la-len 这是什么鬼，为什么会在这里问

la-len

[16:17](#msg5db320312f8a034357d7530a)，，那个课程里的，不好意思，，@NjinN 才开始玩

qtxie

[21:54](#msg5db36f03e469ef435865cb60)啥课程？

## Sunday 24th November, 2019

Kiti-Nomad

[04:18](#msg5dda04b19d72cd02b3343d48)你们Mac是怎么安装red的

bitbegin

[04:30](#msg5dda0776c4fca14de3dc6c28)chmod + x red 然后运行就行了吧

Kiti-Nomad

[04:33](#msg5dda082f89fce12f25b7363a)zsh: bad CPU type in executable: ./red-064

bitbegin

[04:37](#msg5dda091c1bf5192e6693f5e7)你的mac是最新的？

Kiti-Nomad

[04:38](#msg5dda092e1bf5192e6693f69f)16年的老款

bitbegin

[04:38](#msg5dda09479d72cd02b3345a76)mac系统没有升级到最新的把

[04:42](#msg5dda0a53b010e622765cb5b7)现在red不支持最新的os

Kiti-Nomad

[04:45](#msg5dda0afb89fce12f25b749c5)10.15.1

[04:47](#msg5dda0b6ec52bc74c967ef620)那行吧

## Wednesday 18th December, 2019

markhu53

[07:25](#msg5df9d47f84c2167709212008)red是编译运行的吧，带gc吗

[07:31](#msg5df9d5b58dfce538b5c8177a)文档语焉不详，和其他语言的文化氛围差别很大，号称next-generation感觉像是老古董，有forth的既视感

## Thursday 19th December, 2019

haolloyin

[03:56](#msg5dfaf4d444e1fb33f6ef1562)&gt; 文档语焉不详，和其他语言的文化氛围差别很大，号称next-generation感觉像是老古董，有forth的既视感

@markhu53 好像没有「语焉不详」，https://www.red-lang.org/p/getting-started.html  
文档两个例子说得很清楚了，有文字有代码。

解释执行：`Red comes with a interpreter in addition to the compiler, which can be easily accessed using the built-in REPL.`

编译成二进制：`You can also compile your Red programs and get a single binary with no dependencies.`
