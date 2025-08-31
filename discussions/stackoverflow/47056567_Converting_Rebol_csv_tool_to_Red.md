# Converting Rebol csv tool to Red

**Link:**
<https://stackoverflow.com/questions/47056567/converting-rebol-csv-tool-to-red>

**Asked:** 2017-11-01 13:56:16 UTC

------------------------------------------------------------------------

I started to convert
[http://www.rebol.org/view-script.r?script=csv-tools.r](http://www.rebol.org/view-script.r?script=csv-tools.r){rel="nofollow noreferrer"}
from Rebol to Red; I\'m stuck on \"as-string\" as-binary , can\'t find
doc about them on Rebol.

        to-iso-date: func [
          "Convert a date to ISO format (Excel-compatible subset)"
          date [date!] /utc "Convert zoned time to UTC time"
        ] [
          if utc [date: date + date/zone date/zone: none] ; Excel doesn't support the Z suffix
          either date/time [ajoin [
            next form 10000 + date/year "-"
            next form 100 + date/month "-"
            next form 100 + date/day " "  ; ... or T
            next form 100 + date/time/hour ":"
            next form 100 + date/time/minute ":"
            next form 100 + date/time/second  ; ... or offsets
          ]] [ajoin [
            next form 10000 + date/year "-"
            next form 100 + date/month "-"
            next form 100 + date/day
          ]]
        ]

        to-csv: func [
          "Convert a block of values to a CSV-formatted line in a string."
          [catch]
          data [block!] "Block of values"
          delimiter [char! string! binary!] {Default ","}
          ; Empty delimiter, " or CR or LF may lead to corrupt data
        ][
          output: make block! 2 * length? data
          delimiter: either with [to-string delimiter] [","]
          unless empty? data [insert tail output format-field first data data: next data]
          foreach x data [insert insert tail output delimiter format-field get/any 'x]
          to-string output

          format-field: func [x [any-type!]] [case [
            any [not value? 'x error? get/any 'x] [throw-error 'script 'expect-set [
              [any-string! any-word! any-path! binary! scalar! date!] type? get/any 'x
            ]]
            none? :x [""]
            any-string? :x [ajoin [{"} replace/all copy x {"} {""} {"}]]
            :x == #"^(22)" [{""""}]  ; Weirdly, = and =? return true when x is 34
            char? :x [ajoin [{"} x {"}]]
            money? :x [find/tail form x "$"]
            scalar? :x [form x]
            date? :x [to-iso-date x]
            any [any-word? :x binary? :x any-path? :x] [
              ajoin [{"} replace/all to-string :x {"} {""} {"}]
            ]
            'else [throw-error 'script 'expect-set reduce [
              [any-string! any-word! any-path! binary! scalar! date!] type? :x
            ]]
          ]]
        ]

        load-csv: func [
          "Load and parse CSV-style delimited data. Returns a block of blocks."
          [catch]
          source [file! url! string! binary! block!] "File or url will be read"
          /binary "Don't convert the data to string (if it isn't already)"
          delimiter [char! string! binary!] {Default #","}
          /into "Insert into a given block, rather than make a new one"
          output [block!] "Block returned at position after the insert"
          /part "Get only part of the data, and set to the position afterwards"
          count [integer!] "Number of lines to return"
          after [any-word! none!] "Set to data at position after decoded part"
        ] [
          if block? source [ ; Many sources, load them all into the same output block
            unless into [output: make block! length? source]
            unless with [delimiter: ","]
            x: [file! url! string! binary!]
            foreach y source [
              unless find x type?/word y [
                cause-error 'script 'expect-set reduce [x type? :y]
              ]
              either binary [
                output: load-csv/binary/with/into y delimiter output
              ] [
                output: load-csv/with/into y delimiter output
              ]
            ]
            return either into [output] [head output]
          ]
          ; Read the source if necessary
          if any [file? source url? source] [throw-on-error [
            source: either binary [read/binary source] [read source]
          ]]
          unless binary [source: as-string source] ; No line conversion
          ; Use either a string or binary value emitter
          emit: either binary? source [:as-binary] [:as-string]
          ; Prep output and local vars
          unless into [output: make block! 1]
          line: [] val: make string! 0
          ; Parse rules
          valchars: remove/part charset [#"^(00)" - #"^(FF)"] crlf
          case [
            any [char? delimiter: any [delimiter ","] last? delimiter] [ ; One char
              valchars: compose [any (remove/part valchars delimiter)]
            ]
            empty? delimiter [throw-error 'script 'invalid-arg delimiter]
            'else [ ; Multi-character delimiter needs special handling
              remove/part valchars copy/part as-string delimiter 1
              valchars: compose/deep [any [
                some (valchars) | y: delimiter :y break | (first as-string delimiter)
              ]]
            ]
          ]
          value: [
            ; Value in quotes, with Excel-compatible handling of bad syntax
            {"} (clear val) x: [to {"} | to end] y: (insert/part tail val x y)
            any [{"} x: {"} [to {"} | to end] y: (insert/part tail val x y)]
            [{"} x: valchars y: (insert/part tail val x y) | end]
            (insert tail line emit copy val) |
            ; Raw value
            x: valchars y: (insert tail line emit copy/part x y)
          ]
          part: pick [ ; Rule must fail and go to the alternate in order to continue
            [end skip]  ; Will always fail, so the break won't be reached
            [(cont: if positive? count [count: count - 1 [end skip]]) cont]
            ; While count is positive, cont is set to [end skip], which will fail
            ; and go the alternate. Otherwise, cont is set to none, which will
            ; succeed, and then the subsequent break will stop the parsing.
            ; Parsing control flow can get a little convoluted at times in R2.
          ] not part
          ; as-string because R2 doesn't parse binary that well
          parse/all as-string source [z: any [
            end break | part break |
            (line: make block! length? line)
            value any [delimiter value] [crlf | cr | lf | end]
            (output: insert/only output line)
          ] z:]
          if after [set after either binary? source [as-binary z] [z]]
          also either into [output] [head output]
            (source: output: line: val: x: y: none) ; Free the locals
        ]

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by rebolek

`as-string` and `as-binary` are Rebol3 specific functions to represent
data in different format, i.e. `binary!` data as UTF-8 string. In Red,
load data as your required format with `read` for string and
`read/binary` for binary data.

You can also take a look at
[https://github.com/rebolek/red-tools/blob/master/csv.red](https://github.com/rebolek/red-tools/blob/master/csv.red){rel="nofollow noreferrer"}
for simple CSV encoder/decoder.

*Comment by rgchris:* Rebol 2-specific. Are not in Rebol 3.

------------------------------------------------------------------------

## Comments on question

*Comment by sqlab:* At first you should replace **funct** of the
original script with **function**. You can probably omit all the
as-string coercing and special handling of binary data, because Red
handles binary data probably better than Rebol.
