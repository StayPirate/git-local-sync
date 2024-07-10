FROM alpine

RUN addgroup app && adduser -D -G app -h /home/app app

RUN apk add --no-cache  git \
                        bash \
                        openssh \
                        procps \
                        sudo && \
    mkdir -p /repo && \
    chown app:app /repo

RUN	echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config && \
    echo "IdentityFile /key" >> etc/ssh/ssh_config && \
    echo "BatchMode yes" >> etc/ssh/ssh_config

COPY --chmod=755 git-local-sync /usr/bin
COPY --chmod=755 init.sh /

ENTRYPOINT ["/init.sh"]