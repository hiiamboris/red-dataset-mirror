# Archived messages from: [gitter.im/red/red/RIF](/gitter.im/red/red/RIF/) from year: 2016

## Friday 3th June, 2016

JenniferLee520

[17:13](#msg5751babc813c217c21d9e9f1)In Redbin header, both length and size take 4 bytes. I would like them to be 8 instead of 4. After all, 4GB is too small for a RIF database.

[17:15](#msg5751bb396c75e0cd6958f9e7)

greggirwin

[17:47](#msg5751c2b7e96484d0692f5b2d)@JenniferLee520 , length is number of records, so may still be OK at 4, though changing both to 8 would maintain 64-bit alignment after the header and be more future-proof. I'll say +1 (or +4 rather), unless @dockimbel comes back with justification for not doing it.

## Saturday 4th June, 2016

dockimbel

[03:25](#msg57524a16434455107d4c6c24)@JenniferLee520 Redbin is not RIF, it is just an accurate binary encoding of a block of Red values, nothing more than that. RIF is supposed to be an indexed file format, that will rely on Redbin to encode Red values. RIF would probably spread the stored data over many Redbin-encoded chunks, for example, to optimize for memory-paging and versioning. For the size encoding over 8 bytes, it's premature as we don't even have a datatype in Red or R/S to manipulate such value.

## Wednesday 8th June, 2016

JenniferLee520

[01:07](#msg57576febb5122bc217787865)@dockimbel Is it possible to move symbol table out of the redbin file, and put it in an independent file. The advantage of doing this is that many redbin files can reference the same symbol table, and symbol table files can growing big easily without the need to move payload of redbin.

dockimbel

[04:08](#msg57579a3607e77197794ffe92)@JenniferLee520 Redbin is just an encoding, not a file. You should be able to encode/decode redbin data from memory or over a TCP connection, it's not especially related to file-storage. A symbol table is necessary in redbin encoding otherwise words cannot be encoded. For the design of RIF format, we haven't done any work on that yet, it could use maybe a modified redbin format to optimize for file size and modifications.
