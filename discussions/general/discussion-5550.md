URL: <https://github.com/red/red/discussions/5550>
Date created: 2024-10-14T07:36:08Z

# Popen?

Is there a way in Red to open an external app (for example ssh) as a channel/pipe and communicate with it via standard input/output? 

## Comments

### hiiamboris commented at 2024-10-14T07:57:32Z:

As Red has no official async I/O to date, you can only lock your program until the external app finishes:
```
>> call/shell/output "echo %CD%" out: {}
== 0                                            ;) 0 indicates success
>> ? out
OUT is a string! value: "d:\devel\red^/"        ;) stdout captured
```

