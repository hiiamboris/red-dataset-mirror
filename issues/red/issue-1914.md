
#1914: Tab-completion should complete to longest common string in console when more than one option
================================================================================
Issue is closed, was reported by mydoghasworms and has 2 comment(s).
[status.built] [type.task.wish]
<https://github.com/red/red/issues/1914>

When using tab-completion in the console, it shows possible completions, but does not append the common characters to what is entered.

For example, open the console, type `req` and press Tab.

The console shows `request-file` and `request-dir` as possible completions, but should also extend the typed characters to `request-`, similar to how completion works in shells like Bash.

![image](https://cloud.githubusercontent.com/assets/514461/15347748/c52a1b04-1cc4-11e6-9af5-4cc9a9f810b6.png)



Comments:
--------------------------------------------------------------------------------

On 2018-08-08T10:02:42Z, qtxie, commented:
<https://github.com/red/red/issues/1914#issuecomment-411354364>

    This feature is missing in the new GUI console.

