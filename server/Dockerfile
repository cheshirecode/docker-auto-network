FROM cheshirecode/dind-with-compose

RUN addgroup -g 1000 -S docker && adduser -u 1000 -D -S -G docker docker && \
    apk add --no-cache openntpd inotify-tools runit curl && \
    sh -c "nohup ntpd -d -f /etc/ntpd.conf -s > /dev/null 2>&1 &"

# copy runit services
USER root
COPY runit/services/ /etc/service/
COPY runit/runit_init /sbin/runit_init
RUN chmod -R +x /etc/service /sbin/runit_init && \
    #replace Windows line-ending with Unix
    find /etc/service/ /sbin/runit_init -type f | xargs sed -i 's/\x0D$//';

WORKDIR /www
ENTRYPOINT ["dockerd-entrypoint.sh"]
# Start
CMD /sbin/runit_init