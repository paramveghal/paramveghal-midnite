# Overview
The app contained in this project is designed to download a list of "matches" and display them. 

As it stands, the app has a very basic design and architecture, no tests, and a compiler error. It also has a couple of bugs.

There is one "known" bug, detailed below, and one that you will come across yourself. There are also a couple of feature tasks. It's entirely up to you what you choose to address. There are only two limitations we'd put on how you approach this task:

1. The final product must be shippable (interpret that how you see fit).
2. You should spend no longer than 2.5 hours on the task.

We want to use this task to get an insight into your technical skill but, as importantly, how you approach prioritising tasks and what you think brings the most value.

# Suggested tasks

## Known bug
When I launch the app, I experience a crash.

## Design suggestion
Here is an example of how we present our match cells in Midnite:

![IMG_5972](https://user-images.githubusercontent.com/99171820/159696111-e0f4b8e7-7044-48a1-85f2-54f5b3be32c6.jpg)

This is just a suggestion, but generally speaking it would be good to improve upon what's in the app currently. How you do this is up to you.

## Feature #1 - add individual match page
Contained in the match list JSON should be a match ID (just marked `id`). 

This can be passed into this URL https://api.midnite.com/v1/matches/{ID} to get a fully-formed match object.

This view should be presented when the user taps a match. Note that we don't expect any major design-work to be done here, we're more interested in how you navigate between views and model the data.

## Feature #2 - local favouriting system
In the future we're planning on allowing users to favourite items that come down from the API. While the favourites will likely be stored on the server, it would be good to see how the mobile part might be implemented, and how you might store that information without a server. Again the design isn't *that* important here. What's important is a demonstration of persistence, managing data, and handling the user interactions.

# General expectations
As much as it would be nice to implement everything here, what we're most interested in is code quality and decision making. Consider what you choose to implement and how you implement it, because this will help structure our followup conversation.

Let us know if you have any questions, and good luck!
