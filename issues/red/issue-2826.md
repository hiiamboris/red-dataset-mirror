
#2826: Wish: Treat some full-width characters as their half-width character while not inside a string. 
================================================================================
Issue is closed, was reported by JenniferLee520 and has 4 comment(s).
[status.resolved] [type.task.wish]
<https://github.com/red/red/issues/2826>

While people in the Eastern world type, they use IMEs ( input method editors ). That's how they type in Chinese and Japanese characters. While they are switching and typing between IME ( for Chinese typing) and non-IME (for English typing), sometime they will accidentally input Full-Width characters instead of half-width characters, such as, #"："  (Unicode 0xFF1A) instead of #":" (Unicode 0x3A), and #"　" (Unicode 0x3000) instead of #" "(Unicode 0x20)。

I've been teaching Red Programming in China for a while, and I found this situation happened a lot in newbie programmers. This type of bugs cannot be found by simply reading the source code. 

For example. In the following code, the space between `A` and `B` is  Unicode 0x3000, so the length of the block is 1. 

```Red
>> length? [A　B]
== 1
```
I would like Red to treat these full-width characters as their half-width character while not inside a string. 

I would also like Red to treat `“` (Unicode 0x201C) and `”` (Unicode 0x201D) as normal delimiters for string.


Comments:
--------------------------------------------------------------------------------

On 2017-06-25T11:28:55Z, dockimbel, commented:
<https://github.com/red/red/issues/2826#issuecomment-310897347>

    Such change is too costly to integrate inside the lexer rules, because those codepoints are too high, inducing a high memory usage for the corresponding bitsets.
    
    You can obtain the same effect using a simple preload rule:
    ```
    system/lexer/pre-load: function [src part][
        parse src [
            any [
                p: #"^(FF1A)" change p #":"
                |  #"^(3000)" change p #" "
                |  #"^(201C)" change p #"^""
                |  #"^(201D)" change p #"^""
                | skip
            ]
        ]
    ]
    ```

--------------------------------------------------------------------------------

On 2017-06-25T11:40:10Z, JenniferLee520, commented:
<https://github.com/red/red/issues/2826#issuecomment-310897816>

    This solution works. I also change ":" to ": " (one space appended). 
    ```Red
    >> system/lexer/pre-load: function [src part][
        parse src [
            any [
                p: #"^(FF1A)" change p ": "
                |  #"^(3000)" change p #" "
                |  #"^(201C)" change p #"^""
                |  #"^(201D)" change p #"^""
                | skip
            ]
        ]
    ]
    >> My-Name：“Jennifer　Lee”
    == "Jennifer Lee"
    >> My-name
    == "Jennifer Lee"
    ```

