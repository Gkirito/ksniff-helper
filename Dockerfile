FROM alpine

RUN apk add --no-cache jq
ENV CRICTL_VERSION=1.28.0
RUN case $(uname -m) in \
    x86_64) ARCH=amd64;; \
    aarch64) ARCH=arm;; \
    esac && \
    wget https://github.com/kubernetes-sigs/cri-tools/releases/download/v${CRICTL_VERSION}/crictl-v${CRICTL_VERSION}-linux-${ARCH}.tar.gz && \
    tar xzf crictl-v${CRICTL_VERSION}-linux-amd64.tar.gz && \
    mv crictl /usr/bin && \
    rm crictl-v${CRICTL_VERSION}-linux-${ARCH}.tar.gz
