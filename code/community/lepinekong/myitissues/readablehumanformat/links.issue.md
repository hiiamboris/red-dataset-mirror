
# links.issue: .links sometimes doesn'tt want to render


### ReAdABLE Source

[http://myitissues.space/links.issue.red](https://github.com/lepinekong/myitissues/blob/master/links.issue.red)


### Description

.links doesn't to render for:


```

            categories: [
.title: {By Categories:}
.links: [
    {books} #./books
    {documentaries} #./documentaries
]      
            ]            
        
```


Severity: Critical
Comment: this is very annoying for productivity, must be fixed urgently today.

### Diagnostic

Bug confirmed but have to enquiry and isolate context as sometimes it works:


```

Red [
    Title: "ReAdABLE Human Format project Issues index - 18.05.18"
]

Journal: [

    Title: {Index of ReAdABLE Human Format  JournalIssues  18.05.18}

    Source: [
        .title: {ReAdABLE Source}
        .text: {[http://myitissues.space/ReAdABLE Human Format /18.05/iIssues ndex.red](https://github.com/lepinekong/myitissues/blob/master/18.05/index.red)
        }
        .Published-Url: http://myitissues.space/ReAdABLE Human Format /18.05/iIssues ndex
    ]    
    
    Summary: [
        .title: "Summary of the day:"
        .text: {
            - There is 1 critical issue about .links
            - There is 1 average issue about .code
        }
    ]

    Links: [
        .title: {Details:}
        .links: [
            {action1} #./01
            {action2} #./02
            {books} #./books
            {documentaries} #./documentaries            
        ]      
    ]

]

do read http://readablehumanformat.com/lib.red
markdown-gen
            
        
```


Sometimes it doesn't:


```

Red [
    Title: "My Jotnotes index"
    File: %index.red
]

Article: [

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

        
```


We found that it works with Journal but not with Article or Summary: very weird, investigation should continue.
