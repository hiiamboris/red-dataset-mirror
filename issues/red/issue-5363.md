
#5363: "invalid function definition" on `return:` docstring
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5363>

**Describe the bug**

Try this in GUI console:
```
>> func spec-of :do-events body-of :do-events
*** Script Error: invalid function definition: [{Launch the event loop, blocks until all windows are closed} /no-wait "Process 
*** Where: func
*** Near : func spec-of :do-events body-of :do-events
*** Stack:  
```
In CLI console it works because there are no docstrings :)

**To reproduce**

`func [return: [default!] "ret desc" /local x] []`

**Platform version**
```
Red 0.6.4 for Windows built 7-Aug-2023/15:57:07+03:00  commit #548ad3c
```


Comments:
--------------------------------------------------------------------------------

On 2023-08-07T22:07:41Z, greggirwin, commented:
<https://github.com/red/red/issues/5363#issuecomment-1668639438>

    `help` had to be updated for that some time back as well.

