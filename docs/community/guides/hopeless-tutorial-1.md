Original URL: <https://dev.to/lepinekong/red-for-hopeless-programmers---part-i-3g0>

# Red for hopeless programmers - Part I

lepinekong

* * *

[![lepinekong](https://media2.dev.to/dynamic/image/width=50,height=50,fit=cover,gravity=auto,format=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fuploads%2Fuser%2Fprofile_image%2F19626%2F30357b7a-e7a6-4f2f-9935-34428847c48e.png)](https://dev.to/lepinekong)

[lepinekong](https://dev.to/lepinekong)

Posted on Nov 7, 2017 • Edited on Mar 27, 2018

![](https://assets.dev.to/assets/sparkle-heart-5f9bee3767e18deb1bb725290cb151c25234768a0e9a2bd39370c382d02920cf.svg)   ![](https://assets.dev.to/assets/multi-unicorn-b44d6f8c23cdd00964192bedc38af3e82463978aa611b4365bd33a0f1f4f3e97.svg)   ![](https://assets.dev.to/assets/exploding-head-daceb38d627e6ae9b730f36a1e390fca556a4289d5a41abb2c35068ad3e2c4b5.svg)   ![](https://assets.dev.to/assets/raised-hands-74b2099fd66a39f2d7eed9305ee0f4553df0eb7b4f11b01b6b1b499973048fe5.svg)   ![](https://assets.dev.to/assets/fire-f60e7a582391810302117f987b22a8ef04a2fe0df7e3258a5f49332df1cec71e.svg)  

[Part II](https://dev.to/lepinekong/red-for-hopeless-programmers---part-ii-258) is available.

So you wanna learn to code ? You tried hard to tackle C++, C#, Java or even Python or Javascript but soon realise you still can't do any practical stuff like reading historical quotes from Google Finance to analyse your favorite stocks or just creating a simple recipes database for your mom or teach your own kid how to program.

You hopelessly gave up, happily I'm a great soul and want to save you from despair thanks to a little gem : Red.

## [](#what-is-red-)What is Red ?

Because you're in a hurry, I'll tell you shortly that [Red](https://www.red-lang.org/) (download it [here](https://www.red-lang.org/p/download.html)) is a new programming language which is strongly compatible with a not so new programming language named Rebol. So if you're searching for some answers on Red, you may search for Rebol also.

The reasons why Rebol is so unknown are unfortunate, I could extend on these but another time maybe. Be assured that after reading this tutorial, you'd probably agree it deserves better recognition - though JSON's inventor, Douglas Crockford, made a great tribute to Carl Sassenrath \[[http://www.rebol.com/cgi-bin/blog.r?view=0423](http://www.rebol.com/cgi-bin/blog.r?view=0423)], Rebol's Creator (who'd also been Amiga's OS Architect).

## [](#what-amazing-stuffs-youll-learn-here)What amazing stuffs you'll learn here

You'll learn these practical stuffs :

1. How to download historical quotes from Google Finance (part I)
2. How to easily do webscraping in a few lines instead of dozens in others languages ([part II](https://dev.to/lepinekong/red-for-hopeless-programmers---part-ii-258))
3. How to create a simple to-do-list or recipes database app for your mom (part III)
4. How to send keystrokes to automate your favorite windows's application (part IV)

## [](#getting-started)Getting Started

To get started:

1. Download Red Language Platform for Windows from \[[http://www.red-lang.org/p/download.html](http://www.red-lang.org/p/download.html)]. You can try other platforms like MacOSX or Linux on your own because I haven't tested them yet.
2. Install Red
3. Launch Red

[![Red Console](https://res.cloudinary.com/practicaldev/image/fetch/s--3B_inlZq--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://thepracticaldev.s3.amazonaws.com/i/ixhuw8gyqq9ky0djma67.png)](https://res.cloudinary.com/practicaldev/image/fetch/s--3B_inlZq--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://thepracticaldev.s3.amazonaws.com/i/ixhuw8gyqq9ky0djma67.png)

You'll then be in Red Console where you can directly type the program below.

## [](#how-to-download-historical-quotes-from-google-finance)How to download historical quotes from Google Finance

In plain english, the steps are :

1. Read the url to get the quotes
2. Memorize the quotes in a memory variable
3. Write the quotes contained in the variable to a csv file

You can literally translate that into Red code by typing the code below in Red Console (if you're too lazy, you can also just copy and paste them into red console):

```
; 1. Read the url to get the quotes

Read http://finance.google.com/finance/historical?output=csv&q=AAPL 

; 2. Memorize the quotes in a memory variable

quotes: Read http://finance.google.com/finance/historical?output=csv&q=AAPL 

; 3. Write the quotes contained in the variable to a csv file

write %quotes.csv quotes

```

So a few remarks:

- In Red, you can put a comment in the code with ";"
- To assign a content or value to a variable, use ":" after the variable name
- A file path must be prefixed with % for example %quotes.csv
- Steps 1 &amp; 2 can be done in one single step in Red so that the program is just:

```
; 1&2. Read the quotes url & Memorize the quotes in a memory variable

quotes: Read http://finance.google.com/finance/historical?output=csv&q=AAPL 

; 3. Write the quotes contained in the variable to a csv file

write %quotes.csv quotes

```

You can check in Red current directory that quotes.csv is there. To know that current directory, type

## [](#how-to-choose-the-start-date)How to choose the start date

You may want to download quotes only after some start date. In that case, you can ask that input to the user (when you use ask, you must paste only one line at a time, to erase console use "Ctrl L" while maintaining Ctrl Key):

```
url-base: http://finance.google.com/finance/historical?output=csv&q=AAPL

start-date: ask {Start date (YYYY-MM-DD): }

url: rejoin [url-base {&startdate=} start-date]

quotes: Read url

write %quotes.csv quotes

```

[![Ask-Date](https://res.cloudinary.com/practicaldev/image/fetch/s--iaUjahRc--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://thepracticaldev.s3.amazonaws.com/i/izp0j0twr5564s4lef39.png)](https://res.cloudinary.com/practicaldev/image/fetch/s--iaUjahRc--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://thepracticaldev.s3.amazonaws.com/i/izp0j0twr5564s4lef39.png)

Explanations:

- Why did I use {} instead of "" to represent a string value ? Actually you could use "" in Red but {} is more powerfull as it can contain multiple lines string and embed both "" and {} inside it for example:

```
Explanation: {Why did I use {} instead of "" to represent a string value ? 
In fact you can use "" in Red but {} is more powerfull 
as it can contain multiple lines string and embed both "" and {} inside it}
```

In other programming languages you often have to use so-called "escape sequences" to include double quote " or single quote '.

- To concatenate strings you can use rejoin like in the example:

```
url: rejoin [url-base {&startdate=} date]
```

Rejoin argument must be enclosed within a block delimited by \[]

## [](#exercice-ask-users-inputs-for-stock-symbol-start-date-and-end-date)Exercice: Ask user's inputs for Stock symbol, Start date and End date

You can now do a similar exercice with Symbol, Start-Date and End-Date as parameter:

```
Read http://finance.google.com/finance/historical?output=csv&q={stock-symbol}&startdate={start-date}&enddate={end-date}

```

## [](#how-to-show-a-dialog-box-for-asking-users-inputs)How to show a Dialog Box for asking user's inputs

Instead of using "Ask" function in the console for user's inputs, you could use a Dialog Box.

The most basic dialog box in Red is just an empty block you can name whatever you like (avoid form though as it is a standard function \[[http://www.rebol.com/docs/words/wform.html\]](http://www.rebol.com/docs/words/wform.html%5D)), for example win like window:

It won't shows up until you use view command:

[![Empty Form](https://res.cloudinary.com/practicaldev/image/fetch/s--Hxa5F43A--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://thepracticaldev.s3.amazonaws.com/i/d4zkrp51ros25mlt0ob6.png)](https://res.cloudinary.com/practicaldev/image/fetch/s--Hxa5F43A--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://thepracticaldev.s3.amazonaws.com/i/d4zkrp51ros25mlt0ob6.png)

The reason being you can compose your form beforehand and only when it's complete, you'll show the form layout to the end user.

So let's compose our layout: we need

- 1 stock symbol field
- 2 dates fields (start date and end date)
- 1 OK button

The simplest version of form is:

```
win: []

append win [field field field button]

view win

```

[![Basic Form](https://res.cloudinary.com/practicaldev/image/fetch/s--T1-B4iaV--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://thepracticaldev.s3.amazonaws.com/i/ylcattzxuyzot432mijq.png)](https://res.cloudinary.com/practicaldev/image/fetch/s--T1-B4iaV--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://thepracticaldev.s3.amazonaws.com/i/ylcattzxuyzot432mijq.png)

A nicer window with labels (with text keyword) and vertical alignment (with return keyword) is:

```
win: []

append win [text "stock symbol:"]

append win [field]

append win [return]

append win [text "start date:"]

append win [field]

append win [return]

append win [text "end date:"]

append win [field]

append win [return]

append win [button "OK"]

view win

```

[![Nicer Form](https://res.cloudinary.com/practicaldev/image/fetch/s--pPWsQ5aj--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://thepracticaldev.s3.amazonaws.com/i/1u5vq4lzi4hlrbx0h1hx.png)](https://res.cloudinary.com/practicaldev/image/fetch/s--pPWsQ5aj--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://thepracticaldev.s3.amazonaws.com/i/1u5vq4lzi4hlrbx0h1hx.png)

If you don't need to generate your window dynamically (which is very usefull in real application that's why I showed you that way first), you can just compose your form in compact static way:

```
win: [
    text "stock symbol:" field
    return
    text "start date:" field
    return
    text "end date:" field
    return
    button "OK"
]
view win

```

[![Nicer Form Compact](https://res.cloudinary.com/practicaldev/image/fetch/s--bL8KT8cs--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://thepracticaldev.s3.amazonaws.com/i/rg76swae9y1rn5xzyt1e.png)](https://res.cloudinary.com/practicaldev/image/fetch/s--bL8KT8cs--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://thepracticaldev.s3.amazonaws.com/i/rg76swae9y1rn5xzyt1e.png)

Now when clicking on the "OK" button, the form must close with "unview" so modify the code line by adding a block code like this :

so that the full code is now:

```
win: [
    text "stock symbol:" field
    return
    text "start date:" field
    return
    text "end date:" field
    return
    button "OK" [unview]
]
view win

```

When the windows closes, you have to get the text value of each field, so you have to name these fields first to be able to refer to them in button "OK" code block:

```
win: [
    text "stock symbol:" stock-symbol: field
    return
    text "start date:" start-date: field
    return
    text "end date:" end-date: field
    return
    button "OK" [
        unview 
        print [stock-symbol/text start-date/text end-date/text]
    ]
]
view win

```

Above for testing purpose, we're just printing the values in console with

```
    print [stock-symbol/text start-date/text end-date/text]

```

/text for a field means we're refering to the text property value of the field.

[![fields values](https://res.cloudinary.com/practicaldev/image/fetch/s--D3umZo-5--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://thepracticaldev.s3.amazonaws.com/i/puoe4ev95pl0d4d6e13x.png)](https://res.cloudinary.com/practicaldev/image/fetch/s--D3umZo-5--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://thepracticaldev.s3.amazonaws.com/i/puoe4ev95pl0d4d6e13x.png)

After clicking the OK button, the console should print the values of the fields:

[![test ok](https://res.cloudinary.com/practicaldev/image/fetch/s--m4HQble4--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://thepracticaldev.s3.amazonaws.com/i/m1qsexuh32xleagxysh5.png)](https://res.cloudinary.com/practicaldev/image/fetch/s--m4HQble4--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://thepracticaldev.s3.amazonaws.com/i/m1qsexuh32xleagxysh5.png)

We can now replace the print instruction with the code for downloading the quotes.

For that purpose we'll call a function named "download-quotes" by passing the stock-symbol, the start-date and the end-date:

```
;ask user's inputs:
win: [
    text "stock-symbol" stock-symbol: field
    return
    text "start-date" start-date: field
    return
    text "end-date" end-date: field
    return
    button "OK" [
        unview 
        quotes: download-quotes stock-symbol/text start-date/text end-date/text
        write %quotes.csv quotes
        print "quotes.csv"
    ]
]
view win

;downloading quotes:

download-quotes: function[stock-symbol start-date end-date][

    url-base: http://finance.google.com/finance/historical?output=csv

    url: rejoin [url-base {&q=} stock-symbol 
                {&startdate=} start-date 
                {&enddate=} end-date]

    quotes: Read url    
    return quotes
]

```

That's all Folks for part I. If you like this tutorial, I may start part II soon :)

## [](#references)References

- Rebol Read function \[[http://www.rebol.com/docs/words/wread.html](http://www.rebol.com/docs/words/wread.html)]
- Rebol Write function \[[http://www.rebol.com/docs/words/wwrite.html](http://www.rebol.com/docs/words/wwrite.html)]
- How to Create and Use Text Fields \[[http://www.rebol.com/how-to/fields.html](http://www.rebol.com/how-to/fields.html)]
- A Beginner's Guide to REBOL Visual Interfaces (VID) \[[http://rebol.com/docs/easy-vid.html](http://rebol.com/docs/easy-vid.html)]
- REBOL/View VID Developer's Guide \[[http://www.rebol.com/docs/view-guide.html](http://www.rebol.com/docs/view-guide.html)]
