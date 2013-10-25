CRM 2000
========

Installation
------------

The application requires a running MongoDB server.

### Setting up a local MongoDB server

A MongoDB distribution can be downloaded from the [official page](http://www.mongodb.org/downloads).

To set up a single server instance you must create the default database directory:

    mkdir -p /data/db

and run a database process:

    bin/mongod


### Configuring Mongoid

Default configuration is created by a generator:

    rails generate mongoid:config

### Starting GruntJS

  Go to /lib/fronted/

  npm install
  bower install
  grunt server

Generating assets to /public

  Go to /lib/fronted/

  grunt build --force

### Start Application
bundle install
cp application.yml.example application.yml

## Heroku Deploy
git remote add heroku git@heroku.com:crm-2000.git
git push heroku master

### SMS GATEWAY SETUP

application.yml:

    PROMOSMS_LOGIN: email
    PROMOSMS_PASSWORD: password
    PROMOSMS_URL: https://panel.promosms.pl

    APPLICATION_TOKEN: token # allows sending smsemesssems using API

### API

#### available resources:

##### /api/members

    attributes:
        id
        name: required
        phone: uniq,
        email

#### esemeseseses

    request:
        methods: POST
        url  : /api/sms_notifications
        json :
            application_token: ENV['APPLICATION_TOKEN']
            sms_notification:
                to      : array <phone-number>
                message : message
