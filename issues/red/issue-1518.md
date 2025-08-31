
#1518: when closed "subwin" and "win", the console can't exit
================================================================================
Issue is closed, was reported by bitbegin and has 4 comment(s).
<https://github.com/red/red/issues/1518>

I wrote a `test.red` to test `VID` menu function, like this:

``` red
Red [title: "test" needs: 'view]
win: layout [area 400x400]
win/menu: [
    "subwin" subwin
]
win/actors: make object! [
    on-menu: func [face [object!] event [event!]][
        if event/picked = 'subwin [
            view subwin
        ]
    ]
]

subwin: layout [area 100x100]

view win
```

I use `console.exe test.red` command to open the window, and click the subwin, then close subwin and win, but the console.exe cannot exit unless i press ctrl+c.



Comments:
--------------------------------------------------------------------------------

On 2015-12-28T09:53:51Z, qtxie, commented:
<https://github.com/red/red/issues/1518#issuecomment-167531154>

    It is caused by `view subwin` create another message loop. 
    Using `view/no-wait subwin` will solve this issue.

--------------------------------------------------------------------------------

On 2015-12-29T09:10:21Z, bitbegin, commented:
<https://github.com/red/red/issues/1518#issuecomment-167753604>

    seems it not be a issue. closed!

