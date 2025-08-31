# [Red Language Blog](https://redlanguageblog.blogspot.com/)

Classic

- [Klassiek](https://redlanguageblog.blogspot.com/?view=classic)
- [Tegels](https://redlanguageblog.blogspot.com/?view=flipcard)
- [Tijdschrift](https://redlanguageblog.blogspot.com/?view=magazine)
- [Mozaïek](https://redlanguageblog.blogspot.com/?view=mosaic)
- [Zijbalk](https://redlanguageblog.blogspot.com/?view=sidebar)
- [Snapshot](https://redlanguageblog.blogspot.com/?view=snapshot)
- [Tijdbalk](https://redlanguageblog.blogspot.com/?view=timeslide)

<!--THE END-->

[Nieuwe post](https://www.blogger.com/post-edit.g?blogID=7762900362700473774&from=pencil "Nieuwe post")[Dashboard](https://www.blogger.com/home "Dashboard")

1. [Apr  
   \
   5](https://redlanguageblog.blogspot.com/2017/04/an-experiment-with-ide-scripting-in-red.html "5th April 2017")
   
   # [An experiment with IDE scripting in Red](https://redlanguageblog.blogspot.com/2017/04/an-experiment-with-ide-scripting-in-red.html)[Edit](https://www.blogger.com/post-edit.g?blogID=7762900362700473774&postID=1286611897780349809&from=pencil "Edit")
   
   **This article is written by Mike Parr ( [mikeparr@live.com](mailto:mikeparr@live.com) )**
   
   I'm writing this in March 2017.  Red is on version 0.62, still under constant expansion and revision. There is not yet a standard IDE, but you can choose between  a Visual Studio one, or use any text editor.
   
   Looking ahead, we can imagine an IDE written in Red, which would allow Red scripting to extend the IDE.  I have put together a toy system to explore this, and I describe it here.  It is a very minimal IDE, and you would not want to use it seriously.  It is only an experiment.
   
   **The Initial IDE called Red-ex**
   
   This is a trivial editor written in Red, to be extended.  It lets you load, edit, and interpret a Red program.
   
   Here is the code:
   
   Red \["Red-ex editor V1 April 2017 - Mike Parr - mikeparr@live.com"]
   
   ; I incorporated code fragments from  Didier Cadieu,   
   ; and Alan Brack: http://www.mycode4fun.co.uk/About-Red-Programming  
   ;  
   ; The Pretty Printer I use later is by Gregg Irwin  
   ;    https://gist.github.com/greggirwin?direction=asc&amp;sort=created   
   ; which is a port of   Carl Sassenrath's Rebol version:  
   ;   http://www.rebol.net/cookbook/recipes/0042.html"  
   ;------------------------------------------------------------
   
   ; needs red 0.61 or above.  NB this editor uses UTF coding, not ASCII  
   ;------------------------------------------------------------
   
   save-current: function \["Write text in area to  a file"] [  
       either ide-file-name/text = "" [   
               print "Please save-as first."  
       ] [  
           print \["Saving " ide-file-name/data]   ;the data part holds the file name  
           write to file! ide-file-name/data ide-the-text/text  
       ]  
   ]  
   ;-------------------------------------------------------------
   
   open: function \["open selected file, read contents"] [ ;based on Alan Brack's editor                                         
       if picked: request-file/title/filter "Open Red file"   ;ask for file name  
       \[{Red (\*.red)} "\*.red" {All files (\*.\*)} "\*.\*"] [  
           ide-file-name/data: picked      ;put file name on screen  
           append clear ide-the-text/text read picked  ;file contents to area on screen  
       ]  
   ]  
   ;-------------------------------------------------------------
   
   save-as: function \[] [      ;based on Alan Brack's Red editor    
       if picked: request-file/save/title/filter "Save your file"  ;ask for file name  
       \[{Red file (\*.red)} "\*.red" {All files (\*.\*)} "\*.\*"] [   
           unless suffix? picked \[append picked %.red]    ;add file extention if not there.  
           print \["Save-as: " picked]  
           ide-file-name/data: picked  
           save-current  
       ]  
   ]  
   ;------------------------------------------------------------
   
   interpret: function \[] [  ; save and interpret the code in the area  
       either ide-file-name/text = "" [   
           print "Please save-as first."  
       ][      
           save-current  
           print \["Interpreting " ide-file-name/data]  
           do ide-the-text/text  
       ]  
   ]  
   ;------------------------------------------------------------
   
   view [     ;------------ the gui layout  
       size 600x700  
       button "Interpret" \[interpret]  
       button "Open" \[open]  
       button "Save" \[save-current]  
       button "Save-As" \[save-as]  
       ide-label-file-name: text font  
           \[name: "Consolas" size: 10 color: black] "  File: "  
       ide-file-name: text "" font \[name: "Consolas" size: 10 color: black] 250  
       return  ;move down screen, to left side
   
       ide-the-text: area 580x600 white    ;main text area, with 'hello world'  
           font \[name: "Consolas" size: 12 color: black]  
       {Red \[ ]  
       print ["Hello"  
           "World"  
         ]  
   }              ;nb { } enclose multi-line strings - newlines significant  
       return  
   ]
   
   and here is a screenshot:
   
   [![](data:image/gif;base64,R0lGODlhAQABAPAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEg5SFmEjF17nUpbtwT8Z8z65UixAV04e1H-jNUf6Th7DPWjWqyZ_XBWLOUVIU2r3Zzn4FihDOkbaIfF4yZYwHD4EuE7OyqDN-k96MHg3EB8EaRwrAF5JHbV2ljxs7ZEgTr3LPA3UyE4zzA/s1600/red1.png)
   
   Red can create menus of course, but I have used buttons for screenshot purposes.
   
   **Adding Tools**
   
   What if we wanted to script additional features?  Here I'm looking at tasks which are invoked via a button/menu, rather than for example adding auto-complete or coloring.  (Incidentally, at the time of writing the 'area' widget for text-editing is not fully-featured, and the manipulation of a text-selection is not available.  This is planned, however.)
   
   One approach (as used in the web browser DOM) is to provide an interface to allow manipulation by   (say) Javascript.  This could be done in Red, but for this experiment, I'll keep it simple.
   
   Ideally, we should be able to add such tasks without modifying the source code of the IDE   It turns out that the 'code equals data' property of Red makes this easy.
   
   I'll create a new version of Red-ex, which lets you add tools.
   
   **The Approach**
   
   I chose this simple approach to adding new tools:
   
   - We create a new folder named ide-scripts in the the same folder as Red-ex.
   - We choose a meaningful name for the tool.  For example, below I incorporate a source-code formatter, and I chose 'Pretty'.  I might have chosen 'Pretty-printer'.  The name will appear on a button, and, in this prototype, it must be a legal Red name (so no spaces, square brackets, etc).  Incidentally, Red is case-insensitive for names, so Pretty or pretty are treated the same.
   - We create a file in ide-scripts with the same name, and write the tool as a single function within that file, also of the same name.
   - The function cannot have arguments in this experiment, though it can refer to items in the IDE.  Just for my own use, I prefix them with  'ide'.
   - When Red-ex runs, it looks for files in the ide-scripts folder, and creates buttons for them, adding them to the standard layout.  Clicking a tool button causes them to be loaded into Red-ex, and executed.
   
   **Example 1 - Clear The Screen**
   
   Here is an example:  the code in clear-screen.red, which clears the screen.  It refers to an item in Red-ex:  ide-the-text.
   
   clear-screen: function \[] [  
       print "Clearing."  
     ide-the-text/text: ""   
   ]
   
   The 'print' is not needed of course, but using the Red console can be useful in debugging/testing.
   
   **Example 2  - Size**
   
   Here we count the characters in ide-the-text/text, and place the result in ide-info to make it visible.  The code in size.red is:
   
   size: function \[] [  
       ide-info/data: "Chars: "  
       ide-info/data: append ide-info/data length? ide-the-text/text  
   ]
   
   **Example 3  - Pretty-Print**
   
   Here, we make use of Gregg Irwin's port of  Carl Sassenrath's pretty printer code.  I needed to re-cast it as one function.  The original version, with some code omitted here, was:
   
   Red \[]
   
   output: none ; output text  
   indent: copy "" ; indentation chars
   
   emit-val: func \[val] \[append output val]
   
   emit-space: func \[pos] [  
   ...omitted  
   ]
   
   emit-part: func \[from to] [  
   ...omitted  
   ]
   
   clean-script: func [  
   script "Original Script text"  
   /local blk-rule str new  
   ][  
       ...omitted  
   ]
   
   ;read text from a file, run it, print the returned value  
   print clean-script read request-file  ; execute it  
   halt
   
   In the following new version, it is re-written as a singe pretty\[ ] function, with nested functions.  It is invoked via a call at the end of the enclosing function:
   
   pretty: func \[] [  
       output: none ; output text  
       indent: copy "" ; indentation chars
   
       emit-val: func \[val] \[append output val]
   
       emit-space: func \[pos] [  
          ...omitted  
       ]
   
       emit-part: func \[from to] [  
           ...omitted  
       ]
   
       clean-script: func [  
           script "Original Script text"  
           /local blk-rule str new  
       ] [  
           ...omitted  
         
       ]  
       ;run it from here,  with ide text as input and output  
       ide-the-text/text:  clean-script ide-the-text/text   
   ]
   
   The full code of Pretty is provided later.
   
   **The New Version of Red-ex**
   
   Here is the new version 2 - the code for save-as, interpret etc is identical, not shown:
   
   Red \["Red-ex editor  - mikeparr@live.com"]  
   ;editor for Red, written in Red - Version 4 March 2017 - tools included  
   ;needs red 0.61 or above.   
   ;NB this editor uses UTF coding, not ASCII
   
   ;-------------------------------------------------------------  
   ;The functions save-current, open, save-as, interpret are as above.  
   ;------------------------------------------------------------
   
   get-tool-names: function \["Get a block of file names/tool names"] [  
       dir-files: read %ide-scripts/  
       return dir-files  
   ]  
   ;------------------------------------------------------------
   
   make-toolbar: function [  
       "Make a string for a button-bar"  
       file-names \[block!]  
   ] [  
       the-bar: copy ""  
       the-bar: {ide-info: text 70x20 "..." } ; an info area for misc results
   
       ;for each function/file name  e.g abc-def, create string:  
       ;    button "abc-def" \[ do  load %ide-scripts/abc-def.red abc-def]  
       ;  
       button-template: copy ""  
       button-template: { button "+BUT" \[ do load %ide-scripts/+BUT.red +BUT] }  
       foreach tool-name file-names [  
           replace tool-name ".red" ""  
           one-button: copy button-template ; copy needed!  
           append the-bar replace/all one-button "+BUT" tool-name  
       ]  
       append the-bar " return"  
       return the-bar  
   ]  
   ;----------------------------------------------------------
   
   gui: [     ;------------ the gui layout  
       size 600x700  
       button "Interpret" \[interpret]  
       button "Open" \[open]  
       button "Save" \[save-current]  
       button "Save-As" \[save-as]  
       ide-label-file-name: text font \[name: "Consolas" size: 10 color: black] " File: "  
       ide-file-name: text "" font \[name: "Consolas" size: 10 color: black] 250  
       return  ;move down screen, to left side
   
       ide-the-text: area 580x600 white    ;main text area, with initial'hello world'  
       font \[name: "Consolas" size: 12 color: black]
   
       {Red \[ ]  
       print ["Hello"  
           "World"  
         ]  
       }              ;nb { } enclose multi-line strings - newlines significant
   
       return  
   ]
   
   ;if scripts exist, make buttons, insert before first 'button in gui  
   if exists? %ide-scripts [  
       tools: to block! make-toolbar get-tool-names  
       insert find gui 'button tools  
   ]
   
   view  layout gui
   
   The most important new function is 'make-toolbar', which builds a string containing instructions to create buttons.  The creation of one button needs this string, for example:
   
       button "Save" \[save-current]
   
   We supply a caption, and a block which will be executed when the button is clicked.  We could also name the button, if we wanted it to be accessed later.
   
   To execute a tool, we need to load the code into memory, 'do' it to create the function, then call the function.
   
   You will also see that the basic GUI (Interpret, Save-as etc) is now created prior to the use of layout and view.  This lets us insert the tool buttons above the basic GUI, then use layout and view to generate the enhanced GUI.
   
   Here are 2 screenshots.  Note the extra buttons. They show Size and Pretty working:
   
   Size:
   
   [![](data:image/gif;base64,R0lGODlhAQABAPAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj7rMJkb5VNzDv9Gj0VWari42toKXq1t9AlmShnZ9tziU5sclch8NjizR3M_rmz8jCue5giptDYpiES4d6S4ImT9ug0haXPhYMzMzfacQUlIfhfikbbpX6ESDmJUNns2ex9n5W_vEl7WNE/s1600/red2.png)
   
   Pretty:
   
   [![](data:image/gif;base64,R0lGODlhAQABAPAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhtw_4IS8pQesAha9FEW64vUNSKRedEojU-TZ99x5RkPiXtEobtNx8iAJ9AHgbF9hDgkVThmPKmSVJznueWMGf7_RZqVsLTek1eDBJshxZcO3n77AQudp6-oHo5XXlHfgRedciLkgKu6YM/s1600/red3.png)
   
   That's the end of the experiment.  All the code is proved, and you can try it yourself.  The main Red site is:
   
   **[http://www.red-lang.org/](http://www.red-lang.org/)**
   
   I was very impressed with the simplicity of the code, and will continue to explore and enhance my editor in this way.  However, some tools - even simple ones - need events.  For example the 'size' button needs to clear its previous result when the text is modified.  This will be my next topic.
   
   Finally, here is the pretty printer function.  You now have all the code I used.  Put it in Pretty.red, in the ide-scripts folder:
   
   pretty: func \[] [  
       output: none ; output text  
       indent: copy "" ; indentation chars
   
       emit-val: func \[val] \[append output val]
   
       emit-space: func \[pos] [  
           either newline = last output \[emit-val indent] [  
               if not any \[find "\[(" last output find ")]" first pos] \[emit-val space]  
           ]  
       ]
   
       emit-part: func \[from to] [  
           emit-space from  
           emit-val copy/part from to  
       ]
   
       clean-script: func [  
           "Returns new script text with standardized layout."  
           script "Original Script text"  
           /local blk-rule str new  
       ] [  
           output: make string! length? script  
           clear indent  
           print "in c-sc"  
           parse script blk-rule: [  
               some [  
                   str: ; Get position for emitting  
                   \[crlf | newline] (emit-val newline)  
                   | #";" \[thru newline | to end] new: (emit-part str new)  
                   ; Emit the opening bracket/paren we just found, update the  
                   ; indent level, and parse into the block/paren.  
                   | \[#"\[" | #"("] (emit-part str 1 append indent tab) blk-rule  
                   | \[#"]" | #")"] (remove indent emit-part str 1) break  
                   | \[space | tab] ; Do nothing. Emit-part adds spaces for us.  
                   | skip (value: load/next str 'new emit-part str new) :new  
               ]  
           ]  
           ; We may have added a leading space before the first value we found,  
           ; and we don't want that in the output.  
           trim/head output  
       ]  
      ; request-file: %testpp.red  
       ;print clean-script read request-file  
       print \["calling pretty with " ide-the-text/text]  
        ide-the-text/text:  clean-script ide-the-text/text    ;read file-name
   
   ]
   
   5th April 2017 gepost door [Arie](http://www.blogger.com/profile/15094498474614299644)
   
   0
   
   ### Een opmerking toevoegen
2. [Nov  
   \
   7](https://redlanguageblog.blogspot.com/2016/11/safe-and-persistent-local-values.html "7th November 2016")
   
   # [Safe and persistent local values](https://redlanguageblog.blogspot.com/2016/11/safe-and-persistent-local-values.html)[Edit](https://www.blogger.com/post-edit.g?blogID=7762900362700473774&postID=2577266734684912119&from=pencil "Edit")
   
   # Local is not safe
   
   Local values in Red are just words in function's context, so they can be set from outside. `function!` datatype somehow limits access to them, but it is possible to set them anyway. Let’s make some simple function with local value:
   
   ```none
   red>> f: func [/local word] [word]
   == func [word][word]
   red>> f
   == none
   ```
   
   As you can see, local value is initialized to `none`. But actually, it’s not a "real" local value, it’s a trick. `/local` is refinement just as any other and it’s possible to call our function with that refinement:
   
   ```none
   red>> f/local 42
   == 42
   ```
   
   So do not expect that your local value will be always initialized to `none`, user can override it. As I just demonstrated, local values are not safe.
   
   Another thing, that will be important later is the `/local` refinement. It’s actually just another word defined in the function context:
   
   ```none
   red>> f: func [/local] [local]
   == func [/local][local]
   red>> f
   == false
   red>> f/local
   == true
   ```
   
   As you can see, when the refinement is used, it’s value is set to `true`. With `local`, you just don’t expect it to be used.
   
   ## Some locals can be persistent
   
   In previous examples we used scalar value. Things are bit different when we use `series!` value:
   
   ```none
   red>>  f: func [value /local block] [block: [] append block value]
   == func [value /local block][block: [] append block value]
   red>> f 1
   == [1]
   red>> f 2
   == [1 2]
   ```
   
   This is something that is confusing for newcomers. Why is not `block` empty on each call? Here’s the very importand difference between Red and some other languages. The source is not just parsed and executed, it is loaded. This is very important step that turns data into the code, in our case the source of the function into the function itself. When you are calling the function, it’s not loaded again, you are calling what was loaded into the memory when defining that function. Why is this important?
   
   ```none
   []
   ```
   
   What you see above is an empty `block!`. Like all `series!`, `block!` is passed by reference in Red. It happens automatically, you don’t have to care about it. But what it means in our case? We have `block: []` in our function. When this code is loaded into memory, it is translated into something like `block: <reference to some block>`. And this reference is there, in the body of our function and does not change. This is the reason, why the block is not empty on each call. Because on each call, it’s still the same `block!`, that was created when the function was loaded.
   
   Remember this.
   
   ## Introducing literal map!
   
   Red, like Rebol3, has `map!` type. If you are not familiar with `map!`, it is basically key/value storage. Unlike Rebol3, Red has also literal `map!` representation. To make an empty `map!`, you can type `#()`. As with the empty block above, I am going to put this on separate line:
   
   ```none
   #()
   ```
   
   ### Intermezzo
   
   > The title of this article is **Safe and persistent local values**. I’ve already shown that locals can be persisent - sometimes against user’s will, when they don’t understand Red good enough yet - and by now, you probably already figured out how to prevent the problems described above and make locals safe. But for the reference, I am going to describe it anyway. So back to the literal `map!`.
   
   This literal `map!` has basically the same properties as `block!` described above as demonstrated in following example:
   
   ```none
   red>> f: func [word value /local map] [map: #() map/:word: value map]
   == func [word value /local map][map: #() map/:word: value map]
   red>> f 'a 1
   == #(
       a: 1
   )
   red>> f 'b 2
   == #(
       a: 1
       b: 2
   )
   ```
   
   As you can see, local word `map` always word refers to same `map!`. Which is something we can use to make safe local values.
   
   ## Safe local values
   
   So back to local values. How can we make them safe (safe - user cannot change them)? Here’s some simple example of an attack on local values:
   
   ```none
   red>> f: func [/local val] [if val [#panic]]
   == func [/local val][if val [#panic]]
   red>> f/local #evil
   == #panic
   ```
   
   The obvious and right solution to this problem is to initialize local value(s):
   
   ```none
   red>> f: func [/local val] [val: none if val [#panic]]
   == func [/local val][val: none if val [#panic]]
   red>> f/local #evil
   == none
   ```
   
   But as you can see, we now have to define `val` in the header and then initialize it in the body. There sure must be some easier way:
   
   ```none
   red>> f: func [/local] [local: #(val: #[none]) if local/val [#panic]]
   == func [/local][local: #() if local/val [#panic]]
   ```
   
   > **NOTE:** Because literal `map!` is not reduced, we have to use literal `none!` here (that is `#[none]`), otherwise it would be `word!` like any other. But that is something that I’m not going to explain here.
   
   So now we can test it:
   
   ```none
   red>> f
   == none
   red>> f/local
   == none
   ```
   
   So, what have we done? We defined just `/local` refinement in the header. In the body, `map!` was assing to the `local` `word!`and in that `map!` we defined word `val`. To access `val`, we need to use `local/val`, but as you can see, it is local to our function, even when not defined in the header:
   
   ```none
   red>> val
   *** Script error: val has no value
   *** Where: do
   ```
   
   As said before, this could be done with initializing the `val` value manually. But what couldn’t be done without literal `map!` is the following example:
   
   ```none
   red>> f: func [/local] [
       local: #(count: 0) 
       local/count: local/count + 1 
       print ["function was called" local/count "time(s)."]
   ]
   == func [/local][local: #(
       count: 0
   ) local/count: local/count + ...
   red>> f
   function was called 1 time(s).
   red>> f
   function was called 2 time(s).
   red>> f
   function was called 3 time(s).
   ```
   
   We can use the `/local` refinement, but it doesn’ make any difference:
   
   ```none
   red>> f/local
   function was called 4 time(s).
   ```
   
   `count` is now really *local* and cannot be set and get from outside.
   
   So now it’s time for some closure.
   
   ## Notes
   
   - It is of course possible to use literal `block!` instead of `map!`. It’s just bit more complicated.
   - This calls for a function generator, something like [described here](http://red.qyz.cz/dependent-types.html), so safe locals can be declared in function header.
   - So `count` is safe now, right? Actually, no:
   
   ```none
   red>> m: second body-of :f
   == #(
       count: 4
   )
   red>> m/count: 42
   == 42
   red>> f
   function was called 43 time(s).
   ```
   
   # [This article was written by Boleslav Březovský.](https://www.blogger.com/null)
   
   7th November 2016 gepost door [Arie](http://www.blogger.com/profile/15094498474614299644)
   
   0
   
   ### Een opmerking toevoegen
3. [Nov  
   \
   2](https://redlanguageblog.blogspot.com/2016/11/keywords-draw-image-livecode.html "2nd November 2016")
   
   # [](https://redlanguageblog.blogspot.com/2016/11/keywords-draw-image-livecode.html)[Edit](https://www.blogger.com/post-edit.g?blogID=7762900362700473774&postID=3168449055857507378&from=pencil "Edit")
   
   Keywords: \[draw image Livecode transparency GUI]  
   Level: Easy
   
   Title: "How to create a transparent image"  
   Author: "Arnold van Hofwegen"
   
   The best way to experiment with draw and drawing an image is by using a livecode demo session from within a Red GUI-console.  
   In this short blog I'll use the simple version by Nenad.  
   For completeness this is the code
   
   \```  
   view [  
   title "Red Livecoding"  
   output: panel 400x600  
   source: area 500x600 wrap font-name "Fixedsys" on-key-up [  
   attempt \[output/pane: layout/only load source/text]  
   ]  
   ]  
   \```  
   We copy and paste this into the GUI-console.
   
   [![](data:image/gif;base64,R0lGODlhAQABAPAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEigv9jZvzo8JCHpuFVBHakL5dENUwsgGoIkCUzWN64RAzgRe9JmU68G1TrvQmi7fdbYgmcK7oL_knClnsmLaEcFiAo4H9b8Plxnksw7n_O25abr9XVjPl8qGPzVPTFZiBX9p0cjSGpuCIA/s1600/blog_splash_image_drawing_1.png)
   
   In the source area we can now go ahead and draw and testview our drawing.  
   Just starting typing draw \[] and the draw dialect commands inside the brackets won't do us no good, nothing will appear, we first need an element to draw on.
   
   We will start simple and draw a red circle  
   base transparent 200x200 draw [  
       fill-pen red  
   pen off  
       circle 100x100 90  
   ]
   
   [![](data:image/gif;base64,R0lGODlhAQABAPAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiDvYvD_dCKnLzmdiuPpm9wt_vD1JsSskhHkK11OaW5UoA6vPghOAwCeZDjBwjNVF46Jdu3ihkE0B_mSa9qCGqzgOC0od5Yg-5qpu8QYxylLo90tzRW-gquTABFWlJdeZCgPmKcjEX0dxI/s1600/blog_splash_image_drawing_2.png)
   
   And work with that expanding the code step by step until we come to our resulting drawing
   
   base transparent 200x200 draw [  
       fill-pen red pen off  
       circle 100x100 90  
       fill-pen white pen off  
       circle 100x100 70  
       fill-pen red pen off  
       circle 100x100 50  
       fill-pen white pen off  
       circle 100x100 30  
       fill-pen red pen off  
       circle 100x100 10  
   pen black  
   line-width 2  
   line 100x100 190x10  
   triangle 100x100  
   105x100 100x95  
   line 180x20 190x20  
   line 180x20 180x10  
   line 170x30 180x30  
   line 170x30 170x20  
   line 175x25 185x25  
   line 175x25 175x15  
   ]
   
   [![](Red%20Language%20Blog_files/blog_splash_image_drawing_3.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjMNB738cpedJd_Vf-IxOIyoBQULOr96M4TJeW6nrukPaenHvmj47QDNi2qmfH5LrOz4LZOIEVFZqp0YCUhyphenhyphenw__zLWdclbc0kUpvGR4a4f97KReKkZYsHAgY2-38xSrc6KKfZPyjDZS_4o/s1600/blog_splash_image_drawing_3.png)
   
   To make a text in this we use 'text, so we add
   
   text 75x150 {Red Language Blog  
   Application }
   
   The text appears pretty small so we declare a font within our GUI-console first before restarting the livecode.
   
   large-font: make font! \[size: 20 name: "Arial" style: 'bold]
   
   Also resize the image.
   
   base transparent 400x220 draw [  
       fill-pen red pen off  
       circle 100x100 90  
       fill-pen white pen off  
       circle 100x100 70  
       fill-pen red pen off  
       circle 100x100 50  
       fill-pen white pen off  
       circle 100x100 30  
       fill-pen red pen off  
       circle 100x100 10  
   pen black  
   line-width 2  
   line 100x100 190x10  
   triangle 100x100  
   105x100 100x95  
   line 180x20 190x20  
   line 180x20 180x10  
   line 170x30 180x30  
   line 170x30 170x20  
   line 175x25 185x25  
   line 175x25 175x15  
   pen maroon  
   font large-font  
   text 75x150 {Red Language Blog  
   Application }  
   ]
   
   When we want to make a real image of this we first create an empty image with a transparent background.  
   We do this directly in the GUI-console or put these in a liitle scriptfile
   
   img: make image! \[400x220 0.0.0.255]
   
   Now we can draw on this new empty image and this drawing can then be saved directly.
   
   save %RLB-splash.png draw img [  
       fill-pen red pen off  
       circle 100x100 90  
       fill-pen white pen off  
       circle 100x100 70  
       fill-pen red pen off  
       circle 100x100 50  
       fill-pen white pen off  
       circle 100x100 30  
       fill-pen red pen off  
       circle 100x100 10  
   pen black  
   line-width 2  
   line 100x100 190x10  
   triangle 100x100  
   105x100 100x95  
   line 180x20 190x20  
   line 180x20 180x10  
   line 170x30 180x30  
   line 170x30 170x20  
   line 175x25 185x25  
   line 175x25 175x15  
   pen maroon  
   font Large  
   text 75x150 {Red Language Blog  
   Application }  
   ]
   
   And here is our Splash Screen image!
   
   [![](Red%20Language%20Blog_files/RLB-splash.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEguPEqliul1ECSb8fBfPk_B1nNGEEYbIDxMPTGNi7enIU9mqEcRTs24k2sDJW4QOmjwyjvtk5lRfws_xjzrriZMHgMaJzb8rU0lD5ZXmQAhLPhzbReWCeVFKT7jbeZd0_VkB9MENZy5vLw/s1600/RLB-splash.png)
   
   This Article was written by Arnold van Hofwegen.
   
   2nd November 2016 gepost door [Arie](http://www.blogger.com/profile/15094498474614299644)
   
   0
   
   ### Een opmerking toevoegen
4. [Nov  
   \
   1](https://redlanguageblog.blogspot.com/2016/11/what-is-difference-between-vid-and-view.html "1st November 2016")
   
   # [What is the difference between VID and View?](https://redlanguageblog.blogspot.com/2016/11/what-is-difference-between-vid-and-view.html)[Edit](https://www.blogger.com/post-edit.g?blogID=7762900362700473774&postID=1060266523200245446&from=pencil "Edit")
   
   A nice simple question to get the blog started.
   
   So you want to make a program with a Graphical User Interface using Red? Red supports this by providing a View engine. Okay but what is this VID? They say it is easier?
   
   True. VID stands for Visual Interface Dialect. So it is a DIALECT.
   
   It is a way to make creating a GUI easier. Just describe the interface without having to worry about too much details.
   
   If we take a closer look, there is no 'VID "command" present in the Red GUI-console. 
   
       red&gt;&gt; **help vid**  
       Word vid is not defined
   
   The way it works is that a block containing instructions written in the VID dialect is passed to the LAYOUT function. The LAYOUT function does the hard word of placing the items in the right place and creating the objects in the definitive constructed layout object. 
   
   Where in REBOL the VIEW needed to get input from a layout, in Red the VIEW handles both cases, VIEW can handle a VID dialect block or a layout object.
   
   It is a good idea to have a closer look at the sources of the VIEW and LAYOUT functions to get a better knowledge of how this works.
   
   Just do source view and **source layout** in the Red GUI-console program.
   
   The VIEW source is only one page big  
       red&gt;&gt; **source view**  
       view: func [  
           {Displays a window view from a layout block or from a window face}   
           spec \[block! object!] "Layout block or face object"   
           /tight "Zero offset and origin"   
           /options   
           opts \[block!] "Optional features in \[name: value] format"   
           /flags   
           flgs \[block! word!] "One or more window flags"   
           /no-wait "Return immediately - do not wait"  
       ][  
           unless system/view/screens \[system/view/platform/init]   
           if block? spec \[spec: either tight \[layout/tight spec] \[layout spec]]   
           if spec/type &lt;&gt; 'window \[cause-error 'script 'not-window \[]]   
           if options \[set spec make object! opts]   
           if flags \[spec/flags: either spec/flags \[unique union spec/flags flgs] \[flgs]]   
           unless spec/text \[spec/text: "Red: untitled"]   
           unless spec/offset \[center-face spec]   
           show spec   
           either no-wait \[spec] \[do-events ()]  
       ]  
       red&gt;&gt;
   
   As you can see it takes a block! or an object! as input.
   
   When a VID block! is found it uses the LAYOUT function to make it into a object! and processes the resulting object!
   
   Basically that is all there is to know.
   
   Links to more information:
   
   - [http://www.red-lang.org/2016/03/060-red-gui-system.html](http://www.red-lang.org/2016/03/060-red-gui-system.html)
   - [https://doc.red-lang.org/gui/VID.html](https://doc.red-lang.org/gui/VID.html)
   - [https://doc.red-lang.org/gui/View.html](https://doc.red-lang.org/gui/View.html)
   - Join the discussions on [https://gitter.im/red/red](https://gitter.im/red/red)
   
   Notes:
   
   - Blog articles posted here can be edited at a later stage
   - Articles are perfectly searchable with Google
   - Articles may consist of follow-up on discussions elsewhere
   - If you also want to write for this blog we invite you to do so. You don't have to be an expert to show others how you solved a problem. Keep things simple and clear! You can contact Arnold with a direct message in the Red room on Gitter:  [https://gitter.im/red/red](https://gitter.im/red/red)
   
   I plan to write some short articles about
   
   - Creating a Splash Screen
   - Adding a menu to a VID GUI
   
   This article was written by Arnold van Hofwegen on October 31 2016.
   
   1st November 2016 gepost door [Arie](http://www.blogger.com/profile/15094498474614299644)
   
   0
   
   ### Een opmerking toevoegen
5. [Oct  
   \
   21](https://redlanguageblog.blogspot.com/2016/10/red-programming-language-articles-start.html "21st October 2016")
   
   # [Red Programming Language articles - the start of a new BLOG about Red](https://redlanguageblog.blogspot.com/2016/10/red-programming-language-articles-start.html)[Edit](https://www.blogger.com/post-edit.g?blogID=7762900362700473774&postID=1430298778124998006&from=pencil "Edit")
   
   Hi folks!
   
   today we start a new community driven BLOG about all and everything about the Red Programming Language.
   
   While Nenad is working like crazy to continue to design and develop Red, a lot of people do interesting things with Red. It is amazing that at this stage so much is already possible with Red!
   
   We hope to post BLOGs from different people, who will let shine their light upon different aspects of the Red Language.
   
   When somebody would like to publish a BLOG post here, they can contact ArievW in private in the Red room of Gitter.
   
   21st October 2016 gepost door [Arie](http://www.blogger.com/profile/15094498474614299644)
   
   0
   
   ### Een opmerking toevoegen

![](Red%20Language%20Blog_files/Arie%20op%20bruiloft%20M-JW.jpg) ![](Red%20Language%20Blog_files/Arie%20op%20bruiloft%20M-JW.jpg)

Over mij

Over mij

[Arie](https://www.blogger.com/profile/15094498474614299644)

[![Mijn foto](Red%20Language%20Blog_files/Arie%20op%20bruiloft%20M-JW.jpg)](https://www.blogger.com/profile/15094498474614299644)

![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYAgMAAACdGdVrAAAACVBMVEX///8AAAD///9+749PAAAAAnRSTlMAAHaTzTgAAAAwSURBVHherYyxCQAwCAR/yhTZy8ZeC6c0BETU1msOjucBeyBF54s1FHEs5fZYWb12TL8307RAxVQAAAAASUVORK5CYII=) ![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYAgMAAACdGdVrAAAACVBMVEX///8AAAAzMzMTx/ayAAAAAnRSTlMAAHaTzTgAAAAwSURBVHherYyxCQAwCAR/yhTZy8ZeC6c0BFS09pqD43nAHijR+WINZZxLuTN2Vq8dTL8301DjA9oAAAAASUVORK5CYII=)

Blogarchief

Blogarchief

- [2017](https://redlanguageblog.blogspot.com/2017/)1
  
  - [april](https://redlanguageblog.blogspot.com/2017/04/)1
    
    - [An experiment with IDE scripting in Red](https://redlanguageblog.blogspot.com/2017/04/an-experiment-with-ide-scripting-in-red.html)
- [2016](https://redlanguageblog.blogspot.com/2016/)4
  
  - [november](https://redlanguageblog.blogspot.com/2016/11/)3
  - [oktober](https://redlanguageblog.blogspot.com/2016/10/)1

Laden

Thema Dynamische weergaven. Mogelijk gemaakt door [Blogger](https://www.blogger.com/). [Misbruik rapporteren](https://www.blogger.com/go/report-abuse).
