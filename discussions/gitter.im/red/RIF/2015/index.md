# Archived messages from: [gitter.im/red/red/RIF](/gitter.im/red/red/RIF/) from year: 2015

## Wednesday 1st July, 2015

JerryTsai

[03:38](#msg559360ceb57c03f7556c2f6d)The original idea of RIF is to store block in file, and to access elements from it by block indexes without reading the whole file. Since elements are of different sizes, file offset indexes are needed. That is, there should be a mapping from block index to file offset (and element size).

[03:46](#msg55936294b4ce4e473250f947)In the original idea, "I" in the RIF is "block index". What if we have RKF (Red Key-Value File)? In RKF, the stored root value is a map, instead of a block, and the map keys are used to replace the block indexes. Basically, It's a Redis Store. :-)

dockimbel

[03:47](#msg559362b998f9c0bc3da0bb18)@JerryTsai RKF should be a different project, addressing different needs. ;-)

greggirwin

[04:27](#msg55936c2a4afd1dfd45850a50)@dockimbel (from red/red) Yes, I posted a short msg after my format list that just basic RIF will go a long way, agreed.

rebolek

[06:46](#msg55938cd892e368b167bd54b0)You can build RFK on top of RIF.

pekr

[06:47](#msg55938d1598f9c0bc3da0bd79)Could you build Redbin top of RIF? :-)

rebolek

[07:50](#msg55939bc0b4ce4e473250fce5)I guess you can but it would be highly impractical :)

Oldes

[08:16](#msg5593a1cba3aa0fa2043cb864)Although I think, that it quite early to discuss such a topics, when we don't have IO and even binary! datatype in Red yet, I think, that instead of block it should be stored like \*linked list* so one could insert values at head without need to move all the data in the file. If I would be designing it, I would probably reserved some space at the beginning of the file for indexes, which would be just pointer to a real value, pointer to next and prev value.. following real data values. But that's just a quick fought.. I'm personally not big fun of 'simple' and still 'universal' solutions.

[08:22](#msg5593a34d666fd9af6736dae4)I mean... I would for example not used above method to store logs. Each scenario may have different requirements.

pekr

[08:23](#msg5593a381666fd9af6736daeb)The link's not here, but in other channel - just look for Ashley's RebDB 3 - http://www.dobeash.com/RebDB/rebdb3.html

[08:25](#msg5593a3e4b4ce4e473250fdb5)SQLite goes for the low level storage engine with runtime pluggable sub-engines, with SQLite 4 (which is not replacement, but parallel to SQLite 3 family). But it is probably way "too big" for our purposes. OTOH if I would like to have something reliable, stable, easy to use, I would never ever go for any proprietary stuff, apart from the very basic scenarios ... being there, done that (RebDB) vs the SQLite ....

Oldes

[08:31](#msg5593a55492e368b167bd5739)@pekr "proprietary stuff" you mean SQLite or RebDB? :)

pekr

[08:31](#msg5593a560a3aa0fa2043cb8cb)RebDB ...

[08:32](#msg5593a580b4ce4e473250fde2)SQLite is a de-facto standard nowadays. That's like fighting against the PDF format :-)

Oldes

[08:32](#msg5593a59c92e368b167bd5741)I would consider SQLite more \*proprietary\*, but it has, for sure, bigger user base.

pekr

[08:34](#msg5593a61fa3aa0fa2043cb8df)Well, it is always (at least with me) like - OK, I use this, it is small, nice, ours (redbol :-), then I start to miss on some funcitonality - joins, locking, etc. And SQLite has kind of rebolish nature - one file DLL or .exe, both can be wrapped. Simple R2 driver just piped in/out to sqlite.exe. Fast and reliable, to a middle sized projects. Lot's of products use that. Very liberal licence ...

[08:35](#msg5593a64192e368b167bd575a)So, looking forward to RIF based DB, of course having 500 KB app having in-built storage engine is always nice :-)

rebolek

[08:36](#msg5593a67a92e368b167bd5765)Do not expect joins, locking etc with RIF.

pekr

[08:40](#msg5593a766b57c03f7556c347a)Well, then don't expect me to ever use it :-)

[08:40](#msg5593a786a3aa0fa2043cb912)I mean - RIF is something a bit different. If I understood Carl in the past, it was supposed to be a base to write some small DB engine upon that ...

rebolek

[09:20](#msg5593b0ed98f9c0bc3da0c0dc)RIF is just low level data format. You need to do joins and locking on top of that.

[09:21](#msg5593b12d92e368b167bd587d)The purpose of RIF is that you don't have to load whole `block!` into memory. You can read just the value you need.

[09:22](#msg5593b164a3aa0fa2043cb9fd)Basically, it's like `value: load/part skip %data.reb index-of-value length-of-value`

pekr

[09:31](#msg5593b38a92e368b167bd58d2)Well, we have proper io for that, you can use 'read for that :-), but OK, I can understand ...

rebolek

[09:38](#msg5593b533666fd9af6736dce1) Yes, proper buggy io :)

dockimbel

[09:39](#msg5593b56db57c03f7556c3614)RIF is supposed to be \*block\*-oriented not value-oriented. Its goal is to provide an efficient way to persist blocks on disk. Nothing more than that.

pekr

[09:43](#msg5593b64a92e368b167bd5929)Rebolek - I expect Red io not being buggy ... or we will bug Doc about bugs :-)

rebolek

[09:56](#msg5593b95ca3aa0fa2043cbafc)I meant R3's one :) I also hope that Red io would be bugless :)

pekr

[10:03](#msg5593baee92e368b167bd59be)Well, R3 IO was never properly finished. I remember Earl stated during our Brno meeting, that it should be most probably rewritten ...

fergus4

[11:15](#msg5593cbc7b57c03f7556c3842)

## Saturday 25th July, 2015

planetsizecpu

[11:20](#msg55b3711887c3b09e57f09689)@dockimbel Are RIF structures to be &amp; use like cobol or b+ indexed files? If so, I have years of xperience in using it, perhaps I can give some clue on programming with

dockimbel

[13:51](#msg55b3947de923d83d6d46980f)Basically, yes. We'll probably start with just a simple offset table for the initial version, before optimizing it with a B+ tree structure. Any help is welcome. :+1:

planetsizecpu

[17:28](#msg55b3c72787c3b09e57f09788)I will keep in mind. You can get my private email on github if you need some idea, I would be very happy on putting my grain of sand to Red ;)

## Sunday 26th July, 2015

dockimbel

[07:10](#msg55b487f552d85d450f402e97)@planetsizecpu Ok, noted. ;-)
