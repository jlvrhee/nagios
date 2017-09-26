FROM jasonrivers/nagios:latest
MAINTAINER Jeroen van Rhee <jeroen.vanrhee@kpn.com>

ADD etc/nagios.cfg /opt/nagios/etc/nagios.cfg
ADD etc/objects/commands.cfg /opt/nagios/etc/objects/commands.cfg
ADD bin/Fixed-Access-Host-Event /opt/nagios/bin/Fixed-Access-Host-Event
ADD bin/Fixed-Access-Service-Event /opt/nagios/bin/Fixed-Access-Service-Event
ADD bin/Fixed-Access-Service-Heartbeat /opt/nagios/bin/Fixed-Access-Service-Heartbeat
ADD apache2/sites-enabled/nagios.conf /etc/apache2/sites-enabled/nagios.conf

# Add crontab file in the cron directory
ADD cron/heartbeat-crontab /etc/cron.d/heartbeat-cron
 
 # Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/heartbeat-cron
# Start cron deamon
RUN /usr/sbin/crond -f

# RUN restart nagios ???