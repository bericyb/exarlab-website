---
title: Brainstorming With The AI In My Vault
description: A small agent for brainstorming
date: 2026-01-30T17:36:19+00:00
draft: false
---
2025 was the year of agents and I can't help but think that for the millions of agents out there, most of them are solutions seeking for a problem. Say what you will about coding agents since they're here to stay, but for the lay-person, how are they using AI? From what I gather with my non technical co-workers, outside of vibe coding they use AI to answer questions like google normally would, or to help them brainstorm something or review something before they send it out to their boss or co-workers. I think this brainstorming is a really powerful use case, but unfortunately the ChatGPT or Claude web/desktop apps as well as Notion are really ill suited for this sort of usage. 

# Pre AI Brainstorming
Brainstorming before AI for me looked a lot like grabbing a notebook, sitting in a room with a friend, or whiteboarding something out. The digital solution to this for me was and has been Obsidian. The option to just write markdown and and have access to my files for manipulation has always been nice. The client is available on mobile and desktop and syncs automagically across Apple and Android (for a price).

# AI Brainstorming
Using the ChatGPT web app was a great leap forward from regular text completion behind an API, but it's still clunky. 
The side bar with just a fat list of chats prior is embarrassing to keep open when sharing your screen with co-workers, and threads can be extremely long and recall of information a bit of a chore. Chat threads just aren't great for idea storage. You don't text your friend with ideas you want to remember 3 years from now. 

 For idea formulation, you don't want AI just generating and writing everything either. Sycophancy aside, it is nice to have an AI there to help formulate and work through ideas not just take the wheel and drive away with whatever you were thinking about. I think Notion has a great AI integration for RAG, but dropped the ball for this brainstorming use case. I don't want to have AI write up and think for me, I want to think alongside it and answer quick questions as I work through ideas.

For myself, the usual workflow looks like having a conversation with AI, then at the end of a session asking the AI to create a summary of everything that we had talked about in markdown to then be copied into my Obsidian vault. It's clunky, and revisions are not really an option. Often the AI would forget certain topics we'd talked about, so I decided to make a solution of my own. 

# Cerebra
I've created an agent that's locked in my Obsidian vault. It's named Cerebra. I've given them 1 folder called `Agent` that they have free rein over. Cerebra can take it's own notes, and edit files as much as it wishes in that directory like it's its own brain. It has the benefit that I can peek into its brain whenever I want as well. In the `Agent` folder, lives the system and the rules prompts as markdown files. Cerebra has permission to edit it's own system prompt and rules so as I talk to it I can say "Never ask 'What can I do next for you?' again, it's annoying", and it self regulates. 

Cerebra also has access to my entire vault aside from blacklisted files. My primary mechanism for brainstorming with AI involves running Cerebra and talking back and forth about ideas or notes in my vault. All the while, Cerebra can edit and write notes for me during the brainstorming session, but they exist in a searchable and organized way like my original thoughts in Obsidian. 

Eventually I want Cerebra running as a plugin for Obsidian right inside the client, but the CLI interface is good enough for me now. 

I encourage everyone to make their own agents/products if you feel like you're underserved by the current products that you use. It's a great time to be a builder right now and I hope this inspires someone to build something themselves.