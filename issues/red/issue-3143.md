
#3143: trim/lines resulting in vertical block
================================================================================
Issue is closed, was reported by Phryxe and has 4 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/3143>

### Expected behavior
```
x: {
    a? 
    b ,
    c .
    d; 
    e
}
replace/all x charset ",.;?" ""
trim/lines x
x: split x " "
== ["a" "b" "c" "d" "e"]
```
### Actual behavior
Not sure if this is a feature or something that might cause trouble later on.
```
x: {
    a? 
    b ,
    c .
    d; 
    e
}
replace/all x charset ",.;?" ""
trim/lines x
x: split x " "
== [
    "a" 
    "b" 
    "c" 
    "d" 
    "e"
]
```
### Steps to reproduce the problem
Paste code in console. A string without linebreaks doesn't result in vertical block.
### Red version and build date, operating system with version.
- Red for Windows version 0.6.3 built 14-Dec-2017/21:27:14+01:00
- Win 7 x64
- Win 10


Comments:
--------------------------------------------------------------------------------

On 2017-12-14T21:40:19Z, greggirwin, commented:
<https://github.com/red/red/issues/3143#issuecomment-351844125>

    Also, FORMing the string before splitting clears the markers:
    ```
    >> x: {
    {        a? 
    {        b ,
    {        c .
    {        d; 
    {        e
    {    }
    == {^/    a? ^/    b ,^/    c .^/    d; ^/    e^/}
    >> replace/all x charset ",.;?" ""
    == {^/    a ^/    b ^/    c ^/    d ^/    e^/}
    >> trim/lines x
    == "a b c d e"
    >> x: split form x " "
    == ["a" "b" "c" "d" "e"]
    ```

--------------------------------------------------------------------------------

On 2019-08-20T16:40:55Z, dockimbel, commented:
<https://github.com/red/red/issues/3143#issuecomment-523096718>

    It's a lexer issue, not related to `trim/lines`.

