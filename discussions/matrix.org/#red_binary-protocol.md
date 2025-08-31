# Archived messages from: https://app.gitter.im/#/room/#red_binary-protocol:gitter.im (https://app.gitter.im/#/room/!lZCMNWLQIBVXRdVHXu:gitter.im)

## 2-Dec-2020

[16:47:57](#SKDfp2GXUQDb13-sOX-HDKGXGu09n-CN905kvac71g0) <hiiamboris (NOT THIS ONE)>:
@gitter-badger í ½í±€ 

[17:00:23](#lgsA79o_Wrp38wRXjyG07s-FFky700FLm8Z56TYBY_Q) <greggirwin (Gregg Irwin)>:
>  protocol buffers supports a lot of types that we don't, like int64 (in general the longer ones)

For creating a grammar in DiaGrammar, this isn't an issue. For a Red implementation it is. 

- Start with the easy ones. Then look at the *64 types.
- Determine what type to map them to. e.g. can `fixed` map to money?
- Figure out if they're safe to map with high bits as zero if the values are in range.

Note that other langs have similiar issues. e.g. [this](https://developers.google.com/protocol-buffers/docs/reference/google.protobuf#google.protobuf.UInt64Value) notes what things map to in JSON, and some PB numerics map to JSON strings.



[17:01:12](#7cMHuF-ZVUj8m2dB-wUTwAU2x4htdZkQPAm9sZom5cI) <greggirwin (Gregg Irwin)>:
Once we have a PB grammar, it's worth a small amount of time to see if it can port to a metagrammar. PB is a good audience, and that opens it up to specific use cases for them.

[17:03:51](#DX5oAvdPtNorjbS3v7S7YmIw4mIPcYrJRGgLtIkemLE) <greggirwin (Gregg Irwin)>:
* >  protocol buffers supports a lot of types that we don't, like int64 (in general the longer ones)

For creating a grammar in DiaGrammar, this isn't an issue. For a Red implementation it is. 

- Start with the easy ones. Then look at the *64 types.
- Determine what type to map them to. e.g. can `fixed` map to money?
- Figure out if they're safe to map with high bits as zero if the values are in range. It's also fine to say we don't support them yet.

Note that other langs have similiar issues. e.g. [this](https://developers.google.com/protocol-buffers/docs/reference/google.protobuf#google.protobuf.UInt64Value) notes what things map to in JSON, and some PB numerics map to JSON strings.



[19:01:12](#-xcjR9AlFmVdnQn4PZvua3LlE5KOLypoPoW-IbGJh0k) <rebolek (Boleslav BÅ™ezovskÃ½)>:
I have an experimental BSON parser/emitter, where I leave 64bit ints (and 128bit decimals) just as a raw binary.

