
#5172: Unicode Specials considered invalid
================================================================================
Issue is closed, was reported by gurzgri and has 4 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/5172>

**Describe the bug**
The [Unicode Specials](https://en.wikipedia.org/wiki/Specials_(Unicode_block)) are considered invalid Unicode.

**To reproduce**
```Red
>> foreach char [#{fff9} #{fffa} #{fffb} #{fffc} #{fffd}] [probe copy/part form try [to string! char] 52]
{*** Access Error: invalid UTF-8 encoding: #^{FFF90000}
{*** Access Error: invalid UTF-8 encoding: #^{FFFA0000}
{*** Access Error: invalid UTF-8 encoding: #^{FFFB0000}
{*** Access Error: invalid UTF-8 encoding: #^{FFFC0000}
{*** Access Error: invalid UTF-8 encoding: #^{FFFD0000}
```

**Expected behavior**
They should be valid in a unicode string. 

**Platform version**
Red 0.6.4 for Windows built 6-Aug-2022/16:04:37



Comments:
--------------------------------------------------------------------------------

On 2022-08-06T20:50:34Z, dockimbel, commented:
<https://github.com/red/red/issues/5172#issuecomment-1207280899>

    > They should be valid in a unicode string.
    
    You didn't use "unicode strings" but `binary!` series.
    ```
    >> binary? #{fff9}
    == true
    >> char? #{fff9}
    == false
    ```
    
    `to-string` on a binary series assumes a UTF-8 encoding by default that you didn't not provide, therefore the errors there are legitimate. What you were looking for is:
    ```
    >> s: "^(fff9)^(fffa)^(fffb)^(fffc)^(fffd)"
    == "￹￺￻￼�"
    >> to-hex to-integer s/1
    == #0000FFF9
    >> b: to-binary s
    == #{EFBFB9EFBFBAEFBFBBEFBFBCEFBFBD}
    >> to-string #{EFBFB9EFBFBAEFBFBBEFBFBCEFBFBD}         ;-- properly UTF-8 encoded binary suitable for `to-string`.
    == "￹￺￻￼�"
    ```
    

--------------------------------------------------------------------------------

On 2022-08-06T21:46:04Z, gurzgri, commented:
<https://github.com/red/red/issues/5172#issuecomment-1207287249>

    Sorry, my bad, noticed that by myself too after looking into https://github.com/red/red/blob/master/runtime/unicode.reds

