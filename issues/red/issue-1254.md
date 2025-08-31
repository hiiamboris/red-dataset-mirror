
#1254: Feature request: linked list datatype
================================================================================
Issue is closed, was reported by Oldes and has 8 comment(s).
[type.wish]
<https://github.com/red/red/issues/1254>

Hi Doc,
would you have something against a linked list datatype? Now we have block! which is just a vector of pointers internally, correct me, if I'm wrong. Linked list would be of 3 pointers, one for value, and the rest for next and prev value node index.

I'm quite a lot working in AS3 now, and I can see that many people is using not native linked lists in case where have many inserts and deletes in the middle of array (block! in our case) to gain better performance, because data don't need to be shifted in the memory.

I would give it a try once I will have more time, maybe next year, if it's not too late:)

Any comments are welcome, but don't want to disturb you in your current work. I'm adding it here now, just because it came to my mind with the RIF discussion elsewhere.



Comments:
--------------------------------------------------------------------------------

On 2015-07-01T08:51:49Z, Oldes, commented:
<https://github.com/red/red/issues/1254#issuecomment-117546429>

    I should note, that I'm also aware of linked list disadvantages. It's useful only in some cases for sure. So it's not big priority at all. 

--------------------------------------------------------------------------------

On 2015-07-01T13:27:29Z, Oldes, commented:
<https://github.com/red/red/issues/1254#issuecomment-117674967>

    Funny, I totally forgot, that linked list is available in Rebol2 :) http://rebol.com/docs/core23/rebolcore-16.html#section-2.8 for ages.

--------------------------------------------------------------------------------

On 2015-07-01T15:17:22Z, dockimbel, commented:
<https://github.com/red/red/issues/1254#issuecomment-117712717>

    _block! which is just a vector of pointers internally_ Blocks are arrays of 128-bit slots, scalar values are fully contained in one slot, while series and aggregate datatypes also have one or more extra buffers.
    
    I used list! in Rebol2 in my first project, handling hundreds of values. When I discovered that I couldn't measure any difference in performances for intensive remove/insert tasks, using Rebol timing (1/50 of a second back then), I just switched to block! and never used list! ever since. As list! was so useless (even Carl didn't bother using it), it was simply removed in Rebol3 and I didn't even consider it in the core datatypes for Red. Maybe it could be still useful if you have intensive insert/remove operations in a block of thousands of values or more, and that those operations timing is critical to your app. But this is probably a very rare case in practice for most users.
    
    So, list! is not a candidate for Red core for now. Once we'll have modules support, nothing stops you from implementing it if you feel the need for it. ;-)

--------------------------------------------------------------------------------

On 2016-02-02T14:13:37Z, dockimbel, commented:
<https://github.com/red/red/issues/1254#issuecomment-178592113>

    Closing this ticket now. Linked-list datatype can be added an extra type by the community once we have modules support and the Red runtime API documented.

