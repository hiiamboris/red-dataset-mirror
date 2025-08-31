
#1620: Cannot set SELECTED for TEXT-LIST before it’s shown
================================================================================
Issue is closed, was reported by rebolek and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1620>

I’d like to be able to select item in TEXT-LIST before it’s shown for the first time. Example code:

```
Red [
    Needs: 'View
]

l: layout [
    t: text-list data ["one" "two" "three"]
]
t/selected: 2

view l
```



Comments:
--------------------------------------------------------------------------------

On 2016-02-15T15:38:00Z, dockimbel, commented:
<https://github.com/red/red/issues/1620#issuecomment-184257243>

    That feature is not supported. 
    
    Just FYI, you can write the above code in a simpler way:
    
    ```
    view [
        t: text-list data ["one" "two" "three"]
        do [t/selected: 2]
    ]
    ```

