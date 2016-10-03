FROM dwolla/jenkins-agent-core
MAINTAINER Dwolla Dev <dev+jenkins-nvm@dwolla.com>
LABEL org.label-schema.vcs-url="https://github.com/Dwolla/jenkins-agent-docker-nvm"

ENV NVM_VERSION=v0.32.0 \
    NVM_DIR="/home/jenkins/.nvm"

USER root

RUN apk add --update docker tar nodejs python make && \
    rm -rf /var/cache/apk/*

USER jenkins

RUN curl -L https://raw.githubusercontent.com/creationix/nvm/${NVM_VERSION}/install.sh | /bin/bash
