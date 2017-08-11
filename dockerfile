From centos:7 as Radius-Dev-Centos7
MAINTAINER Aaron nelaaro@gmail.com
ARG debug=''
ENV debug=${debug}

# Install the stuff I might develop modules and test with.
# yum install freeradius.x86_64 freeradius-perl.x86_64 freeradius-python.x86_64 freeradius-utils.x86_64
RUN  yum -y install \
freeradius.x86_64 \
freeradius-perl.x86_64 \
freeradius-python.x86_64 \
freeradius-utils.x86_64; \
yum -y clean all;

RUN cd /etc/raddb; \
/bin/ln -s ../sites-available/control-socket "./sites-enabled/control-socket"

# fix config to allow raddebug
RUN /bin/sed -i -e 's/#\tmode = rw/\tmode = rw/' /etc/raddb/sites-enabled/control-socket


# Expose ports
EXPOSE 1646 1645 1813 1812

CMD /sbin/radiusd -f
