# Archived messages from: [gitter.im/red/red/Chinese](/gitter.im/red/red/Chinese/) from year: 2021

## Saturday 10th April, 2021

lylgithub2021

[06:58](#msg60714c822e5574669b298cdc)程序中想设置快捷键“ctrl a”，即按下ctrl a后会激发一些动作，在red里如何实现？（PS：以及“ctrl shift a”、“alt a”。谢谢。

## Monday 12nd April, 2021

qtxie

[07:55](#msg6073fd03d79539186151c61a)@lylgithub2021 通过 `event/flags` 来判断，`view [on-key-down [probe event/flags]]`.

lylgithub2021

[08:00](#msg6073fe271f84d71853b09360)@qtxie 运行了上述代码，还是没看出具体如何使用event/flags实现快捷键，能帮忙再给出一些具体的指导吗？谢谢。

qtxie

[08:03](#msg6073fedf06e2e024e84a651a)做一些判断就行，我给个例子

[08:08](#msg6073fff6d79539186151ce32)@lylgithub2021

```
view [
	on-key-down [
		if find event/flags 'control [
			switch event/key [
				#"A" [
					either event/shift? [
						probe "Ctrl + Shift + A"
					][
						probe "Ctrl + A"
					]
				]
				#"C" [probe "do something C"]
			]
		]
	]
]
```

[08:10](#msg60740066969f8b38ee729882)一些常用的功能键比如 control， shift，可以直接用 event/ctrl? , event/shift? 来判断

[08:11](#msg607400aaae90f36840768a30)其他的如 alt，就得用 `event/flags` 了

lylgithub2021

[08:13](#msg607401261f84d71853b09b1d)alt很特殊？ 另外，我曾经试过on-key \[if all \[event/key = #"A" event/ctrl?]...]却失败了，不知为什么？

qtxie

[08:13](#msg6074013997cf50674658c292)还有一点要注意的，就是只有获取了焦点（focus）的空间才能接受键盘事件，比如：

```
view [b: base 200x200 on-key-down [probe event/key] on-down [set-focus face]]
```

[08:14](#msg60740164d79539186151d16e)鼠标点击，触发set-focus之后，base获得了焦点，按键盘才有反应。

[08:15](#msg607401bb2e5574669b2f9046)@lylgithub2021 alt不特殊，只是用它来举例子，其实除了ctrl和shift，其他的功能键都只能用event/flags

[08:17](#msg60740211969f8b38ee729d21)&gt; alt很特殊？ 另外，我曾经试过on-key \[if all \[event/key = #"A" event/ctrl?]...]却失败了，不知为什么？

你的控件是否获得焦点？

lylgithub2021

[08:18](#msg6074026dd79539186151d555)试之前，我先用鼠标点击了窗口

qtxie

[08:19](#msg6074027d55d78266a63cb965)还有 on-key 里面是区分大小写的，如果 Caps键没有按，event/key是小写a

[08:21](#msg6074030606e2e024e84a6f76)on-key里面的 event/key 是经过处理的，适合用来获取用户输入的文本，比如中文输入法的输入。on-key-down/up是原始的键盘消息，适合用来做组合键的判断，比如游戏里面。

lylgithub2021

[08:23](#msg6074038081866c680c1a9573)这是完整的代码，`view [on-key-down [if all [event/ctrl? event/shift? event/key = #"A"] print "yes"]]`,想要设置“ctrl shift a”快捷键，哪儿出错了呢？

qtxie

[08:24](#msg607403bf06e2e024e84a70ea)语法错误

[08:24](#msg607403d41f84d71853b0a173)if xxx \[...]

[08:25](#msg607403f1a9dd556843d246d4)你 if 语句 少了方括号

lylgithub2021

[08:27](#msg6074046edc24646812b71954)低级错误，sorry， sorry。非常非常感谢您的帮助！！！解决了困扰我很久的一个大问题。另外，我才来这里，还不太熟悉用法，上面代码黑色背景是如何实现的？

qtxie

[08:31](#msg60740571a9dd556843d24ab0)\[!\[image.png](https://files.gitter.im/5673b28a16b6c7089cbf2657/SP8F/thumb/image.png)](https://files.gitter.im/5673b28a16b6c7089cbf2657/SP8F/image.png)

[08:31](#msg6074057f46a93d4a19bf2af6)但这里可以看到

[08:32](#msg607405ad46a93d4a19bf2bb2)markdown语法，你知道markdown吧？

lylgithub2021

[08:36](#msg6074068555d78266a63cc421)

```
以前没用过markdown。
```

[08:37](#msg607406c7d79539186151e03d)前后三个反引号，从我的界面看 依然不是黑色背景

[08:39](#msg60740750b9e6de24d62d5bda)明白了，再次感谢！！

## Sunday 18th April, 2021

konglinglong

[13:59](#msg607c3b2ab9e6de24d64217e2)用read可以读取GBK编码格式文件吗？我尝试的时候出现下面这个错误。有什么方法可以解决吗？

[13:59](#msg607c3b2d97cf5067466d7362)&gt;&gt; read %decode\_result.txt  
\*\** Access Error: invalid UTF-8 encoding: #{D6D0B9FA}  
\*\** Where: read  
\*\** Stack:

&gt;&gt; read/as %decode\_result.txt 'GBK  
\*\** Internal Error: reserved for future use (or not yet implemented)  
\*\** Where: read  
\*\** Stack:

[14:11](#msg607c3e2046a93d4a19d3e1c2)dfd

qtxie

[23:24](#msg607cbfba2e5574669b458a04)目前没有内置的GBK解码器，只能read/binary，然后自己解码。

## Tuesday 20th April, 2021

konglinglong

[08:29](#msg607e9101ae90f3684090fd8d)我想参与开发，有没有什么比较好的入门方法？

## Wednesday 21st April, 2021

qtxie

[01:48](#msg607f84611f84d71853cd85df)开发GBK解码器吗？需要先学习red/system

[01:50](#msg607f84fca9dd556843ef1ee2)https://static.red-lang.org/red-system-specs.html

## Monday 26th April, 2021

lylgithub2021

[01:41](#msg60861a6146a93d4a19eb984b)在VID的field控件里，如何实现只响应和显示数字（0123456789）的按键，而不显示和响应其它按键输入？例如：输入9,ok，继续输入8，也ok，再继续输入a则在field里不予显示和响应，再继续输入7也ok（此时field里显示的是987）。

## Thursday 29th April, 2021

qtxie

[00:19](#msg6089fbade2b4072e55fa04ea)目前我没想到简单的方法，你可以到red/help或者red/gui-branch频道问问

lylgithub2021

[15:26](#msg608ad02ac29ca4049ce0d3ef)OK

## Sunday 31st October, 2021

nnhq

[13:45](#msg617e9ddffb8ca0572bf4be42)·大佬们·好

[13:45](#msg617e9e0d29ddcd02935577e6)https://www.dobeash.com/files/munge3-test.zip

[13:46](#msg617e9e4cd3ae402e477f3f76)我尝试用red运行这个失败，不知道哪里的问题。red已经是最新版本了还是一样

[13:47](#msg617e9e6238377967f48531a3)&gt;&gt; do %munge3.r  
compress already defined!  
\== make object! [  
settings: make object! [  
build: 'red  
...  
&gt;&gt; do %test.r  
compress already defined!  
decimal! already defined!  
deline already defined!  
invalid-utf? already defined!  
join already defined!  
reform already defined!  
to-rebol-file already defined!  
helloworld

append-column \*\** Script Error: append-column has no value  
\*\** Where: do  
\*\** Stack: do-file

&gt;&gt;

[13:49](#msg617e9ed73f09d85736470a14)想用munge3读xlsx文件，没成功，求大佬们指点指点

[13:52](#msg617e9f8ef2cedf67f9b9839d)http://www.dobeash.com/files/munge3.html

## Monday 1st November, 2021

qtxie

[01:46](#msg617f46e08c019f0d0b6b1e99)munge3-test.zip 太旧了。munge3.r 里面已经移除了 append-column。

nnhq

[12:28](#msg617fdd548c019f0d0b6caa8a)@qtxie 好的，谢谢qtxie大佬。
