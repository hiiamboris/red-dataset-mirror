
#4530: Wrongly encode some unicode codepoints
================================================================================
Issue is closed, was reported by qtxie and has 2 comment(s).
[type.bug]
<https://github.com/red/red/issues/4530>

**To reproduce**
Try the code below in the gui-console.
```
>> "😀"
== "ð^(9F)^(98)^(80)"
>> length? "😀"
== 4
```
**Expected behavior**
```
>> "😀"
== "😀"
>> length? "😀"
== 1
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 19-Jun-2020/1:15:57
```



Comments:
--------------------------------------------------------------------------------

On 2020-06-19T01:31:22Z, qtxie, commented:
<https://github.com/red/red/issues/4530#issuecomment-646385968>

    Works fine before new lexer merged into master. Looks like a bug of the UTF-8 decoder in the new lexer.

