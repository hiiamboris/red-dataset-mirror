# Archived messages from: [gitter.im/red/red/Chinese](/gitter.im/red/red/Chinese/) from year: 2015

## Friday 18th December, 2015

qtxie

[07:19](#msg5673b366f5ebee8b39355c66)大家好！

JerryTsai

[07:22](#msg5673b427f99ceb846ae68c1a)有中文的讨论区还是比较好，有助于推广。

## Tuesday 22nd December, 2015

mogucpp

[02:58](#msg5678bc635155bfb75b17abfb)hello

qtxie

[07:37](#msg5678fdb612cc13392f97e295)@mogucpp 欢迎~

## Thursday 24th December, 2015

bitbegin

[03:11](#msg567b627e3c6894026924a3e4)有两个问题请教下：1. vid 如果最大化窗口，我想到的就是view/options \[size: max-size], 但这个max-size从哪里获取？

[03:12](#msg567b629d0171d1791d01fd70)2. 现在有没有托盘的控件？

qtxie

[06:50](#msg567b95b966a282570f903b85)@bitbegin 你想要获取的max-size应该就是screen size屏幕大小吧，可以通过system/view/screens/1/size 来取得，不过现在只有打开窗口后，system/view/screens/1/size里面才有内容。

[06:51](#msg567b95e9ff981dbc7633f532)现在也还没有托盘的控件

bitbegin

[07:06](#msg567b99853acb611716ffa38e)我想在程序一打开就最大化，而不是设置固定的大小。

[07:08](#msg567b9a020171d1791d0200c9)另外碰到一个问题，使用console.ext example.red, 在一个窗口1中打开另外一个窗口2，关闭窗口2再关闭窗口1，console没有退出

dockimbel

[07:12](#msg567b9af635e1a316162e1343)http://szb.mnw.cn/html/2015-12/24/content\_4385608.htm :D

qtxie

[08:14](#msg567ba96766a282570f903be4)@bitbegin 一打开就最大化的功能应该马上回加上

[08:15](#msg567ba9ae4d3dc5f707aeb81e)console没有退出的问题可能是个bug，重现这个问题的代码能贴一下吗？

bitbegin

[09:56](#msg567bc1553acb611716ffa67d)我晚上下最新的master试试

[13:11](#msg567beef23c6894026924ae9b)

```
red
Red [title: "test" needs: 'view]
win: layout [area 400x400]
win/menu: [
    "subwin" subwin
]
win/actors: make object! [
    on-menu: func [face [object!] event [event!]][
        if event/picked = 'subwin [
            view subwin
        ]
    ]
]

subwin: layout [area 100x100]

view win
```

[13:12](#msg567bef583acb611716ffaa75)通过菜单打开subwin，然后关闭subwin，再关闭win，console.exe无法退出，需要ctrl+c才能退出

[13:26](#msg567bf28a4f069158055bb8f9) 编译成test.red, 也会存在这个问题

## Monday 28th December, 2015

qtxie

[09:51](#msg5681062b2a06b81d5bf85357)@bitbegin 在on-menu事件里面，使用`view/no-wait subwin`来打开子窗口，直接使用`view`会进入一个新的消息循环，关掉两个窗口后还有一个消息循环在运行，这就导致console没法退出。

## Tuesday 29th December, 2015

liuhuancom

[12:31](#msg56827d1135e1a316162e88f8)red大家都在这里吗？

## Wednesday 30th December, 2015

qtxie

[08:07](#msg568390c32a06b81d5bf859c3)@liuhuancom 哈哈，你好！

dockimbel

[08:13](#msg568392140171d1791d02a567)http://fjrb.fjsen.com/fjrb/html/2015-12/29/content\_888494.htm?div=-1 :smile:

bitbegin

[08:29](#msg568395f10171d1791d02a5b5)@qtxie 啥时候release 6.0？

[08:36](#msg568397aa0199d70069e033a8)有个问题我在 view subwin前面设置subwin/subwin-area/text，提示 cannot access

## Thursday 31st December, 2015

qwycn

[02:20](#msg568490ea35e1a316162ec613)有中文讨论组真好!英文看得脑仁疼。

liuhuancom

[05:49](#msg5684c1ef4f069158055c7467)大家好

dockimbel

[05:53](#msg5684c2d70171d1791d02ca7e)@liuhuancom 你好

[05:55](#msg5684c3370199d70069e05703)@bitbegin 应该是在几天.

bitbegin

[05:56](#msg5684c387653b30761d76bc9a)@dockimbel 你看懂中文了？

dockimbel

[06:04](#msg5684c5549606b15a055e438c)@bitbegin 一点点，GoogleTranslate是我的朋友:-)

qtxie

[06:29](#msg5684cb2d66a282570f904e9d)&gt; 有个问题我在 view subwin前面设置subwin/subwin-area/text，提示 cannot access  
`subwin-area`是什么控件？

bitbegin

[06:32](#msg5684cc1b35e1a316162ecb0c)subwin: layout \[subwin-area: area 100x100]

[06:34](#msg5684cc7b35e1a316162ecb17)@dockimbel GoogleTranslate: You read Chinese it? fanyi.baidu.com: Do you understand Chinese?

qtxie

[06:36](#msg5684ccffff981dbc76340817)直接用`subwin-area/text`就可以了。

dockimbel

[06:39](#msg5684cdae0171d1791d02cb5c)@bitbegin 对，GoogleTranslate不好，Bing或者Baidu更好。
