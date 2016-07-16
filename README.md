[![Build Status](https://travis-ci.org/emgord/CupboardCook.svg?branch=master)](https://travis-ci.org/emgord/CupboardCook)

<a href="https://codeclimate.com/github/emgord/CupboardCook"><img src="https://codeclimate.com/github/emgord/CupboardCook/badges/gpa.svg" /></a>

# Cupboard Cook

## Concept

Do you have tons of stuff in your pantry but still don't know what to make? Tired of cooking the same old thing and looking for inspiration? Did you impulse buy purple cornmeal but are not sure what to do with it? [Cupboard Cook](https://www.cupboard-cook.com/) is a pantry tracking tool that generates recipes you can make right now using ingredients that you already have. Cupboard Cook also prevents food waste by helping people use up ingredients that might otherwise go to waste.

View it live at www.cupboard-cook.com.

## Technology

*  Ruby on Rails backend
*  React frontend
*  PostegreSQL in production, SQLite3 in development
*  OAuth login with Google
*  Travis CI for integrated testing
*  Deployed with AWS Elasticbeanstalk
*  Webcrawler built with Scrapy framework in Python: github.com/emgord/NYTimesCookingCrawler
*  Elasticsearch

### About
- This project was created by [Emily Gordon](https://github.com/emgord) as a Capstone Project for [Ada Developers Academy](www.adadevelopersacademy.org) in March 2016.

### Installation
- Clone the repository: `git clone git@github.com:emgord/CupboardCook.git`  
- In the terminal navigate into the directory and run `bundle install` to install project gems
- Run `rake db:migrate` to create the project database.  
- Install [Elasticsearch](https://www.elastic.co/guide/en/elasticsearch/reference/current/setup.html). With Homebrew use `brew install elasticsearch`. Start the Elasticsearch server: `elasticsearch`  

### Ruby version
- 2.2.3

### Rails version
- 4.2.5
