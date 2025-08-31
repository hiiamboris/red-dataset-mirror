
#87: Make TO BITSET! <integer!> work
================================================================================
Issue is open, was reported by rebolek and has 64 comment(s).
<https://github.com/red/REP/issues/87>

Currently if you want to make `bitset!` from `integer!` value, you first need to convert it to `binary!` and optionaly skip unneded zeroes. It would be nice to avoid this unnecessary step by converting `integer!` to `bitset!` firectly, preferrably using the shortest bitset possible - 1 byte for values < 256, 2 bytes for values < 65'536, etc.

Example:

```
>> to bitset! 123
== make bitset! #{7B}
```


Comments:
--------------------------------------------------------------------------------

On 2020-11-26T09:14:02Z, loziniak, commented:
<https://github.com/red/REP/issues/87#issuecomment-734174432>

    Another intuition could be, that `to bitset! 123` is an empty bitset with 123rd bit set, like in this example:
    ```
    >> a: make bitset! 123
    == make bitset! #{00000000000000000000000000000000}
    >> a/123: 1
    == 1
    >> a
    == make bitset! #{00000000000000000000000000000010}
    ```

--------------------------------------------------------------------------------

On 2020-11-26T09:50:24Z, rebolek, commented:
<https://github.com/red/REP/issues/87#issuecomment-734194329>

    As you can already set any bit in bitset, I don'ŧ see how useful this would be. But the conversion of an integer to bitset allows you access individual bits in that integer (even if in reverse order) which is what I am aiming for. Another solution to my problem would be allowing index on integers:
    ```
    >> x: 3
    == 3
    >> x/0
    == 1
    >> x/1
    == 1
    >> x/2
    == 0
    ```

--------------------------------------------------------------------------------

On 2020-11-26T10:56:18Z, dumblob, commented:
<https://github.com/red/REP/issues/87#issuecomment-734228633>

    >Another solution to my problem would be allowing index on integers:
    
    That wouldn't account for other bases than 2 (e.g. octal, hex, etc.).

--------------------------------------------------------------------------------

On 2020-11-26T13:40:49Z, rebolek, commented:
<https://github.com/red/REP/issues/87#issuecomment-734304589>

    > That wouldn't account for other bases than 2 (e.g. octal, hex, etc.).
    
    How would such support look? You can work with hex base directly in binary, octal base is not supported in Red.

--------------------------------------------------------------------------------

On 2020-11-26T14:45:36Z, dumblob, commented:
<https://github.com/red/REP/issues/87#issuecomment-734337089>

    >How would such support look?
    
    I pointed it out as I think the concept is wrong. So to answer the question, such support should look like *no support*.
    
    I'd strongly prefer what you proposed in the initial proposal (i.e. `to bitset! 123`).
    
    >You can work with hex base directly in binary,
    
    Sure, but that's almost the same as saying, that Red doesn't need BITSET at all and one should convert numbers back and forth manually to arbitrary representation. Besides, it's less efficient and might cause issues in the future with custom types or wider range of built-in types.
    
    >octal base is not supported in Red.
    
    Who knows what you'll need tomorrow... (custom types, etc.).

--------------------------------------------------------------------------------

On 2020-11-26T19:30:06Z, greggirwin, commented:
<https://github.com/red/REP/issues/87#issuecomment-734453126>

    What is the driving use case @rebolek? I'm not against it, as it's similar to how `make/to` work with blocks today. Path access to bits  doesn't seem as useful, since you can already do that with bitsets, it raises a 0-based consistency issue, and will be implementation dependent. That is, ints are a fixed size. While we're 32-bt now, 64-bit will come soon, but we may still have n-bit builds possible. At the R/S level you expect to deal with this, but not in Red.
    
    Knowing the use case will help us all think about it.

--------------------------------------------------------------------------------

On 2020-11-27T07:36:27Z, rebolek, commented:
<https://github.com/red/REP/issues/87#issuecomment-734691601>

    Usecase: Accessing indivitual bits in byte. `bitset!` is fine for this, even if the order is reversed. It's useful on Red level too, especially when dealing with binary protocols. With the IO, we will be dealing with such situations lot more.

--------------------------------------------------------------------------------

On 2020-11-27T11:05:18Z, Oldes, commented:
<https://github.com/red/REP/issues/87#issuecomment-734779973>

    maybe `make bitset! 123` could be as it is - preallocator
    and there could be different `to bitset! 123` which would convert the integer to given bitset.

--------------------------------------------------------------------------------

On 2020-11-27T11:14:47Z, Oldes, commented:
<https://github.com/red/REP/issues/87#issuecomment-734783921>

    If I understand it well.. @rebolek is asking for:
    ```
    (to bitset! #{FF}) = (to bitset! FFh) ; or the future hex-number syntax
    ```

--------------------------------------------------------------------------------

On 2020-11-27T13:02:20Z, rebolek, commented:
<https://github.com/red/REP/issues/87#issuecomment-734825018>

    @Oldes yes, that's what I'm looking for. Currently, you can do it, but it's arcane:
    ```
    >> to bitset! skip to binary! FFh 3
    == make bitset! #{FF}
    ```

--------------------------------------------------------------------------------

On 2020-11-27T18:00:03Z, greggirwin, commented:
<https://github.com/red/REP/issues/87#issuecomment-734939646>

    Here's the big mismatch: There is no concept of bytes or 16-bit words,  in Red. `Make bitset! 8/16` is as close as you can get. If we go with the "shortest possible representation" approach from an int, you can't predict the bitset size you'll get because it's value based. So that doesn't help with things like binary protocols or other fixed size structures. 
    
    My use case question stands, but let me clarify it. I get accessing bits. What is the use case where you need to convert from an integer?

--------------------------------------------------------------------------------

On 2020-11-27T18:04:16Z, greggirwin, commented:
<https://github.com/red/REP/issues/87#issuecomment-734940699>

    My inclination is to create a bit-oriented dialect, which could wrap Red or R/S code. Some time back I came across a non-Red project for describing binary structs and such. I'll see if I can find it. 

--------------------------------------------------------------------------------

On 2020-11-27T18:23:30Z, 9214, commented:
<https://github.com/red/REP/issues/87#issuecomment-734945379>

    Kaitai struct, Erlang bit syntax. Rebol2 allowed mapping `struct!` onto `binary!`.

--------------------------------------------------------------------------------

On 2020-11-27T18:38:13Z, greggirwin, commented:
<https://github.com/red/REP/issues/87#issuecomment-734948878>

    - https://github.com/rosejn/byte-spec
    - https://kaitai.io/
    
    These don't speak to bits directly, but structs. @9214 made a start on some next-stage struct work I think, but I don't remember the goal. For binary protocols and formats, a dialect could enforce constraints. e.g. you describe the data in terms of `[int-8 uint-16 bits-8 p-str z-str ...]` with the ability to name fields (`flags: bits-8`), and could then access `rec/flags/1`, `rec/flags/msb`, which would treat it as bits, but a string field would not (byte vs char issues TBD :^).

--------------------------------------------------------------------------------

On 2020-11-27T18:40:24Z, greggirwin, commented:
<https://github.com/red/REP/issues/87#issuecomment-734949466>

    Struct to binary conversion is the key. One of the great things about certain older langs was the ability to define a fixed size struct/type and treat a file as a record oriented collection.

--------------------------------------------------------------------------------

On 2020-11-30T08:29:15Z, rebolek, commented:
<https://github.com/red/REP/issues/87#issuecomment-735636293>

    @greggirwin 
    > There is no concept of bytes or 16-bit words, in Red. 
    
    There certainly is a concept of bytes in Red. For example `length? binary!` doesn't give you a number of binary numbers in binary, but a number of bytes.
    
    > What is the use case where you need to convert from an integer?
    
    Most of the methods for getting one byte from `binary!` result in integer:
    
    ```
    >> bin: #{deadcafe}
    == #{DEADCAFE}
    >> bin/1
    == 222
    >> take bin
    == 222
    ```
    
    So I start with `binary!` that gets converted to `integer!` and to get individual bits which is easy with `bitset!`, I need to do an intermediate conversion to `binary!`.
    

--------------------------------------------------------------------------------

On 2020-11-30T09:32:38Z, loziniak, commented:
<https://github.com/red/REP/issues/87#issuecomment-735668773>

    > Most of the methods for getting one byte from binary! result in integer:
    
    Doesn't it seem more natural to just take a slice of that `binary!`?
    ```
    >> bin: #{deadcafe}
    == #{DEADCAFE}
    >> b: to bitset! copy/part bin next bin
    == make bitset! #{DE}
    >> b/1
    == true
    >> b/2
    == false
    ```

--------------------------------------------------------------------------------

On 2020-11-30T09:55:25Z, rebolek, commented:
<https://github.com/red/REP/issues/87#issuecomment-735680460>

    The most natural thing in my case would be using `take`.
    But:
    ```
    >> bin: #{deadcafe}
    == #{DEADCAFE}
    >> take/part bin 2
    == #{DEAD} ; this returns binary! so can be converted into bitset! directly
    >> take bin
    == 202 ; however this returns integer! and needs conversion into binary! before converting into bitset!
    ```
    I can use `copy` and then `remove` but `take` function was added exactly to avoid this unnecessary pattern.

--------------------------------------------------------------------------------

On 2020-11-30T09:56:24Z, rebolek, commented:
<https://github.com/red/REP/issues/87#issuecomment-735680983>

    I just found that `take/part bin 1` returns `binary!`.

--------------------------------------------------------------------------------

On 2020-11-30T23:38:03Z, greggirwin, commented:
<https://github.com/red/REP/issues/87#issuecomment-736120260>

    > There certainly is a concept of bytes in Red. For example `length? binary!` doesn't give you a number of binary numbers in binary, but a number of bytes.
    
    Let me clarify what I meant. There is no `byte!` or `word-16!`. Red doesn't understand those values. A dialect for this should nicely hide the details, and make the intent clear.

--------------------------------------------------------------------------------

On 2020-11-30T23:45:15Z, greggirwin, commented:
<https://github.com/red/REP/issues/87#issuecomment-736122628>

    `[pick take take/part]`, are Rebol compatible. We can review those choices, but I think it will just shift things around, and not be definitively better.

--------------------------------------------------------------------------------

On 2020-11-30T23:53:42Z, greggirwin, commented:
<https://github.com/red/REP/issues/87#issuecomment-736125248>

    I'm going to tag @maartenkoopmans and @toomasv on this. Toomas does a lot of `parse` work and has fresh views and  good design instincts on dialects. Maarten will be using some background time to start on protobuf support, which will double as a DiaGrammar example and use case. @rebolek is the real-world-use-case expert (along with others, but he's using it for production work right now). He'll have valuable feedback on a binary dialect from that perspective.

--------------------------------------------------------------------------------

On 2020-11-30T23:58:36Z, greggirwin, commented:
<https://github.com/red/REP/issues/87#issuecomment-736126739>

    We can set up a room on Gitter to start the conversation. Give @toomasv some initial input, then a chance to do some R&D, and see how it works when Maarten and Bolek apply it in their respective use cases. How does that sound?

--------------------------------------------------------------------------------

On 2020-12-01T00:02:25Z, greggirwin, commented:
<https://github.com/red/REP/issues/87#issuecomment-736127955>

    ASN.1, MsgPack, BSON, and Avro are just a few others that can be guinea pigs. Maybe even some EDI stuff...eventually. 

--------------------------------------------------------------------------------

On 2020-12-01T06:24:46Z, greggirwin, commented:
<https://github.com/red/REP/issues/87#issuecomment-736251823>

    @9214's work, he can confirm if he sees this, was probably adding `struct!` to Red, for easier interop with R/S and FFI at the Red level.

--------------------------------------------------------------------------------

On 2020-12-01T06:26:39Z, greggirwin, commented:
<https://github.com/red/REP/issues/87#issuecomment-736252574>

    Since that's a big task, we can start by treating `binary!` values as blobs that map to a schema and an interface to the data that way.

--------------------------------------------------------------------------------

On 2020-12-01T07:25:36Z, rebolek, commented:
<https://github.com/red/REP/issues/87#issuecomment-736278500>

    While I eagerly await the addition of `struct!` into Red, it won't help much with my problem, as the smallest unit in a struct is a byte, not a bit. 

--------------------------------------------------------------------------------

On 2020-12-01T10:26:35Z, mbk, commented:
<https://github.com/red/REP/issues/87#issuecomment-736383783>

    WHat if we introduce a payload function, handy in itself if we can match on the sub-elements, much like Erlang:
    
    <<x:3y:5>> = one byte
    
    payload would parse the , well, payload, convert it to an int, and give you a bitset back.

--------------------------------------------------------------------------------

On 2020-12-01T10:29:31Z, mbk, commented:
<https://github.com/red/REP/issues/87#issuecomment-736385361>

    Needs some thinking through, because you'd also want to preserve the payload for matching. Maybe a `match` should go along with it, and you have something more readable (== more powerful) to implement protocols.It's also more aligned with @greggirwin 's references. Just forget bitsets and make a bit dialect?

--------------------------------------------------------------------------------

On 2020-12-01T10:33:13Z, mbk, commented:
<https://github.com/red/REP/issues/87#issuecomment-736387303>

    The way I always understood `bitsets` is they are compressed, either using run-length encoding or (rarely) using bitmap indexes. I've always liked the erlang bit notation, why not do something like that hidden behind a dialect. The BIG upside is that a protocol dialect can build directly on top of that, I think.

--------------------------------------------------------------------------------

On 2020-12-01T19:02:15Z, greggirwin, commented:
<https://github.com/red/REP/issues/87#issuecomment-736754505>

    @mbk bitsets are just a number of bytes in memory that expand in order to hold the largest bit, and with a defined minimum size of one byte. They can also be complemented, which helps with large bitsets like unicode ranges where just a few low bits are special.

--------------------------------------------------------------------------------

On 2020-12-01T19:22:08Z, greggirwin, commented:
<https://github.com/red/REP/issues/87#issuecomment-736764787>

    https://gitter.im/red/binary-protocol# created.

