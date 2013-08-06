FROM ubuntu
MAINTAINER Mike Giarlo <leftwing@alumni.rutgers.edu>

# Get Sphere's dependencies...
RUN echo "\ndeb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install mysql-client mysql-server openjdk-7-jre-headless pwgen python-setuptools vim-tiny wget unzip coreutils libmysqlclient-dev libmagickcore-dev libmagickwand-dev clamav clamav-daemon libclamav-dev ghostscript redis-server curl
RUN easy_install supervisor

# Get Harvard's FITS tool
ADD https://fits.googlecode.com/files/fits-0.6.2.zip /tmp/
RUN unzip /tmp/fits-0.6.2.zip -d /opt/
RUN ln -s /opt/fits-0.6.2/fits.sh /usr/bin/

# Install Ruby via RVM
RUN curl -L https://get.rvm.io | bash -s stable --ruby
RUN bash -l -c rvm requirements
ENV PATH /usr/local/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Add the startup scripts and supervisord configuration
ADD ./start.sh /opt/scholarsphere/start.sh
RUN chmod 755 /opt/scholarsphere/start.sh
ADD ./supervisord.conf /etc/supervisord.conf

# Fetch ScholarSphere
ADD https://github.com/psu-stewardship/scholarsphere/archive/v1.7.5.zip /tmp/
RUN unzip /tmp/v1.7.5.zip -d /opt/scholarsphere/

# Expose the application's ports:
# 3000: UI
# 8983: Jetty (Fedora and Solr)
EXPOSE 3000 8983

CMD ["/bin/bash", "/opt/scholarsphere/start.sh"]
