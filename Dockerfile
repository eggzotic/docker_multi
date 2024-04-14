# syntax=docker/dockerfile:1

FROM almalinux:latest as base

# script that runs to demonstrate the running arch
RUN echo -e '#!/bin/sh\n\
rm -f /tmp/done\n\
echo Hello world\n\n\
echo Linux kernel: $(uname -r)\n\
echo CPU arch: $(uname -m)\n\n\
echo Core count: $(cat /proc/cpuinfo | grep processor | wc -l)\n\n\
echo To exit this container, run: docker exec container_id touch /tmp/done\n\
while true\n\
do\n\
 [ -f /tmp/done ] && exit 0\n\
 sleep 5\n\
done\n'\
> /bin/hello.sh
RUN chmod +x /bin/hello.sh

# What the container should run when it is started.
ENTRYPOINT [ "/bin/hello.sh" ]
