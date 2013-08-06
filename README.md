Dockerized ScholarSphere
========================

A [dockerized](http://docker.io) development instance of [ScholarSphere](http://github.com/psu-stewardship/scholarsphere), a Rails application that provides self-deposit and proxy deposit workflows atop a repository platform based on Fedora Commons & Solr (running in a Jetty container), MySQL, and Redis.

Installation
------------

1. Install [Docker](http://www.docker.io/gettingstarted/)
1. Clone this repository
1. Build the container: `docker build -t <yourname>/scholarsphere .`
1. Run ScholarSphere: `docker run -d <yourname>/scholarsphere`
1. View open ports via `docker ps` and note the port forwarding to 3000
1. Browse to http://localhost:<THE_PORT>/
