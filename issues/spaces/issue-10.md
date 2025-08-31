# Widget template creation example doesn't work #10

**State:** closed | **Created:** 2023-09-09T00:08:45+02:00 | **Updated:** 2023-09-09T21:22:24+02:00
**URL:** <https://codeberg.org/hiiamboris/red-spaces/issues/10>
---

Running the final code at https://codeberg.org/hiiamboris/red-spaces/src/branch/master/widgets/guide.md produces a widget that doesn't drop down. I'm guessing that some of the recent changes in Red broke this.

Windows 11
![image](/attachments/f1fc3196-6d7f-41d9-80c1-6ba8d090890c)

---
## Comments

### Comment by **hiiamboris** (**Posted:** 9-Sep-2023/10:56:30+02:00 | **Updated:** 9-Sep-2023/10:56:30+02:00):

Thanks for the reports :+1:
The widget is actually fine, you can get the desired outcome using CLI console. It looks like some conflict between GUI console and my custom event scheduler. I'll see if I can fix it.

---
### Comment by **hiiamboris** (**Posted:** 9-Sep-2023/21:22:24+02:00 | **Updated:** 9-Sep-2023/21:22:24+02:00):

Fixed by a3c25d0

---
