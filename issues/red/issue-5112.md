
#5112: WISH: Rename `wrote` event to just `write` 
================================================================================
Issue is open, was reported by pekr and has 0 comment(s).
[type.wish]
<https://github.com/red/red/issues/5112>

Since the R3 and the async introduction, I never liked the name of the `wrote` event type. I can understand, that it is meant to be a past tense, that actually something already happened. But not being a native English speaker, I never liked the word. And even more, the naming rule is imo not consistent anyway.

We've got event types like `accept`, `close` and we do not use `accepted` nor `closed`. So I can find a `wrote` usage as really not necessary. We can describe / consider it being just like `Write event, that just has happened`.

I also tried to look into Red's sources, and I can find various naming. While I can admit those might reflect native platform naming rules, we can find e.g. `IO_STATE_CONNECTED` and yet we use just plain simple `connect` at the Red level.

I still think, that it is not late to rename the even type, as IO is not being released / merged yet, and we don't need to care about the R3 async stuff, as most Rebol users use just R2 anyway. I marked it as a wish, as it is what it really is - no hard push here from my side.  


