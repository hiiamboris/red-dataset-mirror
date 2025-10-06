Red [
    Title: "IIFE"
]

Glossary: [

    Term: [
        .title: "IIFE (Immediately Invoked Function Expression)"
    ]

    Definition: [
        .title: {Definition}
        .quote: {IIFE is a JavaScript function that runs as soon as it is defined.}
    ]

    Example: [

        .title: {Example:}
        .code/javascript: {        
var iife = (function () {
    var counter = 0;
    return get-counter(){return counter};
})();                
        }
    ]

    References: [
        .title: {References}
        .links: [
            {developer.mozilla.org} https://developer.mozilla.org/en-US/docs/Glossary/IIFE
        ]
    ]


    See-also: [
        .title: {Related terms}
        .links: [
            "Closure" %../c/closure
        ]
    ]    

]

do read http://readablehumanformat.com/lib.red
markdown-gen