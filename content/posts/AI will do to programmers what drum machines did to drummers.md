---
title: "AI will do to programmers what drum machines did to drummers"
description:
date: "2026-01-29T17:45:58+00:00"
draft: true
---
Depending on who you ask, AI is writing 90% of all code. I don’t think that’s true for a majority of organizations, but developers definitely live in a new age. Juniors and new grads are having a tougher time finding entry-level positions, but senior positions are moving up market and are in-demand. What is going on? 
I think AI is doing to programmers what drum machines did to drummers.

Insert picture of Roland-808

*This is not about vibe coding or AI slop. This article is about real engineering practices at scale and the usage of LLMs on engineering workflows*

# Definitions
Let's talk definitions before we go any further. I define the act of coding and programming to be the literal character input of instructions into the machine for future execution. Engineering, is more akin to the architectural, decision, logical thinking side of the process. To be an effective engineer, the act of engineering proceeds the programming. 
# It never was about coding
Culture and media around programmers/hackers has always centered around an image of someone who can expertly manipulate a computer. On the screen that almost certainly looks like a person who spews technical jargon to quickly solve problems, but more importantly someone that can then type just as fast as they can spew their technobabble. 

Due to the sheer amount of culture and media around hackers/nerds/computer people, typing and computer manipulation, is a large part of your perceived ability around software. This ranges from simple ideas like, "Whoa he types at 120 WPM", to "He uses Gentoo with a tiling window manager and has a deadman script in case anything goes wrong." This perceived ability to manipulate a computer has some value, but is definitely not the absolute value of a programmer in corporate environment.

While being a marginally small part of the job, juniors, and undergraduate students tend to latch onto this image of being a super hacker to quickly and easily distiguish themselves as a “real” coder. Just the other day, I was talking to a junior who expressed that, ”you have to be a senior dev that uses neovim in the terminal if you want to understand Rust”. No, you don’t need to use a terminal based editor to learn a lower level language, and using vim or some other editor doesn’t qualify you as a better or worse engineer. I know some fucking idiots that use neovim. Life really does mimic art. 

# The bottleneck
For much of software engineering's history, typing and computer interfacing was a major cost. Punch cards, hand rolled assembly, compile times, and even the hardware itself (including things like screen resolution) placed a hard restriction of how productive you could be. You could only see a certain amount of code at once, you could only iteratively run your program X times in an hour, etc. This principle was roughly the same until only recently. You could only type out so many characters in a span of time. 

As inference gets cheaper and faster, we can see that LLMs “type” much faster than ANY human ever. And don’t fucking bring up people that use stenographs, they can’t even write proper markdown. 

So what is the real bottleneck? I think for now, the real issue is that the input methods that we use to communicate with these models and the lack of long lived context when using these models, and most importantly, the human’s ability to understand and relay their understanding to the machine. 
