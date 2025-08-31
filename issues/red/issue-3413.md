
#3413: Missing DOC strings
================================================================================
Issue is closed, was reported by endo64 and has 0 comment(s).
<https://github.com/red/red/issues/3413>

DOC strings are missing for below functions:

Note that I already fixed all of them with help of @greggirwin and will PR soon, opened this issue just to track it more easily.

Update, added doc strings here.

```
<<                   : Shift bits to the left
>>                   : Shift bits to the right
>>>                  : Shift bits to the right (unsigned)
_read-input          : Internal Use Only
_set-buffer-history  : Internal Use Only
as-color             : Combine R, G and B values into a tuple
as-ipv4              : Combine a, b, c and d values into a tuple
as-rgba              : Combine a, b, c and d values into a tuple
ask                  : Prompt the user for input
bind                 : Bind words to a context; returns rebound words
charset              : Shortcut for `make bitset!`
comment              : Consume but don't evaluate the next value
common-substr        : Internal Use Only
construct            : Makes a new object from an unevaluated spec; standard logic words are evaluated
context              : Makes a new object from an evaluated spec
create-dir           : Create the given directory
debug-info?          : Internal use only
dir                  : Display a single column directory listing, for the current dir if none is given
dir?                 : Returns TRUE if the value looks like a directory spec
do-actor             : Internal Use Only
do-file              : Internal Use Only
do-safe              : Internal Use Only
eval-set-path        : Internal Use Only
event?               : Returns true if the value is this type
exists?              : Returns TRUE if the file exists
find-flag?           : Checks a flag in a face object
get-current-dir      : Returns the platform’s current directory for the process
halt                 : Stops evaluation and returns to the input prompt
input                : Wait for console user input
last-lf?             : Internal Use Only
link-sub-to-parent   : Internal Use Only
link-tabs-to-parent  : Internal Use Only
ll                   : Display a single column directory listing, for the current dir if none is given
ls                   : Display a single column directory listing, for the current dir if none is given
make-face            : Make a face from a given style name or example face
normalize-dir        : Return the contents of the system clipboard
object               : Makes a new object from an evaluated spec
on-face-deep-change* : Internal use only
on-parse-event       : Standard parse/trace callback used by PARSE-TRACE
os-info              : Returns detailed operating system version information
parse                : Process a series using dialected grammar rules
pwd                  : Displays the active directory path (Print Working Dir)
quote                : Return but don't evaluate the next value
read-clipboard       : Return the contents of the system clipboard
red-complete-file    : Internal Use Only
red-complete-input   : Internal Use Only
red-complete-path    : Internal Use Only
routine              : Defines a function with a given Red spec and Red/System body
set-current-dir      : Sets the platform’s current process directory
set-flag             : Sets a flag in a face object
shift-left           : Shift bits to the left
shift-logical        : Shift bits to the right (unsigned)
shift-right          : Shift bits to the right
to-red-file          : Converts a local system file path to a Red file path
update-font-faces    : Internal Use Only
write-clipboard      : Write content to the system clipboard
write-stdout         : Write data to STDOUT
```

### Red and platform version
```
RED: [ branch: "missing-doc-strings" tag: #v0.6.1 ahead: 2893 date: 4-Jun-2018/2:04:40 commit: #779c1e41cdb62a19d8918deb9e66df734f0448f4 ]
PLATFORM: [ name: "Windows 8" OS: 'Windows arch: 'x86-64 version: 6.2.0 build: 9200 ]
```


