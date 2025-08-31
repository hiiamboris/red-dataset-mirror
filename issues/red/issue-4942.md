
#4942: Wrong console prompt position after a LIST-DIR call
================================================================================
Issue is closed, was reported by dockimbel and has 4 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/4942>

From the GUI console (not tested from CLI), calling `ls` or `list-dir` results in wrong prompt position:

![image](https://user-images.githubusercontent.com/411393/128020383-20b5faf2-6a0b-49f1-8307-c4e72c3af58e.png)




Comments:
--------------------------------------------------------------------------------

On 2021-08-03T13:26:27Z, dockimbel, commented:
<https://github.com/red/red/issues/4942#issuecomment-891845640>

    I've tried several simple fixes, but they destroy the columns alignment...

--------------------------------------------------------------------------------

On 2021-08-04T02:26:41Z, qtxie, commented:
<https://github.com/red/red/issues/4942#issuecomment-892310019>

    It is due to a `prin` issue (#2679) was fixed. LIST-DIR has a workaround for this issue.

