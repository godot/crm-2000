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
