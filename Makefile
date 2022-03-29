CORE_TAGS := sha-d3e1fed-8u322-b06-jdk sha-d3e1fed-11.0.14.1_1-jdk
JOBS := $(addprefix core-,${CORE_TAGS})
CHECK_JOBS := $(addprefix check-,${CORE_TAGS})
CLEAN_JOBS := $(addprefix clean-,${CORE_TAGS})

all: ${CHECK_JOBS} ${JOBS}
check: ${CHECK_JOBS}
clean: ${CLEAN_JOBS}
.PHONY: all check clean ${JOBS} ${CHECK_JOBS} ${CLEAN_JOBS}

${JOBS}: core-%: Dockerfile
	docker build \
	  --build-arg CORE_TAG=$* \
	  --tag dwolla/jenkins-agent-nvm:$*-SNAPSHOT \
	  .

${CHECK_JOBS}: check-%:
	grep --silent "^          - $*$$" .github/workflows/ci.yml

${CLEAN_JOBS}: clean-%:
	docker rmi dwolla/jenkins-agent-nvm:$*-SNAPSHOT
