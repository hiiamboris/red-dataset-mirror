Original URL: <https://dev.to/lepinekong/red-for-hopeless-programmers---part-ii-258>

# Red for hopeless programmers - Part II

lepinekong

* * *

[![lepinekong](https://media2.dev.to/dynamic/image/width=50,height=50,fit=cover,gravity=auto,format=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fuploads%2Fuser%2Fprofile_image%2F19626%2F30357b7a-e7a6-4f2f-9935-34428847c48e.png)](https://dev.to/lepinekong)

[lepinekong](https://dev.to/lepinekong)

Posted on Dec 16, 2017 • Edited on Dec 18, 2017

![](https://assets.dev.to/assets/sparkle-heart-5f9bee3767e18deb1bb725290cb151c25234768a0e9a2bd39370c382d02920cf.svg)   ![](https://assets.dev.to/assets/multi-unicorn-b44d6f8c23cdd00964192bedc38af3e82463978aa611b4365bd33a0f1f4f3e97.svg)   ![](https://assets.dev.to/assets/exploding-head-daceb38d627e6ae9b730f36a1e390fca556a4289d5a41abb2c35068ad3e2c4b5.svg)   ![](https://assets.dev.to/assets/raised-hands-74b2099fd66a39f2d7eed9305ee0f4553df0eb7b4f11b01b6b1b499973048fe5.svg)   ![](https://assets.dev.to/assets/fire-f60e7a582391810302117f987b22a8ef04a2fe0df7e3258a5f49332df1cec71e.svg)  

[In part I](https://dev.to/lepinekong/red-for-hopeless-programmers---part-i-3g0), we learned how to download historical quotes from Google Finance. In part II, we'll learn how to parse datas and html files to generate a Google Chart.

## [](#simple-parsing-split-quotes-lines)Simple parsing: split quotes lines

To parse a line separated by comma just use split function:

```
lines: read/lines %quotes.csv
line: lines/2; extract 2nd line (first line is header)
quote: split line ","
```

Enter fullscreen mode Exit fullscreen mode

For a full example the file you downloaded from Google Finance is in Csv format. If you want to process it for example to calculate the 20 moving average, you have to:

1. Read the file line by line  
   meanwhile you need to skip first line of titles
2. Reverse the order of lines  
   since the original lines are sorted by descending date  
   so as to get the lines sorted by ascending date
3. Parse each line of quote,  
   by splitting each line by comma delimiter  
   and store it into quotes variable
4. You can then calculate the p=20 moving average (MA)  
   by extracting close column  
   and cumulate the value  
   then divide by number of quotes cumulated
5. Add MA to last column
6. Optionally write back to another csv file

which will translate into Red code as (you can copy and paste the whole code into Red Console if you're too lazy):

```
; init quotes variable so as to store quotes 
quotes: []
; init cum variable so as to store cumulated value of close
cum: 0
; init n variable so as to divide the cumulated value by n
n: 0

; 1. Read the quotes file line by line
lines: read/lines %quotes.csv; -> ["Date,Open,High,Low,Close,Volume" "d1,o1,h1,l1,c1,v1" "d2,o2,h2,l2,c2,v2" ...]

; meanwhile you need to skip "Date,Open,High,Low,Close,Volume" on first line 
lines: skip lines 1

; 2. Reverse the order of lines
; so as to get the lines sorted by ascending date
lines: reverse lines

; 3. Parse each line of quote
foreach line lines [

    ; splitting each line by comma delimiter
    quote: split line ","; -> [date open high low close volume]

    ;For later use if needed convert string to float open high low close volume
    i: 2; starting at column 2 (skipping date column)
    foreach column skip quote 1 [; skip first date column 
      quote/:i: to-float quote/:i; quote:i refers to the ith column of quote
      i: i + 1
    ]

    ; store it into quotes variable
    append/only quotes quote; -> [[d1 o1 h1 l1 c1 v1] [d2 o2 h2 l2 c2 v2] ...]
    ;append adds quote while evaluating expressions inside the brackets, append/only will add quote literally with bracket

    ; 4. Calculate the p=20 moving average for each line
    p: 20
    close: (to-float quote/5); quote/5: close is the 5th column of quote
    cum: cum + close
    n: n + 1
    either (n < p) [
        ma: ""; no moving average
    ][
        ma: cum / n; moving average by dividing by number of quotes cumulated
    ]

    ;5. Add MA to last column
    append quotes/:n ma; :n refer to the nth line of quotes array
    ;-> [
        ;[d1 o1 h1 l1 c1 v1 ma1] 
        ;[d2 o2 h2 l2 c2 v2 ma2] ...
    ;]
]

```

Enter fullscreen mode Exit fullscreen mode

[![parse-quotes](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fthepracticaldev.s3.amazonaws.com%2Fi%2F5kod6scrwz45tfzoxrrc.png)](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fthepracticaldev.s3.amazonaws.com%2Fi%2F5kod6scrwz45tfzoxrrc.png)

Optionally to check quotes you can type this in Red console (to clear screen you can type Ctrl+L):

```
print n: length? quotes
print quotes/:n
probe quotes/:n; will keep the brackets and formats
write-clipboard mold quotes; mold format block to string

; to output csv files
write %quotes-ma0.csv ""
write %quotes-ma1.csv ""
write %quotes-ma2.csv ""
foreach quote quotes [
  write/lines/append %quotes-ma0.csv mold quote;
  quote: form quote
  write/lines/append %quotes-ma1.csv quote; space separator
  quote: replace/all quote " " "," ; replace space by comma separator
  write/lines/append %quotes-ma2.csv quote; comma separator
]

```

Enter fullscreen mode Exit fullscreen mode

[![Check-quotes](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fthepracticaldev.s3.amazonaws.com%2Fi%2Fggoauyx1e731axicsoij.png)](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fthepracticaldev.s3.amazonaws.com%2Fi%2Fggoauyx1e731axicsoij.png)

## [](#complex-parsing-parsing-html-file)Complex parsing: parsing html file

Now let's say you want to show off your quotes with Google Candlestick Chart \[[https://developers.google.com/chart/interactive/docs/gallery/candlestickchart](https://developers.google.com/chart/interactive/docs/gallery/candlestickchart)]

You need to replace the sample data within drawChart function below with your own data:

```
<html>
    <head>
      <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
      <script type="text/javascript">
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ['Mon', 20, 28, 38, 45, 0],
        ['Tue', 31, 38, 55, 66, 0],
        ['Wed', 50, 55, 77, 80, 10],
        ['Thu', 77, 77, 66, 50, 10],
        ['Fri', 68, 66, 22, 15, 10]
        // Treat first row as data as well.
      ], true);

      var options = {
        legend:'none',
        series: {
            1: {
                type: 'line'
            }
    }    
      };

      var chart = new google.visualization.CandlestickChart(document.getElementById('chart_div'));

      chart.draw(data, options);
    }
      </script>
    </head>
    <body>
      <div id="chart_div" style="width: 100%; height: 500px;"></div>
    </body>
  </html>

```

Enter fullscreen mode Exit fullscreen mode

Steps are:

1. Store the html content in a variable
2. Search through string "var data = google.visualization.arrayToDataTable(["
3. After string above, Search for string "// Treat first row as data as well."
4. Remove sample data between the two strings
5. Insert your data between the two strings

As preliminary, you need to prepare the data in json format by copying and pasting this code in Red Console:

```
;Prepare format quotes in json format required by Google Charts
json-quotes: {}
foreach quote quotes [
  remove back back tail quote; remove volume column 2nd column from tail of quote
  quote: mold quote; format block to string
  quote: replace/all quote " " ","; replace space separator with comma
  quote: replace/all quote {""} "null"; replace empty moving average with null value
  append json-quotes quote; append quote to json
  append json-quotes ","; append json comma separator between each quote
  append json-quotes newline; append json new line separator between each quote
]

```

Enter fullscreen mode Exit fullscreen mode

[![json-quotes](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fthepracticaldev.s3.amazonaws.com%2Fi%2Fd4ocwh0x6mn292rg0zw5.png)](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fthepracticaldev.s3.amazonaws.com%2Fi%2Fd4ocwh0x6mn292rg0zw5.png)

Afterwards copy the html template above to template.html.  
You can then read and parse the html content using that rule:

```
;1. Store the html content in a variable
html-content: read %template.html

parse-rule: [

    ;2. Search through string "var data = google.visualization.arrayToDataTable(["
    thru {var data = google.visualization.arrayToDataTable([} start:

    ;3. Then search for string "// Treat first row as data as well."
    to {// Treat first row as data as well.} end:

    ; do not forget to enclose these actions between parenthesis
    ; or it won't work 
    (
      ;4. Remove sample data between the two strings
      change/part start "" end

      ;5. Insert your data between the two strings
      insert start json-quotes
    )

]

parse html-content parse-rule
write %chart.html html-content

```

Enter fullscreen mode Exit fullscreen mode

[![parse-html](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fthepracticaldev.s3.amazonaws.com%2Fi%2Fn5987l4o87g92d7ctvm8.png)](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fthepracticaldev.s3.amazonaws.com%2Fi%2Fn5987l4o87g92d7ctvm8.png)

If you run chart.html you should get this:

[![chart](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fthepracticaldev.s3.amazonaws.com%2Fi%2F87a4925rz1ooy79n8fhq.png)](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fthepracticaldev.s3.amazonaws.com%2Fi%2F87a4925rz1ooy79n8fhq.png)

Whole source code you can copy and paste in Red Console:

```

; init quotes variable so as to store quotes 
quotes: []
; init cum variable so as to store cumulated value of close
cum: 0
; init n variable so as to divide the cumulated value by n
n: 0

; 1. Read the quotes file line by line
lines: read/lines %quotes.csv; -> ["Date,Open,High,Low,Close,Volume" "d1,o1,h1,l1,c1,v1" "d2,o2,h2,l2,c2,v2" ...]

; meanwhile you need to skip "Date,Open,High,Low,Close,Volume" on first line 
lines: skip lines 1

; 2. Reverse the order of lines
; so as to get the lines sorted by ascending date
lines: reverse lines

; 3. Parse each line of quote
foreach line lines [

    ; splitting each line by comma delimiter
    quote: split line ","; -> [date open high low close volume]

    ;For later use if needed convert string to float open high low close volume
    i: 2; starting at column 2 (skipping date column)
    foreach column skip quote 1 [; skip first date column 
      quote/:i: to-float quote/:i; quote:i refers to the ith column of quote
      i: i + 1
    ]

    ; store it into quotes variable
    append/only quotes quote; -> [[d1 o1 h1 l1 c1 v1] [d2 o2 h2 l2 c2 v2] ...]
    ;append adds quote while evaluating expressions inside the brackets, append/only will add quote literally with bracket

    ; 4. Calculate the p=20 moving average for each line
    p: 20
    close: (to-float quote/5); quote/5: close is the 5th column of quote
    cum: cum + close
    n: n + 1
    either (n < p) [
        ma: ""; no moving average
    ][
        ma: cum / n; moving average by dividing by number of quotes cumulated
    ]

    ;5. Add MA to last column
    append quotes/:n ma; :n refer to the nth line of quotes array
    ;-> [
        ;[d1 o1 h1 l1 c1 v1 ma1] 
        ;[d2 o2 h2 l2 c2 v2 ma2] ...
    ;]
]


json-quotes: {}
foreach quote quotes [
  remove back back tail quote; remove volume column 2nd column from tail of quote
  quote: mold quote; format block to string
  quote: replace/all quote " " ","; replace space separator with comma
  quote: replace/all quote {""} "null"; replace empty moving average with null value
  append json-quotes quote; append quote to json
  append json-quotes ","; append json comma separator between each quote
  append json-quotes newline; append json new line separator between each quote
]


;1. Store the html content in a variable
html-content: read %template.html

parse-rule: [

    ;2. Search through string "var data = google.visualization.arrayToDataTable(["
    thru {var data = google.visualization.arrayToDataTable([} start:

    ;3. Then Search for string "// Treat first row as data as well."
    to {// Treat first row as data as well.} end:

    ; do not forget to enclose these actions between parenthesis
    ; or it won't work 
    (
      ;4. Remove sample data between the two strings
      change/part start "" end

      ;5. Insert your data between the two strings
      insert start json-quotes
    )

]

parse html-content parse-rule

write %chart.html html-content

```

Enter fullscreen mode Exit fullscreen mode
