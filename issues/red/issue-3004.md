
#3004: WISH: /SKIP refinement for REVERSE
================================================================================
Issue is closed, was reported by 9214 and has 10 comment(s).
[status.built] [status.tested] [test.written] [type.task.wish]
<https://github.com/red/red/issues/3004>

I wish `reverse` could treat series as a bunch of fixed-size records:
```Red
>> reverse/skip [a 1 b 2] 2
== [b 2 a 1]
```
perhaps `/by` is a better name?


Comments:
--------------------------------------------------------------------------------

On 2017-08-30T17:30:05Z, meijeru, commented:
<https://github.com/red/red/issues/3004#issuecomment-326062684>

    `/skip`  is appropriate: it tells what it does, in the same way as `sort` and all the others that have such a refinement 

--------------------------------------------------------------------------------

On 2017-08-30T17:50:08Z, greggirwin, commented:
<https://github.com/red/red/issues/3004#issuecomment-326068104>

    @toomasv posted a mezz version in gitter chat I think. Though having it as standard would be better. I don't have one in my old toolbox, but think I needed this a couple times through the years. 

--------------------------------------------------------------------------------

On 2017-09-12T14:40:41Z, dockimbel, commented:
<https://github.com/red/red/issues/3004#issuecomment-328874020>

    Agreed. We should also add the missing `/part` option, which is present in Rebol.

--------------------------------------------------------------------------------

On 2017-09-12T15:12:14Z, toomasv, commented:
<https://github.com/red/red/issues/3004#issuecomment-328883606>

    Here is my version:
    ```
    reverse: func [
        series /skip size /part length /local i tuple
    ][
    	switch type?/word series [
    		pair! [return to-pair reduce [series/2 series/1]]
    		tuple! [tuple: clear [] repeat i length? series [append tuple pick series i] series: copy tuple tuple: yes]
    	]
        size: any [size 1]
        either 0 = ((length? series) % size) [
            length: any [length length? series]
            i: 1
            loop (length / size - 1) [
                i: i + size
                series: at head series i
                insert head series take/part series size
            ] 
            series: head series
        ][cause-error 'user 'message ["Wrong length of series or skip!"]]
    	either tuple [to-tuple series][series]
    ]
    ```

--------------------------------------------------------------------------------

On 2020-08-06T15:50:25Z, 9214, commented:
<https://github.com/red/red/issues/3004#issuecomment-670012945>

    I took the role of self-serving wish fairy and granted myself what I asked for 3 years ago 🧚‍♂️ Hope that's OK.

