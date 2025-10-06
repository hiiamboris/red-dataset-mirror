
# Create Code Snippet fast for Visual Studio Code


## Vscode extension | easy snippet

how to create code snippet faster in vscode


### Step 1: Install **Easy Snippet** Extension


Search "Easy Snippet" by clicking the extension icons inside VSCode 
or install from this [link](https://marketplace.visualstudio.com/items?itemName=inu1255.easy-snippet)


### Step 2: Convert selected code to snippet


Write your code template and select it (don't bother to create placeholder variables yet, it won't take it into account very well.)

![https://i.imgur.com/ukJ4MEp.png](https://i.imgur.com/ukJ4MEp.png)
                    
Activate VSCode command palette (F1) and type "Make Snippet"

![https://i.imgur.com/PHTkpq0.png](https://i.imgur.com/PHTkpq0.png)
                    
Type a name for your code snippet for example "MyMemento":

![https://i.imgur.com/egKApmL.png](https://i.imgur.com/egKApmL.png)
                    

### Step 3: Paste snippet into VSCode User Snippets file

Select only the code starting with second bracket as shown below:

![https://i.imgur.com/8YIu0Yv.png](https://i.imgur.com/8YIu0Yv.png)
                    
Select VSCode menu File -> Preferences -> User Snippets

![https://i.imgur.com/QAIukdZ.png](https://i.imgur.com/QAIukdZ.png)
                    
Select the code language (for example "red")

![https://i.imgur.com/7axgFZ4.png](https://i.imgur.com/7axgFZ4.png)
                    
in .json language file (red.json in our example), type "," after any other existing snippet or none if there isn't any, then paste yours

![https://i.imgur.com/b2C95qP.png](https://i.imgur.com/b2C95qP.png)
                    

### Step 4: Check that your code snippet works

Go back to code editor, and type Ctrl+Space to list all code snippets and then your snippet (the one with black square icon)

![https://i.imgur.com/n1D3hYe.png](https://i.imgur.com/n1D3hYe.png)
                    
You should then see the expect code:

![https://i.imgur.com/Wc9FmEJ.png](https://i.imgur.com/Wc9FmEJ.png)
                    

### References

- [Creating your own snippets | code.visualstudio.com](https://code.visualstudio.com/docs/editor/userdefinedsnippets)
                        
