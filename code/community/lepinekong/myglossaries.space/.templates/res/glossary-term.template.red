Red [
    Title: "closure"
]

Glossary: [

    Term: [
        .title: "closure"
    ]

    Definition: [
        .title: {Definition}
        .quote: {A closure is an inner (nested) function that has access to the parent (function) scope, even after the scope has closed.}
    ]

    Example: [

        .title: {Example:}
        .code/javascript: {
var increment = (function () {
    var counter = 0;
    return function () {counter += 1; return counter}
})();

increment();
increment();
increment();            
        }
    ]

    References: [
        .title: {References}
        .links: [
            {JavaScript Closures - w3schools.com} https://www.w3schools.com/js/js_function_closures.asp
            {Understand Closures in JavaScript - codeburst.io} https://codeburst.io/understand-closures-in-javascript-d07852fa51e7
        ]
    ]

]

do read http://readablehumanformat.com/lib.red
markdown-gen