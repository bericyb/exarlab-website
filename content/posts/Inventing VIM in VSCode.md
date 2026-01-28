---
title: "Re-inventing Vim in VSCode"
description:
date: "2026-01-27T21:19:00+00:00"
draft: false
summary: A curious case of independent discovery
---
Sophomore year of my undergrad was a time of experimentation with my workflow. I spent an embarrassing amount of time on configuring i3 and distro hopping to find the “perfect” setup. Looking back I wish I spent more time on learning the fundamentals of CS, but life is an exhaustive search problem and sometimes you end going down the wrong rabbit hole. 

Along the way I found that in writing Java and C++ for classwork, the most time consuming action was jumping to the end of a line to insert a semicolon. Removing my hands from the home row to hit the arrow keys was too time consuming and was starting to cause some RSI problems in my right hand. 

# Discovering settings.json

VSCode was my editor of choice back in those days after trying Atom for a good while. VSCode’s strength is its customization and I soon realized that many of the bindings that I used for i3 could be adapted to VSCode. At the time, the only terminal editor I knew of was Nano. 

VSCode isn’t a modal editor nor did I know what a modal editor would be, but I made do with what I had. With my super key taken by i3, I turned the left ctrl key into my edit mode equivalent. 

In my mind, IJKL made sense as a left hand version of WASD. So the first custom binding I created was ctrl+IJKL to move between white spaces and lines vertically. Next I added ctrl+; to jump to the end of a line. This was amazing to me. I could quickly move within a line on up and down a line, edit some code, and essentially double tap semicolon to finish off a line. 

Eventually I added some other motions that mimicked the behavior of left hand control on the right hand, but I didn’t use them much. 

# Discovering Vim Motions
I used my janky custom bindings for about a year until I discovered Vim motions. On initial discovery I didn’t think it had much to offer over my own bindings, but soon I learned about the different compound motions and commands built into vim. After a weekend of learning the different modes, and the common motions, I moved to vim motions full time in all my editors. 

Vim motions has truly changed my life. I use them everywhere I can, including obsidian where I’m writing this blog post right now. 


# Human Computer Interfaces
I think that keyboard based Human computer interfaces still have considerable room for improvement. The fact that just a little bit of thought from a college sophomore can cause the similar solutions to keyboard inefficiency to emerge completely separately is incredible. 

Recently I used the new Meta Ray Bans Display on a trip to SF. The neural band tech was absolutely mind blowing. I truly felt that it was the future. Not a big fan of Meta, but I can’t wait for that tech to trickle down into everyday tech like a smartphone or laptop. Soon we will have both intuitive and powerful methods of computer interaction enabled by new hardware and on-board compute which is exciting. 

LLMs are really close to making natural language interfaces usable for the majority of people, we just need a more discrete and convenient way to input text that agents can then expand and act upon. I'm excited for what the future of HCI is. 