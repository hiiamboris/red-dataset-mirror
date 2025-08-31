
#1628: 'Text facet in 'Area face has strange character when IME is used. 
================================================================================
Issue is closed, was reported by JenniferLee520 and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1628>

People in East Asia, including China, Japan, and Korea, use IME to input local characters. IME stands for Input Method Editor. 

In my 'On-Change actor body, I simply prints face/TEXT to the console. When I type in Chinese characters in IME and the 'Area is empty, a strange character is printed in the console. For example, I type in "中文输入" in 'Area, the on-change is called 4 times, and printed messages are "-",  "中文", "中文输", "中文输入". the first printed message should be "中" instead of "-". 

It's not always "-", it could be "7", "8", "(" or any character in Latin-1 Table. It depends on the first Chinese character.



Comments:
--------------------------------------------------------------------------------

On 2016-02-16T11:36:18Z, JenniferLee520, commented:
<https://github.com/red/red/issues/1628#issuecomment-184644996>

    I am using Windows 10.

