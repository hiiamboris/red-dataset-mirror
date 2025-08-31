
#45: WISH: realtime updates to text-list
================================================================================
Issue is open, was reported by hiiamboris and has 20 comment(s).
<https://github.com/red/REP/issues/45>

A simple example:
```
d: collect [repeat i 999 [keep form i]]
view [
   t: text-list data d
   f: field react later [f/text: pick t/data t/selected]
   on-change [
      probe 0 - now/time/precise + (
         t/state/2: 1 << (-1 + index? in t 'data)
         show t
         (now/time/precise)
      )
   ]
]
```
Try selecting one of the lines and then changing the field text:
```
0:00:00.203
0:00:00.208
0:00:00.208
0:00:00.206
...
```
With 9999 items:
```
0:00:02.018
0:00:02.005
0:00:02
0:00:02.005
```
This makes text-list useless in practice unfortunately as the experience of working with it becomes horrible.


Comments:
--------------------------------------------------------------------------------

On 2019-03-11T22:15:51Z, endo64, commented:
<https://github.com/red/REP/issues/45#issuecomment-471761069>

    What does `t/state/2: 1 << (-1 + index? in t 'data)` do? When I comment it, works much faster.

--------------------------------------------------------------------------------

On 2019-03-11T22:22:24Z, hiiamboris, commented:
<https://github.com/red/REP/issues/45#issuecomment-471763118>

    It tells `show` that data facet was changed. Alternative is `t/data: t/data`. Without it the change is not reflected on the list.

--------------------------------------------------------------------------------

On 2019-03-11T22:47:04Z, greggirwin, commented:
<https://github.com/red/REP/issues/45#issuecomment-471770390>

    To say it's useless is far too strong. The basic text-list widget was never intended to manage large lists of data, much less update it in real time. It becomes less useful the more data you have, yes, but what is the actual use case where you hit this? And do we know if this is an issue on the Red side, or the OS+widget side?

--------------------------------------------------------------------------------

On 2019-03-11T23:05:42Z, hiiamboris, commented:
<https://github.com/red/REP/issues/45#issuecomment-471775464>

    > what is the actual use case
    
    And what is the use case of a list with 10 items? ☺
    *Every* time I'm honestly trying to use a text-list, it fails me on quite a lot of features. And this one is the most annoying. My current use case involves editing items in a list of ~400 items (and growing) and it's already absolutely intolerable, so I'm working to replace it with rich-text ;) Previously I replaced it with a base in the code explorer because I deemed it unfit from the very start.
    
    > do we know if this is an issue on the Red side, or the OS+widget side?
    
    Beats me, but I wondered about that too. Didn't have the time to look for the answer yet, but my bet is on Red issue.

--------------------------------------------------------------------------------

On 2019-03-11T23:47:00Z, greggirwin, commented:
<https://github.com/red/REP/issues/45#issuecomment-471786093>

    Let's hope someone reports the performance on MacOS as well, for comparison.

--------------------------------------------------------------------------------

On 2019-03-12T00:05:32Z, greggirwin, commented:
<https://github.com/red/REP/issues/45#issuecomment-471790430>

    At a glance, it looks like the text list is entirely cleared and reloaded when the data facet is changed. Makes sense, because otherwise it would have to track individual changes. Are you always forcing a `data` update in your use cases? If so, can you just change the data in specific ways? e.g. 
    
    ```
    d: collect [repeat i 999 [keep form i]]
    view [
       t: text-list data d
    
       f: field react later [f/text: pick t/data t/selected]
       on-change [
          poke t/data n: random 999 rejoin [n #" " random "abcdef"]
          probe 0 - now/time/precise + (
             (now/time/precise)
          )
       ]
    ]
    ```

--------------------------------------------------------------------------------

On 2019-03-12T00:09:46Z, greggirwin, commented:
<https://github.com/red/REP/issues/45#issuecomment-471791305>

    Looks like it does the same thing on MacOS, via different APIs of course.

--------------------------------------------------------------------------------

On 2019-03-12T09:08:06Z, hiiamboris, commented:
<https://github.com/red/REP/issues/45#issuecomment-471915348>

    The goal is to see the updated data in the list. The only way I found to do that is refresh the data facet.
    It looks as though it redraws the list after every line added, maybe it's the key. I believe GDI was there in Windows 3.1 which ran fine on 6MHz CPUs, it just can't be slow in modern era ;)

--------------------------------------------------------------------------------

On 2019-03-12T18:21:29Z, greggirwin, commented:
<https://github.com/red/REP/issues/45#issuecomment-472123487>

    If you modify `data` via actions like `poke` or `put` (+ `remove take insert reverse`), you should see the list update.
    ```
    d: collect [repeat i 999 [keep form i]]
    view [
       t: text-list data d
       on-change [
          poke t/data t/selected rejoin [t/selected  #" " random "abcdef"]
          probe 0 - now/time/precise + (
             (now/time/precise)
          )
       ]
    
       f: field react later [f/text: pick t/data t/selected]
    ]
    ```
    I agree, wholeheartedly, that everything should be as fast as we want it to be, choosing to be slow only when it helps the user. But we also have to keep in mind that a lot of optimization was done, which we never knew about, just to make things work sometimes. In the early days of VB, people wanted to create spreadsheets, so they put hundreds of text boxes on a form, then wondered why it had problems. I mean, Excel did just fine with many more cells.

--------------------------------------------------------------------------------

On 2019-03-12T18:40:36Z, hiiamboris, commented:
<https://github.com/red/REP/issues/45#issuecomment-472130943>

    @greggirwin thanks, this workaround didn't occur to me ☻

