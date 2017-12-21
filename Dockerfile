FROM node:alpine
LABEL maintainer="tom@stemn.com"

RUN apk add --update \
    --repository http://dl-3.alpinelinux.org/alpine/edge/main \
    git curl make gcc g++ libgcc libstdc++ libc6-compat \
    openssh python && \
    rm -rf /var/cache/apk/*

#Stemn specifici Dependencies 
RUN apk add --update \
    --repository http://dl-3.alpinelinux.org/alpine/edge/testing \
    vips-tools vips-dev fftw-dev \
    rm -rf /var/cache/apk/*

VOLUME /home/strider/.strider

# Create User
RUN adduser -g '' -h /home/strider -D strider 

# Add permissions to user
RUN mkdir -p /home/strider && mkdir -p /opt/strider
RUN chown -R strider:strider /home/strider /opt/strider

# Build as root 
USER root
RUN git clone --depth 1 https://github.com/Strider-CD/strider /opt/strider/src &&\
    cd /opt/strider/src && npm install && npm run build

# Link to bin so we just have to call strider
RUN ln -s /opt/strider/src/bin/strider /bin/strider

# Expose port 3000
EXPOSE 3000