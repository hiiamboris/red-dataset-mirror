Red [
    Title: "<%short-filename%>.red"
]

Article: [

    Title: {Troubleshootings: <%troubleshootings-title%>}

    Source: [
        .title: {ReAdABLE Source [(What is the ReAdABLE Human Format?)](http://readablehumanformat.com)}
        .text: {[http://mymementos.space/<%sub-folder%>/<%short-filename%>.red](https://github.com/lepinekong/mymementos/blob/master/<%sub-folder%>/<%short-filename%>.red)
        }
        .Published-Url: http://mymementos.space/<%sub-folder%>/<%short-filename%>
    ]  


    demo: [
        .title: {Demo}
        .text: {Type in [red-lang](https://www.red-lang.org/p/download.html) console: }
        .quote: {do read http://mymementos.space/<%sub-folder%>/src/<%short-filename%>.red}
        .image: 
    ]      
    
    code-snippet: [

        .title: {Code Snippet}
        .image: 
        .links: [
            {View source} https://github.com/lepinekong/mymementos/blob/master/<%sub-folder%>/src/<%short-filename%>.red
            {Copy source} https://raw.githubusercontent.com/lepinekong/mymementos/master/<%sub-folder%>/src/<%short-filename%>.red
        ]        
        .code/<%language%>: {

        }

    ]
]

do read http://readablehumanformat.com/lib.red
markdown-gen 