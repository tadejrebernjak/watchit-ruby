# WatchITonRails

A video sharing website inspired by YouTube and made with Ruby on Rails
Online version available at https://watchit-on-rails.herokuapp.com

## Description

This website includes uploading, searching and watching videos, liking/disliking videos, subscribing to other users, commenting on videos and replying to comments and supporting Google authentication.

## Getting Started

### Dependencies

* Ruby on Rails installed on your system
* Postgresql installed on your system

### Installing

* Download the project
* Install Ruby gem dependencies
```
bundle install
```
* Install library dependencies for video processing
```
sudo apt update
sudo apt install imagemagick
sudo apt update
sudo apt install ffmpeg
```
* Migrate the database
```
rake db:migrate
```

### Executing program

* Start the rails serber
```
rails s
```
* You may now open the project in your browser on http://localhost:3000
