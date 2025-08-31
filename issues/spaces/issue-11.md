# GUI console won't add commands to history #11

**State:** closed | **Created:** 2023-10-08T18:45:17+02:00 | **Updated:** 2024-02-05T16:46:56+01:00
**URL:** <https://codeberg.org/hiiamboris/red-spaces/issues/11>
---

Currently I have to employ some dirty hacks to use my custom event scheduler with the GUI console, because latter has been compiled with the default event scheduler. These both weren't designed to be extended. I made them sort of work, but entered commands won't be remembered in the history, and I don't have access to the current input line (terminal/line contains some junk and is not being updated).

This nuisance will be fixed once I roll out my own GUI console.

---
## Comments

### Comment by **hiiamboris** (**Posted:** 5-Feb-2024/16:46:55+01:00 | **Updated:** 5-Feb-2024/16:46:55+01:00):

With the introduction of [Spaces console](https://codeberg.org/hiiamboris/red-spaces/src/branch/master/programs/console/) no longer relevant.

---
