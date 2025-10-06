Red [
    Title: "project.red"
    Features: [
        1.0 {Memorize list of projects}
        2.0 {Scaffolding depending on project type}
    ]
    Builds: [0.0.0.1.12 {Release initial version}]
]

unless not error? try [
    do https://quickrun.red/vscode
][
    do %libs/vscode.1.red
]

Create-Project: func [/type >project-type][

    either exists? %config/projects.config.read [

        either exists? %config/projects.config.read [
            >projects: load %config/projects.config.read
            last-project: last >projects

            last-project-name: last-project/name
            last-project-folder: last-project/folder
            last-project-type: last-project/type

            >project-name: last-project-name
            >project-type: last-project-type
            >project-folder: last-project-folder

            ans: ask rejoin [{Project Name (by default "} last-project-name {"): }] 
            if ans <> "" [>project-name: ans]

            unless type [
                ans: ask rejoin [{Project Type (by default "} last-project-type {"): }] 
                if ans <> "" [>project-type: ans]
            ]

            >project-folder: request-dir/title/dir "Select or Create a Project Folder" last-project-folder
        ][
            make-dir/deep %config/
            write %config/projects.config.read ""

            ans: ask rejoin [{Project Name} {: }] 
            if ans <> "" [>project-name: ans]

            unless type [
                ans: ask rejoin [{Project Type} {: }] 
                if ans <> "" [>project-type: ans]
            ]     
            >project-folder: request-dir/title "Select or Create a Project Folder"

        ]

        new-project: compose/deep [
            name: (>project-name)
            folder: (>project-folder)
            type: (>project-type)
        ]

        ;sha256-newproject: checksum mold >new-project 'SHA256 
        sha256-newproject: checksum mold new-project 'SHA256 ; fixed bug in project.10.red
        new-project?: true

        either value? '>projects [
            forall >projects  [
                project: >projects/1
                sha256-project: checksum mold project 'SHA256 ; BUG: FORGOT 'SHA256
                if sha256-project = sha256-newproject [
                    new-project?: false
                    break
                ]
            ]
        ][
            >projects: copy [[]]
        ]

        either new-project? [
            append/only >projects/1 new-project
            save %config/projects.config.read Projects
        ][
            print {Project already exists.}
        ]
    ][
        >project-name: ask rejoin [{Project Name:} { }] 
        unless type [
            >project-type: ask "Project Type: "
        ]

        >project-folder: request-dir/title "Select or Create a Project Folder"
        
        make-dir %config/
        >projects: copy [[]]
        append/only >projects/1 compose/deep [
            name: (>project-name)
            folder: (>project-folder)
            type: (>project-type)
        ]
        save %config/projects.config.read >Projects

    ]

    create-default-file: function [filename][
        target-file: rejoin [>project-folder filename]

        either not exists? target-file [
            write target-file ""
        ][
            ans: ask rejoin [{Do you want to overwrite index.js ("Y" or "YES"): }]
            if (ans = "YES") or (ans = "Y") [
                write target-file ""
            ]
        ]   
        return target-file      
    ]

    existing-default-type?: true

    types-files: [
        "html" %index.html
        "nodejs" %index.js
    ]
    filename: select types-files >project-type

    unless none? filename [
        target-file: create-default-file filename
    ]
    ; TODO: create Readme file

    vscode (>project-folder)
    return target-file
]


