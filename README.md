Dockerized Sufia
================

A [dockerized](http://docker.io) development instance of [Sufia](http://github.com/projecthydra/sufia), a Rails engine that provides self-deposit and proxy deposit workflows atop a repository platform based on Fedora Commons & Solr (running in a Jetty container), MySQL, and Redis.

Installation
------------

1. Install [Docker](http://www.docker.io/gettingstarted/)
1. Clone this repository
1. Change into the source directory: `cd docker-sufia`
1. Build the container: `docker build -t <yourname>/sufia .`
1. Run Sufia: `docker run -d <yourname>/sufia`
1. View open ports via `docker ps` and note the port forwarding to 3000
1. Browse to http://localhost:<THE_PORT>/
