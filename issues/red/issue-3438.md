
#3438: Very long bitset and corresponding binary are differently molded and/or printed
================================================================================
Issue is closed, was reported by meijeru and has 34 comment(s).
[status.built]
<https://github.com/red/red/issues/3438>

### Expected behavior

bitset and underlying binary, when too long to print (mold) conveniently, should be similarly abridged, with ellipsis
### Actual behavior
bitset is differently molded from binary, and binary is printed with ellipsis, whereas bitset is not
>> b: charset ""
== make bitset! #{00}
>> b/(11FFFFh): true
== true
>> to-hex length? b 
== #00120000
>> b
== make bitset! #{0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
>> to-binary b
== #{
0000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000...
>> length? mold b
== 294928
>> length? mold to-binary b
== 299524

The difference in length is not explained by the presence of `make bitset!` which is absent from the molded binary, on the contrary, the molded binary is longer.
### Steps to reproduce the problem
execute above code
### Red and platform version
```
presumably all (tested only on W10)
```


Comments:
--------------------------------------------------------------------------------

On 2018-06-24T00:18:56Z, greggirwin, commented:
<https://github.com/red/red/issues/3438#issuecomment-399719269>

    Good catch. Bitsets do have their own special formatter internally, but mold and form the same, so fixing `form` will handle both. Not clear on the ellipsis problem source at a glance. It's the same in CLI or GUI console.

--------------------------------------------------------------------------------

On 2018-07-18T04:21:21Z, bitbegin, commented:
<https://github.com/red/red/issues/3438#issuecomment-405804304>

    I have fixed `mold/part bitset! limit` issue.
    The `mold bitset!` include "make bitset!" header, and mold binary! has `lf` at 64x positon, so their `length? mold` should not be equel.

--------------------------------------------------------------------------------

On 2018-07-18T04:26:27Z, bitbegin, commented:
<https://github.com/red/red/issues/3438#issuecomment-405804913>

    ```
    >> b: charset "^(11FFFF)"
    == make bitset! #{0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000...
    >> to-hex length? b
    == #00120000
    >> b
    == make bitset! #{0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000...
    >> to-binary b
    == #{
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000...
    >> length? mold b
    == 294928
    >> length? mold to-binary b
    == 299524
    >> 
    ```

--------------------------------------------------------------------------------

On 2018-07-18T13:33:27Z, meijeru, commented:
<https://github.com/red/red/issues/3438#issuecomment-405932253>

    Is there a compelling reason why a molded bitset should not follow the format of a molded binary? In other words, why not have a lf every 64 characters in a molded bitset also? This should also save some code. 

--------------------------------------------------------------------------------

On 2018-07-18T19:39:19Z, greggirwin, commented:
<https://github.com/red/red/issues/3438#issuecomment-406049835>

    @meijeru, at a glance, it won't save code. Bitset forming uses different logic (nibble based, and accounting for inversion (`not`)) than binary. But I agree that breaking into lines would be nicer and more consistent. No more helpful though. :^) Worth a low priority wish ticket. 

--------------------------------------------------------------------------------

On 2018-07-19T07:39:39Z, bitbegin, commented:
<https://github.com/red/red/issues/3438#issuecomment-406184608>

    `The primary importance of mold is to produce strings that can be reloaded with load.` -- from rebol doc.
    So bitset! need have a diffent header with other datatypes, to allow `load` to load it's literal value. 
    
    string! and bitset! type are molded and matched to console's width, the console can control their display.

--------------------------------------------------------------------------------

On 2018-07-19T09:50:01Z, meijeru, commented:
<https://github.com/red/red/issues/3438#issuecomment-406220753>

    I see from your log above that binary! type is indeed molded to console's width! But could bitset! please also?

--------------------------------------------------------------------------------

On 2018-09-05T21:26:23Z, endo64, commented:
<https://github.com/red/red/issues/3438#issuecomment-418886954>

    > I see from your log above that binary! type is indeed molded to console's width! But could bitset! please also?
    
    @meijeru In latest version bitset!s also molded to console's width.

--------------------------------------------------------------------------------

On 2018-09-06T15:12:06Z, meijeru, commented:
<https://github.com/red/red/issues/3438#issuecomment-419131516>

    I notice that the molded bitset fills the width of the console, and that the molded binary is printed in groups of 64 which get wrapped on smaller widths. But don't that let you stop closing this...

--------------------------------------------------------------------------------

On 2018-09-06T16:08:30Z, Oldes, commented:
<https://github.com/red/red/issues/3438#issuecomment-419151552>

    It is not fixed correctly!
    ```
    >> b: charset "^(11FFFF)"
    == make bitset! #{0000000000000000000000000000000000000000000000000000...
    >> mold b: charset "^(11FFFF)"
    == {make bitset! #^{0000000000000000000000000000000000000000000000000000
    ```
    The mold should not be truncated!
    Same with binary:
    ```
    >> mold #{00000000000000000000000000000000000000000000000000000000000000000000}
    == {#^{^/0000000000000000000000000000000000000000000000000000000000000000^
    ```

--------------------------------------------------------------------------------

On 2018-09-06T16:55:55Z, greggirwin, commented:
<https://github.com/red/red/issues/3438#issuecomment-419166624>

    Is this the fault of bitset molding, or `mold` itself in the console?
    ```
    >> b: charset "^(11FFFF)"
    == make bitset! #{00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000...
    >> mold b: charset "^(11FFFF)"
    == {make bitset! #^{00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
    >> append/dup copy "" "abc" 100
    == {abcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabca...
    >> mold append/dup copy "" "abc" 100
    == {^{abcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabca
    ```

--------------------------------------------------------------------------------

On 2018-09-06T19:55:41Z, meijeru, commented:
<https://github.com/red/red/issues/3438#issuecomment-419221005>

    Must be the latter one, by all accounts.

--------------------------------------------------------------------------------

On 2018-09-07T01:36:07Z, bitbegin, commented:
<https://github.com/red/red/issues/3438#issuecomment-419292806>

    probe b and print mold b are good

--------------------------------------------------------------------------------

On 2018-09-07T08:44:13Z, Oldes, commented:
<https://github.com/red/red/issues/3438#issuecomment-419368364>

    `mold` is ok... the console is over truncating... simply truncates the string created by `mold`. Don't know if it is good or not.. for sure the output looks buggy on the first look. Especially when it escapes chars like `{` and `LF`.

--------------------------------------------------------------------------------

On 2018-09-07T08:46:35Z, Oldes, commented:
<https://github.com/red/red/issues/3438#issuecomment-419368969>

    If nothing else, there should be `...` at the end of the truncated string. Now it is missing:
    ```
    >> {#{0000000000000000000000000000000000000000000000000000000000000000000000000000}}
    == {#^{000000000000000000000000000000000000000000000000000000000000000000000000
    ```

--------------------------------------------------------------------------------

On 2018-09-07T15:59:48Z, greggirwin, commented:
<https://github.com/red/red/issues/3438#issuecomment-419485712>

    Agreed.

--------------------------------------------------------------------------------

On 2018-10-29T09:21:16Z, qtxie, commented:
<https://github.com/red/red/issues/3438#issuecomment-433839783>

    Added `...` at the end of the truncated string.

