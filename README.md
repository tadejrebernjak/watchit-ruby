# WatchITonRails

* A video sharing website inspired by YouTube and made with Ruby on Rails
* Online version available at https://watchit-on-rails.herokuapp.com

## Description

This website includes uploading, searching and watching videos, liking/disliking videos, subscribing to other users, commenting on videos and replying to comments and supports Google authentication

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

* Start the rails server
```
rails s
```
* You may now open the project in your browser on http://localhost:3000

## Gems used

### Authentication

* Devise - https://github.com/heartcombo/devise
* OmniAuth Google OAuth2 - https://github.com/zquestz/omniauth-google-oauth2
* OmniAuth - Rails CSRF Protection - https://github.com/cookpad/omniauth-rails_csrf_protection

### Features

* Commontator - https://github.com/lml/commontator
* Punching Bag - https://github.com/biola/punching_bag
* Acts As Votable - https://github.com/ryanto/acts_as_votable

### Video Thumbnail Processing

* Image Processing - https://github.com/janko/image_processing
* Minimagick - https://github.com/minimagick/minimagick
