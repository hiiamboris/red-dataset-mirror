
#2666: Feature Request: In Console, allow editing last expression in history, not just last line
================================================================================
Issue is open, was reported by mydoghasworms and has 4 comment(s).
[type.wish]
<https://github.com/red/red/issues/2666>

Sometimes, when you enter a long, multi-line expression in the console, it is helpful to go back in history and edit the entire expression, but the console only allows you to edit the last line.

So what you want to be able to do is, in the history (with the up key) edit the last expression by positioning the cursor anywhere inside, editing it and then evaluating it.

I have seen this feature somewhere before (maybe CLISP or DrRacket) but I can't remember where.

![image](https://cloud.githubusercontent.com/assets/514461/25797395/56b67f9c-33dd-11e7-970b-9c5c8bc95ea5.png)



Comments:
--------------------------------------------------------------------------------

On 2020-03-21T19:31:59Z, 9214, commented:
<https://github.com/red/red/issues/2666#issuecomment-602092202>

    Perhaps this can be better served by an integrated editor or console plugin. I do agree that current behavior (inherited from Rebol) isn't very useful.

--------------------------------------------------------------------------------

On 2020-03-22T03:06:02Z, greggirwin, commented:
<https://github.com/red/red/issues/2666#issuecomment-602140858>

    @qtxie would have to say how hard this might be, and together we all decide where the line is between a REPL and and IDE.

