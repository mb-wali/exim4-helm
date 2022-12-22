FROM debian:jessie
# This dockerfile was inpired by greinacker/exim4

# create rootless user
RUN groupadd -g 1000 onetime && \
    useradd -m -d /var/lib/onetime -s /bin/nologin -u 1000 -g 1000 onetime
  
# install packages: exim4, mailutils
RUN apt-get update \
 && apt-get install --no-install-recommends -y --force-yes \
  exim4-daemon-light mailutils xtail vim \
 # Slim down image
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/man/?? /usr/share/man/??_* \
 && chmod 777 /var/spool/exim4 \
 && ln -sf /dev/stdout /var/log/exim4/mainlog \
 && ln -sf /dev/stderr /var/log/exim4/panic \
 && ln -sf /dev/stderr /var/log/exim4/reject \
 && chmod 0755 /usr/sbin/exim4


# add the exim4 start script
RUN chown -R onetime /etc/exim4 /var/lib/exim4 /var/log/exim4 
RUN chmod -R o-rwx /etc/exim4 /var/lib/exim4 /var/log/exim4

ADD start.sh /exim_start
RUN chmod +x /exim_start

ENV EXIM_LOCALINTERFACE=0.0.0.0
ENV EXIM_ALLOWED_SENDERS=10.0.0.0/8:172.16.0.0/12:127.0.0.1:192.168.0.0/16

USER onetime

ENTRYPOINT ["/exim_start"]
