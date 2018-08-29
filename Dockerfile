FROM ubuntu:18.04
MAINTAINER Luca Deri <deri@ntop.org>

RUN apt-get update
RUN apt-get -y -q install wget
RUN wget http://apt-stable.ntop.org/18.04/all/apt-ntop-stable.deb
RUN dpkg -i apt-ntop-stable.deb
RUN rm -rf apt-ntop-stable.deb

RUN apt-get update
RUN apt-get -y -q install ntopng redis-server libpcap0.8 libmysqlclient18

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 3000

RUN echo '#!/bin/bash\n/etc/init.d/redis-server start\nntopng "$@"' > /tmp/run.sh
RUN chmod +x /tmp/run.sh

ENTRYPOINT ["/tmp/run.sh"]
