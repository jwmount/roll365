# README

Roll365 README
John W. Mount
1. The Roll365 Project
Roll365 is a work bench where we can test ways to handle real time logistics data. As such it makes a number of assumptions to simplify and isolate the bit of the puzzle involved in each model.

2. A little history
The project strives to clarify a design choice and examine the impact of alternative ways to implement them. While Bootstrap is the CSS framework the perfection of the UI is not important unless it obscures the technology issue at hand.

3. Some lessons learned
4. Implementation
Primary release levels rails-v5.2.3@ruby 2.6.2p47
We assume:

You can read

Read the reference manual.

Explore the upper-right toolbox menu to discover how Markdown works.

Alt-Q reformats the current paragraph.

Enjoy!

This README would normally document whatever steps are necessary to get the
application up and running.

## Installation 

### Prerequisites

Clone the app from github:

```$ git https://www.github.com/jwmount/roll365.git```
 
Change into the directory you just created:
 
```$ cd roll365```

Create the postesql tables.

```rails db:drop #Only needed if there were database tables for roll365 already```

```rails db:create db:migrate```

Postgresql needs to be running and if it isn't, start it.

```? how```

Start the app from your terminal window:

```$ bundle exec foreman start```

The roll365 app should start and give you the landing page.  Reqular Rails based models are listed and the hypertack features are in the Dashboard.

## Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
