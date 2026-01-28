---
title: "Game Dev for the World's Smallest Console"
date: 2022-11-24T00:39:37Z
draft: false
---

# my introduction to the thumby

A few weeks ago, my friends and I were at a concert waiting for the main act to go on when a buddy whipped out a Thumby on his keychain. 
I've never seen anything like it before and honestly thought it was just a cute little keychain accessory. I was absolutely floored when it actually turned on and started playing pong. 

![](/images/thumby/thumbykeys.png)

After the concert I immediately bought a Thumby for everyone in my family with decent eyesight.

# the thumby overview

The Thumby is actually just a RaspberryPi Pico under the hood with an OLED screen, rechargeable battery, and buttons. It's made by TinyCircuits and at the time of writing is available [here](https://tinycircuits.com/products/thumby) or on Amazon for about $30. 
The Thumby has a whopping 2MB of storage for games and supports multiplayer through a link cable. 

# open source goodness

My favorite thing about the Thumby is the fact that it's open source! If this thing only came with the 5 games it was preloaded with, it'd become e-waste pretty quickly. Thankfully there's a decently large community and a repository of Thumby games/projects with 50 contributors. Some people have made some incredible things and you can join on the fun too. I think that making a game for the Thumby is the perfect way to start contributing to open source.

# my game

The game I made for the Thumby is called Astro Jumper. It's inspired by the classic mobile games Papi Jump, and the more widely known Doodle Jump. 

![](/images/thumby/splashscreen.png)

My brother in-law is meta-ironically obsessed with Among Us, so I made the character a crewmate. 
You can watch a short demo of the game [here](https://youtu.be/mDuT7RkSMFo)

# dev experience

If you've ever made a 2D game with sprites before, you'll feel pretty comfortable making a game for the Thumby. TinyCircuits has made an incredible Web IDE for the Thumby complete with an emulator. 

There is no real game engine for the Thumby, but there is are apis for graphics, audio, and other things. There is a MicroPython and a C/C++ Arduino library that you can use. 

Because of a lack of a full-fat game engine things like collision detection and animations take a fair bit of work and sometimes some hacky tricks, but I think it makes the game development process that much more fun. 

# gaming minimalism

I never would have thought that I would get so much enjoyment out of such a simple little thing. I almost always find myself reaching for my keys instead of my phone when I have some time to kill. 
Playing games on my Thumby has always been better than opening my phone to doom scroll and leaves me in a better mood. 



