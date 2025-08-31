
#3178: `base` doesn't detect some events
================================================================================
Issue is closed, was reported by nedzadarek and has 2 comment(s).
[status.resolved] [type.review] [GUI]
<https://github.com/red/red/issues/3178>

`Base` doesn't detect some events:
`view [base red on-wheel [print event/type]]`
Here is a list of event's that is not working:

1. wheel
2. zoom 
3. pan
4. rotate
5. two‑tap
6. press‑tap
7. key‑down
8. key
9. key‑up
10. enter

I am using Red 0.6.3 22 November 2017/17:20:39+01:00 on Win 8.1.




Comments:
--------------------------------------------------------------------------------

On 2018-01-03T01:51:41Z, qtxie, commented:
<https://github.com/red/red/issues/3178#issuecomment-354922120>

    @nedzadarek `set-focus` to the `base` will make it work.
    ```
    view [b: base red on-wheel [print event/type] do [set-focus b]]
    ```
      

