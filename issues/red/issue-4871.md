
#4871: changing an object function breaks it
================================================================================
Issue is closed, was reported by snotbubble and has 8 comment(s).
<https://github.com/red/red/issues/4871>

**Before submitting**
Prior to opening this ticket, please share your finding in our [dedicated chat](https://gitter.im/red/bugs), so we can confirm it and help in reproducing it, including on other platforms.

**Describe the bug**
altering an object function will break its ability to read other object fields

**To reproduce**
run this
```
p: "" o: context [ n: "name" f: func [] [print [ "name=" n ] ] ] o/f parse (form o) [ thru "f:" copy p thru "]]" ] replace p "name" "nom" o/f: do (load p) probe o o/f
```

**Expected behavior**
the modified function `f` should see the parameter `n` and print its value

**Platform version**
```
Red 0.6.4 for Linux built 2-Mar-2021/22:01:01+10:00 commit #6de9b93
```



Comments:
--------------------------------------------------------------------------------

On 2021-04-07T02:25:27Z, greggirwin, commented:
<https://github.com/red/red/issues/4871#issuecomment-814553973>

    Formatting the code will help readers a lot. :^)

--------------------------------------------------------------------------------

On 2021-04-07T02:37:15Z, greggirwin, commented:
<https://github.com/red/red/issues/4871#issuecomment-814557941>

    What you're missing here is that when you extract the function as a string, then load that string, what you get back is not bound to the object in any way, so that function you (re)create is looking for `n` in the global context.
    ```
    p: ""
    n: "Not this one!"
    o: context [
    	n: "name"
    	f: func [] [
    		print [ "name=" n ]
    	] 
    ]
    
    o/f
    parse (form o) [ thru "f:" copy p thru "]^/]" ]
    replace p "name" "nom"
    o/f: do (load p)
    probe o
    o/f
    ```
    You need to bind it to get the result you want.
    ```
    o: context [
    	n: "name"
    	f: func [] [
    		print [ "name=" n ]
    	] 
    ]
    
    o/f
    parse (form o) [ thru "f:" copy p thru "]^/]" ]
    replace p "name" "nom"
    o/f: do (bind load p o)
    probe o
    o/f
    ```
    In this case, you should also be able to do it like this:
    ```
    o: context [
    	n: "name"
    	f: func [] [
    		print [ "name=" n ]
    	] 
    ]
    
    o/f
    body: replace/deep body-of :o/f "name=" "nom="
    probe o
    o/f
    ```

--------------------------------------------------------------------------------

On 2021-04-07T06:36:24Z, snotbubble, commented:
<https://github.com/red/red/issues/4871#issuecomment-814644523>

    `bind` just rebuilds the whole object, correct?

--------------------------------------------------------------------------------

On 2021-04-07T08:41:04Z, hiiamboris, commented:
<https://github.com/red/red/issues/4871#issuecomment-814724815>

    no, it just binds the words deeply

