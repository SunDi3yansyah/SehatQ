<p align="center">
  <img src="https://rec-data.kalibrr.com/logos/KBYBGNRURMJFDEJB4CQ4HH5LMFA4X3AKSBD7ZVZK-5cc821e9.png" alt="Sinatra logo">
</p>

<h1 align="center">Test SehatQ by Cahyadi Triyansyah</h1>


## Status

[![Build Status](https://travis-ci.org/SunDi3yansyah/SehatQ.svg)](https://travis-ci.org/SunDi3yansyah/SehatQ)
[![GitHub last commit](https://img.shields.io/github/last-commit/SunDi3yansyah/SehatQ.svg)](https://github.com/SunDi3yansyah/SehatQ/commits/master)
[![GitHub issues](https://img.shields.io/github/issues/SunDi3yansyah/SehatQ.svg)](https://github.com/SunDi3yansyah/SehatQ/issues)


## Postman
[![Run in Postman](https://run.pstmn.io/button.svg)](https://documenter.getpostman.com/view/920672/SzKWucnb)


## Tech Stack

- You can see on [Gemfile](Gemfile)


## Requirements

- Ruby
- SQLite


## Setup

#### Quick Setup / Re-Setup:
```
rails db:drop db:create db:migrate
```

#### Development Environment:
```bash
bundle install --without production
```

#### Test Environment:
```bash
bundle install --without development production
rspec
```

#### Production Environment:
```bash
bundle install --deployment --without development test
```

#### Secret Key Base:
```bash
rails secret
```

#### Clear Caches:
```bash
rails tmp:clear
```

#### Clear Logs:
```bash
rails log:clear
```

#### Run Web Server (puma)
```
rails s
```

#### Generate SDoc:
```bash
gem install sdoc
sdoc -o doc/ -T rails -t sehatq
```
