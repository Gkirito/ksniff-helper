FROM alpine

RUN apk add --no-cache jq docker-cli
ENV CRICTL_VERSION=1.28.0
ARG TARGETPLATFORM
RUN case ${TARGETPLATFORM} in \
    linux/amd64) ARCH=amd64;; \
    linux/arm64) ARCH=arm;; \
    esac && \
    wget https://github.com/kubernetes-sigs/cri-tools/releases/download/v${CRICTL_VERSION}/crictl-v${CRICTL_VERSION}-linux-${ARCH}.tar.gz && \
    tar xzf crictl-v${CRICTL_VERSION}-linux-${ARCH}.tar.gz && \
    mv crictl /usr/bin && \
    rm crictl-v${CRICTL_VERSION}-linux-${ARCH}.tar.gz
