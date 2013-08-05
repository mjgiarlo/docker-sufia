FROM ubuntu
MAINTAINER Mike Giarlo <leftwing@alumni.rutgers.edu>

# Get Sufia's dependencies...
RUN echo "\ndeb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install mysql-client mysql-server openjdk-7-jre-headless pwgen python-setuptools vim-tiny wget unzip coreutils libmysqlclient-dev libmagick-dev libmagickwand-dev clamav clamav-daemon libclamav-dev ghostscript
RUN easy_install supervisor

# Get Harvard's FITS tool
RUN wget https://fits.googlecode.com/files/fits-0.6.2.zip
RUN unzip fits-0.6.2.zip -d /
RUN echo $PATH
RUN ls -la /

# Add the startup scripts and supervisord configuration
ADD ./start.sh /start.sh
RUN chmod 755 /start.sh
ADD ./supervisord.conf /etc/supervisord.conf

# Fetch Sufia
RUN wget https://github.com/projecthydra/sufia/archive/v3.0.0.zip
RUN unzip v3.0.0.zip -d /

# Expose the application's ports:
# 3000: UI
# 8983: Jetty (Fedora and Solr)
EXPOSE 3000 8983

CMD ["/bin/bash", "/start.sh"]