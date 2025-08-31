
#3400: field does not work properly when view its parent window twice
================================================================================
Issue is closed, was reported by qtxie and has 6 comment(s).
[status.built] [type.bug]
<https://github.com/red/red/issues/3400>

### Expected behavior
pin-dlg function should work in second time.

### Actual behavior
pin-dlg function does not work properly in second time.

### Steps to reproduce the problem
Run the following code in red console.
```
Red []

pin: ""
pin-dlg: func [
	/local dlg
][
	dlg: layout [
		pin-show: field "" button "Add" [
			append pin-show/text "*"
			pin: copy pin-show/text
		]
	]

	view/flags dlg 'modal
]

pin-dlg 
print pin

clear pin
pin-dlg
print pin
```
### Red and platform version
```
Red 0.6.3 for Windows 7 64bit built 28-May-2018/17:53:04+08:00
```


Comments:
--------------------------------------------------------------------------------

On 2018-07-11T11:37:03Z, bitbegin, commented:
<https://github.com/red/red/issues/3400#issuecomment-404138452>

    ```
    pin: ""
    pin-dlg: func [
    	/local dlg
    ][
    	dlg: layout [
    		pin-show: field "" button "Add" [
    			append pin-show/text "*"
    			pin: copy pin-show/text
    		]
    	]
    	clear pin-show/text
    	view/flags dlg 'modal
    ]
    
    pin-dlg 
    print pin
    
    clear pin
    pin-dlg
    print pin

--------------------------------------------------------------------------------

On 2018-07-11T11:38:11Z, bitbegin, commented:
<https://github.com/red/red/issues/3400#issuecomment-404138712>

    Above code is ok, so this not an issue, i think we can close

--------------------------------------------------------------------------------

On 2018-07-11T23:00:20Z, endo64, commented:
<https://github.com/red/red/issues/3400#issuecomment-404336688>

    @bitbegin But it still doesn't explain why the first script doesn't work.

