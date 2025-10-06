Red [
    Title: "My Jotnotes index"
    File: %index.red
]

Index: [

    Title: {My Jotnotes index}

    Source: [
        .title: {ReAdABLE Source}
        .text: {[http://myjotnotes.space/index.red](https://github.com/lepinekong/myjotnotes/blob/master/index.red)
        }
        .Published-Url: http://myjotnotes.space/Books/index
    ]    

    ; categories: [
    ;     .title: {By Categories:}
    ;     .links: [
    ;         {books} #./books
    ;         {documentaries} #./documentaries
    ;     ]      
    ; ]

    Links: [
        .title: {Details:}
        .links: [
            {action1} #./01
            {action2} #./02
            {books} #./books
            {documentaries} #./documentaries            
        ]      
    ]    

    ; by-date: [
    ;     .title: {By dates:}
    ;     .links: [
    ;         {2018.05} #./2018.05
    ;     ]      
    ; ]

]

do read http://readablehumanformat.com/lib.red
markdown-gen
