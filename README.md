FamilyTime
==========

This is a simple sinatra app to create a page where you can
display times at various locations on the planet.

It uses [Google's timezone api](https://developers.google.com/maps/documentation/timezone/) to calculate the daylight savings offsets.

There's an example deploy at [http://familytime.herokuapp.com/](http://familytime.herokuapp.com/)

Installation
============

    # Checkout the project 
    $ git clone git://github.com/patrickdavey/familytime.git
    $ cd familytime
    
    # Install the project dependencies
    $ gem install bundler
    $ bundle install
    
    # Install the project dependencies
    # Edit the lat/longs in family_time.rb to suit your needs

    # Start the local web server
    $ rackup config.ru

Heroku
======

If you want to run it on herok follow the above steps then

    $ heroku create
    $ git push heroku master

TODO
====

Tests.  Ehem
