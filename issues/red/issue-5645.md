# Issue #5645: Negated charset generation is bugged, affecting CSV
<https://github.com/red/red/issues/5645>

**Describe the bug**

I specify delimiter right out of the data string, but it is not respected:
```
>> csv: {5641§OPEN§LOAD-CSV returns error instead of throwing it§status.duplicate§2025-08-19T13:00:07Z}
== {5641§OPEN§LOAD-CSV returns error instead of throwing it§status.dupl...
>> data: load-csv/with csv csv/5
== [[{5641§OPEN§LOAD-CSV returns error instead of throwing it§status.du...
>> length? data/1
== 1
```

**To reproduce**
```
csv: {5641§OPEN§LOAD-CSV returns error instead of throwing it§status.duplicate§2025-08-19T13:00:07Z}
data: load-csv/with csv csv/5
length? data/1
```

**Expected behavior**

`length? data` should be 4

**Platform version**

`Red 0.6.6 for Windows built 13-Jul-2025/21:27:17+08:00  commit #31205e5`



## greggirwin on 2025-10-03T23:37:57Z
Looks to be an issue with `not`-based charsets.
```
>> quote-char
== #"^""
>> delimiter
== #"§"

; Just changing the order of delim and quote
>> reduce ['not append append copy "^/^M" delimiter quote-char]
== [not {^/^M§"}]
>> reduce ['not append append copy "^/^M" quote-char delimiter]
== [not {^/^M"§}]

; OK
>> charset reduce [append append copy "^/^M" delimiter quote-char]
== make bitset! #{002400002000000000000000000000000000000001}
>> charset reduce [append append copy "^/^M" quote-char delimiter]
== make bitset! #{002400002000000000000000000000000000000001}

; Different result!
>> charset reduce ['not append append copy "^/^M" delimiter quote-char]
== make bitset! [not #{002400000000000000000000000000000000000000}]
>> charset reduce ['not append append copy "^/^M" quote-char delimiter]
== make bitset! [not #{002400002000000000000000000000000000000000}]
```


## greggirwin on 2025-10-03T23:44:07Z
```
>> charset reduce ['not append append copy "" quote-char delimiter]
== make bitset! [not #{000000002000000000000000000000000000000000}]
>> charset reduce ['not append append copy "" delimiter quote-char]
== make bitset! [not #{000000000000000000000000000000000000000000}]

>> charset reduce ["§"]
== make bitset! #{000000000000000000000000000000000000000001}
>> charset reduce ['not "§"]
== make bitset! [not #{000000000000000000000000000000000000000000}]
```


## greggirwin on 2025-10-03T23:59:52Z
String has the problem, char is OK.
```
>> charset [not "§"]
== make bitset! [not #{000000000000000000000000000000000000000000}]
>> charset [not #"§"]
== make bitset! [not #{000000000000000000000000000000000000000001}]
```


## greggirwin on 2025-10-04T00:11:23Z
`repeat i 260 [print [i form to char! i  newline tab charset reduce [form to char! i]  newline tab charset reduce ['not form to char! i]]]`

Problem starts at 129.



## greggirwin on 2025-10-04T00:23:03Z
So it looks like the fix in CSV, in the meantime, is just to replace
```
valchars: charset reduce ['not append append copy "^/^M" delimiter quote-char]
```
with
```
valchars: charset reduce ['not "^/^M" delimiter quote-char]
```

```
>> charset reduce ['not append append copy "^/^M" delimiter quote-char]
== make bitset! [not #{002400000000000000000000000000000000000000}]

>> charset reduce ['not "^/^M" delimiter quote-char]
== make bitset! [not #{002400002000000000000000000000000000000001}]
```


## greggirwin on 2025-10-04T00:25:34Z
```
>> csv: {5641§OPEN§LOAD-CSV returns error instead of throwing it§status.duplicate§2025-08-19T13:00:07Z}
== {5641§OPEN§LOAD-CSV returns error instead of throwing it§status.duplicate§2025-08-19T13:00:07Z}
>> data: load-csv/with csv csv/5
== [["5641" "OPEN" "LOAD-CSV returns error instead of throwing it" "status.duplicate" "2025-08-19T13:00:07Z"]]
>> length? data/1
== 5
```


