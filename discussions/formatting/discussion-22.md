URL: <https://github.com/hiiamboris/red-formatting/discussions/22>
Date created: 2023-01-03T17:42:28Z

# Extensibility

Something I postponed until a better time, and it surely can wait.

User should be able to freely extend `format` with his own values. These are not just datatypes, but more generally a map of predicate -> formatter func. [Copying Spaces into clipboard](https://github.com/red/REP/issues/134#issuecomment-1370037862) provides a good use case here.

It also returns to [`class-of` and object identification topic](https://github.com/red/REP/issues/102).

## Comments

### greggirwin commented at 2023-01-10T18:05:05Z:

Yes, like the Windows clipboard allows you to define custom formats.
Ultimately this aligns with MOP (Meta Object Protocol) thinking, which may
be a big change, and something that may not apply universally, unless
there's a clean way to support action dispatchers too.

On Tue, Jan 3, 2023 at 10:42 AM hiiamboris ***@***.***> wrote:

> Something I postponed until a better time, and it surely can wait.
>
> User should be able to freely extend format with his own values. These
> are not just datatypes, but more generally a map of predicate -> formatter
> func. Copying Spaces into clipboard
> <https://github.com/red/REP/issues/134#issuecomment-1370037862> provides
> a good use case here.
>
> It also returns to class-of and object identification topic
> <https://github.com/red/REP/issues/102>.
>
> —
> Reply to this email directly, view it on GitHub
> <https://github.com/hiiamboris/red-formatting/discussions/22>, or
> unsubscribe
> <https://github.com/notifications/unsubscribe-auth/AADQKLZS7HZRWPO3TFJ4ZADWQRQI5ANCNFSM6AAAAAATP5XDH4>
> .
> You are receiving this because you are subscribed to this thread.Message
> ID: ***@***.***>
>


