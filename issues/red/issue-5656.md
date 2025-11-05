# Issue #5656: CLI console doesn't handle #"^/" correctly in ask
<https://github.com/red/red/issues/5656>

The console outputs duplicate text when typing.

<img width="1197" height="950" alt="Image" src="https://github.com/user-attachments/assets/5c564803-5425-4280-8b68-44cb167b5fc6" />

**Describe the bug**
Run the following code in the CLI console
```
greeting: either now/time < 12:00["Good Morning"]["Good Afternoon"] name: ask {what's your name? ^/} print [name greeting]
```

**Platform version**
Linux, [red-30sep25-c0a87fbe6](https://static.red-lang.org/dl/auto/linux/red-30sep25-c0a87fbe6)




## qtxie on 2025-10-11T02:21:35Z
Significant work needs to be done to fix it, as the CLI console cannot handle multiline string properly.


## dockimbel on 2025-10-11T07:31:06Z
> the CLI console cannot handle multiline string properly.

What is the problem precisely?


## qtxie on 2025-10-11T12:44:59Z
`line` is assumed to be a single line string in function [refresh](https://github.com/red/red/blob/c0a87fbe6b9813bdeb4cdea2e41512bb718fafa4/environment/console/CLI/input.red#L336). 


