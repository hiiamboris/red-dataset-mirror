# Extended help (kept in html files)

## Short info:

Help (description, examples) are in html files. You can read it in the browser (javascript required for deleting spaces in the code part) or using Red's functions.
It is in the "can I use html to keep examples, description etc" state. I am not html/css/js expert but the pages should be readable.

## Features and more technical info:

I am keeping each refinement (or lack of it) in a separate `<section>`.   
Its `id` is a string in the form: `function-name[optional list of refinements]` where:
- `[optional list of refinements]`refinements in the alpahbetic order with "/" preceding each refinements

Examples: `foo`, `foo/baz`, `foo/baz/qux`.  
`foo/qux/bar` is wrong because refinements are not in the alphabetic order.

A code is in the `<code>`.
An output is in the `<samp>`.
A description is in the `<div class="description">`.

Each `function` is in the `documentation/<language>/<function>/<function>.html`. For example `documentation/en/pad/pad.html`.

## Future/questions:

### Tags

I am using HTML5 tags. I want to use unknown tags but I am not sure if it is good things to do.
According to [the answer from the stackoverflow](https://stackoverflow.com/questions/10830682/is-it-ok-to-use-unknown-html-tags/27869027#27869027) it is ok to use unknown tags. 
For example I would like to wrap each example (code and output) into `<example>`. 

### Versioning

Source files (html) and their translations should have version and/or modification date. 
I would like to use `<meta>` 
- 1) `<meta name="source-change-data" content="2019-06-05:12:01:01">`
- 2) `<meta name="source-version" content="0.0.1">`
- 3) `<meta name="translation-change-data" content="2019-06-05:12:01:01">`
- 4) `<meta name="translation-version" content="0.0.1">`

Each translation should have all 4 `<meta>`.

I am not sure about this. Is this ok. Is there a better way to do it? How you would like to do this with html files?

## Examples:
```
    >> do %main.red
    
    >> example a-an
    ############# Code: #############
    a-an "foo"
    ############ Output: ############
    "a"

    >> example/return-as-map	a-an
    == #(
        code: {a-an "foo"}
        output: {"a"}
    )   
    
    >> extended-help-ctx/language: 'pl
    == pl
    >> example a-an
    ############# Code: #############
    a-an "foo" || PL
    ############ Output: ############
    "a"
    
    >> description a-an 
    Zwraca "a" albo "an".
    
    >> extended-help-ctx/language: 'en
    == en
    
    >> description pad
    Pad a FORMed value on right side with spaces.
    
    >> example pad
    ############# Code: #############
    pad "abc" 10
    ############ Output: ############
    "abc       "
    
    >> example pad/left
    ############# Code: #############
    pad/left "abc" 10
    ############ Output: ############
    "       abc"
    
    >> example pad/left/with
    ############# Code: #############
    pad/left/with "abc" 10 #"*"
    ############ Output: ############
    "*******abc"
    
    >> example pad/with/left
    ############# Code: #############
    pad/left/with "abc" 10 #"*"
    ############ Output: ############
    "*******abc"
```

## License:

See [license.md](/license.md)
