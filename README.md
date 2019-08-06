# README

Roll365 README

1. The Roll365 Project

Roll365 is a work bench.  Some of the questions raised from earlier versions of the Think360 logistics software are tried out and refined here.  The size of the app is reduced from a total of 24 data models.

1.1  Some of the quesitons of interest are:
* How difficult is it to limit association nesting to 1 level? (The original version went as deep as 5 levels which worked and was unmaintainable.)
* How extensively can polymorphic associations be used and what is the best way to create them?
* Can Show views be enriched to serve as dashboards for multiple data models?
* Is it feasible to combine Rails 5 and Hyperstack create a hybrid app, in the form of a dashboard based on Hyperstack, to address some of the problems for use cases that involve real time information?  (The answer is yes, you can do this, see 'Dashboard'.  But it also appears to be an inferior solution if the whole application can be re-designed based on HyperStack.  )


1.2. CSS issues are less important to answer some of the issues involved and since no direct production release is imagined or planned by and large the UI is not important unless it obscures or reveals something interesting or useful about the technology issue at hand.

1.3. Configuration (see Gemfile for required versions of gems)

Primary release levels are rails-v5.2.3@ruby 2.6.2p47
hyperstack:install ()
Hyperstack
WebPack
Yarn
postgresql (at least if Production is on Heroku)
... incomplete, borrow from the Hyperstack Todo tutorial Installation and Setup (~> 1.0.alpha1.5)


# Installation 

## Local or Development 

If you don't already have it, install Rails 5.2.3 and ruby ruby 2.6.2p47 (use rvm for Ruby)

**[TODO] REFER TO Hyperstack Installation Tutorial**

```gem install rails```

At this point you can do a full Hyperstck install:

```bundle exec rails hyperstack:install```

Clone the app from github:

```$ git https://www.github.com/jwmount/roll365.git```
 
Change into the directory you just created:

```$ cd roll365```

Create the postesql tables.

```rails db:drop #Only needed if there were database tables for roll365 already```
```rails db:create db:migrate```
```rails db:seed```
```rails db:demo2```


cd into roll365 and install Procfile which should look like this:

```web:        bundle exec rails s -b 0.0.0.0 ``` 
```hot-loader: bundle exec hyperstack-hotloader -p 25222 -d app/hyperstack```

Run bundler to make sure all the gems you need are in place

```bundle update```

Start the app from a command line

```bundle exec foreman start```


The roll365 app should start and give you the landing page.  Reqular Rails based models are listed and the hypertack features are in the Dashboard.

## Heroku




