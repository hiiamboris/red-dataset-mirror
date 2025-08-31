Original URL: <https://dev.to/lepinekong/red-for-hopeless-programmers-iii-31a2>

# Red For Hopeless Programmers III

lepinekong

* * *

[![lepinekong](https://media2.dev.to/dynamic/image/width=50,height=50,fit=cover,gravity=auto,format=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fuploads%2Fuser%2Fprofile_image%2F19626%2F30357b7a-e7a6-4f2f-9935-34428847c48e.png)](https://dev.to/lepinekong)

[lepinekong](https://dev.to/lepinekong)

Posted on Feb 9, 2019 • Edited on Feb 13, 2019

![](https://assets.dev.to/assets/sparkle-heart-5f9bee3767e18deb1bb725290cb151c25234768a0e9a2bd39370c382d02920cf.svg)   ![](https://assets.dev.to/assets/multi-unicorn-b44d6f8c23cdd00964192bedc38af3e82463978aa611b4365bd33a0f1f4f3e97.svg)   ![](https://assets.dev.to/assets/exploding-head-daceb38d627e6ae9b730f36a1e390fca556a4289d5a41abb2c35068ad3e2c4b5.svg)   ![](https://assets.dev.to/assets/raised-hands-74b2099fd66a39f2d7eed9305ee0f4553df0eb7b4f11b01b6b1b499973048fe5.svg)   ![](https://assets.dev.to/assets/fire-f60e7a582391810302117f987b22a8ef04a2fe0df7e3258a5f49332df1cec71e.svg)  

Note: this is a draft, I haven't re-read it yet, if you pinpoint errors, don't hesitate to notify me ;)

## [](#crud-database)CRUD Database

This is the 3rd part of the series [Red for Hopeless Programmers.](https://dev.to/lepinekong/red-for-hopeless-programmers---part-i-3g0)

If you haven't yet read them go for part I and part II though I try to make each tutorial understandable standalone for absolute beginner.

Firstable for non coders, CRUD is about operating on datas with these 4 operations:

> Create Read Update Delete.

Datas can be simple "flat" records like your beloved CSV (Excel text format) file or they can be "nested" or hierarchical which is great for representing real word use cases.

So I'll split this tutorial into 2 sub-series with example on how to create a bookmark database.

III.1 - Create a Bookmark database in CSV format (this article)

III.2 - Create a Bookmark database in Readable Human Format (next article)

### [](#c-create)C - Create

If it is the first record, the file may not even exist. In some programming languages you have to consider this as a special case, in Red, it's automatically created. So let's say you want to write to file:

> bookmarks.csv

Your code would be

```

write/lines/append %bookmarks.csv line

```

Enter fullscreen mode Exit fullscreen mode

> url;title;category;tags

for example

> line: {[https://dev.to/lepinekong/Red-for-hopeless-programmers---part-ii-258;Red](https://dev.to/lepinekong/Red-for-hopeless-programmers---part-ii-258;Red) for hopeless programmers - Part II;Red;Csv,"Google Chart"}

you can execute these 2 instructions in console (just copy and paste if you're lazy):  
[![https://i.imgur.com/YrddyzL.png](https://res.cloudinary.com/practicaldev/image/fetch/s--F-QO757d--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://i.imgur.com/YrddyzL.png)](https://res.cloudinary.com/practicaldev/image/fetch/s--F-QO757d--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://i.imgur.com/YrddyzL.png)

add an other record:

> line: {[https://dev.to/lepinekong/Red-for-hopeless-programmers---part-i-3g0;Red](https://dev.to/lepinekong/Red-for-hopeless-programmers---part-i-3g0;Red) for hopeless programmers - Part I;Red;GUI}

### [](#r-read)R - Read

Read a line knowing the line index is easy:

```
lines/:index
```

Enter fullscreen mode Exit fullscreen mode

but often you'll have to lookup a record. Let's say you want article "part II".  
You'll search the string "part II" in title's column which is second column and once found, you can thenget the index and afterwards the whole record.

This means you'll first have to split each row into column to search second column like this:

```

foreach line lines [
    record: split line ";"
    ?? record
]        

```

Enter fullscreen mode Exit fullscreen mode

[![https://i.imgur.com/OOERaQw.png](https://res.cloudinary.com/practicaldev/image/fetch/s--rrz42RFv--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://i.imgur.com/OOERaQw.png)](https://res.cloudinary.com/practicaldev/image/fetch/s--rrz42RFv--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://i.imgur.com/OOERaQw.png)

Let's now search on second column title:

```

index: 0
foreach line lines [
    index: index + 1
    record: split line ";"
    title: record/2
    if find title "part II" [
        print ["found at index" index]
    ]
]
```

Enter fullscreen mode Exit fullscreen mode

When running in console, you should find index 1:  
[![https://i.imgur.com/RXQLeue.png](https://res.cloudinary.com/practicaldev/image/fetch/s--fAGtxQNO--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://i.imgur.com/RXQLeue.png)](https://res.cloudinary.com/practicaldev/image/fetch/s--fAGtxQNO--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://i.imgur.com/RXQLeue.png)

### [](#u-update)U - Update

to be able to update easily, you should first load the database into a block a lines with:

```
lines: read/lines %bookmarks.csv
```

Enter fullscreen mode Exit fullscreen mode

[![https://i.imgur.com/KM1MhQC.png](https://res.cloudinary.com/practicaldev/image/fetch/s--xD8x7GdV--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://i.imgur.com/KM1MhQC.png)](https://res.cloudinary.com/practicaldev/image/fetch/s--xD8x7GdV--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://i.imgur.com/KM1MhQC.png)

as you can see in above picture, to inspect the lines block, you can use

> ?? lines

If you want to update a line index, it's the easiest path. Let's say you want to replace line 2 (line counts from index 1 and not 0 unlike arrays in many other languages.), you would write:

```
lines/2: update-value
```

Enter fullscreen mode Exit fullscreen mode

but often you'll have to lookup a record and update it, we have already seen how above, so once record index is found, you can update her 4th column (tags):

```

new-tag: {"Red","Google Chart","Stock Chart"}
index: 0
foreach line lines [
    index: index + 1
    record: split line ";"
    title: record/2
    if find title "part II" [
        print ["found at index" index]
        record/4: new-tag
        ?? record
    ]
] 
?? lines        

```

Enter fullscreen mode Exit fullscreen mode

[![https://i.imgur.com/Kborf9m.png](https://res.cloudinary.com/practicaldev/image/fetch/s--sLCx8Iei--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://i.imgur.com/Kborf9m.png)](https://res.cloudinary.com/practicaldev/image/fetch/s--sLCx8Iei--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://i.imgur.com/Kborf9m.png)

if you inspect lines as seen in picture, you should realize something's wrong: it didn't update with updated record. record is independant from original lines. This is where non coders have some difficulties and prefer excel formulas!  
We'll need a future tutorial to see how to use another programming model to simulate the magic of excel. It's about Reactive programming which is more conceptual so I won't dare to deal with it right now.

So just admit for neow you have to recreate that line and update lines.

So how do you recreate the line from record? First idea is you have concatenate each column with separator ";"

```

new-tag: {"Red","Google Chart","Stock Chart"}
index: 0
index-found: 0
foreach line lines [
    index: index + 1
    record: split line ";"
    title: record/2
    if find title "part II" [
        index-found: index
        print ["found at index" index-found]
        record/4: new-tag
        ?? record
        line: copy ""
        foreach column record [
            line: rejoin [line column ";"]
        ]
        ?? line
        lines/:index-found: line 
    ]
]

?? lines         

```

Enter fullscreen mode Exit fullscreen mode

devil's in the details, you may have forgotten to remove the supplemental ";" for line when concatenating (yet another impediment non coders have to get accustomed to, I'm working on a solution in the future at alleviating these pesky details for all but that's another story):  
[![https://i.imgur.com/atCQGET.png](https://res.cloudinary.com/practicaldev/image/fetch/s--9XCNDU1b--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://i.imgur.com/atCQGET.png)](https://res.cloudinary.com/practicaldev/image/fetch/s--9XCNDU1b--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://i.imgur.com/atCQGET.png)

so you have to add an instruction for doing just this using [](https://dev.to/lepinekong/tail)[https://Redlang.Red/tail](https://redlang.red/tail) function  
(read explanation there, I wrote that glossary terms to be able to refer to them so as not to interrupt the flow when writing tutorials):

```

new-tag: {"Red","Google Chart","Stock Chart"}
index: 0
index-found: 0
foreach line lines [
    index: index + 1
    record: split line ";"
    title: record/2
    if find title "part II" [
        index-found: index
        print ["found at index" index-found]
        record/4: new-tag
        ?? record
        line: copy ""
        foreach column record [
            line: rejoin [line column ";"]
        ]
        head remove back tail line
        ?? line
        lines/:index-found: line 
    ]
]

?? lines         

```

Enter fullscreen mode Exit fullscreen mode

[![https://i.imgur.com/gHNdqBq.png](https://res.cloudinary.com/practicaldev/image/fetch/s--JI8IptOt--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://i.imgur.com/gHNdqBq.png)](https://res.cloudinary.com/practicaldev/image/fetch/s--JI8IptOt--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://i.imgur.com/gHNdqBq.png)

Now things seem fine: updating is the hardest!

Unfortunately you have not finished: lines is in memory but not saved on file. We'll see at the end after delete since delete also requires to save data from memory to file (called persistence operation). Fortunately it will be easy: you have seen the most difficult part already.

### [](#d-delete)D - Delete

For deleting you have to position the cursor to the record you want to delete and use remove function.

For example let's say, you added a record by mistake

```
write/lines/append %bookmarks.csv {https://dev.to/lepinekong/Red-for-hopeless-programmers---part-i-3g0;Red for Beginners Programmers;Red;Csv;CRUD}
```

Enter fullscreen mode Exit fullscreen mode

to remove the last line, you have to first load the lines like already seen, then go to last line by skipping n - 1 lines:

```
lines: read/lines %bookmarks.csv
n: length? lines
lines: skip lines (n - 1)
remove lines
?? lines

```

Enter fullscreen mode Exit fullscreen mode

[![https://i.imgur.com/tI0AgTL.png](https://res.cloudinary.com/practicaldev/image/fetch/s--1sKRnwcB--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://i.imgur.com/tI0AgTL.png)](https://res.cloudinary.com/practicaldev/image/fetch/s--1sKRnwcB--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://i.imgur.com/tI0AgTL.png)

There seems to be a bug since ?? lines is \[] but it's the way skip and remove commands work, after remove cursor is AFTER the end of lines so you have to use head to be able to inspect lines in console:

```
lines: head lines
?? lines

```

Enter fullscreen mode Exit fullscreen mode

[![https://i.imgur.com/b2Rvu0I.png](https://res.cloudinary.com/practicaldev/image/fetch/s--9FQlbjJL--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://i.imgur.com/b2Rvu0I.png)](https://res.cloudinary.com/practicaldev/image/fetch/s--9FQlbjJL--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://i.imgur.com/b2Rvu0I.png)

### [](#persistence-of-block-of-lines-to-file)Persistence of block of lines to file

To persiste block of lines, you just do the symetric of read/lines which is write/lines:

```
write/lines %bookmarks.csv lines
```

Enter fullscreen mode Exit fullscreen mode

[![https://i.imgur.com/NapDP6a.png](https://res.cloudinary.com/practicaldev/image/fetch/s--WNPhnD61--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://i.imgur.com/NapDP6a.png)](https://res.cloudinary.com/practicaldev/image/fetch/s--WNPhnD61--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://i.imgur.com/NapDP6a.png)

That's all Folks!  
[![https://vignette.wikia.nocookie.net/looneytunes/images/a/a4/THAT'SALLGIFS.gif/revision/latest/scale-to-width-down/260?cb=20160806162644](https://res.cloudinary.com/practicaldev/image/fetch/s--8Me1SCFM--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_66%2Cw_880/https://vignette.wikia.nocookie.net/looneytunes/images/a/a4/THAT%27SALLGIFS.gif/revision/latest/scale-to-width-down/260%3Fcb%3D20160806162644)](https://res.cloudinary.com/practicaldev/image/fetch/s--8Me1SCFM--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_66%2Cw_880/https://vignette.wikia.nocookie.net/looneytunes/images/a/a4/THAT%27SALLGIFS.gif/revision/latest/scale-to-width-down/260%3Fcb%3D20160806162644)

> "Hey! not so fast..."

OK! I hear some of you who had followed [Red.For.Hopeless.Programmers.I](https://dev.to/lepinekong/Red-for-hopeless-programmers---part-i-3g0):

> How to connect the database to the UI?!

It's not about CRUD per se so It's not part of the contract: you can do it yourself as good exercice 😊

> Grr!!!

OK binding GUI with data is not something trivial in any programming language even in Red. You can try to do it by yourself  
or wait for a next tutorial as I said on Reactive Programming (you can do without it's as hard as doing it in Visual Basic but I'm too lazy to do so as for me).  
But the concept is not yet clear even in my head, that's why I don't feel like explaining it for now.

### [](#relating-links)Relating links

- [Red for hopeless programmers - Part I | dev.to](https://dev.to/lepinekong/red-for-hopeless-programmers---part-i-3g0)
- [Red for hopeless programmers - Part II | dev.to](https://dev.to/lepinekong/red-for-hopeless-programmers---part-ii-258)
