
#1090: Error when marshalling routine data, seen with "print" but not with "prin"
================================================================================
Issue is closed, was reported by jamie255 and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1090>

Using 0.5.2. Looking at the last two lines of the script (when compiled) the output is fine with 'prin count' but gives an error with 'print [count "rows processed"]'. This example is derived from examples/do-sql.red of Kaj de Vos SQLite binding.

```
Red []
#system-global [
  data!: alias struct! [
     count         [integer!]
  ]
  data:         declare data!]
begin: routine [] [
       data/count: 0]
count: routine [
       return:  [integer!]][
    data/count]
begin
prin count print " rows processed"
print [count "rows processed"]
```

0 rows processed
**\* Script error: invalid function definition: thru
**\* Where: count
**\* Stack: print count



Comments:
--------------------------------------------------------------------------------

On 2015-04-08T21:14:35Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/1090#issuecomment-91039076>

    Good find. This breaks a lot of my code.

