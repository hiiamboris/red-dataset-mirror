Red [
    Title: "Index of <%author%>"
]

Source: [
    .title: {ReAdABLE Source [(What is the ReAdABLE Human Format?)](http://readablehumanformat.com)}
    .text: {[http://myquotes.space/<%author%>/index.red](https://github.com/lepinekong/myquotes/blob/master/<%author%>/index.red)
    }
    .Published-Url: http://myquotes.space/<%author%>
]

Article: [

    Title: {<%author%>'s quotes}

    <%category%>: [
        .title: {<%category%>}
        .links: [
            {} %./
        ]    
    ]

]  
do read http://readablehumanformat.com/lib.red
markdown-gen