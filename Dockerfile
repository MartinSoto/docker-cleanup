FROM alpine:latest

CMD ["/run.sh"]

ENV CLEAN_PERIOD=**None** \
    DELAY_TIME=**None** \
    KEEP_IMAGES=**None** \
    KEEP_CONTAINERS=**None** \
    LOOP=true \
    DEBUG=0

# run.sh script uses some bash specific syntax
RUN apk update \
    && apk add bash coreutils grep \
    && echo 'http://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories \
    && apk update \
    && apk add 'docker>=1.10.0'

# Install cleanup script
ADD docker-cleanup-volumes.sh /docker-cleanup-volumes.sh
ADD run.sh /run.sh

