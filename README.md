Peng and Musulin's TrackerHub App
=================================

This is an app that lets you interact with PivotalTracker and GitHub from one place.

[![Build Status](https://travis-ci.org/bebepeng/peng-musulin-trackerhub.svg?branch=master)](https://travis-ci.org/bebepeng/peng-musulin-trackerhub)
[![Code Climate](https://codeclimate.com/github/bebepeng/peng-musulin-trackerhub.png)](https://codeclimate.com/github/bebepeng/peng-musulin-trackerhub)

URLs
----
* Tracker - [https://www.pivotaltracker.com/n/projects/1075508](https://www.pivotaltracker.com/n/projects/1075508)
* Staging - [http://trackerhub-staging.herokuapp.com/](http://trackerhub-staging.herokuapp.com/)


Setup Instructions
------------------
1. clone this repository
1. run `bundle`
1. run `rake db:create`
1. run `rake db:migrate`
1. create a .env file using .env.example as a guide. Your api token can be found under your Tracker profile.
1. run tests `rspec`
1. open local environment with `rails s`

Gotchas
-------
* Your Tracker API Token and Github Password are sensitive information.
   We have configured VCR to not record this info, and your .env file is in your .gitingore file.
   Any additional features requiring sensitive data that you add and test with VCR should be configured similarly.