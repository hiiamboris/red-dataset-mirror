# Archived messages from: [gitter.im/red/binary-protocol](/gitter.im/red/binary-protocol/) from year: 2020

## Tuesday 1st December, 2020

greggirwin

[19:29](#msg5fc699aa608ab715f4d4879a)This room is for the discussion of a binary protocol. The goal is an interface and specification for dealing with binary data. e.g.

\- https://github.com/rosejn/byte-spec  
\- https://kaitai.io/

It needs to allow control at the bit level and consider endianness and signedness of numbers, so it can be used by higher level protocols like ProtoBuf, ASN.1, MsgPack, BSON, etc.

There are a lot of design issues to address. e.g. Red doesn't have a `struct!` type yet, and those would still only deal with values down the byte level. Unsigned and 64-bit ints also don't exist in Red. Step one, I think, is to map a spec to a `binary!`, providing a way to address values in a convenient way.

https://github.com/red/REP/issues/87 has a few other notes and thoughts.

## Wednesday 2nd December, 2020

hiiamboris

[16:47](#msg5fc7c5357db659462afcf70c)@gitter-badger :eyes:

greggirwin

[17:00](#msg5fc7c82709947966058010af)&gt; protocol buffers supports a lot of types that we don't, like int64 (in general the longer ones)

For creating a grammar in DiaGrammar, this isn't an issue. For a Red implementation it is.

\- Start with the easy ones. Then look at the \*64 types.  
\- Determine what type to map them to. e.g. can `fixed` map to money?  
\- Figure out if they're safe to map with high bits as zero if the values are in range. It's also fine to say we don't support them yet.

Note that other langs have similiar issues. e.g. \[this](https://developers.google.com/protocol-buffers/docs/reference/google.protobuf#google.protobuf.UInt64Value) notes what things map to in JSON, and some PB numerics map to JSON strings.

[17:01](#msg5fc7c8577fe316314d9cfcf6)Once we have a PB grammar, it's worth a small amount of time to see if it can port to a metagrammar. PB is a good audience, and that opens it up to specific use cases for them.

rebolek

[19:01](#msg5fc7e476fa9a511913f9d152)I have an experimental BSON parser/emitter, where I leave 64bit ints (and 128bit decimals) just as a raw binary.
