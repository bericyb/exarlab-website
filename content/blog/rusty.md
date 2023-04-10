---
title: "Should I Learn Rust?"
date: 2023-04-09T15:46:07Z
draft: false
---

# Intro
You've probably seen someone online or around you evangelizing Rust. To my observation, these voices are seeming to get louder and more prominent. You're beginning to wonder what all the hype is about. You're at the end of the diving board, but you just can seem to jump in.

This is the one big problem with Rust.

Rust is one of those things that are simultaneously alluring and off-putting. 

Similar lifestyles or activities come to mind. Flying drones, van life, starting your own small business, or scuba diving. There are so many people that say, "I would love to live out of a camper van and drive all across the country" and I would argue that many programmers say the same thing about Rust. I know, because I was one of them. 

# No More Excuses

I always hesitated learning Rust because I used Ruby and GoLang at work. But this was really just an excuse. Besides, I didn't really learn any Ruby or GoLang the year that I was at that company. 

Later, I had another excuse that I didn't have the time for Rust's rather steep learning curve. I had things to build and projects to get done. Well, those projects never got completed anyways because I was binge watching YouTube videos on why Rust is so great.  

It can be hard to invest time into things that we genuinely think we want to do. 

One of my great vices is YouTube. Like many others I will watch so much content about the stuff I want to do instead of actually doing it. 
Living in someone else's dream of doing what you want to do yourself: This is the world's greatest trap and it's time to do something about it. 

The solution is to actually learn Rust. I know you want to. Let's just do it.

# Getting Started 

Open up the terminal. Here we go. 

1. Linux or MacOS? Run this.  Windows [here](https://forge.rust-lang.org/infra/other-installation-methods.html#:~:text=x86_64%2Dunknown%2Dnetbsd-,Standalone%20installers,-The%20official%20Rust)

    `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`

2. Decide on something to build. 

    Hello World isn't gonna cut it, but we don't need to build Facebook. I decided on a [CLI Pomodoro timer](https://github.com/bericyb/Roma). Something simple that you could easily build in a language you're already comfortable in. 

3. Build it. 
   
    Ask ChatGPT to teach you Rust. It's an amazing tutor you can ask best practice questions to. 


# Difficulties

Rust is challenging to learn. I believe by spelling out what exactly is difficult, we make the process a little easier and the learning curve far more bearable. Here are some things that I wish I knew better before starting.

![](https://stevedonovan.github.io/rust-gentle-intro/PPrustS.png)

1. Rust is a different paradigm of memory management. 
   
    Javascript, Python, or GoLang have memory management abstracted away from you.
   
    C and C++ have the programmer manage memory. 
   
    Rust has the ownership system which is enforced by the complier. This means the programmer manages the memory, but the compiler won't let you be a bad programmer. More info [here](https://doc.rust-lang.org/book/ch04-01-what-is-ownership.html)

2. Rust's standard library is (really) small. 

    I was often frustrated when something simple that I wanted to do in Rust needed me to bring in a library. How am I supposed to know that so crate called "Anyhow" is the go-to error type. And I need some kind of runtime called "Tokio"? WTF?

    It's ok. There is a reason why it is this way explained well [here](https://blog.nindalf.com/posts/rust-stdlib/)
    
    Getting involved in conversations about Rust greatly helps in navigating the problem of what packages to use. [Blessed.rs](https://blessed.rs/crates) is a great resource.

    It can be hard to know what crates to use, when and how, but that's part of learning Rust. Be adventurous and explore libraries. Don't fear library lock-in. 

3. Rust uses Macros pretty extensively.
 
    Macros are a form of metaprogramming. A way to make code write code. 
    
    Macros have some unique syntax that you may not be used to. Just learn what they are and how to identify them in the wild. 

    More info [here](https://blog.logrocket.com/macros-in-rust-a-tutorial-with-examples/)

# Good Luck!

Deciding to learn Rust doesn't mean that you're gonna love it. It doesn't mean you have to ditch Javascript or whatever language you currently love. 

But here's the thing, you have nothing to lose besides some time, which you would have wasted elsewhere anyways.
Odds are, if you've made it this far into this blog post, you've been on the fence about learning Rust for a while now. I encourage you to jump in. 

After all, what's the worst that could happen? You learn a new programming language that is safe and ultra performant.
    