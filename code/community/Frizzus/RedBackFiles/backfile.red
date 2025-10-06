Red [
    Author: "Frizzus"
    Purpose: "This tool is made to get backups files that editor may leave on web servers"
]


; Banner
BANNER: {
██████╗ ███████╗██████╗                                            
██╔══██╗██╔════╝██╔══██╗                                           
██████╔╝█████╗  ██║  ██║                                           
██╔══██╗██╔══╝  ██║  ██║                                           
██║  ██║███████╗██████╔╝                                           
╚═╝  ╚═╝╚══════╝╚═════╝                                            
                                                                   
██████╗  █████╗  ██████╗██╗  ██╗███████╗██╗██╗     ███████╗███████╗
██╔══██╗██╔══██╗██╔════╝██║ ██╔╝██╔════╝██║██║     ██╔════╝██╔════╝
██████╔╝███████║██║     █████╔╝ █████╗  ██║██║     █████╗  ███████╗
██╔══██╗██╔══██║██║     ██╔═██╗ ██╔══╝  ██║██║     ██╔══╝  ╚════██║
██████╔╝██║  ██║╚██████╗██║  ██╗██║     ██║███████╗███████╗███████║
╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝
                                                                   
}
AFTER_BANNER: {
RedBackfile is made to get forgotten backup files on web servers.

Version 1.0
Created by Loïc Canin / Frizzus based on "Backfile" from Tristan Manzano / X-no
}

; ansi color used
RED: "^[[31m"
GREEN: "^[[32m"
BLUE: "^[[34m"
YELLOW: "^[[33m"
RESET: "^[[0m"


usage: func [
"Print a help message"
] [
    print {
Usage : backfile.red <url> [dirs_file] [FLAGS]

<> means mandatory
[] means optional

<url> : The url of the web site you want to scan.
[dirs_file] : A file that contains directories to go check for backups in the web server.

FLAGS :
--no-randomizer : By default the tool will randomize the http header to make the scan harder to spot. You can disable it with this flag.
--no-delayer : By default the tool will add random delay to the http header to make the scan harder to spot. You can disable it with this flag.
    }
]

http?: func [
    "Return true if value is an http or https url."
    value
] [
    is_valid_url: url? value
    contains_http: parse value [["http" | "https"] any skip]
    res: is_valid_url and contains_http
    return res
]

; ===== ENTRYPOINT =====
print rejoin [ RED BANNER RESET AFTER_BANNER ]

; === HANDLING CLI ARGS ===
args: system/options/args

if empty? args [usage halt]
;need to check if the url is an http one
if not http? args/1 [usage halt]


; args :
;   - "url" : The url of the web site
;   - "dirs_file" : The path to the directories that will be checked by the tool. This arg is optionnal as the tool has default directory to look into.
;   - "--no-randomizer" : By default the tool will randomize the http header to make the scan harder to spot. You can disable it with this flag.
;   - "--no-delayer' : By default the tool will add random delay to the http header to make the scan harder to spot. You can disable it with this flag.
