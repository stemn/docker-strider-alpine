FROM node:alpine

RUN apk add --update \
    --repository http://dl-3.alpinelinux.org/alpine/edge/main \
    git curl make gcc g++ libgcc libstdc++ libc6-compat && \
    rm -rf /var/cache/apk/*

VOLUME /home/strider/.strider

# Create User
RUN adduser -g '' -h /home/strider -D strider 

# Add permissions to user
RUN mkdir -p /home/strider && mkdir -p /opt/strider
RUN chown -R strider:strider /home/strider
RUN chown -R strider:strider /opt/strider

# Build as root 
USER root
RUN ln -s /opt/strider/bin/strider /usr/local/bin/strider
RUN git clone --depth 1 https://github.com/Strider-CD/strider /opt/strider/src &&\
    cd /opt/strider/src && npm install && npm run build



COPY start.sh /usr/local/bin/start.sh

#ADD strider.conf /etc/supervisor/conf.d/strider.conf

EXPOSE 3000

USER root

CMD ["bash", "/usr/local/bin/start.sh"]