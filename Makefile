CORE_TAGS := $(JDK8_TAG) $(JDK11_TAG)
JOBS := $(addprefix core-,${CORE_TAGS})
CLEAN_JOBS := $(addprefix clean-,${CORE_TAGS})

all: ${JOBS}
clean: ${CLEAN_JOBS}
.PHONY: all clean ${JOBS} ${CLEAN_JOBS}

${JOBS}: core-%: Dockerfile
	docker build \
	  --build-arg CORE_TAG=$* \
	  --tag dwolla/jenkins-agent-nvm:$*-SNAPSHOT \
	  .

${CLEAN_JOBS}: clean-%:
	docker rmi dwolla/jenkins-agent-nvm:$*-SNAPSHOT
