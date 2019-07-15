# README

Roll365 README

1. The Roll365 Project

Roll365 is a work bench.  Some of the lessons learned from earlier versions of the Think360 logistics software can be tried out and refined here.  

1.1  Some of the quesitons of interest are:
* How difficult is it to limit association nesting to 1 level? (The original version went as deep as 5 levels which worked and was unmaintainable.)
* How extensively can polymorphic associations be used and what is the best way to create them?
* Can Show views be enriched to serve as dashboards for multiple data models?
* Is it feasible to combine Rails 5 and Hyperstack create a hybrid app, in the form of a dashboard based on Hyperstack, to address some of the problems for use cases that involve real time information?  (The answer is yes, you can do this, see 'Dashboard'.  But it also appears to be an inferior solution if the whole application can be re-designed based on HyperStack.  )


1.2. CSS issues are less important to answer some of the issues involved and since no direct production release is imagined or planned by and large the UI is not important unless it obscures or reveals something interesting or useful about the technology issue at hand.

1.3. Installation

Primary release levels rails-v5.2.3@ruby 2.6.2p47

## Installation 

Clone the app from github:

```$ git https://www.github.com/jwmount/roll365.git```
 
Change into the directory you just created:
 
```$ cd roll365```

Create the postesql tables.

```rails db:drop #Only needed if there were database tables for roll365 already```

```rails db:create db:migrate```

```rails db:demo2```

Postgresql needs to be running and if it isn't, start it.

```? how```

Start the app from your terminal window:

```$ bundle exec foreman start```

The roll365 app should start and give you the landing page.  Reqular Rails based models are listed and the hypertack features are in the Dashboard.



