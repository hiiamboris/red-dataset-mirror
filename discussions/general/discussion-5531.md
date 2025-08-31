URL: <https://github.com/red/red/discussions/5531>
Date created: 2024-07-27T12:58:46Z

# Opinions on git

I was always curious about this: do people who like Red actually like using git? I've always thought of git as a tool 
that's completely out of sync with Red's mission. I mean, it's all about creating better tools. About reducing complexity. 
About  having fun.

A big part of that is creating consistent tools with a good interface. A good interface is easy to learn, and hard to forget. 
But with git, it doesn't work like that :)

A tool with a terrible interface made by kernel developer conquered the world.  
It's funny in a way because I've heard from numerous people that they don't  actually enjoy using git *at all*. 
But they keep using it.

What's your opinion? Do you prefer to use something else, like Fossil or Mercurial?

## Comments

### greggirwin commented at 2024-07-27T17:51:54Z:

Personally, I don't love git, but there's no avoiding it today. I would be great if a simpler system was practical. I tried Fossil long ago and it was OK. Mercurial was a terrible experience for me. It's all about what the goals are. Git is overkill for all but the largest distributed projects, like MS Word is overkill for most writing needs. So we use 2% of what it can do, and then we `rebase` and `clone` when things go wrong. :^)

Where I'd *like* to see this lead is apps and tools that have version control built in, but where you don't have to deal with the details. Yes, it would have more limitations, but it could even use git or something else behind the scenes, and just hide how it works under the UI. With this people can have simple data protection and recovery built in, without having to understand version control. I think that would cover most dev needs as well, with tools in the space Red lives.

### hiiamboris commented at 2024-07-27T18:28:17Z:

I love git's ideas and hate the implementation :) And all the GUIs to it are even more terrible than the CLI...

I didn't enjoy learning it (even the small bits I actually need), but in the end just bound the most used commands to keyboard shortcuts and after that I can't say "I don't enjoy using git", because as with all the CLI tools the goal is to automate the invocation and put it out of sight, which I did :)

### gor77 commented at 2024-07-28T08:11:02Z:

I thought that would be the case :) 

It seems to me that tools not adequate for the job somehow became 
the standard you are not supposed to question. It's beyond me how and why exactly did that happen. 

What baffles me is that most people blindly accept this. Is it because some people are simply thriving on complexity
or because of the (wrong) assumption that "serious" and powerful tools just have to be difficult to work with, 
I don't know. But it seems wrong, just as it seems wrong that you need to spend not hours or days but weeks and 
months to learn specific GUI toolkit. And when people see Red's way of doing GUI apps, they are like 
"nice, but... this can't be serious". 

What's wrong with the world? 

