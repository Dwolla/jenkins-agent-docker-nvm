CORE_TAG := $(CORE_JDK11_TAG)
JOB := core-$(CORE_TAG)
CLEAN_JOB := clean-$(CORE_TAG)

all: ${JOB}
clean: ${CLEAN_JOB}
.PHONY: all clean ${JOB} ${CLEAN_JOB}

${JOB}: core-%: Dockerfile
	docker buildx build \
	  --platform linux/amd64,linux/arm64 \
	  --build-arg CORE_TAG=$* \
	  --tag dwolla/jenkins-agent-nvm:$*-SNAPSHOT \
	  .

${CLEAN_JOB}: clean-%:
	docker rmi dwolla/jenkins-agent-nvm:$*-SNAPSHOT
