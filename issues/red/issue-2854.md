
#2854: Wish: timezone should be denotable by h:m, as normal time values allow.
================================================================================
Issue is closed, was reported by meijeru and has 10 comment(s).
<https://github.com/red/red/issues/2854>

Currently, the minute part is constrained to be two digits, which makes for special parsing.


Comments:
--------------------------------------------------------------------------------

On 2017-07-06T15:32:32Z, dockimbel, commented:
<https://github.com/red/red/issues/2854#issuecomment-313432050>

    Given that only ":30" could use such shorter notation, I don't think it is worth supporting a shorter form for minutes. Though, if the cost for such change is very small, I will consider it.

--------------------------------------------------------------------------------

On 2017-07-06T15:38:56Z, meijeru, commented:
<https://github.com/red/red/issues/2854#issuecomment-313433954>

    Mind you, also :15 and :45 occur in the real world (admittedly they are rare). Your encoding in 7 bits allows values from -15:45 to +15:45, while only -12:00 to +14:00 are needed, but that is not checked. Also, I have noticed that times of 16:00 and higher are taken modulo 16:00.

--------------------------------------------------------------------------------

On 2017-07-06T18:06:12Z, dockimbel, commented:
<https://github.com/red/red/issues/2854#issuecomment-313474452>

    > Mind you, also :15 and :45 occur in the real world (admittedly they are rare). 
    
    How can :15 of :45 use a h:m notation? My point is, among the possible values, only :30 can use such shorter notation (I don't count :00 as it can be wholly omitted).

--------------------------------------------------------------------------------

On 2017-07-06T18:26:16Z, meijeru, commented:
<https://github.com/red/red/issues/2854#issuecomment-313479778>

    I was just, as usual for me, going for consistency, as the zone is a time value, and time values _on their own_ can use h:m. Thus you might invoke the time-rule for the parsing of the time zone. But I agree this is probably not worth bothering.

--------------------------------------------------------------------------------

On 2017-07-07T03:13:45Z, dockimbel, commented:
<https://github.com/red/red/issues/2854#issuecomment-313576177>

    There is no full equivalence between time in date! and in time! anyway, time! can be negative while date/time cannot.

