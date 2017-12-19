FROM node:alpine

# Clone the alpine package
RUN apk add --update \
    --repository http://dl-3.alpinelinux.org/alpine/edge/main \
    git curl make gcc g++ python libgcc libstdc++ libc6-compat \
    && rm -rf /var/cache/apk/*

# Set the working directory
WORKDIR /app

# Clone Strider
RUN git clone https://github.com/Strider-CD/strider.git
RUN cd strider && npm install 

RUN ../

# Add directories
ADD package.json .
ADD src src

# Install the node packages
RUN npm install 


