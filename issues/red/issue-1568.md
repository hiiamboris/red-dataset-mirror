
#1568: copy includes history of scrolled gui-console history
================================================================================
Issue is closed, was reported by WiseGenius and has 10 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1568>

Enter some lines into the gui-console:

```
;1
;2
;3
;4
;5
;6
;7
;8
;9
```

Use the up and down keys to randomly explore the history:

Select all and copy, and the clipboard will include the history of the scrolled history:

```
--== Red 0.5.4 ==-- 
Type HELP for starting information. 

red>> ;1
red>> ;2
red>> ;3
red>> ;4
red>> ;5
red>> ;6
red>> ;7
red>> ;8
red>> ;9
red>> red>> ;9red>> ;8red>> ;7red>> ;6red>> ;5red>> ;6red>> ;7red>> ;6red>> ;5red>> ;4red>> ;3red>> ;2red>> ;1red>> ;9red>> ;8red>> ;7red>> ;6red>> ;5red>> ;4red>> ;5red>> ;6red>> ;7red>> ;6red>> ;5red>> ;4red>> ;3red>> ;2red>> ;3red>> ;2red>> ;3red>> ;2red>> ;3red>> ;2red>> ;3red>> ;2red>> ;1red>> ;2red>> ;1red>> ;2red>> ;1red>> ;2red>> ;1red>> ;9red>> ;1red>> ;2red>> ;3red>> ;4red>> ;5red>> ;6red>> ;5red>> ;6red>> ;7red>> ;8red>> ;7red>> ;8red>> ;9red>> ;1red>> ;2red>> ;1red>> ;9red>> ;8red>> ;7red>> ;6red>> ;7red>> ;8red>> ;9red>> ;1red>> ;2red>> ;3red>> ;4red>> ;3red>> ;2red>> ;1red>> ;9red>> ;1red>> ;2red>> ;3red>> ;2red>> ;1red>> ;2red>> ;3red>> ;4red>> ;5red>> ;6red>> ;7red>> ;8red>> ;9red>> ;1red>> ;2red>> ;3red>> ;4red>> ;5red>> ;6
```



Comments:
--------------------------------------------------------------------------------

On 2016-02-02T00:52:22Z, qtxie, commented:
<https://github.com/red/red/issues/1568#issuecomment-178283197>

    Should be fix now.

--------------------------------------------------------------------------------

On 2016-02-02T01:17:29Z, WiseGenius, commented:
<https://github.com/red/red/issues/1568#issuecomment-178292962>

    When changing direction from up to down, it now doesn't change the line it's on:
    
    Expected:
    &uarr;  `;9`
    &uarr;  `;8`
    &uarr;  `;7`
    &darr;  `;8`
    &darr;  `;9`
    
    Actual:
    &uarr;  `;9`
    &uarr;  `;8`
    &uarr;  `;7`
    &darr;  `;7`
    &darr;  `;8`

--------------------------------------------------------------------------------

On 2016-02-02T01:30:27Z, qtxie, commented:
<https://github.com/red/red/issues/1568#issuecomment-178296666>

    @WiseGenius Good Catch! ;-)

--------------------------------------------------------------------------------

On 2016-02-02T01:41:58Z, qtxie, commented:
<https://github.com/red/red/issues/1568#issuecomment-178300424>

    Push a new fix. :-)

--------------------------------------------------------------------------------

On 2016-02-02T02:13:58Z, WiseGenius, commented:
<https://github.com/red/red/issues/1568#issuecomment-178313857>

    It seems to be working now.

