
#5621: Unicode strings with surrogate pairs should be normalized
================================================================================
Issue is open, was reported by Oldes and has 4 comment(s).
<https://github.com/red/red/issues/5621>

It is possible to convert UTF-8 input with surrogate codes to Red string, which is fine, but these codes should be normalized.
```red
>> to-string #{F09F9880}
== "😀" ;<--- ok
>> to-string #{EDA0BD EDB880}
== "😀" ;<--- looks same like the above
>> first to-string #{EDA0BD EDB880}
== #"?" ;<--- invalid, because it is just higher part of the surrogate pair
>> first to-string #{F09F9880}
== #"😀" ;<--- expected
```
Expected results:
```red
to-binary to-string #{EDA0BD EDB880}
;== #{F09F9880} ;<--- surrogate pair should be normalized

first to-string #{EDA0BD EDB880}
;== #"😀" 

length? to-string #{EDA0BD EDB880}
;== 1
```



Comments:
--------------------------------------------------------------------------------

On 2025-06-21T19:14:53Z, dockimbel, commented:
<https://github.com/red/red/issues/5621#issuecomment-2993730189>

    Relevant SO entry: https://stackoverflow.com/questions/63574794/converting-denormalized-characters-with-utf8string?noredirect=1&lq=1
    
    CESU-8 format: https://en.wikipedia.org/wiki/CESU-8
    
    > CESU-8 is not an official part of the Unicode Standard, because Unicode Technical Reports are informative documents only.[2] It should be used exclusively for internal processing and never for external data exchange.
    
    > Supporting CESU-8 in HTML documents is prohibited by the W3C[3][4] and WHATWG[5] HTML standards, as it would present a cross-site scripting vulnerability.[6][failed verification – see discussion]
    
    So, binary series like `#{EDA0BD EDB880}` are not valid UTF-8 format. They are in CESU-8 format which we don't support. That format looks like an anomaly resulting from naive (and improper) conversion of UTF-16 surrogate pairs to UTF-8.
    
    So, I don't think we should support such erroneous format.

--------------------------------------------------------------------------------

On 2025-07-22T09:23:25Z, Oldes, commented:
<https://github.com/red/red/issues/5621#issuecomment-3101841454>

    If `#{EDA0BD EDB880}` is not valid then there should be an error when converting it to the string.. or it should be normalized, which is the way I choose in Rebol. 

