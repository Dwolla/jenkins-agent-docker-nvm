# Jenkins Agent with nvm

[![](https://images.microbadger.com/badges/image/dwolla/jenkins-agent-nvm.svg)](https://microbadger.com/images/dwolla/jenkins-agent-nvm)
[![license](https://img.shields.io/github/license/dwolla/jenkins-agent-docker-nvm.svg?style=flat-square)](https://github.com/Dwolla/jenkins-agent-docker-nvm/blob/master/LICENSE)

Docker image based on [Dwolla’s core Jenkins Agent Docker image](https://github.com/Dwolla/jenkins-agent-docker-core) making [nvm](https://github.com/creationix/nvm) available to Jenkins jobs.

## Local Development

With [yq](https://kislyuk.github.io/yq/) installed, to build this image locally run the following command:

```bash
make \
    CORE_JDK11_TAG=$( curl --silent https://raw.githubusercontent.com/Dwolla/jenkins-agents-workflow/main/.github/workflows/build-docker-image.yml | \
        yq .on.\"workflow_call\".inputs.CORE_TAG.default) \
    all
```

Alternatively, without [yq](https://kislyuk.github.io/yq/) installed, refer to the CORE_TAG default values defined in [jenkins-agents-workflow](https://github.com/Dwolla/jenkins-agents-workflow/blob/main/.github/workflows/build-docker-image.yml) and run the following command:

`make CORE_JDK11_TAG=<default-core-jdk11-tag-from-jenkins-agents-workflow> all`