FROM kdelfour/supervisor-docker
# Based on https://github.com/kdelfour/cloud9-docker
MAINTAINER Hans Donner <hans.donner@pobox.com>

RUN apt-get update && \
    apt-get install -y build-essential g++ curl libssl-dev apache2-utils git libxml2-dev && \
    curl -sL https://deb.nodesource.com/setup | bash - && \
    apt-get install -y nodejs && \
    git clone https://github.com/c9/core.git /cloud9 && \
    cd /cloud9 && scripts/install-sdk.sh && \
    mkdir /workspace && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD conf/cloud9.conf /etc/supervisor/conf.d/

VOLUME /workspace
EXPOSE 8181

CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]
