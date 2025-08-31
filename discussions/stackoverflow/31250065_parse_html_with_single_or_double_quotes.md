# parse html with single or double quotes

**Link:**
<https://stackoverflow.com/questions/31250065/parse-html-with-single-or-double-quotes>

**Asked:** 2015-07-06 15:42:58 UTC

------------------------------------------------------------------------

When using the `parse` dialect, how to parse tags that have properties
enclosed by `'` or \'\"\`, as in:

    thru <h2 class="txt-medium txt-bold">

    thru <h2 class='txt-medium txt-bold'>

One way was to do:

    thru {<h2 class=} thru {txt-medium txt-bold} thru ">"

Tried to use the `|` or operator but with no success. Can I use the `|`
operator to parse the tag?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by rebolek

Yes, you can use `|` operator, but defining a charset is better in this
case:

    delimiter: charset [#"^"" #"'"]
    single: {<h2 class='txt-medium txt-bold'>}
    double: {<h2 class="txt-medium txt-bold">}

    >> parse single [thru "class=" delimiter copy values to delimiter thru ">"] values
    == "txt-medium txt-bold"

    >> parse double [thru "class=" delimiter copy values to delimiter thru ">"] values 
    == "txt-medium txt-bold"

The golden rule is to avoid `to` and `thru` when possible and define
what to match.

*Comment by rebolek:* This is of course simplified solution. It doesn\'t
make sure that starting delimiter matches ending one. To improve it, you
need to do something like: delimiters: charset \[#\"\^\"\" #\"\'\"\] ;
\... parse single \[thru \"class=\" set delimiter delimiters copy values
to delimiter thru \"\>\"\] values

*Comment by Luis:* The parsing in my Rebol `system/version` 3.0.0.4.40
does not return the `"txt-medium txt-bold"` as in your case. I get
`== ""`

------------------------------------------------------------------------

## Comments on question
