FROM jasonrivers/nagios:latest
MAINTAINER Jeroen van Rhee <jeroen.vanrhee@kpn.com>

ADD etc/nagios.cfg /opt/nagios/etc/nagios.cfg
ADD etc/objects/commands.cfg:/opt/nagios/etc/objects/commands.cfg
ADD bin/Fixed-Access-Host-Event:/opt/nagios/bin/Fixed-Access-Host-Event
ADD bin/Fixed-Access-Service-Event:/opt/nagios/bin/Fixed-Access-Service-Event
ADD apache2/sites-enabled/nagios.conf:/etc/apache2/sites-enabled/nagios.conf



# RUN restart nagios ???