// Author: Nêdza Darek
// License:
// - point to this gist/github
// - no warranties
// - use/modify everywhere

// deletes spaces/tabs/newlines before first and after last printable character
// for each lines: deletes spaces/tabs before first printable character
// in the future it should take into account indentations 
function clean_tag(str){
    var tags = document.getElementsByTagName(str);
    for(var tag_index = 0; tag_index<tags.length; tag_index++){
        var tag_content = tags[tag_index].textContent; // string
        tag_content = tag_content.trimLeft();
        var splitted = tag_content.split("\n");
        tags[tag_index].textContent = "";
        
        for(var split_index = 0; split_index < splitted.length; split_index++){
            tags[tag_index].textContent = tags[tag_index].textContent + splitted[split_index].trimLeft() + "\n";
        };
        tags[tag_index].textContent = tags[tag_index].textContent.trimRight();
        
    }
};
