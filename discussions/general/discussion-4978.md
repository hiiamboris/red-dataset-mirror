URL: <https://github.com/red/red/discussions/4978>
Date created: 2021-10-02T18:52:36Z

# What is the purpose of the metadata at the beginning of a script?

So at the beginning of every red script there is that `Red []` section where some metadata is, such as the title of the script. I'm just wondering: what _is_ the purpose of that section? What use cases do the Red developers see for integrated script metadata? If I put a title to my script, by what tools might it be used?

## Comments

### hiiamboris commented at 2021-12-20T10:39:28Z:

Hi. A few examples:
- http://www.rebol.org/st-topic-details.r?tag=level//beginner you can see how an external library can extract info from standard header fields
- `title` and `icon` are used to change program's info and appearance in Windows Explorer
- [CLI library](https://gitlab.com/hiiamboris/red-cli/) uses various items, such as `title`, `author`, `license`, `rights` and `version` to generate text for `--version` and `--help` arguments
- other reducers when reading the code can reason about what it does, how to use it, who wrote it, who to contact, how to license, etc.
- `needs` field will be used by module system once we have it (currently it understands only View & Audio modules)
- imagination is the only limit :)

