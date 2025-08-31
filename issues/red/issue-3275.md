
#3275: Compilation Error: invalid path value: image/encode
================================================================================
Issue is closed, was reported by toohamster and has 4 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/3275>

### Expected behavior
Compilation Error: invalid path value: image/encode

### Actual behavior
```
Red [author: "Gregg Irwin"]

data: [max 0:0:30 dur 0:0:15 lap 0:0:0]
count-time: does [data/lap: data/lap + (1.0 / ticker/rate)]
tick: does [
	if data/lap < data/dur [count-time]
	t/text: form data/lap
	p/data: data/lap / data/dur
]
reset: does [data/lap: 0:0:0  clear t/text  p/data: 0%]
view [
    title "秒表 -- 小明"

	text "Elapsed Time:" p: progress t: text return
	text "Duration:" s: slider 50% on-change [
		d/text: form data/dur: data/max * face/data
	]
	d: text on-create [face/text: form data/dur] return
	button "Reset" [reset]
	ticker: base 0x0 rate 10 on-time [tick]
]
```
when i do `red-063 -t Android 001.red ` in macOS 10.10.5 
```
-=== Red Compiler 0.6.3 ===- 

Compiling /Users/xiaohanxu/workspace/redlearn/001.red ...
...compilation time : 995 ms

Target: Android 

Compiling to native code...
*** Warning: OS_TYPE macro in R/S is redefined
*** Compilation Error: invalid path value: image/encode 
*** in file: %environment/codecs/png.red 
*** in function: exec/ctx259~encode
*** at line: 1 
*** near: [as cell! image/encode img where IMAGE_PNG]
```

### Steps to reproduce the problem
### Red version and build date, operating system with version.
red-063
macOS 10.10.5 



Comments:
--------------------------------------------------------------------------------

On 2018-03-23T00:07:09Z, toohamster, commented:
<https://github.com/red/red/issues/3275#issuecomment-375497488>

    i change my code as it
    ```
    Red [needs: 'view]
    
    h: load http://re-bol.com/heads.jpg
    t: load http://re-bol.com/tails.jpg
    
    view [
        title "小明的工具箱"
        ;size 400x300
        
        below
        i: image h
        f: field
        button "Flip" [
            f/text: first random ["Heads" "Tails"]
            either f/text = "Heads" [i/image: h] [i/image: t] 
        ]
    ]
    ```
    
    yet had error:
    
    ```
    
    -=== Red Compiler 0.6.3 ===- 
    
    Compiling /Users/xiaohanxu/workspace/redlearn/001.red ...
    ...compilation time : 1016 ms
    
    Target: Android 
    
    Compiling to native code...
    *** Warning: OS_TYPE macro in R/S is redefined
    *** Compilation Error: invalid path value: image/encode 
    *** in file: %environment/codecs/png.red 
    *** in function: exec/ctx259~encode
    *** at line: 1 
    *** near: [as cell! image/encode img where IMAGE_PNG]
    ```
    
    but i exec `-t Windows` it not error

--------------------------------------------------------------------------------

On 2018-03-23T02:04:54Z, dockimbel, commented:
<https://github.com/red/red/issues/3275#issuecomment-375516260>

    The Android support in master branch is just an old proof of concept with limited abilities, and not maintained since a while. It has been superseded by a new Android branch with much more advanced features, but which is, for now, private. A blog article about Android support will be out soon, so you will see how much is possible so far.

